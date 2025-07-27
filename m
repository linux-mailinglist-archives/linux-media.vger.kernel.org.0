Return-Path: <linux-media+bounces-38511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A077AB130C3
	for <lists+linux-media@lfdr.de>; Sun, 27 Jul 2025 18:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BCC93AE16E
	for <lists+linux-media@lfdr.de>; Sun, 27 Jul 2025 16:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75927EADC;
	Sun, 27 Jul 2025 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FL+anpJX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9DA19D071;
	Sun, 27 Jul 2025 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753634893; cv=none; b=J1MciPas4NNVj2qACPKpsTzHuEsm7oPk0n/4fZ8HtP2C8upvhLoV6v5217umC3oTy038sLZwYYKKQD/8bKqYsneRu2fChDQ8Un5liyHrpyCXq8FKVqj7t7sFQQYp3oSkIzrn37BAJyS7C1btxE999Z+biPPSrjHIOBhp9j2JD5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753634893; c=relaxed/simple;
	bh=29PiIc0FCsToq44ShkKaB3+GWD6ukWKyKuGRtKsWQYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7UL0HkJqwBlLlSeF6kj952ge3SsByJeh8UYj2tdBrXp4PbqikJi+mQLe6sivdKP8pJchc12TbBXAi+EzJoHAZDoKLwNBltSD5ahqgta444bT7AGDzNy5oq5OFXhn+67M4qaaYMtNcrt/hh4x6NxXZNruZ91ya7W6vhuRwFy+wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FL+anpJX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753634892; x=1785170892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=29PiIc0FCsToq44ShkKaB3+GWD6ukWKyKuGRtKsWQYs=;
  b=FL+anpJXH0TsexjzEMYBqcL1b50KvZnn7zkChrrW7vrCc0/H5B3y23dr
   eHO0LWmC3GjJTQlATVzP/OJaaaVJvjAtasG+2JZ8vloMYKp1ENMNSsDPA
   /42LUvCterWed7Qyn2LsLOaCMebiB7cKeKkjhsbJVSOSNFP5WXtlrD5yD
   23DJ8sYR/KCnt41IZVENhhbv0yJEq/fu5Ma5sMFbHyAZLcuFrB985rWGU
   82BSOlVhTzZAr6EoukGvYtiBJslAGjPHrnPEtp9k1kQPmsKLz3E2PbXh0
   1f3fDYEnJM5mFo18o2cWhnFeQLPW1DTWcLI1lbmQDfep2Ew78zjnArTnf
   Q==;
X-CSE-ConnectionGUID: lP4K62rkQiGWg10QIMOZRA==
X-CSE-MsgGUID: M/cAv2bTTC26kBcJ+vBM3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55861350"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55861350"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 09:48:10 -0700
X-CSE-ConnectionGUID: kSIEa9NpSKmexkIlktC4Ug==
X-CSE-MsgGUID: Ze3qnDWWSjGW0HyXUX+grg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161916651"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.124])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 09:48:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5574E12031D;
	Sun, 27 Jul 2025 19:48:04 +0300 (EEST)
Date: Sun, 27 Jul 2025 16:48:04 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	James Cowgill <james.cowgill@blaize.com>,
	Yunke Cao <yunkec@google.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] media: Add devm-managed helper functions for media
 and V4L2 subsystems
Message-ID: <aIZYRJQNaNTXE3Cm@kekkonen.localdomain>
References: <20250723102515.64585-1-tarang.raval@siliconsignals.io>
 <20250723125520.GB6719@pendragon.ideasonboard.com>
 <PN3P287MB1829D71FB3C2B41FF28D6A198B5FA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB1829D71FB3C2B41FF28D6A198B5FA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,

Thanks for the patchset.

On Wed, Jul 23, 2025 at 02:08:03PM +0000, Tarang Raval wrote:
> Hi Laurent,
> 
> > On Wed, Jul 23, 2025 at 03:55:04PM +0530, Tarang Raval wrote:
> > > This patch series introduces devm-managed versions of several commonly used
> > > media and V4L2 initialization functions. These helpers simplify resource
> > > management by leveraging the devres infrastructure, ensuring automatic
> > > cleanup when the associated device is detached or the driver is unloaded.
> > 
> > I'll let Sakari review this, but overall, I don't think we want to take
> > this direction. Objects need to be refcounted instead of freed at remove
> > time. 
> 
> I agree that refcounting could provide more robust lifetime management,
> especially for shared resources. I will think in this direction, explore 
> implementing refcounting for these objects, and share an RFC for your 
> feedback.

I agree with Laurent here when it comes to the current state of the
patches.

Tearing down things automatically, however, is what we should look into.
But I believe it will require refcounting sub-devices first, then we could
bind such resources to them. But before this, we'll need to merge the media
device refcounting series
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=media-ref>.

> 
> > This patch series doesn't necessarily cause a regression as such,
> > but it will make it more difficult to fix life time management issues in
> > V4L2.
> 
> Could you clarify how devm-managed helpers might complicate lifetime 
> management in V4L2? Understanding specific issues will help me design 
> a solution that aligns with the subsystem’s needs while keeping cleanup 
> simple.

The problem with devm_*() and UAPI is that once the device disappears, so
disappear all its resources, including those being used by whatever
programs accessing the UAPI, leading to memory safety issues. IOW devm_()
when used on memory resources in V4L2 is often simply wrong but right now
we don't have yet any better options in a lot of cases.

-- 
Kind regards,

Sakari Ailus

