Return-Path: <linux-media+bounces-59106-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bna8Ix8U5WnBeAEAu9opvQ
	(envelope-from <linux-media+bounces-59106-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 19:42:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D272F424E98
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 19:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7911E3024179
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 17:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D1A2E6CA6;
	Sun, 19 Apr 2026 17:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O0NtrnuD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E22C2360;
	Sun, 19 Apr 2026 17:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776620565; cv=none; b=GenHM/soYUzMFNhmyUaPOYIWVOW+MAOUduKlvNeGJBqc/jRfPPVAPVzNsmZj4OYMUYRP11m5aYVfqkZ4NzsSr04Ib0lLffwJTmpg9FBz5KvaxupD0TYmOLllQpOTLci5OgYV19pblHPn4PbgXWawYZQAvp0t9oXGn1QQX2rNPuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776620565; c=relaxed/simple;
	bh=+7n0vGFLVHAm0es3fJQGAdt4Or2gXy+mb8O4PLzm/w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQVEB04UuGH+eZ5iAs98TyosyIRNDPfM7oqwrcbDYOWsUm0/4CDC4uzQcKDRd71qfFsT3V5x7BxTv1RriQGyVcvbRImRAhytv4skOGUWz6TlmEg0uldDdtwbjj3m/qk6zciLio0V2TqBfGdO0okfDih/CdU0eAb0ongDKOnCGXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O0NtrnuD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BE4DC227;
	Sun, 19 Apr 2026 19:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776620458;
	bh=+7n0vGFLVHAm0es3fJQGAdt4Or2gXy+mb8O4PLzm/w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0NtrnuDowGyorGMluMW74XYe32ABwJTDtryX1Vu3IGV1RwRd5YSD/t5eAujA8ohn
	 J/pMrTU+72ryPmGFcQ8LToH9Xetg7203ULK8+G3p6JR9F3lV6s+nibsCQse/nd/+DH
	 cVZsxFgoCoEhSSbI+jaPZBReZ6AmCVzg609gY0Ww=
Date: Sun, 19 Apr 2026 20:42:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Mast <rn.mast@zonnet.nl>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] media: atomisp: mt9m114: graceful teardown and
 reprobe fixes
Message-ID: <20260419174232.GA2132506@killaraus.ideasonboard.com>
References: <20260419152546.78513-1-rn.mast@zonnet.nl>
 <20260419152546.78513-2-rn.mast@zonnet.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260419152546.78513-2-rn.mast@zonnet.nl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59106-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[zonnet.nl];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,zonnet.nl:email]
X-Rspamd-Queue-Id: D272F424E98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 19, 2026 at 05:25:14PM +0200, Robert Mast wrote:
> Repeated modprobe -r/modprobe cycles of atomisp and mt9m114 could leave
> stale async state behind and trigger unstable reprobe behavior on ACPI
> Bay Trail systems.
> 
> The failure modes observed during stress loops included notifier lifecycle
> issues during atomisp teardown, ordering races between mt9m114 async
> unregister callback and remove cleanup, and unreliable probe behavior when
> endpoint link-frequency data is unavailable.
> 
> Harden both drivers by:
> - explicitly unregistering and cleaning atomisp async notifier state in
> 	normal teardown and CSI2 parse error paths
> - synchronizing mt9m114 remove with async-unregister completion before
> 	tearing down dependent subdev state
> - adding a shutdown callback to ensure stream/power state is clean at
> 	shutdown/reboot
> - guarding LINK_FREQ control creation and validating parsed frequency menus
> - using default PLL clocking when no link-frequencies are available,
> 	instead of taking an unsuitable bypass path
> 
> This makes unload/reload cycles stable and avoids the reprobe failures that
> were seen after repeated module teardown.

As I mentioned in a review of a previous version, please stop dumping
LLM-generated code on the list. You need to understand what you're
doing, and to put the hours of work required to produce acceptable
patches.

A good starting point will be to read the kernel development
documentation, in particular the patch submission guidelines.

> Signed-off-by: Robert Mast <rn.mast@zonnet.nl>
> ---
>  drivers/media/i2c/mt9m114.c                   | 118 ++++++++++++++++--
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |   1 +
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |   3 +
>  3 files changed, 110 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 16b0ace15813..27432a9c683d 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -10,6 +10,8 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/acpi.h>
> +#include <linux/completion.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/gpio/consumer.h>
> @@ -416,6 +418,7 @@ struct mt9m114 {
>  		unsigned int frame_rate;
>  
>  		struct v4l2_ctrl *tpg[4];
> +		struct completion unregistered;
>  	} ifp;
>  };
>  
> @@ -1467,6 +1470,8 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
>  
>  	sd->ctrl_handler = hdl;
>  
> +	init_completion(&sensor->ifp.unregistered);
> +
>  	return 0;
>  
>  error:
> @@ -2056,8 +2061,13 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
>  static void mt9m114_ifp_unregistered(struct v4l2_subdev *sd)
>  {
>  	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> +	struct device *dev = &sensor->client->dev;
> +
> +	dev_dbg(dev, "ifp unregistered callback (ifp.v4l2_dev=%p, pa.v4l2_dev=%p)\n",
> +		sensor->ifp.sd.v4l2_dev, sensor->pa.sd.v4l2_dev);
>  
>  	v4l2_device_unregister_subdev(&sensor->pa.sd);
> +	complete(&sensor->ifp.unregistered);
>  }
>  
>  static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
> @@ -2149,12 +2159,15 @@ static int mt9m114_ifp_init(struct mt9m114 *sensor)
>  			       V4L2_EXPOSURE_MANUAL, 0,
>  			       V4L2_EXPOSURE_AUTO);
>  
> -	link_freq = v4l2_ctrl_new_int_menu(hdl, &mt9m114_ifp_ctrl_ops,
> -					   V4L2_CID_LINK_FREQ,
> -					   sensor->bus_cfg.nr_of_link_frequencies - 1,
> -					   0, sensor->bus_cfg.link_frequencies);
> -	if (link_freq)
> -		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	if (sensor->bus_cfg.nr_of_link_frequencies) {
> +		link_freq = v4l2_ctrl_new_int_menu(hdl, &mt9m114_ifp_ctrl_ops,
> +						   V4L2_CID_LINK_FREQ,
> +						   sensor->bus_cfg.nr_of_link_frequencies - 1,
> +						   0,
> +						   sensor->bus_cfg.link_frequencies);
> +		if (link_freq)
> +			link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	}
>  
>  	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
>  			  V4L2_CID_PIXEL_RATE,
> @@ -2339,14 +2352,19 @@ static const struct dev_pm_ops mt9m114_pm_ops = {
>  static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
>  					 unsigned int pixrate)
>  {
> +	u32 i;
>  	unsigned int link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
>  			       ? pixrate * 8 : pixrate * 2;
>  
> -	if (sensor->bus_cfg.nr_of_link_frequencies != 1 ||
> -	    sensor->bus_cfg.link_frequencies[0] != link_freq)
> +	if (!sensor->bus_cfg.nr_of_link_frequencies)
>  		return -EINVAL;
>  
> -	return 0;
> +	for (i = 0; i < sensor->bus_cfg.nr_of_link_frequencies; i++) {
> +		if (sensor->bus_cfg.link_frequencies[i] == link_freq)
> +			return 0;
> +	}
> +
> +	return -EINVAL;
>  }
>  
>  /*
> @@ -2383,6 +2401,29 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
>  	unsigned int pixrate;
>  	int ret;
>  
> +	if (!sensor->bus_cfg.nr_of_link_frequencies) {
> +		/*
> +		 * ACPI fallback path: no reliable endpoint link frequency available.
> +		 * Use the default PLL target instead of EXTCLK bypass to avoid
> +		 * under-clocking the sensor and getting blank/timeout streams.
> +		 */
> +		sensor->pll.ext_clock = clk_get_rate(sensor->clk);
> +		sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
> +
> +		ret = aptina_pll_calculate(&sensor->client->dev, &limits,
> +					  &sensor->pll);
> +		if (ret)
> +			return ret;
> +
> +		sensor->pixrate = sensor->pll.ext_clock * sensor->pll.m
> +			/ (sensor->pll.n * sensor->pll.p1);
> +		sensor->bypass_pll = false;
> +
> +		dev_warn(&sensor->client->dev,
> +			 "no link-frequencies provided, using default PLL clocking\n");
> +		return 0;
> +	}
> +
>  	/*
>  	 * Calculate the pixel rate and link frequency. The CSI-2 bus is clocked
>  	 * for 16-bit per pixel, transmitted in DDR over a single lane. For
> @@ -2456,10 +2497,25 @@ static int mt9m114_identify(struct mt9m114 *sensor)
>  
>  static int mt9m114_parse_dt(struct mt9m114 *sensor)
>  {
> -	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
> +	struct fwnode_handle *fwnode;
>  	struct fwnode_handle *ep;
>  	int ret;
>  
> +#if IS_ENABLED(CONFIG_ACPI)
> +	if (has_acpi_companion(&sensor->client->dev)) {
> +		/*
> +		 * On some reload sequences a stale software-node graph can be
> +		 * observed for this ACPI-enumerated sensor. Use the known safe
> +		 * default bus configuration and skip endpoint graph parsing.
> +		 */
> +		memset(&sensor->bus_cfg, 0, sizeof(sensor->bus_cfg));
> +		sensor->bus_cfg.bus_type = V4L2_MBUS_CSI2_DPHY;
> +		sensor->bus_cfg.bus.mipi_csi2.num_data_lanes = 1;
> +		goto read_slew_rate;
> +	}
> +#endif
> +	fwnode = dev_fwnode(&sensor->client->dev);
> +
>  	/*
>  	 * On ACPI systems the fwnode graph can be initialized by a bridge
>  	 * driver, which may not have probed yet. Wait for this.
> @@ -2468,6 +2524,9 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
>  	 * to the ACPI core.
>  	 */
>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (IS_ERR(ep))
> +		return dev_err_probe(&sensor->client->dev, PTR_ERR(ep),
> +				     "failed to get fwnode graph endpoint\n");
>  	if (!ep)
>  		return dev_err_probe(&sensor->client->dev, -EPROBE_DEFER,
>  				     "waiting for fwnode graph endpoint\n");
> @@ -2492,6 +2551,7 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
>  		goto error;
>  	}
>  
> +read_slew_rate:
>  	sensor->pad_slew_rate = MT9M114_PAD_SLEW_DEFAULT;
>  	device_property_read_u32(&sensor->client->dev, "slew-rate",
>  				 &sensor->pad_slew_rate);
> @@ -2629,8 +2689,22 @@ static void mt9m114_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
>  	struct device *dev = &client->dev;
> -
> -	v4l2_async_unregister_subdev(&sensor->ifp.sd);
> +	bool ifp_async_registered = sensor->ifp.sd.async_list.next;
> +	bool ifp_bound = sensor->ifp.sd.v4l2_dev;
> +
> +	dev_dbg(dev,
> +		"remove start (ifp_bound=%u ifp_async_registered=%u ifp.v4l2_dev=%p pa.v4l2_dev=%p)\n",
> +		ifp_bound, ifp_async_registered,
> +		sensor->ifp.sd.v4l2_dev, sensor->pa.sd.v4l2_dev);
> +
> +	if (ifp_async_registered) {
> +		reinit_completion(&sensor->ifp.unregistered);
> +		v4l2_async_unregister_subdev(&sensor->ifp.sd);
> +		if (ifp_bound)
> +			wait_for_completion(&sensor->ifp.unregistered);
> +	} else {
> +		dev_warn(dev, "ifp async subdev already unregistered, skipping\n");
> +	}
>  
>  	mt9m114_ifp_cleanup(sensor);
>  	mt9m114_pa_cleanup(sensor);
> @@ -2646,6 +2720,25 @@ static void mt9m114_remove(struct i2c_client *client)
>  	pm_runtime_set_suspended(dev);
>  }
>  
> +static void mt9m114_shutdown(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct mt9m114 *sensor;
> +
> +	if (!sd)
> +		return;
> +
> +	sensor = ifp_to_mt9m114(sd);
> +
> +	if (sensor->streaming)
> +		mt9m114_stop_streaming(sensor);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		mt9m114_power_off(sensor);
> +	pm_runtime_set_suspended(&client->dev);
> +}
> +
>  static const struct of_device_id mt9m114_of_ids[] = {
>  	{ .compatible = "onnn,mt9m114" },
>  	{ /* sentinel */ },
> @@ -2667,6 +2760,7 @@ static struct i2c_driver mt9m114_driver = {
>  	},
>  	.probe		= mt9m114_probe,
>  	.remove		= mt9m114_remove,
> +	.shutdown	= mt9m114_shutdown,
>  };
>  
>  module_i2c_driver(mt9m114_driver);
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index 2a90f86e515f..87f8ddcd6651 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -547,6 +547,7 @@ int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp)
>  
>  err_parse:
>  		fwnode_handle_put(ep);
> +		v4l2_async_nf_cleanup(&isp->notifier);
>  		return ret;
>  	}
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 900a67552d6a..32a1f85ab598 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -805,6 +805,9 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
>  	unsigned int i;
>  	struct v4l2_subdev *sd, *next;
>  
> +	v4l2_async_nf_unregister(&isp->notifier);
> +	v4l2_async_nf_cleanup(&isp->notifier);
> +
>  	atomisp_subdev_unregister_entities(&isp->asd);
>  	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)
>  		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);

-- 
Regards,

Laurent Pinchart

