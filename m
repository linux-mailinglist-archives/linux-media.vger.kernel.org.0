Return-Path: <linux-media+bounces-33076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326BAC05A0
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 09:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B78A1BA7FAC
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 07:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F194221FAF;
	Thu, 22 May 2025 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="g6D9nxC+"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020094.outbound.protection.outlook.com [52.101.156.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9E134D4;
	Thu, 22 May 2025 07:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898782; cv=fail; b=IWEdjO3Tbrnjk5NANC7vB/9KYCjNyuTmWfZMp7ymTzS84ER1e0xm8J5qjXnfjxTtDe0zyUSjr6fFc1F+kJ2Duk/o1rubyZQJWmLLz/pck1LTm9Shp/HNlbYXppORNdMcxUT5NaiLK9t7VJdlh+OXK3EYUR63BtJmfaxt0xmEERI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898782; c=relaxed/simple;
	bh=zS3U4LYKJP5wYZFIXDm/MR+CKPdrZt1/BdkONemRsi0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qw5MhrQn3PZfG8DBpQWrzMsy6KW0fL2xTmwJQDX08CTi3xjjw5eRb56LxTyONHq96iEuvNsFzb87Ngrrg+qw0f7JL+3kzV/5Ynsr+sOw09RO4u5h+qz3dlQ6eavgxTqaFL6PowdraQSPgSbOgoszvfQyHQNOTrqgODV81jGrbb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=g6D9nxC+; arc=fail smtp.client-ip=52.101.156.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybOuIqVIPHd0WSK4HmhTTtB9g6UrbaWs9tPWchXg0+aR5WYr7ZpKBL+bXGL3Ja7ijzRcWjD4MwYkQQpCopd4i0v2n931ade8Ghg0CmZ4wEfK2gYEP9Im8JW7Taps2XJCDMWDo5gifjdE1w03Jqo6CRIq/Sk8po9yUE0/Okt4YGYovvA6JjGgyzfJ2769qD8ZKpq/00VgOcrTOaTt9ddcRGxT74+CPuJvfcds3iMP1qXuJ/42BX45tOtequmgELQycVFHeaaNYOYFzarnLu6LbBuBwyMjIVOkW3/guVRr1R7VdecgF/Yj2tD9qp4KjENd1oXftF+4EABNP3kBvTqWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOBn/F1xOWJcNCcayNgONTN+2jE0HroM+4LvoEmUWg0=;
 b=fwAyQ4Y8nJqqKdd0FxdxO6iIqvEjEjJi29IpKggdj2gyNSVWfmf8K+ncy3P/4ZoatyKQ7h3WkEOUnHHRGnoGp00Tl1NQrLCh5dUV+WoVIuVcpt3f+6PB564zDzbgMvmZT9RrklT4PkTte4NEUseKQCH8kSG9FurXRSg9x5LpNPpU6psiuMkW3FheN0Dnca36HsL9RUVVSKKoFI1Xxs2ag4GrnTLLI1jahUV7i4jBaNBp+8w2276LyMSATM5PuW/r11WLCWHI5wuqMCChWa0YdZjFBrqE7o+IHt/q2z8ID2sPAeJGJGdFyFvrhOno28d4cuEf/2S4sWlVYG+b47FxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOBn/F1xOWJcNCcayNgONTN+2jE0HroM+4LvoEmUWg0=;
 b=g6D9nxC++b4lvhff/RAHAcgZDmyaNUw9NUMlz8xvwqs9f0DPn1l2wzIPDkZhNIsaC0dzuHyUfvBY+2HH7HL+l2bOgdw+CCMySD5gTcZzhXQSlgsFoqykVuebIZRdc560EVJ8HMsg2X+7PLeK45XDbZ6JCZs/cf1IbpiTTuLd/lI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2273.KORP216.PROD.OUTLOOK.COM (2603:1096:101:155::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.21; Thu, 22 May 2025 07:26:15 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:26:15 +0000
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
Subject: [PATCH v2 0/7] Performance improvement of decoder
Date: Thu, 22 May 2025 16:25:59 +0900
Message-Id: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB2273:EE_
X-MS-Office365-Filtering-Correlation-Id: 071ee342-1869-4400-8873-08dd9901efaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FBVaIgyDIB2te4XjfNWvx6Ac7pLvBNzTYpvcDfCp8wUdpcTXJ1Fai4MM6HY0?=
 =?us-ascii?Q?5/k/0r7EN43u8+BLApik5KFkqlAmFEOPBVV4pR3LJCyZb4EjI7+DSqRedI6c?=
 =?us-ascii?Q?iGhrdWJ9my1SPU1rFx2h1Vjw/6iekYVp+N+TKT416MbUHDAvUSrk8PuHlZby?=
 =?us-ascii?Q?rE8wi1VOOXCjjQvSNyGhxg0/xLqrtcZg/J9km+fsrHcAQki3MU7DCXI732dK?=
 =?us-ascii?Q?oxBYw+sPgNZOFc5LS3icV49GzgnxcTewf/yh3S48aHtYtYJEe71wptm5lMGs?=
 =?us-ascii?Q?M7kv3ImkpNjvzUJmkOIBDOJxXMRr/r71Mw2afFkcoVI+Ah2nfedr0zUpBGsS?=
 =?us-ascii?Q?V1IBhhPe0c/qDTYSA7wIGRJJFDfeYYdIwIyH1injubR83a53iksI26uBFeL4?=
 =?us-ascii?Q?0edcKNlfSmWJ8l0rAAX2rSWoHO7h84gJjQmJpSSgbWNq0/VKpLjrkoKfeg9L?=
 =?us-ascii?Q?mn9K6pYe/pMlRFOoeVt8KKVhxBiuY5v1rGwmtYjHMOVhKO2kyhIkVnEaua0l?=
 =?us-ascii?Q?lYXYi648Mv0WzJAvB0+S9m19GTGBEPkpTOd/3Tqkc1zJAMTimX03OfdVXLfA?=
 =?us-ascii?Q?mryfZc7mYkBC3/5IA8rH/HZyHncFnnME3yNTSFAYyqixjwZY7uds/duTUdPR?=
 =?us-ascii?Q?JbNtmUh5h0ykv434yyWlaw4trUehlK+SWTgaoJZHBlFI6C/cmsmml0/jMKHg?=
 =?us-ascii?Q?EU2PlZAusi8clAgg56RW54wOIPIgzZBjmbuw7jBtWI+JxP0Fqp+8AW40N1Ug?=
 =?us-ascii?Q?MWTXFk46DpsmeHi8W6jNxTpiZGC0ks5s/FNz2QcLVvPRneCMWy5E8eNk8Wj5?=
 =?us-ascii?Q?dqYlK200DAJ9HpAz/k1eqN43V1IpW//ioHPOzfbmY6aHAPlms5DRinoclNIB?=
 =?us-ascii?Q?6WMzan4e5T0R+VM1uUrZ4H2KvlVr4Ru02+cLyadMc06YyMRV7UHPxKOMkcML?=
 =?us-ascii?Q?oi/TChlK5C+9xcRrsTRUnXhTtVm/Q7LDwvx8LXyJBie+uc27cLVAraG/dzho?=
 =?us-ascii?Q?QrhZopuwb0gLd9jsEd/AMuEqXjxjCvzLRWPJlV52r+mPCo6m2cHHr6yG5dB7?=
 =?us-ascii?Q?YJ8Rbfs/Gg1Q6f7XEa6+pU6xYRvNErGL6cHk74z/NaQ9blASkthSW4v54t6b?=
 =?us-ascii?Q?1I2xYLVvKA18lAoDn+U3g5OHWUk/RRGVWpXQsf8oSxzO5VKYiuYc/Gfh4edw?=
 =?us-ascii?Q?qpIdb+U9UAJXF7IdSEICW8fYzv1iPYDqJNEuNYNsTGS4EgvFBKYK0etSLs94?=
 =?us-ascii?Q?XnV7INAMCB/kXPZ7CLgIauz0J6Uw/4lWLc7pLkDNWaxgbI5hm6taPD/8Kpw1?=
 =?us-ascii?Q?j0UPF8ASjQjgx3yhU4iKsQOZ6jq0KnXOCrPIrcB/e6HHO+qMsGEOreiU/wty?=
 =?us-ascii?Q?8V8QR46sNPZCVIbmGOkzOCnEjVE7CO5RtS/PVwNPQqo16BDBY9sGe2t9Zzmf?=
 =?us-ascii?Q?cXK9Eq2QxJCYA0AViHO61xsR3owm2pjm6g4t6TBDnGmgPM/JpC+a1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TDzhCQW5sjKyti+Zj5Xn3LwI9mLJ8Z81TRgMC3dFR4r0rYtx8QKEBSD4Gq7N?=
 =?us-ascii?Q?lO0AlT+BFzdga2l2cXPrjtwlpboytkrdrQxHGVn64y1UUI2RTdAQPoZnjslD?=
 =?us-ascii?Q?cDcBXQJQL5bsyGrReufgpyeSC8BW8auA3VBNtxJtJLP8fa5pwz6Kn+a+Gqex?=
 =?us-ascii?Q?BU2RJsgvlD+LXif4kUlDytSuNLbuev1Xhokkxb4xxU4pisrc057hyyzWxGH0?=
 =?us-ascii?Q?4Ti8s2FGoq3iwxM2urLv4rUBuxE5xykCvXyl46mBzR39nagXM7P4A+Ysven9?=
 =?us-ascii?Q?WEliIyZUz9YUFMyZML1Ww+cztT8wJQ3ZgDR0rVn6pQLCYhYosTVToQTbJX6X?=
 =?us-ascii?Q?EoVJudozrHMVmOFiltLw+4IJ7sNzEeKQD0G9cnrfAsg1RcVJ8GcHQcOKuGuc?=
 =?us-ascii?Q?STWvZV5852KiHpubtDkMov45LpR9fz4hvJRJUNMnW9gqhkNlNqygWfHMASDf?=
 =?us-ascii?Q?W1jKoghVOSyPP2TjzOXNtfH538w7n/V8Ujq518KQITpJawNN6v19pp+WnF9u?=
 =?us-ascii?Q?EPGCoHJGtRyg7enYw4ihmi8bZpuIoOoRgCVSpz4VbUOOAYGRpvAC0POo4+Gr?=
 =?us-ascii?Q?ENARikYmexgkRUGljwIxSvMTFN97KAqhRtzVxdLOqyccKd/sf5zTbsBTHZm8?=
 =?us-ascii?Q?90DmsWqvi3nWwMJgPUHe/Q4Ied3eodwpS1VwE3QCu8moKfG9Av96tmMDm9xM?=
 =?us-ascii?Q?42d+AKBk3yqmhUprSPUwJODDZdaaWAVoILv1VNRpbGjElPwhkGHpx6HnIqTv?=
 =?us-ascii?Q?TN0g0Als8xsIJ8agS2fS60LNJDGrpixGfMzVFAD313SrO1B/7ZaTjRKyZGRD?=
 =?us-ascii?Q?WXkEZi1wDA03xZwoeBDBd7JB7lMOtl6BLXUDxqS1UvHMGjT+dguJFjd8pxtU?=
 =?us-ascii?Q?VphuXcPVi/k6JqoC3wUyOpJ2guKP8512VP+YnesxeuYUr81fX4CFk2tPhpe3?=
 =?us-ascii?Q?YPHtg90zggLvDsypTE1vS+jV/zg6axWnpO0US9tf8pQGQsVWUf4DVDEwvXe3?=
 =?us-ascii?Q?tAZBACRwBJoozp+3Vd2Xv+EdApPlvq3juh0/OoEjfkDi3zLbffPG6zpGW6/P?=
 =?us-ascii?Q?q1tlkDOsDC67iR8JWR5oI+LMSkSiuWO0GOVxCQibFwZCGgJnR+PbDYPKTeXN?=
 =?us-ascii?Q?34P+VrFu5IJkQT62qC/07IfrDhEEN/waydZNMjxFsyG+JHwRsgQ2Qg5Kc1gL?=
 =?us-ascii?Q?ppTe0cAnd5W/uNwiorz7lSrhmFCw2io+1RV9fZXF8dc28mCkMt4vT0y86/QO?=
 =?us-ascii?Q?AVJXsz1DwSl8RitfD8LI9C0NaR3StSOjKXrEY7CzMQCALcEjuN63PtMFozUo?=
 =?us-ascii?Q?cRVCpgPFA5AFzv4LljpzoknGSDISt2FP9wmIxVJfLG71hOyjKDqq0MOh86h4?=
 =?us-ascii?Q?GKlyetiq4TgUCVW6PUkzSkFUUwrcYf5OdBiNxWYjRZalv0kWkNVmEOlt9pSg?=
 =?us-ascii?Q?QkeDiBOgE2l09n8opf18qha4ftKD0tSKYtzHfL7gWMiuMKxIewrQRocq6KqO?=
 =?us-ascii?Q?C31KLjORmEQSDyR1LgxTSi2K3ZGGtBqNtCOo6wrlH+5n6dJTp0ih24EedAaP?=
 =?us-ascii?Q?j9QVnDMKMMagvLAaDl/WBAgL3hFl8BgPDWlX8e9oB3CfpAquHCR/doO22MBP?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071ee342-1869-4400-8873-08dd9901efaf
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:26:15.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elRuG0Jh5G3HAKnRzs3ERZy68YcnpNiE3GpzKbDD3s3+VZRv2/1FIu31r1Pklf2NeCjTJz3azqOU5YTmLM3aLKbDiUPOYwh94Wg7H7/srkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2273

From: Jackson Lee <jackson.lee@chipsnmedia.com>

v4l2-compliance results:
========================

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t

Buffer ioctls:
                warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
                warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 2 Total for wave5-enc device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0

Fluster test results:
=====================

Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 133/147 tests successfully               in 40.982 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)


Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 78/135 tests successfully               in 43.445 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 25/69 tests successfully               in 30.118 secs

(44 fail because the hardware does not support field encoded and 422
encoded stream)

Seek test
=====================
1. gst-play-1.0 seek.264
2. this will use waylandsink since gst-play-1.0 uses playbin.
   if you don't want to hook up display,
   you can run gst-play-1.0 seek.264 --videosink=fakevideosink instead 3. Let pipeline run for 2-3 seconds 4. press SPACE key to pause 5. press 0 to reset press SPACE to start again

gst-play-1.0 seek.264 --videosink=fakevideosink Press 'k' to see a list of keyboard shortcuts.
Now playing /root/seek.264
Redistribute latency...
Redistribute latency...
Redistribute latency...
Redistribute latency...
Redistribute latency...aused
0:00:09.9 / 0:00:09.7
Reached end of play list.

Sequence Change test
=====================
gst-launch-1.0 filesrc location=./drc.h264 ! h264parse ! v4l2h264dec ! filesink location=./h264_output_420.yuv
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Redistribute latency...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
Redistribute latency...
Got EOS from element "pipeline0".
Execution ended after 0:00:00.113620590
Setting pipeline to NULL ...
Freeing pipeline ...

Change since v1:
===================
* For [PATCH v1 2/7] media: chips-media: wave5: Improve performance of decoder
 - change log to dbg level

Change since v0:
===================
* For [PATCH v1 2/7] media: chips-media: wave5: Improve performance of decoder
 - separates the previous patch to a few patches

* For [PATCH v1 3/7] media: chips-media: wave5: Fix not to be closed
 - separated from the previous patch of performance improvement of
   decoder

* For [PATCH v1 4/7] media: chips-media: wave5: Use spinlock whenever state is changed
 - separated from the previous patch of performance improvement of
   decoder

* For [PATCH v1 5/7] media: chips-media: wave5: Fix not to free resources normally when
    instance was destroyed
 - separated from the previous patch of performance improvement of
   decoder

* For [PATCH v1 7/7] media: chips-media: wave5: Fix SError of kernel panic when closed
 - separated from the previous patch of performance improvement of
   decoder


Jackson Lee (7):
  media: chips-media: wave5: Fix Null reference while testing fluster
  media: chips-media: wave5: Improve performance of decoder
  media: chips-media: wave5: Fix not to be closed
  media: chips-media: wave5: Use spinlock whenever statue is changed
  media: chips-media: wave5: Fix not to free resources normally when
    instance was destroyed
  media: chips-media: wave5: Reduce high CPU load
  media: chips-media: wave5: Fix SError of kernel panic when closed

 .../platform/chips-media/wave5/wave5-helper.c |  10 +-
 .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 117 +++++++++++-------
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  71 +++++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.c |  36 +++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  10 ++
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 8 files changed, 181 insertions(+), 74 deletions(-)

-- 
2.43.0


