Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFD819B97
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 12:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfEJK1k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 06:27:40 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:49761 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727251AbfEJK1j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 06:27:39 -0400
Received: from [IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215] ([IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215])
        by smtp-cloud9.xs4all.net with ESMTPA
        id P2kahcrOcsDWyP2kbhbvfu; Fri, 10 May 2019 12:27:37 +0200
Subject: Re: [PATCH] media: v4l2-core: expose the device after it was
 registered.
To:     xinwu <xinwu.liu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        niklas.soderlund+renesas@ragnatech.se, ezequiel@collabora.com,
        sque@chromium.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1548146084-20445-1-git-send-email-xinwu.liu@intel.com>
 <20190122100311.isx57iktfpxawxjv@paasikivi.fi.intel.com>
 <85906cb2-5472-2c54-e854-136cba8e8d40@intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4da2cb55-f91f-0b19-9aff-3b25a8abea1a@xs4all.nl>
Date:   Fri, 10 May 2019 12:27:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <85906cb2-5472-2c54-e854-136cba8e8d40@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLg5Fn441PlVWM9qY41jX8Jk0ihuqripdXxRcFoCUBJs+x5smFIqQrwbAuMYrkgQWxwQVKuGYV37Q/BBBnhOvLtXMhwHY7gFOTeACjtpAwsENIAcwx0D
 WQtgbnCFJKDfNpNHlKgCUX5Eg7YNTgYvywO3QUr/06M0VBVcItrJYb7pMz+O+2fOTPK4xrnHOhwg0eZlDHMiacOsOJSLziEyNoYjMeVCs6cJ/1DF7Dv0swJg
 6oALbZb070XRqXih89dpiInZpR+lImnllCseEg4Ij9pWlYgydkOj3ITRHh6p6vNdgvOv8iPzbIbIiBMOpEvek+mIzcziThhil6/GSjoz86YbJlib8j/1yzu9
 wFrBTaKMjLYXZbs/uaFdHyRTKZteqITHoDFVdxpurX5Fk17sDTtFRbABmY+wVdEpH/dDiI07JqYPve775hkI1Nh+TVy4iIG+0yD7mh0uX9fYJ/DRvCKPDXKA
 K6t1XXw2J9a5YOSQSwq8DEljgQu7/hpmvUtef/6Tr2YuiCqt9o7tx5lc24EE0n/E9/NWBb9dCEVUXpUWWnPqFa3cbTfx1VIgkQtMfA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/24/19 8:11 AM, xinwu wrote:
> Hi Sakari,
> 
> Thanks for your response.
> 
> 
> On 2019年01月22日 18:03, Sakari Ailus wrote:
>> Hi Xinwu,
>>
>> On Tue, Jan 22, 2019 at 04:34:44PM +0800, Liu, Xinwu wrote:
>>> device_register exposes the device to userspace.
>>>
>>> Therefore, while the register process is ongoing, the userspace program
>>> will fail to open the device (ENODEV will be set to errno currently).
>>> The program in userspace must re-open the device to cover this case.
>>>
>>> It is more reasonable to expose the device after everythings ready.
>>>
>>> Signed-off-by: Liu, Xinwu <xinwu.liu@intel.com>
>>> ---
>>>   drivers/media/v4l2-core/v4l2-dev.c | 14 ++++++++------
>>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>>> index d7528f8..01e5cc9 100644
>>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>>> @@ -993,16 +993,11 @@ int __video_register_device(struct video_device *vdev,
>>>           goto cleanup;
>>>       }
>>>   -    /* Part 4: register the device with sysfs */
>>> +    /* Part 4: Prepare to register the device */
>>>       vdev->dev.class = &video_class;
>>>       vdev->dev.devt = MKDEV(VIDEO_MAJOR, vdev->minor);
>>>       vdev->dev.parent = vdev->dev_parent;
>>>       dev_set_name(&vdev->dev, "%s%d", name_base, vdev->num);
>>> -    ret = device_register(&vdev->dev);
>>> -    if (ret < 0) {
>>> -        pr_err("%s: device_register failed\n", __func__);
>>> -        goto cleanup;
>>> -    }
>>>       /* Register the release callback that will be called when the last
>>>          reference to the device goes away. */
>>>       vdev->dev.release = v4l2_device_release;
>>> @@ -1020,6 +1015,13 @@ int __video_register_device(struct video_device *vdev,
>>>       /* Part 6: Activate this minor. The char device can now be used. */
>>>       set_bit(V4L2_FL_REGISTERED, &vdev->flags);
>>>   +    /* Part 7: Register the device with sysfs */
>>> +    ret = device_register(&vdev->dev);
>>> +    if (ret < 0) {
>>> +        pr_err("%s: device_register failed\n", __func__);
>>> +        goto cleanup;
>> The error handling needs to reflect the change as well.
> 
> Yes, I think it need to clear the V4L2_FL_REGISTERED also.
>>
>> Speaking of which, the error handling appears to be somewhat broken here.
>> It should be fixed first before making changes to the registration order.
> 
> I guess you mean to call "put_device()" in this error handling.
>>
>> The problem the patch addresses is related to another problem: how to tell
>> the user space all devices in the media hardware complex have been
>> registered successfully. Order generally has been the node first, and only
>> then the entity. That suggests the order should probably be:
>>
>> 1. video_register_media_controller
>> 2. set_bit(V4L2_FL_REGISTERED)
>> 3. device_register
>>
>> I wonder what Hans thinks.

Sorry for the late reply, I missed this question.

The core problem is that video_register_device sets up all the internal
data structures *and* creates the device node. This should really be split up
(as is done in other subsystems) into an allocate that does everything except
create the device node, and a register that actually does that last step.

The lack of this separation means that a device that has to register multiple
devices can't have a consistent valid state before it starts registering
devices.

Compare it to drivers/media/cec/cec-core.c where this is done a lot better.

That said, it would be a huge job reworking this. Although it can be done
by creating new functions separate from the existing ones. E.g.:

int v4l2_dev_initialize(struct video_device *vdev);
int v4l2_dev_register(struct video_device *vdev);

v4l2_dev_initialize does everything except registering the device node. That's
done by v4l2_dev_register. This way drivers can initialize everything first,
ensuring a fully consistent state before actually registering the device nodes.

I think this would be very nice to have.

That said, for the current function I agree that the order should indeed be
changed according to the proposal. It's just doesn't address the full problem.

Regards,

	Hans

> 
> Yes, that's my suggestion, thanks for the highlight. I also want to know if it's worth to make this change.
>>
>>> +    }
>>> +
>>>       return 0;
>>>     cleanup:
> 

