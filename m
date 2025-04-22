Return-Path: <linux-media+bounces-30689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A32A9645F
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F7211888F45
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 09:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2601D201267;
	Tue, 22 Apr 2025 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="f/fIAqnh"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020072.outbound.protection.outlook.com [52.101.156.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7321FDA94;
	Tue, 22 Apr 2025 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314301; cv=fail; b=opjVrEGAfjzU1eeyWaN3gxCPJpv6Do4zs+FasWN0gFMmzS61N89NCnlqwORSJX3+Ol7gmD3iCL/25ruFzbWjnOhcAb2x1e8RRNlOpVO0uqtsAdVLL1Imm+XjmHxjuyu+X6OmldovxgONy8leRVwfUcwclx1qa30U6cwMZeI6610=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314301; c=relaxed/simple;
	bh=AX+cRdpE1OPMFzVXBGxkiD+opH5g7/jEzkoYiFmqWiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RWFIFw4Eh3bhyIGqUZeDEHCCfz+PUuhjFRMyTAErq6m1aiPu3NMi5FWeipA6Hq30PUp0ehnva8hzR1wCiHbShJTyQg2FOyI6zmDMEmN+yt/XGngXm61FVDPpSJxvvxBBQSyBw+DcVGycasd5e5EVWrX0MpSpt46zIFrMjU+iO0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=f/fIAqnh; arc=fail smtp.client-ip=52.101.156.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LK8CACAknWiGG0GclnvbhnBcLCEa+PQk1/1HcTTpbjedFSukL+fIcfskbAEyhks/cBMpKiUk/tTbqSD3LL2HIVJxr1KRMaqo17NimEL4ND+eepTA6stBRvSXQFRf7FFy1Kh0wQ9O2BqgeOpI3z12CRWHfAx8H7xJfnhj1qnDJeKwBxMDzRNBpMWd/RSMZatb1fhloWamBn5Ino7jPjsa2sWWfE3gTjdV7rssGEEiB/QuyO9HAsv54VdajJfgqqBFH3FfhVX91MwNNYhutuDD9wmEQfFxFSycdFZE0wpYjQC7F+7BFmM5xnVGksCDxV8idDCPIYR8H3yH3BqSMJRGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJu7p5qw+zcW9C4CqwCppj80pM+rhk8jH+C9euM1+QI=;
 b=s7NTwx6iK+j3Cc6DqSRvGu30hA1pJ2kix8dDIh074rOkHjrbUJ4JBuEm906CZ4NhU87rGNrOYa9i3ZkmGiWdRiokBjabB7eKYzpQXbcXvBVqPTiyKkp/216V6foBNUItu6yjvJRChyfVCjzX2vZK09IGvKywccy7MgKOSZJnws4DXt3d+Hee/yTLCg70cBGgs+tpYfF9nGukH6xAGZjA0a8NOZk/IBgz0OkoYj0ECwPp3h85V8itsUeIaoxb72ixLlJ99woQv8hhUwfAw3QyCfGbaKL+r0OmMf4h+mvCPf2qijaUt4aQ8wDv+zGosDdPSpIYnEYdYikl1U4ASKa+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJu7p5qw+zcW9C4CqwCppj80pM+rhk8jH+C9euM1+QI=;
 b=f/fIAqnh9BkVH4uHT35KFrea/78PmM4jsLiaYnO3BpFm/0LYZAin+Yv/iNk10sf1EcFWiT/bkQlaC21vcGMyddOCbBxuo++ALLwzAXXBX1fhhZrd6P2f5eIsDHYcp/1sGftlycUjk61xj9zdzPwEqAtyq+tfZQldR2rsCFr1nWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1521.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.34; Tue, 22 Apr 2025 09:31:36 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 09:31:35 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	marex@denx.de,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v2 1/8] media: v4l2-common: Add YUV24 format info
Date: Tue, 22 Apr 2025 18:31:12 +0900
Message-Id: <20250422093119.595-2-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422093119.595-1-nas.chung@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0120.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::7) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB1521:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f20e2ae-c2e9-4376-4628-08dd818079df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7aHDX7XRusfuD3kcFaqlrvEu8hfuFoq1bXLw4ubmsj2CF1y1DUpZpJttHXfI?=
 =?us-ascii?Q?kzmoKWuOv2qbTV4qI6BECx6NxBamIVwIW2EY3Xe+GNdOUf7EGInFYIVUJwZe?=
 =?us-ascii?Q?R1orNukTRGjM7vB4ykbHcZKkLHEt9Mt+RVli0dHp75nazcwtBN6KW74wAgKl?=
 =?us-ascii?Q?i/W9mPp5dlIRjARckJ39NfJd+FJ58qYRl1Yywt8IV87qnnK+c1yWMsYEXibS?=
 =?us-ascii?Q?xIXU11gPiLXcv6QOLSj6ZwrB5YicRtUfB3Zd3YzNj0Eujx1oxaIQjZTuR7hw?=
 =?us-ascii?Q?0mFeG3Z+DZ6NbLfCOI5c4IZ0SdoTPmt9PSSD1w24M+LoRIT0cbjJECVH4mFA?=
 =?us-ascii?Q?AP2cf2FCu+U0Ke4lMLS+qvziywztEL14MRsPV4bUKbwil7gASPuVaJyWkRbg?=
 =?us-ascii?Q?8zKAUs6eSgz1TA1nT8LWXd0sdLa55Lrx2ASX2sowP+4qeKR1xbl7u6an7mK4?=
 =?us-ascii?Q?AVZ8nG/2zwEkF43+l0ZDJfxucOFaC3zsp5rr6fyUMgIAs1u3bgUypF0+25ro?=
 =?us-ascii?Q?g3xjXohYqlwTYPFNk5YPblwX6Ua6IcGks4UwP+d4O9LVr6DdAvwkFtDUuBhl?=
 =?us-ascii?Q?eZAj/ErQsAILe02/5krnBc/WRZjdkwrk1e+X6MiFEWAghslqalE7DOIZVNZ8?=
 =?us-ascii?Q?01QkyOV5CUBwHv2XSYpK+D7bZ4G2M6h1nB6Cs0ekanUEBZSSXMSLDgsdIZg6?=
 =?us-ascii?Q?d/9Lm/zyZ9Bw7pwXJUJDeWpgj6XoiST1flPmM1AMsvQ11jqab2XhTRoR/FkF?=
 =?us-ascii?Q?PgN1I1/qkUewTSm30c7IXMozWEWB3c59+YWi8K54275zZeNE6oZJiqQkV1fO?=
 =?us-ascii?Q?EryG8qdRJgEiU7s25y2OHLOOcuMymsg4Xo80fLUecIq6Je44Ef+4tRS+PbUc?=
 =?us-ascii?Q?bLnnrTfw9XZwPnO1EtEv+DfmtbFOYolfn6l1eiA1KWXGVs260NnZZdSxhyDo?=
 =?us-ascii?Q?ATaU7jhTk7wwdAOeKbvYkZiZj8w9H/rb77xKMAVglIhBUCErhhls3jyEx+jG?=
 =?us-ascii?Q?a7XTEsyIbUBgPnBlqdCvkHVq6TVZcq8b5IJwUY1AB/R2nsjiSXresv1gD378?=
 =?us-ascii?Q?/aUyipjpEnpzRi/vpqZHrY7a+h/CiN7tBOhik0cgfVTdFyQw0AnJ+d99/oyF?=
 =?us-ascii?Q?RqMmx3e4/SqS7I/hir/Pn7My+9B2w5LJi5AZ2LSczr1sbSdd0NIvdPQyQP21?=
 =?us-ascii?Q?WzwD4pFBDexRXsAG/HWPR0RdRZdPBOICeg98oHGXoifxty/Wsw024KbtiLLK?=
 =?us-ascii?Q?AHgfpZL6qzjnGmwtG2TlLGtX7oRqDApWHpfPzU8tV1ruSbPBiSdA4p6UCTee?=
 =?us-ascii?Q?EDtyHoNWlPXZ77xJ9y9SKH96+EY4MjSplWuZ0MLBXbWq9kn+SlV9N821eEU+?=
 =?us-ascii?Q?M6KnamiIFRMsP7VmS43NlGxWDA1L0UqP4C6Z6y4I5H6C1NEvQAJVDGSg1bkW?=
 =?us-ascii?Q?d06oR1d2ZZzJ7gFcMhvhcuoP5tqBj3CRN5S5Dh66kg1hbKLST25TRg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RVU5xhhUeERERcTdNsPRjShYcJZfrjqra1h1Z/v0ZUHN00teM55QGnc/i75J?=
 =?us-ascii?Q?WTyT1AhgiDfc3QQK35lDnMQ4vsRNHTo18h06ghl+nFn1ih1Rdh5+HyjhrHun?=
 =?us-ascii?Q?C6Xj88wLumPnLK/jJINVGf9uzyOefoiI32NIFVFArs42JGGD7ReJhdvnKSrr?=
 =?us-ascii?Q?UQD2luHBhWpTdwNeTgF+P/hQbi7JzQpme/8SFIZoM3HjkRXq7C5kAyMNSA9g?=
 =?us-ascii?Q?shEk4uuD+csF2y1lwaVPENaAK4OJYIBSUgLDEPUHK9ZsWJVavt+0qXLavQNg?=
 =?us-ascii?Q?4h9VY5h10pjzm/m8J/AodCaSiDuBWTdli1IfMTR/8+nakm+OnWD9PY5CK3cR?=
 =?us-ascii?Q?JX2smCd+yMKLQuVSbbWtQzLBdSrHMWoWMn3dENm35SamtosfuzX+3iTw9T87?=
 =?us-ascii?Q?/o+Rc8ZCuhQ8S2lfOTWwM2sdKdPG+wdWm9c5HHfX5Wtx2n5Ibq0mkZ88kRqZ?=
 =?us-ascii?Q?xE9AjVj12CrPMAl1X0BJnQsRC2NjbUTdF62jVSVuQt6wfFvKdhB1AYSB8hO2?=
 =?us-ascii?Q?Nr+xZKzVIJfHiGSMA88UDyjaw9XVngw2Hgdst8bVTpVsETnzIddFvdl+QpxZ?=
 =?us-ascii?Q?/8cmITPrBtyn1SouPyL5sR/5qcGGM1uGs/14m9emRZYARLzrUp2mqmuqNJre?=
 =?us-ascii?Q?OCIg+6FadY9ZDk9qPiuCYCsHLV4Kas6+w6bcUisyeWn3F5/r4LEvrQorDLRC?=
 =?us-ascii?Q?cjU68WzqlQeO7Mktt6K77A3v8kDVgEy47udhVnTDFKRmjCdhTvvjYxc2AqWZ?=
 =?us-ascii?Q?3jUEAxhypzpOyHXYrpktH8f0LBO9FCeZsUHy8GwjBSPTdMaMWGRYIzvRb4Hx?=
 =?us-ascii?Q?QoI7ybnTXbL2hgrWIo3l29ZbLAtTPG+COe7t5SCoWLDjFGIU03YppRCJkpR2?=
 =?us-ascii?Q?y+kcYUpCPTaOpwltndfgZ1KvxDEU2ojy+M77rJoakhUhek16A0AMx/VaXusT?=
 =?us-ascii?Q?qWMbSnUqwRpT/USirG1I38jmogwydJf5bM5Si4QRDfiaPcKKyhC1r01/nlLF?=
 =?us-ascii?Q?+OH5l4UvikyjdNGLdLnd1csW1gRTC1lfySD1Bf5Hnit21o+SIdenM5iSXVj9?=
 =?us-ascii?Q?FmAKphQpVgwkfAoo9PeUQyi4Y+ALiCRIYgl8TpW7DLkbuytSbVuyIOl/xT5b?=
 =?us-ascii?Q?NwiV9QTaCkNr+C2fMVqC7sY7oyYcFuQUL08dgVx46JuEun0Veu4yzcBlT2N6?=
 =?us-ascii?Q?sbNYXVlDmhMoupwfTfF1dCzGZFxpJOXr14EStX5RFtrem5N+35CX7GNL3vpQ?=
 =?us-ascii?Q?clKCxclzA7KfyOhR44+CjFlAUnSYb6dLksjPXQfoRSPYSEZewVu71UNxtuzW?=
 =?us-ascii?Q?p7GCIPBN8RESpDvEd2eoN2iZTpOaCPenIfNj0bExasFcpFCMu1fnNT9wsMjU?=
 =?us-ascii?Q?Ge8qp9CX3XX6CUs8JtUrNxwM081S+G6B8SV6WsChL8nPw0mOVQ6RVQ9HvIKK?=
 =?us-ascii?Q?yiGKWdWCxu4JuajEo9QqlDaNhXfYwQhZPhTiCYm18GaP+zpbNFmRGvQOd2tR?=
 =?us-ascii?Q?GrmszYJPw55SRq5896VgNueyVeH6q6KJlcppSjf/aQ3JjV+GAN83pbqvZ8hk?=
 =?us-ascii?Q?1TfGAo0B36v2qNTgNU2fsgOFjJRLwTzn62KwQSZLVvQfGZeQ5I300zUntbFb?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f20e2ae-c2e9-4376-4628-08dd818079df
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:31:35.8410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISoD6dbwl9GsD1xC3yT4AIzLyXAB7fMjuNcIe1hnKFmijV8sNpER7Bt0v9E15p7DwoDwhdMLi/EqXJjZ14v32Nb2wKkmxgVqzMk/FboVces=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1521

The YUV24 format is missing an entry in the v4l2_format_info().
The YUV24 format is the packed YUV 4:4:4 formats with 8 bits
per component.

Fixes: 0376a51fbe5e ("media: v4l: Add packed YUV444 24bpp pixel format")
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0a2f4f0d0a07..de3636f1cdf1 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -269,6 +269,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_Y212,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y216,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_YUV48_12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_YUV24,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_MT2110T, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
 		  .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
 		{ .format = V4L2_PIX_FMT_MT2110R, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
-- 
2.31.1


