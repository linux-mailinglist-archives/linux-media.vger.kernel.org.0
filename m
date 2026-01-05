Return-Path: <linux-media+bounces-49929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B93F4CF4725
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 16:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0FC330EEC38
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 15:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66CE2DE6FF;
	Mon,  5 Jan 2026 15:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d5i9wTa2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914FF27FD54
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626982; cv=none; b=KzcSk2eYHWEvYlc6Qi+mcVrts6F/AnnjsdJmD1Hh3wvTUAN5hpm33HfF1/tzeml32BeQpKRbO9lWzEPyfQQy6THpsLdS0BbomrbRjgV1n2BbgRGSDvs/lTRgvvI/K/z0QTbQPBwnSya/OpjK8LNDTKA0j+3fFPuImRe9Gf94+6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626982; c=relaxed/simple;
	bh=wVFiwFCaN+6MmHP7qawZpv5epVl+edZbriJpg3foN/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtm96McIuJPpR6jOef8upLkK/rBaMpEX0rDRoMg57wedEcX4Akakggfxo0iFe6/bEGmyfFS6hZBQKhQkkbjZUXcvOBo5Oh2vVGb/RDY5g9wRVqDtCteyve9/voUeS2fBb+TWkTFMoQzBcQOo7WQd8ojJyZVKKFiTSFBlhier66M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d5i9wTa2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37b935df7bfso276761fa.2
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 07:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767626978; x=1768231778; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wVFiwFCaN+6MmHP7qawZpv5epVl+edZbriJpg3foN/I=;
        b=d5i9wTa2pd73lzJCYTvmxudRXVoO0YpwaRTMewSKfpTIEVQuAicOma2kChfa9yYGn+
         L+wNVoxnIa4aGRq59oBsUT8fjgcKJVi+K6kSEoDKFqrvtlIjfykRMM06Gv1kX+oxC/mz
         kDkzP7TSBCvLCls57jgJLXxMuHqMhUmKbcMu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626978; x=1768231778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVFiwFCaN+6MmHP7qawZpv5epVl+edZbriJpg3foN/I=;
        b=UGW6odd5orXZoXnJRJuCRBzY5cGBvH3SYaf1zQg69AAGTMhryJO71/DQBtzaUUc4Pm
         eOrdvDV3r88g4AdrESt9gfsMW5dzfbSsmrFqSTLIsaNZiXGg9f2EZPOgZwrKiUAsdKgP
         S/WY2x38WObO1+JKexbvn9zWaVN4IBlEJAOWrVaNhXi5MV0oMaIEKbp1mvVKZzS54DmR
         xld0yWXkhRTFPb5Tz71wZJlJS/GBaV2ve6n9Zc/RXI2ZoTHe6XFkuLyXkxCBDYFmxLmT
         ICcXGE0rcpy8/PY/0Tfh6aJVdZj35iRrPqjtOsAZO5V4k83bf8GGmgKGxEW6l8cxliAQ
         Dwxg==
X-Forwarded-Encrypted: i=1; AJvYcCXPzXjjrkP3Cc+emiZsvS78AYgTJ3aDRb/0uIryI3VfjokDqQAjZk6LESMjIo6BsCH4TNhoWaMWEu+6pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLU2Oen8ZWKTvg3R0XnlS51GnmvSgM5zNs7piDU7NQlWusk4ec
	aPEXjoFPnKFHcbircA59otmMAJ6NfGpOCDg4FJonrh90sRxXqrtiBpO2sUPTnLUfUaKt5c/gfKU
	1F/2LIg==
X-Gm-Gg: AY/fxX68VT3cAcW9Si+ZKIpb/iDsAn+i+YJd+3tEldYW4aYTdnB92tYcEB1LD1lI90x
	mNnYT6btcNjblsU3/TVno4VZUikNPlPT0WUwx9Y+VnOcqTkuttR1vtoofE6tfWgqPmMXXWsrpKp
	H7rTIPPSf5sna3BVr4CGvnw+v1MAT3WzYxa61rt5fPI34OesMYytnyPUZSDo6H8FVIQ7HD5WkHT
	epXMsfJ5O7aV1MLho+qwOgZSktsv+2Uti5bd0mGord9S3ZTfEg4hhJhUSbBNL2MZTrCgmoXnX2h
	1CcyPI3zYSxipyD+BiW73zi91PkNB8IhJoWLLSLR8OZzZNl93OJuPJoFQiq/Mwf1UgLv7dmXtow
	iKR4m2w+96J9QkjcNGhuEL14Zd79zQS/ckbTqragLUwQru7Np+UVoDtvvdbPgn9b1QiLFbwPRfZ
	ss7GySRYo//e/HNZkQfdCrdIC4CxD2FdLxXS936zX7MlhQBf4Ukgej
X-Google-Smtp-Source: AGHT+IHpg4rhloOgvbhvc+/ItgiTwDWk//XlZyx8FOVueM+Zq7OR7UvAxOdrxodyI9J5UsVmT4Hitw==
X-Received: by 2002:a2e:a587:0:b0:37e:69fb:cd5c with SMTP id 38308e7fff4ca-381216b5525mr128151741fa.44.1767626978000;
        Mon, 05 Jan 2026 07:29:38 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812269da5esm133626041fa.50.2026.01.05.07.29.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:29:37 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b9d8122fdso189201fa.3
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 07:29:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUp5J0GhjcWFGeohi1Er21dm6J8TaPN+bI3y3g/QYrycnfs0UMCCwGHmOBj065vBQcsv24mmxvsjqI8yw==@vger.kernel.org
X-Received: by 2002:a2e:a992:0:b0:382:aebc:1b82 with SMTP id
 38308e7fff4ca-382aebc1e8emr49592951fa.32.1767626976294; Mon, 05 Jan 2026
 07:29:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aS8YBLEPwF0-NtJO@eldamar.lan> <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de> <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de> <aVfPmZ8rUm3Vf7pT@eldamar.lan>
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de>
In-Reply-To: <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 Jan 2026 16:29:24 +0100
X-Gmail-Original-Message-ID: <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
X-Gm-Features: AQt7F2qBQEC1VJODXlCb-m5Fcx4Bj5FjDghrxH2sodmPito6_a_megm_dzvXV14
Message-ID: <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD Pro
 Webcam shows flickering artifacts (sometimes)
To: Ralf Jung <post@ralfj.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1121718@bugs.debian.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ralf

Thanks for the bisect and the report.


The patch to remove noprod parameter has been queued for 6.20 :S so we
should look into a more permanent fix soon.

When you say zoom, do you mean the desktop version of zoom (
https://zoom.us/download?os=linux ) or the web version
I would assume that it is the zoom app, that is ignoring the "error"
flag from the frames and showing them to the users. Can you confirm
that? Hopefully we can reach zoom and they can fix it.


Now about the error flag. I have given a fast look at your usb trace
and have only seen 4 frames with "error bits" [1]. Can you add more
tracing?
Do something like:
rmmod uvcvideo
modprobe uvcvideo trace=0xffffffff

Then start zoom, trigger the error and share the content of your
dmesg. It should contain an explanation of why the driver thinks that
the frames are invalid.

Thanks!

[1] I used this filter in wireshark: usb.iso.data[1]!=0x0d &&
usb.iso.data[1]!=0x0c && usb.iso.data[1]!=0x0f &&
usb.iso.data[1]!=0x0e && usb.addr == "3.34.1"

