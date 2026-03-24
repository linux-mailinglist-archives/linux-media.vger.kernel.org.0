Return-Path: <linux-media+bounces-56804-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICKULhUcwmlvZgQAu9opvQ
	(envelope-from <linux-media+bounces-56804-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:07:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 356FF30222B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62A8130EF498
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 05:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843B0282F34;
	Tue, 24 Mar 2026 05:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Za/6l4x1"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021134.outbound.protection.outlook.com [40.107.42.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0A22D9ECB;
	Tue, 24 Mar 2026 05:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774328662; cv=fail; b=WyDZ4ONPCm1t+8eZXUVmzY+GMaCJEJFbLNyqUzoUimYHfM6Uam3jln88U7+gnCaY61thsv8MFJvxAXuVnXmVL6tdLL/zQUxZbzOzutcNAHebdF3FhUn92S4YXibLr0ti44oveM4RTfoFrR5Y3j7mrOqLyZRxNGkuoYuvYFEJ6nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774328662; c=relaxed/simple;
	bh=H6NNt6ifPZkSF8TnhOrtq9pQ0ZI1IY5Z05+CChKkf1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ul/sf/rUvoVkeykrtpjEtDW+pJ9EfyCi6w+8ToC8isrgvBeSaKWXwipg47hbxhErqLMaxF6QSB6AmpqY22NgM6j8yvhtOkNI4Nu7RoEo7RNZfvnOujhDvn4uZiX23fZKo+gp0IEec1ABwZYZMjNHyYr4bJOJshSu6FdakuoA5d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Za/6l4x1; arc=fail smtp.client-ip=40.107.42.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGktvYGxQ0hpuuQV1X8TUNw5VdNZ6JeC+5dpizB8oCNNp7SBLJaH9Qt1TdiAijqWqa91Mt9G5AaDZlDeGy3aEYneIx9hRXQiVlbe7KK+Nxc5C7Z/2gDnNYQvVao1v3eh4cE6S7udlEyIiMC0WSw8caAngJWNT1P+V5G40GPZLbItoEVXsI02jr3gxryjfD1H/MklFxNusUDEEd0vrFiBFHi20IWKO7vBJeqIhWt4aBYzO29b4BRvcOj/AEDowUFPqlDxcGaJPPeimA0XQMlZCTE+2ojMeyLn1zMluOkBWi02hSxF2NEHs14vJPuKqKUjsLuUtLSwFs5lD2aQ4zycPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlitLunhWDaSM0FB4F/9QEdnAb1zw20Lli1+22pDRe4=;
 b=F+Dto8If4t4ZdU2dK5PEGNuOeNC56FJDSsVPLMTi3HjMK0qL3da60DDU7W9q5k4uOMkjXsxwSSe5ALHZc5ai0z1SIHVKgj866m2MSauU0GrK41esNAQnYZ0lmQIhTy9d+Wyilo83VnfZq85UozfBMnrmnKeXs+Ay3JsfJdcyYI2PFMxbHiASVhpB/xLBkwa5xIN+Qlp/4LRZTvsQr0s4vmAciIjYWj9mDi5I1mB4xIjX6K9ONulwYP3Zs8nmhOs4GjvpOWBMAil5g+08zHqR6RjhRhyp1e+a5q/S4/OctQ9y4P2md0PafW9VAvEU1jyI2KIf7xXsScFvGUkFVEf8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlitLunhWDaSM0FB4F/9QEdnAb1zw20Lli1+22pDRe4=;
 b=Za/6l4x1Yb42e0O5caK6n3B6XWPqKbaGchI/IhPT9IVD7POt6PYalHswmO2nnG1A5GD2GA128WnxApg2pW5n+CJHaLfGiyFWDU9LYSV0nbJWyWjZC/vX4ws/0WMzrVb4NzSyXxsTmTwbJykV8ZXkHxhBPhQD4x1IPu4jHMbnpoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE5P216MB3232.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fb::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.31; Tue, 24 Mar 2026 05:04:09 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:04:09 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v1 4/4] media: chips-media: wave5: Add Support for Packed YUV422 Formats
Date: Tue, 24 Mar 2026 14:04:00 +0900
Message-Id: <20260324050400.218-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
References: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0003.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE5P216MB3232:EE_
X-MS-Office365-Filtering-Correlation-Id: f434437c-bab9-4c21-c24b-08de8962c878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	b3ZOJKn+/kAjkO4hf9/B2HqXI19rngMfqsJmA19D/cwu4KdrqKDXra9tIeEnFWzbFRMeruO7WnhJzHN7l2Auz1wcmdC+YIo2lVh5iOngKOexsWGW5oDNH41jqONxMZKRIUBex+KXYrt0ZsmonzkjWf1jRH9UMJqDOt58+SCaX1XhNfXMWU19w/nhPiE/7qOeqDei6pRU9q+3TlQLjAWYlgQuv6sBk+wVpjIVPSPYPQge1WvAEpnG97KqJd/y9i2N9JE+zHFL2TqG7mExZtP6W5hnbiy9MNP1OdGLw5K+P/Ju5AOnC0FSz8I4kCYWQqN/Z2BVt3TJUasHXrs7bfwxEBsv7hz/N+QHDS9ghcBy5acnSymfAtPlj5qM5ojPz8EzqF3EZBX1JmEeKP+TEJmBrU5aKoTt5TkndoDPKua4E8f7HEY23YKc2Lr0JaGRpMYfguBOXPjA7N3xFbOKPXqRESFtIAkbRtpPg59f2R0Ua94Mq2Sjnlc6AbrjqfcsUBJhd0Id2LckEZauO8p3pEDzqr7dgLuECwpwPZSx1YCQYJUF//x0LSvfF639hUMVpCs8PJv6UGDs9Rpee6wgozjTxWbrvAjfbZGCvBD4yS5Dee2RcRe6PKIcuv0Hx7vtHjv7ZsjV36pjSPL0zwTE3FbdxcCCUESSgaEk2IqBPq0zgqbdATjyDFI+SI41bW6HXuQaSpGAL4aTQWkD0cazjwbLSrrP5/2pwlYaqvgXXGm/ZpmkwMLlbHEBC1RyJ0ii/0kUrRMecP+NRazurfwUZmcHRCIZHsZuxR1t0V2bjPRM4Sw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?77v4hUGUt/Srl0Wr/+HPe47M2mm8tylU+TX0Vc+uadRHy0xQexLNHvzrt0cE?=
 =?us-ascii?Q?ZxlelOQO4Yt7YEGWLt4CwvyiZT1x/XoGUkjiOIAe3KUGOS1Tixmt/+prXWXT?=
 =?us-ascii?Q?tedZ6hJCwtztoR4rkqCoAzE7ovI//aP/fb/fQSQXSib3aUjc9LzrRH8UHGTq?=
 =?us-ascii?Q?GeQdfjMepgipE+7YjLB0ILrjclP58O3k1aDN6ReyvQ5EXT+0eW9qL3cGvaNo?=
 =?us-ascii?Q?fpocoZ3ZZHWziFO0DbZTOZD2k1bXMJxWYDXrry6HPrBU/6wsQ55AHDNzFdNh?=
 =?us-ascii?Q?Ee2Hyqnn6OsWax5Ud7KmjdgXxRy8wQdyAikHe/XK7eiSaFW1P1XCsjt0U20S?=
 =?us-ascii?Q?7nMpwruQaIIJbb7ZP4HOINPveOPVlzGsKAp+szsemiQMLo3w5lBmOvYVloHz?=
 =?us-ascii?Q?Xt5EMpVZcs8DJDmB63ZE2yQ6IFrICnGHGNUa39JW1d30FFhHF+lmM7MlNrW7?=
 =?us-ascii?Q?e95RetxiEc29IwMViff/OdGOQyvhZx7em+9MZorUvjjW0Q/HFXMy4XZrIul0?=
 =?us-ascii?Q?FIPPP+riZ4+32PyEay8Fj06CvxevuBgYMlAcMCsWkk5TND0JSMASktNBE9Ih?=
 =?us-ascii?Q?p7GmuE2xXBiQ/fgCEJapaALgSv61k4Riq/9Uda03EzhiMiN9Rl85dySmpOsT?=
 =?us-ascii?Q?xJdn84dLMeQT2tNnN3iz2BF1znf+nLoITrBwZi+3noSM1u408gcOkTWPVCET?=
 =?us-ascii?Q?IMLFNfH+fcWiuze0+BFBcxPlM7DPm2PfhyCi+3nKDpqCxIC6IxTWMUQHrJWS?=
 =?us-ascii?Q?o2o9RBq9NLXTcv70gEpxmv5wcm3LOO46FJAd2CaFxhbrzIDUWX+LG0rxbCXF?=
 =?us-ascii?Q?52NnP83NZOBSNPNPFqNf/crZUm4mFCLJrWgMA2uUFEzbuUt4TXN3CXP9L5AO?=
 =?us-ascii?Q?cdk78Fvb7XTI6/aI6dDjjoYovBe8ijvILIVDhACt4ydPSfMmc6HDGP3+2ATH?=
 =?us-ascii?Q?rmbwzwsIizrNPhh49XtKT2CDNYdWHzTFkISZMbIoUIoTvqAKLSiaWJgdfqEu?=
 =?us-ascii?Q?yPGbb3z97amGH1kyWyRofchHwwdBaDupfxcwPkb3ugzdUx0qHdoGRrCDuLxz?=
 =?us-ascii?Q?F8y3pihBY7iUojXSca8nbYGZMxNjftFcSdz5/o3wUc9TNNxFfjPmK55fjK2L?=
 =?us-ascii?Q?/7zcHXuXXrD5Xc+I5XZjab9ScL/eshVLAA4KEmxQ0ET7LYFzSV5UHE/k5W51?=
 =?us-ascii?Q?NfLDElnU7fYNsqu9eQgAYJbILkPaPdz07dkjdUJK3Cz4SeZQxwGATB0FczpV?=
 =?us-ascii?Q?fy/jjUadsSq8NOB6ek2gyXWOOip5XZ6cshmuBd2yjWOmJZYl5ChUJF+ha26I?=
 =?us-ascii?Q?mIt7UJBf9ZzFU+n7rEhL3B4yZotGRhAlOhrZ4srjc2mqtORQQzEtbY7dBPXr?=
 =?us-ascii?Q?qtex+guENMgt/KYEWYwX9X/1nQzrcngYf4+oXGA2kx37A22hDJ1iqlpdxcZ2?=
 =?us-ascii?Q?RNeVexJoblnR6AE5YxGxqaxEyqn4W2kN1HqV21UQCGA7bYaBSjo+3Q3PhKqO?=
 =?us-ascii?Q?c421qkxdWnt8i88q8gSSOG9ZGrgrc/uHLZkXN/MY53yTW+RullUHXs1y4y/g?=
 =?us-ascii?Q?SEggKO54VJcVn/i9hb7Cjrmv4Xk+2ilqNrseVDnH5NtyDSzyCJZNQtk75dqE?=
 =?us-ascii?Q?M9yydCKCRJvm8paHNljykpS2YHBQmpSmkqpKdoBTJckg8qbTKdQZAWqxIBjz?=
 =?us-ascii?Q?OPgiDipdnSaXI/WuofRXPDARGuUH5F9alJNlHSciTBqnqifWTushpGsbuJdv?=
 =?us-ascii?Q?SL14zdYS6BplRQXJoMn+8sST0oVN+ks=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f434437c-bab9-4c21-c24b-08de8962c878
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:04:09.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeVtxyy4B9PsgomLJBA1alna4HpuhDLhL4wpWdt+4cmJfJhoKiCh506XJ6x1FibvxrOMAIfdYKxcfiRmBU1ZMGRPAEHUd72jtwtgaJjooDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3232
X-Spamd-Result: default: False [1.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,chipsnmedia.com,ti.com,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56804-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,collabora.com:email]
X-Rspamd-Queue-Id: 356FF30222B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Wave5 encoder is capable of reading in numerous raw pixel formats.
Expose these formats and properly configure encoder if selected.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
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
index 775beeb10fd4..ad63609cbe83 100644
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


