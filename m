Return-Path: <linux-media+bounces-28805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 028C6A728C6
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 03:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FE8516D115
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 02:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D76E13AA53;
	Thu, 27 Mar 2025 02:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X/4XA/BV"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7E16FC3;
	Thu, 27 Mar 2025 02:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043088; cv=fail; b=Tb7HY/TQT/tmj29U+Ys8WYyYKJSGRojIRT63jqMxfKGxRJxNapevh9R1DOe/3OW51988P5v8rlqWLaf6Lo9rleb+Vra+6SyuAo64jg26G3VejxuFApDJ00vYU3fAImiOV1dzrgHU4VXfWdQuJ9W7z7JO9/JxlQlAOQN6qPRZaM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043088; c=relaxed/simple;
	bh=Q8ChxIKyIOdKov3LRcyySPI0AI3NpyUsKtz9QaHVw7g=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=e5HYA4ps3MQjmEJSBBg26Ks8C5HmOtdGcFWY8jXV69YUTdqOGbQdEi1iA6gSU3W5F8p8k+1bz2SAdY87m+T4YZaXZj8K1XMdxhxYb/lYK6eb+pl8crzhndloCZJ7ToZfZA8ZXTa2xoMGDsv+O2sT9tS8MpfwnoU83kXY/nzFr74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X/4XA/BV; arc=fail smtp.client-ip=40.107.20.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdnLzIXFdTFrRCDt4oPDSZVobRfxzlU2i4BzXgOg4EhhHT14LGyEoU5pXi+rHsXZmxAcHu7pCKcpveZVac+sJKisavl8wKhX6acqn5QafF87danum1ulEC+PKDSdhfBlcQyf4hvYxqMwPGvPV7l3vNRlVA/ZQsQ0CdtGhd9aS8rrbZ3Fak2yejbCRbRkk9elrEB+RdaMwCKqc0wKpJlt2NsEWIvBracP246OOgy80Aycv8T9IZk5eG6AuaXbHrPeU5GpTy83s5k6IAwhvhJrlC6KhlhgMv8HoAerD93qBv19jgCmp55ojsz9BWzYxlVzACaZu3uQs3BBhIrRAJprPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+csSuqSKO9PSrm0drX0fc2/hvcaTADa0DHjvy5ko7E=;
 b=hydjokbdPYeLjB4/kPVKbsKbAYoNJc/fTKSNoXnwlQM7sa5gWudLXC60ImbSUiuwBiVWLMKH3bWdYlcQbPK6LMeTheg3h6ZikVzaqBX6CHVanHXlGxgszVYKUdamEgh/FrqJiD9yMDxey7dV7E3ij18s0k8mly8bJ76hFnkO59rWT0vhkaOi40OCUpfF/7JRBuSIn67rNrs5oMnA71U3Vj3y2w9RihnnXHI9Xm7AnfxVEy3zcqdBRTc4D8nZjhj4+ON+srGYdqfzM8NzXLVPR7zUE4QHsCDLyFhcT4f13fwTlakAUbF7bOp4Xx3422k8DaXoqApyJv5PCk7/fW3iEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+csSuqSKO9PSrm0drX0fc2/hvcaTADa0DHjvy5ko7E=;
 b=X/4XA/BVHC611ndYXsacOJogldzr9HyS4AUa8eqJhRYHkrNgsrix0jlu67jGdRKwswAbvLhzQpWC4HPSwpRmqT33gFIJYx8eLJWlcOxBT+pCMp3ZiTK/TS9GpDB3YsOyRM7Qy9SfsotxsSYNGHwhvDS8IJv1ENGW8KXVFG8POfmHr4k+nWOJnMzXK464wusuc88gHYkHfmmUgQT+GFkViNTgWF1/LRXDn1yoNgCB/JNyt2A37dnCaytzYlLhsgS4NmhSRZX9hLNDF9Tko/KRs08wLnSbZ7/Yu+59O7dxZQ93D5EH9z1f7lRkJcb4sDnOS2i3cKYSs6wfoN5QjPA08w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM8PR04MB7988.eurprd04.prod.outlook.com (2603:10a6:20b:24e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 02:38:03 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 02:38:03 +0000
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
Subject: [PATCH 0/3] media: imx-jpeg: Fix some motion-jpeg decoding issues
Date: Thu, 27 Mar 2025 10:37:04 +0800
Message-ID: <20250327023710.549-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM8PR04MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b345f57-61d9-4d99-702b-08dd6cd8659a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yc7g77JYUdo48Lh34Cg/dZ6haITb/ubqeu6KCDrSc3m2Y5ZB+1q+SUqrNR4k?=
 =?us-ascii?Q?fbhaILUBF2TiiXG75bYgpJRVtL1i6WNpS2cLDkn8vtmD61g0fAEjudnYbNit?=
 =?us-ascii?Q?ieU+rzE3l3qfCrIYPdIrsNNaMNeo1Rre20NcSqGKgJzXOVeLM+iltKgEnXhp?=
 =?us-ascii?Q?sr/i/YXXpciwYxYmPelMLvePHOkbUT51pM6XR1yLy/XIT9fYVD/Y7bfkPJBT?=
 =?us-ascii?Q?tjuXoEc9jsTNaAO1b8G5s5Mw9BPZ0JMah4GI3cTsLozGvxPANlC+3InP8GuX?=
 =?us-ascii?Q?L5QdUe565Cl1QXjXfNTAJws8ICJ6WD3MWnR0kawHDMwgGnHowOEn1JWr/AD8?=
 =?us-ascii?Q?sykOolIz83cinleILBVRH45IBuc6vWAB0P3yZr+BXFS80Lg2Iu8XV8E3LAK9?=
 =?us-ascii?Q?pk1pPeC++EAVz2AoqldasJEzpPfCGjacDpztk8wklcrX/PyIyvFAo2p8jKKa?=
 =?us-ascii?Q?pBum19sUPRTPls1fC4DHSf5GZ0733RX9mDNbYRMvUZ3+mV3v0/SHJtfyCciv?=
 =?us-ascii?Q?sNDHuEULQvkb5vwXZvm6mbIHjZzMrl2QFO0/XMUoLdL01qA09qGyP6Vddaqp?=
 =?us-ascii?Q?e8e0DmMDW0QQI85gj/zSzX3zb6VW/S6qJAE2wLdTT3RElzhnxOcyE/MUVrmk?=
 =?us-ascii?Q?uxVHNLIVTRZapK3NBk9VjkNBh5ehIDjOWO2OCNZyM77pegoVWkwdRHKw4VDQ?=
 =?us-ascii?Q?OXxCYCPiPfhYF/Xr4AKuJrc8wzHpn8yuVFJSHuKfAsdVb6MxWIXDI1r6nrQN?=
 =?us-ascii?Q?S95SvmUZ7I/ekDseFgQdxNoX7cknTjkf3Zo8MfLtO2DachYniCnHIc0dpTES?=
 =?us-ascii?Q?EFnRLZNlvOl7TtacJho/Auk1vgbc10sH7+sa+q1TlFnAcpVHQk1Pi+iN/T96?=
 =?us-ascii?Q?HI/I1EMhFz4ZDcl4zRmk3vlgaCAjShHCqSq1ANUePTfNi+KAg8GPNqobF8cB?=
 =?us-ascii?Q?A5RfSWKjrfxPjWY+wApMzYUMuFT7vkYh/qi0Vlr3Y2qvCx8Vi0xJdDBZn8WI?=
 =?us-ascii?Q?2HbypcwK8CRRatluVpjooghrm060oVzV8aMjEd9knsrU0cBqlWwBwfQShogn?=
 =?us-ascii?Q?6ZYHiGVFkh1z7eaPwKYXHjIMhTOQwEDiDGGNpK3jFml7mmv6o67GumrF7Aau?=
 =?us-ascii?Q?YoJoIUD0gBslC/v2X/fWIPJsHCr/TJFi7Ui6cg93O88k3ukz8vlVfoFfKnYl?=
 =?us-ascii?Q?6o1yT/cygWxPMbUrzJ0GFQ9M4Sm28xzpn3+MWfCehmzbnjHI8IWX/Rwe/J82?=
 =?us-ascii?Q?Ngv0/r8ybwpu1Fk4rCQDC9j8JtsgdRfVsPg1g4lqLHusJ7Efeh3Y3vNNvzLy?=
 =?us-ascii?Q?qIY6oS20Hh6Tu7sZ+GJFJ//1aIyF/CPslKdqLVSvP3a7xyLugp4M8J3+EnRW?=
 =?us-ascii?Q?wanJJbJkkzA3uOA1KIvQdlYdI/j52wsr/pnOqI4aFbqnkIF3tnaFo20ftGd8?=
 =?us-ascii?Q?wPWF5t/HqgKT5Cv75PCssyfVR5MxkRVE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P1ByZVwxTWBiO0pRfV+GhtICPrDuUgKue7OrmO/GZa92zKP5gXyk+CXmimlD?=
 =?us-ascii?Q?6z2cgtPtloXiby93yV9LSyHyY6uVAnQd06cBJWDM66hJmd1M4trINk9jfPLy?=
 =?us-ascii?Q?3ntPqD/yY8rBSdadtrOz19P+JF/Ov2WvogXejctGoJASbG6CcGXktHKSusdK?=
 =?us-ascii?Q?GblAkl2E+dUhnwVtHitIqWo2aE8y0+sTYl2bURZ/xiJICBdDtUFIw8+c2iwq?=
 =?us-ascii?Q?Ls0IzU5//bUhV0TRqbLJIx9Z9Ln+Bb/Wnb4FMOaiOidpTMamCWYWZwiJLcgz?=
 =?us-ascii?Q?CG6jtC3uMl+dwgK5G2klfuU49fTdBLaOI7mtQ8YOU6pO220gn+0vdpE8daQj?=
 =?us-ascii?Q?r8sPeE1+e4FW1WogIBOxccTwOrCMvznhNw8Da64/a/6d9OJLjcHLnV4X/3Qb?=
 =?us-ascii?Q?qaQ25Xa3Tc3u7XcMVqHPCeNpz+qID3CFBdMMTrbeXUzOdYt99AUniUSrwU9H?=
 =?us-ascii?Q?/FBeIjUGvU7VCtCQYLkqceoOZ5plKb4jVeLkkUGeyrYDLR/P5v4l99uFUQxt?=
 =?us-ascii?Q?XYt9V+RQ3MxhhNKHWofFu+hDE3TPbJJeGviaEoQZHAlG625gTjbRCYZfpU2f?=
 =?us-ascii?Q?+kqslsb1uhX1evQi5vEFeNlEFPhDrge1dqx6I6UQ4Si73xh1A2lucyqei+V9?=
 =?us-ascii?Q?lQlT4sYxtgPkg01bCVWKjHjPPhTv6uOwhV15VMGW95hRP5pQgNnVjcNY7UE+?=
 =?us-ascii?Q?7ioqKuTk3zpJJzBCzQhokbaI6/tjVqj5euAj9SEE09g9a319JUOWVyyMSKSz?=
 =?us-ascii?Q?4Ez34NnyqPGJRh+XdTYq208TXa8Ynh91zD0TsCoeY1kWKheHSQ/Ndlpfou/o?=
 =?us-ascii?Q?c7IkiSUUOMnzDpCI6EQhoF9GXrLt8DcFPlmICxTQ/uvx3iKrONfr860etTBw?=
 =?us-ascii?Q?ymgysKXzhW4e6rh7ZdFePIlNYBWOGz3w3nOsfhlqV4y9tjxu4LoASAV8ZysD?=
 =?us-ascii?Q?WD7avx73V8EYm62ew9zG7Gk98XX0uFHBsFinNlg36KH7vnFnegMrKUKxoGfb?=
 =?us-ascii?Q?KB2Fo/RdmZONNl4DmfneJudQRfnCJVMcznj4W8FGO4uxkBpf4tNO5Eq/Zvp+?=
 =?us-ascii?Q?DH+D6e3T+Yn3SRm/Pz8nBLSIn3gBAKkc1oCNid3NRFNx+G73jEhW/hMw4lO+?=
 =?us-ascii?Q?YnIuZ2gRl8/IhDP7pxSYZA2G6MrNRxLEqa3P1bO7PWPpx0+59Vd2Qm+DL5+3?=
 =?us-ascii?Q?8lXAfoNas07/vIehxWXwQOlQS6Ru06sg3ZJx9DnsZb+1ygCTx12AuW7e4YSg?=
 =?us-ascii?Q?qtwZRY0QA8sqZ916TXIeYXddw5UD+GxnxGE9OMe+5mluOs7Ml0RCZJ90JFjt?=
 =?us-ascii?Q?V/5/gnDUThOvs7c4yRaa4N7facAme8a0GlASztk61XNVgEUXyiS4hWM/Tmp+?=
 =?us-ascii?Q?DVTJKjjnFbu4mFV+2X+BOi1d5yYAPNGbBZXV9NbvfzbINBrTQ7MWbZRRR+P8?=
 =?us-ascii?Q?dbL5VkXWLiT3fpx46YScij1I4yoPIG+gaCBtqHC/9ogBFeD0rAOZjWWOJDfg?=
 =?us-ascii?Q?uMmbCMyPCibj/fmxuIgeppskCNS1zVOEhafBg1oDDG+8iokRhjPLI+4/QePI?=
 =?us-ascii?Q?x9ZyVOHuAl4WJVxEx7NxB0FQaX7ABnpG7ZZpNRE5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b345f57-61d9-4d99-702b-08dd6cd8659a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 02:38:03.3194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEM63Lad5njboJKTFQCc982Mtn05Y8pFW9KL8CG4eksh/nWUJUZhRmEM6kQtPpWdhP5g81efvXwPeiVTWsIE0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7988

From: Ming Qian <ming.qian@oss.nxp.com>

To support decoding motion-jpeg without DHT, driver will try to decode a
pattern jpeg before actual jpeg frame by use of linked descriptors
(This is called "repeat mode"), then the DHT in the pattern jpeg can be
used for decoding the motion-jpeg.

But there is some hardware limitation in the repeat mode, that may cause
corruption or decoding timeout.

Try to make workaround for these limitation in this patchset.

Ming Qian (3):
  media: imx-jpeg: Enhance error handling in buffer allocation
  media: imx-jpeg: Change the pattern size to 128x64
  media: imx-jpeg: Check decoding is ongoing for motion-jpeg

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 109 +++++++++++++-----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |   5 +
 3 files changed, 86 insertions(+), 29 deletions(-)

-- 
2.43.0-rc1


