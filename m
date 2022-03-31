Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85304ED9B1
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 14:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236182AbiCaMgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 08:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236181AbiCaMgj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 08:36:39 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0624E38F
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 05:34:52 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 342FE209C8;
        Thu, 31 Mar 2022 15:34:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1648730089;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1OVj1sPb9HkOcUg3a0rVt1APEZt/vF7oD8h3LevSMwQ=;
        b=ckXXeZ9+nlI+6ksGJNBBUEQDf3ggfIBoUyUEqU+s2uAeQAU/+PoPCt50bulWwJGmA5ozLi
        DbdapKsQYtqcyP8OzQJJoInzgBTrTeH2D5gh/SOdma+Rql52Fy9I+iSxa5OIsq6V63YVYM
        vQsYgT4ViPobY6WymN2GMF5EH4WoIyc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 57CAC634C90;
        Thu, 31 Mar 2022 15:34:47 +0300 (EEST)
Date:   Thu, 31 Mar 2022 15:34:47 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 6/8] media: i2c: ov5670: Add runtime_pm operations
Message-ID: <YkWf5wDytwl9pN8t@valkosipuli.retiisi.eu>
References: <20220329090133.338073-1-jacopo@jmondi.org>
 <20220329090133.338073-7-jacopo@jmondi.org>
 <YkV9kf6UQ5kxZwbe@valkosipuli.retiisi.eu>
 <YkWDd17CaGuQCmw/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkWDd17CaGuQCmw/@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1648730089; a=rsa-sha256; cv=none;
        b=XAO38U+aBEtKZ3ddsQIczBPimBO1IwhY1TVemstaZX7gsLolCpxIEHcra8jd9Hyr7EFMvl
        pGPb4IJeALQdO8SyxeuQr3eA0rsGXOcgPmbXDugz46L3H5dS+PlO5WIdmYAbWZ2xXppYDs
        I4ejKlCC3rYAW6i0NrC7YxDNGEO7QDI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1648730089;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1OVj1sPb9HkOcUg3a0rVt1APEZt/vF7oD8h3LevSMwQ=;
        b=D3hAREaQK2hYg5tL+ByOHdaFntr0GazTQHfryN/tUp6AYCncYlzfz2qItvBlr74pltCMmR
        0cjB/ipJdLEdF6j45/HB6PYdCQb1mjqKFVTRHFN2gDrpSFPQ1fti1igmEDk0j7zAmdvdZ/
        AmAVoRTGxj5OieCLtrDIl9c+DQjmGVE=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Mar 31, 2022 at 01:33:27PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Mar 31, 2022 at 01:08:17PM +0300, Sakari Ailus wrote:
> > On Tue, Mar 29, 2022 at 11:01:31AM +0200, Jacopo Mondi wrote:
> > > Implement the power up and power down routines and install them as
> > > runtime_pm handler for runtime_suspend and runtime_resume operations.
> > > 
> > > Rework the runtime_pm enablement and the chip power handling during
> > > probe, as calling pm_runtime_idle() in a driver that registers no
> > > idle callback is a nop.
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ov5670.c | 58 ++++++++++++++++++++++++++++++++++----
> > >  1 file changed, 52 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > > index 9e69b4008917..b63b07d8ca2f 100644
> > > --- a/drivers/media/i2c/ov5670.c
> > > +++ b/drivers/media/i2c/ov5670.c
> > > @@ -4,6 +4,7 @@
> > >  #include <linux/acpi.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/gpio/consumer.h>
> > > +#include <linux/delay.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/mod_devicetable.h>
> > >  #include <linux/module.h>
> > > @@ -2424,6 +2425,39 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
> > >  	return ret;
> > >  }
> > >  
> > > +static int __maybe_unused ov5670_runtime_resume(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct ov5670 *ov5670 = to_ov5670(sd);
> > > +	int ret;
> > > +
> > > +	ret = regulator_bulk_enable(OV5670_NUM_SUPPLIES, ov5670->supplies);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	gpiod_set_value_cansleep(ov5670->pwdn_gpio, 0);
> > > +	gpiod_set_value_cansleep(ov5670->reset_gpio, 0);
> > > +
> > > +	/* 8192 * 2 clock pulses before the first SCCB transaction. */
> > > +	usleep_range(1000, 1500);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused ov5670_runtime_suspend(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct ov5670 *ov5670 = to_ov5670(sd);
> > > +
> > > +	gpiod_set_value_cansleep(ov5670->reset_gpio, 1);
> > > +	gpiod_set_value_cansleep(ov5670->pwdn_gpio, 1);
> > > +	regulator_bulk_disable(OV5670_NUM_SUPPLIES, ov5670->supplies);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int __maybe_unused ov5670_suspend(struct device *dev)
> > >  {
> > >  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > @@ -2564,14 +2598,25 @@ static int ov5670_probe(struct i2c_client *client)
> > >  		goto error_print;
> > >  	}
> > >  
> > > +	pm_runtime_enable(&client->dev);
> > > +
> > >  	full_power = acpi_dev_state_d0(&client->dev);
> > >  	if (full_power) {
> > > +		ret = pm_runtime_resume_and_get(&client->dev);
> > 
> > This will power the device on, but only on OF systems.
> > 
> > Could you instead power the device on on OF systems explicitly? That's what
> > other drivers do, too. The changes would be probably more simple to
> > implement, too.
> 
> Can we fix ACPI to do something more sane instead ? :-) I don't want to
> see those complicated patterns replicated in all drivers.

I guess it could be changed. But it will take time.

This patch does not quite represent what it takes to implement runtime PM
support without ACPI.

Also, sensor drivers shouldn't be somehow special when it comes to power
management so depending on CONFIG_PM isn't all that nice either. Of course,
removing that Kconfig option would simplify quite a few things.

-- 
Regards,

Sakari Ailus
