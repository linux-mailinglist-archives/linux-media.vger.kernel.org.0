Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04D71D95B5
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 13:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgESL5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 07:57:14 -0400
Received: from mga14.intel.com ([192.55.52.115]:51524 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726949AbgESL5O (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 07:57:14 -0400
IronPort-SDR: NqNHNWuUlddp6v9r0jTsQr38jUf+IMK28lRvyvxyVW2eXuK4J6evY6sC1O8d37Kq8YHNXDGDNU
 KPsgC35sGfeQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 04:57:13 -0700
IronPort-SDR: jyV9rlo0jY05dtLVE84kx6AZSS4ovmpPrjaCPfmSvzq3tkFF4M5NtqoIwUxWRHU5QFlp7wjYoZ
 ZRhzK7on77fg==
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="253221285"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 04:57:09 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 6918E20CEF; Tue, 19 May 2020 14:57:07 +0300 (EEST)
Date:   Tue, 19 May 2020 14:57:07 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Luis Oliveira <lolivei@synopsys.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Jacopo Mondi <jacopo@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH v2 3/6] media: ov5647: Add support for non-continuous
 clock mode
Message-ID: <20200519115707.GK20066@paasikivi.fi.intel.com>
References: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
 <cd04fe908fc1a747949ee83044f4d2abc1885cee.1589850165.git.roman.kovalivskyi@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd04fe908fc1a747949ee83044f4d2abc1885cee.1589850165.git.roman.kovalivskyi@globallogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Roman,

On Tue, May 19, 2020 at 04:16:18AM +0300, Roman Kovalivskyi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> The driver was only supporting continuous clock mode
> although this was not stated anywhere.
> Non-continuous clock saves a small amount of power and
> on some SoCs is easier to interface with.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
> ---
>  drivers/media/i2c/ov5647.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 796cc80f8ee1..10f35c637f91 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -44,6 +44,7 @@
>  #define PWDN_ACTIVE_DELAY_MS	20
>  
>  #define MIPI_CTRL00_CLOCK_LANE_GATE		BIT(5)
> +#define MIPI_CTRL00_LINE_SYNC_ENABLE		BIT(4)
>  #define MIPI_CTRL00_BUS_IDLE			BIT(2)
>  #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
>  
> @@ -95,6 +96,7 @@ struct ov5647 {
>  	int				power_count;
>  	struct clk			*xclk;
>  	struct gpio_desc		*pwdn;
> +	bool				is_clock_contiguous;
>  };
>  
>  static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
> @@ -274,9 +276,15 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
>  
>  static int ov5647_stream_on(struct v4l2_subdev *sd)
>  {
> +	struct ov5647 *ov5647 = to_state(sd);
> +	u8 val = MIPI_CTRL00_BUS_IDLE;
>  	int ret;
>  
> -	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_BUS_IDLE);
> +	if (ov5647->is_clock_contiguous)
> +		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
> +		       MIPI_CTRL00_LINE_SYNC_ENABLE;
> +
> +	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -573,7 +581,7 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
>  	.open = ov5647_open,
>  };
>  
> -static int ov5647_parse_dt(struct device_node *np)
> +static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
>  {
>  	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
>  	struct device_node *ep;
> @@ -586,6 +594,17 @@ static int ov5647_parse_dt(struct device_node *np)
>  
>  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
>  

Extra newline.

> +	if (!ret) {
> +		of_node_put(ep);
> +		of_node_put(np);

Why to put np as well?

> +		return ret;

Please add a label at the end; it makes error handling easier.

> +	}
> +
> +	if (bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
> +		|| bus_cfg.bus_type == V4L2_MBUS_CSI2_CPHY)

I bet this device is D-PHY only.

> +		sensor->is_clock_contiguous = bus_cfg.bus.mipi_csi2.flags
> +			& V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;

Now that you're making use of bus specific parameters, please set the bus
type first before calling v4l2_fwnode_endpoint_parse().

> +
>  	of_node_put(ep);
>  	return ret;
>  }
> @@ -604,7 +623,7 @@ static int ov5647_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	if (IS_ENABLED(CONFIG_OF) && np) {
> -		ret = ov5647_parse_dt(np);
> +		ret = ov5647_parse_dt(sensor, np);
>  		if (ret) {
>  			dev_err(dev, "DT parsing error: %d\n", ret);
>  			return ret;

-- 
Kind regards,

Sakari Ailus
