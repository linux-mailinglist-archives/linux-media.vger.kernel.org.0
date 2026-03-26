Return-Path: <linux-media+bounces-57148-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM23J3Q4xWn/8AQAu9opvQ
	(envelope-from <linux-media+bounces-57148-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:45:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA1B336336
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C48B9307AC04
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B99330CD82;
	Thu, 26 Mar 2026 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvhkAMmI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05002750ED;
	Thu, 26 Mar 2026 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531612; cv=none; b=VvFrnyal3XlSUG3FSHXP8xW/ReF/5f/K+MwGy5IIl94caTS7X/tGHpXhYA8wYOS0wUb3CrEMcwJdJJA/YfInZEA3NqtnE+ELiC2/lZ+zHKfvZfOLZPr9Krsq31E7Qxxz+mSx2UW1zI354XAKmuZ24RsLWHCwATZU4ARNIDbnaEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531612; c=relaxed/simple;
	bh=SexqMFskVNAkEKpYlJo2RrIIeot0KqLjq57kyiW8S/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SE31gtuU/pBbjYfK8FhVJzmqgugMQvG9fG7JVUmQg31YdLBB9YKUXV4Tf1AUMVAjtPvyhuVeBYkG7pZSb4AVdndq2T7TM81851nKf/FouvvRVOd3VnU8Ww1qjNfUbNGmC8bhfuQ/TTtjkFrWmJsy0fTtb1rslHfr9OM3f3IaClE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvhkAMmI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774531611; x=1806067611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SexqMFskVNAkEKpYlJo2RrIIeot0KqLjq57kyiW8S/Y=;
  b=MvhkAMmIxFd/EYsGX9vjSXaVdilgP0Da1Z/xD+/N8mT8r6mizXHwco9c
   36TFNOSmPZu/l3rd0VMfp+YLKpT25iol9wBrOaZQgB9LXV7hyT9hgLivB
   sJuXp4+/gsywnKWGrGiJyC9urqAZ1TfgrDrLKVWR9g9Zt55VoVT+/uwuZ
   aiFKC+OBAAuX2ViJ0wjscTtTRpjTjDPCAZO8xrXZ7A5YX+DbBaua3akEy
   iZ4YwpBxbH5xbW0qfHTuDWz+82zRXDTgjm84vQN8v8c1ya8FF352XFmTf
   pLtImoqc0AKl7n0HRbfR7JzQ/LV5HdZCUfWPDpEJs1iy0U3U6yjQEfQmF
   A==;
X-CSE-ConnectionGUID: msbsleweQFiIKnvX2ksxnA==
X-CSE-MsgGUID: 7eWedaXATqi+7uQZiFqGkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75552061"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75552061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 06:26:50 -0700
X-CSE-ConnectionGUID: Z1s+dAf2QQSsXZXLaopfoQ==
X-CSE-MsgGUID: sxmyKaL7TQq/NM/ZAhG21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="225010759"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.1])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 06:26:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7A1A711F9E0;
	Thu, 26 Mar 2026 15:26:50 +0200 (EET)
Date: Thu, 26 Mar 2026 15:26:50 +0200
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
Subject: Re: [PATCH v3 8/9] media: i2c: ov08d10: add support for reset and
 power management
Message-ID: <acU0Gky-EldJlx0t@kekkonen.localdomain>
References: <20260324-ov08d10-v3-0-1e44069cf91e@emfend.at>
 <20260324-ov08d10-v3-8-1e44069cf91e@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-ov08d10-v3-8-1e44069cf91e@emfend.at>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57148-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,emfend.at:email]
X-Rspamd-Queue-Id: AAA1B336336
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Matthias,

A few more minor comments.

On Tue, Mar 24, 2026 at 11:41:42AM +0100, Matthias Fend wrote:
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

Don't you need the fsleep()'s (or at least the latter one) even if you have
no reset GPIO?

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

This is a bit long.

I'll take the set now but please post a fix on top.

> +	if (IS_ERR(ov08d10->reset))
> +		return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->reset),
> +				     "failed to get reset\n");
> +	reset_control_assert(ov08d10->reset);
> +
> +	for (i = 0; i < ARRAY_SIZE(ov08d10_supply_names); i++)
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

