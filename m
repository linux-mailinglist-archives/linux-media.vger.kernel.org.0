Return-Path: <linux-media+bounces-18283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B14978C18
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 02:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29D301C24648
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 00:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96401FA4;
	Sat, 14 Sep 2024 00:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="oT9p+Yh7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com [46.235.227.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323531370
	for <linux-media@vger.kernel.org>; Sat, 14 Sep 2024 00:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726273402; cv=none; b=F0ARBWhRCxor9+V74CKLIR5jXRqUUrhfntbfJYHmzduCJazgQpDVXFuObqRARS5WZSEszCEXHq215jGH35PERGMDJAzL0FVcmI+5B7Vt04v76wcLrSi2er5xjW5pRZ0Fl29bu8/cn8op60aF7eI5MUDKDCFyGZX/bYO/cseq4es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726273402; c=relaxed/simple;
	bh=mIEG7iZX+6wpcXNRZUQqz6fI/hKPGy8a2A1pwwuYzZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5HHI2JFSWT0JR/T3HfkpUKi965drkl3i4aaoiBDCm7T3IK3M1nabP/wVppAFUkOoFzBMrnnk1DP6y9vtFZZr+uuQDH11bivvYivHc/DOfCjneZUtrmYsy+6OfUx4Dwh5XT5C9vm7mvGbkxydCcokTLXC7yAX2HzPwnSB1V4NNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=oT9p+Yh7; arc=none smtp.client-ip=46.235.227.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=Rm4EeqtSZKwF/oWyM7Q5ZOmZfmZh6LjYplqGubLpso4=; b=oT9p+Yh7cEyajZE7iSAeu8Guhd
	gHJ7XpqKzR2yyUud9hQ5Pgg5AczRsNVBe4rlyLeyLS3sP+7U215zmyWmZ2IojuPOQRwlc1PjBW6cF
	q59VVMpjE7Eom0sO2S5uc82PX7z30da0F2YYdNZrjhzhilU15FLo0vu+fQfdGjlQ0qY7nclu6StrW
	7/R0S9FNzKO9kL23i6SnvdQMwAcLih+2sCnIIbcajMAE2HrXtqA7oaApHkX4OlNVXTwLECRst++Wj
	bepuukyR+z5KuW0377m56JvWvwwoWZj5Hk2cmtuWRfgSzqGaSDAQFZNuUB9ZMl7Wr7bnFx7SIBGDW
	GElB2K8g==;
Received: by mailhub-hex-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1spGZK-007MKO-1S
	for linux-media@vger.kernel.org; Sat, 14 Sep 2024 01:23:18 +0100
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2da55ea8163so1982925a91.1
        for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 17:23:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGw0dIDniWjpAsbc7ak2dJ9Te4P4xQ/jQp0E3rlIQ4lesSTaE+SJvVcYcPRH16RarwJ/r5wsaIc7J0Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ZcFoBjR8pVzyZw5EoiwHABuoVNbYaflC8tBG0HySRWajLMe2
	5qEEmIM3g5mp2TBjoG6ADRQzHKjNWX6iO329JWZQEXsl4BzJTMpXRPRP0N8V38JJm2r+QXc7cel
	HpUfkgE/iU1KmDB+uvILESKCbTuI=
X-Google-Smtp-Source: AGHT+IFF9nBDAlq7u1TGx7LQPDlC9EZjPO3TKURIxeNieR1idOGlWob+gWEz9aOBqkfNF/1V17CdrrIh+l5hefBJGYU=
X-Received: by 2002:a17:90a:4b44:b0:2d3:c976:dd80 with SMTP id
 98e67ed59e1d1-2dba0085871mr9239738a91.39.1726273396483; Fri, 13 Sep 2024
 17:23:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALgV52gdx5m3eP88Sqa4s09qy+N4rpaZ8UHFXfphkCXZUxyNHQ@mail.gmail.com>
 <CANiDSCuOojPtX4M9Q7DOe4sR-DpuKp1Rzzpa3NrJxV7HuzAAeg@mail.gmail.com>
 <CALgV52iM3B4G2Sa0jjuMcEZtE+rn8B80NOMWj3i4jEUCiVVnRw@mail.gmail.com>
 <20240913234037.GB9669@pendragon.ideasonboard.com> <CALgV52i7=-jH-EmQQb-gaYAs7vuS1bPxyUv_PSvrTKyRYewWuw@mail.gmail.com>
In-Reply-To: <CALgV52i7=-jH-EmQQb-gaYAs7vuS1bPxyUv_PSvrTKyRYewWuw@mail.gmail.com>
From: David Given <dg@cowlark.com>
Date: Sat, 14 Sep 2024 02:23:05 +0200
X-Gmail-Original-Message-ID: <CALgV52htoEjohXv7NLTAb7eCy8nPujWtcd82prNZ=jWrVY7wyA@mail.gmail.com>
Message-ID: <CALgV52htoEjohXv7NLTAb7eCy8nPujWtcd82prNZ=jWrVY7wyA@mail.gmail.com>
Subject: Re: No uvc video support for D3DFMT video GUIDs?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 9

D'oh! The kernel logs which say this:

---snip---
[23824.213720] uvcvideo 3-5.4.3:1.1: Failed to query (130) UVC probe control : -
32 (exp. 26).
---snip---

...show what's going on; the device is reporting an incorrect control
packet size. It's probably completely ignoring the incoming packet
size and assuming they'll always be 32 bytes, which is wrong.

On Sat, 14 Sept 2024 at 02:13, David Given <dg@cowlark.com> wrote:
>
> On Sat, 14 Sept 2024 at 01:40, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> [...]
> > UVC_QUIRK_PROBE_DEF may help. Please check if it results in any change
> > in the kernel log messages, not just if you can capture frames from the
> > camera, as sometimes multiple quirks may be needed.
>
> Thanks for the suggestion --- I tried it, and the kernel messages did
> indeed look a bit better, but I suspect only because it's not doing
> the GET_DEF anymore so isn't reporting it as an error.
>
> ---snip---
> [23584.241771] usb 3-5.4.3: Found UVC 1.00 device IR VIDEO (1fc9:009b)
> [23584.241775] usb 3-5.4.3: Forcing device quirks to 0x100 by module parameter f
> or testing purpose.
> [23584.241777] usb 3-5.4.3: Please report required quirks to the linux-media mai
> ling list.
> [23584.246791] usbcore: registered new interface driver uvcvideo
> ---snip---
>
> Still doesn't work, mind.
>
> My gut feeling based on looking at the compliance logs and no
> experience with how things actually work is that the format selection
> commands are a mess, maybe because they're not expecting the client to
> actually try to select or enumerate the formats but instead just
> process the frames the device gives? This line looks suspicious:
>
> ---snip---
>        test VIDIOC_TRY_FMT: FAIL
>                fail: v4l2-test-formats.cpp(473): expected EINVAL, but got 5 whe
> n getting format for buftype 1
> ---snip---
>
> 5 is EIO, so if they're failing the request incorrectly that will
> confuse all clients which consider EIO to be a fatal error. It should
> be easily quirkable; I'll give it a try.

