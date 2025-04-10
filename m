Return-Path: <linux-media+bounces-29837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9BFA83749
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 05:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4BAF3B6032
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2D5202C3A;
	Thu, 10 Apr 2025 03:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="h8PHe4OL"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021108.outbound.protection.outlook.com [40.107.42.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3F1FC0E2;
	Thu, 10 Apr 2025 03:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256423; cv=fail; b=riEp66pDO+C4iGtwfoXVhlamiElQmLLppQuEC14OTP73sBfwJ/+cG0g3Gphgj2nOxX0oHd/MFHLahGdPUASAWxXs1imPBJh8fZdLr4BtSZZNbePcbh3jI5lVQvCGJ0w29zBSEXW4CGusBgYiwbkhGpqa3xMXVk1XddYNgDpYJ8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256423; c=relaxed/simple;
	bh=CrhjsVPChv72/ds63TkfWd2q1Sy2xPawI4hMdAJ3eJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cvh02p9V5JWBZOp6ejd525waM2rYIREnoXMnNYi19sZZ2Ek/NtfcV8IZcF9au1MLGQOa2NNcDMdDkTWxgl8fBjEyoIwxViZiS+wZdowwuKjnw8rHWLwqKthc3uewfDsiWc0pDcfM7oylwBu/oaLQF+0HxT0uVshQGWrZoQp9fHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=h8PHe4OL; arc=fail smtp.client-ip=40.107.42.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nh/fDmFpuDm0IW8VCGRPOBJHDHsqaAmNMnUIWsJQ4/5NdFsMWEUhNM+B0k22kuYNvrQSujEL/hzDDTALH/7QF4GQWdpnvDeLUqbnjjfTqkeRNwDUNgq2zyE6UV+bgmDNLjBeTQev3xJ5hWi4+Hvzpt/Q9LBhn39OC+uRVZNJIDAiE8kk4U605IzqQ4s518SW1kyrvzWSVtdkfya/qrHTVc1ybmT6xpGr+bEC8O/KazMHSwLgj9Sb07dMH4JpksleT9PzfuTzeY5gam9IvqUaos8VGJYf2ZR4g9rqzVoWw6W2vcM1gKtfSRIq0Vxo8C0urijasW+A1Hvi4FEbxDJd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXVYk9DJqzmTdVVESoxfhz9HYIL2wzZGzXmknSJiTPw=;
 b=ctKJwMTdsMfqYS43sMvrhRmnNOjj98xDeqUpngLdqrtIfqzTPUzACvLAJdj52Ph44N4QmW2XQUDd1MgFpKZn4pmsxtBRmWenI1OTXPSmGv4DtyYBUosrT/fxi0IjGtIsnEkETBvGipawWef/JsMtaIYeRirx1B99tELuX0YezkRbaj7i53bE8P0AYUvjXH5IcH6Ev5iyR/jSbyzfRE/bD1Zibs7fqwkY9RtE+EEB18ANe+NBR8TIVCLdkKPBrsxnyez1r84qLv0qWwNegkqATR3ARq4/+FdlaZ174kgIbgmMnfbr1s7KMI3ZJf6aDozUp1gY+0onB3TvV3Tajo/vWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXVYk9DJqzmTdVVESoxfhz9HYIL2wzZGzXmknSJiTPw=;
 b=h8PHe4OL5vtodFgzNcaXnjn+YXA176B6CipPZTyPeHo7Nmy202YrENABqjiTC1Q2H8LqHKvkCxs9mXi9BD1cZUhzW814/zHQ2dxAh7T5T6+47FMzOgpOLNEhuanEZdOcMK99AjVaf8FGy8KoTnEUG2p/I/y0EMG2Y4lDRGQUJdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by PU4P216MB1439.KORP216.PROD.OUTLOOK.COM (2603:1096:301:ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 03:40:12 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 03:40:12 +0000
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
Subject: [RESEND PATCH v1 3/7] media: chips-media: wave5: Fix not to be closed
Date: Thu, 10 Apr 2025 12:39:58 +0900
Message-Id: <20250410034002.88-4-jackson.lee@chipsnmedia.com>
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
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|PU4P216MB1439:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e7d321-b790-4712-cb5b-08dd77e165ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oJtF3TIm1Xypoov6DGbL/JowTbboFEYo0A1jZdcp0pmhUfMhkSwudDortGqo?=
 =?us-ascii?Q?RMZHMlHpGcoBIlw4U7IrYMFXAlzWuYcYYtx41bz+w9wJ01nEYdV6tJDpx2jF?=
 =?us-ascii?Q?r+ZK6LhIp9SIKErMY2wfFv18ccyJflJoA0H0P4AKKFbGJxg1/cphvAjVYu/1?=
 =?us-ascii?Q?V0MreYKTl1flxM44ie30eoPCHtaw2Nl6hvPLif3aSsHjqHoUDlzLtr5tNGAi?=
 =?us-ascii?Q?MS6EYrmu/MlK2fBJHWWGEyrOhceYGoijAnR3XtsJmiD9Od5mfwsnkbwRAtAZ?=
 =?us-ascii?Q?0+LNvWSwpWdH7cNhdxA+KbFGakPdbG58x/TC3+iOHLmSaBhxT8pOtSHs95uc?=
 =?us-ascii?Q?hrNU2T66QZjYmBOVhd8Ex9Bq2nLTY8Dxmwii1JFF31jyn73N4FskYMjrjQDJ?=
 =?us-ascii?Q?dpwGgF8Xj/DDSlwek6uLez68+4CfdbGCk+Y31Uwg8bXxCx7SaagsnwWdp+Zc?=
 =?us-ascii?Q?Us8gxTnqnNklToJKHgBPt/TMR6NIJbbvQkMJIBPIIMhCNR3lQs7HHBc3yX0f?=
 =?us-ascii?Q?FIcGHpzsSlaZzAQRihWWJ4aHwAIs1hmLdii7SXl1JVn+ByWBeUxL5h71MDa7?=
 =?us-ascii?Q?I4/hNErRxjg8IvRjWSkI3ywoDdfs6d5/uqq8Tkk7o9ATKY3IIlHeXkasSqus?=
 =?us-ascii?Q?gLPMOujvaHLGJfvPSS9fWmIYZAU8QSS9F3G3lLvStFAF5R9xQ1PrcBDClUNC?=
 =?us-ascii?Q?KieEPPCD726r14ZD2idWc79UOGwkH+meYCM5I0KL5qNiHKKbSXGusqVvlqtJ?=
 =?us-ascii?Q?0DZ9ASlDMBtKZJ2GkZb+owXiVl96dDafPMqlCyhDdBP+vcUMXCLBdETKWgyN?=
 =?us-ascii?Q?LLmGdBBydLYs05VF3Jx2nFczHGP0084OzKDIINnsMzJ65lUIiYGM+jmxtTim?=
 =?us-ascii?Q?109oQu4M9O3Osp79e78Mg2CeNgjJZFzF1hrhqCZMEzxbsaNMxpQGX9HfwSYK?=
 =?us-ascii?Q?iXbttzxSDzYI3yXb204EESkU54isHv5qwddWJO9pcF4cW0Jvd164wLXQyy0G?=
 =?us-ascii?Q?O+/T+2+csnUGqPlnE0AYaEbZcCS/rXXnze/lY90oG0AfT/naovsLpS0cjWUk?=
 =?us-ascii?Q?tzGAAKMk9kunOIbrmjIMIFQIdK3wTLsZP7C6sJeD+bZrxSfbCc4v332ymkD+?=
 =?us-ascii?Q?WHKsxC4NQYQKlxfpMb3NrEhfJqYkCDtnO9/MP3oS7hhs5VJ29DO5PmiKH3f4?=
 =?us-ascii?Q?3Vk7PBtWXSFImSHDyxDnxtYAC11UhqRnToR6obn+92nchLZGfGp23RsnN3EJ?=
 =?us-ascii?Q?bJcU0Te/sq2pIJLD6KVTdHD1rsdnRt9VdzoCW8NdRhnpBAsvT96jThoJRRqe?=
 =?us-ascii?Q?X74OY4gk3wfH12N5kkECNhu5yCMTcEPan1r/5G0TfgJxZU4pSsc0HokFHwZy?=
 =?us-ascii?Q?VzYw/98+4Yo3w5f6U6S06JM4B91VCFDOtqX8io9XhdsiYLvk6eg+R7+TTO9l?=
 =?us-ascii?Q?o9t0sHVYhq38+K29U2j2L8RePPXh+sgY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2BOw+mTgV6NCUQD0Q1vwVHpkRLuhJPcccuvhHC5mr2IyknCq1au77EteA9th?=
 =?us-ascii?Q?u5qMg6qf37H2SSCmkOTu3ocAWWv0NhBJUl7mbPHnI0terzszl0DNYtVsuMzD?=
 =?us-ascii?Q?tkp92K+VMda1uqm51YVHoB9Q+MnKmHr+zSTNl+gicbavhqZg1Y3fQ6avCyQP?=
 =?us-ascii?Q?CfyKQMWWASZCH/2da91W92QD390vkwXasdGjP558mzL8Z9UtEIe0SZU+Hs57?=
 =?us-ascii?Q?hLvEWNedM+VY8vOVRy5anAXJA73B9qHlt7WKvxeu0LdE15LMEeXwNNd4Wr6N?=
 =?us-ascii?Q?BmPhqjRDIt/3QRPge1FEoAh3LrNTCwU22ip3UnJcAByuT6ZT4EmsQKtX5oPN?=
 =?us-ascii?Q?2j9bw9CNhOOGmljOVre7AiDB+ADHXNmj0tzPm9jcPtgaBop/nf4pwO/TxGkE?=
 =?us-ascii?Q?VZA44s//aiQLchCj40UCc6r+FxGFWU7XKwsAK8RzJuQZLQo3ODM7v3a64wS2?=
 =?us-ascii?Q?gl+5I/eIwZQjohBbSOjgeWmvMgpdDhS0BUgXLD2CeVApEmTTL45QOLIApC0z?=
 =?us-ascii?Q?63qYwX2dpkvw5up3+wNnytYt1zJV7KnD2D/qjCdBVnQkm36yj+LQzuSHYW29?=
 =?us-ascii?Q?/RZ/+exeVh5YIkcHswnvkvlKL67SPJ0u5KnQ/UDT5JQiHO62TEFGZiKcNtv6?=
 =?us-ascii?Q?F5QeP7Zw8VF/baMtyjAKI5DD5Qh6WkfXMGPlBY8ALDc6VWtGATlrOtj//OCa?=
 =?us-ascii?Q?Hb7Y+1uTevMnAAqXFfYO8OO8aCTbr5hyvLu6M+DebHsW0C79m+ZthHJx96pp?=
 =?us-ascii?Q?Gn/ZWJMzGZVmHW6Daofuviw+XOM9gS1Ve7ijj2MZXF1HZcSzqx8Xykpuil3+?=
 =?us-ascii?Q?fB97tsqmjBZ/ZWXuNHxWe7gBjFL7f6Hckb68nefMwxUDLwRodd2Uz9SzqNWS?=
 =?us-ascii?Q?GQ/M2bn/5I2binlIVxAuMUdrKVvwmAvNTBf/0TxLMpu/arrq0rlDFAvBNayP?=
 =?us-ascii?Q?iY0WvSsatkh3Y7dT48ll2EWgDPi4YScTevngGHmL2SlzpJhTT1O7GKmfhR/H?=
 =?us-ascii?Q?2DYZSd5baJthLOqiNMZkyCbnvpkR4yUgWmxYFBS43NhSDXswcyoHsNYHLKhn?=
 =?us-ascii?Q?KKEatuqpcOOpRBTamx8QI/VoyQvGA/fd0B4gsv7R880cIBPrMhbKxf8A/zzB?=
 =?us-ascii?Q?icntPKun7PA8i9baFCtEiTJLLFqzEl0hN9pF2tUZGTOtuijEES4E3PtKgWy5?=
 =?us-ascii?Q?JyFDVBAJ0spYf9+acIFVjsBG0B1Q75cyC+jwZOjCa6YcCd4N1gADokZGxO9J?=
 =?us-ascii?Q?MD9QyWPuMDplAM4ao1iT0azwNnjNjxgJ+QDclQMZNXrhf9f7WxBgs/NWZVbW?=
 =?us-ascii?Q?I7dbk04X/8zmi5ZGfDCbJzq89mOiR8iqvCnORRnNo4vTaMaGW2LcBgMJ5X+t?=
 =?us-ascii?Q?OSFuOqa/AU31T1UvQNwOwgfCwPTYH1TKcwDwNsOCXZD4qZ1AZb0RH5PtD80C?=
 =?us-ascii?Q?yl9pi316iGO1SFvb8a6nX1eyHDHS9lr5Yn3KcGD9942fnNYTmk12SdY9KIJg?=
 =?us-ascii?Q?bi820atI+M7JWAwTIJ/s+LLPT1+xrZDD8YZHT46JGKf8KWF1wcNKbcZiO7+l?=
 =?us-ascii?Q?QIcTL0i4A2lXkoeomRBjhG3x4c9gGjJRfqOygyjPQbNmwZd8cF6qBYBE4wnq?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e7d321-b790-4712-cb5b-08dd77e165ff
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 03:40:12.0421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEaTk5h7oC1C5SQVa3vSOiVx0mk4Qet95GkQGPEoWL4koduisNljwkTaQNnnRo30juxZVe2fMoAzamo8EvUftR20pTGpfV4hRyup3CFwErg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1439

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The current code was to wait interrupt if queue or report queue is not 0,
but since applying the performance patch, input and output is not any
more synchronized.
So even if queue count is not 0, an interrupt could not be triggered.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c   | 6 +++---
 drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 192556b91aaa..e0f4b11ee464 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1481,11 +1481,11 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
 
-		if (q_status.report_queue_count == 0)
+		if ((inst->state == VPU_INST_STATE_STOP || q_status.instance_queue_count == 0) &&
+		    q_status.report_queue_count == 0)
 			break;
 
-		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
-			break;
+		wave5_vpu_wait_interrupt(inst, VPU_DEC_STOP_TIMEOUT);
 
 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
 			dev_dbg(inst->dev->dev, "there is no output info\n");
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
index 1ea9f5f31499..4ebd48d5550e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
@@ -59,6 +59,7 @@
 //  application specific configuration
 #define VPU_ENC_TIMEOUT                 60000
 #define VPU_DEC_TIMEOUT                 60000
+#define VPU_DEC_STOP_TIMEOUT            10
 
 // for WAVE encoder
 #define USE_SRC_PRP_AXI         0
-- 
2.43.0


