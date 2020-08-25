Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E04251115
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 06:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbgHYE5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 00:57:20 -0400
Received: from smtprelay0209.hostedemail.com ([216.40.44.209]:35694 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728749AbgHYE5M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 00:57:12 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 9C175180A7FD3;
        Tue, 25 Aug 2020 04:57:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:541:800:857:960:973:988:989:1260:1311:1314:1345:1359:1515:1534:1542:1711:1730:1747:1777:1792:2393:2559:2562:3138:3139:3140:3141:3142:3352:3868:4321:4384:4605:5007:6117:6119:6261:7903:9036:10004:10848:11026:11473:11657:11658:11914:12043:12297:12438:12555:12895:12986:13138:13231:13894:14181:14394:14721:21080:21627:21773:21990:30029:30054,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: net87_2b0b7db27059
X-Filterd-Recvd-Size: 3347
Received: from joe-laptop.perches.com (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Tue, 25 Aug 2020 04:57:07 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     Jiri Kosina <trivial@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 14/29] media: Avoid comma separated statements
Date:   Mon, 24 Aug 2020 21:56:11 -0700
Message-Id: <5f2ac0ba683d4e5d3449395721788527b8487a57.1598331149.git.joe@perches.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use semicolons and braces.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/media/i2c/msp3400-kthreads.c      | 12 ++++++++----
 drivers/media/pci/bt8xx/bttv-cards.c      |  6 ++++--
 drivers/media/pci/saa7134/saa7134-video.c |  7 +++++--
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/msp3400-kthreads.c b/drivers/media/i2c/msp3400-kthreads.c
index d3b0d1c18efd..ac8752c63266 100644
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
diff --git a/drivers/media/pci/bt8xx/bttv-cards.c b/drivers/media/pci/bt8xx/bttv-cards.c
index 16148802dabb..ca20b806e82d 100644
--- a/drivers/media/pci/bt8xx/bttv-cards.c
+++ b/drivers/media/pci/bt8xx/bttv-cards.c
@@ -3934,8 +3934,10 @@ static void osprey_eeprom(struct bttv *btv, const u8 ee[256])
 			if (checksum != ee[21])
 				return;
 			cardid = BTTV_BOARD_OSPREY1x0_848;
-			for (i = 12; i < 21; i++)
-				serial *= 10, serial += ee[i] - '0';
+			for (i = 12; i < 21; i++) {
+				serial *= 10;
+				serial += ee[i] - '0';
+			}
 		}
 	} else {
 		unsigned short type;
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index a8ac94fadc14..f673cda57f30 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -868,8 +868,11 @@ static int buffer_activate(struct saa7134_dev *dev,
 		lines_uv = dev->height >> dev->fmt->vshift;
 		base2    = base + bpl * dev->height;
 		base3    = base2 + bpl_uv * lines_uv;
-		if (dev->fmt->uvswap)
-			tmp = base2, base2 = base3, base3 = tmp;
+		if (dev->fmt->uvswap) {
+			tmp = base2;
+			base2 = base3;
+			base3 = tmp;
+		}
 		video_dbg("uv: bpl=%ld lines=%ld base2/3=%ld/%ld\n",
 			bpl_uv,lines_uv,base2,base3);
 		if (V4L2_FIELD_HAS_BOTH(dev->field)) {
-- 
2.26.0

