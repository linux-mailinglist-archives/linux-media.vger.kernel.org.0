Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B4043725F
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 08:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbhJVG6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 02:58:33 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:32051 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbhJVG6Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 02:58:24 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 19M6XG8p087038;
        Fri, 22 Oct 2021 14:33:16 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 22 Oct
 2021 14:55:23 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 7/7] media: aspeed: Extend debug message
Date:   Fri, 22 Oct 2021 14:55:39 +0800
Message-ID: <20211022065539.12392-8-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022065539.12392-1-jammy_huang@aspeedtech.com>
References: <20211022065539.12392-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 19M6XG8p087038
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

updated as below:

Capture:
  Mode                : Direct fetch
  VGA bpp mode        : 32
  Signal              : lock
  Width               : 1920
  Height              : 1080
  FRC                 : 0

Compression:
  Format              : JPEG
  Subsampling         : 444
  Quality             : 4
  HQ Mode             : N/A
  HQ Quality          : 0
  Mode                : N/A

Performance:
  Frame#              : 4
  Frame Duration(ms)  :
    Now               : 22
    Min               : 21
    Max               : 22
  FPS                 : 47

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 41 +++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 8e0c29551ffc..7b7a03d44af7 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -453,6 +453,9 @@ static const struct v4l2_dv_timings_cap aspeed_video_timings_cap = {
 	},
 };
 
+static const char * const compress_mode_str[] = {"DCT Only",
+	"DCT VQ mix 2-color", "DCT VQ mix 4-color"};
+
 static unsigned int debug;
 
 static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
@@ -1071,8 +1074,6 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 
 static void aspeed_video_update_regs(struct aspeed_video *video)
 {
-	static const char * const compress_mode_str[] = {"DCT Only",
-		"DCT VQ mix 2-color", "DCT VQ mix 4-color"};
 	u32 comp_ctrl =	FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
 		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
 		FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
@@ -1785,9 +1786,29 @@ static const struct vb2_ops aspeed_video_vb2_ops = {
 static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 {
 	struct aspeed_video *v = s->private;
+	u32 val08;
 
 	seq_puts(s, "\n");
 
+	val08 = aspeed_video_read(v, VE_CTRL);
+	seq_puts(s, "Capture:\n");
+	if (FIELD_GET(VE_CTRL_DIRECT_FETCH, val08)) {
+		seq_printf(s, "  %-20s:\tDirect fetch\n", "Mode");
+		seq_printf(s, "  %-20s:\t%s\n", "VGA bpp mode",
+			   FIELD_GET(VE_CTRL_INT_DE, val08) ? "16" : "32");
+	} else {
+		seq_printf(s, "  %-20s:\tSync\n", "Mode");
+		seq_printf(s, "  %-20s:\t%s\n", "Video source",
+			   FIELD_GET(VE_CTRL_SOURCE, val08) ?
+			   "external" : "internal");
+		seq_printf(s, "  %-20s:\t%s\n", "DE source",
+			   FIELD_GET(VE_CTRL_INT_DE, val08) ?
+			   "internal" : "external");
+		seq_printf(s, "  %-20s:\t%s\n", "Cursor overlay",
+			   FIELD_GET(VE_CTRL_AUTO_OR_CURSOR, val08) ?
+			   "Without" : "With");
+	}
+
 	seq_printf(s, "  %-20s:\t%s\n", "Signal",
 		   v->v4l2_input_status ? "Unlock" : "Lock");
 	seq_printf(s, "  %-20s:\t%d\n", "Width", v->pix_fmt.width);
@@ -1796,6 +1817,21 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 
 	seq_puts(s, "\n");
 
+	seq_puts(s, "Compression:\n");
+	seq_printf(s, "  %-20s:\t%s\n", "Format",
+		   v->partial_jpeg ? "Aspeed" : "JPEG");
+	seq_printf(s, "  %-20s:\t%s\n", "Subsampling",
+		   v->yuv420 ? "420" : "444");
+	seq_printf(s, "  %-20s:\t%d\n", "Quality", v->jpeg_quality);
+	seq_printf(s, "  %-20s:\t%s\n", "HQ Mode",
+		   v->partial_jpeg ? (v->hq_mode ? "on" : "off") : "N/A");
+	seq_printf(s, "  %-20s:\t%d\n", "HQ Quality", v->jpeg_hq_quality);
+	seq_printf(s, "  %-20s:\t%s\n", "Mode",
+		   v->partial_jpeg ? compress_mode_str[v->compression_mode]
+				   : "N/A");
+
+	seq_puts(s, "\n");
+
 	seq_puts(s, "Performance:\n");
 	seq_printf(s, "  %-20s:\t%d\n", "Frame#", v->sequence);
 	seq_printf(s, "  %-20s:\n", "Frame Duration(ms)");
@@ -1804,7 +1840,6 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 	seq_printf(s, "    %-18s:\t%d\n", "Max", v->perf.duration_max);
 	seq_printf(s, "  %-20s:\t%d\n", "FPS", 1000/(v->perf.totaltime/v->sequence));
 
-
 	return 0;
 }
 
-- 
2.25.1

