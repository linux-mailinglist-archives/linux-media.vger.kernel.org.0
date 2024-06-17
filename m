Return-Path: <linux-media+bounces-13416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4169D90ABA4
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBB68281EBA
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E258194AFE;
	Mon, 17 Jun 2024 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="W17eusmi"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11020003.outbound.protection.outlook.com [52.101.154.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9EE194AC7;
	Mon, 17 Jun 2024 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718620929; cv=fail; b=crSJl890sYBIWBBI7c1sgyE7QPCPeeTeljmO1i08yXg9CHL4/jEm/afor8aPcnoC2HR+fOMhFyYUYab2V5L1DPfiasc040D4ofqsZ1zNrnIRgNUPSPilRH3MIANeZOXv+xH2HE/t0GIy4QvP0cK2YHsq/Arwfe52DwZAxyi0EqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718620929; c=relaxed/simple;
	bh=stUvwyKv1HF2nxnW5hV78WVDZ9IEYo+RES1MFvq7IFM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=APtd6EXVihHWScaj4Jp5LXqQCaboARGKITLebkyfBrB9RBOB9vOweIQCjfqX2YTBPB9qztd/WZUU4TDbQpAYFWLjhPNKjSxreI1WORX6efJg8q7ORvc2mMDiecZ2OKAAzUcxzAgIgFykrvbhR8wCaL0zY2vLyvAZ4S9kJn4/gb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=W17eusmi; arc=fail smtp.client-ip=52.101.154.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lh439hjXi/LlNzyxcVMQ3l0ZVy7knBHXVWOV8/tb8VEflVa9n4PNNlK/dlMzhyDuwY0YV8+9EoWu3A4vaivSycdDW0ZMzoCA2SkM98RfUZ9Nb5393f89fLSk4rfFUksvEmIzJeYv8D55qI9YBfZg/0B8pov4gaHODv4SCznK0xh3vs3HkbTah4xXqhU5jptUVR/Ln1iPFzOH6/DsUVeJyitGTModcdsX+WXTRzORvHcE+nxpzwkS/BfR5WJ6jC2hjWk3imHKvY9A5NVkTC28Bi2ZudhKm1IMfIGxsh/hVld+WxDIPzPyca0PTrgb3jNkWXMgKTEMcZjxSAyenlm0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGJjZNI+FO2TOo8z1wFxVpH+qQNqYHRTSQodRwyMt/A=;
 b=kMeo9iAk4yFSX36EdWyjeEuxq0bXoPvMSAOynaFlNE3dv6NFdwx9FXmJDiUpZZaxNkCUTzaskgFAePIGW3zQvr362b4JMjZQ/grXw9qx9Zo/H5NnGA3q5IXgRX3yKH0wEy1hZ93zTEo/GjzMPFdrOusQs30iMpNueAVIpVbFWko/wUkbzelasXcW9SCN2sBYYsAwvUE8Y6x9qR/XKQhL/RpyRGiVX4I6sqDJvg1S5BgwrQlnnNCdFUfdZOAjXkja+nZmJr3xfzFOwiI+mqmy2U7LXIgFGjZQDHtJ+7Wm6GCDxuiTPfkWgbjdLJrMVcqXM91pcdO8iZVf5b3xPfBReA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGJjZNI+FO2TOo8z1wFxVpH+qQNqYHRTSQodRwyMt/A=;
 b=W17eusmiRAO18f6FuIJVFx6IA+0dl+TDsOD/nqVKqJL9Xo1FVtMvLXmmz3lu5sDxJUJ053iLJJveUmJTrfLHTYpSSv4Yez1M1eFy39vV1TJ4s7rYiiKTurkgudqG3qsyAFSkrwj+8KWIfj8s6Wu6dpAlFXJDwVMstFdWE8dgzxk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB3099.KORP216.PROD.OUTLOOK.COM (2603:1096:101:282::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 10:42:03 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:42:03 +0000
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
Subject: [PATCH v6 0/4] Add features to an existing driver
Date: Mon, 17 Jun 2024 19:41:51 +0900
Message-Id: <20240617104155.153-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0185.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::9) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB3099:EE_
X-MS-Office365-Filtering-Correlation-Id: d08393f4-03e1-49b0-b04f-08dc8eba201d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|376011|1800799021|366013|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bYZi40E/L2kJMMScWqVhGQk8GehNclv1Vc+xn0zDk1UmcSGZEmrIc3hwVo6Y?=
 =?us-ascii?Q?b4mFjRWYemJCUxpuBOn//l+BYi+nrR8cpYRyp+qNGv0eeuUWRy3hmdmtigEu?=
 =?us-ascii?Q?OPADLKIgPQTxDXi3YDPMC8xcBavzS/Qv184miB53U5Mz0c9c0bxWTgLIEKlR?=
 =?us-ascii?Q?D7Ex0AFhQRi/ZWDlHec6hhRNV6V9k3jehQvF4/76oRINtGiUSmLKviZFY0Ya?=
 =?us-ascii?Q?gploKd+TQvE0dAOvAqXFmhzcgWFUD0iaCyVFrN2T+8YbQe4tri4q7lN1otaT?=
 =?us-ascii?Q?m+mg3A3MXbOHtCujI1OObzyFhgWe8/qmkkC5WzENLd7ElRGUiv7ifMmf6lFT?=
 =?us-ascii?Q?oZYk9ZEfEPqPGxnGAuQ4FH9u5lctuKbt9Jr9qCp9n1gSOK3orDhmQ0x50+4i?=
 =?us-ascii?Q?OpFVX7brhQwsscQCbQOSOVsv9XRh4+y2VjjrOGnsftPCWJY1VQdfaGk5QAgL?=
 =?us-ascii?Q?1QrhSLcGEGkKN1s8stQxRfr/YizdEYOl2WZhfh2sDReFzePABIemxMCMvNXd?=
 =?us-ascii?Q?O2VGYuT7A1GuqFirTS/BzrCiWt4ERfoCY8KLBNid2utZyvkNuTgR6bSrOUtZ?=
 =?us-ascii?Q?s24X2br+Jm80CJzM74n45mZmJ2bOIo4x8NRvu0sDrpcxu3seZmvNG3S6UWGN?=
 =?us-ascii?Q?WCUnPosDTxi+2X4H+TSp622TboZMJf9ZwWQKtvJbfjM0nexjeu7U8xp/STvm?=
 =?us-ascii?Q?TVBMdIQr64oY5tHGWoQXl3Ag5k1aLbaSVmUC6px0pVmHXrW3la6vFKX3u+aD?=
 =?us-ascii?Q?En7KL6Nr5wMZ9Gj3dFPxo+A0KG7nLic8eksoy5ppWIIutO8tahm/QtykaJXp?=
 =?us-ascii?Q?wXHi7ha1Dr6uqRbjDkM4x6BcVto6X3wmfAdBPaKLSKTyHgs+JXhlxrZWX3Ow?=
 =?us-ascii?Q?dKMlHZ5LKjdhcVDYWGoFlKyB4/3E68Akw78RI+mJhXsqiCJUT/E+hXQ9nv/l?=
 =?us-ascii?Q?lbF5Vcipk0j9C/hIrIz4TpZMXx0CWzxKSZ/iiQVcLYcZ/Wqbl/zuikvlqcYq?=
 =?us-ascii?Q?XkxPBSRnt/UlYhxrQmX5jqaWgaINxslIskYhwIX/F7EAOuKG30TDWwbvCn4G?=
 =?us-ascii?Q?HKZEY28qip7DiZM1ca1eSWOnb5LPZWSpR8UNhNRPVC/zV7h7vvyao7jLl48T?=
 =?us-ascii?Q?y+0GKgf9kJ4IoJqQS8GnH1qd/jT6813vA+qAaEpbHb4hw2UUGwuyf8Ovzu0x?=
 =?us-ascii?Q?xiLjTRlBN4rK/tHBTDF6jUJEzg5AhGoMcg0B2vHaV6OP1fk0F8ApFyHT19O5?=
 =?us-ascii?Q?D9+T0ZJSfJA6JE6UP5aInR2qgGu0qimwtlBQMtuJtQ+H1oVSnZsHRW28O2UI?=
 =?us-ascii?Q?CZsxJeWt6TkDVFOn33k8Go4xO/uotZZT6ACkSzae/OzUO5GGvQPcsdMxqy2k?=
 =?us-ascii?Q?5c6Cr40=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(1800799021)(366013)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AlZi7aPHVegMAdCujHuQmSg01lvB52UgHqOSgeZ6SJPjx3MGFmcGKF4l4m/d?=
 =?us-ascii?Q?MumE4dRxNZamN47h2L0nhk4uoyiK+I0b/FShFWfDQN6INJADiwSat67ZjwT/?=
 =?us-ascii?Q?n2y2YkineB7msCvRAgt1XgR9fDs57NJmX1i21o9MAnAiU0lHqp9ElWN8Fzac?=
 =?us-ascii?Q?sh2E168D5SaxGPKPXMbEINzcQVTJrKP7IjvngH1Ydlai4Rt4zDVt1x25c2sB?=
 =?us-ascii?Q?S9zZgJciMiIUxNatksgk54GiwyF16v5gGKKWv6N5/BRFfmxQlf0eKtlLi3kL?=
 =?us-ascii?Q?VXb1MuIiX2QuxNQkBtfex6qRZ0cY+elSashQEl5JVlo6M/JIq6m0LquTZ83N?=
 =?us-ascii?Q?GwqAIge+kfyefmKqKWxb7BNL/BEl0CwdweG/MUUaZ24vXKrRGdbij5BZ2SXH?=
 =?us-ascii?Q?Oo/lgPQCUq/j4vdMCIxsdtdiZlBn6uPcrz4RBMWb+tixwU8ax8VoIp1iwxH/?=
 =?us-ascii?Q?qlPFdxc6ybyuGxMsm8yT8yROaLIhQKDNy+leBjtOOoSmEjMPXh+nkBcWcqkj?=
 =?us-ascii?Q?HjhYJ5WO7nN19AK08PZu7FlA3iclLGVIFHNV++BB8JOG/K4Mr+fG0eOf7c9S?=
 =?us-ascii?Q?1YpecMAzdwss8jm0OUfViE+JRARRcvmPKCLKWZ0gzmSmOlYWlbP0xrui7uCC?=
 =?us-ascii?Q?p/wfBfQedWoycy4DrQhY2qRGJF0pPY0ahTOuI5MXvvfTfLFqdqzO7IUj4uH4?=
 =?us-ascii?Q?iXdZPKJZEkHdXFT65pw2iGJTet+uvybBkDOfSDQo6t7Tz4u7xPbOtmRF54sf?=
 =?us-ascii?Q?Mr+CholTPxlFaHaFa+ieYQX/o9DMa1coc3+xcTrjLVQHhwSL5T2TW+6o4ZCc?=
 =?us-ascii?Q?3vpuzFeYNsa5vc7DW4b7lu6amPDwLoZEE+BSczRfEzu3MUx5q5MsDDdSPXuX?=
 =?us-ascii?Q?KsojbB92eEAbMpw+OtpPUnTg9x0uSZq350tXGszPTBEiz9NU+yeENvwhhiBy?=
 =?us-ascii?Q?A1Ew9ayACl0cXnNfcKEAhd8782dCPzGPRQ7XL3HsppbnR7lyOCSPp2oTmajn?=
 =?us-ascii?Q?Afnikp7EV0odejsrwdMGxYmUHfmkkL3XnwumWqMMVrBp07ZJg3AFjvKA+tGh?=
 =?us-ascii?Q?jWkAfewaNw/ooLueM/ganXdM04nlQeC2poLDDAwhG7zs9DHI7pax5lMfWmR9?=
 =?us-ascii?Q?NlVx5AaNQwMWXodB9unjpANiW6oQFmguH60kWpLLkGKo0FnsM+dVU2otjL2C?=
 =?us-ascii?Q?T71vesepyh250siMftWR/lhiK9g8PrRcH+XMo1vM3l4O4K/163DKFaRkDkVQ?=
 =?us-ascii?Q?HnrYZ2rc3vv6mXmw55izZnu6UpzA4iJJuGDtud9RC1z5VCcs4s8eAR8qXQJE?=
 =?us-ascii?Q?dIXyrxVOVvR1KlAbOB9yI7d33SSddoIuej7xaiMBFkx9ulC8uVf3CqhmPH21?=
 =?us-ascii?Q?+VH8nyR+ie3JlZvwJo0OATrDJZUF30jyzBHzz1XlS6UshRTKRygREDWr6lD1?=
 =?us-ascii?Q?mBWPme+6O/++QIyyS1KwRwZbtUaXzk7aIXQT150GpHl9yDGoyW11C1dSGGYb?=
 =?us-ascii?Q?o9LtUALvb8nDF9jB4M7j16/YZWKBqhW+lavLIXy0TxdZHqNfh0DpuVSPV/fp?=
 =?us-ascii?Q?1ISJ2gXBETZmufi0npXa10xJe7eaQZXldrw8KWuxS7DddSzU3ZCII00DgfMY?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08393f4-03e1-49b0-b04f-08dc8eba201d
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:42:03.5126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHqvXaQ0GXKb2JQqysKoafBk0U3EYrjsx6xTTBEssIGtoKv8ixXdWJ1l1e/Oxe6IV7au8B0Kj8u7yDS6jLo672Gw6HiVwkRYp9dRAXw9rpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3099

The wave5 codec driver is a stateful encoder/decoder.
The following patches is for supporting yuv422 inpuy format,
supporting runtime suspend/resume feature and extra things.

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
 .../chips-media/wave5/wave5-vpu-dec.c         | 317 +++++++-----------
 .../chips-media/wave5/wave5-vpu-enc.c         | 308 +++++++++--------
 .../platform/chips-media/wave5/wave5-vpu.c    |  43 +++
 .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  14 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |   1 +
 .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
 .../media/platform/chips-media/wave5/wave5.h  |   3 +
 11 files changed, 431 insertions(+), 346 deletions(-)

-- 
2.43.0


