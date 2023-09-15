Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F13407A1BCB
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 12:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbjIOKK1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 06:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234218AbjIOKK0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 06:10:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8517A2733
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 03:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694772602; x=1726308602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WCncDxqvQxpxKmU5c0R8HXMJ/LyFByPFC52UFgfNUj4=;
  b=HzXXP2UJfi804r3QnbcfhNFzmdLtFT6rTeXcCuVvwM2va0/Rhl3ra5nv
   YsmQsdltyvfIfYZwCDxbfZoiMugBSuka1g4NjWZhbL4p+76exEZKUrtIs
   +3c4bjl7WU3xWcOGQL75EFXvbi49TijQR2OgQs953ilWtvJ+eUXtkqRkI
   0/MgLbMwE3Z+6BAR9LifiDYmzt1Fp1wkLRamidbA7v8qWNN/HzZEKOU3j
   NyTpDCYt5MN5cSbqXsYZwdQpkrThDl3ttom5Hn8uZ7a7VSq6ilmw0hZtx
   ch2eRO4iRjiZJWyVRpd+0UZc26N5M6X3B0ENlXNnLmCgtbihRQIiaGmO2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="379132775"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="379132775"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 03:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="888182227"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="888182227"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 03:09:05 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1E43711F831;
        Fri, 15 Sep 2023 13:09:37 +0300 (EEST)
Date:   Fri, 15 Sep 2023 10:09:37 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 5/7] media: ov2740: Enable runtime PM before registering
 the async subdev
Message-ID: <ZQQtYReBFGpy/Psy@kekkonen.localdomain>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-6-sakari.ailus@linux.intel.com>
 <20230915094239.GF14641@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915094239.GF14641@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Sep 15, 2023 at 12:42:39PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Sep 15, 2023 at 10:28:07AM +0300, Sakari Ailus wrote:
> > Enable runtime PM before registering the async sub-device as the ipu
> > bridge may try to resume the device immediately after the async sub-device
> 
> I wouldn't mention ipu bridge there, as this driver is not specific to a
> particular CSI-2 receiver.
> 
> > has been registered. If runtime PM is still disabled, this will fail.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ov2740.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> > index 41d4f85470fd..319dc00e47b4 100644
> > --- a/drivers/media/i2c/ov2740.c
> > +++ b/drivers/media/i2c/ov2740.c
> > @@ -1172,6 +1172,12 @@ static int ov2740_probe(struct i2c_client *client)
> >  		goto probe_error_v4l2_ctrl_handler_free;
> >  	}
> >  
> > +	/* Set the device's state to active if it's in D0 state. */
> > +	if (full_power)
> > +		pm_runtime_set_active(&client->dev);
> 
> I wonder why we need this in drivers. If ACPI has powered the device on
> prior to calling probe(), couldn't it also set the PM runtime state
> accordingly ?

What happens here is that the ipu bridge creates a VCM device and it
resumes the related sensor before instantiating that device (see
ipu_bridge_instantiate_vcm_work()). However this may take place already
right after registering the async sub-device. Resuming the sensor will fail
if runtime PM isn't enabled.

I'll add something along these lines to the commit message.

> 
> > +	pm_runtime_enable(&client->dev);
> > +	pm_runtime_idle(&client->dev);
> > +
> 
> With the commit message fixed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you.

> 
> >  	ret = v4l2_async_register_subdev_sensor(&ov2740->sd);
> >  	if (ret < 0) {
> >  		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
> > @@ -1182,16 +1188,12 @@ static int ov2740_probe(struct i2c_client *client)
> >  	if (ret)
> >  		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
> >  
> > -	/* Set the device's state to active if it's in D0 state. */
> > -	if (full_power)
> > -		pm_runtime_set_active(&client->dev);
> > -	pm_runtime_enable(&client->dev);
> > -	pm_runtime_idle(&client->dev);
> > -
> >  	return 0;
> >  
> >  probe_error_media_entity_cleanup:
> >  	media_entity_cleanup(&ov2740->sd.entity);
> > +	pm_runtime_disable(&client->dev);
> > +	pm_runtime_set_suspended(&client->dev);
> >  
> >  probe_error_v4l2_ctrl_handler_free:
> >  	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);
> 

-- 
Regards,

Sakari Ailus
