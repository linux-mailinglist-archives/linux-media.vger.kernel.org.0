Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0F040AB26
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 11:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbhINJwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 05:52:36 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:64250 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhINJwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 05:52:31 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 18E9Uefk047557;
        Tue, 14 Sep 2021 17:30:40 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 14 Sep
 2021 17:50:30 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC:     <BMC-SW@aspeedtech.com>
Subject: [PATCH resend] media: aspeed: refine to avoid full jpeg update
Date:   Tue, 14 Sep 2021 17:49:20 +0800
Message-ID: <20210914094919.3506-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18E9Uefk047557
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The switch of jpeg 420/444 subsampling will update full jpeg header for
aspeed now.

Just update the 420/444 subsampling part of jpeg header is fine.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 resend the patch becuase cc-list isn't complete.

 drivers/media/platform/aspeed-video.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 3c90f3f3cf14..8b3939b8052d 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -401,6 +401,21 @@ static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
 	}
 }
 
+// just update jpeg dct table per 420/444
+static void aspeed_video_update_jpeg_table(u32 *table, bool yuv420)
+{
+	int i;
+	unsigned int base;
+
+	for (i = 0; i < ASPEED_VIDEO_JPEG_NUM_QUALITIES; i++) {
+		base = 256 * i;	/* AST HW requires this header spacing */
+		base += ASPEED_VIDEO_JPEG_HEADER_SIZE +
+			ASPEED_VIDEO_JPEG_DCT_SIZE;
+
+		table[base + 2] = (yuv420) ? 0x00220103 : 0x00110103;
+	}
+}
+
 static void aspeed_video_update(struct aspeed_video *video, u32 reg, u32 clear,
 				u32 bits)
 {
@@ -1274,7 +1289,7 @@ static void aspeed_video_update_jpeg_quality(struct aspeed_video *video)
 static void aspeed_video_update_subsampling(struct aspeed_video *video)
 {
 	if (video->jpeg.virt)
-		aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
+		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
 
 	if (video->yuv420)
 		aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_YUV420);
-- 
2.25.1

