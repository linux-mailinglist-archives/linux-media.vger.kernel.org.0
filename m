Return-Path: <linux-media+bounces-27809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C4A563F0
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E79F0177FBB
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3456211711;
	Fri,  7 Mar 2025 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="IzqjwS5B"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575E320E717;
	Fri,  7 Mar 2025 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339924; cv=fail; b=Q0+3dBUD17fLINvCvesVmPG+WZq1L9iNtbU86JqQzcBulP3g0rOk0WQwX4fTToF72sD8Zrs2j3fXH/gD7A+iJbjBEodx9FNb8z12ebuw8kqQoJvDftY+gjZYssUMDrfDySvck1Tet3xNueINtzyr3dIqFAeYLvfqrsgE9tLfxSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339924; c=relaxed/simple;
	bh=eq7Q4aJV05QZeGiCA9lw2R3WcUgK+6v+jlAXbR9Sqok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m2CFpFaebwjspi7ZPNyMp7mMBalA5/AbeOE39K72FD1I4QMTUozpfnOEqVo5tGdohYLEFuLfvjkNIvuYJfsBQPomtModVvBnsqyCdHYthSx7927MahCAFIc34GGEvckwwddHXoWrazP6JC7ZAZR1fi+sEp6g/MDQHfRGP9bIS1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=IzqjwS5B; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xF1oa09Xz9xr7qleVJV0qic8Gk5xIrQV0QkeodD9nXRw9lE2CuOcOP33jaDAVwTGT5CxGynNaGS5veWDT1Mpxz8eQlmz2elZn0iSCcaeg8EVFZoWB0l0HWaLe7esTbQcDv7gikXsZcV6EN1aQjghG7rUh5t8npBnojWW7eAcoBOvhNbH7GpqlEkjXgROixHZkkoS+Jc8JDnVBkcK3LfbPtGCm++rhOfE2wcApElThAOzQvTnKUKtCiEJ7qGuYyotyuA2zp1hdy4T5+DH5hV82yKNy1V/+G6kB9+xQOZGguC2/8st/aRkRA7HjU0dwvgXsEKJvyqYsPdENYjn6h3irQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGBvNUWZ91E0pic82G7UQENf0CY9D0CMSPsW7JiWduo=;
 b=JvMEvCmbfKUv9f32kS46CQJMG6ufnn8QY83r68E7xaI8YNqt6R42aMaJDK626rvIF70GMG5CIz5bOWuyTWFt7qeaaxOEuOvnouohD18imTSRqGdsPUKvjYaC7aDn9Q5/V3Yivn0wtPRSCBVK3mx58QMkszb0gA6j0fv7zIOXhAIRurePxh6F7WZvUSVhqEkFOOu63yJFPQbBmS+jl7/ZLjHS8LNAenOvhJs3lqgndA3+8TC8xLYLPuW8/41uCmXJ9s+APzbl15E+kvgKaDNczL80oqePsmZP0lJ6L63Bi5RzZPgVPt+fpBLIr1IoKxZEDRHpEMnqzT5f4ggqVIaiPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGBvNUWZ91E0pic82G7UQENf0CY9D0CMSPsW7JiWduo=;
 b=IzqjwS5BZSjgkkLJRJLujkLZl855m96T7x+ylCLI6Wzfscp575bs3bgFdvwgOVLMvKcZCcboMwSJffr2wkGjNbHa/elTebZO3XokvDGp4gdHinZBxyrDPmi8Mc3EcsceLyLshBBZ7G+Rj7/v1xhcv9P9weEQnGKLhqIMWPq5eXLxoU6LqmXleh2APBnD+Y4Uedg5q8M/uNuys3B5Tk8OWF4Z7K/1LMkUz/gs5z7W5Og0Hm3BMDCBOFLPo9bRfhIa0oOzv/aIW/tPYQomJMd9r0jgX7Hi5Ytw6GtymwU2ZVKQODmNk2diTtt4YmXrzf2FMHFbaHXIMHTB2E7LkTHvmw==
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
Subject: [PATCH v4 2/6] media: mt9m114: Bypass PLL if required
Date: Fri,  7 Mar 2025 10:31:36 +0100
Message-Id: <20250307093140.370061-3-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307093140.370061-1-mathis.foerst@mt.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::11) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DU5PR03MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: 1678130b-b2b4-4d40-9f2e-08dd5d5ae57e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JozVpN8xrOa/fBuz2eGNNRPNyivtXCTRhSy68MKdTzKii1JtWouIT4MiJqd4?=
 =?us-ascii?Q?B8gsECerz3yTm+ON8QS9majGeX4wDvGGVyi7fGawSd9FVM5hwnIJ2tPK4pLZ?=
 =?us-ascii?Q?bDe0J+wOJV68EsbLwJur6eHpmoC0vzsDaMDp9656Mu3nPaLKYD5QXKDzyenT?=
 =?us-ascii?Q?8Scy6Oy+8fB1oY90dYM0EniLi8oN7LDWs2gcLPCnWWDvL//mIK/hFAWTHzkJ?=
 =?us-ascii?Q?61nOunHM9Nm7+/AE+Dxs2tP7LmQ2IZxVjDSaRjkZ95FQgf06DsMsg6ksQ7AD?=
 =?us-ascii?Q?LCzsgY16xMLB2Lyz7IZDYkCjilIlzXpItEYfp9o38p1N24F5h07/Hft1MH8e?=
 =?us-ascii?Q?OnIUgIUvNw27XsR7GIJGXbH0j5L1t6cGAe5nsLul3Dyik7QY1bZVs+jv6BRS?=
 =?us-ascii?Q?euvlUlLlGGbeFVPzoIQFoawtArOg+ZjNXC2ViRn3fk9ppqZU76saNxEvkbgf?=
 =?us-ascii?Q?0oykqRyGMWhWDMBWmR0trmY1hIibz5SSm472I+HylY6+x39fLon+WdO1dAhi?=
 =?us-ascii?Q?1aMdfN4zyF4/OHwnZq8s7gK6H0csVbx5TPy0VtoWPJlr4sBohJs5rfWxCTtZ?=
 =?us-ascii?Q?UcpbFNjXvml28mExSGKaScIItd/v0Q0f0aUqDPT04NULPIygwVGPCdiFd7dS?=
 =?us-ascii?Q?NvCLcfNxmz50s8Cf+jefJHYmL/yzmr26vFDGOVDWJI7DV7IXXUW+vp6+T8Ge?=
 =?us-ascii?Q?e0e92OPJU6jI0BEhemdRXV9NjrrMkPsalCM7lbBfggUdb8o5ysnEhHkoqN+p?=
 =?us-ascii?Q?ybZvzhXFSYOdxi5rg1MZXtBB+uP2c5fx9qj2U3v3pdaOcaAQ8HBKdeisJ4k0?=
 =?us-ascii?Q?4F7c4WJwtuhqmmNN/mpkTZiSLqsNCSlYSWgKmZPI3xQVMNYja/zbdt+IZ3vK?=
 =?us-ascii?Q?2xN5nTpqPd1kY//HBfc25ACpLLzBLdwHiWtbg/OmPhxi21AJ9n6VM3DWEmvZ?=
 =?us-ascii?Q?YifBi9zF9euRu/2b9XeEKE5ie9BDva6HSO9um12zwhN1FPMMs5DrTD2rmeZc?=
 =?us-ascii?Q?0SMLvnHpIjQI2IXZIS7y7HOVEFO15ayWvsJVZhvsZGUWXESdRhl1GSFHtlND?=
 =?us-ascii?Q?XuZx1SJZ5Al9iXr8BqcC+LGNbviWx74jq3yP1xem4+zeF6+GetsJtKaFK9l6?=
 =?us-ascii?Q?v/KBH9etYminkklRT7bd2og13kkyVDU1WwlmWAcBQKFIGPwbZ+bnRMFDN/F1?=
 =?us-ascii?Q?ob1NArvhCI9pDY2RJhtXasGmR54MKyqi55TjfNbxTcZt9xJjqebieTb8U0sH?=
 =?us-ascii?Q?FUC9khBN7i/AZuaUFyBT8UeBAk6JI/WSvwx5hOD+Ls63rfEYnGqgo1BzueWC?=
 =?us-ascii?Q?TvfC3ILttDDvVSzfwNssqSN5oIrqKdZDh3j4sEQXQuIinNazzWDHbj0768ty?=
 =?us-ascii?Q?V8mZsxFFsCKColK9+1p1TZSE0aC6XwtA1+aSm0badtP7VGgZifdZGsCUwK1B?=
 =?us-ascii?Q?AvRQsVEB1txYIQNpclFc1+sJ//mkWeJ5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ogtef/vKbz7lqF26uTmvbJG5YJlJ4kGlKd1kLWZNbrX+wfQnFrNQDEPCH+De?=
 =?us-ascii?Q?bEdnviev0WZB80frACu2x0QDz843+7TvONlsj28OraDZV5dYiSTdq4c8eO4E?=
 =?us-ascii?Q?m/uC+NSFxLjdu6ATweQ1CxfitYLfUt5GmHoRCLtC43o9PrU3ldhmkltjfxqB?=
 =?us-ascii?Q?OAb+ewm7gDqw/77i6cJaaxYwKexOulix+CaG5oU23kep2v60Q5boxcZBTROk?=
 =?us-ascii?Q?FglZrrPqMu1J9ZLBPRRUEGTTVlMBU7WFvDg0aURFfneRGYzdpCuz+HhwoEeB?=
 =?us-ascii?Q?4TDmZky9+qhfnUgS5I4x4RbLSnkypNwMvtNC5PAHz2g8Kvpt7P6TJVD8/vOw?=
 =?us-ascii?Q?IWB89Jn84ZZZxViaSouBYAFYRNd8AGVo42ozG1uLE0FEZAPkaLtkvqmWSaun?=
 =?us-ascii?Q?1DW8plkLwmKm1ANHzwpP8owDj4tqwGOXfhsiC3Isx4p75WFnKHs/HHhfZj9D?=
 =?us-ascii?Q?sVcHC33sVafPm0fx7gS9QnfnzWitKi/zpUlloxKdcweVnqy/BgdwBQV+He5w?=
 =?us-ascii?Q?16HOvhfsep6zVceVXU6mSrO/RaEVQc5FTn2QJhjDmP4g8xPX0CQNXrpWPk0C?=
 =?us-ascii?Q?WPnSXox3rLKptDu9NXOzwou9sOwJR+LlVi57U3RBcxPAXVtsUzNvIVWY5raO?=
 =?us-ascii?Q?ZjPaz0c/yAmJSYEjd16aPbwL3YHqWjAo8bqVs5rM9FK7L2mkeab8hrCfQxwk?=
 =?us-ascii?Q?IdkPs5U8t6pViO9wDq51RgY5wFetyIKxI2et7hzgFPHl3dXtS0c9EX7tTUlv?=
 =?us-ascii?Q?l/8WINnl7glk8HCN1p/Hzfqg+DdZuwA0/rlszV1s8a9oerADqBXnZFNDGgPr?=
 =?us-ascii?Q?YslG02+0KUIZR4tFcegrpb0b1VOh7ebZ/AdLXb2zIj8FwF/YZhIDOFQamzqM?=
 =?us-ascii?Q?Dfsw887Rry6DSxIZ/PLaYAqhmT9psHOy/SVEentogArveghpPDVVDB9W0eRq?=
 =?us-ascii?Q?09Z3hL3rkizZ7dZQDJfYnmj3Dyl9hgQRJ8i6rEgDtEQXFTXuVUC9RmvjMBlw?=
 =?us-ascii?Q?0m8Rv5Hi3N9T503VyUEp7biTEv+G8VeMlTZdNy5j0KsFk6rzKE/yrMik5ArV?=
 =?us-ascii?Q?jYz5k+1d1wnfv4E+lB/RfV6cTwFNtJ2TxrsvsTMLyIaiVdr51VYhELZ4SKaL?=
 =?us-ascii?Q?mlWyRk+UfMzvSJOBp66kT6iqBJAlp0h5d0G+0z3nyvzRA7+idm0dQaBQWuYZ?=
 =?us-ascii?Q?Bcqtrs6XkBTySpDHFGkFLxjBZO7Z5BBIIH5hMTH4VqS4YivRTu9oJaC5Fixx?=
 =?us-ascii?Q?BwMwivWUEQucS0abruVi5kOUJwaajc9NQej7YoGC2WjGdMZ7GHntraANRmKs?=
 =?us-ascii?Q?R70P0EKYY60Kf3+piNCqekFg8L9vEKRKcjbcWqkxwEYj1qpuzW2t70XsW1h3?=
 =?us-ascii?Q?hNjLhNBgDqjeKbmdTKeJ6My9JgY0/+p4It4jUKH9VRXb0VERUoAHXd9WOXg5?=
 =?us-ascii?Q?6w0go+ay+SR9rnxpe+B+u6t+V6OZH29w4eKT8GbjtoZ2aqpgzqLjt04r6w8g?=
 =?us-ascii?Q?tJ7Ez3whWtRRRagIoxztM5Nz2h+28s4zYcp1Q6l/zccX3tvPsy9qSTtKSv4R?=
 =?us-ascii?Q?zY0XrWS11gSKJ7+LV2ejHQ8mn/gpSpyvRLimUqgx?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1678130b-b2b4-4d40-9f2e-08dd5d5ae57e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 09:31:53.7565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CR6Nc7Kh6Vcb1REkeZENA3CRYfjPlhXW9f8vnjHZV3H9k09nED9Jk1NXvDhRfUg1XDHCbpCIr2McRD/nmxsCxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10443

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


