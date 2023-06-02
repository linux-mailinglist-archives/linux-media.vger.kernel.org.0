Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5425871FB3C
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 09:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbjFBHlo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 2 Jun 2023 03:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234278AbjFBHlB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 03:41:01 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3FF123;
        Fri,  2 Jun 2023 00:40:55 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 5A1B124E293;
        Fri,  2 Jun 2023 15:40:48 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:48 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:47 +0800
From:   Keith Zhao <keith.zhao@starfivetech.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
CC:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Emil Renner Berthing" <kernel@esmil.dk>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, Bjorn Andersson <andersson@kernel.org>,
        "Heiko Stuebner" <heiko@sntech.de>,
        Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
        Chris Morgan <macromorgan@hotmail.com>,
        Keith Zhao <keith.zhao@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Shengyang Chen <shengyang.chen@starfivetech.com>,
        Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH 3/9] drm/verisilicon: Add basic drm driver
Date:   Fri, 2 Jun 2023 15:40:37 +0800
Message-ID: <20230602074043.33872-4-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602074043.33872-1-keith.zhao@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a basic platform driver of the DRM driver for JH7110 SoC.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 MAINTAINERS                          |   2 +
 drivers/gpu/drm/Kconfig              |   2 +
 drivers/gpu/drm/Makefile             |   1 +
 drivers/gpu/drm/verisilicon/Kconfig  |  13 ++
 drivers/gpu/drm/verisilicon/Makefile |   6 +
 drivers/gpu/drm/verisilicon/vs_drv.c | 284 +++++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_drv.h |  48 +++++
 include/uapi/drm/drm_fourcc.h        |  83 ++++++++
 include/uapi/drm/vs_drm.h            |  50 +++++
 9 files changed, 489 insertions(+)
 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
 create mode 100644 include/uapi/drm/vs_drm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 293aa13d484c..da5b6766a7bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7055,6 +7055,8 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/verisilicon/
+F:	drivers/gpu/drm/verisilicon/
+F:	include/uapi/drm/vs_drm.h
 
 DRM DRIVERS FOR VIVANTE GPU IP
 M:	Lucas Stach <l.stach@pengutronix.de>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ba3fb04bb691..f7e461fa4656 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -371,6 +371,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
 
+source "drivers/gpu/drm/verisilicon/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a33257d2bc7f..e50622ee4e46 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -194,3 +194,4 @@ obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
 obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
+obj-$(CONFIG_DRM_VERISILICON) += verisilicon/
diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
new file mode 100644
index 000000000000..89d12185f73b
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config DRM_VERISILICON
+	tristate "DRM Support for VeriSilicon"
+	depends on DRM
+	select DRM_KMS_HELPER
+	select CMA
+	select DMA_CMA
+	help
+	  Choose this option if you have a VeriSilicon soc chipset.
+	  This driver provides VeriSilicon kernel mode
+	  setting and buffer management. It does not
+	  provide 2D or 3D acceleration.
diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
new file mode 100644
index 000000000000..64ce1b26546c
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+vs_drm-objs := vs_drv.o
+
+obj-$(CONFIG_DRM_VERISILICON) += vs_drm.o
+
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/verisilicon/vs_drv.c
new file mode 100644
index 000000000000..24d333598477
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_drv.c
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+#include <linux/of_graph.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/version.h>
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_file.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_of.h>
+#include <drm/drm_prime.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "vs_drv.h"
+
+#define DRV_NAME	"starfive"
+#define DRV_DESC	"Starfive DRM driver"
+#define DRV_DATE	"202305161"
+#define DRV_MAJOR	1
+#define DRV_MINOR	0
+
+static struct platform_driver vs_drm_platform_driver;
+
+static const struct file_operations fops = {
+	.owner			= THIS_MODULE,
+	.open			= drm_open,
+	.release		= drm_release,
+	.unlocked_ioctl	= drm_ioctl,
+	.compat_ioctl	= drm_compat_ioctl,
+	.poll			= drm_poll,
+	.read			= drm_read,
+};
+
+static struct drm_driver vs_drm_driver = {
+	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
+	.lastclose		= drm_fb_helper_lastclose,
+	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
+	.fops			= &fops,
+	.name			= DRV_NAME,
+	.desc			= DRV_DESC,
+	.date			= DRV_DATE,
+	.major			= DRV_MAJOR,
+	.minor			= DRV_MINOR,
+};
+
+void vs_drm_update_pitch_alignment(struct drm_device *drm_dev,
+				   unsigned int alignment)
+{
+	struct vs_drm_private *priv = drm_dev->dev_private;
+
+	if (alignment > priv->pitch_alignment)
+		priv->pitch_alignment = alignment;
+}
+
+static int vs_drm_bind(struct device *dev)
+{
+	struct drm_device *drm_dev;
+	struct vs_drm_private *priv;
+	int ret;
+	static u64 dma_mask = DMA_BIT_MASK(40);
+
+	/* Remove existing drivers that may own the framebuffer memory. */
+	ret = drm_aperture_remove_framebuffers(false, &vs_drm_driver);
+	if (ret) {
+		DRM_DEV_ERROR(dev,
+			      "Failed to remove existing framebuffers - %d.\n",
+			      ret);
+		return ret;
+	}
+
+	drm_dev = drm_dev_alloc(&vs_drm_driver, dev);
+	if (IS_ERR(drm_dev))
+		return PTR_ERR(drm_dev);
+
+	dev_set_drvdata(dev, drm_dev);
+
+	priv = devm_kzalloc(drm_dev->dev, sizeof(struct vs_drm_private),
+			    GFP_KERNEL);
+	if (!priv) {
+		ret = -ENOMEM;
+		goto err_put_dev;
+	}
+
+	priv->pitch_alignment = 64;
+	priv->dma_dev = drm_dev->dev;
+	priv->dma_dev->coherent_dma_mask = dma_mask;
+	drm_dev->dev_private = priv;
+
+	drm_mode_config_init(drm_dev);
+
+	/* Now try and bind all our sub-components */
+	ret = component_bind_all(dev, drm_dev);
+	if (ret)
+		goto err_mode;
+
+	ret = drm_vblank_init(drm_dev, drm_dev->mode_config.num_crtc);
+	if (ret)
+		goto err_bind;
+
+	drm_mode_config_reset(drm_dev);
+
+	drm_kms_helper_poll_init(drm_dev);
+
+	ret = drm_dev_register(drm_dev, 0);
+	if (ret)
+		goto err_helper;
+
+	drm_fbdev_generic_setup(drm_dev, 32);
+
+	return 0;
+
+err_helper:
+	drm_kms_helper_poll_fini(drm_dev);
+err_bind:
+	component_unbind_all(drm_dev->dev, drm_dev);
+err_mode:
+	drm_mode_config_cleanup(drm_dev);
+	if (priv->domain)
+		iommu_domain_free(priv->domain);
+err_put_dev:
+	drm_dev->dev_private = NULL;
+	dev_set_drvdata(dev, NULL);
+	drm_dev_put(drm_dev);
+	return ret;
+}
+
+static void vs_drm_unbind(struct device *dev)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct vs_drm_private *priv = drm_dev->dev_private;
+
+	drm_dev_unregister(drm_dev);
+
+	drm_kms_helper_poll_fini(drm_dev);
+
+	component_unbind_all(drm_dev->dev, drm_dev);
+
+	drm_mode_config_cleanup(drm_dev);
+
+	if (priv->domain) {
+		iommu_domain_free(priv->domain);
+		priv->domain = NULL;
+	}
+
+	drm_dev->dev_private = NULL;
+	dev_set_drvdata(dev, NULL);
+	drm_dev_put(drm_dev);
+}
+
+static const struct component_master_ops vs_drm_ops = {
+	.bind = vs_drm_bind,
+	.unbind = vs_drm_unbind,
+};
+
+static struct platform_driver *drm_sub_drivers[] = {
+};
+
+#define NUM_DRM_DRIVERS \
+	(sizeof(drm_sub_drivers) / sizeof(struct platform_driver *))
+
+static int compare_dev(struct device *dev, void *data)
+{
+	return dev == (struct device *)data;
+}
+
+static struct component_match *vs_drm_match_add(struct device *dev)
+{
+	struct component_match *match = NULL;
+	int i;
+
+	for (i = 0; i < NUM_DRM_DRIVERS; ++i) {
+		struct platform_driver *drv = drm_sub_drivers[i];
+		struct device *p = NULL, *d;
+
+		while ((d = platform_find_device_by_driver(p, &drv->driver))) {
+			put_device(p);
+
+			component_match_add(dev, &match, compare_dev, d);
+			p = d;
+		}
+		put_device(p);
+	}
+
+	return match ?: ERR_PTR(-ENODEV);
+}
+
+static int vs_drm_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct component_match *match;
+
+	match = vs_drm_match_add(dev);
+	if (IS_ERR(match))
+		return PTR_ERR(match);
+
+	return component_master_add_with_match(dev, &vs_drm_ops, match);
+}
+
+static int vs_drm_platform_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &vs_drm_ops);
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int vs_drm_suspend(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_suspend(drm);
+}
+
+static int vs_drm_resume(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_resume(drm);
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(vs_drm_pm_ops, vs_drm_suspend, vs_drm_resume);
+
+static const struct of_device_id vs_drm_dt_ids[] = {
+	{ .compatible = "verisilicon,display-subsystem", },
+};
+
+MODULE_DEVICE_TABLE(of, vs_drm_dt_ids);
+
+static struct platform_driver vs_drm_platform_driver = {
+	.probe = vs_drm_platform_probe,
+	.remove = vs_drm_platform_remove,
+
+	.driver = {
+		.name = DRV_NAME,
+		.of_match_table = vs_drm_dt_ids,
+		.pm = &vs_drm_pm_ops,
+	},
+};
+
+static int __init vs_drm_init(void)
+{
+	int ret;
+
+	ret = platform_register_drivers(drm_sub_drivers, NUM_DRM_DRIVERS);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&vs_drm_platform_driver);
+	if (ret)
+		platform_unregister_drivers(drm_sub_drivers, NUM_DRM_DRIVERS);
+
+	return ret;
+}
+
+static void __exit vs_drm_fini(void)
+{
+	platform_driver_unregister(&vs_drm_platform_driver);
+	platform_unregister_drivers(drm_sub_drivers, NUM_DRM_DRIVERS);
+}
+
+module_init(vs_drm_init);
+module_exit(vs_drm_fini);
+
+MODULE_DESCRIPTION("VeriSilicon DRM Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.h b/drivers/gpu/drm/verisilicon/vs_drv.h
new file mode 100644
index 000000000000..0382b44e3bf0
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_drv.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_DRV_H__
+#define __VS_DRV_H__
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/version.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+
+/*
+ *
+ * @dma_dev: device for DMA API.
+ *	- use the first attached device if support iommu
+	else use drm device (only contiguous buffer support)
+ * @domain: iommu domain for DRM.
+ *	- all DC IOMMU share same domain to reduce mapping
+ * @pitch_alignment: buffer pitch alignment required by sub-devices.
+ *
+ */
+struct vs_drm_private {
+	struct device *dma_dev;
+	struct iommu_domain *domain;
+	unsigned int pitch_alignment;
+};
+
+void vs_drm_update_pitch_alignment(struct drm_device *drm_dev,
+				   unsigned int alignment);
+
+static inline struct device *to_dma_dev(struct drm_device *dev)
+{
+	struct vs_drm_private *priv = dev->dev_private;
+
+	return priv->dma_dev;
+}
+
+static inline bool is_iommu_enabled(struct drm_device *dev)
+{
+	struct vs_drm_private *priv = dev->dev_private;
+
+	return priv->domain ? true : false;
+}
+
+#endif /* __VS_DRV_H__ */
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index de703c6be969..af4fb50f9207 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -419,6 +419,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
+#define DRM_FORMAT_MOD_VENDOR_VS      0x0b
 
 /* add more to the end as needed */
 
@@ -1519,6 +1520,88 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_CLEAR(field) \
 	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
 
+#define DRM_FORMAT_MOD_VS_TYPE_NORMAL        0x00
+#define DRM_FORMAT_MOD_VS_TYPE_COMPRESSED    0x01
+#define DRM_FORMAT_MOD_VS_TYPE_CUSTOM_10BIT  0x02
+#define DRM_FORMAT_MOD_VS_TYPE_MASK     ((__u64)0x3 << 54)
+
+#define fourcc_mod_vs_code(type, val) \
+	fourcc_mod_code(VS, ((((__u64)type) << 54) | (val)))
+
+#define DRM_FORMAT_MOD_VS_DEC_TILE_MODE_MASK    0x3F
+#define DRM_FORMAT_MOD_VS_DEC_TILE_8X8_XMAJOR   0x00
+#define DRM_FORMAT_MOD_VS_DEC_TILE_8X8_YMAJOR   0x01
+#define DRM_FORMAT_MOD_VS_DEC_TILE_16X4     0x02
+#define DRM_FORMAT_MOD_VS_DEC_TILE_8X4      0x03
+#define DRM_FORMAT_MOD_VS_DEC_TILE_4X8      0x04
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_16X4   0x06
+#define DRM_FORMAT_MOD_VS_DEC_TILE_64X4     0x07
+#define DRM_FORMAT_MOD_VS_DEC_TILE_32X4     0x08
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_256X1  0x09
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_128X1  0x0A
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_64X4   0x0B
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_256X2  0x0C
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_128X2  0x0D
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_128X4  0x0E
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_64X1   0x0F
+#define DRM_FORMAT_MOD_VS_DEC_TILE_16X8     0x10
+#define DRM_FORMAT_MOD_VS_DEC_TILE_8X16     0x11
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_512X1  0x12
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_32X4   0x13
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_64X2   0x14
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_32X2   0x15
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_32X1   0x16
+#define DRM_FORMAT_MOD_VS_DEC_RASTER_16X1   0x17
+#define DRM_FORMAT_MOD_VS_DEC_TILE_128X4    0x18
+#define DRM_FORMAT_MOD_VS_DEC_TILE_256X4    0x19
+#define DRM_FORMAT_MOD_VS_DEC_TILE_512X4    0x1A
+#define DRM_FORMAT_MOD_VS_DEC_TILE_16X16    0x1B
+#define DRM_FORMAT_MOD_VS_DEC_TILE_32X16    0x1C
+#define DRM_FORMAT_MOD_VS_DEC_TILE_64X16    0x1D
+#define DRM_FORMAT_MOD_VS_DEC_TILE_128X8    0x1E
+#define DRM_FORMAT_MOD_VS_DEC_TILE_8X4_S    0x1F
+#define DRM_FORMAT_MOD_VS_DEC_TILE_16X4_S   0x20
+#define DRM_FORMAT_MOD_VS_DEC_TILE_32X4_S   0x21
+#define DRM_FORMAT_MOD_VS_DEC_TILE_16X4_LSB 0x22
+#define DRM_FORMAT_MOD_VS_DEC_TILE_32X4_LSB 0x23
+#define DRM_FORMAT_MOD_VS_DEC_TILE_32X8     0x24
+
+#define DRM_FORMAT_MOD_VS_DEC_ALIGN_32      (0x01 << 6)
+#define DRM_FORMAT_MOD_VS_DEC_ALIGN_64      (0x01 << 7)
+
+#define fourcc_mod_vs_dec_code(tile, align) \
+	fourcc_mod_vs_code(DRM_FORMAT_MOD_VS_TYPE_COMPRESSED, \
+				((tile) | (align)))
+
+#define DRM_FORMAT_MOD_VS_NORM_MODE_MASK        0x1F
+#define DRM_FORMAT_MOD_VS_LINEAR                0x00
+#define DRM_FORMAT_MOD_VS_TILED4x4              0x01
+#define DRM_FORMAT_MOD_VS_SUPER_TILED_XMAJOR    0x02
+#define DRM_FORMAT_MOD_VS_SUPER_TILED_YMAJOR    0x03
+#define DRM_FORMAT_MOD_VS_TILE_8X8              0x04
+#define DRM_FORMAT_MOD_VS_TILE_MODE1            0x05
+#define DRM_FORMAT_MOD_VS_TILE_MODE2            0x06
+#define DRM_FORMAT_MOD_VS_TILE_8X4              0x07
+#define DRM_FORMAT_MOD_VS_TILE_MODE4            0x08
+#define DRM_FORMAT_MOD_VS_TILE_MODE5            0x09
+#define DRM_FORMAT_MOD_VS_TILE_MODE6            0x0A
+#define DRM_FORMAT_MOD_VS_SUPER_TILED_XMAJOR_8X4    0x0B
+#define DRM_FORMAT_MOD_VS_SUPER_TILED_YMAJOR_4X8    0x0C
+#define DRM_FORMAT_MOD_VS_TILE_Y                0x0D
+#define DRM_FORMAT_MOD_VS_TILE_128X1            0x0F
+#define DRM_FORMAT_MOD_VS_TILE_256X1            0x10
+#define DRM_FORMAT_MOD_VS_TILE_32X1             0x11
+#define DRM_FORMAT_MOD_VS_TILE_64X1             0x12
+#define DRM_FORMAT_MOD_VS_TILE_MODE4X4          0x15
+
+#define fourcc_mod_vs_norm_code(tile) \
+	fourcc_mod_vs_code(DRM_FORMAT_MOD_VS_TYPE_NORMAL, \
+				(tile))
+
+#define fourcc_mod_vs_custom_code(tile) \
+	fourcc_mod_vs_code(DRM_FORMAT_MOD_VS_TYPE_CUSTOM_10BIT, \
+				(tile))
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/drm/vs_drm.h b/include/uapi/drm/vs_drm.h
new file mode 100644
index 000000000000..96b7fc95d658
--- /dev/null
+++ b/include/uapi/drm/vs_drm.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_DRM_H__
+#define __VS_DRM_H__
+
+#include "drm.h"
+
+enum drm_vs_degamma_mode {
+	VS_DEGAMMA_DISABLE = 0,
+	VS_DEGAMMA_BT709 = 1,
+	VS_DEGAMMA_BT2020 = 2,
+};
+
+enum drm_vs_sync_dc_mode {
+	VS_SINGLE_DC = 0,
+	VS_MULTI_DC_PRIMARY = 1,
+	VS_MULTI_DC_SECONDARY = 2,
+};
+
+enum drm_vs_mmu_prefetch_mode {
+	VS_MMU_PREFETCH_DISABLE = 0,
+	VS_MMU_PREFETCH_ENABLE = 1,
+};
+
+struct drm_vs_watermark {
+	__u32 watermark;
+	__u8 qos_low;
+	__u8 qos_high;
+};
+
+struct drm_vs_color_mgmt {
+	__u32 colorkey;
+	__u32 colorkey_high;
+	__u32 clear_value;
+	bool  clear_enable;
+	bool  transparency;
+};
+
+struct drm_vs_roi {
+	bool enable;
+	__u16 roi_x;
+	__u16 roi_y;
+	__u16 roi_w;
+	__u16 roi_h;
+};
+
+#endif /* __VS_DRM_H__ */
-- 
2.34.1

