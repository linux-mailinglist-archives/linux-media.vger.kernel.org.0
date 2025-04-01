Return-Path: <linux-media+bounces-29118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6926A77738
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74CEC3AAFDA
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21F81EBFE8;
	Tue,  1 Apr 2025 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aen0pOH+"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013050.outbound.protection.outlook.com [52.101.67.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0B01E1A16;
	Tue,  1 Apr 2025 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498483; cv=fail; b=mcH6OzPS+8uT+Zv2ToEqqppNo6OD04OfjxSOT9KVGN+SwNrikOC2XoeVzUkNS0YW9Hc1AZ7JBpXY4e8F3jrqjAB/X/g8b3OrO2G+XG1qERoYPyJcguLVfxdcLf3E7YDCne8h/OejeHUWc/UbtB2sO2YDi48FE8y/LUaCjlyp4zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498483; c=relaxed/simple;
	bh=Qb5irVb/Kz5XA+aHPUEOdtPFJyyP6AL7zllEv/252gY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=S7okw7Skmel5tFpRwGn0beNOw4gYUHwl/MjOLg4sm9juMOCV9NOZg5d2fk55NphuCDHdujxqDYsSJloqPH+rbRgg4favwryV5IoqPDt5WPEq3Tj6lbwPBZj2tzPkoN0JHxTh9kWKz8vesavqZWO93v2amfUVGQNNhymIyl70VgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aen0pOH+; arc=fail smtp.client-ip=52.101.67.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUUMFeHJdYt90Ir+DED0ZQYebN8UARZnkcLhfRwyJqfgYtGI2lWWoc/V3Cm6OvmUFMacqEKYjG5dy21lF4u0M4R7eFPB574ehI2KHsX7Z2Gm2pVTakgll09OKWUEXC2+4gJ8x2/wXOH6+UOFrYMpavoYmNHX30gSdvP30n9Bl+c0cTuXNUIRm4tuDXwPapf5EM6zmTJizyTxzwY7PjEKOu/Mcr8i+V0h4dxuZbRP/uPUDDoZZj163LBPZcAjUwWP5yirhXlj/f95J+r1TFpPGJwRLPgKtJxxmvgkRaR0m0l8p0AZ3e7ZYN0ZRl+K0dyZuf1enE3gWlz1z51dj9zPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjpFCeE8U/vA4Im1GvKDEDAWyr0Faam67XP/kLqCcXc=;
 b=sVx8FunAm4frbCObWYTHDnVgxK5GQ+KNdBL2KegT8zA4q+0qhneUVB+TZqa205nddmtUYyeqRxvqmd2nosJevvXSeX6n68vQ+p8ILUvBR+HKRMJg7uFHyIwWRqDMNAZ9PvZ9xdQh4QVIeDiImAH+/B+5eD7pV8PBdgwCX6+AjhIsMawSL5rThKkbHGO2mUThOAMckS+B9xmuomqSWoyy+QzvbIK3FGAbgdgkoPpvmofzMr11kLg9eAnxAQkcCRA8tyaZ5k4qEjkFmF8gG7HBbXQdot/OMpgF4wK75xOiaKVaz5WSsjUfB8ES2ZoX2Fnx4aM3V+GLdW1cacJ0TTq48A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjpFCeE8U/vA4Im1GvKDEDAWyr0Faam67XP/kLqCcXc=;
 b=aen0pOH+gGri5uT0Et5U1KcTGRjPh3XrW5kopC/9daxgWL0Aau3Pv4A9SbpOgXxKc800tJ7RBr7G0UYg8B16cnnCvvLI5lNltEKDbaQaLvBRr7JdkryFyXnQ+mnbaJkdQCXUNj3r59zOiR5M+0nw6EdkcUkWp5EygsPOII7W+n0ajS062QBzbBdHpUIxShiL8xZvKwYtyP13nQaHHmOBRiatrGkhFNeDO0fgL0G1Wf1sI9LYpws8YWYQmIJ5UFyxZa5EKmvi0eA86hCQ9RqR8LAxc+OjozMQ/CNG1YVQ1Wm9fnDdmY+vtUHOqoWncXtDDzVcJOJaH3baw5jiMvRkAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB7491.eurprd04.prod.outlook.com (2603:10a6:20b:283::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 09:07:57 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 09:07:57 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/2] media: amphion: Reduce decoding latency for HEVC decoder
Date: Tue,  1 Apr 2025 17:06:56 +0800
Message-ID: <20250401090659.1702-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM9PR04MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 781b24b3-7cd5-43a0-dcad-08dd70fcb1af
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+MfDk65ardQHGtBdaKKWLDtssQ55eKXUSAlYDpSfV03xTe17KdihSA8LE7E/?=
 =?us-ascii?Q?DSOCb416zXo9QKFSZ20CdosSmNKvOqnWdgI8TTIhficjxiG/ykkDhriDQpO0?=
 =?us-ascii?Q?swKJErGV8ZdrNUKGt4BG+uYk0bFRA9ZIdS/GbYVLNb+dSl0MYp963FoF46xi?=
 =?us-ascii?Q?KUVB0N8+Fzqa8LVX7VW9Ul9LHysOHx7Fz4a407XILJEe7VZqU8LRgi7hYhyr?=
 =?us-ascii?Q?Hss4wuM636UGexgr59mLsIteiltT3pJfDRFLUHh5HkZ6BJuZtanX3gZX1swR?=
 =?us-ascii?Q?Kq46paabZPdOEuDQOZCqAisTXMlPxkZz2Iv25bfU/OHDVfypfIUdZINy8uxI?=
 =?us-ascii?Q?H6Yhw4PZ9HmcRLDhz4QYpcz2xZYMtB9bIt1qr1W1OvPZoJ0xozSwDq8BSsbO?=
 =?us-ascii?Q?qadPVwDOvtla+aVB5hRpF/tyxaqdGODt3SpzUcc5jqK9uJ4sS4aU+nfx4f/E?=
 =?us-ascii?Q?3O5nsL4CUZho7idw/ITBvCe+QuKQSAZk87bLMrgtQCvaZVyT6GX119zzDvUg?=
 =?us-ascii?Q?5UnBayNoMeYFFTpNtCeAEZCcXkPKiLVTv+vVz+WVvL+WN9o2bhDEpwMyWCg0?=
 =?us-ascii?Q?1+RtUQT54EgCXu+ei8bFsxMq7pFm71rMNHzTVvLXgOghbtWCgma1nCrkIAyY?=
 =?us-ascii?Q?4Hf5m9ZT5fdtxt4B38ykiwyQ5ABLluU2Hjob65v1ifD5Twi+xfGsnMqjnp7l?=
 =?us-ascii?Q?EEWU3ueTs3+DCG/b2u2NF805+LNljaBuiLtWREZG4lSLfYtObT3VqsVPccX1?=
 =?us-ascii?Q?XqZ/5An2ljEtr8pznRi5OkHvLrNqN1sFZJ/OmKHhv1OsTNB8mlRnzCGyXMOq?=
 =?us-ascii?Q?U/iXXLHBBP8etYb8s1okrVhlx+mgjDAaIvd3SJ5NYs6Mq9pLw8SIrTjWgJna?=
 =?us-ascii?Q?/PgOTZRZOUbXPPQqUdKcdJxOoPVQHmhuQVhUCdOJjRkB0zT5vIhZ9T62O0Ia?=
 =?us-ascii?Q?Py2gEa5ILkuR0QZ+H0wXjmb76iRyo+TM2I8nNIKodxe2e6LOLsQYFvu63lX+?=
 =?us-ascii?Q?SvfBiSVVggn17G5P6dXQOp9r1ax2C/74u6yP6M81KzwueZFx74nO2i9kB4eL?=
 =?us-ascii?Q?gvhx0zFzSzFaOFY3JPmiE3wz4ljZAe4yBRNLamUWNEHWbW59pOtQbjSWNIAX?=
 =?us-ascii?Q?8Ak38Hjsf7spoXOvl35GpHKgaXmxvQPqjPu59iN/A363kwfk8o4IN7XJe1VG?=
 =?us-ascii?Q?IJ2gDNGUpFyQ5PeahN1zl95ubzj5VL/+ajc8YP5TXKUfd/q0ni+jrf2xclbN?=
 =?us-ascii?Q?wHaNjmWVArxlh/Q0Ytet4TQ72xvk5FFJjIc2S22JKbFHLI7DcY+DWaXXI91K?=
 =?us-ascii?Q?sANLGs15ntoJvUbOyH+VTqQvO5msW8z664ZQwDFrs/DJKYtUhjd4B3EamOG3?=
 =?us-ascii?Q?ZSOZEz34Yb/0qP79XjvP0HkRMhjvcmE8CtWxiNCxHtWTEVLh+PtOGcd8V9OW?=
 =?us-ascii?Q?hLbPCD6peckDBtAnKJPe/v5VargzYvJV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h5WhZxh74TV7U9TzdA/vFHHwgSseayP1CrgoZ0hoJfhVjn/w3gTwwHEn7JBF?=
 =?us-ascii?Q?wTIgJMdNupxJMgpEw5rIQZsr1vhsDoP21bGWCvtbkFRXbJuiOUeItrvofGJX?=
 =?us-ascii?Q?HGQFxpx39Uv1rQC1yOI7VEtgAC3L45MGvOyqZBXrPNN/YedaQL9yHgBCoswC?=
 =?us-ascii?Q?aJcHfYePidxymHIfIc2vIz7Tfdr4yE6JHkXBdKOMH1d5Nrqm9akISnZpQkjD?=
 =?us-ascii?Q?m0cGkzlDgBUbUzyfc3yKvmgwGG87dFMc1aSjLPbbma1kzcjpMX+ILus3P27x?=
 =?us-ascii?Q?DuQHRYJZ7M7gRtK4jSbakqGA9HvW103fAUKnrh4KPSw+ZToe7JXcJ/CLE4NC?=
 =?us-ascii?Q?e5x7ayZ5d3XnOWscEPZp1IzXjDJKPl7ktmJZfmdrWA3IDsC6yhA+AnpWoHWU?=
 =?us-ascii?Q?t5JQwu7ZFFLPHwvpA2uTwEMDjlHAULJ2UPo7Dag8/BYNWASZAHt8WXfzYWlh?=
 =?us-ascii?Q?Opv8Z0ZnxUxc+jNdkcxpTHAaI/sS+5jljLAS7AcTrGgPuxt2ehU906MCvgs9?=
 =?us-ascii?Q?6AkQlp38jR53DsdIxCKOix0uNeIa2t7Cw/RJ3VyXGvN+8ZyAVtiuoxs/59/D?=
 =?us-ascii?Q?Foi5N+wNoVY1ThjZQG3fkMMducKDMJ4T+FRBN68BbKoalZaxTk9uCXn49OIu?=
 =?us-ascii?Q?pc1DW7KpEq0Bbx/ljog8IZf5ihOxRONwfjqryZ4BmXEwH2WB+ZUyfyenAoux?=
 =?us-ascii?Q?2GSLtKxiLPkSx2RRWtaMJzCl0zpaS6D9kX5wGgmXxjl6ypK0R8wzMi6cxlU6?=
 =?us-ascii?Q?D/ONVMiXJsEP7o7hogWxRgTAjmDW2mOA7PKHBXCFYB5SG3eWKfd1MT+ya/n0?=
 =?us-ascii?Q?VRI5aekQo/f5ScrcxAHCHX6oJ7Cj5ApNfLJM8oPwLHcAnLNylCUOZj9xasyL?=
 =?us-ascii?Q?USYsu8Z7rCV1trBbQ19xzyj3SRGrr25w6naylNFI7CFmmmQDva9k4vrJb9Bo?=
 =?us-ascii?Q?dOWEIPypOSL5HLEZ1aeE+QryohjkR9APTEEAfqsgfrH1d6slOSTIWiFd6afL?=
 =?us-ascii?Q?7HwQxe68WO93YVU7HDfSvENv1i4HwrkjT0VgB8fQf0ml6dlGldS51xOxReFk?=
 =?us-ascii?Q?G11muY0qC1289uLLtr9DbobVrDSZeB6nJK8dgbhl5/FuPaSE8PcLS53hobvR?=
 =?us-ascii?Q?UmLwoLQwpArq+RAR+aFOpjBXxwNFnHeVw1YNpk34yHH2Ya3X9D1uYmSsceUM?=
 =?us-ascii?Q?Zv0Rbio2kClFfPckPL8KRUj9A16O/Qfd1PgQdfatpD6mrXZMWlRDvhrEQLjV?=
 =?us-ascii?Q?9AbM43dHw9qpeJESZ37gW53GuBoxPLsyUp3MbKx4CsbIsjlJG2dQ3ZU9RQTI?=
 =?us-ascii?Q?2fD7+9Sy3xxvRvKZTf872MPevRHNrIzFbRDTFuVqsXF2Nav3QWcQ49+eXpIo?=
 =?us-ascii?Q?1+15Hzrbvd84+vHZf3D0ReBSYvXkRzietVoF8kpIDjmXNv1NtETf4Ku/C2aq?=
 =?us-ascii?Q?6qQdggrfw6wnh9jB3VM/7CjzMMbuZvNJGeidazQgoZ2hauI4LZDknd2yyZhu?=
 =?us-ascii?Q?4h/JO+zMCQaREOdawxGpdQhCn4tiSMlDpOnz72oEWFQ7xNm9mNtD3SMOf1Wp?=
 =?us-ascii?Q?VGeHzLDvRusQ2ci8SAhx94sX2thOpfGzqW+FkNSa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781b24b3-7cd5-43a0-dcad-08dd70fcb1af
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 09:07:57.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNBPU/nd4GxN6xG+Nh2C6/DP6ROp1rEgOp9sw22gFm3Gbp6sKqG8cTGtqMLi/x5Ljur92akXEym07wbsNmeDdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7491

From: Ming Qian <ming.qian@oss.nxp.com>

The amphion decoder firmware supports a low latency flush mode for the
HEVC format since v1.9.0. This feature, which is enabled when the
display delay is set to 0, can help to reduce the decoding latency by
appending some padding data to every frame.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
v6
- include bitfield.h
v5
- Apply FIELD_PREP() and FIELD_GET() in CHECK_VERSION
v4
- Add CHECK_VERSION macro
v3
- Improve commit message as recommended
v2
- Improve commit message
- Add firmware version check

 drivers/media/platform/amphion/vpu_malone.c | 25 ++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index 5c6b2a841b6f..112645b30e15 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -3,6 +3,7 @@
  * Copyright 2020-2021 NXP
  */
 
+#include <linux/bitfield.h>
 #include <linux/init.h>
 #include <linux/interconnect.h>
 #include <linux/ioctl.h>
@@ -68,6 +69,12 @@
 
 #define MALONE_DEC_FMT_RV_MASK			BIT(21)
 
+#define MALONE_VERSION_MASK			0xFFFFF
+#define MALONE_VERSION(maj, min, inc)		\
+		(FIELD_PREP(0xF0000, maj) | FIELD_PREP(0xFF00, min) | FIELD_PREP(0xFF, inc))
+#define CHECK_VERSION(iface, maj, min)		\
+		(FIELD_GET(MALONE_VERSION_MASK, (iface)->fw_version) >= MALONE_VERSION(maj, min, 0))
+
 enum vpu_malone_stream_input_mode {
 	INVALID_MODE = 0,
 	FRAME_LVL,
@@ -332,6 +339,8 @@ struct vpu_dec_ctrl {
 	u32 buf_addr[VID_API_NUM_STREAMS];
 };
 
+static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
+
 u32 vpu_malone_get_data_size(void)
 {
 	return sizeof(struct vpu_dec_ctrl);
@@ -654,9 +663,15 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
 		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
 	}
 
-	hc->codec_param[instance].disp_imm = params->display_delay_enable ? 1 : 0;
-	if (malone_format != MALONE_FMT_AVC)
+	if (params->display_delay_enable &&
+	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
+		hc->codec_param[instance].disp_imm = 1;
+	else
 		hc->codec_param[instance].disp_imm = 0;
+
+	if (params->codec_format == V4L2_PIX_FMT_HEVC && !CHECK_VERSION(iface, 1, 9))
+		hc->codec_param[instance].disp_imm = 0;
+
 	hc->codec_param[instance].dbglog_enable = 0;
 	iface->dbglog_desc.level = 0;
 
@@ -1024,6 +1039,7 @@ static const struct malone_padding_scode padding_scodes[] = {
 	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
 	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
+	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
 };
 
 static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
@@ -1058,8 +1074,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
 	int ret;
 
 	ps = get_padding_scode(scode_type, pixelformat);
-	if (!ps)
+	if (!ps) {
+		if (scode_type == SCODE_PADDING_BUFFLUSH)
+			return 0;
 		return -EINVAL;
+	}
 
 	wptr = readl(&str_buf->wptr);
 	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_buffer->length)
-- 
2.43.0-rc1


