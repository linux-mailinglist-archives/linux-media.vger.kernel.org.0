Return-Path: <linux-media+bounces-38824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5455B19F00
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 11:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41A8D3BD4E5
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 09:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B09024503B;
	Mon,  4 Aug 2025 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcUN3AOD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C05D21146C;
	Mon,  4 Aug 2025 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754300968; cv=none; b=i9FTBER97Fh9PpsdoRYiPNDpYP053rlhqNwW6ZkMloHTvUelm8+EyG+BXzCAPz5c/M5s2frtqefOR4K82p4Fk1tNLFvV7uPq8HMbNSzRhYK+MjrDk8MA2A8vIsJe1hFfHZ4RfRKqn+zgM/A0YYKmadk8n/0CWfRkK6Nzlw9/ukk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754300968; c=relaxed/simple;
	bh=+oZeq6uL2wnvNpTCtWynIAvOR4UUGedjXwb+gO5uRQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ui7fP87KRdRXbnRYJ4VaPt9QEzdLZ5VR/rd/sB2RxKD0zGqP+lJOPd/b/XEyd2XLygAOU80VW+xthgX0vkm6LPOAa34rDxVmlq7lvKZ5ngSJLjSFDNsvfxtVpWDHa3J7KdC8+Cw08vVnH7kvRBwFoMQZqY0nq6/NYsJBah8oKWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcUN3AOD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b7886bee77so3610588f8f.0;
        Mon, 04 Aug 2025 02:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754300965; x=1754905765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOGBNaTAmzo8K3K7hJ7AZI+oUlfMeV4wGvIVjMCFBdU=;
        b=LcUN3AODwqkTcoix1Cg7sSvopdzIyXvF+FtPBEHEE6kGFeCjZOod2aHilL2U+N8Wzx
         QH5EWZ0JL8+onBhYQh0OpHizfY4wc/nMLy7GDOyCMJeTHhsXwQaGIGzqdOhi8kxRfqoY
         n6q5kY8o5qznF28JfAmSbK5NEMuAb0mpr09D5smzvMifHrTsuHG3NpCWkcNjrRYcF+8D
         cTnM3RG6cikUa8yunn9dY4guqEE1k2iO6rj+MvGHX26B1C/t78T82VRPi15uaTPPiQan
         FZqiz6A0/Reivhwul0gDBQAV8Sk0pbKbP8J3WtmH5FjS0IhD7qLOv5jHQ/GQ7k2oF9ZN
         2G5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754300965; x=1754905765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOGBNaTAmzo8K3K7hJ7AZI+oUlfMeV4wGvIVjMCFBdU=;
        b=P8kyGe2QMBSp5U2Z2NffidKa8uvFxuBfHfNNVTgKGNVlpTeIZDgTVVLhMAqOONY3tX
         8+o3BHyjIspxvGDifMZIHMUq1HPaz+lKUuvC69BDT3J1f69DGHlU+t2Z5XsYMP9Ulz7Q
         zChmzHw7ABKjwDZ7IkTa5p1FHQiC+Nl7pPrnBg/tZfQmjCPFsjIEIZynla2z4pDOrdfo
         +tBNGXYRpVvS3YkHAsLsBX0dtbvuByqmFgBfDS08guZw5Sn8xHcuxvtfX5Ky8aAU9y4e
         bi0M36u68z/c6EADDGlVdGB6Xhnv+rnH2BP37Rj4ZGJDR1/DSUkVb9sYl9k+41tOyUF0
         6cOw==
X-Forwarded-Encrypted: i=1; AJvYcCUcKXn6y9dtSjimpyXw8g6T63nEWGrLzwmI0d/i/0nqp8Le/3p8qIAZF+5Zu0EgFWl10w4OcU+j3IoZ3qc=@vger.kernel.org, AJvYcCV3aWobUpw65jdX+8FYr5UGjGRX8bsc16rSuKL29fNPgwK1wZbzTBE+vP+ToZVU5fH44KgcDKTikMFpFrxn6a3fT20=@vger.kernel.org, AJvYcCXv65xlFf1tIfP0+4Xl59j2CxBl2fJHoPnOd1nzXPcnSaTA57iO2IgQ8MiJysI9A7sv76gyaDExsBP3+I0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE+pDBrfKxfMNEV30hAFjaTOwUP7vR1AOVko1iHSV6EbCFBIwH
	PAEu0PfM5FvtPFoCW/yriZzivMHVoLfzefiaxpHDnJVRiOv4ojUXcFeZw8qOR1d9+WcTSNfJ1+6
	nIr/FBcsAkrfoLLrAQ2L6DeE8RJwYygA=
X-Gm-Gg: ASbGncuv7T9CKX+RQalxAiskR5VhaEKnFx3wLZnjkdJMLbBbhh/dHavH8vA5GaEERQ6
	X7ZsReNIzrVur+uirVDodN1Zhh0WCxyOl8Zh+yHdnhTPAcdKjpokIehX9TH10FhjrPt4TF4AKfK
	vlgU2gyfQ+jqQW0RZcdg0H6GaN8CJWYdJFokZbDsCAp/MBGdVKc2oMLAOm0RXLtdPpRuOkDTuzd
	ZwW71g=
X-Google-Smtp-Source: AGHT+IFXNUHlTSCwB3PdPV7NnEWNhQAxpVzt68GmIGUOW+bV/8ErpTUIwo/SLHgRlY4KApOmzPAbX0vy3puFFaUfSZU=
X-Received: by 2002:a05:6000:2906:b0:3b7:bedd:d268 with SMTP id
 ffacd0b85a97d-3b8d94ce5b8mr6412183f8f.53.1754300965125; Mon, 04 Aug 2025
 02:49:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801053426.4273-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250801053426.4273-1-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 4 Aug 2025 10:48:59 +0100
X-Gm-Features: Ac12FXyw_mgJIKGIscr94v2AVgJ0sVI24pwsr-DSH6yE86MgAEab6YZApUCSN-g
Message-ID: <CA+V-a8tZXTiYyXE_2+G86=yGx+=BxCs=CiZrdhuB9J4Nmg2-EA@mail.gmail.com>
Subject: Re: [PATCH] media: rzg2l-cru: Drop function pointer to configure CSI
To: Biju <biju.das.au@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 6:34=E2=80=AFAM Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Drop function pointer to configure CSI to avoid code duplication
> by checking the presence of vc select register in rzg2l_cru_info.
> After this change, limit the scope of the rzg2l_cru_csi2_setup()
> to static.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 --
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  9 ------
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 30 ++++++-------------
>  3 files changed, 9 insertions(+), 32 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/driv=
ers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 806acc8f9728..3c5fbd857371 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -367,7 +367,6 @@ static const struct rzg2l_cru_info rzg3e_cru_info =3D=
 {
>         .enable_interrupts =3D rzg3e_cru_enable_interrupts,
>         .disable_interrupts =3D rzg3e_cru_disable_interrupts,
>         .fifo_empty =3D rzg3e_fifo_empty,
> -       .csi_setup =3D rzg3e_cru_csi2_setup,
>  };
>
>  static const u16 rzg2l_cru_regs[] =3D {
> @@ -412,7 +411,6 @@ static const struct rzg2l_cru_info rzg2l_cru_info =3D=
 {
>         .enable_interrupts =3D rzg2l_cru_enable_interrupts,
>         .disable_interrupts =3D rzg2l_cru_disable_interrupts,
>         .fifo_empty =3D rzg2l_fifo_empty,
> -       .csi_setup =3D rzg2l_cru_csi2_setup,
>  };
>
>  static const struct of_device_id rzg2l_cru_of_id_table[] =3D {
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drive=
rs/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index be95b41c37df..3a200db15730 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -92,9 +92,6 @@ struct rzg2l_cru_info {
>         void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
>         void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
>         bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
> -       void (*csi_setup)(struct rzg2l_cru_dev *cru,
> -                         const struct rzg2l_cru_ip_format *ip_fmt,
> -                         u8 csi_vc);
>  };
>
>  /**
> @@ -204,11 +201,5 @@ void rzg3e_cru_disable_interrupts(struct rzg2l_cru_d=
ev *cru);
>
>  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
>  bool rzg3e_fifo_empty(struct rzg2l_cru_dev *cru);
> -void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -                         const struct rzg2l_cru_ip_format *ip_fmt,
> -                         u8 csi_vc);
> -void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -                         const struct rzg2l_cru_ip_format *ip_fmt,
> -                         u8 csi_vc);
>
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index a8817a7066b2..d75cd5fa9f7c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -257,30 +257,18 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_c=
ru_dev *cru)
>         rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
>  }
>
> -void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -                         const struct rzg2l_cru_ip_format *ip_fmt,
> -                         u8 csi_vc)
> +static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> +                                const struct rzg2l_cru_ip_format *ip_fmt=
,
> +                                u8 csi_vc)
>  {
>         const struct rzg2l_cru_info *info =3D cru->info;
>         u32 icnmc =3D ICnMC_INF(ip_fmt->datatype);
>
> -       icnmc |=3D rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MAS=
K;
> -
> -       /* Set virtual channel CSI2 */
> -       icnmc |=3D ICnMC_VCSEL(csi_vc);
> -
> -       rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
> -       rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
> -                       ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> -       rzg2l_cru_write(cru, info->image_conv, icnmc);
> -}
> -
> -void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -                         const struct rzg2l_cru_ip_format *ip_fmt,
> -                         u8 csi_vc)
> -{
> -       const struct rzg2l_cru_info *info =3D cru->info;
> -       u32 icnmc =3D ICnMC_INF(ip_fmt->datatype);
> +       if (cru->info->regs[ICnSVC]) {
> +               rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
> +               rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1=
(1) |
> +                               ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> +       }
>
>         icnmc |=3D rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MAS=
K;
>
> @@ -299,7 +287,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg=
2l_cru_dev *cru,
>         const struct rzg2l_cru_ip_format *cru_ip_fmt;
>
>         cru_ip_fmt =3D rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
> -       info->csi_setup(cru, cru_ip_fmt, csi_vc);
> +       rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
>
>         /* Output format */
>         cru_video_fmt =3D rzg2l_cru_ip_format_to_fmt(cru->format.pixelfor=
mat);
> --
> 2.43.0
>
>

