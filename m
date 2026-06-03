Return-Path: <linux-media+bounces-63635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fmixEwJVIGok1QAAu9opvQ
	(envelope-from <linux-media+bounces-63635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 18:23:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBF639AE0
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 18:23:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=NpbiLWac;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63635-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63635-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30036316316D
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 15:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2D63A9624;
	Wed,  3 Jun 2026 15:33:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640FC33D4FD;
	Wed,  3 Jun 2026 15:33:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500836; cv=none; b=pKkXwpfPC7MTL2TAGx/RhODV0SgO9F2knpkgnvGqzL06hibRDm/XEU6z6MQ1h1233dY2blfjL6ZA2E7POmbTRr7udkYOVA2Yi0xrdeIaA8fxZat7+kaH85d14xQ0kfoOfltLC31keMwQhQlh9UyPPSRUFMWMMjDgfxTNC1p5dxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500836; c=relaxed/simple;
	bh=dkDKkSkOyqsW+XtSHaers0iLJAmjRs8yPsYGxydyJQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFQDk2YimN8iQXk2OBnA9rhvpiicbPRb/FlOAZ3w2xpvZNUnJSRYQCfsk40aKLuHRumfKJz+DLw7EvOcfROScAjcwSXm6rQJw97ntdFpks7yXuzG26dzxn16eJaeNlmSyg5HUAAJ7+pW3y2n53c9ze2WTWoIBuWtF6kVYlAPpak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NpbiLWac; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EB88986;
	Wed,  3 Jun 2026 17:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780500808;
	bh=dkDKkSkOyqsW+XtSHaers0iLJAmjRs8yPsYGxydyJQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpbiLWachmQKHl9dH7F6UVO7CX+qGKBlGnVmUGZ/Dhb7UsgHRYq27AC1ZZjLyY3ca
	 UBpuw1x2sS4fro63GLGMzaUtBqX2gBPA1FFjAQdt68QElhobNpfRsYa0DbScu6lLQF
	 TwFi7EyqzZsoGVojnhsHZ8HwqXeO8zN5eQ/ncBzo=
Date: Wed, 3 Jun 2026 17:33:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v9 03/13] media: rppx1: Add framework to support
 Dreamchip RPPX1 ISP
Message-ID: <aiBHR2A5WqNfcmv_@zed>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-4-niklas.soderlund+renesas@ragnatech.se>
 <aiAb60X2HP-yra25@zed>
 <20260603134748.GE91369@ragnatech.se>
 <aiA2oG8MoXld5aEw@zed>
 <20260603151715.GF91369@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603151715.GF91369@ragnatech.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63635-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:from_mime,ideasonboard.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51EBF639AE0

Hi Niklas

On Wed, Jun 03, 2026 at 05:17:15PM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for your feedback.
>
> On 2026-06-03 16:26:45 +0200, Jacopo Mondi wrote:
>
> [ snip ]
>
> > > > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
> > > > > b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
> > > > > new file mode 100644
> > > > > index 000000000000..3bfad3ba12e6
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
> > > > > @@ -0,0 +1,105 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > > > + * Copyright (C) 2026 Ideas on Board Oy
> > > > > + * Copyright (C) 2026 Ragnatech AB
> > > > > + */
> > > > > +
> > > > > +#include "rpp_module.h"
> > > > > +
> > > > > +#define CCOR_VERSION_REG				0x0000
> > > > > +
> > > > > +#define CCOR_COEFF_REG_NUM				9
> > > > > +#define CCOR_COEFF_REG(n)				(0x0004 + (4 * (n)))
> > > > > +
> > > > > +#define CCOR_OFFSET_R_REG				0x0028
> > > > > +#define CCOR_OFFSET_G_REG				0x002c
> > > > > +#define CCOR_OFFSET_B_REG				0x0030
> > > > > +
> > > > > +#define CCOR_CONFIG_TYPE_REG				0x0034
> > > > > +#define CCOR_CONFIG_TYPE_USE_OFFSETS_AS_PRE_OFFSETS	BIT(1)
> > > > > +#define CCOR_CONFIG_TYPE_CCOR_RANGE_AVAILABLE		BIT(0)
> > > > > +
> > > > > +#define CCOR_RANGE_REG					0x0038
> > > > > +#define CCOR_RANGE_CCOR_C_RANGE				BIT(1)
> > > > > +#define CCOR_RANGE_CCOR_Y_RANGE				BIT(0)
> > > > > +
> > > > > +static int rppx1_ccor_probe(struct rpp_module *mod)
> > > > > +{
> > > > > +	/* Version check. */
> > > > > +	switch (rpp_module_read(mod, CCOR_VERSION_REG)) {
> > > > > +	case 3:
> > > > > +		/* 12-bit. */
> > > > > +		break;
> > > > > +	case 4:
> > > > > +		/* 20-bit. */
> > > > > +		break;
> > > > > +	case 5:
> > > > > +		/* 24-bit. */
> > > > > +		break;
> > > > > +	default:
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int rppx1_ccor_start(struct rpp_module *mod,
> > > > > +			    const struct v4l2_mbus_framefmt *fmt)
> > > > > +{
> > > > > +	/* Configure matrix in bypass mode. */
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(0), 0x1000);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(1), 0x0000);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(2), 0x0000);
> > > > > +
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(3), 0x0000);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(4), 0x1000);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(5), 0x0000);
> > > > > +
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(6), 0x0000);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(7), 0x0000);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(8), 0x1000);
> > > > > +
> > > > > +	rpp_module_write(mod, CCOR_OFFSET_R_REG, 0x00000000);
> > > > > +	rpp_module_write(mod, CCOR_OFFSET_G_REG, 0x00000000);
> > > > > +	rpp_module_write(mod, CCOR_OFFSET_B_REG, 0x00000000);
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +const struct rpp_module_ops rppx1_ccor_ops = {
> > > > > +	.probe = rppx1_ccor_probe,
> > > > > +	.start = rppx1_ccor_start,
> > > > > +};
> > > > > +
> > > > > +static int rppx1_ccor_csm_start(struct rpp_module *mod,
> > > > > +				const struct v4l2_mbus_framefmt *fmt)
> > > > > +{
> > > > > +	/* Reuse bypass matrix setup. */
> > > > > +	if (fmt->code == MEDIA_BUS_FMT_RGB888_1X24)
> > > > > +		return rppx1_ccor_start(mod, fmt);
> > > > > +
> > > > > +	/* Color Transformation RGB to YUV according to ITU-R BT.709. */
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(0), 0x0367);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(1), 0x0b71);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(2), 0x0128);
> > > > > +
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(3), 0xfe2b);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(4), 0xf9d5);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(5), 0x0800);
> > > > > +
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(6), 0x0800);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(7), 0xf8bc);
> > > > > +	rpp_module_write(mod, CCOR_COEFF_REG(8), 0xff44);
> > > > > +
> > > > > +	rpp_module_write(mod, CCOR_OFFSET_R_REG, 0x00000000);
> > > > > +	rpp_module_write(mod, CCOR_OFFSET_G_REG, 0x00000800);
> > > > > +	rpp_module_write(mod, CCOR_OFFSET_B_REG, 0x00000800);
> > > >
> > > > Is this a leftover or is it intetional ?
> > >
> > > Intentional.
> > >
> > > Most of the _start callbacks just disables or configure pass-thru mode
> > > of each modules that are not used (read not yet configured by
> > > user-space). And this is what is done here, configure the CCOR in
> > > pass-thru mode.
> > >
> > > The RGB case is easiest as it's just configure the identity matrix.
> > > While for the YUV case we need to pick something as a default and I
> > > picked ITU-R BT.709 as IIRC this was the default for RkISP1.
> >
> > Sorry, I don't think I'm following here.
> >
> > Color correction is applied in RGB space, what's the YUV case and
> > why should you use the CCM for color-space conversion ?
> >
> > Are you confusing this block with the colorspace conversion matrix in
> > the AWB stats engine that is used to return stats in YUV mode ?
>
> I thought I had it clear in my mind, but after reading this I'm confused
> too ;-) Let's start from scratch and hash this out.
>
> In rppx1_ccor.c there is code for a color correction module. A bit
> simplified this module is a color matrix multiplication and an offset
> for each color component. However this module is used in three
> different places,
>
> - In the POST pipeline as the CCOR module used for color correction
>   control. See CCOR_BASE in datasheet. In this driver this module is
>   implemented as struct rpp_module_ops rppx1_ccor_ops.
>
> - In each of the two OUTPUT pipelines (Human Vision and Machine Vision)
>   as a CSM color space matrix where it is used for conversion from
>   linear RGB to YcbCr. See CSM_BASE in the datasheet. In this driver
>   this module is implemented as struct rpp_module_ops
>   rppx1_ccor_csm_ops.

I had completely missed this is the 'csm' and this module handles both
the CCM and the color space conversion o_0

I thought only CCM was handled here.

>
> Both struct rppx1_ccor_ops and struct rppx1_ccor_csm_ops are implemented
> in this rppx1_ccor.c file as they module is the same only the
> configuration of them differ as they have different functions in the
> pipeline.
>

Oook I was not expecting this


> For the CCOR module in the POST pipeline it can be used to correct
> colors. As we have no disable bit for this module we configure it in
> pass-thru mode in rppx1_ccor_start() by just programming the identity
> matrix and no offsets.
>
> For the CSM module in each of the two OUTPUT pipelines (only Human
> Vision is supported) the function is to do color space conversion. And
> this is what we see here in rppx1_ccor_csm_start().
>
> If the output format of the RPPX1 is to be RGB we do "nothing" and just
> program the identity matrix with no offsets by calling
> rppx1_ccor_start(). However if the output format is to be YUYV we need
> convert it, and that is what you see here. IIRC I picked RGB to YUV
> according to ITU-R BT.709 as this is what RkISP1 do.
>
> Without this we are not able to support both output formats. So for SCM
> this can't really be configured at runtime as it depends on the output
> format. While for CCOR it can be configured at runtime but we need some
> default setting to start with, else I have seen either complete black
> images or a lockup of the pipeline.
>
> Does it make sens? It is a tad confusing as the same code is used for
> different functions at different stages in the pipeline.
>

I completely missed the 'csm' part. I guess this is ok, even in a
single file.

Sorry for the noise and thanks for the time taken.

> >
> > >
> > > >
> > > > Userspace is expected to fully configure the block, I'm not sure this
> > > > default initialization is useful.
> > >
> > > If this is not configured I have been able to lockup the whole
> > > processing pipeline during development.
> > >
> >
> > Indeed, if there's no disable bit, the ccm shall be programmed with an
> > identity matrix
> >
> >  write(priv, mod->base + CCOR_COEFF_REG(0), 0x1000);
> >  write(priv, mod->base + CCOR_COEFF_REG(1), 0x0000);
> >  write(priv, mod->base + CCOR_COEFF_REG(2), 0x0000);
> >
> >  write(priv, mod->base + CCOR_COEFF_REG(3), 0x0000);
> >  write(priv, mod->base + CCOR_COEFF_REG(4), 0x1000);
> >  write(priv, mod->base + CCOR_COEFF_REG(5), 0x0000);
> >
> >  write(priv, mod->base + CCOR_COEFF_REG(6), 0x0000);
> >  write(priv, mod->base + CCOR_COEFF_REG(7), 0x0000);
> >  write(priv, mod->base + CCOR_COEFF_REG(8), 0x1000);
> >
> >  write(priv, mod->base + CCOR_OFFSET_R_REG, 0x00000000);
> >  write(priv, mod->base + CCOR_OFFSET_G_REG, 0x00000000);
> >  write(priv, mod->base + CCOR_OFFSET_B_REG, 0x00000000);
> >
> > ?
>
> Yes and that is what we do in CCOR module (always) and in CSM if output
> is RGB.
>
> >
> > > >
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +const struct rpp_module_ops rppx1_ccor_csm_ops = {
> > > > > +	.probe = rppx1_ccor_probe,
> > > > > +	.start = rppx1_ccor_csm_start,
> > > > > +};
> > > > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
> > > > > new file mode 100644
>
> [snip]
>
> --
> Kind Regards,
> Niklas Söderlund

