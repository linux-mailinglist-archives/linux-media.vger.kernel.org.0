Return-Path: <linux-media+bounces-45693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A89C0F75B
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 17:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 20DAC4FD2DD
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 16:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2472F314A63;
	Mon, 27 Oct 2025 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ff/jTan1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DDF313545
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761583812; cv=none; b=FFhL7WOPG8U6BxBEGzPVhdd9bYLNzHuCl/BmASS3/MJpyFDik6EU9+euokVn4zQ9axgVnKTMQyREQba7nlOnAQu/Sn02qOA7Q8yoNiIjSuOH90YU4S9IeDw1E/4bE7j6DdIzABy+b3Shvbzn/w9BeM7ye0/JVAzh+DSbQbwkCN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761583812; c=relaxed/simple;
	bh=f9gyr+50VXCzFRqzh5h2Eocs+kwwPbsfidV5wgRt5Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thOVdm6Dyjtfs2QrdmSim3E8lEzN5Za2o0UTD55ZOjckO8+FKrFGip40ROevgYwN4QOWb7TzqjxFjaAipeo+fW6G8kHl5nOlsOj+dS3muJU2V9ekdp8hL9u3+nAQKK5C51cLDcEvr9dkZspdKGTermCgVBal8jcrmQHjqFzg3gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ff/jTan1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4270a0127e1so3895190f8f.3
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761583809; x=1762188609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llXiWHJLf2syx3blZo0CXJGIyiry1LJYTByzcLi8/h0=;
        b=ff/jTan1lkgWUNpwMGoLzGON5a2N4mfXOajPZajkFvH4cHFDFH+FASZNEuimReQO6t
         h0XaH+V4MjEnkv28OfQ38Tvg38vlkJkkq4RD92MGqt/zQzWhEXU9Bnvg1i80vEXdEdfA
         cPku+D2MAL+xeB9+xGkOr3NIEkdA9WjcUHW/zNNC01W5n8bMhqxRohJO2bTq8sDwdKg/
         TP51AnWBRMZtN4dZo+3KFvGCIG8D3ae6YO8rH91kqj9XOGkFJFFhWjSakU6jYCOY5FpC
         zC7XbRmD/bv7A9azMVoI1YHeqMiVCcNUVfG5RDf6ZRtAqWq+FH1HTRInCvxfxnB2DpZy
         38FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761583809; x=1762188609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llXiWHJLf2syx3blZo0CXJGIyiry1LJYTByzcLi8/h0=;
        b=X8U0ESKKbsczU9wX9s7V9gTW5Oof/S7XoiNVuVSuMDqwz4FW3UKiL/7NngWbx3SNQ5
         6o2TgzjBX2F4KziZBZoVLf6lSF+24T2EdgyQ4FadnHQjTEPWuC5vCH7hcZrDLY+pM+yx
         mTUZ0tlDXEHmFRdL2UCOltiJj2ggh6vibQyP9h4MzPnB6BHxIa1QGlwhhdebHalrx4hB
         lUbdQ35cw1FUxeJDllNk1JDq/BZ55XW1r74cQ9zL0ZCteoypzt/l5EMLq+Hl3SlpLLPf
         7Ky9uIKcS7aeEQs/cLRBLEBwTBJ6wSe+17hbKgM/khOk9q4egTJdbRQYK9WJ7gBNH4wj
         ByOg==
X-Forwarded-Encrypted: i=1; AJvYcCVknvA+43SmSjefFy5/f3Do0Hs/Rd/3iDYBH8yL+DofWvA/SifpAc5RWoK/MHSXcXS+IqTKEeS3iqifMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd1C3IOMQLAlr7XON1vstaKfLkGD9VnY025AXLWyF7KTf8rFLX
	j2/U4uxMy5oHLvTcmUBkwoSAVjfZV62hRYb0FuD5GmwtLN/d29ZPfaNBDMVuDSl1Zp2HrunYjzv
	5k+tP40PvXGNq0ue14bbETVaLJqRgdW0=
X-Gm-Gg: ASbGncvfF6ygE3C6RCOHkm57uOfUHCxd3SVtn+Uvkb9B+R8RU+XG4umMATeJU0XEjlt
	L/szjJR7HHK410ikVuJzWtsz2jvxGIvSepr5dTnGOTj9vQdJwHRsU7lUIsUzOhL4ZYoLWD7U+j5
	Te1u8dKCuqcxkCGU+HSzxK2RVxNZ+Mtb19/bhrhXc7PgvMu1tVpvFxKuL8mvTU2L8eVhpTTsQAd
	GIS+kc5G/HKUoNUPDLf8BIwpbtKA/sV4qxMmIp1dprAavOQhxrvrPECpBFhIw==
X-Google-Smtp-Source: AGHT+IH4XlaBzxcnNj5YFZ0kloDrzQaT1eJpLjTjeIpDU2XpK4VeABDkTozkzcR3WZnwD6TgVQ+f15BePNjDYvfetA4=
X-Received: by 2002:a05:6000:186e:b0:428:476e:e0ab with SMTP id
 ffacd0b85a97d-429a7e97661mr333005f8f.60.1761583808872; Mon, 27 Oct 2025
 09:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022142051.70400-1-clamor95@gmail.com> <20251022142051.70400-7-clamor95@gmail.com>
 <bd6262c6-a31c-43a6-8ec5-2735fb2fe0d2@kernel.org>
In-Reply-To: <bd6262c6-a31c-43a6-8ec5-2735fb2fe0d2@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Oct 2025 18:49:57 +0200
X-Gm-Features: AWmQ_blgGtMyE7YToN26_Q2JZoB8VDufuUc2Jv2Dui7Z-P7sPMVoiu7__HneWyw
Message-ID: <CAPVz0n277DZ8S5wX5n0gCaOpng64uEfx3VVue4Zp0n5bsDevqQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/23] staging: media: tegra-video: vi: adjust
 get_selection op check
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:4=
4 Hans Verkuil <hverkuil+cisco@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On 22/10/2025 16:20, Svyatoslav Ryhel wrote:
> > Get_selection operation may be implemented only for sink pad and may
> > return error code. Set try_crop to 0 instead of returning error.
>
> Can you mention why try_crop is set to 0 instead of returning an error?
>
> That would be good to have in the commit log. And in fact, it's not
> clear to me either why you want this.
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/vi.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/m=
edia/tegra-video/vi.c
> > index 7c44a3448588..856b7c18b551 100644
> > --- a/drivers/staging/media/tegra-video/vi.c
> > +++ b/drivers/staging/media/tegra-video/vi.c
> > @@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegr=
a_vi_channel *chan,
> >       fse.code =3D fmtinfo->code;
> >       ret =3D v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, =
&fse);
> >       if (ret) {
> > -             if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
> > +             if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
> > +                 v4l2_subdev_call(subdev, pad, get_selection, NULL, &s=
dsel)) {
> >                       try_crop->width =3D 0;
> >                       try_crop->height =3D 0;
>
> This looks all a bit magical. Which subdev is queried here? I.e. what is =
the corresponding
> subdev driver that implements get_selection?
>

Camera sensor subdev, Tegra VI driver directly interacts with camera sensor=
.

> >               } else {
> > -                     ret =3D v4l2_subdev_call(subdev, pad, get_selecti=
on,
> > -                                            NULL, &sdsel);
> > -                     if (ret)
> > -                             return -EINVAL;
> > -
> >                       try_crop->width =3D sdsel.r.width;
> >                       try_crop->height =3D sdsel.r.height;
> >               }
>
> It looks odd (esp. setting try_crop to 0), and I wonder if this code path=
 has been tested.
>

Yes it was tested.

Original code checked if the camera sensor has get_selection
implemented and if such operation is supported then it applies width
and height from get_selection, else zeroes. This works just fine with
most cameras and v4l2 compliance tests pass fine, with most but not
with mt9m114 which implements get_selection only for its ifp source
pad while sink pad always returns -EINVAL, hence VI driver fails with
-EINVAL too. To address drivers like mt9m114 instead of just fail with
-EINVAL if get_selection returns error try_crop width and height will
be set the same as get_selection is not implemented.

> Regards,
>
>         Hans

