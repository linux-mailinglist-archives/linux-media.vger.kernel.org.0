Return-Path: <linux-media+bounces-44049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C6BC794E
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 08:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C2AE44EC571
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 06:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E552D0267;
	Thu,  9 Oct 2025 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjiuAZ7F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08D21EA7D2
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759992638; cv=none; b=SNAaYqBidrzRfwmTXJgLvV8bRWPP2B4dprMreQkFSssHG87h7zZGfdcKDIKZEP/un+yrNJo7WrGdKHjpm58gKMkZTKvTJ4CYYgV+19c4LQwYOnTTIGtHBHUQIfKkgvkVlOY2AD0RKbLfxADpSg3zrMD8k++MAHiFLyzNlml54b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759992638; c=relaxed/simple;
	bh=EjW0hP5FbYNYPJ9yWAHL7ZiHj76ewphEw9EXSJMEoCM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UhjK0Pn6FZmo6teYft+qfs8z59PMRwsHQWtcYpa+ggjzj3jUNYcBVduMmvqr8jSVE6FzaWul0Qxn7214O6KGCNtZZR+DtvL4oFmZJPZGUXAyXsDXBkS7E+BQAGN9ESrxNKyiiBCv6GhxY66HuBx0f0iS7Sa+Dh9IKiQvrW2iW5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjiuAZ7F; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6394b4ff908so1075037a12.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 23:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759992635; x=1760597435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9K3jcLU+F0b0kSwu1qTzDutZ00flbA5j0Seew04z2kw=;
        b=mjiuAZ7F62xpXe3On81FutKyYLhKQhJGETFIepDi56Ni2YuM+HLEklHiIIWFPQBvCx
         ZSFBb8KBLL259r19b99neKPHtpmc68FScDtiNOWqOxqcTq6qe2IEu2cY/eB1izGX/365
         jovJfOqr9HKAZIdI/35KtrNqa2/1hWovRUuelmPhoonkGDs1yJxOJEkOSivIiTF09HTz
         481aX2ENvo92pqUoAPmotnEkTryTPEakycWnOYczZIypgZKmhHKX8p6IebUBC5nLTUr2
         gmy/wxeoQ/NM9rSs9+6KAXw93VljGyMZie/E9JWon6IwJ1PSn6DZ8hRGe17WVQpVSJ2/
         3SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759992635; x=1760597435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9K3jcLU+F0b0kSwu1qTzDutZ00flbA5j0Seew04z2kw=;
        b=PRGOlUBN5jrFwhKSgkpVZQAd2jEKfq1goY2iyuW8JzeZ5r6WfNnJYCxdTCHT++Pjn4
         fte4tNTwb6rt2LmybutrKqseVnhEt29XQ7l5UBX+1x6bYjPUj1F+FvcI140ERP0Y6TE9
         wfaaL8tXalgjgkr0kXhrcwzsL4JFLC4ZtHgLoZejLn8U2fgowcO3sNvrA7lIAuY+yVV/
         xu/YTa8Hr090r3RcHzWBI3/RCfnzPw0cDAnFXRTxQ4wBK67Kz6S7iCYlfA5RSVbzUwWQ
         /4mzF9RjiiBirBsPQlm5H+kNtog6F34Lz1sAkTFdILHG1qnJeFe+wHigcCqFHfVdn3WZ
         76vA==
X-Forwarded-Encrypted: i=1; AJvYcCXCQ7R8LPgynJ3adJ9k5R5VsXHLmZ64tlO/8ocfKgLmCmwJN7+xN+SiFxhT7SlenTYKM6DOvVyeNFJf8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOfdEOLRPsqNgltqYY9UYEw9m9yu9laNTAT4zPXy7nHI40ek5b
	vEl86oRyAOEpUSzcx/dmN5UDlwjrGI8dIudYFxuXSPmjfjZNdHA+cHsx
X-Gm-Gg: ASbGncsOjqpDuk9VtAnOeq132fnrC5f3GvD95sxSGMmPEr5yDdxHBW/WRadaKN0ioiC
	IXT4cLdGv1QeqsdZn/BLeeQGa8bDDyyoeOB8vE/Fy58m0AwHtA7enwJHMJXzpymmfIAt+m1nGI4
	8j2pexXVZcXZZ3PF0kQHN7SgeMLmOJvJWNZ/7Ey97I9GGJ8LsIhDUOJYZu0bniJeLMLbfljM5c8
	4DitQG7RE3I89Xh6yyodMdUYD1yH4qHyxK2A15G+bVf9DlPv4r859Jz4MgxGOK1YTbamKqcjUQT
	JG1bPArMGMzwTfLZfAInqsLQOxUPzk4fTz813jYoOT6S/RMTIwCrv9HGdreOQIozT8+pAF6brGI
	Ut5kw+UFcxfV8rqRO7qSzAk3YrcaidVxWOg1yiF1eaVViYQS5PmkDeLm3LYE=
X-Google-Smtp-Source: AGHT+IG8Ud5fo/RqGDQh+pFaXna1RgG6zPI71+duC2ptc9c7lcQdelbdLg9f2SiIK3mM5gHnQpaK4Q==
X-Received: by 2002:a05:6402:510e:b0:633:d65a:af0e with SMTP id 4fb4d7f45d1cf-639d5c59a53mr6110460a12.28.1759992635029;
        Wed, 08 Oct 2025 23:50:35 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f3cdbec1sm1715007a12.20.2025.10.08.23.50.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 08 Oct 2025 23:50:34 -0700 (PDT)
Date: Thu, 9 Oct 2025 08:50:30 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Angel4005 <ooara1337@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-media@vger.kernel.org,
 linux-uvc-devel@lists.sourceforge.net, Linux Regressions
 <regressions@lists.linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [REGRESSION] uvcvideo: Grandstream GUV3100 (2bab:0011) broken
 on recent kernels (including LTS)
Message-ID: <20251009085030.2d360284.michal.pecio@gmail.com>
In-Reply-To: <aObw4BRRheGO3_cg@archie.me>
References: <CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com>
	<aObw4BRRheGO3_cg@archie.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Oct 2025 06:16:48 +0700, Bagas Sanjaya wrote:
> On Wed, Oct 08, 2025 at 03:56:20PM +0300, Angel4005 wrote:
> > Hello,
> >=20
> > I encountered regression (breakage) for the Grandstream GUV3100
> > webcam (ID 2bab:0011) in the uvcvideo driver.
> >=20
> > Testing showed that the camera WORKS on kernel 6.16.8.arch3-1.
> >=20
> > However, it does NOT WORK on newer kernel versions, including the
> > latest stable version (6.17.1.arch1-1) and the latest LTS kernel
> > version (6.12.51-1).
> >=20
> > Problem: The driver finds the device but cannot start the video
> > stream, resulting in an error in dmesg: =E2=80=9CNo streaming interface
> > found for terminal 65535.=E2=80=9D

Hi Angel4005,

As you are on Arch, can you try v6.12.48 LTS from the package archive?
It was released on the same day as v6.16.8 so it's hopefully good too.

If you can find the exact v6.12 series release which introduced the
breakage things may get easier, because there are much fewer commits
to worry about between releases in those LTS series.

These are the only drivers/media changes between v6.12.48 and v6.12.51:

000b2a6bed7f media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENT=
ITY_ID
fd5d3e6b149e media: rc: fix races with imon_disconnect()
effb1c19583b media: tuner: xc5000: Fix use-after-free in xc5000_release
514a519baa9e media: b2c2: Fix use-after-free causing by irq_check_work in f=
lexcop_pci_remove

Perhaps the first one? Consider this dmesg line:

[  363.700829] usb 1-1.3: No streaming interface found for terminal 65535.

There is also a few drivers/usb changes, but I doubt they are relevant.

Regards,
Michal

