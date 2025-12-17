Return-Path: <linux-media+bounces-48946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 361A7CC5DB3
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 04:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF49130213EA
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 03:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E986426A08F;
	Wed, 17 Dec 2025 03:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="beXfICmK"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148E23E34C;
	Wed, 17 Dec 2025 03:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765940596; cv=fail; b=k/D/T+WY+ePp1eL/vUarpdWQqFfiRsBuhSfkF7nswxsp2bSMQ2stAyE39FRyYA331Mr4jrYIL7KcwWXHWvKmhdAvL3a0K4KzhAbfkGDxUo8AwmUPjgQxtgPOz6Kkhs48igx1bDkE8EvcDpuSoppO9aq0aC8ZQnkfuKu9+ZTwg0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765940596; c=relaxed/simple;
	bh=LjcAdmBZguliZtF4FXvn5IdjORvhpWnsin6qZMLsqIg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LET8FOU2sYZTVdTYNNsKpNDPX1epV33ODnHxXS6CfD4zsO/MZk8djlK56FlVHaF7iLkt3+H0gcgGQKhGQAJd5hBEIE1IurvNP2M8JyKAZDERLV32x4UH9+dOiQECiDqAnNWxkghgZ76LxQgHyeeQXWvBpAiIx09zhc8zo4vNPkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=beXfICmK; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtxIsE+X+bD2BgiG6naE/zxegw4DVwM0plrRUmk9OaeOn/F+JGFOAQw6/RpMhFbMGgB1lurTPyVbKAWvLVWeR85E1p9G+Mpbb5BVkpMTZKdXjUdPWJ4EJ9nQEaFznp/pHnMRgm6T1qmPJe5qV8shGXDyzSmHw0/lPBAMM/4cryLFeVBOGyuTOVOeEtIz/q1rQmR0KGBphX3t9qniomqSSvAMRLPQ3PRjP4oYggHS63OhvtFaF5PiAf2PlCKES+O+BmSuI2l1Kk03P5/YLyvPOF2xtm8torMb19qhd86RzuBiueQ98ARlDaIE/RertYlud0iA9/2YxIGFwX+cK2k3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGY611BszUEK8mJfHMK6voKkKzaFodCvYGRS29k9VyI=;
 b=X3ON7SfHev7adzNggrPP7oN1q+U8URx3kazXazaZW39BGHaD4EmWmtoJLfIDj6+hGPXUwseU41QePHa4bLYaio8KjIPNpz9LEKvebBf0z9spzTc7DAmrayARrX4IyX4f/zengJKsoOdSOcdp8H+riHQFPGcS7+kZZBZ6kkPx1tqrpZ2CgBulEFlpUV1UOKJcJD7qbRjkIIW4CNpQX2eYDhaVnvYrXGUg7QueHrUAMAmvJBCIW9ema+YovHVpdm/2cM8eqDOChcjAg/8EqVGzHsMb7HxeydTPoaI+nJJDemlFtIO8KmbkI2AawNBpcDK3bWajMCtjw2Y5BdIR9GqIQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGY611BszUEK8mJfHMK6voKkKzaFodCvYGRS29k9VyI=;
 b=beXfICmKGMQHn4fpwiCckhEPx+bJbV68Y0wF7QT25LFsWxt06Z5asRpPUBzblcETVWa+MP4H3CxiogeRUvVt+inQIwLI3Zc/CPu1we2ISqyz2WFnmujK7QyKWVrnd0evL1xRIXmYABXLI9zDhIFRbW6D3TcqEQYcZqlDcHOKaist62zNaNSUZ7APq3TQkwhLx5lcvqEmI3R37QzR8c/x5Ty3zI4dGhCJLvJTYRFb70zAc7LVb3bYZwjAojLO73qrHeTr/i303scag5VnPbslLMjxUCbc/e93vc/sikwZJz0mGyNLmbiI8FMxvWH3qBQPQsAOyMqsCYWacPOl40u6dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB7864.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 03:03:08 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 03:03:08 +0000
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
Subject: [PATCH v4 0/3] Trigger dynamic source change for colorspace
Date: Wed, 17 Dec 2025 11:02:20 +0800
Message-ID: <20251217030227.1546-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b01a945-bf7a-4f9d-017c-08de3d18ce4e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/E5Y1BR64gfSgPMkqKftCDiZA6utk9iL3EjPy9OYWWwt1cY38x51oOgPducQ?=
 =?us-ascii?Q?SUOV/Os3JHHwvrRglZ9dXdGG899tXcpqKkiN55YhKHmRYl7q9hYkZRQH6iNE?=
 =?us-ascii?Q?PmPTOPhrPxmcLJAGuvN09TZ995p34UAon8AwbVpyqD5g80uBBmI2KDSqoIsX?=
 =?us-ascii?Q?WUmuNy++vrWlS+Reiup7bJ5VOd5Ertu1KH4W+QakHfExdeZyevvHZhPjrYWg?=
 =?us-ascii?Q?26zzvzs/f1chQA8pjSM4P5y0eZzTuU1S/N88XnUPYOgFHFo2Mtra6mvojPO4?=
 =?us-ascii?Q?Q5bPVHqK2W+77KqCQ0Gsv0y7KBkKNFICWYcltbVTfJiAh61d2nLjRHA3NQKy?=
 =?us-ascii?Q?b3bO/64uSF+Tdj8NvvmIvryUIOJC70M/9rVsGw1cV9yCSVGrMtVW70fymhe3?=
 =?us-ascii?Q?+HeIDlw/tQ0/AUQwIrZ6YIZV/JgZD53LQWgxKg+X6wd9flR2Z7OZr8PbYuLA?=
 =?us-ascii?Q?O4gRBPHU/StP0Db04s0iXNw0/Acjg+3EKVg9Ai9KKAWp7BZ3elu7zxeU8gkt?=
 =?us-ascii?Q?Q5FLOtUyfMlbSUYUSx8Jnt5lJqaW4R3eK1TcKr6aeMbxfd2I3xXhDXK7Wnuh?=
 =?us-ascii?Q?+RAmQ0v2a/Z08QWsbuLN9ju2HNyTrJ60YsWJ6PD5wojEIkWcXXJnEzDG4oe2?=
 =?us-ascii?Q?WKKz2OhudDWzQOkI3Ahxq39tFSU7AbOfP3cxzMxUJLvGsj2xMMJYG6t64vyo?=
 =?us-ascii?Q?I4jncYihMgM1HhN3/ZAiGX79q5SobNzFBld0p+ODBfursLE8auJaTA8RZt/N?=
 =?us-ascii?Q?SaYxChkFpE7HSeRerwcG1339btL5JdU39L39/tTQhJ01AtliLUS3ST5AnlgP?=
 =?us-ascii?Q?cVq5rhIcU5d7UGY6dprSl9Gohbui0+5DDwv/Ti6e7PT7xE+jLFoWvDLpJDIv?=
 =?us-ascii?Q?2+JMVoVZmRV2mypz3t1jNpCXsJOcIx5PtYtQ2qMQxUmpK7c4FhVJJZkPpnCV?=
 =?us-ascii?Q?nW3vxekvuzO0KzEwd79CIHa5Y5ErESOvOU6xPrS/QkpiSbCJvllfbkYui61Y?=
 =?us-ascii?Q?tQL29JIGcFsfpg+QD8bB+oJI/bvPf7sZ9FUNWKw3xkrl/vfXB37ClalBCfph?=
 =?us-ascii?Q?KjxYAHzyAuyoBr5vB7Jmc7GQsGhse+UIeioC8c95gYQK6cdYd12uTxSQcN2+?=
 =?us-ascii?Q?Xn6pt+K92Va3L0Lk8SZJmeBKMy4y/UOEaor4l6BlBmyznLSFSho+oRdcSnWG?=
 =?us-ascii?Q?Cd7pSRRLkfcOq4Uajx7XpfNRenyv1NfgD3MDHLfScSkkNPqjRL3/oYiO14ci?=
 =?us-ascii?Q?DD+S3LoSTfHVa1qANklfrEhlspMGsp3qRX2FNkYiwuTqFs/PUx0RGCuS49CM?=
 =?us-ascii?Q?devOnsV9zS15nGL6zjcd1+rGOnKrEL4xzR4meJq59bXT3lzDCuExGvlR2x2z?=
 =?us-ascii?Q?QJLJ/4zuFyZRXnswRx9914LywzAEQE+aFIjdb5YhNA7m1Fi94y852qphRExh?=
 =?us-ascii?Q?yhq7l+j1XHweqGPdZTOLnSqb8/PpDrSR3zN2AQ0lsT6LRFE2rT7inCfXXKQP?=
 =?us-ascii?Q?LEL+4sEWeNbPCnlk3nIoej7accZjNmSuw4B+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CfHjtHrw6a4nxKhDKw3b2P2QMJ8WzDgf5yCWjDkSpv+Kqfm6htqKxowZjClW?=
 =?us-ascii?Q?2jUF/eJl+dshKr1UhGkUnBMNm1A+8wKklW+VcEa+8LrKdFsbPYcIHLfGFdA5?=
 =?us-ascii?Q?/Vk20qKBS3KgQjFYsdII1tLb4E7ihFkSHFkDDnihiYe4iL5soAJiuz3m5GSi?=
 =?us-ascii?Q?nXojWVah8gHcRtLDDIEn4wLxK1BnhyAcAzhhzEbo5ym7tr0Ysu8DINgpOuOT?=
 =?us-ascii?Q?tHpAb+f1mXB6+uGumpq60QtKm2069A9xQLx1rnRfuqCKyvqt1F856Frkx0da?=
 =?us-ascii?Q?rCWX0vUDd6mrn0t2SV3kJG66u2wDW8I3TfHZv7SAQCb0GFsYKIr3EsEOlb0A?=
 =?us-ascii?Q?ce8SyNYjEgy8NGCt7THNmfQWs133+5WAb6t5zwLbNKKCHnEcsFnTCUc0or+r?=
 =?us-ascii?Q?encDqQ4Y0Y4xEJvorVtPtchmHd6stzCaNJXly11helNwtGfXfH3SCJFAFGpK?=
 =?us-ascii?Q?TSMiG6zBfrbImJyidzWrVnhb7KVGYAiGILk5Deb9Ddw0r8o7FJs3Q3Gy9l3C?=
 =?us-ascii?Q?+3y8cJCfQD3KW9vj0Nbetv+h8Ab9br1SuC+5AVhgyKflcSILewu4pYYNutY1?=
 =?us-ascii?Q?u8Flxpi9QH8vkzZ/u/i2YSxEJSk2sr+L7XhNIREj/6aW5LLegzVxY1b20QZ4?=
 =?us-ascii?Q?tJWZVVnOs6xQ64EhiQLjO20NduvWx7XMbrq9lubsY3GXtsR9AYP9RIaR/L7z?=
 =?us-ascii?Q?W3mxjTlHDL6D0lke5xyj6a3nWU1L66yVnJSXRUAuM6M+EORUPkNHKDUNij7c?=
 =?us-ascii?Q?rJRMlf7Z9Boh3YoqjU2YoB87wanAUgjaE6lsw2gxYVBmPdN7Jh1OCYIymSq9?=
 =?us-ascii?Q?bVuaemBQzdXLY/GVBQHq5i1jKnjrcrlSMsWby9CZBlCUc4N1aUnbM6Q0UG2W?=
 =?us-ascii?Q?keiYCy93pCVQtXI1Mh6s1QwDZI5tWbWotTUY2F7O70KtyJyQLDW42B67fHL2?=
 =?us-ascii?Q?26gIkEnB/fIrN3VgVRDMEykqWM98PPOb9hmyuooDOlAonCHZxWpwW7JTCVD1?=
 =?us-ascii?Q?Lwu5oCdp02bBFOq8sy8RoHsF4IWTVdtZPtiZXYqqf0oT96+0Cnt4ipYiq+4C?=
 =?us-ascii?Q?+Nk/NiCb05JoA+QYLgVWSMaPIqucnyDozJyYyiML3hvwVbPFHZBYNZQs72tY?=
 =?us-ascii?Q?aXiDc+wTQGlRoIREh579pWCBGSc8G0EOeto3Up0fcpHkBAB2QAH3REPD9gSD?=
 =?us-ascii?Q?yNfojsL0Jchp+aWoapXotVCrWU/buOdJh/aP/qifsZbYopnGffDZoJedBneK?=
 =?us-ascii?Q?OQn26Qrnqag0iPZJq5BFKV8xuSkLoOhrfOAX659+7bC9pRwAOCKz1WIGDIdq?=
 =?us-ascii?Q?mhXoiNKzAY2a8SR7uHHdGrl6b4kz3NCwd2homh9rUOMxqoPUeq3ZNJlkMeMh?=
 =?us-ascii?Q?+5ZgNl5N/KFkAKzFbWBEroTRco1QbVCFtGtkPIC/Fzk03ozYpChCWk5Ll09m?=
 =?us-ascii?Q?tWYiZyC9py6q1UtAYuZzOfD6s09xBj5A0bkZKy5R1NxjctBgcy2LClmFUnZM?=
 =?us-ascii?Q?IY2yFbdbgHysQdb/1xGBPYW+sTi/PcmP7fyEapZRpTwO2yIDc8UGAZZl+r3l?=
 =?us-ascii?Q?kbNjVpIi4mlrEiewT4mmujGUtejgHzEuPsct81Oc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b01a945-bf7a-4f9d-017c-08de3d18ce4e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 03:03:08.6173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6THUlsOkjEJrZwHzCiH/rLO6RNoh3Lf3FhkMIOT8ZK3Sw9Q64cSHXs2WDIHU+VtRqToK1dli5mfmg3XF9mHaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7864

From: Ming Qian <ming.qian@oss.nxp.com>

If colorspace changes, the client needs to renegotiate the pipeline,
otherwise the decoded frame may not be displayed correctly.

A change in colorspace triggers a source change, allowing the client to
detect the specific reason and decide whether request buffer
reallocation.

Change logs:
v4
- Drop V4L2_EVENT_SRC_CH_COLORSPACE, to avoid backward compatibility
  issues.
- Add cover-leter

v3
- Improve the description according to comments

v2
- Add V4L2_EVENT_SRC_CH_COLORSPACE for colorspace source change event

Ming Qian (3):
  media: docs: dev-decoder: Trigger dynamic source change for colorspace
  media: amphion: Clear last_buffer_dequeued flag for DEC_CMD_START
  media: amphion: Trigger source change if colorspace changed

 .../userspace-api/media/v4l/dev-decoder.rst   |  5 +-
 drivers/media/platform/amphion/vdec.c         | 62 ++++++++++++-------
 drivers/media/platform/amphion/vpu_v4l2.c     |  1 -
 3 files changed, 45 insertions(+), 23 deletions(-)


base-commit: f7231cff1f3ff8259bef02dc4999bc132abf29cf
prerequisite-patch-id: 0000000000000000000000000000000000000000
prerequisite-patch-id: f33b49b7c9c245b32701d1a6e8250da297ccc39b
-- 
2.52.0


