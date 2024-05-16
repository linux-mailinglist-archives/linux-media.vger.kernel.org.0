Return-Path: <linux-media+bounces-11517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3488C747A
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F4491F21335
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 10:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD31143C6D;
	Thu, 16 May 2024 10:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="hiEBmSY3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E4414389A
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715854429; cv=none; b=LNj4oNcSq5ahzfhum4V2do8QIWLrvL2hEdTL3/dBkbc2gB6G3BGKk0gsh3v47VB/Jx2Mc+mbYMu+V2OkaTLKuE97znYgYrMRBQe2nwtZqDC37lrWyPj5aVnjyoU1wAZZoY0TyL84/tw5q5mdQTYoybJ4j0AZBx5zQcD7LjKTKT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715854429; c=relaxed/simple;
	bh=dOR/ny3pz9kfQwFcgXRjlCUW7XWcutqJSgnmykXQ5jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNsnkxUo9U13WnCIS7WqQfADt9mNfhsPxkKzcCaAbKGrn1pZle8K3xlUrnCFDAD1KzdObZtHwjCeE580dDbLtwA4AvPv2d9DphQjxCT7F9IUK2q6olW6/odjCDTsbVRj3QLFp5KRMqV6n1/ktMlaF47ha00dFUxCVkkHC1GFe/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=hiEBmSY3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34cb2bf85easo690710f8f.3
        for <linux-media@vger.kernel.org>; Thu, 16 May 2024 03:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1715854424; x=1716459224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PL3A+Lq5qsI8B7R3zJ6ATrmpbf8tbtcXF50Qd0vm4po=;
        b=hiEBmSY3h9G5fPLQzk58uJBPgg9wd1ZwwYFfawHgGwYnJY8lfISunqZhX3lADkLaX3
         9zWwdptLz25USHQlltXijTt+hxY0oJCJmTkwVg8cdgEJENdGXoCmt2xWIZnrlTWZPSEx
         vCFV6W0Ue1fhk7IecLRsR51SaAFuGY/LlKlGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715854424; x=1716459224;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PL3A+Lq5qsI8B7R3zJ6ATrmpbf8tbtcXF50Qd0vm4po=;
        b=BYc8R+CcaXytVDKQbVjXNHXAkTsRlVpGgcz26iJ9Nw2PVF8bxUQ3xWh3mm1dOEKRoT
         tMhK2qwEJLDoIdWFW09q9HBelhhyulbL0PmmiZ5meHm385ENLUusleFWINcNhoQ6Ybiv
         x7cfCwi996dB00BhLp07GL8lzkRL7kTbE/Deta1F4iDs++Ki7mE0rd6/B0aJLfeGgRAU
         8VLvJBweWpFHd3tDfC0Fm27GWRswLDuNI317Cr2yjjrTztyu4VQDumtd0n7KmbXs971T
         qdTBNR0JyXLnCf2RpcgLhG30KImDf6fM7P1MiU8xp97qNHGzvQY4l/wfJ0kZZayiSi7Z
         ZAew==
X-Forwarded-Encrypted: i=1; AJvYcCWwyS/oNz01/Mu7FBP7PwMenILLGclSlfV9tFEDz4VI2zY6OzAfCs+O61WjzxshSpEFcZnh6ZOo6AC3IvXHIIb1KwB+vTSLFO2FvjM=
X-Gm-Message-State: AOJu0Yy+eVRwNhN1lCxI4R6yfAoW9+MUHgPqFYjjTFrGFRY7n56bCYcm
	dOORiPs69WidQRnmrpS8UguX8XBxTyxGP+Lp5esbvZAf0GdH0I0MjgAb/hf/wxQ=
X-Google-Smtp-Source: AGHT+IFrOu2mAt7C1aMAaNxTCLbsYbd5mMBXhq9WratikDD42kzQoLe9iHoqPgFyU07inK7XLQ9rtw==
X-Received: by 2002:a05:600c:19c8:b0:419:f241:6336 with SMTP id 5b1f17b1804b1-41fea928decmr132296285e9.1.1715854424390;
        Thu, 16 May 2024 03:13:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f87b2653bsm298218605e9.4.2024.05.16.03.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 03:13:43 -0700 (PDT)
Date: Thu, 16 May 2024 12:13:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <mripard@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Robert Mader <robert.mader@collabora.com>,
	Sebastien Bacher <sebastien.bacher@canonical.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Milan Zamazal <mzamazal@redhat.com>,
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <ZkXcVVt_G3TEh2iP@phenom.ffwll.local>
Mail-Followup-To: Simon Ser <contact@emersion.fr>,
	Daniel Stone <daniel@fooishbar.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <mripard@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Robert Mader <robert.mader@collabora.com>,
	Sebastien Bacher <sebastien.bacher@canonical.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Milan Zamazal <mzamazal@redhat.com>,
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
 <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
 <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
 <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
 <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
 <Zjue98r4ZgGbMN5K@phenom.ffwll.local>
 <IXDM2ci-eGvU9RQkT6a52vcV66vr8d0ywbDRFY8gBjjNuMyv8RDgdJS0PvvfnKuPR1fXINPUjOBkKx4vIcshSb2Y11xd3DjfDQ-Np8VIFgQ=@emersion.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IXDM2ci-eGvU9RQkT6a52vcV66vr8d0ywbDRFY8gBjjNuMyv8RDgdJS0PvvfnKuPR1fXINPUjOBkKx4vIcshSb2Y11xd3DjfDQ-Np8VIFgQ=@emersion.fr>
X-Operating-System: Linux phenom 6.6.15-amd64 

On Mon, May 13, 2024 at 01:51:23PM +0000, Simon Ser wrote:
> On Wednesday, May 8th, 2024 at 17:49, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Wed, May 08, 2024 at 09:38:33AM +0100, Daniel Stone wrote:
> > 
> > > On Wed, 8 May 2024 at 09:33, Daniel Vetter daniel@ffwll.ch wrote:
> > > 
> > > > On Wed, May 08, 2024 at 06:46:53AM +0100, Daniel Stone wrote:
> > > > 
> > > > > That would have the unfortunate side effect of making sandboxed apps
> > > > > less efficient on some platforms, since they wouldn't be able to do
> > > > > direct scanout anymore ...
> > > > 
> > > > I was assuming that everyone goes through pipewire, and ideally that is
> > > > the only one that can even get at these special chardev.
> > > > 
> > > > If pipewire is only for sandboxed apps then yeah this aint great :-/
> > > 
> > > No, PipeWire is fine, I mean graphical apps.
> > > 
> > > Right now, if your platform requires CMA for display, then the app
> > > needs access to the GPU render node and the display node too, in order
> > > to allocate buffers which the compositor can scan out directly. If it
> > > only has access to the render nodes and not the display node, it won't
> > > be able to allocate correctly, so its content will need a composition
> > > pass, i.e. performance penalty for sandboxing. But if it can allocate
> > > correctly, then hey, it can exhaust CMA just like heaps can.
> > > 
> > > Personally I think we'd be better off just allowing access and
> > > figuring out cgroups later. It's not like the OOM story is great
> > > generally, and hey, you can get there with just render nodes ...
> > 
> > Imo the right fix is to ask the compositor to allocate the buffers in this
> > case, and then maybe have some kind of revoke/purge behaviour on these
> > buffers. Compositor has an actual idea of who's a candidate for direct
> > scanout after all, not the app. Or well at least force migrate the memory
> > from cma to shmem.
> > 
> > If you only whack cgroups on this issue you're still stuck in the world
> > where either all apps together can ddos the display or no one can
> > realistically direct scanout.
> > 
> > So yeah on the display side the problem isn't solved either, but we knew
> > that already.
> 
> What makes scanout memory so special?
> 
> The way I see it, any kind of memory will always be a limited resource:
> regular programs can exhaust system memory, as well as GPU VRAM, as well
> as scanout memory. I think we need to have ways to limit/control/arbiter
> the allocations regardless, and I don't think scanout memory should be a
> special case here.

(Long w/en and I caught a cold)

It's not scanout that's special, it's cma memory that's special. Because
once you've allocated it, it's gone since it cannot be swapped out, and
there's not a lot of it to go around. Which means even if we'd have
cgroups for all the various gpu allocation heaps, you can't use cgroups to
manage cma in a meaningful way:

- You set the cgroup limits so low for apps that it's guaranteed that the
  compositor will always be able to allocate enough scanout memory for
  it's need. That will be low enough that apps can never allocate scanout
  buffers themselves.

- Or you set the limit high enough so that apps can allocate enough, which
  means (as soon as you have more than just one app and not a totally
  bonkers amount of cma) that the compositor might not be able to allocate
  anymore.

It's kinda shit situation, which is also why you need the compositor to be
able to revoke cma allocations it has handed to clients (like with drm
leases).

Or we just keep the current yolo situation.

For any other memory type than CMA most of the popular drivers at least
implement swapping, which gives you a ton more flexibility in setting up
limits in a way that actually work. But even there we'd need cgroups first
to make sure things don't go wrong too badly in the face of evil apps ...
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

