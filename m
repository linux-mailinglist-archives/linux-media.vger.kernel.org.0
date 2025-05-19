Return-Path: <linux-media+bounces-32834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B90ABC32A
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 17:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E0821B605D1
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32CB28688B;
	Mon, 19 May 2025 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJPNaTkp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D0286433
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669894; cv=none; b=Ote8PUtJaHrIyQUVOgQ1V2WiARJNpNT+ZPpQs7/p4395ts99Y0qV6dvQD5pkor/MzTYTAmHlnzYeM1Dg91L8xl9qxfyiBjWpGgfzGHd61NQjvIIq5IxIatItVCQ9N/J1lo5xP3efSFKAt/RTOWfKImNqJnL4oIJQ6iPJjKCMLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669894; c=relaxed/simple;
	bh=hfqmQ1M3B0ShmSPKeNDauAakiROiIIk8sIkb9fwtHwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDiRFH/gPATPHzOlAx+Ty9Qsj6b/2bE0VdgY4MRKZ9Zy8WDPo74LZslIp1Ja8L6ZqBJRlnxNZke36eMjfn+CjvAEu4YWQrMEo2Hw/T4sdCSKo9b5Q/L5cq9sTu6glQ1du2Dchx+0z9+uzDgJAyTa3sbXUBEju1rpShGZMqTy4n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJPNaTkp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747669893; x=1779205893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hfqmQ1M3B0ShmSPKeNDauAakiROiIIk8sIkb9fwtHwE=;
  b=jJPNaTkpO6Rs3d1iQ+GrjM5kZBBK/ItRu0o+8GL7opXZYiZM8/A99XSL
   TRCOmIrylF07p7GaM8tRPi0xu8o5pIN58mmrSbU5tCWeh6XeXs3+jwWGF
   4tgVz3SHx1sOo6042xPadNvyngS8ty5zYpYHgh3jRacEbX3vtdm/bEhD6
   fzdGjzz6cboiY7WOrzeNhL/U51maP8C5Su1DrDvsOaeFj02bPi4MAcmAi
   mpmsqPqVZ0XDZVkIFG2+WvycnYJiRqeiA5zHQREiEIVheh9auuHgVm5Dm
   Vi/r3xzOBpbbmjPbsesPb0raTD6mXRnqI0WMjY+Zy7xQWQABanN6E32qL
   g==;
X-CSE-ConnectionGUID: ms8dSvMxTkycX/8WfIM9jA==
X-CSE-MsgGUID: l3n5/PDjQhiPI7ivyoSLFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49450609"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49450609"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:51:32 -0700
X-CSE-ConnectionGUID: FH3Vvv1LT8KaTjoYSa+f9w==
X-CSE-MsgGUID: yLzL4uenTUOAJRpA5iwxsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144661963"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.190])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:51:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2438711F759;
	Mon, 19 May 2025 18:51:27 +0300 (EEST)
Date: Mon, 19 May 2025 15:51:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 3/6] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
Message-ID: <aCtTfwX44vTWuf1F@kekkonen.localdomain>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-4-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506125015.567746-4-dan.scally@ideasonboard.com>

Hi Daniel,

On Tue, May 06, 2025 at 01:50:12PM +0100, Daniel Scally wrote:
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> 
> The rzg2l_csi2_calc_mbps() function currently tries to calculate the
> link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
> of the remote subdevice. Switch the function to v4l2_get_link_freq()
> which correctly targets V4L2_CID_LINK_FREQ before falling back on
> V4L2_CID_PIXEL_RATE if the former is unavailable.
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
> Changes in v4:
> 
> 	- Used separate s64 variable as return value for v4l2_get_link_freq()
> 	  and as the mbps variable for do_div() to avoid compilation warnings.
> 
> Changes in v3:
> 
> 	- Fixed mbps sign
> 
> Changes in v2:
> 
> 	- None
> 
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 +++++++++----------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 9243306e2aa9..8870c2cb8104 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -282,28 +282,25 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
>  	const struct rzg2l_csi2_format *format;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	struct v4l2_subdev_state *state;
> -	struct v4l2_ctrl *ctrl;
>  	u64 mbps;
> -
> -	/* Read the pixel rate control from remote. */
> -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> -	if (!ctrl) {
> -		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
> -			source->name);
> -		return -EINVAL;
> -	}
> +	s64 ret;
>  
>  	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
>  	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
>  	format = rzg2l_csi2_code_to_fmt(fmt->code);
>  	v4l2_subdev_unlock_state(state);
>  
> -	/*
> -	 * Calculate hsfreq in Mbps
> -	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> -	 */
> -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
> -	do_div(mbps, csi2->lanes * 1000000);
> +	/* Read the link frequency from remote subdevice. */
> +	ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> +				 csi2->lanes);

Please call v4l2_get_link_freq() on the pad, not the control handler.

> +	if (ret < 0) {
> +		dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
> +			source->name);
> +		return -EINVAL;
> +	}
> +
> +	mbps = ret;
> +	do_div(mbps, 1000000);
>  
>  	return mbps;
>  }

-- 
Regards,

Sakari Ailus

