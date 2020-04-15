Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99871A9F45
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 14:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441266AbgDOMIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 08:08:24 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:41649 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441259AbgDOMIU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 08:08:20 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4300420009;
        Wed, 15 Apr 2020 12:08:10 +0000 (UTC)
Date:   Wed, 15 Apr 2020 14:11:14 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Luis Oliveira <lolivei@synopsys.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH 1/4] media: ov5647: Add set_fmt and get_fmt calls.
Message-ID: <20200415121114.2bfe6lqjy57p2xlb@uno.localdomain>
References: <cover.1586759968.git.roman.kovalivskyi@globallogic.com>
 <8a4c0d157d26251c9916b32866e6a4a91c023ef9.1586759968.git.roman.kovalivskyi@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a4c0d157d26251c9916b32866e6a4a91c023ef9.1586759968.git.roman.kovalivskyi@globallogic.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Roman,

On Mon, Apr 13, 2020 at 12:17:44PM +0300, Roman Kovalivskyi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>
> There's no way to query the subdevice for the supported
> resolutions. Add set_fmt and get_fmt implementations. Since there's
> only one format supported set_fmt does nothing and get returns single
> format.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>

Looks good to me
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/i2c/ov5647.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index e7d2e5b4ad4b..3e587eb0a30e 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -463,8 +463,30 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>
> +static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_pad_config *cfg,
> +			      struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt = &format->format;
> +
> +	if (format->pad != 0)
> +		return -EINVAL;
> +
> +	/* Only one format is supported, so return that */
> +	memset(fmt, 0, sizeof(*fmt));
> +	fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	fmt->field = V4L2_FIELD_NONE;
> +	fmt->width = 640;
> +	fmt->height = 480;
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
>  	.enum_mbus_code = ov5647_enum_mbus_code,
> +	.set_fmt =	  ov5647_set_get_fmt,
> +	.get_fmt =	  ov5647_set_get_fmt,
>  };
>
>  static const struct v4l2_subdev_ops ov5647_subdev_ops = {
> --
> 2.17.1
>
