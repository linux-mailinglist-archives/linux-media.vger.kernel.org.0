Return-Path: <linux-media+bounces-12990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 180FF904B05
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 07:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79D93284E2C
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 05:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB3E3716D;
	Wed, 12 Jun 2024 05:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m+MEnyMW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F2264A
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718171158; cv=none; b=exWz9ixqlHwhowvuEZ2D4Zc87W6HeJUWE+a72EelrZ9rUps70XmDsJCKgWR8JbzRshrkTdXciBuLsob0NPWQuyAGwyxFO2/nuYEpxKI0EJ9qffhtN92OqVnaJsk/3Z6AfMr+PTfez34m9m9okDfStXxFaBsMdt5xsYG2jLeGdYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718171158; c=relaxed/simple;
	bh=4jAcnn7OxT+57GeMbVujqs2OMnbqTLFS39NZZ281M5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDV4rVwYdUmJsfIVrJ4FQcXovmVx1FvygJVFXU8DCvoFGzspKq77in1jL9m/yUmKtFtN6P+K2cWUnx/qMJLjtPgnU/EJUsAqglrkmRCo5SxQD4p2rGeszgpFQQ7p8Qdl/KtLUsW6Os54fvHtZ+iYw0PpHx7exwQ1yPI868Hnkiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m+MEnyMW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f6f031549bso17323175ad.3
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 22:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718171156; x=1718775956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GuDWfwnoBvd2GdHXyK3om6ZsPTOTx4EtstAuyoZ63+c=;
        b=m+MEnyMW4IbO13Ai+ebQcrzL6Zx1gjSPlkfebXZhYKuz9R/HvdaeCsA2NrEnxds+AK
         kVILjBYhBeKJjhitNdXAnKszzZlHYRE3J0qEm6KHOdnX2ksyaNmnVEVCNCwHdCZPUNlF
         u4ulDRy5PeF92DaYcObnIXKDLOZNFISCf28GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718171156; x=1718775956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuDWfwnoBvd2GdHXyK3om6ZsPTOTx4EtstAuyoZ63+c=;
        b=AXHeRPqFHKzqhnKIqLYsFG7uVxbuNBj314S8KlKjbdWcODklEdjsvDnEeTONF4w8rh
         szl/H2tVK65mjerE4PhO/lSkXPm5GpyPmlmbC7Xpivv7jIZEm2F21W2XXtsNDrxxo+Oi
         wPF3nrXieHwDwP3yKkU+ioJZshmU2CYWG0lteTHd3MTYmIF/MYTjwIeGPwtsqvjGNqfx
         r08saOM49j8NSQuMv9XOnL2IGGd36kUHGFC5oYF2R4iydibk3QytedGnKOQ+ksdNOADq
         HpoxG29ifSGUavfL6bC29JnLm9xnr2OUNftqaji00LbGcQuRw5pfMfbnicpfhp828b9Q
         rzNA==
X-Forwarded-Encrypted: i=1; AJvYcCVRTuF7Czgg8kNLqgWK0EB1wVz5jiBWlC8DcerAJX1CwuU0CKwyuj31j1oRA3tseqv0H1FTxYCIbfXfDo1mcuKLi8qxVp8AXqgPkoc=
X-Gm-Message-State: AOJu0YymYzsNqd9+7Z2k6kzumKyYXxOU7teaTGAVFLsOqfMny3GlNkEY
	KsgU+ibOmqtXLWH6GDUvOlsp052SJQND01KYcZENDXW2EJzGXUhOGf58ns0hgk8RTivZKNXodMV
	Meg==
X-Google-Smtp-Source: AGHT+IH9zRW4KtVj1AadqpweQW4eeFXj3QM6YYnvtJYMK4RAl2grygZG6sxx/QrAxe7H6XPVIJSCDg==
X-Received: by 2002:a17:903:41cc:b0:1f6:ff48:1cd9 with SMTP id d9443c01a7336-1f83b7232ddmr9323115ad.69.1718171156535;
        Tue, 11 Jun 2024 22:45:56 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f72046ac5csm39875405ad.229.2024.06.11.22.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:45:56 -0700 (PDT)
Date: Wed, 12 Jun 2024 14:45:53 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [RFC 0/3] media: videobuf2: Allow driver to override
 vb2_queue.buf_ops
Message-ID: <si5iwxt3zngrlfizbrnmqjcqgiihj7gxfye45aqrej7lpb2xmk@eprxnhmikiix>
References: <20240603152548.107158-1-jacopo.mondi@ideasonboard.com>
 <20240605064909.GB879@pendragon.ideasonboard.com>
 <r3xmeidoe462onnhh4oetc23kyxy5ohymema6ry2w7haqmv6de@zef57ojr7deg>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r3xmeidoe462onnhh4oetc23kyxy5ohymema6ry2w7haqmv6de@zef57ojr7deg>

On Wed, Jun 05, 2024 at 09:37:01AM +0200, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Wed, Jun 05, 2024 at 09:49:09AM GMT, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > On Mon, Jun 03, 2024 at 05:25:44PM +0200, Jacopo Mondi wrote:
> > > Hello
> > >
> > >   I have the need to allocate a scratch buffer to mirror the content of the
> > > vb2_buffer planes (more detail on this on request).
> > >
> > > The allocation of such 'scratch' buffer should ideally be done once, at buffer
> > > creation time (and released at buffer release time ?)
> > >
> > > Looking at the videobuf2 framework implementation I noticed that the ideal entry
> > > point for this would be vb2_queue.buf_ops.init_buffer, which is called in the
> > > __vb2_queue_alloc() call path.
> > >
> > > I have noticed that the vb2_queue.buf_ops members seems to be there to be made
> > > overridable by drivers, but are instead:
> > >
> > > 1) unconditionally set by the framework in vb2_queue_init_name()
> > > 2) the core helpers are not exported
> > >
> > > hence I was wondering if this is the result some half-baked attempt to make
> > > them ovverridable or the possibility of override them was instead deprecated.
> > > As I found no traces of this in the log, I thought it was easier to send an
> > > RFC.
> > >
> > > I also checked what other entry points I could have used to allocate backing
> > > memory for a buffer, and I have considered vb2_queue.vb2_ops.buf_init which
> > > is however called in the vb2_req_prepare() call path (I'm not using the request
> > > API atm) or in the VIDIOC_PREPARE_BUF call path, which requires ad-hoc
> > > instrumentation in user space (something I would like to avoid if possibile).
> > >
> > > What do you think ?
> >
> > I've been thinking more about this. I wonder if you could use
> > .buf_init() for your use case. It's called in three places:
> >
> > - __vb2_queue_alloc()
> 
> This is only called
> 
>         if (memory == VB2_MEMORY_MMAP)
> 
> and I originally considered it a non viable solution, as it only
> supports the MMAP use case. Now that I thought about it a few more
> seconds, I realized that MMAP it's the only actual use case where
> memory is allocated by the driver and thus the only memory management
> method that makes sense to pair with buf_init
> 
> > - __prepare_userptr()
> > - __prepare_dmabuf()
> 
> These, if I'm not mistaken are in VIDIOC_PREPARE_BUF call
> 
> >
> > As your scratch buffer needs are limited to the ISP parameters queue,
> > which should use MMAP only, I think .buf_init() would be just fine.
> >
> 
> Probably so, I'll give it a go

I agree with Laurent that .buf_init() should be a good place for this.
Please let us know if it works for you.

Best regards,
Tomasz

> 
> Thanks!
> 
> > > Jacopo Mondi (3):
> > >   media: videobuf2: WARN if !vb2_queue.buf_ops
> > >   media: Allow drivers to overwrite vb2_queue.buf_ops
> > >   media: rkisp1-params: Override vb2_queue.buf_ops
> > >
> > >  .../media/common/videobuf2/videobuf2-core.c   | 12 ++++---
> > >  .../media/common/videobuf2/videobuf2-v4l2.c   | 34 +++++++++++--------
> > >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 18 +++++++++-
> > >  include/media/videobuf2-core.h                |  7 ++++
> > >  include/media/videobuf2-v4l2.h                |  8 +++++
> > >  5 files changed, 60 insertions(+), 19 deletions(-)
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> 

