Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2053988B17
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2019 13:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfHJLpA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Aug 2019 07:45:00 -0400
Received: from gofer.mess.org ([88.97.38.141]:36489 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbfHJLpA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Aug 2019 07:45:00 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9584F600AF; Sat, 10 Aug 2019 12:44:58 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: imon_raw: prevent "nonsensical timing event of duration 0"
Date:   Sat, 10 Aug 2019 12:44:57 +0100
Message-Id: <20190810114458.8883-2-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190810114458.8883-1-sean@mess.org>
References: <20190810114458.8883-1-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sometimes the device sends IR data which is all space, no pulses whatsoever.
Add the end of this the driver will put the rc device into idle mode when
it already is in idle mode. The following will be logged:

rc rc0: nonsensical timing event of duration 0
rc rc0: two consecutive events of type space

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/imon_raw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/imon_raw.c b/drivers/media/rc/imon_raw.c
index e6723993b466..d4aedcf76418 100644
--- a/drivers/media/rc/imon_raw.c
+++ b/drivers/media/rc/imon_raw.c
@@ -85,7 +85,7 @@ static void imon_ir_data(struct imon *imon)
 		offset = bit;
 	} while (offset > 0);
 
-	if (packet_no == 0x0a) {
+	if (packet_no == 0x0a && !imon->rcdev->idle) {
 		ir_raw_event_set_idle(imon->rcdev, true);
 		ir_raw_event_handle(imon->rcdev);
 	}
-- 
2.21.0

