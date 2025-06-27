Return-Path: <linux-media+bounces-36090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 525CFAEB5B8
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 13:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 300327AE162
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 11:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588DD29E112;
	Fri, 27 Jun 2025 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCOKEq9n"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F0829DB79;
	Fri, 27 Jun 2025 11:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022075; cv=none; b=ufUu+PPtoAP+bIzjKhdkpnQ675a6HWoTJwTpqjzR031kHF7aStmhuyMuSneYLB27f8Ku4TjPaNOmfxiRDQBEAUzGcH5Haqofc5XtFigy7IH10OffpTBm5hPaxNnIUeXnQ0gbn43PEnACLq2okfE7Sbf8/Osywp5yAgdy9yfibq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022075; c=relaxed/simple;
	bh=c+o4o1W5LrCSv6enfzhJpCZAcCcaLrGjYkQH30oj5Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/A5jT9IsoSOF8S2iL2IxCsXXZ2VdZzN8K8UXRvj2eJTFXJLm41ACafE+mnfwPQnOntLxK3l0kKtJkNUk0AOKd7nxlIV2BW8gNrQrTxge/NlwcDnJTksVMsmo5MFtYW9+hvfPuWDUHy3dNUUBW+OIHVr84wjOyJb1erJG0wKyO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCOKEq9n; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751022074; x=1782558074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c+o4o1W5LrCSv6enfzhJpCZAcCcaLrGjYkQH30oj5Sw=;
  b=eCOKEq9nfS4EjC27rmVOVPE0ZG/FXQTMn5fms9EkoHZCqLwOyj9FgXDD
   Ckt5sU82FTfH8ZA4HKLkF4POspOKZJdFqgDeoprNW209Ltnp7uImNZphm
   ApHuoza4ZChrrfnnXna1STisZ1y8Y5fGZScOsRhwjOQc0frmmhcPQszXV
   pnnTCnEmJDJ3VDmm2ETgWX6DhtDmak6TriLHu2RnuZH0ldR+QvoV+S3kq
   9B3I+U/gwXw4lqqtPGB6ljsryiLhCLNQiF76uYv4aWJmICAz87CGfFnou
   mjJm7S+9LwdsXsTg7iwXlncSLQ/ntbD4XwhQKAmfafdms0nKvT3fGe4kZ
   w==;
X-CSE-ConnectionGUID: ngCoP4f4QZuyC0M2+PSkhw==
X-CSE-MsgGUID: QclRRHSyTpmA+JK2bZobWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52565518"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="52565518"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:01:13 -0700
X-CSE-ConnectionGUID: MI9ObuygSn6Tx29iN1mzMg==
X-CSE-MsgGUID: bUThnTU3Sj+M4+waK9dyGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152957137"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:01:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uV6pO-0000000ASU7-3Cng;
	Fri, 27 Jun 2025 14:01:06 +0300
Date: Fri, 27 Jun 2025 14:01:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.com, dan.carpenter@linaro.org,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v5] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <aF558plEWPpTw78F@smile.fi.intel.com>
References: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 01:06:04PM +0300, Abdelrahman Fekry wrote:
> The sysfs attributes active_bo and free_bo expose internal buffer
> state used only for debugging purposes. These are not part of
> any standard kernel ABI, and need to be removed before this
> driver may be moved out of drivers/staging.
> 
> - Remove active_bo and free_bo attributes
> - Remove group registration calls form hmm_init() and hmm_cleanup()

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



