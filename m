Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49BB155FDD2
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 12:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbiF2Kvp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 06:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232819AbiF2Kvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 06:51:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0C225290;
        Wed, 29 Jun 2022 03:51:41 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B6166D1;
        Wed, 29 Jun 2022 12:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656499900;
        bh=IgtsC0vuaLqpwgYx/9+11ekCHWgajYs+RiS9QDgkPMQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WoN5VJVIHWSTH6lMYTRDKwrsUiIZzgF1Rhv5GA6HB004RUVySl059FBrDu/QLhBB3
         poPaWgqkfHuHDDCJXiZh2soNwQicBD9Yu5XqCI+6W2ztROV3lj4esL7eIzxBsKtGh6
         RwQ6ynNyAWGw4QCkf0vatt9ZSPEGT2A4Tjzayzdw=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/7] debugfs: Extend debugfs regset to support register decoding
Date:   Wed, 29 Jun 2022 11:51:29 +0100
Message-Id: <20220629105135.2652773-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629105135.2652773-1-kieran.bingham+renesas@ideasonboard.com>
References: <20220629105135.2652773-1-kieran.bingham+renesas@ideasonboard.com>
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

Allow regsets to provide a function to present decoded information on
register usage. This allows a static function to be passed the value
read from the register and present the information in a human readable
form.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
This is purely RFC / Personal debug use only.

- I'm not currently recommending/suggesting/asking for this change to
  the core debugfs infrastructure.

- I have not put effort into design, or thought about how this should be
  done, this is just something I use locally as a quick hack.

- I would likely use https://github.com/tomba/rwmem if I were to tackle
  this again now.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 fs/debugfs/file.c       | 11 +++++++++--
 include/linux/debugfs.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 950c63fa4d0b..b777d558ea0c 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1111,10 +1111,17 @@ void debugfs_print_regs32(struct seq_file *s, const struct debugfs_reg32 *regs,
 	int i;
 
 	for (i = 0; i < nregs; i++, regs++) {
+		u32 value = readl(base + regs->offset);
 		if (prefix)
 			seq_printf(s, "%s", prefix);
-		seq_printf(s, "%s = 0x%08x\n", regs->name,
-			   readl(base + regs->offset));
+
+		seq_printf(s, "%s = 0x%08x", regs->name, value);
+
+		if (regs->decode_reg)
+			regs->decode_reg(s, value);
+
+		seq_puts(s, "\n");
+
 		if (seq_has_overflowed(s))
 			break;
 	}
diff --git a/include/linux/debugfs.h b/include/linux/debugfs.h
index c869f1e73d75..70dc487c03ed 100644
--- a/include/linux/debugfs.h
+++ b/include/linux/debugfs.h
@@ -29,6 +29,7 @@ struct debugfs_blob_wrapper {
 struct debugfs_reg32 {
 	char *name;
 	unsigned long offset;
+	void (*decode_reg)(struct seq_file *s, u32 value);
 };
 
 struct debugfs_regset32 {
-- 
2.34.1

