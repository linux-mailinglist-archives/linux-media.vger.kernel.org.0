Return-Path: <linux-media+bounces-14243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF291A77C
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75D721F25128
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD19518C338;
	Thu, 27 Jun 2024 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DrHwsbBg"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EB7188CB9;
	Thu, 27 Jun 2024 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493848; cv=none; b=qoBA5UzFd7ksVapN3j+em+bZ77m+0/759mKPaQlkgdXwd1up4MIRQa0QAud0h5x45qBEk2UFIMMnS+nYbBVAqcjq+0cI56h8ze4SZZkTba37f6xDaw51GvoFz3xiiejNC2GoYj+ohIPm2KEeWFinm05PzFWTktR08aZAHmcBnxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493848; c=relaxed/simple;
	bh=24D3XNVBK9Dmv+4yYpQCrJXrk43bw9jFtHr0iPUMswk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L0fQuQmG3JWyA41kSVfjt5oQT6W9SfqTWZxxbUQCtQDSMor9FFM97jU3GBX4mSxz3FKaw0aZHp5MU9IstKtwXM3h9l0kdyNMijhrgVRSJuBnLYG/AxcCyiD9431zIpqMu2xY4Et0F+IvvaiIfWFnOZAsVUPAu2ytibqPjx8Ihr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DrHwsbBg; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDASMT117441;
	Thu, 27 Jun 2024 08:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493828;
	bh=SKvlDdGZFIbN30XgC3XarKQ1FX7j3zWjtGxbHfAaf9A=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=DrHwsbBgSqtXTyATAhVSca5v8CFXfwBcbPhthIw9NZkMnSUkC853wO0MQKR9sNkTS
	 j0bhSlXz0dX775YJcbCmARglxjmiNHpJaWnwmEE5HwKGYHRvIV3yhRlcwACxjsihPA
	 i+5iowqgRYwyaifgxsKlXr9Rel5TJwaQ034xyhf4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDASCw095631
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:28 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:27 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAQUq072036;
	Thu, 27 Jun 2024 08:10:27 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:39:57 +0530
Subject: [PATCH v2 02/13] dt-bindings: media: ti,j721e-csi2rx-shim: Support
 32 dma chans
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-2-6ae96c54c1c3@ti.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
In-Reply-To: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=24D3XNVBK9Dmv+4yYpQCrJXrk43bw9jFtHr0iPUMswk=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWSzv7MySL0FTesXdooSEM5hPyLoCARKft5Ze
 8R/DF6JzmmJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1kswAKCRBD3pH5JJpx
 RbzKD/4vbD5acj/hG7LS+2Zg+E3I8TtCFax3iAE4aelwhzRiQkl/qJZ6zWLWjI96hnLifePXnNM
 GP/QV0m8AROv1M4DYOfxDZODwKuPmdnpdNwyxXfK8fAoXiPSYH73D3i3s+yq70TsLaJwYSFeP06
 Gyfp//a25HnI0apZSLI4swe3qsg44IVzPAbFWIfzePOVJ/tHMr5NWXkBWjOLGoYfELEjgnBfthQ
 APVro4n99mytxDDyMjYkvd5hL8zsvWiA0qjPz72H07lWCURKqx2HjeRfzJpH3+eH2KJfSvBEE3d
 52NyOmViipLh5BPczHytQhVLd4gdpLAnCkzqkHqZCmGWj72xRbA5zI22RCk8dTSoIsTS5V/8Fu7
 VLhbPV6HXYjIF1o7kGvvsI0fC3qD/pDsxFUTF6J6JFwUwu4geTnnWx7+OUJM+6IURiwFMwkU9jg
 bww2sWImNFP82u7ligtO1JvXlo0Y8HHtQ4130WMsqQ+IViJgHl9yY+w5tvcTlXf+oXdPWPw1Fzq
 1Y9iNZdj8qV0V0NQu40vZPiE7UBB0kSIia4uwC6UQj8+iD1chpOZRrwK4lon6mLqBOrTmd5w9CI
 oyraAcE7aZ2dp+45h3SPDkp2PtHjvNxzsyNbMhsSl85jlRJbCD0iP2RF1v0UloozC3CFyZEs8n4
 uXZXtztGH7z+HAQ==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The CSI2RX SHIM IP can support a maximum of 32x DMA channels.

These can be used to split incoming "streams" of data on the CSI-RX
port, distinguished by MIPI Virtual Channel (or Data Type), into
different locations in memory (/dev/videoX nodes).

Actual number of DMA channels reserved is different for each SoC
integrating this IP, but a maximum of 32x channels are always available
in this IP's register space, so set minimum as 1 and maximum as 32.

Link: https://www.ti.com/lit/pdf/spruiv7
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 .../bindings/media/ti,j721e-csi2rx-shim.yaml       | 39 ++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
index f762fdc05e4d..0e00533c7b68 100644
--- a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
+++ b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
@@ -20,11 +20,44 @@ properties:
     const: ti,j721e-csi2rx-shim
 
   dmas:
-    maxItems: 1
+    minItems: 1
+    maxItems: 32
 
   dma-names:
+    minItems: 1
     items:
       - const: rx0
+      - const: rx1
+      - const: rx2
+      - const: rx3
+      - const: rx4
+      - const: rx5
+      - const: rx6
+      - const: rx7
+      - const: rx8
+      - const: rx9
+      - const: rx10
+      - const: rx11
+      - const: rx12
+      - const: rx13
+      - const: rx14
+      - const: rx15
+      - const: rx16
+      - const: rx17
+      - const: rx18
+      - const: rx19
+      - const: rx20
+      - const: rx21
+      - const: rx22
+      - const: rx23
+      - const: rx24
+      - const: rx25
+      - const: rx26
+      - const: rx27
+      - const: rx28
+      - const: rx29
+      - const: rx30
+      - const: rx31
 
   reg:
     maxItems: 1
@@ -62,8 +95,8 @@ examples:
 
     ti_csi2rx0: ticsi2rx@4500000 {
         compatible = "ti,j721e-csi2rx-shim";
-        dmas = <&main_udmap 0x4940>;
-        dma-names = "rx0";
+        dmas = <&main_udmap 0x4940>, <&main_udmap 0x4941>;
+        dma-names = "rx0", "rx1";
         reg = <0x4500000 0x1000>;
         power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
         #address-cells = <1>;

-- 
2.43.0


