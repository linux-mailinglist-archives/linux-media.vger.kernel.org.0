Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E51E66BC80
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 12:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjAPLLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 06:11:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjAPLL2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 06:11:28 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FEB659FA
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 03:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673867486; x=1705403486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hIFwWAsUhe3mHyufAdPdfkBxbIEnTu/rI0S6d7w5MAQ=;
  b=OKfUUuLiP9+CBrOo4WHcn/b68shqY61noGv62MKL0QvfjastueoUXJvo
   Ip3i0fcJNzjCWLCh+zitBFwNswai51wHYXErF3hHmZ4FU5c0XiieMr9xH
   bxaSy6A8NYuJufvJV49wYJoDjVERVJTmGtpl6zcfggbfGEG3zHh2QR6t3
   66Ra73F/sOJg6zqszq6NLFQYXMwZZb/HesGoIwmpP28hBUycU7Kg5DteH
   6eLQAGCH3t4f2xqRrELLfSRn1VrQyZH0nWJgjymy1JskzkmcesjxTvSBF
   LBRK+WmWfq4l9VdgYLx/U5T41v5g15qr9lnUpZlfY26602b7RZhwyhPZp
   g==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28447191"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jan 2023 12:11:24 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 16 Jan 2023 12:11:24 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 16 Jan 2023 12:11:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673867484; x=1705403484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hIFwWAsUhe3mHyufAdPdfkBxbIEnTu/rI0S6d7w5MAQ=;
  b=awPLEXw9wx3o06m6+sU8Thl/UQDDB7YWLH5AU1UoiRaKnFMcQjywlYl4
   OCEV/+LObpjijELH5pu52PiiijJgfL4LJZObPV9jpPxyXQctcobL/2bAp
   Ppq+eYwhYvgaahxrTrTHQPyFO7Dt5kJLvUq2vDf/QLDz5PLxJZbjCgvse
   aF0FhGPMzPrC6RMTMgt/gANXm7nN3jX7EcZgt6Cxvq24m6dfa4xtEtnQo
   T++HVkAFcqqt3gvv4v7lfLwis+DAeHvABT7VRb6/21C2uiAK48K0nERnJ
   ekgZIdp7cC1B8a+40yBp4xziaZKHYeB8BpXTM/D7w49eOX9oISFCVB8FC
   w==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28447190"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jan 2023 12:11:24 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id ADF61280056;
        Mon, 16 Jan 2023 12:11:24 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 13/17] media: i2c: imx290: Use runtime PM autosuspend
Date:   Mon, 16 Jan 2023 12:11:25 +0100
Message-ID: <9053636.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230114171802.13878-13-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-13-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

thanks for the update.

Am Samstag, 14. Januar 2023, 18:17:58 CET schrieb Laurent Pinchart:
> Use runtime PM autosuspend to avoid powering off the sensor during fast
> stop-reconfigure-restart cycles. This also fixes runtime PM handling in
> the probe function that didn't suspend the device, effectively leaving
> it resumed forever.
> 
> While at it, improve documentation of power management in probe() and
> remove().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Enable autosuspend before registering the subdev
> - Decrease the PM usage count after registering the subdev
> - Use pm_runtime_put_autosuspend() in imx290_set_ctrl()
> ---
>  drivers/media/i2c/imx290.c | 58 +++++++++++++++++++++++++++++---------
>  1 file changed, 45 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index b16fd76e0737..6a3e93c10fb1 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -631,7 +631,8 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
> 
> -	pm_runtime_put(imx290->dev);
> +	pm_runtime_mark_last_busy(imx290->dev);
> +	pm_runtime_put_autosuspend(imx290->dev);
> 
>  	return ret;
>  }
> @@ -832,12 +833,13 @@ static int imx290_set_stream(struct v4l2_subdev *sd,
> int enable) ret = imx290_start_streaming(imx290, state);
>  		if (ret) {
>  			dev_err(imx290->dev, "Start stream failed\n");
> -			pm_runtime_put(imx290->dev);
> +			pm_runtime_put_sync(imx290->dev);
>  			goto unlock;
>  		}
>  	} else {
>  		imx290_stop_streaming(imx290);
> -		pm_runtime_put(imx290->dev);
> +		pm_runtime_mark_last_busy(imx290->dev);
> +		pm_runtime_put_autosuspend(imx290->dev);
>  	}
> 
>  unlock:
> @@ -1274,33 +1276,59 @@ static int imx290_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
> 
> -	/* Initialize and register subdev. */
> +	/* Initialize the V4L2 subdev. */
>  	ret = imx290_subdev_init(imx290);
>  	if (ret)
>  		return ret;
> 
> -	ret = v4l2_async_register_subdev(&imx290->sd);
> -	if (ret < 0) {
> -		dev_err(dev, "Could not register v4l2 device\n");
> -		goto err_subdev;
> -	}
> -
> -	/* Power on the device to match runtime PM state below */
> +	/*
> +	 * Enable power management. The driver supports runtime PM, but 
needs to
> +	 * work when runtime PM is disabled in the kernel. To that end, 
power
> +	 * the sensor on manually here.
> +	 */
>  	ret = imx290_power_on(dev);
>  	if (ret < 0) {
>  		dev_err(dev, "Could not power on the device\n");
>  		goto err_subdev;
>  	}
> 
> +	/*
> +	 * Enable runtime PM with autosuspend. As the device has been 
powered
> +	 * manually, mark it as active, and increase the usage count without
> +	 * resuming the device.
> +	 */
>  	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
>  	pm_runtime_enable(dev);
> -	pm_runtime_idle(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	/*
> +	 * Finally, register the V4L2 subdev. This must be done after
> +	 * initializing everything as the subdev can be used immediately 
after
> +	 * being registered.
> +	 */
> +	ret = v4l2_async_register_subdev(&imx290->sd);
> +	if (ret < 0) {
> +		dev_err(dev, "Could not register v4l2 device\n");
> +		goto err_subdev;

I assume this should be err_pm. Otherwise
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards,
Alexander

> +	}
> +
> +	/*
> +	 * Decrease the PM usage count. The device will get suspended after 
the
> +	 * autosuspend delay, turning the power off.
> +	 */
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> 
>  	return 0;
> 
> +err_pm:
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
> +	imx290_power_off(dev);
>  err_subdev:
>  	imx290_subdev_cleanup(imx290);
> -
>  	return ret;
>  }
> 
> @@ -1312,6 +1340,10 @@ static void imx290_remove(struct i2c_client *client)
>  	v4l2_async_unregister_subdev(sd);
>  	imx290_subdev_cleanup(imx290);
> 
> +	/*
> +	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
> +	 * make sure to turn power off manually.
> +	 */
>  	pm_runtime_disable(imx290->dev);
>  	if (!pm_runtime_status_suspended(imx290->dev))
>  		imx290_power_off(imx290->dev);




