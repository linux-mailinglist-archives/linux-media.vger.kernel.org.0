Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75E3E577BD8
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 08:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233580AbiGRGm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 02:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbiGRGm0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 02:42:26 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D385BE2F;
        Sun, 17 Jul 2022 23:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658126541; x=1689662541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0kv2gBEParhNaHPdjuIwGUrTXLst3/vjwjfZ1UMJusw=;
  b=hEQw6NLptK7NSY866Ux5sxJbXDzmtHL63VltkpZK3Z5WERpoBWsftDS7
   D3EdLWoG5hqi/8SORub1NeqwiEi6DAAs8AbVFpjIslArzEJtY68MxW+D2
   iJidc/NM/H59Zk0+47cGJJKndk9WJC1+kJUKMVjoFgoqXLL3xH2XeHqbL
   IJdfGggOYHFnVKIWQlEfZMIMFHM9jPN/ZdmLFbc8tvaSisF2uAod2yHK2
   59HIPysZHjXBNUGzvaom4eNcmqV5eduK73dOyzSD+7mrPadltd9pt62KA
   arTYGs6qvAo8tzfSsLBnItv97DXd+VYkzFK5m8zXMfvD5Ta0l5ILojNe+
   A==;
X-IronPort-AV: E=Sophos;i="5.92,280,1650924000"; 
   d="scan'208";a="25095054"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Jul 2022 08:42:19 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 18 Jul 2022 08:42:19 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 18 Jul 2022 08:42:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658126539; x=1689662539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0kv2gBEParhNaHPdjuIwGUrTXLst3/vjwjfZ1UMJusw=;
  b=YsrpYbIlfvi3AUpdczfxxt163rS7r8oEs3RSl25MPilKw/TiunJMgeck
   mWYYsn5n6yhOTRmgya6S/y4JORmq6nCoLdzOPxn1FeZjSFwpO3+6Dsc4j
   IaLXSiUDxrRtiYU7XWB7bmApn7S0CI/XNuRSMYxbkWbiDMKlnEyjTbRqh
   rUQQinQjo1700o91Ux/RrfkiSCMjmESWuYsqPbJlrqMM7iWg49CLvEgKc
   3DF2ODD3Fz95B5zNzz8glGLxk6RXKKSg3hkHiy8D8Ub+lsHrRc2xUevq/
   zW/2DXJqEUopDNUvMogt+NV7upmhhxd0sSgQAEPboYdkA4GqA9gGM2SZS
   g==;
X-IronPort-AV: E=Sophos;i="5.92,280,1650924000"; 
   d="scan'208";a="25095053"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Jul 2022 08:42:19 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D1C9A280056;
        Mon, 18 Jul 2022 08:42:18 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: i2c: ov9282: Add regulator support
Date:   Mon, 18 Jul 2022 08:42:16 +0200
Message-ID: <12042217.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtQZ5TD+pc7lPLI0@valkosipuli.retiisi.eu>
References: <20220715074858.875808-1-alexander.stein@ew.tq-group.com> <20220715074858.875808-6-alexander.stein@ew.tq-group.com> <YtQZ5TD+pc7lPLI0@valkosipuli.retiisi.eu>
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

Hi Sakari,

Am Sonntag, 17. Juli 2022, 16:17:09 CEST schrieb Sakari Ailus:
> Hi Alexander,
> 
> Thanks for the set.
> 
> On Fri, Jul 15, 2022 at 09:48:57AM +0200, Alexander Stein wrote:
> > Need in case the sensors is supplied by a switchable regulator.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Remove error message for failed regulator_bulk_disable()
> > * Rename ov9282_configure_regulators to ov9282_get_regulators
> > 
> >  drivers/media/i2c/ov9282.c | 39 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 04fda8222e07..263cdffc558f 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -11,6 +11,7 @@
> > 
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> > 
> > +#include <linux/regulator/consumer.h>
> > 
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-fwnode.h>
> > 
> > @@ -55,6 +56,14 @@
> > 
> >  #define OV9282_REG_MIN		0x00
> >  #define OV9282_REG_MAX		0xfffff
> > 
> > +static const char * const ov9282_supply_names[] = {
> > +	"avdd",		/* Analog power */
> > +	"dovdd",	/* Digital I/O power */
> > +	"dvdd",		/* Digital core power */
> > +};
> > +
> > +#define OV9282_NUM_SUPPLIES ARRAY_SIZE(ov9282_supply_names)
> > +
> > 
> >  /**
> >  
> >   * struct ov9282_reg - ov9282 sensor register
> >   * @address: Register address
> > 
> > @@ -127,6 +136,7 @@ struct ov9282 {
> > 
> >  	struct media_pad pad;
> >  	struct gpio_desc *reset_gpio;
> >  	struct clk *inclk;
> > 
> > +	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
> > 
> >  	struct v4l2_ctrl_handler ctrl_handler;
> >  	struct v4l2_ctrl *link_freq_ctrl;
> >  	struct v4l2_ctrl *pclk_ctrl;
> > 
> > @@ -883,10 +893,18 @@ static int ov9282_power_on(struct device *dev)
> > 
> >  		goto error_reset;
> >  	
> >  	}
> > 
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(ov9282->supplies),
> > ov9282->supplies);
> Please run the set through:
> 
> 	./scripts/checkpatch.pl --strict --max-line-length=80

Thanks, will be fixed.

> > +	if (ret) {
> > +		dev_err(dev, "Failed to enable regulators\n");
> > +		goto disable_clk;
> > +	}
> > +
> > 
> >  	usleep_range(400, 600);
> >  	
> >  	return 0;
> > 
> > +disable_clk:
> > +	clk_disable_unprepare(ov9282->inclk);
> > 
> >  error_reset:
> >  	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> > 
> > @@ -903,6 +921,9 @@ static int ov9282_power_off(struct device *dev)
> > 
> >  {
> >  
> >  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >  	struct ov9282 *ov9282 = to_ov9282(sd);
> > 
> > +	int ret;
> 
> ret seems to be unused.

You are right, leftover from last cleanup. Will be removed.

Thanks and best regards,
Alexander

> > +
> > +	regulator_bulk_disable(ARRAY_SIZE(ov9282->supplies), ov9282-
>supplies);
> > 
> >  	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> > 
> > @@ -996,6 +1017,18 @@ static int ov9282_init_controls(struct ov9282
> > *ov9282)> 
> >  	return 0;
> >  
> >  }
> > 
> > +static int ov9282_get_regulators(struct ov9282 *ov9282)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(ov9282->supplies); i++)
> > +		ov9282->supplies[i].supply = ov9282_supply_names[i];
> > +
> > +	return devm_regulator_bulk_get(ov9282->dev,
> > +				       ARRAY_SIZE(ov9282-
>supplies),
> > +				       ov9282->supplies);
> > +}
> > +
> > 
> >  /**
> >  
> >   * ov9282_probe() - I2C client device binding
> >   * @client: pointer to i2c client device
> > 
> > @@ -1022,6 +1055,12 @@ static int ov9282_probe(struct i2c_client *client)
> > 
> >  		return ret;
> >  	
> >  	}
> > 
> > +	ret = ov9282_get_regulators(ov9282);
> > +	if (ret) {
> > +		dev_err(&client->dev, "Failed to get power 
regulators\n");
> > +		return ret;
> > +	}
> > +
> > 
> >  	mutex_init(&ov9282->mutex);
> >  	
> >  	ret = ov9282_power_on(ov9282->dev);




