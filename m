Return-Path: <linux-media+bounces-57867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK5EDS4DzWmSZQYAu9opvQ
	(envelope-from <linux-media+bounces-57867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:36:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A8379922
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 13:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08385306ADA3
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 11:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68953E0C44;
	Wed,  1 Apr 2026 11:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cb38F6uk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C1B375ADF;
	Wed,  1 Apr 2026 11:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042898; cv=none; b=Zd99/amEagqqvm0JG/KNqWrueUYPBplsMZe5AmFC4lOsnELl4sEj9TE0wcOdHINrHg5G4hte1jhPEjxj1yA87sTySgVLha6eIbNkbb2nvl3+zNWo00enmwGEuxYjsih35L7+GwOKAQvOpapkawU+Wc1UsvDNQSScBA1T2Evgs6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042898; c=relaxed/simple;
	bh=B488BqTIOeJwl6zVePCpf2OvVSlVrzzJr95UEVo0X/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARWVdPUyCtdJBdlGbBkBVVeCdD9N32717xW7/9xvzMx22r12y0SfN1wRsnsvYXpfgw0I1I5Z++RqJ2qBsTVpb+bDq13ccNwF+V4c7CbMPkat7Mhi3TH2dhVDIWzNGGtwERQTy91brYEbZEpkm+X5CfmKwiuysd+x8Kw1hJ0w56Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cb38F6uk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775042897; x=1806578897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B488BqTIOeJwl6zVePCpf2OvVSlVrzzJr95UEVo0X/s=;
  b=Cb38F6uk8zHX4Q0Ek1i14RFXiJFBaWNI+hFw8IzJroZ3/VcpTn6aizMH
   oHEDkzBNOeN8a1KNFaCltwfjg+LqPKjhjho1xcj1OMLAkJmk32o6fNVfg
   Mwdm0JU0MdzPsTHzYXvXYZgduiWshyo9hI/rWcCHgJWJWYSszJspm3rZo
   Ld/cF5EgQbjoarGt/Ww63YE8p8Io8GtrwV3xouvVauQ0goGWPa+iM9tHR
   TCTLJwtR4UwRQsc76pxvSOJ0X204XlJEWgDXWHiSPkIucU5OhFGAug7Lc
   NuP0blrF/tRELB02lEXC7I5mWR8HMj5lDk1ShLvXcxoiIXSVFDb7YSUDe
   Q==;
X-CSE-ConnectionGUID: HHuRmg1YS1+YLzPzoi8K8g==
X-CSE-MsgGUID: kL/6iOddQ/uAY0BU46ZeYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86380399"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="86380399"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:28:17 -0700
X-CSE-ConnectionGUID: F85XJDgNSo+/9prZBWzwaA==
X-CSE-MsgGUID: udC60o6gRbeKBT10IHPR2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226512720"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.203])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:28:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 89D2E120AAD;
	Wed, 01 Apr 2026 14:28:23 +0300 (EEST)
Date: Wed, 1 Apr 2026 14:28:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] media: intel/ipu6: Improve DWC PHY HSFREQRANGE band
 selection for overlapping ranges
Message-ID: <ac0BVwO4XGhzcMu3@kekkonen.localdomain>
References: <20260323154037.1404865-1-mnencia@kcore.it>
 <20260325093241.1441512-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325093241.1441512-1-mnencia@kcore.it>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57867-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: B01A8379922
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marco,

Thanks for the update.

On Wed, Mar 25, 2026 at 10:32:41AM +0100, Marco Nenciarini wrote:
> The get_hsfreq_by_mbps() function searches the freqranges[] table
> backward (from highest to lowest index). Because adjacent frequency
> bands overlap, a data rate that falls in the overlap region always
> lands on the higher-indexed band.
> 
> For data rates up to 1500 Mbps (index 42) every band uses
> osc_freq_target 335. Starting at index 43 (1461-1640 Mbps) the
> osc_freq_target drops to 208. A sensor running at 1498 Mbps sits in
> the overlap between index 42 (1414-1588, osc 335) and index 43
> (1461-1640, osc 208). The backward search picks index 43, programming
> the lower osc_freq_target of 208 instead of the optimal 335.
> 
> This causes DDL lock instability and CSI-2 CRC errors on affected
> configurations, such as the OmniVision OV08X40 sensor on Intel Arrow
> Lake platforms (Dell Pro Max 16).
> 
> Rewrite get_hsfreq_by_mbps() to select the optimal band:
> 
> 1. Prefer an exact default_mbps match (returned immediately).
> 2. Among bands whose min/max range covers the data rate, prefer
>    the one with the higher osc_freq_target.
> 3. If osc_freq_target is equal, prefer the band whose default_mbps
>    is closest to the requested rate.
> 
> For 1498 Mbps this now correctly selects index 42 (osc_freq_target
> 335, range 1414-1588) instead of index 43 (osc_freq_target 208,
> range 1461-1640).
> 
> Fixes: 1e7eeb301696 ("media: intel/ipu6: add the CSI2 DPHY implementation")
> Cc: stable@vger.kernel.org
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
> ---
> Changes in v2:
> - Rewrote get_hsfreq_by_mbps() with a proper selection algorithm instead
>   of patching after the call, as suggested by Sakari Ailus.
> - Added Fixes tag and Cc stable.
> 
>  .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  | 22 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
> index db28748..4c9e50c 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
> @@ -288,15 +288,27 @@ static const struct dwc_dphy_freq_range freqranges[DPHY_FREQ_RANGE_NUM] = {
>  
>  static u16 get_hsfreq_by_mbps(u32 mbps)
>  {
> -	unsigned int i = DPHY_FREQ_RANGE_NUM;
> +	int best = DPHY_FREQ_RANGE_INVALID_INDEX;

The function returns u16 and u16 is fine here, too...

> +	unsigned int i;
>  
> -	while (i--) {
> -		if (freqranges[i].default_mbps == mbps ||
> -		    (mbps >= freqranges[i].min && mbps <= freqranges[i].max))
> +	for (i = 0; i < DPHY_FREQ_RANGE_NUM; i++) {
> +		if (freqranges[i].default_mbps == mbps)
>  			return i;

Doesn't the condition below handle this already?

> +
> +		if (mbps < freqranges[i].min || mbps > freqranges[i].max)
> +			continue;

The frequencies in the array are consistently increasing so you can replace
this with:

		if (mbps < freqranges[i].min)
			continue;

		if (mbps > freqranges[i].max)
			break;

> +
> +		if (best == DPHY_FREQ_RANGE_INVALID_INDEX ||
> +		    freqranges[i].osc_freq_target >
> +		    freqranges[best].osc_freq_target ||
> +		    (freqranges[i].osc_freq_target ==
> +		     freqranges[best].osc_freq_target &&
> +		     abs((int)mbps - (int)freqranges[i].default_mbps) <
> +		     abs((int)mbps - (int)freqranges[best].default_mbps)))
> +			best = i;
>  	}
>  
> -	return DPHY_FREQ_RANGE_INVALID_INDEX;
> +	return best;
>  }
>  
>  static int ipu6_isys_dwc_phy_config(struct ipu6_isys *isys,

-- 
Kind regards,

Sakari Ailus

