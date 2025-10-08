Return-Path: <linux-media+bounces-43902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0EBBC364F
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 07:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01B243BE709
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 05:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1592EA494;
	Wed,  8 Oct 2025 05:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJI89l/0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67620192D68
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 05:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759902310; cv=none; b=RZHHRTRFfQH4VXmNnuSdD3gb4OaljVAXD/HxxbooH7AThLVbol8s4mXoUtIXtpoM0q04NTpDvZoewObKmIhh6EImYlbFKB8cSYqYb2GBESFx7/5ndl/qkkK0eOJgKje2PcCXZ0HAkN/DCyep1b7nNMXqDac48owBecw37HDOIcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759902310; c=relaxed/simple;
	bh=y3ENnxsjvGdO+/N1hWTYhRava8fqxMcu3LUBH2wKiGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uinldYZcAMSubsg+jftjuI9K+/i5p4JkE0FyTsBuGTTBnUTpLpUGuOrdJVq9yfpS14+Yokr0YVwjbl675EV3bWypUufOwXBXoLOVVldaqhM8RIJQFmSW1WKE9DOJ1cS24smS79s1gmze47E2Q6pkA5LzV3pvzkVwMRSkpkFj0l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJI89l/0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e4ad36541so74698965e9.0
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 22:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759902307; x=1760507107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMrA9ECVAZwUgiOwDSSBvdQk3vkFdAvd5oJUQqsaClA=;
        b=dJI89l/0XyujkW5L/n7t2uL8uv2MH2+jiQpPnSCKIjaxqsIjR+pR2Y/hkLAGKwAOlF
         lDxPtFiezq83rmcdZjS1YXIhJwgYWrEbeEcL2U6PcgI9WJgFNBLdAVtFb4xGmMzSs/kq
         +DgNuIaCrmSv+q3MoiE7kstdaDWo7w7W72c3Gku/3xbQD7xo3szNKxRk+FkkgAa+qYIc
         3tkQ2y+LbQLJrtTl5vaIjKko5Q+cFYdtfjCpHL9VFqgMUVosMSfbWkStMne2Ppr7IirM
         ovRLVNZu6cYHssyaR+ZZdrlgZfScNBI1QAvA+J09WH4z/KMw3Rnxs4Ot2eGpds5j291l
         ka9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759902307; x=1760507107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMrA9ECVAZwUgiOwDSSBvdQk3vkFdAvd5oJUQqsaClA=;
        b=wu17OG5yTZhmNI9am8XDbn2i1cTU+e1Vq4wOAo/FNwc7fIvUNDvMWyqMsqZLUtMpmS
         dPnP0I+GF+ztkjYruSygh9YKKsqrtFcDfHNPfuareSUIJHwZIYDZZERR1Rjwrz+FD1sR
         wgYV5KYS7zIRawZ4EMmp/m3Tcwid5vwcm4yqdyVtW46HCmB2TfP38haWWMrkLj588dgF
         PGun3HZt5HHIWnacXWlPDXH6eFf29jCrynr4H/zFCnbYiZxSL5Hhlj2ofrHrOlTjZrk7
         2yYIzo/9crMQFSV1ZkA8jIzBGGHn8Oau2B8QAmVukAJbqG5gBQtX2a+R4zITLFUiNBZQ
         aGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvfeFonpobdvBdXn8DcWg2CZsowyODxLcWtK8g9b/l3Wdcq05ONFCxZRWhJ3ImI1JUVGTWeaADfS0Kjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTrdwBXIRaMHJN7OHjKUdDoR5ktJ9D4y5Wmal71Q9YdNROCjc
	G/xtDZjq/k5jnfIK7HEzAbBXjWH6x7/B2qnrCm/fSVcAdcBtzODz1Hjb8BIbiXqm4oAQnEiJ1pb
	drIsfn2rKNdQuHmfAovEjUy8ynm6+Ma8=
X-Gm-Gg: ASbGncuJwfEgAA5VaX2bf4UCtJvQmcD41dDGJ5/l17uqXDOM3o6jH4vz34ZEh76Scxs
	fuRaAzLW8RV+9u4F7wW9qk9plt4oa7Ap5EwQY0QJ+RKv9wW9FwdkZvq1kATpvzJ3fGVPS8TUGvb
	ztsncTKTx9j9ey4Y5IcKCVh5g4shaiMRerY5vpCbu9J3lBff2jlVhr1mP1bcwPnU8MlbVklgyce
	K4zvBOg+mrNDgilnbmiQWpAKx90AwEVQ47iY1D0umA=
X-Google-Smtp-Source: AGHT+IGztvS3EO/cNIRYVGvR4DZ8zwLuITrFfy/EcAWJFbzbd68GMfyHQ8W0cNkfgVipNkMiDx6l2VYQHC3kXlqK76Q=
X-Received: by 2002:a05:600c:34cc:b0:46e:3550:9390 with SMTP id
 5b1f17b1804b1-46fa9af18ffmr13448945e9.20.1759902306398; Tue, 07 Oct 2025
 22:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com> <3665995.U7HbjWM52l@senjougahara>
 <CAPVz0n3CrVufs8vbw8XnYuwoZoQ2Xsi3V4HimgT0=4RQySzvaw@mail.gmail.com>
 <3862885.G96rZvMJ2N@senjougahara> <CAPVz0n2shn41h4z4PoMdtCXzj+96ak69TCqt7Ag5qpqdWi6UWA@mail.gmail.com>
 <DDBGU9ELXIAW.1RLHSNOPVR9B3@bootlin.com> <CAPVz0n3EB-tw0af+O4acmbvXNHkH62t5v3r3O0nedLs_XJ39PA@mail.gmail.com>
 <DDCCDQMTQG55.1K25Y3U0JE15Q@bootlin.com>
In-Reply-To: <DDCCDQMTQG55.1K25Y3U0JE15Q@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 8 Oct 2025 08:44:54 +0300
X-Gm-Features: AS18NWDLUfrT6G2ttxsWBntZhVB5Szu88XFWQNFiBezo9FYR32OuHM_dRjRAWzM
Message-ID: <CAPVz0n2y230JejNiTk3yT_6voauX1REu=fx21pFbsBByo=X2aA@mail.gmail.com>
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 7 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 22:37=
 Luca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Tue Oct 7, 2025 at 6:02 PM CEST, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 2=
1:55 Luca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> Hello Svyatoslav,
> >>
> >> On Thu Oct 2, 2025 at 8:20 AM CEST, Svyatoslav Ryhel wrote:
> >> >> > > > 12 represents amount of bits used per pixel, 8 for Y plane, 2=
 for U
> >> >> > > > plane and 2 for V plane, total is 12. "but explainable with a=
 comment
> >> >> > > > and improve-able later" why then we cannot use 12 with a comm=
ent? this
> >> >> > > > is all arbitrary. Downstream is not wrong from this perspecti=
ve, you
> >> >> > > > don't take into account that YUV420 is planar and it uses 3 p=
lanes a
> >> >> > > > whole Y plane and 1/4 of U and V which in total results in wi=
gth + 2 *
> >> >> > > > 1/4 width which is width * 3/2
> >> >> > >
> >> >> > > Yes -- but AIUI, the only thing the bpp value is used for the b=
ytesperline calculation. When we add the special case for planar formats, w=
hich doesn't use the bpp value, then the value 12 is never used anywhere. W=
e should at least have a comment saying it is unused. (At that point, we co=
uld just hardcode the bpp values in the fmt_align function -- but I don't m=
ind either way.)
> >> >> > >
> >> >> > https://ffmpeg.org/pipermail/ffmpeg-user/2023-June/056488.html
> >> >>
> >> >> I understand very well that for YUV420, each pixel has 12 bits of c=
olor information. But how many bits of color information each pixel has is =
not useful in the context of this driver. The number of bytes per line is n=
ot related to how many bits of color information each pixel has for planar =
formats.
> >> >
> >> > No, it has direct impact. This is how buffer size / image size is
> >> > calculated since we place each plane consecutive. And bytes per line
> >> > is used specifically in image size calculation. This is common part
> >> > with non-planar formats. Then since Tegra provides a dedicated
> >> > channels/buffers for each plane, configuration of planar format
> >> > includes an additional step with calculation for each plane.
> >>
> >> Sorry, I haven't followed the discussion in detail, but I tested you s=
eries
> >> on Tegra20 VIP and capture does not work, with a SIGSEGV in
> >> gstreamer. Bisecting pointed to this as the first commit where the iss=
ue
> >> happens.
> >>
> >> I compared the input and output values of tegra20_fmt_align() at this
> >> commit and at the previous one, and this is the result:
> >>
> >>                        before this patch     with this patch
> >>   At function entry:
> >>   bpp                        1                     12
> >>   pix->width                 640                   640
> >>   pix->height                480                   480
> >>
> >>   On return:
> >>   pix->bytesperline          640                   960
> >>   pix->sizeimage             460800                460800
> >>
> >> I hope these info will help.
> >
> > Which command did you use? I have tested with ffmpeg and
> > yuv422/yuv420p and it worked perfectly fine.
>
> I have a simple testing script that runs these commands, with
> VNODE=3D"/dev/video0":
>
> v4l2-ctl -d ${VNODE} --set-ctrl horizontal_flip=3D1 --set-ctrl vertical_f=
lip=3D1
>
> gst-launch-1.0 -ve v4l2src device=3D${VNODE} num-buffers=3D500 \
>   ! video/x-raw,width=3D640,height=3D480,framerate=3D50/1,format=3DI420 \
>   ! videorate drop-only=3Dtrue skip-to-first=3Dtrue \
>   ! video/x-raw,framerate=3D50/4 \
>   ! queue \
>   ! avenc_mpeg4 \
>   ! mp4mux \
>   ! filesink location=3D/tmp/grab.mp4
>
> Luca

I can reproduce what you are observing. ok, I will drop this commit.

> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

