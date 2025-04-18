Return-Path: <linux-media+bounces-30531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF4EA934EA
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 10:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C69AA19E6009
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 08:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB26926FA5A;
	Fri, 18 Apr 2025 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uOMb3q2v"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2043.outbound.protection.outlook.com [40.107.103.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31A2505C7;
	Fri, 18 Apr 2025 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744966507; cv=fail; b=R7rYL/zBv043wjzGR5Xogy+SU8npHrcK9c14D2Xzq8ueNoX5xJzBfVFXOijViDIszstfNvo3oEha93yjjolcDeJBKd+swvNVH1lWRkboGgZB/AhTvL0fVUWhCsd0LTeHIYVHWlyti2A1spHm1cVfPO4pMakypW0Hitlz2WD+mgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744966507; c=relaxed/simple;
	bh=gJstuIF1CKhxbM+Glcrj45L6zsdko9sMKWoNtVmGBls=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Rmu4EFybE3wrseD7JQrW3waz9mktum8vj4nusRw6ESUn0dL8nO9OqQacalnuNjWcQXSr0ecGX3H8UEkr2FFnvgFQ/b99bjG0kC99Ik+SO7iD4iRbkZ6VAJitZJdmmfwvQG9xsI3XPHqO/OfgvqsCIL8MVUuMi66Kv4EK41nbEDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uOMb3q2v; arc=fail smtp.client-ip=40.107.103.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0DlZUNGud6HeArwHMm12nxHnU3rYdiEAeL1AAXNTnTtAcfTmFmQtkaeb3MMtrTKGpA9EkQzwI+PM4mCiIlr5844P5s6MN4TOm6t3aDRXXVe6WvpjOZDzpL+b9UhqoMoPKnKXev8LOOGe46a9oe3cicJiJI0xh2e2AuIwV0nm71e8+Wpgc9ZDDGmhSTFFowx4BFqUi2weu60nwrHFDg42bPR5gD2JajrihVwFZpkqTZXI1jP8TVWFQrdMQjwNXHGNp4dC+9rsOItgZv64qrYqO1XxqQ7M6Pd/s9zCFDSzpprz2F7Mqy9TIqTsfdsZLqJD/BapgneILXXmnxLBsK19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siBnGeU+wvlM1+a3keg5az999ARuoeHCGZClqtH4URQ=;
 b=UM+7UohdWMem1MhjptmaS9injKCWl7+h9Fs0bO+nbpjbIVyyPW3iQNObs04la/UJSHzqc+GJb0xBnL/XCZHS2CYzOAh9cSMAt4lJ8tBqOZXzKBZ4E7RhyoQP6c/Ed8NK1vKYPjHh0Q2h+GyTRbKEQHpngvSRICvy6VE2tAtSShSEm/ruN3aRl/zpkSYtdQy5whRD3czmHQOXNs7Aj6yXUkWmhtWGhtLeslFpJ+DHOa95x7iKpbTkTxHzzrVumjaK/6zw4f2bJPq5FwrvXP8aw/3CZraDsv4oTU84oiLSzuh1z6JJBZJYc1YOdkXKfs9ZLkLg3V4ma+QD3FQNnObY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siBnGeU+wvlM1+a3keg5az999ARuoeHCGZClqtH4URQ=;
 b=uOMb3q2vVgiXx/4kFJT9CM4PN/WPK5JHiX4NniBqHC+UYQC62PbCid34k4Qw1NBv6WoEl0qvHfLxiZiaDwvZRTITpKt27bXusxx+0d5AJQg+kaKi84XBZUbr6zx0pqRajsrv+kcJGpGky2x3ut52KYHECVoFkhsHB+mtSUWWRIxGO2rX82LIpJScen5nkA3vcecPG/RDFCfni0Fbq/cPbiZUF3KNVNARrSHQ/gJXlefcnO7aQ07iVgT5SA4elbNEcH4/zlc2EJxJ5BFYeVABvX63AOieLgqQ5QstMIftNdrM+9v8R9VZejb1S8fyi0Os27UE5Ery1c+tFxWuGjJ3lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10638.eurprd04.prod.outlook.com (2603:10a6:800:268::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 08:55:01 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 08:55:01 +0000
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
Subject: [PATCH v3 1/4] media: v4l: dev-decoder: Add source change V4L2_EVENT_SRC_CH_COLORSPACE
Date: Fri, 18 Apr 2025 16:54:16 +0800
Message-ID: <20250418085422.193-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0130.apcprd03.prod.outlook.com
 (2603:1096:4:91::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10638:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1dbb14-a858-4ef7-3671-08dd7e56b443
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?reBS7ibi4jActVTTlBeerUXscXEjlSnhTi9FeGLc+4qktI84eYb+5sAWKXoP?=
 =?us-ascii?Q?o4vP3LY/sYDhmYj3Z9wpaXosvX6UwFNBlbAEDQL3x6j7cYhXWsLdat6/3u7A?=
 =?us-ascii?Q?BwyIuyG8emOWNfV2/GRnFxWvAALXZFeJ/9ip73rPl0Qi/1zEco+Mk+Ifj1ru?=
 =?us-ascii?Q?5clNBPEW3fNCREApFGG2O00ZTQ3x42n4Ua2jgc4cT7voQ6xHZMb3MMJXCMBU?=
 =?us-ascii?Q?1k+jl1p+b2QQc9x+iB1s6wIYlwI0Be3/up4OO2T+hXqhRuLLIWWQuP37mYeu?=
 =?us-ascii?Q?hiy6zPXlHFYyDmVAv1YP3s2lPQBdiJkv3XJwn0Jqr3TbiPxSg23wMtcrNbFS?=
 =?us-ascii?Q?ZUZyq2FBw+m3fOhwWbhdvv8Amz242lwk8yREKQlJjauDS9UU3q3IpiZAp9ml?=
 =?us-ascii?Q?nq8ysJFQp5IAnNMh1HghEf//WLfacI3mrG9IumQAEjraNqeDvG2quLp4y7KO?=
 =?us-ascii?Q?Rm9o0Y+R5J1xWE2AkRhfPpvzcphH07mkozgA/DGt/g7xLL4/kWPY6wagdA1J?=
 =?us-ascii?Q?sPrNfqLAjabGrxyzNtxKHpoCzp56Qz8KAh20W7Ru3ZNeHEPjjXly68NZBj+m?=
 =?us-ascii?Q?sEsTWjX37IhCLqVrlYhtXiW3knLOaotdSlhhN5e4RrOTnCTYlXmuRHYJYosG?=
 =?us-ascii?Q?LsWOvDv0KyV22j3AOaoHEhHVZfBS8iTkw0HiBY6yzzq+l74FB8ILigpOJU36?=
 =?us-ascii?Q?YopeCJx4I6TJF6yfuHcbB0x+iaqokeTyFaBNqYTeyRBsB1dbroZo1bUGGSvo?=
 =?us-ascii?Q?xCLMEPduWjJeAM4RKxbNtGypDoe6EwwuSmQkc08QOBr5uXdQoCwNJ1ozuwD5?=
 =?us-ascii?Q?5YRgjdW0hCM8YcPtn7p0ZLiX7AcL+MjwwZidlJ99Jjd0ougTCtDd0L5b32C6?=
 =?us-ascii?Q?Ac9DQKltWL32nAG5L3uhJHZ3gOTgi37jDhVpCKSF3mOYqeP6PqYVE/jKe2b7?=
 =?us-ascii?Q?MANZRJhbNc57sHX6V2A2IWbNpSA5H60AI9iBInqJx8yXVkbXOnEQ29uVGacq?=
 =?us-ascii?Q?gbYNNCdp6/mt+tx6GK6xAaNk1FUqIl51vQ/jryV3vYYGSUv1CEvoITRp/Zy9?=
 =?us-ascii?Q?ZFPbFqto85CADHDxW7pFaG9jbjIZK2C/YFSMjfAn3PRdMOpH//qEffNeyawz?=
 =?us-ascii?Q?aGM0B8bpEIloy6/s2IjmTY+GAKaETzqHgYJDvhG6utvvFAKQjOgoKPmD/cRa?=
 =?us-ascii?Q?u5kt9QpQMDQ5MEpVwLvhAr5QY047ZHAzjbKAqiseerYa0N8Y5CDdjzjcPB+U?=
 =?us-ascii?Q?mgZUF/BCEwL8hY5lZ7m4clIzUSPhy+HYYkl8iRBHc1m4lR/P1IKDxwU0Equx?=
 =?us-ascii?Q?k4KIZAJA3/UuF+mQY5p2CxB4SfnWD8cN10p2dnsC4vtxPaVq2KSAFNYVPpIR?=
 =?us-ascii?Q?BQpFuW8Z/cCRWucYXuoeqzsrrCXs9FIWj367at/Uc0cU2QE9koc+80cksD1Z?=
 =?us-ascii?Q?yTPjkTRqjzP+/QrptOu6e7P+skVQh8YHemDzcbQHYpGuXp8JovahzwCLNw17?=
 =?us-ascii?Q?qivkGrdu+tNNogI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vmNbRZjZdr1Ug4F1wFGgEqiD5GU9BxJDWwLjBnnHIg/2jJfEbVNzdzpXGia8?=
 =?us-ascii?Q?UFs+8QX7uH7TUaSbDt8e1ysXA7CZWoF1SZYb6cq/x44zuU61OqMC3pz2fgiV?=
 =?us-ascii?Q?xQTJgKVVmDlXWFa7FCHhDF59XbEJJcNZuQtT/HOrJGn4lYFFuKUNLxhc6RQy?=
 =?us-ascii?Q?ag54GuIVNLvt7EBHCWFrtinZSXni/C9e6ignsdXVRJoj7pvscxce+hqaBeu8?=
 =?us-ascii?Q?FlfIdKlnzFwL4VpKmiMz187JZyan92wqZWM2S5Ds1VwKSQsEXOBNZAIvLLol?=
 =?us-ascii?Q?lk4zRnESPvo62CN+ce3eMSXeouPl4Yd1RMgYZbvRRWlQ6QvlBDCGEUL8HYKV?=
 =?us-ascii?Q?PvxLBYeP9IcKFLyvpihw2Qpj22RZmAOa+RoeSReStwbOoHkAoideefFlCVHB?=
 =?us-ascii?Q?L0janGzvdLnB9TkwAtyIOlURYVcw35hxzqqcPnOjSLCwMBdbLEi+ukvAMJzi?=
 =?us-ascii?Q?BS4kADnW9odEu+BVRTDPrKtvAOZO1Uqj9qb8EVQh++fmP1rVVS2p+n8lAjjX?=
 =?us-ascii?Q?DvWA1owg3XjKMY3SIQeElVuO++3oWjmHKUfbySYKpP7WoDT0NqZNOSfog7G4?=
 =?us-ascii?Q?Ue1e4zMgYbB9EklQ4tlJKGEdmH7MSruf7rZO8C/GXs7JfUwAailD1KL8mHHl?=
 =?us-ascii?Q?56anRhfRpVtSJm4PiEiRcQnGFzpu84Y1GVGpjHgt2DBoDUIosc3e4N4Yv/mU?=
 =?us-ascii?Q?vOQHCvLQshmqEpwFrIgWm/CRsLBnggHjFH5hhGv7Rw4xYp2uf3lue6Hidt/0?=
 =?us-ascii?Q?4NMUehUdUrtcbv8XUGXIk2gtcTrThmzHPqXDKhSMfnUI+cy1AqUHXVcDsXrz?=
 =?us-ascii?Q?9HFTJnP0EVdIhEbO6GLG3wdM2nDH/UAg4wLXDMyMd5hfHgbSbMttYzxu/8l+?=
 =?us-ascii?Q?aRzCto4LgO2QYIR39Y7/2vPmeXGYbYGgtA2gPTKA5H+++3Q+cZkYJ6B1bksp?=
 =?us-ascii?Q?W38qwLSFkUNbX4jq00sl4EPhLKRaLXuNxt4F9QU6gcduJkMXKWpZEn4gPKSn?=
 =?us-ascii?Q?8TptifEAy2GCfQH90FG9hZk0KHSb1TJYPOWM93s0mGwpgvsjNGbbDG1l4AXj?=
 =?us-ascii?Q?0Jf3Yh4Nora1v8ONGSY2aV7629gVj5PWcmejmf1rGnRY8OEV2td9mcxXOHCf?=
 =?us-ascii?Q?lZgCp8Bh1ak4wape3OpO2hd19q3Ernr58Wu3LnR93tqNt42Qho5lzCieFaEh?=
 =?us-ascii?Q?Js7f3VSGGT35f3h9a7msZ6xrIkxZ1CM0Av1zeQ+fT0/ygWIhsRXPr6IOdQEM?=
 =?us-ascii?Q?LozqXAcAwF/EHWvwt6Jfy1yW4cRvwQ/cnQJnCmRnXENS9+hqU29OxxdVBoW/?=
 =?us-ascii?Q?lwZCsMlb+B1jci6o0h6IFsH72onWyB6MALVhziUxIPXSkfZ1Flxm3/Gf1RLv?=
 =?us-ascii?Q?SdUlBfTLiwLn9WPpYX8g5jq5ScTqH2TCMMWmzjgW0fAJRJMbF39SLCldf+N0?=
 =?us-ascii?Q?kwpklYLA292RLttECcmWY2qLod933D3H/QBaxJ7joycn1qeeeq5yKpTZQxG8?=
 =?us-ascii?Q?+1+0/YtAeoUOWgWhQnGpRm646USj3maf1UgtMFIOidgbLndqp5CgqlRtS63y?=
 =?us-ascii?Q?+bflEV9bGJo75CfB5YkGWmFkz9/3dersFgF/hSef?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1dbb14-a858-4ef7-3671-08dd7e56b443
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 08:55:01.5666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sFrVzdQuaJSemfKjJTxleqGEh6/xjotJTweYkNPKClY660zpIQESjmefXDkT8/8K2wG8vLcrceihNMADHMT4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10638

From: Ming Qian <ming.qian@oss.nxp.com>

Add a new source change V4L2_EVENT_SRC_CH_COLORSPACE that
indicates colorspace change in the stream.
The change V4L2_EVENT_SRC_CH_RESOLUTION will always affect
the allocation, but V4L2_EVENT_SRC_CH_COLORSPACE won't.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v3
- Improve the description according to comments

 .../userspace-api/media/v4l/vidioc-dqevent.rst       | 12 ++++++++++++
 .../userspace-api/media/videodev2.h.rst.exceptions   |  1 +
 include/uapi/linux/videodev2.h                       |  1 +
 3 files changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
index 8db103760930..f317af57a92c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
@@ -369,6 +369,18 @@ call.
 	loss of signal and so restarting streaming I/O is required in order for
 	the hardware to synchronize to the video signal.
 
+    * - ``V4L2_EVENT_SRC_CH_COLORSPACE``
+      - 0x0002
+      - This event gets triggered when a colorspace change is detected at
+	an input. This can come from a video decoder or a video receiver.
+	Applications will query the new colorspace information
+	(if any, the signal may also have been lost). If the signal is lost,
+	then that is a CH_RESOLUTION change, not CH_COLORSPACE.
+
+	For stateful decoders follow the guidelines in :ref:`decoder`.
+	If CH_COLORSPACE is set, but not CH_RESOLUTION, then only the
+	colorspace changed and there is no need to reallocate buffers.
+
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 35d3456cc812..ac47c6d9448b 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -526,6 +526,7 @@ replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
 replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
 
 replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
+replace define V4L2_EVENT_SRC_CH_COLORSPACE src-changes-flags
 
 replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c8cb2796130f..242242c8e57b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2559,6 +2559,7 @@ struct v4l2_event_frame_sync {
 };
 
 #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
+#define V4L2_EVENT_SRC_CH_COLORSPACE		(1 << 1)
 
 struct v4l2_event_src_change {
 	__u32 changes;
-- 
2.43.0-rc1


