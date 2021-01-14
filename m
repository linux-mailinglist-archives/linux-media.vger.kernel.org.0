Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192772F586B
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 04:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbhANCW5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 21:22:57 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37934 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbhANCW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 21:22:56 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E109279;
        Thu, 14 Jan 2021 03:22:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610590932;
        bh=oE3ysn9z6luGayIKGybOR12ZBvaW6sraPO1AxDGD7nk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WGj9AIDD66ktNhfES4WCBvhbFktn38KQ7ECF+cLDhso6ZL1u4bkb0xIEVgmX6kK29
         iAuvw6M4dit+v5ARdroRvHDGoQUgIPZp+CXcs4i8GtLpMGYUYcHjOuvW8biDkXYbAq
         he5np01MtHrvz7RXwHUGcSCENZ5nhXsWouOM8zP0=
Date:   Thu, 14 Jan 2021 04:21:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 12/13] media: Clarify v4l2-async subdevice addition API
Message-ID: <X/+qw3OtGpveRK17@pendragon.ideasonboard.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-13-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112132339.5621-13-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Thank you for the patch.

On Tue, Jan 12, 2021 at 10:23:38AM -0300, Ezequiel Garcia wrote:
> Now that most users of v4l2_async_notifier_add_subdev have
> been converted, let's fix the documentation so it's more clear
> how the v4l2-async API should be used.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../driver-api/media/v4l2-subdev.rst          | 38 ++++++++++++++++---
>  include/media/v4l2-async.h                    | 12 +++++-
>  2 files changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index bb5b1a7cdfd9..5ddf9de4fcf7 100644
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
> +needs for its operation. Several functions are available, to
> +add subdevice descriptors to a notifier, depending on the type of device:

You could reflow this to

needs for its operation. Several functions are available, to add subdevice
descriptors to a notifier, depending on the type of device:

> +:c:func:`v4l2_async_notifier_add_devname_subdev`,
> +:c:func:`v4l2_async_notifier_add_fwnode_subdev` or
> +:c:func:`v4l2_async_notifier_add_i2c_subdev`.

Should you also list v4l2_async_notifier_add_fwnode_remote_subdev() (and
possibly v4l2_async_notifier_parse_fwnode_endpoints()) here ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
> index 2429ac55be1c..1278f98355a7 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -151,7 +151,12 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
>   * @notifier: pointer to &struct v4l2_async_notifier
>   *
>   * This function initializes the notifier @asd_list. It must be called
> - * before the first call to @v4l2_async_notifier_add_subdev.
> + * before adding a subdevice to a notifier, using one of:
> + * @v4l2_async_notifier_add_fwnode_subdev,
> + * @v4l2_async_notifier_add_fwnode_remote_subdev,
> + * @v4l2_async_notifier_add_i2c_subdev,
> + * @v4l2_async_notifier_add_devname_subdev or
> + * @v4l2_async_notifier_parse_fwnode_endpoints.
>   */
>  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
>  
> @@ -290,7 +295,10 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
>   * sub-devices allocated for the purposes of the notifier but not the notifier
>   * itself. The user is responsible for calling this function to clean up the
>   * notifier after calling
> - * @v4l2_async_notifier_add_subdev or
> + * @v4l2_async_notifier_add_fwnode_subdev,
> + * @v4l2_async_notifier_add_fwnode_remote_subdev,
> + * @v4l2_async_notifier_add_i2c_subdev,
> + * @v4l2_async_notifier_add_devname_subdev or
>   * @v4l2_async_notifier_parse_fwnode_endpoints.
>   *
>   * There is no harm from calling v4l2_async_notifier_cleanup in other

-- 
Regards,

Laurent Pinchart
