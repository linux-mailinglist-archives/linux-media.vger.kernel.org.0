Return-Path: <linux-media+bounces-24691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55419A0B4CE
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 11:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 664521886D39
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 10:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF8622F146;
	Mon, 13 Jan 2025 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmGUmU4k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FF014373F;
	Mon, 13 Jan 2025 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736765476; cv=none; b=jiLd2SwAOUKbnWe7Q3bZSZ6W5WXF8y/6MwGgpFdLLq1L/mLfrOg99NyMPajrazCFm0zInQcIsrle/FcnR1psq9JTeqxhHZpJmaVOzUGdQ90HEJqGt08KxIAhOzrID7zsuSLH659oA0Hyj9KiXzKSaErbliX+JuOzLGT1txrtt70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736765476; c=relaxed/simple;
	bh=l5e8ZG1nuN+ZcvImZWznBRa3XRpHDO5bPAXWUYNdm5g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EQQ85frc61SSmt9hSwarHTZG9Z1qvyXnNikKfa2iFIn2k+6tyD7g5hpGPsty4ecZmtq8nACi8kBpmtviOdI6ec9q/54sZe0F+6oo8+pi5PXIebLX2Cm+f5bBcTTAIUXCBKXbwnwxKuNpc9BIfBPUKO2D14WlPm0AyGnV/YzhSco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmGUmU4k; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5f31b3db5ecso1789767eaf.0;
        Mon, 13 Jan 2025 02:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736765474; x=1737370274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=urUqfOs5ZprO9Xw0z/tnXaTr0uAH0u4Ma4Hh29vNsJQ=;
        b=HmGUmU4kd1lJ0LadGQ8fenU/P6gl0Ue6ibjXtuAwJIxY2cJJsHe1Rq/bqjqZkWkFjK
         bY5c2/USjP2fchqaF8elQ6Xk0jrQtgbFnGa+GK/foQoJqwGIA429KC02HCOZOTwE3hrK
         i3bRyWAcbRYopFIChk+PzQRyCqSH+rSEBZeR/154fTzmTtkBRGk9tQVWExdLZv8y5mtO
         Z4GOROIzusnvuYowm2oZAjs/BzguDaGvq7/6j2aCcwByOyQ3BgZnyteNSvY8ZgDKT0Gt
         kcq4kBUD8v7GfILTADE/gXjpscC0V05E7SEtBzJeaZmePR+733lFU90mMolWPG2ohWu7
         JMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736765474; x=1737370274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urUqfOs5ZprO9Xw0z/tnXaTr0uAH0u4Ma4Hh29vNsJQ=;
        b=VFIABmsd15sMcpoDPnI/MAKujeR2L+IaZL1JTQKGBo8tJEU0CDOCdXfAcNQUAfo86n
         BGaVGBeuS5IyYJm5RpQF7TfXHQXO3/vGsS+UchEM9yi0dC4aly3ylTv78TWtMn1YNMS9
         srtIJ0TR2p/n7MI+zwXGrE+Mj/auE8mhbg072EKqSK5Wn8lxLRlJasbWt407ePADkk8W
         9+DndUpThlEOojmT3kNZRE+fzmu+zEpX9h/09wqsK6jEclO1PFhFi089OjbR/V7da92N
         rf3Z6rheW7+g8RgeHf4mGUX7Jl9dMMCvxddvY4uiNlqUAklFG2pVxhR62DkqWp1tHSSP
         bznQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3oYJvU61t4bITMbL01hlTcaXz4NtyUTrnvAKef/hxaaT7dQH4qtxH6GC+nKEahVKNaCtKq9PabiJNKXs=@vger.kernel.org, AJvYcCVshshVoFvkAR8e2h94Cj40TK5xaGkW9GuwY2/ciIaZnPopc+dB3Nw2Sd3y/dFeVHdqr2UG/K6kpm7T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ubICecdYct+v7riiopZO5DIcPMJPL28fDFFpW2DvTZHX4JLS
	Nnrk1rFKhvYaHbSTGCmCwnNtnhjf5I7W8ICSJpBJMD0/gh2k+j1lLHnKew==
X-Gm-Gg: ASbGncs/W9vDLTI1jTMecSKccytCHr2HsJ5uxj86xFsAHixk5EwtkZFgxxSTUqf4vH/
	BSqzIxqv67lkcbL2AJePhdfzFNzABSuX7Gsm0teBsjgDK5t2qVTCqQNIL3XtEyqp4V9DdEkx0/E
	NO4YPeR0l1pYYrTdzFv9EI2lBKgcflHoZCkhogpBRLTThn8cQlDS68hCfzJuVCnx6oP6TW1ZLYA
	69qN/ebjuwIgk6Jmfb78uwZS36HXxy61RXqIpdK7aspRzNjHkHr2ioFkzpDIcACR85FJXQ=
X-Google-Smtp-Source: AGHT+IFPyTIIfjevDpsljLimNeExOHdnw4G1Y3DEL4NU+snMOqFDKBVVpxAmHBjqOBCcW9sXk+u6mw==
X-Received: by 2002:a05:6870:e2cf:b0:2a3:c59f:577b with SMTP id 586e51a60fabf-2aa0673060bmr3835827fac.24.1736765474154;
        Mon, 13 Jan 2025 02:51:14 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:17c3:3d19:3f6f:3a38])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad80548d04sm3681440fac.17.2025.01.13.02.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 02:51:12 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: mchehab@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3] media: dt-bindings: adv7180: Document the 'interrupts' property
Date: Mon, 13 Jan 2025 07:51:02 -0300
Message-Id: <20250113105102.1239513-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The ADV7180 family of chips have an INTRQ pin that can be connected
to a SoC GPIO.

Allow the 'interrupts' property to be described to fix the following
dt-schema warning:

'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v2:
- Do not wrap the dt-schema warning. (Krzysztof)
- Remove unneeded description. (Krzysztof)
- Added Krzysztof's Acked-by tag.

Changes since v1:
- Detail the interrupt description.
 Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index 4371a0ef2761..9ee1483775f6 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -49,6 +49,10 @@ properties:
       Indicates that the output is a BT.656-4 compatible stream.
     type: boolean
 
+  interrupts:
+    items:
+      - description: The GPIO connected to the INTRQ pin.
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false
-- 
2.34.1


