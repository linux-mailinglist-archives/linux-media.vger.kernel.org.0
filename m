Return-Path: <linux-media+bounces-24236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D58ADA00D9E
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2025 19:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E3581884BBF
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2025 18:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7B41FA261;
	Fri,  3 Jan 2025 18:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sTg1kMpF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5E167DB7
	for <linux-media@vger.kernel.org>; Fri,  3 Jan 2025 18:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735928963; cv=none; b=LCAanQqRrpzn9R4mgg8s6ZbNhaSefG8FFCXHYqTSBMwvWY5i9M4+spNLgquFMPGwgPMNJI05ZbC68NBZN+kAuBGoU7X2zQrdo2sGtMhlApMXpp6JjVU2G4HCHT8K7bZFd9HfHDvS2vTO+2PK1+ncAXZv9lSyGzZFlxONRAsDwEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735928963; c=relaxed/simple;
	bh=LZEq5uiAw4+uyD4pIrNcIq+37sNf/AUqhpqffyKVmWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quGtlanH4tGwxqAknl4pBGfTpT+xbKf181yH92WZhDy8lvGY3ggOolgJxPXqbWTqG+rMkxD/zzkct6ZGv3bB8AE29p9qm5mHSpGoxl8HG0HwlIusfhL0d9lXz8hX+kVDmwMgQ0pVPZH0KbI2xSb7LfvzihOEDPKxQx76UZFJ6uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sTg1kMpF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69A88496;
	Fri,  3 Jan 2025 19:28:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735928909;
	bh=LZEq5uiAw4+uyD4pIrNcIq+37sNf/AUqhpqffyKVmWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTg1kMpF886PtC1VQuJ1NMnWuoG2lzAM8u/n67WQLaijNnIo4vYWm3zYw8mNxPAcz
	 0A6qcNIBw5NumyCvMh6IUCi1b45yEuAJ0h1b1KGLEpY137hs7LicoBZZw68CbM7eM6
	 MPjynhQcthjZpjIsACbuVvA4JMV5Y26hFX5zHX8A=
Date: Fri, 3 Jan 2025 20:29:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, linuxtv-commits@linuxtv.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [GIT,PULL,FOR,v6.14] imx8-isi fixes and improvements
Message-ID: <20250103182918.GA29245@pendragon.ideasonboard.com>
References: <20241218004058.GA24802@pendragon.ideasonboard.com>
 <67622b40.050a0220.3a9c93.6e95@mx.google.com>
 <20241218021847.GA1844@pendragon.ideasonboard.com>
 <20241218162341.4c6f1814@foz.lan>
 <20241218213341.GA29014@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218213341.GA29014@pendragon.ideasonboard.com>

On Thu, Dec 19, 2024 at 01:25:55AM +0200, Laurent Pinchart wrote:
> On Wed, Dec 18, 2024 at 04:23:41PM +0100, Mauro Carvalho Chehab wrote:
> > Em Wed, 18 Dec 2024 04:18:47 +0200 Laurent Pinchart escreveu:
> > > On Tue, Dec 17, 2024 at 05:54:08PM -0800, Patchwork Integration wrote:
> > > > Dear Laurent Pinchart:
> > > > 
> > > > Thanks for your patches! Unfortunately media-ci detected some issues:
> > > > 
> > > > # Test media-patchstyle:./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch media style
> > > > WARNING: Commit cf21f328fcafacf4f96e7a30ef9dceede1076378 found in the stable tree, but stable@vger.kernel.org not in Cc:
> > > > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")'
> > > > #16: 
> > > > Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")  
> > > 
> > > I don't think Cc: stable makes sense for this particular commit.
> > 
> > Sure, not all commits are actually fixing things, but, in this
> > particular case, it sounds that it contains a real problem:
> > 
> > 	Running the v4l2-compliance (1.27.0-5208, SHA: af114250d48d) on the m2m
> > 	device fails on the MMAP streaming tests, with the following messages:
> > 
> > 	fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
> > 	fail: v4l2-test-buffers.cpp(1508): buf.qbuf(node)
> > 
> > causing userspace to fail. For me, it seems that such patch needs to 
> > be backported.
> 
> If the fix wasn't fixing a problem, it wouldn't be a fix :-) The reason
> why I don't think this is worth a backport is that it only fixes an
> issue reported by v4l2-compliance, that hasn't to my knowledge affected
> anyone in other use cases. Given that the driver evolves, backporting
> this change blindly, testing compilation only but not runtime operation,
> has a higher risk of introducing failures in stable kernels than it has
> a chance to fix issues that affect people.

As there has been no voiced disagreement, I'll send a new version of the
pull request without "Cc: stable" for this commit.

> > In doubt, please add c/c stable when fixes is used. If there are good
> > reasons why not doing it, please place the rationale at the patch.
> > 
> > > > total: 0 errors, 1 warnings, 15 lines checked
> > > > WARNING: ./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch: Fails some mandatory checkpatch tests
> > > > 
> > > > # Test checkpatch:./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch checkpatch
> > > > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")'
> > > > #16: 
> > > > Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> > > > 
> > > > total: 0 errors, 1 warnings, 0 checks, 15 lines checked  
> > > 
> > > This I can fix. I'll wait for replies to the above though.
> > 
> > Please do it.
> > 
> > The rest of the PR sounds OK on my eyes.

-- 
Regards,

Laurent Pinchart

