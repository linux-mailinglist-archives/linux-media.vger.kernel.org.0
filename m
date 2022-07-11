Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9DFA570334
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbiGKMpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbiGKMp1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:45:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4638E65D79
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:44:55 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F96E3072;
        Mon, 11 Jul 2022 14:43:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543427;
        bh=XSZtVM1Bez/cB6qE60ZF5HBiqVYgE/JYhlVPr4v2UJo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uYDRVPnU/yT2yELUQRMV6xWOsTcONb7pq11gf9pWri3HB861QS2CisYMuylhF2pw+
         mL1e8kidgI2TjZAzE0BWN+S8wmpjCdxeGUiJ+h6LE8V0TQ4QEeGc9mrzJfSmmRK7SB
         hI6jj7qF0yTLnstjYxnpUnO3MeqtysCeeQiOTCaY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 46/46] media: rkisp1: debug: Add dump file in debugfs for MI main path registers
Date:   Mon, 11 Jul 2022 15:42:48 +0300
Message-Id: <20220711124248.2683-47-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
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

From: Paul Elder <paul.elder@ideasonboard.com>

Add a register dump file in debugfs for some of the buffer-related
registers for the main path in MI (for the base address, the size, and
the offset). Also dump the corresponding shadow registers.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
Changes since v2:

- Rename file from mi_mp_y_bufs to mi_mp
---
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index e76dc2b164b6..71df3dc95e6f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -121,6 +121,24 @@ static int rkisp1_debug_dump_rsz_regs_show(struct seq_file *m, void *p)
 }
 DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_rsz_regs);
 
+static int rkisp1_debug_dump_mi_mp_show(struct seq_file *m, void *p)
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
+DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_mi_mp);
+
 #define RKISP1_DEBUG_DATA_COUNT_BINS	32
 #define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
 
@@ -214,6 +232,9 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 	debugfs_create_file("srsz", 0444, regs_dir,
 			    &rkisp1->resizer_devs[RKISP1_SELFPATH],
 			    &rkisp1_debug_dump_rsz_regs_fops);
+
+	debugfs_create_file("mi_mp", 0444, regs_dir, rkisp1,
+			    &rkisp1_debug_dump_mi_mp_fops);
 }
 
 void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
-- 
Regards,

Laurent Pinchart

