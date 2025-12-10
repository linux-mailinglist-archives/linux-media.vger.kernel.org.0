Return-Path: <linux-media+bounces-48568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 144E5CB3676
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 17:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 139CA3011ECE
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 16:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0CB2FD686;
	Wed, 10 Dec 2025 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="QCgaLdqQ"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41202F1FC3;
	Wed, 10 Dec 2025 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765382476; cv=pass; b=AqD0pdOYp39SWYyN2HOANktntbXqxopOsxMaLgmX6X5Mo4gk/pOE/hLObo3dgas3SmU6YVc4iEWAYZkgeTaW9ECb28C1SAi+YPjGSd01IWvJgwcYvINMgphuOLyYsV2rqN620Bys6VChXHVu3+2AmMDrS1toNh6pAkKY9Oc/Qfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765382476; c=relaxed/simple;
	bh=ro5BfhDBn0uLk9Kw9D3XDXJmSAi4EsJB0axFC2yUcck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Un+bUZmF05/AT37mqatQnBy+3Qp/QNdzXDyLpIzah8Ljg3UDGVD2vcGnEkIS2OnoV8y6TKQk4NHqXX2HA8znCjyZ320DwvmTWmU6k2/6PHIjUtiHmpFM4pm0guOwVzFIeq9BQnGpv+12ilyhLxABtCvoUau3YUjpbOcRk2OpS/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=QCgaLdqQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1765382430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kSHy13hAwgpa/5ZJSYe6IGxE2tt3qAGUaTlZYC9fG3Xj/dzFq8Og3HnX2Xog06Td4B3kKsf7HaIyWFiNDU6963tt1IynW3E58AdTRj3injHhQ41qUcc0Nreciobk5Cs5m/ingwOS2VgWWjP/uaVOvPR2vC8mLyWNlMS9pKQ+X6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765382430; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QIHlXyZ9eSlbG2IaJDRO0O2znKkeqfI3nu17FC9NmwA=; 
	b=M3jcY2q20BHi1f0Vy27RBAnOLX0N9OVUaCemcN2J2Wq9aPkvlrXtYao8I0756M1QgC8C5GxWcsBODj5JTR5sQ2ak8gea+B1XXSLjwHX3pM0JLV6Bb5XXfdf+TGmj8EoIy049Gqrui1uWdEwGkDJevoB/BjC3E+bnbilJtKArFSk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765382430;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QIHlXyZ9eSlbG2IaJDRO0O2znKkeqfI3nu17FC9NmwA=;
	b=QCgaLdqQoehU0jvTx1d1WjuKcRoZb/j26YTpmhn8hcwR3drY4gIJs8z/YzGnf/t0
	aXi0xdYGOJ6Tfr2kMbHJ0mLzpPY+vPIwLiUQGLZRmO+lhP5XCukj09SVxxJFWrgRNcu
	+QjVJf0alIASJ5ST6rV7GmVzds7eJuoiOdQhWh5E=
Received: by mx.zohomail.com with SMTPS id 1765382427995508.4432954640066;
	Wed, 10 Dec 2025 08:00:27 -0800 (PST)
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
Subject: [PATCH v3] media: synopsys: hdmirx: Detect broken interrupt
Date: Wed, 10 Dec 2025 19:00:06 +0300
Message-ID: <20251210160006.528997-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.51.1
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

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---

Changelog:

v3: - Added r-b from Sebastian Reichel.

v2: - Added PHY r/w lock and moved the clarifying error message as
      was suggested by Sebastian Reichel.

 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 90 ++++++++++++++++++-
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |  2 +
 2 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index c3007e09bc9f..9cceffa4ce25 100644
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
index b13f58e31944..31b887e94e87 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
@@ -116,6 +116,8 @@
 #define PHYCREG_CR_PARA_WRITE_P			BIT(1)
 #define PHYCREG_CR_PARA_READ_P			BIT(0)
 #define PHYCREG_STATUS				0x00f4
+#define PHYCREG_CR_PARA_DATAVALID		BIT(24)
+#define PHYCREG_CR_PARA_RD_DATA_MASK		GENMASK(15, 0)
 
 #define MAINUNIT_STATUS				0x0150
 #define TMDSVALID_STABLE_ST			BIT(1)
-- 
2.51.1


