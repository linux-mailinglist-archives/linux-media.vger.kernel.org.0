Return-Path: <linux-media+bounces-33948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2424FACB9B4
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 18:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D30B189B08A
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 16:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AB32248B0;
	Mon,  2 Jun 2025 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HIMX0fSY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388482C3258
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 16:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748882260; cv=none; b=s9UnP2nwH2atTvta+kMrBk9IJXT8yKecW/azzOV6NU8kiVqer9iLehDRBZcpF52zwKhM6LKyhbH8WCk7N8fgi8MgoPnj1JO93apRk3HIqvSFPyy06TlJHpNMIgcP0CHe0BCefrvlwYX3bR/8AD1e079budQdeaBym6A5Cssty3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748882260; c=relaxed/simple;
	bh=rVB2GycsQvyKE5QG3Rna4kAt1U38SwUBPHmNGU3MrfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LAKrBVSFXVk4weDN/Bw6hsktSwY/WGGtW89Q1wssVw8zJFtGAiw6p5BRCd3Y9obomozfKU20AraL5yTPzrIWrBg15MYc6cG830K9EctJHPh3AnfThddK+oeRq2DPJabSWZXPKFFw4UDqS6qReXygZAGtTgJSTG/hJlOj9h0LBRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HIMX0fSY; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso38751481fa.0
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748882256; x=1749487056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esggCOS0GA/dt9SZuSC/VmOqfVdUNlIuXRi1OF+fKAs=;
        b=HIMX0fSYS7P6FaF+pe2whERCupnCmjKCNz6e+ccNy3ipEO3DFfHuhHtj9uxRMoF5Yo
         qqYNaVKB142DbSm+J/VsKEoH5N35TeyM2fY8o9NIL6CX1j6XJvkcZoG+ByGflOMr0MZQ
         QgQympv7tdbfI86pNEH4T8SzMUSiKnOhSqwN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748882256; x=1749487056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esggCOS0GA/dt9SZuSC/VmOqfVdUNlIuXRi1OF+fKAs=;
        b=ic5oE07GZvnx6sS/x/78q4IDFDv8x7NZzCryF0KYVvZQez8VCxYCnj/WS1zwvbqDpF
         NcKTYRFQP0DYn4uStnK/MXlzAhc6iEw8yEtvMM1n0awEtu9hrQMrDZAJJXguo/AboeoA
         WYITV+/fLNjQABe2nzLd5Fcw7mSdiEl+mL7Kk+cJtc+uQBpN6BturZPbFjFEf8b6TfJY
         eg/dc+OlOzYs0/x9MsKjxnS0nt00hVIv+A9P8+cUC7wA75HXOrae9EbsSQCPMITa3sxA
         jHvVDC6+Cmw+9efJxjNsSj1qO/S4u+QYShc0Q993SezVeqXVUE9CvHr1cNwE8aaYAj7D
         QOLQ==
X-Gm-Message-State: AOJu0YwtmOnamb6ZNvFCCrvEQS8WUi4cnz2gWewxIyPYZ566SO1hzt9i
	9DwDWOaUp8gkFSFDhdExdjUNlmzimWTuI3Hts1/Wf6UrkZUxRPoFPxyts7X34f2rXwtFanOqlbm
	2MZg=
X-Gm-Gg: ASbGncuVdqAc0c67NelQ7P9Ou5g38blgpOQMuka19YnhGncYwMcTOM3V0BI5Wwyto8y
	if0woRiGpF2lgrgPxY8fXeU5v1q/tsGFB4TiYd3VCOooN1o93qoZK8Fk3kHwDfbGZW9RE+cLhzR
	d/GbiKqWCOkC8NhogjYBtXrMVxZVzJsyPAhltBXsuwWlmp5gEiGI57vic0pB3enfjcpuVaujL3r
	pOcX8rlpYzii2Cy+Uj3c4HACWRahRpwOaYhsBe7Q0Rz9T04Q+cCYqkZK5ECPOisE01jXLJ3mxDn
	KXxswkVRAOuKLue5JbsSm3vxo+5j+36/GwT97EPNDfHNZSr6XQTHEdmdTepLl17iXLmzfBzIcfu
	Or69oHTqgaq8b9w==
X-Google-Smtp-Source: AGHT+IFfe2SXWAwVGE3rFgmBpq07aoX50BLIlbqNB2qLjunDIfyJFSj/EGmrIkar1U8aHL4XCrkI+g==
X-Received: by 2002:a05:651c:211c:b0:32a:866e:2ed8 with SMTP id 38308e7fff4ca-32a9ea67212mr37045041fa.28.1748882255947;
        Mon, 02 Jun 2025 09:37:35 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bf510csm15841051fa.111.2025.06.02.09.37.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 09:37:35 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b10594812so5627382e87.1
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 09:37:35 -0700 (PDT)
X-Received: by 2002:a05:6512:3090:b0:553:28a6:4384 with SMTP id
 2adb3069b0e04-55342f54674mr2581755e87.10.1748882254843; Mon, 02 Jun 2025
 09:37:34 -0700 (PDT)
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
 <CA+q66aSo1tLsbnTsc3w9D_LTnhb1OcoZxSApNBiu7wRP0SyEoQ@mail.gmail.com>
 <CANiDSCsQtd2tk4XhvH0nbZr=KHymdPDrFwhM4umX8igyFQ3Qjg@mail.gmail.com> <CA+q66aQ8h01Z1fE0uk+C4jdH_o9CcZ6_1KQ-FzSjL0HrEd0spg@mail.gmail.com>
In-Reply-To: <CA+q66aQ8h01Z1fE0uk+C4jdH_o9CcZ6_1KQ-FzSjL0HrEd0spg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Jun 2025 18:37:21 +0200
X-Gmail-Original-Message-ID: <CANiDSCvT=D-gQvF4o6BGb_iH2xY1ksp9iAe0_jO2B9fKNnkorA@mail.gmail.com>
X-Gm-Features: AX0GCFtEIonb7hEnJeDPLKjjkM0IRfXxkld35nUMG68oYKRvtYe_-DG8Y5Ov9Wk
Message-ID: <CANiDSCvT=D-gQvF4o6BGb_iH2xY1ksp9iAe0_jO2B9fKNnkorA@mail.gmail.com>
Subject: Re: Missing support for webcam HP HD 2300 (0bda / 5822)
To: =?UTF-8?Q?Micha=C3=ABl_Melchiore?= <rohel01@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Micha=C3=ABl

Thanks for the confirmation. Could you share the lsusb for this device:

HP Webcam HD 2300 (03f0:e207)

Thanks!

On Sat, 31 May 2025 at 16:28, Micha=C3=ABl Melchiore <rohel01@gmail.com> wr=
ote:
>
> Hello Ricardo,
>
> This laptop has a built-in webcam, but I wanted to use the HP Webcam HD 2=
300.
> I confirm your proposed fixed made the HP Webcam HD 2300working.
>
> Kind regards,
>
> Micha=C3=ABl
>
>
> Le mer. 28 mai 2025 =C3=A0 20:18, Ricardo Ribalda <ribalda@chromium.org> =
a =C3=A9crit :
> >
> > Hi Michael
> >
> > In your original email, the device is:
> > USB Camera (0bda:5822)
> >
> > but in your last log, the device is:
> > HP Webcam HD 2300 (03f0:e207)
> >
> > Sorry to ask.... are you sure you were testing the correct device?
> >
> > On Fri, 21 Mar 2025 at 13:46, Micha=C3=ABl Melchiore <rohel01@gmail.com=
> wrote:
> > >
> > > I have never submitted a patch before, but I will try after I come ba=
ck from work!
> > >
> > > Thanks for your help.
> > >
> > > Micha=C3=ABl
> > >
> > > Le ven. 21 mars 2025 =C3=A0 13:37, Ricardo Ribalda <ribalda@chromium.=
org> a =C3=A9crit :
> > >>
> > >> Hi Micha=C3=ABl
> > >>
> > >>
> > >> On Fri, 21 Mar 2025 at 13:29, Micha=C3=ABl Melchiore <rohel01@gmail.=
com> wrote:
> > >> >
> > >> > Ricardo,
> > >> >
> > >> > Setting quirks to 16, the webcam now works. Please find the dmsg l=
ogs attached.
> > >> > What should I do to make it permanent?
> > >>
> > >> Short term you can set a modprobe.d file with the required options.
> > >>
> > >> Long term, a patch should be added to uvcvideo.c. Something similar
> > >> to: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/commit/drivers/media/usb/uvc/uvc_driver.c?id=3Db2ec92bb5605452d539a7=
aa1e42345b95acd8583
> > >>
> > >> Maybe you want to try preparing that patch?
> > >>
> > >> Regards!
> > >>
> > >> >
> > >> > Cheers,
> > >> >
> > >> > Micha=C3=ABl
> > >> >
> > >> > Le ven. 21 mars 2025 =C3=A0 12:38, Ricardo Ribalda <ribalda@chromi=
um.org> a =C3=A9crit :
> > >> >>
> > >> >> Hi Micha=C3=ABl
> > >> >>
> > >> >> Could you try setting quirks to 16?
> > >> >>
> > >> >> rmmod uvcvideo; modprobe uvcvideo quirks=3D16
> > >> >>
> > >> >> and then try the same test (you can also try Cheese after you cap=
ture the logs)
> > >> >>
> > >> >> Regards!
> > >> >>
> > >> >>
> > >> >> On Fri, 21 Mar 2025 at 11:49, Micha=C3=ABl Melchiore <rohel01@gma=
il.com> wrote:
> > >> >> >
> > >> >> > Hello Ricardo,
> > >> >> >
> > >> >> > This webcam is indeed connected through a KVM USB port.
> > >> >> >
> > >> >> > I followed your instructions with the webcam first connected th=
rough the KVM and then directly to the laptop. See the attached logs.
> > >> >> >
> > >> >> > Please noted I ran the command yavta -c /dev/video2 since this =
laptop already has an integrated webcam, registered as /dev/video0 and /dev=
/video1
> > >> >> >
> > >> >> > Thanks for your help!
> > >> >> >
> > >> >> > Micha=C3=ABl
> > >> >> >
> > >> >> >
> > >> >> >
> > >> >> > Le ven. 21 mars 2025 =C3=A0 10:56, Ricardo Ribalda <ribalda@chr=
omium.org> a =C3=A9crit :
> > >> >> >>
> > >> >> >> Hi Micha=C3=ABl
> > >> >> >>
> > >> >> >> By looking at your dmesg.log. This sees to be the culprit:
> > >> >> >>
> > >> >> >> [123030.111453] uvcvideo 1-8.4:1.1: Failed to resubmit video U=
RB (-1).
> > >> >> >>
> > >> >> >> Unfortunately, it happened before you enabled the trace in uvc=
.
> > >> >> >>
> > >> >> >> Could you try again but this this time do this:
> > >> >> >>
> > >> >> >> 1) enable trace
> > >> >> >> 2) connect the camera
> > >> >> >> 3) try to capture frames with yavta.
> > >> >> >> yavta -c /dev/video0
> > >> >> >> 4) share the logs
> > >> >> >>
> > >> >> >> Also try to connect the device to a different port in your not=
ebook,
> > >> >> >> preferably being the only thing connected to that port.
> > >> >> >>
> > >> >> >> Thanks!
> > >> >> >>
> > >> >> >>
> > >> >> >>
> > >> >> >> On Thu, 20 Mar 2025 at 23:30, Micha=C3=ABl Melchiore <rohel01@=
gmail.com> wrote:
> > >> >> >> >
> > >> >> >> > Hi. I just want to report on a non working webcam. Details i=
s as below
> > >> >> >> >
> > >> >> >> > Device details
> > >> >> >> >
> > >> >> >> >  1. Vendor Id / Device Id : 0bda / 5822
> > >> >> >> >  2. Device name : Realtek Semiconductor Corp. USB Camera
> > >> >> >> >  3. Vendor : HP
> > >> >> >> >
> > >> >> >> > My laptop details
> > >> >> >> >
> > >> >> >> >  1. Lenovo Legion Pro 5 16IRX9
> > >> >> >> >  2. Linux kernel : 6.11.0-19-generic
> > >> >> >> >  4. My operating system : Ubuntu 24.04.2 LTS
> > >> >> >> >
> > >> >> >> > I tried using this webcam with GMeet, Cheese and Kamoso. In =
all cases,
> > >> >> >> > I get a blank screen even though the LED on the webcam light=
s-up as if
> > >> >> >> > it was working: all programs seem stuck displaying a "Starti=
ng up your
> > >> >> >> > webcam..." phase.
> > >> >> >> >
> > >> >> >> > As requested in the FAQ, I have attached my dmesg.log and ls=
usb.log
> > >> >> >> > files. Please note this laptop has an integrated webcam whic=
h is
> > >> >> >> > working fine. My problem is with HP HD 2300 webcam.
> > >> >> >> >
> > >> >> >> > Let me know if can help investigate!
> > >> >> >> >
> > >> >> >> > Cheers,
> > >> >> >> >
> > >> >> >> > Micha=C3=ABl
> > >> >> >>
> > >> >> >>
> > >> >> >>
> > >> >> >> --
> > >> >> >> Ricardo Ribalda
> > >> >>
> > >> >>
> > >> >>
> > >> >> --
> > >> >> Ricardo Ribalda
> > >>
> > >>
> > >>
> > >> --
> > >> Ricardo Ribalda
> >
> >
> >
> > --
> > Ricardo Ribalda



--=20
Ricardo Ribalda

