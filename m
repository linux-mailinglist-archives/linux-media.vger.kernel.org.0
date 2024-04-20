Return-Path: <linux-media+bounces-9809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A368ABAD1
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 11:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28E21F21911
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1581217732;
	Sat, 20 Apr 2024 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q5r3mMKd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3C514F65
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713606180; cv=none; b=GMsUUOezjB8Bvqb75W9hmMQiam9u2Bp6PbPTVxDPHv7gQLtMOL2cN9EKWbxCaOfmbDzya5gB3q8H3SFOa9C43XliC9HG+ZRjNniPr087sTONvOolFO1r9JEkrMfj8T+IGuhZrJm+NVynaXrPNTUxRhRbwspCTTA1OQtD9XKGoiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713606180; c=relaxed/simple;
	bh=nbD6f/AZvzn97isaqZdP4dn/e+tWB3iJxdkRDtqhxQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTInv059bkg0zFI91Um5rpMmYcSWa728xFoqAeTnkXFjbBbjjjLlWw5dg75K355ydq32TaL0WMyCtqVyb12GuzAeN15PgIkNihLZL8FmNw055frAn9DXD2kqHKSlBOyjwQUFOwy5KjMOjkrfoOe9p7xkERI+VCve41+aqNmdrk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q5r3mMKd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E19355;
	Sat, 20 Apr 2024 11:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713606128;
	bh=nbD6f/AZvzn97isaqZdP4dn/e+tWB3iJxdkRDtqhxQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5r3mMKdMixbOkKXzCJ8tFI/NEZKysKXKvn2uJSYl5VlIdQlYY40D9EMJWzK1o0a2
	 +8/rvJAhz3i1zLeCZYd0BDEK4l/EgAcGzzByGjFG6S/8xzB5VToAyj3IpeabUgnoV4
	 7fvOJm98BbRB5aM15LSs/udgwU0fmtZI874E2LZ8=
Date: Sat, 20 Apr 2024 12:42:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 37/46] media: ov2740: Fix LINK_FREQ and PIXEL_RATE
 control value reporting
Message-ID: <20240420094248.GA6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-38-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-38-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:10PM +0300, Sakari Ailus wrote:
> The driver dug the supported link frequency up from the V4L2 fwnode

s/dug/digs/

> endpoint and used it internally, but failed to report this in the

s/used/uses/
s/failed/fails/

> LINK_FREQ and PIXEL_RATE controls. Fix this.
> 
> Fixes: 0677a2d9b735 ("media: ov2740: Add support for 180 MHz link frequency")
> Cc: stable@vger.kernel.org # for v6.8 and later
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

You're missing the tags given by Hans and Bingbu. As this patch is
unrelated to the rest of the series, it should be split off and merged
in v6.10.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov2740.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 552935ccb4a9..57906df7be4e 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -768,14 +768,15 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>  	cur_mode = ov2740->cur_mode;
>  	size = ARRAY_SIZE(link_freq_menu_items);
>  
> -	ov2740->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
> -						   V4L2_CID_LINK_FREQ,
> -						   size - 1, 0,
> -						   link_freq_menu_items);
> +	ov2740->link_freq =
> +		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
> +				       V4L2_CID_LINK_FREQ, size - 1,
> +				       ov2740->supported_modes->link_freq_index,
> +				       link_freq_menu_items);
>  	if (ov2740->link_freq)
>  		ov2740->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
> -	pixel_rate = to_pixel_rate(OV2740_LINK_FREQ_360MHZ_INDEX);
> +	pixel_rate = to_pixel_rate(ov2740->supported_modes->link_freq_index);
>  	ov2740->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
>  					       V4L2_CID_PIXEL_RATE, 0,
>  					       pixel_rate, 1, pixel_rate);

-- 
Regards,

Laurent Pinchart

