Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 046754B8C5E
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 16:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbiBPP1h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 10:27:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbiBPP1h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 10:27:37 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CE4654A3
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 07:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645025244; x=1676561244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mnmG1520LVVuOtWF8FJCaRQub5NKuvc+5Ct0ZmCTM48=;
  b=mIQ5wRFVjlIr/Z7H6DS4flSEOGH+Fk3meXQECuHKjD4s0I8hH4nDOWih
   p4WskVPkNqCx7R3YBgLrQybSG2VCSuE6k2SWmuTVa6g4f+vl18Fj9LAJw
   +75oNH1a+6coawxer38AHNOawxww0MzhQZZ/OW8oJLe6u45UvMVfEgp+L
   PN03TJKKbE9e/Z+17maC3vOYj8UHuOMs8D8t71/WBJVEgPx4kdtkT66hE
   1rmp15nL64JTWYhYEqfCWn5s2otzfHBgg91KFx9teZ4tlzZypKgaaW8ZG
   2asnMZfAzeGg0C+wNmD5wG1b4uAMI9WsisLGBJSWQUXd5zPee4jwbH2N1
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230592065"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="230592065"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 07:26:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="588512917"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 07:26:51 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 612CF20087;
        Wed, 16 Feb 2022 17:26:49 +0200 (EET)
Date:   Wed, 16 Feb 2022 17:26:49 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 04/10] media: i2c: Provide ov7251_check_hwcfg()
Message-ID: <Yg0Xua9x2Ix+ctUs@paasikivi.fi.intel.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
 <20220215230737.1870630-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215230737.1870630-5-djrscally@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thanks for the set.

On Tue, Feb 15, 2022 at 11:07:31PM +0000, Daniel Scally wrote:
> Move the endpoint checking from .probe() to a dedicated function,
> and additionally check that the firmware provided link frequencies
> are a match for those supported by the driver. Finally, return
> -EPROBE_DEFER if the endpoint is not available, as it could be built
> by the ipu3-cio2 driver if that probes later.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov7251.c | 84 ++++++++++++++++++++++++++++++--------
>  1 file changed, 66 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index d6fe574cb9e0..5c5f7a15a640 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -1255,10 +1255,73 @@ static const struct v4l2_subdev_ops ov7251_subdev_ops = {
>  	.pad = &ov7251_subdev_pad_ops,
>  };
>  
> +static int ov7251_check_hwcfg(struct ov7251 *ov7251)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(ov7251->dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct fwnode_handle *endpoint;
> +	bool freq_found;
> +	int i, j;

unsigned int ?

> +	int ret;
> +
> +	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!endpoint)
> +		return -EPROBE_DEFER; /* could be provided by cio2-bridge */
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> +	fwnode_handle_put(endpoint);
> +	if (ret)
> +		return dev_err_probe(ov7251->dev, ret,
> +				     "parsing endpoint node failed\n");
> +
> +	if (bus_cfg.bus_type != V4L2_MBUS_CSI2_DPHY) {

You can drop this check as v4l2_fwnode_endpoint_alloc_parse() only parses
D-PHY bus type and returns error otherwise, as you've (correctly) specified
D-PHY in bus_cfg.

> +		ret = -EINVAL;
> +		dev_err(ov7251->dev, "invalid bus type (%u), must be (%u)\n",
> +			bus_cfg.bus_type, V4L2_MBUS_CSI2_DPHY);
> +		goto out_free_bus_cfg;
> +	}
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {

Is this a driver or hardware limitation?

If it's hardware, you could also ignore it --- there's nothing to
configure.

> +		dev_err(ov7251->dev, "only a 1-lane CSI2 config is supported");
> +		ret = -EINVAL;
> +		goto out_free_bus_cfg;
> +	}
> +
> +	if (!bus_cfg.nr_of_link_frequencies) {
> +		dev_err(ov7251->dev, "no link frequencies defined\n");
> +		ret = -EINVAL;
> +		goto out_free_bus_cfg;
> +	}
> +
> +	freq_found = false;

You could do this in initialisation.

> +	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> +		if (freq_found)
> +			break;
> +
> +		for (j = 0; j < ARRAY_SIZE(link_freq); j++)
> +			if (bus_cfg.link_frequencies[i] == link_freq[j]) {
> +				freq_found = true;
> +				break;
> +			}
> +	}
> +
> +	if (i == bus_cfg.nr_of_link_frequencies) {
> +		dev_err(ov7251->dev, "no supported link freq found\n");
> +		ret = -EINVAL;
> +		goto out_free_bus_cfg;
> +	}
> +
> +out_free_bus_cfg:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}
> +
>  static int ov7251_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> -	struct fwnode_handle *endpoint;
>  	struct ov7251 *ov7251;
>  	u8 chip_id_high, chip_id_low, chip_rev;
>  	int ret;
> @@ -1270,24 +1333,9 @@ static int ov7251_probe(struct i2c_client *client)
>  	ov7251->i2c_client = client;
>  	ov7251->dev = dev;
>  
> -	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> -	if (!endpoint) {
> -		dev_err(dev, "endpoint node not found\n");
> -		return -EINVAL;
> -	}
> -
> -	ret = v4l2_fwnode_endpoint_parse(endpoint, &ov7251->ep);
> -	fwnode_handle_put(endpoint);
> -	if (ret < 0) {
> -		dev_err(dev, "parsing endpoint node failed\n");
> +	ret = ov7251_check_hwcfg(ov7251);
> +	if (ret)
>  		return ret;
> -	}
> -
> -	if (ov7251->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> -		dev_err(dev, "invalid bus type (%u), must be CSI2 (%u)\n",
> -			ov7251->ep.bus_type, V4L2_MBUS_CSI2_DPHY);
> -		return -EINVAL;
> -	}
>  
>  	/* get system clock (xclk) */
>  	ov7251->xclk = devm_clk_get(dev, "xclk");

-- 
Kind regards,

Sakari Ailus
