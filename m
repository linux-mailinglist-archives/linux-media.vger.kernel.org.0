Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC0BA76228C
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 21:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbjGYTj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 15:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjGYTjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 15:39:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C77A26A2
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 12:39:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A1C4558;
        Tue, 25 Jul 2023 21:38:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690313916;
        bh=3wbMEz6EIUKlo6YPd0W2jZr/Ov+Z99zOc+DsvYLCy98=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d58HFA37GdAIRuM0MM2seTk+pTbXmhUV74AbDK2YkY2YXO6YW22kHJim6sCfmZv8+
         4bCYRHcb1l3IR7JLwnRAnDkHZs0ZU6KuWWN35SC3MeMV4RabXgAreK9vC387NpNVn1
         D5UiZ6s3fS9b2U1NdKsQ4tWBZaGYZka3lL/mSYDA=
Date:   Tue, 25 Jul 2023 22:39:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     hverkuil-cisco@xs4all.nl, Fabio Estevam <festevam@gmail.com>,
        sakari.ailus@linux.intel.com, rmfrfs@gmail.com,
        tharvey@gateworks.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] media: imx: imx7-media-csi: Fix applying format
 constraints
Message-ID: <20230725193942.GA433@pendragon.ideasonboard.com>
References: <20230720222543.1740198-1-festevam@gmail.com>
 <4522817.cEBGB3zze1@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4522817.cEBGB3zze1@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 21, 2023 at 07:48:52AM +0200, Alexander Stein wrote:
> Am Freitag, 21. Juli 2023, 00:25:43 CEST schrieb Fabio Estevam:
> > From: Fabio Estevam <festevam@denx.de>
> > 
> > v4l_bound_align_image() aligns to a multiple power of 2 of walign, but the
> > result only needs to be a multiple of walign.
> > 
> > This causes a 640x480 sensor that used to report:
> > 
> > 	Width/Height      : 640/480
> > 
> > to incorrectly report:
> > 
> > 	Width/Height      : 768/480
> > 
> > Fix this problem by doing the correct alignment via clamp_roundup().
> > 
> > Reported-by: Tim Harvey <tharvey@gateworks.com>
> > Fixes: 6f482c4729d9 ("media: imx: imx7-media-csi: Get rid of superfluous
> > call to imx7_csi_mbus_fmt_to_pix_fmt") Co-developed-by: Alexander Stein
> > <alexander.stein@ew.tq-group.com> Signed-off-by: Alexander Stein
> > <alexander.stein@ew.tq-group.com>
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> > Changes since v1:
> > - Export clamp_roundup().
> > 
> >  drivers/media/platform/nxp/imx7-media-csi.c | 4 ++--
> >  drivers/media/v4l2-core/v4l2-common.c       | 5 +++--
> >  include/media/v4l2-common.h                 | 2 ++
> >  3 files changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> > b/drivers/media/platform/nxp/imx7-media-csi.c index
> > 0bd2613b9320..f3c506fc19c4 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -1137,8 +1137,8 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format
> > *pixfmt, * TODO: Implement configurable stride support.
> >  	 */
> >  	walign = 8 * 8 / cc->bpp;
> > -	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
> > -			      &pixfmt->height, 1, 0xffff, 1, 0);
> > +	pixfmt->width = clamp_roundup(pixfmt->width, 1, 0xffff, walign);
> > +	pixfmt->height = clamp_roundup(pixfmt->height, 1, 0xffff, 1);
> > 
> >  	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
> >  	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c
> > b/drivers/media/v4l2-core/v4l2-common.c index bee1535b04d3..3e8c16bcb0f6
> > 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -106,8 +106,8 @@ static unsigned int clamp_align(unsigned int x, unsigned
> > int min, return x;
> >  }
> > 
> > -static unsigned int clamp_roundup(unsigned int x, unsigned int min,
> > -				   unsigned int max, unsigned int 
> alignment)
> > +unsigned int clamp_roundup(unsigned int x, unsigned int min,
> > +			   unsigned int max, unsigned int alignment)
> >  {
> >  	x = clamp(x, min, max);
> >  	if (alignment)
> > @@ -115,6 +115,7 @@ static unsigned int clamp_roundup(unsigned int x,
> > unsigned int min,
> > 
> >  	return x;
> >  }
> > +EXPORT_SYMBOL(clamp_roundup);
> > 
> >  void v4l_bound_align_image(u32 *w, unsigned int wmin, unsigned int wmax,
> >  			   unsigned int walign,
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index d278836fd9cb..7059b99f4afa 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -521,6 +521,8 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32
> > pixelformat, u32 width, u32 height);
> >  int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32
> > pixelformat, u32 width, u32 height);
> > +unsigned int clamp_roundup(unsigned int x, unsigned int min,
> > +			   unsigned int max, unsigned int alignment);
> > 
> >  /**
> >   * v4l2_get_link_freq - Get link rate from transmitter
> 
> I expect this to work, but I'm not so sure about exporting clamp_roundup().

I agree. The function name is too generic to be exported by V4L2. It
should be moved to include/linux/minmax.h (and the implementation to a
corresponding source file if it's too large to be inlined) if we want to
export it.

> I would rather use v4l2_apply_frmsize_constraints() instead, but this requires 
> additional work, refer to the TODO in imx7_csi_video_enum_framesizes().

That TODO is definitely outdated, it would be nice to address it. I'll
submit a patch.

> See also my first (broken) try in [1].
> 
> As a short term fix, using clamp_roundup() is okay to me. But I'm thinking 
> about using a copy of clamp_roundup() as in v1 instead,so to avoid an eventual 
> unexport of clamp_roundup in the future. Maybe this concern doesn't matter, I 
> guess the maintainers can tell.
> 
> Best regards,
> Alexander
> 
> [1] https://lore.kernel.org/linux-media/202307210050.s7hfCvwG-lkp@intel.com/T/
> #ma88811098cb96f3698a8248d903f0c3455febec7

-- 
Regards,

Laurent Pinchart
