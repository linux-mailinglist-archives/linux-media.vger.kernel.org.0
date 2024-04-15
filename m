Return-Path: <linux-media+bounces-9402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D21018A5590
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 16:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DE812850A9
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4921571B4F;
	Mon, 15 Apr 2024 14:49:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF26D9445
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713192579; cv=none; b=qQpC1kcRrcibRlH0EICbBOHjZs4OpfShKj4XO3vypbMrauI+kurusOXIpLlPN5jLUABkOuVAQdhEWOeN7MJJyXEtLw2VOwMnLodJVATpY903h6rM6+CRbFVtkjA+zHDR1JcrRR+QuoQVePZxxOtlSrr2IExom9rh+h8/FSzt1eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713192579; c=relaxed/simple;
	bh=LB3OiqRpf56mFKzlXgFlx5VirktvKqOUmfIZAoSiEKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCKlCDSzJNUb6fPquMszzRLMXE2kT45t841soAy6Wkeuy/r/BI6z13SlzACaRWptZZI6mDfQTImiO7ZqBZegJxNKBhf+9E7zqioQkUQZE69R4bRgPDfDeaqSeOSpJBjU4CnBZXGg4TgmwwYagfJAcBduvxDEoEMudbWL26hv1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: csc22RwwSZSLzCSHHsoTxA==
X-CSE-MsgGUID: sSVdjrnFSo+4QN8jT4C6sA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12435158"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="12435158"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:49:39 -0700
X-CSE-ConnectionGUID: 4SCVR4ApSQ2eh8wXC5s10Q==
X-CSE-MsgGUID: phtDqWZiRxuutqvljPGitA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26353274"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:49:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rwNeH-00000004RAK-26HX;
	Mon, 15 Apr 2024 17:49:33 +0300
Date: Mon, 15 Apr 2024 17:49:33 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 13/23] media: atomisp: Drop the atomisp custom lm3554
 flash driver
Message-ID: <Zh0-fU8_iq_g5vR4@smile.fi.intel.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
 <20240415120220.219480-14-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415120220.219480-14-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 15, 2024 at 02:02:10PM +0200, Hans de Goede wrote:
> Drop the atomisp custom lm3554 flash driver, support for flash drivers
> using the custom atomisp flash interface is going to be removed from
> the atomisp driver.
> 
> If flash supports for the lm3554 turns out to be necessary on some
> atomisp devices in the future then this should be re-implemented
> using the new include/linux/led-class-flash.h APIs.
> 
> The atomisp specific lm3554 driver could still be usable as a reference
> for how to use / driver the lm3554 for a future re-implementation
> using standardized APIs, but for that it can be retrieved from
> the git history.

FYI: The driver is already there as drivers/leds/leds-lm355x.c.
It might still need the binding to v4l2 subsystem, but still...

-- 
With Best Regards,
Andy Shevchenko



