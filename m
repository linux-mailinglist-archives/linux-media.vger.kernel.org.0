Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7FB2F0419
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 23:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbhAIWZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jan 2021 17:25:15 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:57845 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726238AbhAIWZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Jan 2021 17:25:14 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0C8985805EF;
        Sat,  9 Jan 2021 17:24:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 09 Jan 2021 17:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        to:cc:references:from:subject:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=m
        12NFdKt3bGrZeShAQKdpYummJW0fgdM/Zs/d2W6cXE=; b=YhmaFfwuMCWJ//o7d
        xQPOOwawY+upfamD3yMo7ainVkyhPxe8Fa8R0GOV307DPKuU7A5JmFBtr98/gAK6
        eRL65NmeF6PWmo98HCEfSobQrTEPJ+4N3MgYOcEGZ97+ZFIgjzlxWeb9ijt08dMs
        yQMubyN5bvInwxVpZxqwCQFleNAIJ8aPma078GSO3XSb/j2ovhOEPpV5f7KnJwyg
        pAwiIqOWA62ltBYiaeYGFqD3DljaRGI2JQGnvTEHbZlxCoAZyHEeU84WaFYA9T6x
        0xxIhTyaL47yv+XgePozom5VQ+qUrePBIbcOUsJsLFuHp2NxLEGX980qehOQUxLi
        ww9Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=m12NFdKt3bGrZeShAQKdpYummJW0fgdM/Zs/d2W6c
        XE=; b=pw5W4y3Fd76Mbc1DC1ewxmUAwR94EhUk6k7JiKajubxmlmTKF/242wapQ
        5Wt3bPLyAvDjdiPhaf5HokS2Qi6s+hXPKNbbYE6SMh5gIwTVVcYhyCVJ0jqAr3hF
        VfCrXKISxFyQGFTHIJo8Ec7BtTkrtJz7h46ZDev7ncXQQ2eRwc/5BbpzYMd1FP2n
        t+OZi2GCpkJNcGJF6P5WI7+I8aC5FtdrvPEYEr1VLEKxJ61fzO8szjkw06t3WQ6i
        daaFzTj5XF7PwthYIbOqEmXH75kqX9HKt32TMbPAwsVgjOgfXi2yiAgz78/WMWdC
        FAruv4juw+GYvOotiSn83E0hLW77w==
X-ME-Sender: <xms:Ay36X1Y1h-KqjoodnccU38awJLJi-UIAdHnDx34zgR0HtxIvvZG-UQ>
    <xme:Ay36X8YVu_TDdAS0-rJ74MaaqcDesfC2Ts_VFHQRQPGMGxReRBMze4N9M9Qv7eaxq
    BThi2iuBWOQkp882w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegjedgudeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefvfhfhuffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedvtddtjeeiuddugfffveetkeffgeffgedutdfgfeekudevudek
    ffehtdefveeuvdenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:Ay36X3-BIAcYok8WBOWIHKzgH4DCnIqk_REtsCwrv88DnmAk72YeOw>
    <xmx:Ay36XzqpJgWqkixv_77DUWmiPgRoN6SPrcxj-SSprreR03vtjacfBg>
    <xmx:Ay36XwruO3cqQlTCyyiExYFTmeZt42XVRWmsttBNq3z_txMAhzESgg>
    <xmx:Bi36X5ay336yNwVUfUsqrUZN98m-Yh_0P-BckXpbJjSjxzVQWP7q1Q>
Received: from [70.135.148.151] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2DB9A1080057;
        Sat,  9 Jan 2021 17:24:02 -0500 (EST)
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
References: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com>
 <20201231142948.3241780-10-paul.kocialkowski@bootlin.com>
From:   Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 09/15] media: sunxi: Add support for the A31 MIPI CSI-2
 controller
Message-ID: <4ea6a6d0-e2ef-9374-e24b-9d62d5f66e23@sholland.org>
Date:   Sat, 9 Jan 2021 16:24:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201231142948.3241780-10-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/31/20 8:29 AM, Paul Kocialkowski wrote:
> The A31 MIPI CSI-2 controller is a dedicated MIPI CSI-2 bridge
> found on Allwinner SoCs such as the A31 and V3/V3s.
> 
> It is a standalone block, connected to the CSI controller on one side
> and to the MIPI D-PHY block on the other. It has a dedicated address
> space, interrupt line and clock.
> 
> It is represented as a V4L2 subdev to the CSI controller and takes a
> MIPI CSI-2 sensor as its own subdev, all using the fwnode graph and
> media controller API.
> 
> Only 8-bit and 10-bit Bayer formats are currently supported.
> While up to 4 internal channels to the CSI controller exist, only one
> is currently supported by this implementation.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/platform/sunxi/Kconfig          |   1 +
>  drivers/media/platform/sunxi/Makefile         |   1 +
>  .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  12 +
>  .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 590 ++++++++++++++++++
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   | 117 ++++
>  6 files changed, 725 insertions(+)
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> 
> diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
> index 7151cc249afa..9684e07454ad 100644
> --- a/drivers/media/platform/sunxi/Kconfig
> +++ b/drivers/media/platform/sunxi/Kconfig
> @@ -2,3 +2,4 @@
>  
>  source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
>  source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
> +source "drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig"
> diff --git a/drivers/media/platform/sunxi/Makefile b/drivers/media/platform/sunxi/Makefile
> index fc537c9f5ca9..887a7cae8fca 100644
> --- a/drivers/media/platform/sunxi/Makefile
> +++ b/drivers/media/platform/sunxi/Makefile
> @@ -2,5 +2,6 @@
>  
>  obj-y		+= sun4i-csi/
>  obj-y		+= sun6i-csi/
> +obj-y		+= sun6i-mipi-csi2/
>  obj-y		+= sun8i-di/
>  obj-y		+= sun8i-rotate/
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> new file mode 100644
> index 000000000000..47f1bb0779a8
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_SUN6I_MIPI_CSI2
> +	tristate "Allwinner A31 MIPI CSI-2 Controller Driver"
> +	depends on ARCH_SUNXI || COMPILE_TEST
> +	depends on PM && COMMON_CLK && VIDEO_V4L2
> +	select REGMAP_MMIO
> +	select PHY_SUN6I_MIPI_DPHY
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	help
> +	   Support for the Allwinner A31 MIPI CSI-2 Controller.
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
> new file mode 100644
> index 000000000000..14e4e03818b5
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +sun6i-mipi-csi2-y += sun6i_mipi_csi2.o
> +
> +obj-$(CONFIG_VIDEO_SUN6I_MIPI_CSI2) += sun6i-mipi-csi2.o
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> new file mode 100644
> index 000000000000..87307beda4cf
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> @@ -0,0 +1,590 @@
[...]
> +/* Base Driver */
> +
> +static int sun6i_mipi_csi2_suspend(struct device *dev)
> +{
> +	struct sun6i_mipi_csi2_dev *cdev = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(cdev->clk_mod);
> +	clk_disable_unprepare(cdev->clk_bus);
> +	reset_control_assert(cdev->reset);
> +
> +	return 0;
> +}
> +
> +static int sun6i_mipi_csi2_resume(struct device *dev)
> +{
> +	struct sun6i_mipi_csi2_dev *cdev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = reset_control_deassert(cdev->reset);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to deassert reset\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(cdev->clk_bus);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to enable bus clock\n");
> +		goto error_reset;
> +	}
> +
> +	ret = clk_prepare_enable(cdev->clk_mod);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to enable module clock\n");
> +		goto error_clk_bus;
> +	}
> +
> +	return 0;
> +
> +error_clk_bus:
> +	clk_disable_unprepare(cdev->clk_bus);
> +
> +error_reset:
> +	reset_control_assert(cdev->reset);
> +
> +	return ret;
> +}
> +
> +static int sun6i_mipi_csi2_v4l2_setup(struct sun6i_mipi_csi2_dev *cdev)
> +{
> +	struct sun6i_mipi_csi2_video *video = &cdev->video;
> +	struct v4l2_subdev *subdev = &video->subdev;
> +	struct v4l2_async_notifier *notifier = &video->notifier;
> +	struct fwnode_handle *handle;
> +	struct v4l2_fwnode_endpoint *endpoint;
> +	struct v4l2_async_subdev *subdev_async;
> +	int ret;
> +
> +	/* Subdev */
> +
> +	v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> +	subdev->dev = cdev->dev;
> +	subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	strscpy(subdev->name, MODULE_NAME, sizeof(subdev->name));
> +	v4l2_set_subdevdata(subdev, cdev);
> +
> +	/* Entity */
> +
> +	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	subdev->entity.ops = &sun6i_mipi_csi2_entity_ops;
> +
> +	/* Pads */
> +
> +	video->pads[0].flags = MEDIA_PAD_FL_SINK;
> +	video->pads[1].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&subdev->entity, 2, video->pads);
> +	if (ret)
> +		return ret;
> +
> +	/* Endpoint */
> +
> +	handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(cdev->dev), 0, 0,
> +						 FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!handle) {
> +		ret = -ENODEV;
> +		goto error_media_entity;
> +	}
> +
> +	endpoint = &video->endpoint;
> +	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
> +
> +	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
> +	fwnode_handle_put(handle);
> +	if (ret)
> +		goto error_media_entity;
> +
> +	/* Notifier */
> +
> +	v4l2_async_notifier_init(notifier);
> +
> +	subdev_async = &video->subdev_async;
> +	ret = v4l2_async_notifier_add_fwnode_remote_subdev(notifier, handle,
> +							   subdev_async);
> +	if (ret)
> +		goto error_media_entity;
> +
> +	video->notifier.ops = &sun6i_mipi_csi2_notifier_ops;
> +
> +	ret = v4l2_async_subdev_notifier_register(subdev, notifier);
> +	if (ret < 0)
> +		goto error_notifier;
> +
> +	/* Subdev */
> +
> +	ret = v4l2_async_register_subdev(subdev);
> +	if (ret < 0)
> +		goto error_notifier_registered;
> +
> +	/* Runtime PM */
> +
> +	pm_runtime_enable(cdev->dev);

I would expect to see this before registering with the class, since
pm_runtime_get_sync() will fail if called before runtime PM is enabled.

> +	pm_runtime_set_suspended(cdev->dev);

This is already the default.

> +
> +	return 0;
> +
> +error_notifier_registered:
> +	v4l2_async_notifier_unregister(notifier);
> +error_notifier:
> +	v4l2_async_notifier_cleanup(notifier);
> +error_media_entity:
> +	media_entity_cleanup(&subdev->entity);
> +
> +	return ret;
> +}
> +
> +static int sun6i_mipi_csi2_v4l2_teardown(struct sun6i_mipi_csi2_dev *cdev)
> +{
> +	struct sun6i_mipi_csi2_video *video = &cdev->video;
> +	struct v4l2_subdev *subdev = &video->subdev;
> +	struct v4l2_async_notifier *notifier = &video->notifier;
> +
> +	v4l2_async_unregister_subdev(subdev);
> +	v4l2_async_notifier_unregister(notifier);
> +	v4l2_async_notifier_cleanup(notifier);
> +	media_entity_cleanup(&subdev->entity);
> +	v4l2_device_unregister_subdev(subdev);
> +

I would expect to see pm_runtime_suspend()/pm_runtime_disable() called
here, so you do not leak clock prepare/enable references.

Cheers,
Samuel

> +	return 0;
> +}
> +
> +static const struct regmap_config sun6i_mipi_csi2_regmap_config = {
> +	.reg_bits       = 32,
> +	.reg_stride     = 4,
> +	.val_bits       = 32,
> +	.max_register	= 0x400,
> +};
> +
> +static int sun6i_mipi_csi2_probe(struct platform_device *pdev)
> +{
> +	struct sun6i_mipi_csi2_dev *cdev;
> +	struct resource *res;
> +	void __iomem *io_base;
> +	int ret;
> +
> +	cdev = devm_kzalloc(&pdev->dev, sizeof(*cdev), GFP_KERNEL);
> +	if (!cdev)
> +		return -ENOMEM;
> +
> +	cdev->dev = &pdev->dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	io_base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(io_base))
> +		return PTR_ERR(io_base);
> +
> +	cdev->regmap = devm_regmap_init_mmio(&pdev->dev, io_base,
> +					     &sun6i_mipi_csi2_regmap_config);
> +	if (IS_ERR(cdev->regmap)) {
> +		dev_err(&pdev->dev, "failed to init register map\n");
> +		return PTR_ERR(cdev->regmap);
> +	}
> +
> +	cdev->clk_bus = devm_clk_get(&pdev->dev, "bus");
> +	if (IS_ERR(cdev->clk_bus)) {
> +		dev_err(&pdev->dev, "failed to acquire bus clock\n");
> +		return PTR_ERR(cdev->clk_bus);
> +	}
> +
> +	cdev->clk_mod = devm_clk_get(&pdev->dev, "mod");
> +	if (IS_ERR(cdev->clk_mod)) {
> +		dev_err(&pdev->dev, "failed to acquire mod clock\n");
> +		return PTR_ERR(cdev->clk_mod);
> +	}
> +
> +	cdev->reset = devm_reset_control_get_shared(&pdev->dev, NULL);
> +	if (IS_ERR(cdev->reset)) {
> +		dev_err(&pdev->dev, "failed to get reset controller\n");
> +		return PTR_ERR(cdev->reset);
> +	}
> +
> +	cdev->dphy = devm_phy_get(&pdev->dev, NULL);
> +	if (IS_ERR(cdev->dphy)) {
> +		dev_err(&pdev->dev, "failed to get the MIPI D-PHY\n");
> +		return PTR_ERR(cdev->dphy);
> +	}
> +
> +	ret = phy_init(cdev->dphy);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to initialize the MIPI D-PHY\n");
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, cdev);
> +
> +	ret = sun6i_mipi_csi2_v4l2_setup(cdev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int sun6i_mipi_csi2_remove(struct platform_device *pdev)
> +{
> +	struct sun6i_mipi_csi2_dev *cdev = platform_get_drvdata(pdev);
> +
> +	phy_exit(cdev->dphy);
> +
> +	return sun6i_mipi_csi2_v4l2_teardown(cdev);
> +}
> +
> +static const struct dev_pm_ops sun6i_mipi_csi2_pm_ops = {
> +	SET_RUNTIME_PM_OPS(sun6i_mipi_csi2_suspend, sun6i_mipi_csi2_resume,
> +			   NULL)
> +};
> +
> +static const struct of_device_id sun6i_mipi_csi2_of_match[] = {
> +	{ .compatible = "allwinner,sun6i-a31-mipi-csi2" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sun6i_mipi_csi2_of_match);
> +
> +static struct platform_driver sun6i_mipi_csi2_platform_driver = {
> +	.probe = sun6i_mipi_csi2_probe,
> +	.remove = sun6i_mipi_csi2_remove,
> +	.driver = {
> +		.name = MODULE_NAME,
> +		.of_match_table = of_match_ptr(sun6i_mipi_csi2_of_match),
> +		.pm = &sun6i_mipi_csi2_pm_ops,
> +	},
> +};
> +module_platform_driver(sun6i_mipi_csi2_platform_driver);
> +
> +MODULE_DESCRIPTION("Allwinner A31 MIPI CSI-2 Controller Driver");
> +MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
> +MODULE_LICENSE("GPL");
[...]
