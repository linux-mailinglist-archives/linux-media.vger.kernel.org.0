Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8A04C9EB5
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729170AbfJCMpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:45:47 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42288 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbfJCMpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:45:46 -0400
Received: by mail-wr1-f67.google.com with SMTP id n14so2736054wrw.9;
        Thu, 03 Oct 2019 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hm/3KLPMiFgYLhw0cNyU9JiizTQ6GNbshHm6KlyE1Ew=;
        b=Y2CNPgMhbSKh6xdzlYgVApEYlbJWcgbWywt9jI5epA1Pnex7HPauTZEb6KoabPovqw
         OWEVt21EQ2q/iNwi64ssy9o8N7MvcyFWUUHrsjtAwmE0MAWlfvOuXmYzv80K6b85EqS2
         7VS5Z8h6R6UuECf9uXyJ8XRo+rGkAAapGonoEViP/sZgJgkB0/Km2fu8aqX2o8p7UPlM
         i4+pPuqU73+rWacPG5zeiXH+ZMrdZMWb1/kMMQ9LNs2R8pjuRTwWPCDGIHxnCeYbE7ud
         uvwmAbywbd921yPKab5m6og+DXXRvmTawZ0e/6d7uG1E+wvwCpv5fviORaiQVrkha7tR
         ZvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hm/3KLPMiFgYLhw0cNyU9JiizTQ6GNbshHm6KlyE1Ew=;
        b=uglYywBs5x6wnXGmWw3hx7W6L+JJZwAsYBp5V8qOkyCtAxH99KmwT30b5Ou77eW00z
         Z9YNaags10JxhPgptUQlAvT190lOWMVQm1Kd6lzs7tate8j6ixTYZsGMZixwWZJdbJP9
         kwFl8vTocHJ9muAJF5aRuzXYN66NCVLHobxbvFyum1UquR1kzYQ5JeZpB6qyih/q/S5y
         722YiewznitHn2mUVxwfPJyPmmmydfgSvB0i2/RpgSfVtrLG6ePdYVsr5z8V/cmR4XaT
         2DxRNPkG/IfzSbPozsvPp9BRpfGDIiKZqEGDXvl/xhOgfzbEzZYoWgVct+jk0ZgA2F5j
         9JpQ==
X-Gm-Message-State: APjAAAXdPmYPGhl7NfkMSi+Tl3R1ijbMPMxbWqrr5U+WLz2uHcY3RKLV
        X5HpgWvOeTDSbhldAgpBLwU=
X-Google-Smtp-Source: APXvYqzv+O1eJ8dRkgQ6D+NIV3h7oe2bTquP92YlVVNkQaEFFLfDYdtLlqa2ewbA7Ba0tWb5nX4IkA==
X-Received: by 2002:adf:f689:: with SMTP id v9mr7544605wrp.82.1570106745008;
        Thu, 03 Oct 2019 05:45:45 -0700 (PDT)
Received: from localhost.localdomain ([46.114.33.103])
        by smtp.googlemail.com with ESMTPSA id y3sm12880507wmg.2.2019.10.03.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 05:45:44 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     sean@mess.org, crope@iki.fi, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gon Solo <gonsolo@gmail.com>
Subject: [PATCH 1/3] [PATCH] af9035: Better explain how i2c bus speed is computed.
Date:   Thu,  3 Oct 2019 14:45:30 +0200
Message-Id: <20191003124532.10945-2-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191003122027.GA2674@Limone>
References: <20191003122027.GA2674@Limone>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Original patch from Mauro Carvalho Chehab.

Signed-off-by: Gon Solo <gonsolo@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/af9035.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 3afd18733614..7828f8567da0 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -1197,6 +1197,9 @@ static int af9035_frontend_attach(struct dvb_usb_adapter *adap)
 	return ret;
 }
 
+/* I2C speed register = (1000000000 / (24.4 * 16 * I2C_speed)) */
+#define I2C_SPEED_REGISTER 7
+
 static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 {
 	struct state *state = adap_to_priv(adap);
@@ -1208,13 +1211,13 @@ static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 
 	dev_dbg(&intf->dev, "adap->id=%d\n", adap->id);
 
-	/* I2C master bus 2 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
+	/* I2C master bus 2 clock speed ~300k */
+	ret = af9035_wr_reg(d, 0x00f6a7, I2C_SPEED_REGISTER);
 	if (ret < 0)
 		goto err;
 
-	/* I2C master bus 1,3 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f103, 0x07);
+	/* I2C master bus 1,3 clock speed ~300k */
+	ret = af9035_wr_reg(d, 0x00f103, I2C_SPEED_REGISTER);
 	if (ret < 0)
 		goto err;
 
-- 
2.20.1

