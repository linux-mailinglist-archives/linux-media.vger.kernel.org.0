Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9290059F3D2
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 08:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235240AbiHXG5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 02:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232474AbiHXG5b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 02:57:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7806D85FD5
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 23:57:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2C807B82371
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 06:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592ECC433C1;
        Wed, 24 Aug 2022 06:57:27 +0000 (UTC)
Message-ID: <5b23b429-f2b7-5d18-8f35-2c41a3e4be54@xs4all.nl>
Date:   Wed, 24 Aug 2022 08:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Alain Volmat <alain.volmat@foss.st.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media/cec: use CEC_MAX_MSG_SIZE instead of hardcoded 16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the proper define for the maximum CEC message length instead of
hardcoding it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/cec/platform/sti/stih-cec.c b/drivers/media/cec/platform/sti/stih-cec.c
index abf8e8bcbb34..4edbdd09535d 100644
--- a/drivers/media/cec/platform/sti/stih-cec.c
+++ b/drivers/media/cec/platform/sti/stih-cec.c
@@ -256,8 +256,8 @@ static void stih_rx_done(struct stih_cec *cec, u32 status)
 	if (!msg.len)
 		return;
 
-	if (msg.len > 16)
-		msg.len = 16;
+	if (msg.len > CEC_MAX_MSG_SIZE)
+		msg.len = CEC_MAX_MSG_SIZE;
 
 	for (i = 0; i < msg.len; i++)
 		msg.msg[i] = readl(cec->regs + CEC_RX_DATA_BASE + i);
diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 202e0cd83f90..910b5e83946a 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -943,8 +943,8 @@ static int adv7511_isr(struct v4l2_subdev *sd, u32 status, bool *handled)
 		v4l2_dbg(1, debug, sd, "%s: cec msg len %d\n", __func__,
 			 msg.len);
 
-		if (msg.len > 16)
-			msg.len = 16;
+		if (msg.len > CEC_MAX_MSG_SIZE)
+			msg.len = CEC_MAX_MSG_SIZE;
 
 		if (msg.len) {
 			u8 i;
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 497419a5cfdd..815fe108281f 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -2047,8 +2047,8 @@ static void adv76xx_cec_isr(struct v4l2_subdev *sd, bool *handled)
 		struct cec_msg msg;
 
 		msg.len = cec_read(sd, 0x25) & 0x1f;
-		if (msg.len > 16)
-			msg.len = 16;
+		if (msg.len > CEC_MAX_MSG_SIZE)
+			msg.len = CEC_MAX_MSG_SIZE;
 
 		if (msg.len) {
 			u8 i;
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 22caa070273b..c541f9b3444b 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -2215,8 +2215,8 @@ static void adv7842_cec_isr(struct v4l2_subdev *sd, bool *handled)
 		struct cec_msg msg;
 
 		msg.len = cec_read(sd, 0x25) & 0x1f;
-		if (msg.len > 16)
-			msg.len = 16;
+		if (msg.len > CEC_MAX_MSG_SIZE)
+			msg.len = CEC_MAX_MSG_SIZE;
 
 		if (msg.len) {
 			u8 i;
