Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6344E5548E4
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238207AbiFVKJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 06:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350246AbiFVKIi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 06:08:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2665F338B7
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 03:08:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90CF7DD;
        Wed, 22 Jun 2022 12:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655892515;
        bh=uyLEDzpHJiK7d1xC6rNYqpKD1M97yM2nLbgObOoBvo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DEarX+dg0OIXM6rHj6zU9bJgn3dPh97zDi3gxKg/tfmPynErWqu5W6b/+9LhagY4a
         quNP9Fk1aJbq2IWGM/FPSUgn+4jggYQW7q2B8XXIrYO9DPRi9yAZpGvQu2iPX/TVB7
         heNf4v6PSkNwTo8VBYKH9IGNGpkUCh5tD8oFc6LM=
Date:   Wed, 22 Jun 2022 13:08:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [PATCH 0/2] vb2: add (un)prepare_streaming vb2_queue ops
Message-ID: <YrLqFKJT2JxIX3e3@pendragon.ideasonboard.com>
References: <20220622093145.927377-1-hverkuil-cisco@xs4all.nl>
 <YrLkbMZYb/Jpdidv@pendragon.ideasonboard.com>
 <cda824da-723e-66eb-3773-883502a34fd1@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cda824da-723e-66eb-3773-883502a34fd1@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 22, 2022 at 12:00:58PM +0200, Hans Verkuil wrote:
> On 22/06/2022 11:44, Laurent Pinchart wrote:
> > On Wed, Jun 22, 2022 at 11:31:43AM +0200, Hans Verkuil wrote:
> >> Add support for two new (un)prepare_streaming queue ops that are called
> >> when the user calls VIDIOC_STREAMON and STREAMOFF (or closes the fh).
> >>
> >> This gives drivers a callback to validate the video pipeline and claim
> >> or release streaming resources at the time that userspace indicates
> >> that it wants to start streaming (VIDIOC_STREAMON) rather than when
> >> the actual DMA engine kicks in (the start_streaming callback). This
> >> is relevant for drivers that needs a minimum of X buffers before the
> >> DMA can start. The actual pipeline validation needs to happen sooner
> >> to avoid unnecessary errors at VIDIOC_QBUF time.
> >>
> >> As a bonus this allows us to move the horrible call to
> >> v4l_vb2q_enable_media_source() in vb2_core_streamon() to the au0828
> >> driver (currently the only driver that uses this feature).
> > 
> > Can we drop the horrible .enable_source() from media_device too ? :-)
> 
> The second patch helps a bit with that, at least it's out of vb2.
> 
> > 
> >> That call never belonged in vb2, but it had the same purpose as the
> >> new prepare_streaming op: validate the pipeline.
> >>
> >> This is a follow-up from my previous RFCv2:
> >>
> >> https://patchwork.linuxtv.org/project/linux-media/patch/ba4bca14-488f-94ea-48d9-e7343103c5aa@xs4all.nl/
> >>
> >> I would like to get consensus for this series.
> > 
> > I don't like it much. vb2 is already doing too much in my opinion,
> > growing it isn't the right way to fix it.
> 
> We disagree on that :-)

I like polite and constructive disagreements, they help moving forward
:-)

> > I'm still working on a new version of the V4L2 streams series that may
> > conflict with this, I'd propose discussing the two together.
> 
> What is the ETA for that? I don't mind waiting a few months, but if it
> takes a lot longer, then I'd rather merge this first so Eugen can use it
> in his atmel MC support. It's a kernel API, so it can always be changed
> or removed later.

I have a few other things to complete first, an dI plan to resume the
work in the first half of July, to post a v12 before the end of the
month.

> >> Hans Verkuil (2):
> >>   vb2: add (un)prepare_streaming queue ops
> >>   vb2/au0828: move the v4l_vb2q_enable_media_source to the au0828 driver
> >>
> >>  .../media/common/videobuf2/videobuf2-core.c   | 26 ++++++++++++++-----
> >>  drivers/media/usb/au0828/au0828-vbi.c         |  2 ++
> >>  drivers/media/usb/au0828/au0828-video.c       |  1 +
> >>  include/media/videobuf2-core.h                | 14 ++++++++++
> >>  4 files changed, 37 insertions(+), 6 deletions(-)

-- 
Regards,

Laurent Pinchart
