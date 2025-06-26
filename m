Return-Path: <linux-media+bounces-36038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 087D7AEA649
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 21:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA1F54A8012
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 19:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920222EFD9D;
	Thu, 26 Jun 2025 19:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIuVPbbW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538DE2EF9BE
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 19:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965604; cv=none; b=PAyVaEAVauiMy5EwEfxOHLWOk49GKxd4WCWmSxo3FJGxzbYOAn91z6x/mXt0CLkT4+hbxOz3/zCpd0QophGha1u79QgmvBnYcjItuL8jrRtoQxJcgcwEylYYMlQdw6nuABYuuuU590B4P8WibaGCG/eDavylLKJNrpwj+gcbfoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965604; c=relaxed/simple;
	bh=NXZiagHgTh4ICA7Z9PcDT/eyqyxuGCGLWpxNSBxlOw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lymzle2f37BwWAKoFzaCgjv2MjIVaghHsXBOdVzUSMOGaGY6Vvv6BavQPhlNBrDg+iF8XNVeW/F/eICNyfGt27j2i6hglkQceuqs6xNrc+I14yKOnbCmAIb9kbJ3hAyO3uFK/MfNeKi00eNO3ciRuTabAAdyqvDzvw1+5foGVdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIuVPbbW; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-40ab5bd9088so936219b6e.0
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 12:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750965601; x=1751570401; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jw2OSuwMAy9W3gBCyzotqn/e/diunkHgHz26UnXH3Nw=;
        b=iIuVPbbWVInQpHTSprJ00+lT6wWh02neX7BbaD18PF04kpXUOkt4kUymkIB0Xz03wN
         5ApOnyonMmn7fTP1R755abBMy5NjYxXxK+qQvgJV0cVIwJPEQweuVpfOXjikt8/29n3f
         PHVls6a6qTSBmKHm0XO9XR4HnDE9209W2RDmpmHET+SKdOVdgkztFnZieK0fgFxHm4pP
         q2I+BLpz6tjjarb5iPzkeakbBBUNeqiXNEf+ajj6IUnH3G43Z3y+liiiEseAj5918JZ2
         nUExCTIgacmxWn/0GBPeNquKMb+9BD8Zce4oQj7yVvs8CfZA9akn/LwpVKv+F37x900Y
         R7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750965601; x=1751570401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw2OSuwMAy9W3gBCyzotqn/e/diunkHgHz26UnXH3Nw=;
        b=X/0GShRs9hHDPUc47Pm9ZvuP4bT90R4nIyzkjrPWqgZguVpZ8SEBgD6nZ/HYLkEykl
         0OKvfVjZl4HuZN++p3DnUz0jLI26gttEL/1cwswaYWpWtTbPLMHwFU9SV6pDxIN+olGM
         gLX504BY5BCF+Aj5apI6xNuPhkhNml9TZntBrr3HG+UKzCqrKLYMp6M4HNMoFYMiKMJR
         Amdxwhmp0kRioWXJ+DhbCkT17iYYrvkINJhC9g5MxM2nhTYrLo2uwsTQxd3t7IXOSIQ7
         LZpP6umOxhjjutSS3Gtgfiy/t/0Dhk+iBjgKp2mVSjISarPln3P5FwfhqD3PUgTHq8dU
         PVvg==
X-Forwarded-Encrypted: i=1; AJvYcCVNa8kLqA79LEKUW4s6p7kb0+AElAf+ZcSdYlqBmqALkr71M5GSGWpyK3QNFgrUVFSQJFOijMH1y3Ddyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyypa1FzDCxCXssOQGNhoaWn0oVqchC2eZDjYuJw1j78aQylKfU
	42KbXGZkY/0AauXkBTYtY4Cre0l4m0Ze1afkELv134m8DKMFvopjJm8rfgsj314Dno8=
X-Gm-Gg: ASbGncvqcR21WPuiKGrSb2M+UeJO57SnPYnYcOi3EEhWM0V3Ios2aNKaRr588VU9hE5
	ihuqFKHiUElWOxTHM3GHe7Kp9rwtxutpP0fX0yAvml5V7ozMYzM2YJGPQE0l6NXff3XfhiibUtg
	Pye7Oj/xVvaDwkAEjWS3FN6Qrrp/Qd6UsS7I50Nux2eNTdFjIlRVqpP+ys5S6kknIOibO3y/b2m
	BBfPrSkqVOaPQrASLdfzs8223AHqSbAYO31wvJ54W8/OC2dv1hsJC5Yzds9t3qUrVplNsHEdGNT
	NgJBBLw5q3VGe+VTe3JQDGZBUXLuX0EPTAmY240G29jpAnjlaKUB4kYdbj4BtjFgwlfZ
X-Google-Smtp-Source: AGHT+IFY7CJ7QeQO5lGm3SZuq1NkH2K1MhQoLCsDuDsQ1TcbQSnB0KYdrUkAGt1PGEgX5gAvdU6Ntw==
X-Received: by 2002:a05:6808:1592:b0:401:e67c:b3be with SMTP id 5614622812f47-40b33c495a1mr285207b6e.4.1750965601252;
        Thu, 26 Jun 2025 12:20:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322b1d89sm75889b6e.19.2025.06.26.12.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 12:20:00 -0700 (PDT)
Date: Thu, 26 Jun 2025 22:19:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <8b08f2a3-8219-49b8-be47-fc33a95a3953@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
 <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
 <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
 <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>
 <5d579b8c-0676-46d8-a020-77ee91e1e7d3@suswa.mountain>
 <CAGn2d8PdiBRN09L__XEsH=cNYz4rDR2A-GnSqCM6Y5TmtT+wcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8PdiBRN09L__XEsH=cNYz4rDR2A-GnSqCM6Y5TmtT+wcw@mail.gmail.com>

Thank you.  This is good analysis.

On Thu, Jun 26, 2025 at 06:19:40PM +0300, Abdelrahman Fekry wrote:
> Hello Dan , Thanks for your review
> 
> On Tue, Jun 24, 2025 at 9:31 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > Yes.  Nothing is checking for if hmm_init() fails.  Step through the
> > code and verify that nothing crashes or bad happens as a result.
> >
> > For example, I think hmm_bo_alloc() will print "hmm_bo_device not inited
> > yet." and return.  So that's kind of annoying but it's not a crash.
> > Search through the rest of the driver and verify how it will behave.
> >
> 
> So, I have been searching through the code as you suggested,
> and found a couple of interesting things to look at.
> 
> Firstly, no function that calls hmm_init() checks its return code,
> and it doesn’t crash anywhere because of this, so it's not a problem.
> But the thing is, the hmm_initialized flag inside the hmm_init() function
> is set even if hmm_bo_device_init() fails, and this can be misleading for
> functions like __hm_alloc() that check this flag later.

Yeah.

> 
> Secondly, the function hmm_bo_alloc() and others don’t check
> the return code of hmm_init().

hmm_init() is called from two places, atomisp_pci_probe() and
__hmm_alloc().  Is it really possible to call __hmm_alloc() before
atomisp_pci_probe() has succeeded?  That's an important question.
Please try to read the code and find the answer.

It would be better to only call hmm_init() from the probe function
and delete the call in __hmm_alloc() but I don't know if that's
possible.

> Instead, they check the flag
> HMM_BO_DEVICE_INITED inside bdev, which is set by the function
> hmm_bo_device_init(). The problem is, if we inspect hmm_bo_device_init(),
> we find that the HMM_BO_DEVICE_INITED flag is set before the calls to
> kmem_cache_create(), kmem_cache_alloc(), and __bo_init().
> This means that if any of these functions fail, the flag will still be set,
> which can lead to misbehavior in functions that rely on it, like hmm_bo_alloc().
> 

Yeah.  That seems correct to me too.

> Should I tackle these problems after submitting the original patch of
> removing the debug sysfs attr. ?

Perfect.  Sounds good.

regards,
dan carpenter


