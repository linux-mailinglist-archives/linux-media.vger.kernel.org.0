Return-Path: <linux-media+bounces-20324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 818DC9B09B8
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE7D71F23682
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 16:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E42187FE2;
	Fri, 25 Oct 2024 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQpTz7Iq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D814A0A7
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 16:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729873307; cv=none; b=V2fgw8oopFsYLjn+BsyB1fqX/I2wG0iSg7PulCI1cFvMrvAl/4325Eyx3G6RHbLPMge2Cz3NRXsh4GAyN7Jh4SImSW14r0ngDtNIO4dZZMWsyOnmg+itxWTrnTvqVmw4mpeD/Ek8hqjnTiZ6SO5nm7/7jiwD8wS8DBtUfHttDfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729873307; c=relaxed/simple;
	bh=4U6UHnhVIZfwooHUtB61nNdp00jUpPMdAj6gGI32hvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nL/EcJy6nbqMS3Dsjpuf1SoUFr226Ffij7EhWjMWcYG5+EJPrmcgpI27cK0I6vmiG++LXDDanIpJoz8kkUylY0tnuWA9KR9pCjx7BZ1g6bV4raMUCD5JT7tysCv6u3EZDIDVQE9U/a5lKwhNLQ4wGfhRYBUaJOs8kCoN1fuR1Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WQpTz7Iq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so22110905e9.0
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729873302; x=1730478102; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xKMe0kTY9Xwhvqu9PTgbz7NZVWtehoaaceI1KFjE78c=;
        b=WQpTz7IqEs7VpVG96+A8dFoUMKJtg0oM1GdSMtRqxMs7+PYShkQYBv+F3fJfGH1GuR
         X7SipYLS1bbDsEW7aI/IjLYc6n58UgppXrAaGI5UrAs64pn2ccNeFJHXFhSjRw7bXa+o
         9vSp766AlOgLjEqOKp3csDbEeuD2zseieveMW1qdIeycLTNocjDx/jv1hYgn/DohwPF4
         CgwdLFwtAqoKpST0MnXKkaAnLOREcgU8xTt5NFyjpNR2ADadCDl8OGSEUVsVGstgKyt7
         5R7iobESrBLOTCG1k4kmwxRCpq3Q2ODNm1pekr9k1H610jHj3Ni7aa5RJA7fmIKzMV2N
         d9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729873302; x=1730478102;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKMe0kTY9Xwhvqu9PTgbz7NZVWtehoaaceI1KFjE78c=;
        b=D8b388QZuAdF3kKVzJMpPAJBQqkBS8FDxBCiC4uvHWFxu3nkcrWMCBRKi3vNqhBid2
         d3JM3XG09dXmWPT3oa3EDherufkyt0fmTW1Axk4AreM6qO4NSND5tl9363mBcf8+DoCW
         xfmbiv09TSqQXEo6vF3UEca5F5BPcYglMc+wOy6JMx0e/blEtRPHZyb5nv01IniIqm1V
         H7przs+5NDMUwAf6jGswQt3tEut1Jxr6NqCWYT1kwROrlaTji+rYf5I40wHlVzCK5Rwi
         skl1bTKNuVFJYZtqN6wlYlMW5XoUQ1o80g/h8w9omsXM7fJJJHPblEfFRMwhth1Mtw3r
         LdOg==
X-Forwarded-Encrypted: i=1; AJvYcCUXR/Io8dVyGO4ZWiX+XhxhGGbLXrhciBEOgljtBTYBlZdq6oyQ6LCZdnoM7XyZsej9egFSvA04yXEkNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFK9ZmNd5ISOZmhwXqxsv2mGzuhE/zecJ3//9pgLT83RrYUcSp
	VgNx0qF9y5okb2sWm6WwNLMRfg4KP5BqGriuEkpTZQzu6ovNhoXxd7tFHCi0aiQ=
X-Google-Smtp-Source: AGHT+IEvBNXGVxmL27N28gPJzfVMQ9d1oUlz1dnIvip3TXWHgZAWbblC123aTBWd1euJZj/YLE214A==
X-Received: by 2002:a05:600c:5490:b0:431:5d14:1cae with SMTP id 5b1f17b1804b1-4318415fee0mr86584145e9.19.1729873302024;
        Fri, 25 Oct 2024 09:21:42 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935f6df1sm22322915e9.35.2024.10.25.09.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:21:41 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 25 Oct 2024 17:21:40 +0100
Subject: [PATCH v2] media: dt-bindings: Remove assigned-clock-* from
 various schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-b4-linux-next-202041004-i2c-media-yaml-fixes-v2-1-1b4535174a5a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJPFG2cC/5WNTQqDMBBGryJZd0omxP6teo/iIiajDmhSEiuKe
 PdG6QW6fG+Y760iUWRK4lGsItLEiYPPoE6FsJ3xLQG7zEJJpVHKEmoNPfvPDJ7mEbKWu9fAysJ
 Ajg0sZuih4ZkSNLYprbRI8uZEnnxHOg558VVl7jiNIS5HfcLd/kKo/gtNCBKMqmtUBq/3i3vmX
 xPDOcRWVNu2fQGLDFeI6QAAAA==
X-Change-ID: 20241005-b4-linux-next-202041004-i2c-media-yaml-fixes-fcf5c0c1e08d
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Todor Tomov <todor.too@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

Remove extraneous assigned-clock* from media/i2c/* schemas, retain in the
relevant examples.

Link: https://lore.kernel.org/linux-media/j7kgz2lyxnler5qwd7yiazdq6fmsv77kyozdrxf33h54ydakjz@uqjhwhoyv6re
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
v2:

- Changes series name was: media: i2c: Cleanup assigned-clocks and endpoint: properties: unevaluatedProperties: false
  Dropping the second patch in the series means the title changes too - bod
- Drops unevaluatedProperties -> additionalProperties change
  There is no clear consensus on this right now.
- Adds Reviewed-by and Acked-by as indicated to patch #1 Laurent, Krzysztof 
- Link to v1: https://lore.kernel.org/r/20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org

v1:

On a recent schema submission I did what most well adjusted schema writers
do and tried to find a base file to work from to copy/paste and forget.

Confusingly/predictably I received feedback to remove or alter several of
the properties included in my devious copy/paste plan.

The first bit of feedback was that assigned-clock-* was to be dropped.
Removing assigned-clock-* as assigned-clock-* is a core property which
doesn't need to be listed in a schema.

The second bit of feedback landed on use of additionalProperties:false
along with enumeration of all required endpoint properties instead of an
implied list of valid properties from unevaluatedProperties:false.

Link: https://lore.kernel.org/linux-media/20241010-b4-master-24-11-25-ov08x40-v6-0-cf966e34e685@linaro.org

This series removes the assigned-clock-* from upstream sensor property
schemas and applies additionalProperities:false to properties: endpoint:.

A few missing properties: or required: are added to the schemas based on
output of DT checkers.

The one new DT complaint I didn't fix with the move to
additionalProperties: false is:

/home/deckard/Development/qualcomm/qlt-kernel-tools/qlt-kernel/build/x1e80100-crd_qlt_integration/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: imx219@10: port:endpoint: 'remote-endpoint' is a required property

Since this appears to be some sort of temporary/commented thing upstream
which I don't know the provenance of.
---
 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml | 8 --------
 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml | 8 --------
 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml | 8 --------
 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 4 ----
 8 files changed, 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
index 60f19e1152b33128cf3baa15b8c70a874ca6d52e..d18ead8f7fc43bfacc291aed85b5ca9166c46edb 100644
--- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -28,12 +28,6 @@ properties:
     items:
       - description: Reference to the mclk clock.
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   reset-gpios:
     description: Reference to the GPIO connected to the RESETB pin. Active low.
     maxItems: 1
@@ -82,8 +76,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - vddio-supply
   - vdda-supply
   - vddd-supply
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
index 1f497679168c8395a94b3867beb49b251ef621fc..622243cae03caa5d14aa312df40ef5907e190d2c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -20,12 +20,6 @@ properties:
     items:
       - description: XVCLK Clock
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   dvdd-supply:
     description: Digital Domain Power Supply
 
@@ -68,8 +62,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - dvdd-supply
   - dovdd-supply
   - port
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
index 8a70e23ba6abed67d8b61c33bd7a261089bddda2..382d7de7a89bcea11be384a2a3800512994f9346 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
@@ -20,12 +20,6 @@ properties:
     items:
       - description: EXTCLK Clock
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   dvdd-supply:
     description: Digital Domain Power Supply
 
@@ -68,8 +62,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - dvdd-supply
   - avdd-supply
   - dovdd-supply
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index 79a7658f6d0547e4d6fb2267e5757eedf49fd416..38325cf318f7bd2cd60a4c7bbb6a65b54b855e26 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -27,10 +27,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27MHz
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index c978abc0cdb35cfe2b85069946cf1be435a58cb8..f0f9726a2add89492b8c56e17ed607841baa3a0d 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -24,10 +24,6 @@ properties:
       - sony,imx258
       - sony,imx258-pdaf
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description:
       Clock frequency from 6 to 27 MHz.
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
index bce57b22f7b63bd73f08d8831d9bb04858ef03e0..872b8288948b2bba743f2365a55165181df156ae 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -24,10 +24,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
index 77bf3a4ee89db3b5d16149470c0380ef8f1aeac1..38bd1c7304a59bb5fea90954c1e4e626a7c86f2f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -24,10 +24,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index d9b7815650fdb890418fc96c828acc9147dfb6e8..ece1e17fe34553671e61c965eb1833c5eb08131b 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -26,10 +26,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
     maxItems: 1

---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20241005-b4-linux-next-202041004-i2c-media-yaml-fixes-fcf5c0c1e08d

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


