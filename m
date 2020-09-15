Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0A926A24A
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 11:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgIOJdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 05:33:45 -0400
Received: from gofer.mess.org ([88.97.38.141]:56753 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgIOJdo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 05:33:44 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 08B51C6366; Tue, 15 Sep 2020 10:33:42 +0100 (BST)
Date:   Tue, 15 Sep 2020 10:33:42 +0100
From:   Sean Young <sean@mess.org>
To:     Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Message-ID: <20200915093342.GA24139@gofer.mess.org>
References: <20200915150202.24165-1-qiangqing.zhang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915150202.24165-1-qiangqing.zhang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi Joakim,

Thanks for your patch, I think it looks good in principle but needs a
few small fixes.

On Tue, Sep 15, 2020 at 11:02:02PM +0800, Joakim Zhang wrote:
> GPIO IR receive is much rely on interrupt response, uneven interrupt
> latency will lead to incorrect timing, so the decoder fails to decode
> it. The issue is particularly acute on systems which supports
> cpuidle, dynamically disable and enable cpuidle can solve this problem
> to a great extent.

This is the first soc to be affected by this problem, and gpio-ir-recv
has been used on my systems. For example, the raspberry pi has cpu idle
enabled and does not suffer from this problem. There are many more; this
driver has been used on many arm devices, which will have cpuidle enabled.

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
> 
> Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> ---
>  drivers/media/rc/gpio-ir-recv.c | 49 ++++++++++++++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
> index a20413008c3c..42c942ce98cd 100644
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
> @@ -20,17 +22,36 @@ struct gpio_rc_dev {
>  	struct rc_dev *rcdev;
>  	struct gpio_desc *gpiod;
>  	int irq;
> +	struct pm_qos_request qos;
>  };
>  
>  static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
>  {
> -	int val;
> +	int ret, val;
>  	struct gpio_rc_dev *gpio_dev = dev_id;
> +	struct device *dev = gpio_dev->rcdev->dev.parent;
> +
> +	/*
> +	 * For cpuidle system:

For some cpuidle systems, not all. This is why this feature needs a
device tree option for enabling. Otherwise, it will negatively affect
power usage on e.g. raspberry pi.

> +	 * Respond to interrupt taking more latency when cpu in idle.
> +	 * Invoke asynchronous pm runtime get from interrupt context,
> +	 * this may introduce a millisecond delay to call resume callback,
> +	 * where to disable cpuilde.
> +	 *
> +	 * Two issues lead to fail to decode first frame, one is latency to
> +	 * respond interupt, another is delay introduced by async api.
> +	 */
> +	ret = pm_runtime_get(dev);
> +	if (ret < 0)
> +		return IRQ_NONE;

If we end up here, we also abandon sending the IR to rc-core (below). I
don't think it should do that. It should call ir_raw_event_store_edge()
always even if it can't do the pm things.

>  
>  	val = gpiod_get_value(gpio_dev->gpiod);
>  	if (val >= 0)
>  		ir_raw_event_store_edge(gpio_dev->rcdev, val == 1);
>  
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -92,6 +113,12 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, gpio_dev);
>  
> +
> +	pm_runtime_set_autosuspend_delay(dev, (rcdev->timeout / 1000 / 1000));

rcdev->timeout is in microseconds (since very recently), so this is wrong.
Also, the timeout can be changed using the LIRC_SET_REC_TIMEOUT ioctl
(using ir-ctl -t in userspace). The autosuspend delay should be updated
when this happens. This can be done by implementing the s_timeout rcdev
function.

> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_enable(dev);
> +
>  	return devm_request_irq(dev, gpio_dev->irq, gpio_ir_recv_irq,
>  				IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
>  				"gpio-ir-recv-irq", gpio_dev);
> @@ -122,9 +149,29 @@ static int gpio_ir_recv_resume(struct device *dev)
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
