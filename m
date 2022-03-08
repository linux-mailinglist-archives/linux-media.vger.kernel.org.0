Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31A74D224B
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 21:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241467AbiCHUMF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 15:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234450AbiCHUME (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 15:12:04 -0500
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6943BFAE;
        Tue,  8 Mar 2022 12:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBcLW5wGtfN2QuNZ+sYI0prvC2iqGAV2410foIHmzXnEaFYKcqJyVHPhxRTnU1FU8SNquMirU71g8GpsDlZ/VOjm6a5yAVJOJfmmX9p57s6Da6QVPq3lolAvUZvS0Gpb8TPhyRcMdDMTxBgXGF1KuYE9x5fMUF6V6Cj/igToWHOESsWwB0Ru/2Fh75M3fbhVLpN6wnJT0Dk50Hd7Djf3p2yheEYCwrjLX8RSgtSC6t+4WGjjTVe025ISIiMSI/CAXwYvRLOzYOapScZsTpyU7vZqDxkucgAUFGecIpscygYvXfZYmT/1NbZ6nVsjMdQIwZ2dPYmkT0/4NslIDDZoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21MK6HINXghYhwkaIubrpVmTwNmj8fr90b2MDrQvBpM=;
 b=X5SjhNz8KjnhZPIXE4aMf8Ul5kwY2Sj8lzJYzrmETQOsT3OooAUgYH6CWzY5ejUfoBH241hDPnnkZGqmyzIV4pflfJdX6rkTEQ2bD8OJ9jWqIW1VpY30tM0qo9wUinEOr++KgdYwPdkSc3LmXtMg67a10JnVVGL7xFXfndDFvyHhvg2O2VWgAbyolhmXl71tK/11LxtyPyGngQsv/aAqPaq561fgxU+yeMOgsdCyzoWdLa+ZlYpK7/aI9IHABY0VKSGoE8Z+RreqIYBS+OxG+T2qDKFyaRLUcg3K2PGDSoN0JxhH4FCBKwbmT/2VIX8A+/GHZLcpuH5QjqxZv4QgAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21MK6HINXghYhwkaIubrpVmTwNmj8fr90b2MDrQvBpM=;
 b=LVduJpa0njLux9eKUlf/goRsCXy3zeHXK80qbVWedyrqq64gCeF4lVrZjTP+eb+JRlCQ+NN/39PyIxm5Pd6TG8Z+OIGrA1usEtDcLHJpsAWx9X/Jb/O3v/ViLGzJOgqfj+VuIN6CrKNM1z9D+wKaQgSQ0CrRFAHlN2WS7InXt9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4588.eurprd04.prod.outlook.com (2603:10a6:5:35::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 20:11:03 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 20:11:03 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/9] i.MX8MP DW100 dewarper driver
Date:   Tue,  8 Mar 2022 21:10:29 +0100
Message-Id: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09e17370-bb9e-4a5d-c095-08da013fc560
X-MS-TrafficTypeDiagnostic: DB7PR04MB4588:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB45880280AA581B2433AFFCF7BA099@DB7PR04MB4588.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IOFJ9yU2FQfcYS2FLXAV1cTALujTwYdATiuFdSqQ2qwv+sgjqr1XVBuJg+V3bZr02fQ1CS8kE0BOcoo7ZhRV9/F9xLeM7BAG3/GGv4b3ivrUDVfuB1E+JVUYJD/qkqYYfRB9pZFEsP3hrTUfikQFe01ek77HURas6lXWm/bjvGZMVaUIiDOkSWjdDlsRSe4vLzqFvI5QeBQB8EUQdUchqu0hG9f4cYBE6OvA3p8B4yrgSVqxdW7ZZUKyUoVpL7+9G4kJNFgHudBVfbNU3CUncIZmWQXr8d4aq8HSIjCuC/YIbRM8bBKXPWPErf113RuoMv7BfqWPDjlwRDyjDIBD3O+LMRf68GN9EJraFwZi6xBlVt//4WAgL770fBbsK7uzXI9IAi6xGtJPyLJiu3fevRzVvFXGLhWLwsxoL4P3Gaav7npKFjW++BEpXK9RSoSI0A12QE7WD7Yb/Kvbys7g3/K+uoFDz4hY4yJGtq3dHV0+hOjacG7N3IXlFpVI1um/Swu01MXh0zhM0dkI1GOr1efCQOKlhGznIyIg8q8spVej7PKTFowoX0VIcGGis9oZjKTjq4w46eKBw59K3DUDldYmd7tKDc5QJ/k8SsvQFwv3R9R8LVKov7bGvzbVzCUxPCd9eWLmKzCTR1GFYCWl19acHLmxWoPJ5JU6L9prMd9KdWNB0FjjaOR2VZ9qV6fjRl6nDv9MPslr8UfVjxa9DBesVKirat825ZG7/i2zcqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(6666004)(4326008)(2906002)(6512007)(5660300002)(44832011)(8936002)(1076003)(186003)(2616005)(86362001)(83380400001)(38100700002)(966005)(6486002)(8676002)(66946007)(498600001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WpzeIA5T4+TqaeR6J6AB1IbZj8wujl5JOdysUCKL3beIFtcmuvZEtoiCxriX?=
 =?us-ascii?Q?hwgH3dNMJjjHo53Bpi/9/lUb7AQrFbeFoQHGcsYGNf4DsjwMbXYdSiWZoVlZ?=
 =?us-ascii?Q?BsIZXEzxc+LgEx5B289YZd2Xk5vW9eEqYkbtXSl2/zLHVdvRsNZHB4NfUEO6?=
 =?us-ascii?Q?2Oac5x9I9tGM3KIQtDjasjEe8dv8XJ/p0LgRkOaEk/6kvlA/d40P3qso209D?=
 =?us-ascii?Q?JJf9NwK3ym6yu9RQOlpgy6m6WjgwU8ZV3Iv1OHUtXbbk6kLGPTsPEPzU60mF?=
 =?us-ascii?Q?pczQMNZf/WUw3QM65FInXgW9Vh/WYXQ8Ha+5CZ9hVjQfw9pH01sXqtyf6mrT?=
 =?us-ascii?Q?z5wHoEJL8njqSreMcYAsxzY42Klg64AFXal3tV2d298uTVcfZvyLtmmGdUSI?=
 =?us-ascii?Q?W6vAiomaEMIm1aaZnfXfjGD/yfWlFW3eqIWOp24TlHECvFP+e9yqs8H5+XgR?=
 =?us-ascii?Q?pJcFBtYjwJI6+egzeINBrIzH01HpimZIdW+X9kdTHXIUp0qKRWEytNqNyIzg?=
 =?us-ascii?Q?ZIHXxOTWKNk9IYonReyKjMiNkDHj3SDvWjmSfk2EiFWGWT3dRGCuL88cCbsS?=
 =?us-ascii?Q?c9q0XIfcWMb9z5vaC45O1iPLmOhSlY/vKECIdfe0h9OzZ7uwxX8BI/d4XuzS?=
 =?us-ascii?Q?mb3SNe81AVjf2ka4eMLthUZ9bCkjddb7oRXMs/ENmDqB3u1egINXPliM7/5I?=
 =?us-ascii?Q?3184WUPgALYTKiBIcjVn7LhrELz+EptRbIWcQnlTcUdWs1lApwPoKqplWWAU?=
 =?us-ascii?Q?VJzUdt8BY8IgIN91WnJc8vtjHSvZJr/2WVzNwamlUvr2OYmha8ox0TnWpm2C?=
 =?us-ascii?Q?6DlKyMSdzhJ/GvdPxVpJkCUOieFS9QIMmIEqPzVdxgjJTBwfAtz2pMzYclUz?=
 =?us-ascii?Q?NN55uQzyBgDE85HZ1xz/BhzUdW2WIQG4IWlvlTh6kVg+F/+d6YIoMksW7Pum?=
 =?us-ascii?Q?guaEfT+OGBmVN4fkeq1dn08HEULs8eRPBl+Byop8isGH9wdPoBFm1HUxIgAy?=
 =?us-ascii?Q?lyhQAWX20UyqRXoQ4R2C/jRgnUZ5pXxXDdicK14Env2J8Vu3JGfIzhTXuDtc?=
 =?us-ascii?Q?R0JN0xxftA4ZHPwlQ/xQtXg+zm850OPfsSQMdpKj9Y47DYFECvdaJVtmPsuA?=
 =?us-ascii?Q?M418VFNrt8xet1m/Xt3mNTtI0rJkLZ90wZdHWcUab0Lg8WzF2Xky3uVHf5GU?=
 =?us-ascii?Q?KlRgj/7n4WEnXS3K1ai12NC19CMGCsS4d1uaROLYfIScJOabimUO1WVoU34C?=
 =?us-ascii?Q?JFZ/oh2gBm2vHKNkwTsio2kAMbKV8XOdQZh/HEUBJBn42JFm6xYO+C7yIr6j?=
 =?us-ascii?Q?TXOBNKKsDDqO+3hvNN+U3ygmxzxr++lvygCb31XhoRU6BfLV2zZBBU/LuSho?=
 =?us-ascii?Q?V2VNaqLPf7UiDf9lan/ZnDe6JQ15JzZH2MBf11IBNLfxboKxdFPziEO55odJ?=
 =?us-ascii?Q?oBMHML5qjJuV/UHIsR4SRZa+VVP2Hh718qKd18rnofoI3xDy6IeFZ8Hz1y9w?=
 =?us-ascii?Q?4TdLJvE1Cmx2MjZJZV6t/F8Os0h62tXKQOFJL3nTs0Hy8kbpTYzGMLoTPZwi?=
 =?us-ascii?Q?T50dqq2O4iNKqFXW9LKe5LacFpJdiUhvvBq/oIFOCaGMDcBL4WlRjbQjMLrJ?=
 =?us-ascii?Q?rPJ5ZW/bKTBxyBT44tEgUBSfnWZuzx3wuzRcCN1Tb265o7Z+nMYgJXz1dAnJ?=
 =?us-ascii?Q?ya29W5Zj0dgYlYfMTHU5UTTaaQk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e17370-bb9e-4a5d-c095-08da013fc560
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 20:11:03.3928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcHZDY5A2ok9tJWhgwr3vGpAGjwUieC0fLrz7q+mvI/pgPl8PTeUG0voXZFuSFxAMZtNEsNdcGmAmq/3Hpc+Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4588
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

Patches [1-3/9] add support for dynamic array control imported from the
"Move HEVC stateless controls out of staging"[3] currently under review.

Patches [4-7/9] document the driver interfaces, and export its v4l2 custom
control to uapi headers.

Patches [8/9] adds the v4l2 m2m driver.
Patches [9/9] adds the driver to MAINTAINERS.

As raised by Laurent, the driver could be located in drivers/media/platform/imx
as the dw100 IP can be found on i.MX8MP SoC but the driver design and its
hardware integration has not been specialized for i.MX8MP. Hence, the initial
driver design rationale was to consider this driver as SoC agnostic.

The Vivante DW100 Dewarp Engine, found on i.MX8MP SoC, provides high-performance
dewarp processing for the correction of the distortion that is introduced in
images produced by fisheye and wide angle lenses. The engine can be used for
accelerating scaling, cropping and pixel format conversion operations
independently of the dewarping feature.

[1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=618788
[2] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=618869
[3] https://patchwork.linuxtv.org/project/linux-media/list/?series=7418

---
Changelog:

v3:
- Fix incorrect i.MX8MP Reference Manual link in documentation

v2:
- Fix yaml dt-bindings errors
- Drop assigned-clocks properties from dt-bindings example
- Add dw100 driver documentation
- Rework V4L2 LUT assignment with v4l2 dynamic array control
- Rename V4L2_CID_DW100_LUT to V4L2_CID_DW100_MAPPING
- Export V4L2_CID_DW100_MAPPING to kernel headers

---

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
 .../userspace-api/media/drivers/dw100.rst     |   30 +
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../media/v4l/vidioc-queryctrl.rst            |    8 +
 MAINTAINERS                                   |    9 +
 drivers/media/platform/Kconfig                |   12 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/dw100/Makefile         |    2 +
 drivers/media/platform/dw100/dw100.c          | 1744 +++++++++++++++++
 drivers/media/platform/dw100/dw100_regs.h     |  118 ++
 .../media/test-drivers/vivid/vivid-ctrls.c    |   15 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  103 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  182 +-
 drivers/media/v4l2-core/v4l2-ctrls-priv.h     |    3 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c  |   13 +-
 include/media/v4l2-ctrls.h                    |   42 +-
 include/uapi/linux/dw100.h                    |   11 +
 include/uapi/linux/v4l2-controls.h            |    5 +
 include/uapi/linux/videodev2.h                |    1 +
 19 files changed, 2298 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
 create mode 100644 drivers/media/platform/dw100/Makefile
 create mode 100644 drivers/media/platform/dw100/dw100.c
 create mode 100644 drivers/media/platform/dw100/dw100_regs.h
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

