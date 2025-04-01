Return-Path: <linux-media+bounces-29102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7C5A77546
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 178487A34EE
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 07:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830441E9905;
	Tue,  1 Apr 2025 07:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YC30kJDm"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1390F1E7C18;
	Tue,  1 Apr 2025 07:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743492967; cv=fail; b=WtjbXBauk8L/JIbC0rECQS0Imjcx4mNsUoqNZKn4+fV+f1rsm0F+NZc3FS2GbSCnQbEfCF7/2u49m80EQVlAzBu4j9P8ypj/uY3QPBht/lv/cgyZlUO96uXdB7qlg2m3x83uQEqZmc+4/dYD3ivHharSq99UBJdOCMkB7/qIluI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743492967; c=relaxed/simple;
	bh=u8NMi6lbAkYZKULoliP71fMpfO8urN0lNsMEIqUhbwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EOx1FkmieliGZjkSYKqsoIyj6xYvMbAqfN1NEPygGn72t9Y/74yKhx1j6vV7029hQRyvBK3XjqyoYJkqrjg9S6a8a5E4n32xAaE2HepR9ci0z2erZVnEq/ruwiF5Esh131PLEQk1Pzc/fDzr/Qm5WxO69dkDtn+q0Trt6a6qMfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YC30kJDm; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxTvaNZhTvfSPhcBJf9dbXxaH1paZUCEVz+/sV1ZE+uTPUFdwiF+dn4Y6v+0Ckk29m+2LgmfYOlK0bUHrVXPjwucRXgAqMyCiaTtNSanW8SSk665PqdCC/B/FTGdOkEVy/dasN5ejcjIm6Q/onLU7ftMYBUhBq+uedM6XXG6BVd/Esndhd0kJZ4xCZgxZXYvMI5FUwJV8vLABjPAztjckLGqzdj0UawSoHmw1pSyhlAt/8LOlt3Ou5n6qTXUn8wusIg1CvLLG3claktbfct5c4wFUAjBGenXDqW23tVnj4vwu4+e1T/7zXzmJl7+wRsqMeNBCahmKMGfBUHFdhxq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zUFhkjN07lKFNy4wSSfsWq7x4iV6wJvKuoBP4MGc58=;
 b=vHIo7uNS8LapY1NOCAM0XqXWi7pA2UPSO+aG7RhVFmLw2k0CXHeYBCmnyrXaVqWNBRGv6LuIIlg4hS4+WhiBHfmGGOh3xI5ytgktB7LZHdgRJwH7UMxdyukI3j+7gP3+Phxw7xZ5+z1rb8iKmH+ZJocijWL8bvve+KuBdDNltV7/QuLqF0kFxhjHaFyPbJH32VCa/w3opuLD2x7vvHC6/oBYhhCgfrsnHjJ5NLHX6D7A/mNK5D0DCJegGdzTCaUXzv7mDnbthMraTjn34mTxIECFczyjcO8EvRrV2vN4lwsklvYeY9t3RAM/Gs1Sk5FarGSgwv91Fceiy8CD5UqamQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zUFhkjN07lKFNy4wSSfsWq7x4iV6wJvKuoBP4MGc58=;
 b=YC30kJDmCbQSt06WhlJ1L9slZDrudsuJB5vi0oKdctdCVzo5tZ6R9412QfXbHl8ww7lEqO4aSvCU4ZpnSfvbwc0BAwybD3/7shJvWZ/1WywW15Lk0qE6LcWmLglDDimUqSVCvhuVb/0NYdz7f3v7o4yYcP4Y60f1raOAYoiM17kQOro1GZZF8WTOuSZH4w5pIU+mru1VUCb/IMH6agLjDsw73HfGWIBph5pi993R3y1LH4E/DiCFD/ey8E66YjO5/2I0TkzTp2Z7Dm/IyEC9PIHuDNcJeGDXJlu2+C091zOxAX9/inMuA4NM29lfHsfnvWUZvyIOpiBt15abcKfo/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB8893.eurprd04.prod.outlook.com (2603:10a6:102:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 07:36:04 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 07:36:04 +0000
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
Subject: [PATCH v5 2/2] media: amphion: Add a frame flush mode for decoder
Date: Tue,  1 Apr 2025 15:35:25 +0800
Message-ID: <20250401073527.1626-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250401073527.1626-1-ming.qian@oss.nxp.com>
References: <20250401073527.1626-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0143.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::23) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: d4111d9a-db13-43f9-a380-08dd70efdb88
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RGRWc35WjRckGxvrqIkVQQo+FRpECqSyOEYpBqYlQQ+7T6hQdE/ItLEIcfSA?=
 =?us-ascii?Q?xJa8h4HnDCWA8gnwIYbxyRZ9sxOYvUvlM+J0phtwiNSQ48zYg6p2+pgDPF3N?=
 =?us-ascii?Q?A0KQRvlRpOArd97Y82FAyXpgbC9Ht7lin716sxN6pVffIwdPiR7ecsOcX/tH?=
 =?us-ascii?Q?1X2T6Ky26S7QOYjyOLGHaEACfvy6u6mWS19dH9qNDMQ24O1Z46ilt6+jRwjq?=
 =?us-ascii?Q?vLvCtJ8g4NVlDqWnQ68afJlB33l07hnl8pXSkLu5jXl2bvsSjxINZildE/+S?=
 =?us-ascii?Q?bT2m8ACejYmafajTDQMYPGfysd2qnsi6tm7CipU6buTy3GDt1hs437jdZ6I0?=
 =?us-ascii?Q?u27skKPYxsp7T7UogZ1DlDX/4PqvtIy/12Dm+cxmccEotgETvVUEVKp0AGhp?=
 =?us-ascii?Q?QLJ6xFjFNd56/r+xTpdQuphvmEzQaA9jDrVstfWv9UT8rJOHuaNY9fAlUP9j?=
 =?us-ascii?Q?DGanei5yqeaZH4OdL5jes2CAiPN9S6cR2qPW/pofC810pu/q1kMAg/OZo1WN?=
 =?us-ascii?Q?tX9ukFJfzOpcecZtnsh3toODJKvnF91lqK3OLgKgV0wsF1I7JmDLsaYVu60a?=
 =?us-ascii?Q?B1ApWxIKfwEpuiQv9mj6jLDbguL975wfXmUfzRYcsPAK/whwB6Y7hzgrnL4z?=
 =?us-ascii?Q?Y8ytAVGeybSAQY0lEBoH7xbLvJg2WG8kVi7tP088rDfA0DK6pha/494jNUW2?=
 =?us-ascii?Q?R9QhxkWPnhsML4A/pvBNBwgkyBN/u3t22zY9kjxd9tsZu+9kbCZIWEN9aYSW?=
 =?us-ascii?Q?oaBE7XBeR2c6zg3H7A1u/yCmMGY7OSQjzBPkuLMk9+9UINNICyEfq+ObMscp?=
 =?us-ascii?Q?l2hfppFbf568PqH6MCjUfA7mNB+G/9UN5rTYgCLIrhrgiWf9EZ/5yBJtXXzR?=
 =?us-ascii?Q?MA4+viQ7AD+CP/VZ98SyOjKpH6FH6VlUVLE9dYtOCO153Y8+6XfQtwtBSfLT?=
 =?us-ascii?Q?x0GFWsMV1tNnXEQ34QPX4BI41qsyqPcrinrdXMPEKgFgc0mjImK8M6f8BYJ5?=
 =?us-ascii?Q?KT/Xlmx7ZRsBvkRtplwO5d+IOfRwPXyCOKUhQnyk+MtknFRX9oxYV4x5AXj1?=
 =?us-ascii?Q?dG0+Ob6d99sxWnd+2R1VqhbrPOk/EZA/qJvssmjtDGVjjWQuDT0+5f2eRRZ7?=
 =?us-ascii?Q?gb7Dq2G9r8Fnt7qlgCpm0qSL6Dp8khLk6JjBLQ0RMTm7/0SUsd2XV03ae5hC?=
 =?us-ascii?Q?b0fDBG9rTWaXvfreR2M+FrE72FIv0f26J1s7PvI1jMxsm2+6qiTLc7++2e2/?=
 =?us-ascii?Q?Gb0MxxS34yl6BP2QBUZNb0xLuU+p/RJGx5Wh2kFkFIYHmUvH5HVm7lGfrQAg?=
 =?us-ascii?Q?FulqaR3IgUUo0pfAOzUsPUpe6gvFF/rWgMA4/+pf6+kPrldL3G9Twm96FaMa?=
 =?us-ascii?Q?qtKB8hfODj06SCka2cZmCTacjIznrtu/2BqcTuK+sq0viL3XTEBag6CR1jZP?=
 =?us-ascii?Q?z4erCkEjBSuTbaWSNpVBTK4i+zSZHIxP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OyiEqJWdg7XDwobuDJ6iI03xl4Zwg70lbv/lBlcnJlzrcqLbBRS0fUEjnDwi?=
 =?us-ascii?Q?HaYJWshuW8NJPrCHBLYDEUAjkXqglVGGovmD1pcPNGUQUv/O25lKyuSZGo+P?=
 =?us-ascii?Q?OyjwnXRZ12tT3FtWGuw67diqBgEjYGMREHzJm7BqtFzCBD4OZp/jYSGnL15V?=
 =?us-ascii?Q?Tf2pG8eHHOiCPseNTZbMMAylt9ZvOOs/a7s9zqYv/2U/3kco9iBiSj3E3YeZ?=
 =?us-ascii?Q?zlfEFxrZFLK7e8JVJEycwMF5gQNGqmUrRFtgPA5vi7LVl0R49P9p7DjC1WnC?=
 =?us-ascii?Q?dKsEna9DkWCPFdB1KR+27MCm4P7P4HfGhT2TeMgmJKUv9Xn7yxJ+BPFPnRRW?=
 =?us-ascii?Q?nIdLTh5aGmWxXEIovC7h2mKTXzVyyBfEjd6Whkpv/Fj67zkiGUUCD6lAwgfX?=
 =?us-ascii?Q?AHcXvTggywXWaoTo3l/9J3lopWsAoyo7V5cC7LIWpXAJAEIDqHA0Zr6UsNHX?=
 =?us-ascii?Q?SYiWpNQcPGxONhTcnMbymedsfbSeyOeamQPN2c+qkQhIvatXgNDYa+Qxjt5W?=
 =?us-ascii?Q?LFXj0m+flp0LEG56Grw0AuLTkNiNJZzoUrsWu//RydjpsEcqkVmefyAC75UT?=
 =?us-ascii?Q?I52CqRhC/pLNn84Y95aEzB3hXvP4pe3D8wMxrEtRTPTBJTRwF5Fidg+Ih0eO?=
 =?us-ascii?Q?U58Aiyez/uCa3NsGeaT142gwTdODr5lO1t6wXeaxRrIwSH8ZAGDyESn8wdeX?=
 =?us-ascii?Q?cI0XbXPHNfCKoRgCVaBMaGrv2EG5IiQuSLPIG2VU/WWtQPlwo2sQ/LnvqCtF?=
 =?us-ascii?Q?OSM5k5DuzI839EKjpDAVOhhGDcQ5WH0vLLvk9wi8kHT5ILA5Km4OPfQAmV4W?=
 =?us-ascii?Q?NUwtTuB29YwspkaeZk7gffLCaLv7ouacZog98qmkEM9Aj6HEs06Ipyd4ZaIJ?=
 =?us-ascii?Q?vfTruIl+A8Rn6IxFo6llerHCRUHzP1dfJ2i+kIDv1m6duWHppq3T4udWle95?=
 =?us-ascii?Q?rKobiR3fHxQ143/nChOAZo/Onum1bl1X1Mki5Fz0DN+b18hdTYTCGMzajSa1?=
 =?us-ascii?Q?/zHPkbz+BBvHdXoryZV7CpieWqcIvsdlvl7mKfWDzt1ZLun2nYM8S+pakSYl?=
 =?us-ascii?Q?OFS3EHY6/ExzWK+rKqFqmZJ5HIcX2zMgfETRaRE20OxfnsZOQAf/cIEYdVfC?=
 =?us-ascii?Q?UQVfurAHe50gyggbddNGEdBh3cLs8Dx1B+aIftiIi+4g/yRW1GaHaLhzqrLL?=
 =?us-ascii?Q?/aHoKRnm8KxjwwsH7z/m2Lx1UJ+zFnSMnplCQhtPhnKv5l33zIB/zJGnUAqh?=
 =?us-ascii?Q?r/d7ygv4x3P3duZy6Hbn1MQgehfNkqkhL7R7Qb5sgPqoGHy6kxURVGP0ObNB?=
 =?us-ascii?Q?P5rHAGfC+EuDJVDaYkJi+5zQiL5mEnxDpN8BbHPgFSJ5a130zly0eQFjoezU?=
 =?us-ascii?Q?x9itlkzcnPXzBNQ5be5wWiIkinqA6mxpoXS12b5CJj4zNIt3FYealzrfbhp8?=
 =?us-ascii?Q?Ouj5jgzW1VlCpAhvboBEBkOiQ5VkrlrsoF3gBUHZA12ZN5uCjQjnqzCkbcBg?=
 =?us-ascii?Q?psHgn2/CXB2xbndAu/8YuMqDQAAVA01PGgwqV9LycWP7WCjWmAetuvq1A6a4?=
 =?us-ascii?Q?T2pvNlrqUV9LGqG5N4kCoJH5T2tjc9CicxpbmwHR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4111d9a-db13-43f9-a380-08dd70efdb88
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 07:36:04.1878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV7Di2xPxyDIzncScAH+nz5G+WufDw6BOSlgSkCY2mmXiunZ3xplkIGqgtzboTVVCwatFr+CSTegKwbCXEiT7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8893

From: Ming Qian <ming.qian@oss.nxp.com>

By default the amphion decoder will pre-parse 3 frames before starting
to decode the first frame. Alternatively, a block of flush padding data
can be appended to the frame, which will ensure that the decoder can
start decoding immediately after parsing the flush padding data, thus
potentially reducing decoding latency.

This mode was previously only enabled, when the display delay was set to
0. Allow the user to manually toggle the use of that mode via a module
parameter called low_latency, which enables the mode without
changing the display order.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
v4
- Improve the comment expressing
v3
- Improve commit message as recommended
- Add some comments to avoid code looks cryptic

 drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index b6e4996c2d91..89af89087e2b 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -25,6 +25,10 @@
 #include "vpu_imx8q.h"
 #include "vpu_malone.h"
 
+static bool low_latency;
+module_param(low_latency, bool, 0644);
+MODULE_PARM_DESC(low_latency, "Set low latency frame flush mode: 0 (disable) or 1 (enable)");
+
 #define CMD_SIZE			25600
 #define MSG_SIZE			25600
 #define CODEC_SIZE			0x1000
@@ -1581,7 +1585,15 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
 
 	vpu_malone_update_wptr(str_buf, wptr);
 
-	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
+	/*
+	 * Enable the low latency flush mode if display delay is set to 0
+	 * or the low latency frame flush mode if it is set to 1.
+	 * The low latency flush mode requires some padding data to be appended to each frame,
+	 * but there must not be any padding data between the sequence header and the frame.
+	 * This module is currently only supported for the H264 and HEVC formats,
+	 * for other formats, vpu_malone_add_scode() will return 0.
+	 */
+	if ((disp_imm || low_latency) && !vpu_vb_is_codecconfig(vbuf)) {
 		ret = vpu_malone_add_scode(inst->core->iface,
 					   inst->id,
 					   &inst->stream_buffer,
-- 
2.43.0-rc1


