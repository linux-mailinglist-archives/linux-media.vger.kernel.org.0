Return-Path: <linux-media+bounces-56575-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGHmLQi+vWnyAwMAu9opvQ
	(envelope-from <linux-media+bounces-56575-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 22:37:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA81F2E172B
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 22:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A48F030209A6
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 21:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5833D5222;
	Fri, 20 Mar 2026 21:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZ6SjA6m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB46371057;
	Fri, 20 Mar 2026 21:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774042473; cv=none; b=YNfnfTvf9vh+pY1NJuYn2WU/T6TSFeM64BZQs5UAcG8gg/f7GuAkX4hW89MG6B3vsUs9/XV3gediscFEKqn5QZ+/nVm/+ViavtG3bazfvhU8ej1dyOlJ381LqjZwL5RK+0lT1kr6X00/sGjUXvoQQmF54yXmhfxSoWPowaKuJFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774042473; c=relaxed/simple;
	bh=mwwRIZbIIjglGv2fkJRIeVm4T2zTWqXi0WAyiRBPWqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktl2+q5KQrWw7t93MbUO7Z8oYt9FgVhsVhL5qrmkZl/j1xbnHmxm/Aoh57CVGzMF3P4TZRfeY3oXSn6Iisi9rdHnVAmAHNcXbLPEXmTzjmxQmZosmRF1Pn5SzzTaQCCvEmaO4gGSpnoQ4vnIX7o4GraCT9NYFKZvo/1DDdZnDRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZ6SjA6m; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774042467; x=1805578467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mwwRIZbIIjglGv2fkJRIeVm4T2zTWqXi0WAyiRBPWqQ=;
  b=aZ6SjA6mPU1N25s1asBwWmbm4pdTTMFcTVOb2OydcPvlTpZIMC+OCWvI
   watz1ipTtlGdf7OF5jNuaDemWZmRe2BS0XycP6pXoyOO988Fd45AxlR2s
   p5Y2NTLtjxTaAmzlZ1TR700WpazKheiOyYeR3zZyvQds1gvkbSWzpjWTN
   Q31KBabCvsEa76LUb6Pn3OjP4Aks4IjcHuWNu+FPBDbVzjXQGRz1uzwdE
   vhvbXhH9s7lJJLc1d1tjwnT5EblEVp46YQM1tIns4iezFFSjChbzpYHuG
   SOA9OV7EDud0NRQJXBT5L4Rqc61gjyjzdNV+9ovrGcQvphpvvFxiXd8yh
   g==;
X-CSE-ConnectionGUID: MHFVuep4To2BZ8sy45N32g==
X-CSE-MsgGUID: FanRIY5yTwyEtkOXGm3J2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75022962"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75022962"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:34:26 -0700
X-CSE-ConnectionGUID: KILZE8VNSMmX1+4z0CQwpA==
X-CSE-MsgGUID: 3PY4lNNJRQ2JOHKxFrALqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="219160127"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.171])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:34:23 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D0C0F12033A;
	Fri, 20 Mar 2026 23:34:23 +0200 (EET)
Date: Fri, 20 Mar 2026 23:34:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antoine Bernard <zalnir@proton.me>
Cc: Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH 1/3] media: i2c: ov13b10: Add dvdd, dovdd and device tree
 support
Message-ID: <ab29XzACA3gXE4MI@kekkonen.localdomain>
References: <WDExF9Cf1ELo55IwClyLBJqXeLe2-Kb2m3QYg7ex6qREa3HBG52CdMovctxuZ7W_ixhvHyjk9L73NDMCJi2ndkuDJcpzHSDs7Z5pEAgET60=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <WDExF9Cf1ELo55IwClyLBJqXeLe2-Kb2m3QYg7ex6qREa3HBG52CdMovctxuZ7W_ixhvHyjk9L73NDMCJi2ndkuDJcpzHSDs7Z5pEAgET60=@proton.me>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-56575-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,gmail.com,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,proton.me:email,intel.com:dkim]
X-Rspamd-Queue-Id: BA81F2E172B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Antoine,

Thanks for the patch.

On Fri, Mar 20, 2026 at 09:25:21AM +0000, Antoine Bernard wrote:
> From: Antoine Bernard <zalnir@proton.me>
> 
> The Xiaomi Pad 6 tablet uses the OV13B10 sensor with a device tree
> match and dvdd/dovdd voltage supply specified.
> 
> Add support for optional dvdd and dovdd voltage supply, and add
> a device tree match so that the rear camera can work on such tablets
> without an ACPI.
> 
> Signed-off-by: Antoine Bernard <zalnir@proton.me>
> ---
>  drivers/media/i2c/ov13b10.c | 53 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 5421874732bc..47eced60542c 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -708,7 +708,11 @@ struct ov13b10 {
>  	struct v4l2_ctrl_handler ctrl_handler;
>  
>  	struct clk *img_clk;
> +
>  	struct regulator *avdd;
> +	struct regulator *dvdd;
> +	struct regulator *dovdd;

Could you use the regulator bulk API instead of adding each separately?

> +
>  	struct gpio_desc *reset;
>  
>  	/* V4L2 Controls */
> @@ -1197,6 +1201,10 @@ static int ov13b10_power_off(struct device *dev)
>  
>  	if (ov13b10->avdd)
>  		regulator_disable(ov13b10->avdd);
> +	if (ov13b10->dvdd)
> +		regulator_disable(ov13b10->dvdd);
> +	if (ov13b10->dovdd)
> +		regulator_disable(ov13b10->dovdd);
>  
>  	clk_disable_unprepare(ov13b10->img_clk);
>  
> @@ -1224,6 +1232,24 @@ static int ov13b10_power_on(struct device *dev)
>  		}
>  	}
>  
> +	if (ov13b10->dvdd) {
> +		ret = regulator_enable(ov13b10->dvdd);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to enable dvdd: %d", ret);
> +			clk_disable_unprepare(ov13b10->img_clk);
> +			return ret;
> +		}
> +	}
> +
> +	if (ov13b10->dovdd) {
> +		ret = regulator_enable(ov13b10->dovdd);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to enable dovdd: %d", ret);
> +			clk_disable_unprepare(ov13b10->img_clk);
> +			return ret;

Error handling needs some work here.

> +		}
> +	}
> +
>  	gpiod_set_value_cansleep(ov13b10->reset, 0);
>  	/* 5ms to wait ready after XSHUTDN assert */
>  	usleep_range(5000, 5500);
> @@ -1500,6 +1526,24 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
>  					     "failed to get avdd regulator\n");
>  	}
>  
> +	ov13b->dvdd = devm_regulator_get_optional(ov13b->dev, "dvdd");
> +	if (IS_ERR(ov13b->dvdd)) {
> +		ret = PTR_ERR(ov13b->dvdd);
> +		ov13b->dvdd = NULL;
> +		if (ret != -ENODEV)
> +			return dev_err_probe(ov13b->dev, ret,
> +					     "failed to get dvdd regulator\n");
> +	}
> +
> +	ov13b->dovdd = devm_regulator_get_optional(ov13b->dev, "dovdd");
> +	if (IS_ERR(ov13b->dovdd)) {
> +		ret = PTR_ERR(ov13b->dovdd);
> +		ov13b->dovdd = NULL;
> +		if (ret != -ENODEV)
> +			return dev_err_probe(ov13b->dev, ret,
> +					     "failed to get dovdd regulator\n");
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1700,11 +1744,20 @@ static const struct acpi_device_id ov13b10_acpi_ids[] = {
>  MODULE_DEVICE_TABLE(acpi, ov13b10_acpi_ids);
>  #endif
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id ov13b10_of_match[] = {
> +	{.compatible = "ovti,ov13b10"},

{ Spaces inside braces, please. }

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ov13b10_of_match);
> +#endif
> +
>  static struct i2c_driver ov13b10_i2c_driver = {
>  	.driver = {
>  		.name = "ov13b10",
>  		.pm = pm_ptr(&ov13b10_pm_ops),
>  		.acpi_match_table = ACPI_PTR(ov13b10_acpi_ids),
> +		.of_match_table = of_match_ptr(ov13b10_of_match),

No need for of_match_ptr() here -- ACPI supports device probing through
of_match_table, too.

>  	},
>  	.probe = ov13b10_probe,
>  	.remove = ov13b10_remove,

-- 
Regards,

Sakari Ailus

