Return-Path: <linux-media+bounces-40034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11854B29256
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 10:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F812208535
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 08:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55032221DBA;
	Sun, 17 Aug 2025 08:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p924oozQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E709B212B0A
	for <linux-media@vger.kernel.org>; Sun, 17 Aug 2025 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755420521; cv=none; b=K9et/wwGeBLIYI1JgTA/pXI9aCbozcI9VCUzVVQIocXWOfHBr2TEzRPKJf3y3snAx0TTwXuVGOcYESfZebQKfZ60QwUFeXeXghDBlTcYliNjHaGwfA4XJ6HIN41VyYSwzmodgBAOCkQ8PO8hr7o+ZGhrHUtUxnd4IcbEe+xeFMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755420521; c=relaxed/simple;
	bh=C19dFe425N3sGthJuclaFaN06VJyYYm5nphRa1kdApw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V/1UeGaV8rHDhb8rQmizszDNVghcwg85SPIzpKrd+jUsYGeqZ1REgnbWpjVu5yH0pwcTAAJJZ9GJUUUz1ld9RwzYXqFCmPbYDzIBCS/Dr1trR0wpQxq4HuvVyft6+ZbdPITMaF6gjgeuoLzErYzNFovrbscFK7vgt+vygQtTvQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p924oozQ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7a96309so33182266b.3
        for <linux-media@vger.kernel.org>; Sun, 17 Aug 2025 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755420516; x=1756025316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rsiGryixXWHbdmml+Vn1Ak7y47a24FKN5D1qESmO4rE=;
        b=p924oozQKg8Byv+AuZ8yV2WYGuuPPm3mdPlWrqXGivwSewcLajAu13looZmnfBtYkR
         CAK+OXA7nVAiqaR0tECH2IgEqWOvltKo4hL0pHt2b31OjljP4JeV3RWadiLpgPb55Tho
         BLNjdDHegqKE6sVHjCABoZe6LBPQy47CsJJ+xU7+wk3u+wXwfJ5s8MDdAmme6tiLW+GQ
         cSEqI3PjX5d4LtKDr+5VK+a3GCMfU3d3XL2zmoM3SYSgzDR7bYgl9MfK+sJCkI2r8CLg
         dbfBPrSVYxHlC4mPFIYdk3bVTFKDK52tNnmtJ3kf+qilfs6hkd1mym/H55yexjlJGi3v
         yYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755420516; x=1756025316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsiGryixXWHbdmml+Vn1Ak7y47a24FKN5D1qESmO4rE=;
        b=AFiSxQPsJFTHwQmUXl9wUiqEnrzYdokR/Jyd5hiCylgNxDbbmotyyopSJlgs4JdL1U
         +CYcVzbvP11kQ6AKzFT9ReweDauHhimOFQdS7lrhgCPlgQtI1PveCTVTmFI33XhZbdZl
         FmbPvBxFNiV1vNlkcYB/q+gcQnVmD7r5le1wixkyiLTNJ/9RgKqnkFzUBSInd0rFEeUG
         +UG85mM7xJQe46a30xxLmzs8qnZpgvhGRPXIl1XZFU9rQf9lw/OmP3SgYibXeReT/nVk
         1rFPSfXBIDOzbhAyh1Mo1ebN9jJbUIyQnCtpyz0yKVCPrPCODY/TYGaUiNkmRDZvGN9g
         n8eg==
X-Forwarded-Encrypted: i=1; AJvYcCX/giOo1GF930aoYSOxLoQcukOdOKBlTqp/zcPN3ugoVkgvLjvGIoJWA4RF1LJEihKC51meQlq5FxdSBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytOsImtsezUPo7D+ZIe12sJ9U37AdkwsC19D+BvReM7P9iB9rk
	8Gr7xJhSVmVcD74Sz35acvdA6vg2MXcsw6J5Pxx0nxFWtoJXsGuSdPlhSkiBX9yZEJs=
X-Gm-Gg: ASbGnctRaspJ2ETnmPSpaT7ipJjdbgou216RzyCC1WJA8G0YsikTFMIRdSA4VJHVvbk
	44k6/qK1LZoeth55CCPK45/223AxSbyhlNhJMmFVVQW1eTRwUJtJJQQy7f4nunp7R9m8smE83GI
	eA190n05ovfXqySj5X5ZrxwzbtUn5cPtzI+RuUrpXBn6qR9oNq6GA8r2KFKw4qpIHaydxK5Tr2v
	oQZcUKp/hRQ/amAAoe2cYFsnggtEb7U/duw+1UZN7WzO2MvYx43kbR3wH+r4R0fgbhgdSRhb2Xy
	ncRk74oIzRZ8rTQEdnronsHy+xTyHuccygUvE4bzQ6tOzmoyiOhVo0pBfNu9gO8WkpYkZNxKrwJ
	TvFBWvVFQ25W1shxwzYrq4Osot36W65Os0Q==
X-Google-Smtp-Source: AGHT+IFVIm/EdkddoC69liTgYAyVFqfNWBF1OiwgLFEI415M+VxSvQjl4s5b5NMgriYDaeuNoYuE3w==
X-Received: by 2002:a17:907:1c12:b0:ae3:c5b3:37fa with SMTP id a640c23a62f3a-afcdbe7ae89mr352407066b.1.1755420516199;
        Sun, 17 Aug 2025 01:48:36 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfcb2bbsm556869166b.77.2025.08.17.01.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 01:48:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Leon Luo <leonl@leopardimaging.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: i2c: imx: Add note to prevent buggy code re-use
Date: Sun, 17 Aug 2025 10:48:25 +0200
Message-ID: <20250817084824.31117-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=C19dFe425N3sGthJuclaFaN06VJyYYm5nphRa1kdApw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBooZdYJZC4ruittkd5WoUdoy+AE5pgPlKyB2Vfc
 1ud7LkshleJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKGXWAAKCRDBN2bmhouD
 151fD/4zS+PfBf/INbbVJfR+nLjpqsA3lHWNA92UCsFn+RBh/90t/tD+SYFtaxBWpts7lYyqVbL
 RCsord/BDDdoBor9K8n/2TCGV0H4r3BgLSFlMIYGutnO7L8v62pTmI9uL5g23lBPG3cWFDdg8Ab
 EwiA9EOwlgJt8cZQhhRrpsPjoCTLLR9h5HkKFYtljrquFoPILNS9mhD1uCsZ5chewfHQLiS1V2P
 +T+hBK8W+XV44nmJYhxU7Jxh7Q8aA4uip5I7UEeEasKTALWxA1iYDQRpdHfCLZ9RYzpbz2vx9u+
 2rIv4VqZf1MnaJFMF6n1fZeMGPbVhB/E2wqWxDqcYiLGSffw9cAnYZ7qi69vOFr8y4+DrZfxa6M
 78zOKr68hLy1fz2sNAxdXsiSvREbXb3ot62iGIHCGZcy5VDwdU+tNd0gi93DnFZh5DW1Z1HU2oY
 kSfiK0OidZVclm8DbNv9JkiHI06XlN0W+oelDhmjHInN0dhMQkVJmD8YmnfBkEejWrXkI+riiob
 vZDq9D2ZnxUqefRNoJGrmZMhDE+G5+GJKO00eQN6z4SCHMEQ+RSVnPSf7c7WDGAT5K7K3siDxDO
 LM3qkqXhmZWLTVO9vawGWtHRhnCPUCXfo9BvDG+vK4pYfCMAafgQC9EaivrPd7ha+ew9K647BTA ovqaFMmTeqUu/6A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Multiple Sony IMX sensor drivers have mixed up logical and line level
for XCLR signal.  They call it a reset signal (it indeed behaves like
that), but drivers assert the reset to operate which is clearly
incorrect and relies on incorrect DTS.

People in discussions copy existing poor code and claim they can repeat
same mistake, so add a note to prevent that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/imx219.c | 4 ++++
 drivers/media/i2c/imx274.c | 2 ++
 drivers/media/i2c/imx334.c | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 3b4f68543342..9857929a3321 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1034,6 +1034,10 @@ static int imx219_power_on(struct device *dev)
 		goto reg_off;
 	}
 
+	/*
+	 * Note: Misinterpreation of reset assertion - do not re-use this code.
+	 * XCLR pin is using incorrect (for reset signal) logical level.
+	 */
 	gpiod_set_value_cansleep(imx219->reset_gpio, 1);
 	usleep_range(IMX219_XCLR_MIN_DELAY_US,
 		     IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index a2b824986027..385a3df74b66 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -826,6 +826,8 @@ static int imx274_start_stream(struct stimx274 *priv)
  * if rst = 0, keep it in reset;
  * if rst = 1, bring it out of reset.
  *
+ * Note: Misinterpreation of reset assertion - do not re-use this code.
+ * XCLR pin is using incorrect (for reset signal) logical level.
  */
 static void imx274_reset(struct stimx274 *priv, int rst)
 {
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 846b9928d4e8..72e020d1d335 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -1070,6 +1070,10 @@ static int imx334_power_on(struct device *dev)
 	struct imx334 *imx334 = to_imx334(sd);
 	int ret;
 
+	/*
+	 * Note: Misinterpreation of reset assertion - do not re-use this code.
+	 * XCLR pin is using incorrect (for reset signal) logical level.
+	 */
 	gpiod_set_value_cansleep(imx334->reset_gpio, 1);
 
 	ret = clk_prepare_enable(imx334->inclk);
-- 
2.48.1


