Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1DF130B94
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 11:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbfEaJbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 05:31:34 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42975 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbfEaJbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 05:31:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id l2so6018950wrb.9
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 02:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rvJtQg+661w+5Ir5BueWWyrmozrX3JR+SPJBE4ojBNo=;
        b=HztvbtddFm0o/wzj4gVgfBz9gDX87DCVUe5fNi3WlmKcceoMGOS59ILOIA+oppmT9i
         Hx+8hKK37vNOxtIAd4nhhUiZeri7/gHgLHnOjfBVLXlAhHALWhroAKyCC2E5THBWPPya
         QmhZzbtFpjhLZ1KwOfY/NrXW8b9fiVsyeBQHj5+z45dT/IJNHTulASsqKa4BW00ZgeAn
         Z36w62rK3XRlBQNyvw3nDQhpnD9ohlyfVivFd2UlsbMi24/1gL6ndr6T3SaCyT6VRmwJ
         vevMu25h1j1gYvqOSFLkswxt8ypnEot57oB3gyZZXeYsScqIDLWMjkmSt5+e2Z5ZGT8K
         r0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rvJtQg+661w+5Ir5BueWWyrmozrX3JR+SPJBE4ojBNo=;
        b=Cq5SENhE5JsD7UJHVXp9UZnX4RqOcLUrkP7OYDZjMQncXuQw8s71pnqKyE1Xzr3HwF
         czJN9x+zYmKZL3TXvAA/8FP9/SHZkiyuFL+vFOZ15t+n58cDDGvH5VgPEH5Q3qMRWfUV
         Yxwif3+lomU/F92vnllFCucWTZeJ6ywQhjncVtu3h5PLfPemq8PL1Wi7MqXIRmc3xCWm
         0eLJd74lG5TWn9VQyo1K1DE0pLX5kvtqufT0Qzvm9PLZ8YzNCVXREcG2rTuhdQTb7qy2
         BluzEJFWMy1YB35mnDr16pze7mQcjSlrgBfLk7TUf8tbrwvwS4GGuSStBH1CVVhcuAwv
         D8Qw==
X-Gm-Message-State: APjAAAVek0cadaE04u7hLpHm9WRejKUaFo1S/5PGcIBDWaNCI3zddSmD
        ZBwnfDS0/5QEDaGlc42pD6Qqpg==
X-Google-Smtp-Source: APXvYqykUEMys93iiEwCmuP7w5CqsGhyG8Yk3Jmpbk3LQsC/f/QxSVCIY45nYJLLMoTJYHHeP8lxcw==
X-Received: by 2002:adf:e584:: with SMTP id l4mr5753247wrm.54.1559295091602;
        Fri, 31 May 2019 02:31:31 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id b136sm7187023wme.30.2019.05.31.02.31.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 02:31:31 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/4] dt-bindings: media: add Amlogic Video Decoder Bindings
Date:   Fri, 31 May 2019 11:31:23 +0200
Message-Id: <20190531093126.26956-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531093126.26956-1-mjourdan@baylibre.com>
References: <20190531093126.26956-1-mjourdan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the meson vdec dts node.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/amlogic,vdec.txt           | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt

diff --git a/Documentation/devicetree/bindings/media/amlogic,vdec.txt b/Documentation/devicetree/bindings/media/amlogic,vdec.txt
new file mode 100644
index 000000000000..aabdd01bcf32
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,vdec.txt
@@ -0,0 +1,71 @@
+Amlogic Video Decoder
+================================
+
+The video decoding IP lies within the DOS memory region,
+except for the hardware bitstream parser that makes use of an undocumented
+region.
+
+It makes use of the following blocks:
+
+- ESPARSER is a bitstream parser that outputs to a VIFIFO. Further VDEC blocks
+then feed from this VIFIFO.
+- VDEC_1 can decode MPEG-1, MPEG-2, MPEG-4 part 2, MJPEG, H.263, H.264, VC-1.
+- VDEC_HEVC can decode HEVC and VP9.
+
+Both VDEC_1 and VDEC_HEVC share the "vdec" IRQ and as such cannot run
+concurrently.
+
+Device Tree Bindings:
+---------------------
+
+VDEC: Video Decoder
+--------------------------
+
+Required properties:
+- compatible: value should be different for each SoC family as :
+	- GXBB (S905) : "amlogic,gxbb-vdec"
+	- GXL (S905X, S905D) : "amlogic,gxl-vdec"
+	- GXM (S912) : "amlogic,gxm-vdec"
+- reg: base address and size of he following memory-mapped regions :
+	- dos
+	- esparser
+- reg-names: should contain the names of the previous memory regions
+- interrupts: should contain the following IRQs:
+	- vdec
+	- esparser
+- interrupt-names: should contain the names of the previous interrupts
+- amlogic,ao-sysctrl: should point to the AOBUS sysctrl node
+- amlogic,canvas: should point to a canvas provider node
+- clocks: should contain the following clocks :
+	- dos_parser
+	- dos
+	- vdec_1
+	- vdec_hevc
+- clock-names: should contain the names of the previous clocks
+- resets: should contain the parser reset
+- reset-names: should be "esparser"
+
+Example:
+
+vdec: video-decoder@c8820000 {
+	compatible = "amlogic,gxbb-vdec";
+	reg = <0x0 0xc8820000 0x0 0x10000>,
+	      <0x0 0xc110a580 0x0 0xe4>;
+	reg-names = "dos", "esparser";
+
+	interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+	interrupt-names = "vdec", "esparser";
+
+	amlogic,ao-sysctrl = <&sysctrl_AO>;
+	amlogic,canvas = <&canvas>;
+
+	clocks = <&clkc CLKID_DOS_PARSER>,
+		 <&clkc CLKID_DOS>,
+		 <&clkc CLKID_VDEC_1>,
+		 <&clkc CLKID_VDEC_HEVC>;
+	clock-names = "dos_parser", "dos", "vdec_1", "vdec_hevc";
+
+	resets = <&reset RESET_PARSER>;
+	reset-names = "esparser";
+};
-- 
2.21.0

