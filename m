Return-Path: <linux-media+bounces-24789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E9A125FF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 15:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A5A73A74AD
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 14:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BB978F52;
	Wed, 15 Jan 2025 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ih0131jg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7227726;
	Wed, 15 Jan 2025 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736951222; cv=none; b=S4bcf5Vc1ufJDUu42Zpq7GKJA/EmhhbcamdsuIo3m26QptM33GXgXDuNTmLDGd1ctyNjbRMxKpG/4CKIDZIeckRsO9ygNO8BVSAuhlkWLDtZjGxNLt/NH68Rz8tD2XuIel05umgA7L1VMx02OYlTV3gS8GMuTjO+hWebr5HKZig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736951222; c=relaxed/simple;
	bh=wFnnw+VvNqHZLTuoFenA5zl/t3RtdvH/yH3+RVXyvbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dujgqvLpGnnZ96Mw7imh/go3ebjKWYUdOFjrHI7Q3MbMABEU7od3V7Uryf6sdgWBQzpjxEQ5myF8V2MBWZg4jCcAxaWy43XrTm5VqnMLsHS9yf/Z08/clqK0FFNVnDVcspR56/3c4s9YRdwnnMtCnjMlYVHx9HOl5rmpbMSjPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ih0131jg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736951221; x=1768487221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wFnnw+VvNqHZLTuoFenA5zl/t3RtdvH/yH3+RVXyvbI=;
  b=Ih0131jgTms1fdG68G2ZJQZUwUHNBCKNEurIgDQlubNmPWtBVlTNqWQe
   YJrp0hF9YVO7ghEDQY4D7IOVS8faGq5r3sA/MeAxOOr+GUmgYx0gf/KU/
   Jqg4Nm63C7W1tdeMUrcuNkh02bqoGcqq+mCkHtT8ywh+SRbO8Vr8Qyxdg
   RRseehho6eC3J7np2oyi/raeq1/8a1dPLOOAnv8QbhyW8VC27luo0a5AW
   xDanHKbfYdH+g65I/wUfJl7Nzy2mXfeUbhu4+ZDpcTM1D+pnN5ZW6jtT6
   8MJ4FIzYoHfXHl37ogK/rgV6yVt+qEWdKIsW6rFdVqz6eNmpH4ozmcCtm
   A==;
X-CSE-ConnectionGUID: 0tRhc8KNRMqz9Rw5EEv6TA==
X-CSE-MsgGUID: Vzuvx7NXSfaoqwmiUUbmmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37171775"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="37171775"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:27:00 -0800
X-CSE-ConnectionGUID: 1REYJsrJTSiPZiD6X5+6Kg==
X-CSE-MsgGUID: nm1pq5z6SDaszC2GYrcywA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="110124927"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:26:58 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 484C011F88A;
	Wed, 15 Jan 2025 16:26:55 +0200 (EET)
Date: Wed, 15 Jan 2025 14:26:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 16/19] media: i2c: ds90ub960: Enable SSCG for UB9702
Message-ID: <Z4fFr-ZgCIFT_PTx@kekkonen.localdomain>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-16-e0b9a1f644da@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-ub9xx-improvements-v1-16-e0b9a1f644da@ideasonboard.com>

Moi,

On Fri, Jan 10, 2025 at 11:14:16AM +0200, Tomi Valkeinen wrote:
> From: Jai Luthra <jai.luthra@ideasonboard.com>
> 
> UB9702 supports spread-spectrum clock generation for the back-channel
> clock, which is futher used by serializers in synchronous mode to
> generate the forward-channel clock, which can help reduce peak EMI
> energy. The SSCG is common to all RX ports, so it can only be used if
> all the ports are in the same mode.
> 
> Add basic support for SSCG by adding a module parameter to enable the
> SSCG. The SSCG uses hardcoded configurationg, with 0.5% center-spread at
> 33kHz modulation rate. See datasheet if different configuration is
> required.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/i2c/ds90ub960.c | 102 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index f6d6c2fe12cd..a534d077f045 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -52,6 +52,10 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
> +static bool ub960_enable_sscg;
> +module_param_named(enable_sscg, ub960_enable_sscg, bool, 0644);
> +MODULE_PARM_DESC(enable_sscg, "Enable SSCG (if available)");

Shouldn't this come from DT instead?

-- 
Terveisin,

Sakari Ailus

