Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37DF813FED
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2019 16:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbfEEOBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 May 2019 10:01:30 -0400
Received: from shell.v3.sk ([90.176.6.54]:55793 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728121AbfEEOB2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 5 May 2019 10:01:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id F0634103B0D;
        Sun,  5 May 2019 16:01:24 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id q6JubbAeSDSP; Sun,  5 May 2019 16:00:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 52E29103D24;
        Sun,  5 May 2019 16:00:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Z4C8T55OwxB4; Sun,  5 May 2019 16:00:42 +0200 (CEST)
Received: from nedofet.lan (ip-89-102-31-34.net.upcbroadband.cz [89.102.31.34])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 6CDE8103D35;
        Sun,  5 May 2019 16:00:40 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>,
        Libin Yang <lbyang@marvell.com>,
        Albert Wang <twang13@marvell.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v5 10/10] [media] marvell-ccic: provide a clock for the sensor
Date:   Sun,  5 May 2019 16:00:31 +0200
Message-Id: <20190505140031.9636-11-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190505140031.9636-1-lkundrak@v3.sk>
References: <20190505140031.9636-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor needs the MCLK clock running when it's being probed. On
platforms where the sensor is instantiated from a DT (MMP2) it is going
to happen asynchronously.

Therefore, the current modus operandi, where the bridge driver fiddles
with the sensor power and clock itself is not going to fly. As the commen=
ts
wisely note, this doesn't even belong there.

Luckily, the ov7670 driver is already able to control its power and
reset lines, we can just drop the MMP platform glue altogether.

It also requests the clock via the standard clock subsystem. Good -- let'=
s
set up a clock instance so that the sensor can ask us to enable the clock=
.
Note that this is pretty dumb at the moment: the clock is hardwired to a
particular frequency and parent. It was always the case.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v3:
- Do not enable the clock on register() now that the sensor can turn
  it on.

Changes since v1:
- [kbuild/ia64] depend on COMMON_CLK.
- [smatch] fix bad return in mcam_v4l_open() leading to lock not getting
  released on error.

 drivers/media/platform/marvell-ccic/Kconfig   |   2 +
 .../media/platform/marvell-ccic/cafe-driver.c |   9 +-
 .../media/platform/marvell-ccic/mcam-core.c   | 172 +++++++++++++-----
 .../media/platform/marvell-ccic/mcam-core.h   |   3 +
 .../media/platform/marvell-ccic/mmp-driver.c  | 152 ++--------------
 .../linux/platform_data/media/mmp-camera.h    |   2 -
 6 files changed, 157 insertions(+), 183 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/Kconfig b/drivers/media/=
platform/marvell-ccic/Kconfig
index cf12e077203a3..3e12eb25740a6 100644
--- a/drivers/media/platform/marvell-ccic/Kconfig
+++ b/drivers/media/platform/marvell-ccic/Kconfig
@@ -1,6 +1,7 @@
 config VIDEO_CAFE_CCIC
 	tristate "Marvell 88ALP01 (Cafe) CMOS Camera Controller support"
 	depends on PCI && I2C && VIDEO_V4L2
+	depends on COMMON_CLK
 	select VIDEO_OV7670
 	select VIDEOBUF2_VMALLOC
 	select VIDEOBUF2_DMA_CONTIG
@@ -14,6 +15,7 @@ config VIDEO_MMP_CAMERA
 	tristate "Marvell Armada 610 integrated camera controller support"
 	depends on I2C && VIDEO_V4L2
 	depends on ARCH_MMP || COMPILE_TEST
+	depends on COMMON_CLK
 	select VIDEO_OV7670
 	select I2C_GPIO
 	select VIDEOBUF2_VMALLOC
diff --git a/drivers/media/platform/marvell-ccic/cafe-driver.c b/drivers/=
media/platform/marvell-ccic/cafe-driver.c
index bf80799a93490..173013d6135d3 100644
--- a/drivers/media/platform/marvell-ccic/cafe-driver.c
+++ b/drivers/media/platform/marvell-ccic/cafe-driver.c
@@ -33,6 +33,7 @@
 #include <linux/wait.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/clkdev.h>
=20
 #include "mcam-core.h"
=20
@@ -533,11 +534,10 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 		goto out_iounmap;
=20
 	/*
-	 * Initialize the controller and leave it powered up.  It will
-	 * stay that way until the sensor driver shows up.
+	 * Initialize the controller.
 	 */
 	cafe_ctlr_init(mcam);
-	cafe_ctlr_power_up(mcam);
+
 	/*
 	 * Set up I2C/SMBUS communications.  We have to drop the mutex here
 	 * because the sensor could attach in this call chain, leading to
@@ -555,6 +555,9 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto out_smbus_shutdown;
=20
+	clkdev_create(mcam->mclk, "xclk", "%d-%04x",
+		i2c_adapter_id(cam->i2c_adapter), ov7670_info.addr);
+
 	if (i2c_new_device(cam->i2c_adapter, &ov7670_info)) {
 		cam->registered =3D 1;
 		return 0;
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/me=
dia/platform/marvell-ccic/mcam-core.c
index 87812b7287f0a..c492a06c7b46d 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -22,6 +22,7 @@
 #include <linux/vmalloc.h>
 #include <linux/io.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
@@ -303,9 +304,6 @@ static void mcam_enable_mipi(struct mcam_camera *mcam=
)
 		 */
 		mcam_reg_write(mcam, REG_CSI2_CTRL0,
 			CSI2_C0_MIPI_EN | CSI2_C0_ACT_LANE(mcam->lane));
-		mcam_reg_write(mcam, REG_CLKCTRL,
-			(mcam->mclk_src << 29) | mcam->mclk_div);
-
 		mcam->mipi_enabled =3D true;
 	}
 }
@@ -830,31 +828,6 @@ static void mcam_ctlr_irq_disable(struct mcam_camera=
 *cam)
 	mcam_reg_clear_bit(cam, REG_IRQMASK, FRAMEIRQS);
 }
=20
-
-
-static void mcam_ctlr_init(struct mcam_camera *cam)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&cam->dev_lock, flags);
-	/*
-	 * Make sure it's not powered down.
-	 */
-	mcam_reg_clear_bit(cam, REG_CTRL1, C1_PWRDWN);
-	/*
-	 * Turn off the enable bit.  It sure should be off anyway,
-	 * but it's good to be sure.
-	 */
-	mcam_reg_clear_bit(cam, REG_CTRL0, C0_ENABLE);
-	/*
-	 * Clock the sensor appropriately.  Controller clock should
-	 * be 48MHz, sensor "typical" value is half that.
-	 */
-	mcam_reg_write_mask(cam, REG_CLKCTRL, 2, CLK_DIV_MASK);
-	spin_unlock_irqrestore(&cam->dev_lock, flags);
-}
-
-
 /*
  * Stop the controller, and don't return until we're really sure that no
  * further DMA is going on.
@@ -898,14 +871,15 @@ static int mcam_ctlr_power_up(struct mcam_camera *c=
am)
 	int ret;
=20
 	spin_lock_irqsave(&cam->dev_lock, flags);
-	ret =3D cam->plat_power_up(cam);
-	if (ret) {
-		spin_unlock_irqrestore(&cam->dev_lock, flags);
-		return ret;
+	if (cam->plat_power_up) {
+		ret =3D cam->plat_power_up(cam);
+		if (ret) {
+			spin_unlock_irqrestore(&cam->dev_lock, flags);
+			return ret;
+		}
 	}
 	mcam_reg_clear_bit(cam, REG_CTRL1, C1_PWRDWN);
 	spin_unlock_irqrestore(&cam->dev_lock, flags);
-	msleep(5); /* Just to be sure */
 	return 0;
 }
=20
@@ -920,10 +894,101 @@ static void mcam_ctlr_power_down(struct mcam_camer=
a *cam)
 	 * power down routine.
 	 */
 	mcam_reg_set_bit(cam, REG_CTRL1, C1_PWRDWN);
-	cam->plat_power_down(cam);
+	if (cam->plat_power_down)
+		cam->plat_power_down(cam);
 	spin_unlock_irqrestore(&cam->dev_lock, flags);
 }
=20
+/* ---------------------------------------------------------------------=
- */
+/*
+ * Controller clocks.
+ */
+static void mcam_clk_enable(struct mcam_camera *mcam)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < NR_MCAM_CLK; i++) {
+		if (!IS_ERR(mcam->clk[i]))
+			clk_prepare_enable(mcam->clk[i]);
+	}
+}
+
+static void mcam_clk_disable(struct mcam_camera *mcam)
+{
+	int i;
+
+	for (i =3D NR_MCAM_CLK - 1; i >=3D 0; i--) {
+		if (!IS_ERR(mcam->clk[i]))
+			clk_disable_unprepare(mcam->clk[i]);
+	}
+}
+
+/* ---------------------------------------------------------------------=
- */
+/*
+ * Master sensor clock.
+ */
+static int mclk_prepare(struct clk_hw *hw)
+{
+	struct mcam_camera *cam =3D container_of(hw, struct mcam_camera, mclk_h=
w);
+
+	clk_prepare(cam->clk[0]);
+	return 0;
+}
+
+static void mclk_unprepare(struct clk_hw *hw)
+{
+	struct mcam_camera *cam =3D container_of(hw, struct mcam_camera, mclk_h=
w);
+
+	clk_unprepare(cam->clk[0]);
+}
+
+static int mclk_enable(struct clk_hw *hw)
+{
+	struct mcam_camera *cam =3D container_of(hw, struct mcam_camera, mclk_h=
w);
+	int mclk_src;
+	int mclk_div;
+
+	/*
+	 * Clock the sensor appropriately.  Controller clock should
+	 * be 48MHz, sensor "typical" value is half that.
+	 */
+	if (cam->bus_type =3D=3D V4L2_MBUS_CSI2_DPHY) {
+		mclk_src =3D cam->mclk_src;
+		mclk_div =3D cam->mclk_div;
+	} else {
+		mclk_src =3D 3;
+		mclk_div =3D 2;
+	}
+
+	clk_enable(cam->clk[0]);
+	mcam_reg_write(cam, REG_CLKCTRL, (mclk_src << 29) | mclk_div);
+	mcam_ctlr_power_up(cam);
+
+	return 0;
+}
+
+static void mclk_disable(struct clk_hw *hw)
+{
+	struct mcam_camera *cam =3D container_of(hw, struct mcam_camera, mclk_h=
w);
+
+	mcam_ctlr_power_down(cam);
+	clk_disable(cam->clk[0]);
+}
+
+static unsigned long mclk_recalc_rate(struct clk_hw *hw,
+				unsigned long parent_rate)
+{
+	return 48000000;
+}
+
+static const struct clk_ops mclk_ops =3D {
+	.prepare =3D mclk_prepare,
+	.unprepare =3D mclk_unprepare,
+	.enable =3D mclk_enable,
+	.disable =3D mclk_disable,
+	.recalc_rate =3D mclk_recalc_rate,
+};
+
 /* -------------------------------------------------------------------- =
*/
 /*
  * Communications with the sensor.
@@ -948,7 +1013,6 @@ static int mcam_cam_init(struct mcam_camera *cam)
 	ret =3D __mcam_cam_reset(cam);
 	/* Get/set parameters? */
 	cam->state =3D S_IDLE;
-	mcam_ctlr_power_down(cam);
 	return ret;
 }
=20
@@ -1584,9 +1648,10 @@ static int mcam_v4l_open(struct file *filp)
 	if (ret)
 		goto out;
 	if (v4l2_fh_is_singular_file(filp)) {
-		ret =3D mcam_ctlr_power_up(cam);
+		ret =3D sensor_call(cam, core, s_power, 1);
 		if (ret)
 			goto out;
+		mcam_clk_enable(cam);
 		__mcam_cam_reset(cam);
 		mcam_set_config_needed(cam, 1);
 	}
@@ -1608,7 +1673,8 @@ static int mcam_v4l_release(struct file *filp)
 	_vb2_fop_release(filp, NULL);
 	if (last_open) {
 		mcam_disable_mipi(cam);
-		mcam_ctlr_power_down(cam);
+		sensor_call(cam, core, s_power, 0);
+		mcam_clk_disable(cam);
 		if (cam->buffer_mode =3D=3D B_vmalloc && alloc_bufs_at_read)
 			mcam_free_dma_bufs(cam);
 	}
@@ -1806,6 +1872,7 @@ static const struct v4l2_async_notifier_operations =
mccic_notify_ops =3D {
=20
 int mccic_register(struct mcam_camera *cam)
 {
+	struct clk_init_data mclk_init =3D { };
 	int ret;
=20
 	/*
@@ -1838,7 +1905,6 @@ int mccic_register(struct mcam_camera *cam)
 	mcam_set_config_needed(cam, 1);
 	cam->pix_format =3D mcam_def_pix_format;
 	cam->mbus_code =3D mcam_def_mbus_code;
-	mcam_ctlr_init(cam);
=20
 	/*
 	 * Register sensor notifier.
@@ -1857,6 +1923,26 @@ int mccic_register(struct mcam_camera *cam)
 		goto out;
 	}
=20
+	/*
+	 * Register sensor master clock.
+	 */
+	mclk_init.parent_names =3D NULL;
+	mclk_init.num_parents =3D 0;
+	mclk_init.ops =3D &mclk_ops;
+	mclk_init.name =3D "mclk";
+
+	of_property_read_string(cam->dev->of_node, "clock-output-names",
+							&mclk_init.name);
+
+	cam->mclk_hw.init =3D &mclk_init;
+
+	cam->mclk =3D devm_clk_register(cam->dev, &cam->mclk_hw);
+	if (IS_ERR(cam->mclk)) {
+		ret =3D PTR_ERR(cam->mclk);
+		dev_err(cam->dev, "can't register clock\n");
+		goto out;
+	}
+
 	/*
 	 * If so requested, try to get our DMA buffers now.
 	 */
@@ -1884,7 +1970,7 @@ void mccic_shutdown(struct mcam_camera *cam)
 	 */
 	if (!list_empty(&cam->vdev.fh_list)) {
 		cam_warn(cam, "Removing a device with users!\n");
-		mcam_ctlr_power_down(cam);
+		sensor_call(cam, core, s_power, 0);
 	}
 	if (cam->buffer_mode =3D=3D B_vmalloc)
 		mcam_free_dma_bufs(cam);
@@ -1906,7 +1992,8 @@ void mccic_suspend(struct mcam_camera *cam)
 		enum mcam_state cstate =3D cam->state;
=20
 		mcam_ctlr_stop_dma(cam);
-		mcam_ctlr_power_down(cam);
+		sensor_call(cam, core, s_power, 0);
+		mcam_clk_disable(cam);
 		cam->state =3D cstate;
 	}
 	mutex_unlock(&cam->s_mutex);
@@ -1919,14 +2006,15 @@ int mccic_resume(struct mcam_camera *cam)
=20
 	mutex_lock(&cam->s_mutex);
 	if (!list_empty(&cam->vdev.fh_list)) {
-		ret =3D mcam_ctlr_power_up(cam);
+		mcam_clk_enable(cam);
+		ret =3D sensor_call(cam, core, s_power, 1);
 		if (ret) {
 			mutex_unlock(&cam->s_mutex);
 			return ret;
 		}
 		__mcam_cam_reset(cam);
 	} else {
-		mcam_ctlr_power_down(cam);
+		sensor_call(cam, core, s_power, 0);
 	}
 	mutex_unlock(&cam->s_mutex);
=20
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.h b/drivers/me=
dia/platform/marvell-ccic/mcam-core.h
index 4a72213aca1ac..2e3a7567a76a3 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.h
+++ b/drivers/media/platform/marvell-ccic/mcam-core.h
@@ -8,6 +8,7 @@
 #define _MCAM_CORE_H
=20
 #include <linux/list.h>
+#include <linux/clk-provider.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
@@ -125,6 +126,8 @@ struct mcam_camera {
=20
 	/* clock tree support */
 	struct clk *clk[NR_MCAM_CLK];
+	struct clk_hw mclk_hw;
+	struct clk *mclk;
=20
 	/*
 	 * Callbacks from the core to the platform code.
diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/m=
edia/platform/marvell-ccic/mmp-driver.c
index eea0399fd81fe..380702cfccd6b 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -22,9 +22,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/io.h>
-#include <linux/delay.h>
 #include <linux/list.h>
 #include <linux/pm.h>
 #include <linux/clk.h>
@@ -38,7 +36,6 @@ MODULE_LICENSE("GPL");
 static char *mcam_clks[] =3D {"axi", "func", "phy"};
=20
 struct mmp_camera {
-	void __iomem *power_regs;
 	struct platform_device *pdev;
 	struct mcam_camera mcam;
 	struct list_head devlist;
@@ -94,94 +91,6 @@ static struct mmp_camera *mmpcam_find_device(struct pl=
atform_device *pdev)
 	return NULL;
 }
=20
-
-
-
-/*
- * Power-related registers; this almost certainly belongs
- * somewhere else.
- *
- * ARMADA 610 register manual, sec 7.2.1, p1842.
- */
-#define CPU_SUBSYS_PMU_BASE	0xd4282800
-#define REG_CCIC_DCGCR		0x28	/* CCIC dyn clock gate ctrl reg */
-#define REG_CCIC_CRCR		0x50	/* CCIC clk reset ctrl reg	*/
-
-static void mcam_clk_enable(struct mcam_camera *mcam)
-{
-	unsigned int i;
-
-	for (i =3D 0; i < NR_MCAM_CLK; i++) {
-		if (!IS_ERR(mcam->clk[i]))
-			clk_prepare_enable(mcam->clk[i]);
-	}
-}
-
-static void mcam_clk_disable(struct mcam_camera *mcam)
-{
-	int i;
-
-	for (i =3D NR_MCAM_CLK - 1; i >=3D 0; i--) {
-		if (!IS_ERR(mcam->clk[i]))
-			clk_disable_unprepare(mcam->clk[i]);
-	}
-}
-
-/*
- * Power control.
- */
-static void mmpcam_power_up_ctlr(struct mmp_camera *cam)
-{
-	iowrite32(0x3f, cam->power_regs + REG_CCIC_DCGCR);
-	iowrite32(0x3805b, cam->power_regs + REG_CCIC_CRCR);
-	mdelay(1);
-}
-
-static int mmpcam_power_up(struct mcam_camera *mcam)
-{
-	struct mmp_camera *cam =3D mcam_to_cam(mcam);
-	struct mmp_camera_platform_data *pdata;
-
-/*
- * Turn on power and clocks to the controller.
- */
-	mmpcam_power_up_ctlr(cam);
-	mcam_clk_enable(mcam);
-/*
- * Provide power to the sensor.
- */
-	mcam_reg_write(mcam, REG_CLKCTRL, 0x60000002);
-	pdata =3D cam->pdev->dev.platform_data;
-	gpio_set_value(pdata->sensor_power_gpio, 1);
-	mdelay(5);
-	mcam_reg_clear_bit(mcam, REG_CTRL1, 0x10000000);
-	gpio_set_value(pdata->sensor_reset_gpio, 0); /* reset is active low */
-	mdelay(5);
-	gpio_set_value(pdata->sensor_reset_gpio, 1); /* reset is active low */
-	mdelay(5);
-
-	return 0;
-}
-
-static void mmpcam_power_down(struct mcam_camera *mcam)
-{
-	struct mmp_camera *cam =3D mcam_to_cam(mcam);
-	struct mmp_camera_platform_data *pdata;
-/*
- * Turn off clocks and set reset lines
- */
-	iowrite32(0, cam->power_regs + REG_CCIC_DCGCR);
-	iowrite32(0, cam->power_regs + REG_CCIC_CRCR);
-/*
- * Shut down the sensor.
- */
-	pdata =3D cam->pdev->dev.platform_data;
-	gpio_set_value(pdata->sensor_power_gpio, 0);
-	gpio_set_value(pdata->sensor_reset_gpio, 0);
-
-	mcam_clk_disable(mcam);
-}
-
 /*
  * calc the dphy register values
  * There are three dphy registers being used.
@@ -327,8 +236,6 @@ static int mmpcam_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&cam->devlist);
=20
 	mcam =3D &cam->mcam;
-	mcam->plat_power_up =3D mmpcam_power_up;
-	mcam->plat_power_down =3D mmpcam_power_down;
 	mcam->calc_dphy =3D mmpcam_calc_dphy;
 	mcam->dev =3D &pdev->dev;
 	pdata =3D pdev->dev.platform_data;
@@ -366,33 +273,6 @@ static int mmpcam_probe(struct platform_device *pdev=
)
 	if (IS_ERR(mcam->regs))
 		return PTR_ERR(mcam->regs);
 	mcam->regs_size =3D resource_size(res);
-	/*
-	 * Power/clock memory is elsewhere; get it too.  Perhaps this
-	 * should really be managed outside of this driver?
-	 */
-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	cam->power_regs =3D devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(cam->power_regs))
-		return PTR_ERR(cam->power_regs);
-	/*
-	 * Sensor GPIO pins.
-	 */
-	ret =3D devm_gpio_request(&pdev->dev, pdata->sensor_power_gpio,
-							"cam-power");
-	if (ret) {
-		dev_err(&pdev->dev, "Can't get sensor power gpio %d",
-				pdata->sensor_power_gpio);
-		return ret;
-	}
-	gpio_direction_output(pdata->sensor_power_gpio, 0);
-	ret =3D devm_gpio_request(&pdev->dev, pdata->sensor_reset_gpio,
-							"cam-reset");
-	if (ret) {
-		dev_err(&pdev->dev, "Can't get sensor reset gpio %d",
-				pdata->sensor_reset_gpio);
-		return ret;
-	}
-	gpio_direction_output(pdata->sensor_reset_gpio, 0);
=20
 	mcam_init_clk(mcam);
=20
@@ -410,14 +290,21 @@ static int mmpcam_probe(struct platform_device *pde=
v)
 	fwnode_handle_put(ep);
=20
 	/*
-	 * Power the device up and hand it off to the core.
+	 * Register the device with the core.
 	 */
-	ret =3D mmpcam_power_up(mcam);
-	if (ret)
-		return ret;
 	ret =3D mccic_register(mcam);
 	if (ret)
-		goto out_power_down;
+		return ret;
+
+	/*
+	 * Add OF clock provider.
+	 */
+	ret =3D of_clk_add_provider(pdev->dev.of_node, of_clk_src_simple_get,
+								mcam->mclk);
+	if (ret) {
+		dev_err(&pdev->dev, "can't add DT clock provider\n");
+		goto out;
+	}
=20
 	/*
 	 * Finally, set up our IRQ now that the core is ready to
@@ -426,7 +313,7 @@ static int mmpcam_probe(struct platform_device *pdev)
 	res =3D platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (res =3D=3D NULL) {
 		ret =3D -ENODEV;
-		goto out_unregister;
+		goto out;
 	}
 	cam->irq =3D res->start;
 	ret =3D devm_request_irq(&pdev->dev, cam->irq, mmpcam_irq, IRQF_SHARED,
@@ -436,10 +323,10 @@ static int mmpcam_probe(struct platform_device *pde=
v)
 		return 0;
 	}
=20
-out_unregister:
+out:
+	fwnode_handle_put(mcam->asd.match.fwnode);
 	mccic_shutdown(mcam);
-out_power_down:
-	mmpcam_power_down(mcam);
+
 	return ret;
 }
=20
@@ -450,7 +337,6 @@ static int mmpcam_remove(struct mmp_camera *cam)
=20
 	mmpcam_remove_device(cam);
 	mccic_shutdown(mcam);
-	mmpcam_power_down(mcam);
 	return 0;
 }
=20
@@ -482,12 +368,6 @@ static int mmpcam_resume(struct platform_device *pde=
v)
 {
 	struct mmp_camera *cam =3D mmpcam_find_device(pdev);
=20
-	/*
-	 * Power up unconditionally just in case the core tries to
-	 * touch a register even if nothing was active before; trust
-	 * me, it's better this way.
-	 */
-	mmpcam_power_up_ctlr(cam);
 	return mccic_resume(&cam->mcam);
 }
=20
diff --git a/include/linux/platform_data/media/mmp-camera.h b/include/lin=
ux/platform_data/media/mmp-camera.h
index c573ebc400352..53adaab64f288 100644
--- a/include/linux/platform_data/media/mmp-camera.h
+++ b/include/linux/platform_data/media/mmp-camera.h
@@ -12,8 +12,6 @@ enum dphy3_algo {
 };
=20
 struct mmp_camera_platform_data {
-	int sensor_power_gpio;
-	int sensor_reset_gpio;
 	enum v4l2_mbus_type bus_type;
 	int mclk_src;	/* which clock source the MCLK derives from */
 	int mclk_div;	/* Clock Divider Value for MCLK */
--=20
2.21.0

