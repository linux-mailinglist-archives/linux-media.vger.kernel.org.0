Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C170304850
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388764AbhAZFqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:46:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbhAYQvo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 11:51:44 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B7DC06174A
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 08:50:58 -0800 (PST)
Received: from [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d] (unknown [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9115F1F45362;
        Mon, 25 Jan 2021 16:50:52 +0000 (GMT)
Subject: Re: [PATCH v3 11/14] media: v4l2-async: Fix incorrect comment
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
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
 <20210125132230.6600-26-sakari.ailus@linux.intel.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <fab49b26-1297-fb0f-4d02-103e8faedffd@collabora.com>
Date:   Mon, 25 Jan 2021 13:50:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125132230.6600-26-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On 1/25/21 10:22 AM, Sakari Ailus wrote:
> From: Ezequiel Garcia <ezequiel@collabora.com>
> 
> The v4l2_async_notifier_cleanup() documentation mentions
> v4l2_fwnode_reference_parse_sensor_common, which was actually
> introduced as v4l2_async_notifier_parse_fwnode_sensor_common(),
> in commit 7a9ec808ad46 ("media: v4l: fwnode: Add convenience function for
> parsing common external refs").
> 
> The function drivers do use is
> v4l2_async_register_subdev_sensor_common().
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-async.h | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 0ddc06e36c08..f2cac0931372 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -174,9 +174,11 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
>   *
>   * @notif: pointer to &struct v4l2_async_notifier
>   * @endpoint: local endpoint pointing to the remote sub-device to be matched
> - * @asd: Async sub-device struct allocated by the caller. The &struct
> - *	 v4l2_async_subdev shall be the first member of the driver's async
> - *	 sub-device struct, i.e. both begin at the same memory address.
> + * @asd_struct_size: size of the driver's async sub-device struct, including
> + *		     sizeof(struct v4l2_async_subdev). The &struct
> + *		     v4l2_async_subdev shall be the first member of
> + *		     the driver's async sub-device struct, i.e. both
> + *		     begin at the same memory address.
>   *
>   * Gets the remote endpoint of a given local endpoint, set it up for fwnode
>   * matching and adds the async sub-device to the notifier's @asd_list. The
> @@ -184,13 +186,12 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
>   * notifier cleanup time.
>   *
>   * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
> - * exception that the fwnode refers to a local endpoint, not the remote one, and
> - * the function relies on the caller to allocate the async sub-device struct.
> + * exception that the fwnode refers to a local endpoint, not the remote one.
>   */
> -int
> +struct v4l2_async_subdev *
>  v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
>  					     struct fwnode_handle *endpoint,
> -					     struct v4l2_async_subdev *asd);
> +					     unsigned int asd_struct_size);

This change should go with patch 1/14.

Regards,
Helen

>  
>  /**
>   * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
> @@ -249,7 +250,7 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
>   * notifier after calling
>   * @v4l2_async_notifier_add_subdev,
>   * @v4l2_async_notifier_parse_fwnode_endpoints or
> - * @v4l2_fwnode_reference_parse_sensor_common.
> + * @v4l2_async_register_subdev_sensor_common.
>   *
>   * There is no harm from calling v4l2_async_notifier_cleanup in other
>   * cases as long as its memory has been zeroed after it has been
> 
