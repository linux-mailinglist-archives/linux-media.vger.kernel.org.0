Return-Path: <linux-media+bounces-47350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38292C6CEAE
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 07:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id ABD7829390
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 06:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AD131D758;
	Wed, 19 Nov 2025 06:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Xchg6U28"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021073.outbound.protection.outlook.com [40.107.42.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA5131B829;
	Wed, 19 Nov 2025 06:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763533571; cv=fail; b=Acc6DYpuhK7gv3l5/QopAnTE1tMwysbcRca22sAA/eK3gcmHSc5fLk5KQpiHOvXOxPrTy1O1/JO2AgmZObzm6RJXtZbxbjBMTZk+JCBw+1Fubhye6SHQ/iEKUWCWmtS9UtcRgQMZNEDkjHW598Ac+N9S+ZOSdys1JSn2D/YAa1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763533571; c=relaxed/simple;
	bh=P9RZypgXQH0TCpGyaYEqUQwLYQW1XmT00LfJ1QAOMec=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Zvj+8DCPEEPC9M+jtFm9Oxc1lRGGht1HsQsv27weeeiLw27HG2CzPVhyYU+CouD57aesr4ZnLtx/WnO08cZq6c7BiGoTrvz8KS51Pv2gmHXCCsx3qYkZKwMBdPpNQ4Wcs9K3kzfOGx1XfiJ+OPQHCQCZ1BDwp3turIgOutscaNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Xchg6U28; arc=fail smtp.client-ip=40.107.42.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHQki890ZFHoR9rQh7Gd9ZEcAGQTbn1qrCVYIrE9ngquKJm2XArGcL/cgH1+MgULAeNFIKHche43hROGADheOmF2+UWJ9A+o7tHUA7BuzxXwUi2UN73ahfLRp/iCBusNPXzlgH9lyvPd6vGrrCpqYlk+d9wZK8CPGUkmQe1RDPhphTkCVIMpCXsD0zvHBdHdhri28C3QWZh99IQrA8YH1jRmqKEqiUxKj08logLqrAIbi2tOfqkOWgy3u6fnMoJYcG2af2DhN4upw8CPSkq4wP6C1ezo3VADNjT8qEafQ+LGnt9C0RTowrnGCpqXLahPU4B8lOE3q5SNXyTC//XQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwlN1TbCwLqLL5blYDFuSpGZlOZ5l6kFKWGm5+jTtB0=;
 b=FIkBDycXmZX4gOcv341I056+YY/l/ineFMZcg7S9WZCYZEGSRcf6ISmJIbkLwS3Dr3+GZfIq0yYdGooQi54O6C72heZrcKvGwrXVv1hz1ZS8Cp87pnCCabHU6fV2wWbtgikIYNoEe9+VVp6m2H+8NX5fBbFuorgyPSK6CNnRaJfCMGMHRq6jmUyHBDFXgueYrR0/BKO5w4nkleK1qSglQnA9AgoQEciXdzhmDRk9y7jMLbjnbTjXADbRKRMoATrvVRtFjrdbKkyD7/D4EiIqG1fLN47TF/1d4Hl2kaJhkCounSs4jIDQadtOqr3C/Zwm+EwolZgmBVq5wbCJWSzyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwlN1TbCwLqLL5blYDFuSpGZlOZ5l6kFKWGm5+jTtB0=;
 b=Xchg6U28s0ZNvP94EutzWBhO+5o9Ba+KynDUZl5m5JsH6+jhSgXE1y6xQjPFSJCkSuREF8d6y/TgWIi97dKKHSTiSepgTocxqYgE5qbnQWV0iTCKOWKMhVss9OQnaj78UkSPBc3InvxBO0rBqtMkFK91cLMmdRlq0aIdGgRFlbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE1P216MB1996.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 06:26:00 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:25:58 +0000
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
Subject: [PATCH v7 0/4] Performance improvement of decoder
Date: Wed, 19 Nov 2025 15:25:45 +0900
Message-Id: <20251119062549.51-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE1P216MB1996:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc5fc90-166e-4de5-31ab-08de27348077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/p9bXdsJURL+05h9T9Dmp/O5u7qnJILUlGnLqMN0HUUl1iYRgXihN1KV2+9J?=
 =?us-ascii?Q?9VSmJhb5/K2wu8rl4ElbzjCfZRKqMseG14K1fprAm0epOy0NLdI70TpXQRMB?=
 =?us-ascii?Q?+6kcyGQd0XgHiifQW0n389His9gJDwrMVDsHxUxmQCGLJ4Lycw/FOZs/KP0g?=
 =?us-ascii?Q?/n1i0yHaejt2aCCOv3g1apBj0uNyRXrCUNJyCXqJsw8bmrLcVLbmFkPd2fRG?=
 =?us-ascii?Q?NapoEvDqlQ8TrdqBHsxl+SPo76HY60c4v2C9sDm4odmccWR/C2URJnz28G32?=
 =?us-ascii?Q?HpeiUQnvdt8tfyKc2fRxqGkRtIEecjMWts2pUj+aboD8bv4Ll5vewprJK2y8?=
 =?us-ascii?Q?gPSRqiSKScwF9hBrfVIRwyP4XayQlOH/W7RhFsEwBkGAxu136KtcFu64K0Qd?=
 =?us-ascii?Q?/Maku4exz1+oGOVWfAxvzwfKVVYO9m0nVBIoX1unpiK+TMmMt3aD1k2pexmT?=
 =?us-ascii?Q?PrVnng99b6tOd5I2ZZEi8uChGBaEAvmBML1x9v+9BorWpoOAK9bB8dVVScAI?=
 =?us-ascii?Q?VE+Bpwc7tF+ERYOUXhQ7S9zgw/wW8PSEFTJeSQx6lWUsp0AQfVfpLHbqdNJZ?=
 =?us-ascii?Q?ODVhCmQ92x+73BaAuyHMtw/DJFpyY7dmtvbykp6GxIs0P1hR1x4dWncF1fgd?=
 =?us-ascii?Q?1uPDcLBTtJHMZaXy47OFuz3AP6IeU754RMgy4HXAlgJYok7LXERUNPPMYd8e?=
 =?us-ascii?Q?4a1VbgqWm5FI8Vs+3WtKJKnjUHsE0d1OPIURZyli9wF2oE+T4Jx5SwpdEuEH?=
 =?us-ascii?Q?nhsxfgH2qql7XFtIY9a628jKvmCwJCDk6vowmmiIBzixEDwbwAnD6JSBlNJT?=
 =?us-ascii?Q?P4jLYNXCPI58hnRwr+5mW+1Atae03LN7EGCeNW8FpvyXHX5lySMzQpJeFBnG?=
 =?us-ascii?Q?R8kxfb7BfYW7zFbNN/yJ+PgnTwP3858ghEQ8/rLmZEv3ArkHfStdrtQDBcgV?=
 =?us-ascii?Q?6mFD4AD/EgxGDYKnFsLaTqHWSRJQJqyoKbxcYEkU8OTENYXO9A0gq93eK9QX?=
 =?us-ascii?Q?r7H75w4duhotDB6MiQSi38OpuME+0lw5iAPlJgxiG2qGEOx6lGXeN7I2RW3f?=
 =?us-ascii?Q?6hi/HcHgBpa/WphCqSz8FYW09jJUK3paA7VE5ZUFhsaAnKverYuq6xfCGowL?=
 =?us-ascii?Q?P/x5Nni8ZgThZ3LrW4KRfB/6GYxLcZ90CpUUH5pFcy9pghtdGp14dmBE4FZd?=
 =?us-ascii?Q?+0X4wJV0XH48V1htQjhf/J2kfYh/kYYeE2lz9Fb/PFbuNt+DUE1XfAuI9tv0?=
 =?us-ascii?Q?jA4pe98JQPBvVAxKmNpV/HH1uAMHk86qREnCZb2rQPbkUp82/SukjWlNolmL?=
 =?us-ascii?Q?S871RzVR53ZUG8yYK04Uglpzm6ud4ClAIMcl/Vak1gDbQz9/AqA3oyZQ/2RT?=
 =?us-ascii?Q?0O00wuCewG1pCwM5wVBenIlK6KCdQG01perQpS+m3mJOQe8Gjdtpi5bcFVVI?=
 =?us-ascii?Q?jFCTpHwqQ+th0pzwlgqHzf/yFvmrCg4fNHLIroHErN1l5k3Dkk9IPeI/lPiw?=
 =?us-ascii?Q?DguSpKiXpYEEO/IAg+nNsf9SPUcXA2EPzdkR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SIsVr/Zv04MnTIvQD7lgGagkqgXIY6VoJtcTw3vDYJ/KOyU7eg8TxIIHwd6B?=
 =?us-ascii?Q?ehgGFIQjeUXk/KFd07jQ3iLt1uYYFtUJHSs3CXg9I8vf16KYLSvVTD0srqSX?=
 =?us-ascii?Q?jBt4qoX9eVlOvin1bEZyfhFgCIrud3pOoknbVmDpKC1PlP5jtLM3c5A0DSqS?=
 =?us-ascii?Q?qgGrK0eRf56Fa0wBwRsu6HSZnAVNz5vW7U+JN0Q4b4TR27z3NHRhGhk4P15r?=
 =?us-ascii?Q?LlOZGaOPPlpZlSA7XKQe5K8Y8WQPdPdVWV0c9UUQuGF5GIJKoR4U2Vc1iVQG?=
 =?us-ascii?Q?8WxXkOFK1ams+eZY47Z56IJfXxN4ivt8beY53SpVNcSSZo7PLv3iXItFVPWj?=
 =?us-ascii?Q?u8f0s9mqnaAvKmqpMf4ldV5G464wSFspkn/L7JkVBFqHhMYp9Fszm+I8vFdP?=
 =?us-ascii?Q?7SqWMQV8ocOOpjtrk8MjU+WxR6k17IJHHZH078lBohxWS5tUEs9xx53K5n8e?=
 =?us-ascii?Q?KgOJnU/++4H1XQCeP5lIed9cTpjklKRLiTwAdFOkMn2lT6YrTSZOzRfCasbY?=
 =?us-ascii?Q?plIJ/cxZqFZ/bOZCx5mRiHEl0roOsojXG0HhmdLEZ8v8P1GShpK1w8b/8gJk?=
 =?us-ascii?Q?cpjd+ezV+4AvI7NSc0sYcvfAFsPiK26TtZfJGc2DQClJi2aQdSTtRcbqHlrq?=
 =?us-ascii?Q?k8D1TdA3SsTZMmW+ZbjAdOMudYZNLrbNGHmR7NsAva6XJ5nmpvtp5qdnyl7U?=
 =?us-ascii?Q?J9u0b01O3yA3Y/5kwqbKxexJuoegev35S5wpFNhhb/Bd+hyAZ+FynUHlSYAU?=
 =?us-ascii?Q?xGPYWxmfp89RzXMIDImiyPC6DDBYyL+GSd6ALVfNemtWxSCctNi7Y55k80BX?=
 =?us-ascii?Q?O6mW/mNzRZCCuQPmo7FtLL+T0S4BlowfKCf4veC/b3m0BlhCnsZDLNpgrX3t?=
 =?us-ascii?Q?Otynqu3ZnjIJpBwHXyEERYuXwl+pym0rHNaLPzN8xZ6XgVWlgilEPF8Gpk4v?=
 =?us-ascii?Q?Gdkl4zZS+dMNyDxfMzhukH9BHBoHsKsh/35SjHIzZkIgFwcaeYJnbiLhy4K5?=
 =?us-ascii?Q?zj0zb04myWJj5wektQd6X9OjtYvh/Qp3L4KhVc/EykdC/4XTd2Zhyw/T6VUI?=
 =?us-ascii?Q?BINaXGN4Vlzzpe6HtKOuFuOcDgqJ+Hf1nDRIH32+qurEO1/1SsG++DryPaMi?=
 =?us-ascii?Q?+bdqsVub74kkfxqifASGTxqn8Bh4c4pkbSokrjtF0BwUhAMyOaLH8n/e+h8d?=
 =?us-ascii?Q?YRQK0ViFaHAGrBmgCLiI2o6Oz/k4EUV0deNbiGloBXVkzTpdNYCo/upmd0E6?=
 =?us-ascii?Q?GxCojmiYvlUE1GBn3HwuO3XKg5TvW12gfWuK9c7c3AEaDFitretUL5AmXLBi?=
 =?us-ascii?Q?EdOdT1bevsQNgamCTSbpzQvCnz8oiLZyOCigfqFUVxdySPpMFSM/6raQ5fX4?=
 =?us-ascii?Q?Nc96F8C8B19wnFb1zYzAkGsCHZTTOporLjLhE+lXkW8pXuLT7YdbZJZoRvor?=
 =?us-ascii?Q?ZFzzhtLdpvjUM4YlWKqxPwsVP6v/fizi1amzirdf+YPvoCyjcPhgazLNctW0?=
 =?us-ascii?Q?k4WijipKpoC1zB644AZBaUKqqNik1HZCi6+AsAmug1BBsDY2br43MEKU0vD2?=
 =?us-ascii?Q?8z3bnFsCFyfwJoNzSUJhNjCMe83CvLyAiZ5PuprJBLpMfsAV4fATO2YncSWo?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc5fc90-166e-4de5-31ab-08de27348077
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:25:58.2143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucSKdqq/sCvadShCvqWAUx8QLKFfmsTlY5xXCE233KD1nRX/KxUOC+MwtZICdcJtpqe6QOsthiQWU7gWf6EX1SUMbCG1dkL4esCP+Fl77bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1996

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
Ran 133/147 tests successfully              in 61.467 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)


Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 78/135 tests successfully               in 45.083 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 25/69 tests successfully               in 15.176 secs

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

Change since v6:
* For [PATCH v4 4/4] media: chips-media: wave5: Improve performance of decoder
 - change code of inst_src_buf_remove
 - add set_instance_state to remove code redundancy

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
 .../chips-media/wave5/wave5-vpu-dec.c         | 189 +++++++++++++-----
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  98 ++++++++-
 .../platform/chips-media/wave5/wave5-vpu.h    |   2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  68 ++++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  12 ++
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 10 files changed, 310 insertions(+), 99 deletions(-)

-- 
2.43.0


