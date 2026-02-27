Return-Path: <linux-media+bounces-53680-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA9CKNdkoWn7sQQAu9opvQ
	(envelope-from <linux-media+bounces-53680-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:33:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6271B560D
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34DF53039CB2
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 09:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA603815EF;
	Fri, 27 Feb 2026 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBUu4YuS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FE927A477
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184695; cv=none; b=msubgzMgG5J5z3Ymp5k/zj0JxtoJiw3Grp45GqU1noWFXmW+8FfWz0laaTSlBGODPB25YV63ddRd9KVlZLWV1XRTI4hw5WPMW/5JGEyGnRPXtPWUD97DvoftMkk2Qoyae8P6la3oWxz3HvPsznoszgsSgM7ACEoPuBRBbSSzyss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184695; c=relaxed/simple;
	bh=YPcUfmZ2wPQ8/UQp1q6pQBmAGzOq+nyGoi+OFcHYE9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYXK3w0XKfoueADLJnLx3YpsG/xSjHrQwWAj+omx5Y1TagNwho8Dlnl1Ouzu+9uwkPVZQ9mfKhWW+Lj0RhTuJXMho+j9Gdx3AZ6Mvm7lqUFyHe1XvUVKQRaWaRCULR+9WyAOiX8cNlZI2yToymMiuMvdlyEiodxv1ykAd2ePjtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBUu4YuS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772184695; x=1803720695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YPcUfmZ2wPQ8/UQp1q6pQBmAGzOq+nyGoi+OFcHYE9g=;
  b=YBUu4YuSPJloCz+x3MumapGeCe5PSo+tIy9+NUSVA9q67wxOw+Om9scm
   O4nkv5RFYnL1J2wq9ezAPnquXOQUKZos5Zg6FoVdhXOi2+VG1xXdLURxV
   7tmIFOFxkww82xSG3dqopyC/LpQei/FAThkuOyayTpokHdv1Qgz39oBvT
   /b145TzaOlfzqxt6dXBELrzxJwatnY30o9b+CzdczO/6UhumIZ2eA4R+A
   DdQj/dt4GHRU+qnc9a0ALumuY3bPQbk65Jw/EgI6D8rKbTa+UHzd+B+S1
   9kcF8hLEmMk8zWi653Uq7+4TMtB5rhKuY34U3rBMIfxLehsOFNlzgRuRm
   g==;
X-CSE-ConnectionGUID: 6hr6Th+FRpeLSGMmMKNBkw==
X-CSE-MsgGUID: LUc0Y4mFRfGtGU/b/OJzhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77130165"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="77130165"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:31:34 -0800
X-CSE-ConnectionGUID: ZIWaM+YaQm6uTTsDeJWUgA==
X-CSE-MsgGUID: PZVPFl6GSCuV8/zz8p19FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="214719986"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.65])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:31:31 -0800
Date: Fri, 27 Feb 2026 11:31:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private
 IOCTLSs but S_PARAMETERS
Message-ID: <aaFkcS1fMVLxGB87@smile.fi.intel.com>
References: <20260227092327.3654603-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227092327.3654603-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53680-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: DB6271B560D
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 11:23:27AM +0200, Sakari Ailus wrote:
> Disallow all private IOCTLs except ATOMISP_IOC_S_PARAMETERS. These aren't
> quite as safe as one could assume of IOCTL handlers; disable them for now.
> Instead of removing the code, simply check the IOCTL matches with
> S_PARAMETERS and bail out otherwise, in order to ease backporting.

> In particular, ATOMISP_IOC_S_ISP_FPN_TABLE is disabled by this patch.

Why not removing the code?
It's still and will be in the Git index, it won't disappear.

-- 
With Best Regards,
Andy Shevchenko



