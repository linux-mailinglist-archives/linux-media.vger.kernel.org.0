Return-Path: <linux-media+bounces-42868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB44FB8EF25
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2B577ADA63
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C722D592D;
	Mon, 22 Sep 2025 04:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="VX8A29qM"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021114.outbound.protection.outlook.com [40.107.42.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A867219A8A;
	Mon, 22 Sep 2025 04:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758515809; cv=fail; b=MIXRZZuOab73Z2jm7n0zhMQkg76upCPaEPw4jD3vvWaR4wi+lQg+o4xCbH9APcpBykDl6RVafzBjZai0pz9rM5XTbYlbv8BAEXa3MBPsXBfyn5HhHlq7eASN8zZxLMgPZ+ZjPBD6R4qt2Do9L9w9CsxVxXThw45QNal2luTohHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758515809; c=relaxed/simple;
	bh=uT/WbpQpxMNeEFMZh922XZBXHtCEKCVNCnmX8t+uTO0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BHT+MzWEiwKWDfAIPbxe4bFyivTb4w6s/HNkQ9pneAsBrTXpaVIlo0tgweySRDFy3dpcJNmnjOFTp3QL5sOb5s+hV3TqMyNrivg9yar9bUFpofCUCXaY8C7psIoF4110jVyqmzUPlI+CdECHukEf0Kx1FCmaS9Lqykq5eR7NMlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=VX8A29qM; arc=fail smtp.client-ip=40.107.42.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7Ccu1zorOukL14LakXMIsp4qtbbKBmKftWqYctRJkqZyybsEevsH/tCreNA9caVhXMPgZ5FrQ2ETSJE97I/KYYyLVe6R01ZaXRKLIseKKvfvxNPCEt5POa8PR+FM7niU60LK3xKqqU6zSOLHP5xJVOHIetw1sZ57TpT92UcoI8debBiKA7EagEHith46kWcApkyorRV0ffpNN+RzCmHw05CPnn1PnL8j7887xuli714CiBTfrqfn3ngNia2mSSreqv/kOFDWToh4Zm65jQAppc296cS/OBKcZhpNHihwEeZkkkKZYbgguFM7dOtaVxMSeYZk07yEooY4Bus+zwyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhhnMP7J1EPwpwSA/3EkzAFq93U7JxddkhpacYIpTXA=;
 b=Xt4MiOIk810Fky8dp4TPqtgMvgxjLLbsJOMxJ+BM+qoCHrYWeZA+vCgLkJaI63xs3Kg8Q3DyRSSGsENjgd/9/gEM5/s5urPeXP69YELD7GCcbSFjsE9wfOMBZZKATrWJ3EzKZBXoe/isR+FcnxoLUuSxg8tLdYWyHkrMjmmzJiwZVYLaFq9pq28gK4kjlF1IzLvdghZ9w26GELXZ2jN+5mNBTfHm/7NgcqascPfVe8O/isvofXHISWNwtdJxLDFpKVGRHyQkXOJs3+U6E42OIje/cYtTxBLUe6esLTuz1o7i14jjqaA+kbc2+iZ3Y34bGEiYxRYNQhFZgN1KGHMMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhhnMP7J1EPwpwSA/3EkzAFq93U7JxddkhpacYIpTXA=;
 b=VX8A29qMO7fOHQ7apIsW7bYmoAN9SxXhLbyrCMA6rtIoLspABkfPY5H35GK7AKKIb1v2bBiQeVc5tyvtbSFN51uCjI1FjOEe1WAPS/5olqyUAMiLaYt7lZ54QTxG3/NV0hFzJMuBFsNKUAhybkQq+iXNfwCRENFrZFP2qaNUcYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE1P216MB1479.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 04:36:41 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d%4]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 04:36:40 +0000
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
Subject: [PATCH v4 0/4] Performance improvement of decoder
Date: Mon, 22 Sep 2025 13:36:26 +0900
Message-Id: <20250922043630.74-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0023.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::18) To PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:72::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB1149:EE_|SE1P216MB1479:EE_
X-MS-Office365-Filtering-Correlation-Id: b50fbe07-ee0c-4e42-7814-08ddf9919ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CqGF/VovDDnt0ZwZaNH3j5OCb5QRyHCgkif3JPlP7zj1LZO+R/FRz6fpbGnK?=
 =?us-ascii?Q?gdkiy6BiL8JDHnOB/5A76MJoPGrPhqadUrIHYoHAdfvKINnswU94t7eyxUEB?=
 =?us-ascii?Q?IBWDf8r4zQOvdXeCTxBfdeJVkkLPWKNH3QiVjgFij+oqsBJxVW3KDtcNqIRa?=
 =?us-ascii?Q?xWhgB0UVUkxRbb3wUTvYe0b4czz/pqMFxI5zR9qMYtarkjYgig1CsGTJYy3f?=
 =?us-ascii?Q?n3JyJPg85g4qC5Oak5ZrLLas2Je0MfraiR99nuLBpuVstms8utMwHWWWWQzw?=
 =?us-ascii?Q?nQNFeA2x9fUNZB+jbOWBJIFfxVhfdTK8KVXPSN0B/rp7vgPprpR+RoSOzzjk?=
 =?us-ascii?Q?VLU3TEuM2HglqzbmxsNEQKB8LoodA5yaLXGnYMWV1TszoUdFyBfXGPXBIeQ0?=
 =?us-ascii?Q?Ss899dRvs1em+ufx1Az1zTGcPwaOmqOmSPkUk3i/MgDPpeULknYSxSDtad7W?=
 =?us-ascii?Q?+wSsXlN4VfJV934AIHdpIvvtXCKpJBqcGcZzPm0ri2ooxotJnorZm/W+X8dd?=
 =?us-ascii?Q?a3ytDhwMhNVKYEkQWkB0IzcBfUyLeC9xCqbVAOiW4fhXZngpBqW58RWmk5IV?=
 =?us-ascii?Q?1S3NM5D7sweIrQ3QOqMeqPtJ3nT3yLDhrSQUOma1VBkYG44B0i4zfllGu1fz?=
 =?us-ascii?Q?ND2euwsETsJKsaANaq2zgKsZ80ZF9B6eD1+ey6V39hs21Lgf+xx4IkrSZoJG?=
 =?us-ascii?Q?+ZvlEmFxt/asgJy2Vwx6FLYftKhbJotGOXmvD8nXvzIAktEdY400+mSjH6CI?=
 =?us-ascii?Q?s4qY6B1q5Z9FVWdYAEl7R4u+OZBZc2ELMAXejX4nWiV6EP3eGIAZuq6taUsJ?=
 =?us-ascii?Q?OrtFk6YP0aOlIiRgdAfXk+ilHZ9M9ng8bXu4lEjS2hYpwgwYiXojSew5RF0Q?=
 =?us-ascii?Q?k+lrNyKe/1NvRXxNoN0mhOOKH1OE/oD7vUYljGAlOkfDc7xFZV3g69+ABIj6?=
 =?us-ascii?Q?6pYp9X1kPwcndLm8DJcT/HRyVs+GIJPd9KX18H6O+qjs+Ky72tBWlmUpuErx?=
 =?us-ascii?Q?A2Z0Gbb9A/si7p4Nxl/2pGf25EZeZ1HeZsfDjCC5PAbqS3AWwFmEyFAf/th/?=
 =?us-ascii?Q?DDcynbSZA5M4W/CX3c21OF5fT7AMlbOVUCGVFbW3E362n7H3c18/MTDEY2OT?=
 =?us-ascii?Q?rHFItr3MqLNniEesw8gEHYhmKZyIMwV/grrJHTywTDF6wzr6hRWy8LzxW2wI?=
 =?us-ascii?Q?YdyFBsK333GU1c0blY2qmBVuFMjKJUuhebUiqrYUJSJ3ckS3gxGTaHffE2dM?=
 =?us-ascii?Q?sLSUFC9b+0W3CoBTboboDic7ab8kLXTy96VP1M2fi1SKqzNUE/eYAU/vZ+Nb?=
 =?us-ascii?Q?EN3ELgWCBOKN8WnsjK5IoULvkn0jD0BqepWm+qZHb925o8P6kJX+YycVuwW0?=
 =?us-ascii?Q?NsRSXGAFZrY6Bs9b1F/9eXaagGRelmJHLxZjKm1sOD0EoVxgNsp6ddPsthD2?=
 =?us-ascii?Q?n8Y6xWhTqhXmizwiiF1zZLyXlXdAo4Er4yf1vy8OMCEyH/LTV9FO0A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c9WD76uajHBYl58sJFKiKQJPjqc7m1O3x233P6LsQU34u7krl41qu8S309V1?=
 =?us-ascii?Q?ZQx+ciSXO+fltolkS1YhwVkifZU40P/zs9Q2M9xROCxtdORQqk6I/R4dVl/3?=
 =?us-ascii?Q?0wJAoTd3YDnrkKTRytfmhITuhadtsLfToE6ulf1QRD/NEhNEDMHE5h6HhbJH?=
 =?us-ascii?Q?hgxF2wSwRvjUqMf1Hzm3SH4iv1r19UXYyT/6zVQdDfsMTgaxr5HbM860aFyo?=
 =?us-ascii?Q?+RjgdM4dDM/hDbCL+p1n3dtXQJiCXEZe7EPjrCWYmKS2AJ+vaTdtbCUPAPYM?=
 =?us-ascii?Q?ygqM9zEi7DVwmIT0O+zj7R30wGnlhYmDRNdl0uISH/YMazIHfzgrSyTq9ywA?=
 =?us-ascii?Q?K0qOY1Qs9kXSXWIW0cezw2YvYKlRuPfgqhcbDDdIu2CaijrBVXyo76ob4mxY?=
 =?us-ascii?Q?60u7jhs6DymYg5t4XGSRuBMHSUfogeV2pbG045sD+EVAh7vZabO4yn9kLQf1?=
 =?us-ascii?Q?+7DYmPKTh6U5TRxePu48+OtU88ogcV62NG2KiBmfOXt9P9Teyz4n9eunja9j?=
 =?us-ascii?Q?naX8WbYTf1oevmjXgW/FxKczmxwCDKdlppZzJDOMd5TCtWqdlU3tx4RR3YDz?=
 =?us-ascii?Q?F2g9ZOtNObLaYGYH2ToGuWbNpuWN92jKjh92jD069tYzTlDG1JDgveeq8vbi?=
 =?us-ascii?Q?BfX7AA+5Sr1WtApW8EFkJRdWUYa7PzpwAO1Zkh/qg0xaV2tGguEZKbE3cons?=
 =?us-ascii?Q?VYJDfuuYj5G4NlqV2TmWxk96sA/53qUA2vtFyWAybT03AXkQ9FNtVBgFtIoh?=
 =?us-ascii?Q?Sfzgmt/MKcbSBDvXvFYixptLFxu3o4xxpCSJjS1dUpg5LiH9il/CX4u1HEBP?=
 =?us-ascii?Q?FLkC8hIYUxzdtXf+3y7lBxjGQaxMzn/M0HYFTk+cWebrkZCDY9kwwz5KcjNg?=
 =?us-ascii?Q?eQddPNqbcwWOwSkA0A1s8PmSGvTJnhZOquJtZCF6GwvfL0ykyZB52VgDhbX5?=
 =?us-ascii?Q?00FQpd11hB54eXkagBGbmjsCDbIyjN8ppKJv95yQ+GuME3HsYk8MhcgDn4v9?=
 =?us-ascii?Q?mQs+Ic0c9r4uvBfV6kKEu9VLYfXqmv2dCIVuytY3bAGo8Pp+x92Nv9BC/NSK?=
 =?us-ascii?Q?X/sq+omfaXu9gsHRx2kYm84HhQ+DHaDiREVdwSfru0ojU4j7MQ9lYcneOmSJ?=
 =?us-ascii?Q?VPLrEHRWdE7Y+HfY86y5XHmvg5bxgEuVF5j3LzL2vpNp4J4InShYHsPGniDM?=
 =?us-ascii?Q?xvyPmrIzmx2kD8SvKNcu+lWZSuUL0OU4QfzNuRJJ1s2hC+MR+iORaef2/R0a?=
 =?us-ascii?Q?Mj2aOP05LMHDL5JIoLJpnekw21c0DEu9Mjd4Ojs3JJ3ypHizxJgUvXfjuAfA?=
 =?us-ascii?Q?/veW+BVyK5eb+/Iu3xsnSGlbm1H09fC0nJMPWvFRyGCOtI+pjwVGKruAgKs/?=
 =?us-ascii?Q?JnO/LN72RW9v+mxFDvW7M7pPcaUWlYKtXWexE7Na7fY66mxTrCQ9SFxH9iCX?=
 =?us-ascii?Q?6YUgmbUm6BKfgZfIXFR1u0CRUQAQSECVcJtoreDE8Y5KltoDO3jPR4YngNkT?=
 =?us-ascii?Q?MmZAqobLbYilyUs9wPqCjXUlhujssabVM+r318tONc8TuTp+CFAOG486yN9x?=
 =?us-ascii?Q?BJ99kHGQlNbp7WDEcJzSmvReuwFhKVGC1d3iduafQN0hnkssNxMVkLlczd9f?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50fbe07-ee0c-4e42-7814-08ddf9919ff8
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 04:36:40.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BsfXXQd7SbHdR4Ol6nHpqLS06DRKB9djg0vii97zHj1cNtZ+YJ03hKuEf5VM7ch23khko0WKqIf4kJMMwe8jkGCifnV8nz6UIaLP2EiRIdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1479

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
 .../chips-media/wave5/wave5-vpu-dec.c         | 172 ++++++++++++------
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  98 ++++++++--
 .../platform/chips-media/wave5/wave5-vpu.h    |   2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  61 ++++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  12 ++
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 10 files changed, 283 insertions(+), 102 deletions(-)

-- 
2.43.0


