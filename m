Return-Path: <linux-media+bounces-26510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E69A3E19F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E46817AAD9
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4417520C028;
	Thu, 20 Feb 2025 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ZfpidJbK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CD31C1F02
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070640; cv=none; b=cdaOaoTen40+l2HTBLB+ztXckeCiR8I8pZLN224CyfxjaSD5EwVV8RFzYaHkCHCr3GwSdiYYF7EkLOKPcgYHp6BcdlOr4s3uQEJtYdRkH5kJQyemOmmVqkJJO6WozdK2MIyLXMgjKm+iQK+hu6bAczaG8agwERPdHgabaDTTsW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070640; c=relaxed/simple;
	bh=hL+68QD/kpvpKWj0bE7l4/9B9i+K8DRj0G1ACPG2dwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UC0Ha6+GtrONsnbOdD3T2aUGc1Iwrc8grsq0xsmhZEslQUr2oei10ik4IzL0I+7+QBarZXpGkYmds6WB6AmB1T7cQKAHRTWr4cBvcdudDRwHlQorlfxSF3/fbwP0sSY9QJlv6F0Q6Wbou0zKnmAsFhkNx87W7iUGsg+sKqpMVSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ZfpidJbK; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3983426f80so966325276.1
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 08:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740070637; x=1740675437; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WTH1yLWFBysG2qF9tVnOb1MUDV0oYJUTGpRHbR63nAk=;
        b=ZfpidJbK6G6SMt9viMiwIcqIkwTTW9FPgfYUQqGk3b/sqfK3sekABWuFMzd8t+EE64
         2WOuDgAsc2LtHc8q/4KoV/OGVKuBKAvZ5mD2ReqAysuT1dm+RHZCVPAkbsh1IeMh+KWm
         9cY/IyJG1fdpn9+9y2gR967vl4Tn2vvXCyZBN+zMIcfTE7Xs6R55LlsZnXI5OBaU0HB6
         PN+rLoRuCjSrO4lInlaGL6ExIZbnnYuVHyLMU/LU/ubRi4i65gi6FLugN7X2ydx5FpRw
         8S/BTllyrMTzlMKuFjuaYORiPOmz8xXKcjLCPHwmWB+skMGOIHWgiaxGSH1OVVCMCPbB
         lPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070637; x=1740675437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTH1yLWFBysG2qF9tVnOb1MUDV0oYJUTGpRHbR63nAk=;
        b=HH+NxFnDz1zLxXQxOg66vt1xPYr6PNo0QjmQ+VXycD5i7g5wOxqwlP5AEvgQUgUr0B
         cTvrgOp7JDeTF+LBfpOFMpllTmamwxhxZLaa40KOBW01M98hFdFzSytpzEBBEz76gLIC
         M+eI1JhFBwnuYsE/9DEyNkbrD+YRfhedXRQuEI9BBW8WlDfi8u5ej1OVTLJHkYnIEnkJ
         lR1QIEkCQ6m0x/F/a3H4bGWJHURUlN5ASUrB1a0aimLTWP9fyWqv/QViDuZg8o+agpN1
         LEAvc3BzbooNWMG70Z+uEOsKKki6qwCEXfJ1QpySpveYciU7mCC79F2XYNfamUoS2g4W
         GhVw==
X-Gm-Message-State: AOJu0Yy6lakfn/bIXfqntW6jl6Uo+4BeORsKI1PWjqHHpg1IcuKYDgkB
	pj/PIQrReGKwZIjGuNxrW7WKURBJRDZyA5cm5bYbhcSq0DUNwFX3AVUfTgx/I5OY6cWYkHVJcCw
	8J/NR8JGkkPJ1D7L9XlrD1jjzkZYtr7d5nM+P/g==
X-Gm-Gg: ASbGncvk9cP+4+/PbSo/Q73dveH9MPUVOdPGOYsVmUggpArgecriKtam02QoFjNhNhO
	B53s6E9PeOj9AVas7KvaxcHjOC1ZM4+gcEz6u6iGWhRX4iJ8tlfPLpAF1tuSBS41sZ3pNxMRhLx
	mTOobm4REZ3bM1FEuVlgfuRX0LQR4k
X-Google-Smtp-Source: AGHT+IHPwk9i+avIyNB0T+bCkIml/x4ipW/lFhWpYCd+4UH3UFZvKnmUak/vSgzZCC1jr3A5sLVACBuvHcnztB0AenA=
X-Received: by 2002:a05:6902:1283:b0:e58:305f:440b with SMTP id
 3f1490d57ef6-e5dc900ee4emr17166624276.7.1740070637425; Thu, 20 Feb 2025
 08:57:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219094637.607615-1-eagle.alexander923@gmail.com> <20250219094637.607615-3-eagle.alexander923@gmail.com>
In-Reply-To: <20250219094637.607615-3-eagle.alexander923@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 20 Feb 2025 16:57:00 +0000
X-Gm-Features: AWEUYZkXc4UBOCXd5mceYTlV8-kFNDFck6tXSb-GYRZg9kk4vlgL8b_rEP1xq7Y
Message-ID: <CAPY8ntAync2_EEXv+Rx=j_OwHbKU+V+QJJoRuZDQcyQUX-dVHQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: i2c: imx415: Add missing CSI configurations
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Michael Riesch <michael.riesch@wolfvision.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexander

On Wed, 19 Feb 2025 at 09:56, Alexander Shiyan
<eagle.alexander923@gmail.com> wrote:
>
> Currently, not all variants for different lane rates are handled in the driver.
> This patch fills in the remaining possible CSI configurations for 2-lane mode.

This patch fills in the remaining CSI configurations supported in both
2 and 4 lane modes.

Otherwise I've checked the register settings against the datasheet I
have, and they all appear to match.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

>
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/media/i2c/imx415.c | 97 +++++++++++++++++++++++++++++++-------
>  1 file changed, 80 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index c5beba4da18b..83b7929455b2 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -109,8 +109,8 @@ static const char *const imx415_supply_names[] = {
>   * and converts them to link frequencies by a factor of two when needed.
>   */
>  static const s64 link_freq_menu_items[] = {
> -       594000000 / 2,  720000000 / 2,  891000000 / 2,
> -       1440000000 / 2, 1485000000 / 2,
> +       594000000 / 2,  720000000 / 2,  891000000 / 2,  1440000000 / 2,
> +       1485000000 / 2, 1782000000 / 2, 2079000000 / 2, 2376000000 / 2,
>  };
>
>  struct imx415_clk_params {
> @@ -453,6 +453,19 @@ static const struct imx415_clk_params imx415_clk_params[] = {
>         },
>  };
>
> +/* 594 Mbps CSI configuration */
> +static const struct cci_reg_sequence imx415_linkrate_594mbps[] = {
> +       { IMX415_TCLKPOST, 0x0067 },
> +       { IMX415_TCLKPREPARE, 0x0027 },
> +       { IMX415_TCLKTRAIL, 0x0027 },
> +       { IMX415_TCLKZERO, 0x00B7 },
> +       { IMX415_THSPREPARE, 0x002F },
> +       { IMX415_THSZERO, 0x004F },
> +       { IMX415_THSTRAIL, 0x002F },
> +       { IMX415_THSEXIT, 0x0047 },
> +       { IMX415_TLPX, 0x0027 },
> +};
> +
>  /* 720 Mbps CSI configuration */
>  static const struct cci_reg_sequence imx415_linkrate_720mbps[] = {
>         { IMX415_TCLKPOST, 0x006F },
> @@ -466,6 +479,19 @@ static const struct cci_reg_sequence imx415_linkrate_720mbps[] = {
>         { IMX415_TLPX, 0x0027 },
>  };
>
> +/* 891 Mbps CSI configuration */
> +static const struct cci_reg_sequence imx415_linkrate_891mbps[] = {
> +       { IMX415_TCLKPOST, 0x007F },
> +       { IMX415_TCLKPREPARE, 0x0037 },
> +       { IMX415_TCLKTRAIL, 0x0037 },
> +       { IMX415_TCLKZERO, 0x00F7 },
> +       { IMX415_THSPREPARE, 0x003F },
> +       { IMX415_THSZERO, 0x006F },
> +       { IMX415_THSTRAIL, 0x003F },
> +       { IMX415_THSEXIT, 0x005F },
> +       { IMX415_TLPX, 0x002F },
> +};
> +
>  /* 1440 Mbps CSI configuration */
>  static const struct cci_reg_sequence imx415_linkrate_1440mbps[] = {
>         { IMX415_TCLKPOST, 0x009F },
> @@ -479,17 +505,30 @@ static const struct cci_reg_sequence imx415_linkrate_1440mbps[] = {
>         { IMX415_TLPX, 0x004F },
>  };
>
> -/* 891 Mbps CSI configuration */
> -static const struct cci_reg_sequence imx415_linkrate_891mbps[] = {
> -       { IMX415_TCLKPOST, 0x007F },
> -       { IMX415_TCLKPREPARE, 0x0037 },
> -       { IMX415_TCLKTRAIL, 0x0037 },
> -       { IMX415_TCLKZERO, 0x00F7 },
> -       { IMX415_THSPREPARE, 0x003F },
> -       { IMX415_THSZERO, 0x006F },
> -       { IMX415_THSTRAIL, 0x003F },
> -       { IMX415_THSEXIT, 0x005F },
> -       { IMX415_TLPX, 0x002F },
> +/* 1782 Mbps CSI configuration */
> +static const struct cci_reg_sequence imx415_linkrate_1782mbps[] = {
> +       { IMX415_TCLKPOST, 0x00B7 },
> +       { IMX415_TCLKPREPARE, 0x0067 },
> +       { IMX415_TCLKTRAIL, 0x006F },
> +       { IMX415_TCLKZERO, 0x01DF },
> +       { IMX415_THSPREPARE, 0x006F },
> +       { IMX415_THSZERO, 0x00CF },
> +       { IMX415_THSTRAIL, 0x006F },
> +       { IMX415_THSEXIT, 0x00B7 },
> +       { IMX415_TLPX, 0x005F },
> +};
> +
> +/* 2079 Mbps CSI configuration */
> +static const struct cci_reg_sequence imx415_linkrate_2079mbps[] = {
> +       { IMX415_TCLKPOST, 0x00D7 },
> +       { IMX415_TCLKPREPARE, 0x007F },
> +       { IMX415_TCLKTRAIL, 0x007F },
> +       { IMX415_TCLKZERO, 0x0237 },
> +       { IMX415_THSPREPARE, 0x0087 },
> +       { IMX415_THSZERO, 0x00EF },
> +       { IMX415_THSTRAIL, 0x0087 },
> +       { IMX415_THSEXIT, 0x00DF },
> +       { IMX415_TLPX, 0x006F },
>  };
>
>  struct imx415_mode_reg_list {
> @@ -505,6 +544,14 @@ struct imx415_mode {
>
>  /* mode configs */
>  static const struct imx415_mode supported_modes[] = {
> +       {
> +               .lane_rate = 594000000,
> +               .hmax_min = { 3300, 1320 },
> +               .reg_list = {
> +                       .num_of_regs = ARRAY_SIZE(imx415_linkrate_594mbps),
> +                       .regs = imx415_linkrate_594mbps,
> +               },
> +       },
>         {
>                 .lane_rate = 720000000,
>                 .hmax_min = { 2032, 1066 },
> @@ -513,6 +560,14 @@ static const struct imx415_mode supported_modes[] = {
>                         .regs = imx415_linkrate_720mbps,
>                 },
>         },
> +       {
> +               .lane_rate = 891000000,
> +               .hmax_min = { 2200, 1100 },
> +               .reg_list = {
> +                       .num_of_regs = ARRAY_SIZE(imx415_linkrate_891mbps),
> +                       .regs = imx415_linkrate_891mbps,
> +               },
> +       },
>         {
>                 .lane_rate = 1440000000,
>                 .hmax_min = { 1066, 533 },
> @@ -522,11 +577,19 @@ static const struct imx415_mode supported_modes[] = {
>                 },
>         },
>         {
> -               .lane_rate = 891000000,
> -               .hmax_min = { 2200, 1100 },
> +               .lane_rate = 1782000000,
> +               .hmax_min = { 1100, 550 },
>                 .reg_list = {
> -                       .num_of_regs = ARRAY_SIZE(imx415_linkrate_891mbps),
> -                       .regs = imx415_linkrate_891mbps,
> +                       .num_of_regs = ARRAY_SIZE(imx415_linkrate_1782mbps),
> +                       .regs = imx415_linkrate_1782mbps,
> +               },
> +       },
> +       {
> +               .lane_rate = 2079000000,
> +               .hmax_min = { 1100, 550 },
> +               .reg_list = {
> +                       .num_of_regs = ARRAY_SIZE(imx415_linkrate_2079mbps),
> +                       .regs = imx415_linkrate_2079mbps,
>                 },
>         },
>  };
> --
> 2.39.1
>
>

