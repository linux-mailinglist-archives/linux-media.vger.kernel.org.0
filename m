Return-Path: <linux-media+bounces-33151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923DAC0E3E
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57FD01BA86D0
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E04C28D837;
	Thu, 22 May 2025 14:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="fuT+otJ/"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FD028A1EE;
	Thu, 22 May 2025 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924553; cv=fail; b=XWxRTrwRq0BrznPcvuo4/es9LW5k85G+MxkmoWyKaofG9APanZhjSl5KXZsbIhGGDh+Lcz99kwPr8+xBvVjKfM4r5miGGQn1m+Tecyy2JnN3I+VN3imIgiK/oFpjD1jroN89hkINNmAR1eBKC2DLI5+a/07n4GKoFToy7hFvA1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924553; c=relaxed/simple;
	bh=p3cAlDG2oe7D64MGpf/kBy8cafnimbqAZ0Fxql0rm2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uMaKE+Aj3kYg48LzFZnRIkHCFvaPh8wTV/uDWww4btEg0GyVRrAtvLjPNWF7d+ijReUJ1yiEUYjNVarebaYC+8jzlJ0fZBkQCcWl5pSXU6K/vPIivt2ZgJIPTY2nyJIGF9t1Wjc+3qIO+VND+Sachl42PTW4n/yP3vBaztnA+s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=fuT+otJ/; arc=fail smtp.client-ip=40.107.22.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KevpjyG3ZJoAia2hYmASsSI7pSEgyduUrgeDNZ/wRrZRfcuTenNi78P+T8QqNAwKd+Q1ROuF9+HzJyTmPHXYkIIxhS1jvYbkBYuqfKU8sVs6iHbO+JZcF+PTGJ6uDgrsuEqkU8Mz81HBfklThYE81lL5lZgSXEr3EVkDqUBpBizDyAOqpnztF/bmgbIMDiQkwMgju7drm+IwyedpLgUir8klLB6lQ7AtvtckPuCAF9r5nQPv/XtofYmgPnPPmUWRIdFLyw3auYYjkYM+Iu3/KKMQY/yopROy6PbdlmeYLtZTJB7B27nSA3v44C4VP52Vi0pEeByne7Chig0EL1B5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQcYv33i+9n3cu/hqEBCZHrKU4GwhJibwK0luUi434s=;
 b=eQwOs0dJ5E6Y3gv+EmErI9rOJ1WE4UivK2/VWkZiX0K+/+iyDKnWYVKpuyum6iMXIE+qLZhBwauGCYZX3JM4OcW3iQ1DLgcwY0iEIj46IUA3Oq2062/SDW96v0kwojis3YPSoKtzUgmovEuYUWvhXgiuB6UOYt+SwlrLncYhwSTnE2Igf363EkaXzL17z0jNyn+AfhESU8Y7aqRdm3/fVIoqlGsmQ3fab6G7/ijGdJp70MjirJc4umfsoyeMgsg0gdNHZqGwVQXCjl/oXso66NAW+4xEoLV+WMqrGz2StkpAecrcDt2HW1smf8ZJBFtSbpTvpmnk/+n0s4f5iEH3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQcYv33i+9n3cu/hqEBCZHrKU4GwhJibwK0luUi434s=;
 b=fuT+otJ/rWIFV8/B4ANZaQgdJfnc5O3aidrjvvz59rVGQjbgO1g1iXIee8mflcCHkT07CE1L9XJ0nZgcPYP3gsvMmFOdAMgTlKwvW2QnE1FGcF9pxEmB1KDDzYS7r3pbXJwzL+CgGcQW73x0VqT5BTl6AwHsjQeA3eo/rkBzQn4PikOBA9E969437pWeCw/j/1+GWjx28pvzquAEMovtR2mPH0C95sf2tDXNiTtkAssBD6T9Z3IgEZpeJ9Bcb8X1o+jlSuZEJxwuOjaIVMsqk0PB7rrGi0KYHUiKB82UKTys4Ki8h6QMYIQfLyDN/mftpKR+ZD6GxDeubjNksAlSYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS8PR03MB9912.eurprd03.prod.outlook.com (2603:10a6:20b:636::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 14:35:49 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:35:49 +0000
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
Subject: [PATCH v6 2/7] media: mt9m114: Bypass PLL if required
Date: Thu, 22 May 2025 16:35:06 +0200
Message-Id: <20250522143512.112043-3-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522143512.112043-1-mathis.foerst@mt.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0001.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::9) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS8PR03MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: e756516b-560c-404b-70e8-08dd993df239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SVOggW/9C+VZNQIhug+JCoip/kW3VPm/nwVkz2ce8uGpiEi42cYQ48hnpGbc?=
 =?us-ascii?Q?Kjl6w7k11hKcVQCKt7y3QWcNX817XdHWBVm+gaa0v3ejONCzsQiZJHrBIMNp?=
 =?us-ascii?Q?IDkN9DtP9zfaVlrYuxYJ1qQNd9CB77qRBRuQMJKhd7RWVAhh425q04i8nSgO?=
 =?us-ascii?Q?YoCOqere4BQZT90PyIw7BWxkLd8+6Ifow8szymYYi2x3R34rQhdB35rO3M+Q?=
 =?us-ascii?Q?hu7FhKKTlM6ljJY8x6M/RUtUCllagprJbbnvPRbYc8uxsTni+/eWhwNzcRUg?=
 =?us-ascii?Q?dx0Uqn73NuIrkcjpjNusl4JAWpVKA5VQuS8rosss5bNTbsTbcYD8YLramJQK?=
 =?us-ascii?Q?jMoBA1FfawoBBuKb72WLX4S4pbrBV65UdR+lL8kwZR/BwxwwJW+aiWZY6Dpf?=
 =?us-ascii?Q?3nYI/BzJFM+DbIYeHlxf2DckhxWdbi77currwCRFWYeqZghwdxsUsVEBzQ/w?=
 =?us-ascii?Q?WLbmxpO6YCzrP9pWNVg8idqzNTWaVJvN7CCB+JKaXSB2H3IS6CqGMGoadiWD?=
 =?us-ascii?Q?woVHTR5zkMtw1A7sSAVBylmumDq5d9Bj4qPH4jaIogXeXFKxsxkYPn6VDaNd?=
 =?us-ascii?Q?q2AnYMfYS2HA9hBq5yej2AcdU1ciXjUISLRC2Xw9Eqjtlj11XkxzPUPzFQ6o?=
 =?us-ascii?Q?Hc4gwS2pdGYH+SW+qGIpEKoZMlE1j3tZafuAOZzF1g64fjDyyJgTQcP6NpbW?=
 =?us-ascii?Q?CsYA/rnmOToN1H3hqnfhcurZV8mq4ht+fNQIkHyOS6H6TGnhzSo+gHOZazGf?=
 =?us-ascii?Q?iWU49ZlM4B7ZbhZ46SAIwEmHlO3h7Ja4WieFdocFjMHNjuRw6FtVKs5Gci01?=
 =?us-ascii?Q?2gua5eBNOo2KRw6yUgN0v2U/oJaZyXSdvEQMQgVBxp8uwuGL6QnH1WJwzXMP?=
 =?us-ascii?Q?REbXuvEm3Mp0xJcO3++SQkxu+45nw2A+95HZ9/6ePwPanzqbzgwaVwbawL5M?=
 =?us-ascii?Q?fC1CsOqyXW5Iz8eaVfxfbuNprL6yPzIzXnrk4Sf8ulRx6UD3BCTwzcfSyph/?=
 =?us-ascii?Q?ZW/M4kH/PIQg+uGl9+4VVxH9qcUiQGnA1s0TodA1oJO+xvacBAWUGPY2jWPO?=
 =?us-ascii?Q?krDH1OwUzkFtbW29Wl8r9QoG49UvFQuC88vJBefCEY3db40SaM0bcPCWfoha?=
 =?us-ascii?Q?ClYekji3FNJQzEWPHMw6geedIeU90/fFC1Gr19OeClIAbryGy+QWy+sYjzih?=
 =?us-ascii?Q?/EX6Dnsma5pcFpbiZOvYamfn27ZI9ms2gO7FNWfXUtrFerxLxjBHOQTMetjq?=
 =?us-ascii?Q?3QXOKWfwCIVjbPN0ZoHxdLjULLxPvzH6zx3tCPcM6aJLEfl017NbZMADQfUR?=
 =?us-ascii?Q?9FqwlA6CDpK9XaJYVsyLPZ01TPm5UgDRV7IZAPHqH2axR+2Zi+/L+pCCrBko?=
 =?us-ascii?Q?grZMwdUR+yytK7t4I2DeyarfjJam2GgND/SDBwUEFh4X6FfedCX8ZTzuffwU?=
 =?us-ascii?Q?XA0rxO88xaAXECD9f6SkEWza7hX7uoEHDit+ZU61nudGHj38RhogdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ymym+1iq9xh0Wa5WDRPxkfn3fb17A5DeiVVoOkSNLegSeSEk0gjBMIjazIj0?=
 =?us-ascii?Q?wx22kXJngLfgmW4/f4Ubhb5w61seFbBzqP8hAQqquMfrx9/ulBN9NP2CBdM1?=
 =?us-ascii?Q?OM2ah6IZdhlUaSbE2P1Rfq4iUYJwGG5ErZIbLj2t8XrK3ox+1J0XQFmA/OSE?=
 =?us-ascii?Q?MDB4ov5bDsjObihiKohK9W+Q6Pepk3H5TzF7uu6GOZudZpt+6/OrcBdVifXV?=
 =?us-ascii?Q?lcNPFSczt3nnpdO61BI7gAS7wr+O32LE3F9x23O2o946WAgEWVpjD3L+Oupp?=
 =?us-ascii?Q?AJ0WNaW95yUADIvAsCBOPHIY4p5qlJo+/Xi0EkxG9JMe+TZcSUWkiXUIWMNu?=
 =?us-ascii?Q?reGJSPwlwUbPp6gTXJ0DfrU9TwRPPv5CCP4XysylTrphunlSQHrFz5mJJpAo?=
 =?us-ascii?Q?9zGCnipoJ1Y4VgAM7BeFFIZPCR/ZZVbN3ToXrpjXxKUbZapAs6N0xDdj0khE?=
 =?us-ascii?Q?iZFUATctC7TiuMV+/YzK5mdKSplOzFUOsDkVN/7jdSEoFpQxB7yfQnWSftP4?=
 =?us-ascii?Q?BdzuTrgErgkqq7U/l88tt1uds4IM8T4bb6gPxaI5nW3BWzoolEWvV/VE70Aa?=
 =?us-ascii?Q?OZ+PSO51tx8tPYFkC82UOjYm1kIzx5eG6u/erQv9CTLfzagEUX+NzB0vtILR?=
 =?us-ascii?Q?aU7ceJcrYCd9JiTCbmzpnIDlfXlLkv56OT3TfHbSxSX+pL5zf2fAolU8gnzn?=
 =?us-ascii?Q?LCgCdTAjJsS4onKdUjhjTpgFr2pJDn5S5vhL8gw3wcLwZ1rhNRBxW9KUup+n?=
 =?us-ascii?Q?zZMAEFze7ytZ5+ltLtdBLjb1u9rxiQaGIq5ucaVsLPdiDaC9AEifIxuXF29s?=
 =?us-ascii?Q?Ovzk369j1XdosIF/bCqqgAccuJ9ZyfnlIF0haOUjVf4KuzqtlSDjMa+aAXYf?=
 =?us-ascii?Q?LP70/QratlrVtRdEfsdGa10a8s09xgxEJdE2eIQdpHtg8B3hjuuypN4SXkWT?=
 =?us-ascii?Q?E8zZukT0UE5oyZ/3/I2S4rJfXED2EOviaYwsaLa1CB9j/ZMdCZWOr3mBicT8?=
 =?us-ascii?Q?LCJ+Y0G4nUmhElFb64rvg7dcbuNJatz6BoQNkb1cBRMpwVsAV4urUmAcdAO4?=
 =?us-ascii?Q?yP/5aUXtJgWLsGydVaBOtn5kDg3lewklcJVdMpwVwujpjk9WDEeuyvtITkXn?=
 =?us-ascii?Q?3g1a8sENx9f6vI4R46uBwnnbPgKW16RnDPaQIV1pRTgqI8gqT1X8ipNkgeRj?=
 =?us-ascii?Q?DuAS4JMmdqe5Kby0tD6Lx6xBnA2kKzLFG4OWWX2V4+W/cQthcPsUtPA6qBUm?=
 =?us-ascii?Q?UTe+M+PkEP+3KbyzAwvXgjuSbcew8DAHcHaXVSgpZ0a6/nxxG+xr38TwOgBK?=
 =?us-ascii?Q?IhV+4dXUOSJxYuQF5t3mdxZCDxgTRbg2rsPedjU48JC0ts4oP4gzj0RZx9Pw?=
 =?us-ascii?Q?aSV52ew2pZ83BibgGtL3WChwsgrT388nJd+VeDvtH6b5gUaixVzfR98iz+5Y?=
 =?us-ascii?Q?G+W5Osc7yyjP8ByZVv1zbR6Sh1t0O9Kh145Pk/hhss0dacB/J3XWgUNm2rqg?=
 =?us-ascii?Q?/whkx9zOuq3ly8zjskQIVkWmDb5+FDz3S5+Yb1XTZqaiqHS1zAs+4YidO98Z?=
 =?us-ascii?Q?DcfF4XgomMBUBlwLQZ3dXv5FErs//FVGiVE2HGiR?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e756516b-560c-404b-70e8-08dd993df239
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:35:49.3646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ggnIXBFpEx4nbT+Tk798tAdvxSHpbT/xgI7cLcMxzuOjqaznPW7YsZHcBCgVB+IGNi2JZPUw7B5OVPe1TzXcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9912

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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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


