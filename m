Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFF22AD2E9
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 10:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgKJJ4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 04:56:12 -0500
Received: from mail-eopbgr70080.outbound.protection.outlook.com ([40.107.7.80]:62448
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726219AbgKJJ4M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 04:56:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cS7Re233CTVBG3NTDiy3olYvpI2u8A6HBwUB8g4EV7Z5pj0FjTE/eljfpJgKETrHaw1f6ZCPZgDCKQcOQhq/6gDBcf1NToly4vXKu4SsKudSDsZVuQKIFWC9750462HYdAjVeGm+do8v3+xs17jx3uUWc9zHp7nMbBL1/iBwz9/wq/+bf8Yu8MBNfzGUG9SF2yL8cwo/W54NjtlKffh0VTAGk0NpOiGT9ggRDgygvQHZT88DTdQYKXFbGUhHilcafUaN5YdTBjG6684R899AEBf+v34zw6JHO3UpAo12seG/73BEhzY5tBwdMOHgW7EPHt02ZNthphxrVAZIyNzeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dNtds7pKwUAgo57F/Mli/YzmvRkTMV0O+fiZkT+bZs=;
 b=O1rQE9/6WglRy20cMC0eUGReQMnBkN7UnfKh8lZAd6YXKRtvF5DqxnNLCZRahEHTqvCboR3FzgJF4hrl/UAv2ucwGdISFFkO6K5nOLI7ikiaAAfLj6r4//Es/M/AE2obBd82Ila7+p+uF8bGZq5hNtipzBDWtbOdk0Ij4brVXlkxM0+6qHgBE8AlZdsPDZvl9fqSA5FJLGKN3y+a4ugIOXp4A3ReDpmobFPN/PqijQiKzMnesWSJ1vY0RAVKnAGxPcO0PdiOs/17sgenoeVG+3gF8YoLjOXiaZiuQhDA16shgS4717LN6Pr/qgQ4XAmPnA4TB0ZG3jZLIIkdtfjzMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dNtds7pKwUAgo57F/Mli/YzmvRkTMV0O+fiZkT+bZs=;
 b=IB58Xz66H7lrxe36AiJqyur307a6mm5w3VphGA23Fjr3ioIYj9iCw/5qqnyvgMjdLV+8s7t+hsB1ObjgER0Tz339UMB+hKL+eP1mnOgm+b8IPHG4JN2KP1iFlkzGiZ818pSWl8XhRxmjZB94RCAcYtRnpxedBTAoFMC8QrCSJ8A=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=wolfvision.net;
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com (2603:10a6:803:e5::10)
 by VE1PR08MB4896.eurprd08.prod.outlook.com (2603:10a6:802:b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Tue, 10 Nov
 2020 09:56:06 +0000
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30]) by VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30%4]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 09:56:06 +0000
From:   =?UTF-8?Q?Thomas_H=c3=a4mmerle?= <thomas.haemmerle@wolfvision.net>
Subject: Re: [PATCH v2] usb: gadget: uvc: fix multiple opens
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org
References: <20201105103758.GA4033354@kroah.com>
 <20201110082504.26134-1-thomas.haemmerle@wolfvision.net>
 <X6pSExWwSoHeSldW@kroah.com>
Message-ID: <fd65deff-5e00-dcce-4329-e0524565ab29@wolfvision.net>
Date:   Tue, 10 Nov 2020 10:56:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <X6pSExWwSoHeSldW@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [91.118.163.37]
X-ClientProxiedBy: VI1PR04CA0122.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::20) To VI1PR08MB4064.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.10.12.11] (91.118.163.37) by VI1PR04CA0122.eurprd04.prod.outlook.com (2603:10a6:803:f0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 09:56:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dece76f-bed6-4e63-b337-08d8855ed7a4
X-MS-TrafficTypeDiagnostic: VE1PR08MB4896:
X-Microsoft-Antispam-PRVS: <VE1PR08MB48969CCD15755C607E5494F0EDE90@VE1PR08MB4896.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gRcPFv5bW2Z/IYBOEVFg4dXRKpbKqGT0/GRQleLMCtFeiytWad9a5nv2RrAwZUP3Rgz2j60NBSkxIRI8oVmxaHEjmSX79pxKlQ4x6iL36NPNyBSOBNKqRiE5ccegc2jqZ7YplTkVeKLuv/Hf5jDE+6Ma71m4TKExzjQdxJkzYqpZ3HcMXjjg7H7663qUnZc0xBnCEdb54MXJ7mFk6u9QqMmCBc2ucqTsuefcoVRp8x6SJdYwnpLtMTllCLxc/DkxAviHrv8KwG760nVycdZ3AJesFzJmKElGFj33VN6lWJeyIcc+pIUPdfsQfFIOq/qhOMt6DIJBNz9NUKqu2ROb1pWi79BH/S4b5eNPwjmzJNzDv/lea0celNwXIfJ/igPQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4064.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(396003)(346002)(366004)(376002)(16576012)(478600001)(26005)(6916009)(316002)(6486002)(31696002)(53546011)(83380400001)(86362001)(5660300002)(4326008)(52116002)(31686004)(8676002)(66476007)(16526019)(2616005)(956004)(36756003)(186003)(66946007)(8936002)(66556008)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: aJmZgCMbaNA19LmrXhAuC8mPa6IY4Wkkz7wONCJAMCldpMHn96g9PUx55Vbch9WCgZrGx2zbKcTI1FtFdrCZikeUYa+L6hdPHtFpkQjNYGwCr3PLBXHQyAh5kl0lIfWS6JdP7FSN+8oqE6jakN8nQGJu6YmLT7123up7z8NAqeJtqr2rfHESeyobURAz865XnvKofvGiBwzIr2okJqPi6iVQzORnWA0nsY6txzJknpGsIk/wBOKPfkZxeZ1+8V5U6eEwSla/tud8MdGauSjktMh7PfD6z0G4ocTBqemP3MKg7KiIuW2wYk8jD1WmK/KrmK3If8DDLbB50SONRrcVsw3zg9ai5FAp3rzgaixKmW1f4F0jwpRXKi2fPXEavZMbmWI1tzLRTGawOtnI0aQ+PCZwcuSJpCJJvoacTCszq/WKotNrF0TzwogHONtOi90mKdvG0oaRHbMve0uxOqpfTJHW3ZV2z2TbvQkVcoTEA6k2105NBYxVkMWV/Ld7o4BTZ+V5o0kopT7DUdBskMhNdaCNqNgkxHtbn/EfYZBxoEbqP5NufqmvgiZ3dJftsI+mYSN30lu4fAkjUDvF6pSoc4VEzBUiw8DUkdCqjmDif/T1gsliA5Z3Vr2uGG9ZVXbiQGx0AEbfm2T3tW8Uj7p9G7B+zvkc2SBJqOHsBdMGXer1sTJeZApUtmM09DLjaEtsyLlHiBaP5lK8YYDV/NLH6NHhMBXc2xAxq6bwwtVaxXowNVwyMldXnEWEzdAln9h+dfPpQaF4PnhzRO8Y2BlF9KR5GO+9FcZsXfsm7GrkGtBPwSpBf7+EgTJ1rgefa+5Ww7TCYSq4pwEZEkyn+JIXgWiiobinPF46zKAeE7SYeNCIZxXveCRggrxqGiiPpF837YHh1tIqzFFaNKOJsQfoeA==
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dece76f-bed6-4e63-b337-08d8855ed7a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4064.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 09:56:06.5929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7ZGy6CPv+ERWGPTKHTXyo66/Sj7esPQ0kaoFRo7KnWPv0A2HdgorS78dfw9ZPoulA961wRR/Fyu04Y27N2bOrFRZWnWP82r+aZF5fbMrH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4896
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10.11.20 09:40, Greg KH wrote:
> On Tue, Nov 10, 2020 at 09:25:04AM +0100, thomas.haemmerle@wolfvision.net wrote:
>> From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
>>
>> Currently, the UVC function is activated when open on the corresponding
>> v4l2 device is called.
>> On another open the activation of the function fails since the
>> deactivation counter in `usb_function_activate` equals 0. However the
>> error is not returned to userspace since the open of the v4l2 device is
>> successful.
>>
>> On a close the function is deactivated (since deactivation counter still
>> equals 0) and the video is disabled in `uvc_v4l2_release`, although
>> another process potentially is streaming.
>>
>> Move activation of UVC function to subscription on UVC_EVENT_SETUP and
>> keep track of the number of subscribers (limited to 1) because there we
>> can guarantee for a userspace program utilizing UVC.
>> Extend the `struct uvc_file_handle` with member `bool connected` to tag
>> it for a deactivation of the function.
>>
>> With this a process is able to check capabilities of the v4l2 device
>> without deactivating the function for another process actually using the
>> device for UVC streaming.
>>
>> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
>> ---
>> v2:
>>   - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
>>     locked in v4l2-core) introduced in v1
>>   - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
>>     connected
>>
>>   drivers/usb/gadget/function/uvc.h      |  2 +
>>   drivers/usb/gadget/function/uvc_v4l2.c | 56 +++++++++++++++++++++-----
>>   2 files changed, 48 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
>> index 73da4f9a8d4c..0d0bcbffc8fd 100644
>> --- a/drivers/usb/gadget/function/uvc.h
>> +++ b/drivers/usb/gadget/function/uvc.h
>> @@ -117,6 +117,7 @@ struct uvc_device {
>>   	enum uvc_state state;
>>   	struct usb_function func;
>>   	struct uvc_video video;
>> +	unsigned int connections;
>>   
>>   	/* Descriptors */
>>   	struct {
>> @@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
>>   struct uvc_file_handle {
>>   	struct v4l2_fh vfh;
>>   	struct uvc_video *device;
>> +	bool connected;
> 
> What protects these two fields you are adding?

The mutex in `struct uvc_video`.  The lock in video_device is set to it 
in `uvc_register_video()` in f_uvc.c.

> 
>>   };
>>   
>>   #define to_uvc_file_handle(handle) \
>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
>> index 67922b1355e6..aee4888e17b1 100644
>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> @@ -228,17 +228,57 @@ static int
>>   uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
>>   			 const struct v4l2_event_subscription *sub)
>>   {
>> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
>> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
>> +	int ret;
>> +
>>   	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
>>   		return -EINVAL;
>>   
>> -	return v4l2_event_subscribe(fh, sub, 2, NULL);
>> +	if ((sub->type == UVC_EVENT_SETUP) && (uvc->connections >= 1))
>> +		return -EBUSY;
> 
> Are you sure you can't handle more than one connection?
> 
> If so, why is it an integer and not just a boolean?

It is possible to handle more than one subscription but I can't think of 
a scenario where this would make sense.
For the reason that it is basically possible I decided for integer.

> 
> And what prevents the value from changing right after you test it here?
> 

The ioctl here are serialized, because the mutex pointer in the video 
device is set.

>> +
>> +	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (sub->type == UVC_EVENT_SETUP) {
>> +		uvc->connections++;
>> +		handle->connected = true;
>> +		uvc_function_connect(uvc);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void uvc_v4l2_disable(struct uvc_device *uvc)
>> +{
>> +	if (--uvc->connections)
>> +		return;
>> +
> 
> What prevents "connections" from changing right after testing it here?

The function is either called from ioctl `uvc_v4l2_unsubscribe_event()` 
or from `uvc_v4l2_release()`. In both cases the video mutex is locked.

Thomas
