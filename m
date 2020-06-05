Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8C81EF981
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 15:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgFENop (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 09:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgFENoo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 09:44:44 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13723C08C5C2
        for <linux-media@vger.kernel.org>; Fri,  5 Jun 2020 06:44:44 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r15so9168157wmh.5
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2020 06:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5PQzDDsQmUF7BQ6/0BhotZrc2bmAb1gdhbMGEhMSqcQ=;
        b=YmDuS9PTgLKSaem8HHqKX+hkd3wzt5977OMZX9Vc9GhmUnjYYeI0TuoiNCNU3e367c
         6nrIZoUYknY3zCRVxe84B32wytGoNfzvtiAzirGZHddzuUB8+Sh6PCVWrGHeUcm3qOUf
         jSsJlD1Pp8hS1Wp/44jEvOzdcpHks9/rFgpuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5PQzDDsQmUF7BQ6/0BhotZrc2bmAb1gdhbMGEhMSqcQ=;
        b=K3W0ckUpbJwJP4hN/O+EsZ1DrflGx3oH+yuH+qqNz+RlITt1I7LwI60z9x76CnkN/2
         G36VVt7OsX+VqS3Zg0VzyCA/9ljZPvvOmCQM0vJBUgxuWgNfi1KiALI0vyTY3oOJdDBj
         xtpD9pHyXjU8T4zclr/ozA+VjAVvW5L6aCRaXzo33t7a9rTjC6zw54YImefFrJPdHK5C
         7Eue5Nn2k24ogVP2OVorT7MjkM1iOmtZs/y+NS9ka6atZ7I4zsJqW/1+67laLA5L/pPS
         FFaMoJ8hGDdefffviKrhyRixj6vGfTkaC+uUAxVvVc35NeHKgMIfO3sFr5cMU/mD9njP
         Muzw==
X-Gm-Message-State: AOAM530BBCKVILDmBzhEkoUJq1Q9yYeEiCJRnv374A6EWIagRA2gONb7
        I2VzKdJkPaYvM+zSgClEThJBtw==
X-Google-Smtp-Source: ABdhPJyfc8GxBiu72Fup2m9Lg5jy8H1Blu9IcyRWs6TPDQLtTerzzmJnbgWxh70lB/Kpcv6rAvgsww==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr2683360wmc.1.1591364682767;
        Fri, 05 Jun 2020 06:44:42 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id c6sm12429250wro.92.2020.06.05.06.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 06:44:42 -0700 (PDT)
Date:   Fri, 5 Jun 2020 13:44:40 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200605134440.GA20379@chromium.org>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605105412.18813-3-dongchun.zhu@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> control to set the desired focus via IIC serial interface.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/media/i2c/Kconfig  |  13 ++
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/dw9768.c | 566 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 581 insertions(+)
>  create mode 100644 drivers/media/i2c/dw9768.c
> 

Thank you for the patch. Please see my comments inline.

[snip]
> +/*
> + * DW9768 requires waiting time (delay time) of t_OPR after power-up,
> + * or in the case of PD reset taking place.
> + */
> +#define DW9768_T_OPR_US				1000
> +#define DW9768_Tvib_MS_BASE10			(64 - 1)

Kernel macro names are uppercase only.

[snip]
> +	/* Set AAC Timing */
> +	if (dw9768->aac_timing != DW9768_AAC_TIME_DEFAULT) {
> +		ret = i2c_smbus_write_byte_data(client, DW9768_AAC_TIME_REG,
> +						dw9768->aac_timing);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	move_delay_us = dw9768_cal_move_delay(dw9768->aac_mode,
> +					      dw9768->clock_presc,
> +					      dw9768->aac_timing) / 100;

We could calculate this once in probe() and store the ready us value in
the dw9768 struct.

> +
> +	for (val = dw9768->focus->val % DW9768_MOVE_STEPS;
> +	     val <= dw9768->focus->val;
> +	     val += DW9768_MOVE_STEPS) {
> +		ret = dw9768_set_dac(dw9768, val);
> +		if (ret) {
> +			dev_err(&client->dev, "%s I2C failure: %d",
> +				__func__, ret);
> +			return ret;
> +		}
> +		usleep_range(move_delay_us, move_delay_us + 1000);
> +	}
> +
> +	return 0;
> +}
[snip]
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
> +		goto error_async_register;
> +	}
> +
> +	return 0;
> +
> +error_async_register:

The recommendation is to name the labels after the clean-up task that needs
to be done. Should this one be called error_power_off?

> +	if (!pm_runtime_enabled(dev))
> +		dw9768_runtime_suspend(dev);

Shouldn't we also call pm_runtime_disable() here?

> +err_clean_entity:
> +	media_entity_cleanup(&dw9768->sd.entity);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&dw9768->ctrls);
> +
> +	return ret;
> +}
> +
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

pm_runtime_status_suspended() doesn't consider the runtime PM disable
state. There is also pm_runtime_suspended() and that should be correct
here.

Best regards,
Tomasz
