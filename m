Return-Path: <linux-media+bounces-60821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM38J6uf/GksSAAAu9opvQ
	(envelope-from <linux-media+bounces-60821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:20:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCE04EA05C
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0415930970C3
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 14:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FE63FF8AB;
	Thu,  7 May 2026 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aEOw5wGs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938C83FB7D9;
	Thu,  7 May 2026 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163217; cv=none; b=rPVJW1qoNBYIqK5H57W9jsYy6RTyz/gTEA5Py2Ie0MsgjMCpIBYnKUfRltVJPH3BQoyTNgLwOIHt+cwhMxXT6ShOYjkQCQsy3fVTWjvPeTz09B0JXnZmIfRiEoq3YO16xA+77gHhWVDzMWFAlqykj/fifYeeeyQmTCOVQLGGiwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163217; c=relaxed/simple;
	bh=/f3dT9fkg2i1bX+rM5H3ayyoYOsNii7ZosbDuxlG/I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJbxWAT0FAob+ivTQtbN5Ia/pccUP6I9I9m+7Y4NB+zusfGPHWDt056wc6XjOnN5xvWViaq+ow+tTlo3tP1atxR4xZVEYXzYZJsGzgI6a6U6FXSOSjqHY4I6dopmupBe4LFOM3XX0R132alE42AM8tdgj19Ktcd4Ctx/tBw1O7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aEOw5wGs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B63A664;
	Thu,  7 May 2026 16:13:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778163211;
	bh=/f3dT9fkg2i1bX+rM5H3ayyoYOsNii7ZosbDuxlG/I4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aEOw5wGsDnnrGaSjPFKKvL050vZs5lUtlNSxBD4VMtTaEQMyijU6sY7PzNTQbcpzI
	 j5jYae/mzTebCCP4WnB73xtNvIB0EuKnbqoL2TL6mNZ9WP6MN+lVF8pX0cCIAAgELL
	 xMSIHYvTlb+J4DfdRtoE6LWZGSqGodueRO/77CO8=
Date: Thu, 7 May 2026 16:13:32 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 08/13] media: imx355: pixel_rate never changes, so don't
 recompute
Message-ID: <afyeAi9VD4iKRFw1@zed>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-8-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-8-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: 1CCE04EA05C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60821-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,raspberrypi.com:email,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hi Dave

On Wed, May 06, 2026 at 07:23:46PM +0100, Dave Stevenson wrote:
> The pixel rate is always the same, so there is no need to try and
> recompute it in imx355_set_pad_format, and then no need to have the
> pointer to it stored.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx355.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index b0cddb614775..12005bc40f36 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -161,7 +161,6 @@ struct imx355 {
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	/* V4L2 Controls */
>  	struct v4l2_ctrl *link_freq;
> -	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *exposure;
> @@ -860,7 +859,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
>  	s32 vblank_def;
>  	s32 vblank_min;
>  	s64 h_blank;
> -	u64 pixel_rate;
>  	u32 height;
>
>  	mutex_lock(&imx355->mutex);
> @@ -881,9 +879,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
>  		*framefmt = fmt->format;
>  	} else {
>  		imx355->cur_mode = mode;
> -		pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
> -		do_div(pixel_rate, 10);
> -		__v4l2_ctrl_s_ctrl_int64(imx355->pixel_rate, pixel_rate);
>  		/* Update limits and set FPS to default */
>  		height = imx355->cur_mode->height;
>  		vblank_def = imx355->cur_mode->fll_def - height;
> @@ -1175,9 +1170,8 @@ static int imx355_init_controls(struct imx355 *imx355)
>  	pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
>  	do_div(pixel_rate, 10);
>  	/* By default, PIXEL_RATE is read only */
> -	imx355->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
> -					       V4L2_CID_PIXEL_RATE, pixel_rate,
> -					       pixel_rate, 1, pixel_rate);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_PIXEL_RATE,
> +			  pixel_rate, pixel_rate, 1, pixel_rate);
>
>  	/* Initialize vblank/hblank/exposure parameters based on current mode */
>  	mode = imx355->cur_mode;
>
> --
> 2.34.1
>
>

