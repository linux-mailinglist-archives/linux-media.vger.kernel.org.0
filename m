Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8443912D337
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2019 19:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfL3SN4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Dec 2019 13:13:56 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39130 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbfL3SN4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Dec 2019 13:13:56 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5E5DD28DF09
Message-ID: <f5e8afbbd46a25b752890880621be95971023f2e.camel@collabora.com>
Subject: Re: [PATCH v12 02/11] media: staging: rkisp1: add Rockchip ISP1
 base driver
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        gregkh@linuxfoundation.org, andrey.konovalov@linaro.org,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        joacim.zetterling@gmail.com, kernel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        linux-arm-kernel@lists.infradead.org,
        Jacob Chen <jacob2.chen@rock-chips.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Yichong Zhong <zyc@rock-chips.com>,
        Jacob Chen <cc@rock-chips.com>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>
Date:   Mon, 30 Dec 2019 15:13:41 -0300
In-Reply-To: <20191227200116.2612137-3-helen.koike@collabora.com>
References: <20191227200116.2612137-1-helen.koike@collabora.com>
         <20191227200116.2612137-3-helen.koike@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Just spotted a small thing.

On Fri, 2019-12-27 at 17:01 -0300, Helen Koike wrote:
[..]
> +static int rkisp1_probe(struct platform_device *pdev)
> +{
> +       struct device_node *node = pdev->dev.of_node;
> +       const struct rkisp1_match_data *clk_data;
> +       const struct of_device_id *match;
> +       struct device *dev = &pdev->dev;
> +       struct rkisp1_device *rkisp1;
> +       struct v4l2_device *v4l2_dev;
> +       unsigned int i;
> +       int ret, irq;
> +
> +       match = of_match_node(rkisp1_of_match, node);
> +       rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
> +       if (!rkisp1)
> +               return -ENOMEM;
> +
> +       dev_set_drvdata(dev, rkisp1);
> +       rkisp1->dev = dev;
> +
> +       rkisp1_debug_init(rkisp1);
> +
> +       rkisp1->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(rkisp1->base_addr))
> +               return PTR_ERR(rkisp1->base_addr);
> +
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> +
> +       ret = devm_request_irq(dev, irq, rkisp1_isr, IRQF_SHARED,
> +                              dev_driver_string(dev), dev);
> +       if (ret) {
> +               dev_err(dev, "request irq failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       rkisp1->irq = irq;
> +       clk_data = match->data;
> +
> +       for (i = 0; i < clk_data->size; i++)
> +               rkisp1->clks[i].id = clk_data->clks[i];
> +       ret = devm_clk_bulk_get(dev, clk_data->size, rkisp1->clks);
> +       if (ret)
> +               return ret;
> +       rkisp1->clk_size = clk_data->size;
> +
> +       pm_runtime_enable(&pdev->dev);
> +
> +       strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
> +               sizeof(rkisp1->media_dev.model));
> +       rkisp1->media_dev.dev = &pdev->dev;
> +       strscpy(rkisp1->media_dev.bus_info,
> +               "platform: " RKISP1_DRIVER_NAME,
> +               sizeof(rkisp1->media_dev.bus_info));
> +       media_device_init(&rkisp1->media_dev);
> +
> +       v4l2_dev = &rkisp1->v4l2_dev;
> +       v4l2_dev->mdev = &rkisp1->media_dev;
> +       strscpy(v4l2_dev->name, RKISP1_DRIVER_NAME, sizeof(v4l2_dev->name));
> +
> +       ret = v4l2_device_register(rkisp1->dev, &rkisp1->v4l2_dev);
> +       if (ret)
> +               return ret;
> +
> +       ret = media_device_register(&rkisp1->media_dev);
> +       if (ret) {
> +               dev_err(dev, "Failed to register media device: %d\n", ret);
> +               goto err_unreg_v4l2_dev;
> +       }
> +
> +       ret = rkisp1_entities_register(rkisp1);
> +       if (ret)
> +               goto err_unreg_media_dev;
> +
> +       return 0;
> +
> +err_unreg_media_dev:
> +       media_device_unregister(&rkisp1->media_dev);
> +err_unreg_v4l2_dev:
> +       v4l2_device_unregister(&rkisp1->v4l2_dev);
> +       pm_runtime_disable(&pdev->dev);

There's a missing call to debugfs_remove_recursive here.

> +       return ret;
> +}
> +
> +static int rkisp1_remove(struct platform_device *pdev)
> +{
> +       struct rkisp1_device *rkisp1 = platform_get_drvdata(pdev);
> +
> +       v4l2_async_notifier_unregister(&rkisp1->notifier);
> +       v4l2_async_notifier_cleanup(&rkisp1->notifier);
> +
> +       rkisp1_isp_unregister(rkisp1);
> +
> +       media_device_unregister(&rkisp1->media_dev);
> +       v4l2_device_unregister(&rkisp1->v4l2_dev);
> +
> +       pm_runtime_disable(&pdev->dev);
> +
> +       debugfs_remove_recursive(rkisp1->debug.debugfs_dir);
> +       return 0;
> +}
> +

Thanks,
Ezequiel


