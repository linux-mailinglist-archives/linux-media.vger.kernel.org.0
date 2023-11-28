Return-Path: <linux-media+bounces-1264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE77FB7C2
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A4CC1C2140A
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1664F1F1;
	Tue, 28 Nov 2023 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB1F4206;
	Tue, 28 Nov 2023 02:27:38 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-db46725a531so3645418276.1;
        Tue, 28 Nov 2023 02:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701167258; x=1701772058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIGiIpNbEORiCIc0PSFrQIjsLdpdQ8g7U1Sz9jJiMDw=;
        b=ipO5H6zzwHuB5xA0xl/7fCuPiMMX0FpOeDQrdTh9oXJltlRAAW68tN3r1mdnhhkweL
         iJDo2X+ks7d90GlM5hEoTUoXqBr197HkwED1e4UT2RbPIwQ81DsLJTzvieK9LXUvxD3K
         GCX7Th8SpP5XbzuXcod668vMrt9blzlGQvc7int8yLy8cICTk1/X66qd608OtZeGvRWu
         IPAADWD0lG/dLN0bxCs29ARur1cnxjmc6AqT3qVQTqlAKXmAvKKGIa+RXlDxClCmalI5
         d9ozg4H5VuIg3a8GtnZbDg3isTNhQOUx4yDFd9TOYBKaytP0qKZ3nQOi6ax9Puccs2YD
         uSvQ==
X-Gm-Message-State: AOJu0YyoGiMZzfxHp6XVtgCl9Ru8z/mDW4lOgKnbaulMuawo9gf+zpLg
	xXZAlugnnJi03petEQpfOSjglGMtZjMJJw==
X-Google-Smtp-Source: AGHT+IHitO328tOb5Z8DDIlC/7Z8HQLMdYblfo5O4pGuk//acpQhJzo56XOKqbDoZbkUr9YJVJ72zQ==
X-Received: by 2002:a25:ca54:0:b0:d9a:b67f:94e3 with SMTP id a81-20020a25ca54000000b00d9ab67f94e3mr14230365ybg.52.1701167257842;
        Tue, 28 Nov 2023 02:27:37 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id y16-20020a258610000000b00d9c7bf8f32fsm3449771ybk.42.2023.11.28.02.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 02:27:36 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5ce8eff71e1so34781397b3.0;
        Tue, 28 Nov 2023 02:27:36 -0800 (PST)
X-Received: by 2002:a05:690c:fcb:b0:5cf:b2cc:cf5d with SMTP id
 dg11-20020a05690c0fcb00b005cfb2cccf5dmr8410244ywb.5.1701167256195; Tue, 28
 Nov 2023 02:27:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231108-wave5-v14-rebased-v14-0-0b4af1258656@collabora.com> <20231108-wave5-v14-rebased-v14-6-0b4af1258656@collabora.com>
In-Reply-To: <20231108-wave5-v14-rebased-v14-6-0b4af1258656@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Nov 2023 11:27:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYOq=q1j=d+Eac28hthOUAaNUkuvxmRu-mUN1pLKq69g@mail.gmail.com>
Message-ID: <CAMuHMdUYOq=q1j=d+Eac28hthOUAaNUkuvxmRu-mUN1pLKq69g@mail.gmail.com>
Subject: Re: [PATCH v14 6/8] dt-bindings: media: wave5: add yaml devicetree bindings
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Ivan Bornyakov <brnkv.i1@gmail.com>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, devicetree@vger.kernel.org, 
	Robert Beckett <bob.beckett@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Nishanth Menon <nm@ti.com>, "R, Vignesh" <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

CC TI K3

On Wed, Nov 8, 2023 at 8:29=E2=80=AFPM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
> From: Robert Beckett <bob.beckett@collabora.com>
>
> Add bindings for the wave5 chips&media codec driver
>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Thanks for your patch, which is now commit de4b9f7e371a5384
("dt-bindings: media: wave5: add yaml devicetree bindings")
in media/master.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Chips&Media Wave 5 Series multi-standard codec IP
> +
> +maintainers:
> +  - Nas Chung <nas.chung@chipsnmedia.com>
> +  - Jackson Lee <jackson.lee@chipsnmedia.com>
> +
> +description:
> +  The Chips&Media WAVE codec IP is a multi format video encoder/decoder
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - ti,k3-j721s2-wave521c

This is the only compatible value defined which contains both "k3"
and "j72*".  I assume the "k3-" part should be dropped?

> +      - const: cnm,wave521c
> +

This also applies to the driver added in commit 9707a6254a8a6b97
("media: chips-media: wave5: Add the v4l2 layer") in media/master.

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

