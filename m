Return-Path: <linux-media+bounces-8914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5AD89DAF8
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 15:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C62028C522
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 13:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7601327FC;
	Tue,  9 Apr 2024 13:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gZyjsjm6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA25132478
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712670142; cv=none; b=QD5+TymAFuWXPaK4a/F5NNKXUc6m1hexHeytzx6E7M/YexI4hNE+xTkR2zeNtZxUxW8trcfzNvYQVPtaH320a8BPYjsI2IQNZ9L7/VHtw9gl8wNOCEcH8R+7gsC8s28JjT+V1RfzzXRHje7qNpUAhFOTpEmno91GzUrCEcJ6z3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712670142; c=relaxed/simple;
	bh=m2WMimLT+3s6slBofqVAvaqLkWzrgGp85vJbqpzM2J8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PjZ4gayruwFtlkV3wj3P+CHsL6GW4s0jomsWt7BqJf/QHnrvGbA6fkzWVT8FAN63bQVoXpFn12ElEFsJoe4o5kAB1xFxdVmonxIH+i9N7LZS55AQNI7ZwZUPwgdirxEMq/zjrseR02GbIvzNdlk97lE8SU+RmypkEQHIh2MicUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gZyjsjm6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-343cfa6faf0so4152480f8f.0
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670139; x=1713274939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=;
        b=gZyjsjm6TwLSrKTWCJoBu53utFGAxNk42Utf7NMUbQ0go7KyHMWo9LkswHdsF2RqkV
         RBbXhiAaiZk/m5e99/kIPRR6GM7R4NCq5MJsoup4hFKfvN3eGPS25uBxpGmPgnZ/vI1V
         3Ygz0jzSneUxcopb3+5kUu+5SDTi1kZ6h9K8/Fms/C467LEA9WbODu3hga121sqeLUp0
         w+4y3PH9qikHqDwSUOay96QM/6IeYg7/pnHRyzRC54rhEWJNT5+LlSOvJN5p9SMpbejR
         4nC1Oo1g3l1SCdq7D1TD7gihlHnerbvbkAleJMM3TIcURTBs4CRg0cQN5CHGUCW2f+GX
         vtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670139; x=1713274939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0Ft7gJMIMDuyFaMl73MCWCL0VnoY8SMUukXDjxNKP4=;
        b=NnMWMF7ans7+0Hh+YudyDZIWfLhm+uj8JfBPUej/2VKg6txrs28ECcWKg7bCqzL2Z4
         vOwRRvXvkvMM1ZZVwG6JosG4t55k7HL/mAm6OG52cuRImX3mBv/Vve4g4hjgnKirNnyB
         QyHXd8Uvi5eGBzn6oMnySbnTxMuyMgiir1SRUf7X83hYAkwLkS3bhZ14WrE5gmNmtdly
         +mq4lQRaYat62pEtyEmlko7BcZFkxy47lnwTJa+FVOM+BT/BAUwhGcjGJRxcF+JKyj2e
         u39jnMNGrsyuqcwLrbI3ibSafbJ46b4JQQ/m0vC0ja+S374PXrjmXDBmsSaL1/LNDXiv
         XOcw==
X-Forwarded-Encrypted: i=1; AJvYcCVoaWelQNUSji8cRiFBzygnL3/esBwG1vS8eZnYOaPsponA8tkUvZOejd5gMU9tb+iSpJypGGzOOVYJHUFKsJe99S31rmhjezrDWlA=
X-Gm-Message-State: AOJu0Yxmzji5s1UrggRqqRdv7423e1eG4hjTjNKoJzIJHzvs0iUJTkuu
	DwgzCIu5vFvEW3bD6Y6u2F3rF/+mKDJW+xJ/I64lw8PiWwNqS2qxad5Mn690LQU=
X-Google-Smtp-Source: AGHT+IEO0wu4NhRlj59yyEV3/AmudxVPjh9KDi9m6m9X4AWTWkIq0osDU5hnpCv1QD3F0qnVyktM/g==
X-Received: by 2002:adf:f9cc:0:b0:343:7653:ad14 with SMTP id w12-20020adff9cc000000b003437653ad14mr10377159wrr.30.1712670138963;
        Tue, 09 Apr 2024 06:42:18 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:02 +0200
Subject: [PATCH v3 04/18] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-4-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=m2WMimLT+3s6slBofqVAvaqLkWzrgGp85vJbqpzM2J8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWsRoFsr/DA4OKUp6SCQXm0l4J9aRtbh8NLZQ8P
 JwTHbUuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURUZvD/
 9L7gHOb1wNabYP63KJqzi8jizhVvuiuiQPEK7NZvxd0C+wEsOeuTHX+nF/MU9Qk5SOGCdoDILbVkyV
 4sblV6X1GDcBf2s2btcFIy8kOPJjSimOkcZn+ZYQsMPb6BpIup9mqH/F+gpjYZrvO10y2JVZcUb+iY
 iY5X7ialXOkPq1Psb76YIbdWNdDmyPgMLX60Jmi92DsdYPPordwZc5ml8/9c8rU37ewaz5GZSqv/ip
 4TTbrVMtWICYnQwgWRoyHlvLPFRYsxVA0dvkGbxwe11XtbVDYTml02QQ8yQOIzMmoEULYbAZTi7ELH
 UQfSW3e0kY+bZ/CoEYdKyWK6xHRP4Dic4Hjsj7EPcqh+LlydBoS+ukyjMpjB7qIn6O9Z57aYe37Lki
 R470tUPlZ6vtTMXaoAruJ0maHXUYk1K+QBMoV7sQkjst/VBoIAKaVZo4QAXurGxilT5VgUQBI/xeSp
 KUKC8GPJnaFwhR1c33hM2N14+7kWxQK0ZF9/23TrbmamSFzS8SUK1tYDMc23f2uy78M2OIbxyq6VIM
 AmbD8c7JeDXYfnj8+LP5d32wzMc5Ve9D+n4DDglS773s3Cnw/7a3h3aiRcUxc3V/qGjiGwimgfn5r1
 iMGWksRTViZID1Tl4JLT7t+kohfXrKPal994r21FwQbGJh28dkUA/Lnp4S3Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add the audio codec sub-device. This sub-device is used to set required
and optional voltage properties between the codec and the board.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..7c6a4a587b5f 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,11 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  codec:
+    type: object
+    $ref: /schemas/sound/mt6357.yaml
+    unevaluatedProperties: false
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml

-- 
2.25.1


