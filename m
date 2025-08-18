Return-Path: <linux-media+bounces-40096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E0B29B19
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0052189497A
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06301280CFC;
	Mon, 18 Aug 2025 07:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Thtj8RMQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79CF280035;
	Mon, 18 Aug 2025 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755503079; cv=none; b=BS3tvKq/ecL0s0v4kqylLettQaNZXaEf0YKvU/M8tFExb+9dZSmbgpdnO5+9vbyCU8Zs83pGBuT71CxUTENlHasjTmZRWCo7oyV1q61c9gZMGVAx+pNz7zTElgBOqYhHMeAlqdQuhGcuW9xf74LHJiSQm8vGUar2ANQOqdFZ9oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755503079; c=relaxed/simple;
	bh=IKEc1I2OJR13oC2ScvzhXBsU1/PrtRAkuEoIy4Zrdis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQ+dNYQclGj2m/Ke+48P3/5KgZ/4Emxa9SE4CVTew87P+BQ/p8WVOky5F4O1KKEqhInRGIe3AEz5GXPOU79GbU9pGhBZ2q9sVtojxGYkP0FtTvo0nYn7r8UxKrljPjOJCfekd8xS8F+1Xb3Xo7w4fY7f5ask8pvyPJR5e2EPqZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Thtj8RMQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755503078; x=1787039078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IKEc1I2OJR13oC2ScvzhXBsU1/PrtRAkuEoIy4Zrdis=;
  b=Thtj8RMQjkRni1o9M7w49Yk0xENJz4ziYoz6nI88LycYcN6uMSygyJi7
   xUfykDfiHYrjpmQ5sXfD11n1yajx7hnDkfmYolP4wLqll+t2t4s7NbYhR
   iymE3z9fJDz5F9j1UBBUliTaI3f0yQO9wQxGsO8xlxHFdS1DWgVtmxDdN
   WOI9l1rr/2ttb14w3KsFly0s9Kva/nlz8ijEhzGMg2YnTEvQX16u3l+jW
   mR5+bNpVO8VMSnDt88Bnvl1FZ1QrM5cJDnK0t/E09zDB1lOZ4Mm+7+NOD
   sSUQ6E6yzAXKJzSNPpZ9Bc+cg9l/E/LwKowmY4YPFU7Wggd+ZhQ+vIMIf
   w==;
X-CSE-ConnectionGUID: 3POw+fskSzi6Tln5GN8F+g==
X-CSE-MsgGUID: a7ww4TX0RnqisCaPl4+Kng==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="61556165"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61556165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 00:44:37 -0700
X-CSE-ConnectionGUID: zECi+cTeSkK5bfgNY2VcPQ==
X-CSE-MsgGUID: 7UKN+WePTdCrQSRSOwb8Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="198522267"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.152])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 00:44:34 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A159012031D;
	Mon, 18 Aug 2025 10:44:31 +0300 (EEST)
Date: Mon, 18 Aug 2025 07:44:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 7/7] media: i2c: dw9719: Fix power on/off sequence
Message-ID: <aKLZ39IzI_azrDIu@kekkonen.localdomain>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
 <20250817-dw9719-v1-7-426f46c69a5a@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250817-dw9719-v1-7-426f46c69a5a@apitzsch.eu>

Hi André,

On Sun, Aug 17, 2025 at 07:09:26PM +0200, André Apitzsch via B4 Relay wrote:
> From: Val Packett <val@packett.cool>
> 
> The "jiggle" code was not actually expecting failure, which it should
> because that's what actually happens when the device wasn't already woken
> up by the regulator power-on (i.e. in the case of a shared regulator).
> 
> Also, do actually enter the internal suspend mode on shutdown, to save
> power in the case of a shared regulator.
> 
> Also, wait a bit longer (2x tOPR) on waking up, 1x is not enough at least
> on the DW9718S as found on the motorola-nora smartphone.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/dw9719.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index 63c7fd4ab70a0e02518252b23b89c45df4ba273d..dd28a0223d6ac980084b1f661bd029ea6b0be503 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c
> @@ -95,12 +95,19 @@ struct dw9719_device {
>  
>  static int dw9719_power_down(struct dw9719_device *dw9719)
>  {
> +	u32 reg_pwr = (dw9719->model == DW9718S) ? DW9718S_PD : DW9719_CONTROL;

Extra parentheses.

> +
> +	/*
> +	 * Worth engaging the internal SHUTDOWN mode especially due to the
> +	 * regulator being potentially shared with other devices.
> +	 */
> +	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN, NULL);

I'd still complain if this fails as we don't return the error.

>  	return regulator_disable(dw9719->regulator);
>  }
>  
>  static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>  {
> -	u32 reg_pwr;
> +	u32 reg_pwr = (dw9719->model == DW9718S) ? DW9718S_PD : DW9719_CONTROL;

Extra parentheses.

>  	u64 val;
>  	int ret;
>  	int err;
> @@ -109,13 +116,15 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>  	if (ret)
>  		return ret;
>  
> -	/* Jiggle SCL pin to wake up device */
> -	reg_pwr = (dw9719->model == DW9718S) ? DW9718S_PD : DW9719_CONTROL;
> -	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN, &ret);
> -	fsleep(100);
> +	/*
> +	 * Need 100us to transition from SHUTDOWN to STANDBY.
> +	 * Jiggle the SCL pin to wake up the device (even when the regulator
> +	 * is shared) and wait double the time to be sure, then retry the write.

Why double? Isn't the datasheet correct when it comes to the power-on
sequence?

> +	 */
> +	cci_write(dw9719->regmap, reg_pwr, DW9719_STANDBY, &ret);
> +	ret = 0; /* the jiggle is expected to fail, don't even log that as error */
> +	fsleep(200);
>  	cci_write(dw9719->regmap, reg_pwr, DW9719_STANDBY, &ret);

Just pass NULL instead of ret as we don't check the value and the ret
assignment above becomes redundant. Please spare the comment though.

> -	/* Need 100us to transit from SHUTDOWN to STANDBY */
> -	fsleep(100);
>  
>  	if (detect) {
>  		/* This model does not have an INFO register */
> 

-- 
Regards,

Sakari Ailus

