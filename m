Return-Path: <linux-media+bounces-28063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F895A5D129
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 21:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3B9717C44A
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 20:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B0E264A7F;
	Tue, 11 Mar 2025 20:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3b+7YGt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF9123F378;
	Tue, 11 Mar 2025 20:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741726327; cv=none; b=KXW3zB5U3b/KgUsWfxbe6aLePaNxT6o8AJRzeSl5anG8JONT3qmXpNxuxh08TLNqxG8R8WTTwf/l5FBLOQW7tRfJZmVflj055tkXTSQ324g5roBi50Yys9dmXK8v2VTNoLvZs7OTr3/9KPGQ+z7rr3UaoUUPit2X+JX5iSk6Mpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741726327; c=relaxed/simple;
	bh=FGFMZyrIVwJnRpzrRsjGPdyar69hLA5eYVJCmYKV32I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6gEvN0ogZpT8PCNZWL0q/aep/tVZbYh8CQyCNI99cyYN96HwsnAFwvakFOydq3fawIjS+Y/hQJOLUKhfQMnwLVLlaUig75hWvgLTn3TP4S1G2gI3ux2NyEUBzJGGZgyU5Uo8I++ZFeVd5x9OwQ3LrXFDwZvI/dQvIe/PA7dLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3b+7YGt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5444C4CEEC;
	Tue, 11 Mar 2025 20:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741726326;
	bh=FGFMZyrIVwJnRpzrRsjGPdyar69hLA5eYVJCmYKV32I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b3b+7YGtGfyOBTHy6ERvUbSAVikn6RFXOesNcGSWA78Q1pBAP6EDaWtcUHQuX4gBa
	 DDJw6emVPe9WiZDhr1ie2Hc0bDbG7q9MQ4H94MN+mSRq37nWpNdl3va8Ydl9lQLMIy
	 PaCCjbsTDEp6S1Pf3L0yaQ6xj6yjqnG8ckhrVKGPGs7VjW2rXsUE3ulWWkUcq2TwSQ
	 sl2nHjy/x2tnOkZJbDUWgOmw+CswqPhg1/TbLrsQp9i+tzJCDvr1aUHdxJQ9WreYFg
	 1IwILrYCgTmgdTfmE3ZroWFDVjsDLMNwgzcBqzNK1285ME9mrbTrplD3USOYFGKJb7
	 7UWrsUkiCOfbQ==
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523fa0df55dso182211e0c.1;
        Tue, 11 Mar 2025 13:52:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkeBhhwd0+hRZjZ3wlpMr6PeXVORMl92aR+VsLsUZIemBKwwr3cgR0haasUor1fFUPDMsLf/4acU7DSRs=@vger.kernel.org, AJvYcCWPUaif/y6TBbg1xhuX1frKS8oY1ib6Rgj/pvEdz0LyR6Loo/ha8nhDQo64MCvHm+aLTrm20AIPdV6/VIM=@vger.kernel.org, AJvYcCWT23+Dvw0x46tPlUCyjjqslOay1MDiubkBRHExyvWA+OR/4i9UlC1bf1/0pcVwzym8unw6ACDmdRTBlRE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymi/n8hiNJ2XfYmPRcvlSf3KTbLBcxB6zrhYQb7ZP8Gi3fD8Iz
	8ATmASo7Mau0QTliWr61T4TrE55uUMaTIu4vqH5sChg0Cq/Pb5UTpMGUXJNoT9Kaf1MWec9mNcV
	kzicR/cAy4bJs2JduyM6vVOQtymw=
X-Google-Smtp-Source: AGHT+IGJhfyVKfehmxH31x8cplgwsfJRuEwmWRjJ2JCzIGMEpajUrG5wZdEJLN/AInDuq8M8E+TRmeNWIMbMKbxNiIQ=
X-Received: by 2002:a05:6102:a50:b0:4c3:9af:9134 with SMTP id
 ada2fe7eead31-4c34dd15810mr3712924137.4.1741726325807; Tue, 11 Mar 2025
 13:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu> <20250308-imx214_clk_freq-v1-2-467a4c083c35@apitzsch.eu>
In-Reply-To: <20250308-imx214_clk_freq-v1-2-467a4c083c35@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Tue, 11 Mar 2025 21:51:49 +0100
X-Gmail-Original-Message-ID: <CAPybu_3LVgW6CicYE6yCrf_Hk-7VkGU+r=nwEUWhqcQwD=GOCw@mail.gmail.com>
X-Gm-Features: AQ5f1JoQZrB1L_gD4ycWBb4d7XvIkB1DQwhK_qI-cLFj9DMKSeR291R5-hyPyb4
Message-ID: <CAPybu_3LVgW6CicYE6yCrf_Hk-7VkGU+r=nwEUWhqcQwD=GOCw@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/4] media: i2c: imx214: Prepare for variable clock frequency
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 10:48=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> Move clock frequency related parameters out of the constant register
> sequences, such that the hard coded external clock frequency can be
> replaced by a variable in the next commit.
>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 64 ++++++++++++++++++++++++++++------------=
------
>  1 file changed, 39 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 14a4c5094799014da38ab1beec401f0d923c2152..53b6b427f263a8ad7e3a0d1f7=
11ece234601100e 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -320,17 +320,6 @@ static const struct cci_reg_sequence mode_4096x2304[=
] =3D {
>         { IMX214_REG_DIG_CROP_WIDTH, 4096 },
>         { IMX214_REG_DIG_CROP_HEIGHT, 2304 },
>
> -       { IMX214_REG_VTPXCK_DIV, IMX214_DEFAULT_VTPXCK_DIV },
> -       { IMX214_REG_VTSYCK_DIV, IMX214_DEFAULT_VTSYCK_DIV },
> -       { IMX214_REG_PREPLLCK_VT_DIV, IMX214_DEFAULT_PREPLLCK_VT_DIV },
> -       { IMX214_REG_PLL_VT_MPY, IMX214_DEFAULT_PLL_VT_MPY },
> -       { IMX214_REG_OPPXCK_DIV, IMX214_DEFAULT_OPPXCK_DIV },
> -       { IMX214_REG_OPSYCK_DIV, IMX214_DEFAULT_OPSYCK_DIV },
> -       { IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> -
> -       { IMX214_REG_REQ_LINK_BIT_RATE,
> -               IMX214_LINK_BIT_RATE_MBPS(IMX214_LINK_BIT_RATE(IMX214_DEF=
AULT_CLK_FREQ)) },
> -
>         { CCI_REG8(0x3A03), 0x09 },
>         { CCI_REG8(0x3A04), 0x50 },
>         { CCI_REG8(0x3A05), 0x01 },
> @@ -384,17 +373,6 @@ static const struct cci_reg_sequence mode_1920x1080[=
] =3D {
>         { IMX214_REG_DIG_CROP_WIDTH, 1920 },
>         { IMX214_REG_DIG_CROP_HEIGHT, 1080 },
>
> -       { IMX214_REG_VTPXCK_DIV, IMX214_DEFAULT_VTPXCK_DIV },
> -       { IMX214_REG_VTSYCK_DIV, IMX214_DEFAULT_VTSYCK_DIV },
> -       { IMX214_REG_PREPLLCK_VT_DIV, IMX214_DEFAULT_PREPLLCK_VT_DIV },
> -       { IMX214_REG_PLL_VT_MPY, IMX214_DEFAULT_PLL_VT_MPY },
> -       { IMX214_REG_OPPXCK_DIV, IMX214_DEFAULT_OPPXCK_DIV },
> -       { IMX214_REG_OPSYCK_DIV, IMX214_DEFAULT_OPSYCK_DIV },
> -       { IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> -
> -       { IMX214_REG_REQ_LINK_BIT_RATE,
> -               IMX214_LINK_BIT_RATE_MBPS(IMX214_LINK_BIT_RATE(IMX214_DEF=
AULT_CLK_FREQ)) },
> -
>         { CCI_REG8(0x3A03), 0x04 },
>         { CCI_REG8(0x3A04), 0xF8 },
>         { CCI_REG8(0x3A05), 0x02 },
> @@ -428,9 +406,6 @@ static const struct cci_reg_sequence mode_table_commo=
n[] =3D {
>         /* ATR setting */
>         { IMX214_REG_ATR_FAST_MOVE, 2 },
>
> -       /* external clock setting */
> -       { IMX214_REG_EXCK_FREQ, IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ =
/ 1000000) },
> -
>         /* global setting */
>         /* basic config */
>         { IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
> @@ -800,6 +775,30 @@ static int imx214_entity_init_state(struct v4l2_subd=
ev *subdev,
>         return 0;
>  }
>
> +static int imx214_set_clock(struct imx214 *imx214)
> +{
> +       int ret =3D 0;
> +
> +       cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV,
> +                 IMX214_DEFAULT_VTPXCK_DIV, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV,
> +                 IMX214_DEFAULT_VTSYCK_DIV, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV,
> +                 IMX214_DEFAULT_PREPLLCK_VT_DIV, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY,
> +                 IMX214_DEFAULT_PLL_VT_MPY, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV,
> +                 IMX214_DEFAULT_OPPXCK_DIV, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV,
> +                 IMX214_DEFAULT_OPSYCK_DIV, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
> +                 IMX214_PLL_SINGLE, &ret);
> +       cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
> +                 IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000), &r=
et);
> +
> +       return ret;
> +}
> +
>  static int imx214_update_digital_gain(struct imx214 *imx214, u32 val)
>  {
>         int ret =3D 0;
> @@ -1032,6 +1031,7 @@ static int imx214_start_streaming(struct imx214 *im=
x214)
>         const struct v4l2_mbus_framefmt *fmt;
>         struct v4l2_subdev_state *state;
>         const struct imx214_mode *mode;
> +       int link_bit_rate;
>         int ret;
>
>         ret =3D cci_multi_reg_write(imx214->regmap, mode_table_common,
> @@ -1041,6 +1041,20 @@ static int imx214_start_streaming(struct imx214 *i=
mx214)
>                 return ret;
>         }
>
> +       ret =3D imx214_set_clock(imx214);
> +       if (ret) {
> +               dev_err(imx214->dev, "failed to configure clock %d\n", re=
t);
> +               return ret;
> +       }
> +
> +       link_bit_rate =3D IMX214_LINK_BIT_RATE(IMX214_DEFAULT_CLK_FREQ);
> +       ret =3D cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
> +                       IMX214_LINK_BIT_RATE_MBPS(link_bit_rate), NULL);
> +       if (ret) {
> +               dev_err(imx214->dev, "failed to configure link bit rate\n=
");
> +               return ret;
> +       }
> +
>         ret =3D cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
>                         IMX214_CSI_4_LANE_MODE, NULL);
>         if (ret) {
>
> --
> 2.48.1
>
>

