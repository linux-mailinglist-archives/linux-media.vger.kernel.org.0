Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C32273EB9
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 11:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgIVJmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 05:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgIVJmG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 05:42:06 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C509C061755;
        Tue, 22 Sep 2020 02:42:05 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A0C4B11A001; Tue, 22 Sep 2020 10:41:57 +0100 (BST)
Date:   Tue, 22 Sep 2020 10:41:57 +0100
From:   Sean Young <sean@mess.org>
To:     Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH V2 2/2] media: rc: gpio-ir-recv: add QoS support for
 cpuidle system
Message-ID: <20200922094157.GA14307@gofer.mess.org>
References: <20200918181717.24056-1-qiangqing.zhang@nxp.com>
 <20200918181717.24056-3-qiangqing.zhang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918181717.24056-3-qiangqing.zhang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joakim,

Thanks for your updated patch.

On Sat, Sep 19, 2020 at 02:17:17AM +0800, Joakim Zhang wrote:
> GPIO IR receive is much rely on interrupt response, uneven interrupt
> latency will lead to incorrect timing, so the decoder fails to decode
> it. The issue is particularly acute on some systems which support
> cpuidle, not all, dynamically disable and enable cpuidle can solve this
> problem to a great extent.
> 
> However, there is a downside to this approach, the measurement of header
> on the first frame may incorrect. Test on i.MX8M serials, when enable
> cpuidle, interrupt latency could be about 500us.
> 
> With this patch:
> 1. has no side effect on non-cpuidle system.
> 2. latency is still much longer for the first gpio interrupt on cpuidle
> system, so the first frame may not be decoded. Generally, RC would transmit
> multiple frames at once press, we can sacrifice the first frame.
> 3. add "linux,autosuspend-period" property in device tree if you also
> suffer this cpuidle issue.
> 
> Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> ---
> ChangeLogs:
> V1->V2:
> 	* set autosuspend delay time via device tree.
> ---
>  drivers/media/rc/gpio-ir-recv.c | 50 +++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
> index a20413008c3c..63cf8290eb19 100644
> --- a/drivers/media/rc/gpio-ir-recv.c
> +++ b/drivers/media/rc/gpio-ir-recv.c
> @@ -11,6 +11,8 @@
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pm_qos.h>
>  #include <linux/irq.h>
>  #include <media/rc-core.h>
>  
> @@ -20,17 +22,35 @@ struct gpio_rc_dev {
>  	struct rc_dev *rcdev;
>  	struct gpio_desc *gpiod;
>  	int irq;
> +	struct device *dev;
> +	struct pm_qos_request qos;
>  };
>  
>  static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
>  {
>  	int val;
>  	struct gpio_rc_dev *gpio_dev = dev_id;
> +	struct device *dev = gpio_dev->dev;
> +
> +	/*
> +	 * For some cpuidle systems, not all:
> +	 * Respond to interrupt taking more latency when cpu in idle.
> +	 * Invoke asynchronous pm runtime get from interrupt context,
> +	 * this may introduce a millisecond delay to call resume callback,
> +	 * where to disable cpuilde.
> +	 *
> +	 * Two issues lead to fail to decode first frame, one is latency to
> +	 * respond to interrupt, another is delay introduced by async api.
> +	 */
> +	pm_runtime_get(dev);
>  
>  	val = gpiod_get_value(gpio_dev->gpiod);
>  	if (val >= 0)
>  		ir_raw_event_store_edge(gpio_dev->rcdev, val == 1);
>  
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +

I've dusted off my rpi and tried to see if it fails with cpuidle enabled.
As far as I can see, it always works fine. So, my only concern is that
there is a bunch of pm busy work done here for devices that do not need it,
including spinlocks, ktime. etc.

You could rename the dev field of gpio_rc_dev to pmdev and only do this
work if pm_dev != NULL. Or some other mechanism of doing this work
conditionally.

Having said that I'm not entirely sure this will make much of a difference.

>  	return IRQ_HANDLED;
>  }
>  
> @@ -40,6 +60,7 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	struct gpio_rc_dev *gpio_dev;
>  	struct rc_dev *rcdev;
> +	u32 period = 0;
>  	int rc;
>  
>  	if (!np)
> @@ -83,6 +104,7 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
>  		rcdev->map_name = RC_MAP_EMPTY;
>  
>  	gpio_dev->rcdev = rcdev;
> +	gpio_dev->dev = dev;
>  
>  	rc = devm_rc_register_device(dev, rcdev);
>  	if (rc < 0) {
> @@ -90,6 +112,14 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
>  		return rc;
>  	}
>  
> +	of_property_read_u32(np, "linux,autosuspend-period", &period);
> +	if (period) {
> +		pm_runtime_set_autosuspend_delay(dev, period);
> +		pm_runtime_use_autosuspend(dev);
> +		pm_runtime_set_suspended(dev);
> +		pm_runtime_enable(dev);
> +	}
> +
>  	platform_set_drvdata(pdev, gpio_dev);
>  
>  	return devm_request_irq(dev, gpio_dev->irq, gpio_ir_recv_irq,
> @@ -122,9 +152,29 @@ static int gpio_ir_recv_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int gpio_ir_recv_runtime_suspend(struct device *dev)
> +{
> +	struct gpio_rc_dev *gpio_dev = dev_get_drvdata(dev);
> +
> +	cpu_latency_qos_remove_request(&gpio_dev->qos);
> +
> +	return 0;
> +}
> +
> +static int gpio_ir_recv_runtime_resume(struct device *dev)
> +{
> +	struct gpio_rc_dev *gpio_dev = dev_get_drvdata(dev);
> +
> +	cpu_latency_qos_add_request(&gpio_dev->qos, 0);
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops gpio_ir_recv_pm_ops = {
>  	.suspend        = gpio_ir_recv_suspend,
>  	.resume         = gpio_ir_recv_resume,
> +	.runtime_suspend = gpio_ir_recv_runtime_suspend,
> +	.runtime_resume  = gpio_ir_recv_runtime_resume,
>  };
>  #endif
>  
> -- 
> 2.17.1
