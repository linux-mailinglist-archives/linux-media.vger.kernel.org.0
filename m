Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 919897A1DAC
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 13:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbjIOLsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 07:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjIOLsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 07:48:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1818FA8
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 04:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694778529; x=1726314529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lnV4bIu0A8phJQW3l7CT3G4ZZWvcKBzVvwI+rfSwSPc=;
  b=hDCn3YyaTWxFyhl64WdQe5qBPN3WBUC7ZWZIAbp4gsmYTPomgqHaf8Fx
   ze2vjm/5HxsCCZSH4Xxmb+UsfFoLMwVrzQuzRldSeILVq9PgsVstZYGk5
   1pe6szK/LRpdXnZH+cJZVNkIWwOu8eEZImo+XcDuLVUl/T6vOqDVDKxAU
   I+1S3vLdnj0lV/TPTXas8X2iE5rl0fB81GW1gK480T2rddo48wA6vS7xu
   8OfFOUlEbXjXqbNKJYeYDWgAiJjnXGpUC6B/9ABvW+3jb7uTKVaLXNUzD
   ifEnUXeL1vVx7gSTamy7IZWOj20k1/5VkdvhyTWxO5s/g8JA4fXv5s9Lh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465592256"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="465592256"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 04:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918630771"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="918630771"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 04:48:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 43B8F1202BB;
        Fri, 15 Sep 2023 14:48:43 +0300 (EEST)
Date:   Fri, 15 Sep 2023 11:48:43 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 5/7] media: ov2740: Enable runtime PM before registering
 the async subdev
Message-ID: <ZQREmyGyXHQIgn4O@kekkonen.localdomain>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-6-sakari.ailus@linux.intel.com>
 <20230915094239.GF14641@pendragon.ideasonboard.com>
 <ZQQtYReBFGpy/Psy@kekkonen.localdomain>
 <20230915113012.GJ14641@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915113012.GJ14641@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Sep 15, 2023 at 02:30:12PM +0300, Laurent Pinchart wrote:
> On Fri, Sep 15, 2023 at 10:09:37AM +0000, Sakari Ailus wrote:
> > On Fri, Sep 15, 2023 at 12:42:39PM +0300, Laurent Pinchart wrote:
> > > On Fri, Sep 15, 2023 at 10:28:07AM +0300, Sakari Ailus wrote:
> > > > Enable runtime PM before registering the async sub-device as the ipu
> > > > bridge may try to resume the device immediately after the async sub-device
> > > 
> > > I wouldn't mention ipu bridge there, as this driver is not specific to a
> > > particular CSI-2 receiver.
> > > 
> > > > has been registered. If runtime PM is still disabled, this will fail.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/i2c/ov2740.c | 14 ++++++++------
> > > >  1 file changed, 8 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> > > > index 41d4f85470fd..319dc00e47b4 100644
> > > > --- a/drivers/media/i2c/ov2740.c
> > > > +++ b/drivers/media/i2c/ov2740.c
> > > > @@ -1172,6 +1172,12 @@ static int ov2740_probe(struct i2c_client *client)
> > > >  		goto probe_error_v4l2_ctrl_handler_free;
> > > >  	}
> > > >  
> > > > +	/* Set the device's state to active if it's in D0 state. */
> > > > +	if (full_power)
> > > > +		pm_runtime_set_active(&client->dev);
> > > 
> > > I wonder why we need this in drivers. If ACPI has powered the device on
> > > prior to calling probe(), couldn't it also set the PM runtime state
> > > accordingly ?
> > 
> > What happens here is that the ipu bridge creates a VCM device and it
> > resumes the related sensor before instantiating that device (see
> > ipu_bridge_instantiate_vcm_work()). However this may take place already
> > right after registering the async sub-device. Resuming the sensor will fail
> > if runtime PM isn't enabled.
> > 
> > I'll add something along these lines to the commit message.
> 
> I understand this, but that doesn't answer my question :-) Why is there
> a need to call pm_runtime_set_active(), couldn't it be done somewhere in
> common code ?

Ah, I think I misunderstood your earlier question.

The sensor may be left powered off for probe if the device's _DSC object
evaluates to 4. See Documentation/firmware-guide/acpi/non-d0-probe.rst for
more information.

> 
> > > > +	pm_runtime_enable(&client->dev);
> > > > +	pm_runtime_idle(&client->dev);
> > > > +
> > > 
> > > With the commit message fixed,
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Thank you.
> > 
> > > >  	ret = v4l2_async_register_subdev_sensor(&ov2740->sd);
> > > >  	if (ret < 0) {
> > > >  		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
> > > > @@ -1182,16 +1188,12 @@ static int ov2740_probe(struct i2c_client *client)
> > > >  	if (ret)
> > > >  		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
> > > >  
> > > > -	/* Set the device's state to active if it's in D0 state. */
> > > > -	if (full_power)
> > > > -		pm_runtime_set_active(&client->dev);
> > > > -	pm_runtime_enable(&client->dev);
> > > > -	pm_runtime_idle(&client->dev);
> > > > -
> > > >  	return 0;
> > > >  
> > > >  probe_error_media_entity_cleanup:
> > > >  	media_entity_cleanup(&ov2740->sd.entity);
> > > > +	pm_runtime_disable(&client->dev);
> > > > +	pm_runtime_set_suspended(&client->dev);
> > > >  
> > > >  probe_error_v4l2_ctrl_handler_free:
> > > >  	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);

-- 
Regards,

Sakari Ailus
