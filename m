Return-Path: <linux-media+bounces-63632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XxxzHq9JIGoF0QAAu9opvQ
	(envelope-from <linux-media+bounces-63632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 17:35:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B46393F1
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 17:35:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=IJaKYMoQ;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="U VXNee0";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63632-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63632-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93406320CE29
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 15:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B283D7D77;
	Wed,  3 Jun 2026 15:17:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18A53D6688;
	Wed,  3 Jun 2026 15:17:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499841; cv=none; b=gPjRPJHLw3OLcbjEbY908XWWd1q9JiflDNP8ca0eAiTAbZto3GhtNbd+jPhof5ZxqFCQ1paAPASlZDKyZsbc8X3pEEdfdzJ5AOn0wmqfPMMjNXuRZBca4xSXaIzAynygTjFFeHWIe349C0kpVUerXvGh7olYM5Qe3o/7U7b+cKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499841; c=relaxed/simple;
	bh=tKKL/tezFIC1NPIp9rLGjZQbRMHGIbAGAXOleoVfCVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVG0whlUzv7nkc7D+xaszSp+mpBermb7NL3GwL8PMlZIFr7ZMVgakgII2ODzyzqn9F026H/WJtjQyhjGS3XOBenSw6v2FTC6KyEU3OLD0i164YNx3hHdF+Su0pW0YGV+19MjFyqIxlwgd/0I+zyDhxq7943COHcJfXIdxKfKa2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IJaKYMoQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UVXNee0m; arc=none smtp.client-ip=103.168.172.146
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id CB105EC0101;
	Wed,  3 Jun 2026 11:17:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 03 Jun 2026 11:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780499838;
	 x=1780586238; bh=H5vEI4cly9OU/uRuVAuKPDaqAhj41V3lNjzvMinqY7Q=; b=
	IJaKYMoQ/6KbCItZfbO41snDSwpLhUaQDf7oXfSFYezqSL91uk5Q0/GEQV4hG4sj
	dU5wm9a2uLAigIIVfZJBBYoSMxcOtkxaH/a9YpIa+/cACG1sA6d/rzR0UIwoQUuK
	/abOhFQm36cQKv5IRi1Mcb82Ab5JlsXTR6DkeBXREE8lHRJC7RJKRPgrmqwrNqMu
	9xLDGUT7eWrkORLuP6sGJw+TH5dVxtf1Mvu2VgoR9HQHgtRbnKHQF3HpNtnmwZSR
	DMhaXr2JrrGANYc+KkZmd+LTGzYAzgRvQSVwTuVa4phWvSmJ5MuZdWzTFLH3V7Qp
	U5uyEi3sNqQYzRbaLkYj+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780499838; x=
	1780586238; bh=H5vEI4cly9OU/uRuVAuKPDaqAhj41V3lNjzvMinqY7Q=; b=U
	VXNee0mU9g4NF0M8lhBgFgog29qhL//dZovXDZT/aSewZ17r/JUBD9rbotESz1CX
	xZ2kf6u9EyJGFUCuCoTndddCQqkYbibOmnYs90Cg7f9ugj8kcSwxU29UaYlHduV+
	2dwsg4Rb97xDOGa0s0sHY1NkSo0+V4zTJ1KKUAOyYEHEb8Pw1ZTGnsoUpj8yhOvB
	wkm/TjcFNY2luYHL4TfTKRk/mRoLxkBhViX/brDqivFpkKWys5vrTgzWRnW1+MoC
	PO9crIoOvvsf4nZwvZJ8e9NABjlxrcdr+jFZ2aO8EnOUDp8ZkFYXK3TDWOR85F37
	BpcJOeZLdLJNh2gK9grOA==
X-ME-Sender: <xms:fkUgap3fXCx6iPDRYVQKXlqrXgv6Mqg46_IFaTYIvosMOqx6MYKCXA>
    <xme:fkUgagj6z7DUPyTcdHMsbvNymT0srBe_iHQDXF0ahk04qpJDB0ObYnGRhlsESKRq_
    OfWE2T-1vigeCi0Zv4uFSxI1Xq2eZiBtsJIGyCKhBFsiy2ANdy20Q>
X-ME-Received: <xmr:fkUgaqmhl1un9nKMu1speKrXEoGxk_hr3UwboeAYBambcR92ZVrvAqlKVaNmv_UTdENaGKuvHElgiVBlFvtekaoJKeKnEn3oRRBM>
X-ME-Proxy-Cause: dmFkZTGRuHd1pVBxUF1VwOak8l1e6ry2dhVigbHRIZRMgripKRb+Wjju032Rb7yzmgSGXl
    5Q8TFcZLwvzxTImndRK4mG+UTc5KVvDGdzuiW3W7OKIIUtHcyL4Bi83Mk/IpxDtl3lNf4S
    SggF1p01Ry1/vGHbJh1aDAtMNZT9RG7XptfZifyDHIWMw5oY2YjiQxXELE8LASXwnQbR8l
    5Et93fAij55Rxgx+2MsW/h/sK0NVQfFt8Cg9StPF6Plpn0VilpkFLqLRfgYstDk2+JXt5M
    Vj6c3lPoL5Sicv3qIH9Hjwl4ifyjEbl4DulEyI3EOzfpsycx9YAZZjwFXc6wdaAsFEYpgo
    t5HtI6XmLp+dXn6FMc936L3RMOK0Mg58jjm61jCHoKN7O4EKlGRL1OcN7Lm5Ehgl3Y9VSO
    d5lJMGUG/yIfIVmkizQrs66GIqg6zrlKC/Bgm9avE+BkQmNSUXo9mTUp5pHr2ij3j051q3
    eMf4gAUoBKWgau8S9uOkB822v3ZqfwFl6tpBFYj98UfrGeFc4vfgGSgr0R6se6LLtg7W3b
    apUqDPoh0nEzjuewVYgGIghIY5ZrKt3aTcfd4NBsXl2TutQOZ+fhJ1l8pDMLaG0T0VOuVR
    QqQZc4y/+4zljcKvwNLa3Df0zR+PG5nBG9QAxdjhpTJIJZxVaNPMLydWq/Yg
X-ME-Proxy: <xmx:fkUgauaRZUgo2rSMJTVMZvSOwQDTgHZftWrawMczdvsjLPtS3XAdYg>
    <xmx:fkUgatH7AXzmbRFT3kk70G08EukTodtjLnZK4zSgbwBENVd5IlePRg>
    <xmx:fkUgalb_NijvJblKFDPPiuLIclZuUX7fQLcT_5OVJi7cba3ZoBAFMQ>
    <xmx:fkUgapzTN9w4ZVM4nUz4qhDKaURbuUqrU2_gmMbusPMSJ0dZA1dt9Q>
    <xmx:fkUgaq7e36TctTJcjsWGdDs4UMUCyDc8Dj1D09g7bNCmq2whXHKI3boa>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 11:17:17 -0400 (EDT)
Date: Wed, 3 Jun 2026 17:17:15 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v9 03/13] media: rppx1: Add framework to support
 Dreamchip RPPX1 ISP
Message-ID: <20260603151715.GF91369@ragnatech.se>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-4-niklas.soderlund+renesas@ragnatech.se>
 <aiAb60X2HP-yra25@zed>
 <20260603134748.GE91369@ragnatech.se>
 <aiA2oG8MoXld5aEw@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiA2oG8MoXld5aEw@zed>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63632-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,messagingengine.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 741B46393F1

Hi Jacopo,

Thanks for your feedback.

On 2026-06-03 16:26:45 +0200, Jacopo Mondi wrote:

[ snip ]

> > > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c 
> > > > b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
> > > > new file mode 100644
> > > > index 000000000000..3bfad3ba12e6
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
> > > > @@ -0,0 +1,105 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > > + * Copyright (C) 2026 Ideas on Board Oy
> > > > + * Copyright (C) 2026 Ragnatech AB
> > > > + */
> > > > +
> > > > +#include "rpp_module.h"
> > > > +
> > > > +#define CCOR_VERSION_REG				0x0000
> > > > +
> > > > +#define CCOR_COEFF_REG_NUM				9
> > > > +#define CCOR_COEFF_REG(n)				(0x0004 + (4 * (n)))
> > > > +
> > > > +#define CCOR_OFFSET_R_REG				0x0028
> > > > +#define CCOR_OFFSET_G_REG				0x002c
> > > > +#define CCOR_OFFSET_B_REG				0x0030
> > > > +
> > > > +#define CCOR_CONFIG_TYPE_REG				0x0034
> > > > +#define CCOR_CONFIG_TYPE_USE_OFFSETS_AS_PRE_OFFSETS	BIT(1)
> > > > +#define CCOR_CONFIG_TYPE_CCOR_RANGE_AVAILABLE		BIT(0)
> > > > +
> > > > +#define CCOR_RANGE_REG					0x0038
> > > > +#define CCOR_RANGE_CCOR_C_RANGE				BIT(1)
> > > > +#define CCOR_RANGE_CCOR_Y_RANGE				BIT(0)
> > > > +
> > > > +static int rppx1_ccor_probe(struct rpp_module *mod)
> > > > +{
> > > > +	/* Version check. */
> > > > +	switch (rpp_module_read(mod, CCOR_VERSION_REG)) {
> > > > +	case 3:
> > > > +		/* 12-bit. */
> > > > +		break;
> > > > +	case 4:
> > > > +		/* 20-bit. */
> > > > +		break;
> > > > +	case 5:
> > > > +		/* 24-bit. */
> > > > +		break;
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int rppx1_ccor_start(struct rpp_module *mod,
> > > > +			    const struct v4l2_mbus_framefmt *fmt)
> > > > +{
> > > > +	/* Configure matrix in bypass mode. */
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(0), 0x1000);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(1), 0x0000);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(2), 0x0000);
> > > > +
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(3), 0x0000);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(4), 0x1000);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(5), 0x0000);
> > > > +
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(6), 0x0000);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(7), 0x0000);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(8), 0x1000);
> > > > +
> > > > +	rpp_module_write(mod, CCOR_OFFSET_R_REG, 0x00000000);
> > > > +	rpp_module_write(mod, CCOR_OFFSET_G_REG, 0x00000000);
> > > > +	rpp_module_write(mod, CCOR_OFFSET_B_REG, 0x00000000);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +const struct rpp_module_ops rppx1_ccor_ops = {
> > > > +	.probe = rppx1_ccor_probe,
> > > > +	.start = rppx1_ccor_start,
> > > > +};
> > > > +
> > > > +static int rppx1_ccor_csm_start(struct rpp_module *mod,
> > > > +				const struct v4l2_mbus_framefmt *fmt)
> > > > +{
> > > > +	/* Reuse bypass matrix setup. */
> > > > +	if (fmt->code == MEDIA_BUS_FMT_RGB888_1X24)
> > > > +		return rppx1_ccor_start(mod, fmt);
> > > > +
> > > > +	/* Color Transformation RGB to YUV according to ITU-R BT.709. */
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(0), 0x0367);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(1), 0x0b71);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(2), 0x0128);
> > > > +
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(3), 0xfe2b);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(4), 0xf9d5);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(5), 0x0800);
> > > > +
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(6), 0x0800);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(7), 0xf8bc);
> > > > +	rpp_module_write(mod, CCOR_COEFF_REG(8), 0xff44);
> > > > +
> > > > +	rpp_module_write(mod, CCOR_OFFSET_R_REG, 0x00000000);
> > > > +	rpp_module_write(mod, CCOR_OFFSET_G_REG, 0x00000800);
> > > > +	rpp_module_write(mod, CCOR_OFFSET_B_REG, 0x00000800);
> > >
> > > Is this a leftover or is it intetional ?
> >
> > Intentional.
> >
> > Most of the _start callbacks just disables or configure pass-thru mode
> > of each modules that are not used (read not yet configured by
> > user-space). And this is what is done here, configure the CCOR in
> > pass-thru mode.
> >
> > The RGB case is easiest as it's just configure the identity matrix.
> > While for the YUV case we need to pick something as a default and I
> > picked ITU-R BT.709 as IIRC this was the default for RkISP1.
> 
> Sorry, I don't think I'm following here.
> 
> Color correction is applied in RGB space, what's the YUV case and
> why should you use the CCM for color-space conversion ?
> 
> Are you confusing this block with the colorspace conversion matrix in
> the AWB stats engine that is used to return stats in YUV mode ?

I thought I had it clear in my mind, but after reading this I'm confused 
too ;-) Let's start from scratch and hash this out.

In rppx1_ccor.c there is code for a color correction module. A bit 
simplified this module is a color matrix multiplication and an offset 
for each color component. However this module is used in three 
different places,

- In the POST pipeline as the CCOR module used for color correction 
  control. See CCOR_BASE in datasheet. In this driver this module is 
  implemented as struct rpp_module_ops rppx1_ccor_ops.

- In each of the two OUTPUT pipelines (Human Vision and Machine Vision) 
  as a CSM color space matrix where it is used for conversion from 
  linear RGB to YcbCr. See CSM_BASE in the datasheet. In this driver 
  this module is implemented as struct rpp_module_ops 
  rppx1_ccor_csm_ops.

Both struct rppx1_ccor_ops and struct rppx1_ccor_csm_ops are implemented 
in this rppx1_ccor.c file as they module is the same only the 
configuration of them differ as they have different functions in the 
pipeline.

For the CCOR module in the POST pipeline it can be used to correct 
colors. As we have no disable bit for this module we configure it in 
pass-thru mode in rppx1_ccor_start() by just programming the identity 
matrix and no offsets.

For the CSM module in each of the two OUTPUT pipelines (only Human 
Vision is supported) the function is to do color space conversion. And 
this is what we see here in rppx1_ccor_csm_start().

If the output format of the RPPX1 is to be RGB we do "nothing" and just 
program the identity matrix with no offsets by calling 
rppx1_ccor_start(). However if the output format is to be YUYV we need 
convert it, and that is what you see here. IIRC I picked RGB to YUV 
according to ITU-R BT.709 as this is what RkISP1 do.

Without this we are not able to support both output formats. So for SCM 
this can't really be configured at runtime as it depends on the output 
format. While for CCOR it can be configured at runtime but we need some 
default setting to start with, else I have seen either complete black 
images or a lockup of the pipeline.

Does it make sens? It is a tad confusing as the same code is used for 
different functions at different stages in the pipeline.

> 
> >
> > >
> > > Userspace is expected to fully configure the block, I'm not sure this
> > > default initialization is useful.
> >
> > If this is not configured I have been able to lockup the whole
> > processing pipeline during development.
> >
> 
> Indeed, if there's no disable bit, the ccm shall be programmed with an
> identity matrix
> 
>  write(priv, mod->base + CCOR_COEFF_REG(0), 0x1000);
>  write(priv, mod->base + CCOR_COEFF_REG(1), 0x0000);
>  write(priv, mod->base + CCOR_COEFF_REG(2), 0x0000);
> 
>  write(priv, mod->base + CCOR_COEFF_REG(3), 0x0000);
>  write(priv, mod->base + CCOR_COEFF_REG(4), 0x1000);
>  write(priv, mod->base + CCOR_COEFF_REG(5), 0x0000);
> 
>  write(priv, mod->base + CCOR_COEFF_REG(6), 0x0000);
>  write(priv, mod->base + CCOR_COEFF_REG(7), 0x0000);
>  write(priv, mod->base + CCOR_COEFF_REG(8), 0x1000);
> 
>  write(priv, mod->base + CCOR_OFFSET_R_REG, 0x00000000);
>  write(priv, mod->base + CCOR_OFFSET_G_REG, 0x00000000);
>  write(priv, mod->base + CCOR_OFFSET_B_REG, 0x00000000);
> 
> ?

Yes and that is what we do in CCOR module (always) and in CSM if output 
is RGB.

> 
> > >
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +const struct rpp_module_ops rppx1_ccor_csm_ops = {
> > > > +	.probe = rppx1_ccor_probe,
> > > > +	.start = rppx1_ccor_csm_start,
> > > > +};
> > > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
> > > > new file mode 100644

[snip]

-- 
Kind Regards,
Niklas Söderlund

