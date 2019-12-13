Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1C411E499
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 14:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbfLMNaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 08:30:05 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55006 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727492AbfLMNaE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 08:30:04 -0500
Received: by mail-wm1-f67.google.com with SMTP id b19so2178356wmj.4
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2019 05:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VXzCIVNIyEIalSwrDVu1JlYLLJVG8LUdZccZXShpYsw=;
        b=nZ9BQpSuWb9dDeJykWlitqmovokkBjW/QjlPbblKCvaHm0mccziJSL6ajoVWDfotQt
         XnXJBWVcWNLc5JqFW+o9Tl23W+/w+x5W/n0yEqrgk6z0/klrDcJ9SfNGCgMevbuYx1lG
         PrEHbPePlNDmwl725H0hAvDzGoMTkkksqbQhhcoCR03XcDFG3miJ7j1meXOF47Dlzqj/
         PhoneeU8HryDHVuUxDu+S7zYoeFUXDwS9XIFegBzSCM1Iacw2SqzmaHN/hkDNLrrDDuR
         oN6lS4cBVlahfCWW3hMbLY9yQzsgKZp/9i5oJV08NN4dEaKFVgf18DKoGYD6cvDudgHb
         zQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VXzCIVNIyEIalSwrDVu1JlYLLJVG8LUdZccZXShpYsw=;
        b=ICHoIJKFrpNm78M2eJX6I5jpnn88PMglk5tbI9H8Gixsz/BhHbT3zY/CSi+i4LA7Ol
         BCGX0U9yp43FGfqntN6oroAFCpHUNlZFAO9wutjLQkbvzEDkOUIvdljF3ohOXVxShCM8
         j6Ww0nPP58qVBVSoj9C1bxUn5sj2lCNlgiUilLN0n7v0+xHg/CrjKvj49lN+LwYGoZy8
         od9CGogaTGJJYHX/cDL69LK1npPLEEsC42dEd3sGt8viCifqLs2DCttktOZNjpqG14yN
         Zix5OZfvIBNxeT54gswp1tWzyTMXrXHVNu77yItJc5iLwgiw4eb58IfAz78Ys84MZ9kA
         NfiA==
X-Gm-Message-State: APjAAAX+hpnh6qw697oi61wUOGpbYzF9nSflJe++lMcygvLSB7RCulMM
        Z6Sh8LwoQTGaqeFQNaStTxBKrw==
X-Google-Smtp-Source: APXvYqySye0Al7ofzrrLCFePLmE9J5EDhkpPFb1QMhV+Eca0/HHqNuayvmb667XyzUHwTfXeZTWmWA==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr13635797wmd.80.1576243802038;
        Fri, 13 Dec 2019 05:30:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
        by smtp.gmail.com with ESMTPSA id n3sm10540543wmc.27.2019.12.13.05.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:30:01 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: platform: meson-ao-cec-g12a: add wakeup support
Date:   Fri, 13 Dec 2019 14:29:56 +0100
Message-Id: <20191213132956.11074-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213132956.11074-1-glaroque@baylibre.com>
References: <20191213132956.11074-1-glaroque@baylibre.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

add register configuration to activate wakeup feature in bl301

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index 891533060d49..85850b974126 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -25,6 +25,7 @@
 #include <media/cec.h>
 #include <media/cec-notifier.h>
 #include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
 
 /* CEC Registers */
 
@@ -168,6 +169,18 @@
 
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
+
 struct meson_ao_cec_g12a_data {
 	/* Setup the internal CECB_CTRL2 register */
 	bool				ctrl2_setup;
@@ -177,6 +190,7 @@ struct meson_ao_cec_g12a_device {
 	struct platform_device		*pdev;
 	struct regmap			*regmap;
 	struct regmap			*regmap_cec;
+	struct regmap			*regmap_ao_sysctrl;
 	spinlock_t			cec_reg_lock;
 	struct cec_notifier		*notify;
 	struct cec_adapter		*adap;
@@ -518,6 +532,13 @@ meson_ao_cec_g12a_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
 					 BIT(logical_addr - 8));
 	}
 
+	if (ao_cec->regmap_ao_sysctrl)
+		ret |= regmap_update_bits(ao_cec->regmap_ao_sysctrl,
+					 CECB_LOG_ADDR_REG,
+					 CECB_LOG_ADDR_MASK,
+					 FIELD_PREP(CECB_LOG_ADDR_MASK,
+						    logical_addr));
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
@@ -685,6 +713,11 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
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

