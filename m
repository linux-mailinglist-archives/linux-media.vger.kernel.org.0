Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B8E343D36
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 10:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhCVJuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 05:50:02 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38165 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229591AbhCVJte (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 05:49:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OHBeluXCW4XAGOHBilWqBh; Mon, 22 Mar 2021 10:49:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616406570; bh=zxpZdfjpp2wC4Vt8yXNHkQXu13q2goq+gbdf9GQO9hM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pMq6hV5QI/knXiyod3/sus82CNdf3zMK+T3i+JJ5RHNYZdwlDg2CBjuOYFjgEdIk1
         ghzy3UJ03sUTeW/VV/1/XsB+kdloe1jT6Zs5By6foxpXwhD9pJXj3CVWYUkvYqX2qv
         0o8WH0QZdxz0G6GeHYoRHiT+V5mOOhM8mY6Cw8lnShxBvmC4Enfr9yBg8rf1P2sQeN
         HOfmqYhWmO37PHe7fPRKmshjAbP/ZXusC1HxXeIZQpPLaXAz9SxZT+/K8iOE4E5V+v
         EerIdBoF3HuvVuMG58g16j+Y3nKJbFyzIasnU0YjocB+OPewpb5f591eZyMgSJWLvE
         uVDj6aUQgDe6A==
Subject: Re: vb2_queue type question
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <b86d16cc-e3b1-0db3-f544-9f630572126c@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <67107267-69c8-d87d-6579-5e7dac0400fb@xs4all.nl>
Date:   Mon, 22 Mar 2021 10:49:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b86d16cc-e3b1-0db3-f544-9f630572126c@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfG8GZU/UNXdbwgddbFH6KjaA4qJ9JVyyuXjTmwLjaZdXbczhtRjKOqch2aME5VQPcJoCZqE9qKWvw4F6ceeSRup4265ZcVquZ2nZhFNzY62DlgaUsC1x
 3aqJ2X7+LKFp2rlYQFdEh2QcFpJWSr90i8SEDQRsZLUk6lcW/FqMhLH5bwo4iQzQ2UzxIdhoJmEtL00f1ApWB+TYUxBy/N7QYYbZLJP4A4Ht6BRbR+YbKJDt
 9aalEqIEk9xpp9Yk9boTqdmmFb8SB1p8IA/VbdIkhTZYFRfUoYjKjLRTzNw1vbgeGaDdfKqfoPVMYJ3CmIgmS6LyvzFEfkkisr0uiJ9T7kg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/03/2021 10:18, Tomi Valkeinen wrote:
> Hi Hans,
> 
> We were discussing this with Laurent and Sakari, I thought I'd ask if 
> you have any feedback on this.
> 
> struct vb2_queue has 'type' field, so you can only use a queue for 
> buffers of a single type. struct video_device has 'queue' field, so you 
> can only use a single queue for a video_device instance.
> 
> TI's SoCs have a CSI-2 receiver, with a bunch of DMA engines. The HW 
> doesn't care if we are currently capturing pixel buffers or metadata 
> buffers (I don't have experience with other HW, but I imagine this 
> shouldn't be a rare case). However, due to vb2_queue, the driver needs 
> to decide which one to support, which limits the possible use cases.
> 
> I was browsing the code, and afaics the type field doesn't do much. It 
> is, of course, used to reject queuing buffers of wrong type, and also 
> (mostly in mem-2-mem code) to find out if functions are called in input 
> or output context.
> 
> The latter one could be easily removed by just comparing the given queue 
> pointer to a stored pointer (e.g. queue == priv->input_queue).
> 
> Do you see any problems if we were to change the type field to 
> type_mask, allowing multiple buffer types per queue? Or even remove the 
> vb2_queue->type. This raises some questions, like should a queue contain 
> only buffers of a single type or can it contain a mix of buffers (I 
> think it shouldn't contain a mix of buffers), or can a queue's type_mask 
> contain both input and output types (I don't see why not).
> 
> An alternate which I tried was creating two vb2_queues, and switching 
> the video_device->queue at runtime based on set_format. It kind of 
> works, but I think the behavior is a bit unclear, and it might be 
> difficult to catch all the corner cases.

A vb2_queue basically represents a buffer queue that will be fed to a
DMA engine. It assumes that all the buffers are of the same format,
which typically is tied directly to the type.

The type of a vb2_queue can be changed if you like, but once buffers
are allocated it is fixed and can't be changed again until all buffers
are released. So you can't mix buffers of different types.

This is actually done in the vivid driver: see vidioc_s_fmt_vbi_cap()
and vidioc_s_fmt_sliced_vbi_cap(): depending on the format the queue
type will be set to either capture raw or sliced VBI.

The ivtv driver does the same thing.

So as long as vb2_is_busy() returns false, you are free to change the
queue type.

There is no need for a type_mask or anything like that. That's up to
the bridge driver to check. The vb2_queue type is there to ensure that
userspace isn't trying to mix buffers of different types, but as long
as no buffers are allocated it doesn't do anything and you are free to
change it.

Regards,

	Hans
