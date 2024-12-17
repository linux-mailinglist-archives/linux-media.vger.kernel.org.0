Return-Path: <linux-media+bounces-23527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE929F41C9
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 05:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E72B01646A2
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 04:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA56013C689;
	Tue, 17 Dec 2024 04:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Lx5PCjz1"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020132.outbound.protection.outlook.com [52.101.156.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178E014F9F9;
	Tue, 17 Dec 2024 04:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734411106; cv=fail; b=Zyfgcv4F60alVEY48YKvfAl1ptHaOAtzu7OcFFKV2KI5BoP1bcnST/3ksjbprFiaRNIrfzzMo6do/WBs/YN4sYzuwX3kJf9nrBPxil8blJ6+rcMiqCpwBtn1Vi1GmJ6aTfA5aBXPCA5uiafh1sgbqSSbBYRT9bosvv7bwe9o9FI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734411106; c=relaxed/simple;
	bh=8rCf7xdmViAa6SHRi950i3azEFa/Gq0wbMSkOcqbMpA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JVC8qvYjYNzt5MyIgUXBtb9toM7u1M+6rDg4m5dbAx64Kl7tIfhJrzf56RUjZC8eCUrPo/LdDaoyg5prTXFMNBzojrkvt4px3RSsVLEVHeT4IAh0q6C4Ltw172FR38la++/YbxOUNeb+DVOH+LjotYCgoPFKFcNwh4jO3tHIiHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Lx5PCjz1; arc=fail smtp.client-ip=52.101.156.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzkS5eg+MXKbuTSis3PlzrTIkSk0rqWTKKkGbYSCIWQxn3XD/zRUM4ZIvCNew8FPlc05UG31m23BrPzUXsM/RLj4djoiUJaVyxw7Ns/gqROnZNBcMAWSa3ECiDNXlX/WM34/6207P0VKDqjEklBnXAQeDPHNPjYk4H4MVzGmQ1K8lfzc9OzwUzmpKFEk6e0gSjYR5SX4Nr7+PEtCk8ZV8UESgQMmjnzdvfv7Tvt1/u32XmI5M5UEoRS1HtT/3m8xqBDPXGhOirTJvZsj7XNDBbn3NQFHQnSmlBaV21jZ4qzuPptHrcizvsGe6t4HT2PEVi7AapMBcwVyp/EsWbjEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmZzu7Rc7Uq2qjhu7V6HYImhXqEGbxZBLqBOwyQQn9c=;
 b=OUcpNzv3lhokFJyn38Ta9efgtc9dGScY8vZXrkY5wS5LIMPo8eYf0Waxx300FrmhwOZWmIhThYVhmV+D0GgmPg/0MbZuj3k1YL2K4vHLuIBODyYMW11l1luNVf+CfrD9hqWhGgbyngvzXMkP2Wp822eMTDKSy3hKBa+Ug1JMK+aZpoEgcqshmtcyTTyyfPKNK9hjAYzc0vhalk2FjHWKl9qoPsVDfvVtKPmrIXJ65ymfce4kkMakyM1JsZqTEd7RlTUNof52RbNNJ/TuekjNNc0CgExy7rp5GPhl5fc4RzuzkQ4BKHhzLBWBGTDHDO3F+mVk7bdpDOOxQPCidiEGhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmZzu7Rc7Uq2qjhu7V6HYImhXqEGbxZBLqBOwyQQn9c=;
 b=Lx5PCjz1f505KOUQBT/KVbBw6/iOYzNzbtDAUacS81lsj3qdUGggVNmkwaYO8c5Jt7FWjZ2ob/TcDayOnbyMqseELROTdRSIzAAp+Fl1s1peOJy5ITMLi5LCTfs0W9ejkNpam3zCH4s5F1juCB8RqNjez5zoAGbCaUjI/2qmLwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB1872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:109::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.22; Tue, 17 Dec 2024 04:51:36 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%3]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 04:51:36 +0000
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
Subject: [PATCH v2 0/4] Fix critical bugs
Date: Tue, 17 Dec 2024 13:51:21 +0900
Message-Id: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0103.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB1872:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b4c8d0-4980-445d-e2de-08dd1e567c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9YnuUai9qV5GRaM5ffcutSPREb/qZW6pWuRETRFvTFynBoTVggIiiZLzVbdT?=
 =?us-ascii?Q?ZA6zradRjxDbwXWidcKHoe4jvfhLhPUJaljcP5sFiQbrUXsOho/ksaDeXgR/?=
 =?us-ascii?Q?tMN/scnJsN3/nt/oOANCFtFv0jMZ3UICWJGN/+ADe2jw3DP21ParGqTyIdML?=
 =?us-ascii?Q?e5zGWzH3foC7o2yvTnGawaD0V+1WY0qCTmJ4nQRnKg/hvSSs+B47RHX/epfE?=
 =?us-ascii?Q?O+Uh/1MLln5xWNzY1yDWfqj09aco6FvOsCMOQKHdU5apkiDVkwQoTTwi6JBt?=
 =?us-ascii?Q?ZxyvpkP8Z9T4QrDwovkYLXuAZtl2PLVAb7Mp1gpiopkCAeffUyQXuo/n5ucm?=
 =?us-ascii?Q?YsU9H29A8kQQioZVKonOjM6LdKdywyl8m/mN/6q8IN0AEzVWFhVdMuQBJZ44?=
 =?us-ascii?Q?53JxKOdbntTDy+3iYImcUgyvc4AOBfS9c9YO8C9Ktf8Pv/1sa+puWA3Ba+34?=
 =?us-ascii?Q?0YxdEyS0Q1he6Excr284DDaF0oxSiiD1Y3xyGMqcXf7yg1MNAh7UmEPN9JmW?=
 =?us-ascii?Q?AZmi5z7RUr0QK0Am7/n0vhymvZdJcZvwnhDoYWaqiyKRCqGDAtgRhRbf+nNy?=
 =?us-ascii?Q?R1M3KTDQDvC6X0QN2rzJI0oqW3VzWgiAO43SCURGk997TBPCAFqS5nC92oxN?=
 =?us-ascii?Q?9XY0iiKd87HjaxAfuzVeAQjOyQHin9tePq264pSWblI26d/BRqm5vIqpSMp0?=
 =?us-ascii?Q?UyOCwLM7U0XUTAWt65d6ccyWzXHFV7JKNE4zqYqxYM0aogQ8stdrDjWjVsCf?=
 =?us-ascii?Q?SCkQ0JuMRYom+4K9/rrF8bGWxzefQ2m2L/UdpyWaJhYK2RE3GvqtNxrZW96k?=
 =?us-ascii?Q?XDIDZPt8g5Gmq34j3/XVBy/+jCm7BGQCBjiTyNaMchssbVTNnUhmLOFqRZiZ?=
 =?us-ascii?Q?XbIyHcVI6jXpZB9Y7AnyECmG/RpXDOOJyAjpl934RJkEnfQx+Jo0y0/skPP/?=
 =?us-ascii?Q?XveoMRWRg/UDHlsPNrvmajtKkiIiHi00lLBbo2GxBdutaKmYRo/x6Zm2oWVE?=
 =?us-ascii?Q?3blmDWbUNt/uxO489CzrycU1SjtncYGQ6V7A86fYQ8PDlQ/C/wDzvPMgcn9G?=
 =?us-ascii?Q?9h7AGjTZycs22Uaw3Pl8vX00Ae5l60wUzMhOaziNW9/OaVW5PytAqUStkytL?=
 =?us-ascii?Q?K3lSiQej8Pz0ULDo6eDEHAyrLR+JpT+E6y8ft3Nrcbn63LCxJGlp/mQOcfpW?=
 =?us-ascii?Q?wJJalwAMyOtsjb+BEDoouNKC4ltLO6WuKIP8tlrKu+p2mcZz28CAW3j5cPuT?=
 =?us-ascii?Q?GUqxfd+kfHEemrALsWDaKCpkwbbIiiSnvtiK7zwHh/w7Hp7P7AFZqdk8cCwH?=
 =?us-ascii?Q?Q+d6IkY8PptQW4xaQIY0IljblAfhhsKNmLAPRFYL18/bdLSDh4bTs2WLWxWV?=
 =?us-ascii?Q?a1uOd3pdd/wA9WKW2fLMZ5IbTXdlvAYZPB2Hhov4u/5hxJz6SJtbaqyRoLHa?=
 =?us-ascii?Q?ZfiEThVRGfs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0mXPrVut/WZQ5R+pZcmyVW9GlpWKc/a5UkJ/jwmpEQ7xMhc/Ka63+WkSzAb4?=
 =?us-ascii?Q?0AyaCPcAZWYLqEJ2Bs0j2MHWlRWnb2YJhSzcqggXEBQqbQPLkGdP+TmNvGY9?=
 =?us-ascii?Q?/+nos8sp21Xi5XX7tVPjqnZCyeLVWtpC5hRVR47h6bCJ/ZxS/h54xq2GdNoM?=
 =?us-ascii?Q?oCzf8FmWbkUUA4ZLKbs30yrCjcQqR9uyExskG2TozztPR3PtyIn95OWl2Zcy?=
 =?us-ascii?Q?pniW/UQJrH4z2jXRP98UeYHY3u4+EiuuI4Qf9pcWbldwpRRzNFcapwLYM2+n?=
 =?us-ascii?Q?jUgUbj2LO2fvW4U2uK5wVVlqg2N7pke+uzjrip27+T3vfqQJ6tEC6mE6ZBkN?=
 =?us-ascii?Q?kWPcK+upB9lqBK3qznr0F8rM1oXDK9yhoY/q1L/kpuelzLq5HNF4F/M0G9WV?=
 =?us-ascii?Q?cvvFviOwCHx9uHl0mN30//OHuvj2Ydl2ZIoJv4hg9rl4oF1fzTvAkBzebUGu?=
 =?us-ascii?Q?iaMyKFaHQB/bC2JG1TwW5Gxhj+5vbAw74/w2YLC+k0KLt7/uc040BYu0hejo?=
 =?us-ascii?Q?0aC6jbJRifZcSpyKra6T72K1t2VC/4CFSHPFYXDBjuE4aDizlsCzWyqgyH7J?=
 =?us-ascii?Q?/7Mvdc0Wwz7Ik8VA11KyOqKD4JKAyOt9aZcMWTBEyKkIdVWbFh2aq8/fc5KP?=
 =?us-ascii?Q?3y54y/RkFGhMY+iqwGDGXPFRkfWx8LXUTtZU+5d06Z7fIoYfKM0InB9kfkgZ?=
 =?us-ascii?Q?2zkx27Xa/a8/MklJJ5XuadeZ9QmVYaP+Q56Hx2sGRSzBJimLXULxBxHDyh+h?=
 =?us-ascii?Q?NyMAvbK94e1nb2g9peGaKOaxvIDUnztXjki1C1fIvI7kDTo/lIFXIerp5nnp?=
 =?us-ascii?Q?xYH1A4uTZVrq/4abtgbQzgiVQyoZ6K1oBtTQ3oYLW05hXrIUUT9aEp3dFND3?=
 =?us-ascii?Q?adUvRTu2G9kk1Nv1s6cwEX0vCC4Auvz9GVMTgNIhIl2rbBHwuTB/pKtb697X?=
 =?us-ascii?Q?GvXE3JR2WiQnA9+v4+EUIsANu9gd0vQA490vPLgaK0maaXwN5v1hLNLf+eYz?=
 =?us-ascii?Q?QsYd6sCfnrV2+OgKwct+zKE2Tat180/nCzUbhfpceVD69eVgHRO+6H8sgcv0?=
 =?us-ascii?Q?QGiDfsMJCFlTGlF036iJvL0FzGKXudSSo1P8099tJg/gHkWwTehV0Fte8MHS?=
 =?us-ascii?Q?JB0JzfklA9NRx23MXBIVEcKAVTGfpMtj++GPOJr27qqebrWk/oI3iV+W/jD0?=
 =?us-ascii?Q?FYhTfUdu3deAL4M10N3KoNWpzJvqAE3soH3vCgB9lcg8buf/I6PmFI70Qafq?=
 =?us-ascii?Q?ZmtWxOY7vMVonGtv8uRdg6pNvTZXBRrxzjyWWs+mxkDx+WOODldYDORe+pyp?=
 =?us-ascii?Q?Pfbwt6ECxtOPSoMzsOZRDwKsflKfkUsBaxXsLxVVkjVSuM8q1a4PB4sXdpai?=
 =?us-ascii?Q?UWroESW5LIWv3Go8ZCWysnR1ZOl2yCTCc32CxSCbJdFqPrLFT/4nQts8anNZ?=
 =?us-ascii?Q?ykqM+dxvJKmYKNpnJQdorbwUuglNK5/s16Q6Uwtp38sOjTHYJQt6YYvJFAWl?=
 =?us-ascii?Q?jhfwtzRRgjm0vl/BGRvtq5ig8aGKLHEcWmf2wWmmEFweUxgdgPyoAFbyAS5o?=
 =?us-ascii?Q?MLD97IvgnF7+e3c7IW4K2eiOfg4reGhBBUoaKBwvolUiAzZVU20Hujp83wbP?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b4c8d0-4980-445d-e2de-08dd1e567c4f
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 04:51:35.9439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XT4Wtl6eP+4FNPOXLOeL+OKVkp/q6oKiet0/3ovSMYsbm/YoapmLLNOr1pwuYplLxsbhvDMLP8YKH+kn/FPZYAZ4lntbxIqLANIs7ZUoWB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1872

iThe wave5 codec driver is a stateful encoder/decoder.
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

Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 2 
Total for wave5-enc device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0

Fluster test results:
=====================

Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 132/147 tests successfully               in 68.608 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 78/135 tests successfully               in 33.238 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Change since v1:
=================
* For [PATCH v2 1/4] media: chips-media: wave5: Fix to display gray color
  - Add Reviewed-by tag

* For [PATCH v2 2/4] media: chips-media: wave5: Avoid race condition for
 interrupt handling
  - Add Reviewed-by tag

* For [PATCH v2 3/4] media: chips-media: wave5: Fix hang after seeking
  - Add Reviewed-by tag

* For [PATCH v2 4/4] media: chips-media: wave5: Fix timeout while testing
  - Add Reviewed-by tag

* Drop "media: chips-media: wave5: Improve performance of decoder"
  - We will try to send this patch separately next time 
  


Change since v0:
=================

* For [PATCH v1 3/5] media: chips-media: wave5: Improve performance of
  decoder
  - Fix Null reference while testing fluster for more than 2
    decoders
  - Fix timeout while testing fluster for multi instances


Jackson.lee (4):
  media: chips-media: wave5: Fix to display gray color on screen
  media: chips-media: wave5: Avoid race condition for interrupt handling
  media: chips-media: wave5: Fix hang after seeking
  media: chips-media: wave5: Fix timeout while testing 10bit hevc
    fluster

 .../platform/chips-media/wave5/wave5-hw.c     |  2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 31 ++++++++++++++++++-
 .../platform/chips-media/wave5/wave5-vpu.c    |  4 +--
 .../platform/chips-media/wave5/wave5-vpuapi.c | 10 ++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

-- 
2.43.0


