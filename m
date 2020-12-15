Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F122DA682
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 03:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgLOC5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 21:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgLOC4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 21:56:51 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0832DC0617A7;
        Mon, 14 Dec 2020 18:56:07 -0800 (PST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 4F01A806FC;
        Mon, 14 Dec 2020 18:46:02 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 4F01A806FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1608000363;
        bh=/VOZ9xkfSILAMzzqqgqchyt0cY3YfGcy6+HU/3zZoCw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IEF3oEChr4h/FkcJqRBZUnvzH0phnVPvxZbZe0W2uDP8sCG4v0mKKC7HAJKpNJYF2
         uSFR+5G1BbdgEx5kN2mYHmT7q+fHO3QT7kWgB1sAhxyznUNEIm/1oZ3teJObF3NotC
         DNGhnWEoyR0AnYiipJEKmUvHSZWqxa53IiC+4uqg=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc:     Zev Weiss <zev@bewilderbeest.net>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 3/3] aspeed-video: add COMP_READY to VE_SPURIOUS_IRQS
Date:   Mon, 14 Dec 2020 20:45:42 -0600
Message-Id: <20201215024542.18888-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215024542.18888-1-zev@bewilderbeest.net>
References: <20201215024542.18888-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This joins CAPTURE_COMPLETE and FRAME_COMPLETE in the set of interrupts
that have been seen asserted by the hardware even when disabled, leading
to the interrupt eventually getting disabled as described in commit
65d270acb2d662c3346793663ac3a759eb4491b8.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/media/platform/aspeed-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 218aae3be809..48c52bf91a1b 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -564,7 +564,8 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
  * register.
  */
 #define VE_SPURIOUS_IRQS \
-	(VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE)
+	(VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE \
+	 | VE_INTERRUPT_COMP_READY)
 
 static irqreturn_t aspeed_video_irq(int irq, void *arg)
 {
-- 
2.29.2

