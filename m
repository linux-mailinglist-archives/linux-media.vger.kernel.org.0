Return-Path: <linux-media+bounces-49318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A78EBCD5426
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CC943020C42
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A15728DB49;
	Mon, 22 Dec 2025 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShajMugZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EC630BF6D;
	Mon, 22 Dec 2025 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394670; cv=none; b=PR5BDwuNc57PtrefRl6cWpo4w0A7h0fWKBlIB5JIRkoZlaFP5qPSpoYao/G/4xvFzu24QYWf6230HV+N2XgYr1ne3pno7q4NCYF0o18Wyv3cciNuZcLcWwT09GJOdmKYiLk8Zk1AY0n7UiHISn7l0EnKyQTX3Kt5HGoE9V8zL7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394670; c=relaxed/simple;
	bh=8kas9TuiC9w4y8rBrxoDOvxqHznS9pQck0eKktSLoRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PC6V9JdKaSM8RyrOWfz5QcTzWIKPwalL8HzwSFbqKvDD5Kht7U5Rz0hQgXbVL//fW5+55PmbvbQgzQPj39/dtJbQlDLCEPbOLtQlAGfD6EC1vdKZEsRXfhR2yUF7IJ2C1DuFXMCfHTCH+JzZt9KDFC2VmvJE4PqIdhqDzpMYw9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShajMugZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766394666; x=1797930666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8kas9TuiC9w4y8rBrxoDOvxqHznS9pQck0eKktSLoRk=;
  b=ShajMugZDKVbOAxs/AnQWAZEzvttzqHj7B1L9Dss+YJiSHjOB57Nff+w
   Bf4msHXMVl2sHglmQvGHncz/Tw2uvOPSLdgz6usBNSl2GZ2k+ShaXdeuF
   M1i1+6IN9h0maXafsvsfo3DRfDWf1rU7dYwKyYXgm/Vw86vyoZ1Fy13wH
   5NjfcFQuY2qn6P5icOFguvvOu7eBoOqD+x4kd79MdESk2JJHxki5vyQ/i
   yQNeJcQ4Yw/SGQixytxE0rEzCXt7+++yTBgipZwwyR8OyYkxW5+DDb/Wl
   LVfY49HScRoPKpnLcDSQw7g+wYBiw6TOYfDordr1TDDQ3diqVBcOxczfq
   w==;
X-CSE-ConnectionGUID: 1PzfMiPjRMeiAG4XV4qRtA==
X-CSE-MsgGUID: kjhhlo0XReapQRn9niJziQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67443427"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="67443427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:11:05 -0800
X-CSE-ConnectionGUID: JKXpwm+9QlCknUtHKJH93A==
X-CSE-MsgGUID: gA1AacHCRWe5QnRk34MaHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199232903"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.187])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:11:04 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 261B311F87B;
	Mon, 22 Dec 2025 11:11:04 +0200 (EET)
Date: Mon, 22 Dec 2025 11:11:04 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: Re: [PATCH] media: i2c: imx412: Extend the power-on waiting time
Message-ID: <aUkLKECix4vohyTB@kekkonen.localdomain>
References: <20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com>

Hi Wenmeng,

Thanks for the patch.

On Mon, Dec 22, 2025 at 05:04:07PM +0800, Wenmeng Liu wrote:
> From: Wenmeng Liu <quic_wenmliu@quicinc.com>
> 
> The Arducam IMX577 module requires a longer reset time than the 1000µs
> configured in the current driver. Increase the wait time after power-on
> to ensure proper initialization.

Is this somehow specific to the Arducam module? If so, what's there in the
module that requires this?

> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
> Signed-off-by: Wenmeng <wenmeng.liu@oss.qualcomm.com>
> ---

Which one is the right one?

>  drivers/media/i2c/imx412.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index b3826f80354703b17b416dc233854da3f5736e38..e444c48c11b171b421c535beb23211bf0b600d3a 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1037,7 +1037,7 @@ static int imx412_power_on(struct device *dev)
>  		goto error_reset;
>  	}
>  
> -	usleep_range(1000, 1200);
> +	usleep_range(10000, 12000);
>  
>  	return 0;
>  
> 

-- 
Kind regards,

Sakari Ailus

