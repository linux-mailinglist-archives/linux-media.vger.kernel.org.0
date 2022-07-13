Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B00E573E95
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 23:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237342AbiGMVL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 17:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236931AbiGMVL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 17:11:56 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9C533369;
        Wed, 13 Jul 2022 14:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr37q7brDuqRkpvZ1VAe/eMsQzELE2uQUo0SHLXhXXyH4WemqwB4X8qvtIfdfzdtTIZyG/SiEJj93ScT+TEt71aZQ911ADmefQXdUchj2uzvI1Dfj1rWrED+bfPrXCjjV/Ag4an7855WxCKiHfMxBa5AFZZvEUZWkbyM6r0j7zYrBMUPdILEFSkNd2eMN+JBgfHOvt4HG3hnbGwc3qa+yv6Av6XnyeieCPKCU7JWhSIaiD5IlB/yfZDbQ+2IPAdyNBgRPXkY3wIFJK2P+Axk9aJgt5vlvTCQf5BcpMxTWtOIecDe1M4uc4KB6ukihy8rRitpu9khxF3rwldEeOptBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Co+G3xpUyPVpi0F5k08aMpqttGOXSZ3HSuqq04eNVDU=;
 b=X4ugQ1Y6B0sXv5Y9XmJ1W0UH/Vx0J0kAso8EkP7MuIR0ld0PFzbA0EprdLnMJV4BSr12sEDVcZD/FQ4qW7gNk893AFU5xuMQJI8gQriVZdgISrfqnU6SfBDzMoe8N+Uyl8bA6tjGjaFioI7RWcExvZllgDMHlCNSLzfxXJ0mdzVbASSjXYUDOsQvsXrgb7WJl45Y7W0xcE6IYF+3YuIo/5A/DKRssECnrBmjHUweZUmPYfiC7AE5LjDnhZ4MmVvpHJQHqXjvo0odOOkphqvRsxFiU8YkUozcEpyidlgXvs6MvKBME7y6bno46chxCFSzQeoACHtqz96FNb3MA29M+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co+G3xpUyPVpi0F5k08aMpqttGOXSZ3HSuqq04eNVDU=;
 b=T/d4BaXwEetb18zzl01Xpafo5SOVxWkvmf/pELhw7Dw1tQuDOg5xUqMIx+oGAxTj6pdRGAEW8bEvgDiQJhorG0oP/wS+2BlAiqlE82iESFSYhFpNDmJ5SGZ5aufnKNroEWC7zwLIZz3F5S5j4htPU/75c0lvys95shGiPBIfH0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM9PR04MB8874.eurprd04.prod.outlook.com (2603:10a6:20b:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 21:11:52 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Wed, 13 Jul 2022
 21:11:52 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v7 0/6]  i.MX8MP DW100 dewarper driver
Date:   Wed, 13 Jul 2022 23:11:18 +0200
Message-Id: <20220713211124.2677275-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::35) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a322efa-2c96-4196-0d83-08da65144e85
X-MS-TrafficTypeDiagnostic: AM9PR04MB8874:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k4FnazZmYY9AmvwSKJwKSDODcW91M/2CBUi6S3a5TagsDWJTxpXeRSarYa6Z6iUjQXIZZc6wUwsX540+FlmkHceFbyjFamlhXyfQc5I4H7UYOc156bYlDWlNuXrA/DpmLWGO2kjMraIx5zeOiTfEWqWbbRW5ql0aE0vJ+93NVpUIQ3bFwfYk5bEwGjPW9sByphWlfCT29slKxUAgTp+t39kes7H08SB2B3BhO0Ee47xVPshoK8gj3+sAxKlabEyQwT4+9nmsvPn6oS4ZKXFER8RGTZoY45dLil5HQiq15SmwXTdVz/OON4nH63//XHAMeXoMZaHxSylIPCAyKeBrq0J2N1+snGeL5DSbgtl8cDSgCy5gH2jsaBezFmUjtTFR/F6gChgnkT6muxgUZKo2mYHVDfKcUO9LHYtA0q08Sr5rkSw+DJzveECU0l9mf6PkpkMDbvVdpnOvEnxg1hIBNq7i6X4PUVZPTi3HvmtgTw/yiZHetc6hb2Ae7Xq1ZfVkoGvuwOKVI7PatY/KYrnBS9O7jiv9JTJELjdkB/yAMvkzsFa/BIMNVXmFaYrptlTc8hxxOcJVYbLGiS0V+qOypk1HrDwgn/pIhGC90TSFjfbUT8gVvjLrnuD46sBjz0iuJvWzVV6n4vEBmiL8GKfl+psVZkrwtzgfh1SX9TFTacPsYFO1wzitGHnMxysrjbyJGrMXcJ/JM9QKUUt+vFTGbjuzv6VrdtUEJcdjD8SOI5uuATSll942LIFrNwzXOkJ4cNJ6bYdtZj1a7v888Cyk7BEVmrGid0hCkwkaqCCsKdjtsxJGfBOXSuE04pErMHnF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(41300700001)(8936002)(44832011)(7416002)(186003)(83380400001)(5660300002)(2906002)(6486002)(6666004)(966005)(38100700002)(4326008)(478600001)(316002)(52116002)(66556008)(66476007)(8676002)(6506007)(66946007)(2616005)(6512007)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kYN+dXaIS3FpVAB/Dlo0Hs5vWyfB6E1jL8XU3Z/3kJd8pONUb07lhmPi7t/A?=
 =?us-ascii?Q?CzJnUUlFyjrw4OcAUOvYh+1aE5UD26ynGAFI6DNp8eDOOHeEQ9HAU1vMuzk+?=
 =?us-ascii?Q?ocM7s82fTWvlYfFZ9mzHx+tv9dncNDAoARhVHTtZQYuMJzozGh8XAeuPK+ri?=
 =?us-ascii?Q?dledyWhtiuuOkWgvx+wNg0f5QU/jj+6MV+XNVWdd1v3gsrZnR/KTvnzFN6j4?=
 =?us-ascii?Q?uLdvjT4yiKvSQOvg8P5QouxWkbVL1Bn2uoqP9I3y8zQ4UlVuAs2bTrAbAkxo?=
 =?us-ascii?Q?kgzwlSFBU2PLsUb9TdZNmFomkX2MJGk2qoB3TXzhIPZNKF40iQuR2IWlkfGT?=
 =?us-ascii?Q?D5FPTbVafIjePhp90o4Ozh71sMHCwWsWc874TCM8PN1wjElgHYo/x4ip6upc?=
 =?us-ascii?Q?HN6Pxjc/IjcHr1AOdXK7CvpoOHf4Xz2JitsO0BufdI26NFz2nZH4xeZ5oB2o?=
 =?us-ascii?Q?Dd2Nlja4a8roZyLspPe9AYouOKqdL4kl1ds2iTypsLW7Eqeku7by6+OQLoFl?=
 =?us-ascii?Q?Z4/u8TGbAtwgBlcbClPNGB4F658nVqfIQhmT+9Oa2zhXVwUzcntZqOcG0ikD?=
 =?us-ascii?Q?GwC18csBk1U8RBA7RUce7J7/dsti5kxfYHfnWNpX8HMrGg9KRK7gadNOBPtc?=
 =?us-ascii?Q?61XZwzdho7C1Th0wdOWavt47K3BomAvLcFvw0wgzFTqXzw1WR5mzZ9tG4iwk?=
 =?us-ascii?Q?eBByEKqDC+1wm/zAMQrUgQRz31KhbdCu8H0NLP+pzS+YwRgP2but4R0qlVmP?=
 =?us-ascii?Q?s6E4b8bynwfxSVRdOnj7RHNP+NqklHjRAjPjaYN8h5gSiQRKy7DaTaY9v3v6?=
 =?us-ascii?Q?MzMoywA67ypB8wyBMHkdLJNrW+XbGf67SCGfYiO3f+7Mr/m9y1z30dpPLCHh?=
 =?us-ascii?Q?IJl34t4rYSYeP8wHpMNlNw7+nBucww1fmxwHzpu7h83nXzAVtJy74LCn9/I1?=
 =?us-ascii?Q?HptqLvn7r1CRDg6Mo34CxUG6LkyApe7bDW+avbeqwMzD4bozTN/V7ZFREIOJ?=
 =?us-ascii?Q?dY4SqHWcP/Fn3NLOkAT3enzE+Hqn+90md3LCjqzROuLyHXMQ3ftmney9Q647?=
 =?us-ascii?Q?d3NqgdpXQEn9hhq9vFs1sZrpjwDWf9npQytNlkQAY1eIOc4qx6u5qHiKr9Rk?=
 =?us-ascii?Q?yMKnsauhN1w9fpXmmKjW1Qt7tkcUbts1I8i1Mg9x7cQkEH6WlWMGMmi53gHa?=
 =?us-ascii?Q?+0kiIQJVVwNZG60OhhkqhaG9svHF/KdwwINXA/GNm/CKyimtpXYrGBrP+fyT?=
 =?us-ascii?Q?WRXUcLPF7DpL/DQlFd5ObqHUweEjg03dqKQbs/EQB32WGvKUNBTXmanxsqzn?=
 =?us-ascii?Q?FjCZYD+PSAZj1jPscGcCHCn6YpTkyH7rlMEd5O9Y22xfmR5yVhhbkP7l4xsR?=
 =?us-ascii?Q?VoAPxr+X0UoXlsGaeBS8jfE0aPh7d/YmmQQFZKkk3Se80TMES48MFksXOkEk?=
 =?us-ascii?Q?vtZ2d9nhVAcgf2IoK/S9LZYFObHemnzjkgAL/tnO3pIT3dYuROxip3sUFVmC?=
 =?us-ascii?Q?NPNajMpU+UKCZYZ+i6duXIGfuq+DRt8c+vlh+8lBEzrIZKpDaRMvaO9+nw2u?=
 =?us-ascii?Q?7jnV1ZIBzTUa9y6U7aAV2PvDVbiS27ehWYIe+ZIbgTR6LPS7+T9Fm5KSsxXX?=
 =?us-ascii?Q?q7+qdKY0ELKtB6HleZxg+i9qnJ7sVMQzMxOlTkE0UvxRikM7n3Sz6t0Y0EF+?=
 =?us-ascii?Q?qMHKBw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a322efa-2c96-4196-0d83-08da65144e85
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 21:11:51.9315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6C8dDa+d8uaNutyyYBJpAiYR3znScTVQ0kN2mvXUdkOcq/6dFBSaeQpy6W7Swx3HBx5FkOv3V9wUJhfDFiPl2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8874
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

Patches [1-4/6] document the driver interfaces, and export its v4l2 custom
control to uapi headers.

Patches [5/6] adds the v4l2 m2m driver.
Patches [6/6] adds the driver to MAINTAINERS.

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

Xavier Roumegue (6):
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
 drivers/media/platform/nxp/dw100/dw100.c      | 1675 +++++++++++++++++
 drivers/media/platform/nxp/dw100/dw100_regs.h |  117 ++
 include/uapi/linux/dw100.h                    |   14 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 12 files changed, 1998 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
 create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
 create mode 100644 drivers/media/platform/nxp/dw100/Makefile
 create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
 create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h
 create mode 100644 include/uapi/linux/dw100.h

v4l2-compliance 1.23.0-4930, 64 bits, 64-bit time_t
v4l2-compliance SHA: 33ad0c66db3a 2022-06-29 08:47:35

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

