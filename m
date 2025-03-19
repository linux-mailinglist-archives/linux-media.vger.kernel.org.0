Return-Path: <linux-media+bounces-28453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7CBA683FB
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 04:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CFA2189AC5D
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 03:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1BD2144D4;
	Wed, 19 Mar 2025 03:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="JGO8mIMP"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022108.outbound.protection.outlook.com [40.107.43.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4CD24EF74;
	Wed, 19 Mar 2025 03:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742356253; cv=fail; b=rJwLWK9zDnTkEkkZq3AjheEleavtkfTNAMmNLlHtmGUQPmmWtH55FFLrv5ECgS1qT3rj1TBn7hz2XPoFW2Ecbj53C+PDhG4jyDGDo0n4xNGolyHcmQuVIX+LdiTrsx8ggEy7QTG/wFDYAfwn0Remqsvq61mXJ9N0vCUp0ccpPeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742356253; c=relaxed/simple;
	bh=0wpiRU4g35XyqLsrD7lYpNfV6QpZ98dcHP1DQJWv1tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aLTcule8pCxCB3iw8tZJu3UOuGIoe8lulU2rdUvPqmdqpizRlCQqVm7SKaWQzqRgaIoMBtwLHlJGPDFiS4Nh+a+tZDZxh1ogYzE96gSpsdYL+WGKgIB/vnrBTVH1rcoU26RYwn9NcHPmqjOa8iu0lrIRVQJwqdF/9m68eqL8RkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=JGO8mIMP; arc=fail smtp.client-ip=40.107.43.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFDJc7iIBxXjQTK1NbXl/qdM/LipU6hJs3tpU5py36RpWI/fI275RttxUV2Uk1S0I6IwCu3KwNkDUZsrvmWEx8TjrBtxS9NnzGc+TpQWAHUqOAQmz2moVbWIuy6BOr6HvhVSinFnzxLw3bzzT0KwVkCV6/o3fXMa5XAgMxq660sskYLURYH4KwYYT8GX19rJHKXzQJY5TSo9knkFRoTKRFmBQmeUX6I9uXiNwdJ/3JN3cDIjwM+ljoW7jOtpiVF4VVrW2s86fXuTp9LfAMa4Ed0DK7JdzrbGM8BChhM3XGn8491U1kxqYBY+C1/y3fcs95A7F074wsQzU96JBTn9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rl/CRTQCiOJ2PRwkrhO17DtPxSJLPNq6JXLj5I1yjws=;
 b=MxjM52eNx+c6jYIw9HiZ5nYxLOQGUrcjE9rYO/n7d6FXU/TarmqSDXSq/0UcBV+JidgYfO/6l8qXQvlYehJ/YcwhhjPXDnoApQ0HGwgdnA3QIcaf97437BMXYvI1avgI3qgPVFjx4EBCsKxxuMbB/6rx7DtIZFI9Z/D9OHE+QKI+6pbwc5m29MJZxSrAF0NvK7ImEJpPkJYbYPSzAbBWxJnYT+NKCIh7vAyrg+cYk9lg8eBePNKG03RDaMjn5sJRCpXRoVOqmV16ZTbfv+zy15ZE48cdzA7rkyMhHzPapg2reBNmiitzTgvJbCEwUiGxE+9Souy62ZUZdYwa74d2KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl/CRTQCiOJ2PRwkrhO17DtPxSJLPNq6JXLj5I1yjws=;
 b=JGO8mIMPvIJPVzuZzDHs/DD+re9qqk7naThBV+xCYAaaXvpOZ8tP0QVfD/pAKc43H6GIF7dYk6kIEI3ulCUE5f+umDyyIcjG8VNcRKKDuZ4/8PDmA/XfM0JBygkTHKz4+1ayXegmOtJT96TzBANPOo3Hs+G7C/KfWIZwPMGaMfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB2051.KORP216.PROD.OUTLOOK.COM (2603:1096:301:130::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Wed, 19 Mar 2025 03:50:43 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 03:50:43 +0000
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
Subject: [RESEND PATCH v0 2/3] media: chips-media: wave5: Reduce high CPU load
Date: Wed, 19 Mar 2025 12:50:33 +0900
Message-Id: <20250319035034.111-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
References: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0085.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB2051:EE_
X-MS-Office365-Filtering-Correlation-Id: abca870c-93e5-41ed-dc5f-08dd6699392c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2zBfG7psPnL8XXhHKpQDj857Y+0iddUSHG/jI0gv5OHlb1Cj5vm+GjFypK6f?=
 =?us-ascii?Q?f2hKKjBT9k9ibXnkDC/5HID2YGyFj33irbLHpn7BYNj+YdogHVDsspg2tpKB?=
 =?us-ascii?Q?4CokfRlb6t5u8hTIRhPY4URbyLnGvq3VQQCCBIqSvATtfl8GrUNb9oi4dVSg?=
 =?us-ascii?Q?yLYM+2CE7nb2akrNUnYzA2h2r7+eh/QkONX+AV26KkMynLxiwp6wt/G8DQE8?=
 =?us-ascii?Q?kwD6yH0YBIViLw/UV7wvQ3leyQwRrRLhkfma8+czRMqrtEM//GEFQ++5h29R?=
 =?us-ascii?Q?7xdkSgn4uQZSnJgwRfor8XHT0URtr7wJGfohRmEl1pZszKV2RTwPZZ/iMKz+?=
 =?us-ascii?Q?SswYVkRelKdD5MVzi86gWDdV7lrlP/GV4tzy2BwwfAI/tehPOe7C9GBwBpfR?=
 =?us-ascii?Q?zbNikZDP+KsML9BJa0+f9WfnBRTkwcmGm+3PgeR1rghPKm2SPHvZyFjkJT1i?=
 =?us-ascii?Q?pIHAEQuWoyyI8qxvI9BGKT6u9xdaT01WKmLWztAcctldMnN8d0nokGmYxt1V?=
 =?us-ascii?Q?CPEU4w2TfJh2bKp/L0CyHAzBB+N89xugMq4WWPKX0xqOHUd+V9EuJu8yVZCC?=
 =?us-ascii?Q?ZM5c4wpchD6TG4+x1po/q+CT3NppYEvHajiegs+mTVhq6ObXGwQihHyOB37e?=
 =?us-ascii?Q?kEuLiNv+i/chMzaZzyoVDqURrluLg+OkKuh6izr8OpiFXV/hp83Ue5Nopca+?=
 =?us-ascii?Q?5uXTz/JBXl6kh+ur7UmqbwcnH0GXqnDuxbIVDIpm8J4qWaXfnmM0slcoOK6R?=
 =?us-ascii?Q?zJMXf5TLawGwAgZC/EEE3QiN+mDUn1ia4mwAyLkE/DUAz3HI8T/do0cgRBUV?=
 =?us-ascii?Q?y1KtPpTN/Wl64ieUePlPf2h5vid9H+IvdV+aGNHSFvTnDCkp9ipk3gdjeOfZ?=
 =?us-ascii?Q?Fx+EwnjU2JNoIQQ0i+0DXHxbu1FUaH55Bnh+DWaplUhFlYV9bwRrH9bzxcPn?=
 =?us-ascii?Q?BXcQFMlfDZP7ikc5FFEPOoSX7G3rjXfLO6h15G3UoU/9+gZdHPz0Qa5L5H9v?=
 =?us-ascii?Q?Z+8Ud3CkNBtacKyvzCu0M23q5A6OeqktoexxucLYKODQQ1zZElkgT4gsmjkS?=
 =?us-ascii?Q?SsY3PTm3LdculSYXEzoRsezLc5VeIN+vNUFQqi0hoD2fOSmAHsPnjE62ptzv?=
 =?us-ascii?Q?OD5WHPntGlX/NBlpImcjgWvZ8CtTiRG4L/7JGK0Vz6oFg2r2Oz7q16jGdGC+?=
 =?us-ascii?Q?mxlmJ//BPbpZUZoCNYlHF0ziSOEoBFUuynwN68UwG7XASfhXd+BvU7C1gTN5?=
 =?us-ascii?Q?hOKJHt1e/DIY6SlGPB9XGglFTPcR5A53DDRexJFSmCL+5iOF7ZRQnJF3DXb/?=
 =?us-ascii?Q?PtWkeOaA8W2QQ4xiWCuF0gMnjUS0k0IDugQMuFfFfRonTShwCaFQ3WuglGY2?=
 =?us-ascii?Q?n5C0bTpTZZA7k+aV0uA+yEsWs1RZAxujk8l5ERawOFQlCdAsFcB82Z0X52Ar?=
 =?us-ascii?Q?y6h5GFv2WvHDKGSu6jolAzwh4dejzABX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y+uao13z7Tsph4FrzAatIz+9XI9r3Aym2O1FPyI9zbjz21YkwOeJ5/aPuBT4?=
 =?us-ascii?Q?oJ0NkYWNpMGgvL8Ah0SKLC1UpP7qfCL1dJJqlaC5Ux/OvNQ2B9ocJq6gl3MA?=
 =?us-ascii?Q?PeUUz5ifmPtBN6hFAN3apnDQJBH/ME7p274Ug7lG53yOTTevY9tGP9cYG9zI?=
 =?us-ascii?Q?6YjTNdhtLnd+T4BQUCMnQSKKThhu2ZJtz8aYlmmyWaZrzVgRKAN+aNm3eqHK?=
 =?us-ascii?Q?tugrcY0XZPaJ0oZYMWd2sjKQw7QG6T45+KAl7Yw4t5XyR81vSeltzxOLZX+6?=
 =?us-ascii?Q?ZkMSDWUnK9cY5EXcLCkbCv6yHpX3AXipI9M9kVrtyzPuDINkNvoi/4GFs8Et?=
 =?us-ascii?Q?jKYiKYOW4HoeoiMPXT7y6wfs94Sfh7RxO0RGk9ksVz1OO81QTQ8rtIIpDVxn?=
 =?us-ascii?Q?v5lf+Q7zZKRD3+nDBuRgOYXMROpZ062r/wqnoIw+kt2oh2fTyEQpcgJDSara?=
 =?us-ascii?Q?HIGwLbGexolhb8GJUT/TLvaBkkBMaUf0B4tuWq1Wz8nwhxgJJvonESVLj4YH?=
 =?us-ascii?Q?LkSjJdBzp09LcP4UEQaBb+j8qVeyIzAx8Efn0gajfzKaDZiO+tFHvCloFl+P?=
 =?us-ascii?Q?DjWjUTH6N+MlrOaVUKTJDefIqq8nNVr4C9b2tTEpLoX7rqJ84H08f9VC8WBY?=
 =?us-ascii?Q?+g6zIbLCZkCJ3hwxHx35b4q8Jc6r8SqMKT9rBb/A7hvWAfU96aiIbpJP1Nkx?=
 =?us-ascii?Q?q9LPwsP9NlUBMqj+JehEUAO/NLoMTnScXzvFKDy4ZS07H6h1cOpIT1JtzSsK?=
 =?us-ascii?Q?xfFPIshgDHJvB+xZnQQ7dLeK3J0mK7dYTqyLwKH5ax1PyumDFyCklFE6wlMZ?=
 =?us-ascii?Q?9cXNHAK9lvYCDfivNvKvXefmhL0KlILouBIQYojU/y07uhc1MnjkMrkB/6ML?=
 =?us-ascii?Q?XKANJwGWX4fSxZUFddYQa3ACGK+qLkdqC4CVP1PGIDEHapv4NxmQSKDWjpb6?=
 =?us-ascii?Q?kgB04dICSxjewK7BbkhXGBxSsL57pc5Fpp1FUpJmHC1h8IlSzpywjlhgejCF?=
 =?us-ascii?Q?iin4JsPAZ2nuYJ19N902ojMMsf1FTJ7Bao7oQyyXYqttIX2Kc/7UurdCU43O?=
 =?us-ascii?Q?bESx41AS3+0Je0r9YY6vGEgrajXV+/Rr/3NUFyc86pf9ybRIpKZkTAAvmqaS?=
 =?us-ascii?Q?1xKUeCL9mF7vwx4juV8uiRzJ9QaaFqTo414s6FPsq0EwegwELB7Y62TSLsYE?=
 =?us-ascii?Q?r21OmbUjhUqjWeq7oUws0RTwL6A5Bf7wFONSl3ImN4IU70zymyBjUHH3FX/y?=
 =?us-ascii?Q?0fnQym+VkCMRge8qU2ITcbyIsjHlLDhxAGyWoL/fq+is2IZGPmwb/5cD6bBq?=
 =?us-ascii?Q?sZPDkt9NV/MwTWqJ+8+QjH6dbmYAsuze1xqIl3Pl3OUTmYoShw4z69qxSxcY?=
 =?us-ascii?Q?0jH6cxAXyAm9KYUzZMMbikxL18j1FN6IBLaFFINjwxGkW78A8HYEKiMUs9yz?=
 =?us-ascii?Q?moORP77LQ08vaK5D2s6GYRWA+bzjnlk+co7uKJr7Us0gdqAqH77gp3xk/zGx?=
 =?us-ascii?Q?OoFolLExF/abTJzLIxVO4SiMus2WsrTlDZe8nqWtfFZHzusp43f7mvMXTclF?=
 =?us-ascii?Q?hylpLUQmnLYx9Mb7SCx+4ocNTTrDv+FCHQjDKRQ9DnmIHGPFstZZX4mU0KVv?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abca870c-93e5-41ed-dc5f-08dd6699392c
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 03:50:43.4091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NK8/jeclcXUTh9CJuw41yPlxEgW43Ajwbb/P8eHzlb1lnEomVSXVHfaaKvlBhY0tSdYgR8N0f3CgMR7xW4T08I7T5A3rvggoqXQhaE1HCiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2051

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Since applying changes for performance improvement of decoder,
there was a problem related to high CPU load.
CPU load was more than 4 times when comparing CPU load.
The root cause was the device_run was called many times even if
there was no bitstream which should be queued.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave5/wave5-vpu-dec.c | 12 +++++++++---
 .../media/platform/chips-media/wave5/wave5-vpuapi.h  |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index cc47da509703..5ba3aaba24ce 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1313,10 +1313,13 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
 		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
 		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
 
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (inst->empty_queue)
+			inst->empty_queue = false;
 		wave5_vpu_dec_buf_queue_src(vb);
-	else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+	} else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		wave5_vpu_dec_buf_queue_dst(vb);
+	}
 }
 
 static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *inst)
@@ -1506,6 +1509,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
 	pm_runtime_resume_and_get(inst->dev->dev);
+	inst->empty_queue = false;
 
 	while (check_cmd) {
 		struct queue_status_info q_status;
@@ -1622,6 +1626,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 			   inst->queuing_num == 0 &&
 			   inst->state == VPU_INST_STATE_PIC_RUN) {
 			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
+			inst->empty_queue = true;
 			goto finish_job_and_return;
 		}
 	}
@@ -1764,7 +1769,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
 				"No capture buffer ready to decode!\n");
 			break;
 		} else if (!wave5_is_draining_or_eos(inst) &&
-			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
+			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
+			    inst->empty_queue)) {
 			dev_dbg(inst->dev->dev,
 				"No bitstream data to decode!\n");
 			break;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 6ca1ddc67c64..3f6e37b6be86 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -813,6 +813,7 @@ struct vpu_instance {
 	bool nv21;
 	bool eos;
 	bool retry;
+	bool empty_queue;
 	int queuing_num;
 	struct mutex feed_lock; /* lock for feeding bitstream buffers */
 	struct vpu_buf bitstream_vbuf;
-- 
2.43.0


