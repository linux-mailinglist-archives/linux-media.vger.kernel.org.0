Return-Path: <linux-media+bounces-36365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9932AEEAB2
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 01:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAE7C3E1214
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 23:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958DB2E6D1D;
	Mon, 30 Jun 2025 23:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcphTyqe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D11B2E718C;
	Mon, 30 Jun 2025 23:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324407; cv=none; b=idCkLYdZqMqsJ+e2bwPkXhAcYAeljfL+lw20octpuiMYcYQ53aaJ1iZ3u7XvMieZJ2RAuRDbnKHT/zs6e/WxrmD/QJxnCIAMX/OyXXTE4Ga1ilPuVKf9uEM7GgAUGQAJ+0h/55+FndaVP1boFlw0ZAwEVt+0LqUvAPUcLmhf0ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324407; c=relaxed/simple;
	bh=qsIidrhNfKGSVk7uQ8jDl0FBbzluCvDK3rJ3EfxQixY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJdhmDfRxFX7PEgFbYhiw1rxGvfDtmst/cz7U13ffL3iV6HX2DXnVTBvjJfYfugvTOdKavX3FucVUDK4C6aymTPwFSAT9E5yZhdbummjujt2nl8kW3DC7QoVyfddpFI5mkiRDe13qQ0T7WmvFv0kmWf1AaI6QjkKaqxlXQiS0C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcphTyqe; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d20451c016so155291485a.1;
        Mon, 30 Jun 2025 16:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324404; x=1751929204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08EjIcq2LEkTE1bSmA43WtkLhKmuoGBOobnc+exfdE4=;
        b=PcphTyqeQ7uTbU7wqemhBKbBccnYm8sQr6VZ4nZas6md32hFhMUyCalNDR1IiHmU8s
         VfDwAPjySmPprv21G2qWY5fmJHnQD4K5f7HXFkbY03oDbzfHzsJtd3qnPkkW0dDtPg1N
         /yAP8tJl8SawTBO8AS9Ea1mBn45UK2ZjZgTp1IKyxgutT86M7z7Uhasl/5DOBBEM2YMG
         fUAft5W5hlJsNYG7njG9jiymd/YxbRQOEoDoJ6WsbRfZycHR0EC79Gkwvvy+yYchoquj
         GQiLjILJxl0VrcRWyK8gOwyKQt9ziB2Zh7ASPaAwl8FXEfK9DKnnYObRDmbuNi0gs9rn
         rOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324404; x=1751929204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08EjIcq2LEkTE1bSmA43WtkLhKmuoGBOobnc+exfdE4=;
        b=aGfidDNSvJV6s52/9/R6gXgaLHUJr3SsYSCyqASXyle8+ZdveB/Sq5eCodquWUheCl
         33gfiTiTBufQR4mNT3hHg8z+cXU6WDKr8aoAj9no6ji1PSbhrMQgT/4mBB2nlTNJtN9l
         PoWL9rQEFERutZrCPVk441Ln7qhRs6imgMHVgzwFOIAE8f/LC+6KfHi87JszlMfY3s52
         uX33+r5u+3HD2e7KhaVOObo+ymwfKMiOWqJfvgd5jdi6wFP96G+7mP1chqsp3OXSZ6Qq
         NJ1s5NpCyH0MmdGquPP4xT5gmaxHr01EMOOfye5VUB25XEViRB5ghWXbUaRoScZffxF2
         09oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHqCgnD7SlJJZzb0L4lUH/pLZMJbmTXPMbvCighQhpGwHmxxokWODpHLO96tFL9WD7s3M6P8fIhU43nbc=@vger.kernel.org, AJvYcCVbV04tujt+epKiJJsnMZz0/pmIihY8ilGq6IN47zk7qeOG2tM/Gvkv8eE091ac7GM1jR/X1x8cvv4j@vger.kernel.org, AJvYcCXLFmfz5lkRw8NeLOO881sa8pZ2El8pKP055OyjuWH7VwdwMmpgisTkY/bxXHEfLvyCdxmjy/PIw2QKSRYNjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnP/Ucc+GO2gsBObks3e8hU9+89tOeJfoDA4TL1EcBBOFN/jUc
	G8Z46GYJ4L6lD08pZo9qQo+DbpSChjqn1WCpl9d0hHu00ycUjY3IZiGA
X-Gm-Gg: ASbGnct58LyC4L65lIQ+ZOj1BxsQtHHmM/cH6FRfzdsOm3VFjwgooAIzc8HkgL7iil8
	Zths+BcCJ+KYL+YlITDJuEVSHNgfTujbhJZYuoFTh0dU3V0JDT+6mHRxrtA+tfnQgv6YbAasT/Y
	TGwDh+egV4ZABGaWfM/956GmpUFSy3ieYhSLVFkHs2+9OR2DOand6oPueXaIQVU5syaVbkzSltp
	qum42HttycvjcHDVa5cjGn0MP9BM+O8V3ujWvHWmAMkUsRtYVY2dg6ryYkhk+rQnaOP3TYSbU86
	2ScJcDm2crLLhFbNFGlxhlKOAwBz1VTuZf8zpin8wC2FjenePQ==
X-Google-Smtp-Source: AGHT+IF1nJXKNkN6in6rmbJoeP1x8joPOObXsKBGV+zmcwU8cNSkvCUAR97Me9gPm7qCbpkYKk9CVQ==
X-Received: by 2002:a05:620a:1a83:b0:7d4:5b4b:530c with SMTP id af79cd13be357-7d45b4b542amr873678685a.35.1751324404133;
        Mon, 30 Jun 2025 16:00:04 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d443134584sm679582885a.18.2025.06.30.16.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:00:03 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/5] media: i2c: imx355: Support device tree probing and resource management
Date: Mon, 30 Jun 2025 18:59:47 -0400
Message-ID: <20250630225944.320755-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630225944.320755-7-mailingradian@gmail.com>
References: <20250630225944.320755-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A device tree compatible makes it possible for this driver to be used on
Open Firmware devices. Initialization of resources such as the reset
GPIO and voltage regulators can be specified in the device tree and
handled by the driver. Add support for this so the Pixel 3a can use the
driver.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 63 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b2dce67c0b6b..42bd08e8ac50 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -3,9 +3,14 @@
 
 #include <linux/unaligned.h>
 #include <linux/acpi.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -121,6 +126,16 @@ struct imx355 {
 	 * Protect access to sensor v4l2 controls.
 	 */
 	struct mutex mutex;
+
+	struct clk *mclk;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[3];
+};
+
+static const char * const imx355_supply_names[] = {
+	"vana",
+	"vdig",
+	"vio",
 };
 
 static const struct imx355_reg imx355_global_regs[] = {
@@ -1683,6 +1698,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 static int imx355_probe(struct i2c_client *client)
 {
 	struct imx355 *imx355;
+	size_t i;
 	int ret;
 
 	imx355 = devm_kzalloc(&client->dev, sizeof(*imx355), GFP_KERNEL);
@@ -1694,6 +1710,42 @@ static int imx355_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
 
+	for (i = 0; i < ARRAY_SIZE(imx355_supply_names); i++)
+		imx355->supplies[i].supply = imx355_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&client->dev,
+				      ARRAY_SIZE(imx355->supplies),
+				      imx355->supplies);
+	if (ret) {
+		dev_err_probe(&client->dev, ret, "could not get regulators");
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx355->supplies),
+				    imx355->supplies);
+	if (ret) {
+		dev_err(&client->dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	imx355->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(imx355->reset_gpio)) {
+		ret = PTR_ERR(imx355->reset_gpio);
+		dev_err_probe(&client->dev, ret, "failed to get gpios");
+		goto error_vreg_disable;
+	}
+
+	imx355->mclk = devm_clk_get(&client->dev, "mclk");
+	if (IS_ERR(imx355->mclk)) {
+		ret = PTR_ERR(imx355->mclk);
+		dev_err_probe(&client->dev, ret, "failed to get mclk");
+		goto error_vreg_disable;
+	}
+
+	clk_prepare_enable(imx355->mclk);
+	usleep_range(12000, 13000);
+
 	/* Check module identity */
 	ret = imx355_identify_module(imx355);
 	if (ret) {
@@ -1756,6 +1808,10 @@ static int imx355_probe(struct i2c_client *client)
 
 error_probe:
 	mutex_destroy(&imx355->mutex);
+	clk_disable_unprepare(imx355->mclk);
+
+error_vreg_disable:
+	regulator_bulk_disable(ARRAY_SIZE(imx355->supplies), imx355->supplies);
 
 	return ret;
 }
@@ -1781,10 +1837,17 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
 };
 MODULE_DEVICE_TABLE(acpi, imx355_acpi_ids);
 
+static const struct of_device_id imx355_match_table[] __maybe_unused = {
+	{ .compatible = "sony,imx355", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx355_match_table);
+
 static struct i2c_driver imx355_i2c_driver = {
 	.driver = {
 		.name = "imx355",
 		.acpi_match_table = ACPI_PTR(imx355_acpi_ids),
+		.of_match_table = of_match_ptr(imx355_match_table),
 	},
 	.probe = imx355_probe,
 	.remove = imx355_remove,
-- 
2.50.0


