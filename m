Return-Path: <linux-media+bounces-13375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8136B90A38A
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 08:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EE351F21614
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 06:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4D71836DF;
	Mon, 17 Jun 2024 06:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="GXa2+eaE"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020002.outbound.protection.outlook.com [52.101.154.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603C9178363;
	Mon, 17 Jun 2024 06:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718604010; cv=fail; b=p0C+wIt01M3iwSF1Iz6LQBJ2Q3tfO1MoTfhqmmvCmyM+qBdaZCUgQtFycyI2OfCRSoDqnc1hk/2/dNo4HGi4NUybG966Ze06GG7JXlvqWbq1Cm1PHsTfxzNIDFpA+kSDxPUxYbVkIH/a3220YlIALNywNM/ePreFKRsmlF9pIj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718604010; c=relaxed/simple;
	bh=stUvwyKv1HF2nxnW5hV78WVDZ9IEYo+RES1MFvq7IFM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ARR02w/1OcYcKZrG00fPgFikBROOMUVHHD+JWZ0hIHIZ+SEIWr+3AcFV+SR5uF4YWC4hNK9s4QLlCpM/HDO1Zuv7Y7liWo7hAWRgAHp5HATw2lAp0lRkCed+n3NCVUtYaIKcQesO1rdhAiX7GmzBlgSn14CcSgAvTHOwHPPhKwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=GXa2+eaE; arc=fail smtp.client-ip=52.101.154.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJBnQPy7YD5zy4jDfJB98B8jcDW5mMwWFsPAGMH6sheBg7dHnwlEt3oOUyyy3Z/m5pVv1ztW4+RcjrOnmRaCPB1o7PdypAuklwva03zm/Rxz3TBnWzcEo8r26EDhdFyL1qH1lvQ6Ep+SOALl+w3bvlmp67xCWpzJZAUbMZOFPl7bIOdHtcrxiddjxDy00s6h68n7p+dMqBWA97n4yzr7dxh4KHivo+tEBAQ1qXTJoW/DI3t0gOuqV0WeO6oYZznnIZzTolEISMvV4NKzdKgNktUc/R98wxEKlKM0h+hi8UvKu5agsbX8lzkmYrImAHwQ00yhfdkKhYWtgN460Xm2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGJjZNI+FO2TOo8z1wFxVpH+qQNqYHRTSQodRwyMt/A=;
 b=HxdixALumF8+O/Gs2KVb5JmtxaJjeI9w0TNSWwbKxLxFNUF8oRdVFz3bNVYE6voaFC1pHowydZKi4xG8Ebo4n98FAUimZWlyXDWVVPGGlQacVWTOMv+O288e/k0rSO2mufh8C3Z3vUOIazp80Ua6cO38m8F9eVSapPROxltZ66PaSB64yat2ncUU+ToXjyoXYmcGsfffybYv+hlJnozDNz+HVzr0Lzvhqs9NzbIeTbbIy5mrh4odjz6rfX2l3zzYaVxZLc2O/0E+sB3aigApSn/JGwy4bgJyuZXFilXFYKGu5Ags7Ldnj8iABRxxvzGif7wzS2UMlQGwt6jfRBNQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGJjZNI+FO2TOo8z1wFxVpH+qQNqYHRTSQodRwyMt/A=;
 b=GXa2+eaEO3VhT5dKbbjpzOMv2b+z+tkhbdX4oG8PZ1+u5dQG9TSciO5ZX5FPtvq2v5vqOKX6Wqo03eKry9HUIkcTbsmIYOPFB1CMsTiqGMJ8NMOPtbVeAXHfP2w4xm8c4IlalOw2Byrr9Fzu4GmAR9hBK8dvftA/aRaWHIouo5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2063.KORP216.PROD.OUTLOOK.COM (2603:1096:101:152::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 06:00:04 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 06:00:04 +0000
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
Date: Mon, 17 Jun 2024 14:59:53 +0900
Message-Id: <20240617055957.135-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0153.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::8) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB2063:EE_
X-MS-Office365-Filtering-Correlation-Id: fc342f70-ea38-4f69-6d6e-08dc8e92bbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|1800799021|366013|52116011|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ISLfwPpmBo02EQ7CMzH9hJcHiMdVGcR1CmPljljiD/4xPWKfduFk6hHdXyRO?=
 =?us-ascii?Q?2gBbVu4LmufLTOfszuuJaUxFbXr4zxdZYVvSsZrOxY0bno9bnL2R9/F4fUfk?=
 =?us-ascii?Q?0Dw21S2nCwX9OQgWr/NrKwKBzZx2i4pavt/eWCWwng8+kwdGpxxjvQ14cwWS?=
 =?us-ascii?Q?KTG1XBVZ6Tdti5gw3G60r6j+gMO/UyKDcuANssu+ZVKKq7Jg1xlhQiu+ZSpO?=
 =?us-ascii?Q?bxh466v/k8MVZfAMHN9ZbUCxeBNfj2pho1LodbikqQClE95LvY4TheFU7NVY?=
 =?us-ascii?Q?f5tn9TXtcJWnFgJ1JmKzbS3kjgXtzGD0bRh21WtgPqLGTXN1DzVexP4vqcIw?=
 =?us-ascii?Q?oTgI6/N8+5e2r3H4K4yv/HXKVXGaUQJ8AjPgOqJinLgtwZZ3dmLSXhpOz+kL?=
 =?us-ascii?Q?O4gccFTVRPETcvCA+EKuTNgIHBUyLJuquczOXEgJQyCeYDgYeiII7Z/orIAP?=
 =?us-ascii?Q?AAquicYyW2QPVt1Jel2MpOO/tdfqMNWDQl3/+ZvPRZ+o9EkPlT4B79w7k9x+?=
 =?us-ascii?Q?RpsRQn88vFhjI2H39bWA9RjiLhv+c+QpygtTyskvsxtw1rMMr9pFvbOWE9mj?=
 =?us-ascii?Q?F+MZjdKQRt6d1Um24ntkOpzB8sx/6gGWkACWqS0JSh0kEIHpxjXtfMv1/kFo?=
 =?us-ascii?Q?SjemfFqFjlMr1KYGpFDF/PTDXrzRNDyRTmjyNLOLLNfEKBvortnpvIiByr5U?=
 =?us-ascii?Q?rxLYIU0lDRjzDz5uNQl0myM7uHToq2FrP1Y+r6BKlpRvpgXl0+iGr1EAtFtV?=
 =?us-ascii?Q?CGfe4sEQDGj2Bb7RDchk0UF0D6j33g5PxUQOGVlQ6RUhLGlVSWmAnQ2xFTnr?=
 =?us-ascii?Q?9HGB05zV1kXiO+JIpJjxwdIuN0AMSJYzOS11kPJxI3MSt+GBawEiErfIKvEt?=
 =?us-ascii?Q?OieWmdW5Psy9TcQ/Msg7CzcxAUfeTUsRciSkrXuL97n/ADcfmIO7vMXmRa34?=
 =?us-ascii?Q?CFsUZxI9eSk2l2yFw2vijoke0olnbjMn0al4VKm/cSYQuC8kGYuUkx0ozbnu?=
 =?us-ascii?Q?EPSXfetBpRmQXIu4Q1xm7abyQVEMxMjA2EcEBZKnpFgpx1Y6Nwr+18oD6Dnz?=
 =?us-ascii?Q?lf4IYld84X9Hd1wC7u/EI50eR/vNDL9dPnAHArNpk8vVHUgC/OAdU6FjfDF0?=
 =?us-ascii?Q?GSFhjY4CrpilJL62k5+X/ud5HrSJUTofRmgXMQh7rqtin7pDnr+DCXj1uo6c?=
 =?us-ascii?Q?FjnmyilLWAsXlBTzU7AMJUe36cgTZ1oPeAB25VLeR5DfKjHBiO4oGL0+A6KR?=
 =?us-ascii?Q?EcHzFUO+yvEFL5tblp3iGqWWN26ycyNSjcZDc1EEznt05BAp6X+BRiUFzBoS?=
 =?us-ascii?Q?Uuw7OgcXre2snHqD7Hg0yroZ2t4jfzd9ZOA9fBvJrqWaMVBGFp2FinEBA++k?=
 =?us-ascii?Q?0Zek7qg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(52116011)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HYbBKIKgXdHIGUgUAnW7dlMmbdFj/jhOK60dL9om0FoQ7dk0j/Z5ZzNH6Lh6?=
 =?us-ascii?Q?j9yjoqtlGWYekSjgKI6UeBMGtGxTFLT1Q2P8v6x3x2fGRzWchpFSckpT82mr?=
 =?us-ascii?Q?KAyZ+szakcycHRd0UgQxWRFLPPPoqCapAceJSaOvWgn3mPxM9v3pBfuDahz5?=
 =?us-ascii?Q?/rt5PLhnm3af3TrIYTmaBBKdFlY/Xn/vCZLJr3J2vO146+BEX/NUM7wenwpO?=
 =?us-ascii?Q?K9OBaQIWDyRPMTFN5kzpyhdxVSTq3ETASifPmTrf9IcX/l6G0mqWgSscTO1+?=
 =?us-ascii?Q?45PFFn+IIEwWVljWxRzWOpc2rVKOrU3MpBpIZDsYyzyb6LhVJ66rv6MbjMQl?=
 =?us-ascii?Q?q0hDryZ0SsbXuecieHmCpFLjrIhmrR7vEL7kJHsel4HmA1k47v2tkRUzlZ92?=
 =?us-ascii?Q?NDoRVUFhaOIW+Oa1hZpF0oBDJSVokTOUnk8+bA7HbT3PoAoIT1+I1s9lM/aa?=
 =?us-ascii?Q?LuwSeZWgy/tv2KZCXqFfT1JVVUoaxamkwEaBrMZdwLDFPD9rPIDlhZAB78nf?=
 =?us-ascii?Q?6+rjV0BYJWSJh/rqSH6cpSdQhni+QxY9wfTNBpEM0mo5qTEy2Q79dC5K3uML?=
 =?us-ascii?Q?QgUtnumoutwSsofrRBzUFZXMe6p8iPafz9N8PYjTfkNdcjV+WlRRGLBcIdoW?=
 =?us-ascii?Q?UeFJPrGLBt0cy4W9fHPh3G6jdIExXHOYMMtuFb508NcsuPoRo9Xh+zuFLuiN?=
 =?us-ascii?Q?1Iwec+V2I/p8tk7niImVgwntl1aalWIo74ietSSfxFKYMlf/GIPzNFceGVww?=
 =?us-ascii?Q?nj5YwlyTITNOzreQCjKXyagp4zuZBYLowF0WZuiAPOLlXAnId5N1RAz6N2oE?=
 =?us-ascii?Q?+RSI0/14QeRbRCQNkQQVItjh90u9+t3Dr+dnpjkGKMiVzdzX62+zZGmLRYJA?=
 =?us-ascii?Q?DPSmKusAYPvhqbnrQv0/77Jt507+pe7Ta3w1XmkqpPFUIykzohrPiDaTcnQQ?=
 =?us-ascii?Q?CM0GHZpKLNErDGO+QqvmmznkaAJPa52AVf1iXtMe2AvOEev3A7By/myaCQCH?=
 =?us-ascii?Q?hOSA7AGNpnQdIZfnsVDZTGVCNaDHgwaHTtim7AvB1IW8rjntsgPXn4jHxPr8?=
 =?us-ascii?Q?QGuPaFhPkVPg93vux/U22LzIqx351Vbvcy2YpLivBv96e7d3nT0i2pLDAJ4F?=
 =?us-ascii?Q?R0mq2mt/o97AhJOK1dmziVhoEmoC2sVj1kYrKRKaJu7M2u2sHcGFotU2Sxjv?=
 =?us-ascii?Q?nXNm9Oh3aIoSL2h6QKSNCzSRzIZvZjlc32adYVlARubVg1dCDa4Jwtm5iTRG?=
 =?us-ascii?Q?MuZGmdtkrq8+b9bYzv5EMI3DR9I9R7HMLQvv5bCEPE0GZ5HrBHcfbC3oQViD?=
 =?us-ascii?Q?zbLY6PTBwF6wn06ECBnYah9ABr7RJguyzgiFNH2Asi0yyABu7Y4n/1A7dRs7?=
 =?us-ascii?Q?qswhOehF3ToixyfruPmBYMH3zCD9rNNx/wTJXjmgTiFG4VnE9Br/kqcWSOFS?=
 =?us-ascii?Q?yPAUSHKVsHY9n3aK+KiEbmdC3EmHzvv0vBjlLcPthoc9ePr3ajTio7cjNPd9?=
 =?us-ascii?Q?40UmPwt3/0SEPR3pQXPlhSUBKMElSrvRti+08KY76MCiUEyRNBYYQx+XyZVo?=
 =?us-ascii?Q?4HEppYPzoaCI4zMSEPoOELaj5ydMb6r1/R6Gc7B8heKZbj5x6j+qjT7Kexz/?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc342f70-ea38-4f69-6d6e-08dc8e92bbd3
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 06:00:04.8373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14nkhy7JeK/nD4Oi4u71ObbWrb6bYgz6Z/+hB5JIOByuAqmSVTQsyTG0ljBF65vGwyfzQCb9Y+4FOELZIerfs1vUPn6bE2h2DlOietEFbxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2063

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


