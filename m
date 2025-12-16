Return-Path: <linux-media+bounces-48872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE50CC3080
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3CF430AA8D8
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 12:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC1C354AF2;
	Tue, 16 Dec 2025 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FW4Q5IGN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E9350D5E;
	Tue, 16 Dec 2025 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887893; cv=none; b=Qs50LZoXAL9BSfKlks2EEUzjZV+GnFBwC6o/9FBS4C57gS85b1ZGuX1eTZlNHRB9f/iEGsaPJTLgLdMQpJVDB9tBOQ2y6ZSg3u5DF7SQfbuoetqWNO4ga48s9d1B5SAmiiLES5a4TNenysF2wqo8s5lCf0Hf0TZnpPq6a0sQz4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887893; c=relaxed/simple;
	bh=EQsM886hquE0ocrQAjgkIVKcFCG/cnDW1MW9d6pbnRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nNtYhzJbk85PH1hAZdwGNxgh2Ya3yHhBqDxoMptduPLv6DuSOzlFxJ0hzo3XOIwH68bsk1Mgo3cC+x1dFnrl4dJYnwDJJF4npm2RlQ3fAZvK0j99y6F5524gDeLrWQyuwyZghOoGka860F3/RPr4tGUv4Vo6sEMajoaHaJZySc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FW4Q5IGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76AD3C4CEF1;
	Tue, 16 Dec 2025 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765887893;
	bh=EQsM886hquE0ocrQAjgkIVKcFCG/cnDW1MW9d6pbnRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FW4Q5IGNl7DYt+wS7KsI67RwMi5OuMfBKWPlkw18leq22DiVtJErC12HIyzLJwn0p
	 Ap2u5KrpstP6kJH5XPlAG/tblL9N8qEdoNju6miYvR2TQl8BLuE+a5yCICNW8MDZ7Q
	 MPlEktCgzikg74k73gDcz8kr/VvG1tTP6bKnY29108Zugu6WVRNndGwx7jmYN2Dz0n
	 eKbs+n7eBSwOyHAKD9yS8l6DN4Z3A2kJd35L+OynoSUJyr1s3pRVXSlp5PX1RrvxHf
	 kAEB0NENUvzvlDH+7PR1svlJnZo6ftoWDFOHieCR+lBn/Ho9nDhAkDgNULNPJE9P71
	 wwd7PC1zs0Trg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F533D5E146;
	Tue, 16 Dec 2025 12:24:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 16 Dec 2025 13:24:50 +0100
Subject: [PATCH v3 1/2] media: dt-bindings: Correct camss VDDA PLL supply
 description
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-docs-camss-fixes-v3-1-c238b6810771@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=RboAbdtfza+6rpP6+37BoeslOcwbopgvt6vIQ06lVT8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQU+TYnM95O1xR3nh3MzuUEdQy0pxVzX4hkbBc
 MXufBHmXbmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUFPkwAKCRBgAj/E00kg
 cj9/D/9uhriJFw8d8LyuV77Ub4Uc0xwo5OhpsmOuQeeESez20Q1uszOUOtXxomOxze9HV9V+t8g
 7kRvbatumTPXGY+6HmyVHczsZyp4MidTJ581qFs4Nnc+VPY6mS62ADYUS/O3pKi49RhuypC23xc
 sKq8/rms0J3n/jKArls8t1mK0Lrmwd1IryiThiyyD3qUS7LA+QU6y2WolzmpIy51eQrWY7VDdNs
 pvnfgw0N0JQ/l5tSnWjq18SVTotynUXmz8AB3GE6kWFuGzd1NuCLOoxjimAMqYw+spFTS73+G3d
 WW5A+cmFDYv2bl6pel6TgoM8IRBKRi/QQi2rfGEc+pKvFKJCF7mdr3IHXqcavXBIt9U2/TjSt6f
 JeS2BXtZcP4vp46PO8107BHUI+RE/g0EkzbrL2bEcxPRpC1KAxQFtkUn23S0nb/pI7Pjbsn5liK
 v4mBV75aJiDrLgtG9ElvUVOanRlJICaDBNH8mtjt69pxvYxCxJWEvWWEmpOcSvyOI0QXdHnYFJt
 KVeDjZLnmn9bXNWeXDp9BeCAefhv6ive6y/m1yS9dwGAvCneMJ6q6qNEaBcYfSqcxeuAFRNAc/1
 SCOdC9mLoCVSvL9uIqX+m4j+hRZMX4+XfqQRN9CDet5oleg3BX8/aQzhiNDlLjbbuTXN7GQ0iYB
 kbfMN4iHjl/q27Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Usually, the supply is around 1.2 V, not 1.8 V. Rather remove mention of
voltage from the description.

Fixes: 849139d46d09 ("media: dt-bindings: media: camss: Fixup vdda regulator descriptions sdm845")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 019caa2b09c32..4986d18d1a2da 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -130,7 +130,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V regulator supply to CSIPHY IP blocks.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
index ee35e3bc97ffd..e4b0b7ffdc336 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -129,7 +129,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V regulator supply to CSIPHY IP blocks.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
index c99fe4106eee9..9cba6e0819fb1 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
@@ -268,7 +268,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V regulator supply to CSIPHY IP blocks.
 
 required:
   - clock-names
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe223767..61222839556bd 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -95,7 +95,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V regulator supply to CSIPHY IP blocks.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index 82bf4689d3300..03b9b34460b0a 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -211,7 +211,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V regulator supply to CSIPHY IP blocks.
 
 required:
   - clock-names
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index ebf68ff4ab961..acf9c54682107 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -300,7 +300,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V regulator supply to CSIPHY IP blocks.
 
 required:
   - clock-names

-- 
2.51.0



