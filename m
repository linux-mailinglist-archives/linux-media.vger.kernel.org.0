Return-Path: <linux-media+bounces-29835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC03A83746
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 05:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95DB54680F2
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9F91F3B97;
	Thu, 10 Apr 2025 03:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Z00Isu0p"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020083.outbound.protection.outlook.com [52.101.156.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630E11F12F8;
	Thu, 10 Apr 2025 03:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256421; cv=fail; b=dfyEyN4HKuyjXu5gdMgaid3APcy1/45BeUznoIJNRgLvSQ6h6dwAcZC4e6K7L54O3qZF5Vx8Ydu7uJIKu0rQSOaddZ0p4Jehiu8DMvw+UHDwT5AZ9JWxidopec3550jgJDqaaK3Fs+x4cBIq94RQdTyNO9oiNby1szR73O4ujuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256421; c=relaxed/simple;
	bh=xg/PA/9gRUsESu99tTSwUeXsaGFNFWmJRfwJNaKyy9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BJOu81y1OCISPws9lhe5SddhatI94bRmgYhRNOjsVqpvtBuhNKRwVPDIVAEm3IWAuDXdsGj6AsrUC9QcnIJZVg1vHUxWjy/QSI7UFAgSVOuDJmJLEujNcJAqCkU0onifEMf9VZc1H1bAOYFZGwQkx0LGnXrEyC7BwZh9o5EJtC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Z00Isu0p; arc=fail smtp.client-ip=52.101.156.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcQ06B4Sw+E2x01bmYL9FGDRRgdYWFZdk5i8X+oF7uj1ytURzd1kVZr9aQCVH2o0arJqDlB7s5eGCoL0T9TL74kZ65f64n/d8Y2u4yUOc+NTBUC/bYIR7rEG8INVhnGqd9PTIM79/hp0unT8em5rAZdTYogJ+tuOTfm8Pc1EimDpIKBZYJofiggdbqFMel/oJDTO8EmrLTo/5J4OOIIJgakwbsQ49n2kIWG6GTHUl27uyKpLvkkiMjDk48VTM3DVaOJ7g3QoTclH3VrcGbnBlRlfJrYzUwCIYNqMWa7eIn9iVnrgedokR/+KZXv0zxns3CrdyLfUXwum+8xUHNFlhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FT1C53ahmCMpbiN6CEJD58lrxkwXSk8IKWpcgRM+nM=;
 b=k0H8v9EaMJLoShg6RJ28AM21HbBB8fZuGLFPuggAIvjYMAf5C6sIXVKU/BFF6psUHTyrgSDVeJ6h7Wz/WACY9EZyElrcypvKE2gGSNLRHjLSpQtGj+u637EVr7u1CRi2RNAQh1wd7tVrVjRMp0syW1vijYXmz1z6YJ+QuaN4ru/AuvouMvD/JjB2hh8nBKedXNIN+REPSTbl/LTIhJjh9tMPyBVDk58zLqdwWoWEPpbQyx7tiBBU8R4FLjfEAzJJnivdz0KPhGax+Ps+yZWStSKSFpV67WaUBgMKX6AzBrTSB1ZH0ktiQpdQk5hW7RG4sHYGdKEFcpdWrmNrQK+kVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FT1C53ahmCMpbiN6CEJD58lrxkwXSk8IKWpcgRM+nM=;
 b=Z00Isu0pTuTbcz1NxxFLlQxwqFAzwrXBcxhiSSBFVRvk/8bPRdoth3ow1RCcPI0MFIP+FCbEwoMrCq/t6giPux6N0jrxQq1ZdL1WlGzZcjAt/ws3v0YBvzaX2tznuPZYtkTsZTyuQ8voYLSlvrbI3XYpYmBO1pxP3O1C6gpLtOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SE1P216MB1318.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 03:40:13 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 03:40:13 +0000
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
Subject: [RESEND PATCH v1 6/7] media: chips-media: wave5: Reduce high CPU load
Date: Thu, 10 Apr 2025 12:40:01 +0900
Message-Id: <20250410034002.88-7-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
References: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0051.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::12) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SE1P216MB1318:EE_
X-MS-Office365-Filtering-Correlation-Id: 390bbf4a-fec5-4d84-122a-08dd77e166ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZOP86SHdT29koPF7ZdIbuE1TYlQXb0foTZUulTjoOOr2dSLWEKGoCkq91PcV?=
 =?us-ascii?Q?nb8x7RFsTHLjxkB7nDS1/bmxW3OSs8rH7TjBW7yA6KTaGpQLgk3VWW8UZ+dZ?=
 =?us-ascii?Q?1o7catjt1OhFjtGSj37ha96T5OjQQLSTkr/LQsT9nvl54MFBZpvWXZpmWsXk?=
 =?us-ascii?Q?1QOesuj+C/HHaelxqzqFobtEbw9hoGARO1k3T3EoOO/KzED7cGphcKl4SMGs?=
 =?us-ascii?Q?/zQwZoPmtvV17kqTz2d4v3Y7FYsKwgRVLWD5iGz3rqzwcs67Guqgn0KFQzKA?=
 =?us-ascii?Q?enBbRPoaLg8En+FOfd37YDF7y+4OALHnBpogyzZfoNoei1QC2/1ZdU09CqPr?=
 =?us-ascii?Q?3sxE8xmmVwkBy59lqMGe8UZ8w3RMamHWhd7wPm3emNzSwuaHWWUH2HvPJu5B?=
 =?us-ascii?Q?bu/KLZhb9NwVDsBXHXlBqTgjq9VnPyQmfJKO+EOaxnDE4WcjJ+T1Y78FLWCH?=
 =?us-ascii?Q?5Kl1pPiYjC+/cQtZqCh+GjDwLF96ohD5kSCTCbM9xkSD13q/yMrsJpmc+0v4?=
 =?us-ascii?Q?xsDg1QU5U64x8do0JC8wx4d3QD5sZfLNBqpW8kK8IlI2cucAHaHQ6gGmrTVW?=
 =?us-ascii?Q?eh6uwabbkC+YBUAtpE6yYNoBdvLqADsgTTJwVnhs8ZQzIs1CKL3ihHiM3LsE?=
 =?us-ascii?Q?l63oJ/apsZBtDBzXjHl9GFjhqw6Nc65vNwdvwNMWQQXsdT0+jDnUQtPnlR7o?=
 =?us-ascii?Q?KxHir3k27ZI0wW8nHOvSCq/DKa9vrVXE2yatrRBCtZSJWpCvJl3y/uYCb8ZR?=
 =?us-ascii?Q?dqJBWi+i05Cs+ZtAOjOrpLbjQwt9sbRCPwCAaoHHu8APO/BNP+y/7hCujhPo?=
 =?us-ascii?Q?CRDApp9lXXsQO139wfzJlT0W+QzUNeBmqJC8MISMfBnRf69bBAmfuNlGevOi?=
 =?us-ascii?Q?3m2B4iLM54VQMRryFuyb0+udw+l8i2h3UwJ7hWhyzmEfm2J6+cKjSEIukDD0?=
 =?us-ascii?Q?PbF3gwrBGjOPRfXPeeODcc8HbjKth9zjwReu1yno9E6tw8I8M7LO/9qQxYD3?=
 =?us-ascii?Q?AfHSrd4oNSai3oNu/dzoEMVH5NJxHNjLV3ZUtX38ryA7DNn7CFMtmeEhaHqt?=
 =?us-ascii?Q?91y/ZyzPv+AeHq48iRsWHZzQP8mh+IDi282HOOuevQx71KLOantX4m3olszY?=
 =?us-ascii?Q?tm7yOxosP4Es2z9ngtp42k/3lyArnt5Du84sbr1iWohVTz9VmyAVjo4DsUVV?=
 =?us-ascii?Q?8yzQa2cbf2yPokH5fLyyS3Y918bSZp6i0HfPizm4bTFNHBF+mvwrsnSMHVIJ?=
 =?us-ascii?Q?wkzImP6jCUR78wWeJMQQd438yUyzSKeXABdPOTxFytJB4kdAVBRJS0ulpIkY?=
 =?us-ascii?Q?jPBzPwN9IwmQRl/xKcQp/9ITziLh6/v+iiVusSxIamkV3dpMdX2uxAGEBsxW?=
 =?us-ascii?Q?UhPRqSrCpHpK8HXS8YAeKf/nlyH5YyQtNMmprVVCqmwU8/OdayMf3hxkzvur?=
 =?us-ascii?Q?7XFjIAeFTu0outunh+f7HDfBepk/eMH/7ymaxgoh5jjnv8wNNKYgvw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XkfJlZjor7zwuWFV70bK4tu4FP0oqXNbEgC98hxWa/uvbsks5kyxFNULE3Q9?=
 =?us-ascii?Q?gRMw6V6hNlxq8blm5g8pzKt7+n4um5MpP1NhIyoyOcjn4EaWW6/+vZ8l9/Qp?=
 =?us-ascii?Q?1oWFRaYAEUS4trMbadW8SpVYSDScwevbjCw/VOS9eji3b83Frne8+uln0KsO?=
 =?us-ascii?Q?dtdrMv0KWfU1Z5Tn7KL7b5hFM0fgHKfRYqz9EH1dYRzDqw0LEDjYl2R4cZ+q?=
 =?us-ascii?Q?8Of3Cd3SKUfHjb/3nkah3gsTiRGobRO99VBBVdQpd1bFo8QvFC9oqrn22xgg?=
 =?us-ascii?Q?tdTvD8xv7BsAodAKcng0iQ05DQ3mEfDCOakcAvKbQDbjMUYPi02w5LvFcZEQ?=
 =?us-ascii?Q?D9cnrx4M/nYrtbhRu9KkxPwQuB8Qf1ISRDSCpZldLKeZoheP9zqkzPEGC67C?=
 =?us-ascii?Q?yun3upi6pxiN5sjDeVzJNc7PXvc0lyGBkjX+W/SuKSUhps/evrG807D8vYrx?=
 =?us-ascii?Q?qg9yp5kPQc+ueMW4oKQqtBwZ1raBBTCF2t2ul93se5f0DUmiBtmFKW/0AF7E?=
 =?us-ascii?Q?faVwNYf6mR5DSSjL90vKH1rc6E21SgxGr+ytvFFTv5yvGYhhEnLq4+AHaJl2?=
 =?us-ascii?Q?M2diZg9fGnv7y8TwboEtLBF8242p5mFyjZ8ERmciSsNbK36l9s57396u64eN?=
 =?us-ascii?Q?JYI2uuOH+TJvDzrVy/QvCtp23QrqT9xZrm3i5yVkFhxUb3Oi8qb0/jY1GFvR?=
 =?us-ascii?Q?izH9qm1lYG4OK0dPOwuZ6evnlNycL+UGd7nwJsOpj2uVPOqo47v/oyw+8cgn?=
 =?us-ascii?Q?8TDF6b5E2Q9vgAvH46gmfyx6a7djOUU3rPctxc/B1eM5VoCX914CQkXoGwct?=
 =?us-ascii?Q?TxSAnPtGr5gNQVn+IlSzdMCAKbiJmOkk2XdlbGqOfdsSzI5JviStUQWCiU2Q?=
 =?us-ascii?Q?PorjJydLvc1LX2qwfO1yh/l//01kRiD9ZZZbWkSnvKi74s87YUBOkbXQRDf5?=
 =?us-ascii?Q?vtUv+ekluzTweyt3RfZjq1ttov3Vk4660JfHhrzGinaG73zvYlsqZNC26KCz?=
 =?us-ascii?Q?KwlmntWCHdrvlxMjQKAua+aSdV3wdM6wdB29UGdg/ebyEaLeXdOXiWgD8Im7?=
 =?us-ascii?Q?2OHzVQ9TUGxh/aRImT/vop+pU4U+4139+CPPNXMXx4wewVcWT8H5ruMv6Ytz?=
 =?us-ascii?Q?nkqrNL1a1gZiKXrr82Lny5HhKA/zb79XreBTzn9IjqAweJUqWHdsg9oquokb?=
 =?us-ascii?Q?09sKZnuNXnfCsQiXMVdfsN3nO8KniYNKo+jTAo1vr9p8AhDTzsXwAVhS80MB?=
 =?us-ascii?Q?W96UyYr0fFWhbmND95vvPCaEAj0y2pARb1mwGVT8Ou28owJYdflP6FoLY87+?=
 =?us-ascii?Q?/6ZnOOerlLP4fEduk94JKFPjXOvTSDt4Jn3CATX+kq+n1AnGPeRy5P5Ay5Mk?=
 =?us-ascii?Q?NKjNEM2vvl0vMWZdLfZuqukAF0jyRi2qMCjSuODnN/jaibf55OITjeRIJm2I?=
 =?us-ascii?Q?Tjh/1TGIlnPZab5oFnguBdOmGKsKP6St20u1Lw4Ucaj4qErbav6jixZA7JBQ?=
 =?us-ascii?Q?RTrXQvMGxPie3sR/2+K1PBzmIDye2jeTOMv9cfB/5WiDxnNeuF3ghypC/msH?=
 =?us-ascii?Q?6va+mSfrYdajIJIqbvhs0GOJGblgaqN7Zr+2YP+XtuLZHkustBlecO5l0hSR?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390bbf4a-fec5-4d84-122a-08dd77e166ba
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 03:40:13.2676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMDO8zzt2Id92bmQY0FulvIWDMTL0ZETEKecIO4CUzlnpxWzri8DcaFTL2TcmL43ulOCFGNfnVEaBTujAEF7s+0r2rJZiAddHA/Xqld1uNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1318

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
index 485320db9bdc..58340fddcd04 100644
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


