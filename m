Return-Path: <linux-media+bounces-50554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD97ED18A20
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 13:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46CFC302AF9D
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 12:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A344238E12B;
	Tue, 13 Jan 2026 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lYLLPeNW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8751326B098
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305962; cv=none; b=IX+a1aYYXKM8KPz9Tp7KNRibmwlohYz3ds6lBxYBMajMJK0Ug98OXseSv8nnDhneGHtkaw/yYZDnRaM+Shek2l02xXiDauOHtuq8YXySi9gtmLfdhBl5iNl0wTbfbSnckluEbmae2jxdls0e3m0E/rRv3GIWBLfzafLhmK3ogA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305962; c=relaxed/simple;
	bh=WofB8QthyF56+4sadXLUlhO+opP7Hjgqx6Q7k+sFuBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oux507qj23i7XRuzEOOiIlq+89yBYwRvDDqdtnELOFbfoEzRRVPjF9qfdYv2Tynev4r2qo0v7uFBRQlDVnnvgNRirknV/nY8bk8acilmaRxVpf6V67X+NAGVRyBfSXikvs6t8bkqguFtskoCNtjEfVkmrqTUZME3JwzMEF70dsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lYLLPeNW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59b67388c9cso9538538e87.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 04:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768305958; x=1768910758; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gokx9TKFI2hAXyjdZfYviMsHevAx+z5lyNlWeG+ZQOY=;
        b=lYLLPeNWcLhwTEHMleMjrSrY5FxnBFO94SDo3TVL4p42hXZdfsDssFSMhOLCOQXjXD
         iHC8Wxbuefz/mPflmEyE2ETXBS9KE6+ge+VTuresxzxBK/IKP7BIA7qPqjJwT8oTob/H
         jTWbC9L4V/Lwtt4D2O/SEfx14J/5FGrrdcxE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768305958; x=1768910758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gokx9TKFI2hAXyjdZfYviMsHevAx+z5lyNlWeG+ZQOY=;
        b=hlXXxY9JJhs/mWtXxfM/PHtR/Z7tuHyoPsnUKBXuFrzSytycyqo/MDvqGTKmQkVRLF
         Hk+WOmUatACf87a8qswf1qYpxGENbr/luS79yiqpCU68tvwNLm0rmljAENb6WY/ektw9
         3HoYw9+6STz8/HuhYVTZAxmWzyEVkKIDW8NF1EfdaZHq4qEtucnT/IzSfXAAGWhbOr7A
         r8q0gSBjF3Y9TFuJhTpozfRPZFqEBozaccSqOtgkQRsE6UNyO62sZz2d4lBuAQVizBRA
         l5JAsvWEkRkQx0cBwP9K1uTL02bMk/XEPTjc2tl53OkJ7+lovAZCNNpfWMMiwZ28wG+F
         E2Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVDYWqxeVJ6kcfFSeS08q32v5ukJYFXQm4TAhLNsJ15N3PKh0dZNw2wiBO7Rd1qBjGc49nHlOdBqII9LA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkPURxYPN0IOH3YM/+S2GJSQzisoMtGixVHbTC3p2y5D+Ht+eQ
	wajbbQODshrePtU+2ccMCkJK9Q5w2CLLDTsbfboYKnVwkSlZREN/sl3yslCIzzJaYRVlgpFAueN
	CPXw=
X-Gm-Gg: AY/fxX7uDiDG+wOe/oWyo8cei/vc/pCe51k+d7A22bo4dwzDJCsHVQUQQKnPlvcVFy5
	za5ObMYabB4WnZzCuzbrAtfqUkAYjc1KXoSWHPDPDAePOPR4s+C9cBIPXlO62RLDW7OYLQ6fdNq
	Y9l4pcFS0ZRgJr/P1ZxWpeX7zalfz3uqTAzuDlNZZDOMW2PJcRRNY3n+WASKLkLLsCWP3Wi53Ee
	8tIGlXH679505yUM5mnb+pv3w+VP4ZpxF3a2F7M0so1N8Wb16nne3Y2Q2GZ+Li9dBxPUgUykFj5
	2vc4Y/aCY1PtAKLH76l/+g+SZ9JHamk9VRAj+0EBuF1lZ/ZeZpGCGdg0+zlAPVKbAZcYPZz1/6+
	jSv2WhmUp5Pai0tVaCOQudxwgEPD1PUJVYCXdzpFXTTeCkfMyO8YB5U2KOxWH4H4wVFrsgfGWi6
	bgCjC6d4qovUfcgbcIrXde2XiylsKCBIRfXkSg1K/3/EL1LXXN
X-Google-Smtp-Source: AGHT+IECOaIAJek5VSNTGpH4GrMXMS4CovGl8pBrATh/l+4Bs+Bcoham1SzTyPcqlnZm85GS2GS4eg==
X-Received: by 2002:a05:6512:1248:b0:594:2e7e:7897 with SMTP id 2adb3069b0e04-59b6f036b4cmr5707859e87.29.1768305958256;
        Tue, 13 Jan 2026 04:05:58 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38319ec5b73sm26739651fa.48.2026.01.13.04.05.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 04:05:57 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b67388c9cso9538427e87.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 04:05:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtcxV+hRSLZtQN/YOFQC9S4xE1X8g4P45CUb2CGJgwl084RHW2mFr49ai9gxEqaIeLpCEnWvMJxXWYaQ==@vger.kernel.org
X-Received: by 2002:a05:6512:3ba6:b0:59b:83fc:e584 with SMTP id
 2adb3069b0e04-59b83fce65bmr3997385e87.30.1768305956987; Tue, 13 Jan 2026
 04:05:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DU2PR10MB77866A2E27FA9670E867EC20E18EA@DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM>
 <20260113115151.GB6198@pendragon.ideasonboard.com>
In-Reply-To: <20260113115151.GB6198@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Jan 2026 13:05:43 +0100
X-Gmail-Original-Message-ID: <CANiDSCsSoZf2LsCCoWAUbCg6tJT-ypXR1B85aa6rAdMVYr2iBQ@mail.gmail.com>
X-Gm-Features: AZwV_QjhTMPi43TSMHinJV1X5Sj7PmpEZ0KjXPeugSMlgSP47ggKLHbCRm3Hh8g
Message-ID: <CANiDSCsSoZf2LsCCoWAUbCg6tJT-ypXR1B85aa6rAdMVYr2iBQ@mail.gmail.com>
Subject: Re: uvc_alloc_urb_buffers() fails for small frame sizes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Itay Chamiel <itay.chamiel@q.ai>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Itay and Laurent

On Tue, 13 Jan 2026 at 12:52, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Itay,
>
> On Tue, Jan 13, 2026 at 10:06:03AM +0000, Itay Chamiel wrote:
> > In drivers/media/usb/uvc/uvc_video.c the function
> > uvc_alloc_urb_buffers allocates buffers for transferring frames from a
> > video source to the host over USB. It gets a frame size ('size') and
> > the USB packet size ('psize').
> >
> > Typically the frame size is an order of magnitude larger than the
> > packet size, and everything works normally. But I think I've found a
> > bug: if the frame size happens to be small - smaller than or equal to
> > the packet size - then npackets==1 and the allocator 'for' loop is
> > never entered. The allocation fails and the stream fails to open.
> >
> > This is because of line 1815 in the current git version:
> > for (; npackets > 1; npackets /= 2) {
> >
> > Shouldn't the condition have been 'npackets >= 1' ? Is there some
> > requirement for a minimum of 2 packets allocated? If so then it
> > doesn't seem to be documented.
>
> I don't see such a requirement, no. Switching to >= 1 seems to be a good
> idea. Would you like to submit a patch ?


Now that I stare at the function... Shouldn't we do  `stream->urb_size
= 0;` just before `return 0;`?

Regards!



>
> > In my case we are working on a custom camera, whose packet size is
> > 21504 bytes but the desired small resolutions are 50x50 (=2500 bytes)
> > or 160x120 (=19200 bytes) both of which fail because of this issue.
>
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda

