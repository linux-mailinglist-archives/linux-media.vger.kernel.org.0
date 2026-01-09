Return-Path: <linux-media+bounces-50328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 468CDD0C6BB
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 23:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B359C304F17B
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 22:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035D130DD01;
	Fri,  9 Jan 2026 22:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UloHmcb4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BDC3002D8
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 22:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767996659; cv=none; b=VB9Zdh6yBWSLTAnOL2uqX5rieYRRUbjBl1ferfacq4ddIQ9UHi2+6ovxLUrtXfu58dCV/hxNVzO8z4ZnhcsmXa8E+2EXcslr03GbYVHsQJhnuj5CvAn365lPiSsRhHAerPEIU6H4F9d/iZVDcTu3FrMmOQcVRY8m6mCC91uvSmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767996659; c=relaxed/simple;
	bh=Db4IGIMQd4LmUYsiqwesFeGgBbcj5W1R0TGppOvvNBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJ/jp3LvpHXi2+0fCvfwA3lpDLTxRmJ6AESYwVPILFmtoCanGnkPNi3cRAPQ6Rf7xFcaAyIdbXk4hxeGSiYnjzYAYwJM9WkWA4FxbGIqe/G7Ut2ATRwHmrH0gd0vqKs79fXF6mKbXDXZmoJrb2oI8BjRAESX6b2vmPpNEZHYpug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UloHmcb4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so2288779f8f.3
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 14:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767996656; x=1768601456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5NhJM0K5QjhR4JNeyJKDoRb5o/7IYUpcb7JTn526G8=;
        b=UloHmcb4g2JYor+XBB+MfNLpo6iwaCJ/OJ0m8GPVQVswpL5YUAcp0z0d6XdVHsxAXw
         5y6WRaEhwkCRBuP6sYsJL2iczg2TPqN3v9i7SoZk0J93UIvO8vFEtAJFY3gynbqVO0yv
         e0nLJ5M9SwZfDN6mXHPMMRB/62c5kERSSe+y7x/Qk2uK3FW2lcq+1HcJzWPChPE+qWqV
         Ne+MfGqhUgnWNKp8h+dzedDU6W8T+BN8+WfzmNI6GzkKDYoNTHGZrA537CfwwWxBb1hT
         zy+tKR4qxw45SEJdWDc6BjqjntczstMjJdyjWDGCyM9QZNkLF8jtKf5WioB5ebEd0KzX
         CSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767996656; x=1768601456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5NhJM0K5QjhR4JNeyJKDoRb5o/7IYUpcb7JTn526G8=;
        b=bfiR1Y3rwGvxts5HeIZYO9LXw2QlN0SLSzIkVUEz935hUFMk/gaS0SELghixcfg9kY
         gV5PyRsq/YqilLu+QO2hx5YGyxgNL7ny4pB/20wHdNHX7W8XDanjlR2TcAyhdJGaS5Rz
         9F2FlVTxncawGCvKSzNKOspPUnCJvG0cB5Johcchr6s0LcN1kLtKYoGMcrnG9pkUBB52
         ULzrfEWIGG7zYSKxuxo/My9QHDGzFd//xF7CRSZ2HdEKWJHKVf4iG6hTcuCr2hLsXCkr
         hLw9n/piHqNoxFTCSTKM+dexGIJzu7XTX+ZVak9CRMx59OZjKqngpADlgR4FpLRPiOy0
         sTSw==
X-Forwarded-Encrypted: i=1; AJvYcCX3Xotiw3rMMRqv3XEvh9DtZHUaKiGK360+UTdEUSpVE78r71NwkHCD1bQ/7iekoWY1ScQL10rnyzj1vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5pBu0PBtZ4fNcD0M+7FQTmflfpzcorCibPOHod+9a7N2X35u
	HiJPg4VTLcNX3WiOHUr/e/sLLJxZpkfSXc1F9Z15UPerB3SA1rvtR5K3Ft4lcVKkT6jlilVBALe
	Hrpx4oaKqasoPp8DBPFBHRPt1yeM75gc=
X-Gm-Gg: AY/fxX7ijlE//3BEO8DavP69fdr2nZ5G9WOYi29PxwclX+NlqjoeMsEpnncscedLjJu
	0gAXWRZO13Ozj8LLzKNaJG6wQX7FrTkWmJaSDKP30Dmm7fXtd2QPk5C8b77wzg9tTcSzKQAJVM7
	sKVuJCuPdgwPLoGmvdzY97s/R95S/5HXZCOCqJ4IA08gFZAdmieCyl+iHal2PySWqQmPKDxkDfg
	m79/TKHb8EfKlr9lsYXzFj9avZ5+2b4JupfaLssETz3KyQsGfOo45kOMrAduMMO9Q+ZOG/tzeTM
	GxHDnsReKQsjyHbbGo8R1S0oI7OpvXX3MkrTkkmg1oxg9aE1h9sVTcuOhg==
X-Google-Smtp-Source: AGHT+IGG85skGm1/8zEUqdvndPqc7FGD8urUZQlwxB2eWmHd789FzuO40vVQEjDxWWsjRJMNX3bB7MeXcjEV5DTQGmw=
X-Received: by 2002:a05:6000:2584:b0:432:8585:3416 with SMTP id
 ffacd0b85a97d-432c37614femr13247899f8f.45.1767996656337; Fri, 09 Jan 2026
 14:10:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com> <62200deb6cceb09fa9f6086c3d9ef9031b8db5e4.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <62200deb6cceb09fa9f6086c3d9ef9031b8db5e4.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 Jan 2026 22:10:30 +0000
X-Gm-Features: AZwV_QiT08weSKN92Wn716Ch1jglNnPbAVNjLtQsofGTWEQqSXOBp7zaou6xOlI
Message-ID: <CA+V-a8vZuNj5yft6gu7SNgkhri8ZT-9gFOvwg8XErD8+DobCAA@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Use only frame end interrupts for
 DMA stopping state
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 5:16=E2=80=AFPM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> On RZ/G3E the CRU driver relies on frame end interrupts to detect the
> completion of an active frame when stopping DMA.
>
> Update the driver to enable only frame end interrupts (CRUnIE2_FExE),
> dropping the use of frame start interrupts, which are not required for
> this flow.
>
> Fix the interrupt status handling in the DMA stopping state by checking
> the correct frame end status bits (FExS) instead of the frame start ones
> (FSxS). Add a dedicated CRUnINTS2_FExS() macro to reflect the actual
> register bit layout.
>
> This ensures that DMA stopping is triggered by the intended frame end
> events and avoids incorrect interrupt handling.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    | 1 +
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c   | 9 ++++-----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/=
drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> index a5a57369ef0e..102a2fec5037 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> @@ -19,6 +19,7 @@
>
>  #define CRUnINTS_SFS                   BIT(16)
>
> +#define CRUnINTS2_FExS(x)              BIT(((x) * 3) + 1)
>  #define CRUnINTS2_FSxS(x)              BIT(((x) * 3))
>
>  #define CRUnRST_VRESETN                        BIT(0)
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 480e9b5dbcfe..34e74e5796e8 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -437,7 +437,6 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l=
_cru_dev *cru)
>
>  void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
>  {
> -       rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
>         rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
>  }
>
> @@ -697,10 +696,10 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>                 }
>
>                 if (cru->state =3D=3D RZG2L_CRU_DMA_STOPPING) {
> -                       if (irq_status & CRUnINTS2_FSxS(0) ||
> -                           irq_status & CRUnINTS2_FSxS(1) ||
> -                           irq_status & CRUnINTS2_FSxS(2) ||
> -                           irq_status & CRUnINTS2_FSxS(3))
> +                       if (irq_status & CRUnINTS2_FExS(0) ||
> +                           irq_status & CRUnINTS2_FExS(1) ||
> +                           irq_status & CRUnINTS2_FExS(2) ||
> +                           irq_status & CRUnINTS2_FExS(3))
>                                 dev_dbg(cru->dev, "IRQ while state stoppi=
ng\n");
>                         return IRQ_HANDLED;
>                 }
> --
> 2.43.0
>
>

