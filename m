Return-Path: <linux-media+bounces-28002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AE1A5BB96
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9595718839BB
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 09:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE1E21D595;
	Tue, 11 Mar 2025 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9o7h3Kt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8171C1ADB
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 09:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683819; cv=none; b=qMCnlZBSAV1sutt3Xz401FqTff2xwXBxe1WVxCjSRCNisg+BbETHxvj1heZZPwVeMA7Qt0EaWwmgixwcUVZlXk9RoCkGckH7WLsEfa7wOFLilzXgLNFoy++jBFQUpxc2IEn1vGjzbFhDNQaHu/rZdA7Z6HRtYsk9DnKjLqLtr8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683819; c=relaxed/simple;
	bh=KTR0u7yV49+97KMeVvvTS4wx8S48FDSIcf/W6o8WizQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJ7ms2IaNqOmBUw/z08b0LFLN1p1Y2Ii4tGqebsJZo4E35bt8fsFX0fS9zSNO1yuvJkpnXQXWnCALtjU0Hk8LnB1L9OmTcVHjzzX583bkka+dU5gXYRRQI0mPHXNieyN6TIwBADQgIY5T8DfFgyMwD3cXPo4bnJhouonyZ1b99k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9o7h3Kt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741683818; x=1773219818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KTR0u7yV49+97KMeVvvTS4wx8S48FDSIcf/W6o8WizQ=;
  b=j9o7h3KtOTCSGvCjkDDhM+96NWRmNgkoq30vcisuzhG3OMJvc0b8HwLl
   GXnFdLrrb5LVSbRk2hAuvCai943lZ2y+Q0C4B2QyKLQDrjgjakW/waM+y
   KncPC+S/uKUjPzKuqZg2c3ukS2v0fKYrI3AOPwjMaPVsMAD+5ztBPayQb
   qTNOhNKNan6e7mcmwv0hY1C+Tqk1XdFynxHFg7mXTvsVpHuR6EX+7DigH
   MVR4RmenQgOvRVug/U2q3uhm06UQBf8fmh+Cd4uYvHSkHuIcnkXrB6Il7
   H8kQwaD1rEo4/iQor5WFML3kOjMQv0mizH2CvOkAWdp8oFtevOMo4h0B9
   w==;
X-CSE-ConnectionGUID: WaR+B+keRSGB4L4aF4VBTA==
X-CSE-MsgGUID: 4ucUYpCfRVS0M0ir474hgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42427325"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="42427325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 02:03:37 -0700
X-CSE-ConnectionGUID: qnwoe0ZEQ3GVPHaY9Q8Brg==
X-CSE-MsgGUID: tLm0+AErT1K6STg2n3nHbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="151212812"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.112.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 02:03:35 -0700
Date: Tue, 11 Mar 2025 10:03:32 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Hao Yao <hao.yao@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ipu6: Remove workaround for Meteor Lake ES2
Message-ID: <Z8/8ZNKWo3jU0HEW@linux.intel.com>
References: <20250311084203.516205-1-hao.yao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311084203.516205-1-hao.yao@intel.com>

On Tue, Mar 11, 2025 at 04:41:55PM +0800, Hao Yao wrote:
> There was a hardware bug which need IPU6 driver to disable the ATS.
> This workaround is not needed anymore as the bug was fixed in
> hardware level.
> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Regards
Stanislaw

> ---
>  drivers/media/pci/intel/ipu6/ipu6.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index 277af7cda8ee..b00d0705fefa 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -464,11 +464,6 @@ static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
>  {
>  	int ret;
>  
> -	/* disable IPU6 PCI ATS on mtl ES2 */
> -	if (is_ipu6ep_mtl(hw_ver) && boot_cpu_data.x86_stepping == 0x2 &&
> -	    pci_ats_supported(dev))
> -		pci_disable_ats(dev);
> -
>  	/* No PCI msi capability for IPU6EP */
>  	if (is_ipu6ep(hw_ver) || is_ipu6ep_mtl(hw_ver)) {
>  		/* likely do nothing as msi not enabled by default */
> -- 
> 2.43.0
> 
> 

