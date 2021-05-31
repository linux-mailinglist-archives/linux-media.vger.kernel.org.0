Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352713953FD
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 04:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhEaCx0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 May 2021 22:53:26 -0400
Received: from mail-vi1eur05on2056.outbound.protection.outlook.com ([40.107.21.56]:27681
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229998AbhEaCx0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 May 2021 22:53:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJI7jKlwdTKgi8hvRQ1RNHKJ49eDBAafOlr7CU11nf1MHEocmH9QPt+BlZ+Ijhw8HUi0K+A0M5jze7pyDBFLQIGGuMiIVeQX6OJMWxSfV0cE5pRxd0zQ6i3KUXp84iQmbhdH54eCap+uPgVWMAyO0WWtQoWLlBZ3WxKtDAlRKegM+T7iJbx6UzRuWNRNryE+iH8MoUa+n5xIre2SHRqY32IdgmKqhSxOLDv0yY773UTXETwyLJ6FOSDVK/h+7HBgwbvhlLKADDWhwKb++Sb2I3CipNsEI4uU2YbOvxI2lwETwdyTHR3JDLyfoeoPW/nIUZgVwVTwaGUXqjrmaGTf5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNoWQmFAjV/aZuiV3AZ+tkNQadN7HlNHvK5WbROMJHc=;
 b=FNyZSqoZW06T2h4jV+ywDKkFLJPavPHRIBBr4SpidguKyKiZFuamrlzBfNkp32V2wUSEzF0YTiGh8eNlWUQa/CJ+0PDrHAk9zAStuWL34lK0xfhzpkkwhVG7bUNVQPsSzMHRGOMGtDGfXBKo0pil8jiulJMwdxfyMXGEGCI3DJjHHLlfBBuGzDqMq4QgzqkKPeqYDc5OQ26vAF7xRqXBY00Cbis1qyP9HWAAbZN+EMdaCZwQAishsuifmY5sVxOg1jP2Ho53+GDF4SbpabjXDmjDF/VZIhnC/ForbsIIjPYibLTcn4vJW8eebz/IaeTnQomWK5r5tG0NM5bspzSsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNoWQmFAjV/aZuiV3AZ+tkNQadN7HlNHvK5WbROMJHc=;
 b=HL1+qVox8++y+LWsj+49d2hEULAW+SkZRLof0KHSXVmebqnCXHxWELIeMSeT9RbaQJKII6IYs0v9ITDPHzxk9s9WMB7ZaQxhgO049gwNxN467I0SXXxJKxT+v7pQ5dw9CQc8/KcdNUKMBsaAw1IJox8Su53PLVeoLVvviG2MMpA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2546.eurprd04.prod.outlook.com (2603:10a6:203:38::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 02:51:43 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 02:51:43 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] imx8q video decoder/encoder driver
Date:   Mon, 31 May 2021 10:51:08 +0800
Message-Id: <cover.1622429025.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.70]
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 02:51:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07eca550-34e5-41ff-4864-08d923df05a4
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2546:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2546A0A40E37A30A48566C35E73F9@AM5PR0401MB2546.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CxCEt+qggvEqoqqm2NIMQjpBQ+5u56pofWtfJStNnqjxzGlMxJOUNd50UXvimvKm7xLdud0/QO5ISQoZy9NHfz4B5/QnBMte4b/G9mMJg3m1jDU09GvtJfD60eP4Y2puuNSU3EnItZVPNsPY/E/cK/K5Gdf2oJWRqjZKPx8dyHsbUWv2X/0msNYLOTho2PVlnFOOB7ofe2+yMl0Ue6NekxjANHawqqnq1mq7n/q8n/HX7aZA5AoyMO/Qj/82hCN9+vu6bGAwCPW4SUHYfV/sQ4VB93+QU6Q34AgfRCZCtiFoOxNRglT9hbbEz8i5XZRqUA4ROPProMwm4FjzL5Vc5xI0IPN6uXHkqVKA44FQQ7bVhkzKwehwO0kCx4pLIeN7rGiJRm02zsR/yxACHYWUuIqbI55wn/DSBvZ0o/xBdwOyCvZDKDilMeY8CYuMcuyuZgwtsXjbohbSCKvf8anTeReGcxPgd9WosGxOlZzcqyKLJVX8wT6+dOOOnh5NIKZ9lB3zDY9lLjDYhVv9f9JND1zWylePYw5+n5Ria8vmHGmcF4bSEQndr2ZY/uxEC2Df7Y/N8iJDtescgLTK0wCEJPIM3tjJOkZQeMRue4n0Fp5GjG9GDeNDQ7r6cKOZgkhwJF5DIEIe9tvlmYhO9dbDJ1hKj/+F1b+/hI4z67I5rMI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(5660300002)(4326008)(83380400001)(6666004)(36756003)(16526019)(66946007)(66476007)(66556008)(38350700002)(86362001)(38100700002)(44832011)(186003)(7696005)(2616005)(478600001)(30864003)(8676002)(6486002)(316002)(956004)(2906002)(26005)(7416002)(8936002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?21XphWrgbrHmkLoTC13z+L37B6qCpeAmndGzGnWPHRx3XsjlaEEg6ztG05/m?=
 =?us-ascii?Q?CYbU10qDD63AseROK00DMNP0CbmdtnMh9AAezI9XD0xpQz6W0pfY2x8KE65E?=
 =?us-ascii?Q?ipmAr44UTigb8JbaBQ1xZG3ngzklN0BtkhaVZdgrEtE0v+fr2fYGrnNg9FU+?=
 =?us-ascii?Q?+euhUWM6g2QWpjcBH723tVSqtUtzYUVT8lcHLBPmUynxuPssm2FANJMI4J/5?=
 =?us-ascii?Q?VnfV8XIfetOO4Y/lUUug9kMd/e+WJH4Tqn1MM8sKTo/csidjAgeoLTAiBW63?=
 =?us-ascii?Q?V3WsLTIpchbcFB5vXF/LYnUKvcVYtfn98PGQ9XgStTMGkhxmnUgRByPQDQMt?=
 =?us-ascii?Q?xSr94iJkV/h+V9tJq2t4DZO74ch8PMV1jMsqyT72ILAU2pjIulex24uU5U2n?=
 =?us-ascii?Q?yL8et1EJJNifbmeDfLHKk+sH1yAkwPVnSJbTFu4c0jxiSoxCifswwKxxM2Es?=
 =?us-ascii?Q?+SPEE+XYbo4I20lQjSA1nSyHJW4chWW9dSmjH20vWghAw+WKms8FE8SdJphX?=
 =?us-ascii?Q?aNNuoRjGIYJNJgeKtic5zdpU4i5PIhfcGMVItDWXzgWunhlk4ZA5Yydn76sB?=
 =?us-ascii?Q?nGmryqhq1Qk6Uclf9bgx/YTjGYOVbad0j3fVU3SlcLKluhxM4HuIyHI4NZZk?=
 =?us-ascii?Q?pwnTjZ6g57LXqx9Ssq8jKMQDa8i4g9WVY6XNYO84tvfBvplJUB3KFqMqU6cY?=
 =?us-ascii?Q?3Llem1WnAMytpxGpMEdqErngEkokgcjmpkcGpjZs9FQkwoZZTmMliZVdmlfj?=
 =?us-ascii?Q?YYu7n6rSJZ77okwG4xTSeNRWbkCp+rXnEY0OVr89g/GGblq+DQoS5/pSpQUN?=
 =?us-ascii?Q?cZz5DjeEe2BBcJ2msxXu4RSz8Z8KoBCErOS8yTuwtIByR4WAWJ7W+ecPB8Y+?=
 =?us-ascii?Q?ej/sq4z5RqiF5e9n3z9I3UY5o+6z5oWVqCRj2kVO6fi81s+ha3mkzPRHeG+T?=
 =?us-ascii?Q?kp1VZ5F+RKiCeHUlA4Ee8nj9O+P8fJUw5r+AGj+qC3GViIlTFbv6BdR++K6u?=
 =?us-ascii?Q?mI2Ykgt3/1N+rHQ1emfkob2cJcFkG2WDbduRyJ2eQQH0fo/+xP3wKtb1cctj?=
 =?us-ascii?Q?VlZWQqoDwI0inAynwtR170nLE7YbJBzArmRp1f/XQL4RBtJo2wjyL6Aqlx/T?=
 =?us-ascii?Q?FqOtvqsI1gnE5HzqPGi4FDpS2HNp2VgUHUd1Kn+uV6+DUvewjP9HfAbNgyRo?=
 =?us-ascii?Q?ntYvXAXtoyGjEWELcFHPwVi99ek6AKIf8GZkr3vfHo42KyAuhPRViTo4FWN/?=
 =?us-ascii?Q?Vgt6PRFUTtzqMMSOHaweyjt0+2TXsFSNNiBNhN6RBL8GT/MWqjeho9tlyZwj?=
 =?us-ascii?Q?CiA8nN+wn2uI6Shq9v/zyUXa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07eca550-34e5-41ff-4864-08d923df05a4
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 02:51:43.2445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAlFQNAdneZ9GsyYSKDEIDnPo+VtOXkNN/Xalj2DM6+YeGPSmcyOoqOPnZExIDcDgSzMyA4afxnbsuhp55F4NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2546
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

Ming Qian (5):
  dt-bindings: media: imx8q: add imx video codec bindings
  media: v4l: add some definition of v4l2
    colorspace/xfer_func/ycbcr_encoding
  media: imx: imx8q: add v4l2 m2m video codec driver
  ARM64: dts: freescale: imx8q: add imx vpu codec entries
  firmware: imx: scu-pd: imx8q: add vpu mu resources

 .../bindings/media/nxp,imx8q-vpu.yaml         |  201 ++
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
 43 files changed, 12925 insertions(+)
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

