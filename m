Return-Path: <linux-media+bounces-31596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F20EAAA7499
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BDDC1B61CBE
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 14:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AF72561B4;
	Fri,  2 May 2025 14:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hf3VTCpo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7022255F20;
	Fri,  2 May 2025 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195170; cv=none; b=EkKlpWpxAo5M8Opq/2/3DKWJkD6wcf90YvCbWrQvG8kqA3VmTQxzlqv+v6wqF6T7Ve4SA0iv/jCAhL5ltmr13cdG23zOXOyLiOTiDfzOYKBVyxNHik7CfggBINgXjFpE6q7qk1IQmIsK3N9cGUl1/97EcKhHaeZ8DZghPVZX0+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195170; c=relaxed/simple;
	bh=nbvyWJfcbMRputJvnyBQDNBMs7+JJ99UVmLUfS2/Tpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4J3AvKeCP2bAd5/nscfI/baNNC6CZXg9Cjy6R1ztEBw9DFbgkMfgowBPAovO12DhhCgxqAFL4IJSj5v5PBCWn+HDfxQdtHJpCRmcQvCLm5l1at8Un69N841qq+c5WYK3v1jr5yxgqjY0XDMAkcfDmFr3p5dfatGKIfjjBjDo/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hf3VTCpo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746195169; x=1777731169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nbvyWJfcbMRputJvnyBQDNBMs7+JJ99UVmLUfS2/Tpk=;
  b=hf3VTCpoUY32ZYv8O01bfJS8bLXTeBqFNJQkpoywRy716P4XQ1zVbFQF
   OyE8l99qd1ddboP+g8D8c8Ih+nTHyk696TF+b0/HtKE8VeOeqn6BFpEMS
   KxfI1gHqoN4/IsWzAM3ma1gkmlTDP4MfPmyfheXNG0MkZjY5vhEq4iQKz
   8Hh9a29PnTkIgIcAhNjPfU+e5pX/LrXRNihKpIo0Gy9d7qPSTXuT6jRyX
   oq6ia6CwnoC5mfIx1/uxqdpq9kgQ31KmaJF8+ZtqT9NCWPn9IUHt17rWL
   zdh40SCs3VFq/xPa0M7IkhKEO1SWUTWtAxVYHsEYyjkfMaTHnhNDkDeDP
   Q==;
X-CSE-ConnectionGUID: ZRC3xVNJTmy7fofJ4x/CNg==
X-CSE-MsgGUID: GaChaJCjS7imRUrxAbmATQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="70378831"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="70378831"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:12:48 -0700
X-CSE-ConnectionGUID: /Dsv3KJ9RFKMuFCHey3PrA==
X-CSE-MsgGUID: RLOvTN9tQyaKMwkZOJOM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="138665936"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:12:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uAr88-00000002Djx-1TgK;
	Fri, 02 May 2025 17:12:44 +0300
Date: Fri, 2 May 2025 17:12:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: ds90ub9x3: Remove (explicitly) unused
 header
Message-ID: <aBTS3LdauGwF8olC@smile.fi.intel.com>
References: <20250331072507.3988372-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331072507.3988372-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 31, 2025 at 10:25:07AM +0300, Andy Shevchenko wrote:
> The fwnode.h is not supposed to be used by the drivers as it
> has the definitions for the core parts for different device
> property provider implementations. Drop it.
> 
> Note, that fwnode API for drivers is provided in property.h
> which is included here.

Any comments? Can it be applied?

-- 
With Best Regards,
Andy Shevchenko



