Return-Path: <linux-media+bounces-39491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BB2B21DB0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AE8B16F1BF
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 05:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD6A2C21DD;
	Tue, 12 Aug 2025 05:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="YKJCAE6c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B796189F5C
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 05:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977910; cv=none; b=FNPE2We8xO66bsF2pC2/xcwrYAXdQx3UbJLTRXtg8ypZeygjJH+fElBqWfsOiDJrB3uv/ElnVLFySQwz1qZypOJIMk+IUOXo6rY6bGwD2nmTwm5cuFgAUr0zO0nJF4jfPXWMlcSkzF8KvYYZPH3Uh8r9vhER/dAit1sEyhvkG4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977910; c=relaxed/simple;
	bh=hEUCRCq+pYJMr8dL2oOYLzPZqRK0/vVeGKzxOTj7f2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3edLkLnShlKU5c+8emMTNavQJOibVcccpUNoqcA9qdpUoD6KATdIJFWklepO/XepHAd4dad/PkqUM2o5Z3U2BE4hV/HDVEE45LBrRY/35agUY5A1gKxwOqfcAWwTRUtFgxcnsLy/fUVTeEwp3/HI6x5gJf2CLdMcNNF7TqyjjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=YKJCAE6c; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-242d3ba2b44so18448495ad.3
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 22:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1754977908; x=1755582708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BOCDjz6WH22gfchqbjWK+yxuXZs2i4TBVX9oOLufaWI=;
        b=YKJCAE6cKrJ/EPQ1EA5qq52DHato86N9F4SoRbz3WstjPmPLQi6iADFos9GUsdieYM
         7/GTVLWRqipzRSIlonXnNiUh1iOGCpnmTOoLfHgf7E2HYObgPLqVMg2csbbZmpd05tyV
         UTe6EPrc0kk3KnVStV7Tk2nFizYCFKoSmeIHffSoF0HJGRgqzvEB8Ur+iVdzC0A/fz0F
         gVKQGxrZUz7I5rs8mORUU1jSErMSBS7gsJFr91RUbS+6lHDLDoFjxJxAm+RXyI/5HDfs
         JELAzO+T2wG5lDP3tZeW8TCeaiVC+Lu30OwhTbcy5MEgqnORndjK0QlCAqCN8qHBK1+e
         sExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754977908; x=1755582708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOCDjz6WH22gfchqbjWK+yxuXZs2i4TBVX9oOLufaWI=;
        b=g13G4dXIazwQk4n7F3tXtOY3GKndxCAHx+SBHVsFKm0dQVS7MhQyt5E1R3RUumRerr
         MgxfpMGB/w797hfh/3utGa7S6KHDyBu9RRhJb2vWK62rvIxT6YpiBCxHgOrfX1ed4xFs
         SPI8pMcjmiVKl4PR83SymxhfZBr7xt4XsbXeaKI4YFF3JhQlKvIaU0XwTbskiKUPLnGe
         u+qTlLvPYCx0dNS6uiIjc1JyC0JOKnoEdBrUGC5ECzs3m37GUqVBZrYKw5484Z4UxdjE
         e7hoUn7FF78NBsp0CsNO89Isy/xc+bxRG2nB1vqk0hvuU+LqyNY13l0EUxqLb3ZcsHT3
         hrWA==
X-Forwarded-Encrypted: i=1; AJvYcCXbG/6wpq/cvcM3W03KXjV4j6q0gr0KAV1qa5ws/idijvshdw3Y7B5M8bdmzt0F7P7dq3+w0k7Q++B7Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3BOYmrtgw8e6ADL4qC0yLAyBaXFhIGZO1NdHTvr4kIWVFk7GB
	uGtkXH6X2ZdUMbkp2n9TFCzUoMalMRTxDW/Jf/1abpSSkb0mVLzmhM4oOHr4wVJ5MWWC
X-Gm-Gg: ASbGncswq8zuNT/Gmwv1KNxwKeiIxdcWvbj1483xjoNPcPN4gPhYB/AWc7A3tB375KW
	SEqcdM14P91j6ljvADx/mE8sDmWIjwkNoCMbII4wis4vI2rPX0Ja//uLpLEQdOTmAaxexq5TkAy
	UQS/CZp83JmvCpTCgQMavdCQE1gXdNvCbtww08He1/FiJSmYlCVWq14WbyEJ9DiDSJCSuOyIoPG
	2wuOabOj/FaR5Wgj60PCac7H3/r6lqPwgQcCPtTXwH6juHFbNlcvd/+2xOXQHv3l/Ys5pKNXZUf
	ks5eyRfSQUQa+gBt5skEPZML9ZEBEcKXFnjs+P95dwtJwxosAKP7DFR2BogWLfVESHB0hEV1GSy
	fY/7FG0I49lCKjq2OIClyV4gFqw==
X-Google-Smtp-Source: AGHT+IHzZiPToKAxUcoRDzmNgnBqi0y3GViXXsaPjclJDII7jnH2XBHQbO92TBbnbDxyN5bJ1iwzMw==
X-Received: by 2002:a17:902:d48a:b0:240:9cf:99a8 with SMTP id d9443c01a7336-242c1ecbe3fmr200952505ad.11.1754977907633;
        Mon, 11 Aug 2025 22:51:47 -0700 (PDT)
Received: from sultan-box ([142.147.89.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2430558f376sm526825ad.95.2025.08.11.22.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:51:47 -0700 (PDT)
Date: Mon, 11 Aug 2025 22:51:43 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
Message-ID: <aJrWb1LfwXf5PGUf@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com>
 <aIchBRdmy48BHl2k@sultan-box>
 <7a422602-7a99-4b49-b994-cddd9730cb20@amd.com>
 <aIq6DpV_cMJWKfhn@sultan-box>
 <aJmHWQMsk6Pdniap@sultan-box>
 <5500a71a-68bd-4dd1-99cb-6523281f0c7d@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5500a71a-68bd-4dd1-99cb-6523281f0c7d@amd.com>

On Mon, Aug 11, 2025 at 05:05:39PM +0800, Du, Bin wrote:
> > > [ old quotes trimmed out ]
> > 
> > Following up on this: there were several more issues hiding in the driver that
> > needed to be fixed unfortunately. I ended up making a lot of changes to fix all
> > of the buffer lifetime issues, and I created individual commits for this work
> > because it was getting hard to keep track of all the changes.
> > 
> > I think I'll have this completed tomorrow and will provide a link to my tree
> > with my commits. Hopefully your internal branch hasn't diverged too much from
> > this patchset submission, otherwise there may be some conflicts to resolve.
> > 
> > Sultan
> 
> Really appreciate your time and effort. Yes, big code changes happen in our
> internal branch to address upstream comments, but i believe your commits
> will be extremely valuable. We can check and test after fixing possbile
> conflict.

I've pushed my work here:

  https://github.com/kerneltoast/kernel_x86_laptop.git v6.16-drm-tip-isp4-for-amd

Please see my changes since commit 48d18b6e58c6dadbc79374773736924d2f532da5 on
that branch, up to commit 5cdacf4ff108d83869414a00465e7a612bcd04b1.

There are 29 patches:

Sultan Alsawaf (29):
      media: amd: isp4: Use amdgpu helper functions for ISP buffers
      media: amd: isp4: Remove -mpreferred-stack-boundary=4 cflag
      media: amd: isp4: Remove -DCONFIG_COMPAT from ccflags-y
      media: amd: isp4: Remove the myriad of redundant ccflags includes
      media: amd: isp4: Pass warning flags through cc-option
      media: amd: isp4: Clean up amd_capture-objs formatting
      media: amd: isp4: Don't set CONFIG_AMD_ISP4 to y by default
      media: amd: isp4: Clean up AMD_ISP4 Kconfig dependencies
      media: amd: Fix Kconfig/Makefile directory structure
      media: amd: isp4: Remove superfluous NULL pointer checks
      media: amd: isp4: Remove superfluous void pointer casts
      media: amd: isp4: Remove superfluous memset in isp4vid_vb2_map_dmabuf()
      media: amd: isp4: Don't read refcount counter directly
      media: amd: isp4: Add missing refcount tracking to mmap memop
      media: amd: isp4: Don't put or unmap the dmabuf when detaching
      media: amd: isp4: Don't increment refcount when dmabuf export fails
      media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
      media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
      media: amd: isp4: Fix implicit dmabuf lifetime tracking
      media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
      media: amd: isp4: Remove 'refcount > 0' warning in isp4vid_vb2_put()
      media: amd: isp4: Fix comment in isp4vid_vb2_dmabuf_ops_release()
      media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
      media: amd: isp4: Add comment to CONFIG_HAS_DMA #endif
      media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
      media: amd: isp4: Remove unused userptr memops
      media: amd: isp4: Make isp4vid_vb2_memops static
      media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
      media: amd: isp4: Release queued buffers on error in start_streaming

 drivers/media/platform/amd/Kconfig               |  18 +-
 drivers/media/platform/amd/Makefile              |   6 +-
 drivers/media/platform/amd/isp4/Kconfig          |  14 ++
 drivers/media/platform/amd/isp4/Makefile         |  42 +---
 drivers/media/platform/amd/isp4/isp4.c           |   9 +-
 drivers/media/platform/amd/isp4/isp4.h           |  11 -
 drivers/media/platform/amd/isp4/isp4_debug.c     |   4 +-
 drivers/media/platform/amd/isp4/isp4_interface.c |  46 +---
 drivers/media/platform/amd/isp4/isp4_interface.h |   6 +-
 drivers/media/platform/amd/isp4/isp4_subdev.c    |   8 +-
 drivers/media/platform/amd/isp4/isp4_subdev.h    |   4 +-
 drivers/media/platform/amd/isp4/isp4_video.c     | 297 ++++++-----------------
 drivers/media/platform/amd/isp4/isp4_video.h     |   4 +-
 13 files changed, 122 insertions(+), 347 deletions(-)

At least 1 of them should be redundant for your internal branch (9f394a7af2cf
"media: amd: isp4: Use amdgpu helper functions for ISP buffers").

Cheers,
Sultan

