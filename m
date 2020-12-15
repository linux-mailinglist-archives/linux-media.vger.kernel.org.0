Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8A72DA683
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 03:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgLOC5B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 21:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgLOC4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 21:56:51 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08F6C0617A6;
        Mon, 14 Dec 2020 18:56:06 -0800 (PST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6D3E5806F8;
        Mon, 14 Dec 2020 18:46:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 6D3E5806F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1608000361;
        bh=xR8CLmhYhW7l9AVRInyVC7PTJeDKCJBNFlHVTPgUQAg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PgdqqfbXNy4kDvfuNujcew/oE4ykMgotbUQZD640u/xW+xSgkjvUrhwSy2IFYIAw5
         n26ZJP8lr5i/iRccf0ndGIWxFaV62XCB2xKQ0La7ICWRgPBR+Z6MLlLSW8xuzXdBBR
         eB3gNUYRsk91y4I4wyVfGtIY7sjP7rVJIxJC2JIQ=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc:     Zev Weiss <zev@bewilderbeest.net>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 1/3] aspeed-video: add error message for unhandled interrupts
Date:   Mon, 14 Dec 2020 20:45:40 -0600
Message-Id: <20201215024542.18888-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215024542.18888-1-zev@bewilderbeest.net>
References: <20201215024542.18888-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This device seems to have a propensity for asserting interrupts that
aren't enabled -- in addition to the CAPTURE_COMPLETE and FRAME_COMPLETE
interrupts squashed in commit 65d270acb2d662c3346793663ac3a759eb4491b8,
COMP_READY has also been observed.  Adding a message diagnosing what
happened in the event of unhandled interrupt status bits should
hopefully make the debugging process simpler for any others that pop up
in the future.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/media/platform/aspeed-video.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 7d98db1d9b52..eb02043532e3 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -562,6 +562,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 {
 	struct aspeed_video *video = arg;
 	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
+	u32 orig_sts = sts;
 
 	/*
 	 * Resolution changed or signal was lost; reset the engine and
@@ -639,6 +640,10 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	if (sts & VE_INTERRUPT_FRAME_COMPLETE)
 		sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
 
+	if (sts)
+		dev_err_ratelimited(video->dev, "unexpected interrupt asserted:"
+				    " sts=%08x, orig_sts=%08x", sts, orig_sts);
+
 	return sts ? IRQ_NONE : IRQ_HANDLED;
 }
 
-- 
2.29.2

