Return-Path: <linux-media+bounces-13270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4C7908D1C
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 16:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AA43B255A2
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 14:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB0710979;
	Fri, 14 Jun 2024 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GhC/vQi3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA54A9463
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718374508; cv=none; b=ENp9EWxzqbP5PQfqDOXiKLX4pSBYLOzY13qj6SQ8PbYC13y6HtVIQUhvlenOGfcARpEjg1DgQCNqLfnVwY7DSIRBN/pE8O7xKhcuY6eWRsTJIwjEpx2TwItDMWs5Y7SOtl/r1sPsCHhe67UtusH8roykT8kxcSwKeCaN9u8VY0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718374508; c=relaxed/simple;
	bh=GdMJCTJPK6ZUOBTwouwEkqIoqIipuR0n2OyhocBfnN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6dJHDIbRGgcH4iAFjXAxEJanrqVZnqvkqmwBC8Ldkr46nPTJ9uBhQh5srXkshplXjzdmusLrWkBn+Wr+se9WN4WSSn8sbWdESHa3PfZevCfRA3bEcAuqzzI95+WRbt6clojGTTmhySAUDljaPv1Muomqvb7u7rPdjRqs6M1s4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GhC/vQi3; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6f21ff4e6dso353923566b.3
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718374504; x=1718979304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QR9tmd+yNNNniijbyRPGMlyIsNhlrnteAwcBJgKWpb4=;
        b=GhC/vQi35vCRnwHiG6wc3dV4jR0tg1UqwQ1rbMn9GlurauP07W2/uFOd3yEdrn3zPU
         hPoGhLEysYvN6qKJ6c0jEYj4Ui0W/wDVeYk7ElM7+FrWgpHiX+Orva6cZOsg9FWLlWcV
         GzG5thr7XA11pUF9Tmu4zBJX9tHcFqGolhZlbnmte+YmjWDEHfiYB/7oHQBD06Z3c6Zo
         uqJ9tt+ExDpV4N0P5rpdgBo84ofRH7P6Und9FG702mQ01iCkNPSk78nHl0OZCmgLpKDE
         zZKbJiu6IUYfKsmE5i8a0L+q/CJ24/bOhLJsxOOjRWFEMkwZxrRzQYYVJCZlLTyOznj2
         IrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718374504; x=1718979304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QR9tmd+yNNNniijbyRPGMlyIsNhlrnteAwcBJgKWpb4=;
        b=FGNiFAWxtlvi10IpPqgYEh/5sCAyvdnBMQJewTQLPoVG10FnTa0Vuo8no9SkFIGqCL
         InMqRLYjcsSCk//AcH3UVIv0/CrN+GMACGnk+CehcCVMbQMVFcdVfsFViwStOUGlTiRY
         nAnNb34vpzWnOD5t5xSN3xVGCzXGPeG6dyMTsAHtv9TijHNKcZileurFb3PIM07gyx7H
         orhpz3BzgP53qk1e/e6fSRA9gT1m6rp5B5RbIWd4Oo7WGZCluQe0TtGs1+LoVilSMR3J
         GXm8onEYaqLgwwJqVHf1YefASsOmKq7fgolLL2w8cVgRPTHRsdys6/JHxvYwWu3lDER6
         QeAg==
X-Forwarded-Encrypted: i=1; AJvYcCXpZJr6gq4wpZP5S5eeBjgoAf6YWUhjPECNUBeqJEDbCIEAOjLdekot755Q4EeBU5j/EGbc8ndfaD+c3sGuEkbapSyHbgDud5fQXeM=
X-Gm-Message-State: AOJu0YwWzjcrhrUBYaZX9aYlhyuh6J0XnvHy4C3HsW7RWNcTV7bFAjHt
	RlBrYQnwlMTL5iFrMJHfP2TMcYXdoHzerZx2NcOCCFeaD4SoiRXDGbi7h8mrFFpPLooqiR5j9DD
	byWHspdeibmlRSt8zoTz8+4rlxCj1EfU+n28KAA==
X-Google-Smtp-Source: AGHT+IGcfTO/OhWSnVz2aND6Cyuzd7ym0of3S6kctgW5UO9hM206VYdzcBCkxxrr6TybHlFMyjilw6ZJrQYVoc1c1uI=
X-Received: by 2002:a17:906:34d9:b0:a6f:15a3:b085 with SMTP id
 a640c23a62f3a-a6f60dc5539mr173229766b.51.1718374503888; Fri, 14 Jun 2024
 07:15:03 -0700 (PDT)
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
 <20240614123345.GN6019@pendragon.ideasonboard.com>
In-Reply-To: <20240614123345.GN6019@pendragon.ideasonboard.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 14 Jun 2024 16:14:52 +0200
Message-ID: <CAEHHSvaWO7m=n5_f0BM7gwuDMfh_GMX=x3DknG28PnmtZbrGQw@mail.gmail.com>
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

Le ven. 14 juin 2024 =C3=A0 14:34, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> a =C3=A9crit :
>
> On Fri, Jun 14, 2024 at 12:38:15PM +0200, Julien Stephan wrote:
> > Le mer. 12 juin 2024 =C3=A0 10:06, AngeloGioacchino Del Regno a =C3=A9c=
rit :
> > >
> > > Il 10/06/24 16:39, Julien Stephan ha scritto:
> > [...]
> > > >>
> > > >>> +     writel(0x10001, input->base + SENINF_TG1_SEN_CK);
> > > >>
> > > >> Unroll this one... this is the TG1 sensor clock divider.
> > > >>
> > > >> CLKFL GENMASK(5, 0)
> > > >> CLKRS GENMASK(13, 8)
> > > >> CLKCNT GENMASK(21,16)
> > > >>
> > > >> Like this, I don't get what you're trying to set, because you're u=
sing a fixed
> > > >> sensor clock rate, meaning that only a handful of camera sensors w=
ill be usable.
> > > >>
> > > >> Is this 8Mhz? 16? 24? what? :-)
> > > >>
> > > >> Two hints:
> > > >>    - sensor_clk =3D clk_get_rate(isp_clk) / (tg1_sen_ck_clkcnt + 1=
);
> > > >>    - int mtk_seninf_set_sensor_clk(u8 rate_mhz);
> > > >>
> > > >> Please :-)
> > > >
> > > > Hi Angelo,
> > > >
> > > > I think I get your point about not hardcoding the sensor rate, but =
I
> > > > am not sure how to use
> > > > a mtk_seninf_set_sensor_clk(u8 rate_mhz); function.
> > > >
> > > > Where would it be called? How is it exposed to the user?
> > > >
> > >
> > > As for where: setup, streaming start, resolution change (which may be=
 covered
> > > by streaming start anyway, as a change should be calling stop->start =
anyway).
> > >
> > > And for the how is it exposed to the user - well, depends what you me=
an for user,
> > > but it's all standard V4L2 API :-)
> > >
> > > Last but not least, I can give you another hint....
> > >
> > > struct media_entity *entity =3D (something_here);
> > > struct media_pad *mpad;
> > > struct v4l2_subdev *cam_subdev;
> > > struct v4l2_ctrl *ctl;
> > > s64 link_frequency, pixel_clock;
> > >
> > > if (entity->pads[0].flags & MEDIA_PAD_FL_SINK)
> > >     return -E_NOT_A_CAMERA_SENSOR_WE_IGNORE_THIS_ONE;
> > >
> > > pad =3D media_pad_remote_pad_first(&entity->pads[0]);
> > > if (!pad)
> > >    return -ENOENT;
> > >
> > > if (!is_media_entity_v4l2_subdev(pad->entity))
> > >    return -ENOENT;
> > >
> > > if (pad->entity->function !=3D MEDIA_ENT_F_CAM_SENSOR)
> > >    return -ENOENT;
> > >
> >
> > Hi Angelo,
> >
> > Thank you for the detailed explanation :)
> > However, I can't make it work because in my case, seninf is connected
> > to an external ISP
> > so pad->entity->function =3D=3D MEDIA_ENT_F_PROC_VIDEO_ISP.
> >
> > How can I get the pad corresponding to the sensor?
>
> You don't have to. You can drop that check, and get the link frequency
> of the source subdev with v4l2_get_link_freq(), whatever it is.
>
> > > cam_subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> > > ctl =3D v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
> >
> > Is this mandatory to implement V4L2_CID_PIXEL_RATE ?
> > Should I return an error if not found?
>
> Does SENINF need to know both the pixel rate and link frequency ?
> V4L2_CID_PIXEL_RATE is very ill-defined, at the moment it only makes
> sense as a value relative to the sensor pixel array, and doesn't really
> apply further down in the pipeline. What information do you need to
> program the SENINF ?
>

Hi Laurent,

I need to know the clock divider for the sensor

Cheers
Julien

> > > /* multiplier is usually bits per pixel, divider is usually num of la=
nes */
> > > link_frequency =3D v4l2_get_link_freq(cam_subdev->ctrl_handler, multi=
plier, divider);
> > > pixel_clock =3D v4l2_ctrl_g_ctrl_int64(ctl);
> >
> > How to know the sensor clock given link_frequency and pixel_clock?
> > Can you point me to drivers doing something similar?
> >
> > >
> > > ....now you know what the sensor wants, set the seninf sensor clock a=
ccordingly.
> > >
> > > Cheers
> > > Angelo
> > >
> > [...]
>
> --
> Regards,
>
> Laurent Pinchart

