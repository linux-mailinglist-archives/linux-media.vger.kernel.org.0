Return-Path: <linux-media+bounces-1659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A08053AA
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 12:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BFE81F21498
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 11:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3888359E50;
	Tue,  5 Dec 2023 11:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fl0/f1fD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C56A7;
	Tue,  5 Dec 2023 03:58:00 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d0521554ddso25834435ad.2;
        Tue, 05 Dec 2023 03:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701777480; x=1702382280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAw5aOcHJcYASQz0eHH4lmIjL4FIKnv8jTkbUdzuwNM=;
        b=fl0/f1fD3kfD69bhtf5c8SYyw+Xcb1D4b1O/n7/7ySQpstv68abbbHJJV3CHyRmRH6
         vzP70bT9KRGR6KJPlT9nldFhyYNQwleTSIn2MsOrGwcP4nUeyP8xcs5TqzKPU0ERGHdR
         mbmUmedX4ZvYBamL5S2VP0qn3GBShT0DiqnDYv3IqqbFrNlRoNNwetxSZoyEYN64QRF0
         anU+zNCeumR4iJ4QuXobCzEOI662KNSjgCJnOg77s5MvWz8H8X9KyiINKJox65XrJs4G
         TxiSyYCBac/F6byzCxBENCZQOGmxtDiOKp61TggC1hmKD6Q/kv1H0/wPraY1iz+CpD38
         HExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701777480; x=1702382280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAw5aOcHJcYASQz0eHH4lmIjL4FIKnv8jTkbUdzuwNM=;
        b=IoBdUVTGfYjfG8KLrd9QQFLuRiiyAiou1fsDqEHT2/UlFdAl9sZbRfyxUOwQ5Wysq0
         XOF+ZsV0sHhUo5OdonAQQb+WiuWKXGG8abGakNEEhfDgA6JKr5dIooHFaHK5zRi251QE
         tBrSJHMuK2QAHJEpcbKfx68krFOAcLSseHwWWI0nuoVlQNHZqx1Zn4Cb4cNy1yhov0ez
         Qe1NJq5bgSMXLDvDx8PgAHnsppJBYOlJz+osF7qleb2eWDbFWHlr4lh4iq/haRymNK/+
         8em+UVyxZTmYcrojHbHTT+7MZZrlvUcFtHFb+FA2kRlNyiv3brCCm9zrCkNR+/ubuEV/
         sxRA==
X-Gm-Message-State: AOJu0YxSRzLMKvEVlF/Zj0iTR8xoLAipQ2+DB7RtDXrxiZhZeZao8kKW
	eNkjKWMdyaCKwXreEQXAfYbmy1Pfl+3uTTCPo26gP5vhgxxV/Q==
X-Google-Smtp-Source: AGHT+IEjCRGNYqa5mnzUdPODZn87BAXipHow/pst6yJq3yWD1h01v8oSVDlhiOYM4SwKwmfR5Iibs6ibxS/IAEPecp4=
X-Received: by 2002:a17:90b:1e41:b0:286:d1d6:9a61 with SMTP id
 pi1-20020a17090b1e4100b00286d1d69a61mr854689pjb.7.1701777480051; Tue, 05 Dec
 2023 03:58:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205-rkisp-irq-fix-v1-0-f4045c74ba45@ideasonboard.com> <20231205-rkisp-irq-fix-v1-2-f4045c74ba45@ideasonboard.com>
In-Reply-To: <20231205-rkisp-irq-fix-v1-2-f4045c74ba45@ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 5 Dec 2023 05:57:48 -0600
Message-ID: <CAHCN7xJqw-hSD7rWfxFq5NWnF+=RrpCWR+js9358jAL0_WzVFw@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: rkisp1: Fix IRQ handler return values
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Paul Elder <paul.elder@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, kieran.bingham@ideasonboard.com, 
	umang.jain@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 2:10=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> The IRQ handler rkisp1_isr() calls sub-handlers, all of which returns an
> irqreturn_t value, but rkisp1_isr() ignores those values and always
> returns IRQ_HANDLED.
>
> Fix this by collecting the return values, and returning IRQ_HANDLED or
> IRQ_NONE as appropriate.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 18 ++++++++++++++-=
---
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/driver=
s/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 76f93614b4cf..1d60f4b8bd09 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -445,17 +445,27 @@ static int rkisp1_entities_register(struct rkisp1_d=
evice *rkisp1)
>
>  static irqreturn_t rkisp1_isr(int irq, void *ctx)
>  {
> +       irqreturn_t ret;
> +
>         /*
>          * Call rkisp1_capture_isr() first to handle the frame that
>          * potentially completed using the current frame_sequence number =
before
>          * it is potentially incremented by rkisp1_isp_isr() in the verti=
cal
>          * sync.
>          */
> -       rkisp1_capture_isr(irq, ctx);
> -       rkisp1_isp_isr(irq, ctx);
> -       rkisp1_csi_isr(irq, ctx);
>
> -       return IRQ_HANDLED;
> +       ret =3D IRQ_NONE;
> +
> +       if (rkisp1_capture_isr(irq, ctx) =3D=3D IRQ_HANDLED)
> +               ret =3D IRQ_HANDLED;
> +
> +       if (rkisp1_isp_isr(irq, ctx) =3D=3D IRQ_HANDLED)
> +               ret =3D IRQ_HANDLED;
> +
> +       if (rkisp1_csi_isr(irq, ctx) =3D=3D IRQ_HANDLED)
> +               ret =3D IRQ_HANDLED;
> +

It seems like we're throwing away the value of ret each time the
subsequent if statement is evaluated.  Whether or not they return
didn't matter before, and the only one that seems using the return
code is the last one.

Wouldn't it be simpler to use ret =3D rkisp1_capture_isr(irq, ctx), ret
=3D rkisp1_isp_isr(irq, ctx) and ret =3D rkisp1_csi_isr(irq, ctx) if we
care about the return code?

How do you expect this to return if one of the first two don't return
IRQ_HANDLED?

adam

> +       return ret;
>  }
>
>  static const char * const px30_isp_clks[] =3D {
>
> --
> 2.34.1
>

