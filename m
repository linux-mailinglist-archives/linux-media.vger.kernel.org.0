Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1844AE79E
	for <lists+linux-media@lfdr.de>; Wed,  9 Feb 2022 04:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242692AbiBIDId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 22:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348213AbiBIDGZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 22:06:25 -0500
X-Greylist: delayed 1222 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 19:05:09 PST
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C56C0401C2
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 19:05:08 -0800 (PST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id 2192adI8041190
        for <linux-media@vger.kernel.org>; Wed, 9 Feb 2022 10:36:39 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 2192Z4x4041087;
        Wed, 9 Feb 2022 10:35:04 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 9 Feb
 2022 10:43:15 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] media: aspeed: Fix incorrect color
Date:   Wed, 9 Feb 2022 10:43:12 +0800
Message-ID: <20220209024312.2218-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2192Z4x4041087
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current settings for rgb-2-yuv is BT.601(studio swing), but JFIF
uses BT.601(full swing).

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index eb9c17ac0e14..08b63b8297f0 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1089,7 +1089,7 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
 	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
 		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
 		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
-	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR;
+	u32 ctrl = VE_CTRL_AUTO_OR_CURSOR | VE_CTRL_YUV;
 	u32 seq_ctrl = video->jpeg_mode;
 
 	if (video->frame_rate)
-- 
2.25.1

