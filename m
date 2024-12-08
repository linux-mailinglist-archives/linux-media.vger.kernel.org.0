Return-Path: <linux-media+bounces-22841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A09CD9E8801
	for <lists+linux-media@lfdr.de>; Sun,  8 Dec 2024 22:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DC65164330
	for <lists+linux-media@lfdr.de>; Sun,  8 Dec 2024 21:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD843192B79;
	Sun,  8 Dec 2024 21:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDXfwjrU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134DF13A865;
	Sun,  8 Dec 2024 21:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733691969; cv=none; b=SAk4HrZ3dTWc43aZtJGv+ssake+jrVnM/HTAzv3S26fb7sa8IQiBV+G9a7CpZsCr1tVrQqWziQ8QtIUEIj/wMOpWmsgwCcat+SfgZYg1SolT1A3k7hkF6VEEknBTLS0lkGA1Ld4M19vg6fd+Oq7c2YE9oflLuVULAxMqg2fQ2YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733691969; c=relaxed/simple;
	bh=XWXWbSHyOmnQ3nClYUfXghWqO3MXF4bE2l/sCzWy168=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpg7i4js6qu9H9yKpgtFjUy78En+P2rpBKT5sqvd5urbvdqvBZMBjcOFVY1BZyZObvunh7vmzjhGO9D6zZnAQMLDvjGVzsyWKG34Y/bMTi7ypsLXwibpuGJM6Datj/8fVIRHDjSUSW4/J3F4U8hB3lstkOO47LcSpGumu1PvSDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDXfwjrU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9018C4CED2;
	Sun,  8 Dec 2024 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733691968;
	bh=XWXWbSHyOmnQ3nClYUfXghWqO3MXF4bE2l/sCzWy168=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WDXfwjrUgjUvznQ302K8Zu/4231Xy1aCkkIrrJEi85P2I/qnqf6pFl/8gPxzMRt9g
	 mJQ2Y6VxRglGpfWN7PSb5gRqbkbh1NErXelk7CIIHeqqYsPGR45S5jYxEAEWoUDr9x
	 00x+ZyGFNvgVQbUFpiTcG61u3yEqkLkXYpCm2exY520v5e1VkK5wEGsi+G3HvsgiAO
	 Zdhg9ZitdxzKj/BpwaCrp2nitgYmjFlJXpI8tUlZ+xPwVgQvIDVhcGTTDUnpI9ZpOO
	 hCQ9ruy9WmU33wJiFP7v9lg/B1Hj3C5gfQcxvJsh3uLp+S3k1SGRZEqzSibtoLpyGw
	 zZhX0GgMIvikg==
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4aff5b3845eso115432137.2;
        Sun, 08 Dec 2024 13:06:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWx4jvfWDj7vAqj8WrXK0RuG6yCycTadVnrqB82pB/ab3PHh+0Fk83KBs753ZXSsf7ZR5C3yRUzHqGggI=@vger.kernel.org, AJvYcCVTITPujUzR+W8OM/PuER0q+DjY8Tj10av3B5+7vhRhgfv0jcbJPNqHefSqUdolrCIr/KNknUeiD71mVto=@vger.kernel.org, AJvYcCVv5vadnlgeGi3InUQ5JGKLJyuYVJ51GPI7yWVdq4lmA0x7w5RCpQmoqLJFG8e53wn/ZreCNsXrtyLjIR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRtCclYrEiUPCXLbJHowWzYVgaAZckfDo1pMA8bnr4pJ3/c88A
	3ehuveWG7kfZiBE0P2FGFWzXju3r0DEiIiWMfkx0SOAbVY7Af/I64o6yOm1I4EQ756gxeYWeOCE
	wC+p8vO2KMOmrrIJbfvbW1DHplsw=
X-Google-Smtp-Source: AGHT+IHy+1SnJMbE+C+RfB+8fLLmnxwE2hNerqElAz4I/P8HU58GhAcP04n8fOtc7RUCchehSFcTWsF8n0p6UdhrbP0=
X-Received: by 2002:a05:6102:b05:b0:4ac:fe47:1bcf with SMTP id
 ada2fe7eead31-4afcab15935mr10028036137.24.1733691967986; Sun, 08 Dec 2024
 13:06:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu> <20241207-imx214-v3-12-ab60af7ee915@apitzsch.eu>
In-Reply-To: <20241207-imx214-v3-12-ab60af7ee915@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Sun, 8 Dec 2024 22:05:52 +0100
X-Gmail-Original-Message-ID: <CAPybu_2hEzpDbQ-RHTOEcEm4BqL7ctZ0EzvnTMW6xbJBjsoTSg@mail.gmail.com>
Message-ID: <CAPybu_2hEzpDbQ-RHTOEcEm4BqL7ctZ0EzvnTMW6xbJBjsoTSg@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] media: i2c: imx214: Fix link frequency
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Ricardo Ribalda <ribalda@chromium.org>

nit:  media: i2c: imx214: Fix link frequency validation



On Sat, Dec 7, 2024 at 9:49=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> The driver defines IMX214_DEFAULT_LINK_FREQ 480000000, and then
> IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10),
> which works out as 384MPix/s. (The 8 is 4 lanes and DDR.)
>
> Parsing the PLL registers with the defined 24MHz input. We're in single
> PLL mode, so MIPI frequency is directly linked to pixel rate.  VTCK ends
> up being 1200MHz, and VTPXCK and OPPXCK both are 120MHz.  Section 5.3
> "Frame rate calculation formula" says "Pixel rate
> [pixels/s] =3D VTPXCK [MHz] * 4", so 120 * 4 =3D 480MPix/s, which basical=
ly
> agrees with my number above.
>
> 3.1.4. MIPI global timing setting says "Output bitrate =3D OPPXCK * reg
> 0x113[7:0]", so 120MHz * 10, or 1200Mbit/s. That would be a link
> frequency of 600MHz due to DDR.
> That also matches to 480MPix/s * 10bpp / 4 lanes / 2 for DDR.
>
> Keep the previous link frequency for backward compatibility.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 1330f13207beec0960c384681bf0b49e99fe860f..910ad03cda23345d3d10d13cd=
30f007954534e80 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -31,7 +31,9 @@
>  #define IMX214_REG_FAST_STANDBY_CTRL   CCI_REG8(0x0106)
>
>  #define IMX214_DEFAULT_CLK_FREQ        24000000
> -#define IMX214_DEFAULT_LINK_FREQ 480000000
> +#define IMX214_DEFAULT_LINK_FREQ       600000000
> +/* Keep wrong link frequency for backward compatibility */
> +#define IMX214_DEFAULT_LINK_FREQ_LEGACY        480000000
>  #define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10=
)
>  #define IMX214_FPS 30
>
> @@ -1216,18 +1218,22 @@ static int imx214_parse_fwnode(struct device *dev=
)
>                 goto done;
>         }
>

Now that I think about this... We only support
buf_cfg.no_of_link_frequencies =3D=3D1.
Maybe you can add a check before the loop
if (bus_cfg.nr_of_link_frequencies !=3D 1)
                       dev_warn(dev, "Only one link-frequency
supported, please review your DT. Continuing anyway\n ")


> -       for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++)
> +       for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++) {
>                 if (bus_cfg.link_frequencies[i] =3D=3D IMX214_DEFAULT_LIN=
K_FREQ)
>                         break;
> -
> -       if (i =3D=3D bus_cfg.nr_of_link_frequencies) {
> -               dev_err_probe(dev, -EINVAL,
> -                             "link-frequencies %d not supported, Please =
review your DT\n",
> -                             IMX214_DEFAULT_LINK_FREQ);
> -               ret =3D -EINVAL;
> -               goto done;
> +               if (bus_cfg.link_frequencies[i] =3D=3D IMX214_DEFAULT_LIN=
K_FREQ_LEGACY) {
> +                       dev_warn(dev,
> +                                "link-frequencies %d not supported, plea=
se review your DT. Continuing anyway\n",
> +                                IMX214_DEFAULT_LINK_FREQ);
> +                       break;
> +               }
>         }
>
> +       if (i =3D=3D bus_cfg.nr_of_link_frequencies)
> +               ret =3D dev_err_probe(dev, -EINVAL,
> +                                   "link-frequencies %d not supported, p=
lease review your DT\n",
> +                                   IMX214_DEFAULT_LINK_FREQ);
> +
>  done:
>         v4l2_fwnode_endpoint_free(&bus_cfg);
>         fwnode_handle_put(endpoint);
>
> --
> 2.47.1
>
>
>

