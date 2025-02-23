Return-Path: <linux-media+bounces-26747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B946CA411D9
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 22:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133C51890C62
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 21:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C183923F439;
	Sun, 23 Feb 2025 21:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bE5F2f0w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EDD1779AE;
	Sun, 23 Feb 2025 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740345220; cv=none; b=tXiQmJeJLu2yQeBL1Ab863AOvtQvpvpJlCCbX2xlO6moswZQQhJnhsDF1BlGF8wkgNOdSBQTouoTfS+ni3zoouJig8mH5s5MwwC5CzcR0TX0yh5yUCWt+U6GE/uS66w4EUEOHoILpgGAusi4vhYptaOgkGiF5ctr8yqjSk4rW1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740345220; c=relaxed/simple;
	bh=t2ax8UCJSHBbBrK6Bhi1jvtf9DO+eaUf94fq1tvpzwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDqFpYHZvNmIY+dO/SB6N+JhlhLPjQuYyuKotwjLCIsZPp7TfpPJQkGovg5OcCdbk9p8ulNzoX0QlIOvMelP6e2kRc67sVugE0Te7LPnJe5Hu2zjMPXc6OBGus/5VViIiFX9+HGTB0pl+0IROuMENDCzxNvMRr9gYNP1WTQcEI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bE5F2f0w; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-520a48f37b4so2122969e0c.2;
        Sun, 23 Feb 2025 13:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740345217; x=1740950017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iedaQHLBD4XXfzSGe7haPi2kZ1YTY82HI9Qk9Wdqtg=;
        b=bE5F2f0wyxCTrtDfjv5IWKljCOv6bcLdsNJqxMGCUv27yjioZthMGMpRYoT4jTN6au
         ZzIC79tz6fdhYvjquksprYmjahKtES1Bzb2IE36jCN3lSs6qVtjLBSf3CzWIVwFLhKvY
         e0Zl2/iPIf7UYesKArr6G7t6ezdDA8oerUyykECu8Yep3QpzYs7dsitye0YGgSPkhup1
         M0OELuiOEKzeycJMaOd+IBTuJDZB2GG+KSx68Acx5SYHRcGYdPBNS3Tlwg3U/V7tF4/3
         3+DjO3olLJ5WjhlSRPy8DoqLtnDGYy3u2Si+mRkouBHK8pMQEipLKfo/jEKb8PgfdBsG
         RYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740345217; x=1740950017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iedaQHLBD4XXfzSGe7haPi2kZ1YTY82HI9Qk9Wdqtg=;
        b=D4RQcb/HXvsZauReNTB7Se9iUbCHIFgSxB+2cahrqob4jRs4acCWMmLfeurV5ZCQuz
         TVuy083LujPlT0DjnxMfuRlO1J8x9N5r9iFZLM1QGAmdb0yqh7561UzfHf7NgB+OuEtt
         9pb8Qf2LzBoECNuzGjm82/Jb+vYubrQFYX6o+PD7gJgSf1MMr2JTvca5jQqZZLZwtSG0
         VAV+abfJnuj0+5Ryn9naSUdcXvkWCmZhgzTDAL+tKJrKgRXOhqtNNc7tNr0rirq6r2Ff
         ioqZNhEsZGpUB6PImBXkPFHovs6bI9kvNXrcWyfJWDAR3tGgAmDUXS5uKIwVhfhDp4lN
         yckA==
X-Forwarded-Encrypted: i=1; AJvYcCUcxdTPBKLsU7rPM436vdi1nGsAL81c8xJH7QaVtgLROxsIqhlbNWxwE7vq4NfUy9uM7kYahx5d6WXHTBdM@vger.kernel.org, AJvYcCVPaDAaPfYwIH0tFDVvjI+Rkpd4k385/PbOlQyUEG70BS+tU1ZN5ERlWSTJlWVInMDJLYnVRzMmgUkTL18Ut1JhQBI=@vger.kernel.org, AJvYcCW3V/QKUnrqjDTFpc7V3ItmRwScszYJF6vjvjAMPsFZN3HT090Gv3nZBJuDIwCsS9CAgSiMBH2RdqGR184=@vger.kernel.org, AJvYcCXU0PX3QhxJL5i8PV33EABJRD8wkFBVaPrE77SWNcyGoqjnl+MURkMmh52Wd1Cf8bJxKmTFl5Sy9atc@vger.kernel.org
X-Gm-Message-State: AOJu0YzwDAVQvd1CJn/hYbcf9YEkrry95QVs+PHgn5KYvZcytVXo+GKA
	nI7nDxiFDYNSsjDAhRbQsH7kpnnes9cwIq7ZlbaoyncgSWXokEiZwDqiMWPPHDp4bLMP/7/fxrh
	hFksWQejYbI45Wd73IUh8fY/FR+RfEX2eUf4=
X-Gm-Gg: ASbGncu19XWCNsOr3VhKop1eoTCoX5MjHapItJp5q+1pLJc5iXLkTDnlzJfohnOWT35
	TMhBoUs57dl2i6Tam56s8soadXczb8gHUoIyesoinalvcTOSPzpj4oc/aP4Lgefp5T7zJ/wAa4r
	gsKET7lGun8Gnt5hi/cvaxuTGjRsiEohRRfEE5Ow+f
X-Google-Smtp-Source: AGHT+IHB3Ce8MjRqHhtiwx5o5M0oXoOYpkGLBpVBucfsJhVjAe0Qw6N6cQ4oWtTgk9FhGO3nyP2c6oRdpNb7yoY8j1w=
X-Received: by 2002:a05:6122:6589:b0:520:64ea:c474 with SMTP id
 71dfb90a1353d-521efbb5975mr5320566e0c.5.1740345217540; Sun, 23 Feb 2025
 13:13:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com> <20250221155532.576759-6-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250221155532.576759-6-tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 23 Feb 2025 21:13:11 +0000
X-Gm-Features: AWEUYZmei4BJm6FCm1F9SVWWh34_vuw78FqYfU_WkHTsESS75iMW3IL44Ar9S5A
Message-ID: <CA+V-a8uxOuf-9_3TLhFkz0TxNk50fmieJcGOCyxOFY3Mzedy2g@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 4:05=E2=80=AFPM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Use newly added devm_pm_runtime_enable() into rzg2l_csi2_probe() and
> drop error path accordingly. Drop also unnecessary pm_runtime_disable()
> from rzg2l_csi2_remove().
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> Changes since v1:
>  - Collected tags
>
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/driv=
ers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 948f1917b830..4ccf7c5ea58b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -805,11 +805,13 @@ static int rzg2l_csi2_probe(struct platform_device =
*pdev)
>         if (ret)
>                 return ret;
>
> -       pm_runtime_enable(dev);
> +       ret =3D devm_pm_runtime_enable(dev);
> +       if (ret)
> +               return ret;
>
>         ret =3D rzg2l_validate_csi2_lanes(csi2);
>         if (ret)
> -               goto error_pm;
> +               return ret;
>
>         csi2->subdev.dev =3D dev;
>         v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
> @@ -834,7 +836,7 @@ static int rzg2l_csi2_probe(struct platform_device *p=
dev)
>         ret =3D media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(c=
si2->pads),
>                                      csi2->pads);
>         if (ret)
> -               goto error_pm;
> +               return ret;
>
>         ret =3D v4l2_subdev_init_finalize(&csi2->subdev);
>         if (ret < 0)
> @@ -852,8 +854,6 @@ static int rzg2l_csi2_probe(struct platform_device *p=
dev)
>         v4l2_async_nf_unregister(&csi2->notifier);
>         v4l2_async_nf_cleanup(&csi2->notifier);
>         media_entity_cleanup(&csi2->subdev.entity);
> -error_pm:
> -       pm_runtime_disable(dev);
>
>         return ret;
>  }
> @@ -867,7 +867,6 @@ static void rzg2l_csi2_remove(struct platform_device =
*pdev)
>         v4l2_async_unregister_subdev(&csi2->subdev);
>         v4l2_subdev_cleanup(&csi2->subdev);
>         media_entity_cleanup(&csi2->subdev.entity);
> -       pm_runtime_disable(&pdev->dev);
>  }
>
>  static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)
> --
> 2.34.1
>
>

