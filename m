Return-Path: <linux-media+bounces-11760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F708CCE52
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385491C22001
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 08:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1069113D292;
	Thu, 23 May 2024 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Aj8AR1Ih"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4919913D240
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716453768; cv=none; b=REryNPhuJJdvcsu99bY9/+kkNv1ZJ3sphx7TutFbtOoMZuqOTJOe/OD1dsBI9ud7hzwwGFAes9hViLpQyA6vkD/EQZj6rt0TDgmdOLPawHdPSkSkv5ilUxOoXfavTi+as4UoGJKfERqStmVMRdhjVZqp8dYn3edOgQx+VhPyHro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716453768; c=relaxed/simple;
	bh=cKEFvnur0r9wK70qRsiyMlYMUWCy0Z2MhPoP9t2s+R8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Whz6QSDDJmKNCUVRXVVHCkmuY6kx8EGh9cRm16ISNR2IR3dN8CtcnXBmPUBlBybwWVAsrWozLmbg4QPtBB9BMwtOeKo4v4HKvnS09WR4fNpCUkSKuIsPPV+P3D0ZsDtp9Gv3KGb1w8uLNxAOWq7OJops+X6+LmWv3iPtcbZUeac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Aj8AR1Ih; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e576057c2bso108548161fa.1
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453764; x=1717058564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=;
        b=Aj8AR1Ih0WIXVHXHbAYNKwHzVmVVXGYVMg2x+naP1hyGjx38X9UzPtIQB9BhxSUwQB
         WYdcc337ybc2ll0MPuTIRSupghEB6pjc/uOT2KnlL5zyjuqDVyxbNAZqt89secmXUnHh
         9Kf2q2JIrCxErV5vbrO30uCIB7bOMdZuU1O12sY5Amx0BuOkqY/SgqknftoyuC4bXbAw
         Ms4/S+mscGZPYe79epAhCFs4HP4HnoPQaGJk+LHK6zIlzOE9D3gySF6ndmmPmcL2znKY
         XGQh9p3VofrI1WRt6wYLIrk3oYRjhd8WEWQbSbrEvPPhiQ8kZ4yAoFJDeOUViDKJ6gdL
         ibjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453764; x=1717058564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wcqbhlzk69tSoPzbWxkhR+N5g5aDso2+zkY/xdikbcA=;
        b=RCajX255p19iypLCPbz0qQO/BpCAGKG0DQt/5nwYUXlceEF+JSX0ywgL7qsnA3F3sz
         2e9PlI8YsfSGuDqjh4n00FB/lmSoQ8yvNWwe++rxGkXhg6lRYNoPxVpT5ynHrEVD0dvb
         r6lmZoswtxnB9E3v5OmPfWaQwyGarWOYd129l1ssS4NX8FNNWPuzQ2tXbOlSxXyjFHev
         hA3E+SKXzDvnnVdGE5YGp2IlEkZSgVtZU2o+PieA/1YdWsu1SWf6JDMbP9dxKuWqaQo/
         dm4o3oyYDHze3LXrUd91mqlWgySjSl/wB03SOVrcUGWZFLBtTOkeOIdsFZ45Ak92YDhL
         UhFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWASGSQHdKGoZAAz7DP8TwPdcTG++cgrBTTLYc5+KOV+z6y4aBLvwizSh0h0a39RkgM/7wYNNxtVlSanFeicdMj7z7TqH1VderT+fY=
X-Gm-Message-State: AOJu0Ywm5QsNuJ4rIzurWklC4ieqjVr8hZT9fDEPMk4BybjIz7cy2ep5
	ZzJ4KvocASWPf3GDJYqyWDj1P8PAKYAUeJB56CJS87xsGz+ZVVe84mATo5z25d8=
X-Google-Smtp-Source: AGHT+IEF/TTFTiR8UOUieBnUMUsXefV3/YfLojRO+um6UtDO0dolyj55eyvbEErNS+I+XuekyqRGOA==
X-Received: by 2002:a2e:87d4:0:b0:2e6:cbe9:db03 with SMTP id 38308e7fff4ca-2e949467182mr33408181fa.19.1716453764511;
        Thu, 23 May 2024 01:42:44 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:42:44 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:31 +0200
Subject: [PATCH v5 02/16] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-2-e7e2569df481@baylibre.com>
References: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3330; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=cKEFvnur0r9wK70qRsiyMlYMUWCy0Z2MhPoP9t2s+R8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwF/7MDnaVUkfVFGkCqmjiZZKFGhUKoPOo7uUr9J
 5+gLSCOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BfwAKCRArRkmdfjHURZB7EA
 DF+VAzrCNU4SA1jP5OoT93Ob2M6JWQsrtCMl6dfh99+00v8/WFqKoF9X2a9OMftw+B5WF/nfgK6ScX
 hAZEEGqYtytopg9fg6+pd6g1L8ddwHyheJG5Ld6DlXP4shdFhR33lqLI+x11mwPfdSwBkg1etvXcDd
 b6aaE4z5jQFm2imwg+OaSOjYcHNs7gDK7R1oIcGYCYYIlK7IzBlNsxCV1JoUu0rf1xF2/VIDsaNtO9
 pwHOVgRuVrMoVTuC23oavB7agQg5kwsEupJHCGU/2z5tbOYvazAtTNAzohmXWMe9Qa67o9wRbj50kJ
 fhu0gAbTwHIuN6tjJdHY/i51GaQa37McjR8SUHhQN0ngmpu+B1bcpC4Lgzf9y/ZFMtEDoPYxvuw68S
 FyAHIH1zOH9t/ACHjyCrIbtyOTJICgx6UjLiosvtanxQjLuOEly8wVDY0cn6UlrxIoCb58GNpdOuZo
 +EL30aDE5zxG/Pjor5LMj3+cYll7s4epePNLwyu0f8EUSHDxFHl/vgzNCjFXgsqUVnHBxUrdGnKhLO
 YHR1l2j+hBdaW2on0UCqngf1Jiu0DxVpi8B8hQgSOaT5v+8EwU19PZYpIomLjoFB6IjVSdEPASV3V1
 B9LiiPXM0xIHI1S1yWLl4/aYF5baP88XgARVIfPeHsty9idELtpALs/4HymA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
new file mode 100644
index 000000000000..f68883da1bb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
@@ -0,0 +1,107 @@
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
+        description: Indicates dai-link name and PCM stream name
+        enum:
+          - I2S_IN_BE
+          - I2S_OUT_BE
+          - PCM1_BE
+          - PDM1_BE
+          - PDM2_BE
+          - PDM3_BE
+          - PDM4_BE
+          - SPDIF_IN_BE
+          - SPDIF_OUT_BE
+          - TDM_IN_BE
+          - TDM_OUT_BE
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
+            link-name = "I2S_OUT_BE";
+            sound-dai = <&afe>;
+
+            codec {
+                sound-dai = <&it66121hdmitx>;
+            };
+        };
+    };

-- 
2.25.1


