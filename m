Return-Path: <linux-media+bounces-16988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F57962153
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 09:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 786B51C20910
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 07:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1739F167DBD;
	Wed, 28 Aug 2024 07:35:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1C15B137;
	Wed, 28 Aug 2024 07:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830504; cv=none; b=FHaTZ4jbL1I0HjjXuwaNixODxwfjyu0NOkK3Q7d0BFSmUdFRIuEqvkNXgOzvSvK3II3AiYFla5gTgDo6qcVraBdtCMPqYK/P5nHyjVJasPTDHfOmdQV7P1p1/Mxdm6RVCUGiTmvJXbNtnLUbPepMl19sid1bWyLoglXS+W1fTYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830504; c=relaxed/simple;
	bh=kZEASA7u7JhyrnkctJsiJR3+P5gpJr9CIQVdlLdvXGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxrGkbCo8445xWUgyfpddAo39mCH/H2wALbmh56GQdGqeF1tf1boOBRKeCiz4AWwBTx3Nzh/TbRDQ8D5OykXMWsEIATQUmIC4g8EApMlzCV07M9g0y/MfFHojYLxi1Y7JgJ2yIMq7sCkv5X4ELoioc/JWmh/i2z4KthyH+1pA+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e164caa76e4so5970334276.1;
        Wed, 28 Aug 2024 00:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724830502; x=1725435302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIkqaTkKDr6dJ1uPxytgy0rq0Wj8S2QYIeln4D2EKV8=;
        b=iv9DKeWqMAf9Z3m2KbE+4He874qNp5/l3U5PI5TZlaXIQsfVUDBoQY71hQCfD9mcgo
         cBtRaoP54C7L8xEl2B1c/4Pz+ZfsqkQProvWIFnlBvwIF+qK8LVzkWyP42qU9uwmfTEM
         3+m5xrW+3p2m0MXuRBqON5HjzdI/sqPGMl5b3goby5OaMgNhN9xSrrmdxXlquP8J97o8
         9B27VNj+O7f6QjowbFpJOg7NbUhnx7UphNHAAQaKKRvPLTS0h1yE+mGRFioEWo5lxbuW
         uC3nCl1nNIltK8tgYuQHC6njlU6SCC0jFXhYaWyjJ+1wSUJXs7ZQI45bHzHQpyUuBrO/
         pYWw==
X-Forwarded-Encrypted: i=1; AJvYcCWA1/y/u4fBh1wG9jwlRuIgHKhkfGFhWFZ4UutZksdB4RSmixleq8IeHNJxZQ1H9cbEnYNGWJak6Cv3rEELP7l96+0=@vger.kernel.org, AJvYcCXUbj7I5zPpy/j+Hmv7j4e1ZTV+JJbwudG+6YFPFDOPNz2YiJXElucOzxJTbtRmPAwbczeNgTVfsJ4T@vger.kernel.org, AJvYcCXW7J/OD1Xlux0LORCVb9VO5CfVQB83mo+VAzD0tyVLCV86KexXsbszpP9E2IyJ8k/fIyE3zahUbOyGEFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkiHzVvmFTI+C5smY1cx1dv2JdTMtHMGUjzs0lQr1IKjHFlvId
	0tERhH0YnyFnKfYiJsXcp16yNbm+7gYrhvrXiMZ2OWaqgOQ5uq3p106AneQc
X-Google-Smtp-Source: AGHT+IGscfBoeXgmfgyUYqLj3qVU98ywR76vsrWjG8UG9onMpn6DTQWakrn3EV1txRYE7RrPAXd0pA==
X-Received: by 2002:a5b:cc5:0:b0:e16:4dc7:aacb with SMTP id 3f1490d57ef6-e17a83df0bbmr14218118276.23.1724830501649;
        Wed, 28 Aug 2024 00:35:01 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e67e66bsm2947361276.55.2024.08.28.00.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 00:35:01 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1161ee54f7so6902531276.2;
        Wed, 28 Aug 2024 00:35:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWH5xTin0er8GAXbqhxxnvjMmJ1xei2apy7g2Wfe2HfAxhTOQa9RaoKLpeYx5bKUB6K1oWCoP1bCSstcHY=@vger.kernel.org, AJvYcCWs5D/w6M3xbgA44iXTR3ImuVzR/ZOBl2VnSbIIrRM5mC6e74XFIgtIhsrKXpIYMWEetN+VhDsdY/Q2@vger.kernel.org, AJvYcCWuFa8QL+K4bpWpgrhuek18iuawhP1r2FDZNaTcxBlV5v84MyyZMThDHODUfxZh22SHN2a3gCi3YfylbrvozbtlWFk=@vger.kernel.org
X-Received: by 2002:a05:690c:ecb:b0:64b:2665:f92c with SMTP id
 00721157ae682-6c6248e8c82mr166046487b3.8.1724830501081; Wed, 28 Aug 2024
 00:35:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se> <20240826144352.3026980-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240826144352.3026980-5-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 09:34:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHSBQ28sLtSuh8G6hCnEL9JzT3a4rQQiyX+T1SHzgkew@mail.gmail.com>
Message-ID: <CAMuHMdUHSBQ28sLtSuh8G6hCnEL9JzT3a4rQQiyX+T1SHzgkew@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] media: rcar-isp: Add family compatible for R-Car
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

On Mon, Aug 26, 2024 at 4:44=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the Gen4 family compatible. This will be used instead of a SoC
> specific compatible for the new Gen4 SoC V4M. Two Gen4 boards (V3U and
> V4H) have already been added prior and their bindings need to be kept
> for backward compatibility.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Reworked to add a family compatible instead of V4M specific one.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/media/platform/renesas/rcar-isp.c
> +++ b/drivers/media/platform/renesas/rcar-isp.c
> @@ -429,8 +429,11 @@ static int risp_probe_resources(struct rcar_isp *isp=
,
>  }
>
>  static const struct of_device_id risp_of_id_table[] =3D {
> +       /* Keep to be compatible with old DTS files. */
>         { .compatible =3D "renesas,r8a779a0-isp" },
> +       /* Keep to be compatible with old DTS files. */
>         { .compatible =3D "renesas,r8a779g0-isp" },

Nit: perhaps a single comment "/* Keep above for compatibility with
old DTB files */" here?

> +       { .compatible =3D "renesas,rcar-gen4-isp" },
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, risp_of_id_table);

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

