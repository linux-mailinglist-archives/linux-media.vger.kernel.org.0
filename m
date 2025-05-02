Return-Path: <linux-media+bounces-31595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D82AA748F
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 851D24C6DBD
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 14:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0722256C64;
	Fri,  2 May 2025 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBVRzCkz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CBB2566D4;
	Fri,  2 May 2025 14:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195110; cv=none; b=ujz8NX7CpjHrzUNUb348P0zHaD1BoVnpcn/6Ak5bEHf8pg0ygZs3MGe9XgmvGRrhEIheYVMPu0GM2sGiDTcCxtcayehC+VgD1ufN8qz5nBdj1zSJLGdlIQeHbNbNcRHLKT/sRZEgaTQ55m4mTXOa07sZiDGUw8crCS0vnnlLLp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195110; c=relaxed/simple;
	bh=YX5K9W8SlvAErcT4KDiQHr82LNYtHxZsOutAoTNilCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCM3HNJ1cQFdh/8OOHue3s6opImpW4xkxTnBgfas2l2Ym2a/StZNDMfS3wUloFRLykTOneurf2guU+RzpXTtTf53Ite4/GkPtPIfGqqcUYH/OPp6YAFrIKsJRxqQf+Mitl9XwCdgDRyYXXZ6PyDip9bpHks+6r9bAOPiYekEKlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBVRzCkz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746195109; x=1777731109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YX5K9W8SlvAErcT4KDiQHr82LNYtHxZsOutAoTNilCI=;
  b=ZBVRzCkzXlDK/XxjSxBtpC2Sq9ganRW5vVhiCMva1b2JE2tDUiu3bD+A
   Tr7gqkLsONFvJJbzxM5EWrtJEWLN3ZDrcD7HhjAonrXrFXleRxCvrTjeH
   j/Q5S5IvDX0LTiT+kNv0zHFHcoLjs9T4jKBexwGO7llwI0mVJtmyIeaeV
   bmZbrFARFOQsQ7IF7pWhaYcIryVEtYIJmCqFcl49bAUy+oJKpP0k//beL
   Gah2Q/wyVHPA+JXDMh0kTBTnznTxRgM6GymKUC4LcbbYGVKyEM+v+dIZg
   e+qZudpNmjKPyk2XMyNl41IRVI4ZGYnfxmvIxQlKOVzAc7ol30YbUGIVe
   g==;
X-CSE-ConnectionGUID: U1OJjRSNTcSN5mMlzNDSxQ==
X-CSE-MsgGUID: DfFvpW4kSYyN+QiZfznVLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48019979"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="48019979"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:11:48 -0700
X-CSE-ConnectionGUID: O2cAMrm+RmStsBngfky0Cg==
X-CSE-MsgGUID: S5bc+TXhSame8+YbhwCHSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135608569"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:11:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uAr79-00000002Did-0njo;
	Fri, 02 May 2025 17:11:43 +0300
Date: Fri, 2 May 2025 17:11:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH v1 1/1] media: raspberrypi: rp1-cfe: Remove (explicitly)
 unused header
Message-ID: <aBTSnv5buH7AZp1X@smile.fi.intel.com>
References: <20250331072136.3987653-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331072136.3987653-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 31, 2025 at 10:21:36AM +0300, Andy Shevchenko wrote:
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



