Return-Path: <linux-media+bounces-62149-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Df9BTtxDGpKhgUAu9opvQ
	(envelope-from <linux-media+bounces-62149-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 16:18:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4C580669
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 16:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 847BE305C96E
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0F83ED3CD;
	Tue, 19 May 2026 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KR9xn77e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1F34040F
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199641; cv=pass; b=QjziBYexvdHYgUzR+1OA0Xfwx8ihwZf9vCZyifrZCeHnWIjcOIO1rbeaojnhJWL8HqFVoYSBZnV3nWayxw8Y030TeQeC2SGBFEh1jsnQ+SnAbMttXSCkIB/I2dZzvfNgB4EA2GkYCFHrqN2yx+PqlPTbSajpijbzcc0ugYDG3yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199641; c=relaxed/simple;
	bh=2ycvod0YCXTKnkenrVojXQ0ND24hTdcVG0/s1dzooN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHNz6XUV2X6D7NVa3P99ekRKinO15Mgw0PN66HO8WZQh2kabsP348cDQ5yYh7Tgl7Y4hgzTjbDXq0D544hbTsERyRC/vwrdzNX9HjKMzEPGrJERk6uHF3wRwOyFgpafXxGlYCT6cv8pMkmWaN9TgEm82WZ+cZ1K8Nfmps0WWD18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KR9xn77e; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7c2fa14795aso25158947b3.1
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 07:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779199637; cv=none;
        d=google.com; s=arc-20240605;
        b=JEtVGrYNhpQo8aco9FD5/7ZlBQvKFhUYQhJ7jc/ifk35M8mdWX33qGIASxuLM41wVg
         UR2dRRjatLkG9cKEhAkg1mcfJaWY4p2sDBgRyXuxNiKRfJbR2GrXnWXCBfij9vFeVrsi
         3js2Rhj8xxoM9itcDvorTp2BLnpAuVTP8ePZ2TC3TOgQPti/9SYv57fnOdkgNos5X+eC
         i5DPCR6NnVWiORzDXjbvgyMNFL3a4XGu2IwkBJjaANumRMOrJ5kMO0fZGQuI1hNoTOHt
         isQZWVy4GUkQ7w5YHuMu9MJjHoqBz6wTqYQjPPl9KNUedOwr7d9k6+zcSMaCC5lAC7SD
         mBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L81mTCbyP5GqN/nxQe6EseVjGF23yhTfAgWm16p/HnU=;
        fh=hX/YRMZzBUSa96h0mu3VIMNPJf9JcGc6EV28AHmwQ5g=;
        b=Ivj6rFCaHn2MLbozZx6rVUVc84Uq+dDfWZIeYRS/rGq94EDieDHme4UoBrKe2APKVj
         a+xCJf5iXErl7SrdBPTTdzvOpRyiN42hFw+ePvbvkjaNz1NIsK6ecyAs/f4b0fKDDrGp
         NSUdFG6lMEuxsGQ2UgCpBXAEC+lXCcg7BDGXKud3XD9sAbIW0NlT/Jx3hTGcks3HvtZu
         qihaC0EApr2xvdNjAhpDtGwyFXtE3/Mjbz4dPEuW4AcGOiTHs3ABb3HOZicq4xTXahIb
         MDy1Q0us7QTMCRTwLjSFpY2pWoQDE8JuDMUjp3ykvtXaKOtVcKqnTQQfw2YfqXatYEK7
         vc5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779199637; x=1779804437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L81mTCbyP5GqN/nxQe6EseVjGF23yhTfAgWm16p/HnU=;
        b=KR9xn77erucFGz2wPydY2Hy7iJpmJdiCnpE1OIo0nQMHc3TnQBa9EkFXy7K0JNu/jl
         OQw3Qg8RUswjKmC0SVVvJes2Xe46odRyIc5zqZw6n4emBaANOihq/1o/c4ZsCOzDlLhe
         LMZJt1A/u/d0wM9Cn3i6RtzzzJpsIa4/J/bkCoxg3P5NiQXcZV0GtrjaY0NMAH7aHl05
         OkDTdSnd4XOZE0dAkTvCeRcotkhIia5zgeE1vBotlReXZfx/hGBkyv1dXCACU/kCTJrz
         H7jsVH9PMzLxInyPh592T+X0P/8wEU2j6pg6O7JteGkGta4xvT/YiCAjpCLi1+uPo2lN
         eisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199637; x=1779804437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L81mTCbyP5GqN/nxQe6EseVjGF23yhTfAgWm16p/HnU=;
        b=D0QBrDO1kuQYmKEBm7PXnt0qIU+mdMsaA5d8H7DdNu4SZS3ltREbcJRix+XhavWWAQ
         Vmzts8z6tc6zroEU2616JsUtZM9cduPnsh8TCOa3X+Wnazx9XeNv4sfkVfqx0yK0fy4J
         VrwXzjOA2CIg2T8sjmj2rp4UTR7UW8BdUn3taaEL79muWVwK/2zN8iZOKcyz0N11gVMC
         ESlCi+o6Jl8aeMuGaVMVtfwryZFQVsCkih35MX9nPYvsGLEzR1vSEq4Uq+yRGiRnTjqk
         xMNJ3GzalSFCkLng80msAaHuAX/DB2Z9hjP9F30vAi53DxU5J3+GIEfoTgj1FckXCu0W
         aAXw==
X-Forwarded-Encrypted: i=1; AFNElJ9AJUQso/5wmqXcWY8iU9tvE9yuFuHrXlTQUEPZDva0Q2YM4ILeJuR1sdVjzy2a9mCJwD2orFVCofMw/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTQMgCVBKycYlJtw8zAJaXaCzqorEUlPB6E34PGd/QY7uZ9eT
	LOtw2TeY/YFpqGaU7x4vxUCpmNSGrt0/Atw9XWI218UN4sf8N2EeqXGzRRamZA5cEsMlHh0dMwB
	OoFC7dOPd4KzJ2J3CymstjBuWS1r/HkzX9IhxFgiySw==
X-Gm-Gg: Acq92OEZaBqE8DcPvQPt/Loj5BmGi2gfCFgU22rYuc1NWfd4NITqVjyENO6Bug7JQbm
	KXkWzrMMKVOC4IoHlD3hpwreL7x6dNajCwNFNPi3QeN7bQoQCC0lJh492GNdKuMGOcS1DgH6FB3
	plS6ZcKEXIbaM4HKpzFO+lHF1ymh3cpUjz04K3/jh186uF00rvaeTWD87n/25aSLfC2Nxs4XGfZ
	aO3Sn07IqZMx7RDQ8ZDYGe/o/405ZzWmxOjpgHSU6CzvdPNWYlonnCK+t8p1a1L1TIb0phwgmk+
	g6tW8Egr+97/VSE/BJ4Jd4K4tLqseEjncW9pZaYQKGrleb/HOI5MciDF7afxvmRdyTwpI3KK24u
	e99fLH0LiOEE+eU3MyyJmRBZpttmWnxhYlyU=
X-Received: by 2002:a05:690c:7681:b0:7b1:2c46:9480 with SMTP id
 00721157ae682-7c95bf13c3dmr180214427b3.34.1779199637131; Tue, 19 May 2026
 07:07:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519104129.2001018-1-shravan.chippa@microchip.com>
In-Reply-To: <20260519104129.2001018-1-shravan.chippa@microchip.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 May 2026 15:06:59 +0100
X-Gm-Features: AVHnY4IyqTX9YSIHdXpzxd8Kk4gRCS4T7it9aiQ1AdoOcMhFcAbrH4EdZnNDqQM
Message-ID: <CAPY8ntC4kSq21J=BF+kxO8dESd1u3+cUbgj1VQzKhGYF_pMstA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx334: add new link frequency configuration
To: shravan kumar <shravan.chippa@microchip.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com, 
	praveen.kumar@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-62149-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,mail.gmail.com:mid,raspberrypi.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+]
X-Rspamd-Queue-Id: 0AF4C580669
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shravan

On Tue, 19 May 2026 at 12:17, shravan kumar
<shravan.chippa@microchip.com> wrote:
>
> From: Shravan Chippa <shravan.chippa@microchip.com>
>
> Add support for a new 222=E2=80=AFMHz link frequency configuration to the
> IMX334 driver and dynamically generate the supported modes array
> based on the link frequencies specified in the DTS. When multiple
> link frequencies support the same resolution, the driver selects
> the first matching entry; therefore, the link frequency must be
> explicitly defined in the DTS to avoid resolution conflicts.
> The link frequency is a read=E2=80=91only parameter and is automatically
> set based on the selected resolution and DTS configuration.

Where is the sensor setup to configure this 222MHz link frequency?

I have a datasheet that lists support for 1782, 1188, and 891Mbit/s,
which equates to 891, 594, and 445.5MHz link frequencies. There is no
mention of supporting 444Mbit/s or 222MHz.
The driver switches from the default 445.5MHz to 891MHz by changing
SYS_MODE from 0x02 to 0x00 (it's an 8bit register, so I don't know why
it's trying to write 0x0100).

As far as I can tell, this patch just changes the advertised link
frequency, but the sensor will produce exactly the same 445.5MHz
output. Can you tell me what I've missed?

Thanks
  Dave

> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
>  drivers/media/i2c/imx334.c | 112 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 106 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index 9654f9268056..336de9cd8ff2 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -109,6 +109,7 @@
>  /* CSI2 HW configuration */
>  #define IMX334_LINK_FREQ_891M          891000000
>  #define IMX334_LINK_FREQ_445M          445500000
> +#define IMX334_LINK_FREQ_222M          222500000
>  #define IMX334_NUM_DATA_LANES          4
>
>  #define IMX334_REG_MIN                 0x00
> @@ -209,6 +210,8 @@ struct imx334 {
>         };
>         u32 vblank;
>         const struct imx334_mode *cur_mode;
> +       const struct imx334_mode *new_supported_modes;
> +       int new_modes_size;
>         unsigned long link_freq_bitmap;
>         u32 cur_code;
>  };
> @@ -216,6 +219,7 @@ struct imx334 {
>  static const s64 link_freq[] =3D {
>         IMX334_LINK_FREQ_891M,
>         IMX334_LINK_FREQ_445M,
> +       IMX334_LINK_FREQ_222M,
>  };
>
>  /* Sensor common mode registers values */
> @@ -486,6 +490,45 @@ static const struct imx334_mode supported_modes[] =
=3D {
>                         .num_of_regs =3D ARRAY_SIZE(mode_640x480_regs),
>                         .regs =3D mode_640x480_regs,
>                 },
> +       }, {
> +               .width =3D 1920,
> +               .height =3D 1080,
> +               .hblank =3D 2480,
> +               .vblank =3D 1170,
> +               .vblank_min =3D 45,
> +               .vblank_max =3D 132840,
> +               .pclk =3D 297000000,
> +               .link_freq_idx =3D 2,
> +               .reg_list =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_1920x1080_regs),
> +                       .regs =3D mode_1920x1080_regs,
> +               },
> +       }, {
> +               .width =3D 1280,
> +               .height =3D 720,
> +               .hblank =3D 2480,
> +               .vblank =3D 1170,
> +               .vblank_min =3D 45,
> +               .vblank_max =3D 132840,
> +               .pclk =3D 297000000,
> +               .link_freq_idx =3D 2,
> +               .reg_list =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_1280x720_regs),
> +                       .regs =3D mode_1280x720_regs,
> +               },
> +       }, {
> +               .width =3D 640,
> +               .height =3D 480,
> +               .hblank =3D 2480,
> +               .vblank =3D 1170,
> +               .vblank_min =3D 45,
> +               .vblank_max =3D 132840,
> +               .pclk =3D 297000000,
> +               .link_freq_idx =3D 2,
> +               .reg_list =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_640x480_regs),
> +                       .regs =3D mode_640x480_regs,
> +               },
>         },
>  };
>
> @@ -713,7 +756,7 @@ static int imx334_enum_frame_size(struct v4l2_subdev =
*sd,
>         struct imx334 *imx334 =3D to_imx334(sd);
>         u32 code;
>
> -       if (fsize->index >=3D ARRAY_SIZE(supported_modes))
> +       if (fsize->index >=3D imx334->new_modes_size)
>                 return -EINVAL;
>
>         code =3D imx334_get_format_code(imx334, fsize->code);
> @@ -721,9 +764,9 @@ static int imx334_enum_frame_size(struct v4l2_subdev =
*sd,
>         if (fsize->code !=3D code)
>                 return -EINVAL;
>
> -       fsize->min_width =3D supported_modes[fsize->index].width;
> +       fsize->min_width =3D imx334->new_supported_modes[fsize->index].wi=
dth;
>         fsize->max_width =3D fsize->min_width;
> -       fsize->min_height =3D supported_modes[fsize->index].height;
> +       fsize->min_height =3D imx334->new_supported_modes[fsize->index].h=
eight;
>         fsize->max_height =3D fsize->min_height;
>
>         return 0;
> @@ -792,8 +835,8 @@ static int imx334_set_pad_format(struct v4l2_subdev *=
sd,
>         const struct imx334_mode *mode;
>         int ret =3D 0;
>
> -       mode =3D v4l2_find_nearest_size(supported_modes,
> -                                     ARRAY_SIZE(supported_modes),
> +       mode =3D v4l2_find_nearest_size(imx334->new_supported_modes,
> +                                     imx334->new_modes_size,
>                                       width, height,
>                                       fmt->format.width, fmt->format.heig=
ht);
>
> @@ -914,6 +957,9 @@ static int imx334_enable_streams(struct v4l2_subdev *=
sd,
>                 goto err_rpm_put;
>         }
>
> +       if (link_freq[imx334->cur_mode->link_freq_idx] =3D=3D IMX334_LINK=
_FREQ_222M)
> +               cci_write(imx334->cci, IMX334_REG_INCKSEL2, 0x0a, NULL);
> +
>         /* Start streaming */
>         ret =3D cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
>                         IMX334_MODE_STREAMING, NULL);
> @@ -979,6 +1025,55 @@ static int imx334_detect(struct imx334 *imx334)
>         return 0;
>  }
>
> +/**
> + * imx334_update_supported_mode_array() - Search for the supported
> + *                                        modes add them in the new list
> + * @imx334: pointer to imx334 device
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int imx334_update_supported_mode_array(struct imx334 *imx334)
> +{
> +       int i, j, size =3D 0;
> +       struct imx334_mode *temp_ptr;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(link_freq); i++) {
> +               if (imx334->link_freq_bitmap & (1 << i)) {
> +                       for (j =3D 0; j < ARRAY_SIZE(supported_modes); j+=
+) {
> +                               if (supported_modes[j].link_freq_idx =3D=
=3D i)
> +                                       size++;
> +                       }
> +               }
> +       }
> +
> +       if (!size)
> +               return -EINVAL;
> +
> +       imx334->new_modes_size =3D size;
> +
> +       size =3D 0;
> +
> +       temp_ptr =3D devm_kmalloc(imx334->dev, imx334->new_modes_size * s=
izeof(struct imx334_mode),
> +                               GFP_KERNEL);
> +       if (!temp_ptr)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(link_freq); i++) {
> +               if (imx334->link_freq_bitmap & (1 << i)) {
> +                       for (j =3D 0; j < ARRAY_SIZE(supported_modes); j+=
+) {
> +                               if (supported_modes[j].link_freq_idx =3D=
=3D i) {
> +                                       temp_ptr[size] =3D supported_mode=
s[j];
> +                                       size++;
> +                               }
> +                       }
> +               }
> +       }
> +
> +       imx334->new_supported_modes =3D temp_ptr;
> +
> +       return 0;
> +}
> +
>  /**
>   * imx334_parse_hw_config() - Parse HW configuration and check if suppor=
ted
>   * @imx334: pointer to imx334 device
> @@ -1038,6 +1133,11 @@ static int imx334_parse_hw_config(struct imx334 *i=
mx334)
>                                        link_freq, ARRAY_SIZE(link_freq),
>                                        &imx334->link_freq_bitmap);
>
> +       if (ret)
> +               goto done_endpoint_free;
> +
> +       ret =3D imx334_update_supported_mode_array(imx334);
> +
>  done_endpoint_free:
>         v4l2_fwnode_endpoint_free(&bus_cfg);
>
> @@ -1251,7 +1351,7 @@ static int imx334_probe(struct i2c_client *client)
>         }
>
>         /* Set default mode to max resolution */
> -       imx334->cur_mode =3D &supported_modes[__ffs(imx334->link_freq_bit=
map)];
> +       imx334->cur_mode =3D &imx334->new_supported_modes[__ffs(imx334->l=
ink_freq_bitmap)];
>         imx334->cur_code =3D imx334_mbus_codes[0];
>         imx334->vblank =3D imx334->cur_mode->vblank;
>
> --
> 2.34.1
>
>

