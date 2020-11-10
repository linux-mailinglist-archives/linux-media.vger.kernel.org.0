Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E192AD9C5
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 16:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731353AbgKJPKs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 10:10:48 -0500
Received: from mail-vi1eur05on2079.outbound.protection.outlook.com ([40.107.21.79]:44768
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731173AbgKJPKs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 10:10:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfdSxTjv7BUdxnzL26qFNMA0A7l7wfZ+Ou/k/FkBZ5+EUjndlMpxmHhdDOOUTKV+ZimlsI/WQo2Wzir2u6yp8/lxMXS56iYiV8W1EVorG/iKIvubJXkrZiW64RPJg0/plRyjNC5fg+VZPtvp9QBYstw7bBj/GH6wX9C/1HG7yhBDBPJ6dhQ2frILwkA84OYkdeqm9TLF6L1Mw9fAT1P2jCzsPcXATmyIcBHwSFuhms6ld+AHufUN0v9c3j1vAH+ZqpeI5p60Pe8rLzg5s7tBGKnj6vZKRlbUl8ev5Ng8XdjeVCl9aGauUVlWkd8ScVuIL40k2VE4M1Ko/JK/YcNqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvDAU2Vrt9Npx4b4rakm9lJmQmFBuBOqSxhSGpi7OvQ=;
 b=bi0fq3tMJ2iU+seHD5QCQdVgYr5xEBQmyADQZ/8wWHufkA1EAA80+yIMFzhcNQDRWr+VrXWq15KUBc5kaK8EcP5IIjFlv/hylMjfTd57+Tbu+Id0x4qphTtd6ipwTuoCcldGUwF22yX9avXOdWAJHgaEdgX7LwLK/1B/FBYXuBHrAf4NveP5F3ykdGr7EEaSu6X1iGev5Y/4rupkrs8fNKM8U64qss339bhfj7CyHUwgh7qug91RwXXClLZMahX8sy4rW1jzhEv9KNJDFIzt5nQ/ubhKBT9tMTisJIOmv+Hz309LnhrVLMXysW1yjPv3u9dpSa8FYppEKnPI9sunLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvDAU2Vrt9Npx4b4rakm9lJmQmFBuBOqSxhSGpi7OvQ=;
 b=gEL2xnMTaIOOe+rB59qKPtqm1K9KgZaK8hf/h4Jz8TRJ5PAk25hyuJng5URg1xxL6XAsvVEU8HXop/C3c94YEXKF4Zd9X0xjRyL3qHF1ZRMRyd3R9cthgyMzeb1Wdm1giM7fTOvzzenYkBzpv48yzBTYsrTsgKs66YoR0XQD/oQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=wolfvision.net;
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com (2603:10a6:803:e5::10)
 by VI1PR08MB2798.eurprd08.prod.outlook.com (2603:10a6:802:20::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Tue, 10 Nov
 2020 15:10:32 +0000
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30]) by VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30%4]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 15:10:32 +0000
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
From:   =?UTF-8?Q?Thomas_H=c3=a4mmerle?= <thomas.haemmerle@wolfvision.net>
Message-ID: <068a44bf-a5ec-cedb-bd7f-3caecf5ed58a@wolfvision.net>
Date:   Tue, 10 Nov 2020 16:10:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7410ad3c-eaf9-9722-e269-d737b85ab696@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [91.118.163.37]
X-ClientProxiedBy: VI1PR10CA0098.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::27) To VI1PR08MB4064.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.10.12.11] (91.118.163.37) by VI1PR10CA0098.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:28::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 15:10:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a871544e-7bf3-48f3-3dc9-08d8858ac47e
X-MS-TrafficTypeDiagnostic: VI1PR08MB2798:
X-Microsoft-Antispam-PRVS: <VI1PR08MB27980469E6CA777A441D960EEDE90@VI1PR08MB2798.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: buoNRkNWVDBoFbysArx30Jnn+9oGPeM3EnQEYGNKgpoMxzvJ0+xLCuzDXVV9yPlc9fXi4/7QOohrza0ftG3ErqZ5a3QVGwt8Y20dNT/R9gYMc8mHJ6lOsils9Qw6CBpkoeazbOxibt9bQedpD3Fjz2zK7WqhMMgEwVcwdpqhEsEIG7mTElf07PA6R492DaukFbYw1J7LWAsiTfZg1Xu6kkZseqfS/1kodo7uzBKiyXZSAlmyZ4KvWsUkRrKKIO8g621S5FNu4NApmH4vemUqw1wQox7xCdsEzNP/+w6/G6CDejE7fb8n1JtDM3kPemLAbXNZ4o0utLSeLGo0INxnL7DLhQs0kvd6gI0VvdkfIKmS7r0JMwFvijItJoDCyLdG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4064.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39840400004)(16576012)(83380400001)(186003)(52116002)(86362001)(31696002)(316002)(478600001)(66574015)(66556008)(66946007)(8936002)(26005)(8676002)(53546011)(16526019)(4326008)(36756003)(2906002)(5660300002)(956004)(31686004)(2616005)(6486002)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Pp8JILvyt0sPCg1/9p20tNNNLCD2ayxaE9FDymJCc9Nva/wkLcYys6WgFmJ5RZC59+4KupHyJfJLfsM23rxbHPTgq++i6hxXkTSoPq2txxKAeyL+551O+lG2AFouWmXekNYZg6jVkZuKjIIKlME3BF7ARKFz6SW4x3Yze7G6WONOyMkcJiYTKuTBfeKPifrOa894Y98ds8e29LV7kSz1wNnqaDm1lftRvQUqkSmX2XVRDOCQr31tNpTr/wkFAI1JFvUIzUZT+8MRGkAs8aCr8rjUujO9ZrPgXRNpM12GCGVXYQvAV68BUkdaj4MiwcHcV4XCpolpARKSLwIOmVMDdelDyL37MqzmdmmzCqrdQC9FCGB2hlKnAzCWHQc5YdZhcV1B83qRBYDysE7vvXnHxyF52H4FdRY/i1dGd6AY0z3yuKWfiYo09y6Z42bs5MRFywUr/xJ3KsO4bwQdM4hg19COt3Xu/XJw8Hk/3JgMvlY13SLRkviSELXmRsl8uUNLfvoyCZLawg6xpX8BhahLlLij4nrZnboZUhwNVjw7qv0pNaaJ0KvP9hFx/PGVCNrIqYKunPWzriA9wVcER3X82jovR6pH6r/N5v+KQKR9rHbPjR3S953d+JWhgqsqWpQhlIAUwe4MmNvdmUcZ3bROXkBWQMY2N6t2kEJNTctBZPlELKoYTJgEtP1zSLJDiNlgUAgvqQeW7mX77q/uW/Td5pnez3x2ftMUGoeyynE/wfoW5XX7cqIgWJeYmGu2t4LNSarkBVMmYJ6UFi2qTsdlI5/+RqWRDOqdcJwH5OburdD7HleVN6xn98sdmXxL65+tzADEPCgebkHKxvOiHMwzQZN7ny/Dl/eDlBE9Y0D8vmsI6iBLgQnq69cKS0SkWJjtjQli4Bcx2N0QQjucwwjTXg==
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a871544e-7bf3-48f3-3dc9-08d8858ac47e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4064.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 15:10:32.2653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wemJPS+ViVz47b6HXPVrahJ8T1pL6ZJEdiXuZ/vG23SJJdr+AEo1MDbzNEwTl/9B7LdCJQ3ePJywQgjDHcTmwshDJpOiGhPKbUWI888TF7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2798
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10.11.20 15:43, Hans Verkuil wrote:
> On 10/11/2020 12:53, Thomas Hämmerle wrote:
>> On 10.11.20 11:31, Hans Verkuil wrote:
>>> On 10/11/2020 09:25, thomas.haemmerle@wolfvision.net wrote:
>>>> From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
>>>>
>>>> Currently, the UVC function is activated when open on the corresponding
>>>> v4l2 device is called.
>>>> On another open the activation of the function fails since the
>>>> deactivation counter in `usb_function_activate` equals 0. However the
>>>> error is not returned to userspace since the open of the v4l2 device is
>>>> successful.
>>>>
>>>> On a close the function is deactivated (since deactivation counter still
>>>> equals 0) and the video is disabled in `uvc_v4l2_release`, although
>>>> another process potentially is streaming.
>>>>
>>>> Move activation of UVC function to subscription on UVC_EVENT_SETUP and
>>>> keep track of the number of subscribers (limited to 1) because there we
>>>> can guarantee for a userspace program utilizing UVC.
>>>> Extend the `struct uvc_file_handle` with member `bool connected` to tag
>>>> it for a deactivation of the function.
>>>>
>>>> With this a process is able to check capabilities of the v4l2 device
>>>> without deactivating the function for another process actually using the
>>>> device for UVC streaming.
>>>>
>>>> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
>>>> ---
>>>> v2:
>>>>    - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
>>>>      locked in v4l2-core) introduced in v1
>>>>    - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
>>>>      connected
>>>>
>>>>    drivers/usb/gadget/function/uvc.h      |  2 +
>>>>    drivers/usb/gadget/function/uvc_v4l2.c | 56 +++++++++++++++++++++-----
>>>>    2 files changed, 48 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
>>>> index 73da4f9a8d4c..0d0bcbffc8fd 100644
>>>> --- a/drivers/usb/gadget/function/uvc.h
>>>> +++ b/drivers/usb/gadget/function/uvc.h
>>>> @@ -117,6 +117,7 @@ struct uvc_device {
>>>>    	enum uvc_state state;
>>>>    	struct usb_function func;
>>>>    	struct uvc_video video;
>>>> +	unsigned int connections;
>>>>    
>>>>    	/* Descriptors */
>>>>    	struct {
>>>> @@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
>>>>    struct uvc_file_handle {
>>>>    	struct v4l2_fh vfh;
>>>>    	struct uvc_video *device;
>>>> +	bool connected;
>>>>    };
>>>>    
>>>>    #define to_uvc_file_handle(handle) \
>>>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
>>>> index 67922b1355e6..aee4888e17b1 100644
>>>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>>>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>>>> @@ -228,17 +228,57 @@ static int
>>>>    uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
>>>>    			 const struct v4l2_event_subscription *sub)
>>>>    {
>>>> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
>>>> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
>>>> +	int ret;
>>>> +
>>>>    	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
>>>>    		return -EINVAL;
>>>>    
>>>> -	return v4l2_event_subscribe(fh, sub, 2, NULL);
>>>> +	if ((sub->type == UVC_EVENT_SETUP) && (uvc->connections >= 1))
>>>> +		return -EBUSY;
>>>> +
>>>> +	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	if (sub->type == UVC_EVENT_SETUP) {
>>>> +		uvc->connections++;
>>>> +		handle->connected = true;
>>>> +		uvc_function_connect(uvc);
>>>> +	}
>>>
>>> This makes no sense. Why would subscribing to a SETUP event
>>> mean that you are 'connected'?
>>
>> Subscribing to a SETUP does not mean that you are connected - on a
>> subscription to SETUP we can expect that there is a userspace process,
>> utilizing UVC -- which is required for the UVC gadget function -- and
>> everything is ready to enable the function by calling uvc_function_connect.
>> How about calling it `function_connected`?
> 
> Any application can open the device node and subscribe to this event.
> This is not a good place to call uvc_function_connect(), it's an abuse of
> the V4L2 API.

Of course - any application can subscribe to this event but since the 
event is defined in g_uvc.h I thought that a subscription is most likely 
done by a UVC application.

> 
> I dug a bit more into this (I have very little gadget driver experience),
> and isn't calling uvc_function_connect() something that should be done
> on the first open? And when the last filehandle is closed, then
> uvc_function_disconnect() can be called to clean up?

Isn't the possibility of the delayed activation of the usb function in 
composite.c intended to wait for a corresponding userspace application, 
which is required to make the gadget work?

If so, a simple open of the v4l2 device does not mean that the gadget is 
ready to go: starting pipewire for example results in quering the device 
capabilities of all devices. But this does not mean that the gadget will 
work.
Therefore I was looking for a place, where we can expect, that the 
application opened the device will utilize UVC and found that a 
subscription to a UVC specific event is the right place.

Regards,
Thomas

> 
> That would make much more sense. Grep for v4l2_fh_is_singular_file() on how
> to do this, quite a few media drivers need this.
> 
> Regards,
> 
> 	Hans
> 
>>
>>>
>>> It should be possible to open a V4L2 device node any number of times,
>>> and any filehandle can subscribe to any event, but typically once
>>> userspace allocates buffers (VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS)
>>> then that filehandle is marked as the owner of the device and other
>>> open filehandles are no longer allowed to allocate buffers or stream video.
>>
>> Sure - this can be also done if userspace allocates buffers.
>> But why does it make more sense to call uvc_function_connect on
>> VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS instead of subscribtion to a UVC event?
>>
>>>
>>> See e.g. drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> and vb2_ioctl_reqbufs and other vb2_ioctl_* functions.
>>>
>>> Unfortunately this UVC gadget driver is rather old and is not using
>>> these helper functions.
>>>
>>> Running 'v4l2-compliance' will likely fail on a lot of tests for this
>>> driver.
>>>
>>> This driver probably could use some TLC.
>>
>> I totally agree with that, however this change fixes at least one test
>> of 'v4l2-compliance'.
>> Currently a running UVC connection can be corrupted by another process
>> which just opens and closes the device.
>>
>> Thomas
>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void uvc_v4l2_disable(struct uvc_device *uvc)
>>>> +{
>>>> +	if (--uvc->connections)
>>>> +		return;
>>>> +
>>>> +	uvc_function_disconnect(uvc);
>>>> +	uvcg_video_enable(&uvc->video, 0);
>>>> +	uvcg_free_buffers(&uvc->video.queue);
>>>>    }
>>>>    
>>>>    static int
>>>>    uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
>>>>    			   const struct v4l2_event_subscription *sub)
>>>>    {
>>>> -	return v4l2_event_unsubscribe(fh, sub);
>>>> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
>>>> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
>>>> +	int ret;
>>>> +
>>>> +	ret = v4l2_event_unsubscribe(fh, sub);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	if ((sub->type == UVC_EVENT_SETUP) && handle->connected) {
>>>> +		uvc_v4l2_disable(uvc);
>>>> +		handle->connected = false;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>>    }
>>>>    
>>>>    static long
>>>> @@ -293,7 +333,6 @@ uvc_v4l2_open(struct file *file)
>>>>    	handle->device = &uvc->video;
>>>>    	file->private_data = &handle->vfh;
>>>>    
>>>> -	uvc_function_connect(uvc);
>>>>    	return 0;
>>>>    }
>>>>    
>>>> @@ -303,14 +342,11 @@ uvc_v4l2_release(struct file *file)
>>>>    	struct video_device *vdev = video_devdata(file);
>>>>    	struct uvc_device *uvc = video_get_drvdata(vdev);
>>>>    	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
>>>> -	struct uvc_video *video = handle->device;
>>>> -
>>>> -	uvc_function_disconnect(uvc);
>>>>    
>>>> -	mutex_lock(&video->mutex);
>>>> -	uvcg_video_enable(video, 0);
>>>> -	uvcg_free_buffers(&video->queue);
>>>> -	mutex_unlock(&video->mutex);
>>>> +	mutex_lock(&uvc->video.mutex);
>>>> +	if (handle->connected)
>>>> +		uvc_v4l2_disable(uvc);
>>>> +	mutex_unlock(&uvc->video.mutex);
>>>>    
>>>>    	file->private_data = NULL;
>>>>    	v4l2_fh_del(&handle->vfh);
>>>>
>>>
> 
