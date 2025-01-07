Return-Path: <linux-media+bounces-24359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2001BA04B8D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 22:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71F683A5B1C
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 21:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6131F7589;
	Tue,  7 Jan 2025 21:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CbF+sIj2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188571DF98E
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 21:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285206; cv=none; b=KhINt/+FFqUskHd//GVWcQQsIOuQZeTZobClmu1AankO8g/0MsyD/ck5HTrTV8BXu7KUSeq8aMTlQEGBASLARSvRdHLs6LZL/HmUMPRhAK+fK7HE81FcBVYG6SNCsunFG37gEoPWGt1cD+4xgCh8EET4CYFZYk3qaOU1y0OjEHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285206; c=relaxed/simple;
	bh=Pzz6EqojEC3qlXAQaeyiAn+6opzV9iw4YULOj6h0n6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9HzZ+L1EzZ2Vnspwnt18kwWtZfTtVrZT1seITELtMPQNtiWMIZn7e8OdhduwqArnvXWqRj0IevXnoU4fCsdOIMFCtkF6b6lrErTcA06z15iydNGU7NEV0V7DDNIDjC//KrvTenHpIfbe7piSEEL6wg8og34bybnwgsE6HoUQ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CbF+sIj2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401e6efffcso18559638e87.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 13:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736285203; x=1736890003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvvXiEYDhlrGJfNxULnehjz8DMuZTc4BsGHcaaJjRC8=;
        b=CbF+sIj2P8Yds13qvK5sNfJ3InBe4O0xdEmvtAfF2DNE6ykgBHtZpbMJntAY5Puctm
         fylc4qffMNrBB2C4EAnE1fISE/UyqfhBo81hopW0JW8Sijp51rcVGXxh+V6XLRmiQ0ju
         YnBkFdAIYypOi2XyzJTxDoeKwc9XPnQHjOJUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736285203; x=1736890003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvvXiEYDhlrGJfNxULnehjz8DMuZTc4BsGHcaaJjRC8=;
        b=jHilOP/dPerLBsM4JkBUcQ04fGmSJS4w81pk7NvDWmq/t9PlsGLNyHzGRAttbCElRa
         wBJh3hMzpCVj+Rnc7qME4h+CphYOoBrevKbaaypytgbhNKgQc9l1VwYbMUR3fcyP4ENW
         vZ+aQlrynUKafULd8ovq7FfajBaG4P2Tch89E5WR2CjYsl+RXZMxmDGSFLXGS++0+ufs
         L0wau3SwBdoj2oQhS2lpzERg/vp3MGA7dn8ERu7xeStFmp9peKU1Qkj5G6DVFXYe4/O/
         VpvpZymYWg4IjLbWspxm/aaQzzb2S7tVSvQascPwsl5ohV/9K7ynwh80tR2cvTxpR2xQ
         U3+w==
X-Forwarded-Encrypted: i=1; AJvYcCU7F0DGcZTHdiqcQekjHfkkaJR7hTWaZEBgPCsfYo/62RoOgaA3REv0wxI8ZKZuZfJjHfnIKMOaO3x2sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQbw85NAD/uwNMkHT/Tz8vkA15J6Fl4Z9iVfy4xbc6lxZyA4SY
	Q4t17X3EUF3QR+zuyuOotJf+7QDyZ01mtFDDtoaL6cGZ+BhBqZINgnRQPx4Su9wxCjisrOeeE8O
	0hg==
X-Gm-Gg: ASbGnctchAPWoJxznDCjGWuLSVDzRz7PLgElk7KTuNJbX0jYmJa4g0dK/9DSmQMGGsn
	tv8KguWpnPI2YtrBUwhFzy3AF/SFSH8lRNk6XBF1TKm9N4B7eGDXq0Mzsrg/wLLKjrrArdJvVWs
	6sqEF63Kk+GZPBKsTCx4Q1AVFnD5b3KE+Ue12FkqBeS3ltOE02jHqYfSq1j6YzcIwriSakmTfhs
	wE6a5gd4i2/h+unVuIYZPiie4hZps1ZX0cbV8k3Cp+UXDH8ZUJNx4sCFgRmG6Coz+8hl6wOag6b
	+ViGATBFl/liEuy4UYQ=
X-Google-Smtp-Source: AGHT+IG6jMivv2IVpxMy53TkubHxIuhm7H213Qxv7ZTHdKcGF+eKYvskqFqBm0SNYHnZq1NhmLqiAw==
X-Received: by 2002:a05:6512:690:b0:542:28b4:2732 with SMTP id 2adb3069b0e04-542845bf62cmr67365e87.19.1736285203083;
        Tue, 07 Jan 2025 13:26:43 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422382161esm5125631e87.204.2025.01.07.13.26.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 13:26:41 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401e6efffcso18559593e87.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 13:26:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhCT+QdgNdSc6/pkXOLlLdvlb1cpnKGeWrDLZ5plt6C+t4K87oPHlQtjIWmhVkoZ8x0UR8sKt+HpF86w==@vger.kernel.org
X-Received: by 2002:a05:6512:220c:b0:542:241e:75ae with SMTP id
 2adb3069b0e04-542845b17b4mr91145e87.9.1736285200398; Tue, 07 Jan 2025
 13:26:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
 <20250107-fix-cocci-v5-1-b26da641f730@chromium.org> <CAJvEA4nC8-2aMHUg+iJ8qMNuQKYnmpbpK_iZMhoivOQX14G5DQ@mail.gmail.com>
In-Reply-To: <CAJvEA4nC8-2aMHUg+iJ8qMNuQKYnmpbpK_iZMhoivOQX14G5DQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 7 Jan 2025 22:26:27 +0100
X-Gmail-Original-Message-ID: <CANiDSCt900xLuroAkBhkpVDrz9Y9Eixdn544=uYZd6RnB2Ve3w@mail.gmail.com>
X-Gm-Features: AbW1kvbmVZcz0XhN8C92sN1HNLAf1XzwRGUzZw1xAZfEGwFaTrkttLZuAAID2KY
Message-ID: <CANiDSCt900xLuroAkBhkpVDrz9Y9Eixdn544=uYZd6RnB2Ve3w@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] media: dvb-frontends: tda10048: Make the range of
 z explicit.
To: Kosta Stefanov <costa.stephanoff@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Kosta!

On Tue, 7 Jan 2025 at 18:28, Kosta Stefanov <costa.stephanoff@gmail.com> wr=
ote:
>
> hi Ricardo, according to the datasheet the recommended sampling
> frequency is 55 MHz (BTW, if you look at the definitions in the source
> code and make the calculations that is exactly the sampling frequency
> all currently supported in Linux devices are using as well).
>
> also, I spent few minutes time to make the calculations based on the
> restrains of the PLL build-in tda10048 and in theory the maximum is 69
> MHz. so, if you make next revision of this patch, feel free to update
> the comment accordingly, in short - recommended sampling frequency of
> 55 MHz, theoretical maximum of 69 MHz.
>
> in any case, your assumption is correct and in reality is away less
> than the maximum value you assumed.

I have updated the comments in my local copy. I will resend after a
couple of days in case there are more reviews.

May I ask if you could share the datasheet?

Thanks!

>
> Reviewed-by: Kosta Stefanov <costa.stephanoff@gmail.com>
>
> --Kosta
>
>
> On Tue, Jan 7, 2025 at 12:54=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > We have not been able to find the relevant datahsheet, but it seems rar=
e
> > that the device will have a sampling frequency over 613MHz.
> >
> > Nonetheless, this patch does not introduce any change in behaviour, it
> > just adds a comment to make explicit the current limit: div by 32 bits.
> >
> > Found by cocci:
> > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does =
a 64-by-32 division, please consider using div64_u64 instead.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb=
-frontends/tda10048.c
> > index 3e725cdcc66b..1886f733dbbf 100644
> > --- a/drivers/media/dvb-frontends/tda10048.c
> > +++ b/drivers/media/dvb-frontends/tda10048.c
> > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *f=
e, u32 sample_freq_hz,
> >                              u32 bw)
> >  {
> >         struct tda10048_state *state =3D fe->demodulator_priv;
> > -       u64 t, z;
> > +       u32 z;
> > +       u64 t;
> >
> >         dprintk(1, "%s()\n", __func__);
> >
> > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *f=
e, u32 sample_freq_hz,
> >         /* t *=3D 2147483648 on 32bit platforms */
> >         t *=3D (2048 * 1024);
> >         t *=3D 1024;
> > +       /* Sample frequency is under 613MHz */
> >         z =3D 7 * sample_freq_hz;
> >         do_div(t, z);
> >         t +=3D 5;
> >
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
> >



--=20
Ricardo Ribalda

