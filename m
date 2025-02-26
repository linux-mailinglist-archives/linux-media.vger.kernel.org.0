Return-Path: <linux-media+bounces-27078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD370A46548
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C4B51625B6
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D78220699;
	Wed, 26 Feb 2025 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="c3Ni+pha"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E378E21D595;
	Wed, 26 Feb 2025 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584403; cv=fail; b=GgUalfhMbcmJURhc5IxcX/O1rjbLOnpbWAlnW9Z2XoyUrOjZQr317cK61yx6opP6CsVakbHWGf8JNsVBsAOmRjugeUrGyiMc3r6hMZu615TItikM6VcCXL64iEl+sXbJpfkrlUkeamK+UnzsWoBhH6Ft8wOM1KqNQFLPHRmjXX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584403; c=relaxed/simple;
	bh=SLNnFY1cvgG6zHSSankSBXZkOFp0CmR4Rji7LEtTK3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oo6ivgUZY0sSZcHNOkYV1I+lhe7usnD+EBM4KHmN7i0ztT9VFTMQ5PG9qcJyIMPNTx80vXkA9j0wN3N9iIdPa7Nj/6/MtJ/reMWduFn1vAInFXrx5DxwYmBZ7yOzSR6EJ/wSIWnGxE96XXKtLMDKiJ0jbZ2Vnpw0JYL2aEj/dPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=c3Ni+pha; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzD6bpOd5NTQktrQ8aEyMFH3aE1D55IUufGGLXLCO8HuVWqhqSSIn3dYQOGwWG76ZAVHp/1sDonGdG4p6dnDCZlKWbqBVDhqOexAbPe/SBxmL6bDvT9Bzmo0PS2YULhVcwYHApjcCtpXHfKUjDS3dpyK2h3AQj041wTKPliueE918a6+3IsZjR7ePplbq/14VKuaWgNC4jlbMdmZjGLGFR5EkCf3ulQEn6Aph5NjK2KaPqNLSuy7MjZGiEZ+J2yQRsaG6mk/vvrBVCdSHLm1YTjIRoNRry4Z/6IEKV2TCvRoDgfcnrgO53+rSFjkIZ6cDczu5fiCRgGDcLBNBsdcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJV5qNo0OEeNMCiuHLR1seQuXC2SEuiSMcFP86UIO+g=;
 b=A3p0LwnpuE7+zEqzjiZFekWnOnoLTziSYSmdrGjeuXmaz4McgUm1EIGJcTCgWrhBjDb8WxTwlmf7yV3ntqxhUHPSoCJJdEeKwSZpDImh8PO5GV/rOIZDFeVmISbfD5kwHgijBW4QCu5dlMV2GDCDNdIy5mRVGGgPrC2/oKHPmELJ8WNGb1EH1NXZvvavVfFnqelIqZqCIQ1c8JbBLZj9qibV/uiO/xnGIv1wbW3lSt+kiF8pDYHO4I4Z86KzMcFhbFbHlap5Tw1HnM9jPISK0GPilB7LFz3HLJmLZNV+W8+V1iSLYFDLs8CORT4Otcf0IFtReXmGBNZh/L06TOooZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJV5qNo0OEeNMCiuHLR1seQuXC2SEuiSMcFP86UIO+g=;
 b=c3Ni+pha1wRrH9TxTMqmGGeuvlZK4dkU1ueBK5Rb59U8raptBMz9j77ZfZMiSkgrAnMpeHh0tFjZlQWUcxx7RfRv6IdF9GI47CvHdbihOA5S+aHI+OCtF8jRBGyxl2pSKE56oN4XaNpA74KS/97CZxFM6n9dSUJ1diuVH0bi3ikzgSqR6/sWIHY8zx8yag8SsiH08zAzUEHJEtmJQVS6sZevDgmoC+/D2eEdYLu28xIcnjLZ5aL/XtJQaqsY8j6sYr4ylCBTOIsLtqx+UX3olvSIsvWBh2mc9KVWluw4lK20e/EepcmHq9hbARn//xx1VypZS7pXuG19My4SVrkF+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by GV2PR03MB8559.eurprd03.prod.outlook.com (2603:10a6:150:af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 15:39:57 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:39:57 +0000
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
	manuel.traut@mt.com
Subject: [PATCH v1 1/8] MT9M114: Add bypass-pll DT-binding
Date: Wed, 26 Feb 2025 16:39:22 +0100
Message-Id: <20250226153929.274562-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226153929.274562-1-mathis.foerst@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0062.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::13) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|GV2PR03MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 054a17f1-3d4a-4507-1294-08dd567bd2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uwjNDd7SxT0s8WN52qtUeGKyA70OKbv2xhErC50SC/i9ruHvUrr4rRutefKS?=
 =?us-ascii?Q?cW1jyYZwtS530WFB3D/hMLL4NyQWHNLaJrCsoRMRkG8ALplpNQpcN93OdbQS?=
 =?us-ascii?Q?nGcLflN1seiHL8STdQfenw1JRTbPm01RA2AeSFq2SjA/3qJ0b95i3vGx+DgU?=
 =?us-ascii?Q?C5Hv0G3DajB+NqG5WPmN+K4NeoiqY63+dW9URwYZ3OyaYkVQ4nXjAA/+QC4i?=
 =?us-ascii?Q?v98LJ3OfpsyR/LQJGm2rW8k/mLylB+zpPkCwTb3mVtLMpQwP07uK5OPGK42Z?=
 =?us-ascii?Q?VOQwsJ3VDVxybuBuodRPxzbAbgKojyQihRX63bw9F1jLzgYHNohBrGzl8rkj?=
 =?us-ascii?Q?mC8+q1/QCQUpqgD7gSLjMWV5QGe3v2+dBh4Xn8oMm3lRuovIGoi3HOoOzJTZ?=
 =?us-ascii?Q?mZrMedzf20SHefuQMUTLgg6TunYQmwI3spl5e1UHFhQcLkipD9GKhstZeZmy?=
 =?us-ascii?Q?rwSSfYIPF/z7x7aFe3snLrlWpXdAWVbWB7jNkvaXG6bf/qILAYvi1CEEXCd/?=
 =?us-ascii?Q?oelQO7B+EYMV3LNOYC8UTRJPaGgw9EUsN8rQRB67H5IasDCPsjpUNQxZ+dl7?=
 =?us-ascii?Q?dMusUxeisvlJtqCF/ff6dbPIlwHltqDlxVcWmDQFXw+dusjz5B0W+26DerAo?=
 =?us-ascii?Q?Yq+Xz9/P47NPxsruDLoN1MQRrbRC69NoHDOpu7kFvg8fbg6vJYoRM8GaRdIM?=
 =?us-ascii?Q?wjgXsDmtW1SQlNVQ57JXoPQUWgldjk8IMIPPU+EOeWXe+GmcLhJY7coKin7T?=
 =?us-ascii?Q?ftN61in6NZ7KbCXyF4X+/8SO8mbHwnX7QeST66VoZMSBUPhsEKUUxywmjZUW?=
 =?us-ascii?Q?uhOkeTwRfhiWqXGt5j6rSgT71ICbp373sSVR8DyIkS3JiFENp7DBmyKngX4/?=
 =?us-ascii?Q?DO0w5ecYsr16gLwcU0hkmQrUCtCT0i3rV1cXwLy4zMYWx6jE0H2K7Dan9oKp?=
 =?us-ascii?Q?YZjxshVfFIGNRQJOcT/cePpUydTOaP7cDouPc7QrASlPbO6Nn8Tm1LI2VM2c?=
 =?us-ascii?Q?Seim2sS/CI+lc+ibZ77Dy3LZ1kr9QoWavGxmzpDGzyjVbDkHiFMOIG6NTuhD?=
 =?us-ascii?Q?dUh2zmz8W510egdaW3c/eJov11KATHSiwkfGif377vjYo012JXXEWM/tvnaY?=
 =?us-ascii?Q?0laNbWs4BBEqoNJDgWO9h/OaOfWXRCJIT3tqqgYP76NQQfKXpcJBG3PwL+GI?=
 =?us-ascii?Q?eugcdHuljpd4ta4GZQr/uaHTn9ErHKz4/2DSM/nFrDXPqb6h5eauYuxQo8IM?=
 =?us-ascii?Q?OJvuWiDtJ9NQdhgxZ6tVPrqTb7x0eFRnqJk1zVvOYw/+zXC2SCrkL4YwfJEk?=
 =?us-ascii?Q?NgCgzXlE+PbwvMi1KxSYoYpf4zLa71vKvY/byFpQKQgURpb7YWjaOfriE2wr?=
 =?us-ascii?Q?jylMpKPv5/l9KUFH1tg4xZ7yCk6nj6hEWP5jRmx6cYMkNzgVuebjVljpPHLC?=
 =?us-ascii?Q?IGgri7ZvQtfvEUxKt2rbpHyGRgH206Du?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?duR9wYTkHrVw6JNBTCpvS6TT1Al2MUlrt0rPYiWwkJXZ/8KWRrF7KJsn28/N?=
 =?us-ascii?Q?XxFTFLaxxlFPUFWdqV2PlSpgYvvinKS3svcXmZg++V+U97HAb8oOv6zZq2eE?=
 =?us-ascii?Q?gYGipkXN1Kx6WoMhFcZhoUYLaYokb4g7Cb0SItspzKXkE0x5VYw7gLWeCpxA?=
 =?us-ascii?Q?B6XaZW/RDn0H9GhNFFrwtnci/Rx3wm231oZPUOdbXsArV3g+8fsCpntOqtjG?=
 =?us-ascii?Q?9wRx1kRDJ/XwewKTqj4pgWJiMhwixg0Wm5FrTgYMcPbUT7oqmyqLLqyVgrbo?=
 =?us-ascii?Q?VKK2cdz4YETQ5rlaL7bMqF34VGP/wTZmUDG0iBMkFyjgzJ3zcfPr4m7I6n/k?=
 =?us-ascii?Q?9a6VzdA03E3K75eSkx5xC18icth4MEJJzGUFpZmPsL2zm8rgHvrwBhP5wMee?=
 =?us-ascii?Q?YVmMj5/+Ye0ZH1cGSzF65dhxAHNbyvBXI713lsv5SfcJWOwUJIhkWNh7fItl?=
 =?us-ascii?Q?0WGS2Em6TrxUZthsQDsO+Uc3MXloA8geTNRW+7BuQoxgVfuMKseEcTFWA2OV?=
 =?us-ascii?Q?+dfoRpt2v2mvAODtKKE674krTvoAC8dVH3Ld+tfsHcc0qxAP22h3b5fYo7Qp?=
 =?us-ascii?Q?AkSdfTPYciCsrOQfTe4KEf+E1pyjRCutYc13+1B2DquurFOqLTMO8L6EQmYH?=
 =?us-ascii?Q?hw81LrFqksL/55b5WiwGG2HqRcgfWA2jJwbR1ij9mX7QYjX/Lb6wPfZK83FZ?=
 =?us-ascii?Q?tpPRJ7KWWyMmykGadJ/5VM0an2CzpqsUn+b/iuxoW66DX43EmVH7sY46ntA9?=
 =?us-ascii?Q?6VFsmdhEf27LHjEenWkY5zDp/gQCBAptWvXNqeFd4g5iariNQBszW9xVaJI1?=
 =?us-ascii?Q?5y6CpyAjzJq7/NnUL1iZMesLXrH7yt9kSvXTwF2atdGhrzrV8gfInwXt0Czi?=
 =?us-ascii?Q?eIFc2CU5oNTFYei15Qe8M00bymTL0IvNcmBfdMhTHKq/1OpgbMVtAcuJupVA?=
 =?us-ascii?Q?NV3jCkK6ZFy4SmSMt9ia8OtKSsQGuxSMudZRvIo0jvuloDokpYNw7CaqUUxU?=
 =?us-ascii?Q?Zxw00V4OVL+E6vyM1U6bA8ONPgAe3tzF9hs82OlE/MXPf+HVJWWkDEFVSVcd?=
 =?us-ascii?Q?1xexxv41ubsIkX0iYYUCjTUCJL69weQOTBgU9OHVexZGFntHUjB9Vcq5Czo/?=
 =?us-ascii?Q?DujdwoWGKj2OOsuFTqak3z1Gi3ilXuQInBDwOdtujeiurIdWER/BInKK2jDL?=
 =?us-ascii?Q?D/O3PT4+8vn9b18gCe4La/16GQXRuWyunY3a3ldZDgLliQMdD2aXwn5GA/kP?=
 =?us-ascii?Q?ufG9Gj3uu65msKMV6D6WLVVUCIT1vlE2pYY+3fIbelMuR1LhF8IGPN/jfQNw?=
 =?us-ascii?Q?WIyGAxFvJ6oyqf0c5Tdn1sU3mNFWRw4kxnxhnppUE2BSb5fbiTJdIdsjbAHa?=
 =?us-ascii?Q?HECj1h0p94dph2yMknPm5bao9UYcT834HgjVtlgXKOi4L6/0JHi4A01job/K?=
 =?us-ascii?Q?i/k4FYv6VXx/ywor2N1mO5lImLj1mDQuMpkBC0vJBtrHrX+dmLPqBB87g6dQ?=
 =?us-ascii?Q?fC0vYzpw5VGlZLPf4OHjt1jjIeQl0aT13Dtf/IrXCojp5s/8XTiIGWDGag1d?=
 =?us-ascii?Q?Yg/gFN1D4LZv6JEX4LVQkKE3TQQL/87bIvMzb4NTXbMszV4RQslrY0i3D/gV?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054a17f1-3d4a-4507-1294-08dd567bd2eb
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:39:57.7638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlNaU7+DPWUqqKbmeX2lIBjxLRcE/YlaeIQZt+sBRAv9c6A7GcjD9xw+YaVge2RCGTtXsnwPZ8QzCgpG/NvNmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8559

The MT9M114 sensor has an internal PLL that generates the required SYSCLK
from EXTCLK. It also has the option to bypass the PLL and use EXTCLK
directly as SYSCLK.
The current driver implementation uses a hardcoded PLL configuration that
requires a specific EXTCLK frequency. Depending on the available clocks,
it can be desirable to use a different PLL configuration or to bypass it.

Add the 'bypass-pll' property to the MT9M114 DT-bindings to allow selecting
the PLL bypass mode.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index f6b87892068a..72e258d57186 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -70,6 +70,10 @@ properties:
           - bus-type
           - link-frequencies
 
+  onnn,bypass-pll:
+    description: Bypass the internal PLL of the sensor to use EXTCLK directly as SYSCLK.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.34.1


