Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826A937579
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfFFNl2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:41:28 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50855 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbfFFNl1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 09:41:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id f204so6140wme.0
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rvJtQg+661w+5Ir5BueWWyrmozrX3JR+SPJBE4ojBNo=;
        b=epqA8snisuMOJjsCRHRs4ABxlZ4Ah0ynD5cOGieOCE6xNXqIKHS9naxqBPAKDX/ljA
         s2BHAXGh0Da0FPyfBVTHnyMwDXj5mv2NE9qO6tiQIYbYIldEFjY4u1AkeFjy6lPqxhb4
         GKf6UuBk8ReIbWkN+adsBrSeMzydKbOQX6xR+B7EtkKIXAHVorej+hhjbc5Zp2sd6n3d
         ROOCUmS7figyruVean2pjoZ76e6d7aaGxr2p9DX7juN34u9YMjgiLZ3vzN2SgDpTMcVS
         cndGynpLHxtAWVelFgfeHN/iT1SVcEe3yxjw26+j7Tj3+XT0CHdlkU/mQw2CsU68ebjx
         kMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rvJtQg+661w+5Ir5BueWWyrmozrX3JR+SPJBE4ojBNo=;
        b=a1ujdOKjxnUl42zMbmCgSFun1y8kTs6cUgb4APwRimejuwecfv0wCOYOkfzgB5Jbws
         bCBPIvggs+PIr+gpdSDx55oS+nEzpP2NokNyYVQ7vEB/da+5n+YWHj7p2GCAdEDvostx
         jKLFFlBwB2qQPVvhM7qIKJo3ssj0yj3yXzPD+jPdIDc2Op22UV2mCwRW45Q70cut79sv
         PuaX+ujgHVpA7Enn1+6xpSU+BghDEmPD8jcggTufKJTzrybAOhd13M4kHgQai8sqZLx3
         hNP8gebC8abCk7nF9prCrNBkNBKNJVJ5I1ZbGp+VnG/S1y6yys3vP43N8vQ0WFLO22Dz
         W+Nw==
X-Gm-Message-State: APjAAAXrQAXVi41/e4pi4d1o+VZFPTXOcf0Xqkc4ndCrLqyD7IPMYsfL
        V4mCgvoCTLOz8yj//mYBwJh+fg==
X-Google-Smtp-Source: APXvYqyUz9ERdzTV16FuBLlIL19xpvBj4x9W8VO9ERJ+Gy5aGKOAQQJxS12TT7MNuE5xUIoneJ/uLA==
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr51169wmb.152.1559828485613;
        Thu, 06 Jun 2019 06:41:25 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id c11sm1847367wrs.97.2019.06.06.06.41.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 06:41:25 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v9 1/3] dt-bindings: media: add Amlogic Video Decoder Bindings
Date:   Thu,  6 Jun 2019 15:41:20 +0200
Message-Id: <20190606134122.16854-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606134122.16854-1-mjourdan@baylibre.com>
References: <20190606134122.16854-1-mjourdan@baylibre.com>
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

