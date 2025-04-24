Return-Path: <linux-media+bounces-30893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 526C0A9A00E
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 06:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6267F1944B5A
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 04:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154621AC43A;
	Thu, 24 Apr 2025 04:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWrmALE0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A129E383A5
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 04:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745468552; cv=none; b=kfM1PVwYrj14fWAaJf6fCfwfoimW9D4H2Nx4bZBH0bC8k6pn2qH83qPtk+7UXnykM6Gklsfvh8pGfa3MGwIXIvQM5oLDy52jExSeyKnGtb5cQCXcFaFcY+rRjzyDYajBrgslOQG6Mln+kE0kDX8LYc5YfaxqdN4axoDAzLUCMcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745468552; c=relaxed/simple;
	bh=YSjQ5wsn4ypIHYAe2IJRwAaGycew04PKI3wOKEyLnrA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bbZu51QgmyNmpIqwXd6Kt0u/bRZmGzAMF8763YPEQqKOtO7luDJbS/49DXNG/oXR+XmCHHxsmfh+cmG7CmtgtCj5Xh4gAaHfTvsDH7jOCavW2Gh35UeO2ygeW95+qOOveyhaEx1zjmD8UrSNxlSUHu88rgE8ms6eDTuuh37Wjdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWrmALE0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745468550; x=1777004550;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=YSjQ5wsn4ypIHYAe2IJRwAaGycew04PKI3wOKEyLnrA=;
  b=VWrmALE0E86C88utGtzLMNumxGF1ltfnK445gz7a/gnaLV2sgx6DHMtt
   NkMPS4MCGVqyFY5UjuxvKv7SbIELK+XKJ2RshfLqYe0KdtDYGvUIHi0J+
   MClzA7e+Gj0Zj6+kCGr0uGk2p0UekL3cAdyyr6efDi2x9Z696EdPjAkck
   fz5GuLRa05UOY9ak2dDz2yPv9YN5DGBK3U9AVJo9qp04JXbE+YY/VqGBi
   acPnp2z9m+pRuYeDvGTxTuLShVyEDlFnI0A7LCCulboqCiDcUpHfXqR4i
   pPGkLEt6jfOU9XTboI1qIQtbtQOLNYUWWGO3Wqlpu9NuQCQKGRSpLZ0+w
   w==;
X-CSE-ConnectionGUID: mn/mHDUOQzONWeKwacXkEg==
X-CSE-MsgGUID: S5/AuVwXRs2FT3SmKAoxjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46956915"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46956915"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 21:22:30 -0700
X-CSE-ConnectionGUID: L4ApT35RT6C0F8idaobAog==
X-CSE-MsgGUID: IODs1/vsQQypdW7Tij9viA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137671656"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 21:22:28 -0700
Subject: Re: [PATCH] media: ipu6: Remove workaround for Meteor Lake ES2
To: Hao Yao <hao.yao@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
References: <20250311084203.516205-1-hao.yao@intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <f8fd0fd4-ca0c-12b5-acc6-ba846b2c9987@linux.intel.com>
Date: Thu, 24 Apr 2025 12:18:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250311084203.516205-1-hao.yao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hao,

On 3/11/25 4:41 PM, Hao Yao wrote:
> There was a hardware bug which need IPU6 driver to disable the ATS.
> This workaround is not needed anymore as the bug was fixed in
> hardware level.
>

It is better to send v2 with fixes tag here:

Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")

> Signed-off-by: Hao Yao <hao.yao@intel.com>
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
>

-- 
Best regards,
Bingbu Cao

