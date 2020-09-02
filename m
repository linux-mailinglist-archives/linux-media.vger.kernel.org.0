Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E63725A515
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 07:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgIBFfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 01:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgIBFfj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 01:35:39 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6A5C061244;
        Tue,  1 Sep 2020 22:35:39 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id s10so1298955plp.1;
        Tue, 01 Sep 2020 22:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eQPR30zGfRfeAaiqiFgod4rMnLiD9w7BcMVmHoMNe6I=;
        b=pDzQpqINV8Bc/bc9VIOK+95xcXunbQUoqiHZ+g1Vc3u4naR3uz/81aNSPNi1S+iJim
         UBo+xMuLI+Axtc0qbjDY4xwBG7Egssp2GVM3vJQyO70DNYOGvfvHyzuMpItR+9DoCNSh
         ZybDEywUInFXMB168+RHJTmC9Z+U2cd06klj41JAsLqICHz/WqLzhVcAwsVsI6K48YSb
         M+rbaDf1Z6T6kbuSNTp+av9JNHNpJhOKjjh8by8n/vOawHBNvmgAL6fNGVTUjOZdQ/QO
         IdPHLOjiR1DnXBqU9nUG89pDZVl18svEvfipP9r92UEVblcenJdTAgk5rphfQD4PSVnc
         1DJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eQPR30zGfRfeAaiqiFgod4rMnLiD9w7BcMVmHoMNe6I=;
        b=kZhtOxK4FzMQf3gVQCeLo9OHelBe/n44LBiT85KA1NY7d5zM8NNEwKuXt7/ZGNsY75
         i0NflS54iYAbpnU8clmyPeRQUMpC8Lr4kjZrvP5TYH7b6Rn4ZxEUZrnSM2VOSw9cS1TW
         LNp6g3IkrZkSd7xPeXzvOq5aCrjqkrmPeH/8xPza9HveF3zpRe6R32vpjaSVcQ6JWetv
         I6r1aYTu1qfsZ9MpLPmOrDwSx/dRb5s6xgGXpHFMqPb0LgglN6rNvrqMtXtK13KaSjs/
         HdHO9YXvxLlxA7FxAYXNBrkT4kOwRN0xQDwyOFPXJEACMQN70pNCyFB6FgjWr4CpoC4d
         y30A==
X-Gm-Message-State: AOAM530g/igO96W/8pt0VNmum1BXApGrTqPoIqheifx8IDl4z5toZQgE
        G2Cw3aZxYA9d8fESXqYt27I=
X-Google-Smtp-Source: ABdhPJyNlWT8JPI8rqixhq9HIg8+D7+aDTjHXMIKLbUrx9Nv2GXMWOXm0vv/86Ne5hHQSHaeBIzS1Q==
X-Received: by 2002:a17:90b:1916:: with SMTP id mp22mr737220pjb.132.1599024938457;
        Tue, 01 Sep 2020 22:35:38 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
        by smtp.gmail.com with ESMTPSA id in12sm3154140pjb.29.2020.09.01.22.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 22:35:37 -0700 (PDT)
Date:   Wed, 2 Sep 2020 14:35:35 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH V10 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200902053535.GC2264887@google.com>
References: <20200703080404.29770-1-dongchun.zhu@mediatek.com>
 <20200703080404.29770-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703080404.29770-3-dongchun.zhu@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/07/03 16:04), Dongchun Zhu wrote:
[..]
> +static int dw9768_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct dw9768 *dw9768;
> +	unsigned int i;
> +	int ret;
> +
> +	dw9768 = devm_kzalloc(dev, sizeof(*dw9768), GFP_KERNEL);
> +	if (!dw9768)
> +		return -ENOMEM;
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&dw9768->sd, client, &dw9768_ops);
> +
[..]
> +	dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	pm_runtime_enable(dev);
> +	if (!pm_runtime_enabled(dev)) {
> +		ret = dw9768_runtime_resume(dev);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to power on: %d\n", ret);
> +			goto err_clean_entity;
> +		}
> +	}
> +
> +	ret = v4l2_async_register_subdev(&dw9768->sd);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> +		goto err_power_off;
> +	}

I would expect to see a slightly different order here: first set
everything up, then expose the device to PM subsystem.

[..]
> +static int dw9768_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> +
> +	v4l2_async_unregister_subdev(&dw9768->sd);
> +	v4l2_ctrl_handler_free(&dw9768->ctrls);
> +	media_entity_cleanup(&dw9768->sd.entity);
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		dw9768_runtime_suspend(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);

Ditto. Shall we first disable PM (so that we won't get any unexpected
PM callbacks) and then destroy the device?

	-ss
