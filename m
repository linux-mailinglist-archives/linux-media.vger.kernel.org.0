Return-Path: <linux-media+bounces-29752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AA4A82842
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 16:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10BA43BA843
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 14:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4D51E489;
	Wed,  9 Apr 2025 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nEzRlp4u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1719266B5C
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 14:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209507; cv=none; b=AjapbHAaHzpkZ8nEGgSS9OYl3XlyehOGKeeGUVW2VtI4cvbPm29rTC7/fq1eG/BxQwkrGJi3swzyKWmuXW9QD8wF97oGrnJDsAyyiramrIq7pLdAOwmKPvMVNlS9leM6NfRMfScG+ofn+qm1Ly/XSxhkopcd2aQBZcE0HxztJY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209507; c=relaxed/simple;
	bh=ykuyFmkKMHJIXqo4oh3w0kqcgoBIO3smwRfR/rRJkQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qknA6VEjM0cX1InaWwjXM7BZ66pm1cNY3eeVy9s4UlC7OrxAMC+9xrm1jVdci8ElX5h1RBbTIcS8oW5iUyAHi0cvZrCOaISrBOFNFd5rbU9pVmpLoR6cBrW33bFSJ22FtglEo9qyRTKdcw2BS/QeORji73/LjyA8QPoFIOLh9J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nEzRlp4u; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so46364875e9.1
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744209504; x=1744814304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYQ/bnYqcpDq9DEnr3MypQ+/gd8s486fsMpMYGxMvlw=;
        b=nEzRlp4uL+dlibbh5aRCl/+0l+86lLLmXD7kDzuy/oAxBgdsBTZssqFa73RZyJiXqQ
         rb/6tejrcOZkltBhp+UUWOVA8VFEx75elaX8SxcXBTOuTpt2y7hX+U+45imdMeQEGU/q
         MIfLrY2PJBdARnJh90O21virJcXVJ240uEwDpeutgG0NgF419r+HRxdfuPmpQWOyU7Zg
         cREnZZVp98jhw8GL+LUBdRcD6uD+BCnOd1qkhRC6LEb3AvFQzIXou4m2mPeYs8qYcB8T
         jlIP5g2f2zSkfBaQV1mw95Xsgvl0PEY14UnZaOg4caCFNTxygyIoKVc/VltQvXNhvV27
         Y0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209504; x=1744814304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYQ/bnYqcpDq9DEnr3MypQ+/gd8s486fsMpMYGxMvlw=;
        b=gfibWOVn4zj2woOUcaPlsoayJoeYNucoTA1wg48+NLNWDJMAcgL+FWObi6N4W01QsT
         BiAt3zlUn8coz3GukQUE8SXv7ZQV9rBwpubuvUFX4/pfPdSna9NvmnNh20jwXUG1uKEM
         WpsAIEoWvstui4z/U+ct3oz7nJTZ95Ja1W/ZV9CasxDOqLNRfGebrAXFl27ASmJ0sBhk
         GkVnRie6U3rxtxb2lFonSc4K/iaUPerkyYyrL9dPxFTALj94ZXlOliq2noKxI6gcO1Ti
         t0Ahv0Cp5rdrDPCWaNfCsC1SuvMMX122s05e2iLmgp+zGFeDhe/Mev0VRnJu3kyLHCQM
         uFXA==
X-Gm-Message-State: AOJu0YzfFplOMzMXfniAY+SSPAG+3Q0XW0zqPW5l3u+TjGrA/y0ceWzE
	UbOrorAcQbEZaUTquD9nzWrDl4XH1z754vwSoONcWbf51Uf3t6m0VMwWzzwgwlw=
X-Gm-Gg: ASbGncuy+KzjxMaLKvP9kCTZvBSVeHR2HmoOexrN4p9h11f93PkcgN0lgVXFdXR48nO
	kgjHGAHsAH0VSvVBrCd6DrMYUSJQL6oJlHZGopKHVDApk2s9UkiHPm7/M7KHEUuDzhoGshLoY50
	aPz/y3R82LQTV179gFwnAZZGf9stbbgY4U0+525cYhfc0K72KDMA0eIfJcLCMLGGgoyVBq8eLBI
	rKThu3azLs/FHsyf19UqrG6m8gNcrdbVZD8y/S1JzJg2zOpfSBBqZVMi13XhEP3QBJhj4/4CfIb
	zvAfWMxB8Xi0YoQWdM3wJ9tnI/BgfNg0WAM9soDi7ft8okHJQjyByWooSWRXlg==
X-Google-Smtp-Source: AGHT+IHBnGtNRTilaYkQryGLO6hs4vpGuvJNAjg8RNrmh30sh0SKTKByJcmqQwo4ghfIwNENcwpzGQ==
X-Received: by 2002:a05:600c:55ca:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43f1fde42e8mr25153405e9.31.1744209503989;
        Wed, 09 Apr 2025 07:38:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625ea4sm22222045e9.12.2025.04.09.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:38:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 09 Apr 2025 16:38:19 +0200
Subject: [PATCH v4 1/6] dt-bindings: media: qcom,sm8550-iris: document
 SM8650 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-sm8x50-iris-v10-v4-1-40e411594285@linaro.org>
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
In-Reply-To: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2152;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ykuyFmkKMHJIXqo4oh3w0kqcgoBIO3smwRfR/rRJkQQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9oZbqUk7+4Co9bAwU7Lfb6Svl5ni40t2RvGf8cyp
 p54a6q6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/aGWwAKCRB33NvayMhJ0S2vD/
 9WM3g7GrOBIAgQwXCU7ZN2BzAaQmCb/MGgHu8su481EJGYW1UE8VNTMOHRfe5iWBxP29n1LXpOR4lU
 BtDQ+J2lE+b1bokQMjC8gY2im46/0iPm9pPo6Ag5TBNnUqSMUiqXl3dlg7G/l/Ytl4SX1Us1uv1LKM
 YvvqZek/7WLayD2hBy8sCR77FUO5JYGAbZMdwWRbQNbm2Sp+0yffvT+3RwWZK3I+SXRIaRmBLUrEsI
 6+lCKGRGosKAj1nRQsNuUDaW9gGJuSBc6Sg7s+XHJrTlMrQqmqKGKvfnuEcUThTK75sx0QyZ/TamkO
 7nHaohLjKizJVSfkjHscTG6LAHExseJ8FVNe4db45KehCx+0rNrAVjb5m8vDBGkCd+NhMo3ozohjIo
 MDtaa+iMaRyHUTtGz90dQxoV8C2T2liwFIq2uirv996rPWH/UH0yAZOyoJAwj8e18GgdzW5/V2/gxV
 vhDGOOZjz9655yRu/E8KKIuMhWn9HNXcGdWfz+ialAdfBv7sYcrUMC9krpuNkAaHBgjf8cjhfoVTv0
 QiKUzj9j1W1Lnj01aK8+cZoDvgnBSn7jJjXizWJt2jOX+8MkkplbxQNbKM3OpicPPSKGclgkUdegkz
 vQItKhK1GMQ0npAGOS0BhRPEgogoB04p7cJE2Jvq2gr6Ea79fFjJQ2ptOhbw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the IRIS video decoder and encoder accelerator found in the
SM8650 platform, it requires 2 more reset lines in addition to the
properties required for the SM8550 platform.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
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


