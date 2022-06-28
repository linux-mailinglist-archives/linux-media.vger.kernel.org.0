Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08B1555C7B3
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345369AbiF1LIe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 07:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345390AbiF1LId (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 07:08:33 -0400
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-sl2kor01on2134.outbound.protection.outlook.com [40.107.129.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7C427FE1
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 04:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNIYAuYr40dpLUPw9BnIol0vqjJ1Ig44CQGFxv2o+CHD5p5upeUWSQDP9XgReW33YxQ/Y8gU+oTE4ln5+EZ+uxPcBOCWbVFuxfyVGnFQ6fK9EPhqHKk5n0LV535I+ji2yJeWbyvFX5bWs/6T/MC21vGYRwKsVAcq2HunjHTRzZ67FbFCmp25kMo9mcPX3le44GUh9u5LcYW+A7H/pACK8P52jlpIX7/PLc1XWJRM4mqH5rwxd4r/2E2xtteO+NE4EjGNnIdkhFF4JayT9IZvuUK3QFP1R6OVdujJxBjEqmxkN4UWkA1ITpn2w4i5OD9sOkHP+JMswlFpetC5Hle4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jR5WBpe0JoiDNzOysuj4Kc/5JuXgo2zh2+CZYsiSEZE=;
 b=gYYlObGp4aB6G23beLDHzr4l4WCvO9FBzM0Nue/N1Iz4xVExVhfIueBnO1OSiAAyY0RYXjztPTwIP0x+n9oeJ8A58EScfP3/m+fclwUlTb2lYT9rXfVQ9rEapXh7RR6FOhOeEbtvtfefiIaNCl0kJY/2eup9oK0DqgCSzNQf+4n2Bm90LF32LJUkqfnGZEe4utcSkm0n3PZNQFn0BLoWmZRAK1JHP0xfJD8VPmjhXL1UE6XSeLN/QzpTYGzc0J9R5n8rPTRu0NVyjlSijFNr5tXIBtya8zAiFuIjn2ZHEchb4qk8VR2Y6rsWihS4RmgiAywg/HMZJS54O03bGctwAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jR5WBpe0JoiDNzOysuj4Kc/5JuXgo2zh2+CZYsiSEZE=;
 b=jSM80sKEEEpu+XCCaKMDUJgOA3wR1v4tw/WyGccg4ZXO+Ba1VsO/8ADFnXJvGOP9w4Feuchr3HAai2LKTC3yM1yKtwbs6dK6DHTUafiv1w6A31Zwn+WT/L63wVKYeDNYIFuJCSqDnBCWVvdddTYh6BXmeQNZ0Ic3KREUZUYiUQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PSXP216MB0680.KORP216.PROD.OUTLOOK.COM (2603:1096:300:15::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15; Tue, 28 Jun 2022 11:08:29 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::60c1:b54d:bd3f:3617]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::60c1:b54d:bd3f:3617%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 11:08:29 +0000
From:   Nas Chung <nas.chung@chipsnmedia.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-staging@lists.linux.dev,
        mchehab@kernel.org, Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v9 0/6] staging: media: wave5: add wave5 codec driver
Date:   Tue, 28 Jun 2022 20:08:15 +0900
Message-Id: <20220628110821.716-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0222.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::7) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39fc14cc-5095-4ab7-2e3d-08da58f687c5
X-MS-TrafficTypeDiagnostic: PSXP216MB0680:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VJZ0nab095o1fhOsig7VE68xa24/bR9IIFm64eaYG1KV9sis2C4PK73nLNLKuqYi60UBzRqpKDaZagbqKnQxnyiWe8+Z4MHdy9/hAbAS+hVqJsGBpHwYWy9evQRRCeboF1AJcVfsSnUIcndMT6EiZggUyH8ZinwHz8Wyb+6LU7NKsGSqy69S69Uc9XfHwTEbNpPb772Vf3i9XUmoHHmLq2j1GSp0t/QwDBQ3LGfzZKcvFz3vesSXh6FZIoeNT2CXB7U6o+MJMWMMOAE9PDYugt8T63NPegtGL0ddvm3X6tGdJhY6AvXYcTC5XVX2hotmBaiBn78RsAaQ1Z5kPvOgLtBaanOQPJgMkpHBONueCAw6YKsYVz8INf6sxnL1Du920O/09Sdwt6bgJ34R15WipLTZLdDV4EqBoMPKavis0fE073oUsfxjKR0zX8nXNlkFAPkJoL4Ih7Dr68kdbu5UTzhdNSF4Ky8br/o2+AY/Mk4HN7QDH5J+ftU+v38VD1mBWN/vfnLzWkEnTsWaR9tP1HF05k8buTW8tamJELyHJPEvgL+b9nGQMV6or5WAc72PFn4dZd0VMYbozwfewgdQ7jKB3henFEwoeA6qR4RjGwXkmf+KivxpA9LT6I4bx+1tQ7zRs4NUr4aK+l842CO1cWLyTMamCOjA9b+micE7zxTtQ/16HRIR6FNV3rNV/+ofeBv4w8TAEPKBgIe0wNwUQe4JgTtGrw2BmAkLYjMBp49i8q8PvdCsgDIHdd2AJTW8/rsDJ4Drlh8NmbsFIkSVMCs42FzZB7zoW+RqmO2KDkM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(396003)(39850400004)(366004)(376002)(346002)(136003)(316002)(36756003)(2616005)(186003)(38350700002)(1076003)(6916009)(6512007)(44832011)(66946007)(4326008)(8936002)(5660300002)(2906002)(41300700001)(26005)(66556008)(107886003)(6486002)(6506007)(66476007)(38100700002)(86362001)(478600001)(52116002)(6666004)(8676002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dvvSse7+u9BB51pcZktr76oN97PkRzDbHe4PwOdipJ/1QCUAa0FUGHT2SXst?=
 =?us-ascii?Q?rFZAm35AKFXjN2IiumFKktpxj9uQwY9veyAB2mYZJmtiiH3l4Olsrk1r8d01?=
 =?us-ascii?Q?vaU0QX5ggTGl16Hu6dBeQBAgNksB2X4rtSbX/lSACn9VtT8bvOad5Evxp/Ks?=
 =?us-ascii?Q?U0vkfkcni9TCRlsiFYUh7ZPe7Gf5G2EA6BAeHMB4jGWtHB5qmQ+JO6N72ADP?=
 =?us-ascii?Q?lb4a90BZQXKnQc3SC0JeBj9FNb8WHyHjwark/nUGbhfWrlmhXBsuMTBrWufR?=
 =?us-ascii?Q?TGAzPUL4ZJgDRRLQDbjgoB6c9JLT+DQciEtGcl4PDjR4YWCPl+L0drga8UCN?=
 =?us-ascii?Q?AMDND1Br8LX3wHTdhQeYFg4WavCeYmDj+ErOzY4GTR9XLghSAcMGzjUvO3fx?=
 =?us-ascii?Q?f4Ple/jSPyQZ9X22OE523bh/rGACxCkKt5bmi/hFwcfzU0DIJHOCDdBgMaMV?=
 =?us-ascii?Q?jtUmPGLFANUlaj0y3JWfEEnULilEY1mpgqlPpfIyQVXZUOj2CPiClAz09d8L?=
 =?us-ascii?Q?fdPsL6U4SNYBes+Bd6Sy+KFZuZ81K6i3wDa7pXJivrS20cMXI9qTNoKxwmS1?=
 =?us-ascii?Q?q6XpdPXX6d3B74BukvHdMovajhKrhZ5OiltBogEzstjid2z+HafhllFd1E4R?=
 =?us-ascii?Q?NBwY2NlR7i5QJKGmvmht8GBLhF9Pdtk/VOi1Ls7Z05jFOenT5vwjQ09fdUG3?=
 =?us-ascii?Q?2TK3fGwqkX2Rs23dxLH9SAFgCFeaWOdxlBFkawqDwJuYMPOUh5hoRRzRjDK+?=
 =?us-ascii?Q?tloVD9VLiTlIvaDAyZO0Yk6tNEEF9E3kSlEoMU1Abt8PkQVZuzDV/JEbP56u?=
 =?us-ascii?Q?msdyVdMbFn6mrwokQDkTsz4eSIBdITo+xoRWsryL2fvuhrC0Xtr7zpksGXf6?=
 =?us-ascii?Q?yrQUTtPsQrPNKOQxVEu1yAvoupg0SXj1lrPpDSDYIR1A8CwSL8xUJ+MJbPgK?=
 =?us-ascii?Q?iOfvOkuG3viyUuafG5jTErnIdF+qmHQ8l+iZP/wXNn8pcxoRYCmllJyc1lew?=
 =?us-ascii?Q?LEjLgNC8qtLRzWPBRyIgEA2GIC58uzMntG5nijHDAUzJprWdH+35r968QJ3a?=
 =?us-ascii?Q?wbpiHEinAVMxaeRjT1In8iF/F2dcri2WX/bjU9XGjayafwMCCtQx+on6K9KS?=
 =?us-ascii?Q?6hHO0LlbaTRK39htVrJ+lvcwM+s3aH2P1eFtK/Q8EyKwupiJHQ+fLe3qs1Q9?=
 =?us-ascii?Q?UL507FA71hhKSvveRvjG9xAFxNKJNxcOmB2rPQ8jqrPxMTnHTxBBZQYN5YK2?=
 =?us-ascii?Q?x2766Culebztz5JajoaPqErwW/3ZS3NULnfTaUGYmzrEV9OspC2LIE0DhZow?=
 =?us-ascii?Q?VKvfuRhzLxhvMG++wUaDP7K3PmYyRtGZDeKg1m52Ps8ley0YJl8AwLHNsPSm?=
 =?us-ascii?Q?fsTQZ6Z2XwkfwlcikDh3WaAE2WMhuo/eSnQgLHcLLDcxqaMWDkmn5VcuYVet?=
 =?us-ascii?Q?/rvuzlrpM74fk80GaEwPYPBBG3EIm9kKrPJzpYSBNON1KNDKmYzcFo3ljb0E?=
 =?us-ascii?Q?Yf+Yu0uR2rIG7HQLwoPQPFYVm/rvpJXlDIiocoTd/8xjxwj0PiTs1R2th3JP?=
 =?us-ascii?Q?1DYr9MnFsgUq5+sakYdiIXHd/DT4v5N1/PDGPr4JT8X51QI4q4oqy0WKiKol?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fc14cc-5095-4ab7-2e3d-08da58f687c5
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 11:08:29.0798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ew5V2EkWVHqwzQqIcuHN2tYJlyjeXCN8hqdm/afkVXfTL6HBN5ViYlNEWRHEXt12hrFkuPRp62HdlQne4SG4KspWf9kjxFrsx+GoZFb3dCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0680
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Wave5 codec driver is a stateful encoder/decoder.
It is found on the J721S2 SoC, JH7100 SoC, ssd202d SoC. Etc.
But current test report is based on J721S2 SoC and pre-silicon FPGA.

The driver currently supports V4L2_PIX_FMT_HEVC, V4L2_PIX_FMT_H264.

This driver has so far been tested on J721S2 EVM board and pre-silicon
FPGA.

Testing on J721S2 EVM board shows it working fine both decoder and
encoder.
The driver is successfully working with gstreamer v4l2 good-plugin
without any modification.

Testing on FPGA also shows it working fine, though the FPGA uses polled
interrupts and copied buffers between the host and it's on board RAM.

# v4l2-compliance -d0
v4l2-compliance 1.23.0-4923, 64 bits, 64-bit time_t
v4l2-compliance SHA: 163144712a46 2022-04-25 05:31:44

Compliance test for wave5-dec device /dev/video0:

Driver Info:
	Driver name      : wave5-dec
	Card type        : wave5-dec
	Bus info         : platform:wave5-dec
	Driver version   : 5.18.0
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
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 1

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for wave5-dec device /dev/video0: 45, Succeeded: 45, Failed: 0,
Warnings: 0

# v4l2-compliance -d1
v4l2-compliance 1.23.0-4923, 64 bits, 64-bit time_t
v4l2-compliance SHA: 163144712a46 2022-04-25 05:31:44

Compliance test for wave5-enc device /dev/video1:

Driver Info:
	Driver name      : wave5-enc
	Card type        : wave5-enc
	Bus info         : platform:wave5-enc
	Driver version   : 5.18.0
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
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 15 Private Controls: 0

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
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for wave5-enc device /dev/video1: 45, Succeeded: 45, Failed: 0,
Warnings: 0

changes since v8:

* add 'wave5' to DEV_NAME
* update to support Multi-stream
* update to support loop test/dynamic resolution change
* remove unnecessary memset, g_volatile, old version option

changes since v7:

* update v4l2-compliance test report
* fix build error on linux-kernel 5.18.0-rc4

changes since v6:

* update TODO file
* get sram info from device tree

changes since v5:

* support NV12/NV21 pixelformat for encoder and decoder
* handle adnormal exit and EOS

changes since v4:

* refactor functions in wave5-hw and fix bug reported by Daniel Palmer
* rename functions and variables to better names
* change variable types such as replacing s32 with u32 and int with bool
* as appropriate

changes since v3:

* Fixing all issues commented by Dan Carpenter
* Change file names to have wave5- prefix
* In wave5_vpu_probe, enable the clocks before reading registers, as
* commented from Daniel Palmer
* Add more to the TODO list,

changes since v2:

Main fixes includes:
* change the yaml and dirver code to support up to 4 clks (instead of
* one)
* fix Kconfig format
* remove unneeded cast,
* change var types
* change var names, func names
* checkpatch fixes

changes since v1:

Fix chanes due to comments from Ezequiel and Dan Carpenter. Main fixes
inclueds:
* move all files to one dir 'wave5'
* replace private error codes with standard error codes
* fix extra spaces
* various checkpatch fixes
* replace private 'DPRINTK' macro with standard 'dev_err/dbg ..'
* fix error handling
* add more possible fixes to the TODO file

Dafna Hirschfeld (1):
  staging: media: wave5: Add the vdi layer

Nas Chung (3):
  staging: media: wave5: Add vpuapi layer
  staging: media: wave5: Add the v4l2 layer
  staging: media: wave5: Add TODO file

Robert Beckett (2):
  dt-bindings: media: staging: wave5: add yaml devicetree bindings
  media: wave5: Add wave5 driver to maintainers file

 .../bindings/staging/media/cnm,wave.yaml      |   73 +
 MAINTAINERS                                   |    9 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/wave5/Kconfig           |   12 +
 drivers/staging/media/wave5/Makefile          |   10 +
 drivers/staging/media/wave5/TODO              |   36 +
 drivers/staging/media/wave5/wave5-hw.c        | 3442 +++++++++++++++++
 drivers/staging/media/wave5/wave5-regdefine.h |  655 ++++
 drivers/staging/media/wave5/wave5-vdi.c       |  260 ++
 drivers/staging/media/wave5/wave5-vdi.h       |   81 +
 drivers/staging/media/wave5/wave5-vpu-dec.c   | 1445 +++++++
 drivers/staging/media/wave5/wave5-vpu-enc.c   | 1565 ++++++++
 drivers/staging/media/wave5/wave5-vpu.c       |  369 ++
 drivers/staging/media/wave5/wave5-vpu.h       |   73 +
 drivers/staging/media/wave5/wave5-vpuapi.c    | 1101 ++++++
 drivers/staging/media/wave5/wave5-vpuapi.h    | 1150 ++++++
 drivers/staging/media/wave5/wave5-vpuconfig.h |   91 +
 drivers/staging/media/wave5/wave5-vpuerror.h  |  455 +++
 drivers/staging/media/wave5/wave5.h           |   86 +
 20 files changed, 10916 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
 create mode 100644 drivers/staging/media/wave5/Kconfig
 create mode 100644 drivers/staging/media/wave5/Makefile
 create mode 100644 drivers/staging/media/wave5/TODO
 create mode 100644 drivers/staging/media/wave5/wave5-hw.c
 create mode 100644 drivers/staging/media/wave5/wave5-regdefine.h
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.c
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpu-dec.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu-enc.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpuapi.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpuapi.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpuconfig.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpuerror.h
 create mode 100644 drivers/staging/media/wave5/wave5.h

-- 
2.30.2

