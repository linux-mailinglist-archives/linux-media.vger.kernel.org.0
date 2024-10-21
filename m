Return-Path: <linux-media+bounces-19947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 949F39A59B8
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 07:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBBC41F21D77
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 05:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50664194AFE;
	Mon, 21 Oct 2024 05:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LGRiOfBg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C00282F4
	for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 05:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729489144; cv=none; b=s/nLhCjxIz8fwe5HXrEAifg+ziSKZ7hWxwW2pYRWR+4+v7mM5pkPYMpwgCyz4sAZiMhkj53hPvzHVbfvciJBBVOZn+Bnwf4YoadHDAZMP10GBhOWDMOOdgGuSJqtmGpxLVvnU4/GvGoz4BT3ao+n3l5jrSdpD+l6G7atXv0xDU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729489144; c=relaxed/simple;
	bh=f5+ggXlq6yLXkoBxQqpQzfX/xnlrafFn3SMvSsi5wwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7Psp45q9vNSZJldUuLQ0cFZM1CXzC//Ydv+1Jcp71K4vNc7a0FGyB8RitZ8THhQlk4UKqJex5qQymOFS8S0yySvxHOlwmxJn8quHa1TZ4cMrlIdZidkCb1iS1Cb0uOJ6T0HI7tzxxLysAcYz6heG2yy0Z1/dFYGy852vNBHtuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LGRiOfBg; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so28797941fa.1
        for <linux-media@vger.kernel.org>; Sun, 20 Oct 2024 22:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729489140; x=1730093940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9zNYRiu9uknolFzwLlq15Mi6j/Tjr3sPHN/TktoqH0=;
        b=LGRiOfBgvZ0IrtHNuV4aw5YTcEubha+JP6P4xMWgUvhTxDBYDQIyrc7QzrVo3pkB13
         V31qish3fDfFVGrB1yzeawG/V+PxePQLXCtWbDn5nb6OgcsbeUCy8laDvCKNtyMFETJR
         7fbOS5mhYHEDtenk7baqKPwCKUns7OSv5bp/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729489140; x=1730093940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9zNYRiu9uknolFzwLlq15Mi6j/Tjr3sPHN/TktoqH0=;
        b=G5NIQw0e8zrd/RA6wC0NsKZ2cBIiScJFMoptjCU1cGSWek8IoEhne5R6M+bEf34bxZ
         /zNHeoSvGFF6v1yFcK/E+I8bm6GzrGpNt5Hw1D0lQzXnj26cjXitHGHqvOOI3STo9cLe
         2WJX6qfp8gEEhfnKrPSR8rbNTxh736VXRN15hLVia1KMmdUROHcBekOnWmoUbx/R9Qja
         fgjDrbjRBq5x7R7dvgnimAiy7/qCU8FgaUCZNfEpJi/q16x0I6uXdsSVIvj60dTyRZls
         mqr6u2P2oCIAYmI02GWFubfiJlWiQmkbCemGuCyTHIDZexNkjEeOB3hE1s5Larwl7A+w
         nzIg==
X-Forwarded-Encrypted: i=1; AJvYcCUdRlsjN2VcOoCFL14O3GGM/9F8/F7x9qJSxQpyeBFUrSnmSeZ0rxcdJGuV/s0fSsCS4O6EAi7Qt8Cntw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNxJo/iDYmZfI2mLpD3y8QbgTcYsdBqQaQ7vHPSdpvAk+redCM
	JI2A0PUz4RsolWeVv8ZLNgOdy16xqCSzC6YaRXPeuDG1xvSJpTP4LiCowJFnxK9vQoZ6L6Uap38
	=
X-Google-Smtp-Source: AGHT+IFZ01bRT5ucRo2owJyELGSWcIQGWa5zonmTcG9m38u8z7l3NRE8XDlKVngcEA5OopvqYCw0ww==
X-Received: by 2002:a05:6512:1598:b0:539:f886:31d6 with SMTP id 2adb3069b0e04-53a1520bd09mr4284479e87.2.1729489139287;
        Sun, 20 Oct 2024 22:38:59 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223f0089sm391251e87.112.2024.10.20.22.38.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 22:38:57 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539d9fffea1so3838203e87.2
        for <linux-media@vger.kernel.org>; Sun, 20 Oct 2024 22:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUglnghAn2TrhuZZYrimMKUru0BZQ+yUHp3ENsZyO+bBcWQvouo1huFS3RM+RA3XgYDNzCfpKRfylpvpg==@vger.kernel.org
X-Received: by 2002:a05:6512:1315:b0:52e:76d5:9504 with SMTP id
 2adb3069b0e04-53a1520bd38mr5443903e87.3.1729489135981; Sun, 20 Oct 2024
 22:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018152127.3958436-1-arnd@kernel.org>
In-Reply-To: <20241018152127.3958436-1-arnd@kernel.org>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 21 Oct 2024 14:38:42 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXgv1sHy+F1psxiN0wu0ryg5shX_u7orzgLz9+-hU59jA@mail.gmail.com>
Message-ID: <CAPBb6MXgv1sHy+F1psxiN0wu0ryg5shX_u7orzgLz9+-hU59jA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nathan Chancellor <nathan@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Fei Shao <fshao@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2024 at 12:21=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> This is one of three clang warnings about incompatible enum types
> in a conditional expression:
>
> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29=
: error: conditional expression between different enumeration types ('enum =
scp_ipi_id' and 'enum ipi_id') [-Werror,-Wenum-compare-conditional]
>   597 |         inst->vpu_inst.id =3D is_ext ? SCP_IPI_VENC_H264 : IPI_VE=
NC_H264;
>       |                                    ^ ~~~~~~~~~~~~~~~~~   ~~~~~~~~=
~~~~~
>
> The code is correct, so just rework it to avoid the warning.
>
> Fixes: 0dc4b3286125 ("media: mtk-vcodec: venc: support SCP firmware")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Alexandre Courbot <acourbot@google.com>

> ---
>  .../platform/mediatek/vcodec/encoder/venc/venc_h264_if.c    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h26=
4_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> index f8145998fcaf..8522f71fc901 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> @@ -594,7 +594,11 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *=
ctx)
>
>         inst->ctx =3D ctx;
>         inst->vpu_inst.ctx =3D ctx;
> -       inst->vpu_inst.id =3D is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> +       if (is_ext)
> +               inst->vpu_inst.id =3D SCP_IPI_VENC_H264;
> +       else
> +               inst->vpu_inst.id =3D IPI_VENC_H264;
> +
>         inst->hw_base =3D mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_bas=
e, VENC_SYS);
>
>         ret =3D vpu_enc_init(&inst->vpu_inst);
> --
> 2.39.5
>

