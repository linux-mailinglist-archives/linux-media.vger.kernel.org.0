Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C922F51815C
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 11:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233658AbiECJoW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 05:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbiECJns (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 05:43:48 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0946B37A9A;
        Tue,  3 May 2022 02:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YM15CSww23yycDtO2OmXsMM559Uh5WTJNqL/3KdEKhMCeWT5dqFrGa18LWTmoRZpMZvsyNW1vBi3gbPutDcQ8i9St6Tdi78aRfBZ6jG1dLDnKznqsdGSQBIqfqtKogEeOnHdwskiZY3tB6ZF6NBeIyc4itawhBT1NxhSHLGaFlmmYsf9UyK+eRR0oA1zo23SURcinO5bxdn5L8JXkyCUiL8rlS5ofWbRJxGUB+qMZiVZeQRrh0dfQCJQ6T/7km1y4WjvHe6s8rk9vnkcTcgsy/k5O15hVyDyl6XF5jHVoeXm9UEpbZADVbDqRfsp9A+C1h7HT3W+RGzBFLqBlT6VpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93+whLTjdgPCjJ2StXnxUmseqsJ4557t0vb+ia9QmaU=;
 b=Cf+Pl4RLlSSdX7LXoO/fMiVOKM3B+pJ9w4YeQbqBR9pJ4nuK43m4BsmBgj+DQ65sXdGy9fW7Dnpauy9QwRu4b+z3MyFxn3eMvedvDQrJA8ujlQziJuUMkjCayfEixiFXUz3sLlOxY4DqbpxCiLpJEdI5FyxgMBDlcAQpHiZ6e1z1dBbUQwYiRZRCVXmtVLusbw3fY6aqGhg6diTO5m925x9OCuu5W5/bjLPaEh0q1VRELfBgLPfMvVkatr/VQZWp4qvKqAOLVcHOINTNklDJ6Woh0q6TJzfqO6r7HFxSovVrNYFKYOCX9bgJJ7PtNKb5aKp9fwKsG2nVbHxpVZIJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93+whLTjdgPCjJ2StXnxUmseqsJ4557t0vb+ia9QmaU=;
 b=JBOBe9EZgxLymF5J/NsqplRHpcAG5LLyw4d+XpUYEiMpqNqiEe4oGJZsEneQ7BXLdldMM2LLMxx1HhhRVf0v9N8nKGw0MmD2Y1NCILY1CiDlezUcikX93RWdPeHIsI7x+xcJVU2kizcGT/nlgqdHpIpaNvg0aw8HBr91ZfwE7AA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 by VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 09:39:45 +0000
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c]) by AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c%7]) with mapi id 15.20.5206.014; Tue, 3 May 2022
 09:39:45 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 0/9] i.MX8MP DW100 dewarper driver
Date:   Tue,  3 May 2022 11:39:16 +0200
Message-Id: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::27) To AM9PR04MB8700.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2beaa04d-3707-4d01-43bf-08da2ce8dafd
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2559:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB25596DA00498031292073787BAC09@VI1PR0401MB2559.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dVWPcgmgJBcxwvdroRqL272h9P3QpuN78aCgoFTi9NMbqWU/29h1OMxvAx0tErK1qc39VCSzR/N95hGbk0HlKCbbkGGGIsdNvSeJYlPSIBtbuNBcIr/wPRMPv9EEHm5/FRbdc8WzdoS9Gg7VrFPoyUzgg5kGzzWwspxI4VbL//POPvgCxkztwj4kpIUFYUM4UTByv3z8/MjeNNirR0lR8BIKMiKwn1Pgorrd80qKOULSc7n0k6UEzS/qGrtC7g+1HuYR5U10o4cvcYaDD6NoiK0wKty4L9FkDV3VaRQST8n+VB0go+FLrj0GjukR9Bc7CyOfLBP4Smbor7rSktqrilWg6sMPXINIrqIjpPZRLf/cImbyxYLLHfVUCbXsRXPLK0SuL0RbCvPEopLPiu4AFzoniN9Wm7fd4w3VkHRO4YphFtdi3a5H7nAc5x85/pFuW1Ye2dN9a7lH3WWYYA+XHw3qwr13LzNO3OxBn3QR3Dp/v5GUbr3BX4Po33Pfp360i+sYvqPMFbDTiT/Ibh7GNdqIq7fGYiNB1CMe9WZbwr9iEmNG6wiNtaPg2Fo5dMFN45TWP3LaudGlY5w/RzHASSTTHYi2rFaX1zKVYmhxKbknMjXw9x4Dff6Fm/oChXjjpru2Qhar4SFI391PUn4MCraaatxc4jRvLWprWSACpFjkxEgHeXLLLms92fhYMsBJxFcHjzcCvPm1SDGjhnZpft1eT0buJ0lvcEXfC1BgeLYl/D598nPoYLshgPrYiHqwXjnvit4DDLOvY+b+mFdkdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8700.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(8936002)(83380400001)(508600001)(2906002)(316002)(66946007)(6486002)(2616005)(1076003)(5660300002)(966005)(7416002)(186003)(86362001)(44832011)(8676002)(4326008)(66556008)(66476007)(6506007)(6512007)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D/CAuzuyIu/c6JNhXfjxdVyxNptc2FZwk8R2/L9Sgqikk8OLnC07w5zeIA31?=
 =?us-ascii?Q?hW+XrsoucfkyZ0phpO94EMW9Nw1pdjTnkq3lENiumlE+aeXlD3qyXx1BBlha?=
 =?us-ascii?Q?fbOkmNF5psYx5BCy8PCkO2bOkQCFwiPLphkdPFYg+ef2fCFz8MKCl7vpK471?=
 =?us-ascii?Q?g+6jwJPg7G8mGmzu7xCbhRFy7DuPrq9/5LkX+gjbBz+abwzj5fFGlbNIh/jd?=
 =?us-ascii?Q?QdO4HcXoLtR0WpFQe3LIz9Xof+uccr8leQ28c1yn65Ud76IEnlVzS/NNpTxJ?=
 =?us-ascii?Q?E0gjtVkOAOadIeRv/QBeMb/8tytNTQfZGJCxQ8OPDv5JLr9BrPX6VMJmiDNx?=
 =?us-ascii?Q?NDRBoST/r1aFqmv/RbATFJzffkxbWkjMtYlby07yS4dpfX57UqZPiFFKNokm?=
 =?us-ascii?Q?DCOQ4n3UoGF9CNgEubyNBA4eaBteFKBpTNJiGUI29tpOcIvM8+CsB/xfBTaI?=
 =?us-ascii?Q?NkYgxRyEh7E18j36YlGYH1AqryaEXLG5fkxOxMa3HbT+kP7n0i0f+Lkw9NZC?=
 =?us-ascii?Q?DKm86EwMxgGNuZfrx8M4F7nzGSWfHDGC7lK2nxmryfTDfm1mPMjPH59hadGR?=
 =?us-ascii?Q?ToBDESjg0geHQ+UiabEErvqM2qz15SbVlmdtwSqzvSmUbqaIB9lfcUzAL1Di?=
 =?us-ascii?Q?AMfedvIItTYuYKqbsK8VBTKY+p8CQRRDB7Lg1eoQsNB4G/ClvW+zOgqYyYVW?=
 =?us-ascii?Q?KJP3zTm9hS9NJssnepKQuuIsXltGC3pdoDU22L3OjM7z5AwDaG/EVkS/npew?=
 =?us-ascii?Q?+YJEkbUwXTB+oNIiAK8lN38XPN5Ud0vRw54PIwhGbwo0clQSeqUtngPR7qd/?=
 =?us-ascii?Q?3lI1hzYduiOM8WnW1CGgxqopnAPiczNdyPllu/5t3oYtLRAN/B8hftSxFw53?=
 =?us-ascii?Q?f46IAfGqorc9GJdTnDkUgAOfu1swrtWKTzlugT+F9xsCkIU8LqXJz9Q5elKd?=
 =?us-ascii?Q?/u4Q5kJeC1eoVkT29Yc6+7rydQspY3+WrFku7DCc7QZld3J3eI+r2yYBI+D1?=
 =?us-ascii?Q?i7vNEGpXB33++hsNOROFhW9cEJ0aG6NibKWsJMRCtx+h/TnvtA1DXeKEb4k7?=
 =?us-ascii?Q?agxK1pFnM8ixP361tEM5lQusEJUFODB1ihWGkkDSahxRI8olMRJH1L7Fcd1p?=
 =?us-ascii?Q?YSndcp3JUTOtItEkTvPxSZj14jojayCE/Dj5HfC8ryVbmuZbsK9KtgM980iZ?=
 =?us-ascii?Q?QvuCSALHlbNP0yBZ8vE3iKsMObhk5eh9TA/F8/A5IdYVOEEtqG51vVsme0oj?=
 =?us-ascii?Q?oozMGupc5PnGBoXsB2vH7u8pPnxKaTv7WpGdxW4gUgqoxWiXtgqYDxIhJpOb?=
 =?us-ascii?Q?pMLmY+JLwNEwi/qdnY9DYdVx04q4Z4aprriZPuNj/JMBDCRE1unzNtHucdIF?=
 =?us-ascii?Q?5YAN37+g4xho0/yFF6sMqJfiaDX7eX/BCfJ06iYkm0SOceXfnLxptgOsOTn8?=
 =?us-ascii?Q?45T3S9fpEKAAryOn/fx5YFIe8BkCRegw4QkMXrOJhYbq8hPs4gKGTGLXBMd+?=
 =?us-ascii?Q?rDIzAcbniyoLd/8+f06v4HBSYWVXvo2aN6GkWcz6ObbiSAqUeUcZmSaBR2jC?=
 =?us-ascii?Q?f3s+lewBE/I1/CTdftWw9Pqt7FemN5rFgmhhfIkbvbzzOYPw0FPBmt427QNg?=
 =?us-ascii?Q?HWsZAwS0H7g5A9Q0A4yeWHU3bX9QRwAT/wXieN4YbvQf0QDyKPINBzKDQ7CW?=
 =?us-ascii?Q?wuItYJbeGE2fmrSIFofNT40qCXB4HlF98tbT2YG5gwhddEHnX81vfGeOa1Tq?=
 =?us-ascii?Q?pjuC50NDLMe30dFGy0FoSGOHNGuoAKjzaxKEUPSGDnATTUXajDW1PqDQrVYj?=
X-MS-Exchange-AntiSpam-MessageData-1: 9DSzq0YjFyQ2JxG95r7yGz2NYgvvak6LHpI=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2beaa04d-3707-4d01-43bf-08da2ce8dafd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8700.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:39:45.0348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuJKCnxSVPGqaGFJBqnZVdmGLYLY9FvQo6CBgoDfi9EaYfPTDBtckLWdH6TrOqxvcSIfV91j2kzwUPmaDPeeIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2559
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset depends on the series "consolidated i.MX8MP HSIO/MEDIA/HDMI
blk-ctrl series"[1] and "i.MX8MP GPC and blk-ctrl"[2] which provide the power
driver infrastructure and associated dt-bindings.

Previous series can now be marked as superseded.
v1:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7443
v2:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7472
v3:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7473
v4:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7633

Patches [1-3/9] add support for dynamic array control imported from the
"Move HEVC stateless controls out of staging"[3] currently under review.

Patches [4-7/9] document the driver interfaces, and export its v4l2 custom
control to uapi headers.

Patches [8/9] adds the v4l2 m2m driver.
Patches [9/9] adds the driver to MAINTAINERS.

The patchset baseline is v5.18-rc4.

The Vivante DW100 Dewarp Engine, found on i.MX8MP SoC, provides high-performance
dewarp processing for the correction of the distortion that is introduced in
images produced by fisheye and wide angle lenses. The engine can be used for
accelerating scaling, cropping and pixel format conversion operations
independently of the dewarping feature.

A script example [4] has been published to generate the dewarping blob from
outgoing openCV 3d calibration process parameters. This scrict can generate
identity map with h/v flip, dewarping and stereo rectification mappings.

The driver has been tested with:
- v4l2-ctl (from master with [6]) for testing pixel format conversion, scaling
  and crop features using builtin driver identity map.
- OpenCV stereo application using dedicated dw100 openCV module [5] to implement
  stereo rectification stage.
- GStreamer v4l2convert (patched to support dewarping blob map injection)
- v4l2-compliance (test report added after changelog)

[1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=629586
[2] https://lore.kernel.org/all/20220330104620.3600159-1-l.stach@pengutronix.de/
[3] https://patchwork.linuxtv.org/project/linux-media/list/?series=7418
[4] https://github.com/NXPmicro/vtec-cv/tree/main/bin
[5] https://github.com/NXPmicro/vtec-opencv
[6] https://patchwork.linuxtv.org/project/linux-media/list/?series=7595

---
Changelog:
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

Hans Verkuil (3):
  videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
  v4l2-ctrls: add support for dynamically allocated arrays.
  vivid: add dynamic array test control

Xavier Roumegue (6):
  media: Documentation: dw100: Add user documentation for the DW100
    driver
  media: v4l: uapi: Add user control base for DW100 controls
  media: uapi: Add a control for DW100 driver
  media: dt-bindings: media: Add i.MX8MP DW100 binding
  media: dw100: Add i.MX8MP dw100 dewarper driver
  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver

 .../devicetree/bindings/media/nxp,dw100.yaml  |   69 +
 .../userspace-api/media/drivers/dw100.rst     |  103 +
 .../userspace-api/media/drivers/index.rst     |    3 +-
 .../media/v4l/vidioc-queryctrl.rst            |    8 +
 MAINTAINERS                                   |    9 +
 drivers/media/platform/nxp/Kconfig            |    1 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/dw100/Kconfig      |   16 +
 drivers/media/platform/nxp/dw100/Makefile     |    3 +
 drivers/media/platform/nxp/dw100/dw100.c      | 1782 +++++++++++++++++
 drivers/media/platform/nxp/dw100/dw100_regs.h |  118 ++
 .../media/test-drivers/vivid/vivid-ctrls.c    |   15 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  103 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  182 +-
 drivers/media/v4l2-core/v4l2-ctrls-priv.h     |    3 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c  |   13 +-
 include/media/v4l2-ctrls.h                    |   42 +-
 include/uapi/linux/dw100.h                    |   14 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 include/uapi/linux/videodev2.h                |    1 +
 20 files changed, 2420 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
 create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
 create mode 100644 drivers/media/platform/nxp/dw100/Makefile
 create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
 create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h
 create mode 100644 include/uapi/linux/dw100.h

==========
Compliance
==========
# v4l2-compliance -d 1
v4l2-compliance 1.23.0-4923, 64 bits, 64-bit time_t
v4l2-compliance SHA: 163144712a46 2022-04-25 05:31:44

Compliance test for dw100 device /dev/video1:

Driver Info:
	Driver name      : dw100
	Card type        : DW100 dewarper
	Bus info         : platform:dw100
	Driver version   : 5.18.0
	Capabilities     : 0x84208000
		Video Memory-to-Memory
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04208000
		Video Memory-to-Memory
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : dw100
	Model            : dw100
	Serial           :
	Bus info         : platform:dw100
	Media version    : 5.18.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.18.0
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
	test Composing: OK
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for dw100 device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0

================
Media controller
================
# media-ctl -p
Media controller API version 5.18.0

Media device information
------------------------
driver          dw100
model           dw100
serial
bus info        platform:dw100
hw revision     0x0
driver version  5.18.0

Device topology
- entity 1: dw100-source (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video1
	pad0: Source
		-> "dw100-proc":0 [ENABLED,IMMUTABLE]

- entity 3: dw100-proc (2 pads, 2 links)
            type Node subtype Unknown flags 0
	pad0: Sink
		<- "dw100-source":0 [ENABLED,IMMUTABLE]
	pad1: Source
		-> "dw100-sink":0 [ENABLED,IMMUTABLE]

- entity 6: dw100-sink (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video1
	pad0: Sink
		<- "dw100-proc":1 [ENABLED,IMMUTABLE]

--
2.35.1

