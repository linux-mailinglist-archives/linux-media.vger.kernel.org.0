Return-Path: <linux-media+bounces-30001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07121A855BA
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 09:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C56B94A2ADE
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 07:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91993293B4C;
	Fri, 11 Apr 2025 07:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d6LcUqZa"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0759E293B4B;
	Fri, 11 Apr 2025 07:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357473; cv=fail; b=NcjyXGytfyIi3077wpnbE1fFbOmZYRx0Xmmwe1v8D83CJTqr8LYFIVw56ENGLIB/3inhWch1at7Ry+llG+7Xj/Hqq86IOtPwhDNLH40C+GHQxoQAqWhpfZSb3gBalI5xVRYEWpG8LUXuoz+FpngdyTIdZIG4Z4tP3VMfK6pm/To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357473; c=relaxed/simple;
	bh=QIn1cS1Wgvxn7a2WqWvj79BXUhNsyA6hOPKBHk74ZIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tbsVM5EQGpDJ2L3bwdnEe8iPl8LvlsY6MACfOhDaWoaVvnJod4sDjoXi+WwgwX11pTFr/K7eozsYVQXycO/vtRj+nR5k4mTfiyf6pRCSgQwpV8Jm4qBkYpuEC6JZSrf2Eqsbp7DS53JWUpSyvdtaWnTpuNpE4ZOPaXSwHXXc1SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d6LcUqZa; arc=fail smtp.client-ip=40.107.130.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYDL8ryC6QiUzgnbCtCMBikz2T6Zh834gYJHq4+TL63pc2rTd/SNiPAmBnb4uIPEryA/9V/iEvAEzqT/hgly6Zu4K49lJuDp8afuL/OKNkkxcAIuRUDpS/1S9AntGGN7oWGM5cZddBujnQzAv1BCZGF3uG8sn9vYgnLXKLpL2OerRSjRv9EKZ72YFIgpMCGsMSm9b4v2tU3bgi/esgFNgE9d9h+ctYF4VYGVgjXGaRphSmB51KQTPh3F5hRsVTgN0Eh9dEYu7m3+7HJBKrvbxTqsH1VLTnZW7RXBxViNjAUcvVKE6svTCWExod8wPJW/0icUxr6nULD3zPaRXlsp1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6OUlqG4tJ69vbFQq43A7z0TygpsxbNOGoF7+zcpXmA=;
 b=ZcVp15t8FU/3zZNaqjQPGR+xul4nwdMZpp9LOvWpJzvk3XSM3Bl0IVLuyElO7ActHnquUNkXEGHm4QngGm5SaNZRDRaqpl0u3VAW1uaFsLusjfQTofmwIRUxuPPax25ee+8HBj00dZjbX0+YnzqlhSk4sNbpAVqpWvuG0hO8aIuaSdC7xS1N4CW9h4KUG0bpnq2mwJzlNyJBoFNDWXNPIKTSurVbIwT6PyEWoKBGsyXanAzdzKM1Qu3mqr7Id4hvTJ+e1y7YdDNl4Rlwp8Z1E6zu5ROWHvjiXLaGSE4q6PSje1YfjuO50kT6U0PxMNXA+kBsHj7foBZZoLRVxO7tvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6OUlqG4tJ69vbFQq43A7z0TygpsxbNOGoF7+zcpXmA=;
 b=d6LcUqZaWbitRWMFSpchB+55wk/Qw2WGIKkmfjXSnbmbQIN51+KEM0+XL2ZglyUnqdHnyzUWgIDAqy+5xuTuwv75u3MXsSrvRRzSFa45iwRX6maK1S4B2GmdNlf6s1ru36fBN2eUAcKzbhjyi0dsZGjgYn/gGDbtToed2S29o7tw8wclzWiswqK5daJoSAyIAGTANcTz9QXuvDjehhaocBlvyFY/eIsakfT7v3TTs7zxCtEOw3MJRkS6JXLMApqdH6fWrD0rlqanRmD9kO4ClYkftO7GcytzZQwk72i2KtMXHgR2+gTwk4TcOcY8eNtb2hkCgEFwDSx9++1jKwtq+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 07:44:27 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 07:44:27 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/4] media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
Date: Fri, 11 Apr 2025 15:43:40 +0800
Message-ID: <20250411074347.809-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250411074347.809-1-ming.qian@oss.nxp.com>
References: <20250411074347.809-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a0c18c-b0d9-4908-cf67-08dd78ccaf30
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L0++wAe+CtiM2FslEbcEhpXYmuLhWENHu+EL6x/W5SH8vhazZ9wacT9CfbUa?=
 =?us-ascii?Q?URJ6dMPOYWjPazQ0CNJF5ZLf8P6DPHdR1C+hBO0rctmKWZVHtWCd9PMiRPDf?=
 =?us-ascii?Q?t2ntjlYmQbCTNmZr2AuLORkEvvI36gZbLSRWDkq1UC0dYR+aRnR8i1yl+myr?=
 =?us-ascii?Q?YpOMCokiJX0x26LLQ2hYqFRAPSqCwXZp9joSA8OzdNsM4LM8vN7zsbtAR3J5?=
 =?us-ascii?Q?hCY1iKx/Vb3FPwsly2n1ny/GYjMP8EKgyuZSLs5hw23ai9mYvTAsBs7q+CrK?=
 =?us-ascii?Q?DsLofT/VVmCO2rU6uTCig/1sjqjEmfYtifITB0oRiLiXAydXeoKCn0rs2Cj6?=
 =?us-ascii?Q?xJkItEG33aTd0X+n2KK2DFJQi0i6GQoqkECP8/l+WaQEcRggYr7hk6NUn2Lm?=
 =?us-ascii?Q?lljOSXVlkBe1qbFv+N5CZUG/oxJGb7FLXU9mHS8S/rgJmisYCtbwWMT7a9o8?=
 =?us-ascii?Q?K/euJBt88lnNBn9yT1bvU+427NG9VlX4EQ7nhA1bzDLApRuJnL333R393Khn?=
 =?us-ascii?Q?O+zzlZ1uXs/Llg4elBdU2jwNlgXczY58J2HxB4lTsuPsyYeBHP44d/GIhKSc?=
 =?us-ascii?Q?Z1uvEOSqGPnpkprmVzTklJJc04NJw8vKWkHV0Dsac+C/kvwjV6UDBxnNE+o/?=
 =?us-ascii?Q?PsBGzke7908XVnUaJviCb9hAKumFKndKaZZ9xXfoijD/kRBDxt9fLw6Vsp/d?=
 =?us-ascii?Q?A0QEG7/mTr3bMo57s0DLaeSccRXhhsTEnvZCS3yx0Hj/wIrf75+xNfPvRfy+?=
 =?us-ascii?Q?iQZWFlYGxdseyb1MJ8cyMO1OSiLYFEHwadF/xlmj79GJEtElvwMEEgdpYusA?=
 =?us-ascii?Q?s8hLrG8afTNH/a/fALTZx2/oZnu63067JjQ36i37eCBJqZi6SmaAHyUPOCLc?=
 =?us-ascii?Q?e+E3dbuljLKctG3bWGaHRATwX0xic6erS6JDEc4rdSz8ly+PJ/5w40ti0HcU?=
 =?us-ascii?Q?6122Glm3pyJXSuBtPs/XzScUDkCa8b1q0aq8cwB3PA/O26w1im2FEBPqiJr6?=
 =?us-ascii?Q?fqvWmc3SLdU7yawbLP8HC7ci+Xef20/dRSzLOQRECNehp0GpHaX9U31e25fE?=
 =?us-ascii?Q?CYSGhdVmhP6f8lmKNoGvEqKI5Ji+eVixpiTA2xSu72qgZAmKFZr0//mmpgmg?=
 =?us-ascii?Q?bL3ipcAKS+Du60WCRd08c+6VB/VfHRsxmmfzeTLioWl+0nLtYjwuLDPlK+wx?=
 =?us-ascii?Q?d1Yc5ldU9L//aQoArBV0sw3z6WKB4pRqp55+8uka9s3spmewi22SCThugXjj?=
 =?us-ascii?Q?SZp/THKH+Oh+gU+wQ5XLmwbwWcAOCCPsPdINgqG/fSyXqCJVVQh4dhJ8fkSJ?=
 =?us-ascii?Q?lpksfb4aHcRoJramXyCm9iJ304JjSnp2NtggEH+auyi/oXvRZGILCI7csNPO?=
 =?us-ascii?Q?biAofJWd/b6Xbr9YtNJI3sFljjA+gvLca2tJQUtYTPRsyPsedXLCg/v4kkkB?=
 =?us-ascii?Q?L+SnhrnVoGAFIYX/AyVi25yDhzL3SuJNuN4FFN1R5HBhu4Cxds8Ctg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KtbXDJwRP3NWZ9JKl1PfTsoOXGRLKzGpgsRRu7ymbNDHSiDai+mhOOicg8LJ?=
 =?us-ascii?Q?Fj726gRfiLCpdc92waKwLac0PVFzKIEOzITg7I9ueqPrNDSbWEgS+lOROHBB?=
 =?us-ascii?Q?sfrd4Iu7ymXl3gUXZkcgEWntu5SQPu76GTP+sq1qsvSH7eh52BkjYAPogC5Q?=
 =?us-ascii?Q?G9MjELKqAnV+fhqcG4EKwsEBkIAHLTa78UZWlFFoNcaRlcZ+6UwbyY/F0V+c?=
 =?us-ascii?Q?129ZMXgE5GLRGsqEeHi5Xt/GK7ZRxquzJb8nqzB5a34zIyj9StDvIeQ/v0/o?=
 =?us-ascii?Q?imHHviZON+LiPnG2vLAmFuMZ2NwjVUS9HY3Db7qD25TlzHiwJf6fALOR+GQj?=
 =?us-ascii?Q?PoQvfoSbPvi87GR08kbkEs+/B7AKivcJRuv3xGkNXpKjpHNa+a+gAiwuV5zN?=
 =?us-ascii?Q?T6rTe/cfztGwVKCclahu3Cde4UEcRPFxHsmRiTYvd6K0E2IFBjHpciPFAA+L?=
 =?us-ascii?Q?TSgZY+om0M8SL6bndoQpdg9TzJyxJEYwFd5URMMh6TFJ+hNDbg6Pt1vLouNK?=
 =?us-ascii?Q?VrX9jO2kikThOTmZA718t5Qxmu8NWn6B3iPIqoTfvdYd+J5GsFYJE+/Q+Ap4?=
 =?us-ascii?Q?G8TNgIimUaBHBLSA5jyNdvTv2bWb5GM2FU9CEdPCUdhtxR4ypsCvwV+PXKKO?=
 =?us-ascii?Q?lkKEgg64l9w6V1PhHrOdkE5JarDhcC98lWe+5jEDo3FjJ0ONJdDWbv6EzS3m?=
 =?us-ascii?Q?fMV7ZejEGARtDWXvkJSrEhF4MteMJ9BUUQjpEqUz3hx2orBni9EwvFiLQkip?=
 =?us-ascii?Q?PVXoRr3FzZGBAlUlAcO072eyzhidouL15Rf9dh7ZpUAEpDl/STl+7KT2jLPJ?=
 =?us-ascii?Q?zYk431HJka5Wq3Oo3gm5Mge2F+Nf3Cr/eqo0Oi3yYajEnF5GmnK7e5VFbF6r?=
 =?us-ascii?Q?iKZXB58HHpndk1PZwzLP5xt3D+SAUtg+/qXnABLp+doisjU1mEvZw16bzDI7?=
 =?us-ascii?Q?gvXbqy3GMl+OaOZIJ5EBpR5TTcUDF7H5cYwU6h4gDrnGe56oIhYmqc5Qwx8M?=
 =?us-ascii?Q?QOooAxH9t4VsRQWP5vGaHLuhGRImENqhi/n8ubfWMRMLbjZtwMGvKT9CxM7b?=
 =?us-ascii?Q?vht1MMDZzVmFtZVpYPfxX7cRpzSM0ZFwNq4ZsLl9oa695IJL1RW+bQnQugXD?=
 =?us-ascii?Q?70ugXreEYbLWA1TUmosrUjgNz3ikEZ6l9WvNuN4rSe4PlXgDoo67Zz3peAh5?=
 =?us-ascii?Q?pvcp4PwyuSIGQnZCOU/ysAeu2M93rscdKaMk4TL5/GsADVWLk7vDd+qx1nay?=
 =?us-ascii?Q?f0Cm2ODoRG8xjyZpg1NdKQI7qKnRmKIMdb/XnyNUGTMRri8hPEkf5ixycq/X?=
 =?us-ascii?Q?TclqRBrvbnrqPX69ab73CEnEFM2HvPX2PDtAttl5QUm5Im5Uxe5+GhuMCnvF?=
 =?us-ascii?Q?Je1duATh1c8gXiWzJqs4jF0gIX8Qr9LnMIsBwg7IdJIB+3huAvjZy+s1R5zk?=
 =?us-ascii?Q?xgcvws10q7NPbLnLm/f5krcdr5alZSbM9ZlrPyi/4wtxGKlQ7J03JXheliVV?=
 =?us-ascii?Q?hhdLGzwBfxUbYRy3KCG4odTnXiJXhEM2alDL9g96W08gU7iQ1rKdSLgET4cQ?=
 =?us-ascii?Q?vECDRmC4NiGQHZ4Nok2Ip2aKQjCiWcsCRvACcrAN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a0c18c-b0d9-4908-cf67-08dd78ccaf30
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 07:44:26.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqlGfI5lU+4IkK/A4bpQespq+rnIL6z20NmdIux7uvfSFsTCvHStssZYRvJSe/xefj1z/zQr1Jaz5vAsB9WLUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

From: Ming Qian <ming.qian@oss.nxp.com>

Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data()
allowing to call that function during allocation failures.
No functional changes are made.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 46 +++++++++++--------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 0e6ee997284b..b2f7e9ad1885 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
 	return -1;
 }
 
+static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
+{
+	/* free descriptor for decoding/encoding phase */
+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
+			  jpeg->slot_data.desc,
+			  jpeg->slot_data.desc_handle);
+	jpeg->slot_data.desc = NULL;
+	jpeg->slot_data.desc_handle = 0;
+
+	/* free descriptor for encoder configuration phase / decoder DHT */
+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
+			  jpeg->slot_data.cfg_desc,
+			  jpeg->slot_data.cfg_desc_handle);
+	jpeg->slot_data.cfg_desc_handle = 0;
+	jpeg->slot_data.cfg_desc = NULL;
+
+	/* free configuration stream */
+	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
+			  jpeg->slot_data.cfg_stream_vaddr,
+			  jpeg->slot_data.cfg_stream_handle);
+	jpeg->slot_data.cfg_stream_vaddr = NULL;
+	jpeg->slot_data.cfg_stream_handle = 0;
+
+	jpeg->slot_data.used = false;
+}
+
 static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 {
 	struct mxc_jpeg_desc *desc;
@@ -798,26 +824,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 	return false;
 }
 
-static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
-{
-	/* free descriptor for decoding/encoding phase */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.desc,
-			  jpeg->slot_data.desc_handle);
-
-	/* free descriptor for encoder configuration phase / decoder DHT */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.cfg_desc,
-			  jpeg->slot_data.cfg_desc_handle);
-
-	/* free configuration stream */
-	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
-			  jpeg->slot_data.cfg_stream_vaddr,
-			  jpeg->slot_data.cfg_stream_handle);
-
-	jpeg->slot_data.used = false;
-}
-
 static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx *ctx,
 					       struct vb2_v4l2_buffer *src_buf,
 					       struct vb2_v4l2_buffer *dst_buf)
-- 
2.43.0-rc1


