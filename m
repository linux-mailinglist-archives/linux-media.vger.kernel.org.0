Return-Path: <linux-media+bounces-33082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69834AC05AF
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 09:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D1619E426B
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 07:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF2B221DB3;
	Thu, 22 May 2025 07:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="afKRxxw0"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022104.outbound.protection.outlook.com [40.107.43.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776D7223DFA;
	Thu, 22 May 2025 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898789; cv=fail; b=sl24FPVeokpNbzOp5PGH/MXvlukPdy4qwWrMTpkcR5Ys3eOmVt0U4xzWIh8UKh95gnSFgTyj5JQ21UF+H4FYHNEs8oRe70VhCsPAaFMlZ7TapKd9kpqz/TbTQ9Bsa6vPiKND9viF5iJqdaegLn+JCph61K4APEl+Y4ERJArFhpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898789; c=relaxed/simple;
	bh=bZU4WEzGRVV5IydsLg4y/+Yvw8vHU9q2leiLFJpmpjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i4KPtpV/IPloIYahqpYrWzDoLLHtYGWgJzR2Qmh+wFDVB91vAEEsENOVLbHreGRw9Xb1W0fOtmH/kF6SftcLuxzZRnjucvPCN1VRDQKWsVHrjmj44uXVYOSgc2csjXzt2OzNzua8MNaMOuV5Y3Ip+BamckwFWRikPKf0qy6/lc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=afKRxxw0; arc=fail smtp.client-ip=40.107.43.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpJowXMom/ePERk6r4YQVBU7gnlukJNa6XgAJjiN1kcfF+lM82Y2+znjuo7dso/3dDpK6bQYsq4Qat7u5eB6jjsMvI1BY6aQnv7e8TVdl2CV1Fze51fznJ0r0Q2clmoCiJQ6Fig6L4QVpddsaz27ikORnDw8Moo164GsgpkrQM7cxTBDVyN4ikWtwVTWqkjfVVoV7kzRmvDBnUM273EdkApXl6awAo/QeUuVWFNWP7jvMrHR2NnJGUZSrfsJplr6unGcOMGAFEYed6XhA/dU8MM/+8AxAfMOiGQaR/85APBpuA6SCH8oVlnLZFje5PkSEVRnwqKLSHz6tvMMXtz7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNaZndYNupfjW551Lz2PDnIu1fKUAKq+o+0kK8fywLA=;
 b=Auh2bqBV//RJ9weAyE/en/sUmBTBMuunMaBDKULFdICBintX1gtg4oCOtpxHQ/bOGkoh3q8bKXvCV4kFtFFFB5lf06ZPSzt6j0+B64GZKiiN/zTc5u4uxOx6hKQ3vZTgpJm7c3W/O+WCjwluSJcYsvS0x6skMWlYYf+YKWHBnEc6amflr+HfTkDrxqjgnO+gcBZTKW8xvAO+cOQXPkn8KNWMBS1KZ7hg4U5unQI4TXtP0v/d19DLnBSBACpKwGCSzbX6cIsQy+Kx46n9LddrZ2XYDv4Kq6uh6Rgdc045qoBqFBPhtQ/4xNZs6wAV8KH/p3qbeM1HPAzv0R4Mi08DWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNaZndYNupfjW551Lz2PDnIu1fKUAKq+o+0kK8fywLA=;
 b=afKRxxw0Lcpa7rKW/TDoAFd7mKrU0Nf3xg2TDc49Xwio+Po9ISKws+adOpW/z5Fzz0LWFSAsfDPufA3T8QGxSZv7o+ca7adHJ+Yy5+pw3frW9TJZ6sAtrmLzMQkznOV2m9Vm7S6qnsghC6foQ454zAf3uxQQQ7ujj0SNh3mzKKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PUYP216MB2872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.20; Thu, 22 May 2025 07:26:18 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:26:18 +0000
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
Subject: [PATCH v2 6/7] media: chips-media: wave5: Reduce high CPU load
Date: Thu, 22 May 2025 16:26:05 +0900
Message-Id: <20250522072606.51-7-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0071.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::13) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PUYP216MB2872:EE_
X-MS-Office365-Filtering-Correlation-Id: 698a7e40-d5c0-4c5e-920d-08dd9901f171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p1bwLz+toFC94RvrtpK9x6UwdzDxUU2zlKt06KZCXOWYos2a+gN4Iz27+R9F?=
 =?us-ascii?Q?w0bwrXn4dEmi/nfXO48inq+GxJfVlvjlglX26+VcjY6Wxzx8F60y3abyrl5j?=
 =?us-ascii?Q?4bdQH3Vg+Yj6PPWhNLZLrH+7gtIZl8faFuyn3i6pFqA9q2Lla1jycy/PGBMd?=
 =?us-ascii?Q?3mhxznBLAGHrJuQwpMaep3jPc7cwuU4wdh0kXj8SjBOa3ohmQuDw/udKv7u+?=
 =?us-ascii?Q?hoXZ5zsRMq7VUn243u83l4U4HqqtpEFrYziLV3VUhQNB0/rRg4cI2plbYziA?=
 =?us-ascii?Q?7XoPiNXLZlom9aP+lbeXxfYDC/MoEDdcOafXasN+x4qMlxqKKBiONMLkqXnp?=
 =?us-ascii?Q?eMGZ9bJ+PaUMK83Msv4xqrxdzQcvwZ6RPMgDOf5TcFF7aX4Mq+Vqu4y17zZA?=
 =?us-ascii?Q?yITvJ4yjwuVgC0WqyCOiLuiC2/z4bs9GEyf+dqg7/av8Oafrj0GspUOfnbHV?=
 =?us-ascii?Q?acRidfFPG8/jjR41J9JBrEm4N7YylKERQzR2WR9oPjiC/InCbY4D2Z5Ujpin?=
 =?us-ascii?Q?gSCkPve02ytmMlbUP2dZ6aXqtCrh6fWmWxKaJEkN3RkA1O8tG71qcYOL4u0f?=
 =?us-ascii?Q?ZRV7lPzw3VMH/TzZoISnnToEZewNxPgKKX3nr/VNfO/SBTKTC5BcnXCaufZz?=
 =?us-ascii?Q?06/nv0ySJThpHLn6Ap/SAQx+J83NYz/P92/mRvL5PpaILuoO22wTOp4nSDiH?=
 =?us-ascii?Q?42D3RL/UWigaO+KiD9/bbKPh3tRSTsy5V5TlYcvgLTBVR7XoLeXH7j5OFev5?=
 =?us-ascii?Q?xArfgHJsFTbXsT9nA15lOSLfOt46iKEelAqKQUmacxr2L34K8+C0zsHL5qNQ?=
 =?us-ascii?Q?Wltvm9/190NfJsB4oz7jkIaevM0t2tJLPBKgMi6j9ac9BT4Va6IF2J0WPYdK?=
 =?us-ascii?Q?n/G7VPIBro5UrZ2ZN7CHixj7zDFlvsJeq+IWibe/ksrAlWj8N0GrjqP15faP?=
 =?us-ascii?Q?F3izOQRib0SGlXklZ+Fee9EtJx2CM6O/5CAkw7WX4NPpL008KTxSLvPFFh6Q?=
 =?us-ascii?Q?5d3BNcBy8neXDeAh/tgSPtBBHS54zFsjD41b2BCz6n9sJjHXhQelB530suy2?=
 =?us-ascii?Q?MGeoGx2iYeDaZwW+TBI+967e9//qR6GU1piemOQRG903Za3fCKj8ezN/MVNf?=
 =?us-ascii?Q?aEsKIm2UeTeCHKBY0Ba/7KT2I3TV7tsKBD9A7knLh+q9dF3DCWbDpEEBHAa0?=
 =?us-ascii?Q?ys/14CEVvkhXY9UAsPqqK8q655gz7+sSQC7HX1PyO8iDwRqt8AUO/ur1QUhj?=
 =?us-ascii?Q?qWVLYK3SkcyLbHIBoOKF/liK9rEasxprC2us8yllNDT8eS1TcpAMo1G9oWVh?=
 =?us-ascii?Q?nKZQcurODXeId4G9g8zFBnXyaCb3MrxcFCHg4Af85BVr38c/ocFJZZTKLhZ/?=
 =?us-ascii?Q?NnK97QTYHWyg1zVZ+SG0HkQDNs+v7ydYCB+xszVg0EWmfpBXaQK4EG0jZ3Is?=
 =?us-ascii?Q?QOqGonGaLge6QPBA9NwMrFlO5n/c8c2aobyL+I767GVxrltw02rwww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jupV+mJTE1pvBoznKX7CnNEX/UcHIbuuX9acjUSxpBvtr3rN6Jvj0rNUiRaN?=
 =?us-ascii?Q?awxJfgY4cJZ5zk1ANNjcLqD1zBEAWvE5Kn0SwBqF93AHxL0BQ7eMj1Ah9Y5r?=
 =?us-ascii?Q?mJ22FT0NEb+eF40otDZFBzWGAHJVg5V02P4h+FyOJy4lk2U68QWHDbqIbz9/?=
 =?us-ascii?Q?0Ianl+MCJ+/N/rNHDOKEoZ1WGuWtcAxivlcGRWGFlXU1ChDqZmyBSAUfRmzE?=
 =?us-ascii?Q?GsvEG6HU8ORxEWpdbdOZVlOBXTVONpVKKx8nPCT3M2248UWRTDz6Pc0eaRd/?=
 =?us-ascii?Q?UnfyHrsDcY+gZ7b6JQOvcAbnOY2PLWmPn18mCS21rO2deTAulDUhMV/L8QC0?=
 =?us-ascii?Q?Fq7X83rjzt0Ddx4Gm9rw4pPpLdM74EakQI9K1SlLtGNaHDEgYLk0k6pt7xhr?=
 =?us-ascii?Q?eTZGLXw9CkCRVCKQA/qs0/ynKhKmp+mb3/17KLJYdNRSqxUFkkKC1PiKX6ZI?=
 =?us-ascii?Q?qYoqPInxBQGsz6DjKFUx/LLiLEuN1w765egDHpV+WY4VKkgA/0N7S4pCgAc2?=
 =?us-ascii?Q?yc+K3rMw9xG2J/iLOfEpNq9xT43r1z0KPPaicry61Zk/YcuLubaZVgSDlH1G?=
 =?us-ascii?Q?PoIvYD8ewA3n6x5jWuN1mOPZ0JBatem7CWT3hn52p2FeaBZqPC5zXbewKk/3?=
 =?us-ascii?Q?vRowSCkSqO7fs7H9Rlkc8PO35Fm9/Aw2zFMMFEX3EEHgavvPLGZTVlBkkYzQ?=
 =?us-ascii?Q?Qdqhj8+ler1bCfwt2ilAj+ZMQodG/xjx53qw5MweK6JYoXuib9mcxHU1+5Nc?=
 =?us-ascii?Q?RV5h246fZV7xDwgJ+TPB9WCqY/bE47wufO/M/6hWNZXAe0FLWItlidb3Lgxj?=
 =?us-ascii?Q?y6IfwYOUoiZhsK5OoN74zREz+OR8ytd8uwL6egTH5F/8q0Yg9DRM5It/TWC0?=
 =?us-ascii?Q?QAXxOarvxHMTX4Gm0bQb/w+KRnrSj0d8p7Hhn0pfYwr3HvbA+y/pZENboX7s?=
 =?us-ascii?Q?bHpHPBREKqVyXTlAXHrQlo5hm/XuGCcDiFQL7Z+rl/az0iO3o10zrXZSUtV/?=
 =?us-ascii?Q?DbPoONYKbd/rSOPA9+Y6ddRqR1oak/fzMum7nzP++Qy2dS0nLS2BSLrugXNf?=
 =?us-ascii?Q?n5jdYN/TwaRt8Z2YPOh3dPisyJdLQFnt9n+VBxE2+LRtPESYfiq4cgPcdZ0B?=
 =?us-ascii?Q?Rxs8W5rBI14RqIfyrMAeknGXhRvjNdI0haJ3WJOiLzGV1D0S51Rm0F6xXevW?=
 =?us-ascii?Q?klQP+2NvzBu8+ZP/LeNnBlUx8g3d9SrPtpn7MG6EAMJr1XKlAdgzEwVFBRIK?=
 =?us-ascii?Q?bzY4edfN9SDGf5bHnrNHoBdi9IQQjQtpCXqK4ggwRNbdxEadW3V8JgVgN7uh?=
 =?us-ascii?Q?28T9m2Ep3dAcHTvluITQZTF8Y8WBgjUwW9QLiOJk7Om7wwPMlHYX7Znk5EKX?=
 =?us-ascii?Q?I1ePQKYv0/ZIMziUjDRaabvxNug5yDQXxs/y2qD/9jftH/HEZ/hBei2P+RYF?=
 =?us-ascii?Q?2OcrKzNIpj+FbN+xJMAbLZiMrapcHwIrlIQHKR/Su4bUkw+vad91fi9iekh0?=
 =?us-ascii?Q?pXsXlsNwx+zVRvXmAj2FS5V7Gz0QB3MRRXlIquOFfHWp6axjdU8Iq/KFt/ah?=
 =?us-ascii?Q?SW1N2+GJSUC7DrHqUkHA8JNBo7cZGpki8j2fADNQcl8cxN88Cos0+91U8+I3?=
 =?us-ascii?Q?Aw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698a7e40-d5c0-4c5e-920d-08dd9901f171
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:26:18.3297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWn4RIo8whtx6Y+6wgU2pLyvqJX3RLYI9nBXURs9BUuKmVwnR3H1jFQanFS2Hp3j9UFx1yy8bVa2MvDVrHr2D6CBi114vswRzS2hYSt9pGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2872

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
index 719c5527eb7f..421a9e1a6f15 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1280,10 +1280,13 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
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
@@ -1474,6 +1477,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
 	pm_runtime_resume_and_get(inst->dev->dev);
+	inst->empty_queue = false;
 
 	while (check_cmd) {
 		struct queue_status_info q_status;
@@ -1592,6 +1596,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 				inst->queuing_num == 0 &&
 				inst->state == VPU_INST_STATE_PIC_RUN) {
 			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
+			inst->empty_queue = true;
 			goto finish_job_and_return;
 		}
 	}
@@ -1737,7 +1742,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
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
index fd0aef0bac4e..f2596af08cdf 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -821,6 +821,7 @@ struct vpu_instance {
 	bool retry; /* retry to feed bitstream if failure reason is WAVE5_SYSERR_QUEUEING_FAIL*/
 	int queuing_num; /* check if there is input buffer or not */
 	struct mutex feed_lock; /* lock for feeding bitstream buffers */
+	bool empty_queue;
 	struct vpu_buf bitstream_vbuf;
 	dma_addr_t last_rd_ptr;
 	size_t remaining_consumed_bytes;
-- 
2.43.0


