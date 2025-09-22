Return-Path: <linux-media+bounces-42881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0211B8F0D0
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 409757A7EB8
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 05:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987C22405E8;
	Mon, 22 Sep 2025 05:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="aSmIts7h"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022089.outbound.protection.outlook.com [40.107.43.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7168434BA47;
	Mon, 22 Sep 2025 05:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758520392; cv=fail; b=FjQCaj+zD4KHxoIWD4U+Qc5e1yJZCXyTlrf3qH4pxihNFl/M1DCGMFdzMQXtRGAQjRr1xqEMYbaAWUwcVLZEPaAc7rkakb9+VQIxg8804BQz8E7CHP0xArJBbQFOnHuwqu1UH7LUqNC32gyRIRuWLZN9bd4ksC3fbCrwjFyJVYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758520392; c=relaxed/simple;
	bh=PhSQpF8XX/ZMAOrDeiFJx+IL9ctZ6An1VMhB+tDyxfE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KR47cpKjIfwrFMa0yqRwkl+HJce9K55F8X/l7pwtdSS+wLKfBT8BvijHpe+5hTuBDJUoMneec0qDN4IZ7fxKdqhbLrzi9w0i+vfNofPWOPXYxHTJ7Opsj1yU1rkT3hY4W2GDVLWe/xSsDqbjvxmLrFMPwalR5J7AW9+PHgqWFos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=aSmIts7h; arc=fail smtp.client-ip=40.107.43.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwSFRHnkUG2V+WNevc0iLm3bdIfTceT8vDibPageyZ+RZcjRO7KxZoq8pjN8qn6gzRDOo9zLKaeCIHl17DZO0OMZ0H6YzwRhrX/vhk2nB3wLC7gdeHZgmp5ePDSVHR3EPwXWtMz3bexSfq0BkuwBr5TQm2MU457ZkRuJgKgNqEvV7OgUG4OfTGyQRXqSg9UavVH/xqv7iUdEs13ZbFgkHuh6BhlTpGqxDfaVb45DxAauXBTiuTVRkK4+P9Z/sum3v9cCy2twUCo9TYox7lIFAM0vmfXudRPHVQuxvns0C4KXVl38yc0MrZfwIbEuEObUfqhO5AWXnUb70wAPK1aJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnrsmK93V9eJlzdjCoe2VEF/OZ7cepZK6NgyI27tmaI=;
 b=dA05b259ZqXmUanBgwlSn+yDd4YiyAZ+4HBC+BLA6urp2gj0IKP673e5wmgMwMeRRfmNGhHdxEz05yFK8dMasHVvXYyGROJ7NZ3g3jxCtoEuNI/zXBZyj2GamTaXZTnqWRvGzLlRwN18x8P0fhE0JMQHW9E6w8TjValXXhPNEWDEQW/4adPdk1oXQzIGarNK5hJobkT0WPuHWL79bc553zu+FU5IofBrGZHxVH1+ep3xqySO2mnDj9/b3OrvVyw7h6ww2NmlaLKS55ITsKldo5quR19f5Ytvaiv+vcfnQhsOtDEeyuG7aU1abGWvV+2lzRixSXAgdUWTUJ/UFXoLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnrsmK93V9eJlzdjCoe2VEF/OZ7cepZK6NgyI27tmaI=;
 b=aSmIts7hnl7C68xhFj32jioAKka6EeFgIrr+BKZKO77qsHwuPuXgnI9mrKQMfJcfPJEQeFy9jKUMeWgLW1DnrHOHu0JdwPS6a7EVtyZWPiykjSweVGymwJsSuUyC7c23shS98cf5sxmwi4tvPGhJwuzgyF2TU7zCSdDmGFtNdfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE2P216MB3024.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 05:53:05 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d%4]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 05:53:05 +0000
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
Subject: [PATCH v5 0/4] Performance improvement of decoder
Date: Mon, 22 Sep 2025 14:52:51 +0900
Message-Id: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::23) To PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:72::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB1149:EE_|SE2P216MB3024:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ccf523-cece-4f79-33fa-08ddf99c4c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iRG+6Bk2vWO7Y3LwemPpVuTr4tFGF9ACfcKzaUeSxbe0Y4jLfp72ogfo50ff?=
 =?us-ascii?Q?nGAxoJQa1bXAkFyqg+QotfIr1O0y6dGjHz3K0BDx2CdIKXqoXEk0ZZLNWd7P?=
 =?us-ascii?Q?iFPgJOFrtyEBOQEdZtfisQR4nFaPjEyzDmU4DUHnVZ3Gv08Vh5+M6fhJ408K?=
 =?us-ascii?Q?oF/nPQ8Y8NL8winZSPu7hb9DeeeiC9oHFXvic1RM0/3mXp043UvdIGZGR/dU?=
 =?us-ascii?Q?9Um3ee5v6ok/CH24delDzxNETKLNqbIsHkuHutKoF9AGlp/4K8010EKwwfL7?=
 =?us-ascii?Q?9f2k/EWScNffJ7QLLU9R/4Mm28jXak3PL490zDywh/VrUSh3pExl5gNjbzru?=
 =?us-ascii?Q?LSY/CBqhQ9EBWs3A+9uZEu58o4tmqbv3Sgi8BZAxI+CUQAPs/XPuC1erOuSR?=
 =?us-ascii?Q?AmrHoaeQNtB9mBimMna20lay/V16ZVlLj6qXKvaIEemEg08W5mKmPt5CyGLg?=
 =?us-ascii?Q?919eGj+HNnWy4A9e8fZIKEuREKkSDiyZWHtndvLAMF1jlMs5hK5c+QqWUag9?=
 =?us-ascii?Q?nyxW6Kg7rTM8lwBhLI3IasyY3myIB5MmoX6JXGc5UNQhf4Vo03+ETpqmPoqx?=
 =?us-ascii?Q?Xxv8DAkhu7doqa6sSW9Vd5e6h13nKOSvW4yAi60jR0gngy8hJNYM5atCXmlx?=
 =?us-ascii?Q?n3jKZQWzaw4SFNfzpv0WmhMeo7A1tTWiEW8Ybb5Y5v4jRmwcfhirTp8FLseW?=
 =?us-ascii?Q?iLEOuPUso+PW/fGSPiusQyjMHB+rnjPVRCs3qJANqjZaqNXqm09qrAsThcOE?=
 =?us-ascii?Q?MWUUvHaYUY6d7JGL5JYPOhHlDRB5+/8J6IUd7ZegwBwQD806v/RDbWB5W3LX?=
 =?us-ascii?Q?jS9TzHdGNqUWltRwzDr/P1WZZeZOPrdFqqp07W5oX9d0ZklIiBVAMmJWcM9x?=
 =?us-ascii?Q?8Zx4XNhDTZOxbrAVKb4IHj0PWvTODs/20TToJo5shulHyO3o+7mr4wyytfyD?=
 =?us-ascii?Q?FrvFvDy3YiCFWf+1iYC4jQrtOb0WQNOWZAOxfN8ADccoMGuWJPuTDySGI6jJ?=
 =?us-ascii?Q?eq9vSdHDVj9nAxjCnZG2mwwC55ztMwlAmg33bDnD1JHZr7YJJZinnREvs3KC?=
 =?us-ascii?Q?xq6/1qdpDrpzY5qWfoTgrV8vXOv7GNLeKFyrDF6RkL2bVvFKQ1ta1Ny8PL41?=
 =?us-ascii?Q?63FmXrZGH+qrDcESRvEEz+sGXcqOITiCWgVpqCxn+r8l3CwKCsKS+cq/BYAh?=
 =?us-ascii?Q?PVAMC0sUUWzUP/wKEb3964+kH+y5jJ8qNK6Yo4Ji7vIkE57Tg+K9ke+as24K?=
 =?us-ascii?Q?F12ZEAuM3rjSQZXJ1IUV9cRoWxXtujYgiE7nOB/B+e9jFaDE8+jY2eeM2d54?=
 =?us-ascii?Q?gKDhA9qdJFSpK4y4z8dlFeui3DilGFgX/Boj0/Tmem/j/HGF8PzmyUIJGafW?=
 =?us-ascii?Q?lLWOIIbIHVqfuAZ3EF0atGlHWjP3VDB+mjiM3QDf6uca3GKcn4eGrLXUQGlf?=
 =?us-ascii?Q?kCzKqH3DaLSEN4C3djYbvbJq0u+YCXn6ogvkfFYSIuzqCL58Vn8COQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q6fyqOuIAS8JuADcgkWzfmd2rfc5iribmqKL+xMwOMX+FHJ0n7yQRIwfZgTN?=
 =?us-ascii?Q?EONh/xxAIvbk6g7Aayt7vB9eIk66xb2XnXDsLOvZrBOxgQ5uawMlIwUfEcjf?=
 =?us-ascii?Q?qcq2XPdkzpSB9Fl4E9V+Fkk/Ptzjj7Uc8eCqOSaigjZa9z61MdJlzNXIrJnl?=
 =?us-ascii?Q?HtjxgF6pDMAE3UqJtW/oucxoJ2T//b+daopmcQtXVhCybncU0aKVD6Cib1TX?=
 =?us-ascii?Q?NwCS1sBsTX6q2xGyn5wPpAQmuZXFF3gZIX6j1hRU5C/yps8WLRO7iT/MImX9?=
 =?us-ascii?Q?COIJ32cCjbd68nOn9iJJttwdWllG+w34Wt2gOEnwNWFIxylMzoo3obGSVA9i?=
 =?us-ascii?Q?4339WLm8KKeecp4tWDJP+I5Fg+x88Th1BfhBHzNuESnDVtmVLxoOdQOxZYMS?=
 =?us-ascii?Q?Q3PMsZ+pKo912O5Ou7Lvjapxb5xBh2Y6CgvV+plkkzcza2uauzwZMB4XXOM4?=
 =?us-ascii?Q?x3ceFqzi+DCZNptT3qnSmBZzjCYCidMyK/EJxLtdA/wbtGQ2Pi5WlXZjbO8e?=
 =?us-ascii?Q?5COKkwNcfaAIHTRM7TBaUiaStSUUs6wAM/rsAGixIZYGxrxlqgejFmqoMDe1?=
 =?us-ascii?Q?PaBklgIVxS3cZzfTOe/vgW9CdilqgBnpSXIOyC8PjJkbL9OCoQKR4Rk8Vt8D?=
 =?us-ascii?Q?vM2Aic7SKD9uMdGIYhJCGZgbRZiJgJUn0o2XLZIPJ630Zy/65i3aVUIGHzg+?=
 =?us-ascii?Q?MvaCXGb8iVT4d9t6Dy8xDKDKm3inhxGfrWeinaAKv4aprnjwcBvPNUQcVIMu?=
 =?us-ascii?Q?/EGWYU5NARlNvoUg8oVfyHeTY9c/ZKjGbV7xG3Dwp0Q7t/ibGJbV7PMulTZM?=
 =?us-ascii?Q?ptEIwldsVYKnMJkWwoWGNs8NpSmMYK+k5ubZs+VtQypShAptTsdTMW/sWTkH?=
 =?us-ascii?Q?A5/4N8o2S7/fHnKIaYkVvRPwUps7phx88I8WxenkxZZQSDsfJt+LmiV25lyj?=
 =?us-ascii?Q?tOz0NCbMvcoiuno1H2gEMTb/veSeU3zPmxFefBJ8QrYnHupwh2pBBCwvGrO1?=
 =?us-ascii?Q?37NzwK19m2EsmvylXIKBWlN0tksJCTOKAfeaLEq9QhC5DOam9rcafw2LAAKy?=
 =?us-ascii?Q?n4uSUQhXk868ZNTvcsJ1o8TGYgy2ON44jXAyvMYevNADnP9AyyfWKBcJZGHB?=
 =?us-ascii?Q?BcAAK4ajIT48RGTtiLN0DLXuMmmBUSIjSqRQ3x39goJ+qUmAFhJLE4+LnWsU?=
 =?us-ascii?Q?30JNgBXNa809YFVSTqzGFOx943uadvNFye5ZepvQP3PrlO3ZaS+znmg9liBh?=
 =?us-ascii?Q?m54tJyAslFRcA99IZrhPD3Nn/RBJLYb7e4QsM0n72XaggCri4Vzv+NA9iKJu?=
 =?us-ascii?Q?eoIxJJFF4R6rOwgwFpGqL5AT8r2tQfM7OWqYvhG6SFemZ3WF8yR46b0Nr6yB?=
 =?us-ascii?Q?JfcnSK8iWhfQTiwa0WqGHAoeX99KxFsB/Jla6IW7H3mjpIEJ481FT3w2UGfs?=
 =?us-ascii?Q?Jm4tR/0DG+RT3z/h0GDtaNbxlDegYjgnCCOu2+I81cKBO8YOrZZJOENM+vF7?=
 =?us-ascii?Q?6n5ZZNtAsTbwsYeBA9ZARx8Y1KLJCRIguc5VXIf8zhiP/oy5voGmkPQb1obF?=
 =?us-ascii?Q?QW/kCtaYXd7KRfPPeHHtgBBjRNd1P+zf2Q3cgPfvkNqCHQnwxZewPd8dyfIS?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ccf523-cece-4f79-33fa-08ddf99c4c7e
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 05:53:05.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poU1oJMTC5P96gymkQ3HFgF5LiLGx0/+3E1Kkql+xXP7xcI5jCwXXGS7Pwr/KXiWcA1UnzxIWeHGRFOb+3MH7/M64TEMXL0ITaxiGi2ri9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3024

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
Ran 133/147 tests successfully               in 40.122 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)


Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 78/135 tests successfully               in 43.354 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
Ran 25/69 tests successfully               in 40.413 secs

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
 .../chips-media/wave5/wave5-vpu-dec.c         | 174 ++++++++++++------
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  98 ++++++++--
 .../platform/chips-media/wave5/wave5-vpu.h    |   2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  61 +++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  12 ++
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 10 files changed, 285 insertions(+), 102 deletions(-)

-- 
2.43.0


