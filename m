Return-Path: <linux-media+bounces-29119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 925C0A7773D
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A58B03AB004
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998BE1EDA14;
	Tue,  1 Apr 2025 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NJsRO3Qm"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013019.outbound.protection.outlook.com [52.101.72.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC151EC01E;
	Tue,  1 Apr 2025 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498488; cv=fail; b=sqPLrhlKOq8XJUhY64QS++LKWagiHboTYdEkQ/K9jLlL7FXiVGVjb8/l4enMlOceZxK/+jxfOK1kGTKcEDOBuRJXya1tCww3zWHdpzb5lJWNErauVXhPI5UpyXtgCvX4CnamE9MOrzNx2Q0HPZrfUN1yRpSfXz2CrmX3p+KwWwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498488; c=relaxed/simple;
	bh=S8NF5PzALu49HJAQL2yxzSlcVPD0fCNqN8akg2REEk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N6x7gq1hpmL6W+hed5JvP8zgjyEb5q48BCXc5M2SjmXZkya638lhr5MBK8aqUvLZ0sTUDpiOzO3Dssds8Ui+or+IRjSq/lum9wI7PXf8jKrNjAcyi1+vRa553QKSf2Nj3BI44Z64cn0euOiDOih51Abag2WHLy5+dC5RAkwca8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NJsRO3Qm; arc=fail smtp.client-ip=52.101.72.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBnMLTw9wAPMzbRH1Xmyufa9lCRNRwb0XRKB1xs7hcMQJZyVszkFDEPOt0QIcYi6YZHpAwc+d7YZeXqhPp3w8Ntn3B2XmLiNfWOtkyrgNFpevTZR9HdjI/MhDGu8RcsVLvE/cLcaxwUIJOfNqA6TuV4Jx8xzJve3eRo9hVFpBValb4voZV26fFSl+DbdYcptOjBpLjO1AlNi0hs1ZtZaxyCHOSIIKNgoOM48mTQclVb9Pw0iKCFo4TwEUO9LQn4gw3r7tMXDrehaULAj5zIybUuzW/LVFFIeOsll9Jbz+8gfaKPHurTcR7Oho8ls/vB6zHc48Bdly83AMpLwEGxMhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JChxjhOJDpk/L7xMKEA8swf7OFz4nQt6GYKlE0r1AbI=;
 b=BwR3KQ2xcjd65ncJ7nDG+qaLSHfXsTgFUT7k45LQfODVMaFFVj6ap2trFY2/fz0CFV6DPbmYnvZpEUPRGipFB0L8T2Rpw0sgGHJhEiv+Ew+TyJT5M/L+T4mFucm3Xj/NgNqEPQjIpK976BF9Bb1y7jN19718iFyYWe4g752J63dMSIEyXpSo480oMzZk+TCGff5wzkVBs1N2TUP4b4rAbrGYrNsdRGssO044Fy5bbYUg2i6WjhrtV4z4Frsr49ElRK7RZyQ8FJa/LzFeXl59oN3EAC5lEInQIlzsKyH6RjoQCzdZx5ai77ea5uzMfUlT9WeGqWNrTALzUc2s1w5uzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JChxjhOJDpk/L7xMKEA8swf7OFz4nQt6GYKlE0r1AbI=;
 b=NJsRO3QmarEe+yVwhOxXrMxwhZ3Ldau7yNtTKLEcP2Z/z+ZHdTrwcZoH9wAzwY78ZiSEoVusQqNwBBNb0mYhqSkYeZlc+EtK7BtzZu1W3wPkYYhQFVH7QnKsJRPCeyQ0AihVLZlJ97u3OwYx8AjpK6ckdCi/wWj0158vOa1b7Up4mdlKRxQapBkB2OvASyClMFidzCZbQkVYeJlPUe5/ZafsiATKmq8Knljtouhbrv+MuxDX9O05uJR8QehaVIlrZc6HerEF1SyYE4Pyg427F0Rl2FdlSruZQYag/YXfhrBLOPFm1jLEkJtK6XbRk66SUJO4dN9v/QCxJYlgRo+MRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB7491.eurprd04.prod.outlook.com (2603:10a6:20b:283::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 09:08:03 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 09:08:03 +0000
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
Subject: [PATCH v6 2/2] media: amphion: Add a frame flush mode for decoder
Date: Tue,  1 Apr 2025 17:06:57 +0800
Message-ID: <20250401090659.1702-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250401090659.1702-1-ming.qian@oss.nxp.com>
References: <20250401090659.1702-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM9PR04MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a5a69e-ddb2-4a16-baa4-08dd70fcb4ea
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8nfDEs+m5dhc3PUC8NM6H3LIxXZgM/rbriYe38DEfLkekhgUHc8J24uoBK90?=
 =?us-ascii?Q?R70QWggd1OdtJuKiuV5O2w/yfVyPk52iLgWnZ84McYPiKn/mzWFVjMZHwlRV?=
 =?us-ascii?Q?ZAKelpgZ149NfM4ErvYZ/dl+8IGVMrSWXarvnhEdcVK0b7Ed2UD8fP4/XKsk?=
 =?us-ascii?Q?blXPZ8suDcT52wEkeRgK2oh41kZJka1rpWdbRgYSBruWKeeRXpa+r7AvYux4?=
 =?us-ascii?Q?fSP4KniqaqdUN1g8zx6tvhZuo8c5yShvD/NcvvLfALlS5IbECW9V7rHByowc?=
 =?us-ascii?Q?1ymwql+upAiqW13KcCgVO+/hv9csq3eD5Ldw0ZHl8cfOptfuJ6QJnVkV54Di?=
 =?us-ascii?Q?TRhJNxELlvJ4YNaQt+cxGI9DXxocRjxqSZBe16qQz+WP5CL4gbTl+uRUJ38O?=
 =?us-ascii?Q?x0UQFvcdc5G+tve55sPFDxi0AA9Fce+zvl5iC4PRa53blBtbulzP0tPY6Jpm?=
 =?us-ascii?Q?SeKxjaBJXoPR+S731JiiCbmXnsKwVl0Qmo0Nm5meo9WxrR35NvYC47VzMpDH?=
 =?us-ascii?Q?eqxf7a/eDRQaX8zRl+lkyNOC+btd6sdDfo6mF9X/BUeK7QNIPtcUwQq3cBJ2?=
 =?us-ascii?Q?yQ0PlOETvSrxsTVWRKRzT1OFDM7FA4Sh9CjQiVn1DBwodSZ5jpfBlPPQFJJS?=
 =?us-ascii?Q?rDzGEr+HI4lMTD7hEKCcJ+5KArg84jR50ucOuHYV5lUCthZglucjTXeuscy+?=
 =?us-ascii?Q?M0+tIIru0WSZajELyppukz43yQ9l+bcA/0WxbhDbk4ex6qbaixO+Ar5i1mDY?=
 =?us-ascii?Q?HspOeiBZyvrX1RGesKNWshgiglORvqGJUDUdqMSX+ZYm9GungZ8RYC7F3fdY?=
 =?us-ascii?Q?WVd6PCJpA+xl1OQKB3kjJN9GKheGpkpqKc/wHlcmwuMEyM/sAoxnuchHYzcr?=
 =?us-ascii?Q?g9hwDzQi/rLffaJ8ENQ4OjtbGI4Qh2PzEg204f4+HH7J2d9X5WDCStskOMNA?=
 =?us-ascii?Q?TGzxdCEohTdjN558CtkLru66PCNM6vUoeepefnC323RoyvakBFVQ7qSapnLL?=
 =?us-ascii?Q?BCSb/dOIsfAKPkpb42o/+RiiQebBWrsV4D2rKmwOcqVk+S0NhIygBER7LqRy?=
 =?us-ascii?Q?VG+KWKjAY1dBB4SyINX2C/ahAGXU0oOeGPpFqhiqzgjlVX332bT9SZyF0HGl?=
 =?us-ascii?Q?8J/rk1iyaMAm+Ad71VKaGDRN0cMPQA9/9ZQnTNIrKRGPk3/fAi05mWk4yC13?=
 =?us-ascii?Q?jY53YaKVgOEcTNpQQ9Ad2cupOqGIZsm4yK07pn7hibv5+2a8A9mEhjxxljR3?=
 =?us-ascii?Q?iDFJqP1RHNxR0+W0jPcMD0563MpDcYrgNFm8LERPxV9ZqR5sr13n1/jGoDzs?=
 =?us-ascii?Q?oViF8e+3rTS9jIs9CemJc51nfAecy8MY4ZUgc2fDvm6P75C5jtem0h7regQ4?=
 =?us-ascii?Q?IZzYT0imuPF6GaOUR9vVR3ZQ7EidByOOAftMNJc6dActX7ov6jgFzgaOfIgV?=
 =?us-ascii?Q?ZhukwNikzmMc9gJjA5YztQQsh61DMwD2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bwa8MpPgDEE++xO1fO1KpChdRNBe7/juUG+TjPkpOWlLvxhuztqhtc7dL14Y?=
 =?us-ascii?Q?MtJDtXzl4zM4As1tc9GfWB98xp4LQV7e2fmvjRfd4nwGTUZxoxueO19EOBeR?=
 =?us-ascii?Q?RlIcgZ6+xxeryCLIzxQVFxc2JKjJEArWvv1J2skwkFX4OFGiYM954A83LTl+?=
 =?us-ascii?Q?IGek+CnthmioMAo7d96QAWxpK6QA2LZRzgdmIRUIoUKBAE+L4G7pjefqQM2Q?=
 =?us-ascii?Q?xqtR2iJcpfmUOm/UTLokTKLTEYo/WgAhuf29aJe5/u15TOnjxmJdM2PHNWkc?=
 =?us-ascii?Q?dJrP7fy7dcEPHFoEiIZV0ONLQY0U06/CBvjJXvQbGfNYkx6F9chcaJfE2FfE?=
 =?us-ascii?Q?QDspUS74HIRfFKrM8ZMgwJEICxW76SIB0PIjMPpGhzMQbWUoPFGZvTRHsDw+?=
 =?us-ascii?Q?CIQL5NKdwfCXZdAdZAWB1pPR0oq1ZjJvlFFJMa8z9SHxshLIGsV1TDeam+xa?=
 =?us-ascii?Q?VvLDgPj0bCICYNAYrat/3BEugC8MKLXy6FwmRB4dAc79lN6nk1ZuSAuN+3xM?=
 =?us-ascii?Q?8R51prVwH1SVW1Xa1UOejjZWaapkELKBTDZOK80Oa837AaQC6aZgI8WMNTsF?=
 =?us-ascii?Q?QquB4jiWZy71R2aEKW+dDu0GQ8x70kgzOYHsqrmtnw9nGRDJZPsrtrXImXfd?=
 =?us-ascii?Q?C/AlUufKLQL3kTc9iLUk8v7zlGYZ/oq003594PmgmYPUihMF35QxRMGqv15Y?=
 =?us-ascii?Q?CJdX3QuMwpGqfQoEar41/KboXW94SD0+8v++ycnMaaUe7HhnC3Ij1D23Y2gn?=
 =?us-ascii?Q?xEJQYr9WdR5NIxT6ZkQGXrchoMcJanBwXowBqbKNM6uDobNO9TC75hlIAxiO?=
 =?us-ascii?Q?RXXUKf7z2ae8KUqSf3Gcznjb20Tb0Q1uICDovZWjvA+oDiDTH3HNfcJ5LgKy?=
 =?us-ascii?Q?pY4nxPeGf9WEB3xUDhSGNLFFF2OmBMyZ9E8cXGw3BCqocLZznGLiVu3Y2Qq5?=
 =?us-ascii?Q?NPNWwT9O85vj8ksJ3PAjU5rybQJS41IpTbtDutJJKiQtlo2+QNbjkxSxLZpY?=
 =?us-ascii?Q?SV6qRfsFnNUeYSSGQu1dWqhuo90k6CB6066ZBHpX+GOhASWzX3z9zG0QYkeo?=
 =?us-ascii?Q?z1oQ5l+qVGMuCKpJrlnzHaP3rs/kU27dOLyYgDryyCO/DDt0gskVMkTFuq1K?=
 =?us-ascii?Q?M8FINKmaaTdw8IUsOmsFGhnYmhps8rKVEa3xZplnMknGM1wy0DT0r3uuDfUN?=
 =?us-ascii?Q?03VBaEvXw4cGuvJ1sLxK1qhZRLnksClkoyRHvJELvEjMuie2Bt7Q3670ump9?=
 =?us-ascii?Q?DuKnmSAguOr8iMZKdU4sJvxZo5dcc3tgn30oz4sJcbzznq9TkhlGAP8/YOLc?=
 =?us-ascii?Q?zWVFURR7CCKq5nwChaLgjxO2hZfqxmuyXnouAen+ZxWyXELdbtA5OIV30S1q?=
 =?us-ascii?Q?0pb7I6BVaYIF/K44nYBLEZdZQA2EGBbbprAY4lzTbcjC+tP5L22w6lwlK5c0?=
 =?us-ascii?Q?wK+vMM5BhORX15VpIAtPJc0isEBvPOBZMbKJ8Jrk6llBhFRJ8snsLpcBYkrD?=
 =?us-ascii?Q?Y0EvMYIe8uoEl2tPahFlsiMpNSvyn3MrzVwe3lemqGUs6OjcpnUoaOgWjeDD?=
 =?us-ascii?Q?QXmZc5xlGHLf9grKM6RfBapo3E0nJg0BZHTIo0UA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a5a69e-ddb2-4a16-baa4-08dd70fcb4ea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 09:08:03.0067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: welGMze4BvCXZdtPy2BmBiHc7rJEhU2RvFttqmMpp2Mq+PhdFQ3T84JDZDfpT8rpjnfitinRvGDJAxNO46bkeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7491

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
index 112645b30e15..1b59c77a84db 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -26,6 +26,10 @@
 #include "vpu_imx8q.h"
 #include "vpu_malone.h"
 
+static bool low_latency;
+module_param(low_latency, bool, 0644);
+MODULE_PARM_DESC(low_latency, "Set low latency frame flush mode: 0 (disable) or 1 (enable)");
+
 #define CMD_SIZE			25600
 #define MSG_SIZE			25600
 #define CODEC_SIZE			0x1000
@@ -1582,7 +1586,15 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
 
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


