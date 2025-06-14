Return-Path: <linux-media+bounces-34809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 370D1AD9FA3
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 22:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 328727AAD89
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 20:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0EA2E7F0C;
	Sat, 14 Jun 2025 20:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1JBFg5R"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCC41BD9C1;
	Sat, 14 Jun 2025 20:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749931521; cv=none; b=IRAv2citeY85WdPv7PRHR0zcqXj6IsGN5bAUDor5wJN+nU6nl0RLDy5yeloi4neP+weRBKbw4FfbwkzLVPrOuDS45TxA1/vd7NGnwC0dGIINjEJP6mChNA/edTUvze6CaIhbx96vd/nVcipiaToFUoBesKtwSRGK16+tc6ZVo3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749931521; c=relaxed/simple;
	bh=slRsPvk4x7D7++RNJlqHaH2v5niYKW6vSDS25QC8uAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ctYrwoVBPQ9sl4oEVS1usAiPoximU1r6Pn/AM1Ve2On5M07sHjPGpojG+lkXddZzO7UqVeljqXfKm2rp2NQUq53Y2XYDP4UiyLefqPiQ5D/NlZHS8NUlASX+NsLBKO6qX3sobfhBkmvKCwLCT3FPcXE5veorItz8uaY8Bnh7vcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1JBFg5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80BAC4CEEB;
	Sat, 14 Jun 2025 20:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749931521;
	bh=slRsPvk4x7D7++RNJlqHaH2v5niYKW6vSDS25QC8uAY=;
	h=From:Date:Subject:To:Cc:From;
	b=k1JBFg5R/IQN3bNpA6vRdIxHOha+XRAas3nx9mmLWUTjzZInsRqx2PPVRL9AIDheu
	 CIIti5roiN960cJHRNUKzvHuHebEACfvMqAQ95tQQ3zypNnwY0ADyb6t+cdwBHRZhM
	 6v30iijqyvLiigSEYcLjR0Ea07kY82mYqD0GHvHAdf88V15TZiSkmIQTwYd1ovkEKr
	 zLDMtO2NibjudGnO8/T9+qYFV8/ExoEm3Pu38Qu1hwOiutWK577mBVsst5X97Rl2eh
	 KZE+WCMohnAhD2twsDQl0UajR8+hquUgL1epTMLI/3f8HZUVg5g0JOw4GPtH22A38F
	 sfG1BLjVvfIJQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 14 Jun 2025 22:05:09 +0200
Subject: [PATCH] media: dt-bindings: qcom,venus: Allow OPP specifics
 universally
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-topic-venus_opp-v1-1-5ec6f64f395d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPTVTWgC/x3MQQqAIBBA0avErBMsrKSrRITZWLNR0ZJAvHvS8
 i3+zxAxEEaYmwwBE0VytqJrG9CXsicyOqqh5/3Ax06w23nSLKF94ua8Z4YLZSYpj31CqJUPaOj
 9j8taygdoYGusYQAAAA==
X-Change-ID: 20250614-topic-venus_opp-f04af788db7e
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749931517; l=4350;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=k/9QSJMm1AvzFa3EOIGbiuIbb9WoAR1TLb3OICDsOUA=;
 b=cnGVtCTeKaFK28FxSnvTX5qHxtYHP8F87l5w8Xr52+C/ygT3fpOE3A6U0BjvPFJQk8zvM1EgA
 hLTEfaknoXgDVeWa8zehab2O+T/laNrjSOhQOTcrnPc0qdFR4C4DqWA
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

All venus hardware has a number of OPPs, so it only makes sense to
commonize the allowing of operating-points-v2/opp-table. Do so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml    | 4 ----
 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml    | 4 ----
 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml | 4 ----
 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml    | 4 ----
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml     | 5 -----
 Documentation/devicetree/bindings/media/qcom,venus-common.yaml    | 4 ++++
 6 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index bfd8b1ad473128c974bce84639cb0aff59d8c2cc..e5c05b9c1e914a618a71b86a75ff5516556d55ef 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -61,10 +61,6 @@ properties:
       - const: video-mem
       - const: cpu-cfg
 
-  operating-points-v2: true
-  opp-table:
-    type: object
-
   video-decoder:
     type: object
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 413c5b4ee6504ba1d5fe9f74d5be04ad8c90c318..0a3b3cd525678b13c201f417f418de4927ea1d8d 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -54,10 +54,6 @@ properties:
       - const: cpu-cfg
       - const: video-mem
 
-  operating-points-v2: true
-  opp-table:
-    type: object
-
   video-decoder:
     type: object
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
index c839cb1ebc0999e10b865f4bb43ea76ffa2bf46d..c177c96d6bd1d4e10de816a330b4e7b1c6e3f3dc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
@@ -56,10 +56,6 @@ properties:
       - const: video-mem
       - const: cpu-cfg
 
-  operating-points-v2: true
-  opp-table:
-    type: object
-
   video-core0:
     type: object
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index da54493220c9dc90e7d9f5fcfce7590acb241c85..89db76817be4c6a8d10e46b95546397e85481988 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -51,10 +51,6 @@ properties:
       - const: cpu-cfg
       - const: video-mem
 
-  operating-points-v2: true
-  opp-table:
-    type: object
-
   resets:
     maxItems: 2
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index c79bf2101812d83b99704f38b7348a9f728dff44..c2076e80bb5c5f976384875f0406bbfa2cd6f100 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -69,11 +69,6 @@ properties:
 
   dma-coherent: true
 
-  operating-points-v2: true
-
-  opp-table:
-    type: object
-
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18a327559dd750f152332cdc652ac4..67f0e0f78c72756e9d4ccc34def3da1402b7aa38 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,6 +47,10 @@ properties:
     minItems: 1
     maxItems: 4
 
+  operating-points-v2: true
+  opp-table:
+    type: object
+
   video-firmware:
     type: object
     additionalProperties: false

---
base-commit: bc6e0ba6c9bafa6241b05524b9829808056ac4ad
change-id: 20250614-topic-venus_opp-f04af788db7e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


