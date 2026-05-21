Return-Path: <linux-media+bounces-62412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF21L4u2DmrBBgYAu9opvQ
	(envelope-from <linux-media+bounces-62412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:38:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 618FC5A03C7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BAC2301584B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A44F395ACE;
	Thu, 21 May 2026 07:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccqKzLhw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6807139D3DB;
	Thu, 21 May 2026 07:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349125; cv=none; b=Kmv3ElpL5TeeZFs1knpToTYCetCZVhumswU0rv6CINwqNK3i3RKUPy/Cjo5wv+vQVSt8EpkY/1qiIy05Cpi7pkVXsfzreLOUN9vrySwGHzM3dX65RGKdYSx/ghvVU3TMng3GzrFAlD9yJUR8m4k+6xbgfwncyLq0nS/7ZRdjEKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349125; c=relaxed/simple;
	bh=wznWL+QAr8G3QV9XQw/1Z3j6dh5E5uD+rs8aPiVt864=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jsDzv+2qf+sPDPh1DuUMItJofSx8TQDD+C5q5qx4k8RBKprYdPxKJvrVxPeWVTpND77kGdwi6SHLniUv/bB1pVQew69qtqa8mBEjApfrSKd1zQeNmceMS89l5uASdZ/pJvob80GTEWBtkAnPwXakMNO3Y9yEMvaBfDKO4iAHunU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccqKzLhw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B4C1F000E9;
	Thu, 21 May 2026 07:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779349120;
	bh=NNjTPdcmYKUzSZOoPnU+3MVKGyRmys3K6+7zK41Jnwo=;
	h=From:To:Cc:Subject:Date;
	b=ccqKzLhw8GwcsSlx0Xv2yFEp/rMDJnauCEhdV/bU91WBPNmqphXrND4HEqhl7VU6D
	 1Sdq6MADo+Y6QvTk/8TGUy5P4H+ms+3CykrM3GUzQQKP8++2P45H5JmbyCvGp5AN6b
	 zIJfFCQgeyCAS/vWyBn3CqQa86hJ2e+PlNIKCxedHnRxOLKrYeOWhuiEliRWmUqe3V
	 TXaQzXpnvoEELs/tXdkbv6my22kM1RYZtICVI4hD1M73YmJg8jNEUl2Ugvl7gXVEfB
	 o/4K5XPA3z2kKFeZzi23JsGp+G5a0A72Zor+9cwZNnaSLH1vYFOAnRrKRbTxWxGDyQ
	 qTYH2pmVeSRDQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wPxzJ-00000003DQz-428s;
	Thu, 21 May 2026 09:38:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Wunner <lukas@wunner.de>,
	linux-media@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] spi: fix controller registration API inconsistency
Date: Thu, 21 May 2026 09:38:16 +0200
Message-ID: <20260521073816.766596-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linuxfoundation.org,wunner.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62412-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 618FC5A03C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SPI controller API is asymmetric in that a controller is allocated
and registered in two step, while it is freed as part of deregistration.
[1]

This is especially unfortunate as any driver data is freed along with
the controller, something which has lead to use-after-free bugs during
deregistration when drivers tear down resources after deregistering the
controller (or tear down resources that may still be in use before
deregistering the controller in an attempt to work around the API).

To reduce the risk of such bugs being introduced a device managed
allocation interface was added, but this arguably made things even less
consistent as now whether the controller gets freed as part of
deregistration depends on how it was allocated. [2][3]

With most drivers converted to use managed allocation in preparation for
fixing the API, the remaining 16 drivers can be converted in one
tree-wide change. Ten of those drivers use the bitbang interface and can
be converted by simply removing the extra reference already taken by
spi_bitbang_start() (and updating the two bitbang drivers that use
managed allocation). [4]

Fix the API inconsistency by no longer dropping a reference when
deregistering non-devres allocated controllers.

[1] 68b892f1fdc4 ("spi: document odd controller reference handling")
[2] 5e844cc37a5c ("spi: Introduce device-managed SPI controller allocation")
[3] 3f174274d224 ("spi: fix misleading controller deregistration kernel-doc")
[4] 702a4879ec33 ("spi: bitbang: Let spi_bitbang_start() take a reference to master")

Signed-off-by: Johan Hovold <johan@kernel.org>
---

Note that this touches a media driver and a Greybus driver in staging,
neither which sees many changes so the risk of conflicts when taking
this through the SPI tree is low.

In the unlikely event that a new SPI driver using non-managed allocation
is merged through some other tree for 7.2, the resulting memory leak can
be trivially plugged once in mainline.

Johan


Changes in v2:
 - update the two drivers using managed allocation with the bitbang
   interface (Mark)


 drivers/media/usb/msi2500/msi2500.c |  9 ++++----
 drivers/spi/spi-bitbang.c           | 11 +--------
 drivers/spi/spi-dw-core.c           |  2 ++
 drivers/spi/spi-fsl-dspi.c          |  2 ++
 drivers/spi/spi-mpc52xx.c           |  2 +-
 drivers/spi/spi-topcliff-pch.c      |  2 --
 drivers/spi/spi-xilinx.c            |  2 --
 drivers/spi/spi-xtensa-xtfpga.c     |  1 -
 drivers/spi/spi.c                   | 35 +++++------------------------
 drivers/staging/greybus/spilib.c    |  8 +++----
 include/linux/spi/spi.h             |  4 ----
 11 files changed, 19 insertions(+), 59 deletions(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 1ff98956b680..5c512d61dc1b 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -575,6 +575,7 @@ static void msi2500_disconnect(struct usb_interface *intf)
 	v4l2_device_disconnect(&dev->v4l2_dev);
 	video_unregister_device(&dev->vdev);
 	spi_unregister_controller(dev->ctlr);
+	spi_controller_put(dev->ctlr);
 	mutex_unlock(&dev->v4l2_lock);
 	mutex_unlock(&dev->vb_queue_lock);
 
@@ -1230,10 +1231,8 @@ static int msi2500_probe(struct usb_interface *intf,
 	ctlr->transfer_one_message = msi2500_transfer_one_message;
 	spi_controller_set_devdata(ctlr, dev);
 	ret = spi_register_controller(ctlr);
-	if (ret) {
-		spi_controller_put(ctlr);
-		goto err_unregister_v4l2_dev;
-	}
+	if (ret)
+		goto err_put_controller;
 
 	/* load v4l2 subdevice */
 	sd = v4l2_spi_new_subdev(&dev->v4l2_dev, ctlr, &board_info);
@@ -1276,6 +1275,8 @@ static int msi2500_probe(struct usb_interface *intf,
 	v4l2_ctrl_handler_free(&dev->hdl);
 err_unregister_controller:
 	spi_unregister_controller(dev->ctlr);
+err_put_controller:
+	spi_controller_put(dev->ctlr);
 err_unregister_v4l2_dev:
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_free_mem:
diff --git a/drivers/spi/spi-bitbang.c b/drivers/spi/spi-bitbang.c
index 9f03ac217319..fb288ed56d94 100644
--- a/drivers/spi/spi-bitbang.c
+++ b/drivers/spi/spi-bitbang.c
@@ -420,11 +420,6 @@ EXPORT_SYMBOL_GPL(spi_bitbang_init);
  * This routine registers the spi_controller, which will process requests in a
  * dedicated task, keeping IRQs unblocked most of the time.  To stop
  * processing those requests, call spi_bitbang_stop().
- *
- * On success, this routine will take a reference to the controller. The caller
- * is responsible for calling spi_bitbang_stop() to decrement the reference and
- * spi_controller_put() as counterpart of spi_alloc_host() to prevent a memory
- * leak.
  */
 int spi_bitbang_start(struct spi_bitbang *bitbang)
 {
@@ -438,11 +433,7 @@ int spi_bitbang_start(struct spi_bitbang *bitbang)
 	/* driver may get busy before register() returns, especially
 	 * if someone registered boardinfo for devices
 	 */
-	ret = spi_register_controller(spi_controller_get(ctlr));
-	if (ret)
-		spi_controller_put(ctlr);
-
-	return ret;
+	return spi_register_controller(ctlr);
 }
 EXPORT_SYMBOL_GPL(spi_bitbang_start);
 
diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index b47637888c5c..9a85a3ce5652 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
@@ -1032,6 +1032,8 @@ void dw_spi_remove_controller(struct dw_spi *dws)
 	dw_spi_shutdown_chip(dws);
 
 	free_irq(dws->irq, dws->ctlr);
+
+	spi_controller_put(dws->ctlr);
 }
 EXPORT_SYMBOL_NS_GPL(dw_spi_remove_controller, "SPI_DW_CORE");
 
diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 9f2a7b8163b1..019d05cdefe6 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1715,6 +1715,8 @@ static void dspi_remove(struct platform_device *pdev)
 	dspi_release_dma(dspi);
 	if (dspi->irq)
 		free_irq(dspi->irq, dspi);
+
+	spi_controller_put(dspi->ctlr);
 }
 
 static void dspi_shutdown(struct platform_device *pdev)
diff --git a/drivers/spi/spi-mpc52xx.c b/drivers/spi/spi-mpc52xx.c
index 04c2270cd2cf..70d8e17e8c43 100644
--- a/drivers/spi/spi-mpc52xx.c
+++ b/drivers/spi/spi-mpc52xx.c
@@ -520,7 +520,7 @@ static int mpc52xx_spi_probe(struct platform_device *op)
 
 static void mpc52xx_spi_remove(struct platform_device *op)
 {
-	struct spi_controller *host = spi_controller_get(platform_get_drvdata(op));
+	struct spi_controller *host = platform_get_drvdata(op);
 	struct mpc52xx_spi *ms = spi_controller_get_devdata(host);
 	int i;
 
diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
index 14d11450e86d..d9168888e397 100644
--- a/drivers/spi/spi-topcliff-pch.c
+++ b/drivers/spi/spi-topcliff-pch.c
@@ -1406,8 +1406,6 @@ static void pch_spi_pd_remove(struct platform_device *plat_dev)
 	dev_dbg(&plat_dev->dev, "%s:[ch%d] irq=%d\n",
 		__func__, plat_dev->id, board_dat->pdev->irq);
 
-	spi_controller_get(data->host);
-
 	spi_unregister_controller(data->host);
 
 	/* check for any pending messages; no action is taken if the queue
diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index 9f065d4e27d1..3aeef70caa96 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -515,8 +515,6 @@ static void xilinx_spi_remove(struct platform_device *pdev)
 	xspi->write_fn(0, regs_base + XIPIF_V123B_IIER_OFFSET);
 	/* Disable the global IPIF interrupt */
 	xspi->write_fn(0, regs_base + XIPIF_V123B_DGIER_OFFSET);
-
-	spi_controller_put(xspi->bitbang.ctlr);
 }
 
 /* work with hotplug and coldplug */
diff --git a/drivers/spi/spi-xtensa-xtfpga.c b/drivers/spi/spi-xtensa-xtfpga.c
index 71f0f176cfd9..d47a1e548fce 100644
--- a/drivers/spi/spi-xtensa-xtfpga.c
+++ b/drivers/spi/spi-xtensa-xtfpga.c
@@ -122,7 +122,6 @@ static void xtfpga_spi_remove(struct platform_device *pdev)
 	struct xtfpga_spi *xspi = spi_controller_get_devdata(host);
 
 	spi_bitbang_stop(&xspi->bitbang);
-	spi_controller_put(host);
 }
 
 MODULE_ALIAS("platform:" XTFPGA_SPI_NAME);
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c61ca4c13bcc..f989ab34f664 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3226,9 +3226,9 @@ extern struct class spi_target_class;	/* dummy */
  * This must be called from context that can sleep.
  *
  * The caller is responsible for assigning the bus number and initializing the
- * controller's methods before calling spi_register_controller(); and (after
- * errors adding the device) calling spi_controller_put() to prevent a memory
- * leak.
+ * controller's methods before calling spi_register_controller(); and calling
+ * spi_controller_put() to prevent a memory leak when done with the
+ * controller.
  *
  * Return: the SPI controller structure on success, else NULL.
  */
@@ -3312,8 +3312,6 @@ struct spi_controller *__devm_spi_alloc_controller(struct device *dev,
 	if (ret)
 		return NULL;
 
-	ctlr->devm_allocated = true;
-
 	return ctlr;
 }
 EXPORT_SYMBOL_GPL(__devm_spi_alloc_controller);
@@ -3579,8 +3577,7 @@ static void devm_spi_unregister_controller(void *ctlr)
  * Context: can sleep
  *
  * Register a SPI device as with spi_register_controller() which will
- * automatically be unregistered (and freed unless it has been allocated using
- * devm_spi_alloc_host/target()).
+ * automatically be unregistered.
  *
  * Return: zero on success, else a negative error code.
  */
@@ -3593,19 +3590,7 @@ int devm_spi_register_controller(struct device *dev,
 	if (ret)
 		return ret;
 
-	/*
-	 * Prevent controller from being freed by spi_unregister_controller()
-	 * if devm_add_action_or_reset() fails for a non-devres allocated
-	 * controller.
-	 */
-	spi_controller_get(ctlr);
-
-	ret = devm_add_action_or_reset(dev, devm_spi_unregister_controller, ctlr);
-
-	if (ret == 0 || ctlr->devm_allocated)
-		spi_controller_put(ctlr);
-
-	return ret;
+	return devm_add_action_or_reset(dev, devm_spi_unregister_controller, ctlr);
 }
 EXPORT_SYMBOL_GPL(devm_spi_register_controller);
 
@@ -3624,9 +3609,6 @@ static int __unregister(struct device *dev, void *null)
  * only ones directly touching chip registers.
  *
  * This must be called from context that can sleep.
- *
- * Note that this function also drops a reference to the controller unless it
- * has been allocated using devm_spi_alloc_host/target().
  */
 void spi_unregister_controller(struct spi_controller *ctlr)
 {
@@ -3661,13 +3643,6 @@ void spi_unregister_controller(struct spi_controller *ctlr)
 
 	if (IS_ENABLED(CONFIG_SPI_DYNAMIC))
 		mutex_unlock(&ctlr->add_lock);
-
-	/*
-	 * Release the last reference on the controller if its driver
-	 * has not yet been converted to devm_spi_alloc_host/target().
-	 */
-	if (!ctlr->devm_allocated)
-		put_device(&ctlr->dev);
 }
 EXPORT_SYMBOL_GPL(spi_unregister_controller);
 
diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index 24e9c909fa02..e4d1ae8308aa 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -547,13 +547,10 @@ int gb_spilib_master_init(struct gb_connection *connection, struct device *dev,
 
 	return 0;
 
-exit_spi_put:
-	spi_controller_put(ctlr);
-
-	return ret;
-
 exit_spi_unregister:
 	spi_unregister_controller(ctlr);
+exit_spi_put:
+	spi_controller_put(ctlr);
 
 	return ret;
 }
@@ -564,6 +561,7 @@ void gb_spilib_master_exit(struct gb_connection *connection)
 	struct spi_controller *ctlr = gb_connection_get_data(connection);
 
 	spi_unregister_controller(ctlr);
+	spi_controller_put(ctlr);
 }
 EXPORT_SYMBOL_GPL(gb_spilib_master_exit);
 
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 79513f5941cc..f6ed93eff00b 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -424,7 +424,6 @@ extern struct spi_device *devm_spi_new_ancillary_device(struct spi_device *spi,
  * @flags: other constraints relevant to this driver
  * @slave: indicates that this is an SPI slave controller
  * @target: indicates that this is an SPI target controller
- * @devm_allocated: whether the allocation of this struct is devres-managed
  * @max_transfer_size: function that returns the max transfer size for
  *	a &spi_device; may be %NULL, so the default %SIZE_MAX will be used.
  * @max_message_size: function that returns the max message size for
@@ -629,9 +628,6 @@ struct spi_controller {
 	 */
 #define SPI_CONTROLLER_MULTI_CS		BIT(7)
 
-	/* Flag indicating if the allocation of this struct is devres-managed */
-	bool			devm_allocated;
-
 	union {
 		/* Flag indicating this is an SPI slave controller */
 		bool			slave;
-- 
2.53.0


