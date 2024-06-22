Return-Path: <linux-media+bounces-13970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BCB91349E
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 17:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2374C1C212DD
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 15:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B048A16F8F4;
	Sat, 22 Jun 2024 15:04:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315A14C5A4;
	Sat, 22 Jun 2024 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719068661; cv=none; b=YrT3Cp3pUU6o+xjLXxZobGOC3FUdK4GtyF/bDoIv/T68TZrN+usCsVS0tdFbGtnIbvR6KDCx+IE5RMxW7F1O+Ao3Y4q062JzU9nOGLhoVRM7nk016CH714LkgTteVtoF3l8KySDTy/+YXA4o/C9xGpjkg1Z08scs/HYL0rcIsEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719068661; c=relaxed/simple;
	bh=ts5T2EDHmcIaK5YoLHa0pe3FEjBdsuNcFPIc1cPFHr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZWeHF7uV4xdGu8cFTuOjzWMFQJf4rDqjEqbti5lATtZOxxGR1jRB/+UVH2KWGbRbLwhac0fe+koGfV4f2quZyO3ONAoIGzBlJ2kudbfEHD5ByNgiCknxcQCVSUn4f5dzEtA4JiMEs7Bf7Qn+ZTHAkJzyaUHK+Il/5Ee7xYY/8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cd6784aa4so1690152e87.3;
        Sat, 22 Jun 2024 08:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719068655; x=1719673455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3pQI0IJb3XskaJTRAaXxNB3TiCh4pJLT1XJMeA9sFQ=;
        b=ISmuwgVv5G0UAaM1tlepMZGOr/VljTtGvC8oWzpjOkCnKFZJoHSSkQCU8/ENQvZPIK
         1qd8ncW/EBAWoMe+ouFGI9fPqMKgluVA851PJ++EJL4fVM58BThJsDI2wHBwewRWs2Zb
         D/JZEuwu9ifllOxI9WsJGGpq+gzkyQS5pBvRNzOYeNRW+obvhvcbU7BxlliGEAdwXT29
         BDRx3dpWHzUbCr7+I2dgeaQo0Tzsnex+g49ZrxEZyGPIqG+dtP3afJwFAbZJA8yqXkNI
         rKw6im7WnB3/zj9edk1JReuc6gFS3pKFsnQbGhur/sJOqDE3Pn6hDclSBDAgqFEANI+r
         IeRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWki/MSfwpc5/8GIcwuHxD+on3xKSkXZ6FuYWr1Khf5OrtcKv5vPdYE5BsH1zf+5YJGprg5rn0TY1lDCM6xWeTFMLyL9x52k70dM147qLcNSJs=
X-Gm-Message-State: AOJu0YyomQtaB/KnFAgjlyDwZQ8XJ4yEUcyajFqNR8EVug0Vv/l3TjP+
	yhZlLFqvl1Phfdyz/yQYG3LNQXDTqiTCtahiy9oKo4nr/BcjGAg3NTanq9u9
X-Google-Smtp-Source: AGHT+IH1yTHK0UXo2Gu4dMEYhCWU9XqxpQy58u/odp2ShZCy3Cxvd9h/4l69zUJvPB1VC5r5+pzLRQ==
X-Received: by 2002:ac2:4859:0:b0:52c:deb8:e57c with SMTP id 2adb3069b0e04-52ce185fa2dmr21901e87.49.1719068655091;
        Sat, 22 Jun 2024 08:04:15 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49b0sm509200e87.43.2024.06.22.08.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 08:04:14 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec1ac1aed2so34591311fa.3;
        Sat, 22 Jun 2024 08:04:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2q1DxT0kYt8XlPV/yJFtoTumf6Uu4Wn4bwKUfZAuNbIE44JoGj9TS1HdpyNr5sF6Op0PQ3rpx2lPGxLtyHkRx+w7QIM1WsHeXztGIuZIK184=
X-Received: by 2002:a2e:321a:0:b0:2eb:f472:e7d3 with SMTP id
 38308e7fff4ca-2ec5b2840fdmr605451fa.6.1719068654651; Sat, 22 Jun 2024
 08:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com> <20240619012356.22685-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20240619012356.22685-4-laurent.pinchart+renesas@ideasonboard.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 22 Jun 2024 23:04:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65wK7+F8zfkk7vpSri5o8T7XKtJGxe6ftUA5_a43W3jGw@mail.gmail.com>
Message-ID: <CAGb2v65wK7+F8zfkk7vpSri5o8T7XKtJGxe6ftUA5_a43W3jGw@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: sun4i_csi: Don't use v4l2_subdev_link_validate()
 for video device
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Eugen Hristev <eugen.hristev@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 9:24=E2=80=AFAM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The v4l2_subdev_link_validate() function is a helper designed to
> validate links whose sink is a subdev. When called on a link whose sink
> is a video device, it only prints a warning and returns. Its usage in
> the sun4i_csi driver is wrong, leaving the link from the sub4i_csi
> subdev to the capture video device unvalidated.
>
> Planned improvements to the v4l2_subdev_link_validate() function will
> turn the warning into an error, breaking the sun4i_csi driver. As an
> interim measure, move the warning to the sun4i_csi driver in a custom
> validation handler, and drop the call to the helper.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers=
/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index dbb26c7b2f8d..d07e980aba61 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -35,8 +35,15 @@ struct sun4i_csi_traits {
>         bool has_isp;
>  };
>
> +static int sun4i_csi_video_link_validate(struct media_link *link)
> +{
> +       dev_warn_once(link->graph_obj.mdev->dev,
> +                     "Driver bug: link validation not implemented\n");
> +       return 0;
> +}
> +
>  static const struct media_entity_operations sun4i_csi_video_entity_ops =
=3D {
> -       .link_validate =3D v4l2_subdev_link_validate,
> +       .link_validate =3D sun4i_csi_video_link_validate,
>  };
>
>  static const struct media_entity_operations sun4i_csi_subdev_entity_ops =
=3D {
> --
> Regards,
>
> Laurent Pinchart
>
>

