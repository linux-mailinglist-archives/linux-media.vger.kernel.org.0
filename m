Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280F01B5659
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 09:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgDWHr3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 03:47:29 -0400
Received: from mga07.intel.com ([134.134.136.100]:64699 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726322AbgDWHr2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 03:47:28 -0400
IronPort-SDR: 4OUUcQHIIKsiOGwvPAP8zmx8ioWZllOaiYAW/wJPNjjCRI5CEWTu/g28Ya0NtD7sznzisg/B6l
 KWb0Z0TAV8LA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 00:47:27 -0700
IronPort-SDR: xebuX4Zqh2Fzs8VKrVMTXlJ1UMcv1KriaDNTvXrXAHOnRuQgYvCSjXW9IpM+PKHsaq1g09075h
 aWGqFgg+JwGw==
X-IronPort-AV: E=Sophos;i="5.73,306,1583222400"; 
   d="scan'208";a="255903604"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 00:47:16 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id B6BA22080B; Thu, 23 Apr 2020 10:47:13 +0300 (EEST)
Date:   Thu, 23 Apr 2020 10:47:13 +0300
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
Subject: Re: [PATCH 3/4] media: ov5647: Add support for non-continuous clock
 mode
Message-ID: <20200423074713.GK5381@paasikivi.fi.intel.com>
References: <cover.1586759968.git.roman.kovalivskyi@globallogic.com>
 <c3189c80ac27d67e814509d44a864f8164971efb.1586759968.git.roman.kovalivskyi@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3189c80ac27d67e814509d44a864f8164971efb.1586759968.git.roman.kovalivskyi@globallogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Roman,

On Mon, Apr 13, 2020 at 12:17:46PM +0300, Roman Kovalivskyi wrote:
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
>  drivers/media/i2c/ov5647.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index c39e3d20e3ef..8a1a515388e0 100644
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
> +	unsigned int			flags;
>  };
>  
>  static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
> @@ -269,9 +271,15 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
>  
>  static int ov5647_stream_on(struct v4l2_subdev *sd)
>  {
> +	struct ov5647 *ov5647 = to_state(sd);
> +	u8 val = MIPI_CTRL00_BUS_IDLE;
>  	int ret;
>  
> -	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_BUS_IDLE);
> +	if (ov5647->flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)
> +		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
> +		       MIPI_CTRL00_LINE_SYNC_ENABLE;
> +
> +	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -568,7 +576,7 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
>  	.open = ov5647_open,
>  };
>  
> -static int ov5647_parse_dt(struct device_node *np)
> +static int ov5647_parse_dt(struct device_node *np, struct ov5647 *sensor)
>  {
>  	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };

The bus type should be set to V4L2_MBUS_CSI2_DPHY here; 0 is just for
compatibility with the old heuristics.

>  	struct device_node *ep;
> @@ -581,6 +589,9 @@ static int ov5647_parse_dt(struct device_node *np)
>  
>  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
>  
> +	if (!ret)
> +		sensor->flags = bus_cfg.bus.mipi_csi2.flags;
> +
>  	of_node_put(ep);
>  	return ret;
>  }
> @@ -599,7 +610,7 @@ static int ov5647_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	if (IS_ENABLED(CONFIG_OF) && np) {
> -		ret = ov5647_parse_dt(np);
> +		ret = ov5647_parse_dt(np, sensor);
>  		if (ret) {
>  			dev_err(dev, "DT parsing error: %d\n", ret);
>  			return ret;

-- 
Kind regards,

Sakari Ailus
