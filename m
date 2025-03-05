Return-Path: <linux-media+bounces-27579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77609A4FB8F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83E313A5CB7
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A422C208976;
	Wed,  5 Mar 2025 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="vBQH6kUU"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A0B2080FE;
	Wed,  5 Mar 2025 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169739; cv=fail; b=uGb87Gi9b/y5kuAX6evdTZkDuwecjap+0n97s/RqjH+WWK3f00mGD4/bEwBk9qgZCkW4wrtzXVaSURVPkwZeH2r8lUyilFj0b2X0n+9MZQDI8SZ480wkQhzZKMs4R/hkhMKmKp0E6u+KbWg2He17TpYJH7t380oa07opCCX3vuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169739; c=relaxed/simple;
	bh=eq7Q4aJV05QZeGiCA9lw2R3WcUgK+6v+jlAXbR9Sqok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JCrW4QIk5nhLYhX1ooDIwY+VdT/ZxxJuep63thHdc+qOW1JtOcKS9/QKhtLx9j+hs/7IuUS0uIbVO2LDqj7B/OcGmIwjVmy7K8JiAWBDkFX7MxO9qqOLOz6P68iaXSVuYw4JUTUHYNjy3wxE06MQCZI5cw7JYq0daHVaLWrdvLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=vBQH6kUU; arc=fail smtp.client-ip=40.107.20.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBvuhDgpcRvpHInGkocxzNcYtMs+BcHbbTRBhHfTBMGKoEHauSHx1jpmLRCOAd0nLOlLrIKLzDRgrP8G+ycwFaZdyj4GAeZlWAm0GVPrJVQSY9b7NBs91OtJvPt/AdAra/4sxH1OJrS2ATLq54B5lMzR2WgowxPzI96XT+LjOz1p78+JXoH+rakVnKvN2Z29DnjZYB5XpYDnJTEube9HUfb819/nDUOHlX8e7kft8lNqTzzA4Xpd6xMk08xVlKLjGXg9GQUmGvvaDuRw7qudJf0P946cARpvThymSpPfVh/wxuIUV1aPuz86wAobdPznhTwlKuLJFX5gpEgcyDy5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGBvNUWZ91E0pic82G7UQENf0CY9D0CMSPsW7JiWduo=;
 b=ngy/dqrmOIC2xD5JZYA5w91Y5KM8oOn2RCQxXwOvzdTxg8L80mfw399f9vfGEHbFKBtxGSiA0VigXDHRbClPJUJg77te+a6xg+Z2wAmsfbffRywX2xDDISKVbIWcmYSRo21FtS50hs/hxntSoRb1z3qIw0GR0A3EuD1+6DBWvtLbSzaZRdRleAwCJY0N5ThUTalVKqxcKix4vnz5DRT57UqFjtGMBY/97KEoiq4eYYMk7j7BtW78WqGIB/G1PEQqwjebOi6gCZwO08vDDZ9xI4gWxp/IFeAWzJvxqssma4wR6ueDpyLJiZCHKEMnsOoas9rxINiqZbyH2j9qHAwBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGBvNUWZ91E0pic82G7UQENf0CY9D0CMSPsW7JiWduo=;
 b=vBQH6kUU/Ey1npXS41TliJYvW7ce9nbz3LnFd/sIQejpHH4+vOGdXXwq/d+oEoXVvtaP7htOufQhSSRwozPynI9QGHGSGLSqRsUQBPhuNaxHu+H6y8lcLLcaNzcSH29yu3L0PkWANkYklROGd6nm00SYoyN0LzRTJrpAidR5cnlt18BkxLqCKHO7yZ3rLqAHh2nKUIXKvNrQ19fLdK6aLpbmhDlwOtbzI2GzD8HjAZ7P5F1L8mvtonkjR1eiz5KBRQJv8AvwY2zVeuXqxAVgT13rctyEGekvHK3JWY+wvbPzH+wMh+ZtQhu23++oaImPtXOlE+aeYLIxZ5BEcsq72g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AM9PR03MB7266.eurprd03.prod.outlook.com (2603:10a6:20b:261::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 10:15:33 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:15:33 +0000
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
Subject: [PATCH v3 2/6] media: mt9m114: Bypass PLL if required
Date: Wed,  5 Mar 2025 11:14:49 +0100
Message-Id: <20250305101453.708270-3-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305101453.708270-1-mathis.foerst@mt.com>
References: <20250305101453.708270-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0158.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::17) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AM9PR03MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: d23d5a42-67b8-4b38-6a85-08dd5bceaa60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qlUk7F29cxVJB8ZLAc2kM7ffZjvsffdxUSYNGBOSRRKDQwukTgu9Zlm1DJme?=
 =?us-ascii?Q?8DIorFFgMSYJUOuuNj72qHcIVAOTCYjpOZ+sxVL4WEaXbneYCipbdq+Tjc/e?=
 =?us-ascii?Q?7T/MGWW1x2lzLNneBDS/aWmCzdEE223MGVm+PSoN1K0havLWayRX0haivqAc?=
 =?us-ascii?Q?TuGv4yzCTE0Q9InT6bAsCPdhXMI8i8+EKGQCMCB3yxnnWBNkfjmRxLWQ135I?=
 =?us-ascii?Q?TxuRpKJ3oTH7lSs6wfsBOWQ6j3ww7yrlkQmTkv70MZcmz8RonnjFHoU02pws?=
 =?us-ascii?Q?tpf0Cn6xY6yQ4d78mwN/9jyUUCq5ji4QNCRAbn7BF0i8Z9Hxedib+Blm5KVq?=
 =?us-ascii?Q?uFhUNSm5EcjTiml3l9YLOkaQMacoptOd7W3Pr5NEjvublZzznHUqe7IxGtdx?=
 =?us-ascii?Q?j97PUb+obEtx0VVP5mrt3ONa3IoAmcZSe4eklrVJXBiDERWXsJaQXk8y1T+E?=
 =?us-ascii?Q?o+b8hOBkPI3Cxn4ppFVcRhVowwsiDa6rIKBczYiFLBVZkDZ4cHDbvOQVlMQK?=
 =?us-ascii?Q?6HNrW36Gox0Cd7Qydvg2obaCSAL5kZ7bKHC/tp7dDNNe8Dmtjp0WeH3TkZtI?=
 =?us-ascii?Q?lSh9HSPNoYEuvLHNeENdtiJ99P8x6lfksPKICeiqYFG0RpMHnZ1HLkJB8r1N?=
 =?us-ascii?Q?osCKQb1vftvDRta6cTtNDU/3r65/qTgihXM+H0IFaP8D+3deK6CwVQLhsykf?=
 =?us-ascii?Q?YMpsLvIr3m1FfvD09s8QeIsHqyyWQkeDNaU5thniMyL0ACi0CVUFk9/xqe7J?=
 =?us-ascii?Q?vO+PzzIu55PNUlLLcJiGd0pO0bdczzTwmZ2/tgltHuyDbUZqeSRFyM6c40iS?=
 =?us-ascii?Q?Lf1u+ve2/WvgTSbuXJ5o2yaWDHpm2PBEGK3SVu7pwst8CPNRzpxW86S5ikGX?=
 =?us-ascii?Q?HHvajuRr0P9QKDvhne5v7IXT0RLGsbO/fW+h4u7AGb2KO5TfkpnlD1pZaDxj?=
 =?us-ascii?Q?u2iRoCRE/MpB3hqURP3CDflk8+s+nw1jbCz1TsL8ab14xnA6audnu1YUuSpc?=
 =?us-ascii?Q?tsMS571EdyLgmPRFq8CgnjXcvTIPQc20uhJlRsp+unHmWZ6jSAnN9iyT5k2b?=
 =?us-ascii?Q?r7n9LoEQF0CNqgoPWMVtWT6zIJMuwL/XFE4HmF3BfkZyGTI48NTDOaBiM/+X?=
 =?us-ascii?Q?NObcNk6Qb/f1YcM8nS2anYQYpBuW4CiMgmPen68raUhpiYbwxGcKjgVJMRfW?=
 =?us-ascii?Q?RcP5Cw2oIotBhbNRPq1IeqL39IVPJestvZs794H+6IYA/9OGPOg1tvs5Zi1l?=
 =?us-ascii?Q?/lZQTvkFd3JjTgSRPxiTM+U3xDFQTQaGUNm2gmPMWvx8YYAzuUz3shmQlqQw?=
 =?us-ascii?Q?jRPwlLHrffLaeN9NC80h/757sbBfOz+lQpGkZH+eESUoGehomjf089TlOkWv?=
 =?us-ascii?Q?VBprksJuVSDrjrnU9i1/PxxAyFg3t47B3fQIVlxfIFJ/E20YF/85fDGgGyGO?=
 =?us-ascii?Q?IGtB/tLV564BwJmxWCeeULzoIiQHSZcz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fMLICkrMetG+ZvkRDkdeFxpAU3EfUdH9P+uGKU3FAYVHFSqXT72CLvKxFe9n?=
 =?us-ascii?Q?cFz5jkiSvuSmVioGM7QBuE29aUJVHzW0nC6Jdq14U98Oq4wZrgqCmseYldSH?=
 =?us-ascii?Q?3aIvpz9n9qdgCiSh7LEXXFhCF+X0BFrGjo+RdbcKaDwfp6edBa6yVwQTB2Yz?=
 =?us-ascii?Q?IUdulrKBV05VxdvcIiaiGstSoqJ1AoQ66brKxS02ncJ8E7sXVIdla7uGb+yK?=
 =?us-ascii?Q?lbKEFPLbaYTg2OaBs8mWGqNJ0aGyPkx3QaRY3F4ImPcrdMEymZ+NbT2ngpOJ?=
 =?us-ascii?Q?U1fa0T+0xuwDCyKG8etLv1y8/aXWA3JX5HLy4TlG4HiRDaqAujYkjpUmKFoa?=
 =?us-ascii?Q?v7fNx3BvWP1D9i4uTtguem2hiuKbwcbxeIom78pMDtCk5vprpa/aUl0L+lZS?=
 =?us-ascii?Q?lCgE+VYttnTjGUsI+ksbUAsx+G5huZlhRzuhQ5DChu9gMBVjEqPLUoqZg7Gg?=
 =?us-ascii?Q?67a3WZ2WgFcKT++wlG6DOkNHhCs78sMiI+Rq48E2w/D80nSA4Y57P4x1EarP?=
 =?us-ascii?Q?2rlDp4b3I9sm1zuWEQpNFaoRZKvaHO6elyAFwSnJ+NdrdRkfvd3GJFHXoY6g?=
 =?us-ascii?Q?xAoaIykG9DV5E4MfnNeRhYsayaxBFPwwDrtJTbjRXcAvIhf+GvMfhPVJV0RI?=
 =?us-ascii?Q?A9Nj299MfiTuh8g6YxUDpzEquttw6UgPEEgqdJPfj8Q9zVuzftUOXORLdFqZ?=
 =?us-ascii?Q?aRjuxq6/I7yYA+wl00fsNSxR7FaAG20ky2OM7Oi8J4iQZo6qpWLRT20SRjJU?=
 =?us-ascii?Q?pY1EAK3shWEy89fhR1T6/B2m5PwZA6ytFCbYd21dmyiPV3ZXOaGWkymfWVo4?=
 =?us-ascii?Q?tUA4gENtjpbqC51+czCID1qHpT7FYpAqyZCBfLscvhpKihT8XK0/WmP/2xBB?=
 =?us-ascii?Q?AXKJJmqkU5hmdIRuwaxqr5g4+NEEC9BzfG5MNjdTvq603wcFAsFcUm144lQn?=
 =?us-ascii?Q?sqBUMEgQ18W5O7XRzP1T67MaDeNeO+T2oJ/dcQPT+NdYNHJspqpxfuIaD2/I?=
 =?us-ascii?Q?aU2WW4V4dWNzmyEXsoNjUnAX77aypAN/SayRY+wkXF6JGKYF12LFWh28DNX1?=
 =?us-ascii?Q?+X2QYivysSdIx0Io1NDrDFwayofP5yxWu/kkRMBmLPO/MtBpaLRe+9JK+pVR?=
 =?us-ascii?Q?ou2yJH19LUOIWmbraTa5CVFWVtTuI+H1uq0PNnhmwInH8X0Ulb/Cpaokqk7L?=
 =?us-ascii?Q?6Tu7RQLdeF/GzXTbtUiM9Ny5LJt82z7MVp7+om7lPONWx9JI6c+/huSoLdti?=
 =?us-ascii?Q?nGXBDI2vXoiNqzlJyk4Y9r+7OGofIyogm5aSRSmAFrnLKaN+cDNCV+9OfBfB?=
 =?us-ascii?Q?yDvcYAs1sbBJ7NhQ1HRMHxxFUEdukMckTPWmDEzJua4kV16jMZeMlwKKnfk1?=
 =?us-ascii?Q?x/eZE1gpXQtNkvhI/GyMhgEyCR9rxw9zO62vnUfA60h7PH8oXO3l6G/SrSwW?=
 =?us-ascii?Q?pPUvbBC+3uuVWxWLyMmQj6gPxs7wP191EXy01BVwaz8P39AlahbeOb+6eIrJ?=
 =?us-ascii?Q?mYMRbFM9IJQ+HItu5pObMUc195RlCCDMZsTp7D96wtlEnllRCmcpayyRxoQS?=
 =?us-ascii?Q?sY0UCFjQLwNRnyUNLhL4b5Bx5KJCjCVZnqmIARy7?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23d5a42-67b8-4b38-6a85-08dd5bceaa60
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:15:33.7772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I24Xz1yVPFKTN6dyfMOgrQfLiI8sgTcux8cp2L991Ekns3+kg8k76+jZWNqCRNahjBOnn33YVYNbKSETKpAvqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7266

The MT9M114 sensor has an internal PLL that generates the required SYSCLK
from EXTCLK. It also has the option to bypass the PLL and use EXTCLK
directly as SYSCLK.
The current driver implementation uses a hardcoded PLL configuration that
requires a specific EXTCLK frequency. Depending on the available clocks,
it can be desirable to use a different PLL configuration or to bypass it.

The link-frequency of the output bus (Parallel or MIPI-CSI) is configured
in the device tree.

Check if EXTCLK can be used as SYSCLK to achieve this link-frequency. If
yes, bypass the PLL.
Otherwise, (as before) check if EXTCLK and the default PLL configuration
provide the required SYSCLK to achieve the link-frequency. If yes, use the
PLL. If no, throw an error.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 62 ++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5f0b0ad8f885..b06003b69f6f 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -261,6 +261,7 @@
 #define MT9M114_CAM_PGA_PGA_CONTROL			CCI_REG16(0xc95e)
 #define MT9M114_CAM_SYSCTL_PLL_ENABLE			CCI_REG8(0xc97e)
 #define MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE			BIT(0)
+#define MT9M114_CAM_SYSCTL_PLL_DISABLE_VALUE			0x00
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N		CCI_REG16(0xc980)
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		(((n) << 8) | (m))
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P		CCI_REG16(0xc982)
@@ -377,6 +378,7 @@ struct mt9m114 {
 	struct gpio_desc *reset;
 	struct regulator_bulk_data supplies[3];
 	struct v4l2_fwnode_endpoint bus_cfg;
+	bool bypass_pll;
 
 	struct {
 		unsigned int m;
@@ -743,14 +745,20 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	}
 
 	/* Configure the PLL. */
-	cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_ENABLE,
-		  MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE, &ret);
-	cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N,
-		  MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(sensor->pll.m,
-						       sensor->pll.n),
-		  &ret);
-	cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
-		  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p), &ret);
+	if (sensor->bypass_pll) {
+		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_ENABLE,
+			  MT9M114_CAM_SYSCTL_PLL_DISABLE_VALUE, &ret);
+	} else {
+		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_ENABLE,
+			  MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE, &ret);
+		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N,
+			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(sensor->pll.m,
+							       sensor->pll.n),
+			  &ret);
+		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
+			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p),
+			  &ret);
+	}
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_PIXCLK,
 		  sensor->pixrate, &ret);
 
@@ -2235,9 +2243,19 @@ static const struct dev_pm_ops mt9m114_pm_ops = {
  * Probe & Remove
  */
 
+static int mt9m114_verify_link_frequency(struct mt9m114 *sensor)
+{
+	unsigned int link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
+				? sensor->pixrate * 8 : sensor->pixrate * 2;
+	if (sensor->bus_cfg.nr_of_link_frequencies != 1 ||
+	    sensor->bus_cfg.link_frequencies[0] != link_freq)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int mt9m114_clk_init(struct mt9m114 *sensor)
 {
-	unsigned int link_freq;
 
 	/* Hardcode the PLL multiplier and dividers to default settings. */
 	sensor->pll.m = 32;
@@ -2249,19 +2267,27 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
 	 * for 16-bit per pixel, transmitted in DDR over a single lane. For
 	 * parallel mode, the sensor ouputs one pixel in two PIXCLK cycles.
 	 */
-	sensor->pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
-			/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
 
-	link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
-		  ? sensor->pixrate * 8 : sensor->pixrate * 2;
+	/*
+	 * Check if EXTCLK fits the configured link frequency. Bypass the PLL
+	 * in this case.
+	 */
+	sensor->pixrate = clk_get_rate(sensor->clk) / 2;
+	if (mt9m114_verify_link_frequency(sensor) == 0) {
+		sensor->bypass_pll = true;
+		return 0;
+	}
 
-	if (sensor->bus_cfg.nr_of_link_frequencies != 1 ||
-	    sensor->bus_cfg.link_frequencies[0] != link_freq) {
-		dev_err(&sensor->client->dev, "Unsupported DT link-frequencies\n");
-		return -EINVAL;
+	/* Check if the PLL configuration fits the configured link frequency */
+	sensor->pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
+			/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
+	if (mt9m114_verify_link_frequency(sensor) == 0) {
+		sensor->bypass_pll = false;
+		return 0;
 	}
 
-	return 0;
+	dev_err(&sensor->client->dev, "Unsupported DT link-frequencies\n");
+	return -EINVAL;
 }
 
 static int mt9m114_identify(struct mt9m114 *sensor)
-- 
2.34.1


