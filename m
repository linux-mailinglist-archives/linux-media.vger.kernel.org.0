Return-Path: <linux-media+bounces-28566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51849A6BAC5
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 13:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B405A466AD7
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 12:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C433226545;
	Fri, 21 Mar 2025 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LPXW0dvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6341EE7C6
	for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560628; cv=none; b=IzGOEwG2jgVADT+46J8oxvI8pu2zikQf1adDZD2MnQeLnrbDptpTxEyI0+1k0plsmR4rZwiEUrpmrXdoyymSEURbfluEQ5+kuCcrvQitgrMFa8/Lo0h73P2q+AvhX025hrSvbnQdogdnXSWT6serBKH9YIFxn+R2IQ2TeE3ReYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560628; c=relaxed/simple;
	bh=b6Hnd2/silPc8MsWfaEMeP98I7xfrk5gJIdNaI5ybS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAOejq68lemusvkVEoq2khwe83LMQTHQegrTsiBcyj/xlysE94GJJ0v/G3J6D8fcjAAXDj9GMGVrDgpKS3hSMtM5EJA/IbkBWtNKk2R39VF601K54wJSnJpEJwV2CUGqgvQyMjSXoOnwNS2zgp+HEYjOcDX5KbWb2cfPbdXmx6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LPXW0dvj; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54991d85f99so3213000e87.1
        for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 05:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742560625; x=1743165425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VzQiAl9RtEBgUocb8xBBUxZsIVj1Aa9WwwT8yr9++0=;
        b=LPXW0dvjnIGxUsqPw8mottXLvqhzvYmDElvFZR/PdLdTr5Kvx3kE5B/z7hGEN5Gkme
         TFDb2n/Zs9UnvH2dkfNToNCaRRFRgceFGJf+T8jJayZjlMCXNLf5mvs1E4L2P+tklfk2
         KNTDD6T6NueKnshMD2fGlIR+sYEPCGWwEt6qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560625; x=1743165425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VzQiAl9RtEBgUocb8xBBUxZsIVj1Aa9WwwT8yr9++0=;
        b=wTN5WwvRgwDHw80nkZrtu4JFsQiJB9jcMT3B/eU0yGcIT5m+pX1FIvo96zH3NM69dK
         b4aPqGAhPBoKaywCQMKdkvn7zT4FWEQzURjapNqeItDJAe6BfpNgpTJP3AOSi9/SOGeU
         BOcY/QOYe3G/2NYPp6Fw27I4HsXSL+CXX26+JvS9MfwskxFrD8YecYycurmQRp4yhK8I
         j2IdxjnGBKBlPvMkKdPKgUQ8B/H0U7V46M+GtD7nhO9AA+a6J+AJICzRew0/FqHjWual
         8fdvsAUAVJqiGJwncjqxTKoeIANWpM4xM3XcxLWa/Ham7tYeYE6z5epGRgk9RgER8Pi9
         aBZQ==
X-Gm-Message-State: AOJu0Yy+/NQH0cWNWGBRcN4RFxLnaLXi2dpsdY5tYISWjvPaKm3L1hlT
	n7z6WyaKowjodHa9ZvNO/+mNVK9OnLdQbpdeF3sqiChkmiuDp+AVBo4xePjvd/r2mi+IXnFalmA
	=
X-Gm-Gg: ASbGnctV1jph11zyq05S44V5Q+VvIJpKW02kRufXWJHT3sLWRllzfH6I6XznjGHteyE
	M673kXAyEz4ocjjTfY/rfL7Tbdz5UzKMV9i9nRe3qMZTsFwRsR71HEftSj9XBt1ytJsOyaDptCp
	SP7oNYq5+pYDF+OC2fwnnkJJWY0E1FMjD7sqxowwJ2fmQYoUAZ1hynVac7DoJrkzABm2QLaeN0e
	xnZGFwRUI2vz8lonAzwvyUlfNgU8dS2nXVNERW8X0UaZwpHrofSw6jhgYlwoDJPLFJcMKC7e/BV
	XrenpXZ3XusUtNQgbN0e2P3ydQyXtms2jypc01Vsxm/+ne84EgW0frPmPSCRfn1iQ12FRXP1jbA
	6llf9RPQdDJvlrKSFJqKxNQ==
X-Google-Smtp-Source: AGHT+IE+8eHupS0w4T+Az/LMnhOEJtf0xKRP3/Y/a375H4Hw5Ez4qp5BoZKv51/aFL2fTeZXxOdtqw==
X-Received: by 2002:a05:6512:3da2:b0:549:8d2f:86dd with SMTP id 2adb3069b0e04-54acfadce20mr2860899e87.20.1742560624648;
        Fri, 21 Mar 2025 05:37:04 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468671sm181145e87.29.2025.03.21.05.37.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 05:37:04 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso18669311fa.1
        for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 05:37:04 -0700 (PDT)
X-Received: by 2002:a05:651c:150b:b0:30b:eb0a:ed63 with SMTP id
 38308e7fff4ca-30d7d9ab339mr11092161fa.18.1742560623631; Fri, 21 Mar 2025
 05:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+q66aSkTee-JbFg2Yg+NddiVYJWdf4P86tiUF=bo1iahCOFMQ@mail.gmail.com>
 <CANiDSCvb8G9m1Fif-HSQQLQZrAJTTEzhNGf=kkQQXBCpR8svEQ@mail.gmail.com>
 <CA+q66aSipHBid9swM_rWf7ewB31GmMX4ThfKWkQ23JqUDpNtDA@mail.gmail.com>
 <CANiDSCthwYj6ijX68EQz=YO9ra24EME+MSL2msA867Kj0Ayg1A@mail.gmail.com> <CA+q66aQNHdn5SSu918xEQhiGQ8m0d91rX7P=AbXLnX3YukyFig@mail.gmail.com>
In-Reply-To: <CA+q66aQNHdn5SSu918xEQhiGQ8m0d91rX7P=AbXLnX3YukyFig@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 21 Mar 2025 13:36:51 +0100
X-Gmail-Original-Message-ID: <CANiDSCvjiSJFLq0XzTUt3piurO-oGgNpHjEFAuNoBFkfAZ61vg@mail.gmail.com>
X-Gm-Features: AQ5f1JqpAP0RUT6goHBH9cHWWRDp8tBTKFTNgQQfHghKOYLRoqBR7Jd81KhmPqk
Message-ID: <CANiDSCvjiSJFLq0XzTUt3piurO-oGgNpHjEFAuNoBFkfAZ61vg@mail.gmail.com>
Subject: Re: Missing support for webcam HP HD 2300 (0bda / 5822)
To: =?UTF-8?Q?Micha=C3=ABl_Melchiore?= <rohel01@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Micha=C3=ABl


On Fri, 21 Mar 2025 at 13:29, Micha=C3=ABl Melchiore <rohel01@gmail.com> wr=
ote:
>
> Ricardo,
>
> Setting quirks to 16, the webcam now works. Please find the dmsg logs att=
ached.
> What should I do to make it permanent?

Short term you can set a modprobe.d file with the required options.

Long term, a patch should be added to uvcvideo.c. Something similar
to: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/drivers/media/usb/uvc/uvc_driver.c?id=3Db2ec92bb5605452d539a7aa1e423=
45b95acd8583

Maybe you want to try preparing that patch?

Regards!

>
> Cheers,
>
> Micha=C3=ABl
>
> Le ven. 21 mars 2025 =C3=A0 12:38, Ricardo Ribalda <ribalda@chromium.org>=
 a =C3=A9crit :
>>
>> Hi Micha=C3=ABl
>>
>> Could you try setting quirks to 16?
>>
>> rmmod uvcvideo; modprobe uvcvideo quirks=3D16
>>
>> and then try the same test (you can also try Cheese after you capture th=
e logs)
>>
>> Regards!
>>
>>
>> On Fri, 21 Mar 2025 at 11:49, Micha=C3=ABl Melchiore <rohel01@gmail.com>=
 wrote:
>> >
>> > Hello Ricardo,
>> >
>> > This webcam is indeed connected through a KVM USB port.
>> >
>> > I followed your instructions with the webcam first connected through t=
he KVM and then directly to the laptop. See the attached logs.
>> >
>> > Please noted I ran the command yavta -c /dev/video2 since this laptop =
already has an integrated webcam, registered as /dev/video0 and /dev/video1
>> >
>> > Thanks for your help!
>> >
>> > Micha=C3=ABl
>> >
>> >
>> >
>> > Le ven. 21 mars 2025 =C3=A0 10:56, Ricardo Ribalda <ribalda@chromium.o=
rg> a =C3=A9crit :
>> >>
>> >> Hi Micha=C3=ABl
>> >>
>> >> By looking at your dmesg.log. This sees to be the culprit:
>> >>
>> >> [123030.111453] uvcvideo 1-8.4:1.1: Failed to resubmit video URB (-1)=
.
>> >>
>> >> Unfortunately, it happened before you enabled the trace in uvc.
>> >>
>> >> Could you try again but this this time do this:
>> >>
>> >> 1) enable trace
>> >> 2) connect the camera
>> >> 3) try to capture frames with yavta.
>> >> yavta -c /dev/video0
>> >> 4) share the logs
>> >>
>> >> Also try to connect the device to a different port in your notebook,
>> >> preferably being the only thing connected to that port.
>> >>
>> >> Thanks!
>> >>
>> >>
>> >>
>> >> On Thu, 20 Mar 2025 at 23:30, Micha=C3=ABl Melchiore <rohel01@gmail.c=
om> wrote:
>> >> >
>> >> > Hi. I just want to report on a non working webcam. Details is as be=
low
>> >> >
>> >> > Device details
>> >> >
>> >> >  1. Vendor Id / Device Id : 0bda / 5822
>> >> >  2. Device name : Realtek Semiconductor Corp. USB Camera
>> >> >  3. Vendor : HP
>> >> >
>> >> > My laptop details
>> >> >
>> >> >  1. Lenovo Legion Pro 5 16IRX9
>> >> >  2. Linux kernel : 6.11.0-19-generic
>> >> >  4. My operating system : Ubuntu 24.04.2 LTS
>> >> >
>> >> > I tried using this webcam with GMeet, Cheese and Kamoso. In all cas=
es,
>> >> > I get a blank screen even though the LED on the webcam lights-up as=
 if
>> >> > it was working: all programs seem stuck displaying a "Starting up y=
our
>> >> > webcam..." phase.
>> >> >
>> >> > As requested in the FAQ, I have attached my dmesg.log and lsusb.log
>> >> > files. Please note this laptop has an integrated webcam which is
>> >> > working fine. My problem is with HP HD 2300 webcam.
>> >> >
>> >> > Let me know if can help investigate!
>> >> >
>> >> > Cheers,
>> >> >
>> >> > Micha=C3=ABl
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

