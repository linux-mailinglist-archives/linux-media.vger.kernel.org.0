Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3456E2AFF50
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgKLFcG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:06 -0500
Received: from mail-eopbgr00043.outbound.protection.outlook.com ([40.107.0.43]:9485
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727975AbgKLDGi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 22:06:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKDDE1gn2lgZSjpcY7T/7Qp/Xaz23ZLU0b3QgLgN6UPmvwK8sUMOTa6G0zGpAz+Z+YSmidg09RKVwwbdIfk+JQIhuDgRDqGecH3gwulxX3puQ9bcLXeguVXPOcsv9xqRX2gx0fyELvKIdKNx/pi1QpbKGObVYkt/5M6aJhEXZYPVW7NV0oBIVGL5Ai0A/bNAEhVuAz0or0U9rh5UPfEQHjEKuleMsVvQ0vpsFPg3NPcup8O/sUUYbLiZpgJF5co5/1FmKCul5IVhw2X9dUpZBZq4Ipdu3GvUkCjbOzsOJWFCOSm0N8Uxlcx8miez64ZYoPcXutdTRf5xxVpCwzVlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvITuTmSYsvAA1+k50R3d+aeX6yT2r2tPly+W8uEb8k=;
 b=QgMaav6mx/UXtxlQikxrxspC7UPn6h3BkNRPy5yOh/mBLvBMiX3cbglXmcO5kp4UaUm5s7ZVjir5AWRgowQvIp42lZXh83cToRmMnNQfPE+41dzCnBv7P6MhZ81AzZfbKv6NXDyjc3BsX8Q2krKfcwF5uoRrYkXX0n02wVe0dAms3tASu0n0VAOV4LOzXr6zSIWTST2/2Vp09T2kKn9tyI1naJZc2Db06VkeSIRkYu2QYtLVgBVo8GldkS/XGA87jDMmiwLreJMYAVu0FvqGaIaHP1n5ObUXlbKQLY+q7htAffSWHChZOiOTI35f4kJUnSVT4UH8l9fXLmJXUl8TpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvITuTmSYsvAA1+k50R3d+aeX6yT2r2tPly+W8uEb8k=;
 b=M282ZfYxxSXNPFAD2i3j6ta2fOe8bvXvfqN9AryMSB6tavjUo8KD8DpuiBfT3IJvzTPQxHnly20fwtmIHEZKNYzTVy3o2z0sYm+s6E9OSAHHxXXveIrAnG1kvBtALaITwl+WTtb8lhcgPjZv7ePNZ7qY2f+d2G6okWOKJNe5h+Q=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 03:06:32 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 03:06:31 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v5 00/10] Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
Date:   Thu, 12 Nov 2020 05:05:47 +0200
Message-Id: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [86.124.171.138]
X-ClientProxiedBy: AM0PR06CA0100.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::41) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.138) by AM0PR06CA0100.eurprd06.prod.outlook.com (2603:10a6:208:fa::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 03:06:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dd99f944-377e-4d2f-306c-08d886b7f4c7
X-MS-TrafficTypeDiagnostic: AM7PR04MB6997:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6997413A64DF7468ECB81101CEE70@AM7PR04MB6997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tp7LDero9X63tFa88XWG3prO9uTMc+zV0Ojn6BYNH+Wry6YeK6v8rjFX7si847xfvcM7M+P+Sn5ThyM02eWEEF+iKipaxyd1FA4SArmjqX1INe8sWIEEaqsp3qEpVMQpSKIoey2pdkdA0gZ9OrQXsNB694FGPn1Lubg9jc6MlvekjbMyMuenks2eYY3KMs7A+kr9vI9c4C1pdMGl6CbW1KjWJ2cqgY/5MWEz94wwEdxNaMIql2M7pmxvbQuIdhDHT+NV+DoXIQvP6aFWIpGUKaJXVTznwpSArJna37cpbr8YcZ7C/peytLIIKin3mHtLbJbJtshr5fr0fyhAB20+OA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6666004)(1076003)(316002)(26005)(478600001)(6506007)(4001150100001)(4326008)(6512007)(66946007)(66476007)(186003)(6486002)(2906002)(66556008)(5660300002)(16526019)(8676002)(52116002)(86362001)(7416002)(8936002)(2616005)(956004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: KuDsASPhSmhV9KCOcWpNQOoBhb2y75dBRDmbSGwOkNQu/ADlfNaXIlsT+O+B2JmJ5yN3PoueTOjDsQfpUarSG5QgTB+NW6wuYErPhgp9p+C1Hm7e+aJlkbYUCe2cxchHcI8wug8OzM5jDn7qc0ggWuqLCmuG2c/a2dbWdL8UA0lg/X11gRvCct47nlgJo3RmWVKY9aN57RPpn7S9+BZQ0fGupa5ImXRBM8rU4DVhhisAT3oYWw2kuSpr9imPkLZjyF8UJ82CT40twoQAidTf4z47SKh6ExFQ6was7mdz/aFT1cN/5B5fd3MRCbZgDwp3Rc6DSeorNCFtB+AvBm7A3aYQ/mC1Nd6VwS9GVY3ZHoctr14EzQLEcxKUY7yt74ViSjKU7XCLVdp+rt7paIGj8ybPZpZ+NNL5YPKSuDybHLxMQTrxwQkmzYBscO+9Zq0/DrFweVtc8jUkegySMO9q7z+KjTbdI8z+1HVPvIUEsWG8n2ab5q98uQcoJFKK/V6xXc+0qjyf3Dc3iwwJlb0KOKeYJZY/Gs78gz8ns+Tl2S8G0r90SJQKNtbx+VbNt0Vpy7rSu/vYMvzaCh+eL9UlY6/SzUjLEPzat2/7Xa/Ro9fnf4wypp4+CUglvosarQsEV3OQ/XF6NJC00NY4E4PBDenmwrgSaP07vaVSnvF0Jzv92WHHN3e+O5b53l6wwIBDfPdayQ1MhhDu8kCekeBAB2T695/Vnq9o1ChGMrpKfvQGY3PQg+zarnw54v5QPCssxO7otgPNKE+W2ZSJFpV1FgE8Gmcxnrl6WtI5RbBqC7oGYnd9Z7Ht9f+zSUKVDOo91A2WfztUeQe4TQ3/Sk6J18AYYkBHy/OhtOKLPOA5crb8ryEr3Z0obp/qYbLChczJ7UQKZcZiDHhsjpNcWJSGwg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd99f944-377e-4d2f-306c-08d886b7f4c7
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 03:06:31.8765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YS9g7+dAFg3D9H++1RNSeTpZuYmBnmV33SmuTplETm7Gp0qVulXiDj7EmSwJ/VJOc2GscydaPNEfnu7MN28U0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

This patch set adds the V4L2 driver for i.MX8QXP/QM JPEG encoder/decoder
and it's dependencies.
The driver was tested on i.MX8QXP, using a unit test application and
the v4l2-compliance tool, including the  streaming tests for decoder & encoder.

The output of latest v4l2-compliance on i.MX8QXP, decoder & encoder:

root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance-master -d /dev/video0 -s
v4l2-compliance 1.21.0-4679, 64 bits, 64-bit time_t
v4l2-compliance SHA: 225c6c2a17be 2020-10-30 15:13:07

Compliance test for mxc-jpeg decode device /dev/video0:

Driver Info:
	Driver name      : mxc-jpeg decode
	Card type        : mxc-jpeg decoder
	Bus info         : platform:58400000.jpegdec
	Driver version   : 5.10.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected JPEG Decoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

	test invalid ioctls: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (no poll): OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for mxc-jpeg decode device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0

root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance-master -d /dev/video1 -s
v4l2-compliance 1.21.0-4679, 64 bits, 64-bit time_t
v4l2-compliance SHA: 225c6c2a17be 2020-10-30 15:13:07

Compliance test for mxc-jpeg decode device /dev/video1:

Driver Info:
	Driver name      : mxc-jpeg decode
	Card type        : mxc-jpeg decoder
	Bus info         : platform:58450000.jpegenc
	Driver version   : 5.10.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected JPEG Encoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

	test invalid ioctls: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (no poll): OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for mxc-jpeg decode device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0

Mirela Rabulea (10):
  media: v4l: Add packed YUV444 24bpp pixel format
  firmware: imx: scu-pd: Add power domains for imx-jpeg
  media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
  media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
  arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
  Add maintainer for IMX jpeg v4l2 driver
  media: Add parsing for APP14 data segment in jpeg helpers
  media: Quit parsing stream if doesn't start with SOI
  media: Avoid parsing quantization and huffman tables
  media: imx-jpeg: Use v4l2 jpeg helpers in mxc-jpeg

 .../bindings/media/nxp,imx8-jpeg.yaml         |   84 +
 .../media/v4l/pixfmt-packed-yuv.rst           |   37 +-
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |    8 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   37 +
 drivers/firmware/imx/scu-pd.c                 |    6 +
 drivers/media/platform/Kconfig                |    2 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/imx-jpeg/Kconfig       |   11 +
 drivers/media/platform/imx-jpeg/Makefile      |    3 +
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c |  168 ++
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h |  140 ++
 drivers/media/platform/imx-jpeg/mxc-jpeg.c    | 2193 +++++++++++++++++
 drivers/media/platform/imx-jpeg/mxc-jpeg.h    |  180 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 drivers/media/v4l2-core/v4l2-jpeg.c           |   52 +-
 include/media/v4l2-jpeg.h                     |    6 +-
 include/uapi/linux/videodev2.h                |    1 +
 18 files changed, 2928 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
 create mode 100644 drivers/media/platform/imx-jpeg/Makefile
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h

-- 
2.17.1

