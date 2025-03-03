Return-Path: <linux-media+bounces-27397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AD9A4C6AD
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A74813A9815
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10728245013;
	Mon,  3 Mar 2025 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VObUUite"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BB22147E8;
	Mon,  3 Mar 2025 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018285; cv=fail; b=suS+rCypmuBEM6aMINUBuklv1SlrjfQTWQsVJfS6jnGzyn3671YsxmFcpG7P5ITdrGdYo+5HQLvhhfxnPQAAnBxu9XlbTNjr+4mr4yRX3eFPN4fSWKh3iGsHlLVpcdrhVvCG88BtFN+T1Etgiz7C+3Lv8qp+doc9f7QkMdbb//k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018285; c=relaxed/simple;
	bh=0N5J5t9Nsn6MQ8N0NQbhR17Kw+prrNc/0i0sdkpJAHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bb57qSlv8j5rnqz/jNIzcfPVESJfcNKDwgW8MoTZYFw2iT/LIajGd9uBhAN67GgoBpFVgAi4nDheNBRPj9IghXLjI1/sfsgRzRmpEMk+Qceb/IEmpuWxIh9tOegCExVbcrFxfUcpWYMowEZo1w4OIf3pRjZj82wqjy+85SJxLVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VObUUite; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5R0XZ+2A5fUCInTsfFLPy/NnJUc2TI0zzsY6cTCG7fN5LKHevpoNUkyqzeRSMj/OMSgxB57HTiiNMXUbQ8SZe7lymCWicsV6/nZpqO+1Bd1wazb9UygNVF0h7CtFCEcniphq9kaLWhvhF6L3vluAawc+ridvB0jwj0jgm3rhQoYW/17XGOEywmi4NY3RKAi7RdRaSl2jmXK07pSI+fHI9FJuMyjHDclgcKXLgPSrr2BncPZXqBgYiz3ML1opbTQTESSZnSD8NnKVqW9blNldczvTJ6E1ZyQ/cI0rHJOTN4yJaHGSTRUtsch/76Sm1BfJmfq/JJOlUejKOgM7zMKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yraSZXqLZ3J13y3fLlZaaIF1WdGX/lHryhfcSMUfv+k=;
 b=JA4qS4ITZ/jUYLkHR+A1z9TiZURgXXjA6yuzgs1mUD+qkRgKSf/jX+0XFwCEh+IW8g/8+mFpj//8X9mcbj1lTVQdr+6jiAH+gRf7V2Seb5EP3Fry7v5VzZXPAyyvONwBYrhhwCLfUDuNCp9vBSaqcOlX+Msthxi3MnJ+DVyK1W9XwoJN/KyUyqvHvzG2sSOOoxdGooX5CfQyActAXqicW4ZjWp8n6F2mK0iBo2PKoi9WsRfT95Qh4YieitHctFO9LWbCndTcl/HDEMrp3rxN+Z7RjXTg7mYTwpgxuZgX41xLJRKRYMmBOYdy/MahsbnyLnIvlGeHaPdAlKyP8iDaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yraSZXqLZ3J13y3fLlZaaIF1WdGX/lHryhfcSMUfv+k=;
 b=VObUUiteMDGIOHGHlD4NoXTyrVIXA8rg4FhSOH5ask/rwqg0TmaA8NXbjjncobRv4Dn4kUcZyhPw+lCNBjkNe1I/+9M2MTPN/NgHB9Hy/OWCot6P2wL+bfwxuRFUZXZcpA1ds7tqtogMy5qpMueV5XqcSdAkJ3zobybxbioM4c0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY1PR01MB10752.jpnprd01.prod.outlook.com (2603:1096:400:321::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 16:11:21 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:11:21 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/17] media: rzg2l-cru: Add function pointer to check if FIFO is empty
Date: Mon,  3 Mar 2025 17:07:55 +0100
Message-ID: <20250303160834.3493507-16-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY1PR01MB10752:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dae8dd6-88fe-4314-884d-08dd5a6e098a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mnAzOWGiRHgd16gj2Qdm1lRsnYi8Dma7iLk/fBMtZTNCWjyV37WchKLwKym8?=
 =?us-ascii?Q?TB+P+LbsehnvcO/lN4IMuXn5xk43CuDyWvmFwa0IzfcqmOM0VoLAYEMoTRrB?=
 =?us-ascii?Q?06i56HqiroFFVZc/4xow+l7Up0cLiDNNFcguO2fUSj3iw8setcm6APmYg/YP?=
 =?us-ascii?Q?kZ1HopDstsCfzxW56ijFBgMUFspJOlSotibn7c9QePz/Kc9S6XZ37q6I9fa0?=
 =?us-ascii?Q?hsK7tY6HO/BTbWuLUazU4+Ce/0LiriAdVO+vfdTOCH5pACB8dKA7ULLwYl5c?=
 =?us-ascii?Q?apf6E/2j3yetVWX2pQMi0SAE2ii2GPgE5CVJi5SlFUPnXh0ED4EljixaTMwg?=
 =?us-ascii?Q?PV4aQc10ZUTDro840qwOgQ0UJVJgWTIKQ1J75GGSWvlvrHVYmZiLpVKACZwj?=
 =?us-ascii?Q?85wBiNUDLB8C4f09ooYHINbgs3Ao+rhBFiCJ9N5K9X5SNRMQu2U3BlmT5uxK?=
 =?us-ascii?Q?/fTwhkiE4OBX5Jx/B/ORJGrSpKG02bQCu1P4Erhk656GY9a9Oc261DXkgro4?=
 =?us-ascii?Q?+RjmGvVlD3Vmf9+ofwr+qoHmjeZH2mplm9wvWzuNVIq9uQjA0mDAHNT4B/pg?=
 =?us-ascii?Q?i1K9VBxBaQ3NAjVP1TwPP7B2jIu/X9RB/S9bpyZvcZIgybG/eMMcG0vsm913?=
 =?us-ascii?Q?cavibmF8howo6WZzwdn7kbvS++XFXUEVgVp6b75qZ+dWv+Rx+G3T46b3F9Y0?=
 =?us-ascii?Q?a3sdF8/gyEfooMjW37YwZuzEHoALU3MfdNCKeKBjui+URRaiAM1JuIdpvi5y?=
 =?us-ascii?Q?tddctniVLIKAMhoOMj+/iagGXbuNg7X1KzneHJjA+n2GgioFnYw4RPCHg8kL?=
 =?us-ascii?Q?N/EYUtCWexSAjnWqh6UyFCcb4l1uCMWbl+aaS6QjKAQWV/vIhZdjnAyC9EIP?=
 =?us-ascii?Q?pABI+maITcgwYyM52m58Yz947V/viG0suCigJ873BAkAeQl2pqzt3Nls2F+P?=
 =?us-ascii?Q?ieBldNov+K4NSzwr6MPXseZXczC4QZkTcqJUZk5kwoOYpFPCswG/9mwLhl+0?=
 =?us-ascii?Q?P5VHsHrbD3T10NXl5PXvjFXOjYVRsu5ert2QFQ5h/PyENh+04eR1iqNqhO5C?=
 =?us-ascii?Q?IkY6tMgU6jRGS81RLffwVZ7/VnluWFvOQXxoYGfKKunPQN5I0sqbI2bBF0L4?=
 =?us-ascii?Q?TtzgcmFWS1hZa4bEsQKNzJ3xKkz1l7njONWXspn7M7ktt1bRhXfcsfgXco6B?=
 =?us-ascii?Q?DP+iEpYvsT5bnyLakbzWKf/NGWQBn9dtKTddW0RbN8OsbbfG8aoARQiffKph?=
 =?us-ascii?Q?GnRFhTOvBK3bQaPNrUvLiRQxF2ZaqS9E8bp9uUwWRcUcJ+fdKqrwjL+TbhFB?=
 =?us-ascii?Q?F8fAnVNvOP24OTlWdArjot0yGgUz5qN44IGlnU0EjWN3WGLVtFyR1PnMBSC0?=
 =?us-ascii?Q?xjLSQgLqhnlW5zb1lJb+XKnpbixwQ6MLYvtr0LRdzPKbAamoiBjDTkOfR83G?=
 =?us-ascii?Q?Fz1g1odvu8vyd5Amztbn7LyqOta18hvW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aoCeJPCNlnjK8UfYBrQA99eGWjvzxALzVEgHm8wwbJNRRGFh5Pz3HJAEAiO5?=
 =?us-ascii?Q?6wR5hiZnhKGk9inyENPgWC5sXD6jPsHItujuu68WsuSvKhtWzRBA6hkknbjE?=
 =?us-ascii?Q?JwlOnsP8GahPi7wJZ7Udqnk/u0b9SdCcMtoTnBLRwTySeVXx2seR1yU50QXO?=
 =?us-ascii?Q?KvgqL5thDzTi6QKXFH8XrDcwVgytmBH0tGDzOCRYK/M6cnOeFDP4oQAQJfkx?=
 =?us-ascii?Q?QM1YmQ36DvhnWdnhuWq19+ehAW+p9R4ih4/iPA92s9yNuhrxmxls4yVFZpfs?=
 =?us-ascii?Q?pAhIlIweKgJB0x2n1XdBpx/KRTr7KWkcqb8xIFHpujADfih8REPVHg5BiS35?=
 =?us-ascii?Q?JpLXnD44hbK5rAzoFl5tFx7ts0Llr03U9VY6PcpbM5MtEp0cUXY7f1yjLP1B?=
 =?us-ascii?Q?6IC1oSSqz6zExWOnPPWpzPVQe5iLVJ34CpY4nGoFYWc4E3wlDQ2ApISYCOJV?=
 =?us-ascii?Q?clyizOziLPVVCWd2AkQPhkWwhDpFVoyN9ETlhbi5meAp/ssLolV3IWue5EL2?=
 =?us-ascii?Q?r3DmyZFDec9+OJR2Ug75rXttcioickWVMWjFZU4KQCty8PM0XV/PKfp5/Ggj?=
 =?us-ascii?Q?fz6hvIlRKVPChTJZiYluvoOvtEtP2A8+Im3Q7dsdo02WqD/Yclm+mxdz58oK?=
 =?us-ascii?Q?iWkKKmo12Wped1pPrVNDh1mfKofiXoS5DHoUnqbdErUe/jMCNMr4S2IB2IIX?=
 =?us-ascii?Q?fnZl6JesyFz6V/s14s8DAGRtVTMLg4wb29n45XTRGMrAUmCQRzFyOjUuIZTe?=
 =?us-ascii?Q?UVcN6kS1sn0oblxJYRX+8wFO8QckQ5KbciNY9jBnRsw8vHsCXAq6GIT42fLp?=
 =?us-ascii?Q?tQX7DEbV2Y15LdkG5j8SRJe+7O4444+4xfPuqG3AtJ1QaI9B1DicAmL7RxBT?=
 =?us-ascii?Q?CazhHqMhevYjW9kOMZr0LwtKlnq/ozfrzgLNrRZhTEvHRhTAh4zITBsVTLBK?=
 =?us-ascii?Q?HV5tI4/uW8my5pu479lXhktgwIk50AqzgfDLUx9Sjcv18yWREl77Yo2A5Hog?=
 =?us-ascii?Q?C9RCVn/LsY3C/e9tJ7GDuwQQFzn4+1eDgN7zfWkJf6cpUvYOpBvpDKrdmnKn?=
 =?us-ascii?Q?6Bnz6jTivuFGzS+tVBOAUCpZZ7Zvb4mpQP2Z6NP1sUzVKGByvJRKZP4sfAMi?=
 =?us-ascii?Q?C4gghYfy1xTD9DUCKNCgnKCbnkOjgj/chvt4VvNFS6OBKfepz2vX7CvCMscp?=
 =?us-ascii?Q?d8/mNwl3RPZC6bqWgPVd6xZd8yNPD1UWm/DAiqOuJur/SZwuKlI/9qD+zdcK?=
 =?us-ascii?Q?8ysZnZ5ME3yI+UXvoz+eWolvh99XhDtCL4oOMWfEYcTJaeEVp8jaMoe1yMG/?=
 =?us-ascii?Q?c8i2oyKXfW/z+GzJPwRkQN4ouySD++vUtGKe8Kk3drOMG1SfVdHOfZ7vw5Pa?=
 =?us-ascii?Q?C3dNHkei81AtAYWCaFi8TEKMZqlpQTuAqP+E7t0j0gpMRFHVIwlN+O4+XBLE?=
 =?us-ascii?Q?LNCgb9xNQvn7GqW2k8eJx/PCC2P61Rikh2rF7DDuZ6mXhZR1eEEaY0O76gD+?=
 =?us-ascii?Q?/mB698yIq4LnsGxmSdBisdzTUREP7jkYHHAG6nLNEPEKk181gnuwlGFAMbTX?=
 =?us-ascii?Q?67Vhv/xYZkZHjJFN656A2SQKRZZ65wNXzOj+UTxDNslHZ+EuDhrINeeI/eIX?=
 =?us-ascii?Q?4td3MHQUNqcd3LRHxMu7E44=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dae8dd6-88fe-4314-884d-08dd5a6e098a
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:11:21.2780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ADNvz4RsuFSZdjWcnPdZEshcyMOSqMyg+3DOYJ9ftRwWdXUFzbCohQjc5mmBQrtxcCPshu/b0iCiwpOrw1qrlWgDeFmd6a5FXYLnuDlHQDXkWbJc4/b8pxe/UpWN01N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10752

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a `fifo_empty` function pointer to the `rzg2l_cru_info` structure and
pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, checking if
the FIFO is empty requires a different register configuration.

Implement `rzg2l_fifo_empty()` and update the code to use it from the
function pointer.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Fixed return of rzg2l_fifo_empty() as suggested by LPinchart
 - Collected tag

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  1 +
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 +++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 23 +++++++++++++------
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 302f792cb415..e4fb3e12d6bf 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -362,6 +362,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.irq_handler = rzg2l_cru_irq,
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
+	.fifo_empty = rzg2l_fifo_empty,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 3f694044d8cd..2e17bfef43ce 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -88,6 +88,7 @@ struct rzg2l_cru_info {
 	irqreturn_t (*irq_handler)(int irq, void *data);
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
+	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
 };
 
 /**
@@ -185,4 +186,6 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
+bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 8995aa254c17..83d7baa07dc7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -290,9 +290,23 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	return 0;
 }
 
-void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
+bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 {
 	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
+
+	amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
+
+	amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
+	amnfifopntr_r_y =
+		(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
+	if (amnfifopntr_w == amnfifopntr_r_y)
+		return true;
+
+	return amnfifopntr_w == amnfifopntr_r_y;
+}
+
+void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
+{
 	unsigned int retries = 0;
 	unsigned long flags;
 	u32 icnms;
@@ -320,12 +334,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 
 	/* Wait until the FIFO becomes empty */
 	for (retries = 5; retries > 0; retries--) {
-		amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
-
-		amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
-		amnfifopntr_r_y =
-			(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
-		if (amnfifopntr_w == amnfifopntr_r_y)
+		if (cru->info->fifo_empty(cru))
 			break;
 
 		usleep_range(10, 20);
-- 
2.43.0


