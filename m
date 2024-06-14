Return-Path: <linux-media+bounces-13244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26526908519
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66ECEB24FAD
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B461822E3;
	Fri, 14 Jun 2024 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mQl5bbZO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC118F2F0
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350110; cv=none; b=cLhCy4Bc13dRMlFKLMfWZQXhzBjuwhbyKwQm+fa2m4M+Hglo1xnCZNJxCdPSq2/ZuKSl53w/AgZXYzXCI/AAOsa9vprnbTI6LqNVEBn8VXE/QsvzyKykEqx4PsUxslLiTdRBk9+hYMS037c1xRpnGCBFBLzPETz8F7EBsQRrJgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350110; c=relaxed/simple;
	bh=UuxD5pLm61p5B/k8KPZWLUQ0/L/5Kc/UQPpFC3tu7EE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnx2zUnp6aSzqKWgqmMI5ETXvbzKR68mkOb4tl8J8ugxWGudMAzMU34mlwrrwGHCuK1jPuIK2FBpe1v2WFK/pm6FbPdZzH+MRrnO8uoj6EjdqCN5tf7sudfr9xz/9k0cBZz0ZvpvvUtlM9VuHRvqawczlmdbfwxPThhkMw4TCrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mQl5bbZO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-35f1a7386d5so1812986f8f.3
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350106; x=1718954906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=;
        b=mQl5bbZO34iLrka0mjb7+2gVgRJsPWm53WRHCZgaNMcKm33JsVSAklJVBS23GVAvjI
         lKPntEr2WjDZtJuYMiG17k9cm3d7i8vIC+xkRuDAni7Lu8/nHB/jCR++6F2TVWAQZgjo
         G4Qvwy7zNxtPLkxNkwUI303hWxLog5dy9LcEAuMZV1RF17mV57/ReTxTz4ODKca1YLAN
         6O2RkNkqvugJzBgzgkznbbrw3WXFJ86vvvo6wMLzEIZ9duyOng2tad24kbMqOqI7D/KD
         6OKYt/VW8dpxgopxU9O2Q+3ToN2DV1YAI7LLzHzYNvvipZStWm90L8SraArAh5exbjaa
         seww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350106; x=1718954906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=;
        b=cmqVxf0wG895gZb25LeQSvGDpNPb39ujOVZCcPMq7VS7Hq15uEvRlgVeFZmCZMfRUU
         l0sET6cC9SgRKv3mElczyXs0t27wRSdnajFpeGUg0avpm9hIWJJsYQaNuRRlsB5RB75P
         BVGc96i7GnMtc2rGEOvP5C+gJdzg7TaqXauc1TIhD4dLO0EXuRXIQSjBkIvhqY2sa5q0
         vtQwSzCzGa4zCk8NqM+uGoPv5XLt15J/PqMrXbTG+EcNzbYWF34X9JzvTs3qNnjA5sTS
         loUYA4tRbYrlgLDaeU8k+evwisy9fnhpvL4+a8d36f8q7dYlr9yAS22v3v+a2HlmEHcU
         K7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0nQU9NX7ntttXvT0LvpTs6lL4bNGiNLI0LRNZGLsBFX5IK+xr6ON+MrORJkrUNCqSaYNICs5Aw4EhthsHp1AirrQmSCOJPkaxXWY=
X-Gm-Message-State: AOJu0Yw/T1w/d1WGnQkbfUcnPleMH0I2fvBQ+U2PrHQHVKxC+VObuVFJ
	xb+xwzHJ9FyljGGYcPvOfLtvWS9om4Pzfd0sPevWl3u5sVGGE0Vhu1ozjPWOqBc=
X-Google-Smtp-Source: AGHT+IH1sau9xgdmWet8z49jHSmkMTTRejgofw6/ooSXhPGDtc47ElNp4Kb4O4tkJqcFbLYVG+36Xg==
X-Received: by 2002:a5d:458a:0:b0:360:861f:b7d1 with SMTP id ffacd0b85a97d-360861fb8cdmr69680f8f.65.1718350105904;
        Fri, 14 Jun 2024 00:28:25 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:25 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:59 +0200
Subject: [PATCH RESEND v5 16/16] arm64: dts: mediatek: add audio support
 for mt8365-evk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v5-16-54827318b453@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=UuxD5pLm61p5B/k8KPZWLUQ0/L/5Kc/UQPpFC3tu7EE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/EAEfODnnPkRsdd11u7PQ8F+DYOn/214x3OG4/P
 dgywbJeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvxAAAKCRArRkmdfjHURSTgD/
 9WpD0NJGEfi+cnsDUMbr7XRL72nxkXLtxsW9HyxixY20WGfs40QUu6OB4Goz91wTndbMDaiyjhTh38
 cKt48+pCpGFd5DA1RE8R94l4xxAbStT1gJtN+VLDzvnbz/ASZgZt/pSW7LlF7ce5fb5lBcvLLnlJ8J
 VN8A+/iTg3LdDcp5+vI1NhrbxNrg1L6mAnc7fJiExDcWumNzbH+kjPhHlXOiZezbPWOgH0QmzU29gp
 XaSA9B9egE0nhUpkrSR5lb68O/fFrtqYnErY1Uogmy3Gp11zRBoPl06rC+yvdNOewYxr8cVlYqF5z6
 O8KSlYwinzzBqLsx31eVUzHwH1+T+QarOiwfAyM1/BAGhjlfrXnPGaRB/3VeMliPQtoM90B34Y12ZA
 C/ErsI0t/LDJDE7MP2DpXmKI5GsDo+lwan+94XdGGf2U3/jgh8Ba5CIx5/vUCfNMJ3C/gw+HTw2Dov
 purJinwm0+7HsrG4Ky/LA2qFhaEHRNrmUcBAjUefjoeVzVT+J3ReRLJc2fzZRsKeENH6YN6QEW3VAA
 peArTUI2/QRsG6m4CATcXqZ1vBzS4KpkbmAxkRn87lBsT43rsUROWDZS28P58FEzmWXtAJC6V95x00
 zGSB718brYCPeugLXWEZmYITE6GCAOQ3mDwRcFLZHUfdCbbYf9biZPuyrcxg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add the sound node which is linked to the MT8365 SoC AFE and
the MT6357 audio codec.

Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 89 +++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..1d5457f9a4c2 100644
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
@@ -178,9 +201,75 @@ &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
 	#interrupt-cells = <2>;
+	vaud28-supply = <&mt6357_vaud28_reg>;
+	audio-codec {
+		mediatek,micbias0-microvolt = <1900000>;
+		mediatek,micbias1-microvolt = <1700000>;
+	};
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		pins {
+			pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+				 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+				 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+				 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		pins {
+			pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+				 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+				 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+			drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+			drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;

-- 
2.25.1


