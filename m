Return-Path: <linux-media+bounces-30885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7047EA99B73
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 00:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A426E17E114
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 22:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8ECD21FF39;
	Wed, 23 Apr 2025 22:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lGmv9FSl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D6D21FF38
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 22:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446815; cv=none; b=eXRMOvvtiSZjAiO8V3JARhnbNfc4O7ouQS657Z3lHZyp/whry1L+vLJmmSmF74/dyLjcaVJSrrMSoImWGCriiXW/e1niNSF0zZNmAc9P17ic9fzf7uZq6U/Iw0v6RE+ZUUxKMlerYqDlb8DIBlvlJ6oait27mIeMsHQt6Nv47R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446815; c=relaxed/simple;
	bh=d4qeaIA7SY31QL7+qANqSnYfVRN2R0ewfTenj7rKiJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4g/Mi2cYvbsWi6UoiKEy9VhkxVJzXB2Zdk2HvbUTig0imOmehWVVWTkfjHWh7ojegMRMA91AjC9DP+gzU/7ultfvU7H9WbtmJxluHTLhqLWFVgV3lpuFpzziC0Ot7daWNuUSvHVcDiO08CWOO7rXgfLCmvlPb7a3x6ThOXJ8rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lGmv9FSl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549c70bf6caso52490e87.0
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 15:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745446811; x=1746051611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfE4q0oZOZOnhqZk9qWEc7BpSWc8UZ9AjI+wnkJRUig=;
        b=lGmv9FSlfSZQqJYjoPkmED4TkgsTixXB/4ImOD6HP7PuYj6adyazyXhgHJdZYRi6as
         QX3dqP6T9Jfr5ObmIlS5tR8QAHxT1ccVC7h5tnYDuHbLKSi3QftIGdLqc/f2lPJ7dYpI
         HsjFOzQBA8bvvYeo/GYRQ3sWVFLfNMCdL0AZCKoS24oirat6oEPd/llq5sRmtFEj6evn
         A+as7ZXW9wLv4zIaU7q5YhxthFRnddM95EPAbmCPJky9HGaU0Ps7gZY+2VvaOnpLXWC/
         4BEKN70jViJ+Ws4LS+oL2UQDpNBo85/Ck6cZ43QsoEjk8mJUaxoRq00oReP4vIhHqeeY
         MeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745446811; x=1746051611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfE4q0oZOZOnhqZk9qWEc7BpSWc8UZ9AjI+wnkJRUig=;
        b=sJZitirTC9yZTcj8Mqf/GYTHXS3Wkft1PuxNRUudrIF46U21i6LPtgwSDNsR87/7RS
         R8qoibo/+1aZpRh3m/uSuGvACVI4Bdlr08KSKsrcHKptBW67kZuzJBninL2DGJIsndg3
         d9vu+G3tu8xzXNQEWo9Hiilag+erOpLUkvmPBOcDEfyF7Ml3Eek+qE47DdWWFVUbzS4m
         pWSGbcmyd7AjJxU7RY0bZ+j4M8q1zfe3QMQwUMTpSbLXGEcB4egRqZKPOCQZZxs7Mf24
         pJGE7FX9ybQqwDOaN/haGPDbJgwKIM1WVk7wxAZ+SjC9KO3be5nZnaYp2kz4XT71+Dyn
         XeYw==
X-Forwarded-Encrypted: i=1; AJvYcCW5eghOSdGcpyiQj75o2UEpUI54HMzjSqvD+7uUfb3KFhuwwD+apRffzvzwboea3RhpjIsJUG5LHsjmyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtHyrkM7sFTtFvz0N957b72IZ7BGC0KbUV0yxXxRkQrbF5Re9i
	vazo1pEVkjiipZ1l8YXX7PGrXlHe8X0SoH07puOVsGUAET6xMF7FHXjDAsoZq6Y=
X-Gm-Gg: ASbGnct+/C4f9X4hoM3qIIhcYP2NX45KAD4HDoDzfOUHPzJS/5r34lqusMsBxvBAn7L
	S3hZ99mHeb00zeDZZhu3Uf5i2ilD8ZwW/Oa7YMfzuSF/Eh+s52GeB1PwWZqQkGYsSkFZoJq5yIY
	AeKnzH9oz3wEDWxCuS2/pBgBII4Zqb0ByZdVhk/dxKc8m3c1EBzpOS+OQ2aVbGl0wOej8MkdIJD
	hcW58ZLQeweKzG82V56S/nD4Jtic9vHXWKdrUHRBHjhywydCgE+VVqUOS0doodv7KLPQR2OLQft
	r4Sp/gSpoRkJR11VyaM8wkNy/UNBSniGvAQcq9pnOBx8eu/3ZfZ9/XIFVzIU15cB2PYEmkbLV1f
	e+P4ESZlKTJl0opgyeoGasJi14JTuaw==
X-Google-Smtp-Source: AGHT+IEFBLHwxXJt1asTOahfnWRFfQrjT2n96iyqqSw5MxmmI7YBGbK2f4gUIEpHP2qagQIO6O1jXw==
X-Received: by 2002:a05:6512:2386:b0:545:d54:2eb4 with SMTP id 2adb3069b0e04-54e7c428501mr48703e87.8.1745446811391;
        Wed, 23 Apr 2025 15:20:11 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb371a2sm19547e87.57.2025.04.23.15.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 15:20:10 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8650: Add description of MCLK pins
Date: Thu, 24 Apr 2025 01:19:54 +0300
Message-ID: <20250423221954.1926453-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250423221954.1926453-1-vladimir.zapolskiy@linaro.org>
References: <20250423221954.1926453-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add fixed MCLK pin descriptions for all pins with such supported
function.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 144 +++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b24ab52413f6..3b13c0971d7d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5959,6 +5959,150 @@ tlmm: pinctrl@f100000 {
 
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				mclk-pins {
+					pins = "gpio100";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam0_sleep: cam0-sleep-state {
+				mclk-pins {
+					pins = "gpio100";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam1_default: cam1-default-state {
+				mclk-pins {
+					pins = "gpio101";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam1_sleep: cam1-sleep-state {
+				mclk-pins {
+					pins = "gpio101";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam2_default: cam2-default-state {
+				mclk-pins {
+					pins = "gpio102";
+					function = "cam_aon_mclk2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam2_sleep: cam2-sleep-state {
+				mclk-pins {
+					pins = "gpio102";
+					function = "cam_aon_mclk2";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam3_default: cam3-default-state {
+				mclk-pins {
+					pins = "gpio103";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam3_sleep: cam3-sleep-state {
+				mclk-pins {
+					pins = "gpio103";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam4_default: cam4-default-state {
+				mclk-pins {
+					pins = "gpio104";
+					function = "cam_aon_mclk4";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam4_sleep: cam4-sleep-state {
+				mclk-pins {
+					pins = "gpio104";
+					function = "cam_aon_mclk4";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam5_default: cam5-default-state {
+				mclk-pins {
+					pins = "gpio105";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam5_sleep: cam5-sleep-state {
+				mclk-pins {
+					pins = "gpio105";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam6_default: cam6-default-state {
+				mclk-pins {
+					pins = "gpio108";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam6_sleep: cam6-sleep-state {
+				mclk-pins {
+					pins = "gpio108";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam7_default: cam7-default-state {
+				mclk-pins {
+					pins = "gpio106";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam7_sleep: cam7-sleep-state {
+				mclk-pins {
+					pins = "gpio106";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";
-- 
2.45.2


