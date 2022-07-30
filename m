Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A7A585A12
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 12:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbiG3KZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 06:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbiG3KZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 06:25:00 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50089.outbound.protection.outlook.com [40.107.5.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F7917A83;
        Sat, 30 Jul 2022 03:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aj+HyX5kinufA7MWvugU68zSg4H9C72YpF0U7bbDt2HaGPvJP5bn49FwNu2nLiv3nkKrBbRuVd2Z2fnx8HBAsATqs3mcGYNDmtJr5+3vrbaVb9Gt9gKpdiHaFF/2cAnThuB8LGOHJ+82s7DfBLyHl+ih1T5NDUWPff6UJDqn2aTiLv59y+04FmzavVOaaNnIOMF7GxBIZPb76a3AJf77W9CzkjfvdJw4dtzaTR03pVixbw72KtnByADaFc62l5ee/TvOq50JkuhMJzOmXS1dsgoPRX/Zi5INbL/gU+FJPm9PooKo9T6JmhMe/rlKfttaiaVu4pE3C16and8HBBg9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YicIA+FYpzRCRAkSvRDQTpoJT50k7kHXH8/yqYrInC8=;
 b=WZ9joOjpH/wun6erJK585GK3cMBrcUjXIOK+Aj1MSO34nFcSnkIhElhHZ/qyL9NUOX4bJj2cC7jNTkZPGevVD9vt9VfMJfe8OAc3qV5p0JzPdQB2DFSqauJuej6KwVuuXju7f4l7w/eY38hmw1sEAe0wk2fNVON9AWTTZgrw1UWxdF750AS0/rUysYZHBAshf3dOnEYtAs1GO+SqZ6A9Ga8DdwJy/oEEM2Y0AilphXhR5z1Ycp9c3IwSPQyQKJkamJEqzE8uTI4V/aXmziH7RNNb0MBOCHzgLItpfgYjceQvvAQWlmEaMvQKqtHAwkhNMBMhOuESY8BqZKEe4qU8+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YicIA+FYpzRCRAkSvRDQTpoJT50k7kHXH8/yqYrInC8=;
 b=AdduZelx4DO4itSXq0jOqpGXGVwdader34CYKkRX5HpwQZnOg343HOJ+JyopuLBET+/sCcnHnKs3+sRx7dlPLeY0Lt+q9d8nCN1onCT0B/jbVG0R0c5TiL+X4vA9UZlyHZTmTKNGOcvCey0LgHT2Fnx/WYjdNeWiDN+adA3zFb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by PAXPR04MB8621.eurprd04.prod.outlook.com (2603:10a6:102:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sat, 30 Jul
 2022 10:24:54 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 10:24:54 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v9 0/8] i.MX8MP DW100 dewarper driver
Date:   Sat, 30 Jul 2022 12:24:05 +0200
Message-Id: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::9) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2631d23c-6253-4a26-8ac9-08da7215be54
X-MS-TrafficTypeDiagnostic: PAXPR04MB8621:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XQ7x366QF03iIVZ35yuG5LPkGQxKuzsaRnxiALthuHA+AOoAKRFrJm5rrnnHVXEL0ci4L3SV3WwkL3XlL1i8iEOPbl2RwfCzBrZkSDDEsDgmIYT72af3o4yHlGxe6omWViC/sFyqum42oVYfJyWxFbIdFv40yyh0+yjqdO5gyZn5fUN3QwmMoftBiQvtvYR4Xy3U/uQy8+uN0WMfPsBDv26C4WiO+s8LZbKTqfEPQH8ImrVvKHi55wE1Pxsy4753cklbcf0jszEyS3PbDtn8/Jj2Nj77qiMgXrR56uwY8eiGjKEfsccW6OFQTEMloIDfcEt+szxMLov7pFmWGyhrh2jBsRK60n8zeaX8TJOG3m/j8DjsqPGd1sKPo3OkgzqJRzCVwSDZDvOVb+9EgI9gffoJw+EDBTsQZ7NFFZh7j7RVYaaCrno0D/bB1p3x+HAL76da/p+C2Lx8G0F26s7u6VPfU7KzRelsKG2JJ8Vs7hbFejW+IX5zPL0z1fzlBA91h5tfstlKJR5NgPzWlMHaWJvOjbyQYhCldL2Tgt4F+hWdFgwlnFzb/ps3cjszElukrPn0lRXrV4p4xvmchGGmvF3u98Lwu8djCEaUbR8lbucTvwZkfWHWIoUFFwr1mevubDt14AFbj86l1G7u9EHHBSbr/diVP0hAlzLGxNe76Ny/XmOqWBtn3LxmLwEqW/xIvwsiOxZNNZt1DRnXOHCaW6CWime/wMHzO+f5Q2Upl3R3FfjbNrUFyIgFvGaHaHvQyygt3X3UC5eV7IzsIuLAupTQfNVGKAMYOO5h0rtz4yTN+Q63RY9LFXdlBs9//Kal
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(7416002)(6512007)(4326008)(8676002)(44832011)(186003)(83380400001)(52116002)(66556008)(6506007)(38100700002)(6666004)(66476007)(66946007)(2906002)(86362001)(8936002)(41300700001)(5660300002)(478600001)(1076003)(966005)(6486002)(2616005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z/7u8Akf6yuU5M8RF5Jdbgvgk6RmLNCQkTz9+TuMzmBHBxvUtsumiR0T6Lo6?=
 =?us-ascii?Q?KqTXxav8TxuH5D9aTQEV/isb4N3TRvGB1kFZvkHtsRI0lNlIlFcEujXoqfkW?=
 =?us-ascii?Q?sHN9snvRvR+ZGlLnqpTZ9+pRW6TUytIuz2kQSMYSlnj6CV4DAaVrbtvU7Q4w?=
 =?us-ascii?Q?96M050v+D2W1TbQKJJYXshUrm6y+FisgVfgyXuopaoyYMpGAIgHn4tlHkimt?=
 =?us-ascii?Q?ViTfVE23CWxyZbC6jU0EkTLHpUFk+xa5qHR7uTUchVl1nAtyxiPnJ7YNFbYu?=
 =?us-ascii?Q?bNLWYKKOpsr/sdHw3gBTIbFCirBG0yN8zOONaNQlZZt44jDaJzUtJVhrN/oZ?=
 =?us-ascii?Q?OKXAutX4RV6M830T3IWOnAswkKntxoaT4SKSbZ5PaZ6SMHNV5LMwTCymuEe2?=
 =?us-ascii?Q?p9qDmYgn2MFOIztYJHlalmsId8MgOqhqnSJU54DiM+J8PIzvlG3LSLQI/CNX?=
 =?us-ascii?Q?T7malvkZxE3SNZJB7LmkJdexiARbHl0s9UdtVsd995UblwFWhlW4TUhjJerW?=
 =?us-ascii?Q?vOJjwXe1+nWwdpUSFb/uxU2DuwWdgpGEw8iijNI8d0s1pua78twtp6aqYqpl?=
 =?us-ascii?Q?eW7bht22kG1YUswUNnqTxh7C6cXeBYNX5SnhZlrgEJCp6TGL+K8lnuTLex8f?=
 =?us-ascii?Q?pxLINuu2sUkzMXtsYoAhGdW4d5mr9nQt7P1N4yzLU5HCdllZXU6P0I+LLZpD?=
 =?us-ascii?Q?LzM5S7KCMKKvXDY2InZFaqF4vTvdjP/TgzA3eg6iCn/OvjQfsVo0/9szlVYb?=
 =?us-ascii?Q?E7btRLyZECVpIMTVzVgKky+66xq4PQyk0t2/MdSKtaFm/Bwuev8Kj+DMLYC5?=
 =?us-ascii?Q?sViI27SRfHEG+tH+/afDP4pS2P5alcBnhvc1TRBuN7ynpS7/FftIpqGbaKny?=
 =?us-ascii?Q?A3a7RTaFpe2x78BkhnWns+3VQG4XXFE6lgfGJemXddedxKZYJjmHlDOXxjDk?=
 =?us-ascii?Q?hs5AikvEKMhNVH2PKI+g2DRUj8ulvlZd1P0zYw2+gaFLwj76oxCUmoTCIHxi?=
 =?us-ascii?Q?4mwHgfWBWctJnvmJDWNmXhqHSK+wR5ptCiWoDIUMsm5PlQoE9lzdRIHXXNt6?=
 =?us-ascii?Q?EICRteqCSZHiph4st/zgbIRDdoMtzX5NmqPkYHgDaLl2hKtiXIuXAneOSgLt?=
 =?us-ascii?Q?HTp8pA1U0cDtnIL9D0yPt32li79LiDdYQXLi/SAz2iUSVkqs6PFPP25nc0ys?=
 =?us-ascii?Q?RHC4Bwgsjd+y88IYQ55QonBc6TyKH/Y565MczEbfZ0hpzykMLyzsqXQtVjxf?=
 =?us-ascii?Q?tSNiqYWNNt4GpDfhtf8l9Lop7XyWEzKMgsBitpQndN7P++vGF0+7L4ODjPDU?=
 =?us-ascii?Q?KqmeQi38Jhlalke2rjYef9tO5OWZFfpqs16UsSXMiMmeEP8Cv3X/VdzmIpYX?=
 =?us-ascii?Q?OLDs6Bk9mCno5Rv4vNsGTRwrF901rEQJEmr35yXD10rH/8Yls+tgfvILlWbf?=
 =?us-ascii?Q?1yzR0ElQx5GjrFGksL1jgVyiVnQBR6M9EfGIZAB2SFqPcp201kgXaJ38CPK7?=
 =?us-ascii?Q?WNOiyLZY0q+p0wtXAsj3lC5dN5hPa1yBtH28ylTKfJF9eulOfGN8IPV2ezfl?=
 =?us-ascii?Q?fnABkcyNEczv5F1L/PREruTVGLYDxqSHZJUDE4XkqS8JaOExeYx7TBkmeL+d?=
 =?us-ascii?Q?DkClD/qgvEy5zQSzHW5nOfJDWBzUOy5kYtys9FItP1jBhE90vuvzYDN0Uijx?=
 =?us-ascii?Q?S9pLRA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2631d23c-6253-4a26-8ac9-08da7215be54
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 10:24:54.3499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v85/cutCCQ+L56S8iK07BO3xd0G/lZ3MxC2etMa0Jmf3e85dKOpwZL25EU3L90/TTDT9r+Lptvfx3Vzq+ci3GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset depends on v4l2 control v4l2_ctrl_modify_dimensions() [1].

Previous series can be marked as superseded.
v1:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7443
v2:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7472
v3:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7473
v4:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7633
v5:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7882
v6:
https://patchwork.linuxtv.org/project/linux-media/list/?series=8265
v7:
https://patchwork.linuxtv.org/project/linux-media/list/?series=8402
v8:
https://patchwork.linuxtv.org/project/linux-media/list/?series=8419

Patch [1/8] optimizes the v4l2 control type operations for array.
Patch [2/8] exports the default v4l2 control type_ops callbacks.
Patches [2-6/8] document the driver interfaces, and export its v4l2 custom
control to uapi headers.
Patch [7/8] adds the v4l2 m2m driver.
Patch [8/8] adds the driver to MAINTAINERS.

The patchset baseline is v5.19-rc2

The Vivante DW100 Dewarp Engine, found on i.MX8MP SoC, provides high-performance
dewarp processing for the correction of the distortion that is introduced in
images produced by fisheye and wide angle lenses. The engine can be used for
accelerating scaling, cropping and pixel format conversion operations
independently of the dewarping feature.

A script example [3] has been published to generate the dewarping blob from
outgoing openCV 3d calibration process parameters. This scrict can generate
identity map with h/v flip, dewarping and stereo rectification mappings.

The driver has been tested with:
- v4l2-ctl for testing pixel format conversion, scaling and crop features using
  builtin driver identity map.
- OpenCV stereo application using dedicated dw100 openCV module [4] to implement
  stereo rectification stage.
- GStreamer v4l2convert (patched to support dewarping blob map injection)
- libcamera simple pipeline handler
- v4l2-compliance (test report added after changelog)

[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=8375
[2] https://patchwork.linuxtv.org/project/linux-media/list/?series=8208
[3] https://github.com/NXPmicro/vtec-cv/tree/main/bin
[4] https://github.com/NXPmicro/vtec-opencv

---
Changelog:
v9:
- Initialize the dewarping map on v4l2 ctrl type_ops init callback
- Returns vb2 buffers to queued state on start_streaming() error path.
- Rename dewarping map ctrl name

v8:
- Use %p4cc for printing fourcc codes
- Propagate output format colorimetry fields to capture format in try_fmt()
- Remove unused colorimetry fields from driver context struct

v7:
- Mention the the dewarp map array control dimensions dependency on sink frame
  resolution in the dw100 documentation.
- Address Hans/Laurent v6 comments, main changes on [gs]_selection() sanity
  checks and s_fmt.
- Replace %d with %u on printk messages when dealing with unsigned.

v6:
- Use standard 2d dimensional arrays instead of dynamic array as mapping control
  thanks to the wip control v4l2_ctrl_modify_dimensions
- Fix grammar and spelling mistakes
- Use multiplanar API, and add support for NV12M, NV21M, NV16M, NV61M pixel
  formats.
- Various code and syntax enhancements suggested by Laurent's review.

v5:
- Add enum_frame_size support
- Fix checkpatch.pl --strict issues
- Reword documentation and add ascii-art figures.
- Strip v4l2 array controls size to 1 in driver state structure
- Use strscpy instead of strncpy
- Use min/max macro from minmax.h
- Use kernel DIV_ROUND helpers.
- s/0x[A-F]/0x[a-f]/

v4:
- Move dw100 driver to NXP platform media drivers folder
- Change dt compatible string to "nxp,imx8mp-dw100"
- Rename V4L2_CID_DW100_MAPPING to V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP
- Add more verbose description of V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP
- Handle v4l2 controls as an array in driver.

v3:
- Fix incorrect i.MX8MP Reference Manual link in documentation

v2:
- Fix yaml dt-bindings errors
- Drop assigned-clocks properties from dt-bindings example
- Add dw100 driver documentation
- Rework V4L2 LUT assignment with v4l2 dynamic array control
- Rename V4L2_CID_DW100_LUT to V4L2_CID_DW100_MAPPING
- Export V4L2_CID_DW100_MAPPING to kernel headers


Hans Verkuil (1):
  v4l2-ctrls: optimize type_ops for arrays

Xavier Roumegue (7):
  v4l2-ctrls: Export default v4l2_ctrl_type_ops callbacks
  media: Documentation: dw100: Add user documentation for the DW100
    driver
  media: v4l: uapi: Add user control base for DW100 controls
  media: uapi: Add a control for DW100 driver
  media: dt-bindings: media: Add i.MX8MP DW100 binding
  media: dw100: Add i.MX8MP dw100 dewarper driver
  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver

 .../devicetree/bindings/media/nxp,dw100.yaml  |   69 +
 .../userspace-api/media/drivers/dw100.rst     |   84 +
 .../userspace-api/media/drivers/index.rst     |    3 +-
 MAINTAINERS                                   |    9 +
 drivers/media/platform/nxp/Kconfig            |    1 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/dw100/Kconfig      |   17 +
 drivers/media/platform/nxp/dw100/Makefile     |    3 +
 drivers/media/platform/nxp/dw100/dw100.c      | 1712 +++++++++++++++++
 drivers/media/platform/nxp/dw100/dw100_regs.h |  117 ++
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |   19 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  151 +-
 include/media/v4l2-ctrls.h                    |   54 +-
 include/uapi/linux/dw100.h                    |   14 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 15 files changed, 2192 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
 create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
 create mode 100644 drivers/media/platform/nxp/dw100/Makefile
 create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
 create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h
 create mode 100644 include/uapi/linux/dw100.h

# v4l2-compliance
v4l2-compliance 1.23.0-4942, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4cf258c24026 2022-07-28 15:43:45

Compliance test for dw100 device /dev/video0:

Driver Info:
	Driver name      : dw100
	Card type        : DW100 dewarper
	Bus info         : platform:32e30000.dwe
	Driver version   : 5.19.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : dw100
	Model            : dw100
	Serial           :
	Bus info         : platform:32e30000.dwe
	Media version    : 5.19.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.19.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : dw100-source
	Function         : V4L2 I/O
	Pad 0x01000002   : 0: Source
	  Link 0x02000008: to remote pad 0x1000004 of entity 'dw100-proc' (Video Scaler): Data, Enabled, Immutable

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
	Standard Controls: 0 Private Controls: 0
	Standard Compound Controls: 0 Private Compound Controls: 1

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for dw100 device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 0

--
2.37.1

