Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411F63076D0
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 14:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbhA1NLu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 08:11:50 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:39718 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbhA1NLj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 08:11:39 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l574Y-00053e-CY; Thu, 28 Jan 2021 13:10:54 +0000
From:   Colin King <colin.king@canonical.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: uvcvideo: Fix memory leak when gpiod_to_irq fails
Date:   Thu, 28 Jan 2021 13:10:54 +0000
Message-Id: <20210128131054.637715-1-colin.king@canonical.com>
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
by kfree'ing it before returning.

Addresses-Coverity: ("Resource leak")
Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1abc122a0977..56f867790ef1 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1543,6 +1543,7 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 		if (irq != EPROBE_DEFER)
 			dev_err(&dev->udev->dev,
 				"No IRQ for privacy GPIO (%d)\n", irq);
+		kfree(unit);
 		return irq;
 	}
 
-- 
2.29.2

