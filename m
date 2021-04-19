Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95F1364A7E
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241952AbhDSTYH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:24:07 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:48633 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241677AbhDSTXy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:23:54 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D300D60007;
        Mon, 19 Apr 2021 19:23:21 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 5/8] staging: media: atomisp: Refactor ia_css_stream_load()
Date:   Mon, 19 Apr 2021 15:25:59 -0400
Message-Id: <20210419192602.498815-6-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192602.498815-1-vrzh@vrzh.net>
References: <20210419192602.498815-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the support check to the beginning of the function.
Replace ENOTSUPP with a standard EOPNOTSUPP exit code.
Use goto instead of nesting blocks in the stream search loop.
Move variable assignment outside of the if statement.
Remove an unnecessary check.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 72 +++++++++++-----------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 87438b5948ba..71e8133abf04 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -9616,48 +9616,46 @@ ia_css_stream_get_info(const struct ia_css_stream *stream,
 int
 ia_css_stream_load(struct ia_css_stream *stream)
 {
-	if (!IS_ISP2401) {
-		int i;
-		int err;
+	int i, j, err;
 
-		assert(stream);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() enter,\n");
-		for (i = 0; i < MAX_ACTIVE_STREAMS; i++) {
-			if (my_css_save.stream_seeds[i].stream == stream) {
-				int j;
+	if (IS_ISP2401) {
+		/* TODO remove function - DEPRECATED */
+		(void)stream;
+		return -EOPNOTSUPP;
+	}
 
-				for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++) {
-					if ((err = ia_css_pipe_create(&my_css_save.stream_seeds[i].pipe_config[j],
-								    &my_css_save.stream_seeds[i].pipes[j])) != 0) {
-						if (j) {
-							int k;
+	assert(stream);
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() enter,\n");
+	for (i = 0; i < MAX_ACTIVE_STREAMS; i++)
+		if (my_css_save.stream_seeds[i].stream == stream)
+			goto found;
+	goto done;
+
+found:
+	for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++) {
+		err = ia_css_pipe_create(&my_css_save.stream_seeds[i].pipe_config[j],
+					 &my_css_save.stream_seeds[i].pipes[j]);
+		if (err) {
+			int k;
 
-							for (k = 0; k < j; k++)
-								ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[k]);
-						}
-						return err;
-					}
-				}
-				err = ia_css_stream_create(&my_css_save.stream_seeds[i].stream_config,
-							my_css_save.stream_seeds[i].num_pipes,
-							my_css_save.stream_seeds[i].pipes,
-							&my_css_save.stream_seeds[i].stream);
-				if (err) {
-					ia_css_stream_destroy(stream);
-					for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++)
-						ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[j]);
-					return err;
-				}
-				break;
-			}
+			for (k = 0; k < j; k++)
+				ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[k]);
+			return err;
 		}
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() exit,\n");
-		return 0;
-	} else {
-		/* TODO remove function - DEPRECATED */
-		(void)stream;
-		return -ENOTSUPP;
 	}
+	err = ia_css_stream_create(&my_css_save.stream_seeds[i].stream_config,
+				   my_css_save.stream_seeds[i].num_pipes,
+				   my_css_save.stream_seeds[i].pipes,
+				   &my_css_save.stream_seeds[i].stream);
+	if (err) {
+		ia_css_stream_destroy(stream);
+		for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++)
+			ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[j]);
+		return err;
+	}
+done:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() exit,\n");
+	return 0;
 }
 
 int
-- 
2.31.1

