Return-Path: <linux-media+bounces-28561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E52A6BA04
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 12:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3FEF188818A
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 11:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A61122423F;
	Fri, 21 Mar 2025 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LtxDAXsU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075AB1EDA18
	for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742557123; cv=none; b=gGnZeWOYbq0HC34/mjcq9Avr207+rSDSu3MyZ/0hGldMQ9Vve8mf9K6n1kt9z+6tBnJSO9wGLxmZpF2a++XFsf6y/MVMYzSQ6oIR7Ee+kwi4fBc+HLY0p8py4hXBEpYQ6uV2HaHmbG/tJAheFoBfcOWBzLo/uhUb4R/Q+ISj0Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742557123; c=relaxed/simple;
	bh=XwFMn8HLV1VnsC4ILT2AFZ64hgz+9OtVhoMcZFoShpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gam4ajtEXZC3kPNusThQ9YVvfrN4IYpxs5uyLBkqg/JkimQXOeSGk8wNPq4T0lnq3qkilYFqhdehjlJzQtbyl2H775e6+0w24eYd1eehet//NGE7B1KuWbP1CbjC0P5WG+cK8e5XU57wg2iS0vpWZI7d900m428RnGQ3PcVoEac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LtxDAXsU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549967c72bcso2218591e87.3
        for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 04:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742557120; x=1743161920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2iOOEC10rm8+xq4/YpHZdBddKz9MN7zMwgz3IKXrJ4=;
        b=LtxDAXsUoGMkJbmi0Luzde+LVlq2PMwrfQVibf0fGZZSaZjBqlgpmIZujo8AfJaoKF
         R4pvpvUK7PxdcOJnDAvzvnZyaqfOMbAVCAuozC/5W/P6QHVj6vLMYdPayKoEoHzB6wtM
         VNA4IaC4PofoaG11Z2U/hidmvDGwZmxVQsT5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742557120; x=1743161920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2iOOEC10rm8+xq4/YpHZdBddKz9MN7zMwgz3IKXrJ4=;
        b=hx3AlFnkiuN4MFU0ZISmBEY84cxVT9eOKcAs+g2HKEeQfMq7+zUKluIacY1AjKDjzT
         abu1T2X2GdEST1ee5dqMkoETWfMOAUiwUvaqjez2Hse2GA724ppl/WBnwIJpTd9zXrBd
         2Q0LeKB0Ra09ZTwwQGX0e6/M7mH/EZMqB/iZwxlowbuB8KcLEOSIU5rrafl+p8cEwt+d
         mbdw0pkmYmWqjUEsDOZfN+VH8lJ8P1/anvbGI/fokbX5PCOf6fNDFCG5OesxoXJRQNWS
         hKgldgeqktOLzIHplou/K4DvPgDPz6Ke6lhPAED1AKziOcIYWR2TnhrNjGrOenMbuQmX
         knQw==
X-Gm-Message-State: AOJu0Yx1LhJqDyRlSHpGarCIGnDwLeKj6bN5MPzeZeGbrkuWnfyiKqFU
	Zmr7MZKhNNrgE+GNchULKa98atszVDhKCvle8VLZ7Z89+mXewyVjGvO+N5JYSy1wzKOC0N43fTA
	=
X-Gm-Gg: ASbGncv2R8lTkcSfgCOkw9n9O+iFORykatXj10xKXacz2haCN4aEwltNsobOV0ExJAF
	gyt3xnyiiwXxlZsFQoEtBRcTPecLHL2ct0Fhm3ioAARMytKYKaB2CIFuBPEubWrJy802bJvaZRP
	XInOmpUEguFpDYQLJZ7eARgLoaCgMiP+8FB/PaBG0RKCK/wnKHDYe2mOF2nb5vmbzcnciP/J94s
	ypkz6EdwhjbX9E5AMCQ1hB8UKZt7NQ5rnZr/gmRM8gqNTHpjIEFpI9H1fcREN+gRFtPlPH9vUof
	BvE0w19H5biAi3Sv50p5twHUHD6E+ccuGwKkH/xR8CivWxZU4A96Xkaz+/1FVlefafmcWlaX/Iy
	ORXFswI8=
X-Google-Smtp-Source: AGHT+IFz34JhXwxsebd+Zrj7ohUfCpPAxtm5frmAVVZ0vlfUPCioY7M+eOe8pGhr4nY0yUpcM/hahQ==
X-Received: by 2002:a05:6512:2351:b0:545:a2f:22b4 with SMTP id 2adb3069b0e04-54ad64b30ebmr721633e87.40.1742557119797;
        Fri, 21 Mar 2025 04:38:39 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad646931esm165438e87.42.2025.03.21.04.38.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 04:38:39 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-549967c72bcso2218570e87.3
        for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 04:38:39 -0700 (PDT)
X-Received: by 2002:a05:6512:398d:b0:53e:3a7c:c0b5 with SMTP id
 2adb3069b0e04-54ad646ec03mr866695e87.10.1742557118741; Fri, 21 Mar 2025
 04:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+q66aSkTee-JbFg2Yg+NddiVYJWdf4P86tiUF=bo1iahCOFMQ@mail.gmail.com>
 <CANiDSCvb8G9m1Fif-HSQQLQZrAJTTEzhNGf=kkQQXBCpR8svEQ@mail.gmail.com> <CA+q66aSipHBid9swM_rWf7ewB31GmMX4ThfKWkQ23JqUDpNtDA@mail.gmail.com>
In-Reply-To: <CA+q66aSipHBid9swM_rWf7ewB31GmMX4ThfKWkQ23JqUDpNtDA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 21 Mar 2025 12:38:26 +0100
X-Gmail-Original-Message-ID: <CANiDSCthwYj6ijX68EQz=YO9ra24EME+MSL2msA867Kj0Ayg1A@mail.gmail.com>
X-Gm-Features: AQ5f1Jr_2TJOEpV-tXh4MvepSZQJ0ppcOxmyhsS83eIzxggamicQ7SW6LO3SF8Y
Message-ID: <CANiDSCthwYj6ijX68EQz=YO9ra24EME+MSL2msA867Kj0Ayg1A@mail.gmail.com>
Subject: Re: Missing support for webcam HP HD 2300 (0bda / 5822)
To: =?UTF-8?Q?Micha=C3=ABl_Melchiore?= <rohel01@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Micha=C3=ABl

Could you try setting quirks to 16?

rmmod uvcvideo; modprobe uvcvideo quirks=3D16

and then try the same test (you can also try Cheese after you capture the l=
ogs)

Regards!


On Fri, 21 Mar 2025 at 11:49, Micha=C3=ABl Melchiore <rohel01@gmail.com> wr=
ote:
>
> Hello Ricardo,
>
> This webcam is indeed connected through a KVM USB port.
>
> I followed your instructions with the webcam first connected through the =
KVM and then directly to the laptop. See the attached logs.
>
> Please noted I ran the command yavta -c /dev/video2 since this laptop alr=
eady has an integrated webcam, registered as /dev/video0 and /dev/video1
>
> Thanks for your help!
>
> Micha=C3=ABl
>
>
>
> Le ven. 21 mars 2025 =C3=A0 10:56, Ricardo Ribalda <ribalda@chromium.org>=
 a =C3=A9crit :
>>
>> Hi Micha=C3=ABl
>>
>> By looking at your dmesg.log. This sees to be the culprit:
>>
>> [123030.111453] uvcvideo 1-8.4:1.1: Failed to resubmit video URB (-1).
>>
>> Unfortunately, it happened before you enabled the trace in uvc.
>>
>> Could you try again but this this time do this:
>>
>> 1) enable trace
>> 2) connect the camera
>> 3) try to capture frames with yavta.
>> yavta -c /dev/video0
>> 4) share the logs
>>
>> Also try to connect the device to a different port in your notebook,
>> preferably being the only thing connected to that port.
>>
>> Thanks!
>>
>>
>>
>> On Thu, 20 Mar 2025 at 23:30, Micha=C3=ABl Melchiore <rohel01@gmail.com>=
 wrote:
>> >
>> > Hi. I just want to report on a non working webcam. Details is as below
>> >
>> > Device details
>> >
>> >  1. Vendor Id / Device Id : 0bda / 5822
>> >  2. Device name : Realtek Semiconductor Corp. USB Camera
>> >  3. Vendor : HP
>> >
>> > My laptop details
>> >
>> >  1. Lenovo Legion Pro 5 16IRX9
>> >  2. Linux kernel : 6.11.0-19-generic
>> >  4. My operating system : Ubuntu 24.04.2 LTS
>> >
>> > I tried using this webcam with GMeet, Cheese and Kamoso. In all cases,
>> > I get a blank screen even though the LED on the webcam lights-up as if
>> > it was working: all programs seem stuck displaying a "Starting up your
>> > webcam..." phase.
>> >
>> > As requested in the FAQ, I have attached my dmesg.log and lsusb.log
>> > files. Please note this laptop has an integrated webcam which is
>> > working fine. My problem is with HP HD 2300 webcam.
>> >
>> > Let me know if can help investigate!
>> >
>> > Cheers,
>> >
>> > Micha=C3=ABl
>>
>>
>>
>> --
>> Ricardo Ribalda



--
Ricardo Ribalda

