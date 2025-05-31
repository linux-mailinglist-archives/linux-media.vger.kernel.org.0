Return-Path: <linux-media+bounces-33718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6705DAC9B5E
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 477F2189C84F
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 14:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F84123D281;
	Sat, 31 May 2025 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOX0cIYh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BC341760
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748701739; cv=none; b=RAG3cmZw5Ir6jWZ6upKfA0n0OmZcvyQsla3d6ApqQMjxXztiOdoguODZduCGbFvJD6m6Cs6e8kF+xpVhWwXrlmDTz5dBTz4n3d/s2B31KrglVQwH69Q/wke8Mu/JyUsQBp8G4oW6MF7BgDs89ujbPpxu1FilsSvS3/VHQAd396w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748701739; c=relaxed/simple;
	bh=eT4SUW7anaiVr7vSlxvB55149l9Rg3h1/YCPvFTtO8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffhAXjE3lEtSWRR3YMgrAOmxKd0kNrgvJ9scJunKKXFMB8eFVyhV44b+oG24cAZEORDkGaaGdZQ/vywDRdlmUATx0HSl/U7/E5o7LZD0DvBIiIB2+F+H0ntUBKMfDjZLz8zAlTSvXxeAfgr5nL3/gGnYeMxlUVZ2evojrzaHnug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOX0cIYh; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70f862dbeaeso30285437b3.1
        for <linux-media@vger.kernel.org>; Sat, 31 May 2025 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748701737; x=1749306537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgTdBn1/g5kFx+ycodPAflUn1l6iySEChv7drnJ7Ym0=;
        b=mOX0cIYhvsBebNVr8D7D5e0oA4kRVUlKIoeVJ7ksz+oG7w+LTqjZSxklXjidYL/sto
         78juArxzsaO6p84pnQbLt/Qo2iPZRH1tdw1aCKBRx/Uzx4UPHaAFZV9iPAde+e38qwS5
         TrXMzbHXBNeusyTNVxIpOshpDdC1RepCFP8YbPjJfdhxLEpcSjWAMqFo83jIzrFBqwT+
         a6/3fJaXwldXry6Utms7La+grqpBhHM+ADKmsrtrk2qHxIOPdSFSYrENwSqkNoZK1dUk
         8aDRxqSH/R2usD7sV//7LDYMJcp2AGF/0EG2O1lDLiUJeEn4vHpI4lByznjZiJBBQsX9
         dfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748701737; x=1749306537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgTdBn1/g5kFx+ycodPAflUn1l6iySEChv7drnJ7Ym0=;
        b=Ncn3JfUn0RLCAZApRdf+pzCI8NFQsqwAkdFpnkhfF3XeDxys1xTd2tz987Kp5Qt7zB
         c3WgohTyTZ8hnRhGsPPdah7wVp8xAZo3NX+HqinH1JHXtV0TLfLSGLvMIJi6GzBRxevS
         IFTD1bLuUH4gfRWghnmNhQ1U2krdMF+yA/wWFbClCOoxByQuB7EP0dc7wmcTFcmVzlz9
         mGZLi8PoSjR2LJeHtU0OnmnMcoVomlcNf9F2RZrChkVHOBBJRaLaqcknN68RxL5RN2Fu
         1FjB0QDMBb2vF1dbNKVnuMVruAS2W56yvlIXKKIZRfFLIxIcTwMdTjLnIT/uZMi/M52c
         CXCA==
X-Gm-Message-State: AOJu0YzqPf8DRvADgKEOunlnFMBhuDrsbdOM1XC1vVTQ4oHdzpO4x2Ib
	7EslMazHInMtUCeByAVwCXUxKXh1cb2IB8jF7motb/5pJgrue/DtxCyI3eXRqF1CZ7m9WERcFKh
	IfW9uuy3YWxKCfugioJv+tEYtJeVPbsL1UF8f
X-Gm-Gg: ASbGncunoq/AwGKHrdxXF5wlL9nBUp5NH47K4AZQ529m3McnpurVqdx3oNs658hhHzh
	0bP6bmnk/eiQ6SC6Cimm/QdVJ+oDdhomRs5hzf5dqHDi8zdp4HPOtBw8+5DB9mtiA4TOVa7xILo
	jlH6bbbr1ptmFdcTLHHzd2byJ61BsYMxQ4MkRB+VuKT5TghLV+2zdatPWobRc0YGT907leJN0k/
	/EfTA==
X-Google-Smtp-Source: AGHT+IFrXgLudW69F/hDgL03o9lVf16DA2oY3iGe0kC035Pl7lPia2kqxhUhxd0zEBZHoxr3ATG5mJr2I5MgFoD3rcE=
X-Received: by 2002:a05:690c:6a06:b0:6f7:ae31:fdf with SMTP id
 00721157ae682-71057c0d206mr86885547b3.12.1748701736646; Sat, 31 May 2025
 07:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+q66aSkTee-JbFg2Yg+NddiVYJWdf4P86tiUF=bo1iahCOFMQ@mail.gmail.com>
 <CANiDSCvb8G9m1Fif-HSQQLQZrAJTTEzhNGf=kkQQXBCpR8svEQ@mail.gmail.com>
 <CA+q66aSipHBid9swM_rWf7ewB31GmMX4ThfKWkQ23JqUDpNtDA@mail.gmail.com>
 <CANiDSCthwYj6ijX68EQz=YO9ra24EME+MSL2msA867Kj0Ayg1A@mail.gmail.com>
 <CA+q66aQNHdn5SSu918xEQhiGQ8m0d91rX7P=AbXLnX3YukyFig@mail.gmail.com>
 <CANiDSCvjiSJFLq0XzTUt3piurO-oGgNpHjEFAuNoBFkfAZ61vg@mail.gmail.com>
 <CA+q66aSo1tLsbnTsc3w9D_LTnhb1OcoZxSApNBiu7wRP0SyEoQ@mail.gmail.com> <CANiDSCsQtd2tk4XhvH0nbZr=KHymdPDrFwhM4umX8igyFQ3Qjg@mail.gmail.com>
In-Reply-To: <CANiDSCsQtd2tk4XhvH0nbZr=KHymdPDrFwhM4umX8igyFQ3Qjg@mail.gmail.com>
From: =?UTF-8?Q?Micha=C3=ABl_Melchiore?= <rohel01@gmail.com>
Date: Sat, 31 May 2025 16:28:45 +0200
X-Gm-Features: AX0GCFtU2MgyN_qqIuwAb-1TVldjM61CFEP5_ujZkE7G4uSt7Ou28eLvZhI5ZLY
Message-ID: <CA+q66aQ8h01Z1fE0uk+C4jdH_o9CcZ6_1KQ-FzSjL0HrEd0spg@mail.gmail.com>
Subject: Re: Missing support for webcam HP HD 2300 (0bda / 5822)
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ricardo,

This laptop has a built-in webcam, but I wanted to use the HP Webcam HD 230=
0.
I confirm your proposed fixed made the HP Webcam HD 2300working.

Kind regards,

Micha=C3=ABl


Le mer. 28 mai 2025 =C3=A0 20:18, Ricardo Ribalda <ribalda@chromium.org> a =
=C3=A9crit :
>
> Hi Michael
>
> In your original email, the device is:
> USB Camera (0bda:5822)
>
> but in your last log, the device is:
> HP Webcam HD 2300 (03f0:e207)
>
> Sorry to ask.... are you sure you were testing the correct device?
>
> On Fri, 21 Mar 2025 at 13:46, Micha=C3=ABl Melchiore <rohel01@gmail.com> =
wrote:
> >
> > I have never submitted a patch before, but I will try after I come back=
 from work!
> >
> > Thanks for your help.
> >
> > Micha=C3=ABl
> >
> > Le ven. 21 mars 2025 =C3=A0 13:37, Ricardo Ribalda <ribalda@chromium.or=
g> a =C3=A9crit :
> >>
> >> Hi Micha=C3=ABl
> >>
> >>
> >> On Fri, 21 Mar 2025 at 13:29, Micha=C3=ABl Melchiore <rohel01@gmail.co=
m> wrote:
> >> >
> >> > Ricardo,
> >> >
> >> > Setting quirks to 16, the webcam now works. Please find the dmsg log=
s attached.
> >> > What should I do to make it permanent?
> >>
> >> Short term you can set a modprobe.d file with the required options.
> >>
> >> Long term, a patch should be added to uvcvideo.c. Something similar
> >> to: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git/commit/drivers/media/usb/uvc/uvc_driver.c?id=3Db2ec92bb5605452d539a7aa=
1e42345b95acd8583
> >>
> >> Maybe you want to try preparing that patch?
> >>
> >> Regards!
> >>
> >> >
> >> > Cheers,
> >> >
> >> > Micha=C3=ABl
> >> >
> >> > Le ven. 21 mars 2025 =C3=A0 12:38, Ricardo Ribalda <ribalda@chromium=
.org> a =C3=A9crit :
> >> >>
> >> >> Hi Micha=C3=ABl
> >> >>
> >> >> Could you try setting quirks to 16?
> >> >>
> >> >> rmmod uvcvideo; modprobe uvcvideo quirks=3D16
> >> >>
> >> >> and then try the same test (you can also try Cheese after you captu=
re the logs)
> >> >>
> >> >> Regards!
> >> >>
> >> >>
> >> >> On Fri, 21 Mar 2025 at 11:49, Micha=C3=ABl Melchiore <rohel01@gmail=
.com> wrote:
> >> >> >
> >> >> > Hello Ricardo,
> >> >> >
> >> >> > This webcam is indeed connected through a KVM USB port.
> >> >> >
> >> >> > I followed your instructions with the webcam first connected thro=
ugh the KVM and then directly to the laptop. See the attached logs.
> >> >> >
> >> >> > Please noted I ran the command yavta -c /dev/video2 since this la=
ptop already has an integrated webcam, registered as /dev/video0 and /dev/v=
ideo1
> >> >> >
> >> >> > Thanks for your help!
> >> >> >
> >> >> > Micha=C3=ABl
> >> >> >
> >> >> >
> >> >> >
> >> >> > Le ven. 21 mars 2025 =C3=A0 10:56, Ricardo Ribalda <ribalda@chrom=
ium.org> a =C3=A9crit :
> >> >> >>
> >> >> >> Hi Micha=C3=ABl
> >> >> >>
> >> >> >> By looking at your dmesg.log. This sees to be the culprit:
> >> >> >>
> >> >> >> [123030.111453] uvcvideo 1-8.4:1.1: Failed to resubmit video URB=
 (-1).
> >> >> >>
> >> >> >> Unfortunately, it happened before you enabled the trace in uvc.
> >> >> >>
> >> >> >> Could you try again but this this time do this:
> >> >> >>
> >> >> >> 1) enable trace
> >> >> >> 2) connect the camera
> >> >> >> 3) try to capture frames with yavta.
> >> >> >> yavta -c /dev/video0
> >> >> >> 4) share the logs
> >> >> >>
> >> >> >> Also try to connect the device to a different port in your noteb=
ook,
> >> >> >> preferably being the only thing connected to that port.
> >> >> >>
> >> >> >> Thanks!
> >> >> >>
> >> >> >>
> >> >> >>
> >> >> >> On Thu, 20 Mar 2025 at 23:30, Micha=C3=ABl Melchiore <rohel01@gm=
ail.com> wrote:
> >> >> >> >
> >> >> >> > Hi. I just want to report on a non working webcam. Details is =
as below
> >> >> >> >
> >> >> >> > Device details
> >> >> >> >
> >> >> >> >  1. Vendor Id / Device Id : 0bda / 5822
> >> >> >> >  2. Device name : Realtek Semiconductor Corp. USB Camera
> >> >> >> >  3. Vendor : HP
> >> >> >> >
> >> >> >> > My laptop details
> >> >> >> >
> >> >> >> >  1. Lenovo Legion Pro 5 16IRX9
> >> >> >> >  2. Linux kernel : 6.11.0-19-generic
> >> >> >> >  4. My operating system : Ubuntu 24.04.2 LTS
> >> >> >> >
> >> >> >> > I tried using this webcam with GMeet, Cheese and Kamoso. In al=
l cases,
> >> >> >> > I get a blank screen even though the LED on the webcam lights-=
up as if
> >> >> >> > it was working: all programs seem stuck displaying a "Starting=
 up your
> >> >> >> > webcam..." phase.
> >> >> >> >
> >> >> >> > As requested in the FAQ, I have attached my dmesg.log and lsus=
b.log
> >> >> >> > files. Please note this laptop has an integrated webcam which =
is
> >> >> >> > working fine. My problem is with HP HD 2300 webcam.
> >> >> >> >
> >> >> >> > Let me know if can help investigate!
> >> >> >> >
> >> >> >> > Cheers,
> >> >> >> >
> >> >> >> > Micha=C3=ABl
> >> >> >>
> >> >> >>
> >> >> >>
> >> >> >> --
> >> >> >> Ricardo Ribalda
> >> >>
> >> >>
> >> >>
> >> >> --
> >> >> Ricardo Ribalda
> >>
> >>
> >>
> >> --
> >> Ricardo Ribalda
>
>
>
> --
> Ricardo Ribalda

