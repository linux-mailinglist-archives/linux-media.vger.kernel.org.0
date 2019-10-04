Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D56FCBB6F
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 15:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388406AbfJDNPe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 09:15:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45548 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388361AbfJDNPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 09:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9bitqBz+5TX4ryQCSRjGgjctXPtAQSlP4eKyDRq0TcU=; b=fI9vdZ8SJQwIjQjpitmI9em2K7
        1w5PMHKs82TPwETcAaVGG6P5vi6VLJSxDRN0mEL1R4rOhtaaucBjo2wiKiJTuox67u3JNz7oqpQiU
        sPmIemzzT/4wQP5rg3kMlh3YGpmqPXlLyS9viQQsCf9yY4I6Exr5UoE7pTlyhr1inpqxz818ry7Wr
        WeGHDFZ76ru7G3lcdi1zWAbHzX+/D6O2AptyJZlhYsbH6Np3Kw75WO7ydMdX8BsZZK4maKFNqr43e
        OsRPWLV7SDlmuYflemj56ZwXvBadOnbAKw3qOk8NQmVN1p7rUXonZURr+3um71jgqJlJXoAzc4Xys
        pVV2lzkA==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iGNQi-0007jC-II; Fri, 04 Oct 2019 13:15:32 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.2)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iGNQg-0002hs-7x; Fri, 04 Oct 2019 10:15:30 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        JP <jp@jpvw.nl>, Gonsolo <gonsolo@gmail.com>, crope@iki.fi,
        Sean Young <sean@mess.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] media: si2168: add support for not loading a firmware
Date:   Fri,  4 Oct 2019 10:15:23 -0300
Message-Id: <6901e775290445a93c39c11a4f544d6127452418.1570194906.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
References: <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some devices (Logilink VG0022A) don't work properly with the
standard firmware. Upgrading the firmware makes I2C transfers
to fail when talking to the tuner.

While we don't have a better alternative, add support to
disable the firmware load on such devices.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/dvb-frontends/si2168.c      | 5 +++++
 drivers/media/dvb-frontends/si2168.h      | 3 +++
 drivers/media/dvb-frontends/si2168_priv.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 14b93a7d3358..3a3cb7a7d45a 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -445,6 +445,9 @@ static int si2168_init(struct dvb_frontend *fe)
 	if (ret)
 		goto err;
 
+	if (dev->dont_load_firmware)
+		goto dont_load;
+
 	/* request the firmware, this will block and timeout */
 	ret = request_firmware(&fw, dev->firmware_name, &client->dev);
 	if (ret) {
@@ -504,6 +507,7 @@ static int si2168_init(struct dvb_frontend *fe)
 
 	release_firmware(fw);
 
+dont_load:
 	cmd_init(&cmd, "\x01\x01", 2, 1);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
@@ -749,6 +753,7 @@ static int si2168_probe(struct i2c_client *client,
 	dev->ts_clock_inv = config->ts_clock_inv;
 	dev->ts_clock_gapped = config->ts_clock_gapped;
 	dev->spectral_inversion = config->spectral_inversion;
+	dev->dont_load_firmware = config->dont_load_firmware;
 
 	dev_info(&client->dev, "Silicon Labs Si2168-%c%d%d successfully identified\n",
 		 dev->version >> 24 & 0xff, dev->version >> 16 & 0xff,
diff --git a/drivers/media/dvb-frontends/si2168.h b/drivers/media/dvb-frontends/si2168.h
index ecd21adf8950..5e5de4619c3b 100644
--- a/drivers/media/dvb-frontends/si2168.h
+++ b/drivers/media/dvb-frontends/si2168.h
@@ -28,6 +28,8 @@
  *	TS clock gapped
  * @spectral_inversion:
  *	Inverted spectrum
+ * @dont_load_firmware:
+ *	Instead of uploading a new firmware, use the existing one
  *
  * Note:
  *	The I2C address of this demod is 0x64.
@@ -46,6 +48,7 @@ struct si2168_config {
 	unsigned int ts_clock_inv:1;
 	unsigned int ts_clock_gapped:1;
 	unsigned int spectral_inversion:1;
+	unsigned int dont_load_firmware:1;
 };
 
 #endif
diff --git a/drivers/media/dvb-frontends/si2168_priv.h b/drivers/media/dvb-frontends/si2168_priv.h
index 18bea5222082..bdc1754da747 100644
--- a/drivers/media/dvb-frontends/si2168_priv.h
+++ b/drivers/media/dvb-frontends/si2168_priv.h
@@ -40,6 +40,7 @@ struct si2168_dev {
 	unsigned int ts_clock_inv:1;
 	unsigned int ts_clock_gapped:1;
 	unsigned int spectral_inversion:1;
+	unsigned int dont_load_firmware:1;
 };
 
 /* firmware command struct */
-- 
2.21.0

