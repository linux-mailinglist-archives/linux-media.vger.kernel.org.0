Return-Path: <linux-media+bounces-60818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCEUNn+e/GkMSAAAu9opvQ
	(envelope-from <linux-media+bounces-60818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:15:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3434E9EFB
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C168D30CAFAD
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 14:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DEB3FCB03;
	Thu,  7 May 2026 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P/C9y6gx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC203FCB1C;
	Thu,  7 May 2026 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162992; cv=none; b=sbNfH5sOoSM1n5Vn6qiq4ZJ5wQWbs/AqEqrB1VmywVvtwMggjVTk50FQyC/wzJHr+RtRALEUUZUoTwj+xBwxGktCgA729VYjMS5gYmGJmwhoKPnOkOn3jm50RDsT0/awYTg6J1v6a1fondijIMIDLp6WxcuVjiEk7RQfk6tt/Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162992; c=relaxed/simple;
	bh=RCqlmOPeLoQw4i5bQR+b/dveqEP8NRfjACG4rm3BAJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJ5KhgnykYksFh+tyMnwK0TPaKJkbRLP8tvCyjEKjbPoDrEEcipzeOChTHHhGvswGvshhrWWIVvd3NpmdEaLw7SgVA32UBB/y/T5uTJt1uw20ZZKZxb7JZnZm4TF3g5zp9eB3fkHvCCnHL7dh5P3FzsEWVFLBZND6F8sBuY14N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P/C9y6gx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEF78664;
	Thu,  7 May 2026 16:09:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778162984;
	bh=RCqlmOPeLoQw4i5bQR+b/dveqEP8NRfjACG4rm3BAJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/C9y6gxzOhHnTmejZ3Ih687cY6fj1x4rTJ9nKkAc2H69p5OhU8UE4SbaGZF6j8Bg
	 PHNM52B6UDaxxXAGBSfRuKeCaEl7t5ZF2Ulrb8m1FfBX0QrRJvTYA5rl/MM4JILPAb
	 Tl2zPvhH/JoQ/KUpcjstUitzEtwW7ViyB/25Sxs4=
Date: Thu, 7 May 2026 16:09:46 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 05/13] media: imx355: Set register LINE_LENGTH_PCK
 programmatically
Message-ID: <afycja3nlkEFSPeU@zed>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-5-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-5-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: 3E3434E9EFB
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
	TAGGED_FROM(0.00)[bounces-60818-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:email,ideasonboard.com:email,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Dave

On Wed, May 06, 2026 at 07:23:43PM +0100, Dave Stevenson wrote:
> The driver already has the LLP value stored in the mode structure,
> but also had the same value set via register writes in the mode's
> register list. Remove this duplication.

Moving stuff from register data tables to modes is .. better for sure.
You know.. freely configurable etc etc
But this is an improvement, so...

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
> This can't be implemented via a s_ctrl handler for V4L2_CID_HBLANK
> as __v4l2_ctrl_handler_setup doesn't call s_ctrl for read only
> controls.

Kind of unrelated, but I wonder if imx355_set_ctrl() doesn't actually
get called for hblank but the error simply goes ignored. The real
solution here would be to initialize the hblank control with a NULL
control handler.

>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> ---
>  drivers/media/i2c/imx355.c | 38 ++++++++++----------------------------
>  1 file changed, 10 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 589bad6c58e4..56a82f37709e 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -34,6 +34,9 @@
>  #define IMX355_REG_FLL			0x0340
>  #define IMX355_FLL_MAX			0xffff
>
> +#define IMX355_REG_LLP			0x0342
> +#define IMX355_LLP_MAX			0xffff
> +
>  #define IMX355_REG_X_ADD_START		0x0344
>  #define IMX355_REG_Y_ADD_START		0x0346
>  #define IMX355_REG_X_ADD_END		0x0348
> @@ -266,8 +269,6 @@ static const struct imx355_reg_list imx355_global_setting = {
>  };
>
>  static const struct imx355_reg mode_3268x2448_regs[] = {
> -	{ 0x0342, 0x0e },
> -	{ 0x0343, 0x58 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -276,8 +277,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
>  };
>
>  static const struct imx355_reg mode_3264x2448_regs[] = {
> -	{ 0x0342, 0x0e },
> -	{ 0x0343, 0x58 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -286,8 +285,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
>  };
>
>  static const struct imx355_reg mode_3280x2464_regs[] = {
> -	{ 0x0342, 0x0e },
> -	{ 0x0343, 0x58 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -296,8 +293,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
>  };
>
>  static const struct imx355_reg mode_1940x1096_regs[] = {
> -	{ 0x0342, 0x0e },
> -	{ 0x0343, 0x58 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -306,8 +301,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
>  };
>
>  static const struct imx355_reg mode_1936x1096_regs[] = {
> -	{ 0x0342, 0x0e },
> -	{ 0x0343, 0x58 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -316,8 +309,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
>  };
>
>  static const struct imx355_reg mode_1924x1080_regs[] = {
> -	{ 0x0342, 0x0e },
> -	{ 0x0343, 0x58 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -326,8 +317,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
>  };
>
>  static const struct imx355_reg mode_1920x1080_regs[] = {
> -	{ 0x0342, 0x0e },
> -	{ 0x0343, 0x58 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -336,8 +325,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
>  };
>
>  static const struct imx355_reg mode_1640x1232_regs[] = {
> -	{ 0x0342, 0x07 },
> -	{ 0x0343, 0x2c },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -346,8 +333,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
>  };
>
>  static const struct imx355_reg mode_1640x922_regs[] = {
> -	{ 0x0342, 0x07 },
> -	{ 0x0343, 0x2c },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -356,8 +341,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
>  };
>
>  static const struct imx355_reg mode_1300x736_regs[] = {
> -	{ 0x0342, 0x07 },
> -	{ 0x0343, 0x2c },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -366,8 +349,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
>  };
>
>  static const struct imx355_reg mode_1296x736_regs[] = {
> -	{ 0x0342, 0x07 },
> -	{ 0x0343, 0x2c },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -376,8 +357,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
>  };
>
>  static const struct imx355_reg mode_1284x720_regs[] = {
> -	{ 0x0342, 0x07 },
> -	{ 0x0343, 0x2c },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -386,8 +365,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
>  };
>
>  static const struct imx355_reg mode_1280x720_regs[] = {
> -	{ 0x0342, 0x07 },
> -	{ 0x0343, 0x2c },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -396,8 +373,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
>  };
>
>  static const struct imx355_reg mode_820x616_regs[] = {
> -	{ 0x0342, 0x0e },
> -	{ 0x0343, 0x58 },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x44 },
>  	{ 0x0902, 0x00 },
> @@ -1041,6 +1016,13 @@ static int imx355_start_streaming(struct imx355 *imx355)
>  	if (ret)
>  		return ret;
>
> +	/* set line length */
> +	ret = imx355_write_reg(imx355, IMX355_REG_LLP,
> +			       imx355->hblank->val + imx355->cur_mode->width,
> +			       2);
> +	if (ret)
> +		return ret;
> +
>  	/* Apply customized values from user */
>  	ret =  __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
>  	if (ret)
>
> --
> 2.34.1
>
>

