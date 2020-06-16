Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084421FB11D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 14:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgFPMsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 08:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbgFPMsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 08:48:30 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C872EC08C5C4
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 05:48:23 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1E1CB11A006; Tue, 16 Jun 2020 13:48:19 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>
Subject: [PATCH 4/4] media: cx23888: remove unused functions
Date:   Tue, 16 Jun 2020 13:48:18 +0100
Message-Id: <3a628679ee664df02b89250402b4e699fd0ca6bf.1592302248.git.sean@mess.org>
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
drivers/media/pci/cx23885/cx23888-ir.c:178:19: warning: unused function 'ns_to_clock_divider' [-Wunused-function]
static inline u16 ns_to_clock_divider(unsigned int ns)
                  ^
drivers/media/pci/cx23885/cx23888-ir.c:184:28: warning: unused function 'clock_divider_to_ns' [-Wunused-function]
static inline unsigned int clock_divider_to_ns(unsigned int divider)
                           ^
drivers/media/pci/cx23885/cx23888-ir.c:202:19: warning: unused function 'freq_to_clock_divider' [-Wunused-function]
static inline u16 freq_to_clock_divider(unsigned int freq,
                  ^

Cc: Andy Walls <awalls@md.metrocast.net>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/pci/cx23885/cx23888-ir.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23888-ir.c b/drivers/media/pci/cx23885/cx23888-ir.c
index d59ca3601785e..ad7f8ccad526c 100644
--- a/drivers/media/pci/cx23885/cx23888-ir.c
+++ b/drivers/media/pci/cx23885/cx23888-ir.c
@@ -175,19 +175,6 @@ static inline u16 count_to_clock_divider(unsigned int d)
 	return (u16) d;
 }
 
-static inline u16 ns_to_clock_divider(unsigned int ns)
-{
-	return count_to_clock_divider(
-		DIV_ROUND_CLOSEST(CX23888_IR_REFCLK_FREQ / 1000000 * ns, 1000));
-}
-
-static inline unsigned int clock_divider_to_ns(unsigned int divider)
-{
-	/* Period of the Rx or Tx clock in ns */
-	return DIV_ROUND_CLOSEST((divider + 1) * 1000,
-				 CX23888_IR_REFCLK_FREQ / 1000000);
-}
-
 static inline u16 carrier_freq_to_clock_divider(unsigned int freq)
 {
 	return count_to_clock_divider(
@@ -199,13 +186,6 @@ static inline unsigned int clock_divider_to_carrier_freq(unsigned int divider)
 	return DIV_ROUND_CLOSEST(CX23888_IR_REFCLK_FREQ, (divider + 1) * 16);
 }
 
-static inline u16 freq_to_clock_divider(unsigned int freq,
-					unsigned int rollovers)
-{
-	return count_to_clock_divider(
-		   DIV_ROUND_CLOSEST(CX23888_IR_REFCLK_FREQ, freq * rollovers));
-}
-
 static inline unsigned int clock_divider_to_freq(unsigned int divider,
 						 unsigned int rollovers)
 {
-- 
2.26.2

