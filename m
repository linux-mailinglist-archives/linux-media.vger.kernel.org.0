Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8C834F841
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 07:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbhCaFWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 01:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbhCaFWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 01:22:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6621C061574
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 22:22:11 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84D988C4;
        Wed, 31 Mar 2021 07:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617168128;
        bh=KIjMvmaJEZGpjrSHxcahjaVHSYyfyQMv9Lprb0avMpE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=hxAlm863Jj9u2Czpx2zpWfbK4Ph0jrh/nRITehUPE/rhPlIwtHd7HTaYNW94LrKQw
         qog3zN5IXQQmmURT94eAqg4jblOlVZnFwDAzY8fxYmPVstcL7o8XAU5893i7axljcG
         TrE35WOrTi9rweEIv39DWBcgV3mo4RfoHHOTCem8=
Subject: Re: vb2_queue type question
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <b86d16cc-e3b1-0db3-f544-9f630572126c@ideasonboard.com>
 <67107267-69c8-d87d-6579-5e7dac0400fb@xs4all.nl>
 <a9325fd6-8f14-ced5-97c4-3d05dc7ab150@ideasonboard.com>
 <7abd695a-4a6d-e447-59d0-cf359c319a77@xs4all.nl>
 <0cea2812-7f04-e081-728c-8b39308ff0f9@ideasonboard.com>
 <a964df70-612e-6ae3-a183-f1c34a1c4629@xs4all.nl>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <6eae31f1-3293-c771-19b9-03835c564a1e@ideasonboard.com>
Date:   Wed, 31 Mar 2021 08:22:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a964df70-612e-6ae3-a183-f1c34a1c4629@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/03/2021 11:56, Hans Verkuil wrote:
> On 3/30/21 10:18 AM, Tomi Valkeinen wrote:
>> Hi Hans,
>>
>> On 26/03/2021 12:18, Hans Verkuil wrote:
>>
>>> The only thing that you do is update the queue type when you set the
>>> video or metadata format. When you start allocating buffers the queue type
>>> of the last set format is used. At that moment any attempt to set the format
>>> to another type will fail since vb2_is_busy(queue) will be true.
>>>
>>> So only the s_fmt ioctl will change the type. The g/try_fmt ioctls just must
>>> keep working as-is.
>>
>> I noticed that v4l2-compliance complains about this. It first tests the
>> format ioctls for both video and metadata buffers, and the last s_fmt is
>> for metadata. Then it tests buffer ioctls, and reqbufs for video buffers
>> fails as the queue is in metadata mode, not video mode.
>>
>> I added a custom .vidioc_reqbufs function to the driver which sets the
>> queue type and then calls vb2_ioctl_reqbufs normally. This makes
>> v4l2-compliance pass.
>>
>> But is that correct change, or should v4l2-compliance be changed?
>>
>>    Tomi
>>
> 
> Good question.
> 
> So currently this is something that is rarely used. The few implementations
> of this rely on the last set format to decide what the queue type will be.
> 
> But is this actually something you want? Wouldn't it be better to rely on the
> queue type as passed with VIDIOC_REQBUFS/CREATE_BUFS? That's really the moment
> where you lock in the queue type.
> 
> To do this you would have to make your own ioctl op:
> 
> int my_ioctl_reqbufs(struct file *file, void *priv,
>                            struct v4l2_requestbuffers *p)
> {
> 	struct video_device *vdev = video_devdata(file);
> 
> 	if (p->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> 	    p->type != V4L2_BUF_TYPE_META_CAPTURE)
> 		return -EINVAL;
> 	if (p->type != vdev->queue.type && vb2_queue_is_busy(vdev, file))
>                  return -EBUSY;
> 	vdev->queue.type = p->type;
> 	return vb2_ioctl_reqbufs(file, priv, p);
> }
> 
> And ditto for create_bufs.
> 
> I think this makes more sense than relying on the format.

Thanks! This works fine and I agree, it makes more sense.

  Tomi
