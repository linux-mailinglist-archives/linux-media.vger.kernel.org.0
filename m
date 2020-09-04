Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D371B25D6B3
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 12:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgIDKpI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 06:45:08 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:56589 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgIDKpE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 06:45:04 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 636DA1C000C;
        Fri,  4 Sep 2020 10:44:55 +0000 (UTC)
Date:   Fri, 4 Sep 2020 12:48:42 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 2/3] media: i2c: ov5640: Add support for BT656 mode
Message-ID: <20200904104842.hz6n6egjyqgarvlb@uno.localdomain>
References: <20200813171337.5540-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200813171337.5540-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200813171337.5540-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar

On Thu, Aug 13, 2020 at 06:13:36PM +0100, Lad Prabhakar wrote:
> Enable support for BT656 mode.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Looks good to me
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/i2c/ov5640.c | 46 ++++++++++++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index e36bc08bc17f..160d2857352a 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -84,6 +84,7 @@
>  #define OV5640_REG_VFIFO_HSIZE		0x4602
>  #define OV5640_REG_VFIFO_VSIZE		0x4604
>  #define OV5640_REG_JPG_MODE_SELECT	0x4713
> +#define OV5640_REG_CCIR656_CTRL00	0x4730
>  #define OV5640_REG_POLARITY_CTRL00	0x4740
>  #define OV5640_REG_MIPI_CTRL00		0x4800
>  #define OV5640_REG_DEBUG_MODE		0x4814
> @@ -1215,6 +1216,20 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
>  			      BIT(1), on ? 0 : BIT(1));
>  }
>
> +static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> +{
> +	int ret;
> +
> +	ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> +			       on ? 0x1 : 0x00);
> +	if (ret)
> +		return ret;
> +
> +	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> +				OV5640_REG_SYS_CTRL0_SW_PWUP :
> +				OV5640_REG_SYS_CTRL0_SW_PWDN);
> +}
> +
>  static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>  {
>  	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> @@ -2022,18 +2037,21 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>  	 *		datasheet and hardware, 0 is active high
>  	 *		and 1 is active low...)
>  	 */
> -	if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> -		pclk_pol = 1;
> -	if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> -		hsync_pol = 1;
> -	if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> -		vsync_pol = 1;
> +	if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL) {
> +		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> +			pclk_pol = 1;
> +		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> +			hsync_pol = 1;
> +		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> +			vsync_pol = 1;
> +
> +		ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
> +				       (pclk_pol << 5) | (hsync_pol << 1) |
> +				       vsync_pol);
>
> -	ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
> -			       (pclk_pol << 5) | (hsync_pol << 1) | vsync_pol);
> -
> -	if (ret)
> -		return ret;
> +		if (ret)
> +			return ret;
> +	}
>
>  	/*
>  	 * powerdown MIPI TX/RX PHY & disable MIPI
> @@ -2057,7 +2075,9 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>  	 * - 4:		PCLK output enable
>  	 * - [3:0]:	D[9:6] output enable
>  	 */
> -	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
> +	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
> +			       sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
> +			       0x7f : 0x1f);
>  	if (ret)
>  		return ret;
>
> @@ -2911,6 +2931,8 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>
>  		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
>  			ret = ov5640_set_stream_mipi(sensor, enable);
> +		else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
> +			ret = ov5640_set_stream_bt656(sensor, enable);
>  		else
>  			ret = ov5640_set_stream_dvp(sensor, enable);
>
> --
> 2.17.1
>
