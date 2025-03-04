Return-Path: <linux-media+bounces-27454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A68A4DB05
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FA3916D4DE
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17DF204C2F;
	Tue,  4 Mar 2025 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="RN473rb1"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013063.outbound.protection.outlook.com [52.101.67.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5231FF610;
	Tue,  4 Mar 2025 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084686; cv=fail; b=uWeaSYU6ODVF4723Z1fZ7+awiln7hyPDlqnT2zTpRyCikggzAnp9+DKPMpMrosfoRSnmHFcok45rWasgO7V+G9PoB/a++oytebfTfl0UwmPK3ELbG3c7JBDGQGKCxmf2VA5Nhn6LG3ggo+4i5tqPJHLDI6s+SVgP1jWWeTVPxCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084686; c=relaxed/simple;
	bh=vJguloyYCjjBeSBDyiQmG36EuGBWGtRnJmdmPXwqfEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n2yG7Nl+FF59p9LrZphEcPnsM22z4qASKj7c1kGOaCbKyz3YpR3jxruC1MF/qQYw/OA2c0fU09dBuIyEn0dWTO3WkLNVIv/95BHw7o5JAezTLXhc16h/B1bIQ2Uo0Rfrd43KZaM6NUD8atOCbsXbCmMSPXdlskr+0vl1ALJNJsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=RN473rb1; arc=fail smtp.client-ip=52.101.67.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4kASHXSm7NLuYt7GE/HEMnzTYe3c7dd/02ilih71RxPmtvTpZx8nuEvdV9rrQ/dFig3fE8kUXi6kA69EDubyHxc2J9iBJEma8Lh1x4TURtK2cu0VMIOtKtu83CXRBAKqvapfHIAxbb6XvcmgCKaVw5NLtDtE888FSH1rAKuy6zbdXz9dVutcvzGn4cZZKm4kGmFqvVgCSRILSR6KsfSH9Tp9NPDcF4rnbo6lcAMq6SrNS4EWT9Kuj4xnWL7gosMGCfqxZVNWF/E7cyZuDUBela26JKiVrvJw3b0hGQQjVlRbPDGxomgtVjcVcM5Wk6R7n1+oM3pbYOkxl6ogZHLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYhcziV0UGRkacPDvUgWEt2Y5thvPrXJ6Ha3tEfzFO8=;
 b=uSJgVN+FEIlhV/QuHeb1dzsiJaiXDUYO5lyl7WRiLurP+/gM89u5qf1vyc46T4GZLMr5OAZgEEncsRkIzj4npXa+5UEgjgkkK0An4iT2we+pMHM6cf0O7RbtfAiWnI1TuGsewZeYoev7IPsMLz876W49EC61IEIkRSc4g1DIsXDx782RlwOuXjejZP4Er62b5PTFHTY/WohYKhG6z9ONcSjtts/HcNW7xA7HDaDWpPaLkk49xdFmEhImHCMIcrMfJgbUsfY5kKcODqo4Rs6TNKm82RsHrG23mIOf58RwTXTlCNLuQVDYZegBrcKeutMMv1jYlugGiWdewHjdTH1QTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYhcziV0UGRkacPDvUgWEt2Y5thvPrXJ6Ha3tEfzFO8=;
 b=RN473rb1eBxIenaX/EemEtX2t053pr24FsEkxNL3LdpEIRBqiEd76YzV9nedT6s3t0rkItox4CariwU6rn7IvoRtOgMaZs3CDxSofPWLUf1Ux+mTTNgrzyRHOO9ZidGAaUtYPw84ECs7eG57vJsUR7bMDHpR6XACKJWb9C1pwXyQ2c+thc5m0nNaVo4uDh+E8WPpnar5WPd6x1AnNMzb6RUp7eimcGrOCdb/hbKnP1smtCth2skKOrR7SDnxmNOzwmz1GXTAQItyXyvcM5lnQy0pliQ2MxnvrMXHz/FFkctwSBYQiU8zyoYnwfD5StOjRnUPJKG1xlgG02HT3RKS8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15) by GV1PR03MB10575.eurprd03.prod.outlook.com
 (2603:10a6:150:16e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 10:38:00 +0000
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd]) by VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:37:59 +0000
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
Subject: [PATCH v2 3/7] media: mt9m114: Bypass PLL if required
Date: Tue,  4 Mar 2025 11:36:43 +0100
Message-Id: <20250304103647.34235-4-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304103647.34235-1-mathis.foerst@mt.com>
References: <20250304103647.34235-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0031.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::12) To VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR03MB10400:EE_|GV1PR03MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: 4457b4a6-9f70-45d5-81f7-08dd5b08a24c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PXx2iGh20XiFZu3HEQdzqCwdG2/bWK+SMemHGoL2PDPAG3P9brpvoEvDHhc7?=
 =?us-ascii?Q?TmuvDkUUAreluoWm7+gW69KDmO09pyZi68pWEqr3uJY8lRLo2ztYW9MuO4C0?=
 =?us-ascii?Q?yivv9K5iIHgIZHHVQVssPXAY4IDIZRf5GD+lx+4OEwKXQJDnQd6FdPGqMXmD?=
 =?us-ascii?Q?T1U1afcNSjIjosEYd7iL/6eBGg1u9Ei2B1YKbEBQKTkqd6YVYXKxhud5Nn7e?=
 =?us-ascii?Q?DNpkNAgEHr42bt73ctghQ5Ym412NnaP0y/LnUEiEUaEDo3Dx4eUbuoE2cYBg?=
 =?us-ascii?Q?Tba0KmFtPaiUcZt1BSbD683nLmmO+s7zmUbTD0IiXUvD4F08tojJuWMwCBuz?=
 =?us-ascii?Q?FiTVwuWZNtgJ1RHJ53RshoruYiQJs0WvvNMiTlHTB/0I/DgpzitW6ZVt3wBb?=
 =?us-ascii?Q?xayvLhffeuF2/amTANFpd2aKvkidEsZtyT7kkTXzhIRekm7VRWI5e/MPTVPo?=
 =?us-ascii?Q?xgITh7Iusq3L6i+4TS9Q70ZldgQyr7lZv0w/PWAZVdKM2p0D6pFMmQqEAsVu?=
 =?us-ascii?Q?fWe5FlHAp6WdIYDFGDKV1hBqZ2E5wCeAJRGmfdjEP92yP5Lj5VjHIzYq4fpQ?=
 =?us-ascii?Q?mPsWwzbl0W79cPJByfotboMdFxlF8cqzWT5voq/Dh+7NhZAprKrvV0+thYhb?=
 =?us-ascii?Q?e79imb6Ong8/GkIkb64x2BYp6cB83weNU+KMibSzwktJOtdkpX2O5hSWvdas?=
 =?us-ascii?Q?cwqIyw0ZUpapIWGEoCEYhuzS1cxhHRvZIib8XKpQ/j/pkEcRSDz6Ll+WvzVu?=
 =?us-ascii?Q?/q+SB1XvvUalV9NzjY3tx0XzN1bZUZmmaqeeO1IFlb30O+Hgr9yfnxHiWVBd?=
 =?us-ascii?Q?Iq9r1lZ/L5oihkU8mU7K/2ZoXonp15Li7c3oC22isLqXq12f8Tc+FaPeEZ+q?=
 =?us-ascii?Q?FcpHBHPJCICixnPFbofv4xBmcMOs+bJGTh1ueGOyQl2HkxowPO0f19TAixqE?=
 =?us-ascii?Q?BOO3KrIfgq3O3b1ADYild2dooLbBqfriE751KpvyVS79mawxhr5/wGEXTLyG?=
 =?us-ascii?Q?qPDR//TTTdb6Uta4bhZufTUMeL5+YOj1GuyhhASZfKDi8VLfXMu7MS3w2qST?=
 =?us-ascii?Q?vka6UvIV8lLwJmtj6R9UEeVX/aDJKnjEJ00y+7U6zdCFxSOU5v1jGmyD8aN/?=
 =?us-ascii?Q?Vgtk62Z2yBgtmZ1WIk2XDVCSywonUis+52+n5HuQJS0V9hiJ5YV3V5Bulmub?=
 =?us-ascii?Q?nJF1fPdAkeE/pAM8j98HnBqCXURj+4+aDwegxwV1Bay0Fn+JRKZdpe1BP6kT?=
 =?us-ascii?Q?z85hXZFufSHNyRc/f6yxQkMMGXTqibRKuRVkJ6DhrppX8c9sVBqXAxSOsRsu?=
 =?us-ascii?Q?mAcvzFSyYXX6vCJnFrQGLgf1D+o8ED9v+i6nitwvrzMLlyJMatcJBrjVobNE?=
 =?us-ascii?Q?wtO/nHjBmxJ+TGyHlyQLji00b8fQvWRKfMchFNruQRHLhVjKwpyybVZclbNG?=
 =?us-ascii?Q?PJovaCcvOaPXhFzXYHU6ZBTOncVtyhEZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2sv7wY/dGJmBAOme+Q8yGRq+fSZvphm4QID+0N8ZtJkaBkViidw042h8mYf6?=
 =?us-ascii?Q?IAoCsYoWsARHzIX5Sp8Mi/Hx2oiHtxiyUM1iVeHLOYj/yd2f/K4nl5QR3ubk?=
 =?us-ascii?Q?rtb6d3Lj96Iih0vUdRp7KG+A4E5HhKIrqO3lIh8cS5omcz3556wZuwBUcrF9?=
 =?us-ascii?Q?yWsH0SPsI6f/Dg1uykFuMet06hS18W7uob6t8vHpxGcLrbZWVNh+1BNEQV+/?=
 =?us-ascii?Q?J03O1Bpmh2YUycdaXOv96EsCc17eqEymK9h5Y5YFB/dRhi+2O9AhxgcZ/Wk5?=
 =?us-ascii?Q?ngSM8AsJM8gBZloyIjap3oE4KR4BOb/xeAbqfl63ZkxDUuJuTS31sBtikKgB?=
 =?us-ascii?Q?wwl7B+MDQ0Hj+NGRbTbh5mqgXfvWEkxG8HV4IlVHAQsEGZEMHOWHWEYFD60l?=
 =?us-ascii?Q?5T5MjDb4GkftsHs4iFiVSswxH2W7+vfX3MFyUG5wVb2LdTCfWjXYphJwneBM?=
 =?us-ascii?Q?X3osff1Y4BTsZ9LPLGSR267IEgwHA6H+Uzy7JXJDA3OxHh4M2B2YB7IxmDl0?=
 =?us-ascii?Q?qvffqQ86r+jyEI9VPTmJqP/8/dD1BCnmBfSwwG3OP7gWWjxhWSTK0kxsN/0z?=
 =?us-ascii?Q?MhTAqDQlzLJJajXQWCGQtoQzfacb4r6FZo5YP03SEFpMf77ubLpMZM9lv9Vc?=
 =?us-ascii?Q?eWvKaTFk98NXyENdHriAG/mGgIKfSWC8DrHYOC1X7ZHD1bVmYLTi5jtWdzcQ?=
 =?us-ascii?Q?lZYBopNm0bu6lm5AFPGl88iy+VVaH9stVtjhvbo5jkKwptTK7uArx9U/zs+V?=
 =?us-ascii?Q?y5damPTxSW5aoBuly0tWl8z4GkNlKG3sJkj07bX4pWLR0xBtYppOVcaVoIXk?=
 =?us-ascii?Q?DkgbleF4N+Uv1EZptst0wtKAmXWB7OuB8VcPJw8+1uThxwqVXwMBusKdKEGy?=
 =?us-ascii?Q?lxfOxY6YAM6TDY81gafYn/8+7dhV6QYne5drXJRrRVAyQs/dhZ/u1zwq92Vf?=
 =?us-ascii?Q?QVTdoGjxIoGsPxQOWWnnwuD/q+8l4Z4or9Gdr7GRsngMH9RGpUz7S3vuS3JN?=
 =?us-ascii?Q?CxqPU8TL6SVq0yMeTR6vTGlkXxM1ygy7n/jadZ0IZwWMNj8FqyWGAsdsX4b8?=
 =?us-ascii?Q?+EZqxCwrTTee75dsRwhHxbh1VmIlcMqUZaeLpBF0LMkj34d9qJnue1oPNAuF?=
 =?us-ascii?Q?/OFhBrSOnFs+2HZ+vcABjcWQfvOprLEbYhQCjbwSNf0bLnaghmwEi8QvTb6b?=
 =?us-ascii?Q?6+U4BNi5uBa33IR0zgWzGpcQSm+gyKkuI5r+q861nDMUX3W9wes0hZy/Jn93?=
 =?us-ascii?Q?/9pcIHTazV8xGsv3MKhtvnzMC4CBAhXaGl90L4tVqDVIiNKqyarMr5MAeFpj?=
 =?us-ascii?Q?09AsZc4+JtylX85f4q8ERFuUYX8iivetbhCyv6hRGA/WQdsn2Z7FXxece6nT?=
 =?us-ascii?Q?bRE3p5jphmSGJ4bL3cj16IMu0sJc9002Ef/SxYP4hUVz9g6sTHbT150+DKYM?=
 =?us-ascii?Q?6P+ucpz+2uPMnlsBGWZT7HjfgflClXGYG2RtvToQbJeMQKQl3Jy4XqP1WssI?=
 =?us-ascii?Q?GCZyT6x/9QymoOAd1yn4eVqkapWNrT1iObZHcQ0mwrBjpwpGj1CgK11myhhN?=
 =?us-ascii?Q?OL11KPZIjngiaEyQUEGD8mtt4vXWBRCWpI0dwQZ2?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4457b4a6-9f70-45d5-81f7-08dd5b08a24c
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:37:59.8713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nez6pqmEuLPOX0FPWurIQNmhNW0EDWr55TpVEkxCQj3nrYRaEMdAjNGEg76PcIKHcOmx3EWYokS407vclIq0Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10575

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
index fa64d6d315a1..104b146a5d11 100644
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
+			 MT9M114_CAM_SYSCTL_PLL_DISABLE_VALUE, &ret);
+	} else {
+		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_ENABLE,
+			MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE, &ret);
+		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N,
+			MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(sensor->pll.m,
+							 sensor->pll.n),
+			&ret);
+		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
+			MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p),
+			&ret);
+	}
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_PIXCLK,
 		  sensor->pixrate, &ret);
 
@@ -2254,9 +2262,19 @@ static const struct dev_pm_ops mt9m114_pm_ops = {
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
@@ -2268,19 +2286,27 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
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


