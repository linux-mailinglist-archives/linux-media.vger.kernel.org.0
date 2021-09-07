Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD8B402656
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 11:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242539AbhIGJu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 05:50:57 -0400
Received: from mail-eopbgr30089.outbound.protection.outlook.com ([40.107.3.89]:32822
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240891AbhIGJu4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Sep 2021 05:50:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwGNlMl2VE5EYbWPIoGMdJG6uhpJNOQx4FHsD+auT4LIfUWe9aZXzZfm2nNbt0+TdZNtlR513/JOZ7U8DaA5tXszx72jLvZvMAcNBFFzVXObsGrnOFzxPwQJIDJtcJMGVf+hBHPSvslyN1geWhqlSdmCr+YQ3bHJxGOj8mgdmcjlsmh3zuov01/TRAEVuCjM3ichtA4dB92XZU+LLEt7jobvR6c1E9+WS2ZtivH3mOvMlpWZ7NfHGllCVcfVZW87gbSGfChQYmk6FXDjsStym22/5vtrkhx+vi1Z83WCyjVy3w9djr/WTx3AA2y/aWawcErZkSui1dZfhiW3zDSpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QnEGtKZeveVzqgNYhKdxViRY5wshVIcQWM2/teiRuNw=;
 b=UfE+kdAbtl8zXQWhue/417Zmiv9Q1Doce0B/6O2UNSapfKj9kVGT+KLKWrH72yTWonGLTZ8iuGztgzZnqQRhbRYEu067NlR9vDdPfiOU+xMj2O4/hrlK7tI0gEbYio4IEmr0NF+haoiQx9oj6hCvfkSMEV5bAgmMrQuBIojvYmgePOq+9s7puRWDAn16Av+mxBacPwQqOxqxFqJdKIkNhN8BP8IaUIqLc2/mChmucNfTIDrhsKNbMnxc+c6UHpJofR6KgFykxtKP0HnsB7AYUJ8kj0NasgtGePHN639Lj8Nj0IXbm4VBVQcowD3W1OEOh8dRuu/6LxHm5x/JVq1P9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnEGtKZeveVzqgNYhKdxViRY5wshVIcQWM2/teiRuNw=;
 b=E/hkpZIIonJ3mv1XN+aXTqL+nxpqUa4oWIWXePN9WR2L6581YDB/zEgFSS20dMrCsG/TrBmkSZqvb4/0vrxrsIkjJtGGPhcNLIDf34I33EfNZ+NUVtSABVPANVy776awyLKntqLuM/q3iOIgf/ASiqYlQHvIGbtiVk5+nkmkfTo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB7767.eurprd04.prod.outlook.com (2603:10a6:20b:288::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 09:49:48 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:49:48 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 00/15] amphion video decoder/encoder driver
Date:   Tue,  7 Sep 2021 17:49:07 +0800
Message-Id: <cover.1631002447.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0097.apcprd02.prod.outlook.com
 (2603:1096:4:92::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR02CA0097.apcprd02.prod.outlook.com (2603:1096:4:92::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 09:49:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac71ac42-4cc9-4c93-6ce6-08d971e4d43d
X-MS-TrafficTypeDiagnostic: AS8PR04MB7767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB77675889DECD4972C3AA24E7E7D39@AS8PR04MB7767.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2/VGsLy+/SwibARaWhejEZdgX5SGS0uPOoEGmvLbq9BXJvqET4miXpeQc5y7pcNyStk5XbSd/FPQP/Scg6dc5unH4U/BsIq8+OWGyYYJWNJFeHBm/qSYp7qsMWhy6g6Uttz9RWQ3VnGOfVzAYgUamvmIYSEf9f3duKWBcAWNOEb/w6yIu0LZS50oG6ScxaoCiZUV05lJXV0E1PmxHS012PtkAikSwNe2wIU9Gt/XkPbbtFQZV8U4mwZGn3yW43JzWtcKLytZR18iow6mVh/OnU27TykgPp+xEOMDlxbX3BybmTVNAsebofpz4k1AZQakI2a9G0PRuXIwhugen4v5ygYclQcooYr1LhQzHBtwGAgJVljwAFvQLuG2YoUxoeTjZQNNc+HDzSvuhO0FsZinKUpZGTI3afHMXuFgmqzDyBh7QccJPDNjGAji/rJGJD/UX/K1iAutqGkEXY04aE6q4QKWwlB/xwCdigpavpX1CC7R4C4Zqoaq2C4YOwaMGxr7tW67L+aInfLtEkmYlpxQCb0y5BOi7VwIgpSF1pgFoi5E3Lzpl5jtWNTksmH7+n6LO22HMliRmUP+xPsb3j7CA+J/mQFGDTwymyVatKl32FDXIr/2jXy0+lrPWA3MIMpT5uXsifJMD0zVVkqnMLIcqGrVlpAIbz08FGmD/SP0txZzEZIBwflHTBeNf8/C81jPdg3f3QTClkPxDnn4BLWvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(4326008)(186003)(86362001)(7416002)(316002)(8936002)(478600001)(8676002)(6666004)(36756003)(44832011)(83380400001)(2616005)(956004)(38100700002)(2906002)(38350700002)(26005)(52116002)(30864003)(66476007)(66556008)(6486002)(5660300002)(7696005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RMnoTwjr/kEdYt9sOlTpUoFoGqPHJN6xroVq5cjHSXUL1flcJFbB9TZS8PE0?=
 =?us-ascii?Q?c4zJm1MCKdwnwDrEbnUArMIjjwYwGwJdufoGUf7B2hFWy6oGo3+qbru88Uta?=
 =?us-ascii?Q?OZoccAlAfyK46lIV+TED0eWVbNie971G4RzDKt/ZAFtRzi8tn/m91XJAUdYk?=
 =?us-ascii?Q?2vQN2sJPinLbxXZqle5nrafyczNA5zH6NjR1+9TlMspQGO6f+rA2z9dNKwkF?=
 =?us-ascii?Q?lEQfs9zcVYKAx5+VaKX0JOkiHbvHqgMruRvuaaTJ23pj93f2o4Y4v2TKQOMA?=
 =?us-ascii?Q?DCPI/zXZT200imSzQhdtd7Ja+kwrq5mP9R+C4zkJwbux/1JWpYXNdBs15cFr?=
 =?us-ascii?Q?YQMVQXK63CLtZVSaNdmKuJbfldNSN8HMytoQSJ3AcX2HCK9RJamx0juAYl0W?=
 =?us-ascii?Q?TVvDlg78AMsA3A6fqw2eMIm+Z+0EqBl5JRsmVrZI6BmfMX08ztzdmGj+bdJT?=
 =?us-ascii?Q?EDp4WywYPY4uZuSnCtbQgXKPM9AOsnjPWx0cAuC8FRtp8jHK6DM+yDHWqMH0?=
 =?us-ascii?Q?V1um3X8QKm+8oAEOQv7/rbdoxRHkFcaoM7lefR1XWo9X86WoDe3cqw3leybb?=
 =?us-ascii?Q?ZYxUS9KbD3yljRcw6ZroWa6UB86NVNNrKYKzCaM9VP+tKJVow5r4ni+daHUb?=
 =?us-ascii?Q?RkipWMgRJ37lwf/7uUE3NkXF3f5DEjoWcjZkKqt2TFKJ3B6ff1/1OA+CcG7q?=
 =?us-ascii?Q?sw9RpzaXKkkpj9z+5G76rxqmQEdwYJ1/EotzCWZQ53NkJmRzrEGOlgXfnjkJ?=
 =?us-ascii?Q?lC8rKK6ads2EuKMRgNaVN9/6EB+f/R1SR4HppcxzuhjHoloXwOFmwZreyadJ?=
 =?us-ascii?Q?HeD61QjCUNxPLX+4LoU1dJCtRs+yi7+FmiNB2iXyQyxjbgoDIY/2jjHgtNyH?=
 =?us-ascii?Q?KF/ecYZKXrjXqEND/n3PttawVOV4uBGCuqIA2hSm4IS70NIjR9esU2HpriQ3?=
 =?us-ascii?Q?CpYpMSzvDD7wpHjNBF/Wmb1LCIsYPerBwQmct0aQ8oyet1QZxZskZn2w85r+?=
 =?us-ascii?Q?go4UDiXEn/r4aOYhWPu5edONWRva9VBdmR2DPj4TqMQNNn8Cbs0MdTgmAuo4?=
 =?us-ascii?Q?BFsNZjqDw4dq7UZ0waDU8Ixl9xUQUl+rL07ehmEDt94gqn2c1C+8D1PxlbCX?=
 =?us-ascii?Q?/1fVzXbLPhCqG/ERk44HOaNdqwWmYJ2lSCJG1kh+8mPY9/S6Ddeg/OVQ2lf4?=
 =?us-ascii?Q?axPROLdk58boHU1cSzoZSLRhGuUnGmaY3nLUZbgRyU1HZKMH0E2VeG3ud63c?=
 =?us-ascii?Q?XeLqLauLQB4r2qFbCq9tY4lyqINairnqCeHfUm1Kt3mDkw25RX048CTIa/RX?=
 =?us-ascii?Q?V5EIQTu+53HeHrVR0EnvYtN7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac71ac42-4cc9-4c93-6ce6-08d971e4d43d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:49:47.9621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0UBwF1PhCOwHPRtCLT13l6NUTRwF73rOZH+6KMxCSHVQBPEnpA2T16mZrQ3CUFKCdtR5H/Zhc7l0ijccJi3nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7767
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This patch series adds support for
the amphion video encoder and decoder
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

The driver creates a separate device node for the encoder and decoder.

Changelog:

v8
- move driver from driver/media/platform/imx/vpu-8q to
  driver/media/platform/amphion
- rename driver name to amphion
- remove imx_vpu.h
- move the definition of V4L2_EVENT_CODEC_ERROR to videodev2.h
- move the definition of V4L2_EVENT_SKIP to videodev2.h

v7
- fix build warnings with W=1 reported by kernel test robot

v6:
- rename V4L2_PIX_FMT_NT8 to V4L2_PIX_FMT_NV12_8L128
- rename V4L2_PIX_FMT_NT10 to V4L2_PIX_FMT_NV12_10BE_8L128

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
v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t
v4l2-compliance SHA: 22466798f9a9 2021-08-25 11:05:21

Compliance test for amphion-vpu device /dev/video0:

Driver Info:
	Driver name      : amphion-vpu
	Card type        : amphion vpu decoder
	Bus info         : platform: amphion-vpu
	Driver version   : 5.14.0
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
	Standard Controls: 3 Private Controls: 0

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

Total for amphion-vpu device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0

# v4l2-compliance -d /dev/video1
v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t
v4l2-compliance SHA: 22466798f9a9 2021-08-25 11:05:21

Compliance test for amphion-vpu device /dev/video1:

Driver Info:
	Driver name      : amphion-vpu
	Card type        : amphion vpu encoder
	Bus info         : platform: amphion-vpu
	Driver version   : 5.14.0
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

Total for amphion-vpu device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0

Ming Qian (15):
  dt-bindings: media: amphion: add amphion video codec bindings
  media:Add nt8 and nt10 video format.
  media:Add v4l2 buf flag codec data.
  media:Add v4l2 event codec_error and skip
  media: amphion: add amphion vpu device driver
  media: amphion: add vpu core driver
  media: amphion: implement vpu core communication based on mailbox
  media: amphion: add vpu v4l2 m2m support
  media: amphion: add v4l2 m2m vpu encoder stateful driver
  media: amphion: add v4l2 m2m vpu decoder stateful driver
  media: amphion: implement windsor encoder rpc interface
  media: amphion: implement malone decoder rpc interface
  ARM64: dts: freescale: imx8q: add imx vpu codec entries
  firmware: imx: scu-pd: imx8q: add vpu mu resources
  MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry

 .../bindings/media/amphion,vpu.yaml           |  178 ++
 .../userspace-api/media/v4l/buffer.rst        |    7 +
 .../media/v4l/pixfmt-yuv-planar.rst           |   15 +
 .../media/v4l/vidioc-dqevent.rst              |   12 +
 MAINTAINERS                                   |    9 +
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   24 +
 drivers/firmware/imx/scu-pd.c                 |    4 +
 drivers/media/platform/Kconfig                |   19 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/amphion/Makefile       |   23 +
 drivers/media/platform/amphion/vdec.c         | 1692 +++++++++++++++++
 drivers/media/platform/amphion/venc.c         | 1382 ++++++++++++++
 drivers/media/platform/amphion/vpu.h          |  333 ++++
 drivers/media/platform/amphion/vpu_cmds.c     |  435 +++++
 drivers/media/platform/amphion/vpu_cmds.h     |   25 +
 drivers/media/platform/amphion/vpu_codec.h    |   68 +
 drivers/media/platform/amphion/vpu_color.c    |  192 ++
 drivers/media/platform/amphion/vpu_core.c     |  911 +++++++++
 drivers/media/platform/amphion/vpu_core.h     |   16 +
 drivers/media/platform/amphion/vpu_dbg.c      |  496 +++++
 drivers/media/platform/amphion/vpu_defs.h     |  186 ++
 .../media/platform/amphion/vpu_dev_imx8q.c    |   72 +
 drivers/media/platform/amphion/vpu_drv.c      |  217 +++
 drivers/media/platform/amphion/vpu_helpers.c  |  453 +++++
 drivers/media/platform/amphion/vpu_helpers.h  |   72 +
 drivers/media/platform/amphion/vpu_imx8q.c    |  218 +++
 drivers/media/platform/amphion/vpu_imx8q.h    |  116 ++
 drivers/media/platform/amphion/vpu_log.h      |   44 +
 drivers/media/platform/amphion/vpu_malone.c   | 1682 ++++++++++++++++
 drivers/media/platform/amphion/vpu_malone.h   |   42 +
 drivers/media/platform/amphion/vpu_mbox.c     |  126 ++
 drivers/media/platform/amphion/vpu_mbox.h     |   16 +
 drivers/media/platform/amphion/vpu_msgs.c     |  413 ++++
 drivers/media/platform/amphion/vpu_msgs.h     |   14 +
 drivers/media/platform/amphion/vpu_rpc.c      |  257 +++
 drivers/media/platform/amphion/vpu_rpc.h      |  463 +++++
 drivers/media/platform/amphion/vpu_v4l2.c     |  653 +++++++
 drivers/media/platform/amphion/vpu_v4l2.h     |   44 +
 drivers/media/platform/amphion/vpu_windsor.c  | 1244 ++++++++++++
 drivers/media/platform/amphion/vpu_windsor.h  |   39 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/videodev2.h                |    7 +
 44 files changed, 12312 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amphion,vpu.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
 create mode 100644 drivers/media/platform/amphion/Makefile
 create mode 100644 drivers/media/platform/amphion/vdec.c
 create mode 100644 drivers/media/platform/amphion/venc.c
 create mode 100644 drivers/media/platform/amphion/vpu.h
 create mode 100644 drivers/media/platform/amphion/vpu_cmds.c
 create mode 100644 drivers/media/platform/amphion/vpu_cmds.h
 create mode 100644 drivers/media/platform/amphion/vpu_codec.h
 create mode 100644 drivers/media/platform/amphion/vpu_color.c
 create mode 100644 drivers/media/platform/amphion/vpu_core.c
 create mode 100644 drivers/media/platform/amphion/vpu_core.h
 create mode 100644 drivers/media/platform/amphion/vpu_dbg.c
 create mode 100644 drivers/media/platform/amphion/vpu_defs.h
 create mode 100644 drivers/media/platform/amphion/vpu_dev_imx8q.c
 create mode 100644 drivers/media/platform/amphion/vpu_drv.c
 create mode 100644 drivers/media/platform/amphion/vpu_helpers.c
 create mode 100644 drivers/media/platform/amphion/vpu_helpers.h
 create mode 100644 drivers/media/platform/amphion/vpu_imx8q.c
 create mode 100644 drivers/media/platform/amphion/vpu_imx8q.h
 create mode 100644 drivers/media/platform/amphion/vpu_log.h
 create mode 100644 drivers/media/platform/amphion/vpu_malone.c
 create mode 100644 drivers/media/platform/amphion/vpu_malone.h
 create mode 100644 drivers/media/platform/amphion/vpu_mbox.c
 create mode 100644 drivers/media/platform/amphion/vpu_mbox.h
 create mode 100644 drivers/media/platform/amphion/vpu_msgs.c
 create mode 100644 drivers/media/platform/amphion/vpu_msgs.h
 create mode 100644 drivers/media/platform/amphion/vpu_rpc.c
 create mode 100644 drivers/media/platform/amphion/vpu_rpc.h
 create mode 100644 drivers/media/platform/amphion/vpu_v4l2.c
 create mode 100644 drivers/media/platform/amphion/vpu_v4l2.h
 create mode 100644 drivers/media/platform/amphion/vpu_windsor.c
 create mode 100644 drivers/media/platform/amphion/vpu_windsor.h


base-commit: 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
-- 
2.32.0

