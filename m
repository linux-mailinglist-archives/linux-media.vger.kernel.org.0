Return-Path: <linux-media+bounces-49908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F69CF3927
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 13:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD949300500A
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 12:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D249730EF6F;
	Mon,  5 Jan 2026 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Ju16foAY"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013023.outbound.protection.outlook.com [52.101.127.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FBD313542;
	Mon,  5 Jan 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616880; cv=fail; b=QteUUyS2eyTR+7VRdzBY59/3gY0SizcSthvpj0H0eUDDgSGeL8k4gkVqoA7METrSGO62SbFAJOA+0fG5B/moV6HyW0gT1Ncj+TH0Ft+z3I5TuiDswHOMHU9wRRN/+b4u3YdVVM9h1YJtBOlw+YSozAIahZyXkzFo4kfAp1FgTrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616880; c=relaxed/simple;
	bh=Oac36ZMLzf0uLnTNAvCnXPQfu17gaQNSaw+LWO9/log=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XQMaVT3RSru4nSXY4O2CqB1skkPd9f5UlNCgTLY7xcfFXOZGWiSS13wBeNzhfGH+XOCNutFG88OaHAZuVA2mTfdpuJYn6ioi2TQtj2xD1nF4qyp9gziYpFZkk2rpC7adaTMSM/SsF0INghcNtPB++nyVfJFRan88zLe6BVH/+vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Ju16foAY; arc=fail smtp.client-ip=52.101.127.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDB0o/HdZXC/sBmdMDjjR30rflE6oh23C0XUcPFtbe+8913ahiaXKPIql8SP6HST97FwVefoupgnCe4Ma1buWzXMtY/kKCpKTYoeOD86JaB24V6obO5cni2zhQbSGO46g1mixOa3cwnWxXi3evMD3vJw77ydEnRTloT4YxZJ3u2DHuEyqeVon9kxx+ITbM+LQ3BwpwwGdystwHOdoojsrFiKiTLjrbXAoPx8iyxWooyWGJ21tHiCf3rS1XTxEWoGx7+6R2bWOo69iC2nOZoW484JoUQVVw0GHOh8hUVlAjwzN7VJmjfzs6vQ/pcTdOBMlNsm08XTkDlkMbh7/0czKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0O65MGTTI7Oiqe72gGssxAvrKuC8SfrVJVO7ElOX7c=;
 b=tl2v7eb1Y4xAmO5wBxOT1W8JNX2SNCW9cJSinWdoPCOuJAwTyd4kGHSszXkKH6Bvqpkf6xkqoEaHOjtzjVxSz+qboiovM3mI1Ncwu8WND+CV3oJDx39VwUAINUWi3v09vw0lUnAdJILuhPKMxlX+S8MfPCzrYfX/J6zIgyqteEIy7Mp/NIPqw3mc9dXLGsLQylIl6zJxnUTwnPfw7dOhjgCuNVcAng2ScJSERmflTMrFX8OMYHc3ugP6P47gflDDujxMdPClfyiBd8kACvEb2Z4y8JL74VYWEHBcTu1CQk3uQECYiU2NNdY9oYU1CE42gwoHOuKAEtM5gRWied8NKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0O65MGTTI7Oiqe72gGssxAvrKuC8SfrVJVO7ElOX7c=;
 b=Ju16foAY+58e+7sOyQCqTkUobYZKEYAgdCUCYeLJmxAYL/4v3MUJK/Ix+dH/07YCfHAF/Z+ooR2Nun0N7kffiToSFXYAB34rMg1GS/rNyDCw8iQY0bkUXlVmzj/K09Ifav9FNezAc4BxBOsWFaXV9xU/dDnRa5c9GBEqJxng/TG+z+4LbGlapAj06srUTWIBnjXeJ/HMKwmsWtGaeAWNb6BHfE4L62esID/G/oppj8Ir0DptJZOdvGoUJJZDdcAF1BduLeTla+FKGLlV7aP/nZOzpyddoQs92eSrkiyA2PxfHD2bS2AiAP6JEJ936UNnwkpnDbyrGYRPV8lqEy197w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB6874.apcprd06.prod.outlook.com (2603:1096:101:18d::7)
 by SEZPR06MB5829.apcprd06.prod.outlook.com (2603:1096:101:c9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 12:41:15 +0000
Received: from SEZPR06MB6874.apcprd06.prod.outlook.com
 ([fe80::48fd:e57b:6f8:2763]) by SEZPR06MB6874.apcprd06.prod.outlook.com
 ([fe80::48fd:e57b:6f8:2763%6]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 12:41:15 +0000
From: huanglipeng <huanglipeng@vivo.com>
To: sean@mess.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huanglipeng <huanglipeng@vivo.com>
Subject: [PATCH v1] media: lirc: modify the timeout waiting time for the infrared remote control.
Date: Mon,  5 Jan 2026 20:41:03 +0800
Message-Id: <20260105124103.78147-1-huanglipeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To SEZPR06MB6874.apcprd06.prod.outlook.com
 (2603:1096:101:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB6874:EE_|SEZPR06MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: d074ae2d-dfdf-4740-a764-08de4c57b6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KgO9DbHlnTXc/LwiGvrqmGd50tWgkODDc6uf1gRWSASOpS6+8yGYH5tgf2iw?=
 =?us-ascii?Q?8S/l4Fuc2Cf4Z7GraSKK3oDbT+XRKEcO/tWmfEVBYP9Z7cchlV3eaqVrbYLS?=
 =?us-ascii?Q?gIFYeYNnTPy4i55XpAxVsrFzI0LiWDrYE+C8NvU3XCurJCyAhlsLeue4vsGc?=
 =?us-ascii?Q?kqrNI0P/UFQLAoR2MNFcjvqyz/09r7ufR5r5IRaUeEvCh1qagO9awy7X2OEQ?=
 =?us-ascii?Q?aGrRP5o/h87x+fWrOhKw3WqA5G+K784ZyO6bZsMZp+awm1828+Sxi7a0wE7t?=
 =?us-ascii?Q?JWnOtnIv8zt/kzDqHoDVONky+fNjCt4nlMxaeJv/j+CRAhwxHw271t/GOPjd?=
 =?us-ascii?Q?HUtlJMnuxqjLhhGBOh2zEvG/y4cmB84dOIempWYH+kbiaRWi3TF3KWCMrzxF?=
 =?us-ascii?Q?sDzJCye4i5JcvLI69UmHvIUk6zuMGd0Tkree46FQF2xtFhFvlPFU6HmMVEKo?=
 =?us-ascii?Q?Sugy06EpqfOZXs5WJFwC8M0mEAY+SrAn+wjT03S9lWUzvq92XvdPB2avlCYb?=
 =?us-ascii?Q?Pb3HZPyBlXcQghyGnSt3XisrWdwjaNH6tU8w6uiAAxSJNDD5Sw9g9zFUnZUP?=
 =?us-ascii?Q?+xe/8A1TfDErpeWapZmHa3QE0rfccAesUtyLeKfXL6HMngWMc4L/0tdOPNRd?=
 =?us-ascii?Q?W62Tv49IPFfDPINeO6CoFro/IEvym2F2BZ9kfYVTvmDOPckIG+9d9yrCiy5t?=
 =?us-ascii?Q?y6gm/5eIw8j4Be0sDMcQeaASOd+1bqSjpp6UaB3vn3jecsY9H77+7bt5n3Ui?=
 =?us-ascii?Q?FfbGbkA5MzlKo1+kDA6dZU813RXVn5i/2LJ7iPA9cb5MIXqUchwafbUNtino?=
 =?us-ascii?Q?7LKyp+sKE5s3Sya/HzmN90h9rh6l9ZIaVHAidHYoeSdG+pPI1LuVRG+u1Sik?=
 =?us-ascii?Q?kolS/9Y1UPiOzwen15VxPaqeEKMsSmcO8nbgnmz7RVAofVzB6rzlFX6Zz3Hu?=
 =?us-ascii?Q?LJDIkMIGCEP1PiJxDO/sDcWsJRTyN7mOjDpkIo/fSfBrvK25DOOFbOyPXT/d?=
 =?us-ascii?Q?mV/NkJZMuJPrjE8X7xFZvlZJxTawaMsbB/GOjaMkCpObdumVEUt/LOk3sTU9?=
 =?us-ascii?Q?ubYlzfU5WKbiN4A7gDByFgHpeRFJnrOPFGHGjdis/QzQVPUf6cYjAQq5cjV8?=
 =?us-ascii?Q?fk55fKCmM05W1IdB/GTqAsUoRYzRAADBvZt7Lh3a4UFSjWLMjuS3yHcDwqOI?=
 =?us-ascii?Q?Vys1hQS4ip5glRKzU69Mn6l6nlvLR9pl2bRx9ivQdPE+717sF0VPeAERZ4zE?=
 =?us-ascii?Q?HUaegMG9VIMt8iAGfxsEPcG5wDyJeDf6OC3GzaRgp7NWJdH9Heyp4WvJEG51?=
 =?us-ascii?Q?sLc75JVTN5wlrOUT3QK1Gv61RfdNdCTHLmjGnV4FuvrS7S5b5CGD93tgcolt?=
 =?us-ascii?Q?iWw8mMozKmUyhbkcR2gsIHd/P3KRy3L54/GL2gFGDBWdCwiF0Ioo0jSBU7Yd?=
 =?us-ascii?Q?oP6wg5LCjCSimd87Y4CDtCeIJNIOfPVXhqWhj2uiy2fAaBbX18DbtGaOrd7f?=
 =?us-ascii?Q?v8/HASQqbyEWIQnLXKOhQnYRPkJb5/k5UIM1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB6874.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mktnUnZjUtDUIbP2R6N8nxK6WtT8tg1CI5K3KqYLTWeLk8yuXAEX4IkIbYdK?=
 =?us-ascii?Q?1acS39oT89mUHROMF/2p6kKQSR2hztd0TTC7vAbyKRLMrqJOT1HyIAEczTY4?=
 =?us-ascii?Q?8m3hRniBl2zzc9wW3/Sxq2bxHgxYjsO0JWjjLiQoFOhreL8qqG+VRr57pfut?=
 =?us-ascii?Q?pEl+8b35l/B6ksAbjmVwKyqamh+JpGfeH/spBL2CzQXfWjQow8chN+AC3w7o?=
 =?us-ascii?Q?qUeXGl+likzSObZUAaynxFueaQ3AK9lt6ukVNLXufghUs7HO09ckA95ggWhV?=
 =?us-ascii?Q?TZV2GYPChyYNbKVuI4aIESAUvEd4XOv2QYjij2zaRFaJTE+d//6mwoUKmSWR?=
 =?us-ascii?Q?YyMsFzHKIxQ4WcB5fmLmwoJeFZI4j3H0OoiL8Vkv0FvJoTJwr8NT+qwesrq5?=
 =?us-ascii?Q?LjGKClO8Csmis3i4Bdg5R5epccQEkRyOr7XSWc9B2Wy2YcPa5418jQ1oUcqE?=
 =?us-ascii?Q?5JnjJAk13JT5VaHXPKxE9uJDMsgyzAHU+NP7NzTIoik0dhr9K1I6d4rIT2x8?=
 =?us-ascii?Q?oWwwcaLUMzrJ2rdVQ2RHeiRqV/mE24X+yE+QNNyrBWW2yaLrVeMripHYGGRP?=
 =?us-ascii?Q?xwIJBNmL2AnxVwKn9w0H/BJbgf/ufnr6f0U9k8m6miPKtOUXCmHTraVFuyCN?=
 =?us-ascii?Q?PuSEbApOJ6Dv3CY0Nqn03NbLvZU2nvzTa0Am9DHJ9Lz+zu+hAFsvnxtV57Ko?=
 =?us-ascii?Q?G4XX1RgHXlrQovU1PCm5Kq6bKQpWMJEWzzqKzVTn3eT5zSj7fm2Qwynzzw7M?=
 =?us-ascii?Q?XnZB5DB0VcWMUvjsRx24zpISSlviTZd8bNvULvpIHz/QRvtwfWdIe5w4V7VB?=
 =?us-ascii?Q?/+e/3qq6g4DqbI3pITMlugn8ox9SB6FvRXKbtcXQLxRTw5ceTlt4En0bVBvW?=
 =?us-ascii?Q?fApqdBTuA85q4DJLLcaBzZGeOgzO46KVpYRnGMRIvtz9viYRI8jCPQG+Ga7C?=
 =?us-ascii?Q?o56h19njRt41cGugDnG8ObDEpIGJuQotUiSIEm4jjPvOx9DpaWOvNjZzHv6Q?=
 =?us-ascii?Q?945QUSC2HlU3/FOhasIgDzABvoz+zjrDFY5clpKRXUeIA0JNyqLkGenyCnr3?=
 =?us-ascii?Q?pQRfrP1zXFqzIf4jgpbEBMej0FrxKs2ARRE/biB9nF2BijGfyAUhYX6+dZrx?=
 =?us-ascii?Q?EEzTQto8vYZxsfI7n1LC1pqHjeyVwKFeatqn2uAv3i+8GKZpRZnXUjaFeCMh?=
 =?us-ascii?Q?6pRNRhrTtAQ9yUzBh6NIw1ngsY4kF1Q5dtkJVRbSm+QbAgScGOElFIntzuug?=
 =?us-ascii?Q?5b1/f1E+OqFZIV0Muf2kwbmP/hsUdzVQSVci5stsYGZ3xPIxWEI9NMJv2CIk?=
 =?us-ascii?Q?uFetOk5Ef4JAezv0QMhlrejcnpjaCArSB1zBEzTvP/bgNjBZlV/AV0i4yzMI?=
 =?us-ascii?Q?YpUvooFSdCLl9KdNa7x3tNojvdtS4lKIHC0M3KpJDX+vEgvcCL7sFE3SSM9A?=
 =?us-ascii?Q?F6DynAVhOn7BL9ZTNqlhYnuZC4nS4ZqYGGFbDspZsp02YQFPOFewPQA4kPJ7?=
 =?us-ascii?Q?py0hkzk7PNXlj+Vh54qKum70+Kr1yKGEroZ4ZVsxOOhwQm/jazIG7O9rNffL?=
 =?us-ascii?Q?ThJnj7C8oP3T5OkEEwpDUtDktwcEOxLs0XBA0b8wOouVyIS3/rtebwwIXVls?=
 =?us-ascii?Q?zFqXOXBDeVMb6Er9yKOFPOdYefX3O1blgoRQy64jn/Wn6sxjLZ3bUW1XLNHu?=
 =?us-ascii?Q?8MsLApquKY1ffTnFliq+5xeynvSKFgycEHLcfefZrJAS99g36kpSiKibNycH?=
 =?us-ascii?Q?Oly1mMw4mQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d074ae2d-dfdf-4740-a764-08de4c57b6f0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB6874.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 12:41:15.0542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIfPgIs3EDsj7mCHBN3a84kA1Kytksd7gAf+dLr5+a3ID0vJbtDplPY9q+EWCA01qUKUDBhrPiE62A3InqYulQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5829

When certain infrared remote controls send codes, the kernel side
does not receive them, which is due to a timeout in transmission.
Modifying the maximum timeout time in this area can solve this issue.

Signed-off-by: huanglipeng <huanglipeng@vivo.com>
---
 include/media/rc-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index 35c7a0546f02..9214f3fc174d 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -303,7 +303,7 @@ struct ir_raw_event {
 
 #define US_TO_NS(usec)		((usec) * 1000)
 #define MS_TO_US(msec)		((msec) * 1000)
-#define IR_MAX_DURATION		MS_TO_US(500)
+#define IR_MAX_DURATION		MS_TO_US(1000)
 #define IR_DEFAULT_TIMEOUT	MS_TO_US(125)
 #define IR_MAX_TIMEOUT		LIRC_VALUE_MASK
 
-- 
2.34.1


