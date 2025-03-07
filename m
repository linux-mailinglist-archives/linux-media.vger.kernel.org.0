Return-Path: <linux-media+bounces-27806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F140A563E7
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A16E11778D0
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB4120E00C;
	Fri,  7 Mar 2025 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="e6ESfSgP"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524D21C84BD;
	Fri,  7 Mar 2025 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339919; cv=fail; b=GxpC8Tr03Ts7ipW6328zv4J/Fx2GqrJGWfyoXXvQAvmzr/fuphEALP9OluVAaXUuFPfo4qDhHlw3a93a3anq0rXHxPFF5L+yketis39zdXzH03j6Qj/6Iv9IeajjsgEG0R+7DhMb4INP07yBLr9TaV0iGR4wsNrDr9tQprQ2mZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339919; c=relaxed/simple;
	bh=r/16opGlPi/HMt0ohz4XmRjc8gvcu8GFBqyg3ZeS3JU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=awQAvdI/Bgtp+3DZVb+M7ZDpzD1qYRbGP571YOnNBJirUMYrFD7vZmLvy7Nh2D9ecE6oB0M6nrHavF9zeOuEgfniCYefC1qZzyIjKZRdogVPA0Y/BUN3RcHr5FW9GY/SnZ6BIAYnMzRxlNUt81r/r5F9OgIpTux2Ch03dspH7l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=e6ESfSgP; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJ6KHf30BgL9+L0iuvboj0p+duoBtODnN/il01SIwQ82YvROGLhS1U+uHKEenAGmlJBYn1OibMv0u1bXLorsMAamGltl0z7tFPinlo+1S2g7xB20fLIFOhuolXPyx0PLs3OckCh2HnmfzRgB78W75n/ZuCiLzMl07GQS6NjNfmMEqxYKzDtl+Cve4dwrWzkQel3/fU60lVf6QmF6EK3Mgg1JV1+RzlRDc2A9Es966snj4NV2zrcPu2jCcxl1E13ZfiH3hXPiRV/Ce0Zm8WE6byTRgM9CjTy72dA+hAUsPsjSS1qM3cMkyxFtAY0ASlU8QavRX3JlRTSKPdA5dot8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2d8lBGUMmM5wk/O1wf1v0HaSQEp2NcTq09RRa3tsd8=;
 b=rN1HLRbqAo/4oYjG4Y14xtpOPdV16sVm/vksu/PHV5FeMyJshgn/vAo5Q8KhdaG5v868auxQXavZ0IipRGz8RKu+7bDwt1PZSUDaSODj8sG6zZGBCGlj/IA49L2DluYsYMCrIHdCRFql4evRh2zgDAFsYi6oYHAWRowxePjFZHCozYJ7YxM8YiDd1EYDuWOLWRe1a9n1rGWdZ9tgpISxoxM9CuhZMy2q+txRJoX5zNlT1EvNU4GBabSrf6s93nvVWKvN8YAx5dh89e9bqnLHAfh8ryT1VkmSINMKy+r7mgSU95nym+as1LsZOpZ+AJWLwwsSFRGgpbRWOA3qzHN63g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2d8lBGUMmM5wk/O1wf1v0HaSQEp2NcTq09RRa3tsd8=;
 b=e6ESfSgPk3MztMBlZZ5tQXnye9EKUxnQ9LlZMa1m0pq/2xM7izdZUheW3+jC7PmJGQNcDGzlNJHpV7j1L0yFYF4Y/zw3lkxuszoArLZxnMb6qoobHKzIzq1er104vBDbk6a4rhmL75ggdNZY5LWNTJS966it3doAntnVRiiYLy/xWw7nXhpTKMwnkiBN7kowRoXNAGXWK6TvROvQPGcoRDxUdnStLxVbpJoTMJcxxnJayNY5FiGuiHcbqjst/Kg/JEdidhuoWHnrPmhn711NmNj1VgrzH76QqO4td9OdPyFPpKekU6wLg2ymgWDqAFptygzbJTNiO8/5Lr9nO/k2iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by DU5PR03MB10443.eurprd03.prod.outlook.com (2603:10a6:10:529::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 09:31:53 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 09:31:53 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v4 1/6] media: dt-bindings: mt9m114: Add slew-rate DT-binding
Date: Fri,  7 Mar 2025 10:31:35 +0100
Message-Id: <20250307093140.370061-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307093140.370061-1-mathis.foerst@mt.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::12) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DU5PR03MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: ba853279-2a7e-4939-48d7-08dd5d5ae4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g0RM6DjsPADpNdTCq6GuolvKqXElL9ev1vI3dXyASXPg+xutlCtUFYvghUTg?=
 =?us-ascii?Q?v8hBHElom0Ado2epRMApXPy7wNwn9/4k3RYa+gWYRdYcGEnW513NHI9g9C8z?=
 =?us-ascii?Q?tVpyJzfp3uEAL60yx8uth0H+zzOQLYGLzp6Zux7p7VG+VPiRj0hu8RDx2ajN?=
 =?us-ascii?Q?675JJMxGcWQ6NTrqjY6BdZwVa64Jp1Z/H6W2GCAWJSGXGovFIZf+gGxQt0Kc?=
 =?us-ascii?Q?to55c/hjN1eV1/+jMCpbQpf1JLZVWn4dPsRIL01Ng60erlGV0lNv1iUfV04K?=
 =?us-ascii?Q?yFe5a1fNwbEej2F+TzwWMEHW5KBmxH/tR+FrMYP5f99f9LrfHa4GujftNen5?=
 =?us-ascii?Q?l3lHBYmUhpgxCDnQoCXK99QyPOFGp9TLkBL9N5UgUNyRhwhyBxGbl5wFOJbA?=
 =?us-ascii?Q?EmNq+8FzyNe3bU7RUAkTaWAlemDl/n8CUCPjJrOzfH0jZ5XSEhLCcXQUjGvh?=
 =?us-ascii?Q?nAj1KpRnc5gOdtKaCU5DC9uTkvOiUmn3DEK+FWjwSK1CQWOYe/MzOF7hMa6X?=
 =?us-ascii?Q?QKufmF4PgXKsKPTV7X6qa4l6jKG81LPs8RlTl9WtVrRXQHbxsoVmmMmCB24f?=
 =?us-ascii?Q?t9BuFFKqzhRPZzGAEE7H4tQ0DD/w8LtN4I1IDk8lfyr3TCXfQnZpuXAO0xNC?=
 =?us-ascii?Q?lQ6LqXuO/9sWyiH+hsqejkhX7Sg0swJbQnNJYurzwKsc31O+FMpCQtyPzUYx?=
 =?us-ascii?Q?Agq7kupRsghMYlHQaJ5cpGnMNEf6X9jftgSs+zg0C7U99Akzd7ExUF8BehAy?=
 =?us-ascii?Q?+fODv/KOC/zSva0t/nrZnPkWW1xgxSaZqCXrc/nkmhesB0IYp5t5bwpIaDtN?=
 =?us-ascii?Q?zR6Ay4Nih+tASA6YRT/fROen8Amr9/LwrLb7Daw+rylqA3pacYujPxvwATqz?=
 =?us-ascii?Q?SyFnoYbUQiikw7uOQZUETX93zZzWzo0zhcJ0e9zkoVE/8DDxY9f3WSYO9RgH?=
 =?us-ascii?Q?3zb67PUswNjUiAjQpGgIlgBfwWCllT2Af1wYgHm1oSgNca9y/6a1o+WjRg1O?=
 =?us-ascii?Q?7mm+iHXnWcmu2U9ZHSkDj7FbURW46S051n/Dt/UcKqNaF3K1YjYAJL4Fvi2/?=
 =?us-ascii?Q?cqKaWRgxO8ykMEDVgPLqJedp3nGQ+Y0EuDue3xjqv21xoimrsM8M91jjtHsS?=
 =?us-ascii?Q?uGXy4nGH+VkkoCYSufKL3Fg08cFki9WyH5gIkaaShy/dgBRphwpU+G4KGKn8?=
 =?us-ascii?Q?4eJHAwoQ6MpkMzeaKhpCS2jJaF7EPkSiHBO5R3SxLagozIZb/wdaDcGQLf6k?=
 =?us-ascii?Q?8C6OK0niE/jO3mVskPKjx+TNvDcvjPrKhdz5GcXRK+bE645V6OOk3BAK0ayJ?=
 =?us-ascii?Q?XmuOVRZmRE6vj7XUFSwPGPmOuPEp92CUmUlYvbrwRCabR1UYOGlnOy999XXO?=
 =?us-ascii?Q?fTX343ON7AW9cM8hOF0aRz+wVYpL+oDywHtU8xvwDyk29tTN7H8N4KVnUJou?=
 =?us-ascii?Q?hk/DlfYlTGExI5cbu4/bZJ+Od8E/aDtm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eGUIuETRMF9vW33rxbnlAiijidSYp2i7z9rYhtE2Ca10juTsE4cgTA7rR7Kv?=
 =?us-ascii?Q?vHxdyC5HLBkQIyFUJvtwkYDV8t9rD8F7XfNTpqCVZpMp7Dzbu7YTbAanYbvn?=
 =?us-ascii?Q?sNZ5pYTPC2bBlJy0asNXT7lYutumA4GYmpItEtZCoDPfU+uUIDJv+Znu8+GS?=
 =?us-ascii?Q?4V8btTF/zRemS8MdbpV4JnpqkJ387maz1SHkG1cDNNtLL2ocwPkeeZeUejLA?=
 =?us-ascii?Q?OtrX3kazT16kLY75FuV+7dxZ9oFroQVpenSJiWHqwqvD8t6pENDiad2P7nl3?=
 =?us-ascii?Q?Pg5Iv/sxcVLnE5TNpNGvDTAstDdJcWI0xxmpfJJ1VyODH0T+ot6o3oY6ERfs?=
 =?us-ascii?Q?AMsguEs9dziP/JgXLVtb5qGvGnC5fdbzaxDcdDgqCnvrtAgflmfSnhl5LgTW?=
 =?us-ascii?Q?M6pj3EANa7NmlccFBcBFZGBTwVrKGVBz7m3OWBV1HLrC8IXmpLm/yvpalCBN?=
 =?us-ascii?Q?nXbSWdYHL+Nh8lLzfQfG5W9qztV9dDukiIBOxFXFWobv/9Kp2iWC2CAH3zVx?=
 =?us-ascii?Q?Y3QZV/NThq7fZTJqOnVH/sVsFsVrepKATZ5Rayw3JX/cq7LmZiCzMhb6e4pK?=
 =?us-ascii?Q?hKusN4zUD8pQa92gryv+Rl2Z3hOE73oeNfTUtS4JHU8M+vzHkahZWm755E8Y?=
 =?us-ascii?Q?Sk2/mr1G7iWh7SxwyNsMggkv5/bEqXIVdJ0khv4ZVegnH/IyzBLdyKTXoia9?=
 =?us-ascii?Q?gQx1BfUS1WGGTS8ohPEHdG1Y5tHrHv8/5+O9ZhJs5JfUsz+GINW+iGy7wgNY?=
 =?us-ascii?Q?KRotalGfjj2NgwHt5ci1Rkc+cwicaZkw5l7ltZWGS+MPYqX0VRXuk7SKuELJ?=
 =?us-ascii?Q?1oPmCZV1Zb/8pvhBV/jjVcN9uB7FbLQmLvlOf+t62hbpA4NYeu8/AcWjmu4Y?=
 =?us-ascii?Q?OlTSXbBEHE4E1SW1iv2OwQODoiPLvlLoqVqS27nNAlChEa/gzAbyezrvDUhO?=
 =?us-ascii?Q?KkRen9SP0hJQJsv8Uu3bj+YI0BQtsB/L+lk3subd7/f+CHWCsWm5dYGYSVp/?=
 =?us-ascii?Q?oGZYe1knw5S38VSJx3AlpmkRCCXVJLclqOk9b1DEQKdWAjv0M2cu9+6l8bwh?=
 =?us-ascii?Q?Gho/729gpavRI3+Fix2c9GwtXAkt9DGJW+hSYXPhynKlOlcO4fEDaUDvGCkv?=
 =?us-ascii?Q?s9q8BjoauP/9ApvYmWU4TYNfEfDfA0CVVgHNuxQpNBnhvFn10wjug7Xaqf6D?=
 =?us-ascii?Q?xE94w5w4GoBRwfvBgyHm+NET803i0EvYDMENb44v+r1Jeigbupe4YUJ2oDvd?=
 =?us-ascii?Q?TYVXo35qU3AOdsp5PWLt5P5iMk1vAWlV4MTiMNeTbGd60ZX0riiF3GjHHMw4?=
 =?us-ascii?Q?yfNcxKfEeb/NycuB0VYlN96I7XYp9x1orQTZBrI2eeZzDq8lnZ+OLvpb+omo?=
 =?us-ascii?Q?Nr8Wry8fRwwB2XqthcwCSMSVbv8+U1YsnXYHgQwEJwcGaHV7TVXfYKgW9wFW?=
 =?us-ascii?Q?28bs3yjgeclHnImC2SZRrtwbmJsnZM/MgQr482bBbx/LvwibK2gUL7G/979N?=
 =?us-ascii?Q?gl8loETmkLlXawdXSuGr98nrtwOzw+pKi/X3a3yER/6MutRRH1Jdqwpi9MVC?=
 =?us-ascii?Q?jw7ynW7SaeXk61o5TG5MkojkVjJ7uoWAQKEZkvwD?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba853279-2a7e-4939-48d7-08dd5d5ae4c7
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 09:31:52.4735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +D5RcMMmlL6grww4zAPz9neuyRQL2xgBSh0dfo2tjv0QdMeOD+qT7nXbVzUtDxAD8r2c4eztKzZzhUHTOar+Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10443

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Add the 'slew-rate' property to the MT9M114 DT-bindings for selecting
the desired slew rate.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index f6b87892068a..a89f740214f7 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -70,6 +70,15 @@ properties:
           - bus-type
           - link-frequencies
 
+  slew-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Slew rate ot the output pads DOUT[7:0], LINE_VALID, FRAME_VALID and
+      PIXCLK. Higher values imply steeper voltage-flanks on the pads.
+    minimum: 0
+    maximum: 7
+    default: 7
+
 required:
   - compatible
   - reg
-- 
2.34.1


