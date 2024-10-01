Return-Path: <linux-media+bounces-18948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D79598C0DE
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3116C283D23
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEA11C9B76;
	Tue,  1 Oct 2024 14:56:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF861C1AD9
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727794587; cv=none; b=AjXrPS0rzhH/hq9K1aXMwqetWrudJGurKRCscIZbjJGBucnequVcraPA7SL+SSKU134kTPQAxUotDCrTmAObwcl8aw94BfNxQfaUV1x2InYf1fVD452HgD+cBjLPRl66v4fOcyi36pEWkTCSZBGJl1BQMjJUIdc3HUOK2ueYnzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727794587; c=relaxed/simple;
	bh=M5EcbSIw8ruyAOhnFIgFERUx8sLg2DPvF2xRseh0iQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2GINxhSEBn8uOCREp5c3hRe7foGsqSFIUJcbd7Ki78WTZf4j4Vt1aPsKzHDmIaPVCYrSpo7d8pMgNKpLWUimizJQ+NCPMfTvTl6DGWUaNfRmFckIiPq6uTIt+rrSQ7bNY/ny0vC6EPl42ZhtCCYQxfT479jA2FjClcAW3oit6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1sveIa-0007rr-0G; Tue, 01 Oct 2024 16:56:24 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1sveIZ-002tkQ-JH; Tue, 01 Oct 2024 16:56:23 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1sveIZ-004zkJ-1f;
	Tue, 01 Oct 2024 16:56:23 +0200
Date: Tue, 1 Oct 2024 16:56:23 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/3] media: i2c: isl7998x: Enable VACTIVE and HDELAY
 shadow registers
Message-ID: <ZvwNlwSJyJ52I9Mp@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20240713154242.107903-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240713154242.107903-1-marex@denx.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Sat, 13 Jul 2024 17:41:54 +0200, Marek Vasut wrote:
> The VACTIVE and HDELAY shadow registers must be enabled for per channel
> NTSC/PAL detection to work, enable them.

I think the description is wrong as the change doesn't affect the
VACTIVE and HDELAY registers. The change sets the standard selection
register to auto detection to always trigger a standard detection during
initialization instead of defaulting to NTSC. querystd explicitly
triggers this behavior.

If the driver always runs standard detection during init, the driver
should also wait for the detection to be finished and update
isl7998x->norm accordingly, because otherwise the standard will be reset
to NTSC.

Maybe we can also get rid of this part from the init sequence and run
the standard detection during the initialization in code?

Michael

> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Michael Tretter <m.tretter@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> ---
>  drivers/media/i2c/isl7998x.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> index c7089035bbc10..5f8f11f7a2c1c 100644
> --- a/drivers/media/i2c/isl7998x.c
> +++ b/drivers/media/i2c/isl7998x.c
> @@ -312,13 +312,13 @@
>  
>  static const struct reg_sequence isl7998x_init_seq_1[] = {
>  	{ ISL7998X_REG_P0_SHORT_DIAG_IRQ_EN, 0xff },
> -	{ ISL7998X_REG_PX_DEC_SDT(0x1), 0x00 },
> +	{ ISL7998X_REG_PX_DEC_SDT(0x1), 0x07 },
>  	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x1), 0x03 },
> -	{ ISL7998X_REG_PX_DEC_SDT(0x2), 0x00 },
> +	{ ISL7998X_REG_PX_DEC_SDT(0x2), 0x07 },
>  	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x2), 0x03 },
> -	{ ISL7998X_REG_PX_DEC_SDT(0x3), 0x00 },
> +	{ ISL7998X_REG_PX_DEC_SDT(0x3), 0x07 },
>  	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x3), 0x03 },
> -	{ ISL7998X_REG_PX_DEC_SDT(0x4), 0x00 },
> +	{ ISL7998X_REG_PX_DEC_SDT(0x4), 0x07 },
>  	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x4), 0x03 },
>  	{ ISL7998X_REG_P5_LI_ENGINE_CTL, 0x00 },
>  	{ ISL7998X_REG_P0_SW_RESET_CTL, 0x1f, 10 },
> -- 
> 2.43.0
> 
> 

