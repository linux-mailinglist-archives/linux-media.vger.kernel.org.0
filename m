Return-Path: <linux-media+bounces-61269-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MIoEYE/A2rO2AEAu9opvQ
	(envelope-from <linux-media+bounces-61269-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:56:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 959555230EC
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5167531FE5FC
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1832B3A599D;
	Tue, 12 May 2026 14:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giHhmkIo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B223A59A8;
	Tue, 12 May 2026 14:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594530; cv=none; b=j1iiObYhetg0hA+5jDuMNTjiZVbLz/M2CrPEeMUc3t6kqYMLGN5r5GLlMqsZz37pQU3/hAE/uxII33riP3bj10oGcrF/YYUm8/Caf2j65Xm63B1Q+77zAafH9fZPirdNPXPvWVa1hCPYbG9J6DAr+duUh2r5+KXKkL06ENSJtGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594530; c=relaxed/simple;
	bh=vNuLk3etg/98+wCA/3m7yuZ8owkTfXwE7wZvoVN61HE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VyJALlDYVQc91WuZxn6rCr+fqjocQrLaI7GS770a06NNLEsKbhSuzLuaR+M3R0Qp1mjIjR9vQeHSXJTtyEdp2xta9e87qFjp04pKmfWwoOTvUYfNgAxgGf7XiL6FfEffTw4m228pjtHoOgPElmYglqUEyp1TWbBsPZCKeC8W7BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giHhmkIo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1881C2BCB0;
	Tue, 12 May 2026 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778594530;
	bh=vNuLk3etg/98+wCA/3m7yuZ8owkTfXwE7wZvoVN61HE=;
	h=From:To:Cc:Subject:Date:From;
	b=giHhmkIo0iJQqLQCDP6mMCn8GePOSv47Mx9ylPlBvagonTSWsPEz9XCj3fRf1CC94
	 M8BUDjrv1N7N9qGdMyEjsYrrVhDyQXBEncAUGM8WgUni97LsFWwz6PedCh1y4swppO
	 Scai8ro1Ta2lU6/gYbZFhRcONy7E2BG9L2R9SoBWsldOeswjRva8Kt9YlQFSJXKgny
	 h79y4JKYdcmbtaSY2VCjmHCW5+UGw97v24H8VM62eOJicHjaeR/ObyxcvTL5WUlZLH
	 BEfQ5hfEzwQsb5PzxB1YrVnWkeJanQfZ0/KsUxLIAOmNKj+0a9U6WhqqzSzgAZYdFn
	 M/YRhfpUX8XWA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMngV-00000004BoN-1U8O;
	Tue, 12 May 2026 16:02:07 +0200
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
Subject: [PATCH] spi: fix controller registration API inconsistency
Date: Tue, 12 May 2026 16:01:31 +0200
Message-ID: <20260512140131.998680-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 959555230EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linuxfoundation.org,wunner.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-61269-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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
spi_bitbang_start(). [4]

Fix the API inconsistency by no longer dropping a reference when
deregistering non-devres allocated controllers.

[1] 68b892f1fdc4 ("spi: document odd controller reference handling")
[2] 5e844cc37a5c ("spi: Introduce device-managed SPI controller allocation")
[3] 3f174274d224 ("spi: fix misleading controller deregistration kernel-doc")
[4] 702a4879ec33 ("spi: bitbang: Let spi_bitbang_start() take a reference to master")

Signed-off-by: Johan Hovold <johan@kernel.org>
---

This one depends on the third set of devres allocation conversions:

	https://lore.kernel.org/lkml/20260511150408.796155-1-johan@kernel.org/

posted yesterday.

Note that this touches a media driver and a greybus driver in staging,
neither which sees many changes so the risk of conflicts when taking
this through the SPI tree is low.

In the unlikely event that a new SPI driver using non-managed allocation
is merged through some other tree for 7.2, the resulting memory leak can
be trivially plugged once in mainline.

Johan


 drivers/media/usb/msi2500/msi2500.c |  9 ++++----
 drivers/spi/spi-bitbang.c           | 11 +--------
 drivers/spi/spi-dw-core.c           |  2 ++
 drivers/spi/spi-fsl-dspi.c          |  2 ++
 drivers/spi/spi-mpc52xx.c           |  2 +-
 drivers/spi/spi-topcliff-pch.c      |  2 --
 drivers/spi/spi.c                   | 35 +++++------------------------
 drivers/staging/greybus/spilib.c    |  8 +++----
 include/linux/spi/spi.h             |  4 ----
 9 files changed, 19 insertions(+), 56 deletions(-)

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
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 5f57de24b9f7..0576bd00d3ef 100644
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


