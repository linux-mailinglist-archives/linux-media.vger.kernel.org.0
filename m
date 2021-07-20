Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0E03CF1C7
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 04:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239357AbhGTBX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 21:23:28 -0400
Received: from mail-eopbgr70085.outbound.protection.outlook.com ([40.107.7.85]:8686
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242583AbhGTBDV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 21:03:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOhCbKWJpM/K+w+79xHVUGTIIej6q0B4q0Feq9I5tLoIpbDpDHgqv3EZuodv5FTCk6AioPaCj1ecbqL7tzqy3SootMcfrOVZCJekL6AoxTXD2BRygDCL8AX9HRPw4LkqlKVovKIxb2H3iGsqDo60Gsy1Ica6n+X4R/2X3EioiIS1dvfKeiQmhzaQQY/bql00yFG2oKEqUnGuN4UiaBfZ9NSZKmayoDzkf3Mkwd0TUIbU71uEMJ6k90n+7yR+mhqiqMp3cjY5iAugrFLpX/0XxlpDMqAlLCBraoxy0OzBFL/3nafkVLzdds4YCwY2SkmUFq3pT1s3u3HoCoSYbXZe+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gb0/wwNGVuNf41bALzxNOFKd6mpWke2nC8w0eTmQ908=;
 b=oCF0VRzn7KrgyWlJq7NLeVZ3qm4OTnWGih7LK2Mwqs+F8hVbWrC49lxxfZJx94X22oCc7YrWoFwJjEm2zXKXgQ9430fYffR4bpkrTlG6jD37ejuezxzq0qAYSq6DZXAyarb33OqYvuPE4rHDzM0mK+tIxS6Cz8IcOWKzi9et/D8lbPoSSx5OfNKAT3hkMQ6Djc2qCL+Uub3GbGLMFeDE1ofJHUpOEibOlNu2QPid+WDD0d5nJhs4AZlcqkOSC+JcCknRW2UOFWszp95RUi/0eNQKVjVP9UmcIY+ZnX/6iVMnv3tyaX3fi5+GJ/35GPaxYGKkDDnjauu2+iFktDzMUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gb0/wwNGVuNf41bALzxNOFKd6mpWke2nC8w0eTmQ908=;
 b=o0bY/2Q2wqWoVNYItfNiWdDjuu/SVMT8T/yLkafvrdkRZXHfZNNaB3pa0gF7fgmR6zpsrNvqsvpR957xVOiwfEkd+uaQjcrdO6y0UlLRr3zZyggTWIWzTpAiMqEUK3o71xsqYNcNLwGOpATXKD2uaaQCawjTzUTvUJXxXvOWGbI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR0402MB3813.eurprd04.prod.outlook.com (2603:10a6:209:21::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 01:43:56 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 01:43:56 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 00/13] imx8q video decoder/encoder driver
Date:   Tue, 20 Jul 2021 09:43:19 +0800
Message-Id: <cover.1626743758.git.ming.qian@nxp.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To AM6PR04MB6341.eurprd04.prod.outlook.com
 (2603:10a6:20b:d8::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lsv11149.swis.cn-sha01.nxp.com (119.31.174.70) by SG2PR06CA0232.apcprd06.prod.outlook.com (2603:1096:4:ac::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 01:43:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6763761d-f113-40c8-5e14-08d94b1fd672
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3813C6A960E400F1427F6E41E7E29@AM6PR0402MB3813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ws+O1Pr+aqzDprYwUZCqPeEGuf7n/VNfRn8d36oDYQlQmbLi7vuQ+BWPJrpLPp5TBaJtk4z+D6qlQDnaRUd9xStc8Z0UHZy+i0CWwZqxrcdUn3zuY/FtvVs6vkc/cgzR7uMF+gKj3IE3dg51eDRrQaU3sq0GcfQGyaFKXvJWcwD6E28KoHUFRn5sk/RIaUoMaxk2tL8RaQUtCCZ+Mv+jYgekbyi3jETYw6PikmZ0M41c+fCM7AwxMBdFRSs2zu9x3851gwgBtd8iysHgtjETk41NrNjGTp9UIUIDZb4E1cLrEXEJadYeZ+OXMY1k9mROnFSyMIIV+BYlWLTUl5cdFRe2GjZXUCU8vbmJ1v6M416xt2Uj5pW+efvL9pF7ebf35ice/DBNZ/SQ6BPNuRXhrTvOphQVwODntwoA+2rwwcc2zOOjNOYgyq/ATEb0VQMdBiglM6J2+15WseUrrWm7hj9+lXbOqQFeyDy37exEUZZVHGygE0YgAMvzJe9ZBW3f2BO0Osu/6vqatNHSYkDJqIaCJlaLRYKTYgu7LkO+fWpTsKHhNkteAiu+7iS3v8QzBpsKq++QpPgiYV+/JO3vmzVoMvBJss8Wr4tqyPhGSbdpJManBedh5bA2+9mmjFccah1Xq/5GP/bY8C7mVeJtEM+RcpcwocOZLaMMALx9IH2UZ0uuaN7W+PH4RdYk6KMHSt7rg/BiCbXTsTR9dLNBJfWFTllrs+odcPNLhQ60Tdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(30864003)(316002)(8676002)(7416002)(4326008)(86362001)(6666004)(186003)(66476007)(66946007)(66556008)(38100700002)(26005)(38350700002)(6486002)(83380400001)(508600001)(44832011)(5660300002)(956004)(2906002)(2616005)(8936002)(7696005)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5mi21VhcXzBMTpoya1cDUrw/Gv6AwM6VkaV4sQ9oIv4SNf2jJ41elWvNmuDe?=
 =?us-ascii?Q?PsvsfiFa8B3zJF24CwRkI/oFCrtzU/A9+OOToGsLCIsotFVf86PGXDI976mn?=
 =?us-ascii?Q?pWhmYCDJW0mPH20gw51dmVkQWugM8zeblm4ToLKcCoBmaRiWEZOHLY/WL/3N?=
 =?us-ascii?Q?jxQYYvVznXultHc052sw2ALhY70mLL/kDzqWGvHBN6uk0ITynbHprzhNmhV/?=
 =?us-ascii?Q?0hPTCnsgc4GtSbHYDlYmjAjZXDrQWOs9DX5O/F3tmAORnayrorqRn++geEw/?=
 =?us-ascii?Q?CnY3GfATH7ZjeMZ2+/PipEgQ9DW7KW+Ji3SaYh9gIlKoAAs4sJYydcZ5RHli?=
 =?us-ascii?Q?Go3o0NqQYFsUTCVhTqyh/WWbeoTeecUNP1/kFgIG964VfkPkcZp2SpUoDmpb?=
 =?us-ascii?Q?MTBOgx8O6rVBIJvZvtBPTdXI8/1vVGvEMgr5f3zPBKFLBJ3Iwd4L9tuSNt9W?=
 =?us-ascii?Q?nQSTeNyMw6gjaA8yYU5XTpX4PQKLSkpYhTHxH8nAPa1MZqTRDzj2AZw2AVJU?=
 =?us-ascii?Q?b06j01BhMDjk9xA7dfWc0gaSlxHsC7lkgxggdrnsS4WtV82VX9V06LUou7XQ?=
 =?us-ascii?Q?HZR0IgwLOzzLoQcA8A2lArsKdd02QE3m52nCZ1sOeFp/RVXwZTTndUZvKnfK?=
 =?us-ascii?Q?nz1QkQ4hM16fBmJe1M0FOTfkOTzN0KBT3uxlwXG7ClUJjuHNDHHTpkAWX5eq?=
 =?us-ascii?Q?cNUn/RHFE/cY5jq7VnKel4KOgmqhz8ytxF8RUQukewrW+2eOVvOgtQlic9dr?=
 =?us-ascii?Q?xlnHLnbR2BryTIo/74juhnlDRaz8H1MolxgHnlrytCtW83oeMSXVc4T4jqvW?=
 =?us-ascii?Q?f5/btZmfyyAjVmvKI46X5WDnmVhWQW65WdGKKB44UJ88BdeXPaFSeSh3lwUT?=
 =?us-ascii?Q?ZBd1cmlbXhGDw+WXvBCXk5y1pFgKcEN+7hnMJ0VilrSKYZ383UvUtK7+Nof5?=
 =?us-ascii?Q?gwm4QVVAZquJerai5U/UgvwQ8namCIh9+cmEviijSAhjthGZS1K9eIitOqMg?=
 =?us-ascii?Q?fTUyERCoi+sVCGRW/uTaWScbcaTxL/jIB0BzWWny1S6lR3ks/i1QVHKIpIKH?=
 =?us-ascii?Q?Pe4kZPLbnecTQAqeM8JbMd+GwX8hHXV2c6mj+Igux/y2UPohZIj/LgftlP99?=
 =?us-ascii?Q?IW8OGukpP9iy2YHBEXw7EnMWer3Ur1errvN+n1xzc99F6uVIVAVwG0hZ+EB8?=
 =?us-ascii?Q?h8HvEpvm7R1eufykY0goVPpv0b4Rjq4ZlunoErqJTrInyPDe4rPSKwfCDewb?=
 =?us-ascii?Q?cptsTX7iVN5V503vz7c0Q+Zw0A0HXhsmVQ0Mshj450VONcyGRx+fBNBY/Jay?=
 =?us-ascii?Q?+In1axB/P6nVChkZq99zyzkr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6763761d-f113-40c8-5e14-08d94b1fd672
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 01:43:56.6443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DC14fJJc/Nf/58j31lLnn3ryDDIfJseAnTqjmaOK19Kbjdgti2eKfXT3dxtF/W9k0g2KuPog+ct0BWI/3OSa5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3813
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

 .../bindings/media/nxp,imx8q-vpu.yaml         |  178 ++
 MAINTAINERS                                   |   10 +
 .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   26 +
 drivers/firmware/imx/scu-pd.c                 |    4 +
 drivers/media/platform/Kconfig                |    2 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/imx/Kconfig            |   19 +
 drivers/media/platform/imx/Makefile           |    1 +
 drivers/media/platform/imx/vpu-8q/Makefile    |   23 +
 drivers/media/platform/imx/vpu-8q/vdec.c      | 1817 +++++++++++++++++
 drivers/media/platform/imx/vpu-8q/venc.c      | 1395 +++++++++++++
 drivers/media/platform/imx/vpu-8q/vpu.h       |  343 ++++
 drivers/media/platform/imx/vpu-8q/vpu_cmds.c  |  446 ++++
 drivers/media/platform/imx/vpu-8q/vpu_cmds.h  |   34 +
 drivers/media/platform/imx/vpu-8q/vpu_codec.h |   77 +
 drivers/media/platform/imx/vpu-8q/vpu_color.c |  201 ++
 drivers/media/platform/imx/vpu-8q/vpu_core.c  |  919 +++++++++
 drivers/media/platform/imx/vpu-8q/vpu_core.h  |   25 +
 drivers/media/platform/imx/vpu-8q/vpu_dbg.c   |  505 +++++
 drivers/media/platform/imx/vpu-8q/vpu_defs.h  |  194 ++
 .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |   82 +
 drivers/media/platform/imx/vpu-8q/vpu_drv.c   |  225 ++
 .../media/platform/imx/vpu-8q/vpu_helpers.c   |  405 ++++
 .../media/platform/imx/vpu-8q/vpu_helpers.h   |   80 +
 drivers/media/platform/imx/vpu-8q/vpu_imx8q.c |  227 ++
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
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.c  |  662 ++++++
 drivers/media/platform/imx/vpu-8q/vpu_v4l2.h  |   53 +
 .../media/platform/imx/vpu-8q/vpu_windsor.c   | 1253 ++++++++++++
 .../media/platform/imx/vpu-8q/vpu_windsor.h   |   48 +
 include/linux/imx_vpu.h                       |   19 +
 include/uapi/linux/imx_vpu.h                  |  120 ++
 include/uapi/linux/videodev2.h                |   30 +
 44 files changed, 12828 insertions(+)
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
2.32.0

