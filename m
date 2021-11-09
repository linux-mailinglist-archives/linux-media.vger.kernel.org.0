Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5035A44AA27
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 10:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244685AbhKIJMf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 04:12:35 -0500
Received: from mail-eopbgr140070.outbound.protection.outlook.com ([40.107.14.70]:53249
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244664AbhKIJMd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 04:12:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPiH8RlwzhUZ1/5D1imdTQFTVxDOtUzHErxCegVAn/9BUOPQrAkzGoD1rBgY3hV5N993X8trXK94KhnCXMFJZ2F4/SDuxw4LSxdtJ+XvEc5pcKCoRTfsd6L7xkMQPKsWPsRO4nZXKneAujWrEtpcVpX+yMAKRkGls0vGwEhqbdGWmN9Ij+aMvMaL9Me1IKIQkZDOhtOq6Aqhe+os8Y/W6UalFVeQYSBviylsWyerXI0Xo6hcXjZqrhJiPO9FqKfl/buJWv0lf6jQzSTcSP5BP1gXTfruY1Jm6LuCsDZawGZkWagZ32a8hzq70rwDfQmKPOclwtyqaTiMa1ioRusB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgQbtnP9HuukHqBa926F9SpjZYJjs/9Y0TqGwR9PE8U=;
 b=CHy2QHQtO2p8V1jCFG4jjaDIUM9BHzmRojkISYHEI4hosNjSLMIWpY33BYKv+Z5A0bDt8/rQC0Eni5pFBJYBgLvwmMla7RNEuls0d3edhDg3+efImv6DugJjrN5GUEs+LBFcDcxtHMQaw3/BZQ56EuWo5y+TqJ09bKOCevNtWUOs5hlETe8elMbibk3IqvDbhRTd5TQ2rTr15ulMYR2jVsDXb0yc96mZVuVTL2FrUX14e9UoQJvGYmTICGELFqCB4/jsDp6MTLBN6D0Woh1b/erNSxNFgHSRJGU0uG2ek4JzLfAe9vxUlv/9QQCNB+7KCK4qfiQBQKAQChPp+Oxt3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgQbtnP9HuukHqBa926F9SpjZYJjs/9Y0TqGwR9PE8U=;
 b=W+qX+KhOzSuQsVnvhDBwH9qdghhUyIsQUUG+2LG8KSIPw1p5/wQ72SfcOd+C25fn0vvBGdLU0TScrCXyidEJYqZzMCOcqagXmGvYLenpE3LqX/Lu6RLbV660ljfWSlG72iUSlM6K0vcxhXONT3xE7n3SUvTQr3Kr1apBZTur6fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 9 Nov
 2021 09:09:45 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:09:44 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 00/13] amphion video decoder/encoder driver
Date:   Tue,  9 Nov 2021 17:08:59 +0800
Message-Id: <cover.1636445575.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend Transport; Tue, 9 Nov 2021 09:09:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc2f61ff-ac0e-492f-d632-08d9a360abeb
X-MS-TrafficTypeDiagnostic: AS8PR04MB8278:
X-Microsoft-Antispam-PRVS: <AS8PR04MB82789F04CF91CA77B593B4B9E7929@AS8PR04MB8278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DE4qKTVxEKSYO0qVBdQzb3wxqfn5J2zzEje07rARTSHmFNGGwQYnZw8N7WdG/lO4Ry0zrWtKf4SxCiqiZ5Dd0UOwlh5ROQfOG9XWiRiE5Tc8dLmL+A8czQqMzZE1sf+5XjoAccFw3WRtJT8CrjrqemYtc3iFC0zn7u7YOPB5gV0XcAaTpz00KpaPz04bZwxZlldtI9U0JxDsmwYfg5XHXUB7SWMqI9p3R4jfaftdlFdYmCTBIxiom/2yZXGzZfi2lnBis5rSFr1/kyQbNRaQXwzFwsuSUUsnDvrctgm42QkmAwLqEgvGDx9LZqmlBnSLWO+Ws5/H3K5g9EaSCv19sywUpKHgLPHHSkmwwq05zGmipFcAej5XBooHPWLhasmIXZPzPSbqaVThxgVP9IfmIftwe49MclSYsBXQQwLyJvlFj5NgTCs3t572R9eKhLW7HhqlTflYRwgHpMTMboj52N+crcvWT7sE9Bcxa3N/J7qAK0Eq+wRIeI8GCrwr2aNAfxajXqDA8vgBqtfo2Y5oA9CA8HdaY278DkFENo7Oitp3g/jXaCJFSed4zcNSRMBG4i5sX+gRMw57QI2ckdnFBv0wvnDpSfy5QLcrN8bdMaBYHVA4mj3wskApbT0pBFQrDVBByIuI5DgYuwSpa2IN8AnUOGftoIHQ1CuSQawNVp+rOnsik5V7rFQibiFHlM3AUSDvWND9NVS2PHxeAI6AoEen1KgC+3eC08/FJl8eaMTbLK57K47gt2JZc5PABFZzM2G/WIiMx2LRzkUUVbx4xO3CAwGp3hT5ylxmbihiiww=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(86362001)(508600001)(6666004)(30864003)(38100700002)(6486002)(956004)(4326008)(966005)(44832011)(5660300002)(26005)(316002)(7696005)(52116002)(38350700002)(2906002)(186003)(8936002)(36756003)(66476007)(66556008)(8676002)(7416002)(83380400001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u9KTYaDLV8zQ4HSDYOfI6M/pdomrZ7UzpePjNC7PV1POA9D9ViNNOWr7iHEC?=
 =?us-ascii?Q?dVhh0hqe39A3mVqDy666fEr8heFkBMUpSydobji56jH0OG0+uyEaE1nSfCQY?=
 =?us-ascii?Q?b3a5yCiykumM8DUveHKR+qZko9hzzCE4dmhEtcC8C9eqN8LCBt4l/JcW6ivz?=
 =?us-ascii?Q?d6j18EFN6qtY6kH4JZuGaINTIHANyCisRszBY0TgyddDOQQhmeLL/LhtyCuV?=
 =?us-ascii?Q?82MgRJuM68logg1VQW1lBgyDdeSpwIsLHKxsHO/uKnqatSfFlM+NnGF1fZpZ?=
 =?us-ascii?Q?hdYuzALwgsEzkeGep5NPGWTaPp4xktt31pTRQ/i7JZqM4fmx7mSOBBWxQ1/3?=
 =?us-ascii?Q?K2VfcHwCzxhRtpORR2jXa231OwW+I2gUZf15HpxsrSWghbc37SpDXq/C9xB2?=
 =?us-ascii?Q?ykmW1PHY+7lhFGFzlfK5N9PZVNHmz7BN1y4SwXKfbtyOnQji9M1hTxn8k71W?=
 =?us-ascii?Q?eA4P3ULQdAtJHU2qZn98K4egR7D4MZuzh/gjdPGFrKJzrzCZfzLycHNZuQig?=
 =?us-ascii?Q?RkXguT5LX+bP0qdmYKcqwrYhJeCQp6XMw1R/6E4nTVB5z24gKd76LGRzz6Hp?=
 =?us-ascii?Q?cpvN8ZC0qCxfvFY3kIypr4VQ6bF3lAjKfFwx0Ezw5lYYhHEJqGKYNYxkjmks?=
 =?us-ascii?Q?QfDTprjGgkPGSpS5TKV1iPwvuMYtsxTcqAwe3BZ6V9Qoqnv7S/HKt52dQ4RH?=
 =?us-ascii?Q?RokdWOLUfzjKrWrUrA0w1N8QFEpOe8uq/pEu3L1mVsSPMFlGXAmSrLhedtyC?=
 =?us-ascii?Q?F/zYsdwXxsnhwUzHQyxox1+DK4VVuMP5d6huisNPSovAhRWiA/0CQlGxsZoV?=
 =?us-ascii?Q?M5hhwuVS5zlKleDFtdbh4A6C4Wx/zeNT0Z325TC79fLUb2zRXbfOGb7U07O5?=
 =?us-ascii?Q?h6IxSRLBz8LSaKf4orHyyRbBjnsm/DpRLiwQ+B2XsiqDn21KlZnz8OmMkJ+5?=
 =?us-ascii?Q?dthRrsdJxU1N2ohbLiDUDECNirWcsy5Hr4IG+pjmFM949FZnOvh4J5b/wYpG?=
 =?us-ascii?Q?zeKHqP+7qRZ6TBiwAS9TiZpW1KNSwa+RIADgt8LAS1fsv5n+66p1sgMtM7wE?=
 =?us-ascii?Q?U2g4z+Uj1ogNXjEiCEFBk/znnE0HNoULe1Ro5kuz/oPRm8daTqByG3sV+KWu?=
 =?us-ascii?Q?IMEreIu4wAejY7ZA+umpSdd0cxiIJtYDx/eK8YDM0xJ4JNB91ALImyI58Tv9?=
 =?us-ascii?Q?+66JcXm+vBDdMQDK93Xu2zJaP4hzzpavRxv+S8vrISHoLMWzUWM5g3iowuNV?=
 =?us-ascii?Q?fzfZvUawKwdJP4K/Ugzi8LgIrJE0WRqVAbKczre9VnzKnjm2ZUawFyqjeKPR?=
 =?us-ascii?Q?6fsUoH13+LgmMxcINlhFvGClBiGdK14nOgocF70rbjiD+kaYteHY3GD9PzDp?=
 =?us-ascii?Q?cMe8bDgZT4yE48WOMjxvfXZDaB36fNgNHf/oQ5OgIHQMQN+gsTXh1Xi90OVM?=
 =?us-ascii?Q?te8mLBTUSOrcP8zk/ffX4mSFpwmEI5sV2pK10crdLgg3BxpLAum1kW9NWTMg?=
 =?us-ascii?Q?qpIt8Fikx2+D6G8LvaLjtOLME7D2Cqra4MPZeGA9tKv8GHs9oTCGelz8gZck?=
 =?us-ascii?Q?znwg9z4rMnylV4Yvy8PTQLz1bEt7y5Ej/nD2lOvmvoQMBQwXEIn/D2KDFmmp?=
 =?us-ascii?Q?daTzmb/ZfLuqX1ShTIQ2cVw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2f61ff-ac0e-492f-d632-08d9a360abeb
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:09:44.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rT0iZVtomGe9d/2IMCuzVhNkTQmP3AyVgGYq7WtC+Qn1NioitJ1kOcnL5zDXWFDIO6PSsmjZN78zIXNDVeRbbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278
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
https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/1252
https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/1098
https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/1099


Changelog:

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
 drivers/media/platform/amphion/vdec.c         | 1680 +++++++++++++++++
 drivers/media/platform/amphion/venc.c         | 1351 +++++++++++++
 drivers/media/platform/amphion/vpu.h          |  357 ++++
 drivers/media/platform/amphion/vpu_cmds.c     |  431 +++++
 drivers/media/platform/amphion/vpu_cmds.h     |   25 +
 drivers/media/platform/amphion/vpu_codec.h    |   67 +
 drivers/media/platform/amphion/vpu_color.c    |  190 ++
 drivers/media/platform/amphion/vpu_core.c     |  906 +++++++++
 drivers/media/platform/amphion/vpu_core.h     |   15 +
 drivers/media/platform/amphion/vpu_dbg.c      |  495 +++++
 drivers/media/platform/amphion/vpu_defs.h     |  186 ++
 drivers/media/platform/amphion/vpu_drv.c      |  265 +++
 drivers/media/platform/amphion/vpu_helpers.c  |  436 +++++
 drivers/media/platform/amphion/vpu_helpers.h  |   71 +
 drivers/media/platform/amphion/vpu_imx8q.c    |  271 +++
 drivers/media/platform/amphion/vpu_imx8q.h    |  116 ++
 drivers/media/platform/amphion/vpu_malone.c   | 1679 ++++++++++++++++
 drivers/media/platform/amphion/vpu_malone.h   |   42 +
 drivers/media/platform/amphion/vpu_mbox.c     |  124 ++
 drivers/media/platform/amphion/vpu_mbox.h     |   16 +
 drivers/media/platform/amphion/vpu_msgs.c     |  413 ++++
 drivers/media/platform/amphion/vpu_msgs.h     |   14 +
 drivers/media/platform/amphion/vpu_rpc.c      |  279 +++
 drivers/media/platform/amphion/vpu_rpc.h      |  464 +++++
 drivers/media/platform/amphion/vpu_v4l2.c     |  702 +++++++
 drivers/media/platform/amphion/vpu_v4l2.h     |   54 +
 drivers/media/platform/amphion/vpu_windsor.c  | 1222 ++++++++++++
 drivers/media/platform/amphion/vpu_windsor.h  |   39 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/videodev2.h                |    2 +
 41 files changed, 12277 insertions(+)
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


base-commit: 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8
-- 
2.33.0

