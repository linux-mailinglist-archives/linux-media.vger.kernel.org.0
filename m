Return-Path: <linux-media+bounces-13231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 352F99084D3
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A2F31C24EEA
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803B0184113;
	Fri, 14 Jun 2024 07:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dNfj7vRN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F04714F9FC
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350088; cv=none; b=Rlcml86lYIu0KjYvbvgVnmbNbsxxBZKOAz0NjT+HPGnHeone4pdbnRhR/7MBocno7qB425DLmD7R6DTFu43+qphqz5k72szwwJBTv7ytmbXp5HHga2faCfm8RvtXFQx8E/cjWiWDuBeulwWrAGE2IwtQY6TCw++Cs4SI+z5YC3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350088; c=relaxed/simple;
	bh=SWDpxVosRWcwhcp5w5dGFmY/1KI8cAMYk3ck/hCfKf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjWA4FQdmkBbLar9UWqiReOPSuCveOWj+QMgQz2rBmxhk30V0GWWnZlnT297cPkQS+sEi7cyQcuC6Tz6xD0JLMRl7ioWGpsvvO/WVE5gS+TrtlZlw9TNXJbcQfqCODqJq6AASvq0sQEBU80DQZd0prV0kNIYQ+LKuI9i7dGr+Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dNfj7vRN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-356c4e926a3so1864442f8f.1
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350085; x=1718954885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
        b=dNfj7vRN3kBHW1zWVfBmjI7Sst08cMmfY+z5NARHLYVyJ16WXeaCu2mUfgKITBphY+
         lYERt325XQQz5kafYQc+QqjSAogrFcgNQekBA1BnZ0EBMGBIBUdejHSzse2N5Zw+iSwO
         GwkQ4yqRmdZhEytj5vWhfpL8lpl6M0j7vRO7A7P3XpfdrGBpRxldhhDA2tdXZIv2SJoJ
         1FYAk1uiLpQrCSXvDXLqbJFGP04wrgDQ4PxUpti0xtW3XQtoOTPqvw0M4HiJwVsp3pr5
         DnUqbmBoWqJKmF4lIxDX3BYlq6EOFN+FwFYDt8K4J3gvLe6PY7xQUk+MR10o8N6PHrZ+
         aZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350085; x=1718954885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bNfBdFp5mZ2kI3ADKPWjh4YaxvbI3ApUdRoUcOWyZQ=;
        b=uiQaoosIwd+Nbw1y2Z6c0uHnrQhhrwha3k3kwyDNTEs1xwk/DlSH5ofUmORx1xXdCc
         W8SYEhu6s1HRwi5xVCNaZWFCUdObk7Ce1XU4QNkIWh6gPnDcbbsOKHvuRDR/iCcStx56
         HFj8kyejP4cx/ckJJqfZI6VxEOur/tLoqFntiGt1CwqgiLLMctv9bgIBqabJO3RYjcdF
         VVmZcMC7EQnmMNN9+0hCV/Cj32+i5B0jg1w4GqW31Ymeknrw/OwXQTQ9sLKnW4ycJ7RJ
         ErS9Urm4ua0pTi03FADVouk+hatLynHB1hvWWzic6CNxGQnuxP+AKJvDrtE7yWpbnfVr
         K14Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyacx+h9x6tE3uiQ7NR9Ov5khWK1ANFHpQpocDir9KCgpUPvWUPTHJO7FWa/Lqgug5Spn9GVJoKznMFZP1xA50qIUV3rjRC/QvnDo=
X-Gm-Message-State: AOJu0YzTPSJw9SA2S26CDUM5s0uK5EoXeXWxXHmfLRCctJCEDDkrPPF8
	KYDscsUVv0Q217wmDqQDcTnZQxU/YFFyWffMAfxQ3zYNDZecSD17W9sAAGIMtEg=
X-Google-Smtp-Source: AGHT+IEJND1fq1c0uKqBp70d1/dGzZI9xAGs92ktXXTGZKoDsZNDhRjzQbdqX2LqrYMoStDa7YrhlA==
X-Received: by 2002:a5d:69c4:0:b0:360:85d0:3c86 with SMTP id ffacd0b85a97d-36085d03d20mr176336f8f.6.1718350085366;
        Fri, 14 Jun 2024 00:28:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:04 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:46 +0200
Subject: [PATCH RESEND v5 03/16] dt-bindings: mfd: mediatek: Add codec
 property for MT6357 PMIC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-3-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2491; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=SWDpxVosRWcwhcp5w5dGFmY/1KI8cAMYk3ck/hCfKf0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D+I/oKQQm6/M7ruRFFizPFoZBPidH22eCRZMP0
 T2UcWeOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/gAKCRArRkmdfjHURdZND/
 4ylZ5IPjy/OzFOUB5PNaiFxsROAj8BRd6HcqJlZ/2ZUC2mfkXuXbBugwiP1VFhFowX7vkMBEs+NHA5
 VXIIsNhRUhKOslkiex4Olf5lQLp5QC8SXUTK3mESQ4I05ZRkCeunC6AfovEfD1iBxTVVdRoFXWK1Pm
 9QPu8EOCgbTiYrdcCKvSVbQ5ptTP8gUJE3b+R7ZnCxpXjUYnm/1g9DueJdCyC8fkNLML9b3oRKimpC
 E8UDv4drqCLmiQoITi5kAzkyGGIMOQpvHmw4JEopQZw93Nr/HtQ9gyAUy49GlqeSQydzINPTXnRbn0
 //VyP+7paab5PWOpt+Mfw/LZxWLzX56r0q96ZUjCt3rsbv0UeBKDNQ1qLXWHJ9Ow3hfv7MV3E7/+6V
 w3RqXLQ5Vq5ePUAY0Zgt+DJexy37wmkm8cH7wseXvQ6Am4X+XErXOd27NazXPKa+t3PuwF8umW1SRz
 R8PiEHvn7pnhRqtKY20Ixabqz2aI1gBIePkL6+q3KdRgXf8AumZ0VQ/JwGMEe23sdtsxsF6oAK8wct
 ubSpR4kJDobcgaLpB+CA11yhBhwdIdNnuLbWzhnPEd0+bgftmcmch5tFsBW+JvnHblWC6GCDUZRcCi
 bv70RD0njpP+E9yRWCpE8nhql4GtPTc0J/f4GPTaEuhe6iso3d09S5tKtYaw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add the audio codec sub-device. This sub-device is used to set the
optional voltage values according to the hardware.
The properties are:
  - Setup of microphone bias voltage.
  - Setup of the speaker pin pull-down.

Also, add the audio power supply property which is dedicated for
the audio codec sub-device.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..d95307393e75 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,32 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  vaud28-supply:
+    description: 2.8 volt supply phandle for the audio codec
+
+  audio-codec:
+    type: object
+    properties:
+      mediatek,hp-pull-down:
+        description:
+          Earphone driver positive output stage short to
+          the audio reference ground.
+        type: boolean
+
+      mediatek,micbias0-microvolt:
+        description: Selects MIC Bias 0 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+      mediatek,micbias1-microvolt:
+        description: Selects MIC Bias 1 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+    unevaluatedProperties: false
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
@@ -67,6 +93,7 @@ properties:
 required:
   - compatible
   - regulators
+  - vaud28-supply
 
 additionalProperties: false
 
@@ -81,8 +108,14 @@ examples:
             interrupt-parent = <&pio>;
             interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
             interrupt-controller;
+            vaud28-supply = <&mt6357_vaud28_reg>;
             #interrupt-cells = <2>;
 
+            audio-codec {
+                mediatek,micbias0-microvolt = <1700000>;
+                mediatek,micbias1-microvolt = <1700000>;
+            };
+
             regulators {
                 mt6357_vproc_reg: buck-vproc {
                     regulator-name = "vproc";

-- 
2.25.1


