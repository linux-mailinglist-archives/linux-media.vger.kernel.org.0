Return-Path: <linux-media+bounces-54722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE3HOj+uqmluVQEAu9opvQ
	(envelope-from <linux-media+bounces-54722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 11:36:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD2721EDD0
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 11:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99BEC302BBC5
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 10:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE29361649;
	Fri,  6 Mar 2026 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WW4GTTTM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264B535AC15
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 10:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793402; cv=none; b=ZCQUnW+s3clwpUFRJBzhSI5tvrPeQV/yfMsj22l/vyV1zYEUww1BIeE/U2p4LMw50FbL1cc2htC/8tgvR3vqBB93R5lYMUevSsk263q8+1AlMKTyp1XNbtYGRkKfqNOyyNt+bong4bPGRef5C3dkf5omp/PBHCJxPYZXKYd/6I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793402; c=relaxed/simple;
	bh=c1Hh73BPHsWJSHADjwZvKq8JW4wE9XT5FJSTKJdaAoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ey1hRYfGCUjh6ysJM4ekbrOlX+zruHHdWzV5iVuxSkSt4EpnzmCowcdqw7NcQYgQ5QevNoNaDLjjT7eNH1QXlgkBSB55HLLjvocw6RQV/zrgAe1c9TuV5+pC/9nC3I3yH0G3XLC1f3PAlfuTvvQ4Dx5GyLpOCPmMl6Q0t6Egf8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WW4GTTTM; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a1307438ddso1801699e87.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 02:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772793399; x=1773398199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxQnXMyWjzFyg3hYD+g55dQxulta7EkqgPunnsrPdZQ=;
        b=WW4GTTTM39qLwd70QTkIpsr1fFxZD8I97p3HBrurs6LJvC4pIpSRAdIql4xuqk4dZO
         gEay1RDps5IEbcqKD+irwzqsr4HcMOdxysLh4xVDsWBt4i3g3FuLp9LPpnW2mR/CDGbB
         wezT7qcfL1gQZv2V3J9t0C/AvHiCt/LS8bsJYVdr8KRX3CDL19+opBqYACCjGkMoSuPa
         Wy/v+FzKaZfO/Rv7iSiXYkMz6cFrt/PpFJpJV/8B2H/LMnv/wOk20k1EKj8U15pvwv5X
         3SbgfWA6jt/Yo5jElkFRvFinQ2C6KrIi2/6qVJL4nDjhf5GCZMgh1AAaJZROYoV2i1rL
         Nq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793399; x=1773398199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fxQnXMyWjzFyg3hYD+g55dQxulta7EkqgPunnsrPdZQ=;
        b=kDrExvtFHBoSyleePSR5fOOpt4ckH0JXyeIDpt4WiLoGG/Zrf2EkrQz+e/MJb6F5CA
         iNAMfgp7SnJt/asnmMmaeFpfr1xDgaAuXCCGIWrVgfksaBDikIdpFeuBv1X2/bh1C/B6
         8Ug5/+5X7tt7M0oaQiZyrHgODCgSMeq1uBevuIf4kRE0A02xGXPfcdUb/t8UUqHaOYUr
         O5UzeM9h8HF5esBM1YaHeJta5UQ+E/zUXYe2FBGQ2a2UUy3iHiksoQ5gYaHBEs1zvXys
         dFPuBzi5yK/+w1op/uSy+UCWVuhvfpi9cDqrKiQNPQuVbDa+iqe+qn8aDamvHu7ffiPk
         7vEQ==
X-Gm-Message-State: AOJu0YxaYMDZ9Uov5U2sPFXzIfIPH8xfge0NcPydyBSPlI2ideXO5bAo
	ZHRSGQd24EejmtsBbgyGJqYtYG8vlMIUk2FTlBZwIh3+/K5LfUhkllM55zuUhr9A
X-Gm-Gg: ATEYQzxE3b//0Px49ImbQQCB2w9s22oyECm4qG9N7CkangeGw2pNMZl7eaz4t0QT1B1
	UKvil94MSS/mBVOtszdoasuZ9qUaifFRHYH5w9QyrktnSYuxATKA8/QbF5O7yyOXFuO1ZqEL2Td
	/TVoVPv6wC16Q3O9jr1Pf86l2CscJe+svXf91uR4J8aT2XrDyq56q2WdI+VBoHGkF8HvTzmMxbw
	gewVm1uv71eHp/EuYo+9QbAYcOZAlU7R1+kgQ6AIZfQpSKuJYM83toI3CmNFlUz5ngOhL5C3F3J
	/iy+Jqp7wb0ukNTvpeKw8W9ySpBymt4e4CJweKR+RJhIfrx8z+FWFQUdBXYAmx6+VOxcCbw/aut
	rXOiZgxGUqwgZmP45zGv/OqG8nodnuZFRrpv1v34Vu3PFggBkmKzk+qQMA7c+GGZSP5+GHwU9G1
	HvGVy1Cxg2TyAVNQu/Un5MgDlsqPpZUwVeVffY4M8=
X-Received: by 2002:a05:6512:3492:b0:5a1:2ea2:3683 with SMTP id 2adb3069b0e04-5a13cd1e305mr469865e87.44.1772793398345;
        Fri, 06 Mar 2026 02:36:38 -0800 (PST)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d03da54sm258243e87.40.2026.03.06.02.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:36:37 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [RFC PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding
Date: Fri,  6 Mar 2026 13:36:13 +0300
Message-ID: <20260306103614.3208182-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8DD2721EDD0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-54722-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,intel.com,vger.kernel.org,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Add devicetree binding for the onsemi AR0234 CMOS image sensor.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 .../bindings/media/i2c/onnn,ar0234.yaml       | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
new file mode 100644
index 000000000000..d93fa99e6535
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ar0234.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AR0234 1/2.6-inch CMOS Digital Image Sensor
+
+description:
+  The AR0234 is a 1/2.6-inch CMOS digital image sensor with a pixel
+  array of 1940x1220 pixels, capable of 1920x1200 resolution at up
+  to 120 fps. It supports MIPI CSI-2 output with 1, 2, or 4 data lanes,
+  and raw Bayer (8/10-bit) or monochrome output.
+
+properties:
+  compatible:
+    const: onnn,ar0234cs
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    description: Reference clock (external clock) input
+    maxItems: 1
+
+  reset-gpios:
+    description: Reset pin, usually active low (if needed)
+    maxItems: 1
+
+  vaa-supply:
+    description: Analog (2.8V) supply regulator
+
+  vdd-supply:
+    description: Digital Core (1.2V) supply regulator
+
+  vddio-supply:
+    description: I/O (1.8V-2.8V) supply regulator
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: CSI-2 transmitter port
+    additionalProperties: false
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+        properties:
+          data-lanes:
+            description:
+              Number of MIPI CSI-2 data lanes. Supported values: 2, 4.
+            minItems: 2
+            maxItems: 4
+            items:
+              enum: [1, 2, 3, 4]
+
+          link-frequencies:
+            description:
+              Allowed MIPI link frequencies in Hz. The driver expects two
+              frequencies: one for 8-bit and one for 10-bit modes,
+              typically 360 MHz and 450 MHz, but any frequency supported
+              by the sensor may be used.
+            minItems: 2
+            maxItems: 2
+            items:
+              minimum: 360000000
+              maximum: 450000000
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@10 {
+            compatible = "onnn,ar0234cs";
+            reg = <0x10>;
+            clocks = <&clk_ext_camera>;
+
+            vaa-supply = <&reg_cam_vaa>;
+            vdd-supply = <&reg_cam_vdd>;
+            vddio-supply = <&reg_cam_vddio>;
+
+            reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
+
+            port {
+                ar0234_ep: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000 450000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.52.0


