Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDD13B6F2C
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 10:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhF2IYJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 04:24:09 -0400
Received: from mail-eopbgr70078.outbound.protection.outlook.com ([40.107.7.78]:10049
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232371AbhF2IYI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 04:24:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJXyphPfCGsasCAcWdCToK/Mx3t/JzTwJdMGZKJ9kZNWiaDCMYZCVKeTNW/WelLAjFNNhHkRtOnf0oJcg82vWzzOvcwaENd66TefvWG+AUdgATzth0Ot/7ZbtOwyAKhUYF25LORAxzjcEXP8HzLUKg8tBU1NT27BqfUWfEenynXO9tw/kRgJgTnlW/JEeh4KqyR5JT/o2SaH0pzh7sJTS0HAh+20tH5KV/PxuUd0bGtp6sWrOyzHVE79kG3eVKyhKSF2/HhR5PXKJE1MCF94mnnIzMxXVy/quPDzgVqFI5U93IQ7lfmWavNtaiVU8CNUM4YbgQNCa+LriKokEfQrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM5e1aEWve2PN+PJoCs0i4H4VNnQvbGsV8GaueJWeUM=;
 b=ZeVHfazPmAd5+DmOPK4ZfNCDW6vaYlifwh3nCYE7tPFdc2s4Gw3cFxgFi6nRrSpPq6rKBG31nVzKzt6pihNG0dd+XgY1eQE0YtiVyaQSx/zyET87NgLkRHd3B/qUcbGvfHbvRQRK+pcCIx0u8URjWpP59E0LNSfkD8FoP3h/EGYZ2o/Gv3u6QwwO/jCRJfG8bk8Az95WYTEJmk+i+Paa2CKfKAwp7wtSjKvzMf/MDvOkcHRQNLvdjXE3Kxwe87X0RUvmY/0FQQT6TG7Zfbqfo/WsLiZaSIGzk0g0pmwjRkD3snFXbYtUSl62QhRaLhRyjx7MKoPROEmygLic6yUeEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM5e1aEWve2PN+PJoCs0i4H4VNnQvbGsV8GaueJWeUM=;
 b=lmBfHzb5/g/HEvLBok/PSNYxaPea3llNRF5gqbHWPx76B9UlYsrpg1/brLJeZEnPOY+sR8fGD+I6w2QSf5JSZoVOPCR9P5vpyNnLP8Y96y4FQLgMBSDTMOHH/Led1/IJpREYkK/a0t72Lj/bRjT45aU4si/Hgos8fMObQxcEbWk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4583.eurprd04.prod.outlook.com (2603:10a6:20b:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Tue, 29 Jun
 2021 08:21:38 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642%3]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 08:21:38 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 00/13] imx8q video decoder/encoder driver
Date:   Tue, 29 Jun 2021 16:21:01 +0800
Message-Id: <cover.1624954576.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: SG2PR06CA0160.apcprd06.prod.outlook.com
 (2603:1096:1:1e::14) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0160.apcprd06.prod.outlook.com (2603:1096:1:1e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend Transport; Tue, 29 Jun 2021 08:21:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b10477a2-a63c-467a-19bc-08d93ad6eaa1
X-MS-TrafficTypeDiagnostic: AM6PR04MB4583:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB45836AE7511EE3C73A3A0607E7029@AM6PR04MB4583.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nkujhmtlu0/ESC4JOk89JC/ExNqLn4IoWwqS5pyfxNEu57p8DgWr3TfNLvf9CWxptHy/wrxl1Vrxg4vS8bYywZn6Lj2CDMk6XbvgLhn1HK5bz80MnHGBNL1sWZqe6hNhvmOxVikuwt0piSIOWDlwMuReNdzpeechUX0+I2lV6w4PrQ53SWK/nraMjzL/C1jkglm88N0B/kuxp/aHNQSRn7euKNak4HguajrP+Kf54X6w/P8Hxn74qj9Y4X2sqs/RBN72z3dMHrohsAx+7Iu6WFvDKCVZaB/XrH4ess9l3/+OQ/guz1OwSWficm088WPumG/eCFM79HD3ZSgYrucGy7msWIkdjyIz+q3NiJgpYDsxmy/33HpibkyA5AJP1mtfxWkIQnu1FcMjjaR13blNVGYJtqTX/QVwsy8J+lr25toUqr+wgfh7tsEuDzaRy2IDBx5lpVWxpntCs79CBSbfpkiKalJmDJLZw69Ri+BKdSkrZnUrb5QNaxaze7lVJwsC2Rf09nubOYx8WoudXeIOuATQWxsv6JnvGFwG2+fK5Peqb385KC+wWSv10fg+QW6MzfbtA0Xp9gXKA+Bb57v2osX4ipwAQNMs5HZPEGqbejo7oCfHbm3gTmbwxK9tOTc6/u+W/SO+3lrk75wAhrv0SOK+FGAARLvSmlO+hWNBlOWUz7PeTxpDrCpmwJw8edGfKIqnU140HyUo+f0z9muM5eOOuxBX3Y7s9Lu/nt0ybGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(346002)(136003)(376002)(2906002)(7696005)(52116002)(86362001)(66556008)(5660300002)(478600001)(38350700002)(30864003)(8936002)(38100700002)(66946007)(316002)(66476007)(186003)(6666004)(956004)(44832011)(16526019)(6486002)(83380400001)(2616005)(8676002)(4326008)(7416002)(26005)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r8QpD1VBs0uQWqg8IwPvvLpo88T3TSfeCY+rVWIHWroU7vutqrp+iCzT3iLH?=
 =?us-ascii?Q?pVL9W6j8TqXTvrmNfVMi3fh8rPhgPdf9L81+XC8Mhqku480QRBkfhzuFji37?=
 =?us-ascii?Q?dvenPwQGAgDAh05PfMWbuMFOKkUqBL+LRuPU9H8azAAXQtgiKdJD9EXvDpvb?=
 =?us-ascii?Q?ve6cxHk+KmM70UL9fDoISVQV8+wbvsnbf//XY0/jZEOP+In8W7vEnOty+y/7?=
 =?us-ascii?Q?1XHIHPW8rjwtbMCgi3xsXf6RCuma6x/q2lEd2pvMqwNxwQ6Eb8UkZRugihKt?=
 =?us-ascii?Q?nfMcbirdIkmJZ5TfU3w5pTa0jbhH+VAx9txPMkaa9e4KKAgRPda/2IMTNfke?=
 =?us-ascii?Q?b+IMv/jEWbDaM+gRYU6aaaBp3yGFO/ypIBbzYtyY/nLm/gNz2qUFrtz5VhaX?=
 =?us-ascii?Q?EtR4j7l6/lEpcLblTpdAa7SUOwJ+jzzEFHqxn2jd/9/yNNDykB5TJW5GxcXi?=
 =?us-ascii?Q?No9N9J5H/b/PJIN2NwdaK5aV3uWonY12l89bgTzXKYcieYaHEG3j6YdyI4YK?=
 =?us-ascii?Q?wbXm3a6HRQAnGW60WPC5l/X5P9WC6RKWBuwWEtt2f6Cz4rD4Q0pXTj1eCBf/?=
 =?us-ascii?Q?Rnsc9GzCBFCZZ882oAvWf46s8TpMmqnWLjrkeo5Ipw2C8ZOAki5RZauBXnDe?=
 =?us-ascii?Q?29jxEtlKeuI3ZfXmzXaTsMj82BncWW5JkKFAF/uJ3vSZCTW7WKHzO5EIQJq5?=
 =?us-ascii?Q?OKrbf+3vJOffuibbhcOfifV2HKG6ydTL48D8BLJ3dmcYoYK3VrnCs45fkM0H?=
 =?us-ascii?Q?pzqP4uVbs3ObXQ7sJgOd0TLVEFp6M9nqrKNLw1QTcBk62H6NdAVoMzHih2pJ?=
 =?us-ascii?Q?GXgPPI+wfbYAnNidsEimBaH6fKbopJN14FGndsQgdJRrubWPQfN5/nrGLXrH?=
 =?us-ascii?Q?7lO61oTdKQZ8L9HKTbQ0wIfTNYxtpiHPTKLm7OEsE98zQtTP0eTO8kP0Ur/B?=
 =?us-ascii?Q?+hDGt67p72fTvUxWJ9ZxCJj7xNtiP133gDg5Lvetc5rhYRRTsGO0g4D784Rt?=
 =?us-ascii?Q?xn/+Rid8cPOVMWzk87ilaxyY+2x/7zN0hvnV3O6hEHofp1jmNbDmmueJKgoV?=
 =?us-ascii?Q?28CvsAtARRm5/C64AazD/EjkqT2nA7INJQyjDZXa4VMxwlSn+n9a7L6cT1Sf?=
 =?us-ascii?Q?BqWH4Zxy1oWpONgi72s8sETYJUOMVIi+DObVYEwJ94oAfYs1HPQq/OWLs/Qz?=
 =?us-ascii?Q?/GQjoWw0mdBAOpe+2rkWIk/17bCYOl8jDoMCdAV8h3VCMtuag5KDfgnAiwdT?=
 =?us-ascii?Q?pcmzH4H9F/L9bw8XIG5qftz/pqk42YjsPWnejHVe381sE5sGF6Hcjy/80037?=
 =?us-ascii?Q?IK1WhtPyWkAhn1Byj/5FDOvk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10477a2-a63c-467a-19bc-08d93ad6eaa1
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:21:38.5903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHZWEnqaa6LBtFaEzbNXMyVQrmwG1bL5BlEVaRrBXmS8wPIdJmBzF7ibMTy4Rsn46V7kMgQRDAoVeoT/ZRECxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4583
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

 .../bindings/media/nxp,imx8q-vpu.yaml         |  191 ++
 MAINTAINERS                                   |   10 +
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   22 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   30 +
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
 drivers/media/platform/imx/vpu-8q/vpu_core.c  |  926 +++++++++
 drivers/media/platform/imx/vpu-8q/vpu_core.h  |   26 +
 drivers/media/platform/imx/vpu-8q/vpu_dbg.c   |  505 +++++
 drivers/media/platform/imx/vpu-8q/vpu_defs.h  |  194 ++
 .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |   82 +
 drivers/media/platform/imx/vpu-8q/vpu_drv.c   |  251 +++
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
 44 files changed, 12930 insertions(+)
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

