Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8D03464CF
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 17:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233134AbhCWQTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 12:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233085AbhCWQSu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 12:18:50 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279B7C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 09:18:50 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A8E8A1F44B33
Message-ID: <a9606db40b60d1ea97bac16bf65e8eb17f37090e.camel@collabora.com>
Subject: Re: [PATCH v2 1/4] v4l: fwnode: Rename and make static V4L2 async
 notifier helper
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel.garcia@collabora.com
Date:   Tue, 23 Mar 2021 13:18:41 -0300
In-Reply-To: <20210312125657.25442-2-sakari.ailus@linux.intel.com>
References: <20210312125657.25442-1-sakari.ailus@linux.intel.com>
         <20210312125657.25442-2-sakari.ailus@linux.intel.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-03-12 at 14:56 +0200, Sakari Ailus wrote:
> Rename v4l2_async_notifier_parse_fwnode_sensor_common() as
> v4l2_async_notifier_parse_fwnode_sensor() and make the function static, as
> it's not used by a driver and maybe never will.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 27 ++++++++++++++++++++++-----
>  include/media/v4l2-async.h            |  2 +-
>  include/media/v4l2-fwnode.h           | 21 ---------------------
>  3 files changed, 23 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 2283ff3b8e1d..9c1b38919491 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -1259,8 +1259,27 @@ v4l2_fwnode_reference_parse_int_props(struct device *dev,
>         return !fwnode || PTR_ERR(fwnode) == -ENOENT ? 0 : PTR_ERR(fwnode);
>  }
>  
> -int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
> -                                                  struct v4l2_async_notifier *notifier)
> +/**
> + * v4l2_async_notifier_parse_fwnode_sensor - parse common references on
> + *                                          sensors for async sub-devices
> + * @dev: the device node the properties of which are parsed for references
> + * @notifier: the async notifier where the async subdevs will be added
> + *
> + * Parse common sensor properties for remote devices related to the
> + * sensor and set up async sub-devices for them.
> + *
> + * Any notifier populated using this function must be released with a call to
> + * v4l2_async_notifier_release() after it has been unregistered and the async
> + * sub-devices are no longer in use, even in the case the function returned an
> + * error.
> + *
> + * Return: 0 on success
> + *        -ENOMEM if memory allocation failed
> + *        -EINVAL if property parsing failed
> + */
> +static int
> +v4l2_async_notifier_parse_fwnode_sensor(struct device *dev,
> +                                       struct v4l2_async_notifier *notifier)
>  {
>         static const char * const led_props[] = { "led" };
>         static const struct v4l2_fwnode_int_props props[] = {
> @@ -1288,7 +1307,6 @@ int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
>  
>         return 0;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_sensor_common);
>  
>  int v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd)
>  {
> @@ -1304,8 +1322,7 @@ int v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd)
>  
>         v4l2_async_notifier_init(notifier);
>  
> -       ret = v4l2_async_notifier_parse_fwnode_sensor_common(sd->dev,
> -                                                            notifier);
> +       ret = v4l2_async_notifier_parse_fwnode_sensor(sd->dev, notifier);
>         if (ret < 0)
>                 goto out_cleanup;
>  
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index d28cbe8142b8..aee28c0e31ac 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -295,7 +295,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd);
>   *
>   * This function is just like v4l2_async_register_subdev() with the exception
>   * that calling it will also parse firmware interfaces for remote references
> - * using v4l2_async_notifier_parse_fwnode_sensor_common() and registers the
> + * using v4l2_async_notifier_parse_fwnode_sensor() and registers the
>   * async sub-devices. The sub-device is similarly unregistered by calling
>   * v4l2_async_unregister_subdev().
>   *
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 80d21ad8d603..7ab033b819eb 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -510,27 +510,6 @@ v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
>                                            size_t asd_struct_size,
>                                            parse_endpoint_func parse_endpoint);
>  
> -/**
> - * v4l2_async_notifier_parse_fwnode_sensor_common - parse common references on
> - *                                            sensors for async sub-devices
> - * @dev: the device node the properties of which are parsed for references
> - * @notifier: the async notifier where the async subdevs will be added
> - *
> - * Parse common sensor properties for remote devices related to the
> - * sensor and set up async sub-devices for them.
> - *
> - * Any notifier populated using this function must be released with a call to
> - * v4l2_async_notifier_release() after it has been unregistered and the async
> - * sub-devices are no longer in use, even in the case the function returned an
> - * error.
> - *
> - * Return: 0 on success
> - *        -ENOMEM if memory allocation failed
> - *        -EINVAL if property parsing failed
> - */
> -int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
> -                                                  struct v4l2_async_notifier *notifier);
> -
>  /* Helper macros to access the connector links. */
>  
>  /** v4l2_connector_last_link - Helper macro to get the first



