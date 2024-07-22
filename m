Return-Path: <linux-media+bounces-15228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC456938969
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 08:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF2FF1C21A65
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 06:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B5812E1DE;
	Mon, 22 Jul 2024 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yJ5dKDYi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D187078C80
	for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721631255; cv=none; b=ns7YhAHn8CNwLF/DTjpXR4YHRbVZBjLx373R9Pr8gyaX8vLc0fZkSoh9NnYBQTMa5XYIe9A4nlE+OMuVt4pJ8A5j2ZtynRIleNM0eiEAIu3N5xp9cGZDHlAEutXx1JMReyDbU73Jc1Z0euk0eQ2WzqzhSNFqCF6UltaDZrh9fBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721631255; c=relaxed/simple;
	bh=qUIeCtFecA8nmqn0H3dpPJSUWwNz+5gepp/PnumnSJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOklusDe/KyaHPfh9n9sORE84WpLOcYnqzXhtVsWjMtHVWieNJTok/W4yOWEmkS51ScrUFFRtm3vNbCK5alF0TFy9+JPmhNZIukIP2Tns8EZpz+tij9LHw+PSXoVN3msfZD5LRwh1XbXvhlRKt04fzCSwIi10eBhnaG2nPA8XD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yJ5dKDYi; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a10835480bso2840158a12.2
        for <linux-media@vger.kernel.org>; Sun, 21 Jul 2024 23:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631252; x=1722236052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqkMPJOSzbja9rCDv1W+aq1XxPAw4w/o+YYYBlTqJb0=;
        b=yJ5dKDYiIitvDlIearS+K1B26h6i0OeqpGs9pfQx8UBIMHkMa/JrTakYBziuakYGtj
         Zo3uscKgTHfUm1TnAF2lg2za5YeMHkfkA/jt58HEKj0EhZ0PmkRKW6PNN1eZz3+6Zicq
         DVA7rLm6KAdhVYrr+p0slHRhjmFKo1d7F7rXdict0TiC/Uc0QDBu8iTokj4GJJ/PJ1Vr
         WPSEpq6QRKAWb7f9r12k3hov6DAPn7wOVAukxxluJ19J3ku0dHdKZ6P/qgdBwYYQMXf4
         7gSfngzRC1GuqGW6sfXO+xjK5NeK6x3M1NWIvkdMWfUUfBxlVOfUoBhBk76jwR08KRYt
         NH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631252; x=1722236052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqkMPJOSzbja9rCDv1W+aq1XxPAw4w/o+YYYBlTqJb0=;
        b=ZNQxJHBbm3ZTMHP2zKVtpRbbHADqGC3RUQLdPq3GucYcvc7obLHghLmAz3psR9v570
         ad62u73Rixy1E/adlK34+zQfCSCNv+sbf7bNh3fl17Sod8TCOGL98YbcSwp8tXV4JeJO
         Q+8iIe+AD3Mz71rEGKpZmJjh0D9VEulDKjYzR9scTFh2PPns85YXRto94LMS+0YFTRUl
         9fSXu9Db8Y0B0S/T7hp7VuNLNbyq7lguBjG3rBcixf7514ZNMrvnyeiaVrMgpXMC/Bsf
         c3z5XSDVcRLsPR67we8x8V9DO+/eI2khEzBBBW4GpXKbPd8EjtKyiTqbEVqcrkYvCaJ7
         dSUg==
X-Forwarded-Encrypted: i=1; AJvYcCWI4PItn2GDKZgnxD+FjlRyVzOV1JJqZK966PMh5YbIGimbaLbruidXfqxZvM3R/jZMfPnxhB3JIc8vfAlVSDJFRENAg2J6soWnV7k=
X-Gm-Message-State: AOJu0Yy/ijmBTrc7GsPswevw25DKsr8bABRD0Zfu7QKa/lINwQ4ZwfSq
	73+WW3oMD8MsCekqtItJFx2IGSesMUAmcH2G08q935AVEikNepx9WLimSVjXNxiXRLWfrNVF4Ff
	8NIY=
X-Google-Smtp-Source: AGHT+IHEChH+y+Y9XHfXiJcOJtbcMIXSn76WcXLtLzJTBXBNmK3LPl3PbBmPLI53uuEd/e8+kC1KLw==
X-Received: by 2002:a05:6402:3482:b0:5a0:f8a2:9cf4 with SMTP id 4fb4d7f45d1cf-5a47bc87334mr3553300a12.25.1721631252131;
        Sun, 21 Jul 2024 23:54:12 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:54:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:45 +0200
Subject: [PATCH v7 16/16] arm64: dts: mediatek: add audio support for
 mt8365-evk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v7-16-6518d953a141@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=qUIeCtFecA8nmqn0H3dpPJSUWwNz+5gepp/PnumnSJE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHxbH6X4/4QzRgM+QgRXmm3F99YLaY9HWnsQS4a
 /UFBkXmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8QAKCRArRkmdfjHURaajD/
 9qc9SiPZ6f/ido8YKEvVNpxPUjppH67+Y/FT8IyHS4jCG8xQaHbhoIxbK4aao5qYB8VbDyENZ/xeVd
 DaO53tHrc5jaZ4Ys93ylidN7ahgJIAjCE43g/loQSWFuydofSJxoGmj5xHeNoiR25S+6cZO0TzY2F1
 r6dplliF/3H7/PNZJ9yOJpDQKNvVW2doY5alyuS3jKbZjg27V+3WW6jyK1aqCoP4FGP87YcW+46hLN
 U028Og4XEpIwKe+Y+ttGlGr+ytMWKnP+kuEeHrfJlf7H8DooPHvdnTlrW2AUCDy8FN1frDm1F/1xL6
 1RxeAUEA4orOsS5z3MULiDbAhFiZvHJWk7lu+SnAaC3aRwrzEf1QFe5Me5C2e5eSQeVFSsa7g8X+//
 Y+NWAtVvzuEzwOU88v9c9GVJmhlqSPm6FmoYgqcYohaR3/KlSSNN9ETgMdDJhRUCRW3Vcf33Dp7cLT
 wedVj/reYhgnxQNix2dYCEUo9Caf1fSDDPe5BzxjkgtVb2PP4fQi6KcWfQiUi7BvAWTi3CUSJY/8i/
 3D9XCIgtpbk/5ayjOEvsnfblaPiWfYj3tc4C1rpvto9zueYprgjJMHFY3wYikBKE8TJyw8YRabNU8J
 ogwDyFATJ2Ehk9X2o5nhFKXc0ZrGGvLgWKo9eiIrLW9iHQlqKWi2lnhz2MCw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add the sound node which is linked to the MT8365 SoC AFE and
the MT6357 audio codec.

Update the file header.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 86 +++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..6288bcbef241 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -4,6 +4,7 @@
  * Authors:
  * Fabien Parent <fparent@baylibre.com>
  * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Alexandre Mergnat <amergnat@baylibre.com>
  */
 
 /dts-v1/;
@@ -86,6 +87,28 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	sound: sound {
+		compatible = "mediatek,mt8365-mt6357";
+		pinctrl-names = "default",
+				"dmic",
+				"miso_off",
+				"miso_on",
+				"mosi_off",
+				"mosi_on";
+		pinctrl-0 = <&aud_default_pins>;
+		pinctrl-1 = <&aud_dmic_pins>;
+		pinctrl-2 = <&aud_miso_off_pins>;
+		pinctrl-3 = <&aud_miso_on_pins>;
+		pinctrl-4 = <&aud_mosi_off_pins>;
+		pinctrl-5 = <&aud_mosi_on_pins>;
+		mediatek,platform = <&afe>;
+	};
+};
+
+&afe {
+	mediatek,dmic-mode = <1>;
+	status = "okay";
 };
 
 &cpu0 {
@@ -178,9 +201,72 @@ &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
 	#interrupt-cells = <2>;
+	mediatek,micbias0-microvolt = <1900000>;
+	mediatek,micbias1-microvolt = <1700000>;
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+				 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+				 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+				 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+				 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+				 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+			drive-strength = <6>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+			drive-strength = <6>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;

-- 
2.25.1


