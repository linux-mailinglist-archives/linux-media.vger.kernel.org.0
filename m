Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81CD712952D
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2019 12:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfLWLeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Dec 2019 06:34:11 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39107 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727175AbfLWLeH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Dec 2019 06:34:07 -0500
Received: by mail-lf1-f66.google.com with SMTP id y1so12361127lfb.6
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2019 03:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T1y8MMPNkqcrm20up1WtHiDJ34NUPmK2DHqDsNPyhC4=;
        b=ADm3wWZImcglGNzePYJDfnN8M0JUlQ5PtPe5E50RqqFWTmMTtETsAvZo4NeNhckwqd
         E28GFEn43RSTWd6NisqrDH6TTSBVK5M0of3J/cfGmfvVbTI8Ex7zk0866p/pJXK5wqiS
         +C28+fUx1PYlT1Rr5ZIlZn6DM99d+5JVZ7ModYadUCL9hnaOzWcgF4UZfUSEgPdXuP5i
         h9ewBJhPXtlBoXiWfYZavGFP3+SUEgwnpmM31PCPfUe4wy2RE428/xp6tJQZ5xfGB2OC
         otmTsqRcJS4I5o9bvWDho29L9S8Vbm5p/bcZGVkvKSKkVdXEUwv4Ul6n8Z6KJ/eT4ZiS
         CGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=T1y8MMPNkqcrm20up1WtHiDJ34NUPmK2DHqDsNPyhC4=;
        b=rX3J6Y552R9TjsynMBwJC6p9kM/U8LmOf5agUq9lJjifPcK2vgR81ftTrtVuo5Gm9j
         iSr7M+hH7UbdZj6wABPijhAMLOuzjQuAYROmIX0aVCiizGL3DrkO5T0cLWlciK4P51fM
         f9AKCmYtJZTlQU3q7BH1Z77LIW++x4vkx/vc9mslD6bMt3fnB85ycteceTquZr7kC4fM
         CNBwMuRR1PkJyaNDCMS4USu8iitpLn4tdTXbXg+2v79A2Ygm82SE2K+n+TQSWLACFYxB
         6i3arBx0w0f0T627Ej2Jasv1NNOa2MYQK3moB6UquUfyireg82Y/1S+rrQcAooNrnLQc
         HuDQ==
X-Gm-Message-State: APjAAAX4IcpesdNjfgoqgZEQAPhxfE91vbGbou35EV2YeZCHfn+nA7Eo
        cQUWmJZNXfqvCJGaFkasWK/PXuRxNR0=
X-Google-Smtp-Source: APXvYqz2kQqY/39Q+EZKqXZwbPvv6tw98YGX97VVrwhkh+SlFQbNfb7b4baKAf9tTl7Z0bnVOKJcpA==
X-Received: by 2002:ac2:4a91:: with SMTP id l17mr16799912lfp.75.1577100845219;
        Mon, 23 Dec 2019 03:34:05 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id g15sm8381500ljk.8.2019.12.23.03.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 03:34:04 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 12/12] dt-bindings: media: venus: delete old binding document
Date:   Mon, 23 Dec 2019 13:33:11 +0200
Message-Id: <20191223113311.20602-13-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After transitioning to YAML DT schema we don't need this old-style
document.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../devicetree/bindings/media/qcom,venus.txt  | 120 ------------------
 1 file changed, 120 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt

diff --git a/Documentation/devicetree/bindings/media/qcom,venus.txt b/Documentation/devicetree/bindings/media/qcom,venus.txt
deleted file mode 100644
index b602c4c025e7..000000000000
--- a/Documentation/devicetree/bindings/media/qcom,venus.txt
+++ /dev/null
@@ -1,120 +0,0 @@
-* Qualcomm Venus video encoder/decoder accelerators
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: Value should contain one of:
-		- "qcom,msm8916-venus"
-		- "qcom,msm8996-venus"
-		- "qcom,sdm845-venus"
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: Register base address and length of the register map.
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: Should contain interrupt line number.
-- clocks:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: A List of phandle and clock specifier pairs as listed
-		    in clock-names property.
-- clock-names:
-	Usage: required for msm8916
-	Value type: <stringlist>
-	Definition: Should contain the following entries:
-		- "core"	Core video accelerator clock
-		- "iface"	Video accelerator AHB clock
-		- "bus"		Video accelerator AXI clock
-- clock-names:
-	Usage: required for msm8996
-	Value type: <stringlist>
-	Definition: Should contain the following entries:
-		- "core"	Core video accelerator clock
-		- "iface"	Video accelerator AHB clock
-		- "bus"		Video accelerator AXI clock
-		- "mbus"	Video MAXI clock
-- power-domains:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: A phandle and power domain specifier pairs to the
-		    power domain which is responsible for collapsing
-		    and restoring power to the peripheral.
-- iommus:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: A list of phandle and IOMMU specifier pairs.
-- memory-region:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the reserved-memory for the firmware
-		    memory region.
-
-* Subnodes
-The Venus video-codec node must contain two subnodes representing
-video-decoder and video-encoder, and one optional firmware subnode.
-Firmware subnode is needed when the platform does not have TrustZone.
-
-Every of video-encoder or video-decoder subnode should have:
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: Value should contain "venus-decoder" or "venus-encoder"
-- clocks:
-	Usage: required for msm8996
-	Value type: <prop-encoded-array>
-	Definition: A List of phandle and clock specifier pairs as listed
-		    in clock-names property.
-- clock-names:
-	Usage: required for msm8996
-	Value type: <stringlist>
-	Definition: Should contain the following entries:
-		- "core"	Subcore video accelerator clock
-
-- power-domains:
-	Usage: required for msm8996
-	Value type: <prop-encoded-array>
-	Definition: A phandle and power domain specifier pairs to the
-		    power domain which is responsible for collapsing
-		    and restoring power to the subcore.
-
-The firmware subnode must have:
-
-- iommus:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: A list of phandle and IOMMU specifier pairs.
-
-* An Example
-	video-codec@1d00000 {
-		compatible = "qcom,msm8916-venus";
-		reg = <0x01d00000 0xff000>;
-		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
-			 <&gcc GCC_VENUS0_AHB_CLK>,
-			 <&gcc GCC_VENUS0_AXI_CLK>;
-		clock-names = "core", "iface", "bus";
-		power-domains = <&gcc VENUS_GDSC>;
-		iommus = <&apps_iommu 5>;
-		memory-region = <&venus_mem>;
-
-		video-decoder {
-			compatible = "venus-decoder";
-			clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
-			clock-names = "core";
-			power-domains = <&mmcc VENUS_CORE0_GDSC>;
-		};
-
-		video-encoder {
-			compatible = "venus-encoder";
-			clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
-			clock-names = "core";
-			power-domains = <&mmcc VENUS_CORE1_GDSC>;
-		};
-
-		video-firmware {
-			iommus = <&apps_iommu 0x10b2 0x0>;
-		};
-	};
-- 
2.17.1

