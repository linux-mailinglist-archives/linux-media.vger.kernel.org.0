Return-Path: <linux-media+bounces-47030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B276C5AE3D
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 02:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 712894E576C
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 01:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15A5239E97;
	Fri, 14 Nov 2025 01:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="SD15wRhX"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021081.outbound.protection.outlook.com [40.107.42.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480F42222B2;
	Fri, 14 Nov 2025 01:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763083308; cv=fail; b=mBBQ7hZm1pj8QuRXt6N/JKNpqPkGRR/EOPgsAk4A2FUEW2JeQl1xbMud3phjIUsowDAroFZEPiNT66GtF8522agIgATSzMpzEg4Ka2ns4DPRoOPeagtOZf501Wf9VRmtlTd4i5xdQAJA4abBPM/b19d/QsaK4V7UhUOFViynhMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763083308; c=relaxed/simple;
	bh=nHDivDgtWXqmn24GLH3rPhcRy5npgVNVIFkdtsyjLPs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HqwwzzJppdDXzxy76fwQiM7BhfLK3ZTPqxz6fJztIM7wuF+keFhBkbXv+0BTium7mZPzid0YYOg7PD/zlO5ecyO9MZvFxJEcokbiJofCyF7uSCnzIMjKpNaWIksaiyWwRCNdBn2RuBQoEDt/Pum837WFw3fR6EyGGemRSL+hDGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=SD15wRhX; arc=fail smtp.client-ip=40.107.42.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqDTNnJgOHELWr9u7eFzBmZfBIGeUSom+F7MXUN4IF58bz1mA83Ke+I2dP9UmMSYRfl4v6MndvR5nMdUDV3TxjogKfiy/VM7KhJZ+AunH1QKZCG5ODywbt44qq8F0fCuhE0hlzSvp3vlCLDrG2ZoDIqk5LLqixRzH+NJuMK5XRTXUlkl6LAWc5oLMr/tf6SiYxXvAhbJKNiqNIecENVk/h8gAeT6QUMIbL8ENM+SoaaqkCKX4fLmtb/4yJc4m58x7+VhmkSgUn494GAuajIHMQDuiRobCrzU7nsU7xmh3DJI9L780PTHo6K6H+6M2MuxQKH5UzXh+EudmJ3cqsVg7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZjg+EG3o4FRpwjoN3mtaiEftUShzpoOMj/TMduGAE4=;
 b=g0RwfuMETQR3cqzN6ckuY4LuwvVgvlWeIiY7ncL6NdT1oESrXX3RPK5IFI7E6VLChViZbUYvcPvGeXT4gOsR7HaL75RMCKvYeAGpDQnY8t0yZJ5hXj7oS7gWuv2zQy5Zchg3/JMHHEjXGdLdNkGHqaVi06kXIUXUJcm+Vr9RW4JN8DjLVUZJCX7bQDeHRhD9M4m8r+IRXYd75U0J0gdYepmhYI6lqy9LOOyiPAbNm+aviRgGI8/tfPoBmCRABa4f86wLh+di9+xcPimcUggDXSn2tg/m+RETCbh8B/h6FbjlrAIw16By4EprzkPcRl6XRTFvFcFS72OK9B0O5zDzfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZjg+EG3o4FRpwjoN3mtaiEftUShzpoOMj/TMduGAE4=;
 b=SD15wRhXIs82fBqbrdSif2JrGTsyt2nQJgveQFsmSQPLdeKxu6ViK4fsgC1+4asvd0PzPMHltkOKyD2lHZPrKZVn3RZB30v6/6Mmuer5HI9EB0GX+bOpGfUi4FdJnfNZBenjIo3nTp2rJrmHxzfCupF26X/mEZruQJ57lXqQFqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE2P216MB2850.KORP216.PROD.OUTLOOK.COM (2603:1096:101:290::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Fri, 14 Nov 2025 01:21:40 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:21:40 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v6 0/4] Performance improvement of decoder
Date: Fri, 14 Nov 2025 10:21:26 +0900
Message-Id: <20251114012130.59-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0031.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::10) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE2P216MB2850:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7286a9-9cf7-40b5-856c-08de231c2961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cW2ZIddByVrjjZn527vElSTEmXaN+t0siZIasVq3jaeBDVZh9SPZtOHr+bQa?=
 =?us-ascii?Q?NG/Yn5ItkMbM+HNGtcykcNju1Bztl/6rxnYKvNnnLurkER1k+uOZtaQXKcHu?=
 =?us-ascii?Q?wRFHaKfOwXszuvqW4sgntGvO/RFKMiK3Ee35PLFoFXGnuV28+VQ6YHL4p19M?=
 =?us-ascii?Q?IPxiOoONHXpV/wn3Iz8RoaeHOFOOLPdISXoqalBitmFv7bGoRu24+7Pp58Ns?=
 =?us-ascii?Q?6jYKoEvT2huhGisKiF7FK2DZdu7l96WjLBIApEHs31RTcLnJGpX1MNhR+zhp?=
 =?us-ascii?Q?jxs2ZWmzZaw4AqgKbJtPm42GzgcZ3dy6XHyVUkiC253WgHDofgkeJgSVR0GN?=
 =?us-ascii?Q?wTP22dJcjMZtLI+FCkx9fgPU/0zIEdEa5BvI0HY8QYx5b0bi1ZXr25bGiQpm?=
 =?us-ascii?Q?ihIbCYatgMVvJXDq30J6LEoy1yzQgM4i0v913HJRDoQ/F2M5CXoQLy54uXDY?=
 =?us-ascii?Q?9oDm742ncQIQS/+I5Xw5VB5FkAW/mIeze/hxrdz0PWm09fiDO+rH2XgfckYM?=
 =?us-ascii?Q?fpTMqTjRu38D43tk/SwRcGqFyiKUBKelM4EVQ8NDh8wHmXq5OX1CyR7kVeOq?=
 =?us-ascii?Q?NQFio80HENb3fzFdPYuY0Lfpc/InEygZIePC5jU0LPeJLRDhUaOW2Kaa0jGq?=
 =?us-ascii?Q?QOnUS8nHWYrewpfzTMb4VTu/v/H+Rve5Bn1SKmXsnyqAgDIDGw/jZyAG6caE?=
 =?us-ascii?Q?99Co7JX2lnQZbH7nn27rJjXaVEH1Y9UbsEDeez0IP2LvUMjF/uVowZSr3QfI?=
 =?us-ascii?Q?HoKon7fI9cQ6/8sSS2vYMYE5SRB2RggcPhUDk0P60CqEK9e+cbZC+oc1vn/8?=
 =?us-ascii?Q?vUdxiPrljUHdyhNLXz4Pike0Y6leKj45O6M9B5fpus7wmSjacBYvUozsVnp/?=
 =?us-ascii?Q?6OmcmHitwg3h4bNNjZHfL3D4cq2TZ5+IHzddPjRjKX1+mhH0rAIjzbP9FXda?=
 =?us-ascii?Q?YN2ANhLcXa8PEXvJXKy/8wADjPMKIhYxTKcxxH96cgcBdKNMDBU3WCON6OJR?=
 =?us-ascii?Q?i/DMMbiBmhayRWDXP1z1FFLKSZxTAYDEky5klu4cQ37ZSqkp+vDMiePzq1x1?=
 =?us-ascii?Q?vEsL3/pNqvTdxhtXfGvi/wLnQW0GVZXtXLA2q+TeDGpG1s/oUnWmBIGFoYBJ?=
 =?us-ascii?Q?aBX5u7v8C56hpsl1jPPFnGhGAB7zgnDh4hGH4s8GkokGuT3I4S5fn4TokUaG?=
 =?us-ascii?Q?i29pAW+RGYu93OpWEKTLdkvdjZ+DHfOsbgOV7GJP2bYkTsUkuwTZwTEycjzo?=
 =?us-ascii?Q?5hqceIthRCRNn+NSDnT2HF05mueVjIZ5IUuQpu8T2KcDtT0ODOnfm3wsOmH4?=
 =?us-ascii?Q?cHoG20blVbzuA9To9zdUu61yN6IDPH/SIWlhWd/3/hWqBlaMu+CNtiqRjyT1?=
 =?us-ascii?Q?1DJ1W1rx2gpswfriSZiEDcz3mC7JTHl+K7ftQIquoiLKdlU8AseRQQdFEFGH?=
 =?us-ascii?Q?m7JRRd+a3DtqL51gzDKE3YCjU+HvD4J1ZIobo637nQS1/eB2Crq4/xkKPSem?=
 =?us-ascii?Q?vP+pcX3EslN8GpmqMPWT0i3UhyVIWDr7RQjc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GhIZH9PNZeAA+eIi4ERYs26WKPNE79AO3pmg18YCv6++elT/cST+MHfsrzrE?=
 =?us-ascii?Q?nowMhVkSyaS5dtsh0SVMaElnMV7QxUSCz6qujc4MoiMeIZv5f/pzvjmOyOQ5?=
 =?us-ascii?Q?TfjgYHnUpeHGffaahROMSfj4pfMK1aMLLO/5oJnbMCzmQaL4Vvp/ZvFBxI5/?=
 =?us-ascii?Q?e0crkQe7p9BBS6NF2wxMjCMACf2LKsinUU90VBs3DSMYkNF3+OYIahxBiU5t?=
 =?us-ascii?Q?5lomHWbPtLnViwREsyiu6yK8zhDhTPdt//MANUqLYsiXopX2scOXa3FKBEH+?=
 =?us-ascii?Q?OTJTLZ7Fcx9AePtvZH+pGOfbG13/Vb0q3zSUZhgTNQV0swVW8bqa4HFcvXlF?=
 =?us-ascii?Q?GOGc8c0zfafJGIiVP/4EBWFpMyAyViYuo06UQAFylB9keE0jl+97IVfoWa8S?=
 =?us-ascii?Q?mMqYnD0muS3oe5jOy9Wp4Haula1WmI9igXV6JyOcNYB3PDCmf1t1BL1qZeS5?=
 =?us-ascii?Q?rHCVCqB58c9lonM0kHvzwwX3/jgFuYWd/q/GquRRVCwJO3mPWXS6BpwDRuEg?=
 =?us-ascii?Q?YmPGTEgg8DDih9RF8Q8A3DjFRPpN66IyAD4DG4KbmPCQx8AnOldyXFere2eb?=
 =?us-ascii?Q?ZgghZ3ZWmplYdWH5m44DUBWfV575wO7rdFiNAH5qi9s0ZH6OcOsBr4ENVAvm?=
 =?us-ascii?Q?wYCSMX+5XCGfBx50hciLgs1LO1UwE0GaBVxHbDNbARkXM7bM1DYwohan0tQ/?=
 =?us-ascii?Q?N5quTPzMtqbFzC44h2L2r4O37x9yJcVF+2ZJM1MfLvX4NRha+R+0iqVoBfvG?=
 =?us-ascii?Q?ab+d0eEpgLWmugnMdjTsmYPj5raflC7O9E1UI0Sx4rgxn5FdZiV6D7Eig2VR?=
 =?us-ascii?Q?7vHaOglMhBv0q9lHkskOgkXi7AA6DSBvWWPosMgdwyQDropzID57Vh3xr02t?=
 =?us-ascii?Q?v84D30z9c8KyXDkObsDFb/WRPDW3Dr5qf+zgzt7ZOajcy5oPQMkX0EcIqWdQ?=
 =?us-ascii?Q?clJ16hc8F3I1UsiPQYNBAM0UsNCw2yr99iImRQQyAkX0GyRb1wH1CZXztknC?=
 =?us-ascii?Q?vVLpA1DTUrWNc7T4bkoY84Xvi6Bww0mWcRa927NWxEOBFUj8rPLzoY6gg8GA?=
 =?us-ascii?Q?lZ+aMiIQRNT1ac8yJwAs/XgPbiSXB2LY0i5SqKyrUEWlIOAJRxRO/A55GyNQ?=
 =?us-ascii?Q?GB/YE9T/X8JWfeE3CPgFFw0gLoEFpGK36KrfdT+QJmPydo/51r7E+6kpA1bR?=
 =?us-ascii?Q?AWva5SmugsRiCYijbk7zyiGGMKtQT2cqqUAtqum2rN6jqhQE4/6fYG/COTjk?=
 =?us-ascii?Q?A3CQjY5zveWjNYBGEmSJbRGdPwDR5bWW8Y1qKafnd6ZU66x4N0ZxI3oHaXyX?=
 =?us-ascii?Q?C+pvBGtepH4G/jESoEaTMqbFEWkdJA0S3QxuKneoIOKyIrm+hmILxDD7txKV?=
 =?us-ascii?Q?VR3fOaJbgYfcdDczVRcbIhcvlWvVTZQ7rop3g7WpWlwkE3DzDiJ2GDQzZi9M?=
 =?us-ascii?Q?GTj6BHpFi/5SB4M6g6ZhVN+p7mUbegkbf/u/rd9CSWZ/F2NorbDTvUF7lZnW?=
 =?us-ascii?Q?e16wNX2OED42hk2xkB5wEfwb3lqlK/qgGjoSL3ix9BdfATr7IAImOh7TqSkb?=
 =?us-ascii?Q?L1jBdwmFBeurgOFByvY4BAmJWnSSXU0wu9TMpa6PbAPp6Tdd2+wCPa+pDS8t?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7286a9-9cf7-40b5-856c-08de231c2961
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:21:40.7307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvQWiyixpNaKUMCMoISs3xA7shxPAX8dOnpgmYlks8MdSxY/kNyo831ZqtSsWCxH9BUktXLZWXJVwqcslC1hCyDxgQbnLxmVUzn+oIq78TM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2850

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

Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 133/147 tests successfully              in 37.043 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)


Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 78/135 tests successfully               in 41.820 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 25/69 tests successfully               in 12.485 secs

(44 fail because the hardware does not support field encoded and 422 encoded stream)

Seek test
=====================
1. gst-play-1.0 seek.264
2. this will use waylandsink since gst-play-1.0 uses playbin.
   if you don't want to hook up display,
   you can run gst-play-1.0 seek.264 --videosink=fakevideosink instead
3. Let pipeline run for 2-3 seconds
4. press SPACE key to pause
5. press 0 to reset press SPACE to start again

gst-play-1.0 seek.264 --videosink=fakevideosink Press 'k' to see a list of keyboard shortcuts.
Now playing /root/seek.264
Redistribute latency...
Redistribute latency...
Redistribute latency...
Redistribute latency...
Redistribute latency...aused
0:00:09.9 / 0:00:09.9
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
Execution ended after 0:00:00.100759170
Setting pipeline to NULL ...
Freeing pipeline ...
root@j721s2-evm:~#


Change since v5:
================
* For [PATCH v4 4/4] media: chips-media: wave5: Improve performance of decoder
 - reduce high cpu usage while playback adaptive streaming from
   streaming server

* For [PATCH v4 1/4] media: chips-media: wave5: Fix SError of kernel panic when closed
 - fix kernel panic when printing a lot of log messages

Change since v4:
=================
* For [PATCH v5 4/4] media: chips-media: wave5: Improve performance of decoder
 - fix the error which the Media CI rebot reported

* For [PATCH v5 2/4] media: chips-media: wave5: Fix Null reference while testing fluster
 - fix the error which the Media CI rebot reported

Change since v3:
==================
* For [PATCH v4 4/4] media: chips-media: wave5: Improve performance of decoder
 - fix crash and dead lock while testing seek

* For [PATCH v4 3/4] media: chips-media: wave5: Add WARN_ON to check if dec_output_info is NULL
 - update commit message

* For [PATCH v4 2/4] media: chips-media: wave5: Fix Null reference while testing fluster
 - add thread irq logic

* For [PATCH v4 1/4] media: chips-media: wave5: Fix SError of kernel panic when closed
 - add Reviewed-by tag

Change since v2:
==================
* For [PATCH v3 4/4] media: chips-media: wave5: Improve performance of decoder
 - squash v2's #3~#6 to #4 patch of v3

Change since v1:
===================
* For [PATCH v2 2/7] media: chips-media: wave5: Improve performance of decoder
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


Jackson Lee (4):
  media: chips-media: wave5: Fix SError of kernel panic when closed
  media: chips-media: wave5: Fix Null reference while testing fluster
  media: chips-media: wave5: Add WARN_ON to check if dec_output_info is
    NULL
  media: chips-media: wave5: Improve performance of decoder

 .../platform/chips-media/wave5/wave5-helper.c |  28 ++-
 .../platform/chips-media/wave5/wave5-helper.h |   1 +
 .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 177 +++++++++++++-----
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  98 ++++++++--
 .../platform/chips-media/wave5/wave5-vpu.h    |   2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  68 ++++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  13 ++
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 10 files changed, 307 insertions(+), 91 deletions(-)

-- 
2.43.0


