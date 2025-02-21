Return-Path: <linux-media+bounces-26572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D51B2A3F3BB
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 13:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEA3319C5442
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA65A209667;
	Fri, 21 Feb 2025 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i1Oqvbrw"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842521DFD95;
	Fri, 21 Feb 2025 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740139438; cv=none; b=klbUeZmTggYm09OXFKxVj1fUM9jG/SLSrQifMiUVG/a+F5If4WkneE6LvI3mwFTFACT5XB5In2k6TsxljwktbXYaKJL3Ws1fh04VT3PNMAh3Yi4WlTMXNxWN0pRTRch5CXJ7XjLIsM0oZZyBNgeaaQcZ4kqksCsxm/8EONpY2vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740139438; c=relaxed/simple;
	bh=7dkiKEEUYl9FtO9U60RvGRLswkwOp70C/7gcZ6tNJd4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FQD/8SDtyGi+/x/1ifUGZ1s0OxQr3ogZ1Xwl8a56T9naSH10fa7fgTXwHqpb3SGunYM3ddvbjDz9jVsbsoYv8/EzcSolnu4i98JqBS4rzCltd9xb5JeGV1AFV+IBzslSJAoCHTQTUntL7eBgvWOuMv2iL/iXC/MMpryqJtWzAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=i1Oqvbrw; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51LC3n1r292125
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 21 Feb 2025 06:03:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740139429;
	bh=21ZvnLRbs2APYHgBPJWVI/FiPq/+d7GLTwYqYddCXGQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=i1OqvbrwfujkqKbhLKodSXOhD65v4hPMo/Ywfio4iuyzud2naBxd1GSo/liviyl+d
	 UvPdm9gU5nco9V1mFTfFST2CoRjKb2Iq2RQri1bpTCl/cQwRG6pAvhD4B/1FdK5HBK
	 1dfWrSYG7yFEJRjQOrEK2xcql9vdYca/8JTYORM4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LC3nep000477;
	Fri, 21 Feb 2025 06:03:49 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Feb 2025 06:03:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Feb 2025 06:03:49 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LC3d4o046967;
	Fri, 21 Feb 2025 06:03:45 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v3 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for cdns-csi2rx
Date: Fri, 21 Feb 2025 17:33:36 +0530
Message-ID: <20250221120337.3920874-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221120337.3920874-1-y-abhilashchandra@ti.com>
References: <20250221120337.3920874-1-y-abhilashchandra@ti.com>
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
Enabling these interrupts will provide additional information about a CSI
packet or an individual frame. So, add support for optional interrupts
and interrupt-names properties.

[0]: http://www.ti.com/lit/pdf/spruil1

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
- Address Krzysztof's review comment to drop minItems from the bindings.
- Collect Acked-by from Krzysztof.

 Documentation/devicetree/bindings/media/cdns,csi2rx.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
index 2008a47c0580..e8d7eaf443d1 100644
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
+      - const: irq
+      - const: error_irq
+
   clocks:
     items:
       - description: CSI2Rx system clock
-- 
2.34.1


