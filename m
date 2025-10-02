Return-Path: <linux-media+bounces-43652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFDFBB4246
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 16:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13E8418969F8
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D0B3126A2;
	Thu,  2 Oct 2025 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="U3AuxsGm"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF9D5464D;
	Thu,  2 Oct 2025 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759414125; cv=pass; b=T/PDh2Lk6CTnvI91FcY65+/ZHdf8KqqLYLuPt4bhE2z9SaNqpdaiyfoozyx70ofO41hIiP68JUds9GKQJ6FdoKcmSBU3j0MhpxWh53Y1JIFp+HixedqtCaacffmVT2l+svJgMB9qZbNR+cyUWa00GgvQtuXu9KKyeeOy6S4Y3HE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759414125; c=relaxed/simple;
	bh=K/oRkYewwRtRjFBycT7oIwzfMLulMs0/BzKhhCOARMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kFE/QGhwxtSkh6K8CPUWEaklScJfKJ28j7Bo/BDgMXLO8b60BjRmJvMiUHkUKMIZrUIcKLyuVuuEQUCKl3YsqMb9o45FEEEQWEECphF4pUVbLhnkxf8FZfhEZaAUyrTSV5XGeTitm6aNrJFS5l4Zh43RwH/30Auucgiyoqxc4ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=U3AuxsGm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759414092; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SpD3FJ8HF4/zxPOakpZNTSHpvUCOyb3dwr3O91N2hx4avMTzaPAjfXQWAx9w0QXxS15IcLy3VAPXgxtwaFl5MpV62ZerYSwN61Cy1fjn11TgvBt3AeI1FDnANubR2/3FfHttmZxsKIq1q+Rmk2FZcdlRJZnuRmx6ass50FiwfDk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759414092; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f5I790eui7ncJTuc1CPuTi7VGxSk+Va5i2GeX/jAyaA=; 
	b=TKwDayOa+oX9Xv2hBkrFtcQBMOTogOC1y4//Mmw/5BsKG0hxdvS32CTih2/RyMuuPvY0nBUWL7peODQ60qe+UtcuC30xFnUyz2hsNWauAorDgVu8a7lV4nBhlmTiQ2JYBFDX7pcO8Knl4zL6ecVegdwazQUcgBe5Ny2jolGPPFQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759414092;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=f5I790eui7ncJTuc1CPuTi7VGxSk+Va5i2GeX/jAyaA=;
	b=U3AuxsGmqgBjIQRb0bkzyMkJK0gkIeCfNLIuLsMNy8PaO9w4viS2IyY9WvNAi4gh
	grgDYroNs4GcZ/PcopqdMva4jbwhJQZoj9RpzbT1c1IBcQkj0V1NUr2Bu9H4Heu9tRE
	ZixfG8R5I9SqgpAt1IbtdEVPkRytnP9PYLyPS+JU=
Received: by mx.zohomail.com with SMTPS id 1759414089197871.3644749751696;
	Thu, 2 Oct 2025 07:08:09 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2] media: synopsys: hdmirx: Detect broken interrupt
Date: Thu,  2 Oct 2025 17:07:50 +0300
Message-ID: <20251002140750.579059-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Downstream version of RK3588 U-Boot uses customized TF-A that remaps
HDMIRX hardware interrupt, routing it via firmware that isn't supported
by upstream driver.

Detect broken interrupt and print a clarifying error message about a need
to use open-source TF-A with this driver.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---

Changelog:

v2: - Added PHY r/w lock and moved the clarifying error message as
      was suggested by Sebastian Reichel.

 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 90 ++++++++++++++++++-
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |  2 +
 2 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index b7d278b3889f..e6456352dfa5 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -132,12 +132,14 @@ struct snps_hdmirx_dev {
 	struct delayed_work delayed_work_hotplug;
 	struct delayed_work delayed_work_res_change;
 	struct hdmirx_cec *cec;
+	struct mutex phy_rw_lock; /* to protect phy r/w configuration */
 	struct mutex stream_lock; /* to lock video stream capture */
 	struct mutex work_lock; /* to lock the critical section of hotplug event */
 	struct reset_control_bulk_data resets[HDMIRX_NUM_RST];
 	struct clk_bulk_data *clks;
 	struct regmap *grf;
 	struct regmap *vo1_grf;
+	struct completion cr_read_done;
 	struct completion cr_write_done;
 	struct completion timer_base_lock;
 	struct completion avi_pkt_rcv;
@@ -796,11 +798,50 @@ static int wait_reg_bit_status(struct snps_hdmirx_dev *hdmirx_dev, u32 reg,
 	return 0;
 }
 
+static int hdmirx_phy_register_read(struct snps_hdmirx_dev *hdmirx_dev,
+				    u32 phy_reg, u32 *val)
+{
+	struct device *dev = hdmirx_dev->dev;
+	u32 status;
+
+	guard(mutex)(&hdmirx_dev->phy_rw_lock);
+
+	reinit_completion(&hdmirx_dev->cr_read_done);
+	/* clear irq status */
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_2_INT_CLEAR, 0xffffffff);
+	/* en irq */
+	hdmirx_update_bits(hdmirx_dev, MAINUNIT_2_INT_MASK_N,
+			   PHYCREG_CR_READ_DONE, PHYCREG_CR_READ_DONE);
+	/* write phy reg addr */
+	hdmirx_writel(hdmirx_dev, PHYCREG_CONFIG1, phy_reg);
+	/* config read enable */
+	hdmirx_writel(hdmirx_dev, PHYCREG_CONTROL, PHYCREG_CR_PARA_READ_P);
+
+	if (!wait_for_completion_timeout(&hdmirx_dev->cr_read_done,
+					 msecs_to_jiffies(20))) {
+		dev_err(dev, "%s wait cr read done failed\n", __func__);
+		return -ETIMEDOUT;
+	}
+
+	/* read phy reg value */
+	status = hdmirx_readl(hdmirx_dev, PHYCREG_STATUS);
+	if (!(status & PHYCREG_CR_PARA_DATAVALID)) {
+		dev_err(dev, "%s cr read failed\n", __func__);
+		return -EINVAL;
+	}
+
+	*val = status & PHYCREG_CR_PARA_RD_DATA_MASK;
+
+	return 0;
+}
+
 static int hdmirx_phy_register_write(struct snps_hdmirx_dev *hdmirx_dev,
 				     u32 phy_reg, u32 val)
 {
 	struct device *dev = hdmirx_dev->dev;
 
+	guard(mutex)(&hdmirx_dev->phy_rw_lock);
+
 	reinit_completion(&hdmirx_dev->cr_write_done);
 	/* clear irq status */
 	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_2_INT_CLEAR, 0xffffffff);
@@ -1814,6 +1855,13 @@ static void mainunit_2_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
 		*handled = true;
 	}
 
+	if (status & PHYCREG_CR_READ_DONE) {
+		hdmirx_update_bits(hdmirx_dev, MAINUNIT_2_INT_MASK_N,
+				   PHYCREG_CR_READ_DONE, 0);
+		complete(&hdmirx_dev->cr_read_done);
+		*handled = true;
+	}
+
 	if (status & TMDSVALID_STABLE_CHG) {
 		process_signal_change(hdmirx_dev);
 		v4l2_dbg(2, debug, v4l2_dev, "%s: TMDSVALID_STABLE_CHG\n", __func__);
@@ -2313,18 +2361,51 @@ static void hdmirx_disable_all_interrupts(struct snps_hdmirx_dev *hdmirx_dev)
 	hdmirx_clear_interrupt(hdmirx_dev, CEC_INT_CLEAR, 0xffffffff);
 }
 
-static void hdmirx_init(struct snps_hdmirx_dev *hdmirx_dev)
+static int hdmirx_detect_broken_interrupt(struct snps_hdmirx_dev *hdmirx_dev)
 {
+	int ret;
+	u32 val;
+
+	enable_irq(hdmirx_dev->hdmi_irq);
+
+	hdmirx_writel(hdmirx_dev, PHYCREG_CONFIG0, 0x3);
+
+	ret = hdmirx_phy_register_read(hdmirx_dev,
+				       HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_FSM_CONFIG,
+				       &val);
+
+	disable_irq(hdmirx_dev->hdmi_irq);
+
+	return ret;
+}
+
+static int hdmirx_init(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	int ret;
+
 	hdmirx_update_bits(hdmirx_dev, PHY_CONFIG, PHY_RESET | PHY_PDDQ, 0);
 
 	regmap_write(hdmirx_dev->vo1_grf, VO1_GRF_VO1_CON2,
 		     (HDMIRX_SDAIN_MSK | HDMIRX_SCLIN_MSK) |
 		     ((HDMIRX_SDAIN_MSK | HDMIRX_SCLIN_MSK) << 16));
+
+	/*
+	 * RK3588 downstream version of TF-A remaps HDMIRX interrupt and
+	 * requires use of a vendor-specific FW API that we don't support
+	 * in this driver.
+	 */
+	ret = hdmirx_detect_broken_interrupt(hdmirx_dev);
+	if (ret)
+		dev_err_probe(hdmirx_dev->dev, ret,
+			      "interrupt not functioning, open-source TF-A is required by this driver\n");
+
 	/*
 	 * Some interrupts are enabled by default, so we disable
 	 * all interrupts and clear interrupts status first.
 	 */
 	hdmirx_disable_all_interrupts(hdmirx_dev);
+
+	return ret;
 }
 
 /* hdmi-4k-300mhz EDID produced by v4l2-ctl tool */
@@ -2606,10 +2687,12 @@ static int hdmirx_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(hdmirx_dev->regs),
 				     "failed to remap regs resource\n");
 
+	mutex_init(&hdmirx_dev->phy_rw_lock);
 	mutex_init(&hdmirx_dev->stream_lock);
 	mutex_init(&hdmirx_dev->work_lock);
 	spin_lock_init(&hdmirx_dev->rst_lock);
 
+	init_completion(&hdmirx_dev->cr_read_done);
 	init_completion(&hdmirx_dev->cr_write_done);
 	init_completion(&hdmirx_dev->timer_base_lock);
 	init_completion(&hdmirx_dev->avi_pkt_rcv);
@@ -2623,7 +2706,10 @@ static int hdmirx_probe(struct platform_device *pdev)
 	hdmirx_dev->timings = cea640x480;
 
 	hdmirx_enable(dev);
-	hdmirx_init(hdmirx_dev);
+
+	ret = hdmirx_init(hdmirx_dev);
+	if (ret)
+		goto err_pm;
 
 	v4l2_dev = &hdmirx_dev->v4l2_dev;
 	strscpy(v4l2_dev->name, dev_name(dev), sizeof(v4l2_dev->name));
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
index 220ab99ca611..a719439d3ca0 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
@@ -114,6 +114,8 @@
 #define PHYCREG_CR_PARA_WRITE_P			BIT(1)
 #define PHYCREG_CR_PARA_READ_P			BIT(0)
 #define PHYCREG_STATUS				0x00f4
+#define PHYCREG_CR_PARA_DATAVALID		BIT(24)
+#define PHYCREG_CR_PARA_RD_DATA_MASK		GENMASK(15, 0)
 
 #define MAINUNIT_STATUS				0x0150
 #define TMDSVALID_STABLE_ST			BIT(1)
-- 
2.51.0


