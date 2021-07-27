Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032CB3D6C79
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 05:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234745AbhG0ClC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 22:41:02 -0400
Received: from mail-eopbgr50077.outbound.protection.outlook.com ([40.107.5.77]:23255
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234513AbhG0ClB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 22:41:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtOYwCREw1EbOAX6PBpBjZOuwPK/inNXTMzrH7ZDyRzkhwGsTNCCylLnnm7rwKrZgG7J2G+TPAFN2ApbHrhEVFc27GJEkGfiwk3am7KFMVTSyhs3WxtRQ2TI6yIzPTfVz0MW6SVXK/IL1lE4lpzw7TYRzBChOIVxe/432hjJC2wU9etDdp+JqgAYZ6otCGOP2zJxJsV+CX8cgIJ20oyuqpJW9zSQJy29vWwh9f6KdRHiPrTHcWBVzAh+nl4Jrzpj66WEGiWb6nqpeAHoq9W1W2pR/kMbNqtViUp6R0BEr9x/ui1HPjW2mESOcZuafDh7ePCTKuloXkg+Q3UgqMZqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=391NWB7k3p1kLC5FT+KmcUmvcdoIQ9aSd5Ar5zIR1eE=;
 b=jfXsB6ppo/IPMGz6+iFUHK1bxudIFIeKLW8JoljcGuRdIYQiT001trXdOrUE9/CMwB9XGNc6rPeD1pqzAEMAuvDM8JdX73x0z7AMsIC1ZtIsFgVmYig/5JRj39kC+NQ2FomIt3PkMB6OUZZ/gRF/p5y0lsr13n85KU3l68ATM98cZsj0gOE3+cEntdaywITlnsYLagnAZzzjii/nsKKFCYF+YRDvNpZ0OwugFryR7KoqgtL/GXvb4tq4A5AdTK5VAfIvWsIu1fJlsO7+jY73uuhAdunGMuhlsHUC9b1R6EwRZt/la653D6SBewYTfF01L2TTSH+sRaCmJy++yql/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=391NWB7k3p1kLC5FT+KmcUmvcdoIQ9aSd5Ar5zIR1eE=;
 b=QIZV9MGbBJ8DfC+DgRoPcnjtO5a4sWY92++njdaO/BqHypn+jDGqt3DLsJs55dliR1lRPED0SgYJTffqjm+tm/7Dx7v2PBz3KmvZCZY2pbbERosExgCtSnbUZZbx4ptcG803nc12IraFeYxXbRCKKfAFdwHcOG8g4kEz7kBGod0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2660.eurprd04.prod.outlook.com (2603:10a6:203:3a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 03:21:26 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 03:21:26 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 00/14] imx8q video decoder/encoder driver
Date:   Tue, 27 Jul 2021 11:20:43 +0800
Message-Id: <cover.1627353315.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 03:21:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 407598d0-4403-43ab-3d65-08d950ad9e06
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2660B533CE9317A5229A2F34E7E99@AM5PR0401MB2660.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJ+TIROHbeATMNVRnvnMdOtp00j81NDRv6mCO4Nf8cRvO0zl5c56TMYK4YQuTRRuM7j6jljRt7ZEFyfitBGtzlAlHJvLC4tZa4aNO6hsdwjV+nKUGOhwJWR5QywiUZzq3Jf9Eu9fxf4agiBZeM/dJ9jkzCiK/fF8wMEt9Lz5UtIg2A8qyRI7ic1bBDyKsrRPzGtFQd389tZ8kibrUQK7AV4bmfRqZRe765VLWUaXQVV4BNIb+InvrO57r37QRAunEeXUTSY0eN37GHlBuySJ+CEaLTKaVlnF1ZNk0lqbGG2quIJkaiuLLoprz4MhdWswOiIw4ZGcmD4IEWGYM8a2Fyb6dSP8EK8lHhh3IUH1C7CvhabUDxVrJ6qQ6jejGUL1U4ohq4KGDG52ssMJFLZQNvEZifxYcAt7sAeo2oqDEAGxg279z79xQCsyV6anVJoIhz7ctB7JxV9M7VRoQtQpEdi6unZZopj4qfJ6Iu0mG/zc41DAwg1Dchxfhp0ZmhcGa7h1fzM//p6HbhQlZEE+3S9DP8w6z8L+jTSva6c5wPQMWx8GJxRyrVXrRXdlA2t3iDIuXhHQ2LgkvXV2TKUm/DWUt/JNmbzJu7tLrf1StCJPRGeydOY0rwUJ33cG+pomHqkZSj7+30og07lVmC3c0x71MJehckkr+s9bARfk0Mro4zHaJfg1RyVkxcEVjtDonoSBfYqps+7i5Zq7NFHKW5trP3x65F9NYM1Ui32Bgcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(38100700002)(4326008)(7416002)(66556008)(38350700002)(6486002)(8676002)(956004)(186003)(30864003)(2616005)(66476007)(52116002)(478600001)(7696005)(8936002)(44832011)(86362001)(5660300002)(316002)(6666004)(36756003)(2906002)(66946007)(26005)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ee5BbG6eSf8GNQJYDomR6p+2vXxDpvVKUXLZxrasw5tn5jCtPlLaf2mg0lLo?=
 =?us-ascii?Q?3YFBVv8gaq3OSzNVxBOl3TGovoRSH4z8BvaHvOs+Jmudv0jI9TsR5Xv9JL4e?=
 =?us-ascii?Q?Byxq/7+caIrogeMWeXX6K/2F1Sg6OI83oV6Aw1J0L4omCTYDS3GNQWZYlUW6?=
 =?us-ascii?Q?UADs8RDwyz2777GbEzpM7KeN7au4D6wm1uq4Of0MveQT+1XF4aNDwAl6psxS?=
 =?us-ascii?Q?hYVXIJdV+mu5OUGU6Q9tyNUfK8bgCWPWSGyjQx7YpFsyS8Ib8pDyB3TtDW/K?=
 =?us-ascii?Q?X8c5R40G3FyZu3anX9JwvVCFA8X43BiyBMp8gv5khOYDynmehf8phA1Uu1tm?=
 =?us-ascii?Q?COsXkbkKxzdp0QFTYvsmkL+7tB4sUIy7pfEI2eGKGAX+TVhhArDnc1X861PG?=
 =?us-ascii?Q?WnGWIwfc9ZuxME6i5EERskaejVC6bYDqyr7+TqW8HpOPcqGdy3P/rgD09rDR?=
 =?us-ascii?Q?glOJGVhJ9FIFAKrqbOIax7+uWpCwZLnnYK0ye/SR45ZTMIuzbi5T+PA54YqV?=
 =?us-ascii?Q?J4ABpEWKU84edkEAEGVYcSHhWdTf+8fXn157imQXZDUYfOYvZxgC+eDPkU2j?=
 =?us-ascii?Q?pXsM2iDoYkZKwVm50//Y8ogQ4fUxn246P9eQbfapWacgW7v75o3FLsJdDc6J?=
 =?us-ascii?Q?d3V1L/jOTYe2CXgsmE8SR3sXx9FH9Q26d9i/aLAJYT376Z5LmKcUo4e39fk0?=
 =?us-ascii?Q?hQvwKGFDWm5hxQwXmwbH0ItW3zviN1zm3Ed38wrsu7VERC8K2NqjrHUW5gkV?=
 =?us-ascii?Q?ZiaVi2Ce4/OVVbCeUFFtqNKxh2a+xBHaKIdwfct9BAiSKFz4HYVe5AaeHC7k?=
 =?us-ascii?Q?s+ZVg+Z2Vw2EVIue/e+qCV5Lj75kqjD+7PcxyWd9vz9Nr72vtFHnT0+quWFF?=
 =?us-ascii?Q?l4Z491g6ucaOm0M/Ywt4ti4oZlGSHHJRcnYk+WQ/3CI67kEmDqz3f6kj5S7j?=
 =?us-ascii?Q?mxuET2v75yTqTg/H9YZaUwNVv+CJ7cMvdb4i6lpI3waqOJ4s7kXXqj6gryXC?=
 =?us-ascii?Q?Vfqb7ScgoJ5NIS82sZtoW9g0QNLQLwsCTVJ/Wrd6ezJ6/fruhPqFR0LBg2M8?=
 =?us-ascii?Q?Qsich9dTPvS7ummmr5mi2OFK1zi/Y8roHq8GbfkTvbMKqMoq+PvN2673VORz?=
 =?us-ascii?Q?ikaXAoftr4m+gwGptlu1aYOYJrZ27muSeqrbk+gFNbSklKfkx60NQl0AFTL5?=
 =?us-ascii?Q?1S5w8kSQw4FrGX4dOL8bLmf+iz9UVBGyZ8w6XDqLVuxArN02rfQxNjYkrvVO?=
 =?us-ascii?Q?6KrrVo2uJmUHMFEdXvz6H5TSXVov9trMTc/ujJBVaVdQUshodkw5EzoJhWIK?=
 =?us-ascii?Q?DFer92aYs3PcXPX0sayNYte5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 407598d0-4403-43ab-3d65-08d950ad9e06
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 03:21:26.2957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ghlVjiV+ly03Xigutvt0aOhPgFcgdqSfIGBl40CCBHnndm5r2K/oBAqYQjXGd2lwIBmR+DJ7RhCJzvx5kSMww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2660
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This patch series adds support for
the imx8q video encoder and decoder
via the VPU block present in imx8q platforms.
Currently, support for IMX8QXP and IMX8QM is included.

It features decoding for the following formats:
- H.264
- HEVC
- MPEG4
- MPEG2
- VC1
- VP8

It features encoding for the following formats:
- H.264

The driver creates a separate device node for
the encoder and decoder.

Changelog:

v5:
- move some definition from imx_vph.h to videodev2.h
- remove some unnecessary content
- add some documentation descriptions
- pass the lateset v4l2-compliance test

v4:
- redefine the memory-region in devicetree bindings documentation
- use v4l2's mechanism to implement synchronize queuing ioctl
- remove the unnecessary mutex ioctl_sync
- don't notify source change event if the parameters are same as previously established
- add flag V4L2_FMT_FLAG_DYN_RESOLUTION to decoder's capture format

v3:
- don't make vpu device node a simple-bus
- trigger probing vpu core in the driver
- remove unnecessary vpu core index property

v2:
- fix dt bindings build error
- split driver patch into several parts to avoid exceeding bytes limit

Compliance
==========
# v4l2-compliance -d /dev/video0
v4l2-compliance 1.21.0-4831, 64 bits, 64-bit time_t
v4l2-compliance SHA: a4f2e3a6f306 2021-07-13 08:04:15

Compliance test for vpu B0 device /dev/video0:

Driver Info:
	Driver name      : vpu B0
	Card type        : imx vpu decoder
	Bus info         : platform: imx8q-vpu
	Driver version   : 5.10.46
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
	Standard Controls: 3 Private Controls: 2

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

Total for vpu B0 device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0

# v4l2-compliance -d /dev/video1
v4l2-compliance 1.21.0-4831, 64 bits, 64-bit time_t
v4l2-compliance SHA: a4f2e3a6f306 2021-07-13 08:04:15

Compliance test for imx vpu encoder device /dev/video1:

Driver Info:
	Driver name      : imx vpu encoder
	Card type        : imx vpu encoder
	Bus info         : platform: imx8q-vpu
	Driver version   : 5.10.46
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
	Standard Controls: 20 Private Controls: 0

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

Total for imx vpu encoder device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0

Ming Qian (14):
  dt-bindings: media: imx8q: add imx video codec bindings
  media:Add nt8 and nt10 video format.
  media:Add v4l2 buf flag codec data.
  media: imx: imx8q: add imx8q vpu device driver
  media: imx: imx8q: add vpu core driver
  media: imx: imx8q: implement vpu core communication based on mailbox
  media: imx: imx8q: add vpu v4l2 m2m support
  media: imx: imx8q: add v4l2 m2m vpu encoder stateful driver
  media: imx: imx8q: add v4l2 m2m vpu decoder stateful driver
  media: imx: imx8q: implement windsor encoder rpc interface
  media: imx: imx8q: implement malone decoder rpc interface
  ARM64: dts: freescale: imx8q: add imx vpu codec entries
  firmware: imx: scu-pd: imx8q: add vpu mu resources
  MAINTAINERS: add NXP IMX8Q VPU CODEC V4L2 driver entry

 .../bindings/media/nxp,imx8q-vpu.yaml         |  178 ++
 .../userspace-api/media/v4l/buffer.rst        |    8 +
 .../media/v4l/pixfmt-reserved.rst             |   15 +
 .../media/v4l/vidioc-dqevent.rst              |   12 +
 MAINTAINERS                                   |   10 +
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   26 +
 drivers/firmware/imx/scu-pd.c                 |    4 +
 drivers/media/platform/Kconfig                |    2 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/imx/Kconfig            |   19 +
 drivers/media/platform/imx/Makefile           |    1 +
 drivers/media/platform/imx/vpu-8q/Makefile    |   23 +
 drivers/media/platform/imx/vpu-8q/vdec.c      | 1687 ++++++++++++++++
 drivers/media/platform/imx/vpu-8q/venc.c      | 1383 ++++++++++++++
 drivers/media/platform/imx/vpu-8q/vpu.h       |  333 ++++
 drivers/media/platform/imx/vpu-8q/vpu_cmds.c  |  438 +++++
 drivers/media/platform/imx/vpu-8q/vpu_cmds.h  |   25 +
 drivers/media/platform/imx/vpu-8q/vpu_codec.h |   68 +
 drivers/media/platform/imx/vpu-8q/vpu_color.c |  192 ++
 drivers/media/platform/imx/vpu-8q/vpu_core.c  |  910 +++++++++
 drivers/media/platform/imx/vpu-8q/vpu_core.h  |   16 +
 drivers/media/platform/imx/vpu-8q/vpu_dbg.c   |  496 +++++
 drivers/media/platform/imx/vpu-8q/vpu_defs.h  |  185 ++
 .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |   73 +
 drivers/media/platform/imx/vpu-8q/vpu_drv.c   |  217 +++
 .../media/platform/imx/vpu-8q/vpu_helpers.c   |  396 ++++
 .../media/platform/imx/vpu-8q/vpu_helpers.h   |   71 +
 drivers/media/platform/imx/vpu-8q/vpu_imx8q.c |  218 +++
 drivers/media/platform/imx/vpu-8q/vpu_imx8q.h |  116 ++
 drivers/media/platform/imx/vpu-8q/vpu_log.h   |   44 +
 .../media/platform/imx/vpu-8q/vpu_malone.c    | 1696 +++++++++++++++++
 .../media/platform/imx/vpu-8q/vpu_malone.h    |   42 +
 drivers/media/platform/imx/vpu-8q/vpu_mbox.c  |  126 ++
 drivers/media/platform/imx/vpu-8q/vpu_mbox.h  |   16 +
 drivers/media/platform/imx/vpu-8q/vpu_msgs.c  |  411 ++++
 drivers/media/platform/imx/vpu-8q/vpu_msgs.h  |   14 +
 drivers/media/platform/imx/vpu-8q/vpu_rpc.c   |  257 +++
 drivers/media/platform/imx/vpu-8q/vpu_rpc.h   |  463 +++++
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.c  |  653 +++++++
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.h  |   44 +
 .../media/platform/imx/vpu-8q/vpu_windsor.c   | 1244 ++++++++++++
 .../media/platform/imx/vpu-8q/vpu_windsor.h   |   39 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/linux/imx_vpu.h                       |   11 +
 include/uapi/linux/imx_vpu.h                  |   17 +
 include/uapi/linux/videodev2.h                |    3 +
 48 files changed, 12295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
 create mode 100644 drivers/media/platform/imx/Kconfig
 create mode 100644 drivers/media/platform/imx/Makefile
 create mode 100644 drivers/media/platform/imx/vpu-8q/Makefile
 create mode 100644 drivers/media/platform/imx/vpu-8q/vdec.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/venc.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_cmds.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_cmds.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_codec.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_color.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_core.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_core.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_dbg.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_defs.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_dev_imx8q.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_drv.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_helpers.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_helpers.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_imx8q.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_imx8q.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_log.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_malone.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_malone.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_mbox.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_mbox.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_msgs.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_msgs.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_rpc.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_rpc.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_v4l2.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_v4l2.h
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_windsor.c
 create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_windsor.h
 create mode 100644 include/linux/imx_vpu.h
 create mode 100644 include/uapi/linux/imx_vpu.h

-- 
2.32.0

