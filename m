Return-Path: <linux-media+bounces-8928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6989DB23
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 15:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C7F51C20C4D
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 13:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305AE13BADC;
	Tue,  9 Apr 2024 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fDiU7tqW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFD113B29D
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712670165; cv=none; b=R/7+/8ckYvNCUFQRLgPu4UfLqHH/3gA2NX8VS0t9E+KmSWf0tOLlqQInNnSRPjOnPN4bIomEpcLJU58jUQnmtSGuN6pF137LvFv/cV6kxb2YsCpmThK4q+IbQb7fCFpLUhjcGCjmkta00P8zK3/7tQcgDfUdA8woSB9XOx4Jw5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712670165; c=relaxed/simple;
	bh=rmUU5KQQDjsuNrCnoS100FfCSVwtHEsMKsd4Yeoncng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpM7Jtz+19mqzhcSBEZMUAMR/dyXe8nPpL9vVTE15kSddwUuxHdwVK56okt9Fr1rtSlCDVrYtdECkl/PTlbsfVpsqaE8AgsObpN9T3kmLWs0k/fb9VooRe+udEajaUWEpTy3rtCnJ+0QNqw+hHVxOJz093rKgiyIqzNgopDfXkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fDiU7tqW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-416923f05faso9840575e9.1
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670160; x=1713274960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGsqJQWF1Ucte73TGgl0P2Cl+B2DHbp3lE/2oPwQwY0=;
        b=fDiU7tqW9yACIDyus/0TmlQx71PfJm/NpMwjDI62SGyZ+6KAfpgcpP/WWM4vLYqX+p
         51wrmgo1J4Hx7ZYZUP0MBvBtxmeJEXw/FR9wM1kfvt8rIl04W01veNv/Oz6ZIB2Fzo5R
         u6ke+/bCsW2SQH7XD8LG6QDXr5Tb4qKDCrvWxPVLwKfVMccqNhmPWusC7/CB3U9GzgSM
         y1UnY9N8QHAyuunVt7LKFc09Oo3wuKxp2f0MDj2r9s9EsUz01m9vvP8Abkbi+Bu+d+2b
         N9gAk+dNRMVlVOygCBI44bPdGJp31sMMnC1zKPT2gFhTtK0bclgjLqtlBipVfz1DDoWi
         zieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670160; x=1713274960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGsqJQWF1Ucte73TGgl0P2Cl+B2DHbp3lE/2oPwQwY0=;
        b=sL5qvHruvxHYjzYAwhcOjZc/VP/H9SiJGYLRnuU6/l8Je9oCw0Alfox+dbtU2mzAIL
         ns00zrt/8pHRcrr/AiioTnmsuzrzqwTpYBYjp67+Gp4WijWXDFpGGriuxaVaVUPQ6x2c
         cuDAxYHvYOTW0ITpi63nz/JJiz2wfsJ5fY9n+ncxTRaFDii7VinmJ8Vt/QVgJ9pEswbB
         rrtdUo1l6YoVifvbgYzDArBHg2rdLxMV1WjeLsvTBU8rDiNojb+Ao9xNQ7GURg5ibiju
         N7UWyslwePNf1hxTXqtaM59L+YjTOe7gy/I9wt1z6ROtH3nd4x4wtOLKcG35mhXoxBul
         DPTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWapS9KhHROOA1sqb9nX9OQz2QYuF1HhFbRte5pIME/Dd7TU0z4WNCh4v7Ncma/cwzjO2rNbWzDFKCfy/XLaSSVVVondiWl621KTMw=
X-Gm-Message-State: AOJu0Yzf8rkPWOUqH/ZfZ/5jQ84cx/0MgZfERdAHoPmyqvPLAVxdaifl
	DxxrPXIvBFOhCBiOaw3VHlDB5YYkqSUkS7WchzkCzevgAwXst8BRH5E0UCFnO5A=
X-Google-Smtp-Source: AGHT+IG/iRx5ir5/ovsIbMfS8mk5u5aphffFDwTLsfaRoOPMCr5c7spDQQ+GP6mftM7G0850xXAw/w==
X-Received: by 2002:a05:600c:4e0f:b0:416:7b2c:def5 with SMTP id b15-20020a05600c4e0f00b004167b2cdef5mr3740530wmq.2.1712670160253;
        Tue, 09 Apr 2024 06:42:40 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:39 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:16 +0200
Subject: [PATCH v3 18/18] arm64: dts: mediatek: add audio support for
 mt8365-evk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v3-18-16bb2c974c55@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3971; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=rmUU5KQQDjsuNrCnoS100FfCSVwtHEsMKsd4Yeoncng=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWs/X4+9lZbZVVrgUXvJF36fOR5nf9HCXtFKmub
 Eojk7WmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURc0wD/
 45bfDP54YfMymdYp1DrRTulxgf6GxTPMlbsmaYC/6cJOUqee8t+L9WtVMsNrp7t8LfGDU3lDY7DoRr
 6vNEioghcUnEv+Mc+SYl7wFoedQoAppu/BpfM70howwkJ2UVm+SUAzqgTjvtOwwEC4VY2h8X56zN2a
 LfJm6Zfjo5fE8H7XpUOf7F5E7EUR+eDKbDRrgA96OEuRy99jQrKasVCr+2ZDGx06J2yHrMAItWA7lb
 sR4Hy+3BRmHw710Xr0eta3e+SAHhqmDqcg9GQz8edgyqoFrmfhDzrsKuaRgVJksRLvo0/fyJhh8BWm
 ggJ6j0JO/EvFhhPG8VtKzyOpEtPw87GXwpdiBAHKbfVAGFgbK5oX6uA0oP78kar8WPv1YAloDpEsx+
 oT+0QUuFzIu5TZjr2P00CZGUA+c1VVw7I5E1v7M1a0OwqRmjxd2H52CWPX0pxnkYQ+ZWfJOWqaZEfP
 JXM3aiqQLbew/R2iwVrMQlh0VkmWg0D5y+oSaN/yZFTY6Z12MNzp+ylKx34w6s4Nuw8dpsS1At7YxO
 Y3NzNjq61mtNk2oI6AIFWkeDyXsCWAYYySPd52T6MeQ79lwvWkBgUBURjyZQ0LiXHZomCM5OOEkckg
 92hqaIi3kf8aFt6cxW2WzEKL1eAKxDEaYjMgHhcYn6CjpygtttRwko/+RTGw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add the sound node which is linked to the MT8365 SoC AFE and
the MT6357 audio codec.

Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 98 +++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..eb0c5f076dd4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2021-2022 BayLibre, SAS.
- * Authors:
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
 
 /dts-v1/;
@@ -86,6 +86,29 @@ optee_reserved: optee@43200000 {
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
+		status = "okay";
+	};
+};
+
+&afe {
+	mediatek,dmic-mode = <1>;
+	status = "okay";
 };
 
 &cpu0 {
@@ -174,6 +197,12 @@ &mmc1 {
 	status = "okay";
 };
 
+&mt6357_codec {
+	mediatek,micbias0-microvolt = <1900000>;
+	mediatek,micbias1-microvolt = <1700000>;
+	mediatek,vaud28-supply = <&mt6357_vaud28_reg>;
+};
+
 &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
@@ -181,6 +210,67 @@ &mt6357_pmic {
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		pins {
+		pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+			 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+			 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+			 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		pins {
+		pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+			 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+			 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		pins {
+		pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+			 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+			 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+			 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+		input-enable;
+		bias-pull-down;
+		drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		pins {
+		pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+			 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+			 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+			 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+		drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		pins {
+		pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+			 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+			 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+			 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+		input-enable;
+		bias-pull-down;
+		drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		pins {
+		pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+			 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+			 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+			 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+		drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;

-- 
2.25.1


