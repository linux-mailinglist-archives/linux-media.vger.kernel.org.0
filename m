Return-Path: <linux-media+bounces-39864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C2FB25BE3
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D347A5A445F
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 06:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD4C2505CB;
	Thu, 14 Aug 2025 06:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="ex+c4KDM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4282505BA
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 06:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755153439; cv=none; b=kaZemxw0+GD8nYWoxNwJguUIFycGcXEzrcIpR3AYBt8Sa2GEnkXqfK7bdGOqCAeVZUxBGYOx+2T+FNRd5v23BNnFQ5adgVBLm31xzOyy/2C+G76ALIOyylTc50r2QmuXljK7wZfFq+h8GUEEvdA7m90grJYXY7nzEaAEV6SsYQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755153439; c=relaxed/simple;
	bh=yjMrsEJmgd68D5cxNjQkB9PcF6pqbe1ejEoPc/2u9u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Js0zNP09sbFzYRjPvXCnEB52/ruahhf69Qu5kG8WQYHDXkqNCsJN8e2Llf8fqyLyYEzFaHo69aIR7hTxf5FSwzcNf8Fm4w7/HoW7X6j4NuShZK0+MMSUdGaZrPAFUnn4XCCuem3ZoRabQ/7PZcLWL1uCuXrfF9btcjEHJLuaFGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=ex+c4KDM; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2e614b84so654229b3a.0
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 23:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1755153436; x=1755758236; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XDbeRc29CoIHtITMxhIt/oXGL2mg/RGag03ieSbqlig=;
        b=ex+c4KDMTggTxBqh5f7Y4eMfDmq8SnTwdAOuOkcVJwDj55yn/zTxK7ZGCfiDyUhZqZ
         i3nNHY9aX3EDGXTjavJ1iVRboEqwUCResABPTveHYbPKaU3dAxAS6AM+KB+VBnSJExNI
         zMGuUpLvOogrEITeb7UvA8japtgTlCWABpGaoE4dcQcghc7TcoP4iPf8vd/qYT8p+jab
         Z4YFsHkb1O9Cr3teICQgArrh7jujO+dpavpj0FPw3ijUlJKf4YEaipulHNTbIDvVJjDz
         Mp9Q00yckhETrEZ9t4T5pwFq3LVkjrXQm02jFMh5pmpFBEHgXg1o5dQq7AAny5D9r3dg
         AjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755153436; x=1755758236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDbeRc29CoIHtITMxhIt/oXGL2mg/RGag03ieSbqlig=;
        b=vFe0QrUamjoPBxULg02evH/woiuqF90IDemvWwtBFGyIAwkDe3hIsDO4As+wiO6Ocs
         Q8rxwF87BDlRbyU4UyYQlEPcVFPKQHXJaRDnp/F23a/S5xkRDAghHyCHAr5yURfTq4xJ
         qPlht9NZ3crFuPhHUZpT9tveU7DlHgEk8VVmXYvJLTO27BCA/+Lwtrpqk6SRX9Y9u114
         sLBRBqt4TE1iPd9cFw427KrehlHQuw8/ySLi4qiQMgBaz1MUzNwoot1lupwfZKWgqz2m
         PbWXLikSnoUV/yUSMtH67ilbe1l7SMtqT69hTUJEH8m+0qcLlHlKBZwdwOgD78FABphq
         KgQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWovb8IqXQPXvf60fb93PLpKST9ipO0qE1CgHZDXxAxadtGhpUxu1u6zXa8ZJf0g130YiLkKciORUOoJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsUDRNGt62UlXHFxDrV7JysOWtiQMQ1rSoCloYTdKLrtZN1AZa
	Gkr3b5qVNJ5dFUMcAcMqzM8O2X6zqzUiVRFeQk5mCuBs/q1KyGooOExqC8wBR5l5DL4S
X-Gm-Gg: ASbGncu4g59cDwQTsHGJYp++Q5ft+SaEkyn3PS+hEDTjc8Zu8+d+rPhq8Pj2/G7KLGh
	DpOVpljv0lqAkRCRK+J+Y9LLtKYMvLitcY8fYDNRCaDWd04oiKE3W4Zp2I7C7p2Du+1PVSXN3CJ
	JEOx21JUQMz3J6W54tP0RN0Pg9eBFezz9n4jlk6C3pGjiQXtnuljU0QIK7mgw9Cx4kJ64PdMkYx
	aynWCcAG7c+7q0xYCWFOeXRVrwkGGhEKQp/6DiFDEd2bYf865J5fR3cu4aCqgt4maA78/g/6+nJ
	SIqiSbriwWeeQUCDEV0eznpiq27T3lmZBQbceUFTOwpjYfl3PqcDtn5Fzz4TfcU2MwnthFpGTkU
	x84bxjkfSzp1CNA3pEnA2HBMxWQ==
X-Google-Smtp-Source: AGHT+IGiisbklXvAzd9t7knnyEobCVAuoBMGbyM1WJtUFjDjILkoZXM0Tr2pF7Aj/gsne0sjIUvh/g==
X-Received: by 2002:a05:6a20:4311:b0:22b:8f7f:5cb2 with SMTP id adf61e73a8af0-240bcf7f08bmr2930997637.8.1755153435669;
        Wed, 13 Aug 2025 23:37:15 -0700 (PDT)
Received: from sultan-box ([142.147.89.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bd9795200sm31973926b3a.114.2025.08.13.23.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 23:37:15 -0700 (PDT)
Date: Wed, 13 Aug 2025 23:37:11 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com,
	Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
	anson.tsao@amd.com
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
Message-ID: <aJ2EFy1nED5QGq1-@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com>
 <aIchBRdmy48BHl2k@sultan-box>
 <7a422602-7a99-4b49-b994-cddd9730cb20@amd.com>
 <aIq6DpV_cMJWKfhn@sultan-box>
 <aJmHWQMsk6Pdniap@sultan-box>
 <5500a71a-68bd-4dd1-99cb-6523281f0c7d@amd.com>
 <aJrWb1LfwXf5PGUf@sultan-box>
 <1a2e9233-4914-4d27-ae9f-51ca28adf568@amd.com>
 <72c7316c-d2ef-4ce8-ace4-4ed1dea87d0c@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72c7316c-d2ef-4ce8-ace4-4ed1dea87d0c@amd.com>

On Wed, Aug 13, 2025 at 05:42:16PM +0800, Du, Bin wrote:
> On 8/12/2025 2:33 PM, Du, Bin wrote:
> > Many thanks, Sultan.
> > 
> > On 8/12/2025 1:51 PM, Sultan Alsawaf wrote:
> > > On Mon, Aug 11, 2025 at 05:05:39PM +0800, Du, Bin wrote:
> > > > > > [ old quotes trimmed out ]
> > > > > 
> > > > > Following up on this: there were several more issues hiding
> > > > > in the driver that
> > > > > needed to be fixed unfortunately. I ended up making a lot of
> > > > > changes to fix all
> > > > > of the buffer lifetime issues, and I created individual
> > > > > commits for this work
> > > > > because it was getting hard to keep track of all the changes.
> > > > > 
> > > > > I think I'll have this completed tomorrow and will provide a
> > > > > link to my tree
> > > > > with my commits. Hopefully your internal branch hasn't
> > > > > diverged too much from
> > > > > this patchset submission, otherwise there may be some
> > > > > conflicts to resolve.
> > > > > 
> > > > > Sultan
> > > > 
> > > > Really appreciate your time and effort. Yes, big code changes
> > > > happen in our
> > > > internal branch to address upstream comments, but i believe your commits
> > > > will be extremely valuable. We can check and test after fixing possbile
> > > > conflict.
> > > 
> > > I've pushed my work here:
> > > 
> > >    https://github.com/kerneltoast/kernel_x86_laptop.git
> > > v6.16-drm-tip- isp4-for-amd
> > > 
> > > Please see my changes since commit
> > > 48d18b6e58c6dadbc79374773736924d2f532da5 on
> > > that branch, up to commit 5cdacf4ff108d83869414a00465e7a612bcd04b1.
> > > 
> > > There are 29 patches:
> > > 
> > > Sultan Alsawaf (29):
> > >        media: amd: isp4: Use amdgpu helper functions for ISP buffers
> > >        media: amd: isp4: Remove -mpreferred-stack-boundary=4 cflag
> > >        media: amd: isp4: Remove -DCONFIG_COMPAT from ccflags-y
> > >        media: amd: isp4: Remove the myriad of redundant ccflags includes
> > >        media: amd: isp4: Pass warning flags through cc-option
> > >        media: amd: isp4: Clean up amd_capture-objs formatting
> > >        media: amd: isp4: Don't set CONFIG_AMD_ISP4 to y by default
> > >        media: amd: isp4: Clean up AMD_ISP4 Kconfig dependencies
> > >        media: amd: Fix Kconfig/Makefile directory structure
> > >        media: amd: isp4: Remove superfluous NULL pointer checks
> > >        media: amd: isp4: Remove superfluous void pointer casts
> > >        media: amd: isp4: Remove superfluous memset in
> > > isp4vid_vb2_map_dmabuf()
> > >        media: amd: isp4: Don't read refcount counter directly
> > >        media: amd: isp4: Add missing refcount tracking to mmap memop
> > >        media: amd: isp4: Don't put or unmap the dmabuf when detaching
> > >        media: amd: isp4: Don't increment refcount when dmabuf export
> > > fails
> > >        media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
> > >        media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
> > >        media: amd: isp4: Fix implicit dmabuf lifetime tracking
> > >        media: amd: isp4: Fix possible use-after-free when putting
> > > implicit dmabuf
> > >        media: amd: isp4: Remove 'refcount > 0' warning in
> > > isp4vid_vb2_put()
> > >        media: amd: isp4: Fix comment in isp4vid_vb2_dmabuf_ops_release()
> > >        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
> > >        media: amd: isp4: Add comment to CONFIG_HAS_DMA #endif
> > >        media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
> > >        media: amd: isp4: Remove unused userptr memops
> > >        media: amd: isp4: Make isp4vid_vb2_memops static
> > >        media: amd: isp4: Add missing cleanup on error in
> > > isp4vid_vb2_alloc()
> > >        media: amd: isp4: Release queued buffers on error in
> > > start_streaming
> > > 
> > >   drivers/media/platform/amd/Kconfig               |  18 +-
> > >   drivers/media/platform/amd/Makefile              |   6 +-
> > >   drivers/media/platform/amd/isp4/Kconfig          |  14 ++
> > >   drivers/media/platform/amd/isp4/Makefile         |  42 +---
> > >   drivers/media/platform/amd/isp4/isp4.c           |   9 +-
> > >   drivers/media/platform/amd/isp4/isp4.h           |  11 -
> > >   drivers/media/platform/amd/isp4/isp4_debug.c     |   4 +-
> > >   drivers/media/platform/amd/isp4/isp4_interface.c |  46 +---
> > >   drivers/media/platform/amd/isp4/isp4_interface.h |   6 +-
> > >   drivers/media/platform/amd/isp4/isp4_subdev.c    |   8 +-
> > >   drivers/media/platform/amd/isp4/isp4_subdev.h    |   4 +-
> > >   drivers/media/platform/amd/isp4/isp4_video.c     | 297 +++++
> > > +-----------------
> > >   drivers/media/platform/amd/isp4/isp4_video.h     |   4 +-
> > >   13 files changed, 122 insertions(+), 347 deletions(-)
> > > 
> > > At least 1 of them should be redundant for your internal branch
> > > (9f394a7af2cf
> > > "media: amd: isp4: Use amdgpu helper functions for ISP buffers").
> > > 
> > > Cheers,
> > > Sultan
> > 
> > Wow, amazing, fantastic work. Will compare to our latest internal branch
> > to see what might be missing and try to merge, then have some test. Will
> > let you know the result, it might cost some time. Thanks again.
> > 
> 
> We cherry-picked your buffer related changes and did some quick test, it
> works well. Will merge them into our internal branch and check other changes
> later. Really appreciate for your time, effort and good work.

Glad to hear it! :)

Sultan

