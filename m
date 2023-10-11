Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEDC47C5286
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 13:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234788AbjJKLw2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 07:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbjJKLw0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 07:52:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57EE8F
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 04:52:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0C57512;
        Wed, 11 Oct 2023 13:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697025141;
        bh=LaphiAxP0Z4SLViJYtddu+4YwsLa2B8ElNrOYq3ldwA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HAS94r1Ln862vOqhIqyq2NIyJ88ZcNGrK0c2yQhyCiLQzrmz2ZNeNJKDxz2LRh9rf
         fBk0uYTRN2s+ll5/77Wi8l0VEis7wekkEnji+FSjRnfNSTVoYFM3UchjW8hA0YZVBv
         hgIJ4UHDfQ4e8wypkZMgCd2n6kWPbsqrIdfTUSp0=
Date:   Wed, 11 Oct 2023 14:52:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [bug report] media: i2c: Add driver for onsemi MT9M114 camera
 sensor
Message-ID: <20231011115230.GA5306@pendragon.ideasonboard.com>
References: <3bd48847-3c26-4418-ae31-49bcc97b9dde@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3bd48847-3c26-4418-ae31-49bcc97b9dde@moroto.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Wed, Oct 11, 2023 at 11:31:06AM +0300, Dan Carpenter wrote:
> Hello Laurent Pinchart,
> 
> The patch 70ff259069a5: "media: i2c: Add driver for onsemi MT9M114
> camera sensor" from Sep 20, 2023 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/media/i2c/mt9m114.c:2381 mt9m114_probe()
> 	warn: missing unwind goto?

Thanks for the report. This is a known issue, I've sent a patch, Sakari
(on CC) has picked it up, and I believe he plans to send a pull request
before the end of the week to get this fixed in time for v6.7-rc1.

> drivers/media/i2c/mt9m114.c
>     2320 static int mt9m114_probe(struct i2c_client *client)
>     2321 {
>     2322         struct device *dev = &client->dev;
>     2323         struct mt9m114 *sensor;
>     2324         int ret;
>     2325 
>     2326         sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
>     2327         if (!sensor)
>     2328                 return -ENOMEM;
>     2329 
>     2330         sensor->client = client;
>     2331 
>     2332         sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
>     2333         if (IS_ERR(sensor->regmap)) {
>     2334                 dev_err(dev, "Unable to initialize I2C\n");
>     2335                 return -ENODEV;
>     2336         }
>     2337 
>     2338         ret = mt9m114_parse_dt(sensor);
>     2339         if (ret < 0)
>     2340                 return ret;
>     2341 
>     2342         /* Acquire clocks, GPIOs and regulators. */
>     2343         sensor->clk = devm_clk_get(dev, NULL);
>     2344         if (IS_ERR(sensor->clk)) {
>     2345                 ret = PTR_ERR(sensor->clk);
>     2346                 dev_err_probe(dev, ret, "Failed to get clock\n");
>     2347                 goto error_ep_free;
>     2348         }
>     2349 
>     2350         sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>     2351         if (IS_ERR(sensor->reset)) {
>     2352                 ret = PTR_ERR(sensor->reset);
>     2353                 dev_err_probe(dev, ret, "Failed to get reset GPIO\n");
>     2354                 goto error_ep_free;
>     2355         }
>     2356 
>     2357         sensor->supplies[0].supply = "vddio";
>     2358         sensor->supplies[1].supply = "vdd";
>     2359         sensor->supplies[2].supply = "vaa";
>     2360 
>     2361         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(sensor->supplies),
>     2362                                       sensor->supplies);
>     2363         if (ret < 0) {
>     2364                 dev_err_probe(dev, ret, "Failed to get regulators\n");
>     2365                 goto error_ep_free;
>     2366         }
>     2367 
>     2368         ret = mt9m114_clk_init(sensor);
>     2369         if (ret)
>     2370                 return ret;
> 
> These two should probably be goto error_ep_free;
> 
>     2371 
>     2372         /*
>     2373          * Identify the sensor. The driver supports runtime PM, but needs to
>     2374          * work when runtime PM is disabled in the kernel. To that end, power
>     2375          * the sensor on manually here, and initialize it after identification
>     2376          * to reach the same state as if resumed through runtime PM.
>     2377          */
>     2378         ret = mt9m114_power_on(sensor);
>     2379         if (ret < 0) {
>     2380                 dev_err_probe(dev, ret, "Could not power on the device\n");
> --> 2381                 return ret;
> 
> This as well.
> 
>     2382         }
>     2383 
>     2384         ret = mt9m114_identify(sensor);
>     2385         if (ret < 0)
>     2386                 goto error_power_off;
>     2387 
>     2388         ret = mt9m114_initialize(sensor);
>     2389         if (ret < 0)
>     2390                 goto error_power_off;
>     2391 
>     2392         /*
>     2393          * Enable runtime PM with autosuspend. As the device has been powered
>     2394          * manually, mark it as active, and increase the usage count without
>     2395          * resuming the device.
>     2396          */
>     2397         pm_runtime_set_active(dev);
>     2398         pm_runtime_get_noresume(dev);
>     2399         pm_runtime_enable(dev);
>     2400         pm_runtime_set_autosuspend_delay(dev, 1000);
>     2401         pm_runtime_use_autosuspend(dev);
>     2402 
>     2403         /* Initialize the subdevices. */
>     2404         ret = mt9m114_pa_init(sensor);
>     2405         if (ret < 0)
>     2406                 goto error_pm_cleanup;
>     2407 
>     2408         ret = mt9m114_ifp_init(sensor);
>     2409         if (ret < 0)
>     2410                 goto error_pa_cleanup;
>     2411 
>     2412         ret = v4l2_async_register_subdev(&sensor->ifp.sd);
>     2413         if (ret < 0)
>     2414                 goto error_ifp_cleanup;
>     2415 
>     2416         /*
>     2417          * Decrease the PM usage count. The device will get suspended after the
>     2418          * autosuspend delay, turning the power off.
>     2419          */
>     2420         pm_runtime_mark_last_busy(dev);
>     2421         pm_runtime_put_autosuspend(dev);
>     2422 
>     2423         return 0;
>     2424 
>     2425 error_ifp_cleanup:
>     2426         mt9m114_ifp_cleanup(sensor);
>     2427 error_pa_cleanup:
>     2428         mt9m114_pa_cleanup(sensor);
>     2429 error_pm_cleanup:
>     2430         pm_runtime_disable(dev);
>     2431         pm_runtime_put_noidle(dev);
>     2432 error_power_off:
>     2433         mt9m114_power_off(sensor);
>     2434 error_ep_free:
>     2435         v4l2_fwnode_endpoint_free(&sensor->bus_cfg);
>     2436         return ret;
>     2437 }

-- 
Regards,

Laurent Pinchart
