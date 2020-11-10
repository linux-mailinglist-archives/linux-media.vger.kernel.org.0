Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5CD72ADA7C
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 16:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731125AbgKJPgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 10:36:20 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:47105 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730139AbgKJPgT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 10:36:19 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id cVgok4m9B1R0xcVgrka565; Tue, 10 Nov 2020 16:36:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605022574; bh=gADCXeMPUyFeZaQFx/chIw+PH98nIvA2W2qH+CpgEP4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jM3XaprQJverO822AERbPDyZR89r4RaJN7td1ERn4oMRdGWdepUMTXUmLCvROYZ2C
         bTB8ms9fvBq8pOdZ7JBIqYZByoF8PcCw4W73XACgQp8X3vR7XisaJQ2Ess8/kVVlsK
         qYXIL+4vDJjD2MToPC2IwiYro9DoQWE8DaQtFLW7DIwp9DKIejmvt+3Gk0dh3MN31C
         1kORicfetImaUxsp7aOCThn38rNPn7Pu2p5uwtg7uR2EBF3/Z7dkWQ1AVcIwWZRSh5
         NyZwK/vj5AecNaLqp6Z69u353Do8cfKn/k2ogpcyRiQt0fwuWsnKiiFJdHIS1GJJYR
         Nsf4XSEZ/xLIQ==
Subject: Re: [PATCH v2] usb: gadget: uvc: fix multiple opens
To:     =?UTF-8?Q?Thomas_H=c3=a4mmerle?= <thomas.haemmerle@wolfvision.net>,
        gregkh@linuxfoundation.org
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org
References: <20201105103758.GA4033354@kroah.com>
 <20201110082504.26134-1-thomas.haemmerle@wolfvision.net>
 <2bf6f3b3-6475-9cd9-b6f9-dfc4b444c955@xs4all.nl>
 <03c81d2f-24c3-0c15-3a8a-506ea955bf67@wolfvision.net>
 <7410ad3c-eaf9-9722-e269-d737b85ab696@xs4all.nl>
 <068a44bf-a5ec-cedb-bd7f-3caecf5ed58a@wolfvision.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bddb719c-5ca2-6da8-6741-2e02945f3a8c@xs4all.nl>
Date:   Tue, 10 Nov 2020 16:36:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <068a44bf-a5ec-cedb-bd7f-3caecf5ed58a@wolfvision.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfD7dMJlq/kZJeGRYKVz5MCiDMOqdy1DVMgs/wSAZTrFTQyN//OhAvO/dVZJYN0uXZW3YbruCkWO9KV7twiYVPYgxYKacBIPDfdsV/uc4GADuXiGBACO/
 umlu6et3A0NslvyRwjl4Q0wc2Q4/oNejNhXEt/U9WEIJ2/Bz8cPbVJIiw4Gf2sUb/AI2AKjyQ214zgfvjL0ORWqiX2eWgiHgQc9TexG6dWq+u5yavfxQY2/t
 IKeBS5mNy0lb+Q/SIbuDz5Jd170cb78ScG3fSFU/9kO6jsLEog9tf5KPNQuNID1e6ZJVEaTqNwaGaeiBLQ5L/pgFs3XmPJXg26m8dgPmlWci0fWr9PHEmXjU
 Np/HkFv1CpuIgBv9YDZCA4tqQulV1YL+IfnJlA/V0hopCr7Q59SwpYwpfPr/rYq3PD3s3d9wHBJaEPJvfg+lvap9RZcZFg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/11/2020 16:10, Thomas Hämmerle wrote:
> On 10.11.20 15:43, Hans Verkuil wrote:
>> On 10/11/2020 12:53, Thomas Hämmerle wrote:
>>> On 10.11.20 11:31, Hans Verkuil wrote:
>>>> On 10/11/2020 09:25, thomas.haemmerle@wolfvision.net wrote:
>>>>> From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
>>>>>
>>>>> Currently, the UVC function is activated when open on the corresponding
>>>>> v4l2 device is called.
>>>>> On another open the activation of the function fails since the
>>>>> deactivation counter in `usb_function_activate` equals 0. However the
>>>>> error is not returned to userspace since the open of the v4l2 device is
>>>>> successful.
>>>>>
>>>>> On a close the function is deactivated (since deactivation counter still
>>>>> equals 0) and the video is disabled in `uvc_v4l2_release`, although
>>>>> another process potentially is streaming.
>>>>>
>>>>> Move activation of UVC function to subscription on UVC_EVENT_SETUP and
>>>>> keep track of the number of subscribers (limited to 1) because there we
>>>>> can guarantee for a userspace program utilizing UVC.
>>>>> Extend the `struct uvc_file_handle` with member `bool connected` to tag
>>>>> it for a deactivation of the function.
>>>>>
>>>>> With this a process is able to check capabilities of the v4l2 device
>>>>> without deactivating the function for another process actually using the
>>>>> device for UVC streaming.
>>>>>
>>>>> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
>>>>> ---
>>>>> v2:
>>>>>    - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
>>>>>      locked in v4l2-core) introduced in v1
>>>>>    - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
>>>>>      connected
>>>>>
>>>>>    drivers/usb/gadget/function/uvc.h      |  2 +
>>>>>    drivers/usb/gadget/function/uvc_v4l2.c | 56 +++++++++++++++++++++-----
>>>>>    2 files changed, 48 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
>>>>> index 73da4f9a8d4c..0d0bcbffc8fd 100644
>>>>> --- a/drivers/usb/gadget/function/uvc.h
>>>>> +++ b/drivers/usb/gadget/function/uvc.h
>>>>> @@ -117,6 +117,7 @@ struct uvc_device {
>>>>>    	enum uvc_state state;
>>>>>    	struct usb_function func;
>>>>>    	struct uvc_video video;
>>>>> +	unsigned int connections;
>>>>>    
>>>>>    	/* Descriptors */
>>>>>    	struct {
>>>>> @@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
>>>>>    struct uvc_file_handle {
>>>>>    	struct v4l2_fh vfh;
>>>>>    	struct uvc_video *device;
>>>>> +	bool connected;
>>>>>    };
>>>>>    
>>>>>    #define to_uvc_file_handle(handle) \
>>>>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
>>>>> index 67922b1355e6..aee4888e17b1 100644
>>>>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>>>>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>>>>> @@ -228,17 +228,57 @@ static int
>>>>>    uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
>>>>>    			 const struct v4l2_event_subscription *sub)
>>>>>    {
>>>>> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
>>>>> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
>>>>> +	int ret;
>>>>> +
>>>>>    	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
>>>>>    		return -EINVAL;
>>>>>    
>>>>> -	return v4l2_event_subscribe(fh, sub, 2, NULL);
>>>>> +	if ((sub->type == UVC_EVENT_SETUP) && (uvc->connections >= 1))
>>>>> +		return -EBUSY;
>>>>> +
>>>>> +	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
>>>>> +	if (ret < 0)
>>>>> +		return ret;
>>>>> +
>>>>> +	if (sub->type == UVC_EVENT_SETUP) {
>>>>> +		uvc->connections++;
>>>>> +		handle->connected = true;
>>>>> +		uvc_function_connect(uvc);
>>>>> +	}
>>>>
>>>> This makes no sense. Why would subscribing to a SETUP event
>>>> mean that you are 'connected'?
>>>
>>> Subscribing to a SETUP does not mean that you are connected - on a
>>> subscription to SETUP we can expect that there is a userspace process,
>>> utilizing UVC -- which is required for the UVC gadget function -- and
>>> everything is ready to enable the function by calling uvc_function_connect.
>>> How about calling it `function_connected`?
>>
>> Any application can open the device node and subscribe to this event.
>> This is not a good place to call uvc_function_connect(), it's an abuse of
>> the V4L2 API.
> 
> Of course - any application can subscribe to this event but since the 
> event is defined in g_uvc.h I thought that a subscription is most likely 
> done by a UVC application.
> 
>>
>> I dug a bit more into this (I have very little gadget driver experience),
>> and isn't calling uvc_function_connect() something that should be done
>> on the first open? And when the last filehandle is closed, then
>> uvc_function_disconnect() can be called to clean up?
> 
> Isn't the possibility of the delayed activation of the usb function in 
> composite.c intended to wait for a corresponding userspace application, 
> which is required to make the gadget work?
> 
> If so, a simple open of the v4l2 device does not mean that the gadget is 
> ready to go: starting pipewire for example results in quering the device 
> capabilities of all devices. But this does not mean that the gadget will 
> work.
> Therefore I was looking for a place, where we can expect, that the 
> application opened the device will utilize UVC and found that a 
> subscription to a UVC specific event is the right place.

That's why I suggested to do this when buffers are allocated. That's when
the application commits resources to actually use the device. Until that
point everything that an application does is just querying or configuring,
but not actually using it.

BTW, Laurent Pinchart who maintains this driver is away for a week, so he
might know more about this when he comes back.

Regards,

	Hans

> 
> Regards,
> Thomas
> 
>>
>> That would make much more sense. Grep for v4l2_fh_is_singular_file() on how
>> to do this, quite a few media drivers need this.
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>>>
>>>> It should be possible to open a V4L2 device node any number of times,
>>>> and any filehandle can subscribe to any event, but typically once
>>>> userspace allocates buffers (VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS)
>>>> then that filehandle is marked as the owner of the device and other
>>>> open filehandles are no longer allowed to allocate buffers or stream video.
>>>
>>> Sure - this can be also done if userspace allocates buffers.
>>> But why does it make more sense to call uvc_function_connect on
>>> VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS instead of subscribtion to a UVC event?
>>>
>>>>
>>>> See e.g. drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>> and vb2_ioctl_reqbufs and other vb2_ioctl_* functions.
>>>>
>>>> Unfortunately this UVC gadget driver is rather old and is not using
>>>> these helper functions.
>>>>
>>>> Running 'v4l2-compliance' will likely fail on a lot of tests for this
>>>> driver.
>>>>
>>>> This driver probably could use some TLC.
>>>
>>> I totally agree with that, however this change fixes at least one test
>>> of 'v4l2-compliance'.
>>> Currently a running UVC connection can be corrupted by another process
>>> which just opens and closes the device.
>>>
>>> Thomas
>>>
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static void uvc_v4l2_disable(struct uvc_device *uvc)
>>>>> +{
>>>>> +	if (--uvc->connections)
>>>>> +		return;
>>>>> +
>>>>> +	uvc_function_disconnect(uvc);
>>>>> +	uvcg_video_enable(&uvc->video, 0);
>>>>> +	uvcg_free_buffers(&uvc->video.queue);
>>>>>    }
>>>>>    
>>>>>    static int
>>>>>    uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
>>>>>    			   const struct v4l2_event_subscription *sub)
>>>>>    {
>>>>> -	return v4l2_event_unsubscribe(fh, sub);
>>>>> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
>>>>> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = v4l2_event_unsubscribe(fh, sub);
>>>>> +	if (ret < 0)
>>>>> +		return ret;
>>>>> +
>>>>> +	if ((sub->type == UVC_EVENT_SETUP) && handle->connected) {
>>>>> +		uvc_v4l2_disable(uvc);
>>>>> +		handle->connected = false;
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>>    }
>>>>>    
>>>>>    static long
>>>>> @@ -293,7 +333,6 @@ uvc_v4l2_open(struct file *file)
>>>>>    	handle->device = &uvc->video;
>>>>>    	file->private_data = &handle->vfh;
>>>>>    
>>>>> -	uvc_function_connect(uvc);
>>>>>    	return 0;
>>>>>    }
>>>>>    
>>>>> @@ -303,14 +342,11 @@ uvc_v4l2_release(struct file *file)
>>>>>    	struct video_device *vdev = video_devdata(file);
>>>>>    	struct uvc_device *uvc = video_get_drvdata(vdev);
>>>>>    	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
>>>>> -	struct uvc_video *video = handle->device;
>>>>> -
>>>>> -	uvc_function_disconnect(uvc);
>>>>>    
>>>>> -	mutex_lock(&video->mutex);
>>>>> -	uvcg_video_enable(video, 0);
>>>>> -	uvcg_free_buffers(&video->queue);
>>>>> -	mutex_unlock(&video->mutex);
>>>>> +	mutex_lock(&uvc->video.mutex);
>>>>> +	if (handle->connected)
>>>>> +		uvc_v4l2_disable(uvc);
>>>>> +	mutex_unlock(&uvc->video.mutex);
>>>>>    
>>>>>    	file->private_data = NULL;
>>>>>    	v4l2_fh_del(&handle->vfh);
>>>>>
>>>>
>>

