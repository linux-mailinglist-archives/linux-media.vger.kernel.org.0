Return-Path: <linux-media+bounces-26748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F27A411DF
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 22:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6300A3AD57A
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 21:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0612405FC;
	Sun, 23 Feb 2025 21:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUbrdJhT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A111459F6;
	Sun, 23 Feb 2025 21:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740345307; cv=none; b=VkRLGLQ6n1t+IXW2ytglkypjHSNhvZGohHCLPfuenoN12YJm82bw89J0ZmePHQW28//iQiELD89PTTWGVRR1gz7oldO/pnrHv3GAf/WeqHqFKbjQoCIl8NemqZhA3iwFGQfaZ0WoMUfZVT+muzE8XAqjxqPjMLwh6XKRiyyFaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740345307; c=relaxed/simple;
	bh=Nz9ya0GTnxo7o9BEoBJ/1WQR4xdj+XWxuRQIuPbdR0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAn2JEbs/cn562JzctDWjeoQpPKC247usl81FduQs9K8YSNGAg/eX5hB1wA3bMGfIMRkHNVXv9tMQxFZANo5Mmx6hNx8BB281nHyAwj4fMyUwSqFE9wDXoxHf0XUYm4SOs5g4fNb6z0sCDyYzPJ7jyrtsB7b0QucAHKz2PvnbLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUbrdJhT; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-868e986092cso1098876241.0;
        Sun, 23 Feb 2025 13:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740345305; x=1740950105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2f9fN+ExNqJmDgxse/4Afi0ws4bP0ZJQZgoNF3/W7I=;
        b=DUbrdJhTCE6t0vaZtgN6aFfcrMSb0v81rn40SbYInGZh9pJ+3WD1P8u2QtpPBKkjQR
         x2meep7wTHil9d4zoJfNcjlKCDWgv47X87zKSY9XHPWo3BO79E9NB4GHmLj/L9CsBVxp
         LXeAn6GjcAz2Hp/aa5yVmzXAr9fzkeGjuVJJAozkfvVhuU5iSgMr7tcG5TiMYm+LeU13
         CD5GVeY0/hxgmAPY4PlHCNvkw5eaYH48Y+MTczYVPpPQqmoIDIGb4xi4AW9RJ7YS0seM
         TvGX/ib9MKdksNoddAQgPGEQAhk+s72GwBpaLmAckdjyy8VRXnQ2QHpKhOjo+O68jJrS
         /3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740345305; x=1740950105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2f9fN+ExNqJmDgxse/4Afi0ws4bP0ZJQZgoNF3/W7I=;
        b=bkiSkVxBVvDvv2a1aEkGFFf9c1E3NiCtMlVj96OqeoGCGnqXbZCCZCQ3Ia21LoecFB
         ptDFWqQP3arJi2fdAhj7X/1n8/TtyNMFuN0LX1QcSelqmHeJFj5MdIL2PmNIlg3BklZx
         nF4tx6RNByFGSZ4RFe2K5uC69pw+5VL775GrEPDIPdBlrHro1ZmYLGPTq1xjCcBCikg/
         sszo7VUqqSnldzZvGUxdabKi0bqCfpqOG607QWfTTL9KKXucZDdun0ED/CzrhXvn46M7
         icDWD7gdJ+tTIlho1Q5yLSpNHr2PktJ3/RphZdkt26UeE+z5x/Gjci0VrwBibW7/dBKQ
         VpcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6zlW9rh2Z/jjO0oe8uGlRGqHkMwnjAadfKBNTq9VtZmNjjGV4zDCpa+eJf2Q1T53+Rb+lbBLNL7oD4Y0yumejFk4=@vger.kernel.org, AJvYcCXK0PTTdq6Oze3l7lipHXmwhVNQIQC0JPG53Q7MHVFXwj603E6gOcseCobyl5LF6EItGX0FolziMustx5cf@vger.kernel.org, AJvYcCXPXQy+Keslr0FyNN2MOvGbfpiBXaTy9GUyJ2X72X+nzVjwojqc0TGi6yzu0EXEJCLsYkxoqT7EdbNz@vger.kernel.org, AJvYcCXmn85PIwuHKQiHe0i3gevVrGufWxm2ACzfjw15BebfUbWoP+fizQa6n+m2hs+B46zFm0PurlvXee30KPU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybzv02Es1TKI+CaBUCek94I7YcOopWiTrlHC1UFhLJBSCOqYYI
	LOm/KSITX8FiHdWJfw0W/+ctnnsPWYO1unoGyN4eS4YEJObSpUdczfAbb1sMfinpMdPeOnnQWhh
	f5UFKSJOnIo7oJpOdSWCXzwK4xSQ=
X-Gm-Gg: ASbGncuYXFJkwGqYHVui4BPfuab0221rmATizMTvi54UDhI7K2if7019Aox7PfntGBL
	ThHrjim1DrD0UkgQHJ/YpUq4nL+cRKglX1uVWgfMsTN8rqTo/+JWLRdlS/MGGW3urUCPYfq04C4
	qB5pfM/CfldGtfcVy/CfzSL5MRTIFk0AowTXlitjfr
X-Google-Smtp-Source: AGHT+IHQj6/cCPckdEb5xSOzmj1WawbUsuFcVYtd+MO17dAwangkzKmRQ/8e4G0WJBZpG/Wdj48cYXxDMQu7Q+eHJpI=
X-Received: by 2002:a05:6122:2786:b0:516:230b:eec with SMTP id
 71dfb90a1353d-521ee2c425fmr5593091e0c.5.1740345304764; Sun, 23 Feb 2025
 13:15:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com> <20250221155532.576759-8-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250221155532.576759-8-tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 23 Feb 2025 21:14:38 +0000
X-Gm-Features: AWEUYZm8mqqzPlFDMu3o12Ge_7AJaY0Gqrol3F_LI-IEYi7_gP7WNRGN9FhP2mc
Message-ID: <CA+V-a8u3CRvy6i+zCXhb1unOdgY13PbttNOTyGJ-g44Nk5MLpQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 4:06=E2=80=AFPM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and
> drop unnecessary pm_runtime_disable() from rzg2l_cru_probe() and
> rzg2l_csi2_remove().
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> Changes since v1:
>  - Fixed DMA leak as suggested by LPinchart
>  - Collected tags
>
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/driv=
ers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 70fed0ce45ea..eed9d2bd0841 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pd=
ev)
>
>         cru->num_buf =3D RZG2L_CRU_HW_BUFFER_DEFAULT;
>         pm_suspend_ignore_children(dev, true);
> -       pm_runtime_enable(dev);
> +       ret =3D devm_pm_runtime_enable(dev);
> +       if (ret)
> +               goto error_dma_unregister;
>
>         ret =3D rzg2l_cru_media_init(cru);
>         if (ret)
> @@ -297,7 +299,6 @@ static int rzg2l_cru_probe(struct platform_device *pd=
ev)
>
>  error_dma_unregister:
>         rzg2l_cru_dma_unregister(cru);
> -       pm_runtime_disable(dev);
>
>         return ret;
>  }
> @@ -306,8 +307,6 @@ static void rzg2l_cru_remove(struct platform_device *=
pdev)
>  {
>         struct rzg2l_cru_dev *cru =3D platform_get_drvdata(pdev);
>
> -       pm_runtime_disable(&pdev->dev);
> -
>         v4l2_async_nf_unregister(&cru->notifier);
>         v4l2_async_nf_cleanup(&cru->notifier);
>
> --
> 2.34.1
>
>

