Return-Path: <linux-media+bounces-42602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9731AB58E42
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 08:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 014FE2A8667
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 06:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D900E280A5A;
	Tue, 16 Sep 2025 06:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mUfsiT6k"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A222BAF9;
	Tue, 16 Sep 2025 06:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758003050; cv=fail; b=NCW1vrz5Duuv77A+++dRy+ABH1p6w6SDizG1MnxqyxJeBUKntDuU0SPxnWeCNLXmud636HNKv5jXYD0PcLQl/n+M88mF5jW+rRBaqQui7X6uMNGComVY5m9DXWTrZuLmWT+b3xdvOQKmmEK2oDbLC+ubau4F7Vm9+GGGNxPP36o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758003050; c=relaxed/simple;
	bh=QAX4YWCjk5CU0uWFCozxJ1aeUIMIJBZ5WSug416aUDk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SgJwM6Psy9Lf3AnMMmlgSlUlJcchKx4IjEexfVGcC+BI+hECoMhiWNMrI8BB2EcBHqtlwNaTkywrG2hFXTIkZ5Wq7LTMRva/wBmkFOA2DlTf94U5KHzVLTUyAFfT12nvXisuSHFXhmonXUdND2v8IXOwOWJKLvS7BWUzB8obDyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mUfsiT6k; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mk7wH1LEr1T3xjTPv0OJUsBBh8z3VPP58maK6soBBTuAEaoL/iVgNP5Y/UmJqzVIa1IHqhHUfLKfIvVuNNzdyYuU0QPP4cYyN7+JX7S/9y1TAz7jpZEfoTi09eQOJiGkjow5PlZnSO3QKRTCZfECBqXzsy6umrAoFwVu8M/Bs+ns3x9Q+uGe2uaKloFko1Bc509sYHlX/LjFbYdv9NFvRsb6svJQonX7OWOQ9ozLkg3wBy9pSfQ2dLah5yghyiHnovflcZWJ9DIGVCoScqg2BpntYQvp2FyKX3KEJFAeTfiw1zhD2OG52D+WBCLi6oE6cMqjrLS9BtyU72gRI6CEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V44bpy/9xy4x+9uiODogl814uSpySzWWAHBT/7XBMpY=;
 b=Dlqg4kzLT5zP3kTx853534+M2TjKUY1hun18D33Dab2jDz+tHLcoIrQ4uypgo8lhx/DhSoG8RxyLdb8hCpxzfJI6oQ7mmbzWduhgMI/FNq/l0GeGZgja3wUHeo9IIpI/JjkxFWHJPFfFUrZjYf366VG96ffmlZwgFBRSz3jfktxnB0m/PmMwZ8oQLSq6GxcnDnAzHr3nTEzdy1xaWTolsPkLaTtLWMh5j4Q96WbnXqahv2xkoL7RytXEzJKL3i04h4dEP8Z1GEiyAQLtgWSiLgkhcsd2UqsV+eSSYMkdV193vRqg6w7F6S9hUXrsRY5bd9HOkcCX+R26lVKBXWZQVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V44bpy/9xy4x+9uiODogl814uSpySzWWAHBT/7XBMpY=;
 b=mUfsiT6kVF1s9/DjPDO5BmcoJEZFdwB33fUY3C9KfPNFZ3t6RCjd6zzIlHH+DESgCD17l5wVl1VJoPAu1Cs+Gi98nUtjMhb+O9qWs2+5x7n8dKvIGmvk9FDkBm0wjtp36ygbE2k7qTecbQoyGOwus/LYUUzstTty3U8N9BkoovkUKNuDsi0xiAXWSHM3r0Aila2G6vZSZxBgoBTWCbZKtuAk+3dbTpFfnrTF5bfnmj/zLZQBhaPMNEI4WAe8p6Rhc5vcZC7lhcsALm/DehWclsCvO/e/LTW7uBLNs9sq4v3/svjYUqXqt9UUfrO15WOy8OJiihcj08Kq9Yo5UBgOTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU2PR04MB9145.eurprd04.prod.outlook.com (2603:10a6:10:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 06:10:44 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 06:10:44 +0000
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
Subject: [PATCH] media: amphion: Cancel message work before release vpu core
Date: Tue, 16 Sep 2025 14:10:07 +0800
Message-ID: <20250916061008.1403-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU2PR04MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc30004-9887-427e-2701-08ddf4e7c52d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?95M/XUSOzn3KmJ7G7HJ8GDN+9uw8GPLjPUkbjneix9QT2xoCdRn8SMSU/T/c?=
 =?us-ascii?Q?AKcp2FcIZFyHChqFSSswT247aHGNanw0d/e74GBAnagQO3528xHoariLDB5+?=
 =?us-ascii?Q?9/BAR5oh4tJ2mEO0y2GSxAjBAgpfal5yaEf/QjC8iuoyVptva2hO3Xzo/zAD?=
 =?us-ascii?Q?v6fPLPQsoozpZW5/m+MCUQHEnFTMawwsPlrEMWvWqcsmQOUvKyDDDpKfkquW?=
 =?us-ascii?Q?87l6EMPpsYCx9ScnlvEBTdSobaKd8BcMoECPdvjxh31Fea0idjFIJKK3WQp/?=
 =?us-ascii?Q?lE979cbARO1w2M/dUuvZXiPQyzOP42NhNaE6NhsPY6zE9SNWsfm9OuX7IgdM?=
 =?us-ascii?Q?DAve4znlkcKaqa1G0vjRvqICo9y9lEIUKoGAdbv6G+5kCI3lyrXFieTD2kEK?=
 =?us-ascii?Q?Ocd4UdPJDYwBUSdWLVaqPWyTcRcrGUATjYw/QzsD6vvM0qdv88NXHlnhPWQf?=
 =?us-ascii?Q?X8VWJhOddKctvKp0lrpcONbeUm52r9zfZYX8AfYhnddwXx+rwZQohBWpLvLN?=
 =?us-ascii?Q?8iBwnxCgHy2hC8wcD0xDEucIi88jRfCftfULyws+cYOuTaopi0oA7b+nlXGv?=
 =?us-ascii?Q?lKC2KXfnxaz2smT8U0ULDzplR6Yc7YU24iXTagRMQKsOxv0v7jnktIwEhyDX?=
 =?us-ascii?Q?fGi/PKjRmYy3fF/bpbQmUtkwrLOWufBJe4pwuJB0RXeHlpuhlVnrgplIw8xx?=
 =?us-ascii?Q?Pi8illrIEQSTGfFybgP8QmHiW0OgLJrGsxx96XLa8NaXnaEzP+8TjUotnwv8?=
 =?us-ascii?Q?SjI9qTvmkUrrPXeAqStED4labeqPHx0zML7Z5JHG53WGLSz6cFA8p+lwCoe7?=
 =?us-ascii?Q?SGf3aEsnbVuCR1Jwmaru7W0CczSAR5aDFG2Nj+0gpDymv8dipJHX41Q1M9GO?=
 =?us-ascii?Q?cvNkyUNdWaS5xgqCH5KywRkJ/pZAdQ01EpiWFXRwWIuv2AjQ4nR2TZWYWKDw?=
 =?us-ascii?Q?EaISk4yAghZS3BQQy3It6LwC/Mwb1Um7muFomLc4Rp08wMQi2Givdr5e+m3h?=
 =?us-ascii?Q?ow8HlJtxu/c7L3byM56b/DYBXAcoI4rYEpQJfJvFYOcxK/xWD1GySIp9EpaL?=
 =?us-ascii?Q?Ev4GTkjKX2lavw1W6d7CRAFjnLRVe8di9HQBzA8CnPm4AI0rvnY7WjILgWTW?=
 =?us-ascii?Q?aGR3eKTrNO04cS+d6VOGGwTv6ZH4XVHZ+ipil/TFthRjj6etFEGo5Cx7ajaz?=
 =?us-ascii?Q?HUlEjN4hvGsz8XIyGI5OGs55jlTIdil3Wp97/9k6tAmS1OY08OuvNJUmhYZL?=
 =?us-ascii?Q?UDmmFm+CMbW+uJbC69cYaVXMaXsPmWLLI/u/VZucsz+0Hs6kN4xEhIpszids?=
 =?us-ascii?Q?BfkFFBa6uko/gror8XaoV9/VVu7aDYTx2rI3k4TEy4R7BcuCZHvGVXFpST4U?=
 =?us-ascii?Q?DEorekKmwtZ996ZSypxl01lwsOKtREjjuVpB9tIJtRSHX95czLyVPbbJk2RW?=
 =?us-ascii?Q?RWRCb5LDstTSQxhypiL9rnE04ikx0XrR3mE/OQx9ZH8LXaeaceGvdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uapv3N0Cb9EmjabADe1UBsHBncUarPR9eKbUQaXxjdam31uHv0vXT5Nrqcz8?=
 =?us-ascii?Q?tPNovA3CTO19puLQkQDhBLbycNKyWVGW7T06KlXR+yxY2Smad5xlmvuqvzlA?=
 =?us-ascii?Q?NqTBDxSe0INYVmRuUiqpCgstYio/BjQf13NjIHj8lonT931oS5h6G41JnbVZ?=
 =?us-ascii?Q?079JrEHw1JZtcRQloTvDSopgsWlop0y03eVtp/68FXjAewM8GNzYO6JXdei2?=
 =?us-ascii?Q?mvzmlHJY6rgVXHADtA7jl7+HzFaHHSMOAQSTaFRimMqq78qTwXf8N4d1J/i4?=
 =?us-ascii?Q?w1fI+Aq8GOh0a1MW1tXA9S+1oi5W6rVzhQTKfi4ObHuR9VfuvOHpljgScdvX?=
 =?us-ascii?Q?tgpNu+aQ0lL5jq+bZaXwReOCUaWUbimxocMIfwFzcjUFKNmeF1x/k+MYNIsk?=
 =?us-ascii?Q?g95gkHZOtOnih58/N/PK/meiLyfZJGc4xTTyjFFQXZLpsu+qOWPkHujw8s/q?=
 =?us-ascii?Q?a2P35fN5pAC+ToVmZwsohfcBEBiquPaanUBXioUyTbQ0sHb3iCBWVf6EB/iH?=
 =?us-ascii?Q?4IoU6BAS1rjNOYDdkeocuxatowQgyn5tfXdQHKoF05rhI5oNiRyu1pwRBa6V?=
 =?us-ascii?Q?n/DaX7GmCGq++1+UgFCzvxbr8/Cr0I50HO8dv/s30fnPXNXWOOJ2PP80ZmFB?=
 =?us-ascii?Q?Z7TUm89Nm01FKA5QevgsINmtTOXTh6h9D1MG9O+iXdXHrIeBQdjXwFicV1fz?=
 =?us-ascii?Q?BXbTd42BMdh9a1ocqwPJYZmxW4JJPopt0Hf7bNh4/b5+/963zTf90UMJgStk?=
 =?us-ascii?Q?ww3qd5uxg0eoTSLF3Am6M0uIlVwqBiFYNU/THFpRJ+VhYVfjva0YDgBZCR+Y?=
 =?us-ascii?Q?Exd0wGpOna00o121Wz9cscmfPWISyBpTtUYucdtePfdSMsQQsJvUomZkwogr?=
 =?us-ascii?Q?URIdmBFA2/s6t+JufFXhFbnzEyJZRE9oOeHrO/ryG3CPNG8MGG/DJIcosi1g?=
 =?us-ascii?Q?5A1kIhSCYgfrLNhpF/SsEXZV9vZFT8t+finynwCnuUGleplAB8AsjfGN8VCP?=
 =?us-ascii?Q?kXfQ9sSHLaZ7LONpb4T0RpZZIsXbHiRzX34tljD6bETDPsLD1o0jg1RGUzBU?=
 =?us-ascii?Q?Xv0z7pgONwAYLJ76eg3Uwu3Cbnf6PozTtfCUY9aeOR6i8OwKDRgRfDHwyY9z?=
 =?us-ascii?Q?ljld3Sh9WpLnngfYwT3hsuXdSREWAjpoJx8zqlqDtyrxq7J/Zq9x/QmyvLIY?=
 =?us-ascii?Q?hC7YutbqVSs+Z9yiHNckwCnygcotRMhJCvWyViluw5arYP2fbRRdDHiwFZ6n?=
 =?us-ascii?Q?Z4gSsc3QrjPIocO7rQsgrMnYWO9qqiuoC9HinzirgqVkLCYuiOhf2h15mxgO?=
 =?us-ascii?Q?fCM0T64ZYYspvaWyrlUO9fsNuwE7cPZj6GSCd4DfWy9xrjksY11sYFkUf1t8?=
 =?us-ascii?Q?NhkyPOq+/8jlwhx3lBAzhjdb8eJpHmT1ZZL+cGg1f0cCM5f1xb6fJHb7e/KB?=
 =?us-ascii?Q?Y6N3NPAKn07xH1EgtKA10b4ulJXgOJSOAXMc7YP3NMg04I4aNIxvu9GPtmZg?=
 =?us-ascii?Q?o7I62ohIb3f1Upnn2aYVVfvhtwt3YLBfBCcyCbDvIBS0RFqXaBEVkK57hufp?=
 =?us-ascii?Q?HJ0SaJubjutlWbz9/KBQP4aZkogTgB9TY5JSzlJU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc30004-9887-427e-2701-08ddf4e7c52d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 06:10:44.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZilY10klCVIyeBYG3/9F3biipBgEtLCTUcbdFplPxlWz0IwuWcV6A/KZc+LCDj3hWo4tOmQTHxx2iUCtYHiNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9145

From: Ming Qian <ming.qian@oss.nxp.com>

To avoid access the vpu register after release vpu core, cancel the
message work and destroy the workqueue that handle the vpu message
before release vpu core.

Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index fcb2eff813ac..0df947674a9a 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -713,15 +713,15 @@ static int vpu_v4l2_release(struct vpu_inst *inst)
 {
 	vpu_trace(inst->vpu->dev, "%p\n", inst);
 
-	vpu_release_core(inst->core);
-	put_device(inst->dev);
-
 	if (inst->workqueue) {
 		cancel_work_sync(&inst->msg_work);
 		destroy_workqueue(inst->workqueue);
 		inst->workqueue = NULL;
 	}
 
+	vpu_release_core(inst->core);
+	put_device(inst->dev);
+
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 	mutex_destroy(&inst->lock);
 

base-commit: ecba852dc9f4993f4f894ea1f352564560e19a3e
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.34.1


