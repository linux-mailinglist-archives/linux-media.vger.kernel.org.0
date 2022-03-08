Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5380E4D206D
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 19:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349271AbiCHSuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 13:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349603AbiCHSuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 13:50:03 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50046.outbound.protection.outlook.com [40.107.5.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6A24F464;
        Tue,  8 Mar 2022 10:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eABdwis7USeZZ76toAXtaYbuCPFfeLL2DSqXrWT72iBBowxwonBhZh5DeJI3y91CG8F2DSip63U6hTN1lpu5kF+9t0dzktW2qpZWQb22nbeFaitPtKmLyai/J75u9GnlNAvRXWiWiaGeS5mIjiI9P+OfuqNrp99yai1WnT23h8UMFE6cCp2MpMrpg8TzBbs1zk0qGtM6/E8fxfTgUJEkXS4lMzdULCR2+aiWt3NxIfd8TxeC0yXYt432kS7N4u3mAgaYHkHwW7Z+UtiNS5ovxUdYR3fiGgdScwPJuZfG8m9YivRynqBAavxXGsgEwk+WXzkkULAOUSZQHbE1rcchUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BszYa11gBu0V7KrQahJibST1ljtoroz/hs555UXOHlQ=;
 b=YZib6tfOnGpUFPpWFSdiiNVBuvRTWR72bMtMZTpvETcQForoJ1r1zyLVObtjeHpt8bnb3y/fqVJEsrU+1IDbzIvsn2sQnFur+QwzUCJlYwJChNicehUjPVXuTw6PuZDXmSxoS545XWgadDDMDeuNdZecG8JAUd9dbJfoMR4u8vWw9vMsDwBzxPC0yVb62iaD78OcAHSgcE5KRDlx7NzouDe6CNFl697+ucU9MARAX6m6Qszujarduxc4q9YTtuMbBIqf2vJNDkxoK9FiHtyIjRfocHSHtCM9wJeQNILRGwEy9z+yvNFIUwhOqIHQbntvltP6CwQlDcfvw+fbmlaIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BszYa11gBu0V7KrQahJibST1ljtoroz/hs555UXOHlQ=;
 b=GzXDJ4o1v465xWxD1gUgzgWBdNnF1Q41JlY1vyVIpxprgA4lSdvs5MTzZJWLSMl9jGj6a/iu/ZtyJXcgDwrYkaMZ8JLpcpnwNjb7wsp/g91Fanb10hiX3Oixw4+Hoe6gwNfTb7aJe4p322PQRFZi5t+dnOxEodM9R6noH6LXxY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM6PR04MB4311.eurprd04.prod.outlook.com (2603:10a6:209:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 18:49:02 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 18:49:02 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/9] i.MX8MP DW100 dewarper driver
Date:   Tue,  8 Mar 2022 19:48:20 +0100
Message-Id: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::23) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98c7402f-3810-4496-8379-08da01344ffc
X-MS-TrafficTypeDiagnostic: AM6PR04MB4311:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4311990A6BF591B42BFDB1F9BA099@AM6PR04MB4311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /kTe5VsqyApgxt5yHdK/MiWolC9Bno1RBgd5hzidvneia+FI5uozhMFSSfO32KcTOa4vbSkwPeqsgkL/hULTTMmuEv9/EDz8mENjLK0y1KZOANcA39QuXaRxVyuutObtXHJjZ1ZncDvSoIBtRWNT/Ww+q7LYLKIefJwV4WfA5bNtCQVJE9Xp0AKQVRjVOVpNQAvFFYge9qbq+mZwz/dQ0Yav9pZruC4qMWDf64T/US9oTusw7SzLtN9hOqX07WWjLje7BOmCUk8Wg0IAWHr+kAHoXmCP3mTlCq9wNliLMPdJtyFutf2AEkqiMm9kkANRvLL+gYJrE4yQE1h6VPKvKgqctZRjrp9bFj68JT+9Y4hdF/vqi9kuTktHR96S8//h+NGrcrMxcr3lhqacepbfZ3XaCFONpehVT6ipxChJ4duoXKwjE8kIX5gmGy+Vu5b1vjYYIzkYSzA/4/JMuofs+s3mrWqke5GUDxgvNNORDVQ4b1kX+3Cks7QJsc9YAqYkDrI70liCXFRWgq/sINR5jtGfcrFMPIrSUmg4jmW6WQGPo+W1tC16Rjph+UH3D0r0kSZ0gmPA0UU0XU17hmvaKeqT3pB8P9ZcYaKGF7PvMINSQWHlUPFD0RFB+xWjQ6eOL7Ft5zxSxK/qVDYoaZlsg2iQ2NBgMBmbdc5IGyuuXD0zvC5ADZja0qIXVUYDu1VHkAhhRbhqH+GVgXGnT/5ZVYFYutTrHYHTkJhNb+XyQUE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(4326008)(186003)(1076003)(83380400001)(6486002)(86362001)(5660300002)(8676002)(66556008)(38100700002)(2906002)(44832011)(498600001)(8936002)(6512007)(52116002)(6666004)(6506007)(966005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GVI2az3fQcH3IKqD5gZOpD20yI1Ue0KrIGDcAMO21zwghUR5sZQ/RNBN+Byd?=
 =?us-ascii?Q?0nnOSMEEp+770WhO/FkDhWa+eZi59I9tPJT5M2IgXSsNQ4SWE73BlTuTCeEj?=
 =?us-ascii?Q?LX+BuS80rxHEbq214v4t8F7s7z/iuUHAqz3WauUDCXgcr8jrvKn98ZRAfAU1?=
 =?us-ascii?Q?sTKvDB/kOBWxYmKiz6f/RKE41kLaz/LXxoCBcWaQVoFjpeXm9V3ODvszSm3h?=
 =?us-ascii?Q?eCHYY+VOK1fzsJZVhetFeKruifOc2R69r9hWodhkZQfOoGarsLFYKnrdPYzZ?=
 =?us-ascii?Q?kPe8gASAIZPkvVUceaY9POueUYPrVlatjYqe1GttvsCNGJcwZ5IUYb4yxZbw?=
 =?us-ascii?Q?qOsmzDePdjzMtKc37zXRflM8asisFk8WT8W8bvOG1+oU6fibysdcHU9qxmCs?=
 =?us-ascii?Q?3RsBUuMqRotGBVehAurOjICYHOFjvQxeC/t2bOLHH6eaesNlQldDQ97nWGLb?=
 =?us-ascii?Q?FY3X++UIP8fLUQuoXMn4YY/0wm7SCGZTpOkAEVALFrp7O3TVg0UPBKbg32Ck?=
 =?us-ascii?Q?8ZyGgG2YuSzW71EX5rHsAR1uVOVk+ohdO0dE492WmG5STzEVZ11nvyWkYCjv?=
 =?us-ascii?Q?DQbuE2sBKcRW927+3IG0MikBkjriwdOFoaL7gfYL+uZs+ug/1p2g7xwyH6DM?=
 =?us-ascii?Q?070/jotTgNmyFwuRhIsebVufECAkwsR8eGCY0K/YoyYg8GACWwnN3mzsPYgb?=
 =?us-ascii?Q?lVukmQDeXQy0EVDkwcVBWtHWT9aSoUPBK5bnbXRbHGkC6NfyKSErXhQzUqm9?=
 =?us-ascii?Q?yrgsr+DEK2l0Sk2ou2ewoGmQbi8KYMUGw+Vny1A1j7OMl9lMBVspBHMWnLOj?=
 =?us-ascii?Q?3K1L/sf3cNBfmfFWsgRFv0WqxbxxQT7QQuHfzDiZlUfNTMtyBUyLaT3fL5KY?=
 =?us-ascii?Q?7hO30+volpi63R7EBqAsvNIPM8gHTwQwJ46TCCSkilGAsXWnywOUkDP+0751?=
 =?us-ascii?Q?OysW47UJ/xFUwngveET5hRLIu/uQgzT9HKFJABp+D9IXeAaRkRTMchL9gl7r?=
 =?us-ascii?Q?yWiBdw/zXtcxyy7BHjtjQH3e4e9eHRrnQiVhogTE/yJOk1O7C9d8ufv80VWS?=
 =?us-ascii?Q?kWv4PVikbF2rhOtbbc/MjBXmx5T2H04Wh7lKg77NMU+3Hio0bi7/t9FyJxLB?=
 =?us-ascii?Q?77Z0+5QAPef0gTz4CI9gePzgt3AM+22N4Mz8kCSccBO+vr/IgZV4Jj+Ovn8V?=
 =?us-ascii?Q?exUDbpWrjWqktbB8osdT4jJIkY4NFz1CHYCFhQRNvQHYfEHFG9vWDGpC9/0H?=
 =?us-ascii?Q?TgFhbXqpiOoRVeRKrr4tK0upjAugj5RTDj491S/xvT6Odbq8MPZ83A9CHKUm?=
 =?us-ascii?Q?T2gjJuIthGZcSxpXECecuoc8G9KOGgigxBKYrMKXzn1x+HPULf56ZwPuVTFJ?=
 =?us-ascii?Q?wmY7tLvJPCaUbNXRTOohlvA9hjPO8rfcC/dJ+8VMwxw9yfYseHTkZtFAtJi1?=
 =?us-ascii?Q?sqcIbrh9uwZ5e+qFmkzjJUZp60Hs2oRDiq7YnkFm7wFvkXUv/5xkxuNVXNpk?=
 =?us-ascii?Q?NkDhjvPOyHT7BhOa+9bnImTjCMcNOTrNgNTwNN8Xhv9ziApCP9OOW3NeWbWK?=
 =?us-ascii?Q?asRdwSsByhFtdpRGTzT4MfQb6brdkuTT39A6ozQhCCIEJK6ZZW/XCqTBz2Fx?=
 =?us-ascii?Q?vByh+LANlVyIH996YZu054WvuIalWxinsnUdWnnr3E4Krw375HEQXF3pkmnO?=
 =?us-ascii?Q?gcU8jmCGFQMGYkzV2FAYXGbRAiI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c7402f-3810-4496-8379-08da01344ffc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 18:49:02.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSqTcimh+E0dLbCvAs/zZsgge4J+qxb8/NqVFRWC7AQGO0GwkraZecHnVeX/KRiwAtMhxiD1vvW/9nquSRseHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4311
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

v1:
https://patchwork.linuxtv.org/project/linux-media/list/?series=7443

which can now be marked as superseded

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

