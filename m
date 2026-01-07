Return-Path: <linux-media+bounces-50092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 21234CFBF67
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DFBCB300D425
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53A32512FF;
	Wed,  7 Jan 2026 04:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+T4U5AQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EB6247280
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760235; cv=none; b=XvEv+Nca0ooQ9IQNL+YNX61Ssm7642xphOIMzicOMT32CtHZhrCq2iDgnDpZxqaBEj6NkYFC+I8+ULK+v4+XKF+9cEdS+JcwvQIfcQerQ7pj08qoRL/gEqMxn8h+TgVSx9rFD0cBoP3GccrppK0ursxprDGP2icupQh5IaHEC5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760235; c=relaxed/simple;
	bh=qdzZ4n+LNV/PsoK+uJu2XlZkWbAHoGmAnFcee+ROIho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKcvS0+Yv0/ZFZ4X1xWDHBRY7lPrN0H30hmZ/CrwA9qRaQZRlTd/jQkvLDuy9T+KAzDsU4ox3/nRchX7dFPcSGuT6viw2wS7stWGNWxT+s1iP8MtzkjHSfwfzd5MoK/NVrfpP5CEYKf2+/KHlV7o29wpCW3NfgyKs7XCNe/V0P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+T4U5AQ; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c0f13e4424so163565185a.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760232; x=1768365032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahSJ784Agrct7hUV5mLfOvTi+Ib0YPHnSuXQC3QM7fc=;
        b=Y+T4U5AQe6+nnN4nS5u8TrS+Ti0U/ZWpGS6S8CSqHEYdPhm56f70zn8DVGC8/qK8Fc
         o+0zmpuCd7I2gqM50rITYBLgztY6Ex7gtxRoiTYEutad1GZURzdYn4atIUvTECBXbuI3
         NrWQB23VInYm7yix5D3VDeCt1xmpgEm0TGK7QDwj4nH2pwwYRMgeyWg0AFMh3Yq7zf4z
         z0d37yI97WbPmvBhsEDZ8IKXR6tcZ0g+gfkUGdryjiQvi7zfU4pfPtD7SaKCfK3eIfiV
         YucsNXmIRp4o09sJIgFWWeKZUDiWToOZHM0nsm9wuIchmu1j9MT5uUAB35O+ZP1vAUPn
         zOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760232; x=1768365032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahSJ784Agrct7hUV5mLfOvTi+Ib0YPHnSuXQC3QM7fc=;
        b=F/0YXDAKUilY8xmPEfGg7iIXUeHZNLdvKuaeQxejxqs2r5ZcL6IlI1/KRnZdDO4boR
         rshfHg0meTmknXINnkrlEJ48QsZlClgfg01PJc5FQgWd8lqw9Tn9/YxDWUtgl+5Cv9Ed
         yr5bKgDPTvuRrdZ8UD+oD0Tq2wqCUrAz/LCUS4UJHPZqqrWrKXCBMJa4mazmg+iwxqk9
         YG1gmebhZuyywIQ0wqO6IPfUluuLGJDberH1UjsW+umoyek4IRcUAbhy3XizgPYRwIb6
         STNxnbih3jxFUXiAQlo14vZtkzKzBUb9xEnZd/sfHQgX9MAtvMu5lIaj6VMDCDNFNkak
         3/Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVipsIdCfMXeV1d/tLatgmU0v++qaThplRJQNsg4nBuBKhbXHM5UI3ni0f3hKgNHgufsm7L8ccxUCJ37g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8cdfC9WSqRAtQ1F7GopMEtkvYSK/1PKnVMjHMKAvMzEKZ4/gm
	n9HG1UhI8gjuRYAFAVbvXrYnh5dF2hDm3mVZ0KBZJmUjQdl1eYE731FK
X-Gm-Gg: AY/fxX66xzpuRBmdqZ7FpPuEKTkucmAImg+2J9kCPynW6XGYfoUu9D6BSJ8j22RuA97
	j6MW9Cq+WXQeCsv+C6LOGMJVF6ECvDDgxhLBp93eeN85bjlFcXbtkFsd0dTzyYjTkEKDQI2UZdM
	rpwNvYJ9v3QjL7HIoZv3rBiZ0SR4vpgxSBx3DDkmcMz4TJJ4Tuw9s4wMYWjst325OM2onj/20j5
	/Uplf30/20v5q4GnEvVUjF8dxW0zaJwZr2bp3+qnQmzAFuEHRUmTkOU51WFPKoRunkFaAfd+Z4p
	iDtz8j3HapM7/QQ6ru6OheEZp8sASXSZTGHY9opx7VVq+K7ta6GNnJ5l9IcEqs0WwjaWbyEPpTZ
	tvwuL3mMOsHzQfxvdtLgUkC5C0aNdzglTnFflWscST7lstMPjOzLozymyqK0k9Bp9afXE7MozFy
	Se2kaTyWvAOUDePawSrgC+IqoZl2Yc2KZJZT5XxETlU/vrRtJPO/eHaci5tA3xsselhkq+/wbtW
	TM=
X-Google-Smtp-Source: AGHT+IEKJU0YmzkhTabwMnLGBVZqz7X4gT/xpJHWpB9OPZzD+XwLnPG9+W6UrzCMMz8xaPi7qB+Ssg==
X-Received: by 2002:a05:620a:4081:b0:8b2:e0b4:4e7f with SMTP id af79cd13be357-8c38942ee3amr157373885a.90.1767760232387;
        Tue, 06 Jan 2026 20:30:32 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e217bsm26420756d6.13.2026.01.06.20.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:30:31 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Tue,  6 Jan 2026 23:30:43 -0500
Message-ID: <20260107043044.92485-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107043044.92485-1-mailingradian@gmail.com>
References: <20260107043044.92485-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 3eb4eaf7b8d7..f21e60a6a2ef 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1196,6 +1196,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.52.0


