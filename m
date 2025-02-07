Return-Path: <linux-media+bounces-25797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870BA2C181
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 12:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F189169471
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 11:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7891DE4D7;
	Fri,  7 Feb 2025 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sxjTgi/8"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7FA2417F7;
	Fri,  7 Feb 2025 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738927825; cv=fail; b=aCtKk8OoxUdUP8UwxwM4MU3vdxaJXghHzmSJDYGjWCRmWpH+VkmCaVIRm0Lol/wHhQcf7+XpjeJfg+C3Rc39Tecb1AQoxqXtQM1WZPUaRwEPmsBmLvRlNAswMePzRMR/0EfGs3sGzzn9hEHQ9TT7V+xB2NlYk5nCKP/06Ndhig8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738927825; c=relaxed/simple;
	bh=IGRnR0q0jtqo7MxSYzuHnDVuL1knLEJ8R11ZcfsNZwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HFbv79T9Sr5FzoSgVfv2Z/nkHTaEN5/blJN8ho0F1+RYtbpZWnbyBSpIYTUfrY4TvD62sC9qzOIRcGka7pSL86hsmgXQSaINjGn/SzDA+u+kGnCG7TxM1ojLU7/5DBiMsO0d/Mcbz42iFs9wYoiTf7pEA+bnDMGHAw/L86M4CnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sxjTgi/8; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpbWtUHPNsG5bbGHoQwrVWcPiPzKXkVZN57IBX3+1DKFlGwc6gl356enDj1bDVahBmfynrRBNi8xGnKyU+d3mmE45ERQ7O6D3d5k9N82FUr5ouvT1CyiGTq9Q9OccrcLoMqWi5qV75du4HhDFUlA3jY2iSja9hqN5DNxF5gzLiDQwxdYuxwibx03S23PZXa9kkoAtRZtw/yGRdA3BsnPsvPFVKfFCk5H1zIib6PcNTD3ETycbqi6aXh4TSdqc54NqH4Bkuc/pNQgYqm4R1wPBTeQvCGUkaFJy749UvEgSnZsd2CHTDKKq1br9g2xA4I9QegSI3ao1RXHcyQDor26vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABb75QhTJsBzzuOAxXjX2btcTxRLxPVLDAyILe7VdNs=;
 b=zH3ndcwQtspkQcUG9bzt52dMo9qb+G1uVp4lhn0Frt49W35iE4v2N2Tr4QFG/ji+EutxF+xOVKkixjvWkryVoeR3H3nq/OBt0wmKi3NkLXSikMgJ/eqqFE4tGkXYlVUUtDYHo8fK1tNhjUi3NiAhU7B4qX2wYy5Qx1DKAOXzRjuSpeJ2zu93gB59HMLVAcxQ5unA/OJtnmEcHgmYkanv/MDXMQ1pPtJ51PHVBT55WPP2eFeT3KCK0tWbRMOEquI/kX8xbYR0NPMwIrkSFXlhQ9iVhBbcFJa8GQCB0LKE0Lvhw3K6Ou4xCEgfwSOWsr6Qz8rmeHQzY/7cH5A9OyviaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABb75QhTJsBzzuOAxXjX2btcTxRLxPVLDAyILe7VdNs=;
 b=sxjTgi/8VccbbFwUQs9JNXF+QuyGi/YHMGkwsqwvsItpxaa9n0yxkWD/P48tphPAnlZRuzPRlwwhTLxtNRLF8JNFTc+esyho43WyLAVotzcjsXALjTOPgccIjy4juntE4QJQIzrFv60xzMwr6Jk2QpTbHbLeZF8NjpGvVNMo3VKTb4iQTe5hkpT/UgoD03zxmxLEQybo/BIlbRyIBhpGY/zU1+xXY/n2TQ0NShePD3vMHz9iwr6Pu/HS9ZvQjhvX1lrj/BUuUZFvc9uaDnaeufaJ59mUY46wyIc3Gf+FZ7Lps0Z0hvF9ReVyhBu/Tlen0mbAwoRE9TVlZKkewhsRBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 11:30:10 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 11:30:10 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 1/5] media/i2c: max96717: change internal regulator voltage
Date: Fri,  7 Feb 2025 13:29:53 +0200
Message-Id: <20250207112958.2571600-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0020.eurprd03.prod.outlook.com
 (2603:10a6:208:14::33) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 30684fbe-3269-4c07-decc-08dd476ac7ca
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nNxWa2WcPvvDp7gcZplobJfU4siWt99L3uM9X0yVqh2q0iCWBmq0lT0y4b2N?=
 =?us-ascii?Q?PBUKNSUMcoUqKzgrDebEqWogeWopMhNimoqXkBLQJIDASVv3RA0qQ2J4c3PA?=
 =?us-ascii?Q?KMj52X2IwzhjsXsFEITL/M6KW9vBa51gcLkVZ2CC15AIwapok4CXRie7mLiJ?=
 =?us-ascii?Q?SllYUn/ieoxzPHIoIdTMfHIj7dYjh09HS0p7mJb60eE3zYb1kcqdHkFShD2p?=
 =?us-ascii?Q?a1whwh5l54y27SlEbHS34OLG8RR8XN92coxGdMaGcdAivh17QAwFCGVHVp3r?=
 =?us-ascii?Q?Zme6n0yxN8fFa8rMYFyip9DKmI8UEUK3OYnY/g+toWDTctqnctKYEHHb/GO2?=
 =?us-ascii?Q?M+ZzS+pfVePGHcbUs1EWR8xtLFkWNrCS6RIBS+TSFq3fPbXAeiprjcPNeNqv?=
 =?us-ascii?Q?iMEk7EkpgDbZjF/wCw8f15+HkzPO3IAFhszIgha9YtvLMS4zUAdac0HqTPau?=
 =?us-ascii?Q?kJZ61dBzQquC7h17RbLA9sFg04+NIUf+2fTE51eIiQcHMHq3QZR9tPPVhfYx?=
 =?us-ascii?Q?rJ3o2J/uXxIo7ua9h5nNaFcfWZXuxjTmVqBB7yoCOxSv+jv+WSNWMWVE1l9Q?=
 =?us-ascii?Q?fjvm+YO5dfxjyhLAx58rn6H//byrOOG5uGkl8bcFiIeM81vxZSvz1Nwu0Uov?=
 =?us-ascii?Q?EZm9J74gN9zBq9YuOjWZwsokKcCZhw6Q+LuyUYISUR4eUUVrdcM7seGRGyfM?=
 =?us-ascii?Q?2TPhOHsDgaDtIbHX8aJ6JXF9J4TCZaEn1zRN3q5Oo42HwTK0M0Dq0IILedlv?=
 =?us-ascii?Q?8+gvqcE3VZ8JchTR/HDjJb+JqdH8ROJdoJzI+/UvT5wfVE28Y4mwsFdQtHCt?=
 =?us-ascii?Q?KbRhEoQFjW5VCwlWLvniwfsE7/iedS+vIlxDsQTJzWznUjabPcpka3RUzxm8?=
 =?us-ascii?Q?q4b76odWsqp7Ds9u0r7WJS768u2nhxaPVLxs2tzB2vVVtQsOFf5F4LwSaLRC?=
 =?us-ascii?Q?nVtpGASXfIoPEffuVy2emde3jEM8J7GfLFmwuQarew6255+arB1LWWizwqms?=
 =?us-ascii?Q?mNkbWZaaxtJJl5lzAbcw3ZSDzFfN2NCX0dKmqPxgSFPgOL25oGbfe3TpjcrU?=
 =?us-ascii?Q?ylVNUEdHXC/DSMI3+TphQrvrg5VmGD03vh+kWbd3EV8uEfwNt8YcMxj/adb8?=
 =?us-ascii?Q?0cQEkOyTSdY58yF0qMDww1BGIoh0ximaHxD1zsUhjAHbZKAYhOX1sBplN0ke?=
 =?us-ascii?Q?NbLycWpzHFWeWfWm9GDrf+JK04fESTB52FJMjfCts6Wd7dca6IGnA+UPLt1w?=
 =?us-ascii?Q?4SXyqhh0d5Vy/08uW//Xpyhf78+OI5zR++doEEBBWfBGUYQJYxWTuKPgqMkc?=
 =?us-ascii?Q?rF3GOn+K8vX1c8fflE+Aj2tthXgtSeKh5mjWG7XwSvQSiRWWrieSGFxJ1a0K?=
 =?us-ascii?Q?REx9Nl2BhHfFCnQvNQOr+uJ3bWDD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fjw3iKwizFR+baH/dHCbq7jk4ILYzoXCqV1UiHnFBjyIgUtdrnGDo/zs3arE?=
 =?us-ascii?Q?4kNoq+HUsXoWuLa5/KPpquglagNgNxEbgYvHBEJIiEYa7SmZRzm9pXvRgZeG?=
 =?us-ascii?Q?FDpPzQ6gNAZ0vu1cmSLztBQ20E664wCCb0C696zU/wgJkDQbcJMM8iYkhaa8?=
 =?us-ascii?Q?HKuLNO3mBTmG6ExZnnhfpgjlbnE087+yzwC0XJbn1ER9rN8J56i00+qPR64Y?=
 =?us-ascii?Q?uffW8DF/W8D+ItqdYQ/NMRwYtJMPJPQR3++f8yk0Mvrv5pNI1e7whvR6/19e?=
 =?us-ascii?Q?0JgCJ0w60Vf1v2Cycnod2w1ARg15y28FoRUcbNq/v8JAVgjd6NWRPU2aIjjZ?=
 =?us-ascii?Q?54l89MERA35h8ZqfkMDHiqwj+IvqYAnFtDFL3L1CwWaac3ndOlmL/uw4TbB+?=
 =?us-ascii?Q?TtNam7sZEv9Yd20jXjXTSqOO6VxDa1ShaUq+oMDgdhBMLDBPPk/zyen8KRka?=
 =?us-ascii?Q?edTQyGY/qLfAHSUMkkFs+h0uAar9vx0ybYCEplK6Emtyl3h2GnI0nYAeKR8N?=
 =?us-ascii?Q?5/E5QJK3daTNymCiCt5yGm9rGfmdLydBxfVgrNczZ+9yvH11ccZmnB0iSsTd?=
 =?us-ascii?Q?OXaMkVumFFVc3mMY7pYUSqX9g86NWtiW0Zuczx9OKa4O4U7siLUF8qN/02Io?=
 =?us-ascii?Q?krNCPqHZFscaJPwoaA69Xprft1yV78RQSVHapExDhOxI4VgYSkuOZoFxTViu?=
 =?us-ascii?Q?UeE2Av23BeX5o05LtkaOlxZvcwH9DR+EFOA9S//nB6Ksn9JIncfXtuPs7nSp?=
 =?us-ascii?Q?YxuRPIRNEaZrSFKr2D6EQeC/sCUeQrtsyefxTGAHayA8uHjNUwKAXs8W0kSY?=
 =?us-ascii?Q?5IsnGpnnk5zjyl+KTmBUnquiRi5GrL9BXfU8u6NAZafObDvsi+D/2vj9I8nJ?=
 =?us-ascii?Q?JxuSiXP35o8jNNIuFabK1TLJR9/aETDzpCszrZUKrTd8mo468n4OliF/leTo?=
 =?us-ascii?Q?DvNBLYDf0MTj6ougM3U0NyqQPIIYBNVQ7f1al9J9rHGyJJ6fGiQBdWIRGake?=
 =?us-ascii?Q?7nEn5LL/KpojrTZozzXiqNMNW/0Xg/v7zzxSii3LogeI+clpi0OjFfE2pOak?=
 =?us-ascii?Q?gPgmtGkbsKx0tddAlNjTsRmhanFx0FKQPZ/9SPjlq0OXjli7lJOjO24FHkiG?=
 =?us-ascii?Q?9dMTqoTXWP4Q+D2ePeJ0BSAZ/GSGMHnV8LwkUl+tDJ+bYkgkKvJwP0JkWRh0?=
 =?us-ascii?Q?g7uBods6EFNmiCdMI44lgGQrhNAzR0ZJqzA2xCuWTlTITgNz20ouIccPn2Qq?=
 =?us-ascii?Q?tGOPNc9mFkk76PpI8L47Dbz9Lt+3FB6Bq7CzZnE8u/1sagjyMELtR1T3La6k?=
 =?us-ascii?Q?yLZ2SsL3Q8tUtzQMB9Mnl0WSQERU3ykbTaeb/3G0sXxFWzx1voh3p//P/DqG?=
 =?us-ascii?Q?VYpgjPsa1N44xbXMT1dadXzXagNxl07+0eT8lZlvf2jtSvIoR4O5v08PkqMe?=
 =?us-ascii?Q?N0r21MfBelrjNmlI5C8+YKXCiFYb44mMwcklMU+XbdSfmD4Bkh+eo2YtXE8N?=
 =?us-ascii?Q?SxZ1VxjMVpS1Mo/sRXecDfSmPWhYyr1PNjy8ia0GRKjwda8XvchVena1qi3c?=
 =?us-ascii?Q?u9q1D8euwoEWSwUMjYoMdm/7rs1dnN/Rs/9LMt/DKEQvOTb6QJ+U3V7H9hkA?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30684fbe-3269-4c07-decc-08dd476ac7ca
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:30:10.2375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYKquPL8mQ7ZY/OndS69cOXa5F2f03+0R4lDqQAUNVLmaklWdIA5uFwkdRp49LPUHHW2JK0fNUmXny68QPYUOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

The Programming Notes section of the specifications states:

"""
MANDATORY REGISTER PROGRAMMING
Make the following register writes to ensure proper operation of the
MAX96717F. Without these writes, the operation of the device specified
in the data sheet cannot be guaranteed.
Set bits [6:4] = 3'b001 in register 0x302
"""

Set this register before going on with the chip initialization.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/media/i2c/max96717.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 9259d58ba734e..b1116aade0687 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -78,6 +78,15 @@
 #define MAX96717_GPIO_TX_EN       BIT(1)
 #define MAX96717_GPIO_OUT_DIS     BIT(0)
 
+/* CMU */
+#define MAX96717_CMU_CMU2		CCI_REG8(0x0302)
+#define MAX96717_PFDDIV_RSHORT_MASK	GENMASK(6, 4)
+#define MAX96717_PFDDIV_RSHORT_SHIFT	4
+#define MAX96717_PFDDIV_VREG_1V0	0
+#define MAX96717_PFDDIV_VREG_1V1	1
+#define MAX96717_PFDDIV_VREG_0V875	2
+#define MAX96717_PFDDIV_VREG_0V94	3
+
 /* FRONTTOP */
 /* MAX96717 only have CSI port 'B' */
 #define MAX96717_FRONTOP0     CCI_REG8(0x308)
@@ -981,6 +990,14 @@ static int max96717_hw_init(struct max96717_priv *priv)
 	dev_dbg(dev, "Found %x (rev %lx)\n", (u8)dev_id,
 		(u8)val & MAX96717_DEV_REV_MASK);
 
+	/*
+	 * According to specs, in the Programming Notes section, there's a mandatory register
+	 * programming notice that advises to enable the 1.1V internal regulator to guarantee proper
+	 * device operation. Let's do this before any other operations.
+	 */
+	cci_write(priv->regmap, MAX96717_CMU_CMU2,
+		  MAX96717_PFDDIV_VREG_1V1 << MAX96717_PFDDIV_RSHORT_SHIFT, NULL);
+
 	ret = cci_read(priv->regmap, MAX96717_MIPI_RX_EXT11, &val, NULL);
 	if (ret)
 		return dev_err_probe(dev, ret,
-- 
2.34.1


