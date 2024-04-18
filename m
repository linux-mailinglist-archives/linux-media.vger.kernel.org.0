Return-Path: <linux-media+bounces-9691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 890B88A959D
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 11:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40873282A89
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 09:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA9315A4B8;
	Thu, 18 Apr 2024 09:06:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C86136991;
	Thu, 18 Apr 2024 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713431209; cv=none; b=kRZKu8VKYqB0B11Hs0r4Aps32EfeviUdgCIvOoXJeXCuVIFubPXK9oBVKNoEvoNCKAKl29TRizniFA5XFzjoVnM2X8JIF1W+QjeQwVq1KVBEuU8V/XYUV5kzA4vJPnpG68sdr3BLx4lbYxyhJdgiU6f+3LkML009LzBD1fj/L/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713431209; c=relaxed/simple;
	bh=GfIsbjHzvFgZ9igHX//0HyA6GRiponk7LRfEhoMkl2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbGJEBBoCN5lhVphysyRHm3rjxAD8hcDwIlxjCrf4/UnG/Jm7HdPVsG764QnbPA9pEqLAaViR4R3Q+N6FCfzuPcZgHgpGGghTLFkQkZ+wEyWjIWfRH1DJvoU7bDHfBjOC1VN1jQc9MrysyBNAriUwZuB76z51oy1xZP0nXkkvck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61587aa956eso5873927b3.1;
        Thu, 18 Apr 2024 02:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713431202; x=1714036002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ6H+u3YMHco7E2wLPXT0v/EGRdfGlT/S8oNSJc7/qM=;
        b=PWR4O6deXcTDUFs5FgzDBMZst98qhaU4MI+yWTUmakknvWqJa34Bfc/Glcff8Umuyp
         qbLRtSmbEFZcQok3KmO9a0SQpBh+DWo1RrybhIcj2LLOdMPikIjY5tBQtLHj55UvCEk4
         67LpMRI73JdY3moTtJ0RJeQZWbzgjqLF7AfcdcTDafbuiLWJsjT9B/aelpzva3iScq/M
         UbubhZcGgRKgdbmq0t44UHtqhOR17uFAFQVqCPL4Zz77MgOM8QcSiETisrIed3H7koX7
         0sdxh3ObVsh+lJLbhdAOpWPT7luVtwE110JpUpkE2kySQwfj3ngDPOsn+wLxNG1/ojIE
         CL3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKIQASRJtZz45cSgKezOxkkWKDSnrpYriKs6GyJbqXJ3g+Wa3S/BVMGJa1WGMefLdRYfeadUTIpc+yeLQXXgBSQ43oGMAdxSTzdYLk0euQJIWcIeGdGokJk1z5hufwMxgnaQh64IPKyZ4LvZeImg==
X-Gm-Message-State: AOJu0YwnxDNiAqc3acVAx/6t9ctuivhg8jYeq7q9iS9xp83GCj97y9IZ
	9D0YjPPjXlvA17dQGM732RhKnNWkzP+UlIYVvVEUB1S+sm67kS4UfFERBVb+Ys4=
X-Google-Smtp-Source: AGHT+IF+oAQXWV4PNw+EhV8htfSsb4llcG/DL+8SWaQmTMEyL+YifVRozKkAYv69wD2IqRW5splINg==
X-Received: by 2002:a05:690c:fcd:b0:61b:1e81:4f65 with SMTP id dg13-20020a05690c0fcd00b0061b1e814f65mr1730408ywb.0.1713431202078;
        Thu, 18 Apr 2024 02:06:42 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id i9-20020a81aa09000000b0061b09824e52sm251722ywh.7.2024.04.18.02.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 02:06:41 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61587aa956eso5873447b3.1;
        Thu, 18 Apr 2024 02:06:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXu7ooUr6kbg0gudHEz0CgXbkAa1RBAkFZTt/KNXDUXf2NXOHvzprP3C5Y53as08xLdGJDNR/+kjnSuqhFbu7mQ01c5IFwsVDqreqOvVSCFiMNnRXt+u1G2MN0FCe9ax3q8gKPX5ZCJlhm0WtysCQ==
X-Received: by 2002:a05:690c:7309:b0:611:85da:1a66 with SMTP id
 jp9-20020a05690c730900b0061185da1a66mr2281082ywb.35.1713431199935; Thu, 18
 Apr 2024 02:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219180544.526537-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240219180544.526537-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Apr 2024 11:06:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO7n4oBr=U-DK2aa+S68kLX=VuzpuYDeA8KymzdnggNg@mail.gmail.com>
Message-ID: <CAMuHMdWO7n4oBr=U-DK2aa+S68kLX=VuzpuYDeA8KymzdnggNg@mail.gmail.com>
Subject: Re: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to rzg2l_cru_video_register()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Feb 19, 2024 at 7:05=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Move request_irq() to rzg2l_cru_video_register(), in order to avoid
> requesting IRQ during device start which happens frequently.
>
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com=
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c

> @@ -1011,6 +1000,7 @@ void rzg2l_cru_video_unregister(struct rzg2l_cru_de=
v *cru)
>  {
>         media_device_unregister(&cru->mdev);
>         video_unregister_device(&cru->vdev);
> +       free_irq(cru->image_conv_irq, cru);
>  }
>
>  int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
> @@ -1018,6 +1008,13 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev =
*cru)
>         struct video_device *vdev =3D &cru->vdev;
>         int ret;
>
> +       ret =3D request_irq(cru->image_conv_irq, rzg2l_cru_irq,
> +                         IRQF_SHARED, KBUILD_MODNAME, cru);
> +       if (ret) {
> +               dev_err(cru->dev, "failed to request irq\n");
> +               return ret;
> +       }
> +
>         if (video_is_registered(&cru->vdev)) {

How can this happen? Perhaps rzg2l_cru_video_register() can be called
multiple times through the rzg2l_cru_group_notify_complete() notifier?

If that is true, the request_irq() should be moved after this block,
just before the call to video_register_device() below.

>                 struct media_entity *entity;
>
> @@ -1032,14 +1029,18 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev=
 *cru)
>         ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>         if (ret) {
>                 dev_err(cru->dev, "Failed to register video device\n");
> -               return ret;
> +               goto err_request_irq;
>         }
>
>         ret =3D media_device_register(&cru->mdev);
> -       if (ret) {
> -               video_unregister_device(&cru->vdev);
> -               return ret;
> -       }
> +       if (ret)
> +               goto err_video_unregister;
>
>         return 0;
> +
> +err_video_unregister:
> +       video_unregister_device(&cru->vdev);
> +err_request_irq:
> +       free_irq(cru->image_conv_irq, cru);
> +       return ret;
>  }

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

