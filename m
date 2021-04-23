Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52563696A5
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 18:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhDWQJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 12:09:57 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:34755 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhDWQJz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 12:09:55 -0400
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3D64020000A;
        Fri, 23 Apr 2021 16:09:13 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCHv3 5/8] staging: media: atomisp: Refactor ia_css_stream_load()
Date:   Fri, 23 Apr 2021 12:12:29 -0400
Message-Id: <20210423161229.244636-1-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the support check to the beginning of the function.
Change the logic to avoid multiple nesting blocks.
Move 'err' variable assignment outside of the if statement.
Remove an unnecessary check whether 'j' is zero.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 73 +++++++++++-----------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4d4f030e0fe0..e700246dc202 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -9615,48 +9615,47 @@ ia_css_stream_get_info(const struct ia_css_stream *stream,
 int
 ia_css_stream_load(struct ia_css_stream *stream)
 {
-	if (!IS_ISP2401) {
-		int i;
-		int err;
-
-		assert(stream);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() enter,\n");
-		for (i = 0; i < MAX_ACTIVE_STREAMS; i++) {
-			if (my_css_save.stream_seeds[i].stream == stream) {
-				int j;
+	int i, j, err;
 
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
+		if (!err)
+			break;
+
+		ia_css_stream_destroy(stream);
+		for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++)
+			ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[j]);
+		return err;
+	}
+
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() exit,\n");
+	return 0;
 }
 
 int
-- 
2.31.1

