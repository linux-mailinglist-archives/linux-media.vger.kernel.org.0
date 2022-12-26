Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC3D6563A9
	for <lists+linux-media@lfdr.de>; Mon, 26 Dec 2022 15:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbiLZO4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Dec 2022 09:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiLZO4J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Dec 2022 09:56:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3818BB5E;
        Mon, 26 Dec 2022 06:56:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05DD374C;
        Mon, 26 Dec 2022 15:56:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672066566;
        bh=iRvGe7PN64w4/wi6OhpkJghApwcdiWZpKZJWzgXnu5I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vqTLOwopoX+Q4p6hM57USSoPSLN8K/RoomKwkqUcXmBy9uwGMsyyrPu7QCgd+TYBC
         kU43F8HlL9mVZ8WM/MTnnpxwKu8Paw7o2wXEbqWdc/B2Hlip/omjLooUVejmLAUZy2
         JRn7qT69ELlbQmWwiUNwSz91zyIRM9mTu8ZtiGU0=
Date:   Mon, 26 Dec 2022 16:56:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Dave Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 0/7] media/drm: renesas: Add new pixel formats
Message-ID: <Y6m2AqlDdmcgCk8F@pendragon.ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

(CC'ing Daniel and Dave)

On Wed, Dec 21, 2022 at 11:24:41AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Hi,
> 
> These add new pixel formats for Renesas V3U and V4H SoCs.
> 
> As the display pipeline is split between DRM and V4L2 components, this
> series touches both subsystems. I'm sending all these together to
> simplify review. If needed, I can later split this to V4L2 and DRM
> parts, of which the V4L2 part needs to be merged first.

As the changes on the DRM side are small and shouldn't conflict with
anything else queued for v6.3, it would be easier to merge the whole
series through the media tree. Daniel, Dave, would you be OK with that ?
If so, could you please ack patches 6/7 and 7/7 ?

> Changes in v3:
> - Addressed all the review comments
> - Added Y212
> - Updated the kernel docs for the new formats
> - Changed the RGB format names to match the DRM's format names
> - Updated RPF register field macros according to the comments
> 
>  Tomi
> 
> Tomi Valkeinen (7):
>   media: Add 2-10-10-10 RGB formats
>   media: Add Y210, Y212 and Y216 formats
>   media: renesas: vsp1: Change V3U to be gen4
>   media: renesas: vsp1: Add V4H SoC version
>   media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210, Y212)
>   drm: rcar-du: Bump V3U to gen 4
>   drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)
> 
>  .../media/v4l/pixfmt-packed-yuv.rst           |  49 ++++-
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  30 +++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  50 ++++-
>  .../media/platform/renesas/vsp1/vsp1_drv.c    |   4 +-
>  .../media/platform/renesas/vsp1/vsp1_hgo.c    |   4 +-
>  .../media/platform/renesas/vsp1/vsp1_lif.c    |   1 +
>  .../media/platform/renesas/vsp1/vsp1_pipe.c   |  18 ++
>  .../media/platform/renesas/vsp1/vsp1_regs.h   |  26 ++-
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    |  64 +++++-
>  .../media/platform/renesas/vsp1/vsp1_video.c  |   4 +-
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    |   4 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   6 +
>  include/uapi/linux/videodev2.h                |  11 +
>  15 files changed, 447 insertions(+), 20 deletions(-)

-- 
Regards,

Laurent Pinchart
