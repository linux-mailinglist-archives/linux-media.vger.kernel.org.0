Return-Path: <linux-media+bounces-31390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E59AA45B9
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D109E985087
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A418218599;
	Wed, 30 Apr 2025 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlvlwNHz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9C9213E61;
	Wed, 30 Apr 2025 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002498; cv=none; b=rqAyxP5vhCsC+LACLVS2F8DFTnzbNjgM1qDgyXi7u/X+xGy3wZvnAmpe3twXBmosOW06wxtlFNBb92Q9qixNX1KQ89CJ3nSvOPS5V0GoX2hL5hBB1MjnUmODuDLPLQX/LYDYm82gvrbNS0rWhc83u5DnNITALJ93RRqCrqhUit4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002498; c=relaxed/simple;
	bh=0qEn7MJfVbxaANYajFwdnrNgy4w0+YWWm/KA1BB7luI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozHSDYe3271HPdrsR0uinNSdpcijL5eMEGuttAsAPtK8GhbcaaV/kLC7e0dOfkH5St0vZ6PK5xCsARQH40F9mdXZQzz/XGYcMytReYVlaV775rAwh9Tw/FEzggcT62VgiUq5Qgasb4NNBFkOAUWIICmlmTdRoLfyw0EptboZwlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlvlwNHz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746002497; x=1777538497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0qEn7MJfVbxaANYajFwdnrNgy4w0+YWWm/KA1BB7luI=;
  b=RlvlwNHzDyZEwv4btDC4XfwbKrJhLr3oaV+hjdc2gmjDbeMo9eygVcWj
   QjnbEpTiZp8zU1cVKn9T0yGzWO00WAHrozPaoZrIyXMGtlZRkaSotsrjL
   Vt8Oao19FNkG4I5Jn3ChQnMEFMYsCMePMjalj5oGhE6q+1gsEroPoEcfG
   mKi8ol029R4YMsKva06q9mtHWU6w6uvYUiN4hESkOD+0YJRPaFiW9DA77
   EP6dI6VzJfIfejSNi587lIgPRIKbCiThC50Yh3SicEzII+c0/plW3jcQ6
   2eUSovciKMLQBMeqUWoHT/mb6nZvxdPEUQGODLdkgTFXI9/hyVMsrKJSS
   Q==;
X-CSE-ConnectionGUID: clCHO2QgSoyY0A5xTv8jdA==
X-CSE-MsgGUID: h8B5wR+yShWM4qEzNc8J7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47534985"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47534985"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:41:36 -0700
X-CSE-ConnectionGUID: Ocus3NRtQ16MyjW9Ik4wDg==
X-CSE-MsgGUID: mJisz17zQVC6+ZNPg2uAvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="139039491"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:41:35 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CB95411F7E7;
	Wed, 30 Apr 2025 11:41:31 +0300 (EEST)
Date: Wed, 30 Apr 2025 08:41:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 3/9] media: v4l2-flash: add support for flash/strobe
 duration
Message-ID: <aBHiO6aIeLP6NSgr@kekkonen.localdomain>
References: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
 <20250429-ov9282-flash-strobe-v3-3-2105ce179952@linux.dev>
 <aBHeIBbFRkZ4P82E@kekkonen.localdomain>
 <zpmfhi6fzg3zhwifpi2kmstn4soex4fvg5jhha2me73r76bhgo@j2bfwdza23xs>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zpmfhi6fzg3zhwifpi2kmstn4soex4fvg5jhha2me73r76bhgo@j2bfwdza23xs>

On Wed, Apr 30, 2025 at 10:37:48AM +0200, Richard Leitner wrote:
> > > +	/* Init FLASH_DURATION ctrl data */
> > > +	if (has_flash_op(fled_cdev, timeout_set)) {
> > > +		ctrl_init_data[FLASH_DURATION].cid = V4L2_CID_FLASH_DURATION;
> > > +		ctrl_cfg = &ctrl_init_data[FLASH_DURATION].config;
> > > +		__lfs_to_v4l2_ctrl_config(&fled_cdev->duration, ctrl_cfg);
> > > +		ctrl_cfg->id = V4L2_CID_FLASH_DURATION;
> > 
> > Has this been compile tested? :-)
> 
> Oooh... Damn. That's embarrasing. SORRY! There should have been at least
> another '}' in this patch.... Seems I somehow messed up my last rebase.
> 
> Will fix that in v4. Sorry again :-/

No worries, it happens to everyone sometimes.

-- 
Sakari Ailus

