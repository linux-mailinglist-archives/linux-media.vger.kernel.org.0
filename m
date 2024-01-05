Return-Path: <linux-media+bounces-3258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68119825BBC
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 21:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 183EB28234B
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 20:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76C1364C4;
	Fri,  5 Jan 2024 20:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zLOFudDu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736F635EF7
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 20:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d4a222818so5491775e9.0
        for <linux-media@vger.kernel.org>; Fri, 05 Jan 2024 12:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704487152; x=1705091952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTm+vhEbcdsQDKA/4ycfDlFDuTCjL4ZZBDFj+o8PNWo=;
        b=zLOFudDuqA7t46+V0CXAnpMF2y1gqCEtkfLaQzJI4o5WC45OVwELY9V6e+/tbk9wKw
         SEKSo0qmgmGh+boM2qhpcsLJw1f0zaJOIR0My0dP3sxjvi21IqjBse4jZUXpVTvKCuK+
         wa8DNrbi3blAxY1Dk01NnHoJs0cMbjYvdbfBKwRNV/77uObGd+BlHMId8f8oMZpToSYs
         kNeAIlz3MlVzsf9HS/SWqBlsNAP+UxMYw1UdYe7Yf30xNq5lV6TfBr8YM4Iq0B2GFo87
         Xs8QbfvFzSn4n7ifkXf/fLOn3Y8/vque6M0nD51IxbvUYDgFyI/qrUo3gAvKnrxzzrEX
         cxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704487152; x=1705091952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTm+vhEbcdsQDKA/4ycfDlFDuTCjL4ZZBDFj+o8PNWo=;
        b=v/J9IAKWmU25SapNYAfYpRfYaOaad1nxdtDDskm1jeAATszD81gq/ScqzCa1GtqWi2
         yJO/4LvNZxzJVbAfA4+T9Xc0gyZRWyTccADwtGGMUgCsemSVn8YvhPY53jYXqmpGY0ET
         xGJTySnLdXWoKbfNUQhtDz0S2CkxXn8foauUlyKF7YNNldhRZ0ZH5rT0BXf0EpRadCxH
         8np4r6BrAn5nz6BXxhlOrM6C1YbWjbkoNshSB8q7orJ7NvewULWZqy+kSzdP9DH80T9r
         +kQEVSIFH1OdXAHYmVPx+PDaL47a3gvcg32mNC2ETPjeA/cYxYRva5yAOQMuU5rC2Dz1
         3xfg==
X-Gm-Message-State: AOJu0YyJ45KlucPN1WgS4vQd8n3cMZTaHyFY8Jk6ET+2blN85JtbVFrk
	76g9sSGrit9Wnkq+I7vVcX3X3ZPE/MrvgA==
X-Google-Smtp-Source: AGHT+IFpE5jPD9ukRUuNcZhD6dc0H6TEZxzlpPq+1g8dBH1rFwjrQKC1Kh19CDLtG81IZ7GbW0LTAw==
X-Received: by 2002:a05:600c:209:b0:40d:4e46:df6a with SMTP id 9-20020a05600c020900b0040d4e46df6amr31023wmi.63.1704487151748;
        Fri, 05 Jan 2024 12:39:11 -0800 (PST)
Received: from [127.0.1.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id hn3-20020a05600ca38300b0040e398f8cafsm2283890wmb.31.2024.01.05.12.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 12:39:11 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 05 Jan 2024 20:39:05 +0000
Subject: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sc8280xp
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v2-1-7a57b8b07398@linaro.org>
References: <20240105-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v2-0-7a57b8b07398@linaro.org>
In-Reply-To: <20240105-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v2-0-7a57b8b07398@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-4e032

Add sc8280xp compatible consistent with recent CAMSS CCI interfaces.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 8386cfe21532..369d72882874 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,sc7280-cci
+              - qcom,sc8280xp-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -176,6 +177,24 @@ allOf:
             - const: cci
             - const: cci_src
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-cci
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: camnoc_axi
+            - const: slow_ahb_src
+            - const: cpas_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.42.0


