Return-Path: <linux-media+bounces-56829-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOu6ALVSwmnNbgQAu9opvQ
	(envelope-from <linux-media+bounces-56829-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:00:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EF630530C
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CCEE304101A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A883AEF37;
	Tue, 24 Mar 2026 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTIT3X4a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E138AC95
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774342536; cv=none; b=TWWH5dUkvgYxIQ5OjEJcd7NsWeSfHBcOOOwKMlKoJqu47NlO8eEqiCs3dezFjensiT4MHFBJrk3sJ41cL8TQO8DL47NrXtsE1j3a/1+YsXQchuxn5bjW1x64ih0wFrxgfNP5d4c3AHl8vG4y8WE2Hd1aTYGfmStT8hC8+uROxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774342536; c=relaxed/simple;
	bh=0FsB03PyLBqucgBmNur3XoB6ZROWg++oSpNPK13R5Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXNzdZWjPqdqdr4qN9C/u9IEr1lSZEeC6gOQuOjYKYfLGfv+v4IF8rzVGOnel6t3KdrMrOXJxBLyrMOhDRxL54jwmATNkEzfil87FeOkm17MRfgEbHkWwyEz40ZDWiuS/nlrqnq9/+YmG76Cn8J2hEhu6LJTbn8Aw4nSws6PNF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTIT3X4a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774342535; x=1805878535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0FsB03PyLBqucgBmNur3XoB6ZROWg++oSpNPK13R5Lw=;
  b=KTIT3X4aOA5t29u8/JP58sPrDvL+amsmB0KlmJ8huESc8f8zVy+4nqN4
   RDJkbMSziHb3biU783+5sj54HcvVii7a6nCSe4RHi2YtYKumCOzHPcWfF
   ys5LS98twy0m7qeNV2ncGvfFm5SqelNsvBOCmqXbWOqMMBc+wOMe6ctBL
   MFzkQ33RudCTHYIZeeIlcKmZOIULxO2CKV57V0nG8sNIQ3ExTQgm+El0+
   Bd+YXy8LKzxz+fk+J8NI2wivPEcb/Tq+qn10D3LidB1PJsyAp2EimCwIP
   2J/FytFqhTCQfC33Cj6sb/924ZaVmpxmUbIowMAW8pn+mzeM3AF6AA5r7
   Q==;
X-CSE-ConnectionGUID: FwDAOZI2RReAOY8y/FxrZQ==
X-CSE-MsgGUID: zfhR4B9WSuOlIYV6NOQZqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75376714"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75376714"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:55:34 -0700
X-CSE-ConnectionGUID: u/1ZdDjNR46DlFWKO15Kpg==
X-CSE-MsgGUID: AE9bkBEIQdeAthRVKFbSQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224296762"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:55:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 52C8F121CFF;
	Tue, 24 Mar 2026 10:55:33 +0200 (EET)
Date: Tue, 24 Mar 2026 10:55:33 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com
Subject: Re: [PATCH] media: intel/ipu6: Fix DWC PHY HSFREQRANGE band
 selection for overlapping ranges
Message-ID: <acJRhXavodXz63jK@kekkonen.localdomain>
References: <20260323154037.1404865-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323154037.1404865-1-mnencia@kcore.it>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56829-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[kcore.it:query timed out];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[mnencia.kcore.it:query timed out,sakari.ailus.linux.intel.com:query timed out];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C9EF630530C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marco,

Thanks for the patch.

On Mon, Mar 23, 2026 at 04:40:37PM +0100, Marco Nenciarini wrote:
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
> Add a check after get_hsfreq_by_mbps() that shifts to the previous
> band when it also covers the requested data rate and provides a higher
> osc_freq_target, ensuring stable DDL lock at boundary data rates.
> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
> ---
>  .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
> index db28748..450e7a2 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
> @@ -317,6 +317,27 @@ static int ipu6_isys_dwc_phy_config(struct ipu6_isys *isys,
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * The overlapping frequency ranges combined with the backward
> +	 * search in get_hsfreq_by_mbps() can select a band where the
> +	 * data rate sits at the lower edge and osc_freq_target drops
> +	 * (335 -> 208 at index 43). When the previous band also covers
> +	 * this rate and has a higher osc_freq_target, prefer it for
> +	 * better DDL lock stability. This fixes CRC errors seen at
> +	 * 1498 Mbps (e.g. OV08X40 on Arrow Lake).
> +	 */
> +	if (index > 0 &&
> +	    mbps >= freqranges[index - 1].min &&
> +	    mbps <= freqranges[index - 1].max &&
> +	    freqranges[index - 1].osc_freq_target >
> +	    freqranges[index].osc_freq_target) {
> +		dev_dbg(dev, "Dphy %u: shift band %u->%u for %u mbps (osc %u->%u)",
> +			phy_id, index, index - 1, mbps,
> +			freqranges[index].osc_freq_target,
> +			freqranges[index - 1].osc_freq_target);
> +		index--;
> +	}

Instead of adding this workaround, can we change the selection algorithm
instead? I'm not sure where the table comes from (datasheet somewhere
maybe?), but it looks like there indeed are many options for most
frequencies. The current algorithm appears just crude.

What I might do is to select either the exact (default_mbps) frequency and
if there's no exact match, then pick the one that has higher
osc_freq_target (while still satisfying min/max limits) or if the two are
the same, then the one that has closer default_freq.

I can write a patch, too, if you like.

> +
>  	dwc_dphy_write_mask(isys, phy_id, IPU6_DWC_DPHY_HSFREQRANGE,
>  			    freqranges[index].hsfreq, 0, 7);
>  

-- 
Kind regards,

Sakari Ailus

