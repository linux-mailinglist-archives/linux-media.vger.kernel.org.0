Return-Path: <linux-media+bounces-28557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85127A6B838
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 10:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09FE1188AE3D
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 09:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FA021D001;
	Fri, 21 Mar 2025 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WXG4m84a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E381F891F
	for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742550984; cv=none; b=do+jqDBRYl4EjBuOMlLsfPodzA5zj5tzuO7lqiDW4KJOpW/W921piTFHWzVcD7A7J1K2uIxxNx3p9oLGtRHZaHllJYWpLM18SuO9iRi2+CWSKBvT6ByIufIxjy3iHqkIctUF8tpxjIoiMp74gW7gAoEWfI7QN+d/7sqS7eWKd78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742550984; c=relaxed/simple;
	bh=3xfB+A5jB0teMZAv/g0K2Kxlec3s7wVOwobnNWSRkiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSQrThVNTNeVJDKe9Dp8FVeCxViKncqx42B5cR6yZpg+/B9F2Z2kRGE8vKAqnrWZNcPtDK1l259Lf5SnFxuS08BT29A0q2XheQ1KI4j4mRTWqIHZMBaDM6gYpT1pry8qWu9PeZ5wEkIau15bEHRlbWAxtePYoVzD3QNdNeI9zuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WXG4m84a; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bee1cb370so18209251fa.1
        for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 02:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742550980; x=1743155780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOqlAPjZrRzOYnHFfuUdD9O/rWeFMZYprqqx28W7RJk=;
        b=WXG4m84adSuOMzvzzMIZ616e4/wHznDZZloH0L1w3TWJVy4E6a2Gu1C9qQKXOGkDMX
         RS3WDQwORz+lav4L+ymy+RlLOiZwBgeICkajlctoMB3ODYzjWQclfndlug/Fo+MiHheh
         /BA7PJsxrd2ye27LhGmBtcUnFy4uUFnEssGls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550980; x=1743155780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOqlAPjZrRzOYnHFfuUdD9O/rWeFMZYprqqx28W7RJk=;
        b=UbrIRNumKpNxI+bTgQLcrOSFvl7ZwePYjjAd7afqdrV7cD/W+BDClDfqVVQsO+o7zU
         CaLTAApZp/AJOeR7bCOIakGWmETlf2xZVmMgKUsZXLfHiyywHhX51SAugLejLzcJ4wpv
         bFfTFUv6WAVnVHO+ao77iDDVsCvYrIYuY/k90n0nUHTU6aQNMR1XN6moO46kpR02qDMe
         p3OPRvYstx8a5MYcbDHakht+v2B5QluZ7+byF1QQuUGoNqDS2dy6lmSrNWDGYAnP4SAW
         FIxlQzEKr/3flJblyTzEqCf8sxN+fKvpEfs/idQOXs/2Kd1SItt33aPsBhEmOiTccrqB
         9ftw==
X-Gm-Message-State: AOJu0YzwNGxAPckkxeg9OIdK2wZyWDgxOko8ZanRb+OK2lEsKbV1uCyp
	x8npVBc6WpnigN25nYV0mg96AtXH9Gb8Ftg346AFl640PUNzcl6cnSiARLUjJe3bDLWnJBHKtRw
	=
X-Gm-Gg: ASbGncu0TI2FyC3PW5kwrNqgUKUZVWq8CI+hV2vVHLvxegLewbdoqBB8FevMRW0D5y5
	vBS0+GBSIVQjjL4ls8/GOi69VQXAd+gQRuf5LZNhbrXGaZDX9FNJClfjrCh2hjEGiwg7yyTIf78
	8gh6IG3Q6ZefJVKRRA/cu4K6x5SnjCz0yKN8UIYu8o3wmXzE9pSquIBmIDEgx7J/g1A4gkvs4MX
	/UwTFDJx1wcqL5ysYp+zVfRvjAU9af1XKitgNYE5kBOzpvmS4IsTBfIxu20XDY4DWrALxoAvJVD
	skLhDJRk/xNOqcQcVCNAbeyJ1QD4O962m7uxofnlg6qWnz7dAus43o9SPZYjCIrthQOazIE66lG
	twLqM4wuNWNs=
X-Google-Smtp-Source: AGHT+IGNNnujeMCrxo/KdDtYgqlGXg/d1Hh0Dl+X/QqVeonqaAro026Hhj7G9lpJcbNcCiz7OnSQew==
X-Received: by 2002:a05:651c:39e:b0:30b:cacd:fd7b with SMTP id 38308e7fff4ca-30d7e21a918mr8236611fa.12.1742550979998;
        Fri, 21 Mar 2025 02:56:19 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f3eb1sm2045251fa.87.2025.03.21.02.56.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 02:56:19 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf8f5dde5so16273691fa.2
        for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 02:56:19 -0700 (PDT)
X-Received: by 2002:a05:651c:1506:b0:30b:c6fe:4530 with SMTP id
 38308e7fff4ca-30d7e20217bmr9099951fa.3.1742550979163; Fri, 21 Mar 2025
 02:56:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+q66aSkTee-JbFg2Yg+NddiVYJWdf4P86tiUF=bo1iahCOFMQ@mail.gmail.com>
In-Reply-To: <CA+q66aSkTee-JbFg2Yg+NddiVYJWdf4P86tiUF=bo1iahCOFMQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 21 Mar 2025 10:56:06 +0100
X-Gmail-Original-Message-ID: <CANiDSCvb8G9m1Fif-HSQQLQZrAJTTEzhNGf=kkQQXBCpR8svEQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jqi_MaAEaUpJ_d9OgNn0RTFv3k8Uf0upTSKYQNyvZNyW5H84FGMs4HmK8g
Message-ID: <CANiDSCvb8G9m1Fif-HSQQLQZrAJTTEzhNGf=kkQQXBCpR8svEQ@mail.gmail.com>
Subject: Re: Missing support for webcam HP HD 2300 (0bda / 5822)
To: =?UTF-8?Q?Micha=C3=ABl_Melchiore?= <rohel01@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Micha=C3=ABl

By looking at your dmesg.log. This sees to be the culprit:

[123030.111453] uvcvideo 1-8.4:1.1: Failed to resubmit video URB (-1).

Unfortunately, it happened before you enabled the trace in uvc.

Could you try again but this this time do this:

1) enable trace
2) connect the camera
3) try to capture frames with yavta.
yavta -c /dev/video0
4) share the logs

Also try to connect the device to a different port in your notebook,
preferably being the only thing connected to that port.

Thanks!



On Thu, 20 Mar 2025 at 23:30, Micha=C3=ABl Melchiore <rohel01@gmail.com> wr=
ote:
>
> Hi. I just want to report on a non working webcam. Details is as below
>
> Device details
>
>  1. Vendor Id / Device Id : 0bda / 5822
>  2. Device name : Realtek Semiconductor Corp. USB Camera
>  3. Vendor : HP
>
> My laptop details
>
>  1. Lenovo Legion Pro 5 16IRX9
>  2. Linux kernel : 6.11.0-19-generic
>  4. My operating system : Ubuntu 24.04.2 LTS
>
> I tried using this webcam with GMeet, Cheese and Kamoso. In all cases,
> I get a blank screen even though the LED on the webcam lights-up as if
> it was working: all programs seem stuck displaying a "Starting up your
> webcam..." phase.
>
> As requested in the FAQ, I have attached my dmesg.log and lsusb.log
> files. Please note this laptop has an integrated webcam which is
> working fine. My problem is with HP HD 2300 webcam.
>
> Let me know if can help investigate!
>
> Cheers,
>
> Micha=C3=ABl



--=20
Ricardo Ribalda

