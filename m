Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A175830B181
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 21:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbhBAUSH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 15:18:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbhBAUSG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 15:18:06 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E51C061756
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 12:17:26 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id B93EF1F44415
Subject: Re: [PATCH v4 14/14] media: Clarify v4l2-async subdevice addition API
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
References: <20210128120945.5062-1-sakari.ailus@linux.intel.com>
 <20210128120945.5062-15-sakari.ailus@linux.intel.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <f8964e52-673e-405f-0bc6-eb3562b6065a@collabora.com>
Date:   Mon, 1 Feb 2021 17:17:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128120945.5062-15-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/28/21 9:09 AM, Sakari Ailus wrote:
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
> ---
>  .../driver-api/media/v4l2-subdev.rst          | 41 ++++++++++++++++---
>  include/media/v4l2-async.h                    | 15 +++++--
>  2 files changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index 0e82c77cf3e2..a6b82b9c8210 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -201,11 +201,42 @@ Before registering the notifier, bridge drivers must do two things:
>  first, the notifier must be initialized using the
>  :c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
>  begin to form a list of subdevice descriptors that the bridge device
> -needs for its operation. Subdevice descriptors are added to the notifier
> -using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> -takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
> -and a pointer to the subdevice descripter, which is of type struct
> -:c:type:`v4l2_async_subdev`.
> +needs for its operation. Several functions are available, to add subdevice
> +descriptors to a notifier, depending on the type of device and the needs of the
> +driver.
> +
> +:c:func:`v4l2_async_register_subdev_sensor_common` is a helper function for
> +sensor drivers registering their own async sub-device, but it also supports
> +registering lens and flash devices. The function registers an async notifier for
> +the sub-device which is unregistered with the async sub-device.
> +
> +:c:func:`v4l2_async_notifier_add_fwnode_remote_subdev`,
> +:c:func:`v4l2_async_notifier_add_fwnode_subdev` and
> +:c:func:`v4l2_async_notifier_add_i2c_subdev` are for bridge and ISP drivers for
> +registering their async sub-devices.

If I understand correctly, these functions are for bridge and ISP drivers to tell
the framework they are waiting asynchronously for another sub-device.
I wonder if this could be re-phrased a bit to convey that.

Shouldn't __v4l2_async_notifier_add_subdev() and v4l2_async_notifier_parse_fwnode_endpoints()
also be mentioned here?
Or maybe just don't mention __v4l2_async_notifier_add_subdev() here to discourage its usage.

I see that v4l2_async_notifier_parse_fwnode_endpoints() is only used by sun6i_csi.c,
I wonder if sun6i is a special case of if we could use one of those 3 functions instead
and discourage the usage of v4l2_async_notifier_parse_fwnode_endpoints() as well.

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
> index b94f0a0a8042..6dac6cb6290f 100644
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
> + * @v4l2_async_notifier_add_subdev or

v4l2_async_notifier_add_subdev() was renamed on patch 12/14.

Maybe just don't mention it here to discourage its usage?

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
> - * @v4l2_async_register_subdev_sensor_common.
> + * @v4l2_async_notifier_add_fwnode_remote_subdev,
> + * @v4l2_async_notifier_add_fwnode_subdev,
> + * @v4l2_async_notifier_add_i2c_subdev,
> + * @v4l2_async_notifier_add_subdev or

Same here.


Thanks
Helen

> + * @v4l2_async_notifier_parse_fwnode_endpoints.
>   *
>   * There is no harm from calling v4l2_async_notifier_cleanup in other
>   * cases as long as its memory has been zeroed after it has been
> 
