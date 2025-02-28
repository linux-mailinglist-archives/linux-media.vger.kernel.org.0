Return-Path: <linux-media+bounces-27221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762EA4986C
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 12:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0D8E189812C
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9D7262D1C;
	Fri, 28 Feb 2025 11:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xDXFkGo0"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E66D2620FE;
	Fri, 28 Feb 2025 11:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740742850; cv=none; b=cxOekuu0agZmFxgQkQJxOBKE/bX/HZtOafBoo6XaeiVhqpWb3pmvzA3cyL7pZazAlCkTRtglZ1aPrfREw0vxzddKoeEw0B6vJexNspJTotVtvw/q8k9v7tW9PUmC8wdkDCOOqFGzBVRThwc6mtlAME3kgyA8foLokQsAKk2nAck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740742850; c=relaxed/simple;
	bh=Qe7hh8jq/V0r7r99OCWRH8bjKvgDckR3W9bXeRiVWhg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NxM2cX7hJMQc4rVkZuvvk2Haq28e9HfmbXoNkmGkvU5lv6H7LH4ua9Mqb+ZmD1LExs5Du6qwNTUpmIZNDe6fVtYLTmSrb5N/O2oSHK/wZmA8hKQc76Whb7gnB95z8rwmjdFExJwH7klvBIWuVPWE+C1KHT2CZvZbmQ5d0d5426k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xDXFkGo0; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51SBegR62634920
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Feb 2025 05:40:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740742842;
	bh=nNDBvKA6wDRV8hvH22c3+irzWz1XHbekYeyBtl7kNtI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xDXFkGo0QRb4O2IQs6dSMV5TwdA9niwSAO7u0Q9Zartj9ims6gj0Goc4OVmav3e2d
	 cXD1xxwKSxPrsVIgxZubLKem/kKSaN76YaVN5NZz4nc4wlWS7mU+u15CJ6dYD89QZ5
	 CZOEfA3D/Ks5e6A/g7UTLtH03TgHUQH0sIr/M+gw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51SBeg54003296
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Feb 2025 05:40:42 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Feb 2025 05:40:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Feb 2025 05:40:41 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51SBeWfc060249;
	Fri, 28 Feb 2025 05:40:38 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v5 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for cdns-csi2rx
Date: Fri, 28 Feb 2025 17:10:29 +0530
Message-ID: <20250228114030.1028443-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228114030.1028443-1-y-abhilashchandra@ti.com>
References: <20250228114030.1028443-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The Cadence CSI2RX IP exposes 2 interrupts [0] 12.7 camera subsystem.
So, add support for optional interrupts and interrupt-names properties.

[0]: http://www.ti.com/lit/pdf/spruil1

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Jai Luthra <jai.luthra@linux.dev>
---

Changes in v5:
- Make two interrupts non-optional
- Take back the ACK from Krzysztof since we are reverting to
  older bindings

 Documentation/devicetree/bindings/media/cdns,csi2rx.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
index 2008a47c0580..6ed9a5621064 100644
--- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
+++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
@@ -24,6 +24,14 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: error_irq
+      - const: irq
+
   clocks:
     items:
       - description: CSI2Rx system clock
-- 
2.34.1


