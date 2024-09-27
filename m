Return-Path: <linux-media+bounces-18677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C78E9881E4
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 11:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 848521C22121
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 09:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E13E1BAEF6;
	Fri, 27 Sep 2024 09:54:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51827189BAF;
	Fri, 27 Sep 2024 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430854; cv=none; b=b6SX8DvQap8qA/z/wqGivQJxyvZa6nhwpIxZuAFWDl4T3QN2Cjuid9goaiFDh9SzW/Ic28dBlDzOsn9YyoJYgNeDZ3VHsbusbgdWxSOvBI3eMgRMIuhEHKWnw6SaVG7K2/S4Zp0aZlE4/pvFaInfDYcClh9zj74GpXPtAyC+JPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430854; c=relaxed/simple;
	bh=o4i7tXlhj3m5lyhUwDKJ887axGnsQjKGCpplffx923M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLsis7e1JrqpQcjTk3xOMCJ5APeBiI3/ebQtwIYgT2rA6wF9l0DGghcPg2qCzb+9A9nUNc49H9giih2Db5ktz3Qeo6ULddKgmVUvmpE1DPoRlZSxz8C4x9M7TBb2GMBmY1+hLlU16uHk1sx/89pMbCAsnZB5uqNTqszyyNUVZ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: tJdj6gb0RR6HJimoi9Etbg==
X-CSE-MsgGUID: bogGtCrZRfi5sOTyMPPYGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26077621"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26077621"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 02:54:12 -0700
X-CSE-ConnectionGUID: 4b1CI0ykTW6p7tP9m2xgZQ==
X-CSE-MsgGUID: FK/7O2QVR4y2pLTRxlf6xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="109977131"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 02:54:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1su7fq-0000000DWiZ-0oF7;
	Fri, 27 Sep 2024 12:54:06 +0300
Date: Fri, 27 Sep 2024 12:54:05 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Benoit Parrot <bparrot@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/3] media: atomisp: Use max() macros
Message-ID: <ZvaAvQrT1WYyXVCJ@smile.fi.intel.com>
References: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
 <20240927-cocci-6-12-v1-3-a318d4e6a19d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-cocci-6-12-v1-3-a318d4e6a19d@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 27, 2024 at 09:42:15AM +0000, Ricardo Ribalda wrote:
> The max() macro produce nicer code and also fixes the following cocci
> errors:
> 
> drivers/staging/media/atomisp/pci/sh_css_frac.h:40:17-18: WARNING opportunity for max()
> drivers/staging/media/atomisp/pci/sh_css_frac.h:50:17-18: WARNING opportunity for max()

In some (rare) cases it's a bad advice.
NAK.

...

> -	v >>= fit_shift > 0 ? fit_shift : 0;
> +	v >>= max(fit_shift, 0);

max() with 0 is a bit unusual, esp. taking into account that the operator here
is a right shift. So, what we check here is the signedness of the value to
avoid not only potentially wrong calculations, but also UB. The original code
is clearer for all this.

-- 
With Best Regards,
Andy Shevchenko



