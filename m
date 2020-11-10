Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179962ADACC
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 16:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730666AbgKJPuK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 10:50:10 -0500
Received: from mail-am6eur05on2069.outbound.protection.outlook.com ([40.107.22.69]:17473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730231AbgKJPuK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 10:50:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyucvJiw+18aUegEfAG9GMBu0dska9YXi3Ucce96EP3yeb7Vc10kQwLiV1jcDvUHqVlUojndDzrnJi7zPconhA7nbMQV6dItjhNxK4vSwKQVWUWKOiKNTzG7ImRjsR6OhVdFWQjKpGCgswotiUhVwGd5PG3aw96kyOsaqtJuN7A4AZxqkx7FadZElQQ/cIHJjjJXBcpzUt6AoF6J8aee+a+OrCGtdlB65UIYtZy8s80i9wSl5bph3rCHfJK4nEvSXctHcAk1/dW7+hniba2/B2h80Wq+vLjdMtL47Bscrqh1C0T5JLvjaZ5jvqWYyYmbyxADj3Q/LkqAQgNqOpeysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nDHK9g1A1PodyYiMANkPFsCOE3zym338ALzWUNGs8U=;
 b=Yhd8cLaL7Fatk6sQaC1Nt9pUPM9Eboj/QhI/KCIN3MCM2DXLfLFw/YG8X8zMsCVMl5jJCCxAkeoZQzSdvqQNywLD27wmwyYvm/zpN5IBKc+oT2WjtrmPrm4cceJtJRhk8a78P547DjmVeOM5otCuzq1OKwcSYkTiQ6ghBDoXdV2YWw59HNK9gCMQE+5S9uUKwR6ahDDeYpIdX3VEgZmVFF0w3Y5Mlp/6Ot6tQyVA/Xd4jxPwDOwQkTKn7nH863AjI6+FDDYdOE6Lc/xUP4pQ3GIA4rZ1UTLD1cMstJAVdy/u/NxmmLKzcC0RMwsTSF3wRZLXcRmsi5SU7vqO2C6eBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nDHK9g1A1PodyYiMANkPFsCOE3zym338ALzWUNGs8U=;
 b=Y1DrAXmDHyat5MsXtTb6qYjrtublrKvaz17f27Rzmty/RT8q25DvAr2uJlfE3Y6R3yWyRIk+PHGcCsD1GKlhiL2X5Z0MrpSAAzlpY+U6g1rhxUCKsOKOBYSDAyrohjfEvvB4zk0VPZzw7Pe7Hp1qEGCsdG1zGoC/ETkmQ+S7wYY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=wolfvision.net;
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com (2603:10a6:803:e5::10)
 by VI1PR08MB5439.eurprd08.prod.outlook.com (2603:10a6:803:13b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Tue, 10 Nov
 2020 15:50:03 +0000
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30]) by VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30%4]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 15:50:03 +0000
Subject: Re: [PATCH v2] usb: gadget: uvc: fix multiple opens
To:     Hans Verkuil <hverkuil@xs4all.nl>, gregkh@linuxfoundation.org
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org
References: <20201105103758.GA4033354@kroah.com>
 <20201110082504.26134-1-thomas.haemmerle@wolfvision.net>
 <2bf6f3b3-6475-9cd9-b6f9-dfc4b444c955@xs4all.nl>
 <03c81d2f-24c3-0c15-3a8a-506ea955bf67@wolfvision.net>
 <7410ad3c-eaf9-9722-e269-d737b85ab696@xs4all.nl>
 <068a44bf-a5ec-cedb-bd7f-3caecf5ed58a@wolfvision.net>
 <bddb719c-5ca2-6da8-6741-2e02945f3a8c@xs4all.nl>
From:   =?UTF-8?Q?Thomas_H=c3=a4mmerle?= <thomas.haemmerle@wolfvision.net>
Message-ID: <3a1ddd46-6472-e5af-7765-223d78f2e3e3@wolfvision.net>
Date:   Tue, 10 Nov 2020 16:50:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <bddb719c-5ca2-6da8-6741-2e02945f3a8c@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [91.118.163.37]
X-ClientProxiedBy: VI1PR06CA0175.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::32) To VI1PR08MB4064.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.10.12.11] (91.118.163.37) by VI1PR06CA0175.eurprd06.prod.outlook.com (2603:10a6:803:c8::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 15:50:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e3385a4-4847-4454-cd4e-08d8859049e2
X-MS-TrafficTypeDiagnostic: VI1PR08MB5439:
X-Microsoft-Antispam-PRVS: <VI1PR08MB5439F18CC908A72223C43AF1EDE90@VI1PR08MB5439.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQl842QTuZhMDg4xnPe7rOj64gAQ31XIPGlKfHIiS0sPJzC8lHiP+/l7aDtkTlk0SEBMMva9JdfR4qkYz4aIfbEPKsb3C65S/oDJR/cbL+92MKxDCEr1KmV4hqCiyw4+Xzn63lYe6YCO1wxkkSGS/bpBsaU+nJunIKvng/svnackmluszhrSY5SrjwcPvEjnoyyhTGHtQDxzHGdhO+4D/2zFJk6OIhy2y8qvHjki+9m4WR1kodJWSwO1jdTS88k6GkxbU4CYCcfe31SIVi12DPt+czXRtGJpuM6fruxfxpgS1XmVnahgy9Il/d2c1mUZpw2Ge9eM45Osei1XH33p8KitS6wNF7EULIU1HvbBWeAxeQ9Rhw62kE1ppOYDpHUo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4064.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39830400003)(346002)(366004)(396003)(376002)(31686004)(52116002)(86362001)(478600001)(83380400001)(8936002)(31696002)(16576012)(2906002)(5660300002)(6486002)(36756003)(66574015)(316002)(53546011)(26005)(4326008)(956004)(2616005)(66556008)(66476007)(66946007)(8676002)(186003)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: o5dbvkHkt5PoXw6It8aH/NKqCNcftXzTAC26Cry1f88fhxsMpk2HrNpzES/YebrQdg779XcSvqX+85O25wYjktCe8YVvxYRDCbU5N7l8fwCphwQnetYSO8lnktPZEpJ3KLZqvMuvDBXtFMoSPKW6V24XO+ysEs6VRV+2abgT6EcYfsX6pQubuVsssAKqgtn4fCu0dtFCTMjcZQbifUcN40LkHmLccXoyE82kBJFm8EuDlqWHTbMtNI/6ZgDSGg5Fxm+hljsYx2L951fMIW3oObvjOwotxCrvYa8gdKGKilEqyGAbyoyJh70muG0XOoJpWpBKCqSYaOhxMEYV7KGlpPVy4oUJFmLFJ8/c+YYJhxvAOK9sd6JFzp8FqnUQqf+WO9ehzWW74Pdre5Q/r4YHiAPhTDzehVzybFmUoOUZcUFW7vL17Af0Du7NfQBDBq3VRpeMb0sjSF6Dvc4T24FTXBao76HNB5aIdqhtUGJbzxly0UuBZdkB+WhS2W8uO9IJe5rlRigcC7jYnaX5zZnjugCkk3+Y85ciEuH1Egb+OHIQTQcPl+ATcjvbojIFkoPMwn2RG7dH0evO2PS3QliItm+J2M/3XbjXVwypivD0hqIbut1mCBpXAv5lWjWzsVv15GdjbdGJcKGAu+dzeuIxU+U+qGvcWjw/72f8lH7UNZkRZUN/PurlUqKmjHjtZIVuOM0JSNY4MieoUdkg03hCIe7jEJl+V8HWa+LilVQNvx3WWuiiq/N6FFo5OMSDpK6LKjOttfS45FN68NtHkZoD/26X2W9ujY6rYQT4VrOlGnel+sT4cHrkUlpn3ess7J25JhPXOq7fGrw3LYrypWClp3hmEo+eByVPNXpOP8thisFyaKOTW47njC4atOcTeO5+TetkTTPhQNho1lKYA7XCiw==
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3385a4-4847-4454-cd4e-08d8859049e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4064.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 15:50:03.6079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZHHPcq4ZdKzUR0dKTMvxOdfvF5hv//sLSroIRbQyKpwjeKaR0cT/UunG+BeZ2L6HoRNuINK14w4KKNHKU8EYdM8TAyOVmpXhVR5Ro8NnuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5439
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10.11.20 16:36, Hans Verkuil wrote:
> On 10/11/2020 16:10, Thomas Hämmerle wrote:
>> On 10.11.20 15:43, Hans Verkuil wrote:
>>> On 10/11/2020 12:53, Thomas Hämmerle wrote:
>>>> On 10.11.20 11:31, Hans Verkuil wrote:
>>>>> On 10/11/2020 09:25, thomas.haemmerle@wolfvision.net wrote:
>>>>>> From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
>>>>>>
>>>>>> Currently, the UVC function is activated when open on the corresponding
>>>>>> v4l2 device is called.
>>>>>> On another open the activation of the function fails since the
>>>>>> deactivation counter in `usb_function_activate` equals 0. However the
>>>>>> error is not returned to userspace since the open of the v4l2 device is
>>>>>> successful.
>>>>>>
>>>>>> On a close the function is deactivated (since deactivation counter still
>>>>>> equals 0) and the video is disabled in `uvc_v4l2_release`, although
>>>>>> another process potentially is streaming.
>>>>>>
>>>>>> Move activation of UVC function to subscription on UVC_EVENT_SETUP and
>>>>>> keep track of the number of subscribers (limited to 1) because there we
>>>>>> can guarantee for a userspace program utilizing UVC.
>>>>>> Extend the `struct uvc_file_handle` with member `bool connected` to tag
>>>>>> it for a deactivation of the function.
>>>>>>
>>>>>> With this a process is able to check capabilities of the v4l2 device
>>>>>> without deactivating the function for another process actually using the
>>>>>> device for UVC streaming.
>>>>>>
>>>>>> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
>>>>>> ---
>>>>>> v2:
>>>>>>     - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
>>>>>>       locked in v4l2-core) introduced in v1
>>>>>>     - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
>>>>>>       connected
>>>>>>
>>>>>>     drivers/usb/gadget/function/uvc.h      |  2 +
>>>>>>     drivers/usb/gadget/function/uvc_v4l2.c | 56 +++++++++++++++++++++-----
>>>>>>     2 files changed, 48 insertions(+), 10 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
>>>>>> index 73da4f9a8d4c..0d0bcbffc8fd 100644
>>>>>> --- a/drivers/usb/gadget/function/uvc.h
>>>>>> +++ b/drivers/usb/gadget/function/uvc.h
>>>>>> @@ -117,6 +117,7 @@ struct uvc_device {
>>>>>>     	enum uvc_state state;
>>>>>>     	struct usb_function func;
>>>>>>     	struct uvc_video video;
>>>>>> +	unsigned int connections;
>>>>>>     
>>>>>>     	/* Descriptors */
>>>>>>     	struct {
>>>>>> @@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
>>>>>>     struct uvc_file_handle {
>>>>>>     	struct v4l2_fh vfh;
>>>>>>     	struct uvc_video *device;
>>>>>> +	bool connected;
>>>>>>     };
>>>>>>     
>>>>>>     #define to_uvc_file_handle(handle) \
>>>>>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
>>>>>> index 67922b1355e6..aee4888e17b1 100644
>>>>>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>>>>>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>>>>>> @@ -228,17 +228,57 @@ static int
>>>>>>     uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
>>>>>>     			 const struct v4l2_event_subscription *sub)
>>>>>>     {
>>>>>> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
>>>>>> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
>>>>>> +	int ret;
>>>>>> +
>>>>>>     	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
>>>>>>     		return -EINVAL;
>>>>>>     
>>>>>> -	return v4l2_event_subscribe(fh, sub, 2, NULL);
>>>>>> +	if ((sub->type == UVC_EVENT_SETUP) && (uvc->connections >= 1))
>>>>>> +		return -EBUSY;
>>>>>> +
>>>>>> +	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
>>>>>> +	if (ret < 0)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	if (sub->type == UVC_EVENT_SETUP) {
>>>>>> +		uvc->connections++;
>>>>>> +		handle->connected = true;
>>>>>> +		uvc_function_connect(uvc);
>>>>>> +	}
>>>>>
>>>>> This makes no sense. Why would subscribing to a SETUP event
>>>>> mean that you are 'connected'?
>>>>
>>>> Subscribing to a SETUP does not mean that you are connected - on a
>>>> subscription to SETUP we can expect that there is a userspace process,
>>>> utilizing UVC -- which is required for the UVC gadget function -- and
>>>> everything is ready to enable the function by calling uvc_function_connect.
>>>> How about calling it `function_connected`?
>>>
>>> Any application can open the device node and subscribe to this event.
>>> This is not a good place to call uvc_function_connect(), it's an abuse of
>>> the V4L2 API.
>>
>> Of course - any application can subscribe to this event but since the
>> event is defined in g_uvc.h I thought that a subscription is most likely
>> done by a UVC application.
>>
>>>
>>> I dug a bit more into this (I have very little gadget driver experience),
>>> and isn't calling uvc_function_connect() something that should be done
>>> on the first open? And when the last filehandle is closed, then
>>> uvc_function_disconnect() can be called to clean up?
>>
>> Isn't the possibility of the delayed activation of the usb function in
>> composite.c intended to wait for a corresponding userspace application,
>> which is required to make the gadget work?
>>
>> If so, a simple open of the v4l2 device does not mean that the gadget is
>> ready to go: starting pipewire for example results in quering the device
>> capabilities of all devices. But this does not mean that the gadget will
>> work.
>> Therefore I was looking for a place, where we can expect, that the
>> application opened the device will utilize UVC and found that a
>> subscription to a UVC specific event is the right place.
> 
> That's why I suggested to do this when buffers are allocated. That's when
> the application commits resources to actually use the device. Until that
> point everything that an application does is just querying or configuring,
> but not actually using it.

The userspace application implementations (including the one from 
Laurent Pinchart) usually request buffers on the UVC events sent by the 
host. Therefore we would run into chicken-and-egg problem.

> 
> BTW, Laurent Pinchart who maintains this driver is away for a week, so he
> might know more about this when he comes back.

Okay, so I suggest to wait for him.

Thanks for the review so far!

Regards
Thomas

> 
> Regards,
> 
> 	Hans
> 
>>
>> Regards,
>> Thomas
>>
>>>
>>> That would make much more sense. Grep for v4l2_fh_is_singular_file() on how
>>> to do this, quite a few media drivers need this.
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>>
>>>>>
>>>>> It should be possible to open a V4L2 device node any number of times,
>>>>> and any filehandle can subscribe to any event, but typically once
>>>>> userspace allocates buffers (VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS)
>>>>> then that filehandle is marked as the owner of the device and other
>>>>> open filehandles are no longer allowed to allocate buffers or stream video.
>>>>
>>>> Sure - this can be also done if userspace allocates buffers.
>>>> But why does it make more sense to call uvc_function_connect on
>>>> VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS instead of subscribtion to a UVC event?
>>>>
>>>>>
>>>>> See e.g. drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>>> and vb2_ioctl_reqbufs and other vb2_ioctl_* functions.
>>>>>
>>>>> Unfortunately this UVC gadget driver is rather old and is not using
>>>>> these helper functions.
>>>>>
>>>>> Running 'v4l2-compliance' will likely fail on a lot of tests for this
>>>>> driver.
>>>>>
>>>>> This driver probably could use some TLC.
>>>>
>>>> I totally agree with that, however this change fixes at least one test
>>>> of 'v4l2-compliance'.
>>>> Currently a running UVC connection can be corrupted by another process
>>>> which just opens and closes the device.
>>>>
>>>> Thomas
>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> 	Hans
>>>>>
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static void uvc_v4l2_disable(struct uvc_device *uvc)
>>>>>> +{
>>>>>> +	if (--uvc->connections)
>>>>>> +		return;
>>>>>> +
>>>>>> +	uvc_function_disconnect(uvc);
>>>>>> +	uvcg_video_enable(&uvc->video, 0);
>>>>>> +	uvcg_free_buffers(&uvc->video.queue);
>>>>>>     }
>>>>>>     
>>>>>>     static int
>>>>>>     uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
>>>>>>     			   const struct v4l2_event_subscription *sub)
>>>>>>     {
>>>>>> -	return v4l2_event_unsubscribe(fh, sub);
>>>>>> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
>>>>>> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	ret = v4l2_event_unsubscribe(fh, sub);
>>>>>> +	if (ret < 0)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	if ((sub->type == UVC_EVENT_SETUP) && handle->connected) {
>>>>>> +		uvc_v4l2_disable(uvc);
>>>>>> +		handle->connected = false;
>>>>>> +	}
>>>>>> +
>>>>>> +	return 0;
>>>>>>     }
>>>>>>     
>>>>>>     static long
>>>>>> @@ -293,7 +333,6 @@ uvc_v4l2_open(struct file *file)
>>>>>>     	handle->device = &uvc->video;
>>>>>>     	file->private_data = &handle->vfh;
>>>>>>     
>>>>>> -	uvc_function_connect(uvc);
>>>>>>     	return 0;
>>>>>>     }
>>>>>>     
>>>>>> @@ -303,14 +342,11 @@ uvc_v4l2_release(struct file *file)
>>>>>>     	struct video_device *vdev = video_devdata(file);
>>>>>>     	struct uvc_device *uvc = video_get_drvdata(vdev);
>>>>>>     	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
>>>>>> -	struct uvc_video *video = handle->device;
>>>>>> -
>>>>>> -	uvc_function_disconnect(uvc);
>>>>>>     
>>>>>> -	mutex_lock(&video->mutex);
>>>>>> -	uvcg_video_enable(video, 0);
>>>>>> -	uvcg_free_buffers(&video->queue);
>>>>>> -	mutex_unlock(&video->mutex);
>>>>>> +	mutex_lock(&uvc->video.mutex);
>>>>>> +	if (handle->connected)
>>>>>> +		uvc_v4l2_disable(uvc);
>>>>>> +	mutex_unlock(&uvc->video.mutex);
>>>>>>     
>>>>>>     	file->private_data = NULL;
>>>>>>     	v4l2_fh_del(&handle->vfh);
>>>>>>
>>>>>
>>>
> 
