Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9534E990D
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 16:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243687AbiC1OPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 10:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbiC1OPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 10:15:43 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8C1E61;
        Mon, 28 Mar 2022 07:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkPm/IuhaoNkzwh2YNq+WnQUsvgPdmXFFpiUeGFFqXcFnCEdHgw52vuY8dklSmGuMoBTRxEHkeVfQQ4dEadn3smXTOwn0dnEZvWrQceBLC2clG4fmyK5efwROtCjJp4KA+D9cNKTEosX9/Xh9dd4g+E2MreeTIGVFPKBEkzmVrhixW8sZ9rUvBZZjGj7zOlp5h+KXamk2k1oHOu76JX+Vv/LcEkvgWy5OmrqO4rcpv8EFdclxJInCdBXGDLMcBVY77N25Q/SLxECdAvo4+gbk9y+51lMS9EDBrY8MIb5dr76zRa4Q4sNKJhBGZ6oiR2SOLfxjYXYVM2ZFVO4FqRKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhoSegajd+qiAn6iTmPtuVjAUd9nrQa7YMntS251S58=;
 b=MwpggkHvvMdQSNsQDNo42TWNX/D/sshZynop0Co//TqkWaPsWSsJ7BQwSLf/NYQ4dYchKiVneb/CrtpHQiAJu5sSud6r7zy7YkS00I3+odNbpzySiLRUjy4ICHCMbupAZ3lAc9EVsXTwqnfxA9x2eGWaJmRayQkTCCMSL/6Od3S+mCCeqrYNRtHLDfyI7Fz4HJL/AiXwek9mdC4gxcsGYdNjFNWefqvsl95G8IfQiNlk+YfG/dSn37Uw3srghOiBrLbWFBNur/wnMcBCqmqnJlBh7uKKJ0kMXVuvqzajk+3bLzhtFrlyii+cTRgRyMZpvqJjBZRHDXYYAiNMzC4PHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhoSegajd+qiAn6iTmPtuVjAUd9nrQa7YMntS251S58=;
 b=eEoDkV+KZKvM9D9RX9EKNFZFXQilKvgtuN5WadlZo8FDeONa569VkDt56mMlROsrQ5SNJosxHC4TH9ahviUSVJAKE+b8F9yZaYLWUiY3/XYCxQsnEyKegbSqHgKJT5r+h0le7FYzgcCoMmQt0obt+J/2rxg2GrHkpFrFGoNqGoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM0PR04MB4418.eurprd04.prod.outlook.com (2603:10a6:208:6d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 14:13:56 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 14:13:56 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 0/9] i.MX8MP DW100 dewarper driver
Date:   Mon, 28 Mar 2022 16:13:00 +0200
Message-Id: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0032.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08cb22cd-f41c-4b05-bff7-08da10c531d8
X-MS-TrafficTypeDiagnostic: AM0PR04MB4418:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB44188ED698E1A6702EB790F1BA1D9@AM0PR04MB4418.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vR5hrJSyNhcM6J3MFC8euz+XjTJhrSPpi82hKS9QLlaBpPFpalp8+PSDisMY4g2ibDORBWQ8CLaCgTH7AYY1pDF6tTIt9CTC+uUmnb39+0lu6h/MTVgVvYL0z+xHNvaB58wrheOf6fDB6NYzWDROUIpx7e0/nvDV2V7Rf629kwBHe0iOAA7aLAyLU72uBUwsUphz8QEuv/o5kyRLYEXT+XXYdr8gYj7BqrND65gkxLNghZhp/VLwPOPe9IcT7+BpCwkWiZR29bHgCCuxbyt71dd740esV5vJIfrwwomwjntdbIEgpstjH5Qd8HGC23yq27BRWnoYbjpwMqrzg/zTpeyiezf5nD2U0GUnABIbzUuqqxT0Vt+5yaF+vvxJ7GPKLX95Zp3FWQMVRqa6EiC1MTZw48rhfnnldvECrEDkJ/xoDwt9EKtLw5mmfcokkc9wna1Qdl+q+gBvtgWHrxA+4+RihOBhP2Z95i3rASttSdQ3W29qIvo2BPRYU/eL8shutnjRjats5uxIx0Mg7TwEA7dQWlOH5gu/H/9ptqRvtROXIXvNFapL36DgHntaryNaHzapUUCuT2/OmTQNv4kl/qxNZT9llt3fhxOj7g9hG6BxviKUVbrHDQTvpuzAtr4D7UQLLtNB9Lhav4DyN+1txoAVWqS6Av7AMxn9Zu9JM6pXk1CBtV1hvn7kZXbgpJs81NB7gHnm+2o/k/SRsVNb9rOI7C1vyECFnxC9t+SGl+DuxFFyTv9AfGNUiKXa/9YgUysiRI8++7c3uWGSGpo0Vg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(2906002)(86362001)(6512007)(44832011)(52116002)(7416002)(316002)(508600001)(8936002)(4326008)(186003)(966005)(6506007)(38100700002)(66476007)(83380400001)(8676002)(6486002)(1076003)(5660300002)(6666004)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YxYaAKBBs7A3XkPtw1XeLCCDkvYxBvSWk/x2S0n0KVElytynOdpPsh6HMOPg?=
 =?us-ascii?Q?C47h0LyRGHPUESukE0p1OkPUS7D+CWHou4emRkxBh7OsjpH7R3+ykF8oIQBv?=
 =?us-ascii?Q?KFA8NBFwgoBiKntN8tRJa42YGSwbUkL8IdfNCxKxCjw/zezLasJV5hB/nQrE?=
 =?us-ascii?Q?jCQwxaOTdezSWxlh4sVWx82QIO7YRPDldJGOhKVZkcCWUpfhMbI81Zcc+Qar?=
 =?us-ascii?Q?hdVrFuX61WnaliBgNyVPofBYua9Nw44OnIIh2RZRYoZZCFPOasMbA9fCapyB?=
 =?us-ascii?Q?13pZ8MUquoHH99mlJrmwQqfORYre8+KuwNgrstpop1BRKd/mAZ+Ps7nv4hJ3?=
 =?us-ascii?Q?mlptEYowL39fI+I8s4LzYVP2nKkVTUZK2Am4UovuSuy42laQQcpPJwIjyr0Q?=
 =?us-ascii?Q?N6h2pi410yjGvVEcKZgrtbpXE7ruzBKlTIr+bU/w//qCDIOj/Y0MLQk/+gPZ?=
 =?us-ascii?Q?aZimNhvhLyBpFSsO/8/jg7L2V16yPmrYOF8DySXoqHNnk2jraTfEiq14U0EF?=
 =?us-ascii?Q?JQSvvYyDcRLcA6tS0stWbG5BvT0tbRmCAJgZ4QqhDZeTSFv5xVoKkJRBRye2?=
 =?us-ascii?Q?v8I/Cp5AP8ZcN3iU2EsMwlLhR+0Mij0hNzumKPYh2H4PLk0K84bP8/Hcv52P?=
 =?us-ascii?Q?4hUw+FQdQveRRGfbnIpgctLSO0TzJ5g0vFeX9IzSVljrnJyjn9XF+hYZR/iQ?=
 =?us-ascii?Q?nB+zd6aHOgNz+QWnQ2PAa9Uo+n2ka1H2o21wHgoII5Qw2VdgHPaLSCB7zW5S?=
 =?us-ascii?Q?2jq6s/2NYmsh3coPMOp/Dsqp0UZnqC1d624qNrxPhXAIVprvGUIqSRpfFPMo?=
 =?us-ascii?Q?wK5EJLL7A+zyl43Gy0dMU4nFT/ZupB/fwNDRyFHVOGvcThYYHJURX0wcaJv1?=
 =?us-ascii?Q?4l9pHtGK3kVU1Iss5gRwvNWmCavJGf8sdz6aITrF/NbfillyLhfRJ2l6DWeH?=
 =?us-ascii?Q?hnePQvV68HC47jTIjz88xwSgR2bLFS7RoaZ0NJ2NqxuhsAgvxHEMnfkrkZn9?=
 =?us-ascii?Q?rytA3ikIF6r4V5nGi/+sR7EK59D6Jjkz+/Gh+yPH9MbwEUk3u7ZvnMSj4qgA?=
 =?us-ascii?Q?he9J51i3vKoDUDgBYl6ccuB8qoZ1DXP6Ensd+3DmjlPdAK27dNDbj+x6YjUv?=
 =?us-ascii?Q?SUDRzwfV4z90ijQoSdOAlVyqE+5RqYgpfz6QKlCpQRUyt60cnOjFjxv9n/5s?=
 =?us-ascii?Q?sXXFCF77JE/UIWDkxc1qVU7pHwS4jq3V8wd/XcFcSy/idCe42XLmWt3l8VXV?=
 =?us-ascii?Q?A4YVV+x+jDKGf2gp/fjbG6+0uicKrVPD6J+4Wk5HBFfyUQN5zmpDxBZU9iYq?=
 =?us-ascii?Q?J+qz19WmU43ny28VadG31ilAWDe+HaWyChZbROKEyZud2l6Of1HkSTHuo0zu?=
 =?us-ascii?Q?MwC7t1d5rIzqt5sP0Y4Fezj6Sx4EgIMJlLemOc9VCs7fi3wlZChY8y18zRxe?=
 =?us-ascii?Q?evZmbV5PY9Fh2AKMq80gbLWgw8zoNY/Oc2DEyUKYSV9eD9Re0kmIo8Q9coty?=
 =?us-ascii?Q?vPLBnRx0IquaBqMMKeAd1fDEwXojWTLYHoUagEfFSCGHy/KZnObiB1d11Eun?=
 =?us-ascii?Q?7oDJ5q8pYTO4fK7IMoqaT9wRxtk52g8nk8ZkavKmdMBPT3r9QFHLW4N9L0cW?=
 =?us-ascii?Q?wZXw8DcsyhAN8L/WEfdb14vWEjUJhOQvO3o/9FJ/t5CAdFXHKYpHIsD4Ob3f?=
 =?us-ascii?Q?4VXUrWBNEuA32jCGgBeocbYyFs+crZ/51yZe+1ZZiJzEUq8CXYrupAJU3aeZ?=
 =?us-ascii?Q?2l18otKp7NZqX8zDoYcISGJ6qji857tO9rY37/hJiwjZN2C89LCbAWOzb6qC?=
X-MS-Exchange-AntiSpam-MessageData-1: ScTXy4IIXyqe33UQwohSH3cyPdva/AQbRcg=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cb22cd-f41c-4b05-bff7-08da10c531d8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:13:56.0361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0+wquRI5UkcN8GaF/T6UBApAkRpryIWBHh/uybv648F87w9EJNsnXOq+CorLkLDiqx5JvsI5zN7pm5bjYWqYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4418
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset depends on the series "imx8mp: Add media block control"[1] and
"i.MX8MP GPC and blk-ctrl"[2] which provide the power driver infrastructure.

Previous series can now be marked as superseded.
v1:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7443
v2:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7472
v3:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7473

Patches [1-3/9] add support for dynamic array control imported from the
"Move HEVC stateless controls out of staging"[3] currently under review.

Patches [4-7/9] document the driver interfaces, and export its v4l2 custom
control to uapi headers.

Patches [8/9] adds the v4l2 m2m driver.
Patches [9/9] adds the driver to MAINTAINERS.

The patch baseline is linuxtv-tree/master.

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

[1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=626781
[2] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=618869
[3] https://patchwork.linuxtv.org/project/linux-media/list/?series=7418
[4] https://github.com/NXPmicro/vtec-cv/tree/main/bin
[5] https://github.com/NXPmicro/vtec-opencv
[6] https://patchwork.linuxtv.org/project/linux-media/list/?series=7595

---
Changelog:

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
 .../userspace-api/media/drivers/dw100.rst     |   35 +
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../media/v4l/vidioc-queryctrl.rst            |    8 +
 MAINTAINERS                                   |    9 +
 drivers/media/platform/nxp/Kconfig            |    1 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/dw100/Kconfig      |   16 +
 drivers/media/platform/nxp/dw100/Makefile     |    3 +
 drivers/media/platform/nxp/dw100/dw100.c      | 1763 +++++++++++++++++
 drivers/media/platform/nxp/dw100/dw100_regs.h |  118 ++
 .../media/test-drivers/vivid/vivid-ctrls.c    |   15 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  103 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  182 +-
 drivers/media/v4l2-core/v4l2-ctrls-priv.h     |    3 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c  |   13 +-
 include/media/v4l2-ctrls.h                    |   42 +-
 include/uapi/linux/dw100.h                    |   11 +
 include/uapi/linux/v4l2-controls.h            |    6 +-
 include/uapi/linux/videodev2.h                |    1 +
 20 files changed, 2328 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
 create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
 create mode 100644 drivers/media/platform/nxp/dw100/Makefile
 create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
 create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h
 create mode 100644 include/uapi/linux/dw100.h

============
Compliance
============
# v4l2-compliance -d 0
v4l2-compliance 1.23.0, 64 bits, 64-bit time_t

Compliance test for dw100 device /dev/video0:

Driver Info:
    Driver name      : dw100
    Card type        : DW100 dewarper
    Bus info         : platform:dw100
    Driver version   : 5.17.0
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
    Media version    : 5.17.0
    Hardware revision: 0x00000000 (0)
    Driver version   : 5.17.0
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
    Standard Controls: 1 Private Controls: 1
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

Total for dw100 device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 0

==============
Media controller
==============
# media-ctl -d 0 -p
Media controller API version 5.17.0

Media device information
------------------------
driver          dw100
model           dw100
serial
bus info        platform:dw100
hw revision     0x0
driver version  5.17.0

Device topology
- entity 1: dw100-source (1 pad, 1 link, 0 route)
            type Node subtype V4L flags 0
            device node name /dev/video0
    pad0: Source
        -> "dw100-proc":0 [ENABLED,IMMUTABLE]

- entity 3: dw100-proc (2 pads, 2 links, 0 route)
            type Node subtype Unknown flags 0
    pad0: Sink
        <- "dw100-source":0 [ENABLED,IMMUTABLE]
    pad1: Source
        -> "dw100-sink":0 [ENABLED,IMMUTABLE]

- entity 6: dw100-sink (1 pad, 1 link, 0 route)
            type Node subtype V4L flags 0
            device node name /dev/video0
    pad0: Sink
        <- "dw100-proc":1 [ENABLED,IMMUTABLE]

--
2.35.1

