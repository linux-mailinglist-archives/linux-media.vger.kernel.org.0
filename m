Return-Path: <linux-media+bounces-55613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N/0NxLUs2l5bQAAu9opvQ
	(envelope-from <linux-media+bounces-55613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:08:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489128035E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 933DF306B5A2
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9038037701D;
	Fri, 13 Mar 2026 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uxviQbCe"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C96389105;
	Fri, 13 Mar 2026 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392877; cv=fail; b=I7OqzsJgaWdSlbFMlU4YtTbNxOgKtDafkAr5mOsN3y/JquUr6qhA4Amw7Fjfj20R4bNY3lfA94zBmXKpaDuG4EoaSObal8iWft5WFhuZsgmWcsJO1y5jz74T2Bg9ie+1WXee7Kjfj1X94uA8df3dtcaMO9oqJ17tkKBt0SmJHUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392877; c=relaxed/simple;
	bh=s1Z6i8nmkzcw+5uOaYPg9pWYsuDmjnhT7v4WJaHkyLk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KjG5SxoiUyoswQVQbU3WdUA/hIShbhrE/c+S43CPnPkDc5E3helxm5Bf+v+VoLYVD7XMSqWOD7a5Z8NkN+twkGMN8lC5UCs1VyeAbt4hyfNL0/VsdbJLj9qegpvJuo1+w5zqMpr2ZWICBfQwxNbufOxyip8ROT/nPbde6BzI9DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uxviQbCe; arc=fail smtp.client-ip=40.107.208.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlwOfnWwqj9iT+4zhHtv/lqLy6vL9EnHeA9gkXfOD2a9rneG4B3ms1GWl4Y/whNMoYbvmnO/8vljO3CLNCwAVHP0x5mKfb087P4dANeQ2feX1NRuBbbEJgX02P5XQNA610UnHyY7gcc5x5rd8o9VWrvum43IgIjKZ1FiUwwGlfFt9YXJeguw32xsbjXWINzVlFp+nlWMSfYTmsj5IVQTemT6BaSKm5p3ggtIjjF6eemX80VFplu+6cs9kvL4u0fxJAIdllYcVN903ivF2TIheVpG0NEI/gzl/qmvVEBF1CzQTIcUHk97d2Z8jQTmhaYWf2lpym2Kb5Xt79dqIoRHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKOGeTrdANEFIeSncdxz10Hh/ukJDG922e6712afheg=;
 b=lTAVHGswTifY4lPZILBJMU78JO62tVXnCYACh4NNxBoZ5UEvZBHoS5kHlJV02SEEX/Vz4VWD8OBYoO7TwDVmVNcBxPfJzOun4X2i1gVcT1yS6rTeeQ59CSoToRr64Ae7MhEbdkU2bydcnXwjmB2m0Mp5K5Nv7pG1HcXLCCX9/7jg3MHaBwdR+NpXwNfuTKEZScltOXsuHDudbdOJIDA+Z63r6HSvNg1UcFP/cfwUKYncYyz5oVNPn2fEmecsSjb+ZiD7f6KG9RTj/pMNYbefthz1NGYTJ6MSDqQSzKg2x4II3ks02WqQz7WBbGdMTFJp1f7/bJhyBK0e/RxnG/EURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKOGeTrdANEFIeSncdxz10Hh/ukJDG922e6712afheg=;
 b=uxviQbCerFLUowjKjHUo0AopHH8DwtLgtQScwfGEgqXS3M2jk7z21Ko6g/JZ61w+ScYl9OM3tvXF/OV58fJL2nndL5nvpfR7S1451g909gFAzM5aZRxsDGwBaUYQgJMSnU943ZiIqJ4b5Ynh2PXAsQt6bY94TjY3ALoVJavcW8Y=
Received: from CH0PR03CA0434.namprd03.prod.outlook.com (2603:10b6:610:10e::16)
 by BY5PR10MB4340.namprd10.prod.outlook.com (2603:10b6:a03:210::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 09:07:53 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::ef) by CH0PR03CA0434.outlook.office365.com
 (2603:10b6:610:10e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 09:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 09:07:51 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:07:22 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:07:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:07:22 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bW274611;
	Fri, 13 Mar 2026 04:07:15 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v12 02/17] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
Date: Fri, 13 Mar 2026 14:36:46 +0530
Message-ID: <20260313090701.646534-3-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313090701.646534-1-r-donadkar@ti.com>
References: <20260313090701.646534-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|BY5PR10MB4340:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b85df79-0dad-4c91-3fad-08de80e00150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hpLTEgQ4lckD78Y87/nlKH8I76REzdZ5sRB3DDbWpAVgbhB3rJOej2DlBduU5z3DCs3lz4Yed1pbWxOJSQZYaFN+OkcOsVIW8OFNffJwk+wJ9KwI5Cb5CTaLywHq5vPngszZyQoVJqx7lyEhJ2cRhMYFKA0Ql1EMpGWVVWcir+yO2xWuRNFNWHo12sW6bt5H2yBGYnkLbSAIgNoH1VDPX6aLKBqqO5UHfTTSyv5S4+Kf2XnNGUUd9FFrQLDY2GC/ka71cf0RXMu1PGZe3JC5CXcbTDpnC6j6wnsEU/VH2hNR0e7dJwbBjBfhdQNeFPFwERshAGYTxGNK/n+VeOc6kU6A50M/67Wzwf3Z+rXyuFl5gaBsQ3uMi6hBsJ7C/yJW9SvXIYoxug46ko8EW9BkAIPLbilLCyd8n6aTmsxOsezSYGi8be9hOkhuihpEdKuip/L5JzZVaFSlVMTc1PfgsfgwzUcJHBZ6nUTbyD5PBAxaIaYnQFMjH8O9/NiYQEmubWWuDK4h/K7ecsusb1ARkxCMti6QvhDcf46pLkmIwU+5/c+ICjnZaGivRFEOaW9Gty1Bps16iBImuUn14qY0pXLZX5y3dHtPa+WffVnO68F/pvqov3PidgwbZ+uSfsYnLuH4rC3DNSxWbzk7IGR4DLySsJ3aZqUWV+NiLiuKc3EmLG0P/BrqPP6P1tmEjLzehBipSVqRc7mGNXZOToTofKj3yJ8Me81MDEDHQJytv0Q=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OkDGZqg5kOT5WAWmGzjlvf+DEk2HIO5Wdck4cwWwpECqPQ3GIMBFQmysXZj+CQ8pJPqivBVYcisP5rmTxFuTuAfFzxo8DTJSi+jwMLbyKNHhNDXvmVT6ImmegGR2WTmJpVGpAKH9ntAhNk/Bzew5b1u9gDggZb9N3bjrSgB8A9UBpGHAvBS1KEFpHi8ExaZthAj9dEvQuTRzZkUqpUptQR0DFP38JDnVq0Iaw/DHKoVRQoasyrgwi+kQLX3QWBvMr2i/ypmeeV2wb+0LW/VMhDkMX2uoOpChtqwZ3uUyDyDbLkn2E1HTN7mjVIoPJZVtXeIHYsRFvgQRR8mZBhOLQqAo8f1WliSDqZdX06Ec/oCpu7/YGK7K2Q+6/gyDnm/cuAXem4+sYDuvkIwSZgf2rtHYLx9Ltxml90LUsqvlYlHJzj+MWXe1Ikm8ngyyLSPO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:07:51.5371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b85df79-0dad-4c91-3fad-08de80e00150
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4340
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55613-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ti.com:dkim,ti.com:mid,ti.com:email,ti.com:url];
	DBL_PROHIBIT(0.00)[0.68.170.32:email];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5489128035E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <j-luthra@ti.com>

The CSI2RX SHIM IP can support 32x DMA channels. These can be used to
split incoming "streams" of data on the CSI-RX port, distinguished by
MIPI Virtual Channel (or Data Type), into different locations in memory.

Actual number of DMA channels allocated to CSI-RX is dependent on the
usecase, and can be modified using the K3 Resource Partitioning tool [1].
So set the minimum channels as 1 and maximum as 32.

Link: https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/10_00_07_04/exports/docs/linux/How_to_Guides/Host/K3_Resource_Partitioning_Tool.html [1]
Link: https://www.ti.com/lit/pdf/spruiv7
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../bindings/media/ti,j721e-csi2rx-shim.yaml  | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
index b9f033f2f3ce4..bf62998b0445a 100644
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
2.34.1


