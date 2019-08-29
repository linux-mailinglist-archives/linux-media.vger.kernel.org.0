Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74243A13F2
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 10:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbfH2IjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 04:39:08 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41352 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfH2IjI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 04:39:08 -0400
Received: by mail-pf1-f195.google.com with SMTP id 196so1572744pfz.8
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0np3pNaGM9F636Uk9PvQlUNBrkizTVpSWtHNoilTc2M=;
        b=qLM37mh1wTkxgwBvBBhVky2EM5BfHCd2oAlj6WPU+0caLOG3o1ufxpwkUHakBbPzyy
         bEJxayLzLh0xyDuJbQ3eqsM1Pxa4dD1FtCJMAEeJp2bM7ufZk3MjttUQNwRMpGR67aqS
         f8I0KtmQWpTY/7xeD4dOK5k3PJ4/xSks79sis6tS/cl9DNn6vTOdzHJRAZ1dt7zwNqbQ
         oRNnad773Gt2a0IGdPUAr9AW6WLELRqKkg9IVF7hk+VK9nEguUzy6c9f6IVgQ7AVZ/Us
         GfUGkTTsESh1dtAfvmYQ3BN6DWfPpzLEBnvdckn0CUyO5jrs9S+x0zI/ClZKPiDG46RF
         nCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0np3pNaGM9F636Uk9PvQlUNBrkizTVpSWtHNoilTc2M=;
        b=NzaAGkVLV/KzNT7gjFhJyQ7aOhE3J0kq19m5haWqRBn5PWC7vkyiKSAtHS214xgXkI
         orYvhKGO3qf5MP0NGlKzGs0PGyc2BcaERcQ6avRcR0Njqh1xq0Ibh7+7gLHecXeiaKWo
         pc8Z501nrX6FMvrJXsGx/bIhvMU9xmZH2Wbp7XbcIdDmMNNmaKHrY+9BCsnGNJ16mpu4
         yrweeR9tVqSGdNsBRR8KKshHhfgMk+zrOy6sJmh0U+FOArUTJwg9vQ+5KOk7MDhH5DqZ
         JFrdGryGKra4OpXgqappRubbgihetb4scb+UEoGalr1vS5AMx0ikL+YAdB9eJ5nq3hpg
         oYGg==
X-Gm-Message-State: APjAAAXW8EWVCj4rzm7hCPXkZe70qI5XBuZhY+nmmYZN1kS1Chwdas8E
        /59MqnvltnTvvWp7Wy2tBbntUmB/
X-Google-Smtp-Source: APXvYqzvR/mQMmDpZwOP8up3kItXMC0Tya2D0uFL4C34G0o8z3r7Rg3VATSkub5FiqgHoayutbeS6A==
X-Received: by 2002:a63:b64:: with SMTP id a36mr7373431pgl.215.1567067947472;
        Thu, 29 Aug 2019 01:39:07 -0700 (PDT)
Received: from localhost.localdomain (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.googlemail.com with ESMTPSA id g10sm3498518pfb.95.2019.08.29.01.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 01:39:07 -0700 (PDT)
From:   tskd08@gmail.com
To:     linux-media@vger.kernel.org
Cc:     crope@iki.fi, sean@mess.org, mchehab@kernel.org,
        Akihiro Tsukada <tskd08@gmail.com>
Subject: [PATCH v2 3/4] dvb-frontends/tc90522: extend i2c algo to support some devices
Date:   Thu, 29 Aug 2019 17:38:21 +0900
Message-Id: <20190829083822.3670-4-tskd08@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190829083822.3670-1-tskd08@gmail.com>
References: <20190829083822.3670-1-tskd08@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Akihiro Tsukada <tskd08@gmail.com>

This demod implements an i2c adapter for attached tuner
and relays i2c messages from users (dvb adapters / bridge chips).
Some of them, such as Friio dvb card using gl861,
require each pair of i2c messages for one read to be issued as
two separate transactions.
This patch adds a configuration option to enable this split.

Signed-off-by: Akihiro Tsukada <tskd08@gmail.com>
---
 drivers/media/dvb-frontends/tc90522.c | 25 ++++++++++++++++++++++++-
 drivers/media/dvb-frontends/tc90522.h |  3 +++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tc90522.c b/drivers/media/dvb-frontends/tc90522.c
index 849d63dbc27..4c61b977466 100644
--- a/drivers/media/dvb-frontends/tc90522.c
+++ b/drivers/media/dvb-frontends/tc90522.c
@@ -687,8 +687,31 @@ tc90522_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 	if (i < num)
 		ret = -ENOMEM;
-	else
+	else if (!state->cfg.split_tuner_read_i2c || rd_num == 0)
 		ret = i2c_transfer(state->i2c_client->adapter, new_msgs, j);
+	else {
+		/*
+		 * Split transactions at each I2C_M_RD message.
+		 * Some of the parent device require this,
+		 * such as Friio (see. dvb-usb-gl861).
+		 */
+		int from, to;
+
+		ret = 0;
+		from = 0;
+		do {
+			int r;
+
+			to = from + 1;
+			while (to < j && !(new_msgs[to].flags & I2C_M_RD))
+				to++;
+			r = i2c_transfer(state->i2c_client->adapter,
+					 &new_msgs[from], to - from);
+			ret = (r <= 0) ? r : ret + r;
+			from = to;
+		} while (from < j && ret > 0);
+	}
+
 	if (ret >= 0 && ret < j)
 		ret = -EIO;
 	kfree(new_msgs);
diff --git a/drivers/media/dvb-frontends/tc90522.h b/drivers/media/dvb-frontends/tc90522.h
index ac0e2ab5192..07e3813bf59 100644
--- a/drivers/media/dvb-frontends/tc90522.h
+++ b/drivers/media/dvb-frontends/tc90522.h
@@ -28,6 +28,9 @@ struct tc90522_config {
 
 	/* [OUT] tuner I2C adapter returned by driver */
 	struct i2c_adapter *tuner_i2c;
+
+	/* [IN] use two separate I2C transactions for one tuner read */
+	bool split_tuner_read_i2c;
 };
 
 #endif /* TC90522_H */
-- 
2.23.0

