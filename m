Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B1A4CDA18
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 18:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241009AbiCDRVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 12:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241057AbiCDRVZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 12:21:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B3F1C468A
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 09:20:33 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BDB2218B;
        Fri,  4 Mar 2022 18:19:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646414391;
        bh=NfhcRaOKnhJs2ckz7D7y6MXIixwJUREYQUk8lB1BpY8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=toVsLlQxnpkaTYXws2dJAJPFP2SBr4NNBszeJooriOiCNas8bHUgGezZTTvd644Lu
         G28mmndeILSf/aF2Tkl5EWHsr6bSOjabFCa1m0zTmQSPmwK7CJAp3I79XQBaZ3wwPE
         /rx0bSAegGMPONCH02aL2uq0OXEJ9HzbJg8THQYg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 14/17] media: rkisp1: debug: Collect input status by sampling ISP_FLAGS_SHD
Date:   Fri,  4 Mar 2022 19:19:22 +0200
Message-Id: <20220304171925.1592-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ISP_FLAGS_SHD register exposes the ISP parallel input signals (data
and synchronization) in real time. This can help debugging when the
device doesn't output any image. Sample the register 10000 times with a
1µs delay and expose the result through debugfs.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 46 +++++++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  9 ++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index 64b33774cbdf..8be4ac134cc9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -9,9 +9,53 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/seq_file.h>
 
 #include "rkisp1-common.h"
+#include "rkisp1-regs.h"
+
+#define RKISP1_DEBUG_DATA_COUNT_BINS	32
+#define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
+
+static int rkisp1_debug_input_status_show(struct seq_file *m, void *p)
+{
+	struct rkisp1_device *rkisp1 = m->private;
+	u16 data_count[RKISP1_DEBUG_DATA_COUNT_BINS] = { };
+	unsigned int hsync_count = 0;
+	unsigned int vsync_count = 0;
+	unsigned int i;
+	u32 data;
+	u32 val;
+
+	/* Sample the ISP input port status 10000 times with a 1µs interval. */
+	for (i = 0; i < 10000; ++i) {
+		val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_FLAGS_SHD);
+
+		data = (val & RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_MASK)
+		     >> RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_SHIFT;
+		data_count[data / RKISP1_DEBUG_DATA_COUNT_STEP]++;
+
+		if (val & RKISP1_CIF_ISP_FLAGS_SHD_S_HSYNC)
+			hsync_count++;
+		if (val & RKISP1_CIF_ISP_FLAGS_SHD_S_VSYNC)
+			vsync_count++;
+
+		udelay(1);
+	}
+
+	seq_printf(m, "vsync: %u, hsync: %u\n", vsync_count, hsync_count);
+	seq_puts(m, "data:\n");
+	for (i = 0; i < ARRAY_SIZE(data_count); ++i)
+		seq_printf(m, "- [%04u:%04u]: %u\n",
+			   i * RKISP1_DEBUG_DATA_COUNT_STEP,
+			   (i + 1) * RKISP1_DEBUG_DATA_COUNT_STEP - 1,
+			   data_count[i]);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_input_status);
 
 void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 {
@@ -42,6 +86,8 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 			     &debug->frame_drop[RKISP1_MAINPATH]);
 	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
 			     &debug->frame_drop[RKISP1_SELFPATH]);
+	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
+			    &rkisp1_debug_input_status_fops);
 }
 
 void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index 083d92ada73f..447c5f241d69 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -454,6 +454,15 @@
 #define RKISP1_CIF_ISP_DEMOSAIC_BYPASS			BIT(10)
 #define RKISP1_CIF_ISP_DEMOSAIC_TH(x)			((x) & 0xFF)
 
+/* ISP_FLAGS_SHD */
+#define RKISP1_CIF_ISP_FLAGS_SHD_ISP_ENABLE_SHD		BIT(0)
+#define RKISP1_CIF_ISP_FLAGS_SHD_ISP_ENABLE_INFORM_SHD	BIT(1)
+#define RKISP1_CIF_ISP_FLAGS_SHD_INFORM_FIELD		BIT(2)
+#define RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_MASK		GENMASK(27, 16)
+#define RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_SHIFT		16
+#define RKISP1_CIF_ISP_FLAGS_SHD_S_VSYNC		BIT(30)
+#define RKISP1_CIF_ISP_FLAGS_SHD_S_HSYNC		BIT(31)
+
 /* AWB */
 /* ISP_AWB_PROP */
 #define RKISP1_CIF_ISP_AWB_YMAX_CMP_EN			BIT(2)
-- 
Regards,

Laurent Pinchart

