Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20A2F12483C
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 14:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfLRNYX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 08:24:23 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44260 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbfLRNYW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 08:24:22 -0500
Received: by mail-lj1-f194.google.com with SMTP id u71so2110989lje.11
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 05:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T1y8MMPNkqcrm20up1WtHiDJ34NUPmK2DHqDsNPyhC4=;
        b=qHnYjRUr2kDnl4xnxqXW3c21wjpGNnB91rtb+EcQmHh8wnofif2OHCxdT8Oz3oiPXG
         61FqRJ2spHW0DGxfPX8u1qUewKY+RIiE/Qg2LJCVfbIlrRiMCtf+fuHdy86nMER+Rbfw
         ZZKNvYG2RV6O6RBVofJ9/IUk+LK3so1FmzGIbGk5aZzzLnaggVjLQeiHedYMdSweEFhR
         3PEO8GMfN5N/oseNwDcAWuuoYjZRFfWNOQws4HpiIPja4jXbZe56JAWY9yUgTVaPNpOx
         je+yiBJYQuDIkPO3aE9Qhvex14Vjuaou0IgfG9THt8VGw9oibSYN16+8uEp6ULl0Pi2q
         BFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=T1y8MMPNkqcrm20up1WtHiDJ34NUPmK2DHqDsNPyhC4=;
        b=iOqsu6LOThBlqxf97aIaeDXYrYUT7h1oIiVsNvxzcye5xq+9iM4HmaDxKlGdXtVOpg
         +EibMv3lEYwxhXTkk2ae4bpyHfHmN9t0RJstghCkVREHSKH746eeMpRF+LPwvtUea/nO
         D6yqC8IMfLimzr8ZwFANOVgiSWbd6xKFNjOcILQjvviyLLtuhCQJb1ohCS/XWlNKzt78
         yYwMlvldQd4wMe+BHvoIpvY0MwsdTDbD2q1sVnhTmDKB65+lPcDTcviyayugLI7lMZSV
         jhJA+Gzc5pBEF0y0bqQT3yj+JgRs1Veh+VP+XNa0RU5PkeBCq8ALIN0MJ1HDsgvgAytC
         y5gA==
X-Gm-Message-State: APjAAAUSiQhAjHE+7qJ50SvbPD0ZMqoCd8Q5hsSaLjdSZvm9DdkoEilX
        s3xD3jVWYGDBCfdEt2Evby9IfQ==
X-Google-Smtp-Source: APXvYqwEjNXwmw70T0IukUvIytwwfZaEHCzUUEdlTExg7iCwklRZFcGZ6aFzDYIxKJfB99kzV0cE6Q==
X-Received: by 2002:a2e:556:: with SMTP id 83mr1798786ljf.127.1576675459509;
        Wed, 18 Dec 2019 05:24:19 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id z7sm1440667lfa.81.2019.12.18.05.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:24:19 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 12/12] dt-bindings: media: venus: delete old binding document
Date:   Wed, 18 Dec 2019 15:22:51 +0200
Message-Id: <20191218132251.24161-13-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
References: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
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

