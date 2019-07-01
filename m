Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B71B5B944
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 12:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbfGAKrx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 06:47:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34847 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727641AbfGAKrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 06:47:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id c27so5570080wrb.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cDNMs7vyeGU4ItBEGrxn4uIQX4icW4tE6CY0BwZzeYU=;
        b=F2tVnR2jB1XsZNfj2okEZqzs3xC3S6Oouj9gTyIXZeHtZkiw7Tr7BpMKwvWpEsrnEF
         9r0B+gGVGc/sGn7hHLtY8ANc5U1LcH+3Y1eCtdPqJfPltCwiMBEkgJ9G+OKTHAaZlJ48
         yma5ZbqOeVvZh0Eg0T9x+OQQhHnKlMoCgEkD9vYf9NMkRZI3nDx6/gIw2WceJc8G42Wg
         YIsplADMwrUIO7ccZkoaRCM8QfNQjENnDuZVZQNBHjTEE1TlicwLy/mShIMkXuMPsdgV
         Wc53lZRkmtAimiE45onkPUne/3lB73K3/Onicirxd0UcJgqg9IFAhnN9PEwJZzHlgdBH
         SXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cDNMs7vyeGU4ItBEGrxn4uIQX4icW4tE6CY0BwZzeYU=;
        b=nwyWWNpUxwgvQL3bsD3uUWI+POmwCl5rF1yVnLopq/O4rCe6AA6d0ayFYuJYUKbn72
         NoCrfptAbnpTSoaXpTyLPdAV31B5hSsP1DRfQQ2mxx22PyD/7myDnkZ1IrnrEuCDjgYT
         Tk3G9w6fA2sjNpK+k8cYv6jiAttk8hYmgEDVetR8wFY7l6RFEjMQNLL9y3583DkxLqfc
         sBrDHoOOH7M9mevklFxfhCFOkJ0EAttrLKadsrapzh1y3XO7sLUzt6gMIhXBFI47o1uF
         NK7qREGHaI0NlQabJWymFWnPtVn2EkFqp66Jv1eOdlucaDpJvIQv/g41zv4zvrjc23ki
         zP/Q==
X-Gm-Message-State: APjAAAUSJkTnVAdeiPh/Rps4bsKHMURW4KhZjH8eM06KYeXdqRB8B92J
        /V5+jakI5f0NOYvUSN+2dwa56A==
X-Google-Smtp-Source: APXvYqxpvZ+wXD54f65Y9xIdncQZjnJsorwD7241UA/QyH8HN4LyX5o51WdwgdOmqi81S5Pu3reXYQ==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr17922728wrt.111.1561978052849;
        Mon, 01 Jul 2019 03:47:32 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id d24sm11658802wra.43.2019.07.01.03.47.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 03:47:31 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-media@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC 08/11] media: platform: meson-ao-cec-g12a: add support for SM1
Date:   Mon,  1 Jul 2019 12:47:02 +0200
Message-Id: <20190701104705.18271-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701104705.18271-1-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the Amlogic SM1 SoC Family to the G12A AO-CECB
derivative.

It only adds a single init register.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 37 +++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index 3620a1e310f5..1c696a126ee8 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -121,6 +121,9 @@
 #define CECB_CTRL_TYPE_NEXT	2
 
 #define CECB_CTRL2		0x01
+
+#define CECB_CTRL2_RISE_DEL_MAX	GENMASK(4, 0)
+
 #define CECB_INTR_MASK		0x02
 #define CECB_LADD_LOW		0x05
 #define CECB_LADD_HIGH		0x06
@@ -165,6 +168,11 @@
 
 #define CECB_WAKEUPCTRL		0x31
 
+struct meson_ao_cec_g12a_data {
+	/* Setup the internal CECB_CTRL2 register */
+	bool				ctrl2_setup;
+};
+
 struct meson_ao_cec_g12a_device {
 	struct platform_device		*pdev;
 	struct regmap			*regmap;
@@ -175,6 +183,7 @@ struct meson_ao_cec_g12a_device {
 	struct cec_msg			rx_msg;
 	struct clk			*oscin;
 	struct clk			*core;
+	const struct meson_ao_cec_g12a_data *data;
 };
 
 static const struct regmap_config meson_ao_cec_g12a_regmap_conf = {
@@ -620,6 +629,10 @@ static int meson_ao_cec_g12a_adap_enable(struct cec_adapter *adap, bool enable)
 	regmap_update_bits(ao_cec->regmap, CECB_GEN_CNTL_REG,
 			   CECB_GEN_CNTL_RESET, 0);
 
+	if (ao_cec->data->ctrl2_setup)
+		regmap_write(ao_cec->regmap_cec, CECB_CTRL2,
+			     FIELD_PREP(CECB_CTRL2_RISE_DEL_MAX, 2));
+
 	meson_ao_cec_g12a_irq_setup(ao_cec, true);
 
 	return 0;
@@ -639,6 +652,7 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret, irq;
 
+
 	hdmi_dev = cec_notifier_parse_hdmi_phandle(&pdev->dev);
 	if (IS_ERR(hdmi_dev))
 		return PTR_ERR(hdmi_dev);
@@ -647,6 +661,12 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 	if (!ao_cec)
 		return -ENOMEM;
 
+	ao_cec->data = of_device_get_match_data(&pdev->dev);
+	if (!ao_cec->data) {
+		dev_err(&pdev->dev, "failed to get match data\n");
+		return -ENODEV;
+	}
+
 	spin_lock_init(&ao_cec->cec_reg_lock);
 	ao_cec->pdev = pdev;
 
@@ -757,8 +777,23 @@ static int meson_ao_cec_g12a_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct meson_ao_cec_g12a_data ao_cec_g12a_data = {
+	.ctrl2_setup = false,
+};
+
+static const struct meson_ao_cec_g12a_data ao_cec_sm1_data = {
+	.ctrl2_setup = true,
+};
+
 static const struct of_device_id meson_ao_cec_g12a_of_match[] = {
-	{ .compatible = "amlogic,meson-g12a-ao-cec", },
+	{
+		.compatible = "amlogic,meson-g12a-ao-cec",
+		.data = &ao_cec_g12a_data,
+	},
+	{
+		.compatible = "amlogic,meson-sm1-ao-cec",
+		.data = &ao_cec_sm1_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, meson_ao_cec_g12a_of_match);
-- 
2.21.0

