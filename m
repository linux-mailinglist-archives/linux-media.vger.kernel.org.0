Return-Path: <linux-media+bounces-56284-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM51GXqKu2nHlQIAu9opvQ
	(envelope-from <linux-media+bounces-56284-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:32:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FFE2C63C9
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C41113023D54
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 05:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AB239A078;
	Thu, 19 Mar 2026 05:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="IeQyogl5"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021105.outbound.protection.outlook.com [40.107.42.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C36284880;
	Thu, 19 Mar 2026 05:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773898347; cv=fail; b=kvtvYP7IWxfD/i0YtTyeqiCyWVlfjIuEn3HwrE8ZBpe4DPjqHriKUxqWqphcZnZG0stryfvj62hi1VzqJITKahj6o/sqnhiNkvenmaMrk2nDZ3WL82Kfr40Vs6jo7x1yf1iz0SBsg9Qv1Ca8DPhuKahTpC0r6Xk/VPuMtvCfLkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773898347; c=relaxed/simple;
	bh=RywX3ekMoxiXDVjkE1tjmcdWIZNaRZTr0wSp2/pYBno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ttk6jh88HPYLhRej1o8lOFgGRIQmgztUT5DWXi6mDkAMEb3XHzW++Cy3BuJDj1EpueR5hxH27LWMj4yEOs3H3ZX3tsq/p9TR0bo6H2jMZ+SkHotZ/Oz7f01QA7/WjDNMIYc5ZZNbAtWBKLiTU6b7APhAC5We5zJ9iQxHSMlyW1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=IeQyogl5; arc=fail smtp.client-ip=40.107.42.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULr3C+VzyV6YT2Aq1HpYB5S9DT7dJDiKvSAt+zo0iv3KLXGNxYxzW0Xd/lghOXbbMMjI0Iu4t7QgD+fQ0g/0/ylRLxchWJli0pJk0F7/AQg7OUOUqWOjWOn74HmLbzw/y/ENK5A1I6bF+pqA2W+1WCL/WVcpNUPXJ7jsOVS4Idt7ObqAEtENuXynUfTpMBYbgMRHTzUwTuz+zLkLh1WSG9q+/jqjqMn4kU0bl2VABaSf7O/IHoR0Uvasp1MaX86lVwUqT02XUilOGxbCm5Jy2O5ejm0B8dnSAOOOxzy8bYVcBgzzmtawzUNalxzi4p88cJEfaULM3NlCAfTX3kKcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=th+7wdWspHKqcqN3k3ZlPAfnhh+s4uZWtsC0ZoUuOco=;
 b=r6+XlGNQg5eWCIZF00lP0XlVhpRue+lDlqIhGiQG/N7Ojd9u9S2YQ8J69fD/UbJRFUU5Uj5hntJYm7ERylrkjGr85/QFt7ZhRe+DG3fBGK4IQxSbOpS0rBHlwyJ+yD6X85Gg5Tk5/RyJo6P+ScCW1giU+4yL3JNIUfi2BpOdxRoZYmNwYMHnmjhI9tYkFcfUtIVGVRjlYVceE4YvPSqiiKKtbQDU3LLRwP229+lqqiO1LmuWAG2/3Pv4ah/A4Ib4+P3c8e37QCysXoeeOFpSEIzWdT1+3Po38M7RakgVzokVqbfUw5paZGLX5/Yp1MM5gk8Vi6tj2hwo5zPlouitfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=th+7wdWspHKqcqN3k3ZlPAfnhh+s4uZWtsC0ZoUuOco=;
 b=IeQyogl5BpzPFq/tLrGwXpnALzFaDz9WGJQT0DEHQ76hdMgWMWbUaKd8c+l1UjlmYRLZLk6RGlRwh1KplIFSvKQOZoMbziOlLVxv2nKFWF1tciyRBemHV77cMasO+lNmZLdSF9kmxTDy8wr9H4/Zq/9TcwOoNxHihp2suaTwlfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE1P216MB1928.KORP216.PROD.OUTLOOK.COM (2603:1096:101:63::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Thu, 19 Mar 2026 05:32:19 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 05:32:19 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v0 3/3] media: chips-media: wave5: Add Support for Packed YUV422 Formats
Date: Thu, 19 Mar 2026 14:32:10 +0900
Message-Id: <20260319053210.90-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0036.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::9) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE1P216MB1928:EE_
X-MS-Office365-Filtering-Correlation-Id: e374734d-e992-45dd-e0bf-08de8578e3ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7aBfIQFsDkawyY9XZ9jSyEgiUBy5ze8cwwNY60d8wfsEbp2YsFE8do3ev/XksTiCVur/WVifjSmdB/EHlmn7Dc/XuhWq2wDbFqO9ir4E80SzJNbxN14PpCsjJx2a5C0v++Z50nfeg2PuaklmuZ457OaDRJtfVKlwgKbUoboJWRBKkJK/7KSBVZ+OMm/LeMzo0SeML5/bQd39joUmzEeXqOu7/MAxiPfKC+GWEWyiYtKh/k/COviNkhvCfZSqS83Ya5YW0+RJ5Nh4nu3rJdSkQJUlcLdTKbe6YuTU0i6XQ5hB3BBhQxfaWYx3jnDdwGgv4oh7ArEqpsSn2WaHOgrMKhnY1h720/UQCW6+TwDnIrbviSVBXpmZiUWQ3hi6Cn98uh4E2K89CImPAPJOuJLwrZPrMAcksrl3Yq+xiYy1NN/I3bnXmlGYUmTG4/y1V+iTGLlnoK63UlWv95bQga/Eq5ybR7WxL/13VfofJNk+MHrtpcZTtDjYqNoDM4abNTkF3Qq/9dYvqNvRHfjXzLXA/s2jLNVOQoYiYfXSK5RmGNFtW098C2fSB8/YQ8LDP3yQto0hqTU7d23rLJp/j5Bj6dlSvhN79JtifePKdyJ9eJCTGrcSbsup6hyKRrn112rHE/IW/ibkh0h5ggpR3T5uJljQtfBnSbk6F8sCFGXijPGctPLBMhZ4nHSOCd9SMlKf2w379O0lFh7W9FUFjG6jzO6+EYNUWJMwFsnBpyxrkH+jHx8ApHBw6yB44/nstZfaGm4+QhY1O3ZIBjaaiydIIchSbpUF5/maJr5BOhMEkEo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HDMZCGrz9Cr+bQiiZmW/HWXn5W9zx/IuCUzuvbjXrGMiYorviZ0YxyrQnBrO?=
 =?us-ascii?Q?pzLhIc7scy8X52gEh4gkt52iDLU52hCGGX7Ijd3R5bTUrNY55ZQmFtjNBfum?=
 =?us-ascii?Q?oMpP5H4up4643a4Fa2uygfMOWjUjKDkyNgvE8HqjQPQT6z04+fszN0EmsaEq?=
 =?us-ascii?Q?vrnTUBrY5HDxN9kxPOdBaoFep19ggHtzNZpvOK+wZJtT32zLzn7IYd0Qfb0y?=
 =?us-ascii?Q?jwZbat4CjpA4St2OV90vl5n8LEj2IC86dnfqNvt9YUlV3wTBfiQaNN3NrdZC?=
 =?us-ascii?Q?Lpfugxpv1mvVMdY4zluv3RwBbtM2PeQrcnhl+biPmm1vq0q8mohxKJpVbLfK?=
 =?us-ascii?Q?ZruxBeN0qcRJ+LVQ+Eyads4JiRsJUr9HWWk18vwQkW7ZON1CW3Lc/4zDuozy?=
 =?us-ascii?Q?AIGRlvwJkXq06Pse7EAyG6IomnrzO8wvzI0nuSG7LavRidRMHcw2Ty14WDCf?=
 =?us-ascii?Q?rm7FvYquaBjGRbjFV13a1Cyx3T72aJsqH/YzvxTT4lKyGWL++HBsu+Bf9Be9?=
 =?us-ascii?Q?cgqJvLQu1isoC8/73ZNTqs69rlZjDbiW8LB+T956QYub/fsDbzvB5G1AdwNA?=
 =?us-ascii?Q?WMTEn/2J7gPH/ZCTANSR5GYzcQLCWlQU8lqOYDlOqGTgomTArv+WvM8XuXxU?=
 =?us-ascii?Q?+VAkaysVj+t3JowdW+oE0ucimStZVKhlj3Sti3tA7geEHcDftkVtSltJNXcR?=
 =?us-ascii?Q?NNe03Ql0T0YY1M9c0y4H/DHNJ7avXkSW3YBU1CbyjhlvS8gpKPWFySb/oBcq?=
 =?us-ascii?Q?V9+fmSS1yfNABybFB6Vpj2xLMzJI0wKE2kbLC7jxhEdKSDZA9mnRvS7Rtz2f?=
 =?us-ascii?Q?SOtkIm8MwRT8D2B3IE1+0CC427DTcEqZ3w5a7GafMzAZ3SNCFGSmyRO+ag4f?=
 =?us-ascii?Q?ubliExMC5jUqgAWCEIUs+pBlQ7D8877ZP1CFLeUpZx92xegr8QNRKDH1PVEV?=
 =?us-ascii?Q?UgHPCxDrmQd0yzGDcMC7EeeibFpwQRyTf+O1sAkSpl/WbOKk04JFHisrJjcz?=
 =?us-ascii?Q?U9jKE8oza2dPQJCuf3B8mXsQ2gsu5PHXAMsZmLrrlY4vaM7nCncFMyPTiHER?=
 =?us-ascii?Q?Gb9nVU6eQ62KDiwZATfkphcyAugc7IUer3TG3ywuVtM+jF41iKjcc1qpfvyP?=
 =?us-ascii?Q?Q33HWweCOtiTjIyGiwEYsZv/JihSDpReMgaD7czMRO+rPbduCaqa3N8WiMGS?=
 =?us-ascii?Q?jOaS1fmay/++IwFVFPoi3iPO3gZxkELWR2kmZK8rC2ilxZf5GbEP+o/1od7a?=
 =?us-ascii?Q?N+EhujQkYw7yl/olOnYWfkdrFFw3W2ePTJV6H4D9zlQstPuclne9K+746NXh?=
 =?us-ascii?Q?lUPGoj4dYelhD41eMCyhBp+0FdpBRYTMm22JqcxwQSzV1ajjkqphudz/LH5a?=
 =?us-ascii?Q?p+NtGBqFdLZ2CA7lHquOtEjRKF1F/WRnmlZL2SJ7Rl5vzvRpV6MqFLkGwQVz?=
 =?us-ascii?Q?4h71V8h9BZN0AMak9ssy1igNNqX1qFYaAOdWTcth74vYqCmDLoRvYwP8h3R3?=
 =?us-ascii?Q?Bollt3cPU1E6yWDTziD407rtCaz4fLOJmCv27vQ8uiwzTfNQ/teJVRMuVYf2?=
 =?us-ascii?Q?9OkyMKBTs4mCFKPR6AI96nBE4r5jbi/PL0XsAKE8gnOlRZLSFRdWeWnvARvs?=
 =?us-ascii?Q?nQA1KKkDNA2tf5rVFiskwwYVr9Ia/nljayw2QUQn55ci0OMUS+jePxLECRMI?=
 =?us-ascii?Q?Q/0C+llEEDlXVuegs2KhvHaeJ5tpq6o2fYshOfqxKFRZrkDBXonQR7oCmwod?=
 =?us-ascii?Q?m+hqx+vtnAJpt8dre9vrU1R/cgvRfjY=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e374734d-e992-45dd-e0bf-08de8578e3ab
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 05:32:19.6273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3yB2dsWYOKlldjm84JKDBvfsdMsaUgMKYD0uIpAlCfLYO2QudRqNbrEqsVlteJwuhc6Bbf7d4SsibVkmOQ5rd8qHIW7mhIUdLJUTMLe1RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1928
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	DMARC_NA(0.00)[chipsnmedia.com];
	TAGGED_FROM(0.00)[bounces-56284-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.986];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08FFE2C63C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Wave5 encoder is capable of reading in numerous raw pixel formats.
Expose these formats and properly configure encoder if selected.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-helper.h |  2 +-
 .../chips-media/wave5/wave5-vpu-enc.c         | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index d61fdbda359d..e6f241012c3b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -11,7 +11,7 @@
 #include "wave5-vpu.h"
 
 #define FMT_TYPES	2
-#define MAX_FMTS	12
+#define MAX_FMTS	16
 
 const char *state_to_str(enum vpu_instance_state state);
 void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index f315ed7243a7..b24c65f174ea 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -90,6 +90,22 @@ static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
 			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUYV,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YVYU,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_UYVY,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_VYUY,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
 	}
 };
 
@@ -1161,6 +1177,22 @@ static int wave5_set_enc_openparam(struct enc_open_param *open_param,
 	else
 		open_param->src_format = FORMAT_420;
 
+	switch (info->format) {
+	case V4L2_PIX_FMT_YUYV:
+		open_param->packed_format = PACKED_YUYV;
+		break;
+	case V4L2_PIX_FMT_YVYU:
+		open_param->packed_format = PACKED_YVYU;
+		break;
+	case V4L2_PIX_FMT_UYVY:
+		open_param->packed_format = PACKED_UYVY;
+		break;
+	case V4L2_PIX_FMT_VYUY:
+		open_param->packed_format = PACKED_VYUY;
+		break;
+	default:
+		break;
+	}
 	open_param->wave_param.gop_preset_idx = PRESET_IDX_IPP_SINGLE;
 	open_param->wave_param.hvs_qp_scale = 2;
 	open_param->wave_param.hvs_max_delta_qp = 10;
-- 
2.43.0


