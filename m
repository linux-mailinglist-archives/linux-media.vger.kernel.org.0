Return-Path: <linux-media+bounces-29822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D42A83572
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ADEF174B17
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 01:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7BD16FF44;
	Thu, 10 Apr 2025 01:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="ZPIsj2bg"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021123.outbound.protection.outlook.com [40.107.42.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6525D84039;
	Thu, 10 Apr 2025 01:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247319; cv=fail; b=abgyfqY53EW1MwVBSBBN04gUdfxQLRGD7twy9xDwVMGmvTZdq0cxOb1AmEXC02po7qsZ6b2tSki1wZffRkTKyF02WKGkX9jN7paZJL+gk5vfPFF9AFwEZOddJhOMdh4YpEhaQDLnBpnUTl3HSeld3roBi37tpIaTXmAKlJiss2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247319; c=relaxed/simple;
	bh=Ew1p945uBxa3ssobd2UchAVJlolaff/iNIC2bTRp2gY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OH6eRRz9HmMmNiCONCymwfePNB+N1aA4grhsuKSxoKdILhmBF6N2FfJ10WW2OPL3RAhRq11uW0GgH2lFA9tNX6L0wxZ8XCSaScqoHqHS/q0cpzCV30n0foaJCEntdxqP9gBxk1jPdFLbPBD0WitUoadgBzehrSoFAX+kybIBxEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=ZPIsj2bg; arc=fail smtp.client-ip=40.107.42.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8YZkY3vu4aVdrpYqYtLmIef4X00hNbaNj3BIK2dbKcgexWQttvpPnKMM54FRCLPp9FrdVsAo1JwR93aQm1JdE0jcUY6oTJhKa4wQAkSxq7VVV7q8TvizpjRVMmcaJk4ec1epakkzWBU6ZZks054gYrZSFAdCIFWvgingC6BUd5u5M1wRf2js2ABz12w+OoZMXdrbpayEtZcCbOENEwoCb2UeSHP5hs0N25toqkrJRfigFTiOAdn4foPMIBKlZ6xInPLiOsW+gso064zuK+CFnIzWW54DO91pyJAXrn9HytDlcPcx/tHz/MLESFyN+U8y2yIFPxZptWpyCBStDr+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBbtB2YK1yc0dnvOWnLHgXx+WhDWDb/yGFq3t8ECEw4=;
 b=iRtNP/YSEh1LoFsRg1qjpcg3eIGFRdNvfeixr/bok/hymd+FUlcsvHJ6mt4hy5Sa3QZ2bx5dYONOqk9qr4hL9VpNzZZKzBiz7k2fASMDOgZLHkb9Izgck2fWziPyYOSs7KAF+adGZgeZq3KI5kOMWte2HOvn3+bsZS0UMMvU7Vbsm9/DpHZ1/RfAbCto7u/Q/Bq3sxubZd+RJyt9cAgKviY1Rfatagd8d3vvPNcPXCA6AG3tMQHyOTr5AShpOQT0te6SqzfweqiPpbXULIG7fK7ETqo0JibF0wqF2othb2iZg7vxZamBkfHWeLeCLoRmrl2yvb2DpNqkW7sTYwqZRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBbtB2YK1yc0dnvOWnLHgXx+WhDWDb/yGFq3t8ECEw4=;
 b=ZPIsj2bg1JOk/XmRD2JpFnUVBZVGQ1K3ypRYomcFe0Ajd6QCNZopAUGpHQ9lWgwPu+dj8nM1BG7UacHmsMxB5hDITVwFDdygs6WDlosy1f4PsKbpk4k9HR6rVWKTIYLXhEMPoU8u7E1qN8FGYqz1zoz1afRYKgfn2Hp4aoR/Jzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SL2P216MB2928.KORP216.PROD.OUTLOOK.COM (2603:1096:101:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 01:08:30 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 01:08:30 +0000
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
Subject: [PATCH v1 0/7] Performance improvement of decoder
Date: Thu, 10 Apr 2025 10:08:14 +0900
Message-Id: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::6) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SL2P216MB2928:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df0e04d-8a07-480a-60e1-08dd77cc350e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ET62GeJFQIYicQ8jvscfpQuWTprhMHJNmI3CMegUUd7xb3TpAaWUxOAjde/w?=
 =?us-ascii?Q?vVsN3d3Xk4tJ8ojvf+bQGBUK9f0DuucmmWpWx9moJJC2PQVQmTtE2dGu/chC?=
 =?us-ascii?Q?vUhj9GVo9AwHY8v2aASFsXnNPfFko9o2MMyVCzaVxIuIYsCeqFtXz5Czfl8j?=
 =?us-ascii?Q?lN0oY/7hak4A3YNVXMHr5piA5UDuoyYoIhf8DMoc7QmSONvKbvnCX5gJZqNE?=
 =?us-ascii?Q?U7NZ/f2sVtXFrM0BqUO+8Q4ajWbyrH/eWa5dhLDN15KGomB0CdJd8+9vvQ0Z?=
 =?us-ascii?Q?1yLxhmzcXl8gHhDa6ZLxmyZ9Ordaq2Cq5ifBKXUt0Nl9kznFg4ZQf946/do9?=
 =?us-ascii?Q?y+qP4jq3S+0YpeJvcqKa2YromsYiKX8NyWBYxGFCn5ngS0Z1UayjwcuWEqnh?=
 =?us-ascii?Q?FqRYhV54zn8BlgOS7eQJVkn8X8nGPkJmovfSF00dTkp2eNeYmwTKkzAloaTx?=
 =?us-ascii?Q?plOtOO+o2Fs+cOqnb4oD5zOdDrYyx/zrh4uFN7oa2dP7TMQwH6NsY9OBPrNU?=
 =?us-ascii?Q?RvU7c2jrO+2UAgIDA9/dfBBQqxyzamyaWZldKtX+/43m6pLlYAlhqt66uFHh?=
 =?us-ascii?Q?4BJFv8iMfUseXqQ0USAFqZr68Opjm9/rFHALbD2q49RtX3lNPi3+SG6vKDy5?=
 =?us-ascii?Q?uVwQmWAGKmngp50cHWMVOXa3TUlbztv66RJ5prY0lwMuVPDJyN040Au5Pau0?=
 =?us-ascii?Q?dPLXZZpCqio8StMSIwcJXZ6Ebl0rflEMPHV5Vjfpz7uZkrN/yzX/4WPZeQqz?=
 =?us-ascii?Q?rMhG3KO4jIl/StlNveeJrOByte4Cu8V23LxjO86sEnG76ywI/X8q56xQrMyL?=
 =?us-ascii?Q?H9l10XT7HM3cS8h7iO2YrnhdhXlV/JLBaz4B0Tswga5/m5apoUJQJYcIikZI?=
 =?us-ascii?Q?eyA/ltcVtovL3S3/iQe7FW7VWXIiFdfzjeO9XDGvrk8Deptj/59ZXJ9FZ48S?=
 =?us-ascii?Q?gAlukr2t8pjodvs5teukg/XcTNTIkzDe0AiFmWlWbRr0Mz8NEUj/TonVusP5?=
 =?us-ascii?Q?ZxyqO4X7GKGRFom55SpEyZUemYVsqLcwsPJrG9HQui+FKlJzWhiSyaLHJgwG?=
 =?us-ascii?Q?sSPgtZvVvehJBRQqtgaF1MzmH+z3tLZRfcvxuBgDo0jK9PqlrWefSGG4XrV9?=
 =?us-ascii?Q?jcx0pGBZlaZ+VgKZWgeiWs8SojXmS15tm6tcNuckbmJXtRDYpFud7WAPbVZi?=
 =?us-ascii?Q?RBN2UB4jvjspfXy3M/QUacJpJ+DbPss4VPjqweMUH9+g1ISqBY85vXSw9i/l?=
 =?us-ascii?Q?nAc5stpWlciCqO4smAngET37LMm0Znx2mvhLuMQkNFUN7+33rzaEMigQKeN4?=
 =?us-ascii?Q?M+PCVx//Dc0r9exNxihJs3SHjbML5xRVGth0OcrfGMjrFXJbQ7eZ/f4PRa6y?=
 =?us-ascii?Q?XyJxe//R2UXur0Vo+YBFgSNRTa1wXKU7c1wy+l6M4LVdmaYKmXAzUs3e5bGT?=
 =?us-ascii?Q?aotgoC1NoNb8CG9LQZGAHCEg31YJ/lDC0T6QrUDEMBe9F+konccBaw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bj4UCwMelSNlQ+oB6lh5gYpCMdj0F4qxd2rqqfhmm2Y4zOZyP0Vi0GiYkkA4?=
 =?us-ascii?Q?F7en1yZQj9jobkO4zuHakjCZ/cVouOTgOCUILNFxNkTNGkhHCF6ipDXGCBsc?=
 =?us-ascii?Q?8X6C/qSfo3OecxlcgIs/14XBrnvrtdHLPj0n85FqQ1QdT2KFbCfhATp7zi4/?=
 =?us-ascii?Q?gSvm5yqHWwIZKH2dUchUGPh3ytZAQWfOSyBkca1diYDAbOjmyUKlXf/gj/iq?=
 =?us-ascii?Q?fxhYY42M+1w7d0M3t7GBtfFn0QvGEFlpNa38wq2AdoMPchUwPGpvU6TcB0Kn?=
 =?us-ascii?Q?FrPgfj7NzrGicFAW19OE0YPeWIn/t/oJfVMTnYBDOQwVtCdtWO+UD7UN5NJD?=
 =?us-ascii?Q?qiPG+6c2bkbfWH3pdkZtBUp/0HwsyHRDSbqxrEgekBhUBEp37+zpdQuSh0WN?=
 =?us-ascii?Q?4UGDSJgBiA2fcfl5vqHPrrmSAhyCf9vRy3bjHPhEDZ8SoBbN6gNBZ3SKnfeo?=
 =?us-ascii?Q?rdorIFwJ6O38cq9q5qHO191IMgStaOcwhKVq/76/zTo0/KQ2vNxkmXywmGB6?=
 =?us-ascii?Q?oQLu1VIxwYz5653oP3TXcX+TLQFhzaFL/+TONJED0bAEgqPmSxEdavwD3fuN?=
 =?us-ascii?Q?Z8vV+2AS2hE1XZt9HYfGbGUdtsL5fqpOAfWUfrXUvXb97uJCwU+vsc1Ajgbf?=
 =?us-ascii?Q?1SYxV4ZsTQR+iWluDGYzHt8BSHDqdniSVOMn8npyffOCoOgNpwoTpXHW1SPp?=
 =?us-ascii?Q?JIj6IrNZXfrfCJ9Z08kDjibHodd2B4AI9KyXbtL31mXjuy13IXDnqq8Dre3s?=
 =?us-ascii?Q?uAAPEHYOjq7RfpfpG9dPajB+cH9fSZM6ziH5ZVE9T7xUQYPp7+ZfL1f2rvVh?=
 =?us-ascii?Q?+WpuwxzbBTMWMGSwohodvrEo3yvzLf22Yp+w1Sxskcnw9UmM0U7rToISZw1E?=
 =?us-ascii?Q?7cyI7p+7vN/kZGH5oceRfs3lsoAVmZqENLE1RyvwfMKHOS5dE8oSbB4UEuNo?=
 =?us-ascii?Q?UD8AHMFIDTR6gwqPToasEnTo9Q1q8IDYFSCTiUGsG+6V9B6DowhIGlNOTybN?=
 =?us-ascii?Q?Ed6kfOFvv55EJmF8aPjoLFljRTyeEUT1LSBAa8Lqy0CLCa9qsFJ12VX22hja?=
 =?us-ascii?Q?dxPWAx74qw1k62Rl828flVJTM/OWQjC+E3xSgCD91cgUFtgMr7APTDnUScL7?=
 =?us-ascii?Q?/Xh1ZIvaL92c75UpdeYFcIyYO99yqgm3oStm5+ZaU6YwDzCJr+Msz40k/pOz?=
 =?us-ascii?Q?CUiutcWbUd8l/1B3AE8Eke4yU5pD+EG8iCA021RjQIKq06drt0Mp1/pqZ64I?=
 =?us-ascii?Q?zhrcbkWyrzlNDIqIXKZ9zCbe9vYZttpyVAtwWuzXsU3xH4Fmxz6EczZyhzRQ?=
 =?us-ascii?Q?U8cUkANjABHONsVAHMW439g8o6Gd1pv0Vy+vyzFmIvPRLkeXgpWf0MRvFqdE?=
 =?us-ascii?Q?eTVoxJSz+FffPaEg9v555WD7ho0fq+94CPMSvHuSGzSEHAkcS5bfghAXMDbX?=
 =?us-ascii?Q?BM0RO5Yl/RxstHhZl6zaVMoel+fygFmuHyA6OY9Jfj2miOeMNfmcLJ7cwbrG?=
 =?us-ascii?Q?ozbOqw6lCxuPoULFzRABtoSe4s5VaMbHwpvQnZ5Fz7p+QEvMYebYjjg6RHmr?=
 =?us-ascii?Q?JoFt1QrkAWmedsioBFwzX8sWoJ0lQ7BGF1AC7sHgRKMTbfs3YuoKS/auQrdJ?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df0e04d-8a07-480a-60e1-08dd77cc350e
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 01:08:30.5599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lohDRiHtQyQCsPf5N26ElkrL3i69x4PxHvQMKtF7OXkh7DPR0Tfd3iCraK3lnjDm/NlWTVVdKvBJ6PcYBk/NDHiTlzBE0w6UqzsOXycytbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2928

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

Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0
Using 3 parallel job(s)
Ran 133/147 tests successfully               in 41.629 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)


Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0
Using 3 parallel job(s)
Ran 78/135 tests successfully               in 44.578 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Seek test
=====================
1. gst-play-1.0 seek.264
2. this will use waylandsink since gst-play-1.0 uses playbin.
   if you don't want to hook up display,
   you can run gst-play-1.0 seek.264 --videosink=fakevideosink instead
3. Let pipeline run for 2-3 seconds
4. press SPACE key to pause
5. press 0 to reset
press SPACE to start again

gst-play-1.0 seek.264 --videosink=fakevideosink
Press 'k' to see a list of keyboard shortcuts.
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
gst-launch-1.0 filesrc location=./switch_1080p_720p_240frames.h264 ! h264parse ! v4l2h264dec ! filesink location=./h264_output_420.yuv
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Redistribute latency...
Redistribute latency...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
Redistribute latency...
New clock: GstSystemClock
Got EOS from element "pipeline0".
Execution ended after 0:00:05.772414400
Setting pipeline to NULL ...
Freeing pipeline ...

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

Jackson Lee (7):
  media: chips-media: wave5: Fix Null reference while testing fluster
  media: chips-media: wave5: Improve performance of decoder
  media: chips-media: wave5: Fix not to be closed
  media: chips-media: wave5: Use spinlock whenever state is changed
  media: chips-media: wave5: Fix not to free resources normally when
    instance was destroyed
  media: chips-media: wave5: Reduce high CPU load
  media: chips-media: wave5: Fix SError of kernel panic when closed

 .../platform/chips-media/wave5/wave5-helper.c |  10 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 116 +++++++++++-------
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  70 +++++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.c |  36 +++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  10 ++
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 7 files changed, 179 insertions(+), 72 deletions(-)

-- 
2.43.0


