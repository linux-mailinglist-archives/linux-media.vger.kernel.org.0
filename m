Return-Path: <linux-media+bounces-48871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E34BCC2CF8
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BD12300BA3A
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 12:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8458A354ADB;
	Tue, 16 Dec 2025 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8McZcRd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B5F350A39;
	Tue, 16 Dec 2025 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887893; cv=none; b=Qb5L9buqhZ6cbKbJB813o9wM7SgP/hFuyUlA2J2nGCWu0geddrwqKsQa7LKnX9IHcsUWavSL7ri0LJI3j4qHHNG3N9HyzxNArbEz9mKGaEuLYDOV8B7iNaaUvYz/lNjvrDzAjAmmfLs7aKf+JfaNRRG1crb4vE46D1zgcZaX/r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887893; c=relaxed/simple;
	bh=KZBaluwWEWCoOA0MTwAvw3NkS3dSPqsemF9OPT/NLR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kB+Vgrr6XFmVlV6jxzxr79dhcIoeQTC9H8qSHXYrnSGqR1J5Cx2W9tNzg+Mslc67Q2feyGgVKtAPhi7dlR1XUXlJZJF8dwg6ATsaSCw00HusC467suCfbZtnBwkEs4RAhdPiBsAL2DD/Qqe5FG2uL/EGJFtm+wnAiDZWYUY5LU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8McZcRd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93BF8C2BC9E;
	Tue, 16 Dec 2025 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765887893;
	bh=KZBaluwWEWCoOA0MTwAvw3NkS3dSPqsemF9OPT/NLR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h8McZcRdQdIQDd1nkxcvJQTto+JWp+mq9KLBZ5KNBUPuEuzgpLglOr1KSboeCniaF
	 K0P8LrZHHexxxPbO41MghY+wRhqDQ37ykzfxv/HDPYrS3WO4ZUKKLbhkgXFRNW1Pdi
	 FObEpOvv9mldjWDHjG1BZvPGGwQ4mtULfoLpVq/r4dOjsc1z/xOzwBPm6ZJzOiBZkb
	 1/qcCqXjpvuLIrLvHvEIlwQcU7YYfE59ErBPSmK4DepDa/w7CtAx6UvtP+paoG43oK
	 9JfWVz+QxGjn3yzbh9O6XwJ4wUcwrHkiHOpZJyeBc6xT2fRRPm9k1q1Gv/OgfWFYU7
	 kQu1Sh5QFG5NA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A570D5E147;
	Tue, 16 Dec 2025 12:24:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 16 Dec 2025 13:24:51 +0100
Subject: [PATCH v3 2/2] media: dt-bindings: Update camss VDDA PHY supply
 description
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-docs-camss-fixes-v3-2-c238b6810771@ixit.cz>
References: <20251216-docs-camss-fixes-v3-0-c238b6810771@ixit.cz>
In-Reply-To: <20251216-docs-camss-fixes-v3-0-c238b6810771@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Kapatrala Syed <akapatra@quicinc.com>, 
 Hariram Purushothaman <hariramp@quicinc.com>, 
 Richard Acayan <mailingradian@gmail.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4654; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=o1IfeCH1kmeD2AhyVITFGOuHp+cmCoNcTXwNN5CzHC8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQU+TCQCkeAwPZxBE4aO4Kvntr0ZpqW67e00yt
 8/hn00TxP2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUFPkwAKCRBgAj/E00kg
 cnS0D/9DRSPnbyyoxLGDn1Qbp04226Ye5x4C3MVK1Y0svTT+7G5T+dH4y+jDAgb8YwhznZAZOoY
 +H3xpRZgLSLikqgHLNFy0QbA6LNMPKzZSMq3fpx0mPL1EBu0ZJ/B9E3FTKEHIyo4/YXhP1iEaWg
 oOUN9NpTbjWow2kZ2XA+PuFCEeibN2gR2I4pVeK0YEobjyemGfnTawI6NmgZa0JcY+w/lV2I1c9
 efu8y3ImppLbDKKXiNmPq6u2eql3DaBqwffo6pURqLiRW9BKzRPEcXqNYIgFhnZdVUwrAT3iiId
 Zq6qFf7D1C34gMLKuMW+DkcY+PXZBDFthP0MRuo8h2cwAqv3z7VlUR6iyiRVxsYo1H3yD9hAa1n
 ciFCA+xKRIJ/cqq848mOnzJ7h+MT25JV38kDIWMAbXy+Kmo0C1P0nUn/A2V06a+v7TpKrteOcAO
 N5KyZgX21m4dtUWBPR2e8tqBDzVpBbSr0v0pYJeUDeVPtlqkmah318PJFSAXIAa68svqWSBW5Jo
 5yCysxL9VsEe8JfX3cttE51zdPU472W2z2xbc//V06D1JjQFE5omqMAJmaBdWrNKJCKczbOl7dY
 ZICftkTR/+bJSPl8Utew/Ge24REJ0TeyK9k5qmcEujSMaCb/BrComsfX4VKWRRVht2rU8/fBoNX
 eFSxtU65zlTvjiA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Usually, the supply is around 0.875 - 0.88 V. Include the information
same as is already done for more recent camss dt-bindings.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml   | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 4986d18d1a2da..5c47a2cf220fb 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -126,7 +126,7 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V regulator supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
index e4b0b7ffdc336..7d180e9cb6fa9 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -125,7 +125,7 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V regulator supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
index 9cba6e0819fb1..cd5e4948b97fc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
@@ -264,7 +264,7 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V regulator supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 61222839556bd..56346b650d21e 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -91,7 +91,7 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V regulator supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index 03b9b34460b0a..008a739a0018a 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -207,7 +207,7 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V regulator supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index acf9c54682107..db5029d521291 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -296,7 +296,7 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V regulator supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
index cd34f14916b42..ebf82a8c423bc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
@@ -134,7 +134,7 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V regulator supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:

-- 
2.51.0



