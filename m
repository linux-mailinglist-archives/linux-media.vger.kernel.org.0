Return-Path: <linux-media+bounces-15039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55AF9322E0
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 11:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FD572823A4
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 09:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4594D17D374;
	Tue, 16 Jul 2024 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="NleXDxLw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F61F2B9D7
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122319; cv=none; b=SY0gqH5BLCKmEZ0/d54uY7o+6JL2sg1Nu4FxkD/7LCBjP8c6j6b85ckGw8UVSxTDUxJ07MqM3G5dGRU6o1Bi5/NstAQXtHAs3YCGRRwdXfv4T2F6PesZTIHQtkX1k2y8s/llySS0Wqh/4oAvNa0EtkfR4MS8fFF1y8xj/u4J9h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122319; c=relaxed/simple;
	bh=eNZrHx4nUM1QYvvyHP8n8e3B5mpVNk/35E8SsJiO20w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZ7BNr5NRd0wzsdyIPnHrPdhzOxY+BE7NVfEAn1nIIZxt+/NOFST/5ke4JE1EGeSV6iJUztMkzBfkTax3fp8xXCDdoftb/J35CcQEklrFAtj6HUwNGEWjgRMgMtnFPRhItMesn/yV19nNWE8oxabeUCUls5NGNYq59jyRGOYrBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=NleXDxLw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36806292cf6so129366f8f.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1721122316; x=1721727116; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bmqE+tUBq0/SZnmu4rbe4uibdP78BlfSNiZLCEbAiTQ=;
        b=NleXDxLw5nP/ffE9hvCga5a9FapV1dD5UW+NLfACirhMg+DNOcOgTyegUAXE+Uq8x6
         +BMi16ul4vf8X4OSPAYSpQ7XfitMH6dllo89sqS7WbsW/Ubo+gcRW1NDiKZJprYRdL8c
         Hv8RveCG647ila1BiZrdLKCJXxYqF3n7REZr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721122316; x=1721727116;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmqE+tUBq0/SZnmu4rbe4uibdP78BlfSNiZLCEbAiTQ=;
        b=N8jpknbUnVbwCke0kOtOGguZ6t/hI8UWKT5QuC0Rt1qdgwSlQr8iT1d/KC15oPIH9q
         s/wjtw+Pvcg0+G9u53gTD3nv08FOn9d+WraGX7hflb8o7PXIJVVZZ+GJWq9x1+LTC3tM
         UpMPbIoF2qpeNpC6Dqqu40PJB5YzaN5RvsxjkNEUYhDBVxnGSvSHQYkueNyFWevsYuBi
         Vt51+3d7F1vub/31Ui1TTRfmAIkyYYRi0LqQOvS2HwkW1jumTc7G2JeyYm4XtUa0Uu3a
         8Nh9WNa3Y/JbonGb7ugJmVKDCDMX2+M3e4zVtY8Z5fEYPzIWuXZo1cCLpJZgg+FXvh6o
         0PWA==
X-Forwarded-Encrypted: i=1; AJvYcCUPpyq1W8Dxmutm0VNs3oiJYF+gf9gG0bpkC5lAx9px3qnOALGA8ddTxDPZQSDDHYlEvyuWqCpx4TJo4tUNm+gCiveLuFxKmSwZjjY=
X-Gm-Message-State: AOJu0YwxsMtHL0XMHy14T3gGw9gH8I8FQdcJcKE0Uu4ibh/HE+PjIxn4
	UxdMtfEU6nSqIr8l0ft+pbRSVP29JbJS6qRonKagfQqydjRBRfkLZmdQC7DjGso=
X-Google-Smtp-Source: AGHT+IH/pdOxEOwXcwiFkFydr3Ad0jnhs/61yWLi82ofglrUoK4E94kyYC5hYQMjmbMfPaS16eQmsw==
X-Received: by 2002:a05:600c:4f89:b0:424:ac9f:5c61 with SMTP id 5b1f17b1804b1-427b88d2cd5mr9618625e9.3.1721122316383;
        Tue, 16 Jul 2024 02:31:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db038dbsm8356168f8f.95.2024.07.16.02.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:31:55 -0700 (PDT)
Date: Tue, 16 Jul 2024 11:31:53 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Huan Yang <link@vivo.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
Message-ID: <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
Mail-Followup-To: Huan Yang <link@vivo.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240711074221.459589-1-link@vivo.com>
 <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
 <ZpTnzkdolpEwFbtu@phenom.ffwll.local>
 <99364176-a7f0-4a17-8889-75ff92d5694e@amd.com>
 <06713006-c5ce-4773-a1b3-ca3bea56ee45@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06713006-c5ce-4773-a1b3-ca3bea56ee45@vivo.com>
X-Operating-System: Linux phenom 6.9.7-amd64 

On Tue, Jul 16, 2024 at 10:48:40AM +0800, Huan Yang wrote:
> I just research the udmabuf, Please correct me if I'm wrong.
> 
> 在 2024/7/15 20:32, Christian König 写道:
> > Am 15.07.24 um 11:11 schrieb Daniel Vetter:
> > > On Thu, Jul 11, 2024 at 11:00:02AM +0200, Christian König wrote:
> > > > Am 11.07.24 um 09:42 schrieb Huan Yang:
> > > > > Some user may need load file into dma-buf, current
> > > > > way is:
> > > > >     1. allocate a dma-buf, get dma-buf fd
> > > > >     2. mmap dma-buf fd into vaddr
> > > > >     3. read(file_fd, vaddr, fsz)
> > > > > This is too heavy if fsz reached to GB.
> > > > You need to describe a bit more why that is to heavy. I can only
> > > > assume you
> > > > need to save memory bandwidth and avoid the extra copy with the CPU.
> > > > 
> > > > > This patch implement a feature called DMA_HEAP_IOCTL_ALLOC_READ_FILE.
> > > > > User need to offer a file_fd which you want to load into
> > > > > dma-buf, then,
> > > > > it promise if you got a dma-buf fd, it will contains the file content.
> > > > Interesting idea, that has at least more potential than trying
> > > > to enable
> > > > direct I/O on mmap()ed DMA-bufs.
> > > > 
> > > > The approach with the new IOCTL might not work because it is a very
> > > > specialized use case.
> > > > 
> > > > But IIRC there was a copy_file_range callback in the file_operations
> > > > structure you could use for that. I'm just not sure when and how
> > > > that's used
> > > > with the copy_file_range() system call.
> > > I'm not sure any of those help, because internally they're all still
> > > based
> > > on struct page (or maybe in the future on folios). And that's the thing
> > > dma-buf can't give you, at least without peaking behind the curtain.
> > > 
> > > I think an entirely different option would be malloc+udmabuf. That
> > > essentially handles the impendence-mismatch between direct I/O and
> > > dma-buf
> > > on the dma-buf side. The downside is that it'll make the permanently
> > > pinned memory accounting and tracking issues even more apparent, but I
> > > guess eventually we do need to sort that one out.
> > 
> > Oh, very good idea!
> > Just one minor correction: it's not malloc+udmabuf, but rather
> > create_memfd()+udmabuf.

Hm right, it's create_memfd() + mmap(memfd) + udmabuf

> > And you need to complete your direct I/O before creating the udmabuf
> > since that reference will prevent direct I/O from working.
> 
> udmabuf will pin all pages, so, if returned fd, can't trigger direct I/O
> (same as dmabuf). So, must complete read before pin it.

Why does pinning prevent direct I/O? I haven't tested, but I'd expect the
rdma folks would be really annoyed if that's the case ...

> But current way is use `memfd_pin_folios` to boost alloc and pin, so maybe
> need suit it.
> 
> 
> I currently doubt that the udmabuf solution is suitable for our
> gigabyte-level read operations.
> 
> 1. The current mmap operation uses faulting, so frequent page faults will be
> triggered during reads, resulting in a lot of context switching overhead.
> 
> 2. current udmabuf size limit is 64MB, even can change, maybe not good to
> use in large size?

Yeah that's just a figleaf so we don't have to bother about the accounting
issue.

> 3. The migration and adaptation of the driver is also a challenge, and
> currently, we are unable to control it.

Why does a udmabuf fd not work instead of any other dmabuf fd? That
shouldn't matter for the consuming driver ...

> Perhaps implementing `copy_file_range` would be more suitable for us.

See my other mail, fundamentally these all rely on struct page being
present, and dma-buf doesn't give you that. Which means you need to go
below the dma-buf abstraction. And udmabuf is pretty much the thing for
that, because it wraps normal struct page memory into a dmabuf.

And copy_file_range on the underlying memfd might already work, I haven't
checked though.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

