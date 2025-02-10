Return-Path: <linux-media+bounces-25880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C5A2E735
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 284003A4625
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B771C461F;
	Mon, 10 Feb 2025 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="BhTXKHOR"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022096.outbound.protection.outlook.com [40.107.43.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773841C174E;
	Mon, 10 Feb 2025 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178462; cv=fail; b=ugcdl1K+ZOb2GaHnRUZUPesMichLUkN218wAMoK+oSEWs3hhBPxCNFM6biEmENbj+ujH5QrQ09qX9foA1NAuZYs8Q4hwf1tsAzO7BU0Ow0wjLwqvgBYCHNhd5y2v7cljz9q0IbGsK0u6p/lekVwqSEeh+p5IXrHRRWgHtb5IJpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178462; c=relaxed/simple;
	bh=rBA+a5jbM6Wb1r87TuOdNbgOM34bYY8M3i66YKyFrOY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BhCzRxDo1PE7zP98PFKeQT+3a7HEX4Ubu1AiMf9rpa6hD/GN4OBdeGJyYhxoYMfAtQDnG57yPyMyYOlMJNFcGmc9d0OePV8eWlvxmrAxXTb87bGKLIkinqZcZsXImhdEqF17yP1MTqgi4+AUK/avympqAVjNStUFQNeC6FPO7QU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=BhTXKHOR; arc=fail smtp.client-ip=40.107.43.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5zAdeRZynH8eMSankTGJNmKekSAORBq3eeIKg/GZ8LCR9tB0fBcQ/0KzY+w3F8sle+v4Sl1NCD86hTXu7MsrYbrT2V3WfenCHg7uM2RDzu0+4KOw9hJ0lTPo5fzrMSt/euxCFyKFOJucSWVZJS0E7ACeWcPTB9E7r7E2WHRLIA2BOnCgTIh3MHqFQyfPMHliZMDiL7GfybTWmAoPR8pYA7utrFfjl5Hba+AqmDEOf6Mqnv2snm0snCBxcWRFjS+4rX+u31Cg8Bn1f7FowsWjSnL9nDy61ZfKUgcs49OF532u8LLTUaM3a7mCALAuqJBVdfk605qAYeu4n1m4y6//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZ6Ize/G3CQmVpITMKKjBOAAJ3TqC8nQgNX5d9+0noE=;
 b=CdrxtF8l9HEcSdCw74paPct0Cy+oXUOBjo/jKOhT+XHqmjBLSjQgo4hao5jzuSEv+FAxnqe57iCYGZDYUVhjnOCmo50BsRvRuj8aTTB4vtmu4wEDFj8G/mA3bhDC0D3oBUt/RwD22cj5x2Gp/DWa1FuyATO+tldVSEiDwsqzF33GLpMskiG318QLsgeDD3rXloL9pSioohOG4iSlgV6F+uK8ma2rayM1rEvf6xsAT83K8ebS8Dp/3s9AFFYjYzqmzRclV8yZzcyKG1obeXmNQQ89Oq0Us+1QxA2fvK+tkQtJjVlMDcwuhmDWmW1icqXTk4TregLOnj/yw9P1pwedzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZ6Ize/G3CQmVpITMKKjBOAAJ3TqC8nQgNX5d9+0noE=;
 b=BhTXKHORcpGIpPVd2Qwo9oDY6LLQCxdHS1Ms/1IYl40CkPv+OBl+RXSmEctm1uBeJC2FE2cNCnURCtAJu+K870L6xYnrdaeOMyW6IOawLPZv7BxLvAJus2Pbf9KE1HAj9bjjGVnqv9d2dEiaZ8I/79bB+y+krd/lyt6YLI2TWL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1504.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cf::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Mon, 10 Feb 2025 09:07:34 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 09:07:34 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH 0/8] Add support for Wave6 video codec driver
Date: Mon, 10 Feb 2025 18:07:17 +0900
Message-Id: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0178.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1504:EE_
X-MS-Office365-Filtering-Correlation-Id: b98f3bf7-59dc-4696-97a6-08dd49b25b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q+p7NBT0ZDF8qwK9U/0/IRl6/MygeLxMQ7CacDms4KrfORY9KcQWRAhFL0Ai?=
 =?us-ascii?Q?uZwSP/WQphoyL/MKZWj5Z/WfDqX5XHLsq+bFuQZU1BYuzi2LaNX1WUYyp2n/?=
 =?us-ascii?Q?aYx2aAm5Wnmh9TkNWfsE+bNoTNZzrxvg3bQr/6fbQEbyEtALcdxQEFJ0PuXA?=
 =?us-ascii?Q?SOk03JdXZwm2RUA/NuetZv5r8pQZBuHlNP5KR5i1ba1OHz/XscNjR4eCmS9d?=
 =?us-ascii?Q?Nt2FCCda3l0iHpwAdcHYfnNTIAeECnH4g+zWJ373dqxy/qBST1GjWpqCVXEA?=
 =?us-ascii?Q?nJ5W8TXGcO80H81PNRuB1gE4shU3OeA/r+Q3GvD5CLj1cuH3j1EVxNgb7izb?=
 =?us-ascii?Q?A64mtu7vMDId9nyFo6n8Qxgy5JMMm7N6tDt8rI1kod3afnfQdBVP4gNVPx2m?=
 =?us-ascii?Q?1qkpiPDzL2ofrc5Mr1z3HtqvkSicnzF2bpFQ4DGz4bd0UH5eVI7WVdOlIO2F?=
 =?us-ascii?Q?IgHccdcjPaLtiz/BBrJqckqsEyuGdyAiazfa4mASewOsnplJuwON6gvAycYt?=
 =?us-ascii?Q?xMni8/x/7cwrmTy/i3TdxYGARAjo00AqPwHwjWAFUI20+b2NuMboSjxgPXb0?=
 =?us-ascii?Q?Nsyd0QpzUGXbgTLsAcmsYAageBBjtgcVa2ozfKJVLO0Sj9Orp6Un+ZCpTUT7?=
 =?us-ascii?Q?y3O4pEHmMPIYg6oke18vWOR3eTsRSkmq8Iim2fAeUHDBKfj03fnljefG9GCX?=
 =?us-ascii?Q?TLPGIMArSBRnZiWt9+Wjx75uBlQos6mZ9d6+HrMicalaeUB7m0fNteKSteFd?=
 =?us-ascii?Q?n90OS4fJ3jZ4lXy3Ir2heKkSG0AfGQyHAX8GnIkaIfwoxIacc9s4rLmTXku3?=
 =?us-ascii?Q?XhCk3Z/S9y1QO7Fyf+ffYJnJElAzRy7XKSw/JUgxwVCKLYaA8aLSAnFXoGKI?=
 =?us-ascii?Q?aoGe05S2e4K8zOtoDtuvWiw2PkbSp4RRkRsYshLSD9nVJQmAngmSMLToAuFP?=
 =?us-ascii?Q?OS2xUpBkG6GG4HJMVEsum0r+gMUx/gOvBYjzNmuIQ3s2N0Zvvpoq7ZWyb9Jx?=
 =?us-ascii?Q?ub3FmcOyEus3WL04IqmG8jlzis3c1VtkuW5mlzrNc2V8fP2V3yDbg1tjohxz?=
 =?us-ascii?Q?ThveMMxBN/CxjMJRdwjcKC/Nk9zWcXGhXdkde16SydNNOIjG0x7B4xHR+p9l?=
 =?us-ascii?Q?Pssz2gHtlSl4EdAvKOs3AbyJyYJUuU9soz9V+yLFsLnQqYKi3Xk69bOltX4t?=
 =?us-ascii?Q?kSRMot0pNzgMIvMSob94jtwn/BKqoRfF4nVJoX9V3xpkzDTZ41D5cpVNzaXn?=
 =?us-ascii?Q?nWGxbH1o84BC3+txC9YoJlK8Ic3iQFHSUJ1A9R5cBBvIt2a3NqSFN/rR7ahm?=
 =?us-ascii?Q?lokDbuptmIviwHm4god2a/BuSIlQeRrT7O5ipD5QKMApVGQNdDx+G1pVFDnn?=
 =?us-ascii?Q?vJd/JnNasfLKN2za3Ck2DxxQDKbOcSzEDaHdoyawhGz/N0oOa77UfBjcNfQT?=
 =?us-ascii?Q?uFYxaWCAghfPm1bdduC2etYmTgD1hfDQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nyh/FRa9qHB5fjH2+gIkBaYQZsLtTNb0sWx/zgLnsPHA476ODUG9UVkQS1/0?=
 =?us-ascii?Q?t0LD/Th4Sk1s/7Wi1tgvOQES2vkBQFg85F8+KCkuXg+Nckfn24lh3v7UcUvc?=
 =?us-ascii?Q?YYkkY9GUkBKMAfGsu3++JbNQ3JEKTFaNGCvIUEoEmUt7sLDJ+kwUKvFDM7gq?=
 =?us-ascii?Q?kZvtgsWFxDHmR2TKoMgKfCAm/HA4CxxjiNUXD7lXfVB1EeTQ504Ihj0iOC0T?=
 =?us-ascii?Q?71zdlm8XMnAkvpcwGa1PizgR0jO1YuyafGEpD4g4e7W9aJgwZz3NDaiZqSei?=
 =?us-ascii?Q?6Sb1smxB0VxBCuvQjdO57eRtjtiaUAITez9GHjyMSQRQnIC49HSUpg/jhPUz?=
 =?us-ascii?Q?U7sXWVgDNXYSpVmPGg7uB3aXuwQoZUPoadssH0V+c1J73n7ZanDrK22OlSIN?=
 =?us-ascii?Q?Oiz1tarcyRPHzivBQ1hQvhdsO8tl95/9w2zuEoviXFgkhdBgdHOeenIgaOjd?=
 =?us-ascii?Q?56CUItiJ6fxiULnQIYy51fSPetVZQ0plFPuRDJRa2MojqCTgzH7rd+Bt2Y1r?=
 =?us-ascii?Q?CV1nnHL935psGsfYoCZ+rZ7jl4mNmL9mW48Jehg//bDdFMqp1YJQYIJ4BxqP?=
 =?us-ascii?Q?tP2lqbPgiAs4jJmfnGi+WSmxlwXO9/wk6sqshvvItQbADBeAEwkWgavnwJjD?=
 =?us-ascii?Q?ZPax4Yd+OSCKfWeuHb+uS2LE9WiIk75L2cR1LtfzbiCXHzffULzjxTB7OgL1?=
 =?us-ascii?Q?KT2AX1I7j/YIqsO3ssFfd312JfVa+QBh4Pq6m9HPK9G3qY3QZqmK/wDRuYBf?=
 =?us-ascii?Q?PJknsWD5XElqS5XioHkkrSgElt9cq6BPyK59pndu/VM93vjcXQygK8OLHJEz?=
 =?us-ascii?Q?yxXtVNwj5KScNvveE4wyXZU65EIbnBeLJr00RYf8QqQpmEKAYwFi80wF7/uO?=
 =?us-ascii?Q?TMrklsEZezv1CSDVwGyyoDu+kYKmBGu1ZayNSNjiOYWw0/6/iQ88xBOkS3qg?=
 =?us-ascii?Q?7dtGRxNXi+svuD455G/+PeIeSu/n5+ESSLokeEA7dKmKj7q24hCE9BO7B1QK?=
 =?us-ascii?Q?aZL3VAq+wd6XrgAcsTHUxIWJwQ93tQNURgIPeu3ggCveFXoBxxwPsKKlc5gx?=
 =?us-ascii?Q?hN1QmaK1h+sDF1aeL2ufiVa1MnhnM/bM3LCA5Fl1RyUwrL22vT0Gws7AfnnS?=
 =?us-ascii?Q?JZ0TfHZSVFowhaPS5av8RjxbFd4zhDgIYtP4d40YDXTy/KN7br+0xYgVLTNN?=
 =?us-ascii?Q?TwvRtc4jqDnLHu1sh4xiq+qZQEelPZQ/N+zbez1XrPNe8BRQEmVrzwO0LRUD?=
 =?us-ascii?Q?RJW1El/HzuFJFTqFpaq+RvnA/TX7pXkqFA4nD2IYXcE7jB6lHqxYjua5mZRb?=
 =?us-ascii?Q?pYrGnkAHvRyt7rv//uua3/UiVQbYGau4/2riJV/I1RD9vwF6BSTujheLhdtk?=
 =?us-ascii?Q?ui/jbMqQQYb1tICdEpHk5EAChMSIYpk9VGZXrkw/KDkha/4vdMl6JVZmQyeO?=
 =?us-ascii?Q?oDTgUS0AXoedxPokwqXulrik4lEO+iBs2Jp9/UH5thcOhXEQMvRh45S7Aegy?=
 =?us-ascii?Q?ItAdvVYVUlXvQiTygCYBDJYhUfAwowLe4vV3DXaR+Eo1bEWPFB+r5i50mGRS?=
 =?us-ascii?Q?OvSLUU0cDE2VY/uAmfa9JRP+Frzj2B6pyly53kVW1AT6kgt6HS1YB8NKsJ0P?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b98f3bf7-59dc-4696-97a6-08dd49b25b68
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:07:34.3970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rv/hsSXR0ajgNRde4Uf1GpQnJ9IDqGmfDHtBR0TM2OB54WNyDxWXRj9f6V5PuhCnSri7zHrTqlfuSLURriIGwx5SyrhWG9IFYZ13pkZeXko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1504

This patch series introduces support for the Chips&Media Wave6 video
codec IP, a completely different hardware architecture compared to Wave5.

The wave6 driver is a M2M stateful encoder/decoder driver.
It supports various video formats, including H.264 and H.265,
for both encoding and decoding.

On NXP i.MX SoCs, the Wave6 IP functionality is split between two devices:
VPU Control Device, Manages shared resources such as firmware access and
power domains.
VPU Device, Provides encoding and decoding capabilities.
The VPU device cannot operate independently without the VPU control device.

This driver has been tested with GStreamer on:
- NXP i.MX95 board
- pre-silicon FPGA environment

Test results for decoder fluster:
- JVT-AVC_V1, Ran 77/135 tests successfully              in 35.929 secs
- JVT-FR-EXT, Ran 25/69 tests successfully               in 17.717 secs
- JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 81.568 secs
- All failures are due to unsupported hardware features:
-- 10bit, Resolutions higher than 4K, FMO, MBAFF
-- Extended profile, Field encoding and High422 sreams.

Test results for v4l2-compliance:
v4l2-compliance 1.29.0-5326, 64 bits, 64-bit time_t
v4l2-compliance SHA: 77f5df419204 2025-02-07 08:59:59

Compliance test for wave6-dec device /dev/video0:

Driver Info:
        Driver name      : wave6-dec
        Card type        : wave6-dec
        Bus info         : platform:wave6-dec
        Driver version   : 6.9.2
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
                fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(1180): !have_source_change || !have_eos
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 7 Private Controls: 1

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warnings: 0

v4l2-compliance 1.29.0-5326, 64 bits, 64-bit time_t
v4l2-compliance SHA: 77f5df419204 2025-02-07 08:59:59

Compliance test for wave6-enc device /dev/video1:

Driver Info:
        Driver name      : wave6-enc
        Card type        : wave6-enc
        Bus info         : platform:wave6-enc
        Driver version   : 6.9.2
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
                fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(1169): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 53 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0

Nas Chung (8):
  media: platform: chips-media: wave5: Rename Kconfig parameter
  media: v4l2-common: Add YUV24 format info
  dt-bindings: media: nxp: Add Wave6 video codec device
  media: chips-media: wave6: Add Wave6 codec driver
  media: chips-media: wave6: Add v4l2 m2m driver
  media: chips-media: wave6: Add Wave6 vpu interface
  media: chips-media: wave6: Add Wave6 control driver
  media: chips-media: wave6: Improve debugging capabilities

 .../bindings/media/nxp,wave633c.yaml          |  202 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/configs/defconfig                  |    2 +-
 drivers/media/platform/chips-media/Kconfig    |    1 +
 drivers/media/platform/chips-media/Makefile   |    1 +
 .../media/platform/chips-media/wave5/Kconfig  |    6 +-
 .../media/platform/chips-media/wave5/Makefile |    2 +-
 .../media/platform/chips-media/wave6/Kconfig  |   26 +
 .../media/platform/chips-media/wave6/Makefile |   17 +
 .../platform/chips-media/wave6/wave6-hw.c     | 3113 +++++++++++++++++
 .../platform/chips-media/wave6/wave6-hw.h     |   69 +
 .../chips-media/wave6/wave6-regdefine.h       |  675 ++++
 .../platform/chips-media/wave6/wave6-trace.h  |  336 ++
 .../platform/chips-media/wave6/wave6-vdi.c    |   52 +
 .../platform/chips-media/wave6/wave6-vdi.h    |   59 +
 .../chips-media/wave6/wave6-vpu-ctrl.c        | 1020 ++++++
 .../chips-media/wave6/wave6-vpu-ctrl.h        |   38 +
 .../chips-media/wave6/wave6-vpu-dbg.c         |  230 ++
 .../chips-media/wave6/wave6-vpu-dbg.h         |   22 +
 .../chips-media/wave6/wave6-vpu-dec.c         | 1883 ++++++++++
 .../chips-media/wave6/wave6-vpu-enc.c         | 2698 ++++++++++++++
 .../chips-media/wave6/wave6-vpu-v4l2.c        |  381 ++
 .../platform/chips-media/wave6/wave6-vpu.c    |  487 +++
 .../platform/chips-media/wave6/wave6-vpu.h    |  106 +
 .../platform/chips-media/wave6/wave6-vpuapi.c | 1001 ++++++
 .../platform/chips-media/wave6/wave6-vpuapi.h |  993 ++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |   80 +
 .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
 drivers/media/v4l2-core/v4l2-common.c         |    1 +
 29 files changed, 13766 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,wave633c.yaml
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h

-- 
2.31.1


