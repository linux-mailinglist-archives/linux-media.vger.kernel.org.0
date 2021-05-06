Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9D13758E8
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 19:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236122AbhEFRIN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 13:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236042AbhEFRIN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 13:08:13 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B78C061574
        for <linux-media@vger.kernel.org>; Thu,  6 May 2021 10:07:14 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0C724C6393; Thu,  6 May 2021 18:07:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620320833; bh=vdFzh8vAVOnsaluLJNV2YoHkigl7CDiWTL7QiYDCScU=;
        h=From:To:Subject:Date:From;
        b=SqUeceglpQRlILCC+PzZDXCYVd8MeMj2v2vuZvplVSkspw5AydaaSAUGF4owozfks
         2jtXfl+1CVu1wxr14xqcTf6pHxmw0KUUbiQDx1ScJWLLB3UShFDiqaCkAcgW3mIadi
         iaqHw4WexCRRvQGrz1I0oskI/CN9VN4LQHlyaqYySIqIticWjs6IcVlnNSVGpI7F+r
         fa52svSkjeos5FmvYyntkdCjvUzsaSwKjR0DyimjT5/fWfCNeJSSlYqrDBpobA5vTw
         lCKT7sJ4YFDDuQZd6cgRjeRZ0uCVu5W6fk6hXUoeLS8r+7zlvOv5rJU7SFFrWOc18z
         KAKbNbp0KNHjQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-ctl: usb-uirt device reports carrier frequency for each pulse
Date:   Thu,  6 May 2021 18:07:12 +0100
Message-Id: <20210506170712.11732-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The carrier frequency is reported a number of times. So, rather than
printing the last carrier reported, calculate the mean.

Possibly it would be better to calculate the mode rather than the mean.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/ir-ctl.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 3c3bcca1..3270a5e7 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -1148,7 +1148,8 @@ int lirc_receive(struct arguments *args, int fd, unsigned features)
 
 	bool keep_reading = true;
 	bool leading_space = true;
-	unsigned carrier = 0;
+	unsigned long long total_carriers = 0;
+	unsigned int no_carriers = 0;
 
 	while (keep_reading) {
 		ssize_t ret = TEMP_FAILURE_RETRY(read(fd, buf, sizeof(buf)));
@@ -1201,10 +1202,13 @@ int lirc_receive(struct arguments *args, int fd, unsigned features)
 				switch (msg) {
 				case LIRC_MODE2_TIMEOUT:
 					fprintf(out, "-%u\n", val);
-					if (carrier)
-						fprintf(out, " # carrier %uHz, timeout %u\n", carrier, val);
+					if (no_carriers) {
+						// averge of all the carriers reported mean (do we want the mode?)
+						fprintf(out, " # carrier %lluHz, timeout %u\n", total_carriers / no_carriers, val);
+					}
 					leading_space = true;
-					carrier = 0;
+					no_carriers = 0;
+					total_carriers = 0;
 					break;
 				case LIRC_MODE2_PULSE:
 					fprintf(out, "+%u ", val);
@@ -1213,7 +1217,8 @@ int lirc_receive(struct arguments *args, int fd, unsigned features)
 					fprintf(out, "-%u ", val);
 					break;
 				case LIRC_MODE2_FREQUENCY:
-					carrier = val;
+					total_carriers += val;
+					no_carriers += 1;
 					break;
 				}
 			}
-- 
2.31.1

