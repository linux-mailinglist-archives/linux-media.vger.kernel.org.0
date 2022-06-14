Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C562654BA24
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344966AbiFNTLz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233902AbiFNTLx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:11:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9CD205CF
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:11:52 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23DB39E5;
        Tue, 14 Jun 2022 21:11:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655233910;
        bh=/A1n8h0CJ9AcyNo5dUhvyUtS5N+++2CIezT6d2+7DJE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pFjHNOvbILdbCTyyqoEV1/XPDJygKqcczgBSnLsgH3e40/JKlU2PDRSWV185m7Pm3
         S3KMShJkf2fdO8Za+rnzU84qZ+xL+Y63v6A2ykEHtwWKJldv4bAh8iZpl+LqySQ5BV
         RvSvbinzWrIpEMzYI7phGRNQmbEfxDCxFtYC+ioE=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>, dafna@fastmail.com,
        heiko@sntech.de, laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 01/55] media: rkisp1: debug: Add dump file in debugfs for MI buffer registers
Date:   Wed, 15 Jun 2022 04:10:33 +0900
Message-Id: <20220614191127.3420492-2-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a register dump file in debugfs for some of the buffer-related
registers in MI, for the base address, the size, and the offset. Also
dump the appropriate shadow registers.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index e76dc2b164b6..1a59c00fabdd 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -121,6 +121,24 @@ static int rkisp1_debug_dump_rsz_regs_show(struct seq_file *m, void *p)
 }
 DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_rsz_regs);
 
+static int rkisp1_debug_dump_mi_mp_y_offs_cnt_show(struct seq_file *m, void *p)
+{
+	static const struct rkisp1_debug_register registers[] = {
+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_INIT),
+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_INIT2),
+		RKISP1_DEBUG_REG(MI_MP_Y_BASE_AD_SHD),
+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_INIT),
+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_INIT),
+		RKISP1_DEBUG_REG(MI_MP_Y_SIZE_SHD),
+		RKISP1_DEBUG_REG(MI_MP_Y_OFFS_CNT_SHD),
+		{ /* Sentinel */ },
+	};
+	struct rkisp1_device *rkisp1 = m->private;
+
+	return rkisp1_debug_dump_regs(rkisp1, m, 0, registers);
+}
+DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_mi_mp_y_offs_cnt);
+
 #define RKISP1_DEBUG_DATA_COUNT_BINS	32
 #define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
 
@@ -214,6 +232,9 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 	debugfs_create_file("srsz", 0444, regs_dir,
 			    &rkisp1->resizer_devs[RKISP1_SELFPATH],
 			    &rkisp1_debug_dump_rsz_regs_fops);
+
+	debugfs_create_file("mi_mp_y_bufs", 0444, regs_dir, rkisp1,
+			    &rkisp1_debug_dump_mi_mp_y_offs_cnt_fops);
 }
 
 void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
-- 
2.30.2

