Return-Path: <linux-media+bounces-47315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E683C6B34B
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 19:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 45B534E29FA
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 18:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64137364EA5;
	Tue, 18 Nov 2025 18:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GaKdu5jQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0632935FF7B
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 18:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490520; cv=none; b=UvXiLIa1TRTY6sV+i47ZR77sWklVDXYQrVQLYKepNE+Q0EQ2p2/X5U+k5hfpOMFY46oroGdzCgAfiydUzhNOrsy7UOOoxU99eFwwSrxwdoU4K75nt7KwkRilsSlq+WsU1LEY1NVcDvZxGFymbxhY0D/BwK4XYc3K3mQ0mIkpUl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490520; c=relaxed/simple;
	bh=DhPoh8Yg2X9WakZCAvg/708yGtup22jmnfZDgCthA0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvPkd4J9CGX3RAzGK/4ve5aT8dah7RAJwylLm1ZYIhdxH4IgcbBObOHEtaCrm9ztkhW3oS5OPSPzghNB1f1E7b+nBWGOFNTWUuWrvfMnBpyTFL2sDIzmWWuokYnVnFMxl845oudo8rbY2GFoEmniPL/QVW7LBx9g7CJ0rj+nFwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GaKdu5jQ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5959187c5a9so1943288e87.1
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 10:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763490517; x=1764095317; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vJf9PmJagRyIa0BOvJOuBX45kWw0Bxs9hWW3HKipvOk=;
        b=GaKdu5jQEKxnQgonc3Qtzk5wl+5Ds3yM+yniHAsIDj9w1BYrspS/V10LNHZU38kKnN
         8QXjuv1thaBsIW2+Z3W0XKM0Ivb90h/60l9BiD4Se8Y4uJVeKv/X3iz1EvgyPsHjNQGo
         fi8EC8lfjVQyz9jNIvF2Zophj8lh3cNyA2h5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763490517; x=1764095317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJf9PmJagRyIa0BOvJOuBX45kWw0Bxs9hWW3HKipvOk=;
        b=Lb1y4keDPZrD7j9seogwNK01Rn1zHmzqKhGB2H4Y/hKpQfNY+yri+fk1fyjuvXPzis
         gtxcgPl7Xe2FJyyQXDlBPmwlvSOtk4aXh98o9yW0o0tDH0aWFDcUjrvLyh0spMmHPp1F
         ze+hgLq7JNIBvP0ufUMr6CSujnCXBzEASn9aVpfFgwx2tTsaBq/TDzPX/4m4dEMeb35w
         WcQ7UFQmWIoY1W0MzGEXJMEDvV/A66WAHmPfTrXLrY0/O4lvAvA6vpNnAc5jZG11E7+I
         rdf7cKpJp3H73Nfb8C7PJQxIoae1n8rJpxPUJoaeoVM4OURB+KNY+UAdx5/rKcqgnP8S
         MwGg==
X-Forwarded-Encrypted: i=1; AJvYcCVeZMwuRXflEewHP+yrRKSvmP7B/K939cct4PJYdWpwDJVRCwR3QzWyqHa4lefeyUMc3A+nkZyzGNo5NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypYnrmnIUZD/XydKKpUe1/PA/8CIlx+oOXUwRJlgZgpU5CTH/i
	NQX+KYegy+hrtwLgdKQnu0JS9GWzwE5lj0m8SxqnlTTExOFmwTuKGe3RLdMVvJ3Rj7fAnfQc7Da
	t7fVdaQ==
X-Gm-Gg: ASbGncuINtMoPw95a0ML0c07Y2tLwhHLdYoyAhL6pLdYv1P7MCmdRYAOtY70lOQP4Ry
	Q3iPh2dbG3xFahnL9hHrq/AGvU0LLRdS4M8FioNvk9QMFFC91qh2EYfJOq7rj3cx8LATstb9Ae1
	iCZmlOLTRhWKiDIoSDHT6cdN58jPb6cVC65CeX58EQFz36PnKhED24yUCif+w6M63DuTRvPGZVo
	yiUkXNVmaTl9RwlgBl3DSLTM4mhueTmyIq8St2/1dYSKgdA4GyHEYjhWOKiYptjR5bP5rXLxTuJ
	8jIaEreQx2kpxWh4SjPLIOPFYlNaFn6+7vPtUPepXgBYw1wKr3FG/4j9c0L0sPUoXECqgS1BwUW
	ABjn1qpAVife2L7fYIXzCuHEg6t1VUqJi/maq2vxQv/seAW4kqMwwXz4j74//0yiWURt73uXJHn
	G7XoTXGyMYWBmqfQCF6NhlZhQrHr2AINxdT3b5vsOhl2yDRk6j//N3
X-Google-Smtp-Source: AGHT+IE2OL4/l8ysp5HududxrfXAbO/sYXxRLuum84EHkRw3ruKY+0ficwWlLDzUoRm4sj2VU0iBTg==
X-Received: by 2002:a05:6512:2246:b0:595:7f2e:ddfa with SMTP id 2adb3069b0e04-595841983c0mr6744188e87.3.1763490516969;
        Tue, 18 Nov 2025 10:28:36 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5959101a0b7sm2122837e87.55.2025.11.18.10.28.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:28:35 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37a56a475e8so53765551fa.3
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 10:28:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgegym3zDeeOeUO+AKF7CNoGm1CP08WR0Hq0zGHsCwTA98gM5zwVq6oo0BWLk6yuR1bnxbJAk4OdkzsA==@vger.kernel.org
X-Received: by 2002:a2e:9692:0:b0:37b:966a:493e with SMTP id
 38308e7fff4ca-37babd6e95bmr38757561fa.39.1763490514771; Tue, 18 Nov 2025
 10:28:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org> <2025111817-wages-anyone-e39a@gregkh>
 <x2xheosw24fecqjjv4fmj2t3i53k2ypyvmkkkvmv6xtdwsherd@e5klkm3ou4g7>
In-Reply-To: <x2xheosw24fecqjjv4fmj2t3i53k2ypyvmkkkvmv6xtdwsherd@e5klkm3ou4g7>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Nov 2025 19:28:22 +0100
X-Gmail-Original-Message-ID: <CANiDSCuv8UG6TMx6pK348okK+NYzAorPEgPYzoRCEZiBDgPP=A@mail.gmail.com>
X-Gm-Features: AWmQ_blM7S4shaTGNxJfhLmGLTcwMtEJb-eDC45CoRNAlMmaP_NitZys0JaGpa8
Message-ID: <CANiDSCuv8UG6TMx6pK348okK+NYzAorPEgPYzoRCEZiBDgPP=A@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mauro

On Tue, 18 Nov 2025 at 15:09, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> On Tue, Nov 18, 2025 at 06:14:09AM -0500, Greg Kroah-Hartman wrote:
> > On Mon, Nov 17, 2025 at 08:14:19PM +0000, Ricardo Ribalda wrote:
> > > Some camera modules have XU controls that can configure the behaviour of
> > > the privacy LED.
> > >
> > > Block mapping of those controls, unless the module is configured with
> > > a new parameter: allow_privacy_override.
> >
> > This is not the 1990's, please do not add new module parameters, they do
> > not scale, nor work properly at all for modern hardware where you can
> > have multiple devices in the same system.
> >
> > This isn't an agreement that we should do this feature at all, just that
> > if you do, it should NOT be a module parameter.
>
> I agree with Greg: modprobe makes things harder, especially on usb.

If the argument is that with parameters you cannot have a different
parameter for each USB camera, I would say that I see this option as a
system-wide policy, not as a per-device option. But yeah, the less
parameters that we have, the better.

>
> Also, in the specific case of privacy leds, IMO it should never be
> possible to directly disable it, not even root via a modprobe or
> runtime parameter.

+1

>
> Ok, as it might be some case where someone really wants to disable for his
> special pet toy. If such cases are relevant, a Kconfig parameter could
> be added (maybe depending on BROKEN), having privacy LED enabled by default.
>
> This way, any sane distro-generated Kernel should always have the privacy
> LED on when camera is in use.
>
> On other words, if someone has secure boot enabled, he can be more confident
> that a distro-vendor signed Kernel will honour the privacy LED, and not
> even the root can tamper with - as BIOS access to disable secure boot would
> be needed to change it - plus, booting a non-signed kernel.

If most of the people agree that the final goal is to block all the
LED privacy access from userspace we could have a mixed approach.

1. We introduce the allow_privacy_override parameter with default off.
If the user sets allow_privacy_override, they are welcomed with a message like:

uvcvideo: [DEPRECATION]: Access to the privacy controls will be
eventually blocked.

2. In one year, if nobody screams at us we remove the parameter and
call it a day.

3. If someone depends on this feature, we will move it into a kernel
configuration behind BROKEN.

What do you think?

>
> Regards,
> Mauro



-- 
Ricardo Ribalda

