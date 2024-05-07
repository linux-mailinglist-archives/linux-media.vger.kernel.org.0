Return-Path: <linux-media+bounces-10981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A18A98BE0C5
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A1541F223AE
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 11:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00037152163;
	Tue,  7 May 2024 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Lw0aGt4j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E739C13CFAD
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715080533; cv=none; b=q90uTvm6unBabhGllkNvYJLisjuhD8QyaZkvZd3O30v1wkUHv9NpqXOwlNDGGabDVUlz0rb9bZg4UsH9nzJRjedCLOcaKcZexz7g/WpB60T1sBALK2wwSC+lZDmFsyXaYztfYL4/EBcJQ+iugApIu++g215OyTjrvG7RjMU+ZKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715080533; c=relaxed/simple;
	bh=cg+Ro88ytJjd/fd08mRf8Cz6ImUq4vWBcpmoLF+uj6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NicfVnbMKgYSCbTIlgXxe4+I93ycv6xdZvlUKN4+1vjfD/i7n5g70/kF583NCL1U9X19dIhvfxrl5zYIlwzTQ4++VWnunCAiVhaAZFkdsHW3a1meqXkWHpCQOf7XGzwPlOjS454V14H50WF6BRb96uf0uz7NjztRmeovwLcW+m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Lw0aGt4j; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-346407b8c9aso905202f8f.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 04:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1715080530; x=1715685330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXHaXKdqUHwPFQAJMHKHEEcPt9R1JT6UoeAkdx1FiUQ=;
        b=Lw0aGt4jy3dTDdTuxyoeQT/ZRaFMncE8c0QbvGvgLoK1CPB8glR2J60YilKswlABWL
         7BJxnW7VY61EI2+jJMoxpnpDe54lryiracbplfdT+MuP/4wUkzk4XRT8elRMTSoBdA57
         sis0nq4I/80RNmGHtYDIGpSllvfFyZ7E1hK7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715080530; x=1715685330;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXHaXKdqUHwPFQAJMHKHEEcPt9R1JT6UoeAkdx1FiUQ=;
        b=i5Zp7FKYpYMmBEKbUSg9812sIaJQoJmBf3zV2hW4DZSjBirVkSOpz+0e3lGcbO2yst
         uWBr5LcQh4ddU2IqQ/f1jJNij8KkXxAYlAK+AIITRnLOvrm7l/WCQy3mRwGJHJiIvnRI
         mmSw0p1oiQ9jNK9ERTwaG8SqliYGE5PozEaNvyHgjVh/Gjdy9v6+BJqpAIDRQ2YQeY1i
         B9qNl6deTanbtAYWvJXtSQbil0R7l8dB8n8lhIDY3NX3Q+coU2/O3z1CsEhaFtEBcyHV
         nBtU3o5laJ/XsBXJ4XR6Fo0RY6aD5FTn6QzTxh9YcZ+/U0urATLKL5w1z+11EBRWIINC
         l2kg==
X-Forwarded-Encrypted: i=1; AJvYcCVvWnPmECGYgLH1OXyabl3W0BQz0QM1sNJHnd0r3AUaXJVOGuS3LT3/MNT/xME/yDizmLVwkd0Vq77SGkyRxmt6s3SPHA5f6NiFJGo=
X-Gm-Message-State: AOJu0YzBtEDKoBLbqc8iyq+lQhJmH4qKD9uD2GdhEQT/ETrQjRHdxOjr
	gnx+1cnXzWSqnAzfsAhLLQcELaS9lB1wA0dxX6Unw7EwgJBukIjaTE/xzl/prqk=
X-Google-Smtp-Source: AGHT+IGEfDP7fiY2wy+u7QVPwRVnfgZKbf0WPVJ5yp1DcSn44Sb5FY9EGhKJ+yzn6ZLbDpYvJ3fvPw==
X-Received: by 2002:a05:600c:3b02:b0:41a:c4fe:b0a5 with SMTP id m2-20020a05600c3b0200b0041ac4feb0a5mr8937623wms.4.1715080530250;
        Tue, 07 May 2024 04:15:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id d10-20020a05600c3aca00b00418e4cc9de7sm22960582wms.7.2024.05.07.04.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 04:15:29 -0700 (PDT)
Date: Tue, 7 May 2024 13:15:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maxime Ripard <mripard@redhat.com>,
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
Message-ID: <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
Mail-Followup-To: Hans de Goede <hdegoede@redhat.com>,
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
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
X-Operating-System: Linux phenom 6.6.15-amd64 

On Mon, May 06, 2024 at 04:01:42PM +0200, Hans de Goede wrote:
> Hi Sima,
> 
> On 5/6/24 3:38 PM, Daniel Vetter wrote:
> > On Mon, May 06, 2024 at 02:05:12PM +0200, Maxime Ripard wrote:
> >> Hi,
> >>
> >> On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
> >>> Hi dma-buf maintainers, et.al.,
> >>>
> >>> Various people have been working on making complex/MIPI cameras work OOTB
> >>> with mainline Linux kernels and an opensource userspace stack.
> >>>
> >>> The generic solution adds a software ISP (for Debayering and 3A) to
> >>> libcamera. Libcamera's API guarantees that buffers handed to applications
> >>> using it are dma-bufs so that these can be passed to e.g. a video encoder.
> >>>
> >>> In order to meet this API guarantee the libcamera software ISP allocates
> >>> dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> >>> the Fedora COPR repo for the PoC of this:
> >>> https://hansdegoede.dreamwidth.org/28153.html
> >>
> >> For the record, we're also considering using them for ARM KMS devices,
> >> so it would be better if the solution wasn't only considering v4l2
> >> devices.
> >>
> >>> I have added a simple udev rule to give physically present users access
> >>> to the dma_heap-s:
> >>>
> >>> KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"
> >>>
> >>> (and on Rasperry Pi devices any users in the video group get access)
> >>>
> >>> This was just a quick fix for the PoC. Now that we are ready to move out
> >>> of the PoC phase and start actually integrating this into distributions
> >>> the question becomes if this is an acceptable solution; or if we need some
> >>> other way to deal with this ?
> >>>
> >>> Specifically the question is if this will have any negative security
> >>> implications? I can certainly see this being used to do some sort of
> >>> denial of service attack on the system (1). This is especially true for
> >>> the cma heap which generally speaking is a limited resource.
> >>
> >> There's plenty of other ways to exhaust CMA, like allocating too much
> >> KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
> >> differently than those if it's part of our threat model.
> > 
> > So generally for an arm soc where your display needs cma, your render node
> > doesn't. And user applications only have access to the later, while only
> > the compositor gets a kms fd through logind. At least in drm aside from
> > vc4 there's really no render driver that just gives you access to cma and
> > allows you to exhaust that, you need to be a compositor with drm master
> > access to the display.
> > 
> > Which means we're mostly protected against bad applications, and that's
> > not a threat the "user physically sits in front of the machine accounts
> > for", and which giving cma access to everyone would open up. And with
> > flathub/snaps/... this is very much an issue.
> 
> I agree that bad applications are an issue, but not for the flathub / snaps
> case. Flatpacks / snaps run sandboxed and don't have access to a full /dev
> so those should not be able to open /dev/dma_heap/* independent of
> the ACLs on /dev/dma_heap/*. The plan is for cameras using the
> libcamera software ISP to always be accessed through pipewire and
> the camera portal, so in this case pipewere is taking the place of
> the compositor in your kms vs render node example.

Yeah essentially if you clarify to "set the permissions such that pipewire
can do allocations", then I think that makes sense. And is at the same
level as e.g. drm kms giving compsitors (but _only_ compositors) special
access rights.

> So this reduces the problem to bad apps packaged by regular distributions
> and if any of those misbehave the distros should fix that.
> 
> So I think that for the denial of service side allowing physical
> present users (but not sandboxed apps running as those users) to
> access /dev/dma_heap/* should be ok.
> 
> My bigger worry is if dma_heap (u)dma-bufs can be abused in other
> ways then causing a denial of service.
> 
> I guess that the answer there is that causing other security issues
> should not be possible ?

Well pinned memory exhaustion is a very useful tool to make all kinds of
other kernel issues exploitable. Like if you have that you can weaponize
all kinds of kmalloc error paths (and since it's untracked memory the oom
killer will not get you of these issuees).

I think for the pipewire based desktop it'd be best if you only allow
pipewire to get at an fd for allocating from dma-heaps, kinda like logind
furnishes the kms master fd ... Still has the issue that you can't nuke
these buffers, but that's for another day. But at least from a "limit
attack surface" design pov I think this would be better than just handing
out access to the current user outright. But that's also not the worst
option I guess, as long as snaps/flatpacks only go through the pipewire
service.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

