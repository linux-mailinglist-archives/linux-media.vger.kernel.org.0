Return-Path: <linux-media+bounces-23742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AEC9F70BE
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 559D816DDBB
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BDF1FCF79;
	Wed, 18 Dec 2024 23:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="itvkAbMS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A541991B8
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 23:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734564366; cv=none; b=E12lFkcMRtyZKGbU1PrPrpZZKdQGvMpmtNWCQBan8ponidE6ActPbIaCkaaw3juq3vbxInQK/YOeifVYZK8tNaQ+KpXzP/wYsesbfPuNQ7BwrL9Kgz2mB3VgpgRSvnE0TFbKrnQZzaWHKBQ19gjT1uSaHQC7Vv3TeP5sB/jRpTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734564366; c=relaxed/simple;
	bh=1mdB/5i+A9cOJv0Oi1sIwiC4FcczYm1b2MLnrU/KiCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/Qmp7X0XEGLFM0HRZQNyN12tylGD10SkG851hJQTJp7l+fdjkyZOQIhCnwBUw+oaFrZmVwMvBOiNtIDhALyisVbHmnycRxGOhRMDEfLz9Uokyo7VKD3fjrFwX4YxK31rVUK7nuwtR67xXNeY1PU4oxUtC2aPa9bemcZNLFBQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=itvkAbMS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94718163;
	Thu, 19 Dec 2024 00:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734564320;
	bh=1mdB/5i+A9cOJv0Oi1sIwiC4FcczYm1b2MLnrU/KiCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=itvkAbMSDPvqocAtQJnPxrpKJTcNBnwa2CAs7RjzRb/l64+Y89WYbR5B20lPhzoMY
	 A2FHrYjEE3Y7uT33sC6tmdwFhd5hq21pqeHi+SBEkZSQpKUjFT19ljGJ3x0uXGxGkr
	 hIc3O/693n9DSkp3i5aWWVrwp1VigeZb9Vk1hIRQ=
Date: Thu, 19 Dec 2024 01:25:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, linuxtv-commits@linuxtv.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [GIT,PULL,FOR,v6.14] imx8-isi fixes and improvements
Message-ID: <20241218213341.GA29014@pendragon.ideasonboard.com>
References: <20241218004058.GA24802@pendragon.ideasonboard.com>
 <67622b40.050a0220.3a9c93.6e95@mx.google.com>
 <20241218021847.GA1844@pendragon.ideasonboard.com>
 <20241218162341.4c6f1814@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218162341.4c6f1814@foz.lan>

Hi Mauro,

On Wed, Dec 18, 2024 at 04:23:41PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 18 Dec 2024 04:18:47 +0200 Laurent Pinchart escreveu:
> > On Tue, Dec 17, 2024 at 05:54:08PM -0800, Patchwork Integration wrote:
> > > Dear Laurent Pinchart:
> > > 
> > > Thanks for your patches! Unfortunately media-ci detected some issues:
> > > 
> > > # Test media-patchstyle:./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch media style
> > > WARNING: Commit cf21f328fcafacf4f96e7a30ef9dceede1076378 found in the stable tree, but stable@vger.kernel.org not in Cc:
> > > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")'
> > > #16: 
> > > Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")  
> > 
> > I don't think Cc: stable makes sense for this particular commit.
> 
> Sure, not all commits are actually fixing things, but, in this
> particular case, it sounds that it contains a real problem:
> 
> 	Running the v4l2-compliance (1.27.0-5208, SHA: af114250d48d) on the m2m
> 	device fails on the MMAP streaming tests, with the following messages:
> 
> 	fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
> 	fail: v4l2-test-buffers.cpp(1508): buf.qbuf(node)
> 
> causing userspace to fail. For me, it seems that such patch needs to 
> be backported.

If the fix wasn't fixing a problem, it wouldn't be a fix :-) The reason
why I don't think this is worth a backport is that it only fixes an
issue reported by v4l2-compliance, that hasn't to my knowledge affected
anyone in other use cases. Given that the driver evolves, backporting
this change blindly, testing compilation only but not runtime operation,
has a higher risk of introducing failures in stable kernels than it has
a chance to fix issues that affect people.

> In doubt, please add c/c stable when fixes is used. If there are good
> reasons why not doing it, please place the rationale at the patch.
> 
> > > total: 0 errors, 1 warnings, 15 lines checked
> > > WARNING: ./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch: Fails some mandatory checkpatch tests
> > > 
> > > # Test checkpatch:./0001-media-nxp-imx8-isi-fix-v4l2-compliance-test-errors.patch checkpatch
> > > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")'
> > > #16: 
> > > Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> > > 
> > > total: 0 errors, 1 warnings, 0 checks, 15 lines checked  
> > 
> > This I can fix. I'll wait for replies to the above though.
> 
> Please do it.
> 
> The rest of the PR sounds OK on my eyes.

-- 
Regards,

Laurent Pinchart

