Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2755548C3
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241794AbiFVJob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbiFVJoa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:44:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B811A186C0
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:44:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35816DD;
        Wed, 22 Jun 2022 11:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655891068;
        bh=lQ2vzZDEJxvKUBtDn9CHk8IfP7niBL80uBurkmqa39c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EZcFHI4m5lr8zSTeJq4pXqXxCVZvinYyPWf41GgRZqM1R6DWMy6heOEIQZBmHzhCf
         iGoy/qUv7KiTCaQXtJ49FKIB/zkDD2SUVN310VKQDzR/OK2X27YdV9EnsEL9OPKxrQ
         DIP9pMNV/j52uGxvcsITN6SSD6XPGbP+lUlnz93c=
Date:   Wed, 22 Jun 2022 12:44:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [PATCH 0/2] vb2: add (un)prepare_streaming vb2_queue ops
Message-ID: <YrLkbMZYb/Jpdidv@pendragon.ideasonboard.com>
References: <20220622093145.927377-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220622093145.927377-1-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 22, 2022 at 11:31:43AM +0200, Hans Verkuil wrote:
> Add support for two new (un)prepare_streaming queue ops that are called
> when the user calls VIDIOC_STREAMON and STREAMOFF (or closes the fh).
> 
> This gives drivers a callback to validate the video pipeline and claim
> or release streaming resources at the time that userspace indicates
> that it wants to start streaming (VIDIOC_STREAMON) rather than when
> the actual DMA engine kicks in (the start_streaming callback). This
> is relevant for drivers that needs a minimum of X buffers before the
> DMA can start. The actual pipeline validation needs to happen sooner
> to avoid unnecessary errors at VIDIOC_QBUF time.
> 
> As a bonus this allows us to move the horrible call to
> v4l_vb2q_enable_media_source() in vb2_core_streamon() to the au0828
> driver (currently the only driver that uses this feature).

Can we drop the horrible .enable_source() from media_device too ? :-)

> That call never belonged in vb2, but it had the same purpose as the
> new prepare_streaming op: validate the pipeline.
> 
> This is a follow-up from my previous RFCv2:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/ba4bca14-488f-94ea-48d9-e7343103c5aa@xs4all.nl/
> 
> I would like to get consensus for this series.

I don't like it much. vb2 is already doing too much in my opinion,
growing it isn't the right way to fix it.

I'm still working on a new version of the V4L2 streams series that may
conflict with this, I'd propose discussing the two together.

> Hans Verkuil (2):
>   vb2: add (un)prepare_streaming queue ops
>   vb2/au0828: move the v4l_vb2q_enable_media_source to the au0828 driver
> 
>  .../media/common/videobuf2/videobuf2-core.c   | 26 ++++++++++++++-----
>  drivers/media/usb/au0828/au0828-vbi.c         |  2 ++
>  drivers/media/usb/au0828/au0828-video.c       |  1 +
>  include/media/videobuf2-core.h                | 14 ++++++++++
>  4 files changed, 37 insertions(+), 6 deletions(-)

-- 
Regards,

Laurent Pinchart
