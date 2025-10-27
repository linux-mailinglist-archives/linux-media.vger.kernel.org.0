Return-Path: <linux-media+bounces-45711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA94C1092D
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 20:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B36AF188D8F7
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 19:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42BB3277AF;
	Mon, 27 Oct 2025 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ee3CKPia"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E27632B9AC;
	Mon, 27 Oct 2025 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761591801; cv=none; b=tVHQh0Jv6vdAhNDfKeeMVwynnrOgSMVS/gnp3XO1vu/Uhkq6Lkj/NseeXTyV+dhK6yekb/gT+SMQRBGbMX3UngAV1CcxPdeXxeB4rRIU+ZmRPlLCocmi/mEKz1khRllPEswQhgoqqIgKMmQb6i/R4cNpOgocQLGD2gGqlE3UdcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761591801; c=relaxed/simple;
	bh=mxOFwk5lRd5FS7zpLKywRmnFvvWP4IUuq9+IUxBx1EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wcr4YfgGW0B9UqtanJyYGXORuuDjA/m0uNIpaJMhAwHGXgZGempAYFWS6H2T7su3QpezDZhVr5BOi/bVP0RIxzCSI4FZjcwKABt/P2zmoRoLRa5bY4d3loJPwKGEZNmYy1GVjJwFVXqY/DbTlAtsUxIziWl3cO4FCI8XURaYebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ee3CKPia; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761591798; x=1793127798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mxOFwk5lRd5FS7zpLKywRmnFvvWP4IUuq9+IUxBx1EI=;
  b=ee3CKPiaw+4TdUByemuv7z8f1VqjIPAVhIWl2VOlu/nlf/lQmkFwjUN2
   AR5vbdop4651utPEfdaOZmUrKsPqEpHgHaBjnlp8Zc8XuWpwOK4KhjMky
   sAlKxDWS1WtwbpJ/UrwpCkbx4PpJBrc4RGCvw5Vr24xow34SMG7YeWHbz
   DW5VwYM8R4DpBawVK5DAveKUfI1ZGlEBDs1E98rSdNsJC1DBjyBslAzcP
   CC7EDBVaUtCfZxyvN8p+/8nd+eKH7R/L5oXdh4I0uqq1rGW52O71WdciR
   pIw3l9debavNhlz0JHITOcHq/TJ7RsSJz0FoURoyg2fjEuCTJIEfyrfKs
   Q==;
X-CSE-ConnectionGUID: U12Z5i+MSL+GFiS+XgGb0Q==
X-CSE-MsgGUID: 2vdCAK2oR8OeZokwIfXu5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75027239"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="75027239"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 12:03:17 -0700
X-CSE-ConnectionGUID: 8NXCCER5QRusMiRO+ApiXA==
X-CSE-MsgGUID: bekkYv+qRza4tatC253nig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="190264220"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 12:03:15 -0700
Date: Mon, 27 Oct 2025 20:03:06 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 02/25] media: i2c: ov01a10: Fix reported pixel-rate value
Message-ID: <vwkf5pllrdlgadywz646m2mvcywmknrbbm2meb2dwcjpfgkrwp@hftcufxbuj5s>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-3-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-3-hansg@kernel.org>

Hello Hans,

Thank you for the patches.

On Tue, Oct 14, 2025 at 07:40:10PM +0200, Hans de Goede wrote:
> CSI lanes are double-clocked so with a single lane at 400MHZ the resulting
> pixel-rate for 10-bits pixels is 400 MHz * 2 / 10 = 80 MHz, not 40 MHz.
> 
> This also matches with the observed frame-rate of 60 fps with the default
> vblank setting: 80000000 / (1488 * 896) = 60.
> 
> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

