Return-Path: <linux-media+bounces-38123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D9B0BB2E
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 05:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37FF6175139
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 03:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDB622FF59;
	Mon, 21 Jul 2025 03:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5Mo81bL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D95C22F14D;
	Mon, 21 Jul 2025 03:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753066874; cv=none; b=lazqP9a5TfmBWmJ/xwUVcEBs3RohDj9KJ/tBGaaehOgh7K96rHFXDRbObon9COFUBxN+i1rvlV7D2uTug2AABLw5eW5mH/TxDxZduG7flsgY0/IfOY1dG/QBsU7RQixzBm6o6D9As4ltrcovfIra0mumJSltPZ0Ig8hWctYxJfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753066874; c=relaxed/simple;
	bh=mRa748xU0PrZmOMIDc1rQ1SW5DpZD53gJjEjvqCeFOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8jzbPfrJvCzJd0OWPBzVPbdXnwJivf0krdn+3kf0ejqSEcBlMAu6VJ9rXtRtK334qkJK4rdxdVWtyhYdll7fnwBAeOY2dwWRcfSOS5S5u1VrosN/DMRTpDvP6cz2f47HERNRHpYI8X8WH7F5aSeQuIEmJyPyTNW2BAoc7GQqVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5Mo81bL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23c8a5053c2so35054815ad.1;
        Sun, 20 Jul 2025 20:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753066872; x=1753671672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PeYY2jKAyAy50EIOGhDJneDUVR7+rcSPzU7tXyVM4cI=;
        b=H5Mo81bLCR6Ro0m7VjqaB16LxlEckp0wmZV4nvy0g1AzeypueMarcfyKnYExPgWrAJ
         8FoXnf0rVp5/Mjq/Al7qukYthEApa/qqvBXD79I6SSDYOQcOoHJ10rsxAevRgrpbGPFS
         xJQUgZnKI0T3zlKXvmbZ1mRJqxe08OJF0bg4xYdQ5p5EkCvcPomtgUmjUOPOphWuFdnJ
         NafWqg3pI1OXqJML77xNDA6G/p6lWXRC9KDg1i6BjnnGIs/MkK9oB/CFFtSxbLW2LaEn
         Vz3ZMueHCaBEcITzeikvkMQBJ47vZdSMctBDJJg5dxTFJ1mdtVjKbl2p0YaCKr8Le5PB
         07Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753066872; x=1753671672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeYY2jKAyAy50EIOGhDJneDUVR7+rcSPzU7tXyVM4cI=;
        b=kPS4eSuzAEZA2wEtkG/K3P4U7RioVyrMSQH9L2qKA/J2QbTUdHO8zSrnaYuyubaW5y
         X1Ovr93JGXcDTTv6OLLqD+Ji9llq70kA0aDazuO3i36t60WwFkO6puABS5OF7NDY/7iX
         qn/Hv0IouhKU5JaflQVB1aj0f504DdhnxUyTHYRS/ImKxwO19m3PwEJMpmTqb/tQ6hXp
         ckGwjllHlYimYbR1iPR7tnZXC9ewGALCV2hWhzBp4Fd7b6XAaCGJk1ajCMJta7GVbPQG
         UEFm3FM5Z5Itxmg7SVS5j9wVkCVcZ90p//SpgS4fKTeZBBC4LUL/ZHoxliqL/KPoiqsd
         2LVw==
X-Forwarded-Encrypted: i=1; AJvYcCULE9GlpSCtGjDd43xgFn2KdGj3cUe1DqOlc3zXV1JgQrURyoe8+m9XzUCU/E2ol+UgAgAUN/9OVufi0Ag=@vger.kernel.org, AJvYcCWVwpW+hlvgIGHmCvziuMmaKCgvvgWn8oyJ/1v7y+bv/qKvi/spC25oG+7NjFFuTAznKiFv7hqluuJV8DQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTGuoTqkpj8rYVIfF2+YvYOqEUQ8E1lMNdscS4yOV6JKWU9G5S
	lL0p3zMTju/RV/UZKVyZpzt9JyNKKs4pnV9SisxYtIerPhjnvIEypFAl
X-Gm-Gg: ASbGnctiFUEqSi1zDgFeo4ze2N5ppv2OtUCUZ9VcVbDcH/rzGSvJArT/hiPzEW8S1p6
	z9VIQSBTGDP1Z4uhg2HlP7oOOmLprrcZSgmgxz7vWyluu9BRTXjBqVhkZ8h30ZSF8XUTrkWOIoY
	Fg3uQiICSQiL3jtQXhiBlNq8+VUffoHpP0h2Xqls/aSgKm/AgorHsqK+DsS+x0ncFC9wdwp0gVG
	94W2yHNEfmQ+4e9bDSepQ+C3TKwydBrTT3ChIYSO3dXUokw4HOF9U9wcpGyJsew5QDIdDVtASjY
	9lwr7wfR7Y34Uq45WqT0NLiiGRqij0E4U8aJnW2PP+CrqFUNZV+VAnHE70dCKb3JKIqHSq604nJ
	00xbCKS9/VBwPrPE4NAZs1j7Ey/cvTlKg5/8oE8p7IYsU+y/xrBuFuB4wqUqsgw==
X-Google-Smtp-Source: AGHT+IFd6in4Ljjr4Chv125IaWFenxnJyaEsPxcFgwcJQgdFu7icJMd47ni+dvmqnKYlNt3vXQqzgw==
X-Received: by 2002:a17:903:3c6c:b0:235:f51f:c9e4 with SMTP id d9443c01a7336-23e24f49430mr293789555ad.12.1753066872409;
        Sun, 20 Jul 2025 20:01:12 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6cfdbdsm48264795ad.150.2025.07.20.20.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 20:01:11 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Mon, 21 Jul 2025 11:00:47 +0800
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Mayqueen name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-drm-v3-1-e16c3cee7263@gmail.com>
References: <20250721-drm-v3-0-e16c3cee7263@gmail.com>
In-Reply-To: <20250721-drm-v3-0-e16c3cee7263@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753066865; l=1022;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=WtdyCfravtJ3C6cr9BsCQHMVzBkPbc+FvVAx7TfBckQ=;
 b=/KVfGhmhXsKbQxHILrMxwgmQADvojx+3YAMd0riKUvyPHZE/bfZSJ2QwZGppIJccY7aADaUfQ
 6YHGSYJjDJ3CEOCPT5d+EDyrnImZxf8ZjU8yz9/VwxQUf1/LHkFCu6f
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

From: Wig Cheng <onlywig@gmail.com>

Mayqueen is a Taiwan-based company primarily focused on the development
of arm64 development boards and e-paper displays.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..9207c25a3490a3aa5cc9d513290e7890799f92cf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -916,6 +916,8 @@ patternProperties:
     description: Maxim Integrated Products
   "^maxlinear,.*":
     description: MaxLinear Inc.
+  "^mayqueen,.*":
+    description: Mayqueen Technologies Ltd.
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":

-- 
2.34.1


