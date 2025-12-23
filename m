Return-Path: <linux-media+bounces-49395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBB7CD83F9
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 07:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD1BF3017385
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 06:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28803009E4;
	Tue, 23 Dec 2025 06:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i/PYwkJy"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C56B1DA60D;
	Tue, 23 Dec 2025 06:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766471311; cv=fail; b=Xc4j8Ir3M1c9yOtnxcBw7FMmSh466hxWbG2JLKrfSZL8PbHxsEbDagiXBRKjPwb8HLNERoZgBuoAhZ2Zhgiwkf0c7ox/Gi9Bf641t7ihCGDj6+imN2isTcqOyD5vHQXcX1bNNXF5uBMiKr9wwRbL9F90jOeymLiL1uANruJcSvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766471311; c=relaxed/simple;
	bh=dbwOkbLkmBPUFdXnnLGy41UPAjHQqSAVl/iy07JG44s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DzOjHIRG4H/f1/uzICkQWLMCbp78zjpWo38OjNyzgCkw0Z21CWGsaLTXdVbtWoouc5fokdM4p5nOCY2K3Ctc/ly3hT/jcUdYpNeR3hFDAi5xc6kdnhkK/Qez67d4oJfOKYqnQcxIhHSwQee7oH28T0fDpZIHZw5eTiv7yswEn9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i/PYwkJy; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjfjJx157RnNxcDu87rTzU+weOyjLED3GGUO/k1A2eRc5Osv5ExOFL6cGwLOP1NygbVlJ4PzK8caWoWiq1LMqEns2X8mZfE151g20pwjIUR1g6+OcSxKOoSsf55prOXekJPLlOHtjAPl8a17vXzqVFVRgzj0HSMl9/xxVLNq22CS3f7O495zgg0vn2H82Bwta9j9bCSObCdcUkTkIoZWiT34v9b4Ts3Ekmu5xE5s47yV+vCgSJD6OMdD07ZwLI4qRDWArzyZelXmI25hP/NuzXneFEujsMhCKZdTVW18iClQcxnTUcc6yIzlz9ewagd8QnOT8ApaXOzOTGXelLF7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl3xWuxJkj37qiaSYFbjnuuyaCf1IKI7ca5H3qEr6Lw=;
 b=lKMssEsGXQsO5oNEqbyETaKvWC6uzuoCHhGU3lftItMd9+BbNO6RgkKEWBJOceU3EDqBK8CRjEEu35yJ0V6reQqvRYb6A7jRNlNf3euQ5LVfwdN4ujy7hK92X49p5Y6AcOwtdKR1/8p2CpuNitr1DFgx7hPkIYIsAAKhwcGXW/ecpAas3DPsaod81zGBqpvM/kZszVKjV1bmOMA8OMm+ziXv2CiSIWjTXDZOmc21hYgTji6AkLNFqJDKM36iG9FrKE2hGgvJKeDD6Vc/zRoKAg7irVRcRkJPI87QFNjgNRJ0kPtU8jHzDIRkwi6K7tu3nzFdQCWTx5GKX6bt9rZhqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl3xWuxJkj37qiaSYFbjnuuyaCf1IKI7ca5H3qEr6Lw=;
 b=i/PYwkJyOwd/kcHfRZalCB5R6ub1KyMbS9iLA3S+x98nWB9lZvmKXX4mmEApePeriCSdy3RFHD6BQBRjukGCVr+IYMw5ymWVFP4ndsOF3FcJbYBt285HeNJJkTDjpfPMUIMf6k6r8hSxGkoGS6tqay22pGBSb3ZW1MpKNQB1U3CMj7IJ9ZWKp7zt72mzJKvUTtWrxL5fyYgXdcuzp66XGprxn0vLlBKxy8WVjn/wAOPK8OfpEY3vnU2qFX0Mczc0ESG0xmhzZI1es7qtE3fbOXPIX63g0Ng9uMDMkOkhmLAFhXQWDHGYexwbKRkabTrpTELXhBOr8McCEHvnR2uPcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA4PR04MB7999.eurprd04.prod.outlook.com (2603:10a6:102:c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Tue, 23 Dec
 2025 06:28:25 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 06:28:25 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: amphion: Drop min_queued_buffers assignment
Date: Tue, 23 Dec 2025 14:27:52 +0800
Message-ID: <20251223062754.836-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA4PR04MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: f6889bbd-d5f0-4f75-d557-08de41ec7a02
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|19092799006|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hBYoyS51E3+mTVma5uNBFm9B6EA7jNJn4RxckjvAaW8GdeldBoE+WJwjYy4r?=
 =?us-ascii?Q?1eRUhMf7ikscRsU4VQPrQ+QFAQI9LZq4gZYEOjOLyNNgxS/7hlbhsy1VJNdi?=
 =?us-ascii?Q?kd+D8yeAzBOOWfSofQ3iyjipmbZrJjZ+kpClCgEj5RfxwcQ1U+MJcVCM1UYa?=
 =?us-ascii?Q?JHEEhuoyogAgwZAseDCKLZC/9ZAr7IJwVoPRL0vKbE3Uy17cnXNHkTIaptsl?=
 =?us-ascii?Q?V7SNadVsLJX0IeePYeZdUGINevdxyHJ6t3DhUWgaDktN54qvZ9aOloEtprBs?=
 =?us-ascii?Q?BzrZ5RURqg1F1qVDmPQ75OvotxJIey6DyCaiOQrB6K1g0P6okOsndys93NIt?=
 =?us-ascii?Q?xG1VkFXfChwyHlkkxVYyjrq1yU8YMTLVqKiRPYSsLBX6C3IH7wthtITEhW98?=
 =?us-ascii?Q?DiFr/8MJbzxtt39QpSxgH0fXEIG635vfWLdnAe261/vImXZqiiSvvXuHZ7qh?=
 =?us-ascii?Q?cGKd9Xes1XaVxBbBDXKaocrrTG4Dlx5u1ZbtJTQK8AXcxS72oZZtzLn6LsEv?=
 =?us-ascii?Q?0A1T3g9jXzl6PsO+kZLsS2cJBvPiPpbaABaUlmVMPRZnGRT87L27berwraWX?=
 =?us-ascii?Q?8k7cI0G/HWljQAHz9XeTbSyd9ct1ljpc4YOGjz2OLWzl4I/rMRRyVuctecLf?=
 =?us-ascii?Q?k/32ii0C/6QMNmGJ1ge3gW+0UZfj0NbgajnrROBFTSxsZjiaFzc2d5H2yKnN?=
 =?us-ascii?Q?IR3/kDrccYSplib4GGRoD9tjhOTBH7+6m9zc3fW59GyYiRLMqbffkYE2x8bE?=
 =?us-ascii?Q?MHGJWwk3fd+K02VaN+f8O4BgEzdA1MND5hE+5EtF0RgvPpEinpHGChwEMcc1?=
 =?us-ascii?Q?z13UvptQTcvrGmWZJ5a5lpmajsSvzGxjjz3aHWk5S+xKqIQ0nyM1eZ7QCCBh?=
 =?us-ascii?Q?X+poHl/0U0W/0Eg6IfcNB5zCRpf7YIslKCKwX1IfwO8wGfnyl+n8+3vTSOEK?=
 =?us-ascii?Q?qwSdDkPDhmEQQIPW6EO5cy//s+CNIi4GHRNIfxTiZK/ms6pJEGBpfWx/6Cil?=
 =?us-ascii?Q?2PpWlS6MlFmJE7/gJNittaPJBlznTWFRzWCKo91etiQjKtydIYgNGPDITBQS?=
 =?us-ascii?Q?oj1nTx52d2GoImq875rrnKnyPvK+aDg9dHMeYnNvJjG8K26Eo2a6Mj/JS4Zh?=
 =?us-ascii?Q?6jfFm9a2pAgvfYzawtH/l+AehjyDl0r4mK/ZaGtEGVzCBcoHeELkJ8zDzPNu?=
 =?us-ascii?Q?Fep9XU0KgnL0WtIcj3Emw9mkj21dhTxqKrqg0m03wzcqMUcRL21Va/cie1/W?=
 =?us-ascii?Q?RAtxKbozGUts9PA/ZDWEosK8Os9KxvuP7oh5jpYNQ2qXxpaEW9deLWlYD1V7?=
 =?us-ascii?Q?LbWhML3adhophbywGOzUwHkKGz9AIkh6B1Lg5R6quYAq+4iryY7z5bsPn0C9?=
 =?us-ascii?Q?1UEfdlL13qx8TSmvswPAMd7RVlrl0iaLqPyRCJYF//TqTMP3Hw20oaCMT/66?=
 =?us-ascii?Q?swEnxcUHIRb4MlW1g8ZMUdlqKwymYn7hmJ8bapDLL4kthFRrTR+Rr25F9/Cs?=
 =?us-ascii?Q?6JSopTl3W2oWDiw4TlWIilAZY56NyHtGmE/J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GZmj/N1w1FGn1NV4hpSKK77YteFhY7ncoE8ynFzkagJhvuT5zCFQMTz+9ka6?=
 =?us-ascii?Q?dtW8O18nOoTfnviE0TB2C1jgaHnEuAyaO2CBXIOctIHeqqELNDeRB5OZ1ovB?=
 =?us-ascii?Q?NaT4FQIBhARibunlT8cH+LNicnA3QEzh6RkUDcc+QKMxy/NyBKnXjkfacJ0m?=
 =?us-ascii?Q?Du8N3k00o3H094xTcf/ZyRIf4z0xHnxDtGtTPM5lonHhRLND+wlDz1xPDS8a?=
 =?us-ascii?Q?uj7YChyF6ZeYnsZj5UhEjHDYKjrWhlq1P11Lx0FtSqaSUe7H9rxgZuWoPI9E?=
 =?us-ascii?Q?GBP/WyfkL767z3UTgIMqvXfPZ+byRwrfws7mZ3KWj0VOmPf5FopNqqX8MORT?=
 =?us-ascii?Q?5AVxx8EAOPDx5NHesomObe2Qgj7JqzpdgvK8jkFijPxZymUtrmFxjQPPiHYi?=
 =?us-ascii?Q?dvQBz6YphtgL4hBjl6NNHvU5WHWrxSoWlhGzwWUgbN32M7mBuLmvGGUW0X0D?=
 =?us-ascii?Q?W1ZKvfkAxJ8qKQrBAj210dSAjoGcbRrx8NdqCTIyYRng4THr3LXbNepRu1e4?=
 =?us-ascii?Q?w7KOtZuQPBaFFUHBBdR4zLMbihhr7Q6Vdc9H5yneNtYqXQQIO5pxHPeOvOcN?=
 =?us-ascii?Q?y9yZkUjsbxPprFB7JeSj3k+auxxI16ztK0rKt4j5kxnYc5aQsEm+vocbN+v4?=
 =?us-ascii?Q?Cyrnpclw+WSKHWFRgGQzxLRPefLHEIKdQHnBCYRT5ls/CR26ucmC+MGq/lNx?=
 =?us-ascii?Q?pA3vYK3JlIQ5mzX9NVKD4iPujKnZGivEk1RNI9szVCFJ2xvHh4M0L1OaMlWm?=
 =?us-ascii?Q?zborU7NRTz52niRmMkZcChujjqs6Nr0iRhOwg64DyySJwuECzwH3uGywedCK?=
 =?us-ascii?Q?nDSJ5FGn2y6q4GSjTyEuje/g6ulDs3AyBGurmJLt8Ws3l74veR4RwG8ONnvI?=
 =?us-ascii?Q?9/kAwhA8InxlejNlYqF6JySrmzWkRLOnQuyUAo6eOsU+9p4z6xcokaje2FYd?=
 =?us-ascii?Q?wpYMOfobPLM+svTa2XrIVL8mbaFkSQPWfxKNQBq4iY9Pp4Bnzl26cF1+JWbP?=
 =?us-ascii?Q?UUkjwNsAli/HNdoWWTQb/WbRvphHvo9N+yu1xFgTxTkWg5wUE6bpIZof8rOx?=
 =?us-ascii?Q?2uB5rpN7I+xKPv5hhX73RYFNwq4qNopWunB3XpViWpBfLxx7n2krNn5Rte2l?=
 =?us-ascii?Q?oFeNJt/j/xqJHXdb1sFTqAJwPcmPFLzbCkIqcR7xFwqR6jR0SH+NQ2VuMHgh?=
 =?us-ascii?Q?uq0RPXfayd08dyINI2FDQq/udvcc4yWBbUlxhW5vrrzJUZ4SaCVcyiQG047E?=
 =?us-ascii?Q?U7aiv31rn0ZOMpblGJ6OXPdhnp1RgUxc5gUd00QEIfeCQPCg2DqCAPuE8BXu?=
 =?us-ascii?Q?mxohofba2Jrfyyz9YjQcvhpe8Q1hIWhBI3jDXL1qRQsnN8SZYRI0PaoWFujt?=
 =?us-ascii?Q?UYToiZzyXaqMYDocnVK1hUVBn6eziLU2BzXqtAJqKh6CgshPNcHHW7+VfMFN?=
 =?us-ascii?Q?P83dxwaI9TP7pDpbUa09V+rtQH9PzdEWsWI0NhaOFVaafWSoIRTtS5PS/OwZ?=
 =?us-ascii?Q?4RCFyd7tXLRHH28ReYPPxnCLAp8RWuZwRqDR0rHSFGLYeAITn1NhSC5V4DH2?=
 =?us-ascii?Q?UC2I9I9KAqjCudTdF/SFNJ5sEevwpzCCAR27jV04J3cKIIxBtVvs1KV8UdOe?=
 =?us-ascii?Q?QfyXE9vGGhxM/OfJaQIPtMSaZDp3Yw+VYLf+PIuN+TugmuRAco1avHw9T1/O?=
 =?us-ascii?Q?Y7bZe1XrwUa12rF/l5rB+ToYUyCDzDH2ZXUYmtA+stTIc2nBmkOkpDUdEWqC?=
 =?us-ascii?Q?0g7Q6Tc9+w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6889bbd-d5f0-4f75-d557-08de41ec7a02
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 06:28:25.0474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SV39aV2jnG+SaiO7LP9PqQBnSDwOVI7iVMJkUehtH05O53OSrarNxdbYhUQ8q9TJ4tsR4R98UZ4p4ZA5AX6cfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7999

From: Ming Qian <ming.qian@oss.nxp.com>

The min_queued_buffers field controls when start_streaming() is called
by the vb2 core (it delays the callback until at least N buffers are
queued). Setting it to 1 affects the timing of start_streaming(), which
breaks the seek flow in decoder scenarios and causes test failures.

The current driver implementation does not rely on this minimum buffer
requirement and handles streaming start correctly with the default
value of 0, so remove these assignments.

Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 47dff9a35bb4..1fb887b9098c 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -670,7 +670,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 		src_vq->mem_ops = &vb2_vmalloc_memops;
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
-	src_vq->min_queued_buffers = 1;
 	src_vq->dev = inst->vpu->dev;
 	src_vq->lock = &inst->lock;
 	ret = vb2_queue_init(src_vq);
@@ -687,7 +686,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 		dst_vq->mem_ops = &vb2_vmalloc_memops;
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
-	dst_vq->min_queued_buffers = 1;
 	dst_vq->dev = inst->vpu->dev;
 	dst_vq->lock = &inst->lock;
 	ret = vb2_queue_init(dst_vq);
-- 
2.52.0


