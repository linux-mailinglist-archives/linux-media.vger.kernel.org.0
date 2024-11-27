Return-Path: <linux-media+bounces-22182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6632D9DA7CF
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 265F1281C61
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98ED21FCCEA;
	Wed, 27 Nov 2024 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CLGiVwav"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2231FCCE4
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 12:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710607; cv=none; b=iMt/O3vcOYlsFv60icn5oggmodJafTlScQ/IVcFe+e7Jr7ElviUdWw4L4+1aMCusCyQLqOU3niNDkZZ3EhqocT4iEJ7uyOcOsWE3CBSqUDdFR9nYITgzvBK7xp/eMpNutOvEnsf6OP99qakd6/imOBgprM5fKOaLSEqUTt/OcMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710607; c=relaxed/simple;
	bh=ljf3EWjEa4SU6KMOMq9ZadlQfPXvljFceyph2YSyzOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5B8TItkACUupO5EMuEz15du4EKu2IGjJGFWfc+fE42GQpQN2oA4uPM/EyQ6al2FsyZPiHLokJ5Du01ccBlrnSJOQ6BzjzLJJ25DDxV9KKoaz/mykgIt6XGLNs84pu4XtHo59m2874BrS+9ONAb0pYa0p+XeUbPru0NMSuwpHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CLGiVwav; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53dd58ebccdso716417e87.3
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 04:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732710604; x=1733315404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7o3A4R5t9bwg6LdcRtL+5UJZhCaVKgO2KxdIZtFgVSU=;
        b=CLGiVwav1Go6veG8gibP0CnE7a7d1q/pfD18NfeoWvbm0k0l17j1kh2XxiMHxaCZ0G
         HczaOxYf6d5Bv4iDZkO7JfiATAWTtxTnTn+r5X9A735W1T06RuU3C66kfk+NiPAAGglS
         svcDRbRs35agM8MwB1nWWxVdrKxV8f0FDinENC4k//gtBhZSd1f6pxU5P/0Xpq0hUGXk
         PxMeWuMgPIbp4+hur/Lt7/hbHdHKJfuVvhy0WQyRuVo0wDP6kvWBJcYM9L6jpSjrPkr/
         QvHMUv5tlpwkBtNtstQfN0UMFcrsUUGYhCcBgO28a43qcnRd18R8qhEMFwo2OaeA5tIF
         VmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710604; x=1733315404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7o3A4R5t9bwg6LdcRtL+5UJZhCaVKgO2KxdIZtFgVSU=;
        b=kg3UBaUzrdns/vIGDPPIwJX7JQUjEdHRedNipfAr984lcYHBZg0d0leAuBHcbad84C
         UxZ4KAkn975pVrhxMqwjMICAAp3mLdX3G2dPs+rdZ13k1kSyOBDt6GEqdXDoYJAJezyC
         T/lwWjN0HUl7FVtNyQ4AG5hKwxJO23joUArQSRz1XiZ8vKYs86bYl59Voe9DloO+ISlz
         YCXUcljq6uHByr9R53ndxsfGgGWYtXO13FYqFCuhdXX8RlSJ7qDEOXBGLtYQ02l79ZAv
         ZF+Xrrt/QOJyg/93VnVo0cFCDwBm4wEJFiE+gJwparbeVei3fbCofvbjzwNdYaOs4jTw
         hjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqTxMtcdunsnTZe9mOKm/sS/dHcYUkHgCPaKuONrutAVmomYlw76QiowYRpWpcq1rzGSMRem8kfvxDLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydWDyujikZVMtIPfkdR3KSVnazJTv+Ui+ttGXzn+jqnbBwazEg
	eyHo6GP5xVHBi4TS9HSC1igLFMufGxhag/H06Tb2svYy/T7XFp3sH9OK1tMfDLE=
X-Gm-Gg: ASbGncv6m9jNhrGmf8kMGkj1bQwfUaJUD5Gw34D82N59r/QyV+zQz/a/jgDh/LXI+Q0
	KI8fkREqEUcTPJYVrufHRc7dPhs89Z7uGP6n2VTr99EsoUv2RzWR/Ctlsbh8Qc7wa8Anoge84Tz
	tbTPOaVrDJKHMsN4D1qEIleanvabs5KXOzMsthUtlHF+aEEfXszz1ptlxrsJln4wtZwZObsw3Dc
	FlUPD10o8MfflB+VTHHzHa3g0s4bGBLKkqX5uFPY7GRNlPYD++3uucK9/tZU5pKCuNQ4DDECFYU
	BHfdxur8rzaCLqrKzpYQwvLJIgXpXJG3nKmziDY=
X-Google-Smtp-Source: AGHT+IFjcgZ4S9xhgLpc34LY3lmR9lrDlkZkRhb/uSO1L6Udr39fMvdOIIofvmxI3TOycExu5vohwQ==
X-Received: by 2002:a05:6512:3a93:b0:53d:e544:3fe4 with SMTP id 2adb3069b0e04-53df01150e8mr353178e87.14.1732710602811;
        Wed, 27 Nov 2024 04:30:02 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24953a1sm2276621e87.228.2024.11.27.04.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:30:02 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 4/6] arm64: dts: qcom: sc8280xp: Fix interrupt type of camss interrupts
Date: Wed, 27 Nov 2024 14:29:48 +0200
Message-ID: <20241127122950.885982-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127122950.885982-1-vladimir.zapolskiy@linaro.org>
References: <20241127122950.885982-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm IP catalog says that all CAMSS interrupts are edge rising,
fix it in the CAMSS device tree node for sc8280xp SoC.

Fixes: 5994dd60753e ("arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 40 +++++++++++++-------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index ef06d1ac084d..6722134aebc9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3900,26 +3900,26 @@ camss: camss@ac5a000 {
 				    "vfe3",
 				    "csid3";
 
-			interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 762 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 764 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csid1_lite",
 					  "vfe_lite1",
 					  "csiphy3",
-- 
2.45.2


