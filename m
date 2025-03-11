Return-Path: <linux-media+bounces-28064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CCEA5D1AD
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 22:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E2DA7AB2AA
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 21:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBA0229B17;
	Tue, 11 Mar 2025 21:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kb3tnWvd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7F1E8336;
	Tue, 11 Mar 2025 21:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741728174; cv=none; b=MZ5sHfKWVkvBrdc49X3McG8KTZ4iHWgumXwGQqcqG/Baj9qVZ+Kyog0am0Vl+CgFOb0yH5iVKjU//sHZCTOPUfIOTapq1Aph+1att7PH55+oa1/cfQwa3l7VKxoNIToGOtKAcErmL+nzSCefHd59/5g5dmi3QLJFO7h/iZ+KwmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741728174; c=relaxed/simple;
	bh=rdAyL6dxqIRzWlnVdndyUduI9mHHfIsezUkZwVt7taI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5+P1hBLFmjcAjPfOiC0dOqrLa/B15cLj8kUWiNBbkzmmDNSWZBFFI7TkqCWr07ius+hppuHU95fSfFhmctGhQOmR3b48zS45yqtHaqJmsj/CsYZ1yMnR3HSpaeVvLZLdunzinve0I6p50bYEFVsxum9ilDLNFdylh9MeBFg8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kb3tnWvd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52DCC4CEEA;
	Tue, 11 Mar 2025 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741728173;
	bh=rdAyL6dxqIRzWlnVdndyUduI9mHHfIsezUkZwVt7taI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kb3tnWvdTigfMBHMkbx02A0nsWtYEglyWy8FeG3NyvTw5fPHOUlCtaAUxvIIlaYfy
	 Iv52THuQKIMXj0XVNlxZAgHPTSZdLDlwStBaVjmDYbqAX+xbRkJAwta70YqUuCMHZ+
	 hAeTAWpJy3v0LPAw8+QnxcDX7NNDJgVsTgZgsb3xxGDhYo91Zf9xFrYkt6+wU7l+45
	 NUzCZolU24AyUT0sZuQj0HyqhAKSzCb0SvyK0CbB2SCq89Q+ScK3Qb7/0nTUo439SQ
	 Mt7+F4pmSjjE0vhvfLLN1ToNtG1vIlHHSPkUu0yoPLNPPpx8s8sQWV+w+gE1WxB0b2
	 7FuTZjhCFrx6w==
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-860f0e91121so254370241.0;
        Tue, 11 Mar 2025 14:22:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUH8T8VMm3BCURH70EQIw/0zzGAdVVY0IQQLMyE7QGBZijWWi7NJOLuC39wrh4J/r0T9a9nQBiWA1JHJHE=@vger.kernel.org, AJvYcCVK9rF9t5BoRoisR4TolXBmDuqITCIid/o1N2Rj9J0+ADRFUuhI1jtp/CaVkB4oMiw1sPJFw3YJOYNgRT8=@vger.kernel.org, AJvYcCXijuNIBPXCM2SWBhqTsQcjzMpSLerQ5Td9xnqy2WL72e+6Z5PuRNN7NIK+XyapOQFCVxPFkqTpVAQJ5k4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf24mrEmknyZ9TkurmfJgVpjYVX2FHpEKuGTK0Rv3UUesqpirO
	DR8Qa2GkbLB4mQAz9mWq5JU0QVMIH6Lu6Adc0KKuC5GOiqDk/5+y83wVLyIzNzBH/zNu8SBZdkb
	oJpj/z5wW2dGQAQ5J/587+k6K0c8=
X-Google-Smtp-Source: AGHT+IHokNWlTUKtGuiQuKZcgZmb4JwGbb01gG6GRpXQvIbv94p1M4wFJUbIMX7LLM19EfAzvTShqhBuSdkf/aPpS7E=
X-Received: by 2002:a05:6102:440f:b0:4c2:fccb:a647 with SMTP id
 ada2fe7eead31-4c34dd1534fmr4383833137.5.1741728172941; Tue, 11 Mar 2025
 14:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu> <20250308-imx214_clk_freq-v1-3-467a4c083c35@apitzsch.eu>
In-Reply-To: <20250308-imx214_clk_freq-v1-3-467a4c083c35@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Tue, 11 Mar 2025 22:22:36 +0100
X-Gmail-Original-Message-ID: <CAPybu_0FQRA+5wnKo_m_4gxZv0AS9fQuyp3OXwaGA+2t+QdyaA@mail.gmail.com>
X-Gm-Features: AQ5f1JrTYz0BBL91NOJvzNx3csh1WPPWSLh4b_cVGLqr3skzjxLEAR0KB82X4zg
Message-ID: <CAPybu_0FQRA+5wnKo_m_4gxZv0AS9fQuyp3OXwaGA+2t+QdyaA@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/4] media: i2c: imx214: Read clock frequency from
 device tree
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
> Replace the hard coded external clock frequency by the one read from
> device tree.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 99 ++++++++++++++++++++++++++++++++++++----=
------
>  1 file changed, 79 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 53b6b427f263a8ad7e3a0d1f711ece234601100e..c3d55259d6fd1c4ca96f52833=
864bdfe6bedf13a 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -30,11 +30,10 @@
>
>  #define IMX214_REG_FAST_STANDBY_CTRL   CCI_REG8(0x0106)
>
> -#define IMX214_DEFAULT_CLK_FREQ        24000000
> -#define IMX214_DEFAULT_LINK_FREQ       600000000
> +#define IMX214_CLK_FREQ_24000KHZ       24000000
> +#define IMX214_LINK_FREQ_600MHZ                600000000
>  /* Keep wrong link frequency for backward compatibility */
>  #define IMX214_DEFAULT_LINK_FREQ_LEGACY        480000000
> -#define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10=
)
>  #define IMX214_FPS 30
>
>  /* V-TIMING internal */
> @@ -233,6 +232,22 @@ static const char * const imx214_supply_name[] =3D {
>
>  #define IMX214_NUM_SUPPLIES ARRAY_SIZE(imx214_supply_name)
>
> +static const s64 link_freq[] =3D {
> +       IMX214_LINK_FREQ_600MHZ,
> +};
Do we need to move this?

> +
> +struct imx214_clk_params {
> +       u32 clk_freq;
> +       u64 link_freq;
> +};
> +
> +static const struct imx214_clk_params imx214_clk_params[] =3D {
> +       {
> +               .clk_freq =3D IMX214_CLK_FREQ_24000KHZ,
> +               .link_freq =3D IMX214_LINK_FREQ_600MHZ,
> +       },
> +};
> +
>  /*
>   * The supported formats.
>   * This table MUST contain 4 entries per format, to cover the various fl=
ip
> @@ -270,6 +285,8 @@ struct imx214 {
>         struct clk *xclk;
>         struct regmap *regmap;
>
> +       const struct imx214_clk_params *clk_params;
> +
>         struct v4l2_subdev sd;
>         struct media_pad pad;
>
> @@ -794,7 +811,7 @@ static int imx214_set_clock(struct imx214 *imx214)
>         cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
>                   IMX214_PLL_SINGLE, &ret);
>         cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
> -                 IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000), &r=
et);
> +                 IMX214_EXCK_FREQ(imx214->clk_params->clk_freq / 1000000=
), &ret);
>
>         return ret;
>  }
> @@ -899,9 +916,6 @@ static const struct v4l2_ctrl_ops imx214_ctrl_ops =3D=
 {
>
>  static int imx214_ctrls_init(struct imx214 *imx214)
>  {
> -       static const s64 link_freq[] =3D {
> -               IMX214_DEFAULT_LINK_FREQ
> -       };
>         static const struct v4l2_area unit_size =3D {
>                 .width =3D 1120,
>                 .height =3D 1120,
> @@ -910,6 +924,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>         struct v4l2_fwnode_device_properties props;
>         struct v4l2_ctrl_handler *ctrl_hdlr;
>         int exposure_max, exposure_def;
> +       int pixel_rate;
>         int hblank;
>         int i, ret;
>
> @@ -922,15 +937,25 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>         if (ret)
>                 return ret;
>
> +       pixel_rate =3D imx214->clk_params->link_freq * 8 / 10;
>         imx214->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, NULL,
>                                                V4L2_CID_PIXEL_RATE, 0,
> -                                              IMX214_DEFAULT_PIXEL_RATE,=
 1,
> -                                              IMX214_DEFAULT_PIXEL_RATE)=
;
> +                                              pixel_rate, 1, pixel_rate)=
;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(link_freq); ++i) {
> +               if (imx214->clk_params->link_freq =3D=3D link_freq[i])
> +                       break;
> +       }
> +       if (i =3D=3D ARRAY_SIZE(link_freq)) {
> +               dev_err(imx214->dev, "link frequency %lld not supported\n=
",
> +                       imx214->clk_params->link_freq);
> +               return -EINVAL;
> +       }
>
>         imx214->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL,
>                                                    V4L2_CID_LINK_FREQ,
>                                                    ARRAY_SIZE(link_freq) =
- 1,
> -                                                  0, link_freq);
> +                                                  i, link_freq);
>         if (imx214->link_freq)
>                 imx214->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>
> @@ -1047,7 +1072,7 @@ static int imx214_start_streaming(struct imx214 *im=
x214)
>                 return ret;
>         }
>
> -       link_bit_rate =3D IMX214_LINK_BIT_RATE(IMX214_DEFAULT_CLK_FREQ);
> +       link_bit_rate =3D IMX214_LINK_BIT_RATE(imx214->clk_params->clk_fr=
eq);
>         ret =3D cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
>                         IMX214_LINK_BIT_RATE_MBPS(link_bit_rate), NULL);
>         if (ret) {
> @@ -1238,7 +1263,20 @@ static int imx214_identify_module(struct imx214 *i=
mx214)
>         return 0;
>  }
>
> -static int imx214_parse_fwnode(struct device *dev)
> +static int imx214_has_link_freq(struct imx214 *imx214, u64 link_frequenc=
y)
static bool imx214_set_clk_params(struct imx214 *imx214, u64 link_frequency=
)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(imx214_clk_params); ++i) {
> +               if (imx214_clk_params[i].link_freq =3D=3D link_frequency)=
 {
> +                       imx214->clk_params =3D &imx214_clk_params[i];
> +                       break;
                            return true;
> +               }
> +       }
> +       return (i < ARRAY_SIZE(imx214_clk_params));
            return false;
> +}
> +
> +static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214=
)
>  {
>         struct fwnode_handle *endpoint;
>         struct v4l2_fwnode_endpoint bus_cfg =3D {
> @@ -1268,13 +1306,14 @@ static int imx214_parse_fwnode(struct device *dev=
)
>                 dev_warn(dev, "Only one link-frequency supported, please =
review your DT. Continuing anyway\n");
>
>         for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> -               if (bus_cfg.link_frequencies[i] =3D=3D IMX214_DEFAULT_LIN=
K_FREQ)
> +               if (imx214_has_link_freq(imx214, bus_cfg.link_frequencies=
[i]))
>                         break;
>                 if (bus_cfg.link_frequencies[i] =3D=3D
>                     IMX214_DEFAULT_LINK_FREQ_LEGACY) {
>                         dev_warn(dev,
>                                  "link-frequencies %d not supported, plea=
se review your DT. Continuing anyway\n",
> -                                IMX214_DEFAULT_LINK_FREQ);
> +                                IMX214_LINK_FREQ_600MHZ);
> +                       imx214->clk_params =3D &imx214_clk_params[1];
I guess you mean:
                            imx214->clk_params =3D &imx214_clk_params[0];
>                         break;
>                 }
>         }
> @@ -1282,7 +1321,7 @@ static int imx214_parse_fwnode(struct device *dev)
>         if (i =3D=3D bus_cfg.nr_of_link_frequencies)
>                 ret =3D dev_err_probe(dev, -EINVAL,
>                                     "link-frequencies %d not supported, p=
lease review your DT\n",
> -                                   IMX214_DEFAULT_LINK_FREQ);
> +                                   IMX214_LINK_FREQ_600MHZ);
I think this was wrong on the original driver.

it should be

bus_cfg.nr_of_link_frequencies ? bus_cfg.link_frequencies[0] : 0;

>
>  done:
>         v4l2_fwnode_endpoint_free(&bus_cfg);
> @@ -1294,16 +1333,17 @@ static int imx214_probe(struct i2c_client *client=
)
>  {
>         struct device *dev =3D &client->dev;
>         struct imx214 *imx214;
> +       u32 xclk_freq;
>         int ret;
>
> -       ret =3D imx214_parse_fwnode(dev);
> -       if (ret)
> -               return ret;
> -
>         imx214 =3D devm_kzalloc(dev, sizeof(*imx214), GFP_KERNEL);
>         if (!imx214)
>                 return -ENOMEM;
>
> +       ret =3D imx214_parse_fwnode(dev, imx214);
> +       if (ret)
> +               return ret;
> +
>         imx214->dev =3D dev;
>
>         imx214->xclk =3D devm_clk_get(dev, NULL);
> @@ -1311,7 +1351,26 @@ static int imx214_probe(struct i2c_client *client)
>                 return dev_err_probe(dev, PTR_ERR(imx214->xclk),
>                                      "failed to get xclk\n");
>
> -       ret =3D clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> +       ret =3D device_property_read_u32(dev, "clock-frequency", &xclk_fr=
eq);
> +       if (ret) {
> +               dev_warn(dev,
> +                        "clock-frequency not set, please review your DT.=
 Fallback to default\n");
> +               xclk_freq =3D IMX214_CLK_FREQ_24000KHZ;
> +       }
> +
> +       switch (xclk_freq) {
> +       case IMX214_CLK_FREQ_24000KHZ:
> +               if (imx214->clk_params->clk_freq !=3D xclk_freq)
> +                       return dev_err_probe(imx214->dev, -EINVAL,
> +                                            "combination of clock and li=
nk frequency is not supported\n");
> +               break;
> +       default:
> +               return dev_err_probe(imx214->dev, -EINVAL,
> +                                    "external clock frequency %u is not =
supported\n",
> +                                    xclk_freq);
> +       }
> +
> +       ret =3D clk_set_rate(imx214->xclk, xclk_freq);
>         if (ret)
>                 return dev_err_probe(dev, ret,
>                                      "failed to set xclk frequency\n");
>
> --
> 2.48.1
>
>

