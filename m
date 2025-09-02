Return-Path: <linux-media+bounces-41512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B22B3F5F4
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 08:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EE7B485E61
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 06:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FCB2E6127;
	Tue,  2 Sep 2025 06:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMfHqrnV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750952E5B0C;
	Tue,  2 Sep 2025 06:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756796009; cv=none; b=T3PAQTl0egpa5k3GqXsv36ZCHUWvOyGY1XL6JzYwMFpZSv12AnN9B7ivrzDQyt9H4kAsnmefLsUg/YdTTcdcdCPh1mF5bqeWG95kvmXNSrUF4bGcYv4CXYx8YPIetTzdvJ4fNzEQTMe2u5aw0QnSRyYZ4gvRQUAbS1UHF78PVNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756796009; c=relaxed/simple;
	bh=vw7aeMj2ywqmRwVYwNMaLBZrwYAwIdf1u+dGU0J/mDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EbCSlH6dYHSxTvIT3QGcGGaW7mR1YL+rPbULbl2RdXCSTZcqUYpe88N8GCb6V1Ec5/3bFm6OZHNzBQagVU4AsN+rL7jDNIgdVeFXLoXP0Nuh5Ey+UA9xWsklKIF1z4ny8Qz1VUs4kvnFxvJtbwWHwJByI2dNk6s/TeObaKSx4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMfHqrnV; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e1fc69f86so4533940b3a.0;
        Mon, 01 Sep 2025 23:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756796008; x=1757400808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRHfTX+kYTYjP2RHGnNhmFCowVq0YDH1m7zbAtVriMs=;
        b=WMfHqrnVF5AwjRR/rQ42IEZHJK1XjsiWzH/8TIGKfsweM74SnIp7DqfTmtbHiOr4yg
         Ekh/k8MlOEG8lO9Q8YzECQFvB35kumxLukhS3jqRCa9kU0oReYi56jRNS7trpSH69zD8
         2NUIsM1F4Rci2rngNqM9pCrb9tO7vcN5Oge8boUGSmt+KIYyzNfQ5kHL/uk7fIrG6Zvx
         oVs4IqzbnAcEAaDKGbhusfQADWAQryCsMvNIrsqULzDE9TznuaAR1FQnp6a8RnK8LRk2
         kl0VtUUQ5/xApZjNPDfaVT7z+uhKxgx5YLt4umJJGkhRIwNHPQxGd46prnpfZVYs5uZX
         J9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756796008; x=1757400808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRHfTX+kYTYjP2RHGnNhmFCowVq0YDH1m7zbAtVriMs=;
        b=TLepdOse9bP0NkbH6YJ7EqfYPEqVQ8DevCF+rjBywvAaXYtPi6MmNuPksVe0bwLqaD
         g4OO7oGIouHSxdVv28KX5LMTendSqo+BoiB9KF/fYNvlvMr40D9mq1WwA3reeOzPXJVs
         lui+LvymG91g/Uja7xQvBRcA9V22ADVEgo0HNVBcCCby5gYZaPoh60IS5sVUjU+0o3tZ
         jUCrKDQ/kG7mzG6Ftrw4wzz5O7KHRIcbclAEqmwrQqs8w75EjF+fiMJPlvmPswYx6+Tb
         BZayhkdnDrp5+QCAHjejAUTaECVB/RJyjWB33YsJTvDnGqz0kx6jZDYRTTiC7kTrg/ll
         VGvg==
X-Forwarded-Encrypted: i=1; AJvYcCVluZi4RSKBU3VFK8PlPxJ+vtqacHYCvbgdXlUBhxs3UruX0mdZluLL5+rRNM9wu+sy2ws2m1PMVSXRiB0=@vger.kernel.org, AJvYcCWAM/YkWYiJMPPSicNhiXna6KWvwxi8JhsxdT7WFoOAAV4u2lI+Ig2/uYo/07NwsvJusWMp4B3GeW1nfFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjwYvL2YFsu9VuIjjPvz4PC9WnnH+Bj+/UwshZq91gC64b7jNf
	Fl7B355IIEZjMHyzxza/AjY39gY8ufKdcdr857RFpQ17Ab49BIDEXk3D
X-Gm-Gg: ASbGncs7o1ikLKJ2ZXcmAeo0mjS6YgYMrJe+Gwsau7MH4Fg0q/A8+dkGw4mIvluaP5M
	zorcoPM7/0LGo9V369sUC9jKu/hB9YFFPH1Zw+Fb/hpQ3k9jA7Jkk1n43pqfKvInIywdKeRFQ5N
	aXHK706oQGyHHj5UQWXcBSTyo3+/4sOL+SKgM2bepsu6imoKdu7FRG6kCa7BT1jx3ZUFcfpYYe1
	o5mliM8c7sFHfgy4iWeRQmp3yftx95Eb2klKMwqbiGzw30E8lGEpzfdLX1EZCb2c7YxvJs+fRVF
	jmJWY2vjJutf0nlj+/4TMJzAC6+QBPEkZzqZXC9fguR1FG1evGPxpjCc4+2HBd5Hza5ko6NjmZL
	Y5V5bLGYlhGdFXiJFymZa4sCU3I0mnFf3YTAhQjHfEaL9qTBhgwplDDvmzkbzPw==
X-Google-Smtp-Source: AGHT+IEhN0B4GC+kdm9Yy56XzpwiEmGdwfOWMYn3JUHap8TXHaxkD6x9MJCrMNUJMHJVPvPmquyUYw==
X-Received: by 2002:a05:6a21:32a8:b0:243:cb50:2532 with SMTP id adf61e73a8af0-243d6f031e8mr16693596637.18.1756796007795;
        Mon, 01 Sep 2025 23:53:27 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327e8d3d635sm12312558a91.1.2025.09.01.23.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:53:27 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 02 Sep 2025 14:53:18 +0800
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add Mayqueen name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-v5-1-d77c678c4ae3@gmail.com>
References: <20250902-drm-v5-0-d77c678c4ae3@gmail.com>
In-Reply-To: <20250902-drm-v5-0-d77c678c4ae3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756796000; l=1022;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=zO+xQYgQHKduVzVEwU4i5+zjoqCBC41ZcTRsqWeaDbQ=;
 b=D4/FW7QVwITiIGRQel+3ljOk0gynDr43yTY+btyqyZlw0k+68Ed5hfvK9h4CqhmA36yA+lzn8
 TwHc+XWWlGhDXxEeXx5U36HCK8mL80yQ1WI9i9tYzBqtkeCVKsdMbn8
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
index 9ec8947dfcad2fa53b2dca2ca06a63710771a600..300de3ea055b49449e45705f3613fccf2c29d4bf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -933,6 +933,8 @@ patternProperties:
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


