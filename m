Return-Path: <linux-media+bounces-14508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224091F097
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7D761F22871
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 07:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5EA14C5A4;
	Tue,  2 Jul 2024 07:57:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86FE149DF0;
	Tue,  2 Jul 2024 07:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719907039; cv=none; b=gQ96zwlHtellSjwCc7NCFu3gIeVA5r/nOZv/8TYl/Q5y12vp8vvgWevmdHCrdiOBtLGCh7VK2lS/+ZQnrMqx84tTwKOD0Kwk8X3vIWw8ONIcG8q6rr27I78SZTl0sugykZK5rjO5nGLv80pdAACqRgjHls3Gfbi+5GtxkOVDm6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719907039; c=relaxed/simple;
	bh=27iXrEKEKWAPqstSMKJ4vPewg2a3h34buxWlxD/Oqd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oF7K9PvR0oNVR7HlihwxA5OlMqZd+taggzJLs/yrLQub0HmqZAZTgeXfC3NH5wl80bbCIa5JBMVGYGn6b60rmzwdbtAnuHheU1eZTZYnOVD1bJuSjHEATpMCVApt13A+xCNmTE0WJ/HzplEIPbkNsHP7lYnQw+j08fp0+faSNPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-64f4f96bbf9so11716107b3.2;
        Tue, 02 Jul 2024 00:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719907035; x=1720511835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGEBG6L48mO+AioJ/2wFTkd2PRjg+lecqhOnubSkR/I=;
        b=nrte+pQ0IBA1PiVgdy8N68S0659o7B/AA/NwhQKTDb2Wcjth3L8Odd2RGsvWypvXgp
         HC9I3aoOZ7VnRQOmNV1hoh5iP/F34EMoYU0vtRE9LFmhose0uXdTQM56e7t1sBMIVcDD
         Ttyz2fEkW4byMZRaKscNbqOkQBG4Dv9crqxXX+Ap4ukcKwEEHymRULCJlNA1fE3X+X2e
         fo0yGa5SK1s32YZubJEkuenShm2+3QrkkvaMLBbKgof0VvY4sT45czVi9b0Dbekl3Rpo
         BTIkHoevUmsBM52xtc4IrmzQ4voY48Dchbv5fnVwpLwXLjulf9qGIAzGmsEGoL+6yi9R
         v/ow==
X-Forwarded-Encrypted: i=1; AJvYcCVxvl8yXWQg5RcgcrY2UmYj6QFNxlnfJJYKbdlHpURHJr0Elp3sRsaRAh4gA2SB3XKP5S1ine4A5cPo+DEQGCMMeeGTqhYoKJg+tK+r9CnQRvFafrnuqQ40RZBUZQrkHSLDpmrp4hYit1OBiI4V8jc8XuJQjVja38OZUESgs+hijk7seH/Iy87+zjE=
X-Gm-Message-State: AOJu0Yw+gDyTPosWOho3x2ZRd7aerNxwd5Izzh4n3KUJwzqV6izHrViX
	hOtDx0yA3HhK0wtyxSRgLbWjNlKX5PTSRhpabukZH4yjukLuHjgzGswknbj3
X-Google-Smtp-Source: AGHT+IHVW2HlgalpuDpF6VfCuywTfPcvMQNBL8G94IS9rCiZI6y32Pu7a6ZuPIqnlZ9CIHu6guHlsQ==
X-Received: by 2002:a05:690c:6513:b0:64a:90fe:9108 with SMTP id 00721157ae682-64c72d47f40mr82347867b3.30.1719907035447;
        Tue, 02 Jul 2024 00:57:15 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9a8037d1sm16524537b3.66.2024.07.02.00.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 00:57:14 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-64b3655297aso33739977b3.1;
        Tue, 02 Jul 2024 00:57:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWq/WCa2q0e8I30mCeeJzVyyelQi5IQnSDRJbD3KOBuEc5/9t6VqKG/v/PFJ5X1kNuIzh7Dfwp7QindaeOCwAyThEwbqpaRQznBFCrmVKbAGwhsQ+hV40PPm0rCwebKJNX7KDusc2HTuwpf9jxFrUQwfZfBpT7adJNjV1qBUtpezVq1OgcvIIufxqw=
X-Received: by 2002:a05:690c:804:b0:64a:7d9b:934 with SMTP id
 00721157ae682-64c7277c728mr87321967b3.16.1719907034467; Tue, 02 Jul 2024
 00:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se> <20240624144108.1771189-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240624144108.1771189-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jul 2024 09:57:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVrzUqXJLg-1h+KRapoO_HOoFW=UCwhCXcmtxb06ZBoA@mail.gmail.com>
Message-ID: <CAMuHMdXVrzUqXJLg-1h+KRapoO_HOoFW=UCwhCXcmtxb06ZBoA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] media: rcar-vin: Add family compatible for R-Car
 Gen4 family
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thanks for your patch!

On Mon, Jun 24, 2024 at 4:43=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the Gen4 family compatible. This will be used instead of a SoC
> specific compatible for the new Gen4 SoC V4M being added. As the first
> Gen4 board V4H had already been added prior to the Gen4 family fallback
> was added this need to be keep for backward compatibility.
>
> While at it reduce the info structure bloat and reuse the Gen4 info
> structure for V3U (R8A779A0), which is the last Gen3 board but that had
> a completely new video capture design that is compatible with Gen4 VIN.

Despite the name, R-Car V3U was the first member of the R-Car Gen4 family, =
.

> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1274,16 +1274,7 @@ static const struct rvin_info rcar_info_r8a77995 =
=3D {
>         .scaler =3D rvin_scaler_gen3,
>  };
>
> -static const struct rvin_info rcar_info_r8a779a0 =3D {
> -       .model =3D RCAR_GEN3,
> -       .use_mc =3D true,
> -       .use_isp =3D true,
> -       .nv12 =3D true,
> -       .max_width =3D 4096,
> -       .max_height =3D 4096,
> -};
> -
> -static const struct rvin_info rcar_info_r8a779g0 =3D {
> +static const struct rvin_info rcar_info_gen4 =3D {
>         .model =3D RCAR_GEN3,
>         .use_mc =3D true,
>         .use_isp =3D true,
> @@ -1355,11 +1346,19 @@ static const struct of_device_id rvin_of_id_table=
[] =3D {
>         },
>         {
>                 .compatible =3D "renesas,vin-r8a779a0",
> -               .data =3D &rcar_info_r8a779a0,
> +               .data =3D &rcar_info_gen4,
>         },
>         {
> +               /*
> +                * Needed for compatibility with old DTS files as it was =
added
> +                * before the Gen4 family compatible.
> +                */

Iff this comment is retained, it should be moved up to cover both
the r8a779a0 and r8a779g0 entries.

>                 .compatible =3D "renesas,vin-r8a779g0",
> -               .data =3D &rcar_info_r8a779g0,
> +               .data =3D &rcar_info_gen4,
> +       },
> +       {
> +               .compatible =3D "renesas,rcar-gen4-vin",
> +               .data =3D &rcar_info_gen4,
>         },
>         { /* Sentinel */ },
>  };

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

