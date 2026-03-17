Return-Path: <linux-media+bounces-56006-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBaJMowVuWmOpgEAu9opvQ
	(envelope-from <linux-media+bounces-56006-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:49:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFEF2A5ED1
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2905F308C2CF
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 08:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B9925A2C6;
	Tue, 17 Mar 2026 08:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z78Rw7+w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB139B483;
	Tue, 17 Mar 2026 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737171; cv=none; b=PnN4lDUukwDjwrt85O37wynDIt2STh9EIvEtIWeLKRauqLraAJNuHj3LCLkHfyCg6PKeAkrwvtYcLy9vMjff8N7wS9lYwPkIyf+9nUkEoNfHqcB6TeknrbWdUhRBNshP3CppyFzV9AMcZ4MInAbv9TZO3Mo6iZXPSzuMPVaTmB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737171; c=relaxed/simple;
	bh=lYYB2M4rOhfpUsT2sxICQbxaMvChimycMPJ5ubsc194=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtGiGSnBGaciUTdDpAcMIKRYoIpwEddvgel/nA+Y6G+BISwwvfoQegcqe91bMYxqVcGFZ4Dv+S8SiFXQDEal109QS/p0rr9CP0TN6dAej2yuLSXxeKxm4tSFW7yx/9E0sCGzND8Jo/stDn1ag7yozpjpsYA9Tkgt7NgODLKxY8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z78Rw7+w; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773737169; x=1805273169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lYYB2M4rOhfpUsT2sxICQbxaMvChimycMPJ5ubsc194=;
  b=Z78Rw7+wxgHoTFokUB6wgSNoVzurr8gPGJedSePFMJOqE9VcEXTYEjTr
   8ju4dGu6RpL+fftaY3F9p5fvGzFX6rgF3YSTpvO7sR2iLE3eSqKDmH2ar
   uc6Scm3I8THuYw2Y1eJvFInjTH6Gj1+g+T4QYQlkNTTvTckShleRFQpkd
   g4fPOsD7lwUOEg8pIkp9w6ZoXNYfAaDggEJw8RUH7r53vqbzu3h9eUcZZ
   cG5ShDTGE0Wqe2FQwfoS43Pke1cywne+T+ehA75RSld66HBstCnNhg5D7
   24C4V5HzVKJ177vK9uL2SvCqokc0sOdcmEYbwivCW8gkWDQt07fl9x3r2
   A==;
X-CSE-ConnectionGUID: IgAJN1uITQGrsGibyanrJg==
X-CSE-MsgGUID: 19Pxq8qNQkKbdwPwKw0oeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="100218948"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="100218948"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:46:08 -0700
X-CSE-ConnectionGUID: +cBoXIEDSCWAr7IKOMp3Jw==
X-CSE-MsgGUID: +XWBVvGfRH6RYxXEjBcSBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222254270"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:46:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C586C121D04;
	Tue, 17 Mar 2026 10:46:03 +0200 (EET)
Date: Tue, 17 Mar 2026 10:46:03 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Jimmy Su <jimmy.su@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v2 8/9] media: i2c: ov08d10: add support for reset and
 power management
Message-ID: <abkUy5U-cwK-6_kz@kekkonen.localdomain>
References: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
 <20260309-ov08d10-v2-8-81f8b5d99984@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-ov08d10-v2-8-81f8b5d99984@emfend.at>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56006-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,emfend.at:email]
X-Rspamd-Queue-Id: 2EFEF2A5ED1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 06:07:10PM +0100, Matthias Fend wrote:
> Add support for the required power supplies as well as the control of an
> optional sensor reset.
> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  drivers/media/i2c/ov08d10.c | 93 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
> index ce0fa30a86129302b5dda0b8796e44054fd77c88..19035991e8bb164d4fca5d87ee4551191974e8bb 100644
> --- a/drivers/media/i2c/ov08d10.c
> +++ b/drivers/media/i2c/ov08d10.c
> @@ -8,6 +8,7 @@
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -513,9 +514,17 @@ static const char * const ov08d10_test_pattern_menu[] = {
>  	"Standard Color Bar",
>  };
>  
> +static const char *const ov08d10_supply_names[] = {
> +	"dovdd",	/* Digital I/O power */
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital core power */
> +};
> +
>  struct ov08d10 {
>  	struct device *dev;
>  	struct clk *clk;
> +	struct reset_control *reset;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov08d10_supply_names)];
>  
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
> @@ -1265,6 +1274,56 @@ static const struct v4l2_subdev_internal_ops ov08d10_internal_ops = {
>  	.open = ov08d10_open,
>  };
>  
> +static int ov08d10_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov08d10 *ov08d10 = to_ov08d10(sd);
> +
> +	reset_control_assert(ov08d10->reset);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ov08d10->supplies),
> +			       ov08d10->supplies);
> +
> +	clk_disable_unprepare(ov08d10->clk);
> +
> +	return 0;
> +}
> +
> +static int ov08d10_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov08d10 *ov08d10 = to_ov08d10(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov08d10->supplies),
> +				    ov08d10->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(ov08d10->clk);
> +	if (ret < 0) {
> +		regulator_bulk_disable(ARRAY_SIZE(ov08d10->supplies),
> +				       ov08d10->supplies);
> +
> +		dev_err(dev, "failed to enable imaging clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (ov08d10->reset) {
> +		/* Delay from DVDD stable to sensor XSHUTDN pull up: 5ms */
> +		fsleep(5 * USEC_PER_MSEC);
> +
> +		reset_control_deassert(ov08d10->reset);
> +
> +		/* Delay from XSHUTDN pull up to SCCB start: 8ms */
> +		fsleep(8 * USEC_PER_MSEC);
> +	}
> +
> +	return 0;
> +}
> +
>  static int ov08d10_identify_module(struct ov08d10 *ov08d10)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&ov08d10->sd);
> @@ -1371,6 +1430,10 @@ static void ov08d10_remove(struct i2c_client *client)
>  	media_entity_cleanup(&sd->entity);
>  	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  	pm_runtime_disable(ov08d10->dev);
> +	if (!pm_runtime_status_suspended(ov08d10->dev)) {
> +		ov08d10_power_off(ov08d10->dev);
> +		pm_runtime_set_suspended(ov08d10->dev);
> +	}
>  	mutex_destroy(&ov08d10->mutex);
>  }
>  
> @@ -1378,6 +1441,7 @@ static int ov08d10_probe(struct i2c_client *client)
>  {
>  	struct ov08d10 *ov08d10;
>  	unsigned long freq;
> +	unsigned int i;
>  	int ret;
>  
>  	ov08d10 = devm_kzalloc(&client->dev, sizeof(*ov08d10), GFP_KERNEL);
> @@ -1403,12 +1467,32 @@ static int ov08d10_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> +	ov08d10->reset = devm_reset_control_get_optional_exclusive(ov08d10->dev, NULL);
> +	if (IS_ERR(ov08d10->reset))
> +		return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->reset),
> +				     "failed to get reset\n");
> +	reset_control_assert(ov08d10->reset);
> +
> +	for (i = 0; i < ARRAY_SIZE(ov08d10_supply_names); i++)

You can declare i here.

> +		ov08d10->supplies[i].supply = ov08d10_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(ov08d10->dev,
> +				      ARRAY_SIZE(ov08d10->supplies),
> +				      ov08d10->supplies);
> +	if (ret)
> +		return dev_err_probe(ov08d10->dev, ret,
> +				     "failed to get regulators\n");
> +
>  	v4l2_i2c_subdev_init(&ov08d10->sd, client, &ov08d10_subdev_ops);
>  
> +	ret = ov08d10_power_on(ov08d10->dev);
> +	if (ret)
> +		return dev_err_probe(ov08d10->dev, ret, "failed to power on\n");
> +
>  	ret = ov08d10_identify_module(ov08d10);
>  	if (ret) {
>  		dev_err(ov08d10->dev, "failed to find sensor: %d\n", ret);
> -		return ret;
> +		goto probe_error_power_off;
>  	}
>  
>  	mutex_init(&ov08d10->mutex);
> @@ -1452,9 +1536,15 @@ static int ov08d10_probe(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(ov08d10->sd.ctrl_handler);
>  	mutex_destroy(&ov08d10->mutex);
>  
> +probe_error_power_off:
> +	ov08d10_power_off(ov08d10->dev);
> +
>  	return ret;
>  }
>  
> +static DEFINE_RUNTIME_DEV_PM_OPS(ov08d10_pm_ops,
> +				 ov08d10_power_off, ov08d10_power_on, NULL);
> +
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id ov08d10_acpi_ids[] = {
>  	{ "OVTI08D1" },
> @@ -1473,6 +1563,7 @@ MODULE_DEVICE_TABLE(of, ov08d10_of_match);
>  static struct i2c_driver ov08d10_i2c_driver = {
>  	.driver = {
>  		.name = "ov08d10",
> +		.pm = pm_ptr(&ov08d10_pm_ops),
>  		.acpi_match_table = ACPI_PTR(ov08d10_acpi_ids),
>  		.of_match_table = ov08d10_of_match,
>  	},
> 

-- 
Regards,

Sakari Ailus

