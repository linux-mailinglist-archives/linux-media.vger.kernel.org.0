Return-Path: <linux-media+bounces-24786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B76BA125BE
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 15:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A667C1889359
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 14:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D5570820;
	Wed, 15 Jan 2025 14:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6Hxv29g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D47E24A7DA;
	Wed, 15 Jan 2025 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736950660; cv=none; b=bA93lf1PYE5V0uU/EO8t56qzpMzkSHtO0UHZOgP3lKo3yiU/bwFOc3AbUxEWN9d33jG80W7Pmky8GDaPmmEon9+VJLc++Rt9sh9Zmzwif40LjJMyJhEGpqIiTdqBXFidc2adO20UM2SQ7gwKx9KV4azZ/+CYY6ccbKqxCpdrhTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736950660; c=relaxed/simple;
	bh=n4xbIfkmEvFl5xX20W8Uyi6cS89Wa3p3K+vvAt5pcIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLJMNevG5IMT3qOM63HP2S0lipTJYFT67DGSxDeY7819j+mgmevcrfN7PeNBXH2yEOk5A2eTosshNO1eOv5Grad6diPF+41PGENpdzH16aaxTEYAL3FncSBbMKz5nDv/UB4/mGxQK32r+ydjKEzgBoa4HPqv16A2r/tk9HCCeaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6Hxv29g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736950658; x=1768486658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n4xbIfkmEvFl5xX20W8Uyi6cS89Wa3p3K+vvAt5pcIc=;
  b=a6Hxv29goGLH1Ony8bcaJF0DU7pxsl6I2fa/peN6k4vDQ5eebwQ/MjtC
   /cCSH2TCsAPt9KU6S9+iFWtGDs/XHS/8ihoei/fPHgz0wwE2L9Q2km9lF
   IJ9cx9b97xGGsrNn7jPnBwy7WCXyVsVPhv/wLjS5sgvwG6/UFlvel27Y/
   YELZrnk2/V2CbJNxNkX6Ln7YG3Lv4uUhLDYNp5rrfhVWWTv5phWtPIosW
   SHvR/ch90VT//WifUtzpGmeetl1pB0isvlFtcB/rgaXsKrJGmeSYmBZN4
   RxmvUIBz7ilH9fHFN+XpEEzPJtKtQ63tBEcZS2vvDjJ0CMi+PpAzewyRQ
   g==;
X-CSE-ConnectionGUID: OMu3xNJsRxO3JjvOnpFRnQ==
X-CSE-MsgGUID: R3cSWGorTUi255lq6na+tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37315577"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="37315577"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:17:37 -0800
X-CSE-ConnectionGUID: isz6htLaQxa/Bb1RPbAh7A==
X-CSE-MsgGUID: kbZ+WWurS+KzufH/WFhYcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="136004238"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:17:36 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A721B11F8B3;
	Wed, 15 Jan 2025 16:17:33 +0200 (EET)
Date: Wed, 15 Jan 2025 14:17:33 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 07/19] media: i2c: ds90ub953: Speed-up I2C watchdog timer
Message-ID: <Z4fDfQcnZiHC0Fms@kekkonen.localdomain>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-7-e0b9a1f644da@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-ub9xx-improvements-v1-7-e0b9a1f644da@ideasonboard.com>

Moi,

On Fri, Jan 10, 2025 at 11:14:07AM +0200, Tomi Valkeinen wrote:
> From: Jai Luthra <jai.luthra@ideasonboard.com>
> 
> On the I2C bus for remote clients (sensors), by default the watchdog
> timer expires in 1s. To allow for a quicker system bring-up time, TI
> recommends to speed it up to 50us [1].
> 
> [1]: Section 7.3.1.1 - https://www.ti.com/lit/gpn/ds90ub953-q1
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/i2c/ds90ub953.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index 99a4852b9381..6c36980e8beb 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -54,6 +54,10 @@
>  #define UB953_REG_CLKOUT_CTRL0			0x06
>  #define UB953_REG_CLKOUT_CTRL1			0x07
>  
> +#define UB953_REG_I2C_CONTROL2			0x0a
> +#define UB953_REG_I2C_CONTROL2_SDA_OUTPUT_SETUP_SHIFT	4
> +#define UB953_REG_I2C_CONTROL2_BUS_SPEEDUP	BIT(1)
> +
>  #define UB953_REG_SCL_HIGH_TIME			0x0b
>  #define UB953_REG_SCL_LOW_TIME			0x0c
>  
> @@ -1320,6 +1324,13 @@ static int ub953_hw_init(struct ub953_data *priv)
>  	if (ret)
>  		return ret;
>  
> +	v = 0;
> +	v |= 1 << UB953_REG_I2C_CONTROL2_SDA_OUTPUT_SETUP_SHIFT;

BIT()? Or at least 1U <<< ...;.

> +	v |= UB953_REG_I2C_CONTROL2_BUS_SPEEDUP;
> +	ret = ub953_write(priv, UB953_REG_I2C_CONTROL2, v, NULL);

I'd just do this without a temporary variable. If you prefer to keep it, do
assign the first calculated value there first and remove the assignment to
zero.

> +	if (ret)
> +		return ret;

No need for this.

> +
>  	return 0;
>  }
>  
> 

-- 
Terveisin,

Sakari Ailus

