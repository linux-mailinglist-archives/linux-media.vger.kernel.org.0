Return-Path: <linux-media+bounces-31597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1562AA749A
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCB7B1C008F6
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 14:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122752561AD;
	Fri,  2 May 2025 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQLY50If"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A46723C4EB;
	Fri,  2 May 2025 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195193; cv=none; b=QwTYsG35Y6SekE5xT1lE2QSUDigP1JZpsy6rbApDQG6OXWpIQu/nI5z6/eADkc4QKIMLrle7BuknudK8z2zsLrvzaJ0jIYiGosk6CJyEkoYsHBdRphqs3i29lPmyLg+iK938h2sEMjfa5gYNzCyfMPHdA8+j593naEcp0pXPfks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195193; c=relaxed/simple;
	bh=dVs4ltJoCtIAEVVz84WCen8X4vslP/OCzf9IC+0afMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bA75yb9T1eIx+wbOhtvPbMIEwIWJlpV6Hocank/3LvG87S2CIrGsZEp7MCHK8PgYgN4s2ZEN0K/uE0YF1Ts5S+GLcB7WvPyzaCSFbIq/61b9rp2XFKM25KE30rKDnG1ldcKIEWdAsjk+dqr2kUespeexYjQCAlaD4mAuLZjHEyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQLY50If; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746195192; x=1777731192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dVs4ltJoCtIAEVVz84WCen8X4vslP/OCzf9IC+0afMs=;
  b=JQLY50If1cnaEGX6UlynCA/1PIOgLJqjRrnWuXv06QPupbTev3gJsu0k
   gP6J18HURnKhrAUpO0b+GqWdNiDF5yiZmBfHbO24HX/MTR0PeOWlTe6HX
   jhagh8d3iAbN2Ebn64DU8bYH5uWWdfr/YgOE4DSt7XASc+EdRFB3SrALM
   OMQMzUoNbgaAaRXdVdQ3VWFiyCNUDrBM087YS3XoRtxQMBRmQe2qsWqnm
   arIr4GxMbil9Xb/C9YUpGYRvfaZsvxWxo+a4FkmlDa8engah+1TtI44K7
   PUaMRuvLh+8sojeq8YWbLera5+xK1CNHwhwFZ1kWM9cMFPds0RfMkAzXe
   Q==;
X-CSE-ConnectionGUID: 0+IcI/8YQv2PS6Ter27OyA==
X-CSE-MsgGUID: nI2k25yVQMqznbIJ+RCpFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58084933"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58084933"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:13:12 -0700
X-CSE-ConnectionGUID: QBWpa4cTQoSagQr+f7F9yQ==
X-CSE-MsgGUID: /yCbOVtlTfabdfHyyMgAhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135161439"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:13:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uAr8V-00000002DkT-11As;
	Fri, 02 May 2025 17:13:07 +0300
Date: Fri, 2 May 2025 17:13:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: max9671x: Remove (explicitly) unused
 header
Message-ID: <aBTS81QnCop_hJ9W@smile.fi.intel.com>
References: <20250331072707.3988687-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331072707.3988687-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 31, 2025 at 10:27:07AM +0300, Andy Shevchenko wrote:
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



