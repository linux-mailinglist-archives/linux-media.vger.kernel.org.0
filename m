Return-Path: <linux-media+bounces-31081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A55A9D1FF
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 21:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 436F41894B87
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 19:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C07C21D594;
	Fri, 25 Apr 2025 19:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lHdcyMHH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B052165E4
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 19:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609998; cv=none; b=dpzF5EHn7hnhcLLemtJ/aCuBCdg7FsQcaBm0Zwg6usUWKgxaOhC6TQ3nOG3usNYWPkkvlY45LEA27s4ACqBwlvS2N4afC528OGuGwFVx18gnCU8OoFIytA91v26XN6e2yPsk4pUdF1xKChA6Zg3bX93VAo5Frse7BbweLnzRNgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609998; c=relaxed/simple;
	bh=ryOxdyLcSAv0AGNsueSdWeAlBdewX0rq6J6yIZ9kzHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNYlgcndIsp+VcFCZqMLytYqJsHNGBX7ovdqPaGfgxogLybfh8xWh1NS7qaoyhVjd+fTFQ1o6/+1j+C46kk574VZm6//cL7wf5maMlS96x6SS6I2l/A+fUYIFcqBXQVB/7J7QegwWHIdhlCEnpYAnqolPYvxkIVdBqK2CvkBPkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lHdcyMHH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so2387543e87.1
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 12:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745609994; x=1746214794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfSIX9jpfiWRSxgHFlpEDElrGRa3eqYVEWZZrqsW9bI=;
        b=lHdcyMHHlZ6gumNHBONRXIrjbUufdo5SWZyA0oJHt6d8LQS+w55nL/IxKbI+QTCqYT
         NCBTlh3WaWS8liLq6pBC3Dwd2C4zXugl40x0APBM7DuhRG19E3cI0ldIbRC4+wNW0w6I
         NKmwisJWw0nu5SuM3qQUgV3jExgeSZ7k4uYhjGKCxsPrqHuSu28oJe5/CAYbtktROTgt
         r2DB49z2zNmF4hMhYQ6wdJi9RCuJ8GQkY1Yuz6PBWDMH1lTMQuSTW6wyxjLFLOfovZ89
         qEJFMOEdh46taenC6x4o2fi1n8WVLL6qmIcssAbqwiuEPppOGF4lIjqZE+GzFNdeMMlf
         RLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745609994; x=1746214794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfSIX9jpfiWRSxgHFlpEDElrGRa3eqYVEWZZrqsW9bI=;
        b=VVtAlvLKTdUO/5IXDNUfAzT59F+CSYG6X0yaKh155MF1/4P4vPflN+W7QjEVVbMUSK
         9afsxcUSG4WGEzA0+E0mYE/lLAFl/yjfZP+f5WTmhjPDOjWmKcxT5W7UwDMaceH5FcfQ
         j/AmgChDIL8L1K3VR5rMaEHWlxtgKLw3UnF9Jnsc/+XF33LiMlpdtgW7I7Vtd/UTgnM0
         U7Tly+sV8PGz5q69tJzrrYbdXm08j3UtARvkyyzRfw1WuH6lo37r/94a0vNWwWWHggMi
         VTC+WxEDKZb1jL8ToRUeIg8/XEKrOeV6xRkrGhgMZMBhZ1Cxwr/cQQU5gyS+MaLdk+IE
         mWaA==
X-Forwarded-Encrypted: i=1; AJvYcCULJeRkhUIfWVVXOsyoQqx+2L2VDz3KbMXT5JqgggVF/jSBIy/pL4BueWuhgonz4ql/T6Bstm7VfwkEgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMGibdPs8Q/xbAug1H2hR8V7J4cBkuPPq1Mvkeacqi7IzET2TX
	g8Lwf8A3yBfwXlUi9lW9m1FeC2rXqbiEl/ExOqQC9YVnAYQBbfUom3tO4c7wE3HfJtdo2aKMtx4
	D/x2df6C7zz50hGe5O2Snrq/vBn778KVNSYc=
X-Gm-Gg: ASbGnct69L2ohYEKwV7rutUFdy5MKBpVkzM2EKFgxquDdNSujmrL8/IyRJaFkQW9R+V
	Ff2IhYAjaN4TCdb7KEr0sAe5dget8x/XskSURjs9Q0vlN1OWvXa2s6+W+exdNyuTnVAcPLzdBA/
	xaRUDX9udDbTap+d8o6XFYAbiYVpjVLrkK4hYRFwQf8QnPU3wqo9A=
X-Google-Smtp-Source: AGHT+IHUbAh5N12vJaC4y50M7cNDxVxLCPYrcMSTN18M4pC1Y8L+yTG0UPsfIVPETtsJQssOgUaeDFzFHB1JvR/EmjM=
X-Received: by 2002:a05:6512:239f:b0:549:8db6:b2dd with SMTP id
 2adb3069b0e04-54e8cbe0789mr1187301e87.31.1745609994088; Fri, 25 Apr 2025
 12:39:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com> <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat> <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>
 <20250425-savvy-chubby-alpaca-0196e3@houat>
In-Reply-To: <20250425-savvy-chubby-alpaca-0196e3@houat>
From: John Stultz <jstultz@google.com>
Date: Fri, 25 Apr 2025 12:39:40 -0700
X-Gm-Features: ATxdqUERSINXjgZozjhH6OJicqqRpLdRfV1ZPdW61MN5MO_O8cl1SzEcLT4val0
Message-ID: <CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
To: Maxime Ripard <mripard@kernel.org>
Cc: Jared Kangas <jkangas@redhat.com>, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 11:58=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Thu, Apr 24, 2025 at 05:13:47PM -0700, John Stultz wrote:
> > On Thu, Apr 24, 2025 at 1:34=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > I appreciate this is kind of bikeshed-color territory, but I think "c=
ma"
> > > would be a better option here. There's nothing "default" about it.
> >
> > I disagree.  It very much is "default" as it's returning the
> > dma_contiguous_default_area.
>
> My main concern here is that it's "default" as opposed to what, exactly?
> We have a single CMA allocator. We could have multiple buffer
> attributes, but then "cached_cma" would make more sense to me if we
> expect to have uncached CMA allocations at some point.

Well, there may be one CMA allocator, but there can be multiple CMA regions=
.

So in the kernel, cma_alloc() always takes the cma area as an
argument.  And dma_alloc_contiguous() lets you do allocations against
a device, which may reference a specific cma area. Or if the device
doesn't specify a region it will utilize the default region.

> > There can be multiple CMA areas, and out of tree, vendors do reserve
> > separate areas for specific purposes, exposing multiple CMA dmabuf
> > heaps.
>
> By "CMA areas", I guess you mean carved-out memory regions? If so, how
> is it relevant to userspace if we use CMA or any other implementation to
> expose a carved-out region, and thus that we carry that implemenattion
> detail in the name?

So, no, I don't mean carve-out regions.  It's more about dealing with
competition between multiple CMA users. In some cases, where there are
known fixed buffer sizes, say camera buffers, it's much easier to
reserve a separate specific sized region to allocate from so that you
know it will always succeed and you don't need to waste much on safety
margins. Having this added as a separate CMA region makes it a lot
easier to account or reason about, and the kernel can still make
(limited) use of the CMA space when it's idle. Then you don't have to
worry about some other device having a short term cma allocation that
pushes back the alignment for your large allocation, possibly
impacting some other devices larger allocations.

And unlike with just using a carveout, you don't end up just wasting
all that space when it is unused.

So userland may want to allocate contiguous memory, but it may also be
relevant to userland to be able to allocate contiguous memory from a
purpose specific pool.

And while not used in Android, you could imagine having separate
purpose reserved cma heaps with different permissions on the heap
devnodes, allowing less trusted applications to allocate cma from a
small pool without having the potential to DoS the system.

> > There have been patches to expose multiple CMA heaps, but with no
> > upstream drivers using those purpose specific regions, we haven't
> > taken them yet.
> > I do hope as the drivers that utilize these purpose focused heaps go
> > upstream, we can add that logic, so I think being specific that this
> > is default CMA is a good idea.
>
> If heaps names are supposed to carry the region it exposes, then it
> should be default_cma_region/area. If heap names are supposed to expose
> the allocator (but I don't think it's a good idea), it should be cma. If
> they are meant to carry all that plus some policy,
> cached_default_cma_region should be used.
>
> Either way, default_cma seems to me either too specific or not specific
> enough. And we should really document what the policy for those heaps
> are supposed to be.

I don't see it as such a problem. It is clear it is cma, it also is
clear conceptually that it is the "default" region that the kernel
uses when devices aren't specific.
But I wouldn't object to cma_default_region/area as a name either, but
I don't see it as particularly improved over cma_default.

To your larger point about policy, I do get the tension that you want
to be able to programmatically derive or evaluate heap names, so that
applications can consistently derive a pathname to get what they want.
But I also think that there is so much variety in both the devices and
uses that there is no way that all use cases and all devices can be
satisfied with such a static or even programmatic mapping. From my
perspective, there just is going to have to be some device specific
glue logic that maps use->heap name. Same reason we have fstab and the
passwd file.  That said, I think advocating for naming conventions is
definitely useful, but I'm wary of trying to enforce too specific a
schema on the names as the incompleteness theorem will bite us.

thanks
-john

