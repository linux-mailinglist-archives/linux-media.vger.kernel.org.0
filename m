Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 827CC2DABCE
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 12:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgLOLUF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 06:20:05 -0500
Received: from mail-eopbgr130055.outbound.protection.outlook.com ([40.107.13.55]:20100
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725535AbgLOLUA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 06:20:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+qYrSbYxkAP9hHDKQJPvFUiWcL1scTL+kR8zUPJYtGsOPtLXuffUbX/eLkRnt2C/kAIzGKr6YyR0/L6SppnkGvXSf0mjxiCuiP8bIlW1ibdnosWbJurcYJ5vWmSFDoV8WxL83o43/WU6iBHWxmIzku5+KmYOIZnZIgS1OAGL+5SfoAe6xzsod0Aogy6phaezzec7pgAkP72Tik4V19f9giWPpn3tJwG7Kj1nAhIQ1qzffn7LPl6gAHblGP6VAacXa011ez8GNL3NpIfh2USFy8Er2ghbrV5UhyttgnuK6ywBBJRhQdr9RJ6281hZdSk6ogVftANTBLOsNYsUc4zpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00uPYq4FtUPWwBUcD/h17YgM3cTVg4TaN5h8Wl7vukc=;
 b=UUI4nVbRnVtXq9TyUrqXds81WBiFbNKkpP/8NlaJNcRjhxKgYXZe9NewwtBM8q1eRX/GVrRqlfAqvBp5GAhEvQzZvugE4PDN2T3GpLv64J33hVzZLvCFSmbUuCZStHL2aJ3q64nzQSB5A45A6Qfz3loFJNUEa0qi4i7uRSPYAZf2ydTPv9/N+euRpJQKYmA3f8BcgMDiaVUCqgcRIa14bXkeA4E43wWV5LMUtw+oDO2aesFFSPBiS8az5jRLuCy7U4iRQT8KuD1ZmJde1tNlwlXWMRXliAdAVvxKGIeo5KntKpWqArNNcTS4LAAqqcQShIMQaHkQPNcvZ4QV+o1wjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00uPYq4FtUPWwBUcD/h17YgM3cTVg4TaN5h8Wl7vukc=;
 b=btnigJkvmI0azrO3PJpwTrWj/pk7N5r0XzLoOw/dxHhpZ3oUb/s5P0ZkdCMFGXz1VivkvTNDStMjuY8uV7TQ5mKPe+tYHwRG6/OBBsuGvI77m600nrxzOOb0bv9/gt2kh03S3+rrL8fM4cEC0zgHOXU96ILzBwGqGXYYnhieHJY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM5PR0402MB2737.eurprd04.prod.outlook.com (2603:10a6:203:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 11:19:05 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3654.024; Tue, 15 Dec 2020
 11:19:05 +0000
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
Subject: [PATCH v6 0/9] Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
Date:   Tue, 15 Dec 2020 13:18:34 +0200
Message-Id: <20201215111843.30269-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [79.115.51.151]
X-ClientProxiedBy: VI1PR09CA0178.eurprd09.prod.outlook.com
 (2603:10a6:800:120::32) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (79.115.51.151) by VI1PR09CA0178.eurprd09.prod.outlook.com (2603:10a6:800:120::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 11:19:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b7803bba-954d-4a3c-4512-08d8a0eb3c03
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2737:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB27377B6E51AA21EE5703C848CEC60@AM5PR0402MB2737.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4kzFmDMD7phdVZ0EICJNJWDwoZ/Dp0DPt+kYAkQWhfkiuN6g3GPXU1yRXAmNATTsO3miEruV7Jbx+Npw+tRDfsRpnJBddjzW7clfL3dtzg03k89+fB2Wb1AFOGdATrmCmx0AD2L+7IKAPcLbJHV01R1IMu1V2fBUAF0MmQ32dIWsyar70u6xPEiFEcSo1bVyUHK+bTHTFeMTaV2Mm+1IOqwYrZNmkkRQqnzj4NgSbF7T1YX5vdJbmCEhj9YgciJEi6kaTuNF0+YWy00xBVKSdTpM15P0cfr78w0NPfK+D+4Rsfttoef/e0T2xGDfgQ2lBRl+w5TBTY/FqSPby+l4Ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(2616005)(16526019)(8936002)(52116002)(2906002)(1076003)(956004)(66946007)(6486002)(66556008)(66476007)(498600001)(6512007)(86362001)(8676002)(7416002)(83380400001)(4001150100001)(6506007)(186003)(4326008)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?euFB99BGSsZZvHohzop9I1AZx8uoKIHFwFlMpAeOxi23KOcqhO+VG1jkqQ8c?=
 =?us-ascii?Q?CoS2VIb98scvHj32gHzP6t7LMhwnJGrbj6/F+NkgIZHXPVigJW5+H+zbWay7?=
 =?us-ascii?Q?S2xpAIA4YPvpahNeFiAVoPUY1dD9O0KWB1jAYmEeVg01ctfOdOHPjKESVnK5?=
 =?us-ascii?Q?/tbHdP2C+E7cIzHugo+IodVm+72o0+nORz+HRJRpoFDl2Vlq7mo1mGa+FYJy?=
 =?us-ascii?Q?Uw1bvWEWcxhBcLHBfSyfRhe63J61qh2n/8L6rp9OrHfYp+o80qFo595FSKYw?=
 =?us-ascii?Q?Ah7QV4XU2HbosxjYlimYW5ute4CYtMzCf09yWbSPwDYyiEd9res5GtUizQfi?=
 =?us-ascii?Q?CGBzRuV1JsPzquRCKKWvYOHtsKI5ByRyUxHPgHoifgpVGxW60E1ods29QeNG?=
 =?us-ascii?Q?uyd55c1Riio9Y5HjpMr7dJXC/AG3rHG576/bH6/h6PaBC+9rWqYLhVKZLV5x?=
 =?us-ascii?Q?wVTNJGpWqyIsQq/EEPpiNF+aDKXqroNIHWU25mINId/qFPfJtiKn8KTPpr+x?=
 =?us-ascii?Q?i8Kgys2UOpA9ipMJ7TJ5/Xjq7CnA3aZOitqKioekSVISXu6XhI+J/iloGbpm?=
 =?us-ascii?Q?oIMB6AfVox7l3kSgl5sFMjYV7+4anUy7agV/WFMWAcHsVoS8t5R1Va2BXLQD?=
 =?us-ascii?Q?PZd3+TEhD1IHuN+lOX1MUkqxcTsyQo0089KO/oICsj6iw9KHTbgsnTQfDtBa?=
 =?us-ascii?Q?uJ3V2SsWQaQTgZC+8Q+gSYqozqnRfWB33W3KUGi2/pWPD9xVQz93u0k/Yfsy?=
 =?us-ascii?Q?EVmjSczVp7/c3hjnfjm7E3jK3EEYyw8Ch0El15nIjG4kA8sEr3kmOKCwwgId?=
 =?us-ascii?Q?uBSJTFqTWec92y7YNLM2PcvIwsU1le6O/p5yqGxhhQt47OES4J/nVNRIRLC4?=
 =?us-ascii?Q?2ERdXznz+gntetIluEYhKc0bpaEUaZtda3MrgQ128JYB28Aq0ejnhg5DX7fF?=
 =?us-ascii?Q?YsyAR5q2i0RnSfNcgm28WX9E4fB7xhBlghyqE6tdlZGQ/fBj4pmFLEdjT30h?=
 =?us-ascii?Q?ARzT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 11:19:05.6541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: b7803bba-954d-4a3c-4512-08d8a0eb3c03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5ngPHkUVlIi9+OGMbZd+mgnsa5Bo5pWxPOBwERJUpfXgPCLmrekEKJdjOXraXtGV/DgkFbio83NSi+5iqhUFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2737
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
v4l2-compliance 1.21.0-4686, 64 bits, 64-bit time_t
v4l2-compliance SHA: e0e4114f9714 2020-12-10 13:23:07

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
v4l2-compliance 1.21.0-4686, 64 bits, 64-bit time_t
v4l2-compliance SHA: e0e4114f9714 2020-12-10 13:23:07

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

Mirela Rabulea (9):
  media: v4l: Add packed YUV444 24bpp pixel format
  media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
  media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
  arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
  Add maintainer for IMX jpeg v4l2 driver
  media: Add parsing for APP14 data segment in jpeg helpers
  media: Quit parsing stream if doesn't start with SOI
  media: Avoid parsing quantization and huffman tables
  media: imx-jpeg: Use v4l2 jpeg helpers in mxc-jpeg

 .../bindings/media/nxp,imx8-jpeg.yaml         |   84 +
 .../media/v4l/pixfmt-packed-yuv.rst           |   10 +
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   35 +
 drivers/media/platform/Kconfig                |    2 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/imx-jpeg/Kconfig       |   11 +
 drivers/media/platform/imx-jpeg/Makefile      |    3 +
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c |  168 ++
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h |  140 ++
 drivers/media/platform/imx-jpeg/mxc-jpeg.c    | 2193 +++++++++++++++++
 drivers/media/platform/imx-jpeg/mxc-jpeg.h    |  180 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 drivers/media/v4l2-core/v4l2-jpeg.c           |   58 +-
 include/media/v4l2-jpeg.h                     |   18 +
 include/uapi/linux/videodev2.h                |    1 +
 16 files changed, 2906 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
 create mode 100644 drivers/media/platform/imx-jpeg/Makefile
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h

-- 
2.17.1

