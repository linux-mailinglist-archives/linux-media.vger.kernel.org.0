Return-Path: <linux-media+bounces-21687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 054009D41A8
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 18:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0781F231C8
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 17:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4818A15666B;
	Wed, 20 Nov 2024 17:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="n7MSouuz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE86315573D
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 17:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732125005; cv=none; b=J8qNpj+LTvljz9YmPedldwxxdGfFI/FpNq7jJ2dsPfiXb5NH2PNQvU7OyXPjxDp95S6yvJzh1GXUEAQWk0qf3SaDBiNgEgIlFpgTQcaFT9jb+ow7Rv6duq321LZQtCW9cYVB+KO5zOEvXNjiHV2wn3ngdMpAD3BXgTY129kbHj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732125005; c=relaxed/simple;
	bh=ctKB3oeKjj9NcqK9Bp8nDnJcuGL7Hcfs+k6RJWcJrIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAoA1adGzVLAw9Tu6WOTGcjl+pEKV9hct1NTFfY/5GJW8MhaAw74eOX76ctvhPk1Rke1KmVlM1bbsOCzTKSJL+yC7AzmeK9I/5uL+j32neYrQE3Vxlm2WaEv/7zNNsE5/w/jDnWXCnAL98Xfcl3gD7tAcjmc9qNwoKMuNUNf6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=n7MSouuz; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e382e549918so2159824276.2
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 09:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732125002; x=1732729802; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0F3J5tg+AZotRnRXcznOlKsQVCYryEIHrUkJAiTc9k8=;
        b=n7MSouuzNopdFQmD9uFciTFJw0Xf0YfEa7pHCgqsL4AebrwIZwlrll/Sf6k0gtAPDE
         S7aSOpGrMP9ANmJbl2ngqKwon7H4Pm5EZ4JtM78WGCohMYrxcYoXwOunuUTCtywFrIzz
         /Z5Fcgba2HjDUexHZfUmHuwcCmnvTOTxQQpz+ywFASPbrxydU4fHvuRRTNN1zRVHPz7f
         VwNVgpsNARNvSPgHu5UoLBBSS4zBDTjMtgBYquAO96nnhXIF8aiKE+rQq1plwrUhsaop
         Mhvaq9IOVPjB7XnefxS19AhL86w1ty7/Nrvra4RiovpMyaUX7E0KtO3ebfOlfpCtd474
         nPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732125002; x=1732729802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0F3J5tg+AZotRnRXcznOlKsQVCYryEIHrUkJAiTc9k8=;
        b=cdYAAe3YMdqHm9dYvx02fJzAIR499WDG5NcW/Bh2m+dYe3IojbQAcM3im4oDNLEkND
         0oo8jpbalpqVtCVXMTDsPIrkF7MbyaGXExrdTWUPW1ToYcIGrqV7HjrMFJXYlmcIzdhH
         JDM7hA3/gHmRDZ05KGF5dO3bPm/vCIGxvuECCe1TRP0plrY2xB3t436zsOztEg0WA7IP
         9GNn1qA1r0KjLfaRM9w265ZECd1HpbM+IYT0r3zjdsFfktWyg9LCMQXaCp+/LBoguOFl
         KqMAbzPKhPdP0paQCvZVuK8cJgfp4QZ9oWSWimh2qaPpv9TPMS3Ziu1VHLlaDP4qThBe
         jonQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2o1blVvDgCNaDrhtX4crARKqVDyViGF94wYUH1THWX/5OTO0DwOokzjxH44Vfjs33GOzVpoISvJXs6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRcG4vDjPie/VYuHnGeO19FrmiPxSotb/5oOdfEm4eg2a9+hPg
	9DBfnwHd5oQ9FlrwCWYy1knfnXGzDSX3bcpJseYaV8KlNhvBEeQx8wi+on3/Df48dm/gM5mgHEI
	RDihCVBnH5QVbd9LQc2d5MSjWUVwlNyHOzSZqWQ==
X-Gm-Gg: ASbGnctnkBL1wMfEXgvdfedl/yLi3Iv8XWqDa3AZ+uVteef+ZsqYXCVz6fGiq5Vyaq/
	w+vYL1/1FvgJgUp+6tY1kTWsu4Yf6iJk=
X-Google-Smtp-Source: AGHT+IGTsPe7+ZryXlme3kuG7tpC8pknkVkEwCPoK1Yb6RQtlnPSwnr6+Yz56M5D78wh2ynwe4hLWUH1/SKXZjgFBYw=
X-Received: by 2002:a05:6902:2806:b0:e30:c944:eb11 with SMTP id
 3f1490d57ef6-e38cb566994mr3277486276.14.1732125002629; Wed, 20 Nov 2024
 09:50:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-3-c538a2e24786@raspberrypi.com>
 <20241115000637.GK26171@pendragon.ideasonboard.com> <CAPY8ntBJu+mA3BcYkkVpr1L0jf2hp6e3kbpyGkB7mwbiDQDGzQ@mail.gmail.com>
 <20241118020745.GI31681@pendragon.ideasonboard.com>
In-Reply-To: <20241118020745.GI31681@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 20 Nov 2024 17:49:42 +0000
Message-ID: <CAPY8ntCcwv=jvi4gHJqH=rWRy4uAHfCiq0zsPM5C53B4VPvWjg@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: imx290: Add configuration for IMX462
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 18 Nov 2024 at 02:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Fri, Nov 15, 2024 at 08:51:55AM +0000, Dave Stevenson wrote:
> > On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart wrote:
> > > On Thu, Nov 14, 2024 at 04:01:15PM +0000, Dave Stevenson wrote:
> > > > IMX462 is the successor to IMX290, and wants very minor
> > > > changes to the register setup.
> > > >
> > > > Add the relevant configuration to support it.
> > > >
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > ---
> > > >  drivers/media/i2c/imx290.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 66 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index da654deb444a..f1780cc5d7cc 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -170,6 +170,8 @@ enum imx290_model {
> > > >       IMX290_MODEL_IMX290LQR,
> > > >       IMX290_MODEL_IMX290LLR,
> > > >       IMX290_MODEL_IMX327LQR,
> > > > +     IMX290_MODEL_IMX462LQR,
> > > > +     IMX290_MODEL_IMX462LLR,
> > > >  };
> > > >
> > > >  struct imx290_model_info {
> > > > @@ -316,6 +318,50 @@ static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
> > > >       { CCI_REG8(0x33b3), 0x04 },
> > > >  };
> > > >
> > > > +static const struct cci_reg_sequence imx290_global_init_settings_462[] = {
> > > > +     { CCI_REG8(0x300f), 0x00 },
> > > > +     { CCI_REG8(0x3010), 0x21 },
> > > > +     { CCI_REG8(0x3011), 0x02 },
> > >
> > > As far as I can tell, the only difference in the init sequence between
> > > imx290_global_init_settings_290 and imx290_global_init_settings_462 is
> > > 0x3011 register which is not present in imx290_global_init_settings_290.
> > > It is however included in imx290_global_init_settings, and set to 0x02.
> > > Could we therefore use imx290_global_init_settings_290 for the imx462 ?
> >
> > I'd done a comparison of the datasheets, and register 0x3011 was the
> > only one that changed. I'd missed that it was in
> > imx290_global_init_settings.
> >
> > My datasheets:
> > IMX327LQR-C rev E17Z06B93 2019/03/25. 3011h "Set to 02h" (value
> > changed in doc rev 0.3 from 0Ah)
> > IMX290LQR-C rev E15510G82 2018/02/09. 3011h "Fixed to 00h" (always
> > been that value).
> > IMX462LQR-C rev E19Y13C13 2021/03/19. 3011h "Set to 02h" (value
> > changed in doc rev 0.2 from 00h)
> > The default value stated in all of them is 00h. In true Sony fashion,
> > there's no description for that register functionality.
> >
> > So actually it looks like it was the addition of IMX327 in [1] should
> > have changed that setting, unless someone else has a more recent
> > datasheet for IMX290 that updates that.
>
> I agree with this analysis. It may be that setting the register to 0x02
> would be fine, but it's hard to tell. Maybe it could be worth asking
> Sony ?
>
> > cc Alexander as the author of that patch. I'll find any discussion on it later.

I've looked back to find the earlier discussion.

v3 at [1] was the version that was merged. This added register 0x3011
when previously it hadn't been set.

I had picked up at v2[2] that register 0x3011 should have been in
imx290_global_init_settings_327 rather than
imx290_global_init_settings, but that appeared not to have happened.

In my book that makes it a regression for imx290 due to that patch,
and we should correct it back to 0x00.
I could check with Sony over that, but it seems overkill seeing as we
have deviated from the originally submitted driver in a way that
contradicts the datasheet.

I'll send a v2 patchset on that basis.

  Dave

[1] https://lore.kernel.org/linux-media/20230217095221.499463-3-alexander.stein@ew.tq-group.com/
[2] https://lore.kernel.org/linux-media/CAPY8ntB_25yge6MB87N642-bMG-hd9qCVkom4A-c-pBzk3a4mQ@mail.gmail.com/

> >   Dave
> >
> > [1] https://github.com/torvalds/linux/commit/2d41947ec2c0140c65783982692c2e3d89853c47
> >
> > > > +     { CCI_REG8(0x3016), 0x09 },
> > > > +     { CCI_REG8(0x3070), 0x02 },
> > > > +     { CCI_REG8(0x3071), 0x11 },
> > > > +     { CCI_REG8(0x309b), 0x10 },
> > > > +     { CCI_REG8(0x309c), 0x22 },
> > > > +     { CCI_REG8(0x30a2), 0x02 },
> > > > +     { CCI_REG8(0x30a6), 0x20 },
> > > > +     { CCI_REG8(0x30a8), 0x20 },
> > > > +     { CCI_REG8(0x30aa), 0x20 },
> > > > +     { CCI_REG8(0x30ac), 0x20 },
> > > > +     { CCI_REG8(0x30b0), 0x43 },
> > > > +     { CCI_REG8(0x3119), 0x9e },
> > > > +     { CCI_REG8(0x311c), 0x1e },
> > > > +     { CCI_REG8(0x311e), 0x08 },
> > > > +     { CCI_REG8(0x3128), 0x05 },
> > > > +     { CCI_REG8(0x313d), 0x83 },
> > > > +     { CCI_REG8(0x3150), 0x03 },
> > > > +     { CCI_REG8(0x317e), 0x00 },
> > > > +     { CCI_REG8(0x32b8), 0x50 },
> > > > +     { CCI_REG8(0x32b9), 0x10 },
> > > > +     { CCI_REG8(0x32ba), 0x00 },
> > > > +     { CCI_REG8(0x32bb), 0x04 },
> > > > +     { CCI_REG8(0x32c8), 0x50 },
> > > > +     { CCI_REG8(0x32c9), 0x10 },
> > > > +     { CCI_REG8(0x32ca), 0x00 },
> > > > +     { CCI_REG8(0x32cb), 0x04 },
> > > > +     { CCI_REG8(0x332c), 0xd3 },
> > > > +     { CCI_REG8(0x332d), 0x10 },
> > > > +     { CCI_REG8(0x332e), 0x0d },
> > > > +     { CCI_REG8(0x3358), 0x06 },
> > > > +     { CCI_REG8(0x3359), 0xe1 },
> > > > +     { CCI_REG8(0x335a), 0x11 },
> > > > +     { CCI_REG8(0x3360), 0x1e },
> > > > +     { CCI_REG8(0x3361), 0x61 },
> > > > +     { CCI_REG8(0x3362), 0x10 },
> > > > +     { CCI_REG8(0x33b0), 0x50 },
> > > > +     { CCI_REG8(0x33b2), 0x1a },
> > > > +     { CCI_REG8(0x33b3), 0x04 },
> > > > +};
> > > > +
> > > >  #define IMX290_NUM_CLK_REGS  2
> > > >  static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
> > > >       [IMX290_CLK_37_125] = {
> > > > @@ -1455,6 +1501,20 @@ static const struct imx290_model_info imx290_models[] = {
> > > >               .max_analog_gain = 98,
> > > >               .name = "imx327",
> > > >       },
> > > > +     [IMX290_MODEL_IMX462LQR] = {
> > > > +             .colour_variant = IMX290_VARIANT_COLOUR,
> > > > +             .init_regs = imx290_global_init_settings_462,
> > > > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > > > +             .max_analog_gain = 98,
> > > > +             .name = "imx462",
> > > > +     },
> > > > +     [IMX290_MODEL_IMX462LLR] = {
> > > > +             .colour_variant = IMX290_VARIANT_MONO,
> > > > +             .init_regs = imx290_global_init_settings_462,
> > > > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > > > +             .max_analog_gain = 98,
> > > > +             .name = "imx462",
> > > > +     },
> > > >  };
> > > >
> > > >  static int imx290_parse_dt(struct imx290 *imx290)
> > > > @@ -1653,6 +1713,12 @@ static const struct of_device_id imx290_of_match[] = {
> > > >       }, {
> > > >               .compatible = "sony,imx327lqr",
> > > >               .data = &imx290_models[IMX290_MODEL_IMX327LQR],
> > > > +     }, {
> > > > +             .compatible = "sony,imx462lqr",
> > > > +             .data = &imx290_models[IMX290_MODEL_IMX462LQR],
> > > > +     }, {
> > > > +             .compatible = "sony,imx462llr",
> > > > +             .data = &imx290_models[IMX290_MODEL_IMX462LLR],
> > > >       },
> > > >       { /* sentinel */ },
> > > >  };
>
> --
> Regards,
>
> Laurent Pinchart

