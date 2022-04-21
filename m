Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9153650AC34
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442699AbiDUXqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442687AbiDUXqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:46:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3651ADFE7
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:43:09 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70DEEE86;
        Fri, 22 Apr 2022 01:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650584575;
        bh=QPfG8O0stw5+YAORHnHQk3+G6V7eQaPFNEU2zOvgr/c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jcBGZ58VKhbePTHBDtVhASG7H9UZugdErCtRlnnOknBMYCmuBpkbbXxEu2MajFWWY
         9mCVJW4eAjzURhUAHwTqNnzOfDalOd95PQR6nGFeCqCQ8HWYqYivO+rudThDbf7c+G
         vSYDunWRZ/Nfy1QSpe7Ns87ER0NqSvxXdJLcMcYA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v4 18/21] media: rkisp1: debug: Compute max register length name dynamically
Date:   Fri, 22 Apr 2022 02:42:37 +0300
Message-Id: <20220421234240.1694-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
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

Don't hardcode the register name maximum length (used for alignment
purposes) to 14, but compute it dynamically. The small performance
impact isn't an issue as this is debugging code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index 2c226f20f525..28a69323cb38 100644
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
@@ -32,22 +34,29 @@ static int rkisp1_debug_dump_regs(struct rkisp1_device *rkisp1,
 				  struct seq_file *m, unsigned int offset,
 				  const struct rkisp1_debug_register *regs)
 {
+	const struct rkisp1_debug_register *reg;
+	int width = 0;
 	u32 val, shd;
 	int ret;
 
+	for (reg = regs; reg->name; ++reg)
+		width = max_t(int, width, strlen(reg->name));
+
+	width += 1;
+
 	ret = pm_runtime_get_if_in_use(rkisp1->dev);
 	if (ret <= 0)
 		return ret ? : -ENODATA;
 
-	for ( ; regs->name; ++regs) {
-		val = rkisp1_read(rkisp1, offset + regs->reg);
+	for (reg = regs; reg->name; ++reg) {
+		val = rkisp1_read(rkisp1, offset + reg->reg);
 
-		if (regs->shd) {
-			shd = rkisp1_read(rkisp1, offset + regs->shd);
-			seq_printf(m, "%14s: 0x%08x/0x%08x\n", regs->name,
+		if (reg->shd) {
+			shd = rkisp1_read(rkisp1, offset + reg->shd);
+			seq_printf(m, "%*s: 0x%08x/0x%08x\n", width, reg->name,
 				   val, shd);
 		} else {
-			seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
+			seq_printf(m, "%*s: 0x%08x\n", width, reg->name, val);
 		}
 	}
 
-- 
Regards,

Laurent Pinchart

