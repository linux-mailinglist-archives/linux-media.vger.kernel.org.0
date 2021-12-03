Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBAEA46745B
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 10:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379678AbhLCKAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 05:00:18 -0500
Received: from gofer.mess.org ([88.97.38.141]:52791 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232991AbhLCKAR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Dec 2021 05:00:17 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0A6FCC63C4; Fri,  3 Dec 2021 09:56:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1638525413; bh=gwXjin5Uz7+r4Wfd4cvn/WqBekBYapj3rSZ+QKsY22A=;
        h=From:To:Subject:Date:From;
        b=GQ63VHCbnBBdIH895fxObOXSKL2eSClZJQYaC49y7UQwsBJo/DCri4RuaJal8DIHj
         7EqwOo6tDp6wAygwe/kbs8Z378S8tcaD6Yjhdk5+xL7NC0SlHkkSk4P7r50wRA5+rn
         7BFpQ/huG3KiEarrd/IPYK4oBgpNqZORkRXbgyjXNx6PUHaI6tk8kueddUmUblGUPQ
         kOw4P9+TsjVxPwBsD4rr1NjcwtnO+Qn6qwRxUWJUtjmU2gM5enofeJYcfyokWKPmaa
         eTKthZlvsC34v0I3wwMajbltM42KU4vKWEF+nVdk7p2E8vwupXOEx5mJGaLj0YLITd
         sBEUQEUkEEE3Q==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: igorplugusb: receiver overflow should be reported
Date:   Fri,  3 Dec 2021 09:56:52 +0000
Message-Id: <20211203095652.31325-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Without this, some IR will be missing mid-stream and we might decode
something which never really occurred.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/igorplugusb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index effaa5751d6c..3e9988ee785f 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -64,9 +64,11 @@ static void igorplugusb_irdata(struct igorplugusb *ir, unsigned len)
 	if (start >= len) {
 		dev_err(ir->dev, "receive overflow invalid: %u", overflow);
 	} else {
-		if (overflow > 0)
+		if (overflow > 0) {
 			dev_warn(ir->dev, "receive overflow, at least %u lost",
 								overflow);
+			ir_raw_event_reset(ir->rc);
+		}
 
 		do {
 			rawir.duration = ir->buf_in[i] * 85;
-- 
2.33.1

