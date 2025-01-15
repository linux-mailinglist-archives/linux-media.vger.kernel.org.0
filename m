Return-Path: <linux-media+bounces-24788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 042BEA125FD
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 15:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 437AA188B931
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 14:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A53824A0;
	Wed, 15 Jan 2025 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kren/GoB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F878289;
	Wed, 15 Jan 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736951114; cv=none; b=uO8dRIfpP+Q44kCFWs7Bl8zHaf2Tq57jWAd3Kh24G7pndgCtXJOGmO4uJZTNA8pdo2IxBiCj+XRjce6OjTwZ1yzoAzNC8B6R2e5BffNQTPLRSOTLN7lkGdJfg1G+4r4GoB3QpKc/6cCXkDbRq74ite+44UNmMRXilVP5Z7EJMso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736951114; c=relaxed/simple;
	bh=62StWwxYii/GNRtwycjsTiAvIRWmaHYxk0UCF5Rkn+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qqn4eR2ch0415exGex8CEOY9C84YOvX6mAberKOgHxUzoUtr6W2xsMnhWk0ztXOtcAtaCF9xzGO0TXuiEXidao+7LQaS/5NkCN4cZI8HfXbHCqLCCZRkGek37uwN1qpvcb+Ukfef52Oqzu1ZmTtsdm8OhH6apaH/OuMSPusqLt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kren/GoB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736951113; x=1768487113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=62StWwxYii/GNRtwycjsTiAvIRWmaHYxk0UCF5Rkn+I=;
  b=Kren/GoBbxe/VhWO5OB3kSmqJyOmzXmZenwv8PTXtqFMZrOdxR0zSL/8
   f52xhgpIXxzF0Ece0eOZ+fhPVlS6fs7vjec8HuZiPYnTe7KYg2sjtDlSW
   1cfs9fgiZx39upsjwgivukt7fAYO8rJpL9WbPsFh32ct4/Kb46KjuLkU1
   jLHEXXygqOPLLAPlayjhILgBSTVxAYQlWHOc5nubyZqKhMw9MEpWHC671
   7b24bI141BDGIZIu7HZrNz+0PvrGuroH23plg3lFy+EaXSEu/xshicohk
   gq6sHQBz1hJGYt0W9Qr3wKgflZkDv7WgX25lt809kLjnsHIN0nbMM8fJG
   g==;
X-CSE-ConnectionGUID: 1ncsjuR3Qrq7dc6j3Sm68A==
X-CSE-MsgGUID: 7EZxNH9WTt+zKHw6tvxg1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41051793"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="41051793"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:25:13 -0800
X-CSE-ConnectionGUID: QHbaO8RZQ3ua5QaDq5JWHA==
X-CSE-MsgGUID: I7lKnBofRcet0Jo2ldwrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="104911961"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:25:11 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9D2C611F8B3;
	Wed, 15 Jan 2025 16:25:08 +0200 (EET)
Date: Wed, 15 Jan 2025 14:25:08 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 13/19] media: i2c: ds90ub960: Move all RX port init code
 into ub960_init_rx_ports()
Message-ID: <Z4fFRJfgwSCcmrbd@kekkonen.localdomain>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-13-e0b9a1f644da@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-ub9xx-improvements-v1-13-e0b9a1f644da@ideasonboard.com>

Moi,

On Fri, Jan 10, 2025 at 11:14:13AM +0200, Tomi Valkeinen wrote:
> We have some code in probe() which is related to RX port initialization,
> and should be in ub960_init_rx_ports(). Move the code there.
> 
> We also move ub960_reset() so that it is accessible from
> ub960_init_rx_ports().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/i2c/ds90ub960.c | 115 ++++++++++++++++++++++--------------------
>  1 file changed, 59 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 02e22ae813fa..cc944d737524 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -1225,6 +1225,33 @@ static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
>  	return ret;
>  }
>  
> +static int ub960_reset(struct ub960_data *priv, bool reset_regs)
> +{
> +	struct device *dev = &priv->client->dev;
> +	unsigned int v;
> +	int ret;
> +	u8 bit;
> +
> +	bit = reset_regs ? UB960_SR_RESET_DIGITAL_RESET1 :
> +			   UB960_SR_RESET_DIGITAL_RESET0;
> +
> +	ret = ub960_write(priv, UB960_SR_RESET, bit, NULL);
> +	if (ret)
> +		return ret;

Not related to the patch but if you're serialising things below, why aren't
you doing that here?

> +
> +	mutex_lock(&priv->reg_lock);
> +
> +	ret = regmap_read_poll_timeout(priv->regmap, UB960_SR_RESET, v,
> +				       (v & bit) == 0, 2000, 100000);
> +
> +	mutex_unlock(&priv->reg_lock);
> +
> +	if (ret)
> +		dev_err(dev, "reset failed: %d\n", ret);
> +
> +	return ret;
> +}

-- 
Terveisin,

Sakari Ailus

