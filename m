Return-Path: <linux-media+bounces-10876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95E78BCF4E
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 15:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D005284E1A
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 13:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FE577F2F;
	Mon,  6 May 2024 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="bCio00bX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFDE78C6B
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 13:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715002710; cv=none; b=c4dISx2KFuhFP1AJyuq8I2AVtlG0Ljz55V3SyU0GcIfu3x2KrXCtAjwzsVG9dtB1+jVpazVra7KveU9mDfgZX8jU/v87q7DJKgdTbVfcnOoMwJa9mEAL2vpK4BVdn/9MKEmwdlbuh2mReBJdO1Tyg8283OaYPs6UNavJ2DPTO9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715002710; c=relaxed/simple;
	bh=It9OpP6gC8bm5/vZVTQBOX1m6p9O8bYlAf/OdYb0psI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqkhbTrn9UpzTS/0U/Xg4gJ/0C1kmuL3GjF3oRF/0OQeA5uHbF6DfDUuzTtrSprjP+tBV3aeHNfisX4MFao5FXPioFiD+OklO823c14KKmUglVUJCcXpj81jeDUFinc4uN+wuzunrMrnK/2ymFw5klcJSLuGS3cJ32YUYliwGSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=bCio00bX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34e6aaa4f51so195631f8f.1
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1715002707; x=1715607507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05pEfdeTjP/gT4q1VDqtZ2Mm8b7W7bMEgQ0JTj2r+x4=;
        b=bCio00bXGx0rOEGQgsW+cyXPMAEaUjZkVmv9Z7YAHR6pj3cpRxYr/aru5n6RBrblc6
         h1G6rCGNRQlyim87RXhMzcGeG5Ngc1NIMellFQdSoDyeKM5PWa+s8u5Fh1f6BqVclRl8
         Wb9qkrOeAGjMnjxHIA9olZ0LbNav8fYqSWbR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715002707; x=1715607507;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05pEfdeTjP/gT4q1VDqtZ2Mm8b7W7bMEgQ0JTj2r+x4=;
        b=lAl/U/aXFKGetP421l1H8KfC4rHo0iG6sMW7i2rdzXtDuyypn4aOGovPDkv+Gg0mKD
         lCz2B61Q4Hy98YRHdCAQ6fsQ2nawf95tsX68EDbU4nd9i6lAzPQslqfyJW3v5XHORFuO
         A/CboHbtjeViSwkpQYmhFTcQ/RsCa3d1i6sDloo48QfxMmyaSVuxgQChkypva+aN/YSo
         ROWpgNwm9g/2oD/EuVCiJ1bijNBE+kkNgseb/rbVMyYgFmVZFen4LUS1PnQIRYIJlpcS
         vRHEKkqnfuiz/Wijzo4svftUnj2W8gg6q7VDT0kBceeQYi0vICb7GTt/NEOwAts1wIF5
         ZBdA==
X-Forwarded-Encrypted: i=1; AJvYcCX5PoxUM5UfesOsi4ecW8a0vKB4EZWTiTkUiKRdq3vvQ9h/LBioEIIM2tcguvcTxgezZowhBgIUvQ+dOTFmtbeVHImEDPp8vkBDaY4=
X-Gm-Message-State: AOJu0YzBACtzHpAA/IkqhHNMy5uVKbW90n5rIXi2Q5f6ywmjQlfd8qy9
	0+d1RA6MaZi+w6p2T9FClaQUNc+ufQ9ZrV7mJnwinZF9OFZHb/xiReF0zB8+Pwo=
X-Google-Smtp-Source: AGHT+IH7ayM64/spWVTg0bt9PNCN0djXyEwU/JmnpSrNT6A7B8ioiDdqWIOL0raGgmZcVRIsEpla+w==
X-Received: by 2002:a05:600c:46cf:b0:41a:bb50:92bb with SMTP id q15-20020a05600c46cf00b0041abb5092bbmr7391993wmo.0.1715002707370;
        Mon, 06 May 2024 06:38:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z5-20020a05600c0a0500b0041bd85cd3f2sm16051523wmp.19.2024.05.06.06.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 06:38:26 -0700 (PDT)
Date: Mon, 6 May 2024 15:38:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
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
Message-ID: <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
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
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506-dazzling-nippy-rhino-eabccd@houat>
X-Operating-System: Linux phenom 6.6.15-amd64 

On Mon, May 06, 2024 at 02:05:12PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
> > Hi dma-buf maintainers, et.al.,
> > 
> > Various people have been working on making complex/MIPI cameras work OOTB
> > with mainline Linux kernels and an opensource userspace stack.
> > 
> > The generic solution adds a software ISP (for Debayering and 3A) to
> > libcamera. Libcamera's API guarantees that buffers handed to applications
> > using it are dma-bufs so that these can be passed to e.g. a video encoder.
> > 
> > In order to meet this API guarantee the libcamera software ISP allocates
> > dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> > the Fedora COPR repo for the PoC of this:
> > https://hansdegoede.dreamwidth.org/28153.html
> 
> For the record, we're also considering using them for ARM KMS devices,
> so it would be better if the solution wasn't only considering v4l2
> devices.
> 
> > I have added a simple udev rule to give physically present users access
> > to the dma_heap-s:
> > 
> > KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"
> > 
> > (and on Rasperry Pi devices any users in the video group get access)
> > 
> > This was just a quick fix for the PoC. Now that we are ready to move out
> > of the PoC phase and start actually integrating this into distributions
> > the question becomes if this is an acceptable solution; or if we need some
> > other way to deal with this ?
> > 
> > Specifically the question is if this will have any negative security
> > implications? I can certainly see this being used to do some sort of
> > denial of service attack on the system (1). This is especially true for
> > the cma heap which generally speaking is a limited resource.
> 
> There's plenty of other ways to exhaust CMA, like allocating too much
> KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
> differently than those if it's part of our threat model.

So generally for an arm soc where your display needs cma, your render node
doesn't. And user applications only have access to the later, while only
the compositor gets a kms fd through logind. At least in drm aside from
vc4 there's really no render driver that just gives you access to cma and
allows you to exhaust that, you need to be a compositor with drm master
access to the display.

Which means we're mostly protected against bad applications, and that's
not a threat the "user physically sits in front of the machine accounts
for", and which giving cma access to everyone would open up. And with
flathub/snaps/... this is very much an issue.

So you need more, either:

- cgroups limits on dma-buf and dma-buf heaps. This has been bikeshedded
  for years and is just not really moving.

- An allocator service which checks whether you're allowed to allocate
  these special buffers. Android does that through binder.

Probably also some way to nuke applications that refuse to release buffers
when they're no longer the right application. cgroups is a lot more
convenient for that.
-Sima

> > But devices tagged for uaccess are only opened up to users who are 
> > physcially present behind the machine and those can just hit
> > the powerbutton, so I don't believe that any *on purpose* DOS is part of
> > the thread model. 
> 
> How would that work for headless devices?
> 
> Maxime



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

