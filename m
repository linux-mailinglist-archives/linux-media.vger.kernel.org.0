Return-Path: <linux-media+bounces-28612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF899A6D621
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613C916E845
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C589E25D213;
	Mon, 24 Mar 2025 08:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wmMxXL+g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EDFC8E0;
	Mon, 24 Mar 2025 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742804882; cv=none; b=Kj81A9zVD6yIPYK1XGQRjyEN5JACzarUfu3CvPB/wzlWzDfdNQwon/B4QCirym4cEXu6JTgcaT3VRERqjOn1mKna93h0B3Jyo4NtqJhHtRzp+vm21+MwB6mf0r2mFmvTUsTzhYWx1bpmSEj91geOMS/vNtyFw+bIc4l3dbo323U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742804882; c=relaxed/simple;
	bh=zcYb0OpQftPm6DoERO+Loz4whE/31dcHpgCuk6D/aDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiQgKKD4U05lUdVcDe47KlPFOXoCjUePk/8j6nmP2VsJv/eIbCT7zKutdbTD3+OwAee4Q9zD7/5dTk4aacM5XYdGGw1up0fvO9i/Mvv0Z3iHJXMxzH4iAzT8Uif9vajgklWa8edXacBSiHHAvjNsOl5zIh/CXjq3AgEGZg2oisQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wmMxXL+g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2B7663F;
	Mon, 24 Mar 2025 09:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742804772;
	bh=zcYb0OpQftPm6DoERO+Loz4whE/31dcHpgCuk6D/aDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wmMxXL+gokvbN5KmMl8Jg5W/LRtbYF0qYwz2iYMGLtavzo/P0aI/8w7jIFZBEKD1D
	 0Pj5lHAILBA/rpqo3IFpsqRGqyBtBKDM/fMTRBBMufwTv21SCrNhSR39s7ul3pFVr1
	 dtyZrO/I3xckPK+PEAmzKCz0fwK8sxMsTBhci30o=
Date: Mon, 24 Mar 2025 09:27:56 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	niklas soderlund <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v6 7/7] media: vsp1: pipe: Add RAW Bayer formats mapping
Message-ID: <dkatmlnysvsy3g4n3m53bzxcqx4avklzfctxgjv4hl6sd7fte3@vlfsvasn53d7>
References: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
 <20250321-v4h-iif-v6-7-361e9043026a@ideasonboard.com>
 <20250321215634.GB11255@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321215634.GB11255@pendragon.ideasonboard.com>

Hi Laurent

On Fri, Mar 21, 2025 at 11:56:34PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Fri, Mar 21, 2025 at 04:45:39PM +0100, Jacopo Mondi wrote:
> > Add formats definition for RAW Bayer formats in vsp1_pipe.c.
> >
> > 8-bits RAW Bayer pixel formats map on VSP format RGB332.
>
> s/map on/map to/
>
> > 10, 12 and 16 bits RAW Bayer pixel formats map on RGB565 insted.
> >
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> > v3->v4:
> > - Fix SWAP bits for RAW 10, 12 and 16
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 72 ++++++++++++++++++++++++-
> >  1 file changed, 71 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > index 8e9be3ec1b4d..a51061738edc 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > @@ -30,10 +30,80 @@
> >   */
> >
> >  static const struct vsp1_format_info vsp1_video_formats[] = {
> > -	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> > +	/* Raw Bayer 8-bit: Maps on RGB332 */
> > +	{ V4L2_PIX_FMT_SBGGR8, MEDIA_BUS_FMT_Y8_1X8,
> > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGBRG8, MEDIA_BUS_FMT_Y8_1X8,
> > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGRBG8, MEDIA_BUS_FMT_Y8_1X8,
> > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SRGGB8, MEDIA_BUS_FMT_Y8_1X8,
> >  	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> >  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> >  	  1, { 8, 0, 0 }, false, false, 1, 1, false },
>
> Similarly to the media bus codes, could we have a single entry, using
> V4L2_PIX_FMT_GREY ? Same below with V4L2_PIX_FMT_Y10, V4L2_PIX_FMT_Y12
> and V4L2_PIX_FMT_Y16.

mmm, the SRGB mbus codes come from the R-Car ISP input image format.
I understand these are multiple identical entries, but having
somewhere a translation from SRGB->Y formats just to have fewer
entries here it feels a bit of an hack

>
> This would still duplicate entries, as V4L2_PIX_FMT_Y1[026] are
> essentially treated the same, and they are identical to
> V4L2_PIX_FMT_RGB565. We could ask the ISP driver to use
> V4L2_PIX_FMT_RGB565 (and V4L2_PIX_FMT_RGB332 for 8-bit raw) when
> configuring the VSPX, but that's a bit of a hack.

Indeed, but I don't think 3 "duplicated" entries are any bad, if
that's how the HW work.

>
> Another option would be to handle the translation in
> vsp1_vspx_rwpf_set_subdev_fmt(). I would still in that case only expect
> the V4L2_PIX_FMT_GREY and V4L2_PIX_FMT_Y* 4CCs from the ISP driver. This

Do you expect the ISP driver to translate SRGB to Y formats ?


> patch could then be dropped.

So are you suggesting to translate in the ISP driver

        SRGB8 -> RGB332

        SRGB10/12/16 -> RGB565

Niklas, what do you think ?


>
> What's your preference ?
>
> > +
> > +	/* Raw Bayer 10/12/16-bit: Maps on RGB565 */
> > +	{ V4L2_PIX_FMT_SBGGR10, MEDIA_BUS_FMT_Y10_1X10,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
>
> The bpp values are used to calculate memory offsets. Unless I'm
> mistaken, you should use 16 here, not 10.
>

I'm rounding up in the vspx driver. However it is true these formats
are sampled in 16bpp chunks, so I can use 16 here.

> > +	{ V4L2_PIX_FMT_SGBRG10, MEDIA_BUS_FMT_Y10_1X10,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGRBG10, MEDIA_BUS_FMT_Y10_1X10,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SRGGB10, MEDIA_BUS_FMT_Y10_1X10,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > +
> > +	{ V4L2_PIX_FMT_SBGGR12, MEDIA_BUS_FMT_Y12_1X12,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGBRG12, MEDIA_BUS_FMT_Y12_1X12,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGRBG12, MEDIA_BUS_FMT_Y12_1X12,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SRGGB12, MEDIA_BUS_FMT_Y12_1X12,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > +
> > +	{ V4L2_PIX_FMT_SBGGR16, MEDIA_BUS_FMT_Y16_1X16,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGBRG16, MEDIA_BUS_FMT_Y16_1X16,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGRBG16, MEDIA_BUS_FMT_Y16_1X16,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SRGGB16, MEDIA_BUS_FMT_Y16_1X16,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS,
> > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > +
> > +	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
>
> This doesn't seem right, the patch is changing the V4L2_PIX_FMT_RGB332.

If I'm not mistaken V4L2_PIX_FMT_RGB332 was

        { V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
          VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
          VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
          1, { 8, 0, 0 }, false, false, 1, 1, false }

and is now

        { V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
          VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
          VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
          1, { 10, 0, 0 }, false, false, 1, 1, false },

Seems like I messed up the bpp

With that fixed the diff looks saner. Thanks for spotting.


>
> >  	{ V4L2_PIX_FMT_ARGB444, MEDIA_BUS_FMT_ARGB8888_1X32,
> >  	  VI6_FMT_ARGB_4444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> >  	  VI6_RPF_DSWAP_P_WDS,
>
> --
> Regards,
>
> Laurent Pinchart

