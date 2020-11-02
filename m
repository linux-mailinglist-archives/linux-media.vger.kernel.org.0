Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275792A233D
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 04:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbgKBDKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 22:10:04 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com ([40.107.22.83]:60192
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727461AbgKBDKD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 22:10:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3o8Sp5MrWNpJr1AYoEFwZqlJ/Dp5Bu5sQYw9kJQ6RlUUt58djglwp47VorCMb3AqZ+veNXIGB5I5XT7Ff99n7ut07PFC29UR8bq9QQ0eR2q8K5GUACWdff1vS8+kGFYUB4Fd2vvGkcyMnZ0gEbAPd4hUwXoHtH8PKG8EZY6fGYkLM098gRDRcDNbjK8XVV25pI72OAHm4dkDPtDgDfI83e4Is7Ldlne5N/MWaoG82PsX/51SDao3F4Xn+OaeWJUQCUHJ58B29ibpo0tk8stg9pqFzCfHhTVOguVlOXnqE1hqLsP3LnqzmhiLc1vhs0uHtws1t4Rn4Q0m7Xy69xdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XFgT76RtJl62h/8jL+biojEkfjxuhwluDM0UL/vVMs=;
 b=lB4LDeeLdopsKk41niO0rzsH8QnejhsDxYVwLSB/KI4X3Ca9dRfbR7S9uWYzaHe6IkTS1kkQlUt+mNE29FqK/bvxR8fu8MzcaGuZh2himrQ9FwPUX8XbCegiOhWE6t4m366/TooWN7T3UFLyL5lz+D5VDXJ2f3y4rOFee3OW7KnjUbt3KTELUzxLP8w/DqKNLSpG1oOflMdhcFzqKg5d0P3UAi8eonDgOgVrEgrl31WpjWfY76VJ8TNonY4+6a5G+cjgFVnSroDMz+2Mym31aXeZununubnX9pyUXAsgtHikQYK/YknYMMDOhqc+jQ7Pn7j46D9OE/rDLrRB4PwWCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XFgT76RtJl62h/8jL+biojEkfjxuhwluDM0UL/vVMs=;
 b=fgE87bpYwNJ6eXOqRKw3x3Pon/S5Xh1FWxjFQCbhAxKkCUMhTFVdFYNYfnXSLDsWbk4vhsMUOpeFKkv0GHRA6oHleLX/UJlijZd4eR6W2oUTKcnzsxl3MbyQU+QU1V7evrrIHGTpawdLWNgJzvyilpaCIvKlcH1dLupL6+BbVD8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 03:09:56 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 03:09:56 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v4 00/11] Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
Date:   Mon,  2 Nov 2020 05:08:10 +0200
Message-Id: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [86.124.170.94]
X-ClientProxiedBy: AM0PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::33) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.170.94) by AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 03:09:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9cef109c-9dba-4427-0c60-08d87edcc69c
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB51737EEC5E4ED5CDEC33BF15CE100@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5frCuCz5qiplsLpXT5Y4LKOXd68HHUOLP83S1IWuhDmsG45mLLHHvroxg/gWF+gux6mwaQd4iDcLtTmDIv0k2EPwS45RZHUe2zIClDSZJQl391YuUxpIPJgKm/tZNQ5vp4o0YckseABDl8ZrkKCtDNs/WSgbMJAR5hBXF7fWu4O93OLdHGSaWWT+MmoeumVKVHDwSrRumBOgKjlo9vSpAEJN8pmMZgwWJdf6P1bFohmDj2Rz3ysT+heA7wFPFpAbdvqz7IQJqbo7VvNFABdSbt/tvTloFBEMzkKVla06cawyWNQyAicttWh/mfB+LYYbr0v+4QVBMz1oXl3oRF3L8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(478600001)(86362001)(16526019)(186003)(8936002)(83380400001)(6512007)(6666004)(26005)(2906002)(6486002)(316002)(4326008)(66946007)(8676002)(52116002)(956004)(6506007)(1076003)(66476007)(2616005)(7416002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: PLjBT+KGOpujI1kLcJufL35zIcef1vAFCWkiB6FsROoVZ458Q87U2Abpph0RRB0hYMuHgZ/8g/KvNB0ToM6ob7ItxSlnCnBy8zkd8n3JA2TVYG6RIoy/32AhKT72hPXH3DjafZe4mHvzee35BNioLw72mEIU3nKHmmbc3KKz3j314fDvoleOaqkZgzzXss9v44FsQbicMfT3yazW3M/sG2Kw3cL1jyM5DhFmJfVMJXg2z7ZYWENZYEZ1Au4XF/80iskhw/+44cD+7bX7WSVUijfByu47YPtytXnpziIE2apGxd8veTvt6wKBJ5sHC/O/BR3csiS2HGIaJBT2DFqmJGuYX1LyJQo0ebA+52mX+OGtppcQIVUFCzebGqwmWDnaQ/WUl0mMi4+E1x6smnc4sXIibf/UoEuGO+z5SE6IC+Bp6Hwm+WLHWhNj2MBGGAanlWvuAeKiQKMPrU4QqgJK3Xxawdpq5bcVxp4zicbFRI1Tbb3MUc7Lm4WjKE19meTJWv8mdTAfOdIqaraDNvXPjQv0XTSI/0fXsy8Bhv8goltS5IOczuWhrj/G+3UF3TYnh4VCXYBkdiF7Yjym6U+o93vP7jUjhSOoMzM8nkTrSupgUA136MJew83Y7Xvf9wczCDsnDx26HIbv+ApE7P+d5A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cef109c-9dba-4427-0c60-08d87edcc69c
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 03:09:56.5594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8hwYKjPjES3RNECUd+hH18acrtidvxWxVxLYPnSeOv5jdgBB8AEXJF4oUlnBcxXHXDjPf4clG6tcLVMv6bwow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Changes in v4:
The main change is using the common jpeg helpers in imx-jpeg
Summary of changes:
Patch 1, 2, 3, 5, 6 - no change
Patch 4 - small update: VFL_TYPE_VIDEO-> VFL_TYPE_GRABBER and 2 typos
Patch 7 - new, fixed a problem with v4l2-compliance streaming tests on decoder
Patch 8,9,10 - new, changes in jpeg helpers.
Patch 11- new, use jpeg helpers in imx-jpeg, as requested during review, requires patch 8

This patch set adds the V4L2 driver for i.MX8QXP/QM JPEG encoder/decoder
and it's dependencies.
The driver was tested on i.MX8QXP, using a unit test application and
the v4l2-compliance tool, including the  streaming tests for decoder & encoder.

The output of v4l2-compliance (stable-1.20) on i.MX8QXP, decoder & encoder:

root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance-stable-1.20 -d /dev/video0 -s
v4l2-compliance SHA: 6c415a11fceb32067cdb5c2e33f90dbf018182a4, 64 bits, 64-bit time_t

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
 
root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance-stable-1.20 -d /dev/video1 -s
v4l2-compliance SHA: 6c415a11fceb32067cdb5c2e33f90dbf018182a4, 64 bits, 64-bit time_t

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
root@imx8qxpmek:/unit_tests/JPEG# 


Mirela Rabulea (11):
  media: v4l: Add packed YUV444 24bpp pixel format
  firmware: imx: scu-pd: Add power domains for imx-jpeg
  media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
  media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
  arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
  Add maintainer for IMX jpeg v4l2 driver
  media: imx-jpeg: Fix v4l2-compliance streaming tests on decoder
  media: Add parsing for APP14 data segment in jpeg helpers
  media: Quit parsing stream if doesn't start with SOI
  media: Avoid parsing quantization and huffman tables
  media: imx-jpeg: Use v4l2 jpeg helpers in mxc-jpeg

 .../devicetree/bindings/media/imx8-jpeg.yaml  |   83 +
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
 drivers/media/platform/imx-jpeg/mxc-jpeg.c    | 2185 +++++++++++++++++
 drivers/media/platform/imx-jpeg/mxc-jpeg.h    |  184 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 drivers/media/v4l2-core/v4l2-jpeg.c           |   52 +-
 include/media/v4l2-jpeg.h                     |   16 +-
 include/uapi/linux/videodev2.h                |    1 +
 18 files changed, 2933 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/imx8-jpeg.yaml
 create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
 create mode 100644 drivers/media/platform/imx-jpeg/Makefile
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h

-- 
2.17.1

