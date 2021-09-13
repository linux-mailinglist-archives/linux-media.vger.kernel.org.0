Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5384087C6
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 11:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238444AbhIMJNH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:13:07 -0400
Received: from mail-eopbgr50060.outbound.protection.outlook.com ([40.107.5.60]:29525
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236022AbhIMJND (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:13:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faHG44Ckf9XBlVuYikTJ596dX63VI6DxD2ZM1dYqKCXMu2CwUsptJM42jWJLbwh6fiMCjlm3o1VQ5gmVZBU4lAutku8DPenSPXZfGOfa/Bf1iGWqeRjXSAw4NRMZH7Uw2zre/S79Tfoh4HC0UIh1VlJgwfGpAuMY6YpxtIxMeAj0tAcYB9CtA2ahElIkWD9t99AX0+pHdkVe86SUc9HaJb3pPSlwKOJL+IMEyPYFJsfsNmrXcGftn8ssPx1kI2kksw1mi3Qd+ugiGQN5WdFeJ2Jzf5fiGmnbscDXRklSryU+uBpN/1DkLbZGOa06oQdb/AqzZXylGGLvMvosHmCvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EwHzzMSiUYbpxT5113HmiG1yozlXIoH6mIadCAonxoQ=;
 b=JhlU7VV1Op5OMaQ+HBJChDGYsJBcGlc1DokL+pm9s+ayx2/puUSWgAmRI+kDcTm8WZFSZm8l+EsVsXTsXgzZSoVErZBDWpcycWEboOIe/DzhhaR3fEJ3vT4Byjmc5PjrQxhJii8Qv0KnmKD8aheu1dK8d2SPoY7OXfqF2PokpzeOHelQhstt2pQdqm2/AU5wZwoRS5H4Wlk0mbsE0/vwCUEOFndh5WYWag1eBnOFvaUOwa6xxONpIG4gd4gNRAuNv+zhvpoRYb4v/2XVyI5gXlZI99VNOqp/Ik9fMJpGQ+4rcP872/T4p1wKQoPF1PsQMHURzLtDHOOpmdSVs1KW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwHzzMSiUYbpxT5113HmiG1yozlXIoH6mIadCAonxoQ=;
 b=SGBz8NtvJ2E/BS9ZyPul7yu3RuDYmbbFT1clcbpQOop8FE/TaCr3JU/Ia9Mj2e3nqN9S5mFTralrs2wBOysXOVNdq/Q2mL6majYY8DeXKI6+gR8cdYPeOYtvhbFIQT9QwwKoHW7jnhZ3JyZ5caKFGOv3w2GUeh/27bN9r/KL3kg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB6134.eurprd04.prod.outlook.com (2603:10a6:20b:b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 09:11:44 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 09:11:44 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 00/13] amphion video decoder/encoder driver
Date:   Mon, 13 Sep 2021 17:11:02 +0800
Message-Id: <cover.1631521295.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0101.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::27) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR01CA0101.apcprd01.prod.exchangelabs.com (2603:1096:3:15::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend Transport; Mon, 13 Sep 2021 09:11:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bafd82cb-89fb-41a8-b6ce-08d976968138
X-MS-TrafficTypeDiagnostic: AM6PR04MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB61342B3AD764E461C3DCA983E7D99@AM6PR04MB6134.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DC28tjb9I3Ej2JnGUIhNuQ/3TGtp72h+00X7K5DsLiOzvyymrQvOF7Oi6/cjoNsA+Gsr+nznZl5CAyuLUXvbtkrZx3tlavbx6kmpAJ80UTJOD8J15+Cw5qENPBRYxwH7vDNMF0cF+PFt2KTrC2ekaBGw2YsV4O+C8fK24qD8EWKpPKWvEUoe9jwNQ7XaRsEe66TDXWVr+9ALTNYZdkfELsZ/KBFbldgzoOzCPUtaQtC+SJ39q5yn1TfkDuX8RQFC+t9YTVyk4l2gFg6VwV41+NeT+Rm1DBHFCkA9b/1e7TPzixwNBaVBaQTX2ZXQXgCVne58Jzpv+6O0LYO4Z15m4cjzjzNtIyZk1PZdfD8nZNhpi6Yhu7YN20gf3CXJFEVzX44qeUVMbp38SIFdFVLId4xkpQHSBLRyWkjojA50nwuo0T58qOnsZHKxCG4geDh0re3+aDYSskFsVZNbV8nvae6YMT6cxkSi9Y22bpotYgz/0wqaAoqoW0S7Ig5yQg1ExD4Wgy1gJO6xOjzBGDxVhuH1XT6NcyvsOZg7s5JHeavY+IJMwToWrJpfd4wG+FwY5Nwf4fwCUElTthHZyqSDrUKXqpikKpvN2D9Y+YEnLgKGWf+wjfpI0G891XCmuTGvhCHP0hWNEu4ssf383nRBA4LlIh3Cucrb0AiR+X9pbr/SfU1EK01Z/6xUpvo512qolXoDVkRx4nI728xDA5gYSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(6486002)(30864003)(5660300002)(8936002)(8676002)(26005)(83380400001)(38100700002)(6666004)(66556008)(316002)(36756003)(52116002)(44832011)(86362001)(7696005)(38350700002)(478600001)(4326008)(956004)(7416002)(66476007)(66946007)(2616005)(2906002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u5tcfvACRweaNx+jsJDWgXRqz8uez4T81PWyMxGn0TBW+hZ1LcbUS4IzBnbn?=
 =?us-ascii?Q?E12IPX8wwwft5CEpeEa/d5r0IUWkkRf/XZZhO7w3xcXNS5XoAXXJ34ouLVVU?=
 =?us-ascii?Q?/xoGWb5BO+uLHsbxYKMyzjCBsqbOvhO0CNPRxWk2spCIMC1huUGSF1V9oHiG?=
 =?us-ascii?Q?vbLJZybv82jDMFDASKjNjnLl0O5KAL9yMt9hkJtBmm9LattXLXQCleMB7bZN?=
 =?us-ascii?Q?IqoKHQIuxx9OtFH1G0fiyY574t84n0J23KRx9XvSJtS/ObqVUX9qeDCXugwV?=
 =?us-ascii?Q?HK6Pn8lEClD75RPBYCqGJel9ScjC2QQLg2L2VHrVSQVpZV+0BhIeGCsplEDS?=
 =?us-ascii?Q?V4lq9bNNq+P6aCQLrxhyIORYopww3jKLwJhoJNFDcAF1EruZVehmyMq/Id8K?=
 =?us-ascii?Q?AEjPculm5CXfZCC4ONFxUJfUe8OiIvXwD4L92UF1c/3bsxk9csWpUGrgr2UG?=
 =?us-ascii?Q?Qh99zsV+UnppqFzTNxMYJgxovuCI92v+FTaO5IOA4hNKTi8GkqWVr7u/n007?=
 =?us-ascii?Q?NKWcVyRAXDLzybDmXCdKypUvCS5T6En86Bq1m+z8bpMj90I0iEa9SyTzFheG?=
 =?us-ascii?Q?NyAA86JGy+dfslhNs9Zr5ZlLMTNz8OZBOhXMeSPePmvLeC/b5dc6tnJzElNX?=
 =?us-ascii?Q?qCZApp9OTuOGpy7FfmcCBfffJCwJUhuJ+Qctc1AlQT9ug1XDapSq8debWwSl?=
 =?us-ascii?Q?rdRRW/OGbcl79e6QWqOAFxcKIt+QCCXmQNsbzZNRGQ3zHnVuxPu3a55w/lNr?=
 =?us-ascii?Q?L0LnDbWZiXmPmpoDPrEdMCyMcjIV4+U50SvG47fWLfvqnsl00CrsXn/IRiPD?=
 =?us-ascii?Q?DfPb3QqA8PY/EEf6X6tzIXCNNoKqHZDH+tqHHCEJeiQt3Kpn1zbk/e5Ytdmg?=
 =?us-ascii?Q?cE6gEMIeXNpZ1/1ZH8zCpf8Kdszbz8BwUHgVXkQU8O/owfehybwR9X4zxb7F?=
 =?us-ascii?Q?k8z1e/LE8o/RXxiaa/VtrHIk8wQjvTz5tzZ+EvMsm5cV9wnKUQv9aUnOe5q5?=
 =?us-ascii?Q?Zahmbzph+QBVm0ry/nWclNYnLduxLPYMNqFFagsqvz0PMLb65Nf+eDag6CIg?=
 =?us-ascii?Q?FSRFMrFz6YjX3+Rzz1JhH3aHW9PmowqK8FUWwFZQW9rP8SqaV/Du/vTyKYZz?=
 =?us-ascii?Q?gjWAVek4gyG0DrWn+qydPmLLp3am6ZcI7YP5lCZr5jYr6k0yZCONHyCG+BFD?=
 =?us-ascii?Q?lzkuiVDzBITljsJCzsfsHS7KATRU0GTEHaGnvTDISTNXkXGD+i2RKIUPxWbk?=
 =?us-ascii?Q?7wqUGriRE/FVlegATNfGSaxMTA4jRfkgfuQ0zpZL0rJoGT1byiooqfr+vMCI?=
 =?us-ascii?Q?LQ6DNbWM194pynDW5QeHt0sP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bafd82cb-89fb-41a8-b6ce-08d976968138
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 09:11:43.9632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t74B8AfgYLmhat6A8BjkRVAOIUSbnXtjtFQoN7WFJYi6tSYkC4TvlS9zratFlVo/Z2aFjnLow/UOmIEYPcRQEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6134
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

Changelog:

v9
- drop V4L2_BUF_FLAG_CODECCONFIG
- drop V4L2_EVENT_CODEC_ERROR
- drop V4L2_EVENT_SKIP
- use the v4l2_buffer.sequence counter
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
  media:Add nt8 and nt10 video format.
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
 drivers/media/platform/amphion/Makefile       |   23 +
 drivers/media/platform/amphion/vdec.c         | 1652 ++++++++++++++++
 drivers/media/platform/amphion/venc.c         | 1382 ++++++++++++++
 drivers/media/platform/amphion/vpu.h          |  333 ++++
 drivers/media/platform/amphion/vpu_cmds.c     |  435 +++++
 drivers/media/platform/amphion/vpu_cmds.h     |   25 +
 drivers/media/platform/amphion/vpu_codec.h    |   68 +
 drivers/media/platform/amphion/vpu_color.c    |  192 ++
 drivers/media/platform/amphion/vpu_core.c     |  901 +++++++++
 drivers/media/platform/amphion/vpu_core.h     |   16 +
 drivers/media/platform/amphion/vpu_dbg.c      |  496 +++++
 drivers/media/platform/amphion/vpu_defs.h     |  186 ++
 .../media/platform/amphion/vpu_dev_imx8q.c    |   72 +
 drivers/media/platform/amphion/vpu_drv.c      |  215 +++
 drivers/media/platform/amphion/vpu_helpers.c  |  453 +++++
 drivers/media/platform/amphion/vpu_helpers.h  |   72 +
 drivers/media/platform/amphion/vpu_imx8q.c    |  218 +++
 drivers/media/platform/amphion/vpu_imx8q.h    |  116 ++
 drivers/media/platform/amphion/vpu_log.h      |   44 +
 drivers/media/platform/amphion/vpu_malone.c   | 1683 +++++++++++++++++
 drivers/media/platform/amphion/vpu_malone.h   |   42 +
 drivers/media/platform/amphion/vpu_mbox.c     |  126 ++
 drivers/media/platform/amphion/vpu_mbox.h     |   16 +
 drivers/media/platform/amphion/vpu_msgs.c     |  413 ++++
 drivers/media/platform/amphion/vpu_msgs.h     |   14 +
 drivers/media/platform/amphion/vpu_rpc.c      |  263 +++
 drivers/media/platform/amphion/vpu_rpc.h      |  463 +++++
 drivers/media/platform/amphion/vpu_v4l2.c     |  625 ++++++
 drivers/media/platform/amphion/vpu_v4l2.h     |   53 +
 drivers/media/platform/amphion/vpu_windsor.c  | 1244 ++++++++++++
 drivers/media/platform/amphion/vpu_windsor.h  |   39 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/videodev2.h                |    4 +
 42 files changed, 12226 insertions(+)
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
 create mode 100644 drivers/media/platform/amphion/vpu_dev_imx8q.c
 create mode 100644 drivers/media/platform/amphion/vpu_drv.c
 create mode 100644 drivers/media/platform/amphion/vpu_helpers.c
 create mode 100644 drivers/media/platform/amphion/vpu_helpers.h
 create mode 100644 drivers/media/platform/amphion/vpu_imx8q.c
 create mode 100644 drivers/media/platform/amphion/vpu_imx8q.h
 create mode 100644 drivers/media/platform/amphion/vpu_log.h
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


base-commit: 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
-- 
2.32.0

