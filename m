Return-Path: <linux-media+bounces-18287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1FF978FE9
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 12:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12E362841A3
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 10:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332B51CEAA8;
	Sat, 14 Sep 2024 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b="PZ0WlCvH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com [46.235.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E82719E7FC
	for <linux-media@vger.kernel.org>; Sat, 14 Sep 2024 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726309199; cv=none; b=O+8BqW2Lwe8FwMZsVef78bxTLNkTR8gwsVWLOgnVyCa87FkIor4npAiuzhWdLNZ/I3kYTJ3Wqq5ytx9W3nF3Bv7Uhiilk0wuh+rMex8BNQRETGZCs4Hm8aDv9lU+5R4QAvQGiZXgvSzQam3lOOAPtB5tDQZUWnSodZqXhp1GtT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726309199; c=relaxed/simple;
	bh=3zjZMPDxRaylVM8zDwaM3FXXMtJ2r/RULnQe7+Vs0o0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S7/7zpoGf4M4J6WqjE1Qer9FPG9ZnFieAV35zwHpW2P6NmX9VieCf0Z+7AW5LV4fCPfmceZerGSKgR1XZhrNe/Do8PgKVZjPwm45qoWRKCCjayktUuDmqNbSvMp1/EB34TUr8O04hGOW6pdP0W5dNcas95SZrXcvxIFUCAcWOGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com; spf=pass smtp.mailfrom=cowlark.com; dkim=pass (2048-bit key) header.d=cowlark.com header.i=@cowlark.com header.b=PZ0WlCvH; arc=none smtp.client-ip=46.235.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cowlark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cowlark.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cowlark.com
	; s=mythic-beasts-k1; h=To:Subject:Date:From;
	bh=l3ZZG5gH+YqKSEzRs083vcpvZCeZYJ+U9eIlJCN+CaQ=; b=PZ0WlCvH4XjGnm6AtFeYehrrat
	gLCogpuApO26cPk+bJ3E2u4c0CGimPwYY2UH6kWLpXFmHnoaRupBpqzOFtZvbBefQVb5djaT0N/L4
	/OvxwFMM24Vn8wtX2XjsoEL05anQ40RYwlr407gcrbXpK15PCZQgNyk7KS/HKBSRKy0uV6ewzFkOg
	grUkWNYZhIiY0omoZKSTill5p4SA4Q2Mk5X576PctYYy1Cw5MIfKhkW/Q08s1loU1bKOY0F47BSHS
	T3pPSriz/qrdqVjGnNRuMINRZI4XzHCeTrTGR+LKS0AYVxbi0k513KC0qdNaIwSVxt1V3cARPi9nz
	jFwjJwog==;
Received: by mailhub-cam-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dg@cowlark.com>)
	id 1spPse-002b5w-G5
	for linux-media@vger.kernel.org; Sat, 14 Sep 2024 11:19:52 +0100
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2da4e84c198so2186106a91.0
        for <linux-media@vger.kernel.org>; Sat, 14 Sep 2024 03:19:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyPXhkKwqwsm+3+vE7QWFTO/ctOA5QDlYmKIINLv80lgo/iD+Xom7cpF/qybp9gtuJjkTLzgJhRlTxOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+hepzhtFRq5LE1zyG2lz/n9isN/dJM60QpFchVqh18ZI9Fsh
	yB6Ykxxo15BODGnOrFIOUvDD4CDsuhdCq/tH+hQWEqFvnLURVAh7RdyyPB8eumlN0T0VOLPDRGZ
	Q4oe3LkRhpmscDU+DFu7dxsBAs04=
X-Google-Smtp-Source: AGHT+IGyu5El7Ffm+oEJsnoMHK/n4LXxqb5ZwsEsccIQhOwIt2ID/k2+fwDDS+JmJTIda4a1v142/G2+97i6XfsFoKQ=
X-Received: by 2002:a17:90b:1e0a:b0:2da:8730:5683 with SMTP id
 98e67ed59e1d1-2dba006a195mr9653070a91.39.1726309190491; Sat, 14 Sep 2024
 03:19:50 -0700 (PDT)
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
 <CALgV52htoEjohXv7NLTAb7eCy8nPujWtcd82prNZ=jWrVY7wyA@mail.gmail.com>
In-Reply-To: <CALgV52htoEjohXv7NLTAb7eCy8nPujWtcd82prNZ=jWrVY7wyA@mail.gmail.com>
From: David Given <dg@cowlark.com>
Date: Sat, 14 Sep 2024 12:19:39 +0200
X-Gmail-Original-Message-ID: <CALgV52jhPHmfaVnbskCXZw-8N4jYFGtowaVMmVL3NwUg1Jiutw@mail.gmail.com>
Message-ID: <CALgV52jhPHmfaVnbskCXZw-8N4jYFGtowaVMmVL3NwUg1Jiutw@mail.gmail.com>
Subject: Re: No uvc video support for D3DFMT video GUIDs?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 9

Solved. https://imgur.com/a/vGJ0Y4a

Turns out the necessary quirk was UVC_QUIRK_PROBE_MINMAX, and then
v4l2-compliance goes green and video comes out. It's even the right
colour.

I will polish this up into a patch and send it. Is the list the right
place or should this go to a specific maintainer?

Thanks!

On Sat, 14 Sept 2024 at 02:23, David Given <dg@cowlark.com> wrote:
>
> D'oh! The kernel logs which say this:
>
> ---snip---
> [23824.213720] uvcvideo 3-5.4.3:1.1: Failed to query (130) UVC probe control : -
> 32 (exp. 26).
> ---snip---
>
> ...show what's going on; the device is reporting an incorrect control
> packet size. It's probably completely ignoring the incoming packet
> size and assuming they'll always be 32 bytes, which is wrong.
>
> On Sat, 14 Sept 2024 at 02:13, David Given <dg@cowlark.com> wrote:
> >
> > On Sat, 14 Sept 2024 at 01:40, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > [...]
> > > UVC_QUIRK_PROBE_DEF may help. Please check if it results in any change
> > > in the kernel log messages, not just if you can capture frames from the
> > > camera, as sometimes multiple quirks may be needed.
> >
> > Thanks for the suggestion --- I tried it, and the kernel messages did
> > indeed look a bit better, but I suspect only because it's not doing
> > the GET_DEF anymore so isn't reporting it as an error.
> >
> > ---snip---
> > [23584.241771] usb 3-5.4.3: Found UVC 1.00 device IR VIDEO (1fc9:009b)
> > [23584.241775] usb 3-5.4.3: Forcing device quirks to 0x100 by module parameter f
> > or testing purpose.
> > [23584.241777] usb 3-5.4.3: Please report required quirks to the linux-media mai
> > ling list.
> > [23584.246791] usbcore: registered new interface driver uvcvideo
> > ---snip---
> >
> > Still doesn't work, mind.
> >
> > My gut feeling based on looking at the compliance logs and no
> > experience with how things actually work is that the format selection
> > commands are a mess, maybe because they're not expecting the client to
> > actually try to select or enumerate the formats but instead just
> > process the frames the device gives? This line looks suspicious:
> >
> > ---snip---
> >        test VIDIOC_TRY_FMT: FAIL
> >                fail: v4l2-test-formats.cpp(473): expected EINVAL, but got 5 whe
> > n getting format for buftype 1
> > ---snip---
> >
> > 5 is EIO, so if they're failing the request incorrectly that will
> > confuse all clients which consider EIO to be a fatal error. It should
> > be easily quirkable; I'll give it a try.

