Return-Path: <linux-media+bounces-8431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B5895AE5
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 19:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 430701C222F8
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 17:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEDD15A4A6;
	Tue,  2 Apr 2024 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwBnvuCy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AFE17BB7;
	Tue,  2 Apr 2024 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712079657; cv=none; b=t0chNowsNL57yoiUefkNNu8hxr2NjUmGhWMm36Q/iDzNfJWosbiUVsRVIP2H7FRr5eKv0JiKN4fY83JhY4KLc+62wcN73uvSSpp9kfMelt9FaPv0Pm3dfibKQjWwplW/ENvR0tADPR2fFpq8irze6Bw4D+bIE7U39LtENCMmheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712079657; c=relaxed/simple;
	bh=SIttuzUApsaf2VI4jmyqM+YmNurv+JpYUsEXO1seAEI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LBT/MOyw5SX8+Q8WZ/b+tdW/uIbk+83aHX9P+mR0xBTmsHW2X+7UxMkmvONiPGPJRqV8zfmWt5oP08xowPlqLsJIhQpSJyev3nFTJQSyOvUIV65h5F4Kp7rSZ4klHEpotuqHqcmere7lMxEewlkXTCgzp+8MP1Ed6t1bN8aokgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwBnvuCy; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e694337fffso961704b3a.1;
        Tue, 02 Apr 2024 10:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712079655; x=1712684455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mj+hIYfiIqrdZCdlhIOXwAHVfJtak/tKCscomVGlXEQ=;
        b=dwBnvuCyZH0u/RMqh1B+ZK9u6BsipwbLRHd2B5z5yt3q+NxLnvqb6hQCXCSYRN7OR8
         O4AvPSHm5dAYFU+YdlxKMb8QVAEj81cLtZYhbynCoSaT238vY91x+BwvO6dfVDZy9ihW
         78+KdpKav6KZwMMDRE9GrVLhzO1yt/AKiMW2GJ9pAhLnaqbmrnCpUsOs8zclGSMBDFaB
         yM6uw1MWRUxKxH1I6RcT5x3STXFcrsl6rkyxKIHTKHGcwyR2t0OCxzCwz7yrAZ3Vcmb/
         KjpPEO8HFAxO806jUpWHYVW5fQVYN4Nt8cfgpCPnrVWlKpTo9zIFmVYLHvOYsu3zv/lO
         kgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712079655; x=1712684455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mj+hIYfiIqrdZCdlhIOXwAHVfJtak/tKCscomVGlXEQ=;
        b=S+nA7qO/X6iYDLW3D2jfWDOWdPiECyJqfdytk/0uzdcDoC1Lk2Bh2fxY+JYZFrA1j6
         rSPvxPL2EezxZ+ABjlnejF0YHhwJp3V9SACSw6KbOo3Ut0ZFv3M85hGOJYXg+I+xFhkt
         APp6eg0jToOuXtMv/cdv+TM14DiG3aymqQHoJkoQPEk6gMVgg4DUxd1DdhRuKnxZubQ4
         ojaWvQdMsuzpzUOdB/Mgw4HLqRPo3mNxeRgXDNdu9XyBFJeSanJlmI3lIuThzUl9EkVu
         42iCTfeBX9JbcvO724aXY1R2t71+tSYwyGpsd9IMuJwzPhAdIwS/4hzV04hw1JAIe2IR
         cnUg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Zn33n3waR5UUiHUanNonz9vcH+QjbadSdeGvloRpcRkxLfoXjPM3ZNGjKp7K2BPFe55ZwO4r5kLwUbtrF8YObATdaY23XlwyELHs7arEx0kzGDpgLxxmSAsauIPuvbPZWhaWdgBC
X-Gm-Message-State: AOJu0Yz4FSfyF5c0hRHxYd1j6rP66wXjwUZHee+cpvCckYylR55Gt53f
	7cBXv9BenPYP/jJRRYvOrTujmZA7QTC+DGWFxI0Tco1QrIBuoTBj
X-Google-Smtp-Source: AGHT+IEHWPMPfZyxLQaaVsu5ktrgQngQ6FQ8UB0KYsDl1SCNBhM8Stb0DarmgFLmHL04IxHB0IuGUQ==
X-Received: by 2002:a05:6a00:2d07:b0:6eb:1d5:a3e with SMTP id fa7-20020a056a002d0700b006eb01d50a3emr9939212pfb.2.1712079655185;
        Tue, 02 Apr 2024 10:40:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:7fdc:71fa:30d0:4855])
        by smtp.gmail.com with ESMTPSA id w10-20020aa79a0a000000b006e6aee6807dsm6818919pfj.22.2024.04.02.10.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 10:40:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 1/2] media: dt-bindings: ovti,ov2680: Fix the power supply names
Date: Tue,  2 Apr 2024 14:40:27 -0300
Message-Id: <20240402174028.205434-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The original .txt bindings had the OV2680 power supply names correct,
but the transition from .txt to yaml spelled them incorrectly.

Fix the OV2680 power supply names as the original .txt bindings
as these are the names used by the OV2680 driver and in devicetree.

Fixes: 57226cd8c8bf ("media: dt-bindings: ov2680: convert bindings to yaml")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- Newly introduced.

 .../bindings/media/i2c/ovti,ov2680.yaml        | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
index cf456f8d9ddc..c87677f5e2a2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
@@ -37,15 +37,15 @@ properties:
       active low.
     maxItems: 1
 
-  dovdd-supply:
+  DOVDD-supply:
     description:
       Definition of the regulator used as interface power supply.
 
-  avdd-supply:
+  AVDD-supply:
     description:
       Definition of the regulator used as analog power supply.
 
-  dvdd-supply:
+  DVDD-supply:
     description:
       Definition of the regulator used as digital power supply.
 
@@ -59,9 +59,9 @@ required:
   - reg
   - clocks
   - clock-names
-  - dovdd-supply
-  - avdd-supply
-  - dvdd-supply
+  - DOVDD-supply
+  - AVDD-supply
+  - DVDD-supply
   - reset-gpios
   - port
 
@@ -82,9 +82,9 @@ examples:
                 clock-names = "xvclk";
                 reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 
-                dovdd-supply = <&sw2_reg>;
-                dvdd-supply = <&sw2_reg>;
-                avdd-supply = <&reg_peri_3p15v>;
+                DOVDD-supply = <&sw2_reg>;
+                DVDD-supply = <&sw2_reg>;
+                AVDD-supply = <&reg_peri_3p15v>;
 
                 port {
                         ov2680_to_mipi: endpoint {
-- 
2.34.1


