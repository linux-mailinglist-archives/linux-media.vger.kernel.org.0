Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710F0585B13
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 17:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235120AbiG3PtL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 11:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbiG3PtJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 11:49:09 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F346D15A15;
        Sat, 30 Jul 2022 08:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Icn/ML5tTyHz2sUK5LQ0CbCvp1xQom0fLZT4wevOtvx6lAX7WAFibaiG7pNdY8PGUK8sMEoHBw1/LJPA7a0bLbzZuhQjaCWbtqHsx0N9FBoIN37y+CXbJfQqPtm3A6HQzoBZxBRgmTviPT5SB1GsDLb9jM6zQVDW8RL9tnk8vh4vF4rFPrrc5TPVTN4Ue3/XCDRXwMaBvGtcpD46LZBfa7hsuUvt4siGHNS0ynjt8FaYAI4anWge6WI+FfEYPlqJCspLma50msZQfYP7xsG1cUEQ86g9aWYCl9HIRpmTEYtKlhdvGnMBwVXR0dQ3Cm1BIzEk4nn73ak2LeHPe9nUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H27CMNtzJ4pxfUEruPSz1nYOuXKWfxs4nnwvhmGtObo=;
 b=nn5jHPIXyZjNNzWsuxHhunYZ0IKtNl0Ibbh/aTYyRjFfwl/+4UJWN11pXQ73g2tT4LQodIycLDkigQEhcRGNu6RFHguE8PFbh0C4Me+aZ261o13WSCiO7SqeUl30FKZmlSi9ZADxwPkfzWUPseKKQdeHfbt5A0gwlcKKZxICvD9GLjR5QWcRV3UeA8oMhd6e3Q957EwFUJBHMcB5jyzvGHUlEpNuxwNjKib+3ywr9R0ENEaM+dRz5d36dIwQPWU3Lm7ul+z4r2/oz/G6G7RgkkOz/MZl7WDw7cFdVlIlKWSgFKL6vYC5AB23bYRU14oGNunZG5drMBBJXIBm1mdQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H27CMNtzJ4pxfUEruPSz1nYOuXKWfxs4nnwvhmGtObo=;
 b=AOqgbsT6oslY3wfMeVKw08RTv/e1ZrbseTsfOMoJuFnKY1vsACzEi8culcbizJb7w18o7uCWPW5SGRP7x4bGiJS7AELHaoa8hKOZER5dl/5SvqXMvrYyfeVB9XyuKxZRMqp12Z0jEKau2flkBJE1ZNBmAyBtbhbqnfK+JmQx+1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4875.eurprd04.prod.outlook.com (2603:10a6:10:1b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Sat, 30 Jul
 2022 15:49:02 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 15:49:02 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v10 0/8] i.MX8MP DW100 dewarper driver
Date:   Sat, 30 Jul 2022 17:48:35 +0200
Message-Id: <20220730154843.791378-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0082.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::27) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ba10bee-7d2a-4bc0-a468-08da72430637
X-MS-TrafficTypeDiagnostic: DB7PR04MB4875:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JZ0rD+4gS3YX08hiRoAPEQneyI6x/9x/rYa8/z0X6ebzZe4Aa/Jmeq6JVsgk82QIH7wqBUt712uPAD5MYskDQ77CV97msgja/cjPAxKO7TZV1uadRWGJv2CqN1ZHHOR7SjNvRcLG3BYApTywg9YBiWNy/pbGPLf6GE1mdO+GL3x+F03nGiBnXlSLCpNscAGMyxRGdE2fqDSz3XPSKkOgFQDh42X7Sk1xCU1MUAJaI47Ty9ZIgqLOcSSqe8H1o01xwScaDFs+wdo7/IYIZCC5Y+lgo60CkniGV2XAxzsX+nRs+tA72/C2aJjXE1yuXwsvQVsy7zNuiU/DFVPffbP+KMZ/3fNA2ThOvqOEIWNbHE+SW639rtrnHeaB4lZnglISUgiVZhpol5G7piwmSaFcQKXznI+DLCnC5ryBTcdLl7WqJFhBE3NORQhSIlphC/gli8uwsrPq0lxkEdir3N+Gnq+8q4t2Dm9rkqpss9ZoN1OeVR2u8Gv5Kz2zTFxkz/8q+mXoDORva80JABPQP+kgNAHQZAyjiq/aEAssBG5lAS4VOm9bHeW/2l3B9OCEuRZoliuh0f0yBhdddj3cM7aB+UZFikNvysK8hM9dXzuxfCzuABWz+lGK3857tt/8RMbR6YIEPRZX2GbPCg56BwjEj4cttN0Sf3oF2eotQ0/QvwWdzVX6EgZehhmZK/dSb4Bx8o67nO26kwkz5Cyq1CZqeqqn0dLcKSx15dKa7O8mtOk/PD/w2savmpmzWg93ZqIrVlbeDTfl5dcuEHGV5cVJBhx/6Y56/B6RjSK7ilRiRYOBIAo3pR7t5PqhjzwnE7D8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(41300700001)(6666004)(478600001)(52116002)(66556008)(316002)(66476007)(66946007)(6486002)(6512007)(6506007)(83380400001)(38100700002)(186003)(2616005)(8936002)(1076003)(5660300002)(2906002)(966005)(8676002)(7416002)(44832011)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?te0wO0By0O7EefXdp4XZqqEnjR1GRULfkk35xzZUWAokc764J8MKspRxKUqb?=
 =?us-ascii?Q?aILNkagBqkJ4iWi7vsO7U13wUsLeAZqmMKthrCO34DVbKjk5BWpn4UkDQOKB?=
 =?us-ascii?Q?nYuDAXiO2vwInLVCBts0MC/7oBD8qWRmG0OmHlgxkMFWGboDDq+XX6MtDxwz?=
 =?us-ascii?Q?249tTRZ89cOyZvt2FIoheTTCbky4XdrWq8T8TxX2Fn3g2aw2IT9K17RCO+Dp?=
 =?us-ascii?Q?hu/pKqM1qoAHE/LVa9xV3haCdYgDoiBpf3C86Wy7sIuPMIcqXNLZjob1iC26?=
 =?us-ascii?Q?6mqg4EVGToxkDCeZ9Wm96y960OQJN4N84GOsFRWxeLM3EGtdFAXVbRRRuqor?=
 =?us-ascii?Q?0uNPFwX21QYMentgm8xYeSThWnZhXcDEXv5PnNwsMcWuA1mumsvJXeibWMvm?=
 =?us-ascii?Q?25cmzZpj+ZDYff/KVM87JNC7/v/OdaXXY49DiOE/w9CB43U/Z9GA3pPeJHKr?=
 =?us-ascii?Q?Kzxf8O+DSDLEgAP5NixwtFUxUf2f5bHCwi+LQ77G3f15cs7axHkj8ylxJEmU?=
 =?us-ascii?Q?nAqQ+fcht8qrKk/jzu+xK1637c0pgfxIubNyCWEgs+gJk1kLxkELNyuDnLrt?=
 =?us-ascii?Q?nmyF0y6Etbli96ff+1/WUy/VWDcmi61WLOH7TpBcgN2d+6DD+GisxshvYpMx?=
 =?us-ascii?Q?7DAcqATyYim7fxglJGsWZX1IUf0zifzuVPQjETPQr4w4oUIp7K4tXCsBSKwn?=
 =?us-ascii?Q?H/emIV+CBmmcVwsXa3VipbdEf8kN/ZnBUsRpOpp/7a6LYZWZNTA262EmlLDM?=
 =?us-ascii?Q?Cm/RVA9IBjlQJhDQUVAqEun2TpHbf6BzXNzNrlxfUho+VHWmIvPRltPBtKhf?=
 =?us-ascii?Q?rL+iQ4tIFREuBWapiG2LXUq/XZOI27OZhRSWG4+qQCxTnr+PNHEQEWwwGE+4?=
 =?us-ascii?Q?sNn1yETaOTkdS9wN2AvD3BqSXIRCwvg2scXdkDHYO9X6Btz8gKvnSwNwvcCs?=
 =?us-ascii?Q?5XdT8b9fUmemTrhsrynNytlVYh1mZDWVybZ/tamhpKt6d64NZrHqC/u224R+?=
 =?us-ascii?Q?fgLuO2IF0ujhSoEzlEgO2lRS7k4B50RlNEu1bZ0eDrd9JtoI8aYUvnnYEDxc?=
 =?us-ascii?Q?jRNs7QfGZ/cCkRGJqqXBbMh3RZ0hp4cidkWK/6KYNj11LLNvyPK4KZNyQDor?=
 =?us-ascii?Q?VPAsxsIBZCtei9B7t13f51byrQ2YAuSDZ9NqcLlc4UqLr3z7rIF1U0fO4TiS?=
 =?us-ascii?Q?WV37utjSD/bLRvUknUv9VhWc4MO0sqnPVAE20850K4Cg20KORWBhpn9lI6hv?=
 =?us-ascii?Q?sqsZQ3FKVn+fzdh2OHRAhlRYTDzGIbZDo+Oj8S8gF4/EMu2SrOa4sxrtf8Cm?=
 =?us-ascii?Q?onR20rtSfiF8eCEZHv+mw/BGnulNDRnj6Pl5heuvjKxRwyVpbNEDCwX/FYVe?=
 =?us-ascii?Q?P7Sxir8r9OlY4Lq4iCd2hWfUuS38LOQPdKXkwTnIc5I2tYYlq67zKmvAylI7?=
 =?us-ascii?Q?KPu7Mf09vQ/jFrpk/d/rHQbnOuKL1PcjHjzdbPIPrfWt7pF0KqUCTUaiRbcH?=
 =?us-ascii?Q?It7OMQK9ujsUnESoCXSqxCCHQs0XMRbyJ3m7OYXOAI53dghhjqQXhfcs7t2W?=
 =?us-ascii?Q?D3IMaqIuanxrIDMSildbCt3tEpkTYkGvLcTU2zyJzPEOS0Tzyn7AzNlivX8/?=
 =?us-ascii?Q?U9CrcByklBJM8gXhY9nk+DUw4B/tvP6BxgFK/HinvpFkzGw7cjEUp3sZcNHA?=
 =?us-ascii?Q?oTTDew=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba10bee-7d2a-4bc0-a468-08da72430637
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 15:49:02.1218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiSrn1DZdktkeahgs2vJJu/bMZ3ifbFDUOAlcYtqB5oTN5ZKEWD8tizMjnLQKQyRWRWDAaGmQ4ip7Te+eUC8fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4875
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
v9:
https://patchwork.linuxtv.org/project/linux-media/list/?series=8520

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
v10:
- Get dewarping map dimensions from v4l2-ctrl dims while initializing the
  mapping
- Implement partial dewarping map update on type_ops init(), assuming the
  application/v4l2-ctrl api is responsible for initializing entirely the
  mapping prior to start streaming operation.

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
 drivers/media/platform/nxp/dw100/dw100.c      | 1708 +++++++++++++++++
 drivers/media/platform/nxp/dw100/dw100_regs.h |  117 ++
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |   19 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  151 +-
 include/media/v4l2-ctrls.h                    |   54 +-
 include/uapi/linux/dw100.h                    |   14 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 15 files changed, 2188 insertions(+), 68 deletions(-)
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

