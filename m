Return-Path: <linux-media+bounces-60820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGJKNDKe/Gn3RwAAu9opvQ
	(envelope-from <linux-media+bounces-60820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:14:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B93F4E9E99
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 74EE1302740B
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 14:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761A2406263;
	Thu,  7 May 2026 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UtQhcPJg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF63FD15D;
	Thu,  7 May 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163170; cv=none; b=ELCFK6XIka+uJV55HoZrc1eniWivhNeK/GelPMW95KM+swmYVJLJfJAVGPaZ0/Igo6NuPXRx1q8ZpsAGVHluSgHBwkRlLYyrM2HEgckoUYk2dZFydIuYRntobZNw/rkeSDAv1cBlO85NFk/a+JH5SFU4V4eVqiMcsCJj18hJ7ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163170; c=relaxed/simple;
	bh=3V42hPrlv516yIBO6of7bUpeufpGGtFILYpNkVYoi1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCdkQN0JluM28XCyMMUe64hOvO0Vk0jCWseEr8cUFFGvT+e+1304EToK8stwVu+Sop4zn7MVNSTcefnKY69/ug5JyYCr12qMqYCekClOWTYD8Vp3EcSy63mkO1opemNFE0LBjGhyssCsvQGQXgdnSe8KfsUUYsdPgKPsyuQm2/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UtQhcPJg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BCA3664;
	Thu,  7 May 2026 16:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778163164;
	bh=3V42hPrlv516yIBO6of7bUpeufpGGtFILYpNkVYoi1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtQhcPJgDqtcneSlqVZFd/v1EuXfC4Wsvu9BcxyxRzM5Fl5+myEi2PuKXTZ6H5KeX
	 vKtZjX99anaubl/WvPAU6bzAcl76CdolIAIFYxj/svYJotv4cW1DLzRvCV72NIQEJc
	 D11Uyq0xeqklgMGIbx4aP4Ry6fv+bbnte79k2vo8=
Date: Thu, 7 May 2026 16:12:44 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 07/13] media: imx355: Remove link_freq_index from each
 mode as ununsed
Message-ID: <afyd08he6apxpVYA@zed>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-7-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-7-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: 6B93F4E9E99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60820-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,raspberrypi.com:email]
X-Rspamd-Action: no action

Hi Dave

On Wed, May 06, 2026 at 07:23:45PM +0100, Dave Stevenson wrote:
> The link_freq_index value in imx355_mode is unused, so remove it.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx355.c | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 422454e529a7..b0cddb614775 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -82,7 +82,6 @@
>
>  /* default link frequency and external clock */
>  #define IMX355_LINK_FREQ_DEFAULT	360000000LL
> -#define IMX355_LINK_FREQ_INDEX		0
>
>  /* number of data lanes */
>  #define IMX355_DATA_LANES		4
> @@ -111,9 +110,6 @@ struct imx355_mode {
>  	/* H-timing */
>  	u32 llp;
>
> -	/* index of link frequency */
> -	u32 link_freq_index;
> -
>  	/* Default register values */
>  	struct imx355_reg_list reg_list;
>
> @@ -367,7 +363,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 2615,
>  		.fll_min = 2615,
>  		.llp = 3672,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
>  			.regs = mode_3280x2464_regs,
> @@ -384,7 +379,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 2615,
>  		.fll_min = 2615,
>  		.llp = 3672,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
>  			.regs = mode_3268x2448_regs,
> @@ -401,7 +395,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 2615,
>  		.fll_min = 2615,
>  		.llp = 3672,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
>  			.regs = mode_3264x2448_regs,
> @@ -418,7 +411,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 1306,
>  		.fll_min = 1306,
>  		.llp = 3672,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
>  			.regs = mode_1940x1096_regs,
> @@ -435,7 +427,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 1306,
>  		.fll_min = 1306,
>  		.llp = 3672,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
>  			.regs = mode_1936x1096_regs,
> @@ -452,7 +443,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 1306,
>  		.fll_min = 1306,
>  		.llp = 3672,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
>  			.regs = mode_1924x1080_regs,
> @@ -469,7 +459,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 1306,
>  		.fll_min = 1306,
>  		.llp = 3672,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
>  			.regs = mode_1920x1080_regs,
> @@ -486,7 +475,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 1306,
>  		.fll_min = 1306,
>  		.llp = 1836,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
>  			.regs = mode_1640x1232_regs,
> @@ -503,7 +491,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 1306,
>  		.fll_min = 1306,
>  		.llp = 1836,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
>  			.regs = mode_1640x922_regs,
> @@ -520,7 +507,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 1306,
>  		.fll_min = 1306,
>  		.llp = 1836,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
>  			.regs = mode_1300x736_regs,
> @@ -537,7 +523,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 1306,
>  		.fll_min = 1306,
>  		.llp = 1836,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
>  			.regs = mode_1296x736_regs,
> @@ -554,7 +539,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 1306,
>  		.fll_min = 1306,
>  		.llp = 1836,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
>  			.regs = mode_1284x720_regs,
> @@ -571,7 +555,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 1306,
>  		.fll_min = 1306,
>  		.llp = 1836,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
>  			.regs = mode_1280x720_regs,
> @@ -588,7 +571,6 @@ static const struct imx355_mode supported_modes[] = {
>  		.fll_def = 652,
>  		.fll_min = 652,
>  		.llp = 3672,
> -		.link_freq_index = IMX355_LINK_FREQ_INDEX,
>  		.reg_list = {
>  			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
>  			.regs = mode_820x616_regs,
>
> --
> 2.34.1
>
>

