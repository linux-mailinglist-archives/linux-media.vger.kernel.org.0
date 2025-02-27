Return-Path: <linux-media+bounces-27135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62389A477CF
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 09:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2D101884A8E
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 08:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323EC225793;
	Thu, 27 Feb 2025 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="huPKehyV"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC722223711;
	Thu, 27 Feb 2025 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740644985; cv=none; b=pkdSn8kN8fFDpMUq0c2WO2PF7VaQJKDiEtKkZpkWtLo7q5LnmOZj6ypgJ2PaGf/ZGEwN1uOrEwHcRPWfCXncwgnzHDSBiR3TWLFBQaJbBMAXgayKZ758EGsxtQK6ljnOc0GR/UXuA1yozP7rGcrYcJEktYS7D/0nRuuQiYh6Ch8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740644985; c=relaxed/simple;
	bh=zW0E8AcoXAZvyu8fI1UtUuZAzU6CpWw9TRKZgNnALk4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NlaOJRYHn8MJFB37vqO6Ny+potU8zUcFv0ckztASrd6Kot6yo7CKzezWemlh4696Z+kJuTmjD8hTQkp3Cdq1OQXVqZNaBVmt7RW010V3Lt5S8VzRmuxrvL9P8XiTMCG4y3l15as/HKQk+9OSQdSbLvB8Arfv96HGeFDnT3nFlXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=huPKehyV; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51R8TWTT1795967
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 02:29:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740644972;
	bh=VdpIYHpFxJx7E3IK1fTiNq9eW/altzv0I3q3e08BHow=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=huPKehyVCARKNq5w1XbAdw22PZRdB3XPoyMeAfyacAeEHFu1v4CyL+UPkHh8DGbW8
	 pQ2U5IS6Yi2+VzCsbY8JeZst51UJBvcdkIxRjKlxKTC2VK/qUTyGDY5j3m9X4J5jY5
	 p6EWwhERG276KDTvOZSIDZ37slApO3tEZcyKNbVQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51R8TWmc025593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Feb 2025 02:29:32 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 02:29:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Feb 2025 02:29:32 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51R8TMOd057599;
	Thu, 27 Feb 2025 02:29:28 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v4 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for cdns-csi2rx
Date: Thu, 27 Feb 2025 13:59:19 +0530
Message-ID: <20250227082920.744908-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227082920.744908-1-y-abhilashchandra@ti.com>
References: <20250227082920.744908-1-y-abhilashchandra@ti.com>
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
Keep the second interrupt optional, as it may be unconnected across
different vendors.

[0]: http://www.ti.com/lit/pdf/spruil1

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---

Changes in v4:
- Add flexibility in DT bindings
- Drop the ACK from Krzysztof, since there is change in bindings
- Make some minor changes in the commit messages.

 .../devicetree/bindings/media/cdns,csi2rx.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
index 2008a47c0580..054ed4b94312 100644
--- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
+++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
@@ -24,6 +24,16 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: error_irq
+      - const: irq
+
   clocks:
     items:
       - description: CSI2Rx system clock
-- 
2.34.1


