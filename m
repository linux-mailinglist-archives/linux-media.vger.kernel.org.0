Return-Path: <linux-media+bounces-16108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D150A94E76B
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A5621C2142C
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 07:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613461537D5;
	Mon, 12 Aug 2024 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="hqWesXsb"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021080.outbound.protection.outlook.com [40.107.42.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1479E1509BF;
	Mon, 12 Aug 2024 07:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723446524; cv=fail; b=EigYdK4Nv4oSDAobmWumPtAqTzfZDQ38BpS4mBPAGHupLF9th7gEjQCPtrpM6pBU5BKQCKyxj4ecUZKJdTBqW8M95EPReviakXkbDzpS7lgB4/mQS3oSlNvmT5g6smDhkKg9Cfek1+8zf/dZ50FoegvRBY9SpW/mxTcXjhj37KU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723446524; c=relaxed/simple;
	bh=KzqF/BYoVOAk4ZeaeOrZUqcMjbwnR3OW3/wPyuBJY3o=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dTSvFgi3+0zxpYJJn8CqEuG5FQNUX9+cQ1R0aRSCdDt22mISN2kKkHw7NkceiShr/qg7fI3O9k0eflZpeDFH9MA/vxX5YiMx0JYE0pY6jDWJsVi3phmpGpzodxhGCJfuncsBdT66gmS7O/3DCKmpJFXORRcj7DsKd3mB8ZwI7G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=hqWesXsb; arc=fail smtp.client-ip=40.107.42.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+BhthuWVaaHf55FmTWklcIgQq+lDPcn3A58LANWMPm05Q7rgybVh7xV41ZiUhpdglaCIlg6lK4pyQ30mmaV5r5HrEcOOny0jpIc0D8OvOxw6wiJDnWBmp2RbqWDL/dG63hSn7Yw5yLaPSrr6YW5obbnNT0931eQ7pPV/uULK/F/RQzDglQCuD+6s+cf4/ORXowtQIeS2moBznG0s90tiPV0GN6LSOq/C5HxVFjk7lAtJypRpradEebAFYlyTJfSUN7DEPkoz1g1O+kBlDnzkDaEOy7OL5bFNFI1iSPnHB8N5StCkzsqfwdlYqHJbIjHAqanynUPwXJz3XXs8IfmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brB67GLI1wOpzyD84CFjzweb0TbuHeKLCjyDLcDkzjQ=;
 b=QRbTEGhK4mJO5kzIVh42dYxuzsBF1lf8fnVXhUSpeUGvbvnXXlF42w7ql2ZaoPcrrOtf4h11Ez4gewc1Qm/OV2TEUgRvr4Lcrfdd/6sv86GhOoG36GNuvp6H1I87jw17QlIvPdQj5XeQDYeHj+4JeDYj+4H4DUa/TTpOIXOz/oGT5RQOm2rFxaw5Kc7DvebTjxn1O1ERN02HKDki2sv1ULly7R9dh/iZvta9gsPW6yimwMkBj7wx89uCGuA8B4UnsRorOxnpYeXg6gGJKQUZ7Lt/4Dt90DI11ayAsdtT8owwsPZz+Du6zd8qu9JR1GYTRo793rnk7CiGtCH/imu+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brB67GLI1wOpzyD84CFjzweb0TbuHeKLCjyDLcDkzjQ=;
 b=hqWesXsbZKPQ+bV2WX0WrKPOVy/yVGm5qjF5YdztAC/d/wkt+sz1OUFr1Xw1I19SByUuRwPVbDD6PChQMxzjqERtAWKN3oLOuLyDztGKs0tWhF436LOs5yCWrzNL30RakrzUHcGiaSW9ix/C1o0pp35l4B1FTM/KCgY9Vlw7QkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1530.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.20; Mon, 12 Aug 2024 07:08:39 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%7]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 07:08:39 +0000
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
Subject: [RESEND PATCH v7 0/4] Add features to an existing driver
Date: Mon, 12 Aug 2024 16:08:19 +0900
Message-Id: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0154.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB1530:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f822aa4-dba6-4cfb-fbcc-08dcba9d9730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+ODTPoidaw0W7temHGxqSHi3ZpkRyQYmmdr8hdoKCIZlo6aBhgExS1nye2HR?=
 =?us-ascii?Q?iEYvcusnjovvL03VVjdlMgFwY4/NAg3bZdjCoxGLO8m1RioobITf3upmCIZ0?=
 =?us-ascii?Q?OrWjY9akFufDoqjiwSqQdW+ztBwOrWUSH6PcvOxJJENgBmKEFuOecjGLucjQ?=
 =?us-ascii?Q?x9Es9Qhf54UU701OY5ByCiAQB4D/wUyerSosnjqNjv734aZKD5iTCVFhC4Hr?=
 =?us-ascii?Q?fUAclMxFyUdgacBGrbIQyoPLBXLakO0ce7XqI/TSiJ5oOJ+d0AQRz8p80l6Q?=
 =?us-ascii?Q?uq6C2y4lYWZ/QTdxcIJslk1KpWPeXvoVjomISy15sF596uM4ZPxMVTH41mZU?=
 =?us-ascii?Q?ji25aUTsCEfdFDyShZBV3cgbWRFDUri3qDONokGcxAinWMxk1uXP6okzvirg?=
 =?us-ascii?Q?U1sca3UZdYPM+9gOlNjuykUkEjwsp1Riak0tcKOcjsAExnCz4W2Q31lG/VzY?=
 =?us-ascii?Q?WDQlxlJuED/WrvrHwTOkEXXwQt76LZ9O3NxnV6ihbil/hb9uum8QwjGI2AW5?=
 =?us-ascii?Q?ct2QJqxHA0eubp4fZJM1cHAjERAO3SUs6uhEbPwHiVBT/PP9U2YFdvLs0PIF?=
 =?us-ascii?Q?YNCylmz3LgfQxdGs1xjTggt7I6uX22CpUNkaloYKwy/8bD2DyCtIY9r44rIl?=
 =?us-ascii?Q?BR+24Sfsn+IOc3unfKHdvaB/L3ggL4HV2H+/W7gXIChg/PopYi9Kig4PWjBj?=
 =?us-ascii?Q?jaE4fg/Eh+SbVBEYyL4eC6tsBebS+67PStts4ucMolyjgDny29kD+OSUmyLD?=
 =?us-ascii?Q?RHLd4kdsmGhiKgMkytGSSWfxCbDLGYqB5fUCpKalHKk+9OivJ83vKZtv4j02?=
 =?us-ascii?Q?3V1WM1gB2kuatdtyN8xtR1nekWYLvApMF6tjEkm2IEooDy63l0F7DickaB+o?=
 =?us-ascii?Q?mGOjgCE9wwvPgpenp5B6BGi7QLaG2cccm2i9ohxw5Dj2wZeQYAvaGlC45z4i?=
 =?us-ascii?Q?vx4CwGRoxZN0o/4CFREaaR7NNl1hA/nAMVYpK/KlmFlJ4szUPxqpxzZ9VF6R?=
 =?us-ascii?Q?Zm1Z1ZIZn7qHRq/y96povVh8N1WGzPsBLemB6VWPs9wWXv+VvJv70rv5EsSm?=
 =?us-ascii?Q?HzybT82DrlSEVT7XsKNR9pJLJZQv6mFrFQtXGKfV5nM3qqDoBu5wYZxvNMAI?=
 =?us-ascii?Q?Q5eKGmBr/Plx4y7EYoiKEOTIVbK1btJbxhbbTGCk+LaA/02ORNncxF9Q99io?=
 =?us-ascii?Q?dsGjbAQy4D8aG7+ORUhGnt9UZZl6E4w/QPYDe076eOg3xSFBMZP5Vy2imN5n?=
 =?us-ascii?Q?jAT/ATsy/Jx6GLuCzZDrrNVcWuSI9GQtCicqBDxVOzcMZNtAPBx84pkArSKP?=
 =?us-ascii?Q?tXsQlspbtm4urD/RnJMwTY3cGpXg6DIU84CcBVW3Vqq5pJ1nYjVBQKweJBR2?=
 =?us-ascii?Q?darb9s9UKm+q3V7rRq+1AGjAGQ6mmy0vX9Bb++7aEc/Xq5jpdw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lRGJ41dm0l2apts1Uyy7/Fg/i3sXMeCl+L5e/bZqS+nrLYFssBu/3XqZXfY2?=
 =?us-ascii?Q?1umpfqbMvgD0luDPfRVtFnwIG3KvtB0Be6eV/HdTSeOcfNUZNQqOil6vW9wm?=
 =?us-ascii?Q?D45Ti8Q7THF0+v+I9KfmgnQ6GIGm94cWTa6h3KI3a/+OuQnWLFEGrJOyuQM+?=
 =?us-ascii?Q?9dHRxyvSG5KQ+tGylMTHM6wUOo5X6naHM+FK7KGY79OmvOxZVkITvrJL1N7I?=
 =?us-ascii?Q?T2gGjAqwEvuCljVcgnX+QSVWw95asKPJ60VuNARV4OayzDYgTlvKCWIasa+p?=
 =?us-ascii?Q?r7plAHzfpVktxJGj85ssqofHafQbx4J8dJEZOfTbuh47FbkSVa6+Ws8G380P?=
 =?us-ascii?Q?Knwe10wxnWu5GHfzRuRv0YbSNKRoT0nPtgKVFB0yfGCTYo/e1bLmFaIctXrg?=
 =?us-ascii?Q?5xJIZaBN4RAwftx2VPbhSTqQjlVqFH+o0IY62mj1fSKVb1sck2Nvuf0DNtx8?=
 =?us-ascii?Q?UjN4TfFcBoz/Cv3mWR2mRYcAp8IpHl9YUO0SCAyOasOgONafH0wAFcG/6vfh?=
 =?us-ascii?Q?lhpbl9NmawbmwpoSHkgD5RX1GqR1TetOOggmJ08MGtfnuaNck6QS83//GSjz?=
 =?us-ascii?Q?M6pN12bPqCDx5fHqqDePXoWnFGXabirz7wfuq/+BmkfnyCzuagH2GaYVwedc?=
 =?us-ascii?Q?5dhVlJsJNmWCD01yTsTrl7lCfm+d3Xl+8ZvRaNSZwgAbaxDZqPncxnVeJqqO?=
 =?us-ascii?Q?a/G1kT18CyW0U3sXAzLpIs9hcpAMAm/aykA8eC//bwrhTHFniyI2lwcL2lvj?=
 =?us-ascii?Q?N0wqQgsQAVtQ601HTQpr5qeAKwYzRjJK0ZASfdhtzH3PI0+hL/85ap+xKRSe?=
 =?us-ascii?Q?IPqIbhfAMTqqz0uRSIpVDoBiGLtKR+l3WQ0pxKC0KcKDsb9Ru+dbGB4oOftP?=
 =?us-ascii?Q?6JDlpFmHKXv5qnrNhH/RAWCafwDRjtZLDtpEJEmDICgMkk9xSnckmBAvEsYQ?=
 =?us-ascii?Q?UB4+jjys9iY3gMKvRDrGfAlK4bNlKfKT8C0oCVM4JRJn6/gyJT6hHKpK0dn+?=
 =?us-ascii?Q?OSCrdz+nBwR9YSkYu8AjYf1o46Ca9FU4a19UlaywIRKzhdmAiFIXW8Mv8EiP?=
 =?us-ascii?Q?oswNzfeWOBHkOPZCTlLS2msBpFWqWe5YrPtvJob+5NdQpYCyxvUEpdmBgLj1?=
 =?us-ascii?Q?7T5pbD3dye5iW3dE2k3W5+6jxpOl5FvKuKiR2ey963z+DVMyff7KLz/xq8H/?=
 =?us-ascii?Q?4ZZTAVqqRkOaX6zetW61hp/T5jLzN3FZVvRwR+ULIxsFw7Xezky4j/Pz0lid?=
 =?us-ascii?Q?lIXYIdHhPQAQX/gCFTP53N5u74yz7MZIun8/1hJvDeXQfGrVV8JQ8J6fF7M6?=
 =?us-ascii?Q?dRNGcMx0079tw7IG3ffU9TFpoI+MFoXz6B4OJpZFxxhcbU+MGLXmomXCcqTy?=
 =?us-ascii?Q?PszR+zIQna7IvnoZ2OLN77jgAMLW1u20gv0hv9ee1QgcNcrmd8oO3D4/dI/j?=
 =?us-ascii?Q?YoQtSbMuhWZHrEhvcPeGEFtxf8OZRA+UhsE64Rd4oNF0cKEurcS2tH473Ffh?=
 =?us-ascii?Q?pN2SY+ZGGzVPsgDBehg5q+eFXHMcOwGEcVChHsraW4OBcaNsJ/4QbvVn/A1q?=
 =?us-ascii?Q?MiVmRQTviXPXmjJgfg0K4xTWE6nshCnqar8qP801UCDQIhEEqRYXWJK64q//?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f822aa4-dba6-4cfb-fbcc-08dcba9d9730
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 07:08:39.0132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJu8H73R8z8CLDtxY1qDnMI1yIhKxE9jlphghZXevM75leNIvoq+/yr1c/9wPodgBHfWESoG/V6ZMbWHK7ht61ooJSoCTZJceHjAdHw4C2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1530

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
Ran 132/147 tests successfully               in 89.870 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 77/135 tests successfully               in 30.364 secs

(58 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Change since v6:
================
* For [PATCH v4 2/4] media: chips-media: wave5: Support runtime suspend/resume
 - Change autosuspend delay to 100ms
 - Add to enable/disable hrtimer in the runtime suspend/resume function for hw not using irq 

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

Jackson.lee (4):
  media: chips-media: wave5: Support SPS/PPS generation for each IDR
  media: chips-media: wave5: Support runtime suspend/resume
  media: chips-media: wave5: Use helpers to calculate bytesperline and
    sizeimage.
  media: chips-media: wave5: Support YUV422 raw pixel-formats on the
    encoder.

 .../platform/chips-media/wave5/wave5-helper.c |  37 +-
 .../platform/chips-media/wave5/wave5-helper.h |   5 +
 .../platform/chips-media/wave5/wave5-hw.c     |  30 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 321 +++++++-----------
 .../chips-media/wave5/wave5-vpu-enc.c         | 313 +++++++++--------
 .../platform/chips-media/wave5/wave5-vpu.c    |  50 +++
 .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  33 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |   1 +
 .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
 .../media/platform/chips-media/wave5/wave5.h  |   3 +
 11 files changed, 460 insertions(+), 365 deletions(-)

-- 
2.43.0


