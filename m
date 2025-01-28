Return-Path: <linux-media+bounces-25326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CADDBA207BA
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 10:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3580B168ACC
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 09:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08B419CD01;
	Tue, 28 Jan 2025 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LBIAbyj+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731F1198E78
	for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058043; cv=none; b=dcpNNewjP0q7FzsN0/9pKi5PJQfMD8bViNfFphemEJwm7frGg7vJJpgxVyqFInm++lfRTDbUpjzyP9E4faLwBn7TZ6L0fRv0tV9vG2g19YWzvaGxk0CpB3shYb/x6qPu9So3TbzEhctjMUZNuiYF40+oB8U0adn6T37d1hBDLuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058043; c=relaxed/simple;
	bh=NQ6ugZuFusyIBLTqNAToTvLloxPH1ohbfhkFV/P7xag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ooMnEviDxa5h+PNq9I8GsujQ+udqPjSGIqzyTEG/RPGGcedrOQuOfZtda3VPRq+wrUSEkx9B8Xiwkph43ABo6cHFgLCkbFLHCpyqwO3N1RuWvgbLjhKIJQqfAFsg5kjAg/eXtFJ8wCxSKtKTCgMckF1zzkv/zaGqsaukqrwb9ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LBIAbyj+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43637977fa4so4627405e9.3
        for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738058039; x=1738662839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gX3wCMKWuGdO9a8FLqSF+Jru9DaiVGtaRKDUVUUwAh4=;
        b=LBIAbyj+JuYdRwiS/v5efdibieD4f4gR1PzJh7k4gn9dYGIytmB5Gj4391wMcVgOaK
         Z2elCX7SOCJpoQKIvxzAePItzX5VLZrqAdtsD18JryF7DG+6pGESwFmll26QIUN6rRM2
         ZkTCRc3l8vpK5sHku2a0XCK/vNAyboNyBF2j6dgFa89/9ghm7udrwsBwt2OXiFm7sxtW
         XOOSXu0mRfrOZw81cbe0ayTBCsDlQf38BuSzcxpF+TeqzCL74Xb9kxg2Mmps7dBsZfVW
         enmNdTzIZ6WpHOSpt8MStpxqdvCsb7Zf2L5HwHwAnx7hMtkfM8mnfPKhfB2xPo7Eb0Cx
         K6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738058039; x=1738662839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gX3wCMKWuGdO9a8FLqSF+Jru9DaiVGtaRKDUVUUwAh4=;
        b=WEbkDWy3eKwMoUbn3jmahTbyaXOAQDCF+bw3us/kTF1WyzqgHDPm6OSawRsy1l65pb
         3G1DwlZYKqw7eygQ/b/tDlVbeLhGtyXVFHC9G/EXK+HyrEdR0CM7D7izk4KarWiQ4gD/
         +DScrGkdab9QoZqpXB5jIE0QkF1C4LJ48jtfP0C8OfcznFxzJPcLoPpkclJ63XNP/Hoe
         vvpZLjDoKtTcQ8ud5R68MM3BrbZbF7lz9hL0QqSeY7xRG2W5yqWc7gjZExbPIsxKc0os
         pXe3AkfjDY0XaYu7uVir5xXwF47sWpiujHN7mMzmCZBUKoX+YwZbo4QWlZeyMH6F2/P5
         TXfw==
X-Forwarded-Encrypted: i=1; AJvYcCWENfIxU3kcbciHbFXyqeWb+kaq0jQVI8O1C8z/gRtF6ULMh2iu0G2seJJQ4O4BpGqJ7hB3sBjd94oy4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc7Msn+UYa29aE84NhH/l9vWNkdajPV1TWOzqeK1fRLlyord3j
	G6h+MPcwugqEGghdn3+M0sKyYpQcorSLlwhDgt1U3hGHzv3WBWsaV8RCDJsPP8E=
X-Gm-Gg: ASbGnctfapjx9qgE0be5CUzGigXTsFVU9/S8SOT0CKSJtSBIjgZDbo2SqXxn2cIYD2r
	IkBNWtLigl5mvi9R7AJiWdL1Hz6ZsWn3bZykG0KyzFeWaUtr+sGuolzAuykzJ+AL9oDbsWS3aPC
	32zvFZSUT4Cw3CQHt6vUmsKGYTBqwtdGeVUNDwymRa7NChBoDja8W+4dztRbWjyMsbgDtByCMEr
	L5IcO3NyMiZG86tk3Nm0x+HDxvr2vAhBEG4DUXnL+Oid6BDJ+BLrtcav1zSat1meVJcOIWunj1z
	+r2Y4/+BSkw2P8A9Qeo90G4czt4c
X-Google-Smtp-Source: AGHT+IH2lJvke32NprHWtE9+fl3bZUwS8VksN+GlfIiEv0zBLl3ziaJ2HPij7vJA9/GwRDVHWl9vUQ==
X-Received: by 2002:a05:600c:1c23:b0:436:488f:4e4 with SMTP id 5b1f17b1804b1-4389149cc76mr150353635e9.8.1738058038800;
        Tue, 28 Jan 2025 01:53:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48ae56sm163002455e9.21.2025.01.28.01.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 01:53:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] media: dt-bindings: renesas,fcp: add top-level constraints
Date: Tue, 28 Jan 2025 10:53:54 +0100
Message-ID: <20250128095355.65766-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clocks and clock-names.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add tag
2. Move clocks description to top level
---
 .../bindings/media/renesas,fcp.yaml           | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index f94dacd96278..acc08ba7940b 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -35,9 +35,18 @@ properties:
   reg:
     maxItems: 1
 
-  clocks: true
+  clocks:
+    minItems: 1
+    items:
+      - description: Main clock
+      - description: Register access clock
+      - description: Video clock
 
-  clock-names: true
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+      - const: vclk
 
   iommus:
     maxItems: 1
@@ -69,15 +78,7 @@ allOf:
     then:
       properties:
         clocks:
-          items:
-            - description: Main clock
-            - description: Register access clock
-            - description: Video clock
-        clock-names:
-          items:
-            - const: aclk
-            - const: pclk
-            - const: vclk
+          minItems: 3
       required:
         - clock-names
     else:
-- 
2.43.0


