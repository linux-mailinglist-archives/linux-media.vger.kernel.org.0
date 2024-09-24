Return-Path: <linux-media+bounces-18508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6651984729
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 16:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E69441C22C3E
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 14:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE7C1AAE23;
	Tue, 24 Sep 2024 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bhCCI89w"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679D1AAE0D
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727186434; cv=none; b=J+xocaXOIrAZ3pZSbhlwzHvf0tIxJtuP9lrOuDo0JEndNS9ziIX+UtOuFc+/Ko9b0AwvQu9t1kyJyDgs+VeolJ7FC1Te5ZVc3TQJHypbw+FyY17F5+PyzsaGxWrkOfkTmAGf+SmcEjjcbGPsaNrol14mc8eJEPlLNkT9btBOjc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727186434; c=relaxed/simple;
	bh=UDvKXTevYFx8MgEqo5doAtf7+u/Hy25sCrUAVY6vfcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPQ0QHiubyJJgM1a95wJXMcZ6KbUHfPMESmCeZFTRx+mb3OFrKNTWGIvcuFzwV73mxYLofAv7x0ccuUaNDYNJIYSBawowoIgDKOMxaIh1IK5qvBO0y7MTmEvRCS3ozybPkjsyov0F/Ag02vbPAqSA3ENABhpbqsFt6R6c49Ez+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bhCCI89w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C092FD21;
	Tue, 24 Sep 2024 15:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727186341;
	bh=UDvKXTevYFx8MgEqo5doAtf7+u/Hy25sCrUAVY6vfcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bhCCI89wsFBnbaAIY1es0FtS/CdTB9Lv8QWeaQ1Fl8YzHsJ3JmgXwZE8AlHc3gtew
	 qtxMN7SrkJ4dKtCJ0GH4cLh++/VqcLT3npqjGjA1px1mWe5Ed/9Ml/GPT+EDlHCMJY
	 q6nGMDakHMH8vUfkUrXwSx+9VKlj+jQUYNGBeWR0=
Date: Tue, 24 Sep 2024 16:00:25 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/4] media: platform: rzg2l-cru: Use v4l2_get_link_freq()
Message-ID: <4rzw74dhtuww73ve7shwxnhg2wtcb644wskwi6t6smrpej5j6e@iwkxi5co3557>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-3-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920124115.375748-3-dan.scally@ideasonboard.com>

Hi Dan

On Fri, Sep 20, 2024 at 01:41:13PM GMT, Daniel Scally wrote:
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>
> The rzg2l_csi2_calc_mbps() function currently tries to calculate the
> link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
> of the remote subdevice. Switch the function to v4l2_get_link_freq()
> which correctly targets V4L2_CID_LINK_FREQ before falling back on
> V4L2_CID_PIXEL_RATE if the former is unavailable.
>
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Seems correct, Prabhakar maybe could test to confirm this still works
with drivers that use PIXEL_RATE

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 25 ++++++++-----------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index d46f0bd10cec..9609ca2a2f67 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -242,28 +242,23 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
>  	const struct rzg2l_csi2_format *format;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	struct v4l2_subdev_state *state;
> -	struct v4l2_ctrl *ctrl;
>  	u64 mbps;
>
> -	/* Read the pixel rate control from remote. */
> -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> -	if (!ctrl) {
> -		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
> -			source->name);
> -		return -EINVAL;
> -	}
> -
>  	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
>  	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
>  	format = rzg2l_csi2_code_to_fmt(fmt->code);
>  	v4l2_subdev_unlock_state(state);
>
> -	/*
> -	 * Calculate hsfreq in Mbps
> -	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> -	 */
> -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
> -	do_div(mbps, csi2->lanes * 1000000);
> +	/* Read the link frequency from remote subdevice. */
> +	mbps = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> +				  csi2->lanes);
> +	if (mbps < 0) {
> +		dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
> +			source->name);
> +		return -EINVAL;
> +	}
> +
> +	do_div(mbps, 1000000);
>
>  	return mbps;
>  }
> --
> 2.34.1
>
>

