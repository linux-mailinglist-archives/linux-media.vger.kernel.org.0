Return-Path: <linux-media+bounces-22850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0B99E8B15
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 06:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0124E1633FD
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 05:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBF41C54A7;
	Mon,  9 Dec 2024 05:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="i+wCsJo9"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021102.outbound.protection.outlook.com [40.107.42.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE8C1C3306;
	Mon,  9 Dec 2024 05:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733722634; cv=fail; b=LsoDNjFge7u/YVHOLbxe2zyeezhj8aUmOsR/m773xCBa4kE+cAhyEss/Eo6KEJ+RZ2pJfWmZSXSbWeYbvyMjc+PSMmw9dt6hAFiB1OV8BpyxNKdXBM6qQzdBfNZs/t84d2UD7ftZSR/8vU7zMwsZPkePgjxYD8v5PQ5T+f1Gv5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733722634; c=relaxed/simple;
	bh=rlqO8RxqKqYhtUmew18O3RxLxfmcqpJCIzEOz5a7p1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=k/ywpUtqCSQSKNH0SUISObrbLZoxraGmdlE9OybyoCLhSlQxMJh0x1sX5iGGHkEI7zsuhvDdBh1xYCbiXfYB5BiKMAXJlLl/bKBOhh6tKHjajoeP8wfB8TCXqwZY8OkdqMIvS0dH5EfgCUAGoFf/uvy6o92rA9LqcT/y/lBijhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=i+wCsJo9; arc=fail smtp.client-ip=40.107.42.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFkkBDibbKG+wK9VlvKtfcNxzCM5YVGNvVziPxtn4KaWUm4o6fxGcbhDpWpmdWrMniXheGsWTpTnqS7QNYEwNJXc6PcP5yHperendI/+/swxlCLSS/miru5kYjJvyn9sQfc4sg4REiWk1cw9dEZ71E8QtD3hHkA0ehW8lUCd5IA8DDNjr7PfuwvcD2Z4onS59yxqY4vuULIQnBVAVBbRGqtDc8qP4FH4tgSOEf8//+81CChNoaawmkv2mXJ5/jhIqaINwKr7QWdW49MhcAXxkeYvzbtkWUj5VKy1l5rYscLnWLOqRsuXkrUAah4hCDY50UMvfsnkNJujOytK//BYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/ur16DrCyLnfc+O+UEnH7MV7PV2BICKSYbiljd5Wzo=;
 b=gEpJx3OM/aawV2nxBxdd2HP2jeoxwSQhPBLkHSUs5wR5dgquUridTDXTRGt8Z+JbcG7eRX82toojW6FKGlwgjtblQRhLARcH8i/I/KOtfzcGPpalT2wsbLFdHtQXnyF9TPBVy2VfJnXVKLZ+ot7Dmx0MK1TEGar/K1RpeOmuWPMOudI7oybDQgeV+zEdYDtZJJd8gjiZQtkZ23iYjgVio1fGMywnCHYPOMP7NVtcgM2nWzm3YwnanNU3GXc0FKJVItIeZWxusTRnE7E9CheDTx/11N1QqSZ0QJnMTeriGSpyCLHDNI1e5J/Tr7upf9SHdUoRqPrCzqNmr+Gre+uTZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/ur16DrCyLnfc+O+UEnH7MV7PV2BICKSYbiljd5Wzo=;
 b=i+wCsJo9hki9UKtsSXErwTCabI+nJZ4tWcy6lEzVG6f8Aj//dpEqwXElEsFLk303YPkdBz1Ev0bN3gJMLj1Kote2/5O9uqmYjnD75Y8+gwQF1DQOsAJPplP/FErp5BLnXBvGOdh0z16U2OXYGP9LzuY/q/8TH3lZYWRUp7of/YY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1966.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Mon, 9 Dec 2024 05:37:04 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 05:37:04 +0000
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
Subject: [PATCH v1 0/5] Improve decoder performance and fix critical bugs
Date: Mon,  9 Dec 2024 14:36:49 +0900
Message-Id: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0219.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: b0802c12-f6b3-4992-ffac-08dd181382ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nHbpHyLOafjbtv6FU33KJKP7yOobBrzDiMGhaFuQaLIFsDE/pzJ0pbKr4jip?=
 =?us-ascii?Q?J8WDpTi54ZRfF2JFKD5ix/h2W/mMqcoQsnc+182AUjOvAyAJIe3KrkyOUZCy?=
 =?us-ascii?Q?aiiE+epC41FsT+WA4TeULOVSb+S1iUMubxTjIdVHdyWdwr1AZoVhNY+PFXl0?=
 =?us-ascii?Q?S0c41/DE7odQVd+0pHuJYs/pr4Xg4wmCsdu0LSXp7PkpSqZoANUTg4WWuq/4?=
 =?us-ascii?Q?obqSPCEGF9yT/IEDZdC2pBMOueTFWzaC+9g4lJwjQsv+1Z6d/ro8SjC3qsGl?=
 =?us-ascii?Q?VxMjw46NeE+SSVbR15NiLluh7mEP7rAUK91X62XkJrn+CqkapzSYo82PgPil?=
 =?us-ascii?Q?3ZWaJJXVHJpRHpomrOfc8ULodFsLUmRqtlRqOPbBSwmU32YwA8F2bUju63B8?=
 =?us-ascii?Q?Ck3wBL3mhI2rbQL3zVXl8FMrA1LrIOdyWwadD9WPCvPXW75FWzlzwAO7TK1o?=
 =?us-ascii?Q?l+IBNDWV7I+LE/jopQBH1srDO0msqXhQe1oFsOj8pXWu7G4NrVyiTP02yl+T?=
 =?us-ascii?Q?Dn4i2EYnzrsgc6lHffpm1VL9hpI5+3xcmYaRmtXwZdB/HOM76VM3iukR4VTg?=
 =?us-ascii?Q?0JcTDe5g09JsOIcm1fN4KH4PQAc5/EImaRVNod0lFyHTy67NZfLo0/3m2P88?=
 =?us-ascii?Q?kWCej9MX7edDOoYF5X7PbiqnbxfXAI7ErOl66RI4DUnlVTcEE5BD3Lq7ZZnB?=
 =?us-ascii?Q?b7uh1hDGlYHBqGhffr8sRUvaZ0arR84RItZ4RJkTF23QiTaxz5+r6p8WUHWa?=
 =?us-ascii?Q?UsVA6q+k5Qfrzx+MvvovXejAxuBrliAXvXNfBKy+tQ2EXME19RbmiMI8HFt6?=
 =?us-ascii?Q?ooMj2/NAE7dGoeDuezx67rATRM5y9uE/EdWOrwsv9MFu6nyMRF1w8TScEGWc?=
 =?us-ascii?Q?7En0SE//wABtm+IC9a818nYdgziYAtQNruQbr+tlQlDu8AG5zadFbRnKqCE6?=
 =?us-ascii?Q?JUv61MqfNqnRu1LmWx+2CuYfSmmEWIY6L2/CkuzFK8yC4TyjA/Afh7lyt38t?=
 =?us-ascii?Q?Y+JNkJL/L86jhB6RbzSaAyhMZRncVrkF4sk58t8OOy/NTk0h+NC0rhbTu+wo?=
 =?us-ascii?Q?EsMulmcgThct2NZwTXQloPyudqRexb4SoIIcOJPNbA6lxYDYyTrRwFckMqez?=
 =?us-ascii?Q?YTFIRg3nPSzWt5D4IAQUC5BtxH91ipSkqSFkgyu0swXccmy1g/kL1uc6vCMd?=
 =?us-ascii?Q?fFsNY9qnImPxUDdFIbSefWGecB1FeKn8spc3ys/TjcpCRB81iyEokes4j2VK?=
 =?us-ascii?Q?e06kVl2lJp4JOUT7gEPlLx6Cw/FuHR1K4yZV9hJZETZ6KcEwlhlmFMJJt9j8?=
 =?us-ascii?Q?0NypvKqCKvqaNIfGEcEc58GVi+eFPaDiUfnK6I8suEVbJWmVo8pRTqzGnedd?=
 =?us-ascii?Q?3K7gAadje8DhMhx99eDtXw8xMU0c12QQ1aV1VCC0VoQMgirvJA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4bZCOpxKtPqY3Tp2EazJBh0KPCkzxjRO+NSjsr+8WVA+wJnkE+A5XGO7IlFi?=
 =?us-ascii?Q?4E2/fw6yub83h6+hakQEFEvPmaTn6m8JhSjXhcVX3C4+JAVQWAAk281dVdyG?=
 =?us-ascii?Q?yEupl0yue6631GGVW6B8Zs3zHR/xz9dxkSlN1TC+3cmMQiylPp+x4nB3nP/U?=
 =?us-ascii?Q?fkEwocj2FMSbOpQoEPtrKLO4jYAQziQkVtrrcgbA9B2YTzme8X5fehRmKtqr?=
 =?us-ascii?Q?JnQ6SSzy28p1caINkJC/H4i0jOf2josWa20ysJVhVeTlZB73PJN0FnU0YWLC?=
 =?us-ascii?Q?/hf6W1nD7Vzl8hG74LQwIpQy6GOV4+qGRVLYqR6oakcYtkfW4Fh/5c8FYNvC?=
 =?us-ascii?Q?F6rcPdimgI6HrnUcL8tm6GuXpivlP1u7NsaaKxugbGfFawrRgZ4OQsY2P/eG?=
 =?us-ascii?Q?2wf8yA4kKv9+4j+UNBcpDdTtzivL9dKFXXOyIEDOXfR6W9zwUANOXH/y30gt?=
 =?us-ascii?Q?oqV/MDG80SOkbETA/A5gJ1YiZqPUDM2Xt7Fv65ZZybFoKeckGK5J3/pRh+pD?=
 =?us-ascii?Q?1P4lTudsK3GiJanQ3Co/+K7bP3OCQI2HRQ7bvfMZCabtpQrqicpO/B6qTZvF?=
 =?us-ascii?Q?FL6nccJeaHiuwxo/dQenhbeOynDo50kgTj3+kQCNjfwD6T7S2oeDepMDRyXd?=
 =?us-ascii?Q?BLmXt3Kxcq90uefPdvz1R7j7ZCi83/MNk2krpaglL+JzR7Zfn75ayFQIi7E9?=
 =?us-ascii?Q?Mcoz1/ywi9JVbIpFXGbWebK/e9fKQzlCzzbTLz/VFWUdYSZCavBeWQMK4I99?=
 =?us-ascii?Q?9AN79u8boNTb+6sxR7+3ILnDuOF0ojTW6OQ9GxIuuf4CiAZYW2a30AmH6g2p?=
 =?us-ascii?Q?V5k/vJDpHGqvJ2pxU2/M+VTfWVUpElh5AFGCHqbyosct5RMKDq8bPcn8zX7+?=
 =?us-ascii?Q?wGjR8qi+AK2d6a7TlexOHBEQvAN/YWc36lKLu1rpCfR5h1sxaBpFGmXrMFyf?=
 =?us-ascii?Q?SMh0nTPCC77GBm+JqL0GDPZWKSOG1luKSNxLDpCTLylUNN8D5qZUDpDsrefM?=
 =?us-ascii?Q?N/S9Ptfwc1GjucPUQgN31BtJ4jjv1OYytm6Ug+6TZ57vYh+4XTE9IAbso6V8?=
 =?us-ascii?Q?QNm49YiOCJ1Dv03qWfojHQOC1AmGUHllpFkWP87+C+cmwoPYTDrafgpAGhBD?=
 =?us-ascii?Q?bI+9epXOOT7HxvBdb2bfckkAjwlKI2UXDMkuXP4TPDUWAI9JkoEyE4PXruRY?=
 =?us-ascii?Q?3xQHd8uP9HZSZ6VggJgV+F9nT4iIuVQY3iYNRO31mH1tMQ6q97IACtBKj4z+?=
 =?us-ascii?Q?7TIG88RMicQnhCgDRdgreuOj30Z16PJ7UMfpLJ8AbmXtjh1RyZh1IInjtfpY?=
 =?us-ascii?Q?BOhZ40/HPenI2LimqOMvBhVLwn/3/2+tKQGwjWhuNq0qxcjDTXDVJEuiyvQz?=
 =?us-ascii?Q?4JKMC7P5sFr/EHjoohWcAsToNfriC5Q2rH4vlzVZw3HlBERDAjCscKZYgySK?=
 =?us-ascii?Q?tDFxYvBHK2dXHzZShi1Lra4G5leIhLnoryNkCE4W158rQ+OZW5/6PyViaknv?=
 =?us-ascii?Q?x6Ajs7diwKL5MgT+riAw1LWm97sRqcdHCR7rAh4wGNdm+C6NgExCJ85BNTJc?=
 =?us-ascii?Q?XlGhNDHvnVHGasvE6RpeMLoMnDuFXtHeDqTvPlwvWeUo6CvVAELokaLbw1+x?=
 =?us-ascii?Q?Jg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0802c12-f6b3-4992-ffac-08dd181382ed
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 05:37:04.1454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcsBSlyzNcA+e9Xl1VZZUKrRrKMXsn06K4LfZZ3jNTp54RAGnEY5I5R9ZfIeptSqDI1mabVOgO3YnB2ZbhrDFfsUFHnZMYLskCVN+ht/ol4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1966

The wave5 codec driver is a stateful encoder/decoder.
The following patches is for improving decoder performance and fix critical bugs

v4l2-compliance results:
========================

v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t

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

Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 132/147 tests successfully               in 67.220 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 78/135 tests successfully               in 31.808 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Change since v0:
=================

* For [PATCH v1 3/5] media: chips-media: wave5: Improve performance of
  decoder
  - Fix Null reference while testing fluster for more than 2
    decoders
  - Fix timeout while testing fluster for multi instances

Jackson.lee (5):
  media: chips-media: wave5: Fix to display gray color on screen
  media: chips-media: wave5: Avoid race condition for interrupt handling
  media: chips-media: wave5: Improve performance of decoder
  media: chips-media: wave5: Fix hang after seeking
  media: chips-media: wave5: Fix timeout while testing 10bit hevc
    fluster

 .../platform/chips-media/wave5/wave5-helper.c |  20 +-
 .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 431 +++++++++++-------
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  77 +++-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  34 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |  15 +-
 7 files changed, 398 insertions(+), 189 deletions(-)

-- 
2.43.0


