Return-Path: <linux-media+bounces-26212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BEBA38415
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 14:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12DB27A2A44
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 13:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FA52206A0;
	Mon, 17 Feb 2025 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LQZh7F9c"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F7421D5AC;
	Mon, 17 Feb 2025 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797246; cv=none; b=EJ1SZNyt14Q846RB7fIEoVjRRZk54MpGbTtfUT/1hptnVTEfFjrqCkWrg4S765e1EFNdJVkTrfQ+nyDSHgFYHLgulZVeFesXPOYHG069owONZnF3rV9nwem8awQ178uR6QTkTel5sf51AOLfAY0tbrc90GjoUbsvkA/Pwcvcyi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797246; c=relaxed/simple;
	bh=I0S+nkLc8AqLe/BXeSPDwTMnzb05obn6iER4S06p86E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TuTB08BJwhtJg23IrEANkZWyH7jwqBfn1z8yhjnSKHlCnuvuoqbjAplax70lka+Rl58Z7ns8Xko2V8LDe5vjS42kijZWO3lXAGRXlKoRAPePNBLRrt5BYvCowQwKtP2RENNjN2JbH8tmDrYAT+gVhWYm6muGKv45U2MzQhONWtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LQZh7F9c; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51HD0RmG660284
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Feb 2025 07:00:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739797227;
	bh=5hDuGJeEE0gQog8LTxJ/HbyUs1VjQuCw4lzCkcEFMp4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LQZh7F9cxm9E99J7PB7w/dJX3H44BrOPLDllc3MDu2ObvFsCkt9zklZJArIKX5gis
	 hVTv8XkpkoSjqYkNkemY2PQ0CZk8ocwCgtM6yfMiB6bpxulFOkboNzeoBxUra11TzF
	 NhR3ej+vhShe8XlNYip2kfWVaf3Evs76kXVuUbq0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51HD0RCl056131;
	Mon, 17 Feb 2025 07:00:27 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Feb 2025 07:00:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Feb 2025 07:00:27 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51HD0Ffs072350;
	Mon, 17 Feb 2025 07:00:23 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for cdns-csi2rx
Date: Mon, 17 Feb 2025 18:30:12 +0530
Message-ID: <20250217130013.2802293-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
References: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The Cadence CSI2RX IP exposes 3 interrupts [0] 12.7 camera subsystem.
Enabling these interrupts will provide additional information about a CSI
packet or an individual frame. So, add support for optional interrupts
and interrupt-names properties.

[0]: http://www.ti.com/lit/pdf/spruil1

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---

Changes in v2:
- Address Krzysztof's review comment to remove flexibility while adding
  interrupts.

 .../devicetree/bindings/media/cdns,csi2rx.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
index 2008a47c0580..f335429cbde9 100644
--- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
+++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
@@ -24,6 +24,16 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    minItems: 3
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: info
+      - const: error
+      - const: monitor
+
   clocks:
     items:
       - description: CSI2Rx system clock
-- 
2.34.1


