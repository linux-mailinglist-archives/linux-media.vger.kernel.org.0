Return-Path: <linux-media+bounces-13809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B184B91046F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AE0F1F23E6B
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 12:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1642A1ACE7C;
	Thu, 20 Jun 2024 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d6Cc2p/i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0583C1AC789
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718887675; cv=none; b=fms8AagA0khkpQpIpYhBmCSicvuzW9a2hy5vXocqg5SqMy18aZRfp/sKAVBujpZFAbU3NWV5Gd0twwpR+yyH8yIShgySH3geahnWy6FHYRM/+40oIV6HqUiE49Kme9uFzF0PziAV0+FC/EX8kJTtU+aS7mVxUgdPWiZzNbCFf5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718887675; c=relaxed/simple;
	bh=dHPvVFMF9oE/Smq/fAVh/jP8Xok6qZTN+5FpM5SDwrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0m9zIwscHLhaMMQXfvBPPXqyL0w0ur3yWG02W83be/GBJsT195I2aAUkw/LngegDZprlHGEC+unu7ss+JWEIRqbYd3BhaGR7r4O1230AA1W19rZRCKJtY+Be8nr2ZgCpebXtWZ8PCFftyO3uEX/7R86MQ7WdWdGWoA58NjBtwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d6Cc2p/i; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec3b282fedso702091fa.3
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718887672; x=1719492472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0tdmBT53w5VNdz5QchETAoTh/+fSs3HRvsgOCGHU8w=;
        b=d6Cc2p/iP2FjdNIjRf/TnML0rpH1+uaIwDWdKYqTZVgK4F3Q8fqY1fChT2QoeUnACJ
         P73Vuwx5jeDBpZEUoxLTVEMmkv02/AmQwvNYY5Pv3r6n4p+H9LJ9EA4ryhT2vtRUMshU
         zZfsOnoezT8ZphsFnmrY7MBXSp/yeq44n/pfqgEGIWh2IPV31/le7JTp+6C2+024YpbD
         4xBa97a9BNbIFB+8jx0107buO2fsAlYOuLdWKasbm4Ij4V9EUN4AkHdPEs8CcAGa5jeX
         utM63aMLi5OHoe+Y5T1bUmCKgmLGsP9KTGdP2K/e4q2tv4aNMM1n9/MXxtXx7R3v7u8P
         j9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718887672; x=1719492472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0tdmBT53w5VNdz5QchETAoTh/+fSs3HRvsgOCGHU8w=;
        b=GVeJQsM7cn/miUivfyofaUaQHfExbQVONEOVw2QcKSOZAzNCGhycoUHxOAz/NQ4lqv
         LZUtFD7dyfvCReU8d/S7aH+iIXYYBMW7hSIdU4yImbYVw/3+wvefG31npkF+AX3lBmLg
         5D0Yr1230nXKeGHsrY/3ubiDVGUMAqAsL2x6ZOMSagtfwCUBg69Hf68TIlMOWvK8Sobt
         z/XTDvsPtEyKAKQusatvV/myBUhRh5tmXajUGnbDgw8n7kZOKlepf7JF85viIIyApEYM
         n92liKEixW3PEnDPwvSyImas0lxCWxi/84cV/Hz2z55dvBB2kn+xtJQQazW2Mj4fQXsh
         GGZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQJmHziIBJ8HbVROXFmQzod3d2L71cp3VOYbftlV8SYtiaH4Sb0bUNQCqv6hF9hSUW3rL+g5flHoAkGaWG/2w5lVQPeUhM004WIB8=
X-Gm-Message-State: AOJu0YwgLyePTYi6V9zk4XVjiSIjHkvZPSaEA8yy9hOxQhGyYy2q3t4W
	Bi4Zd+QhoxQE1ztSQtaTIBKC9J0XIykXOpIicgd9676wHuNzT4nqPMSjX+wNYSQ=
X-Google-Smtp-Source: AGHT+IEu3CNj3wxHw25qkYF3Hp7xRIet6vorYXgQz8TEQ32UIzaBUyMkVV7G19KsiyqkVCDvk17muA==
X-Received: by 2002:a2e:9b57:0:b0:2ec:40d1:fb4 with SMTP id 38308e7fff4ca-2ec40d11208mr20518151fa.1.1718887672367;
        Thu, 20 Jun 2024 05:47:52 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c17ba8sm22421411fa.72.2024.06.20.05.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 05:47:51 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] media: i2c: og01a1b: Add OF support to the image sensor driver
Date: Thu, 20 Jun 2024 15:47:44 +0300
Message-ID: <20240620124745.1265011-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620124745.1265011-1-vladimir.zapolskiy@linaro.org>
References: <20240620124745.1265011-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OmniVision  OG01A1B image sensor driver currently supports probing
only on ACPI platforms, the changes adds support of OF platforms to
the driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index bac9597faf68..9e756c1c47df 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -1057,10 +1057,17 @@ static const struct acpi_device_id og01a1b_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, og01a1b_acpi_ids);
 #endif
 
+static const struct of_device_id og01a1b_of_match[] = {
+	{ .compatible = "ovti,og01a1b" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, og01a1b_of_match);
+
 static struct i2c_driver og01a1b_i2c_driver = {
 	.driver = {
 		.name = "og01a1b",
 		.acpi_match_table = ACPI_PTR(og01a1b_acpi_ids),
+		.of_match_table = og01a1b_of_match,
 	},
 	.probe = og01a1b_probe,
 	.remove = og01a1b_remove,
-- 
2.45.2


