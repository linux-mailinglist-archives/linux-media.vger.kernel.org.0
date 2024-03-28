Return-Path: <linux-media+bounces-8071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7C88F938
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 08:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82DDD1C29CD8
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 07:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A956A51C28;
	Thu, 28 Mar 2024 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mE8ug2I1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94425465D
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711612487; cv=none; b=EnEluIyZlo7+z5lMi0CgeurgLB9XjSOb2Hp24FY0bQ0/tIBdH8ER3ULY7ZNOnsBVQLuL17w7bgTucbfBjdtTNXVG3bBCc1IJIOO7jhxmoNFgeD4+Mtj9GIpugCmhULt5C2K1uwQ+JQbP+g5p1PHf0Th+BheBf+s6Pt956Zh0k7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711612487; c=relaxed/simple;
	bh=z+HUvojkH9gEZKOo0HIT1sILyPwdO2dgvL6bBHSKPTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUXzMeGkCuVk5VSiaR26+LYptpz4Yw9MtyBYXFwr75WxChgsv06JbvFEoDC1OporgvyjnKHlNnXieCTxrC1oQtFmtI/43RHLU7nj9pDWoJ0EFUiaG7UOXwufx0UNjZPZjGvNGSXjE7jEfnR0HzilDwFhk4JZdIN3qaj1+dxZtc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mE8ug2I1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711612485; x=1743148485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z+HUvojkH9gEZKOo0HIT1sILyPwdO2dgvL6bBHSKPTc=;
  b=mE8ug2I1xr+ZBNHxBVkVfuWPycHdwGdhM0pNdn55xoNy8XxSzjE4BfId
   Vu47sUdrDiTxkr7SF6Cq/uR9OI5dbCanq/GbxGm1V4hyqM1ReWPqK2zsl
   xqKFvXqvI3p7K/cWRYBQP8H+4SL2rJEVxQi+qvQRmqi5zqnHt+JidsVXT
   VGnX+eebIJAtt2gHZo2uGQ/1P+EsHnfcMs6FY8AWcrrPMZdJiWXalBE/+
   J2xjPsM+W4xEikNi8K57nWNuSx+6lDLyRj/z/ATA8KcBB20kXP+D0ts3i
   etcmy/+fNch8vkT52BD54AkTH/rWQM8/qEoUAp47tnpFLQKeQsHFp0jdt
   g==;
X-CSE-ConnectionGUID: N3TlyK8BQtqP9jcLNr7V/w==
X-CSE-MsgGUID: tzygiHVwRzSrvmuANpwNmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10557104"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="10557104"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 00:54:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16968091"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 00:54:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AF0D911F915;
	Thu, 28 Mar 2024 09:54:39 +0200 (EET)
Date: Thu, 28 Mar 2024 07:54:39 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: rmfrfs@gmail.com, hansg@kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] media: ov2680: Allow probing if link-frequencies is
 absent
Message-ID: <ZgUiP2WnaAWnJ207@kekkonen.localdomain>
References: <20240328051320.2428125-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328051320.2428125-1-festevam@gmail.com>

Hi Fabio,

On Thu, Mar 28, 2024 at 02:13:19AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Since commit 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
> property verification") the ov2680 no longer probes on a imx7s-warp7:
> 
> ov2680 1-0036: error -EINVAL: supported link freq 330000000 not found
> ov2680 1-0036: probe with driver ov2680 failed with error -2
> 
> As the 'link-frequencies' property is not mandatory, allow the probe
> to succeed by skipping the link-frequency verification when the
> property is absent.
> 
> Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  drivers/media/i2c/ov2680.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 39d321e2b7f9..f611ce3a749c 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -1123,6 +1123,9 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  		goto out_free_bus_cfg;
>  	}
>  
> +	if (!bus_cfg.nr_of_link_frequencies)
> +		return 0;
> +

Thanks for the patch.

I'd still rather try to avoid going to this direction as these frequencies
are hardware dependent. Add a new one to the driver and some boards may
stop working properly. For details see
<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>.

>  	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
>  		if (bus_cfg.link_frequencies[i] == sensor->link_freq[0])
>  			break;

-- 
Kind regards,

Sakari Ailus

