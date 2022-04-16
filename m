Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF996503637
	for <lists+linux-media@lfdr.de>; Sat, 16 Apr 2022 13:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbiDPLLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Apr 2022 07:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbiDPLL2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Apr 2022 07:11:28 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9BFA94F0
        for <linux-media@vger.kernel.org>; Sat, 16 Apr 2022 04:08:56 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D0232101C24; Sat, 16 Apr 2022 11:08:52 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] media: gpio-ir-tx: simplify wait logic
Date:   Sat, 16 Apr 2022 12:08:52 +0100
Message-Id: <20220416110852.800377-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do not handroll mdelay().

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/gpio-ir-tx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
index a50701cfbbd7..d3063ddb472e 100644
--- a/drivers/media/rc/gpio-ir-tx.c
+++ b/drivers/media/rc/gpio-ir-tx.c
@@ -62,8 +62,13 @@ static void delay_until(ktime_t until)
 			return;
 
 		/* udelay more than 1ms may not work */
-		delta = min(delta, 1000);
+		if (delta >= 1000) {
+			mdelay(delta / 1000);
+			continue;
+		}
+
 		udelay(delta);
+		break;
 	}
 }
 
-- 
2.35.1

