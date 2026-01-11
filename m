Return-Path: <linux-media+bounces-50357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02833D0E892
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 11:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5BFC300E7AC
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 10:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6D833064B;
	Sun, 11 Jan 2026 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rOd2gvgk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399B62D0C64
	for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768126068; cv=none; b=I0BuKB5ya8RDg8TXdHXNItChNU5VN6NR8d8mP9c5I3TNjQu6wcOlhzX9gBzRFsXk2Nj6T0kGrTsjuqBBBl3z68WJdXrQrdic+pqVvFAb9aCygKOXuU06w180JVu0rChpy2hUyPgrOvihUnubvfrwWdfrk1gM6Gclm14Cg5JAxF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768126068; c=relaxed/simple;
	bh=rxgsSPSKdzxMUHkQo66o1KVIL5tsZtem9fAIcvNkaL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUijyCTw3HBS4QPV566DCeTvYE8qt3iUa1XnAI8BKVNm2pQGP6pN/v+fwOtprd6A1xgPp58igQks3kkbAw7XwOAmWJslH6O3CK7JVs1Jf0BRjxVy3pdePP130xPUM3dqlJZj2lw20l/Ch7AwkdsbAhCaTH+Ns44QZ0Lqav5hFhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rOd2gvgk; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-121a0bcd364so5887030c88.0
        for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768126066; x=1768730866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyMAX1x2Y0epKteEKFdwiyRtITpoGa8ZZ4lTxMaMdXs=;
        b=rOd2gvgkKtBvhFC1JxjvigviSmli356RlgILdEuTgHY/7z5kdsKIbcyytOxGCImQvU
         Nx0OdjxNUGjKSgCcv/A2Lb0c5aOdH1m7E1WTgFPLMH/8/xRq4TD76zbShCPzOxi6ehqP
         nKcxB2a+JW1o9+STg41ElnawApN0YcofMyv+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768126066; x=1768730866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uyMAX1x2Y0epKteEKFdwiyRtITpoGa8ZZ4lTxMaMdXs=;
        b=Wx0z4dDS1URK/81CzHUvQsKUGQCm8xLD+J28X79q/LA+z2aL6/gC1c8HPHWNdIM36o
         keBBCEJV6VPdtxXEMl617pjmOnVoEI1N0/CrsJm7NUpaC0BStDN/7SDFMaXQp2pt5Ncy
         aGIbEpemgcqdLp7StvEf70ObC0bK6SrPgTTKl5hKhAXqfgRbCPy5L6D03tBUG94T6+H1
         /A7OQQyDHNfkN87qdP9rFe/u2LmZJ9sj/AuKRMpyufGz6LZVA3r5wkxDOY8F+G9IQ9IR
         l4Ai5rccAjiDSRCBS1PUFCUqgVozIQ5mdyMeDjoxdAQ06jYRDa/T4ZdmiyQb1kY3Gpzx
         lifg==
X-Forwarded-Encrypted: i=1; AJvYcCVEqi9aV4nrLjiSdPgxdinKi/G46RQfw18wO/woImi4yjyugCG7gUoRadQRghhEcpPiLdXZI2W+RJ6IEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmv/tkAaYpqC+PDuQpRes7rvEJCjDcwBVM5KOjMqC+LBqka4ip
	B4TPzHkSqq1tK8/TNrpf1mvseJE5NhxPRn3uRU1y1PbHoLRk17lXYIhbz25VxTq2JWTkAg+xDZJ
	rVzzR2/LIlJmU9ujjYLf7DnG2HE9HHeej/SgJGQXSv/6eCP9SBdqss05urA==
X-Gm-Gg: AY/fxX5L5CS2tHxPjwNa7oNwgNjKawPwD7X0SIP22w+GlM7pgj+mHbUBU0DRhlkuCIB
	oY9uRj8edLSp2CP4uEZ3ewENPndxEZAF5SGxN2ErqOT9q94OkkfUGqeBNkkpeHs+3Q9WWnypUqi
	Ir7zwKIyPRNtteCTgqiHfJ5JPQ/ZT87SllToK2imWQJlVv5cSYDeNoqr3CevtqwnszTrXAL4SEY
	hrNR6/1jy4qV6PkHloKCZT/zIZJO1/E95MtKsrU38JaXvmNsPHNd6NuEtBKsnVfcPHBSge2hg6Z
	4dRR4gP/NXLGG9nHuG0S7Qf1Mw==
X-Google-Smtp-Source: AGHT+IE8izWSrQAsbRd14p0HLyBpUoq3HIvYZGQLw1U2T1g9mA5JJpHNCuhyWjkRFWsmj5cJZeDqYngThv/1hEhhCmM=
X-Received: by 2002:a05:701a:c945:b0:119:e56c:1899 with SMTP id
 a92af1059eb24-121f8afc35bmr9644174c88.1.1768126066125; Sun, 11 Jan 2026
 02:07:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOf5uwmTTFcizew2QRAr=TZ12hTfXg6NFEsDYKASB7wPeB4odw@mail.gmail.com>
 <7b37c5679994281ae1806f2ee84d1aede77ca836.camel@collabora.com>
 <CAOf5uw=uPkC60gE7Ea_ZnEZdYJRYRJKz=OVUN0RvO_NVe2tw5A@mail.gmail.com>
 <96dc1231c7d18f8106e4b5e56a336add377ee235.camel@collabora.com>
 <CAOf5uwnofTZ1ARzqAD0Tevz_gX1w=Uv5b7Q8=-ZnwQpioZvXuw@mail.gmail.com>
 <4158785f415986924f916f4bfe1988376806f8ed.camel@collabora.com> <c835dbbe-7046-4763-832b-cd81a3b54147@foss.st.com>
In-Reply-To: <c835dbbe-7046-4763-832b-cd81a3b54147@foss.st.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sun, 11 Jan 2026 11:07:33 +0100
X-Gm-Features: AZwV_QiJXOVjIUAjb6caKUfzcqOLyUD9LBUIuaNSwJyc6M_CC3ESW7cgDItU73U
Message-ID: <CAOf5uwnMGZS1d0+2gfp18Ojpd6Z7tELjC3Rzy7pXYTYw0-e8Vg@mail.gmail.com>
Subject: Re: Hantro G1 jpeg decoder stm32mp2 (plain text)
To: Hugues FRUCHET <hugues.fruchet@foss.st.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	linux-media <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jan 7, 2026 at 8:56=E2=80=AFAM Hugues FRUCHET
<hugues.fruchet@foss.st.com> wrote:
>
> Hi Michael,
>
> Sorry for late reply but my foss mail account was out of order for
> monthes...
>
> As you know -but Nicolas may not- I have added the jpeg decoder support
> to upstream hantro driver here:
> https://github.com/STMicroelectronics/linux/blob/v6.6-stm32mp/drivers/med=
ia/platform/verisilicon/hantro_g1_jpeg_dec.c
> It has not been yet upstream but I hope to push that in coming weeks.
>
> Compared to the code currently available on github, the restart marker
> interval support has been added, this is the same fix that the one you
> shared previously.

Very good, and thank you to integrate it

> I have an additional fix about support of unaligned resolution such as
> 800x600 or 1920x1080: will be part of the upstream serie and pushed on
> github.
>

Ok

> About NV16 and NV12 decoder output: these are the only one output format
> supported because STM32MP2 doesn't have G1 post-processor support, so
> STM32MP2 G1 decoder only output the "native" JPEG encoded format on its
> semi-planar form, either 422 =3D> NV16 or 420 =3D> NV12.
> As most of USB JPEG camera are streaming 422, no way, we have to deal
> with NV16...
> Unfortunately, GPU sub-system doesn't support NV16, so waylandsink
> cannot handle NV16 directly: a software conversion is needed, so we come

Let me test it again, for now I have solved for barcode scanning decoding a=
nd
going to lower resolutions and opencl transformation using opencv

Michael

> to the pipeline that you have already shared:
>
> v4l2jpegdec ! video/x-raw, framerate=3D30/1, width=3D640, height=3D480,
> format=3DNV16 ! videoconvert ! waylandsink
>
> with a big performance penalty of software video conversion...
>
> BUT you can limit the performance penalty by forcing NV12 caps after
> videoconvert:
>
> v4l2jpegdec ! video/x-raw, framerate=3D30/1, width=3D640, height=3D480,
> format=3DNV16 ! videoconvert ! video/x-raw, format=3DNV12 ! waylandsink
>
> Doing so, we switch from a costly NV16 =3D> YUY2 software conversion to a
> light-weight NV16 =3D> NV12 conversion.
>
> With my Nexigo930 HD camera I can reach 720p@30fps:
>
> $> gst-launch-1.0 v4l2src device=3D/dev/video7 ! image/jpeg, width=3D1280=
,
> height=3D720, format=3DMJPG ! jpegparse ! v4l2jpegdec ! video
> /x-raw, format=3DNV16 ! queue ! videoconvert ! queue ! video/x-raw,
> format=3DNV12 ! fpsdisplaysink sync=3Dfalse text-overlay=3Dfalse
> video-sink=3D"waylandsink fullscreen=3Dtrue" -v
>
> /GstPipeline:pipeline0/GstFPSDisplaySink:fpsdisplaysink0: last-message =
=3D
> rendered: 93, dropped: 0, current: 30.99, average: 30.00
>
> Hope this could help.
>
> Best regards,
> Hugues.
>
> On 9/2/25 16:55, Nicolas Dufresne wrote:
> > Le mardi 02 septembre 2025 =C3=A0 15:30 +0200, Michael Nazzareno Trimar=
chi a =C3=A9crit :
> >> Hi Nicolas
> >>
> >> On Tue, Sep 2, 2025 at 3:13=E2=80=AFPM Nicolas Dufresne
> >> <nicolas.dufresne@collabora.com> wrote:
> >>>
> >>> Hi,
> >>>
> >>> Le mardi 02 septembre 2025 =C3=A0 15:01 +0200, Michael Nazzareno Trim=
archi a =C3=A9crit :
> >>>>> If you only have one format support, you don't need to force anythi=
ng in
> >>>>> GStreamer. Some extra information about Hantro post-processor. When=
 used, you
> >>>>> need to provide 2 sets of buffers. The decoder will still produce N=
V16, and a
> >>>>> secondary set of buffers is (in parallel, pipeline mode) written ba=
ck into the
> >>>>> format you have configured on the PP register set.
> >>>>
> >>>> Those sets of buffers are provided by gstreamer or how does this
> >>>> handle in practice for
> >>>> other decoders?
> >>>>
> >>>>>
> >>>>> The post-processor can also be used in standalone mode, but this fe=
ature is
> >>>>> often fused out. In that mode, in can input interleaved YUV, as oft=
en produced
> >>>>> as raw format by USB cameras (and most cameras using serial links).
> >>>>
> >>>> Much better. Now I need to understand better about the two set of bu=
ffers
> >>>
> >>> the V4L2 API does not have the notion of primary vs secondary buffers=
 (unlike as
> >>> an example Vulkan Video, which is 20 years younger :-D). So we endup =
hiding the
> >>> primary buffers inside the kernel driver [0]. Just notice the this al=
location
> >>> allocates reference buffers for the decoder, and the decoder actually=
 allocate
> >>> the final buffers. This is quite convoluted imho. Note that some impo=
rtant fixes
> >>> have happen on this part of the postproc code (which arguably still n=
eed a lot
> >>> of cleanup, a proper split between G1 and G2 (and merging back VC8000=
 into G2
> >>> since this is largely compatible).
> >>>
> >>> https://gitlab.freedesktop.org/linux-media/media-committers/-/blob/ne=
xt/drivers/media/platform/verisilicon/hantro_postproc.c?ref_type=3Dheads#L2=
24
> >>> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/=
db300ab0e9d38b1e1b0b561333b66a5beacb9994
> >>>
> >>
> >> Ok, I read the code, but I have some doubt:
> >>
> >> - the NV16 and NV12 are both available as the primary buffer for the
> >> decoder but you don't know until you plug the camera and start
> >> streaming, so I suppose that in this
> >> case the size of the primary buffer should be computed based on the
> >> biggest format.
> >
> > Since JPEG is a stateful decoder, it needs to implement the respective =
portion
> > of the stateful decoder specification. In short,
> >
> > - Userspace should prepare the OUTPUT queue and provide a first buffer
> > - The driver should parse the frame header**
> > - The driver should notify that the resolution/format has been found
> > - Userspace will enum or get the information and configura capture queu=
e
> >
> >
> > ** JPEG is the only codec we allow in-kernel parsing to take place, oth=
er
> > codec must defer this to a firmware or implement the stateless spec
> >
> > With that mechanism in-place, there is no need to allocate bigger then =
needed.
> >
> >> - I think that hantro_set_reference_frames_format assumption is to
> >> keep the one supported from decoder and match the first one match the
> >> bit_depth,
> >>    so it can set as reference the NV12 and not the NV16
> >>
> >> Is this correct?
> >
> > Its the bitstream that dictate which of NV12 and NV16. The main issue y=
ou are
> > facing is that only bit depth (8 and 10bit) has been implemented so far=
. There
> > might be more work to support 422. Note that G1 is unique, since the de=
coder
> > part already support 2 formats. Though, in mainline we did not expose t=
he tiled
> > format (8x4 tiling). So if you have a 422 JPEG stream, your choices are=
 NV16 or
> > 8x4 NV16.
> >>
> >> The postproc_enable happens if we have prepare_run it means that the
> >> buffers are allocated already but the buffer will be known only when
> >> someone
> >> enqueues them to the decoder. In such a scenario is there any driver
> >> already solving it?
> >
> > As this code have only been used through the stateless specification, s=
ome work
> > will be needed to support stateful for that context. CODA960 support mi=
ght serve
> > as inspiration.
> >
> > Nicolas
> >
> >>
> >> Michael
> >>
> >>>
> >>> regards,
> >>> Nicolas
>


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

