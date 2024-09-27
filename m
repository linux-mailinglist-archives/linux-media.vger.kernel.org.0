Return-Path: <linux-media+bounces-18678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBD49881F9
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 11:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB619284EF0
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1261BB693;
	Fri, 27 Sep 2024 09:55:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18831BB686;
	Fri, 27 Sep 2024 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430920; cv=none; b=EIboBUyfZDW2R22VRkUy9Y7xDVvo2A00bIs3bJv/c6t2I9IC5qf6TCZq6tf9kizRapHIuRGnGbq1LWyRGtGKIBoVZpADxPqc40e3CejZ+MPj6gDuJ43uzjb2tLE8Wx0+kKchUWlBJJHKWJR8uEA8lKlY1ng2eKxSupK1JyPA6fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430920; c=relaxed/simple;
	bh=KAp6XjCIP6zDphLDxq3LO8gnMmD28PZPgrCDozB+hYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOxoPyiaM/V1jcmAkJ789fZM/sOTbQMCCSMizxQrjXFo2LUzMB5sWcXLeDgGFEg7VNcKGkkym+8lFdCcRvQiFn6Aeb8DGXiMavGeoXQuq2Q/2iWGFYfMNnjheHaPDNSxy4eOnp+CzEjLT0F+4OTC4d/NELQY4MGZ6Y4tutsZrmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: dusUXUjiQ72/G/aCtt1uCg==
X-CSE-MsgGUID: f+2MnhxeT4uojQfZUhD0ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26700081"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26700081"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 02:55:19 -0700
X-CSE-ConnectionGUID: J6Ogjxj+TAyMfiwjvjKw1g==
X-CSE-MsgGUID: GJADOoM2SM6RcbSQ0XYBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72801456"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 02:55:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1su7gu-0000000DWje-3daf;
	Fri, 27 Sep 2024 12:55:12 +0300
Date: Fri, 27 Sep 2024 12:55:12 +0300
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
Subject: Re: [PATCH 2/3] staging: media: ipu3:Use str_down_up()
Message-ID: <ZvaBALTEniRxm3X6@smile.fi.intel.com>
References: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
 <20240927-cocci-6-12-v1-2-a318d4e6a19d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-cocci-6-12-v1-2-a318d4e6a19d@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 27, 2024 at 09:42:14AM +0000, Ricardo Ribalda wrote:
> The str_down_up() helper simplifies the code and fixes the following cocci
> warning:
> 
> drivers/staging/media/ipu3/ipu3-css.c:229:18-47: opportunity for str_down_up(state & IMGU_STATE_POWER_DOWN)

With a space after the colon in the subject it seems fine to me,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



