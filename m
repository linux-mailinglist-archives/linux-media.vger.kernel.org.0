Return-Path: <linux-media+bounces-60810-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDTyKRCX/Gn3RQAAu9opvQ
	(envelope-from <linux-media+bounces-60810-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:43:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235A4E973A
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E874E303EC03
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D783F7A86;
	Thu,  7 May 2026 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kj4cgPPf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6603F788F;
	Thu,  7 May 2026 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161287; cv=none; b=ZXlX7YHgX6mcGgTdJIwTzfUI1rw+jYk31e36rXTlkhAKePRDy1gRSIw93Tzu2osLxbfWj8zoN89zbNbO/aiMw0ank6ZF8W7Kgd4GcpPi3cwUmIwzhCN4pI2MueObZZrGMN3+icmzMgK74lvkQAncAqRyCnI/5RVHnxnuhwLKecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161287; c=relaxed/simple;
	bh=8BCNWAiiNHRL6t53tS+rd4Seal0yItvsk3LnWTLneB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtmiuXiDtjVAjGoo5+SUG+MC83lsUAIxQHEJkIobRjM+wXZRbNuTh9+K/FM8ftl8VYBe5P1t/06GvN49IxE3XykLBZZIkHtc+ea0hWTs4C0ALkpHIXR60k5V6VdhuFnVJNjv5s47ylAO0De50dzSORQzRaaSU1w1R0DI7O9d8o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Kj4cgPPf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F09F9CE;
	Thu,  7 May 2026 15:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778161279;
	bh=8BCNWAiiNHRL6t53tS+rd4Seal0yItvsk3LnWTLneB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kj4cgPPfxroEv7Vh+ipUUpfrvSMwhCybvuwCFmWC7Gp4Rw+iNyk9cB9zW1oa2xg2o
	 j6FtkS3PxcZ2G6xaDIdIVeJbKlZwXWRz8NqeQsSYc/jx3r4J1jX60YR/YpEdro8RNy
	 DVoz0OlPpNJzWjUX52RwqObVli6gy1TxIaudRqqw=
Date: Thu, 7 May 2026 15:41:20 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 01/13] media: imx355: Remove duplicated registers from
 the mode tables
Message-ID: <afyWYG_idVPEF7RD@zed>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-1-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-1-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: 2235A4E973A
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
	TAGGED_FROM(0.00)[bounces-60810-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,raspberrypi.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Dave,

On Wed, May 06, 2026 at 07:23:39PM +0100, Dave Stevenson wrote:
> A large number of registers are identical within all the modes.
> Move those to imx355_global_regs.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Indeed all the factored-out registers have the same value in all modes
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/imx355.c | 314 +++------------------------------------------
>  1 file changed, 20 insertions(+), 294 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index f9ec13bb27d1..a694d4d742ae 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -226,6 +226,26 @@ static const struct imx355_reg imx355_global_regs[] = {
>  	{ 0x68b0, 0x00 },
>  	{ 0x3058, 0x00 },
>  	{ 0x305a, 0x00 },
> +	{ 0x0112, 0x0a },
> +	{ 0x0113, 0x0a },
> +	{ 0x0114, 0x03 },
> +	{ 0x0301, 0x05 },
> +	{ 0x0303, 0x01 },
> +	{ 0x0305, 0x02 },
> +	{ 0x030d, 0x02 },
> +	{ 0x0310, 0x00 },
> +	{ 0x0220, 0x00 },
> +	{ 0x0222, 0x01 },
> +	{ 0x0820, 0x0b },
> +	{ 0x0821, 0x40 },
> +	{ 0x3088, 0x04 },
> +	{ 0x6813, 0x02 },
> +	{ 0x6835, 0x07 },
> +	{ 0x6836, 0x01 },
> +	{ 0x6837, 0x04 },
> +	{ 0x684d, 0x07 },
> +	{ 0x684e, 0x01 },
> +	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg_list imx355_global_setting = {
> @@ -234,9 +254,6 @@ static const struct imx355_reg_list imx355_global_setting = {
>  };
>
>  static const struct imx355_reg mode_3268x2448_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
>  	{ 0x0340, 0x0a },
> @@ -249,8 +266,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
>  	{ 0x0349, 0xcb },
>  	{ 0x034a, 0x09 },
>  	{ 0x034b, 0x97 },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -258,30 +273,11 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
>  	{ 0x034d, 0xc4 },
>  	{ 0x034e, 0x09 },
>  	{ 0x034f, 0x90 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_3264x2448_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
>  	{ 0x0340, 0x0a },
> @@ -294,8 +290,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
>  	{ 0x0349, 0xc7 },
>  	{ 0x034a, 0x09 },
>  	{ 0x034b, 0x97 },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -303,30 +297,11 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
>  	{ 0x034d, 0xc0 },
>  	{ 0x034e, 0x09 },
>  	{ 0x034f, 0x90 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_3280x2464_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
>  	{ 0x0340, 0x0a },
> @@ -339,8 +314,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
>  	{ 0x0349, 0xcf },
>  	{ 0x034a, 0x09 },
>  	{ 0x034b, 0x9f },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -348,30 +321,11 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
>  	{ 0x034d, 0xd0 },
>  	{ 0x034e, 0x09 },
>  	{ 0x034f, 0xa0 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_1940x1096_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
>  	{ 0x0340, 0x05 },
> @@ -384,8 +338,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
>  	{ 0x0349, 0x33 },
>  	{ 0x034a, 0x06 },
>  	{ 0x034b, 0xf3 },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -393,30 +345,11 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
>  	{ 0x034d, 0x94 },
>  	{ 0x034e, 0x04 },
>  	{ 0x034f, 0x48 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_1936x1096_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
>  	{ 0x0340, 0x05 },
> @@ -429,8 +362,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
>  	{ 0x0349, 0x2f },
>  	{ 0x034a, 0x06 },
>  	{ 0x034b, 0xf3 },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -438,30 +369,11 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
>  	{ 0x034d, 0x90 },
>  	{ 0x034e, 0x04 },
>  	{ 0x034f, 0x48 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_1924x1080_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
>  	{ 0x0340, 0x05 },
> @@ -474,8 +386,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
>  	{ 0x0349, 0x2b },
>  	{ 0x034a, 0x06 },
>  	{ 0x034b, 0xeb },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -483,30 +393,11 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
>  	{ 0x034d, 0x84 },
>  	{ 0x034e, 0x04 },
>  	{ 0x034f, 0x38 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_1920x1080_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
>  	{ 0x0340, 0x05 },
> @@ -519,8 +410,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
>  	{ 0x0349, 0x27 },
>  	{ 0x034a, 0x06 },
>  	{ 0x034b, 0xeb },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x00 },
>  	{ 0x0901, 0x11 },
>  	{ 0x0902, 0x00 },
> @@ -528,30 +417,11 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
>  	{ 0x034d, 0x80 },
>  	{ 0x034e, 0x04 },
>  	{ 0x034f, 0x38 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_1640x1232_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
>  	{ 0x0340, 0x05 },
> @@ -564,8 +434,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
>  	{ 0x0349, 0xcf },
>  	{ 0x034a, 0x09 },
>  	{ 0x034b, 0x9f },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -573,30 +441,11 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
>  	{ 0x034d, 0x68 },
>  	{ 0x034e, 0x04 },
>  	{ 0x034f, 0xd0 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_1640x922_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
>  	{ 0x0340, 0x05 },
> @@ -609,8 +458,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
>  	{ 0x0349, 0xcf },
>  	{ 0x034a, 0x08 },
>  	{ 0x034b, 0x63 },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -618,30 +465,11 @@ static const struct imx355_reg mode_1640x922_regs[] = {
>  	{ 0x034d, 0x68 },
>  	{ 0x034e, 0x03 },
>  	{ 0x034f, 0x9a },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_1300x736_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
>  	{ 0x0340, 0x05 },
> @@ -654,8 +482,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
>  	{ 0x0349, 0x7f },
>  	{ 0x034a, 0x07 },
>  	{ 0x034b, 0xaf },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -663,30 +489,11 @@ static const struct imx355_reg mode_1300x736_regs[] = {
>  	{ 0x034d, 0x14 },
>  	{ 0x034e, 0x02 },
>  	{ 0x034f, 0xe0 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_1296x736_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
>  	{ 0x0340, 0x05 },
> @@ -699,8 +506,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
>  	{ 0x0349, 0x77 },
>  	{ 0x034a, 0x07 },
>  	{ 0x034b, 0xaf },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -708,30 +513,11 @@ static const struct imx355_reg mode_1296x736_regs[] = {
>  	{ 0x034d, 0x10 },
>  	{ 0x034e, 0x02 },
>  	{ 0x034f, 0xe0 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_1284x720_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
>  	{ 0x0340, 0x05 },
> @@ -744,8 +530,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
>  	{ 0x0349, 0x6f },
>  	{ 0x034a, 0x07 },
>  	{ 0x034b, 0x9f },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -753,30 +537,11 @@ static const struct imx355_reg mode_1284x720_regs[] = {
>  	{ 0x034d, 0x04 },
>  	{ 0x034e, 0x02 },
>  	{ 0x034f, 0xd0 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_1280x720_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x07 },
>  	{ 0x0343, 0x2c },
>  	{ 0x0340, 0x05 },
> @@ -789,8 +554,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
>  	{ 0x0349, 0x67 },
>  	{ 0x034a, 0x07 },
>  	{ 0x034b, 0x9f },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x22 },
>  	{ 0x0902, 0x00 },
> @@ -798,30 +561,11 @@ static const struct imx355_reg mode_1280x720_regs[] = {
>  	{ 0x034d, 0x00 },
>  	{ 0x034e, 0x02 },
>  	{ 0x034f, 0xd0 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const struct imx355_reg mode_820x616_regs[] = {
> -	{ 0x0112, 0x0a },
> -	{ 0x0113, 0x0a },
> -	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x0e },
>  	{ 0x0343, 0x58 },
>  	{ 0x0340, 0x02 },
> @@ -834,8 +578,6 @@ static const struct imx355_reg mode_820x616_regs[] = {
>  	{ 0x0349, 0xcf },
>  	{ 0x034a, 0x09 },
>  	{ 0x034b, 0x9f },
> -	{ 0x0220, 0x00 },
> -	{ 0x0222, 0x01 },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x44 },
>  	{ 0x0902, 0x00 },
> @@ -843,24 +585,8 @@ static const struct imx355_reg mode_820x616_regs[] = {
>  	{ 0x034d, 0x34 },
>  	{ 0x034e, 0x02 },
>  	{ 0x034f, 0x68 },
> -	{ 0x0301, 0x05 },
> -	{ 0x0303, 0x01 },
> -	{ 0x0305, 0x02 },
> -	{ 0x030b, 0x01 },
> -	{ 0x030d, 0x02 },
> -	{ 0x0310, 0x00 },
>  	{ 0x0700, 0x02 },
>  	{ 0x0701, 0x78 },
> -	{ 0x0820, 0x0b },
> -	{ 0x0821, 0x40 },
> -	{ 0x3088, 0x04 },
> -	{ 0x6813, 0x02 },
> -	{ 0x6835, 0x07 },
> -	{ 0x6836, 0x01 },
> -	{ 0x6837, 0x04 },
> -	{ 0x684d, 0x07 },
> -	{ 0x684e, 0x01 },
> -	{ 0x684f, 0x04 },
>  };
>
>  static const char * const imx355_test_pattern_menu[] = {
>
> --
> 2.34.1
>
>

