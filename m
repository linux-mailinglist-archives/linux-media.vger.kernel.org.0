Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC5A307792
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 15:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhA1OAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 09:00:08 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:40844 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbhA1OAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 09:00:06 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l57pT-0000M7-UN; Thu, 28 Jan 2021 13:59:24 +0000
From:   Colin King <colin.king@canonical.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2][next] media: uvcvideo: Fix memory leak when gpiod_to_irq fails
Date:   Thu, 28 Jan 2021 13:59:23 +0000
Message-Id: <20210128135923.638480-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to gpiod_to_irq fails the error return
path does not kfree the recently allocated object 'unit'. Fix this
swapping the order of the irq call and the allocation of unit.

Thanks to Ricardo Ribalda for suggesting this fix.

Addresses-Coverity: ("Resource leak")
Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: swap order of gpiod_to_irq call and allocation of unit to simplify
    error cleanup.

---
 drivers/media/usb/uvc/uvc_driver.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1abc122a0977..f62e6cb66daf 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1534,10 +1534,6 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 	if (IS_ERR_OR_NULL(gpio_privacy))
 		return PTR_ERR_OR_ZERO(gpio_privacy);
 
-	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
-	if (!unit)
-		return -ENOMEM;
-
 	irq = gpiod_to_irq(gpio_privacy);
 	if (irq < 0) {
 		if (irq != EPROBE_DEFER)
@@ -1546,6 +1542,10 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 		return irq;
 	}
 
+	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
+	if (!unit)
+		return -ENOMEM;
+
 	unit->gpio.gpio_privacy = gpio_privacy;
 	unit->gpio.irq = irq;
 	unit->gpio.bControlSize = 1;
-- 
2.29.2

