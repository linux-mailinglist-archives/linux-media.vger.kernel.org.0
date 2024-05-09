Return-Path: <linux-media+bounces-11189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBEC8C0D73
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 11:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DF871F21B55
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 09:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D183814A622;
	Thu,  9 May 2024 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="eYUdyphX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B5A14A096
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 09:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715246612; cv=none; b=K4a5XpEL18Q8rUPQTZflZXMo3El8ihZr9dKNB41NKYxyTOfxnDy48FGHww1fVloRQlGJVTYMw9ASjPzdOlitYCxHcLDA0jW3DHa5GNNZWsikGHVMj2n4YZZkieUP/AefpabQPMlvU1/mH4VUmef+hI0/N89x2g3kLMEPMte58Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715246612; c=relaxed/simple;
	bh=nCxyHA4H0zlDgKUBRKhP1uHW5cceyxKQ1uLbmFwQQPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=FnMwLn9G2TLsnV5qyGnNc9W8QUKeTfWzjNPuXaH22g0x78yexoq0vTWHLk4RPO9ugC3vxU5MwJ1nil3vVqBgwv7BDC1H51V3uDPPCKQfZpmM92XvTnlPfh2AOuLkisttoP3e/UwObyvOJSbUirRqRaoDMSz9D3tsVRnVEohdG8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=none smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b=eYUdyphX; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fooishbar.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6a1548d65e0so2240956d6.0
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 02:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1715246609; x=1715851409; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCxyHA4H0zlDgKUBRKhP1uHW5cceyxKQ1uLbmFwQQPk=;
        b=eYUdyphXQ2ZTF7qd1pDipbmkAzjobeKUCUb8TlN/ddMY9UHA0BFeUZUFiZcWy//i5d
         Aa8+swrjNgaXU0kPCh8Y7hsgsJELnbKadZgl4i5OKC7cntZ71vEFN536g3MIn+BkFKWP
         pdFE18c2RYwr3FUS+sE3wq3dll038MRpPvhLsO4voBedBO55HJhq9PFjpoX7m9eVQL62
         MLY5pX6mlw1Nstg2Bapb7fRULaide+wUu9ucBQLA4GWaXw84MbR8P7Nn8z5WwyO03jb8
         oFSGn0kSvdUOHOelB8nwXVZ3xos3clE1OijEIuPEG50C9z9OZRi+88fdV6bZi8jYvOSG
         IIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715246609; x=1715851409;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nCxyHA4H0zlDgKUBRKhP1uHW5cceyxKQ1uLbmFwQQPk=;
        b=o38ADXRD/4M/Gso6HZxoHt2LqGP+V62ET8SQqHhgON+ypq0/eRoEpRv+6RZUJKSZeM
         Ujsf9guGnRC8Tf6RZhHAUjbxWtEpKgeelvFtVRr5JvmV0bS8xPon/3BnhpPU5IMxXD+t
         N1TzQCfPcRU9Qfu/JMrqJyMEqfobQY+EOxQvvOPgrmJd9bHKXB+N1GNYfFakNiQdm6jV
         Q0ZLydppWT99nfbsV/Se6sSw2Ssw+DNnevMGASUKjZ2FgJgFbBIbWDNGAw9DhAgsqv8c
         ePmh79SjGuQxVt9JpZ4T2ZZZpQ4vP5wNuLlVzLBdz7+m3Yb49qpC4EVsG0GIy7Ir2q2j
         fGmA==
X-Forwarded-Encrypted: i=1; AJvYcCUmWP15wN+QCqQ4mRmznAAemUKuTDrrZtzp+j+YhaMI4wv2cTqWniQ89pDLWot4A/Ik373Ya83ZaVTbiInK5LCy2IuJCMdT6dpxPm4=
X-Gm-Message-State: AOJu0YyCCUuHo9D918rTbNZxiHgvgk38A8zGdWoGrmu4yYsWBeD86JyA
	RAxyUdO+TOxSBpiv5hJ49mwgmlrzTl0FbeTNhINSsKoKASDvelvDYkRpwTqOwKquIo944iTswHU
	RjeHSSp5mmWDgxmEDPv86SvYZYr7SL9aQynHJWg==
X-Google-Smtp-Source: AGHT+IF6PhCgk1o7f4b1gc4aesQqVT1tyRMXdb/II5WaUUVRVGN+oa4txBNRnx7jzplgxY+HJ/x6UmsSdSVG8eSyBMk=
X-Received: by 2002:a05:6214:1cc2:b0:6a0:d32d:79d with SMTP id
 6a1803df08f44-6a1514dfd79mr58597296d6.56.1715246609461; Thu, 09 May 2024
 02:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat> <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com> <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
 <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
 <Zjs42PGvilLlF0Cg@phenom.ffwll.local> <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
 <Zjue98r4ZgGbMN5K@phenom.ffwll.local>
In-Reply-To: <Zjue98r4ZgGbMN5K@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 9 May 2024 10:23:16 +0100
Message-ID: <CAPj87rPywSjKLrv00N-0SrkDndPdYGCBeveO0adh4xGCp20h9g@mail.gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Daniel Stone <daniel@fooishbar.org>, Hans de Goede <hdegoede@redhat.com>, 
	Maxime Ripard <mripard@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Lennart Poettering <mzxreary@0pointer.de>, Robert Mader <robert.mader@collabora.com>, 
	Sebastien Bacher <sebastien.bacher@canonical.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Milan Zamazal <mzamazal@redhat.com>, 
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 8 May 2024 at 16:49, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, May 08, 2024 at 09:38:33AM +0100, Daniel Stone wrote:
> > Right now, if your platform requires CMA for display, then the app
> > needs access to the GPU render node and the display node too, in order
> > to allocate buffers which the compositor can scan out directly. If it
> > only has access to the render nodes and not the display node, it won't
> > be able to allocate correctly, so its content will need a composition
> > pass, i.e. performance penalty for sandboxing. But if it can allocate
> > correctly, then hey, it can exhaust CMA just like heaps can.
> >
> > Personally I think we'd be better off just allowing access and
> > figuring out cgroups later. It's not like the OOM story is great
> > generally, and hey, you can get there with just render nodes ...
>
> Imo the right fix is to ask the compositor to allocate the buffers in this
> case, and then maybe have some kind of revoke/purge behaviour on these
> buffers. Compositor has an actual idea of who's a candidate for direct
> scanout after all, not the app. Or well at least force migrate the memory
> from cma to shmem.
>
> If you only whack cgroups on this issue you're still stuck in the world
> where either all apps together can ddos the display or no one can
> realistically direct scanout.

Mmm, back to DRI2. I can't say I'm wildly enthused about that, not
least because a client using GPU/codec/etc for those buffers would
have to communicate its requirements (alignment etc) forward to the
compositor in order for the compositor to allocate for it. Obviously
passing the constraints etc around isn't a solved problem yet, but it
is at least contained down in clients rather than making it back and
forth between client and compositor.

I'm extremely not-wild about the compositor migrating memory from CMA
to shmem behind the client's back, and tbh I'm not sure how that would
even work if the client has it pinned through whatever API it's
imported into.

Anyway, like Laurent says, if we're deciding that heaps can't be used
by generic apps (unlike DRM/V4L2/etc), then we need gralloc.

Cheers,
Daniel

