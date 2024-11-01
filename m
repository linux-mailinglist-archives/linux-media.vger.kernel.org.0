Return-Path: <linux-media+bounces-20668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 402259B8CA9
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027E2283B8F
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 08:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D27715665E;
	Fri,  1 Nov 2024 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/ZPM7X7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DCB84A5E;
	Fri,  1 Nov 2024 08:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448595; cv=none; b=HJbTmfTZojSAAMB5n4zM1FmGnDNKKPBfRjw+tqEryqZQ3H9gDeVUeTaMjjctunAdLdpMgHc/eWn/UddV2pi/BifS94Qhch6iChnR9buEpCgDVVUKhYf2LM9HEMRMzh3R28hTb38iI02wc7yFfTCe2upN/pkHvASCYEbNIpkVDtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448595; c=relaxed/simple;
	bh=E1XmPd6711GpIKtw522vFEYwIN6/pTWzffogAvddBt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moVaxjlS1dGdRqTgO0cmJ0iH2l4AYNPPJk+rIh+vtwuEtUnIJY3Id7Uiw4urUykPFpay37K7GLxa/ntIriFxZoFCkWMIG1XBRI6DJkXIXRcMVc8KB4Adn+L7nRsUB/gLW3oyaM2f+mMgYrc8yH/3mWNUIhtLBcOKooiBE1defP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/ZPM7X7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730448594; x=1761984594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E1XmPd6711GpIKtw522vFEYwIN6/pTWzffogAvddBt0=;
  b=A/ZPM7X7VgVP3ASNxk7NIR9aDNBdoHPcSaq020D0bv1/Qd7R12Cg8JAT
   S+TMbs6HLMzkQH6/f4aln3yjWNIqf5LhgA69zHgXabPIt9pLfAZJ5C0Aw
   DOk+bPKFkOoE0OSVPvJDU68MM14pqPaqrp/ZiOcFH3gz1iQLp+cx2DnOr
   IfV+QN+wxynGvuPnttSuE2P6S/8idBXsdHrReCjmX6AKtiQhMtANYkwPZ
   l2J/H0RSZ/BhwyFTWDuAgq2+qktZHFbHQxPwXSQTzUg8jMdEmnFAz915s
   BVwcsbg2QMXNHoIaaClW6iKpYuLF2ms13haUgNmDAvpupaiOU6Zs8GIVT
   A==;
X-CSE-ConnectionGUID: 0MrSOXm9TQClByhcigmttg==
X-CSE-MsgGUID: c0nwOpN+T1mZfyiDJs+iCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="33045650"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="33045650"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:09:53 -0700
X-CSE-ConnectionGUID: 6h4bemlQT6SYICBZgGrdjQ==
X-CSE-MsgGUID: 9rvkpyMMQRK2M3sUG2NotA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="120355666"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:09:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D674F11FA28;
	Fri,  1 Nov 2024 10:09:47 +0200 (EET)
Date: Fri, 1 Nov 2024 08:09:47 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: mchehab@kernel.org, ming.qian@nxp.com, eagle.zhou@nxp.com,
	stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com,
	bryan.odonoghue@linaro.org, hans.verkuil@cisco.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] media: venus: Fix pm_runtime_set_suspended() with
 runtime pm enabled
Message-ID: <ZySMyxwnedp-icoy@kekkonen.localdomain>
References: <20240923035115.3008900-1-ruanjinjie@huawei.com>
 <20240923035115.3008900-4-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923035115.3008900-4-ruanjinjie@huawei.com>

Hi Jinjie,

On Mon, Sep 23, 2024 at 11:51:15AM +0800, Jinjie Ruan wrote:
> It is not valid to call pm_runtime_set_suspended() for devices
> with runtime PM enabled because it returns -EAGAIN if it is enabled
> already and working. So, call pm_runtime_disable() before to fix it.
> 
> Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")

Patches with Fixes: tag(s) need to include Cc: stable nowadays. Same for
the 1st patch actually.

> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 165c947a6703..2d5966f5ce97 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -412,8 +412,8 @@ static int venus_probe(struct platform_device *pdev)
>  	of_platform_depopulate(dev);
>  err_runtime_disable:
>  	pm_runtime_put_noidle(dev);
> -	pm_runtime_set_suspended(dev);
>  	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
>  	hfi_destroy(core);
>  err_core_deinit:
>  	hfi_core_deinit(core, false);

-- 
Kind regards,

Sakari Ailus

