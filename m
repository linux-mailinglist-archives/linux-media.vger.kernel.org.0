Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2D13ABE8A
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 00:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhFQWKH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 18:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhFQWKG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 18:10:06 -0400
X-Greylist: delayed 314 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Jun 2021 15:07:58 PDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47ACC061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 15:07:58 -0700 (PDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 098B62B9;
        Thu, 17 Jun 2021 15:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1623967364;
        bh=FQzjrW5WNAOrVkJs/Hts+Ik3+Hqt7NokValuBbhexNw=;
        h=From:To:Cc:Subject:Date:From;
        b=F9Tcc6TKUxeEZshhBHAE4lTP1tdqkb4gjBU2K/1a+9NCGvuD0das9eNYChfQpq3Qu
         4/myI7/JUaErXS8bPiH3kt6RTx0Bl2ejRLMqUxZ+n9RbXyHRkeNxhxYjdypO1opJLT
         s1VuxP9adGTe1ztK7An+nQdgXLN1L3ZPDoKybD6M=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     Zev Weiss <zev@bewilderbeest.net>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [PATCH v3] media: aspeed-video: ignore interrupts that aren't enabled
Date:   Thu, 17 Jun 2021 17:02:29 -0500
Message-Id: <20210617220229.7352-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
garbage interrupts"), the ASpeed video engine sometimes asserts
interrupts that the driver hasn't enabled.  In addition to the
CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
patch, COMP_READY has also been observed.  Instead of playing
whack-a-mole with each one individually, we can instead just blanket
ignore everything we haven't explicitly enabled.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

Changes since v2 [1]:
 - minor commit message improvements

Changes since v1 [0]:
 - dropped error message
 - switched to a blanket-ignore approach as suggested by Ryan

[0] https://lore.kernel.org/linux-arm-kernel/20201215024542.18888-1-zev@bewilderbeest.net/
[1] https://lore.kernel.org/openbmc/20210506234048.3214-1-zev@bewilderbeest.net/

 drivers/media/platform/aspeed-video.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 7bb6babdcade..77611c296a25 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -563,6 +563,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	struct aspeed_video *video = arg;
 	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
 
+	/*
+	 * Hardware sometimes asserts interrupts that we haven't actually
+	 * enabled; ignore them if so.
+	 */
+	sts &= aspeed_video_read(video, VE_INTERRUPT_CTRL);
+
 	/*
 	 * Resolution changed or signal was lost; reset the engine and
 	 * re-initialize
@@ -629,16 +635,6 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 			aspeed_video_start_frame(video);
 	}
 
-	/*
-	 * CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even when these
-	 * are disabled in the VE_INTERRUPT_CTRL register so clear them to
-	 * prevent unnecessary interrupt calls.
-	 */
-	if (sts & VE_INTERRUPT_CAPTURE_COMPLETE)
-		sts &= ~VE_INTERRUPT_CAPTURE_COMPLETE;
-	if (sts & VE_INTERRUPT_FRAME_COMPLETE)
-		sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
-
 	return sts ? IRQ_NONE : IRQ_HANDLED;
 }
 
-- 
2.32.0

