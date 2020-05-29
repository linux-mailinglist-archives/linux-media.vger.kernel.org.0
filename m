Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147A31E732E
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 05:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391749AbgE2DAb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 23:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391727AbgE2DA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 23:00:26 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73626C08C5C7
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 20:00:25 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id l1so1249247qtv.13
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 20:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=noLgLaRRhmzV7glB28WlAVXUHHfBvHqFfjqfyquA2fE=;
        b=e7+hI7E7ocDi+ING3iSXQNyiq/p7lr8BjNcM6VSqF8jVoqM7k07wpzcAkkyQruTDVI
         Pn5xdBr7w6sOrvmwz+lS9iKu/URKcpzMPLTXh8sSbPJkq7P2jE4F2vVhommctOxpsrHa
         Tl61TBV3TnHnIBmqqMeyi4GaBor8Yebi1qSKx3xeSG5/L6gpYX0cvTtR1/SR9Pd8ZXVj
         408DlRIvL5+Bc5qk5obA9EeKCFkYh8s6D7dImXGirdRQ5WeBb6V+k8gDzM6sm2nBFFD/
         xIJLcQtVGzPf0JkzF0ycjFzLNfATkoulfPPIJb249b0U3Znn+NfdFPxTplEB1mSBV/D9
         k7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=noLgLaRRhmzV7glB28WlAVXUHHfBvHqFfjqfyquA2fE=;
        b=D+1+tGyCfg7iZYI9GV51zH4gf5zEyc+SSJzoapbFc+99nnnwuLPDH7SUcDve/oR75k
         1zTl2hDsjx+DIofa/QqkpmVXZYORfktQfZSdEdT84ax2D/CQqwUKyPuCkISrl7Jcz3oW
         mXa2wH903kWqNIkEoz2IpsIJEWT6XwM7OPbj5AhnCkIRXtlEuNqW0MjJMQlswsyAcY6E
         xLGHRJUNJMwcaDDDxKiW5h2zA3bVe0DisRR78PUIQN8A7hdP4bPE8fYoJVucUQbmq1Nl
         vFI1htfBsl0IVzyaTKaW+6DCZvnm3z4N+20uJfg61cKqEtYw+ab78OhgXBz+GdDgLSug
         IHqQ==
X-Gm-Message-State: AOAM53049IkP36r+D9nP8G9lO4r8AUFtrqzYzIErncYO0768zZ28DWG9
        vyPxfaawyDrkH/0JzZJ3XbhvC9Cwwch2ridgLWFVYF5dFY4FfRZ1fQ9ai5VQTYXVbg3RKb/xVj3
        S16/3x/huzi11bdC+VmP+E/HVkMMkxo0euw0fh6WNM85PvYuiUC9ntt+IPaV26Cq8N1IyOdA=
X-Google-Smtp-Source: ABdhPJzBzjQ79m8/sfOKoDDCOWCzDKcL1tj09wTBUTGGG15grs7SNG8MuCGeOQ0b9mIvpx5rTMP5jsnp2bjc
X-Received: by 2002:a0c:d981:: with SMTP id y1mr6428570qvj.64.1590721224512;
 Thu, 28 May 2020 20:00:24 -0700 (PDT)
Date:   Thu, 28 May 2020 23:00:12 -0400
In-Reply-To: <20200529030012.254592-1-jnchase@google.com>
Message-Id: <20200529030012.254592-3-jnchase@google.com>
Mime-Version: 1.0
References: <20200529030012.254592-1-jnchase@google.com>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
Subject: [PATCH v3 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller driver
From:   Jeff Chase <jnchase@google.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Jeff Chase <jnchase@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a CEC device driver for the Chrontel ch7322 CEC conroller.
This is an I2C device capable of sending and receiving CEC messages.

Signed-off-by: Jeff Chase <jnchase@google.com>
---
 MAINTAINERS                    |   1 +
 drivers/media/cec/Kconfig      |   1 +
 drivers/media/cec/Makefile     |   2 +-
 drivers/media/cec/i2c/Kconfig  |  14 +
 drivers/media/cec/i2c/Makefile |   5 +
 drivers/media/cec/i2c/ch7322.c | 523 +++++++++++++++++++++++++++++++++
 6 files changed, 545 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/cec/i2c/Kconfig
 create mode 100644 drivers/media/cec/i2c/Makefile
 create mode 100644 drivers/media/cec/i2c/ch7322.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 34c6d30e61e5..43e876395686 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4053,6 +4053,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml
+F:	drivers/media/cec/i2c/ch7322.c
 
 CIRRUS LOGIC AUDIO CODEC DRIVERS
 M:	James Schulman <james.schulman@cirrus.com>
diff --git a/drivers/media/cec/Kconfig b/drivers/media/cec/Kconfig
index eea74b7cfa8c..3e934aa239ab 100644
--- a/drivers/media/cec/Kconfig
+++ b/drivers/media/cec/Kconfig
@@ -33,6 +33,7 @@ menuconfig MEDIA_CEC_SUPPORT
 	  adapter that supports HDMI CEC.
 
 if MEDIA_CEC_SUPPORT
+source "drivers/media/cec/i2c/Kconfig"
 source "drivers/media/cec/platform/Kconfig"
 source "drivers/media/cec/usb/Kconfig"
 endif
diff --git a/drivers/media/cec/Makefile b/drivers/media/cec/Makefile
index 74e80e1b3571..23539339bc81 100644
--- a/drivers/media/cec/Makefile
+++ b/drivers/media/cec/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y += core/ platform/ usb/
+obj-y += core/ i2c/ platform/ usb/
diff --git a/drivers/media/cec/i2c/Kconfig b/drivers/media/cec/i2c/Kconfig
new file mode 100644
index 000000000000..e445ca2110b3
--- /dev/null
+++ b/drivers/media/cec/i2c/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# I2C drivers
+
+config CEC_CH7322
+	tristate "Chrontel CH7322 CEC controller"
+	select I2C
+	select REGMAP_I2C
+	select CEC_CORE
+	help
+	  This is a driver for the Chrontel CH7322 CEC controller. It uses the
+	  generic CEC framework interface.
+	  CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
diff --git a/drivers/media/cec/i2c/Makefile b/drivers/media/cec/i2c/Makefile
new file mode 100644
index 000000000000..d7496dfd0fa4
--- /dev/null
+++ b/drivers/media/cec/i2c/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the CEC I2C device drivers.
+#
+obj-$(CONFIG_CEC_CH7322) += ch7322.o
diff --git a/drivers/media/cec/i2c/ch7322.c b/drivers/media/cec/i2c/ch7322.c
new file mode 100644
index 000000000000..dd54df61a522
--- /dev/null
+++ b/drivers/media/cec/i2c/ch7322.c
@@ -0,0 +1,523 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Chrontel CH7322 CEC Controller
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/*
+ * Notes
+ *
+ * - This device powers on in Auto Mode which has limited functionality. This
+ *   driver disables Auto Mode when it attaches.
+ *
+ */
+
+#include <linux/cec.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <media/cec.h>
+
+#define CH7322_WRITE		0x00
+#define CH7322_WRITE_MSENT		0x80
+#define CH7322_WRITE_BOK		0x40
+#define CH7322_WRITE_NMASK		0x0f
+
+/* Write buffer is 0x01-0x10 */
+#define CH7322_WRBUF		0x01
+#define CH7322_WRBUF_LEN	0x10
+
+#define CH7322_READ		0x40
+#define CH7322_READ_NRDT		0x80
+#define CH7322_READ_MSENT		0x20
+#define CH7322_READ_NMASK		0x0f
+
+/* Read buffer is 0x41-0x50 */
+#define CH7322_RDBUF		0x41
+#define CH7322_RDBUF_LEN	0x10
+
+#define CH7322_MODE		0x11
+#define CH7322_MODE_AUTO		0x78
+#define CH7322_MODE_SW			0xb5
+
+#define CH7322_RESET		0x12
+#define CH7322_RESET_RST		0x00
+
+#define CH7322_POWER		0x13
+#define CH7322_POWER_FPD		0x04
+
+#define CH7322_CFG0		0x17
+#define CH7322_CFG0_EOBEN		0x40
+#define CH7322_CFG0_PEOB		0x20
+#define CH7322_CFG0_CLRSPP		0x10
+#define CH7322_CFG0_FLOW		0x08
+
+#define CH7322_CFG1		0x1a
+#define CH7322_CFG1_STDBYO		0x04
+#define CH7322_CFG1_HPBP		0x02
+#define CH7322_CFG1_PIO			0x01
+
+#define CH7322_INTCTL		0x1b
+#define CH7322_INTCTL_INTPB		0x80
+#define CH7322_INTCTL_STDBY		0x40
+#define CH7322_INTCTL_HPDFALL		0x20
+#define CH7322_INTCTL_HPDRISE		0x10
+#define CH7322_INTCTL_RXMSG		0x08
+#define CH7322_INTCTL_TXMSG		0x04
+#define CH7322_INTCTL_NEWPHA		0x02
+#define CH7322_INTCTL_ERROR		0x01
+
+#define CH7322_DVCLKFNH	0x1d
+#define CH7322_DVCLKFNL	0x1e
+
+#define CH7322_CTL		0x31
+#define CH7322_CTL_FSTDBY		0x80
+#define CH7322_CTL_PLSEN		0x40
+#define CH7322_CTL_PLSPB		0x20
+#define CH7322_CTL_SPADL		0x10
+#define CH7322_CTL_HINIT		0x08
+#define CH7322_CTL_WPHYA		0x04
+#define CH7322_CTL_H1T			0x02
+#define CH7322_CTL_S1T			0x01
+
+#define CH7322_PAWH		0x32
+#define CH7322_PAWL		0x33
+
+#define CH7322_ADDLW		0x34
+#define CH7322_ADDLW_MASK	0xf0
+
+#define CH7322_ADDLR		0x3d
+#define CH7322_ADDLR_HPD		0x80
+#define CH7322_ADDLR_MASK		0x0f
+
+#define CH7322_INTDATA		0x3e
+#define CH7322_INTDATA_MODE		0x80
+#define CH7322_INTDATA_STDBY		0x40
+#define CH7322_INTDATA_HPDFALL		0x20
+#define CH7322_INTDATA_HPDRISE		0x10
+#define CH7322_INTDATA_RXMSG		0x08
+#define CH7322_INTDATA_TXMSG		0x04
+#define CH7322_INTDATA_NEWPHA		0x02
+#define CH7322_INTDATA_ERROR		0x01
+
+#define CH7322_EVENT		0x3F
+#define CH7322_EVENT_TXERR		0x80
+#define CH7322_EVENT_HRST		0x40
+#define CH7322_EVENT_HFST		0x20
+#define CH7322_EVENT_PHACHG		0x10
+#define CH7322_EVENT_ACTST		0x08
+#define CH7322_EVENT_PHARDY		0x04
+#define CH7322_EVENT_BSOK		0x02
+#define CH7322_EVENT_ERRADCF		0x01
+
+#define CH7322_DID		0x51
+#define CH7322_DID_CH7322		0x5b
+#define CH7322_DID_CH7323		0x5f
+
+#define CH7322_REVISIONID	0x52
+
+#define CH7322_PARH		0x53
+#define CH7322_PARL		0x54
+
+#define CH7322_IOCFG2		0x75
+#define CH7322_IOCFG_CIO		0x80
+#define CH7322_IOCFG_IOCFGMASK		0x78
+#define CH7322_IOCFG_AUDIO		0x04
+#define CH7322_IOCFG_SPAMST		0x02
+#define CH7322_IOCFG_SPAMSP		0x01
+
+#define CH7322_CTL3		0x7b
+#define CH7322_CTL3_SWENA		0x80
+#define CH7322_CTL3_FC_INIT		0x40
+#define CH7322_CTL3_SML_FL		0x20
+#define CH7322_CTL3_SM_RDST		0x10
+#define CH7322_CTL3_SPP_CIAH		0x08
+#define CH7322_CTL3_SPP_CIAL		0x04
+#define CH7322_CTL3_SPP_ACTH		0x02
+#define CH7322_CTL3_SPP_ACTL		0x01
+
+/* BOK status means NACK */
+#define CH7322_TX_FLAG_NACK	BIT(0)
+/* Device will retry automatically */
+#define CH7322_TX_FLAG_RETRY	BIT(1)
+
+struct ch7322 {
+	struct i2c_client *i2c;
+	struct regmap *regmap;
+	struct cec_adapter *cec;
+	struct mutex mutex;	/* device access mutex */
+	u8 tx_flags;
+};
+
+static const struct regmap_config ch7322_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x7f,
+	.disable_locking = true,
+};
+
+static int ch7322_unmask_interrupt(struct ch7322 *ch7322)
+{
+	int ret;
+
+	mutex_lock(&ch7322->mutex);
+	ret = regmap_write(ch7322->regmap, CH7322_INTCTL, 0xff);
+	mutex_unlock(&ch7322->mutex);
+
+	return ret;
+}
+
+static int ch7322_mask_interrupt(struct ch7322 *ch7322)
+{
+	int ret;
+
+	mutex_lock(&ch7322->mutex);
+	ret = regmap_write(ch7322->regmap, CH7322_INTCTL, CH7322_INTCTL_INTPB);
+	mutex_unlock(&ch7322->mutex);
+
+	return ret;
+}
+
+static int ch7322_send_message(struct ch7322 *ch7322, const struct cec_msg *msg)
+{
+	unsigned int val;
+	unsigned int len = msg->len;
+	int ret;
+	int i;
+
+	WARN_ON(!mutex_is_locked(&ch7322->mutex));
+
+	if (len > CH7322_WRBUF_LEN || len < 1)
+		return -EINVAL;
+
+	ret = regmap_read(ch7322->regmap, CH7322_WRITE, &val);
+	if (ret)
+		return ret;
+
+	/* Buffer not ready */
+	if (!(val & CH7322_WRITE_MSENT))
+		return -EBUSY;
+
+	if (cec_msg_opcode(msg) == -1 &&
+	    cec_msg_initiator(msg) == cec_msg_destination(msg)) {
+		ch7322->tx_flags = CH7322_TX_FLAG_NACK | CH7322_TX_FLAG_RETRY;
+	} else if (cec_msg_is_broadcast(msg)) {
+		ch7322->tx_flags = CH7322_TX_FLAG_NACK;
+	} else {
+		ch7322->tx_flags = CH7322_TX_FLAG_RETRY;
+	}
+
+	ret = regmap_write(ch7322->regmap, CH7322_WRITE, len - 1);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < len; i++) {
+		ret = regmap_write(ch7322->regmap,
+				   CH7322_WRBUF + i, msg->msg[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ch7322_receive_message(struct ch7322 *ch7322, struct cec_msg *msg)
+{
+	unsigned int val;
+	int ret = 0;
+	int i;
+
+	WARN_ON(!mutex_is_locked(&ch7322->mutex));
+
+	ret = regmap_read(ch7322->regmap, CH7322_READ, &val);
+	if (ret)
+		return ret;
+
+	/* Message not ready */
+	if (!(val & CH7322_READ_NRDT))
+		return -EIO;
+
+	msg->len = (val & CH7322_READ_NMASK) + 1;
+
+	/* Read entire RDBUF to clear state */
+	for (i = 0; i < CH7322_RDBUF_LEN; i++) {
+		ret = regmap_read(ch7322->regmap, CH7322_RDBUF + i, &val);
+		if (ret)
+			return ret;
+		msg->msg[i] = (u8)val;
+	}
+
+	return 0;
+}
+
+static void ch7322_tx_done(struct ch7322 *ch7322)
+{
+	int ret;
+	unsigned int val;
+	u8 status, flags;
+
+	mutex_lock(&ch7322->mutex);
+	ret = regmap_read(ch7322->regmap, CH7322_WRITE, &val);
+	flags = ch7322->tx_flags;
+	mutex_unlock(&ch7322->mutex);
+
+	/*
+	 * The device returns a one-bit OK status which usually means ACK but
+	 * actually means NACK when sending a logical address query or a
+	 * broadcast.
+	 */
+	if (ret)
+		status = CEC_TX_STATUS_ERROR;
+	else if ((val & CH7322_WRITE_BOK) && (flags & CH7322_TX_FLAG_NACK))
+		status = CEC_TX_STATUS_NACK;
+	else if (val & CH7322_WRITE_BOK)
+		status = CEC_TX_STATUS_OK;
+	else if (flags & CH7322_TX_FLAG_NACK)
+		status = CEC_TX_STATUS_OK;
+	else
+		status = CEC_TX_STATUS_NACK;
+
+	if (status == CEC_TX_STATUS_NACK && (flags & CH7322_TX_FLAG_RETRY))
+		status |= CEC_TX_STATUS_MAX_RETRIES;
+
+	cec_transmit_attempt_done(ch7322->cec, status);
+}
+
+static void ch7322_rx_done(struct ch7322 *ch7322)
+{
+	struct cec_msg msg;
+	int ret;
+
+	mutex_lock(&ch7322->mutex);
+	ret = ch7322_receive_message(ch7322, &msg);
+	mutex_unlock(&ch7322->mutex);
+
+	if (ret)
+		dev_err(&ch7322->i2c->dev, "cec receive error: %d\n", ret);
+	else
+		cec_received_msg(ch7322->cec, &msg);
+}
+
+/*
+ * This device can either monitor the DDC lines to obtain the physical address
+ * or it can allow the host to program it. This driver lets the device obtain
+ * it.
+ */
+static void ch7322_phys_addr(struct ch7322 *ch7322)
+{
+	unsigned int pah, pal;
+	int ret = 0;
+
+	mutex_lock(&ch7322->mutex);
+	ret |= regmap_read(ch7322->regmap, CH7322_PARH, &pah);
+	ret |= regmap_read(ch7322->regmap, CH7322_PARL, &pal);
+	mutex_unlock(&ch7322->mutex);
+
+	if (ret)
+		dev_err(&ch7322->i2c->dev, "phys addr error\n");
+	else
+		cec_s_phys_addr(ch7322->cec, pal | (pah << 8), false);
+}
+
+static void ch7322_handle_events(struct ch7322 *ch7322)
+{
+	unsigned int data = 0;
+
+	mutex_lock(&ch7322->mutex);
+	regmap_read(ch7322->regmap, CH7322_INTDATA, &data);
+	regmap_write(ch7322->regmap, CH7322_INTDATA, data);
+	mutex_unlock(&ch7322->mutex);
+
+	if (data & CH7322_INTDATA_HPDFALL)
+		cec_phys_addr_invalidate(ch7322->cec);
+
+	if (data & CH7322_INTDATA_TXMSG)
+		ch7322_tx_done(ch7322);
+
+	if (data & CH7322_INTDATA_RXMSG)
+		ch7322_rx_done(ch7322);
+
+	if (data & CH7322_INTDATA_NEWPHA)
+		ch7322_phys_addr(ch7322);
+
+	if (data & CH7322_INTDATA_ERROR)
+		dev_dbg(&ch7322->i2c->dev, "unknown error\n");
+}
+
+static irqreturn_t ch7322_irq(int irq, void *dev)
+{
+	struct ch7322 *ch7322 = dev;
+
+	ch7322_handle_events(ch7322);
+
+	return IRQ_HANDLED;
+}
+
+static int ch7322_cec_adap_enable(struct cec_adapter *adap, bool enable)
+{
+	struct ch7322 *ch7322 = cec_get_drvdata(adap);
+	int ret;
+
+	if (enable)
+		ret = ch7322_unmask_interrupt(ch7322);
+	else
+		ret = ch7322_mask_interrupt(ch7322);
+
+	return ret;
+}
+
+static int ch7322_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
+{
+	struct ch7322 *ch7322 = cec_get_drvdata(adap);
+	int ret;
+
+	mutex_lock(&ch7322->mutex);
+	ret = regmap_update_bits(ch7322->regmap, CH7322_ADDLW,
+				 CH7322_ADDLW_MASK, log_addr << 4);
+	mutex_unlock(&ch7322->mutex);
+
+	return ret;
+}
+
+static int ch7322_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
+				    u32 signal_free_time, struct cec_msg *msg)
+{
+	struct ch7322 *ch7322 = cec_get_drvdata(adap);
+	int ret;
+
+	mutex_lock(&ch7322->mutex);
+	ret = ch7322_send_message(ch7322, msg);
+	mutex_unlock(&ch7322->mutex);
+
+	return ret;
+}
+
+static const struct cec_adap_ops ch7322_cec_adap_ops = {
+	.adap_enable = ch7322_cec_adap_enable,
+	.adap_log_addr = ch7322_cec_adap_log_addr,
+	.adap_transmit = ch7322_cec_adap_transmit,
+};
+
+static int ch7322_probe(struct i2c_client *client)
+{
+	struct ch7322 *ch7322;
+	int ret;
+	unsigned int val;
+
+	ch7322 = devm_kzalloc(&client->dev, sizeof(*ch7322), GFP_KERNEL);
+	if (!ch7322)
+		return -ENOMEM;
+
+	ch7322->regmap = devm_regmap_init_i2c(client, &ch7322_regmap);
+	if (IS_ERR(ch7322->regmap))
+		return PTR_ERR(ch7322->regmap);
+
+	ret = regmap_read(ch7322->regmap, CH7322_DID, &val);
+	if (ret)
+		return ret;
+
+	if (val != CH7322_DID_CH7322)
+		return -ENOTSUPP;
+
+	mutex_init(&ch7322->mutex);
+	ch7322->i2c = client;
+	ch7322->tx_flags = 0;
+
+	i2c_set_clientdata(client, ch7322);
+
+	/* Disable auto mode */
+	ret = regmap_write(ch7322->regmap, CH7322_MODE, CH7322_MODE_SW);
+	if (ret)
+		goto err_mutex;
+
+	ret = ch7322_mask_interrupt(ch7322);
+	if (ret)
+		goto err_mutex;
+
+	/* Configure HPDO pin as interrupt */
+	ret = regmap_write(ch7322->regmap, CH7322_CFG1, 0);
+	if (ret)
+		goto err_mutex;
+
+	/* Enable logical address register */
+	ret = regmap_update_bits(ch7322->regmap, CH7322_CTL,
+				 CH7322_CTL_SPADL, CH7322_CTL_SPADL);
+	if (ret)
+		goto err_mutex;
+
+	ch7322->cec = cec_allocate_adapter(&ch7322_cec_adap_ops, ch7322,
+					   dev_name(&client->dev),
+					   CEC_CAP_DEFAULTS, 1);
+
+	if (IS_ERR(ch7322->cec)) {
+		ret = PTR_ERR(ch7322->cec);
+		goto err_mutex;
+	}
+
+	ret = cec_register_adapter(ch7322->cec, &client->dev);
+	if (ret) {
+		cec_delete_adapter(ch7322->cec);
+		goto err_mutex;
+	}
+
+	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+					ch7322_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					client->name, ch7322);
+	if (ret)
+		goto err_cec;
+
+	ch7322_handle_events(ch7322);
+
+	dev_info(&client->dev, "device registered\n");
+
+	return 0;
+
+err_cec:
+	cec_unregister_adapter(ch7322->cec);
+
+err_mutex:
+	mutex_destroy(&ch7322->mutex);
+	return ret;
+}
+
+static int ch7322_remove(struct i2c_client *client)
+{
+	struct ch7322 *ch7322 = i2c_get_clientdata(client);
+
+	/* Mask interrupt */
+	mutex_lock(&ch7322->mutex);
+	regmap_write(ch7322->regmap, CH7322_INTCTL, CH7322_INTCTL_INTPB);
+	mutex_unlock(&ch7322->mutex);
+
+	cec_unregister_adapter(ch7322->cec);
+	mutex_destroy(&ch7322->mutex);
+
+	dev_info(&client->dev, "device unregistered\n");
+
+	return 0;
+}
+
+static const struct of_device_id ch7322_of_match[] = {
+	{ .compatible = "chrontel,ch7322", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ch7322_of_match);
+
+static struct i2c_driver ch7322_i2c_driver = {
+	.driver = {
+		.name = "ch7322",
+		.of_match_table = of_match_ptr(ch7322_of_match),
+	},
+	.probe_new	= ch7322_probe,
+	.remove		= ch7322_remove,
+};
+
+module_i2c_driver(ch7322_i2c_driver);
+
+MODULE_DESCRIPTION("Chrontel CH7322 CEC Controller Driver");
+MODULE_AUTHOR("Jeff Chase <jnchase@google.com>");
+MODULE_LICENSE("GPL");
-- 
2.27.0.rc0.183.gde8f92d652-goog

