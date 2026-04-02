Return-Path: <linux-media+bounces-57933-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACWoHlEwzmnIlQYAu9opvQ
	(envelope-from <linux-media+bounces-57933-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 11:01:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F51386696
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 11:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCAC9308F8F9
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 08:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF873C65FC;
	Thu,  2 Apr 2026 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmhanAuM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADA428E0;
	Thu,  2 Apr 2026 08:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120068; cv=none; b=dqgHhzXxNSeXu96hBWDaZkP9FWY8qv4qtrxfOohlwRmTKVyV3A81ugtQoZaPPztzVroEqr0OA/Hs/Gvl/EekQ/ePq2ifbqs4UStXAndHBxZ65CyIUtwyPbvXtqvmWgAH+CAJJ+GcrS35Xnh/ZXg/liBaaAL++tt79i+tveFyf+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120068; c=relaxed/simple;
	bh=NrSQJqwtFro87ZPC6MO5kXmLJTUgcW7H0ijYylxDe6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5w9A77j5FK2p7iz+T7i8e07R9lCPWxmlknDdN5E4HDmbz75wx79Cx0LLYKnVzLJouQCyVHJanM0MuuTUd/oAKAbUN47Zm+KmiKDiVpuU6j2LgN5L6DonI1Ucus6VXnfjNRGXXcOkBExZyNkWJEmr8yFJ1xeswg7ZKLStb9xvG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmhanAuM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775120067; x=1806656067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NrSQJqwtFro87ZPC6MO5kXmLJTUgcW7H0ijYylxDe6I=;
  b=SmhanAuMHXA90tEOBHwguungP5bD1j2dB2CyPFeVexf81M2RWMEyVTrA
   +EgdyZtharmWqH+9VjoOkFIIcYrxh+WfbdWxCiOo7tbD4Xi4TswrvUgRM
   vsGllYYgmYNm9dv+uw+hgVHgwI2tCd7FhXy9F2/J19lhKJbg43e7GNwWQ
   Q4hgOdbw72rSe9HVPhSCUbE5AwkMubN7MGfRtBjOLPxpcjeLOy7058HXQ
   dvLS0Kv1mVKN8TiQ6yQEUc6qJqsVcawreYKFDmDLNpmp8lYApN3tXM6ED
   ccRFXl97H8BUOrWWAGrlIFuVYeQs5IXvaAtf6LIIP7bbtKNVTeP2Y0qnp
   g==;
X-CSE-ConnectionGUID: rQ9t+SHuRg2gUsyESQscMQ==
X-CSE-MsgGUID: +LbS83mhRoaFsfQqfR252A==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76055019"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="76055019"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 01:54:26 -0700
X-CSE-ConnectionGUID: LyrFHE+uRECF6x9ByYzfRg==
X-CSE-MsgGUID: mTjTOEKDQx27FR4wipL+7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="226084732"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 01:54:23 -0700
Date: Thu, 2 Apr 2026 11:54:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3] media: intel/ipu6: Improve DWC PHY HSFREQRANGE band
 selection for overlapping ranges
Message-ID: <ac4uvf_a-4-fLBPV@ashevche-desk.local>
References: <20260401162547.1597975-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401162547.1597975-1-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57933-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A8F51386696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 06:25:47PM +0200, Marco Nenciarini wrote:
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
> 1. Among bands whose min/max range covers the data rate, prefer
>    the one with the higher osc_freq_target.
> 2. If osc_freq_target is equal, prefer the band whose default_mbps
>    is closest to the requested rate.
> 
> Since the frequency ranges are monotonically increasing, the loop
> exits early once min exceeds the requested rate.
> 
> For 1498 Mbps this now correctly selects index 42 (osc_freq_target
> 335, range 1414-1588) instead of index 43 (osc_freq_target 208,
> range 1461-1640).

Below just a couple of remarks, no need to be addressed, JFYI.

...

>  static u16 get_hsfreq_by_mbps(u32 mbps)
>  {
> -	unsigned int i = DPHY_FREQ_RANGE_NUM;
> -
> -	while (i--) {
> -		if (freqranges[i].default_mbps == mbps ||
> -		    (mbps >= freqranges[i].min && mbps <= freqranges[i].max))
> -			return i;
> +	u16 best = DPHY_FREQ_RANGE_INVALID_INDEX;
> +	unsigned int i;
> +
> +	for (i = 0; i < DPHY_FREQ_RANGE_NUM; i++) {
> +		if (mbps > freqranges[i].max)
> +			continue;
> +
> +		if (mbps < freqranges[i].min)
> +			break;

Wondering if this can use bsearch() algo or any linear ranges.

> +		if (best == DPHY_FREQ_RANGE_INVALID_INDEX ||
> +		    freqranges[i].osc_freq_target >
> +		    freqranges[best].osc_freq_target ||
> +		    (freqranges[i].osc_freq_target ==
> +		     freqranges[best].osc_freq_target &&
> +		     abs((int)mbps - (int)freqranges[i].default_mbps) <
> +		     abs((int)mbps - (int)freqranges[best].default_mbps)))

Note, abs(INT_MIN) is UB, I hope this won't be the case IRL in this code.

> +			best = i;
>  	}
>  
> -	return DPHY_FREQ_RANGE_INVALID_INDEX;
> +	return best;
>  }

-- 
With Best Regards,
Andy Shevchenko



