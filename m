Return-Path: <linux-media+bounces-31820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C720FAABCD7
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 10:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39ACC4686DB
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A9523A57F;
	Tue,  6 May 2025 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6PD2O8X"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90A1A23A9
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519316; cv=none; b=BfDr/DBOOxblTnEB0tix1CkmrAsmVgsvyrnDBUn0YTIs0M5A0QGgIucyy5cDkHKZsoiqVos2t7yp1nQJqy0LwLSjtE/ivjvBIUToun0mHplupFPiN4UNgI7GPQO8JuOjkcJoqvRDt+gOjkNe6XfClBseGE/hJR0rPLc5psyoUuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519316; c=relaxed/simple;
	bh=3ys+3c0fj7v9QvwFCSCuBROH1PapqpfrVjbAB1GF3wA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTc97w90rJIhNWCEwp2zLx+ktmLe2tc48BjhLMjJg3dalUchfJaXLavA2VjPEaoRFGopp2OFu/Wm+lNSVWwf9iKOkk1WmQGSKi+EsEbNzJ6tmibFwUYCqRPRNVCXrhaYuhOnj74Qn7r0JcjRakV+UQI7ww4EknMbhvy3Gc4ZSxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6PD2O8X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746519315; x=1778055315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3ys+3c0fj7v9QvwFCSCuBROH1PapqpfrVjbAB1GF3wA=;
  b=h6PD2O8XkZGSus/+MOKjfO3E2GEnhoRavvuuToGwD7hfpP1xJJo+hKmL
   00e4dW4Y6fXIRiqMqtwErXmIqnp4BgByTD+NfcCk1wCpzMy57tIaE6jDM
   HD35BdndlEodqMsNwlVuL7Ye9AudYGJDA7cPOpHoS1OEoPG06B4lUWFzf
   XytH7WdABTcpdlj0hDmwXjqrrymDcG4SGaYc2aW+aE8HWVA/G/1ILTenV
   BCLYgytIqDSqq1Imxa0AI5PicxRS7kOQD5lo+Kw41rJ4sfJSYT+VTwV8C
   YhKnGkkNc/XXt0mToocLPDoEwhXlILrtgXYVxkMOlM3bfLpvfzmNIX9Fl
   g==;
X-CSE-ConnectionGUID: Bc/mJ6ROR52BjrrpQxIYwg==
X-CSE-MsgGUID: BpEFq+/kS9ib6l9QnDyb2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="73571672"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="73571672"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 01:15:14 -0700
X-CSE-ConnectionGUID: Y99nBMEHSBm86FTbUVO/5w==
X-CSE-MsgGUID: OucE/+QgSUCZdJ6nNyOEjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="158795590"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.165])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 01:15:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6A7751205A2;
	Tue,  6 May 2025 09:26:32 +0300 (EEST)
Date: Tue, 6 May 2025 06:26:32 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"Cao, Bingbu" <bingbu.cao@intel.com>
Subject: Re: [PATCH 1/1] media: lt6911uxe: Depend on I2C
Message-ID: <aBmrmFA2uS7OTxVk@kekkonen.localdomain>
References: <20250505110054.8538-1-sakari.ailus@linux.intel.com>
 <BL3PR11MB6410C2CF8DAD915E2F60EBC2F2892@BL3PR11MB6410.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR11MB6410C2CF8DAD915E2F60EBC2F2892@BL3PR11MB6410.namprd11.prod.outlook.com>

Hi Dongcheng,

On Tue, May 06, 2025 at 04:14:58AM +0000, Yan, Dongcheng wrote:
> Hi Sakari,
> 
> <herkuil@xs4all.nl> and <arnd@arndb.de> had submitted fix patches. And I
> saw it has merged into linux-next:
> <https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/media/i2c/Kconfig><https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/media/i2c/Kconfig>

You probably meant <20250314154738.3983798-1-arnd@kernel.org> on LMML? Yes,
indeed. I'll drop the two patches related to this from my tree.

-- 
Regards,

Sakari Ailus

