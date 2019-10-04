Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8AACBB6B
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 15:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388366AbfJDNPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 09:15:33 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45546 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388358AbfJDNPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 09:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vfKotgCJnhAZ36w4guJpnfA4d4FLkxI47oFAykJhqGs=; b=HTWhq85MvmP+dmLs2mmzA/8x11
        mzlgsyu+JyUkBoVP5n5Is/jIG7nEssSfsI8LUIE/iFnsWExGkjonIQjcaG4LfGauQ1ZBDHuB9rcD/
        Z6zskObB4nehoag/aS16VNXWSz8aNSn8LnGn7p3uOeJTlZFMABNsrjEeQONCsEQSIxu7IUl9fiqEB
        hAIIjeIxjK7U39T+8cHBCr8N40ydXu3aiP1lK+ZyHWbZXSsVVHIUnCrWo4R9tIAEYLEYdA7ET20Jk
        Trg4jcDaWX907OfvsSQyBGAUXprw3C9RrlLoiYA/FdSKe1FlbZpHr8KaZ4p+xvgxfyRBMd6qGmv6K
        RCcM/Gig==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iGNQi-0007jD-M3; Fri, 04 Oct 2019 13:15:32 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.2)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iGNQg-0002i0-9W; Fri, 04 Oct 2019 10:15:30 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        JP <jp@jpvw.nl>, Gonsolo <gonsolo@gmail.com>, crope@iki.fi,
        Sean Young <sean@mess.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] media: af9035: add the formula used for the I2C speed
Date:   Fri,  4 Oct 2019 10:15:25 -0300
Message-Id: <01607a324c85754424b8b786ea01de0d8733702d.1570194906.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
References: <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A very old patch sent to the media ML used to contain the
I2C speed formula:

	https://lore.kernel.org/linux-media/1312539895.2763.33.camel@Jason-Linux/

When the ite9135 code was merged with af9035, the formula was
lost. As we might need to slow down the speed for some devices,
add the formula again.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/usb/dvb-usb-v2/af9035.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index e555483c3077..7632b00713a0 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -1197,6 +1197,15 @@ static int af9035_frontend_attach(struct dvb_usb_adapter *adap)
 	return ret;
 }
 
+/*
+ * The I2C speed register is calculated with:
+ *	I2C speed register = (1000000000 / (24.4 * 16 * I2C_speed))
+ *
+ * The default speed register for it930x is 7, with means a
+ * speed of ~366 kbps
+ */
+#define I2C_SPEED_366K 7
+
 static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 {
 	struct state *state = adap_to_priv(adap);
@@ -1208,13 +1217,13 @@ static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 
 	dev_dbg(&intf->dev, "adap->id=%d\n", adap->id);
 
-	/* I2C master bus 2 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
+	/* I2C master bus 2 clock speed 366k */
+	ret = af9035_wr_reg(d, 0x00f6a7, I2C_SPEED_366K);
 	if (ret < 0)
 		goto err;
 
-	/* I2C master bus 1,3 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f103, 0x07);
+	/* I2C master bus 1,3 clock speed 366k */
+	ret = af9035_wr_reg(d, 0x00f103, I2C_SPEED_366K);
 	if (ret < 0)
 		goto err;
 
-- 
2.21.0

