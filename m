Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3446990BDD
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 03:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbfHQBMy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 21:12:54 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:49003 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfHQBMy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 21:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=d/1sSyOZpUbnJt3U8OZfKFT4ZJRLrSkvBk1gpXfkkro=; b=YIgumsxPiX4gnltJjhp1/VRhP2
        awO0B0aakX4SExEbyy4GnUc0IViZNpb6I6jeWwBqrq0Hm9ZhUTLUt2spR9aXczoIJwOzE9UB3MUfF
        C5Av1CIAiQc85eND1w0+zyL3jAYKBiFJdwD9OSTet/OQP1F1miGHRi8D/44NPytwsuhft+VSZsiQe
        g7qx4+4kJFmqYGK53CTuJ9/xbFq3bybHs91dAeZylZ0hCfoCX1dbYtbeosc/Vq47IqmBpKrraeE+w
        aGPVKraEMNRhrKHT/Epb/6iLnE6J/+QekpKtyy4e18W580Hw6yJdy4q5Ru21EOqvh0rNim1JHx5DQ
        VdTwUfow==;
Received: from dvbz8cyyyyyyyyyyyy5hy-3.rev.dnainternet.fi ([2001:14ba:8869:c100::64c] helo=localhost.lan)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1hynH1-0005cj-NI; Sat, 17 Aug 2019 04:12:51 +0300
From:   Antti Palosaari <crope@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     Antti Palosaari <crope@iki.fi>
Subject: [PATCH] msi2500: assign SPI bus number dynamically
Date:   Sat, 17 Aug 2019 04:12:10 +0300
Message-Id: <20190817011210.29765-1-crope@iki.fi>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:14ba:8869:c100::64c
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SPI bus number must be assigned dynamically for each device, otherwise it
will crash when multiple devices are plugged to system.

Cc: stable@vger.kernel.org
Reported-and-tested-by: syzbot+c60ddb60b685777d9d59@syzkaller.appspotmail.com
Signed-off-by: Antti Palosaari <crope@iki.fi>
---
 drivers/media/usb/msi2500/msi2500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 65be6f140fe8..1c60dfb647e5 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -1230,7 +1230,7 @@ static int msi2500_probe(struct usb_interface *intf,
 	}
 
 	dev->master = master;
-	master->bus_num = 0;
+	master->bus_num = -1;
 	master->num_chipselect = 1;
 	master->transfer_one_message = msi2500_transfer_one_message;
 	spi_master_set_devdata(master, dev);
-- 
2.21.0

