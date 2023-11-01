Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872587DE52C
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 18:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344826AbjKARRV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 13:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344778AbjKARRM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 13:17:12 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CAAFD;
        Wed,  1 Nov 2023 10:17:00 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso232811fa.0;
        Wed, 01 Nov 2023 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698859019; x=1699463819; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1mOHwVJ12oHPJ8PM0IgE6ypzGs/hgPNO/gRixwxz60s=;
        b=EKpuI9v/G751vz5LAKiO8e2U6be3IzxDYm5u+8/WdWnHZJwG5rzcHzP4STmfCp8XrY
         Uz7aoVTO2KgYDgyRUi4P9KJvMqAj9hqiZkrvfoY2UKLyCIKqqBVnxkVF4704greTPcUT
         sIckHh+YFH3C6H5n7m7wD3kPHvuSgGk8ygFm6sL9i2fLqr9qalOphD6CmLUr3b9an9cO
         zVB5qwuqU4zR9g3TgKEZjUt5PjZ35wMfdCXu8aqzoCcaEoug0qyzJqYEuWhjo+PfnyPu
         07bqH7zfYoAxZ1CJ94qipGwftb4TWxJdN7EyF5aI0mVb6dp1nSSBDVBNimy07vaK+I6I
         TCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698859019; x=1699463819;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mOHwVJ12oHPJ8PM0IgE6ypzGs/hgPNO/gRixwxz60s=;
        b=qyfddXs2teFsusSYhyqpC7r9z/fZ54t9ln+HQzF2Vafc5AhXG2laKRY/fA7T1wnT1I
         ZiiUUA4uKrUfs8WdzYLB/KDARwgHOFXbB58+vmRJ2hDSKCKRMHBzw+kaE+RXdpSo5oJi
         9MRcmTV+GoVk3se8jv4uBRd6QrgoQ2JU5jNyTdZ+C72eWzfXzaqTGB0MR9inv8oWsYrb
         NBLVb1k83KnxsSNXJaPTFwt0TTl68FQ9IofvTla6yYsxezsoHjzZL+dYkmfhlJbnJXHe
         o18MxUWfjLSV5Ml9Dtb5jdgk4TwploOMea+2qegAuUAgbswfUNjlY1Lr48KtzFu5Udtu
         kvXw==
X-Gm-Message-State: AOJu0Yzc7uXWJUkl8h9qRoZ4kw8Xt7taC7/gCZHHiiV2Yd69/Jmy9CpD
        csjWs6ohWiLyHcHETM0khzdPu1+XPiA=
X-Google-Smtp-Source: AGHT+IG6am0uK67EvaNEd714Ej0skj/G1a5AZhKe4ydTI2IXbkRm22SJSQNZnEQs07PGl82YpBWrjA==
X-Received: by 2002:a2e:90c2:0:b0:2c6:ee51:87ab with SMTP id o2-20020a2e90c2000000b002c6ee5187abmr58636ljg.35.1698859018765;
        Wed, 01 Nov 2023 10:16:58 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-59-109.cust.vodafonedsl.it. [188.217.59.109])
        by smtp.gmail.com with ESMTPSA id k16-20020a05600c1c9000b003fee567235bsm364312wms.1.2023.11.01.10.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 10:16:58 -0700 (PDT)
Date:   Wed, 1 Nov 2023 18:16:55 +0100
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>, martin.hecht@avnet.eu,
        michael.roeder@avnet.eu, mhecht73@gmail.com,
        linuxfancy@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Gerald Loacker <gerald.loacker@wolfvision.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v10 3/3] media: i2c: Add support for alvium camera
Message-ID: <ZUKIB2MDpvFgnrNM@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20231020141354.2500602-1-tomm.merciai@gmail.com>
 <20231020141354.2500602-4-tomm.merciai@gmail.com>
 <a98bca80-944c-493b-9872-75b94cd24eea@wanadoo.fr>
 <ZUDpAR3ZyBVrUyat@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZUJc-p_i4JjqkM9i@kekkonen.localdomain>
 <7fc8435a-6a96-447b-af85-8ae5242cabfd@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fc8435a-6a96-447b-af85-8ae5242cabfd@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cristophe,

On Wed, Nov 01, 2023 at 03:22:18PM +0100, Christophe JAILLET wrote:
> Le 01/11/2023 � 15:13, Sakari Ailus a �crit�:
> > Hi Tommaso,
> > 
> > On Tue, Oct 31, 2023 at 12:46:09PM +0100, Tommaso Merciai wrote:
> > > > > +static int alvium_get_dt_data(struct alvium_dev *alvium)
> > > > > +{
> > > > > +	struct device *dev = &alvium->i2c_client->dev;
> > > > > +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> > > > > +	struct fwnode_handle *endpoint;
> > > > > +	int ret = -EINVAL;
> > > > > +
> > > > > +	if (!fwnode)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	/* Only CSI2 is supported for now: */
> > > > > +	alvium->ep.bus_type = V4L2_MBUS_CSI2_DPHY;
> > > > > +
> > > > > +	endpoint = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> > > > > +	if (!endpoint) {
> > > > > +		dev_err(dev, "endpoint node not found\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &alvium->ep)) {
> > > > > +		dev_err(dev, "could not parse endpoint\n");
> > > > > +		goto error_out;
> > > > 
> > > > This could go to another label to be less confusing, but
> > > > v4l2_fwnode_endpoint_free() looks to be a no-op here, so good enough.
> > > 
> > > Thanks for the comment.
> > > To be honest right now this is clear to me
> > > I prefere to stay on the following :)
> > > Prefer to keep just only one path.
> > 
> > You can safely call v4l2_fwnode_endpoint_free() on an unparsed endpoint (or
> > on and endpoint the parsing of which failed). I prefer this too.
> > 
> > > > > +		ret = -ENODEV;
> > > > > +		goto err_powerdown;
> > > > > +	}
> > > > > +
> > > > > +	ret = alvium_get_hw_info(alvium);
> > > > > +	if (ret) {
> > > > > +		dev_err(dev, "get_hw_info fail %d\n", ret);
> > > > > +		goto err_powerdown;
> > > > > +	}
> > > > > +
> > > > > +	ret = alvium_hw_init(alvium);
> > > > > +	if (ret) {
> > > > > +		dev_err(dev, "hw_init fail %d\n", ret);
> > > > > +		goto err_powerdown;
> > > > > +	}
> > > > > +
> > > > > +	ret = alvium_setup_mipi_fmt(alvium);
> > > > > +	if (ret) {
> > > > > +		dev_err(dev, "setup_mipi_fmt fail %d\n", ret);
> > > > > +		goto err_powerdown;
> > > > > +	}
> > > > > +
> > > > > +	/*
> > > > > +	 * Enable runtime PM without autosuspend:
> > > > > +	 *
> > > > > +	 * Don't use pm autosuspend (alvium have ~7s boot time).
> > > > > +	 * Alvium has been powered manually:
> > > > > +	 *  - mark it as active
> > > > > +	 *  - increase the usage count without resuming the device.
> > > > > +	 */
> > > > > +	pm_runtime_set_active(dev);
> > > > > +	pm_runtime_get_noresume(dev);
> > > > > +	pm_runtime_enable(dev);
> > > > > +
> > > > > +	/* Initialize the V4L2 subdev. */
> > > > > +	ret = alvium_subdev_init(alvium);
> > > > > +	if (ret)
> > > > > +		goto err_pm;
> > > > > +
> > > > > +	ret = v4l2_async_register_subdev(&alvium->sd);
> > > > > +	if (ret < 0) {
> > > > > +		dev_err(dev, "Could not register v4l2 device\n");
> > > > > +		goto err_subdev;
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > +err_subdev:
> > > > > +	alvium_subdev_cleanup(alvium);
> > > > 
> > > > Should this also be called by the remove function?
> > > > Or is it already handled by an un-register mechanism?
> > > 
> > > Right, I miss this.
> > > Thanks.
> > > I put this to remove function like:
> > > 
> > > static void alvium_remove(struct i2c_client *client)
> > > {
> > > 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > 	struct alvium_dev *alvium = sd_to_alvium(sd);
> > > 	struct device *dev = &alvium->i2c_client->dev;
> > > 
> > > 	/*
> > > 	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
> > > 	 * make sure to turn power off manually.
> > > 	 */
> > > 	pm_runtime_disable(dev);
> > > 	if (!pm_runtime_status_suspended(dev))
> > > 		alvium_power_on(alvium, false);
> > > 	pm_runtime_set_suspended(dev);
> > > 
> > > 	alvium_subdev_cleanup(alvium);
> > > 	i2c_unregister_device(alvium->i2c_client);
> > 
> > This doesn't belong here (as you didn't register it). It was missed in the
> > review earlier.
> 
> Should be v4l2_async_unregister_subdev()?

Mmmm good point.
I think actually I'm missing this.
You are completely right. Thanks.

Regards,
Tommaso

> 
> CJ
> 
> > 
> > > }
> > > 
> > > 
> > > If for you Cristophe, Sakari, Laurent,
> > > it's ok I prefer to skip v11 that I sent this morning too early.
> > > I collected hints from Cristophe right now and I plan to send v12
> > > this afternoon/evening if for you all is ok.
> > > 
> > > https://github.com/avs-sas/linux/blob/tm/media_stage/v6.6.0-rc3/alvium_drv/v12/drivers/media/i2c/alvium-csi2.c
> > > 
> > > Please let me know.
> > > 
> > > Thanks again to all! :)
> > 
> 
