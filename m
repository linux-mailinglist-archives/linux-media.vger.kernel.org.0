Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D6B3FC0F5
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 05:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239469AbhHaDA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 23:00:58 -0400
Received: from mail-eopbgr00056.outbound.protection.outlook.com ([40.107.0.56]:15430
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239401AbhHaDAz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 23:00:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQRM1UJ/E7cUpdmkCEtrDxlGkt9BTc3SUG0Lr5NcJYr9ZVhqYjZnc/uER1nQgY2QcPdpX01/QLJUQaC/ma7D8TPJP9gRwLTTeH1wKlE8JN0yOOTflSBpZ6QcIE8GjnATXPLENN7SFpAq8xB5zb6+gseKz1nhb+JwfmPU3ssJbP6vCQzYFifi/9266d6Byv3CTgQSkXvRfID1Us03aqLJqaoffmpbEkWn+DifMIsoVlt8iIPJ7Nbfb0WQqAInY3anbqwTvRkJExI/eiuzOMPU2TRoaIXQ/r19Hw+mgwBhc6oZ5/8cLU9UGgJ/+LHTUhmylvttWzXrnNZQ1xFetww+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOG9w8BPhfv+BvBZT8OCaLYB3hIDUAXAln/THx4xaUs=;
 b=Ng25H+E0KnYMbfbXae0X0nqp0VC5hBH9Ehjkmb0TBcItpk4+3wlbgPXQdaqCiF2aTkpHEQx5Ql+eFS0D1Nlc2L9/Tt5+7lMSoXrGVXNqbhTVANUBMPTiVxBeLgivdPRRixkScoak6Q1FAojiVgU57ABmRvoUSEx6mIZ+ttLjNKmmv++ImSW1uiK+rPLZrd1L1PBFRiuo7nBQzE+qGz3dODWFFEifiK8yCHJqtayMi2MtuMWcHVPG0+rhoyg0cM7n3hbuFmE1LiNp53ELtGYnMGounoV/Gj4vRljzIOJpxh4DO1DgE54wVXm9el36uxpWDuBUp447n+BlqYW2026IZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOG9w8BPhfv+BvBZT8OCaLYB3hIDUAXAln/THx4xaUs=;
 b=Y4qzL+2kVo5KFHVk961izE5uTaw7Fs2G8wgrETxSMIM3BnJKsAVPyi6R0R0XS2Z1y/ytPZRi687mSii2raEZeenKqF1uccK50aP1x1gpoPWVdi9gZLwBCnLZn2VHKiZsPKbccYat55mjFdhcMa3mvtkheJoAbfFwTxzNUdtXcTI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4888.eurprd04.prod.outlook.com (2603:10a6:20b:12::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 02:59:56 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 02:59:56 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 00/14] imx8q video decoder/encoder driver
Date:   Tue, 31 Aug 2021 10:59:01 +0800
Message-Id: <cover.1630377507.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 02:59:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7258a134-04f5-4370-1706-08d96c2b6975
X-MS-TrafficTypeDiagnostic: AM6PR04MB4888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB48888B6E69EAA7A3888FBB45E7CC9@AM6PR04MB4888.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FtVxf5MuG9QR85eKdFdVL2tkylto/T4qaK7dW2UBc74r49xd3b/FOs7fjNdndyq/x7kmWexPmpKzq8b+AqmFMyxa358hO1wjH/9qn/9bxW+Y+KcWE5uCMJK5DmLrLr/ykJV9lS0mOuVp192NJtgbThzG0abp4mHjCuSE1HjyfMF9fx8YGF2LwY/ATuZlUhH4qtOcomdJEA7d3uEEZkOOETIFxte75JuCNXhcSnrHgtfAgXHi+fXV22F0BFY4yexpK4XB5yfPfdoO53l7aNruN1uEU2W+tHoZQjkRf/3daY4tRH1D26ug+qaCTOWb55DMA6D1/rcJ4x8aDgnDf9ign/NdL2q0+og3U7ZKIXcbgNUAkaGjpopHrP57L5PVwAMWbq1j53m4lMjHBqW/4L7FL0UywgluWb41FmccleW5p6KuAe2maMgtV+JQ6Ajjsexwanrg1TfnxMgtzXu/rn0duA4Dzt83TT/2VtsfuowuVibNB4c9p6Vdrn2R6NZIqXomAtwStxdhAYUalMWimx646eDT/D6jxVKysNky+9+X0HRzrxsHh4AWnGN8IUNWa9p00a9WF6OmOB24ZeyftRi/ElB7lkm2QyuY7B/sCSGQ2Mky7RIEQTBkFZdBPlNuSlKBFgmpDfEiIpEF0am1Iquogjfq7920MN0/hNgnNFP0S6JBkgZxOgTch9IQiSCtZd2YKoOpcVqV6jG9k9CWGeuTRnBYQNy8LCWyigqrzLSxYIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(6486002)(36756003)(8676002)(2616005)(186003)(38350700002)(38100700002)(30864003)(2906002)(5660300002)(8936002)(44832011)(6666004)(478600001)(956004)(26005)(7696005)(83380400001)(316002)(7416002)(66556008)(66476007)(66946007)(52116002)(86362001)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A3FEHreaxQv3tZX3XmOcwYVCRfzyNZL0s0DTCrcv7kq5ql+julb5Vs4FAyG0?=
 =?us-ascii?Q?YILbAaUHJ2HdSSKv7lFQtyUwbyUSXnZb5xOoY0jO9x7MMgZKHz88X8csyzGF?=
 =?us-ascii?Q?5Wgc0BwL9afbuJLQOplTayfmJio1Lml4euWzT7lopEkr50Sqgm+b9E1oUpzR?=
 =?us-ascii?Q?CdMh4EE1/wygKUj6mQZCL9ZBCT1j0QlIpLV8oV43d5iJp5QA4IpJ3xYrkix2?=
 =?us-ascii?Q?zlFGl9i+2N1mp/vkKnLp0FemBeuBzZedT0ywqguXaSHJA9jVjyfUFyxjDAXf?=
 =?us-ascii?Q?3dJMshWqg6k3essObiiKtUx2xRdjEImym3bu0bbEqeownnkABQOF6Jr83JlT?=
 =?us-ascii?Q?XHexLDS9sIdICH5DzkwfliKRHLmmV29Q0u4JuF0fwPhQo2xHsgIXJNDl1knJ?=
 =?us-ascii?Q?eVbSKBQ2kAz2FJEWVZGaSSj0qQy9LlxecWwSNrKwAXnxdRyru4PHMA3dP71b?=
 =?us-ascii?Q?3fImwA7UGJS+lFW28pP87Kpkn9lW7s4HnIPBcxbkIvUYTibBRwiX40Z4SoXP?=
 =?us-ascii?Q?LW6K6PvHkv2nDtmuKzqkAhZC3SzwM4ecOnpG2Jd4gsTOuSDMoCjxY1yr6lvx?=
 =?us-ascii?Q?4FkDQFFzOLo+GXGmU00wydcBI5jsjQX6qA/tSDq2t9u6GI/jjHeHPbljKo4x?=
 =?us-ascii?Q?COuNWQhbEeYcN0KchGTcxHTmroLDYOIg6aT5LuNGTIYcyotcSOjiH7HFiltw?=
 =?us-ascii?Q?j3b6dvZtgiWEAc1T6wacz5K8QLhmam06QVQ9t64hDWuynbibjm7lHQpP5Of8?=
 =?us-ascii?Q?74+2NlvO8ArjRa/2/KLx6JTa3j4COYnkS7kXaEKhm2O/mxa0m26phN6MBFdi?=
 =?us-ascii?Q?12b7yo2t+rKN1/XIdsQdyzE+VJ1PjQxAQmVnT2VGxFA/cQ2Fw4EIYXJY00rL?=
 =?us-ascii?Q?b5FW/gYPo3XCBgI4oHb4+nPnrLEEDFVEKgxBGi+YO5bIKnhunllNij3HO6IU?=
 =?us-ascii?Q?DhWeZdQsV+iQX69QdxfVmbZmmxagLfq/eK9f6SUGG6GNn8gb+OC1Lmq4OPHY?=
 =?us-ascii?Q?SHiZHNJaOKUW2sbZsdTD4lliEOTblmACjPwj+H8p5t52MvqmxM0zYgdR/LeQ?=
 =?us-ascii?Q?g6tUuyUmcmds6UDswUbz5lsgE6mdzXJCGc3/1jQ/9ZvHWd/OZA5Sr8JVba9J?=
 =?us-ascii?Q?TmI7SSwH/IWr4imUFVo7YUyy0hddxItvqdg7gela/WASOTFOLROCuQis7DBP?=
 =?us-ascii?Q?KH2T/ePm8Gi2JpcRwXeK5DwOSQgI0Vl8Qkoa0AGgogsSn/j7ClDdqeIR8LHF?=
 =?us-ascii?Q?qliLsEL1xLNgsgXgwzbyzOi16iWrnTiFh5KQWlDLBAhuDJlJl7SShI0VjzKZ?=
 =?us-ascii?Q?bsQt8B57jwm7LfpdsHtgg4rn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7258a134-04f5-4370-1706-08d96c2b6975
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 02:59:56.0879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWAO1Jy5xiIbjfrtxNAaRtGQlWSNHg4yKaxVjE/SfDbVBtG60GV5cAIIcihMJ+ba4cFO4wwMPicGT7Pgwf8PrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4888
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

The driver creates a separate device node for the encoder and decoder.

Changelog:

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

Compliance test for imx8q-vpu device /dev/video0:

Driver Info:
	Driver name      : imx8q-vpu
	Card type        : imx8q vpu decoder
	Bus info         : platform: imx8q-vpu
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

Total for imx8q-vpu device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0

# v4l2-compliance -d /dev/video1
v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t
v4l2-compliance SHA: 22466798f9a9 2021-08-25 11:05:21

Compliance test for imx8q-vpu device /dev/video1:

Driver Info:
	Driver name      : imx8q-vpu
	Card type        : imx8q vpu encoder
	Bus info         : platform: imx8q-vpu
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

Total for imx8q-vpu device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0

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
 .../userspace-api/media/v4l/buffer.rst        |    7 +
 .../media/v4l/pixfmt-yuv-planar.rst           |   15 +
 .../media/v4l/vidioc-dqevent.rst              |   12 +
 MAINTAINERS                                   |   10 +
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   24 +
 drivers/firmware/imx/scu-pd.c                 |    4 +
 drivers/media/platform/Kconfig                |    2 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/imx/Kconfig            |   19 +
 drivers/media/platform/imx/Makefile           |    1 +
 drivers/media/platform/imx/vpu-8q/Makefile    |   23 +
 drivers/media/platform/imx/vpu-8q/vdec.c      | 1684 +++++++++++++++++
 drivers/media/platform/imx/vpu-8q/venc.c      | 1383 ++++++++++++++
 drivers/media/platform/imx/vpu-8q/vpu.h       |  333 ++++
 drivers/media/platform/imx/vpu-8q/vpu_cmds.c  |  435 +++++
 drivers/media/platform/imx/vpu-8q/vpu_cmds.h  |   25 +
 drivers/media/platform/imx/vpu-8q/vpu_codec.h |   68 +
 drivers/media/platform/imx/vpu-8q/vpu_color.c |  192 ++
 drivers/media/platform/imx/vpu-8q/vpu_core.c  |  911 +++++++++
 drivers/media/platform/imx/vpu-8q/vpu_core.h  |   16 +
 drivers/media/platform/imx/vpu-8q/vpu_dbg.c   |  496 +++++
 drivers/media/platform/imx/vpu-8q/vpu_defs.h  |  186 ++
 .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |   72 +
 drivers/media/platform/imx/vpu-8q/vpu_drv.c   |  217 +++
 .../media/platform/imx/vpu-8q/vpu_helpers.c   |  453 +++++
 .../media/platform/imx/vpu-8q/vpu_helpers.h   |   72 +
 drivers/media/platform/imx/vpu-8q/vpu_imx8q.c |  218 +++
 drivers/media/platform/imx/vpu-8q/vpu_imx8q.h |  116 ++
 drivers/media/platform/imx/vpu-8q/vpu_log.h   |   44 +
 .../media/platform/imx/vpu-8q/vpu_malone.c    | 1683 ++++++++++++++++
 .../media/platform/imx/vpu-8q/vpu_malone.h    |   42 +
 drivers/media/platform/imx/vpu-8q/vpu_mbox.c  |  126 ++
 drivers/media/platform/imx/vpu-8q/vpu_mbox.h  |   16 +
 drivers/media/platform/imx/vpu-8q/vpu_msgs.c  |  413 ++++
 drivers/media/platform/imx/vpu-8q/vpu_msgs.h  |   14 +
 drivers/media/platform/imx/vpu-8q/vpu_rpc.c   |  257 +++
 drivers/media/platform/imx/vpu-8q/vpu_rpc.h   |  463 +++++
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.c  |  654 +++++++
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.h  |   44 +
 .../media/platform/imx/vpu-8q/vpu_windsor.c   | 1244 ++++++++++++
 .../media/platform/imx/vpu-8q/vpu_windsor.h   |   39 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/linux/imx_vpu.h                       |   11 +
 include/uapi/linux/imx_vpu.h                  |   18 +
 include/uapi/linux/videodev2.h                |    5 +
 48 files changed, 12338 insertions(+)
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


base-commit: 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
-- 
2.32.0

