Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8420D2FC0C9
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729713AbhASUTZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:19:25 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33926 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729703AbhASSzZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 13:55:25 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 9A16E1F4545A
Subject: Re: [PATCH v2 12/14] media: Clarify v4l2-async subdevice addition API
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20210118015258.3993-1-ezequiel@collabora.com>
 <20210118015258.3993-13-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <75208443-6c37-adad-36b9-97822dd341bf@collabora.com>
Date:   Tue, 19 Jan 2021 15:54:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118015258.3993-13-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On 1/17/21 10:52 PM, Ezequiel Garcia wrote:
> Now that most users of v4l2_async_notifier_add_subdev have
> been converted, let's fix the documentation so it's more clear
> how the v4l2-async API should be used.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../driver-api/media/v4l2-subdev.rst          | 38 ++++++++++++++++---
>  include/media/v4l2-async.h                    | 11 ++++--
>  2 files changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index bb5b1a7cdfd9..47a70538d758 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -204,11 +204,39 @@ Before registering the notifier, bridge drivers must do two things:
>  first, the notifier must be initialized using the
>  :c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
>  begin to form a list of subdevice descriptors that the bridge device
> -needs for its operation. Subdevice descriptors are added to the notifier
> -using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> -takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
> -and a pointer to the subdevice descripter, which is of type struct
> -:c:type:`v4l2_async_subdev`.
> +needs for its operation. Several functions are available, to add subdevice
> +descriptors to a notifier, depending on the type of device:
> +:c:func:`v4l2_async_notifier_add_fwnode_subdev`,
> +:c:func:`v4l2_async_notifier_add_fwnode_remote_subdev` or
> +:c:func:`v4l2_async_notifier_add_i2c_subdev`.
> +
> +These functions allocate a subdevice descriptor, which is of
> +type struct :c:type:`v4l2_async_subdev`, and take a size argument
> +which can be used to embed the descriptor in a driver-specific
> +async subdevice struct. The &struct :c:type:`v4l2_async_subdev`
> +shall be the first member of this struct:
> +
> +.. code-block:: c
> +
> +	struct my_async_subdev {
> +		struct v4l2_async_subdev asd;
> +		...
> +	};
> +
> +	struct my_async_subdev *my_asd;
> +	struct v4l2_async_subdev *asd;
> +	struct fwnode_handle *ep;
> +
> +	...
> +
> +	asd = v4l2_async_notifier_add_fwnode_subdev(
> +			&notifier, ep, sizeof(*my_asd));
> +	fwnode_handle_put(ep);
> +
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
> +
> +	my_asd = container_of(asd, struct my_async_subdev, asd);
>  
>  The V4L2 core will then use these descriptors to match asynchronously
>  registered subdevices to them. If a match is detected the ``.bound()``
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 2144502c95e0..7b45427aafb5 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -120,7 +120,11 @@ struct v4l2_async_notifier {
>   * @notifier: pointer to &struct v4l2_async_notifier
>   *
>   * This function initializes the notifier @asd_list. It must be called
> - * before the first call to @v4l2_async_notifier_add_subdev.
> + * before adding a subdevice to a notifier, using one of:
> + * @v4l2_async_notifier_add_i2c_subdev,
> + * @v4l2_async_notifier_add_fwnode_subdev,
> + * @v4l2_async_notifier_add_fwnode_remote_subdev or
> + * @v4l2_async_notifier_parse_fwnode_sensor_common.

Please see comment on 11/14. Maybe we could remove
v4l2_async_notifier_parse_fwnode_sensor_common() from the kapi and remove it
from this comment.

Regards,
Helen

>   */
>  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
>  
> @@ -240,8 +244,9 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
>   * sub-devices allocated for the purposes of the notifier but not the notifier
>   * itself. The user is responsible for calling this function to clean up the
>   * notifier after calling
> - * @v4l2_async_notifier_add_subdev,
> - * @v4l2_async_notifier_parse_fwnode_endpoints or
> + * @v4l2_async_notifier_add_i2c_subdev,
> + * @v4l2_async_notifier_add_fwnode_subdev,
> + * @v4l2_async_notifier_add_fwnode_remote_subdev or
>   * @v4l2_async_notifier_parse_fwnode_sensor_common.
>   *
>   * There is no harm from calling v4l2_async_notifier_cleanup in other
> 
