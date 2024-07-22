Return-Path: <linux-media+bounces-15215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D44938939
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 08:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A34F1C20F52
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 06:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336AE28DC7;
	Mon, 22 Jul 2024 06:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iV3xp9i7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C244A1BC2F
	for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 06:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721631225; cv=none; b=gpntcHe8H8T7jk/J8/32lcKaLI6GD2xc9VD2TWEv1RNu2NrJtrca/I1lJMDZSievWJvSldm3SHk1C5J3/XB2wJxs4oxi4qbV57lyk2rLV2h84MO9tKlQOwwX7W69wDs9ae+QUCkzPf6XrIzGKNS6KNMbYW1S5zmKMQqs9I0GG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721631225; c=relaxed/simple;
	bh=UIlaXrHC3JXqJmHxOl8jKxQMiudwmYCtEVWajCQIFbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FsColq0bkXJCKrNUIe1/elegEu/towl44T9jROt25YfqSzLaTZyprMJjNUX4T5/YVF3RJ33yaukUsKh2vGK14FZefPDcDadGxafdqiMrek36cS4ThcpnTYFLBGpBf9G+hPmmv9L3lTnk9/O916BaYUUuPgv+fGi/0Mpts8/fOFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iV3xp9i7; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a3458bf7cfso2736370a12.0
        for <linux-media@vger.kernel.org>; Sun, 21 Jul 2024 23:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631222; x=1722236022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+3ze/IP2QrseHnlo80eunkZiTdbCzauDagUJ/lYngU=;
        b=iV3xp9i7kT35cHeFJkYBYp53CZTwmyE4q9/lcMlaHmQvlIvf71JQwRMIOf5a9ND9x9
         Y5aIITmvdiFr6rrO6SWPVebF1lxnw6zvrNUF1Aqq//9ZlwMDk1CuRWV7Mrt7LAwxKCTZ
         GWxUJCQ8zjZt+UEgNTZ+6ddJ6UU4QsILSMC5EniWKWMZoTU3fOa7tay4tQQpwVdrT8YQ
         0Vbbf7RaxzrjSm6UeXIz0n2z8YUD0ewa2kl2zVwre/kdFcRt4e+PQp+/K3ohPW7kULNr
         YRHkmZ2+357zNoqGuf/7CieeaCNgUncXGau5RPVcsM0Y7nAm/Q4XCWpIrK9UZUR1emWK
         SkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631222; x=1722236022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+3ze/IP2QrseHnlo80eunkZiTdbCzauDagUJ/lYngU=;
        b=S/YyCyTZOenkVtXs0ScYxt5O/zx0JOrjAQdBU3/BtcsLPRTuSJCr5LLhT5+BsCYeb3
         Wp3/v33sThrVk8J4/I65pr8GZd8F344KPNBwDm4pdKMjaFHgpI3RXYBYmE+4KvhCSkB+
         wyt8tbI6Ks2pgkdNGfsWCThh1l2C+J5BEusXRtZIYosiYkuvHX44H99S355mqkdUwWfh
         5aiM4SK3iC5UB5klalvGzGJpjy3iReSOEL92u0mKNOE4qjWSUzjH6x9q/PiLYUH3IwFd
         hX8YYiU6nIzoZOqgHrsCThMPVPU5pbq8zI7ToOzW/RqgnSGkO9WK10tWObYmDjdwGKZa
         ktHg==
X-Forwarded-Encrypted: i=1; AJvYcCXNUQ8Kp3tVewaN1B8+C2WSWZVOn7/Comp/gmGf3bmbVxNgWhUqosu7zb5YT/NMz0Av7wWWxXClGu2GYmaTuubhM/C4IMz12HTrYOQ=
X-Gm-Message-State: AOJu0Yyo4DAPiWvC7RDJdvwDyPLHNoXRdvG1mNcIOXLP4Og5EyxaozY8
	Q9QWITMH0JvNCPfCvz/FnTHNWUK9i3jTL7130hVpqgJw7TBQEfqzmIrzDUkS6qMCLRLZEPgc+1C
	YB58=
X-Google-Smtp-Source: AGHT+IFJymhhbtomjKgP2gDQkxgVKRlXBgHheppPAvjAkJL2snZBn5zWFyPNQaFdccjRosPDO5Nvtw==
X-Received: by 2002:a50:d699:0:b0:5a2:80f:f7c9 with SMTP id 4fb4d7f45d1cf-5a479970367mr3223477a12.2.1721631221950;
        Sun, 21 Jul 2024 23:53:41 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:53:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:32 +0200
Subject: [PATCH v7 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v7-3-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=UIlaXrHC3JXqJmHxOl8jKxQMiudwmYCtEVWajCQIFbA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHwcvHRLjV9AcqoRaSL0Yq3rkWT8qbII8GiPHlR
 zhVMDb+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8AAKCRArRkmdfjHURZeBD/
 926K6vv60HlYRpqFEOI8Rwz/HhG/pQHXFSsTFR1tDqg19ttpvN7X4FeGuXGeLO3Mc4JFp0Ahn4vEsW
 1eL5yXsXgmfrvhpMzj8qts68wnEwk2CW+P8Bm8iW/OKVySOc5hirQmJW+ffaKrdOp8pyP4ZsBrpyho
 qAl9LhWp6stCrQcX2lY8GfgZ3yqsvV66Brh2ifPjGaC4m++c2Dh5gSe+Vx6Ki072ABSePEitfqdFrs
 oeS6PMqXv9C/swOSKY+5qaBD45/zThXsyOnBvpOUC8AEr4NWwr2UETodSaHSOuzHMfSsH8jOZlmmz7
 bA9hpJcXSttRsYL3v4F9D91lfa4xHKqkNS3Hs1mWZbS7Q5OGAPn+DstZvGjYOPHr6B09+SJXLE7Qoc
 2870Tqjt1bdFTjz/l4nMMeET3IXvzwGLI5/1fBlmWFql2AYwZnKhsUNexYhGPq5iax4We1cxnCjJNC
 7woyOHGJFTwHsiZZ2wFr+9draTok5hflT2TeOUKW74HBQwUz8Pf6n7LgsVNW3KZcQ7256dFL6b5BUZ
 F/1B11dezdLMqSVo3WmFOGQXx4tEG4lh/AXO60JCXrz7p4d4DfC6rY2LBzEhvVi4dTlHoskzwRHmDr
 mR/+dFiQa9OLoCvr12SnKK3MARcMhluKNqIm0yiZOuDAauFDTNrCDVf9mDJA==
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
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index 37423c2e0fdf..b67fbe0e7a63 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,6 +37,24 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  mediatek,hp-pull-down:
+    description:
+      Earphone driver positive output stage short to
+      the audio reference ground.
+    type: boolean
+
+  mediatek,micbias0-microvolt:
+    description: Selects MIC Bias 0 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
+  mediatek,micbias1-microvolt:
+    description: Selects MIC Bias 1 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
   regulators:
     type: object
     $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
@@ -83,6 +101,9 @@ examples:
             interrupt-controller;
             #interrupt-cells = <2>;
 
+            mediatek,micbias0-microvolt = <1700000>;
+            mediatek,micbias1-microvolt = <1700000>;
+
             regulators {
                 mt6357_vproc_reg: buck-vproc {
                     regulator-name = "vproc";

-- 
2.25.1


