Return-Path: <linux-media+bounces-6419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDCB871B65
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 11:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ACD928312B
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 10:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32CC5C911;
	Tue,  5 Mar 2024 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO+m0CJS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2115C8ED
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709634120; cv=none; b=piMfOcBvR+34eVpbcHxK3A2KbQkGf8pSOKC1HC4NHLRLwTGfs7B2TMKxxe9OUvcfqspnwg9b3DOqbVCVevLYaAVYGM/gTZvNuoH9Cxqi3EV8v54Rmpfpej1fWYKKHaT8AyXXqAB0Xz8fop2BFrhKD9J0WjtjCN10q9fOjwm1CV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709634120; c=relaxed/simple;
	bh=VZQfqbkXpOiLNXEojNf+l1vDHdR49iFvc+8qJwxcM0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Myo8gidkZWwuhma3cXBQd3sIGCH94kpRwpdq4LRjsjDvo/zSua5u8/B97WzSqRN3F4pzV8UbRhYW3A5EQ3Kt/ojuyjkJLx8cjVv88RV2c/H2v+vsMmUeA9h0VJU4d6b8xyhMT5Q1Qi2UIPTy+SF3OY9nBAdZheauTDNAFG8KLGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO+m0CJS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709634119; x=1741170119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VZQfqbkXpOiLNXEojNf+l1vDHdR49iFvc+8qJwxcM0s=;
  b=hO+m0CJSOhsYM6RvGKfk1B9Nn8pS/APS/mm7sBH78oxrfYZyIJoC8Hok
   35/w8C4cCcCSvTWUX0P2kKJLKtCfV17sFczjlDko50NVglrsccB4Nnymv
   u44cHpu0nQhB8G9dSi4CUHK/irthJZR1L61nCY+Bk4qqGrN89jSIhx6HE
   1dt8UVEXLtdtDf2fdnRPMi6ecPnUlEmvs2XKQA13gQcuARzZjY4h7o2km
   uqeDw3ZFvHke7FytUbrDwLNG28dCDvN4Hh71/iIxVmIW2NhdQM2LskRd1
   u/vdUT+q5O/6w6KFlsEO8Q6GNWmjywhZa1SW/o3uQmp2DeSflgsxkUGvu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4057422"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4057422"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 02:21:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9234705"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 02:21:57 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6030511F871;
	Tue,  5 Mar 2024 12:21:54 +0200 (EET)
Date: Tue, 5 Mar 2024 10:21:54 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 20/29] media: ipu3-cio2: Call v4l2_device_unregister()
 earlier
Message-ID: <ZebyQv0vWK9zw1U0@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-21-sakari.ailus@linux.intel.com>
 <20240207142435.GR23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207142435.GR23702@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Feb 07, 2024 at 04:24:35PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Dec 20, 2023 at 12:37:04PM +0200, Sakari Ailus wrote:
> > v4l2_device_unregister() unregisters V4L2 sub-device nodes among other
> > things. Call it before releasing memory and other resources.
> 
> Please expand the commit message, it's not immediately clear why this is
> needed and what the consequences are.

Thanks for the review.

There's actually a change in APIs here as the async notifier expects the
V4L2 device to remain in place so the notifier can't be cleaned up before
unregistering the V4L2 device. Further patches in the set move cleaning up
the notifier to the release callback but I think it can well be done here,
too. So I think this patch can be dropped.

-- 
Regards,

Sakari Ailus

