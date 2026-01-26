Return-Path: <linux-media+bounces-51527-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FtMO5E1d2nhdAEAu9opvQ
	(envelope-from <linux-media+bounces-51527-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:36:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E78617F
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BD133017791
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8DD315D3A;
	Mon, 26 Jan 2026 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpYqq4CY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E96C329E5B;
	Mon, 26 Jan 2026 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769420128; cv=none; b=CDgFP1M6h6hK5r5w9LXbSsXRAIPEaZbfxIHtp+VZm+DA/E1FQSMxOxhkyOZ0qV6/5r9t21PmvjNhOBYzhJmsBJenbWGHEFPiI4NZSPTFYUeqoLjMIFNt0QBvI5N+dpFQsMLbonmHh2k5FK33AEiJvpaHFGKbqMJtcC5TbNtNrfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769420128; c=relaxed/simple;
	bh=JZds0NMA4P4PzEpzRbW+6F9wzRP0gCh/YmzvHCHtixI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5nTY1EuF1r0wMNgTq/2X35Cx3b6hDRE/ZCDkHaH1ma05KndykF0IaeOv0gont/idd36lh3egQoy0pfOFS6G1ZzenUX/jaKgYKuKW4ytRQkNwaiZzTzT5a+9IpjylzIRUBZkLnd6I13hIE9Bw59jETOu9qZotXiRlsEeXfQOai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpYqq4CY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769420127; x=1800956127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JZds0NMA4P4PzEpzRbW+6F9wzRP0gCh/YmzvHCHtixI=;
  b=NpYqq4CYDdiyBx84+znBpfwtue5V8Z+NApmYUv1shjGzFXY5/rjGFrXP
   oqLUjuwqb4aJev/TQW3yvwMufooqI/UvuuoCDPIAuJjT+LuI3vSCGyTUQ
   nx4BTT7SDaGKy/QQwSjajAhnnGumaVQC5sA7tynWU2XaPbmOcB9VPbh9f
   SZikXQEKj6fH28/nckpCOE0+XuH21tUL+1SGyxjr98DtEDuDgSxPin1V+
   q/zHRV6g1aCnNBGHaF8ZyF6yaq+5F5m0eeQQl9EH/mbuCl9UhAa3dbGpe
   mb/LPvzbmvpY2IsyxXyiN4ZeLv69ANvZ6UJQXNPV0Jx4MU/xK7UOtIM83
   A==;
X-CSE-ConnectionGUID: u5eVKJY2Sha/baOacoLChQ==
X-CSE-MsgGUID: 2OenucHhTuWhaayXLKnI/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70562789"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70562789"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 01:35:26 -0800
X-CSE-ConnectionGUID: wKmY/xsATa+Dcclxboce6Q==
X-CSE-MsgGUID: OfJJi0rtRZG9j5CDsp+FDg==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.100])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 01:35:23 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B2AF412081C;
	Mon, 26 Jan 2026 11:35:27 +0200 (EET)
Date: Mon, 26 Jan 2026 11:35:27 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: i2c: mt9m114: add support for Aptina MI1040
Message-ID: <aXc1XwD8Wo2yu4dv@kekkonen.localdomain>
References: <20260126083430.8247-1-clamor95@gmail.com>
 <20260126083430.8247-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126083430.8247-3-clamor95@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51527-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 734E78617F
X-Rspamd-Action: no action

Hi Svyatoslav,

Thanks for the patchset.

On Mon, Jan 26, 2026 at 10:34:30AM +0200, Svyatoslav Ryhel wrote:
> Slightly different version of MT9M114 camera module is used in a several
> devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
> called Aptina MI1040. Only difference found so far is lacking ability to

s/Only/The only/

> poll STATUS and COMMAND registers during power on sequence, which causes
> driver to fail with time out error. Add polling flag to diverge models and
> address quirk found in MI1040.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/media/i2c/mt9m114.c | 35 ++++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 4ec033c0ee84..d96a57ebcad4 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -368,6 +368,10 @@ enum {
>   * Data Structures
>   */
>  
> +struct mt9m114_model_info {
> +	bool polling;
> +};
> +
>  enum mt9m114_format_flag {
>  	MT9M114_FMT_FLAG_PARALLEL = BIT(0),
>  	MT9M114_FMT_FLAG_CSI2 = BIT(1),
> @@ -421,6 +425,8 @@ struct mt9m114 {
>  
>  		struct v4l2_ctrl *tpg[4];
>  	} ifp;
> +
> +	const struct mt9m114_model_info *info;
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -2186,9 +2192,11 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
>  	 */
>  	usleep_range(44500, 50000);
>  
> -	ret = mt9m114_poll_command(sensor, MT9M114_COMMAND_REGISTER_SET_STATE);
> -	if (ret < 0)
> -		goto error_clock;
> +	if (sensor->info->polling) {
> +		ret = mt9m114_poll_command(sensor, MT9M114_COMMAND_REGISTER_SET_STATE);
> +		if (ret < 0)
> +			goto error_clock;
> +	}

What does the datasheet say, is there a need to do something else instead?
As the polling is there to ensure firmware has done its job, the need
appears to still be there.

>  
>  	if (sensor->bus_cfg.bus_type == V4L2_MBUS_PARALLEL) {
>  		/*
> @@ -2207,9 +2215,11 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
>  	 * reaches the standby mode (either initiated manually above in
>  	 * parallel mode, or automatically after reset in MIPI mode).
>  	 */
> -	ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
> -	if (ret < 0)
> -		goto error_clock;
> +	if (sensor->info->polling) {
> +		ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);

Ditto.

> +		if (ret < 0)
> +			goto error_clock;
> +	}
>  
>  	return 0;
>  
> @@ -2421,6 +2431,8 @@ static int mt9m114_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
>  
> +	sensor->info = of_device_get_match_data(dev);

You can use device_get_match_data() here.

> +
>  	/* Acquire clocks, GPIOs and regulators. */
>  	sensor->clk = devm_v4l2_sensor_clk_get(dev, NULL);
>  	if (IS_ERR(sensor->clk)) {
> @@ -2539,8 +2551,17 @@ static void mt9m114_remove(struct i2c_client *client)
>  	pm_runtime_set_suspended(dev);
>  }
>  
> +static const struct mt9m114_model_info mt9m114_models_default = {
> +	.polling = true,
> +};
> +
> +static const struct mt9m114_model_info mt9m114_models_aptina = {
> +	.polling = false,
> +};
> +
>  static const struct of_device_id mt9m114_of_ids[] = {
> -	{ .compatible = "onnn,mt9m114" },
> +	{ .compatible = "onnn,mt9m114", .data = &mt9m114_models_default },
> +	{ .compatible = "aptina,mi1040", .data = &mt9m114_models_aptina },
>  	{ /* sentinel */ },

The sentinel entry shouldn't have a comma. Feel free to fix that while at
it.

>  };
>  MODULE_DEVICE_TABLE(of, mt9m114_of_ids);

-- 
Kind regards,

Sakari Ailus

