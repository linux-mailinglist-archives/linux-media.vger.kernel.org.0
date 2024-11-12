Return-Path: <linux-media+bounces-21274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD59C4C81
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 03:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EED05B28C38
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 02:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DF3207A35;
	Tue, 12 Nov 2024 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="JJj9BDMS"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022128.outbound.protection.outlook.com [40.107.43.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D47207A25;
	Tue, 12 Nov 2024 02:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377731; cv=fail; b=QSDccdxba6joJXNlK8mDlsiqKt7IUPzw6JLrhqHA/wuaTCQs52gyTn24rkddTmF5RMcmvf4ty1Mokrj6tsem8Us6PIsJC+YVRAE/80VZRSS+fdAAeqEXwsY75qJhdUimZuZAlszVXMuqzY0rhzyiyR9haZgHE+zxrfkQbT3A1hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377731; c=relaxed/simple;
	bh=Xvu80T6zUuRRR5N2Sss+I8buoYdiZXcymJoC0F7OAvw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tJJLl61qfZWxotx+Lgu3OX2mvIqa7eYEFSfMNFNyS4Ez9URr8nOadW9BnBjzpI7Ssc9G/YoPCibh8RBWYnwiunk6L+H0PMZejyJiWMoQ8FA05puQzKFkW8xJd1ki+6b0qNxbp5KWiANG7+KyKwHp5OfKNrFCLxkWKrvHlr03aD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=JJj9BDMS; arc=fail smtp.client-ip=40.107.43.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPp6FbLMqgFA9UpXkMDZZ12Qd/Q1fPlAlH0eH2u/SSy6zAR4N54y9ZOvISnEw7I+p7ne3S0/IGS6TLCABAjOwoZX7DUKxxqgZykBPQNIVKqppSVwf0gd+tkGC8FhNLaacjPklMn6yPdSIxNkjt/tnK8uLaNLFWFeJ3Ud9CocsNh6eV7Ci3gJvZMQNj4inR1BXTYAfzGkVxgEDJ0VJXAmaXNOl1uoJEy0ummHWi9ra6YH13+HA1bE9iDyyME/OmWduhmPngsmZwN/KQpXRYyd47zyNgJlNzQ08yk3MmHpj0GxgseHfj0STG4crUdCbYpMDmMveT4VPY9ce9Hg2Qp53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dk3it6qaMQVRFV1oB+MzH2vp8y8cqpPJXAv0G2GH1fI=;
 b=b/VGK39pOxMLP1M5aXpa9dVumPkBOILTrDe592549H4tX7iSDFlSTD9jlMl1Sxb6FRXs/p1Bd3gzNlO/jFmQpxcf2j3my7qCpSqugSPxvQc0vUbvw3J/ZXlYE8DnK1Aqnt8U+3PCQgybgf+/zyZTiNQqBaK/K9lsFiUrjzO+bpKZ/v1DDxC2q3rnqe5P/R8BzN+kkJ3Bhy6ZUnkjI8p5aAUO4xnZSc9EtEK3cbwlduKHjCBWJIlv3ZbdsqQBysXfTNaUjwYnC0b8gSILoZF+lMqUNZQjSeQfmPeLYfsvriY+5eSqmmvxiYAVF2IM234uVaCHV6OGGEkjNCRtXpe6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dk3it6qaMQVRFV1oB+MzH2vp8y8cqpPJXAv0G2GH1fI=;
 b=JJj9BDMS2ZTzrEkw8qnZG9Jnsk4I8hLF7XANV8mQryFwcVrd/ED2y+995RH1NOiiQeu/R27Yxwn+4jBJmrq0qRjHu6ZwVFNL0SOkNkrjy5MoPh9k66t3Fh5RCcMZ6XraVJxaPm3Vt9BEJhycmNzIfgTdmnkkpi1Wt8aD9izgVZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1900.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.29; Tue, 12 Nov 2024 02:15:25 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 02:15:25 +0000
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
Subject: [PATCH v0 0/6] Improve decoder performance and fix critical bugs
Date: Tue, 12 Nov 2024 11:15:11 +0900
Message-Id: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0042.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::7) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1900:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8da875-5a96-4cbe-1f07-08dd02bfdebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y5HWVG1KGYj6IauysHs/K8disSQNKM+dMROCpn0fYVCiHIsqZ9+nYWyWFmfM?=
 =?us-ascii?Q?uHTpQv2ddDSUc1LkL8mWfNPxSsuikpX0CiS0H6OHo5nAUnhE/x5sWrtYe2xE?=
 =?us-ascii?Q?P6gSRyUL8sk8r0K86wIm4AVoC5d4b+/gZuEcWzc+SAFQZcBHoqFCAE+x7Vvh?=
 =?us-ascii?Q?wmHwwGVqA4A0WQe2moBM2Rq6hILlGZ/C2BOgzGmxIGCaKTBgRYEnakA8mzFW?=
 =?us-ascii?Q?vsK+HAWOr8sKbKIE24Cli9WMU2IcfxfZ3zXzowoNojluObo+xKUjdobsUXUR?=
 =?us-ascii?Q?8R9ccDcrn+q/P8PMjHY1hVGETF3mjkv4flYUpTD/3P4/+4YAwvf1NEK67JHt?=
 =?us-ascii?Q?eiJWsE0ex1r3yP8Z38bmHdzmkFwtOwxmxOpsT5Zt31q/bisIJ+CBKg2P1lTf?=
 =?us-ascii?Q?yUDRywIOx4FHJJq4Pa2zk6UUTzLySIsJlboDc7JVqndbMaeFhFDBECShYeJn?=
 =?us-ascii?Q?ZmUIlg2g6quv5g5t/UEKuzM+xmx7lpSVHzqmD39jYWCzwYfSS0AEyWxnrpje?=
 =?us-ascii?Q?f2hsqy53fMzQDLp5MPhP+eM2JESQNpPR2LTfW0fNRf8DtIcjPg5NjsBrMYYa?=
 =?us-ascii?Q?1K5oCBeuV2oNmYEhhPunysC7rcrYX0bPNTV3nxUqnBYgPSrpzhgC7tGOItRK?=
 =?us-ascii?Q?DCchuXRrAlL6RBCbfSKuT8qcO/wAK81EpvupWsyJUTtrcunKU5J7vM27qmNO?=
 =?us-ascii?Q?K91xSsuxP+RM0m63Cc+lRqvc3GvQCZm3BXnypbzzAtWpbsdxlDUnspCAub0L?=
 =?us-ascii?Q?DPe6JYksAx0uzUszrgeEiIY21Klgl2xCNikFlxdJ6WbFr/ee1d0PR1DW1sZh?=
 =?us-ascii?Q?TMOZo1uFCz8uwqAEYwirNQS9HA4AbLQ+CJ8JBBfYFBSHO2/RdphuYjyHSGs/?=
 =?us-ascii?Q?jJkglAHxZ0KMicUUM5LGD3zuH3xWZOfUzqq6/E/lemFC5VNw6JIA2qX6hSUV?=
 =?us-ascii?Q?LzqngnRvNosHWmqS2ExgSkD5dbZ1gaiLHYbhvSaJWB/U5lVpCorVYp9cQ6yP?=
 =?us-ascii?Q?YKmA6mIQZlVMw+m13ICjkkxHsPgqAR7PtnDlI9NsuruHbrROSvQ5RqnyVBSP?=
 =?us-ascii?Q?C61LdD5llZTmBi0MmFnmTXjnGe33ooPqPzXSbFyjk8LM5K1DhTyjUCcd78vn?=
 =?us-ascii?Q?jAnO+1fm5tX79eTZxEGCoCF/g5dPymFGC3pkSCyI1o5306IgyG7mRvCXKRSy?=
 =?us-ascii?Q?o1mZa1rspHpFSbaW1xwr1bI1Og+ioWf8EhlYOjKeY5ZD5kshkdo3IcbkXe0J?=
 =?us-ascii?Q?bcwd9goHp8ViVgP9K7QAEnIWrBAoBtxjNe0OhDVD8y1BXiBb7JC7xqafqN1T?=
 =?us-ascii?Q?uMs9bxeYjsctMmjdqWYE7G/SrhuXMbk+4+0jAwCUJE4f5mB+t4S7QGlH+5De?=
 =?us-ascii?Q?Kd0fPGw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SowF1afE2S2QipvOu9dNvET7ZWaaO23Dd5kH4zxBodHjU+uxhovsX9yirRjN?=
 =?us-ascii?Q?mkSBJ2NDlsRR6EsCOi+ltXdr/+VIlweOPUn1wUgWbkhk1JuW27f/QCDdXheg?=
 =?us-ascii?Q?zDOmz0LLIavKzgIm4yQphJKwd6QJGIm/AmuJHkbvdKmIAhl6f/ASr2TR3jrl?=
 =?us-ascii?Q?d2BfcNslwk3/RqgfVFxWctfsm/KWmOHO6oMG0V6wOsA5TtcwRC8C2fJ5Uwvs?=
 =?us-ascii?Q?7CxIxYcYux+A9Am4yjU++R5pOBKKIxevhzImnruFrHVfrGi5KqspjIu4gHbr?=
 =?us-ascii?Q?jpjtba1kENlqIN1gYj1NrQjtVLeX8vMzFpgV1qU5X2b3X6Si98u4yW0qRMNI?=
 =?us-ascii?Q?a7aqER9euaJ/oncwGQ29XTyKHTgCA4aLvbh6i76MSdk6wo8kX/uRI/ExNw64?=
 =?us-ascii?Q?pWBYPuRqNDssprmTnJ8eFcVwkcGPtdGshccFW0O6A8NPaFJBoj4UjFrtnjLt?=
 =?us-ascii?Q?+hDmp8NXcPpSPE+DBy81QsKcPWtpHmgwsPuKLJNgwOeO+z8EejMz6yV7HTv4?=
 =?us-ascii?Q?CARNiNOgHi1yt+wnGzCn98osEojf4dJCh2Z7sKilDsBTyMwOKE0K1Z+Tckvq?=
 =?us-ascii?Q?pcdoefI7+O5lXlDHDoHnYDiP/aidtzcnMyQ16BicSYRdQ/kDfxGe1NT5HKj6?=
 =?us-ascii?Q?j7XMoDg0QPGz8u0xKWnfBlhOOPKAIE96T9rqKqRg27LaUphuZrR3goA1IyZg?=
 =?us-ascii?Q?friGeFKlqMOnh/IA6aEuZhI4Nvp1uI1C/30aDgyz4/0AvoXELZ4CVchoVDdm?=
 =?us-ascii?Q?2+ThbvNmatNylY1PJnhsct09bUiZrCQd7eResiY7goIdKrrs6PRsA3WaSUmb?=
 =?us-ascii?Q?W0gIp+AMY8gimQ8I+xqXeGsyx9mvxtJ1gJ16W01vHf34md97C/kvc7vysUF6?=
 =?us-ascii?Q?iDQ7hu4o1Y1NqHnAJdEJB/ROjK9WLIbIZGzRj5lHnHSPInCaWNssR3YkpRNH?=
 =?us-ascii?Q?2r4HkhbliIAqR2HkvArBY2NFY2fcpOaV7V31JtI386/RXvl2K1tBaeigMQH/?=
 =?us-ascii?Q?JvK0r5F4Jdezex5pYDOp+1O11rIVw7bvvZUBBzwewsZdL2/nFOqM9rHqt/20?=
 =?us-ascii?Q?ruqGCj4e07ziML9KyV4uRIPXwceeDfwB0WQ1JlSV7ZafmVh1SS3gDe5vV9nq?=
 =?us-ascii?Q?ULE7+RBa/rUhua7x1i3qQOccfP8cvypCr9BWe751Yqc2sE7iO7j9q8lICEdm?=
 =?us-ascii?Q?hvDQK8FPNRfBmBG77oc9dpGh4NUwGxlC+vv6HrO1/y39aNps3lOZii2C9OLI?=
 =?us-ascii?Q?iKgeAXZmYhEiYUXviiLt+8izx2a/k9AaWijQJA12XKf5cZTachGafP5RBdAn?=
 =?us-ascii?Q?s6+UUQiaN4Nrqc1r5xrGvMjeIPc5/v6AXA/6loVUZz8O1+yl6VsxdeeF7RcV?=
 =?us-ascii?Q?dUoYgtS1NHVs6fD8C5/WB9hbAjGknpY2KV1mKantZdPfpdEiVt3Oo/ePQvJN?=
 =?us-ascii?Q?jWlx8tZ4ZDv6eMRC2i/t/d/WF7RAvcMKW4tpMfBU90HUzu5MWKQV8ls17W8G?=
 =?us-ascii?Q?/1MfuQ/2Tc4VC0nALRSokrtogZdqxHnKG1ZYIU4Uym+wB078ziLTbtfEYqru?=
 =?us-ascii?Q?YfyQDgMZBlMTOxVgSTwdaqVfi6ufBUkQYGyI1BsTyzmsFO/aj7Pn9CeySt92?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8da875-5a96-4cbe-1f07-08dd02bfdebb
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 02:15:25.6301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRk3BIlxYuDmkS7DWqz7qaS22XEkY71ojw/siP6b1YJfZCCAB94bZl8O0d4TBqbSbMf8Df222XcLjKDg69kj3PFHMu514GxVuCQZjQZRQO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1900

The wave5 codec driver is a stateful encoder/decoder.
The following patches is for improving decoder performance and fix
critical bugs

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
Ran 132/147 tests successfully               in 67.220 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 78/135 tests successfully               in 31.808 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)


Jackson.lee (6):
  media: chips-media: wave5: Fix to display gray color on screen
  media: chips-media: wave5: Avoid race condition for interrupt handling
  media: chips-media: wave5: Improve performance of decoder
  media: chips-media: wave5: Fix Multistream Decode Hang with no IRQ
    Present
  media: chips-media: wave5: Fix hang after seeking
  media: chips-media: wave5: Fix timeout while testing 10bit hevc
    fluster

 .../platform/chips-media/wave5/wave5-helper.c |   6 +
 .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 410 +++++++++++-------
 .../platform/chips-media/wave5/wave5-vpu.c    |  23 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  11 +
 .../platform/chips-media/wave5/wave5-vpuapi.h |   6 +
 6 files changed, 305 insertions(+), 153 deletions(-)

-- 
2.43.0


