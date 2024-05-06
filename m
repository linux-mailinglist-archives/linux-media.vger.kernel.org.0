Return-Path: <linux-media+bounces-10840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AE48BC9FE
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 10:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0943B1F20F3D
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 08:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061701422CA;
	Mon,  6 May 2024 08:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ev9WGC7j"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2066.outbound.protection.outlook.com [40.107.6.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DB8433BC;
	Mon,  6 May 2024 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714985393; cv=fail; b=Y28f0hEMKD7YCBJVMBFsVSUPUPUVSbNwRcpNSHPDze6X+anSnZd7aqSfJl7t691C65uoeTSZgbv3QV3gCr1rvMLSh0mhdwurZRx3iqFF2DFjlNnroVbHmabwtq7ynObLDg3/NlJT0Oz8D8Xi8KgV7IUz4V4ygnA3XSXNMzFd3EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714985393; c=relaxed/simple;
	bh=Yc5rZk43q62aGDq8FbcbzbIGlNsmTGDl6m213sgzY9c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=W8yBL6HzsFvZ+iq90Y+u3UWhZUVXPim/jPApklLdQrf+NGFjonj2oaeljZ9VG9b2Bm4E6WH4gQsgmtVz8FybjfLr+E0frNyMt3jUBQq3F0s8LGXIzbRawMPgJstcoasGOFQCUWhRXKz1EdE413mZbdFKPogAb+MWWWyIRFm6EF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ev9WGC7j; arc=fail smtp.client-ip=40.107.6.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QP/X4QoiDA63cO6m1KGENhWyLtd8cVVJWIFEovfdbGrHd3tOfa1uZn/wObdnaSOI+D6VtevV9ptEpqHk6WuUMVU1XA9JMIaC2bJSYduyZDiEy/SmsE7+L2dyWhoeGRnbp7amLXCC3yo8fkLVWF34ZbmQ+/JCEDs2gI7LYqi9yROVaBRl3q7EsXaaG4zRRSt/a9ub4nQ40Zlreb1is22Ses8l2rS5x41XV/fgr1ehFIEC7Ikk3AvigVU5ihklNcOhIpph0uVh44f9jFjsk7n+M4DOWG5UthNmLdF/zIYQ0tsK3E2RqnQ/UVPnrJLFFYOc/J+SYvvJzlCmPOS5rCOX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTo0bKjrWDb9F8Hec8Bi5UndAfsSQb0e++NEeYY+48M=;
 b=SxqzRATLZ5cLaAPrQXt1mmz+WiuctydlfsGYZNBKif90bZ2NUEWNIMWYrHtMD8m3jKEt74NyhS+iZvL/xLl8V2mHkHh9VFa9oBuReMpavEAT3sWJ0YygAssW0M/xQ0U/xKo75ZJFeTYziKHD5Kf9bZYVaEh22jU1LJrnFi5H4VD83V5fRtUVWySZrPDQnoT9jARWPLDS2UHQiHeFO4d1pVmpbmCLDas/IG+mZypv9AAu2GHw/Cq1xTQ5cfUVn/NYvoj3KjUHODd4vjI7pX+gV05nsXpA53EQ1k2ii+SHNOXlQQ1r+1LaqUURVHC6GNCShXGFSn9SzHIRYfnfACXmxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTo0bKjrWDb9F8Hec8Bi5UndAfsSQb0e++NEeYY+48M=;
 b=Ev9WGC7jZTatwSo0Y9lniHQkltOeU7x2EzCyXIPy12kAo32xNE15XbKKxyDa0UFQXAxAA7I+ACfSTYz7OeA7u6XjeJrON20QAWQ4o3NErjy4VKfIl9y0ddjRQwg1ko8w6y2MfedpLMDdNE8rDtqYeIym2RZVDRxCyHgMuDGep1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM8PR04MB7812.eurprd04.prod.outlook.com (2603:10a6:20b:245::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 08:49:48 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::8589:eb00:ecf3:b4ca]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::8589:eb00:ecf3:b4ca%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 08:49:48 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] media: v4l2-ctrls: Add average qp control
Date: Mon,  6 May 2024 17:49:16 +0900
Message-ID: <20240506084918.799544-1-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0178.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM8PR04MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f87b94-73a4-4318-f5bc-08dc6da97c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|1800799015|7416005|376005|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iHeIsPfUiSvkcabBogVdVfHGsYBfTxRA3n30ZoK9NpFD9eprLsFZ3qoyh9FB?=
 =?us-ascii?Q?Ws0B0VrLxjVvkBQES9XKs89Q3ViRomQwtO06MssKQOrI9943bOWZC6/LIAAI?=
 =?us-ascii?Q?sjPRmojiWBePWNh6d7Qf2Qj+j3mdAOCguCxYP1A8siCF8TmIAc2U0Fds3uwI?=
 =?us-ascii?Q?eh5dPcxRREE8YzkocGxTjuKiI6348eju/8/Yvv0xeA4g2uohwm97pGM7AmL+?=
 =?us-ascii?Q?9b1GjAlQ8li4qovZZc3fe1h/fXT5g2wtZ7tgIpyO5oZ8KOPkgwc93tBr+raP?=
 =?us-ascii?Q?nb4rsMV4MWDr01stWvW2nIOkoNpKkl17EPmX3zQjrponW6oR5DrAvY7xvejv?=
 =?us-ascii?Q?4wcCFJnvN/jB6rv6kc9jJBbfpT8ETnAS/Cm0IOFcohnVieG2ETWjqWjBt+MU?=
 =?us-ascii?Q?b7xgPohXxGN9KuCI37CuGpOGrOh9TO6S/0LQDBrZ33CfojGKBG+Ivd9bZ3k5?=
 =?us-ascii?Q?Gn13FLupKYYCWvGhrJaRLsONLeVaYs79ArmCtqCsfrL9NZ1wJw69dGk8MDnC?=
 =?us-ascii?Q?pF8NY5C7Hz+9escg5xkqvO66WkV6RdAz7kq5WW0QbpQpWuqbM3z7sYOIolyO?=
 =?us-ascii?Q?4YnOK8+aRSuSPasI7igh+78yVxu8KUrsN1ufjl1WxG9jHmU5KFSudJSBMCdB?=
 =?us-ascii?Q?X4PiRpTaF8D1CRWwJ4lny+Uute9eyJB8nq6iZM4S8nFa4xffwxuhsxKiWvxs?=
 =?us-ascii?Q?HiPCKV1ePxtn8Se3mmhblKC8hXViyRKqkQCf8eNQJ2AStEWw81Q3gOL/hyrU?=
 =?us-ascii?Q?knopjvdCW9bsixOU13B59XuLDkL9xjPJDo2NerpqmG655R/yPzHlsxa/JBws?=
 =?us-ascii?Q?27FF7ll25j999L0Km8wzBpPYfiBX3/CXKdRsVHccWJ/PBXbh/UpuyPpayT2U?=
 =?us-ascii?Q?cG+d6xSuxha8KxdoEiFpRtPgtTcXDbFg6BbBmB7HIW/t6zjZmdPo3LXih0gf?=
 =?us-ascii?Q?tx8C8TDjdTiaLKlRmtGu2Ea8ie7YgcRr7jIsW+rVKewOlncVvMdGITBDgCWS?=
 =?us-ascii?Q?0BGZ8syFyF7N8BBY/HHCsCMASDr/kPX5ckBB70VkLO7NGl7bEdeN7XslSViR?=
 =?us-ascii?Q?L0xZYYNyrbP0gGVh/jM6+WsWZRGzg6lZ+i8XwFL4UuyjZvsubqucsuOETiQo?=
 =?us-ascii?Q?w68LTPywsXhak95IhgJUdbOE0+7GSXQqSWKfoD06sHVM0oOShp2Q2ttd4c3O?=
 =?us-ascii?Q?if0kByJWg1Lsgvou7k5WS4DcX9dSntnlIqVQ/+oNsM5Qrmf5Iesun/c7wUVA?=
 =?us-ascii?Q?xVkspnGLVFIlBrmDXjQA3e/HqBp2tOhp5rbGz6iQRK5O6wn1Uy6k13um1YMc?=
 =?us-ascii?Q?OTU2sxz+RaqC8U7qElqGA8u6WUhRAqBDbqzhgv9srqjZIg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9WB4GG3xHD3OiZ3K6z/Wa93+zt9wbv9cFlQkjpbkKPCTFzwLiSw8OeWp+4uM?=
 =?us-ascii?Q?uinAymL1h5osMosUvOb7FA2w/hir2Tui99aDbVixPvhzo+esouNDjuJ6WnOm?=
 =?us-ascii?Q?2/6z8fnLDvxwVQfM3Njc/kpXiRwEP3ys+jgPJ+qeGTEzZ8ZKoBVEzOlUO0BX?=
 =?us-ascii?Q?GVRHGIhGdhoCUZBZRgoHRKppubMaySghEdPpYB5/zyGjsxY5t2oRMc8aOXHm?=
 =?us-ascii?Q?nEIEhG+JwtgyxzrmL8T9TjZcLVcCBuIXxDONtdCGYJbBgyLpr2OXCcucqtM8?=
 =?us-ascii?Q?IirUMMPsmqMcTngwsvLGUP4LPt4N3dhqgAMDlTgSqnVh/VWkyzAs1tJPF4Vc?=
 =?us-ascii?Q?4nJHVYC+PfdEzPcoM5VmSCSn6bNquy7qa+WsybaZOYmg/2MHsYQFbh4XSRgO?=
 =?us-ascii?Q?pQDLLKatd75qjcn+7fkXxfoQ8ASUEEyWvgZSkMGH1FN9MbRtWjDz8WSVZRL7?=
 =?us-ascii?Q?Hu5e3QK38BhxF8Og9/94VaFtloHlrj2ST8Gz5FUObAFedHvbyiT1dKupbzCp?=
 =?us-ascii?Q?2RghNzBJqCS9Y7zgJgRFXhvx1Ce2QLgSqf1ljxnFLZDbytima/P6bi+Co7M3?=
 =?us-ascii?Q?u100hzKx9B1I6LcyUftdLQl9IOBq6JgNdMgllvXEoQ+rdtCqp9yjEOg688S3?=
 =?us-ascii?Q?xIX9eA96flUlKhGVuQ0y788WBOj0Qupg2xJ9nBXp9GhMngBzRYNhmDcsHZMo?=
 =?us-ascii?Q?tDuIBkdLNBUQAVP/hY0FFKwNaT1xES+VtlWyEQkRBDH+Sz5wYqRBCJvrIO6J?=
 =?us-ascii?Q?6rbz+A+7us4p4bTdBvVb8/E5+FGOvGzWFbJY/Cxcl+KW3uMY2BEboruku847?=
 =?us-ascii?Q?KBTyapFFka5n4JtF/2l1txcxEWKfJKBHHOFiLeq7gTjHxbvaVFQSI9jIyAhv?=
 =?us-ascii?Q?9OPUjMNh0oeQ1xErIQEKtToj6AC26Z+8xBA9FgmEh6kOQcHK2shAdcQvcpxj?=
 =?us-ascii?Q?xNmkQWLqE3d43FdtPiYGgOZF4tf38gobVHR1t73hOsGxT1lBoBRDYPmED6ca?=
 =?us-ascii?Q?R/KJ7oFvJl1eJvKt8GUS+oYHkKIKXksphnc7gfZqLCjXCuIhwWouDKq2MBZZ?=
 =?us-ascii?Q?Og1sdyRYIWT8whNR62MedcvMn7fS0F/HuFVyReNrOaBqQ/23Zgq2nY3bcyHq?=
 =?us-ascii?Q?JDI9xntixnOX6RBIJ9gQ3Bw6joZn0k2JZZv5jJ9nKhCkfG9QxgaZLxrK7Iaw?=
 =?us-ascii?Q?EUsLUTF8qiDWJH3gN6EpPtjP7xpmwA6APKDwfmd/WodZtVLDasbuqS+QfaU1?=
 =?us-ascii?Q?TMozPhaH0ZVBSDZbqkt0hd9IvTeqBLSagKT6v8xkpcSKyCLRNjC/Ag5Ov3MY?=
 =?us-ascii?Q?LjjHqninEnhGpHQ4A8cCuMz0006ec3s2a6bKkUrgmqggGvaJJyV6yF6e7/KA?=
 =?us-ascii?Q?FwgdVImp4wD9AVvz4w0DCBStKJWqAGTUaqnNiIQ0d7VdiuRzirZihFSVwmXc?=
 =?us-ascii?Q?c+RR8/QyzTAm2PsXNvPBFKkhU4CVLFxGax0jP9aOuEPh0kNbJBqNzTbzGDbn?=
 =?us-ascii?Q?+WNdZM6dSY67WKV+K6EPujYlZ57LNWbgvcaCaWunSRTj71G/nXfnv0ch0Ncf?=
 =?us-ascii?Q?ZN9p0YPUMOSo+a7KBZc97S5CMlThdPMrHhakdI50?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f87b94-73a4-4318-f5bc-08dc6da97c3e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 08:49:48.3436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XluSTc9C9ye0fSGyDHZ/3nsLYTFcH0lOLltJ06VUkwPQW5vIxpJdilnaTFwZT5tdY37CLc9Pzyijk3gWMtukpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7812

Add a control V4L2_CID_MPEG_VIDEO_AVERAGE_QP to report the average qp
value of current encoded frame. the value applies to the last dequeued
capture buffer.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
v3
- document the valid range of the new ctrl

v2
 - improve document description according Hans's comments
 - drop volatile flag

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 14 ++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  5 +++++
 include/uapi/linux/v4l2-controls.h                 |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 2a165ae063fb..4a379bd9e3fb 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1653,6 +1653,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Quantization parameter for a P frame for FWHT. Valid range: from 1
     to 31.
 
+``V4L2_CID_MPEG_VIDEO_AVERAGE_QP (integer)``
+    This read-only control returns the average QP value of the currently
+    encoded frame. The value applies to the last dequeued capture buffer
+    (VIDIOC_DQBUF). Its valid range depends on the encoding format and parameters.
+    For H264, its valid range is from 0 to 51.
+    For HEVC, its valid range is from 0 to 51 for 8 bit and
+    from 0 to 63 for 10 bit.
+    For H263 and MPEG4, its valid range is from 1 to 31.
+    For VP8, its valid range is from 0 to 127.
+    For VP9, its valid range is from 0 to 255.
+    If the codec's MIN_QP and MAX_QP are set, then the QP will meet both requirements.
+    Codecs need to always use the specified range, rather then a HW custom range.
+    Applicable to encoders
+
 .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8696eb1cdd61..1ea52011247a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -970,6 +970,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
 	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
+	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
 
@@ -1507,6 +1508,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*max = 0xffffffffffffLL;
 		*step = 1;
 		break;
+	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	case V4L2_CID_PIXEL_RATE:
 		*type = V4L2_CTRL_TYPE_INTEGER64;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 99c3f5e99da7..974fd254e573 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -898,6 +898,8 @@ enum v4l2_mpeg_video_av1_level {
 	V4L2_MPEG_VIDEO_AV1_LEVEL_7_3 = 23
 };
 
+#define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
 #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)
-- 
2.43.0-rc1


