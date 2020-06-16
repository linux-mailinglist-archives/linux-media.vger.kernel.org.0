Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216671FB11B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 14:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbgFPMsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 08:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbgFPMsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 08:48:30 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC2BC08C5C5
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 05:48:23 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0247311A005; Tue, 16 Jun 2020 13:48:18 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/4] media: fintek-cir: remove unused function fintek_clear_reg_bit
Date:   Tue, 16 Jun 2020 13:48:17 +0100
Message-Id: <ce70fccac231bd9e3360bbb3f14a60b9d2247400.1592302248.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1592302248.git.sean@mess.org>
References: <cover.1592302248.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with clang:

drivers/media/rc/fintek-cir.c:55:20: warning: unused function 'fintek_clear_reg_bit' [-Wunused-function]
static inline void fintek_clear_reg_bit(struct fintek_dev *fintek, u8 val, u8 reg)

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/fintek-cir.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/rc/fintek-cir.c b/drivers/media/rc/fintek-cir.c
index b74bb13161fd4..8e3177c5b5865 100644
--- a/drivers/media/rc/fintek-cir.c
+++ b/drivers/media/rc/fintek-cir.c
@@ -51,13 +51,6 @@ static inline void fintek_set_reg_bit(struct fintek_dev *fintek, u8 val, u8 reg)
 	fintek_cr_write(fintek, tmp, reg);
 }
 
-/* clear config register bit without changing other bits */
-static inline void fintek_clear_reg_bit(struct fintek_dev *fintek, u8 val, u8 reg)
-{
-	u8 tmp = fintek_cr_read(fintek, reg) & ~val;
-	fintek_cr_write(fintek, tmp, reg);
-}
-
 /* enter config mode */
 static inline void fintek_config_mode_enable(struct fintek_dev *fintek)
 {
-- 
2.26.2

