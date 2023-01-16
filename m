Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A343466BDD5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 13:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjAPMaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 07:30:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjAPM36 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 07:29:58 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1411E1D7
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 04:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673872194; x=1705408194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GaJeI5/uctT+dNCcuWpdTU449ShBZI0jf6RlweVxZO8=;
  b=angPUdUMd8gGxT/3pkvKlWe9MOAJpmWNZeUznQ4XIR0VTnNTto/CxL3+
   7tUSKF7AvDx83IexjIaXDgPvZlz4uZYyQDjdRgDtF2oFbaZn+f5J76VTR
   6tG1K2pVPfoeg9eGAsWNcyTHwcPMZaPSX1kh0TmXBLHHpwTE/EWQAAFM7
   M3Lgrz/brs0spyz7aJBOP0ncKh0dULHPXzUMUY7AbI8ZdItc+CaXRGCfG
   761rrIDQ1Cq81E+gbAnqFcVV2UgA8HY49uHZAmYaMZtXJUuPd3mD70EjS
   OIAGKLg7x7NLt7Q5nO0VTVtYFC2pLKyo0Ikc1kL77boEfHP9r81UEu4YU
   A==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28449305"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jan 2023 13:29:52 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 16 Jan 2023 13:29:52 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 16 Jan 2023 13:29:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673872192; x=1705408192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GaJeI5/uctT+dNCcuWpdTU449ShBZI0jf6RlweVxZO8=;
  b=SlNPg7cMsAFW+We7zH5g7JXFVN+VKF3h0lk/B0fjDIrPzsyoonu1gGqn
   14lH4vIR+dNxz+0uJsniyDzyKXJUnNJ0IEzWZbedRZ6xyZ+sInstFZSDU
   3/d8p/FbaRygCJ4fPwQ+vBBJN3zIRuzeMZbgMUw3UhA5cGwWWqF/4DtUk
   STYRyeMC/qGyQCCm7v/pKdGgBI4VsxQa7E5IAkqTbxa8m4/bPiCxy1Jtg
   C0K57XLRpgfccwyKTWMKQ8vkld6/dg/FGAS2qccu25kUYKPwy9gN3hft7
   Gbzuh83myf6xOpUkhAq2TIoRGKoEocZCUgPaDbRDNHQbGpgQEcnykANkf
   w==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28449304"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jan 2023 13:29:51 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D27FC280056;
        Mon, 16 Jan 2023 13:29:51 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 14/17] media: i2c: imx290: Initialize runtime PM before subdev
Date:   Mon, 16 Jan 2023 13:29:52 +0100
Message-ID: <4243355.ejJDZkT8p0@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Y8U5wsnA6BS9PNkP@pendragon.ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com> <5797633.MhkbZ0Pkbq@steina-w> <Y8U5wsnA6BS9PNkP@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Am Montag, 16. Januar 2023, 12:49:22 CET schrieb Laurent Pinchart:
> Hi Alexander,
> 
> On Mon, Jan 16, 2023 at 12:14:46PM +0100, Alexander Stein wrote:
> > Am Samstag, 14. Januar 2023, 18:17:59 CET schrieb Laurent Pinchart:
> > > Initializing the subdev before runtime PM means that no subdev
> > > initialization can interact with the runtime PM framework. This can be
> > > problematic when modifying controls, as the .s_ctrl() handler commonly
> > > calls pm_runtime_get_if_in_use(). These code paths are not trivial,
> > > making the driver fragile and possibly causing subtle bugs.
> > > 
> > > To make the subdev initialization more robust, initialize runtime PM
> > > first.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thank you for giving me my own ack, but yours would be more useful :-)

oh... Sorry. I messed up my copy and paste :(

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> > > ---
> > > 
> > >  drivers/media/i2c/imx290.c | 57 ++++++++++++++++++++++----------------
> > >  1 file changed, 33 insertions(+), 24 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 6a3e93c10fb1..c3ffb23104bf 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -581,9 +581,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > > 
> > >  	/*
> > >  	
> > >  	 * Return immediately for controls that don't need to be applied to
> > >  	 the
> > > 
> > > -	 * device. This includes all controls modified in
> > > imx290_ctrl_update(),
> > > -	 * which is called at probe time before runtime PM is initialized, 
so
> > > -	 * we can't proceed to the pm_runtime_get_if_in_use() call below.
> > > +	 * device.
> > > 
> > >  	 */
> > >  	
> > >  	switch (ctrl->id) {
> > > 
> > >  	case V4L2_CID_LINK_FREQ:
> > > @@ -1054,22 +1052,20 @@ static void imx290_subdev_cleanup(struct imx290
> > > *imx290)> > 
> > >   * Power management
> > >   */
> > > 
> > > -static int imx290_power_on(struct device *dev)
> > > +static int imx290_power_on(struct imx290 *imx290)
> > > 
> > >  {
> > > 
> > > -	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > -	struct imx290 *imx290 = to_imx290(sd);
> > > 
> > >  	int ret;
> > >  	
> > >  	ret = clk_prepare_enable(imx290->xclk);
> > >  	if (ret) {
> > > 
> > > -		dev_err(dev, "Failed to enable clock\n");
> > > +		dev_err(imx290->dev, "Failed to enable clock\n");
> > > 
> > >  		return ret;
> > >  	
> > >  	}
> > >  	
> > >  	ret = regulator_bulk_enable(ARRAY_SIZE(imx290->supplies),
> > >  	
> > >  				    imx290->supplies);
> > >  	
> > >  	if (ret) {
> > > 
> > > -		dev_err(dev, "Failed to enable regulators\n");
> > > +		dev_err(imx290->dev, "Failed to enable regulators\n");
> > > 
> > >  		clk_disable_unprepare(imx290->xclk);
> > >  		return ret;
> > >  	
> > >  	}
> > > 
> > > @@ -1084,20 +1080,33 @@ static int imx290_power_on(struct device *dev)
> > > 
> > >  	return 0;
> > >  
> > >  }
> > > 
> > > -static int imx290_power_off(struct device *dev)
> > > +static void imx290_power_off(struct imx290 *imx290)
> > > 
> > >  {
> > > 
> > > -	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > -	struct imx290 *imx290 = to_imx290(sd);
> > > -
> > > 
> > >  	clk_disable_unprepare(imx290->xclk);
> > >  	gpiod_set_value_cansleep(imx290->rst_gpio, 1);
> > >  	regulator_bulk_disable(ARRAY_SIZE(imx290->supplies),
> > >  	imx290->supplies);
> > > 
> > > +}
> > > +
> > > +static int imx290_runtime_resume(struct device *dev)
> > > +{
> > > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > +	struct imx290 *imx290 = to_imx290(sd);
> > > +
> > > +	return imx290_power_on(imx290);
> > > +}
> > > +
> > > +static int imx290_runtime_suspend(struct device *dev)
> > > +{
> > > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > +	struct imx290 *imx290 = to_imx290(sd);
> > > +
> > > +	imx290_power_off(imx290);
> > > 
> > >  	return 0;
> > >  
> > >  }
> > >  
> > >  static const struct dev_pm_ops imx290_pm_ops = {
> > > 
> > > -	SET_RUNTIME_PM_OPS(imx290_power_off, imx290_power_on, NULL)
> > > +	SET_RUNTIME_PM_OPS(imx290_runtime_suspend, imx290_runtime_resume,
> > > NULL)
> > > 
> > >  };
> > >  
> > >  /*
> > >  ----------------------------------------------------------------------
> > >  ------> > 
> > > @@ -1276,20 +1285,15 @@ static int imx290_probe(struct i2c_client
> > > *client)
> > > if (ret)
> > > 
> > >  		return ret;
> > > 
> > > -	/* Initialize the V4L2 subdev. */
> > > -	ret = imx290_subdev_init(imx290);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > 
> > >  	/*
> > >  	
> > >  	 * Enable power management. The driver supports runtime PM, but 
needs
> > >  	 to
> > >  	 * work when runtime PM is disabled in the kernel. To that end, 
power
> > >  	 * the sensor on manually here.
> > >  	 */
> > > 
> > > -	ret = imx290_power_on(dev);
> > > +	ret = imx290_power_on(imx290);
> > > 
> > >  	if (ret < 0) {
> > >  	
> > >  		dev_err(dev, "Could not power on the device\n");
> > > 
> > > -		goto err_subdev;
> > > +		return ret;
> > > 
> > >  	}
> > >  	
> > >  	/*
> > > 
> > > @@ -1303,6 +1307,11 @@ static int imx290_probe(struct i2c_client
> > > *client)
> > > 
> > >  	pm_runtime_set_autosuspend_delay(dev, 1000);
> > >  	pm_runtime_use_autosuspend(dev);
> > > 
> > > +	/* Initialize the V4L2 subdev. */
> > > +	ret = imx290_subdev_init(imx290);
> > > +	if (ret)
> > > +		goto err_pm;
> > > +
> > > 
> > >  	/*
> > >  	
> > >  	 * Finally, register the V4L2 subdev. This must be done after
> > >  	 * initializing everything as the subdev can be used immediately 
after
> > > 
> > > @@ -1323,12 +1332,12 @@ static int imx290_probe(struct i2c_client
> > > *client)
> > > 
> > >  	return 0;
> > > 
> > > +err_subdev:
> > > +	imx290_subdev_cleanup(imx290);
> > > 
> > >  err_pm:
> > >  	pm_runtime_disable(dev);
> > >  	pm_runtime_put_noidle(dev);
> > > 
> > > -	imx290_power_off(dev);
> > > -err_subdev:
> > > -	imx290_subdev_cleanup(imx290);
> > > +	imx290_power_off(imx290);
> > > 
> > >  	return ret;
> > >  
> > >  }
> > > 
> > > @@ -1346,7 +1355,7 @@ static void imx290_remove(struct i2c_client
> > > *client)
> > > 
> > >  	 */
> > >  	
> > >  	pm_runtime_disable(imx290->dev);
> > >  	if (!pm_runtime_status_suspended(imx290->dev))
> > > 
> > > -		imx290_power_off(imx290->dev);
> > > +		imx290_power_off(imx290);
> > > 
> > >  	pm_runtime_set_suspended(imx290->dev);
> > >  
> > >  }




