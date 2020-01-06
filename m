Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7F42131552
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 16:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbgAFPu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 10:50:29 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42341 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbgAFPu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 10:50:28 -0500
Received: by mail-lj1-f193.google.com with SMTP id y4so37038418ljj.9
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2020 07:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3mQYFf3S3d2z4mr0sA7zm3SSbwWdmBSJ4of+0UULFkU=;
        b=ffzRR5Ya0wQx6OGNO8TX1x5DEcp7NI9DAmVihlihjNeigVFwNYgCVocGa6cHq5m5vK
         1gWsj8xDxVH8x5ywa3TyqxaH1n9mYR2Ys7btma05A8zRNSAWITgTECj1QEjKA9eSYa/0
         7PGoiE29GZs812V7FOmc8SemKZY7eEIin1pBzmZL9DC5hsymFNg7jnAe8JWwb93F4S1f
         RD+hYwapVtg1NjdrExZUXfU79LrnewSNoevCL1kJv2A7W1YuAe/i5nS9DVsk8yVlxa6p
         aKAU/h7A8fFFj1CoBaTFgR7BuSSo8qtgrPDpye2J9YOp3NxM57dP9MNVxeYK2fJs/j7a
         P3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3mQYFf3S3d2z4mr0sA7zm3SSbwWdmBSJ4of+0UULFkU=;
        b=m8UFv9tDwrSgmhW5KIAgCw7z7ZB1HUPGmKOz0TgrCJccMYMbAFHMRfmYlNl6/G5g8f
         ep4H8aAvCDA7bmd0WxbYYzCq5X315P7UwH3X16ap6b9l3lEcLLW1AhrMQtbstbEBO8sc
         cAJS4kuXVO4cjdgeXlKgsAjR2zfFfq5ZMS1bT23TvuVXdzVwPin7wWvd4QufnVBkPmxt
         hnkR0Uc8fyZ8IP/n1jKQG03Z8IiixGB29mHrRjZF9DxvEAX2Vny0zvAcqjOiCJqL/dt3
         uANFaIIbS+1EzVn9S9EdrVMuAcvEpIfs+ymZlEak3RlKsoOhcsfSNeweGO0WzccXkAHa
         RaIw==
X-Gm-Message-State: APjAAAVwDDjrl2vEEDM3c5F35s1ZGvvzMvy3GHnxsacXhNpVhVJD6gKd
        NLRfbZmEFx/6yv2AqZSSac9R9Q==
X-Google-Smtp-Source: APXvYqzoTi/6nB84FuCE3FfIsoXMykbKr79sfsub0Gw43WccLoekKnRjXLs78eUZJ/05vBmJqjy0Bw==
X-Received: by 2002:a2e:8544:: with SMTP id u4mr57379874ljj.70.1578325826302;
        Mon, 06 Jan 2020 07:50:26 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id x84sm29388259lfa.97.2020.01.06.07.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:50:25 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 12/12] dt-bindings: media: venus: delete old binding document
Date:   Mon,  6 Jan 2020 17:49:29 +0200
Message-Id: <20200106154929.4331-13-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After transitioning to YAML DT schema we don't need this old-style
document.

Acked-by: Rob Herring <robh@kernel.org>
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

