Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE9C7443E5A
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 09:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbhKCI1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 04:27:22 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:51325 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbhKCI1V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 04:27:21 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1A3815ve088944;
        Wed, 3 Nov 2021 16:01:05 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Nov
 2021 16:23:57 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC:     Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [Resend PATCH v3] media: aspeed: fix mode-detect always time out at 2nd run
Date:   Wed, 3 Nov 2021 16:23:54 +0800
Message-ID: <20211103082354.408-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1A3815ve088944
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

aspeed_video_get_resolution() will try to do res-detect again if the
timing got in last try is invalid. But it will always time out because
VE_SEQ_CTRL_TRIG_MODE_DET is only cleared after 1st mode-detect.

To fix the problem, just clear VE_SEQ_CTRL_TRIG_MODE_DET before setting
it in aspeed_video_enable_mode_detect().

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
v3:
  - add tag
v2:
  - update commit message
---
 drivers/media/platform/aspeed-video.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 5ffbabf884eb..fea5e4d0927e 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -518,6 +518,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
 	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
 			    VE_INTERRUPT_MODE_DETECT);
 
+	/* Disable mode detect in order to re-trigger */
+	aspeed_video_update(video, VE_SEQ_CTRL,
+			    VE_SEQ_CTRL_TRIG_MODE_DET, 0);
+
 	/* Trigger mode detect */
 	aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
 }
@@ -809,10 +813,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 			return;
 		}
 
-		/* Disable mode detect in order to re-trigger */
-		aspeed_video_update(video, VE_SEQ_CTRL,
-				    VE_SEQ_CTRL_TRIG_MODE_DET, 0);
-
 		aspeed_video_check_and_set_polarity(video);
 
 		aspeed_video_enable_mode_detect(video);
-- 
2.25.1

