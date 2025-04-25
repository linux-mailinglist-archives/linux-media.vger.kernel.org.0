Return-Path: <linux-media+bounces-31058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218AA9C87E
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 14:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 860294C1ABB
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F4F24EAAA;
	Fri, 25 Apr 2025 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/eR5EQw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D278424A04A
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582519; cv=none; b=u46mbW8y+GGptH5PcPC40FOFPGkMjltJCxU0VW6uDiLsoNeu1gCe2ltHVflvmIckhziT+IFbgI5lKPSS8UC1qE/UErZ9V8Jg6FnsmCgFjbNiN+zWh6nhKhqVvFYRZtgGUqLi57QLHKGp3kVP1VwmekaMMFxceibNylLOdqGynL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582519; c=relaxed/simple;
	bh=/d6x59FsbXyfCoK8acmz8NJpqeM3LKYXyt+zeXsdhDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5R5KXgehFd7j0kL/cOITifA2A9H6/pdoU175tf+zilHq7fK/8On9fWKygHNLQXblBWpt1o48LUaYxnR0DIEN8V6KLWCtMvbegUpOo1b6t8hjkdn5tNIQLz9LT6nqh6L/QuQwyqrI+i4IP60AGne0gJIMMfop3nj/ZG4QIcuBFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/eR5EQw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso20775505e9.1
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 05:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745582516; x=1746187316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhE+Dyz1wOpvAJk2uuIrq2Trm7OKDV78hrVHrvsSei4=;
        b=h/eR5EQwrBpKHBbG2jYmiZkRDhXc4l2sQRuVH/nUccqHaN3OAotX7YOVqQZISnM6qh
         4nmy7B4Vlm8Z3BWTaABz7vstGhiPqYn6QE3QkfzVtTE3TSvCTSjDwA+Ldn39y7hUOcA+
         QgdqEkF5V4IIEdKRjPhe95iYvL4ubTEaXLdEOwm7KXb/byQIoF9JxKZI1Hq+X1WAe+CC
         zDX+mcWFwpRVSbalqUpKy6nShBGnOgt2+25+Hl+4IQ1PWVNhgxg0uFldRxqTMZoVBr6P
         sBZWsacjf7ijsk7QQ7KycghY4REvqD1NmpTUJSvflbh1CBBhb7jGBvb0gvSPXb2wgRD3
         djxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582516; x=1746187316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhE+Dyz1wOpvAJk2uuIrq2Trm7OKDV78hrVHrvsSei4=;
        b=NH+OzPfIHZkYUbKN9aufA75FiRGRQePC00ghjLjIjk6y8vr3L+Sr3x94HG2tFqAHkX
         Q9woYQvLDmO9U4w6Xw8nwwzExGHxMhY54AIPvXqmkFsB7VRdqoCva/KJ2pFh04J5vzM+
         oGs8zNE7/MAD6OzCO7IxXCA7fkQmzIdKB3+RuNHjdjbUSh24qrfLpFD9Yy4ytP9u+Qo6
         P4jgsSIncqgw8hxk/4ovGTYBRogU41brP6JVP+jyGnaiskwYjfYyP/qntSfZBE73DiKb
         wAuNnooKGSuudVVnVRsz9VnXWJ9DqIURZADYFqafRCcK1KitaYhnkBwF6usjORYBFsVR
         H9+g==
X-Forwarded-Encrypted: i=1; AJvYcCVgztAfz6mVW3MZKG53iZHI7PmHPJO7S3/hAjVrL6OlB8ETUd+OrvzpDBuRJyMP8qCZYt3XJBjvw+2c6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgIKLGXBS6yhGVJXaxr7SHJSpaC9fFHG6xsb4TpJj7Y+svWUW3
	xCwg5982X+OCKqh2GgwV1G2xqDAKsQQGOoRKksAqyDccuDE0otc5pbeY1XXsalA=
X-Gm-Gg: ASbGncsdp3WE4UvDYymNCjkJf5KlaAxlm8aUHP/Rz5rjXMrOd6FgllK/imBLT1r6ueT
	prOkHhJdSiIxBdV1/HXmUkSf0m8wFTqSiaSWYWlfCbZNya0zCmd4OfSpLluiOmRXHZ9iyuZ4RcT
	iVNFm44pYRiHsqgZKtKk82JHs3pmNRR5WG2ohi610H4G6nk5YhclFut33OahGtXN3R9YFKNlRCP
	ENybbh4pXTGb3i8jrxbiLnoc6S2OO6gb5o3eKCqoEBtfb8hTSyw9qGJl4tZkHSWxzkCsh5ebZmk
	p66yzxdAu1ok3bhf6gSKKgLUaZqJe9tUy+UznWPU1fSoapLdE1P6WbWF9yqm/Bq6xgsgsBFUBjO
	5XCHDnQ==
X-Google-Smtp-Source: AGHT+IFHLlJzP5BL3V6sFN04q8JXr4Eh6yXMm48K9yC7I70ivFzicvWZ/rGjCxcg+f8noEGCsOnkoA==
X-Received: by 2002:a05:600c:1d20:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-440a65e420bmr20732465e9.10.1745582515548;
        Fri, 25 Apr 2025 05:01:55 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530f6e6sm22648985e9.17.2025.04.25.05.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:01:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 25 Apr 2025 13:01:51 +0100
Subject: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Fixup csiphy
 supply names
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-1-2a3dd3a47a6a@linaro.org>
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-0-2a3dd3a47a6a@linaro.org>
In-Reply-To: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-0-2a3dd3a47a6a@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmitry.baryshkov@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, 
 vladimir.zapolskiy@linaro.org, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=/d6x59FsbXyfCoK8acmz8NJpqeM3LKYXyt+zeXsdhDs=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoC3mxgLk+ZrgfFS0o1d0z07eCsMd581/ipTLzk
 Zm4jsolLV2JAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAt5sQAKCRAicTuzoY3I
 OswSEACBlHM2WhbARrwSwsLpzQiZfXgr/AMoIeiRZDfTZsdA3omq2r923t2zOQ+b1eAxDA9dF04
 XxLbX7JA7z/c9lRAn8lbFmsk73j6ifowg541sprVtVfEU8g8oRlnUIrz+wyDiVWTYtOs+71Jtxf
 URvQv3wHJv3PJQRmv380xH/bwWmmhqBY8xQiSpah2w1bvnzRo341HomJqWH3F4M0XUD6TQu4P5m
 vnC4r2Tq0aGS9pQ2CiRAhswl52qLfNhyG0OZ+0qvJ46/S9gXgsoNdtef5XhuJIWxH8FYRKPGJwp
 K5DibzQXKKeCBSRvpinQG6+MOxEEgkauFHLBw49Tx8DfY6lNIa4hMRaKU75Fy/XfGwlPbASfzLs
 bfdMAn7YCK/EmPoLC4WrgkudzzlhW9fWUbKp5ttjWDxF35h5OQG2QUr9YmYuWqlvrQlwC9MYl77
 WFK8gS+cTfODfdYxZDVH5LiK/9s/SCC8t0Cl3x1HeMCcXGJDaO6U+FG2CA9EFrMFSNjl1ERDTr4
 oAcGHd3QTY8AIhKwWC70V1b2+gP02OhVEvxhsqxt4p8Wkj5Xkqtisgi2h8stgGbZRudukhw0gmN
 rUEhHtkhYhb8GvSJC3q4WKxdCd1VlN8S26Ul/Nv/79ZKdI6eRXIjm0WGYyFFxVNrDLKVqgpyctf
 EspYC7I650RQLhw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Declare a CSIPHY regulator pair 0p8 and 1p2 for each CSIPHY.

Name the inputs based on the voltage so as to have a consistent naming of
these rails across SoCs and PCBs.

There are no upstream users of this yaml definition yet so this change is
safe to make.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 52 +++++++++++++++++-----
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 113565cf2a991a8dcbc20889090e177e8bcadaac..c1cc6b275cb2c630e262279f722ce4657cba096f 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -118,14 +118,6 @@ properties:
       - const: ife1
       - const: top
 
-  vdd-csiphy-0p8-supply:
-    description:
-      Phandle to a 0.8V regulator supply to a PHY.
-
-  vdd-csiphy-1p2-supply:
-    description:
-      Phandle to 1.8V regulator supply to a PHY.
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -157,6 +149,30 @@ properties:
               - clock-lanes
               - data-lanes
 
+  vdd-csiphy0-0p8-supply:
+      description: Phandle to a 0.8V regulator supply to csiphy0.
+
+  vdd-csiphy0-1p2-supply:
+      description: Phandle to a 1.2V regulator supply to csiphy0.
+
+  vdd-csiphy1-0p8-supply:
+      description: Phandle to a 0.8V regulator supply to csiphy1.
+
+  vdd-csiphy1-1p2-supply:
+      description: Phandle to a 1.2V regulator supply to csiphy1.
+
+  vdd-csiphy2-0p8-supply:
+      description: Phandle to a 0.8V regulator supply to csiphy2.
+
+  vdd-csiphy2-1p2-supply:
+      description: Phandle to a 1.2V regulator supply to csiphy2.
+
+  vdd-csiphy4-0p8-supply:
+      description: Phandle to a 0.8V regulator supply to csiphy4.
+
+  vdd-csiphy4-1p2-supply:
+      description: Phandle to a 1.2V regulator supply to csiphy4.
+
 required:
   - compatible
   - reg
@@ -170,10 +186,22 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
+anyOf:
+  - required:
+    - vdd-csiphy0-0p8-supply
+    - vdd-csiphy0-1p2-supply
+  - required:
+    - vdd-csiphy1-0p8-supply
+    - vdd-csiphy1-1p2-supply
+  - required:
+    - vdd-csiphy2-0p8-supply
+    - vdd-csiphy2-1p2-supply
+  - required:
+    - vdd-csiphy4-0p8-supply
+    - vdd-csiphy4-1p2-supply
+
 additionalProperties: false
 
 examples:
@@ -347,8 +375,8 @@ examples:
                                  "ife1",
                                  "top";
 
-            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
-            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
+            vdd-csiphy0-0p8-supply = <&csiphy_0p8_supply>;
+            vdd-csiphy0-1p2-supply = <&csiphy_1p2_supply>;
 
             ports {
                 #address-cells = <1>;

-- 
2.49.0


