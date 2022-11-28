Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B48663B0C9
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 19:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbiK1SKn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 13:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234062AbiK1SKZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 13:10:25 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E192B5D688
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 09:53:43 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 63810240007;
        Mon, 28 Nov 2022 17:53:36 +0000 (UTC)
Date:   Mon, 28 Nov 2022 18:53:35 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Nicholas Roth <nicholas@rothemail.net>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH v2] media: i2c: ov8858 Add driver for ov8858
Message-ID: <20221128175335.jigoufquhafshexg@uno.localdomain>
References: <20221106171129.166892-1-nicholas@rothemail.net>
 <20221106171129.166892-2-nicholas@rothemail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221106171129.166892-2-nicholas@rothemail.net>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicholas,
   a few notes on testing the analogue gain response on your driver

On Sun, Nov 06, 2022 at 11:11:30AM -0600, Nicholas Roth wrote:
[snip]

> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret = ov8858_write_reg(ov8858->client,
> +					OV8858_REG_GAIN_H,
> +					OV8858_REG_VALUE_08BIT,
> +					(ctrl->val >> OV8858_GAIN_H_SHIFT) &
> +					OV8858_GAIN_H_MASK);
> +		ret |= ov8858_write_reg(ov8858->client,
> +					OV8858_REG_GAIN_L,
> +					OV8858_REG_VALUE_08BIT,
> +					ctrl->val & OV8858_GAIN_L_MASK);
> +		break;

I've started this investigation because I have very dark images when
running from this sensor.

I'm running libcamera with the camera sensor helper that you have
submitted, which implements a linear gain model with (m0=1,c1=16)
which seems to match the registers documentation when running in "real
mode". Quoting:

0x3503[2]=0, gain[7:0] is real gain format, where low 4 bits are
fraction bits, for example, 0x10 is 1x gain, 0x28 is 2.5x gain

Unfortunately I don't get usable images with this configuration.
My testing procedure has been

1) Disconnect DelayedControls from RkISP1 pipeline handler to avoid it
   writing controls to the sensor

--- a/src/libcamera/pipeline/rkisp1/rkisp1.cpp
+++ b/src/libcamera/pipeline/rkisp1/rkisp1.cpp
@@ -393,9 +393,9 @@ void RkISP1CameraData::paramFilled(unsigned int frame)
 }

 void RkISP1CameraData::setSensorControls([[maybe_unused]] unsigned int frame,
-                                        const ControlList &sensorControls)
+                                        [[maybe_unused]] const ControlList &sensorControls)
 {
-       delayedCtrls_->push(sensorControls);
+       //delayedCtrls_->push(sensorControls);
 }

2) Disable Agc and Awb algorithm by removing the entries in
   /usr/share/libcamera/rkisp1/uncalibrated.yaml

3) Run a preview window and observe how it changes by issuing controls
   with v4l2-ctl:

   1) set a reasonable exposure value
      $ v4l2-ctl -c 0x00980911=2047 -d /dev/v4l-subdev4

   2) pump up digital gain a bit
     $ v4l2-ctl -c 0x009f0905=800 -d /dev/v4l-subdev4

   3) Start sending analogue gain controls to see how the image
      response changes

     $ v4l2-ctl -c 0x009e0903=128 -d /dev/v4l-subdev4
     $ v4l2-ctl -c 0x009e0903=512 -d /dev/v4l-subdev4
     $ v4l2-ctl -c 0x009e0903=1024 -d /dev/v4l-subdev4
     $ v4l2-ctl -c 0x009e0903=2048 -d /dev/v4l-subdev4

My observations are that
- The highest gain I can apply is obtained with 8191, which
  corresponds to 0x1fff which matches to the register description
  of:

  0x3508 LONG_GAIN_HIGH = gain[12:6]
  0x3509 LONG_GAIN_LOW = gain[7:0]

  This seems to indicate the gain register is actually 13-bits long
  and not

- The gain is not linear:

  127 is more brilliant than 128
  2047 is more brilliant than 2048

I'm afraid the description we get for the register is not accurate and
doesn't tell exactly how the gain value is assembled in the 0x3508 and
0x3509 register ?

Are you experiencing anything similar ?

Thanks
  j

> +	case V4L2_CID_DIGITAL_GAIN:
> +		ret = ov8858_write_reg(ov8858->client,
> +					OV8858_REG_DGAIN_H,
> +					OV8858_REG_VALUE_08BIT,
> +					(ctrl->val >> OV8858_DGAIN_H_SHIFT) &
> +					OV8858_DGAIN_H_MASK);
> +		ret |= ov8858_write_reg(ov8858->client,
> +					OV8858_REG_DGAIN_L,
> +					OV8858_REG_VALUE_08BIT,
> +					ctrl->val & OV8858_DGAIN_L_MASK);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		ret = ov8858_write_reg(ov8858->client,
> +					OV8858_REG_VTS,
> +					OV8858_REG_VALUE_16BIT,
> +					ctrl->val + ov8858->cur_mode->height);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov8858_enable_test_pattern(ov8858, ctrl->val);
> +		break;
> +	default:
> +		dev_warn(&client->dev, "%s Unhandled id:0x%x, val:0x%x\n",
> +			 __func__, ctrl->id, ctrl->val);
> +		break;
> +	}
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ov8858_ctrl_ops = {
> +	.s_ctrl = ov8858_set_ctrl,
> +};
> +
> +static int ov8858_initialize_controls(struct ov8858 *ov8858)
> +{
> +	const struct ov8858_mode *mode;
> +	struct v4l2_ctrl_handler *handler;
> +	struct v4l2_ctrl *ctrl;
> +	s64 exposure_max, vblank_def;
> +	u32 h_blank;
> +	int ret;
> +
> +	handler = &ov8858->ctrl_handler;
> +	mode = ov8858->cur_mode;
> +	ret = v4l2_ctrl_handler_init(handler, 8);
> +	if (ret)
> +		return ret;
> +	handler->lock = &ov8858->mutex;
> +
> +	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ,
> +				      0, 0, link_freq_menu_items);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE,
> +			  0, ov8858->pixel_rate, 1, ov8858->pixel_rate);
> +
> +	h_blank = mode->hts_def - mode->width;
> +	ov8858->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
> +				h_blank, h_blank, 1, h_blank);
> +	if (ov8858->hblank)
> +		ov8858->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	vblank_def = mode->vts_def - mode->height;
> +	ov8858->vblank = v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +				V4L2_CID_VBLANK, vblank_def,
> +				OV8858_VTS_MAX - mode->height,
> +				1, vblank_def);
> +
> +	exposure_max = mode->vts_def - 4;
> +	ov8858->exposure = v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +				V4L2_CID_EXPOSURE, OV8858_EXPOSURE_MIN,
> +				exposure_max, OV8858_EXPOSURE_STEP,
> +				mode->exp_def);
> +
> +	ov8858->anal_gain = v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +				V4L2_CID_ANALOGUE_GAIN, OV8858_GAIN_MIN,
> +				OV8858_GAIN_MAX, OV8858_GAIN_STEP,
> +				OV8858_GAIN_DEFAULT);
> +
> +	ov8858->digi_gain = v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +				V4L2_CID_DIGITAL_GAIN, OV8858_DGAIN_MIN,
> +				OV8858_DGAIN_MAX, OV8858_DGAIN_STEP,
> +				OV8858_DGAIN_DEFAULT);
> +
> +	ov8858->test_pattern = v4l2_ctrl_new_std_menu_items(handler,
> +				&ov8858_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +				ARRAY_SIZE(ov8858_test_pattern_menu) - 1,
> +				0, 0, ov8858_test_pattern_menu);
> +
> +	if (handler->error) {
> +		ret = handler->error;
> +		dev_err(&ov8858->client->dev,
> +			"Failed to init controls(%d)\n", ret);
> +		goto err_free_handler;
> +	}
> +
> +	ov8858->subdev.ctrl_handler = handler;
> +
> +	return 0;
> +
> +err_free_handler:
> +	v4l2_ctrl_handler_free(handler);
> +
> +	return ret;
> +}
> +
> +static int ov8858_check_sensor_id(struct ov8858 *ov8858,
> +				   struct i2c_client *client)
> +{
> +	struct device *dev = &ov8858->client->dev;
> +	u32 id = 0;
> +	int ret;
> +
> +	ret = ov8858_read_reg(client, OV8858_REG_CHIP_ID,
> +			      OV8858_REG_VALUE_24BIT, &id);
> +	if (id != CHIP_ID) {
> +		dev_err(dev, "Unexpected sensor id(%06x), ret(%d)\n", id, ret);
> +		return ret;
> +	}
> +
> +	ret = ov8858_read_reg(client, OV8858_CHIP_REVISION_REG,
> +			      OV8858_REG_VALUE_08BIT, &id);
> +	if (ret) {
> +		dev_err(dev, "Read chip revision register error\n");
> +		return ret;
> +	}
> +
> +	dev_info(dev, "Detected OV%06x sensor, REVISION 0x%x\n", CHIP_ID, id);
> +
> +	if (id == OV8858_R2A) {
> +		if (4 == ov8858->lane_num) {
> +			ov8858_global_regs = ov8858_global_regs_r2a_4lane;
> +		} else {
> +			ov8858_global_regs = ov8858_global_regs_r2a_2lane;
> +		}
> +
> +		ov8858->is_r2a = true;
> +	} else {
> +		ov8858_global_regs = ov8858_global_regs_r1a;
> +		ov8858->is_r2a = false;
> +		dev_warn(dev, "R1A may not work well current!\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov8858_configure_regulators(struct ov8858 *ov8858)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < OV8858_NUM_SUPPLIES; i++)
> +		ov8858->supplies[i].supply = ov8858_supply_names[i];
> +
> +	return devm_regulator_bulk_get(&ov8858->client->dev,
> +				       OV8858_NUM_SUPPLIES,
> +				       ov8858->supplies);
> +}
> +
> +static int ov8858_parse_of(struct ov8858 *ov8858)
> +{
> +	struct device *dev = &ov8858->client->dev;
> +	struct device_node *endpoint;
> +	struct fwnode_handle *fwnode;
> +	int rval;
> +
> +	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	if (!endpoint) {
> +		dev_err(dev, "Failed to get endpoint\n");
> +		return -EINVAL;
> +	}
> +
> +	fwnode = of_fwnode_handle(endpoint);
> +	rval = fwnode_property_read_u32_array(fwnode, "data-lanes", NULL, 0);
> +	if (rval <= 0) {
> +		dev_warn(dev, " Get mipi lane num failed!\n");
> +		return -1;
> +	}
> +
> +	ov8858->lane_num = rval;
> +	if (4 == ov8858->lane_num) {
> +		ov8858->cur_mode = &supported_modes_4lane[0];
> +		supported_modes = supported_modes_4lane;
> +		ov8858->cfg_num = ARRAY_SIZE(supported_modes_4lane);
> +
> +		/* pixel rate = link frequency * 2 * lanes / BITS_PER_SAMPLE */
> +		ov8858->pixel_rate = MIPI_FREQ * 2U * ov8858->lane_num / 10U;
> +		dev_info(dev, "lane_num(%d)  pixel_rate(%u)\n",
> +				 ov8858->lane_num, ov8858->pixel_rate);
> +	} else {
> +		ov8858->cur_mode = &supported_modes_2lane[0];
> +		supported_modes = supported_modes_2lane;
> +		ov8858->cfg_num = ARRAY_SIZE(supported_modes_2lane);
> +
> +		/*pixel rate = link frequency * 2 * lanes / BITS_PER_SAMPLE */
> +		ov8858->pixel_rate = MIPI_FREQ * 2U * (ov8858->lane_num) / 10U;
> +		dev_info(dev, "lane_num(%d)  pixel_rate(%u)\n",
> +				 ov8858->lane_num, ov8858->pixel_rate);
> +	}
> +	return 0;
> +}
> +
> +static int ov8858_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct device_node *node = dev->of_node;
> +	struct ov8858 *ov8858;
> +	struct v4l2_subdev *sd;
> +	int ret;
> +
> +	ov8858 = devm_kzalloc(dev, sizeof(*ov8858), GFP_KERNEL);
> +	if (!ov8858)
> +		return -ENOMEM;
> +
> +	ov8858->client = client;
> +
> +	ov8858->xvclk = devm_clk_get(dev, "xvclk");
> +	if (IS_ERR(ov8858->xvclk))
> +		return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
> +				     "Failed to get xvclk\n");
> +
> +	ov8858->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov8858->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ov8858->reset_gpio),
> +				     "Failed to get reset gpio\n");
> +
> +	ov8858->pwdn_gpio = devm_gpiod_get_optional(dev, "powerdown",
> +						    GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov8858->pwdn_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ov8858->pwdn_gpio),
> +				     "Failed to get powerdown gpio\n");
> +
> +	ret = ov8858_configure_regulators(ov8858);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get power regulators\n");
> +
> +	ret = ov8858_parse_of(ov8858);
> +	if (ret != 0)
> +		return -EINVAL;
> +
> +	mutex_init(&ov8858->mutex);
> +
> +	sd = &ov8858->subdev;
> +	v4l2_i2c_subdev_init(sd, client, &ov8858_subdev_ops);
> +	ret = ov8858_initialize_controls(ov8858);
> +	if (ret)
> +		goto err_destroy_mutex;
> +
> +	ret = __ov8858_power_on(ov8858);
> +	if (ret)
> +		goto err_free_handler;
> +
> +	ret = ov8858_check_sensor_id(ov8858, client);
> +	if (ret)
> +		goto err_power_off;
> +
> +	sd->internal_ops = &ov8858_internal_ops;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov8858->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ret = media_entity_pads_init(&sd->entity, 1, &ov8858->pad);
> +	if (ret < 0)
> +		goto err_power_off;
> +
> +	ret = v4l2_async_register_subdev_sensor(sd);
> +	if (ret) {
> +		dev_err(dev, "v4l2 async register subdev failed\n");
> +		goto err_clean_entity;
> +	}
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +
> +err_clean_entity:
> +	media_entity_cleanup(&sd->entity);
> +err_power_off:
> +	__ov8858_power_off(ov8858);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
> +err_destroy_mutex:
> +	mutex_destroy(&ov8858->mutex);
> +
> +	return ret;
> +}
> +
> +static int ov8858_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov8858 *ov8858 = to_ov8858(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	media_entity_cleanup(&sd->entity);
> +#endif
> +	v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
> +	mutex_destroy(&ov8858->mutex);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		__ov8858_power_off(ov8858);
> +	pm_runtime_set_suspended(&client->dev);
> +
> +	return 0;
> +}
> +
> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id ov8858_of_match[] = {
> +	{ .compatible = "ovti,ov8858" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ov8858_of_match);
> +#endif
> +
> +static const struct i2c_device_id ov8858_match_id[] = {
> +	{ "ovti,ov8858", 0 },
> +	{ },
> +};
> +
> +static struct i2c_driver ov8858_i2c_driver = {
> +	.driver = {
> +		.name = OV8858_NAME,
> +		.pm = &ov8858_pm_ops,
> +		.of_match_table = of_match_ptr(ov8858_of_match),
> +	},
> +	.probe		= &ov8858_probe,
> +	.remove		= &ov8858_remove,
> +	.id_table	= ov8858_match_id,
> +};
> +
> +module_i2c_driver(ov8858_i2c_driver);
> +
> +MODULE_DESCRIPTION("OmniVision ov8858 sensor driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.34.1
>
