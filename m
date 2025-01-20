Return-Path: <linux-media+bounces-24927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B08BA16826
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 09:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DAEB16B034
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 08:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511DC192B82;
	Mon, 20 Jan 2025 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DU3iK+QD"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E02E4C96;
	Mon, 20 Jan 2025 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737361312; cv=fail; b=tqst07s3RRx4kwjjVX8shhQSUmkbtr7uV5MgCcYEoVBMoxd/L0D+RPVivgFbTgjNZ2MsOiS+TaGpaj6B6agSl4mPA2MkUa7OagclOj/UbPuJXgD81mh2qKlsSzQX4vAU8s0xW/1MO7cH+A2OEae1v+LKaXccqBLGD860hpJf15c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737361312; c=relaxed/simple;
	bh=x3kT/Ic01/dsphW6eEzRxVAr7JXrJttA/iQECpL/Rjc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oj823eLCRbbAUaiZpcPXt+jETjkEMm1DVNTDL3ikr+cpF3BFW6hGRuJY9u82Xu+u0DamJwIsktHlznXUvVfcmdJsUlU+DPlAtSv4xC0e7Q/ql6UXzUg5kxa15Wc/RqvVwedJmTN6nu6hisZS7n01qMDAhx0M//wDkW/3Vijrrj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DU3iK+QD; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKvP/K5MqITFFI5m5Q555ZYVbr5Jcc1e3r7YkSQ1A3n8S3DoapNVwIyz474OYvgk45w4HQot63SkeBB/hvVW0iKMfUel0h7XQDcSCtHGXW2GTUE5rv5ralsYMyDLYL0fgf08dpshdt7ZNHW9P30D2JzXinWNU9xTbY1jsUZzy/pmeTmiiWJCGVFzRr8bsRVgqBtaeIUVJL0udshhlBIC2GLt5YeaL/SNzUpzOwOqdfYGLrU4Horbf12xyZBci1uJxLNg/OQaF8hZoeGeR4KsgknpdIM9Cl60JEsXYB6rxSzPIkCStr+p6OUPQQGOAPX9pOXL/i9CRNqzAgLvWgWMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Fanto7b+gsAkzuz0a770mweImSSdpNlpn4l6fve5dM=;
 b=mAYpcBn+ER8Ye0mY1NXPJOujWU39ShUGYjdNHAlpoyO6+fUrbfZf2MQcIKvxq1PAKtiMcjcQ348ozUkDUhiFHPrpSyTZpOTNH10UZFB99AfQcgHzoIygd48FewwlkQpg0U+fhU8AnZag7z5y3fHUHANuiyiet7akDl3NJIp6yjdBSx5UXAbUdp6t1h23c6ao3qXVvYBmhwr6cBGQiQKWvsGq0ArS+2IohlfryFsIVQIsJ21xodpZ2jrgS6OjYa91wU3uxbpwxxIBG4Pe5rRH1sfJ6NbvO0J7o1S4XzuJTbb7h8c+rU+fNPkPGpWbbqX8MQvJz3jdClLjH9GKq0e7ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Fanto7b+gsAkzuz0a770mweImSSdpNlpn4l6fve5dM=;
 b=DU3iK+QDtU20Zn0UDIA1tgge5P3FlLTjhMAAI66BHpzy3Owb1UJCNqi+/V4NOeGRfR0WM/cGCVuVHpRWPAAwzo2DTdW53ubk1BSw2F2OoZwg+q9vJpGyeEMrufmNtfIN5KnnL32za65F87QHCFPZpg4It7yAN9NGiMEd9VjyTdrpW/T5Qc6rSeowCsBag/ayFxx1QVTFMyb/a/Q5iQ2RxQHF/xW8CR1z//cokwYVCAbLagp49pnC5nUm/srKclpBRxWZVa4KAYFWHZVBiLa6PDNmgR2JsV7077VIGI2XT9mHlkfEHA3d6qOMEUPwAo38zGc+ZRTMFEgQFAK6JhmgkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB7182.eurprd04.prod.outlook.com (2603:10a6:800:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 08:21:42 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 08:21:42 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5] media: amphion: Support dmabuf and v4l2 buffer without binding
Date: Mon, 20 Jan 2025 17:21:05 +0900
Message-ID: <20250120082105.2960717-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0225.apcprd06.prod.outlook.com
 (2603:1096:4:68::33) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: 029f145f-47b9-49e5-b3a3-08dd392b7856
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wK2ztQeIGOB/84HbeISUtNPIcFiAc+pFaLl0imiXeWgpSMOQ+vIwnvq+VZR3?=
 =?us-ascii?Q?xILw+PYftlj01NSSW4l05r9tdQ6ztum4/EZ4dt1lCD5XXiznKlB2YyG3KoK4?=
 =?us-ascii?Q?P572sLUGcSkx9M4WPHkhBauFLJJKNswXDjaeu4HnNBw08ze/+Axlw5NHczfC?=
 =?us-ascii?Q?dgmj7+Yqr9dGGmRtFKIIm9AhhyQp5G12N/t9hJR0LkRYRkkVmwW8JWtwg62s?=
 =?us-ascii?Q?NG0JqElcfGPM+IbyAz9HPC0xNRNqt0RscvrfGQnMLmo5hfMcOXDQLQWpd3Pr?=
 =?us-ascii?Q?VdIXm9nR5BO2/ECWsRthJU1OiWYng1YzH/DROdNPpe+a3k6lJeYYST1Y6Rqu?=
 =?us-ascii?Q?VIojiXwJ78OjmCi6T3jEa7eOM8LUqwGicwuUViKLsHIAjeY+HHpKN4j42Fpb?=
 =?us-ascii?Q?zthOue70atEcRkorIYpWvD0Nay8f0Ks5YaOK7tbzmmbjaA8zVA8mvosBQesQ?=
 =?us-ascii?Q?qGfMw4RDpoUjaIJ6YJVzLIGBjcXbsSXYnhZYvNfm2V3uN8TmVqOylKOD7oBn?=
 =?us-ascii?Q?WseXJ9aLSWU4enYOKQcKHXusLOAIp1xfOe5zaCYPWfTck6lTeHn2mGLvb61a?=
 =?us-ascii?Q?J8mWMro5EltuuQvWr3wBF4XGmo46c+F4jnG//pQfbdL1MWzZVXYh0b+A6OuE?=
 =?us-ascii?Q?5jmu0/ZM61HEEy1iIjKUgNFok9d+GhHQQKYOkN1hSLKvo2grYU0N36+45ZjT?=
 =?us-ascii?Q?FF9bn4I5RZ2PjQXagXBTEbAEWe6G/ZtVQWhZHe/AOw64rcgSTA7lj00H1jAL?=
 =?us-ascii?Q?FLyXALn6FSO6xvP5jcCaAdJaBdeck8FgYCD/MNTkNTT+b/+seMXvTHPWnKab?=
 =?us-ascii?Q?DPe0rhUPGwueZRePjKh8Tx8e5irM1cgX/ZsRIOqSi4iTo7nbLTAbvVBzVkEp?=
 =?us-ascii?Q?Pm+smE+DqxwY5G8PH05xPmwFGJE5eSFjSEkgPv0QCtKxWU46aJEOaEsF/4Qa?=
 =?us-ascii?Q?KIknjkbCiuHgBqM9pJnDP6ujugrX2GnmCPvrgjXeXtwuiAZPURM4ruaVbMQZ?=
 =?us-ascii?Q?3mXRYfNLKTuEbC5OuBKGrUdjLJqHzgrNHwdiowyiDrrfNHAKRLUaVBFX5OMh?=
 =?us-ascii?Q?QOL9/1Aa+vWL8N5Ig31WLWAK8K4fx5lv7JvYtK0Oyx3lOdC3bFu2gFqFBRuZ?=
 =?us-ascii?Q?gZFTr7f49xP8lWkr/YDw1UH7dSg6JI317m99KM1HOwQI/kQWvLjtFJMhWRBH?=
 =?us-ascii?Q?iCZXlf6ukOP/s0xjsmnqHxrgZQaDuzMiojiz96tNcuLezvrYXN5d8iuEUQym?=
 =?us-ascii?Q?F6fwYwvpQ57dxF0hLGI6RTgehEE+WFk22XsRrQDd21JvHQcY1I9ue/47qIiL?=
 =?us-ascii?Q?g3ORtMQx9Wu+5tiODyNXjAhBJ3qilrKgbhzwYVCw/TNlA4eZkIXhV+Ho910+?=
 =?us-ascii?Q?VVhHeUoM7cAsYl5H06eGAogYb3K+l/NtVDgkA0T+Ty/RnKoyuuu51U4guuek?=
 =?us-ascii?Q?h63suj/kqj1e9d1hM1JLXBAaYJ/lzqbI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RJlWnX0WEcphZhkeGqVyoavphoGyshdd/7s4VrcHrJcexXm/eS0BtiBxRbGx?=
 =?us-ascii?Q?zdULpVKw7JE9HbLI8X9y7lRmNrQXqrIl2R9SqqGN+qvbNOzlIWa+xL/C8kbT?=
 =?us-ascii?Q?+aK6w7y8IcPz+6wXwzQsCUAg7zzmGjeLCL1EzqrPUdxVwWtri6CoHNWv36QL?=
 =?us-ascii?Q?SiArltiQeSFW9sIT/36829AK9liGASEREtuufRrm0wNqfIm/v3np2/onCkza?=
 =?us-ascii?Q?46jMeZT4LQMbrEvkZicuXtnlsOGCntOACqYpSYmZZkD4QoViV6JXBVrpdgOy?=
 =?us-ascii?Q?O82eSnGcX9I0PxarxXJEbusgvxkMcWpaOCSW17Ess1M0kRpfI+F1eTBMpeu3?=
 =?us-ascii?Q?QFWrXE6z3gSj4/UI/Xy5vJtlJMgTvLG375GdK+96Nhd7c7frcDp76XADuwKQ?=
 =?us-ascii?Q?OuqFh62HgooEMRG2uJRnStRWHukGiPiDDe+CurgaO1vLPaKC8xQt3VlFqHcQ?=
 =?us-ascii?Q?Tcnh1snfkovVv8XaYcd4OsEBMxiqyip7QKxAml5G0qnba2wiHwKOeA16klim?=
 =?us-ascii?Q?TIWvr1z2hs+M8Pr9AEkYC0O+xB4sVgaz1vRd5iG4K3l0PMRtUICr42RzHaCv?=
 =?us-ascii?Q?145bW/oE8QiVz7cV/UD4SNyq8VQIJtDMrG3WczK8ntHIkH65c0QA+lbl/gq/?=
 =?us-ascii?Q?fMpxviOuJVEk+vci85VvQbJs9prDZOZAW1W8qOfHyQD6t2iSY7eseskyMMua?=
 =?us-ascii?Q?dQVx64aUFmwCv9FVyM6RnpWNB4T3DzoJcMQpEyzksJEe212miiw8aF6+o5YE?=
 =?us-ascii?Q?YDrvxyW+BeKdl56H+4v3GdWaIamH7cRyZlottkd4RYfZ/HV+ogP2fZLEF5VW?=
 =?us-ascii?Q?RmVdi5OP+ZJOSjehX1MeUg7ASbH50QE8+zBIlZGn2Hsr+EtXlhZPLe0HZ3WA?=
 =?us-ascii?Q?UQ7dDqGx+W6nJRwtEqMiAn4mX0Ctz6Noh5VpaTlDhUfAJ8pSK3CKydkXV1ea?=
 =?us-ascii?Q?5Rx732XWnXNRGsZxmbuWs7ad1WUIVegOSQ0EEtDDSDi445mP6/XUFcztlTqY?=
 =?us-ascii?Q?7X7G554KfQagaKykhFbImw/oSHZX3KEZMDOE9eYhbYt+bF/qDnP99WZuRf4Q?=
 =?us-ascii?Q?AunGFwiNDz8U+6bSkKEgbyYKNGn+TTenvtqBR5n4LoB/ZCAtdZHFurmVTcHW?=
 =?us-ascii?Q?NgC+l1V/onnX5KjXAxhfNDOqBHQB1XrwA8ihWnuV+sbkEmKPFHIh06/Fy37E?=
 =?us-ascii?Q?KzDB/SZKQ06I47LMJ61p9N65c9wfq1r1FjpbiJYLVe9kxWdqVedRwyhwdQID?=
 =?us-ascii?Q?C/NyTP+GDwYjD8vvU201rQ/KdqOcg8iHNWsfzMS1QcB9uZbGSNEAYXVDJ4Ji?=
 =?us-ascii?Q?+eIgkAWDgN16DTRJCwf580CorgsRjf8gtabHz1YsbfMBcDUhU62kWSJrBh/9?=
 =?us-ascii?Q?iPeoiW9IF7Ev66J+0E/uvoOakoSB1njTchsZvXMiN4pLQGmGSiod1h97sXiW?=
 =?us-ascii?Q?4c1PLFuDTE2RG9pontcn32S3SiK9575XIdK+yGo7+nQpuE6g2FweVOI2VpD8?=
 =?us-ascii?Q?Jj57RvoB24UjGxmGDsvbca4OYioLGpTcLYUWSeaP8n/3h6mmbg5FtNZF+g9f?=
 =?us-ascii?Q?uJMaU5q9uf/HOkhAzVdxyhpFtMywJ+EOBBF/xjkO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029f145f-47b9-49e5-b3a3-08dd392b7856
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 08:21:42.4081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k66tJ462yeqVc+D5FFLJAwChsO5wBFOJ4BJrEfisrhkZW6hKUXgyKTRRb5IzEVDBkgDnz+J3vX7UzYBjtdlw8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7182

When using VB2_DMABUF, the relationship between dma-buf and v4l2 buffer
may not one-to-one, a single dma-buf may be queued via different
v4l2 buffers, and different dma-bufs may be queued via the same
v4l2 buffer, so it's not appropriate to use the v4l2 buffer index
as the frame store id.

We can generate a frame store id according to the dma address.
Then for a given dma-buf, the id is fixed.

Driver now manages the frame store and vb2-buffer states independently.

When a dmabuf is queued via another v4l2 buffer before the buffer is
released by firmware, need to pend it until firmware release it.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v5
- Avoid dynamic size calculation in memory allocation, use kmalloc_array
  instead
v4
- remove unnecessary 'out of memory' message
v3
-- fix a typo in NULL pointer check
v2
-- fix an uninitialized issue reported by media-ci

 drivers/media/platform/amphion/vdec.c     | 235 +++++++++++++++++-----
 drivers/media/platform/amphion/vpu.h      |   7 +-
 drivers/media/platform/amphion/vpu_dbg.c  |  15 +-
 drivers/media/platform/amphion/vpu_v4l2.c |  11 +
 4 files changed, 220 insertions(+), 48 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index b3bc9eb16d6a..f4979d537b97 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -26,6 +26,7 @@
 #include "vpu_cmds.h"
 #include "vpu_rpc.h"
 
+#define VDEC_SLOT_CNT_DFT		32
 #define VDEC_MIN_BUFFER_CAP		8
 #define VDEC_MIN_BUFFER_OUT		8
 
@@ -41,6 +42,14 @@ struct vdec_fs_info {
 	u32 tag;
 };
 
+struct vdec_frame_store_t {
+	struct vpu_vb2_buffer *curr;
+	struct vpu_vb2_buffer *pend;
+	dma_addr_t addr;
+	unsigned int state;
+	u32 tag;
+};
+
 struct vdec_t {
 	u32 seq_hdr_found;
 	struct vpu_buffer udata;
@@ -48,7 +57,8 @@ struct vdec_t {
 	struct vpu_dec_codec_info codec_info;
 	enum vpu_codec_state state;
 
-	struct vpu_vb2_buffer *slots[VB2_MAX_FRAME];
+	struct vdec_frame_store_t *slots;
+	u32 slot_count;
 	u32 req_frame_count;
 	struct vdec_fs_info mbi;
 	struct vdec_fs_info dcp;
@@ -289,6 +299,63 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
 	return 0;
 }
 
+static void vdec_attach_frame_store(struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+	struct vdec_t *vdec = inst->priv;
+	struct vdec_frame_store_t *new_slots = NULL;
+	dma_addr_t addr;
+	int i;
+
+	addr = vpu_get_vb_phy_addr(vb, 0);
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (addr == vdec->slots[i].addr) {
+			if (vdec->slots[i].curr && vdec->slots[i].curr != vpu_buf) {
+				vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
+				vdec->slots[i].pend = vpu_buf;
+			} else {
+				vpu_set_buffer_state(vbuf, vdec->slots[i].state);
+			}
+			vpu_buf->fs_id = i;
+			return;
+		}
+	}
+
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].addr) {
+			vdec->slots[i].addr = addr;
+			vpu_buf->fs_id = i;
+			return;
+		}
+	}
+
+	new_slots = krealloc_array(vdec->slots, vdec->slot_count * 2,
+				   sizeof(*vdec->slots),
+				   GFP_KERNEL | __GFP_ZERO);
+	if (!new_slots) {
+		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_ERROR);
+		return;
+	}
+
+	vdec->slots = new_slots;
+	vdec->slot_count *= 2;
+
+	vdec->slots[i].addr = addr;
+	vpu_buf->fs_id = i;
+}
+
+static void vdec_reset_frame_store(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (!vdec->slots || !vdec->slot_count)
+		return;
+
+	vpu_trace(inst->dev, "inst[%d] reset slots\n", inst->id);
+	memset(vdec->slots, 0, sizeof(*vdec->slots) * vdec->slot_count);
+}
+
 static void vdec_handle_resolution_change(struct vpu_inst *inst)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -750,11 +817,11 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
 	struct vb2_v4l2_buffer *src_buf;
 	int ret = 0;
 
-	if (!info || info->id >= ARRAY_SIZE(vdec->slots))
+	if (!info || info->id >= vdec->slot_count)
 		return -EINVAL;
 
 	vpu_inst_lock(inst);
-	vpu_buf = vdec->slots[info->id];
+	vpu_buf = vdec->slots[info->id].curr;
 	if (!vpu_buf) {
 		dev_err(inst->dev, "[%d] decoded invalid frame[%d]\n", inst->id, info->id);
 		ret = -EINVAL;
@@ -775,11 +842,13 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
 	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED)
 		dev_info(inst->dev, "[%d] buf[%d] has been decoded\n", inst->id, info->id);
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_DECODED);
+	vdec->slots[info->id].state = VPU_BUF_STATE_DECODED;
 	vdec->decoded_frame_count++;
 	if (vdec->params.display_delay_enable) {
 		struct vpu_format *cur_fmt;
 
 		cur_fmt = vpu_get_format(inst, inst->cap_format.type);
+		vdec->slots[info->id].state = VPU_BUF_STATE_READY;
 		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_READY);
 		for (int i = 0; i < vbuf->vb2_buf.num_planes; i++)
 			vb2_set_plane_payload(&vbuf->vb2_buf,
@@ -802,11 +871,11 @@ static struct vpu_vb2_buffer *vdec_find_buffer(struct vpu_inst *inst, u32 luma)
 	struct vdec_t *vdec = inst->priv;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
-		if (!vdec->slots[i])
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].curr)
 			continue;
-		if (luma == vdec->slots[i]->luma)
-			return vdec->slots[i];
+		if (luma == vdec->slots[i].addr)
+			return vdec->slots[i].curr;
 	}
 
 	return NULL;
@@ -840,11 +909,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 
 	cur_fmt = vpu_get_format(inst, inst->cap_format.type);
 	vbuf = &vpu_buf->m2m_buf.vb;
-	if (vbuf->vb2_buf.index != frame->id)
-		dev_err(inst->dev, "[%d] buffer id(%d, %d) dismatch\n",
-			inst->id, vbuf->vb2_buf.index, frame->id);
+	if (vpu_buf->fs_id != frame->id)
+		dev_err(inst->dev, "[%d] buffer id(%d(%d), %d) dismatch\n",
+			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index, frame->id);
 
-	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_READY && vdec->params.display_delay_enable)
+	if (vdec->params.display_delay_enable)
 		return;
 
 	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_DECODED)
@@ -857,10 +926,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 	vbuf->sequence = vdec->sequence;
 	dev_dbg(inst->dev, "[%d][OUTPUT TS]%32lld\n", inst->id, vbuf->vb2_buf.timestamp);
 
-	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 	vpu_inst_lock(inst);
+	vdec->slots[vpu_buf->fs_id].state = VPU_BUF_STATE_READY;
 	vdec->display_frame_count++;
 	vpu_inst_unlock(inst);
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 	dev_dbg(inst->dev, "[%d] decoded : %d, display : %d, sequence : %d\n",
 		inst->id, vdec->decoded_frame_count, vdec->display_frame_count, vdec->sequence);
 }
@@ -1103,18 +1173,30 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
 	if (!vbuf)
 		return -EINVAL;
 
-	if (vdec->slots[vbuf->vb2_buf.index]) {
-		dev_err(inst->dev, "[%d] repeat alloc fs %d\n",
-			inst->id, vbuf->vb2_buf.index);
+	vpu_buf = to_vpu_vb2_buffer(vbuf);
+	if (vpu_buf->fs_id < 0 || vpu_buf->fs_id >= vdec->slot_count) {
+		dev_err(inst->dev, "invalid fs %d for v4l2 buffer %d\n",
+			vpu_buf->fs_id, vbuf->vb2_buf.index);
 		return -EINVAL;
 	}
 
+	if (vdec->slots[vpu_buf->fs_id].curr) {
+		if (vdec->slots[vpu_buf->fs_id].curr != vpu_buf) {
+			vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
+			vdec->slots[vpu_buf->fs_id].pend = vpu_buf;
+		} else {
+			vpu_set_buffer_state(vbuf, vdec->slots[vpu_buf->fs_id].state);
+		}
+		dev_err(inst->dev, "[%d] repeat alloc fs %d (v4l2 index %d)\n",
+			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index);
+		return -EAGAIN;
+	}
+
 	dev_dbg(inst->dev, "[%d] state = %s, alloc fs %d, tag = 0x%x\n",
 		inst->id, vpu_codec_state_name(inst->state), vbuf->vb2_buf.index, vdec->seq_tag);
-	vpu_buf = to_vpu_vb2_buffer(vbuf);
 
 	memset(&info, 0, sizeof(info));
-	info.id = vbuf->vb2_buf.index;
+	info.id = vpu_buf->fs_id;
 	info.type = MEM_RES_FRAME;
 	info.tag = vdec->seq_tag;
 	info.luma_addr = vpu_get_vb_phy_addr(&vbuf->vb2_buf, 0);
@@ -1129,12 +1211,13 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
 	if (ret)
 		return ret;
 
-	vpu_buf->tag = info.tag;
 	vpu_buf->luma = info.luma_addr;
 	vpu_buf->chroma_u = info.chroma_addr;
 	vpu_buf->chroma_v = 0;
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_INUSE);
-	vdec->slots[info.id] = vpu_buf;
+	vdec->slots[info.id].tag = info.tag;
+	vdec->slots[info.id].curr = vpu_buf;
+	vdec->slots[info.id].state = VPU_BUF_STATE_INUSE;
 	vdec->req_frame_count--;
 
 	return 0;
@@ -1195,25 +1278,47 @@ static void vdec_recycle_buffer(struct vpu_inst *inst, struct vb2_v4l2_buffer *v
 	v4l2_m2m_buf_queue(inst->fh.m2m_ctx, vbuf);
 }
 
-static void vdec_clear_slots(struct vpu_inst *inst)
+static void vdec_release_curr_frame_store(struct vpu_inst *inst, u32 id)
 {
 	struct vdec_t *vdec = inst->priv;
 	struct vpu_vb2_buffer *vpu_buf;
 	struct vb2_v4l2_buffer *vbuf;
+
+	if (id >= vdec->slot_count)
+		return;
+	if (!vdec->slots[id].curr)
+		return;
+
+	vpu_buf = vdec->slots[id].curr;
+	vbuf = &vpu_buf->m2m_buf.vb;
+
+	vdec_response_fs_release(inst, id, vdec->slots[id].tag);
+	if (vpu_buf->fs_id == id) {
+		if (vpu_buf->state != VPU_BUF_STATE_READY)
+			vdec_recycle_buffer(inst, vbuf);
+		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+	}
+
+	vdec->slots[id].curr = NULL;
+	vdec->slots[id].state = VPU_BUF_STATE_IDLE;
+
+	if (vdec->slots[id].pend) {
+		vpu_set_buffer_state(&vdec->slots[id].pend->m2m_buf.vb, VPU_BUF_STATE_IDLE);
+		vdec->slots[id].pend = NULL;
+	}
+}
+
+static void vdec_clear_slots(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
-		if (!vdec->slots[i])
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].curr)
 			continue;
 
-		vpu_buf = vdec->slots[i];
-		vbuf = &vpu_buf->m2m_buf.vb;
-
 		vpu_trace(inst->dev, "clear slot %d\n", i);
-		vdec_response_fs_release(inst, i, vpu_buf->tag);
-		vdec_recycle_buffer(inst, vbuf);
-		vdec->slots[i]->state = VPU_BUF_STATE_IDLE;
-		vdec->slots[i] = NULL;
+		vdec_release_curr_frame_store(inst, i);
 	}
 }
 
@@ -1354,39 +1459,29 @@ static void vdec_event_req_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
 static void vdec_evnet_rel_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
 {
 	struct vdec_t *vdec = inst->priv;
-	struct vpu_vb2_buffer *vpu_buf;
-	struct vb2_v4l2_buffer *vbuf;
 
-	if (!fs || fs->id >= ARRAY_SIZE(vdec->slots))
+	if (!fs || fs->id >= vdec->slot_count)
 		return;
 	if (fs->type != MEM_RES_FRAME)
 		return;
 
-	if (fs->id >= vpu_get_num_buffers(inst, inst->cap_format.type)) {
+	if (fs->id >= vdec->slot_count) {
 		dev_err(inst->dev, "[%d] invalid fs(%d) to release\n", inst->id, fs->id);
 		return;
 	}
 
 	vpu_inst_lock(inst);
-	vpu_buf = vdec->slots[fs->id];
-	vdec->slots[fs->id] = NULL;
-
-	if (!vpu_buf) {
+	if (!vdec->slots[fs->id].curr) {
 		dev_dbg(inst->dev, "[%d] fs[%d] has bee released\n", inst->id, fs->id);
 		goto exit;
 	}
 
-	vbuf = &vpu_buf->m2m_buf.vb;
-	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED) {
+	if (vdec->slots[fs->id].state == VPU_BUF_STATE_DECODED) {
 		dev_dbg(inst->dev, "[%d] frame skip\n", inst->id);
 		vdec->sequence++;
 	}
 
-	vdec_response_fs_release(inst, fs->id, vpu_buf->tag);
-	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_READY)
-		vdec_recycle_buffer(inst, vbuf);
-
-	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+	vdec_release_curr_frame_store(inst, fs->id);
 	vpu_process_capture_buffer(inst);
 
 exit:
@@ -1582,6 +1677,11 @@ static void vdec_cleanup(struct vpu_inst *inst)
 		return;
 
 	vdec = inst->priv;
+	if (vdec) {
+		kfree(vdec->slots);
+		vdec->slots = NULL;
+		vdec->slot_count = 0;
+	}
 	vfree(vdec);
 	inst->priv = NULL;
 	vfree(inst);
@@ -1713,11 +1813,43 @@ static int vdec_stop_session(struct vpu_inst *inst, u32 type)
 	return 0;
 }
 
-static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+static int vdec_get_slot_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
 {
 	struct vdec_t *vdec = inst->priv;
+	struct vpu_vb2_buffer *vpu_buf;
 	int num = -1;
 
+	vpu_inst_lock(inst);
+	if (i >= vdec->slot_count || !vdec->slots[i].addr)
+		goto exit;
+
+	vpu_buf = vdec->slots[i].curr;
+
+	num = scnprintf(str, size, "slot[%2d] :", i);
+	if (vpu_buf) {
+		num += scnprintf(str + num, size - num, " %2d",
+				 vpu_buf->m2m_buf.vb.vb2_buf.index);
+		num += scnprintf(str + num, size - num, "; state = %d", vdec->slots[i].state);
+	} else {
+		num += scnprintf(str + num, size - num, " -1");
+	}
+
+	if (vdec->slots[i].pend)
+		num += scnprintf(str + num, size - num, "; %d",
+				 vdec->slots[i].pend->m2m_buf.vb.vb2_buf.index);
+
+	num += scnprintf(str + num, size - num, "\n");
+exit:
+	vpu_inst_unlock(inst);
+
+	return num;
+}
+
+static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+{
+	struct vdec_t *vdec = inst->priv;
+	int num;
+
 	switch (i) {
 	case 0:
 		num = scnprintf(str, size,
@@ -1771,6 +1903,7 @@ static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i
 				vdec->codec_info.vui_present);
 		break;
 	default:
+		num = vdec_get_slot_debug_info(inst, str, size, i - 10);
 		break;
 	}
 
@@ -1794,6 +1927,8 @@ static struct vpu_inst_ops vdec_inst_ops = {
 	.get_debug_info = vdec_get_debug_info,
 	.wait_prepare = vpu_inst_unlock,
 	.wait_finish = vpu_inst_lock,
+	.attach_frame_store = vdec_attach_frame_store,
+	.reset_frame_store = vdec_reset_frame_store,
 };
 
 static void vdec_init(struct file *file)
@@ -1834,6 +1969,16 @@ static int vdec_open(struct file *file)
 		return -ENOMEM;
 	}
 
+	vdec->slots = kmalloc_array(VDEC_SLOT_CNT_DFT,
+				    sizeof(*vdec->slots),
+				    GFP_KERNEL | __GFP_ZERO);
+	if (!vdec->slots) {
+		vfree(vdec);
+		vfree(inst);
+		return -ENOMEM;
+	}
+	vdec->slot_count = VDEC_SLOT_CNT_DFT;
+
 	inst->ops = &vdec_inst_ops;
 	inst->formats = vdec_formats;
 	inst->type = VPU_CORE_TYPE_DEC;
diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
index 978971712742..d8100da160d1 100644
--- a/drivers/media/platform/amphion/vpu.h
+++ b/drivers/media/platform/amphion/vpu.h
@@ -223,6 +223,8 @@ struct vpu_inst_ops {
 	int (*get_debug_info)(struct vpu_inst *inst, char *str, u32 size, u32 i);
 	void (*wait_prepare)(struct vpu_inst *inst);
 	void (*wait_finish)(struct vpu_inst *inst);
+	void (*attach_frame_store)(struct vpu_inst *inst, struct vb2_buffer *vb);
+	void (*reset_frame_store)(struct vpu_inst *inst);
 };
 
 struct vpu_inst {
@@ -297,7 +299,8 @@ enum {
 	VPU_BUF_STATE_DECODED,
 	VPU_BUF_STATE_READY,
 	VPU_BUF_STATE_SKIP,
-	VPU_BUF_STATE_ERROR
+	VPU_BUF_STATE_ERROR,
+	VPU_BUF_STATE_CHANGED
 };
 
 struct vpu_vb2_buffer {
@@ -306,8 +309,8 @@ struct vpu_vb2_buffer {
 	dma_addr_t chroma_u;
 	dma_addr_t chroma_v;
 	unsigned int state;
-	u32 tag;
 	u32 average_qp;
+	s32 fs_id;
 };
 
 void vpu_writel(struct vpu_dev *vpu, u32 reg, u32 val);
diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 940e5bda5fa3..497ae4e8a229 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -48,6 +48,7 @@ static char *vpu_stat_name[] = {
 	[VPU_BUF_STATE_READY] = "ready",
 	[VPU_BUF_STATE_SKIP] = "skip",
 	[VPU_BUF_STATE_ERROR] = "error",
+	[VPU_BUF_STATE_CHANGED] = "changed",
 };
 
 static inline const char *to_vpu_stat_name(int state)
@@ -164,6 +165,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
 		struct vb2_buffer *vb;
 		struct vb2_v4l2_buffer *vbuf;
+		struct vpu_vb2_buffer *vpu_buf;
 
 		vb = vb2_get_buffer(vq, i);
 		if (!vb)
@@ -173,13 +175,24 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 			continue;
 
 		vbuf = to_vb2_v4l2_buffer(vb);
+		vpu_buf = to_vpu_vb2_buffer(vbuf);
 
 		num = scnprintf(str, sizeof(str),
-				"capture[%2d] state = %10s, %8s\n",
+				"capture[%2d] state = %10s, %8s",
 				i, vb2_stat_name[vb->state],
 				to_vpu_stat_name(vpu_get_buffer_state(vbuf)));
 		if (seq_write(s, str, num))
 			return 0;
+
+		if (vpu_buf->fs_id >= 0) {
+			num = scnprintf(str, sizeof(str), "; fs %d", vpu_buf->fs_id);
+			if (seq_write(s, str, num))
+				return 0;
+		}
+
+		num = scnprintf(str, sizeof(str), "\n");
+		if (seq_write(s, str, num))
+			return 0;
 	}
 
 	num = scnprintf(str, sizeof(str), "sequence = %d\n", inst->sequence);
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 50aeb69d2c66..37ef706c29dd 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -500,14 +500,25 @@ static int vpu_vb2_queue_setup(struct vb2_queue *vq,
 		call_void_vop(inst, release);
 	}
 
+	if (V4L2_TYPE_IS_CAPTURE(vq->type))
+		call_void_vop(inst, reset_frame_store);
+
 	return 0;
 }
 
 static int vpu_vb2_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+	struct vpu_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
 
+	vpu_buf->fs_id = -1;
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+
+	if (!inst->ops->attach_frame_store || V4L2_TYPE_IS_OUTPUT(vb->type))
+		return 0;
+
+	call_void_vop(inst, attach_frame_store, vb);
 	return 0;
 }
 
-- 
2.43.0-rc1


