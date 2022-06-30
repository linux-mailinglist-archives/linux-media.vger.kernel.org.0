Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8805613E6
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 10:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233562AbiF3H70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 03:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233435AbiF3H7P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 03:59:15 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB3140E67
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 00:59:12 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id h23so37289647ejj.12
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 00:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UWoxaHa9vwxRJ6htkBZWfNpkwJZl7SwP5oymQpu5C9M=;
        b=AgTvAomP7BwhDmMrgHzBlaSrddv2EaZOMyN+NwwxRWasoyUhvqycpuDsjOFu4IKXmI
         uZSdAAyhDrNRlfAfgUzFeGQ7QXM0vvD46z6yBerONji2+GtagX0b8z/8JjMX4JFJn11H
         k0Cok2PIT0lKIaCwPHp18AAi+Kkx/7qTMgN5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UWoxaHa9vwxRJ6htkBZWfNpkwJZl7SwP5oymQpu5C9M=;
        b=l5+ytjJ7NOoLRnyF4DOG19oMq4WllZsWBnMT4INcWUcNQujFnsxaMHVEgI6KfeT47/
         9zsEBML1ZDXdjpm2klXcGBEScS/v/QRiMoHTX+YXUrj4Kj0DDkmENy5c1RSdpf7hEVz1
         4G9BVQN7NMzu1kyWElE5+oSD1H68fIkZ/MPMmd5oRmC+gt1bnDsSAaLm3mqFTbJSrQSU
         QtPq7iq/jMEl+2RraGM9YwtGlo3uBUWAWRpYetqN3vPf43HglWJpTH6umqU3hN0Ums/n
         Uc79UlZjjJardPEqYYDa+T4nS1D58xW8/6c87Qn5ehvRKSlfq6j/k/EbjPwwF4jMNUJo
         tIAQ==
X-Gm-Message-State: AJIora92/0DzY5K12NPU+hPheUvc7qwZ35HaAqbPI2+HQpgKJCTH3i9e
        nge1o43EyDuDyZ+N0f0Y4jbbdg==
X-Google-Smtp-Source: AGRyM1sKoxRfGn4k8OqA4AVTM6Di92Va176J6zDkJUKjtWogkJiZTYIEFSkZtCthU/c7vRRvLEDUJQ==
X-Received: by 2002:a17:907:9706:b0:726:2cf4:6698 with SMTP id jg6-20020a170907970600b007262cf46698mr7327522ejc.619.1656575951352;
        Thu, 30 Jun 2022 00:59:11 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id g26-20020a170906199a00b00724ff3251c4sm8746269ejd.26.2022.06.30.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 00:59:11 -0700 (PDT)
Date:   Thu, 30 Jun 2022 09:59:09 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] media: ov5693: move hw cfg functions into
 ov5693_hwcfg
Message-ID: <20220630075909.GB482517@tom-ThinkPad-T14s-Gen-2i>
References: <20220629152933.422990-1-tommaso.merciai@amarulasolutions.com>
 <20220629152933.422990-5-tommaso.merciai@amarulasolutions.com>
 <20220629160756.s6vh7r3uqj62oaqd@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629160756.s6vh7r3uqj62oaqd@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Jun 29, 2022 at 06:07:56PM +0200, Jacopo Mondi wrote:
> Hi Tommaso,
> 
> On Wed, Jun 29, 2022 at 05:29:31PM +0200, Tommaso Merciai wrote:
> > Move hw configuration functions into ov5693_hwcfg. This is done to
> > separate the code that handle the hw cfg from probe in a clean way.
> > Add also support to get clock from "clock-frequency" fwnode in
> > ov5675_hwcfg function
> 
> Why ? :)
> 
> What about:
> 
> "Add support for ACPI-based platforms that specify the clock frequency by
> using the "clock-frequency" property instead of specifying a clock
> provider reference."

Thanks for suggestion. I use this in v4

> 
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> 
> Not on this patch, but it seems you have not collected the tags
> received on the previous version of the series.
> 
> > ---
> > Changes since v2:
> >  - Fix commit body as suggested by Sakari, Jacopo
> >  - Add details to commit body as suggested Jacopo
> >  - Move ov5693_check_hwcfg into ov5693_hwcfg
> >  - Fix xvclk_rate position as suggested Jacopo
> 
> Also fixed a bug it seems :)

You are right :'(

> 
> >
> >  drivers/media/i2c/ov5693.c | 57 +++++++++++++++++++++++---------------
> >  1 file changed, 34 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> > index d2adc5513a21..3c805a5a5181 100644
> > --- a/drivers/media/i2c/ov5693.c
> > +++ b/drivers/media/i2c/ov5693.c
> > @@ -1339,16 +1339,48 @@ static int ov5693_get_regulators(struct ov5693_device *ov5693)
> >  				       ov5693->supplies);
> >  }
> >
> > -static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
> > +static int ov5693_hwcfg(struct ov5693_device *ov5693)
> >  {
> >  	struct fwnode_handle *fwnode = dev_fwnode(ov5693->dev);
> >  	struct v4l2_fwnode_endpoint bus_cfg = {
> >  		.bus_type = V4L2_MBUS_CSI2_DPHY,
> >  	};
> >  	struct fwnode_handle *endpoint;
> > +	u32 xvclk_rate;
> >  	unsigned int i;
> >  	int ret;
> >
> > +	ov5693->xvclk = devm_clk_get_optional(ov5693->dev, "xvclk");
> > +	if (IS_ERR(ov5693->xvclk))
> > +		return dev_err_probe(ov5693->dev, PTR_ERR(ov5693->xvclk),
> > +				     "failed to get xvclk: %ld\n",
> > +				     PTR_ERR(ov5693->xvclk));
> > +
> > +	if (ov5693->xvclk) {
> > +		xvclk_rate = clk_get_rate(ov5693->xvclk);
> > +	} else {
> > +		ret = fwnode_property_read_u32(fwnode, "clock-frequency",
> > +					       &xvclk_rate);
> > +
> > +		if (ret) {
> > +			dev_err(ov5693->dev, "can't get clock frequency");
> > +			return ret;
> > +		}
> > +	}
> 
> This now looks good to me, thanks!
> 
> > +
> > +	if (xvclk_rate != OV5693_XVCLK_FREQ)
> > +		dev_warn(ov5693->dev, "Found clk freq %u, expected %u\n",
> > +			 xvclk_rate, OV5693_XVCLK_FREQ);
> > +
> > +	ret = ov5693_configure_gpios(ov5693);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ov5693_get_regulators(ov5693);
> > +	if (ret)
> > +		return dev_err_probe(ov5693->dev, ret,
> > +				     "Error fetching regulators\n");
> > +
> >  	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
> >  	if (!endpoint)
> >  		return -EPROBE_DEFER; /* Could be provided by cio2-bridge */
> > @@ -1390,7 +1422,6 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
> >  static int ov5693_probe(struct i2c_client *client)
> >  {
> >  	struct ov5693_device *ov5693;
> > -	u32 xvclk_rate;
> >  	int ret = 0;
> 
> No need for ret to be intialized, but it was already like this...

I can send patch later for this, or you prefer to fix this in this
series?

Regards,
Tommaso

> 
> The patch itself looks good
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Thanks
>   j
> 
> >
> >  	ov5693 = devm_kzalloc(&client->dev, sizeof(*ov5693), GFP_KERNEL);
> > @@ -1400,7 +1431,7 @@ static int ov5693_probe(struct i2c_client *client)
> >  	ov5693->client = client;
> >  	ov5693->dev = &client->dev;
> >
> > -	ret = ov5693_check_hwcfg(ov5693);
> > +	ret = ov5693_hwcfg(ov5693);
> >  	if (ret)
> >  		return ret;
> >
> > @@ -1408,26 +1439,6 @@ static int ov5693_probe(struct i2c_client *client)
> >
> >  	v4l2_i2c_subdev_init(&ov5693->sd, client, &ov5693_ops);
> >
> > -	ov5693->xvclk = devm_clk_get(&client->dev, "xvclk");
> > -	if (IS_ERR(ov5693->xvclk)) {
> > -		dev_err(&client->dev, "Error getting clock\n");
> > -		return PTR_ERR(ov5693->xvclk);
> > -	}
> > -
> > -	xvclk_rate = clk_get_rate(ov5693->xvclk);
> > -	if (xvclk_rate != OV5693_XVCLK_FREQ)
> > -		dev_warn(&client->dev, "Found clk freq %u, expected %u\n",
> > -			 xvclk_rate, OV5693_XVCLK_FREQ);
> > -
> > -	ret = ov5693_configure_gpios(ov5693);
> > -	if (ret)
> > -		return ret;
> > -
> > -	ret = ov5693_get_regulators(ov5693);
> > -	if (ret)
> > -		return dev_err_probe(&client->dev, ret,
> > -				     "Error fetching regulators\n");
> > -
> >  	ov5693->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >  	ov5693->pad.flags = MEDIA_PAD_FL_SOURCE;
> >  	ov5693->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > --
> > 2.25.1
> >

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
