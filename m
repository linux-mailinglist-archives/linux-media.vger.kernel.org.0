Return-Path: <linux-media+bounces-11317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6F08C233B
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 13:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E853AB21FBA
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 11:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62711708A6;
	Fri, 10 May 2024 11:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="F/Spdvx5"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020002.outbound.protection.outlook.com [52.101.154.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96627170859;
	Fri, 10 May 2024 11:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715340206; cv=fail; b=DRSiqEU1pHL0euz+/koctNR9cfxLBH0s/jBB+AvaO5zM6R/GP500Inr67eYh7coPWaaOyzAR0xkPKGI/UBvxpgOwj2SiyWWY+JjNpyZFt6xgqy4VIytDmbzZ1fp05aQ7GFNzWfXU2VwDK/c7LeNLrA/NZaecSnZKfi3wXuF3G40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715340206; c=relaxed/simple;
	bh=g7GnN3v5b7brU1xSRBE+yINneysTTH6RhFrDZCOc82Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=auJhLoM903CXZH4GZCt/X+2Zi2ReDPZbaC+mB2yxQDYW2rddjAADRNqOfA2SzRgmLd6fhh4scwm1qRMHwE+aq+dyB7EBUmDDHwRZLRLSY0mJOSD35GwZ3PwexsMENmBte1+rwfY6uMzZtoivIUh3BgZdfzAblCchDD16gBaGZ00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=F/Spdvx5; arc=fail smtp.client-ip=52.101.154.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oevy7l3h4Nn61mwyPYvfdnbQwr8ccOGPfRpNuj7Kghesv8nsSvVtb41/tTZH7iI2EnyVLNcKLY6KydMAGXh/PYConEKm+sor1B8YEVmiYvUV3Gr7p07P066429pn8/bR4cImqOYJy65ocxDz9GEFUBxkUU+Yx5mFjqcnjecp++1pskMTdbrJISBKHyasesU6eRXOskW0oBAFjK51mqBQ8wwJtOqj0q/xNFi/84IsL60Nrad3XINJiHBDJpg61Y+yn3rc5//esM6znxjwRd8AI2y5SXWpL3NPVldm2ridYY2igES5mdLoTuwSv3+iv8X6rFUbrbSvt1i4ovXmDl7qcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSBCqniFhGfdDtbG2A0I0Ml3S3aWDzVpm/x23WOZIfU=;
 b=dsqj91I5L+x4I5SnsLR0pmjD1A2rP+cUjCPozxB0MOEteDFsVD8AVey5F95fjqEjobJDERU1r0GS+cBeT34FN3cQBQDxojBV9nQuysuPedSX8D3KIKV6hxeV6a2AsWU37I/7fuKjV5CMz/X8FE/wTT0Fk91JHShBBkTX/0NJlqt1Q+CTfZuzDb9isOE0bwmcWgBNTCj2+HjMkCCyGmkk1oD1RllXu3kB6Z0C5o/HE8M20lbi0uXRxlaHUJ8kzeRxC1BuIyxD7Ogx4FvlD7bVsqbvWYymt/TB7AQL3+mSM57pa/VTvUe/sl5iIIfE1J52QUut56ePyy1vSuDkWL8GYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSBCqniFhGfdDtbG2A0I0Ml3S3aWDzVpm/x23WOZIfU=;
 b=F/Spdvx5cqUzVmnT5EbkIiOtZ7ylgYKGFgZ7L5/QkSVqocN8T5s3SyrcCir3EIzQD6xLVjPNyc2sJSn4S11fMujQtH+Sr1RygZOxihN9StcEoQz3+cyLM3qdCRmuCs0m0T6pfIhJ+RLzsybjQcMoAoYQVwHWfKCShdhIT/2rtdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SL2P216MB2862.KORP216.PROD.OUTLOOK.COM (2603:1096:101:286::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Fri, 10 May
 2024 11:23:03 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::ce88:bd2e:8caf:8004]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::ce88:bd2e:8caf:8004%6]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 11:23:03 +0000
From: Jackson Lee <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com
Subject: [RESEND PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder.
Date: Fri, 10 May 2024 20:22:52 +0900
Message-Id: <20240510112252.800-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
References: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0168.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::7) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SL2P216MB2862:EE_
X-MS-Office365-Filtering-Correlation-Id: 48696a90-7201-4b58-a26c-08dc70e38e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CvN2uEwtRjkPXeRsM/kUb2aaKv+H7eO5/kLX6i3q/HA4F2Lm8zxufjWAw+pS?=
 =?us-ascii?Q?yoEucgUIbg9W6H0u5FafcM4M632o5XfCJMtH30DXzSxHCDXH7WNUjJ9pM4N0?=
 =?us-ascii?Q?z6Q7Y/wt/aUVCt7H3XQ43GoJMq2B3aGkemIpkZvRYBv1GhTM0Xjx7LQp34Cl?=
 =?us-ascii?Q?DcE3QggQgxmye8VvjCBwXI1abTDDboonPEJ6VeVIVQgsDQX/zIckYYHGXAAj?=
 =?us-ascii?Q?E6HG6MN6Z6NREBd0xuuzFSTPxGl4KodJYvZ5VhI+Qdlwl+V8l24J5+031cln?=
 =?us-ascii?Q?6wlTaZHQ0SuRZqymNCdEx9W/YFPU7AoNgX06pIr+mVQ7edmEjRFdTAH9v9Z6?=
 =?us-ascii?Q?Y4aP408XE5PPgEQNDu8dvVas1LlWviqIButEcHCdNjgXfXWC2noE2KVKri4X?=
 =?us-ascii?Q?Aqcc2K/UXDwqT2qrI247vIhXXXQS9Pf2Q+kvHbLtVuz1cJBHIuOGqPfmH1rA?=
 =?us-ascii?Q?zZ6I1hk3a4V1RjJPfbM6Wf+SAzxC/Pk6AP1Zlp2o7ElqaHKwWZMpTiw4aPz4?=
 =?us-ascii?Q?GdaCGdGaeYLbSbXIohiZkoWvGHcJPB7fF0gCnJOw3WF934j6qOFWncXFPa4K?=
 =?us-ascii?Q?TeDyPLYKEyqiqSfes1uwlfO7/H381lHsapiWGdZKhIqSCpF9AWcTfkB0LR/z?=
 =?us-ascii?Q?T9f93noNuttx9yocVB3h0MpkUvg06qb93n0OeJDt22B7/Q5lz+E5x6eMeuQV?=
 =?us-ascii?Q?p2yIL/0fz1elPummVxi78o2XdakL9Nw7AoWbXe34MllCure/gpy0ZxsqJwus?=
 =?us-ascii?Q?O2I05Q93SVoVhZ+msDA0l50fHgo+1zjCcxbIv5eDRZCTO/l8T409Ac9ZWKaq?=
 =?us-ascii?Q?ABVROsVACAVUJ51VyilZlhRMmCuRctH+Zei0kMA75qWKCfvWBwZRLUaHkVzV?=
 =?us-ascii?Q?y/ZDnMBfnP5r56MDExv/wbObyLQVjU8lmhEmafS5CusoduzD51fkXbL5MMYE?=
 =?us-ascii?Q?y6V3Ls5c3iyYLw3JUCe3D2lE3qgGpJgwJzl6KGsX+T9FFvh2NKd4V1tujmHh?=
 =?us-ascii?Q?PyvATB2YNHZWfh/QUlyeu620j5p14pYgjZE9HtYobxmSHNKMpZ+Wo3Sk00On?=
 =?us-ascii?Q?ahB9f8KbVCJs5GMxP0DgduXVVRiHydLPq0r1DpwNGLWWNf673qXFvOygvBTr?=
 =?us-ascii?Q?xZtgxI+0vUxrEKlnXgIJnl2jE3N77ighEY5ljvnHjd2e6DCAe6AWh7XLVN2/?=
 =?us-ascii?Q?ySpAcwQVEbAtKgaNFjCj+OjSvV8i5WFPG4jmO1JyRn6PARkSoAFGiIhwPSas?=
 =?us-ascii?Q?c/zIHwJmc2iRyJm7x5Wbq8aeQ53/71wjGWFPk0A83XU7N5ZkLsbgCVNwWLDt?=
 =?us-ascii?Q?f3FC8mZ885lkMqAlsXAW+lXtrN1x23Z67Mmrp2hfTEt7Xw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PPOg4MIGb2Er6LRISLTQYJzyimYMYZIi50Uk/lfZBnv5UX4SS4fEcpT2tuWk?=
 =?us-ascii?Q?jrWg9PeU54x8xSVoDOUzyJ3QzxdqjLlRFo8pGXZRchhZ5hXuM3EETy57SiQW?=
 =?us-ascii?Q?mImQYqhH3HBjVdzsxUb1uR/d/YTXJ0RfBD+P6JDCx+zdjjeb8Xy3kAmMsrsC?=
 =?us-ascii?Q?hWkmRW1Tnjb60gLDUmWYOQQywnvUvWc7de99HNoSpbNheKG8ldlU/Ex2vAgo?=
 =?us-ascii?Q?Pz9AQ2f5ANk4rqoTgN0X5XgeD64m3bwiR/eRJk22kqrdp/Dn+kkcl+OcS7em?=
 =?us-ascii?Q?x0BFj2XgqSBHDeVJXF5msJR/msOGzwvXm9RDWA98B5D09aTdJSjR2HvMsvCF?=
 =?us-ascii?Q?JNUfqUu/SD1vbPUCYJyOybGy0+bxBPtoKnZpR6df4H9BJzyIYbF+KicRXA3d?=
 =?us-ascii?Q?9tjr2skj9aOm5GDCWWHAsooFHXb8tWd1iLGhr3xdhy9+lqcucAgfq8teGLGM?=
 =?us-ascii?Q?V+miMv86JlJdSlgk1vh6M8aC/+hNgbNZ3GTaUNZYX430k3h2GpKAa3DYqiXS?=
 =?us-ascii?Q?Dv5y0YKLLxaA6anM+4eu9duN/4U5aFSIj0mwmZXf/ETK92Cy0Tf4Git2dN/Z?=
 =?us-ascii?Q?9HbnM2lJq3s34i40Okagez7GAVQ15x+y/LG9JaSF9emsihg3DfQcSwXFAnMm?=
 =?us-ascii?Q?/kXXP1JVlDUtJh6VIr8XrulQ+uJ/5csEziOtxPZB1uppDiYev54rYmZoi/O5?=
 =?us-ascii?Q?2hoZJ8nBmhMnkhN2lEntHAJOF1HZmBi5tL4gCxyHXvlboocJGr7Y6gF8clgs?=
 =?us-ascii?Q?woAs/XGniGmsdjhaS7SpkhPU0l/Ixjwchn3TiU0w6SsVzFGH23OSXitPZbZm?=
 =?us-ascii?Q?yWw/uPRxnxcrBwLYXA0Jwbv6W4gLhIsmcA+PnmH/EdKFxZb61d6VabbuSEMe?=
 =?us-ascii?Q?or5fiv+ym+9A8hNm3vIcxIuCUx8VQGYGprTg9HUicM9s0SsLg3R6xSpsO24P?=
 =?us-ascii?Q?GPAxpqkmEXZ1tDGRteWONcHZlQ8HzidzRwi8UTTc88Q6LQNzIKER+Ua3n8dl?=
 =?us-ascii?Q?/nzFIB4MIZazcY7kiuOzV2Edy9x3XLE2fzBVvnxZsPaVad0mmlx8JAZSi/Ro?=
 =?us-ascii?Q?Mb/RdRjQ3Q1VirgrJQsA1BXnoRG1TX1uSi/CVKlZiJvtH4gL0Ngo7SS6YKmS?=
 =?us-ascii?Q?J3PwAOoeEVy/usRPr2x/NvKQC1PgeqBd/4fIS0n30GDB3VJPqL6XgpD351EV?=
 =?us-ascii?Q?qJeV67YPIGuCek8xegrgOgo4gh5MmD8n7JN6Q7YR3lKW1vhIFzY1bMRXL/1Y?=
 =?us-ascii?Q?b8ETzyv55lUo66t8ljb0MgyK2mtB8udCobXCVNfYPvuoTOEeKPNzBc1QDxJF?=
 =?us-ascii?Q?XGTwJBmzOC7xp+bf5WGX9SY8OLSDa4ElikXc1lbXThm2ji4NOO+7oK5qP84q?=
 =?us-ascii?Q?xfVCNXoDRweTNkp78l9ck8uvQjCDs96szSgC3wFS2rqniDK4AwMXQQflDe5s?=
 =?us-ascii?Q?gTmZathldmwH+sxdCgJdZWJXKnJg+DvowUvfzvyKBXAg930ah3gmxumEVQ8Y?=
 =?us-ascii?Q?SYxGv9GlzO2lWnsPT4UMUjXXHzZLrW2uf607isdFA10EdIGeVZTuKn9U8wye?=
 =?us-ascii?Q?Ukmeu6uaosaZIRQdDvlhxhFjG7LZ5nTCdHC43fAvTu8c23B+U+r8qj3KX6SL?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48696a90-7201-4b58-a26c-08dc70e38e9a
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 11:23:03.3123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eqdmn11kiciNOGdIsLsBL8i1nfsWzE9WAZ0vnE21rW3h5ISXyjd7jZqe5uJwiW+K8LOqGbu5ywQW1Z7zpA31LxLjvtp79xXj8W2FE5ZLE/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2862

From: "Jackson.lee" <jackson.lee@chipsnmedia.com>

Add support for the YUV422P, NV16, NV61, YUV422M, NV16M,
NV61M raw pixel-formats to the Wave5 encoder.

All these formats have a chroma subsampling ratio of 4:2:2 and
therefore require a new image size calculation as the driver
previously only handled a ratio of 4:2:0.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../chips-media/wave5/wave5-vpu-enc.c         | 81 +++++++++++++++----
 1 file changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 75d230df45f6..3f148e1b0513 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -66,6 +66,24 @@ static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
 			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
+		},
 	}
 };
 
@@ -109,13 +127,26 @@ static int start_encode(struct vpu_instance *inst, u32 *fail_res)
 	struct vb2_v4l2_buffer *dst_buf;
 	struct frame_buffer frame_buf;
 	struct enc_param pic_param;
-	u32 stride = ALIGN(inst->dst_fmt.width, 32);
-	u32 luma_size = (stride * inst->dst_fmt.height);
-	u32 chroma_size = ((stride / 2) * (inst->dst_fmt.height / 2));
+	const struct v4l2_format_info *info;
+	u32 stride = inst->src_fmt.plane_fmt[0].bytesperline;
+	u32 luma_size = 0;
+	u32 chroma_size = 0;
 
 	memset(&pic_param, 0, sizeof(struct enc_param));
 	memset(&frame_buf, 0, sizeof(struct frame_buffer));
 
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (info->mem_planes == 1) {
+		luma_size = stride * inst->dst_fmt.height;
+		chroma_size = luma_size / (info->hdiv * info->vdiv);
+	} else {
+		luma_size = inst->src_fmt.plane_fmt[0].sizeimage;
+		chroma_size = inst->src_fmt.plane_fmt[1].sizeimage;
+	}
+
 	dst_buf = v4l2_m2m_next_dst_buf(m2m_ctx);
 	if (!dst_buf) {
 		dev_dbg(inst->dev->dev, "%s: No destination buffer found\n", __func__);
@@ -479,6 +510,7 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	const struct vpu_format *vpu_fmt;
+	const struct v4l2_format_info *info;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -500,16 +532,20 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 		inst->src_fmt.plane_fmt[i].sizeimage = f->fmt.pix_mp.plane_fmt[i].sizeimage;
 	}
 
-	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12 ||
-	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12M) {
-		inst->cbcr_interleave = true;
-		inst->nv21 = false;
-	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21 ||
-		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21M) {
-		inst->cbcr_interleave = true;
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	inst->cbcr_interleave = (info->comp_planes == 2) ? true : false;
+
+	switch (inst->src_fmt.pixelformat) {
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_NV61:
+	case V4L2_PIX_FMT_NV61M:
 		inst->nv21 = true;
-	} else {
-		inst->cbcr_interleave = false;
+		break;
+	default:
 		inst->nv21 = false;
 	}
 
@@ -1095,13 +1131,23 @@ static void wave5_vpu_enc_buf_queue(struct vb2_buffer *vb)
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 }
 
-static void wave5_set_enc_openparam(struct enc_open_param *open_param,
+static int wave5_set_enc_openparam(struct enc_open_param *open_param,
 				    struct vpu_instance *inst)
 {
 	struct enc_wave_param input = inst->enc_param;
+	const struct v4l2_format_info *info;
 	u32 num_ctu_row = ALIGN(inst->dst_fmt.height, 64) / 64;
 	u32 num_mb_row = ALIGN(inst->dst_fmt.height, 16) / 16;
 
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (info->hdiv == 2 && info->vdiv == 1)
+		open_param->src_format = FORMAT_422;
+	else
+		open_param->src_format = FORMAT_420;
+
 	open_param->wave_param.gop_preset_idx = PRESET_IDX_IPP_SINGLE;
 	open_param->wave_param.hvs_qp_scale = 2;
 	open_param->wave_param.hvs_max_delta_qp = 10;
@@ -1190,6 +1236,8 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 			open_param->wave_param.intra_refresh_arg = num_ctu_row;
 	}
 	open_param->wave_param.forced_idr_header_enable = input.forced_idr_header_enable;
+
+	return 0;
 }
 
 static int initialize_sequence(struct vpu_instance *inst)
@@ -1285,7 +1333,12 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 
 		memset(&open_param, 0, sizeof(struct enc_open_param));
 
-		wave5_set_enc_openparam(&open_param, inst);
+		ret = wave5_set_enc_openparam(&open_param, inst);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "%s: wave5_set_enc_openparam, fail: %d\n",
+				__func__, ret);
+			goto return_buffers;
+		}
 
 		ret = wave5_vpu_enc_open(inst, &open_param);
 		if (ret) {
-- 
2.43.0


