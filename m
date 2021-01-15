Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3EB2F780C
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 12:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbhAOLyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 06:54:23 -0500
Received: from mout02.posteo.de ([185.67.36.66]:38997 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbhAOLyW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 06:54:22 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 7817C240104
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 12:53:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1610711605; bh=wFiGnXOfdgemdw3cLiBkBiaPORq2FCw1mtkWWij2jas=;
        h=Date:From:To:Cc:Subject:From;
        b=daSal/CzKEknLhQhPS3TUjGQpZLBfTKUp5q9nWg9cS1GktpWBObYBbgul2hsezhAu
         89I7Yn1i2mlN2A5ArI6y267A1ER9DEBCRTphVc028Ya+Klux9fk57niwkNax51EaM3
         SDUwtxa19QqrGDkv4fz8B/lan/eCxW2+xgUQwpWH80ryk0WzKWvjqYZODF9xc1IYNv
         WPzNDxqDpsTzIjiYgjDYs8u7LPiLYVAWA+u7d+CHJMyRd5Lk92BzyCUAdfjt87QHJL
         AXkv1ZwL5vXHfq7M74vyx2cqYspgmLXeY7t1Jn4OjyYLceIQMaXjzLn5dgtuOLRK57
         lvDWvGBmRNDmg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DHKM86qJ9z6tn0;
        Fri, 15 Jan 2021 12:53:24 +0100 (CET)
Date:   Fri, 15 Jan 2021 12:53:24 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org
Subject: Failing V4l2-compliance test with a sensor driver
Message-ID: <20210115115324.glhnixqafh2jakw4@basti-TUXEDO-Book-XA1510>
Reply-To: Sebastian Fricke <sebastian.fricke@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I believe you are the creator of v4l2-compliance, right? My hope is that you might be able to lead me in the right direction.
I am currently finishing up a sensor driver that I ported from a downstream kernel. And I try to clear up the last compliance error:

```
     info: checking control event 'User Controls' (0x00980001)
     VIDIOC_SUBSCRIBE_EVENT returned -1 (Inappropriate ioctl for device)
     fail: v4l2-test-controls.cpp(818): subscribe event for control 'User Controls' failed
test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
```

I notice that it calls a normal v4l2 ioctl on my subdevice. I implemented the event handling just like I was able to find in other devices like:
imx219, imx355, ov2640 by adding:

```
#include <media/v4l2-event.h>
...
	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
		     V4L2_SUBDEV_FL_HAS_EVENTS;
...
static const struct v4l2_subdev_core_ops ov13850_core_ops = {
     ...
	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
	.unsubscribe_event = v4l2_event_subdev_unsubscribe
     ...
```

Am I supposed to correct that error, or asked in another way is it actually an error when a subdevice doesn't implement VIDIOC_SUBSCRIBE_EVENT?
Additionally, I noticed that the compliance check doesn't look at my VIDIOC_SUBDEV_G_SELECTION implementation but instead searches for any implementation of the VIDIOC_G_SELECTION ioctl.

I invoked the compliance test with:

v4l2-compliance -u /dev/v4l-subdev3 -v -T

My current code can be located here: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/fix_subscribe_event_user_controls/drivers/media/i2c/ov13850.c

Greetings and thanks in advance,
Sebastian
