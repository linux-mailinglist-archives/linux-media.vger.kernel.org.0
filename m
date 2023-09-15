Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D81E7A2356
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 18:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbjIOQNF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 12:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236447AbjIOQMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 12:12:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEED82105
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 09:11:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34A14B1;
        Fri, 15 Sep 2023 18:09:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694794199;
        bh=N5vpTRhYL+6DjwlX3AxDc/j3NCYQtFekoBXbz6MndUE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=atsDExdk9pn+eb3RVNhnVbezjLyOULmjhaR+K+tt8eNgeN2VoKdS/3qJSI4g/cicB
         japfd7D7qr6u3rWT367ttvD4ipnjyXr7Asrmdt+aGXfF1ZcmceFmQNMBSxMh2dNwSi
         ksncHsXGG9XZMtSDJsRjr9r4zGCCtkXOWK9ziJGs=
Date:   Fri, 15 Sep 2023 19:11:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 5/7] media: ov2740: Enable runtime PM before registering
 the async subdev
Message-ID: <20230915161146.GC933@pendragon.ideasonboard.com>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-6-sakari.ailus@linux.intel.com>
 <20230915094239.GF14641@pendragon.ideasonboard.com>
 <ZQQtYReBFGpy/Psy@kekkonen.localdomain>
 <20230915113012.GJ14641@pendragon.ideasonboard.com>
 <ZQREmyGyXHQIgn4O@kekkonen.localdomain>
 <20230915121659.GN14641@pendragon.ideasonboard.com>
 <ZQR9KO8Ft/NUZR4w@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQR9KO8Ft/NUZR4w@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 15, 2023 at 03:50:00PM +0000, Sakari Ailus wrote:
> On Fri, Sep 15, 2023 at 03:16:59PM +0300, Laurent Pinchart wrote:
> > On Fri, Sep 15, 2023 at 11:48:43AM +0000, Sakari Ailus wrote:
> > > On Fri, Sep 15, 2023 at 02:30:12PM +0300, Laurent Pinchart wrote:
> > > > On Fri, Sep 15, 2023 at 10:09:37AM +0000, Sakari Ailus wrote:
> > > > > On Fri, Sep 15, 2023 at 12:42:39PM +0300, Laurent Pinchart wrote:
> > > > > > On Fri, Sep 15, 2023 at 10:28:07AM +0300, Sakari Ailus wrote:
> > > > > > > Enable runtime PM before registering the async sub-device as the ipu
> > > > > > > bridge may try to resume the device immediately after the async sub-device
> > > > > > 
> > > > > > I wouldn't mention ipu bridge there, as this driver is not specific to a
> > > > > > particular CSI-2 receiver.
> > > > > > 
> > > > > > > has been registered. If runtime PM is still disabled, this will fail.
> > > > > > > 
> > > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > ---
> > > > > > >  drivers/media/i2c/ov2740.c | 14 ++++++++------
> > > > > > >  1 file changed, 8 insertions(+), 6 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> > > > > > > index 41d4f85470fd..319dc00e47b4 100644
> > > > > > > --- a/drivers/media/i2c/ov2740.c
> > > > > > > +++ b/drivers/media/i2c/ov2740.c
> > > > > > > @@ -1172,6 +1172,12 @@ static int ov2740_probe(struct i2c_client *client)
> > > > > > >  		goto probe_error_v4l2_ctrl_handler_free;
> > > > > > >  	}
> > > > > > >  
> > > > > > > +	/* Set the device's state to active if it's in D0 state. */
> > > > > > > +	if (full_power)
> > > > > > > +		pm_runtime_set_active(&client->dev);
> > > > > > 
> > > > > > I wonder why we need this in drivers. If ACPI has powered the device on
> > > > > > prior to calling probe(), couldn't it also set the PM runtime state
> > > > > > accordingly ?
> > > > > 
> > > > > What happens here is that the ipu bridge creates a VCM device and it
> > > > > resumes the related sensor before instantiating that device (see
> > > > > ipu_bridge_instantiate_vcm_work()). However this may take place already
> > > > > right after registering the async sub-device. Resuming the sensor will fail
> > > > > if runtime PM isn't enabled.
> > > > > 
> > > > > I'll add something along these lines to the commit message.
> > > > 
> > > > I understand this, but that doesn't answer my question :-) Why is there
> > > > a need to call pm_runtime_set_active(), couldn't it be done somewhere in
> > > > common code ?
> > > 
> > > Ah, I think I misunderstood your earlier question.
> > > 
> > > The sensor may be left powered off for probe if the device's _DSC object
> > > evaluates to 4. See Documentation/firmware-guide/acpi/non-d0-probe.rst for
> > > more information.
> > 
> > That information should be available to core code, given that it's
> > retrieved in the driver with a call to acpi_dev_state_d0(). Couldn't it
> > thus be handled in core code ?
> 
> The I²C framework is responsible powering on the device before probe, not
> the ACPI framework. The default runtime PM state is suspended, so I guess
> this could be changed for ACPI devices in the I²C framework. But that
> certainly does not belong to this patchset.

Of course. Sorry if I didn't make it clear that this comment was
unrelated to this patch series.

> I was actually hoping the ACPI introduced I²C devices could have power
> management working the same was as for DT: driver would resume the device
> instead of the framework. This would simplify drivers.

You're the ACPI specialist (I'm sorry about that :-)), whatever you
think is best is fine with me, as long as we simplify drivers. Power
management in camera sensor drivers is way too complicated to implement,
with too much boilerplate code being copied (often incorrectly) between
drivers.

> > > > > > > +	pm_runtime_enable(&client->dev);
> > > > > > > +	pm_runtime_idle(&client->dev);
> > > > > > > +
> > > > > > 
> > > > > > With the commit message fixed,
> > > > > > 
> > > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > 
> > > > > Thank you.
> > > > > 
> > > > > > >  	ret = v4l2_async_register_subdev_sensor(&ov2740->sd);
> > > > > > >  	if (ret < 0) {
> > > > > > >  		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
> > > > > > > @@ -1182,16 +1188,12 @@ static int ov2740_probe(struct i2c_client *client)
> > > > > > >  	if (ret)
> > > > > > >  		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
> > > > > > >  
> > > > > > > -	/* Set the device's state to active if it's in D0 state. */
> > > > > > > -	if (full_power)
> > > > > > > -		pm_runtime_set_active(&client->dev);
> > > > > > > -	pm_runtime_enable(&client->dev);
> > > > > > > -	pm_runtime_idle(&client->dev);
> > > > > > > -
> > > > > > >  	return 0;
> > > > > > >  
> > > > > > >  probe_error_media_entity_cleanup:
> > > > > > >  	media_entity_cleanup(&ov2740->sd.entity);
> > > > > > > +	pm_runtime_disable(&client->dev);
> > > > > > > +	pm_runtime_set_suspended(&client->dev);
> > > > > > >  
> > > > > > >  probe_error_v4l2_ctrl_handler_free:
> > > > > > >  	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);

-- 
Regards,

Laurent Pinchart
