Return-Path: <linux-media+bounces-13273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3F5908DE9
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 16:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A3B2847C4
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 14:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBED5175BF;
	Fri, 14 Jun 2024 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e0peMdVP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7204C96
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718376902; cv=none; b=QJCZ3KW8VuKW2VpTV8XcASWgNSJQ76CxhidNItkJCgZFHag0UQXlqzbQlfONuFRrqZTveoTAPweAvl2YUocvftKg8IUMmJ07ciDVkeupZzJf3rmz9byhIs4AZ1bGXoAkSe2SsNdMHZiEjidqpksUESOZOHb7ZuZBawFlj+sxmOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718376902; c=relaxed/simple;
	bh=ePyV2mgKNple3T7qBgOKPNX3ONHppQL/WQz9ZOXDXTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfJmw62Loyyi9v/TNX9jkK7cC3c4katTjVnJQkYbPHH/AEB4B30vHqDGCGqX7QX4SeEPba4SzdmrV3aMbjq+tNXdcP3dOniuw5lbowTIYzl1Z4RoiRsQiUrxIB06bzeZ6rMv3kl7Qd802liQE3m4Y2jIknqQVkxEDDqQdhqp8rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=e0peMdVP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6efe62f583so225784066b.3
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718376898; x=1718981698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdyE64ITlsEjDYdjWbst/sH7Q92347D+3IPnUE30Q5I=;
        b=e0peMdVP5479tPlYB/HEntbs+UH/zRTVbfvSTpsk4aZKAPs51G4lc/EJRGYHs19VL1
         w9J8vEyXb6NLj2V7vM5uaMFjB2DHPxBhuRotkmTUNJkWaRQ3EJT69y08xA4J/AXSc8wo
         IC2hXkEzzeA7CirLK/+MKTC1Zo7ALbHNeAq8QEr3WNbM5utLZmPwsDf4KCRWQaTiMDZ8
         CIj98OI9DpqCer3lCQ4iad9UekDDbmmL6iOjjGDGW640tQbbGlaAzql6QoqUD8oLuizk
         mN8d1DaJrQ5GlqlXXDbNC68OqSkQVsWzhKU9PDuYfsz+B2P8JyFSPTSG4hhRWpfTwR/i
         4lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718376898; x=1718981698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdyE64ITlsEjDYdjWbst/sH7Q92347D+3IPnUE30Q5I=;
        b=MCGlPbDhqGWaNKSlR8i7jkxZy/l3PXzOZBAjTf0yiCGWDyZGVQABuJpjCdVBf0IFrS
         Z/AdrmtMgEwsbtf9PKl1GX13JwGC7OvlscfcA2pvwB2qyaymjBrphGqxA+oYR5JHhYSl
         94kqjEGgTT5Q59nAJORrx07wuYga6FcRJ0aYbCWq6EWvT0GpAQdBDetPjojx5DVl36D0
         302XOqSgcCzTziiLrEUgCZZcu6hVyLLaM9U+wxn+0qklWKkWNkHCvbiEOJrrvGEY5xJS
         DrwDbguuOUv2dPK0UHaHdL/WBCdJx/rX9piSIqqhp43VP001PFQtJBppz0Ite47isHeT
         //DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBxuBzHjxSqzL+T2/5+pyRUF9FVLldTj2eRazT4WI/CLUigeCjnj7LuRZCbl7opSdeA+mi1e/Gbo7MODqq6Ohb+TnmWFUks5/ahSs=
X-Gm-Message-State: AOJu0Yyi9k3NP6WtjcmVToKRV/G8hqq+GCULNou9RorHBnGjBcMOQEXh
	jf2Sj4asLyRwqWlw/WAWN7TCL3qaPbljBspfMw8YvG5PS2BblRio3tJiNVM+gU5DpxPvTqViYlP
	oXMwM9RxLVtZd5LFRN6WYIi5kWhVFI9dqtn2c5A==
X-Google-Smtp-Source: AGHT+IFVQaFnc4sfLJ78hdBU5GqD7d5dF9LIJLkwZUP4nd0PeFSLQwba1QbMbPKaH5pBbY4kR1qCtQocrfy0T/ty0cM=
X-Received: by 2002:a17:907:d312:b0:a6f:668b:3434 with SMTP id
 a640c23a62f3a-a6f668b35f7mr185814266b.31.1718376898096; Fri, 14 Jun 2024
 07:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-4-jstephan@baylibre.com> <3c2bee40-3792-409c-b42f-f8b013ff641c@collabora.com>
 <CAEHHSvaT_U+HNzWQUoK9EuqGuqEd11+Lu0CLz_rL7uQf0Q5isw@mail.gmail.com>
 <53838e76-bfa4-41f5-a015-a37472e98991@collabora.com> <CAEHHSvaRqZM9c8oD05WKkhOHdjKLBkR6tXp2Q1b8OMiDxDsDhQ@mail.gmail.com>
 <20240614123345.GN6019@pendragon.ideasonboard.com> <CAEHHSvaWO7m=n5_f0BM7gwuDMfh_GMX=x3DknG28PnmtZbrGQw@mail.gmail.com>
 <20240614144248.GA20136@pendragon.ideasonboard.com>
In-Reply-To: <20240614144248.GA20136@pendragon.ideasonboard.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 14 Jun 2024 16:54:47 +0200
Message-ID: <CAEHHSvZPATFV=w451KaaT+e__EK9u3Vc5ORPRQ-Gfa4rJ_o8hA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>, 
	Florian Sylvestre <fsylvestre@baylibre.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 14 juin 2024 =C3=A0 16:43, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> a =C3=A9crit :
>
> Hi Julien,
>
> On Fri, Jun 14, 2024 at 04:14:52PM +0200, Julien Stephan wrote:
> > Le ven. 14 juin 2024 =C3=A0 14:34, Laurent Pinchart a =C3=A9crit :
> > > On Fri, Jun 14, 2024 at 12:38:15PM +0200, Julien Stephan wrote:
> > > > Le mer. 12 juin 2024 =C3=A0 10:06, AngeloGioacchino Del Regno a =C3=
=A9crit :
> > > > >
> > > > > Il 10/06/24 16:39, Julien Stephan ha scritto:
> > > > [...]
> > > > > >>
> > > > > >>> +     writel(0x10001, input->base + SENINF_TG1_SEN_CK);
> > > > > >>
> > > > > >> Unroll this one... this is the TG1 sensor clock divider.
> > > > > >>
> > > > > >> CLKFL GENMASK(5, 0)
> > > > > >> CLKRS GENMASK(13, 8)
> > > > > >> CLKCNT GENMASK(21,16)
> > > > > >>
> > > > > >> Like this, I don't get what you're trying to set, because you'=
re using a fixed
> > > > > >> sensor clock rate, meaning that only a handful of camera senso=
rs will be usable.
> > > > > >>
> > > > > >> Is this 8Mhz? 16? 24? what? :-)
> > > > > >>
> > > > > >> Two hints:
> > > > > >>    - sensor_clk =3D clk_get_rate(isp_clk) / (tg1_sen_ck_clkcnt=
 + 1);
> > > > > >>    - int mtk_seninf_set_sensor_clk(u8 rate_mhz);
> > > > > >>
> > > > > >> Please :-)
> > > > > >
> > > > > > Hi Angelo,
> > > > > >
> > > > > > I think I get your point about not hardcoding the sensor rate, =
but I
> > > > > > am not sure how to use
> > > > > > a mtk_seninf_set_sensor_clk(u8 rate_mhz); function.
> > > > > >
> > > > > > Where would it be called? How is it exposed to the user?
> > > > > >
> > > > >
> > > > > As for where: setup, streaming start, resolution change (which ma=
y be covered
> > > > > by streaming start anyway, as a change should be calling stop->st=
art anyway).
> > > > >
> > > > > And for the how is it exposed to the user - well, depends what yo=
u mean for user,
> > > > > but it's all standard V4L2 API :-)
> > > > >
> > > > > Last but not least, I can give you another hint....
> > > > >
> > > > > struct media_entity *entity =3D (something_here);
> > > > > struct media_pad *mpad;
> > > > > struct v4l2_subdev *cam_subdev;
> > > > > struct v4l2_ctrl *ctl;
> > > > > s64 link_frequency, pixel_clock;
> > > > >
> > > > > if (entity->pads[0].flags & MEDIA_PAD_FL_SINK)
> > > > >     return -E_NOT_A_CAMERA_SENSOR_WE_IGNORE_THIS_ONE;
> > > > >
> > > > > pad =3D media_pad_remote_pad_first(&entity->pads[0]);
> > > > > if (!pad)
> > > > >    return -ENOENT;
> > > > >
> > > > > if (!is_media_entity_v4l2_subdev(pad->entity))
> > > > >    return -ENOENT;
> > > > >
> > > > > if (pad->entity->function !=3D MEDIA_ENT_F_CAM_SENSOR)
> > > > >    return -ENOENT;
> > > > >
> > > >
> > > > Hi Angelo,
> > > >
> > > > Thank you for the detailed explanation :)
> > > > However, I can't make it work because in my case, seninf is connect=
ed
> > > > to an external ISP
> > > > so pad->entity->function =3D=3D MEDIA_ENT_F_PROC_VIDEO_ISP.
> > > >
> > > > How can I get the pad corresponding to the sensor?
> > >
> > > You don't have to. You can drop that check, and get the link frequenc=
y
> > > of the source subdev with v4l2_get_link_freq(), whatever it is.
> > >
> > > > > cam_subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> > > > > ctl =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE)=
;
> > > >
> > > > Is this mandatory to implement V4L2_CID_PIXEL_RATE ?
> > > > Should I return an error if not found?
> > >
> > > Does SENINF need to know both the pixel rate and link frequency ?
> > > V4L2_CID_PIXEL_RATE is very ill-defined, at the moment it only makes
> > > sense as a value relative to the sensor pixel array, and doesn't real=
ly
> > > apply further down in the pipeline. What information do you need to
> > > program the SENINF ?
> >
> > Hi Laurent,
> >
> > I need to know the clock divider for the sensor
>
> Could you provide some details on how the SENINF uses that divisor ?
> What does it control, and what are the constraints ?
>

According to the datasheet,  SENINF_TG1_SEN_CK[21:16] :CLKCNT : Sensor
master clock will be ISP_clock/(CLKCNT+1) where CLKCNT >=3D 1

> > > > > /* multiplier is usually bits per pixel, divider is usually num o=
f lanes */
> > > > > link_frequency =3D v4l2_get_link_freq(cam_subdev->ctrl_handler, m=
ultiplier, divider);
> > > > > pixel_clock =3D v4l2_ctrl_g_ctrl_int64(ctl);
> > > >
> > > > How to know the sensor clock given link_frequency and pixel_clock?
> > > > Can you point me to drivers doing something similar?
> > > >
> > > > >
> > > > > ....now you know what the sensor wants, set the seninf sensor clo=
ck accordingly.
> > > > >
> > > > > Cheers
> > > > > Angelo
> > > > >
> > > > [...]
>
> --
> Regards,
>
> Laurent Pinchart

