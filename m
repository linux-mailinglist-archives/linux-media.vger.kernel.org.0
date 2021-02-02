Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C563F30C3B0
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 16:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235490AbhBBPZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 10:25:57 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46608 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233004AbhBBPYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 10:24:44 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id DE8B31F40F3A
Subject: Re: [PATCH v5.1 13/13] media: Clarify v4l2-async subdevice addition
 API
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20210202135611.13920-14-sakari.ailus@linux.intel.com>
 <20210202142533.14989-1-sakari.ailus@linux.intel.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <c8bfacda-24d3-ab8a-b017-6c08c99484cd@collabora.com>
Date:   Tue, 2 Feb 2021 12:23:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210202142533.14989-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/2/21 11:25 AM, Sakari Ailus wrote:
> From: Ezequiel Garcia <ezequiel@collabora.com>
> 
> Now that most users of v4l2_async_notifier_add_subdev have been converted,
> let's fix the documentation so it's more clear how the v4l2-async API
> should be used.
> 
> Document functions that drivers should use, and their purpose.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Helen Koike <helen.koike@collabora.com>

Thanks for working on this :)

Regards,
Helen

> ---
> since v5:
> 
> - Fix function names after which notifier needs to be cleaned up or
>   initialised before; v4l2_async_notifier_add_subdev ->
>   __v4l2_async_notifier_add_subdev.
> 
>  .../driver-api/media/v4l2-subdev.rst          | 48 +++++++++++++++----
>  include/media/v4l2-async.h                    | 15 ++++--
>  2 files changed, 50 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 0e82c77cf3e2..8b53da2f9c74 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -197,15 +197,45 @@ unregister the notifier the driver has to call
>  takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
>  pointer to struct :c:type:`v4l2_async_notifier`.
>  
> -Before registering the notifier, bridge drivers must do two things:
> -first, the notifier must be initialized using the
> -:c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
> -begin to form a list of subdevice descriptors that the bridge device
> -needs for its operation. Subdevice descriptors are added to the notifier
> -using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> -takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
> -and a pointer to the subdevice descripter, which is of type struct
> -:c:type:`v4l2_async_subdev`.
> +Before registering the notifier, bridge drivers must do two things: first, the
> +notifier must be initialized using the :c:func:`v4l2_async_notifier_init`.
> +Second, bridge drivers can then begin to form a list of subdevice descriptors
> +that the bridge device needs for its operation. Several functions are available
> +to add subdevice descriptors to a notifier, depending on the type of device and
> +the needs of the driver.
> +
> +:c:func:`v4l2_async_notifier_add_fwnode_remote_subdev` and
> +:c:func:`v4l2_async_notifier_add_i2c_subdev` are for bridge and ISP drivers for
> +registering their async sub-devices with the notifier.
> +
> +:c:func:`v4l2_async_register_subdev_sensor_common` is a helper function for
> +sensor drivers registering their own async sub-device, but it also registers a
> +notifier and further registers async sub-devices for lens and flash devices
> +found in firmware. The notifier for the sub-device is unregistered with the
> +async sub-device.
> +
> +These functions allocate an async sub-device descriptor which is of type struct
> +:c:type:`v4l2_async_subdev` embedded in a driver-specific struct. The &struct
> +:c:type:`v4l2_async_subdev` shall be the first member of this struct:
> +
> +.. code-block:: c
> +
> +	struct my_async_subdev {
> +		struct v4l2_async_subdev asd;
> +		...
> +	};
> +
> +	struct my_async_subdev *my_asd;
> +	struct fwnode_handle *ep;
> +
> +	...
> +
> +	my_asd = v4l2_async_notifier_add_fwnode_remote_subdev(&notifier, ep,
> +							      struct my_async_subdev);
> +	fwnode_handle_put(ep);
> +
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
>  
>  The V4L2 core will then use these descriptors to match asynchronously
>  registered subdevices to them. If a match is detected the ``.bound()``
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 192a11bdc4ad..6f22daa6f067 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -128,7 +128,12 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
>   * @notifier: pointer to &struct v4l2_async_notifier
>   *
>   * This function initializes the notifier @asd_list. It must be called
> - * before the first call to @v4l2_async_notifier_add_subdev.
> + * before adding a subdevice to a notifier, using one of:
> + * @v4l2_async_notifier_add_fwnode_remote_subdev,
> + * @v4l2_async_notifier_add_fwnode_subdev,
> + * @v4l2_async_notifier_add_i2c_subdev,
> + * @__v4l2_async_notifier_add_subdev or
> + * @v4l2_async_notifier_parse_fwnode_endpoints.
>   */
>  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
>  
> @@ -262,9 +267,11 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
>   * sub-devices allocated for the purposes of the notifier but not the notifier
>   * itself. The user is responsible for calling this function to clean up the
>   * notifier after calling
> - * @v4l2_async_notifier_add_subdev,
> - * @v4l2_async_notifier_parse_fwnode_endpoints or
> - * @v4l2_fwnode_reference_parse_sensor_common.
> + * @v4l2_async_notifier_add_fwnode_remote_subdev,
> + * @v4l2_async_notifier_add_fwnode_subdev,
> + * @v4l2_async_notifier_add_i2c_subdev,
> + * @__v4l2_async_notifier_add_subdev or
> + * @v4l2_async_notifier_parse_fwnode_endpoints.
>   *
>   * There is no harm from calling v4l2_async_notifier_cleanup in other
>   * cases as long as its memory has been zeroed after it has been
> 
