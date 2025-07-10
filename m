Return-Path: <linux-media+bounces-37241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 483F8AFF71D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 04:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15E031889C10
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 02:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B0F28003A;
	Thu, 10 Jul 2025 02:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lH/AXy+B"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADEF28000C;
	Thu, 10 Jul 2025 02:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752115947; cv=none; b=m88F7G6ANn9kSqbUoY0eH4GBn1D1XHMqfkbt2ye2Hq0qbU0Xoai+o+F6mKQXrp2hJV5V1IDLdUBstB7JDz58driEi1Z+B4s5oFpeWU9g4KXI29lY7L8ceHk5IQK0ngWWjKrPyF+FyZgK9GCs0fiHTiIsMzWBWz/Db3JAMuiA/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752115947; c=relaxed/simple;
	bh=FedmxWs8c4lEVdFul/1RlIardC+Qw3uxBIZuWVNe2IQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=SEMsljOEuZNCkzIlm3BRa1qFkzbYxl+nOWhD+wsX9TNUBCq2lRAY9ViWU+ogZ08okfVyxUFye1zujiWEBLR5ILOHkMC6qhoo2Jdu+sZyUvqNHp8FCAP+x17zQgfyt9gkE4o2uT1Zx1rUbOJxaZFShS4Ic5iDXDijskYHgaeNKAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lH/AXy+B; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752115945; x=1783651945;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=FedmxWs8c4lEVdFul/1RlIardC+Qw3uxBIZuWVNe2IQ=;
  b=lH/AXy+BbKVVF6pujD/y6TJXNcTuJxHEbIYVxFXE4kY3mPTviVJ3XAbn
   1cVjpUFc9d4jUSKGB7WKa/nTipclUorDaj9EluirdA9Dlhb0Oqe5Jg2HK
   VQLDnOR8VLsqO1xQjOhYHNsgDW88aGZzZQ98NTtupEsWJwJUA6ma4AQgi
   MSDT0qGdpC7hGziaXWTVDJKJ+CP3lTpkRSg8js2RlfswjV+GMdRL/NtVb
   ZhorE4UU4RjAnOoS5oHzjrITufCF1ygTWVP+58I0Sxh05ZOY6bDLEPy99
   Qut+6N1qQPOlGRLUwBK1yoHqrsO9vMlycYDSMVtcUnjkU240XmKElRBbm
   Q==;
X-CSE-ConnectionGUID: fetWNBmkT9KjtFujTb50Xw==
X-CSE-MsgGUID: nWH8zMvxQ1mjIDu8lwJ7rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="53499967"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="53499967"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 19:52:24 -0700
X-CSE-ConnectionGUID: EfNBHWkjTC2uv4fr02OtHg==
X-CSE-MsgGUID: 7Nr91Ib0SC+hFEXjC+XUtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="155591962"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 19:52:22 -0700
Subject: Re: [PATCH] media: staging/ipu7: avoid division by 64-bit value
To: Arnd Bergmann <arnd@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bingbu Cao <bingbu.cao@intel.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250709145710.102669-1-arnd@kernel.org>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <4b7bdfb6-c0ae-ee2d-c3e2-590f2b5225b3@linux.intel.com>
Date: Thu, 10 Jul 2025 10:45:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250709145710.102669-1-arnd@kernel.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 7/9/25 10:56 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On 32-bit targets, this causes a link failure:
> 
> x86_64-linux-ld: drivers/staging/media/ipu7/ipu7-isys-csi-phy.o: in function `ipu7_isys_phy_config':
> ipu7-isys-csi-phy.c:(.text+0x1509): undefined reference to `__udivdi3'
> 
> Note that this does not divide a 64-bit number by a 32-bit one as usual,
> but the other way round, which is something that the compiler should
> really be able to figure out but does not (as of gcc-15).
> 
> A few lines higher, a similar division is done using the incorrect div_u64()
> that truncates the 64-bit divisor to 32 bits.
> 
> Change both to use the safe but slow div64_u64() helper.
> 
> Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> index 4407750c7f40..b8c5db7ae300 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> @@ -734,6 +734,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  	u16 reg;
>  	u16 val;
>  	u32 i;
> +	u64 r64;
>  	u32 r;
>  
>  	if (is_ipu7p5(isys->adev->isp->hw_ver))
> @@ -806,8 +807,8 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  		dwc_phy_write_mask(isys, id, reg, 2, 0, 2);
>  	}
>  
> -	deass_thresh = (u16)div_u64_rem(7 * 1000 * 6, mbps * 5U, &r) + 1;
> -	if (r != 0)
> +	deass_thresh = (u16)div64_u64_rem(7 * 1000 * 6, mbps * 5U, &r64) + 1;
> +	if (r64 != 0)
>  		deass_thresh++;
>  
>  	reg = CORE_DIG_RW_TRIO0_2;
> @@ -815,8 +816,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
>  				   deass_thresh, 0, 7);
>  
> -	delay_thresh =
> -		((224U - (9U * 7U)) * 1000U) / (5U * mbps) - 7U;
> +	delay_thresh = div64_u64((224U - (9U * 7U)) * 1000U, 5U * mbps) - 7u;
>  
>  	if (delay_thresh < 1)
>  		delay_thresh = 1;
> 

Reviewed-by: Bingbu Cao <bingbu.cao@linux.intel.com>

-- 
Best regards,
Bingbu Cao

