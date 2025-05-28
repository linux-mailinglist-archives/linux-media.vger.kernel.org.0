Return-Path: <linux-media+bounces-33553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 041B1AC70CC
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 20:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A62FF4E0A4C
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 18:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5123428CF61;
	Wed, 28 May 2025 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d4FXRBH+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCF8199939
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456310; cv=none; b=oMlwVMy4DYgSULiqnayQJqZO+fYjgJWyu6geMiy4LbznlMEDegavLbQSoJQzRjoBAu4Q4ji8A1ZynpqfFbwdpkozC4qR++dZ73tubN00rnbnZYke1To3Qa98BxwVnJJTrYq7H5EDQe07wyqAdtPVw4kpGJxYI0heX1pmZS7x4aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456310; c=relaxed/simple;
	bh=6gBrNiC+NaIDs3ADdGZzQILZWuFY4xVh1jGuQDWImdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ult02S6O+cgkXYutol8gs4ZSOU9c0WHDgevAVh96RNgkc0Mi/fomS9rgTc61KuPQdWo28x6g94cYVUWLymlrZwR4e2lKvORSxy4owg6L88ykAVvSh0pMvIcpqCavmikuhjdWfrLUA9vMoTP+wR+3/CUh4DjF7yULkF5fxCeOLdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d4FXRBH+; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32923999549so479561fa.2
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748456306; x=1749061106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRp+V0HV0mVraNOeN9022BfyyPuk2W/wDSjr+K3uRmw=;
        b=d4FXRBH+Hfgtqng9D4n16akO0XuPMUdeaILnP2BezS3kmwteu5Ckm05VtswyqNckI+
         XVxMQjXCRCwVgwpZCYkTX2hGIKKXhoFhROk4Kw063abFUtar4Mb36z3rXyVipwEaY1pr
         V54eDBENZGA7jFdkKBjyVPdimD8zH1OBUSyT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748456306; x=1749061106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRp+V0HV0mVraNOeN9022BfyyPuk2W/wDSjr+K3uRmw=;
        b=g2nWrLzLHtKqSMcFwD4avaLiGvh+IHUr13AQm4DrWLfXBjFFIgYdtJRf5tC/ee7whD
         nya/qM/+qmh/RYNT6z2Mxmk5Ln4oBqbmxK1VtMtxCsrAWcHBpDU1k75pMSnCehc+t4QP
         C8GE0tjz8MudIXdxLNcAFHLe98svDCKridiEbeFu1hIEF2VT/+4HoxApm7JZJ6I9YhuM
         H4r73qnKGfr2q2mQHNXh20vBdfk8ziXoNFupcH/mX5ox6Jur7RoMyhRmdpdDmSAbSTBc
         HPvSwPj694SCLsn1aom7mom8aLD89D0lHuzXBkcHi1EZji/IZeJxd/b62gyhBLtcS8Lo
         4bgQ==
X-Gm-Message-State: AOJu0Yzqpj+KWlW+qNuPhxJ/1d28uKGHouTwMmWLBL5iWMF72QinbzQ+
	0y4yqCwUubYP96nIhjoZs1OSJCCrsbhnAcU+rjS3bqC4wKuJIrGZ6eEg6f9hUUcyHUvnKGHIk+L
	J/J8GTrpb
X-Gm-Gg: ASbGncs5Myklbc1HlfOVfzeolQKBiAQ1WRg4hrC0yd4aW/GVv58FWileG7I52a2+OB6
	mPF08Xuu9bcIENjeh+vAq4yuLlNqDjZty8Pozyrx9mnFQO4uyO6nRX2Gb7/+I+aPfM8yz7aF6OV
	uVxpoNlXsMth4mAExIpXfm01YBLSmwWFnm2GubTzTeWqXkg7GJoVUHOrIVwF2qIqoRiFEcSUhC7
	Ov73bd/Y+UgI6vGGH/1y2uW1R/tGlvDA/1GcD60HAgkZ2ibwkBm3oxl/0WAm48935kRg1/sBp+A
	+vvmqMnTj7QsYVxlxFk8C65MeZRBxFdjNZq31GxxwogyN/zX0tersz1owC1KwW5F2Ex4e6Y1Nvo
	OARYUYVJ9lWrepg==
X-Google-Smtp-Source: AGHT+IHew/rWHKJwe8I0RXjhctkU3K5W2fOkox/FPSwUuTD20lyAFw3ewzyHW0lBdqOo4xYwKUhezA==
X-Received: by 2002:a2e:b888:0:b0:30b:ad2c:dfe4 with SMTP id 38308e7fff4ca-3295ba5e23emr64191691fa.30.1748456306468;
        Wed, 28 May 2025 11:18:26 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79ee1856sm3412091fa.57.2025.05.28.11.18.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 11:18:26 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553331c3dc7so18291e87.3
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:18:26 -0700 (PDT)
X-Received: by 2002:a05:6512:12ca:b0:553:2698:99c5 with SMTP id
 2adb3069b0e04-55326989b58mr2972822e87.39.1748456305616; Wed, 28 May 2025
 11:18:25 -0700 (PDT)
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
 <CANiDSCvjiSJFLq0XzTUt3piurO-oGgNpHjEFAuNoBFkfAZ61vg@mail.gmail.com> <CA+q66aSo1tLsbnTsc3w9D_LTnhb1OcoZxSApNBiu7wRP0SyEoQ@mail.gmail.com>
In-Reply-To: <CA+q66aSo1tLsbnTsc3w9D_LTnhb1OcoZxSApNBiu7wRP0SyEoQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 20:18:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCsQtd2tk4XhvH0nbZr=KHymdPDrFwhM4umX8igyFQ3Qjg@mail.gmail.com>
X-Gm-Features: AX0GCFt4ENqYPgW3YyZVaXkmo_UNwRCR8d5aQar7w6NHaRY9Earzgr8TXv4CB9o
Message-ID: <CANiDSCsQtd2tk4XhvH0nbZr=KHymdPDrFwhM4umX8igyFQ3Qjg@mail.gmail.com>
Subject: Re: Missing support for webcam HP HD 2300 (0bda / 5822)
To: =?UTF-8?Q?Micha=C3=ABl_Melchiore?= <rohel01@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael

In your original email, the device is:
USB Camera (0bda:5822)

but in your last log, the device is:
HP Webcam HD 2300 (03f0:e207)

Sorry to ask.... are you sure you were testing the correct device?

On Fri, 21 Mar 2025 at 13:46, Micha=C3=ABl Melchiore <rohel01@gmail.com> wr=
ote:
>
> I have never submitted a patch before, but I will try after I come back f=
rom work!
>
> Thanks for your help.
>
> Micha=C3=ABl
>
> Le ven. 21 mars 2025 =C3=A0 13:37, Ricardo Ribalda <ribalda@chromium.org>=
 a =C3=A9crit :
>>
>> Hi Micha=C3=ABl
>>
>>
>> On Fri, 21 Mar 2025 at 13:29, Micha=C3=ABl Melchiore <rohel01@gmail.com>=
 wrote:
>> >
>> > Ricardo,
>> >
>> > Setting quirks to 16, the webcam now works. Please find the dmsg logs =
attached.
>> > What should I do to make it permanent?
>>
>> Short term you can set a modprobe.d file with the required options.
>>
>> Long term, a patch should be added to uvcvideo.c. Something similar
>> to: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/drivers/media/usb/uvc/uvc_driver.c?id=3Db2ec92bb5605452d539a7aa1e=
42345b95acd8583
>>
>> Maybe you want to try preparing that patch?
>>
>> Regards!
>>
>> >
>> > Cheers,
>> >
>> > Micha=C3=ABl
>> >
>> > Le ven. 21 mars 2025 =C3=A0 12:38, Ricardo Ribalda <ribalda@chromium.o=
rg> a =C3=A9crit :
>> >>
>> >> Hi Micha=C3=ABl
>> >>
>> >> Could you try setting quirks to 16?
>> >>
>> >> rmmod uvcvideo; modprobe uvcvideo quirks=3D16
>> >>
>> >> and then try the same test (you can also try Cheese after you capture=
 the logs)
>> >>
>> >> Regards!
>> >>
>> >>
>> >> On Fri, 21 Mar 2025 at 11:49, Micha=C3=ABl Melchiore <rohel01@gmail.c=
om> wrote:
>> >> >
>> >> > Hello Ricardo,
>> >> >
>> >> > This webcam is indeed connected through a KVM USB port.
>> >> >
>> >> > I followed your instructions with the webcam first connected throug=
h the KVM and then directly to the laptop. See the attached logs.
>> >> >
>> >> > Please noted I ran the command yavta -c /dev/video2 since this lapt=
op already has an integrated webcam, registered as /dev/video0 and /dev/vid=
eo1
>> >> >
>> >> > Thanks for your help!
>> >> >
>> >> > Micha=C3=ABl
>> >> >
>> >> >
>> >> >
>> >> > Le ven. 21 mars 2025 =C3=A0 10:56, Ricardo Ribalda <ribalda@chromiu=
m.org> a =C3=A9crit :
>> >> >>
>> >> >> Hi Micha=C3=ABl
>> >> >>
>> >> >> By looking at your dmesg.log. This sees to be the culprit:
>> >> >>
>> >> >> [123030.111453] uvcvideo 1-8.4:1.1: Failed to resubmit video URB (=
-1).
>> >> >>
>> >> >> Unfortunately, it happened before you enabled the trace in uvc.
>> >> >>
>> >> >> Could you try again but this this time do this:
>> >> >>
>> >> >> 1) enable trace
>> >> >> 2) connect the camera
>> >> >> 3) try to capture frames with yavta.
>> >> >> yavta -c /dev/video0
>> >> >> 4) share the logs
>> >> >>
>> >> >> Also try to connect the device to a different port in your noteboo=
k,
>> >> >> preferably being the only thing connected to that port.
>> >> >>
>> >> >> Thanks!
>> >> >>
>> >> >>
>> >> >>
>> >> >> On Thu, 20 Mar 2025 at 23:30, Micha=C3=ABl Melchiore <rohel01@gmai=
l.com> wrote:
>> >> >> >
>> >> >> > Hi. I just want to report on a non working webcam. Details is as=
 below
>> >> >> >
>> >> >> > Device details
>> >> >> >
>> >> >> >  1. Vendor Id / Device Id : 0bda / 5822
>> >> >> >  2. Device name : Realtek Semiconductor Corp. USB Camera
>> >> >> >  3. Vendor : HP
>> >> >> >
>> >> >> > My laptop details
>> >> >> >
>> >> >> >  1. Lenovo Legion Pro 5 16IRX9
>> >> >> >  2. Linux kernel : 6.11.0-19-generic
>> >> >> >  4. My operating system : Ubuntu 24.04.2 LTS
>> >> >> >
>> >> >> > I tried using this webcam with GMeet, Cheese and Kamoso. In all =
cases,
>> >> >> > I get a blank screen even though the LED on the webcam lights-up=
 as if
>> >> >> > it was working: all programs seem stuck displaying a "Starting u=
p your
>> >> >> > webcam..." phase.
>> >> >> >
>> >> >> > As requested in the FAQ, I have attached my dmesg.log and lsusb.=
log
>> >> >> > files. Please note this laptop has an integrated webcam which is
>> >> >> > working fine. My problem is with HP HD 2300 webcam.
>> >> >> >
>> >> >> > Let me know if can help investigate!
>> >> >> >
>> >> >> > Cheers,
>> >> >> >
>> >> >> > Micha=C3=ABl
>> >> >>
>> >> >>
>> >> >>
>> >> >> --
>> >> >> Ricardo Ribalda
>> >>
>> >>
>> >>
>> >> --
>> >> Ricardo Ribalda
>>
>>
>>
>> --
>> Ricardo Ribalda



--=20
Ricardo Ribalda

