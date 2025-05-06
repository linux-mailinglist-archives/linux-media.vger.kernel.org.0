Return-Path: <linux-media+bounces-31859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3CAAC8C7
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 16:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A083F9823B1
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E41E2836AF;
	Tue,  6 May 2025 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kar5t9hi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0DC283151
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746543197; cv=none; b=NgHMTJPdTiyKSUlTNrxiCf8NMwIbX6GFWoFdob07tsqq3MqEN7Zmd2Z0II7Oj3byxLiq7Qz/n7MP41nBoy8Ve4DYj+slLNX/oTtQDgSYqCPaUlrIgmiLkDBlQUX/uttt8rOJPOeHn2ZtsGWeRkC8OeVufRmif7yvde9EzQEfjm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746543197; c=relaxed/simple;
	bh=rnDtb615JAwfUM0GvdqLsYCVpu9PwlLDH5+KzeG02XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSq7Th6AgSqdrJokAE+MswuNJSBf/flJ9vltd0MOSFx3+V37mAxbZj4TutsZX/jWNSvljMzb5If5k0bs3C8Nkn2LUmqtCv/CZSIw9oYHwNQWU5wNvKqvEV0YZneExu0TluhSHzPj2Ca43NH3v3hy5lf5YM9thM0GjUDxVLCGbxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kar5t9hi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746543196; x=1778079196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rnDtb615JAwfUM0GvdqLsYCVpu9PwlLDH5+KzeG02XA=;
  b=kar5t9hiv2R3T2j2UMYcKoTuRe2gQ1SZ6AGpbZRLLbWtAWv4rzSeyGFt
   1z7qBAaH4UfPh09SkABiAH32A2IhsRLu3ymGyaOp7ArT16wiOiM1ucMeo
   fvK3kPoMzpCD8AQSMIe6Ri0avyZUSUtOC4swaJD0OvN/Kzvj6CJRXH6ld
   UDiSCbBxS5ZN8PLQ7xs3fTOXkWFAC0PyYi+NucPKmqiQRW2qjn+GaZuw1
   XuBB22cyqKDOi+2Z2wm2SjA+IIxXFp2yLRkm5e/m46+u1RLMlRo/v26S+
   hbu4g035iK5Qlb5c4PMSHK8hAzuiipQNEwJxzuNO3dYlDABORj9wgK2cN
   w==;
X-CSE-ConnectionGUID: ywPuUfVjQyub6ewDE6NSKw==
X-CSE-MsgGUID: ziVmH4seRMG5TAx5ELZsXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48123318"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="48123318"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 07:53:04 -0700
X-CSE-ConnectionGUID: ezdvabiURtCsKiS+wW6I3A==
X-CSE-MsgGUID: WzlwZHZXShOIGfy2DuO1Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135349005"
Received: from savramon-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.89])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 07:53:01 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A24A61201D8;
	Tue,  6 May 2025 17:52:54 +0300 (EEST)
Date: Tue, 6 May 2025 14:52:54 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ipu-bridge: Debug log link-number and
 lane-count from SSDB
Message-ID: <aBoiRpAkR_8Yhf_c@kekkonen.localdomain>
References: <20250506121843.250995-1-hdegoede@redhat.com>
 <20250506121843.250995-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506121843.250995-2-hdegoede@redhat.com>

Hi Hans,

Thanks for the set.

On Tue, May 06, 2025 at 02:18:43PM +0200, Hans de Goede wrote:
> Add a dev_dbg() call logging the link-number and lane-count from the SSDB.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index a12bc1676c81..e342492e8f3b 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -308,6 +308,8 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
>  		return -EINVAL;
>  	}
>  
> +	dev_dbg(ADEV_DEV(adev), "link %d lanes %d\n", ssdb.link, ssdb.lanes);

Do we need this? The V4L2 fwnode framework prints this, as well as other
related information.

> +
>  	sensor->link = ssdb.link;
>  	sensor->lanes = ssdb.lanes;
>  	sensor->mclkspeed = ssdb.mclkspeed;

-- 
Regards,

Sakari Ailus

