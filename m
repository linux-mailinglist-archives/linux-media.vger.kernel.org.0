Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4665B2E3155
	for <lists+linux-media@lfdr.de>; Sun, 27 Dec 2020 14:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgL0Npq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Dec 2020 08:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgL0Npq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Dec 2020 08:45:46 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A9CC061794;
        Sun, 27 Dec 2020 05:45:05 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 674FFC6372; Sun, 27 Dec 2020 13:45:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1609076702; bh=IFbNwIpjqVZ4lAVSqpc+MHu1Q8UpfRsW75fdQnh+uAo=;
        h=From:To:Cc:Subject:Date:From;
        b=ZohPaWNi73hVxO9WNyHP+jv4e0NfTBUUXFtEivRDkoNz40Twi1kUtbKrnzPsuR0IF
         NhG1tTQe31nGRimzHSwWahP+oro5IJ0mf4O3uMUkryZihJv+MXzrrIgO9OCI9dLeGU
         KVP0gQcH25S6gzWG9K/RGZnCZJ/r9vo8mOygtyLsHPWWDO4Y8gFWUYUvM98WXhpr2y
         t7FlihfMA4S6PvCbehZdXIDSl+66AAEUTFeNBt61zUUYLxDlmFS/7YEMTBxR6TxjZT
         mnKdZzBJB1hHxZx0g5QC7MATpg5KTN1E6Ylc/4eUKwTRp82F7vRLkDwrUHiVZfyF3v
         t+1CCX/YK8N+A==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Georgi Bakalski <georgi.bakalski@gmail.com>
Subject: [PATCH 1/2] media: ir_toy: add another IR Droid device
Date:   Sun, 27 Dec 2020 13:45:01 +0000
Message-Id: <20201227134502.4548-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This device is also supported.

Tested-by: Georgi Bakalski <georgi.bakalski@gmail.com>
Reported-by: Georgi Bakalski <georgi.bakalski@gmail.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir_toy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index e0242c9b6aeb..3e729a17b35f 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -491,6 +491,7 @@ static void irtoy_disconnect(struct usb_interface *intf)
 
 static const struct usb_device_id irtoy_table[] = {
 	{ USB_DEVICE_INTERFACE_CLASS(0x04d8, 0xfd08, USB_CLASS_CDC_DATA) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x04d8, 0xf58b, USB_CLASS_CDC_DATA) },
 	{ }
 };
 
-- 
2.29.2

