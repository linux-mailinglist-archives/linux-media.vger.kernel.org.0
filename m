Return-Path: <linux-media+bounces-33873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4106ACAA2C
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B547178886
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 07:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB6D1BE251;
	Mon,  2 Jun 2025 07:56:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F311B392B;
	Mon,  2 Jun 2025 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748850960; cv=none; b=m+fCE3YnBK+5U18BynXsK2buAIu31wgQGKtfE+Nn0BfNVeed7vNEsc4vphL9gaJvBPJzWLLhcyh7eZstkTGuxs5G1s6s1SDSH0OOky09jbAZ6KWh6hKZpWnCSGFm1Y7cOJckGI0PcayeMG82laNuXzVDnjwF2E3oCNd/4f9oCUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748850960; c=relaxed/simple;
	bh=B15AgqqqGyCqalqFTP+VV8MwbgSSyKqpjTLHMsgdLco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcyr/g8fNMUFzSQLk75prsZdpI3vKvGjIFevSjaQCaWMjngxZ0rep41P3yIjQOElrx7TTyu2uJ2jPzWK7YS6pgXVRawH3nvNwR/Ol3no12eFfXRCF4RFVZfRWmj8l/sFOLIW9ewHpudbh1GGbFlU/Q9rbaKlCMQm5dILBwrmhqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87dfeb9d0c9so590977241.3;
        Mon, 02 Jun 2025 00:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748850956; x=1749455756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvjFcJSjf93yv/L0XJYogWZSsozSNrFmoQSEWs7TRus=;
        b=qVl+lAZiaGj/Q8RRHBt/Z51iMlA+/CzrqR4ipCro6jtHcHE7e0E6xVd6YNXGwKcb9G
         85xyS5gA2P7u4tnpYbCP3YxsToixYrvR4OnybLD0w5XqPxcKP4tc/kAmffLiO4RhaB2U
         bSFQZ/jHuMAWQn05xb1agGhNZlCwqNhtvvDkvNHa0/mLuqMIn9qspzUL3J2TJs6aWV9l
         1gTGVUvjU2KHx3oyEdoQllhP4f5F0sW2c8b5KM1HrHIhsJA4V0raNrjZni/XuzkAsMzZ
         7TrrOEzAaikPm4kEh3UL1gnRpg2iNCf9+eO06tV/2YHJfymsveU3qaezZYaSk9IgS2Fq
         al1w==
X-Forwarded-Encrypted: i=1; AJvYcCWnQoKDG3P0MpxkkH2dd9jYk/G2TBgudadjILIZTAcIzRG856ZV/LN0niWn96S01sebRL3BwkAS1JepVg==@vger.kernel.org, AJvYcCXeZSH0XZfztVSazqSLyGkHfYui/TZAY+MhTybK7JBl46AE4b3J/c47ghEoPwYNNItw2vc3pXfU5SMVV3VCiFAc158=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh045rU8isxZDVnDH2gPXAFJVBzSnX+gugsfP1broib1v54WgQ
	rFous4znVA0810JgOx+gC3qWEId4gaN+DLcYDhMdwUO04cnAmlJ9RhzN0/MYkbkQ
X-Gm-Gg: ASbGncurRGlAu88ALkdlgmFOKI0eGG4Oce0H1bHh5VzXBjLMk6pYc012DlWuRF4oEwa
	2RAR9xMvew13/2V4wfdVkcLvQXNaTUTfRQpVUwgy1m0iS8Cu6OXxzRY+sKPmxPHJU6kSUwSuGWa
	DupY0ollC8D3k8JZRJ9PBOu5jDLXBSYYTv3lgTHSNWfdzavAIpiSTT7avNQPrAM61rdGlwQIk2x
	Qqqvq6glSnHqnp466rbJNScvgBMQmNbbpbZDbReU9ZSRwEG+HkP+CRwnZ6E0hX3kkS532OjxUle
	plYcCKGIaDFM2RbnPCYJV44VocR6YOxMX8NoTPIYoIUPA/VsKb9JJqcMNUPOqyVuO0VrdRIcGHB
	yzMNeN0mpuO12yg==
X-Google-Smtp-Source: AGHT+IHuFibk6ftwJvZjWi466yc3lFvzhRa0SZRHmfuq4lKhYaoWMcSIJE8nOBUffExKgXwAzv3sYQ==
X-Received: by 2002:a05:6102:54ab:b0:4bb:d45c:7f4b with SMTP id ada2fe7eead31-4e701c022b9mr4198408137.11.1748850955845;
        Mon, 02 Jun 2025 00:55:55 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a2c5531sm5710154241.17.2025.06.02.00.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 00:55:54 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4e591544d42so1358788137.3;
        Mon, 02 Jun 2025 00:55:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWo44+ZtQc3Xr2K5Z4ikZL2mk752pHoU6NRksV4u72Ui5dreuzN00K6oHp2Gd6ybk73b2MWgxuThWeGmYNew8xZAEI=@vger.kernel.org, AJvYcCXeqPC/c2N1hg50RlrjR3DP5Gsa+5QWhsZEkcpS57oy7tgTa5EpIkbo+pfIDMp0FCOmnB6SVQZLiJWcFg==@vger.kernel.org
X-Received: by 2002:a05:6102:160d:b0:4e6:ddd0:96ea with SMTP id
 ada2fe7eead31-4e701bd6207mr3987508137.10.1748850954431; Mon, 02 Jun 2025
 00:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402183302.140055-1-niklas.soderlund+renesas@ragnatech.se> <4ea2b464-81d8-486d-bce1-540e1cecb87b@ideasonboard.com>
In-Reply-To: <4ea2b464-81d8-486d-bce1-540e1cecb87b@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Jun 2025 09:55:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWamcsZcOe0XoTPm8oouV6Gn7y8SG-xJz-R+ey9CCd9Qw@mail.gmail.com>
X-Gm-Features: AX0GCFstx-_fpX7hVAmspm6dEGG1jF-90ua0PhdcocE69TaY9YRvLV8bRajWybY
Message-ID: <CAMuHMdWamcsZcOe0XoTPm8oouV6Gn7y8SG-xJz-R+ey9CCd9Qw@mail.gmail.com>
Subject: Re: [PATCH] media: rcar-vin: Fix stride setting for RAW8 formats
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Mon, 2 Jun 2025 at 09:12, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 02/04/2025 21:33, Niklas S=C3=B6derlund wrote:
> > Earlier versions of the datasheet where unclear about the stride settin=
g
> > for RAW8 capture formats. Later datasheets clarifies that the stride
> > only process in this mode for non-image data. For image data the full
> > stride shall be used. Compare section "RAW: 8 Bits and Embedded 8-Bit
> > Non-Image Data, User Defined 8-bit Data" vs "RAW: 8 Bits".
> >
> > Remove the special case from pixel formats that carry image data and
> > treat it as any other image format.
> >
> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> > ---
> >  .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 ----------------
> >  1 file changed, 16 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drive=
rs/media/platform/renesas/rcar-vin/rcar-dma.c
> > index f8394be8a922..fdf0f86c801f 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -680,22 +680,6 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
> >
> >       fmt =3D rvin_format_from_pixel(vin, vin->format.pixelformat);
> >       stride =3D vin->format.bytesperline / fmt->bpp;
> > -
> > -     /* For RAW8 format bpp is 1, but the hardware process RAW8
> > -      * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
> > -      */
> > -     switch (vin->format.pixelformat) {
> > -     case V4L2_PIX_FMT_SBGGR8:
> > -     case V4L2_PIX_FMT_SGBRG8:
> > -     case V4L2_PIX_FMT_SGRBG8:
> > -     case V4L2_PIX_FMT_SRGGB8:
> > -     case V4L2_PIX_FMT_GREY:
> > -             stride /=3D 2;
> > -             break;
> > -     default:
> > -             break;
> > -     }
> > -
> >       rvin_write(vin, stride, VNIS_REG);
> >  }
> >
>
> This one breaks RAW8 for me (V4H, streams, GMSL2 + imx219 sensors). How
> did you test this?

Note that this is being backported right now:
https://lore.kernel.org/all/20250601234012.3516352-39-sashal@kernel.org/

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

