Return-Path: <linux-media+bounces-31822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6C4AABCE3
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 10:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C08531BC3E25
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810D1241663;
	Tue,  6 May 2025 08:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpnZZB5y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00A623D295;
	Tue,  6 May 2025 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519321; cv=none; b=ZdOYjqONX4xpG0OPRyPWqYYDM3lAH4Um7rLKY+Gt+lcdjv2NEyEg9ArD89kDZIFQKI60v48tZGauXvMS/UcsxwkbJyP5rRJOPxPvDpXPoXBjp6WhzikjbCrPiioqQtAVYcC40A5loLcTB4PeHLNc9CS2c59f8WcKLc6harF9o3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519321; c=relaxed/simple;
	bh=rOvLY2UBX5VIVd+N+Q/F3fAiEXOo/Fm9hbn+UA/ZmeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNbuLTMNVuKIQ07ddK6g4sR2QDE3918et+3Shi6HUgCrSy0FEedlKObbiTE9DPAG1aXItbL25UBSun1jyGp62NCF4sBJLsQznnKa0fJsc4yeyIK2K3xyFrswyzjWHCg1ke458lW0P06FrpkcUbttpyt91iRKNRR36S/77DPQrNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpnZZB5y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746519320; x=1778055320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rOvLY2UBX5VIVd+N+Q/F3fAiEXOo/Fm9hbn+UA/ZmeU=;
  b=ZpnZZB5y9Wv9xC9Wm4Diz49QwO49PUeYWoutQM0rc6fYx7uCXbRoyiKN
   9ug0eAsVhoHrj06Cf19vaZJnUqTPUCGAYM5CzrQTv7cdnFwRYllSqaIKF
   3ymCaSFEgZBFr3uFjSwrYYGLRihWaPj9FJXmnJUjqiiQrRAvucAF7zT9f
   agSXxwovy/P88TvgepPPCZIN8GccvFUQ47a9mgQQKykPsp8/eyAQ8p7JU
   1vdRIBHk7wwh3+enjd7BKRYKACW/HoERnZWFY+a7a1uUW1tOpFyUBnDrG
   D39JgyOmzXzRF/zQwmTuiiveURMJYvLFET0/eg6xf+K4MO+/hrd6KewAb
   A==;
X-CSE-ConnectionGUID: PbGa6bhKQ/K5BYp9SNQGcw==
X-CSE-MsgGUID: qjsa8UM1TvK7VD1BnSs/9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="73571685"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="73571685"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 01:15:20 -0700
X-CSE-ConnectionGUID: 7Z9qjoEfStSILJ6gJBGPcg==
X-CSE-MsgGUID: EOPOD1WASyuhcqOAgw3PSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="158795600"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.165])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 01:15:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5A9EB122F00;
	Tue,  6 May 2025 10:45:24 +0300 (EEST)
Date: Tue, 6 May 2025 07:45:24 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Nirujogi, Pratap" <pnirujog@amd.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, dave.stevenson@raspberrypi.com, krzk@kernel.org,
	dan.carpenter@linaro.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
	grosikop@amd.com, king.li@amd.com, dantony@amd.com,
	Venkata Narendra Kumar Gutta <vengutta@amd.com>
Subject: Re: [PATCH v2] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <aBm-FEdHqERKj9Am@kekkonen.localdomain>
References: <MhUYQD7uWnfZQAPq7VslFWPHOmx2B2UfAIpbMhLq1-7GC_i5bI2hhns_-ov_AAVpEH_VmDDFYkS5aOKBwnY61g==@protonmail.internalid>
 <20250328214706.1516566-1-pratap.nirujogi@amd.com>
 <fef11ce6-b3b6-4677-9387-13332b9a9d43@linaro.org>
 <6ba024ef-4757-4db0-b12a-d56622329bb0@amd.com>
 <20250402012052.GG4845@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402012052.GG4845@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Apr 02, 2025 at 04:20:52AM +0300, Laurent Pinchart wrote:
> On Mon, Mar 31, 2025 at 03:17:22PM -0400, Nirujogi, Pratap wrote:
> > On 3/28/2025 9:18 PM, Bryan O'Donoghue wrote:
> > > On 28/03/2025 21:42, Pratap Nirujogi wrote:
> > >> From: Bin Du <Bin.Du@amd.com>
> > > 
> > >> +static const struct i2c_device_id ov05c10_id[] = {
> > >> +     {"ov05c10", 0 },
> > >> +     { }
> > >> +};
> > > 
> > > There's an IPU6/IPU7 version of this driver.
> > > 
> > > https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ 
> > > ov05c10.c
> > > 
> > > Perhaps you could import the Intel ACPI name contained in there too.
> > > 
> > sure, will add Intel ACPI names too in V3. To be specific, I'm going to 
> > add the below table in addition to the existing "struct i2c_device_id 
> > ov05c10_id[]" table:
> > 
> > static const struct acpi_device_id ov05c10_acpi_ids[] = {
> > 	{ "OVTI05C1" },
> > 	{}
> > };
> 
> You could drop the i2c_device_id table if you added an OF device ID
> table, but you'll need DT bindings for that. Sakari, any best practice
> rule in this area ?

I don't think there should be a need for an I²C ID in any case, having just
ACPI _HID is fine.

DT bindings would of course be a plus.

> 
> > >> +
> > >> +MODULE_DEVICE_TABLE(i2c, ov05c10_id);
> > >> +
> > >> +static struct i2c_driver ov05c10_i2c_driver = {
> > >> +     .driver = {
> > >> +             .name = DRV_NAME,
> > >> +             .pm = pm_ptr(&ov05c10_pm_ops),
> > >> +     },
> > >> +     .id_table = ov05c10_id,
> > >> +     .probe = ov05c10_probe,
> > >> +     .remove = ov05c10_remove,
> > >> +};
> > >> +
> > >> +module_i2c_driver(ov05c10_i2c_driver);
> > >> +
> > >> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> > >> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
> > >> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
> > >> +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
> > >> +MODULE_LICENSE("GPL v2");
> > > 
> > > Why v2 ? Checkpatch will complain about v2 and BTW the IPU6 driver above
> > > is GPL not GPL v2.
> > 
> > sure, will replace "GPL v2" with "GPL" in V3.
> 

-- 
Regards,

Sakari Ailus

