Return-Path: <linux-media+bounces-45225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A11BFB918
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 13:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D8813AAE08
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 11:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025FC32D0F1;
	Wed, 22 Oct 2025 11:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZ6VVoxx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C32011CA9;
	Wed, 22 Oct 2025 11:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131597; cv=none; b=HySg25/aHuSvQIubO9icymwRS5GNrEAYwfWY3w6CNmhzUr0zDBHlUARm14iLd6pU86SJcIxR/gYZVZiOGkE+g6glHiDtvs9ofDKOXhysHiILeJ1Vtqjus+7zg98snLhVYvt9jZDu/0zHJNXvr59NDY2dpL6FUGdi0ay/HrNu70g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131597; c=relaxed/simple;
	bh=PDpSlXCddhObHo2V8wLdD/S5r1tvdmsOH6tTH+Y2AJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGIUMtnO6NpPqnY2+5dIwxyHGwE78cLkuQvA2qwo8WpdkFhtWOcsvOwOe6HShii2LO62jboIvALHfUvISOjzXZeTTw1VL51ekpcGUzHfE9r8Y/3pKxZBvDFEUzyzXin/agfbE8xJ7LtrnYvYtHdqdeZLfje2Voz7LW7p7iElnzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZ6VVoxx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761131595; x=1792667595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PDpSlXCddhObHo2V8wLdD/S5r1tvdmsOH6tTH+Y2AJw=;
  b=OZ6VVoxxmrYAHHFOCBCeSNW7YHb4z2DKq/09bSS+exarPpomUTPLLoKG
   pw2ORgb/ctPdt84CXS16frXcOHStYdC50mR7lW/t4Q/cFEfApeD4rblSJ
   8+JmhpqkZ+T2ttDs5ZqU58RuZYJzwcgjz8j+jBsBx7WGnLaCh+RFDMoQ7
   jNLR1LpOerubYAjwTxsk09deuoklfcVzfG6HgEV1a/4Qv5j48yDjEEleN
   OlHqxq3LpOWPgZI5mdNlRs8ztJo0K9/FHeR9NZ4VE4SRaf/9u7zr8YTwc
   Y/lVGSmwxErXCFIerjNxSTrJH9Wy/KZh097NFSm+Z9D6iCp6JC6BsMLmS
   g==;
X-CSE-ConnectionGUID: 5Y6mbUKTSzycnHLI+Whlmg==
X-CSE-MsgGUID: 2lSut8BZSL+Go8N3kNnSpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62304306"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="62304306"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 04:13:15 -0700
X-CSE-ConnectionGUID: KwM47LD9R9+u1aTyN/e6Dw==
X-CSE-MsgGUID: zyxQNUL9StuxwNlIU6wZnQ==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 04:13:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8A99C121E5B;
	Wed, 22 Oct 2025 14:13:09 +0300 (EEST)
Date: Wed, 22 Oct 2025 14:13:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, kernel@puri.sm, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com
Subject: Re: [PATCH v5 4/4] media: imx-mipi-csis: Support active data lanes
 differing from maximum
Message-ID: <aPi8RXHVBMB7vHQ2@kekkonen.localdomain>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <20251022102228.275627-5-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022102228.275627-5-isaac.scott@ideasonboard.com>

Hi Isaac,

On Wed, Oct 22, 2025 at 11:22:28AM +0100, Isaac Scott wrote:
> Call on v4l2_get_active_data_lanes() to check if the driver reports that
> the number of lanes actively used by the MIPI CSI transmitter differs to
> the maximum defined in device tree.
> 
> If the number of active data lanes reported by the driver is invalid, or
> the operation is not supported, fall back to the number of allowed data
> lanes.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 838a1ad123b5..637ef6e614fa 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1034,6 +1034,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>  	csis_fmt = find_csis_format(format->code);
>  
> +	ret = v4l2_get_active_data_lanes(csis->source.pad,
> +					 csis->bus.num_data_lanes);
> +	csis->num_data_lanes = ret < 0 ? csis->bus.num_data_lanes : ret;

I guess this works but should we return an error here instead?

Alternatively, the function could always return some number of lanes as
well (with a printed warning on error). I think I'd do the former though.

> +
>  	ret = mipi_csis_calculate_params(csis, csis_fmt);
>  	if (ret < 0)
>  		goto err_unlock;

-- 
Regards,

Sakari Ailus

