Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6673D74EC
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 14:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236419AbhG0MTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 08:19:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60500 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbhG0MTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 08:19:49 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45472EE;
        Tue, 27 Jul 2021 14:19:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627388387;
        bh=GcgLKE0jyKA0yL/GuKnEf0DJNEByaXUPWkoeZ0e8uqg=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=HpNkk8aO/o2nRwiegdlNxYmwdVoEbSnbZSSzh749bAEfZ19nlSuW0uEyuN/K2lOFB
         h7gJ7ezaFqhtwKy8g326uiSxqwY1Wr+DVwXZnmFZIzXx3gkFMT//ISTMv2aNBT7PTR
         jJs4lo435mA9hQUpn4yXpfT/Z+GP7dBwXExSgB1Y=
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20210624084046.13136-1-sakari.ailus@linux.intel.com>
 <20210624084046.13136-3-sakari.ailus@linux.intel.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 2/6] Documentation: media: Fix v4l2-async kerneldoc
 syntax
Message-ID: <8a3d2fda-4971-ae69-4bea-4bc340bc0e9c@ideasonboard.com>
Date:   Tue, 27 Jul 2021 13:19:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624084046.13136-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 24/06/2021 09:40, Sakari Ailus wrote:
> Fix kerneldoc syntax in v4l2-async. The references were not produced
> correctly.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/driver-api/media/tx-rx.rst      |  8 ++---
>  .../media/v4l/ext-ctrls-image-process.rst     |  2 ++
>  include/media/v4l2-async.h                    | 30 +++++++++----------
>  3 files changed, 21 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index 4c8584e7b6f2..12d492d25df2 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -5,7 +5,7 @@
>  Pixel data transmitter and receiver drivers
>  ===========================================
>  
> -V4L2 supports various devices that transmit and receiver pixel data. Examples of
> +V4L2 supports various devices that transmit and receive pixel data. Examples of
>  these devices include a camera sensor, a TV tuner and a parallel or a CSI-2
>  receiver in an SoC.
>  
> @@ -95,9 +95,9 @@ LP-11 and LP-111 modes
>  
>  The transmitter drivers must, if possible, configure the CSI-2 transmitter to
>  *LP-11 or LP-111 mode* whenever the transmitter is powered on but not active,
> -and maintain *LP-11 or LP-111 mode* until stream on. Only at stream on should
> -the transmitter activate the clock on the clock lane and transition to *HS
> -mode*.
> +and maintain *LP-11 or LP-111 mode* until stream on. Only at stream on time
> +should the transmitter activate the clock on the clock lane and transition to
> +*HS mode*.
>  
>  Some transmitters do this automatically but some have to be explicitly
>  programmed to do so, and some are unable to do so altogether due to


Should those changes have been in the previous patch ?
(The changes above look OK though).


> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 37dad2f4df8c..ed65fb594cc8 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -37,6 +37,8 @@ Image Process Control IDs
>      by selecting the desired horizontal and vertical blanking. The unit
>      of this control is Hz.
>  
> +.. _v4l2-cid-pixel-rate:
> +
>  ``V4L2_CID_PIXEL_RATE (64-bit integer)``
>      Pixel rate in the source pads of the subdev. This control is
>      read-only and its unit is pixels / second.
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 5b275a845c20..fa4901162663 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -129,11 +129,11 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
>   *
>   * This function initializes the notifier @asd_list. It must be called
>   * before adding a subdevice to a notifier, using one of:
> - * @v4l2_async_notifier_add_fwnode_remote_subdev,
> - * @v4l2_async_notifier_add_fwnode_subdev,
> - * @v4l2_async_notifier_add_i2c_subdev,
> - * @__v4l2_async_notifier_add_subdev or
> - * @v4l2_async_notifier_parse_fwnode_endpoints.
> + * v4l2_async_notifier_add_fwnode_remote_subdev(),
> + * v4l2_async_notifier_add_fwnode_subdev(),
> + * v4l2_async_notifier_add_i2c_subdev(),
> + * __v4l2_async_notifier_add_subdev() or
> + * v4l2_async_notifier_parse_fwnode_endpoints().
>   */
>  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
>  
> @@ -145,9 +145,9 @@ void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
>   * @asd: pointer to &struct v4l2_async_subdev
>   *
>   * \warning: Drivers should avoid using this function and instead use one of:
> - * @v4l2_async_notifier_add_fwnode_subdev,
> - * @v4l2_async_notifier_add_fwnode_remote_subdev or
> - * @v4l2_async_notifier_add_i2c_subdev.
> + * v4l2_async_notifier_add_fwnode_subdev(),
> + * v4l2_async_notifier_add_fwnode_remote_subdev() or
> + * v4l2_async_notifier_add_i2c_subdev().
>   *
>   * Call this function before registering a notifier to link the provided @asd to
>   * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
> @@ -200,7 +200,7 @@ __v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif
>   * function also gets a reference of the fwnode which is released later at
>   * notifier cleanup time.
>   *
> - * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
> + * This is just like v4l2_async_notifier_add_fwnode_subdev(), but with the
>   * exception that the fwnode refers to a local endpoint, not the remote one.
>   */
>  #define v4l2_async_notifier_add_fwnode_remote_subdev(notifier, ep, type) \
> @@ -265,13 +265,13 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
>   * sub-devices allocated for the purposes of the notifier but not the notifier
>   * itself. The user is responsible for calling this function to clean up the
>   * notifier after calling
> - * @v4l2_async_notifier_add_fwnode_remote_subdev,
> - * @v4l2_async_notifier_add_fwnode_subdev,
> - * @v4l2_async_notifier_add_i2c_subdev,
> - * @__v4l2_async_notifier_add_subdev or
> - * @v4l2_async_notifier_parse_fwnode_endpoints.
> + * v4l2_async_notifier_add_fwnode_remote_subdev(),
> + * v4l2_async_notifier_add_fwnode_subdev(),
> + * v4l2_async_notifier_add_i2c_subdev(),
> + * __v4l2_async_notifier_add_subdev() or
> + * v4l2_async_notifier_parse_fwnode_endpoints().
>   *
> - * There is no harm from calling v4l2_async_notifier_cleanup in other
> + * There is no harm from calling v4l2_async_notifier_cleanup() in other
>   * cases as long as its memory has been zeroed after it has been
>   * allocated.
>   */
> 

But these all look fine.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
