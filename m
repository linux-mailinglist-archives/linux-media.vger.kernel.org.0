Return-Path: <linux-media+bounces-12919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB2A90333F
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 09:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1669928218F
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 07:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72CD16FF4F;
	Tue, 11 Jun 2024 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Lfwx3GuR"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020003.outbound.protection.outlook.com [52.101.154.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E5D13A258;
	Tue, 11 Jun 2024 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718090115; cv=fail; b=UtO2j9Q/WnX6zkqaFVrKiGtteLabI7xpR4vZLrYkPxUsfvAugv8x4zJgbZw96WAYx72L4rPjJMlHRsS756n4N12v5kzB8x75ogLOd8ROUN76UMfgD8c69QcaNl9t7GCRpfgDJ+ADElQkNHWwQuHjGTy32TnwDrdKYCgCx365ACk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718090115; c=relaxed/simple;
	bh=KuNUllXrTUnSHIVkaS8bhFllvejWncwdb/YzXSGd5fI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SviOWypZbcv+2EoYd1qawUmb44PuXGhvZJo5AmEek1Xlhp9efBDBtvGeYXoY+se1mtgle52K7llbuC7D0pDxlR5ciX+UWCR/js/FEkQ5WfWS8StiEglufMILpmR9HiEF/okQoU9AQ7Xo1awET2IbjWi/SjDm91GbOse4IaR3HK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Lfwx3GuR; arc=fail smtp.client-ip=52.101.154.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DR4W/bsUeIiU4XWDbhY3rlJUqk911M0AtKvvesLym3pCDGggYwIut3nGlvHSzflNHtSscFtZ7DeQ2hZdC2P7iIC/YPzyl2H8NLbC+XPwOP8R0ZctosMfIao+oL6iDZXZlnbl7zQWJUQnXwFInrzFhQhRVuQarue9p4mGsNP65XDkPYBd51t6Bd8l+JVSqxF2Jl6nRV1pd1z6/nqknvJRjRUA1hPHWyOWiIKN/qBB2tvTMjHzTq3L/BOmRG7Gat1h051W/ZR93XJ47Tgk6b5e9+c9DZK9IHlnTff/FcU5+50klHys0t/rpgYvaLlvLjKMDvWZFfQq2FXM8ETkTE8Dkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnFqAAQrhUPo4x4+Aw6yJj2d91tp8Fdgtk211Cp60MQ=;
 b=AMG72d47Nz0CccGzSoGMXHJ6eMvm15STsS2B7abB2UopshSIrhfqH+SpFDgDRz5erRWKUIsf2dCw7/naaN4GZdTiE/sMEirmOwUBnAsDw1OydSQKXbHOs4jIHrhPcY91TEZVfidYP+IzSC7ONg7/Q8RdoFKz+hvsfNnmRwzEPVuzU1+VMsmksi46gGKFjn78vgsfCC2lDKHPS8pO6EsRwuX6iqIG4UMr/+zcL2/JpbFdww2hq7Nhhcek4qM3HZm6LbIt9X17RK7zvhpDg7bUKmlhIzpabb4BYVjo0zeCQN2d+YP6fqaEtaWQeLPg9HefNH4eoJjRtX/qsuEC6+bDPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnFqAAQrhUPo4x4+Aw6yJj2d91tp8Fdgtk211Cp60MQ=;
 b=Lfwx3GuR5kzjHvcZepA+2FneNnluoxzSBechigc5bdEARnJynPlHJoG0wArYV39lLuInxMZCVc9t0cqWs/e2v3idQJmGiIYmkHAzpOTqDv9/9Nj6sjgeNCkmzP8w2MwK6Z3BfZ7iw9CD008fLteQHWlUR1dUS3ZMNmg/1WYu81s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SEWP216MB2956.KORP216.PROD.OUTLOOK.COM (2603:1096:101:295::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.36; Tue, 11 Jun 2024 07:15:09 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 07:15:09 +0000
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
Subject: [PATCH v5 0/4] Add features to an existing driver
Date: Tue, 11 Jun 2024 16:14:57 +0900
Message-Id: <20240611071501.80-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0014.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::11) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SEWP216MB2956:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c2a979-fec0-463c-9697-08dc89e63a79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TCL8ycbrvTBc0S1xKca6PvzaQG1ag79IRQRexWK0PtQqvBp5ujhV+LVLuQgK?=
 =?us-ascii?Q?ser+fbGBusj+xWAVUbu1K+PFIdOYaI+CMBNLSwZmrBHP1VuA3DOwlkfEZ3bX?=
 =?us-ascii?Q?ABbMhFQ8BoHqQF+sQaNSHGegQd+ShMaYOCmylLKSibFSJdWoY5M1MvRcLGpt?=
 =?us-ascii?Q?L2lXk4UoW1qCZ/AgnS2y0g3YMQJsVs+pO1yGaOMv2eAa/aRzQuN87gPzGnR1?=
 =?us-ascii?Q?AiU3RazWJxOhKfH98c/pkh0xV8i5vFwwMYZYUVkYPiwhYg6kPq2qndfsgbBI?=
 =?us-ascii?Q?mSe6hjLaeouffKvKrHK8DOY/Ei6nZbtCz7rE61AFH+bWQlroQukKwD8eh7et?=
 =?us-ascii?Q?MlNb9eHsHo1S5oTZimlueDrkxzJCCxRoOBl6MT3mL29oSzmJWEhoQAki/25l?=
 =?us-ascii?Q?0fRLLDjhs/FEzHkLR4NJUzjwnL7n1qow1vY7/6U/d1s/FrxtOQqDSVFZZp/j?=
 =?us-ascii?Q?bWlALbmFdLN6+IoaBYf7H+FqgjAgYzcIphCmwFDVk1i824Wo0j9yWxqZBmW0?=
 =?us-ascii?Q?W0FdWc701+RAbe+pAkBx04u9AMY4XpUAmFV9P1AYeWEmIBgy68Ci5Nqw33bJ?=
 =?us-ascii?Q?72wVyYvC4c6XddvTdTgdGX7blWBXq5aBIbxy/e3KOOO4VWMlCxwtZQcfFGix?=
 =?us-ascii?Q?SkUVXUbKWEe0bRvY6w+Re/7QCEhe8cp57nBxHRq/YYyNF7yXMzL5+re+0864?=
 =?us-ascii?Q?ce4qz67eJ1o84csGsP9oBzptNMmGc39dyr6hAIV0RNdwo2fnZ7vmGLlZfzw9?=
 =?us-ascii?Q?cKh3YSZ55CYK3B+HszlD+jCc/bWU6r3yiC+V19rgzpyaQ5obhznhokZOozS9?=
 =?us-ascii?Q?fV/1HHzzxX/x1ymtpvx3nljrNx5XAuGDL3KCJDxTruYmXba5GUTs5K/7KWjX?=
 =?us-ascii?Q?+TNG3Hpxu+yrU8+WkZ3AZQa7Z77bVwOUF4zVRYuTZ3DQL48QH1/n+ZdXNgtd?=
 =?us-ascii?Q?nQ4UE8xrxKJf6KvXGd7XaTJj8RgA87h+DT84WwCZyMxWhnNm1LjJsEeNK41N?=
 =?us-ascii?Q?OlLffd7nO77l1IDILASQGrBgBhwtdVjumCZvTo0n3d8vl37Vil5xLxPQyTCa?=
 =?us-ascii?Q?/2r/Jo1CrTS0zYTHn0GeGEW43MqgwQgoSy2Ze9+e18T71LHWLIv/Qp0c+xaL?=
 =?us-ascii?Q?nkT5HAyQtBBhJW5i3pY7ugbSO50bs3JCb17z3YuGx1dvxlKvPinI/BpTCmk1?=
 =?us-ascii?Q?lMaUN7EUDWO8rLij6rDoNiEE3Tbg/rAHz2sNlQ8BvmVPQB+yQd2hCGZeAabZ?=
 =?us-ascii?Q?8/SQ7C+1SX3T+xxOUtxbRkh2o7fjq+sS6oS5rAVs+vs+zHZxZi/UIht6w+gK?=
 =?us-ascii?Q?A5mqQvtA7mXvM9bAlIgfWhGvflhVMwf2e+vFWBo8nzsZ7GNhW4J4OKrE1Wkq?=
 =?us-ascii?Q?R/wiCu4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ghpb/r2qZz9w0qKPQWUevOeOXEu8mkkigdls/o8GvwOBZaDRFdTPtyTzcaHf?=
 =?us-ascii?Q?pdw81y5qCVdVoaCDHHc8nDnDsgp78EzomD7tsjSdtHbWf3S//WS/ArLe05Hs?=
 =?us-ascii?Q?Ez8PjTgHjJQ7LgmS9zHDZfSSmC+iLBeVgAn75m8bmF0ip1UCZeuUSoZ13vuB?=
 =?us-ascii?Q?Ng+UhkoKEIWEHTYGbVpcwBy4lIOQCz6J2e4P5qWXrUP/vfR4qErE7RUimRSc?=
 =?us-ascii?Q?b6PX2TG0EK20hZ1jR/8GQyd8Ge3naajMXneghhPInPabf+MvioHzay2/5PMf?=
 =?us-ascii?Q?qRZLmVP4w9UAYaQNp3aZWRMPcqH+lwGbBrwVYDSkCOP+LgUhjVARqMZ62/1k?=
 =?us-ascii?Q?Tl4ziSijXXGPNR1PfX3A0J1uF8Br4yrNx7GLgpHvoQWFuU6s4lyv+zMAWb4m?=
 =?us-ascii?Q?LsgLCPewlv9pdLtS+lQuJLVtUFqZrdhJXEXnPZam1NE8Lea+BbKiZNIpOLN9?=
 =?us-ascii?Q?PeXC6Ab1J1ExwKSGf1VWQP2kDQI3wWVL8w0+Yy0INsPbBpUwXDe8CaAt2T9e?=
 =?us-ascii?Q?vgRP0P5pDy9kb0aW2Rn5n+O76Kbdsz0DPpH6+tEEgcNzwb1L6MBx5PQqZVeL?=
 =?us-ascii?Q?9BoutOlMiVsZbasL5tui15NyOIYfmrLKV1oRcFpSJwCExp9wZJk5u6THtkDv?=
 =?us-ascii?Q?M7OeJGUiv9xM+oFlTFwGUEEbRv2Gpa2PJiejCCXEkhXkdXp3uWMytq/aIGy1?=
 =?us-ascii?Q?YcICIjpWslQ0oOZZ2YI3TkseOl5sop1Vs0TxsxuesZeNnA+oTmqOKBB+n09+?=
 =?us-ascii?Q?VhAJF1swpOn90kd2LyXwpoMC165rbxK1mkpKjQlhpXU8YwUqtGv0ziW6GoUx?=
 =?us-ascii?Q?r2QfdH/XyanLrw8ucEfYpgqaG3Kx1BqI5h0HyM5xXXuaNDKXgaL9UXChM8yZ?=
 =?us-ascii?Q?b7RheJYzNWhL4PORwo0/jzZ4KZ8LVbOXz5QnW3JW2biRf93mZ1JKy7TPj6dm?=
 =?us-ascii?Q?/XH6nfN9in5wvOh7u4I/ConcMPMgvJbXTXj4EfSoTIa/33tSRzVzyT3VrhLQ?=
 =?us-ascii?Q?LnDf+jq1pz9afQTJ5ASpmDEFc/QtpAIPX0IYyPf3KMEHuxJi3a/HFID71Ewi?=
 =?us-ascii?Q?duV6oKqPWvVwm9YzyIaL3FWe/8dKRgMmm6M4ESWmjlRT8Cjux30hTM5IZ0Z2?=
 =?us-ascii?Q?GyBy7OFJy+RYxsLB5Dn33V70LctbWej6Zhx8vdvIOqPnMVlIbf/a43yBYMGH?=
 =?us-ascii?Q?izu9SaeHONXnWzrmMHK+dz5iBtOz9xAoTUhDm8FvuLAI43MWNa8FdS1s8h5X?=
 =?us-ascii?Q?SgNA3EgecsnHcgOfWhk8QXjeofkyAYrttf8Bq6ZWuxSyDlp8H8qBGrM49wMo?=
 =?us-ascii?Q?592jeDh6KrXfNqGYR/YFJsTs/vI7BcmgqMpTEcyojLtPRHRcPSlRbiZQewpE?=
 =?us-ascii?Q?oDKCm6zgxVP5+Q6vKyb/Ne3ZHZWQ1yWAKR7d76/7+Ict9AwnxEkiOZ12Mtyf?=
 =?us-ascii?Q?PN6pO74ShOnPkZofuWk8en00S3TYGI7cSgnvS7+bGuaOAawDimd21g0H+DVO?=
 =?us-ascii?Q?jgFzSxsyBb8dOYifOxJlmOXSFaUD9fQbWKnf5gPnUjPY0aA4X3YQspNYTo5I?=
 =?us-ascii?Q?hKpmwVrtw5NGYwFIbx+qlRVEBlcgRj/oiyoHIwMIgGCacoJ0Wudn+ZiZfMsz?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c2a979-fec0-463c-9697-08dc89e63a79
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 07:15:09.7233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWRnF5YMInCA6eRWVol2w/DJsW/TqPMNEAaofToroiUuQUXlNo+fSeaoLtAvQ51MqCfBILvMTpl7tHP96BNDg28/SIeSguOGyfIWZSdn10E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2956

From: "jackson.lee" <jackson.lee@chipsnmedia.com>

The wave5 codec driver is a stateful encoder/decoder.
The following patches is for supporting yuv422 inpuy format, supporting runtime suspend/resume feature and extra things.

v4l2-compliance results:
========================

v4l2-compliance 1.24.1, 64 bits, 64-bit time_t

Buffer ioctls:
            warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
            warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
    test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
    test VIDIOC_EXPBUF: OK
    test Requests: OK (Not Supported)

Total for wave5-dec device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 2 Total for wave5-enc device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0

Fluster test results:
=====================

Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 132/147 tests successfully               in 97.421 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 77/135 tests successfully               in 37.233 secs

(58 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Change since v4:
================
* For [PATCH v4 2/4] media: chips-media: wave5: Support runtime suspend/resume
 - Fix warning message

* For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
 - Fix warning message
 - add Reviewed-By tag

* For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder
 - add Reviewed-By tag

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
The DEFAULT_SRC_SIZE macro was defined using multiple lines, To make a simple define, tab and multiple lines has been removed, The macro is defined using one line.


jackson.lee (4):
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
 .../chips-media/wave5/wave5-vpu-enc.c         | 308 +++++++++--------
 .../platform/chips-media/wave5/wave5-vpu.c    |  43 +++
 .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  14 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |   1 +
 .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
 .../media/platform/chips-media/wave5/wave5.h  |   3 +
 11 files changed, 420 insertions(+), 345 deletions(-)

-- 
2.43.0


