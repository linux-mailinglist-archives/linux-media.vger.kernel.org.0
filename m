Return-Path: <linux-media+bounces-36366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5E4AEEAB5
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 01:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 735F517FD3B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 23:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0C92E8E0E;
	Mon, 30 Jun 2025 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFMiprAn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CB6246784;
	Mon, 30 Jun 2025 23:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324409; cv=none; b=B3gtlN8LQgc6AgUl4G/FYQyZQ8+lBMb4yohfmtRnD95nea/TNJESRbZ8XvOB0K076wiIRwv6plGay2KT+wgIgzPXBkcMG/hlyOF/kPahdxP2zLFoLsYKOuBYT+nspu0Fk6Bj756vuKRfeWMMsID5WICdf9nZ/JYS3KZ5TzlZ258=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324409; c=relaxed/simple;
	bh=Y+wmYlRIXuieODgN5f+0lJX29hjBfVXZNDN8pndGqno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QARKi5Ib0WXqG88ZDB13e+SzopOPPVuhCpQgc/CJKpFb5BoFZMzdI45jXL+sflesY2a6/Jsr02Z0LCOZ1P8Pxmu61M4+KKpjqQdUAebsNJtdHbqcGY7GaQvwz3AlYQJ+pXFLdc/TbBID640mA7ptvGi/enLD/UptyUQ3YfrhB8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFMiprAn; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6faf66905baso32889266d6.2;
        Mon, 30 Jun 2025 16:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324406; x=1751929206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhOdcdV9XVCx+ru/5FX4x8f8sDwW5BnVIi0tXeeokRE=;
        b=nFMiprAnq2BlSniDWDQjemvc5JwWR5iLzuotq/4os/KLdjXwvPs9r3dgbPlmdCKeoF
         M0l9AexwJU2B601mB8zgq8u3rtw8sly8JZ1/upbAtoEmEHCeg9bXuU0mriOsMW2ClfFs
         vBPudb2lnFBTR0oCbni776yuUBQJjumH+gRdfFnIwZBOeYAhuDDGZHkNZdBrwWXADi0I
         aDOlFyW9yubldJzZtLPfGmuRpmGZtmMgdrSEZ7QhS2BIYFT7wGF7dMFqQ4qSO/mH8CZK
         LR/KJJPBPEPSIMkv2nIyzAnIKin6f24uF65sSvHAaTmKSHo/P80h627mQk0uiDTq+eKJ
         Y7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324406; x=1751929206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhOdcdV9XVCx+ru/5FX4x8f8sDwW5BnVIi0tXeeokRE=;
        b=kg1Kc/Oom9FObdUWR4l96xS1KKm7ROWma8rz0ut+yyV6KW6Z8xJZfWqdiieXmRIoe9
         t2AYEfqNSTCZknGpmWHiEe7fDNxuRaJfzoJJwDdgXxRSYqWKcKG1DASNmEFmUlnZB0XZ
         l0MoL/c55px7mO6J7u/EPOcY7zN36Ma13zvo6mAZUQI6Yldzl65c0UuKV0EsK7+JxYWI
         onTEbjkUNEn/Zn8y50vGk1PbuqJso2/2QpUhzcVyLRYou5+68JPf23l3C1rIvZASFiCQ
         1dPP32l8J1ursVfkX3XpGL8xMtCsg0Bq7BHJU3pVPMo0MGFawKYsbzoJCqup2j6MoUmd
         Co8A==
X-Forwarded-Encrypted: i=1; AJvYcCUbFWWqTjXm0Uf2fvun3cuteqqxbZZMBCT6QHDxWfFg96PjO20v4BnO+u1NgKg0qx9ZM4rLEFenGDPeEKeIIA==@vger.kernel.org, AJvYcCV/ZjDTkmDpYAjuL++Pm1XYJ3ABH3f1eVA1nq4ezCpx2KHaP6XZHJffEBnLCn28VFxuy+xP0210hlKoDgE=@vger.kernel.org, AJvYcCX9FIC2+p3s8KQjvUe8Dzvw5qSr3FX5hyBiLwrA8ctFAuHf3EKOG0457Xn1ZPOotfMNTSjAoz8zG0Io@vger.kernel.org
X-Gm-Message-State: AOJu0YwZipiLTxCSPbIswV33r14n+4KgrCgTZjcceABQEgi4vectTQe9
	39678xEeGFeoT3LWhEFskKOzvbWgQnh5qij3uBfaHWRs0++YqQH7zP9u
X-Gm-Gg: ASbGncvmO0Uo+e2ZSM5xgdzHewpDF228SRR+LMpJh2Yd+SqsH62lJWKoO40qc1dm92b
	o1GzO+8QH36yZMRv0zc3G1zYZzBjAv2bqiPBP67AApn6yYEQiTZh0fEZGSzz3WGDxbPuGeRBXh7
	JRiTCRQRek1q7C1Slc8qGDnqQRM7Fmij7L3cTA06JiB2zS/Wb+GZofpqlyyISfToYbGl7E6cOqO
	I+W2xKLqODb8YQm0Zg68sSeME3a9zaF9KcvYc0/T58lm4q7a4/VEhs/Cdp1w0Q8N1A0hCqKP6cX
	IRN3CPNRbo9N1USjI5oWGUbYrfXuVjddtvMG2gOBX0K9hpvbUw==
X-Google-Smtp-Source: AGHT+IEM8su59K+sGXqsx2QL+MXaxGU3ssE+dZg5NYnCiMOizG48GHsYfFcPMPOfp57WYOxFKpfkpQ==
X-Received: by 2002:ad4:5d6b:0:b0:6fa:9f9b:8df0 with SMTP id 6a1803df08f44-7001378c6bemr192296006d6.20.1751324406293;
        Mon, 30 Jun 2025 16:00:06 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fd772fa9e3sm74391396d6.81.2025.06.30.16.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:00:05 -0700 (PDT)
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
Subject: [PATCH 3/5] media: i2c: imx355: Add power management for managed resources
Date: Mon, 30 Jun 2025 18:59:48 -0400
Message-ID: <20250630225944.320755-10-mailingradian@gmail.com>
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

When enabled, the resources consume power, even if the camera sensor
itself is unused. Add power management functions to release the
resources when the device is suspended.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 42bd08e8ac50..112b1f22afbd 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1531,6 +1531,51 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
 	.open = imx355_open,
 };
 
+static int imx355_suspend(struct device *dev)
+{
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx355 *imx355 = to_imx355(sd);
+	int ret;
+
+	clk_disable_unprepare(imx355->mclk);
+
+	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(imx355->supplies),
+				    imx355->supplies);
+	if (ret) {
+		dev_err(dev, "failed to disable regulators: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int imx355_resume(struct device *dev)
+{
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx355 *imx355 = to_imx355(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx355->supplies),
+				    imx355->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
+
+	clk_prepare_enable(imx355->mclk);
+	usleep_range(12000, 13000);
+
+	return 0;
+}
+
+DEFINE_RUNTIME_DEV_PM_OPS(imx355_pm_ops, imx355_suspend, imx355_resume, NULL);
+
 /* Initialize control handlers */
 static int imx355_init_controls(struct imx355 *imx355)
 {
@@ -1848,6 +1893,7 @@ static struct i2c_driver imx355_i2c_driver = {
 		.name = "imx355",
 		.acpi_match_table = ACPI_PTR(imx355_acpi_ids),
 		.of_match_table = of_match_ptr(imx355_match_table),
+		.pm = &imx355_pm_ops,
 	},
 	.probe = imx355_probe,
 	.remove = imx355_remove,
-- 
2.50.0


