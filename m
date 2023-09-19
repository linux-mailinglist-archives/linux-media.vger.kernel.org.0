Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 132067A5BE2
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 10:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbjISIEf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 04:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjISIEe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 04:04:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76746123
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 01:04:28 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF8ACB53;
        Tue, 19 Sep 2023 10:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695110571;
        bh=x9gkC3+NwisfK+odjbXVHu3BTX7PQWjdnHEcJApXi2w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=qfrXV1dXVXybegNVqhU/zHIZ0yVhxdlM7jqa3WWZzu3bxCFTUYng/uRYBaBQ1S8sb
         +w95GQUBSregHjWiNjhyWSDQ0ShpiJxuF1Y7W1nDQNq/7zRezkWw23ba8a8c6CwMNz
         6Rrxyt75XRrQP9HftGTkvxtAFwlo2NmFRpAJjAAI=
Message-ID: <35f7023f-5958-9263-ede0-431a16d20303@ideasonboard.com>
Date:   Tue, 19 Sep 2023 11:04:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 10/12] media: v4l: subdev: Clear frame descriptor
 before get_frame_desc
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-11-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230918125138.90002-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/09/2023 15:51, Sakari Ailus wrote:
> Clear frame descriptor before calling transmitter's get_frame_desc() op.
> Also remove the corresponding memset() calls from drivers.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/i2c/ds90ub913.c              | 2 --
>   drivers/media/i2c/ds90ub953.c              | 2 --
>   drivers/media/i2c/ds90ub960.c              | 2 --
>   drivers/media/platform/nxp/imx-mipi-csis.c | 2 --
>   drivers/media/v4l2-core/v4l2-subdev.c      | 9 +++++++++
>   5 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> index 4bfa3b3cf619..8e9ebed09f64 100644
> --- a/drivers/media/i2c/ds90ub913.c
> +++ b/drivers/media/i2c/ds90ub913.c
> @@ -362,8 +362,6 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>   	if (ret)
>   		return ret;
>   
> -	memset(fd, 0, sizeof(*fd));
> -
>   	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
>   
>   	state = v4l2_subdev_lock_and_get_active_state(sd);
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index dc394e22a42c..644022312833 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -499,8 +499,6 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>   	if (ret)
>   		return ret;
>   
> -	memset(fd, 0, sizeof(*fd));
> -
>   	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>   
>   	state = v4l2_subdev_lock_and_get_active_state(sd);
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 8ba5750f5a23..b8f3e5ca03ef 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -2786,8 +2786,6 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>   	if (!ub960_pad_is_source(priv, pad))
>   		return -EINVAL;
>   
> -	memset(fd, 0, sizeof(*fd));
> -
>   	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>   
>   	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 16f19a640130..aac9cffe503c 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1114,8 +1114,6 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>   	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
>   	fd->num_entries = 1;
>   
> -	memset(entry, 0, sizeof(*entry));
> -
>   	entry->flags = 0;
>   	entry->pixelcode = csis_fmt->code;
>   	entry->bus.csi2.vc = 0;
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index b92348ad61f6..7b087be3ff4f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -306,6 +306,14 @@ static int call_set_selection(struct v4l2_subdev *sd,
>   	       sd->ops->pad->set_selection(sd, state, sel);
>   }
>   
> +static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_frame_desc *fd)
> +{
> +	memset(fd, 0, sizeof(*fd));
> +
> +	return sd->ops->pad->get_frame_desc(sd, pad, fd);
> +}
> +
>   static inline int check_edid(struct v4l2_subdev *sd,
>   			     struct v4l2_subdev_edid *edid)
>   {
> @@ -431,6 +439,7 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
>   	.set_edid		= call_set_edid,
>   	.dv_timings_cap		= call_dv_timings_cap,
>   	.enum_dv_timings	= call_enum_dv_timings,
> +	.get_frame_desc		= call_get_frame_desc,
>   	.get_mbus_config	= call_get_mbus_config,
>   };
>   

