Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B242AD5A6
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 12:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgKJLx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 06:53:56 -0500
Received: from mail-eopbgr00054.outbound.protection.outlook.com ([40.107.0.54]:57091
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726428AbgKJLxz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 06:53:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDLxegdQkyq3zbGkpLtyJdp0WAOGGpVpDNJPnpfNTm6H3VWvtVC+69lHy6bVuBaaHCCsTDBYJcU1uKJbfwydixsLv7t2yR4/bGaSVgUCQT5qMCQ/5XT8WF/LojpySR6YnuprFvFPCyXFHR30HvUv9dOTHspusNzNWhgEIllqPp2HDguzqDbuPsi1AN2Rzm65im04kDaCqloVx5CI4yz82ygjOq/HxPT2TcF4/fiRnFjWiieZfstERuc3tEs0xiWJsYim+qNaMMuecTzx38tutbMgbIlPLPXsBjSCKtIHB0BsfYxYOIyMtI2T+9FQAr7IB3XxRoTIujRVFPfKp5o+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntHfeVRRfuJdivyYbV05cZl2IdPLKqIoxYU4jkfve10=;
 b=DLG9cSPZxdY4BcDEPfPjSQc2OwsXKo0tAbFTETuGSVOIrz4j5nkyOqZfGhTfEl5LmSBBO5ZEO72CUkU3Vro4Iq/09K5udEdYkDDRI0/zB61NNKvJgu1CH5NCRDZcks5qkGhVhcZ66fVVAROd8OpB+0JjZbaI0gIt78VrNuOSAuJtfHxs7CNkhWFv1mDRoKsgWzwFiBsVn88AaQvtCowaVzRTcOXC9xmaZB/diepYcqp5x8SBi7RR0Iaq80K8kmb5U8+aZ4NdhVM680JbC/B75irHefunzsgvpsCXDllzmwHfzNP6tRFwSJQtbU5itN2pqyDkIs8HoTlJbcHjGEeXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntHfeVRRfuJdivyYbV05cZl2IdPLKqIoxYU4jkfve10=;
 b=p2fH90z+ikTwpKiBZnnssfps5n7MHDJ7jgengzaxsVZXOp5nQhBcxB7vKLG6R0yaQwdF7Zw+DCy2gQ64mqpauT65CQhQrSTBp3Jymg8vMjNxyNLuwkdRFRfh5qs74YR+DmDWueZnj6KzWM2z92HHirR54eFOwJxhXJnXYHXLsFo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=wolfvision.net;
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com (2603:10a6:803:e5::10)
 by VI1PR0802MB2414.eurprd08.prod.outlook.com (2603:10a6:800:b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Tue, 10 Nov
 2020 11:53:47 +0000
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30]) by VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30%4]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 11:53:47 +0000
Subject: Re: [PATCH v2] usb: gadget: uvc: fix multiple opens
To:     Hans Verkuil <hverkuil@xs4all.nl>, gregkh@linuxfoundation.org
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org
References: <20201105103758.GA4033354@kroah.com>
 <20201110082504.26134-1-thomas.haemmerle@wolfvision.net>
 <2bf6f3b3-6475-9cd9-b6f9-dfc4b444c955@xs4all.nl>
From:   =?UTF-8?Q?Thomas_H=c3=a4mmerle?= <thomas.haemmerle@wolfvision.net>
Message-ID: <03c81d2f-24c3-0c15-3a8a-506ea955bf67@wolfvision.net>
Date:   Tue, 10 Nov 2020 12:53:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <2bf6f3b3-6475-9cd9-b6f9-dfc4b444c955@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [91.118.163.37]
X-ClientProxiedBy: VE1PR03CA0015.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::27) To VI1PR08MB4064.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.10.12.11] (91.118.163.37) by VE1PR03CA0015.eurprd03.prod.outlook.com (2603:10a6:802:a0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 11:53:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4d37acb-555d-4d6a-e896-08d8856f4829
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2414:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2414333E0DC66B1B1704DC54EDE90@VI1PR0802MB2414.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0+z3BXd8M36RnIFBBfpW3hlZzSsFpHR3/Vjf1Yoh2q260/7es+fOpwU9tDyjVs1jffLGjx+bnSiwRqcFgJmS+0fLlidCFF1DhdYJ31czlM7QYpTgtDBRpPHmzPMqOSeZI42WBOT5XPQWXlzWW2VZpy2HC7f8F//FZJ9zYLcqqnh0MYBVN8+RIyMS3xva9rZ7jnKS9LHMgAYYM+6/4NbzWvLS3U9GhSqqYUqJXUNCEqvokMYWbJ/pxKwsWVZCZJO3a7aAkj8q6r75jsT8mKMHK5l+IkBUo2uUFbx/sEqN+TtH8v/Clukf/Rj7JlCHI4lM7tjugXvIJ2elgX4xiwfzEJqG3z2aTSRyZkzAsJnYdtZsDzvgVrEJJQ2jHHK6F7R
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4064.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39840400004)(136003)(396003)(26005)(478600001)(186003)(31686004)(16526019)(52116002)(956004)(6486002)(2616005)(16576012)(2906002)(53546011)(4326008)(316002)(31696002)(8676002)(83380400001)(66946007)(8936002)(66556008)(36756003)(66476007)(86362001)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: yP5xY6ykypNhJdZh+iXCygnRH8jEJUldid1OU6PTgtrTXyQkdUEkcrbk5JOfw8U3gVft5I5geIaHeGCdQlEf5g0BbZd69R/+6UvJOb7SZtwPWgNFd71AbzpYJZqaWcAEKEvGgM8yTIUXjXFAm5/lbWFnmMpN1fB7ZBCxCbllLDgVEUYC1vtQ4zARbv2GD3ERClFWx6ra+d2Dvfff2XqzG5oUsk0dBYKhNfcQQb11BIOQvYFP5znPiw0eFMpZEMJkRJ0pOr2A1OvoPmLG5xY59XaIHm3bbdls44TYlq7JZ4HymKiIAlYl8BcMb28nmRGn3At1zsp+7jVXdbcTTNMGar+Ma0FjqXLdjrN5SyFlpAgHOVyMg+YPDKIelwSrJxGzQ5nyXYZBW904uvbQVbrICCpGe0AkLp88SL2k13tS3i8NFe2PE4rLQjvPS62p79FKGUQkIqvFR75+z9KamonPnSPGy3O6ijzfKfiDVoJzCTNSG7STtVEm6ANEG3qoR0LfkC9RPT0sXJBRE4tYB7OC9FFA6feWD7uN6WE4VXgZn22CA9N/f/hCGnmnnhgO//O2T6bQskVmoX9hIyXJDtbdt4HxWXBYVkg3E9HW3Bu/8Sgg1cnZ4Ys+2/fU+n80l1vMFwBxwUuQA1TZ2w5nUeetYrFHcQMv4Ix0pzU+6PRngLTijs1X1ETK1hzfh0uKfmp7Kh2ERpqcO1Qg5f1PFxXWWixCqrdlY/bUlgujwjmA+3fOJD7CqAE6yBodb1IepoedaJDWdD3p4AgYBjihnol6DDFQl+LFVVtWUVCh9OFigRtXhTZblKndRfjwI5CUmQRhlQ/ccy+BjFJOWc2SS2faK3Qnpn2fjZEiluK+O/AihzsAVHCRs2elieF0DHcIwfvseNwCE+YppoAkYPiaB59+gA==
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d37acb-555d-4d6a-e896-08d8856f4829
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4064.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 11:53:47.3334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeJaqupF1RSo5ouB6k2T9eBhxdxvQ/a3dJVaRHzLWb0Q9xeYBsb4J8dKIoq/V57u3b1zbg34ce9gigGmQWyevcIjzuWUql5sGIfCuvqFOIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2414
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10.11.20 11:31, Hans Verkuil wrote:
> On 10/11/2020 09:25, thomas.haemmerle@wolfvision.net wrote:
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
> 
> This makes no sense. Why would subscribing to a SETUP event
> mean that you are 'connected'?

Subscribing to a SETUP does not mean that you are connected - on a 
subscription to SETUP we can expect that there is a userspace process, 
utilizing UVC -- which is required for the UVC gadget function -- and 
everything is ready to enable the function by calling uvc_function_connect.
How about calling it `function_connected`?

> 
> It should be possible to open a V4L2 device node any number of times,
> and any filehandle can subscribe to any event, but typically once
> userspace allocates buffers (VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS)
> then that filehandle is marked as the owner of the device and other
> open filehandles are no longer allowed to allocate buffers or stream video.

Sure - this can be also done if userspace allocates buffers.
But why does it make more sense to call uvc_function_connect on 
VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS instead of subscribtion to a UVC event?

> 
> See e.g. drivers/media/common/videobuf2/videobuf2-v4l2.c
> and vb2_ioctl_reqbufs and other vb2_ioctl_* functions.
> 
> Unfortunately this UVC gadget driver is rather old and is not using
> these helper functions.
> 
> Running 'v4l2-compliance' will likely fail on a lot of tests for this
> driver.
> 
> This driver probably could use some TLC.

I totally agree with that, however this change fixes at least one test 
of 'v4l2-compliance'.
Currently a running UVC connection can be corrupted by another process 
which just opens and closes the device.

Thomas

> 
> Regards,
> 
> 	Hans
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static void uvc_v4l2_disable(struct uvc_device *uvc)
>> +{
>> +	if (--uvc->connections)
>> +		return;
>> +
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
>> +	if ((sub->type == UVC_EVENT_SETUP) && handle->connected) {
>> +		uvc_v4l2_disable(uvc);
>> +		handle->connected = false;
>> +	}
>> +
>> +	return 0;
>>   }
>>   
>>   static long
>> @@ -293,7 +333,6 @@ uvc_v4l2_open(struct file *file)
>>   	handle->device = &uvc->video;
>>   	file->private_data = &handle->vfh;
>>   
>> -	uvc_function_connect(uvc);
>>   	return 0;
>>   }
>>   
>> @@ -303,14 +342,11 @@ uvc_v4l2_release(struct file *file)
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
>> +	if (handle->connected)
>> +		uvc_v4l2_disable(uvc);
>> +	mutex_unlock(&uvc->video.mutex);
>>   
>>   	file->private_data = NULL;
>>   	v4l2_fh_del(&handle->vfh);
>>
> 
