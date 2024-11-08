Return-Path: <linux-media+bounces-21184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 778FF9C2211
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 17:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EDA81F2309A
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 16:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF29192D82;
	Fri,  8 Nov 2024 16:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TY9Ce4x4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F062187FE4;
	Fri,  8 Nov 2024 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731083291; cv=none; b=IsV1Yz8RZ2FpdDWUKrfBbjqf2yqpLQwJOj0qV88VrjVv8SE4gCptdu8TAj9Dsfm8mjABTs4xHciKcGM7UhqefQEI3NzwedFurHMVR7c00GIQOGcO1HyWG7XML0GkKbr137SsoXw2f6U4BicRT8EiGQi6UFMfw6VR49kWX1HKX3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731083291; c=relaxed/simple;
	bh=n8tm2gJmeKyAAvctEfOsHH00KUPraNzZrZa5aQ6jqPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEmdY6wbmgbZ0gQL4Tvce8OBGub65EW02tHftQiwoQfqFuYNhM89FHdmDt4WHgS+rn1El5mZf/nqu2t2ajYLKFDm47dSc/nmGrja7NSbJ/twx8TBw2xt7OYZ4UxY5yv7Tx+c0rWaEQmdGEjU+lIbl9YB91aQbPIt2wuScX9v9N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TY9Ce4x4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731083290; x=1762619290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n8tm2gJmeKyAAvctEfOsHH00KUPraNzZrZa5aQ6jqPg=;
  b=TY9Ce4x4TgFtAcxwgZC/N2zB7cVK9/XkWbk+9+TkpMhc324v0w+L61bu
   7z6iRtKB/UtxfIFCPNz0Nf4J9Y/O+q8Zkht03lx+iJEVgJSYysBH4Z5Vu
   PHJskqpjh1ehlhrFDsvZ/oORpGULMykokwt4hPtEsXmzWQhQLZ/lFoc8g
   kHdQ0EOxAzZ7nfJfdA+tqMH1guum7lUDpHia4L1F5N5vqf8HlpyOex4S2
   m6kgZC/eBf6hFyhGNjfbXOsnOtCZwEP6omTT4YxlYOR7KGS+HO50YQAQ5
   6h4VKipFzef0nd3ejkTaGK1mxgzbj0shW2EIB3VsokM8TgnzP1G6cYzS3
   Q==;
X-CSE-ConnectionGUID: F1X7ZZwMSaCnUzhTpYiFRA==
X-CSE-MsgGUID: NckcjHjPScqwcbQZ8U2vtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53534112"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53534112"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 08:28:09 -0800
X-CSE-ConnectionGUID: ILdFvIHaSXO+qW6BlO/aiw==
X-CSE-MsgGUID: tbjD+vfRTt28jWu9Wa1cvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="85619533"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 08:28:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9Rq9-0000000CfuL-2RPn;
	Fri, 08 Nov 2024 18:28:05 +0200
Date: Fri, 8 Nov 2024 18:28:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for
 OV7251
Message-ID: <Zy48Fc_nUceCs3PK@smile.fi.intel.com>
References: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
 <Zy43D7wAZLrBDtiX@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy43D7wAZLrBDtiX@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 08, 2024 at 04:06:39PM +0000, Sakari Ailus wrote:
> On Fri, Nov 08, 2024 at 04:50:24PM +0200, Andy Shevchenko wrote:
> > The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
> > Remap "reset" to "enable" and update polarity.
> > 
> > In particular, the Linux kernel can't load the camera sensor
> > driver on Microsoft Surface Book without this change:
> > 
> >  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
> >  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
> >  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
> >  ov7251 i2c-INT347E:00: cannot get enable gpio
> >  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2

...

> Should this be cc'd to stable? I guess it's not exactly a fix in the driver
> but a BIOS bug, but it can be worked around in the driver. :-)

It's everything, but a BIOS bug, it's DT bug and whoever first introduced that
GPIO in the driver. Even in the DT present in kernel the pin was referred as
CAM_RST_N, which is exactly how this patch names it.

OTOH it's a fix to the driver that never worked for ACPI case, so there never
was a regression to fix.

-- 
With Best Regards,
Andy Shevchenko



