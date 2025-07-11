Return-Path: <linux-media+bounces-37499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D5CB01CC6
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB85CB40B8E
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCDD2E92D6;
	Fri, 11 Jul 2025 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s722S1ma"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29192E7BB4
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238701; cv=none; b=qMK+FniCJPDoksXycFQPsW46OIRF/7xRYUxbVzLf3AwPYS0AtM5KgasDZcQfgjtgfDr5IuqSVefjEc9+5n0fCdACz2jv0JehOo1CExtliHNgpcyssgVJS07prSGFqFgxv8FB/zhJThXV1SEb0+4YxZZ0aJi0IJERXtUCm36cI1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238701; c=relaxed/simple;
	bh=JuMfXpzZJqCKUZySt+S5Ow7vJcUCRTmY3zPLXLDylck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gv1HQMzkzJnFiMHHnA+qXDHHjwefvAiF+cO76N7kZaBOhgL1eUshCJ6/kcwzjfAkpuOWQQBgs6x9dMSP++9i6sLRVkEb9ZfkEDU6hVitU//l43iMH1n39dX1tzhypniTVfCe9rsqnYZtvGjPj/JbUZQP4UrRzWIvdj2vrQedLqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s722S1ma; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a522224582so1046793f8f.3
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238697; x=1752843497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pktvql5qXi5RHa6y7vJTm1ICaz3CVlfcGW+HEZczjkI=;
        b=s722S1maSKpj5bKECASvZyTFvVP4+8TV01skE0SPzUN4llQ3Q7aBZfbdk9dxF6c234
         AvVPTtD0kKPQL2uRSWjzg4MpY2XYUxqXAcPB+QAT7VEG3X7iwXOL+POB8qYOq8E7odXF
         E17sEkM+v5LVl+3KQtY86Ho/vBoxRSCREL0KAoGc6NzuHbpk7ywCzaml/wwC+pCCT1bi
         xTasf7k4qbKNQPcwGkkvw8iFVCqDUaAbBoEbv2EJcOai80g40FDV3sAYjKU6s28TCNt8
         NHrarngufH6uZyjJ4ppC9rniI3hcoB6f6NCFgPvRuhs/7KWVVH5gFUdmJHw2uc1nl83u
         sEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238697; x=1752843497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pktvql5qXi5RHa6y7vJTm1ICaz3CVlfcGW+HEZczjkI=;
        b=KMNk8Y17eVW8dQ2U8fljVOKJBDXLBBaNr1Af9LW/nFMbG9ItR6jn+1QAHyeOpJJEzQ
         vzcHJxwvYEf0FJyIP3spjzz4pWcsYu4IgKGaH3cv2sqZVgeGTmy8UJgOCVf9DukJA9PO
         1aXXrlnUvkbRUSu3a4CaBj+g5TApUHF5Rir/BQvecm8TJyxkslx7Wad6NUxI1GIBkH1Y
         A1cpdaedJ9d7LexN5ch0ywrNggfSUIQ8IW2EnTNWaIFWYHwah9M7UETzEtLbQxTe8GQ1
         P8R5NyPst+J0uoiIMGRcPy/rH/agqFpt+LzxX+xGtLz8+fiqGpVG2+LJ8xHama/1BvQM
         XMxg==
X-Forwarded-Encrypted: i=1; AJvYcCUIwBal5KFF/+WShQDEOvGfQgOFCTMyRySqK+yWe2nI16eLqBSdMrkUrvFLxhEM0/r47BOmgQ7r1hudqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfE5Z/tbZLiIZMKtTs5MyAD0HDuEth+WbLnHjPXYO+E4Zl13vj
	memzNc8HXomRjelAKK/VPqvv1OiBqg7YVLm4DY0mxXx8msabNckICSaqMT2w2uqlCXs=
X-Gm-Gg: ASbGncu7h1KHiz8OH0hvz4M97sFVGpWu+YrHsWjKBpBnAn22dL91in/aENqyflNgGqg
	KuOpi7+8KtTl1qBSZY1Cnz9KS05VcmWrEh9IPjzL/xzUbPHTpQ+q/pvaLK6Vct/pph9O/1gBLHG
	YKEyCvJGAK33V5dhCiqgldfkDnLP8PsF8x5OQRdb9guWUtjQ4uE/SFAYT5AYhtaLuKHhNlzZV7M
	ZJMDStJhi7QmkhbyrJHQtE/WlBtyQpPk+UtNdKpZ1NpB6BhWe66Wl1Pe5UfWDmi2tacbUO7Za0m
	7ykOyv0wJij6SH50ZHZeeo9rIHyWIZLdQNkzntHAUzXjmebJlL1C/rkiOmzkDJxB/jEsJMIYYlR
	CDDL59uYXlcFXq2iP9FLZlwVI3U7ITAFLzzU/jbexCHzmQSVhJ9tlAd63B+lnXVEX
X-Google-Smtp-Source: AGHT+IGJ3flhCLSOXK3CHO11MPCEW41WFI6YSEJ3lV/vNzkSbt9mh+xtyOKj1hmUEY7xp1DN0bdp6w==
X-Received: by 2002:a05:6000:230f:b0:3a4:f70e:abda with SMTP id ffacd0b85a97d-3b5f351dea6mr2058389f8f.10.1752238696782;
        Fri, 11 Jul 2025 05:58:16 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:58:06 +0100
Subject: [PATCH v7 14/15] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-14-0bc5da82f526@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=JuMfXpzZJqCKUZySt+S5Ow7vJcUCRTmY3zPLXLDylck=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpVZjDDAeLwqpUWjJ5s/P4/FwWYA0N5tDyMB
 J9tcma9TV6JAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKVQAKCRAicTuzoY3I
 Ol6bEADBgHcb07UJdu9PCUH2ZAUA1W7bpVPwuCrhdYn+9S96M99YcP7qC2ifWC8+74sJfcmM4lS
 Okwjo5Z3u0CpvCjnWQzbSshdaWqD6SBjMviQO5CYDE3v2S0cpTBZTpee1OGc8ge2ntEYdQTa7oM
 4IrHt29dO5MSnGBWmjGmeMbzv7Ewheg2TNiP0u9/koOeDmt24y79QdIfRXiCYiljcWIQ6/KLJ/I
 YkCT6gwJw4efDasPr6IxTkyrWNfIAFa0rareIFvJD3uX4Ui7hjB64iDXBsz7SAxv3i/A6uH6vXc
 TmphaR6uAMfPl2kmhuW9rViKM/8R3DEI20JSswtOIf/14lkqqJ/1BMCHpssYDCfK5xoeItQp+Mx
 VdiKu6ZofhQBkh8tF0Lxo+z8DxD3Uq3VK1V2hb5icd3qtVgTqz4NqCh+T4Wv56mVfpKPMNqHdgd
 sZzwNMX/8d2+QkANALvYwgxlGZmdqj5WfEvbMBCCeDP71lBElzi3M+tvlhVA7SXwoSg/2YflJU0
 Am4XKRZCDp21ipdv1QwxTvmuHw0MpZDHPNdh5KFvD/pVBIN1p2/d2Rfj2LAEg6wjvFWqBe/sUU9
 qe5OMzUWYwXEL7Pu30C1PBsETlLOrtZ51pnuRZAJ93mKcxbDuttT9Z+LuQN6Y9Ew82ww3oFN3QD
 FZIxwMqXysJvTIg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l7m_2p8
- vreg_l2m_1p2
- vreg_l4m_1p8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index dad0f11e8e8583df6fd8aeec5be2af86739d85fb..ce2625f8fe85287a16fc3c85cae5d58f99cc6fc2 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -693,6 +693,57 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p9";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.49.0


