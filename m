Return-Path: <linux-media+bounces-22184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF49DA7D2
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02196281C10
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F177D1FCCE7;
	Wed, 27 Nov 2024 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6xpPiwo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68911FCCF5
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710610; cv=none; b=FOkvvJl5z+78Ky0VMrihRuciGqJtuk/D7hdHEoq1JZLiPuvaQJvAZ0CC8FQ4SuhPlei0UI8OQJaBFNVXMC4fNB64ohWYodn0Zw6+y0NTiQIbRDwz9UJ93aQ+yKlhX8dOMs3Uln+NMtpfc1sM2FJj1zLUx+b5a6w5NjbgBQcd83M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710610; c=relaxed/simple;
	bh=Vuj6kK0EJ7CHZhxp1LbnuDzYrHFVMG2293bs/7UUbfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kAUs9RchtlpiRTgJ7hXI8BZD8GFe4He/tdWlPyTfZNXp8fjgDL7le4uVIjzPEyjghwU26cOpny3FzVYNqReJd/02D9dtKj72fOqKYgkit6mB+Og7R3OZ3mGIHQdwSbB2v+++Xyygbtw03gSTUB3eOaEW8xTha8PTf2xplncAI5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6xpPiwo; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53dce7dab43so838136e87.2
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 04:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732710607; x=1733315407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEFUpzbKvTfhb0tLH7vWZRk6FYNLH55/qvFLVseGYTQ=;
        b=c6xpPiwoRbxpaEFA49OVbY8+8sE0r0HTY/odAwiXcGjMsy0pu3Mv+YCAc4lXSEzrGx
         Jj4K60ZuiW2SMSTFGbL8CgdL3WSBwch+4ue8H7o7rNYbm5jQrDMeMYx0OTGrpW7d+6gE
         mkrnrb9p6DbddPlMNjXdXZRhovsII/5GJuRRjiJINVqCXSrngAtYc7sDIFJ+AnCUwrKH
         HdxBHSSjh6TeK6zhic+yRLazYfGdz04lSLr98uid0ex0Hitug+47l7KmfY7ExXd1L1wY
         0PP1bBKRg6eCtyTDCW4j/hhFwT2nqPCyGWas18UcEAm3oTsGK3Gd7S7TIJFKY9TWIK10
         1Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710607; x=1733315407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEFUpzbKvTfhb0tLH7vWZRk6FYNLH55/qvFLVseGYTQ=;
        b=Y6R+BM+AjbTKQAFUyH/qfi4vTuH20Gl83c4tTu3nzqW6zk1mUAaf/b60SV73Ge9rFJ
         6fFK/bsgQ26jmQEApc61jZFS0lNRBsIKKETw8faUILTz3UBsH7HmGbKoIhu6sgfZe7BI
         EZrrju+za7vREuuxgsG5UGgh0MdfCBgfhsD1pttmKMYDYTeETQLnxYXGn460+qEvMG1Z
         Cg1tUItTtL6pfMbch0kf6gGWSCCLWnVc6YDFmERYM5HtIXsy8xRgkpNNPnR3pmBnPnTH
         ub7/3Y6Glkq7FkMW0UY+3s+sVVHbDXbn/gWf7QRQCCdv2j3BTPFC2AkHzw79iCz1qfHx
         djeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7K0zSKTAUChSJRCymM9n/YcUTHsAIwmXq4mEaEGuQRvtK0J9HR0Xgtu1SJIrxhoVQCWC7pr3EcHGbpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIJl4VQyUjnsjPm4JcHRrt3T7P+SDlgx/koReKpGN5fN91228O
	AP7l1qqzdscMILyjR1orDiQqU/D2rNcSDFTCpzgWg5A1UUknVNGUmG4vLGB5700=
X-Gm-Gg: ASbGncv8WRjVe2fMWaRYLzy7vXnxdYlguMIxjDOfKIHCrKWWwE/IpAu2Ke/6ndW1pdm
	ZXV7dPdFc/1rGUOg6D7mVhUrkc97VEKEc+VeuMtFIK4v/JNDFjUCq2H5zuGsRIuX2M1Qmly4dbp
	i2PQ4A8ns/Rw58RO9hV3iCepixQZx3xdwxUeLhHlmr06vbIR7Hmx8Yw1a1u1wEnVYmVGvXfxVw5
	hnaYycoXxnBk5gtl2mGo1KVck6aRMz4WION18uSiU6hPWpXRhWq6McVvx2OhgyvNgUpBBAgMTzT
	sJ3WulOMw8PCFD+qtcYzvLSwV3RUgwYSHo5OG9U=
X-Google-Smtp-Source: AGHT+IGowptFkbTEAuQlP2B0QYnkmEvdwwGsERNzdVAtmUweyyASYJRRN2IvILq4TFHcbz3FkjIJkg==
X-Received: by 2002:a05:6512:124f:b0:53d:ee0f:2562 with SMTP id 2adb3069b0e04-53df010fa1cmr286662e87.13.1732710606739;
        Wed, 27 Nov 2024 04:30:06 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24953a1sm2276621e87.228.2024.11.27.04.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:30:06 -0800 (PST)
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
	devicetree@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts
Date: Wed, 27 Nov 2024 14:29:50 +0200
Message-ID: <20241127122950.885982-7-vladimir.zapolskiy@linaro.org>
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

Qualcomm IP catalog says that all CAMSS interrupts is edge rising,
fix it in the CAMSS device tree node for sm8250 SoC.

Fixes: 30325603b910 ("arm64: dts: qcom: sm8250: camss: Add CAMSS block definition")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 48318ed1ce98..e5a4bd25ff23 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4481,20 +4481,20 @@ camss: camss@ac6a000 {
 				    "vfe_lite0",
 				    "vfe_lite1";
 
-			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csiphy0",
 					  "csiphy1",
 					  "csiphy2",
-- 
2.45.2


