Return-Path: <linux-media+bounces-47255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4308FC6885E
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 10:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 789F6364555
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 09:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD413128DF;
	Tue, 18 Nov 2025 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oXcBtlSb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF0D2FE05B
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 09:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457960; cv=none; b=MiEQOrcLtO/zM+4nIrR3nfl02wFpGnTX9il3o3bm5w4QpAsKigijPvCRFiv5QND1BGYnm50BfvI3+Kns+k6It374ItjamRKOnqK2Y4t5siWyVaMBPvhsVJBnSJVzw0hkR8lOBk3U41zjFWA7sP671PGQoi9OCyUakNX5Y9MIYt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457960; c=relaxed/simple;
	bh=dH8EdpnR2i16jftT1azcGeU6nyFTjX9mdLB8VTapQ8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGan/MMc7eylYuzI5HQjdvAcq3+fnrpKDW93UtEJXM7JjEP7GIFa064uN+uLlJl63nIhZ6gW5M6B78ehsZqC5LOC/c5LrObLxKty0c1P0MdCfPXjcKoJJWS2qU1U/+0GQ5/JJol6Jbos+DfAr+KYMzelqT1e9bJo5az1ahxDnPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oXcBtlSb; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5959187c5a9so1525717e87.1
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 01:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763457957; x=1764062757; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+yae1MALCGHKV7TgqqaWxc3cR1A5oospqJfHNyVOwSU=;
        b=oXcBtlSbU2KPc5J+DDYyunNDbx6P5vFFb+GPvgTdULqSI1p0eolhtXxg5pXOPjF4xk
         kHh5WmPKM+TMIoaDkyz1N5hB21bpLxm/LwCzoVmL7GDWQfajaxkmDVUgR5/5nWaEMsfZ
         BjYm+v3cARIVbCATdNHyKTK3qNXbhziLQFU78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763457957; x=1764062757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yae1MALCGHKV7TgqqaWxc3cR1A5oospqJfHNyVOwSU=;
        b=WbMscT/keEOfJIThfExZEmgAAFzrX1mwzY0vnI3RwBhT788J6SyolIubRNem5kNs5o
         oFLyubfgoPO2iOxrpE0+v3cEdMXLI8ZjmOwolBF4oAZ984XhM0gRVLG+XNELRFQaqvPG
         6vdCwhvLpf0D3qux3ADU6f4mAa7xmweZ1MCnCy64WblCmZMvROcy+q+LZCEYbumn6VLf
         gv3v34/nUZ8OPf520c5vebKGQT7D7+bk0zc9Et27Vdljj1/7KgOqEd7gveqfIcFK/f+5
         vNq//obCvXd7bBJlBd7KOEINby/Pv8ZKDjfpPOSAuvln3iPnOEgfW8MjW9YPHz3oIV0s
         XS/g==
X-Forwarded-Encrypted: i=1; AJvYcCVFg3ah1TBVOCY8VJLJe5P0sjvTpCsGS/yB0bdiQOy8dVCi8t9Ss3qV1RfYT1+jGnB6Z7Nm6izPMqUAfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu37hDNKuGn4hTspk9spmGOxN1geD9Xa2hwDbheHaS9k6Z/93n
	/tm+GU2QkaYX+JTbodDtfymbeOVnRArMd8ukbU5BrZdpM28bC19rTXiF6ljXxjbvkHyZK14/J2/
	eoRR0mg==
X-Gm-Gg: ASbGncvmVFx8M3vFqpB75Lvonmm2lnMC7+AbSTLLytbv7+72Ihw9c/GGb6zmA+v1QB5
	RWqs/tB2nvUI/yvk2HM27ITSsspS4J+x3soZVtigZIkYBcihfcbZz4QUoLTdANilKXxDX+YfBbs
	Y3F6h/CMcMixLdGTB0sbSVjsKqIN4i6taw9p40rEmKpeSkK2AkEVynH0h/tjlFl/jK0mzqfTLOr
	6AfONAnw6vr9I15VQx+HwVjl4frVcrMg7anVR+4/1qPzZlfT44af8TAq4Nle5s148rPlfmL6/Ar
	ogufDHue14xg1w0X4+qBeCxcBS2ZafecdvIJJzHqrIcsw9RTg++vf0qF0IlA1jIRGGNNtsRMfwS
	t23OaCotJQb5BrQIUuWmvTpG+1BS+BSUAv7BM7ORn5HAUCkEeGThVfXScbs/FQc5XxwVkR7mrQ4
	ylY2QkX6VhyLEd3EGwzwKqVWummVUZxOHKItujKw==
X-Google-Smtp-Source: AGHT+IGkxO2maItmm/Vn0tVaGPBa9vdtfDsMaBktkzP9FS/xrL9BUtLPgjOil94vbtel6E4zT/0hTA==
X-Received: by 2002:a05:6512:3b0d:b0:594:5685:94ce with SMTP id 2adb3069b0e04-59584213a5dmr5467520e87.48.1763457956890;
        Tue, 18 Nov 2025 01:25:56 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ac88bsm3914058e87.12.2025.11.18.01.25.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:25:55 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-591c9934e0cso7088412e87.0
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 01:25:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxcS1PnYKaKD7mcEDT5uFOgEKcXbQFcda6s4zvf3yFN5b3IA+hoc6zlQQ3eVxdCCZwCEw5kuhlOaO7Pw==@vger.kernel.org
X-Received: by 2002:a05:6512:12c9:b0:579:8bbb:d61b with SMTP id
 2adb3069b0e04-5958420949amr4940858e87.46.1763457954653; Tue, 18 Nov 2025
 01:25:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org> <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
 <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com> <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu>
In-Reply-To: <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Nov 2025 10:25:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
X-Gm-Features: AWmQ_bloIqP2zjmmqvyZS2koEN_byM0aGR6YqFlokGP3PeXDJPTGOygBffnBb84
Message-ID: <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
To: Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gergo

On Tue, 18 Nov 2025 at 09:48, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Ricardo,
>
> On Tue, 2025-11-18 at 07:21 +0100, Ricardo Ribalda wrote:
> >
> > Most users expect that the led is always on when the camera is active.
> > I think the usecases where the led should not be turned on are spooky
> > or very limited.
> >
>
> Or do most users expect that if a piece of hardware has a setting, they
> can set it without module parameters?

A piece of hardware that has a non-standard, undocumented setting.

Do you have a compelling use-case for turning off the privacy LED?

>
> > Even if you use open-source software, when it parses user generated
> > data, there is a risk for bugs. If there is a bug the only thing
> > protecting the security of the camera is the membership of the video
> > group which is a very low barrier. And once you manage to change the
> > LED behaviour will persist in other unrelated apps.
> >
>
> So this is about what if an attacker accessed my passwords, private
> keys, OTP tokens, emails, pictures and then couldn't take a fresh
> picture of me in the dark without an LED? I'm smart as hell and I use a
> privacy tape anyway ;)

My core goal is simple: if the camera is in use, the privacy LED must
be ON. If the LED is ON unexpectedly, it serves as a clear indication
that something unusual is happening.

Gaining access to the video node does not automatically grant access
to sensitive data like browser information; there are sandboxes in
place for that. Also open source does not equate to secure or
non-malicious code.

>
> I think freedom is worth more than this kind of fear.

No freedom is lost. This change simply increases the
trustworthiness/reliability of your device.

On ChromeOS, I don't use a privacy tape, but that's because I know how
the LED is wired :). I want to achieve a similar level of
trust/reliability for everyone else.

In other words, I want to know if someone has seen me without t-shirt,
eating ice-cream and crying while I am re-watching Coco.

>
>
> Gergo



-- 
Ricardo Ribalda

