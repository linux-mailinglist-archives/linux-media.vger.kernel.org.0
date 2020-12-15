Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B1A2DA684
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 03:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgLOC5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 21:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgLOC4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 21:56:51 -0500
X-Greylist: delayed 606 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 14 Dec 2020 18:56:06 PST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFFEBC061793;
        Mon, 14 Dec 2020 18:56:06 -0800 (PST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5E5F4806FA;
        Mon, 14 Dec 2020 18:46:01 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 5E5F4806FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1608000362;
        bh=iD+Q0HRdZJ6dUnWWVt4Ox1KAVYD8O2LC2E8h+jcXdtk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TW8je8Fa6vSq7loNGgeQy6xxa+1RFxe9mTStlSgYxecdpopU6M/oBenuqVeNCjTBL
         dN4oNz/ty4nN4z8lzg5DqZObramnu8OyyUBJwryJFVsCbwEUnfrJhs/jW1dyz3OLGC
         BwXvYeQLr+dugo36VnguK1G800qStEl/rY3sKNC4=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc:     Zev Weiss <zev@bewilderbeest.net>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 2/3] aspeed-video: clear spurious interrupt bits unconditionally
Date:   Mon, 14 Dec 2020 20:45:41 -0600
Message-Id: <20201215024542.18888-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215024542.18888-1-zev@bewilderbeest.net>
References: <20201215024542.18888-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of testing and conditionally clearing them one by one, we can
instead just unconditionally clear them all at once.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/media/platform/aspeed-video.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index eb02043532e3..218aae3be809 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -558,6 +558,14 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
 	schedule_delayed_work(&video->res_work, delay);
 }
 
+/*
+ * Interrupts that we don't use but have to explicitly ignore because the
+ * hardware asserts them even when they're disabled in the VE_INTERRUPT_CTRL
+ * register.
+ */
+#define VE_SPURIOUS_IRQS \
+	(VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE)
+
 static irqreturn_t aspeed_video_irq(int irq, void *arg)
 {
 	struct aspeed_video *video = arg;
@@ -630,15 +638,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
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
+	/* Squash known bogus interrupts */
+	sts &= ~VE_SPURIOUS_IRQS;
 
 	if (sts)
 		dev_err_ratelimited(video->dev, "unexpected interrupt asserted:"
-- 
2.29.2

