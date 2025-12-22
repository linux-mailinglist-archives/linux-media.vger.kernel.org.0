Return-Path: <linux-media+bounces-49354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9227ACD657F
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 15:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 026783044848
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 14:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5E52F12AB;
	Mon, 22 Dec 2025 14:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/E900UC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0D92E8DE3;
	Mon, 22 Dec 2025 14:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766412968; cv=none; b=b709jq8F91dwmsz34qG0HgcRP61a5J8DimazfX99ztuC6rJsED/d6g1ibLEvjyU11nulqKkB/bCtyx3XYMlzooQgTXyhWgwrBctjzyAEz2NVgGDJdztqK4rhHj6+D6xZXp1l5fyXrGND2IKMcK0nn12Gwa6+nCAT7l0VD8NObzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766412968; c=relaxed/simple;
	bh=1jBc6qyZ3P/4T37ZcMfNxn0H2MMcyTFv/drl4N6XBps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NPJKqIz6c+LUrriEz8+b+1p6DUsgOjvrQ2XPVDqpPJIqWrunR03IB0VqKzig1MVAFNPWJgvkmPuY5LjfViEUJhEi/o+jQCC6jYP4C7+i2HK6mywVdYvp/lslH1K1OOATo4JK0XY35ZLx2FnLpmNa1q0V04lTto8dnV/j0KTSGOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/E900UC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 567D3C4CEF1;
	Mon, 22 Dec 2025 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766412967;
	bh=1jBc6qyZ3P/4T37ZcMfNxn0H2MMcyTFv/drl4N6XBps=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=p/E900UC0maEYi9VESilWqLLqlpJHNgYZVxKX0GLKLQlwQfFEu0SDxm1n7HJnB3Pm
	 Sy1fScAdSpTe53mDrwEVqUdollxWG3PVykir7MjSpsh7NBwDHY798RO2IbNpFy/9Q/
	 ftFzroPFSH8AuR8KeeDe0nRoWYO0KZX6tVszO+Pk1msOXGsCRuMZOgTTdH8OyMp/Wf
	 6hVybymE25EzBXCyACIWbhpGz1DDBGk47fDT+9cll9XwivRxOLu2dvVKB+HFOq0yDw
	 xI9uY2W6VhLdSyPRzEAus4MA4bkaWvpiVdTbGEB/O4/7P9mIE9mFKXMSQVN7mD6kL9
	 kUh0gerZAQ8vw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A848E674A9;
	Mon, 22 Dec 2025 14:16:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 22 Dec 2025 15:16:05 +0100
Subject: [PATCH v4] media: dt-bindings: Correct camss supply description
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-docs-camss-fixes-v4-1-914a4e5f7822@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAKRSSWkC/33Nyw6CMBAF0F8hXTumMzA8XPkfxkXtQ7oQDCUEJ
 fy7hY2YEJf3Ts6dSQTbeRvEKZlEZwcffNvEkB0SoWvV3C14E7MgSYyEBKbVAbR6hADOjzaAdIq
 JqcCKUUT27Ox6iOpyjbn2oW+71/phwKX9MzYgILCWiCzZOa7OfvT9Ub/FMjXQlqc7nCJXpcpMZ
 hh1rn95uuX5Dk9Bgqa0vOUlyqLAL5/n+QMezGP/LAEAAA==
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
 Hans Verkuil <hverkuil@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7481; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=fEXRciR6Ys4gi4vUzVq3MtNpCpDy6zNHxbkNb0gMhmI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpSVKl5PZ60LGSnxqmENG7hgH76D3/iClAfSrrX
 /EqcjZawJaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUlSpQAKCRBgAj/E00kg
 ciHJD/9V8KxeKCrEzpRWKO/a4XRSjC95uVY87L/TDRWXDsM3cUNSRn5ppsCzk3Za9NwlGI2LIQS
 QuItCRcWVwhnn5a6PSPqH6dh07kcOVNvaQzDFDcX7c3SOrj0QSULiWlVq3CiSem52jDewnRJL+5
 8KHHbFtbksHk9iYdapmeZ+IwvnUfvWMWPuAbtMc08TLdjQ8+ol2jsRhCJDvyPDlrR4VQRnJYPom
 qKj0yNU5rN3QDvMGbslOYKd2CzWGJ8OyLZPwscYUTtNduqBkJrap/GoCCziG0ANIwMQYfvUjodC
 QSlfzfoDrXjnD1tJZCM/Ytxk2h+B3PP4WPAsFhaqxk/rasZMK9wxQvl76uGpYrM6UUHlqci9y2Z
 G3RElnNOeJLgha70I1yzxCQ0Nfa8PRTUNGDE2ju5uznvWe6jupGyNHAGicSK/m4hMe1aY1yIwxh
 SsmIML15ORMvL5Mkwq7gYxInK7jYrwmr4k7o/KGuCzvPkJjj10QMKwLEJPtxlS1qcXqR0cyzxaK
 Kkg64zEkQJUPLmPyyXLcbNxmRWxBHvSic9jVXskue28xIrHiRdvHjhTLnpt1ZlNn47B6ONtONSe
 m1MFB1onn4DhOk9XYL7PpMqDOGNeOK3IQtGCzZTMQmrvIuBmb5PI+RxsWV/67oa/zhdD2mY/Aca
 MuOoUQY76z4r7Jg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Usually, the supply is around 1.2 V, not 1.8 V, and also correct wording.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Eventually, if more changes would be requested, would make sense someone
from Qualcomm to follow-up on these, as I don't have schematics,
documentation or also no access to the internal resources.

Thank you
---
Changes in v4:
- Everything in one commit. (Krzysztof)
- Dropped Fixes tag. (Bryan)
- Updated rest of the files to make them in sync.
- Link to v3: https://lore.kernel.org/r/20251216-docs-camss-fixes-v3-0-c238b6810771@ixit.cz

Changes in v3:
- Add commit improving vdda-phy-supply description to match more recent
  bindings.
- Double-checked and specified it's 1.2 V vdda-pll-supply. (Vladimir)
- Link to v2: https://lore.kernel.org/r/20251213-docs-camss-fixes-v2-1-a8a4d4d51c6c@ixit.cz

Changes in v2:
- Applied suggestion to clarify the description. (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz
---
 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml   | 4 ++--
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 019caa2b09c32..48f280e998096 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -126,11 +126,11 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V supply to CSIPHY IP blocks.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
index ee35e3bc97ffd..b1c54c5b01b28 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -125,11 +125,11 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V supply to CSIPHY IP blocks.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
index c99fe4106eee9..354130aba9fc9 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
@@ -264,11 +264,11 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V supply to CSIPHY IP blocks.
 
 required:
   - clock-names
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe223767..46cc7fff15992 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -91,11 +91,11 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V supply to CSIPHY IP blocks.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index 82bf4689d3300..be09cf3a3b3b8 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -207,11 +207,11 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V supply to CSIPHY IP blocks.
 
 required:
   - clock-names
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index ebf68ff4ab961..a509d4bbcb4aa 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -296,11 +296,11 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      1.2V supply to CSIPHY IP blocks.
 
 required:
   - clock-names
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
index cd34f14916b42..4b9ab1352e914 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
@@ -134,11 +134,11 @@ properties:
 
   vdda-phy-supply:
     description:
-      Phandle to a regulator supply to PHY core block.
+      0.88V supply to CSIPHY IP blocks.
 
   vdda-pll-supply:
     description:
-      Phandle to 1.2V regulator supply to PHY refclk pll block.
+      1.2V supply to CSIPHY IP blocks.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index b87a13479a4bf..2d1662ef522b7 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -120,11 +120,11 @@ properties:
 
   vdd-csiphy-0p8-supply:
     description:
-      Phandle to a 0.8V regulator supply to a PHY.
+      0.8V supply to a PHY.
 
   vdd-csiphy-1p2-supply:
     description:
-      Phandle to 1.2V regulator supply to a PHY.
+      1.2V supply to a PHY.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251212-docs-camss-fixes-0fa525271951

Best regards,
-- 
David Heidelberg <david@ixit.cz>



