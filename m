Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 813D49D177
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 16:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731176AbfHZOOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 10:14:18 -0400
Received: from retiisi.org.uk ([95.216.213.190]:48090 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728760AbfHZOOS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 10:14:18 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 93F87634C87;
        Mon, 26 Aug 2019 17:14:07 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1i2Fl1-0000QG-FP; Mon, 26 Aug 2019 17:14:07 +0300
Date:   Mon, 26 Aug 2019 17:14:07 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] v4l2-core: fix coding style for the two new c files
Message-ID: <20190826141407.GF826@valkosipuli.retiisi.org.uk>
References: <cc14c00c478ce503c28856e7b2425aae5bc7b31e.1566828181.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc14c00c478ce503c28856e7b2425aae5bc7b31e.1566828181.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the patch.

On Mon, Aug 26, 2019 at 11:03:18AM -0300, Mauro Carvalho Chehab wrote:
> As I2C and SPI parts of the V4L2 core got split, let's take
> the chance and solve the CodingStyle issues there, as reported
> by checkpatch --strict.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-i2c.c | 66 +++++++++++++++++++-----------
>  drivers/media/v4l2-core/v4l2-spi.c | 21 ++++++----
>  2 files changed, 54 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
> index d549291ab22b..5bf99e7c0c09 100644
> --- a/drivers/media/v4l2-core/v4l2-i2c.c
> +++ b/drivers/media/v4l2-core/v4l2-i2c.c
> @@ -28,7 +28,8 @@ void v4l2_i2c_subdev_unregister(struct v4l2_subdev *sd)
>  		i2c_unregister_device(client);
>  }
>  
> -void v4l2_i2c_subdev_set_name(struct v4l2_subdev *sd, struct i2c_client *client,
> +void v4l2_i2c_subdev_set_name(struct v4l2_subdev *sd,
> +			      struct i2c_client *client,
>  			      const char *devname, const char *postfix)
>  {
>  	if (!devname)
> @@ -42,7 +43,7 @@ void v4l2_i2c_subdev_set_name(struct v4l2_subdev *sd, struct i2c_client *client,
>  EXPORT_SYMBOL_GPL(v4l2_i2c_subdev_set_name);
>  
>  void v4l2_i2c_subdev_init(struct v4l2_subdev *sd, struct i2c_client *client,
> -		const struct v4l2_subdev_ops *ops)
> +			  const struct v4l2_subdev_ops *ops)
>  {
>  	v4l2_subdev_init(sd, ops);
>  	sd->flags |= V4L2_SUBDEV_FL_IS_I2C;
> @@ -57,9 +58,11 @@ void v4l2_i2c_subdev_init(struct v4l2_subdev *sd, struct i2c_client *client,
>  EXPORT_SYMBOL_GPL(v4l2_i2c_subdev_init);
>  
>  /* Load an i2c sub-device. */
> -struct v4l2_subdev *v4l2_i2c_new_subdev_board(struct v4l2_device *v4l2_dev,
> -		struct i2c_adapter *adapter, struct i2c_board_info *info,
> -		const unsigned short *probe_addrs)
> +struct v4l2_subdev
> +*v4l2_i2c_new_subdev_board(struct v4l2_device *v4l2_dev,

Hmm. I'd put the asterisk on the previous line --- it's part of the type
after all.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> +			   struct i2c_adapter *adapter,
> +			   struct i2c_board_info *info,
> +			   const unsigned short *probe_addrs)
>  {
>  	struct v4l2_subdev *sd = NULL;
>  	struct i2c_client *client;
> @@ -76,14 +79,16 @@ struct v4l2_subdev *v4l2_i2c_new_subdev_board(struct v4l2_device *v4l2_dev,
>  	else
>  		client = i2c_new_device(adapter, info);
>  
> -	/* Note: by loading the module first we are certain that c->driver
> -	   will be set if the driver was found. If the module was not loaded
> -	   first, then the i2c core tries to delay-load the module for us,
> -	   and then c->driver is still NULL until the module is finally
> -	   loaded. This delay-load mechanism doesn't work if other drivers
> -	   want to use the i2c device, so explicitly loading the module
> -	   is the best alternative. */
> -	if (client == NULL || client->dev.driver == NULL)
> +	/*
> +	 * Note: by loading the module first we are certain that c->driver
> +	 * will be set if the driver was found. If the module was not loaded
> +	 * first, then the i2c core tries to delay-load the module for us,
> +	 * and then c->driver is still NULL until the module is finally
> +	 * loaded. This delay-load mechanism doesn't work if other drivers
> +	 * want to use the i2c device, so explicitly loading the module
> +	 * is the best alternative.
> +	 */
> +	if (!client || !client->dev.driver)
>  		goto error;
>  
>  	/* Lock the module so we can safely get the v4l2_subdev pointer */
> @@ -91,35 +96,44 @@ struct v4l2_subdev *v4l2_i2c_new_subdev_board(struct v4l2_device *v4l2_dev,
>  		goto error;
>  	sd = i2c_get_clientdata(client);
>  
> -	/* Register with the v4l2_device which increases the module's
> -	   use count as well. */
> +	/*
> +	 * Register with the v4l2_device which increases the module's
> +	 * use count as well.
> +	 */
>  	if (v4l2_device_register_subdev(v4l2_dev, sd))
>  		sd = NULL;
>  	/* Decrease the module use count to match the first try_module_get. */
>  	module_put(client->dev.driver->owner);
>  
>  error:
> -	/* If we have a client but no subdev, then something went wrong and
> -	   we must unregister the client. */
> -	if (client && sd == NULL)
> +	/*
> +	 * If we have a client but no subdev, then something went wrong and
> +	 * we must unregister the client.
> +	 */
> +	if (client && !sd)
>  		i2c_unregister_device(client);
>  	return sd;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_i2c_new_subdev_board);
>  
>  struct v4l2_subdev *v4l2_i2c_new_subdev(struct v4l2_device *v4l2_dev,
> -		struct i2c_adapter *adapter, const char *client_type,
> -		u8 addr, const unsigned short *probe_addrs)
> +					struct i2c_adapter *adapter,
> +					const char *client_type,
> +					u8 addr,
> +					const unsigned short *probe_addrs)
>  {
>  	struct i2c_board_info info;
>  
> -	/* Setup the i2c board info with the device type and
> -	   the device address. */
> +	/*
> +	 * Setup the i2c board info with the device type and
> +	 * the device address.
> +	 */
>  	memset(&info, 0, sizeof(info));
>  	strscpy(info.type, client_type, sizeof(info.type));
>  	info.addr = addr;
>  
> -	return v4l2_i2c_new_subdev_board(v4l2_dev, adapter, &info, probe_addrs);
> +	return v4l2_i2c_new_subdev_board(v4l2_dev, adapter, &info,
> +					 probe_addrs);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_i2c_new_subdev);
>  
> @@ -132,8 +146,10 @@ unsigned short v4l2_i2c_subdev_addr(struct v4l2_subdev *sd)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_i2c_subdev_addr);
>  
> -/* Return a list of I2C tuner addresses to probe. Use only if the tuner
> -   addresses are unknown. */
> +/*
> + * Return a list of I2C tuner addresses to probe. Use only if the tuner
> + * addresses are unknown.
> + */
>  const unsigned short *v4l2_i2c_tuner_addrs(enum v4l2_i2c_tuner_type type)
>  {
>  	static const unsigned short radio_addrs[] = {
> diff --git a/drivers/media/v4l2-core/v4l2-spi.c b/drivers/media/v4l2-core/v4l2-spi.c
> index 15162659a63b..eadecdff7349 100644
> --- a/drivers/media/v4l2-core/v4l2-spi.c
> +++ b/drivers/media/v4l2-core/v4l2-spi.c
> @@ -17,7 +17,7 @@ void v4l2_spi_subdev_unregister(struct v4l2_subdev *sd)
>  }
>  
>  void v4l2_spi_subdev_init(struct v4l2_subdev *sd, struct spi_device *spi,
> -		const struct v4l2_subdev_ops *ops)
> +			  const struct v4l2_subdev_ops *ops)
>  {
>  	v4l2_subdev_init(sd, ops);
>  	sd->flags |= V4L2_SUBDEV_FL_IS_SPI;
> @@ -29,12 +29,13 @@ void v4l2_spi_subdev_init(struct v4l2_subdev *sd, struct spi_device *spi,
>  	spi_set_drvdata(spi, sd);
>  	/* initialize name */
>  	snprintf(sd->name, sizeof(sd->name), "%s %s",
> -		spi->dev.driver->name, dev_name(&spi->dev));
> +		 spi->dev.driver->name, dev_name(&spi->dev));
>  }
>  EXPORT_SYMBOL_GPL(v4l2_spi_subdev_init);
>  
>  struct v4l2_subdev *v4l2_spi_new_subdev(struct v4l2_device *v4l2_dev,
> -		struct spi_master *master, struct spi_board_info *info)
> +					struct spi_master *master,
> +					struct spi_board_info *info)
>  {
>  	struct v4l2_subdev *sd = NULL;
>  	struct spi_device *spi = NULL;
> @@ -46,7 +47,7 @@ struct v4l2_subdev *v4l2_spi_new_subdev(struct v4l2_device *v4l2_dev,
>  
>  	spi = spi_new_device(master, info);
>  
> -	if (spi == NULL || spi->dev.driver == NULL)
> +	if (!spi || !spi->dev.driver)
>  		goto error;
>  
>  	if (!try_module_get(spi->dev.driver->owner))
> @@ -54,8 +55,10 @@ struct v4l2_subdev *v4l2_spi_new_subdev(struct v4l2_device *v4l2_dev,
>  
>  	sd = spi_get_drvdata(spi);
>  
> -	/* Register with the v4l2_device which increases the module's
> -	   use count as well. */
> +	/*
> +	 * Register with the v4l2_device which increases the module's
> +	 * use count as well.
> +	 */
>  	if (v4l2_device_register_subdev(v4l2_dev, sd))
>  		sd = NULL;
>  
> @@ -63,8 +66,10 @@ struct v4l2_subdev *v4l2_spi_new_subdev(struct v4l2_device *v4l2_dev,
>  	module_put(spi->dev.driver->owner);
>  
>  error:
> -	/* If we have a client but no subdev, then something went wrong and
> -	   we must unregister the client. */
> +	/*
> +	 * If we have a client but no subdev, then something went wrong and
> +	 * we must unregister the client.
> +	 */
>  	if (!sd)
>  		spi_unregister_device(spi);
>  
> -- 
> 2.21.0
> 

-- 
Sakari Ailus
