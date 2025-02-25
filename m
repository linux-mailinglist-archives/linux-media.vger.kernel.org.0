Return-Path: <linux-media+bounces-26912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC95A43906
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13C69188DB75
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B5E267F57;
	Tue, 25 Feb 2025 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rj99jgDq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DCB265CAB
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474323; cv=none; b=SB0cGGQRiRC0oJXTS2g4tYXeaqRy7Z0N1sDm6sne9cT8+V03MVczf22/j+LyplpxTsg7Q4qDsKws+pElXMy3+zvBFgLCD9jWWPpwEfXLUN9oPP94zacFAQOpal5CTTOPcKLUBp4NqnlNwQXXgVb02Xd4F8+VUgnztn8mgon5lQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474323; c=relaxed/simple;
	bh=o96kxA33+1DrhbtMAFBL4Wa8Hn4604gRt15P/wcggIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSZFikqjzTLxPekBrSPblDipvtDob4Z1vyo+Cm9hK4FUhm9bJnWZ9HBDD85xcCxSiicQNCvAr3je7iFu9IGgWB/eaHMvTjLHdyGxyxnWm3rt1lhD9iFJOC7oy5gNRmEY+9tU11tZnzQJ0BH/P7WNj/fmKGjjIC551KIFHKIpc2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rj99jgDq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f504f087eso4200252f8f.1
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 01:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474318; x=1741079118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ehOa7QEJ7cqt0L5jMNiAxatA6Uuy7MmcV53RpYdRAY=;
        b=rj99jgDqK6yECkkzkOV2T2YCwK7ZFa82dpIN4dv/XRJbeSan/x0IFjpVtFQO3sTEoB
         yJrMru14GwJ9uaS3yhr3C81XSPyOJfgCxhUyFkXMeInCOlneFHov8PPcTygEiMtElOCw
         cU+M7icH+se3kn+4Ka23usCMMGPY/hMWOx9UQFZl988EWgkFhFySs0LOb1qvXD/l9BbG
         KOk8teT2EPH7aqATNFt+Q608r8OhBcPtVCWsf2JoMEI1TbY+3mtFJZqSHZex4Wt5Zmil
         Gq1YnorT0s4NP6oB/hp+J6ARsIo8pD5locW8wFlROiEhvq7PKmnLJDSXUY6TPRk7xA6g
         nJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474318; x=1741079118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ehOa7QEJ7cqt0L5jMNiAxatA6Uuy7MmcV53RpYdRAY=;
        b=RWHsaC0qY+wUTq8fa1chSghBp3Z3Qceh1oB8C+ROVXFSfhu1h+dbq3P5AViBCgCV9P
         6U6q+uoo+reGPoRmpSN7UCxiBAzAQ+cFoEdqeQKpy/aTAasyXkBXTTYehcNjrEynQKV3
         rb0e1TrCfWLErnla970dOK8gYvkMZBSygNIkpcVtG1G6bTLv1/9usVHcRLIsLyA8OqwY
         f/dou8exyIPP4vkY/v6oMe6PKkreS4LwWypbVWi3gWlus0aiNG2c4k1InAT8o/X+QfwU
         y9DKhB/Th1d+MCA9uR5ZlUVXncZ8XDOnnrE8GAv7zISvQYyLZkytde+ykGTFc/NMAs51
         /eRg==
X-Forwarded-Encrypted: i=1; AJvYcCVI+1PnOz0lnfc1gXuL5FI88D297YcXm9S5KZKp+APm13cK4s5sHbGo+mX+NARLWqQrKnuJEbAtzZuG6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoowL4aykEY6qOteZRlgDz+wM1YUBgSPsa/MGROZDM1YJXLr5a
	QQrGLhqqoj3UljJcfrQywEnLOI9pt7dK0c4HFCf5/rvxpwgmxCj1J9Lso0lIM20=
X-Gm-Gg: ASbGncsjFCnfci5Sjj3IRbB91Dro/tHKe3C3xl6IM/yaI7x2zdrSVLMQ/dn8E80qZjK
	7qUytJ+PMcqwbEqEFpttMAOc/OS2bKfDGW5FH54VY08OaIJiRpuy+GF6JIAIZPWirIYhHTHGk7b
	IM+shchxg63XQwwTplMcoEEd6SNzC8ZTkbE+Q7wSnkMUzkgj4Ihi4BAFFDdFxJanaCLDNXMKxCd
	hHcXu2uOXlKS0ytHkxQLUS0qV/FFlfsnV52bgNZ4d1gn0LRsHOXnsjvPWDRPPswZdrSm4MzlFtQ
	W6eWuecXsMWTEqwMZ9ot256Cez5VR97WYXE1FKJWb7vIGz8=
X-Google-Smtp-Source: AGHT+IH2ZJqkhcU51FRNDxP7cqoLd2ysClzetd+2vjMdITpSxqbkRCJvF21LQcIWviwRZOaK7J+uww==
X-Received: by 2002:a05:6000:18a9:b0:38f:30a3:51fe with SMTP id ffacd0b85a97d-38f6f09c087mr14993157f8f.42.1740474318541;
        Tue, 25 Feb 2025 01:05:18 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86c93bsm1573540f8f.26.2025.02.25.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 25 Feb 2025 10:05:09 +0100
Subject: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: document SM8650
 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-topic-sm8x50-iris-v10-v1-1-128ef05d9665@linaro.org>
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
In-Reply-To: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=o96kxA33+1DrhbtMAFBL4Wa8Hn4604gRt15P/wcggIw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnvYfL1rNkJHBYRMe4xHZwtWc5t05wyovD/w0krXGt
 XE8I77uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ72HywAKCRB33NvayMhJ0T+6D/
 9/rAzKiZ2Ef+u7ZXKQWwghwGgPOmMPhvn86QEDzGfNszva4mGYjRQTdQ2QYAEF+TzqtjWCUATNNiLL
 uDRl93fy9Mb+HgqNiGekRbsHU+eNLvaV+wR5iwbkOMIQ0bfff7AFXZ0wgsLaK4bkA1u6hU/20xn5KW
 E6kO5FJzVaWfcXPlHzjNgAY2NtqylhmwtC5D7QLDmE7y9BTjhoCxyd+jYfeeXkWeEHHoS0LSkUuTWZ
 LgP8T2bmZP8w+tWRtgVNUZcHiIi2c8F2uJbGQPSSGTG+YPcKUULX24wqYCp8/F1bAfINqwFU2K3HKh
 /HX7XSY8yiTIVZqmyxcAb75Q0hhWONoIVSkgfNM+fHXzWX+8Okf777dJoVrVWk9pEnMoP+0QCmyeC8
 ZsO6OlhBqhBeFgbV9jSOmZ2eFnAGUva8MQCBLZDBvInki19lpJhDyJn/IoRU5o9QkxbczFae+Vvi85
 ZaGlmRSp+ecrJHWYLSNxUx/vq+bx6GzIEqHtOq6S75X5w/8HQTMg7KiHa+q1ipgeB00JNiEeya9SNj
 Kv8uP1LXEtXe2zckJ8MVX8MVsX64tTzjn2GajCrs23Q9VWBnPiNy4DmCUjaxE5sAmsbyiymYqJG70V
 nMDoRMUY1+XhKtqYNocT1gRwLzGxxyjGxTJaFzlsvmuu3Vv8Vjza5+7aZRjw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the IRIS video decoder and encoder accelerator found in the
SM8650 platform, it requires 2 more reset lines in addition to the
properties required for the SM8550 platform.

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


