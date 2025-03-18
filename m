Return-Path: <linux-media+bounces-28406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0485EA6724D
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 12:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AB4C19A3615
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C072B209F49;
	Tue, 18 Mar 2025 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IzTFtv0K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C24209F33;
	Tue, 18 Mar 2025 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296271; cv=none; b=nsiSiD52gBbnM7a5J7E/doYnVur76LzPN1/eHFmEWjeAkCKPVuYRHvh9mAavpY/9Z5y3+YjfXy0WhrfueTnSwr7pvAknfEZucJRqujJR2O9wkA5SdmMGJK9OJqXsgzKdShiqH7HWnKaGmG7KzsQhhzXtFPjxci42o0JoRWGmaHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296271; c=relaxed/simple;
	bh=IAtbRWmHzlvrS69gFL8+0eepgT3YS1dTlFnVEPTwMHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKERXCFX4NA5xnq9ixaeibFbRm4b8xIwYYHBl413NT7WgjpIdY+gfimfPvlWSk+nxfWQLHflR1tG3B+PQPEe5UMnuNiTHPDJ4D5hvQhKTwIfk25C4vVtLZ/gA0sjCLowgk0fVhGeQSSA+gWC/gB788seZzNf6w0XZzfMokrPEDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IzTFtv0K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B7B1778;
	Tue, 18 Mar 2025 12:09:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742296164;
	bh=IAtbRWmHzlvrS69gFL8+0eepgT3YS1dTlFnVEPTwMHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzTFtv0Kwfw5ua7dXw6+4i5YZvOYntp1jWY/a+9I5KK+OXl/ht923SNXASu1O11W1
	 KryIuwNOxovZsdwAkWuSOGgNQinAswk8MNS49RZbzERUoVZUlY/buBrgvHRtI8964u
	 Rl2Dd9spmTQR15+ZutKuyQEDHRjPvjna+O3h5XjY=
Date: Tue, 18 Mar 2025 12:11:03 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 7/7] media: vsp1: pipe: Add RAW Bayer formats mapping
Message-ID: <bcodrchrxpdkh7zl3duzioebls2ohno4aioba5s76p7leizixo@ugrmjuobocfl>
References: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
 <20250317-v4h-iif-v3-7-63aab8982b50@ideasonboard.com>
 <20250317160635.GA949127@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317160635.GA949127@ragnatech.se>

Hi Niklas

On Mon, Mar 17, 2025 at 05:06:35PM +0100, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your work.
>
> On 2025-03-17 12:56:45 +0100, Jacopo Mondi wrote:
> > Add formats definition for RAW Bayer formats in vsp1_pipe.c.
> >
> > 8-bits RAW Bayer pixel formats map on VSP format RGB332.
> > 10, 12 and 16 bits RAW Bayer pixel formats map on RGB565 insted.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 72 ++++++++++++++++++++++++-
> >  1 file changed, 71 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> > index 8e9be3ec1b4dbdad1cbe35ae3a88952f46e41343..6592513ca833175bdbfe850d61d1b5957ad27e0d 100644
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
> > +
> > +	/* Raw Bayer 10/12/16-bit: Maps on RGB565 */
>
> I have tested this with 10 and 12 bit bayer formats and all of them only
> need the VI6_RPF_DSWAP_P_WDS swap bit set. Setting VI6_RPF_DSWAP_P_BTS
> do not work.
>
> I have not tested on with 16 bit as the interface I use don't support it
> but I suspect this holds true for 16 bit too.
>
> With this fixed for at least 10 and 12,

Indeed, as raw 10 and 12 are sampled in 2 bytes units, we need to
maintain the bytes ordering by not swapping every two bytes.



>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I'll fix and resend, thanks
>
>
> > +	{ V4L2_PIX_FMT_SBGGR10, MEDIA_BUS_FMT_Y10_1X10,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGBRG10, MEDIA_BUS_FMT_Y10_1X10,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGRBG10, MEDIA_BUS_FMT_Y10_1X10,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SRGGB10, MEDIA_BUS_FMT_Y10_1X10,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> > +
> > +	{ V4L2_PIX_FMT_SBGGR12, MEDIA_BUS_FMT_Y12_1X12,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGBRG12, MEDIA_BUS_FMT_Y12_1X12,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGRBG12, MEDIA_BUS_FMT_Y12_1X12,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SRGGB12, MEDIA_BUS_FMT_Y12_1X12,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> > +
> > +	{ V4L2_PIX_FMT_SBGGR16, MEDIA_BUS_FMT_Y16_1X16,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGBRG16, MEDIA_BUS_FMT_Y16_1X16,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SGRBG16, MEDIA_BUS_FMT_Y16_1X16,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > +	{ V4L2_PIX_FMT_SRGGB16, MEDIA_BUS_FMT_Y16_1X16,
> > +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> > +
> > +	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> > +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> > +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> > +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> >  	{ V4L2_PIX_FMT_ARGB444, MEDIA_BUS_FMT_ARGB8888_1X32,
> >  	  VI6_FMT_ARGB_4444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> >  	  VI6_RPF_DSWAP_P_WDS,
> >
> > --
> > 2.48.1
> >
>
> --
> Kind Regards,
> Niklas Söderlund

