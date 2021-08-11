Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B803E8C16
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 10:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236068AbhHKIoZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 04:44:25 -0400
Received: from mail-am6eur05on2060.outbound.protection.outlook.com ([40.107.22.60]:57888
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233112AbhHKIoY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 04:44:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpil3s/QOg8qqEhns2FbW3nKIw8sSCQ8E0UPbWZvWHBrjOnMTsJ30PQ0y4wJHjS6MQLHKf6H/FWCKsH4eZ9vMTUG8SMPqXODWH1+8prbnqezEHCUtZRoVr2vsHdK3KO+P4+IgDCC+FtlSrmvvT43yXqHRekJXuR6eNKK6h6alHjci6gtAZ8sNsS+qfkNdUoYa2cWvqgap42gQ1eayIWKjOxNIYrWILrCPhSY9ba2Xz8Q72pJaiRGTwg0Ee2bXtS74+OejW6yN6fTC99C8dlALBKel5ImYdVFeZn7q4Nh0WmVXZfYn7TFx6Yq+E4BSbGzNJGTnpMi1UB2eWtKhZ9n/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wADn5dB8r6zxiqKOCOgJmaXInoeo8LB0GmgheewN4sM=;
 b=CTBqtohareRqcqKqTCZFP/p+mfo4//Xd1W7LUXMyb62KuEgQaovrN7RhD8jKIpS7kPnb9sPL+Q6pnNJxi4SEt0nafAgef85l9gaS0JJLB1jjW8V2rJLlMZW+9jvtoVxyx/DJQD8CrK2+WfSHLnizDLGlGVhpG3MqD7LNZCPQzkJOI1NLA9rJPq3oQu6t9zDTh0qOJO0fRSVE2iELoLwo2tYt17rFwy+HKl0F5XoEQZNQwaFdunr6INW0QD2LtMVDmpf+r6DcA6DytdoJOKZTj3lt/wn9FCphMKYD2AbBP6wEUkC1yszwffXuyeO4kgWI3WdMUG9pwdGOw+puDh0O7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wADn5dB8r6zxiqKOCOgJmaXInoeo8LB0GmgheewN4sM=;
 b=XYibzR3ItYcNOoZm40OZDadnyUQ0X1EmsqMNVOdy+HVgzl9vEiwJnEdVk5CfaMxGD8Txq5KAkFW7bvIQF589mee61OFQCDC80Mcaa47kFRUH819aWgazSeWbvTrB5RmRqJEF1s9YrBGn3LrzuZt4vclS8zo8CZurRMH7I07K2Ig=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB5126.eurprd04.prod.outlook.com (2603:10a6:20b:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 08:43:56 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::9cb5:bd97:8500:2384%6]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 08:43:56 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 00/14] imx8q video decoder/encoder driver
Date:   Wed, 11 Aug 2021 16:42:56 +0800
Message-Id: <cover.1628671163.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.4 via Frontend Transport; Wed, 11 Aug 2021 08:43:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c791f8e4-a9a3-4390-d81d-08d95ca427dd
X-MS-TrafficTypeDiagnostic: AM6PR04MB5126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB51263EB68707052CFD4B6778E7F89@AM6PR04MB5126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oIlgu31s/ixeeu/dcD8c9t5fo6gjleUwTu7tAq00HzAKCNrGGqEGAN/M/mb9JWzQQ4t3hMuEwf23rMC/A2R3gdEOuf5hH238a7qiXRewYlEHQvcsRiFywmwYUsWR21EleSuXusZkydOlTrXRpb5KbpC3sl0D9ZhkRlT6iPrlT/RcbW8ppVC+C8zwqqLk9Q/4FgZnOTySIH/0cpPkAa+YJEmujmQT7hY0jejrXxPOJNanHcYHdTaymmRKTbEe6yxm/tQnOTTpAk+iXiG7CyDLb7tbEelAH8lBUs+tYeMp5xVhoqgn1AHkAhrp31pz2uzGDbsIKEkJm9dz1G76GfjoTppkqteLHlp57uKOXRhuzy5FNzN8kEYjhTK2OB58mupSLJ1hYH+aN0oMizymytSISK1e0/T+g4TT0P9Cq/tUk3X1bV9La9G6Dg6V/4bcYqizsq847Jj7VMJlY557vYbwoP7wb0HtI39n2xOkTHIaYC8f6RLinBmGAZcEq/xHj4Xvi/r8fTM2wQ+vkWEFrrgFdFRBe8Qlh5pXIxPW3yYqpYER12lF/7vhYPdIxJ4J85ESMigfZErkhimS5dJ1p+El09AGOP69aGCMmMLBcninc5s/UAqv+Vmk/fTQaPoVuPNcyF3BvCouvODVzgsBPyPWW7uDE2OZPMsxbbZFYFoR7SFc4DhObb0/PwPRmK/oPEXMB/65HWuyangYfX/T2b5CXKazQseYQu3AlLuQ8OxXQ+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(8676002)(4326008)(38100700002)(2906002)(6486002)(86362001)(38350700002)(8936002)(478600001)(186003)(36756003)(316002)(66476007)(26005)(44832011)(2616005)(66946007)(30864003)(7696005)(66556008)(5660300002)(83380400001)(7416002)(52116002)(956004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gdM+4FXEhm7omqGcjza34/D+fV8EEKnvSVd6If2hXVaXh7FKQYHgwNBwwg1d?=
 =?us-ascii?Q?YX25tDT8fbetO2EV4BJGWQNVo1lEaxYH80pRG20WGlIG4UVbBL+nMyT15tAU?=
 =?us-ascii?Q?ABi7amRt0jSZAJgciJaw5KP0tPSZLt0BwIf3jYneCk9VjWlp8GNbhlFr2z+n?=
 =?us-ascii?Q?F9t5z5ZE/Vk5O+bYiZ0In+Di4knZNXBeIdeNCU7UZjthLsLYHaXBxstWKH/E?=
 =?us-ascii?Q?Zl6STnzPJErMu3q8MeT4XOdob8C4zrXLFi747dP0F85Epl1I/xxaU4VCYEmr?=
 =?us-ascii?Q?AgohBujqwv4Kc2IKGXtJIbwfLNs+KInLiBz7anTYtXbJV5whe3K5bi1zZGos?=
 =?us-ascii?Q?AwlRQpBmi6exvj5svYovHAXNUnjz6noh3TgweU1T+9sabFiSMT5nSd7tqnwW?=
 =?us-ascii?Q?XHUuUTUyf6SsZUxOteheFekKUYO795qEHMre7LcTB3sgEx/8R69g2NetbfY5?=
 =?us-ascii?Q?B0kwxJCT1TD7XkFee1Th4Mo1AUCwI/fyE06v4XWTBz+3dAK2xgJiN0DGvK9S?=
 =?us-ascii?Q?7zXsHJoDcXpECN4qsdZ+HmI6QoRyZrfd5F3glsbS4twaVl//iL33OxhJsi0p?=
 =?us-ascii?Q?amtg/4hIjrxgZn7RVfsFjL6sgJoihJB4On2yfLh/2vdQBi06I9WtHyvqDvck?=
 =?us-ascii?Q?D4ieIsBMHFTc8Pwk6vSL8pLoAOi7HqPY8fGuIjE4ZbEQ0Zt5kI9x8y5RoRPY?=
 =?us-ascii?Q?PwNQJEdTThMxrUQsr4yOXKJmt3dbrBgR1xQrXJ5jJhfhJm+M3t/5jAMsyuCk?=
 =?us-ascii?Q?AR+jrK6Qz99k4Aa+qnaJ6g48P5nm/TKnKaWCd1lNdvRovBYJ53CI49ZhkPDX?=
 =?us-ascii?Q?GakG84tmwHcnAjcQ1j/jufwOHEPmqzv6WuEf7LjC+1yl2i3MNgzKWkP5+jyT?=
 =?us-ascii?Q?TDhR0s8ZZT63DEICRHxW8i64hJXliL5ntQ2Ud0odEC0duBQ4cZ6frVJwjPhX?=
 =?us-ascii?Q?2PzCsSgiMXIyHznZ+ErD2iC7AmYV1rPvaVujQxYwjfgtdoB4S/rE8KByE9Bv?=
 =?us-ascii?Q?wqCYSOYuW+bkvgI8n2oTjCsbP2zqUnHSofzvRrVvdPifPOTxZJzLuUzd1rg3?=
 =?us-ascii?Q?D2cQeP7XMmYptV/nD0Kw4Sn5UYoHJiXCc9LSa7w336ItoNDkGxWVMemKozWu?=
 =?us-ascii?Q?p33k4s3DAMvH8aU91H76IxFvSwl5w9j7VgI8uhWbbGXlO84r1TxyT0SsNumQ?=
 =?us-ascii?Q?fGT2qAeJmw9nUabe/BHEmpjh1QtuEIXH/mbHBLW6QMyE/88XbDtLh+XTDhk+?=
 =?us-ascii?Q?VPvEY7xNrZgwshm+a1hVRkgBWvndEFula4YM9cShdRbFTOPmi51AQtfm5xuZ?=
 =?us-ascii?Q?fp8LzqWj+Jtk8BCr3WS/dBcR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c791f8e4-a9a3-4390-d81d-08d95ca427dd
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 08:43:56.5346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CIWIIFqq4IaHsrk6ICzp1U6OUyEadXUUA+3jMcrGLC3uQPeyG2m2W2gqsVBeioJtpB4rpIh3OoOGKe1nE2wYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5126
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
v4l2-compliance 1.21.0-4834, 64 bits, 64-bit time_t
v4l2-compliance SHA: 7952c0042ccf 2021-08-04 13:17:37

Compliance test for vpu B0 device /dev/video0:

Driver Info:
	Driver name      : vpu B0
	Card type        : imx vpu decoder
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

Total for vpu B0 device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0

# v4l2-compliance -d /dev/video1
v4l2-compliance 1.21.0-4834, 64 bits, 64-bit time_t
v4l2-compliance SHA: 7952c0042ccf 2021-08-04 13:17:37

Compliance test for imx vpu encoder device /dev/video1:

Driver Info:
	Driver name      : imx vpu encoder
	Card type        : imx vpu encoder
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
 drivers/media/platform/imx/vpu-8q/vdec.c      | 1682 ++++++++++++++++
 drivers/media/platform/imx/vpu-8q/venc.c      | 1383 ++++++++++++++
 drivers/media/platform/imx/vpu-8q/vpu.h       |  333 ++++
 drivers/media/platform/imx/vpu-8q/vpu_cmds.c  |  438 +++++
 drivers/media/platform/imx/vpu-8q/vpu_cmds.h  |   25 +
 drivers/media/platform/imx/vpu-8q/vpu_codec.h |   68 +
 drivers/media/platform/imx/vpu-8q/vpu_color.c |  192 ++
 drivers/media/platform/imx/vpu-8q/vpu_core.c  |  910 +++++++++
 drivers/media/platform/imx/vpu-8q/vpu_core.h  |   16 +
 drivers/media/platform/imx/vpu-8q/vpu_dbg.c   |  496 +++++
 drivers/media/platform/imx/vpu-8q/vpu_defs.h  |  186 ++
 .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |   73 +
 drivers/media/platform/imx/vpu-8q/vpu_drv.c   |  217 +++
 .../media/platform/imx/vpu-8q/vpu_helpers.c   |  453 +++++
 .../media/platform/imx/vpu-8q/vpu_helpers.h   |   72 +
 drivers/media/platform/imx/vpu-8q/vpu_imx8q.c |  218 +++
 drivers/media/platform/imx/vpu-8q/vpu_imx8q.h |  116 ++
 drivers/media/platform/imx/vpu-8q/vpu_log.h   |   44 +
 .../media/platform/imx/vpu-8q/vpu_malone.c    | 1687 +++++++++++++++++
 .../media/platform/imx/vpu-8q/vpu_malone.h    |   42 +
 drivers/media/platform/imx/vpu-8q/vpu_mbox.c  |  126 ++
 drivers/media/platform/imx/vpu-8q/vpu_mbox.h  |   16 +
 drivers/media/platform/imx/vpu-8q/vpu_msgs.c  |  412 ++++
 drivers/media/platform/imx/vpu-8q/vpu_msgs.h  |   14 +
 drivers/media/platform/imx/vpu-8q/vpu_rpc.c   |  257 +++
 drivers/media/platform/imx/vpu-8q/vpu_rpc.h   |  463 +++++
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.c  |  654 +++++++
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.h  |   44 +
 .../media/platform/imx/vpu-8q/vpu_windsor.c   | 1244 ++++++++++++
 .../media/platform/imx/vpu-8q/vpu_windsor.h   |   39 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/linux/imx_vpu.h                       |   11 +
 include/uapi/linux/imx_vpu.h                  |   17 +
 include/uapi/linux/videodev2.h                |    5 +
 48 files changed, 12341 insertions(+)
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

