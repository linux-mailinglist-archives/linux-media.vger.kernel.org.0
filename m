Return-Path: <linux-media+bounces-30976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD9EA9BE78
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 130C23B0618
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 06:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AF322C34A;
	Fri, 25 Apr 2025 06:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="max0HPnf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B5F22B8B1
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745561436; cv=none; b=P93Zauzrnz6BUj5se7Q9luAQlcz5tAK8BhB5/CqYg8e4W78P+xu3z60LTi5uDeU5vQcEoSJ2aKmbrvtPofca8DRwqqRZoIKPxSaGA0zruBWffERjqQRo8DDtFqba2POHBM2HjsMbZ89YZETRPUC560MAvct1g+4jF5vEp5N57S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745561436; c=relaxed/simple;
	bh=gQxdQd4V5c9MR8U37FjCtdGDDZ1giQ9JgkEESDQ0X3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIUb+p7KC5v0pqXw1G6eDLwXxZs2pYnwPcRFG/qznxAZb7owHmHvKH6oPiEFH9QiaXHgr0FvhJjUhXPz6TCyjGPGKSt2SvDi4NZ1eOK9VHM12MdcJ3C8hsHkseNjqtx0L4Y5ioLE9CE2viFDc3+eawHCLq0YzIKAS5ZICOLkf1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=max0HPnf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745561436; x=1777097436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gQxdQd4V5c9MR8U37FjCtdGDDZ1giQ9JgkEESDQ0X3U=;
  b=max0HPnf9gKSEIzqHTQ3217UR/5I+NPffRupNLFLFogGUTHfxB8FGeA3
   vSGt7DzvLzj7dLXl4szGdPD1fK4x+UqZJypZwW/EXqHtkQFL0hpbsH7PA
   dKOZXzYtQ48beW6ouvKvHWGcMglQnqmtoc4R9UFgBpNC5RCUmmaJ2bsxG
   NoShNvstVHX+pis+fAFCph+mvjDR56l1Bur1wUVV0P3bE6gSCWI3hkZYU
   DRbv6Un/hggSdzc6AFTISa2C25Wj1EpdKo40nxd/uWjHa8ax4iI9afO42
   P9kHGLc3lX8sfy65l7FjsLlUBO9nynaJBYO20AQ4s2blg3MpwRB3EQ0rU
   g==;
X-CSE-ConnectionGUID: +IH0TS58QTGtGodq5+jzeQ==
X-CSE-MsgGUID: HPidVgkLRlGgKQQvc61KHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50881198"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="50881198"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 23:10:35 -0700
X-CSE-ConnectionGUID: 4DmfXqR9T8e36jwrhMp+wA==
X-CSE-MsgGUID: IrkLuxYxRUuWiqTLp2H61A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="163781830"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.84.5])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 23:10:32 -0700
Date: Fri, 25 Apr 2025 08:10:29 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Hao Yao <hao.yao@intel.com>
Cc: linux-media@vger.kernel.org, Jason Chen <jason.z.chen@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, arun.t@intel.com
Subject: Re: [PATCH] media: ov08x40: Fix the horizontal flip control
Message-ID: <aAsnVYXFJ0IEumNM@linux.intel.com>
References: <20250425043328.208804-1-hao.yao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425043328.208804-1-hao.yao@intel.com>

On Fri, Apr 25, 2025 at 12:33:25PM +0800, Hao Yao wrote:
> The datasheet of ov08x40 doesn't match the hardware behavior.
> 0x3821[2] == 1 is the original state and 0 the horizontal flip enabled.
> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Regards
Stanislaw

> ---
>  drivers/media/i2c/ov08x40.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index cf0e41fc3071..17112c02408a 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -1627,7 +1627,7 @@ static int ov08x40_set_ctrl_hflip(struct ov08x40 *ov08x, u32 ctrl_val)
>  
>  	return ov08x40_write_reg(ov08x, OV08X40_REG_MIRROR,
>  				 OV08X40_REG_VALUE_08BIT,
> -				 ctrl_val ? val | BIT(2) : val & ~BIT(2));
> +				 ctrl_val ? val & ~BIT(2) : val | BIT(2));
>  }
>  
>  static int ov08x40_set_ctrl_vflip(struct ov08x40 *ov08x, u32 ctrl_val)
> -- 
> 2.43.0
> 
> 

