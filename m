Return-Path: <linux-media+bounces-49670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35ECE909C
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C3983004431
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9783043BE;
	Tue, 30 Dec 2025 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JRI8GLBc"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2CE303A12;
	Tue, 30 Dec 2025 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083575; cv=fail; b=pYkBcbnm9gp3VhD37pMam1ZnI6vnct9aFipCxDkk6TxOswIGolt+mUIJjtl+3nurUZunI6D5ugHaIaAsEVKeCbLRw28/A0zahFxjgafLdbmXF+pQl8fIxehIh/K53GCqieESWSyQ8LgHL8HhauH6XINvBrhIobziIJ/dlNScLmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083575; c=relaxed/simple;
	bh=s1Z6i8nmkzcw+5uOaYPg9pWYsuDmjnhT7v4WJaHkyLk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZh2CdjXF9Dq9p8OfKlT/U21wF0slNW/OuzFcATDYLl5PAfG4K4UJ4MUfvFwdp5NAz13X95cLuFjNmF3MSY7CWtdz+x8W/W4uDq8ylB3fJXl4u8T9oFo4PsS6xZMpMpQXtlDGKo3Eqh4f03twty0dXOIWf6ItQCs1xio1T68jLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JRI8GLBc; arc=fail smtp.client-ip=52.101.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7ZyudCZCYIGx2/phX2CT6d8eKyZkNrRYD33aMKGYLHqgEoJfLpeq3qh4wjS/v+vz6BtjoeDSzDiTPoG7La8EGwOUXGXUQvU/h0knmcvNz2yM0OML6igFF2Tkl4GnKhi2uA3PzZh1KhbaJXN1fd/htpR0965G6+k6SCTxMgHbmrFwFnwHb494qkAmkiwTM7M9kp5RnZpn2jrnYHuXIpmp7jxpz3lQF6HXXfNt7/oQ7JfrNayd6EmdsKnQEbXEjCXs+ZIPtC+IQRzE/rnXm0vKlrPAe+sWFV/8f6V91iRcEcP0vDPH/1TzeyIBilp5A7ZjMOTW9Hn42jS491x5FTHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKOGeTrdANEFIeSncdxz10Hh/ukJDG922e6712afheg=;
 b=x8Pmw1RxQBaqsTJtU74d8ecf0T4mB1CsCBVhRfsuQHMDtJi6pMWkIA2vGscTReBaQIqJRXe6D0ODSajDnV+LBCREzNZCEtK36WW7+wQH+Jomw++hnGuak1DHlKDssJlKp1Za3iZ+NkDP3SQH6cUsfgG9lSNbAuP7U0koq9z3ENKbt7pgAROBJ8iKRsSZEI+vwwGadKXf061vVtq9ANKO5Z97oiA8zHUK1ZYf4xXMVeCWXk3laRl+dFIbH2jGtnlgcc2ZJCOAjxEtFZPkURYDTA7sF+2LGuo5rHtDFupannRfW8f8URFg0lPAcdB6HWzW+jV2jRvbgeNHRa/0gOX/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKOGeTrdANEFIeSncdxz10Hh/ukJDG922e6712afheg=;
 b=JRI8GLBcx7HZd8Fqtc0RGw6X4XPoQZLIMKATEAC2BFQlgAG6MJ0ST/TubKpgqkxTZs3lPHfT2ZtY1yuAQG2Voq1qePr68BJFzMzKe59P5EnUBrjoGijjE+dzy/lARYWI4khgAhHUyunumehyXGacBFUjlZ+2wtpZ+9Cjm5QI/OM=
Received: from BN9PR03CA0848.namprd03.prod.outlook.com (2603:10b6:408:13d::13)
 by CY8PR10MB7338.namprd10.prod.outlook.com (2603:10b6:930:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:32:51 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:13d:cafe::ac) by BN9PR03CA0848.outlook.office365.com
 (2603:10b6:408:13d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 08:32:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:32:49 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:32:41 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:32:41 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:32:41 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9V579464;
	Tue, 30 Dec 2025 02:32:35 -0600
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
Subject: [PATCH v9 02/19] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
Date: Tue, 30 Dec 2025 14:02:03 +0530
Message-ID: <20251230083220.2405247-3-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230083220.2405247-1-r-donadkar@ti.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|CY8PR10MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c4949c-052e-4711-b690-08de477e043b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nemvZ/zvSgIxt8KmZ0e8FiN5Aamm262Gjey0orM4NtE/JSrRtvdeCEf5lhY5?=
 =?us-ascii?Q?/9Ptl6y4jmiIJx3rAq5reQ9acisVZxe0L+26JnwpEAPTpjH+iDKlxAeJkFjm?=
 =?us-ascii?Q?Ej6fU4kz2oMWyjMjDPoxKMHy7syAmonWJosj2657NCPxlGSQrkertxDx9uUw?=
 =?us-ascii?Q?WFBG0LpYPx/5eSYnDWys1BlgTHD5WNz76s0d+yWJPlH3ZPXsy0B/0+kUW4zr?=
 =?us-ascii?Q?BQIW7jvSoGWTYQ1ttB8B5DDnCvGu85cVrIPZopOY4kVDkRZ6LZV4aziCLF/2?=
 =?us-ascii?Q?aGNqa3WHR15MekaGF4zaSZNZmc/FuidDKIYDt8Vl+pv7doI42rivv010fUVn?=
 =?us-ascii?Q?Sz2dhhTWFWgfuAuWH9Ymdlcu22QKWDr1MKYOL+mf0AM4/7zF1BJXCd2Z1nmA?=
 =?us-ascii?Q?ZG1A28EL9XQkUyTNNLXKmkqrdNY9lnYjufScxDl1gydc4nWD1B4Udw5EFygS?=
 =?us-ascii?Q?eeer4CPRIQNsdMaQgGgzdQXETqklqlEW5bP3RMFyBIs+zFEx08xYpNp39rXZ?=
 =?us-ascii?Q?UZQ/DELDTeF++LH0K8fLQxJoU1DpIpVtv5GnIcOSa99IeO5bWZKYulP0YM93?=
 =?us-ascii?Q?F2CRblujMNrYzqV2kJw/Fcm7S2Fm1aYUdtFLxR0N4CPPYa+HXapx8/j2uUmU?=
 =?us-ascii?Q?6civIQUgiIt2Rs71EQmBof2u2wWavDY+EsxE3OQ+tSgpcI2ybJY/wJgKFKF4?=
 =?us-ascii?Q?mz/G+tt7tocfL/ksUBZGPbo9SoR6feAY6JYDAisZs1IPpmkBioTTMqDDy0ET?=
 =?us-ascii?Q?WXKh+s+aI2nqhmfadvIWm3aoCF29rVzGeJYlk5HNeBgqBSrl96cBsMM6+EeM?=
 =?us-ascii?Q?olx2egSTlKYFu7AEoGj8ehI3Qn3E3SDPchjQeiGtUJ0aNqrU3mSXKZ5XZh5V?=
 =?us-ascii?Q?nw0p7U7mYYvU6SXvnvXhCTaMPLb8LdY3wF10OlBaCaeTNqPWaedr4G9yhT5C?=
 =?us-ascii?Q?l2yBnT+zJXkAHEwzRLHZ+t+rbjhdaJ1d1uJSBfVoyPEmQnBagaOijL3Hle38?=
 =?us-ascii?Q?1V5DAx0EFgW5rzsF5nkBECDdp5/s8SOoNJAlSFQdIaLe2WcIGp5BZGwpbEC/?=
 =?us-ascii?Q?8NNeJ4R8bxNovVu5SxQLYSJA2JIl4lskboHcaPxvQ9fpWPJar7rpDJFYoU+0?=
 =?us-ascii?Q?2L/sxKIKcgjVrb2dUKnZU4tpxKcEcuxcuMTWpmzEFHktv7aUoI6lPspItIdY?=
 =?us-ascii?Q?z3780pu+juA/vxgBRa/PORyCktEd7a+ygBB2qmUZWkKzHHbI5b+ZsoThyqQh?=
 =?us-ascii?Q?sIfcU51X9VfEBiZgGwyCT/6xS1UKAJ+JoTEaPZ9ku7GX7cmyEH1mjWAbqHNX?=
 =?us-ascii?Q?lX2kzUpzcYuoLSbqyuziY8jzNsv5jjptWFg1vndqV/S2Qv/a3fngZsc27Fe1?=
 =?us-ascii?Q?XCbnRNArZp1Rif88mMM4l2nbURRn3wWGSlLyQ0vh5WjAFFotFINz8Fc1Blhk?=
 =?us-ascii?Q?G61QnCwxqamsb40HF9qA6AnIE+HbwW3thFWbbPUmA0H1CLZpW9oZb10UdyjM?=
 =?us-ascii?Q?NPcAckDnfuPZdnbGQP6LU526s7yMCpO7oYivPzxpXa8mbYwIk5m8M66M7GWl?=
 =?us-ascii?Q?7u9w1L10bkkw1VrObU8=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:32:49.4434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c4949c-052e-4711-b690-08de477e043b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7338

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


