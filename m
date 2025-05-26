Return-Path: <linux-media+bounces-33352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D4BAC3AFD
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 09:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19260173FB0
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 07:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717BF1E1C02;
	Mon, 26 May 2025 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJyz0qqc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A97C1E1A33
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 07:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246216; cv=none; b=QKeAfo2oYU/NzuTD5QxTJB2t7PRzfZjOUnsD/Kb7W8+3oDdQv1JBjrYHpafObu9n5oa2ClhhATzbRVz3706d1RWBsgmkyyMi2efPUhCeXCQ7JBRrij7EBgj+CJtrTAzgJsvdPNgRGZ79G+wRetvBX3uR1n0BwE0tYcm4pnhulUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246216; c=relaxed/simple;
	bh=77eNS1uIzVWp3GeF4AuOWzAA12I6mTiAM3so7KAMpvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eD7LhZth23mx2sfC5ozidt7cuasQ0fYDBE8ZoKaBucQ4oo7/YV76y1AkH7z338h0cIfEpp8J4Q9jStWUnX6gfp/GH9n0ubxUG19+Yo5/u+iKd448uPkh99pDNba/yeNKag2OzI9pAWIW7w5cAUx6F+3sH2oiuzS+u1JvAtX4EwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJyz0qqc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748246212; x=1779782212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=77eNS1uIzVWp3GeF4AuOWzAA12I6mTiAM3so7KAMpvQ=;
  b=gJyz0qqcwB3WcI23xIxYnM7ELtMSVq51K8NHLPiay+rvSsd6E/IAuktS
   7uz052nqC0GLt05lE3GB+zUplunotkd5soI0t6ITcA/tWlS1xLw8JNaXK
   PoC+lRNXrcO+oxsE/nNqA0c69uTtGgFWIZnm6VJGt+G9Nis68kSIA6iZl
   TZQeobeK+RzuaYLJ4tLf9cYVErt9CpsdRCWFCyWeYkoPghDt1ynaurWiL
   smisjJZpc3lBE5rMxdeb9lnLCKSoO+/2BJy4cIiAsImMtfuj816GY1ED0
   McnoL7QrLVwZ3qrTwFomirVwh0ut0y9OEq7qmr5QfXSRZkB+fN5i+WT3I
   Q==;
X-CSE-ConnectionGUID: Yjp1WwE4SFCFDYEYX8opBQ==
X-CSE-MsgGUID: g9tkMC25RoOI4ARpmcxtmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="67761970"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="67761970"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 00:56:51 -0700
X-CSE-ConnectionGUID: 844d1ptkQlOENQEJiLvbVA==
X-CSE-MsgGUID: /RkeAUE4RFeVXH3VLmoJKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="146156312"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.125])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 00:56:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8256211F738;
	Mon, 26 May 2025 10:56:45 +0300 (EEST)
Date: Mon, 26 May 2025 07:56:45 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	stanislaw.gruszka@linux.intel.com,
	laurent.pinchart@ideasonboard.com, phasta@mailbox.org,
	helgaas@kernel.org, jerry.w.hu@intel.com, hao.yao@intel.com,
	tian.shu.qiu@intel.com
Subject: Re: [PATCH 6/8] media: staging/ipu7: add IPU7 input system device
 driver
Message-ID: <aDQevcypeMIyHFYn@kekkonen.localdomain>
References: <20250429032841.115107-1-bingbu.cao@intel.com>
 <20250429032841.115107-7-bingbu.cao@intel.com>
 <aBCMpPrPaioElNjz@kekkonen.localdomain>
 <27231061-82f8-35c2-1f60-8b2fa1aa298c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27231061-82f8-35c2-1f60-8b2fa1aa298c@linux.intel.com>

Hi Bingbu,

On Mon, May 26, 2025 at 02:52:09PM +0800, Bingbu Cao wrote:
> >> +	/* deskew */
> >> +	for (i = 0; i < lanes; i++) {
> >> +		reg = CORE_DIG_DLANE_0_RW_CFG_1;
> >> +		dwc_phy_write_mask(isys, id, reg + (i * 0x400),
> >> +				   ((mbps > 1500) ? 0x1 : 0x2), 2, 3);
> > 
> > You can remove three pairs of parentheses above. Same below.
> 
> This also just to satisfy the MISRA (FUSA) rule :(.

MISRA isn't part of the kernel coding style. I'm pretty sure you could
automate generating patches with Coccinelle where you need to be MISRA
compliant.


> >> +static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
> >> +				  bool aggregation, u64 mbps)
> >> +{
> >> +	u8 trios = 2;
> >> +	u16 coarse_target;
> >> +	u16 deass_thresh;
> >> +	u16 delay_thresh;
> >> +	u16 reset_thresh;
> >> +	u16 cap_prog = 6U;
> >> +	u16 reg;
> >> +	u16 val;
> >> +	u32 i;
> >> +	u32 r;
> >> +
> >> +	if (is_ipu7p5(isys->adev->isp->hw_ver))
> >> +		val = 0x15;
> >> +	else
> >> +		val = 0x155;
> >> +
> >> +	if (is_ipu7(isys->adev->isp->hw_ver))
> >> +		trios = 3;
> > 
> > It'd be good to have hardware version specific struct where you'd have such
> > values in a single location.
> >
> 
> It could be done, but there are many variants and a new IPU7 platform is
> coming, I think I can do this in future.

Fair enough. If this function remains IPU7 specific, I mean not being
relevant for IPU6, then this could be workable indeed.

> 
> >> +
> >> +	dwc_phy_write_mask(isys, id, CORE_DIG_RW_COMMON_7, val, 0, 9);
> >> +	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_7, 104, 0, 7);
> >> +	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_8, 16, 0, 7);
> >> +
> >> +	reg = CORE_DIG_CLANE_0_RW_LP_0;
> >> +	for (i = 0; i < trios; i++)
> >> +		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 6, 8, 11);
> >> +
> >> +	val = (mbps > 900U) ? 1U : 0U;
> >> +	for (i = 0; i < trios; i++) {
> >> +		reg = CORE_DIG_CLANE_0_RW_HS_RX_0;
> >> +		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 1, 0, 0);
> >> +		dwc_phy_write_mask(isys, id, reg + (i * 0x400), val, 1, 1);
> >> +
> >> +		reg = CORE_DIG_CLANE_0_RW_HS_RX_1;
> >> +		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 38, 0, 15);
> >> +
> >> +		reg = CORE_DIG_CLANE_0_RW_HS_RX_5;
> >> +		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 38, 0, 15);
> >> +
> >> +		reg = CORE_DIG_CLANE_0_RW_HS_RX_6;
> >> +		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 10, 0, 15);
> >> +	}
> > 
> > Too many magic numbers. :-( Please come up with human-readable names for
> > these, including 0x400.
> > 
> > Simiarly below and probably elsewhere, too. No need to apply to individual
> > tables entries though, but they need to be separate from the code.
> 
> I don't think it is doable now, these are from PHY manual, I don't
> know the actual meaning of these magic registers.

Ok. At least add a comment to explain this, and what the values are for.

For register addresses you could add a macro to calculate it based on
trios. What does that value signify btw.?

> 
> > 
> >> +
> >> +	/*
> >> +	 * Below 900Msps, always use the same value.
> >> +	 * The formula is suitable for data rate 80-3500Msps.
> >> +	 * Timebase (us) = 1, DIV = 32, TDDL (UI) = 0.5
> >> +	 */
> >> +	if (mbps >= 80U) {
> >> +		coarse_target = (u16)div_u64_rem(mbps, 16, &r);
> > 
> > No need to cast.
> > 
> >> +		if (!r)
> >> +			coarse_target--;

Please use u32 for mbps.

Then you can also achieve the same result by just:

		coarse_target = (mbps - 1) / 16;

This seems to be a repeating pattern in this function at least.

> >> +	} else {
> >> +		coarse_target = 56;
> >> +	}
> >> +
> >> +	for (i = 0; i < trios; i++) {
> >> +		reg = CORE_DIG_CLANE_0_RW_HS_RX_2 + i * 0x400;
> >> +		dwc_phy_write_mask(isys, id, reg, coarse_target, 0, 15);
> >> +	}
> >> +
> >> +	dwc_phy_write_mask(isys, id,
> >> +			   CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_2, 1, 0, 0);
> >> +	dwc_phy_write_mask(isys, id,
> >> +			   CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_2, 0, 0, 0);
> >> +	dwc_phy_write_mask(isys, id,
> >> +			   CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_2, 1, 0, 0);
> >> +
> >> +	if (!is_ipu7p5(isys->adev->isp->hw_ver) && lanes == 4) {
> >> +		dwc_phy_write_mask(isys, id,
> >> +				   CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_2,
> >> +				   1, 0, 0);
> >> +		dwc_phy_write_mask(isys, id,
> >> +				   CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_2,
> >> +				   0, 0, 0);
> >> +	}
> >> +
> >> +	for (i = 0; i < trios; i++) {
> >> +		reg = CORE_DIG_RW_TRIO0_0 + i * 0x400;
> >> +		dwc_phy_write_mask(isys, id, reg, 1, 6, 8);
> >> +		dwc_phy_write_mask(isys, id, reg, 1, 3, 5);
> >> +		dwc_phy_write_mask(isys, id, reg, 2, 0, 2);
> >> +	}
> >> +
> >> +	deass_thresh = (u16)div_u64_rem(7 * 1000 * 6, mbps * 5U, &r) + 1;
> >> +	if (r != 0)
> >> +		deass_thresh++;
> >> +
> >> +	reg = CORE_DIG_RW_TRIO0_2;
> >> +	for (i = 0; i < trios; i++)
> >> +		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
> >> +				   deass_thresh, 0, 7);
> >> +
> >> +	delay_thresh =
> >> +		((224U - (9U * 7U)) * 1000U) / (5U * mbps) - 7U;
> >> +
> >> +	if (delay_thresh < 1)
> >> +		delay_thresh = 1;
> >> +
> >> +	reg = CORE_DIG_RW_TRIO0_1;
> >> +	for (i = 0; i < trios; i++)
> >> +		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
> >> +				   delay_thresh, 0, 15);
> >> +
> >> +	reset_thresh = (u16)div_u64_rem(2U * 5U * mbps, 7U * 1000U, &r);
> >> +	if (!r)
> >> +		reset_thresh--;
> >> +
> >> +	if (reset_thresh < 1)
> >> +		reset_thresh = 1;
> >> +
> >> +	reg = CORE_DIG_RW_TRIO0_0;
> >> +	for (i = 0; i < trios; i++)
> >> +		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
> >> +				   reset_thresh, 9, 11);
> >> +
> >> +	reg = CORE_DIG_CLANE_0_RW_LP_0;
> >> +	for (i = 0; i < trios; i++)
> >> +		dwc_phy_write_mask(isys, id, reg + 0x400 * i, 1, 12, 15);
> >> +
> >> +	reg = CORE_DIG_CLANE_0_RW_LP_2;
> >> +	for (i = 0; i < trios; i++)
> >> +		dwc_phy_write_mask(isys, id, reg + 0x400 * i, 0, 0, 0);
> >> +
> >> +	reg = CORE_DIG_CLANE_0_RW_HS_RX_0;
> >> +	for (i = 0; i < trios; i++)
> >> +		dwc_phy_write_mask(isys, id, reg + 0x400 * i, 12, 2, 6);
> >> +
> >> +	for (i = 0; i < ARRAY_SIZE(table7); i++) {
> >> +		if (mbps >= table7[i].min_mbps && mbps <= table7[i].max_mbps) {
> >> +			cap_prog = table7[i].val;
> >> +			break;
> >> +		}
> >> +	}
> >> +
> >> +	for (i = 0; i < (lanes + 1); i++) {
> >> +		reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_9 + 0x400 * i;
> >> +		dwc_phy_write_mask(isys, id, reg, 4U, 0, 2);
> >> +		dwc_phy_write_mask(isys, id, reg, 0U, 3, 4);
> >> +
> >> +		reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_7 + 0x400 * i;
> >> +		dwc_phy_write_mask(isys, id, reg, cap_prog, 10, 12);
> >> +	}
> >> +}
> >> +
> >> +static void ipu7_isys_phy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
> >> +				 bool aggregation)
> >> +{
> >> +	struct device *dev = &isys->adev->auxdev.dev;
> >> +	u32 phy_mode;
> >> +	s64 link_freq;
> >> +	u64 mbps;
> >> +
> >> +	if (aggregation)
> >> +		link_freq = ipu7_isys_csi2_get_link_freq(&isys->csi2[0]);
> >> +	else
> >> +		link_freq = ipu7_isys_csi2_get_link_freq(&isys->csi2[id]);
> >> +
> >> +	if (link_freq < 0) {
> >> +		dev_warn(dev, "get link freq failed, use default mbps\n");
> >> +		link_freq = 560000000;

Please just handle the error.

> >> +	}
> >> +
> >> +	mbps = div_u64(link_freq, 500000);
> >> +	dev_dbg(dev, "config phy %u with lanes %u aggregation %d mbps %lld\n",
> >> +		id, lanes, aggregation, mbps);
> >> +
> >> +	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_10, 48, 0, 7);
> >> +	dwc_phy_write_mask(isys, id, CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2,
> >> +			   1, 12, 13);
> >> +	dwc_phy_write_mask(isys, id, CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0,
> >> +			   63, 2, 7);
> >> +	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_STARTUP_1_1,
> >> +			   563, 0, 11);
> >> +	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_2, 5, 0, 7);
> >> +	/* bypass the RCAL state (bit6) */
> >> +	if (aggregation && id != PORT_A)
> >> +		dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_2, 0x45,
> >> +				   0, 7);
> >> +
> >> +	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_6, 39, 0, 7);
> >> +	dwc_phy_write_mask(isys, id, PPI_CALIBCTRL_RW_COMMON_BG_0, 500, 0, 8);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_TERMCAL_CFG_0, 38, 0, 6);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_OFFSETCAL_CFG_0, 7, 0, 4);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_TIMEBASE, 153, 0, 9);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_NREF, 800, 0, 10);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_NREF_RANGE, 27, 0, 4);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_TWAIT_CONFIG, 47, 0, 8);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_TWAIT_CONFIG, 127, 9, 15);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_VT_CONFIG, 47, 7, 15);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_VT_CONFIG, 27, 2, 6);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_VT_CONFIG, 3, 0, 1);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_COARSE_CFG, 1, 0, 1);
> >> +	dwc_phy_write_mask(isys, id, PPI_RW_COMMON_CFG, 3, 0, 1);
> >> +	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_0,
> >> +			   0, 10, 10);
> >> +	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_1,
> >> +			   1, 10, 10);
> >> +	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_1,
> >> +			   0, 15, 15);
> >> +	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_3,
> >> +			   3, 8, 9);
> >> +	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_0,
> >> +			   0, 15, 15);
> >> +	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_6,
> >> +			   7, 12, 14);
> >> +	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_7,
> >> +			   0, 8, 10);
> >> +	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_5,
> >> +			   0, 8, 8);
> >> +
> >> +	if (aggregation)
> >> +		phy_mode = isys->csi2[0].phy_mode;
> >> +	else
> >> +		phy_mode = isys->csi2[id].phy_mode;
> >> +
> >> +	if (phy_mode == PHY_MODE_DPHY) {
> >> +		ipu7_isys_dphy_config(isys, id, lanes, aggregation, mbps);
> >> +	} else if (phy_mode == PHY_MODE_CPHY) {
> >> +		ipu7_isys_cphy_config(isys, id, lanes, aggregation, mbps);
> >> +	} else {
> >> +		dev_err(dev, "unsupported phy mode %d!\n",
> >> +			isys->csi2[id].phy_mode);
> >> +	}
> >> +}
> >> +
> >> +int ipu7_isys_csi_phy_powerup(struct ipu7_isys_csi2 *csi2)
> >> +{
> >> +	struct ipu7_isys *isys = csi2->isys;
> >> +	u32 lanes = csi2->nlanes;
> >> +	bool aggregation = false;
> >> +	u32 id = csi2->port;
> >> +	int ret;
> >> +
> >> +	/* lanes remapping for aggregation (port AB) mode */
> >> +	if (!is_ipu7(isys->adev->isp->hw_ver) && lanes > 2 && id == PORT_A) {
> >> +		aggregation = true;
> >> +		lanes = 2;
> >> +	}
> >> +
> >> +	ipu7_isys_csi_phy_reset(isys, id);
> >> +	gpreg_write(isys, id, PHY_CLK_LANE_CONTROL, 0x1);
> >> +	gpreg_write(isys, id, PHY_CLK_LANE_FORCE_CONTROL, 0x2);
> >> +	gpreg_write(isys, id, PHY_LANE_CONTROL_EN, (1U << lanes) - 1U);
> >> +	gpreg_write(isys, id, PHY_LANE_FORCE_CONTROL, 0xf);
> >> +	gpreg_write(isys, id, PHY_MODE, csi2->phy_mode);
> >> +
> >> +	/* config PORT_B if aggregation mode */
> >> +	if (aggregation) {
> >> +		ipu7_isys_csi_phy_reset(isys, PORT_B);
> >> +		gpreg_write(isys, PORT_B, PHY_CLK_LANE_CONTROL, 0x0);
> >> +		gpreg_write(isys, PORT_B, PHY_LANE_CONTROL_EN, 0x3);
> >> +		gpreg_write(isys, PORT_B, PHY_CLK_LANE_FORCE_CONTROL, 0x2);
> >> +		gpreg_write(isys, PORT_B, PHY_LANE_FORCE_CONTROL, 0xf);
> >> +		gpreg_write(isys, PORT_B, PHY_MODE, csi2->phy_mode);
> >> +	}
> >> +
> >> +	ipu7_isys_csi_ctrl_cfg(csi2);
> >> +	ipu7_isys_csi_ctrl_dids_config(csi2, id);
> >> +
> >> +	ipu7_isys_phy_config(isys, id, lanes, aggregation);
> >> +	gpreg_write(isys, id, PHY_RESET, 1);
> >> +	gpreg_write(isys, id, PHY_SHUTDOWN, 1);
> >> +	dwc_csi_write(isys, id, DPHY_RSTZ, 1);
> >> +	dwc_csi_write(isys, id, PHY_SHUTDOWNZ, 1);
> >> +	dwc_csi_write(isys, id, CSI2_RESETN, 1);
> >> +
> >> +	ret = ipu7_isys_phy_ready(isys, id);
> >> +	if (ret < 0)
> >> +		return ret;
> >> +
> >> +	gpreg_write(isys, id, PHY_LANE_FORCE_CONTROL, 0);
> >> +	gpreg_write(isys, id, PHY_CLK_LANE_FORCE_CONTROL, 0);
> >> +
> >> +	/* config PORT_B if aggregation mode */
> >> +	if (aggregation) {
> >> +		ipu7_isys_phy_config(isys, PORT_B, 2, aggregation);
> >> +		gpreg_write(isys, PORT_B, PHY_RESET, 1);
> >> +		gpreg_write(isys, PORT_B, PHY_SHUTDOWN, 1);
> >> +		dwc_csi_write(isys, PORT_B, DPHY_RSTZ, 1);
> >> +		dwc_csi_write(isys, PORT_B, PHY_SHUTDOWNZ, 1);
> >> +		dwc_csi_write(isys, PORT_B, CSI2_RESETN, 1);
> >> +		ret = ipu7_isys_phy_ready(isys, PORT_B);
> >> +		if (ret < 0)
> >> +			return ret;
> >> +
> >> +		gpreg_write(isys, PORT_B, PHY_LANE_FORCE_CONTROL, 0);
> >> +		gpreg_write(isys, PORT_B, PHY_CLK_LANE_FORCE_CONTROL, 0);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +void ipu7_isys_csi_phy_powerdown(struct ipu7_isys_csi2 *csi2)
> >> +{
> >> +	struct ipu7_isys *isys = csi2->isys;
> >> +
> >> +	ipu7_isys_csi_phy_reset(isys, csi2->port);
> >> +	if (!is_ipu7(isys->adev->isp->hw_ver) &&
> >> +	    csi2->nlanes > 2U && csi2->port == PORT_A)
> >> +		ipu7_isys_csi_phy_reset(isys, PORT_B);
> >> +}
> >> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
> >> new file mode 100644
> >> index 000000000000..dfdcb61540c4
> >> --- /dev/null
> >> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
> >> @@ -0,0 +1,16 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Copyright (C) 2013 - 2025 Intel Corporation
> >> + */
> >> +
> >> +#ifndef IPU7_ISYS_CSI_PHY_H
> >> +#define IPU7_ISYS_CSI_PHY_H
> >> +
> >> +struct ipu7_isys;
> >> +
> >> +#define PHY_MODE_DPHY		0U
> >> +#define PHY_MODE_CPHY		1U
> >> +
> >> +int ipu7_isys_csi_phy_powerup(struct ipu7_isys_csi2 *csi2);
> >> +void ipu7_isys_csi_phy_powerdown(struct ipu7_isys_csi2 *csi2);
> >> +#endif
> >> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h b/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
> >> new file mode 100644
> >> index 000000000000..32704ca21341
> >> --- /dev/null
> >> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
> >> @@ -0,0 +1,1197 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Copyright (C) 2020 - 2025 Intel Corporation
> >> + */
> >> +
> >> +#ifndef IPU7_ISYS_CSI2_REG_H
> >> +#define IPU7_ISYS_CSI2_REG_H
> >> +
> >> +/* IS main regs base */
> >> +#define IS_MAIN_BASE				(0x240000U)
> > 
> > Please drop U specifier from hexadecimal values.
> >
> 
> We changed these for fixing the FUSA(MISRA C) problems, is it not
> liked by kernel coding rule?

I've frankly never seen that in kernel code. I grepped a bit and there are
3,5 million cases without U suffix and a bit less than 2000 with it. So it
exists but is rare, for the reason of being redundant. I don't have a
strong opinion on it either way but I lean towards removing it as it's
redundant.

> 
> 
> >> +#define IS_MAIN_S2B_BASE			(IS_MAIN_BASE + 0x22000U)
> >> +#define IS_MAIN_B2O_BASE			(IS_MAIN_BASE + 0x26000U)
> >> +#define IS_MAIN_ISD_M0_BASE			(IS_MAIN_BASE + 0x2b000U)
> >> +#define IS_MAIN_ISD_M1_BASE			(IS_MAIN_BASE + 0x2b100U)
> >> +#define IS_MAIN_ISD_INT_BASE			(IS_MAIN_BASE + 0x2b200U)
> >> +#define IS_MAIN_GDA_BASE			(IS_MAIN_BASE + 0x32000U)
> >> +#define IS_MAIN_GPREGS_MAIN_BASE		(IS_MAIN_BASE + 0x32500U)
> >> +#define IS_MAIN_IRQ_CTRL_BASE			(IS_MAIN_BASE + 0x32700U)
> >> +#define IS_MAIN_PWM_CTRL_BASE			(IS_MAIN_BASE + 0x32b00U)
> >> +
> >> +#define S2B_IRQ_COMMON_0_CTL_STATUS		(IS_MAIN_S2B_BASE + 0x1cU)
> >> +#define S2B_IRQ_COMMON_0_CTL_CLEAR		(IS_MAIN_S2B_BASE + 0x20U)
> >> +#define S2B_IRQ_COMMON_0_CTL_ENABLE		(IS_MAIN_S2B_BASE + 0x24U)
> >> +#define S2B_IID_IRQ_CTL_STATUS(iid)		(IS_MAIN_S2B_BASE + 0x94U + \
> >> +						 0x100U * (iid))
> >> +
> >> +#define B2O_IRQ_COMMON_0_CTL_STATUS		(IS_MAIN_B2O_BASE + 0x30U)
> >> +#define B2O_IRQ_COMMON_0_CTL_CLEAR		(IS_MAIN_B2O_BASE + 0x34U)
> >> +#define B2O_IRQ_COMMON_0_CTL_ENABLE		(IS_MAIN_B2O_BASE + 0x38U)
> >> +#define B2O_IID_IRQ_CTL_STATUS(oid)		(IS_MAIN_B2O_BASE + 0x3dcU + \
> >> +						 0x200U * (oid))
> >> +
> >> +#define ISD_M0_IRQ_CTL_STATUS			(IS_MAIN_ISD_M0_BASE + 0x1cU)
> >> +#define ISD_M0_IRQ_CTL_CLEAR			(IS_MAIN_ISD_M0_BASE + 0x20U)
> >> +#define ISD_M0_IRQ_CTL_ENABLE			(IS_MAIN_ISD_M0_BASE + 0x24U)
> >> +
> >> +#define ISD_M1_IRQ_CTL_STATUS			(IS_MAIN_ISD_M1_BASE + 0x1cU)
> >> +#define ISD_M1_IRQ_CTL_CLEAR			(IS_MAIN_ISD_M1_BASE + 0x20U)
> >> +#define ISD_M1_IRQ_CTL_ENABLE			(IS_MAIN_ISD_M1_BASE + 0x24U)
> >> +
> >> +#define ISD_INT_IRQ_CTL_STATUS			(IS_MAIN_ISD_INT_BASE + 0x1cU)
> >> +#define ISD_INT_IRQ_CTL_CLEAR			(IS_MAIN_ISD_INT_BASE + 0x20U)
> >> +#define ISD_INT_IRQ_CTL_ENABLE			(IS_MAIN_ISD_INT_BASE + 0x24U)
> >> +
> >> +#define GDA_IRQ_CTL_STATUS			(IS_MAIN_GDA_BASE + 0x1cU)
> >> +#define GDA_IRQ_CTL_CLEAR			(IS_MAIN_GDA_BASE + 0x20U)
> >> +#define GDA_IRQ_CTL_ENABLE			(IS_MAIN_GDA_BASE + 0x24U)
> >> +
> >> +#define IS_MAIN_IRQ_CTL_EDGE			IS_MAIN_IRQ_CTRL_BASE
> >> +#define IS_MAIN_IRQ_CTL_MASK			(IS_MAIN_IRQ_CTRL_BASE + 0x4U)
> >> +#define IS_MAIN_IRQ_CTL_STATUS			(IS_MAIN_IRQ_CTRL_BASE + 0x8U)
> >> +#define IS_MAIN_IRQ_CTL_CLEAR			(IS_MAIN_IRQ_CTRL_BASE + 0xcU)
> >> +#define IS_MAIN_IRQ_CTL_ENABLE			(IS_MAIN_IRQ_CTRL_BASE + 0x10U)
> >> +#define IS_MAIN_IRQ_CTL_LEVEL_NOT_PULSE		(IS_MAIN_IRQ_CTRL_BASE + 0x14U)
> >> +
> >> +/* IS IO regs base */
> >> +#define IS_PHY_NUM				(4U)
> >> +#define IS_IO_BASE				(0x280000U)

These parentheses are redundant, too, btw.

> >> +
> >> +/* dwc csi cdphy registers */
> >> +#define IS_IO_CDPHY_BASE(i)			(IS_IO_BASE + 0x10000U * (i))
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_0			0x1800U
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_1			0x1802U
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_2			0x1804U
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_3			0x1806U
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_4			0x1808U
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_5			0x180aU
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_6			0x180cU
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_7			0x180eU
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_8			0x1810U
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_9			0x1812U
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_A			0x1814U
> >> +#define PPI_STARTUP_RW_COMMON_DPHY_10			0x1820U
> >> +#define PPI_STARTUP_RW_COMMON_STARTUP_1_1		0x1822U
> >> +#define PPI_STARTUP_RW_COMMON_STARTUP_1_2		0x1824U
> >> +#define PPI_CALIBCTRL_RW_COMMON_CALIBCTRL_2_0		0x1840U
> >> +#define PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_1		0x1842U
> >> +#define PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_2		0x1844U
> >> +#define PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_3		0x1846U
> >> +#define PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_4		0x1848U
> >> +#define PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_5		0x184aU
> >> +#define PPI_CALIBCTRL_RW_COMMON_BG_0			0x184cU
> >> +#define PPI_CALIBCTRL_RW_COMMON_CALIBCTRL_2_7		0x184eU
> >> +#define PPI_CALIBCTRL_RW_ADC_CFG_0			0x1850U
> >> +#define PPI_CALIBCTRL_RW_ADC_CFG_1			0x1852U
> >> +#define PPI_CALIBCTRL_R_ADC_DEBUG			0x1854U
> >> +#define PPI_RW_LPDCOCAL_TOP_OVERRIDE			0x1c00U
> >> +#define PPI_RW_LPDCOCAL_TIMEBASE			0x1c02U
> >> +#define PPI_RW_LPDCOCAL_NREF				0x1c04U
> >> +#define PPI_RW_LPDCOCAL_NREF_RANGE			0x1c06U
> >> +#define PPI_RW_LPDCOCAL_NREF_TRIGGER_MAN		0x1c08U
> >> +#define PPI_RW_LPDCOCAL_TWAIT_CONFIG			0x1c0aU
> >> +#define PPI_RW_LPDCOCAL_VT_CONFIG			0x1c0cU
> >> +#define PPI_R_LPDCOCAL_DEBUG_RB				0x1c0eU
> >> +#define PPI_RW_LPDCOCAL_COARSE_CFG			0x1c10U
> >> +#define PPI_R_LPDCOCAL_DEBUG_COARSE_RB			0x1c12U
> >> +#define PPI_R_LPDCOCAL_DEBUG_COARSE_MEAS_0_RB		0x1c14U
> >> +#define PPI_R_LPDCOCAL_DEBUG_COARSE_MEAS_1_RB		0x1c16U
> >> +#define PPI_R_LPDCOCAL_DEBUG_COARSE_FWORD_RB		0x1c18U
> >> +#define PPI_R_LPDCOCAL_DEBUG_MEASURE_CURR_ERROR		0x1c1aU
> >> +#define PPI_R_LPDCOCAL_DEBUG_MEASURE_LAST_ERROR		0x1c1cU
> >> +#define PPI_R_LPDCOCAL_DEBUG_VT				0x1c1eU
> >> +#define PPI_RW_LB_TIMEBASE_CONFIG			0x1c20U
> >> +#define PPI_RW_LB_STARTCMU_CONFIG			0x1c22U
> >> +#define PPI_R_LBPULSE_COUNTER_RB			0x1c24U
> >> +#define PPI_R_LB_START_CMU_RB				0x1c26U
> >> +#define PPI_RW_LB_DPHY_BURST_START			0x1c28U
> >> +#define PPI_RW_LB_CPHY_BURST_START			0x1c2aU
> >> +#define PPI_RW_DDLCAL_CFG_0				0x1c40U
> >> +#define PPI_RW_DDLCAL_CFG_1				0x1c42U
> >> +#define PPI_RW_DDLCAL_CFG_2				0x1c44U
> >> +#define PPI_RW_DDLCAL_CFG_3				0x1c46U
> >> +#define PPI_RW_DDLCAL_CFG_4				0x1c48U
> >> +#define PPI_RW_DDLCAL_CFG_5				0x1c4aU
> >> +#define PPI_RW_DDLCAL_CFG_6				0x1c4cU
> >> +#define PPI_RW_DDLCAL_CFG_7				0x1c4eU
> >> +#define PPI_R_DDLCAL_DEBUG_0				0x1c50U
> >> +#define PPI_R_DDLCAL_DEBUG_1				0x1c52U
> >> +#define PPI_RW_PARITY_TEST				0x1c60U
> >> +#define PPI_RW_STARTUP_OVR_0				0x1c62U
> >> +#define PPI_RW_STARTUP_STATE_OVR_1			0x1c64U
> >> +#define PPI_RW_DTB_SELECTOR				0x1c66U
> >> +#define PPI_RW_DPHY_CLK_SPARE				0x1c6aU
> >> +#define PPI_RW_COMMON_CFG				0x1c6cU
> >> +#define PPI_RW_TERMCAL_CFG_0				0x1c80U
> >> +#define PPI_R_TERMCAL_DEBUG_0				0x1c82U
> >> +#define PPI_RW_TERMCAL_CTRL_0				0x1c84U
> >> +#define PPI_RW_OFFSETCAL_CFG_0				0x1ca0U
> >> +#define PPI_R_OFFSETCAL_DEBUG_LANE0			0x1ca2U
> >> +#define PPI_R_OFFSETCAL_DEBUG_LANE1			0x1ca4U
> >> +#define PPI_R_OFFSETCAL_DEBUG_LANE2			0x1ca6U
> >> +#define PPI_R_OFFSETCAL_DEBUG_LANE3			0x1ca8U
> >> +#define PPI_R_OFFSETCAL_DEBUG_LANE4			0x1caaU
> >> +#define PPI_RW_HSDCOCAL_CFG_O				0x1d00U
> >> +#define PPI_RW_HSDCOCAL_CFG_1				0x1d02U
> >> +#define PPI_RW_HSDCOCAL_CFG_2				0x1d04U
> >> +#define PPI_RW_HSDCOCAL_CFG_3				0x1d06U
> >> +#define PPI_RW_HSDCOCAL_CFG_4				0x1d08U
> >> +#define PPI_RW_HSDCOCAL_CFG_5				0x1d0aU
> >> +#define PPI_RW_HSDCOCAL_CFG_6				0x1d0cU
> >> +#define PPI_RW_HSDCOCAL_CFG_7				0x1d0eU
> >> +#define PPI_RW_HSDCOCAL_CFG_8				0x1d10U
> >> +#define PPI_R_HSDCOCAL_DEBUG_RB				0x1d12U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_0	0x2000U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_1	0x2002U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_2	0x2004U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_3	0x2006U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_4	0x2008U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_5	0x200aU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_6	0x200cU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_7	0x200eU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_8	0x2010U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_9	0x2012U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_10	0x2014U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_11	0x2016U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_12	0x2018U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_13	0x201aU
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_14	0x201cU
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_15	0x201eU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_0	0x2020U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_1	0x2022U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_2	0x2024U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_3	0x2026U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_4	0x2028U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_5	0x202aU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_6	0x202cU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_7	0x202eU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_8	0x2030U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_9	0x2032U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_10	0x2034U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_11	0x2036U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_12	0x2038U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_13	0x203aU
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_14	0x203cU
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_15	0x203eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_0		0x2040U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_1		0x2042U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_2		0x2044U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_3		0x2046U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_4		0x2048U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_5		0x204aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_6		0x204cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_7		0x204eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_8		0x2050U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_9		0x2052U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_10		0x2054U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_11		0x2056U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_12		0x2058U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_13		0x205aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_14		0x205cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_15		0x205eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_0		0x2060U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_1		0x2062U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_2		0x2064U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_3		0x2066U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_4		0x2068U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_5		0x206aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_6		0x206cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_7		0x206eU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_8		0x2070U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_9		0x2072U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_10		0x2074U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_11		0x2076U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_12		0x2078U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_13		0x207aU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_14		0x207cU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_15		0x207eU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_4_0		0x2080U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_4_1		0x2082U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_4_2		0x2084U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_4_3		0x2086U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_4_4		0x2088U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_5_0	0x20a0U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_5_1	0x20a2U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_5_2	0x20a4U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_5_3	0x20a6U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_5_4	0x20a8U
> >> +#define CORE_DIG_RW_TRIO0_0				0x2100U
> >> +#define CORE_DIG_RW_TRIO0_1				0x2102U
> >> +#define CORE_DIG_RW_TRIO0_2				0x2104U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_0	0x2400U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_1	0x2402U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_2	0x2404U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_3	0x2406U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_4	0x2408U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_5	0x240aU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_6	0x240cU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_7	0x240eU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_8	0x2410U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_9	0x2412U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_10	0x2414U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_11	0x2416U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_12	0x2418U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_13	0x241aU
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_14	0x241cU
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_15	0x241eU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_0	0x2420U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_1	0x2422U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_2	0x2424U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_3	0x2426U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_4	0x2428U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_5	0x242aU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_6	0x242cU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_7	0x242eU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_8	0x2430U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_9	0x2432U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_10	0x2434U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_11	0x2436U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_12	0x2438U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_13	0x243aU
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_14	0x243cU
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_15	0x243eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_0		0x2440U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_1		0x2442U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_2		0x2444U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_3		0x2446U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_4		0x2448U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_5		0x244aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_6		0x244cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_7		0x244eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_8		0x2450U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_9		0x2452U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_10		0x2454U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_11		0x2456U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_12		0x2458U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_13		0x245aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_14		0x245cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_15		0x245eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_0		0x2460U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_1		0x2462U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_2		0x2464U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_3		0x2466U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_4		0x2468U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_5		0x246aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_6		0x246cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_7		0x246eU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_8		0x2470U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_9		0x2472U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_10		0x2474U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_11		0x2476U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_12		0x2478U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_13		0x247aU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_14		0x247cU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_15		0x247eU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_4_0		0x2480U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_4_1		0x2482U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_4_2		0x2484U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_4_3		0x2486U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_4_4		0x2488U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_5_0	0x24a0U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_5_1	0x24a2U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_5_2	0x24a4U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_5_3	0x24a6U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_5_4	0x24a8U
> >> +#define CORE_DIG_RW_TRIO1_0				0x2500U
> >> +#define CORE_DIG_RW_TRIO1_1				0x2502U
> >> +#define CORE_DIG_RW_TRIO1_2				0x2504U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_0	0x2800U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_1	0x2802U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_2	0x2804U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_3	0x2806U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_4	0x2808U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_5	0x280aU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_6	0x280cU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_7	0x280eU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_8	0x2810U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_9	0x2812U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_10	0x2814U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_11	0x2816U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_12	0x2818U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_13	0x281aU
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_14	0x281cU
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_15	0x281eU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_0	0x2820U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_1	0x2822U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_2	0x2824U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_3	0x2826U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_4	0x2828U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_5	0x282aU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_6	0x282cU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_7	0x282eU
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_8	0x2830U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_9	0x2832U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_10	0x2834U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_11	0x2836U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_12	0x2838U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_13	0x283aU
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_14	0x283cU
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_15	0x283eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_0		0x2840U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_1		0x2842U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_2		0x2844U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_3		0x2846U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_4		0x2848U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_5		0x284aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_6		0x284cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_7		0x284eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_8		0x2850U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_9		0x2852U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_10		0x2854U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_11		0x2856U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_12		0x2858U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_13		0x285aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_14		0x285cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_15		0x285eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_0		0x2860U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_1		0x2862U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_2		0x2864U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_3		0x2866U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_4		0x2868U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_5		0x286aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_6		0x286cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_7		0x286eU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_8		0x2870U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_9		0x2872U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_10		0x2874U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_11		0x2876U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_12		0x2878U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_13		0x287aU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_14		0x287cU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_15		0x287eU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_4_0		0x2880U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_4_1		0x2882U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_4_2		0x2884U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_4_3		0x2886U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_4_4		0x2888U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_5_0	0x28a0U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_5_1	0x28a2U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_5_2	0x28a4U
> >> +#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_5_3	0x28a6U
> >> +#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_5_4	0x28a8U
> >> +#define CORE_DIG_RW_TRIO2_0				0x2900U
> >> +#define CORE_DIG_RW_TRIO2_1				0x2902U
> >> +#define CORE_DIG_RW_TRIO2_2				0x2904U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_0	0x2c00U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_1	0x2c02U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_2	0x2c04U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_3	0x2c06U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_4	0x2c08U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_5	0x2c0aU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_6	0x2c0cU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_7	0x2c0eU
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_8	0x2c10U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_9	0x2c12U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_10	0x2c14U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_11	0x2c16U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_12	0x2c18U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_13	0x2c1aU
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_14	0x2c1cU
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_15	0x2c1eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_0		0x2c40U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_1		0x2c42U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_2		0x2c44U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_3		0x2c46U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_4		0x2c48U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_5		0x2c4aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_6		0x2c4cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_7		0x2c4eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_8		0x2c50U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_9		0x2c52U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_10		0x2c54U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_11		0x2c56U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_12		0x2c58U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_13		0x2c5aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_14		0x2c5cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_15		0x2c5eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_0		0x2c60U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_1		0x2c62U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_2		0x2c64U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_3		0x2c66U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_4		0x2c68U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_5		0x2c6aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_6		0x2c6cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_7		0x2c6eU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_8		0x2c70U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_9		0x2c72U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_10		0x2c74U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_11		0x2c76U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_12		0x2c78U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_13		0x2c7aU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_14		0x2c7cU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_15		0x2c7eU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_4_0		0x2c80U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_4_1		0x2c82U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_4_2		0x2c84U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_4_3		0x2c86U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_4_4		0x2c88U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_0		0x3040U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_1		0x3042U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_2		0x3044U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_3		0x3046U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_4		0x3048U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_5		0x304aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_6		0x304cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_7		0x304eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_8		0x3050U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_9		0x3052U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_10		0x3054U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_11		0x3056U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_12		0x3058U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_13		0x305aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_14		0x305cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_15		0x305eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_0		0x3060U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_1		0x3062U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_2		0x3064U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_3		0x3066U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_4		0x3068U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_5		0x306aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_6		0x306cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_7		0x306eU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_8		0x3070U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_9		0x3072U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_10		0x3074U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_11		0x3076U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_12		0x3078U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_13		0x307aU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_14		0x307cU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_15		0x307eU
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_4_0		0x3080U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_4_1		0x3082U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_4_2		0x3084U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_4_3		0x3086U
> >> +#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_4_4		0x3088U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_CLK_OVR_0_0		0x3400U
> >> +#define CORE_DIG_IOCTRL_RW_DPHY_PPI_CLK_OVR_0_1		0x3402U
> >> +#define CORE_DIG_IOCTRL_R_DPHY_PPI_CLK_OVR_0_2		0x3404U
> >> +#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_0		0x3800U
> >> +#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_1		0x3802U
> >> +#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_2		0x3804U
> >> +#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_3		0x3806U
> >> +#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_4		0x3808U
> >> +#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_5		0x380aU
> >> +#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_6		0x380cU
> >> +#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_7		0x380eU
> >> +#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_8		0x3810U
> >> +#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_9		0x3812U
> >> +#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_10		0x3814U
> >> +#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_0_11		0x3816U
> >> +#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_0_12		0x3818U
> >> +#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_0_13		0x381aU
> >> +#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_0_14		0x381cU
> >> +#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_0_15		0x381eU
> >> +#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_1_0		0x3820U
> >> +#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_1_1		0x3822U
> >> +#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_1_2		0x3824U
> >> +#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_1_3		0x3826U
> >> +#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_1_4		0x3828U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_0		0x3840U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_1		0x3842U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_2		0x3844U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_3		0x3846U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_4		0x3848U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_5		0x384aU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_6		0x384cU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_7		0x384eU
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_8		0x3850U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_9		0x3852U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_10		0x3854U
> >> +#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_11		0x3856U
> >> +#define CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_12		0x3858U
> >> +#define CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_13		0x385aU
> >> +#define CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_14		0x385cU
> >> +#define CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_15		0x385eU
> >> +#define CORE_DIG_IOCTRL_R_AFE_CB_CTRL_3_0		0x3860U
> >> +#define CORE_DIG_RW_COMMON_0				0x3880U
> >> +#define CORE_DIG_RW_COMMON_1				0x3882U
> >> +#define CORE_DIG_RW_COMMON_2				0x3884U
> >> +#define CORE_DIG_RW_COMMON_3				0x3886U
> >> +#define CORE_DIG_RW_COMMON_4				0x3888U
> >> +#define CORE_DIG_RW_COMMON_5				0x388aU
> >> +#define CORE_DIG_RW_COMMON_6				0x388cU
> >> +#define CORE_DIG_RW_COMMON_7				0x388eU
> >> +#define CORE_DIG_RW_COMMON_8				0x3890U
> >> +#define CORE_DIG_RW_COMMON_9				0x3892U
> >> +#define CORE_DIG_RW_COMMON_10				0x3894U
> >> +#define CORE_DIG_RW_COMMON_11				0x3896U
> >> +#define CORE_DIG_RW_COMMON_12				0x3898U
> >> +#define CORE_DIG_RW_COMMON_13				0x389aU
> >> +#define CORE_DIG_RW_COMMON_14				0x389cU
> >> +#define CORE_DIG_RW_COMMON_15				0x389eU
> >> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0		0x39e0U
> >> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_1		0x39e2U
> >> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2		0x39e4U
> >> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_3		0x39e6U
> >> +#define CORE_DIG_COMMON_RW_DESKEW_FINE_MEM		0x3fe0U
> >> +#define CORE_DIG_COMMON_R_DESKEW_FINE_MEM		0x3fe2U
> >> +#define PPI_RW_DPHY_LANE0_LBERT_0			0x4000U
> >> +#define PPI_RW_DPHY_LANE0_LBERT_1			0x4002U
> >> +#define PPI_R_DPHY_LANE0_LBERT_0			0x4004U
> >> +#define PPI_R_DPHY_LANE0_LBERT_1			0x4006U
> >> +#define PPI_RW_DPHY_LANE0_SPARE				0x4008U
> >> +#define PPI_RW_DPHY_LANE1_LBERT_0			0x4400U
> >> +#define PPI_RW_DPHY_LANE1_LBERT_1			0x4402U
> >> +#define PPI_R_DPHY_LANE1_LBERT_0			0x4404U
> >> +#define PPI_R_DPHY_LANE1_LBERT_1			0x4406U
> >> +#define PPI_RW_DPHY_LANE1_SPARE				0x4408U
> >> +#define PPI_RW_DPHY_LANE2_LBERT_0			0x4800U
> >> +#define PPI_RW_DPHY_LANE2_LBERT_1			0x4802U
> >> +#define PPI_R_DPHY_LANE2_LBERT_0			0x4804U
> >> +#define PPI_R_DPHY_LANE2_LBERT_1			0x4806U
> >> +#define PPI_RW_DPHY_LANE2_SPARE				0x4808U
> >> +#define PPI_RW_DPHY_LANE3_LBERT_0			0x4c00U
> >> +#define PPI_RW_DPHY_LANE3_LBERT_1			0x4c02U
> >> +#define PPI_R_DPHY_LANE3_LBERT_0			0x4c04U
> >> +#define PPI_R_DPHY_LANE3_LBERT_1			0x4c06U
> >> +#define PPI_RW_DPHY_LANE3_SPARE				0x4c08U
> > 
> > How about using base address for lanes and then using offsets? I presume
> > all lanes use same offset?
> > 
> > Same for CLANE definitions below.
> >
> 
> I copied these defines directly from the SNPS spec register list, it
> is useful to query and compare with the spec.

Would you be using these still as-is? I don't think so.

> 
> 
> >> +#define CORE_DIG_DLANE_0_RW_CFG_0			0x6000U
> >> +#define CORE_DIG_DLANE_0_RW_CFG_1			0x6002U
> >> +#define CORE_DIG_DLANE_0_RW_CFG_2			0x6004U
> >> +#define CORE_DIG_DLANE_0_RW_LP_0			0x6080U
> >> +#define CORE_DIG_DLANE_0_RW_LP_1			0x6082U
> >> +#define CORE_DIG_DLANE_0_RW_LP_2			0x6084U
> >> +#define CORE_DIG_DLANE_0_R_LP_0				0x60a0U
> >> +#define CORE_DIG_DLANE_0_R_LP_1				0x60a2U
> >> +#define CORE_DIG_DLANE_0_R_HS_TX_0			0x60e0U
> >> +#define CORE_DIG_DLANE_0_RW_HS_RX_0			0x6100U
> >> +#define CORE_DIG_DLANE_0_RW_HS_RX_1			0x6102U
> >> +#define CORE_DIG_DLANE_0_RW_HS_RX_2			0x6104U
> >> +#define CORE_DIG_DLANE_0_RW_HS_RX_3			0x6106U
> >> +#define CORE_DIG_DLANE_0_RW_HS_RX_4			0x6108U
> >> +#define CORE_DIG_DLANE_0_RW_HS_RX_5			0x610aU
> >> +#define CORE_DIG_DLANE_0_RW_HS_RX_6			0x610cU
> >> +#define CORE_DIG_DLANE_0_RW_HS_RX_7			0x610eU
> >> +#define CORE_DIG_DLANE_0_RW_HS_RX_8			0x6110U
> >> +#define CORE_DIG_DLANE_0_RW_HS_RX_9			0x6112U
> >> +#define CORE_DIG_DLANE_0_R_HS_RX_0			0x6120U
> >> +#define CORE_DIG_DLANE_0_R_HS_RX_1			0x6122U
> >> +#define CORE_DIG_DLANE_0_R_HS_RX_2			0x6124U
> >> +#define CORE_DIG_DLANE_0_R_HS_RX_3			0x6126U
> >> +#define CORE_DIG_DLANE_0_R_HS_RX_4			0x6128U
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_0			0x6200U
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_1			0x6202U
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_2			0x6204U
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_3			0x6206U
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_4			0x6208U
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_5			0x620aU
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_6			0x620cU
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_7			0x620eU
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_8			0x6210U
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_9			0x6212U
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_10			0x6214U
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_11			0x6216U
> >> +#define CORE_DIG_DLANE_0_RW_HS_TX_12			0x6218U
> >> +#define CORE_DIG_DLANE_1_RW_CFG_0			0x6400U
> >> +#define CORE_DIG_DLANE_1_RW_CFG_1			0x6402U
> >> +#define CORE_DIG_DLANE_1_RW_CFG_2			0x6404U
> >> +#define CORE_DIG_DLANE_1_RW_LP_0			0x6480U
> >> +#define CORE_DIG_DLANE_1_RW_LP_1			0x6482U
> >> +#define CORE_DIG_DLANE_1_RW_LP_2			0x6484U
> >> +#define CORE_DIG_DLANE_1_R_LP_0				0x64a0U
> >> +#define CORE_DIG_DLANE_1_R_LP_1				0x64a2U
> >> +#define CORE_DIG_DLANE_1_R_HS_TX_0			0x64e0U
> >> +#define CORE_DIG_DLANE_1_RW_HS_RX_0			0x6500U
> >> +#define CORE_DIG_DLANE_1_RW_HS_RX_1			0x6502U
> >> +#define CORE_DIG_DLANE_1_RW_HS_RX_2			0x6504U
> >> +#define CORE_DIG_DLANE_1_RW_HS_RX_3			0x6506U
> >> +#define CORE_DIG_DLANE_1_RW_HS_RX_4			0x6508U
> >> +#define CORE_DIG_DLANE_1_RW_HS_RX_5			0x650aU
> >> +#define CORE_DIG_DLANE_1_RW_HS_RX_6			0x650cU
> >> +#define CORE_DIG_DLANE_1_RW_HS_RX_7			0x650eU
> >> +#define CORE_DIG_DLANE_1_RW_HS_RX_8			0x6510U
> >> +#define CORE_DIG_DLANE_1_RW_HS_RX_9			0x6512U
> >> +#define CORE_DIG_DLANE_1_R_HS_RX_0			0x6520U
> >> +#define CORE_DIG_DLANE_1_R_HS_RX_1			0x6522U
> >> +#define CORE_DIG_DLANE_1_R_HS_RX_2			0x6524U
> >> +#define CORE_DIG_DLANE_1_R_HS_RX_3			0x6526U
> >> +#define CORE_DIG_DLANE_1_R_HS_RX_4			0x6528U
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_0			0x6600U
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_1			0x6602U
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_2			0x6604U
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_3			0x6606U
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_4			0x6608U
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_5			0x660aU
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_6			0x660cU
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_7			0x660eU
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_8			0x6610U
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_9			0x6612U
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_10			0x6614U
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_11			0x6616U
> >> +#define CORE_DIG_DLANE_1_RW_HS_TX_12			0x6618U
> >> +#define CORE_DIG_DLANE_2_RW_CFG_0			0x6800U
> >> +#define CORE_DIG_DLANE_2_RW_CFG_1			0x6802U
> >> +#define CORE_DIG_DLANE_2_RW_CFG_2			0x6804U
> >> +#define CORE_DIG_DLANE_2_RW_LP_0			0x6880U
> >> +#define CORE_DIG_DLANE_2_RW_LP_1			0x6882U
> >> +#define CORE_DIG_DLANE_2_RW_LP_2			0x6884U
> >> +#define CORE_DIG_DLANE_2_R_LP_0				0x68a0U
> >> +#define CORE_DIG_DLANE_2_R_LP_1				0x68a2U
> >> +#define CORE_DIG_DLANE_2_R_HS_TX_0			0x68e0U
> >> +#define CORE_DIG_DLANE_2_RW_HS_RX_0			0x6900U
> >> +#define CORE_DIG_DLANE_2_RW_HS_RX_1			0x6902U
> >> +#define CORE_DIG_DLANE_2_RW_HS_RX_2			0x6904U
> >> +#define CORE_DIG_DLANE_2_RW_HS_RX_3			0x6906U
> >> +#define CORE_DIG_DLANE_2_RW_HS_RX_4			0x6908U
> >> +#define CORE_DIG_DLANE_2_RW_HS_RX_5			0x690aU
> >> +#define CORE_DIG_DLANE_2_RW_HS_RX_6			0x690cU
> >> +#define CORE_DIG_DLANE_2_RW_HS_RX_7			0x690eU
> >> +#define CORE_DIG_DLANE_2_RW_HS_RX_8			0x6910U
> >> +#define CORE_DIG_DLANE_2_RW_HS_RX_9			0x6912U
> >> +#define CORE_DIG_DLANE_2_R_HS_RX_0			0x6920U
> >> +#define CORE_DIG_DLANE_2_R_HS_RX_1			0x6922U
> >> +#define CORE_DIG_DLANE_2_R_HS_RX_2			0x6924U
> >> +#define CORE_DIG_DLANE_2_R_HS_RX_3			0x6926U
> >> +#define CORE_DIG_DLANE_2_R_HS_RX_4			0x6928U
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_0			0x6a00U
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_1			0x6a02U
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_2			0x6a04U
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_3			0x6a06U
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_4			0x6a08U
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_5			0x6a0aU
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_6			0x6a0cU
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_7			0x6a0eU
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_8			0x6a10U
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_9			0x6a12U
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_10			0x6a14U
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_11			0x6a16U
> >> +#define CORE_DIG_DLANE_2_RW_HS_TX_12			0x6a18U
> >> +#define CORE_DIG_DLANE_3_RW_CFG_0			0x6c00U
> >> +#define CORE_DIG_DLANE_3_RW_CFG_1			0x6c02U
> >> +#define CORE_DIG_DLANE_3_RW_CFG_2			0x6c04U
> >> +#define CORE_DIG_DLANE_3_RW_LP_0			0x6c80U
> >> +#define CORE_DIG_DLANE_3_RW_LP_1			0x6c82U
> >> +#define CORE_DIG_DLANE_3_RW_LP_2			0x6c84U
> >> +#define CORE_DIG_DLANE_3_R_LP_0				0x6ca0U
> >> +#define CORE_DIG_DLANE_3_R_LP_1				0x6ca2U
> >> +#define CORE_DIG_DLANE_3_R_HS_TX_0			0x6ce0U
> >> +#define CORE_DIG_DLANE_3_RW_HS_RX_0			0x6d00U
> >> +#define CORE_DIG_DLANE_3_RW_HS_RX_1			0x6d02U
> >> +#define CORE_DIG_DLANE_3_RW_HS_RX_2			0x6d04U
> >> +#define CORE_DIG_DLANE_3_RW_HS_RX_3			0x6d06U
> >> +#define CORE_DIG_DLANE_3_RW_HS_RX_4			0x6d08U
> >> +#define CORE_DIG_DLANE_3_RW_HS_RX_5			0x6d0aU
> >> +#define CORE_DIG_DLANE_3_RW_HS_RX_6			0x6d0cU
> >> +#define CORE_DIG_DLANE_3_RW_HS_RX_7			0x6d0eU
> >> +#define CORE_DIG_DLANE_3_RW_HS_RX_8			0x6d10U
> >> +#define CORE_DIG_DLANE_3_RW_HS_RX_9			0x6d12U
> >> +#define CORE_DIG_DLANE_3_R_HS_RX_0			0x6d20U
> >> +#define CORE_DIG_DLANE_3_R_HS_RX_1			0x6d22U
> >> +#define CORE_DIG_DLANE_3_R_HS_RX_2			0x6d24U
> >> +#define CORE_DIG_DLANE_3_R_HS_RX_3			0x6d26U
> >> +#define CORE_DIG_DLANE_3_R_HS_RX_4			0x6d28U
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_0			0x6e00U
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_1			0x6e02U
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_2			0x6e04U
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_3			0x6e06U
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_4			0x6e08U
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_5			0x6e0aU
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_6			0x6e0cU
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_7			0x6e0eU
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_8			0x6e10U
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_9			0x6e12U
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_10			0x6e14U
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_11			0x6e16U
> >> +#define CORE_DIG_DLANE_3_RW_HS_TX_12			0x6e18U
> >> +#define CORE_DIG_DLANE_CLK_RW_CFG_0			0x7000U
> >> +#define CORE_DIG_DLANE_CLK_RW_CFG_1			0x7002U
> >> +#define CORE_DIG_DLANE_CLK_RW_CFG_2			0x7004U
> >> +#define CORE_DIG_DLANE_CLK_RW_LP_0			0x7080U
> >> +#define CORE_DIG_DLANE_CLK_RW_LP_1			0x7082U
> >> +#define CORE_DIG_DLANE_CLK_RW_LP_2			0x7084U
> >> +#define CORE_DIG_DLANE_CLK_R_LP_0			0x70a0U
> >> +#define CORE_DIG_DLANE_CLK_R_LP_1			0x70a2U
> >> +#define CORE_DIG_DLANE_CLK_R_HS_TX_0			0x70e0U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_0			0x7100U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_1			0x7102U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_2			0x7104U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_3			0x7106U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_4			0x7108U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_5			0x710aU
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_6			0x710cU
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_7			0x710eU
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_8			0x7110U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_9			0x7112U
> >> +#define CORE_DIG_DLANE_CLK_R_HS_RX_0			0x7120U
> >> +#define CORE_DIG_DLANE_CLK_R_HS_RX_1			0x7122U
> >> +#define CORE_DIG_DLANE_CLK_R_HS_RX_2			0x7124U
> >> +#define CORE_DIG_DLANE_CLK_R_HS_RX_3			0x7126U
> >> +#define CORE_DIG_DLANE_CLK_R_HS_RX_4			0x7128U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_0			0x7200U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_1			0x7202U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_2			0x7204U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_3			0x7206U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_4			0x7208U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_5			0x720aU
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_6			0x720cU
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_7			0x720eU
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_8			0x7210U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_9			0x7212U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_10			0x7214U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_11			0x7216U
> >> +#define CORE_DIG_DLANE_CLK_RW_HS_TX_12			0x7218U
> >> +#define PPI_RW_CPHY_TRIO0_LBERT_0			0x8000U
> >> +#define PPI_RW_CPHY_TRIO0_LBERT_1			0x8002U
> >> +#define PPI_R_CPHY_TRIO0_LBERT_0			0x8004U
> >> +#define PPI_R_CPHY_TRIO0_LBERT_1			0x8006U
> >> +#define PPI_RW_CPHY_TRIO0_SPARE				0x8008U
> >> +#define PPI_RW_CPHY_TRIO1_LBERT_0			0x8400U
> >> +#define PPI_RW_CPHY_TRIO1_LBERT_1			0x8402U
> >> +#define PPI_R_CPHY_TRIO1_LBERT_0			0x8404U
> >> +#define PPI_R_CPHY_TRIO1_LBERT_1			0x8406U
> >> +#define PPI_RW_CPHY_TRIO1_SPARE				0x8408U
> >> +#define PPI_RW_CPHY_TRIO2_LBERT_0			0x8800U
> >> +#define PPI_RW_CPHY_TRIO2_LBERT_1			0x8802U
> >> +#define PPI_R_CPHY_TRIO2_LBERT_0			0x8804U
> >> +#define PPI_R_CPHY_TRIO2_LBERT_1			0x8806U
> >> +#define PPI_RW_CPHY_TRIO2_SPARE				0x8808U
> >> +#define CORE_DIG_CLANE_0_RW_CFG_0			0xa000U
> >> +#define CORE_DIG_CLANE_0_RW_CFG_2			0xa004U
> >> +#define CORE_DIG_CLANE_0_RW_LP_0			0xa080U
> >> +#define CORE_DIG_CLANE_0_RW_LP_1			0xa082U
> >> +#define CORE_DIG_CLANE_0_RW_LP_2			0xa084U
> >> +#define CORE_DIG_CLANE_0_R_LP_0				0xa0a0U
> >> +#define CORE_DIG_CLANE_0_R_LP_1				0xa0a2U
> >> +#define CORE_DIG_CLANE_0_RW_HS_RX_0			0xa100U
> >> +#define CORE_DIG_CLANE_0_RW_HS_RX_1			0xa102U
> >> +#define CORE_DIG_CLANE_0_RW_HS_RX_2			0xa104U
> >> +#define CORE_DIG_CLANE_0_RW_HS_RX_3			0xa106U
> >> +#define CORE_DIG_CLANE_0_RW_HS_RX_4			0xa108U
> >> +#define CORE_DIG_CLANE_0_RW_HS_RX_5			0xa10aU
> >> +#define CORE_DIG_CLANE_0_RW_HS_RX_6			0xa10cU
> >> +#define CORE_DIG_CLANE_0_R_RX_0				0xa120U
> >> +#define CORE_DIG_CLANE_0_R_RX_1				0xa122U
> >> +#define CORE_DIG_CLANE_0_R_TX_0				0xa124U
> >> +#define CORE_DIG_CLANE_0_R_RX_2				0xa126U
> >> +#define CORE_DIG_CLANE_0_R_RX_3				0xa128U
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_0			0xa200U
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_1			0xa202U
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_2			0xa204U
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_3			0xa206U
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_4			0xa208U
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_5			0xa20aU
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_6			0xa20cU
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_7			0xa20eU
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_8			0xa210U
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_9			0xa212U
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_10			0xa214U
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_11			0xa216U
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_12			0xa218U
> >> +#define CORE_DIG_CLANE_0_RW_HS_TX_13			0xa21aU
> >> +#define CORE_DIG_CLANE_1_RW_CFG_0			0xa400U
> >> +#define CORE_DIG_CLANE_1_RW_CFG_2			0xa404U
> >> +#define CORE_DIG_CLANE_1_RW_LP_0			0xa480U
> >> +#define CORE_DIG_CLANE_1_RW_LP_1			0xa482U
> >> +#define CORE_DIG_CLANE_1_RW_LP_2			0xa484U
> >> +#define CORE_DIG_CLANE_1_R_LP_0				0xa4a0U
> >> +#define CORE_DIG_CLANE_1_R_LP_1				0xa4a2U
> >> +#define CORE_DIG_CLANE_1_RW_HS_RX_0			0xa500U
> >> +#define CORE_DIG_CLANE_1_RW_HS_RX_1			0xa502U
> >> +#define CORE_DIG_CLANE_1_RW_HS_RX_2			0xa504U
> >> +#define CORE_DIG_CLANE_1_RW_HS_RX_3			0xa506U
> >> +#define CORE_DIG_CLANE_1_RW_HS_RX_4			0xa508U
> >> +#define CORE_DIG_CLANE_1_RW_HS_RX_5			0xa50aU
> >> +#define CORE_DIG_CLANE_1_RW_HS_RX_6			0xa50cU
> >> +#define CORE_DIG_CLANE_1_R_RX_0				0xa520U
> >> +#define CORE_DIG_CLANE_1_R_RX_1				0xa522U
> >> +#define CORE_DIG_CLANE_1_R_TX_0				0xa524U
> >> +#define CORE_DIG_CLANE_1_R_RX_2				0xa526U
> >> +#define CORE_DIG_CLANE_1_R_RX_3				0xa528U
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_0			0xa600U
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_1			0xa602U
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_2			0xa604U
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_3			0xa606U
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_4			0xa608U
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_5			0xa60aU
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_6			0xa60cU
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_7			0xa60eU
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_8			0xa610U
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_9			0xa612U
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_10			0xa614U
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_11			0xa616U
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_12			0xa618U
> >> +#define CORE_DIG_CLANE_1_RW_HS_TX_13			0xa61aU
> >> +#define CORE_DIG_CLANE_2_RW_CFG_0			0xa800U
> >> +#define CORE_DIG_CLANE_2_RW_CFG_2			0xa804U
> >> +#define CORE_DIG_CLANE_2_RW_LP_0			0xa880U
> >> +#define CORE_DIG_CLANE_2_RW_LP_1			0xa882U
> >> +#define CORE_DIG_CLANE_2_RW_LP_2			0xa884U
> >> +#define CORE_DIG_CLANE_2_R_LP_0				0xa8a0U
> >> +#define CORE_DIG_CLANE_2_R_LP_1				0xa8a2U
> >> +#define CORE_DIG_CLANE_2_RW_HS_RX_0			0xa900U
> >> +#define CORE_DIG_CLANE_2_RW_HS_RX_1			0xa902U
> >> +#define CORE_DIG_CLANE_2_RW_HS_RX_2			0xa904U
> >> +#define CORE_DIG_CLANE_2_RW_HS_RX_3			0xa906U
> >> +#define CORE_DIG_CLANE_2_RW_HS_RX_4			0xa908U
> >> +#define CORE_DIG_CLANE_2_RW_HS_RX_5			0xa90aU
> >> +#define CORE_DIG_CLANE_2_RW_HS_RX_6			0xa90cU
> >> +#define CORE_DIG_CLANE_2_R_RX_0				0xa920U
> >> +#define CORE_DIG_CLANE_2_R_RX_1				0xa922U
> >> +#define CORE_DIG_CLANE_2_R_TX_0				0xa924U
> >> +#define CORE_DIG_CLANE_2_R_RX_2				0xa926U
> >> +#define CORE_DIG_CLANE_2_R_RX_3				0xa928U
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_0			0xaa00U
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_1			0xaa02U
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_2			0xaa04U
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_3			0xaa06U
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_4			0xaa08U
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_5			0xaa0aU
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_6			0xaa0cU
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_7			0xaa0eU
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_8			0xaa10U
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_9			0xaa12U
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_10			0xaa14U
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_11			0xaa16U
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_12			0xaa18U
> >> +#define CORE_DIG_CLANE_2_RW_HS_TX_13			0xaa1aU
> >> +
> >> +/* dwc csi host controller registers */
> >> +#define IS_IO_CSI2_HOST_BASE(i)			(IS_IO_BASE + 0x40000U + \
> >> +						 0x2000U * (i))
> >> +#define VERSION					0
> > 
> > I wonder if this HCI has a version? Perhaps a driver on its own would be
> > nice, but that consideration can be left for later I think.
> > 
> >> +#define N_LANES					0x4U
> >> +#define CSI2_RESETN				0x8U
> >> +#define INT_ST_MAIN				0xcU
> >> +#define DATA_IDS_1				0x10U
> >> +#define DATA_IDS_2				0x14U
> >> +#define CDPHY_MODE				0x1cU
> >> +#define DATA_IDS_VC_1				0x30U
> >> +#define DATA_IDS_VC_2				0x34U
> >> +#define PHY_SHUTDOWNZ				0x40U
> >> +#define DPHY_RSTZ				0x44U
> >> +#define PHY_RX					0x48U
> >> +#define PHY_STOPSTATE				0x4cU
> >> +#define PHY_TEST_CTRL0				0x50U
> >> +#define PHY_TEST_CTRL1				0x54U
> >> +#define PPI_PG_PATTERN_VRES			0x60U
> >> +#define PPI_PG_PATTERN_HRES			0x64U
> >> +#define PPI_PG_CONFIG				0x68U
> >> +#define PPI_PG_ENABLE				0x6cU
> >> +#define PPI_PG_STATUS				0x70U
> >> +#define VC_EXTENSION				0xc8U
> >> +#define PHY_CAL					0xccU
> >> +#define INT_ST_PHY_FATAL			0xe0U
> >> +#define INT_MSK_PHY_FATAL			0xe4U
> >> +#define INT_FORCE_PHY_FATAL			0xe8U
> >> +#define INT_ST_PKT_FATAL			0xf0U
> >> +#define INT_MSK_PKT_FATAL			0xf4U
> >> +#define INT_FORCE_PKT_FATAL			0xf8U
> >> +#define INT_ST_PHY				0x110U
> >> +#define INT_MSK_PHY				0x114U
> >> +#define INT_FORCE_PHY				0x118U
> >> +#define INT_ST_LINE				0x130U
> >> +#define INT_MSK_LINE				0x134U
> >> +#define INT_FORCE_LINE				0x138U
> >> +#define INT_ST_BNDRY_FRAME_FATAL		0x280U
> >> +#define INT_MSK_BNDRY_FRAME_FATAL		0x284U
> >> +#define INT_FORCE_BNDRY_FRAME_FATAL		0x288U
> >> +#define INT_ST_SEQ_FRAME_FATAL			0x290U
> >> +#define INT_MSK_SEQ_FRAME_FATAL			0x294U
> >> +#define INT_FORCE_SEQ_FRAME_FATAL		0x298U
> >> +#define INT_ST_CRC_FRAME_FATAL			0x2a0U
> >> +#define INT_MSK_CRC_FRAME_FATAL			0x2a4U
> >> +#define INT_FORCE_CRC_FRAME_FATAL		0x2a8U
> >> +#define INT_ST_PLD_CRC_FATAL			0x2b0U
> >> +#define INT_MSK_PLD_CRC_FATAL			0x2b4U
> >> +#define INT_FORCE_PLD_CRC_FATAL			0x2b8U
> >> +#define INT_ST_DATA_ID				0x2c0U
> >> +#define INT_MSK_DATA_ID				0x2c4U
> >> +#define INT_FORCE_DATA_ID			0x2c8U
> >> +#define INT_ST_ECC_CORRECTED			0x2d0U
> >> +#define INT_MSK_ECC_CORRECTED			0x2d4U
> >> +#define INT_FORCE_ECC_CORRECTED			0x2d8U
> >> +#define SCRAMBLING				0x300U
> >> +#define SCRAMBLING_SEED1			0x304U
> >> +#define SCRAMBLING_SEED2			0x308U
> >> +#define SCRAMBLING_SEED3			0x30cU
> >> +#define SCRAMBLING_SEED4			0x310U
> >> +#define SCRAMBLING				0x300U
> >> +
> >> +#define IS_IO_CSI2_ADPL_PORT_BASE(i)		(IS_IO_BASE + 0x40800U + \
> >> +						 0x2000U * (i))
> >> +#define CSI2_ADPL_INPUT_MODE			0
> >> +#define CSI2_ADPL_CSI_RX_ERR_IRQ_CLEAR_EN	0x4U
> >> +#define CSI2_ADPL_CSI_RX_ERR_IRQ_CLEAR_ADDR	0x8U
> >> +#define CSI2_ADPL_CSI_RX_ERR_IRQ_STATUS		0xcU
> >> +#define CSI2_ADPL_IRQ_CTL_COMMON_STATUS		0xa4U
> >> +#define CSI2_ADPL_IRQ_CTL_COMMON_CLEAR		0xa8U
> >> +#define CSI2_ADPL_IRQ_CTL_COMMON_ENABLE		0xacU
> >> +#define CSI2_ADPL_IRQ_CTL_FS_STATUS		0xbcU
> >> +#define CSI2_ADPL_IRQ_CTL_FS_CLEAR		0xc0U
> >> +#define CSI2_ADPL_IRQ_CTL_FS_ENABLE		0xc4U
> >> +#define CSI2_ADPL_IRQ_CTL_FE_STATUS		0xc8U
> >> +#define CSI2_ADPL_IRQ_CTL_FE_CLEAR		0xccU
> >> +#define CSI2_ADPL_IRQ_CTL_FE_ENABLE		0xd0U
> >> +
> >> +/* software control the legacy csi irq */
> >> +#define IS_IO_CSI2_ERR_LEGACY_IRQ_CTL_BASE(i)	(IS_IO_BASE + 0x40c00U + \
> >> +						 0x2000U * (i))
> >> +#define IS_IO_CSI2_SYNC_LEGACY_IRQ_CTL_BASE(i)	(IS_IO_BASE + 0x40d00U + \
> >> +						 0x2000U * (i))
> >> +#define IS_IO_CSI2_LEGACY_IRQ_CTRL_BASE		(IS_IO_BASE + 0x49000U)
> >> +#define IS_IO_CSI2_IRQ_CTRL_BASE		(IS_IO_BASE + 0x4e100)
> >> +
> >> +#define IRQ_CTL_EDGE				0
> >> +#define IRQ_CTL_MASK				0x4U
> >> +#define IRQ_CTL_STATUS				0x8U
> >> +#define IRQ_CTL_CLEAR				0xcU
> >> +#define IRQ_CTL_ENABLE				0x10U
> >> +/* FE irq for PTL */
> >> +#define IRQ1_CTL_MASK				0x14U
> >> +#define IRQ1_CTL_STATUS				0x18U
> >> +#define IRQ1_CTL_CLEAR				0x1cU
> >> +#define IRQ1_CTL_ENABLE				0x20U
> >> +
> >> +/* software to set the clock gate to use the port or mgc */
> >> +#define IS_IO_GPREGS_BASE			(IS_IO_BASE + 0x49200U)
> >> +#define SRST_PORT_ARB				0
> >> +#define SRST_MGC				0x4U
> >> +#define SRST_WIDTH_CONV				0x8U
> >> +#define SRST_CSI_IRQ				0xcU
> >> +#define SRST_CSI_LEGACY_IRQ			0x10U
> >> +#define CLK_EN_TXCLKESC				0x14U
> >> +#define CLK_DIV_FACTOR_IS_CLK			0x18U
> >> +#define CLK_DIV_FACTOR_APB_CLK			0x1cU
> >> +#define CSI_PORT_CLK_GATE			0x20U
> >> +#define CSI_PORTAB_AGGREGATION			0x24U
> >> +#define MGC_CLK_GATE				0x2cU
> >> +#define CG_CTRL_BITS				0x3cU
> >> +#define SPARE_RW				0xf8U
> >> +#define SPARE_RO				0xfcU
> >> +
> >> +#define IS_IO_CSI2_MPF_PORT_BASE(i)		(IS_IO_BASE + 0x53000U + \
> >> +						 0x1000U * (i))
> >> +#define MPF_16_IRQ_CNTRL_STATUS			0x238U
> >> +#define MPF_16_IRQ_CNTRL_CLEAR			0x23cU
> >> +#define MPF_16_IRQ_CNTRL_ENABLE			0x240U
> >> +
> >> +/* software config the phy */
> >> +#define IS_IO_CSI2_GPREGS_BASE		(IS_IO_BASE + 0x53400U)
> >> +#define IPU8_IS_IO_CSI2_GPREGS_BASE	(IS_IO_BASE + 0x40e00U)
> >> +#define CSI_ADAPT_LAYER_SRST		0
> >> +#define MPF_SRST_RST			0x4U
> >> +#define CSI_ERR_IRQ_CTRL_SRST		0x8U
> >> +#define CSI_SYNC_RC_SRST		0xcU
> >> +#define CSI_CG_CTRL_BITS		0x10U
> >> +#define SOC_CSI2HOST_SELECT		0x14U
> >> +#define PHY_RESET			0x18U
> >> +#define PHY_SHUTDOWN			0x1cU
> >> +#define PHY_MODE			0x20U
> >> +#define PHY_READY			0x24U
> >> +#define PHY_CLK_LANE_FORCE_CONTROL	0x28U
> >> +#define PHY_CLK_LANE_CONTROL		0x2cU
> >> +#define PHY_CLK_LANE_STATUS		0x30U
> >> +#define PHY_LANE_RX_ESC_REQ		0x34U
> >> +#define PHY_LANE_RX_ESC_DATA		0x38U
> >> +#define PHY_LANE_TURNDISABLE		0x3cU
> >> +#define PHY_LANE_DIRECTION		0x40U
> >> +#define PHY_LANE_FORCE_CONTROL		0x44U
> >> +#define PHY_LANE_CONTROL_EN		0x48U
> >> +#define PHY_LANE_CONTROL_DATAWIDTH	0x4cU
> >> +#define PHY_LANE_STATUS			0x50U
> >> +#define PHY_LANE_ERR			0x54U
> >> +#define PHY_LANE_RXALP			0x58U
> >> +#define PHY_LANE_RXALP_NIBBLE		0x5cU
> >> +#define PHY_PARITY_ERROR		0x60U
> >> +#define PHY_DEBUG_REGS_CLK_GATE_EN	0x64U
> >> +#define SPARE_RW			0xf8U
> >> +#define SPARE_RO			0xfcU
> >> +
> >> +/* software not touch */
> >> +#define PORT_ARB_BASE				(IS_IO_BASE + 0x4e000)
> >> +#define PORT_ARB_IRQ_CTL_STATUS			0x4U
> >> +#define PORT_ARB_IRQ_CTL_CLEAR			0x8U
> >> +#define PORT_ARB_IRQ_CTL_ENABLE			0xcU
> >> +
> >> +#define MGC_PPC					4U
> >> +#define MGC_DTYPE_RAW(i)			(((i) - 8) / 2)
> >> +#define IS_IO_MGC_BASE				(IS_IO_BASE + 0x48000U)
> >> +#define MGC_KICK				0
> >> +#define MGC_ASYNC_STOP				0x4U
> >> +#define MGC_PORT_OFFSET				0x100U
> >> +#define MGC_CSI_PORT_MAP(i)			(0x8 + (i) * 0x4)
> >> +#define MGC_MG_PORT(i)				(IS_IO_MGC_BASE +	\
> >> +						 (i) * MGC_PORT_OFFSET)
> >> +/* per mgc instance */
> >> +#define MGC_MG_CSI_ADAPT_LAYER_TYPE		0x28U
> >> +#define MGC_MG_MODE				0x2cU
> >> +#define MGC_MG_INIT_COUNTER			0x30U
> >> +#define MGC_MG_MIPI_VC				0x34U
> >> +#define MGC_MG_MIPI_DTYPES			0x38U
> >> +#define MGC_MG_MULTI_DTYPES_MODE		0x3cU
> >> +#define MGC_MG_NOF_FRAMES			0x40U
> >> +#define MGC_MG_FRAME_DIM			0x44U
> >> +#define MGC_MG_HBLANK				0x48U
> >> +#define MGC_MG_VBLANK				0x4cU
> >> +#define MGC_MG_TPG_MODE				0x50U
> >> +#define MGC_MG_TPG_R0				0x54U
> >> +#define MGC_MG_TPG_G0				0x58U
> >> +#define MGC_MG_TPG_B0				0x5cU
> >> +#define MGC_MG_TPG_R1				0x60U
> >> +#define MGC_MG_TPG_G1				0x64U
> >> +#define MGC_MG_TPG_B1				0x68U
> >> +#define MGC_MG_TPG_FACTORS			0x6cU
> >> +#define MGC_MG_TPG_MASKS			0x70U
> >> +#define MGC_MG_TPG_XY_MASK			0x74U
> >> +#define MGC_MG_TPG_TILE_DIM			0x78U
> >> +#define MGC_MG_PRBS_LFSR_INIT_0			0x7cU
> >> +#define MGC_MG_PRBS_LFSR_INIT_1			0x80U
> >> +#define MGC_MG_SYNC_STOP_POINT			0x84U
> >> +#define MGC_MG_SYNC_STOP_POINT_LOC		0x88U
> >> +#define MGC_MG_ERR_INJECT			0x8cU
> >> +#define MGC_MG_ERR_LOCATION			0x90U
> >> +#define MGC_MG_DTO_SPEED_CTRL_EN		0x94U
> >> +#define MGC_MG_DTO_SPEED_CTRL_INCR_VAL		0x98U
> >> +#define MGC_MG_HOR_LOC_STTS			0x9cU
> >> +#define MGC_MG_VER_LOC_STTS			0xa0U
> >> +#define MGC_MG_FRAME_NUM_STTS			0xa4U
> >> +#define MGC_MG_BUSY_STTS			0xa8U
> >> +#define MGC_MG_STOPPED_STTS			0xacU
> >> +/* tile width and height in pixels for Chess board and Color palette */
> >> +#define MGC_TPG_TILE_WIDTH			64U
> >> +#define MGC_TPG_TILE_HEIGHT			64U
> >> +
> >> +#define IPU_CSI_PORT_A_ADDR_OFFSET		0
> >> +#define IPU_CSI_PORT_B_ADDR_OFFSET		0
> >> +#define IPU_CSI_PORT_C_ADDR_OFFSET		0
> >> +#define IPU_CSI_PORT_D_ADDR_OFFSET		0
> > 
> > All 0?
> 
> Yes, the register offset here is actually useless. As the IPU7 ISYS
> registers are grouped by component instead of port number.
> 
> 		offset = IS_IO_CSI2_ERR_LEGACY_IRQ_CTL_BASE(csi2->port);
> 		mask = IPU7_CSI_RX_ERROR_IRQ_MASK;
> 		writel(mask, csi2->base + offset + IRQ_CTL_CLEAR);
> 
> But we still keep the defines to be compatible with IPU6.

No, just no. It's completely pointless to keep such macros around.

> 
> > 
> >> +
> >> +/*
> >> + * 0 - CSI RX Port 0 interrupt;
> >> + * 1 - MPF Port 0 interrupt;
> >> + * 2 - CSI RX Port 1 interrupt;
> >> + * 3 - MPF Port 1 interrupt;
> >> + * 4 - CSI RX Port 2 interrupt;
> >> + * 5 - MPF Port 2 interrupt;
> >> + * 6 - CSI RX Port 3 interrupt;
> >> + * 7 - MPF Port 3 interrupt;
> >> + * 8 - Port ARB FIFO 0 overflow;
> >> + * 9 - Port ARB FIFO 1 overflow;
> >> + * 10 - Port ARB FIFO 2 overflow;
> >> + * 11 - Port ARB FIFO 3 overflow;
> >> + * 12 - isys_cfgnoc_err_probe_intl;
> >> + * 13-15 - reserved
> >> + */
> >> +#define IPU7_CSI_IS_IO_IRQ_MASK		0xffffU
> >> +
> >> +/* Adapter layer irq */
> >> +#define IPU7_CSI_ADPL_IRQ_MASK		0xffffU
> >> +
> >> +/* sw irq from legacy irq control
> > 
> > /*
> >  *
> > 
> >> + * legacy irq status
> >> + * IPU7
> >> + * 0 - CSI Port 0 error interrupt
> >> + * 1 - CSI Port 0 sync interrupt
> >> + * 2 - CSI Port 1 error interrupt
> >> + * 3 - CSI Port 1 sync interrupt
> >> + * 4 - CSI Port 2 error interrupt
> >> + * 5 - CSI Port 2 sync interrupt
> >> + * 6 - CSI Port 3 error interrupt
> >> + * 7 - CSI Port 3 sync interrupt
> >> + * IPU7P5
> >> + * 0 - CSI Port 0 error interrupt
> >> + * 1 - CSI Port 0 fs interrupt
> >> + * 2 - CSI Port 0 fe interrupt
> >> + * 3 - CSI Port 1 error interrupt
> >> + * 4 - CSI Port 1 fs interrupt
> >> + * 5 - CSI Port 1 fe interrupt
> >> + * 6 - CSI Port 2 error interrupt
> >> + * 7 - CSI Port 2 fs interrupt
> >> + * 8 - CSI Port 2 fe interrupt
> >> + */
> >> +#define IPU7_CSI_RX_LEGACY_IRQ_MASK		0x1ffU
> >> +
> >> +/* legacy error status per port
> >> + * 0 - Error handler FIFO full;
> >> + * 1 - Reserved Short Packet encoding detected;
> >> + * 2 - Reserved Long Packet encoding detected;
> >> + * 3 - Received packet is too short (fewer data words than specified in header);
> >> + * 4 - Received packet is too long (more data words than specified in header);
> >> + * 5 - Short packet discarded due to errors;
> >> + * 6 - Long packet discarded due to errors;
> >> + * 7 - CSI Combo Rx interrupt;
> >> + * 8 - IDI CDC FIFO overflow; remaining bits are reserved and tied to 0;
> >> + */
> >> +#define IPU7_CSI_RX_ERROR_IRQ_MASK		0xfffU
> >> +
> >> +/*
> >> + * 0 - VC0 frame start received
> >> + * 1 - VC0 frame end received
> >> + * 2 - VC1 frame start received
> >> + * 3 - VC1 frame end received
> >> + * 4 - VC2 frame start received
> >> + * 5 - VC2 frame end received
> >> + * 6 - VC3 frame start received
> >> + * 7 - VC3 frame end received
> >> + * 8 - VC4 frame start received
> >> + * 9 - VC4 frame end received
> >> + * 10 - VC5 frame start received
> >> + * 11 - VC5 frame end received
> >> + * 12 - VC6 frame start received
> >> + * 13 - VC6 frame end received
> >> + * 14 - VC7 frame start received
> >> + * 15 - VC7 frame end received
> >> + * 16 - VC8 frame start received
> >> + * 17 - VC8 frame end received
> >> + * 18 - VC9 frame start received
> >> + * 19 - VC9 frame end received
> >> + * 20 - VC10 frame start received
> >> + * 21 - VC10 frame end received
> >> + * 22 - VC11 frame start received
> >> + * 23 - VC11 frame end received
> >> + * 24 - VC12 frame start received
> >> + * 25 - VC12 frame end received
> >> + * 26 - VC13 frame start received
> >> + * 27 - VC13 frame end received
> >> + * 28 - VC14 frame start received
> >> + * 29 - VC14 frame end received
> >> + * 30 - VC15 frame start received
> >> + * 31 - VC15 frame end received
> >> + */
> >> +
> >> +#define IPU7_CSI_RX_SYNC_IRQ_MASK		0 /* 0xffffffff */
> >> +#define IPU7P5_CSI_RX_SYNC_FE_IRQ_MASK		0 /* 0xffffffff */
> >> +
> >> +#define CSI_RX_NUM_ERRORS_IN_IRQ		12U
> >> +#define CSI_RX_NUM_SYNC_IN_IRQ			32U
> >> +
> >> +enum CSI_FE_MODE_TYPE {
> >> +	CSI_FE_DPHY_MODE = 0,
> >> +	CSI_FE_CPHY_MODE = 1,
> >> +};
> >> +
> >> +enum CSI_FE_INPUT_MODE {
> >> +	CSI_SENSOR_INPUT = 0,
> >> +	CSI_MIPIGEN_INPUT = 1,
> >> +};
> >> +
> >> +enum MGC_CSI_ADPL_TYPE {
> >> +	MGC_MAPPED_2_LANES = 0,
> >> +	MGC_MAPPED_4_LANES = 1,
> >> +};
> >> +
> >> +enum CSI2HOST_SELECTION {
> >> +	CSI2HOST_SEL_SOC = 0,
> >> +	CSI2HOST_SEL_CSI2HOST = 1,
> >> +};
> >> +
> >> +#define IPU7_ISYS_LEGACY_IRQ_CSI2(port)		(0x3U << (port))
> >> +#define IPU7P5_ISYS_LEGACY_IRQ_CSI2(port)	(0x7U << (port))
> >> +
> >> +/* ---------------------------------------------------------------- */
> >> +#define CSI_REG_BASE				0x220000U
> >> +#define CSI_REG_BASE_PORT(id)			((id) * 0x1000)
> >> +
> >> +/* CSI Port General Purpose Registers */
> >> +#define CSI_REG_PORT_GPREG_SRST			0
> >> +#define CSI_REG_PORT_GPREG_CSI2_SLV_REG_SRST	0x4U
> >> +#define CSI_REG_PORT_GPREG_CSI2_PORT_CONTROL	0x8U
> >> +
> >> +#define CSI_RX_NUM_IRQ				32U
> >> +
> >> +#define IPU7_CSI_RX_SYNC_FS_VC			0x55555555U
> >> +#define IPU7_CSI_RX_SYNC_FE_VC			0xaaaaaaaaU
> >> +#define IPU7P5_CSI_RX_SYNC_FS_VC		0xffffU
> >> +#define IPU7P5_CSI_RX_SYNC_FE_VC		0xffffU
> >> +
> >> +#endif /* IPU7_ISYS_CSI2_REG_H */
> >> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
> >> new file mode 100644
> >> index 000000000000..ae504fb41464
> >> --- /dev/null
> >> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
> >> @@ -0,0 +1,542 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (C) 2013 - 2025 Intel Corporation
> >> + */
> >> +
> >> +#include <linux/atomic.h>
> >> +#include <linux/bits.h>
> >> +#include <linux/bug.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/device.h>
> >> +#include <linux/io.h>
> >> +#include <linux/minmax.h>
> >> +#include <linux/mutex.h>
> >> +#include <linux/slab.h>
> >> +
> >> +#include <media/media-entity.h>
> >> +#include <media/v4l2-ctrls.h>
> >> +#include <media/v4l2-device.h>
> >> +#include <media/v4l2-event.h>
> >> +#include <media/v4l2-subdev.h>
> >> +
> >> +#include "ipu7.h"
> >> +#include "ipu7-bus.h"
> >> +#include "ipu7-isys.h"
> >> +#include "ipu7-isys-csi2.h"
> >> +#include "ipu7-isys-csi2-regs.h"
> >> +#include "ipu7-isys-csi-phy.h"
> >> +
> >> +static const u32 csi2_supported_codes[] = {
> >> +	MEDIA_BUS_FMT_Y10_1X10,
> >> +	MEDIA_BUS_FMT_RGB565_1X16,
> >> +	MEDIA_BUS_FMT_RGB888_1X24,
> >> +	MEDIA_BUS_FMT_UYVY8_1X16,
> >> +	MEDIA_BUS_FMT_YUYV8_1X16,
> >> +	MEDIA_BUS_FMT_YUYV10_1X20,
> >> +	MEDIA_BUS_FMT_SBGGR10_1X10,
> >> +	MEDIA_BUS_FMT_SGBRG10_1X10,
> >> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> >> +	MEDIA_BUS_FMT_SRGGB10_1X10,
> >> +	MEDIA_BUS_FMT_SBGGR12_1X12,
> >> +	MEDIA_BUS_FMT_SGBRG12_1X12,
> >> +	MEDIA_BUS_FMT_SGRBG12_1X12,
> >> +	MEDIA_BUS_FMT_SRGGB12_1X12,
> >> +	MEDIA_BUS_FMT_SBGGR8_1X8,
> >> +	MEDIA_BUS_FMT_SGBRG8_1X8,
> >> +	MEDIA_BUS_FMT_SGRBG8_1X8,
> >> +	MEDIA_BUS_FMT_SRGGB8_1X8,
> >> +	0,
> >> +};
> >> +
> >> +s64 ipu7_isys_csi2_get_link_freq(struct ipu7_isys_csi2 *csi2)
> >> +{
> >> +	struct media_pad *src_pad;
> >> +
> >> +	if (!csi2)
> > 
> > Can this be NULL?
> 
> This could be NULL if the caller call wrong CSI2 number(likely coding
> problem), but the check is harmless as it can be used to avoid crash
> later.

It won't be NULL. Please just remove the check.

> 
> >
> >> +		return -EINVAL;
> >> +
> >> +	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
> >> +	if (IS_ERR(src_pad)) {
> >> +		dev_err(&csi2->isys->adev->auxdev.dev,
> >> +			"can't get source pad of %s (%ld)\n",
> >> +			csi2->asd.sd.name, PTR_ERR(src_pad));
> >> +		return PTR_ERR(src_pad);
> >> +	}
> >> +
> >> +	return v4l2_get_link_freq(src_pad, 0, 0);
> >> +}
> >> +
> >> +static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
> >> +				struct v4l2_event_subscription *sub)
> >> +{
> >> +	struct ipu7_isys_subdev *asd = to_ipu7_isys_subdev(sd);
> >> +	struct ipu7_isys_csi2 *csi2 = to_ipu7_isys_csi2(asd);
> >> +	struct device *dev = &csi2->isys->adev->auxdev.dev;
> >> +
> >> +	dev_dbg(dev, "csi2 subscribe event(type %u id %u)\n",
> >> +		sub->type, sub->id);
> >> +
> >> +	switch (sub->type) {
> >> +	case V4L2_EVENT_FRAME_SYNC:
> >> +		return v4l2_event_subscribe(fh, sub, 10, NULL);
> >> +	case V4L2_EVENT_CTRL:
> >> +		return v4l2_ctrl_subscribe_event(fh, sub);
> >> +	default:
> >> +		return -EINVAL;
> >> +	}
> >> +}
> >> +
> >> +static const struct v4l2_subdev_core_ops csi2_sd_core_ops = {
> >> +	.subscribe_event = csi2_subscribe_event,
> >> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> >> +};
> >> +
> >> +static void csi2_irq_en(struct ipu7_isys_csi2 *csi2, bool enable)

This would be actually nicer as two separate functions.

> >> +{
> >> +	struct ipu7_device *isp = csi2->isys->adev->isp;
> >> +	unsigned int offset, mask;
> >> +
> >> +	if (!enable) {
> >> +		/* disable CSI2 legacy error irq */
> >> +		offset = IS_IO_CSI2_ERR_LEGACY_IRQ_CTL_BASE(csi2->port);
> >> +		mask = IPU7_CSI_RX_ERROR_IRQ_MASK;
> >> +		writel(mask, csi2->base + offset + IRQ_CTL_CLEAR);
> >> +		writel(0, csi2->base + offset + IRQ_CTL_MASK);
> >> +		writel(0, csi2->base + offset + IRQ_CTL_ENABLE);
> >> +
> >> +		/* disable CSI2 legacy sync irq */
> >> +		offset = IS_IO_CSI2_SYNC_LEGACY_IRQ_CTL_BASE(csi2->port);
> >> +		mask = IPU7_CSI_RX_SYNC_IRQ_MASK;
> >> +		writel(mask, csi2->base + offset + IRQ_CTL_CLEAR);
> >> +		writel(0, csi2->base + offset + IRQ_CTL_MASK);
> >> +		writel(0, csi2->base + offset + IRQ_CTL_ENABLE);
> >> +
> >> +		if (!is_ipu7(isp->hw_ver)) {
> >> +			writel(mask, csi2->base + offset + IRQ1_CTL_CLEAR);
> >> +			writel(0, csi2->base + offset + IRQ1_CTL_MASK);
> >> +			writel(0, csi2->base + offset + IRQ1_CTL_ENABLE);
> >> +		}
> >> +
> >> +		return;
> >> +	}
> >> +
> >> +	/* enable CSI2 legacy error irq */
> >> +	offset = IS_IO_CSI2_ERR_LEGACY_IRQ_CTL_BASE(csi2->port);
> >> +	mask = IPU7_CSI_RX_ERROR_IRQ_MASK;
> >> +	writel(mask, csi2->base + offset + IRQ_CTL_CLEAR);
> >> +	writel(mask, csi2->base + offset + IRQ_CTL_MASK);
> >> +	writel(mask, csi2->base + offset + IRQ_CTL_ENABLE);
> >> +
> >> +	/* enable CSI2 legacy sync irq */
> >> +	offset = IS_IO_CSI2_SYNC_LEGACY_IRQ_CTL_BASE(csi2->port);
> >> +	mask = IPU7_CSI_RX_SYNC_IRQ_MASK;
> >> +	writel(mask, csi2->base + offset + IRQ_CTL_CLEAR);
> >> +	writel(mask, csi2->base + offset + IRQ_CTL_MASK);
> >> +	writel(mask, csi2->base + offset + IRQ_CTL_ENABLE);
> >> +
> >> +	mask = IPU7P5_CSI_RX_SYNC_FE_IRQ_MASK;
> >> +	if (!is_ipu7(isp->hw_ver)) {
> >> +		writel(mask, csi2->base + offset + IRQ1_CTL_CLEAR);
> >> +		writel(mask, csi2->base + offset + IRQ1_CTL_MASK);
> >> +		writel(mask, csi2->base + offset + IRQ1_CTL_ENABLE);
> >> +	}
> >> +}
> >> +
> >> +static void ipu7_isys_csi2_disable_stream(struct ipu7_isys_csi2 *csi2)
> >> +{
> >> +	struct ipu7_isys *isys = csi2->isys;
> >> +	void __iomem *isys_base = isys->pdata->base;
> >> +
> >> +	ipu7_isys_csi_phy_powerdown(csi2);
> >> +
> >> +	writel(0x4, isys_base + IS_IO_GPREGS_BASE + CLK_DIV_FACTOR_APB_CLK);
> >> +	csi2_irq_en(csi2, 0);
> >> +}
> >> +
> >> +static int ipu7_isys_csi2_enable_stream(struct ipu7_isys_csi2 *csi2)
> >> +{
> >> +	struct ipu7_isys *isys = csi2->isys;
> >> +	struct device *dev = &isys->adev->auxdev.dev;
> >> +	void __iomem *isys_base = isys->pdata->base;
> >> +	unsigned int port, nlanes, offset;
> >> +	int ret;
> >> +
> >> +	port = csi2->port;
> >> +	nlanes = csi2->nlanes;
> >> +
> >> +	offset = IS_IO_GPREGS_BASE;
> >> +	writel(0x2, isys_base + offset + CLK_DIV_FACTOR_APB_CLK);
> >> +	dev_dbg(dev, "port %u CLK_GATE = 0x%04x DIV_FACTOR_APB_CLK=0x%04x\n",
> >> +		port, readl(isys_base + offset + CSI_PORT_CLK_GATE),
> >> +		readl(isys_base + offset + CLK_DIV_FACTOR_APB_CLK));
> >> +	if (port == 0U && nlanes == 4U && !is_ipu7(isys->adev->isp->hw_ver)) {
> >> +		dev_dbg(dev, "CSI port %u in aggregation mode\n", port);
> >> +		writel(0x1, isys_base + offset + CSI_PORTAB_AGGREGATION);
> >> +	}
> >> +
> >> +	/* input is coming from CSI receiver (sensor) */
> >> +	offset = IS_IO_CSI2_ADPL_PORT_BASE(port);
> >> +	writel(CSI_SENSOR_INPUT, isys_base + offset + CSI2_ADPL_INPUT_MODE);
> >> +	writel(1, isys_base + offset + CSI2_ADPL_CSI_RX_ERR_IRQ_CLEAR_EN);
> >> +
> >> +	ret = ipu7_isys_csi_phy_powerup(csi2);
> >> +	if (ret) {
> >> +		dev_err(dev, "CSI-%d PHY power up failed %d\n", port, ret);
> >> +		return ret;
> >> +	}
> >> +	csi2_irq_en(csi2, 1);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int ipu7_isys_csi2_set_sel(struct v4l2_subdev *sd,
> >> +				  struct v4l2_subdev_state *state,
> >> +				  struct v4l2_subdev_selection *sel)
> >> +{
> >> +	struct ipu7_isys_subdev *asd = to_ipu7_isys_subdev(sd);
> >> +	struct device *dev = &asd->isys->adev->auxdev.dev;
> >> +	struct v4l2_mbus_framefmt *sink_ffmt;
> >> +	struct v4l2_mbus_framefmt *src_ffmt;
> >> +	struct v4l2_rect *crop;
> >> +
> >> +	if (sel->pad == CSI2_PAD_SINK || sel->target != V4L2_SEL_TGT_CROP)
> >> +		return -EINVAL;
> >> +
> >> +	sink_ffmt = v4l2_subdev_state_get_opposite_stream_format(state,
> >> +								 sel->pad,
> >> +								 sel->stream);
> >> +	if (!sink_ffmt)
> >> +		return -EINVAL;
> >> +
> >> +	src_ffmt = v4l2_subdev_state_get_format(state, sel->pad, sel->stream);
> >> +	if (!src_ffmt)
> >> +		return -EINVAL;
> >> +
> >> +	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
> >> +	if (!crop)
> >> +		return -EINVAL;
> >> +
> >> +	/* Only vertical cropping is supported */
> >> +	sel->r.left = 0;
> >> +	sel->r.width = sink_ffmt->width;
> >> +	/* Non-bayer formats can't be single line cropped */
> >> +	if (!ipu7_isys_is_bayer_format(sink_ffmt->code))
> >> +		sel->r.top &= ~1U;
> >> +	sel->r.height = clamp(sel->r.height & ~1U, IPU_ISYS_MIN_HEIGHT,
> >> +			      sink_ffmt->height - sel->r.top);
> >> +	*crop = sel->r;
> >> +
> >> +	/* update source pad format */
> >> +	src_ffmt->width = sel->r.width;
> >> +	src_ffmt->height = sel->r.height;
> >> +	if (ipu7_isys_is_bayer_format(sink_ffmt->code))
> >> +		src_ffmt->code = ipu7_isys_convert_bayer_order(sink_ffmt->code,
> >> +							       sel->r.left,
> >> +							       sel->r.top);
> >> +	dev_dbg(dev, "set crop for %s sel: %d,%d,%d,%d code: 0x%x\n",
> >> +		sd->name, sel->r.left, sel->r.top, sel->r.width, sel->r.height,
> >> +		src_ffmt->code);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int ipu7_isys_csi2_get_sel(struct v4l2_subdev *sd,
> >> +				  struct v4l2_subdev_state *state,
> >> +				  struct v4l2_subdev_selection *sel)
> >> +{
> >> +	struct v4l2_mbus_framefmt *sink_ffmt;
> >> +	struct v4l2_rect *crop;
> >> +	int ret = 0;
> >> +
> >> +	if (sd->entity.pads[sel->pad].flags & MEDIA_PAD_FL_SINK)
> >> +		return -EINVAL;
> >> +
> >> +	sink_ffmt = v4l2_subdev_state_get_opposite_stream_format(state,
> >> +								 sel->pad,
> >> +								 sel->stream);
> >> +	if (!sink_ffmt)
> >> +		return -EINVAL;
> >> +
> >> +	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
> >> +	if (!crop)
> >> +		return -EINVAL;
> >> +
> >> +	switch (sel->target) {
> >> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> >> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> >> +		sel->r.left = 0;
> >> +		sel->r.top = 0;
> >> +		sel->r.width = sink_ffmt->width;
> >> +		sel->r.height = sink_ffmt->height;
> >> +		break;
> >> +	case V4L2_SEL_TGT_CROP:
> >> +		sel->r = *crop;
> >> +		break;
> >> +	default:
> >> +		ret = -EINVAL;
> >> +	}
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +/*
> >> + * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
> >> + * of streams.
> >> + */
> >> +#define CSI2_SUBDEV_MAX_STREAM_ID 63
> >> +
> >> +static int ipu7_isys_csi2_enable_streams(struct v4l2_subdev *sd,
> >> +					 struct v4l2_subdev_state *state,
> >> +					 u32 pad, u64 streams_mask)
> >> +{
> >> +	struct ipu7_isys_subdev *asd = to_ipu7_isys_subdev(sd);
> >> +	struct ipu7_isys_csi2 *csi2 = to_ipu7_isys_csi2(asd);
> >> +	struct v4l2_subdev *r_sd;
> >> +	struct media_pad *r_pad;
> >> +	u32 sink_pad, sink_stream;
> >> +	int ret, i;
> >> +
> >> +	if (!csi2->stream_count) {
> >> +		dev_dbg(&csi2->isys->adev->auxdev.dev,
> >> +			"stream on CSI2-%u with %u lanes\n", csi2->port,
> >> +			csi2->nlanes);
> >> +		ret = ipu7_isys_csi2_enable_stream(csi2);
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >> +
> >> +	for (i = 0; i <= CSI2_SUBDEV_MAX_STREAM_ID; i++) {
> >> +		if (streams_mask & BIT_ULL(i))
> >> +			break;
> >> +	}
> >> +
> >> +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, i,
> >> +						    &sink_pad, &sink_stream);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	r_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> >> +	r_sd = media_entity_to_v4l2_subdev(r_pad->entity);
> >> +
> >> +	ret = v4l2_subdev_enable_streams(r_sd, r_pad->index,
> >> +					 BIT_ULL(sink_stream));
> >> +	if (!ret) {
> >> +		csi2->stream_count++;
> >> +		return 0;
> >> +	}
> >> +
> >> +	if (!csi2->stream_count)
> >> +		ipu7_isys_csi2_disable_stream(csi2);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static int ipu7_isys_csi2_disable_streams(struct v4l2_subdev *sd,
> >> +					  struct v4l2_subdev_state *state,
> >> +					  u32 pad, u64 streams_mask)
> >> +{
> >> +	struct ipu7_isys_subdev *asd = to_ipu7_isys_subdev(sd);
> >> +	struct ipu7_isys_csi2 *csi2 = to_ipu7_isys_csi2(asd);
> >> +	struct v4l2_subdev *r_sd;
> >> +	struct media_pad *r_pad;
> >> +	u32 sink_pad, sink_stream;
> >> +	int ret, i;
> >> +
> >> +	for (i = 0; i <= CSI2_SUBDEV_MAX_STREAM_ID; i++) {
> >> +		if (streams_mask & BIT_ULL(i))
> >> +			break;
> >> +	}
> >> +
> >> +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, i,
> >> +						    &sink_pad, &sink_stream);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	r_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> >> +	r_sd = media_entity_to_v4l2_subdev(r_pad->entity);
> >> +
> >> +	v4l2_subdev_disable_streams(r_sd, r_pad->index, BIT_ULL(sink_stream));
> >> +
> >> +	if (--csi2->stream_count)
> >> +		return 0;
> >> +
> >> +	dev_dbg(&csi2->isys->adev->auxdev.dev,
> >> +		"stream off CSI2-%u with %u lanes\n", csi2->port, csi2->nlanes);
> >> +
> >> +	ipu7_isys_csi2_disable_stream(csi2);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
> >> +	.get_fmt = v4l2_subdev_get_fmt,
> >> +	.set_fmt = ipu7_isys_subdev_set_fmt,
> >> +	.get_selection = ipu7_isys_csi2_get_sel,
> >> +	.set_selection = ipu7_isys_csi2_set_sel,
> >> +	.enum_mbus_code = ipu7_isys_subdev_enum_mbus_code,
> >> +	.enable_streams = ipu7_isys_csi2_enable_streams,
> >> +	.disable_streams = ipu7_isys_csi2_disable_streams,
> >> +	.set_routing = ipu7_isys_subdev_set_routing,
> >> +};
> >> +
> >> +static const struct v4l2_subdev_ops csi2_sd_ops = {
> >> +	.core = &csi2_sd_core_ops,
> >> +	.pad = &csi2_sd_pad_ops,
> >> +};
> >> +
> >> +static const struct media_entity_operations csi2_entity_ops = {
> >> +	.link_validate = v4l2_subdev_link_validate,
> >> +	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
> >> +};
> >> +
> >> +void ipu7_isys_csi2_cleanup(struct ipu7_isys_csi2 *csi2)
> >> +{
> >> +	if (!csi2->isys)
> >> +		return;
> >> +
> >> +	v4l2_device_unregister_subdev(&csi2->asd.sd);
> >> +	v4l2_subdev_cleanup(&csi2->asd.sd);
> >> +	ipu7_isys_subdev_cleanup(&csi2->asd);
> >> +	csi2->isys = NULL;
> >> +}
> >> +
> >> +int ipu7_isys_csi2_init(struct ipu7_isys_csi2 *csi2,
> >> +			struct ipu7_isys *isys,
> >> +			void __iomem *base, unsigned int index)
> >> +{
> >> +	struct device *dev = &isys->adev->auxdev.dev;
> >> +	int ret;
> >> +
> >> +	csi2->isys = isys;
> >> +	csi2->base = base;
> >> +	csi2->port = index;
> >> +
> >> +	if (!is_ipu7(isys->adev->isp->hw_ver))
> >> +		csi2->legacy_irq_mask = 0x7U << (index * 3U);
> >> +	else
> >> +		csi2->legacy_irq_mask = 0x3U << (index * 2U);
> >> +
> >> +	dev_dbg(dev, "csi-%d legacy irq mask = 0x%x\n", index,
> >> +		csi2->legacy_irq_mask);
> >> +
> >> +	csi2->asd.sd.entity.ops = &csi2_entity_ops;
> >> +	csi2->asd.isys = isys;
> >> +
> >> +	ret = ipu7_isys_subdev_init(&csi2->asd, &csi2_sd_ops, 0,
> >> +				    NR_OF_CSI2_SINK_PADS, NR_OF_CSI2_SRC_PADS);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	csi2->asd.source = (int)index;
> >> +	csi2->asd.supported_codes = csi2_supported_codes;
> >> +	snprintf(csi2->asd.sd.name, sizeof(csi2->asd.sd.name),
> >> +		 IPU_ISYS_ENTITY_PREFIX " CSI2 %u", index);
> >> +	v4l2_set_subdevdata(&csi2->asd.sd, &csi2->asd);
> >> +
> >> +	ret = v4l2_subdev_init_finalize(&csi2->asd.sd);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to init v4l2 subdev (%d)\n", ret);
> >> +		goto isys_subdev_cleanup;
> >> +	}
> >> +
> >> +	ret = v4l2_device_register_subdev(&isys->v4l2_dev, &csi2->asd.sd);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to register v4l2 subdev (%d)\n", ret);
> >> +		goto v4l2_subdev_cleanup;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +v4l2_subdev_cleanup:
> >> +	v4l2_subdev_cleanup(&csi2->asd.sd);
> >> +isys_subdev_cleanup:
> >> +	ipu7_isys_subdev_cleanup(&csi2->asd);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +void ipu7_isys_csi2_sof_event_by_stream(struct ipu7_isys_stream *stream)
> >> +{
> >> +	struct ipu7_isys_csi2 *csi2 = ipu7_isys_subdev_to_csi2(stream->asd);
> >> +	struct device *dev = &stream->isys->adev->auxdev.dev;
> >> +	struct video_device *vdev = csi2->asd.sd.devnode;
> >> +	struct v4l2_event ev = {
> >> +		.type = V4L2_EVENT_FRAME_SYNC,
> >> +	};
> >> +
> >> +	ev.id = stream->vc;
> >> +	ev.u.frame_sync.frame_sequence = atomic_fetch_inc(&stream->sequence);
> >> +	v4l2_event_queue(vdev, &ev);
> >> +
> >> +	dev_dbg(dev, "sof_event::csi2-%i sequence: %i, vc: %d\n",
> >> +		csi2->port, ev.u.frame_sync.frame_sequence, stream->vc);
> >> +}
> >> +
> >> +void ipu7_isys_csi2_eof_event_by_stream(struct ipu7_isys_stream *stream)
> >> +{
> >> +	struct ipu7_isys_csi2 *csi2 = ipu7_isys_subdev_to_csi2(stream->asd);
> >> +	struct device *dev = &stream->isys->adev->auxdev.dev;
> >> +	u32 frame_sequence = atomic_read(&stream->sequence);
> >> +
> >> +	dev_dbg(dev, "eof_event::csi2-%i sequence: %i\n",
> >> +		csi2->port, frame_sequence);
> >> +}
> >> +
> >> +int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
> >> +				   struct ipu7_isys_csi2 *csi2,
> >> +				   struct media_entity *source_entity,
> >> +				   struct v4l2_mbus_frame_desc_entry *entry,
> >> +				   int *nr_queues)
> >> +{
> >> +	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
> >> +	struct device *dev = &csi2->isys->adev->auxdev.dev;
> >> +	struct v4l2_mbus_frame_desc desc;
> >> +	struct v4l2_subdev *source;
> >> +	struct media_pad *pad;
> >> +	unsigned int i;
> >> +	int ret;
> >> +
> >> +	source = media_entity_to_v4l2_subdev(source_entity);
> >> +	if (!source)
> >> +		return -EPIPE;
> >> +
> >> +	pad = media_pad_remote_pad_first(&csi2->asd.pad[CSI2_PAD_SINK]);
> >> +	if (!pad)
> >> +		return -EPIPE;
> >> +
> >> +	ret = v4l2_subdev_call(source, pad, get_frame_desc, pad->index, &desc);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> >> +		dev_err(dev, "Unsupported frame descriptor type\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	for (i = 0; i < desc.num_entries; i++) {
> >> +		if (source_stream == desc.entry[i].stream) {
> >> +			desc_entry = &desc.entry[i];
> >> +			break;
> >> +		}
> >> +	}
> >> +
> >> +	if (!desc_entry) {
> >> +		dev_err(dev, "Failed to find stream %u from remote subdev\n",
> >> +			source_stream);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	if (desc_entry->bus.csi2.vc >= NR_OF_CSI2_VC) {
> >> +		dev_err(dev, "invalid vc %d\n", desc_entry->bus.csi2.vc);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	*entry = *desc_entry;
> >> +
> >> +	for (i = 0; i < desc.num_entries; i++) {
> >> +		if (desc_entry->bus.csi2.vc == desc.entry[i].bus.csi2.vc)
> >> +			(*nr_queues)++;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.h b/drivers/staging/media/ipu7/ipu7-isys-csi2.h
> >> new file mode 100644
> >> index 000000000000..ea4e20525d16
> >> --- /dev/null
> >> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.h
> >> @@ -0,0 +1,73 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Copyright (C) 2013 - 2025 Intel Corporation
> >> + */
> >> +
> >> +#ifndef IPU7_ISYS_CSI2_H
> >> +#define IPU7_ISYS_CSI2_H
> >> +
> >> +#include <linux/container_of.h>
> >> +#include <linux/types.h>
> >> +
> >> +#include "ipu7-isys-subdev.h"
> >> +#include "ipu7-isys-video.h"
> >> +
> >> +struct ipu7_isys;
> >> +struct ipu7_isys_csi2_pdata;
> >> +struct ipu7_isys_stream;
> >> +
> >> +#define NR_OF_CSI2_VC		16U
> >> +#define INVALID_VC_ID		-1
> >> +#define NR_OF_CSI2_SINK_PADS	1U
> >> +#define CSI2_PAD_SINK		0U
> >> +#define NR_OF_CSI2_SRC_PADS	8U
> >> +#define CSI2_PAD_SRC		1U
> >> +#define NR_OF_CSI2_PADS		(NR_OF_CSI2_SINK_PADS + NR_OF_CSI2_SRC_PADS)
> > 
> > These seem to require IPU7 prefix, too. It'd be nice to move them into a
> > struct, specific to IPU version.
> > 
> >> +
> >> +#define CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_A		0
> >> +#define CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_B		0
> >> +#define CSI2_CSI_RX_DLY_CNT_SETTLE_CLANE_A		95
> >> +#define CSI2_CSI_RX_DLY_CNT_SETTLE_CLANE_B		-8
> >> +
> >> +#define CSI2_CSI_RX_DLY_CNT_TERMEN_DLANE_A		0
> >> +#define CSI2_CSI_RX_DLY_CNT_TERMEN_DLANE_B		0
> >> +#define CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_A		85
> >> +#define CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_B		-2
> > 
> > These are the same for IPU6, aren't they?
> 
> Will remove them.

-- 
Regards,

Sakari Ailus

