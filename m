Return-Path: <linux-media+bounces-28912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E7A74407
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 07:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC733A549F
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 06:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9314A2116E6;
	Fri, 28 Mar 2025 06:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ksqm4Qrj"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2084.outbound.protection.outlook.com [40.107.247.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2B211A2C;
	Fri, 28 Mar 2025 06:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743143534; cv=fail; b=H9oCyHqDjTINq/9rQ9CDAs8HzWXLXncQc6gTEpcgPVp3s2c997Dd8NNpc5phG+GVetSF5XsHQsAgz3vo4Oh4o/hkv6qWaDksYe3D7353QZaWn0Iz5lTgVT8Sl15BfoJQWm9ffqo8jwKanbb7TrlCYffcqGitwIG8tPjuNcKkS1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743143534; c=relaxed/simple;
	bh=VGEWYcgTcF2cQbOJQZ6jijJY0kfH4cxylKMnzClo0Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rk+Dl/PhKvj0l5PKS5WFKe/nvj+n/BIZ3T7S3HspYq39/CIfu7AhQXhleXuEEqROmxXwf2R+iaRA2Nr6VspdM82rSkskvrmmL+I0R2j0AhYqTBmtbLofM0G7DfL1gAlAhkNE9ts3PQI2J4pFNZgIhpfxIcoMJircWs/iDzsk41w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ksqm4Qrj; arc=fail smtp.client-ip=40.107.247.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUXDzJmCma/NGyidSxqGTS52bM+7YHj+/MJ94lOA0e7rJ/mn9OPCfvDw5qcv87RDb3zFzFrJCaIErrOgeZ/2yF5XFvg7yYuq05l+CaLApn1kvSN8827BUO+QCCBQwKqGgcUeJY5o1puLmMD+axOjFpaOlTF91VwMZF1p1fqV/r/ZsmUaO7zCyQeJ/uPoSgCS1llVphBcxpZ4eJ3yLHlm5KxJyXk8+cqgbNpjgy186MaPpm9fcvs1Yk/nYSPP2vgN8aCummKhYYEu628iP7a2FRfwGnSIL4G7n0LyQaOCtFYL57AFRh6BZ1/heZ7yglmgMN42WFjDJuUiGKRlIa2Czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlIm9Ns91uaRTs1fpfsxeOVCssUaEeDGGG2Xv4okbOA=;
 b=hWK4iI87Z90COOhQhbTossYZx4T5RYNLg6UfT6EDwpUYCyPYgfsby8leENhp/2fqZ14H1WWMfbnFf5TMS7zzetm7T0JDtSZrs+GmY8s1p/3XmJaO4Er6RMDV91T3X8V6MDVsG6s/KLEN9H8lJMFfqdIMw7YBk0lFWv0U9ldSpFysV3fTG8y8Bxid4sLrsvL5OOhw4ESB+m6ASX6g+1/GQAjiDqswJpZ4FLD34NS6gEzSBFAyUmYmAFCuiFBrursmDcqt/yMVwUfiFdQspTa0bSR0W2nknxEsegRQO+uBUYgnvzk4ChAW+XGe73YekH06oSy4lLLmM2XU+YPR6e+Lbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlIm9Ns91uaRTs1fpfsxeOVCssUaEeDGGG2Xv4okbOA=;
 b=ksqm4QrjcRfDSwOViGifBK+uhm5kFkYGiIMwOzxDP5G7d9LH7LiQ7SP1aO1M7rZcXYyfR68V0DxfIJsstBqTJavKzXb/wFVw6+aNhjZRMeGNSUsz71dOxt+AEz+uB5YGzt0A//7lKvmXGiEELTgRMVNYR0qLYp/4cehZn9ogAVxHa3zERYVewW3XiJlqMWS/IsdLt355aEWPoG5VoyyHYE2iXG6+CJhw4BJwq1qkYopoDgf/BeWJ5+ciVX0gwtaghVvHx0Xim+4tWmC9+QACgOd8cUST2uCyaEnF1o//vPrxjQsxdkIvdugB81Ooz/31zLfqHIoUlLw3d4LdZ8djUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GV1PR04MB9117.eurprd04.prod.outlook.com (2603:10a6:150:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Fri, 28 Mar
 2025 06:32:08 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 06:32:08 +0000
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
Subject: [PATCH v2 3/3] media: imx-jpeg: Check decoding is ongoing for motion-jpeg
Date: Fri, 28 Mar 2025 14:30:52 +0800
Message-ID: <20250328063056.762-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250328063056.762-1-ming.qian@oss.nxp.com>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GV1PR04MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b308acc-57f0-45b8-3965-08dd6dc24358
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tWl9bUX6vQ7gEUAH10p6ogUAfI5CzfPI8TWlFdVao+D3fmStigfdazB7MMpy?=
 =?us-ascii?Q?09Hr+R3m4IuGdvJQHUrMFhBvCjYUDQSL5im8MuQzmuWHlmbaxvioPUKWblQn?=
 =?us-ascii?Q?zD2NjxBV2iwGRhbm0dC1zCRnKpdaOMUnn7EROBVy/8NmlIatmrdpLzraQz1V?=
 =?us-ascii?Q?fRd4saXplCr8uIIhTc9AANhxe7BqVXN4qkXH9JQJqJTcb9t7W1RaSP8spUyg?=
 =?us-ascii?Q?ob3jlnCrqH9pEuMiwx55fCEBMHnl2/mXzct4bWZXA9JXvy3RcKnh00vn0qE4?=
 =?us-ascii?Q?FI1cDGfA5T2Vz30rVeQLA5q7Iz4bHhz7Rae158K5LyQLiQZLFlM+cHpILqHb?=
 =?us-ascii?Q?3Mygafx+gQZa8VChBwADd2w8BktOh62WfOqAdbX2Q6GBaHfT+4g+0VhdPsLF?=
 =?us-ascii?Q?0tFXTOd5Zn78B2wrGoVWgqLf2UFmZeRKh5LYnxE7Z/4y3AbwHFu8BHFFaj3J?=
 =?us-ascii?Q?07Tc5nHy9kiRLpAlyNi2zEbrt1HK45xC5lgbNvyqlo4Jya5kmukDrWsVTJ6Y?=
 =?us-ascii?Q?+eycs3PCDT8LH3YQI8GQuB+epziaxr50t/ET0cwFNzeBzvAPyqiduJ6Aq/3y?=
 =?us-ascii?Q?+lcpZTPJq4Tduotn09J2zRvB0FG9YguBFAf7IAH37lxMP+WfGt+RDIMVAdja?=
 =?us-ascii?Q?J95fhJC7J1hSIh9l5IiMSh+JBohGNhJsRpzJ4yQO5MHFHB8vGak9HqjX8rXb?=
 =?us-ascii?Q?tqH/MeQIyo4ZHrA19wJlk3xJl4Ap/6DscTXKEMX6zPPzCPM4O4BJjcr1rS8n?=
 =?us-ascii?Q?GnQtNirYJ0tU37hkkUuFDbTHpE7BFu/gue/m7dXPwy8YAoz8sYf1I/o4o4te?=
 =?us-ascii?Q?0kzAsMDMqVwjma1XzE3bAwYkBRLnmlXFa0pSUSEqxP3fkvAk/5zX1C9cbDS0?=
 =?us-ascii?Q?/ZKXAs8UuNqyaBBX65eJygfcxE/4Fjy6f6tZAfWs9SBOFBruku7Anb8CBxxb?=
 =?us-ascii?Q?hr199rlM7ZWUuu2lUXpAlBiELibRfzoirLN959V7dB2S6AMlfLhZ1qBGNdJo?=
 =?us-ascii?Q?jByH4HnqBbX8O2G8pZbtD2M6yCLMYJfntWUMfuAWo5hj3ic3EqbIL3622bxK?=
 =?us-ascii?Q?e1d5zP6DvqRwOVP0adOUjzaak2i7HiipiLv5tPwTomCF9VNoJ4iYXQRKIrXc?=
 =?us-ascii?Q?kYAewqJRFuXAKY4jn7QWe3/p1+OdRIdbxuk/z9oTYMRDr0MuXVJj0dR9hpxw?=
 =?us-ascii?Q?BSg1sh6VWBVxeFI/YnqllOu0ImM2sfQ4hN/gcZzQkFe/kIDpw5MTronxZBMV?=
 =?us-ascii?Q?1G+IDpgXemQec1GZIR/swp9vXprrta1BRwsX47q6ng60gAuOPD+9UiYWcsw0?=
 =?us-ascii?Q?D/Kn/f451TbCEiP9fwd9d3N0UJZ1nybTnnOL7hQtwH/HGUbHvPYy0kQpe1Mg?=
 =?us-ascii?Q?YDUjkHp/IPCPED4fQoQ886FwSs1GGx50rEI7/Y0GlaRr5SXE3MTJAW08rp7D?=
 =?us-ascii?Q?KInKQ/CMMKuYPhgzOM1cSlPsNUbgXqEt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dldSX8p+KdmjYuIMskPaGPpSCQxKChpnoxcN7vHOnXYhbecBOE9Sqs0AyD0l?=
 =?us-ascii?Q?2U6coFW2hLf/7wdKIN8B9E5btNyscgNK78BM0kYJ9siM2i76rcLvEyBhoMv/?=
 =?us-ascii?Q?iobm1IwRw1otUbiuH7YUom5bGJ8JTqYPFOpdqFnuNDhjHZ0G8+UtXmvRj3GN?=
 =?us-ascii?Q?K6uWIkTX4GyNmJET3bySLUDKEkMoeJ/EAwdvf31q+6o/7yEMZqj7vYeeL43k?=
 =?us-ascii?Q?OU5pQcB1x8pjGviYG9oR9fpQi+besCJPx09dw4vVtCrFJIjyQ3bU0QDV/kWB?=
 =?us-ascii?Q?9KSunVezlVEVH0bdOtI9V19df/iTVYcHjfdZZAKSXje5GyEwxXOZzNlsPNlS?=
 =?us-ascii?Q?OIIPAnRVO8RhRJ9QoZMZGPuEEhm+B4IShskmS4YuU27SNTLzYtTzKJLefE8R?=
 =?us-ascii?Q?x/tsaR5iL+g0ChfM1wIM0xt0Vmww2amtT/drHziU/Nhs+MxXphfktovwPQrV?=
 =?us-ascii?Q?03DBu5hEvHfD/Ju2Fx7/Zq2XvuvmX7Js7915x/TTonwEQgB6I7HGCUd3GJym?=
 =?us-ascii?Q?jAtE6iyEWee4BaDK6ANj7SK43oAZZytNJYQqjH+szWostbYfv0JFUfsv+l5y?=
 =?us-ascii?Q?gfnY/ph4FHT4M7Gfr5R6MCPoVEKzCn1360mT9GEDwFEe2BJDK7yAWb5AlYoy?=
 =?us-ascii?Q?TqkvDw+7YG3Tmpa5CSL1YV9ckFMj02HaftXGcdpxPCyHo+3YpYOa5YTrwL8O?=
 =?us-ascii?Q?7wHFzHBSFbwdDqF4pgXT9sWbjmr9n+iV8SG+dOOArIwKT2KqISukE3apjmFs?=
 =?us-ascii?Q?a/466LBDwT1CIxBt09pThtimxLq4w+YwMilEMTr57R75ULnxJoXdcZwcjbdm?=
 =?us-ascii?Q?5kRshjYzugOAfCYhaS3oVQZDzthnharAjmq0LMc6FQyg4FnnwygztfLykHZ6?=
 =?us-ascii?Q?vSy6msIJ17eFd2Z/uaYr81IMSbbZLIg6ZM+m2+XmBtTo+T/+8WfOCSsDa41i?=
 =?us-ascii?Q?/YtFZtefD+4DFEhB+dvEK4xMfTU/+fxPjft12AAJUmjlV1BIbgpXyrWZC6uU?=
 =?us-ascii?Q?Vq/CRZCHgBOFdMfysWMfMWqcoF+NHP75b6KtBUPBnQd8pKJrAhZpg1esEyLc?=
 =?us-ascii?Q?4ipFZCajb4hU5gNQfVy2CyHpwEC9ACHE9cItfJjCjx/uANsSKfyReimyF12c?=
 =?us-ascii?Q?nSiNWd704N2LGcy4LLyN7+RwrkMOA2phn4vjmofGLpyhGx8laWW9VnHQWWiW?=
 =?us-ascii?Q?u/P3h8x8Xu2ptESO8Fth2097Nv0aleaOvkrNjO1ZE3xcBXGIegLG+dS8lFtz?=
 =?us-ascii?Q?ngnxfTojCuekNQwaZRXS2Xss+WMzTXf0fO5ltBik6F/andZqpVlz+/3lRMgD?=
 =?us-ascii?Q?DHkRur47xwHFmChe0sKe3ggE9pFwVsvldtFoTHnQ9NxTe5zPE/p1oIUnVXN/?=
 =?us-ascii?Q?JH0vf6hpn8iN/G4N4maiw60ExPIAXbFw0iF34z0X7ZoZ90dEAabD5OiqsHnX?=
 =?us-ascii?Q?FEjwg5AmPy1+ImTNovuX58gWIjR6hNpfmHIgDmU7aPWAJ4PQGQH4oE1wCV6y?=
 =?us-ascii?Q?I8dQI41WEvG/AZX96R4Cc7cVE0bkeqezi7YD33ai2C7iwTkn08ystPn1CAxz?=
 =?us-ascii?Q?t+6MpvlCwT1AzMyM2Jdyhte67LUWbe+SUGomWqw5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b308acc-57f0-45b8-3965-08dd6dc24358
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 06:32:08.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSaTU38gJT0bsgZDPzClZ4WCF4DCwxBYvd5ULMi9nCgXeGWViGaXTp7gYjpMrGbk6Yo4yKXoZybYCba//JkCZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9117

From: Ming Qian <ming.qian@oss.nxp.com>

To support decoding motion-jpeg without DHT, driver will try to decode a
pattern jpeg before actual jpeg frame by use of linked descriptors
(This is called "repeat mode"), then the DHT in the pattern jpeg can be
used for decoding the motion-jpeg.

In other words, 2 frame done interrupts will be triggered, driver will
ignore the first interrupt, and wait for the second interrupt.
If the resolution is small, and the 2 interrupts may be too close,
when driver is handling the first interrupt, two frames are done, then
driver will fail to wait for the second interrupt.

In such case, driver can check whether the decoding is still ongoing,
if not, just done the current decoding.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
index d579c804b047..adb93e977be9 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -89,6 +89,7 @@
 /* SLOT_STATUS fields for slots 0..3 */
 #define SLOT_STATUS_FRMDONE			(0x1 << 3)
 #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
+#define SLOT_STATUS_ONGOING			(0x1 << 31)
 
 /* SLOT_IRQ_EN fields TBD */
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 45705c606769..e6bb45633a19 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
 	return size;
 }
 
+static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	u32 curr_desc;
+	u32 slot_status;
+
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
+
+	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
+		return true;
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	return false;
+}
+
 static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 {
 	struct mxc_jpeg_dev *jpeg = priv;
@@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
 		goto job_unlock;
 	}
-	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
+	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
+	    mxc_dec_is_ongoing(ctx)) {
 		jpeg_src_buf->dht_needed = false;
 		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
 		goto job_unlock;
-- 
2.43.0-rc1


