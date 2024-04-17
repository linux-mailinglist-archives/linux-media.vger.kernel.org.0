Return-Path: <linux-media+bounces-9671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 094308A84CC
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 15:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D7611F21478
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCF513F42D;
	Wed, 17 Apr 2024 13:35:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367CF13E8A5;
	Wed, 17 Apr 2024 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713360903; cv=none; b=gwZPrj2se5DeEqAZqQT3Cl+JphH/ZgZ9Q8D96odT/+ictvsnSq2byLJe/5B2a3x4FiAWQ8CoFxo8F8cN5bYmyubbbHCPGMwVdkg+WYmjEqw9QaxZDzpGbjJ2lh1a2TK+A0Tszcgl5bCSN8FAWxaSqTXshjAUsuzCjCSFStMgcG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713360903; c=relaxed/simple;
	bh=/d/vgfY9ZqhlkTu9z/z2w3nshzsdM3jdTkH8ww8CBjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBPlXs9CrOLFRpOjbvReQorhOnsvBvtCOwhWa4YhBCzFk65vCxRXB8wgIGYN9VbuZJ99qHxTS6DFZHoNVRVdSMPFKkg5ZcMTjwKP2CbUE4wzrnxiK4+247L30ptb7pcxUf5SGTRTFHoJ17+080ynWOnFwcydmDMoBUNcRhr4JUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so9581811fa.2;
        Wed, 17 Apr 2024 06:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713360897; x=1713965697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYLOtqLakuRU/KOeT+MfgISLGTBZ5ALu0eybD1xQB5U=;
        b=DbrBjbwS0OL+AZXoYBDGyVuA3Qfa/ZYKpWBCZNo/zF/WTXD1UecfcoX2L9UlWlLnG6
         1Db6IL/764z2o5huSkSxwZ+YZGDpLcpIBAamLU7mK2cpGxni588XHZknDL0aMc/F5QiL
         YuOHD8HyXKbjFON5gtSnGAS5qH6jo+zTXjrl42MU/YZe0wQT5ex0qb8YwZzrMKTNBw3Z
         etElxbPtAIyhcHRYzipXxLcIYWAEewmvvo0J1DYbFxSfnOHraS8Fg+Th21UEvizFbHMw
         HHnHPA4tmM7fVGXig02FgWa8tRt1FxIN1VKOYYyL/tbslvnA2Kmthyq32dXjil59L+q5
         jXuw==
X-Forwarded-Encrypted: i=1; AJvYcCWENOdAqaecSQj/wRY+aKD1VMNY/T2OyIQHvtD9h36ih5zbeGbBtNXTdA9Udc7D9SzrFaE1dil4aVrptNXNOx4VaTKWxsVSZj0/jFtLcOuNB1rPpAAFUqZDHPzy38TpsEUUok9Wa+B6BLV+zUfhJQ==
X-Gm-Message-State: AOJu0YwVPnwatAepfHfh6wm35KnSMDMIBLv/9IhkeCGcyDi7/3uWxmDh
	rnRRJZKRSOZ5UTJhlRdGgDirV7uxuX9hf/cpMJrLWYoa6XvqFsh4waa5ih8JTBg=
X-Google-Smtp-Source: AGHT+IHd2fazgLdqzj7Y+qbuMw7klimxYFtfqtuYU9B6GyVjQfdqOf1xbj6LNGMUvRkID8P3mvTNHg==
X-Received: by 2002:a2e:9c93:0:b0:2d6:fa7a:a670 with SMTP id x19-20020a2e9c93000000b002d6fa7aa670mr12343496lji.33.1713360897291;
        Wed, 17 Apr 2024 06:34:57 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id b43-20020a05651c0b2b00b002d82bbf7862sm1881622ljr.25.2024.04.17.06.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 06:34:56 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2db13ca0363so14370681fa.3;
        Wed, 17 Apr 2024 06:34:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwNpqk6Rs6ILksKGKg/0ourqoKFjCR+9nOJAP7+Q7wR7xLqnND/OVpHzNBig+uMHJr0u7mFFYA2Cq4SaPSC5wLSmHn1ZfnWYE2hnRX3Mf0oFJ7kbjus/a1ILYW2fecqAoMK/v0TM/8PpBePh79VQ==
X-Received: by 2002:a2e:7310:0:b0:2d3:8c1f:c0ff with SMTP id
 o16-20020a2e7310000000b002d38c1fc0ffmr12644848ljc.16.1713360891351; Wed, 17
 Apr 2024 06:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417120230.4086364-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240417120230.4086364-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Apr 2024 15:34:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxxzn2t2qURChY=62GmDPKbQku63uRCCg=CDRCeOwJTw@mail.gmail.com>
Message-ID: <CAMuHMdWxxzn2t2qURChY=62GmDPKbQku63uRCCg=CDRCeOwJTw@mail.gmail.com>
Subject: Re: [PATCH] media: rcar-vin: Add support for RAW10
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, Apr 17, 2024 at 2:06=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Some R-Car SoCs are capable of capturing RAW10. Add support for it
> using the V4L2_PIX_FMT_Y10 pixel format, which I think is the correct
> format to express RAW10 unpacked to users.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

I am no VIN or V4L2 expert, but the register bits LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -780,6 +782,9 @@ static int rvin_setup(struct rvin_dev *vin)
>         case MEDIA_BUS_FMT_Y8_1X8:
>                 vnmc |=3D VNMC_INF_RAW8;
>                 break;
> +       case MEDIA_BUS_FMT_Y10_1X10:
> +               vnmc |=3D VNMC_INF_RGB666;

The actual meaning of this bit is not uniform across all SoCs.
On R-Car V3U it means (partial) 16 bpp, on R-Car Gen3 it means 18 bpp.

> +               break;
>         default:
>                 break;
>         }

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

