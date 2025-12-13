Return-Path: <linux-media+bounces-48734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F78CBA785
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 10:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6723300A295
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 09:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305DF2C3265;
	Sat, 13 Dec 2025 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOCaoqY7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B75475B;
	Sat, 13 Dec 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765617579; cv=none; b=rPKYeGsi1IxEUSsyQBHY0Dt7ZB60RoABKEYCvLZekTw/+Go5iutNUh0mfLZzuuUdKAaON8oneU+fmQyHP7yARYlXnwcvmRowC2KJ85Goq3WdgO9GO+t0K8+QcpsMAnQMgo8DYxCYUN7ElhrLVYCbW2yn9aeqESNuWetgzOp2GFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765617579; c=relaxed/simple;
	bh=ZC6LKSjxQS22vl80g1WT7hEClX9HmgidrrcTYvgfxQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ffGLEuaZRn+p/6H/2/JAslzmmEEiqBCATxiCHDqaOMg2xUvp+JU9ogLRs0BodFVhAkUmRgxGDL1hm/M4cGcNL1310HiVekIgIOwzNsP5mGAFXO/4nk+h2oVlMlmEuZQIKFDxtUZH36wYbaXaiyCvrar7IJK7ScJprb/sGAAMXQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOCaoqY7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEC56C4CEF7;
	Sat, 13 Dec 2025 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765617578;
	bh=ZC6LKSjxQS22vl80g1WT7hEClX9HmgidrrcTYvgfxQs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=TOCaoqY7sMkhA3OleCmwe7rowMa7Joehl/7w1iKMeoAVCtQKfARTDK9vMvCIGKgCh
	 4kF18cAhyQdiM0WLoQyP3qnV/nC0GYdx70lyuM0IAWBXcWSDh1/tijkhv52AZ+7+RF
	 Z4S5F+okiQnxcOYHBzp5YBRy1h6jZW2IBxkWBu2CTVmepDC/ekVgcTgasEPu8vPgCo
	 amFWfa+Xid9w6t11MbHQTvVvyMBTrl3FRZHyg36IvekKKuRwc1V+MRwewQQ+e2P6dE
	 peX0fHEcAEIgmX2aOdfUU5LoO5YZRiN6omB4eobtf8n7NrxG/Y9zxB7PD6I3zfEbcZ
	 9ojLqsZ6wUKMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B03D59F5D;
	Sat, 13 Dec 2025 09:19:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 13 Dec 2025 10:19:31 +0100
Subject: [PATCH v2] media: dt-bindings: Correct camss VDDA PLL supply
 description
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251213-docs-camss-fixes-v2-1-a8a4d4d51c6c@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAKIvPWkC/32NQQ7CMAwEv1L5jFFsyULlxD9QD1GaUB9oUFxVh
 Sp/J/QBHGdXs7uDxaLR4NrtUOKqpnluwKcOwuTnR0QdGwM7FmJiHHMwDP5phkm3aOiSFxa+UC8
 ETXuVeBTNug+NJ7Ull/fxsNIv/TO2EhJKcETiJCXpb7rpcg4fGGqtX0RqAwuuAAAA
X-Change-ID: 20251212-docs-camss-fixes-0fa525271951
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
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4520; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=n25Y4zdV+bOupKAPE/Z72jIjyFFWI3setI3tH0lwlkU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPS+piNuPUubfl5wYicf9pKpGHsVRbXsc5gQ34
 4Bia4zvKpuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT0vqQAKCRBgAj/E00kg
 coRDD/0dr2HxjAAd0+/Zay0CACnHM3LBMMaf8q7Ij0sAyl59yDYQaMOi7AaUuS/DolXGFJiG1yK
 EhmJGtzGDejdaU2lwjBWoV/PfBETVol6MhQzoBfHkxDlw8Wfs0lFst0/72josSLKUIkY5A47oAW
 lhrSfPbgbIc76sWY7QoPZAYl0lPOFwbxMSBYbfIKoH0juf6MklKIElDQ8qZ2E5VvkSLNRrymsh2
 UUWt8DfG2IJoMYQttatkjwjWCG5EweFwCCpAtJDRD01+vftvIY4xq0nkpLM6pPd/t7QsFzYsAOF
 PV464c+fKmukc+cYAMjmM4oJYpL5j7AlX3mUOjG1xDswEc47073k5jFCgi3US03Jv7eMNNDYCsG
 SO3zosd4tAqvKGopRcysBtoxD9QHddqFjKPoERPxSVCR2Hp7v063p2iv6NOMYxDqnL1F6wKCXMi
 19Hl81mWw7ra7tkd/ndNHxfHVGOrdTDzr5Jj3nslNEsxRPzSTUmY7bgBrmyWMBbXRHtKKTciX3Y
 mbY5OSGu7UVLqU8i2oTfLmgrs4Y/2SqkWwQIUNwZN8R8h7sDMs3ckCfcEtFqtu6YGUwYnulRkKf
 jWWwDsgFDyxTZ9Gtz/SLPgVvZTwLNexiCZcIwnQyDOIbecyKttJA0M5rDzbT+2AmNaWKTXeHaw4
 y4ShWRYcJI6Bi+Q==
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
Added only Fixes tag for the initial commit, not all the copy-paste
propagated ones.
---
Changes in v2:
- Applied suggestion to clarify the description. (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz
---
 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 019caa2b09c32..cc48c0e50853d 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -130,7 +130,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      PHY refclk PLL block supply.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
index ee35e3bc97ffd..c9464192373d3 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -129,7 +129,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      PHY refclk PLL block supply.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
index c99fe4106eee9..6641084449670 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
@@ -268,7 +268,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      PHY refclk PLL block supply.
 
 required:
   - clock-names
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe223767..26fba2c0ceca5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -95,7 +95,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      PHY refclk PLL block supply.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index 82bf4689d3300..34428171d6e38 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -211,7 +211,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      PHY refclk PLL block supply.
 
 required:
   - clock-names
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index ebf68ff4ab961..0b3a3d0e26453 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -300,7 +300,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      PHY refclk PLL block supply.
 
 required:
   - clock-names

---
base-commit: d9771d0dbe18dd643760431870a6abf9b0866bb0
change-id: 20251212-docs-camss-fixes-0fa525271951

Best regards,
-- 
David Heidelberg <david@ixit.cz>



