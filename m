Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B582F1F54
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 20:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403849AbhAKT33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 14:29:29 -0500
Received: from mail-vi1eur05on2045.outbound.protection.outlook.com ([40.107.21.45]:23264
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731752AbhAKT31 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 14:29:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBw3NxdG7VbOM4X09Ppj0E5N/iNxR8hURGJDNOqSD9V3rS/ZIuPt12NptQh+lizTgnQrvEQEXs45GMTvZ1vTzAASpSWdv88GTMVo6dseKDKS/HUFCF9uRdyUM+MO85sjmivwneeHF88YbifeK6DiJEADhqtB8lqSrcMGM010YLLkmikVO5AwGFZpQLMaECmntJiWRU58AZkVrV4vo8t2/F0cJvggpsx5bSQ9VgzoKhK/9w9B55OPmpWA3Ro5ujORdKTVTnyJ0prXQgoyxRq+rSlFWqwfT6NoOWaDHJL75iyfS0zGP0jgSI+Ao/x3SewPgqvbK6vNrL2vwayNFkgJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDpED+JGn7rZ8U3QRtjPNRlkpp6JtLGLXI2mCj5vySU=;
 b=bsb/5MknO3VQlloP7C2I9JFw0V84l+Ee+k1wMx+Yyu4B/oa/6QYNAQl9/dU0BfjEB2aPeVND8kH2xcV3j6Q/If7hC8KzEI03loH7T1UfXupKUH9z9SmNat2/4wTpCfFKmNnRlpJ1WnZIiyXaALPK1qYC2Q7VtTy5Vc9p4d3WlDj1LTEfiw49WN9jimNqpxIlkwoeynJsuAqG+gFUN26KIc9w9lUHGvjFrNXzWY8/37z3h0IG9/alKBZeY21PfyHFiZprwsTTkjVyIQ8BuRtW5wyfzKhP1Rrrr5cb0EINkru4ER32c2+YSBbgER/C5/jpzcoXT/EovOYC4hFZTltxhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDpED+JGn7rZ8U3QRtjPNRlkpp6JtLGLXI2mCj5vySU=;
 b=f50bbTdI/8oYijMrWRljicinKuasRrHw4iCU7UbMDFn/epxewDzghGqj/kDyIrpr3lBWmtuzG4fEvNjnRV3XCCv14/rTK8TWen1A1IPMuo99bjqztkTn0uh4YZ5VayVKXVcjULOQU3aS7BrCpnrhpGoEzUUdmwlomh5kmGwmWl4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4424.eurprd04.prod.outlook.com (2603:10a6:20b:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 19:28:37 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%6]) with mapi id 15.20.3742.011; Mon, 11 Jan 2021
 19:28:37 +0000
From:   Mirela Rabulea <mirela.rabulea@oss.nxp.com>
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
        dafna.hirschfeld@collabora.com
Subject: [PATCH v7 0/9] Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
Date:   Mon, 11 Jan 2021 21:28:13 +0200
Message-Id: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [178.138.194.64]
X-ClientProxiedBy: VI1PR07CA0296.eurprd07.prod.outlook.com
 (2603:10a6:800:130::24) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (178.138.194.64) by VI1PR07CA0296.eurprd07.prod.outlook.com (2603:10a6:800:130::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 19:28:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b2210fa-edd2-4e42-e1e6-08d8b66717f3
X-MS-TrafficTypeDiagnostic: AM6PR04MB4424:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB44243CB898342012FE5B9B26CEAB0@AM6PR04MB4424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gRyGXpz1y7MmzP2WJYivgkbS6Yv/rzDQjZdYDTW2f+L5qda16xFn/LykLNG5b9j4yEsYsBvrwAh09v2md455Dt3zS2WNOFT4Ylj/Q+2omiBOsZ8h1x/4E7EgmThHl8aDBJUxPawhYUhDAtJhFWI0g6jn6jmIvt14nNRpLrDE3y52PAUMn+MYmS2Re/vFwfF9Aoyubgji0lIjaIGKK/evjePvMcTEJZaWbrsaIoeSwPh7h+GBMd9i6s5SQ6AfW2g0yx9YBqxy4hcTEH38aVSbqBNO31F6OlUHBfuAJj3sGONZsXHF8py6CeId8PtjdwakI1lasnxyxfyC4b5EOnrLRsCz57qwy8wbdagGNvPpMFYN0p/+p07W1lSmt3Ne494Za0OHHq3p3p/pYFHGQGMOEm6gp0YFIWKR/7wuxIZ10tvEm0fDF/PTDFHRfPDZESQ/nna0otvmymnR2ehQLjm92w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(6486002)(6666004)(7416002)(5660300002)(52116002)(66946007)(316002)(69590400011)(478600001)(4326008)(66476007)(66556008)(1076003)(8936002)(2906002)(6512007)(2616005)(956004)(44832011)(8676002)(26005)(16526019)(186003)(6506007)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HndBUWEhKNTwGJwNYbJodkb1iUxlKNYjwZfV5gQjl8xLAwmD4Csmi+dAOLQA?=
 =?us-ascii?Q?vPZtOWSBywd+TZzsTpNO57hnbJoZD580NR+7G1c5pt+NsRPeyl+0La5723XD?=
 =?us-ascii?Q?u6/u4MBbvVD1qua2OPpl0o0gTAhv/bLoJo1BYgbasrJ7y5zHpHsgbK9kKvZ2?=
 =?us-ascii?Q?1MujWEl+9++gnf5sVFMPzz+QImhtZaNNFll+4uIKpR/hXfiStswyDn9JXjpd?=
 =?us-ascii?Q?CDIEC9d3/SgN0yOZyh//LwsGg1dcjSRBI6zdHL1wBhpOokd3/OPUvyd8vRV/?=
 =?us-ascii?Q?qS2+Gi33tATgaLm+lP/GIP8Ysu90FqoiAC1ihlnpuVh/a+wQtrCvIAyZ5d+F?=
 =?us-ascii?Q?kETxgjB/YEPFsw9h1y5WkVK1iGFDfFF/IG2KCs8Yho+1nlJQsptNOVHuFTon?=
 =?us-ascii?Q?pvWtu5UxbHcWS9KRY1ySf83A4RTLr+5sGb2SGBCokf52n7bNlCOHEdiefovU?=
 =?us-ascii?Q?T7FZrrVZ7KL7mp3kc1jXI5G9CH8dR/By+kTsKx5/E+kybHHVUAYdGsVU/qZz?=
 =?us-ascii?Q?2SFjMMtUt31vzyaD+2BnMnxbE10rbOSqdFj46FHfJkkACY3c4wtLY4K/Ouik?=
 =?us-ascii?Q?pqlFJ4gsiKHpZUIQyhshSvrro/iLhaTuKNXCHVey4q7UWxn2k/ojxn/zSCUj?=
 =?us-ascii?Q?VacaJ55FkLQyYh77fqT+O5MDH/LazlWx8wsvvxkqo413a1a7stPKbJphK9hb?=
 =?us-ascii?Q?NgSE/FI1fgnpTyrYyJZIX5+UVz+wa8+ZGSG2jE/rTzuT/2i0cWJymDTDkoFO?=
 =?us-ascii?Q?eMddU5qYKWfkEvUubmxEHisKcADPHNfb4Gv7UK3zYBzqYPUYomBQeleoF6Kr?=
 =?us-ascii?Q?gdqnQglX85AJ/vGjf7q8AS224QOyNuKWxJssJERur3+lDO0P5H0j2EbbD4ko?=
 =?us-ascii?Q?R5/SRIC0vhGVYaeJG2kPILKE3611zgLPKrKxBzQoQuGynAJjn81zsvQUrs0Z?=
 =?us-ascii?Q?RhvfpNY/230bmoq3L8FH93z++s1fa0BLzffyyzGTcKtyw4bZ4PO738bUnj3f?=
 =?us-ascii?Q?pKxR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 19:28:37.1448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2210fa-edd2-4e42-e1e6-08d8b66717f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgg87ViuXUPct+e0hEZLzWVm+ZA21b8ICJkZQfalOa1kSALFh3hAwg37loMTSbtqvaTOIJm0pwzUPESvfR4pKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4424
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch set adds the V4L2 driver for i.MX8QXP/QM JPEG encoder/decoder
and it's dependencies.
The driver was tested on i.MX8QXP, using a unit test application and
the v4l2-compliance tool, including the  streaming tests for decoder & encoder.

The output of latest v4l2-compliance on i.MX8QXP, decoder & encoder:
root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance -d /dev/video0 -s
v4l2-compliance 1.21.0-4690, 64 bits, 64-bit time_t
v4l2-compliance SHA: f4316861d164 2021-01-06 09:15:54

Compliance test for mxc-jpeg decode device /dev/video0:

Driver Info:
	Driver name      : mxc-jpeg decode
	Card type        : mxc-jpeg decoder
	Bus info         : platform:58400000.jpegdec
	Driver version   : 5.11.0
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

root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.21.0-4690, 64 bits, 64-bit time_t
v4l2-compliance SHA: f4316861d164 2021-01-06 09:15:54

Compliance test for mxc-jpeg decode device /dev/video1:

Driver Info:
	Driver name      : mxc-jpeg decode
	Card type        : mxc-jpeg decoder
	Bus info         : platform:58450000.jpegenc
	Driver version   : 5.11.0
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
 drivers/media/platform/imx-jpeg/mxc-jpeg.c    | 2158 +++++++++++++++++
 drivers/media/platform/imx-jpeg/mxc-jpeg.h    |  180 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 drivers/media/v4l2-core/v4l2-jpeg.c           |   62 +-
 include/media/v4l2-jpeg.h                     |   20 +
 include/uapi/linux/videodev2.h                |    1 +
 16 files changed, 2877 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
 create mode 100644 drivers/media/platform/imx-jpeg/Makefile
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h

-- 
2.17.1

