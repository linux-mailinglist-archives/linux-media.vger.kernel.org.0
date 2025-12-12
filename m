Return-Path: <linux-media+bounces-48728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94ECB9FEB
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 23:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4052B3017676
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 22:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973AC2F9C37;
	Fri, 12 Dec 2025 22:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJQiAb5/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6613FFD;
	Fri, 12 Dec 2025 22:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765580159; cv=none; b=c/iphP4TChiTW70TyrzZJQJc0P5p3VpUskRojEQ+GDmqQ4eidW7/1nz8fapq1EUkXq/iNVdVphW3M5YkUaz0OP6VjGAKrf1NfuTUPqSxbewHTK8ehlRT2LL7EKgbE21cw6F6OTXQtF4JDKHsQz/HUSIxXzmkxD4N0FtsvBlHiis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765580159; c=relaxed/simple;
	bh=Z69HFHhLeuWwH+CGK1nhOtAp3UyvN+1Q71kH7nxiK7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UlKvo9BckOZSeoiF+wWeIRUTO6oEJnmVjijRCr5kIuLi3s7TGmQvSQEQaZ/T7R2Cn7xroK6dlK+sIZi+X+/A61FCf97DEWqsSLFsdErvkU1KCkzvfRp+743Y73VyUTf2Ts3A+qa8L7WSWp7yUIEJmbOMZ35fVm1+gnbVD4iOZzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJQiAb5/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AE5CC4CEF1;
	Fri, 12 Dec 2025 22:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765580158;
	bh=Z69HFHhLeuWwH+CGK1nhOtAp3UyvN+1Q71kH7nxiK7g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=PJQiAb5/unCdAIPRLyHrtm+krBIqawMi/+tKCckZSotwcV1T416A29tCosEXTWcDo
	 ld1Yts1GUmqbS1IQe78Xljl/hnLx4FIxJI/B9qKZhOd5fR6fwBmhUjlrnonVCRC2ID
	 ddbyLq6Pi2LDO4LGmmdOteVwNIihk8Ob5ajj46+js2LC+YfwS7YMfqBxtSpt3qvPl9
	 fhWF4gIPK8bDqA/35Gnd7y5l8H8I5mGj5fn2pQr8wDtAslzQoNTA0PeDDakuxNqsRi
	 V1AdEP3Z+DnH15UG0FZJePnF1kGaF88nzraTKPGyLApmpWHbog9qOCiX+8XrqoCuiD
	 QZ4Hh3nFpDrbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299C3D59D7D;
	Fri, 12 Dec 2025 22:55:58 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 12 Dec 2025 23:55:57 +0100
Subject: [PATCH] media: dt-bindings: Correct camss VDDA PLL supply
 description
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAHydPGkC/x3LMQqAMAxA0atIZgNNoIheRRxKTTWDrTQggnh3i
 +Pj8x8wqSoGU/dAlUtNS26gvoO4h7wJ6toM7NgTE+NaomEMhxkmvcXQpeDZ80CjJ2jbWeUP7Zq
 X9/0AgZgaumIAAAA=
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
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4488; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=qHMgX4yIAZfT5HLJApJFTrMsi2e0Zb8+cULYJUs4ldc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPJ19rhf2Bu4oI6wDHizm+ItUDiSmkginGNU4W
 h8yd9I5zFqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTydfQAKCRBgAj/E00kg
 corlD/0Xs0msufVJBrB5kVHvPM6tRGweLZPmBRHdC2oJCgJr6zNu3k4CJmEeQTqLZvsEQIozH5J
 0w0Y5IWbujAOXk6HfY16QUQhE8aS1kw/gGfVV1od1FNuKQS5bm6lqZ1wbZf67vlX9En/ZgxfVOe
 Nb8ke6kJ1gVjsbKprAJb4HLr01haX2MCjUKSlfwuJ7ny8C00pmrLi1ZN2y/Yo11zJmRnbWSC3ri
 i0dPwPK70fww0rK+hXVKS7DJ84TJ7bG3ovXjbs+oa0a9sXKeDd3lFvJ7hvLc7ooStsn0Tmec2nf
 iJGYf545z6AZRrqHAhaZ8LYdzmtJ/0XHjEjV1wyBazeUBG8ruU23ruWW03x08Us2/IcjGS7WA+r
 MDEJ5M23rvb7Ye0RFotYLTOcWMyiQyMX0fKVTNl+UtTwbMYKrSUqmHEoKjtcEcw+DHZ3jspMZ78
 eAyiR8aexLiTnzi8ZnEXUGBFb/NwNIumbHg0n+Ze7zvqdXn5/yQ9TeikB4j+f8HDAk1s1UjTuKX
 XexS7mqyKLBinAO3VdJQH6XQoFHi9A8bNchUWaOVBlsyUiK9JCG2JzXighwCqkn8b08/hrnutbv
 UEuj+GsBJAl8bnE0S/RvtIT9BuHLLaz6ONMrjlNSFcQ7kQd9rXpPUrOBrUIyXrfWzHYVDMCM6Sc
 4YD/MIMIf5EZu1Q==
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
 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 019caa2b09c32..9009cfe993d75 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -130,7 +130,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      Phandle to regulator supply to PHY refclk pll block.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
index ee35e3bc97ffd..cb922f90fe900 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -129,7 +129,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      Phandle to regulator supply to PHY refclk pll block.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
index c99fe4106eee9..2231d7216f62a 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
@@ -268,7 +268,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      Phandle to regulator supply to PHY refclk pll block.
 
 required:
   - clock-names
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe223767..8e6ca94c88695 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -95,7 +95,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      Phandle to regulator supply to PHY refclk pll block.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index 82bf4689d3300..d50e096b900db 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -211,7 +211,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      Phandle to regulator supply to PHY refclk pll block.
 
 required:
   - clock-names
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index ebf68ff4ab961..ccd2d024bfd10 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -300,7 +300,7 @@ properties:
 
   vdda-pll-supply:
     description:
-      Phandle to 1.8V regulator supply to PHY refclk pll block.
+      Phandle to regulator supply to PHY refclk pll block.
 
 required:
   - clock-names

---
base-commit: d9771d0dbe18dd643760431870a6abf9b0866bb0
change-id: 20251212-docs-camss-fixes-0fa525271951

Best regards,
-- 
David Heidelberg <david@ixit.cz>



