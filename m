Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0D219AE19
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 13:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388824AbfHWL2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 07:28:04 -0400
Received: from gofer.mess.org ([88.97.38.141]:52133 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388570AbfHWL2E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 07:28:04 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CEBEB61632; Fri, 23 Aug 2019 12:28:02 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Patrick Lerda <patrick9876@free.fr>
Subject: [PATCH] media: rc: increase rc-mm tolerance and add debug message
Date:   Fri, 23 Aug 2019 12:28:02 +0100
Message-Id: <20190823112802.18341-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Decoding often fails on e.g. redrat3 devices. The dev_dbg() helps
with debugging when decoding does fail.

Cc: Patrick Lerda <patrick9876@free.fr>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir-rcmm-decoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/ir-rcmm-decoder.c b/drivers/media/rc/ir-rcmm-decoder.c
index 64fb65a9a19f..028df5cb1828 100644
--- a/drivers/media/rc/ir-rcmm-decoder.c
+++ b/drivers/media/rc/ir-rcmm-decoder.c
@@ -79,7 +79,7 @@ static int ir_rcmm_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		if (!ev.pulse)
 			break;
 
-		if (!eq_margin(ev.duration, RCMM_PREFIX_PULSE, RCMM_UNIT / 2))
+		if (!eq_margin(ev.duration, RCMM_PREFIX_PULSE, RCMM_UNIT))
 			break;
 
 		data->state = STATE_LOW;
@@ -91,7 +91,7 @@ static int ir_rcmm_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		if (ev.pulse)
 			break;
 
-		if (!eq_margin(ev.duration, RCMM_PULSE_0, RCMM_UNIT / 2))
+		if (!eq_margin(ev.duration, RCMM_PULSE_0, RCMM_UNIT))
 			break;
 
 		data->state = STATE_BUMP;
@@ -164,6 +164,8 @@ static int ir_rcmm_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		break;
 	}
 
+	dev_dbg(&dev->dev, "RC-MM decode failed at count %d state %d (%uus %s)\n",
+		data->count, data->state, TO_US(ev.duration), TO_STR(ev.pulse));
 	data->state = STATE_INACTIVE;
 	return -EINVAL;
 }
-- 
2.21.0

