Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2DA96C91AD
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 00:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjCYXM1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 19:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCYXM1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 19:12:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C7BAF2C
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 16:12:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A50D558;
        Sun, 26 Mar 2023 00:12:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679785943;
        bh=1YcVaBYwlc/K87fRaeVrp90xrR8RH7TvudJ+tGgSS8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W1PFnEJGEuQeyj6cw+GRBSp0T4Zz0TpihQnL3lOjfKHQ2NBEdN6mJhRVrtw3NMR/8
         d/eAPY49GytHBiTu4sfURSuwMDZLUCrHvqx02XfWxpZUlgvlh0omauXXUaBCENOVOY
         VxJ/sMLck5Ct8VZYqwoovhpDxGAXK/Hd+R4HANrs=
Date:   Sun, 26 Mar 2023 01:12:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     adam@piggz.co.uk, linux-media@vger.kernel.org,
        yong.deng@magewell.com, mchehab@kernel.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] media: sun6i-csi: implement vidioc_enum_framesizes
Message-ID: <20230325231229.GH22214@pendragon.ideasonboard.com>
References: <20230106194038.16018-1-adam@piggz.co.uk>
 <20230106194038.16018-4-adam@piggz.co.uk>
 <Y7iwR3W5RiQ2K+Ip@pendragon.ideasonboard.com>
 <Y/XxuqtQ+RiANngZ@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/XxuqtQ+RiANngZ@aptenodytes>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Wed, Feb 22, 2023 at 11:43:06AM +0100, Paul Kocialkowski wrote:
> On Sat 07 Jan 23, 01:35, Laurent Pinchart wrote:
> > On Fri, Jan 06, 2023 at 07:40:38PM +0000, adam@piggz.co.uk wrote:
> > > From: Adam Pigg <adam@piggz.co.uk>
> > > 
> > > Create sun6i_csi_capture_enum_framesizes which defines the min
> > > and max frame sizes
> > 
> > With the commit message updated (see review of 1/3),
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I'm always a bit confused regarding how such an ioctl's behavior should depend
> on the attached subdev. Is it well-defined behavior that this here is only
> about the receiver part and has nothing to do with what the connected sensor?

That's right. For MC-based drivers, enumerating pixel formats and frame
sizes on a video node should return the formats and sizes intrinsically
supported by the video node (in most cases, that maps to the DMA engine
at the hardware level) without considering connected subdevs.

> > > Signed-off-by: Adam Pigg <adam@piggz.co.uk>
> > > ---
> > >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 24 +++++++++++++++++++
> > >  1 file changed, 24 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > index 54beba4d2b2f..2be761e6b650 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > @@ -739,6 +739,29 @@ static int sun6i_csi_capture_try_fmt(struct file *file, void *private,
> > >  	return 0;
> > >  }
> > >  
> > > +static int sun6i_csi_capture_enum_framesizes(struct file *file, void *fh,
> > > +					  struct v4l2_frmsizeenum *fsize)
> 
> A cosmetic/consistency suggestion would be to name this variable "frmsize" to
> reuse part of the name of the structure, which is what I've done in other places
> of the driver.
> 
> > > +{
> > > +	const struct sun6i_csi_capture_format *format;
> > > +
> > > +	if (fsize->index > 0)
> > > +		return -EINVAL;
> > > +
> > > +	format = sun6i_csi_capture_format_find(fsize->pixel_format);
> > > +	if (!format)
> > > +		return -EINVAL;
> > > +
> > > +	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> > > +	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
> > > +	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
> > > +	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
> > > +	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
> > > +	fsize->stepwise.step_width = 1;
> > > +	fsize->stepwise.step_height = 1;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int sun6i_csi_capture_enum_input(struct file *file, void *private,
> > >  					struct v4l2_input *input)
> > >  {
> > > @@ -775,6 +798,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
> > >  	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
> > >  	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
> > >  	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
> > > +	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesizes,
> > >  
> > >  	.vidioc_enum_input		= sun6i_csi_capture_enum_input,
> > >  	.vidioc_g_input			= sun6i_csi_capture_g_input,

-- 
Regards,

Laurent Pinchart
