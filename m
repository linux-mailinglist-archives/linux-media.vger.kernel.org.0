Return-Path: <linux-media+bounces-31818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A30FCAABCB8
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 10:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 995AF188A59B
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3711921D3CD;
	Tue,  6 May 2025 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="U/90eZzJ"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602DC21D3C9;
	Tue,  6 May 2025 08:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746518960; cv=fail; b=fxp7lrFTI+a7V/atf+6907oSRzl18SCSQ7NmpZ8bLU4RN0EgU9IkdaIlc7Fm3AE/FSLy2R2abZvdtSYS5G2cZqfd9fTsq6qj8ySRN6CRApec0MCiAVwmS1fdAerBZcxz3kci3fOz2Li+bSixfMyk8DoxeDFKtNWvxeFGS27lhlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746518960; c=relaxed/simple;
	bh=wAAUG5RoU25GqHzl9ST0hZ4l9CWs/uDAGYqUdQOdzUE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nspjvqrVnnWHCAOZ/CfqK+aFCaEWwEhlWEc2ompbalHvybphdsuQEj04FNCd7vNzJhxPJ4D/sC9QVZPSXW0hLn4dQWCbVCVTMRCavH8ocQgmAMnleVbdvYbQPKdezCvf1uRR8AQcRil/Q840WUOlez0/b5F85bejr+PcAxSu5L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=U/90eZzJ; arc=fail smtp.client-ip=52.101.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGHe+NcjWNlMdEzw9VDdUSICx0+x23ZZ2H3zULSZqRYRAf2nsxzb/+uqAY9cvynnMt6X8VfK9c6zVjjUhSSn36bmUUnSmUwrXOCiyv26VAI9Npx2OSjFlZlUPz7a63BGBxaIlyVAx+LOQgw4Oy3dzAfYgM7afZFe00q59eRmc/hrOg1OhfXhcyIl11z5EwskSst2BIQ81LsT2E1ZCNXRPMW4/+mG0Jho1hJApFHg5oNFE89h2AaWxBxkI9W0a5iP0r4/dBp5DqE58yNaLG9R4z071u0FbtwTIafj4tXbfPMu5QSoi8OfINda+7RMCzIhqYLO+yl6MGiu7i8Ptj++wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OhJh8YY5ZsUYcUYDpNIasRmzz38+sVU+fBv4xnYmhc=;
 b=VAVM1KwDz/CcNdh2MGVTRq6T7JhhaStTqc+phggcepCNIlBn+aZ8mepnXLcLr79nBn4tCEGYLmbd3XxcTElV7AN23lculGuSaTkV33buZmFIsokrr+SDCHjGn24P74zwxrd57GpC3lUnTQi0mThDclIefM0l/kTQ1EdQemjjI66xsgN8P8IdDF2+CXhKeSwFf5S95f1oY8r8DjcyIN+VUsAMwwsH+0EQCvzX6jqZNvdhKiAJTFhkkACY2kJKah/poVJXjVvoCfzkFmS8zGrfEuqTrrlBgkDh0m0BGfPCq0tEmmdkSIAEJJ0LwlvJZOo8Iw80aX75nmcU1Swr6F2Y2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OhJh8YY5ZsUYcUYDpNIasRmzz38+sVU+fBv4xnYmhc=;
 b=U/90eZzJ3TrVeLcvcH75CrsLk8elMyJ/XhsrdwwXPv3ED0tkerVtntXMNquPlIZpQ+/MgCo5MXl7LMJ39ZasZT03ktPs93oX8AAsE2J8Ckcas8vLJuHyfM4Utc2FfIIoGctKO77PSQoykEBiqbp0qo1QsAgcmw71uXYK4t07W7rFDzkLGQ2sZGJchFk5SG3Q9pTb3qtq9a3ZknufUIUOG5F3iKtxNv0/Gd+DRVTyydi21ZDyZukGqBui1PEJo6/V3z1Fh8SG3nJdw7mXNnEYpU7YIZt0ByKuwTsvoQBRPL9QVyINGWi2VGDvgB6Ag+fZTOUSrg3h6s4P1HhONnj45g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS5PR04MB10020.eurprd04.prod.outlook.com (2603:10a6:20b:682::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 08:09:13 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 08:09:13 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
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
Subject: [PATCH v2] media: imx-jpeg: Account for data_offset when getting image address
Date: Tue,  6 May 2025 16:08:15 +0800
Message-ID: <20250506080816.1792-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS5PR04MB10020:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b62e1d6-82eb-4599-e740-08dd8c7549d4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xTdydTNVrwaDbRkpdUxMlFG5UcaUGGXavV5Get0weCyasX8irDZST7qZ5HNI?=
 =?us-ascii?Q?RP/cVRDSNIAGTdfPMC/hktrznvAr+k1fJDDuY1Mqqk73fqOm1L6cyU0Emev9?=
 =?us-ascii?Q?EXix9rgxo9g3ypMbIXmxhw/J5JU4PxRb4awXfv0R1c/vyG/sb0vFX8erfusC?=
 =?us-ascii?Q?YGcwMRgnSsiEJMT5KokfnZ8y27mzYiKE+CgZDxt58QPT194y0dvy1uMa8MZQ?=
 =?us-ascii?Q?BpoFG+NfqzB4plriaKnaMkWl3bTWLGazeK9nu1BgV3lVxAKA9wxhhHaWCA8u?=
 =?us-ascii?Q?TG9V9AxOMEmGmpBEshj3CCrzjMM66G0s27uwq64LvYDsyFteYVDEjMhQ5UbS?=
 =?us-ascii?Q?+F/jZYZUpY9GFl9+vaHlrPJ+iK3LwKqPtnMkuvci4KRKovLCkjur6KxwL6kR?=
 =?us-ascii?Q?Cewdl6T+a4pUMzqi4tDUnW/N5Lp4ymkGOEYUw0Dr2SQTRU0u7DfpQm9FMqR0?=
 =?us-ascii?Q?hyCjdZqRBut3N5YaMyoyqnyFSIOPRWmSr7BSWe4MTmCigRZjto4H2IUVR0hW?=
 =?us-ascii?Q?CaLqI1IUWP/rk7CTy967FKKf5hmBIUiZTktVyQMMtiAMoiPT6Ie0vAiOgEki?=
 =?us-ascii?Q?3qp4xzxvDrz/6imkOmGwAg4cy/qoUW/FTWdc0c7xxyLp+XDED687jK23/Fur?=
 =?us-ascii?Q?oO01LwTZvtuQjHeldF6tXAP9YBKA0lqdRD0+2b31KSFvPEqD5uJNGGGltnj5?=
 =?us-ascii?Q?+WqLuSoPsgGQmgPEF65bvwnAQGOVIi5Gdyfta2UOmHfiMmhYjFMfZtYXVqBw?=
 =?us-ascii?Q?KQVi8nE5R+8olfXHS6U34rPR1HkqBOBXSDOYnRPkz8j+7UoUj2xG+GQ6l8qi?=
 =?us-ascii?Q?HO2YwBrXrFOceRs7dJqxpA7PCxGEQFos8di90LG6in8lqaMjeM9WluEXNbQt?=
 =?us-ascii?Q?m7Ip997v+0fpnORKxsKMxqtJF3lqyVJw+LxHELSqBelhJYHpGtbhjq/DLYvK?=
 =?us-ascii?Q?ToUM8VSN7hMV6JakhUTtN2Mo7X6Fz9uCtOQWvLZiLW39AYE0QHIEPB+mS/gc?=
 =?us-ascii?Q?zCL3qkhEnHHpKHyZZ2l0Ye5wY72VfIUiIkK1ODZZZySDzU8nvfuRKSPWLzar?=
 =?us-ascii?Q?Rms40sUUz0Oo9YNQ57y5JsDMeF9KWJ3HO3YbgRB7mAbzq3THceVh4pgheJgc?=
 =?us-ascii?Q?r0ktDPZukqqQojQm0tiHjupKKAh2KE3nn6uQCSYpHyU5Ld7ZUZRIhX67FCTw?=
 =?us-ascii?Q?42e8Qnl5M7jBwHITQPMF2FJwsPM1JpoNMzTKPT9KtizfuqukPQg7kDESoBYb?=
 =?us-ascii?Q?xeav5jAq4HOvH9Ya85zslvt6oqiuFs2D1ZvGVEz0Md5kcqgysnMTWEixwIqx?=
 =?us-ascii?Q?SRJ+PEVffRlNzwTmYHzmqtKUFjdwWkbRxXTNaH5V5NucCP/uYTdi4F3+7evR?=
 =?us-ascii?Q?LXmwKBR+ZGMqGfpb4lVujXjQgbsHKBksX1W0SXKQfYz5I7ASaRvxP+yBvRjb?=
 =?us-ascii?Q?1YzsGk9GnZ2fsN6hYqzkTRiPSp3jKMUIQxmmBcsb6XJpfMxqlN1S/q7LH4Q8?=
 =?us-ascii?Q?iquBxIfNV7z9gug=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/2A6zIERK7uco/L1kirsxLWSQfaIkii6Xu64+J0Vw1ylihDVx9IiwScFEEbz?=
 =?us-ascii?Q?hAjPx3ivB/RAmi2p+BUD5Ihrom+W3wr3ttOI/OmnzIHzhyU3UmGM5bBtTa0+?=
 =?us-ascii?Q?jwmSQhoBY9plP4Rff6kIxfvPKv/7vtIcyXpF0bk19frZn6HufTC54Bq+j6xM?=
 =?us-ascii?Q?ztoKhY0d8Bq4lfQpT+SFBaUepVXnrjMJqfXYEKOTGGUlvrA5eKoBylmWuH/D?=
 =?us-ascii?Q?aROcyQmjIJss2b+u/5GQ4y3AbeyDDMYDz74FjWoYMOfDj5V9gvIoHbFCFTsk?=
 =?us-ascii?Q?K6s89brJA3JLVYY+TxwtPgY3aJbO/8L3/eTQDZ+/iWdQZ6+9f9gZZ8BEapwT?=
 =?us-ascii?Q?TKLohIPAWsiK+8xlG0a7rRwd8RK3AYscmIebGVKZJEZ68Aozoq0IP9JZg7et?=
 =?us-ascii?Q?zQ6CL2mAc9TGP/zEj5S8bVzdS469sKrR74m8Ksyf6TP7XYoEztMsKK9ROXft?=
 =?us-ascii?Q?K6eXtP893FQ8XX+bRZmfDUfATjsJ+Nlphw4Rn0eq4sIrYx2cFQC9tlhlhE1M?=
 =?us-ascii?Q?e94BbzWqrDiKfWOzhurKE2xs/h54pJUmcfvVjyJF32PUBIPUWEeiWYK76wtw?=
 =?us-ascii?Q?etN7Lw5PmHYHQv1jMwj4veCw8QoMx7q9XccQvLHntG8ooQjVKiVlW00cxEPi?=
 =?us-ascii?Q?v24dwKoV+edIcoxsPhwmrQMuqCT7LjgUccf/jW0MtRkRkv9kDbn27iTBI0Y3?=
 =?us-ascii?Q?PjejDDM8CPwqg7qOfPqGBTgfN+acX3IlgIVuH2dexDlNh5EnfVdYjpWsdaGo?=
 =?us-ascii?Q?/VcIGbQ86N0WRoDT809mLLh/Tt9n2xUVYKgZ1EqWkCqOu9QCFgMNTCOgP2N1?=
 =?us-ascii?Q?2earL7shOZTwjQ8oavscm5hcDnDVGSN5S1VkwioldSfYYy2ZYbJ5JfEWblI4?=
 =?us-ascii?Q?KiZILsn3v87gB53Zy9HJUV7RZCkAl/GyLi8l/dENiX/KuAfQw+VGXLj4CowP?=
 =?us-ascii?Q?YNASnLqmn8a3M3Q0FGT5z8YxhMYtlmlIpMmFnUV7ppd4A8K7IcFd2i6XClcP?=
 =?us-ascii?Q?ZgUFFZrfBmpO7xL1PhkOFQQNKF1NfYj1KLuJtcykx4lwSWnb+xp30hNxLC3X?=
 =?us-ascii?Q?e05pyIsVVNDsKY6BU5IsHhLEF4O8K8HCFzgkevQdRuwdmHw26j73PZhbE1kC?=
 =?us-ascii?Q?GVvdGGU5thZXicib8WWwVxPfC/Am8z5O8Q4OgxtE2lCaJ/iKfYNapAbAsDKQ?=
 =?us-ascii?Q?UCDCr923nVg+1d4OTrnfnN+wUDtsgwu+GLNSmTixfXrAIDukI2SF3idmj+5K?=
 =?us-ascii?Q?v3s4yr4r6EXUG4SuRdREN6BhIddu3Pi5+9ZsJ8m09lkUmfjtTH2d7d1PfodT?=
 =?us-ascii?Q?qtBkepGIfqKiOyJRCXQoGcCTDV37L+nCc21UVUcZshspUYW08zGiyy3+Cmux?=
 =?us-ascii?Q?az6ASj45FNrvs+uiEP6mlgNnyPQNe5WDBdluwufM3uOcitMOZ/4o+85E6S1B?=
 =?us-ascii?Q?ev9pWx6J1GDICO+X8SWV7An9g9eot7zjzDFBzO6lAOr5ws/8V8txqnysO3mF?=
 =?us-ascii?Q?uil30JwX89EJU2I464WZv/tROD/ZFK++S3vS5QS83H+LQL1KL0nbLn96OcOT?=
 =?us-ascii?Q?aPCG40QQAoSVyPiFcAyNR+AXvu3ULO8a5w33Xgxl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b62e1d6-82eb-4599-e740-08dd8c7549d4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:09:13.7191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2jHcy8v8jK/B5fo1dGqhMMjX0pMwAd0yraPL1wNruC150QfueRijsyl7sSTMXfgvKyKUp912FidR8OM8F7SoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10020

From: Ming Qian <ming.qian@oss.nxp.com>

Applications may set data_offset when it refers to an output queue. So
driver need to account for it when getting the start address of input
image in the plane.

Meanwhile the mxc-jpeg codec requires the address (plane address +
data_offset) to be 16-aligned.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v2
- Verify the address alignment in buf_prepare()

---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 47 ++++++++++++++-----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  1 +
 2 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 5c17bc58181e..8681dd193033 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -598,6 +598,27 @@ static void _bswap16(u16 *a)
 	*a = ((*a & 0x00FF) << 8) | ((*a & 0xFF00) >> 8);
 }
 
+static dma_addr_t mxc_jpeg_get_plane_dma_addr(struct vb2_buffer *buf, unsigned int plane_no)
+{
+	if (plane_no >= buf->num_planes)
+		return 0;
+	return vb2_dma_contig_plane_dma_addr(buf, plane_no) + buf->planes[plane_no].data_offset;
+}
+
+static void *mxc_jpeg_get_plane_vaddr(struct vb2_buffer *buf, unsigned int plane_no)
+{
+	if (plane_no >= buf->num_planes)
+		return NULL;
+	return vb2_plane_vaddr(buf, plane_no) + buf->planes[plane_no].data_offset;
+}
+
+static unsigned long mxc_jpeg_get_plane_payload(struct vb2_buffer *buf, unsigned int plane_no)
+{
+	if (plane_no >= buf->num_planes)
+		return 0;
+	return vb2_get_plane_payload(buf, plane_no) - buf->planes[plane_no].data_offset;
+}
+
 static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
 			  unsigned long len)
 {
@@ -610,11 +631,11 @@ static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
 		return;
 
 	for (plane_no = 0; plane_no < buf->num_planes; plane_no++) {
-		payload = vb2_get_plane_payload(buf, plane_no);
+		payload = mxc_jpeg_get_plane_payload(buf, plane_no);
 		if (len == 0)
 			len = payload;
-		dma_addr = vb2_dma_contig_plane_dma_addr(buf, plane_no);
-		vaddr = vb2_plane_vaddr(buf, plane_no);
+		dma_addr = mxc_jpeg_get_plane_dma_addr(buf, plane_no);
+		vaddr = mxc_jpeg_get_plane_vaddr(buf, plane_no);
 		v4l2_dbg(3, debug, &jpeg->v4l2_dev,
 			 "plane %d (vaddr=%p dma_addr=%x payload=%ld):",
 			  plane_no, vaddr, dma_addr, payload);
@@ -712,16 +733,15 @@ static void mxc_jpeg_addrs(struct mxc_jpeg_desc *desc,
 	struct mxc_jpeg_q_data *q_data;
 
 	q_data = mxc_jpeg_get_q_data(ctx, raw_buf->type);
-	desc->buf_base0 = vb2_dma_contig_plane_dma_addr(raw_buf, 0);
+	desc->buf_base0 = mxc_jpeg_get_plane_dma_addr(raw_buf, 0);
 	desc->buf_base1 = 0;
 	if (img_fmt == STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV420)) {
 		if (raw_buf->num_planes == 2)
-			desc->buf_base1 = vb2_dma_contig_plane_dma_addr(raw_buf, 1);
+			desc->buf_base1 = mxc_jpeg_get_plane_dma_addr(raw_buf, 1);
 		else
 			desc->buf_base1 = desc->buf_base0 + q_data->sizeimage[0];
 	}
-	desc->stm_bufbase = vb2_dma_contig_plane_dma_addr(jpeg_buf, 0) +
-		offset;
+	desc->stm_bufbase = mxc_jpeg_get_plane_dma_addr(jpeg_buf, 0) + offset;
 }
 
 static bool mxc_jpeg_is_extended_sequential(const struct mxc_jpeg_fmt *fmt)
@@ -1029,8 +1049,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, payload);
 		}
 		dev_dbg(dev, "Decoding finished, payload size: %ld + %ld\n",
-			vb2_get_plane_payload(&dst_buf->vb2_buf, 0),
-			vb2_get_plane_payload(&dst_buf->vb2_buf, 1));
+			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 0),
+			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 1));
 	}
 
 	/* short preview of the results */
@@ -1889,8 +1909,8 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx, struct vb2_buffer *vb)
 	struct mxc_jpeg_sof *psof = NULL;
 	struct mxc_jpeg_sos *psos = NULL;
 	struct mxc_jpeg_src_buf *jpeg_src_buf = vb2_to_mxc_buf(vb);
-	u8 *src_addr = (u8 *)vb2_plane_vaddr(vb, 0);
-	u32 size = vb2_get_plane_payload(vb, 0);
+	u8 *src_addr = (u8 *)mxc_jpeg_get_plane_vaddr(vb, 0);
+	u32 size = mxc_jpeg_get_plane_payload(vb, 0);
 	int ret;
 
 	memset(&header, 0, sizeof(header));
@@ -2027,6 +2047,11 @@ static int mxc_jpeg_buf_prepare(struct vb2_buffer *vb)
 				i, vb2_plane_size(vb, i), sizeimage);
 			return -EINVAL;
 		}
+		if (!IS_ALIGNED(mxc_jpeg_get_plane_dma_addr(vb, i), MXC_JPEG_ADDR_ALIGNMENT)) {
+			dev_err(dev, "planes[%d] address is not %d aligned\n",
+				i, MXC_JPEG_ADDR_ALIGNMENT);
+			return -EINVAL;
+		}
 	}
 	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
 		vb2_set_plane_payload(vb, 0, 0);
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index fdde45f7e163..44e46face6d1 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -30,6 +30,7 @@
 #define MXC_JPEG_MAX_PLANES		2
 #define MXC_JPEG_PATTERN_WIDTH		128
 #define MXC_JPEG_PATTERN_HEIGHT		64
+#define MXC_JPEG_ADDR_ALIGNMENT		16
 
 enum mxc_jpeg_enc_state {
 	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */

base-commit: 2e79181dfc85e1347a8655ea8d8a314158155c52
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.43.0-rc1


