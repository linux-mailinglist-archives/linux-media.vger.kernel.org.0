Return-Path: <linux-media+bounces-24137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AACAD9FD4F8
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 14:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 595C13A120D
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 13:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CE21F37D5;
	Fri, 27 Dec 2024 13:31:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86751156F21;
	Fri, 27 Dec 2024 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735306287; cv=none; b=KVNEn6ZUdyr+LMvxPh55/tj0pLDWgnQCni8E8AbHAMk5HWoVbd0zgmk4bTXpXoI6tWU9LH2u1vX2rbsyE4bdKqnOi/b1lU5x2MFcDzYrayvasJ5l1om494tp56xhc60yrg5C52CuzZGMkW3ti0J9gqZDoh3X/g8PIe34eaJenkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735306287; c=relaxed/simple;
	bh=hRr3pNzD0e6WpcXhNDQJM1fsvYY4RcNy64fnkD88HrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSH71C7DXNjT12tXOUNrmEEpHK7ioG9MzQt8Gx5yrTQ32ouS5clj6BcU5XIf7EfRrH1j+BaFmCXu8pJ8KaYjm3ja8BpJA9+mlV/6XItF7kZHtSYXJEFdI8g7UrARxwRC2XknLitamh3OjZsGLCNeXA0vcz4ggFipvljeNHLF+zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso4784626137.0;
        Fri, 27 Dec 2024 05:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735306283; x=1735911083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oqooa44AzmBAIMBX02bxMmp7g+GcRPDgC5SUGNdvpP0=;
        b=mSe56jnx2Q+2Mvc+lsh/EQUAgs7QXOyBMOZ09+xmNa8YivPIMnCcQ3MpBkMjgqaViV
         mY9GMbl583J+depKYYoYgkv2/JpMc8Fqab4urlFms2DUP3CmoeKKs8Tf7Uz2fb5zSRWm
         lbb0wsTJdEqGcS0BtPEzjtCcdrovuWukOa8/xTNmgU3DKKJmH7h0XvPPPd6eK1YPx8iR
         FzUCOGSWTR+7Pcfsx77nsiurPASKZHRqfab6fZ1XWkzrBPHwX5mwX7fCx2OPa0g3cKAR
         fGu1+/9rCPnnAisWuoUQq++EZz4K1LKQOtKqq+WUAZ1cda3qiDEIVoOsmjcJxK+7U4Qx
         YBfw==
X-Forwarded-Encrypted: i=1; AJvYcCUM75mClTsO3GZvOOmPbE/Cce2mVzQGGzH1mUjQcNYHXKaKLti/9HZZ9vgiTzBR4YtfhexnNymbrWin@vger.kernel.org, AJvYcCV0eCCGJUTK9Da3F/jxtL3Jxy+FB1ad3BApFW31AeenqeHYvXjFM4CCZeL9AbBeMTrfD2JDWtRVdHDbSZo=@vger.kernel.org, AJvYcCWZcCaLj9VqLVRTr4tEkMvAy7F/e2maty7MBpKK2ndW0glX44KeYyTcX+3f/fZL/DiUt9M52A+0eOxZSYVDjcBfkNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKtrDnpmmuWmNiDT2YnhOC5IL0fA7Wd1J1odrAaUyvxN3hOcxq
	KRj7eG9BwX/9sgt37dmHE1oqzInpzSx/BTkreWCcO4etkNkRFsK3cqVDxMho
X-Gm-Gg: ASbGncubPEG9zT5NMawO7Yvab4RVVYHGSECZhOizoA8D5mLaHbzuwWQLt2a3kuy1+jm
	UxardHCfzLgqQCUbMViUNyfOhZB/uLg2MP1Vk/36kp8lF0cLRVFlJZbVGbxGT90GJD7mRLTRlTP
	1K++cpgbCGZHSM3vF3iZNK1KdVb0TS+B9ckvfBd+RxAYbd7bYkMPYRL2/loQeWxuseiitNPosK+
	E4Gnw2MKJdzyDdUm3AuqDmToDrhoBJ+G3aFqTwKCxu6fX4jEajwSgG7vMCpIpX7NoVkXOx1ONy5
	XQTjTE+e0UjRnZjcXXc=
X-Google-Smtp-Source: AGHT+IFHwifhC62JrFmSqklE7cKfq9jtKyjl3AajaATJMOc8IAcm+CMbIWXlY14YiBuRi6AeTgTrgQ==
X-Received: by 2002:a05:6102:418a:b0:4b0:2d7c:43ca with SMTP id ada2fe7eead31-4b2cc45527cmr21765142137.18.1735306283473;
        Fri, 27 Dec 2024 05:31:23 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm2940679137.3.2024.12.27.05.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 05:31:23 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso4784623137.0;
        Fri, 27 Dec 2024 05:31:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVyBWFIxUBuqtV4vA6ROxblc6GHcUI3DIzfZ1TB5qGBzv5nuuMiJwEAmejnw0nKgghLDPqCPCRYgrrK@vger.kernel.org, AJvYcCWFkwnUzsCig7/mTc0gUIno5W9UUpOYrRtotBaPv/uBKul/xCfHKx2xmnb6B2QC0wZeTrobY7wrjvLNbfaaQaK5yIE=@vger.kernel.org, AJvYcCXaQy129s9cUF/wHaU1Z7eetOdaeQnbsHdLTouQnOi8dFzbxbB5r8LeTf4xRB4DQoN44Wkd0FfWbiKE3P0=@vger.kernel.org
X-Received: by 2002:a05:6102:5689:b0:4af:b94a:3c3e with SMTP id
 ada2fe7eead31-4b2cc322226mr20735446137.5.1735306282732; Fri, 27 Dec 2024
 05:31:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se> <20241121134108.2029925-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20241121134108.2029925-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Dec 2024 14:31:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwqb7vhUeoMKDDJO5dp-V3LmnURZLSC1_ko=YL=cNyUA@mail.gmail.com>
Message-ID: <CAMuHMdXwqb7vhUeoMKDDJO5dp-V3LmnURZLSC1_ko=YL=cNyUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, Nov 21, 2024 at 2:41=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Extend the fwnode parsing to validate and fill in the CSI-2 C-PHY
> line-orders order properties as defined in MIPI Discovery and
> Configuration (DisCo) Specification for Imaging.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Use array instead of switch to get printable line order string for
>   debug output.
> - Wrap lines harder for 80 chars instead of 100, but keep string formats
>   on same line even if they break the 80 chars.

Thanks for your patch, which is now commit 573b4adddbd22baf
("media: v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders") in
media/master.

> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -250,6 +261,36 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struc=
t fwnode_handle *fwnode,
>                 } else {
>                         pr_debug("no lane polarities defined, assuming no=
t inverted\n");
>                 }
> +
> +               if (have_line_orders) {
> +                       fwnode_property_read_u32_array(fwnode,
> +                                                      "line-orders", arr=
ay,
> +                                                      num_data_lanes);
> +
> +                       for (i =3D 0; i < num_data_lanes; i++) {
> +                               static const char * const orders[] =3D {
> +                                       "ABC", "ACB", "BAC", "BCA", "CAB"=
, "CBA"
> +                               };
> +
> +                               if (array[i] > 5) {
> +                                       pr_warn("lane %u invalid line-ord=
er assuming ABC (got %u)\n",
> +                                               i, array[i]);
> +                                       bus->line_orders[i] =3D
> +                                               V4L2_MBUS_CSI2_CPHY_LINE_=
ORDER_ABC;
> +                                       continue;
> +                               }
> +
> +                               bus->line_orders[i] =3D array[i];

This does not do any translation (unlike v4l2_fwnode_bus_type_to_mbus()
to translate from MEDIA_BUS_TYPE_* to V4L2_MBUS_* definitions) ...

> +                               pr_debug("lane %u line order %s", i,
> +                                        orders[array[i]]);
> +                       }
> +               } else {
> +                       for (i =3D 0; i < num_data_lanes; i++)
> +                               bus->line_orders[i] =3D
> +                                       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_AB=
C;
> +
> +                       pr_debug("no line orders defined, assuming ABC\n"=
);
> +               }
>         }
>
>         return 0;
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.=
h
> index 5bce6e423e94..e7f019f68c8d 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -73,6 +73,24 @@
>
>  #define V4L2_MBUS_CSI2_MAX_DATA_LANES          8
>
> +/**
> + * enum v4l2_mbus_csi2_cphy_line_orders_type - CSI-2 C-PHY line order
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC: C-PHY line order ABC (default)
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB: C-PHY line order ACB
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC: C-PHY line order BAC
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA: C-PHY line order BCA
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB: C-PHY line order CAB
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA: C-PHY line order CBA
> + */
> +enum v4l2_mbus_csi2_cphy_line_orders_type {
> +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC,
> +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB,
> +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC,
> +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA,
> +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB,
> +       V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA,
> +};

... hence these values must be identical to the corresponding
MEDIA_BUS_CSI2_CPHY_LINE_ORDER_* in
include/dt-bindings/media/video-interfaces.h.
So please provide a safe-guard to make sure they do not become out
of sync.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

