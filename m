Return-Path: <linux-media+bounces-33137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A966AC0D9D
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F78E1BC81A4
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D59E2770B;
	Thu, 22 May 2025 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="B3RHgWjF"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8034228CF5D;
	Thu, 22 May 2025 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922804; cv=fail; b=EUFP7O7vy7gt2cxwHNi0i0LzLsqbD3iMjObf25gtN6putkZwumFhNzqE6gUIJjvGbGeUHavXrHRqckUeMmHpERlCg+bsH9j3Q2EdBmjXU0iVHOQPCOji9IiDhjbKK2OddOfLiM4CJnGVPVub/OCOCs4GgBWG3WAst1ExdttzTHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922804; c=relaxed/simple;
	bh=HhNmQl32WKJhBHXcguxD3ErQxTRXGkcjtBID8jYEA2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=krD+uNugc++DFz0KOhgZmK8a3348OF5OMIxiRRYTH7jiI+VbVbGAQJC3OmeC4Ts4UuChu6X1q7qvuL6AcCUEAjO9h6UeJbSWx+7kcTvnCv/uCWVLOKzNB00hTX2el71rZtMBvADSR125SNEmToh8jTJBCNrhJFLfS7gW2gpv0LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=B3RHgWjF; arc=fail smtp.client-ip=40.107.159.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ov3bB7jkyX66JrRqL9duYS4XvU+POjzZ//lk34PL3/Xlea1SgHfHKjMn+ga97/YZTDCIhwV19rwj6zSHy7kOSVutbbhJqD5w7Q1aXY1oFu6EYz5X0uE3Tnf9nMmC8eZ208/T8Bio3PUrKH0lv8t37jRXb3901R74rL/O0kYvQ+gJ3/AVU9+yVszwQFBvlBXviywjKzGsRBnWDF0XnSP6fPKjVB9F0tec/2PJJ8RE6sc6iTbX++PLT6v59JEfFEOD85qhDWcCZ1IwlQOIGxm5yPy0edYw96Ku6+TE+abvU3e1BXh+zWUNEJ/HakQGFtMh0vA8CQyNdrpkO2m+WNTv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gy9MGTCRduhdAoAvQAPS14CTOGmLEk45T0GIzvZOxO8=;
 b=AI42F7tnPGJTngwQZrP9X/1New7WbjT6H2SYz2blsG49lY+7AF2pr3YOVefzgGvfT1Lz1SLqaTSP4gIskdaGS6iEdFdo+UZaFf+YZawB0Mz62WWdE7cJCLDPIXPxjFu98cJ0ohLYsHaXI/WgCBIo5VIFNj2+hJMRWjIseMNB7T/Sa2m945mxnbm4ZFPRdnVxDhimd/8roPpw5iGnq1lZ0rUdX//jywPgQZImitmUpjdJlaLcKPNgGnsHNSq3OpAfn+2L6XKtB5KNut+LDl3PuQHQa8groYZLMOlVHahXyWx53I/dsj8yWP85LP8r890+1g87pN2q9fp4h0mpjdRrdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gy9MGTCRduhdAoAvQAPS14CTOGmLEk45T0GIzvZOxO8=;
 b=B3RHgWjFXTmmwUmejUqQLZWJwFblmhEnLX1XMyDipmgpUnxBnpCJPYWcphhgYIZuYeGCMV7DSX+jK9ov5rZNmlOCteuieai6MFPKJiRWp2vemYy4IfDugYBTUmmY4T5SdCrbK/QvYY+rHNntL8s+ybJOz59ibOevdeqTIzKq261RwKYNrsoNzsWcdaso1UznS1jkrUnyrEpSDUpOWSSIawpugI9aBUFS53oNo/aODmu3LUSGGsMNDI/OCO+4Rl6V/0l/mFjmbbgg00+xpYRoobF70nXvDEEbKUWVKv9dN7gbAHxZj4rgB/K05528oNJpM4VUkIK4W91wKIrBLboxJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by PAXPR03MB8252.eurprd03.prod.outlook.com (2603:10a6:102:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:06:39 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:06:39 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v5 2/7] media: mt9m114: Bypass PLL if required
Date: Thu, 22 May 2025 16:06:08 +0200
Message-Id: <20250522140613.104963-3-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522140613.104963-1-mathis.foerst@mt.com>
References: <20250522140613.104963-1-mathis.foerst@mt.com>
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
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|PAXPR03MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc0323b-c95e-4cc4-6288-08dd9939df32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SBrck5b4+aWhqO/Pv1ozeKj4aKhrjQI2Iell2x/sTu+NVuO9KR521O6HRXbG?=
 =?us-ascii?Q?R9rf7b5krloCgPM39GTpCOkNyb+sEvwqH5oybgqwXuKqaXWQVI4Uh0C0ZL21?=
 =?us-ascii?Q?2L7uMa458GIR5RK7/m5/k7IeVh8Fp77tmiMxPczr4BJih6KSEbfYsei+RN8D?=
 =?us-ascii?Q?ANEdtEI7tBJwMY2nalzfjHeLPv1ekVdMRMKhI3IV9zs1FID9lGEeZABxrI1Z?=
 =?us-ascii?Q?f+cIjubws4bamg+obaoJ646tJFcVDKzVD5B0nE7xSRsOUCIGnpwuzZ73ADaQ?=
 =?us-ascii?Q?8uYWF55str/sqb0+0KwC4AKKpy8+WpdavQmw6aG5OPkMlkkbz97cGC646/y0?=
 =?us-ascii?Q?RPAx+Wzla3s5n21CF9RMjp2VqazocEplmhBukBS7MsFQOyKgcasETA4wozRM?=
 =?us-ascii?Q?yYPO3PfOWCWsu5nrE8Bgv7MwuPEc7JBCjyk58jp6g7p0thbvGs/hpllVv888?=
 =?us-ascii?Q?IEQH3yWCBZ3D7xabGoZ6WmA/qTz/XnXpMJ+qIOyA+BWV1SlN7I3TsVAZS+Z8?=
 =?us-ascii?Q?HZtefnA5hx4LHXtFFruzehXzepkYAsAVLoGPRyUFuTy7EQPHGabV1aVNWdLg?=
 =?us-ascii?Q?wCt/83lLhuf85qLBgmUu4FdC91oHER4AILEktUS1duURIxntScIYmXWQvoag?=
 =?us-ascii?Q?Xf5UyRFXKbKoPg7Q0Orjp6m1HumVCK4lPm/gEzaSZu94Lag1fy/4Ni3rPmpZ?=
 =?us-ascii?Q?abhm9HbkMdBG8EbFpwp9CUQsn9i+J0bgNBRr7NGj3WQA46ikj+D2dnM7M4X8?=
 =?us-ascii?Q?8ymIxd+yhjQ6oNr5z2wlE/0aVcX5nD5HI/MwfOKdEo+NiOzzxOqTTusTwB3o?=
 =?us-ascii?Q?JuYU1UbEZcYDtzyRa3F8uNkuw1sZQDiMCe/q4mqbwOeNv/Mh9aybRJOMRsnm?=
 =?us-ascii?Q?1OVSrqDoxYf/cRuId06Mnpq69gRSJQY/ZtzVou2c2HFK/XmDrC1rOVU5RSGd?=
 =?us-ascii?Q?WwnAXjUxEaL9Qu74QT/qAs9bqaQ+IcWYfCWMDWAw5lmIj9EDWZadhEV0B2+D?=
 =?us-ascii?Q?1vkbmhqYSk1otcSjgP3hJ/eqpYSqte9CvsGzimaeC9xtmykwrKZK0ULRQzq/?=
 =?us-ascii?Q?nTdVVly5zlNKwoW1QjG0yuK3C6v1ku17CchqrJmu1Y+OBwi3i1eZYdBqwgOe?=
 =?us-ascii?Q?Im+YKCJBjKaM95D+KF2u1XepWPfsq+LPH5FkWoqX65bjOFX3EuYiP1gY8NRs?=
 =?us-ascii?Q?WQ/5NgOH1ItDgs7jScL4qiyZr4V55kqUurhlAK/k/hOkI5EqbfzwmMbamLxF?=
 =?us-ascii?Q?6DJRVFhWiOK+x6aL9/blqRNjuMVC5luJEoxnQV0nLhk51ljk68KX+d+V/daW?=
 =?us-ascii?Q?LcleclwwxYXB/gKHptxzQ1yfId+G+NTo8WdOwmmT3b34RugjdlSS+RM+LAHC?=
 =?us-ascii?Q?bR2Oj5wjhVHiwEqCKD6Y54O605AieT+ZNhiveAXiGPqBokYXYaYOmaCJ5FpE?=
 =?us-ascii?Q?6O4IdBDKWqsLf7cV23hbY9iourWeDGBtM/8lW9phdoCw4PdUKr+oDA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F5oBxSOVosI4sApeOjhHz2lpSP9WzQxumK8uKi9hJyJKprVq0bCuTNGTNHuG?=
 =?us-ascii?Q?S9pBoMKv0LmT05IptXn7sRLRk5Gczw9xW91rHLZmogJ81gk86VfU3uZVbmR/?=
 =?us-ascii?Q?1wDq7l8AoRHntCGft/If0Ys7faCgSiwdIPcW2wwyV1kKqbLUb3cX7IdDdX2i?=
 =?us-ascii?Q?cvztqpSdQN6SF+ZlwmbIlR0UxOKuxxlUpsOH4wlwKom0gm0V0cVF8owWdMwB?=
 =?us-ascii?Q?ebSaBQdyTVdosTT0vNxRVHu0RmmEnhitvtGGpa2KkBJLbsavvNDgyyq1/mc1?=
 =?us-ascii?Q?wjS37TaXHAWChaiwG/YJe2/YyC1FHqOXaZhvBRkWyToiAp5Izxi9lsFlBcFf?=
 =?us-ascii?Q?Xk1WoWZ0p/kuTjyEFJHL5Pbc7K7GU0T2VJyCH4b6g88hbGNqeBjGIxSQ8nTm?=
 =?us-ascii?Q?6J6LBclKVI6qkg3j1FNmjLl270+ZJCMp1xtctWbjs5iN48amYMhZo96puhvp?=
 =?us-ascii?Q?8D8Koy/OcV/ggmv/TczILO/i04k95WOP5mB6Rh8rri6X3AgIy/xr1ztz07Kv?=
 =?us-ascii?Q?+mwWPKKBQ1R3xqS7T5FY8b8RK+zBbcA3755FAkjLXrFBwfKe7T3sXEUNnaXr?=
 =?us-ascii?Q?sqbF11yRZt/81eBOgkgmxeRDUq+r1bY21dDE4ZBuQGMMm4sITh/bvNSsZxXz?=
 =?us-ascii?Q?Jddx5bYMTzkDferGlAfSCXLRsZ3GAaVpDwkvAU9HGU8j3XY7OHE14u/LD1Ds?=
 =?us-ascii?Q?9vBmqAKHNcOAZ435Cv0TSQSvNUPkH+JDwottkcKX5tabA3WX6LRduGiRWJwV?=
 =?us-ascii?Q?XOFbq616Gh4RQnjW0aUeQtTdyV0HBScWymdQR7rjkd1o35SPnKRxW2oVk/tP?=
 =?us-ascii?Q?DyM6T4kHmud+SvY7NK0uKdJ5j0FZsvC8NQb/Ts2hE5R3CxDB+jEltIjEiQYs?=
 =?us-ascii?Q?HW53tW57wpNfN/luNQgdtUIfHQ34KJNphDEX3uLqZpZnEv06nMQuZZcitv33?=
 =?us-ascii?Q?BZfjrjEMXTP9AUNJ4w+fXv9qduy8635SIoCa9zoNx4CMP1sv+PcSvBd3Md3A?=
 =?us-ascii?Q?Z5T2NazRBmwBxDTHHLYmbrLmdIO08y0iyY5rTRS006VpLnsAW1s7NYHjLJAp?=
 =?us-ascii?Q?q3mq+OgLNXIkieJSX/cI2oo+Uw8nIasnXrRa9Ot0mbauQdxoT3npa22IAZDd?=
 =?us-ascii?Q?2eIza+C1gCrpEAEEX41KVbTYdTFO+QetMsJTdsF0GVRsMAR00GcyIbTNBreI?=
 =?us-ascii?Q?RGZZLJT3V6yopNct5UMHYaRnwefQHkONXudmzu6OpV8NiRq/CkuuMs/B31QM?=
 =?us-ascii?Q?Aq/dBzilvT2NiZ0wiBl3w976fQ9S7KeIivy3MGyst/aw0tJSnPvczhxkyOkt?=
 =?us-ascii?Q?FLiyog5fE+Fr3kD3/Hy0JMO9hITPgTy+Eu5trcNE/RmwML6Lx+DM4JOQ3SZ9?=
 =?us-ascii?Q?wbHhuDDaVWUyuSn1aYOuCEuwHUphtTQPwQf9SLcbGmOyC2vBd36K1ryhJu5d?=
 =?us-ascii?Q?7ntl6JkeC7CF99gc9lPQVZ6Md4CkC0o51yKX4ARSAia7ZolU7VmAvQFd5/J8?=
 =?us-ascii?Q?krysi1ed/3SI3wvAlP7XiA6z8lZXml18Kc+/GA9L/DEAUwUsnFnbIOauC0t2?=
 =?us-ascii?Q?Yh1IRCz/UFRdi4KPOdTENTOMJvEprvsb/HJJLq1D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc0323b-c95e-4cc4-6288-08dd9939df32
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:06:39.5214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hWITxcMVaJeopN7CNJ0KXCMZiHXksx6NvscFKgbrMbyCInA2ihqYCawsS9kIr2QUQukTzPvpnf4J88WENNRGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8252

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
 drivers/media/i2c/mt9m114.c | 68 +++++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5f0b0ad8f885..c3ec2eb0b134 100644
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
@@ -743,14 +745,21 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
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
+
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_PIXCLK,
 		  sensor->pixrate, &ret);
 
@@ -2235,9 +2244,22 @@ static const struct dev_pm_ops mt9m114_pm_ops = {
  * Probe & Remove
  */
 
+static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
+					 unsigned int pixrate)
+{
+	unsigned int link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
+			       ? pixrate * 8 : pixrate * 2;
+
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
+	unsigned int pixrate;
 
 	/* Hardcode the PLL multiplier and dividers to default settings. */
 	sensor->pll.m = 32;
@@ -2249,19 +2271,29 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
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
+	pixrate = clk_get_rate(sensor->clk) / 2;
+	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
+		sensor->pixrate = pixrate;
+		sensor->bypass_pll = true;
+		return 0;
+	}
 
-	if (sensor->bus_cfg.nr_of_link_frequencies != 1 ||
-	    sensor->bus_cfg.link_frequencies[0] != link_freq) {
-		dev_err(&sensor->client->dev, "Unsupported DT link-frequencies\n");
-		return -EINVAL;
+	/* Check if the PLL configuration fits the configured link frequency. */
+	pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
+		/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
+	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
+		sensor->pixrate = pixrate;
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


