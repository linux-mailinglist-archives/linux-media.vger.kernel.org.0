Return-Path: <linux-media+bounces-8884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D8B89D686
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 12:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20CE11C2157F
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 10:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216FF85C74;
	Tue,  9 Apr 2024 10:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RXV8pm2x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B62281ABF
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712657628; cv=none; b=C+loi2y5g+PYoR1g7ik8TAdSwik5DlQRaW7nmz3xcoMQbu9/Cq+XXS+MClM6EpEqdokpaXJ6D0xcwq3aq8Az3ZupasoXIu90iDT1AkrdMp932vm+GlUKQxLWxaG6DX3Mx/mUenV+5Ot22NAYKGLWp5CmTJxm5kEb8tPp5cKHCPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712657628; c=relaxed/simple;
	bh=bcex9J3pUiKsSDmYMrLdaDcykBaj5YDYBra4ZvFBZJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=is/zdRoc9Vl8eDqBwcKu62DehvjUw1wqgzno8F54KlaTrWMK77mAUr6r8wCj3ILBRN0dbZcAQArzZaZURHMi0EZVSB1phQQkD7bP1P+38/arjsNjWGpf/us3Ekol5A7BeGQxUUqP2dG0uCYWnqcuQR1C9DZO+cSbDE86upEGpRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RXV8pm2x; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41550858cabso37173115e9.2
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 03:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657623; x=1713262423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=;
        b=RXV8pm2xAjzDDbh9nK4Ffult29Eq2mWZ31U+LOfUyDdfrqIoMQyy6pTxV79GFdiG/P
         /CQq9NjA5bbXPIFFu5bnyC1WtgbGsffSQnOtro51ZkmqshgXmTF8v/dpezR2Y0ShAjS4
         ZbMHffWovQzrQY38V4qxY4RdsPoQxs+SlnoZAH4b+NEZQBm14D4NehH7R3wJ3zr4KyKU
         9+PUjV4VZh9kI6yl0ikPMgM+nz9b10XKetW5J5Rvg0E63WLHeh+/9r+7p0ofFY7WXSV6
         RSOU36szfvYAn5sNOFMfMwWz2s6xSWOWVp39xveh8nHpYpVF/qD/IeqatfD24gbXV64R
         E3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657623; x=1713262423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGt34+sJLdk3MLx6big+T+CAqaWtPyYycofqseF0Aok=;
        b=eKErllwlF9O8otnUA0ZcjqonWz/E1ILYHNbIcoviRIKD8/g5PUXJ1JlcZlsy+r2KPe
         gSpK3ccAptyS95IuuEIAitHnSKpX01NF2fJNRm05ie/+3QO7DumdBNCor93SVhupmUus
         iGwHYxN9n9lW2VUvZfZocmfW4jiWCMeyPUb+JdxhENMGc+NH0SAgXXF38VGb1fXBxx5L
         Q31ysqkORuXnEHDG4yWLVsZ5CL54wEYbTJmKlBm73BbC2sYY9hgGk3VkbFe30/2vkXOy
         L0p7HPBazGfv4t5UrzNzS9J+UUCT9qbv9+v/+N6qyfUZoEyOIqFtcf1nLVy5xRXO1rhI
         xkuA==
X-Forwarded-Encrypted: i=1; AJvYcCXDsaEclfoVMn3kFglMW+I1Ar4LPktbGCa7tKq3MpQCupJTpWZg7e3gQQ3yb54qxt8QsvBRiXLJcemIE5KIltcLiJyzeBn+2usi3b4=
X-Gm-Message-State: AOJu0YxpqJlLFBIX84LegqxNGhExD/8sQCo/BIqum4frgH3OcBI7RUVN
	wqY745mDKV9VwsfVlc5j5aXmKClutcZvJm9LttjGAMX2+LXQ6r1862TJI8cvN4k=
X-Google-Smtp-Source: AGHT+IGzfaK4n2/g8axda9rEW09xuGb8tQgLRNvycpCGtQ33o2AX8GkVbCTGFTgBOJIHcyo7EAPzsg==
X-Received: by 2002:a05:600c:3592:b0:416:8152:8a70 with SMTP id p18-20020a05600c359200b0041681528a70mr2710612wmq.33.1712657623706;
        Tue, 09 Apr 2024 03:13:43 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:13:43 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:23 +0200
Subject: [PATCH v2 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-2-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3125; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=bcex9J3pUiKsSDmYMrLdaDcykBaj5YDYBra4ZvFBZJo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTZEodaz6gWD8MRUgu0ITSSraVYxIjQYi8MKb6
 nkjJEj+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURXk0D/
 4/ZJ3u2KfDNF648wt0JHA6iCjSPOuj6vLD588gTo+Re1qpqu68/joP8w3rhRELxW6/iHZ4xt/QFj8C
 oO+X6o8CASS6dbwjDvRmkR4BJ2/Ku0pnYzNrm2kshLM4OEV/b7fix7ed8oFLJUjubS6BiwPy3GJs60
 vu6anJhjf4YaUnISMBRimlkMamBn2UsSVJtwEuvVHaiovp553a9iKTHBIDeBXNkHDffAJzI1aL4tRn
 iUDVy96b4ShE8+MENftXo3FISeURWuizKpXkQ1bmd9yv3v+51HHQWpxHFchIeONrJrZ7k9Zep2WTG4
 UkS2JXJ55Ywr5w8Iltjkqq31cuicllUklzPCrDNBdlsoPdW3vykmolaDVPYK6sYc9/4eGkPGrPh3BU
 vaWjrfhqvUgiDDYI77J9ugPtdzZXrF38VpIAW9GgDqYEFh4P9gwVnoAq17S5JCEUaNGPRgdAPi32hw
 tqpTZfZ4GsC1trFbNq8ObvZg0RD0l2LrM2w25Xf+Vs+46aDVTOS7cL2fE9O1YQo4Sgrb3KxV+OBtCE
 HOZNSh3te3PjB3b2DSruFSi503sxBNQse4BHacJIli3TwHCCtcAcd0gz5kFogwXoOyqd2H1WffjR4S
 j0+fk+qLCPqeqeFydlpoWD+tYzmV2IaYX3dmPQ4E85uI8m9PSKEiJ/+9oENQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
new file mode 100644
index 000000000000..831c5b4665b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8365 ASoC sound card
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8365-mt6357
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: dmic
+      - const: miso_off
+      - const: miso_on
+      - const: mosi_off
+      - const: mosi_on
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8365 ASoC platform.
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    type: object
+    description:
+      Container for dai-link level properties and CODEC sub-nodes.
+
+    properties:
+      codec:
+        type: object
+        description: Holds subnode which indicates codec dai.
+
+        properties:
+          sound-dai:
+            maxItems: 1
+            description: phandle of the codec DAI
+
+        additionalProperties: false
+
+      link-name:
+        description:
+          This property corresponds to the name of the BE dai-link to which
+          we are going to update parameters in this node.
+        items:
+          const: 2ND_I2S_BE
+
+      sound-dai:
+        maxItems: 1
+        description: phandle of the CPU DAI
+
+    required:
+      - link-name
+      - sound-dai
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - pinctrl-names
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8365-mt6357";
+        pinctrl-names = "default",
+                        "dmic",
+                        "miso_off",
+                        "miso_on",
+                        "mosi_off",
+                        "mosi_on";
+        pinctrl-0 = <&aud_default_pins>;
+        pinctrl-1 = <&aud_dmic_pins>;
+        pinctrl-2 = <&aud_miso_off_pins>;
+        pinctrl-3 = <&aud_miso_on_pins>;
+        pinctrl-4 = <&aud_mosi_off_pins>;
+        pinctrl-5 = <&aud_mosi_on_pins>;
+        mediatek,platform = <&afe>;
+
+        /* hdmi interface */
+        dai-link-0 {
+            link-name = "2ND_I2S_BE";
+            sound-dai = <&afe>;
+
+            codec {
+                sound-dai = <&it66121hdmitx>;
+            };
+        };
+    };

-- 
2.25.1


