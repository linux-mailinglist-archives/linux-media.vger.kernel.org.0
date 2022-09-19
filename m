Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83DAD5BD4D7
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 20:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiISSjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 14:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiISSjj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 14:39:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B334D62DB
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 11:39:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34EF7499;
        Mon, 19 Sep 2022 20:39:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663612773;
        bh=pVvR7R/JY6bNnPl9cMnNsQ+WNnA/THNyNVnyfEyAj3g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r2SAUXpp7ElHsQ8J7TSUe+wbjiNx09HITmZJBlghZQ/AooImKgg95mdyx+JK3AaRB
         Co2yUNXUGwdUzsz/4m9KArW/cQJ6a0NQ6UmnFr1Ovh+yw5azAn6hiPJqzac3hjXyPZ
         T6B9MiKtBsisFzkMudWMZ+lf2p6lwWLaFlhchhX4=
Date:   Mon, 19 Sep 2022 21:39:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next v2] media: Switch to use dev_err_probe() helper
Message-ID: <Yyi3V67iuUzrSS6m@pendragon.ideasonboard.com>
References: <20220919155843.1097473-1-yangyingliang@huawei.com>
 <CANiDSCvDh9sZam0rtsX=U+DzDz9iQk+QeZWcNy8vRFx_rk7NQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvDh9sZam0rtsX=U+DzDz9iQk+QeZWcNy8vRFx_rk7NQQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 19, 2022 at 08:25:07PM +0200, Ricardo Ribalda wrote:
> Hi Yang
> 
> On Mon, 19 Sept 2022 at 18:02, Yang Yingliang <yangyingliang@huawei.com> wrote:
> >
> > In the probe path, dev_err() can be replaced with dev_err_probe()
> > which will check if error code is -EPROBE_DEFER.
> >
> > Reviewed-by: Sean Young <sean@mess.org>
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> FWIW: I originally reviewed only uvc

I liked the split-patches version better too, but that's no reason to
submit a v3 just for that.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > ---
> > v2:
> >   - Merge the patches in one patch.
> >   - s/replace/replaced in commit message.
> >   - Add '\n' in xilinx-csi2rxss.c and imx274.c
> >   - Add missing return value in media-dev.c
> > ---
> >  drivers/media/cec/platform/stm32/stm32-cec.c  |  9 +++----
> >  drivers/media/i2c/ad5820.c                    | 18 +++++--------
> >  drivers/media/i2c/imx274.c                    |  5 ++--
> >  drivers/media/i2c/tc358743.c                  |  9 +++----
> >  .../platform/mediatek/mdp/mtk_mdp_comp.c      |  5 ++--
> >  .../platform/samsung/exynos4-is/media-dev.c   |  4 +--
> >  drivers/media/platform/st/stm32/stm32-dcmi.c  | 27 +++++++------------
> >  drivers/media/platform/ti/omap3isp/isp.c      |  3 +--
> >  .../media/platform/xilinx/xilinx-csi2rxss.c   |  8 +++---
> >  drivers/media/rc/gpio-ir-recv.c               | 10 +++----
> >  drivers/media/rc/gpio-ir-tx.c                 |  9 +++----
> >  drivers/media/rc/ir-rx51.c                    |  9 ++-----
> >  drivers/media/usb/uvc/uvc_driver.c            |  9 +++----
> >  13 files changed, 41 insertions(+), 84 deletions(-)
> >
> > diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
> > index 40db7911b437..7b2db46a5722 100644
> > --- a/drivers/media/cec/platform/stm32/stm32-cec.c
> > +++ b/drivers/media/cec/platform/stm32/stm32-cec.c
> > @@ -288,12 +288,9 @@ static int stm32_cec_probe(struct platform_device *pdev)
> >                 return ret;
> >
> >         cec->clk_cec = devm_clk_get(&pdev->dev, "cec");
> > -       if (IS_ERR(cec->clk_cec)) {
> > -               if (PTR_ERR(cec->clk_cec) != -EPROBE_DEFER)
> > -                       dev_err(&pdev->dev, "Cannot get cec clock\n");
> > -
> > -               return PTR_ERR(cec->clk_cec);
> > -       }
> > +       if (IS_ERR(cec->clk_cec))
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(cec->clk_cec),
> > +                                    "Cannot get cec clock\n");
> >
> >         ret = clk_prepare(cec->clk_cec);
> >         if (ret) {
> > diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
> > index 516de278cc49..6a7f8ef9db05 100644
> > --- a/drivers/media/i2c/ad5820.c
> > +++ b/drivers/media/i2c/ad5820.c
> > @@ -301,21 +301,15 @@ static int ad5820_probe(struct i2c_client *client,
> >                 return -ENOMEM;
> >
> >         coil->vana = devm_regulator_get(&client->dev, "VANA");
> > -       if (IS_ERR(coil->vana)) {
> > -               ret = PTR_ERR(coil->vana);
> > -               if (ret != -EPROBE_DEFER)
> > -                       dev_err(&client->dev, "could not get regulator for vana\n");
> > -               return ret;
> > -       }
> > +       if (IS_ERR(coil->vana))
> > +               return dev_err_probe(&client->dev, PTR_ERR(coil->vana),
> > +                                    "could not get regulator for vana\n");
> >
> >         coil->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
> >                                                     GPIOD_OUT_LOW);
> > -       if (IS_ERR(coil->enable_gpio)) {
> > -               ret = PTR_ERR(coil->enable_gpio);
> > -               if (ret != -EPROBE_DEFER)
> > -                       dev_err(&client->dev, "could not get enable gpio\n");
> > -               return ret;
> > -       }
> > +       if (IS_ERR(coil->enable_gpio))
> > +               return dev_err_probe(&client->dev, PTR_ERR(coil->enable_gpio),
> > +                                    "could not get enable gpio\n");
> >
> >         mutex_init(&coil->power_lock);
> >
> > diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> > index a00761b1e18c..9219f3c9594b 100644
> > --- a/drivers/media/i2c/imx274.c
> > +++ b/drivers/media/i2c/imx274.c
> > @@ -2060,9 +2060,8 @@ static int imx274_probe(struct i2c_client *client)
> >         imx274->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> >                                                      GPIOD_OUT_HIGH);
> >         if (IS_ERR(imx274->reset_gpio)) {
> > -               if (PTR_ERR(imx274->reset_gpio) != -EPROBE_DEFER)
> > -                       dev_err(dev, "Reset GPIO not setup in DT");
> > -               ret = PTR_ERR(imx274->reset_gpio);
> > +               ret = dev_err_probe(dev, PTR_ERR(imx274->reset_gpio),
> > +                                   "Reset GPIO not setup in DT\n");
> >                 goto err_me;
> 
> Not sure I like the use of dev_err_probe here. We only save one line.
> Same goes for all the other cases where there is no "return dev_err_probe..."

It's not just about saving a line, dev_err_probe() also records the
cause of probe deferral (without printing the message) and makes it
available through debugfs.

> >         }
> >
> > diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> > index 200841c1f5cf..9197fa0b1bc2 100644
> > --- a/drivers/media/i2c/tc358743.c
> > +++ b/drivers/media/i2c/tc358743.c
> > @@ -1891,12 +1891,9 @@ static int tc358743_probe_of(struct tc358743_state *state)
> >         int ret;
> >
> >         refclk = devm_clk_get(dev, "refclk");
> > -       if (IS_ERR(refclk)) {
> > -               if (PTR_ERR(refclk) != -EPROBE_DEFER)
> > -                       dev_err(dev, "failed to get refclk: %ld\n",
> > -                               PTR_ERR(refclk));
> > -               return PTR_ERR(refclk);
> > -       }
> > +       if (IS_ERR(refclk))
> > +               return dev_err_probe(dev, PTR_ERR(refclk),
> > +                                    "failed to get refclk\n");
> >
> >         ep = of_graph_get_next_endpoint(dev->of_node, NULL);
> >         if (!ep) {
> > diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c
> > index 1e3833f1c9ae..ad5fab2d8bfa 100644
> > --- a/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c
> > +++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.c
> > @@ -52,9 +52,8 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
> >         for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
> >                 comp->clk[i] = of_clk_get(node, i);
> >                 if (IS_ERR(comp->clk[i])) {
> > -                       if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
> > -                               dev_err(dev, "Failed to get clock\n");
> > -                       ret = PTR_ERR(comp->clk[i]);
> > +                       ret = dev_err_probe(dev, PTR_ERR(comp->clk[i]),
> > +                                           "Failed to get clock\n");
> >                         goto put_dev;
> >                 }
> >
> > diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> > index 52b43ea04030..7a9d51b8bb4c 100644
> > --- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
> > +++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> > @@ -1473,9 +1473,7 @@ static int fimc_md_probe(struct platform_device *pdev)
> >
> >         pinctrl = devm_pinctrl_get(dev);
> >         if (IS_ERR(pinctrl)) {
> > -               ret = PTR_ERR(pinctrl);
> > -               if (ret != EPROBE_DEFER)
> > -                       dev_err(dev, "Failed to get pinctrl: %d\n", ret);
> > +               ret = dev_err_probe(dev, PTR_ERR(pinctrl), "Failed to get pinctrl\n");
> >                 goto err_clk;
> >         }
> >
> > diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> > index 2ca95ab2b0fe..ec138843d090 100644
> > --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> > +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> > @@ -1946,12 +1946,9 @@ static int dcmi_probe(struct platform_device *pdev)
> >                 return -ENOMEM;
> >
> >         dcmi->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > -       if (IS_ERR(dcmi->rstc)) {
> > -               if (PTR_ERR(dcmi->rstc) != -EPROBE_DEFER)
> > -                       dev_err(&pdev->dev, "Could not get reset control\n");
> > -
> > -               return PTR_ERR(dcmi->rstc);
> > -       }
> > +       if (IS_ERR(dcmi->rstc))
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(dcmi->rstc),
> > +                                    "Could not get reset control\n");
> >
> >         /* Get bus characteristics from devicetree */
> >         np = of_graph_get_next_endpoint(np, NULL);
> > @@ -2003,20 +2000,14 @@ static int dcmi_probe(struct platform_device *pdev)
> >         }
> >
> >         mclk = devm_clk_get(&pdev->dev, "mclk");
> > -       if (IS_ERR(mclk)) {
> > -               if (PTR_ERR(mclk) != -EPROBE_DEFER)
> > -                       dev_err(&pdev->dev, "Unable to get mclk\n");
> > -               return PTR_ERR(mclk);
> > -       }
> > +       if (IS_ERR(mclk))
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(mclk),
> > +                                    "Unable to get mclk\n");
> >
> >         chan = dma_request_chan(&pdev->dev, "tx");
> > -       if (IS_ERR(chan)) {
> > -               ret = PTR_ERR(chan);
> > -               if (ret != -EPROBE_DEFER)
> > -                       dev_err(&pdev->dev,
> > -                               "Failed to request DMA channel: %d\n", ret);
> > -               return ret;
> > -       }
> > +       if (IS_ERR(chan))
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(chan),
> > +                                    "Failed to request DMA channel\n");
> >
> >         dcmi->dma_max_burst = UINT_MAX;
> >         ret = dma_get_slave_caps(chan, &caps);
> > diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> > index a6052df9bb19..5d6867b8f197 100644
> > --- a/drivers/media/platform/ti/omap3isp/isp.c
> > +++ b/drivers/media/platform/ti/omap3isp/isp.c
> > @@ -1886,8 +1886,7 @@ static int isp_initialize_modules(struct isp_device *isp)
> >
> >         ret = omap3isp_ccp2_init(isp);
> >         if (ret < 0) {
> > -               if (ret != -EPROBE_DEFER)
> > -                       dev_err(isp->dev, "CCP2 initialization failed\n");
> > +               dev_err_probe(isp->dev, ret, "CCP2 initialization failed\n");
> >                 goto error_ccp2;
> >         }
> >
> > diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > index 29b53febc2e7..d8a23f18cfbc 100644
> > --- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > @@ -976,11 +976,9 @@ static int xcsi2rxss_probe(struct platform_device *pdev)
> >         /* Reset GPIO */
> >         xcsi2rxss->rst_gpio = devm_gpiod_get_optional(dev, "video-reset",
> >                                                       GPIOD_OUT_HIGH);
> > -       if (IS_ERR(xcsi2rxss->rst_gpio)) {
> > -               if (PTR_ERR(xcsi2rxss->rst_gpio) != -EPROBE_DEFER)
> > -                       dev_err(dev, "Video Reset GPIO not setup in DT");
> > -               return PTR_ERR(xcsi2rxss->rst_gpio);
> > -       }
> > +       if (IS_ERR(xcsi2rxss->rst_gpio))
> > +               return dev_err_probe(dev, PTR_ERR(xcsi2rxss->rst_gpio),
> > +                                    "Video Reset GPIO not setup in DT\n");
> >
> >         ret = xcsi2rxss_parse_of(xcsi2rxss);
> >         if (ret < 0)
> > diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
> > index 22e524b69806..8f1fff7af6c9 100644
> > --- a/drivers/media/rc/gpio-ir-recv.c
> > +++ b/drivers/media/rc/gpio-ir-recv.c
> > @@ -74,13 +74,9 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
> >                 return -ENOMEM;
> >
> >         gpio_dev->gpiod = devm_gpiod_get(dev, NULL, GPIOD_IN);
> > -       if (IS_ERR(gpio_dev->gpiod)) {
> > -               rc = PTR_ERR(gpio_dev->gpiod);
> > -               /* Just try again if this happens */
> > -               if (rc != -EPROBE_DEFER)
> > -                       dev_err(dev, "error getting gpio (%d)\n", rc);
> > -               return rc;
> > -       }
> > +       if (IS_ERR(gpio_dev->gpiod))
> > +               return dev_err_probe(dev, PTR_ERR(gpio_dev->gpiod),
> > +                                    "error getting gpio\n");
> >         gpio_dev->irq = gpiod_to_irq(gpio_dev->gpiod);
> >         if (gpio_dev->irq < 0)
> >                 return gpio_dev->irq;
> > diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
> > index d3063ddb472e..2b829c146db1 100644
> > --- a/drivers/media/rc/gpio-ir-tx.c
> > +++ b/drivers/media/rc/gpio-ir-tx.c
> > @@ -174,12 +174,9 @@ static int gpio_ir_tx_probe(struct platform_device *pdev)
> >                 return -ENOMEM;
> >
> >         gpio_ir->gpio = devm_gpiod_get(&pdev->dev, NULL, GPIOD_OUT_LOW);
> > -       if (IS_ERR(gpio_ir->gpio)) {
> > -               if (PTR_ERR(gpio_ir->gpio) != -EPROBE_DEFER)
> > -                       dev_err(&pdev->dev, "Failed to get gpio (%ld)\n",
> > -                               PTR_ERR(gpio_ir->gpio));
> > -               return PTR_ERR(gpio_ir->gpio);
> > -       }
> > +       if (IS_ERR(gpio_ir->gpio))
> > +               return dev_err_probe(&pdev->dev, PTR_ERR(gpio_ir->gpio),
> > +                                    "Failed to get gpio\n");
> >
> >         rcdev->priv = gpio_ir;
> >         rcdev->driver_name = DRIVER_NAME;
> > diff --git a/drivers/media/rc/ir-rx51.c b/drivers/media/rc/ir-rx51.c
> > index a3b145183260..85080c3d2053 100644
> > --- a/drivers/media/rc/ir-rx51.c
> > +++ b/drivers/media/rc/ir-rx51.c
> > @@ -231,13 +231,8 @@ static int ir_rx51_probe(struct platform_device *dev)
> >         struct rc_dev *rcdev;
> >
> >         pwm = pwm_get(&dev->dev, NULL);
> > -       if (IS_ERR(pwm)) {
> > -               int err = PTR_ERR(pwm);
> > -
> > -               if (err != -EPROBE_DEFER)
> > -                       dev_err(&dev->dev, "pwm_get failed: %d\n", err);
> > -               return err;
> > -       }
> > +       if (IS_ERR(pwm))
> > +               return dev_err_probe(&dev->dev, PTR_ERR(pwm), "pwm_get failed\n");
> >
> >         /* Use default, in case userspace does not set the carrier */
> >         ir_rx51.freq = DIV_ROUND_CLOSEST_ULL(pwm_get_period(pwm), NSEC_PER_SEC);
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 744051b52e12..94f84c3c4712 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1554,12 +1554,9 @@ static int uvc_gpio_parse(struct uvc_device *dev)
> >                 return PTR_ERR_OR_ZERO(gpio_privacy);
> >
> >         irq = gpiod_to_irq(gpio_privacy);
> > -       if (irq < 0) {
> > -               if (irq != EPROBE_DEFER)
> > -                       dev_err(&dev->udev->dev,
> > -                               "No IRQ for privacy GPIO (%d)\n", irq);
> > -               return irq;
> > -       }
> > +       if (irq < 0)
> > +               return dev_err_probe(&dev->udev->dev, irq,
> > +                                    "No IRQ for privacy GPIO\n");
> >
> >         unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> >         if (!unit)

-- 
Regards,

Laurent Pinchart
