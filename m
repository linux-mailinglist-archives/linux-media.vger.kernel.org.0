Return-Path: <linux-media+bounces-13871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 608709112C4
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 22:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4B0FB222EB
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 20:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FD71BB686;
	Thu, 20 Jun 2024 20:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UH8XucYk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9801BA874;
	Thu, 20 Jun 2024 20:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718914119; cv=none; b=VCJw715EPCajB14/WAqvekHQqjvcHbu+Lo57dQ7IDeN92TvuQOpWWeG5BKW8h86hEF/xqfWqv83bz1I1DkdYAyAYAAlcFb4BJmWKwe2XOYkZqXS/mpucRlCdsPI5GUqDjAG/lAjlbNFA23rpgSw6m93CPSAONogsu3RhsNUqPbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718914119; c=relaxed/simple;
	bh=3lFcLfm0AXh/GpDAuB72jfcFxamS8yezaiqncasAuvY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UxvzEXeiSaDZTTCk8xvSacC/TTTt/GDC1yic1zLV/JbNp2V0nni0RJRgi/ZieIna5QVMPMLp0KH/y6sBY3mKkWpIDYPAk9g7c2gq6Y+hDjYRvGfFWG6AIWX8ggKXgkrnS8+V7VmJzTWlA7vHHt35E2I9Xi6eqIMx+/vK93/4VEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UH8XucYk; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7009b8113ebso111767a34.1;
        Thu, 20 Jun 2024 13:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718914117; x=1719518917; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hSJkwRLLXg+/HweJ717ffkym6nyoKfy9FEsPaDbpL/o=;
        b=UH8XucYkfUUStV9s2fJdT+pQSTZPMCakg3X3TVnK3iD5QyQMa9umTJllsF1tLmi2r0
         rym7OXGdPwKxM7dOW/ngv9AMMHQJHvkrGZ5FL+fX+BMOMj1/0zGrzhr7Eft5yMt+RFht
         K3qLLeTxYLJg1GG8lNy6cvGBT7Y4U/l34QfcYWCxN/91iCHi6j2MMrYa50VSXHWGFt1c
         5gBBEvUgcVT+0c/bX+GwOxPJOOwBfwBZ/ErHpEmlcuUF+yLzVJJ2RwVpzMy09svmSNc9
         wRiLscvFVr+T7oB815YW/8e9mKMf9IOU6On6Rrh4BRMEUuxzCpVLTM6rf4bE/LQ1XIQs
         m/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718914117; x=1719518917;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hSJkwRLLXg+/HweJ717ffkym6nyoKfy9FEsPaDbpL/o=;
        b=pYX5SIF/T2vDWIQEF4vftnBJYC/8amKkakDuFaf1du6sCupp0sVh9Deus3JKoOCUkV
         3BM7vX+GhDwsKv7LU02Ds6mreBAI7whEYsde9TrcFfQYaAVR0yTvW/Qod5KwzWxxwKAE
         uaB5y98WZLZT8OLNFrdHgoJuYaN3zEu5d8UAfzBeVzgOije/4qBeZ6Re2qi/gvdDK7A9
         +4RqBvnATh4pheOzf9PL5342dJXDRCTSjNx97pLFWaaWQpkzhC0OnD9o7Ji6ekQgMnhK
         U4QP7rgJokMd72rzUWYpX8kEoefIsk7p/5Ngu+sp1YYc8nuCT/3SOnPXee2qpPzUbY+O
         Ku1A==
X-Forwarded-Encrypted: i=1; AJvYcCUe9+wF4CEfIJWuKVKkt7T+5XVjBPNfdFG8iQrOUiR3BwvvWMonFbAQxV/FYL+tfCdkdutj5abeY3oBjBZyKsRLFg/VI0x9d33KYrBg
X-Gm-Message-State: AOJu0YzU7uoLzjOZH0cXCkMhw2p8/OL4iUJmWpURis98FE/fRVXeqOv1
	cG0dYrlr/5NfxdfDrK12idaU0A65rl5c0AxJ4Yq6vSjygBn7XiyH
X-Google-Smtp-Source: AGHT+IHnngU3ZQakBlBJ5TB+6vWBs8aTudZ7SmnM7Sd2XLBetvpnshnjvmcJgVI8PVyZJmWGxYffww==
X-Received: by 2002:a9d:3e50:0:b0:700:6835:3993 with SMTP id 46e09a7af769-7007401b8d3mr6373837a34.19.1718914117028;
        Thu, 20 Jun 2024 13:08:37 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6d4e::580])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51ab947f4sm3967176d6.113.2024.06.20.13.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:08:36 -0700 (PDT)
Message-ID: <6a6e42f6980da2e76d25b2315b206457afe9043e.camel@gmail.com>
Subject: Re: [PATCH 1/1] media: verisilicon: Move rockchip hardware drivers
 to the corresponding option
From: Nicolas Dufresne <nicolas.dufresne@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Ezequiel Garcia
	 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 20 Jun 2024 16:08:35 -0400
In-Reply-To: <20240620063313.2309767-1-alexander.stein@ew.tq-group.com>
References: <20240620063313.2309767-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le jeudi 20 juin 2024 =C3=A0 08:33 +0200, Alexander Stein a =C3=A9crit=C2=
=A0:
> There is no need to compile the rockchip specific drivers if
> CONFIG_VIDEO_HANTRO_ROCKCHIP is not set.
> All driver functions are only referenced by rockchip_vpu_hw.c which is
> already under this option.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks, just like many bugfix, its nice to see backported, but this can hap=
pen
without Fixes tag. To make this more convenient, would you mind splitting t=
his
change in 2 parts:

> ---
>  drivers/media/platform/verisilicon/Makefile | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/=
platform/verisilicon/Makefile
> index eb38a1833b02..f6f019d04ff0 100644
> --- a/drivers/media/platform/verisilicon/Makefile
> +++ b/drivers/media/platform/verisilicon/Makefile
> @@ -14,13 +14,6 @@ hantro-vpu-y +=3D \
>  		hantro_g2.o \
>  		hantro_g2_hevc_dec.o \
>  		hantro_g2_vp9_dec.o \
> -		rockchip_vpu2_hw_jpeg_enc.o \
> -		rockchip_vpu2_hw_h264_dec.o \
> -		rockchip_vpu2_hw_mpeg2_dec.o \
> -		rockchip_vpu2_hw_vp8_dec.o \

This got merged in 5.3, so that would be patch 1/2, with:

Fixes: c9caebd57b3a ("media: hantro: merge Rockchip platform drivers")
Fixes: c07665f99386 ("media: hantro: Add H.264 support for Rockchip VDPU2")

The first Fixes is not fully accurate, but should do.

> -		rockchip_vpu981_hw_av1_dec.o \
> -		rockchip_av1_filmgrain.o \
> -		rockchip_av1_entropymode.o \

This got merged in 6.3, so that would be patch 2/2, with:

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Fixes: d8ebe59e7b36 ("media: verisilicon: Add film grain feature to AV1 dri=
ver")
Fixes: c0d0e579db4e ("media: verisilicon: Add AV1 entropy helpers")

With this minor change, you can also add:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
>  		hantro_jpeg.o \
>  		hantro_h264.o \
>  		hantro_hevc.o \
> @@ -35,6 +28,13 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_SAMA5D4) +=3D \
>  		sama5d4_vdec_hw.o
> =20
>  hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) +=3D \
> +		rockchip_vpu2_hw_jpeg_enc.o \
> +		rockchip_vpu2_hw_h264_dec.o \
> +		rockchip_vpu2_hw_mpeg2_dec.o \
> +		rockchip_vpu2_hw_vp8_dec.o \
> +		rockchip_vpu981_hw_av1_dec.o \
> +		rockchip_av1_filmgrain.o \
> +		rockchip_av1_entropymode.o \
>  		rockchip_vpu_hw.o
> =20
>  hantro-vpu-$(CONFIG_VIDEO_HANTRO_SUNXI) +=3D \


