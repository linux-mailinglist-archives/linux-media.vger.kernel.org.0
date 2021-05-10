Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B761377F74
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 11:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhEJJhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 05:37:19 -0400
Received: from gofer.mess.org ([88.97.38.141]:44289 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230283AbhEJJhR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 05:37:17 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DF504C6393; Mon, 10 May 2021 10:36:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620639371; bh=THrw7H/915DbQOJdiEYIuB4sxe6QK1T5iPOKAuScnZ4=;
        h=From:To:Subject:Date:From;
        b=E1dZBGfmz9qdGq4VJJffjJMm3f0dEbLrCCZoOEkTktwozVfYjlepbnX3IxwQaxWnl
         QM5IdG0RwwMFRK9Qw8JwVkkMUxq6Up5f21LqQtAPZtKSwTtzvnEgHa5Rtyjfxr1trN
         yzt3JaGS0huLgiwn2Cz1g7uyfDvWY/sUiPM5Y7+Qz/AWyEsJinQukr2zsQe7wUo0vk
         iZu7pAdZ2OjX8QHuzQ71BOng4a3Nd+bZNFtyLI8RMig6+XC8GvmTcEI51Sao+UEGmD
         VRPVGuPzYEUiUWgMtNIQEM6K66uUJ+Z5sfqhYRgs02AM1YqkfktgDR0Rxy2xOl+fku
         L80cBz9bSSJ9w==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: redrat3: enabling carrier reports switches to wideband receiver
Date:   Mon, 10 May 2021 10:36:11 +0100
Message-Id: <20210510093611.31304-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to measure the carrier, the redrat3 needs to switch to the
short range wideband receiver. This is what s_learning_mode() or
the LIRC_SET_WIDEBAND_RECEIVER ioctl is for.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 2cf3377ec63a..04483afc446b 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -952,7 +952,7 @@ static struct rc_dev *redrat3_init_rc_dev(struct redrat3_dev *rr3)
 	rc->s_timeout = redrat3_set_timeout;
 	rc->tx_ir = redrat3_transmit_ir;
 	rc->s_tx_carrier = redrat3_set_tx_carrier;
-	rc->s_carrier_report = redrat3_wideband_receiver;
+	rc->s_learning_mode = redrat3_wideband_receiver;
 	rc->driver_name = DRIVER_NAME;
 	rc->rx_resolution = 2;
 	rc->map_name = RC_MAP_HAUPPAUGE;
-- 
2.31.1

