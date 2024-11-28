Return-Path: <linux-media+bounces-22238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3A9DBB5D
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 17:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CF63B22054
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAB31BD9FB;
	Thu, 28 Nov 2024 16:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFpom9XM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C68C3232
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732811957; cv=none; b=ZylJzrc8Bh2p2jvPabmuBomVCialOH4sI1aDVQOy+cYw+vEOUmudnx/u604KZ8TxM55aJQrT8//WDb1PZ439Bl2oZAS1xe1OHNqHN60I+AmgOtXbGiTKmsblmqVbSR8pqeCd0x4VBK4XhevhLjq+giENz6ajZaVUvLeS96VNTaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732811957; c=relaxed/simple;
	bh=IAv5wrB/jotDQK/b1bDAxb2GnPsufvBPXc7oowgpu3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhm9pOTjsBvP1c9+w8B0ErKCOsTtevVZ0ZG1bmP+sqVIbGKqaTP8nL/pUUO41/LJzxMjTeTM5rRwPgcRK78vyoTjt74X5dGW2Nzh8R2EoQvoqFzXkNIMype3/YneJi9spTPJ16Lyq6VAp3H/NbEb5aSZm35oKrM9RjCBY1U/Quw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFpom9XM; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4af38d1a28fso215035137.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 08:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732811955; x=1733416755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=091Z7pML7EhVg2r3ViZMCCYJpHsP1VDPiQtUCfVKz1U=;
        b=ZFpom9XMRhKnbnp/o8bbFp+HYWN0iVzWED9b0SUJ/pIwmFSviVfmuH0iE3E9t3tUb8
         6nuVwZdEyCbMlebdk6wwDMolQ26ONyY4znm1iTjk07TSD6uWxRkmNobRc38O/ZHkUwQX
         +6MZXpUdi4Br7vgpGt61yMqFMotPJ+Z0JaF6AirWKztWtf7YetDMvftjgRExHTgOgsl9
         XjJRyGrp8ouo3txHAi2l3IMzrX/SYABzJLAoSj8a0y24HfgqVBNzjOo4QMNvVga6J2Ag
         qxDW5IAbhTpTN+5Go0P/sVhKkNQjPV8PcrYLC8Kg1ehk9zW+j0MS3YrwZmgWMOcsMcVO
         AUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732811955; x=1733416755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=091Z7pML7EhVg2r3ViZMCCYJpHsP1VDPiQtUCfVKz1U=;
        b=GlNQB9SaErMY4DgGIdx+c0onEUuVKSCtmum5xD8IhBFpmaykoE4GidDvW/B5I9iaKv
         1Z5qexQCiWbHv4bghDpNopoP+h0n715114fV72gzFIe/KIq/24t8F6IXQO0A/Dy84dAu
         sJ+5Vg3FJqfGY8W/EJW0gATEeWD/dxRHTo9Xt2gfq0DTp6ynS8sLc5wKT5z7euiD6KEO
         q6bjJXpyXFlwwHuQX2bc27kun6HXI3ohbcKk3/laj7qzAPzQSpDHTuEJExsZKyeLoDQk
         Xdcny6PDMNFFFdRwQro/sTfedfvU5n7MRFsQspfKgN9vUujg8kXzA1A6va1kIdFCK4q/
         54Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXcjOJm5FrrH9ZYviXj+HEueX7ADIBC1keHp/xBlKpiJJjC0z7S5s9nZ6mock7E53YLWR86sEBMvk32YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw393Eh4ycHv4YXssMQMWc0d8VjJyaT914aCggKhysIomH/E2iu
	AlEs6PYhfRhpsAVo2CNy2IEiD8Jst/Um2EyAwuKuV7w+HMFf4sRFXssH2RyXiVmjLKQXFIg7Dnk
	DkWY9JjywFxUL1e6h6N1LRjW6Jwk=
X-Gm-Gg: ASbGncsGqiCfO+kDfFox0P9avYsRaOl3V1PnTpNkpAQTz8ehnUgr/1OphfBCG+ATRNz
	6FxBRptoX/YFFkWBCK+DLamB9qt47Xw==
X-Google-Smtp-Source: AGHT+IG5/SyUUWwN+Z9Ozs5KxLG7zU9CxhWJ250fNp1vx4TCMpRWgiiYVp5FXYBL6ccwL71+f16v05rgIqHyD/pacm8=
X-Received: by 2002:a05:6122:787:b0:514:f579:3b8b with SMTP id
 71dfb90a1353d-515569d1e4amr9857522e0c.9.1732811954843; Thu, 28 Nov 2024
 08:39:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128152338.4583-1-hdegoede@redhat.com> <20241128152338.4583-2-hdegoede@redhat.com>
In-Reply-To: <20241128152338.4583-2-hdegoede@redhat.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 28 Nov 2024 17:38:58 +0100
Message-ID: <CAPybu_254vEO4u-3kxz-hi=mDaMj_WVGRqZJgy9gdHQZT++pxA@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: ov2740: Debug log chip ID
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 4:23=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Calling the identify function may get delayed till the first stream-on,
> add a dev_dbg() to it so that we know when it has run. This is useful
> to debug bring-up problems related to regulators / clks / GPIOs.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/ov2740.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 387c529d9736..e7a611967b40 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -644,6 +644,8 @@ static int ov2740_identify_module(struct ov2740 *ov27=
40)
>                 return -ENXIO;
>         }
>
> +       dev_dbg(&client->dev, "chip id: %x\n", val);
> +
nit: I would have written 0x%x instead, but the previous lines there
is %x !=3D %x..
So up to you :)

>         ov2740->identified =3D true;
>
>         return 0;
> --
> 2.47.0
>
>


--=20
Ricardo Ribalda

