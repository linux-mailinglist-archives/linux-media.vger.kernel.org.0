Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694BE288BCE
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 16:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388727AbgJIOsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 10:48:08 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58923 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732056AbgJIOsI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 10:48:08 -0400
Received: from bootlin.com (atoulouse-258-1-33-168.w90-55.abo.wanadoo.fr [90.55.104.168])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 33E08240014;
        Fri,  9 Oct 2020 14:47:59 +0000 (UTC)
Date:   Fri, 9 Oct 2020 16:47:57 +0200
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 3/3] media: i2c: Introduce a driver for the Techwell
 TW9900 decoder
Message-ID: <20201009164757.33802bf2@bootlin.com>
In-Reply-To: <57c93f63-2450-aa43-7616-e3a763c95e36@xs4all.nl>
References: <20200918142422.1086555-1-maxime.chevallier@bootlin.com>
        <20200918142422.1086555-4-maxime.chevallier@bootlin.com>
        <57c93f63-2450-aa43-7616-e3a763c95e36@xs4all.nl>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, 25 Sep 2020 14:52:25 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

>Hi Maxime,
>
>Some comments below, this driver needs to be changed:

Thanks for the review !

>On 18/09/2020 16:24, Maxime Chevallier wrote:
>> The Techwell video decoder supports PAL, NTSC and SECAM input formats,
>> and outputs a BT.656 signal.
>> 
>> This commit adds support for this device, based on an implementation
>> made by Rockchip. This implemention adds basic support for NTSC and PAL,
>> and some basic brightness and contrast controls.
>> 
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

 [ ... ]

>> +static const struct v4l2_subdev_ops tw9900_subdev_ops = {
>> +	.core	= &tw9900_core_ops,
>> +	.video	= &tw9900_video_ops,
>> +	.pad	= &tw9900_pad_ops,
>> +	.sensor = &tw9900_sensor_ops,
>> +};  
>
>This is wrong. This is not a sensor, so you don't set the format, instead
>you set the TV standard (s_std).
>
>drivers/media/i2c/tw9910.c is a fairly OK template to use. The tw9910 supports
>a simple scaler as well, but I don't know if the tw9900 has the same feature.
>If not, then the format resolution is fixed based on the current selected
>TV standard.
>
>There is definitely no need for g_skip_top_lines: 1) it's a sensor-only op,
>and 2) that function always returns 0, so why keep it?

Thanks for the clarification. Indeed the TW9900 is simpler and doesn't
have a scaler. I'll stick to the s_std / g_std ops then.

I'll also change the denomination from "sensor" to "decoder", you're
right.

>> +
>> +static const struct v4l2_ctrl_ops tw9900_ctrl_ops = {
>> +	.s_ctrl = tw9900_s_ctrl,
>> +};
>> +
>> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>> +static const struct v4l2_subdev_internal_ops tw9900_internal_ops = {
>> +	.open = tw9900_open,
>> +};
>> +#endif
>> +
>> +static int tw9900_check_sensor_id(struct tw9900 *tw9900,  
>
>*Not* a sensor :-)
>
>> +				  struct i2c_client *client)
>> +{
>> +	struct device *dev = &tw9900->client->dev;
>> +	u8 id;
>> +
>> +	id = tw9900_read_reg(client, TW9900_CHIP_ID);
>> +
>> +	if (id != TW9900_CHIP_ID) {
>> +		dev_err(dev, "Wrong camera sensor id(%04x)\n", id);
>> +		return -EINVAL;
>> +	}
>> +
>> +	dev_info(dev, "Detected TW9900 (%04x) sensor\n", TW9900_CHIP_ID);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tw9900_configure_regulators(struct tw9900 *tw9900)
>> +{
>> +	u32 i;
>> +
>> +	for (i = 0; i < TW9900_NUM_SUPPLIES; i++)
>> +		tw9900->supplies[i].supply = tw9900_supply_names[i];
>> +
>> +	return devm_regulator_bulk_get(&tw9900->client->dev,
>> +				       TW9900_NUM_SUPPLIES,
>> +				       tw9900->supplies);
>> +}
>> +
>> +static int tw9900_probe(struct i2c_client *client,
>> +			const struct i2c_device_id *id)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct v4l2_ctrl_handler *hdl;
>> +	struct tw9900 *tw9900;
>> +	int ret;
>> +
>> +	tw9900 = devm_kzalloc(dev, sizeof(*tw9900), GFP_KERNEL);
>> +	if (!tw9900)
>> +		return -ENOMEM;
>> +
>> +	tw9900->client = client;
>> +	tw9900->cur_mode = &supported_modes[0];
>> +
>> +	tw9900->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>> +	if (IS_ERR(tw9900->reset_gpio))
>> +		tw9900->reset_gpio = NULL;
>> +
>> +	ret = tw9900_configure_regulators(tw9900);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to get power regulators\n");
>> +		return ret;
>> +	}
>> +
>> +	v4l2_i2c_subdev_init(&tw9900->subdev, client, &tw9900_subdev_ops);
>> +	tw9900->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
>> +
>> +	hdl = &tw9900->hdl;
>> +
>> +	v4l2_ctrl_handler_init(hdl, 2);
>> +
>> +	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_BRIGHTNESS,
>> +			  -128, 127, 1, 0);
>> +	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_CONTRAST,
>> +			  0, 255, 1, 0x60);
>> +
>> +	tw9900->subdev.ctrl_handler = hdl;
>> +	if (hdl->error) {
>> +		int err = hdl->error;
>> +
>> +		v4l2_ctrl_handler_free(hdl);
>> +		return err;
>> +	}
>> +
>> +	ret = __tw9900_power_on(tw9900);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = tw9900_check_sensor_id(tw9900, client);
>> +	if (ret)
>> +		goto err_power_off;
>> +
>> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>> +	tw9900->subdev.internal_ops = &tw9900_internal_ops;
>> +	tw9900->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +#endif
>> +#if defined(CONFIG_MEDIA_CONTROLLER)
>> +	tw9900->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	tw9900->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;  
>
>Set to MEDIA_ENT_F_ATV_DECODER.

Will do ! Thanks agains,

Maxime



-- 
Maxime Chevallier, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
