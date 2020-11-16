Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC10E2B49DA
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 16:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730522AbgKPPsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 10:48:31 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:34991 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729057AbgKPPsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 10:48:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id egjtkomWYfkEdegjykWh1Q; Mon, 16 Nov 2020 16:48:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605541707; bh=kOLRSWGFn5O7jn6eZ/jQUlWh1bS0jBabND28XblRWeo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IK3X0WWyiz0fqp2WA/dNmrf7rd7ZqurFYI05Wb3JJ+awR/y3cZq8vD+GrBVe9cByN
         MOc6d6fB8Csmp8aaY2vp6t1AaSPC9Yx/3oYU6Z+YuXJ1NVSJ211CEXFnR3HS/bLkyl
         pOCnAqoFPK+xPGsV5sqcaRV5i6t555ZUu5dCQgdwv3sP1GfbhEsuv8SssfxjcCvpF4
         kvLd0oc47qeUeqKP2IyNPuoWmmn0oP2cBzSy4i8gLmLtjjhFLO7SWOFznrs1tYrSrV
         XITkH0Cj6HxYxatoeLrNtw1f1hiBax1zfsytuQ415TV3Fwi3llqx0fdvLNe7BiCNse
         Xkk/gToOz6rKA==
Subject: Re: [PATCH v2] usb: gadget: uvc: fix multiple opens
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     =?UTF-8?Q?Thomas_H=c3=a4mmerle?= <thomas.haemmerle@wolfvision.net>,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org
References: <20201105103758.GA4033354@kroah.com>
 <20201110082504.26134-1-thomas.haemmerle@wolfvision.net>
 <2bf6f3b3-6475-9cd9-b6f9-dfc4b444c955@xs4all.nl>
 <03c81d2f-24c3-0c15-3a8a-506ea955bf67@wolfvision.net>
 <7410ad3c-eaf9-9722-e269-d737b85ab696@xs4all.nl>
 <068a44bf-a5ec-cedb-bd7f-3caecf5ed58a@wolfvision.net>
 <bddb719c-5ca2-6da8-6741-2e02945f3a8c@xs4all.nl>
 <3a1ddd46-6472-e5af-7765-223d78f2e3e3@wolfvision.net>
 <f8941da1-ca3f-b54a-0e3a-cda0f39dc7dc@xs4all.nl>
 <20201116153154.GO6540@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <517a0c03-b500-1fc9-e8af-cd2c6a3e8623@xs4all.nl>
Date:   Mon, 16 Nov 2020 16:48:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201116153154.GO6540@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPK9dmN3CfEDOxnHJYdzuf4iXvco5fTVX5yGQzYb4cEt97SUbkvxqZSeJlI4hBTiIcZhdVmhoMK3GwUbFQfjvZj8NIQ7w/iBGsfPDQYRD1I8bTA5LLGe
 OAVbN6+6S0+jU7XmWTVe+FosRIcarIezlwn64FyX0tV83OuOJL6PFNmcZgiLetIaArqCSu1JB6eIa+RLQzT04m+g/cLZNgK7WwhTMBacda24DBogwfRHMigh
 NFZOmE/UprfPfkDk1VdvPTY2EjsA1ZkqJzCgcQukIXtrGNRF6ggymOIcbiaVC622F9oGMPzYYz/ZXRnIhSpkjKNh7b7a1jsaipe/95CKA548B4nrKaEXZfhR
 he/ECa9f19avgojY/Vhe4nLCp6b3vDebJ44klT597R+bVMt9TL5xWVL2y0eVvM5wnyR2GAhG70KoAZjLZHCyvCtV6jz5bg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/11/2020 16:31, Laurent Pinchart wrote:
> Hello everybody,
> 
> Sorry for chiming in late.
> 
> On Tue, Nov 10, 2020 at 05:01:31PM +0100, Hans Verkuil wrote:
>> On 10/11/2020 16:50, Thomas Hämmerle wrote:
>>> On 10.11.20 16:36, Hans Verkuil wrote:
>>>> On 10/11/2020 16:10, Thomas Hämmerle wrote:
>>>>> On 10.11.20 15:43, Hans Verkuil wrote:
>>>>>> On 10/11/2020 12:53, Thomas Hämmerle wrote:
>>>>>>> On 10.11.20 11:31, Hans Verkuil wrote:
>>>>>>>> On 10/11/2020 09:25, thomas.haemmerle@wolfvision.net wrote:
>>>>>>>>> From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
>>>>>>>>>
>>>>>>>>> Currently, the UVC function is activated when open on the corresponding
>>>>>>>>> v4l2 device is called.
>>>>>>>>> On another open the activation of the function fails since the
>>>>>>>>> deactivation counter in `usb_function_activate` equals 0. However the
>>>>>>>>> error is not returned to userspace since the open of the v4l2 device is
>>>>>>>>> successful.
>>>>>>>>>
>>>>>>>>> On a close the function is deactivated (since deactivation counter still
>>>>>>>>> equals 0) and the video is disabled in `uvc_v4l2_release`, although
>>>>>>>>> another process potentially is streaming.
>>>>>>>>>
>>>>>>>>> Move activation of UVC function to subscription on UVC_EVENT_SETUP and
>>>>>>>>> keep track of the number of subscribers (limited to 1) because there we
>>>>>>>>> can guarantee for a userspace program utilizing UVC.
>>>>>>>>> Extend the `struct uvc_file_handle` with member `bool connected` to tag
>>>>>>>>> it for a deactivation of the function.
>>>>>>>>>
>>>>>>>>> With this a process is able to check capabilities of the v4l2 device
>>>>>>>>> without deactivating the function for another process actually using the
>>>>>>>>> device for UVC streaming.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
>>>>>>>>> ---
>>>>>>>>> v2:
>>>>>>>>>     - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
>>>>>>>>>       locked in v4l2-core) introduced in v1
>>>>>>>>>     - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
>>>>>>>>>       connected
>>>>>>>>>
>>>>>>>>>     drivers/usb/gadget/function/uvc.h      |  2 +
>>>>>>>>>     drivers/usb/gadget/function/uvc_v4l2.c | 56 +++++++++++++++++++++-----
>>>>>>>>>     2 files changed, 48 insertions(+), 10 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
>>>>>>>>> index 73da4f9a8d4c..0d0bcbffc8fd 100644
>>>>>>>>> --- a/drivers/usb/gadget/function/uvc.h
>>>>>>>>> +++ b/drivers/usb/gadget/function/uvc.h
>>>>>>>>> @@ -117,6 +117,7 @@ struct uvc_device {
>>>>>>>>>     	enum uvc_state state;
>>>>>>>>>     	struct usb_function func;
>>>>>>>>>     	struct uvc_video video;
>>>>>>>>> +	unsigned int connections;
>>>>>>>>>     
>>>>>>>>>     	/* Descriptors */
>>>>>>>>>     	struct {
>>>>>>>>> @@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
>>>>>>>>>     struct uvc_file_handle {
>>>>>>>>>     	struct v4l2_fh vfh;
>>>>>>>>>     	struct uvc_video *device;
>>>>>>>>> +	bool connected;
>>>>>>>>>     };
>>>>>>>>>     
>>>>>>>>>     #define to_uvc_file_handle(handle) \
>>>>>>>>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
>>>>>>>>> index 67922b1355e6..aee4888e17b1 100644
>>>>>>>>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>>>>>>>>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>>>>>>>>> @@ -228,17 +228,57 @@ static int
>>>>>>>>>     uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
>>>>>>>>>     			 const struct v4l2_event_subscription *sub)
>>>>>>>>>     {
>>>>>>>>> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
>>>>>>>>> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
>>>>>>>>> +	int ret;
>>>>>>>>> +
>>>>>>>>>     	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
>>>>>>>>>     		return -EINVAL;
>>>>>>>>>     
>>>>>>>>> -	return v4l2_event_subscribe(fh, sub, 2, NULL);
>>>>>>>>> +	if ((sub->type == UVC_EVENT_SETUP) && (uvc->connections >= 1))
>>>>>>>>> +		return -EBUSY;
>>>>>>>>> +
>>>>>>>>> +	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
>>>>>>>>> +	if (ret < 0)
>>>>>>>>> +		return ret;
>>>>>>>>> +
>>>>>>>>> +	if (sub->type == UVC_EVENT_SETUP) {
>>>>>>>>> +		uvc->connections++;
>>>>>>>>> +		handle->connected = true;
>>>>>>>>> +		uvc_function_connect(uvc);
>>>>>>>>> +	}
>>>>>>>>
>>>>>>>> This makes no sense. Why would subscribing to a SETUP event
>>>>>>>> mean that you are 'connected'?
>>>>>>>
>>>>>>> Subscribing to a SETUP does not mean that you are connected - on a
>>>>>>> subscription to SETUP we can expect that there is a userspace process,
>>>>>>> utilizing UVC -- which is required for the UVC gadget function -- and
>>>>>>> everything is ready to enable the function by calling uvc_function_connect.
>>>>>>> How about calling it `function_connected`?
>>>>>>
>>>>>> Any application can open the device node and subscribe to this event.
>>>>>> This is not a good place to call uvc_function_connect(), it's an abuse of
>>>>>> the V4L2 API.
>>>>>
>>>>> Of course - any application can subscribe to this event but since the
>>>>> event is defined in g_uvc.h I thought that a subscription is most likely
>>>>> done by a UVC application.
> 
> I agree with Thomas here, subscribing to UVC_EVENT_SETUP means that the
> application is a UVC gadget application. It's a bit of a hack, but short
> of introducing a custom ioctl, I think it's a fairly good option.

Yuck.

OK, if you do this, then this should be documented, both in the driver and
esp. in the public g_uvc.h header. This is completely non-standard and
unexpected behavior.

It would be nice BTW if all these UVC events are documented in the header.

Regards,

	Hans

> 
>>>>>> I dug a bit more into this (I have very little gadget driver experience),
>>>>>> and isn't calling uvc_function_connect() something that should be done
>>>>>> on the first open? And when the last filehandle is closed, then
>>>>>> uvc_function_disconnect() can be called to clean up?
>>>>>
>>>>> Isn't the possibility of the delayed activation of the usb function in
>>>>> composite.c intended to wait for a corresponding userspace application,
>>>>> which is required to make the gadget work?
>>>>>
>>>>> If so, a simple open of the v4l2 device does not mean that the gadget is
>>>>> ready to go: starting pipewire for example results in quering the device
>>>>> capabilities of all devices. But this does not mean that the gadget will
>>>>> work.
>>>>> Therefore I was looking for a place, where we can expect, that the
>>>>> application opened the device will utilize UVC and found that a
>>>>> subscription to a UVC specific event is the right place.
>>>>
>>>> That's why I suggested to do this when buffers are allocated. That's when
>>>> the application commits resources to actually use the device. Until that
>>>> point everything that an application does is just querying or configuring,
>>>> but not actually using it.
>>>
>>> The userspace application implementations (including the one from 
>>> Laurent Pinchart) usually request buffers on the UVC events sent by the 
>>> host. Therefore we would run into chicken-and-egg problem.
>>
>> Ah, stupid of me. You're right.
>>
>> For now I go with calling uvc_function_connect() on the first open. If
>> nothing else, this is compatible with the current situation, while still
>> allowing for multiple opens.
> 
> The problem with connecting on first open is that any application
> querying the device (v4l_id from udev, pipewire as Thomas mentioned,
> ...) will generate spurious connect/disconnect events.
> 
> This being said, the current code already suffers from the spurious
> connect/disconnect issue, so we could possibly fix the race condition
> first with a patch that calls uvc_function_connect() on the first open
> and uvc_function_disconnect() on last close, and then move the logic to
> event subscription in a separate patch. Not sure it would be worth it
> though.
> 
>>>> BTW, Laurent Pinchart who maintains this driver is away for a week, so he
>>>> might know more about this when he comes back.
>>>
>>> Okay, so I suggest to wait for him.
>>>
>>> Thanks for the review so far!
>>>
>>>>>> That would make much more sense. Grep for v4l2_fh_is_singular_file() on how
>>>>>> to do this, quite a few media drivers need this.
>>>>>>
>>>>>>>> It should be possible to open a V4L2 device node any number of times,
>>>>>>>> and any filehandle can subscribe to any event, but typically once
>>>>>>>> userspace allocates buffers (VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS)
>>>>>>>> then that filehandle is marked as the owner of the device and other
>>>>>>>> open filehandles are no longer allowed to allocate buffers or stream video.
>>>>>>>
>>>>>>> Sure - this can be also done if userspace allocates buffers.
>>>>>>> But why does it make more sense to call uvc_function_connect on
>>>>>>> VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS instead of subscribtion to a UVC event?
>>>>>>>
>>>>>>>> See e.g. drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>>>>>> and vb2_ioctl_reqbufs and other vb2_ioctl_* functions.
>>>>>>>>
>>>>>>>> Unfortunately this UVC gadget driver is rather old and is not using
>>>>>>>> these helper functions.
>>>>>>>>
>>>>>>>> Running 'v4l2-compliance' will likely fail on a lot of tests for this
>>>>>>>> driver.
> 
> I don't think this driver will ever be able to pass v4l2-compliance as
> it's not a typical V4L2 output device. It uses V4L2 as that was the best
> match for a userspace API, but custom ioctls and events are required to
> drive the device, and the userspace application needs to work
> hand-in-hand with the driver to respond to UVC requests originating from
> the host. No other V4L2 application will be able to use the device.
> 
> This being said, the driver is indeed old, and I'm sure improvements are
> possible, but full v4l2-compliance isn't a reasonable goal.
> 
>>>>>>>> This driver probably could use some TLC.
>>>>>>>
>>>>>>> I totally agree with that, however this change fixes at least one test
>>>>>>> of 'v4l2-compliance'.
>>>>>>> Currently a running UVC connection can be corrupted by another process
>>>>>>> which just opens and closes the device.
>>>>>>>
>>>>>>>>> +
>>>>>>>>> +	return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static void uvc_v4l2_disable(struct uvc_device *uvc)
>>>>>>>>> +{
>>>>>>>>> +	if (--uvc->connections)
>>>>>>>>> +		return;
>>>>>>>>> +
>>>>>>>>> +	uvc_function_disconnect(uvc);
>>>>>>>>> +	uvcg_video_enable(&uvc->video, 0);
>>>>>>>>> +	uvcg_free_buffers(&uvc->video.queue);
>>>>>>>>>     }
>>>>>>>>>     
>>>>>>>>>     static int
>>>>>>>>>     uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
>>>>>>>>>     			   const struct v4l2_event_subscription *sub)
>>>>>>>>>     {
>>>>>>>>> -	return v4l2_event_unsubscribe(fh, sub);
>>>>>>>>> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
>>>>>>>>> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
>>>>>>>>> +	int ret;
>>>>>>>>> +
>>>>>>>>> +	ret = v4l2_event_unsubscribe(fh, sub);
>>>>>>>>> +	if (ret < 0)
>>>>>>>>> +		return ret;
>>>>>>>>> +
>>>>>>>>> +	if ((sub->type == UVC_EVENT_SETUP) && handle->connected) {
>>>>>>>>> +		uvc_v4l2_disable(uvc);
>>>>>>>>> +		handle->connected = false;
>>>>>>>>> +	}
>>>>>>>>> +
>>>>>>>>> +	return 0;
>>>>>>>>>     }
>>>>>>>>>     
>>>>>>>>>     static long
>>>>>>>>> @@ -293,7 +333,6 @@ uvc_v4l2_open(struct file *file)
>>>>>>>>>     	handle->device = &uvc->video;
>>>>>>>>>     	file->private_data = &handle->vfh;
>>>>>>>>>     
>>>>>>>>> -	uvc_function_connect(uvc);
>>>>>>>>>     	return 0;
>>>>>>>>>     }
>>>>>>>>>     
>>>>>>>>> @@ -303,14 +342,11 @@ uvc_v4l2_release(struct file *file)
>>>>>>>>>     	struct video_device *vdev = video_devdata(file);
>>>>>>>>>     	struct uvc_device *uvc = video_get_drvdata(vdev);
>>>>>>>>>     	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
>>>>>>>>> -	struct uvc_video *video = handle->device;
>>>>>>>>> -
>>>>>>>>> -	uvc_function_disconnect(uvc);
>>>>>>>>>     
>>>>>>>>> -	mutex_lock(&video->mutex);
>>>>>>>>> -	uvcg_video_enable(video, 0);
>>>>>>>>> -	uvcg_free_buffers(&video->queue);
>>>>>>>>> -	mutex_unlock(&video->mutex);
>>>>>>>>> +	mutex_lock(&uvc->video.mutex);
>>>>>>>>> +	if (handle->connected)
>>>>>>>>> +		uvc_v4l2_disable(uvc);
>>>>>>>>> +	mutex_unlock(&uvc->video.mutex);
>>>>>>>>>     
>>>>>>>>>     	file->private_data = NULL;
>>>>>>>>>     	v4l2_fh_del(&handle->vfh);
> 

