Return-Path: <linux-media+bounces-27494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8BA4E4EE
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83BB08A59EC
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 15:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E70206F3F;
	Tue,  4 Mar 2025 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9yCZpeq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CE025524B;
	Tue,  4 Mar 2025 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101985; cv=none; b=s1mR/6V/ahjITVy4ZxU/ajnqeW/H0vFVLqPj2nezKaHd4xTVL9qLi4Krom+ieiVy2ah0ohFjJ+Zj+aJ3vHOvOkfk0YKqXKWdd+Sj/okNZ0Zbq8d95ZUL23qVEyMVgol/bJJ4F16BgD9Q6lYkXCyDvF+9amCzhFn1yywrApuy+2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101985; c=relaxed/simple;
	bh=qHj1+tZ7AVPwaYnRBeF2DCZKg/Jifaa1z4WGWC6sk/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Awku0wKmw1GrVfiXGBuM/YwN//9KJHRBGor8Mo+lKiEBXlzc2SLvenClO+hRDI1S4k/Nlbpqwi5zZhePZ/V2AIrIGxhEsbTOrH42fGhVcrqYeqhV+l1BVb37b69rERD5GmKzPVts51a+/TlGHiEkCOv537Pb3g43FnPQdXwKL7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9yCZpeq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741101984; x=1772637984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qHj1+tZ7AVPwaYnRBeF2DCZKg/Jifaa1z4WGWC6sk/I=;
  b=Q9yCZpeqFO7n6zUfQO9ekaM0vezarWLHKMUUo/Vze3X9YuY3OjJolC1I
   dSok8wIL+XClc8PepSbU5x4Bxo6ViQVRSiL2L9ndrdFb1sI3w+GNllz1E
   dJP0PZsqFiGDNxmELYzCPGDAk2R5ktzCgvCMis5HsRzo0f+1tFG/NnCdL
   E3NruApItSNeypg5Mh3Rhqs6DM8rt+x+sdqWfUxDW65goVevdpTGcnJvW
   d0YU0XmD4Yeul398u6Ve7iZw/3Dqq0gndrs5xgRgH2lACn1OSETCHgjcW
   m5FTELq3ZEpmoK3KgAvfDZF4wfPhS/VxxGV/lCJm5LcorfREXhnqhFc/1
   A==;
X-CSE-ConnectionGUID: sfkqGDDeSyGlImh24VtMiQ==
X-CSE-MsgGUID: Yr3vhpqrSJ6wBp4uFhYXTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44832429"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="44832429"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 07:26:23 -0800
X-CSE-ConnectionGUID: HTYofgJ9R+qjcGiJzbIVxQ==
X-CSE-MsgGUID: ltF0tb+1TSizLKQLCoNSOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="123405504"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 07:26:22 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2B98F11F855;
	Tue,  4 Mar 2025 17:26:19 +0200 (EET)
Date: Tue, 4 Mar 2025 15:26:19 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] media: i2c: imx219: Minor improvements for runtime
 PM and stream handling
Message-ID: <Z8cbm64-uQOW1qon@kekkonen.localdomain>
References: <20250304151134.105771-1-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304151134.105771-1-tarang.raval@siliconsignals.io>

Hi Tarang,

On Tue, Mar 04, 2025 at 08:41:32PM +0530, Tarang Raval wrote:
> tarang.raval (2):
>   media: i2c: imx219: Enable runtime PM before sub-device registration
>   media: i2c: imx219: Use enable/disable_streams callbacks
> 
>  drivers/media/i2c/imx219.c | 62 ++++++++++++++++++--------------------
>  1 file changed, 30 insertions(+), 32 deletions(-)

These no longer apply after commit 42eceae9793566d0df53d509be3e416465c347f5
.

Could you split the patches into 

- use autosuspend and
- switch to {enable,disable}_streams?

Perhaps moving to {enable,disable}_streams first is easier actually.

-- 
Regards,

Sakari Ailus

