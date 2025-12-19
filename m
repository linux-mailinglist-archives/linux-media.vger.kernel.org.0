Return-Path: <linux-media+bounces-49168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF063CCFE46
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85FC03009F44
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C069E346796;
	Fri, 19 Dec 2025 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbN3lXgD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4A434677B
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766147688; cv=none; b=KMV1pXlzx3lBwAVULoiHnEbOyWFqMIaXJz3PS29sT5okYkcoRYyRs8OSJ64GZyAzr0NjJyh/fs5gvhoqMLDxofmmI7Atlq0Jp+FTXh8PiWH96xd4a1z2g8yVE0TIBGjfFQ7iW7RQWnXAqqxOpPpFC7xw881RMRezfUM/fT8SUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766147688; c=relaxed/simple;
	bh=n9XxOgbcyk8BsSpJIRrSLyGChApV8andfRrX2iJ7yE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZp0Asr9nhQNHWrq1EQzSoNmlypR6oPad5wOQGZEA2xKjUl7ifABByvo4HLGF12kgNePLg1a0irjF9JgAfYfG24ayV0LzkUmGQO5IAp/caPA/TD6a8h0qTVsAIfr3KCaa3+ziiFLIuQ16qOaYVCyMs9A14ftBqyEfNvuKhWbtRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SbN3lXgD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766147686; x=1797683686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n9XxOgbcyk8BsSpJIRrSLyGChApV8andfRrX2iJ7yE0=;
  b=SbN3lXgDt+hMHvyYP8fedZGX3xg3uE75nr6GT0OYEBaBBWIdfAhPyBVu
   H8tMrKrkCfxTrHnwxfUjkyVQf1kTnX4gZ6g4aryv/RHmNFTziwNmsQRUs
   mV0fAc3+pFB0duS+2tM30LRRivndTg50ge+EQZbjzVyQk3kHFZOg3MdDi
   zd2KoD1z1dFu/YjWYhtNeBhimHteK/4J+MksQE0zDo+HzenWPHWNkDEnR
   ZZnyPQgJADzNobIR9DHaaJWnHmXyUO1nn55fFZwkCPwbYn/r3BSGO1FnJ
   bPA3bKeCDaZ+oDMkKfEQa6N0LWGkt8HymzbxjVOgoZT2sBKOB+qIVfaia
   g==;
X-CSE-ConnectionGUID: PhSCdbXdRly1VipojV8uVw==
X-CSE-MsgGUID: digIRyn0RBqtLJFX0qRdug==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79227338"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="79227338"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:34:45 -0800
X-CSE-ConnectionGUID: Aj5HxT0eRPm0Ehvv2bBIow==
X-CSE-MsgGUID: 6TWv7goRSk+PdoBTDI2kKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="229893041"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:34:44 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 31FB9120EC2;
	Fri, 19 Dec 2025 14:34:43 +0200 (EET)
Date: Fri, 19 Dec 2025 14:34:43 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCHv3 00/12] media: omap3isp: v4l2-compliance fixes
Message-ID: <aUVGY_zKzbyDKJMU@kekkonen.localdomain>
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764661880.git.hverkuil+cisco@kernel.org>

Hi Hans,

On Tue, Dec 02, 2025 at 08:51:08AM +0100, Hans Verkuil wrote:
> When I worked on the patch series to remove the vb2 wait_prepare/finish
> callbacks, I had to test that series on my Beagle xM board with a
> Leopard Imaging li5m03 camera.
> 
> Since I wanted to use v4l2-compliance to test the vb2 change, I first had
> to fix a bunch of other compliance problems in this driver so it would
> actually be able to run the streaming tests.
> 
> This series contains the fixes I made to get to that point.
> 
> It depends on one sensor driver fix (posted separately):
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/554fb9d7-374b-4868-b91b-959b8fd69b4d@kernel.org/
> 
> This series doesn't fix all compliance problems, but at least it is
> a lot better now.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Also let me know if you'd wish me to pick these.

-- 
Kind regards,

Sakari Ailus

