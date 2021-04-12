Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE2B35C8E3
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 16:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240662AbhDLOhv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 10:37:51 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:29427 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237806AbhDLOhu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 10:37:50 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A4C65240018;
        Mon, 12 Apr 2021 14:37:30 +0000 (UTC)
Date:   Mon, 12 Apr 2021 16:38:09 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen.Hristev@microchip.com
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 30/30] media: atmel: atmel-isc: add microchip-xisc
 driver
Message-ID: <20210412143809.tfw37xwt64oyaue3@uno.localdomain>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
 <20210405155105.162529-31-eugen.hristev@microchip.com>
 <a22c2065-1a79-8a96-2b54-a2e28fa08b8a@microchip.com>
 <20210412134157.4cqva5thylmiqds7@uno.localdomain>
 <52f03c2b-01bd-0de3-83c5-204e6b577b9d@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52f03c2b-01bd-0de3-83c5-204e6b577b9d@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugene

On Mon, Apr 12, 2021 at 02:15:32PM +0000, Eugen.Hristev@microchip.com wrote:
> On 4/12/21 4:41 PM, Jacopo Mondi wrote:
> > Hi Eugene,
> >
> > On Mon, Apr 12, 2021 at 12:37:41PM +0000, Eugen.Hristev@microchip.com wrote:
> >>> +static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
> >>> +{
> >>> +   struct device_node *np = dev->of_node;
> >>> +   struct device_node *epn = NULL;
> >>> +   struct isc_subdev_entity *subdev_entity;
> >>> +   unsigned int flags;
> >>> +   int ret;
> >>> +   bool mipi_mode;
> >>> +
> >>> +   INIT_LIST_HEAD(&isc->subdev_entities);
> >>> +
> >>> +   mipi_mode = of_property_read_bool(np, "microchip,mipi-mode");
> >>> +
> >>> +   while (1) {
> >>> +           struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
> >>> +
> >>> +           epn = of_graph_get_next_endpoint(np, epn);
> >>> +           if (!epn)
> >>> +                   return 0;
> >>> +
> >>> +           ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
> >>> +                                            &v4l2_epn);
> >>> +           if (ret) {
> >>> +                   ret = -EINVAL;
> >>> +                   dev_err(dev, "Could not parse the endpoint\n");
> >>> +                   break;
> >>> +           }
> >>> +
> >>> +           subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
> >>> +                                        GFP_KERNEL);
> >>> +           if (!subdev_entity) {
> >>> +                   ret = -ENOMEM;
> >>> +                   break;
> >>> +           }
> >>> +           subdev_entity->epn = epn;
> >>> +
> >>> +           flags = v4l2_epn.bus.parallel.flags;
> >>> +
> >>> +           if (flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> >>> +                   subdev_entity->pfe_cfg0 = ISC_PFE_CFG0_HPOL_LOW;
> >>> +
> >>> +           if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> >>> +                   subdev_entity->pfe_cfg0 |= ISC_PFE_CFG0_VPOL_LOW;
> >>> +
> >>> +           if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> >>> +                   subdev_entity->pfe_cfg0 |= ISC_PFE_CFG0_PPOL_LOW;
> >>> +
> >>> +           if (v4l2_epn.bus_type == V4L2_MBUS_BT656)
> >>> +                   subdev_entity->pfe_cfg0 |= ISC_PFE_CFG0_CCIR_CRC |
> >>> +                                   ISC_PFE_CFG0_CCIR656;
> >>
> >> Hi Jacopo,
> >>
> >> If I use the bus-type property for the 'port' , do I actually have to
> >> change something here ?
> >
> > You can set bus_type to the desired type, if it doesn't match the
> > 'bus-type' property you will have an immediate error and a more strict
> > check on the properties.
> >
> > You would likely:
> >
> >          v4l2_epn.bus_type = V4L2_MBUS_PARALLEL;
> >          ret = v4l2_fwnode_endpoint_parse()
> >          if (!ret) {
> >                  /* It's parallel */
> >          } else {
> >                  v4l2_epn.bus_type = V4L2_MBUS_BT656;
> >                  ret = v4l2_fwnode_endpoint_parse()
> >                  if (ret) {
> >                          /* Unsupported bus type: error out. */
> >                  }
> >
> >                  /* It's BT656 */
> >          }
>
> if the v4l2_fwnode_endpoint_parse will already fill in the
> v4l2_epn.bus_type based on what is found in the 'bus-type' , why do I
> need to do this assumption-fail-assumption-fail scenario ?

Because you would know exactly what bus type you're parsing, as
v4l2_fwnode_endpoint_parse() would make sure the type you intend to
parse matches what the endpoint reports

	if (vep->bus_type != V4L2_MBUS_UNKNOWN) {
		if (mbus_type != V4L2_MBUS_UNKNOWN &&
		    vep->bus_type != mbus_type) {
			pr_debug("expecting bus type %s\n",
				 v4l2_fwnode_mbus_type_to_string(vep->bus_type));
			return -ENXIO;
		}

I guess this is mostly useful if you want to specify default
values the v4l2_fwnode_endpoint. If you go with autoguessing, a
parallel endpoint without polarities flag specified can be identified
as BT656 if I'm not mistaken.

> Can't I simply check the value of v4l2_epn.bus_type , as I am doing it
> already ?

Only if you make bus-type required in DTS, then you can specify here
bus_type = 0 like you're doing and rely on
v4l2_fwnode_endpoint_parse() to set it to what it has found in DTS.

Otherwise you rely on auto-guessing, if I got this right.

Thanks
   j

>
> >
> > Not the greatest API, but it's more robust.
> >
> >> the v4l2_epn.bus_type won't be set automatically ? by the endpoint
> >> parser I mean.
> >
> > Yes, that's what auto-discovery is, the endpoint parser tries to
> > deduce the bus type from the properties that are there specified. It
> > works, but leaves quite some ambiguity between ie PARALLEL and BT656
> > as some polarities might not be necessarily specified even for
> > PARALLEL bus types.
> >
> > As I've said, there's still plenty of code that relies on
> > auto-discovery so I don't think this is blocking, also because making
> > bus-type mandatory on existing DTS is quite painful. Since this is a
> > new DTS you can consider this solution if you want to.
> >
> > Thanks
> >     j
> >
> >>
> >> Thanks,
> >> Eugen
> >>
> >>> +
> >>> +           if (mipi_mode)
> >>> +                   subdev_entity->pfe_cfg0 |= ISC_PFE_CFG0_MIPI;
> >>> +
> >>> +           list_add_tail(&subdev_entity->list, &isc->subdev_entities);
> >>> +   }
> >>> +   of_node_put(epn);
> >>> +
> >>> +   return ret;
> >>> +}
> >>> +
> >>> +static int microchip_xisc_probe(struct platform_device *pdev)
> >>> +{
> >>> +   struct device *dev = &pdev->dev;
> >>> +   struct isc_device *isc;
> >>> +   struct resource *res;
> >>> +   void __iomem *io_base;
> >>> +   struct isc_subdev_entity *subdev_entity;
> >>> +   int irq;
> >>> +   int ret;
> >>> +   u32 ver;
> >>> +
> >>> +   isc = devm_kzalloc(dev, sizeof(*isc), GFP_KERNEL);
> >>> +   if (!isc)
> >>> +           return -ENOMEM;
> >>> +
> >>> +   platform_set_drvdata(pdev, isc);
> >>> +   isc->dev = dev;
> >>> +
> >>> +   res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>> +   io_base = devm_ioremap_resource(dev, res);
> >>> +   if (IS_ERR(io_base))
> >>> +           return PTR_ERR(io_base);
> >>> +
> >>> +   isc->regmap = devm_regmap_init_mmio(dev, io_base, &isc_regmap_config);
> >>> +   if (IS_ERR(isc->regmap)) {
> >>> +           ret = PTR_ERR(isc->regmap);
> >>> +           dev_err(dev, "failed to init register map: %d\n", ret);
> >>> +           return ret;
> >>> +   }
> >>> +
> >>> +   irq = platform_get_irq(pdev, 0);
> >>> +   if (irq < 0)
> >>> +           return irq;
> >>> +
> >>> +   ret = devm_request_irq(dev, irq, isc_interrupt, 0,
> >>> +                          "microchip-sama7g5-xisc", isc);
> >>> +   if (ret < 0) {
> >>> +           dev_err(dev, "can't register ISR for IRQ %u (ret=%i)\n",
> >>> +                   irq, ret);
> >>> +           return ret;
> >>> +   }
> >>> +
> >>> +   isc->gamma_table = isc_sama7g5_gamma_table;
> >>> +   isc->gamma_max = 0;
> >>> +
> >>> +   isc->max_width = ISC_SAMA7G5_MAX_SUPPORT_WIDTH;
> >>> +   isc->max_height = ISC_SAMA7G5_MAX_SUPPORT_HEIGHT;
> >>> +
> >>> +   isc->config_dpc = isc_sama7g5_config_dpc;
> >>> +   isc->config_csc = isc_sama7g5_config_csc;
> >>> +   isc->config_cbc = isc_sama7g5_config_cbc;
> >>> +   isc->config_cc = isc_sama7g5_config_cc;
> >>> +   isc->config_gam = isc_sama7g5_config_gam;
> >>> +   isc->config_rlp = isc_sama7g5_config_rlp;
> >>> +   isc->config_ctrls = isc_sama7g5_config_ctrls;
> >>> +
> >>> +   isc->adapt_pipeline = isc_sama7g5_adapt_pipeline;
> >>> +
> >>> +   isc->offsets.csc = ISC_SAMA7G5_CSC_OFFSET;
> >>> +   isc->offsets.cbc = ISC_SAMA7G5_CBC_OFFSET;
> >>> +   isc->offsets.sub422 = ISC_SAMA7G5_SUB422_OFFSET;
> >>> +   isc->offsets.sub420 = ISC_SAMA7G5_SUB420_OFFSET;
> >>> +   isc->offsets.rlp = ISC_SAMA7G5_RLP_OFFSET;
> >>> +   isc->offsets.his = ISC_SAMA7G5_HIS_OFFSET;
> >>> +   isc->offsets.dma = ISC_SAMA7G5_DMA_OFFSET;
> >>> +   isc->offsets.version = ISC_SAMA7G5_VERSION_OFFSET;
> >>> +   isc->offsets.his_entry = ISC_SAMA7G5_HIS_ENTRY_OFFSET;
> >>> +
> >>> +   isc->controller_formats = sama7g5_controller_formats;
> >>> +   isc->controller_formats_size = ARRAY_SIZE(sama7g5_controller_formats);
> >>> +   isc->formats_list = sama7g5_formats_list;
> >>> +   isc->formats_list_size = ARRAY_SIZE(sama7g5_formats_list);
> >>> +
> >>> +   /* sama7g5-isc RAM access port is full AXI4 - 32 bits per beat */
> >>> +   isc->dcfg = ISC_DCFG_YMBSIZE_BEATS32 | ISC_DCFG_CMBSIZE_BEATS32;
> >>> +
> >>> +   ret = isc_pipeline_init(isc);
> >>> +   if (ret)
> >>> +           return ret;
> >>> +
> >>> +   isc->hclock = devm_clk_get(dev, "hclock");
> >>> +   if (IS_ERR(isc->hclock)) {
> >>> +           ret = PTR_ERR(isc->hclock);
> >>> +           dev_err(dev, "failed to get hclock: %d\n", ret);
> >>> +           return ret;
> >>> +   }
> >>> +
> >>> +   ret = clk_prepare_enable(isc->hclock);
> >>> +   if (ret) {
> >>> +           dev_err(dev, "failed to enable hclock: %d\n", ret);
> >>> +           return ret;
> >>> +   }
> >>> +
> >>> +   ret = isc_clk_init(isc);
> >>> +   if (ret) {
> >>> +           dev_err(dev, "failed to init isc clock: %d\n", ret);
> >>> +           goto unprepare_hclk;
> >>> +   }
> >>> +
> >>> +   isc->ispck = isc->isc_clks[ISC_ISPCK].clk;
> >>> +
> >>> +   ret = clk_prepare_enable(isc->ispck);
> >>> +   if (ret) {
> >>> +           dev_err(dev, "failed to enable ispck: %d\n", ret);
> >>> +           goto unprepare_hclk;
> >>> +   }
> >>> +
> >>> +   /* ispck should be greater or equal to hclock */
> >>> +   ret = clk_set_rate(isc->ispck, clk_get_rate(isc->hclock));
> >>> +   if (ret) {
> >>> +           dev_err(dev, "failed to set ispck rate: %d\n", ret);
> >>> +           goto unprepare_clk;
> >>> +   }
> >>> +
> >>> +   ret = v4l2_device_register(dev, &isc->v4l2_dev);
> >>> +   if (ret) {
> >>> +           dev_err(dev, "unable to register v4l2 device.\n");
> >>> +           goto unprepare_clk;
> >>> +   }
> >>> +
> >>> +   ret = xisc_parse_dt(dev, isc);
> >>> +   if (ret) {
> >>> +           dev_err(dev, "fail to parse device tree\n");
> >>> +           goto unregister_v4l2_device;
> >>> +   }
> >>> +
> >>> +   if (list_empty(&isc->subdev_entities)) {
> >>> +           dev_err(dev, "no subdev found\n");
> >>> +           ret = -ENODEV;
> >>> +           goto unregister_v4l2_device;
> >>> +   }
> >>> +
> >>> +   list_for_each_entry(subdev_entity, &isc->subdev_entities, list) {
> >>> +           struct v4l2_async_subdev *asd;
> >>> +
> >>> +           v4l2_async_notifier_init(&subdev_entity->notifier);
> >>> +
> >>> +           asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> >>> +                                   &subdev_entity->notifier,
> >>> +                                   of_fwnode_handle(subdev_entity->epn),
> >>> +                                   struct v4l2_async_subdev);
> >>> +
> >>> +           of_node_put(subdev_entity->epn);
> >>> +           subdev_entity->epn = NULL;
> >>> +
> >>> +           if (IS_ERR(asd)) {
> >>> +                   ret = PTR_ERR(asd);
> >>> +                   goto cleanup_subdev;
> >>> +           }
> >>> +
> >>> +           subdev_entity->notifier.ops = &isc_async_ops;
> >>> +
> >>> +           ret = v4l2_async_notifier_register(&isc->v4l2_dev,
> >>> +                                              &subdev_entity->notifier);
> >>> +           if (ret) {
> >>> +                   dev_err(dev, "fail to register async notifier\n");
> >>> +                   goto cleanup_subdev;
> >>> +           }
> >>> +
> >>> +           if (video_is_registered(&isc->video_dev))
> >>> +                   break;
> >>> +   }
> >>> +
> >>> +   pm_runtime_set_active(dev);
> >>> +   pm_runtime_enable(dev);
> >>> +   pm_request_idle(dev);
> >>> +
> >>> +   regmap_read(isc->regmap, ISC_VERSION + isc->offsets.version, &ver);
> >>> +   dev_info(dev, "Microchip XISC version %x\n", ver);
> >>> +
> >>> +   return 0;
> >>> +
> >>> +cleanup_subdev:
> >>> +   isc_subdev_cleanup(isc);
> >>> +
> >>> +unregister_v4l2_device:
> >>> +   v4l2_device_unregister(&isc->v4l2_dev);
> >>> +
> >>> +unprepare_clk:
> >>> +   clk_disable_unprepare(isc->ispck);
> >>> +unprepare_hclk:
> >>> +   clk_disable_unprepare(isc->hclock);
> >>> +
> >>> +   isc_clk_cleanup(isc);
> >>> +
> >>> +   return ret;
> >>> +}
> >>> +
> >>> +static int microchip_xisc_remove(struct platform_device *pdev)
> >>> +{
> >>> +   struct isc_device *isc = platform_get_drvdata(pdev);
> >>> +
> >>> +   pm_runtime_disable(&pdev->dev);
> >>> +
> >>> +   isc_subdev_cleanup(isc);
> >>> +
> >>> +   v4l2_device_unregister(&isc->v4l2_dev);
> >>> +
> >>> +   clk_disable_unprepare(isc->ispck);
> >>> +   clk_disable_unprepare(isc->hclock);
> >>> +
> >>> +   isc_clk_cleanup(isc);
> >>> +
> >>> +   return 0;
> >>> +}
> >>> +
> >>> +static int __maybe_unused xisc_runtime_suspend(struct device *dev)
> >>> +{
> >>> +   struct isc_device *isc = dev_get_drvdata(dev);
> >>> +
> >>> +   clk_disable_unprepare(isc->ispck);
> >>> +   clk_disable_unprepare(isc->hclock);
> >>> +
> >>> +   return 0;
> >>> +}
> >>> +
> >>> +static int __maybe_unused xisc_runtime_resume(struct device *dev)
> >>> +{
> >>> +   struct isc_device *isc = dev_get_drvdata(dev);
> >>> +   int ret;
> >>> +
> >>> +   ret = clk_prepare_enable(isc->hclock);
> >>> +   if (ret)
> >>> +           return ret;
> >>> +
> >>> +   ret = clk_prepare_enable(isc->ispck);
> >>> +   if (ret)
> >>> +           clk_disable_unprepare(isc->hclock);
> >>> +
> >>> +   return ret;
> >>> +}
> >>> +
> >>> +static const struct dev_pm_ops microchip_xisc_dev_pm_ops = {
> >>> +   SET_RUNTIME_PM_OPS(xisc_runtime_suspend, xisc_runtime_resume, NULL)
> >>> +};
> >>> +
> >>> +static const struct of_device_id microchip_xisc_of_match[] = {
> >>> +   { .compatible = "microchip,sama7g5-isc" },
> >>> +   { }
> >>> +};
> >>> +MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
> >>> +
> >>> +static struct platform_driver microchip_xisc_driver = {
> >>> +   .probe  = microchip_xisc_probe,
> >>> +   .remove = microchip_xisc_remove,
> >>> +   .driver = {
> >>> +           .name           = "microchip-sama7g5-xisc",
> >>> +           .pm             = &microchip_xisc_dev_pm_ops,
> >>> +           .of_match_table = of_match_ptr(microchip_xisc_of_match),
> >>> +   },
> >>> +};
> >>> +
> >>> +module_platform_driver(microchip_xisc_driver);
> >>> +
> >>> +MODULE_AUTHOR("Eugen Hristev <eugen.hristev@microchip.com>");
> >>> +MODULE_DESCRIPTION("The V4L2 driver for Microchip-XISC");
> >>> +MODULE_LICENSE("GPL v2");
> >>> +MODULE_SUPPORTED_DEVICE("video");
> >>>
> >>
>
