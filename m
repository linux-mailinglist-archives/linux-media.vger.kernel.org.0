Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DA827D029
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 15:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731226AbgI2N6X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 09:58:23 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:47110 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731030AbgI2N6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 09:58:08 -0400
X-IronPort-AV: E=Sophos;i="5.77,318,1596492000"; 
   d="scan'208";a="470079958"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256; 29 Sep 2020 15:57:41 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/20] media: msp3400: use semicolons rather than commas to separate statements
Date:   Tue, 29 Sep 2020 15:14:35 +0200
Message-Id: <1601385283-26144-13-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/i2c/msp3400-kthreads.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/msp3400-kthreads.c b/drivers/media/i2c/msp3400-kthreads.c
index 52e506f86de5..ecabc0e1d32e 100644
--- a/drivers/media/i2c/msp3400-kthreads.c
+++ b/drivers/media/i2c/msp3400-kthreads.c
@@ -549,8 +549,10 @@ int msp3400c_thread(void *data)
 			val = msp_read_dsp(client, 0x1b);
 			if (val > 32767)
 				val -= 65536;
-			if (val1 < val)
-				val1 = val, max1 = i;
+			if (val1 < val) {
+				val1 = val;
+				max1 = i;
+			}
 			dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"carrier1 val: %5d / %s\n", val, cd[i].name);
 		}
@@ -586,8 +588,10 @@ int msp3400c_thread(void *data)
 			val = msp_read_dsp(client, 0x1b);
 			if (val > 32767)
 				val -= 65536;
-			if (val2 < val)
-				val2 = val, max2 = i;
+			if (val2 < val) {
+				val2 = val;
+				max2 = i;
+			}
 			dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"carrier2 val: %5d / %s\n", val, cd[i].name);
 		}

