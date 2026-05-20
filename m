Return-Path: <linux-media+bounces-62256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJwmGn2jDWq10QUAu9opvQ
	(envelope-from <linux-media+bounces-62256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:05:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6FB58D3E5
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C10DF30688AE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29583DCD96;
	Wed, 20 May 2026 12:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kkrO1ZfG"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8F424293C;
	Wed, 20 May 2026 12:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278475; cv=fail; b=Zm90V8odAQeibzC3uIqjgBmGJ5h1m6DywaVWitw6CfkjOCV78DrC3mxy854A3mfBH73SjsVbq2qkAAlum4SVHwAm2XVh2AwRr7G9Z0qmA5vUUX+BQVVOpoExanJxCSBpVmMCIT9+27xwxMxXq+zwRDWis8SFylbfOMzfe24WyFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278475; c=relaxed/simple;
	bh=IFYF9RIT73FLeFUegxVg+86DeUuSSQ5b97Whd6RNQpE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r0Jxj+FMn3XUZyrYhvXqV/wEgAUksLO1PEid0Lmbsd/n9GIfRbOA3qaCzANiZDxPrp+z1in4Pte9Mzwv7OY9t23Ubx+mgvBuWc+LYKX+qdmZoTn/zETVNflN/lfdNXAfKr++IdHjQsvfiMSfzDsCYbjSY4xAsLOAHUkPpdI7KOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kkrO1ZfG; arc=fail smtp.client-ip=52.101.61.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBOQCHjYzbf7NxGdEhRdOWasa0xkIkQaLITmjf3OZGOoaJDGEnagY3EBUPdwzKGmVsVkVfSi0qWkdiiIZZ73othGEvpp9354f7pUEVlKu+vXrw6JVfcnFYaKjc0/w85IOLaSlCagT3t3atF5tbB/yN6FU3tAjfYFmjJrb0S8pO082T5Wl4rfEQl8lD+uGVPoR65tNuxrLPd/STbdxTPfC83OAaCWc+oFrYwMSwJMm8fNdAshpAPIY525gGloGCrbV5wUpJriNN+D5d5hjn0fyplPuwLUYbQI1vRqVHDn+gzEvy6kUCHqbUvOd/IoSfeH4dGCeBH6LlThRJ3e7J4Lhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lt6X5vJMypPF2ntqXJz2jWfNePmR/AQc1XaefjsIRj0=;
 b=D6WZuCZFqWSAb8YdnB/iYheLPm0UEXQizV96gPkOAsOHXEQ1VusHztTnxy7/carZI528hjXi9+wTD5hwUUUy3dBNMPH3aL2s7oLhlQjcORu3eAunBpAUu/mozFR489jmpg8pH9RT9LW63x89VRCamAO+hcK7g5mC9DYq2MQ3qVRvCIbj0gFmfxkRR93K24HydVSDfHU2f+9hbvWGCMddVuHr7dZ6sPdqTvgpulPom7YWV1U8pEArLXabT+XGhwe3BXXwc7La8iMq8bUAEeuBv+SZfu46TVoA16nwA1T/iXSvWmj3mLoBujkjd2kd2HMJYB8Gc2b4Njud/GZ7YdHGsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lt6X5vJMypPF2ntqXJz2jWfNePmR/AQc1XaefjsIRj0=;
 b=kkrO1ZfGRn9nZ/9Ndf8LjKKJzK7XxCwjTYh7ORm997mUVb+nF8rtAWN8k/mPyQCmZDpPeQz4+48Dm8UmPhSqsaaNzYU3XbNT9kJ4AUYIYe+VhAoivNw8eGe2r6/iqc9bktXj9e9yD555tSSeiKYXWfsrWacqPy3R4VRzndf5PME=
Received: from MN2PR20CA0049.namprd20.prod.outlook.com (2603:10b6:208:235::18)
 by BY5PR10MB4147.namprd10.prod.outlook.com (2603:10b6:a03:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 12:01:10 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:208:235:cafe::1b) by MN2PR20CA0049.outlook.office365.com
 (2603:10b6:208:235::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:01:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Wed, 20 May 2026 12:01:08 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:00:44 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:00:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:00:44 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KC0N3R1914726;
	Wed, 20 May 2026 07:00:37 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v13 02/17] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
Date: Wed, 20 May 2026 17:30:07 +0530
Message-ID: <20260520120022.539913-3-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520120022.539913-1-r-donadkar@ti.com>
References: <20260520120022.539913-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|BY5PR10MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: d727475b-b38c-401c-5af9-08deb6677acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tOD+CC97F778XUqVVWiDVl/xqbSY3igW/6Bca9f/THQu32SMNbMM1E73/iGD72taL5Axo3Xsf8Z6DEPkXm3DdrMq/FEcYEfEI45cHS9ujGnGWzWp1Z/ofTUj2CJ8h+IdZAoW26TosNj7jVV7iIiIppyhg3Kg/yTrWU/dX5K12FELJT0VBSUmVq2O2/EGmz0bBtSW9tzdNW6ILdXKefD85CPagXNU7rBgvW43GA0gqo42QkrEtAALjVzlrJpZa8vmMPd+JpIzwm9R1dvg/XriBotwTQoCmNbTH8bRj50coZkSk4Yz1mqCwUM4Yl4RqUteQml6L/L+AFnTQL1j8VLY9snxE4lB/ufS6ZXNY0gqdU/f+SHmDr0OcjLcua1PUDoJa9cILQMbemaSSaJTasSj6dHLcqVcihuXoongaWRRcdBOjYWyM6ET6BT4SqiP4xoxuHyoyKiHE3foh+kfx9U1VbPVW3d/fjPEeAzfXxZ40cjmRqBtyCFbAuXQbDpqeXYa/4B3R6eZxP6/YXsPiSGU4B4SkpT5wlZhzvrohwafrxz/mdp9oOW8HIqRsWBK93jkFjDhPxh5alnVD/g5B3Y2eHbuk6tFvPRdrJy4Q0xQQVDmocfCA3TiLjWi5/Lv+VReOPBo58fJT7dEmbIA7VwbOJRZm5ZdgU8RTQDOaCwbBgZggo3OXeeufME9xtYjGSrVWdRosuoXW5ACSvTqxelIMxrY4ueS/TV+mnOoZ3LFXAo=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t9MJBSSobSxRkI8MBC/5MBWm/fhZjktu5XuYnHXJRN9YbztOIEWCOgrTGmxqi0RNYIs5wel8XJD/cJaxsdi41x6X8J1GZR6CBHT0e9dwHZNTaHR/AYWdE4W1P3RZFXs6cpZuY3M66V7p5Y/LTIDbxxFmtERazymGEEI8UMma65TC3Kae3HvmabmScIfLuUk8hybdYAeT0vtdNBgHVmbJsW2Zb1jFz2rRuycATtB7JpZefiHlafUD5tBLqXHdt0CBBaO0KbjmcZJt7aHtWHOTYhOSwBoWR8duXBvnF8CjeLXT4vj39FmrbWgebPuTiD/dMrVTwGUVG4c6RlejYXJFeXhZFtLWhSxCn1nDrBzYrjpkI9VZ46RLfsIfPbnWRmjJ8AZkphP2fZZC+7wi07n2lBVi60SfeP33CjuOX0uh9/7+vESA2AsIlUNEcuR5ltH6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:01:08.9917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d727475b-b38c-401c-5af9-08deb6677acb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4147
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62256-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,ti.com:email,ti.com:mid,ti.com:dkim,0.68.170.32:email,ideasonboard.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0D6FB58D3E5
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
index b9f033f2f3ce..bf62998b0445 100644
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


