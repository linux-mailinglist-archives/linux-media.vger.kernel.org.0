Return-Path: <linux-media+bounces-29532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F8EA7E478
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 17:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B749A17F565
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073EC1FF1AB;
	Mon,  7 Apr 2025 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s1Fyc7ef"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E801FCF78
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039466; cv=none; b=Fph40vY2N0tD1ut+BNvR+ByB51NfjP43nLRjtLvWkGnVQKudKlRJ356Af90/ARPC4WgL3TOhrBkX5XBMhy8Oy7yyWeEXk7LgTA6gbEItzEqsqEQil8uWQLE4qRkrHo/Ey+3AvqyWVjP661yEGD3OWZhq3gQaiAl7HkN/eM1NBPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039466; c=relaxed/simple;
	bh=CeUr7VtrtDVG3f4pna9r8Lu1ToiXfg1Ot4m0nP20rJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tgwY5Xf6CL98MArnOnFU/Rzb7oKdRPsWFRX6BMStkvFa3Tad/z6wKHelsu3rsK0tf9xWWVaLWcb3i+EbarNiOVxEL77Ys6WfBqkHjd8yBcBm9e2+z7x5jNogOJvFC9Bkvo1F2o4oiyfGfmt03LxfO8Av/LT/Hn87mVgryqF2lVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s1Fyc7ef; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so45063545e9.3
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039461; x=1744644261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvIr3fZaBEgjprc2ipD5ThXrnHkh3G3Z/8wBWGmdR/A=;
        b=s1Fyc7efjBUg1LBDy6rYE1R1mZP97obsToRZrhy3BXiZ0bl7B6+LdVNMepVftD6kZz
         Y+Nt2CrWvTnPWjKXrBbN82fhMofjdZUVqNBZT1lGg1zeSDxqEerNqIoKmVCHkELmWnaQ
         PnnCX2cntBPZaPddxGRIRUZQT8rJ+eij8AkGsMwk2O21UZMpqi8GZ3LSecSv2yaY2kiW
         objBNHVkSZmfpn1eP+PiTVFyLfnuCSFPC3LtRlin2A3E6KhM/SF38tLLMgrMkrUtOion
         dGWs9n+uB2RdBm7z/mbKUKd9/7LUzPM8VtMelQyi37YySJ2YfJ68lvgG1hTWU60rHiW+
         0GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039461; x=1744644261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvIr3fZaBEgjprc2ipD5ThXrnHkh3G3Z/8wBWGmdR/A=;
        b=bIZc7gCF0k+qB6B9mmI3EWuz8hVm9J2zce2ANF3WLbcN9wx23QX/nKu++KiORZS1MX
         87rY3agJGjjTYi2cxS6QXZ0/BURS3i8/q68SbuHE/ImkW0qqk6sUZGcLM9t4Ac3iXAVP
         72UFWgNQoRXYVheLbLGd3BC+fVhlxG5VDcONcaDcDojnQkDm2MzaV4G0fW6s08OzWM3h
         UKMnVevHOBdpKLL3aBv1n0iyCFzK5zUFno/Rb9SxuqbsII8Ox8nuJfRLBhqfs5cSoEXG
         FixhOi5pp2WL4rA0fWPip+/bnuLVMbsUv2+Pscmdn5j5jHKULj9tVUoDP2wZOZ+RKsOz
         kSHA==
X-Gm-Message-State: AOJu0YzRfI0JWKRw6GoF32skeH7yLTjTt3zdoE5HDjeZMCQ3gRSqvZaQ
	0DRQm74Olgap3wFXS2L7/fkC93Z9ZXa45Ddp1NI6Y29cAMbrEFI1RYOP6AELDD8=
X-Gm-Gg: ASbGncvbOus/9iSGVUjsJsroULt8YypDC7fDjwWmSKxlUx4SJyAWEFj2gu4V0wlcROX
	vn7mrQhEJehp/idlsVYMC84g+/wqnxe/DHOZsKxZ5fB7vbghbtNyghdh2Kt3mUQNY1vmEAQ2+WU
	bkqLfMxLcqOVymxN1CnIItxINQ64d3mIKweH/wmXo6x9YrrWccMW++N5mjQxgDHjtdKiyvAb+64
	cj93hNKLIBenFbWS2sHbaPdu5yEFZngX9fUULN8N82AKkJvWZ6o7pdGT4uYQE3TrnfzxZlCzb0O
	rS1ICEBTPUVnNQKEPvyXNoxrM5IMjBDHjozkTNR86yuQIyM4iwC+OUEuXB7PnEXYVg==
X-Google-Smtp-Source: AGHT+IHDvNkFMbe0TQoAjLEsRn6aHFXvNsA/xJyh/TzfjeC5kl1IMD7S/50UpNYPAwREaXC+RsXCWA==
X-Received: by 2002:a05:6000:250c:b0:391:298c:d673 with SMTP id ffacd0b85a97d-39cba9827afmr11110612f8f.40.1744039461083;
        Mon, 07 Apr 2025 08:24:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b42besm12212001f8f.41.2025.04.07.08.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:24:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Apr 2025 17:24:13 +0200
Subject: [PATCH v3 1/5] dt-bindings: media: qcom,sm8550-iris: document
 SM8650 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-sm8x50-iris-v10-v3-1-63569f6d04aa@linaro.org>
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
In-Reply-To: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CeUr7VtrtDVG3f4pna9r8Lu1ToiXfg1Ot4m0nP20rJw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn8+4h/z7HWBd83Gst2hqpaTLu6ts1CrD8MZEN+M3g
 zR819MqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/PuIQAKCRB33NvayMhJ0TudD/
 4jh0ymmQzp5rU3R4//ei293Upl0nBCujyw+FQ+b+kB3SvkHMHpnD61P/sOteVebXw+Q7zq+7zrl68b
 Xn8r+yMLhUjKPlqWdqgM8+Wbt9S23DTyOqmMRpW/KdfvjPxG58yhejZWskd7bv5Lvg/fm8+F/C36x4
 O4As0zjuSYtrxJAteqvVopaG8zNxH7QRIevQiSlx2E03t7A3s6n4ZNxc1cvpbM/Pkwm+vWYx3M/Dge
 IrZ7Eo6nDMnqNthvsZnkcE1uW/h2JXvdkawynD0EVXVa9LHXcvbanwkPJRkfLQqOpVXQwNtbV6u2nB
 s3qqV0kns4+3YXZkdRo21LLj3hMRIpzK47Kzytq9u5rDDrNORjVhmEw1HZmXQcCIiHmeXmstxJ3gwG
 t6TiJaDmW4lG6Ys4uM4C+VYjU/jlXuhtvu+Pg4pk56ID1Bnf+kfYXSO3c9Wdclcm5eM/M0t+grQ+SE
 P+z1yRROcTqcbION2KBrwfhn2hpChfXpaxn2/fMyNtwhqrKa0+5xSoDYtVTRedeiVUWgLaDPxkZSEP
 tLsRu1RfzmBQsrkoXNRxTDgsHNBZQ0zjNzRYxf5rqbUASo6jCPIMBEwGuLE0eQ1eONS+xv1Ch1pMHQ
 B/JyrvtQA3D7JdXY4KiALqqM6bCqSm8AXbSJn6UUrM7IgN/Wz/MjX1YzFsjg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the IRIS video decoder and encoder accelerator found in the
SM8650 platform, it requires 2 more reset lines in addition to the
properties required for the SM8550 platform.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 33 ++++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index e424ea84c211f473a799481fd5463a16580187ed..536cf458dcb08141e5a1ec8c3df964196e599a57 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -14,12 +14,11 @@ description:
   The iris video processing unit is a video encode and decode accelerator
   present on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
-    const: qcom,sm8550-iris
+    enum:
+      - qcom,sm8550-iris
+      - qcom,sm8650-iris
 
   power-domains:
     maxItems: 4
@@ -49,11 +48,15 @@ properties:
       - const: video-mem
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   reset-names:
+    minItems: 1
     items:
       - const: bus
+      - const: xo
+      - const: core
 
   iommus:
     maxItems: 2
@@ -75,6 +78,26 @@ required:
   - iommus
   - dma-coherent
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8650-iris
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
+    else:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


