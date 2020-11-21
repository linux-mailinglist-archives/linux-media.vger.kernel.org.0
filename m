Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8562BBF11
	for <lists+linux-media@lfdr.de>; Sat, 21 Nov 2020 13:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgKUMvE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Nov 2020 07:51:04 -0500
Received: from mail-am6eur05on2051.outbound.protection.outlook.com ([40.107.22.51]:35809
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727698AbgKUMvD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Nov 2020 07:51:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cec0qZKBxEF4HMpmT4BJ8xt31ge4SPlNVb1wbRufX997CzIHiYdnNZoUqvU4KMrJaljGcAHgQahYo44Wb4QtAGeL4+5WzrBZ+LRLBPG6IL39TwhyMfUK/gHtb3b2P4ox7k8mKiVPz2TgH5A9vnylg9LxLDSldPOEuSjo2rLrXK0vtWFveL+ac20/mglzes7+WFpKIz9j40yUD/rzgY00PQbrMlDbDziLu1ohPAXtdoz25KzzDiUaL3vByPdolv6j2mvB9L53Qzb7NiH3W9/x1tHPktfH7MdasqAPgerpTnH8OP8N1o8mm76adH/+Kul2e5Q2XnU7Iah+ffiWfmoiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdsuKC2eNTT1i89orLafBQKCUjZIFC8I5pZxMCCMUqQ=;
 b=GN5/uhYHQ8zgm1DwEfIOIkXXZDkHmt8EP2XImTyPRRVss9SJvx04ibCayQMMbIxT1QFmJNkOuciKcDNluh7uTCUH6lDlx67m9YbU7hhfACdeelLxGX3Z342MSAByGVkCGGWTG52+1ccZQHsOmf6++bsWYiZTJqLxsiOPnwju0lVLedgFqaUKAjgW5XeD5yGQsDTLBiWN5d//ujG8KqE2R2XlxbMafcLYSqL46ld+Glh8xTd9aJ+nl2UbFu46RWmyokAddJB2dZ8N1l2P9ZzNzMONCMZZW+RCe/0ZIn0FOHUGw9e8SQEcXWbrEx/2jNlsMzLtcSnqYxylMg5CsAuq7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdsuKC2eNTT1i89orLafBQKCUjZIFC8I5pZxMCCMUqQ=;
 b=vqFovvFxQqG9idGRTqL3D6sPmfe2ztKAcge1JQwplW8tinnT1pYqV1T2/uEoqF2G8AITk4G879Ej5uhKqBt7Jwb+YnQ5GqEy8581MpseHTU9S8dViWkuyAlBSicNxfHKxgAxnwlhLiSj9M4JUIKAz8QyhiXhlTiLSwtyGzXVTRE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=wolfvision.net;
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com (2603:10a6:803:e5::10)
 by VI1PR08MB3951.eurprd08.prod.outlook.com (2603:10a6:803:e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Sat, 21 Nov
 2020 12:50:56 +0000
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30]) by VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30%4]) with mapi id 15.20.3589.020; Sat, 21 Nov 2020
 12:50:56 +0000
Subject: Re: [PATCH v3] usb: gadget: uvc: fix multiple opens
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     gregkh@linuxfoundation.org, balbi@kernel.org, hverkuil@xs4all.nl,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org
References: <X6pmMFYmzO088p4g@kroah.com>
 <20201110143015.15134-1-thomas.haemmerle@wolfvision.net>
 <20201116154858.GP6540@pendragon.ideasonboard.com>
From:   =?UTF-8?Q?Thomas_H=c3=a4mmerle?= <thomas.haemmerle@wolfvision.net>
Message-ID: <2920c6ea-d191-a6cb-ec90-dda22bb9df55@wolfvision.net>
Date:   Sat, 21 Nov 2020 13:50:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201116154858.GP6540@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2a02:8389:41c3:3c80:cc5:bc4:a811:aeed]
X-ClientProxiedBy: VI1P18901CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::30) To VI1PR08MB4064.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8389:41c3:3c80:cc5:bc4:a811:aeed] (2a02:8389:41c3:3c80:cc5:bc4:a811:aeed) by VI1P18901CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:801::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Sat, 21 Nov 2020 12:50:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc529d37-f318-4b3e-27c1-08d88e1c16c6
X-MS-TrafficTypeDiagnostic: VI1PR08MB3951:
X-Microsoft-Antispam-PRVS: <VI1PR08MB395159E4C070AC649F7CB27AEDFE0@VI1PR08MB3951.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4H/i6Unz92e5gkOnUF13YegTr3D7tPg9+eT3VShN85tO5CSgd9yu+bfE42ztJByDwDsSrcoO+9NCibEvBtlAVzvOiaoFBpR/kMQCag8wIUHk28lQrQ3e7wvnLcyFrVL4k2dEf4G6PV28bEeuSrJSYgi63H2zfahEs1vsfJFJKSs/wuAKvunHpLVP63YDDE9wBkv5vXgmvGwjlViM4ee2uRd/GZjDcDDB6E3cTgcPsAZfxk3XDKX+dvY4iRvuR3yQ7WRd3STw4/Q8EuQVEjVUvvncI4TxZd2/bArypW1Iab556wnQDm9XRCZoNNgeedrvfUskyw5VAKRCrF8Mr3sMiR4M4nPARySg1SzW0zvem0o3S8871HOHn8MMUOewLvRh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4064.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39830400003)(136003)(86362001)(5660300002)(8676002)(4326008)(6916009)(6486002)(66556008)(478600001)(66946007)(8936002)(66476007)(316002)(2616005)(2906002)(52116002)(36756003)(31686004)(16526019)(83380400001)(31696002)(53546011)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2FIVWcrRDZTVVdaUlIxQ0pJU2lPNTZSVlVnVG1kblYybXNmMnNDK0FPeTQ2?=
 =?utf-8?B?OUMxQ21KNEQ0ZzRlUlJYTTJIN2dHZ3QvVmRhUEx3MlpzUXlWYmxuZDFoS1N4?=
 =?utf-8?B?OWNQWW5VdVF1QmRlY2hNaGVtYTNaY1ZtaElocWlTanp0U1lpNW90ODRJZTdp?=
 =?utf-8?B?TU84UWVWQmx1a3haaVdCUmlNSjVueTQ2enpFYTY4a1IvV241SEFyMTc5b1Zz?=
 =?utf-8?B?cWhPWDRKWS9GZ21DeEc4UFNWQVZnNXpJbGZ6QjN3Q1VZaCtFbStPaGxBK3BR?=
 =?utf-8?B?cllOeklrTHJmeXowWFpwU3F4M1VCNTVGcktxVnN6Tnpja1RIdmM0b1NiODZD?=
 =?utf-8?B?OFFCK0YyWHQxdWtFYmtnOEpVVlEvWkVscENlN1pVSHhQc21vUmhhdmh3Q3NV?=
 =?utf-8?B?QkxlSnVUMW1wWGV0c3RKQUliU1VqMUxvZHNJTHc0QkhEMHIzL3lDbkNuRU5U?=
 =?utf-8?B?bWNLMGxaWm1HTUFuK3E0MTVUSnZIdmNxRTdObHNXaWFSalAzcWhLZzU1TVNp?=
 =?utf-8?B?WDRCVElvMUR2UjY5U2VxSFVHNnpzS09odGRsazdRbFZkcW1zbkM4eW4zQUZw?=
 =?utf-8?B?ZU9jUjRRWE1pSzVCcmtxZWI0TFlFeUtxdXJ1K1FWbmIxQWdYeG5uUCs0ZHZp?=
 =?utf-8?B?dFRwYXhLTTJNU1BiWmpGejA5OEF5bnJ6MTRlUXM1VExCZnNqbWViTnpYS1FI?=
 =?utf-8?B?VktjVUlUdFozbXMzSXlyOWRwTUtHMWl2RkpidlhmbzlEZGludEQrZVpBR0pm?=
 =?utf-8?B?VFVnY25FQ0JZQVRmdUxwS1Z4SWdzSGV4ME95RUdYWlkxMXNvYklwd3AxSklO?=
 =?utf-8?B?aHJPSEdVZmZpZjU3bXZpdktUa1FlVjFwWWZ3RWZlQjl6QVo4dUpxVktpRU9X?=
 =?utf-8?B?eEd0RU1tK1A1bVFQMk5rTmxsRldlYWluS0IraDlKd3NUQVJlRWEySmFWSjBM?=
 =?utf-8?B?bmsraUJSUXVSVHNqS09rM2dzay9lV1VJVmVvbkZJRXJrR0RHdnRqQnVjbFpP?=
 =?utf-8?B?WmIvZVZ5djNuYXlRclFIN3FJR1hlWExLU2o3Rit2TG1haDlVQjkxZHhzSVJN?=
 =?utf-8?B?MWdOOTlLckNFY2picmNxK0RuMFN6eTU2dTJWUXFURzZaTDM3d3I3RFRZcnpq?=
 =?utf-8?B?cFZCUEUrcEw0dFQvNXNlU29oU1NYVjZwY01Fd3lCWVlZNENkQk52eUhucStQ?=
 =?utf-8?B?REdtTkNnYlJkd0JJNExib29uWVBSdFJWaE01YnlQWjd6RlBITTB2ZndDdUYx?=
 =?utf-8?B?aHRSMGhMRkFjTGZDQ0xhbFh4TzA0cUgrOTc2RDZJV25nWkJZZz09?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fc529d37-f318-4b3e-27c1-08d88e1c16c6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4064.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 12:50:56.6707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjKJ3Hg4S62qf7qVxLgl8WWgX1z6umjdn1svKt7bv66Lfe15zvXX+hxHoKfVKUJRzrhipuQJg6BvlAH05lc8m+6Hjl+zb0nFdxD4qixeoIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3951
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

sorry for my late response!

On 16.11.20 16:48, Laurent Pinchart wrote:
> Hi Thomas,
> 
> Thank you for the patch, and sorry for the late review. I was mostly
> absent last week.
> 
> On Tue, Nov 10, 2020 at 03:30:15PM +0100, thomas.haemmerle@wolfvision.net wrote:
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
>> equals 0) and the video is disabled in `uvc_v4l2_release`, although the
>> UVC application potentially is streaming.
>>
>> Move activation of UVC function to subscription on UVC_EVENT_SETUP
>> because there we can guarantee for a userspace application utilizing UVC.
>> Block subscription on UVC_EVENT_SETUP while another application already
>> is subscribed to it, indicated by `bool func_connected` in
>> `struct uvc_device`.
>> Extend the `struct uvc_file_handle` with member `bool is_uvc_app_handle`
>> to tag it as the handle used by the userspace UVC application.
>>
>> With this a process is able to check capabilities of the v4l2 device
>> without deactivating the function for the actual UVC application.
>>
>> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
>> ---
>> v3:
>>   - replace `unsigned int connections` with `bool func_connected`
>>   - rename `bool connected` to `bool is_uvc_app_handle`
>>
>> v2:
>>   - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
>>     locked in v4l2-core) introduced in v1
>>   - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
>>     connected
>>
>>   drivers/usb/gadget/function/uvc.h      |  2 +
>>   drivers/usb/gadget/function/uvc_v4l2.c | 54 +++++++++++++++++++++-----
>>   2 files changed, 46 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
>> index 73da4f9a8d4c..d6d0fd2dffa0 100644
>> --- a/drivers/usb/gadget/function/uvc.h
>> +++ b/drivers/usb/gadget/function/uvc.h
>> @@ -117,6 +117,7 @@ struct uvc_device {
>>   	enum uvc_state state;
>>   	struct usb_function func;
>>   	struct uvc_video video;
>> +	bool func_connected;
>>   
>>   	/* Descriptors */
>>   	struct {
>> @@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
>>   struct uvc_file_handle {
>>   	struct v4l2_fh vfh;
>>   	struct uvc_video *device;
>> +	bool is_uvc_app_handle;
>>   };
>>   
>>   #define to_uvc_file_handle(handle) \
>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
>> index 67922b1355e6..3c0b7a969107 100644
>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> @@ -228,17 +228,55 @@ static int
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
>> +	if ((sub->type == UVC_EVENT_SETUP) && uvc->func_connected)
> 
> No need for the inner parentheses.

I will change this.

> 
>> +		return -EBUSY;
>> +
>> +	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (sub->type == UVC_EVENT_SETUP) {
>> +		uvc->func_connected = true;
>> +		handle->is_uvc_app_handle = true;
>> +		uvc_function_connect(uvc);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void uvc_v4l2_disable(struct uvc_device *uvc)
>> +{
>> +	uvc->func_connected = false;
>> +	uvc_function_disconnect(uvc);
>> +	uvcg_video_enable(&uvc->video, 0);
>> +	uvcg_free_buffers(&uvc->video.queue);
>>   }
>>   
>>   static int
>>   uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
>>   			   const struct v4l2_event_subscription *sub)
>>   {
>> -	return v4l2_event_unsubscribe(fh, sub);
>> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
>> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
>> +	int ret;
>> +
>> +	ret = v4l2_event_unsubscribe(fh, sub);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if ((sub->type == UVC_EVENT_SETUP) && handle->is_uvc_app_handle) {
> 
> No need for the inner parentheses.

I will change this.

> 
>> +		uvc_v4l2_disable(uvc);
>> +		handle->is_uvc_app_handle = false;
> 
> Calling uvc_v4l2_disable() here means that we'll stop everything when
> unsubscribing from the event, which sounds like it could cause issues as
> that behaviour is not expected. Wouldn't it be enough to only handle
> this in uvc_v4l2_release() ?
> 

Of course it would be enough. But maybe a UVC gadget application wants 
to release the device for another application without closing it and 
since the function is activated on subscription the logical consequence 
is to deactivate it on unsubscription.

>> +	}
>> +
>> +	return 0;
>>   }
>>   
>>   static long
>> @@ -293,7 +331,6 @@ uvc_v4l2_open(struct file *file)
>>   	handle->device = &uvc->video;
>>   	file->private_data = &handle->vfh;
>>   
>> -	uvc_function_connect(uvc);
>>   	return 0;
>>   }
>>   
>> @@ -303,14 +340,11 @@ uvc_v4l2_release(struct file *file)
>>   	struct video_device *vdev = video_devdata(file);
>>   	struct uvc_device *uvc = video_get_drvdata(vdev);
>>   	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
>> -	struct uvc_video *video = handle->device;
>> -
>> -	uvc_function_disconnect(uvc);
>>   
>> -	mutex_lock(&video->mutex);
>> -	uvcg_video_enable(video, 0);
>> -	uvcg_free_buffers(&video->queue);
>> -	mutex_unlock(&video->mutex);
>> +	mutex_lock(&uvc->video.mutex);
> 
> Could you please keep keep the local video variable, and use
> &video->mutex here ? The driver has a single video device at the moment,
> but could be extended in the future with support for multiple video
> devices in a single UVC device (lots of changes would be needed though).

Yes.

> 
>> +	if (handle->is_uvc_app_handle)
>> +		uvc_v4l2_disable(uvc);
>> +	mutex_unlock(&uvc->video.mutex);
> 
> Note that this lock isn't the same as the lock taken by
> __video_do_ioctl(), which alls uvc_v4l2_subscribe_event() and
> uvc_v4l2_unsubscribe_event(). I think Hans got confused in his review,
> it appears that there's nothing protecting concurrent access to
> is_uvc_app_handle and func_connected in v3. I think you need to take the
> driver-specific lock in uvc_v4l2_subscribe_event() and
> uvc_v4l2_unsubscribe_event().

Why isn't this the same lock taken by __video_do_ioctl()?
The lock in video_device is set to it in `uvc_register_video()` in f_uvc.c:
uvc->vdev.lock = &uvc->video.mutex;

So this should be the same, right?

Regards
Thomas
