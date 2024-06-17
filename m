Return-Path: <linux-media+bounces-13421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F193190AC17
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 696C02864E7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE14E1946BC;
	Mon, 17 Jun 2024 10:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="h/WRgR2M"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11020003.outbound.protection.outlook.com [52.101.154.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73721194092;
	Mon, 17 Jun 2024 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718621310; cv=fail; b=fQl1jA+vHsKMXZdp2lMbHoz94KHLPAYKyjghHOpyaQ/bRpXEB48AcpijHdEuqh/Qc4tQUHh5UDP1l4XuBb/MgDB9gWazS4eLfGGLJaY9F03ZjWUm8VBA4zL4CmAJ6/EuMZeBYav26smMoF3CekiPcrmY2gLthNFikRbpXK7Nfuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718621310; c=relaxed/simple;
	bh=/APWr31pLoZLZrTfwsg30q+Zp3D0WRfGR/n0cRr363E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jN/lQ7u8EgH6J6ShD6R7K9Ew3f+hAqcyZvwJtv69UFwsKZ49IfmB9UZARLQ3MKwHQRP3IXyEoE0HE6sgf4+bu4J9pbS2qeQ/ThVMky94EA+gQXavjzHLm5ToPYa6UURzWdCQ+vbB2L+v3QY0JDqa7rtDFlgrWIgmcXVwaQlIye0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=h/WRgR2M; arc=fail smtp.client-ip=52.101.154.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuZLggDMbcIzPCh9Uk1irKCmHyX/7X7q2u3aKVmAzx1gEwO2zcmYREAM83dlJ60Zo5ttw5Yv/31l+OgAPICZAdXHsvq5z9cJzziExxb5S8KstmCAFuLeExXQq8TZ4aDL7PcNB2Zup275kJAFBwSBIr1i4ncevfWHsgPYy0Ew1kbVXX6V/DU8aI+U/2ya1YSlbp+/SIBPQ2+aIWEZktGhbSigHKfrOgcwDQqwSGb1WRXfnFKcR+y0KHpBD3plkSV5VQNy83M5qNjmrk2KRaf1nu9EUNwwnN7oJbqPCnkwb1RLLihyAFJIXzre5S9X4UjPeD/Le1oF4GEvMhTltudCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/P3M1kco5QOdXGxb/cODRr4hDyHLouCHnD2YgGA9JWM=;
 b=ELQgDk6Wq1mIFbFgQD4vxfH317e+3EdG6eDL+H+Xgo6Yu26EtROV2BKB/+BZkzS3jAR1eOWU51o+JO4b3mCt/30wiXZMI56o8XHDF3pmK8uqNO2flhtaJ/ksYSvJpwTTd0LmPqgMGIBsqdAnL+dXDUiJGDipXoHP19u42H/ZYSJzdP2So00GTo1QZJVv92S+PyylaCDLhxlG5zgTaDMixzD80KNLcGKcWCDzQ10E1PirKZcmHULZzDyb3OZ1ZhvHd7v+5q+PQVldO4M+YxjV43xXCGE8IkD4bsSG5f6cJiUzWwlkNXotgC1MJGocoDi/dVRt05kZe41Y36g6Gv+Tsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/P3M1kco5QOdXGxb/cODRr4hDyHLouCHnD2YgGA9JWM=;
 b=h/WRgR2MhZF8aLSeXm0W3wOWff1hPyJH5U+mOS821rf3PNSLd9bYgpiTbqK/LI5ovs3XIHFr4qnKq492PMJqnwsymXwSfuJqnljXvL40IwYuA0yx7VinyyksnHMbg3Vz6t4kqInlAcgEDosYGe7NRm9atvqfbl25MOdZjiqY/ZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB3099.KORP216.PROD.OUTLOOK.COM (2603:1096:101:282::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 10:48:26 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:48:26 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
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
Subject: [RESEND PATCH v6 0/4] Add features to an existing driver
Date: Mon, 17 Jun 2024 19:48:14 +0900
Message-Id: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::16) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB3099:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d27a8b1-c85d-45a4-0097-08dc8ebb0425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|376011|1800799021|366013|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zakaVvYfiVgr6spyABoSqi59bkh564PKn0BstWO0qcYtKec1Fjuj9+FE2U3j?=
 =?us-ascii?Q?h7yFLZ/JgLo2/6/am1SAwuaYhrdf2VH/Ups/8mwPcyMCcyBK/ENjSvTQ5mrg?=
 =?us-ascii?Q?R0tMmvP+6SBdVF1dLGXddal5Cglb27G439KwXYx+GwfGPxL/1aaxuyFDogrv?=
 =?us-ascii?Q?haRvz19L7GxAF+KcXxIIgQPpdOi3CSQdqOCuUnr27fLKxKBq8RfVqUgApFdW?=
 =?us-ascii?Q?Z6kqfQN5/y3VxHyly7UBvQWFoH5jdO4pO4K98D3dOESQw6iKPibMj1X1x/G1?=
 =?us-ascii?Q?u5kb4gBHkE5dp8oe7N4w6UAZ/eQN+5EFpAcSrtIa6X+E/jjQEPo2F464qIYQ?=
 =?us-ascii?Q?Cx198I2yCcOYRjzLQIsswWfYQD1nl/oZXVysDJ9dKRpcGlV///xXglaFX5Ay?=
 =?us-ascii?Q?mPvIEQViERPVkchGmKB/0fWw+5DkuXL05w3WjP+puASTXU59uVxD0Gy55kUz?=
 =?us-ascii?Q?VHz9ujAyLBoPbrDXspz1S9109HJoMmCX2CAKiFo/nLn+quFfOF09C+mZiOWp?=
 =?us-ascii?Q?tIPS96jsfxfJTs7zUiGc8AH75V50QwHRSyqXEVFFYsprW4CJhQVQvXPQPt6X?=
 =?us-ascii?Q?hVYzELwz0ReETfz7Iae6q2VfGNwqpdYygJKtPMs+praL10G3bDNdqNjEZMEz?=
 =?us-ascii?Q?7k8IAreToxL4ZnX6OYf0i9zt3K7RmITyFiUpGHvJb3UfBkzDkP2RW5wvca2t?=
 =?us-ascii?Q?7Dfnp6jCBsFCHZgoB5ye9cVCgA4hmaUCrwZ4qdbKjtLnhK4B0OC2DyG7kynm?=
 =?us-ascii?Q?i3R4xE3SVIORgNMre/JPlQ0VaYbC3RSM/0Qg8fjOmeyZdSgES8fVEK4ivdcf?=
 =?us-ascii?Q?Ti6KHn5CMqfBl5an+Vd0RrR9hbRHLG/JiD+B6bwRhWnFNnNnacDWyQoyQFUg?=
 =?us-ascii?Q?FPCsgVN4Pmb6deHqwzzrt8BowIfm6NEmoeFF2A3ED+k+Gz7AmEVWAps2CtWK?=
 =?us-ascii?Q?J/6o3rP68crPPeCWk6Y63WI7XUUUS7yBJIMLnmpQ2rJ7LP4fLGdxw7+caaC4?=
 =?us-ascii?Q?+l0GM6yBSshv5IOOGX40CN0lKpmsVOdia3dJNXbVeAHM4po6WhttwpRn6HrL?=
 =?us-ascii?Q?cIzwedDb5Ve2JFnFNPDWAsGgsZAKyP33Ag5uTBN2EB2Ol4OPGj3J01NDDyD4?=
 =?us-ascii?Q?kJjjMQPWq2a+TRtxPebXd3Bzzy0uMuPnxq3vO7LwsrrWIBiADrFFHVwKrgCo?=
 =?us-ascii?Q?pu2B43YO0Ucpdu/79GfYzUXtyoeyDG2gBvmNIYRQKm4b4pWWPeacing9Tgzq?=
 =?us-ascii?Q?1j3jj7E9/AImMrDJpXxzpXJKVZ/dJwxx05n1Ej5rtQWTvS3Hin691pkVJZF2?=
 =?us-ascii?Q?8THeQlQed0HhcVIhD3koBqI35XTqLRGslOTVj96ltidQrjefG7lBiKh4u4my?=
 =?us-ascii?Q?a8ugs7g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(1800799021)(366013)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rvmgJFCp4DKsSC8ld232e8OrzMnwtWJv5blyDeHsGV/kPHZy4IE1pn/BMwCV?=
 =?us-ascii?Q?+HGTH5cyGynhHY13ceyQn/Ms13Y+/SXt552Cvaka65UUYyKkLv3zR8mNRCDL?=
 =?us-ascii?Q?tlmyLidAA3IH6LYHvKz9iXJY7w5Nyq30G2snG1GsfYqF0AvUvVfZwLWkfsVf?=
 =?us-ascii?Q?BmOvNG5dEPLLPhsKHi2ivR37t8rql26FAogf7zE17lwjIR3oKx2Vzu/Xz3pJ?=
 =?us-ascii?Q?WWm3DFxXaWkrYMq44P+Qos4tWwyQBgvExX3FY2KHUukJLN/oXo2MWqHW0cl3?=
 =?us-ascii?Q?MsbrVHr4Tgx2WJuDovItsxkq7EA+m2EIUDM+qmrpnq70kvrKe+BlegXccWxo?=
 =?us-ascii?Q?F4XhxOTzAIBQ25jJhyg7dcOIku3a8mwJKXNc7E3SrM0m/Fr7ghDpH1FfLv0N?=
 =?us-ascii?Q?jJZODxgvLp42buGoTjTSwfT9dFyvh2DyiQoPyj2d/1oL84DryED0aJrhU2gH?=
 =?us-ascii?Q?e/SxR2oTpajQZX0wfx3P7Z7zmTvw1wwfsBDxriMFK+5a4WXXL19H2di6Lrlc?=
 =?us-ascii?Q?JXVJgqrnUs8pQF/ly5UiesVp9+XcYlaj8USDSyqYc1dn4RSZQW5pf21Cn49v?=
 =?us-ascii?Q?jxJF2bntKURWX1X7cx2BjzjBGZgo7upiygVSu3tAO9s8LvHciQTU/Uad/Qu8?=
 =?us-ascii?Q?qkXx7J440ogcpDadDlYVL/zl7XsydYVxPcjX6hz1nlbamFR3CrylJw3g19Y0?=
 =?us-ascii?Q?N2bhxXzYCvcC/w6Ps2F9lCj+ko00pYNOEU743pZny34aZGeWBnskLu0k6Mnx?=
 =?us-ascii?Q?jIJ34GBZuBEhjnOhdCVcv5SyNBPfjhZsIAwXoftM2r1HyEDNmutrkPyi89ha?=
 =?us-ascii?Q?Dyd6bhgCC5LTE2tcJgsOoz0ft5dQ1CycWidaWWZpXzZ4mIUHUe7uq/r6akyv?=
 =?us-ascii?Q?dRuqMM00bI+I4L16E9Zn0J8NouY4jsTakfVUrk2MVNSnUDFs2J/4GlMPYWGo?=
 =?us-ascii?Q?uyze9k6XB6PL6AMCcpTEkEUVPDsxJqmTtaZFGw3+nayuLjECCiFNoK/QLfam?=
 =?us-ascii?Q?H3VY132L0q1reERjt9YvRG9KQhNpbp/Mx70KB1cHdk+UB+W7ASQsGGS80/Xv?=
 =?us-ascii?Q?NJ/tSVgqee3w45lKuS7yGw26erNZ/zCkm5mhgcjKj4r9WZOENbop6hsGbY0y?=
 =?us-ascii?Q?QBcrrxgjOuqnDRfv2ah9IeYANamKvYwkWCpAlNw5bQW/9vtNsmVJXUVV6S43?=
 =?us-ascii?Q?rxqnPF6eJQhSfuZbC5TsDW389NPIG88DdvKf+dMJRcPXyUOOOjhI3oJLFxS6?=
 =?us-ascii?Q?jUpAtddjiWcAu50vQaHdS66ZnO5PaVV7krPur6xptYdVciBSDZ3kWII4xKvP?=
 =?us-ascii?Q?0JmhaEgdSo9N4WeH1xDTOJMrKHALLyUrhwUwSrC1Z7y77Q6OWw12Mt6xph9a?=
 =?us-ascii?Q?kjQStbKGJyT2bbsYKGK6LQAAr+K65YflTN/X3K8LOJei9H9bVeATy8kEyKkx?=
 =?us-ascii?Q?iM+PlBzDSjcts3yKqEDC46ZH95iwLIhDUtRRtYAUm7nF9TmL4u4OJ+Go00vf?=
 =?us-ascii?Q?RYCrhaY7iYZcmMP4iIVLM7JIEqdwgrnlAPQXz7wNjwn2VJKCeDOFqftJMFuw?=
 =?us-ascii?Q?wRbqg46tUJMJwkeQVXXcLXwlqJmP79YXQDT1V6xIwSDhLi1viBMD6lmbjV70?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d27a8b1-c85d-45a4-0097-08dc8ebb0425
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:48:25.9955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ylPY8Z1JA9oL5T+5wR31Z0I6exnpVOc/Hdj+jWfbQfBSVg3dPwLsZYJTVKQYxXnFSW1HjOC7+D0HsWiNmZY1GTdzEEfUWfDMpp9DiCyDk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3099

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
Ran 132/147 tests successfully               in 88.745 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 77/135 tests successfully               in 32.044 secs

(58 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Change since v5:
================
* For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
 - Fix v4l2-compliance error for the vidioc_enum_framesizes

* For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
 - Remove warning messages for the checkpatch.pl script

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
 .../platform/chips-media/wave5/wave5-hw.c     |  30 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 316 +++++++-----------
 .../chips-media/wave5/wave5-vpu-enc.c         | 308 +++++++++--------
 .../platform/chips-media/wave5/wave5-vpu.c    |  43 +++
 .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  14 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |   1 +
 .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
 .../media/platform/chips-media/wave5/wave5.h  |   3 +
 11 files changed, 430 insertions(+), 346 deletions(-)

-- 
2.43.0


