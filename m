Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC807A2326
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 18:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236270AbjIOQBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 12:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236439AbjIOQA4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 12:00:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9AC30F6
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 08:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694793597; x=1726329597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=b7dFvO/zFKCPN3w/rfpGuvFqXd5Qo5dCQimLrcjfXdA=;
  b=Rg8+jpyerET9VW1t2TnePv5Wtr53HJFSNwVZ1g1+5hFbv6Dqi2ZyE8m5
   Ibw2lzULrcQGImXuKzA9VK51hB5QuFxT7oLdTxUzXOqNz48wSn8MQBlTg
   Q63MXtltuDOD2mkVVrTk3XsalMUZjF/zNSrdZyrk5UZLEIsCFj3nTQvnO
   xU982efS/+AezeygxXrT5+7B/1w+1zRyzyl0fZIHeWE8ULjey2J3lLLv3
   o1co/m+Iw1yUvE3vMJmSn1fAuGbvh6hGFXjuM/sl1zkcaMCqJROK22LuJ
   hEwCtjv0luSVYDgAuBRSDQ9MJNNddU79XI5BTyhKhbZCYAOcihgHHTtG7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369595159"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="369595159"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 08:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745037173"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="745037173"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 08:59:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 95D4E1202BB;
        Fri, 15 Sep 2023 18:50:00 +0300 (EEST)
Date:   Fri, 15 Sep 2023 15:50:00 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 5/7] media: ov2740: Enable runtime PM before registering
 the async subdev
Message-ID: <ZQR9KO8Ft/NUZR4w@kekkonen.localdomain>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-6-sakari.ailus@linux.intel.com>
 <20230915094239.GF14641@pendragon.ideasonboard.com>
 <ZQQtYReBFGpy/Psy@kekkonen.localdomain>
 <20230915113012.GJ14641@pendragon.ideasonboard.com>
 <ZQREmyGyXHQIgn4O@kekkonen.localdomain>
 <20230915121659.GN14641@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230915121659.GN14641@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 15, 2023 at 03:16:59PM +0300, Laurent Pinchart wrote:
> On Fri, Sep 15, 2023 at 11:48:43AM +0000, Sakari Ailus wrote:
> > On Fri, Sep 15, 2023 at 02:30:12PM +0300, Laurent Pinchart wrote:
> > > On Fri, Sep 15, 2023 at 10:09:37AM +0000, Sakari Ailus wrote:
> > > > On Fri, Sep 15, 2023 at 12:42:39PM +0300, Laurent Pinchart wrote:
> > > > > On Fri, Sep 15, 2023 at 10:28:07AM +0300, Sakari Ailus wrote:
> > > > > > Enable runtime PM before registering the async sub-device as the ipu
> > > > > > bridge may try to resume the device immediately after the async sub-device
> > > > > 
> > > > > I wouldn't mention ipu bridge there, as this driver is not specific to a
> > > > > particular CSI-2 receiver.
> > > > > 
> > > > > > has been registered. If runtime PM is still disabled, this will fail.
> > > > > > 
> > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > ---
> > > > > >  drivers/media/i2c/ov2740.c | 14 ++++++++------
> > > > > >  1 file changed, 8 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> > > > > > index 41d4f85470fd..319dc00e47b4 100644
> > > > > > --- a/drivers/media/i2c/ov2740.c
> > > > > > +++ b/drivers/media/i2c/ov2740.c
> > > > > > @@ -1172,6 +1172,12 @@ static int ov2740_probe(struct i2c_client *client)
> > > > > >  		goto probe_error_v4l2_ctrl_handler_free;
> > > > > >  	}
> > > > > >  
> > > > > > +	/* Set the device's state to active if it's in D0 state. */
> > > > > > +	if (full_power)
> > > > > > +		pm_runtime_set_active(&client->dev);
> > > > > 
> > > > > I wonder why we need this in drivers. If ACPI has powered the device on
> > > > > prior to calling probe(), couldn't it also set the PM runtime state
> > > > > accordingly ?
> > > > 
> > > > What happens here is that the ipu bridge creates a VCM device and it
> > > > resumes the related sensor before instantiating that device (see
> > > > ipu_bridge_instantiate_vcm_work()). However this may take place already
> > > > right after registering the async sub-device. Resuming the sensor will fail
> > > > if runtime PM isn't enabled.
> > > > 
> > > > I'll add something along these lines to the commit message.
> > > 
> > > I understand this, but that doesn't answer my question :-) Why is there
> > > a need to call pm_runtime_set_active(), couldn't it be done somewhere in
> > > common code ?
> > 
> > Ah, I think I misunderstood your earlier question.
> > 
> > The sensor may be left powered off for probe if the device's _DSC object
> > evaluates to 4. See Documentation/firmware-guide/acpi/non-d0-probe.rst for
> > more information.
> 
> That information should be available to core code, given that it's
> retrieved in the driver with a call to acpi_dev_state_d0(). Couldn't it
> thus be handled in core code ?

The I²C framework is responsible powering on the device before probe, not
the ACPI framework. The default runtime PM state is suspended, so I guess
this could be changed for ACPI devices in the I²C framework. But that
certainly does not belong to this patchset.

I was actually hoping the ACPI introduced I²C devices could have power
management working the same was as for DT: driver would resume the device
instead of the framework. This would simplify drivers.

> 
> > > > > > +	pm_runtime_enable(&client->dev);
> > > > > > +	pm_runtime_idle(&client->dev);
> > > > > > +
> > > > > 
> > > > > With the commit message fixed,
> > > > > 
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > 
> > > > Thank you.
> > > > 
> > > > > >  	ret = v4l2_async_register_subdev_sensor(&ov2740->sd);
> > > > > >  	if (ret < 0) {
> > > > > >  		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
> > > > > > @@ -1182,16 +1188,12 @@ static int ov2740_probe(struct i2c_client *client)
> > > > > >  	if (ret)
> > > > > >  		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
> > > > > >  
> > > > > > -	/* Set the device's state to active if it's in D0 state. */
> > > > > > -	if (full_power)
> > > > > > -		pm_runtime_set_active(&client->dev);
> > > > > > -	pm_runtime_enable(&client->dev);
> > > > > > -	pm_runtime_idle(&client->dev);
> > > > > > -
> > > > > >  	return 0;
> > > > > >  
> > > > > >  probe_error_media_entity_cleanup:
> > > > > >  	media_entity_cleanup(&ov2740->sd.entity);
> > > > > > +	pm_runtime_disable(&client->dev);
> > > > > > +	pm_runtime_set_suspended(&client->dev);
> > > > > >  
> > > > > >  probe_error_v4l2_ctrl_handler_free:
> > > > > >  	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);

-- 
Regards,

Sakari Ailus
