Return-Path: <linux-media+bounces-11283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B10E18C1E8C
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E10D7B22CC0
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 06:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4230C15EFCC;
	Fri, 10 May 2024 06:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="VQ5Vszep"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022018.outbound.protection.outlook.com [52.101.154.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A23C15279B;
	Fri, 10 May 2024 06:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715324316; cv=fail; b=SQgoAW5j/YVvCUj7fTdHGZZqwfGufboLmuoa8J1Jawmtsj6V43pN4kNByy69zQfmCFeTYRZ9z3UxYPn50BejPuHG3j8QYOTNslRy4/AFdnGHlICVRoXCXnH9ApqjSqF+O1AgsXanLnFRuBCl/vknz9qVdNhHltXkHSR3eY5TomY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715324316; c=relaxed/simple;
	bh=GzuqB0SK/rv6ktE5FQffhUddy92c1+5tV5rP8cwc23c=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PUy4UvvLU3EGwWtr8PxgfgrELE9LVVEwZfGczhmd/uvqfDyQQvMPm4wpHLcwhOHt5S0FddiuxEfR0Zk22+n1wzR9RGb0Q1Qk1OhAcNe36LANtU2grS4dpAR/7NhqJ9I3r+AcQ9tkQyGOc2F9Xp0AYTrjnAM60zwpSOUp9Di4IfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=VQ5Vszep; arc=fail smtp.client-ip=52.101.154.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTFMr6ZQByzOYhEpvzO10dslVtLQ6seK+Udv86poO4N0ef/iYA8/i/j+7CCL0F7bCMtdeQg1AuZPiAehIe/OnRy6BI/cwcawPPcExWN2UEx9wx4rHFBvpDqrRZyEfLL6UumwUmrP+zk/8J+bVTq4slR6y4XRGoKJheJMvbcbu5Rvem/yRUKdDbuzElRPE8Xf8Op5ELP1bY5kRKrCV5qSebhuBTUHqnWNz7B7IVzYxGx/WV2sAI//4zs0SfPYLWBqt1ToLcg98300OjDP2voQkrsbQYFX+tjQi69UGzBDZB+knRqyRpe4vT7jr/OSZkofv3JzIXf34cbUrNyL0bCOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hu/S57kFyXbHDjGXYkcByb2eBDJUAA0zD/F8SzXaIX0=;
 b=bZGUIf0ptvKx2gHrUontAzJl1H2b5hxoGTD0Wv7AGuXfzthsyIO9ZKV1PPtX3o+PTkaBFY+tR9MfsKHzBCucdNcbkkswRjZIeqoQ6eydPeqGM7fd+tfrrT2a+I4x88WS+4JDm9U55LdpWkglaZ4aI518omhqQCP3vDb8rdTbi77Gp+/5Ed15qnpsUBbKd3kWlXpiwwkxlG611vxnlFX9v1TXMYJGU3EEjlxqVkhPoQg46kFbOmt08xQAfSx0gZwvlzuS9eUl9yGubxPdyI3XAp6Fv5f1GtZ9jIc6/ljD03r3gthL0jzzY92S8Iot9AtzXD2Id2Ia02Ou91SkFScghA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hu/S57kFyXbHDjGXYkcByb2eBDJUAA0zD/F8SzXaIX0=;
 b=VQ5VszepznBMfqS83LnP04XmKL06nuTHKaLi3UKvcxqNwhsdIbGlGmjkSorsizN+oLzYiLoKO5KifAz+gXvr/m1NUpqNmvQk0W45IuJmo3dXwssXxreRi8VBBiWAntLX7AWxQuWctVLTKAUtu921WyK+F5GCffUh2vSXgJUM9tM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB2247.KORP216.PROD.OUTLOOK.COM (2603:1096:301:12c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.49; Fri, 10 May 2024 06:58:27 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 06:58:27 +0000
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
Subject: [PATCH v4 0/4] Add features to an existing driver
Date: Fri, 10 May 2024 15:58:13 +0900
Message-Id: <20240510065817.743-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0033.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::19) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB2247:EE_
X-MS-Office365-Filtering-Correlation-Id: db6afd9c-996c-446f-c2aa-08dc70be9798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mPjjgXcuMBHzf0RgUZSvOOzyY/OzgbF4+QJyoaosmg0xnjkwpmQe+c/PX/Bu?=
 =?us-ascii?Q?S5W/ijA9CpcTAx4dmkSatDT17Rx4iwDh6BEoHAF+drGB1oPKKpLY1571ONia?=
 =?us-ascii?Q?Zzf7Pj3Z4JYtBRsRvHXfoeJ/gmsugddPI/DyBE6dSDhBrWxprZB/zJC782Mh?=
 =?us-ascii?Q?0SeTCidnBuRh96EhLoJpKvBw9R/7szTtnxH/E0EB+Lv2PpqGsShDTVbA7ZwO?=
 =?us-ascii?Q?0y2PC/37ChVKmow6Gv+MHymd3XCE5B/LWAVuIt/AB+YHtqRCf3OfEKkY8dKd?=
 =?us-ascii?Q?3kwuTynvmZ3ge7pQ1FGZEPtQE6/HktdPgJZ/syI67PLETjqDZPRbfseOJ+aK?=
 =?us-ascii?Q?TdPOckoAVGEG6ytlwEJOxg8u3O2JmLxoCT0m2q5EWRyyOHZh2PFDFQIMDESM?=
 =?us-ascii?Q?Vvw/kmD7qepeWlFl1e7TuPBauPRqULI4YoikyhSh24ET8idvK0NDuuJqTsAb?=
 =?us-ascii?Q?U1zGAmMzUVghgH37UkY1vb6+VoONYTUlanQiu3WUo3phuQvVxAmFeHJ3rYbv?=
 =?us-ascii?Q?sFR2yABFH3KuLtBeAMZKeqTn6Eva08ZAFBpxWwtGYcam5jS7eZNvzvNR+XDP?=
 =?us-ascii?Q?+PcIJa2UztqQTo0ldBYBX96785k5aqpzQJSo/gqzoNuZw9sCEgJbr9rUdAYl?=
 =?us-ascii?Q?eIeCJJLYVdeMDhD9R0TnkfUzomfYEvxarCebQcr5cnN4h3FmrZoGvWbuIW7k?=
 =?us-ascii?Q?jzbA376vMGIBgtkQAC+qcXA9qFXX3xLuWukYAbmUsYMFZWsHrl5fXUlZShjp?=
 =?us-ascii?Q?bS2G35fwEB/mvSqN+RJEhswq+PKv/C8PbEgFmKrIkqz2cDWxbf5G22woEyUr?=
 =?us-ascii?Q?UmQ/tlTrNDFuDEEBmiPsov4Tmmw9ohjRoVlE/azJ6BA9kyO20tXMoqaoyUvJ?=
 =?us-ascii?Q?E2Zu/qjIlQdk1jQT3DSmJHKpEZg3n/yKsuV7ldc/fM1to8xDfGrCnTZioolb?=
 =?us-ascii?Q?+namh1usPjK5UdhW6xhaZAC0aOLdW2K2BGuxU6zDI9LoFBpo3du8UdldV6DD?=
 =?us-ascii?Q?wg6ZmMDwl33CEcmciyHsO+cUuytMObYE8UFFeY2JmPIdGUalFeWY0cB87aJv?=
 =?us-ascii?Q?nehqYNhDK4Ylf4823AXtYD0dKJz2kBcp3n8jUhdaycENh9950NPTL/ExBhia?=
 =?us-ascii?Q?h0IVOA7dqlNEnWO0wF5sJ16+c9D9k6doWa5BDm4fayaDMERs+uSnakQenm3s?=
 =?us-ascii?Q?B063DPyusCiKlSS2YEgv6pHPSVlXkXM8diP8SG7YkpTiVJKLKdd+RCMafpmK?=
 =?us-ascii?Q?sPDj4p2ggbE35hwj+/1hbEFQWHxWsYsp1Uzl3dOz3DMkEAVr5ZbsFK1pGb77?=
 =?us-ascii?Q?a/Lsm4y1zfZ69xqdgSQInVfThbSkzGopscz1T/5OhUSaLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jGcZTAddsmMvpMgdO1POpiZHtnBsHlPKY/yFuwbHMSlCbF7s0fhzZuU6tBq5?=
 =?us-ascii?Q?Zj3NhF37f0bTQXTx8YJ41IcvIr5n2abXbT1NA0/AmXcWDB+VUv+aBcjXtJ1L?=
 =?us-ascii?Q?qgkGtDmKKaKiXI4RQipE8eQ7D2i73Lzi0NhIV5qzeJ6JUAKof9tHFZ7POoJj?=
 =?us-ascii?Q?BAyzkjUzkDOe47v86AsFPVWRfZVHsG/YO+KPGTWjAWjCynAhpkGavAbTWgH2?=
 =?us-ascii?Q?yjzCKV/zniOvF1BGRlsh0VOa/avM8OJHpzDaOM8wywg3TH45NuNb7TYtqfJb?=
 =?us-ascii?Q?dgcFso+CXFopRLkWVStH2WonpkwAzxDBN8c1IvZawYpG8+zgb2y+XWRUNGLw?=
 =?us-ascii?Q?2xGib8MiAngEIu7VzADpAT1H3c0FFSnQ3n50u48N3hJ+cCJq00msz6/wHrKq?=
 =?us-ascii?Q?u3R93gWVqOqBA/SPyBbMhsjGZOoD+Ynk7XnzIb1QDeaJBuxDmyJHV6Z2Q0+E?=
 =?us-ascii?Q?qda+VVJGloP3tFwmWAWgy64Mm1YnVvd158Ik+eGKyJEasYrhLt9Pb+A7CDnv?=
 =?us-ascii?Q?du9LL2kTJZQ5UwTQblZgvzXGxdrfJocJxI3Y8ZRtao5drw8NqAeEl216tRMa?=
 =?us-ascii?Q?3uSgjDbCuUri13t2x1ang8jXjmRGu9xei+4hnbEmBrDGUwqekHNLveewmxRr?=
 =?us-ascii?Q?WkkOPwgqIcOLlpkLXD+EhPZ0t/vhtvQ6hEubbx2xtIbtNKWvvpgQkZ0BSvDT?=
 =?us-ascii?Q?NLzCXlrPQSEuZcXc7BrQMA+lJzP/l+iitvKztCdrkZ8b4F8AA/+3Xb5mnjYm?=
 =?us-ascii?Q?s64q0hQ9mW4X3t7MyV+bwrTJZbitwgJJPlzD+qOidBlXaB7KZ8OryjdCnILY?=
 =?us-ascii?Q?T9PAH1loKzsj+Z8qcsIYnDqqsScaQKti7fz6iCblxaBvWtNRiDRu02gwQ+a0?=
 =?us-ascii?Q?kxLg5NpplqQJYF/1UG/vLbF/uB+WNDGGajo9f85S/5sN6MTOSJ+USl4r0VIh?=
 =?us-ascii?Q?guUMdBcFF5HZ75+FuMUVVV66OcPPFrjo5/i5QGvnnP1gHRLlaNWjAO+csaK6?=
 =?us-ascii?Q?72PZpTg7RWh1YyC9UWFVSm0kvDovwPUOPpaEMIpHRZLEMLSfo1asQPcyiTto?=
 =?us-ascii?Q?CX7xrzO5NkuRRLeBGfcOnR1OOQDMgrojdkMU0Y76VPxUWlTgiWQbWif9onjC?=
 =?us-ascii?Q?e94mdKe20k2X2SHis5Mho6zSuzRkw5Zd50YeSUUgztLCi5nle9jZrMabvsVh?=
 =?us-ascii?Q?Hk7GSX57R7Uc3IuIM2wanPEjgGCO40fZOxHV3l6dZYwLpuNG6EpiVmfLLbDf?=
 =?us-ascii?Q?T4i+HIAJTsi8yiVkUhHc/mNDhCsiUKbG9E9OyOoUonFEx3+N9WXyZBbf0szD?=
 =?us-ascii?Q?mVGdb+1rbV+ge0r9ZIbvBrqGJbjIVUGPM9HrDUqwQg8CwBVU+w6R00OrVPMy?=
 =?us-ascii?Q?ltTz193MV2V2TMR6sa+krRw9UZeb4a7O1HBOrVq3J+GDFPej8oP/oQ5+xTiP?=
 =?us-ascii?Q?wrHkxgCAXtqVT0tfuX9v9EmgIq1eC6hda/4zEmsG2u/fGB/PtB7HadcBPPQB?=
 =?us-ascii?Q?j8n0W72igB7F3bsVm3hdL9XS3cYgWGelh/A6qmRyHe21/r/gxyJfPn5rgFey?=
 =?us-ascii?Q?YyZ/MIyI7cwL+pN7c0fLA9MLObszQD+QQdD+FLcXY/8FIbkMQ6yz1AFW/lfj?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6afd9c-996c-446f-c2aa-08dc70be9798
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 06:58:27.0466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyJR7OtDAWp1GrzfG/IYTaQ0Rz2gRWbVLfQS+3e/teyUSHJv8+mbC7A0VYM0n1pfdCFYKhhOIZfNw3H69/XCRYYpYqOyAySe4QPOl2Ad13A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2247

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


