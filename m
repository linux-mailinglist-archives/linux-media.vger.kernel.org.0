Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6272BC9C9E
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 12:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728919AbfJCKpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 06:45:47 -0400
Received: from gofer.mess.org ([88.97.38.141]:39061 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbfJCKpr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 06:45:47 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 04D53C6344; Thu,  3 Oct 2019 11:45:45 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-ctl: report timeout when it cannot be modified
Date:   Thu,  3 Oct 2019 11:45:45 +0100
Message-Id: <20191003104545.2509-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are many IR devices which cannot modify their timeout, but do
have a timeout which should be reported (e.g. mtk_cir).

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/ir-ctl/ir-ctl.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 8aead6e0..ef399808 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -966,13 +966,16 @@ static void lirc_features(struct arguments *args, int fd, unsigned features)
 			printf(_(" - Use wideband receiver\n"));
 		if (features & LIRC_CAN_MEASURE_CARRIER)
 			printf(_(" - Can measure carrier\n"));
+
+		// This ioctl is only supported from kernel 4.18 onwards
+		unsigned timeout;
+		int rc = ioctl(fd, LIRC_GET_REC_TIMEOUT, &timeout);
+		if (rc == 0)
+			printf(_(" - Receiving timeout %u microseconds\n"), timeout);
+
 		if (features & LIRC_CAN_SET_REC_TIMEOUT) {
-			unsigned min_timeout, max_timeout, timeout;
+			unsigned min_timeout, max_timeout;
 
-			// This ioctl is only supported from kernel 4.18 onwards
-			int rc = ioctl(fd, LIRC_GET_REC_TIMEOUT, &timeout);
-			if (rc == 0)
-				printf(_(" - Receiving timeout %u microseconds\n"), timeout);
 			rc = ioctl(fd, LIRC_GET_MIN_TIMEOUT, &min_timeout);
 			if (rc) {
 				fprintf(stderr, _("warning: %s: device supports setting receiving timeout but LIRC_GET_MIN_TIMEOUT returns: %m\n"), dev);
-- 
2.21.0

