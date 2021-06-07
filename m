Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359D839D79E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 10:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFGIpX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 04:45:23 -0400
Received: from mail-eopbgr80052.outbound.protection.outlook.com ([40.107.8.52]:9294
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230127AbhFGIpX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 04:45:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAGaCbtudYu9j9FBMyixE8ZtVyKI1kms4I7zyGEub6MLbJWnwfl8iPt25ivgOQMR6+sS3lGI5leipum3G020tYKEp91vdriND8k41Su8Ol2Y41yb4vF1Vt9vymyCHYGRjjvXpeQDjIkxyQAgx0mjHp/B5LHdOVer1L9rEu4u0Pcz/qhH7akvutpvbTi3PyIs3m9dSZ+6SkNQIX0R+gb6UlPhJCLpMJSCrXNv7lOLAPwH8z7KTW33C57oyO4z/0IB9JdhMzGUYRhF5EvdUAhGyrdxIv3b/7+RM6vVq4KiceK4tescG6Uucj7GL59yFKi1UG7+vS3jX44wamy1f8OvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDSeDqScYFX8Xn5j1PMuIJiUj9Y+1OT/tFaeNtocVIs=;
 b=fcaKIgeWnNUofh71HWoso3Tg1wnLLgBS+k7KXyg/2+0qjyGp3rJxYsn/kZIkKRK9f2lBF4w7FyDAeLuto19upGmwyZ7Qexuwc1VvyluGmT5n4l8HMp1aUEqf03oWzmnl4C3U+xFKXy3XqWaJQ6BN80ziuNNxL3F5mN6/PPZcdt5xwjrTixGG1Pzq7sePm4oXi22qy49gDJ8Yksa6KeRClyKF8F+IUmhOSEHDl6Jqnlfj40cjOxPbw9viLHgDzJOOuadwuLah6rU2QsPGZs12ttYG6WzpDrbumITOrPDV5zlUMo99mEFQs+rYCRj0UB4vAnxCzeeUuONiQGi+z4X6pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDSeDqScYFX8Xn5j1PMuIJiUj9Y+1OT/tFaeNtocVIs=;
 b=oIZcKwnKzo06lfKbP9PKLlNQskS6duvZWGWos+5rtSkVCLXIG0ak7ldewvNiVpeiR5Wk2AHKaa71fh6A9hmA0s0snmCVmm5wNTctz9Y6mVASoRof5L2KzlpL/7zAju9F9sp2Hb8frFqWuAXpJkq5WgDXDH8aQ3Fj1MXwIKFwcwk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR04MB2977.eurprd04.prod.outlook.com (2603:10a6:206:a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 08:43:28 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 08:43:28 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/13] imx8q video decoder/encoder driver
Date:   Mon,  7 Jun 2021 16:42:47 +0800
Message-Id: <cover.1623054584.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35)
 To AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0203.apcprd06.prod.outlook.com (2603:1096:4:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 08:43:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba4e88a6-0902-4454-44ef-08d929905252
X-MS-TrafficTypeDiagnostic: AM5PR04MB2977:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR04MB2977868FC25B4FFDC2DC7594E7389@AM5PR04MB2977.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8cWqdHr9/GhzPg+tLveDyXlBh+S1GjdQIAHo/rCl1bEbaNEPQpO6+hguWmM6Dyy3G1mrggbxxkrPR3W1nGS2cOiU3/7NBlQsMFq1ZZVvx+fYlN/jW3zqXH6HZSeBgdX8IVkAZBS4yIi0otTsQgPqtjDRYZHYItUW4xoZJVxvsOcS6aBRjTcOUVZfDP8k0Rwp6RqJtkofcBOKhoQOJ8Pr6N2bR/rJN9v9yU5OKDMyCWIHRrJb+298vilGZm6Gz3+YH1fMf2r0zmVu+50USnZhuXdN0Q/uyvW6xM+AjWVkQNJ0Bwyb7aMeyGxlAtrmd8wcvofgbMDKrR2uYOzFWBsPcEcJ2v4WmXU/Wy4isA74EtqNU76xFYKcIAJemzgRDeIwU7xELwsw+Y/osvS0PL7qDt+onIQQSED0d67IBu1h8bjdP8LvPw5ck1ojAKSGe8A/JhoAYEWP9HKZta2tDq+XWYEgB40SgdkNfaj0dyKdbRpug9Z4h41xPrQmSpsGVqvehRMNKeCE4NN4n1+rRGEVPD9D85p/wcHrzKncD0nfW8xqULhmWwxdrysMw0kydQZYJ0rB4X8QajOcAa0E/ReBBYgsIj9ntEfyuBgx3ckdbu8gQoS2DHDJPzSMyiT1amjzNS+8+CdUWwxIrnjdyHqmqV7AEOSYO+t01unjJ5znQmtBWSHyQC/x9az7N1A6IAEH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(956004)(2616005)(30864003)(316002)(26005)(5660300002)(2906002)(6486002)(66556008)(4326008)(66476007)(186003)(7416002)(6666004)(38100700002)(16526019)(66946007)(44832011)(52116002)(7696005)(83380400001)(478600001)(36756003)(8676002)(38350700002)(86362001)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aUIiXIcZJUwAqP4hZht7fNsGFJTlEIv1e+CvUFrPzpkxkP1xlaUSRGdO9+3k?=
 =?us-ascii?Q?z2Z4Gw6YiWUNOLTyGhop0gTvZB3+U7U3aQi+yfLBDJsu+SsmxWoQJRoDyke6?=
 =?us-ascii?Q?5c+Gga1WotZJgN7dZBBX6Yw7QaNrAYDnS+hOIp2golSXsvfAPQnaIe+gzu4s?=
 =?us-ascii?Q?CCYq0T+wwJa5+jK1fCuRei/1TPye20hlQvOTkNlSNdBTWJvi0REd728L4/t3?=
 =?us-ascii?Q?IAD62i3f2F74mVYni9el2JJ8446QzEhkvs+MULkW9JxD8agdKSWU9alNx2K/?=
 =?us-ascii?Q?rBHbsvlCKQMIPzlfzAYaLe4Fk7g9Ujqi7IOvvCnoqrJONJrmqvQOcJb0TJB0?=
 =?us-ascii?Q?wZR6yegOR0BaOWneZyk361vJalDoxr56PmEjPOu7rYmO40zr9UryqgOH0p77?=
 =?us-ascii?Q?ox4iRUFNUdu+pRHUMM/VSANakrs53kOSI/VsnvFeTYE8AvfM+aQZJnjru2bO?=
 =?us-ascii?Q?qoswWsUel4xp1DTh6auW0dxTG0kfxvMvZDM1XDpM6Mo9rl7ipsrebesgmuF5?=
 =?us-ascii?Q?Y5OJCFFFIwHAJgHyHcTxeJSVFLQ0lHYQdCgD8J6/Ku4NuKGA8y0vWNo3kdVm?=
 =?us-ascii?Q?tj4eLRMMuihvWHKQdxv0f80P/pbE88LITo4Pal3SUaX803lvhEsv6CvT3Md+?=
 =?us-ascii?Q?WRImypya6sXzx++POt2JWXcpfmRRdUuD2yUD4BjKtqDpi5Mnd7HltlrZEo3b?=
 =?us-ascii?Q?9EDA+aUgT8OrOcszyrMNa63RqRh6xzNqMz+wokzYDxZ9PAqoO6ScC8uWU7pT?=
 =?us-ascii?Q?zHva3BZN4R3PPav7RMJ5CYN2oH+KAPextKbOunfT9YPdjBTl0UZ1sXW8X0q/?=
 =?us-ascii?Q?L3MS4A14uqLyLKCosbdu3n3yW7iQ7sfBgqcD87pAdp2havlL2KgcTYEOqlcH?=
 =?us-ascii?Q?QbNrZThtEzzl4YfTDncXPvmldl914RVs6Ejs4FdBGva7o51uR1GxjdK9qx27?=
 =?us-ascii?Q?fN9rsxpDAAuoNi5X1Y7FDgu1z0KYbwBdQiLyrDSnBvjY3tpVD4zGYMwhI8a6?=
 =?us-ascii?Q?degEZ7aVAwsg5tgYFu3jSxp/UqtSnGTM60L8ZOsBlDjHSf8rSl8vo0dz5yjg?=
 =?us-ascii?Q?qGkI0nvhYFIjJ5L84NNqhgcGLIBTC9VGzD8CIMfDBDEYVnIUbMwJO7hWya9J?=
 =?us-ascii?Q?xLQF13PRC6S3lzY/5bhFT6ex9S/8juusJR3SzS9kubH6uxR85QkHGC1I9Hii?=
 =?us-ascii?Q?aliW8qTRpdub5fOn5EWblaGwIznth1wn9efKBJiS5TuyMHP+6p3chQVbZqOa?=
 =?us-ascii?Q?hhYVnpBQUc4tP+kZ3g+JbtPf5ts54AI8A7Ku7+4+gVx/kUMfvhBKnV41NUeq?=
 =?us-ascii?Q?V5D/w7ma27tpVkAR6zybN0Kq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4e88a6-0902-4454-44ef-08d929905252
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 08:43:28.5027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfXpVq9RIzcM/PQNwR8NAQguYKMZeS5Pypx5mo8v4r6g5/J1OxYHZPTYyRbuS4qPYiAYuNY7H5toQ4qXA9amOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2977
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
- MJPEG
- VC1
- VP8
- AVS

It features encoding for the following formats:
- H.264

The driver creates a separate device node for
the encoder and decoder.

Changelog:

v2:
- fix dt bindings build error
- split driver patch into several parts to avoid exceeding bytes limit

Compliance
==========
# v4l2-compliance -d /dev/video0
v4l2-compliance SHA: not available
, 64 bits, 64-bit time_t

Compliance test for vpu B0 device /dev/video0:

Driver Info:
	Driver name      : vpu B0
	Card type        : imx vpu decoder
	Bus info         : platform: imx8q-vpu
	Driver version   : 5.10.35
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format

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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 3 Private Controls: 2

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for vpu b0 device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0

# v4l2-compliance -d /dev/video1
v4l2-compliance SHA: not available
, 64 bits, 64-bit time_t

Compliance test for imx vpu encoder device /dev/video1:

Driver Info:
	Driver name      : imx vpu encoder
	Card type        : imx vpu encoder
	Bus info         : platform: imx8q-vpu
	Driver version   : 5.10.35
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

Ming Qian (13):
  dt-bindings: media: imx8q: add imx video codec bindings
  media: v4l: add some definition of v4l2
    colorspace/xfer_func/ycbcr_encoding
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

 .../bindings/media/nxp,imx8q-vpu.yaml         |  198 ++
 MAINTAINERS                                   |   10 +
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   76 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   22 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   27 +
 drivers/firmware/imx/scu-pd.c                 |    4 +
 drivers/media/platform/Kconfig                |    2 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/imx/Kconfig            |   19 +
 drivers/media/platform/imx/Makefile           |    1 +
 drivers/media/platform/imx/vpu-8q/Makefile    |   23 +
 drivers/media/platform/imx/vpu-8q/vdec.c      | 1783 +++++++++++++++++
 drivers/media/platform/imx/vpu-8q/venc.c      | 1411 +++++++++++++
 drivers/media/platform/imx/vpu-8q/vpu.h       |  339 ++++
 drivers/media/platform/imx/vpu-8q/vpu_cmds.c  |  443 ++++
 drivers/media/platform/imx/vpu-8q/vpu_cmds.h  |   34 +
 drivers/media/platform/imx/vpu-8q/vpu_codec.h |   77 +
 drivers/media/platform/imx/vpu-8q/vpu_color.c |  201 ++
 drivers/media/platform/imx/vpu-8q/vpu_core.c  |  923 +++++++++
 drivers/media/platform/imx/vpu-8q/vpu_core.h  |   26 +
 drivers/media/platform/imx/vpu-8q/vpu_dbg.c   |  505 +++++
 drivers/media/platform/imx/vpu-8q/vpu_defs.h  |  194 ++
 .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |   82 +
 drivers/media/platform/imx/vpu-8q/vpu_drv.c   |  248 +++
 .../media/platform/imx/vpu-8q/vpu_helpers.c   |  405 ++++
 .../media/platform/imx/vpu-8q/vpu_helpers.h   |   80 +
 drivers/media/platform/imx/vpu-8q/vpu_imx8q.c |  227 +++
 drivers/media/platform/imx/vpu-8q/vpu_imx8q.h |  125 ++
 drivers/media/platform/imx/vpu-8q/vpu_log.h   |   53 +
 .../media/platform/imx/vpu-8q/vpu_malone.c    | 1744 ++++++++++++++++
 .../media/platform/imx/vpu-8q/vpu_malone.h    |   51 +
 drivers/media/platform/imx/vpu-8q/vpu_mbox.c  |  135 ++
 drivers/media/platform/imx/vpu-8q/vpu_mbox.h  |   25 +
 drivers/media/platform/imx/vpu-8q/vpu_msgs.c  |  420 ++++
 drivers/media/platform/imx/vpu-8q/vpu_msgs.h  |   23 +
 drivers/media/platform/imx/vpu-8q/vpu_rpc.c   |  266 +++
 drivers/media/platform/imx/vpu-8q/vpu_rpc.h   |  472 +++++
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.c  |  730 +++++++
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.h  |   56 +
 .../media/platform/imx/vpu-8q/vpu_windsor.c   | 1253 ++++++++++++
 .../media/platform/imx/vpu-8q/vpu_windsor.h   |   48 +
 include/linux/imx_vpu.h                       |   19 +
 include/uapi/linux/imx_vpu.h                  |  120 ++
 include/uapi/linux/videodev2.h                |   30 +
 44 files changed, 12932 insertions(+)
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
2.31.1

