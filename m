Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9CB433689F
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 01:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbhCKAaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 19:30:17 -0500
Received: from mail-eopbgr60077.outbound.protection.outlook.com ([40.107.6.77]:61572
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229570AbhCKAaI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 19:30:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLfFEM66FTnWMubw6lAGb5OB+QhvegrhuDTfem8cl6l4h8XV4PL/ZfXpi1KXUj8KMlqzc++Yjg+53sJA1mfFgeoiTUWKUZ4GxLdjl6yQzJjFZB+pCXfC+GCMZ48WviBTbmiJiIMJ+rzmzoUEm25m9tV+ZgBxaHQvbNeb6/QUWK2qKiTW/MwFEqOoAwgLuD6CrKJBV/B+aDu92iAELVfl/E5K+GYOngAsvI4kmxQDxphUeSTFc/HRY//e3rBG3QvxVZ+si/YdQ0DDbwGzmXi5tjBqabmbA8OTjU9P7rsKmjCVdTFyJDblK585Ts2U8NpCNdegjoFIXUUKxKhriY4WZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8//udJaTphf/MCoAaMZ8p4JWvxee75Idt8WGsO6zTE=;
 b=HUKBHV8eIPjGDTmX0DyF7gINtmfwjbcFaTeKvsHFpBeBMs6E73u0smRQ93iXMPWHsffLug/zFhbJoubXb0jzFuU3XjaXCiME7SQ2BO4SqpRAKXsXeXbh9eRkdhrOp3oE7X4r/yDFWyYHKpqrmsOrz84qLcwqo6m71cu7LIQPEnkkQnRBDyFEwyPenEdl96U5eBtkL2yOc0cWFVWsl9l8pEgKv47BK7BkNIRK39oWFGQWD0ktfNRvITAB2dFRnxNv63qdSwnpgKNxAyUN0Qp26aWVUb260m6j8ox67+j5Kw0F+hcYB5XHaywxoXAg65yPazllO5QCao3GZ+H0sx491A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8//udJaTphf/MCoAaMZ8p4JWvxee75Idt8WGsO6zTE=;
 b=FrfRBQL+4Y6Rr/Qs1XY7lrucoGHvGoFeP8LRXuZvY4BENvXlaY0Sima7qhAw6Y8XHByZDY64tvjVC6BiF4U0frWOZ7ttUZUZOAAJ2i7lBs8ppN7uBX+/iTUrtXI4/dsZY1c+R6wtnTp2fVo4S/faZhrE+VrqgAN8drLpTT6TrwM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7959.eurprd04.prod.outlook.com (2603:10a6:20b:289::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Thu, 11 Mar
 2021 00:30:03 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3912.029; Thu, 11 Mar 2021
 00:30:03 +0000
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
Subject: [PATCH v9 0/8] Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
Date:   Thu, 11 Mar 2021 02:28:46 +0200
Message-Id: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: VI1P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.171.30) by VI1P190CA0011.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 00:30:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f6c33d1-8d24-40ae-aaa6-08d8e424cfb0
X-MS-TrafficTypeDiagnostic: AS8PR04MB7959:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7959CCFB892ACD3793141274CE909@AS8PR04MB7959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zNxssB6THAr82OZPeoWGOWGS6VSQjKLetKMOo6oTmYvMEz62lelMmADxz1LHtKx8udb1i705ZjKZHzD0RDXmq5so/DePU3S6hf4CL+rZg0vfuD8v4tjLGe9oCGARXkO7MCU/gZLwCZ1pJI9WPQwBaG5PHfno9/6eW5J5G67wMU4b/KQve7Za99zdWv3KNjFrz3d4SlhnHZirazYJ8uLM9gaSEA2d52uF91bpHi4bLXe82HriD9wuXl8ul4R/XU4dWPG47khwnKK+MfyIuhC+AY6oh7S7fgzeTcVNXCszUIuTR5gzQ/8XpDFdSFcCDr/OCDJC+wrnn8TZb35PTDg0afyQgDQLoUVEfCitBJ//VmXNg3JIRFnSZhhtysfTfLltsm843o/xNQHw1KCqyuD2nafBOHwqk1/PchQ0wnOZT/tyhmGg/SmhAfMsupGAzLLZiDnTaUMVjY4umiJ8e+9vmzz//XkMBoVTuASKot9MnAGYDwaKyrEr2wu7iMQ4IsynmwawNiDRA/NbGRll/pY9eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(366004)(956004)(2616005)(66556008)(66476007)(2906002)(66946007)(1076003)(316002)(7416002)(83380400001)(4326008)(478600001)(52116002)(6486002)(6512007)(186003)(26005)(16526019)(86362001)(6666004)(5660300002)(8676002)(6506007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uy5CAFf224SieexqRZCeMQ2KjjSeU3Rdre7AtkTpkcBDG55wEJ1GiHWSiPFS?=
 =?us-ascii?Q?dJ+Lowi7LqzLD0Z2CNkoGf34So9OAD5/ltSsOl6s3dPW+Nyp5gbK8ZQKMBkt?=
 =?us-ascii?Q?E8SbuBHREWn3XL4e2TikPha9RCM6LZ19x5xiGCHbhSOgMhzB5cddnZgWAzkA?=
 =?us-ascii?Q?BIfD8AhXej1dhON/DiC8c+WNyivdvYKghAbjqPYgFcRg59m7xhf1p2wi+Oy6?=
 =?us-ascii?Q?FPucHuWQqALKM2BcBb0fZJMgYQakrTBF906REMH2wzl6u10ywaNZ3G53eQet?=
 =?us-ascii?Q?eGNkfg86FlGFytmDKcfVU1lDqyRnmI8lrENr7dscSBTzTSFObl3X8gMoHBJx?=
 =?us-ascii?Q?Y1FCwX6DGfE0cURz6xE2wtLAg8IfkzZ7rrP6uhX68+8N7a6XhgZsEs1prCoF?=
 =?us-ascii?Q?MfDTwt7yHu1NI56R1SZDq9reUdCW1H3dif0h5oTKWMWuYo1pt+AM5XDF+fnB?=
 =?us-ascii?Q?AlZZo8RmUyj6/fJ7M74UKSH0NGbg/hAfVupzuCE2EXgoF4JgyB2fOhSrJYdh?=
 =?us-ascii?Q?SnjiiVtiPHhnrrtL+cLuWFYzLOF4efiPRHrfLxH2X8hrqm+a2Vz3EbGebOGU?=
 =?us-ascii?Q?BN5dusr5k3eLq/UVVqiGzn6aqcxnAVD13JvxzpJU4Ud16sQ0WYJGhoMcneA3?=
 =?us-ascii?Q?xV64+iIEy3g3F+Zeipv/kkmFL+VAXGaXjfle1ImICKrJjjqtNZMZyLBilFEV?=
 =?us-ascii?Q?KjlICUqlhNQb9zCvoMUoy2IkbDcIGrztw0STbpwhOD9a0+xXBwLSPHCAXOYx?=
 =?us-ascii?Q?Qrecp41yeyjbR7u6WbcqpOH9BQn4cvAgXb6ayRBxBTOa7XtOsjLE903DSK41?=
 =?us-ascii?Q?ilXcNPIJREagaqxqTs5G2llE22YXGGbwtdKdh43qa1JopD9UbeMKJEDMPAjF?=
 =?us-ascii?Q?bquCttvVWTtaTFUz28I1lZGlzeC04cuR8WpIroSeO77DecrVGeotBHrxJ6/U?=
 =?us-ascii?Q?fARiPy/Q4naB85Ulj7NPTm+ZMjatMFlaWY/37VEbB/1ns1DnqJNRrYqplZUw?=
 =?us-ascii?Q?KPdJNIpzEqDfyA5vH6ecvUjoxqrpZqOgah1yYntRIN5WeJJcoq+d1NvSJIH3?=
 =?us-ascii?Q?/lbBHzifZ+Xxg09w7oHzUgUE7jvS7885AQMDtCOItwPDaTKWqXa+x7EbPkYa?=
 =?us-ascii?Q?+bvGjz0c9FZAwlSleWatjgiDWK7xnQ95oCrpH3TRE4n3MFvl1CPqoQBlUbYb?=
 =?us-ascii?Q?caMjtEnJRM7utFDaEuB93MnbKd7st0iwiSZEszMNXaMhgUvUq5/clqXD0WOh?=
 =?us-ascii?Q?bHJsd3mZ15WsUrIdews0bDKYeKFi8daz81KZoF7gsdX6RHHBd9FXnMAY0TfR?=
 =?us-ascii?Q?Rey33SM59024/+D04l/tbBpP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6c33d1-8d24-40ae-aaa6-08d8e424cfb0
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 00:30:02.9621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmwttiCpahA5PUb+v6xCgGYQS44kUm9g5RVZRLxXPgamPjcGtuFv3wglkBgj/XL81zdjQ2x/E2mlrVpzXarsVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7959
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

This patch set adds the V4L2 driver for i.MX8QXP/QM JPEG encoder/decoder
and it's dependencies.
The driver was tested on i.MX8QXP, using a unit test application and
the v4l2-compliance tool, including the  streaming tests for decoder & encoder.

The output of latest v4l2-compliance on i.MX8QXP, decoder & encoder:

root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance -d /dev/video0 -s
v4l2-compliance 1.21.0-4740, 64 bits, 64-bit time_t
v4l2-compliance SHA: f253495fa6de 2021-03-06 15:32:09

Compliance test for mxc-jpeg codec device /dev/video0:

Driver Info:
	Driver name      : mxc-jpeg codec
	Card type        : mxc-jpeg codec
	Bus info         : platform:58400000.jpegdec
	Driver version   : 5.12.0
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
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
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

Total for mxc-jpeg codec device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0
root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.21.0-4740, 64 bits, 64-bit time_t
v4l2-compliance SHA: f253495fa6de 2021-03-06 15:32:09

Compliance test for mxc-jpeg codec device /dev/video1:

Driver Info:
	Driver name      : mxc-jpeg codec
	Card type        : mxc-jpeg codec
	Bus info         : platform:58450000.jpegenc
	Driver version   : 5.12.0
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
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

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

Total for mxc-jpeg codec device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0

Mirela Rabulea (8):
  media: v4l: Add packed YUV444 24bpp pixel format
  media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
  media: Add parsing for APP14 data segment in jpeg helpers
  media: Quit parsing stream if doesn't start with SOI
  media: Avoid parsing quantization and huffman tables
  media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
  arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
  Add maintainer for IMX jpeg v4l2 driver

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
 drivers/media/platform/imx-jpeg/mxc-jpeg.c    | 2122 +++++++++++++++++
 drivers/media/platform/imx-jpeg/mxc-jpeg.h    |  180 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 drivers/media/v4l2-core/v4l2-jpeg.c           |   57 +-
 include/media/v4l2-jpeg.h                     |   20 +
 include/uapi/linux/videodev2.h                |    1 +
 16 files changed, 2837 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
 create mode 100644 drivers/media/platform/imx-jpeg/Makefile
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h

-- 
2.17.1

