Return-Path: <linux-media+bounces-43217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5BFBA1361
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5E3A3BEC3C
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 19:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C154D31CA6B;
	Thu, 25 Sep 2025 19:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aQmuu59d"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627D021B192;
	Thu, 25 Sep 2025 19:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828966; cv=fail; b=az64VhZ2ndozeZSaFK422QyUrLZwFKyffjughVFMVsrYNoEsAVwZdsLrNmRDwj+96KKhiookItrXiIWU1DybN40Jp/mJTz+B62G3eJ2m+vDICABAA4mEcYoHoK7rF0mbnxyw2WjjGFSCT3glJiknv3iEQQJ8vdUqgS/+fpHYYRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828966; c=relaxed/simple;
	bh=U8H5ATuty0YVXo42z6C3EnOxeAZOBRAJW3nzoOQ3M/0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=epVHxXLv1yN5PVM1VJFkriuJlf7um1UFCHxMJ8VBGhSBJWeiI8iEtq+rtk2z//ZK0dSkQPS4QAf1kYyjU5JNGEQ8Pctg6C5R1sDEkR2Ed8f8zoA2IuQ8Tt6AjcGcqTLBkcgWOjm/iTfaoIyu37SsH4x3F+jgeoYRttieTY9j0j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aQmuu59d; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVaQEh5BJlTNvlRFi/ND7XqZN6Rdmu2nstdaj3E9WJH8xjbvmdTwN3TibKM3KzrzbsEQkYmFK9qUfDHOyQdviDMOpLX2bZ9NdcY9Slbzr+cFofIayych9llFLbB0S1zNjoEkT/SVcEVkiT32tcMFTWRjNnvoAyl3b7F95ixxtn2tXasZNSrpuy1TCbldnWjURgyRBPboE+xaqmE86Xh9FOTJaGpGShooZG+CY5IypYaErzANeCylExOFBhr5zsc5I8LG7DLrDVG3w7KjLVg4cquFVCjFv39WmPJUX/gsjNFx57apszmC/VuLRpB1qiUedkWaCLMSCYdnMiJbrUiYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1AM7iXhlMhICbybEV+PAHhBucDsS5d/NcmgWJFqa/E=;
 b=RiFTM6oOs1sDkYPymDsx4DRtQtsLqISbFtZO/rnKwDX5TciHJXPBpRSkukbCcyLh7aW4d2BIsWttupPIysU+xfUKt9htIOyu9mkQG8SW5c9lU5r5NCccIow/FUL0whJ3gWfNPfOLpQ8pxVBak8NDgQ04wsyjhx1ckabFSK2eSwByZqadfKFe+BM46uecvuLZBK8Iqb0fM0prv5IZj8eyW6m21mck1Hgjzu6Q2a65utxplx7KEm/a0I6wiFhIlzVzB68Izbd5xaIUUKuVetmNOLoFRzrfqGv3mkvwn2AiOOyCzsriTkUNP/+iDhAPgUZfMY5plhLOBi5edMqbUAPgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1AM7iXhlMhICbybEV+PAHhBucDsS5d/NcmgWJFqa/E=;
 b=aQmuu59dFsVpAGryrcbO0RaelR1/ja+09WXRbTdMRg2r8eP4WAXOoPq/OCcmwdp7AivMAyG1gKusaLaoUFPK7wtaYS4TAW+r87f+u6A/ctMkL5ORXfQtNR4YS1Taf3mfRM/1sTXZxrjrqw5cu7STbyKKc8vTV4KKAf45rvDFPxvLTKhGjc0GM/oln+jVzJ4FpvblS9z1fhI30sgLlPjovRkGuJckufqZCfq03EUx2Lp7miQqxElSG1iS59udhiOfCBfSw/5hqEa0H6W6qrm+eUUEi34LpfhC1xBXdlsMriIBbIkQfqhau5C/cCn/w1jgpJANVz7cn1xpotKyPcL+LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 19:36:00 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 19:36:00 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: media: fsl,imx6q-vdoa: remove redundant ""
Date: Thu, 25 Sep 2025 15:35:46 -0400
Message-Id: <20250925193546.305036-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::6) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAXPR04MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: b2eb416d-dc41-4624-50d3-08ddfc6ac1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6D5fRwdb5TRqcCxEvg9xp/TNIShfi4b72MjkLQErYdznlJC159J3PFqm+kd4?=
 =?us-ascii?Q?WiLwVRJDKuVIT4jAxQyGl1Uk1kuz0k4Nnq3WZXYtenqvMxL89IEfaMjV6Kab?=
 =?us-ascii?Q?Uz000yCREgCDbO7DYhA6f+iTbjEms1mP9wo+cZQcJ35ye9KbuM8cC4yKdpmO?=
 =?us-ascii?Q?7m0lx2O1cg9U5eNkU/4xmssegOq4hKNzu2h1noT/mBAz748yBvmQSkAIUuJH?=
 =?us-ascii?Q?PKcn9uhyE8LURudD2jzmksZ01JrW1Bqx0G50rZnOetWn7WCQeujahFUB52l+?=
 =?us-ascii?Q?VkiJMIRo3bhXkkKE/lPUojP8tLUPXlJI2Bz6XHx8PLbNSydIgK0Lss5SDW2f?=
 =?us-ascii?Q?CVIaDfIPPbTD01oR1QaZ8YGwbKYm5JgJPMggLtCKSnh0a9EWTDrj+tpNiVJK?=
 =?us-ascii?Q?j0+drm2ZTs1S4YGFiR799PRFRm/+yedBHqXw/jbqYRFsVGf1K3d6owyMmjbG?=
 =?us-ascii?Q?burg0UU8qWdNoiAjQM3RbIy+6CzwQVqBzMUeTmOyxxNPwBid7MUF1jX4pEX6?=
 =?us-ascii?Q?DpSfewVqpGo8w/bDjIXv4ujeEpKPV292m7BbVArQ6DcC0Va1oDKK40h9wzCV?=
 =?us-ascii?Q?+TVNBzb20qguBTuo8SxUGof3xzm3vzpUzTl1bKzNfN8EGsPaufy0ybQzST6I?=
 =?us-ascii?Q?PzbNar4ohn8z7Rans8w3qOePgMb1UqrdLlKXnZ/vDNeYDEBF+ABgkVrjsCwa?=
 =?us-ascii?Q?fBUq5/32tCcaXSiBKLGd+6FFOZ9gCotf5iyFr1lSYyMIC+pEW0QDG4RCd/F8?=
 =?us-ascii?Q?7NuYxKhVwNlFQU/v7cnmtDLE9JHmCi0BzJxO6OQWAlielhL3rPN3sNub7yV2?=
 =?us-ascii?Q?zSsi10rwZL344qSTcJA10XhEcv/KtnGn2WJWL+XAK3PvjJ7D4McuapvUN+yz?=
 =?us-ascii?Q?hsX65hmpD76BwUXpwoAVGmH15aO/cLdgFhlCRWP7A5ONAokSx3neWbXbwfUj?=
 =?us-ascii?Q?J39zG36E4K/dve2bg8Nt87ofjeMZ4ExTqFP/nfkd1pCvvGZ8MAusEsngHuaI?=
 =?us-ascii?Q?YWrz0XS6lqdqgKybpPJbawEwFamb4og1sufMpSvNrhqD3jFF+ztWLLNy243X?=
 =?us-ascii?Q?4zT6grVMk/lEu15B2iplx23AfAyO9FaHz9Sdkl8vchqOqCeFas8n1JiWMTa0?=
 =?us-ascii?Q?CaJIBf5e/H9AsJqeFBS1/ogfEoOF6xxDKOTxgcE+pbAlyaTUOqJoM9jr88SI?=
 =?us-ascii?Q?XXeH/Jz5Uo1Pu+F4qdQ8ZApNUt9+TtXb4s51cIDpQwuhhu0+yDEBoljjEFQH?=
 =?us-ascii?Q?VluK/JYZHtLQZwM6BPH0+6Ul4WcfsHbyib7LymCEzcoomRp4+N4hWLAMYp9X?=
 =?us-ascii?Q?GsFBQ4vHcbAjVCuVA4GDeXh6aiQaMJzghpMoJ7gDtpS7swkttO2late3aixH?=
 =?us-ascii?Q?x5kwbsgpIHv9FUQBES/7D/KVrhHN1m3ShLgawzk2mVy/OzjPaDNIDWaHdS04?=
 =?us-ascii?Q?5Pi07EBqt8Xghm5FSBTV/ktG/JtAAwohqPkyAUYdGNhi1EJ20qq4ljIkiF3x?=
 =?us-ascii?Q?rleEfjCt5cbywKi071nTdbkrE1bc9E7GmZB/EpjvXZgrHXLp1slvUglKdw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5b7zIATa2XREeI3O24rd+pbpeAcgfOvLXLnc1P7j30PzDc7WI/5S5L2x35SA?=
 =?us-ascii?Q?5YBO0+wGgCssaCXLyrPtskxMJyLPAW2SZzXigl9MAX6/+oNuhdbWUU13mLRq?=
 =?us-ascii?Q?zburLR4V93K17OJI5UU41mMtFHzGEhHbS4S4pYUusLNMed2ysTw5kj2a0tsd?=
 =?us-ascii?Q?UdoTSk3XfL5ZekEDUWtjJReozVyAYCYBXJJyK8rXrZdpG9A+wUEczMxT542t?=
 =?us-ascii?Q?mlKd3vr+NCy9xi6NPI35tFl/LgBpoTzmkmaklz5JZn2E46xLJzZEJ/Y3OQiI?=
 =?us-ascii?Q?4cUE81aXCBJkUy79m98f9J6aFqRrFChNNXnj17LCcqcMYTmQsX0RvFWuW2Un?=
 =?us-ascii?Q?q0KMJ8j882Sv/GFWkm7MsQsDhdUeHVnYw619c9DPnAVbE94Vl4zKY380cuUo?=
 =?us-ascii?Q?fk5z7ej6j+2DvNwcp+DItxIOA3k4P9368cZs8twpf7ligwBBj1/E9Wa+UNUK?=
 =?us-ascii?Q?a+lZIneAJnPbHB7cFNzE5Q8Mtm8r6q1VSAcSK0vTta18tRe/TBaZjJ1yIUnn?=
 =?us-ascii?Q?NvUJE8wj4DK5pDG6O19iIxCvMNtSuljhFPrmd//0X+kdAiQuSMOlwpluJbVk?=
 =?us-ascii?Q?2L9SJW9dSemSGn1GmpykZuhmNe2N/Ro15eBMJ2aQFtxNJxCFrrO5lYNetBu6?=
 =?us-ascii?Q?TPv+i0zvrgk+KA/uWrVZFdBxYYZ4cSc+TQE7ZtuJCs75sV6AIPaateZHbXe9?=
 =?us-ascii?Q?1OoD1RL4OQz6DI3QWcQS5f/swEeTYFx4LkiMUsiRQaHFCv3EBOprKZVZItGM?=
 =?us-ascii?Q?rMCic84glWWBHh5zHpNB/MbF62DEknYVg5z7EErIQj1QHELvxkqhhiriAqeb?=
 =?us-ascii?Q?nji6+hUMKcKPnddLne2FQcWs/sj8Ll1R3NqemerH2aM9ddSRtr5/CIfWvI6V?=
 =?us-ascii?Q?DHm3yGc/1LG6FmT4S4GpkCx3q5UbIbhiKEQ6Pjy6/Aeb0xg4sqZw7Z1nsSU1?=
 =?us-ascii?Q?yreWoqNtVhVI/JlUZa2KPxqzJazB2zjIfclS6EJCjYA8ab2DF6Jm+5FT9GnW?=
 =?us-ascii?Q?4hWeAyI0aYhcCHTso0Zv3G4WFawvxQK+nKB2wp/g3Wu6LoApmszHOeivOPU9?=
 =?us-ascii?Q?cs7IL7It9ciXV3UHvEBST4Dq2QgUG0QQMeMak0xH8j97Yt3JkmI0eq5jGj+S?=
 =?us-ascii?Q?JzOCHymP1LEq3YC7AMWSZIG+ZkcSjpcUF3uMBn0xBuw7UQr3Hh6XSXOEdyNA?=
 =?us-ascii?Q?vKKKQvo/RgaJDlsxx+q/oIJl23uJ2wDXN2MP2Q8m/xV3N3HK42hDncTgG6Sv?=
 =?us-ascii?Q?iE/xCykIe4gQUWw3FoPVwq/a9gRxcbE3KQKIReEUCG/6zp8H3eLEoPHofPm0?=
 =?us-ascii?Q?lx1Q5afRxpbNO2tii/QR8qpz0cVDAd/OfLCua/EKVfB9NTqTwEqjN2h/07No?=
 =?us-ascii?Q?HtK2mm6pbqJng+9fm8WkU6RMbiUzpEkrswmwVlK06x8chzfqSStwbZhBzIhN?=
 =?us-ascii?Q?aNQvy7SbREpMa9wGJD7XAekUbrPyl1CYhgzUHXmXna8WM+Sd75YFrHH+frpb?=
 =?us-ascii?Q?p+pgIbk4bmPQ2LrOlfBviTuhkvQ3trGugOa/WEyvyuYXYhh/ZCVJIUtN6Hrw?=
 =?us-ascii?Q?p378ezPfaQIs5jo5s26xBapGqJR2sqzRoj161WW3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2eb416d-dc41-4624-50d3-08ddfc6ac1a7
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 19:36:00.5132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k271bUZltmv3OVkXMMh3/O6RHXISKE9Rp69D8XWAWik6FhahsYw5RHKZxXJCxxNJbG++ePM5hl+M1ATXiBA2qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735

Remove redundant "" for compatible string.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
index 511ac0d67a7f2..988a5b3a62bde 100644
--- a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
+++ b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
@@ -16,7 +16,7 @@ maintainers:
 
 properties:
   compatible:
-    const: "fsl,imx6q-vdoa"
+    const: fsl,imx6q-vdoa
 
   reg:
     maxItems: 1
-- 
2.34.1


