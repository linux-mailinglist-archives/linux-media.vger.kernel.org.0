Return-Path: <linux-media+bounces-48947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 968F3CC5DBC
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 04:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A3EC303E3C3
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 03:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59929283C83;
	Wed, 17 Dec 2025 03:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OrvOedEv"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F1427CB0A;
	Wed, 17 Dec 2025 03:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765940598; cv=fail; b=e7jXFI0CwtYrZQgL+28pZfkm3WcDVbUQ+No4O6BmJD0EqJZ28jWIOs4SHepP9tEqQetKBJHIxuHNcdkSeBJl/UkxRmsgePnvmIKAfSDphe+f6feHyursKrKDapZNAl7orvp7xbZOb7QcqWwS6Zh7jiFvoxaQLCMINu3Hqg7sSEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765940598; c=relaxed/simple;
	bh=ALalCaE9YdHeTovkzRuSTTuwYr9CpR0rWQv8sIWq0ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=om61ZzA19mTQ+kyeO2qLLmiY8RQ3O9ma8wSWcE8/eo4N1wbkJk6T0yVwynq51Dh0+jNYgEBhI8dEhoTbt0LKrG1vl9q8Y87Uabw+yRgcAljRRBPxudXWUMczCRACDy9EhZbdEvQxgSeFCeNdw/+IcZY67QA0BpaLW1Etl4K+xPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OrvOedEv; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oty/F5lAB56r7QaSjeeuv57+2c/sjeFEVXr3Bos6/Pr+s94XeV6afDhNfDZjFtx1XHsoTPhhypAGwIKdWGAQUEj87/AlCs6x6YPw+KPqROvw5dhWv3HVSLhZ0+8xEAR0eWn5NiKk9ndxg/OxME4xehE5K4K/RUHmg414bea1nMvhSBPnkMwEJ3scjCTXhCBypLXQ0Td6CIRabkhThC+U/Iqt86F25ihOLkW+K58aferzaWVQuug5JPj5VCGD0laKyEWy8BXHFg6SVLA7zGcuK+RYtbat5aFkhkCvhFMQBTYL7bcNcVagjT/faE//Ac29w7l4AsJO6Dzn13TnDqcrtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXdWtoJ/HMJmyjLddbKmaBqPEd1tWPhHKWDW99k/er0=;
 b=grmhhePRMlWx1bfz0Cl8keazY9tiz5zObY/hD85Fyk8y8KeWIYCfQpbaUMW8pGdWxzi3FBhhzwPZlRwFSsc36PEo6v83wGCQft4w1VjhS50aWaD1gnxGPWzB83j5hNz+QqqwbmgFOgoabbJKJSEDfVflcZ42dQW0z1u6uBFufodtokuiEcl3d+kMBAOMOAhqBEGhL7FutoDi5DTb9VVzNmzyUmf7hwHK3Sll8FmuU7oIn+zE2Q1VHCBL4SldsIdkjOH12cqbvYwRR1vuhjhTaY5DbdJQVuAay82hfZIKVInHlQWCZSg7DO39qKZEjEs/bD5b4bwC8G7wzsWsxVVXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXdWtoJ/HMJmyjLddbKmaBqPEd1tWPhHKWDW99k/er0=;
 b=OrvOedEvm1JNqleWGiVJYG76ILXmJyqIuRGfIuQn903LqYlGC9ESCl5o2qUwme5pYd24rWytYUj7+Yw+GVjXJzlLbmZQcvxsXvpJ6HjVQTJahG1bdSsZol6UUJkEQeT9rzp5SvHZcgmkOFVSnv+ve80xjbpHXPa33pgAtB5D/Lqhka4W/gMm/YeO+T8xoTnNBVCEqek/VZphQsl25LgL1LCCOasHcMVDycRxSJl1Evn/BEfCX1mza2b7xn0gXAgFOC1Y/RBMI9Y5fgvVz95M5KwdlAzD25SYwsBtxY/EafFf0WfYthtBHfIINebQA2CVsigLsHIHY8U+POFOSwO87Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB7864.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 03:03:15 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 03:03:15 +0000
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
Subject: [PATCH v4 1/3] media: docs: dev-decoder: Trigger dynamic source change for colorspace
Date: Wed, 17 Dec 2025 11:02:21 +0800
Message-ID: <20251217030227.1546-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20251217030227.1546-1-ming.qian@oss.nxp.com>
References: <20251217030227.1546-1-ming.qian@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9b47cae2-4666-49f0-432d-08de3d18d1c0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g8VfzvOC7qsKb+CHIlDrE6eUwE/FPF7bCYD1CsXwPaPomz41YVGrdg5C2YvQ?=
 =?us-ascii?Q?hj3L2tz0NXBZJjlDRvwKToVhVlzY5p0dIOL/oXacu//UEUaVNRcE0v6tuS4V?=
 =?us-ascii?Q?+eU191SL6Yk8B0J8/RdphccbTVhEEGcg82QzLz2ouGSgrsr/0Hd7UUF2M4G6?=
 =?us-ascii?Q?te1Wej4pHP1E0pSMdva1Y9F8gy/NBqgsk2o/OtyZ62QNyAxyyWW0kLCbKzON?=
 =?us-ascii?Q?e2xOxq3HlcOdCLgvneDHKgVpe5J2z5U+GQWFsaxx8t4GaxxpCMh9rpm9zpD4?=
 =?us-ascii?Q?2eelBIaum+ttHdT+Y7GETEyaRDYWjxosOGj+ZYngN16MPXZpk/z0OrxfwE4L?=
 =?us-ascii?Q?lwRnFIcSr2Hoim14oJCmR1ByrPlQr7jqHIZtusrwa305yTBXPLqwJ1UObD+Y?=
 =?us-ascii?Q?x5XaFO2mzxvqlp73yVsIaPLTEIXsc4t4V6g3X/5T1b7L2qTQzA8lKT8/1QSL?=
 =?us-ascii?Q?RKVbBIj8DRnSlYArC1Kr+vSB2VY6DqiDruNb3OTmrRtIpWFkVwXXRUCPyu1j?=
 =?us-ascii?Q?tWNQDD2WXy6mH8zIRooHf71853Fl70Vygg3lHyxcc9YUBmNx1xFCbYl1LBKz?=
 =?us-ascii?Q?ZmHuymM39f+G95lq0CaDC34Vfd3MPRI1D1znE05gyEbc/guC5Awq4nRir824?=
 =?us-ascii?Q?eVHtXgfeNgW30uzrrKL5xkxXJvzvWPBiDV7LwbakXwd1Hydihez+zM4u1vmR?=
 =?us-ascii?Q?u6BAyWWVC3gzn+5QpBFsh3vbSgw+Zq1SLxdGhHFvaphmRqusoF1N4qZcV3BC?=
 =?us-ascii?Q?O8mbYahy6jGSr/1tg0eKL/wtoomLwxcZThNqV0Y3hVRddhngixIy2xwslAtv?=
 =?us-ascii?Q?71kEbYzy5lIw9FVHwQKPR+hNvqH34Gfkx+9jUdtxmK0gaVbwkCTrTZ5filWD?=
 =?us-ascii?Q?iJthRUnVfhMO+44Bf+vrD+Smm1s33ODnchTx5j4E8g2B4rO/qyKqCFLtRkJR?=
 =?us-ascii?Q?5HR3iy3UsMW4Hb4Mp4m6Gcmj5KWqcmghjgauolvVi013xXzBotBQaUfPJ5fr?=
 =?us-ascii?Q?W7jwrDw9KLjyiUdnw9nUJVJjFulnViQQ6kli+SexjAm8/7JBGxRSh1Ua1Q7F?=
 =?us-ascii?Q?6tG+KTHqzM0OGC3Cv7Ax1uSYvKT/Cilz20501jgOpKor6nD4hQsFu9/WtLsy?=
 =?us-ascii?Q?LbNnjsvKG3mSMg0q1rP/R4cOot/JlmgtnBuulWJmnNv5ePsQmSgtIQYvDhps?=
 =?us-ascii?Q?DYp22yJfRe11MML0IWODgz+T5T+9qow9+RpXIIyhIWAVCMha2qp8uUH7JGxT?=
 =?us-ascii?Q?veevneHy4NaTvT6/iuXK2A8G0jGHgHSjEh440fTFxUOe9iJfCHCIyPj/r7wL?=
 =?us-ascii?Q?h5lGrk1MYS9HWSyxIvD5GrvelX8Crbvn5NsP8zxpYe8z9cZ/OISEfQkxbClH?=
 =?us-ascii?Q?5vsbRT6B+uWJx/mlWke9xrM7AyZKo46d8szsF8nPKuuYv7u3aoCaC/YzU6fX?=
 =?us-ascii?Q?SEC7Zq9p9xON1oz+zDzU5Kgj4BVDjDSCMup4gt+3RJDY3lEK/C5rsojIWpt3?=
 =?us-ascii?Q?v/36OyEPNdwxOb67IwYEPWWjdn79Tdiy4mwB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GkSUoVjxYzo7rhHlnNqbH5rtjjEXMKlzlrd//Ny1lQxHuCJyIpwzuzpWhWan?=
 =?us-ascii?Q?MLzXEJp1+4B9H5lTG3OSswLoEwFwtyRu1gXpZFvdMTDLfcrTpq72b1O5DVLj?=
 =?us-ascii?Q?QTab3oE6qTDAy3WZuqvRJMhIO/LElBVN3Fzf+dfAj4zi4RTSkWhJXZwqffcy?=
 =?us-ascii?Q?c6Ur7X1JQDYMji0p8Qn6Ze5Or2Wa/91LnGJKsJS4pEw7ln3urM0dVMmSTeL2?=
 =?us-ascii?Q?T235V6k+qZgQX7PC4l/II0l9KH5mTLpYvyZIoLHUTGcswT3eLljHB0fS2GN+?=
 =?us-ascii?Q?N+H5RSTq1y1V+/zfGFfNwUX3w86BMFFHGvIZtqQ5wrLqwC5dZ8SYofJuhDZ7?=
 =?us-ascii?Q?TLPxY0A432pvig6U9Q8fpkqJ6/20JiY2zCwx7G15i1mBemnTb1NyYwUp64fG?=
 =?us-ascii?Q?w5lZSjW3PThpZHIoEenxLTerJ6650MHCOinMx+6RosZCwwb3zRfi00tRWifV?=
 =?us-ascii?Q?/nj8qSK+McxNXaeUmUrtTip4wtzG/U7qOheLdn6yOr7V6gzuDYHrTeDmvocQ?=
 =?us-ascii?Q?SOWOvW2aQd4FOWgBg/PUT1TPcvUrRvAL/JNIAVg94M08fa6i7FTHZuQpIdTw?=
 =?us-ascii?Q?IE5aimCrU+z5LHbhemwHlqp0z+rbXJlw4BZ2nlvZeBpWxET68wUmS9/x1Qqd?=
 =?us-ascii?Q?IiYZArJn2+uA7VU2XDsFAEsVgrkJlgAJEb1i8SsGEwGV7cLUByhcA1RUIU+3?=
 =?us-ascii?Q?aVRLNwklD7tTkYgq4mfJxOs2O9ESlH9fRd6qgfWDo7cCTsbv07aTKkzdg7j8?=
 =?us-ascii?Q?Uzx2n2MdcJ+nAEUTXN/gNis5+DJjXIaf9xNu4pU3M+FIogFTiVTvdueamMxB?=
 =?us-ascii?Q?hSf38EELlphVXxV8jqihc+qFi6Z0Gow9BfBrV6ETdcf7FDu09DozHXGbg/Ec?=
 =?us-ascii?Q?D9p1kL2hQtPDWuTwL1dIHqvfP9jy9sXymvBqxRSVfP58I39LeRl8K4ortxnz?=
 =?us-ascii?Q?9IIR3LUGoc1iGTL/rckIu8m8rsNeE2aW6Hg2YTWitQhK7jVajncQZ/UlMAbr?=
 =?us-ascii?Q?f/37QaLDFMp9RTd3nvocSWR4zRx0KNeuLgMSDFjQrasnfOk5JDAHiBYEFiBW?=
 =?us-ascii?Q?8LPugqJTC9C3ohS6tujIdpeKH3rhNJbuQa5BqzU89pnDB90KuYvpEtzz4VNJ?=
 =?us-ascii?Q?EFxMI1c6AsWeZFaAWbXcemWeAQj/mE5QU3z+Bzxb/Ku/oNQy+cFT9H5dppUA?=
 =?us-ascii?Q?C+FlZFhPTTsByfPJne0rNm/zU9hjvLpnn/CMuSp5M/wclnLzmlcvF+XExY2V?=
 =?us-ascii?Q?WqqUqU2Q4xAbgsn7YOuI+/5/d8aMxWJeOSEAjeiMTTYo7znjcBPTRS0ofm+C?=
 =?us-ascii?Q?HV8I39Gd1jSBxOY2cqbTnuW1HSGYde8XyReCIPSKU8BaOtJKf+Qp69d7kf+6?=
 =?us-ascii?Q?lg771Ou6ax5KCI5aGg6BP+nyyCo3OqQMxVVGVxw/eqtEqWjz54rUThNwTjt5?=
 =?us-ascii?Q?O2Nx0vcbfQMdA9MM5tFbtcha4Fn0ko03DIdp/MNBraC6jR2gn1jbH+Wo9LQs?=
 =?us-ascii?Q?A67IfNaOquaYJjzoU8ofZuukZNRdEEJ2ijWbak8jH6cbABoj4QKp5VGhBXFp?=
 =?us-ascii?Q?w/oJ2pjdMDzpIYSW8wXhfkVw8IhEInzPCfZDYSJ8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b47cae2-4666-49f0-432d-08de3d18d1c0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 03:03:15.0230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfjGSAPN12zmM4mfMAOQLu+BBenSL3kYpL6UKJZQbZuVTEHRPolFZs06P2iohzzaUpV+FEuojcw6u7IRwtHSMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7864

From: Ming Qian <ming.qian@oss.nxp.com>

If colorspace changes, the client needs to renegotiate the pipeline,
otherwise the decoded frame may not be displayed correctly.

So add colorspace as a trigger parameter for dynamic resolution change.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 Documentation/userspace-api/media/v4l/dev-decoder.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
index eb662ced0ab4..2beb6ba1b3c2 100644
--- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
@@ -933,7 +933,10 @@ reflected by corresponding queries):
 
 * the minimum number of buffers needed for decoding,
 
-* bit-depth of the bitstream has been changed.
+* bit-depth of the bitstream has been changed,
+
+* colorspace of the bitstream has been changed, but it doesn't require
+  buffer reallocation.
 
 Whenever that happens, the decoder must proceed as follows:
 
-- 
2.52.0


