Return-Path: <linux-media+bounces-29832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 787DCA8373F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 05:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B1407AE4FB
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49A11F0E24;
	Thu, 10 Apr 2025 03:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="kQ742YPB"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021108.outbound.protection.outlook.com [40.107.42.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ED94C8F;
	Thu, 10 Apr 2025 03:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256417; cv=fail; b=gypw7pu2XCroXRIhsmCknFHqeW85hlcitMTVG0SIW0cW7dYZj13t9EN1TD6MoPGRy2MYdTCXhwD6x+qiybGPS+Xl8wKEU0Wj9SFJ0Ub+rRXcJjoP9LKwVINZf/kRpKqKPhWwM9PY2DaUJMTjO7SiS/hmtezxr1lotF5KaoxyRcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256417; c=relaxed/simple;
	bh=Ew1p945uBxa3ssobd2UchAVJlolaff/iNIC2bTRp2gY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MwOqSa+j+P3EM53VY/1mu1ue/5TP+bf4qjfzq+mf/ATWQM9GE0eo3fG+BhkiTpxsZJoXi+xNsurZi5CObFT/m3Ni0zWathJPGEU0uAqxVnhpcC9knc8flqFMmB0YUQ6uYu9fsKhfMJO9WRxzt2tOrfT9mTnvdZHWRZ1wZdHnUPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=kQ742YPB; arc=fail smtp.client-ip=40.107.42.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VC8LwjA91KDB90zxC+IUwmxJkss8qMbl7ck7UuGW2yZiO3CCqF1NHkPyLIsirmSrGm9xkdA8bWBnhn7GP8bgt3//SmbrDklKlET0UltQxk8IGOgMPNRT77ZzwAIOJQH+r2Bq0B93jFYssim39IYwuuzOUa09v+D/PfFMBUcuUtKUdyvBaDFAgEHBFjWLsrYMWxJ4lyNs4ssMr7j6NdwFY2KVyIJbJEHbTe3NzAtWP8Hn5B+O3DYi87jBLBn8WONukXk4xS9am6MPPh097LpOeIg0f6oYDRwu7B3lx43WwV008vf+ckgHPzZqZcHtyVOnYRSYB5jCOgMIohrPtf0Yhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBbtB2YK1yc0dnvOWnLHgXx+WhDWDb/yGFq3t8ECEw4=;
 b=tBe/2Y7KvjjogdAoEXlgnJ0VYgOtbS1lvABDIo+rAZ6vqziPKKHkzer7woDjGQpS10BzC5L93mtiRHPkdOUam2m8FuVRXQzcgasUwcfcXokkDdSPZtGU7kMAYEYZN3g+9Hz1VoXW4cuwOYKM+JcAGQUANigqrS7Pml8QdSpl5vjoAHv2tqnfuJaewBLV6QRZ/CmntneswStpOjKuKQqxQQuXM21YqAVUC7G0JzmnmldKNgJQgbQ56adGdXzf8RfatwLNaUU3eQ0eL5dJpKsnsFW27A8U21YIqSlO3o7DZ6UHfUNAEKTuMeZYlggni3hX4lG/Bg3/SXQn+LVMGqZ7Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBbtB2YK1yc0dnvOWnLHgXx+WhDWDb/yGFq3t8ECEw4=;
 b=kQ742YPB4+Ds902QOL/cPp/6SF9oAUJd2MzwiP3SeD4bkdtLYIuZXPndkIEgRW+oQrWSIpLYnlU8XOoyyax/z8fGqEUl+o+t+WzZp0pcnedh782kOd6C/XqDS5Qv6fBOrVRe6dMdoHiSzJDDz5Pt4LfBOdY1jrgiTmz/9jI6PkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by PU4P216MB1439.KORP216.PROD.OUTLOOK.COM (2603:1096:301:ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 03:40:10 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 03:40:10 +0000
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
Subject: [RESEND PATCH v1 0/7] Performance improvement of decoder
Date: Thu, 10 Apr 2025 12:39:55 +0900
Message-Id: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 8523dded-7e27-45d2-de17-08dd77e1653f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rc1C+NoVWwh1G+t3AI5vaQikRdVcgozcSSgQJrgvKkHV7wafKd86qMe3MQEi?=
 =?us-ascii?Q?7/fF2hfY7JEnGOJM4CceQpBhKv4/2GwRoldrHMVAKzkZz7BtlkjmCxTZFa7T?=
 =?us-ascii?Q?fvncVxgYB0K4onW8Yu9a/wJcOIwssXWc7Qa0b/vmqA70WbCOs/rYrjeu0GS3?=
 =?us-ascii?Q?tI/XsS4DLNEj6ZbjHkcN5vECJJK8/47++hGdgNjG5SA5dfWppeLht/V4+Ibf?=
 =?us-ascii?Q?LSb8M+99rrjcZayK+tlwVLYLe+e/3wDnmjX1bkzR4thGNf+Ff32gIsdGr+dl?=
 =?us-ascii?Q?hqT68OZmlHCMDeNgQ3bR48JLkMBNtGa7aVSlC7zseoTRC43zK43UOQ35Y7yg?=
 =?us-ascii?Q?NuamaY4y95e2uUBccwKxByCFCL61RbC8ac5GH8qYQUxcGRIN7pDr9L1h3bsW?=
 =?us-ascii?Q?RGaXVLFWxVDwDUXJPJGms+cLnD61j7Bm3diMjV3j0PbEjhJSAg9WtcVczzAp?=
 =?us-ascii?Q?mzzAztp7mmf/ncfjP9W1iZ9outY6BDFQio8U+NeyVuy7F5OzJEn2jKBNeEPN?=
 =?us-ascii?Q?mVG0OJV/7T23g3oyP33nG+JpFStzSOQ0YJiK+eOn5qK9w8cTomlwHxUJpu4i?=
 =?us-ascii?Q?ALX9q7JlU4JcOAGI3sga5osfqmDWqh4do0g0DFvQR2JeN8XCl2dtVTKXn+hq?=
 =?us-ascii?Q?cphp42hVG0OgDiqE5Xakd0zzWRoDJWhDeaAF3WcBm7KHwM3pHuGjfg0yIviu?=
 =?us-ascii?Q?wM2wu12rM+pk084FT0e8mpWnzrUBPjJsq0atbeEvnBrvIVSmMNjgKIFWQkSF?=
 =?us-ascii?Q?qE4nS1VpKq45j7ugAmi1MoU9HUXUged2VgZO7rNaWPV1pZ852LUK5Fdtvgoi?=
 =?us-ascii?Q?Rb5xM8brDXzrT2C/qx/RK4l0xaHtqD/nkWs4/elv1IYOTZSPVKdgruTjbVAi?=
 =?us-ascii?Q?ReO1Nb+mroj11vRs0dzcAPwpTbZyJIGKWInkim8p7lGOzfl5bLEfZtS2GSFa?=
 =?us-ascii?Q?P8IIHpho5vI2hSUJRmrXmDoRNfEF5JQyZAHEzygl5v6j4Ygk/uUWAYotXcBU?=
 =?us-ascii?Q?06MVXZorqPRReKSzCkHVRti4zyEnuhwFd6NQRVdc0qlAEjD4ZxFZH1nihcAt?=
 =?us-ascii?Q?Je9FY6u5ITKMYNEfwT9JmvjlIYvSAAozguMkoifyM123xQ2kij1OfatMvOxF?=
 =?us-ascii?Q?Oa78qs1YNYrhriKl/GW5LC6LNhWKDA1TlIAVdfEmDKJ/J6+Rs2jTTlaFZnLB?=
 =?us-ascii?Q?B8a/MvusrsVghnH8Bu0gwXIUnXntIIInMnarHcHUhfpPF8AwJTIlxTfQZbBX?=
 =?us-ascii?Q?tT2A9eBD7oo3PGAck0jx2LAh8DVXCLqAul9Dx9tPy/CkFcH6HvIMosrDCfR7?=
 =?us-ascii?Q?u55Q/D+5W026+p0phZMXHFDEMwwF6vmCMcs2+7nT07rP5zrqvX+keMya+c2n?=
 =?us-ascii?Q?aTuSS3XBIOKjm2ed8IE7IBzZP7a8TbIojwaxYDIdtuAqLwUZDLr+NG752EE3?=
 =?us-ascii?Q?If1D2LQXGfWz1yx3r7WfS82aZGVyB9hW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zUWYtdGYimUsgVcljc/nA/NzPU2q2QVb99O28n6FyOMEq54F3fbWFyxzNcnn?=
 =?us-ascii?Q?z6ruNpbbsCcfHlWoG5OhDcFJWmrefaLzFR6rMcSmkLLjawEPBoGjIfUaqk6s?=
 =?us-ascii?Q?Y+/jLXCOePE0H7UOU5scS7lFSTU17p1btXg9KVMFsuA/Qs69AFihGPp9FYa2?=
 =?us-ascii?Q?BHP04Z/qRLAGWOIapshQO3cWK8Fk+UJPyV1KC8kcWMgot/AJNAXGwGY/Bb/P?=
 =?us-ascii?Q?VspaPI5/P47IrQIVWS9dbPcrXrRWbpcSeWMQb29RppTEnxZfTKTMNiZU20C8?=
 =?us-ascii?Q?VWzH1mz+MT2VXu3ZfsDaNISC9rnKhY/HBHEFJrxGa/1uZgZKPhyJXPmdgi8H?=
 =?us-ascii?Q?eCB7Xa1lrxbDDmx8Vwxfs0K7UUZ5yzkt8BUm0fn9TzKrMm45eYhVD1EplFhC?=
 =?us-ascii?Q?JrbdouInPTtPCBW6RLNmeaSo/UxPpkTf/7lwRh8pZxudfEglmivV74SP54zy?=
 =?us-ascii?Q?xJiho1uYv1QzE8uafeJx1fnZW6GqmzvA35jUf9BIVET97NwzNWF71aM1zata?=
 =?us-ascii?Q?bAXbnHnJbgG5n9/CGiz9Kga1YSXhJlpLwDwRBJQJSNubEevkGDEcUy4BQctf?=
 =?us-ascii?Q?20sytix6M+fpThNuPIVt+Udmm17V0v8iBsaeQT4QwTXIay35NmgD3+gwFqOd?=
 =?us-ascii?Q?qGsH+LN2Sy5gxVHOcfuH5K0tmZoii2Ro4VZT8GlatohWljNiPCbIlsDFj4g5?=
 =?us-ascii?Q?O/G6/XJOBZG0XGlPSZ6RhHKE+GcBruu/aftE1uFMH0NAfaKOP3nd3lMSV92L?=
 =?us-ascii?Q?EM/20UgWpmy4F2Z4Ehk9U0Ttd/nYLRMmes3daDvg9HVoFdcdOq5AbWXxd7lC?=
 =?us-ascii?Q?Yp4soEGkgFE69eZT7usirncsKHbkxOUqwluAowfG8Ea7OvEPu3Llhoe3CtgM?=
 =?us-ascii?Q?Oi6sunRaa7fwVQmWygWLcE7NjtMinKKlFnWIILPSX6HQOWeoW6swD36lUVa4?=
 =?us-ascii?Q?spo7jIHVXlvNpdHP4MxtBQBZslfTy3GfHTWMKZw1eH1F8r7n6OCqPE9JryNg?=
 =?us-ascii?Q?aMJ84RSPjjLxw8zt62oM/ZdNYlCMKX0RnNT/lNlHWKXiqxmGxTLsFHsFX6JJ?=
 =?us-ascii?Q?H42lTwhbTCloWNivtWN0sqMXsjn1jLam9kgK0N/NzcihqltcZSNi/4OVbpBw?=
 =?us-ascii?Q?O1n/rd3rF2SOaBQwjX6jSiZKxOKmPExmvuWnHcBKZYHXOOWkbMEzBDBu72+8?=
 =?us-ascii?Q?x6go8MWAoMMvNU2ynwGaubAGYGk0TIXm5NbV1vsumyAJtj1qfMuFkJG0jMfv?=
 =?us-ascii?Q?A8CFQBXLZ2Py3JuGVgwtXE5De8uQBF/43ZFzgBqUN58Nyg+iWWRmsBPu1yL9?=
 =?us-ascii?Q?KDKQxFBowvZSrpr5JmP69a/rBKYW9VqsXZv2BWdGwCXPYybNcZRcFmiajTwJ?=
 =?us-ascii?Q?Kz1jYPxx9apxnOGUZ+T1yCqHdCft5bRP5Bh+GGQc+QzkUX36aE5ixzLTynvP?=
 =?us-ascii?Q?bzHg+66rfWrK51hvEbXJsJaSN379/9CXvsPz2rGL1gZLmayJHyHQf8NEeGXW?=
 =?us-ascii?Q?96AT3RidH1Rhm/flKLY6XPMr+T9MEGovDUFzqQtWmI1Q3wvMNAgVxBZ7SWrc?=
 =?us-ascii?Q?U7cdeIemulIZaKwndhq0zL+4hVpk8fmQbYYnA4/KngYK4RJANSkj2YQk2xix?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8523dded-7e27-45d2-de17-08dd77e1653f
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 03:40:10.7924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/YwNZcSTldFi4RQli3a0JFL1UTqG6QcuUAGX8C1KZuf5uz4DrLjpdzA1pf0NWzT+wYTTEK8b3JxdWi9OUFzIJ/1faIQdG5zZVixZvsMDQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1439

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

Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 2
Total for wave5-enc device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0

Fluster test results:
=====================

Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0
Using 3 parallel job(s)
Ran 133/147 tests successfully               in 41.629 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)


Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0
Using 3 parallel job(s)
Ran 78/135 tests successfully               in 44.578 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Seek test
=====================
1. gst-play-1.0 seek.264
2. this will use waylandsink since gst-play-1.0 uses playbin.
   if you don't want to hook up display,
   you can run gst-play-1.0 seek.264 --videosink=fakevideosink instead
3. Let pipeline run for 2-3 seconds
4. press SPACE key to pause
5. press 0 to reset
press SPACE to start again

gst-play-1.0 seek.264 --videosink=fakevideosink
Press 'k' to see a list of keyboard shortcuts.
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
gst-launch-1.0 filesrc location=./switch_1080p_720p_240frames.h264 ! h264parse ! v4l2h264dec ! filesink location=./h264_output_420.yuv
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Redistribute latency...
Redistribute latency...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
Redistribute latency...
New clock: GstSystemClock
Got EOS from element "pipeline0".
Execution ended after 0:00:05.772414400
Setting pipeline to NULL ...
Freeing pipeline ...

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
  media: chips-media: wave5: Use spinlock whenever state is changed
  media: chips-media: wave5: Fix not to free resources normally when
    instance was destroyed
  media: chips-media: wave5: Reduce high CPU load
  media: chips-media: wave5: Fix SError of kernel panic when closed

 .../platform/chips-media/wave5/wave5-helper.c |  10 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 116 +++++++++++-------
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  70 +++++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.c |  36 +++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  10 ++
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 7 files changed, 179 insertions(+), 72 deletions(-)

-- 
2.43.0


