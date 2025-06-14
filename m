Return-Path: <linux-media+bounces-34794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A35DAD9CD9
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 15:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C019F3B801D
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 13:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4052D1301;
	Sat, 14 Jun 2025 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xq6BqI8B"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF062C15B8;
	Sat, 14 Jun 2025 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749907365; cv=fail; b=B258AOJfVWZnZjsLmTuXj3xrxG17Hgen9k6xGf819phvmmdfWUly4OTJUWOk9FpvumNhKhis+yIR1kixGKCvnjE4oH/WVEK+IwQjRx+yFvSZEIPjk899z/Fzc9Wvv1d49Z7K/XLDwvwpB8Ww0eXZIUn2p7sN6fs0+vfl/uStuSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749907365; c=relaxed/simple;
	bh=xIF2qS3oKc6Be/QSjIBx26MlEszB0ZAosrrxcogQw68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TmVLQ6Fzg1h9e1FxFDc1Yn6Fqm0eL3pYbZBwMy4HiLIJa6d+lTWmOBtswucnDO6+xZOEZZB/t6ZvIHEhKEw1aNn6PAk0v/C0CJFvzc7BPCp7dmWVp5AxrBxkBqGR6Fj8fPuhm568Ylmz7McOA2It1uSBVHxGCDlIE2c830s+GD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xq6BqI8B; arc=fail smtp.client-ip=52.101.65.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUR5RscnN0h31+9utHdwzUsBrX+gLbytrHmITzpXMMIcO5t+HP52EuPpypEOTvxBztaEWFbAwZXYXQgNGcYWeoIiMtIEYkg/6feNalu2EEdFk6SITWbHGLLNCY6RouXYrCnwYaoCczI6b9HbNaBl/ZX+e1JdjHCBSBfqtB1bPC0fNaWMr2G2zYzVxT/sX0OGJchSYaPOxC9WHV1FUGzZUnza+spqYq8WO5K6sxetuVkSUxA1y65M5n2hKqlIR9jtLc1cmrYuMyGKl4ZkPOnF6oTcopvzT1y5z/SX0VDHglfRChBpfd0S8axXGhlwv1PuTtWhQjAk9V7kD1MYMswGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuIjnC0KscdEYfaA6tiOr7s0t8HEVrAr5iys3BlfX+w=;
 b=Xcxq8SsnRMDSK9T/V2V8aovM4O74JLdgr1CEcZJCzc1EhkR3V+jmnMPwL7IICSIhFpR1/Q+qu2izUMwYHbsTXmQmLGko4R1HJSFl2E5nG5I7dnq2ee+sFcisJu6HnquFz9fnfeKTDt7OaSHcynM2I7cUY+Ji5J9MlZWGYmRz84mGgwr/ojXriqGdS4si/+vsYYinq4DQdt1uJSpmRyT4OfcoRF04lNI01ixbERNKqo0CaRN4i/WEGYFc+VNoEw+PHPhfIxfF4bJ3XGNdF2rWSStGBPP1LK2AoMTOuqX5zMnOF1xTmMo6h38qyTia06uU1J2rQ3SMljcgg6HK7WIudw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuIjnC0KscdEYfaA6tiOr7s0t8HEVrAr5iys3BlfX+w=;
 b=Xq6BqI8BSCF7tkxAiOojqJUbS9cKmvC0BDlPf/zwDeSVppU5ixrHFw1XD5aQ01vKxnJ9/SWUgBGzmQ2+O1YIpN7OiMLqICFP9BNJtoPS5TuMUV5f4KUMpeiz8J6PmrwOzWgTQP/JaxtlY1iPuTuRa/QK0rbN/Uts3J9D+/wrfmuVDuwkbTQb65XbvTDGT4K+hoC6aU8FXAX/2zhlKSLW8Mh7Z9+V9HvBpsF/ljk8xKDLaJZrSyNdJXL/vFAVopBJqhIhk8/Olc+4ux+eBdqiKIPKnNsxEfZA1QsNtcO3Ak9YhSwrtLSAOW5u4XNy75bUEmInzsKsnLg4VKts/wr5Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBAPR04MB7255.eurprd04.prod.outlook.com (2603:10a6:10:1a9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sat, 14 Jun
 2025 13:22:40 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 13:22:40 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	jeff.johnson@oss.qualcomm.com
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	jun.li@nxp.com,
	imx@lists.linux.dev
Subject: [PATCH 2/2] media: uvcvideo: add URB_USBMON_NEED_SYNC urb flag
Date: Sat, 14 Jun 2025 21:24:46 +0800
Message-Id: <20250614132446.251218-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250614132446.251218-1-xu.yang_2@nxp.com>
References: <20250614132446.251218-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBAPR04MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e49602f-5019-4acd-4ebe-08ddab46895e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Ow4BHCT1uhUJ9kC958K/vj7w+VXwgbVLODBnSTjHExAGb78vssgvzeWiZ+Zv?=
 =?us-ascii?Q?a+UATDuHs4xjOVKxTWkHTXLZyX8ngzlZEvVIcPLsD/mc+PBpFQJQcMTxYXv4?=
 =?us-ascii?Q?V3JaFPza49cLQC8IaY+m1qiyeSrYQrZMQO7/nzA2wdQUqYjFCD5HGPjgjr4h?=
 =?us-ascii?Q?sUG24WP4hGfxhKePYQcAkEd9utM1QhtVqk2RdcbTUeG8SePiKtjxLRv+HRYv?=
 =?us-ascii?Q?Y9iGbHayfwpgdOXoY84ZpZIfXCTcXNrZlbvP8MpRaNFNdNGXCSO62WuOV12w?=
 =?us-ascii?Q?m0o9IwgnSEMKpMSH6fx9c1NjkNjNaN7tTGZffx/QP7V6tBwrhp1/KfmKcVaI?=
 =?us-ascii?Q?Ts/AqAvTK01jdztyGgIZ9HZ8Y9rxQoeuGYwXKtUUBbPMH7ritBzPmLL1fSbf?=
 =?us-ascii?Q?t5QPLFBVlEvdB4Qg45ugfVQeLf1NyYdZSRC9v0p9bSqwxKkmLZiwp2TrB1O+?=
 =?us-ascii?Q?071ue/Q/xELdNZXSUlZaqomzv5tpGoPK1Mcgn1RktkpWakBqFTFmhMZdvnr3?=
 =?us-ascii?Q?sOS1uSnhei1N63E8PDlKLIO4vKka90GR2EUXTuEmqfSz1cxTLp1GypqGOdTf?=
 =?us-ascii?Q?+f3TZGpThJOpCBXkpwScW27jsv6o0srMwwWJ8rBpm0roX4uV/ZtkujKbAG9F?=
 =?us-ascii?Q?MFRodixV+DnQCLQfMRL9sZgTnVS/1is+VfPMV1rxpSxSDF7DUr0HKeTYoDeu?=
 =?us-ascii?Q?6OumpLtj70TxMs9hZ3CXDreQRV3LL+edcttH5K8qi8J6cQNo+aeQaidYjIXc?=
 =?us-ascii?Q?BnlFFjNVgVJ2A5nUD91MrRmG5Ci2OPOqvblF3VvUjA22f+086zJO0kuaV42Z?=
 =?us-ascii?Q?W+D+UEKs0rFlCGYz2UFaAjFkDKsQHqCpl8UE/6+F3fB50rAp+dOACJYo8/gp?=
 =?us-ascii?Q?CAXqNQbXGfDPPmBI9Vd75mlqWTnet6Ehsyc//OloPJMozEoFd0ZOJYm7tfeU?=
 =?us-ascii?Q?dQHk3kCRJiqliB3SBbwBVEWXRKtudPNpkrvk6cSqmT2Hi1am1tLA6SnvxRuH?=
 =?us-ascii?Q?ueV6MnFnofN0jL3szyPHfqamHSsZ6No71Gl6ad+Rg4ZyGRmN38VA/IGDuEe2?=
 =?us-ascii?Q?yt6t69mVbvSLeiYAbcxDtZi7fqyVusbuJqnFGQPfjZFq/ny7WnccFwGB8m0c?=
 =?us-ascii?Q?bcIMQUXOQVqelaqqCdFIGqtMysRIORiZYhcRtvX/Yc+txniuPQWzQ6MPPtPF?=
 =?us-ascii?Q?Or/EPlwXyecLbA4kFVyYWE+54nPgB5qrdoIhWoA/w2ODEsauN3K09yMuHcsB?=
 =?us-ascii?Q?QoH2rkVU1ZY3+Fbp/L6nAjuRsa7HOhrecLXkykJa0VvTY+eBGD19zrrDurPk?=
 =?us-ascii?Q?A1R0RIE0iOmHkxDMtNnPc47ZeEyB89cFnki4EZpOyNHdvresx9qdApTOe/WD?=
 =?us-ascii?Q?xTElyolVZVC5LsFFwBFjW69eL2pLDQqvbzyenTVJSXUmo+3NIlSBkg9Y6lug?=
 =?us-ascii?Q?W2xocKCKnMwDMZVotUS0i7zEIs34EHFa6Y21c4wHMLfO+2+oqZZVCw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rLgrPOC3aDeJ+zw/RclNbOOg27FnrtlXGtlNCYXiy/G1a72vprg9VbaR2Hk/?=
 =?us-ascii?Q?hV5iCLEA/KRoYRstQHr7T/b2TkZ84bgAKUOOLlpMIOYj3r/kJoi8skJoRzFg?=
 =?us-ascii?Q?J916OiHLbJzS0ZU91Pn94wIKxBNMnQNR8xvq2DE3inc22cDP36MP5Mr91Imy?=
 =?us-ascii?Q?uiryCURzH8U+A3kiEvfl1x5B4wRXdiweTIp6niJKFdCFuO4m85u/XOWmVEsO?=
 =?us-ascii?Q?csp+CKdHJUJ0aM1wg2PvlurvUNQwz94tBBK+r0LmihXqVnP/484Tv7Sb3VSO?=
 =?us-ascii?Q?BPwXoKTkVBu9f0w6jqbj0N0EsmzR/sV0LePtucEN3CViimIdMhSfbp/5xRf8?=
 =?us-ascii?Q?Kmf+83DNAxgLuzcO8rCy5d8ZlXLVjRPItjwX7xLW0DehbFBTP+UFiGTzXOwV?=
 =?us-ascii?Q?w11ax5aRsEhd6YhB8ss2zRLIWQjLhqqR4iLv3vgHUcmlJB1VubtT5wGPhek/?=
 =?us-ascii?Q?/tvDycey0V4dNLjODkNsXo0VVA7hml+uzZGtU710QlVtbwaO8sWDXwtBMWO1?=
 =?us-ascii?Q?2/3/iDhham6wA0zp0BLyc3a2kRKoZd+jcwm2LSRniXYIW/ZNysv4+dshQEJG?=
 =?us-ascii?Q?aFPZof9B6CYLbN6bya8WQBs8RXGzcjiLweNq7Am2DkkrNP3eiybxitjNE+3g?=
 =?us-ascii?Q?o73lpdrJEnatEpxpcA7hoSxQQbsfu43M8RDKF5wPtpAXEi0Fdb1mYs3sOig/?=
 =?us-ascii?Q?Gu2KOKGaSChy4BEiY0vyjIFHEgAfpZ0elwjx0R17ouFrME0sHrX+3J0F6lum?=
 =?us-ascii?Q?BiCMLRKORCVFRYC30gcWKbCol3ElyeFgqjoGHrBH0cWqtVnVUcrIHO1trdVY?=
 =?us-ascii?Q?k4bm/fG7tVId0VOqqiuh0hqCSjyNHLhNG9r9OIZFtg75g5Ov1mD2gVlCmWv9?=
 =?us-ascii?Q?Beg4FMAm0d7rYJf5wj9RmuOdDRy67XgENLJV2qIgZUbAwHcmTz/pplC2Zo6b?=
 =?us-ascii?Q?dR8OeTcFA5A6Kkl/u1wfYW8QNcGipdMIca0950opGoBKf+nzy6GW+IZTd+0z?=
 =?us-ascii?Q?Fq/IU9dASVCkA9AB21nFLoUNyoCTn2y9hXDWptsH8j0VTRNvrjjO4Uve6ssx?=
 =?us-ascii?Q?7eQ2/ASoS6NjgMc5hQHvlw8igljmVhBuz3sDAxgyXtuoMc2Mbsv1KD4Zidao?=
 =?us-ascii?Q?AiScJrmMnTT1BxfUU/612QxOaee2vRcyBqUbIwx7ZbfnKMK2vaBo5aedOtRg?=
 =?us-ascii?Q?S9Jx79JPj2vL+qQeUrsi4q2a1/Chd/biNlqnbTwWNPemrEzVf4b5LFsz6fkZ?=
 =?us-ascii?Q?X4LIHtLhPPg7a3wmHgdZIEJH3d00fE0Iw6tT8clPssnbtEcJqeUO2SpJvoPe?=
 =?us-ascii?Q?8k3q4idnfmor+p/INuslA7B4XQ8QpJ4+iXXGkeFkyEiEtG6vjK8jPw+X4oQM?=
 =?us-ascii?Q?tXN61taA6fWm5ywUQNxk2C8hNw9hHxdF6SJEY+jYea8qzJhiKHIraNI0lPIV?=
 =?us-ascii?Q?ShCXGllgrpXJnfR3Ebv6UvtrG+fEEbIs/sHXo+XrABHq+97maNvI5weLwObx?=
 =?us-ascii?Q?YTB5OLcQLfmnOHJUZzyKRDYNCox3dfDIvauon3ZKNa5zPjllkyqmTKeIFmso?=
 =?us-ascii?Q?tkFPJw0EhI3dmnMYrpVVIjxhaRcbLD8JQzdrf845?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e49602f-5019-4acd-4ebe-08ddab46895e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 13:22:40.0510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76DenEZA3BTvWtnAYpVuPGzFOv4X6PPobdaN4v5vTiKcyGHMXbvyK5zYdPIYB0kfFJxLRZTB6Lradgp7cP9ffg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7255

Since commit "20e1dbf2bbe2 media: uvcvideo: Use dma_alloc_noncontiguous
API", the driver is allocating non-coherent buffer for urb. This will
add URB_USBMON_NEED_SYNC flag to inform usb monitor needs do dma sync
when record data.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/media/usb/uvc/uvc_video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..446b3f16545d 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1946,7 +1946,8 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
 		urb->context = uvc_urb;
 		urb->pipe = usb_rcvisocpipe(stream->dev->udev,
 				ep->desc.bEndpointAddress);
-		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
+		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP |
+				      URB_USBMON_NEED_SYNC;
 		urb->transfer_dma = uvc_urb->dma;
 		urb->interval = ep->desc.bInterval;
 		urb->transfer_buffer = uvc_urb->buffer;
-- 
2.34.1


