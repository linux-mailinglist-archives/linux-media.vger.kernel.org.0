Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8499557DD0
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbiFWOcg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiFWOcf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:35 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71173457A8;
        Thu, 23 Jun 2022 07:32:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqqvAeUJ63RkkF3P5fhTaQnCMbswpmdegdKVL67cnqENyz4iQ3oZSoJE6Ov0P8aoiYK3IuBZKu10gQcEVp/v5DRSffpaQDpgRWdEMKYMR9bur8vvOrPrctx25WE9IE/3vcqZVcF/+25gEaYLuQVYd2WG1SJyR+PENbnXfnLLTQQIi3HV19Q/G1TAJsxGBSJX0JfkeOKYfFqZTzgbIUgmz90lbyioLtdFBeQoLSGv/D/iumqWmxJoT+7F3BmXKqndubXLqmosutRxe1TSNZA/zalglw88gEL28lK34rLy3uKwCfEeQOZL3A0tH9C3drOoaYJKmEkQb8DPAitkheS5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWxoVwHJl9VzmJf+vsPzpm4/4vwlqO2OPpYJDl8MfDA=;
 b=JbNqF1ft4rnOngCtdW7Gzcgxj+HCBlDAAqR7Blc9VrCsKT4aAzzKH4+Ma8N3K5FSanLNGuH+Muzlesa1HEWmJe0sjK9MUNlgOJQfp+50vW9Eohhj3+OONDpyFBCbQdSHoIFlho5qpdd4sJKEJWx2bvZUp3SDbM5teYpkKWlwoZBeAc3WreHUXdq8ufVsozk0WHvHHNN7EGIm/18lGc3IIn8O8pnt+ixGiUP1jYago575IUVnsVYSPvd3A0ctwPqp/BuOa5hNv+rwwpWeHcxvFMM4bEH2CuQgyuPVo5qqkzMYIZfMTW//yED84Tmcu5le0EWsPrqeaMNPKC4JSz1GRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWxoVwHJl9VzmJf+vsPzpm4/4vwlqO2OPpYJDl8MfDA=;
 b=NeBYBTcalWPFkzzduozW86mRD5rDhQhhkCud0CJDWO5L1+Rm9YErIlqtmTU7zDf/AD21DMRSvyMbcH5mh5DG5JjMa9ihoHsAzimSeUPvLzbYSQqJ+cftmoiuLHJWnAVPovuJb8TBqjr699cNCSLfocLe/3CsStuY9mTJV2wx8Ik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB8PR04MB6505.eurprd04.prod.outlook.com (2603:10a6:10:10d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 14:32:30 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:30 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 00/14] i.MX8MP DW100 dewarper driver
Date:   Thu, 23 Jun 2022 16:31:01 +0200
Message-Id: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::14) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2a21c69-855a-4286-ba8d-08da552533e1
X-MS-TrafficTypeDiagnostic: DB8PR04MB6505:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB65054FB3FD91F33B9682EBA5BAB59@DB8PR04MB6505.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9RzVUYiHigF/AbnajUmww2hJQEmuKtkfxSYE9TP5pODrVp0jiGtFI/OunbMsE4ilhla50zB+lzvL1eTG9/zy4rCWViXmD8KCWvz7O1mzl8kWFHMLCDl/voaP61PlgUrAfUhJ9W1x1GTrRKSSI7o2g64zDDSh0jSpDIZD+I/2XBJWZoijtaAKd5qQ2pMdOEPBi5OmUr7Q16Di4mTtEdiRJZYDm0JeYEXaWXwE8vmS48x/fYpnyfrrn+QJKZVUKY6Km6omFe+vFw47G6rHnDDm/njX0kQxfQVBrUmWZej0kH2cNPL7a+NNBiIyoOEUCsqqpKe1gM8LWIIM+UTMbk0LDx+EGgp7uaByUCXJFSi0XzscwppvSnaF2yQQ9tjJnXVJ7NrWgMwqEBS3ckACn5lQF7Sgc651esrghDeZeGpAoYehbBSO1jy1SD/2PzFgqliOnnlXwu3xheauM/5YLS3JgXgdjOKIj9IJ7s+Ti2Izm9qdczjDRS+yrlD6wKSPDSOFODn7gQs5jdm97iOE/8fMl0dwkcsb03zUf6BtAXQcVldK2MLdXk0EoG4E+dCQGt0q2igQmd+GoJS5qWi873dIlwPDXclusyUQ3AwC6UCFp0Vjb5CFbeW/mslREyu9ZxWT9qcON/m+6ytAoBkwaGL3ZjFJIX5R3qqdkp69oLx/Ay3DJgvNcZ/GFDOXWLV8zdwhe7yAAGvLy0nI1FKxinifVjGz/a811QSv6Bp54H2HKwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(2906002)(38100700002)(6666004)(66946007)(86362001)(1076003)(66556008)(44832011)(8676002)(66476007)(6486002)(316002)(4326008)(478600001)(6512007)(5660300002)(7416002)(966005)(186003)(83380400001)(2616005)(52116002)(6506007)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TCL5mJ7etl7W4UE6dQB8QZZ91yWGeG9d+vvhSoS4Q/+trLbGwiYc9Ba18NHR?=
 =?us-ascii?Q?MK73MGbrv03MZ4NqhgzYxL+kyp01FOjrSY3ufPBYfhROhSLW8U4di65MyDSf?=
 =?us-ascii?Q?mXEVdsMt9Wrom/uzXQNd4UYijcsdkjXpLO4nMpjOD4kp22/Q7jTt4Lbcrq3G?=
 =?us-ascii?Q?AQscI8YxEUZ93kbik9jO4O29xWuXEZ/amlG9vOW+3L98ZUSqXy4n5Wj94V4+?=
 =?us-ascii?Q?FtxVcj7EKjBH3mS1Nd1QVT5xmKbNyuUGTnb7P4FMTOv59lnoI2wk6lAl76+s?=
 =?us-ascii?Q?+Q43zA7ygy036GnUeGG8Cet03xLIih7H8JROBnr3o+cOy11desetTYJ6jXeb?=
 =?us-ascii?Q?ADtQHuuo89ErnfrcdA62uAyJvRDOt/FoR2oGfK3vLSp7S5HbcIldcvDcxyh5?=
 =?us-ascii?Q?JTI3d5DpxBJE7ukuqogXHYUtYbD4aaYeJF8HtGrFImaclcxclJIMArRk9LQU?=
 =?us-ascii?Q?enu+exNqQalEvJ9E/k75bh256+x/mh5+4YtGGlFBTxfLEbdTSRUVI0pjCjp2?=
 =?us-ascii?Q?evaH2Cpc/rerHRFnL037MEtGde4ewKJeKspt9PN/L8fq2YJjF4UIwqowqChj?=
 =?us-ascii?Q?uW7kiP1mdotEBPra/FimagHQ7yNNSJOx2nIKPEgb4eYDu3bICwfe4QgMoq1b?=
 =?us-ascii?Q?zZKgUTICotswDYJSWQpl8c+r8BHBeS/OSMHQr8LHdjRkc3UKkQwsmafbIwPq?=
 =?us-ascii?Q?RktWb7BEeTo8Dyj1BAaYS/Vs6oWDb+5J5bqiZMipLmN0wTPlQ2KlvdSiOINI?=
 =?us-ascii?Q?43z0jCcXB+ORUaJ7n2ZMhSVvMgtnSfAbAiJaIgzWhUMQgKpi679XZo9g6AUy?=
 =?us-ascii?Q?V9N0vf9udmzCa1RVQqErqYnGsJLdyQROVjS0QThrRBuHgKOe1bchrvNBPPfX?=
 =?us-ascii?Q?Hvq25kpUi1GH1JAl+XNVYIhDa81G9saCLEsMEMaPnINtcNZf3qgyNwwkM+dV?=
 =?us-ascii?Q?ZHOr/vy+cU3bc7J9s7LBcEwbNosrsO/fxrQvmd9rEnkaofehuTtIZKq1HkK+?=
 =?us-ascii?Q?8Oj/9JolYtfjMxK6cWB3xmRlmAh8CDVwJhljczp//hACM+Ti10yPXOs/HFzi?=
 =?us-ascii?Q?yf6uzW+AC0C2o4F8vZ+g2ea2aPYnp2XxxDi3rd1+C5dcDdpi2A1eH7QqsNC5?=
 =?us-ascii?Q?QDomE+wxEJZqQQwRQ3LP6AToj45rsNRGEMJc8UokD6GqC/RB0i7EfIbEwJaG?=
 =?us-ascii?Q?Vz5yWAp6JHTs5FFttyAtIm9pSH0XGmBOdeKPb7jFmxIIwlDCwhHyZ9K5+5lt?=
 =?us-ascii?Q?NAERX+4N0q2zjmB0PHOy8q9zHDzQXVkMn8iqcyLbHIG7UJ7Ay+0ev7zuCQHh?=
 =?us-ascii?Q?42CD2Ty89U/GWSzLDbKWQrkFKBXi8E7Gt/2DA+CKABbcusyJ1cZaI05GbG2u?=
 =?us-ascii?Q?HV/ghq68DY3jia/KPtvo+UhQE3sXYunYxnXtVp37md6FVueU/lD/0YQba+w3?=
 =?us-ascii?Q?jwsOkE7pfZ4XmmFdf+NG13C7FZL3FbVBt3Dmk4xH5ueAGT67NQy/cTN9//2S?=
 =?us-ascii?Q?JwlMZy+8rX9M1kyYz+RIevj5uXl2bJesW5jdWPWXRM2HfwJbUybz4O56qCiT?=
 =?us-ascii?Q?csn/7b49d/X0Y4tvDpn9YCIKf6yRRZA02E42gVs4ksuI2r6cMjmHPBQamzey?=
 =?us-ascii?Q?Ds34eYqiG74d6TRpmrU3FG+MsF3oAggiqMsIo2m6MpO6Qdpm0cT8u3R+Vf6S?=
 =?us-ascii?Q?hq2jN2tpYk3DXatiGgHur4Os3jMC52rWoZ4SnRur9R5AwCXYnQaYWXwnY+7O?=
 =?us-ascii?Q?96JqB8ZykQPNibtft3rYtWzVdB6ebKDiOwe/ug5a6SyS+IxKU97rFXVhXEzt?=
X-MS-Exchange-AntiSpam-MessageData-1: bigeUPyAJjou6g5kHEsG/c4Rs1R0Pxt7cM0=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a21c69-855a-4286-ba8d-08da552533e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:30.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /s1HCp9ijjeaNz8tpLoGhINYUP9MjUd9Jju+t5z+iq5wlC6dPM7IiX8U812vOrZyEyFQG/GiqPR0jo4NZYFNLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6505
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset depends on WIP v4l2 control v4l2_ctrl_modify_dimensions() [1].

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

Patches [1-3/14] add support for dynamic array control imported from the
"Move HEVC stateless controls out of staging"[2].

Patches [4-8/14] add support for v4l2_ctrl_modify_dimensions().

Patches [9-12/14] document the driver interfaces, and export its v4l2 custom
control to uapi headers.

Patches [13/14] adds the v4l2 m2m driver.
Patches [14/14] adds the driver to MAINTAINERS.

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
- v4l2-ctl (from master with [4]) for testing pixel format conversion, scaling
  and crop features using builtin driver identity map.
- OpenCV stereo application using dedicated dw100 openCV module [5] to implement
  stereo rectification stage.
- GStreamer v4l2convert (patched to support dewarping blob map injection)
- v4l2-compliance (test report added after changelog)


[1] https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=array_mod
[2] https://patchwork.linuxtv.org/project/linux-media/list/?series=8208
[3] https://github.com/NXPmicro/vtec-cv/tree/main/bin
[4] https://patchwork.linuxtv.org/project/linux-media/list/?series=7595
[5] https://github.com/NXPmicro/vtec-opencv

---
Changelog:
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

Hans Verkuil (8):
  videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
  v4l2-ctrls: add support for dynamically allocated arrays.
  vivid: add dynamic array test control
  v4l2-ctrls: allocate space for arrays
  v4l2-ctrls: alloc arrays in ctrl_ref
  v4l2-ctrls: add v4l2_ctrl_modify_dimensions
  v4l2-ctrls: add event
  vivid: add pixel_array test control

Xavier Roumegue (6):
  media: Documentation: dw100: Add user documentation for the DW100
    driver
  media: v4l: uapi: Add user control base for DW100 controls
  media: uapi: Add a control for DW100 driver
  media: dt-bindings: media: Add i.MX8MP DW100 binding
  media: dw100: Add i.MX8MP dw100 dewarper driver
  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver

 .../devicetree/bindings/media/nxp,dw100.yaml  |   69 +
 .../userspace-api/media/drivers/dw100.rst     |   82 +
 .../userspace-api/media/drivers/index.rst     |    3 +-
 .../media/v4l/vidioc-dqevent.rst              |    5 +
 .../media/v4l/vidioc-queryctrl.rst            |    8 +
 .../media/videodev2.h.rst.exceptions          |    1 +
 MAINTAINERS                                   |    9 +
 drivers/media/platform/nxp/Kconfig            |    1 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/dw100/Kconfig      |   17 +
 drivers/media/platform/nxp/dw100/Makefile     |    3 +
 drivers/media/platform/nxp/dw100/dw100.c      | 1687 +++++++++++++++++
 drivers/media/platform/nxp/dw100/dw100_regs.h |  117 ++
 drivers/media/test-drivers/vivid/vivid-core.h |    1 +
 .../media/test-drivers/vivid/vivid-ctrls.c    |   29 +
 .../media/test-drivers/vivid/vivid-vid-cap.c  |    4 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  137 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  188 +-
 drivers/media/v4l2-core/v4l2-ctrls-priv.h     |    3 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c  |   13 +-
 include/media/v4l2-ctrls.h                    |   82 +-
 include/uapi/linux/dw100.h                    |   14 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 include/uapi/linux/videodev2.h                |    2 +
 24 files changed, 2410 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
 create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
 create mode 100644 drivers/media/platform/nxp/dw100/Makefile
 create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
 create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h
 create mode 100644 include/uapi/linux/dw100.h

v4l2-compliance 1.23.0-4927, 64 bits, 64-bit time_t
v4l2-compliance SHA: ef8c5223b4a5 2022-06-18 11:51:13

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
2.36.1

