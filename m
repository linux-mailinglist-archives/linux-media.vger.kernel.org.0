Return-Path: <linux-media+bounces-30518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 888CFA9333A
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4B6B3A9EE4
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 07:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685F9211460;
	Fri, 18 Apr 2025 07:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ui7K0iv3"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2048.outbound.protection.outlook.com [40.107.104.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FEB26A0DB;
	Fri, 18 Apr 2025 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960179; cv=fail; b=GGSEt2A4nBUd3DtvPeQmi4slRp272CYUZMVCKOreUEeJy6ynx5LusVsrz3bNG4wGB8ohBjKchuCAfoaZ58vnKP68eXEkTjCAAaGB5ZmTCmSa+RpM31l+koYYAsQL1ldBZJL2GdeMjbBAQ1kLwk/7PQWIWr/NYNP0nHQmMaAiSMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960179; c=relaxed/simple;
	bh=xK4fiPmnUNxqu11/3roUYkMk7rWUPRwaWXNZQkx3RpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O5BButfOecHgxQVr7KheP2LjUL2m6QzKOVG1XFa7QX4DkAFywoR40wrAG9kfkJymnFCiffkNHXRcVXV3iVMrUlhqxuzlQGMNvJATiXiQudA/kHH+WXQKg27NM2zEouKpf/6U5coS6HZIuCYFkdiPZ2VlIGGX+UiX6xwlOlOi1E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ui7K0iv3; arc=fail smtp.client-ip=40.107.104.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDTNYvQjfshhQLDALytR2y+c9d56mvHB71slY30WRDY39CfEvkdkfHfBcpbH8XhLxk2HhArLGuY3/dV1Y+TmkzlawOaoWW2YtYNCtEOEgdUK8L8Dt32ZQut3g4RBvAjL7g18k693vUMqwAzqKl1YtRTHMk3rBXKSEoi/OkH16Ld708hQLRhGschf+B2vp8nbWyUXDOJKHsls/byL4+DOoko8b0wURHCGHo4eio4ErIa5CwQ/Jsi1xtZLOjsAea0tW/LpUjeUvjCZGrTPGcyuHSm2JszYsXAl6tg7JcYzHSWRDJfWsHUi1s5qK5eRvKVRQovJjOSHMoVAIrLDIHbZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqWATxGpOSk5DcvJTw5qOdtRluRezYzDdrMcnoZgEIs=;
 b=aHFxrJMAs1KT2EbShNymjaZB8XSIRkYLM/qqjbGrHDLefusDn0PDTc54Gs5XEtsKWiyrGZPzsjod4ZlaVVWSoL1ryArAmpjeJc4LfNFxk1fuUPDDqDTz/WQn8Nh22xLFN+L2rfCF11VGRcCnVp7IhWcDOAWJp1P9vQtt7L9Lkc3Cp+VwwMtEZ021ZkmPbJQrJkrffQ1VNFprpmPe+zMuyHBNjbKDEEjxhBBs2egGSf83z6l6cgd66AqSiINK6X4Dm5wp0SejP/SDi7FQkds1f4NmrfRN4jyqIpgM1mSz7BLGLWfmVZuxXRsucGZd2+fcyyJTHUwQ7OSk0KSDX8wcUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqWATxGpOSk5DcvJTw5qOdtRluRezYzDdrMcnoZgEIs=;
 b=Ui7K0iv3qU+KvbmpBVXoRxp0OnmQNBatYYRaYeT6lDZiiCjl+IcfS31RNUcXtV5RSW9s/4eTTNVnYhRVOeV5LbPCayP4Itn+IX80YrzCod1u1FygD1alqq4qZLDWmZvX/CtDxOx7vUNyu7aYKMbcqFc40c1aiCtnL5AAhhQ7YlcjrCDvCoAjNmEeoVkAWMKQ0vCDS5USWYL/CY5Q3fpY5yxpQPkXPpv2EXIL+G90MpayTmFyh069da9Tp9lhqNhgDVyU9iT+K5RndOT9vAtV5NrhwnRDhnFh+1Wm60sv5eLB/IUExP2jWT/cxE2Fhuyn/cJuQyuqe8c+B9xpm3VIFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10160.eurprd04.prod.outlook.com (2603:10a6:102:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Fri, 18 Apr
 2025 07:09:34 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 07:09:34 +0000
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
Subject: [PATCH v5 2/5] media: imx-jpeg: Reset slot data pointers when free data
Date: Fri, 18 Apr 2025 15:08:18 +0800
Message-ID: <20250418070826.141-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250418070826.141-1-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0174.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::30) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: 67742a20-969f-4be7-a15f-08dd7e47f915
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L0F3SZeh6ANTg+wCtesd789wR3SKCmOi0yLoeUmW6R/alSTuNLmQi2SJK/jk?=
 =?us-ascii?Q?BjCyfWvh6zLnohkgr1L5HaVtFeuxNOU4d8YMChwc7rmDzo60d1GHw49Tqv0G?=
 =?us-ascii?Q?gb/UmPWTJ6lPir3GR3UMSQ8AHthUddRZT2GpOq/CnE/PadZ2T91NL9ZcBOAS?=
 =?us-ascii?Q?lxJbdHHCP3C/pHyKP7OU5ANEyN3zkaE2Hnk+fngh3ltVabOwgrFq1Y0MhJ2x?=
 =?us-ascii?Q?fXB2Eo65IeNyu445VRP4DE6VHPDGGoCkdHknGVqBxuWRx4zoXEWsDTkSCSsF?=
 =?us-ascii?Q?9NaZViTHbl3Zd9qilOSqBWeD2cW6flUCKK0cuViGkCYtP5+YVeY15uP9KH+E?=
 =?us-ascii?Q?JHgnQjha/eQdJHwEZeZfsPaPlBLu/BF2Kb8W8vhzupXukyfm0OLkG6ut+68h?=
 =?us-ascii?Q?shajcWme6sKEeSA5CwLi7sEYmPZ7o9V50kt7Dan7Rb/NiV4AFizX3EIWaJBT?=
 =?us-ascii?Q?EG5uzLRNwMThOaQrbkma5AY8P1TpfHRG1fU1GbC2xLENLAxd5yXqa6vQSAD1?=
 =?us-ascii?Q?izjbdvFV6sU3x/lb0fqyqdUduzZh3WX+yXgxonHXHbESD4JMYEN5S2bDvB00?=
 =?us-ascii?Q?dqQW0l0DPZFa6MzTD9jh1qCU51A2vfBzwzwcqRQgIhnAUIW5MDHRjNN1NIdy?=
 =?us-ascii?Q?ss4YAaAqXog586cR2jfkn/VIKRQygt5XVTw1wrODJjSOlGfydILfB1IwBz/l?=
 =?us-ascii?Q?fZ0aZxGiT6hJx9gM22ZkIzIJ3z0xvqUSOdS3uKsEEVBlJ7Pe2095dg5ZfKHs?=
 =?us-ascii?Q?4OX1PsnKg1qqNTsAU5C5vgDDNOv3dKaBRfRXocpGEFHK+x2eR5yXQ3i0DUSu?=
 =?us-ascii?Q?EBmJ82kzCHOgFzPMvjl8ctuo9O664A50OftCG5S6wmmysL/zKAIqX0rAwo9a?=
 =?us-ascii?Q?s+sh9XCjrVeQ24U23q+JhKVSJqlpfR65tD3aObv0SemHvJyNbdZ1H5yooM+J?=
 =?us-ascii?Q?cIyef2D4FXVyClrKcKdUyG1HcU5EhlPEEvy894NbNfjjj0iPRBzWX1+OjNyG?=
 =?us-ascii?Q?JagryVlFBJzxY9RNY5U2b3q+wRjJWr105V55rtgpOjNHWML6SznlizFc8iPW?=
 =?us-ascii?Q?w61j3vODV8ux4QUnmFWs18fVaQGqLXLpNcgn05AUfWf4FGpqBsCFKrUMjy9o?=
 =?us-ascii?Q?SFwX6dJOo9EO2moNuBYcGFG7t/i1OnQXln7s0Rdc4kgJIva8MnRHNPjvEwr9?=
 =?us-ascii?Q?9W9b6xJr2XojTQ2EzPRXjplXfOjFBLFKujgiul6qnwWbM5k2ijXsNRcQnH2Q?=
 =?us-ascii?Q?wMUc1IWb3YBarQaU9pORPBTHtNx9MXmvDH1jJMq2u2bCg0OGcO19Kmi8kf7U?=
 =?us-ascii?Q?4hEHTCGxqUbF3MyxZziGIi0GXeMsaTceaVlEY2E55WY3khUvGoOelPB5o/A7?=
 =?us-ascii?Q?PDsEie46fGcaRsqsC/Osf8SxUck0GI0a8EkbDRLVkWmXRHtSz+1WCOOo8tLc?=
 =?us-ascii?Q?hjTTzMZ1Jw3h8Qe8+lxjXOmAF5AfeYRs5yjpp+qKnwn1qQBftmb4RQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HE3M6MZv2RWut4ivi653LxOoXd3WCGDgpftu7YciAWHgrWQ3qw6DP9rGz8ta?=
 =?us-ascii?Q?NjiIl82dmtLsP+iRO9Ak6c8GiSz+AM5amSBx322IVSCCXGxHiz6iFApiMh3F?=
 =?us-ascii?Q?cqR3oEjHKxGhcSA9/V/4SrroLuZIwe2E2QGuyikDbn+36deri5PzfkOkF7Dj?=
 =?us-ascii?Q?/6lf41Aoq6Qz0WyxcxbkYjq7MKHb+PNtbEPkWIWZ/yJw7b8Lb4o14o2EH/hv?=
 =?us-ascii?Q?SzjlSB2rKX+FqS7lZyAmLcKehv+ZxV53SmPYZpJfp7ibczKz7rLlAYDmCc3k?=
 =?us-ascii?Q?92hxWrJRKqSfpUu6jcFMLQHrybfVaCsmMaxL9r/EQFtnVwrND4y0BVB9XjSr?=
 =?us-ascii?Q?gVzMOucZNce3Sy4GAkF7UegHBBoIe/CalX6TX7KeSAOPfr7EngDvK7w8pxLJ?=
 =?us-ascii?Q?Bk+Tivs6ie9AfbkZ3Hnm+MaNSq1iZcWcaPDXU7p3QaZsc0XHwAL2CfmwNb/B?=
 =?us-ascii?Q?+YC9TmIqKEpCUGXGglkIIog3mSF3siCigAKKxbjI07vSSFglpFtG1tV/DESF?=
 =?us-ascii?Q?kj+ulNDdPQ2pDmpYrWZ17/o48XhI1yHaDpGCoG7h712+3gbuGil9mmyaq0Oh?=
 =?us-ascii?Q?xRBA+j4YgusSxj8UHhCwUMwuEmK37ASQkndY/JozQiES8p9NzV2Xjop9ZlDq?=
 =?us-ascii?Q?KSvZC4UN2rA9h5AXAujws7gF/5iqUN5giMir054StTc7r5q5XvYbde+pn76m?=
 =?us-ascii?Q?fqOx/W4R/kHYiAHKKU+xm1HDLAPFTojMzgtQSPADWjkBKzIytCnlWLg4Dg2d?=
 =?us-ascii?Q?LKqh5q4qF6J/SaWpWeEYcJeQ3gljwL2Nw1TAGm/iz96c+yYVnZKYpl2nStrb?=
 =?us-ascii?Q?2HA7W96hb46OMD+IiU93+28dSopfpbUGfpr4IYTU0WrtIUMrzx6g5zKZjb8k?=
 =?us-ascii?Q?HsktZiQbX861OCJ0rc6N8CFVM6y+mqZZ9hFFD8s3jMj+6xIdr8qpDQqa7ru4?=
 =?us-ascii?Q?5g7cvz0wcy8G71VW7aCfTkPdhRFFy7jUDD9wZcjuLvpvcFpTAyTdYlRJG8bZ?=
 =?us-ascii?Q?qlFOmnbwncjQVDEWYiQYiEL21En1/j3W4ENoXC3og3j32F2C6g2GYyryBOJ2?=
 =?us-ascii?Q?dskyg3LjOtNOB9/lfbDtBApeg0Zz0XQkO3TiQLydbq614C4brXAeTp3CU3lw?=
 =?us-ascii?Q?TC/0KlBzWNlwGh4FYCWlbLTxP5ba4Ale2lyzjZp0uMYB88oIjx9N2YyGJ7K2?=
 =?us-ascii?Q?R0KgrlxkiUYXna5peDSk//7Ql4bknJXJAvM06f40aShdt21+k7tAB2EU1HY6?=
 =?us-ascii?Q?9h+FaGpXm7RNUZu6m9fGwuypxCwjj0XOIEuxj255lS+mULOx1yhz0rRS7ivn?=
 =?us-ascii?Q?yuTU/q1kz78e0l91P54RuVTodd2LCTk0xD+opEpsRCm9hwz3Ak6MO3zFGNyO?=
 =?us-ascii?Q?FG7y7Jh27HB5L77I9o8gsF8G1EMuYb193V/zRR79EnnSWZG/duGsrIi2wQlQ?=
 =?us-ascii?Q?QIeEBu5zjr+vHfcfTrBjQ4V6+aGsDYWTsOCq0LKgXu0Z0itVOo+1DiSAlLA5?=
 =?us-ascii?Q?Hd92HMuw6gyAG7QB+q/56dPSbrvXnn69V45akvdmSAuq3KYJdtfCRqvnYsqA?=
 =?us-ascii?Q?L2BVZmPuYolTDikBpp6TN/zJcAPnSG3Wsg8IlhoH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67742a20-969f-4be7-a15f-08dd7e47f915
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 07:09:34.8475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LW5jeJpehetsdPs3FIpvjhu4EIxo6IK+/A3YWx/xANo1gLXq8/DLDR8+PxQAqiQwHVga4rA3BMJ6RsIqtUbv8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10160

From: Ming Qian <ming.qian@oss.nxp.com>

To make the function mxc_jpeg_alloc_slot_data() and
mxc_jpeg_free_slot_data() safe to be called multiple times. Ensure that
the slot data pointers are reset to NULL and handles are set to 0 after
freeing the coherent memory.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v5
- Make a single patch to reset the slot data pointers when free data

 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 2f7ee5dfa93d..b2f7e9ad1885 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -758,16 +758,22 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
 			  jpeg->slot_data.desc,
 			  jpeg->slot_data.desc_handle);
+	jpeg->slot_data.desc = NULL;
+	jpeg->slot_data.desc_handle = 0;
 
 	/* free descriptor for encoder configuration phase / decoder DHT */
 	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
 			  jpeg->slot_data.cfg_desc,
 			  jpeg->slot_data.cfg_desc_handle);
+	jpeg->slot_data.cfg_desc_handle = 0;
+	jpeg->slot_data.cfg_desc = NULL;
 
 	/* free configuration stream */
 	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
 			  jpeg->slot_data.cfg_stream_vaddr,
 			  jpeg->slot_data.cfg_stream_handle);
+	jpeg->slot_data.cfg_stream_vaddr = NULL;
+	jpeg->slot_data.cfg_stream_handle = 0;
 
 	jpeg->slot_data.used = false;
 }
-- 
2.43.0-rc1


