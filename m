Return-Path: <linux-media+bounces-11314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BD98C2335
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 13:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C383E1C21388
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 11:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E825516F8F9;
	Fri, 10 May 2024 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="R7LoaXI2"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020002.outbound.protection.outlook.com [52.101.154.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE55A16EC03;
	Fri, 10 May 2024 11:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715340200; cv=fail; b=dh38eybe3nyyftjgyl85uNuPZW6wzVM3xZj/1znKQ7Bw909IzYVfvu5f/BlOMheGvH2fh4ocD5i3vDgtfBe2xaICerNyMphk8ShfDlB4LWCdy11oHkLYTCxi1bBSoQUxetNYtTuSYxIzKFSvQQAAVhl+dJHURJ75D5BWA5HAiRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715340200; c=relaxed/simple;
	bh=VHz8Gh0rws8q4fxgomrRdKZDopagKjaRVrkdrblU/Cg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=G9aQdnNkqcfmrNG5ih5jDm9RmMSo4emWFfwBZhwXLr82e7qw03t3Cs3LqvAMRy7Or9fOF9AFt58gtJbUuzQK70sLwGKv+CbjJ3ZJmZf2tVml7PHDcFkjDnqqbg9CgGtO3j9YYbCo6MgX1lIP1mQ+lbZArW99pc9xisuk6GgR3XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=R7LoaXI2; arc=fail smtp.client-ip=52.101.154.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePBi3ey+OmMo3Pd+4sb9D4YnjMdazfCoU+DlEJuoI5XsDqi0Lskqc0ZmD5tSnUbkOtIKUpgLpLkotJxjZB7eRocMhZIlVXKeizRDjoEWnsq1fyRQAmBq4nHvjdhs9Bw4e495rMUvp2ZscnVacV7AOkhZDhi7aZmuX6wE5VAYhzO3anlNp1pzqKN/kRkZWEPTOaW8I0KxDyg377vXcKePOuUHsGeEMuI2LXVavN6wyD97prIAUxNjCurn6QV6W0XalvenQbmya9eBr4nkPKbM2qG7IQ5F+/gVMRsB4Vx59sYOKq78f7FUKxv6a4sUJClwPtzKk5z4GPw5qprQiiFhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttbqWb8CQdFC2vCP8Vb7/fgK41WsvKrXhCvQwaugk90=;
 b=VZ+FfBrxcerRipW/oztLJhq9/lwdon4BkLqvQt1mhZF2ZejiEkGXw1N3FhmBQ9niypCW7o4x6weaiaW9vo9M/KC6+o7ZX/ShVVLtXaezk9Wi+z0+tE1KG3JvKQ/9scypprcf6anXd7ffPyHAJ/YvnsAV72jGxHerqEfK1ibqi+xaGrRLjloL+SnKZgF5fGXADX/g+JRbuNHI0YDPpiLhrqWXubwl3BCy2dNBFDBKYdANlKUrej02HMaIPE9cpCqx5nL7bn2UqdK3XXIwj8F0pUbOQdvD7QSlbEMI33H8HMzAMWjVRuPKiI6Vsxo0OIBFXUU8KqsMwWCy+fVqaSzSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttbqWb8CQdFC2vCP8Vb7/fgK41WsvKrXhCvQwaugk90=;
 b=R7LoaXI2ccmvt2jSPbgItIMabbUcSUQi5zpgjFfmg3pTx3mJzxQnTPqyURbsD2iCke/pUOCjEBRVs2p3YvO33owhQ/YEFefvUQkv6QeLfeJUE1CeMMQETpZCJG9nqRWF37O0E9YPtdD4MywNjjBUSLWtraF+xMMk30mNJju4yNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SL2P216MB2862.KORP216.PROD.OUTLOOK.COM (2603:1096:101:286::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Fri, 10 May
 2024 11:23:02 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::ce88:bd2e:8caf:8004]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::ce88:bd2e:8caf:8004%6]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 11:23:02 +0000
From: Jackson Lee <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com
Subject: [RESEND PATCH v4 0/4] Add features to an existing driver
Date: Fri, 10 May 2024 20:22:48 +0900
Message-Id: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0168.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::7) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SL2P216MB2862:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec24f19-96cf-447b-e5a7-08dc70e38dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sG0t7Aro9VnlX+5+/K9wEv9bIP2YA2raFROAZB35C9/Gcqj2t6UxVkMaHVSY?=
 =?us-ascii?Q?8rkXQUL9J2X2KAg6U48odogOhT8MKQxMMzKQOxst2OoHWjQWmzIg90R2NSZP?=
 =?us-ascii?Q?eXgeTZQNbgjz5wwEmdp5AcevsxUod2+B841bdWzBK4hTwyu78zakCL7ULbnF?=
 =?us-ascii?Q?Uf6+9f+9MPg7q+m1g1aIh8AaKBDlGwRg4V5me7vMDPxbMvRjf+zJ6omYkNFG?=
 =?us-ascii?Q?iBNXJbwma50fDEgeHtAwYZ2p52bNCL+QOHgdPC1NNbzv+teUe7MzrtsEzcwU?=
 =?us-ascii?Q?OQzkdqjQpFTGVXDIi9EmwiVEblsXtIHnvMhltY2Rr+OTDnnKPWnGgGTQIkj6?=
 =?us-ascii?Q?M76q5pyZVao4NEBMV1E0WHIalc9puW0aY8bNWqdg0BrYxfDM8nR59Z3+o0sP?=
 =?us-ascii?Q?RfSlHRSCdooY7JVXgGALS0pTiRQ5F2FU3VpeQXO+GiIvJ7fY2aHRcR9qgrkc?=
 =?us-ascii?Q?gyjU/D4GRSlG7I6epnvMa/gMwUce5IlU3klRHTDjWvP/orcTytLOkVOGfaiz?=
 =?us-ascii?Q?o6Nflfx5SQxBcmWagrbNj9CE+jC0h1UV4cdXSJOhc4SZVmN4+vY8S6bB6MgM?=
 =?us-ascii?Q?/ZwNWJG7ko+kLGploEAa0CyrsmZDAAd4wyPtxO3TURHf3jFTxkL8r88FNjLQ?=
 =?us-ascii?Q?z/9fd98HrCsARmiKVSMdm27ThXifPUv2oNmAC3s/+Nxmz16v9/gyOTzqrtmE?=
 =?us-ascii?Q?xHW7pOIk3ixzm0iFQhgTxq7zatxA/t/GAFJLvDy4ZJAtdLRKSpq3EAgBuW+/?=
 =?us-ascii?Q?6R30f7zUUeBPb5oVHZauaPwvGiWroXFumiUnsmgTsTnVchce6NK6oeucBDpD?=
 =?us-ascii?Q?H4fjoxsMbs6Un3K0xqXS4B67jJgbuZL78VClLr3NaNSx2VagErYXwUT9Lc+f?=
 =?us-ascii?Q?VjO9rxSjLynyX/DY64spJ06x0dPA/MP6DLcF7BUGSKM0R2FTzUj0LbiXgIbK?=
 =?us-ascii?Q?6MUbgHATlP/kZNjY2RyaUtfKrq0/rdw1i4BQk4WSZCjA4JCZs5WKpS39SHmT?=
 =?us-ascii?Q?0o+8X3ixEKJQF5K1kHp5r5kX7ikoFagcVy38z7WiYOIqEU5L+nCGl6ewdAgM?=
 =?us-ascii?Q?LxhfS+xllBaUQ1VuvjJcgvvczK51U2cK+mGsVG4PBqNldOww7hWrucPedHB9?=
 =?us-ascii?Q?bN+C1cIVF54DxrpbyqkQ42pDOE8O5EakyYqD9V/ghMFmFVTanuor1pRKMFLA?=
 =?us-ascii?Q?ZjC2OY0PCzQ+oyZR93JqYw9DcfnPwiL2EILqL2G9mYZGrml1+W1bgHNzWR+8?=
 =?us-ascii?Q?8lgbNZ7B/CeEXNObkQwkcudSGvf/4zPgrtcNXxFQ0OOcknsjh8vL1DlJHJxi?=
 =?us-ascii?Q?1qVWOhAAwOxrQ63V0Uq8sD/dTSnQblkYHsGvfvCEg/MN+Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3xbW1jH+fef1EeCY6b/MyYaZ5M0jQVXFon5WACiK7nRMVWgpF8h860f///Aa?=
 =?us-ascii?Q?spFMKwGfOz3hxJjGLm/cVqEpKjUcEpzopDavzBrnxu+i/qH5HNVkGCOGy0+W?=
 =?us-ascii?Q?ekbGgwR+3J9zdnu2ObklkIHubdUOLSPBrMjhn8ynBezThSFLB9qZQEE541fu?=
 =?us-ascii?Q?CJPeiaDde/BtInzzSq+t1QOQylbUoaLiO4zocK50PwcqlhsEgCs4uPuygvR+?=
 =?us-ascii?Q?8jypdZdG3I9PPOq/6s3TXYZ+/UU0ZYY1myAXHoqr7dcd0Rt14jiGzG/bSCBx?=
 =?us-ascii?Q?Iu1535FT9n3V2vmxuo1+7AJN3qWtxc76YgGh++JUsBcGE6QzFys90Z40cBW9?=
 =?us-ascii?Q?3NWvEymrMZZvqYEqveoA0kpktVKnTjxtwYsgsZDmwOaLhvqXoEt5DTuCSzjo?=
 =?us-ascii?Q?6I0BL88ZbadANrWM9Tk374TVD476a0zfourfIz2ZANyBSIo3lDnFzOZJ8l43?=
 =?us-ascii?Q?Yuhj0ky/kuk6qdn/yXQhQoGqUXGfVeAFs6L4qdOwVArCPDTjDmq9C2gju+oc?=
 =?us-ascii?Q?UC/Y2hiE+GD6dV5NJ8i1np7uiILIgNrx8gvsQW5i3xAsqXRyYoQUps82V1hg?=
 =?us-ascii?Q?Ev8ebbXnKEt094fNDBwKuEoWERHIHaJrZuKdivfZLP7SkKAY+bQUjRnzPniy?=
 =?us-ascii?Q?dH1NojMuzuFnbh6NaeyZ735f3TWlH1Acl40kfSN2EDOkoD+jU8gKZyrJFH6m?=
 =?us-ascii?Q?2ZG5PukZdmJ7MS2EmNN2ct95bZlzFM8v0dAhF2bjQ+tPq2NAvObWsL95hYF/?=
 =?us-ascii?Q?AVwp1MbZW2ZKf0pDnB852Ft4aeDTrp49fiCc19+VYWbkjegwEtalD6IiFW1b?=
 =?us-ascii?Q?kgHpnjGhj/NY6DeqTgeLOyW/ZZL/rAVkXJIng5slcdTyfJcABtWUOvtOYAYD?=
 =?us-ascii?Q?QE+Cl8JLBNdM/bbNbrQ5BcVgQE63BHKBubJ8Ozjg/JKI9X2IT5dQoUrAw0B6?=
 =?us-ascii?Q?YI/rRTR32jnSBMtDiog/zWfMg17mwn2N4ygvU9djRjSdQM5aM6VR6peV6u6/?=
 =?us-ascii?Q?kVLFMm8weQ82hK5cZgUN/GNdRGRd8gIpmt2l1FcpXRErsMfWmGA8AvKxgmmi?=
 =?us-ascii?Q?VKQRlbX1FE5XKq7r11LuT0pnANsykJ3pHyw9Ij/WOYz2IdEmotc0ndClje9f?=
 =?us-ascii?Q?iCpCG+tFzROQc8xIcfyHHrKmFDITpQAOSVvxhJcnu8u9lLF7fkUlOijm9SUu?=
 =?us-ascii?Q?vS0+K5VjzCaFgFyH9idjiIEVO9OW4eBWJOipuMszhUeR9YwsR8veVC5TlXzD?=
 =?us-ascii?Q?7KWWYH7cLaJqsYucOFrnzh0e/PEhg6qKBKPS+ZK0vSisj2gt8QXxObddRvp3?=
 =?us-ascii?Q?M9hFCzYndQSZIj3vRfMTczkq5JlNRwVeIrCW/Zyce8tVRv3bvWCFGE4GFeKy?=
 =?us-ascii?Q?/YLn/wlAl1O41s8DW7IeKN+Hjm8D3Qzuho6Sjam7nEIV+4IV5lq3h2p+ZblS?=
 =?us-ascii?Q?FY/ebc6QLh/5jYseufeXnyxayDplbO6Mp5Hm38UoH6NXMed7xRPaigW2SurK?=
 =?us-ascii?Q?Lu/Gv+Jc48UFlRtLzuRrIM4uqMXFrDT7pLOe3w6DAaWyiDXW/agm6/0tAXjj?=
 =?us-ascii?Q?mACH49Wpdz58PEqmmwvDxLm8wInaEzySoh17eKU4v8FXwGzft1usIz3hATbj?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec24f19-96cf-447b-e5a7-08dc70e38dc7
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 11:23:01.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i00iaW73pkb9LFb5zT/QLl6/+Fg8WhegrxsYToS9JU6n/telCtm/KOvIuRXfMTiJxPzEqxS0T0pcQLKqNOFyg3hZwjTtl+KT7e4+XItaLos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2862

From: "Jackson.lee" <jackson.lee@chipsnmedia.com>

The wave5 codec driver is a stateful encoder/decoder.
The following patches is for supporting yuv422 inpuy format, supporting
runtime suspend/resume feature and extra things.

v4l2-compliance results:
========================

v4l2-compliance 1.24.1, 64 bits, 64-bit time_t

Buffer ioctls:
            warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
            warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
    test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
    test VIDIOC_EXPBUF: OK
    test Requests: OK (Not Supported)

Total for wave5-dec device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 2
Total for wave5-enc device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0

Fluster test results:
=====================

Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 132/147 tests successfully               in 97.421 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption, 
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 77/135 tests successfully               in 37.233 secs

(58 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Change since v3:
=================

* For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
 - add Reviewed-By tag

* For [PATCH v4 2/4] media: chips-media: wave5: Support runtime suspend/resume
 - add Reviewed-By tag

* For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
 - modify the commit message
 - define three framesize structures for decoder

* For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder
 - modify the commit message
 - use the v4l2_format_info to calculate luma, chroma size

Change since v2:
=================

* For [PATCH v3 0/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
 - add the suggested _SHIFT suffix

* For [PATCH v3 1/4] media: chips-media: wave5: Support runtime suspend/resume
 - change a commit message

* For [PATCH v3 2/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage
 - add pix_fmt_type parameter into wave5_update_pix_fmt function
 - add min/max width/height values into dec_fmt_list 

Change since v1:
=================

* For [PATCH v2 0/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
 - define a macro for register addresses

* For [PATCH v2 1/4] media: chips-media: wave5: Support runtime suspend/resume
 - add auto suspend/resume

* For [PATCH v2 2/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage
 - use helper functions to calculate bytesperline and sizeimage

* For [PATCH v2 3/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder
 - remove unnecessary codes

Change since v0:
=================
The DEFAULT_SRC_SIZE macro was defined using multiple lines,
To make a simple define, tab and multiple lines has been removed,
The macro is defined using one line.

Jackson.lee (4):
  media: chips-media: wave5: Support SPS/PPS generation for each IDR
  media: chips-media: wave5: Support runtime suspend/resume
  media: chips-media: wave5: Use helpers to calculate bytesperline and
    sizeimage.
  media: chips-media: wave5: Support YUV422 raw pixel-formats on the
    encoder.

 .../platform/chips-media/wave5/wave5-helper.c |  24 ++
 .../platform/chips-media/wave5/wave5-helper.h |   5 +
 .../platform/chips-media/wave5/wave5-hw.c     |  23 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 312 +++++++-----------
 .../chips-media/wave5/wave5-vpu-enc.c         | 300 +++++++++--------
 .../platform/chips-media/wave5/wave5-vpu.c    |  43 +++
 .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  14 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |   1 +
 .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
 .../media/platform/chips-media/wave5/wave5.h  |   3 +
 11 files changed, 414 insertions(+), 343 deletions(-)

-- 
2.43.0


