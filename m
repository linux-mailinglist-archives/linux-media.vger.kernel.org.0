Return-Path: <linux-media+bounces-65129-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IECkCybcMmoI6QUAu9opvQ
	(envelope-from <linux-media+bounces-65129-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 19:40:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C769BC02
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 19:40:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=Mq1V6H62;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65129-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65129-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CD323013484
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 17:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D01B1DE8BF;
	Wed, 17 Jun 2026 17:40:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E9A340A6B
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 17:40:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781718044; cv=pass; b=B6M6+gAPGYZ+liV9P6bhDLcKiE5TEPlFuRPYKGQBsOe9jNhZm02//+DRx/k/fAoKwetyr67cQHbdymsHaqk6G3oNLQWZAMMlA+BhyHfVdlZDN1m6FBLNnGhmyacLEsalyR/G2D80AC3DlOWxfI4jmUua4C/EuAK+H3mmSylpA2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781718044; c=relaxed/simple;
	bh=p8/Rqe+Sw1mRPxL4rzHGS5vCpKwWGLiPRs9c9C8hDn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8Nb9AR85DEeeZDOyeDrBa6a3+KsPwA8mUSWbDovc/L9GERTdivEVX3OCPLFWYd2nLpakKdNamNQIEQk/Rd/Q9k4McxPA3zKxyf+DME4DeBMstxEN8nGXDVKKshJLXF4m8EdPUpclc8vyoF+WvRT8DEbZOWMnw3Y4le8AukvYGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Mq1V6H62; arc=pass smtp.client-ip=209.85.128.179
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7ff05e5d009so1202537b3.1
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 10:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781718040; cv=none;
        d=google.com; s=arc-20240605;
        b=dTEhDyLR95l4uVGi0CTiaRp2rWraebYqlGUKIz+BZeD5Xe+F+ZkMRcH5U8czhchFtZ
         eYlxrpn6cvGyu8tfYgKkwlrOsO5iPbOJnAUInAMLCrY0my0i4ZSaVCxueGtx9DD0jf4V
         5hnrrzbwIxTz7+NVPzUXCdo9wqopVDVkzoC1cLWoW9cX1rkhmDLRE6CCRmhzsIyU/z3u
         do0gCwZoh1LraTB7xyEEanCLfpYB1Qh+Tr2E2HwtxtUtQrdGK9y6UWRzBsPcgBZ/oTx/
         xkq5w4g6H88g1e2DdU4trRiolKPIZsudQ7Jm+Srm2CcP6JYYbJpPy8E32VqFG3yvVcys
         ZD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uUnJMukEhJSiKbsws6tu0aSz6HaKj7X7xQpgnhZga/Q=;
        fh=LU6szFDMLx4aBNzYbmPck+L57Foi1GYMdKd3wdGHzWo=;
        b=XpQsDDnlY5Och1khydtwnYegkfgbzhq29qU3/lilwyFNbJrGFVOhkEUid5OVeLjrDF
         zNitVJ79eRZEM+xRhLpYk0GYRYViyFJHkzrN+SLSe7AoLuV6IQeTLCgTfwQczEFZPcUu
         9zrCJHHsiserFIulrLqmp9542gdIszEiZvHnfXgcmZv3xS9X+s4oYWrmeKj8kySMe6b3
         3T1TEfpC0et2pkVzCx3jF5hvl6KA3nLqCICs/o/ypKXSGzeNHWYdBuk6fdPXJkxlKl3Z
         ZZMIW8L3xTNEE6cqqu3HaTIptGy+J+UWT6+j3qxXl/rQtX0iriTVwyvNxS57yGsUV2Cn
         JZxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1781718040; x=1782322840; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uUnJMukEhJSiKbsws6tu0aSz6HaKj7X7xQpgnhZga/Q=;
        b=Mq1V6H62BVw00/hQik5BuCn1Uj0kESFeoSllOhgbXvJ2Qv5FrsHnk+COJG5ob7GjJN
         8m2DPjXju3jDf5zi52hdfEc40ShsGRvuA4XJRrL1QKXF/3qo8rhUl5Xyg6/zhb5I1X/E
         lWoyjRvexD0l6DxpEQcqrG4Rit26PxUx5TvoSVaMSbmwMCM3XsQ/5syMUD/3L8sQn23Y
         2FFI4A5YvNVqKyDl9lZZXE761oi+haex7dz/eaEw5XDPc3uQAD6SarfoP1R8UMaSGDIT
         U+vkZsnQ/KO5YOx8dCpEdVhhhwvBSrKrFrsdpkSQU9pQMG9Uuw224wnQ07XU4kNE1x4J
         UbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781718040; x=1782322840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUnJMukEhJSiKbsws6tu0aSz6HaKj7X7xQpgnhZga/Q=;
        b=ZC7I/TulKAVSf/F7N058WjpBqPiXmz/MVkUeJHxPM83+01Q7yw8M5N0e5bxS1XlHD8
         hjXnZhWhJjwPXqt696a9IFdO0aGr+41a0Gx1TGfvxSBNoQOcgDvpyO7SNKYeDK83i1Ft
         h7wJGOiwOZDiDczLZmsYpxQ5jCkEaZk3dxkiSIsnt/SGyRRv92AnK6+mnCGzk6Bb4cX0
         QGfLVIMFEalSOeZH7lDJ5hhdfYSqWFbwxjR35sha/GbJnpR675dR2ZQGBzw/5M3meO41
         c52kgpylvz63VrPhLdf275seUU648odls38VJLnNoYj6MKFHjxdjBIljOET72lJ1Lmqk
         vx3A==
X-Forwarded-Encrypted: i=1; AFNElJ8171SsOPIuKeeFhYPaxSfc28YHFKWqVBMSF/KssnqzAlAhVWpZ9Ns3BY4lBRHgxtVae3EvSkgOcqbVJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznTiLaU2EJbJNFBCiszW6oubmgw5HTKMcNsBVrSwbN9rlKtWON
	pO7yf8jYQkjbN3PuAIVBzJ471ouHpfOYAvif64pGW1tIdD0XSgWwqgynCzkJhbxYdA+YsPCCVAU
	NZf53xE+DJIhMjtsNRxqwVPz+3ns6c96sirYeu9M1LA==
X-Gm-Gg: AfdE7ckqFGJKIgGp1vhFdhrNm2dut2cl0b+OBqw2Nu5Bc7LeXj0WHcj9EXjgAr7hcv/
	6YhgKUuWYg1jVLebTy/p8razpOYo5doDXkwYPyUdmz6t7GyZmob5KdTtDZlhSBA/DgRDAKSF8RK
	vUlsuK+coZDhtFPMJ1fZa/Gp+iR+Rmtw9nE0clkQZUNvtlN2+Gfs+4L5ffOfnCGRM3VJgo7jPAB
	/CRF24etDIdnTX3SGlfUoO7NQK1Rnpo9M1gYTJp94KEN7Y/xtkZ268I47WRlEOLdVnylETPz8z4
	6MkKh9Lp9ftO0WSvpzyGEt3rhLSwe5XNhyAqvngYqnvt49DOSUJUdgo3x5i94pG+EPu5uVJj0N5
	lHZOaJjK87yoqEw==
X-Received: by 2002:a05:690c:c1e:b0:7e8:769:8094 with SMTP id
 00721157ae682-7fe5c244f2cmr47100877b3.23.1781718039950; Wed, 17 Jun 2026
 10:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz> <CAPY8ntBrQaSn8bvw76qW1MF1=xcA+5u3XVvhGwO9AOO1nONu=Q@mail.gmail.com>
In-Reply-To: <CAPY8ntBrQaSn8bvw76qW1MF1=xcA+5u3XVvhGwO9AOO1nONu=Q@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 17 Jun 2026 18:40:23 +0100
X-Gm-Features: AVVi8CdkCVjrptBG6rZHnBWxH4zzuMSLlJr1pxB6FSxLW01kuysyBVSN9BzC9JA
Message-ID: <CAPY8ntA=1EK20GmqWJzzW7Tp8Mh8aXNad8+ZBG2xVcxrAkwVSA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx355: Add support for 24 MHz external clock
To: david@ixit.cz
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Richard Acayan <mailingradian@gmail.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65129-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,ixit.cz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C1C769BC02

Hi David

On Thu, 16 Apr 2026 at 12:26, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi David
>
> On Tue, 14 Apr 2026 at 11:17, David Heidelberg via B4 Relay
> <devnull+david.ixit.cz@kernel.org> wrote:
> >
> > From: David Heidelberg <david@ixit.cz>
> >
> > The IMX355 sensor supports multiple external clock frequencies,
> > including 19.2 MHz and 24 MHz. The driver currently supports only
> > fixed 19.2 MHz input clock.
> >
> > Refactor the clock handling to make the PLL configuration dependent
> > on the external clock frequency and add support for 24 MHz. Introduce
> > a table of clock parameter sets and program the corresponding EXTCLK
> > frequency and PLL multipliers to maintain consistent internal VCO
> > frequencies across supported inputs.
> >
> > The PLL settings are adjusted so that:
> >   - VT VCO remains at 1152 MHz
> >   - OP VCO remains at 720 MHz
> >
> > This preserves existing timing characteristics while allowing systems
> > using a 24 MHz clock to operate correctly.
>
> I happened to have someone asking for this same requirement, so tried
> out your patch.
>
> I don't have a datasheet for IMX355, but the patterns very closely
> follow IMX477 and IMX708 for which I do.
> Those both have a single PLL and a dual PLL mode selected via register
> PLL_MULT_DRIV (0x0310). The imx355 driver is setting that to 0 for
> single PLL mode, which means that the PREDIV_IVT (0x0305) and MPY_IVT
> PLL (0x0306/7) settings do nothing as the IVT block is driven from
> IOPCK.

I now have the datasheet and software reference manual for IMX355.

It says that dual PLL mode is not available.
"In PLL single mode, IOP_PREPLLCK_DIV and IOP_PLL_MPY are applied to
IOPCK PLL, and IVT_PREPLLCK_DIV and IVT_PLL_MPY are ignored".
So there is no need to have alternate pll_vt_mpy values for 24MHz.

I have no idea why Sony say that dual PLL mode isn't available. When I
was adding the 2 lane support I used it without any issues. I'm now
reworking those patches to avoid dual PLL mode.
Then again the datasheet also says that LINE_LENGTH_PCK is constrained
to 3672 in full res and 4x4 binning mode, and 1836 in 2x2 binned modes
"to avoid sensor internal interference (FPN)", so they obviously hit
some odd behaviours and just added constraints.

Do you wish to send a V2 dropping pll_vt_mpy, or shall I pull it into my series?

Thanks
  Dave

> Your patch therefore works, but does more than is necessary - you
> really can set pll_vt_mpy to any value and it works exactly the same.
> I guess changing the unconnected IVTCK clock within the sensor could
> feasibly change EMC emissions, but that feels pretty unlikely.
> Possibly add a comment to your existing comment of "VT VCO = 1152 MHz"
> to say that it's unused to avoid others going down the rabbit hole I
> encountered.
>
> (For those referencing the other datasheets, the description for
> single PLL mode lists configuring IVT_PREPLLCK_DIV and IVT_PLL_MPY,
> but the diagram shows that IOP is always driven from IOPCK, and IVT is
> muxed between IOPCK and IVTCK)
>
> > No functional change for existing 19.2 MHz users.
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: David Heidelberg <david@ixit.cz>
>
> Whilst useful comments could be added, it does what it says and works:
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> > ---
> > Known users: Pixel 3 and 3a.
> > ---
> >  drivers/media/i2c/imx355.c | 114 +++++++++++++++++++++------------------------
> >  1 file changed, 54 insertions(+), 60 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index 27a5c212a527f..f9ec13bb27d10 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> > @@ -25,6 +25,11 @@
> >  #define IMX355_REG_CHIP_ID             0x0016
> >  #define IMX355_CHIP_ID                 0x0355
> >
> > +/* PLL registers that depend on the external clock frequency */
> > +#define IMX355_REG_EXTCLK_FREQ         0x0136
> > +#define IMX355_REG_PLL_VT_MUL          0x0306
> > +#define IMX355_REG_PLL_OP_MUL          0x030e
> > +
> >  /* V_TIMING internal */
> >  #define IMX355_REG_FLL                 0x0340
> >  #define IMX355_FLL_MAX                 0xffff
> > @@ -63,7 +68,6 @@
> >
> >  /* default link frequency and external clock */
> >  #define IMX355_LINK_FREQ_DEFAULT       360000000LL
> > -#define IMX355_EXT_CLK                 19200000
> >  #define IMX355_LINK_FREQ_INDEX         0
> >
> >  /* number of data lanes */
> > @@ -100,6 +104,33 @@ struct imx355_mode {
> >         struct imx355_reg_list reg_list;
> >  };
> >
> > +struct imx355_clk_params {
> > +       u32 ext_clk;
> > +       u16 extclk_freq; /* External clock (MHz) in 8.8 fixed point) */
> > +       u16 pll_vt_mpy; /* VT system PLL multiplier */
> > +       u16 pll_op_mpy; /* OP system PLL multiplier */
> > +};
> > +
> > +/*
> > + * All modes use the same PLL dividers (PREPLLCK_VT_DIV=2, PREPLLCK_OP_DIV=2),
> > + * so the multipliers are adjusted to produce the same VCO frequencies:
> > + *   VT VCO = 1152 MHz, OP VCO = 720 MHz
> > + */
> > +static const struct imx355_clk_params imx355_clk_params[] = {
> > +       {
> > +               .ext_clk = 19200000,
> > +               .extclk_freq = 0x1333,  /* 19.2 MHz */
> > +               .pll_vt_mpy = 120,      /* 19.2 / 2 * 120 = 1152 MHz */
> > +               .pll_op_mpy = 75,       /* 19.2 / 2 * 75  = 720 MHz */
> > +       },
> > +       {
> > +               .ext_clk = 24000000,
> > +               .extclk_freq = 0x1800,  /* 24.0 MHz */
> > +               .pll_vt_mpy = 96,       /* 24.0 / 2 * 96  = 1152 MHz */
> > +               .pll_op_mpy = 60,       /* 24.0 / 2 * 60  = 720 MHz */
> > +       },
> > +};
> > +
> >  struct imx355_hwcfg {
> >         unsigned long link_freq_bitmap;
> >  };
> > @@ -125,6 +156,7 @@ struct imx355 {
> >         const struct imx355_mode *cur_mode;
> >
> >         struct imx355_hwcfg *hwcfg;
> > +       const struct imx355_clk_params *clk_params;
> >
> >         /*
> >          * Mutex for serialized access:
> > @@ -144,8 +176,6 @@ static const struct regulator_bulk_data imx355_supplies[] = {
> >  };
> >
> >  static const struct imx355_reg imx355_global_regs[] = {
> > -       { 0x0136, 0x13 },
> > -       { 0x0137, 0x33 },
> >         { 0x304e, 0x03 },
> >         { 0x4348, 0x16 },
> >         { 0x4350, 0x19 },
> > @@ -231,12 +261,8 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -280,12 +306,8 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -329,12 +351,8 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -378,12 +396,8 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -427,12 +441,8 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -476,12 +486,8 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -525,12 +531,8 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -574,12 +576,8 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -623,12 +621,8 @@ static const struct imx355_reg mode_1640x922_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -672,12 +666,8 @@ static const struct imx355_reg mode_1300x736_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -721,12 +711,8 @@ static const struct imx355_reg mode_1296x736_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -770,12 +756,8 @@ static const struct imx355_reg mode_1284x720_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -819,12 +801,8 @@ static const struct imx355_reg mode_1280x720_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x00 },
> >         { 0x0701, 0x10 },
> > @@ -868,12 +846,8 @@ static const struct imx355_reg mode_820x616_regs[] = {
> >         { 0x0301, 0x05 },
> >         { 0x0303, 0x01 },
> >         { 0x0305, 0x02 },
> > -       { 0x0306, 0x00 },
> > -       { 0x0307, 0x78 },
> >         { 0x030b, 0x01 },
> >         { 0x030d, 0x02 },
> > -       { 0x030e, 0x00 },
> > -       { 0x030f, 0x4b },
> >         { 0x0310, 0x00 },
> >         { 0x0700, 0x02 },
> >         { 0x0701, 0x78 },
> > @@ -1422,6 +1396,20 @@ static int imx355_start_streaming(struct imx355 *imx355)
> >                 return ret;
> >         }
> >
> > +       /* Set PLL registers for the external clock frequency */
> > +       ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
> > +                              imx355->clk_params->extclk_freq);
> > +       if (ret)
> > +               return ret;
> > +       ret = imx355_write_reg(imx355, IMX355_REG_PLL_VT_MUL, 2,
> > +                              imx355->clk_params->pll_vt_mpy);
> > +       if (ret)
> > +               return ret;
> > +       ret = imx355_write_reg(imx355, IMX355_REG_PLL_OP_MUL, 2,
> > +                              imx355->clk_params->pll_op_mpy);
> > +       if (ret)
> > +               return ret;
> > +
> >         /* set digital gain control to all color mode */
> >         ret = imx355_write_reg(imx355, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, 1);
> >         if (ret)
> > @@ -1749,7 +1737,13 @@ static int imx355_probe(struct i2c_client *client)
> >                                      "failed to get clock\n");
> >
> >         freq = clk_get_rate(imx355->clk);
> > -       if (freq != IMX355_EXT_CLK)
> > +       for (unsigned int i = 0; i < ARRAY_SIZE(imx355_clk_params); i++) {
> > +               if (freq == imx355_clk_params[i].ext_clk) {
> > +                       imx355->clk_params = &imx355_clk_params[i];
> > +                       break;
> > +               }
> > +       }
> > +       if (!imx355->clk_params)
> >                 return dev_err_probe(imx355->dev, -EINVAL,
> >                                      "external clock %lu is not supported\n",
> >                                      freq);
> >
> > ---
> > base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
> > change-id: 20260414-imx355-24mhz-b8ccfab3adfb
> >
> > Best regards,
> > --
> > David Heidelberg <david@ixit.cz>
> >
> >
> >

