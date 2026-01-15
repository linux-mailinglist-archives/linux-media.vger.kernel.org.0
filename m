Return-Path: <linux-media+bounces-50753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8BED22E3D
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 08:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B41F630730C2
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 07:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8052F2D0298;
	Thu, 15 Jan 2026 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HzI5eXEc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7306B26F2B0
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 07:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462397; cv=none; b=SG7ALNIHgWQYkznI/JyRRe9n2cfoKFVitoqRfYHwSp2oxiWHkwl3cs7tswpEQGJBsMUXNhT5qZ611oeSWZ/LQw24xZju6VFNenC3FmpRWZoOUw/v41N5X6uj+n0ftdvGRsnuIQgCPJnTPBbP1u/vjRh2mjs2QuAeJQkSgwvjTjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462397; c=relaxed/simple;
	bh=zZ9nZeKleRhO1OpqtxMMsikzalzUBACMmA41lHCi1Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dg5kyQ9PeblUsLRZ6Z2NBrblZaX/0pVd7ffGdNLI1SgTZhVodVxRjwGgR5hbRPLAcrcessNuk4HplGItiWvvEbPM1KVk1gPAwKCgGTU+J5JkihPJs9snMaOU1XuYrhuUTKwZoufbVNTH28yYRMigpdT88J+JTJTbM+vL0K1cDJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HzI5eXEc; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59b685d2b79so589623e87.3
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 23:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768462393; x=1769067193; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=foTicU0G5xwJc7vFiv3smWvaGv8Ym4yg/e6HWX0Af+I=;
        b=HzI5eXEcQBk/E5b1P/U+mEqYRyqHVjJ+RXcnoEMO5qqvsfNjmvuRAgNqoN6lT0G4IV
         Ikn+fwy8LKJ7943X85loto0T1/WWCESPG3BNaUcDzhqCaX1nid2RPI+hwmghWly5kaMp
         DsD72mCHXZQMSP4TUDoaRkA1Fs9cpjau+4xLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462393; x=1769067193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foTicU0G5xwJc7vFiv3smWvaGv8Ym4yg/e6HWX0Af+I=;
        b=VlOxhAJ6vXlVGedCMIbplEiDvCAW4XgVkenoa+KMxxrXhM/7Ty8tiLpwvd3H3fW9tt
         uamQeEWkhl3YtOPGaISp5bA6aP91d8+KCP27bLIB2F6A2htiiLcAnkKXjb4K59xM/9uk
         j36BXPUCzVKMJvAFh8jIYg+1S2vdyfuuid961yHsIPjV2lOxsIDqlFMP8Q/Yqj7+bj0J
         QNXhyG9rqVmETvGJciDjSjp0P1pvKbIR9i/aeejgIUKJKCuFyjHrUgEa2c2YvhfTam+m
         V3zRbp/p2jHD5dPPiKI+Szl8+SLSjmEv3RusSybMly8l3EwOK2TJwFPtubz/hwJgbAKu
         lyiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS9UB67bLXciRjBKbbeB3Jyq2jbt3RkYI1yi5qJTo8mC8P/iP4kFAshICs4UMmwAbCbdSV678eTEisgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwG96WezZGfJ2ULFFjkYmliOGQ5ZQTtaltG2uD+wGOaLmopQOc
	JI1bp6KyOPWJJJXMD6N/EsQD6jEAo5Dd5a6eHpidZmk4iStKkS4+0z9s30kUgDNYuNlw1NcT7/l
	gqx2RIg==
X-Gm-Gg: AY/fxX51f6+oe/0yPTdToIzYMlCuLuoW6xt0dsev+W3d7il5MNx3BM4btj0HCgxiBk8
	9JzNeIYxpSsXq4QkqaljrDH6sZqglZp+btpCKokzRK1mwVT+RLoj+juKXLdn8N4Kk3oiafl4rnH
	eb8RkobaFhbC7rLcgAUFzT5420UyMytdoXWetpR15V4lowr1xqeWnNnnm7DHiX3HlN47/7vuoWf
	A/DD49Mpp1e3wkE+lPfWkI4P6s05kdFG8eUKmuB8/js7Vy2KpC5RJjEhJJdHqfGcwWtQUx+QH7L
	cAoQ0iff//93Pz2iO5BelBCKsRf79FG6z1Gru1CaL6hNgABxEjX0W/i4l58/Cz3u3wIzGyeN/4+
	tEteAV4SSp7l8HXQmOs8l4IxorXbJhHMUGsUNsaIcPrIOwXNJfM3b4OgMcBoE7pwSZlPHK93m76
	EPr4IJkzzG+O40bnhiqNTDH0UIGa/laxpmH0TFUzB89IhMUH9J
X-Received: by 2002:a05:6512:39d1:b0:597:de28:5fe8 with SMTP id 2adb3069b0e04-59ba0f73a16mr1301725e87.8.1768462393328;
        Wed, 14 Jan 2026 23:33:13 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1045ba7sm1431529e87.75.2026.01.14.23.33.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 23:33:11 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59a10df8027so742574e87.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 23:33:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXg5l+cEAEPlGzY9fyqZyvC3MB9Rl8aSda0kU2DZXgeQQCv4IXm5bR0RWfbJXAsK+5Oh0028alm5PWf/A==@vger.kernel.org
X-Received: by 2002:a05:6512:3a8b:b0:59b:9acd:5e7b with SMTP id
 2adb3069b0e04-59ba0f76889mr1697650e87.12.1768462391007; Wed, 14 Jan 2026
 23:33:11 -0800 (PST)
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
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de> <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
 <dc4c95e6-d19d-414a-a7ae-401dacbaebfd@ralfj.de>
In-Reply-To: <dc4c95e6-d19d-414a-a7ae-401dacbaebfd@ralfj.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 15 Jan 2026 08:32:57 +0100
X-Gmail-Original-Message-ID: <CANiDSCuse+=+MrDUFc_Sd1zXvtY9TDrX0GF6bs2_w34b03Djkw@mail.gmail.com>
X-Gm-Features: AZwV_QiNASIHUOqkWA-quujMc5WRU5pvD3mkmZGB7mRSknAOSGs3Ql0x7z_N39s
Message-ID: <CANiDSCuse+=+MrDUFc_Sd1zXvtY9TDrX0GF6bs2_w34b03Djkw@mail.gmail.com>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD Pro
 Webcam shows flickering artifacts (sometimes)
To: Ralf Jung <post@ralfj.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1121718@bugs.debian.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Some updates.

- We have delayed removing the nodrop parameter, so the mitigation
will work for some more months.
- Zoom has confirmed that they have managed to repro the issue and
they plan to fit is for version 7.0.0 of their application.

Regards

On Mon, 5 Jan 2026 at 20:27, Ralf Jung <post@ralfj.de> wrote:
>
> Hi Ricardo,
>
> > Now about the error flag. I have given a fast look at your usb trace
> > and have only seen 4 frames with "error bits" [1]. Can you add more
> > tracing?
> > Do something like:
> > rmmod uvcvideo
> > modprobe uvcvideo trace=0xffffffff
> >
> > Then start zoom, trigger the error and share the content of your
> > dmesg. It should contain an explanation of why the driver thinks that
> > the frames are invalid.
>
> I have attached the log from when I started zoom until I closed it. All I can
> see there is "Marking buffer as bad (error bit set)" but I assume all of the
> other things there will mean a lot more to you. :)
>
> Kind regards,
> Ralf



-- 
Ricardo Ribalda

