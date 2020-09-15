Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AB126B05F
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 00:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgIOWIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 18:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727985AbgIOUUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 16:20:09 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66A8C06174A;
        Tue, 15 Sep 2020 13:19:50 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C992CC63FE; Tue, 15 Sep 2020 21:19:47 +0100 (BST)
Date:   Tue, 15 Sep 2020 21:19:47 +0100
From:   Sean Young <sean@mess.org>
To:     Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Message-ID: <20200915201947.GA4019@gofer.mess.org>
References: <20200915150202.24165-1-qiangqing.zhang@nxp.com>
 <20200915093342.GA24139@gofer.mess.org>
 <DB8PR04MB67951DE19DD876721093AED4E6200@DB8PR04MB6795.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB8PR04MB67951DE19DD876721093AED4E6200@DB8PR04MB6795.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joakim,

On Tue, Sep 15, 2020 at 10:55:17AM +0000, Joakim Zhang wrote:
> 
> Hi Sean,
> 
> Thanks a lot for your review.
> 
> > -----Original Message-----
> > From: Sean Young <sean@mess.org>
> > Sent: 2020年9月15日 17:34
> > To: Joakim Zhang <qiangqing.zhang@nxp.com>
> > Cc: mchehab@kernel.org; linux-media@vger.kernel.org;
> > linux-kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: Re: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
> > system
> > 
> > 
> > Hi Joakim,
> > 
> > Thanks for your patch, I think it looks good in principle but needs a few small
> > fixes.
> > 
> > On Tue, Sep 15, 2020 at 11:02:02PM +0800, Joakim Zhang wrote:
> > > GPIO IR receive is much rely on interrupt response, uneven interrupt
> > > latency will lead to incorrect timing, so the decoder fails to decode
> > > it. The issue is particularly acute on systems which supports cpuidle,
> > > dynamically disable and enable cpuidle can solve this problem to a
> > > great extent.
> > 
> > This is the first soc to be affected by this problem, and gpio-ir-recv has been
> > used on my systems. For example, the raspberry pi has cpu idle enabled and
> > does not suffer from this problem. There are many more; this driver has been
> > used on many arm devices, which will have cpuidle enabled.
> I have not noticed raspberry pi enabled cpu idle in Linux, could you point me where it is? Then I can have a look, whether it implements multiple idle or not, to see why it makes difference.

I just noticed that it not enabled on raspbian kernel, but it is enabled
on fedora:

https://src.fedoraproject.org/rpms/kernel/blob/master/f/kernel-armv7hl-fedora.config

When I use gpio-ir-recv with my own kernel and fedora kernel, there no
problems with gpio-ir-recv on this kernel.

> > > However, there is a downside to this approach, the measurement of
> > > header on the first frame may incorrect. Test on i.MX8M serials, when
> > > enable cpuidle, interrupt latency could be about 500us.
> > >
> > > With this patch:
> > > 1. has no side effect on non-cpuidle system.
> > > 2. latency is still much longer for the first gpio interrupt on
> > > cpuidle system, so the first frame may not be decoded. Generally, RC
> > > would transmit multiple frames at once press, we can sacrifice the first
> > frame.
> > >
> > > Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> > > ---
> > >  drivers/media/rc/gpio-ir-recv.c | 49
> > > ++++++++++++++++++++++++++++++++-
> > >  1 file changed, 48 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/rc/gpio-ir-recv.c
> > > b/drivers/media/rc/gpio-ir-recv.c index a20413008c3c..42c942ce98cd
> > > 100644
> > > --- a/drivers/media/rc/gpio-ir-recv.c
> > > +++ b/drivers/media/rc/gpio-ir-recv.c
> > > @@ -11,6 +11,8 @@
> > >  #include <linux/of.h>
> > >  #include <linux/of_gpio.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/pm_qos.h>
> > >  #include <linux/irq.h>
> > >  #include <media/rc-core.h>
> > >
> > > @@ -20,17 +22,36 @@ struct gpio_rc_dev {
> > >  	struct rc_dev *rcdev;
> > >  	struct gpio_desc *gpiod;
> > >  	int irq;
> > > +	struct pm_qos_request qos;
> > >  };
> > >
> > >  static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)  {
> > > -	int val;
> > > +	int ret, val;
> > >  	struct gpio_rc_dev *gpio_dev = dev_id;
> > > +	struct device *dev = gpio_dev->rcdev->dev.parent;
> > > +
> > > +	/*
> > > +	 * For cpuidle system:
> > 
> > For some cpuidle systems, not all. This is why this feature needs a device tree
> > option for enabling. Otherwise, it will negatively affect power usage on e.g.
> > raspberry pi.
> Yes, you are right. As you said, some cpu idle systems may not suffer such case, I will add a device tree property.
> 
> 
> > > +	 * Respond to interrupt taking more latency when cpu in idle.
> > > +	 * Invoke asynchronous pm runtime get from interrupt context,
> > > +	 * this may introduce a millisecond delay to call resume callback,
> > > +	 * where to disable cpuilde.
> > > +	 *
> > > +	 * Two issues lead to fail to decode first frame, one is latency to
> > > +	 * respond interupt, another is delay introduced by async api.
> > > +	 */
> > > +	ret = pm_runtime_get(dev);
> > > +	if (ret < 0)
> > > +		return IRQ_NONE;
> > 
> > If we end up here, we also abandon sending the IR to rc-core (below). I don't
> > think it should do that. It should call ir_raw_event_store_edge() always even if
> > it can't do the pm things.
> Make sense, I will remove this error check.
> 
> 
> > >
> > >  	val = gpiod_get_value(gpio_dev->gpiod);
> > >  	if (val >= 0)
> > >  		ir_raw_event_store_edge(gpio_dev->rcdev, val == 1);
> > >
> > > +	pm_runtime_mark_last_busy(dev);
> > > +	pm_runtime_put_autosuspend(dev);
> > > +
> > >  	return IRQ_HANDLED;
> > >  }
> > >
> > > @@ -92,6 +113,12 @@ static int gpio_ir_recv_probe(struct
> > > platform_device *pdev)
> > >
> > >  	platform_set_drvdata(pdev, gpio_dev);
> > >
> > > +
> > > +	pm_runtime_set_autosuspend_delay(dev, (rcdev->timeout / 1000 /
> > > +1000));
> > 
> > rcdev->timeout is in microseconds (since very recently), so this is wrong.
> What this meaning, is that rcdev->timeout woud change the unit, to be microseconds, not nanoseconds any more ?

See:

https://git.linuxtv.org/media_tree.git/commit/?id=528222d853f9283110f0118dd71d9f0ad686d586

> > Also, the timeout can be changed using the LIRC_SET_REC_TIMEOUT ioctl
> > (using ir-ctl -t in userspace). The autosuspend delay should be updated when
> > this happens. This can be done by implementing the s_timeout rcdev function.
> Make sense, could you point me where s_timeout funcition has implemented? So that I can refer to it, I am not familiar with this.

See:

https://git.linuxtv.org/media_tree.git/tree/drivers/media/rc/redrat3.c?id=528222d853f9283110f0118dd71d9f0ad686d586#n952


> 
> 
> BRs,
> Joakim
> > > +	pm_runtime_use_autosuspend(dev);
> > > +	pm_runtime_set_suspended(dev);
> > > +	pm_runtime_enable(dev);
> > > +
> > >  	return devm_request_irq(dev, gpio_dev->irq, gpio_ir_recv_irq,
> > >  				IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
> > >  				"gpio-ir-recv-irq", gpio_dev);
> > > @@ -122,9 +149,29 @@ static int gpio_ir_recv_resume(struct device *dev)
> > >  	return 0;
> > >  }
> > >
> > > +static int gpio_ir_recv_runtime_suspend(struct device *dev) {
> > > +	struct gpio_rc_dev *gpio_dev = dev_get_drvdata(dev);
> > > +
> > > +	cpu_latency_qos_remove_request(&gpio_dev->qos);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int gpio_ir_recv_runtime_resume(struct device *dev) {
> > > +	struct gpio_rc_dev *gpio_dev = dev_get_drvdata(dev);
> > > +
> > > +	cpu_latency_qos_add_request(&gpio_dev->qos, 0);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static const struct dev_pm_ops gpio_ir_recv_pm_ops = {
> > >  	.suspend        = gpio_ir_recv_suspend,
> > >  	.resume         = gpio_ir_recv_resume,
> > > +	.runtime_suspend = gpio_ir_recv_runtime_suspend,
> > > +	.runtime_resume  = gpio_ir_recv_runtime_resume,
> > >  };
> > >  #endif
> > >
> > > --
> > > 2.17.1
