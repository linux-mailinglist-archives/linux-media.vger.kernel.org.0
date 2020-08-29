Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FD925672C
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 13:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgH2LmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Aug 2020 07:42:23 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:51464 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728040AbgH2Lkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Aug 2020 07:40:31 -0400
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 0EA363A2508
        for <linux-media@vger.kernel.org>; Sat, 29 Aug 2020 11:18:11 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 59024240006;
        Sat, 29 Aug 2020 11:16:43 +0000 (UTC)
Date:   Sat, 29 Aug 2020 13:20:28 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 04/34] media: bcm2835-unicam: Driver for CCP2/CSI2
 camera interface
Message-ID: <20200829112028.6sjepiomfudbfkno@uno.localdomain>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200504092611.9798-5-laurent.pinchart@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Dave, Naush,

On Mon, May 04, 2020 at 12:25:41PM +0300, Laurent Pinchart wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
>
> Add a driver for the Unicam camera receiver block on BCM283x processors.
> Compared to the bcm2835-camera driver present in staging, this driver
> handles the Unicam block only (CSI-2 receiver), and doesn't depend on
> the VC4 firmware running on the VPU.
>
> The commit is made up of a series of changes cherry-picked from the
> rpi-5.4.y branch of https://github.com/raspberrypi/linux/ with
> additional enhancements, forward-ported to the mainline kernel.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>
> - Re-fetch mbus code from subdev on a g_fmt call
> - Group all ioctl disabling together
> - Fix reference counting in unicam_open
> - Add support for VIDIOC_[S|G]_SELECTION
> ---

[snip]

> +
> +static int of_unicam_connect_subdevs(struct unicam_device *dev)
> +{
> +	struct platform_device *pdev = dev->pdev;
> +	struct v4l2_fwnode_endpoint ep = { 0 };
> +	struct device_node *ep_node;
> +	struct device_node *sensor_node;
> +	unsigned int lane;
> +	int ret = -EINVAL;
> +
> +	if (of_property_read_u32(pdev->dev.of_node, "brcm,num-data-lanes",
> +				 &dev->max_data_lanes) < 0) {
> +		unicam_err(dev, "number of data lanes not set\n");
> +		return -EINVAL;
> +	}

mmm, this seems like a good use case for the newly introduced
get_mbus_config pad operation, isn't it ?

We could drop the custom "brcm,num-data-lanes" property, use the
standard "num-lanes" to describe the number of wired data lanes, and
get the number of actually used ones at s_stream(1) time with the new pad
operation

What do you think ? This would require implemeting the operation in
each subdev the UNICAM interface has to work with, but this doesn't
sound too much of a work.

For reference this is how it happens on rcar+adv748x:
https://patchwork.linuxtv.org/project/linux-media/patch/20200717145324.292820-11-jacopo+renesas@jmondi.org/
https://patchwork.linuxtv.org/project/linux-media/patch/20200717145324.292820-10-jacopo+renesas@jmondi.org/

Thanks
  j

> +
> +	/* Get the local endpoint and remote device. */
> +	ep_node = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
> +	if (!ep_node) {
> +		unicam_dbg(3, dev, "can't get next endpoint\n");
> +		return -EINVAL;
> +	}
> +
> +	unicam_dbg(3, dev, "ep_node is %pOF\n", ep_node);
> +
> +	sensor_node = of_graph_get_remote_port_parent(ep_node);
> +	if (!sensor_node) {
> +		unicam_dbg(3, dev, "can't get remote parent\n");
> +		goto cleanup_exit;
> +	}
> +
> +	unicam_dbg(1, dev, "found subdevice %pOF\n", sensor_node);
> +
> +	/* Parse the local endpoint and validate its configuration. */
> +	v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), &ep);
> +
> +	unicam_dbg(3, dev, "parsed local endpoint, bus_type %u\n",
> +		   ep.bus_type);
> +
> +	dev->bus_type = ep.bus_type;
> +
> +	switch (ep.bus_type) {
> +	case V4L2_MBUS_CSI2_DPHY:
> +		switch (ep.bus.mipi_csi2.num_data_lanes) {
> +		case 1:
> +		case 2:
> +		case 4:
> +			break;
> +
> +		default:
> +			unicam_err(dev, "subdevice %pOF: %u data lanes not supported\n",
> +				   sensor_node,
> +				   ep.bus.mipi_csi2.num_data_lanes);
> +			goto cleanup_exit;
> +		}
> +
> +		for (lane = 0; lane < ep.bus.mipi_csi2.num_data_lanes; lane++) {
> +			if (ep.bus.mipi_csi2.data_lanes[lane] != lane + 1) {
> +				unicam_err(dev, "subdevice %pOF: data lanes reordering not supported\n",
> +					   sensor_node);
> +				goto cleanup_exit;
> +			}
> +		}
> +
> +		if (ep.bus.mipi_csi2.num_data_lanes > dev->max_data_lanes) {
> +			unicam_err(dev, "subdevice requires %u data lanes when %u are supported\n",
> +				   ep.bus.mipi_csi2.num_data_lanes,
> +				   dev->max_data_lanes);
> +		}
> +
> +		dev->max_data_lanes = ep.bus.mipi_csi2.num_data_lanes;
> +		dev->bus_flags = ep.bus.mipi_csi2.flags;
> +
> +		break;
> +
> +	case V4L2_MBUS_CCP2:
> +		if (ep.bus.mipi_csi1.clock_lane != 0 ||
> +		    ep.bus.mipi_csi1.data_lane != 1) {
> +			unicam_err(dev, "subdevice %pOF: unsupported lanes configuration\n",
> +				   sensor_node);
> +			goto cleanup_exit;
> +		}
> +
> +		dev->max_data_lanes = 1;
> +		dev->bus_flags = ep.bus.mipi_csi1.strobe;
> +		break;
> +
> +	default:
> +		/* Unsupported bus type */
> +		unicam_err(dev, "subdevice %pOF: unsupported bus type %u\n",
> +			   sensor_node, ep.bus_type);
> +		goto cleanup_exit;
> +	}
> +
> +	unicam_dbg(3, dev, "subdevice %pOF: %s bus, %u data lanes, flags=0x%08x\n",
> +		   sensor_node,
> +		   dev->bus_type == V4L2_MBUS_CSI2_DPHY ? "CSI-2" : "CCP2",
> +		   dev->max_data_lanes, dev->bus_flags);
> +
> +	/* Initialize and register the async notifier. */
> +	v4l2_async_notifier_init(&dev->notifier);
> +	dev->notifier.ops = &unicam_async_ops;
> +
> +	dev->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> +	dev->asd.match.fwnode = of_fwnode_handle(sensor_node);
> +	ret = v4l2_async_notifier_add_subdev(&dev->notifier, &dev->asd);
> +	if (ret) {
> +		unicam_err(dev, "Error adding subdevice: %d\n", ret);
> +		goto cleanup_exit;
> +	}
> +
> +	ret = v4l2_async_notifier_register(&dev->v4l2_dev, &dev->notifier);
> +	if (ret) {
> +		unicam_err(dev, "Error registering async notifier: %d\n", ret);
> +		ret = -EINVAL;
> +	}
> +
> +cleanup_exit:
> +	of_node_put(sensor_node);
> +	of_node_put(ep_node);
> +
> +	return ret;
> +}
> +
> +static int unicam_probe(struct platform_device *pdev)
> +{
> +	struct unicam_device *unicam;
> +	int ret;
> +
> +	unicam = kzalloc(sizeof(*unicam), GFP_KERNEL);
> +	if (!unicam)
> +		return -ENOMEM;
> +
> +	kref_init(&unicam->kref);
> +	unicam->pdev = pdev;
> +
> +	unicam->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(unicam->base)) {
> +		unicam_err(unicam, "Failed to get main io block\n");
> +		ret = PTR_ERR(unicam->base);
> +		goto err_unicam_put;
> +	}
> +
> +	unicam->clk_gate_base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(unicam->clk_gate_base)) {
> +		unicam_err(unicam, "Failed to get 2nd io block\n");
> +		ret = PTR_ERR(unicam->clk_gate_base);
> +		goto err_unicam_put;
> +	}
> +
> +	unicam->clock = devm_clk_get(&pdev->dev, "lp");
> +	if (IS_ERR(unicam->clock)) {
> +		unicam_err(unicam, "Failed to get clock\n");
> +		ret = PTR_ERR(unicam->clock);
> +		goto err_unicam_put;
> +	}
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret <= 0) {
> +		dev_err(&pdev->dev, "No IRQ resource\n");
> +		ret = -EINVAL;
> +		goto err_unicam_put;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, ret, unicam_isr, 0,
> +			       "unicam_capture0", unicam);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Unable to request interrupt\n");
> +		ret = -EINVAL;
> +		goto err_unicam_put;
> +	}
> +
> +	unicam->mdev.dev = &pdev->dev;
> +	strscpy(unicam->mdev.model, UNICAM_MODULE_NAME,
> +		sizeof(unicam->mdev.model));
> +	strscpy(unicam->mdev.serial, "", sizeof(unicam->mdev.serial));
> +	snprintf(unicam->mdev.bus_info, sizeof(unicam->mdev.bus_info),
> +		 "platform:%s", dev_name(&pdev->dev));
> +	unicam->mdev.hw_revision = 0;
> +
> +	media_device_init(&unicam->mdev);
> +
> +	unicam->v4l2_dev.mdev = &unicam->mdev;
> +
> +	ret = v4l2_device_register(&pdev->dev, &unicam->v4l2_dev);
> +	if (ret) {
> +		unicam_err(unicam,
> +			   "Unable to register v4l2 device.\n");
> +		goto err_unicam_put;
> +	}
> +
> +	ret = media_device_register(&unicam->mdev);
> +	if (ret < 0) {
> +		unicam_err(unicam,
> +			   "Unable to register media-controller device.\n");
> +		goto err_v4l2_unregister;
> +	}
> +
> +	/* Reserve space for the controls */
> +	ret = v4l2_ctrl_handler_init(&unicam->ctrl_handler, 16);
> +	if (ret < 0)
> +		goto err_media_unregister;
> +
> +	/* set the driver data in platform device */
> +	platform_set_drvdata(pdev, unicam);
> +
> +	ret = of_unicam_connect_subdevs(unicam);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to connect subdevs\n");
> +		goto err_media_unregister;
> +	}
> +
> +	/* Enable the block power domain */
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +
> +err_media_unregister:
> +	media_device_unregister(&unicam->mdev);
> +err_v4l2_unregister:
> +	v4l2_device_unregister(&unicam->v4l2_dev);
> +err_unicam_put:
> +	unicam_put(unicam);
> +
> +	return ret;
> +}
> +
> +static int unicam_remove(struct platform_device *pdev)
> +{
> +	struct unicam_device *unicam = platform_get_drvdata(pdev);
> +
> +	unicam_dbg(2, unicam, "%s\n", __func__);
> +
> +	v4l2_async_notifier_unregister(&unicam->notifier);
> +	v4l2_device_unregister(&unicam->v4l2_dev);
> +	media_device_unregister(&unicam->mdev);
> +	unregister_nodes(unicam);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id unicam_of_match[] = {
> +	{ .compatible = "brcm,bcm2835-unicam", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, unicam_of_match);
> +
> +static struct platform_driver unicam_driver = {
> +	.probe		= unicam_probe,
> +	.remove		= unicam_remove,
> +	.driver = {
> +		.name	= UNICAM_MODULE_NAME,
> +		.of_match_table = of_match_ptr(unicam_of_match),
> +	},
> +};
> +
> +module_platform_driver(unicam_driver);
> +
> +MODULE_AUTHOR("Dave Stevenson <dave.stevenson@raspberrypi.com>");
> +MODULE_DESCRIPTION("BCM2835 Unicam driver");
> +MODULE_LICENSE("GPL");
> +MODULE_VERSION(UNICAM_VERSION);
> diff --git a/drivers/media/platform/bcm2835/vc4-regs-unicam.h b/drivers/media/platform/bcm2835/vc4-regs-unicam.h
> new file mode 100644
> index 000000000000..ae059a171d0f
> --- /dev/null
> +++ b/drivers/media/platform/bcm2835/vc4-regs-unicam.h
> @@ -0,0 +1,253 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/*
> + * Copyright (C) 2017-2020 Raspberry Pi Trading.
> + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> + */
> +
> +#ifndef VC4_REGS_UNICAM_H
> +#define VC4_REGS_UNICAM_H
> +
> +/*
> + * The following values are taken from files found within the code drop
> + * made by Broadcom for the BCM21553 Graphics Driver, predominantly in
> + * brcm_usrlib/dag/vmcsx/vcinclude/hardware_vc4.h.
> + * They have been modified to be only the register offset.
> + */
> +#define UNICAM_CTRL	0x000
> +#define UNICAM_STA	0x004
> +#define UNICAM_ANA	0x008
> +#define UNICAM_PRI	0x00c
> +#define UNICAM_CLK	0x010
> +#define UNICAM_CLT	0x014
> +#define UNICAM_DAT0	0x018
> +#define UNICAM_DAT1	0x01c
> +#define UNICAM_DAT2	0x020
> +#define UNICAM_DAT3	0x024
> +#define UNICAM_DLT	0x028
> +#define UNICAM_CMP0	0x02c
> +#define UNICAM_CMP1	0x030
> +#define UNICAM_CAP0	0x034
> +#define UNICAM_CAP1	0x038
> +#define UNICAM_ICTL	0x100
> +#define UNICAM_ISTA	0x104
> +#define UNICAM_IDI0	0x108
> +#define UNICAM_IPIPE	0x10c
> +#define UNICAM_IBSA0	0x110
> +#define UNICAM_IBEA0	0x114
> +#define UNICAM_IBLS	0x118
> +#define UNICAM_IBWP	0x11c
> +#define UNICAM_IHWIN	0x120
> +#define UNICAM_IHSTA	0x124
> +#define UNICAM_IVWIN	0x128
> +#define UNICAM_IVSTA	0x12c
> +#define UNICAM_ICC	0x130
> +#define UNICAM_ICS	0x134
> +#define UNICAM_IDC	0x138
> +#define UNICAM_IDPO	0x13c
> +#define UNICAM_IDCA	0x140
> +#define UNICAM_IDCD	0x144
> +#define UNICAM_IDS	0x148
> +#define UNICAM_DCS	0x200
> +#define UNICAM_DBSA0	0x204
> +#define UNICAM_DBEA0	0x208
> +#define UNICAM_DBWP	0x20c
> +#define UNICAM_DBCTL	0x300
> +#define UNICAM_IBSA1	0x304
> +#define UNICAM_IBEA1	0x308
> +#define UNICAM_IDI1	0x30c
> +#define UNICAM_DBSA1	0x310
> +#define UNICAM_DBEA1	0x314
> +#define UNICAM_MISC	0x400
> +
> +/*
> + * The following bitmasks are from the kernel released by Broadcom
> + * for Android - https://android.googlesource.com/kernel/bcm/
> + * The Rhea, Hawaii, and Java chips all contain the same VideoCore4
> + * Unicam block as BCM2835, as defined in eg
> + * arch/arm/mach-rhea/include/mach/rdb_A0/brcm_rdb_cam.h and similar.
> + * Values reworked to use the kernel BIT and GENMASK macros.
> + *
> + * Some of the bit mnenomics have been amended to match the datasheet.
> + */
> +/* UNICAM_CTRL Register */
> +#define UNICAM_CPE		BIT(0)
> +#define UNICAM_MEM		BIT(1)
> +#define UNICAM_CPR		BIT(2)
> +#define UNICAM_CPM_MASK		GENMASK(3, 3)
> +#define UNICAM_CPM_CSI2		0
> +#define UNICAM_CPM_CCP2		1
> +#define UNICAM_SOE		BIT(4)
> +#define UNICAM_DCM_MASK		GENMASK(5, 5)
> +#define UNICAM_DCM_STROBE	0
> +#define UNICAM_DCM_DATA		1
> +#define UNICAM_SLS		BIT(6)
> +#define UNICAM_PFT_MASK		GENMASK(11, 8)
> +#define UNICAM_OET_MASK		GENMASK(20, 12)
> +
> +/* UNICAM_STA Register */
> +#define UNICAM_SYN		BIT(0)
> +#define UNICAM_CS		BIT(1)
> +#define UNICAM_SBE		BIT(2)
> +#define UNICAM_PBE		BIT(3)
> +#define UNICAM_HOE		BIT(4)
> +#define UNICAM_PLE		BIT(5)
> +#define UNICAM_SSC		BIT(6)
> +#define UNICAM_CRCE		BIT(7)
> +#define UNICAM_OES		BIT(8)
> +#define UNICAM_IFO		BIT(9)
> +#define UNICAM_OFO		BIT(10)
> +#define UNICAM_BFO		BIT(11)
> +#define UNICAM_DL		BIT(12)
> +#define UNICAM_PS		BIT(13)
> +#define UNICAM_IS		BIT(14)
> +#define UNICAM_PI0		BIT(15)
> +#define UNICAM_PI1		BIT(16)
> +#define UNICAM_FSI_S		BIT(17)
> +#define UNICAM_FEI_S		BIT(18)
> +#define UNICAM_LCI_S		BIT(19)
> +#define UNICAM_BUF0_RDY		BIT(20)
> +#define UNICAM_BUF0_NO		BIT(21)
> +#define UNICAM_BUF1_RDY		BIT(22)
> +#define UNICAM_BUF1_NO		BIT(23)
> +#define UNICAM_DI		BIT(24)
> +
> +#define UNICAM_STA_MASK_ALL \
> +		(UNICAM_DL + \
> +		UNICAM_SBE + \
> +		UNICAM_PBE + \
> +		UNICAM_HOE + \
> +		UNICAM_PLE + \
> +		UNICAM_SSC + \
> +		UNICAM_CRCE + \
> +		UNICAM_IFO + \
> +		UNICAM_OFO + \
> +		UNICAM_PS + \
> +		UNICAM_PI0 + \
> +		UNICAM_PI1)
> +
> +/* UNICAM_ANA Register */
> +#define UNICAM_APD		BIT(0)
> +#define UNICAM_BPD		BIT(1)
> +#define UNICAM_AR		BIT(2)
> +#define UNICAM_DDL		BIT(3)
> +#define UNICAM_CTATADJ_MASK	GENMASK(7, 4)
> +#define UNICAM_PTATADJ_MASK	GENMASK(11, 8)
> +
> +/* UNICAM_PRI Register */
> +#define UNICAM_PE		BIT(0)
> +#define UNICAM_PT_MASK		GENMASK(2, 1)
> +#define UNICAM_NP_MASK		GENMASK(7, 4)
> +#define UNICAM_PP_MASK		GENMASK(11, 8)
> +#define UNICAM_BS_MASK		GENMASK(15, 12)
> +#define UNICAM_BL_MASK		GENMASK(17, 16)
> +
> +/* UNICAM_CLK Register */
> +#define UNICAM_CLE		BIT(0)
> +#define UNICAM_CLPD		BIT(1)
> +#define UNICAM_CLLPE		BIT(2)
> +#define UNICAM_CLHSE		BIT(3)
> +#define UNICAM_CLTRE		BIT(4)
> +#define UNICAM_CLAC_MASK	GENMASK(8, 5)
> +#define UNICAM_CLSTE		BIT(29)
> +
> +/* UNICAM_CLT Register */
> +#define UNICAM_CLT1_MASK	GENMASK(7, 0)
> +#define UNICAM_CLT2_MASK	GENMASK(15, 8)
> +
> +/* UNICAM_DATn Registers */
> +#define UNICAM_DLE		BIT(0)
> +#define UNICAM_DLPD		BIT(1)
> +#define UNICAM_DLLPE		BIT(2)
> +#define UNICAM_DLHSE		BIT(3)
> +#define UNICAM_DLTRE		BIT(4)
> +#define UNICAM_DLSM		BIT(5)
> +#define UNICAM_DLFO		BIT(28)
> +#define UNICAM_DLSTE		BIT(29)
> +
> +#define UNICAM_DAT_MASK_ALL (UNICAM_DLSTE + UNICAM_DLFO)
> +
> +/* UNICAM_DLT Register */
> +#define UNICAM_DLT1_MASK	GENMASK(7, 0)
> +#define UNICAM_DLT2_MASK	GENMASK(15, 8)
> +#define UNICAM_DLT3_MASK	GENMASK(23, 16)
> +
> +/* UNICAM_ICTL Register */
> +#define UNICAM_FSIE		BIT(0)
> +#define UNICAM_FEIE		BIT(1)
> +#define UNICAM_IBOB		BIT(2)
> +#define UNICAM_FCM		BIT(3)
> +#define UNICAM_TFC		BIT(4)
> +#define UNICAM_LIP_MASK		GENMASK(6, 5)
> +#define UNICAM_LCIE_MASK	GENMASK(28, 16)
> +
> +/* UNICAM_IDI0/1 Register */
> +#define UNICAM_ID0_MASK		GENMASK(7, 0)
> +#define UNICAM_ID1_MASK		GENMASK(15, 8)
> +#define UNICAM_ID2_MASK		GENMASK(23, 16)
> +#define UNICAM_ID3_MASK		GENMASK(31, 24)
> +
> +/* UNICAM_ISTA Register */
> +#define UNICAM_FSI		BIT(0)
> +#define UNICAM_FEI		BIT(1)
> +#define UNICAM_LCI		BIT(2)
> +
> +#define UNICAM_ISTA_MASK_ALL (UNICAM_FSI + UNICAM_FEI + UNICAM_LCI)
> +
> +/* UNICAM_IPIPE Register */
> +#define UNICAM_PUM_MASK		GENMASK(2, 0)
> +		/* Unpacking modes */
> +		#define UNICAM_PUM_NONE		0
> +		#define UNICAM_PUM_UNPACK6	1
> +		#define UNICAM_PUM_UNPACK7	2
> +		#define UNICAM_PUM_UNPACK8	3
> +		#define UNICAM_PUM_UNPACK10	4
> +		#define UNICAM_PUM_UNPACK12	5
> +		#define UNICAM_PUM_UNPACK14	6
> +		#define UNICAM_PUM_UNPACK16	7
> +#define UNICAM_DDM_MASK		GENMASK(6, 3)
> +#define UNICAM_PPM_MASK		GENMASK(9, 7)
> +		/* Packing modes */
> +		#define UNICAM_PPM_NONE		0
> +		#define UNICAM_PPM_PACK8	1
> +		#define UNICAM_PPM_PACK10	2
> +		#define UNICAM_PPM_PACK12	3
> +		#define UNICAM_PPM_PACK14	4
> +		#define UNICAM_PPM_PACK16	5
> +#define UNICAM_DEM_MASK		GENMASK(11, 10)
> +#define UNICAM_DEBL_MASK	GENMASK(14, 12)
> +#define UNICAM_ICM_MASK		GENMASK(16, 15)
> +#define UNICAM_IDM_MASK		GENMASK(17, 17)
> +
> +/* UNICAM_ICC Register */
> +#define UNICAM_ICFL_MASK	GENMASK(4, 0)
> +#define UNICAM_ICFH_MASK	GENMASK(9, 5)
> +#define UNICAM_ICST_MASK	GENMASK(12, 10)
> +#define UNICAM_ICLT_MASK	GENMASK(15, 13)
> +#define UNICAM_ICLL_MASK	GENMASK(31, 16)
> +
> +/* UNICAM_DCS Register */
> +#define UNICAM_DIE		BIT(0)
> +#define UNICAM_DIM		BIT(1)
> +#define UNICAM_DBOB		BIT(3)
> +#define UNICAM_FDE		BIT(4)
> +#define UNICAM_LDP		BIT(5)
> +#define UNICAM_EDL_MASK		GENMASK(15, 8)
> +
> +/* UNICAM_DBCTL Register */
> +#define UNICAM_DBEN		BIT(0)
> +#define UNICAM_BUF0_IE		BIT(1)
> +#define UNICAM_BUF1_IE		BIT(2)
> +
> +/* UNICAM_CMP[0,1] register */
> +#define UNICAM_PCE		BIT(31)
> +#define UNICAM_GI		BIT(9)
> +#define UNICAM_CPH		BIT(8)
> +#define UNICAM_PCVC_MASK	GENMASK(7, 6)
> +#define UNICAM_PCDT_MASK	GENMASK(5, 0)
> +
> +/* UNICAM_MISC register */
> +#define UNICAM_FL0		BIT(6)
> +#define UNICAM_FL1		BIT(9)
> +
> +#endif
> --
> Regards,
>
> Laurent Pinchart
>
