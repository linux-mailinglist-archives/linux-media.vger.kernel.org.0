Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4802F785C
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 13:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbhAOMMW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 07:12:22 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:33067 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726045AbhAOMMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 07:12:22 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 0Nx2ldKnVCDpA0Nx5ldwPy; Fri, 15 Jan 2021 13:11:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610712700; bh=ZBSufZozwoXHpZ+DLmySdX10bHEHLI1hSKkXCinYiQs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uD3M7+GL7W7ShL/ED8lMqJkUA/XWTJXdUqsEID0+3ysxidjJh1g7LI1guCRTy0iO8
         BCE7xNtxD2ezS7cP4i5X+mmzLqjw2/8os3tGAjHe3LJI0oFJDj81NLoU0QxCzjZ3ew
         3O17STnx1jiS+3ohMb1zpNsvfeUy8rD+IE6xPaG/J4C5JdXR6FyG86rMyqg0xvWUCk
         4cQeoP+8Hcd8Lkh03HcRPSkprQwGZoDxvHKsXHeT7Do34ryD3zKK4a3Z224r1I0oz9
         7H0PVRc6Sa4fGlp9t7uAQPfxIZAlGo9JTeTVa1+mMPzyYHTLu08pBK+TlNE6wJNedO
         GqaZpaK/D5zsQ==
Subject: Re: Failing V4l2-compliance test with a sensor driver
To:     Sebastian Fricke <sebastian.fricke@posteo.net>
Cc:     linux-media@vger.kernel.org
References: <20210115115324.glhnixqafh2jakw4@basti-TUXEDO-Book-XA1510>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1821bd61-818f-5e1b-156a-3c72b2bca800@xs4all.nl>
Date:   Fri, 15 Jan 2021 13:11:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115115324.glhnixqafh2jakw4@basti-TUXEDO-Book-XA1510>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCYUpAdmgFmZ8J1Jz6HHT4ei/elNSVk7SJSxvqLyAws+cO+ineF0arNdrx4WydYscuP3nqqYi4sl6FFLw7HtmHio5dILuA2XbymOnebmTKhFWdVRvEbb
 QfAp7wmhXEJwVpd6hiTIarhp+suv8y+/ztKloWZ01QgJZXJGe8W4CpbSqfXJd6xt7YhZZbOQSx3mKxrPY/p+wBKUwg1VCKow87JrRxKfaVS8c8GLDw5pjDvJ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/01/2021 12:53, Sebastian Fricke wrote:
> Hello,
> 
> I believe you are the creator of v4l2-compliance, right? My hope is that you might be able to lead me in the right direction.
> I am currently finishing up a sensor driver that I ported from a downstream kernel. And I try to clear up the last compliance error:
> 
> ```
>      info: checking control event 'User Controls' (0x00980001)
>      VIDIOC_SUBSCRIBE_EVENT returned -1 (Inappropriate ioctl for device)

This returns ENOTTY, which is weird...

>      fail: v4l2-test-controls.cpp(818): subscribe event for control 'User Controls' failed
> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> ```
> 
> I notice that it calls a normal v4l2 ioctl on my subdevice. I implemented the event handling just like I was able to find in other devices like:
> imx219, imx355, ov2640 by adding:
> 
> ```
> #include <media/v4l2-event.h>
> ...
> 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> 		     V4L2_SUBDEV_FL_HAS_EVENTS;
> ...
> static const struct v4l2_subdev_core_ops ov13850_core_ops = {
>      ...
> 	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> 	.unsubscribe_event = v4l2_event_subdev_unsubscribe
>      ...
> ```

...since this looks exactly as it should be.

> 
> Am I supposed to correct that error, or asked in another way is it actually an error when a subdevice doesn't implement VIDIOC_SUBSCRIBE_EVENT?

Yes, it is an error if subscribe_event isn't implemented, but you DO have controls in your driver.

Are you compiling v4l2-compliance from the git repo? You shouldn't use the version packages by distros since that is typically much too old.

I can't give support either if you are using an old version.

> Additionally, I noticed that the compliance check doesn't look at my VIDIOC_SUBDEV_G_SELECTION implementation but instead searches for any implementation of the VIDIOC_G_SELECTION ioctl.

It shouldn't, at least v4l2-test-subdevs.cpp only uses VIDIOC_SUBDEV_G_SELECTION.

Regards,

	Hans

> 
> I invoked the compliance test with:
> 
> v4l2-compliance -u /dev/v4l-subdev3 -v -T
> 
> My current code can be located here: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/fix_subscribe_event_user_controls/drivers/media/i2c/ov13850.c
> 
> Greetings and thanks in advance,
> Sebastian
> 

