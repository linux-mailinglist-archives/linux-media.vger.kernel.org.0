Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676EF4451F6
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 12:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhKDLLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:11:20 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:49277 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbhKDLLT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 07:11:19 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 83ACFFF809;
        Thu,  4 Nov 2021 11:08:39 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] media: max9271: Ignore busy loop read errors
Date:   Thu,  4 Nov 2021 12:09:23 +0100
Message-Id: <20211104110924.248444-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211104110924.248444-1-jacopo+renesas@jmondi.org>
References: <20211104110924.248444-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Valid pixel clock detection is performed by spinning on a register read
which if repeated too frequently might fail. As the error is not fatal
ignore it instead of bailing out to continue spinning until the timeout
completion.

Also relax the time between bus transactions and slightly increase the
wait interval to mitigate the failure risk.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---

v1->v2:
- Do not continue but jump to a label to respect the sleep timout after a
  failed read

Niklas I kept your tag anyway, hope it's ok.

Thanks
   j

---
 drivers/media/i2c/max9271.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
index ff86c8c4ea61..aa4add473716 100644
--- a/drivers/media/i2c/max9271.c
+++ b/drivers/media/i2c/max9271.c
@@ -55,7 +55,7 @@ static int max9271_write(struct max9271_device *dev, u8 reg, u8 val)
 /*
  * max9271_pclk_detect() - Detect valid pixel clock from image sensor
  *
- * Wait up to 10ms for a valid pixel clock.
+ * Wait up to 15ms for a valid pixel clock.
  *
  * Returns 0 for success, < 0 for pixel clock not properly detected
  */
@@ -64,15 +64,16 @@ static int max9271_pclk_detect(struct max9271_device *dev)
 	unsigned int i;
 	int ret;

-	for (i = 0; i < 100; i++) {
+	for (i = 0; i < 10; i++) {
 		ret = max9271_read(dev, 0x15);
 		if (ret < 0)
-			return ret;
+			goto skip;

 		if (ret & MAX9271_PCLKDET)
 			return 0;

-		usleep_range(50, 100);
+skip:
+		usleep_range(1000, 1500);
 	}

 	dev_err(&dev->client->dev, "Unable to detect valid pixel clock\n");
--
2.33.1

