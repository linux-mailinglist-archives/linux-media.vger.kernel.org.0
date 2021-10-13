Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3DF042BA3D
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 10:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbhJMIa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 04:30:29 -0400
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]:63458
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232147AbhJMIa2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 04:30:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDY0HmghSrCKQJoEdZ2zw8jVhaj8mS46sV0LcxPBzlQ7R3YKW2EUmXhkV4mHUUiIfLVjiiuVwfVsAVpYe7mg43xFxnuNVBaofVoZbp/XxSDu6dq/jkeqVR4Piv5qskqjF6KO7tujtBKLj67KcfDLezNGIL7MyDEJ0g8R0xjE0xwtoPnsaq/rMjte5I+PYFC9EqvtS6FUs734liMjKWnnJ9lmm+5+PnGVBsQ/9nxIT1/X7cEF2T9AW0vKOPtOqPEdaMX7WjEqHXIla+yus3y7Hyv30XkTIkPCvZ2+6BmmLkHFPLlKthyvkbdxCHq0pblV2IJXfI2dcxndUTrskHJnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8WfWr9wNO3UXdwAgumP47Yw0i1cY6+Zm/KkGfozz7A=;
 b=CpiWjQOzh0hYZqd9adnDYjJDZgKWeErUaHMc9UY+UOqdAQXu2jvJw8OBET1gyOrSB6+j7UgrhDv6EuS8vNM6rJVF9bZyVzrigZMZ8zdi4NARvu6h1kAmTzi3MdjPFSZO2hCMlkWXHYkFQxjyi2sCAE9Htza12hQztUXo+SN81FeBY/ozNcXTLw+lc60ONqzh8ulQe4un4E9rrR+WNnVXdT8zySk4kUzUvqDLYH0c3o2uX2iWFetmOd/hyilffqYzTmTrTc7PwU890hOgRNGdppxAVPbrmKm8tDr5sajtj/2f4kzEWqZsYUejiWuPstZBzNhVW85NYpwXSToa1KIDgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8WfWr9wNO3UXdwAgumP47Yw0i1cY6+Zm/KkGfozz7A=;
 b=Edhm7I9NyDwtR4danpDKyYCGnOpaa7NjSJg0iydoptezfckT4hdnSHrPH8sXXF5Y2MOtkNhmWtPn41l7VlKmNm41XVAVdqe+FrtW4a97/FyUzSY5tRYfS2e2fmmUfHAWUJg69CMo5vMKhkm1a9x81ZDigwYNLP3kl8ubQi02viU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4789.eurprd04.prod.outlook.com (2603:10a6:20b:7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Wed, 13 Oct
 2021 08:28:23 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 08:28:23 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 00/13] amphion video decoder/encoder driver
Date:   Wed, 13 Oct 2021 16:27:16 +0800
Message-Id: <cover.1634095309.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0121.apcprd03.prod.outlook.com
 (2603:1096:4:91::25) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR03CA0121.apcprd03.prod.outlook.com (2603:1096:4:91::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.12 via Frontend Transport; Wed, 13 Oct 2021 08:28:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a3f7aef-852f-4b7f-fd6e-08d98e236b7f
X-MS-TrafficTypeDiagnostic: AM6PR04MB4789:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB478963985DC8A8615627129DE7B79@AM6PR04MB4789.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BazQqrV2ySORSHcadUdOWxc6Kd1DxmLQNzMbdEyE0x1LF31+Ws/k8IvYdabVm/jVb9VPjzQUdPoGMBB1pvt5U2XrYftyu/sVAw8SYXusH8FBFgcyDPkcWbxJoWPrxF4YZrdrMsNQpOyQCzs6w5qaej/wQ8n3wbWdSLSdA8Q/h4RPY6BA/hib+0y+Ywz2Pm3CEHlcYfb//YE8S7K3TZwwT6aDiBKDx+kNQII9jvw8gp/RnUbhBlKriv6Ly1Zhr9P7jISwuODLC7d33MqreiwIvV4FpIqx4w8aZwuAiCY4CQQIX0uZOYUe6u6z/oHpudfxCcfRxFq5zcMSfgi7d6ddzYhtrGWI4eaJFhpYctJu4VViWAS9wiGtNrLzX+Fz1E/ErlLycnB2gvLaCzFXpMvsgTLzFFA/GoAyBEB/obBHTrCV0TAvGCAJO9VUUxRgTwuIE4aYVt++wMiBK8NZHMpuLQC+PL1TZJT7JRStVYnTOySU7uGpTUDDM+BA/OXUMOXCi8HzTIXwj3yrMHl1BRZzkCm/6D+aJmnczhqXPNfhKzQGs479IBrrBMKKDkOlH9EPQ8AAE73slQPxW1RCgxWxb1RhVGtutOBNj4TcLuG4cCCR9YnOdL3gPxNTUu7YKOVXeRmm33WQbfUFRgGyR+ar/ECXVh9n+2nP7L1alTjO8Ok6KM2Ug67jRwf3mYdeMraePd57y7GL7H54WtL7sf3+baxvW0xzRseFa78CpA3+ohOTWgn209h3+iE9LNmpJ5sBq8wGmoUUdySDs0OGkdqUtLonBH7iUD4pOORvtX7/ayg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(36756003)(83380400001)(186003)(966005)(2616005)(66556008)(66946007)(26005)(956004)(66476007)(6486002)(44832011)(316002)(7696005)(86362001)(30864003)(6666004)(508600001)(52116002)(8676002)(4326008)(38100700002)(5660300002)(7416002)(38350700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j8VRHUKYDnl1g+D3mGehaKvt0/DKPepduBsxpcgaF5v7nQzd7bi2xeQ0dY03?=
 =?us-ascii?Q?kbvEv1u9+ZkVKzqpAnn3JiE8Cz1bOnaCtjazNoGmQ5QtlFoyiQSSlvg2QCIk?=
 =?us-ascii?Q?uidSVASieU4J9i2nFavgZpezPNTEwUdwsRmFnrbZ8oFb/lbJGH5y7s+fAt5r?=
 =?us-ascii?Q?/TYVkRIbMoqyqyQYTffwMSb1imZ71voPZRiLm+vuvoaVrw7+113Bsjf42ZWS?=
 =?us-ascii?Q?2QjZI6yzLc31iTkC4qemYjOhwEk47XO0gpBiRwX2kNrz1Q21U2s3GZx9jS74?=
 =?us-ascii?Q?/N0lkHM3ZaYPRQ+7pB9fl2Tx2W/PfN83fH3dmFu/TFt5l/k4sQcN+glHiACT?=
 =?us-ascii?Q?u8xIyUyua5KHQvj1FPzD3mZO5wcPO4nP0zRF9RHZ9rnwLPQ169haWZ68mZcE?=
 =?us-ascii?Q?heb03B1h2DOKmXinuEyOoE42nXhV9fcJ/MYhrKGhyufh5FuoXEhaBtOdRvHs?=
 =?us-ascii?Q?eM8ce7BQsSVrEntMkxo8yksbKOn6OpTrYdsnEW4knvsVzCdvMdoJyOpiCmXh?=
 =?us-ascii?Q?sGBgp8sljnH01m6OXEgAO8vW8/axhkiyOd+Xw+xWZqynQYZncMYNK4cD5FtK?=
 =?us-ascii?Q?omSpDJa6QVdL7i8yboOmPP6WPdn4ng6qyZFn5UA+5eLKfGpbHGRoK5E36HWh?=
 =?us-ascii?Q?VpSf9tyiNa5X7uZATP43lknUkKIcVVV4PkkmMpN7OpsRQucDMMuCMi8h/N5s?=
 =?us-ascii?Q?tXjTUgXFoc+Tf8/p7vG6rywkvEC1/+H7v0kPwmYYcaZ9mcCJpA86cYstCke6?=
 =?us-ascii?Q?06F9CJPJDrwuO/oQ5pahYzl79b/bJXjIxbxj9ntChw9fhSHavbofPfvcPIEo?=
 =?us-ascii?Q?RPUalYHUk2MRqA4DuESP6yVFLv6+uyZmwsCccgTo6r22o6xe0bCZA7BCeWz/?=
 =?us-ascii?Q?SvjCewjmNBmRLLBp0PF4uF7SiyfSoBEGKBjUMgeb6Lj3bSGTyiyM8XbNxJLn?=
 =?us-ascii?Q?rPr6VvS4dFWO+p7sfsZK6eRKouDus6ifEsd3mzg4aA2+xSk/vODE9cCCqXWe?=
 =?us-ascii?Q?hbHEPUo9M2S++Ti1FzqRWG23RbmN685UarPgMXvvM1ixHr2F6xNcGb3k817Q?=
 =?us-ascii?Q?WruQXxpmIF3qPV6p70R1itBC5dWjIP5vDD3s540WmlF76BkQvGOYu4XzpxH9?=
 =?us-ascii?Q?LrRFOD3gzZKvK6x+6iiGap3WO/BbIiRoWgNA6c5RdwD5S/Wi+TbuGiGylW1E?=
 =?us-ascii?Q?bZwnfEGteL/6TbMxxZAyvrJA50+6NFbkwXnz99hhetgg4MqQtK8Vl1P4LaZN?=
 =?us-ascii?Q?thfYKdJ/rqcZEY/VmU+d0ZTiZz2g3HZyyvVmF/XF2VlYA4XYCUPTXzxB5vqd?=
 =?us-ascii?Q?eBIYQ/rtuMvAV5cXLygWmk6d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3f7aef-852f-4b7f-fd6e-08d98e236b7f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:28:23.1013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmP3/puJBocgZhbd+2j5JdKsZK8BVcintZJjF5Mq+gMf4oiJkBgmIz5V7zIuJJzA7xLA/Rif0dXp/D5mm7lhOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4789
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

 .../bindings/media/amphion,vpu.yaml           |  178 ++
 .../media/v4l/pixfmt-yuv-planar.rst           |   15 +
 MAINTAINERS                                   |    9 +
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   24 +
 drivers/firmware/imx/scu-pd.c                 |    4 +
 drivers/media/platform/Kconfig                |   19 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/amphion/Makefile       |   20 +
 drivers/media/platform/amphion/vdec.c         | 1634 ++++++++++++++++
 drivers/media/platform/amphion/venc.c         | 1370 ++++++++++++++
 drivers/media/platform/amphion/vpu.h          |  344 ++++
 drivers/media/platform/amphion/vpu_cmds.c     |  431 +++++
 drivers/media/platform/amphion/vpu_cmds.h     |   25 +
 drivers/media/platform/amphion/vpu_codec.h    |   67 +
 drivers/media/platform/amphion/vpu_color.c    |  190 ++
 drivers/media/platform/amphion/vpu_core.c     |  906 +++++++++
 drivers/media/platform/amphion/vpu_core.h     |   16 +
 drivers/media/platform/amphion/vpu_dbg.c      |  493 +++++
 drivers/media/platform/amphion/vpu_defs.h     |  186 ++
 drivers/media/platform/amphion/vpu_drv.c      |  236 +++
 drivers/media/platform/amphion/vpu_helpers.c  |  429 +++++
 drivers/media/platform/amphion/vpu_helpers.h  |   71 +
 drivers/media/platform/amphion/vpu_imx8q.c    |  271 +++
 drivers/media/platform/amphion/vpu_imx8q.h    |  116 ++
 drivers/media/platform/amphion/vpu_malone.c   | 1677 +++++++++++++++++
 drivers/media/platform/amphion/vpu_malone.h   |   42 +
 drivers/media/platform/amphion/vpu_mbox.c     |  124 ++
 drivers/media/platform/amphion/vpu_mbox.h     |   16 +
 drivers/media/platform/amphion/vpu_msgs.c     |  410 ++++
 drivers/media/platform/amphion/vpu_msgs.h     |   14 +
 drivers/media/platform/amphion/vpu_rpc.c      |  261 +++
 drivers/media/platform/amphion/vpu_rpc.h      |  463 +++++
 drivers/media/platform/amphion/vpu_v4l2.c     |  633 +++++++
 drivers/media/platform/amphion/vpu_v4l2.h     |   53 +
 drivers/media/platform/amphion/vpu_windsor.c  | 1222 ++++++++++++
 drivers/media/platform/amphion/vpu_windsor.h  |   39 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/videodev2.h                |    2 +
 40 files changed, 12103 insertions(+)
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

