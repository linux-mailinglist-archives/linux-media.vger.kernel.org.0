Return-Path: <linux-media+bounces-11783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 600BF8CCF7F
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B95A9B20B5B
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 09:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EE713D298;
	Thu, 23 May 2024 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="A7BKMpgH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F2E13B58D
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457293; cv=none; b=n9oOZ+xLLHciTaKaQohfZ3GlJIpBBhnpKAmn/YV/0aOpzdNSGgTzWJUlrkoO7wz7YRxqIs8GOeTjijYGDw7ps7Md7J+AP4tZzX6UliFx9JOGiWJ6M+MSYZ5T9ohywsQMdHBwFNcUY+qQWaUBmME1jD/sJ/qWFdWFCDXCvm0jYN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457293; c=relaxed/simple;
	bh=j2zvU3m0yzWo1+kw71p/VfCXySbVS/PxKnovAE6DvVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFp10GcGqQxdCL68wjjeCnSFVu1HRETHoN5t+6Ijb/ixH+9v/BL6qtqbx0WDHn7/oBHYA39OrA1Un3XGMOXI6BGWpaaa96dy8V2/qaE5OTYUOjxk9KmGhokJfmIxpa4l9KQkDdEPYmYccaVlQdeUoLa3ONf8JGdQD/Kjjyc/GFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=A7BKMpgH; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e2da49e86bso9345591fa.0
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 02:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1716457289; x=1717062089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7P0FBG/QIqolUidBUOAk5xSpyavQelBrO3qhLkdkCo4=;
        b=A7BKMpgH4ry3m1y24XN02Euv9t7X+SIKSTFivWGVX4sz1v8D4dX1ZIoO/13Mw9A3JI
         iavQSwWhm23vGsi0Z25bOqGWWOoxAmFuqvjI4lDqxG/SGpFzFdGFEOLKjWnY+k8Iswga
         UMXgaNDEinuWp7G0Pp2lekJjLOti1NQNpU7dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457289; x=1717062089;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7P0FBG/QIqolUidBUOAk5xSpyavQelBrO3qhLkdkCo4=;
        b=FXjSkj9h0+DA11hoh3oOowJRBvdsrPfpn9OMXs62r3jX8/vzPRznZZAEYLi/QkcSWZ
         REukZ3DuFZ6bR1N6/7yAWWiLzpMqmqCYX3aqPbQTlZPh6+D9jO/iMOh54lcystmztfVp
         ptWccCAtLngBx1ZB+X3pklHt0jp49WFG7uZstgCn2lMHuKNfL03sUVyMO3N2o/7H5yK5
         dPz/LmYnmS4UdxzTnn6NjUEU6694tUMyEUTFiAF7zHBaXe7/Lxev7LZuyuj7f6641zZG
         9y71waIDHcUrOtsmkqmtEFZQkrJxFu1Df05s1fXGJG/uefbAJKJdC6yZI9lzdY7tkKl6
         Ckgw==
X-Forwarded-Encrypted: i=1; AJvYcCWBycpbidrHdhZBLtuYXY+XLitE1DQtMO4OoLV9QdXww3r5ZaCvsS5RYt/yc/SyLCgAthUcovFS6BDet772V1m1jpwEZckmirMFN6k=
X-Gm-Message-State: AOJu0Yz45PKjOMUhixRMG+IvGDC9b1pPmlPHvjm5R69MdpvzIiKtesw7
	ibuyYwbse60nCL3nD3djGXeTOs28sub2PP/5rGB/KDK3KhZmYsxeswbtzOM5Dcs=
X-Google-Smtp-Source: AGHT+IFaHOu/jiCn9us1S7Kl07ly0fz0c0NxfGK+ttvGXc3VpkRIbozFwpms36yompxRaMGcJtJGuA==
X-Received: by 2002:a2e:7214:0:b0:2e8:e8db:34ea with SMTP id 38308e7fff4ca-2e9496214edmr30640171fa.5.1716457288819;
        Thu, 23 May 2024 02:41:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee806esm20062515e9.3.2024.05.23.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:41:28 -0700 (PDT)
Date: Thu, 23 May 2024 11:41:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
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
Message-ID: <Zk8PRuDHiS0QZLD-@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@redhat.com>,
	Hans de Goede <hdegoede@redhat.com>,
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
 <20240522-thankful-cow-of-freedom-f0cbf8@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522-thankful-cow-of-freedom-f0cbf8@houat>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Wed, May 22, 2024 at 03:34:52PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Mon, May 06, 2024 at 03:38:24PM GMT, Daniel Vetter wrote:
> > On Mon, May 06, 2024 at 02:05:12PM +0200, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
> > > > Hi dma-buf maintainers, et.al.,
> > > > 
> > > > Various people have been working on making complex/MIPI cameras work OOTB
> > > > with mainline Linux kernels and an opensource userspace stack.
> > > > 
> > > > The generic solution adds a software ISP (for Debayering and 3A) to
> > > > libcamera. Libcamera's API guarantees that buffers handed to applications
> > > > using it are dma-bufs so that these can be passed to e.g. a video encoder.
> > > > 
> > > > In order to meet this API guarantee the libcamera software ISP allocates
> > > > dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> > > > the Fedora COPR repo for the PoC of this:
> > > > https://hansdegoede.dreamwidth.org/28153.html
> > > 
> > > For the record, we're also considering using them for ARM KMS devices,
> > > so it would be better if the solution wasn't only considering v4l2
> > > devices.
> > > 
> > > > I have added a simple udev rule to give physically present users access
> > > > to the dma_heap-s:
> > > > 
> > > > KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"
> > > > 
> > > > (and on Rasperry Pi devices any users in the video group get access)
> > > > 
> > > > This was just a quick fix for the PoC. Now that we are ready to move out
> > > > of the PoC phase and start actually integrating this into distributions
> > > > the question becomes if this is an acceptable solution; or if we need some
> > > > other way to deal with this ?
> > > > 
> > > > Specifically the question is if this will have any negative security
> > > > implications? I can certainly see this being used to do some sort of
> > > > denial of service attack on the system (1). This is especially true for
> > > > the cma heap which generally speaking is a limited resource.
> > > 
> > > There's plenty of other ways to exhaust CMA, like allocating too much
> > > KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
> > > differently than those if it's part of our threat model.
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
> > 
> > So you need more, either:
> > 
> > - cgroups limits on dma-buf and dma-buf heaps. This has been bikeshedded
> >   for years and is just not really moving.
> 
> For reference, are you talking about:
> 
> https://lore.kernel.org/r/20220502231944.3891435-1-tjmercier@google.com
> 
> Or has there been a new version of that recently?

I think the design feedback from Tejun has changed to that system memory
should be tracked with memcg instead (but that kinda leaves the open of
what to do with cma), and only device memory be tracked with a separate
cgroups controller.

But I'm also not sure whether that would actually solve all the
tracking/isolation requirements people tossed around or just gives us
something that wont get the job done.

Either way, yes I think that was the most recent code.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

