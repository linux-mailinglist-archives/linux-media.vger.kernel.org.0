Return-Path: <linux-media+bounces-3728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA70B82E195
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 21:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A7121C2105F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 20:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734FF19BB8;
	Mon, 15 Jan 2024 20:21:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C89199DA
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSE-0004gK-Q6; Mon, 15 Jan 2024 21:21:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSE-0005gJ-7R; Mon, 15 Jan 2024 21:21:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSE-000N7V-0S;
	Mon, 15 Jan 2024 21:21:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	Sergey Kozlov <serjk@netup.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 07/33] media: netup_unidvb: Follow renaming of SPI "master" to "controller"
Date: Mon, 15 Jan 2024 21:12:53 +0100
Message-ID:  <8af8f80b27e32bab773dade327e9694976604e48.1705348269.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5286; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=87ZsEgNOTheB5G92Taih+d+a9rMdmsqYOADAZ3z0oDk=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtSlE084fVx9TOwKy77Oc62LPi6sKdqmudSwYbK6ZqBEb /72nRYGnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMxIqBg2F+mVV1kfXKqXur 8sq//PT2fLamiP+ri/imMKGDD4qlAtWXGsn/DPWL6vhX9Iu1ZtLjdnaGk8osnJ+jgq2WBTju0Mp qeWi4aX6O/duJiwsUgzjSMkO0p7ItnLw717vrx6H9npbXK37zreSISDeYYLJpV7mBno3l/jrNCp nba64uf/E54RCD6KElvqHKYbzSwaZ6v/ZJ7i+sMOXZdeZO1omfHJW/Nij5csZKtNn8XBAmmvHyc OQJHt69vIrMvWqH+sz5j4RVHptu9EA/Nnp/pq7QiYiDhgqBj/5/Cu1jtXZOjnA/UT9tyYedcxoj i/UN2hc+yLdkPPk/L/HBoWenvonZbwwu2PVZgqV4x7MqAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
some functions and struct members were renamed. To not break all drivers
compatibility macros were provided.

To be able to remove these compatibility macros push the renaming into
this driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../media/pci/netup_unidvb/netup_unidvb_spi.c | 48 +++++++++----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c b/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c
index 526042d8afae..e90aa1c1584c 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_spi.c
@@ -35,7 +35,7 @@ struct netup_spi_regs {
 
 struct netup_spi {
 	struct device			*dev;
-	struct spi_master		*master;
+	struct spi_controller		*ctlr;
 	struct netup_spi_regs __iomem	*regs;
 	u8 __iomem			*mmio;
 	spinlock_t			lock;
@@ -78,7 +78,7 @@ irqreturn_t netup_spi_interrupt(struct netup_spi *spi)
 	reg = readw(&spi->regs->control_stat);
 	if (!(reg & NETUP_SPI_CTRL_IRQ)) {
 		spin_unlock_irqrestore(&spi->lock, flags);
-		dev_dbg(&spi->master->dev,
+		dev_dbg(&spi->ctlr->dev,
 			"%s(): not mine interrupt\n", __func__);
 		return IRQ_NONE;
 	}
@@ -88,15 +88,15 @@ irqreturn_t netup_spi_interrupt(struct netup_spi *spi)
 	spi->state = SPI_STATE_DONE;
 	wake_up(&spi->waitq);
 	spin_unlock_irqrestore(&spi->lock, flags);
-	dev_dbg(&spi->master->dev,
+	dev_dbg(&spi->ctlr->dev,
 		"%s(): SPI interrupt handled\n", __func__);
 	return IRQ_HANDLED;
 }
 
-static int netup_spi_transfer(struct spi_master *master,
+static int netup_spi_transfer(struct spi_controller *ctlr,
 			      struct spi_message *msg)
 {
-	struct netup_spi *spi = spi_master_get_devdata(master);
+	struct netup_spi *spi = spi_controller_get_devdata(ctlr);
 	struct spi_transfer *t;
 	int result = 0;
 	u32 tr_size;
@@ -131,7 +131,7 @@ static int netup_spi_transfer(struct spi_master *master,
 				NETUP_SPI_CTRL_START |
 				(frag_last ? NETUP_SPI_CTRL_LAST_CS : 0),
 				&spi->regs->control_stat);
-			dev_dbg(&spi->master->dev,
+			dev_dbg(&spi->ctlr->dev,
 				"%s(): control_stat 0x%04x\n",
 				__func__, readw(&spi->regs->control_stat));
 			wait_event_timeout(spi->waitq,
@@ -144,11 +144,11 @@ static int netup_spi_transfer(struct spi_master *master,
 				}
 			} else {
 				if (spi->state == SPI_STATE_START) {
-					dev_dbg(&spi->master->dev,
+					dev_dbg(&spi->ctlr->dev,
 						"%s(): transfer timeout\n",
 						__func__);
 				} else {
-					dev_dbg(&spi->master->dev,
+					dev_dbg(&spi->ctlr->dev,
 						"%s(): invalid state %d\n",
 						__func__, spi->state);
 				}
@@ -161,7 +161,7 @@ static int netup_spi_transfer(struct spi_master *master,
 	}
 done:
 	msg->status = result;
-	spi_finalize_current_message(master);
+	spi_finalize_current_message(ctlr);
 	return result;
 }
 
@@ -172,30 +172,30 @@ static int netup_spi_setup(struct spi_device *spi)
 
 int netup_spi_init(struct netup_unidvb_dev *ndev)
 {
-	struct spi_master *master;
+	struct spi_controller *ctlr;
 	struct netup_spi *nspi;
 
-	master = devm_spi_alloc_master(&ndev->pci_dev->dev,
-		sizeof(struct netup_spi));
-	if (!master) {
+	ctlr = devm_spi_alloc_master(&ndev->pci_dev->dev,
+					 sizeof(struct netup_spi));
+	if (!ctlr) {
 		dev_err(&ndev->pci_dev->dev,
 			"%s(): unable to alloc SPI master\n", __func__);
 		return -EINVAL;
 	}
-	nspi = spi_master_get_devdata(master);
-	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST;
-	master->bus_num = -1;
-	master->num_chipselect = 1;
-	master->transfer_one_message = netup_spi_transfer;
-	master->setup = netup_spi_setup;
+	nspi = spi_controller_get_devdata(ctlr);
+	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST;
+	ctlr->bus_num = -1;
+	ctlr->num_chipselect = 1;
+	ctlr->transfer_one_message = netup_spi_transfer;
+	ctlr->setup = netup_spi_setup;
 	spin_lock_init(&nspi->lock);
 	init_waitqueue_head(&nspi->waitq);
-	nspi->master = master;
+	nspi->ctlr = ctlr;
 	nspi->regs = (struct netup_spi_regs __iomem *)(ndev->bmmio0 + 0x4000);
 	writew(2, &nspi->regs->clock_divider);
 	writew(NETUP_UNIDVB_IRQ_SPI, ndev->bmmio0 + REG_IMASK_SET);
 	ndev->spi = nspi;
-	if (spi_register_master(master)) {
+	if (spi_register_controller(ctlr)) {
 		ndev->spi = NULL;
 		dev_err(&ndev->pci_dev->dev,
 			"%s(): unable to register SPI bus\n", __func__);
@@ -207,8 +207,8 @@ int netup_spi_init(struct netup_unidvb_dev *ndev)
 		ndev->pci_bus,
 		ndev->pci_slot,
 		ndev->pci_func);
-	if (!spi_new_device(master, &netup_spi_board)) {
-		spi_unregister_master(master);
+	if (!spi_new_device(ctlr, &netup_spi_board)) {
+		spi_unregister_controller(ctlr);
 		ndev->spi = NULL;
 		dev_err(&ndev->pci_dev->dev,
 			"%s(): unable to create SPI device\n", __func__);
@@ -227,7 +227,7 @@ void netup_spi_release(struct netup_unidvb_dev *ndev)
 	if (!spi)
 		return;
 
-	spi_unregister_master(spi->master);
+	spi_unregister_controller(spi->ctlr);
 	spin_lock_irqsave(&spi->lock, flags);
 	reg = readw(&spi->regs->control_stat);
 	writew(reg | NETUP_SPI_CTRL_IRQ, &spi->regs->control_stat);
-- 
2.43.0


