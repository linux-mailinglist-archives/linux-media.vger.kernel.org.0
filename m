Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF7B449C1C2
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 04:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236819AbiAZDKL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 22:10:11 -0500
Received: from mail-eopbgr00067.outbound.protection.outlook.com ([40.107.0.67]:47334
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230099AbiAZDKK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 22:10:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLr867TGJTJOZZGc3skof13vq5BugVOSgk83JrimsNy0YSjD6bUJusvJrhNxVt8/tiZ3tI7OZAxZJ6mN4xWYZoce07MdI3aXP/M4NvtrSQ9jzMk7ruYOQB6g2ofzjGNHHHiuE/MTOaVTU0sF3B++55DsH2YagR6y4N/YRSi3fEA/bihOLughvy05aB6OYnYQq9MIqVdT1DEA+2SGRjm1dvgwXzHCAcKYcHevVCWf1kwjBgBDdMl4FumfWuiU0NvLrhTbkOkmfT6XQB8tcZr9Co8i1oQX0U/OcaewrO+nGCMah0lpqMANPpRLeM/ktN4NID3mcAhNJdYE6ZPEle67Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8O2oMQl3fS6svq4C3b+RwbmBZ+rTp479m9PeDOkflIc=;
 b=T3XAd5Z7+WYRfPAqblGfrjUzdLu1TfLmQau4jNy9mmk5Q54xF0xPSDaaUjMpys5jE/QAKvqCGb28xBMSUVA8J49px+C4JCjIUnPqSjuoy/RFMLTLTqnR7SR86WZilBRhoDpKzbzujQ1X5X2hLcniKfAKRis/Ad0x9VGsAlRIcRqvUdcMbeAuTzvLdAqIcH4IQimCW1olz+HKQv5gXS1qNXqXOYbNgH/0dDTsMblXCHKZjom81kt+nhQvV1FavPnnBLQVgMnG/ra46hr+dZJ5fnOmazc4oUJYRxEuBic/rKgbGHSq5p8aaGA6TRwwPQOvOmZ8yBVBULuvZu9IlqlLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8O2oMQl3fS6svq4C3b+RwbmBZ+rTp479m9PeDOkflIc=;
 b=RxSuCOJKzT3VOfW3U2OEuDm9MlhPbj1RrBBZrVZULjVNdJRIbGo+/J7PM8R1KnN7jLlSbASkZZBLioZuZ9TAJPyAtbFc9NzaZjEnHk4BYqVIxPGeZmEcztMvFfUxqwW9sJlt3P9USvXAKIRD51Pq7USbySdNiPjH+amXKycKJBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3319.eurprd04.prod.outlook.com (2603:10a6:209:e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 03:10:06 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::3d7e:6627:fdd0:9d13]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::3d7e:6627:fdd0:9d13%4]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 03:10:06 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v15.1 00/13] amphion video decoder/encoder driver
Date:   Wed, 26 Jan 2022 11:09:19 +0800
Message-Id: <cover.1643165764.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0091.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::17) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f96cbeb-6d71-42e8-f1f0-08d9e0795a6a
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3319:EE_
X-Microsoft-Antispam-PRVS: <AM6PR0402MB33190B3D2A4F3BC64B0E61CEE7209@AM6PR0402MB3319.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZSlWbMPTzGB6ax7Hn4J6HmGsYJpcQsz0PWF2+Q7QgyUESWNLIfNXfPeF5EgQG5KDHh3XlY9rypMj8HOCm4bxCsokmh1EzyvGd7jb/gsJ1sLIPWRkiDQDpCRKauo5Mxdj49Bv0exp++SgZa0KQc+xRAvDm5OgIOxIF5/Xun5y5MveUNfiUfPJiQOdrmtZRWzDaPRNF3G1GMxcNOQeR9pg7DndpM7ypH9UrbJi6ps8nBsr4qt0RMzgTL/C/pvzE3oz/5bk8pEAUdzD0vS6R5dPE6sRohw+Z1SDwDIjswJ/8HrsyEKHusAf2mORlxzbmKH+iezEEIrA2Rv5EhO3MsCWrlT3SPo0UCaC6kO4lc1k0YS0s6SbaDwu6wo80VV5mD28FA6Fr/eE+Wt3mGCrtqojR6xiaVztDdpbMQIH0CvRuEYu65sNn76SugSf5aG/qHXJwKVQQE+VwS3sDC/Q0K4dp4N2uR7opsUjThWAarHdAm8ffyaekXdfb1sr6aU0XeiyQBV21/g/khQZfU0g509aSEpCXrHKs0u7iq057ptNTDCLDDAHlfH+M46B49iCUyHJrBcmMjSWH3IWV1MDFQQ6yWRtuDqBv0MjqFsyptqDmFyikUMRCuiabNGaGaZpqB7jJqUTiIPBj0a9QQvJieMI4jjix4GpgVhJYov3MWNLh1OgnbY2EwjNQLjRmzyHxKUimycTOM5wNnUnvkv8r5CqFbYxVvrTuet4BtgX9KK68KAZ8R4nGRHP5cLGlOkzfos90xwp1AK3dTB9NjRD0VxDXBdEPjIJ3z/Wa4DFi8IV5qw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(508600001)(2616005)(36756003)(316002)(966005)(186003)(26005)(6486002)(66946007)(66476007)(66556008)(8676002)(5660300002)(4326008)(86362001)(30864003)(52116002)(6666004)(6506007)(6512007)(44832011)(7416002)(8936002)(38100700002)(38350700002)(2906002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bKpVH7+ZshgGJ+XpFh3UzaOUMgIoZ6tyxqZM/KySPw7DnrVnJQ5GpkAOzSVM?=
 =?us-ascii?Q?xsUr4RnvQaFeiAp9o+IpTbGMdOv34TMux+aCNOuEWk5+8pnsGEo7/V0ayuPO?=
 =?us-ascii?Q?+/R6h9BmrdmM6bIv8KAlD+goVTzNP6JNdGMUnS7rXrwifN0PqL02CrSomnmm?=
 =?us-ascii?Q?VY9WUwIoiGpPRUgde96jR/GAIz+9vAMc/slp0AlQEgfQCGU1n+dHtLvp16Cz?=
 =?us-ascii?Q?oLvQ55sHhqhCpqoJwXyFAYCz3IRgP3YmVv25fybO5/giVYK+iNgCJoDG+Tkg?=
 =?us-ascii?Q?3gj6EEQA9NKMxcnF/zjLx7XsI5V4ADdjTTKukNH+HrAF/GBz+CZOrDHkTJb7?=
 =?us-ascii?Q?I47rv2EsPys6eXejK0jubMghsslHsAPs3hHhpnXVSr9g+64qKWU1nTSWb01i?=
 =?us-ascii?Q?fiBj8OE38zbkFxSV19tc5WbHFuYVHTuP6QDH3aj/P9vB1GXhONY0VggrCl93?=
 =?us-ascii?Q?XmPCwSvP2U6TQUZAfGjZXA41VT9IGfX88n9+iIp2FGNm9fA5uMNiDLy/3pnL?=
 =?us-ascii?Q?mOpJgrTv6LiMF2v8itzEQ8PbrUlDk22gA5TPnD0jxitwr6uBLUnWttkckylR?=
 =?us-ascii?Q?LGDbIfaElHwI+uJTsISNKlyAb+MTkWZuHQyu64pq/YGKavOmZ+QsE7vB9wnW?=
 =?us-ascii?Q?tY+VORkN+A91XV/ae8UvlX3dpK9Gg4DyddYw/Wwvz8QUHFEkJdCa3ieyYdzc?=
 =?us-ascii?Q?1a5rjjg0X4JJXVu8OwKTpZMRA99TvA6DgbRHSxHL3O0ol1l3DnXmhWOUPVSL?=
 =?us-ascii?Q?w6DVLA1QTptE4DQ/KIFpFvZMQDFZNqEHR2Z8uXCcgq5u1DGX65bdeuNbrNCB?=
 =?us-ascii?Q?QzlEk5M4UP2OtNWxmlqIx3wwvNKLsdIhREUWiwNn8w+rz63OZWwq7fNIYugq?=
 =?us-ascii?Q?Gd+cHkGgRJvDhOyappdqZJ9xObcd1TzCk4W5Y52CYBUIOsGwHFC1Db6syTyI?=
 =?us-ascii?Q?xtNFjucj+pHfchuGJ9H2Qm7OFySMn5bmZCCEdLb3kjt6KlmBUsgsKGgIxVwD?=
 =?us-ascii?Q?nw2YPPicqiyg4lVcG3wkjVsjABeq3E2AinB7qPG3u8c6db2Diiivx9C5jC7v?=
 =?us-ascii?Q?B6mNp0IG+bfyHwgsT0pTO51ETOIfD+4PnhGpfzk3Ubne5LSFXxzUl97g1CBj?=
 =?us-ascii?Q?JdtnInL6j2HDCF4La1p46jmEWNvRcgZG+vQ5El1fJo2N3IQrmZaN7J+xTSw2?=
 =?us-ascii?Q?wN7rYdWbqskzVrEVVRUBMAPAxT87SxZEFmbVtTps1OyC7OanQMam7qryrAD4?=
 =?us-ascii?Q?iXJngQc0582s4mAD9emmshYNIAAZwxuHcGcZ+xu/ymPAz7z1wvIPmP7hPWy/?=
 =?us-ascii?Q?z0KAbaO/vtwPYABOgkan3ASNf9AsosMFtBpr2NlfZbTxFWPbvhaJAkK/4szc?=
 =?us-ascii?Q?fDjYPbtYnuWl19NLLgLUHFQudxrkvVJ+sGaVHN0e52RgI5PqYWnvZCRF/uC0?=
 =?us-ascii?Q?Os1fzuViOwqkFz6mUyBR+u2uf9i43ruIPSU/eJTwoF9DVKtjAQVVZm1QuO4f?=
 =?us-ascii?Q?cEpagk4krZbYr6K2Ou5nrB2cZQq2KUXn8FNrCsPGxMMmjKgq33MzacVwdjBD?=
 =?us-ascii?Q?wKPmgdF8xhjj+8+zII5ShpU27tJk2FwlwqvZNrlxESVb2XQXfwAXea4Mixga?=
 =?us-ascii?Q?SFZiSyVTIVLKGnGu5wgyL34=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f96cbeb-6d71-42e8-f1f0-08d9e0795a6a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 03:10:06.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ysx5WbPNxsxZFT7JBHYFiRZATSHpJWDn/fRXYekeIHhM2xS3E3PoAE4koWHinSGJ1FSY6NykA4/5FN8DLdqWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3319
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

This driver is dependent on vpu firmwares.
The firmwares have been submitted to linux-firmware.
The firmware patch is since commit
b563148fd28623f6b6ce68bb06c3dd3bd138b058:
linux-firmware: Update firmware file for Intel Bluetooth 9462
(Fri Oct 8 16:30:14 2021 +0530)

and it's available in the git repository at:
    https://github.com/mingqian-0/linux-firmware.git

for you to fetch changes up to bb3eee4f99589d4910dee4c053a3a685546b5dbb:
amphion: add VPU firmwares for NXP i.MX8Q SoCs
(Tue Oct 12 15:09:57 2021 +0800)

encoder is tested with gstreamer
decoder is tested with gstreamer, but the following patches are required:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1379
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1381


Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>


Changelog:

v15.1
- include linux/vmalloc.h to avoid build warning by kernel test robot
- add entry in MAINTAINERS alphabetically

v15
- fix issues detected by "checkpatch.pl --strict"
- encoder add ctrl V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE

v14
- fix some errors according to Hans's comments

v13
- make a workaround that avoid firmware entering wfi wrongly

v12
- support reset decoder when starting a new stream
- don't append an empty last buffer, set last_buffer_dequeued
- improve the resolution change flow
- return all buffers if start_streaming fail
- fill encoder capture buffer's filed to none
- fix a bug in calculating bytesperline

v11
- fix dt_binding_check error after upgrade dtschema
- remove "default y"
- add media device

v10
- refine vpu log, remove custom logging infrastructure
- support non contiguous planes format nv12m instead of nv12
- rename V4L2_PIX_FMT_NV12_8L128 to V4L2_PIX_FMT_NV12MT_8L128
- rename V4L2_PIX_FMT_NV12_10BE_8L128 to V4L2_PIX_FMT_NV12MT_10BE_8L128
- merge two module into one
- fix kernel panic in rmmod

v9
- drop V4L2_BUF_FLAG_CODECCONFIG
- drop V4L2_EVENT_CODEC_ERROR
- drop V4L2_EVENT_SKIP - use the v4l2_buffer.sequence counter
- fix some build warnings with W=1 reported by kernel test robot

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
v4l2-compliance 1.21.0-4859, 64 bits, 64-bit time_t
v4l2-compliance SHA: 493af03f3c57 2021-10-08 17:23:11

Compliance test for amphion-vpu device /dev/video0:

Driver Info:
	Driver name      : amphion-vpu
	Card type        : amphion vpu decoder
	Bus info         : platform: amphion-vpu
	Driver version   : 5.15.0
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
Media Driver Info:
	Driver name      : amphion-vpu
	Model            : amphion-vpu
	Serial           :
	Bus info         : platform: amphion-vpu
	Media version    : 5.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.15.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : amphion-vpu-decoder-source
	Function         : V4L2 I/O
	Pad 0x01000002   : 0: Source
	  Link 0x02000008: to remote pad 0x1000004 of entity 'amphion-vpu-decoder-proc' (Video Decoder): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
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

Total for amphion-vpu device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 0

# v4l2-compliance -d /dev/video1
v4l2-compliance 1.21.0-4859, 64 bits, 64-bit time_t
v4l2-compliance SHA: 493af03f3c57 2021-10-08 17:23:11

Compliance test for amphion-vpu device /dev/video1:

Driver Info:
	Driver name      : amphion-vpu
	Card type        : amphion vpu encoder
	Bus info         : platform: amphion-vpu
	Driver version   : 5.15.0
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
Media Driver Info:
	Driver name      : amphion-vpu
	Model            : amphion-vpu
	Serial           :
	Bus info         : platform: amphion-vpu
	Media version    : 5.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.15.0
Interface Info:
	ID               : 0x0300001a
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000f (15)
	Name             : amphion-vpu-encoder-source
	Function         : V4L2 I/O
	Pad 0x01000010   : 0: Source
	  Link 0x02000016: to remote pad 0x1000012 of entity 'amphion-vpu-encoder-proc' (Video Encoder): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
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

Total for amphion-vpu device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0

# v4l2-compliance -d /dev/media0
v4l2-compliance 1.21.0-4859, 64 bits, 64-bit time_t
v4l2-compliance SHA: 493af03f3c57 2021-10-08 17:23:11

Compliance test for amphion-vpu device /dev/media0:

Media Driver Info:
	Driver name      : amphion-vpu
	Model            : amphion-vpu
	Serial           :
	Bus info         : platform: amphion-vpu
	Media version    : 5.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.15.0

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/media0 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 6 Interfaces: 2 Pads: 8 Links: 8
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for amphion-vpu device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0

Ming Qian (13):
  dt-bindings: media: amphion: add amphion video codec bindings
  media: add nv12m_8l128 and nv12m_10be_8l128 video format.
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

 .../bindings/media/amphion,vpu.yaml           |  180 ++
 .../media/v4l/pixfmt-yuv-planar.rst           |   28 +-
 MAINTAINERS                                   |    9 +
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   24 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/firmware/imx/scu-pd.c                 |    4 +
 drivers/media/platform/Kconfig                |   19 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/amphion/Makefile       |   20 +
 drivers/media/platform/amphion/vdec.c         | 1695 +++++++++++++++++
 drivers/media/platform/amphion/venc.c         | 1365 +++++++++++++
 drivers/media/platform/amphion/vpu.h          |  356 ++++
 drivers/media/platform/amphion/vpu_cmds.c     |  436 +++++
 drivers/media/platform/amphion/vpu_cmds.h     |   25 +
 drivers/media/platform/amphion/vpu_codec.h    |   68 +
 drivers/media/platform/amphion/vpu_color.c    |  183 ++
 drivers/media/platform/amphion/vpu_core.c     |  871 +++++++++
 drivers/media/platform/amphion/vpu_core.h     |   15 +
 drivers/media/platform/amphion/vpu_dbg.c      |  495 +++++
 drivers/media/platform/amphion/vpu_defs.h     |  187 ++
 drivers/media/platform/amphion/vpu_drv.c      |  260 +++
 drivers/media/platform/amphion/vpu_helpers.c  |  413 ++++
 drivers/media/platform/amphion/vpu_helpers.h  |   74 +
 drivers/media/platform/amphion/vpu_imx8q.c    |  271 +++
 drivers/media/platform/amphion/vpu_imx8q.h    |  115 ++
 drivers/media/platform/amphion/vpu_malone.c   | 1625 ++++++++++++++++
 drivers/media/platform/amphion/vpu_malone.h   |   44 +
 drivers/media/platform/amphion/vpu_mbox.c     |  118 ++
 drivers/media/platform/amphion/vpu_mbox.h     |   16 +
 drivers/media/platform/amphion/vpu_msgs.c     |  385 ++++
 drivers/media/platform/amphion/vpu_msgs.h     |   14 +
 drivers/media/platform/amphion/vpu_rpc.c      |  257 +++
 drivers/media/platform/amphion/vpu_rpc.h      |  456 +++++
 drivers/media/platform/amphion/vpu_v4l2.c     |  720 +++++++
 drivers/media/platform/amphion/vpu_v4l2.h     |   55 +
 drivers/media/platform/amphion/vpu_windsor.c  | 1169 ++++++++++++
 drivers/media/platform/amphion/vpu_windsor.h  |   37 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/videodev2.h                |    2 +
 41 files changed, 12102 insertions(+), 3 deletions(-)
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
 create mode 100644 drivers/media/platform/amphion/vpu_drv.c
 create mode 100644 drivers/media/platform/amphion/vpu_helpers.c
 create mode 100644 drivers/media/platform/amphion/vpu_helpers.h
 create mode 100644 drivers/media/platform/amphion/vpu_imx8q.c
 create mode 100644 drivers/media/platform/amphion/vpu_imx8q.h
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


base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
-- 
2.33.0

