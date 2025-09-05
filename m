Return-Path: <linux-media+bounces-41854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B247B45D6E
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 18:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F8311B23395
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 16:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4E2302155;
	Fri,  5 Sep 2025 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXfcATUY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209072F7ABC;
	Fri,  5 Sep 2025 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757088331; cv=none; b=TjkdFH+7bTw7dzN4F9ayNODaIBQ3QQXS8yb08LQELv+Zk7lNANDiAgzxRCFE07xUxuwgm6hhsjMeZiQO2Wt87MO3PpyuM+qGItE3cFYWlOvqUrrzP6Xx40pKt2TIS3GgHlrRefF7TQx+AZNob8ivSAgCCOre7v5V/FpDeDyxP8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757088331; c=relaxed/simple;
	bh=FESAJV3RMtcE1Z/zKrWFGkbPFtqRO7/Jl8Cv0HWHt3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpnbhrW1MAh6UAZhfvKeBtlYYUYj6EGJ6zx7a9a5VCmURhe/zYVNSoF1QbxUJfDCOqq/YOuczhi96mjqSTI7lgifu9qHXgPZCRifLiXz74vxPxoQ6TPAMLDb1A/2gO6zJxnNWdSfdnDg3f/U8Pbomq0GaJu1IKLQiQgAAoPTB4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXfcATUY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so2403775e9.1;
        Fri, 05 Sep 2025 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757088328; x=1757693128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob2dOE5lLXVb6RqGFMwvVMJwP8tb3SAsPX4YiQh5IfQ=;
        b=cXfcATUYWg4jhAIZObBVL2WQqDxSAnUyqZw84x2Bo01aopygHob38vcuW/ShxDthTO
         W9q3uqwAzzltH0FNz8ASfPnKp48NeEMaKoabhW9oRgbuD60hOG7MMzglhMbXcQUCDCjI
         oUDxc/SV+TBwrC0pr/iDM9c9srK6CO4GSbXAZRDGavdzxvsWTNq8c1/di6IYnj06phtp
         Xr28ZbA1cOrHz9xanU2vFJtgj+GGzA90G3p0WR/7lERftCQ7uLACFUVpqxGPaMrfMMXm
         HYJXN9hCe2xdxM3MPdrgrisSzsBDL6/7E6k2SNhWqE1p8IoiNJC4ff4/JEo/XgLI4uJl
         3vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088328; x=1757693128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ob2dOE5lLXVb6RqGFMwvVMJwP8tb3SAsPX4YiQh5IfQ=;
        b=Piy5+6JXbHjv5lSqg+HTiwEuqe1jhkSCpqY1z8RiDVmkycaU/ZQE7SBvXiJpsPDNNc
         PcgsXb4m09BE/xa0vfxGrs1dNc8ghJ9fdEG5p6D8wJb6VqCNsVAabgogcenNCaV7MqAv
         P0ginN2gd/oKDXnD++BUJjod6IOdrR3uXr2/3zBPPabdlb8+M1vzQjUfM5ohKcRAWpNi
         tv7R1lsrlNW77tw+nIqcb4Mowv56xBjjF3rqFtgW1Ek+GuJsKXuHjEeSqJkxph4CMZ7v
         T5NH+1yp70fUnEPTLuv3KV4otUrTI6bazkGmhDuzISn7hCKQs7Ffogmzi7GOP0AsF8ga
         go+g==
X-Forwarded-Encrypted: i=1; AJvYcCU72z/BKS7FhKAyuo3wKB/P6L0uMWWV1MsWxr9M43lP3ojynxCBx5yw+iaL4/VARXg9xYQFLeky5iy3i2I=@vger.kernel.org, AJvYcCUeNggD7k3CZO1cqHxu1XNSFO2RLDikvHgIu3SWAWGx705eJBefjnGEUmRsHRpAD6m05d7oE1jQ22Sg@vger.kernel.org, AJvYcCV6DWwDsBPuqgN3q7now4p0aVOsn6bTgRoSg+kpACPq+qnXjmA8FXnMUdFKqioGAeasdIQdkth2HwvCqqU=@vger.kernel.org, AJvYcCVdJRm6HVuBLwddi1/z0osZg8rbFr0GxCvoMQP453jX0V4rdFGvoXWhzi+1uaDHUl3KScga2J3oxwbk@vger.kernel.org, AJvYcCXkRJVeAl1/pVTOm+RJ1dZUkC5Y+y6QgY5ZDw7yNxBxns0fw31sTZWZp7ItIxX20IG7y3jNWW8eJ9wux5dD@vger.kernel.org
X-Gm-Message-State: AOJu0YxRMCDqNQ2g2xtU1A/LiD9t9gEhvb7Lp5st+jgFCHtTxD8qr+GL
	4SD3lGPNTpEFNRwbJ1IZWWTLyBPSenxhAhzciLWf8uzOqLTCEvHOktfHgcnPzmHpUc04/ulXD9I
	GLK8JilVzSryJtkp/cWdhwI8UrsWfkC0=
X-Gm-Gg: ASbGncsf4iq3q8F9YcZN/RDtBZdcafhKEmGnRBLWwnVMrTV+bDLSNNCNlY74dfKXjC6
	6w0s2yxtpHf58fZJ/TnWZJBrbyxOqc2/deP4A/U8ntWENypclisoF0sTy48ehTkL//H5JEVLtNA
	9nhvvC/1iMiixIa1SxnRToTam2t6nESGFOiUk2k2EQxij35wrKw2jrSqAi2VN8IE3WaZWtBRcgd
	hREq/fzW9yfWlFRjag=
X-Google-Smtp-Source: AGHT+IHQFdT92ui+oOPmAAzcjKrst1A5X5grtZ18QdUjMPD7e/2IxfW8vgkJ8xIP5tdh0aCS17FWkqJxwRfpnaKU8Is=
X-Received: by 2002:a05:600c:1c0d:b0:45b:97d9:4127 with SMTP id
 5b1f17b1804b1-45b9973a7bfmr114115425e9.1.1757088328192; Fri, 05 Sep 2025
 09:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-10-clamor95@gmail.com>
 <20250905175915.2d7e02a7@booty>
In-Reply-To: <20250905175915.2d7e02a7@booty>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 5 Sep 2025 19:05:16 +0300
X-Gm-Features: Ac12FXy8-gf4rqnnMixpiVUbphC0vtcMsbDHxj7dfCPkBooqcg0F62Ji9EeEqrA
Message-ID: <CAPVz0n0_DJh9M-h5a0bcBA8b6_7vzgOYSktGxAhFzuVncoJhmw@mail.gmail.com>
Subject: Re: [PATCH v1 09/19] staging: media: tegra-video: vi: add flip
 controls only if no source controls are provided
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 5 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 18:59 Luca =
Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Tue, 19 Aug 2025 15:16:21 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Add HFLIP and VFLIP from SoC only if camera sensor does not provide tho=
se
> > controls.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/vi.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/m=
edia/tegra-video/vi.c
> > index 4f67adc395ac..61b65a2c1436 100644
> > --- a/drivers/staging/media/tegra-video/vi.c
> > +++ b/drivers/staging/media/tegra-video/vi.c
> > @@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct =
tegra_vi_channel *chan)
> >       }
> >  #else
> >       struct v4l2_subdev *subdev;
> > +     struct v4l2_ctrl *hflip, *vflip;
> >
> >       /* custom control */
> >       v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, N=
ULL);
> > @@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struc=
t tegra_vi_channel *chan)
> >               return ret;
> >       }
> >
> > -     if (chan->vi->soc->has_h_v_flip) {
> > +     hflip =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
> > +     if (chan->vi->soc->has_h_v_flip && !hflip)
> >               v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2=
_CID_HFLIP, 0, 1, 1, 0);
> > -             v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2=
_CID_VFLIP, 0, 1, 1, 0);
> > -     }
> >
> > +     vflip =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
> > +     if (chan->vi->soc->has_h_v_flip && !vflip)
> > +             v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2=
_CID_VFLIP, 0, 1, 1, 0);
>
> Based on my understanding of V4L2, this should not be done.
> AFAIK subdevs should expose what the hardware block can do,
> independently from other subdevs. It is up to userspace (e.g.
> libcamera) to use the most appropriate control when there are redundant
> ones.
>

This driver is video-centric, interactions are done via /dev/videoX
not subdevices like media-centric derivers do. Conversion is possible
but it is not scope of this patchset and in case such conversion takes
place, one who will do that, will definitely know what to do.
Video-centric drivers expose all controls within single video device
and it cannot hold duplicates of controls, this causes error. So this
solution exposes camera flip controls and if camera has none, SoC
controls are exposed.

> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

