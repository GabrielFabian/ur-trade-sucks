import { SNSEvent, EventBridgeEvent, Handler } from 'aws-lambda';

export const fooHandler: Handler<SNSEvent | EventBridgeEvent<any, any>> = (event) => {
    if ('Records' in event ) {
        const records = event.Records;
    } else {
        const { id, version, region, source } = event;
    }
};