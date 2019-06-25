Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7215655043
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 15:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729841AbfFYNZ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 09:25:27 -0400
Received: from gofer.mess.org ([88.97.38.141]:37235 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbfFYNZ1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 09:25:27 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 273C160739; Tue, 25 Jun 2019 14:25:26 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-ctl: increase limit to match kernel
Date:   Tue, 25 Jun 2019 14:25:26 +0100
Message-Id: <20190625132526.18749-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This changed in kernel v5.3. In earlier versions, EINVAL
will be returned.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/ir-ctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index ad830612..03c2791d 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -53,8 +53,8 @@
        __result; })
 #endif
 
-/* See drivers/media/rc/ir-lirc-codec.c line 23 */
-#define LIRCBUF_SIZE	512
+/* See drivers/media/rc/lirc_dev.c line 22 */
+#define LIRCBUF_SIZE 1024
 #define IR_DEFAULT_TIMEOUT 125000
 
 const char *argp_program_version = "IR raw version " V4L_UTILS_VERSION;
-- 
2.11.0

