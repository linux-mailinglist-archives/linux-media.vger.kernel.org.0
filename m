Return-Path: <linux-media+bounces-60822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFuVO3Ci/Gn2SAAAu9opvQ
	(envelope-from <linux-media+bounces-60822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:32:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F287D4EA3CF
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E869D3010818
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 14:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEA13FBEDD;
	Thu,  7 May 2026 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mC+ax80Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62452314A8D;
	Thu,  7 May 2026 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164176; cv=none; b=EDqcjZjN+KO8BimHfA7QkouZf8tk6Grp5G8/7DNHptf+7lLGQppsqADfCCH+pLCFZ6RnW/EeKitH12T1DIK7APbiq9aBrKcqi+6xckTbxR8vsNzlHWRzscReEU0MrBQvxoXSOEVM3bfWOE3ZuF+FSxFM/jlgMkZ2+X7eCex8qSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164176; c=relaxed/simple;
	bh=BUmLi60WlA4BZWWIRZhVSoNHoTSIT3E8DMWl3jDrRG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAmtEvWAFfuE+n1tlXwQQpT8qn0YpiJXiYiQxumdr4MjUv2O7RbV2ci22ta68lv8ljI5+zBL8gxUFXX7EmotI35kXkUFKSVP3dU227ynJhBzdO+zFUe/B2HWFex6ittHE+/oJJLfuSNj0dMkmBpKqj4egtKivCnj2hMZ81eqeAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mC+ax80Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF190664;
	Thu,  7 May 2026 16:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778164168;
	bh=BUmLi60WlA4BZWWIRZhVSoNHoTSIT3E8DMWl3jDrRG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mC+ax80YKOR7fr/hOnM1M0tRKAhO3U028GJzXux3UXVA9ftqlhM9FaF8a53IN4Mfw
	 12YR/rTtw3MblAok8Ofcsi0yr/pCo+soTb+U2yzysHH8sLKExzPX+QImwJygC1VJun
	 bBRFE3PDF1+4J0o7Jwu3eHp2lIoFZ6WO3ZuFptg4=
Date: Thu, 7 May 2026 16:29:30 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 09/13] media: imx355: Remove redundant fll_min, and
 implement fixed offset
Message-ID: <afyhY2WmfjZ2OxrY@zed>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-9-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-9-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: F287D4EA3CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60822-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,raspberrypi.com:email]
X-Rspamd-Action: no action

Hi Dave

On Wed, May 06, 2026 at 07:23:47PM +0100, Dave Stevenson wrote:
> fll_min (Frame Length Lines) is set to the same value as fll_def
> for all modes, which makes it redundant.
>
> The actual value is also erroneous as sensor works in all the
> defined modes with FLL set at the mode height + 20 lines, so
> set the vblank control minimum to 20 rather than varying it.
> This also improves the maximum frame rate achievable.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx355.c | 27 +++++----------------------
>  1 file changed, 5 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 12005bc40f36..5a3bfcd0f51c 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -33,6 +33,8 @@
>  /* V_TIMING internal */
>  #define IMX355_REG_FLL			0x0340
>  #define IMX355_FLL_MAX			0xffff
> +/* Number of lines above frame height that are required. */
> +#define IMX355_FLL_OFFSET		20

I would have called it FFL_MIN, but it's probably just a matter of
taste
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  #define IMX355_REG_LLP			0x0342
>  #define IMX355_LLP_MAX			0xffff
> @@ -105,7 +107,6 @@ struct imx355_mode {
>
>  	/* V-timing */
>  	u32 fll_def;
> -	u32 fll_min;
>
>  	/* H-timing */
>  	u32 llp;
> @@ -360,7 +361,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 3280,
>  		.height = 2464,
>  		.fll_def = 2615,
> -		.fll_min = 2615,
>  		.llp = 3672,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> @@ -376,7 +376,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 3268,
>  		.height = 2448,
>  		.fll_def = 2615,
> -		.fll_min = 2615,
>  		.llp = 3672,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
> @@ -392,7 +391,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 3264,
>  		.height = 2448,
>  		.fll_def = 2615,
> -		.fll_min = 2615,
>  		.llp = 3672,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
> @@ -408,7 +406,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 1940,
>  		.height = 1096,
>  		.fll_def = 1306,
> -		.fll_min = 1306,
>  		.llp = 3672,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
> @@ -424,7 +421,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 1936,
>  		.height = 1096,
>  		.fll_def = 1306,
> -		.fll_min = 1306,
>  		.llp = 3672,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
> @@ -440,7 +436,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 1924,
>  		.height = 1080,
>  		.fll_def = 1306,
> -		.fll_min = 1306,
>  		.llp = 3672,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
> @@ -456,7 +451,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 1920,
>  		.height = 1080,
>  		.fll_def = 1306,
> -		.fll_min = 1306,
>  		.llp = 3672,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
> @@ -472,7 +466,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 1640,
>  		.height = 1232,
>  		.fll_def = 1306,
> -		.fll_min = 1306,
>  		.llp = 1836,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
> @@ -488,7 +481,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 1640,
>  		.height = 922,
>  		.fll_def = 1306,
> -		.fll_min = 1306,
>  		.llp = 1836,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
> @@ -504,7 +496,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 1300,
>  		.height = 736,
>  		.fll_def = 1306,
> -		.fll_min = 1306,
>  		.llp = 1836,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
> @@ -520,7 +511,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 1296,
>  		.height = 736,
>  		.fll_def = 1306,
> -		.fll_min = 1306,
>  		.llp = 1836,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
> @@ -536,7 +526,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 1284,
>  		.height = 720,
>  		.fll_def = 1306,
> -		.fll_min = 1306,
>  		.llp = 1836,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
> @@ -552,7 +541,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 1280,
>  		.height = 720,
>  		.fll_def = 1306,
> -		.fll_min = 1306,
>  		.llp = 1836,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> @@ -568,7 +556,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.width = 820,
>  		.height = 616,
>  		.fll_def = 652,
> -		.fll_min = 652,
>  		.llp = 3672,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
> @@ -857,7 +844,6 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
>  	const struct imx355_mode *mode;
>  	struct v4l2_mbus_framefmt *framefmt;
>  	s32 vblank_def;
> -	s32 vblank_min;
>  	s64 h_blank;
>  	u32 height;
>
> @@ -882,10 +868,9 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
>  		/* Update limits and set FPS to default */
>  		height = imx355->cur_mode->height;
>  		vblank_def = imx355->cur_mode->fll_def - height;
> -		vblank_min = imx355->cur_mode->fll_min - height;
>  		height = IMX355_FLL_MAX - height;

re-using 'height' here is not nice, but I understand it was there
already

> -		__v4l2_ctrl_modify_range(imx355->vblank, vblank_min, height, 1,
> -					 vblank_def);
> +		__v4l2_ctrl_modify_range(imx355->vblank, IMX355_FLL_OFFSET,
> +					 height, 1, vblank_def);
>  		__v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);
>  		h_blank = mode->llp - imx355->cur_mode->width;
>  		/*
> @@ -1146,7 +1131,6 @@ static int imx355_init_controls(struct imx355 *imx355)
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
>  	s64 exposure_max;
>  	s64 vblank_def;
> -	s64 vblank_min;
>  	s64 hblank;
>  	u64 pixel_rate;
>  	const struct imx355_mode *mode;
> @@ -1176,9 +1160,8 @@ static int imx355_init_controls(struct imx355 *imx355)
>  	/* Initialize vblank/hblank/exposure parameters based on current mode */
>  	mode = imx355->cur_mode;
>  	vblank_def = mode->fll_def - mode->height;
> -	vblank_min = mode->fll_min - mode->height;
>  	imx355->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
> -					   V4L2_CID_VBLANK, vblank_min,
> +					   V4L2_CID_VBLANK, IMX355_FLL_OFFSET,
>  					   IMX355_FLL_MAX - mode->height,
>  					   1, vblank_def);
>
>
> --
> 2.34.1
>
>

