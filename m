Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A13B637FA0
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 20:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiKXTZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 14:25:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKXTZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 14:25:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D5C663DA
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 11:25:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F5BB7FA;
        Thu, 24 Nov 2022 20:25:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669317936;
        bh=3WHz+XMeMTidqRxZazaPOyraez6VkGl7XsFzJ68CP00=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T38YuN5Y+UNjei4D6KnVlO8LKtO65MG5lzwhDNMANxFhTjT0i5SnJSnqELh0B8o90
         wg6R49GsoqYXbcFSBrZN/t+CD/6EAnOlZTuFB0Yb3WLOQawR016e2rQZpOnrH+Trud
         7sWxrjm7F0l0f+H2zIXOyK1ioKs5UiolM3IDl3ro=
Date:   Thu, 24 Nov 2022 21:25:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 02/15] media: i2c: imx290: Factor out subdev init and
 cleanup to functions
Message-ID: <Y3/FIPX2boTRjuNq@pendragon.ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
 <20221122223250.21233-3-laurent.pinchart@ideasonboard.com>
 <CAPY8ntB7p6DtFOEg9gU5FBPu3kCRX0ssHGzXqc7UL31R8c_dZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntB7p6DtFOEg9gU5FBPu3kCRX0ssHGzXqc7UL31R8c_dZw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Nov 24, 2022 at 06:31:51PM +0000, Dave Stevenson wrote:
> On Tue, 22 Nov 2022 at 22:34, Laurent Pinchart wrote:
> >
> > The probe() function is large. Make it more readable by factoring the
> > subdev initialization code out. While at it, rename the error labels as
> > the "free_" prefix isn't accurate.
> >
> > No functional change intended.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 109 +++++++++++++++++++++----------------
> >  1 file changed, 62 insertions(+), 47 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index aae4f51941a1..4dbf218e7a63 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -1015,6 +1015,46 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
> >         .link_validate = v4l2_subdev_link_validate,
> >  };
> >
> > +static int imx290_subdev_init(struct imx290 *imx290)
> > +{
> > +       struct i2c_client *client = to_i2c_client(imx290->dev);
> > +       int ret;
> > +
> > +       /*
> > +        * Initialize the frame format. In particular, imx290->current_mode
> > +        * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() call
> > +        * below relies on these fields.
> > +        */
> > +       imx290_entity_init_cfg(&imx290->sd, NULL);
> > +
> > +       ret = imx290_ctrl_init(imx290);
> > +       if (ret < 0) {
> > +               dev_err(imx290->dev, "Control initialization error %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> > +       imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +       imx290->sd.dev = imx290->dev;
> > +       imx290->sd.entity.ops = &imx290_subdev_entity_ops;
> > +       imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +       imx290->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +       ret = media_entity_pads_init(&imx290->sd.entity, 1, &imx290->pad);
> > +       if (ret < 0) {
> > +               dev_err(imx290->dev, "Could not register media entity\n");
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void imx290_subdev_cleanup(struct imx290 *imx290)
> > +{
> > +       media_entity_cleanup(&imx290->sd.entity);
> > +       v4l2_ctrl_handler_free(&imx290->ctrls);
> > +}
> > +
> >  /* ----------------------------------------------------------------------------
> >   * Power management
> >   */
> > @@ -1148,10 +1188,10 @@ static int imx290_probe(struct i2c_client *client)
> >         fwnode_handle_put(endpoint);
> >         if (ret == -ENXIO) {
> >                 dev_err(dev, "Unsupported bus type, should be CSI2\n");
> > -               goto free_err;
> > +               goto err_endpoint;
> >         } else if (ret) {
> >                 dev_err(dev, "Parsing endpoint node failed\n");
> > -               goto free_err;
> > +               goto err_endpoint;
> >         }
> >
> >         /* Get number of data lanes */
> > @@ -1159,7 +1199,7 @@ static int imx290_probe(struct i2c_client *client)
> >         if (imx290->nlanes != 2 && imx290->nlanes != 4) {
> >                 dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
> >                 ret = -EINVAL;
> > -               goto free_err;
> > +               goto err_endpoint;
> >         }
> >
> >         dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
> > @@ -1167,7 +1207,7 @@ static int imx290_probe(struct i2c_client *client)
> >         if (!ep.nr_of_link_frequencies) {
> >                 dev_err(dev, "link-frequency property not found in DT\n");
> >                 ret = -EINVAL;
> > -               goto free_err;
> > +               goto err_endpoint;
> >         }
> >
> >         /* Check that link frequences for all the modes are in device tree */
> > @@ -1175,7 +1215,7 @@ static int imx290_probe(struct i2c_client *client)
> >         if (fq) {
> >                 dev_err(dev, "Link frequency of %lld is not supported\n", fq);
> >                 ret = -EINVAL;
> > -               goto free_err;
> > +               goto err_endpoint;
> >         }
> >
> >         /* get system clock (xclk) */
> > @@ -1183,14 +1223,14 @@ static int imx290_probe(struct i2c_client *client)
> >         if (IS_ERR(imx290->xclk)) {
> >                 dev_err(dev, "Could not get xclk");
> >                 ret = PTR_ERR(imx290->xclk);
> > -               goto free_err;
> > +               goto err_endpoint;
> >         }
> >
> >         ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> >                                        &xclk_freq);
> >         if (ret) {
> >                 dev_err(dev, "Could not get xclk frequency\n");
> > -               goto free_err;
> > +               goto err_endpoint;
> >         }
> >
> >         /* external clock must be 37.125 MHz */
> > @@ -1198,19 +1238,19 @@ static int imx290_probe(struct i2c_client *client)
> >                 dev_err(dev, "External clock frequency %u is not supported\n",
> >                         xclk_freq);
> >                 ret = -EINVAL;
> > -               goto free_err;
> > +               goto err_endpoint;
> >         }
> >
> >         ret = clk_set_rate(imx290->xclk, xclk_freq);
> >         if (ret) {
> >                 dev_err(dev, "Could not set xclk frequency\n");
> > -               goto free_err;
> > +               goto err_endpoint;
> >         }
> >
> >         ret = imx290_get_regulators(dev, imx290);
> >         if (ret < 0) {
> >                 dev_err(dev, "Cannot get regulators\n");
> > -               goto free_err;
> > +               goto err_endpoint;
> >         }
> >
> >         imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
> > @@ -1218,55 +1258,33 @@ static int imx290_probe(struct i2c_client *client)
> >         if (IS_ERR(imx290->rst_gpio)) {
> >                 dev_err(dev, "Cannot get reset gpio\n");
> >                 ret = PTR_ERR(imx290->rst_gpio);
> > -               goto free_err;
> > +               goto err_endpoint;
> >         }
> >
> >         mutex_init(&imx290->lock);
> >
> > -       /*
> > -        * Initialize the frame format. In particular, imx290->current_mode
> > -        * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() call
> > -        * below relies on these fields.
> > -        */
> > -       imx290_entity_init_cfg(&imx290->sd, NULL);
> > -
> > -       ret = imx290_ctrl_init(imx290);
> > -       if (ret < 0) {
> > -               dev_err(dev, "Control initialization error %d\n", ret);
> > -               goto free_mutex;
> > -       }
> > -
> > -       v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> > -       imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > -       imx290->sd.dev = &client->dev;
> > -       imx290->sd.entity.ops = &imx290_subdev_entity_ops;
> > -       imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > -
> > -       imx290->pad.flags = MEDIA_PAD_FL_SOURCE;
> > -       ret = media_entity_pads_init(&imx290->sd.entity, 1, &imx290->pad);
> > -       if (ret < 0) {
> > -               dev_err(dev, "Could not register media entity\n");
> > -               goto free_ctrl;
> > -       }
> > +       ret = imx290_subdev_init(imx290);
> > +       if (ret)
> > +               goto err_mutex;
> >
> >         ret = v4l2_async_register_subdev(&imx290->sd);
> >         if (ret < 0) {
> >                 dev_err(dev, "Could not register v4l2 device\n");
> > -               goto free_entity;
> > +               goto err_subdev;
> >         }
> >
> >         /* Power on the device to match runtime PM state below */
> >         ret = imx290_power_on(dev);
> >         if (ret < 0) {
> >                 dev_err(dev, "Could not power on the device\n");
> > -               goto free_entity;
> > +               goto err_subdev;
> >         }
> >
> >         ret = imx290_read(imx290, IMX290_CHIP_ID, &chip_id);
> >         if (ret) {
> >                 dev_err(dev, "Could not read chip ID: %d\n", ret);
> >                 imx290_power_off(dev);
> > -               goto free_entity;
> > +               goto err_subdev;
> >         }
> 
> Which tree is this patch based on, as neither Sakari nor Mauro's trees
> have this read in them.
> I suspect an older patch which added it got dropped due to the worry
> over Vision Component's modules which block 16 bit reads.

There's a local patch indeed, which I incorrectly put at the bottom of
the branch. It will be fixed in v2.

> >
> >         dev_info(dev, "chip ID 0x%04x\n", chip_id);
> > @@ -1279,13 +1297,11 @@ static int imx290_probe(struct i2c_client *client)
> >
> >         return 0;
> >
> > -free_entity:
> > -       media_entity_cleanup(&imx290->sd.entity);
> > -free_ctrl:
> > -       v4l2_ctrl_handler_free(&imx290->ctrls);
> > -free_mutex:
> > +err_subdev:
> > +       imx290_subdev_cleanup(imx290);
> > +err_mutex:
> >         mutex_destroy(&imx290->lock);
> > -free_err:
> > +err_endpoint:
> >         v4l2_fwnode_endpoint_free(&ep);
> >
> >         return ret;
> > @@ -1297,8 +1313,7 @@ static void imx290_remove(struct i2c_client *client)
> >         struct imx290 *imx290 = to_imx290(sd);
> >
> >         v4l2_async_unregister_subdev(sd);
> > -       media_entity_cleanup(&sd->entity);
> > -       v4l2_ctrl_handler_free(sd->ctrl_handler);
> > +       imx290_subdev_cleanup(imx290);
> >
> >         mutex_destroy(&imx290->lock);
> >

-- 
Regards,

Laurent Pinchart
