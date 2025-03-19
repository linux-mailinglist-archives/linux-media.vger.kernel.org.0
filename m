Return-Path: <linux-media+bounces-28447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646CA682DE
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 02:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 299A119C058F
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 01:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3466624E4AF;
	Wed, 19 Mar 2025 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="hDQDbGhP"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021078.outbound.protection.outlook.com [40.107.42.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F417A1581F9;
	Wed, 19 Mar 2025 01:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742348745; cv=fail; b=V/SRYAGjS80oPOEanxDheHd8eHMkDSU62zLxqHykJLrSHXVvjNxff5mc/HisfpqwNs9oGGk9vpwgaw2Wg+yo83XS5HMxh7ulA3RZ4LQPZWKGLbBUsr7Z+SSQtmbuubGgShSFiPGurmVvuv3lUKUGq8zb3vC5mhAwu9ITNBWYq8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742348745; c=relaxed/simple;
	bh=u6at0thV7255BNXbZezQd7/9s8Y+Cn5yUd1jbNP5+O0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZKEz7pP8bkGBfdOV4u6zA/n9rbZoNDB1FaOd1CYP9l9/13RsC5bnVoriE2MNmINJhMc/TDvc5OfyUQjEEFhqTeRLcCwO1jIe3Q0Kw8wV9gFpPL0yv/tBYFqUgvxn7hMfwvlcO8bYSkXZyVresmdL7KeSo9jb36/z2TR20In0G8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=hDQDbGhP; arc=fail smtp.client-ip=40.107.42.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yy///3lwccouUWttCQ4uK6Uz/iFqv9+Yo1QbklBMDQDjcQ+THue9I0JnyfQsxLPX1TRHh60VdXt4mck8LKccbR8+l6rjOWhMbka2556u+qRV9nD77ccZGrcRM4TVsmwVbPNH4s9zA7pDHCe5bHiyQACOSzwoU8Ii9W79/wUGv0GZ3ASeYKUxtPjIeA79GyEav1pkbIQRNnF76jhYd/fauuHUG3EcnfUmLdLuOf+/+eWTs9j3o6+oM9+AzmPgaeRbcwkpEqV9htH6u8+H2K45xc5Tg+oGDg24i4FsyMhMoIEQ+f01/fWJ3LcDl62qZ1o+MITeeqlEsVCpINPHDfcjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE+raeSK6DhbikAmvxAvKA7FiPaPEVn3UunaUZQAt/s=;
 b=R3H5yby4rYibl1MftRDttiuUS7wpmRDQMRo+ceK/pJDPpHE7wN0kdgft1zeQAgiojumQbiDc9KubJtJazfOqgEi/NGmBxyNCo35aDgjLvaTPbt7O/huIIW8ix0/K+crtQfksugOhW19D7n+mwcrMaF0uYvkPLmYw/bB9mduoVh7ee2BMJnChgp0NgKKA4RgFnOHdPCXY6MB5VC/BDWQRH8ujanAEPCp/D/kmo3qzeTxNOrr/BsjxdBHkXMeDmKL1nbz5IXfGataSJQ6goleqxnAqbFYUdRcXe44bXwX9xrwjENX70KMrszzTiX6RETWfSupWFQXkiLrEbWJMB5sd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE+raeSK6DhbikAmvxAvKA7FiPaPEVn3UunaUZQAt/s=;
 b=hDQDbGhPqr/5wbausSBH6/xOE2HVqCOQEcx33f/1jbfamT+nY4Ju0zT+QZgDXWMSp3JNQhJuCvRe1uB3oHO4HgyXfRAIH2TrWpkBRQg7ComiE1mZ2CydF2aYraLsogStlX4yTsZU+35+V/KP5REpOF7sAWb/CoIj0jBtGEPpbSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2121.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Wed, 19 Mar 2025 01:45:40 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 01:45:40 +0000
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
Subject: [PATCH v0 0/3] Performance improvement of decoder
Date: Wed, 19 Mar 2025 10:45:27 +0900
Message-Id: <20250319014530.61-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB2121:EE_
X-MS-Office365-Filtering-Correlation-Id: 3944f9a1-e487-4f5c-c9be-08dd6687c0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XhEO2uMF3yade0axkbTG+RPPyEYgxgsETumvnaAAEsarsvDrbRJJoYPbEpv/?=
 =?us-ascii?Q?+9BZXUXBKDO7sX/dVF+rkpG/1kWymDiWFwJLGh5rxzk1WRV2pz3limdOOmMP?=
 =?us-ascii?Q?iLbhc7pRbPhN7jrFYrR0Gq8V7gJiIUrjGFRtds0prSO5dhO4MvjwftY0rwri?=
 =?us-ascii?Q?gauwXCHJmlWtWF3AILJCgcRmNWeyd8JtLbA+W+Kc7wdCrEK7XRgTabDANmqw?=
 =?us-ascii?Q?Z1aNFihV4T19AemOOnxqNt3m9YWw5Vsrq0eMPXCBkxYYYKxujhrSy/v4OxES?=
 =?us-ascii?Q?Lf6DCtIW/YfqQEK0CwPSs2K/Z1o4/Nqh9eKodU5QiN7C4v0PcZArOWp3d3vK?=
 =?us-ascii?Q?1OzVJVT2M/GyLZJDNcZjp45H6WeUbSokuck3Kh124b8ppOqX0f29+7qQBOF1?=
 =?us-ascii?Q?Q4VOVIAZUbvOlyngZ/uGrU1cCADHaQb2GWQUFs13XKUym7Z5rOICetb59DnS?=
 =?us-ascii?Q?lewzdRVzPSo2TlsI5L+uxtTKg27eONFFYtpmjkljFucBqWOwlYdEZw57ZGG4?=
 =?us-ascii?Q?sINEu/2P0uZi+j3h8Xe+ArbRmzeJuHQ7sqCvBrHB1+OxRb20xkQHLIWGY+xp?=
 =?us-ascii?Q?I7bFz0P/cozZxn700fnTQu37o3OEI3YX/CarOgt4/8T2K9hJnG4t8Hsi9nX/?=
 =?us-ascii?Q?l8XTjWXDEgJo2vTiMizHI/TFRjymxAnJktV4q5bequ05E7jaFsZnu1NqwJDY?=
 =?us-ascii?Q?E9Fw9VO8yocG+EEcC/19UJ1a+xwUivBYAaIi32NOuFteos9pXarnGW6bm2cd?=
 =?us-ascii?Q?q7SH1Bg29vSPHXEb5I27RUVOQgZkV7hwxlR3eCdsPAUAsisvyO8faR7F8WiF?=
 =?us-ascii?Q?kMn2s2VGaYqN0SWkbmNJzGnpXhi7El3Jqr5YCZbLzZFh1ANGWNX2W1sjDuWw?=
 =?us-ascii?Q?e9djztIKpomOPXpMO9JZAWZ+gEKTAS5Wl25ADd/yVpRVWFG/iu9OUC/4APn+?=
 =?us-ascii?Q?p1622c0zb7VG4oD7xzoriOaY0iwOI/IgbiUN2XIr9uJCzX+ud/I4RsuMbKUJ?=
 =?us-ascii?Q?CXf8GuY9KQC8XZ3JAJH4SeNM0MQqBNIkp1Y8nJz1lPPnYsPgdSrfLtDm8YKm?=
 =?us-ascii?Q?xKShb5yLwuF6+M+YcC8AskpClWNFSLSSI3kyuMcDlH6k0Q81w37bSOKSx5JB?=
 =?us-ascii?Q?uVFln9HANO+RWv6KkgXu9y5TP32+6Y3jKegn2u95N+6kDhIHyY5Vo+4n6DSx?=
 =?us-ascii?Q?BIx6H6jQVEH9mUBjTfq4FV2M/W4Cfvh+oRV6dFHkLB7bdcBvDuJueXv8gpi0?=
 =?us-ascii?Q?hys3jiRyWa2X8dCG3dwg8O605XnibEdoqTIIE8qqe8Hs+u/m1KDS9Q5ui2eF?=
 =?us-ascii?Q?3BvQPV0ynAHX/ivx/7dLCvASJfYqlwyLgXlqAvxcI0QD7DWZQJbz8nm8FEhZ?=
 =?us-ascii?Q?YeeZUeQUE5xtGRqnOPxUWNEX1Vqs+M0HhISmZiAQjglGcx3WpYGK2ZDZel/a?=
 =?us-ascii?Q?NiFbnN4BHzG7VGrkPCPQ84+uUqFY/Fxg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CGNlTHFS/J9XMCzf5nuk6QgJag8nTJJK6Hxmr6yBVxktas0cHua9lBOHmbDZ?=
 =?us-ascii?Q?F/A6ORjw0g/hHh6Q2ewio4PgltSCfRCXifAZkorQFuAT80MSxYOnX/vM3pa5?=
 =?us-ascii?Q?U2kEzTvPEzryoLkfU+2fJHyHwY1zJq7n8Jy6/M4F+Tz2IBkvmBPyzrXLP5Mq?=
 =?us-ascii?Q?H+mqZivtUIrhhIbviClT/OgXY/B9/Ynxa/Xbq83ZNye5zqbQElzmK1WwVv38?=
 =?us-ascii?Q?gruiEoepJ9BfpOD22Q/YR5KRWKCxvqB1x5hdUOIhMUNAcMtrGVVArWhgSNLR?=
 =?us-ascii?Q?kWlhkbnaIpzfy+qmUyQ9XqiQ1c4o1V7xFmmS29CluLFS80Jxs3Om0/nXoTS4?=
 =?us-ascii?Q?rvhgK7hUFGqHZ9ztx2mZuo421TycPikJkhhiAUZaI2fSbEXm2BwEYuuCJKjp?=
 =?us-ascii?Q?AKFIpSR+DElHJV1oIPrTTFMoENwLdGwz/IbJ/fcAFM3GJukM2Y88IoT6+W5l?=
 =?us-ascii?Q?Xep6+wADinoHeZHZWixHeIaR1RpDogrpavzErBfvMe0GuPFNjptOJuCFIbPv?=
 =?us-ascii?Q?uO9gmqeU7VKFnSBvlUo0vDSPGO6Hen5uSaDkOo4AE7jeOLNu6yR77LdS0WJ3?=
 =?us-ascii?Q?ZegBAzaA66hLud16SH54VIkxdkGRabL09ON96WzbBgQSOeB9nyHfHRSUZ4Q7?=
 =?us-ascii?Q?LnARqx2JyzAvF/IGxuTQ5zu0u7TEcydIUhJX57mcucA7gJxICyvKbq+ls2Jt?=
 =?us-ascii?Q?xUwmpml0VGwd5GbUs743okljAHzlg9NuHPQDhZiYN1ptjbTfNe9g9BEUWwb1?=
 =?us-ascii?Q?wnJ20WOyFqxlDPDn/i3QbtYc8+ny5amUTdGwpEX2TR9LEO8hdjE/p7PLBT95?=
 =?us-ascii?Q?aBVU6AcK48CtOosMjRPwGnLyrq0RoKfFPZN3hvOrethXQt9X99E3ieOElTtf?=
 =?us-ascii?Q?rQF+ZpHGlm4P4Z5wkKmo0qSrJh999ImbgT5sKBkFmANB7bj5K7Rej/hHaWUa?=
 =?us-ascii?Q?UJ+eS3Mz3wi4Q7sPJgPrRmfWbgBNoLOGZpkwt635sb1NAzTzMilcOZUtCT57?=
 =?us-ascii?Q?xkW7S3Hs/jaX2S/5bdXsUlUEHVIiAvVesTw9+qA4ZRRcHWqcTKynsiCfVgvq?=
 =?us-ascii?Q?Gyndi7C1MdITstdzZoezVs8ooR5snwxpjxJ6SXqyIG5SXqJ1RWZKHQLYKh6m?=
 =?us-ascii?Q?CuKpobB6PSnTSFduyEE9gA0GCUWb2ksOPFbPyUU+tRDeEKF3FiJSTGJHLN+p?=
 =?us-ascii?Q?yL4nJU87/umfWlbFI74YnuiaCJdIKUNG/AiF3C7ZDgAblKAB+PYMLKA9byuX?=
 =?us-ascii?Q?Ps8W1nqLum8sBjZJsHrdsuFK62cKXrU5F74Ot8GBCR5uEbTU61GCgLI2NIv9?=
 =?us-ascii?Q?VpaZGuyEn2HhAKb7owDfi8NlFZa+2dvw2qfkdBmhY2YQRTVneZFlyMji+3nX?=
 =?us-ascii?Q?BHNLuN7cznlDlS9dK31wg65aZCEp9ANULwArBST5BqjdjgEPaFqEHSN9uW6Q?=
 =?us-ascii?Q?pJbtrOyWdtoLhVrXgK7Of3Fpq5RMiSp+6Bt3jWYSWNScAFHqHDcWUtTNq07Q?=
 =?us-ascii?Q?9CRCpICkBdYvhBPo73zyMhfFTqYen54FUty0zAQcOr7F/dpprVg27SJ8C6R7?=
 =?us-ascii?Q?anD8Q6Kbi/4NaoKXu20FBMVkbbAbWGp0tf14B8P2SFs9BMtNyT4fBiE+evoU?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3944f9a1-e487-4f5c-c9be-08dd6687c0e8
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 01:45:40.1093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DD4ppOvpKEbpm4MrphlyMsfoYiEGhmh/pCU9DBKh6udWxIa7cwsFTGWKczvhyBQJZdTiaOM0H6Jqo5PglRGtjqT7YsByqhJkY5/J4ay9Chw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2121

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The wave5 codec driver is a stateful encoder/decoder.
The following patches is for improving decoder performance. 

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

Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 133/147 tests successfully               in 68.517 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 78/135 tests successfully               in 35.015 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)


Jackson Lee (3):
  media: chips-media: wave5: Improve performance of decoder
  media: chips-media: wave5: Reduce high CPU load
  media: chips-media: wave5: Fix Null reference while testing fluster

 .../platform/chips-media/wave5/wave5-helper.c |  10 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 361 ++++++++++--------
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  69 +++-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  25 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |  12 +-
 6 files changed, 307 insertions(+), 178 deletions(-)

-- 
2.43.0


