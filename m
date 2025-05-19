Return-Path: <linux-media+bounces-32782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F498ABBF12
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9D0E1B619B8
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4ED27A119;
	Mon, 19 May 2025 13:25:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CDA2798FA;
	Mon, 19 May 2025 13:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661123; cv=none; b=clM//H54FpmTWX+Z/PgRrqAR6F23Ojf8T8puRTUiqgWx+Hbr53RhMYxADetB1Wxtu3i0z8IYNBakANI3VStmELtYNCZOW0OJ9oxRHPqw8YUyzCYQb0oJOTOXXl63EexjRJ3NJI025OQ6gidZEpZmPXaw1XfgiahaCTS3cb7WAas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661123; c=relaxed/simple;
	bh=S1Xbr3AzW36vspXHxfn8soMU4zqvoEvdYEuB7sWEw6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFFNE5p+BABbo0GQy6HLmJ+p2W3+6d2NQFLNamB3ebszirIS/gIP2+xYowHhTVNi8C7wdwQ5DO/FLGCe/5+IR90CIOgy2X40w0hl6UV3Mmeoz4uY+HWA05eBk5V5kL+0OSRhOvsxEOpEQiBZqWRn2sExWzo87lbhuC91P4OSiE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: FUy3f4T7SCq4v/tXPhkHdw==
X-CSE-MsgGUID: 5Qr6uncWT5mE+H2WIDvjGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49625236"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49625236"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:25:21 -0700
X-CSE-ConnectionGUID: +IdAwvjuRwupscCZU0Sw/A==
X-CSE-MsgGUID: yv3Bee/nSwyOnJTVOW4xdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="162657144"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:25:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uH0UV-0000000336L-2XQz;
	Mon, 19 May 2025 16:25:15 +0300
Date: Mon, 19 May 2025 16:25:15 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Pablo <pablo@pablo.ct.ws>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, hdegoede@redhat.com,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com, pablolucas890@gmail.com
Subject: Re: [PATCH] staging: media: atomisp: fix coding style
Message-ID: <aCsxO-qf78qs6QTU@smile.fi.intel.com>
References: <20250503200030.5982-1-pablo@pablo.ct.ws>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503200030.5982-1-pablo@pablo.ct.ws>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 03, 2025 at 05:00:30PM -0300, Pablo wrote:
> Fix a coding style:
> "ERROR: that open brace { should be on the previous line"
> issue reported in ia_css_vf.host.c:94.

Hans, have you taken this change? (I miss it in Linux Next)

-- 
With Best Regards,
Andy Shevchenko



