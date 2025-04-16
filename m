Return-Path: <linux-media+bounces-30333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F49A8B8C1
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A19673BE8C0
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CCE24886A;
	Wed, 16 Apr 2025 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QMJw/tsc"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDA1ACEAF;
	Wed, 16 Apr 2025 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806008; cv=none; b=r9wk+9o4GPuQLu2ExJl7WuECQcmpsrJBAwrciCYNrKOBFGfqCln5g5Ruyhh1vHpnP58I+Elq/Y1BmU5/eIXyAVU2ypaKnLKO1fHsGBo8B/IBzFWWxMdAJc15wIa5Eq/tCpkYiXJ1tE4l8i2SMHrB2r7ZExPp0RBxnqo4G+tLLQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806008; c=relaxed/simple;
	bh=VJMUz8jwWkl7P1vFKh2izW/mQndY0p5kQSRxLOEIj4A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N+qLSMY2Dh3dC4UaHzJKzjU8uR5dp+N1Pckq2XOqTYd2bJRUgN6v+I6VEVmaVRafEPeOiQ3qvx47MtHmOwTnBX1tFL+C+WEaT7tKhNBg6UeE9YpbOudl7u286+WQKl5uIniwmiAtJ7cEYWGp+HPZbJPKhaklQBHifNC8ZBnZpA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QMJw/tsc; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53GCJsmR309278
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744805994;
	bh=1SaTmyfJ2vgUsh+uFpfK8uAPdXjk3nb+2ywzr0skHdU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QMJw/tsckuPzMUdOLJEoq/LK7wAc3gWSa30UOoSRy99+W1zXNzwrXjGLxsgWbqfgG
	 rXkpfqgZGlfzXTgPENRlWT55a4460/dOk3kmtwclLRS372aWcHClsJdszxd5Tyk/2a
	 W7uMKetOQoZ52vu2q4iHCpgHMM6NQxkJGheP0Kto=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53GCJsbm017630
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 07:19:54 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 07:19:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 07:19:53 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53GCJiEt016254;
	Wed, 16 Apr 2025 07:19:50 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v6 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for cdns-csi2rx
Date: Wed, 16 Apr 2025 17:49:37 +0530
Message-ID: <20250416121938.346435-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416121938.346435-1-y-abhilashchandra@ti.com>
References: <20250416121938.346435-1-y-abhilashchandra@ti.com>
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Jai Luthra <jai.luthra@linux.dev>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
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


