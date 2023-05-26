Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F099D7125C3
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 13:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243361AbjEZLlj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 07:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243319AbjEZLli (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 07:41:38 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918F7E4F
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 04:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685101279; x=1716637279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZaKplkJvmUFtm/YYRcRqaboc1o98s4/W0dVw3tarnhk=;
  b=bO5/gkzeF5Dtw+KZvkm1NvgF0Z9p2iHf4Lbgl2nIyEUcsXiWlku37orc
   u6bqKNxcdY/y9D1+REbAn1pkBDUBKD9N4KkmkbE2U93RKxDUL2cSFt5Fi
   1algs7Vnjc7SBnvmaXEY2lJhRfnRimQJ2jc5WRMiVp+t6IIhtdMt83B03
   MYhpcNh2kwLfO89s9yY/XrH4ruApNCh/s7TehBXRIx1dFdqizv8Idtehq
   TJkRON7HhudBbASoaNpqhcbKfIEdqaD2uT7GhtaCmAGFC2yOhKlnMTsM7
   SddVhGGlhuIIcOjSPP2NCG5PpXtj+LFmnbheQ0zeuOIYVE5/Rh4XxK81i
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="417669149"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="417669149"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 04:41:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="775069664"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="775069664"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 04:41:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 23AB11202A8;
        Fri, 26 May 2023 14:41:15 +0300 (EEST)
Date:   Fri, 26 May 2023 11:41:15 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Kao, Arec" <arec.kao@intel.com>, "Yao, Hao" <hao.yao@intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: Re: [PATCH 3/4] media: ov13b10: add PM control support based on
 power resources
Message-ID: <ZHCa2/SDr52c2ExB@kekkonen.localdomain>
References: <20230526095839.2443058-1-bingbu.cao@intel.com>
 <20230526095839.2443058-3-bingbu.cao@intel.com>
 <ZHCDfuO4Dsha5kzI@kekkonen.localdomain>
 <DM8PR11MB56537D167FDF388A942802A299479@DM8PR11MB5653.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB56537D167FDF388A942802A299479@DM8PR11MB5653.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Fri, May 26, 2023 at 11:21:20AM +0000, Cao, Bingbu wrote:
> Sakari, 
> 
> Thanks for your review.
> 
> ------------------------------------------------------------------------
> BRs,  
> Bingbu Cao 
> 
> >-----Original Message-----
> >From: Sakari Ailus <sakari.ailus@linux.intel.com>
> >Sent: Friday, May 26, 2023 18:02
> >To: Cao, Bingbu <bingbu.cao@intel.com>
> >Cc: linux-media@vger.kernel.org; Kao, Arec <arec.kao@intel.com>; Yao, Hao
> ><hao.yao@intel.com>; bingbu.cao@linux.intel.com
> >Subject: Re: [PATCH 3/4] media: ov13b10: add PM control support based on
> >power resources
> >
> >Hi Bingbu,
> >
> >Thanks for the patch.
> >
> >On Fri, May 26, 2023 at 05:58:39PM +0800, bingbu.cao@intel.com wrote:
> >> From: Bingbu Cao <bingbu.cao@intel.com>
> >>
> >> On ACPI based platforms, the ov13b10 camera sensor need to be powered
> >> up by acquire the PM resource from INT3472. On such platform, 1 GPIO
> >> can be used to enable AVDD and DOVDD, 1 GPIO to reset, we just have
> >> one power supply 'vdd' for camera. Add 2 power interfaces and also
> >> registered as runtime PM callbacks to support that.
> >>
> >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >> Signed-off-by: Hao Yao <hao.yao@intel.com>
> >> ---
> >>  drivers/media/i2c/ov13b10.c | 98
> >> ++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 96 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> >> index 2d48c94659a4..b1faa89a3571 100644
> >> --- a/drivers/media/i2c/ov13b10.c
> >> +++ b/drivers/media/i2c/ov13b10.c
> >> @@ -2,6 +2,9 @@
> >>  // Copyright (c) 2021 Intel Corporation.
> >>
> >>  #include <linux/acpi.h>
> >> +#include <linux/clk.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/gpio/consumer.h>
> >>  #include <linux/i2c.h>
> >>  #include <linux/module.h>
> >>  #include <linux/pm_runtime.h>
> >> @@ -573,6 +576,11 @@ struct ov13b10 {
> >>  	struct media_pad pad;
> >>
> >>  	struct v4l2_ctrl_handler ctrl_handler;
> >> +
> >> +	struct clk *img_clk;
> >> +	struct regulator *vdd;
> >> +	struct gpio_desc *reset;
> >> +
> >>  	/* V4L2 Controls */
> >>  	struct v4l2_ctrl *link_freq;
> >>  	struct v4l2_ctrl *pixel_rate;
> >> @@ -1051,6 +1059,50 @@ static int ov13b10_identify_module(struct ov13b10
> >*ov13b)
> >>  	return 0;
> >>  }
> >>
> >> +static int ov13b10_power_off(struct device *dev) {
> >> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >> +	struct ov13b10 *ov13b10 = to_ov13b10(sd);
> >> +
> >> +	if (!ov13b10->vdd || !ov13b10->reset || !ov13b10->img_clk)
> >> +		return 0;
> >
> >This can be dropped.
> >
> >> +
> >> +	gpiod_set_value_cansleep(ov13b10->reset, 1);
> >> +	regulator_disable(ov13b10->vdd);
> >> +	clk_disable_unprepare(ov13b10->img_clk);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int ov13b10_power_on(struct device *dev) {
> >> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >> +	struct ov13b10 *ov13b10 = to_ov13b10(sd);
> >> +	int ret;
> >> +
> >> +	if (!ov13b10->vdd || !ov13b10->reset || !ov13b10->img_clk)
> >> +		return 0;
> >
> >Instead I'd execute the sleep below if any of these is non-NULL. No need to
> >return here.
> >
> >> +
> >> +	ret = clk_prepare_enable(ov13b10->img_clk);
> >> +	if (ret < 0) {
> >> +		dev_err(dev, "failed to enable imaging clock: %d", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = regulator_enable(ov13b10->vdd);
> >> +	if (ret < 0) {
> >> +		dev_err(dev, "failed to enable vdd: %d", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	gpiod_set_value_cansleep(ov13b10->reset, 0);
> >> +
> >> +	/* 5ms to wait ready after XSHUTDN assert */
> >> +	usleep_range(5000, 5500);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int ov13b10_start_streaming(struct ov13b10 *ov13b)  {
> >>  	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd); @@
> >> -1317,6 +1369,37 @@ static void ov13b10_free_controls(struct ov13b10
> >*ov13b)
> >>  	mutex_destroy(&ov13b->mutex);
> >>  }
> >>
> >> +static void ov13b10_get_pm_resources(struct device *dev) {
> >> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >> +	struct ov13b10 *ov13b = to_ov13b10(sd);
> >> +
> >> +	if (!is_acpi_node(dev_fwnode(dev)))
> >> +		return;
> >
> >I'd omit this check. This would work on DT although bindings should still
> >be written. That may be left for a future excercise I think.
> >
> >> +
> >> +	ov13b->reset = devm_gpiod_get_optional(dev, "reset",
> >> +					       GPIOD_OUT_LOW);
> >> +	if (IS_ERR(ov13b->reset)) {
> >> +		dev_dbg(dev, "failed to get reset gpio: %ld",
> >> +			PTR_ERR(ov13b->reset));
> >> +		ov13b->reset = NULL;
> >> +	}
> >> +
> >> +	ov13b->img_clk = devm_clk_get_optional(dev, NULL);
> >> +	if (IS_ERR(ov13b->img_clk)) {
> >> +		dev_dbg(dev, "failed to get imaging clock: %ld",
> >> +			PTR_ERR(ov13b->img_clk));
> >> +		ov13b->img_clk = NULL;
> >> +	}
> >> +
> >> +	ov13b->vdd = devm_regulator_get_optional(dev, "vdd");
> >> +	if (IS_ERR(ov13b->vdd)) {
> >> +		dev_dbg(dev, "failed to get vdd regulator: %ld",
> >> +			PTR_ERR(ov13b->vdd));
> >> +		ov13b->vdd = NULL;
> >
> >You should return the error code instead, in all three cases.
> 
> On some platforms such as Chromebook, there is no INT3472 requirement.
> Here it ignores that case and return without errors, thus the power on
> and off callback would be NULL functions then.

Don't the _optional() variants of these functions return NULL if there's no
such thing for the device?

> 
> 
> >
> >> +	}
> >> +}
> >> +
> >>  static int ov13b10_check_hwcfg(struct device *dev)  {
> >>  	struct v4l2_fwnode_endpoint bus_cfg = { @@ -1407,13 +1490,21 @@
> >> static int ov13b10_probe(struct i2c_client *client)
> >>  	/* Initialize subdev */
> >>  	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
> >>
> >> +	ov13b10_get_pm_resources(&client->dev);
> >> +
> >>  	full_power = acpi_dev_state_d0(&client->dev);
> >>  	if (full_power) {
> >> +		ov13b10_power_on(&client->dev);
> >> +		if (ret) {
> >> +			dev_err(&client->dev, "failed to power on\n");
> >> +			goto error_power_off;
> >
> >return ret;
> 
> After power on, the caller has no idea which PM resource was
> set, so here call power off as a rollback.

Sure, but it needs to be done in ov13b10_power_on() instead. If there's an
error, some of the resources weren't enabled so you can't undo that here.

> 
> >
> >See also below...
> >
> >> +		}
> >> +
> >>  		/* Check module identity */
> >>  		ret = ov13b10_identify_module(ov13b);
> >>  		if (ret) {
> >>  			dev_err(&client->dev, "failed to find sensor: %d\n",
> >ret);
> >> -			return ret;
> >> +			goto error_power_off;
> >>  		}
> >>  	}
> >>
> >> @@ -1422,7 +1513,7 @@ static int ov13b10_probe(struct i2c_client
> >> *client)
> >>
> >>  	ret = ov13b10_init_controls(ov13b);
> >>  	if (ret)
> >> -		return ret;
> >> +		goto error_power_off;
> >>
> >>  	/* Initialize subdev */
> >>  	ov13b->sd.internal_ops = &ov13b10_internal_ops; @@ -1461,6 +1552,8
> >> @@ static int ov13b10_probe(struct i2c_client *client)
> >>  error_handler_free:
> >>  	ov13b10_free_controls(ov13b);
> >>  	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
> >> +error_power_off:
> >> +	ov13b10_power_off(&client->dev);
> >
> >This may only be called if ov13b10_power_on() was successfully called first.
> >
> >>
> >>  	return ret;
> >>  }
> >> @@ -1479,6 +1572,7 @@ static void ov13b10_remove(struct i2c_client
> >> *client)
> >>
> >>  static const struct dev_pm_ops ov13b10_pm_ops = {
> >>  	SET_SYSTEM_SLEEP_PM_OPS(ov13b10_suspend, ov13b10_resume)
> >> +	SET_RUNTIME_PM_OPS(ov13b10_power_off, ov13b10_power_on, NULL)
> >>  };
> >>
> >>  #ifdef CONFIG_ACPI
> >>

-- 
Kind regards,

Sakari Ailus
