Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5321034E397
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 10:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbhC3I4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 04:56:25 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:43839 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231512AbhC3I4P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 04:56:15 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RAARlTX7JgIC3RAAWlqJnI; Tue, 30 Mar 2021 10:56:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617094572; bh=JXsTvxNMPUfTJCAUiBSsBbIxN24S+QIllqw+MIROZKE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=D6JyFUf0kUv1oZksAIoC6mHHs/tyCSi2V8GOvnZT5qrJqLovZEXFGemn4Bkxzo/DR
         koLGFUp3rZw9iRc71wV3gOr8etXzjgPq3EdeUJCJisTxfBWXKYJYstotBwwiVtqAYn
         fsao5TMPD4KAytdOmsqKW37kFr/G5aO7wrMs1qpkbRGpbh2LCfOblmJ2htopmXUZwn
         +KqRsHF+gHUwMwUqreGJYBvZwX7cVD37yvEfSoUdStATWr6kbxXljFqJbzLDNc6Boo
         8NhGKyP32ZRKGUH9G2lple2lIGWTauLzUYOIVNhRQBA/8ve8XRs4sgecWAsXCKclyF
         owW1nCC4cdFmw==
Subject: Re: vb2_queue type question
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <b86d16cc-e3b1-0db3-f544-9f630572126c@ideasonboard.com>
 <67107267-69c8-d87d-6579-5e7dac0400fb@xs4all.nl>
 <a9325fd6-8f14-ced5-97c4-3d05dc7ab150@ideasonboard.com>
 <7abd695a-4a6d-e447-59d0-cf359c319a77@xs4all.nl>
 <0cea2812-7f04-e081-728c-8b39308ff0f9@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a964df70-612e-6ae3-a183-f1c34a1c4629@xs4all.nl>
Date:   Tue, 30 Mar 2021 10:56:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0cea2812-7f04-e081-728c-8b39308ff0f9@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ44RKKZ5UXqvyHDDnqPvDordhrvU4MwbczxaW2f69UxzAMw5zHVJ2+MXskXWC6VTSvCyXDhkeemYouvkEC1HWzcfusnI2Eji6FfbyLBoHYehcLTOS8e
 PjUHnOcOBMnMaPGrK758iOHadxzwOqjm0U8AsVNInPtISLz5pomUhOuirPNT9pMnEtrGOvqwTgbiVmRPHTcIA4Yg29fAsa/xBKIKznaAmuAl7khsi8lUl3rr
 HGygq29TqgFde10x53G+bnnOyjENmacxEVglQk0lpSQQk9OwHxsvaasYAjqX3v2oz3ApfBSwgM5UwAseIT/B7StDlQOCXgo84ZbHi6tPlfF7R0MxvApeFPR0
 wJvDy+ngQ4UfuEo8owUWaNF/cEywZa7kIyoBLmOTv12VBzPvNlEdgaNmAFdCV+x/J/r8o3oqQwvHxHgeqMWUiHbbtfr+Xw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/30/21 10:18 AM, Tomi Valkeinen wrote:
> Hi Hans,
> 
> On 26/03/2021 12:18, Hans Verkuil wrote:
> 
>> The only thing that you do is update the queue type when you set the
>> video or metadata format. When you start allocating buffers the queue type
>> of the last set format is used. At that moment any attempt to set the format
>> to another type will fail since vb2_is_busy(queue) will be true.
>>
>> So only the s_fmt ioctl will change the type. The g/try_fmt ioctls just must
>> keep working as-is.
> 
> I noticed that v4l2-compliance complains about this. It first tests the 
> format ioctls for both video and metadata buffers, and the last s_fmt is 
> for metadata. Then it tests buffer ioctls, and reqbufs for video buffers 
> fails as the queue is in metadata mode, not video mode.
> 
> I added a custom .vidioc_reqbufs function to the driver which sets the 
> queue type and then calls vb2_ioctl_reqbufs normally. This makes 
> v4l2-compliance pass.
> 
> But is that correct change, or should v4l2-compliance be changed?
> 
>   Tomi
> 

Good question.

So currently this is something that is rarely used. The few implementations
of this rely on the last set format to decide what the queue type will be.

But is this actually something you want? Wouldn't it be better to rely on the
queue type as passed with VIDIOC_REQBUFS/CREATE_BUFS? That's really the moment
where you lock in the queue type.

To do this you would have to make your own ioctl op:

int my_ioctl_reqbufs(struct file *file, void *priv,
                          struct v4l2_requestbuffers *p)
{
	struct video_device *vdev = video_devdata(file);

	if (p->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
	    p->type != V4L2_BUF_TYPE_META_CAPTURE)
		return -EINVAL;
	if (p->type != vdev->queue.type && vb2_queue_is_busy(vdev, file))
                return -EBUSY;
	vdev->queue.type = p->type;
	return vb2_ioctl_reqbufs(file, priv, p);
}

And ditto for create_bufs.

I think this makes more sense than relying on the format.

The reason it relied on the format was that the ivtv driver that introduced
this is old and only supports the read() interface. Since you cannot specify a type
when starting streaming that was the only way it could be implemented.

But for modern drivers it would be much better to lock it in when you request
buffers for the first time.

So vivid (the only other driver that supports this) has to be changed to use this
as well.

Regards,

	Hans
