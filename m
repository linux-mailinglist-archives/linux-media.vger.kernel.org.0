Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F69635C73
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 14:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbfFEMUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 08:20:21 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51854 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfFEMUU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 08:20:20 -0400
Received: by mail-wm1-f68.google.com with SMTP id f10so2045828wmb.1
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 05:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K9+itV6gvcKTvZTJ23CoapFRSjBat54J+JPGPwZJU6U=;
        b=Wv9vQQd/p4ldbEntOP3nTrl+uW+FK3tXRRFfsnrCBdcBVruZhghiJ1wE3wZp7W29kf
         a6UJqlNJ6ato4IK7kvkjGHdsw2U7wG2LrWHOk3V1cAhAqbsVU/CZEBJBvgQhh5XEqL34
         3D6cpSM8+xoea3UR0otiqorkpj98tvK3JGpqmPKGjUFKILoQ29UiZ3U3yXQYWdKy+heG
         hHxQFLw3fsAv1ksFtnS0AGx5RsEqcc2k5h9KrWoWBYi49azh9mHTj5HROPAhjYQ0fXQd
         mtx840tFC8T4PshbnCWFOjXqQYumgVL6o3PqfeBswZ/XJyQGK8ywutOaffA8zDIsS4Mr
         sgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K9+itV6gvcKTvZTJ23CoapFRSjBat54J+JPGPwZJU6U=;
        b=Uwd+oHPVmYq/Ds3N4pxRDr6qQT3cmVg2h1b392u1CJ8YN/AfQ/f4DuE3ZwNE64oOCf
         TNSdWwP6cBdnT7Rw5uYMn4j7EcSK282bQ/w6V9/++AcmveaC7nYIIDMRBsB42Cxayc8k
         BuSaHixf6qPxWJ90r089hEVlLbs0SkZRLMaf2hu3nMaW5xwA91Jru74EOA9BWEAkgnAy
         JxlGc7rcQGI8e1jAyrB/n/LVnnmEyLwm3oUc8sPlor4BLgwCuCkwfOx4a+CK53toEc0S
         jLXvWqSFFq1Si+TV2JmNwLUhwRVyFHFXPL40cZXzLESSnmAygmAjVoyPeYBuTjdlaxmn
         oJRQ==
X-Gm-Message-State: APjAAAXp7+3pzF8iTG2hg9mrWKAcXOZ/zPOqVf9k6jQrM6Xgqc5e/pjg
        oMwx+3tJLIJ18bqe1d8RHSq4eg==
X-Google-Smtp-Source: APXvYqysnXtOWluZlgLMwVxp2vvHbNt6n9UeEcG5RaOZ4Ta/Y3CrtREPbkT4dwZQZ7XIPfhGq4TOVA==
X-Received: by 2002:a1c:6242:: with SMTP id w63mr18921552wmb.161.1559737217689;
        Wed, 05 Jun 2019 05:20:17 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s63sm11521467wme.17.2019.06.05.05.20.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 05 Jun 2019 05:20:17 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-media@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: platform: ao-cec-g12a: remove spin_lock_irqsave() locking in meson_ao_cec_g12a_read/write
Date:   Wed,  5 Jun 2019 14:20:15 +0200
Message-Id: <20190605122015.11439-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since locking is handled by regmap, the spin_lock_irqsave() in the
meson_ao_cec_g12a_read/write() regmap callbacks is not needed.

Fixes: b7778c46683c ("media: platform: meson: Add Amlogic Meson G12A AO CEC Controller driver")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index ddfd060625da..fb52e5dd044a 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -365,28 +365,22 @@ static int meson_ao_cec_g12a_read(void *context, unsigned int addr,
 {
 	struct meson_ao_cec_g12a_device *ao_cec = context;
 	u32 reg = FIELD_PREP(CECB_RW_ADDR, addr);
-	unsigned long flags;
 	int ret = 0;
 
-	spin_lock_irqsave(&ao_cec->cec_reg_lock, flags);
-
 	ret = regmap_write(ao_cec->regmap, CECB_RW_REG, reg);
 	if (ret)
-		goto read_out;
+		return ret;
 
 	ret = regmap_read_poll_timeout(ao_cec->regmap, CECB_RW_REG, reg,
 				       !(reg & CECB_RW_BUS_BUSY),
 				       5, 1000);
 	if (ret)
-		goto read_out;
+		return ret;
 
 	ret = regmap_read(ao_cec->regmap, CECB_RW_REG, &reg);
 
 	*data = FIELD_GET(CECB_RW_RD_DATA, reg);
 
-read_out:
-	spin_unlock_irqrestore(&ao_cec->cec_reg_lock, flags);
-
 	return ret;
 }
 
@@ -394,19 +388,11 @@ static int meson_ao_cec_g12a_write(void *context, unsigned int addr,
 				   unsigned int data)
 {
 	struct meson_ao_cec_g12a_device *ao_cec = context;
-	unsigned long flags;
 	u32 reg = FIELD_PREP(CECB_RW_ADDR, addr) |
 		  FIELD_PREP(CECB_RW_WR_DATA, data) |
 		  CECB_RW_WRITE_EN;
-	int ret = 0;
 
-	spin_lock_irqsave(&ao_cec->cec_reg_lock, flags);
-
-	ret = regmap_write(ao_cec->regmap, CECB_RW_REG, reg);
-
-	spin_unlock_irqrestore(&ao_cec->cec_reg_lock, flags);
-
-	return ret;
+	return regmap_write(ao_cec->regmap, CECB_RW_REG, reg);
 }
 
 static const struct regmap_config meson_ao_cec_g12a_cec_regmap_conf = {
-- 
2.21.0

