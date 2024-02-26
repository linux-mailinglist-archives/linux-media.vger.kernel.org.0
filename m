Return-Path: <linux-media+bounces-5952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8EF867793
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 15:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABAEE1F23CD7
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 14:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615F312BE9F;
	Mon, 26 Feb 2024 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cYGC49bw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97DC12AAC5
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708956134; cv=none; b=EpY+FZlr47RHQa+1Aef4A9SHM56TasoMb2J87eCNFkGdn4tZN0TFODfDRjpOHwrjXO0ew5+nGXXU5fIBCCmxx+BbioIr6cbM19VzM3kEllhsYL7wViO6ytzXWM6mbvFxd5/QBGG+XOpbk7O/9VosoobigECU4/3eDV18LbGcBOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708956134; c=relaxed/simple;
	bh=yRuLIf2m0xnCfvzLq9R/BcOzRbUE5cS2RXvKgyHfYpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HoBH1/fNP/a7YvzKKzzPXN1/HUtcUiskngzjTHnYzT/IYESQoQgYrh4s4+FZmzKLexnYQYZ1g8h7zXDBdceGEacLyPJnPNw5JzjBk2xqkv7JBZv7rxOf9fbbLos+1k4K0UvN3a78ijr3FskO2D6CxhoYGSOOHgmScmgNmoJSRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cYGC49bw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412a51754c9so5299935e9.3
        for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 06:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956131; x=1709560931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnHZw5ifKCP/mPnI9SQ3FYZZamkSdSQAcxOif/txQYc=;
        b=cYGC49bwMoRi+TR1tEw9+KptjrJE+FInkH7rczYd1+HSi6Wy39L0nP1cCShAlvhs60
         kqg0eAWxgLO+r+6OQ1kTbWR8oUQ+P5TnfHS1MsNkeS+ggYt6LhpwZH7aEr+7C3FVAn+n
         TTuuV0IhKO4U2iqJ7LYpGdxNCtxtKnJXvjedkDlS2tbGmbVannSqhoBTf3lOaLfxwQ+a
         c8+jOk23VCLOktlFwUkDK99GhCuVRGKLwN8+rM0XLVoX00/d6ua5XrgX9DjDXhhjHATJ
         vUpHXqcpxSrwjGnr+Ug/w1TLnw+M6Z593WngNYRnDRb/8TqLzHqgI4Fv05Le28oOSrBH
         ARPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956131; x=1709560931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnHZw5ifKCP/mPnI9SQ3FYZZamkSdSQAcxOif/txQYc=;
        b=YIx1ETAgqtPxV+crO+GBfawE0u5OhDfMy5RPdaWHOVp0Xjy9IKaQaKXSp5u+cvoWky
         pUeHZkhTuA7hXflWRgpI2jSoDDqkTrKCB1iF3DgH2tx8oK0TljpDY6z/WJnJEhAHqKl8
         rThUzdkgk+JkRBJkzTJGudklrjab4kLNmQvpBwjrW8c4vWQCiAVS0rcRCkW52g86j0Nh
         deb4mZ733g2Zns8vDD7QcP1yNm+/0BmMuiVycVoCyo8f6nhW83Ub2wvPU9WkOx8uK35i
         Uk24LZyQ1u5PFJS8uNIusVSXLpcHdrD5AwqZe5sQNYqNVN7Kw4OHg+8hX91XWxumya18
         8iDw==
X-Forwarded-Encrypted: i=1; AJvYcCX7lGFs/mGJYKGIfdL+6BNGsYAPjRfne27p0iFCNd+eK/7A3amVzKcU5v3RgSeKT50QIpqh8Pt/+76y5PuWLPa8twfIyJezauHafs0=
X-Gm-Message-State: AOJu0YxOS7FPDJ15MKFBztaXfs79SwNk3F0fdn2QdyoJN/qf21Mt6v0w
	8YbeLmlolAYptXo98lA4bwyZ4H4NWLJpae1C3lUXeGXqQzJL0QOquJIALM7Mf1A=
X-Google-Smtp-Source: AGHT+IGdWj7muzrLmYabNE+rgWx3rZZThzpeILTHoY5SoipoWCOa9p5u5DJq70C9u7xNKXoHsKM3OA==
X-Received: by 2002:a05:600c:5109:b0:412:610f:c2e7 with SMTP id o9-20020a05600c510900b00412610fc2e7mr5950589wms.41.1708956130954;
        Mon, 26 Feb 2024 06:02:10 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:10 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:41 +0100
Subject: [PATCH 03/18] dt-bindings: mfd: mediatek: Add codec property for
 MT6357 PMIC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-3-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=yRuLIf2m0xnCfvzLq9R/BcOzRbUE5cS2RXvKgyHfYpM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncgGSS0C1k8gOGoK5RbBNCnTfpg0bIV9KdQMrF
 bRwkPGGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURWryEA
 Cf9/b3stfOP6wQreJbNQ0rCPhRLBn+WoIe4w4DPE2zxO6lUqXMXUmJUd3l+heg+JAn0jmFRNiYLI9N
 F2TvTYvt7QNPnw9UXKo4OWGWEy9EO7zpZB8Q0PVOWmZ2ieZ27JnJUHlhsF/7T62mg6HkPedQdgiwVD
 sef+ZSBq7Y+Z3G+NHkYGOi9/2AsPI1Vp1xnghEP7CbOI+f5aa1NCafxiHSUh9c2Rr0kdHOyl8xI5Ta
 HX3bSltTsRR8Y70YCeAcQ8xya1d2AVqqjVUaNzCAygjkzV+staYy/hF9o/vMZLTP/EKEWzFFIdVTff
 YD+WnyAQONOe4yw6oQZPsXkl2IjgoVYcBDYU0dpckhhSZGFYbOFBMzrSBoCHNAkUl7latYHzKLG5Jp
 RZtpxshoYS05Fs4nJX2DaAL432pspBJelJfXahY6ZvH5n0P3qlepcF7qgRWJ/pNnqPr5EPbdWJ/9+/
 IIgyGi7BgJFu0l8JZcGNJtzPVQLXL6SD4mI+TKV/tRiDQGbEyFf+AxsdJRqvmLQF9/O9EYvdwPbVoX
 8ZL9CpzfyC5sj0By9DImYNw4j06R28Wb165soxMql11bk63bnj9m5G00bNNX+uvnUosowi470da3Gq
 /6SnaR1y8SJLrpdirZTURqAhwvNWjRouipiTsD53dDH3XnDvA0rFaM4LRNeA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add the codec property along with the mt6357.c codec driver support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..d25a78070744 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,17 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  codec:
+    type: object
+    unevaluatedProperties: false
+    description:
+      MT6357 sound codec.
+    properties:
+      compatible:
+        const: mediatek,mt6357-sound
+    required:
+      - compatible
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml

-- 
2.25.1


