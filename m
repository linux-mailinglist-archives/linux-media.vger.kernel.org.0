Return-Path: <linux-media+bounces-50938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BD7D38C13
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 05:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D31D300F6A1
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 04:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11436322B80;
	Sat, 17 Jan 2026 04:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aj/T3tJI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1599A23EA80
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 04:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622810; cv=none; b=sFhKvcIgmKCNnFh4SwpbgGoT1KwJzCKApZ0K/D+F4N8LSGLDI/CDERA4g0dub42OaCH+z6IMFOlLIVoQNhvSo7yruqxlQ0FIhTzTw/zK7vNVaLID8BdjVcz9lE+TBTzKBPycX+L6EtejFQVOwlPaeGeTjpg4lCcggTETxLXX86w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622810; c=relaxed/simple;
	bh=qdzZ4n+LNV/PsoK+uJu2XlZkWbAHoGmAnFcee+ROIho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVB7uysX4wklr00DSohrc7fXutuKlV8j5epJebLHRjtBesgBWagygF73ps/g2AoZvPLv+Sksx67jpecV74EiHo17GKwMHx6Agh3lqgXTWpJnCDmUnWSjcgPSHX13NcOnncbkJSbcOa/sOHQveFgPZRLVTGsCaI8wjiSJtBoGhnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aj/T3tJI; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8907ec50855so37333906d6.3
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 20:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768622808; x=1769227608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahSJ784Agrct7hUV5mLfOvTi+Ib0YPHnSuXQC3QM7fc=;
        b=Aj/T3tJIVfjqHAgjMCmWBpypr6/63+EAPxUK5+Vb0/sfCwElVsZXqZDdIm2Xc3dY+u
         ztS9zYsGvt89gL/i5qs+HrDEus+igkRiLU9tCYGC6Jq1/ICCFNrBpXn1+2sbT179Dwdz
         R3eUGMZnlWCJ9DyFdMPSjZTBkLrruLui8aHr2eKK2F3gK/CAvQPGGL8zDxt68xQ4rwat
         KX9rdZaDnkRMUtuDOJFeghkeyt9LDkND601DsHGJtKWRMKXKYkqkj56tgOWTBUr/hqbd
         Cd1o14nfFSXNSXKSOl7xZ4HH3gjIniiBKSurs1sQS9hP9Zd+4ZqBhCWrKkoV+a3TXayr
         AZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622808; x=1769227608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahSJ784Agrct7hUV5mLfOvTi+Ib0YPHnSuXQC3QM7fc=;
        b=XQsvBWILWJR7R9MAxLiLA4K3aPxg+hjBdzvNrf6tyMKgWEvC08pnvY0qesl9V6MwU9
         T20H/9JDa4CKhRCHKmg+k6BLIcOeGA5bfAw6IGq2mgqLvGVYW+X1KL34oJof/vfI9kZA
         CcUOwseDcYapX00UOp1orspP92ENkl9F/BktxzUgU9r9MXKN0Xe9utqQ7YAuGurNhBQg
         HuKeY1z3lb45Ki7OgwkJhMvOsMdfi8vJxzIIymDwS50a8yahpLSjHpDMcJfRnLa2gWk5
         VYsX89pDhgpu3U+Y64wjdnqmgous0j5kDNXN3eHmKgrdpvZwC8xiuy7vbna17F74VcBu
         ltPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyvxriMtE8u2b9JyduLLaC/f/jB6+0lddBRI4ZiD0lxua9FLqBJN/wIemoJp+Nxeu28MC902OQWhJ/cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNETxu3bER9NvDg6KYSsGo8lM2TFIV+9CQtWMHWJ7oocfOUGCY
	lMpgF680hZSZJxwVQICQ1HUAFiujSU1zVWZfGfPXg0HwIGd6GkrQr4ts
X-Gm-Gg: AY/fxX6wS1xMsl16uDyQf6j/VB64tpW0ddZKXMdPPvpIH7EizIuPY2LIxU1IFStg5DL
	LeYW9jYQsgI9zgQ83d1e9eixsRALm98PZQqjDm0m/vS93lU5o9kjwVMO0TS/lHIG81XGpikHzYo
	KnXs5nYO6hw5fsdiXpQGaO5QHx8YJacFVe9chSX1hMDM5zJYBxqGzNu/CU4z8d9VQbi0Z66Xiqa
	Mkaja6c4MicAP0xpNp1Rz2KmgQ0qzEmuJWwjp4WqKJ1wBf3vZWe8jjBqk/0ElV5w6+LiPokFeAf
	CbcFsofBBUHtG9NnBJRd94Zqg4S/w7J0P7NvqVZDVSlAPdUdMe9HdVqpbdqQlLCBW2y+3YhvriF
	+q1SaRJdkmYG9WSympG/EAtyOvtUk4ktpo5PUN+0EEZlsHkNFtlaNnjibaxs/2BcLKQPwOs6cm5
	FiiTTrvQ8FG2WpyWbfW8chv4eq00OLYpCbh4Yd1FaUGOTeuy35Afq6D3GCpLVQC1cbfebqVAauH
	zI=
X-Received: by 2002:ad4:5dcb:0:b0:886:3be3:9e5d with SMTP id 6a1803df08f44-8942e2f7434mr76298886d6.16.1768622807837;
        Fri, 16 Jan 2026 20:06:47 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6cd63esm36994196d6.49.2026.01.16.20.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:06:47 -0800 (PST)
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
Cc: Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v7 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Fri, 16 Jan 2026 23:06:56 -0500
Message-ID: <20260117040657.27043-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117040657.27043-1-mailingradian@gmail.com>
References: <20260117040657.27043-1-mailingradian@gmail.com>
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


