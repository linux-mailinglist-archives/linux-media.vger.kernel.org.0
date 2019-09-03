Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEEA5A715E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 19:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730207AbfICRGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 13:06:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53947 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfICRGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 13:06:41 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i5CGN-0005kb-Az; Tue, 03 Sep 2019 17:06:39 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: cx231xx: remove redundant assignment to variable status
Date:   Tue,  3 Sep 2019 18:06:39 +0100
Message-Id: <20190903170639.13849-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable status is being initialized with a value that is never read
and is being re-assigned a later on. The assignment is redundant and
hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/cx231xx/cx231xx-avcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/usb/cx231xx/cx231xx-avcore.c
index d417b5fe4093..0974965e848f 100644
--- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
+++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
@@ -1240,7 +1240,7 @@ int cx231xx_init_ctrl_pin_status(struct cx231xx *dev)
 int cx231xx_set_agc_analog_digital_mux_select(struct cx231xx *dev,
 					      u8 analog_or_digital)
 {
-	int status = 0;
+	int status;
 
 	/* first set the direction to output */
 	status = cx231xx_set_gpio_direction(dev,
-- 
2.20.1

