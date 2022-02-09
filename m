Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7C44AF674
	for <lists+linux-media@lfdr.de>; Wed,  9 Feb 2022 17:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235493AbiBIQW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Feb 2022 11:22:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233355AbiBIQWY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Feb 2022 11:22:24 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963E0C05CB89
        for <linux-media@vger.kernel.org>; Wed,  9 Feb 2022 08:22:26 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1D28D101BFE; Wed,  9 Feb 2022 16:22:25 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: lirc: remove unused feature LIRC_CAN_SET_REC_DUTY_CYCLE
Date:   Wed,  9 Feb 2022 16:22:25 +0000
Message-Id: <20220209162225.632209-1-sean@mess.org>
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

There is no hardware which can filter input on the duty cycle, so no
driver implements this. On top of that, LIRC_CAN_SET_REC_DUTY_CYCLE
has the same value as LIRC_CAN_MEASURE_CARRIER (0x02000000).

Signed-off-by: Sean Young <sean@mess.org>
---
 include/uapi/linux/lirc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/uapi/linux/lirc.h b/include/uapi/linux/lirc.h
index 21c69a6a100db..23b0f2c8ba81e 100644
--- a/include/uapi/linux/lirc.h
+++ b/include/uapi/linux/lirc.h
@@ -73,7 +73,6 @@
 #define LIRC_CAN_REC_MASK              LIRC_MODE2REC(LIRC_CAN_SEND_MASK)
 
 #define LIRC_CAN_SET_REC_CARRIER       (LIRC_CAN_SET_SEND_CARRIER << 16)
-#define LIRC_CAN_SET_REC_DUTY_CYCLE    (LIRC_CAN_SET_SEND_DUTY_CYCLE << 16)
 
 #define LIRC_CAN_SET_REC_CARRIER_RANGE    0x80000000
 #define LIRC_CAN_GET_REC_RESOLUTION       0x20000000
-- 
2.34.1

