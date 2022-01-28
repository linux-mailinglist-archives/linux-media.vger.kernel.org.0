Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67E149FCDD
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 16:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349573AbiA1Pc3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 10:32:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238375AbiA1Pc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 10:32:29 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DBAC061714
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 07:32:28 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5D02710008F; Fri, 28 Jan 2022 15:32:27 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-ctl: report ir overflow
Date:   Fri, 28 Jan 2022 15:32:27 +0000
Message-Id: <20220128153227.448827-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/ir-ctl.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 27c309f9..240a3752 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -1197,13 +1197,18 @@ int lirc_receive(struct arguments *args, int fd, unsigned features)
 				case LIRC_MODE2_FREQUENCY:
 					fprintf(out, "carrier %u\n", val);
 					break;
+				case LIRC_MODE2_OVERFLOW:
+					fprintf(out, "overflow\n");
+					leading_space = true;
+					break;
 				}
 			} else {
 				switch (msg) {
 				case LIRC_MODE2_TIMEOUT:
-					fprintf(out, "-%u\n", val);
 					if (carrier)
-						fprintf(out, " # carrier %uHz, timeout %u\n", carrier, val);
+						fprintf(out, "-%u # carrier %uHz\n", val, carrier);
+					else
+						fprintf(out, "-%u\n", val);
 					leading_space = true;
 					carrier = 0;
 					break;
@@ -1216,6 +1221,14 @@ int lirc_receive(struct arguments *args, int fd, unsigned features)
 				case LIRC_MODE2_FREQUENCY:
 					carrier = val;
 					break;
+				case LIRC_MODE2_OVERFLOW:
+					if (carrier)
+						fprintf(out, "# carrier %uHz, overflow\n", carrier);
+					else
+						fprintf(out, "# overflow\n");
+					leading_space = true;
+					carrier = 0;
+					break;
 				}
 			}
 
-- 
2.34.1

