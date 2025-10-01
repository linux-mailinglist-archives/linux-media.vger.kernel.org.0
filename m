Return-Path: <linux-media+bounces-43504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B0BBB1666
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 19:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89DB817D3CE
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 17:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294FB25E44D;
	Wed,  1 Oct 2025 17:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="G8eiBKxm"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B661034BA32;
	Wed,  1 Oct 2025 17:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759341154; cv=pass; b=AYTx1V2jzNdtFTg5ObSuRxUwujEBLmsiMG+nIwfaBkfYNI/WJAOIuzE7wQHlXS/W+qWgn8hc+hWzKBlfbVi3nFGP0WNCMQaVxwPoYbvqj5CVgQ9BfeAEX+vmiA7Du/3w1sBKCPmyHr4oJtmKOIkO9Ij6ZUo0DO7RQDWzmDh/bXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759341154; c=relaxed/simple;
	bh=FlsOc5fr06jMOKbVUipuHa9jrMC/UL5HXhjybzA1usg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IpBMlsf+443quc/vlN2Tirz9/CWczbz3gPuEyJYCRqnvzerxAC7jexyz2wxkkefH8NOV+3KxzjikGZYmNTiFjxuRnj6DEo60n/HNVo8JbVV+i1TbXH6ebx7KqOAwshC9OUa3aoKS3/UUDMmPJPO115VX7GMGRy/WZvqRMCsvZKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=G8eiBKxm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759341127; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ck+rPz2XUSi84WOgWvBdV2X/aQUZgJYJ5AIfR5m99q2KSZbqYF0qL/QPxlObRgndTyhwudFDNqQC8Ex6EcrnN+qe2YHPS93eslm3NRKwW8vczqIcmFTXBVupOZqDcM4obon/9NaTcXtGa5TievJ02WlXE60z0nwEdzUANr1U9iI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759341127; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fdCxgnJ3+FOn985raWo13CIC3v9SS+cHaaV3MidDI4M=; 
	b=kvxIVzV3PERnYkE46MnKCQhgdlLfbPVnp2XMn3AMbaFriiRIwzsEEAS2FiK4mZJ4EqiEicFk2Whujc6/YUib2GEBdUnR5A3izsTwhjEG79glsxeEJ6Okm/tz6TUTOddQkP99wKHqzF9pa6lakmMCBcdQXVBNa/8pZETQ0Y0ugZM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759341126;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fdCxgnJ3+FOn985raWo13CIC3v9SS+cHaaV3MidDI4M=;
	b=G8eiBKxmQZaUtY12CA7x5yBZx06hjcdOF2hT/v4Du73xeJyWMptJQW44EGdVBZvP
	JcK1DXkTXHIn16ND/ZKc9AGG6hyl42kpc3W30aChhOTt6tP77Duxz14FOrNg0IS8I8s
	O8S0YESZm8iBK33YAh48HkQQGqipb3YNssXrqCnE=
Received: by mx.zohomail.com with SMTPS id 1759341124809857.8932182744314;
	Wed, 1 Oct 2025 10:52:04 -0700 (PDT)
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
Subject: [PATCH v1] media: synopsys: hdmirx: Detect broken interrupt
Date: Wed,  1 Oct 2025 20:50:44 +0300
Message-ID: <20251001175044.502393-1-dmitry.osipenko@collabora.com>
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
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 85 ++++++++++++++++++-
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |  2 +
 2 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index b7d278b3889f..faca601d72a4 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -138,6 +138,7 @@ struct snps_hdmirx_dev {
 	struct clk_bulk_data *clks;
 	struct regmap *grf;
 	struct regmap *vo1_grf;
+	struct completion cr_read_done;
 	struct completion cr_write_done;
 	struct completion timer_base_lock;
 	struct completion avi_pkt_rcv;
@@ -796,6 +797,41 @@ static int wait_reg_bit_status(struct snps_hdmirx_dev *hdmirx_dev, u32 reg,
 	return 0;
 }
 
+static int hdmirx_phy_register_read(struct snps_hdmirx_dev *hdmirx_dev,
+				    u32 phy_reg, u32 *val)
+{
+	struct device *dev = hdmirx_dev->dev;
+	u32 status;
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
@@ -1814,6 +1850,13 @@ static void mainunit_2_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
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
@@ -2313,18 +2356,52 @@ static void hdmirx_disable_all_interrupts(struct snps_hdmirx_dev *hdmirx_dev)
 	hdmirx_clear_interrupt(hdmirx_dev, CEC_INT_CLEAR, 0xffffffff);
 }
 
-static void hdmirx_init(struct snps_hdmirx_dev *hdmirx_dev)
+static int hdmirx_detect_broken_interrupt(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	int err;
+	u32 val;
+
+	enable_irq(hdmirx_dev->hdmi_irq);
+
+	hdmirx_writel(hdmirx_dev, PHYCREG_CONFIG0, 0x3);
+
+	err = hdmirx_phy_register_read(hdmirx_dev,
+				       HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_FSM_CONFIG,
+				       &val);
+
+	disable_irq(hdmirx_dev->hdmi_irq);
+
+	if (err)
+		return dev_err_probe(hdmirx_dev->dev, err,
+				     "interrupt not functioning, open-source TF-A is required by this driver\n");
+
+	return 0;
+}
+
+static int hdmirx_init(struct snps_hdmirx_dev *hdmirx_dev)
 {
+	int ret;
+
 	hdmirx_update_bits(hdmirx_dev, PHY_CONFIG, PHY_RESET | PHY_PDDQ, 0);
 
 	regmap_write(hdmirx_dev->vo1_grf, VO1_GRF_VO1_CON2,
 		     (HDMIRX_SDAIN_MSK | HDMIRX_SCLIN_MSK) |
 		     ((HDMIRX_SDAIN_MSK | HDMIRX_SCLIN_MSK) << 16));
+
+	/*
+	 * RK3588 downstream version of TF-A remaps HDMIRX interrupt and
+	 * requires use of a vendor-specific FW API by the driver that we
+	 * don't support in this driver.
+	 */
+	ret = hdmirx_detect_broken_interrupt(hdmirx_dev);
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
@@ -2610,6 +2687,7 @@ static int hdmirx_probe(struct platform_device *pdev)
 	mutex_init(&hdmirx_dev->work_lock);
 	spin_lock_init(&hdmirx_dev->rst_lock);
 
+	init_completion(&hdmirx_dev->cr_read_done);
 	init_completion(&hdmirx_dev->cr_write_done);
 	init_completion(&hdmirx_dev->timer_base_lock);
 	init_completion(&hdmirx_dev->avi_pkt_rcv);
@@ -2623,7 +2701,10 @@ static int hdmirx_probe(struct platform_device *pdev)
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


