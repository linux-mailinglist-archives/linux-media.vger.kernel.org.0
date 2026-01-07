Return-Path: <linux-media+bounces-50168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F224DCFF7A4
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 19:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABA2033AB3FD
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 18:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D3533123A;
	Wed,  7 Jan 2026 16:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMygYN/o"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9751033B6DB;
	Wed,  7 Jan 2026 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767804379; cv=none; b=WRkMd2JZhu/PTnaYDbks+h+KGE/EpkgJ3kwr3nd1f82jOYnlF6ExRLJAO6tB5R2taGFjRqfdHAy+PWyoL7I9YweVsgwh7jtwd2ENqjajAp7lkH8GxAJ4e3guQ/9H4poEACx3fI9rHaSTlFK1K9FG57g7KUnCMw1QA19fy79HFCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767804379; c=relaxed/simple;
	bh=asGWUIEBCiMlyaLA+26aBmnSMbEq2n0wW5oL4xyLzSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oc9vGdCxEraRHCh5Na1cw78OUC2RoMzYaos+Xlefee2OX/Qvq83KAwjsrdSLwBbcv0d7lTXmdg/xVw4UCriyiW9GMMjTEON27MZigQadI/EG4CzeBWIjxfwZzEa35AVZqErVihn2XYc9lGFgKPGrj6g6kRIEv8K6NEhtOfP7re8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMygYN/o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767804375; x=1799340375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=asGWUIEBCiMlyaLA+26aBmnSMbEq2n0wW5oL4xyLzSk=;
  b=UMygYN/oft1o3jGUNKd/rKhr5ktoFuLVHE0nCt0w//bO32ZyGkWrXqhz
   pRrg7swaeGnBa3ydWv7eKkwjfP14okh31UHI1sPTuiHYeuFYdRs4KovU5
   QQ127ItJdt75L5FBJyQlZywGy8+HyE1Y5t0C7Xlwp3xPxcj2Ll/Uxpkrv
   IdbX7eYTz4LHaUnyqaCkR+i5AwLozoLFutrfrsn0IyqwD2/XTuuXH/Ung
   OLmQq6Zd55srkC8FEm1xqhdoJCTNd8iYNsyMv6mn8sVuOOClUFz6d/VY1
   a/6+rdS1SpWbM9F6Pd8J0MWNMg0Egq8PqblZFTnmu4hP0A9xpk1YkAby7
   g==;
X-CSE-ConnectionGUID: 4d+p6IgaTCmWSb8BCZ8JdQ==
X-CSE-MsgGUID: nISqbSD9QyKpHMW+mH4r0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="94647991"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="94647991"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 08:46:10 -0800
X-CSE-ConnectionGUID: FBk4aP+lToi+FXpmYr3CHA==
X-CSE-MsgGUID: 5LmfurAmR7WWQg7QXDIx1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="202587890"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.149])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 08:46:08 -0800
Date: Wed, 7 Jan 2026 17:46:01 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: david@ixit.cz
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] media: ccs: Accommodate C-PHY into the calculation
Message-ID: <n5wknqkx2hsf5jxmrp2f6enpftdz4k3potnsfwi6cr7v36xdc5@om4cfb6jqoav>
References: <20260106-ccs-account-for-cphy-v1-1-c3639d606271@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-ccs-account-for-cphy-v1-1-c3639d606271@ixit.cz>

Hi David,

Thank you for the patch

On Tue, Jan 06, 2026 at 04:14:05PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We need to set correct mode for PLL to calculate correct frequency.
> Signalling mode is known at this point, so use it for that.
> 
> Fixes: 47b6eaf36eba ("media: ccs-pll: Differentiate between CSI-2 D-PHY and C-PHY")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index f8523140784c7..2d689e47ed094 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -3425,7 +3425,14 @@ static int ccs_probe(struct i2c_client *client)
>  	sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
>  
>  	/* prepare PLL configuration input values */
> -	sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
> +	switch (sensor->hwcfg.csi_signalling_mode) {
> +	case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
> +		sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_CPHY;
> +		break;
> +	case CCS_CSI_SIGNALING_MODE_CSI_2_DPHY:
> +		sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
> +		break;

I think it is safer to add a default case here

--
Kind Regards
Mehdi Djait

