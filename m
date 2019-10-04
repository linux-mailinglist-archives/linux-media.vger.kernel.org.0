Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB2ECBB6D
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 15:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388376AbfJDNPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 09:15:33 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45540 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387952AbfJDNPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 09:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lseTzraBAp75Lo1Q8/p9aRzFrQm3YPsPcT62ELgzx3w=; b=U3ZRACpORziHbyR8hAzqUV+bpb
        NkSAJYAtYm5CGEOyeHQNJCooxYbr3ea5L2r5C22rFLK5f3Q10mVZiUcoNXK5rgtEXu5r08xA6LsWi
        xJYZpbtUHXvRY2mTDj74aFTzjrjWro2E4fNkH28h7nQyN9KsjgN2Ek2yUkN6VatlnxhIxx+82u4on
        9Q8nG2OkxsBvVjYLXMGiQh3UsUPGfDD2Nj5JslXlC26kPy1sj/ie1opxdpOFfFDvUUFediQQJaaJr
        6ij6ww6DwaLQ7b7DpxL4NfBfLo81/CeUh9I1pkaAUmH9vJVxJwc1TQBE4fWxP6OG1VBNPyTMDrLMU
        u3OdsF3Q==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iGNQi-0007jE-TU; Fri, 04 Oct 2019 13:15:32 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.2)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iGNQg-0002hp-6w; Fri, 04 Oct 2019 10:15:30 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        JP <jp@jpvw.nl>, Gonsolo <gonsolo@gmail.com>, crope@iki.fi,
        Sean Young <sean@mess.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] media: si2168: use bits instead of bool for flags
Date:   Fri,  4 Oct 2019 10:15:22 -0300
Message-Id: <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004090855.14e418ed@coco.lan>
References: <20191004090855.14e418ed@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using bool on struct is not recommended, as it wastes lots of
space. So, instead, let's use bits.

While here, convert the comments to kernel-doc format.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/dvb-frontends/si2168.h      | 47 +++++++++++++----------
 drivers/media/dvb-frontends/si2168_priv.h | 10 ++---
 2 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/media/dvb-frontends/si2168.h b/drivers/media/dvb-frontends/si2168.h
index 50dccb394efa..ecd21adf8950 100644
--- a/drivers/media/dvb-frontends/si2168.h
+++ b/drivers/media/dvb-frontends/si2168.h
@@ -9,38 +9,43 @@
 #define SI2168_H
 
 #include <linux/dvb/frontend.h>
-/*
- * I2C address
- * 0x64
+/**
+ * struct si2168_config - configuration parameters for si2168
+ *
+ * @fe:
+ *	frontend returned by driver
+ * @i2c_adapter:
+ *	tuner I2C adapter returned by driver
+ * @ts_mode:
+ *	Transport Stream mode. Can be:
+ *	- %SI2168_TS_PARALLEL
+ *	- %SI2168_TS_SERIAL
+ *	- %SI2168_TS_TRISTATE
+ *	- %SI2168_TS_CLK_MANUAL
+ * @ts_clock_inv:
+ *	TS clock inverted
+ * @ts_clock_gapped:
+ *	TS clock gapped
+ * @spectral_inversion:
+ *	Inverted spectrum
+ *
+ * Note:
+ *	The I2C address of this demod is 0x64.
  */
 struct si2168_config {
-	/*
-	 * frontend
-	 * returned by driver
-	 */
 	struct dvb_frontend **fe;
-
-	/*
-	 * tuner I2C adapter
-	 * returned by driver
-	 */
 	struct i2c_adapter **i2c_adapter;
 
-	/* TS mode */
 #define SI2168_TS_PARALLEL	0x06
 #define SI2168_TS_SERIAL	0x03
 #define SI2168_TS_TRISTATE	0x00
 #define SI2168_TS_CLK_MANUAL	0x20
 	u8 ts_mode;
 
-	/* TS clock inverted */
-	bool ts_clock_inv;
-
-	/* TS clock gapped */
-	bool ts_clock_gapped;
-
-	/* Inverted spectrum */
-	bool spectral_inversion;
+	/* Flags */
+	unsigned int ts_clock_inv:1;
+	unsigned int ts_clock_gapped:1;
+	unsigned int spectral_inversion:1;
 };
 
 #endif
diff --git a/drivers/media/dvb-frontends/si2168_priv.h b/drivers/media/dvb-frontends/si2168_priv.h
index 804d5b30c697..18bea5222082 100644
--- a/drivers/media/dvb-frontends/si2168_priv.h
+++ b/drivers/media/dvb-frontends/si2168_priv.h
@@ -34,12 +34,12 @@ struct si2168_dev {
 	unsigned int chip_id;
 	unsigned int version;
 	const char *firmware_name;
-	bool active;
-	bool warm;
 	u8 ts_mode;
-	bool ts_clock_inv;
-	bool ts_clock_gapped;
-	bool spectral_inversion;
+	unsigned int active:1;
+	unsigned int warm:1;
+	unsigned int ts_clock_inv:1;
+	unsigned int ts_clock_gapped:1;
+	unsigned int spectral_inversion:1;
 };
 
 /* firmware command struct */
-- 
2.21.0

