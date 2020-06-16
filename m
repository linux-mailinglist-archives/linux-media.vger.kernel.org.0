Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1FD1FB11A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 14:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgFPMsa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 08:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgFPMs3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 08:48:29 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8735FC08C5C2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 05:48:23 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DAF7311A004; Tue, 16 Jun 2020 13:48:18 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/4] media: nuvoton-cir: remove setting tx carrier functions
Date:   Tue, 16 Jun 2020 13:48:16 +0100
Message-Id: <fbeb63615dadf5b955a3edd05203f575d4454524.1592302248.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1592302248.git.sean@mess.org>
References: <cover.1592302248.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since this driver could never transmit IR, setting the tx carrier makes
no sense.

Fixes: 87284271b73b8 ("media: rc: nuvoton: remove rudimentary transmit functionality")

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/nuvoton-cir.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/media/rc/nuvoton-cir.c b/drivers/media/rc/nuvoton-cir.c
index 48a69bf23236e..52d246dc5b3da 100644
--- a/drivers/media/rc/nuvoton-cir.c
+++ b/drivers/media/rc/nuvoton-cir.c
@@ -74,13 +74,6 @@ static inline void nvt_set_reg_bit(struct nvt_dev *nvt, u8 val, u8 reg)
 	nvt_cr_write(nvt, tmp, reg);
 }
 
-/* clear config register bit without changing other bits */
-static inline void nvt_clear_reg_bit(struct nvt_dev *nvt, u8 val, u8 reg)
-{
-	u8 tmp = nvt_cr_read(nvt, reg) & ~val;
-	nvt_cr_write(nvt, tmp, reg);
-}
-
 /* enter extended function mode */
 static inline int nvt_efm_enable(struct nvt_dev *nvt)
 {
@@ -631,30 +624,6 @@ static u32 nvt_rx_carrier_detect(struct nvt_dev *nvt)
 	return carrier;
 }
 #endif
-/*
- * set carrier frequency
- *
- * set carrier on 2 registers: CP & CC
- * always set CP as 0x81
- * set CC by SPEC, CC = 3MHz/carrier - 1
- */
-static int nvt_set_tx_carrier(struct rc_dev *dev, u32 carrier)
-{
-	struct nvt_dev *nvt = dev->priv;
-	u16 val;
-
-	if (carrier == 0)
-		return -EINVAL;
-
-	nvt_cir_reg_write(nvt, 1, CIR_CP);
-	val = 3000000 / (carrier) - 1;
-	nvt_cir_reg_write(nvt, val & 0xff, CIR_CC);
-
-	nvt_dbg("cp: 0x%x cc: 0x%x\n",
-		nvt_cir_reg_read(nvt, CIR_CP), nvt_cir_reg_read(nvt, CIR_CC));
-
-	return 0;
-}
 
 static int nvt_ir_raw_set_wakeup_filter(struct rc_dev *dev,
 					struct rc_scancode_filter *sc_filter)
@@ -1022,7 +991,6 @@ static int nvt_probe(struct pnp_dev *pdev, const struct pnp_device_id *dev_id)
 	rdev->encode_wakeup = true;
 	rdev->open = nvt_open;
 	rdev->close = nvt_close;
-	rdev->s_tx_carrier = nvt_set_tx_carrier;
 	rdev->s_wakeup_filter = nvt_ir_raw_set_wakeup_filter;
 	rdev->device_name = "Nuvoton w836x7hg Infrared Remote Transceiver";
 	rdev->input_phys = "nuvoton/cir0";
-- 
2.26.2

