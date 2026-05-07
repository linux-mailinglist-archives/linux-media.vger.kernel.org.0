Return-Path: <linux-media+bounces-60817-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NrCADCc/GnJRwAAu9opvQ
	(envelope-from <linux-media+bounces-60817-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:05:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECC14E9CDD
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A791230432E5
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 14:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B803FBECA;
	Thu,  7 May 2026 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AVWOiznt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7753036A008;
	Thu,  7 May 2026 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162435; cv=none; b=uOJg2RNriLBAwpYSiuM7PS1HKLXQn8i1CzWUbJoAc7OlFx055qT/FEzrPv1VjvnOpB6mkeyfSzCWuR5iL7zLnMw6FdGOlG3BFr9M862pLMMv0X+2VXaRJXbhvmbRU9R4NAi5zDblK6p2wbe+5uoPRFAsNriEfnkFofMP3AFfi40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162435; c=relaxed/simple;
	bh=MhaaK/bTs4OBiTXKoFOmeC0PNYotxkQEWfAFGQlF4fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrpHKis6ZkplOjXYIZTEwmGYz1NxWeUY1GUKyS5iPBZTNicnadom2xPkbRwL2uKTM6IWbTdPNHR1cuFeOYMBFJfRVQiSiYl4bAnsE+1i7kcYWgFYa3npk0o20tpjufIWfs4vV+zWdocPbNUcPYyoWRXSjWhgyxtYnlUi5gsIeF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AVWOiznt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B070B9CE;
	Thu,  7 May 2026 16:00:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778162427;
	bh=MhaaK/bTs4OBiTXKoFOmeC0PNYotxkQEWfAFGQlF4fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVWOizntIdCVCAC3VIaBlwJCv8tF9szpvyhnA0xJVmnNCFRdTRkoazngLH0EOhJAE
	 bOZUvsHwj1ofByieQ2PeQZR8KiPen39gtgXf0bxpLDsJCDphibdR2xd1snbMBFbQZ2
	 wjxRK4ByzQXY2/pF4lVNCMpRHQPhNU7tNVIwFhIk=
Date: Thu, 7 May 2026 16:00:28 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 03/13] media: imx355: Programmatically set the crop
 parameters for each mode
Message-ID: <afyZw0htEcZez8k3@zed>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-3-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-3-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: 4ECC14E9CDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60817-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,raspberrypi.com:email]
X-Rspamd-Action: no action

Hi Dave

On Wed, May 06, 2026 at 07:23:41PM +0100, Dave Stevenson wrote:
> Currently the cropping is set via register entries in the per mode
> register lists. Move those into the mode structure and set them
> programmatically.
>
> x_out_size and y_out_size are duplicates of width and height, but
> are retained in this patch for ease of review.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx355.c | 296 +++++++++++++++++++--------------------------
>  1 file changed, 127 insertions(+), 169 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 8ea510218c7c..6179fe74c897 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -34,6 +34,13 @@
>  #define IMX355_REG_FLL			0x0340
>  #define IMX355_FLL_MAX			0xffff
>
> +#define IMX355_REG_X_ADD_START		0x0344
> +#define IMX355_REG_Y_ADD_START		0x0346
> +#define IMX355_REG_X_ADD_END		0x0348
> +#define IMX355_REG_Y_ADD_END		0x034a
> +#define IMX355_REG_X_OUT_SIZE		0x034c
> +#define IMX355_REG_Y_OUT_SIZE		0x034e
> +
>  /* Exposure control */
>  #define IMX355_REG_EXPOSURE		0x0202
>  #define IMX355_EXPOSURE_MIN		1
> @@ -102,6 +109,13 @@ struct imx355_mode {
>
>  	/* Default register values */
>  	struct imx355_reg_list reg_list;
> +
> +	u16 x_add_start;
> +	u16 y_add_start;
> +	u16 x_add_end;
> +	u16 y_add_end;
> +	u16 x_out_size;
> +	u16 y_out_size;

Wouldn't it be better to define a per-mode v4l2_rect {}  and
calculate the output size as [height - top + 1] (or [width - left + 1]) ?

In this way we can initialize a "sane" default analogue crop to
program at s_start time. It then would be trivial once the driver is
ported to the common RAW sensor model to use the selection target on
the (eventually introduced) internal pad and use that one to program
the analog crop ?


>  };
>
>  struct imx355_clk_params {
> @@ -256,21 +270,9 @@ static const struct imx355_reg_list imx355_global_setting = {
>  static const struct imx355_reg mode_3268x2448_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0344, 0x00 },
> -	{ 0x0345, 0x08 },
> -	{ 0x0346, 0x00 },
> -	{ 0x0347, 0x08 },
> -	{ 0x0348, 0x0c },
> -	{ 0x0349, 0xcb },
> -	{ 0x034a, 0x09 },
> -	{ 0x034b, 0x97 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x0c },
> -	{ 0x034d, 0xc4 },
> -	{ 0x034e, 0x09 },
> -	{ 0x034f, 0x90 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -278,21 +280,9 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
>  static const struct imx355_reg mode_3264x2448_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0344, 0x00 },
> -	{ 0x0345, 0x08 },
> -	{ 0x0346, 0x00 },
> -	{ 0x0347, 0x08 },
> -	{ 0x0348, 0x0c },
> -	{ 0x0349, 0xc7 },
> -	{ 0x034a, 0x09 },
> -	{ 0x034b, 0x97 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x0c },
> -	{ 0x034d, 0xc0 },
> -	{ 0x034e, 0x09 },
> -	{ 0x034f, 0x90 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -300,21 +290,9 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
>  static const struct imx355_reg mode_3280x2464_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0344, 0x00 },
> -	{ 0x0345, 0x00 },
> -	{ 0x0346, 0x00 },
> -	{ 0x0347, 0x00 },
> -	{ 0x0348, 0x0c },
> -	{ 0x0349, 0xcf },
> -	{ 0x034a, 0x09 },
> -	{ 0x034b, 0x9f },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x0c },
> -	{ 0x034d, 0xd0 },
> -	{ 0x034e, 0x09 },
> -	{ 0x034f, 0xa0 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -322,21 +300,9 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
>  static const struct imx355_reg mode_1940x1096_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0344, 0x02 },
> -	{ 0x0345, 0xa0 },
> -	{ 0x0346, 0x02 },
> -	{ 0x0347, 0xac },
> -	{ 0x0348, 0x0a },
> -	{ 0x0349, 0x33 },
> -	{ 0x034a, 0x06 },
> -	{ 0x034b, 0xf3 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x07 },
> -	{ 0x034d, 0x94 },
> -	{ 0x034e, 0x04 },
> -	{ 0x034f, 0x48 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -344,21 +310,9 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
>  static const struct imx355_reg mode_1936x1096_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0344, 0x02 },
> -	{ 0x0345, 0xa0 },
> -	{ 0x0346, 0x02 },
> -	{ 0x0347, 0xac },
> -	{ 0x0348, 0x0a },
> -	{ 0x0349, 0x2f },
> -	{ 0x034a, 0x06 },
> -	{ 0x034b, 0xf3 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x07 },
> -	{ 0x034d, 0x90 },
> -	{ 0x034e, 0x04 },
> -	{ 0x034f, 0x48 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -366,21 +320,9 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
>  static const struct imx355_reg mode_1924x1080_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0344, 0x02 },
> -	{ 0x0345, 0xa8 },
> -	{ 0x0346, 0x02 },
> -	{ 0x0347, 0xb4 },
> -	{ 0x0348, 0x0a },
> -	{ 0x0349, 0x2b },
> -	{ 0x034a, 0x06 },
> -	{ 0x034b, 0xeb },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x07 },
> -	{ 0x034d, 0x84 },
> -	{ 0x034e, 0x04 },
> -	{ 0x034f, 0x38 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -388,21 +330,9 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
>  static const struct imx355_reg mode_1920x1080_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0344, 0x02 },
> -	{ 0x0345, 0xa8 },
> -	{ 0x0346, 0x02 },
> -	{ 0x0347, 0xb4 },
> -	{ 0x0348, 0x0a },
> -	{ 0x0349, 0x27 },
> -	{ 0x034a, 0x06 },
> -	{ 0x034b, 0xeb },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x07 },
> -	{ 0x034d, 0x80 },
> -	{ 0x034e, 0x04 },
> -	{ 0x034f, 0x38 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -410,21 +340,9 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
>  static const struct imx355_reg mode_1640x1232_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0344, 0x00 },
> -	{ 0x0345, 0x00 },
> -	{ 0x0346, 0x00 },
> -	{ 0x0347, 0x00 },
> -	{ 0x0348, 0x0c },
> -	{ 0x0349, 0xcf },
> -	{ 0x034a, 0x09 },
> -	{ 0x034b, 0x9f },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x06 },
> -	{ 0x034d, 0x68 },
> -	{ 0x034e, 0x04 },
> -	{ 0x034f, 0xd0 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -432,21 +350,9 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
>  static const struct imx355_reg mode_1640x922_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0344, 0x00 },
> -	{ 0x0345, 0x00 },
> -	{ 0x0346, 0x01 },
> -	{ 0x0347, 0x30 },
> -	{ 0x0348, 0x0c },
> -	{ 0x0349, 0xcf },
> -	{ 0x034a, 0x08 },
> -	{ 0x034b, 0x63 },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x06 },
> -	{ 0x034d, 0x68 },
> -	{ 0x034e, 0x03 },
> -	{ 0x034f, 0x9a },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -454,21 +360,9 @@ static const struct imx355_reg mode_1640x922_regs[] = {
>  static const struct imx355_reg mode_1300x736_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0344, 0x01 },
> -	{ 0x0345, 0x58 },
> -	{ 0x0346, 0x01 },
> -	{ 0x0347, 0xf0 },
> -	{ 0x0348, 0x0b },
> -	{ 0x0349, 0x7f },
> -	{ 0x034a, 0x07 },
> -	{ 0x034b, 0xaf },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x05 },
> -	{ 0x034d, 0x14 },
> -	{ 0x034e, 0x02 },
> -	{ 0x034f, 0xe0 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -476,21 +370,9 @@ static const struct imx355_reg mode_1300x736_regs[] = {
>  static const struct imx355_reg mode_1296x736_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0344, 0x01 },
> -	{ 0x0345, 0x58 },
> -	{ 0x0346, 0x01 },
> -	{ 0x0347, 0xf0 },
> -	{ 0x0348, 0x0b },
> -	{ 0x0349, 0x77 },
> -	{ 0x034a, 0x07 },
> -	{ 0x034b, 0xaf },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x05 },
> -	{ 0x034d, 0x10 },
> -	{ 0x034e, 0x02 },
> -	{ 0x034f, 0xe0 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -498,21 +380,9 @@ static const struct imx355_reg mode_1296x736_regs[] = {
>  static const struct imx355_reg mode_1284x720_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0344, 0x01 },
> -	{ 0x0345, 0x68 },
> -	{ 0x0346, 0x02 },
> -	{ 0x0347, 0x00 },
> -	{ 0x0348, 0x0b },
> -	{ 0x0349, 0x6f },
> -	{ 0x034a, 0x07 },
> -	{ 0x034b, 0x9f },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x05 },
> -	{ 0x034d, 0x04 },
> -	{ 0x034e, 0x02 },
> -	{ 0x034f, 0xd0 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -520,21 +390,9 @@ static const struct imx355_reg mode_1284x720_regs[] = {
>  static const struct imx355_reg mode_1280x720_regs[] = {
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
> -	{ 0x0344, 0x01 },
> -	{ 0x0345, 0x68 },
> -	{ 0x0346, 0x02 },
> -	{ 0x0347, 0x00 },
> -	{ 0x0348, 0x0b },
> -	{ 0x0349, 0x67 },
> -	{ 0x034a, 0x07 },
> -	{ 0x034b, 0x9f },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x05 },
> -	{ 0x034d, 0x00 },
> -	{ 0x034e, 0x02 },
> -	{ 0x034f, 0xd0 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
> @@ -542,21 +400,9 @@ static const struct imx355_reg mode_1280x720_regs[] = {
>  static const struct imx355_reg mode_820x616_regs[] = {
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
> -	{ 0x0344, 0x00 },
> -	{ 0x0345, 0x00 },
> -	{ 0x0346, 0x00 },
> -	{ 0x0347, 0x00 },
> -	{ 0x0348, 0x0c },
> -	{ 0x0349, 0xcf },
> -	{ 0x034a, 0x09 },
> -	{ 0x034b, 0x9f },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x44 },
>  	{ 0x0902, 0x00 },
> -	{ 0x034c, 0x03 },
> -	{ 0x034d, 0x34 },
> -	{ 0x034e, 0x02 },
> -	{ 0x034f, 0x68 },
>  	{ 0x0700, 0x02 },
>  	{ 0x0701, 0x78 },
>  };
> @@ -590,6 +436,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
>  			.regs = mode_3280x2464_regs,
>  		},
> +		.x_add_start = 0x0000,
> +		.y_add_start = 0x0000,
> +		.x_add_end = 0x0ccf,
> +		.y_add_end = 0x099f,
> +		.x_out_size = 0x0cd0,
> +		.y_out_size = 0x09a0,
>  	},
>  	{
>  		.width = 3268,
> @@ -602,6 +454,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
>  			.regs = mode_3268x2448_regs,
>  		},
> +		.x_add_start = 0x0008,
> +		.y_add_start = 0x0008,
> +		.x_add_end = 0x0ccb,
> +		.y_add_end = 0x997,
> +		.x_out_size = 0x0cc4,
> +		.y_out_size = 0x0990,
>  	},
>  	{
>  		.width = 3264,
> @@ -614,6 +472,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
>  			.regs = mode_3264x2448_regs,
>  		},
> +		.x_add_start = 0x0008,
> +		.y_add_start = 0x0008,
> +		.x_add_end = 0x0cc7,
> +		.y_add_end = 0x0997,
> +		.x_out_size = 0x0cc0,
> +		.y_out_size = 0x0990,
>  	},
>  	{
>  		.width = 1940,
> @@ -626,6 +490,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
>  			.regs = mode_1940x1096_regs,
>  		},
> +		.x_add_start = 0x02a0,
> +		.y_add_start = 0x02ac,
> +		.x_add_end = 0x0a33,
> +		.y_add_end = 0x06f3,
> +		.x_out_size = 0x0794,
> +		.y_out_size = 0x0448,
>  	},
>  	{
>  		.width = 1936,
> @@ -638,6 +508,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
>  			.regs = mode_1936x1096_regs,
>  		},
> +		.x_add_start = 0x02a0,
> +		.y_add_start = 0x02ac,
> +		.x_add_end = 0x0a2f,
> +		.y_add_end = 0x06f3,
> +		.x_out_size = 0x0790,
> +		.y_out_size = 0x0448,
>  	},
>  	{
>  		.width = 1924,
> @@ -650,6 +526,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
>  			.regs = mode_1924x1080_regs,
>  		},
> +		.x_add_start = 0x02a8,
> +		.y_add_start = 0x02b4,
> +		.x_add_end = 0x0a2b,
> +		.y_add_end = 0x06eb,
> +		.x_out_size = 0x0784,
> +		.y_out_size = 0x0438,
>  	},
>  	{
>  		.width = 1920,
> @@ -662,6 +544,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
>  			.regs = mode_1920x1080_regs,
>  		},
> +		.x_add_start = 0x02a8,
> +		.y_add_start = 0x02b4,
> +		.x_add_end = 0x0a27,
> +		.y_add_end = 0x06eb,
> +		.x_out_size = 0x0780,
> +		.y_out_size = 0x0438,
>  	},
>  	{
>  		.width = 1640,
> @@ -674,6 +562,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
>  			.regs = mode_1640x1232_regs,
>  		},
> +		.x_add_start = 0x0000,
> +		.y_add_start = 0x0000,
> +		.x_add_end = 0x0ccf,
> +		.y_add_end = 0x099f,
> +		.x_out_size = 0x0668,
> +		.y_out_size = 0x04d0,
>  	},
>  	{
>  		.width = 1640,
> @@ -686,6 +580,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
>  			.regs = mode_1640x922_regs,
>  		},
> +		.x_add_start = 0x0000,
> +		.y_add_start = 0x0130,
> +		.x_add_end = 0x0ccf,
> +		.y_add_end = 0x0863,
> +		.x_out_size = 0x0668,
> +		.y_out_size = 0x039a,
>  	},
>  	{
>  		.width = 1300,
> @@ -698,6 +598,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
>  			.regs = mode_1300x736_regs,
>  		},
> +		.x_add_start = 0x0158,
> +		.y_add_start = 0x01f0,
> +		.x_add_end = 0x0b7f,
> +		.y_add_end = 0x07af,
> +		.x_out_size = 0x0514,
> +		.y_out_size = 0x02e0,
>  	},
>  	{
>  		.width = 1296,
> @@ -710,6 +616,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
>  			.regs = mode_1296x736_regs,
>  		},
> +		.x_add_start = 0x0158,
> +		.y_add_start = 0x01f0,
> +		.x_add_end = 0x0b77,
> +		.y_add_end = 0x07af,
> +		.x_out_size = 0x0510,
> +		.y_out_size = 0x02e0,
>  	},
>  	{
>  		.width = 1284,
> @@ -722,6 +634,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
>  			.regs = mode_1284x720_regs,
>  		},
> +		.x_add_start = 0x0168,
> +		.y_add_start = 0x0200,
> +		.x_add_end = 0x0b6f,
> +		.y_add_end = 0x079f,
> +		.x_out_size = 0x0504,
> +		.y_out_size = 0x02d0,
>  	},
>  	{
>  		.width = 1280,
> @@ -734,6 +652,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
>  			.regs = mode_1280x720_regs,
>  		},
> +		.x_add_start = 0x0168,
> +		.y_add_start = 0x0200,
> +		.x_add_end = 0x0b67,
> +		.y_add_end = 0x079f,
> +		.x_out_size = 0x0500,
> +		.y_out_size = 0x02d0,
>  	},
>  	{
>  		.width = 820,
> @@ -746,6 +670,12 @@ static const struct imx355_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
>  			.regs = mode_820x616_regs,
>  		},
> +		.x_add_start = 0x0000,
> +		.y_add_start = 0x0000,
> +		.x_add_end = 0x0ccf,
> +		.y_add_end = 0x099f,
> +		.x_out_size = 0x0334,
> +		.y_out_size = 0x0268,
>  	},
>  };
>
> @@ -1076,6 +1006,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
>  static int imx355_start_streaming(struct imx355 *imx355)
>  {
>  	const struct imx355_reg_list *reg_list;
> +	const struct imx355_mode *mode;
>  	int ret;
>
>  	/* Global Setting */
> @@ -1087,13 +1018,40 @@ static int imx355_start_streaming(struct imx355 *imx355)
>  	}
>
>  	/* Apply default values of current mode */
> -	reg_list = &imx355->cur_mode->reg_list;
> +	mode = imx355->cur_mode;
> +	reg_list = &mode->reg_list;
>  	ret = imx355_write_regs(imx355, reg_list->regs, reg_list->num_of_regs);
>  	if (ret) {
>  		dev_err(imx355->dev, "failed to set mode");
>  		return ret;
>  	}
>
> +	/* Set readout crop and size registers  */
> +	ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_START, 2,
> +			       mode->x_add_start);
> +	if (ret)
> +		return ret;
> +	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_START, 2,
> +			       mode->y_add_start);
> +	if (ret)
> +		return ret;
> +	ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_END, 2,
> +			       mode->x_add_end);
> +	if (ret)
> +		return ret;
> +	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_END, 2,
> +			       mode->y_add_end);
> +	if (ret)
> +		return ret;
> +	ret = imx355_write_reg(imx355, IMX355_REG_X_OUT_SIZE, 2,
> +			       mode->x_out_size);
> +	if (ret)
> +		return ret;
> +	ret = imx355_write_reg(imx355, IMX355_REG_Y_OUT_SIZE, 2,
> +			       mode->y_out_size);
> +	if (ret)
> +		return ret;
> +
>  	/* Set PLL registers for the external clock frequency */
>  	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
>  			       imx355->clk_params->extclk_freq);
>
> --
> 2.34.1
>
>

