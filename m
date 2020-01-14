Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F000613A87B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 12:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729508AbgANLfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 06:35:05 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52749 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgANLfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 06:35:05 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so13378330wmc.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2020 03:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k8AVVaO7HKE7x0zW0W7TyY5oUqGiTG9X8D5bWOykcck=;
        b=Qys0t03BNzJF3zJ773pHzLMeM90dkAkHGg78pV1bbGqYUBorYOk90XE0g0bQUounYM
         b7SFLJc5nZIzTIaakyunrVAyQp+BgWHl0Pm1H+X8DzRbPeso7IZLA0twNJVcUGQ/Cfsv
         5dHsEMpum9DlyZmGR5JqdDY7it+au8/XQ0PlL2hQqzawvsuQW5v4vsvE6EKxl4Ug6PGl
         borx5Umpwtk9Fxmqy3h8qqueujamxrCBhGmn2x/gBvfocqLmIKVZlXpuVdcfxk+cdqU7
         l7DG1jDGapyncw9jc70dKqMbBknPFhWdcuTr9n1E+bDtvI85eO4jnIinmxZlao45LfuS
         8ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k8AVVaO7HKE7x0zW0W7TyY5oUqGiTG9X8D5bWOykcck=;
        b=qoRGZHx/75rAJaCzrBmDCZf75A661W/ldNiLbEHzeloM0K0zJvBai0uUIv8++OZbIR
         LLSzameQIxZs3DzuVNk3gwT0CbIWRGNZW6uZUEL63SdaemW0Vavyjqc4iA2ejfdq/L+l
         2i4FPntUJjbrRxxIQnNdTG/d5WV3x6tjUJGNK6v8Okitix9MEMj/JDtsYGBIs+Q0JUoH
         WpKgaEd+o5jq5ttRdfoNvhtGpsYN1WcoSy3qyz9aWeROcehe1gQu0xDEHKefASttXx/H
         /lccd2PfD07uzlEj6Fxox0Yu/BkZLFGLvMYlacoL7mqEq2TkMR5IqoHNX4aUSntU1L2q
         QXlw==
X-Gm-Message-State: APjAAAWgEvxp+OYWeE3SEf6kornAOKy+g07iVf5I1TBii9j4ThmJTT45
        CoZZqlUzL7e6fo9aJbLjJ3O89P7q9ELd4YyRtc2vRw==
X-Google-Smtp-Source: APXvYqzAYf3XnsT4uLsj3pPqm7yo7SkwtGNrbE8LVt0VZ3j9x/PAVK3RmKkwUPOFPlL1x9kxksGDcs5NrtNkmKQ9wDw=
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr25342578wmf.60.1579001703203;
 Tue, 14 Jan 2020 03:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20191227122114.23075-1-andrey.konovalov@linaro.org>
 <20191227122114.23075-3-andrey.konovalov@linaro.org> <20191227145547.GE861@valkosipuli.retiisi.org.uk>
 <d3f1591b-1a98-e876-b977-96e1210e9c49@linaro.org>
In-Reply-To: <d3f1591b-1a98-e876-b977-96e1210e9c49@linaro.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 14 Jan 2020 11:34:46 +0000
Message-ID: <CAPY8ntCwh6KXpx-tMhjVwF97hqayLRKVC8BC6DCZ0hqvkU-boA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for Sony IMX219 sensor
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, mchehab@kernel.org,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Peter Griffin <peter.griffin@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey & Sakari

On Mon, 13 Jan 2020 at 19:16, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Sakari,
>
> Sorry for delayed reply..
> (your email got into a wrong folder, and I might not find it there if Ezequiel
> did not warn me that I didn't address the comments from your review)

For some reason I missed getting Sakari's email too - apologies.

> On 27.12.2019 17:55, Sakari Ailus wrote:
> > Hi Andrey,
> >
> > On Fri, Dec 27, 2019 at 03:21:14PM +0300, Andrey Konovalov wrote:
> >> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>
> >> Adds a driver for the 8MPix Sony IMX219 CSI2 sensor.
> >> Whilst the sensor supports 2 or 4 CSI2 data lanes, this driver
> >> currently only supports 2 lanes.
> >> 8MPix @ 15fps, 1080P @ 30fps (cropped FOV), and 1640x1232 (2x2 binned)
> >> @ 30fps are currently supported.
> >>
> >> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> >> ---
> >>   drivers/media/i2c/Kconfig  |   12 +
> >>   drivers/media/i2c/Makefile |    1 +
> >>   drivers/media/i2c/imx219.c | 1240 ++++++++++++++++++++++++++++++++++++
> >>   3 files changed, 1253 insertions(+)
> >>   create mode 100644 drivers/media/i2c/imx219.c
>
> <snip>
>
> >> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> >> new file mode 100644
> >> index 000000000000..28b55c61cd77
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/imx219.c
>
> <snip>
>
> >> +/* Power/clock management functions */
> >> +static int imx219_power_on(struct device *dev)
> >> +{
> >> +    struct i2c_client *client = to_i2c_client(dev);
> >> +    struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +    int ret;
> >> +
> >> +    ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
> >> +                                imx219->supplies);
> >> +    if (ret) {
> >> +            dev_err(&client->dev, "%s: failed to enable regulators\n",
> >> +                    __func__);
> >> +            return ret;
> >> +    }
> >> +
> >> +    ret = clk_prepare_enable(imx219->xclk);
> >> +    if (ret) {
> >> +            dev_err(&client->dev, "%s: failed to enable clock\n",
> >> +                    __func__);
> >> +            goto reg_off;
> >> +    }
> >> +
> >> +    gpiod_set_value_cansleep(imx219->xclr_gpio, 1);
> >> +    msleep(IMX219_XCLR_DELAY_MS);
> >
> > I guess 10 ms is ok albeit it'd be nicer if you calculated the required
> > delay instead.
>
> I think this 10 ms delay actually serves two purposes here. It is
> not only the delay after XCLR pin is set high (reset de-asserted),
> but it also lets the camera power supplies voltages to settle after
> regulator_bulk_enable() called few lines above.
>
> So I would make the delay a sum of 1) the value which depends on
> input clock frequency (the driver currently supports 24MHz only)
> and 2) a fixed value of 8 ms or so to account for the power supplies
> settle time. So that the sum would be the same 10 ms for 24MHz input
> clock.
> Does it makes sense?

Regulator settling times shouldn't really be included here - that
should be taken care of via the regulator framework (in the case of DT
for regulator-fixed you define the startup-delay-us property).

What level do you end up computing it to?

This delay covers t4, t5 and t6 from figure 38 on page 77 of the datasheet[1]
t4 is max 200usecs.
t5 is 6ms.
t6 is 32000 cycles of INCK. As you say INCK=24MHz is the only
supported clock frequency at present, so 1.3ms. Minimum clock is 6MHz
which will make this 5.3ms.

t6 is in parallel with t5, but it is smaller than t5 even at the
minimum clock frequency.
Yes we can be programming the sensor over I2C after t5 but before t6,
but you'd now want to be computing the number of I2C writes required,
the speed of the I2C bus, and probably a few other parameters to
ensure you don't violate t5. The sensor supports 1MHz CCI if INCK is
>11.4MHz. A quick check says we have around 60 register writes to
initialise the sensor. 38 clocks (4 * (8 data bits + ACK) + start +
end) to write each register, which I make 2.4ms. It is therefore
possible to violate t5.

Is it worth that level of computation, or do you just take t4+t5 at 6.2ms?

I have been a bit naughty up until now in not setting startup-delay-us
on the regulator definition and relying on this delay instead. The
driver ought to do the right thing though and I'll fix my
configuration.

  Dave

[1] https://github.com/rellimmot/Sony-IMX219-Raspberry-Pi-V2-CMOS

> <snip>
>
> >> +static int imx219_probe(struct i2c_client *client,
> >> +                    const struct i2c_device_id *id)
> >> +{
> >> +    struct device *dev = &client->dev;
> >> +    struct fwnode_handle *endpoint;
> >> +    struct imx219 *imx219;
> >> +    int ret;
> >> +
> >> +    imx219 = devm_kzalloc(&client->dev, sizeof(*imx219), GFP_KERNEL);
> >> +    if (!imx219)
> >> +            return -ENOMEM;
> >> +
> >> +    imx219->dev = dev;
> >
> > Instead of putting a dev field to struct imx219, you can find the device in
> > struct i2c_client.dev, which you can get by:
> >
> >       v4l2_get_subdevdata(imx219->sd)
> >
> >> +
> >> +    v4l2_i2c_subdev_init(&imx219->sd, client, &imx219_subdev_ops);
> >> +
> >> +    /* Get CSI2 bus config */
> >> +    endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> >> +                                              NULL);
> >> +    if (!endpoint) {
> >> +            dev_err(dev, "endpoint node not found\n");
> >> +            return -EINVAL;
> >> +    }
> >> +
> >> +    ret = v4l2_fwnode_endpoint_parse(endpoint, &imx219->ep);
> >> +    fwnode_handle_put(endpoint);
> >> +    if (ret) {
> >> +            dev_err(dev, "Could not parse endpoint\n");
> >> +            return ret;
> >> +    }
> >> +
> >> +    /* Get system clock (xclk) */
> >> +    imx219->xclk = devm_clk_get(dev, "xclk");
> >> +    if (IS_ERR(imx219->xclk)) {
> >> +            dev_err(dev, "failed to get xclk\n");
> >> +            return PTR_ERR(imx219->xclk);
> >> +    }
> >> +
> >> +    imx219->xclk_freq = clk_get_rate(imx219->xclk);
> >> +    if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> >> +            dev_err(dev, "xclk frequency not supported: %d Hz\n",
> >> +                    imx219->xclk_freq);
> >> +            return -EINVAL;
> >> +    }
> >
> > Could you also check the link frequencies (the link-frequencies property
> > that also should be added to DT bindings) matches with what is possible
> > with the given xclk frequency? Please see e.g. imx319 driver for an
> > example.
>
> The driver only supports single xclk frequency and single link-frequency
> (hardcoded in the registers value tables). So the check will be more like
> the one in imx290 driver (error out if the link-frequency property isn't
> equal to the pre#define-d default value).
>
> >> +
> >> +    ret = imx219_get_regulators(imx219);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    /* Request optional enable pin */
> >> +    imx219->xclr_gpio = devm_gpiod_get_optional(dev, "xclr",
> >> +                                                GPIOD_OUT_HIGH);
> >> +
> >> +    /*
> >> +     * The sensor must be powered for imx219_identify_module()
> >> +     * to be able to read the CHIP_ID register
> >> +     */
> >> +    ret = imx219_power_on(dev);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    ret = imx219_identify_module(imx219);
> >> +    if (ret)
> >> +            goto error_power_off;
> >> +
> >> +    /* Set default mode to max resolution */
> >> +    imx219->mode = &supported_modes[0];
> >> +
> >> +    ret = imx219_init_controls(imx219);
> >> +    if (ret)
> >> +            goto error_power_off;
> >> +
> >> +    /* Initialize subdev */
> >> +    imx219->sd.internal_ops = &imx219_internal_ops;
> >> +    imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >> +    imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> >> +
> >> +    /* Initialize source pad */
> >> +    imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
> >> +
> >> +    ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> >> +    if (ret)
> >> +            goto error_handler_free;
> >> +
> >> +    ret = v4l2_async_register_subdev_sensor_common(&imx219->sd);
> >> +    if (ret < 0)
> >> +            goto error_media_entity;
> >> +
> >> +    /* Enable runtime PM and turn off the device */
> >> +    pm_runtime_set_active(dev);
> >> +    pm_runtime_enable(dev);
> >> +    pm_runtime_idle(dev);
> >> +
> >> +    return 0;
> >> +
> >> +error_media_entity:
> >> +    media_entity_cleanup(&imx219->sd.entity);
> >> +
> >> +error_handler_free:
> >> +    imx219_free_controls(imx219);
> >> +
> >> +error_power_off:
> >> +    imx219_power_off(dev);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> +static int imx219_remove(struct i2c_client *client)
> >> +{
> >> +    struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >> +    struct imx219 *imx219 = to_imx219(sd);
> >> +
> >> +    v4l2_async_unregister_subdev(sd);
> >> +    media_entity_cleanup(&sd->entity);
> >> +    imx219_free_controls(imx219);
> >> +
> >> +    pm_runtime_disable(&client->dev);
> >> +    pm_runtime_set_suspended(&client->dev);
> >
> > imx219_power_off(), if the sensor is powered on here. Please see e.g. the
> > smiapp driver regarding this.
>
> It should be powered off here.
>
> The sensor is powered on when streaming is started, and is powered off when
> it is stopped: if the enable argument is false, imx219_set_stream() calls
> pm_runtime_put().
> IOW, it follows the imx319 driver as the example of power management.
>
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static const struct of_device_id imx219_dt_ids[] = {
> >> +    { .compatible = "sony,imx219" },
> >> +    { /* sentinel */ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, imx219_dt_ids);
> >> +
> >> +static const struct dev_pm_ops imx219_pm_ops = {
> >> +    SET_SYSTEM_SLEEP_PM_OPS(imx219_suspend, imx219_resume)
> >> +    SET_RUNTIME_PM_OPS(imx219_power_off, imx219_power_on, NULL)
> >> +};
> >> +
> >> +static struct i2c_driver imx219_i2c_driver = {
> >> +    .driver = {
> >> +            .name = "imx219",
> >> +            .of_match_table = imx219_dt_ids,
> >> +            .pm = &imx219_pm_ops,
> >> +    },
> >> +    .probe = imx219_probe,
> >
> > Could you use .probe_new, and remove the i2c_device_id argument?
>
> I'll fix this and all the other issues I didn't comment on in this email
> in the v4 of the patch set.
>
> Thanks,
> Andrey
>
> >> +    .remove = imx219_remove,
> >> +};
> >> +
> >> +module_i2c_driver(imx219_i2c_driver);
> >> +
> >> +MODULE_AUTHOR("Dave Stevenson <dave.stevenson@raspberrypi.com");
> >> +MODULE_DESCRIPTION("Sony IMX219 sensor driver");
> >> +MODULE_LICENSE("GPL v2");
> >
