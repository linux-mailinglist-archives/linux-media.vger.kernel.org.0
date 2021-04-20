Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A32E7365BB4
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 17:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbhDTPB7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 11:01:59 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:33945 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232930AbhDTPB5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 11:01:57 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 43D7F2000B;
        Tue, 20 Apr 2021 15:01:18 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCHv2 5/8] staging: media: atomisp: Refactor ia_css_stream_load()
Date:   Tue, 20 Apr 2021 11:03:56 -0400
Message-Id: <20210420150356.579395-1-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the support check to the beginning of the function.
Change the logic to avoid multiple nesting blocks.
Move variable assignment outside of the if statement.
Remove an unnecessary check.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 72 +++++++++++-----------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4d4f030e0fe0..bd96c4ab04d0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -9615,48 +9615,46 @@ ia_css_stream_get_info(const struct ia_css_stream *stream,
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
-
-				for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++) {
-					if ((err = ia_css_pipe_create(&my_css_save.stream_seeds[i].pipe_config[j],
-								    &my_css_save.stream_seeds[i].pipes[j])) != 0) {
-						if (j) {
-							int k;
-
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
-		}
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() exit,\n");
-		return 0;
-	} else {
+	if (IS_ISP2401) {
 		/* TODO remove function - DEPRECATED */
 		(void)stream;
 		return -ENOTSUPP;
 	}
+
+	assert(stream);
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() enter,\n");
+	for (i = 0; i < MAX_ACTIVE_STREAMS; i++) {
+		if (my_css_save.stream_seeds[i].stream != stream)
+			continue;
+
+		for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++) {
+			int k;
+
+			err = ia_css_pipe_create(&my_css_save.stream_seeds[i].pipe_config[j],
+						 &my_css_save.stream_seeds[i].pipes[j]);
+			if (!err)
+				continue;
+
+			for (k = 0; k < j; k++)
+				ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[k]);
+			return err;
+		}
+		err = ia_css_stream_create(&my_css_save.stream_seeds[i].stream_config,
+					   my_css_save.stream_seeds[i].num_pipes,
+					   my_css_save.stream_seeds[i].pipes,
+					   &my_css_save.stream_seeds[i].stream);
+		if (err) {
+			ia_css_stream_destroy(stream);
+			for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++)
+				ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[j]);
+			return err;
+		}
+	}
+
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() exit,\n");
+	return 0;
 }
 
 int
-- 
2.31.1

