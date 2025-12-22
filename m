Return-Path: <linux-media+bounces-49309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7352CD5204
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB8FB30492AF
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C68316901;
	Mon, 22 Dec 2025 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0bAFDIn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AD826CE04
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392775; cv=none; b=Er2uotKvgYDRXcW6tY/Rtod6NpO4On/Exp3Xb4nUgIGx2Y+3w+xoEM2gACZ7dpf8eE46/b/L4vCY8ZkqBiB32bLbZ933kiFDm9bfxRYBwLUn4uuRG9BFS/P1x4w3/G1BxqE40ows8UevTqzQbitL0O9B3ubBvo41CAvgXlKa98I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392775; c=relaxed/simple;
	bh=ZjodsPNxKV0WF6TSziv241hIOWTKkoX9i8lsTP4ruSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwZiObivG2i4zGfzDr0sf5BCwIK5+SSNZiNAHa79zQWtUIsHxa/tCMv64wlILedFZ2KQuroG9DwjYawt2ySPMDy0N0TPmRFVwWQHSmRQZhz+2pRExCcCjsn3EEZHvmuqeOJwynw8IcdSiiJU4kjtePzW1pd6t9jylTB7Q4LY+is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0bAFDIn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766392773; x=1797928773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZjodsPNxKV0WF6TSziv241hIOWTKkoX9i8lsTP4ruSs=;
  b=a0bAFDInAGiQpHfvFY6CXfkliF8dsdi/Fw9WnW7D1SkNsn8PJp8RlmrD
   0cM3lBlu3ZZSiaB3Pa6kMk9/3HYL1sdcfTZzbGi9DR9t/LDyHsLcV+gue
   BnUt9ePwYtNPwJvexa/Onbw7UDvEFpLgPO/8otEft9hDZ8wQdL5aq5PaH
   kESzTajbO1gsEmzdsQ+Dn0pjwACBeV84v+1h8fDwoPlza8q/61WIBQSlJ
   3mrj2IsxvmtRGIaKPz3EdqYhqpoVkrE5QciN1RMdMSU009lX9SC57y/Ut
   vKM7py+7MEUAQFLQi0JZ71wpdC+ywaAQqU2CRKtqzN61ubuLKsw59CTCF
   A==;
X-CSE-ConnectionGUID: qQJVS0+oS0GMYxfQWgLEag==
X-CSE-MsgGUID: RVqXHO1BS6Om/LxX+DBNnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93719300"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="93719300"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:39:33 -0800
X-CSE-ConnectionGUID: PWsPPXg+Ss2FrmKIoO5o4A==
X-CSE-MsgGUID: /fb7yNXaSTGZSNMxwbVDsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230125429"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.187])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:39:30 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 415EF11F87B;
	Mon, 22 Dec 2025 10:39:31 +0200 (EET)
Date: Mon, 22 Dec 2025 10:39:31 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com
Subject: Re: [PATCH v2 4/4] media: ipu6/7: fix typo and coding errors in IPU
 mmu driver
Message-ID: <aUkDw4wtdWmZwn39@kekkonen.localdomain>
References: <20251222070629.2018807-1-bingbu.cao@intel.com>
 <20251222070629.2018807-5-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222070629.2018807-5-bingbu.cao@intel.com>

Hi Bingbu,

On Mon, Dec 22, 2025 at 03:06:29PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Fix the coding errors in ipu6-mmu.c and ipu7-mmu.c, it has
> no impact on current driver functionality, however it needs
> a fix.

Please wrap paragraphs (using your $EDITOR perhaps?) to use as much as
possible but still at most 75 characters per line. The above should look
like:

Fix the coding errors in ipu6-mmu.c and ipu7-mmu.c, it has no impact on
current driver functionality, however it needs a fix.

> 
> Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU table")
> Fixes: 71d81c25683a ("media: staging/ipu7: add IPU7 DMA APIs and MMU mapping")

Could you split this into two separate patches, please?

> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 4 ++--
>  drivers/staging/media/ipu7/ipu7-mmu.c   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> index 6d1c0b90169d..85cc6d5b4dd1 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> @@ -102,7 +102,7 @@ static void page_table_dump(struct ipu6_mmu_info *mmu_info)
>  		if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval)
>  			continue;
>  
> -		l2_phys = TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx];)
> +		l2_phys = TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx]);
>  		dev_dbg(mmu_info->dev,
>  			"l1 entry %u; iovas 0x%8.8x-0x%8.8x, at %pap\n",
>  			l1_idx, iova, iova + ISP_PAGE_SIZE, &l2_phys);
> @@ -248,7 +248,7 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
>  
>  	dev_dbg(mmu_info->dev, "alloc_l2: get_zeroed_page() = %p\n", pt);
>  
> -	for (i = 0; i < ISP_L1PT_PTES; i++)
> +	for (i = 0; i < ISP_L2PT_PTES; i++)
>  		pt[i] = mmu_info->dummy_page_pteval;
>  
>  	return pt;
> diff --git a/drivers/staging/media/ipu7/ipu7-mmu.c b/drivers/staging/media/ipu7/ipu7-mmu.c
> index ded1986eb8ba..ea35cce4830a 100644
> --- a/drivers/staging/media/ipu7/ipu7-mmu.c
> +++ b/drivers/staging/media/ipu7/ipu7-mmu.c
> @@ -231,7 +231,7 @@ static u32 *alloc_l2_pt(struct ipu7_mmu_info *mmu_info)
>  
>  	dev_dbg(mmu_info->dev, "alloc_l2: get_zeroed_page() = %p\n", pt);
>  
> -	for (i = 0; i < ISP_L1PT_PTES; i++)
> +	for (i = 0; i < ISP_L2PT_PTES; i++)
>  		pt[i] = mmu_info->dummy_page_pteval;
>  
>  	return pt;

-- 
Regards,

Sakari Ailus

