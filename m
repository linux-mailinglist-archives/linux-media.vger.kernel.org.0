Return-Path: <linux-media+bounces-59954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E8kNB3Q8WlrkgEAu9opvQ
	(envelope-from <linux-media+bounces-59954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:32:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C7E491EFD
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D6D630A71E8
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FDE3BFE52;
	Wed, 29 Apr 2026 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfYbwakY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275D82AD0C;
	Wed, 29 Apr 2026 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454951; cv=none; b=MJ5Ufe2KGg63yqOy8Ees80tNh1i3upY/5mduEk9hdhd7ePL2MKrwmYV5MANpP+f5R+vkEQkOSdqL9aFFmtVX36rdCERDuiHEX8qKq4Sz7IevV2iGxq+3oaioLaxsirOg9jay2aL6ZkyfFEdNgDuKXirJb2j79H/oDuuBvd4vy54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454951; c=relaxed/simple;
	bh=PwA/dIQ1S4C0Bm+GYG6/Xgq2X5RIQpNRX+vWxhaIdOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BosdWCt1pYsTD1LCDpXDC9bvwBjlWkPv8bIb0QoIpdzQclkShAz7n0iv+wVHgb81Ql6LIa5PQbQm3lPl49oTAUMvWx0SMIb4DFNJGyvpAfbzKyCeb9YaULbCo5RU3fBvUUPGV/WOYbfneQ+KlUBFmYtNsdxFM1KyHa7m5Dr3KDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WfYbwakY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777454949; x=1808990949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PwA/dIQ1S4C0Bm+GYG6/Xgq2X5RIQpNRX+vWxhaIdOY=;
  b=WfYbwakYt06zu/wj0jV47Ew04sMPyI6Q7HjFWkdAasQFXwRdIYbMIawv
   iz/3v/3SXTkUWPskJvoVW+jnqG94vVhP/Jh7Z1BLnVWe6sIUBOZzR+/yl
   I670R5rE8lAAHDl69iHtGbyRqk3EupyUkq+Ya7ip6tI9EbZMCuglfEy5n
   6BIpUE1/hH35o1bex0UniY/waZSmNThc5P/3CPOpElPNxWJW2zUPUkQHc
   j7GQWtXR40NOiG5UbSqcU0u1S9EcPeIcgY1f/wrRm+cUKE4VfjM/6tsQK
   mnHgpC9XJTqZ6PtydevGKICiWIqbUUWbvpqni24gkIVYjXwbvibRB50FO
   Q==;
X-CSE-ConnectionGUID: W1rsF8/lR7qX6n4m/nyDVA==
X-CSE-MsgGUID: 6gcJvvwCQ/ao5T0G4kp3HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="101040723"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="101040723"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 02:29:06 -0700
X-CSE-ConnectionGUID: QSI1p0v5Rg+sxNgCHIbK1g==
X-CSE-MsgGUID: UqdRgJjZSfqDqOiFBtyWrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="239212575"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2026 02:29:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5581E95; Wed, 29 Apr 2026 11:29:02 +0200 (CEST)
Date: Wed, 29 Apr 2026 11:29:02 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, lee@kernel.org,
	djrscally@gmail.com, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net
Subject: Re: [PATCH 1/5] platform/x86: intel_lpss: add resource conflict
 quirk for Dell Latitude 5285
Message-ID: <afHPXtLRGxgJ59al@black.igk.intel.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
 <20260320000937.9177-2-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320000937.9177-2-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Queue-Id: 62C7E491EFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59954-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]

On Thu, Mar 19, 2026 at 05:09:29PM -0700, Thierry Chatard wrote:
> The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> and the I2C4 controller (INT3446) both claim the same MMIO region via the
> shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> with -EBUSY, preventing the front camera (OV5670) sensor from being
> registered.

> Add a DMI quirk that selects IGNORE_RESOURCE_CONFLICTS for INT3446 on this
> machine, matching the existing pattern used by other LPSS quirks.

Was there any new version? In any case keep me in Cc list for at lease Intel
LPSS parts.

...

>  #include <linux/ioport.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>

Keep that in order.

>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/platform_device.h>

...

> +/* Same as spt_i2c_info but with QUIRK_IGNORE_RESOURCE_CONFLICTS for Dell 5285
> + * where ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources.
> + */

/*
 * Multi-line comments have to follow the
 * style as in this example.
 */

> +static const struct intel_lpss_platform_info spt_i2c_info_ignore_conflicts = {
> +	.clk_rate = 120000000,
> +	.swnode = &spt_i2c_node,
> +	.quirks = QUIRK_IGNORE_RESOURCE_CONFLICTS,
> +};

No, please just add a quirk into .driver_data of DMI below.

...

> +	/* Apply IGNORE_RESOURCE_CONFLICTS for I2C4 on Dell Latitude 5285.
> +	 * The ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources
> +	 * due to a BIOS bug where both use the same SB04 variable.
> +	 */

See about multi-line comment style above.

> +	if (data == &spt_i2c_info &&
> +	    acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev), "INT3446", NULL) &&
> +	    dmi_check_system(dell5285_lpss_dmi)) {
> +		dev_info(&pdev->dev, "Dell 5285: applying IGNORE_RESOURCE_CONFLICTS for I2C4\n");
> +		data = &spt_i2c_info_ignore_conflicts;
> +	}

No, just take a quirk and apply it after we dup the info,

>  	info = devm_kmemdup(&pdev->dev, data, sizeof(*info), GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;

Somewhere here against 'info'. See how PCI counterpart does.

And better is to create ACPI ID table for that (as we do for PCI case) and use
it as a matching material. So, something like

	if (DMI matches) {
		struct acpi_device_id *id; // maybe even const, don't remember

		id = match_acpi_ID();
		if (id)
			info->quirks = assign the quirk.
	}

-- 
With Best Regards,
Andy Shevchenko




