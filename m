Return-Path: <linux-media+bounces-28449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E92A682DD
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 02:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74AB93BF7F1
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 01:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9482524EA83;
	Wed, 19 Mar 2025 01:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="k1jcwc81"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021078.outbound.protection.outlook.com [40.107.42.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CA724EA82;
	Wed, 19 Mar 2025 01:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742348751; cv=fail; b=W8Fdq+sxAWuHjWP8HvPKF6x9BGPJCGGOv/kzps2PmWpo/AQgET0F55cujxj/dV7T9PVbQgtEbFqRpN4LNPkxFu7qvue1xwOjRXQVUQ9YWxE5Wdw9Ogvs8XIm31aqXSz7oYMUbeKTU33RksdR3qxzAPYaKQyb+x2biwbCXFfv1RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742348751; c=relaxed/simple;
	bh=gFPI1+c+pPnicLfogiMtWOQlMcMaJdNjN8uS7QbNjSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CrBQHRPpR1rJx2eWTqHdzkSUaEKrk+hkZptZgr3L5nMga2kIdccj+d6nR0dkVTiO9AtJIA7/H9OfauBr3dX15P5Kdhd17ipG6YkNTAVStjH2tphp90Y6d8EhC2ak9GdYZSsBQcK3cvN9sqWO0WaQVky4UBKfBYXoc/MNpSkg4lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=k1jcwc81; arc=fail smtp.client-ip=40.107.42.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnzeF6cZnPqcI2pactJOOM32kMIHW3A2N8Lq34RzMu4vfzfvZQ+MhjrNnuNMWmmqx0uMYTLCf62aSrMGwpXHNxspwPacojb1BMqszsXKf/GT24y8rGrQrBJhrd8AnHhziwUso6+jkNigUHCZ2BC8tTjWE23RnTR7U+kZHBXqLD+lfmb97Y0TIcemTIpk+Sgv+cPIp8VknbTcQIXuHOvQo9RZbgdm+LQR675i/5EpMdfO7K/5h0kTWxX05FXsi0TkmAiqGHgaH7IxMcyLlZbGV4TBKH/GedKF4sltDccdbGzr2NI/RYJcRDj4fcjLj8OCCPpH9f1CD510RWw+TRHNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1I0fvz6mUcsze7UhBn8G5wxkGH5a+huHPuv0QBL0Ts=;
 b=HZrsLhAgzfLqCM3jOdkFtwmhcPBwCUwkjZcYNEQpAGGQtlUXMEN8vbbmcPgH16dZyS0ENrpawyNoVKLX7eQqiO6TVGfRwvNcsGDvaoTHn/pnXFgAOYwN9hOqH1UkHgj46pu3FEmCYEwGAwZuUZNfZVGsOR5IYys+sD/HLoqpAuq2+Siz1t+tH7ao5+rjdiIe6/m/wU2a3RKMWtMWca6GNwcdIR0BTC1PNdtoCzIvuezHedyLBdayAGlaO0O+iaq32Z3R3K/A6keVb3nT0THMktYfUZhkzh39+s0cPQ4PfJ8e+NcjzQ092QYhCESxBWCeLcyRhFF8bcS+usHNWaqd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1I0fvz6mUcsze7UhBn8G5wxkGH5a+huHPuv0QBL0Ts=;
 b=k1jcwc81DIVcc84w+UquorM6vwSGBvzAN36j8w/2/I0vMRTchjpGO9IIILNfGX7uOYDnKAFRFu7thi9qhAsgdiuogDDJEPraAp/qvWfd450fzLswueMSsCl7qv1G4mh5/L29Z+bUNbJYnAy/ZxIFrfv7HaSI2wc4Ys3CobF1KA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2121.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Wed, 19 Mar 2025 01:45:40 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 01:45:40 +0000
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
Subject: [PATCH v0 2/3] media: chips-media: wave5: Reduce high CPU load
Date: Wed, 19 Mar 2025 10:45:29 +0900
Message-Id: <20250319014530.61-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319014530.61-1-jackson.lee@chipsnmedia.com>
References: <20250319014530.61-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB2121:EE_
X-MS-Office365-Filtering-Correlation-Id: 508c0211-6849-4909-0d11-08dd6687c15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?akrx0NUWwnvtSU80iy7o54Pvoi++L9Cuwb//84ECVhfW3jZlp49yZnjBcZ0d?=
 =?us-ascii?Q?OsWJSFmKdLkEFcKDjdav0RWdyT96gFpwjEKMoMMh3qRLZjmiEQj/z+UEGLVl?=
 =?us-ascii?Q?NLD+UnUh3k759FCdxJtfZCew5R3EFjwvlhVnNGkxOjqA3d7HsLB87beVa7iV?=
 =?us-ascii?Q?o3cSMWRawBEVal1q0fYvrQ2qVPfaNrZYhAkVYOXTxVu2JaBnRuK2cfuVgJ+2?=
 =?us-ascii?Q?Aw5atlToXi4EPzVyipxpD7xARYUh2ip4o4zzHSQqbRjmKMVgwl/ppe55mF4J?=
 =?us-ascii?Q?Z+ZIJnKkUODbCJzxOShCFdOZxnN4O2RjC194ISRsSjAx3r6R7bOZA0ORHNKR?=
 =?us-ascii?Q?nwAwLa6UlGKrsahBRKxEbiIR/gZ22NO/IDHEZ7yPyFVIACiTV2lMkktwFSBg?=
 =?us-ascii?Q?Wvr6GLQHT0bHvNiGpyZSxQJYoNj9OD7OAPi3Zy4PVi2HFMT+iD6TJZYoJEj0?=
 =?us-ascii?Q?qszZykHCepDx+EFOq+5qYYqtcDoBSD9w4MKUtV1GhM3U+UGmrB+9licxLdUi?=
 =?us-ascii?Q?hk9D7jMDAhv1NWsoEc5V2fh71QOX/w3Ch72BGMyYXsSS1RT27aiTRJ6kJB03?=
 =?us-ascii?Q?3SIJLHhbRpy/oeCiYpmc4BSwiYw1fkWDtpSzAYMPyriAkwQW1I5XKQ14Dyaq?=
 =?us-ascii?Q?aZKXZy1pTvT7rNRjFx+5M9esjqd/lsl6dnYKZUJv5K2UQC0YjkdXELwxkwdI?=
 =?us-ascii?Q?ZEJRgKJpDjINVZnIvEGnO5aatVnq5CJLvm59o5hyi1dFs/SJY6pLmwtAAzA7?=
 =?us-ascii?Q?T+gJSNSTFmRkhS8RgV6hNmSl4Dn1clb1URAhjfP6h0XBg50UNOQ3/+DhHlxD?=
 =?us-ascii?Q?J1eV6hAcQrAmkO4DN0M6I567+/xHjQzaR7J0g+ZEuVAiBoAmMjsemFVfcw0u?=
 =?us-ascii?Q?4K2AI/UzCZ9MNaApBeN3M8ZFuatMAh0LRyB1mxtCQZ0Y/m5EMwuMGK4lE1Jb?=
 =?us-ascii?Q?qSxWFeUksfGBTew6v0rV+5GxCWlGdpz/kK3gHnWFDDkU5gzc2/zCgoeBY6pt?=
 =?us-ascii?Q?kkhYXVqvYX5SxPvGX9XbII1UMRM99GNovNBL7SYYgrQxNqp22W4LBczsHVQp?=
 =?us-ascii?Q?3LrrNszMVf5Aw38gHR/8glQ5nfQYdFWV1cCcg3V7d/A8Vyos2JB/LMpL68zX?=
 =?us-ascii?Q?cBFIaBHuv0jACrHlMe/rUlJ/+1gdcYJbJTOsfOzCu51NiQPbK7KNe3weIjyU?=
 =?us-ascii?Q?4LiZzEOGxH+oOe/FyuZzbqwWtafhB8Mxcf8c4l1tvlYkeVoNXCsuRNQKhAp+?=
 =?us-ascii?Q?5dwLszTsz+jswOMhH8hDye4f7EunBKoUJL1Wop586EmnR6LiZphMgUHltfyk?=
 =?us-ascii?Q?hUuNoNnATQIuUDzoset0kwXzZheD88jDTUr4YlgIdD9QZTd6rmBxOhnCGNXt?=
 =?us-ascii?Q?+RNeU6qLNyEL2NgX5bfjnm7Q5bA41Wyi+xrlrIiVhhLAqZ/Jg0mRpfe6cPHG?=
 =?us-ascii?Q?SC8/CMbkbcAlPvSEj4FEV4eOtAirBfQI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6eBfXKtDFnq2C9JXrSpUxFUCUtL34hg995xx0pySeoMBH2QIOeGVw5FOAyzN?=
 =?us-ascii?Q?nfjVJi4AjYhpiX3baFsiX7kLze5cda9U1uepLRNc8Oqet0D4XVLjVyTeV9kH?=
 =?us-ascii?Q?hlsWb0wfk2wydQRkG8Fn+wSn9g8gZmsekiVgMhNmtfx/hajRuRhrVeBJmASh?=
 =?us-ascii?Q?Hwkfjgd8H46TBzWtK1FslN+rq5LjTL1Sz7BIeUupCZJLdm7Ni/kX8LTuzeDv?=
 =?us-ascii?Q?cqy4BuI7Mw8MbpDvIyJHXeXj76NURlK3wweQhsd+nXQd8lMztygW2PpyD1T1?=
 =?us-ascii?Q?F+wGq5pK8rRdmqW2yrNaE1jYymUggBKoqH/bwjVKnUd1oczSmERqnTDyICgF?=
 =?us-ascii?Q?XYzYtCBPq2oJop9wlqMVQTHPgfXvUoEgVjVyJqhRoB+a/4zWftXp/hWKJrex?=
 =?us-ascii?Q?OMsBSMWum8BYYwkqd0Dlx7b9ywzFU8kZSYZgKLj3CqMh118onOkoWJz+A0UW?=
 =?us-ascii?Q?1fELvdny2ghQuHnua1WSj1xoFdvntBGQWy1uMPGPce9tpMLkNiotOGs4YcwZ?=
 =?us-ascii?Q?2nA5R6Q0urAON/MGrychw4ZPxzHebZE3cG804O0zlsqwMBNWk0ktYH4HtaPO?=
 =?us-ascii?Q?/7+S25azAa6468ICPuBrBoqkFWXoX2lkw78SHi9zplarDiIAl7U2CYxQuaSs?=
 =?us-ascii?Q?s3FX5fYImS10m1qpp8elQIpyC1N8HLSl+ecUyAJ0a9WSzrr/zCmzxjsThQhD?=
 =?us-ascii?Q?Rjvq6CpuPEWyeB0ceSFn89b4ou3okFTyE+DsIbe6VgAilwtJcCsb/KqyTrNK?=
 =?us-ascii?Q?ABpZ9v3NOtOh28lYmWD49yI4rfcmT13a8Zz7c1ip7jouZxSCT5/ckAR8dAPs?=
 =?us-ascii?Q?ZWLLBWEZge25CujkopaD26EktCMbui7oQs7nOxJP1Z/JXer7kPomxZZY6d5Y?=
 =?us-ascii?Q?IY4tY6s1LBp2VekIolmHd7Mm25lWOpGASLQkNCNz31FAlj9ObGXiCKNjp/Qd?=
 =?us-ascii?Q?xDoOUI3yA60+I9auTDRy7XRckhsfUVLfWyP/R/VvUxoQ308ZFGSQyHufgf3U?=
 =?us-ascii?Q?wFj1ogG35krCkCbzeRaAlD+Ap8mA5RafeHTCKxCvsN01z9WyO7oBwry1NuwU?=
 =?us-ascii?Q?I09aND0JolJtaZ4jfwbSc6puJRfUj8izSJOOcJdiAEpafOCPRJW1CsX6AE92?=
 =?us-ascii?Q?iDYCvmEfCSGehJmWfAtlVEDbHxdFVaoOtdI+wKyBiu/mQ5rEuphEUvhcFMFW?=
 =?us-ascii?Q?z65PFPA9fYnauqVuRKmGZth4vKCy5GRgBwI7kra0lzuBDm3438QshbGYzlzs?=
 =?us-ascii?Q?wcHwJyLTtG/S9GORK/zpQ4zPs3hEuMEzIXXiwKHhgj0w0WCLUPVG6nwLO8g1?=
 =?us-ascii?Q?GXUhbBTH6ZGmSVjbDL5au4B0rkcpY0qPZ2+ykVX+SmGJK262v0hhOU6osS8v?=
 =?us-ascii?Q?k90vadysxvzZp92L0DXqb9EQnreCA0pdzrxvEI2mYCU3gRBxPpavhatJV260?=
 =?us-ascii?Q?f1e5TfR5BIkTXr5d5MUe779RDXD8xF8EQWrKHDD0dP+ECTvmWQDbCMxacXQp?=
 =?us-ascii?Q?qAmq/ViNN74pO0haqTG7bxAeUETpS1Gtf1XPPPK2G8F8msE1e837zy8Ho4Jz?=
 =?us-ascii?Q?TKlmZTTKDhiOIpFvfyl/sUWrdqgRZxhG2Qkfj9olN5vUC9Pdmy7Xx1mdlOgt?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508c0211-6849-4909-0d11-08dd6687c15f
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 01:45:40.8694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snh2EjWqegRxTC4fvfw6pMlhN9Yv8ctbWouyw4jVAMs703AgyUy+WvY3SnH3RmXKa4IvKZK382gxlYag+wIntyfS24u3Qs0VAahqcPf/qf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2121

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
index 5975cafefb6c..8349b37d0106 100644
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


