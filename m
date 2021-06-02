Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F54739882E
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 13:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbhFBL0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 07:26:32 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:59206 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232446AbhFBL0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 07:26:22 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B51C7C0519;
        Wed,  2 Jun 2021 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1622633079; bh=H+ZePRy1wBBkBuCcN4AdNiR+ANsfafQYKfQwa1u1LJk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=AAuv2QeZrEmt0AnRXxPa2WL5eiGLmQzro7vKlGmvI9tiQ7ddjm9tF5wf4Rz5t1Hos
         wBOk+r0U5gFvHmw5zmgZtnC1xVcc1gAm6RQGLinBTWnnlKoWRh/CMJzFoph1WLlpcc
         FMpWJuvOIEkKpbQNkCR7+to7QMHdtj6NJpp8gBsHcBW4QGoYAT74tl+X05c4mu7EIJ
         gfE6xAzT4w3ptUEmaKXc0yHQ9k56XnTjmpZzjHwVgiqqJsvFXDhshQr+6fbiXm8fyH
         +Zh7ViBBf9LHz6bMmwj7lEDWlWuzPuC5e3I0JnABeBsB1c1lnLkOjKPaVL00I106mL
         BeU+Hu2vo0e/g==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id 7B242A009D;
        Wed,  2 Jun 2021 11:24:37 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From:   Nelson Costa <Nelson.Costa@synopsys.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Nelson Costa <Nelson.Costa@synopsys.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [PATCH 9/9] media: dwc: dw-hdmi-rx: Add support for CEC
Date:   Wed,  2 Jun 2021 13:24:27 +0200
Message-Id: <86557797e979ce29ed97dd1ed0db8499a6ccbc34.1622631488.git.nelson.costa@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1622631488.git.nelson.costa@synopsys.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
In-Reply-To: <cover.1622631488.git.nelson.costa@synopsys.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds support for the optional HDMI CEC feature
for the Synopsys DesignWare HDMI RX Controller.

It uses the generic CEC framework interface.

Signed-off-by: Jose Abreu <jose.abreu@synopsys.com>
Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
---
 drivers/media/platform/dwc/Kconfig      |  10 ++
 drivers/media/platform/dwc/dw-hdmi-rx.c | 259 +++++++++++++++++++++++++++++++-
 drivers/media/platform/dwc/dw-hdmi-rx.h |  57 +++++++
 3 files changed, 324 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/dwc/Kconfig b/drivers/media/platform/dwc/Kconfig
index e915ca6..b487a92 100644
--- a/drivers/media/platform/dwc/Kconfig
+++ b/drivers/media/platform/dwc/Kconfig
@@ -11,3 +11,13 @@ config VIDEO_DWC_HDMI_RX
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called dw-hdmi-rx.
+
+config VIDEO_DWC_HDMI_RX_CEC
+	bool "Synopsys DesignWare HDMI Receiver CEC support"
+	depends on VIDEO_DWC_HDMI_RX
+	select CEC_CORE
+	help
+	  When selected the Synopsys DesignWare HDMI RX controller
+	  will support the optional HDMI CEC feature.
+
+	  It uses the generic CEC framework interface.
diff --git a/drivers/media/platform/dwc/dw-hdmi-rx.c b/drivers/media/platform/dwc/dw-hdmi-rx.c
index a468a93..5d6b1c0 100644
--- a/drivers/media/platform/dwc/dw-hdmi-rx.c
+++ b/drivers/media/platform/dwc/dw-hdmi-rx.c
@@ -21,6 +21,7 @@
 #include <linux/workqueue.h>
 #include <linux/rational.h>
 #include <linux/hdmi.h>
+#include <media/cec.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -36,6 +37,7 @@
 #define DW_HDMI_JTAG_TAP_WRITE_CMD	1
 #define DW_HDMI_JTAG_TAP_READ_CMD	3
 #define DW_HDMI_AUDIO_FREQ_RANGE	1000
+#define DW_HDMI_CEC_MAX_LOG_ADDRS	CEC_MAX_LOG_ADDRS
 
 /* EDID for HDMI RX */
 static u32 dw_hdmi_edid[] = {
@@ -164,6 +166,9 @@ struct dw_hdmi_dev {
 	union hdmi_infoframe audioif;
 	union hdmi_infoframe vsif;
 
+	/* CEC */
+	struct cec_adapter *cec_adap;
+
 	/* v4l2 device */
 	struct v4l2_subdev sd;
 	struct v4l2_ctrl_handler hdl;
@@ -365,6 +370,20 @@ static void dw_hdmi_reset(struct dw_hdmi_dev *dw_dev)
 	dw_hdmi_main_reset(dw_dev);
 
 	dw_hdmi_disable_hpd(dw_dev);
+
+	/* After a main reset try to re-enable the cec adapter in order to
+	 * reconfigure the required cec registers. For this the physical address
+	 * is invalidated and reconfigured, and with CEC_CAP_NEEDS_HPD allowing
+	 * to re-enable the adapter.
+	 */
+	if (dw_dev->cec_adap) {
+		u16 phys_addr = dw_dev->cec_adap->phys_addr;
+
+		cec_phys_addr_invalidate(dw_dev->cec_adap);
+		cec_s_phys_addr(dw_dev->cec_adap, phys_addr, false);
+		dev_dbg(dw_dev->dev, "%s: re-enable cec adapter\n",
+			__func__);
+	}
 }
 
 static inline bool is_off(struct dw_hdmi_dev *dw_dev)
@@ -1460,6 +1479,184 @@ static u32 dw_hdmi_get_int_val(struct dw_hdmi_dev *dw_dev, u32 ists, u32 ien)
 	return hdmi_readl(dw_dev, ists) & hdmi_readl(dw_dev, ien);
 }
 
+#if IS_ENABLED(CONFIG_VIDEO_DWC_HDMI_RX_CEC)
+static void dw_hdmi_cec_enable_ints(struct dw_hdmi_dev *dw_dev)
+{
+	u32 mask = DW_HDMI_DONE_ISTS | DW_HDMI_EOM_ISTS |
+		DW_HDMI_NACK_ISTS | DW_HDMI_ARBLST_ISTS |
+		DW_HDMI_ERROR_INIT_ISTS | DW_HDMI_ERROR_FOLL_ISTS;
+
+	hdmi_writel(dw_dev, mask, DW_HDMI_AUD_CEC_IEN_SET);
+	hdmi_writel(dw_dev, 0x0, DW_HDMI_CEC_MASK);
+}
+
+static void dw_hdmi_cec_disable_ints(struct dw_hdmi_dev *dw_dev)
+{
+	hdmi_writel(dw_dev, ~0x0, DW_HDMI_AUD_CEC_IEN_CLR);
+	hdmi_writel(dw_dev, ~0x0, DW_HDMI_CEC_MASK);
+}
+
+static void dw_hdmi_cec_clear_ints(struct dw_hdmi_dev *dw_dev)
+{
+	hdmi_writel(dw_dev, ~0x0, DW_HDMI_AUD_CEC_ICLR);
+}
+
+static void dw_hdmi_cec_tx_raw_status(struct dw_hdmi_dev *dw_dev, u32 stat)
+{
+	if (hdmi_readl(dw_dev, DW_HDMI_CEC_CTRL) & DW_HDMI_SEND_MASK) {
+		dev_dbg(dw_dev->dev, "%s: tx is busy\n", __func__);
+		return;
+	}
+
+	if (stat & DW_HDMI_ARBLST_ISTS) {
+		cec_transmit_attempt_done(dw_dev->cec_adap,
+					  CEC_TX_STATUS_ARB_LOST);
+		return;
+	}
+
+	if (stat & DW_HDMI_NACK_ISTS) {
+		cec_transmit_attempt_done(dw_dev->cec_adap, CEC_TX_STATUS_NACK);
+		return;
+	}
+
+	if (stat & DW_HDMI_ERROR_INIT_ISTS) {
+		dev_dbg(dw_dev->dev, "%s: got low drive error\n", __func__);
+		cec_transmit_attempt_done(dw_dev->cec_adap,
+					  CEC_TX_STATUS_LOW_DRIVE);
+		return;
+	}
+
+	if (stat & DW_HDMI_DONE_ISTS) {
+		cec_transmit_attempt_done(dw_dev->cec_adap, CEC_TX_STATUS_OK);
+		return;
+	}
+}
+
+static void dw_hdmi_cec_received_msg(struct dw_hdmi_dev *dw_dev)
+{
+	struct cec_msg msg;
+	u8 i;
+
+	msg.len = hdmi_readl(dw_dev, DW_HDMI_CEC_RX_CNT);
+	if (!msg.len || msg.len > DW_HDMI_CEC_RX_DATA_MAX)
+		return; /* it's an invalid/non-existent message */
+
+	for (i = 0; i < msg.len; i++)
+		msg.msg[i] = hdmi_readl(dw_dev, DW_HDMI_CEC_RX_DATA(i));
+
+	hdmi_writel(dw_dev, 0x0, DW_HDMI_CEC_LOCK);
+	cec_received_msg(dw_dev->cec_adap, &msg);
+}
+
+static int dw_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
+{
+	struct dw_hdmi_dev *dw_dev = cec_get_drvdata(adap);
+
+	dev_dbg(dw_dev->dev, "%s: enable=%d\n", __func__, enable);
+
+	hdmi_writel(dw_dev, 0x0, DW_HDMI_CEC_ADDR_L);
+	hdmi_writel(dw_dev, 0x0, DW_HDMI_CEC_ADDR_H);
+
+	if (enable) {
+		hdmi_writel(dw_dev, 0x0, DW_HDMI_CEC_LOCK);
+		dw_hdmi_cec_clear_ints(dw_dev);
+		dw_hdmi_cec_enable_ints(dw_dev);
+	} else {
+		dw_hdmi_cec_disable_ints(dw_dev);
+		dw_hdmi_cec_clear_ints(dw_dev);
+	}
+
+	return 0;
+}
+
+static int dw_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 addr)
+{
+	struct dw_hdmi_dev *dw_dev = cec_get_drvdata(adap);
+	u32 tmp;
+
+	dev_dbg(dw_dev->dev, "%s: addr=%d\n", __func__, addr);
+
+	if (addr == CEC_LOG_ADDR_INVALID) {
+		hdmi_writel(dw_dev, 0x0, DW_HDMI_CEC_ADDR_L);
+		hdmi_writel(dw_dev, 0x0, DW_HDMI_CEC_ADDR_H);
+		return 0;
+	}
+
+	if (addr >= 8) {
+		tmp = hdmi_readl(dw_dev, DW_HDMI_CEC_ADDR_H);
+		tmp |= BIT(addr - 8);
+		hdmi_writel(dw_dev, tmp, DW_HDMI_CEC_ADDR_H);
+	} else {
+		tmp = hdmi_readl(dw_dev, DW_HDMI_CEC_ADDR_L);
+		tmp |= BIT(addr);
+		hdmi_writel(dw_dev, tmp, DW_HDMI_CEC_ADDR_L);
+	}
+
+	return 0;
+}
+
+static int dw_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
+				     u32 signal_free_time, struct cec_msg *msg)
+{
+	struct dw_hdmi_dev *dw_dev = cec_get_drvdata(adap);
+	u8 len = msg->len;
+	u32 reg;
+	u8 i;
+
+	dev_dbg(dw_dev->dev, "%s: len=%d\n", __func__, len);
+
+	if (hdmi_readl(dw_dev, DW_HDMI_CEC_CTRL) & DW_HDMI_SEND_MASK) {
+		dev_err(dw_dev->dev, "%s: tx is busy\n", __func__);
+		return -EBUSY;
+	}
+
+	for (i = 0; i < len; i++)
+		hdmi_writel(dw_dev, msg->msg[i], DW_HDMI_CEC_TX_DATA(i));
+
+	switch (signal_free_time) {
+	case CEC_SIGNAL_FREE_TIME_RETRY:
+		reg = 0x0;
+		break;
+	case CEC_SIGNAL_FREE_TIME_NEXT_XFER:
+		reg = 0x2;
+		break;
+	case CEC_SIGNAL_FREE_TIME_NEW_INITIATOR:
+	default:
+		reg = 0x1;
+		break;
+	}
+
+	hdmi_writel(dw_dev, len, DW_HDMI_CEC_TX_CNT);
+	hdmi_mask_writel(dw_dev, reg, DW_HDMI_CEC_CTRL,
+			 DW_HDMI_FRAME_TYP_OFFSET,
+			 DW_HDMI_FRAME_TYP_MASK);
+	hdmi_mask_writel(dw_dev, 0x1, DW_HDMI_CEC_CTRL,
+			 DW_HDMI_SEND_OFFSET,
+			 DW_HDMI_SEND_MASK);
+	return 0;
+}
+
+static const struct cec_adap_ops dw_hdmi_cec_adap_ops = {
+	.adap_enable = dw_hdmi_cec_adap_enable,
+	.adap_log_addr = dw_hdmi_cec_adap_log_addr,
+	.adap_transmit = dw_hdmi_cec_adap_transmit,
+};
+
+static void dw_hdmi_cec_irq_handler(struct dw_hdmi_dev *dw_dev)
+{
+	u32 cec_ists = dw_hdmi_get_int_val(dw_dev, DW_HDMI_AUD_CEC_ISTS,
+			DW_HDMI_AUD_CEC_IEN);
+
+	dw_hdmi_cec_clear_ints(dw_dev);
+
+	if (cec_ists) {
+		dw_hdmi_cec_tx_raw_status(dw_dev, cec_ists);
+		if (cec_ists & DW_HDMI_EOM_ISTS)
+			dw_hdmi_cec_received_msg(dw_dev);
+	}
+}
+#endif /* CONFIG_VIDEO_DWC_HDMI_RX_CEC */
+
 static u8 dw_hdmi_get_curr_vic(struct dw_hdmi_dev *dw_dev, bool *is_hdmi_vic)
 {
 	u8 vic = hdmi_mask_readl(dw_dev, DW_HDMI_PDEC_AVI_PB,
@@ -2058,6 +2255,10 @@ static irqreturn_t dw_hdmi_irq_handler(int irq, void *dev_data)
 		}
 	}
 
+#if IS_ENABLED(CONFIG_VIDEO_DWC_HDMI_RX_CEC)
+	dw_hdmi_cec_irq_handler(dw_dev);
+#endif /* CONFIG_VIDEO_DWC_HDMI_RX_CEC */
+
 	return IRQ_HANDLED;
 }
 
@@ -2556,14 +2757,27 @@ static int dw_hdmi_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 	struct dw_hdmi_dev *dw_dev = to_dw_dev(sd);
 	int input_count = dw_dev->config->phy->input_count;
 	int size, ret;
+	u16 phys_addr;
 	u32 *tmp;
 
 	memset(edid->reserved, 0, sizeof(edid->reserved));
 
-	if (edid->pad >= input_count || !edid->edid || !edid->blocks)
+	if (edid->pad >= input_count || !edid->edid)
 		return -EINVAL;
 	if (edid->start_block != 0)
 		return -EINVAL;
+	if (!edid->blocks) {
+		phys_addr = CEC_PHYS_ADDR_INVALID;
+		goto set_phys_addr;
+	}
+
+	/* get the source physical address (PA) from edid */
+	phys_addr = cec_get_edid_phys_addr(edid->edid, edid->blocks * 128,
+					   NULL);
+	/* get the own physical address getting the parent of Source PA */
+	ret = v4l2_phys_addr_validate(phys_addr, &phys_addr, NULL);
+	if (ret)
+		return ret;
 
 	/* Clear old EDID */
 	size = dw_dev->curr_edid_blocks[edid->pad] * 128;
@@ -2592,7 +2806,9 @@ static int dw_hdmi_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 	if (ret)
 		return ret;
 
+set_phys_addr:
 	dw_dev->curr_edid_blocks[edid->pad] = edid->blocks;
+	cec_s_phys_addr(dw_dev->cec_adap, phys_addr, false);
 	return 0;
 }
 
@@ -2825,15 +3041,33 @@ static int dw_hdmi_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 static int dw_hdmi_registered(struct v4l2_subdev *sd)
 {
 	struct dw_hdmi_dev *dw_dev = to_dw_dev(sd);
+	int ret;
+
+	ret = cec_register_adapter(dw_dev->cec_adap, dw_dev->dev);
+	if (ret) {
+		dev_err(dw_dev->dev, "failed to register CEC adapter\n");
+		goto err_adapter;
+	}
+	cec_s_phys_addr(dw_dev->cec_adap, 0, false);
+	if (dw_dev->cec_adap)
+		dev_info(dw_dev->dev,
+			 "CEC adapter %s registered for HDMI input\n",
+			 dev_name(&dw_dev->cec_adap->devnode.dev));
 
 	dw_dev->registered = true;
 	return 0;
+
+err_adapter:
+	cec_delete_adapter(dw_dev->cec_adap);
+	return ret;
 }
 
 static void dw_hdmi_unregistered(struct v4l2_subdev *sd)
 {
 	struct dw_hdmi_dev *dw_dev = to_dw_dev(sd);
 
+	cec_unregister_adapter(dw_dev->cec_adap);
+
 	dw_dev->registered = false;
 }
 
@@ -3194,10 +3428,29 @@ static int dw_hdmi_rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_phy_exit;
 
+	/* CEC */
+#if IS_ENABLED(CONFIG_VIDEO_DWC_HDMI_RX_CEC)
+	dw_dev->cec_adap = cec_allocate_adapter(&dw_hdmi_cec_adap_ops,
+						dw_dev, dev_name(dev),
+						(CEC_CAP_DEFAULTS |
+						 CEC_CAP_NEEDS_HPD |
+						 CEC_CAP_CONNECTOR_INFO),
+						DW_HDMI_CEC_MAX_LOG_ADDRS);
+	ret = PTR_ERR_OR_ZERO(dw_dev->cec_adap);
+	if (ret) {
+		dev_err(dev, "failed to allocate CEC adapter\n");
+		goto err_cec;
+	}
+
+	dev_info(dev, "CEC is enabled\n");
+#else
+	dev_info(dev, "CEC is disabled\n");
+#endif /* CONFIG_VIDEO_DWC_HDMI_RX_CEC */
+
 	ret = v4l2_async_register_subdev(sd);
 	if (ret) {
 		dev_err(dev, "failed to register subdev\n");
-		goto err_phy_exit;
+		goto err_cec;
 	}
 
 	/* Fill initial format settings */
@@ -3230,6 +3483,8 @@ static int dw_hdmi_rx_probe(struct platform_device *pdev)
 
 err_subdev:
 	v4l2_async_unregister_subdev(sd);
+err_cec:
+	cec_delete_adapter(dw_dev->cec_adap);
 err_phy_exit:
 	dw_hdmi_phy_exit(dw_dev);
 err_hdl:
diff --git a/drivers/media/platform/dwc/dw-hdmi-rx.h b/drivers/media/platform/dwc/dw-hdmi-rx.h
index f0ea1d4..775b7a9 100644
--- a/drivers/media/platform/dwc/dw-hdmi-rx.h
+++ b/drivers/media/platform/dwc/dw-hdmi-rx.h
@@ -325,6 +325,25 @@
 
 #define DW_HDMI_HDCP22_STATUS			0x08fc
 
+/* id_audio_and_cec_interrupt Registers */
+#define DW_HDMI_AUD_CEC_IEN_CLR			0x0f90
+#define DW_HDMI_AUD_CEC_IEN_SET			0x0f94
+
+#define DW_HDMI_AUD_CEC_ISTS			0x0f98
+#define DW_HDMI_WAKEUPCTRL_ISTS			BIT(22)
+#define DW_HDMI_ERROR_FOLL_ISTS			BIT(21)
+#define DW_HDMI_ERROR_INIT_ISTS			BIT(20)
+#define DW_HDMI_ARBLST_ISTS			BIT(19)
+#define DW_HDMI_NACK_ISTS			BIT(18)
+#define DW_HDMI_EOM_ISTS			BIT(17)
+#define DW_HDMI_DONE_ISTS			BIT(16)
+#define DW_HDMI_SCK_STABLE_ISTS			BIT(1)
+#define DW_HDMI_CTSN_CNT_ISTS			BIT(0)
+
+#define DW_HDMI_AUD_CEC_IEN			0x0f9c
+#define DW_HDMI_AUD_CEC_ICLR			0x0fa0
+#define DW_HDMI_AUD_CEC_ISET			0x0fa4
+
 /* id_mode_detection_interrupt Registers */
 #define DW_HDMI_MD_IEN_CLR			0x0fc0
 #define DW_HDMI_MD_IEN_SET			0x0fc4
@@ -426,6 +445,44 @@
 #define DW_HDMI_HDMI_ENABLE_MASK		BIT(2)
 #define DW_HDMI_HDMI_ENABLE_OFFSET		2
 
+/* id_cec Registers */
+#define DW_HDMI_CEC_CTRL			0x1f00
+#define DW_HDMI_STANDBY_MASK			BIT(4)
+#define DW_HDMI_STANDBY_OFFSET			4
+#define DW_HDMI_BC_NACK_MASK			BIT(3)
+#define DW_HDMI_BC_NACK_OFFSET			3
+#define DW_HDMI_FRAME_TYP_MASK			GENMASK(2, 1)
+#define DW_HDMI_FRAME_TYP_OFFSET		1
+#define DW_HDMI_SEND_MASK			BIT(0)
+#define DW_HDMI_SEND_OFFSET			0
+
+#define DW_HDMI_CEC_MASK			0x1f08
+#define DW_HDMI_WAKEUP_MASK			BIT(6)
+#define DW_HDMI_WAKEUP_OFFSET			6
+#define DW_HDMI_ERROR_FLOW_MASK			BIT(5)
+#define DW_HDMI_ERROR_FLOW_OFFSET		5
+#define DW_HDMI_ERROR_INITITATOR_MASK		BIT(4)
+#define DW_HDMI_ERROR_INITITATOR_OFFSET		4
+#define DW_HDMI_ARB_LOST_MASK			BIT(3)
+#define DW_HDMI_ARB_LOST_OFFSET			3
+#define DW_HDMI_NACK_MASK			BIT(2)
+#define DW_HDMI_NACK_OFFSET			2
+#define DW_HDMI_EOM_MASK			BIT(1)
+#define DW_HDMI_EOM_OFFSET			1
+#define DW_HDMI_DONE_MASK			BIT(0)
+#define DW_HDMI_DONE_OFFSET			0
+
+#define DW_HDMI_CEC_ADDR_L			0x1f14
+#define DW_HDMI_CEC_ADDR_H			0x1f18
+#define DW_HDMI_CEC_TX_CNT			0x1f1c
+#define DW_HDMI_CEC_RX_CNT			0x1f20
+#define DW_HDMI_CEC_TX_DATA(i)			(0x1f40 + ((i) * 4))
+#define DW_HDMI_CEC_TX_DATA_MAX			16
+#define DW_HDMI_CEC_RX_DATA(i)			(0x1f80 + ((i) * 4))
+#define DW_HDMI_CEC_RX_DATA_MAX			16
+#define DW_HDMI_CEC_LOCK			0x1fc0
+#define DW_HDMI_CEC_WAKEUPCTRL			0x1fc4
+
 /* id_cbus Registers */
 #define DW_HDMI_CBUSIOCTRL			0x3020
 #define DW_HDMI_DATAPATH_CBUSZ_MASK		BIT(24)
-- 
2.7.4

