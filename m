Return-Path: <linux-media+bounces-16185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8F895024D
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FA271C22506
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 10:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3064518A6C0;
	Tue, 13 Aug 2024 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TxyES8lN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C0118A6CF
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723544447; cv=none; b=Z80Iu75ttPs0xloTvGg/oV6M7z7UaEIiqmbbLkoYa5XRVF8IjSPBWPnyPlbTrGeTHtea5t4qdsuUY4dVKV+cj9NTuihsfLNcICMODFaIar/aTsvuVYpOw3eJ+Wd/8AHpj0CfoI4hpKdvoeN1u659gvoDNbxHTTKNXvf/Hv0K29w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723544447; c=relaxed/simple;
	bh=dHPvVFMF9oE/Smq/fAVh/jP8Xok6qZTN+5FpM5SDwrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbK9GjtiRhdgsze5safT+8es3Stw4449B9y5Yr+/2PHV3PZ9GgTUzD8uz31DeFE8b1pytHvXW12XUhZtYt20T+OX59n0tVPpCEjGqvEx510pI7K7vJ8c3xvSFxsUsSu7wdDuFI80Ngewe1iK+7F6MxB2cDp509MA3uohh6io4pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TxyES8lN; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef2c2dfaf9so10906561fa.1
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 03:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723544444; x=1724149244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0tdmBT53w5VNdz5QchETAoTh/+fSs3HRvsgOCGHU8w=;
        b=TxyES8lNzAa6Fh0b6U4njf5VE/UUueSRabNgsf5RrDDpIdtjy8Ho2Kw8gZmWJFO2E/
         pyKU4YGm2naqoQCmMjXxuwEtYWktQA7langyxJAM+baQIJjK7ek8THXyU0+oyxCtVDPX
         Yeg4ZJav7SVaO/ZadPhh2GgWkiOULEpK8EYVztzxzfFRuv8pKTqM9muSRLk5taDqB5Kw
         Mf7QWvJA7uY37ZW2X7t6ZMdBVsC1Hngtrf0ensbjpC+UVHxPQeEC2j7YIRLy/wYnHnxJ
         3kt2jcOE8IgJGVmOcNidXmGQSkaHxayTvCddzyOvOAqAN1aiglUnKTXz2qcmWDPPLLTS
         DsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723544444; x=1724149244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0tdmBT53w5VNdz5QchETAoTh/+fSs3HRvsgOCGHU8w=;
        b=Tm4W+ha3WxJz6//tInBLUnUan9wRxchPJ6CIPas+Ls2HGsjypxTTNRkb2TB2/55o1A
         UuOk1w659DAv8RYWWCSENvW44BSsk+2fbr2dCBPIlOtEEkMSXrlUZM2Rb2wxP+4is6Qc
         55Lpf/TXc45/wzc6C+tO3usSHTLGil8LGsrmRmDnYbGXIYppWTAydaYfSW/w3p+6qcyd
         h/kv4YfXn451VEBa/QiErjWXjqlequPajEcu1xnyoV/yN+owziHRuoHNUp/3YFRhbema
         gDFBscJ8zm+Jw1zS/LwPlDfCnDfbPYfV+sgmnwSaurR1Xuo9k6Pum9LaSg36wXhy6e2R
         SFYg==
X-Forwarded-Encrypted: i=1; AJvYcCU1JOXlCV37e8W+EeN2UmYskO2N57GWmTiiLfQPAJLTQDHrZurnLYmDQZKwMRNxnSauLTJ6pM8hiBzqwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbY5IaLuVaKDAk1zSP4vOYIDliKCEUyJSmvRkqGDZVlMBX5Qdr
	oj4CTVtCIlGJy8t5EsH6FwzINFbgfnWQ847RvxiKU/VI/QHx3Zeu5IR8sxXrULc=
X-Google-Smtp-Source: AGHT+IF/VZHJu41gzR8nQXdexwyEmRIlg2m8Yeyw1PWa7amgKeESRU4q3p+273JLfIvLwOLrftt9gQ==
X-Received: by 2002:a05:6512:3c8a:b0:530:b78c:445c with SMTP id 2adb3069b0e04-5321502ccf4mr765677e87.8.1723544443830;
        Tue, 13 Aug 2024 03:20:43 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200eb3ca5sm965917e87.55.2024.08.13.03.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 03:20:43 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/6] media: i2c: og01a1b: Add OF support to the image sensor driver
Date: Tue, 13 Aug 2024 13:20:31 +0300
Message-ID: <20240813102035.1763559-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813102035.1763559-1-vladimir.zapolskiy@linaro.org>
References: <20240813102035.1763559-1-vladimir.zapolskiy@linaro.org>
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


