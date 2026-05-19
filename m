Return-Path: <linux-media+bounces-62135-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNYGDVZZDGodfwUAu9opvQ
	(envelope-from <linux-media+bounces-62135-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:36:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A80BC57ECE9
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 768D130F7714
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742684DBD64;
	Tue, 19 May 2026 12:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3psIJ1c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679104DB554;
	Tue, 19 May 2026 12:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193790; cv=none; b=LVnS0v7Pbu3aOuAQGcdO1chag1bHiJh4+NnQJ5KXFPZLvz7R/fDoYPBWcF5xC7UprEXCLI9lJt2p706mZ+mXL3ZOKvpwJNAIlI37rARCyY7u2qh2b4IqlaRX1p0l3pdSnKInKI52v4Ee7q7bUNSmbT0Ce1jJtQOvyazTyjW9ols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193790; c=relaxed/simple;
	bh=3JvXRnQpZVlHPGCYeEr/g8lkDue3cr8PxiuolSK7hNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmEXmbNKipsenR12mZ+9MBDDjSWAvGv0UrWsvjoz6SeN/K2YhSOo9u4IyVVDuozSOe4/G5yQFZqfO6iFp7xakuNzj99/PT1rQwvD1xrbYFbOPdwBZdJGAiM9ixftQkfUxXgTjN6HNRROvKwwzjFrXs7IOHoae3UhjfhI35scjJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3psIJ1c; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779193789; x=1810729789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3JvXRnQpZVlHPGCYeEr/g8lkDue3cr8PxiuolSK7hNY=;
  b=S3psIJ1cZx5SPA2268M3gANDnMznuN+NH21dkIAAy2d0GzWMpc8MqeJd
   Jbq48QlYr5C2Oa13/+XjhdCWFhG7iv7IISLBLSgKl2C/cgOGWIhVVDzf5
   zmRjzFdj2SJY52j0EBX9AAYebj0woPN8JmNTMMNca3yJIxCTfvyo48vd/
   o6tz5padC2hXL+U1WemfyaiohYI9IgkPaDctkDulK01CwEC5y+4/c7HVN
   ee8/9QsSYQCJjL1U6CI4P5pjV/jXMOLeQM4iW2VxtZ37WUfCSUGjxsVHj
   Yr7hEz+xWe41YIZDbljDQz/nWeI2TIEm058WKc2kNAGk08zEU97itM3C4
   g==;
X-CSE-ConnectionGUID: 8zKVtsrSTRuX4zu45Jsvqw==
X-CSE-MsgGUID: 21tH9z6xQfWlVUG0uUoVPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79215360"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79215360"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:29:48 -0700
X-CSE-ConnectionGUID: psAM+muJROaY7mtaGiVz+Q==
X-CSE-MsgGUID: AsfMfCI2RTiSYCgTnbM38Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244726351"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.204])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:29:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 77CFE120E58;
	Tue, 19 May 2026 15:29:39 +0300 (EEST)
Date: Tue, 19 May 2026 15:29:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, sjoerd@collabora.com,
	dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v12 15/17] media: cadence: csi2rx: Support runtime PM
Message-ID: <agxXs3irq0pZkg5O@kekkonen.localdomain>
References: <20260313090701.646534-1-r-donadkar@ti.com>
 <20260313090701.646534-16-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313090701.646534-16-r-donadkar@ti.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62135-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,starfivetech.com:email,kekkonen.localdomain:mid,intel.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A80BC57ECE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rishikes,

On Fri, Mar 13, 2026 at 02:36:59PM +0530, Rishikesh Donadkar wrote:
> From: Changhuang Liang <changhuang.liang@starfivetech.com>
> 
> Use runtime power management hooks to save power when CSI-RX is not in
> use. Also, shift to goto based error handling in
> csi2rx_enable_streams() function
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/Kconfig       |   1 +
>  drivers/media/platform/cadence/cdns-csi2rx.c | 136 ++++++++++++-------
>  2 files changed, 88 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
> index 1aa608c00dbce..ea85ef82760e6 100644
> --- a/drivers/media/platform/cadence/Kconfig
> +++ b/drivers/media/platform/cadence/Kconfig
> @@ -5,6 +5,7 @@ comment "Cadence media platform drivers"
>  config VIDEO_CADENCE_CSI2RX
>  	tristate "Cadence MIPI-CSI2 RX Controller"
>  	depends on VIDEO_DEV
> +	depends on PM
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index f34df341a2cac..18737d00a7d7a 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -340,11 +340,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	u32 reg;
>  	int ret;
>  
> -	ret = clk_prepare_enable(csi2rx->p_clk);
> -	if (ret)
> -		return ret;
> -
> -	reset_control_deassert(csi2rx->p_rst);
>  	csi2rx_reset(csi2rx);
>  
>  	if (csi2rx->error_irq >= 0)
> @@ -385,7 +380,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  		if (ret) {
>  			dev_err(csi2rx->dev,
>  				"Failed to configure external DPHY: %d\n", ret);
> -			goto err_disable_pclk;
> +			return ret;
>  		}
>  	}
>  
> @@ -400,12 +395,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	 * hence the reference counting.
>  	 */
>  	for (i = 0; i < csi2rx->max_streams; i++) {
> -		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
> -		if (ret)
> -			goto err_disable_pixclk;
> -
> -		reset_control_deassert(csi2rx->pixel_rst[i]);
> -
>  		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
>  			       FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
>  					  csi2rx->num_pixels[i]),
> @@ -418,30 +407,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
>  	}
>  
> -	ret = clk_prepare_enable(csi2rx->sys_clk);
> -	if (ret)
> -		goto err_disable_pixclk;
> -
> -	reset_control_deassert(csi2rx->sys_rst);
> -
> -	clk_disable_unprepare(csi2rx->p_clk);
>  
>  	return 0;
> -
> -err_disable_pixclk:
> -	for (; i > 0; i--) {
> -		reset_control_assert(csi2rx->pixel_rst[i - 1]);
> -		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
> -	}
> -
> -	if (csi2rx->dphy) {
> -		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
> -		phy_power_off(csi2rx->dphy);
> -	}
> -err_disable_pclk:
> -	clk_disable_unprepare(csi2rx->p_clk);
> -
> -	return ret;
>  }
>  
>  static void csi2rx_stop(struct csi2rx_priv *csi2rx)
> @@ -450,10 +417,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	u32 val;
>  	int ret;
>  
> -	clk_prepare_enable(csi2rx->p_clk);
> -	reset_control_assert(csi2rx->sys_rst);
> -	clk_disable_unprepare(csi2rx->sys_clk);
> -
>  	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
>  
>  	for (i = 0; i < csi2rx->max_streams; i++) {
> @@ -468,14 +431,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  		if (ret)
>  			dev_warn(csi2rx->dev,
>  				 "Failed to stop streaming on pad%u\n", i);
> -
> -		reset_control_assert(csi2rx->pixel_rst[i]);
> -		clk_disable_unprepare(csi2rx->pixel_clk[i]);
>  	}
>  
> -	reset_control_assert(csi2rx->p_rst);
> -	clk_disable_unprepare(csi2rx->p_clk);
> -
>  	if (csi2rx->dphy) {
>  		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
>  
> @@ -549,10 +506,15 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>  	 * enable the whole controller.
>  	 */
>  	if (!csi2rx->count) {
> +		ret = pm_runtime_resume_and_get(csi2rx->dev);
> +		if (ret < 0)
> +			goto err;
> +
>  		csi2rx_update_vc_select(csi2rx, state);
> +
>  		ret = csi2rx_start(csi2rx);
>  		if (ret)
> -			return ret;
> +			goto err_put_pm;
>  	}
>  
>  	/* Start streaming on the source */
> @@ -562,13 +524,20 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>  		dev_err(csi2rx->dev,
>  			"Failed to start streams %#llx on subdev\n",
>  			sink_streams);
> -		if (!csi2rx->count)
> -			csi2rx_stop(csi2rx);
> -		return ret;
> +		goto err_stop_csi;
>  	}
>  
>  	csi2rx->count++;
>  	return 0;
> +
> +err_stop_csi:
> +	if (!csi2rx->count)
> +		csi2rx_stop(csi2rx);
> +err_put_pm:
> +	if (!csi2rx->count)
> +		pm_runtime_put(csi2rx->dev);
> +err:
> +	return ret;
>  }
>  
>  static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
> @@ -590,8 +559,10 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
>  	csi2rx->count--;
>  
>  	/* Let the last user turn off the lights. */
> -	if (!csi2rx->count)
> +	if (!csi2rx->count) {
>  		csi2rx_stop(csi2rx);
> +		pm_runtime_put(csi2rx->dev);
> +	}
>  
>  	return 0;
>  }
> @@ -1078,6 +1049,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_cleanup;
>  
> +	pm_runtime_enable(csi2rx->dev);
>  	ret = v4l2_async_register_subdev(&csi2rx->subdev);
>  	if (ret < 0)
>  		goto err_free_state;
> @@ -1092,6 +1064,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>  
>  err_free_state:
>  	v4l2_subdev_cleanup(&csi2rx->subdev);
> +	pm_runtime_disable(csi2rx->dev);
>  err_cleanup:
>  	v4l2_async_nf_unregister(&csi2rx->notifier);
>  	v4l2_async_nf_cleanup(&csi2rx->notifier);
> @@ -1110,9 +1083,73 @@ static void csi2rx_remove(struct platform_device *pdev)
>  	v4l2_async_unregister_subdev(&csi2rx->subdev);
>  	v4l2_subdev_cleanup(&csi2rx->subdev);
>  	media_entity_cleanup(&csi2rx->subdev.entity);
> +	pm_runtime_disable(csi2rx->dev);
>  	kfree(csi2rx);
>  }
>  
> +static int csi2rx_runtime_suspend(struct device *dev)
> +{
> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> +	unsigned int i;
> +
> +	reset_control_assert(csi2rx->sys_rst);
> +	clk_disable_unprepare(csi2rx->sys_clk);
> +
> +	for (i = 0; i < csi2rx->max_streams; i++) {

You could declare i here.

> +		reset_control_assert(csi2rx->pixel_rst[i]);
> +		clk_disable_unprepare(csi2rx->pixel_clk[i]);
> +	}
> +
> +	reset_control_assert(csi2rx->p_rst);
> +	clk_disable_unprepare(csi2rx->p_clk);
> +
> +	return 0;
> +}
> +
> +static int csi2rx_runtime_resume(struct device *dev)
> +{
> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> +	unsigned int i;
> +	int ret;
> +
> +	ret = clk_prepare_enable(csi2rx->p_clk);
> +	if (ret)
> +		return ret;
> +
> +	reset_control_deassert(csi2rx->p_rst);
> +
> +	for (i = 0; i < csi2rx->max_streams; i++) {
> +		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
> +		if (ret)
> +			goto err_disable_pixclk;
> +
> +		reset_control_deassert(csi2rx->pixel_rst[i]);
> +	}
> +
> +	ret = clk_prepare_enable(csi2rx->sys_clk);
> +	if (ret)
> +		goto err_disable_pixclk;
> +
> +	reset_control_deassert(csi2rx->sys_rst);
> +
> +	return 0;
> +
> +err_disable_pixclk:
> +	for (; i > 0; i--) {

	while (i--) {

?

> +		reset_control_assert(csi2rx->pixel_rst[i - 1]);
> +		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);

Then you can refer to i here instead instead of i - 1.

> +	}
> +
> +	reset_control_assert(csi2rx->p_rst);
> +	clk_disable_unprepare(csi2rx->p_clk);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops csi2rx_pm_ops = {
> +	RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
> +};
> +
>  static const struct of_device_id csi2rx_of_table[] = {
>  	{ .compatible = "starfive,jh7110-csi2rx" },
>  	{ .compatible = "cdns,csi2rx" },
> @@ -1127,6 +1164,7 @@ static struct platform_driver csi2rx_driver = {
>  	.driver	= {
>  		.name		= "cdns-csi2rx",
>  		.of_match_table	= csi2rx_of_table,
> +		.pm		= &csi2rx_pm_ops,
>  	},
>  };
>  module_platform_driver(csi2rx_driver);

-- 
Regards,

Sakari Ailus

