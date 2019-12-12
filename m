Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A282511D055
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 15:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729180AbfLLO7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 09:59:33 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39892 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729143AbfLLO7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 09:59:32 -0500
Received: by mail-wm1-f68.google.com with SMTP id d5so2852016wmb.4
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2019 06:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wL1S1bgqlZTjVQetMFkk5eNUJ/UNdvXmJ2Kwf4J4AxE=;
        b=rdw2uwGBHujHLxO2VyLqw+p1RAJwg1bqLq7hEkKjaQKD3rskfaMQiUD91Ih87dEaAe
         WAg9407///dvCsf5zVZ1muxNJ0UAIyZAnR2s5zzwCss6z6nWBqEYQoFVuMydZg6p28dT
         TxQWqQeLGTBAzQUw4zxlXSaHvfwNXgSkjvba3egg28CqA8D9g+0rJmVKaSnkfn+JmJxO
         rHfXvzNyVmrSI6n5FUt7KHcBDOCh6sHr3/H+6fpbIMb5yjnEOXeWrACPlyoe3suFyGH4
         aGzkJttL4BZZ3jTuQpcds+iZF3UaIVKK9Chu1wro1nu2J5pfXJozLmGaoSYlW32ORDt6
         aCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wL1S1bgqlZTjVQetMFkk5eNUJ/UNdvXmJ2Kwf4J4AxE=;
        b=EcJ/fmoYoHvDw5/duRUkhI7lUx0tcX10Y9CHqDTwSErXU1o/ruN6LfSv2+3bJtI0xj
         7geqJuAaKaA8/aualcI3MtOqfJmE0AAL8RaVhPti7OMF3wb2yWV0bXVzUofnUYV2pWWD
         1M/ziLqAXjNgRhne/uWlxzWyTiRD7jt6Q4V1cLOi4NVc5jqOhNYeeoVf3fa/VBPc0LrM
         bn/xmdgANmrBBxvnYk0g0f5Y606y/z+za+8AcrT0URmu7VqpPYkUWXOjd54+Lw8664wv
         xnyusNgdedx2oR9OD+OdWNykWrBk47QyuiMsgS7mpyxGEVU3pnJB7njznbzcDuS2DV+F
         QGRQ==
X-Gm-Message-State: APjAAAXI93DL2llzE/GJxiLLr65m60EC/F9R0Xw7JfwqhTLSXY80Pjfm
        T+am2ulLRHiMyppn/AHn7WN2NA==
X-Google-Smtp-Source: APXvYqw+cVD/rdJCHti73dxy0wOlGDqwQNjwezLmwIy6Ao4DWzhFTD+ajeIK8+jSK/wySrgNk1ajCw==
X-Received: by 2002:a1c:20d6:: with SMTP id g205mr7227703wmg.38.1576162770429;
        Thu, 12 Dec 2019 06:59:30 -0800 (PST)
Received: from glaroque-ThinkPad-T480.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h8sm6670292wrx.63.2019.12.12.06.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 06:59:29 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: platform: meson-ao-cec-g12a: add wakeup support
Date:   Thu, 12 Dec 2019 15:59:25 +0100
Message-Id: <20191212145925.32123-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212145925.32123-1-glaroque@baylibre.com>
References: <20191212145925.32123-1-glaroque@baylibre.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

add register configuration to activate wakeup feature in bl301

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index 3b39e875292e..d441b5a62b0c 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -25,6 +25,7 @@
 #include <media/cec.h>
 #include <media/cec-notifier.h>
 #include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
 
 /* CEC Registers */
 
@@ -168,6 +169,19 @@
 
 #define CECB_WAKEUPCTRL		0x31
 
+#define CECB_FUNC_CFG_REG		0xA0
+#define CECB_FUNC_CFG_MASK		GENMASK(6, 0)
+#define CECB_FUNC_CFG_CEC_ON		0x01
+#define CECB_FUNC_CFG_OTP_ON		0x02
+#define CECB_FUNC_CFG_AUTO_STANDBY	0x04
+#define CECB_FUNC_CFG_AUTO_POWER_ON	0x08
+#define CECB_FUNC_CFG_ALL		0x2f
+#define CECB_FUNC_CFG_NONE		0x0
+
+#define CECB_LOG_ADDR_REG	0xA4
+#define CECB_LOG_ADDR_MASK	GENMASK(22, 16)
+#define CECB_LOG_ADDR_SHIFT	16
+
 struct meson_ao_cec_g12a_data {
 	/* Setup the internal CECB_CTRL2 register */
 	bool				ctrl2_setup;
@@ -177,6 +191,7 @@ struct meson_ao_cec_g12a_device {
 	struct platform_device		*pdev;
 	struct regmap			*regmap;
 	struct regmap			*regmap_cec;
+	struct regmap			*regmap_ao_sysctrl;
 	spinlock_t			cec_reg_lock;
 	struct cec_notifier		*notify;
 	struct cec_adapter		*adap;
@@ -518,6 +533,12 @@ meson_ao_cec_g12a_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
 					 BIT(logical_addr - 8));
 	}
 
+	if (ao_cec->regmap_ao_sysctrl)
+		ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
+					 CECB_LOG_ADDR_REG,
+					  CECB_FUNC_CFG_MASK,
+					  logical_addr << CECB_LOG_ADDR_SHIFT);
+
 	/* Always set Broadcast/Unregistered 15 address */
 	ret |= regmap_update_bits(ao_cec->regmap_cec, CECB_LADD_HIGH,
 				  BIT(CEC_LOG_ADDR_UNREGISTERED - 8),
@@ -618,6 +639,13 @@ static int meson_ao_cec_g12a_adap_enable(struct cec_adapter *adap, bool enable)
 		regmap_write(ao_cec->regmap_cec, CECB_CTRL2,
 			     FIELD_PREP(CECB_CTRL2_RISE_DEL_MAX, 2));
 
+	if (ao_cec->regmap_ao_sysctrl) {
+		regmap_update_bits(ao_cec->regmap_ao_sysctrl,
+				   CECB_FUNC_CFG_REG,
+				   CECB_FUNC_CFG_MASK,
+				   CECB_FUNC_CFG_ALL);
+	}
+
 	meson_ao_cec_g12a_irq_setup(ao_cec, true);
 
 	return 0;
@@ -692,6 +720,11 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 		goto out_probe_adapter;
 	}
 
+	ao_cec->regmap_ao_sysctrl = syscon_regmap_lookup_by_phandle
+		(pdev->dev.of_node, "amlogic,ao-sysctrl");
+	if (IS_ERR(ao_cec->regmap_ao_sysctrl))
+		dev_warn(&pdev->dev, "ao-sysctrl syscon regmap lookup failed.\n");
+
 	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_threaded_irq(&pdev->dev, irq,
 					meson_ao_cec_g12a_irq,
-- 
2.17.1

