Return-Path: <linux-media+bounces-23358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E469B9F06FE
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 09:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C14F169C00
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 08:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F8B1ACDE8;
	Fri, 13 Dec 2024 08:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpW6xPys"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1226502B1;
	Fri, 13 Dec 2024 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734080093; cv=none; b=PSE4HpMAmeiNjBYAFXUizl8gp01HICZQjdIzJ6dJZo/baln5/CfWHsKNy4xzTh8tKLnp43Z1y9xkv08J7/S9BgRCBOrGKTPDJw8bw4QUTANSuDAlK2zas1wjk5Xrh7APOwi+IMF93S4C7/aSMQjc2sYldNNd5w6Z6FGdk1Z1PJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734080093; c=relaxed/simple;
	bh=GsxhVX2WxwG+5uCuda5A0oHfwftdzcUVjGufjb46HGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKGC/IcvE5OW5TcS90IVJMQIU0eASTtkf+Bs7tvM1IT5lkTnv9FcwprvMIBxPUCSjFsf3LXinKl2kRs5RHrKmEIT1xEqaund9MhCM4AC9T0aQra1GmdfIDkFABNWt7caV75dG8F41+wxQltZhM8WJVA09x+2Sr+qJOqLHw6hqac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpW6xPys; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734080092; x=1765616092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GsxhVX2WxwG+5uCuda5A0oHfwftdzcUVjGufjb46HGw=;
  b=UpW6xPysknM342YNq3N4+2ELkry2WoXDd3gWOgpDGF1kdmM1tBfNKIFb
   Lhq5Lj7XpYGAvxTlnMZB33qsWvqSVInKsWmC1ohsQjsyYjgcBH54pi3Lb
   kuqlnCM4VFVdtTFC2EY+8kDKxxjhS9U9c7ooJuA4luLMrLniXM0XLdkaL
   DaPu5Jutyg2PFWrvVHQG5iXsrpWVjFFKX+CxO5mIJC8h3Ir/tFmc6/Mg4
   NO5d/QeWkSym1bkHkke9NFWlRO5zHghyjvabmeMxNgJX/l+rA1vn+27Aq
   L2VsGIQDoTSEUaDroHui4W9+EO3VyEOgcD4qBg8AZmK61NsiEGzFeUnlU
   A==;
X-CSE-ConnectionGUID: 8xr4mxFrRCWq8tQEho+f2Q==
X-CSE-MsgGUID: u/fmbWM/TxicxbVFNA5qcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37376057"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="37376057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 00:54:51 -0800
X-CSE-ConnectionGUID: p7ValXwCRTib7XfkE/A7OQ==
X-CSE-MsgGUID: jiD8E0OlQwuHBJHYDQz0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="97040043"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 00:54:48 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D147412034A;
	Fri, 13 Dec 2024 10:54:45 +0200 (EET)
Date: Fri, 13 Dec 2024 08:54:45 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
	git@xilinx.com, stable@kernel.org,
	Sam Bobrowicz <sam@elite-embedded.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	"open list:V4L2 CAMERA SENSOR DRIVERS" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2] media: ov5640: fix get_light_freq on auto
Message-ID: <Z1v2VRzgUVpHZvXR@kekkonen.localdomain>
References: <2e79be9185cbb0dbe40e670eee996cf290bab0a6.1732264079.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e79be9185cbb0dbe40e670eee996cf290bab0a6.1732264079.git.michal.simek@amd.com>

Hi Michal,

Thanks for the patch.

On Fri, Nov 22, 2024 at 09:28:01AM +0100, Michal Simek wrote:
> From: Sam Bobrowicz <sam@elite-embedded.com>
> 
> Light frequency was not properly returned when in auto
> mode and the detected frequency was 60Hz.
> 
> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> Signed-off-by: Sam Bobrowicz <sam@elite-embedded.com>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> Cc: <stable@kernel.org>

Cc: stable@vger.kernel.org

And right after the Fixes: tag.

I fixed it this time.

> ---
> 
> Changes in v2:
> - add Fixes tag and cc stable
> 
>  drivers/media/i2c/ov5640.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index c1d3fce4a7d3..8566bc2edde9 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1982,6 +1982,7 @@ static int ov5640_get_light_freq(struct ov5640_dev *sensor)
>  			light_freq = 50;
>  		} else {
>  			/* 60Hz */
> +			light_freq = 60;
>  		}
>  	}
>  

-- 
Regards,

Sakari Ailus

