Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44E4550EAE8
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 23:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245308AbiDYVER (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 17:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231753AbiDYVEQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 17:04:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747D010FDD
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 14:01:10 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E465496;
        Mon, 25 Apr 2022 23:01:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650920468;
        bh=KlG0z4fR6YwQgD2L410Xq9NMkO7Ubkh2YbuSrfD9CB4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SUWe8je4NCg8kTbalv9YSJQC+TOVnSzBvL6rgXRjqjSuO0fpb2eA0xnW8ATdHMsNh
         22ajKoL6Xu5Yi7Vmg3IpFJ3QwvQYnPvdb2p8Dx0DdqMqTDhvitVjL8XuBpJ6Al39um
         Ot4gjaro50r43O3dBoUytG1tZ4ZpuGNkL0Yk3m0g=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4.1 18/21] media: rkisp1: debug: Update max register name length
Date:   Tue, 26 Apr 2022 00:01:04 +0300
Message-Id: <20220425210104.31964-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <Ymbw52EF+Pcvkclz@pendragon.ideasonboard.com>
References: <Ymbw52EF+Pcvkclz@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update the maximum register name length to match all the registers being
printed. This helps getting a consistent alignment of register dumps
when concatenating multiple debugfs files.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v4:

- Replace dynamic per-file register length with global maximum length
---
 .../media/platform/rockchip/rkisp1/rkisp1-debug.c    | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index 2c226f20f525..e76dc2b164b6 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -11,8 +11,10 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/minmax.h>
 #include <linux/pm_runtime.h>
 #include <linux/seq_file.h>
+#include <linux/string.h>
 
 #include "rkisp1-common.h"
 #include "rkisp1-regs.h"
@@ -28,10 +30,14 @@ struct rkisp1_debug_register {
 	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name \
 }
 
+/* Keep this up-to-date when adding new registers. */
+#define RKISP1_MAX_REG_LENGTH		21
+
 static int rkisp1_debug_dump_regs(struct rkisp1_device *rkisp1,
 				  struct seq_file *m, unsigned int offset,
 				  const struct rkisp1_debug_register *regs)
 {
+	const int width = RKISP1_MAX_REG_LENGTH;
 	u32 val, shd;
 	int ret;
 
@@ -39,15 +45,15 @@ static int rkisp1_debug_dump_regs(struct rkisp1_device *rkisp1,
 	if (ret <= 0)
 		return ret ? : -ENODATA;
 
-	for ( ; regs->name; ++regs) {
+	for (; regs->name; ++regs) {
 		val = rkisp1_read(rkisp1, offset + regs->reg);
 
 		if (regs->shd) {
 			shd = rkisp1_read(rkisp1, offset + regs->shd);
-			seq_printf(m, "%14s: 0x%08x/0x%08x\n", regs->name,
+			seq_printf(m, "%*s: 0x%08x/0x%08x\n", width, regs->name,
 				   val, shd);
 		} else {
-			seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
+			seq_printf(m, "%*s: 0x%08x\n", width, regs->name, val);
 		}
 	}
 
-- 
Regards,

Laurent Pinchart

