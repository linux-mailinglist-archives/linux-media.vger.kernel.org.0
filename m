Return-Path: <linux-media+bounces-31546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A151DAA6627
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 00:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62CF09C4FD0
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 22:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1D9265630;
	Thu,  1 May 2025 22:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4Qv1sf9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B820B1EE7C6;
	Thu,  1 May 2025 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746138167; cv=none; b=JZsoLo2wgwQRMts5iRWsFh8gChkYzKroXUIKOV0VWsrMPe/QEBUaBjHeTdg7YqEEC6V3GETQIE1vCNymdpZsDUlPcWPNc5wQPw1ctuiwqMSEkdnQ52sC0oCZS5sfp+qS+qmog4SrsKQJH0l1TlvqX1MijbE/boxhQFq1ZrOGSng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746138167; c=relaxed/simple;
	bh=2YXTvxMGZk1lisOGsqds3YqGmxDhLckCB/W09PFMeLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVhuj4ke8Z39HMbHYWwy6+DqkM0wJAZTKZLv9xQcFeNp7gSb0Q8VaZRKjo7o7FOqn4maJgfHVyabWticmcGwHGPG62FbAjQTCxoDs0S7ZwChHFMDSw46etmlrZ3vG+se3G6L3aVdQ7fDMCKUd9OiFE5VclLOLmBhxA5tOoH7QEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4Qv1sf9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746138166; x=1777674166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2YXTvxMGZk1lisOGsqds3YqGmxDhLckCB/W09PFMeLQ=;
  b=B4Qv1sf9FcpJutjvHiTCg56gC+Mrr3mgUt8OTC7e4Ba1O6Kz6YeHGiXr
   RSDR3YYZNzCgd3PsatWT0g/VUOnZHZfqAkmtcL4z3HJLd7B+2ZOA+RnTc
   39MvY8cozjbCb8n1sdNtbQkk4lEDx/a2MvoX6v4HxTy725lLK9XclZ169
   CAoMndPu4gTEjN3rvORcJdNoTA3VBYTnUBEUw5z8bDa13cQoYjQiHPgab
   43H2gzEJ3R8a3CILnC6chO2xif9jhGvx/omApvQ5y93p+hqOLJlQj1uQV
   oZwhKg+XQW4ZQy1qKvlYvHhKx2VwoM2/abjSuUbFAE2njjejdkYsrTuyl
   w==;
X-CSE-ConnectionGUID: Z/z3hKBpTPqsUPSRLDpHww==
X-CSE-MsgGUID: Le5+7lDuRkeKu1cJdvnrdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47961696"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47961696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:22:45 -0700
X-CSE-ConnectionGUID: SDiP3pCTSluK4NK1nF/8Hg==
X-CSE-MsgGUID: uTwuIFoGST6W8VMg8Sa8Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134238131"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.38])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:22:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9C68511F96E;
	Fri,  2 May 2025 01:22:38 +0300 (EEST)
Date: Thu, 1 May 2025 22:22:38 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 8/9] media: i2c: ov9282: add strobe_duration v4l2
 control
Message-ID: <aBP0Lioy6Qi0Iw66@kekkonen.localdomain>
References: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
 <20250429-ov9282-flash-strobe-v3-8-2105ce179952@linux.dev>
 <aBHe-55_U3bYTXyG@kekkonen.localdomain>
 <t7lnqmhufsyf5ygfkfyllvxpm4h2qdxotgi2lcfoxlhxjpejjd@mf2poxik2zje>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t7lnqmhufsyf5ygfkfyllvxpm4h2qdxotgi2lcfoxlhxjpejjd@mf2poxik2zje>

Hi Richard,

On Wed, Apr 30, 2025 at 11:09:30AM +0200, Richard Leitner wrote:
> Hi Sakari,
> 
> thanks for the review!

You're welcome.

> > > +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> > 
> > Should the number of controls in the handler be updated?
> 
> What do you mean by "number of controls in the handler" exactly? Which
> handler?

A number of buckets allocated in control handler's initialisation is based
on the number of controls given to the init function. You should update
that number when adding controls.

-- 
Regards,

Sakari Ailus

