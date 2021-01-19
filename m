Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B212FC0CD
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730316AbhASUTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbhASSzY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 13:55:24 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B1EC061573
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 10:54:42 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id CC70E1F45461
Subject: Re: [PATCH v2 13/14] media: v4l2-async: Discourage use of
 v4l2_async_notifier_add_subdev
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
 <20210118015258.3993-14-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <944e3f67-7e39-8b42-81d8-dd88c3332e49@collabora.com>
Date:   Tue, 19 Jan 2021 15:54:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118015258.3993-14-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/17/21 10:52 PM, Ezequiel Garcia wrote:
> Most -if not all- use-cases are expected to be covered by one of:
> v4l2_async_notifier_add_fwnode_subdev,
> v4l2_async_notifier_add_fwnode_remote_subdev or
> v4l2_async_notifier_add_i2c_subdev.
> 
> We'd like to discourage drivers from using v4l2_async_notifier_add_subdev,
> so rename it as __v4l2_async_notifier_add_subdev. This is
> typically a good hint for drivers to avoid using the function.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/media/v4l2-core/v4l2-async.c  | 8 ++++----
>  drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
>  include/media/v4l2-async.h            | 9 +++++++--
>  3 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 810fa765c0e6..c3bcad01a7b7 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -601,7 +601,7 @@ void v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_async_notifier_cleanup);
>  
> -int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> +int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_subdev *asd)
>  {
>  	int ret;
> @@ -618,7 +618,7 @@ int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
>  	mutex_unlock(&list_lock);
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
> +EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_subdev);
>  
>  struct v4l2_async_subdev *
>  v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> @@ -635,7 +635,7 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
>  	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
>  	asd->match.fwnode = fwnode_handle_get(fwnode);
>  
> -	ret = v4l2_async_notifier_add_subdev(notifier, asd);
> +	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
>  	if (ret) {
>  		fwnode_handle_put(fwnode);
>  		kfree(asd);
> @@ -685,7 +685,7 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
>  	asd->match.i2c.adapter_id = adapter_id;
>  	asd->match.i2c.address = address;
>  
> -	ret = v4l2_async_notifier_add_subdev(notifier, asd);
> +	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
>  	if (ret) {
>  		kfree(asd);
>  		return ERR_PTR(ret);
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 5353e37eb950..919fde20032e 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -833,7 +833,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
>  	if (ret < 0)
>  		goto out_err;
>  
> -	ret = v4l2_async_notifier_add_subdev(notifier, asd);
> +	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
>  	if (ret < 0) {
>  		/* not an error if asd already exists */
>  		if (ret == -EEXIST)
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 7b45427aafb5..d2df7cf407ea 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -129,17 +129,22 @@ struct v4l2_async_notifier {
>  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
>  
>  /**
> - * v4l2_async_notifier_add_subdev - Add an async subdev to the
> + * __v4l2_async_notifier_add_subdev - Add an async subdev to the
>   *				notifier's master asd list.
>   *
>   * @notifier: pointer to &struct v4l2_async_notifier
>   * @asd: pointer to &struct v4l2_async_subdev
>   *
> + * \warning: Drivers should avoid using this function and instead use one of:
> + * @v4l2_async_notifier_add_fwnode_subdev,
> + * @v4l2_async_notifier_add_fwnode_remote_subdev or
> + * @v4l2_async_notifier_add_i2c_subdev.
> + *
>   * Call this function before registering a notifier to link the provided @asd to
>   * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
>   * it will be freed by the framework when the notifier is destroyed.
>   */
> -int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> +int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_subdev *asd);
>  
>  /**
> 
