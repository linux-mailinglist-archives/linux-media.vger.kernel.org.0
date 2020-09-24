Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409D227707B
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 14:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbgIXMAT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 08:00:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:53220 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727437AbgIXMAT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 08:00:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600948818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7YAo6nKT6+itwlQyBkZk599IkJ9DvBCbffApv9QwI80=;
        b=A5d1oFXmn7eUTKcg2Pz7XPXCr5u6/5JnDhEOGKEuvnO4iJ3PLgCzGRWBWo4OpWZdvoOMSz
        vC9POWgIG9yYMFjbiPrap4TJCaRJLLko2/JF4vGgO001H/jTQ5/Q0QEYCPoDVzpAWmj/S4
        KiwTvA+sCXFvicDO0s66IYbes20bm1A=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 16AF8AEC8;
        Thu, 24 Sep 2020 12:00:18 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     mchehab@kernel.org, sean@mess.org, linux-media@vger.kernel.org,
        yangyingliang@huawei.com
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] flexcop-usb: sanity checking of endpoint type
Date:   Thu, 24 Sep 2020 13:37:40 +0200
Message-Id: <20200924113740.23319-1-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make sure the endpoint is ISOC in and do not hard code USB_DIR_IN.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 2 ++
 drivers/media/usb/b2c2/flexcop-usb.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index e3234d169065..e4da32771379 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -513,6 +513,8 @@ static int flexcop_usb_init(struct flexcop_usb *fc_usb)
 
 	if (fc_usb->uintf->cur_altsetting->desc.bNumEndpoints < 1)
 		return -ENODEV;
+	if (!usb_endpoint_is_isoc_in(&fc_usb->uintf->cur_altsetting->endpoint[1].desc))
+		return -ENODEV;
 
 	switch (fc_usb->udev->speed) {
 	case USB_SPEED_LOW:
diff --git a/drivers/media/usb/b2c2/flexcop-usb.h b/drivers/media/usb/b2c2/flexcop-usb.h
index e86faa0e06ca..2f230bf72252 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.h
+++ b/drivers/media/usb/b2c2/flexcop-usb.h
@@ -15,7 +15,7 @@
 
 #define B2C2_USB_CTRL_PIPE_IN usb_rcvctrlpipe(fc_usb->udev, 0)
 #define B2C2_USB_CTRL_PIPE_OUT usb_sndctrlpipe(fc_usb->udev, 0)
-#define B2C2_USB_DATA_PIPE usb_rcvisocpipe(fc_usb->udev, 0x81)
+#define B2C2_USB_DATA_PIPE usb_rcvisocpipe(fc_usb->udev, 1)
 
 struct flexcop_usb {
 	struct usb_device *udev;
-- 
2.26.2

