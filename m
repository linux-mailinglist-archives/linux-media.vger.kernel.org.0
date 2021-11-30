Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D7E4630BC
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 11:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240737AbhK3KNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 05:13:24 -0500
Received: from gofer.mess.org ([88.97.38.141]:47419 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236183AbhK3KNV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 05:13:21 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DE912C645C; Tue, 30 Nov 2021 10:10:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1638267001; bh=t97AjmtuL2qqK7ccyjcUwSnwMJCgfw7kt+bsrE/s8uY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Bix4xWZfdyDX2Nk490kp2ikshuPUtRIqziZtchyx6pwz+tPMoj3xTNa7GCnmMSOwC
         Q3ncbpnadQiXgb2cntBgZnBo2hElMGjJpvcj8lUFoBk5RylxR/wEETR0XEDkTfFZeM
         BVPE8h0K0FpmoacBqLzSznRpcA2Ygqj1ylAgeOesf2FasL8b/J6h1mNwCvilvpYK9y
         h4UoxjWqGvRISQgAnxyF7AF6ZP2Sa2Yl5n7BhLopGw/kkRX3SXsWmhdA8qip5N0Ej5
         jEFmGlM2V8zSy2P9PjG44oqGzLnJDOvSUD3G/UpBWAe6nnaVeF/cp2xS8pMGqw+mEc
         x5u9wT4VVfsIQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: winbond-cir: no need for reset after resume
Date:   Tue, 30 Nov 2021 10:10:01 +0000
Message-Id: <f01a2484c432b380603551e632fbe1e28bc9b748.1638266939.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <7d4ef3b31c3fc45741154db622b71fd6d0f5f9e7.1638266939.git.sean@mess.org>
References: <7d4ef3b31c3fc45741154db622b71fd6d0f5f9e7.1638266939.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

An IR reset is only used when the IR hardware reports an error.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/winbond-cir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/rc/winbond-cir.c b/drivers/media/rc/winbond-cir.c
index aed23ca0fa6c..94efb035d21b 100644
--- a/drivers/media/rc/winbond-cir.c
+++ b/drivers/media/rc/winbond-cir.c
@@ -997,7 +997,6 @@ wbcir_resume(struct pnp_dev *device)
 	struct wbcir_data *data = pnp_get_drvdata(device);
 
 	wbcir_init_hw(data);
-	ir_raw_event_reset(data->dev);
 	enable_irq(data->irq);
 	led_classdev_resume(&data->led);
 
-- 
2.33.1

