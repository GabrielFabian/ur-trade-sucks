import { SNSEvent, EventBridgeEvent, Handler } from 'aws-lambda';

export const fooHandler: Handler<SNSEvent | EventBridgeEvent<any, any>> = (event) => {
    if ('Records' in event ) {
        // SNSEvent
        const records = event.Records;
        // so something
    } else {
        const { id, version, region, source } = event;
    }
};