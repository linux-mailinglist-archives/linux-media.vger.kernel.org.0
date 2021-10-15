Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F6742EC09
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 10:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234324AbhJOIZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 04:25:23 -0400
Received: from mail-eopbgr10081.outbound.protection.outlook.com ([40.107.1.81]:53721
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233252AbhJOIY7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 04:24:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKxQsqK7gkXzaQh+2XwiX1ZEL/tQE7blNtYw13kehRtj3v4adfHvtXLNi74CIAZjF43OvhfVj8IkwsR5zlGKo3n8t1LQHTtQLhaS7g0BjES4AeB2rfQweeyRJCfDQ1/MiokWj1aaTOAmZsHHXpJiUPtDExRmzg5f5davKo3tcCz6XTTUlf/1sGcugv60Ka2ws/S2ynwPBEEtqeTP5LLdQKu69beUt5EeC2CfsEOso9j+0gF/2zGn8k+7PMt6F+ULNI6xLBJOijArNvo5wOGw4M0lcCr50ag2m/vEWnlKncCT5n/D3vK+53KA5d2HuDR3lF7VHjHEUWdWphJdo4QVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6juqTAtxRbPoZ2HWeqyMciMRVu/WL+Y0MgNXfytvjLo=;
 b=J0B5RtjS1IFYtYdeQwQlcT6JPA8KLqK7vk8Jqvjkr8kdzVDJuf1T+DDbbagWmp7Lxo1JHz5RikRFg2YzyqG5VEfNXkJQnk/9TyQrJi5HXzQFAvswLc6W1Ydx3NO3ceN45maPPLjx6zxZ9gUTeLFYgqQsNFgo1BsjV5+TDCH83nOP27rIGqK85l3ExcYle9FmZ0TtQhNhU9DpNaWZQmPHDHkCi0KhuCU3YT4sSJS78XvZUYVuarTLEyTME0dA3a6V2Q2eEizmMQGKbSeK62scLBe6BPop/+egLyXwxKpy7/DKS+N216JHEjTbQz7R2sJ+zF4ygTQcIogLnnboR0wqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6juqTAtxRbPoZ2HWeqyMciMRVu/WL+Y0MgNXfytvjLo=;
 b=ItaCrG/V12iCxSaxhPVrkZcL/TXG5JCAzHcGmIh5X1TsHrV/21Anngst7pWzVHc9d+ZQHS8Ic7+4/ntJQNfTurXMzXd/vTK57UV6WERqzHzfKR4RmdrCoI75csaLAbATFlaIj3usyENLku8c3x3rZMZ1T1gvT4PT3BjP7DF8R4o=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB5750.eurprd04.prod.outlook.com (2603:10a6:20b:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 08:22:49 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Fri, 15 Oct 2021
 08:22:49 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 00/13] amphion video decoder/encoder driver
Date:   Fri, 15 Oct 2021 16:21:49 +0800
Message-Id: <cover.1634282966.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SI2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:4:194::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 08:22:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56c9772a-a318-49b8-a964-08d98fb4f949
X-MS-TrafficTypeDiagnostic: AM6PR04MB5750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5750201E003FCD9B17CEF3E6E7B99@AM6PR04MB5750.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H0dTtx1oNa7GC414ot6FIMV9qXqC8NaSFBYjoSjf+y79MHFbo3WyKaL5+qQb+JnqXon3BbP3ZnqQhl+XaIzBcff29AsmSnCMtj6rDjVRpKeD8r+NUokbtVEoIw0yd/eMKjjTTTb9eO1zpH12qgHHTUY2DWz6bsPHvsxi8FCPIGPqQutmZ4hpVJbsGX0A+YfOPoUiRa0GGRPjyWAVyLvm41v9ybNIpvwwikdqQJzaUaKaXPiRKPuaMoGxHZgKJgbzZPqgwGwxCgDa0eYzjfj0SoHtQZfhRE4dMxmP/VWS6yPsaPJ2CXfHKY5V9r38d+TpYStfZxp4edCTlqJvgTo5q6OrusFyZkUBCm1wgxg1RVVrLFEuVZ5Pbq65EXbPU+ykoDB57e6rrd3Ypx0cMefXIMUHFE/Ud4VK6sWnzkzzIJLvGYHgoMFow18RqR80Fqcd8/ftpNSFJMWQnmmxWzPr22Fb55rbtdCc8uHifse5otCkfzJyauedazPXV9L2JnCJmDgdPXbcWqUMCYw8JI89Cv/vYWAW1ye3NMsCKVll3jJ6mdGmzVl0bEsqsD3d3aMq6uFOx6pjflaqkEOz549pEaXxDJ5C8C8W4I19QbXsa/OMYllS2MyxgfLY3m9ll+Yj6oF3rZfBPdmg7Y4HXDsampvOj9+yDPA1WCsbbxA5tzbYeavDXKG8vnPUCSw/XQ/ym6kElzjejAa71Lx0swSEzqW60BpSX3qikhfYTr0L+zOHSGasawg0Mu7gbPxgKiveGqLi1cQgAD7m0SEOUlHCxq6ECkX634IQBQxcbUwo/mQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66556008)(66476007)(7696005)(316002)(26005)(30864003)(66946007)(2906002)(4326008)(508600001)(966005)(8936002)(2616005)(38100700002)(5660300002)(44832011)(36756003)(956004)(83380400001)(7416002)(86362001)(52116002)(38350700002)(8676002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jLCApyMgIM+VTpyOtkRZUP9sRINheGn2DYiqG0ONqfhILZjo5hXQoWU+MSLo?=
 =?us-ascii?Q?iOdLHBitrbvUtXs/0G3abxion/t54Uzl34kC+JNnyfifTa0Ep315WlLjAovS?=
 =?us-ascii?Q?qtydnDwWE2Xy3w1jw9bAEJLXbMkZ0aqQWIJ7kHVJ1+rqj+sS6FMYnVzvqmgk?=
 =?us-ascii?Q?zFUO5i/q3UGbGjiv54uZrr9Tmar5gA+Gc66XKsd0qCdZ/Wiw2cljXvxsE56e?=
 =?us-ascii?Q?YfuO8E7o4RC4FrmDIShiydbEKRcCUmzPGwosrIbtGj9UXSnzgtz0ShWa2EEd?=
 =?us-ascii?Q?vPPlWYjjU8NjvQIWkqaWQ3jO8Gxx7GNxBJLqeM7uzY+b/DTJXX3kgfGdU6jv?=
 =?us-ascii?Q?Djxb9NjRzQ63cavxQCWsiPEY9iqf2XrtBBa7fNEeICN/bVPeM7cyfQ9MgGBJ?=
 =?us-ascii?Q?QWh+MJVN4Y/jtFZJjR5mA5SaFGjyWEHxB8uc5H5Gmx2d4pGymV4jFzXJJ+I0?=
 =?us-ascii?Q?k7lmKfig6f0D62335VuwwfuhcHTteaKG4HV/Ndw9jOzhxQkOGQAV+D2mrGTF?=
 =?us-ascii?Q?wiNBcztrxonuLYa4qNzWLKwtCyif7yE9mgikIbFuUZ3N+rBdn/NLJyznh7kg?=
 =?us-ascii?Q?0Wi+srSkEFUCH8Jz0oWjVhKDO2MxEZN2ExMHxZVVmtWEa8+3ZkF/Ojhqtn6t?=
 =?us-ascii?Q?+c6fBdG8W1KRb92kuAwSttdK0LEYUlLXlSp9RWwonCchn23mahPiBeRhVTEn?=
 =?us-ascii?Q?HqCdOE3z34NV5rutq+S0/KV27f6EZ78ZDf68zERs2lrk2e07gqmy7kFlSBY3?=
 =?us-ascii?Q?n7yoqQa/G4RfC1y/lU/h965xDXmZ6zjF6l+HCZUHwzHQco8+uhRRLi8GrwO+?=
 =?us-ascii?Q?lPmYYe8UNYR2W4N6QeDjygJkvX/006dGui1/nEvKyHfYhhaC/YciTGABx5HK?=
 =?us-ascii?Q?OW3KIEcAn6tOAAtV/A8MgXsP44ExIAixPkuMWW3i7AV4L8t50lKpMJwNi1oh?=
 =?us-ascii?Q?4tg+BYeZNJ04M5HQiQccHDUawsSHDDaY9DJJdmdpK4Cc1GnL7fmqMQq3Ymin?=
 =?us-ascii?Q?O9ePbwfQgL6fhQBP32gnQ3nFG92pVyPsHkqTlSXHapOlRd/Vm2tPp6Nn6nTC?=
 =?us-ascii?Q?dgciOg3mpOnAir/3XczhPPhQL+0+9SUpVhUao6irJyYP+uusTxGPYFqgu+99?=
 =?us-ascii?Q?JYSOLC9NyQngx5Wb4rUylvtrP9QHN1wm/65Pto75c2l708uA3E/+MAFhXOtk?=
 =?us-ascii?Q?7b4Yw66PoFxrAidvrPejyj5QrEgWIBzvtOwcsf9+cJBZJ8zvp1ebo2Vw7jw9?=
 =?us-ascii?Q?YzBVw1NfMqqMPUay/ru/ietVSta0b7/GujmBwQwP0TIAeJSgXaGIJnJqbS5m?=
 =?us-ascii?Q?fbcM1kkfoe8d6s30g9lJ1+xi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c9772a-a318-49b8-a964-08d98fb4f949
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:22:49.1613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpUeuiYXXh571wD48HPoYPyDFhQSqqxSUuNSXI39K/guNFL3NLx03RAhj6L4W4v/+r7+H24KTZR2LiOO4jZemQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5750
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


Changelog:

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
  media:Add nv12mt_8l128 and nv12mt_10be_8l128 video format.
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
 .../media/v4l/pixfmt-yuv-planar.rst           |   15 +
 MAINTAINERS                                   |    9 +
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   24 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/firmware/imx/scu-pd.c                 |    4 +
 drivers/media/platform/Kconfig                |   19 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/amphion/Makefile       |   20 +
 drivers/media/platform/amphion/vdec.c         | 1607 ++++++++++++++++
 drivers/media/platform/amphion/venc.c         | 1353 +++++++++++++
 drivers/media/platform/amphion/vpu.h          |  357 ++++
 drivers/media/platform/amphion/vpu_cmds.c     |  431 +++++
 drivers/media/platform/amphion/vpu_cmds.h     |   25 +
 drivers/media/platform/amphion/vpu_codec.h    |   67 +
 drivers/media/platform/amphion/vpu_color.c    |  190 ++
 drivers/media/platform/amphion/vpu_core.c     |  906 +++++++++
 drivers/media/platform/amphion/vpu_core.h     |   15 +
 drivers/media/platform/amphion/vpu_dbg.c      |  493 +++++
 drivers/media/platform/amphion/vpu_defs.h     |  186 ++
 drivers/media/platform/amphion/vpu_drv.c      |  265 +++
 drivers/media/platform/amphion/vpu_helpers.c  |  430 +++++
 drivers/media/platform/amphion/vpu_helpers.h  |   71 +
 drivers/media/platform/amphion/vpu_imx8q.c    |  271 +++
 drivers/media/platform/amphion/vpu_imx8q.h    |  116 ++
 drivers/media/platform/amphion/vpu_malone.c   | 1677 +++++++++++++++++
 drivers/media/platform/amphion/vpu_malone.h   |   42 +
 drivers/media/platform/amphion/vpu_mbox.c     |  124 ++
 drivers/media/platform/amphion/vpu_mbox.h     |   16 +
 drivers/media/platform/amphion/vpu_msgs.c     |  412 ++++
 drivers/media/platform/amphion/vpu_msgs.h     |   14 +
 drivers/media/platform/amphion/vpu_rpc.c      |  279 +++
 drivers/media/platform/amphion/vpu_rpc.h      |  464 +++++
 drivers/media/platform/amphion/vpu_v4l2.c     |  687 +++++++
 drivers/media/platform/amphion/vpu_v4l2.h     |   53 +
 drivers/media/platform/amphion/vpu_windsor.c  | 1222 ++++++++++++
 drivers/media/platform/amphion/vpu_windsor.h  |   39 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/videodev2.h                |    2 +
 41 files changed, 12179 insertions(+)
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


base-commit: 64cdf7e5a3aac0e7c9efdb079e74e22875b0419a
-- 
2.33.0

