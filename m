Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A5E400318
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 18:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241622AbhICQSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 12:18:49 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53394 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhICQSp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 12:18:45 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B064A1C0B87; Fri,  3 Sep 2021 18:17:43 +0200 (CEST)
Date:   Fri, 3 Sep 2021 18:17:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, phone-devel@vger.kernel.org,
        robh@kernel.org, sakari.ailus@iki.fi, shawnx.tu@intel.com
Subject: Re: [PATCH v8 3/4] media: i2c: add driver for the SK Hynix Hi-846 8M
 pixel camera
Message-ID: <20210903161742.GD2209@bug>
References: <20210831134344.1673318-1-martin.kepplinger@puri.sm>
 <20210831134344.1673318-4-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831134344.1673318-4-martin.kepplinger@puri.sm>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

> The SK Hynix Hi-846 is a 1/4" 8M Pixel CMOS Image Sensor. It supports
> usual features like I2C control, CSI-2 for frame data, digital/analog
> gain control or test patterns.
> 
> This driver supports the 640x480, 1280x720 and 1632x1224 resolution
> modes. It supports runtime PM in order not to draw any unnecessary power.
> 
> The part is also called YACG4D0C9SHC and a datasheet can be found at
> https://product.skhynix.com/products/cis/cis.go
> 
> The large sets of partly undocumented register values are for example
> found when searching for the hi846_mipi_raw_Sensor.c Android driver.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

Some nitpicks below..

> +config VIDEO_HI846
> +	tristate "Hynix Hi-846 sensor support"
> +	depends on I2C && VIDEO_V4L2
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	help
> +	  This is a Video4Linux2 sensor driver for the Hynix
> +	  Hi-846 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called hi846.

hi846.ko?


> +/* Frame length lines / Vertical timings */

vertical

> +/*
> + * Long exposure time. Actually, exposure is a 20 bit value that
> + * includes the lower 4 bits of 0x0073 too. only 16 bit are used
> + * right now
> + */

Only 16 bits
now.

> +struct hi846_mode {
> +	/* Frame width in pixels */
> +	u32 width;
> +
> +	/* Frame height in pixels */
> +	u32 height;
> +
> +	/* Horizontal timing size */
> +	u32 llp;
> +
> +	/* Link frequency needed for this resolution */
> +	u8 link_freq_index;
> +
> +	u16 fps;
> +
> +	/* vertical timining size */

Vertical timing

> +	/* position inside of the 3264x2448 pixel array */

Position

> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&hi846->sd);
> +	struct i2c_msg msgs[2];
> +	u8 addr_buf[2];
> +	u8 data_buf[1] = {0};
> +	int ret;
> +
> +	put_unaligned_be16(reg, addr_buf);
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = 0;
> +	msgs[0].len = sizeof(addr_buf);
> +	msgs[0].buf = addr_buf;
> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = 1;
> +	msgs[1].buf = &data_buf[0];

= data_buf; To simplify things and for consistency with above.

> +static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&hi846->sd);
> +	u8 buf[6];
> +	int ret;
> +
> +	if (*err < 0)
> +		return;
> +
> +	put_unaligned_be16(reg, buf);
> +	put_unaligned_be32(val << 8 * 2, buf + 2);

Is that obfuscated way of saying put_unaligned_be16(val, buf+2); buf[3] = 0; buf[4] = 0; ?

> +static int hi846_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct hi846 *hi846 = to_hi846(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	int ret = 0;
> +
> +	if (hi846->streaming == enable)
> +		return 0;
> +
> +	mutex_lock(&hi846->mutex);
> +
> +	if (enable) {
> +		ret = pm_runtime_get_sync(&client->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);
> +			goto out;
> +		}
> +
> +		ret = hi846_start_streaming(hi846);
> +		if (ret) {
> +			enable = 0;
> +			hi846_stop_streaming(hi846);
> +			pm_runtime_put(&client->dev);
> +		}
> +	} else {
> +		hi846_stop_streaming(hi846);
> +		pm_runtime_put(&client->dev);
> +	}

enable = 0 is dead code.

Could this be written as

        }
        if (!enable || ret) {
                   stop_streaming()
                   put()
        }

But I guess that start_streaming should really do all the cleanup itself if it fails.


> +	ret = hi846_identify_module(hi846);
> +	if (ret)
> +		goto probe_error_power_off;

Does this go to right place?

> +	hi846->cur_mode = &supported_modes[0];
> +
> +	ret = hi846_init_controls(hi846);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to init controls: %d", ret);
> +		return ret;
> +	}

This should go to cleanup code somewhere.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
