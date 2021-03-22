Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB772343D5F
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 11:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbhCVKA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 06:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhCVKAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 06:00:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C14AC061762
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 03:00:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82CB6AD6;
        Mon, 22 Mar 2021 11:00:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616407211;
        bh=dvk/i0Lw7Di7TAe6y1erjsyHKg8/wZVhsKV0TYC49O4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oy1W47C4++xjz+XqAwjDIubgTz42pYch4KrkbfTCwjdu3uP/l3qyVB3YP8xxC/J3p
         u+it9YnKxSHui/faVX4jwLJG8+UTS6k4SS98ejh0FyEJKEdt/j9UneQ/BM5BFStly1
         PJSgS+6degDT/POK7f3YQ6hMgLvT3AcMyevne1yY=
Date:   Mon, 22 Mar 2021 11:59:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: vb2_queue type question
Message-ID: <YFhqg4Ux5p9LLTPO@pendragon.ideasonboard.com>
References: <b86d16cc-e3b1-0db3-f544-9f630572126c@ideasonboard.com>
 <67107267-69c8-d87d-6579-5e7dac0400fb@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67107267-69c8-d87d-6579-5e7dac0400fb@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Mar 22, 2021 at 10:49:26AM +0100, Hans Verkuil wrote:
> On 22/03/2021 10:18, Tomi Valkeinen wrote:
> > Hi Hans,
> > 
> > We were discussing this with Laurent and Sakari, I thought I'd ask if 
> > you have any feedback on this.
> > 
> > struct vb2_queue has 'type' field, so you can only use a queue for 
> > buffers of a single type. struct video_device has 'queue' field, so you 
> > can only use a single queue for a video_device instance.
> > 
> > TI's SoCs have a CSI-2 receiver, with a bunch of DMA engines. The HW 
> > doesn't care if we are currently capturing pixel buffers or metadata 
> > buffers (I don't have experience with other HW, but I imagine this 
> > shouldn't be a rare case). However, due to vb2_queue, the driver needs 
> > to decide which one to support, which limits the possible use cases.
> > 
> > I was browsing the code, and afaics the type field doesn't do much. It 
> > is, of course, used to reject queuing buffers of wrong type, and also 
> > (mostly in mem-2-mem code) to find out if functions are called in input 
> > or output context.
> > 
> > The latter one could be easily removed by just comparing the given queue 
> > pointer to a stored pointer (e.g. queue == priv->input_queue).
> > 
> > Do you see any problems if we were to change the type field to 
> > type_mask, allowing multiple buffer types per queue? Or even remove the 
> > vb2_queue->type. This raises some questions, like should a queue contain 
> > only buffers of a single type or can it contain a mix of buffers (I 
> > think it shouldn't contain a mix of buffers), or can a queue's type_mask 
> > contain both input and output types (I don't see why not).
> > 
> > An alternate which I tried was creating two vb2_queues, and switching 
> > the video_device->queue at runtime based on set_format. It kind of 
> > works, but I think the behavior is a bit unclear, and it might be 
> > difficult to catch all the corner cases.
> 
> A vb2_queue basically represents a buffer queue that will be fed to a
> DMA engine. It assumes that all the buffers are of the same format,
> which typically is tied directly to the type.
> 
> The type of a vb2_queue can be changed if you like, but once buffers
> are allocated it is fixed and can't be changed again until all buffers
> are released. So you can't mix buffers of different types.
> 
> This is actually done in the vivid driver: see vidioc_s_fmt_vbi_cap()
> and vidioc_s_fmt_sliced_vbi_cap(): depending on the format the queue
> type will be set to either capture raw or sliced VBI.
> 
> The ivtv driver does the same thing.
> 
> So as long as vb2_is_busy() returns false, you are free to change the
> queue type.
> 
> There is no need for a type_mask or anything like that. That's up to
> the bridge driver to check. The vb2_queue type is there to ensure that
> userspace isn't trying to mix buffers of different types, but as long
> as no buffers are allocated it doesn't do anything and you are free to
> change it.

I wasn't aware of this design rationale. It would be useful to expand
the documentation of vb2_queue.type to document this. Or have I missed a
different location where this is already explained ?

-- 
Regards,

Laurent Pinchart
