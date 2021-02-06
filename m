Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC79311C27
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 09:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhBFIas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Feb 2021 03:30:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:55848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhBFIan (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Feb 2021 03:30:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C872064E88;
        Sat,  6 Feb 2021 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612600202;
        bh=r/ABb1lAdnXjCIrnwX9wTAPGKbOffeD05N2rbKPU8vI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dyoMojArGXKFKAiatYr1B0taRVYOK0mX+8TfBDysBRUeytYvQF5YV9TxaR2RWo6Yy
         SVHR4TMYNc02lSCtfkMTXGSyQ9FM0kkQ7228E6mcZVSmJ/L0f/txzNUQ/UVSDXVvv9
         oR9dv7oeCrx7PhnE1+QVpA+NMp9h2J6GnIRebx3JermavhaZZY0FBSkUci4kKcu3gt
         RH2hsckwzm4BtMKih2y6uAgMl2izdCNJ9aZmxz25Yuk1twoHTLHiQa7uV+R3wXpWg0
         my1gPu6vP/8hi/BkYGufBdSbZtz8X34p/hh/ekboA/PcAUfwPKyEvrh2q9TJoxqQbO
         97TGuBu597eIg==
Date:   Sat, 6 Feb 2021 09:29:54 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v5 13/13] media: Clarify v4l2-async subdevice addition
 API
Message-ID: <20210206092954.1c75e92c@coco.lan>
In-Reply-To: <20210202135611.13920-14-sakari.ailus@linux.intel.com>
References: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
        <20210202135611.13920-14-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue,  2 Feb 2021 15:56:11 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

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


There's absolutely no need anymore to use:

	struct :c:type:`v4l2_async_subdev`

or
	:c:func:`v4l2_async_notifier_add_fwnode_remote_subdev`

In a matter of fact, this can even cause troubles with newer versions of
Sphinx, as, after version 3.0, structs should be declared as:

	:c:struct:`foo`

Our building system has gained a few years ago a Sphinx extension that
will automatically use the right markup, if all structs are declared
as:
	struct foo

and all functions as:

	bar()

So, the last two paragraphs could be simply:

	v4l2_async_register_subdev_sensor_common() is a helper function for
	sensor drivers registering their own async sub-device, but it also registers a
	notifier and further registers async sub-devices for lens and flash devices
	found in firmware. The notifier for the sub-device is unregistered with the
	async sub-device.

	These functions allocate an async sub-device descriptor which is of type
	struct v4l2_async_subdev embedded in a driver-specific struct. The 
	struct v4l2_async_subdev shall be the first member of this struct:

PS.: I guess the automarkup.py would accept having something like:

	very big line here with lots of words... struct
	foo

IMHO, for people reading the text files, it is a lot easier to keep
"struct foo" at the same line, like:

	very big line here with lots of words... 
	struct foo


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
> index 192a11bdc4ad..6dac6cb6290f 100644
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
> + * @v4l2_async_notifier_parse_fwnode_endpoints.

The markups here are wrong:

'@foo' is to be used for literal blocks. It won't produce
any cross-references. The right way to describe functions is to
write it as:
	foo()

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
> + * @v4l2_async_notifier_add_subdev or
> + * @v4l2_async_notifier_parse_fwnode_endpoints.
>   *
>   * There is no harm from calling v4l2_async_notifier_cleanup in other
>   * cases as long as its memory has been zeroed after it has been

Please send a followup patch.

Thanks,
Mauro
