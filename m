Return-Path: <linux-media+bounces-23530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A639F41CF
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 05:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 751DE7A56A7
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 04:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2A615E5DC;
	Tue, 17 Dec 2024 04:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="XNst5IAV"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020132.outbound.protection.outlook.com [52.101.156.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6E3158874;
	Tue, 17 Dec 2024 04:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734411111; cv=fail; b=rYAZxvBT4ADCb9ENip8kG2vxDRn5xyiYQBSLiZhXYgLXRf6EUowv9mGVq1pIHoW6mZ8p6E3LA7EDa9ZOcu4uhGBej51NKOhcJP2lyF4plrqdBJg9rX4F902T+sZfxdbgssnK8XD4NH46p3Frq28+pDElHZiiQ5Zsp3VZkPBbjvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734411111; c=relaxed/simple;
	bh=PpGRPcDYw3QLIbKbHUBr+GCMCmX1BO0ojtmN0s+PlW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kkDTqVhZI57lS+cYL+z5F2P4IQETXK7fEXYb9bT5W2saCzCGfYd/4F2SbRCSZ35PmrQkahwaDegS/laxhhLFdCoRAQYkfnaXFtrie9JxyZAXMf2aGouJWvoIkkP7rOfKOuvQ4jOKa5yDrBVwQn3b4UxdXJTrp3yiJljzDRBp2DM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=XNst5IAV; arc=fail smtp.client-ip=52.101.156.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBxEIfpc86EwkGNe1YrduaqNUQDDxobY1EdcnojoBO5T7W+XXfulhX3RHtUTK1+1K5/rBctrkPlhrakpZmS3NW9Pqbcf0d+T7Q3tq5J7qkpc9/9H/IkQEI2SGo238Yi8SjVweZoi87O+6P9mnC8i8/V5GcxmDOuFGbfBAUGp6zC0wtsKVggTE5b5r/Fxt8MF5zCKokBAuPDycKObJcoCQj3TdubgYxV8tu/ldvz42x9gYnzJm4VgkCLKX5VRHk/mFEb66dWnQKAsZXt774/+uvb0Awu2D/0YV+Ft6wcUBmDTDHze38FP34O5ETkGQZgUQrKKWhqtwXlSOCxeztGRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PX+FXFVjWw3VkbMzjqzg+8ZzYcYBYulPRbTnDwoScNk=;
 b=aP02oPKLtLNq68Jl/SKeky31kPRKyjUwhJAIVH9Ye/5/EfK6BvLNcB3RCLnjkSrdtEdx2IhBDRCEOT+Orbovmp0HgWsNkK7l2rTkWoqZpkqBaZWH4ggJ6lux7vg1v4BOcHT+rX8uaalyN7jY0lmQUBO3rJ5G7m7dyqLZ8OFRWilUGPucDZoyjt/zhw7M7DYZPL+SUt8zGUmaRU47kZG64iJt8urNgOOIBQoiro9MBWALaGxnXXUhpWEav6lHPNdoO90wIimNXHLkWCX0+m1s3Zs039EjlOJMBsRJP0Pf88L68WG2KFoB2gnjIwJRGXyEzNGtNtDEGGc098jm+LoQnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PX+FXFVjWw3VkbMzjqzg+8ZzYcYBYulPRbTnDwoScNk=;
 b=XNst5IAVS7lIe/eAN/h0te1nghGrMtIGsCIIMYTAczOXBNjsN+w4E8LdA6KdOVEixrpoy4A6+78jdjlR8snYYzQucoe20LoqqGtwVdeEHpikA1N8Fc3CghXZpOj0puAInYf93gGeBIse6WykrV58UZA7xablpxHDSwmT7Q79uzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB1872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:109::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.22; Tue, 17 Dec 2024 04:51:36 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%3]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 04:51:36 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v2 3/4] media: chips-media: wave5: Fix hang after seeking
Date: Tue, 17 Dec 2024 13:51:24 +0900
Message-Id: <20241217045125.58-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
References: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0103.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB1872:EE_
X-MS-Office365-Filtering-Correlation-Id: 297ab52b-fbd6-4ff5-3240-08dd1e567cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rP3PnqfDi6IeiORybqX0Tkp0t4B4Lb8pUWGioxphp7IOsdnAGq+xoeAp1yLt?=
 =?us-ascii?Q?HttIBs1wAb1NTzAmDtz/GDUaswwDVnF3Ro6CLttSJOxV8SDNO48hZVbrhNUk?=
 =?us-ascii?Q?I2+s9xGBb96Sxq+GMU97Tzzu6cmIfDhMnq3bzWzxhfEZuOEOFKkjYidA6LTT?=
 =?us-ascii?Q?Lad6aACz/7cO5ZohxGIBcMXpNl2yvFmQznV984lnpgWG9VUiQNs0zs5XhCYA?=
 =?us-ascii?Q?RTi1jj9dlDOmOE8UIhR6gaD6pHM0QxnaBN/iALKZUtX3MnyGFG81wmo/pMSp?=
 =?us-ascii?Q?CPowODsEJ5Knl33p44ChkXKWCVrvaZ2KvoOQuK1SAxPtVWG8XPm3qyUGg/hj?=
 =?us-ascii?Q?fOkgBqXDGZ9reZvB0KWqbtLagJa9e54cpnNkLm+L/gtw0UW9YTgLstxnzbJi?=
 =?us-ascii?Q?9G1bHX4tMDLedrOSaCvkvrVT2SYS8PnurZ5X/u9UpEA/Kb5fUUc+1p5jdgm8?=
 =?us-ascii?Q?bwK/TmFFpFNTibbgwI7chOVs1V8/M/fjU2kOJP6O7gmDUKE1wuyFaFy6WlBx?=
 =?us-ascii?Q?39OsSlmj0S1VFfAlBCBJ8tcJTA52mNAzmYXpU+5HuvDzfzvyevVsSHjNzOgo?=
 =?us-ascii?Q?X8fH4ZULAYzRyDvlb/rd4IsimVX+32cFwoqxLF0b42jNEzn8pMdWqsG7iS9I?=
 =?us-ascii?Q?iKjqTPHFsocaSE7ekfT3b+iePT/S1ITGYV2ba5MkE1/Q3HYfxM3n9Rqj7Gpc?=
 =?us-ascii?Q?gYmOT0NO1ypPmlclXWLFRvknuXaDQ8nfZML3EYrUqDRxWvuOwrfnBOnYLkIA?=
 =?us-ascii?Q?/T3N4fI/ab84pk4ijh75VGLMt9Fm9GJQu+cIbbNM8vK+0LjPJTQ2VN1qr62m?=
 =?us-ascii?Q?tN01BbYdRGCTTH4v2OcpIBmHd0hEOkZzMMlJue8D7S5TXP3mc/8l3pKBpVJ3?=
 =?us-ascii?Q?qCJcJUkr8is1GG2GKIKYJVf7pwcAm1b16XerjjIxMIyjEQWCRBeC6NHQiKng?=
 =?us-ascii?Q?3mzbdKyzUZv7TpnXa9n/yxO5C2VQZo5tmILDTDf4zZBcV7tXgLnTtZyWbAKe?=
 =?us-ascii?Q?9b5x9xdpUOgxdvpt8D05/sFkcsOcsypEpnfjAUEJww/qphs26wYitp8AwepS?=
 =?us-ascii?Q?bd3z3YCTq7gGTmzsO2Qs7mRaoVjwZqWk9S5/NF4HLMWxq8MhrF+TedrhEqy/?=
 =?us-ascii?Q?LQ39LcdOTyOdIOxgaJJ3KN/mYftBynmD/2s0XmAjAhq+zo0G5xgR2nELH1Hv?=
 =?us-ascii?Q?cp/uUoJuK+QKZ/HYnwJQlqrNIOoEDP19LW7TaFioR7afK7++QzHPnqzCjjGz?=
 =?us-ascii?Q?P4guMxlhEFsI2g9t9NNDksFj/xda+UgZTAjHEbdEvkAxyxMqDEhTAssKUk/r?=
 =?us-ascii?Q?hRDG0y9XF0UaduXrAJJgUTpQeELjj2MaPq66HoaVkrDN95Mo4wR+NOTt7KB/?=
 =?us-ascii?Q?4WdpWXm4dSgL7o8u55uFDAy+8JQBPwQAWZl9qdRxO/ZMXPmhot+pUk8B7yd5?=
 =?us-ascii?Q?Zuhrm9vOnyoBMSDW9Dx1wNO22zjc0Q/d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ea0s7BtSBj4PN3NItyoE49NnQKYWE9a9g/lINDgiQl1LdElTBEl0BICjlU8s?=
 =?us-ascii?Q?VGssTykFHouAyGMNVdX48aNeQUGHI4ZlRVvtJ7J7hCUoJwfKIo/Fr/ooHxrr?=
 =?us-ascii?Q?sIjL9dirVBFUvHXtqsBaPXIETxkgXV7xWGk7KcG1yeztYgEtrb+ng1U8r6je?=
 =?us-ascii?Q?fNmOEnTvIvwoQBWU8GESqMXDWhmV9MFJ5DbpUYePNuXWxXD/+TFB1bl32QPW?=
 =?us-ascii?Q?2IRW6suSnDVpDEvki+7c70atxi/1gKtLGQTClk5dffyLhW6Z8kIWNkbuyH4L?=
 =?us-ascii?Q?yePuYXtPp7Y7tDnL37YoriyMji/5s1wSw/e41V0YVDhkPXOHWRUBntOybMKO?=
 =?us-ascii?Q?erduL6WJdCg81Jx/Y4SoPqDHsaCfGOJ0NOMo/Rvu/80gubeWaMfDGfxpB7Jj?=
 =?us-ascii?Q?aeTylIJZy9gC8aLoO2FcdMELkLqafq5ZqIhJmvsYCejjJj2Hg2M3SiTQkvgK?=
 =?us-ascii?Q?4dII3M0bFZlrS8hwbX3IYE4N0hiL4sRpgNU6aFO21ZPlgF6Bgh0j2+KovLL/?=
 =?us-ascii?Q?0+pecIO5bCLyT/R5NmepvrKJ/pUIs4+spa7hpLiqcohinz/1TKUhNoV+5tIL?=
 =?us-ascii?Q?0R//OnLgFcWj7y6vBBCSgMAv+9f+CpzEnpZ6GZxagv+VQHDSFJ7SPbMXtMfO?=
 =?us-ascii?Q?jnmhA3xMuF+yrOUVWe4ewgHvf3ZyFw11ZXxHoHhV3BGsUqpkUsz82jdvFdiX?=
 =?us-ascii?Q?PivqSL5G0NVN55HJg0YUWI9E0sdhDwXXX6lfi0spPvfrAJujsP8VF4T94Ybf?=
 =?us-ascii?Q?Oo5s3tkZcwNBk9/UArdIHHgX5jLyHt8bgrg0nb2ZwVdqeFgjtMxwxd4F6RFO?=
 =?us-ascii?Q?UjSFtoSa5ldobtgUM4zGp0phdwt+GmB+DnxyBVt2JCvggVatM0wWqDCV2AzV?=
 =?us-ascii?Q?6TPxFvM6KLQrE4eB8xR3k2Xnyfz6DCveIFBrZzoCtg/fwecC1YSRsglbrFRf?=
 =?us-ascii?Q?xmyMPVGYxtQSAFcSskjEI1wmwnc/Kw5MkRcmqGsvzaBt59FR2uZWRBluBe3V?=
 =?us-ascii?Q?T+YyY5bdYFZl+713zl+tAl1RNfENzRpKpKvYqMjiA7Xb5VtzabYOoGBhYRJ8?=
 =?us-ascii?Q?B1aK5dIl5SNKvUf+8SMPXsWWPNg95fQgJQb4HGMER6tBPpQXC5Pn1tEoa4xL?=
 =?us-ascii?Q?RMdyyfdzKADuwOR49GttfBfCH0B2H6ZIiqwaZANTVAcIbdfgaVmg1m51+OEC?=
 =?us-ascii?Q?2EVmHXBOwAQOsAFhCAuGeo2AorugNXRhK+s/VMmIREu7J3Ce/nEAayRPoCzk?=
 =?us-ascii?Q?2u1Dp61RlsCpFv0YCEZFRR4y+PrEE8F7vKZAu/sH/NZqGaW4EZmNgFWMZDch?=
 =?us-ascii?Q?91FbViMbxhaHIhhsclMXi77LDKNxuoPU2wEX/OVfJvRf7UYZy26tqcH1g9RQ?=
 =?us-ascii?Q?m4Eu5CdxnxHTrfwIVJsmRn5Jf0HJLcq73oNnye51LWxI3GLHEJNkkUZu0MDE?=
 =?us-ascii?Q?i9X29qCqn62y2M6aYvH1FcKO0vW0a9/ycokwHie5U28X9vzUKpcvSqMhP4rd?=
 =?us-ascii?Q?TGcPOn00Z8ea2d/hHoiP5Lma2VXGM0Az12f3Fq/YvDcteSweWOhaDXvJshKb?=
 =?us-ascii?Q?Y1ElNK/q3lYhKPC5dlgJcVH53H5soWiuzdKHMkOBPbkdEg9oVpsvFSKPU07t?=
 =?us-ascii?Q?tg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297ab52b-fbd6-4ff5-3240-08dd1e567cdd
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 04:51:36.8406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HV/yAN27QqJ6b7g/3wSmtS0y1FszO8NZvmLrkZ6MBGbDids2FbUwmzoCOHzC9pIHEtSLoMpRaDFFp1iBWMB0l3QAvkyOon38f7clFIP/S+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1872

While seeking, driver calls flush command. Before flush command is sent to
VPU, driver should handle display buffer flags and should get all decoded
information from VPU if VCORE is running.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c  | 17 ++++++++++++++++-
 .../platform/chips-media/wave5/wave5-vpuapi.c   | 10 ++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index d3ff420c52ce..882d5539630f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1369,6 +1369,16 @@ static int streamoff_output(struct vb2_queue *q)
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 	dma_addr_t new_rd_ptr;
+	struct dec_output_info dec_info;
+	unsigned int i;
+
+	for (i = 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
+		ret = wave5_vpu_dec_set_disp_flag(inst, i);
+		if (ret)
+			dev_dbg(inst->dev->dev,
+				"%s: Setting display flag of buf index: %u, fail: %d\n",
+				__func__, i, ret);
+	}
 
 	while ((buf = v4l2_m2m_src_buf_remove(m2m_ctx))) {
 		dev_dbg(inst->dev->dev, "%s: (Multiplanar) buf type %4u | index %4u\n",
@@ -1376,6 +1386,11 @@ static int streamoff_output(struct vb2_queue *q)
 		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
 	}
 
+	while (wave5_vpu_dec_get_output_info(inst, &dec_info) == 0) {
+		if (dec_info.index_frame_display >= 0)
+			wave5_vpu_dec_set_disp_flag(inst, dec_info.index_frame_display);
+	}
+
 	ret = wave5_vpu_flush_instance(inst);
 	if (ret)
 		return ret;
@@ -1459,7 +1474,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 			break;
 
 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
-			dev_dbg(inst->dev->dev, "Getting decoding results from fw, fail\n");
+			dev_dbg(inst->dev->dev, "there is no output info\n");
 	}
 
 	v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e16b990041c2..e5e879a13e8b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -75,6 +75,16 @@ int wave5_vpu_flush_instance(struct vpu_instance *inst)
 				 inst->type == VPU_INST_TYPE_DEC ? "DECODER" : "ENCODER", inst->id);
 			mutex_unlock(&inst->dev->hw_lock);
 			return -ETIMEDOUT;
+		} else if (ret == -EBUSY) {
+			struct dec_output_info dec_info;
+
+			mutex_unlock(&inst->dev->hw_lock);
+			wave5_vpu_dec_get_output_info(inst, &dec_info);
+			ret = mutex_lock_interruptible(&inst->dev->hw_lock);
+			if (ret)
+				return ret;
+			if (dec_info.index_frame_display > 0)
+				wave5_vpu_dec_set_disp_flag(inst, dec_info.index_frame_display);
 		}
 	} while (ret != 0);
 	mutex_unlock(&inst->dev->hw_lock);
-- 
2.43.0


