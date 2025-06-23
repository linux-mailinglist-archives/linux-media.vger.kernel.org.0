Return-Path: <linux-media+bounces-35556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34690AE330E
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 02:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B645B16E410
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 00:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F74C5680;
	Mon, 23 Jun 2025 00:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="adNzX+8T"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021109.outbound.protection.outlook.com [40.107.42.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDB44C62;
	Mon, 23 Jun 2025 00:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750638130; cv=fail; b=lgdECDn3XxizzEQqfhIxE8ByY0IwGS1UX2hFUP2D9tWsW2LSByuGgKoOuwpxlaHdTEJnXadVi81XZcezLdSXOs4wo0XUZEn1zCSbmVKA/a+awHIMr5+zoKfmvWDjvH/mxNznz5hmfbiUtq5C9xpZDwLE0MLNExB+QRk5oAuEnxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750638130; c=relaxed/simple;
	bh=CC1Ku39o0rlXjOjXSY4bJ7R4o2yLiX0PoyZhT4ZtMwU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=R8lQn5HXyft3erJRQ4N8OR3YFUPsPwurtYT38dlxAIgggjEuQcK/0ARHcWc9zRp27oDgLCpy2esbJVc5Bt9PPoBmpgqawPOARvNiNp5GoXrp9Tdid299UjtONNdpVnXzgXhEL9qWe0m39Dt6T6u7eVRvtG5FgVT/18rzKdKEtGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=adNzX+8T; arc=fail smtp.client-ip=40.107.42.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENkePsn5DER4Q4QWyh1t2d//TDa7AaoA+QtTaKp3Mfe0REDACCXlkUiB9qzOMrJhD9jVhz/F9Ft7D2glVbU+qbQl5MStKJswtpW5HFK2stm+HBQBVoJCv51kYYd0NBzC8BsoxVAiw11qSgBoqx8uuTjZoYMoCMriHYw9ANCdt52wRjRsgNAXUdmXbVtC0eeuKI//qhrgLiNYzrNnv6L6sDqTuyHpDeYEDSF6AhZ584EEQsQ/LYUQ5nxFz1malrecT9sRFz/jVAm02lhe7FvyY2PcYklHmPk/pR6UWG5hhJQ5zQc8yNkSWNuxniGqzyyPb+BtB8ftdD5k0oFt1n8Eqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrxqRklhOoNWDYjJ7S0NI4D9Som3u1rvM8UWhvrVmjc=;
 b=qL60+53tAJLQ3mJbloPRPe+o52n7bOI40k633A/gxGpuiD/Ovav4Qi1b2fGpluZQifUT0z8SrGP5B9BbESmCVQRQKLymIyLW0XFZzt/v8D5SJLlTlwqYfUmS2QpuAR3rFTs/6biad7gMRAatf1lOSRDAZJ0s0XtEVXVcP0HnRPekoS7jPaiBoflK2aVqxi8uOL5mtt61WVeiAOmF1IGFuhk6FDjwfbZxVYSgstBnd4q6JSAnfPuaWOAlmveS3XvqFxa0nHSb7VnQZNgVwWedu5wVRgpQmW6V7wBpGeyCj1/eXDLYN7CeeNdngVmJyoYZcRgGgvYuXPMO6iEQhe6abg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrxqRklhOoNWDYjJ7S0NI4D9Som3u1rvM8UWhvrVmjc=;
 b=adNzX+8Tjkiu5YwshS5GMPYIkRdoDneL42bhB46c1R7JlhhJAyMQ25z3UytG4YhyG85KzukETMUFX8ARtRpHIb81SgCCWwIL/syfmnMLErDq4n5GvAO0LQSnQ2wjF0e9TQeFW/hRIyBFgdHXKZrX2BCRCEOgstTv+0WByrxN09o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PUYP216MB3126.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Mon, 23 Jun 2025 00:22:03 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 00:22:03 +0000
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
Subject: [PATCH v3 0/4] Performance improvement of decoder
Date: Mon, 23 Jun 2025 09:21:49 +0900
Message-Id: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0150.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::16) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|PUYP216MB3126:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d6cadc5-9318-4fef-30dd-08ddb1ebf9ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ER/EYNVmgiyVV80sEwep+7UZCnwDt5LBPYLZUQZOc1XfXRhoRfsbhjpTWZFH?=
 =?us-ascii?Q?JbuxchwsbRVdlQaZkqmbmCwfU2iucfea88n39OtBrG1gJQNBViDxE4WOwIpu?=
 =?us-ascii?Q?Vhkgww0gPvuNw9ThkoStK6eAsKOfLh2Go8U9agYQ2R5DYz6bHYDDIL0wGd8P?=
 =?us-ascii?Q?vGpAfZ2EfkkxglMKx69AJaMFI8Pylpmb2swgS7S6CFgneMedzTjeRfi7IjmV?=
 =?us-ascii?Q?5qGKtk531s9YGlZGB6S+AAxltuSE2acx2TkB5x6TAhJ5ceTxUesZVcbPkGjn?=
 =?us-ascii?Q?Mb3HPuXd8BH5KBSk0jhAlGmb/7HLmlmGj/bbO//EfQcZi2IzCgjQSLOFOx7e?=
 =?us-ascii?Q?SKZZECbkKFbGT0K9hfu5pQDhNIHmgFxfXFsET8iP8l5w1V7DkKqgMAlGpRyh?=
 =?us-ascii?Q?p6rRMD1W/PL2qa33UZZ3c0iP69OjVhTFjUhPNlPMNOmkQaTLK3ogMLIbFuhp?=
 =?us-ascii?Q?kBOec/8kRz7sL2ssPN7nbsgZpe4yqqKIjEuEc8wgXnCiXq2uvzCF4ZByB9AB?=
 =?us-ascii?Q?VzHjivtFBJklNB738o1LArZgXST2lHGlly5l6H5adwDZ/3QHmEis7wHgCq16?=
 =?us-ascii?Q?4BQE0h9RvnU7fT/0GtJN/Hn81uh/oxaNSSUSLiSlTHItInwv+OHiUdyESf5+?=
 =?us-ascii?Q?VVAdmN2FkYTT1k6dr5711cUt72NEYaRUheM+Y/w57F/56rdaYJSMDEA7iNiE?=
 =?us-ascii?Q?aGUOOPaOZ7ABwy9Bnx+NWTtBADGXccbriBAdPIPQFNNSi5mdr2vAUl1SckSm?=
 =?us-ascii?Q?F+2M/BJg4GcSUYKfqkslwvmhBsR5ovs4lupbHAkuSewsLZjm1ofA/RTLKoIm?=
 =?us-ascii?Q?+r5zSbD7V/bkE5ZO/pC95MnlGEB30Sf5VJg+7eNC84cG0zdzHw8PfLQeIVTn?=
 =?us-ascii?Q?IhjTVl1HB6td/sLPxX5jHWzPkqhg4DsP/D1lCnNLKUHZx7PVxJozA/oDFPz9?=
 =?us-ascii?Q?NeKSd710mS+LfPcJN+e2b/4Zbj1C6K8HuNZiXQHd1/lX7kt/a4hEO1hKbeTJ?=
 =?us-ascii?Q?S2j6+yp3c1izC8XR+3uzS7Mpxhgol4pOV4ePlvGh5XVXHQNFXVuSWyCfXT3v?=
 =?us-ascii?Q?EllhD36tFqZ2+xFxAR1fqREUrcQVI12Fg0w5eMvQnzbLE2clt+4+csRjEeg3?=
 =?us-ascii?Q?xsnADOJyUlwR9tsjgiDGg6XKBNo8f7L/a+PWcQD+Rg/9Tga9P6u/YOa0Eldx?=
 =?us-ascii?Q?Y+x2M/TyKRP4d2eFaAICiyXdXDD+3idFKtjaaA06wFUEirCkR/xoFUJyJcTz?=
 =?us-ascii?Q?G8PCiFfIRjzRx8oT9hbDgWyCzvI2NLtXfNpVt67PWRVCLhpvsohFkE3scLFi?=
 =?us-ascii?Q?qmSQYBliWWsXF+CCUtlMvbqnaEO680JmCL3MmI9R6ZUEsGPIlIy0Rq/p0Lxo?=
 =?us-ascii?Q?deGp8kDzQFelMfbjrXrvvEJ4kX5E/EuBnoPUAmdBZOIqXDgNC5teFd4SGy8b?=
 =?us-ascii?Q?X/rUBh4/hKu78zTX6bc3XIqQRDJZr2k2SFikVii5iaVtg7+6ZMCvLQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r2SU74y5CGdziqqcu7WVTYyCl2k2t1AXVUNCthlYkbw/avMXtr7np4zd/I1h?=
 =?us-ascii?Q?1I4j50F4UI9li71lLzBcjLVcE0yCca6ISo2/fI2qX1Oii3JYGQ0bHvWjZ97h?=
 =?us-ascii?Q?UX6ryO/1URy6+H8G61IP3G7N0DY+ibfIc1lEFn/rhYksSpwtGpNaQmlWfiaR?=
 =?us-ascii?Q?TGjMtGHJrjT0pfQcm5de1rRzzJ7+px1bmTSz0zreoZTaeN9BI+lJztGvUaat?=
 =?us-ascii?Q?lO6NrywmDtDsclQGUxZxnR9ATCf9CvmY6MS8S5WTI7xtVKDfZCWt6alqUohE?=
 =?us-ascii?Q?ZpiqhJfW/RaaBgfhTvek37jwDRStyZOtzn0JjHVtWjb1vNm8SgyBvJmOMcL5?=
 =?us-ascii?Q?+4MGsAvgRJ8Ev/jxmHG1vKJbq2gP3wFhlxQzO81o2ydKpCK/kOYroSArN5wo?=
 =?us-ascii?Q?W4Jrs5WMOqQNosjfcQ7N7BJoNu0LZsZWwdePxAjU6vKb6lL7Dq7CJJJM7bEm?=
 =?us-ascii?Q?DnbdKC2wOkZOO9Ua3aX27W3zGBu6bl9ZV4QsOhZ2YtOBxIkmJxDe/IIx3TU/?=
 =?us-ascii?Q?2hZNI6tq9DfAGdoJ1wbXsOV/4thaHIbALZuqgvZk31NAnc1pPpSNfMXEEosy?=
 =?us-ascii?Q?1iE1lWcIz4fjRYKJ2WQ3+NJbDMvH6TXf/6HwpgzwDXZTwukt0ySSvPu1EWNj?=
 =?us-ascii?Q?Uk6qPkXdENepJW0Q30mBf5GkyON4zlONn1vhsPY9MFaAOSJ7TjxRCPYvh+Ly?=
 =?us-ascii?Q?YqlDb5VwT6QQIwzNYv/cQAWtqsNn4Uss7f+dmpTBw1F/hwyccE0PirhQPnev?=
 =?us-ascii?Q?p7toMA1+NWvJH3h9D+T3/RyvFYkCJri03W0FEUBD7HDUTSenbmqa7TgEvYMb?=
 =?us-ascii?Q?LJPpghPf0f27130sqRTzLeMQ+EKUQ8LN1Hhjt1nlHl13OIZklDCGUgULqxlu?=
 =?us-ascii?Q?hHwpqAujLs6WE96KCnCVHab9TI10uR3JgutzvazlbmCrzk8l+CxrwMDUqgFE?=
 =?us-ascii?Q?uKGmO456D3ctpgD/LVrRpWgOBu9C4DF0WVM4Wy6wzj1YF2Mq+3xTcNRXInjQ?=
 =?us-ascii?Q?ledXXmrvg2oUkKXlt/zDd/KqjAHs4gRf+0G05O8WT2DI9INjp7QE+gZ8oZJ2?=
 =?us-ascii?Q?OKm/aS9fkm8puk/bbxA1TTvGNGob8fplq/GFnowAJ4fwJ6rYODwUh1OHfdlk?=
 =?us-ascii?Q?j5s3k746AkdcLxJxuS3SzI4NUMUVvA/cSItRygzWnAvCpxGKEN9HRQUcwrdQ?=
 =?us-ascii?Q?gMoUjn9F8q/MSQ2YpO1d05vKqe+6apaQIkDwB54fFpaQRxDi0hcxIJ1/+7wF?=
 =?us-ascii?Q?U6x400eUtCd/sd7kH4Zwyd04a6Jf2pagyc0lD9L7Qs4KlH1DfOhtrLwmVz0J?=
 =?us-ascii?Q?ikAtjyX7ogBb13zSKqifJKRb5dacgyF3mNVMcEHGETh5Hrn7XhFw223YHr0Y?=
 =?us-ascii?Q?GIu/ylpsahS1Fi+asdGn4taPHEXGHFZ8jjxfQli4+Y7Tf3xyz9EJPPcO/tCK?=
 =?us-ascii?Q?50zQ23FHigZcI7VX9v68Um+QJmDfofzF/D5hlRyHicQwalxxGwndKfKc9M9H?=
 =?us-ascii?Q?mP3Kp1HpDNIrLjHylh179yC2igy9UZTHPq6wl/R21jEjl7KkhyxQpdlYH8Jl?=
 =?us-ascii?Q?q7UTKKN9FJ9YlkAWw91Tld+fHQ/vqwfgeUuT3bB+yf7/RafGWf5FzXxbwFIB?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6cadc5-9318-4fef-30dd-08ddb1ebf9ee
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 00:22:03.0894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRzkZgUhN1CULuXPYx4buIpHrUvrFvHr8+sMZA7D90D9fqlvNuvUCo7dPIuX7T+/l9uSCe/oHZlawdRtoc3bKj2jW7LLMxqHbVuy9xajyQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB3126

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
Ran 133/147 tests successfully               in 40.114 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)


Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 78/135 tests successfully               in 43.364 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 25/69 tests successfully               in 40.411 secs

(44 fail because the hardware does not support field encoded and 422 encoded stream)

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
gst-launch-1.0 filesrc location=./drc.h264 ! h264parse ! v4l2h264dec ! filesink location=./h264_output_420.yuv Setting pipeline to PAUSED ...
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

 .../platform/chips-media/wave5/wave5-helper.c |  23 ++-
 .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 139 ++++++++++++------
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  71 +++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.c |  37 ++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  11 ++
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 8 files changed, 219 insertions(+), 73 deletions(-)

-- 
2.43.0


