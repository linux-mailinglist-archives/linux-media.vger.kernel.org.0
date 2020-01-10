Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0C07136FF3
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 15:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgAJOuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 09:50:04 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:37113 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728056AbgAJOuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 09:50:04 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pvboinhX3pLtbpvbsiR9LC; Fri, 10 Jan 2020 15:50:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578667801; bh=tN86OgQCReKdsD5kIAkd7q9v8iG4Zay6Euw8wXF3a4I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dqSvoopp9XSdwUgN2FpoEKIIsnFUdefbz568utV49M467BjvCNEm4s3YaqD2s3kLV
         tNwz6dEV+PuawO8fZs/xp/TzQzXSC6OjMev5bRhKnya5AlR87uNCSIiClHuY2nXeli
         hCpcqux51WVrNL3/pGRqcFt98ZbdjfPhzqzux2F0nhsAmNT+ieNrsPLfjQpy1g2rBo
         rK25zmBJtOFgn6Ku1AyeQHVt2A6I1A73p8bEdHjijpITjyCqGVZLHeH00lX7naSzWn
         3Fg0Hmq8odJU/k2kZm+TeGUmU0ZeNwloEQ06+5bvpcFe1g0pJCXK90z3vfK2zSCUYE
         LL1BxdapJU8Fg==
Subject: Re: [PATCH] staging/vc04_services/bcm2835-camera: distinct numeration
 and names for devices
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Michael Kupfer <michael.kupfer@fau.de>, eric@anholt.net,
        wahrenst@gmx.net, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, mchehab+samsung@kernel.org,
        linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        daniela.mormocea@gmail.com, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-kernel@i4.cs.fau.de,
        Kay Friedrich <kay.friedrich@fau.de>
References: <20191206085432.19962-1-michael.kupfer@fau.de>
 <3db2350b-0a6d-0693-258c-9d47f71c0627@xs4all.nl>
 <CAPY8ntALS7Em42457fsHmUuQLD5vokKLc0RHn3a-T7amgS1Kvg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <da5ca5da-ca15-4545-0df0-27e27c72bac9@xs4all.nl>
Date:   Fri, 10 Jan 2020 15:49:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntALS7Em42457fsHmUuQLD5vokKLc0RHn3a-T7amgS1Kvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOXaGGwQ2xYr/57NxHzV+/My3su5ufZRpmW/rZR2ZXLhbDoiMhPyN1X0j7aT+iXMb9Cm6PkVr0UoLtr5zNWyQhz6D9EY9PcmvvWW4MvKfZeKQdyywOUu
 JuKLFKBz1NRllCTcMhzgw9s5Y6L4BNSbmGnDE/1fjwmzxuPf76lGlxNGwnPqs3NL5Xrro4Wj2FR8nA6fov7JiEuwBxorKZY4bO42qSn4h0m6jKuC8FOfVlfs
 VmMQoKPoKdzsYo45SR3UyalSexbnfc+PBherVVP/ARUubBC9ynkmFkhWs7Tt5Iihtz1KZ27RfNBjHfg9SGly8/iiodq6wZEJh6am7CINN8g0s7l5Vo7M5fV5
 dfrlestdAKZFkXNjb+5AA+MOjNpX28oVyIuwCj0oOhVAq3mr6MJrF4L58mNpGra/GIqKpdYngE8QS8BLHYLksdkWg2yBC/KH4D5VSGm5C2UALq/Y7F5UBbWS
 WhENvu1lV4fiyJqQqi2K2CtSfj+Qvf8kcPa9DUQHqFQHrZGUg7JOZc+DUk+b7h88NkaDCU8Vz5Cb0lVWdm9cplFy5PNV35MEvgO9f3qmsCVPp3og0AU+hGuq
 QS6GcfUfSfrFiaVHd5OfTLVZLl0+junyofkq0DQ8qK5yU2glhyD82blxdJ6sIYnGt2uMzG9zOmv5DUiYW6T9kOq5Odp6U1jt6pRHafwIMbOlfMVJ8MwuCwQG
 phGv/vAAOuWgbtKAig2t/JAkjYafZXj91DISBUGSUnQT6nSN9IbxRwYWRkXo6Ss4vwR47sHAqHtwrB7lUaVPYf/2IiPiTohjECpUjoADnvctEjK6GNLBUTY2
 lclKTdoNJKAxWmk1tK4XpKD8ArDA+kNWZ3RjuxZQTw0AuIzeguBp/MNYGQUAcP3S5Uyw0L9YJkeYHOtZfwqeT1XvVIkWEQ37I/3ywGl/gi3TXKAhZOBo1/Q9
 hA0s2GCEP26jFmCof7woduVxLklsUR+CCb4bLqGyTFs07DdO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/10/20 3:35 PM, Dave Stevenson wrote:
> Hi Hans
> 
> On Fri, 10 Jan 2020 at 13:25, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Hi Michael, Kay,
>>
>> On 12/6/19 9:54 AM, Michael Kupfer wrote:
>>> Create a static atomic counter for numerating cameras.
>>> Use the Media Subsystem Kernel Internal API to create distinct
>>> device-names, so that the camera-number (given by the counter)
>>> matches the camera-name.
>>>
>>> Co-developed-by: Kay Friedrich <kay.friedrich@fau.de>
>>> Signed-off-by: Kay Friedrich <kay.friedrich@fau.de>
>>> Signed-off-by: Michael Kupfer <michael.kupfer@fau.de>
>>> ---
>>>  .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
>>> index beb6a0063bb8..be5f90a8b49d 100644
>>> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
>>> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
>>> @@ -60,6 +60,9 @@ MODULE_PARM_DESC(max_video_width, "Threshold for video mode");
>>>  module_param(max_video_height, int, 0644);
>>>  MODULE_PARM_DESC(max_video_height, "Threshold for video mode");
>>>
>>> +/* camera instance counter */
>>> +static atomic_t camera_instance = ATOMIC_INIT(0);
>>> +
>>>  /* global device data array */
>>>  static struct bm2835_mmal_dev *gdev[MAX_BCM2835_CAMERAS];
>>>
>>> @@ -1870,7 +1873,6 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
>>>
>>>               /* v4l2 core mutex used to protect all fops and v4l2 ioctls. */
>>>               mutex_init(&dev->mutex);
>>> -             dev->camera_num = camera;
>>>               dev->max_width = resolutions[camera][0];
>>>               dev->max_height = resolutions[camera][1];
>>>
>>> @@ -1886,8 +1888,9 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
>>>               dev->capture.fmt = &formats[3]; /* JPEG */
>>>
>>>               /* v4l device registration */
>>> -             snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
>>> -                      "%s", BM2835_MMAL_MODULE_NAME);
>>> +             dev->camera_num = v4l2_device_set_name(&dev->v4l2_dev,
>>> +                                                    BM2835_MMAL_MODULE_NAME,
>>> +                                                    &camera_instance);
>>>               ret = v4l2_device_register(NULL, &dev->v4l2_dev);
>>>               if (ret) {
>>>                       dev_err(&pdev->dev, "%s: could not register V4L2 device: %d\n",
>>>
>>
>> Actually, in this specific case I would not use v4l2_device_set_name().
>>
>> Instead just use:
>>
>>                 snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
>>                          "%s-%u", BM2835_MMAL_MODULE_NAME, camera);
>>
>> It would be even better if there would be just one top-level v4l2_device used
>> for all the camera instances. After all, there really is just one platform
>> device for all of the cameras, and I would expect to see just a single
>> v4l2_device as well.
>>
>> It doesn't hurt to have multiple v4l2_device structs, but it introduces a
>> slight memory overhead since one would have been sufficient.
> 
> Doesn't that make all controls for all cameras common? The struct
> v4l2_ctrl_handler is part of struct v4l2_device.
> 
> Or do we:
> - ditch the use of ctrl_handler in struct v4l2_device
> - create and initialise a ctrl_handler per camera on an internal
> structure so we retain the control state
> - assign ctrl_handler in struct v4l2_fh to it every time a file handle
> on the device is opened?

You can set ctrl_handlers at three levels: v4l2_device (common to all
video devices), video_device (specific to a single video device), or
for v4l2_fh (specific to that filehandle only).

In this case you would assign it to the video_device:

	dev->vdev.ctrl_handler = &dev->ctrl_handler;

> 
> And if we only have one struct v4l2_device then is there the
> possibility of the unique names that Michael and Kay are trying to
> introduce?
> 
> I'm a little confused as to whether there really is a gain in having a
> single v4l2_device. In this case the two cameras are independent
> devices, even if they are loaded by a single platform driver.

There probably is little to no gain. Hence my proposal to just stick the
camera index after the module name.

Regards,

	Hans

> 
>   Dave
> 
>> v4l2_device_set_name() is meant for pci-like devices. And it really
>> is a bit overkill to have it as a helper function.
>>
>> Regards,
>>
>>         Hans

