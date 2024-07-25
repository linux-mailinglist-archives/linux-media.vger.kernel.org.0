Return-Path: <linux-media+bounces-15327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C206A93BC63
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 08:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2D721C229A9
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 06:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE17A16EC18;
	Thu, 25 Jul 2024 06:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="kze0s2Xv"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021094.outbound.protection.outlook.com [40.107.42.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B681416DED1;
	Thu, 25 Jul 2024 06:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721887867; cv=fail; b=MgSJXRZpMXFemRqgPrgGaaoacKju6edUDdkRvSe0nSY86xtQbYF4NsJpXapb2oMEEFhlw5dqsb/DBWwDzWxC6+v0bZl8HNz7DJrEsRoKR/gCw0Qeh+FROR/Dk+9xBXRYI4LcvoFytqG9Q3ChdRFu9ZSmks4l56eJ25hsPm4lM2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721887867; c=relaxed/simple;
	bh=1GTU273Pu9KXTnwkVMkTsRCKpzn6VsZa96igmq2P4E0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ByCYOPr8X4yvE2Py0O8E0Vo5Wwvv+BAK7x6tPkdAZ9lYY6oHgvE786to46XWURKkP+ooCDB0+DZYQbCmdT3ILVire+GlAxJ0AhyMeU0BwAiGfDwJIjE4BMG23AI/l413HMbc1NNN6iXYR0VhcEvZ1gN0MOnuzxH4CGrW45By5Hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=kze0s2Xv; arc=fail smtp.client-ip=40.107.42.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2iOnLXCepWxV1PhyyFYu/fxngv4i74euERGmGL/jLA4xmcxIBfCImrZsaPrytCyikdbLLCBsqJfEGGTSK/kKFOMJzS1rJGfGyDEF7nW4p25wQLmOyiHgAfHEYoXLxgVmn7PdtMVUUAYjjnr/UP+6Mnq5ibuLnoSlbx/4uO3JJ46aFGoV2AUj2G2Wgjw62evFxBR7RYnzvRUGING5GNEhAjTakiN/K4PFG2/dYtUF26vRo3Kd9KABLmH3amW5orkPfr6uF9yzO4AJdm2bqbd4/stLxrZJVjYAHbNUnYA73Z3fg38nFU+m4ENdcwVcLyNBDXiXIKvjyHt3W2myMAkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbjCA5GkwinMaT6TsZkdREqLOaw8uK4Fma+1NIC5OnM=;
 b=wLL5um9Z9/bPmitv0uT1cgAJ+BK27z67Gs7uesG+fhkaipMl3sbA56y9ZoAIS2pf6OLBTnp2t9KaB0aIgKCNtKbTqbSJ4EUU2lX+lwGFiVWafymSbwqooTR1mtniFWsK7SX49EfGytVEz4nS6+tf7vqgBYqgAZAyExR0haq2lcVEJVvnypr1U4/TUhaWWEWsA4dYT0oiFZLQXjrdVhQWKNQ27til12uaEXh9QKXXJ5Rumq+C3GUaVhUZPxeBmcKBXJvL6VFn+ukPrcTagaZT1+jF72RjugUOyp4vG7d7FLunhtyGcpPwvjsy030LyesuynKG/zhbe3sH2s3lxeXmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbjCA5GkwinMaT6TsZkdREqLOaw8uK4Fma+1NIC5OnM=;
 b=kze0s2Xvf50JVzDhFkwlDf3O7rOlezZi70W1Y3LGVFegiJJrGBzgQ8gb7HYXsMLsfaoB3ckdSd9guF9CMkNernKzEjuBw9wdePytTQsOctc2IF+QU9v51oIgHbynncSEdPHRZScgD0ntMA6peKTGPbE8EqdBadnzz9AENRbbI84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1880.KORP216.PROD.OUTLOOK.COM (2603:1096:301:d9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.28; Thu, 25 Jul 2024 06:11:02 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 06:11:02 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	bryan.odonoghue@linaro.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [RESEND v3 3/3] media: uapi: v4l: Fix V4L2_TYPE_IS_OUTPUT condition
Date: Thu, 25 Jul 2024 15:10:34 +0900
Message-Id: <20240725061034.461-4-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240725061034.461-1-nas.chung@chipsnmedia.com>
References: <20240725061034.461-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0009.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::15) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1880:EE_
X-MS-Office365-Filtering-Correlation-Id: f4457548-4cde-4f97-fa6d-08dcac708f88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SToZ7kt7WI2oTbmLLNlFw8KkwcNN+MvmiQbGoABX6E53wAdrcFijb7f1kvlV?=
 =?us-ascii?Q?/T/aNLHb7T782nlCnaaz83y170bBU4NjUezTNsIb3Ew6jM9FlTa+SJVYRfmV?=
 =?us-ascii?Q?fgygQViLF9tc30VUq/KEx/uY3OqdPOmWhHXmev7s/BvvWG92guiUSz68A2gV?=
 =?us-ascii?Q?KYO7glpHzWFKHsd631piWyA7WFXuvidxoM4nvnpes9NndbnlOcmHcYZmYhed?=
 =?us-ascii?Q?hOMkiG7EZJcjb4JcTXnTcqWRy3MeXN7W+r2U9gUcZhVVVCHiugmA7UEvZ3Yp?=
 =?us-ascii?Q?sgu5hfpibG4sx9o48L2QrV5z3FDk24PxpxEbXzovNjvSTmSVhtDnpclWXFPS?=
 =?us-ascii?Q?DSYLN/t0UIhvt5aSjmTc3aD5xb1X67S3gsO7qQ/39Rv43bNmAt735hct9NOh?=
 =?us-ascii?Q?4jTbXoW7x9cOt0l/sBqIwsSDmnqH0uhQrsWTa9rYu7LXKSESTF5z7GgFbJ+p?=
 =?us-ascii?Q?yMQv+GqfXtpXiAAf3ZBLuW4zdKW7T/0+/sN2uKWG/imqTqwnZQhGuPA3SF/q?=
 =?us-ascii?Q?0925HytOP0/Q3q7iI9s0gw8jz4O/0wTIwDCjO+BkswrOeKmQeCOron8V99Xw?=
 =?us-ascii?Q?UElVXGwvwwoQVYvic8P0eLLDPAEpIK+5dcDdZuSBSiYFmSBedTUDNbi+/a0+?=
 =?us-ascii?Q?OpOXWOPWOTUpm6Wa3o3bwvE/JCLQ/ggaucxxnE1Il1HEGqhO3tGlJ+Sjz1wh?=
 =?us-ascii?Q?gTeIYPS3izNT4CD7WsoImQJpD67XVW+v5HCpODSQnhX9XRRvIgeMwkl55+RI?=
 =?us-ascii?Q?9viGJrnItW8c1r7QQoWo9D/POJmZwC5mV8sh/icsExtUI5uBdwqH8bZrhqNa?=
 =?us-ascii?Q?Wsuw8+VpFrhyCc3DAJoq83zV0UHA5B/4qTgjxlvsJJFrEhuuCB24in6SJCmh?=
 =?us-ascii?Q?obeRzN7ypMCv5oKAqPoyYad+Qw0APIczO9DQl6kUuZ+Uz4R+j4OaxD/jYCsR?=
 =?us-ascii?Q?05dw/AR8MuXvmC1q4bZMqdRI9TqEWTm0BdpEuhy0UtJwm4kE5IdSwLuQ/oOF?=
 =?us-ascii?Q?qgbPzX0704XJjBMWICdpn59XaKVk8haVSPpFBrhB+j3kja2zFd1Q1FkCgGBB?=
 =?us-ascii?Q?9kP/45H1krDzEEAkeRED+oLbAP5yx5WLl65E+k5UX35/VkSwXiyYW140WwW2?=
 =?us-ascii?Q?pgohU97TtsOWjWHxBbFprHaBH71UgYLIVdi8pBw5IuBTxVn60Z2m6iKuLWkQ?=
 =?us-ascii?Q?qAtCGl5FZDff0yjrx3h4FkOnnC/1wC57yu80El4ZyiwO137qz13SrMkmYMM8?=
 =?us-ascii?Q?gGE8+oohC6CnkDw0azyYzuVzGc18pHysi0/ATblC0DkUUyScPW2B/Fciufov?=
 =?us-ascii?Q?o4j3s7Yhq5CcCEynKynkyZq/ZJQjc/LiuJcawavITJtMlyq2EgxHfoGpQkgb?=
 =?us-ascii?Q?F1saaL3gvvjDdFkVdMNgjzbYgao4yPNXYn1KRj+Jw/YYiy6xqg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4W4ys+LLYRknJfXS00D0V2tZT5kuhpMZAztxRYTKTT8Kkk0M5TmU/CpuS2uQ?=
 =?us-ascii?Q?I6zklkWmPHrYrU4Q10PveOHReRj+LMNrOPiE54CENrA5nDnBRxf2NmOVkeO5?=
 =?us-ascii?Q?K8DSIP0dcYhaT7GVkuJkClGn8ecZmilAlwytqXJz2kMYs+a2BQAGsJkliG8X?=
 =?us-ascii?Q?HIwLdj6vwAzajuCImKYLUmGR5MFariOAAbttofGyfFRVfrti+Xfzh66QxwZY?=
 =?us-ascii?Q?r0VPuf2/XH0Ygc9AgYnIoCc2HTgtShNPyIH/4lD9MMpzkTI3ef7Xk+fv/vaI?=
 =?us-ascii?Q?iApnusDHlj8MKtdPGEE379Zyv1KqESm2W2rYrOla/2M3q1mX+Zt+Y7tnVz3a?=
 =?us-ascii?Q?Pgj/dZgfv+8NHXMpQNrIdnOOM6U6Vq/OC9giaHMRNEhqXsojzKKyDJjQGYtI?=
 =?us-ascii?Q?hZC3nsfQpiThSr5xn5JuC2aKhdAzxyc1teZ42fGkjQQbDjWdKjwku3fChocE?=
 =?us-ascii?Q?A2fBdjX3xxA4C3z/+SLqvBMyPHpEeiJM73nJJghx3I1iuqfFfVUqUbOieU7Z?=
 =?us-ascii?Q?X1bt10GExgzG5H/QD5BJTTIZop0aIiReA72cWSt4xgVKa+r7j9fkEfCtnVLy?=
 =?us-ascii?Q?ET7enj5xA1dW4uD1/OxUUZ+XVsD2xJi0oFZMh8TgBiOGOY9suA/TY/R3hpee?=
 =?us-ascii?Q?xqlIe/wEyIjJjDcltNTQFHlEmnBQA6+O2Q8tka9NCEVpZbyziWeuMV2zYdpr?=
 =?us-ascii?Q?BaSK5tUkM16c2Ju4gYlTBZw9UMUlIOtk3iRm8g9DulKBBRQN+UM8Jy3qHt0a?=
 =?us-ascii?Q?o4bfblb0Fzd5ZsvRMexgTFfWqmHKCm1B3KzJ+qGEm8C31H4voqJ4muRe9ClK?=
 =?us-ascii?Q?+62en3P81VrPo0V07P7o49OTWVilVnKKpccjJ90Mfu9lx9IN8P/PXOFArJQc?=
 =?us-ascii?Q?Y0f3NaTxHuFctr5LjbuN7lxLaLXqjEMQ1Ugn2kUQJDTlzLa98vd4y0p57ZS/?=
 =?us-ascii?Q?1aw3Jxob4Lo7OvRmtAdRWNE8ReWjk/gxsk43Fgc02GxlkzQNwnO+p4X6LAKA?=
 =?us-ascii?Q?Z8r+Zq01wkmq3c+UvSucmHrUSgUN00PpHxlbsireV3BbKMCrh4SmRmEUabK9?=
 =?us-ascii?Q?DWuSbMGY62Q3A7l1Oj71KsF21YvOjUH2iavsphlLo/1uuyhWQaCynOiXOBuN?=
 =?us-ascii?Q?ViefJ3pM4Dbxsv13XZi+z0FFiA2YbEZ4ZEpndtyJyM+DWH1FNfUjYPq4CBLK?=
 =?us-ascii?Q?Gx/2YodcERvWq8/rkjkpULGsaPqhKq97lTPZV05+nJgIgINDotO/g6cfP0XB?=
 =?us-ascii?Q?ZstxA0jNnhDaX3ygDKqDHtn50oz8Eu/1ws9enSlHAkqTdCjD7bRdjE/EyZHq?=
 =?us-ascii?Q?B/Icg0e7Ehq34nuIeoQwrA4rg2P0UZLK4FmInw2EpZPhubn/5aA5sHQDAGjy?=
 =?us-ascii?Q?ZQiqyrHirfD60djl4AY9qMBBsbuibl188G0Rz9ok5FW7uvDlnuBGozLGSvwn?=
 =?us-ascii?Q?1atCWi9b5tIhcPyrDwkqBUvQAPnV5/Ep3z8etlPJcPWOvr1NF5xxjmKZ54o4?=
 =?us-ascii?Q?ufoW83a7gP5QLUm/EqkyNfWmhHcDHVqmDuYRoEer+8e9Nl6YdmxyxYwZ5pLc?=
 =?us-ascii?Q?yU3dXIqzjUx0v9i5s279BRTYQjVew7P4NSC6LcCjvAuI98dUq17zcEtscnNb?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4457548-4cde-4f97-fa6d-08dcac708f88
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 06:11:02.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqxaTtD+FDiD2Yh5BXg8GX178Vpv7dItIDPZ6NUnC0V0TOBuE5ev4fZ+nDfqMsrNw1ZvFFw4KBKZRp2G3ITjR0hObmdM2lqvpteWXGCk4qM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1880

V4L2_TYPE_IS_OUTPUT() returns true for V4L2_BUF_TYPE_VIDEO_OVERLAY
which definitely belongs to CAPTURE.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 include/uapi/linux/videodev2.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 8293b2197ea3..5e85cf09278a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -171,7 +171,6 @@ enum v4l2_buf_type {
 #define V4L2_TYPE_IS_OUTPUT(type)				\
 	((type) == V4L2_BUF_TYPE_VIDEO_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE		\
-	 || (type) == V4L2_BUF_TYPE_VIDEO_OVERLAY		\
 	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY	\
 	 || (type) == V4L2_BUF_TYPE_VBI_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT		\
-- 
2.25.1


