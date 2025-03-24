Return-Path: <linux-media+bounces-28640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6306A6DF0D
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 16:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E40B3A5097
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 15:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471BD26156A;
	Mon, 24 Mar 2025 15:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g+JbKjDD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDD91DDE9;
	Mon, 24 Mar 2025 15:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742831545; cv=none; b=owsRrGJif/61Q9m35MDBTxZEMcpzGLsFwzE4ikVWSuK+nosWu9GCD6RjX6R8tYIKGasgQtDR+HDENSpPOE7bIEyWtfLko4lEOJxziUSkRQPaG8Az4p2Hfg9FyEe2fb3YmvrAfnGi9APvRYNi3VI/Pd670h8CQfljPj6I+40xhz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742831545; c=relaxed/simple;
	bh=vkIiwsJdXEcjnGjPBRffuNkzKftq4ghjHicNJhbkszE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jqone/vCAVs1AZ+gYchgo5aFlqH8ulxydMsLncQGRbIvo3s+a0v/JDV9BbdRb/HUl+cKOQeggLMwEo+R1r2bs9RAiJXMp7X3O3am97APo3FxX635zFYA3U40K3sDpzfh5q8bzS5Zu6g7dqvgRk0QxkrqHA+mc8F8RPc0oNKTaYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g+JbKjDD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDEB7455;
	Mon, 24 Mar 2025 16:50:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742831435;
	bh=vkIiwsJdXEcjnGjPBRffuNkzKftq4ghjHicNJhbkszE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+JbKjDDE5eu+Qg2Fn4azelXmAdEtKhv29SaVefd57+2POrgsAMgygBeVvfgHTS6J
	 ntGDEoqfXy8yExRnUhj2mMf8ik4bvyc2uwawmx4eEhAgJ3blBWXUoknrGR/TX8tLoz
	 Y8FKKExuLUj/UD1kCx8CNi25UhXPmkD19wThrSyk=
Date: Mon, 24 Mar 2025 17:51:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: niklas soderlund <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 7/7] media: vsp1: pipe: Add RAW Bayer formats mapping
Message-ID: <20250324155159.GH5113@pendragon.ideasonboard.com>
References: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
 <20250321-v4h-iif-v6-7-361e9043026a@ideasonboard.com>
 <20250321215634.GB11255@pendragon.ideasonboard.com>
 <dkatmlnysvsy3g4n3m53bzxcqx4avklzfctxgjv4hl6sd7fte3@vlfsvasn53d7>
 <20250324083513.GA2884853@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324083513.GA2884853@ragnatech.se>

On Mon, Mar 24, 2025 at 09:35:13AM +0100, Niklas Söderlund wrote:
> On 2025-03-24 09:27:56 +0100, Jacopo Mondi wrote:
> > On Fri, Mar 21, 2025 at 11:56:34PM +0200, Laurent Pinchart wrote:
> > > On Fri, Mar 21, 2025 at 04:45:39PM +0100, Jacopo Mondi wrote:
> > > > Add formats definition for RAW Bayer formats in vsp1_pipe.c.
> > > >
> > > > 8-bits RAW Bayer pixel formats map on VSP format RGB332.
> > >
> > > s/map on/map to/
> > >
> > > > 10, 12 and 16 bits RAW Bayer pixel formats map on RGB565 insted.
> > > >
> > > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > > ---
> > > > v3->v4:
> > > > - Fix SWAP bits for RAW 10, 12 and 16
> > > > ---
> > > >  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 72 ++++++++++++++++++++++++-
> > > >  1 file changed, 71 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > index 8e9be3ec1b4d..a51061738edc 100644
> > > > --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > > > @@ -30,10 +30,80 @@
> > > >   */
> > > >
> > > >  static const struct vsp1_format_info vsp1_video_formats[] = {
> > > > -	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> > > > +	/* Raw Bayer 8-bit: Maps on RGB332 */
> > > > +	{ V4L2_PIX_FMT_SBGGR8, MEDIA_BUS_FMT_Y8_1X8,
> > > > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > > > +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> > > > +	{ V4L2_PIX_FMT_SGBRG8, MEDIA_BUS_FMT_Y8_1X8,
> > > > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > > > +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> > > > +	{ V4L2_PIX_FMT_SGRBG8, MEDIA_BUS_FMT_Y8_1X8,
> > > > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > > > +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> > > > +	{ V4L2_PIX_FMT_SRGGB8, MEDIA_BUS_FMT_Y8_1X8,
> > > >  	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > >  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > > >  	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> > >
> > > Similarly to the media bus codes, could we have a single entry, using
> > > V4L2_PIX_FMT_GREY ? Same below with V4L2_PIX_FMT_Y10, V4L2_PIX_FMT_Y12
> > > and V4L2_PIX_FMT_Y16.
> > 
> > mmm, the SRGB mbus codes come from the R-Car ISP input image format.
> > I understand these are multiple identical entries, but having
> > somewhere a translation from SRGB->Y formats just to have fewer
> > entries here it feels a bit of an hack

handling the CFA pattern in the media bus code and pixel format was a
historical mistake that we're slowly addressing for new drivers. Sakari
has for instance posted patches to use the Y formats only on sensor
subdevs that will follow the new raw camera sensor subdev model. I think
we should use Y formats in the VSP and ISP drivers already.

> > > This would still duplicate entries, as V4L2_PIX_FMT_Y1[026] are
> > > essentially treated the same, and they are identical to
> > > V4L2_PIX_FMT_RGB565. We could ask the ISP driver to use
> > > V4L2_PIX_FMT_RGB565 (and V4L2_PIX_FMT_RGB332 for 8-bit raw) when
> > > configuring the VSPX, but that's a bit of a hack.
> > 
> > Indeed, but I don't think 3 "duplicated" entries are any bad, if
> > that's how the HW work.
> > 
> > > Another option would be to handle the translation in
> > > vsp1_vspx_rwpf_set_subdev_fmt(). I would still in that case only expect
> > > the V4L2_PIX_FMT_GREY and V4L2_PIX_FMT_Y* 4CCs from the ISP driver. This
> > 
> > Do you expect the ISP driver to translate SRGB to Y formats ?

I actually expect the ISP driver to expose Y formats only to userspace,
and get the CFA pattern from the ISP parameters buffers.

> > > patch could then be dropped.
> > 
> > So are you suggesting to translate in the ISP driver
> > 
> >         SRGB8 -> RGB332
> > 
> >         SRGB10/12/16 -> RGB565

No quite, the ISP driver would give us Y formats, and the translation to
RGB332 and RGB565 would be handled within the VSP1 driver, in the
vsp1_vspx_rwpf_set_subdev_fmt() function.

> > Niklas, what do you think ?
> 
> I would rather keep the true formats in the API between the VSP and ISP, 
> that is keep it as is. If really needed maybe a translation in the VSP 
> driver prior to querying vsp1_video_formats[] could be added? But this 
> driver is complex enough as-is :-)
> 
> > > What's your preference ?
> > >
> > > > +
> > > > +	/* Raw Bayer 10/12/16-bit: Maps on RGB565 */
> > > > +	{ V4L2_PIX_FMT_SBGGR10, MEDIA_BUS_FMT_Y10_1X10,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > >
> > > The bpp values are used to calculate memory offsets. Unless I'm
> > > mistaken, you should use 16 here, not 10.
> > 
> > I'm rounding up in the vspx driver. However it is true these formats
> > are sampled in 16bpp chunks, so I can use 16 here.
> > 
> > > > +	{ V4L2_PIX_FMT_SGBRG10, MEDIA_BUS_FMT_Y10_1X10,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > > > +	{ V4L2_PIX_FMT_SGRBG10, MEDIA_BUS_FMT_Y10_1X10,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > > > +	{ V4L2_PIX_FMT_SRGGB10, MEDIA_BUS_FMT_Y10_1X10,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > > > +
> > > > +	{ V4L2_PIX_FMT_SBGGR12, MEDIA_BUS_FMT_Y12_1X12,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > > > +	{ V4L2_PIX_FMT_SGBRG12, MEDIA_BUS_FMT_Y12_1X12,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > > > +	{ V4L2_PIX_FMT_SGRBG12, MEDIA_BUS_FMT_Y12_1X12,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > > > +	{ V4L2_PIX_FMT_SRGGB12, MEDIA_BUS_FMT_Y12_1X12,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > > > +
> > > > +	{ V4L2_PIX_FMT_SBGGR16, MEDIA_BUS_FMT_Y16_1X16,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > > > +	{ V4L2_PIX_FMT_SGBRG16, MEDIA_BUS_FMT_Y16_1X16,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > > > +	{ V4L2_PIX_FMT_SGRBG16, MEDIA_BUS_FMT_Y16_1X16,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > > > +	{ V4L2_PIX_FMT_SRGGB16, MEDIA_BUS_FMT_Y16_1X16,
> > > > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS,
> > > > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > > > +
> > > > +	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> > > > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > > > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > >
> > > This doesn't seem right, the patch is changing the V4L2_PIX_FMT_RGB332.
> > 
> > If I'm not mistaken V4L2_PIX_FMT_RGB332 was
> > 
> >         { V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> >           VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> >           VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> >           1, { 8, 0, 0 }, false, false, 1, 1, false }
> > 
> > and is now
> > 
> >         { V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> >           VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> >           VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> >           1, { 10, 0, 0 }, false, false, 1, 1, false },
> > 
> > Seems like I messed up the bpp
> > 
> > With that fixed the diff looks saner. Thanks for spotting.
> > 
> > > >  	{ V4L2_PIX_FMT_ARGB444, MEDIA_BUS_FMT_ARGB8888_1X32,
> > > >  	  VI6_FMT_ARGB_4444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > > >  	  VI6_RPF_DSWAP_P_WDS,

-- 
Regards,

Laurent Pinchart

