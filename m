Return-Path: <linux-media+bounces-59641-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJutLJgV72kQ6AAAu9opvQ
	(envelope-from <linux-media+bounces-59641-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 09:51:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAFA46E9DE
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 09:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F29B301AA90
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 07:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75E939890C;
	Mon, 27 Apr 2026 07:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZ8JAzSS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05281370D7B;
	Mon, 27 Apr 2026 07:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276183; cv=none; b=rzG1P7H2AlQWiCFXpaBOc1S/61qcgNSwjrwA1ypUdbjpN/f0hO/u4XrcoNewSu7EQ3EwfJYuF9Mfrk/NmWC2oqx1nX1xLgsXF6Lm/k4xa6iMFnVplUGWf24IsrFTdKV01Y0cVv0pOHxWmtgvQEi+lgk1IJ8Fr9U85fBG0dvchJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276183; c=relaxed/simple;
	bh=i2XRBvS6+5Xwy4IqI0Sq5xh6D+17G9kWSA0mOXCMHqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5Rb0AIjAeUfAiEStIE673ebUDbfIjxwWstpoWo3gG2txVT+Neix6oIB/25Amzo/fiOoied5L71jsZMUPdpXAQE5Jf4v5u03C4wbDAoR434X2xLadyYR7jQliqm7hKK8GXZkPdKxfXLwOhgiTOqF1liURa4U1gkT+6OItO2LUGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZ8JAzSS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777276182; x=1808812182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i2XRBvS6+5Xwy4IqI0Sq5xh6D+17G9kWSA0mOXCMHqk=;
  b=iZ8JAzSSgWJhfKmPXGPrmwjGYRjbR5b1lh/+lXtz5vePUTVvp8axHInX
   nOv5Qstmw3M+wTjWyXwP5JrweRhEIPj3WeKrCkFl/FMbDF/WufuhUiYxW
   +jEV72jWIve9IVU5GVCzDhftUNEBb5o6a8aPoF5DIZ68yBXT6jgqNGFju
   oygx7GclpL67g4+7UWk5whc3SlnOpye+VsOpsh+eNxPfZ95Og3PBDltzt
   3wcAJuolpGzsFMIXL75yWAwrr9uFMX/2s220DGX5JW6sBfzAy7xefJREl
   VheWr4z4EgTq74LXxJ/Oz5Ej3r73+BmL+XXEJwYEGeUTX/CGYdWFb4mWJ
   A==;
X-CSE-ConnectionGUID: CfNUC+T8QfaUn/c4PBU7+g==
X-CSE-MsgGUID: Y7yBsM/zS/GOtr42v9DDDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="81765419"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="81765419"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:49:42 -0700
X-CSE-ConnectionGUID: OkZb9R8BTfyQflaMv4xSJg==
X-CSE-MsgGUID: vbRLpDI3QIqQJo/1UbP7jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="232684477"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:49:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5C3F811FA44;
	Mon, 27 Apr 2026 10:49:43 +0300 (EEST)
Date: Mon, 27 Apr 2026 10:49:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net
Subject: Re: [PATCH v6 5/5] media: ov8858: add ACPI device ID INT3477
Message-ID: <ae8VF7vMg4BkA4BJ@kekkonen.localdomain>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425163145.8474-1-tchatard@gmail.com>
 <20260425163145.8474-6-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425163145.8474-6-tchatard@gmail.com>
X-Rspamd-Queue-Id: 1DAFA46E9DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59641-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]

Hi Thierry,

On Sat, Apr 25, 2026 at 09:31:45AM -0700, Thierry Chatard wrote:
> The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
> Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
> INT3477 to the ACPI match table so the driver binds when instantiated by
> ipu_bridge.
> 
> The supply names are reordered to dvdd before dovdd so that core power is
> stable before the I2C passthrough opens (on this platform dovdd maps to
> the VSIO/S_I2C_CTL regulator, which gates I2C access to the sensor).
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> ---
>  drivers/media/i2c/ov8858.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> index 3f45f7fab..a1fa0be52 100644
> --- a/drivers/media/i2c/ov8858.c
> +++ b/drivers/media/i2c/ov8858.c
> @@ -79,8 +79,8 @@
>  
>  static const char * const ov8858_supply_names[] = {
>  	"avdd",		/* Analog power */
> -	"dovdd",	/* Digital I/O power */
>  	"dvdd",		/* Digital core power */
> +	"dovdd",	/* Digital I/O power */

I'd still like to understand why.

>  };
>  
>  struct regval {
> @@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, ov8858_of_match);
>  
> +static const struct acpi_device_id ov8858_acpi_ids[] = {
> +	{ "INT3477" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
> +
>  static struct i2c_driver ov8858_i2c_driver = {
>  	.driver = {
>  		.name = "ov8858",
>  		.pm = &ov8858_pm_ops,
>  		.of_match_table = ov8858_of_match,
> +		.acpi_match_table = ov8858_acpi_ids,
>  	},
>  	.probe		= ov8858_probe,
>  	.remove		= ov8858_remove,

-- 
Regards,

Sakari Ailus

