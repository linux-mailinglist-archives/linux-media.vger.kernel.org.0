Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CECA68EFEF
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 14:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbjBHNhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 08:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbjBHNhm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 08:37:42 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F178730B18
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 05:37:40 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso1504316wms.0
        for <linux-media@vger.kernel.org>; Wed, 08 Feb 2023 05:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FNjNrWAWsKMr6QYmewdU7les6XGBFKgvBD188N/1bg=;
        b=ScTsiNBq3F8ira8GPaLb2kA7YcbYgI9naqgDg/edC6wcM6ZgOuc3ccSQKDHIFHZwTG
         mANjOsNyY5PRfJ82iZVBssshPDL7WOvCObyJ4LWNHvj5DfS1VYz6MzfGmlGso4/fkorY
         UE+OiOQxkT9caKiSFIp7NfvmrA3aykyTZTTpOXAFNfgrCVnrh7+l+fAie1UoPNkvnHzu
         l0McmrMsKA7sCspCybdVFGsbyy92z1bKMEU2A9epFgE6uieSpcA9lj+rr/5+TV8lFg0r
         gnY2zUKKhs52BfMXdsdqBG441laHWej4VKPjLAUOYc0umi7s0E+z10hQ2LNCSrFHwUKM
         FN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FNjNrWAWsKMr6QYmewdU7les6XGBFKgvBD188N/1bg=;
        b=1eqBf4LYNrGyOx0zR0KAmxqBMpGh8wz6drvqvOADVnSbN2j7impXD4PLCENFLUoxd0
         +3+Y3M9Ea5UcfwUuoVvfLJofgZQvRlFj/3A7bqrENslQwhh9YU8BPjjT3s4ybK8WrNtd
         3THD4HvmWyI/qNUwSx1FRkhMrPHyPUrrWGCb1X32ENtKTogwhFcQ2M+hym9TJuKUg+Hf
         4ysZBAPhrgiibYl6GsfE/VXJTKKD9BekxDQDc48N2EJSVmXm7pS9OhCnaoksnWTH0raP
         JO4KPAQJbqL+pKvPfw3BhS0kFY/pKDjdtM6c1bLhM7rF+CdiatdhDGwvGifjKzh3Av1d
         9Lww==
X-Gm-Message-State: AO0yUKXyI1q092R6Wyo9xY6BDdOMaYis1HJFDo7lj4BGIqg7No91Zh9L
        zA+dPZEp+kCRs/gVYHRPx/E=
X-Google-Smtp-Source: AK7set/4ZuLaFp1i75LUahdyihfHoFCnc3aIhF4QQ1CW5vdlVwIdNiET41WaWiYl5eWDoi0p2xjmlw==
X-Received: by 2002:a05:600c:2907:b0:3dd:e621:d328 with SMTP id i7-20020a05600c290700b003dde621d328mr8713438wmd.8.1675863459482;
        Wed, 08 Feb 2023 05:37:39 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p14-20020a1c544e000000b003db06493ee7sm2013486wmi.47.2023.02.08.05.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 05:37:38 -0800 (PST)
Date:   Wed, 8 Feb 2023 16:37:35 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     jacopo.mondi@ideasonboard.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: i2c: ov5670: Use common clock framework
Message-ID: <Y+Oln/uxPVwKVwFX@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jacopo Mondi,

The patch 8004c91e2095: "media: i2c: ov5670: Use common clock
framework" from Jan 26, 2023, leads to the following Smatch static
checker warning:

	drivers/media/i2c/ov5670.c:2670 ov5670_probe()
	warn: passing zero to 'PTR_ERR'

drivers/media/i2c/ov5670.c
    2648 static int ov5670_probe(struct i2c_client *client)
    2649 {
    2650         struct ov5670 *ov5670;
    2651         const char *err_msg;
    2652         u32 input_clk = 0;
    2653         bool full_power;
    2654         int ret;
    2655 
    2656         ov5670 = devm_kzalloc(&client->dev, sizeof(*ov5670), GFP_KERNEL);
    2657         if (!ov5670) {
    2658                 ret = -ENOMEM;
    2659                 err_msg = "devm_kzalloc() error";
    2660                 goto error_print;
    2661         }
    2662 
    2663         ov5670->xvclk = devm_clk_get(&client->dev, NULL);
    2664         if (!IS_ERR_OR_NULL(ov5670->xvclk))
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Imagine CONFIG_HAVE_CLK is not enabled so now devm_clk_get() returns
NULL. 

    2665                 input_clk = clk_get_rate(ov5670->xvclk);
    2666         else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
    2667                 device_property_read_u32(&client->dev, "clock-frequency",
    2668                                          &input_clk);
    2669         else
--> 2670                 return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
    2671                                      "error getting clock\n");

A NULL is zero and zero is success.

That means this code returns success without doing anything.  Perhaps
the right thing is to use use Kconfig to ensure that this cannot be
build without CONFIG_HAVE_CLK.  The other solution is to write the
driver with a bunch of NULL checks so that it still runs without a clk.

The IS_ERR_OR_NULL() check should be changed to if (IS_ERR()).

    2672 
    2673         if (input_clk != OV5670_XVCLK_FREQ) {
    2674                 dev_err(&client->dev,
    2675                         "Unsupported clock frequency %u\n", input_clk);
    2676                 return -EINVAL;
    2677         }
    2678 
    2679         /* Initialize subdev */
    2680         v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
    2681 
    2682         ret = ov5670_regulators_probe(ov5670);
    2683         if (ret) {
    2684                 err_msg = "Regulators probe failed";

regards,
dan carpenter
