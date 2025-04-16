Return-Path: <linux-media+bounces-30378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC39FA90B23
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 20:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3D3F7AA043
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 18:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D6121147A;
	Wed, 16 Apr 2025 18:14:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFFF21A434;
	Wed, 16 Apr 2025 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827294; cv=none; b=LTSl9KP5683cKR2v613E9ENAibcQGC7F+X4E8unE+n9Ai95Hfc+YuD5qOkQNBinJbATSBUR2fwSxlDxjWVfwDSqVoDMG0/aLRUjHf6rTXWiSHaNYFuqbR8p3sN4Si2U32+q0xuvxxrVEV7bVZgutmSZFDruQP34ttzCt6YSHrx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827294; c=relaxed/simple;
	bh=W0QwuyvH5BZ634W1g61NNXUHmiUdiDbHR8iglFewLf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LN4S1ZIS/2ULsk6R9Xvlospv4SHw6zbGAyP4gzmX5e4yhwdES6kIWjMnVJELKdEhih6+rnmktEd6aVK2QmEQ76kl/wq1VlHHR9O0MwHNSrkDCPT0vtvaIo43Oy2JYaYrXA50NCaz9S1SWu/ZJ5FUo1NXsvL6iux0S/sCZhhL+AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: FXfK/2r0RSWYQxvVnu8lLQ==
X-CSE-MsgGUID: VpS0v3TdTfCz3k+KJhetHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="49086303"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="49086303"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:14:52 -0700
X-CSE-ConnectionGUID: UioSEYCvRSG4tu3cwArrTw==
X-CSE-MsgGUID: YhwxMlvDQxqUUCuxZVqD4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="134666196"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:14:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u57Ha-0000000Cw3N-31iU;
	Wed, 16 Apr 2025 21:14:46 +0300
Date: Wed, 16 Apr 2025 21:14:46 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 7/9] platform/x86: int3472: Prepare for registering
 more than 1 GPIO regulator
Message-ID: <Z__zlhaK7rjdcIfB@smile.fi.intel.com>
References: <20250416124037.90508-1-hdegoede@redhat.com>
 <20250416124037.90508-8-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416124037.90508-8-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 02:40:35PM +0200, Hans de Goede wrote:
> Prepare the discrete code for registering more than 1 GPIO regulator.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



