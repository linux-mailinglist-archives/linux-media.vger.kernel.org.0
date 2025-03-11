Return-Path: <linux-media+bounces-28065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C2AA5D1B6
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 22:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42DEB3B7D2E
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 21:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF08264F93;
	Tue, 11 Mar 2025 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gp6x/oTB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02882641F1;
	Tue, 11 Mar 2025 21:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741728346; cv=none; b=iemZTWPU7cAngJqaMlNkTnjwwYwmjdBHkIyGE2YeujBhCulQylDyhsIgWeAMKtPnGP267T4BndYv3RW2zGmLaS+XAl5uqGAo8xReXH5Y9L48LcBZbe6AD3mxTMVY6cWSouWlnqHRCTdfvwZHKFOtjFau1E1k7Ng46JrzOTLkTk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741728346; c=relaxed/simple;
	bh=Bg9VsBBRHOfLmNm09EUWZrCfteZ85VpMbsFjxXqE9Xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gfDRMSlgOkBVLuRwWd0XJFiBbY1f+4Cr4Yoi9IBHPFB6lsODpdomKbLu/jk6MDdlFuEKCIE128+7ieTA8TA32DpwNdgtKA9fzn7JVGvS6rknVHVP9vPT3oJDJuNvhR8K4B6BDLCmtRpbezQR+zRmT8KZ12Y5j1mXLDwf3m9BQCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gp6x/oTB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25301C4CEE9;
	Tue, 11 Mar 2025 21:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741728346;
	bh=Bg9VsBBRHOfLmNm09EUWZrCfteZ85VpMbsFjxXqE9Xc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gp6x/oTBcq4h/M/tDtiZMKq+Up6etA9mewfOZDWZgTbOh2TejYyQtfD9Isi3H+R7J
	 OPpbZQpOfUwNFJjZ+CKmYMRLlHjnu76LucC6u+x1//NOq2jrKauQI8pj7/q0AHAmhf
	 1qnkHLljpt6na9/k7F/T8YlvK2JNqvjsKYOtpOCY7gFlFLsSCpJROPPHYwXx07NRsz
	 CYF/+boqQ1AiLdhBziqOrCGNfrNxTzlVf42fEK5zBdsOFRqzF9dvBiW95dNLM9HtL1
	 NHUl6WRgvCK2v6htLW4Qzt1LzvUcfPPnsezgm9SbypcK3ZPUlvvpNcIT9VC3NxxgiX
	 D5T08rLPwlbNg==
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8670fd79990so2497204241.3;
        Tue, 11 Mar 2025 14:25:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/VkRlfGP7qeZeQ2TyanrzCmlZyi8N8anEAZatIBxolhs7255q+m5nmn3NDhgSxSR+mfBJLm/eaz1sXLs=@vger.kernel.org, AJvYcCUklD4KK0Ifu+r40FRRKUPzBcqe6sM+Pd2zVw5bnVa4ZrHKFTShQaILc6Nv0BY8hlf1XiDplwrS98eWvuM=@vger.kernel.org, AJvYcCVqwJhJAQEz1C2QIjRHy6DOQFH7HUza79SpfuU5TMHTCqOKIKbqg3eMU6rPSydlDEDTqAcWd9vzgjjSLmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz12CzuOeaqZ6E7594bShKaxMMz/HTDZib5E1O32FFzxVfO55JS
	rc3YFeYfeGGkYz7P+aJe2T8iPIYlkMqN6CuiI1X4FRpmHladxGHByzo8Wp/PK4IJvXrFKZidutm
	Pb4v9/EhpHemImPybdCio/I5M0KE=
X-Google-Smtp-Source: AGHT+IFFdWHYFEZEhxswLplJ46GlbaNVr+3GvHhID/nT4pmSOUIKlHfxaUq5alVyQXDiyvrTNKCOnVk5cPlwC3Pblc8=
X-Received: by 2002:a05:6102:578f:b0:4bb:e8c5:b172 with SMTP id
 ada2fe7eead31-4c30a5e4f1fmr14782892137.8.1741728345318; Tue, 11 Mar 2025
 14:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu> <20250308-imx214_clk_freq-v1-4-467a4c083c35@apitzsch.eu>
In-Reply-To: <20250308-imx214_clk_freq-v1-4-467a4c083c35@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Tue, 11 Mar 2025 22:25:28 +0100
X-Gmail-Original-Message-ID: <CAPybu_1R_Ph7ELfX8gTgJi0E2YebjZj90eUc1KhAFhL_dfe6pg@mail.gmail.com>
X-Gm-Features: AQ5f1JqPL65RgOB7xkGUhaaVr-uGZ7Hzaai7x5nmm0SNIeiCwkaDnQLif3Cd0lA
Message-ID: <CAPybu_1R_Ph7ELfX8gTgJi0E2YebjZj90eUc1KhAFhL_dfe6pg@mail.gmail.com>
Subject: Re: [PATCH RESEND 4/4] media: i2c: imx214: Add support for 23.88MHz clock
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
> Qualcomm MSM8916 devices only provide an external clock of 23.88MHz.
> Make the sensor usable by those devices by adding support for this
> frequency.
>

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
and after this patch  imx214->clk_params =3D &imx214_clk_params[1];

Thanks for the set!


> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index c3d55259d6fd1c4ca96f52833864bdfe6bedf13a..e24c76e01ab5070c073d082b1=
a2969cff3e17f9f 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -30,7 +30,10 @@
>
>  #define IMX214_REG_FAST_STANDBY_CTRL   CCI_REG8(0x0106)
>
> +#define IMX214_CLK_FREQ_23880KHZ       23880000
>  #define IMX214_CLK_FREQ_24000KHZ       24000000
> +
> +#define IMX214_LINK_FREQ_597MHZ                597000000
>  #define IMX214_LINK_FREQ_600MHZ                600000000
>  /* Keep wrong link frequency for backward compatibility */
>  #define IMX214_DEFAULT_LINK_FREQ_LEGACY        480000000
> @@ -233,6 +236,7 @@ static const char * const imx214_supply_name[] =3D {
>  #define IMX214_NUM_SUPPLIES ARRAY_SIZE(imx214_supply_name)
>
>  static const s64 link_freq[] =3D {
> +       IMX214_LINK_FREQ_597MHZ,
>         IMX214_LINK_FREQ_600MHZ,
>  };
>
> @@ -242,6 +246,10 @@ struct imx214_clk_params {
>  };
>
>  static const struct imx214_clk_params imx214_clk_params[] =3D {
> +       {
> +               .clk_freq =3D IMX214_CLK_FREQ_23880KHZ,
> +               .link_freq =3D IMX214_LINK_FREQ_597MHZ,
> +       },
>         {
>                 .clk_freq =3D IMX214_CLK_FREQ_24000KHZ,
>                 .link_freq =3D IMX214_LINK_FREQ_600MHZ,
> @@ -1320,8 +1328,7 @@ static int imx214_parse_fwnode(struct device *dev, =
struct imx214 *imx214)
>
>         if (i =3D=3D bus_cfg.nr_of_link_frequencies)
>                 ret =3D dev_err_probe(dev, -EINVAL,
> -                                   "link-frequencies %d not supported, p=
lease review your DT\n",
> -                                   IMX214_LINK_FREQ_600MHZ);
> +                                   "provided link-frequencies not suppor=
ted, please review your DT\n");
>
>  done:
>         v4l2_fwnode_endpoint_free(&bus_cfg);
> @@ -1359,6 +1366,7 @@ static int imx214_probe(struct i2c_client *client)
>         }
>
>         switch (xclk_freq) {
> +       case IMX214_CLK_FREQ_23880KHZ:
>         case IMX214_CLK_FREQ_24000KHZ:
>                 if (imx214->clk_params->clk_freq !=3D xclk_freq)
>                         return dev_err_probe(imx214->dev, -EINVAL,
>
> --
> 2.48.1
>
>

