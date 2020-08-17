Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D46424604A
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgHQIdY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbgHQIc2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:32:28 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695D2C061388;
        Mon, 17 Aug 2020 01:32:28 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 17so7874069pfw.9;
        Mon, 17 Aug 2020 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OgN4FVVdP+EhF1ujYvTAQgNw3tvzSDcv5PzN1nKoLuc=;
        b=G+OGmYQUjJZaSBW599D9vY0hPs94/Lop1UOM2gXnC5C5A9cCtXpjONVn1i+sitqopr
         C6QFvCQrDDlfGGbeKehlkkR8D8AigWvjD11BLEGjbnQJARgwwbhhh0dBL+m9XAWSNvGG
         ru2idW+bSSWAfidBKho1MHJPLwjgis1BdFrFmbFv1/1IPW3r4C42XMZ9QgWDJmP+LD5C
         BTOX58DZl3IpHyiXg78Mrs2shPellbY9nb9FuFnJdx13sseRH8H07V0ad7hqZDpiaOZh
         0522u31TrE/vN+Fo8X3VIEhYe/34+8euK34fC+iPOdZsum5qDKZ9c4PaEhI87kd5yOgt
         kCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OgN4FVVdP+EhF1ujYvTAQgNw3tvzSDcv5PzN1nKoLuc=;
        b=f4ABF+HRVP73cqttRGtl4kF4hWyyoOsplIbdoL4Was1b9ZG6Y+YfE9b5Gjq87IocEJ
         HvD82u3ZYVXacbUCHR0fm1GbMHTe/PIFqRBSTS67Le81YlcYXKPmDa4z7EhXlDXsj5aS
         FF/9cuuAjAUkFz77EhZ1+ezhbm8T8CuNkMJEUcz5PnulNKoR8yyeq9L+WrADLcTr0qJ7
         ovn5w9hM4ZGSHh6vFjxhk5KdWFKSr62KLbGs7NQFiCazRgcx1SsXEmFWUzm9X2pEsbq6
         cfOcW/xCngUAAw6tFldC8rTqZGYg8CPuSw5N8NzoVnpckwCQByxz8XKIX19hfKEji8Fa
         HVVA==
X-Gm-Message-State: AOAM533Ml1TRF36b2JcpsMopRpQdBTN5OJUK+w/UytSKE41lkQXDT70I
        BarXg/mMWYKoMNcbst3QIXE=
X-Google-Smtp-Source: ABdhPJwwfZ0fHwlnBF6kQnAMSh56m3wQvU5v1Vuu1X+2GqVpq3FIn/BLzSHwu7Xxc2LDektsBe2c4Q==
X-Received: by 2002:a63:161a:: with SMTP id w26mr2718287pgl.211.1597653147908;
        Mon, 17 Aug 2020 01:32:27 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id b15sm18448351pft.116.2020.08.17.01.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:32:27 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     mchehab@kernel.org, maintainers@bluecherrydvr.com,
        patrice.chotard@st.com
Cc:     keescook@chromium.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 05/11] media: ttpci: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:01:47 +0530
Message-Id: <20200817083153.22218-6-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817083153.22218-1-allen.lkml@gmail.com>
References: <20200817083153.22218-1-allen.lkml@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/media/pci/ttpci/av7110.c      | 20 ++++++++++----------
 drivers/media/pci/ttpci/budget-ci.c   | 15 ++++++++-------
 drivers/media/pci/ttpci/budget-core.c |  6 +++---
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/media/pci/ttpci/av7110.c b/drivers/media/pci/ttpci/av7110.c
index bf36b1e22b63..885e6bc40c19 100644
--- a/drivers/media/pci/ttpci/av7110.c
+++ b/drivers/media/pci/ttpci/av7110.c
@@ -357,9 +357,9 @@ static inline void start_debi_dma(struct av7110 *av7110, int dir,
 		irdebi(av7110, DEBISWAB, addr, 0, len);
 }
 
-static void debiirq(unsigned long cookie)
+static void debiirq(struct tasklet_struct *t)
 {
-	struct av7110 *av7110 = (struct av7110 *)cookie;
+	struct av7110 *av7110 = from_tasklet(av7110, t, debi_tasklet);
 	int type = av7110->debitype;
 	int handle = (type >> 8) & 0x1f;
 	unsigned int xfer = 0;
@@ -458,9 +458,9 @@ static void debiirq(unsigned long cookie)
 }
 
 /* irq from av7110 firmware writing the mailbox register in the DPRAM */
-static void gpioirq(unsigned long cookie)
+static void gpioirq(struct tasklet_struct *t)
 {
-	struct av7110 *av7110 = (struct av7110 *)cookie;
+	struct av7110 *av7110 = from_tasklet(av7110, t, gpio_tasklet);
 	u32 rxbuf, txbuf;
 	int len;
 
@@ -1230,9 +1230,9 @@ static int budget_stop_feed(struct dvb_demux_feed *feed)
 	return status;
 }
 
-static void vpeirq(unsigned long cookie)
+static void vpeirq(struct tasklet_struct *t)
 {
-	struct av7110 *budget = (struct av7110 *)cookie;
+	struct av7110 *budget = from_tasklet(budget, t, vpe_tasklet);
 	u8 *mem = (u8 *) (budget->grabbing);
 	u32 olddma = budget->ttbp;
 	u32 newdma = saa7146_read(budget->dev, PCI_VDP3);
@@ -2518,7 +2518,7 @@ static int av7110_attach(struct saa7146_dev* dev,
 		saa7146_write(dev, NUM_LINE_BYTE3, (TS_HEIGHT << 16) | TS_WIDTH);
 		saa7146_write(dev, MC2, MASK_04 | MASK_20);
 
-		tasklet_init(&av7110->vpe_tasklet, vpeirq, (unsigned long) av7110);
+		tasklet_setup(&av7110->vpe_tasklet, vpeirq);
 
 	} else if (budgetpatch) {
 		spin_lock_init(&av7110->feedlock1);
@@ -2599,7 +2599,7 @@ static int av7110_attach(struct saa7146_dev* dev,
 		saa7146_write(dev, MC1, (MASK_13 | MASK_29));
 
 		/* end of budgetpatch register initialization */
-		tasklet_init (&av7110->vpe_tasklet,  vpeirq,  (unsigned long) av7110);
+		tasklet_setup(&av7110->vpe_tasklet,  vpeirq);
 	} else {
 		saa7146_write(dev, PCI_BT_V1, 0x1c00101f);
 		saa7146_write(dev, BCS_CTRL, 0x80400040);
@@ -2614,8 +2614,8 @@ static int av7110_attach(struct saa7146_dev* dev,
 		saa7146_write(dev, GPIO_CTRL, 0x000000);
 	}
 
-	tasklet_init (&av7110->debi_tasklet, debiirq, (unsigned long) av7110);
-	tasklet_init (&av7110->gpio_tasklet, gpioirq, (unsigned long) av7110);
+	tasklet_setup(&av7110->debi_tasklet, debiirq);
+	tasklet_setup(&av7110->gpio_tasklet, gpioirq);
 
 	mutex_init(&av7110->pid_mutex);
 
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci/budget-ci.c
index 77b102b8a013..d59d18647371 100644
--- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -99,9 +99,10 @@ struct budget_ci {
 	u8 tuner_pll_address; /* used for philips_tdm1316l configs */
 };
 
-static void msp430_ir_interrupt(unsigned long data)
+static void msp430_ir_interrupt(struct tasklet_struct *t)
 {
-	struct budget_ci *budget_ci = (struct budget_ci *) data;
+	struct budget_ci_ir *ir = from_tasklet(ir, t, msp430_irq_tasklet);
+	struct budget_ci *budget_ci = container_of(ir, typeof(*budget_ci), ir);
 	struct rc_dev *dev = budget_ci->ir.dev;
 	u32 command = ttpci_budget_debiread(&budget_ci->budget, DEBINOSWAP, DEBIADDR_IR, 2, 1, 0) >> 8;
 
@@ -229,8 +230,7 @@ static int msp430_ir_init(struct budget_ci *budget_ci)
 
 	budget_ci->ir.dev = dev;
 
-	tasklet_init(&budget_ci->ir.msp430_irq_tasklet, msp430_ir_interrupt,
-		     (unsigned long) budget_ci);
+	tasklet_setup(&budget_ci->ir.msp430_irq_tasklet, msp430_ir_interrupt);
 
 	SAA7146_IER_ENABLE(saa, MASK_06);
 	saa7146_setgpio(saa, 3, SAA7146_GPIO_IRQHI);
@@ -348,9 +348,10 @@ static int ciintf_slot_ts_enable(struct dvb_ca_en50221 *ca, int slot)
 	return 0;
 }
 
-static void ciintf_interrupt(unsigned long data)
+static void ciintf_interrupt(struct tasklet_struct *t)
 {
-	struct budget_ci *budget_ci = (struct budget_ci *) data;
+	struct budget_ci *budget_ci = from_tasklet(budget_ci, t,
+						   ciintf_irq_tasklet);
 	struct saa7146_dev *saa = budget_ci->budget.dev;
 	unsigned int flags;
 
@@ -491,7 +492,7 @@ static int ciintf_init(struct budget_ci *budget_ci)
 
 	// Setup CI slot IRQ
 	if (budget_ci->ci_irq) {
-		tasklet_init(&budget_ci->ciintf_irq_tasklet, ciintf_interrupt, (unsigned long) budget_ci);
+		tasklet_setup(&budget_ci->ciintf_irq_tasklet, ciintf_interrupt);
 		if (budget_ci->slot_status != SLOTSTATUS_NONE) {
 			saa7146_setgpio(saa, 0, SAA7146_GPIO_IRQLO);
 		} else {
diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttpci/budget-core.c
index 293867b9e796..d405eea5c37f 100644
--- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -171,9 +171,9 @@ static int budget_read_fe_status(struct dvb_frontend *fe,
 	return ret;
 }
 
-static void vpeirq(unsigned long data)
+static void vpeirq(struct tasklet_struct *t)
 {
-	struct budget *budget = (struct budget *) data;
+	struct budget *budget = from_tasklet(budget, t, vpe_tasklet);
 	u8 *mem = (u8 *) (budget->grabbing);
 	u32 olddma = budget->ttbp;
 	u32 newdma = saa7146_read(budget->dev, PCI_VDP3);
@@ -519,7 +519,7 @@ int ttpci_budget_init(struct budget *budget, struct saa7146_dev *dev,
 	/* upload all */
 	saa7146_write(dev, GPIO_CTRL, 0x000000);
 
-	tasklet_init(&budget->vpe_tasklet, vpeirq, (unsigned long) budget);
+	tasklet_setup(&budget->vpe_tasklet, vpeirq);
 
 	/* frontend power on */
 	if (bi->type != BUDGET_FS_ACTIVY)
-- 
2.17.1

