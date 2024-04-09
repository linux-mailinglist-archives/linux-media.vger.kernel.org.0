Return-Path: <linux-media+bounces-8885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7A089D689
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 12:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 095291C21824
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 10:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF411129E9A;
	Tue,  9 Apr 2024 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oA8Y/Hx9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACEC85641
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712657630; cv=none; b=Qj7KIkphsSn2R+e1AMvTF73b8rvOcqzRrlAzKcZpwFL6lGkIC0QH47QlFtmtW+CO1DGJQTG7ZPcqsyl3kMx9e8dBNWy3gMDeiOiufoWcynKtd64zTL5/m+6Wd45FX6HYkJ0YGLTcS87xLlU8InSXkQGCUc1pNlX6lyjGVkK2uzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712657630; c=relaxed/simple;
	bh=ufC03TRzyDk5YR8DEBKesMFjVbHSKso6JjQ31AKWDaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sOHTM5lddM5NLAAuqQBL7auB/cm3P++IdSDpRzZWBQwWOYXBs5NTMgon46S7SVdwi8o+ItW3DW6/omVytZSW4bCEbxeqy1rW0d5Ml2qD5ZkousI/73Qqb++1/3rjzu1M92lxERf9uhm2q9HoeC8p9Nx9LKLD/51a49A1DD4TBYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oA8Y/Hx9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-416b7f372b3so592155e9.3
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 03:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657626; x=1713262426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORjGCzH/z+0lccA7K6wZO54EFsOktZ+W05TnMMd8cIg=;
        b=oA8Y/Hx9QKMALa2bhCr0Kj7jQwwU6UYu51peMOIC5lrTeuruE1f48Pw0CGGs5DruJB
         09BnYbc3BRTC+iudwZx9SLxhre4m9mcJZSNfj+OJcj8bQLOkW6tWjeejCaRX4r8uX/Xp
         YqBrqeIpHVihNRsI/tDN3R6WT7v7GygKJcXNSNr2k7HaJTsAuN5raPNqZY9ypkOKe72I
         6YlfKOJD3IiElIhHKJXUkyONnvMh+zkcIPolYs6tmOtqFzyfmK6mAjpDPEn3VFYJAvlq
         ToTWqrQ+HUxjV8XYUSkgOm1KTfS0/PybtboKZyFkz+pw9KJvdNzpNVD5QM9hEhOv3Fa2
         Vo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657626; x=1713262426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORjGCzH/z+0lccA7K6wZO54EFsOktZ+W05TnMMd8cIg=;
        b=XHaEjcPwgq7RQ+hPE1yNNgyffPQVo799vsxIcK1tRZofFYLlNs9frFa8xXqv01Y50k
         eI0MPxIs1iJ4kAHPAYXzG67FGbMEYeDF1Q7oyH0evOe1+IXgu01fImhnh4a3lLdVPwAd
         v//KAig6r2RwjvFJLXTRI8wH7xvhGq/eiUitqp/WbPY9N/DT/IJkY1wqKG1ieZZvNNLP
         qnLDBb1fxpcEZV8J/3qkSqFcixXNmWeg668FxXgNpXDcEIagJkgWeldHQBCAmcwmLqFG
         nhUIDgyZ92hECF0N+X0rf77dwe1bgaSyc22gnsGVbc41LZtWKx35k/0QpCpmOzXCui82
         K57A==
X-Forwarded-Encrypted: i=1; AJvYcCXT2FTsJOj+wsOaKO4YHJmbaY0YgZhWJ030Og2nM7sSIiI8wC3rhERAZHQ3dIGtnOm3qZDv3b6BeDdM7N9gva2/sXxklynhnU/9FqY=
X-Gm-Message-State: AOJu0YxGKk3cI/Hx+tqFIr6nTZGX9BEMYDi9y8S7dRvQ1g7UaYiOFvqc
	xH/9RDdG7FHk5zqgurxJo2MJqgSt0GKVBHmSJ4Uy1DsFSx8Oe1W4fPh6GdC8vvM=
X-Google-Smtp-Source: AGHT+IEsJPu/054QzozXEcR3cAKbGmgbpg6X8FhQfUnUAHkjL52ZMV/yQQbc2f2sdvpHT1vGB9wzLA==
X-Received: by 2002:a05:600c:350c:b0:416:667d:4691 with SMTP id h12-20020a05600c350c00b00416667d4691mr4530196wmq.25.1712657626644;
        Tue, 09 Apr 2024 03:13:46 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:13:46 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:25 +0200
Subject: [PATCH v2 04/18] ASoC: dt-bindings: mt6357: Add audio codec
 document
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-4-3043d483de0d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ufC03TRzyDk5YR8DEBKesMFjVbHSKso6JjQ31AKWDaQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTFKmit1LRHBjD3sVBNy1AD+EFSPxUwuPh5hBL
 llo/QJCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURRLrD/
 0UItyg9zwrmDQpm/gbTeRtQNNsOjxAl8PQIWG8EqnsHgcHKNZrT5vEhV+q6JscmsLBfKi1MnE3f3HX
 t2UyIjSKZTzyYdGRsCJEqMicDSryyY7IckznV0K7tVh8PNPNcCAtcS5y0BswhRRY/MsqEscAGm4X9Q
 0xfJfWpCXqVnfEz35io+YGQYh1pNdw+Sua5QmPXzWAJrd2ZMadxK6f6rjLEVPTjIrq16VYfEJuIlq3
 PPr/0cJx5AYi/70kI6NW1qds/TkjhJHMhcyVzG0yI6f2QGmhlru4byON2sRKKnoy/SKeqI7UJxW2bd
 ssbzSx4dxbtlzGwy0bFGjL9X5m3EN4oYAP5UTd5xR8pyG16Orv+/tLJaLX4dFEzkqtdCZXgnlY9Gki
 B4ohzq/yeLtxcLfZQwiIegbQWxTVOAxHIP+Q4uPLxCYD+FR/ZHVlVEbJ6QCmpK+sOGRzqiBv0kqY1C
 MUT1f6xaRnTvjkx3EfDKaXGUUV1sv71+gHTlrMz7q3gKyVaRHH6zYSWfIRD2PrzRfiZ66J5SU7IMxc
 FyKZHs9k/OWQ0E5jN0npkOcn0mqcrZ6iFWA1qK6xhyHu+61Xa6DKEkM6YcMLUQYwtP3/6o+JsQYnuN
 8a4gQu4guSBQODpZf9+jzZFOd1nf7gCoacIRWppbgdHhnfS9tvBXBVOcVI/A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add MT8365 audio codec bindings to set required
and optional voltage properties between the codec and the board.
The properties are:
- phandle of the requiered power supply.
- Setup of microphone bias voltage.
- Setup of the speaker pin pull-down.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/sound/mt6357.yaml          | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt6357.yaml b/Documentation/devicetree/bindings/sound/mt6357.yaml
new file mode 100644
index 000000000000..f532a9e7dff5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6357.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6357 Codec
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description: |
+  This is the required and optional voltage properties for this subdevice.
+  The communication between MT6357 and SoC is through Mediatek PMIC wrapper.
+  For more detail, please visit Mediatek PMIC wrapper documentation.
+  Must be a child node of PMIC wrapper.
+
+properties:
+  vaud28-supply:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: 2.8 volt supply for the audio codec
+
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
+required:
+  - vaud28-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    codec {
+        vaud28-supply = <&mt6357_vaud28_reg>;
+        mediatek,micbias0-microvolt = <1900000>;
+        mediatek,micbias1-microvolt = <1700000>;
+    };
+
+...

-- 
2.25.1


