Return-Path: <linux-media+bounces-13223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E349083B5
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 08:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 718F01C21E6A
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 06:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A001474D0;
	Fri, 14 Jun 2024 06:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSuK7eth"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AB8145A05
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 06:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718347090; cv=none; b=mLbyRisVqn9tlGoUCQFA+fYZ280FVaL43Ixmxi3P9q4BYmbNVWTz7sKUjPPlCkQ0rzfgGd6pcU/L9s0veKIPKIE4Jx6StkdQtCnVz22jGbHUIcwu8LUnFN+pAduqeqqLgXklZo/+0gnVTDCzhbMk2FMWvsotxjWIwKN5iWW/yRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718347090; c=relaxed/simple;
	bh=wtltpJnO+mS2p0DNASwQFqMjmhmw4nmjCsradui+/Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oCk5bNddNXC5XzuM567pG3KP/JO9YIyPmZGK+Gd9itYRVQX5wHRoS4oBsz9Cgd5whcHCDe4Lk2WXGekBDXF1jxDqIWSyrarG0zArCrbAJmLj6QP7mPm4YRIU69fiGWXQQQDVSDi0cp8Lbe0Uzjdweor0k8Rmm3mvPjLENc7mvKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSuK7eth; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B200C2BD10;
	Fri, 14 Jun 2024 06:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718347088;
	bh=wtltpJnO+mS2p0DNASwQFqMjmhmw4nmjCsradui+/Mc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NSuK7ethMpl6jsxxSplYFvUdbGFsvAJvuWdp5HYDlqNhVxLa4GAB9tU9RSH269CZT
	 fz5bWDmei3SMew/mMesoE5csQBsEMy8Zz3YzmUQj1SxSunx/azH07FGqP0qET6c5Bp
	 Kv6GlU8xOS9F6YUgYCEGWXmLfBXXGXC+hsDSiDbQRgVFpLSKaS8vATW7sdGua10EB7
	 612jdrGYsbn4zeniziKJneQygfivpEEDOIQnGRo/OWI9QU4R7qANl4mL5MmRHlipOa
	 kPXFRzBfrDrMoFmx/kNwoGhvi7REeWV9Wh+xvfxm2F8DLnYIENJF9AteXW6I32ly0c
	 Qkuzq8/K4/A+w==
Date: Fri, 14 Jun 2024 08:38:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Umang Jain <umang.jain@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: imx283: drop CENTERED_RECTANGLE due to clang
 failure
Message-ID: <20240614083754.62ebe6ba@coco.lan>
In-Reply-To: <ZmsTiONeON0ijKfk@kekkonen.localdomain>
References: <ff7a05e2-2908-4da0-817a-1d7c271e788a@xs4all.nl>
	<171829240304.2248009.15616094068000525791@ping.linuxembedded.co.uk>
	<ZmsTiONeON0ijKfk@kekkonen.localdomain>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 13 Jun 2024 15:43:04 +0000
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Kieran, Hans,
> 
> Thanks for working on this.
> 
> On Thu, Jun 13, 2024 at 04:26:43PM +0100, Kieran Bingham wrote:
> > Quoting Hans Verkuil (2024-06-13 16:19:08)  
> > > The CENTERED_RECTANGLE define fails to compile on clang and old gcc
> > > versions. Just drop it and fill in the crop rectangles explicitly.  
> > 
> > So back when I was playing around with this I thought it would have got
> > dropped during review / upstreaming before now - because I couldn't find
> > a way to make sure the macro args were guaranteed to be used only once,
> > by putting some locals in the macro (because of the initialisation).
> > 
> > So I'm not surprised that it needs to be removed, but I am surprised
> > that it wasn't for the reason I expected ;-)
> > 
> > Anyway - maybe later I'll experiement with more common helpers perhaps -
> > but not if it hits compile errors..  
> 
> Or once clang before ~ 17 is deprecated? :-)


It is not deprecated for Kernel builds. See Documentation/process/changes.rst:

<snip>
Current Minimal Requirements
****************************

Upgrade to at **least** these software revisions before thinking you've
encountered a bug!  If you're unsure what version you're currently
running, the suggested command should tell you.

Again, keep in mind that this list assumes you are already functionally
running a Linux kernel.  Also, not all tools are necessary on all
systems; obviously, if you don't have any PC Card hardware, for example,
you probably needn't concern yourself with pcmciautils.

====================== ===============  ========================================
        Program        Minimal version       Command to check the version
====================== ===============  ========================================
GNU C                  5.1              gcc --version
Clang/LLVM (optional)  13.0.1           clang --version
</snip>

Regards,
Mauro


Thanks,
Mauro

