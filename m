Return-Path: <linux-media+bounces-29363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F4A7B5E3
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 04:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19166188FC3C
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 02:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2086F335BA;
	Fri,  4 Apr 2025 02:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPO/jz4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1669A927
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 02:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743733921; cv=none; b=PwyXBYdJEyDT9Be2c7shcez9YhG2F75HT31nZ1sv1sNZWeBtxcADMViYpmBAij3672freDfKM1RX5X/9coh9Ve50+6P/u3HhZtyqd3Cv6ThIngAbobYPvwZy1guuPw/ntV73BDb64Bs9u6I1dqJywBUvGVs1HIAh9lCChJfrSEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743733921; c=relaxed/simple;
	bh=c7kAqMlpvAqYkhcz8m2tRh8gFIEWkLtfsbunGbqJtk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=rqNKM7AeuBoQiSDglbquspo0tS+Hw265PueEsqUen+1vp20pGiFInATSCtXGyPBVsUzUCWNl3E7wbUPygOZYB8Awy9LxFr+A2YZ9203coJ8wSG9+aKzAyEiPlqkPCaaMsaGa3qSHzDHdUXbKcrF9YrrJMylGIkmmYgaNfhNgHn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPO/jz4Y; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227cf12df27so12018785ad.0
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 19:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743733919; x=1744338719; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVUhEeHv2AMmI2FDJtHTf9jw0TycCm8QfGVhBd2dKg8=;
        b=dPO/jz4YbLtdcSy40kdcGW3LJDNqpOT+KAcjIYfuLHSbZHhxb74hoBYy1Uqktg1VFv
         Xhq9AGee300P5hQFqO8T9QtSpoqdQvQNKHak6IEJToE8JjmzISGzwSu5exVU9MMLGrPB
         xQHeOzaX4SUF6x8De9fKFo82OFrjQmzDOMBPrXMk4/mBeffsq9WSRL6B/L+feTLc4jl/
         USHBrcUGFgPxOxt3rxhlUmqVt5rB/YDXLi1OvyV5iHNtJp8u4g/LsZXmzyovPAvt41VI
         zhQGHihIr01+Pk8GD1BgSBFZ6SdZaPpJSvpY0ZV93ioIEItAtMCPOgT4Azq+2Y7HRNgh
         Sz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743733919; x=1744338719;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVUhEeHv2AMmI2FDJtHTf9jw0TycCm8QfGVhBd2dKg8=;
        b=gHaqH1RzR6ynvPo5MzCVex+fREYdQcECA0fabeya6qCyzg5fMS2V1Ap9Qno2vmJzrO
         CgV1Rp8P9pAgjv6hW1QNdi6BLGsMAPtHqcbs3TMR2m3nUTQTxtCRYy1wRa5eNDB5kAIW
         TftJkzYlQC0eQqinpwwI5RUuOKPO51HHexZ4d0bQO2c8/Sl1pq4gwsigtRV+cnuWkBVi
         dqQ82N4ttvrC1sT+ajTboiVr6FnnEgGGTmybnfEHEUmsR30i1f5q6e3uuw/oq1ZqO1sZ
         G2UFogCgtN0zldqagpOwmpVbdGxBhqz7SWdfYxi7p/A3XbnwZmSCAuM4II4AfPEsKO0D
         fFXw==
X-Gm-Message-State: AOJu0Yza0DnM5Tep9sGafiqoPf3LDbdEgxCzUVtdboUEq2szIGCb5KRY
	tBj4+OUeBPuazRX8KQbKjgl6GjoLLg4GslyqLNzWuUXrgk15boeVWXKil2LQ2zIs9gAbbxu3aMk
	zTrOaLhEgJPMZMb99YdWRQrOrgmU7+w==
X-Gm-Gg: ASbGnctnw222tDU5QONNpw76GRahStxMluT5O2F/TgVco1Ftja6WpRjmBd1McGjHsLf
	oyXIUQ1a35W/pkBuJ4Gn4B+NTM61g0IE8e3iGNvR6ngEh8m3OHV12+Y1XgnIW1iLoUBf/UHTYuI
	EbiB5tyBEwuCYcLj4shP3iHJYAR2fu
X-Google-Smtp-Source: AGHT+IEy3UOMbr5jSCXPpJ4NaljIHZ8GGZ0UnSwUyFRP4XDzZ6e5dPfR4ItGkq8OQ5SAtYXy7kGC03v4myRohCq34EM=
X-Received: by 2002:a17:902:f542:b0:223:4d5e:7592 with SMTP id
 d9443c01a7336-2297671cb44mr65357395ad.21.1743733918587; Thu, 03 Apr 2025
 19:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1743731669-23605-mlmmj-73d654dc@vger.kernel.org>
In-Reply-To: <1743731669-23605-mlmmj-73d654dc@vger.kernel.org>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Fri, 4 Apr 2025 05:31:49 +0300
X-Gm-Features: ATxdqUELKEtBEWXDp1MypKnDUl6WVJ9skObyvY1UYDYuBDER8iG1YwBl1YT2ioc
Message-ID: <CA+rFky5m7Q-FUwFrxhBWXTvmtk_kRi1uV55yXPvDbuM72a2+2w@mail.gmail.com>
Subject: Fwd: HTML message rejected: Re: [Cin] "Unbounded" floating point
 image manipulation
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fwd from desktop (gmail in firefox) set to plain text

---------- Forwarded message ---------
From: <linux-media+owner@vger.kernel.org>
Date: Fri, Apr 4, 2025 at 4:54=E2=80=AFAM
Subject: HTML message rejected: Re: [Cin] "Unbounded" floating point
image manipulation
To: <randrianasulu@gmail.com>


Greetings!

This is the mlmmj program managing the <linux-media@vger.kernel.org>
mailing list.

Your message to <linux-media@vger.kernel.org> was not delivered to the list
because it contained a HTML part. Only text/plain messages are allowed on
this list.

Please configure your mail client to only send plain text mail.

For your reference, the rejected message follows below.



---------- Forwarded message ----------
From: Andrew Randrianasulu <randrianasulu@gmail.com>
To: Andrea paz <gamberucci.andrea@gmail.com>, FFmpeg development
discussions and patches <ffmpeg-devel@ffmpeg.org>,
linux-media@vger.kernel.org, karolherbst@gmail.com, Ilia Mirkin
<imirkin@alum.mit.edu>
Cc: Georgy Salnikov <sge@nmr.nioch.nsc.ru>, Andrew Randrianasulu via
Cin <cin@lists.cinelerra-gg.org>
Bcc:
Date: Fri, 4 Apr 2025 04:54:13 +0300
Subject: Re: [Cin] "Unbounded" floating point image manipulation


=D1=87=D1=82, 3 =D0=B0=D0=BF=D1=80. 2025 =D0=B3., 21:39 Andrea paz <gamberu=
cci.andrea@gmail.com>:
>
> Sorry to belabor my requests, but color is a topic that has always
> interested me, from the days of Photoshop 3.0 and then Gimp...
> The following link is interesting:
> https://ninedegreesbelow.com/photography/lcms2-unbounded-mode.html
> However, it is more suitable for image manipulation than for video
> editing, where there are complications. So it is not appropriate in
> our discussion.
>
> However, when I was asking about the operation of the Color Space
> plugin/Tool, it was to know if CinGG uses the =E2=80=9Cstd formulas=E2=80=
=9D used in
> video productions. I will elaborate, but first I would like to pay
> attention to the color models (RGB, YUV, and HSV) which are infinite
> (although in fact artificially limited to the possibilities of human
> vision) and the color spaces which are a fraction of that. The limits
> of color spaces arise from the need not to exceed the hardware limits
> of the devices (gamut). These limits have become std and consequently
> so have the formulas for conversion between color spaces. Not that
> there are not infinite other formulas, but often, for example for
> YCbCr --> sRGB, the same formula is mainly used (see Poynton:
> https://wangwei1237.github.io/shares/Digital_Video_and_HD_Algorithms_and_=
Interfaces_2nd_ed.pdf).


yeah.

At page 298 (in file)


Figure 26.6 shows a set of primary SPDs conformant to SMPTE 240M,
similar to BT.709. Many different SPDs can produce an exact match to
these chromaticities; the set shown is from a Sony Trinitron display.
Figure 26.5 shows the corresponding colour-matching functions. As
expected, the CMFs have negative lobes and are therefore not directly
realizable; nonetheless, these are the idealized CMFs, or idealized
taking characterstics =E2=80=93 of the BT.709 primaries. We conclude that w=
e
can use physically realizable analysis CMFs, as in the first example,
where XYZ components are displayed directly. But this requires
nonphysical display primary SPDs. Or we can use physical display
primary SPDs, but this requires nonphysical analysis CMFs. As a
consequence of the way colour vision works, there is no set of
nonnegative display primary SPDs that corresponds to an all-positive
set of analysis functions. The escape from this conundrum is to impose
a 3=C3=973 matrix multiplication in the processing of the camera signals,
instead of using the camera signals to directly drive the display.
Consider these display primaries: monochromatic red at 600 nm,
monochromatic green at 550 nm, and monochromatic blue at 470 nm. The
3=C3=973 matrix of Equation 26.2 can be used to process XYZ values into
components suitable to drive that display. Such signal processing is
not just desirable; it is a necessity for achieving accurate colour
reproduction!

=3D=3D=3D=3D=3D=3D

Thing us, all this matrix algebra is floating point YET most of video
codecs and signalling to displays (DVI, HDMI ..) operate on integer
math in some range!

Until roughly R300/GF5xxx era (~2003?) GPUs had internal floating
point pipeline BUT accessible via integer textures and renderbuffers!
So, Cinelerra was coded in OpenGL part around this era standarts.

We can make openGL go via fp textures/renderbuffers now, but for
example libavcodec will still give you "pre-processed" integer values,
both for software and especially gardware decoders.

So, unless one deals with sequence of tiff/exrs there always will be
at least one step between what libavcodec outputs (bunch of integers)
and what cinelerra-gg can accept (32fp at best). Probably not big deal
for already-compressed h265, but those video canera raw formats have
their own import module in "Big" NLEs like DVR, as far as I
understand, with various manual/interactive controls.


There was BRAW decoder for ffmpeg by Paul Mahol, but it was left in
patchwork place may be partially because for using it you must
manually debayer etc, and this process ought to be highly visual,
interactive - while ffmpeg at its core batch processing tool, or part
feeding display engine. A bit too low level, perhaps?

As various floating point transforms find increasing use in
applications where ffmpeg desirable/unavoidable (anyone want to code
h264 decoder from scratch?) ffmpeg will be forced to evolve from fast
but unaccurate ~2003 hack, usable only for subset of operations most
common on  consumer/display end into more accurate and versatile set
of functions

But because its developers assume all other developers will just
quietly adapt or due ...I only can hope next update will be manageable
by me.

Back to topic of OCIO vs ICC based color management - I think mid
thread conclusion there was you can get both, as long as you do not
ruin your numbers in unexpected ways. Hopefully cinelerra-gg will not
ruin them accidently now, when Georgy implemented custom,
user-settable  overlay equations and more.

But someone will need to push our existence into mesa, ffmpeg
developers's happy little worlds so some mutual understanding will
have chance to develop (because all those company individual devs too
busy in their narrow burrowing to spend time looking around, away from
spotlights).

Unfortunately, I do not have means to  get to Eu and wave "Stop
ignoring us!" banner. And email based communication easily (too
easily) dismissed, unless you are Big Netflix (or Valve) with money to
throw at.




> Here, I was wondering if CinGG uses these std formulas that are also
> the basis of the LUTs used in CMSs, or does it have its own. If it
> used the same formulas, I would dream of one day getting to color
> management inside CinGG.

