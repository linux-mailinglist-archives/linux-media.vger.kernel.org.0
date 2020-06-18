Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708C51FF2E6
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 15:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729995AbgFRNXK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 09:23:10 -0400
Received: from winnie.ispras.ru ([83.149.199.91]:27651 "EHLO smtp.ispras.ru"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729828AbgFRNXJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 09:23:09 -0400
X-Greylist: delayed 438 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Jun 2020 09:23:08 EDT
Received: from home.intra.ispras.ru (unknown [10.10.165.12])
        by smtp.ispras.ru (Postfix) with ESMTP id B71F8203BF;
        Thu, 18 Jun 2020 16:15:47 +0300 (MSK)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Evgeny Novikov <novikov@ispras.ru>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] media: rc: return proper error code on error handling path in init
Date:   Thu, 18 Jun 2020 16:15:38 +0300
Message-Id: <20200618131538.18257-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If lirc_dev_init() fails during module initialization, rc_core_init()
returns 0 denoting success. This can cause different issues during
further operation of the module. The patch fixes the return value of
rc_core_init() on the corresponding error handling path.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/media/rc/rc-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index d7064d664d52..7b53066d9d07 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -2052,7 +2052,7 @@ static int __init rc_core_init(void)
 	if (rc) {
 		pr_err("rc_core: unable to init lirc\n");
 		class_unregister(&rc_class);
-		return 0;
+		return rc;
 	}
 
 	led_trigger_register_simple("rc-feedback", &led_feedback);
-- 
2.16.4

