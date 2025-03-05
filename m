Return-Path: <linux-media+bounces-27578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40939A4FB7F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 622163AB84B
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C380A207A3D;
	Wed,  5 Mar 2025 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="eH3bA9BN"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991902063F8;
	Wed,  5 Mar 2025 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169730; cv=fail; b=urW1GDpOVHKvqVOFKk8xeTVOEg4wiIojhS9HbdQzAQ2H68TfKHw4pbQvSis4DEmNFP6Xy6gtVA7Lt20kI2bvwhUfH8RZeux4o2FSJ/fAY1IPZyTDkQmV80q4EQ2Ro6Nbwp5ugWaNkaZbotWJGks3d2XI1U7eOCGSnRhrKQIukbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169730; c=relaxed/simple;
	bh=TwQZ1kx3BcEfthhx4JmM95SovqBvAcQLO/N0pIaSTl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rbb8zagP1RkC0RGOgr9tohF1c9Kngfxyxj6DsbLy8lNXVeq6qj197lEkTcAjdZYX1lJ5JTVIwKCh+VsRbJMQNBqeHkAprWZPIvepxenQZCLzECfzqnnB7/yEjDJ+2vYWaii9X14TEYdRC5mSMdZ88sGVu3w71lvqcSUA57j4la8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=eH3bA9BN; arc=fail smtp.client-ip=40.107.22.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEj57FNjrlZjL31UrnYO097gVmnhVjC9K63tzUkkrhAyj7HJ51ZAvWtQxZ63jfCXkW2bXkIc1d/LaJinwcwRJgXHrALfvU7ssH/fdx5JbDvPd/DF+n4wQ98ayZhWlLs+jJTpJqiAGYCnpk5hx/U+OzGKZ6Bd3c9RrVixrHDOjL22vFQjugM910M6ROg6ArQ8yOXaX1NUEErYGvoG/KzDSNPpJNInxuIieAfX+F15z7zHuhymJ03sp3W1SBG9pl6Z6S0YD1W8Umn6AiCoUVJXgrp93XYTAFEkBvzEzuwAFS5V07m4AnPsnvGjE8scV2LMyuXypcOwYUGLHlPbQ0lSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pN6N0TVrLEpSMt01MGTsAcI9jPTC6JhWv2CPo4RXeoY=;
 b=CAmka89R89NE+nEkfV5Ypvo14k7pWCKMEIS3/kp7KuG2rrFHtyJdR7vM1Ca0JTiALgHpiqYsvkT5nOCH7ZE3n3CmsuAPzlIyRLeglOYdiijS1vU4UZhhR2uwwmugdpDNNxeb2/xAJ5VwuOQ81cv6u+6OXnrZzn2jQpeuN9h4mPyRhKu2Uv8zFNEJcPmExsBrRsN9ZNpXhDiAgqSmIjS5hpjqmFMtr3tSjOKkjVbIS2cxxgVC2er0iKd3Yp1cNtuqOhgJ7h1OYpXP+VtGfMHd1vJ8HkkhY0Z7zU1RAe0ACEIx/uwp2q568xIwS1yay9thNFMOvH839ur1FPBoROSkIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pN6N0TVrLEpSMt01MGTsAcI9jPTC6JhWv2CPo4RXeoY=;
 b=eH3bA9BNvOc2IU3O5zmu51J4CyhGuYSQH2fi1UKFA8KkBehk+PUdcZvM/rCWJNqZq3CnmeA1debB0OmdS+AVv7+1hgiJm17z5GCHMfg8JpythvDm5VuyLDODv2sTjRbmUsAJltQhuwJ0j0tReLInB8Z/fYv9dxt1SWZFIhlu5hkxYSS8A+kXSyx9xplwHQDUqXC/+N4TCR/E7sjkOF4BxS58XhkUsqI0tlKt7O7nAcUsi3AV1oBsDKm0Oq8SrifVByWScyuyGqO8GadGTqTnmmn+RXSXHeih9VzUnPH2ChwFrm1wzh/F30qwzYuViPCNg6eHsOVhd74eeo5u0lL4uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AM9PR03MB7266.eurprd03.prod.outlook.com (2603:10a6:20b:261::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 10:15:25 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:15:25 +0000
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
Subject: [PATCH v3 1/6] media: dt-bindings: mt9m114: Add onnn,slew-rate DT-binding
Date: Wed,  5 Mar 2025 11:14:48 +0100
Message-Id: <20250305101453.708270-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305101453.708270-1-mathis.foerst@mt.com>
References: <20250305101453.708270-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::6) To GV1PR03MB10412.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AM9PR03MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 21614152-a131-4484-d91d-08dd5bcea4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l45kGlkzZdpwrpsAPHrEE81cNh1AYjigTJhClMBhQroVH+Zu8yHKIkFL1vlC?=
 =?us-ascii?Q?ZxgVIFEtSyJPmi5Sw4LHMdM+nE2tkZLMx2pvE/2UOVZIbixpsXnVHvR8lBml?=
 =?us-ascii?Q?dMI/Z5HM+BeTx5oNsRW6qnuuPLtHR7cdHvhKi8z9ovomBfPCW354eZ9/bJ9g?=
 =?us-ascii?Q?mPe9B+ePP1QzYZ1duEjSHcfVOSzHDFpDLQ/c/TWswzoFn3+P1sqnAoVOCb01?=
 =?us-ascii?Q?EabNkyR3o/1f/yU5HlTHxuxNmPnbnM9whlwHl2C/ulTi8QXdbzEpV6YHA0en?=
 =?us-ascii?Q?21gV1n6lFJgZeIkW/D9DkmbMQ9+dh0a/x0oEm+PFFI9jyb0p8CANHAEL7pE7?=
 =?us-ascii?Q?exyKkM3u6TUXsIX/tPy7ub0ErcAXxsC0jm5bJLpAP/tdM8X4wsJev/e8o7eG?=
 =?us-ascii?Q?Ahzs+EdKt1ndDd/W+0Z/FTYZt8fajd0xfC0mCRKA76vRtnuNMbjwExUBBprj?=
 =?us-ascii?Q?vrQBt1aaf6qj1o7aryLNRb7+aLreu8eN3RHosUV/DVtBsCjmfLI4fpF0MEjE?=
 =?us-ascii?Q?VfCi2Fa7WTZCZuT4RGhxNV5HV2QrNJZij/SeZhMFRNlJGizUpAlrQ4Q0Hzlj?=
 =?us-ascii?Q?oixL+jk0FLMo5AyxwzsKZksDjV1DNmIssu3YMCr6aPsHNy1E9fmZBGMYqevN?=
 =?us-ascii?Q?KN4Qx8XgGCPgyyE+UyrtC/xIij/NjqB5xydbVnzXZLk6FhlsWULAhOyXu1E0?=
 =?us-ascii?Q?kuuBjf2bWIllTs+sqoQA1fceYGRpLWTgI23UrdcOEzW+Zm53BRCx8ApsEC+t?=
 =?us-ascii?Q?ZqJZVM8xGtQml1aweT+miIQ8xtR/R3ysFEiSmpZVH2qxzH6WOf0HbUb2OTRi?=
 =?us-ascii?Q?929aDlavzvPwTTsET8/LTFut/e9UzPzzlTVD+2MX9oFexVIg9SAAS+Ftwx5l?=
 =?us-ascii?Q?+d3shV75ZWQpxZD83yJSKXW/Ll1nMbMF5EFBh6vbS9hfMOXmpeHB+EA1ztod?=
 =?us-ascii?Q?ryBnAs/f6uoyTYh0/QzfAcHobIbxJTyhcQp+VElUgJ+xvaPgpgZ9HJQDVHva?=
 =?us-ascii?Q?DmTx3lRd1qeiJLBbruZBEfuxcKKU7RJ+OOHaVJT9i/p1Uwi29Unz2UNlBMm4?=
 =?us-ascii?Q?ItYmP21O+LEn2HK6f/IovV2horhv1CmO8BQV1I+LLyIIBqxouIKtTFxryTNQ?=
 =?us-ascii?Q?ZdXa5sX+NOxv5OY9tKGAQu2u0qmSCO6tZI9ISigH7j4apn3YHhh4J0Kqteq3?=
 =?us-ascii?Q?Q7gJu4hKPi93MjXiRgB+fxDeSPxLUXKw9X7PRMBmnQdIpWdSN8xD03kJkVcP?=
 =?us-ascii?Q?TrinWU8JsKLh2q4yWTPCU1dLnsdSOCm30hH70V/Q/+K49O6+Lmk4GvY7DGFF?=
 =?us-ascii?Q?t9g4ybbTzaY2V736Hv0KW5/R+J7tsS7oGLgAxMz/IEfjRQ8pb2oCwm07qlB8?=
 =?us-ascii?Q?sCczIHpwIMEmytAVMPymAuDwxpHHtlKqHDCkj0bxFNh4YMChvphbcvb2mKGs?=
 =?us-ascii?Q?TkZPNO50gyJTnQ+wV6XKi2+Hy6v5EMd/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yDahtqhnhOBvRv2Io4kWQdciD14AIbTIpSqkG7qzFfdFpqELRMh7B65YK1P3?=
 =?us-ascii?Q?Wj6/qqqtPOnrG57iTneAHYOskfCu8/Koz+nYUcj7pd0mdJN67XUMcHeMjWHM?=
 =?us-ascii?Q?SjMtUio2SEWVC4wOAlZ/1Qg/agQ4hoZHQ8D/WpglCpMLVbvLmkFxqEI31Ucg?=
 =?us-ascii?Q?mWEhmigFGSJZ36UWnElfbGMfUleLuE4URbwNflowWE4mXVTFOYEAfeUqTanI?=
 =?us-ascii?Q?cdCqnoCBfIaCHeVnbcYYro3HmW4bB7Iyf5lTaYa6p5Rt2Fe38EwCi82mXjE5?=
 =?us-ascii?Q?VSRok/5YXC+gANJYUbL0AI4DSXGsTyna2y6xqCdh3ifbu/FgQlDmwvaX0qZf?=
 =?us-ascii?Q?KAacHm7bMDeimIs0wSFGOPK7nakCjLoK505VqAtIbKyRhF6gIKHtPtkGpWer?=
 =?us-ascii?Q?B2gHNZLuqfsf6+yMcP6OWzcKHtFspkEN/9nDyKndQiTuErDIIEP70Ry8hHV8?=
 =?us-ascii?Q?VebOXp8TWQmZYjVWBHCsgMidm/LIjrbCpN77RDd+k7WvE6hnGXjkPXO+qBl4?=
 =?us-ascii?Q?fbjT6uX/sF7AIZRs7MmGYBPpLKecRAdZNc7drqYwuTUOEywkjgJL52UPJEeW?=
 =?us-ascii?Q?TZj5c9ReuRqRcG2jbPboGjIsnj1tbPCu2a61iG3wBZtV7QilLTXifb3m9UEc?=
 =?us-ascii?Q?eorh3T8URnNngFHu86JMTp26ZTbAMXJYgc/vSkn+QC3Mq8/IGYvrR8sqWnL7?=
 =?us-ascii?Q?Q622y+NgMYgDiPBAKWZkSiB3+mkxy9TS/VRj5MQd3L4L+Cf+nUGq1UYDWLed?=
 =?us-ascii?Q?RsIsjpeSTt4sU7O3iLTX+BA9B7wtt6saEN42G9HupNYTQMXIMJUTKfpNO0Mq?=
 =?us-ascii?Q?ZcApgowo3d6xCVnnnBCgzuufx0b286ppGhQp6/l2093Wqw5GtQpLhZtuxlHB?=
 =?us-ascii?Q?btA0MSRv6jSsoLJR4DsBqeE5Y20GS9pVG2RPcvw3GrTUJww53FQ3esFr98GW?=
 =?us-ascii?Q?FmQbP28hjslK0bVjmT8e4uv2ZitLtCbbgqZWNjU8UVB2EOs/fy7N5VKx6F7k?=
 =?us-ascii?Q?EOprB+jQE5YaDVW6/mgxDOJdjWxdureVzi5WKkA0ZqElnNIdRFSF0S6KfXqf?=
 =?us-ascii?Q?3/Ti2iEj0I1di//RM/MGF901S1TrSSUJKgvD5qUvTbz3aS7X45vETtowMH86?=
 =?us-ascii?Q?OewhJvPwANbST+imGLT7M1l7RigqVG1U0Q3lEU+lsxVBVMHuy4xZvZUJ3Rz4?=
 =?us-ascii?Q?Sora4Lm0meVQ1nNwWeRtXfu9WiLh2qttpnA78BUOoFBXHDqBriCULMBpY432?=
 =?us-ascii?Q?4H0nKwKb8PYENm055w0KYZ4X5AAvC3oPUNSQt2lmeoNKfUN5YfoAm9PQXqO2?=
 =?us-ascii?Q?Ny7f5SDAMQxRKPEzyrTklg1drITH6BGoeLXfp2Rd3y2REFNklLSzhQs/PiG7?=
 =?us-ascii?Q?gInaHis9Vy6M7bCjwteuG+cHEvdncMmdadKXxbvFHhYx8FLoKF1e9/BF3CCS?=
 =?us-ascii?Q?AlCZGF/zxFePqD7cdrzA4HGrrJZU+t6FygHYYKyac42XDqUw7DQlplf7KI2A?=
 =?us-ascii?Q?C/g3bn74bHf1gafWbvEa8RG6otCwtr1osGydPeXLhEeUfwMMSAyySnRTnEcn?=
 =?us-ascii?Q?PAYNLWgaaLvBWYh4ozHs1Bp0gTwBd0P/XB87md2X?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21614152-a131-4484-d91d-08dd5bcea4cf
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:15:25.4209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMMvO3AKw4mTqlAWK0axZn2sEJUsSRnUd6/n1s3miu5l3JajFcYQ9EefSxtQwY5Y2qOlVp2pqrSDlCb92SpwGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7266

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Add the 'onnn,slew-rate' property to the MT9M114 DT-bindings for selecting
the desired slew rate.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index f6b87892068a..c184bc04b743 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -70,6 +70,15 @@ properties:
           - bus-type
           - link-frequencies
 
+  onnn,slew-rate:
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


