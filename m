Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9065C576324
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 15:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbiGONyE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 09:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233536AbiGONyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 09:54:01 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578001EAE5;
        Fri, 15 Jul 2022 06:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYy+51BUbJ/8lx+zhzFZp7LeyK3RKPz2BqwFXLUcJrYM+NHR+d7vin82lLC82/U+AyZRcwYjJrqXdJKRyYoEmoIUGkSmeGCXCJJn7nVjjfcEkQIYRNzj0NdjPQ/KUCz6ErekbxhpRM3CAkBpF0LRVyTprkscEjAwmMCGhxkvwZ1UsWsZNe2mte0KeZWYOxsR3AshhNyPUHr7MNwb1+4kb/0zlabOv7TmaGKeY1mnZZOtKly157fhUl7mN5nl84hyCh5GWYqFZLe0SNAHPQ6h1swjC2zEjFm6fksoD0OZZOrC49cBWsLfvmD9iGEYsCX/YY8VCZ2WjCxDEOSwrnFXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTkGBGBTm3SC7lnico3brxOHPbeHD5u1bfFJ7RrZy2A=;
 b=BnERpWM7CaLOmHqevBJCKTMGjFeECHMOMbM2Yd70xQbhubleuDMBEYtZrkN8a9puf6hWq3bhBvVTLlfEkpV55sf8QTQpgZCcKX6fIotrwxLWxjdLTCHvI59OpyViwHnWTh0QB8nJHDPM8LQl7kjxrbfQ1o9Aodv08n0zLHIpRdgKblvpKNpxTWEZSNsHk65gaQrr8NDGBT7wZo25iGv4qShyCvw4hSUwJXzONd0NIBA9H+Bg2l1nk3qNHT6gAVAwORPvVHLq7sLJRU+N2Uaj3ZNK375wPOaFfAOB6uqVTmqKDDbYIB0bqYaCE2nREbkN+7VQtkMUQn03hIUzIbFVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTkGBGBTm3SC7lnico3brxOHPbeHD5u1bfFJ7RrZy2A=;
 b=Xyl4EpeS6uodvimejTp5lk7OAfzmPz3jHFvySFny0zNBq2BhcybH6pLLHQHg8Q7amoCgEmOrKMeGONICfDU+f2dPs7IGdgilI8t2Fxe1ftOGLlXZtKtrbAwDmGf0EHWsfxKQa7zC3A/DP1SfK8v1hftf2YdNfBqUe5quAZGTnVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VE1PR04MB6640.eurprd04.prod.outlook.com (2603:10a6:803:122::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 13:53:46 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Fri, 15 Jul 2022
 13:53:46 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v8 0/6] i.MX8MP DW100 dewarper driver
Date:   Fri, 15 Jul 2022 15:53:23 +0200
Message-Id: <20220715135329.975400-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0061.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::15) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43478a59-d276-4556-e990-08da66697003
X-MS-TrafficTypeDiagnostic: VE1PR04MB6640:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 04iOY8s7Ri1EWPkgyQFrxx4tukKAidz8g5yIKUQT+4MEx8LBgz/lPMO/48yyxvcfsrIEd+HqbbFpDP2ChT00Ma1I4da1cBy4G2vtXc1ygK9CWfos8SaHjty1FD7Jhmj1VicwEUPWZ/hTCWLDv0vQIcKE7NO9aSwzA48DEa9nUsGRfvQFvdND27L38xw6VqQGqbee47v8AywctKbdlPXxm4FtEuSVOjEnrOt8tjAaIaneYa5Yk1B9qGOKojOdn57frWyEvgBQJGV+dBsrouPY+rR15FTZ880y6kddu2/K4C95T2mL6hAnXshNv9tRZDGp5gKhdW+4azc4/YXQ4lK+wSz7InTw2MfpZNj0iIm2wnKgcYME8VIAU1trgAwjtRILH7i/NErksBV032XgBHeFksW2m8KML7U2tuB+wGXMbziP6vdwQq/wpve0TY6BfdmKrlfBPg4QkaoR6W/RNM1F/CNhIw4m311CMwmlDS9Re4oPdwHVEMsV3JIEXrWw1e4jxHjmNs0xFBJARObkApCRiZKpbIByYHIWUBlj3uJfWs2LBwgjaa8icTrZbtV3BnzhyMtzJMVmlz76piPOVp86fl2pv/fL2sDcSAHm+Xxy9Onc3kv8F4HTIxT0UpYc69Zdc9jUbYJXYrkYtJTiyEwSLw7ghfseasruwtPOuPAh/dWDn5DyC0Z66fhequhfxpP2sYCn5zzLD+H7vvwE1gCzf+LkkRH3CnA4QpfPP/TMTIBDyTfnqUvFC4LhVgjO7Q+PQ0Cp/IIoUibFZ3Qpnyer2ijBDSm0pqCye1aSGffY88aSaYqzXJlVjtVF8XiZ8M2kHf/feG1Hpabbq1rxZitsWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(6506007)(52116002)(6486002)(86362001)(478600001)(966005)(6512007)(66556008)(66476007)(6666004)(5660300002)(41300700001)(38100700002)(66946007)(316002)(2616005)(1076003)(83380400001)(8676002)(2906002)(8936002)(44832011)(7416002)(4326008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Btb2Qalum9W3lkLBux7WqUsquVTdSvrhYpvEnNTbr8EX5aFUqdnl8IcJo5pA?=
 =?us-ascii?Q?HZJQe2LL8x7344pcLeFeCQL5wDNE+4luDj9hbEdvsVK7EG1BexkFLapfbh45?=
 =?us-ascii?Q?XYo+Q9CNaYYZOQn/i6utNGusjVTh/1WMn/7uvZAQggcU67Tlw9/FURmdQHgz?=
 =?us-ascii?Q?ZcAk7bjyFKwR3QCEIQe7qdR+lng2/IgC0d9eO+Yf0ivVjckiFU0WGFl5ylRY?=
 =?us-ascii?Q?DIFyOs2be7Rff0a41K9X1OYyq6lcUZaTyuAxCvgohNdBDWfW1lS0IArYVs3R?=
 =?us-ascii?Q?NQlzF0SF99ZJUld/BYLx0M1WfOOXxQfbHa5Sb5O2aUxcyj2QoAtD+QVEasJ5?=
 =?us-ascii?Q?2VEEvw5mUwS4ve3kOBXYy3OlZWhBxqAFJBUTX5yzS5UfnsFHLRpLvRpuLVvx?=
 =?us-ascii?Q?VGZdeeqOUd1j/z8f5u5Op3TWiL6tlz41SekrimDTkIHJ0zGn6M5QBM5dotAu?=
 =?us-ascii?Q?u536OEe+iKXU7GV3sCBCY1gVTBZGWjPxpioiWeiAPgpnAdgiOKK7j+6meU5s?=
 =?us-ascii?Q?GLSIMPCcBhajqzMGm+YDMGASAK+or9L/fSUPONJIsUuPsgMVS7/pOwFHVSFk?=
 =?us-ascii?Q?cLHby3etros0Zp0x7HowG79Rokmvx9fEc4v6ZrTdOqsC+6r9TQD+CSTn08vY?=
 =?us-ascii?Q?MuouD2c3XoCEprINCc35ORTFeYe7WrJshwD1H6eCovlxOjAH/TKTiv0DTSky?=
 =?us-ascii?Q?YRU1YLNQK6AYMrrT7kTvoDY913uItKX0EsTPfSaPq7puxPZFEqMBod5r3S3V?=
 =?us-ascii?Q?d/6JqC2vaGq+/sf7pvgs7tPJRNwMGDD/Pei4gM0r4c26GuE+nMsl+Q/2g0tn?=
 =?us-ascii?Q?jG6FqbfMwr3klsvSVS7u+JnQrOHZand3dCfUnn8OlmrxT4/EHwxw3UTTv7Gb?=
 =?us-ascii?Q?giOTpFpl+cw2F+vI+ZXlrWTfTlyZ+0vUqMHyYLLrkK1+IurjHcNZDI0436Is?=
 =?us-ascii?Q?bxOxXwyiKb0Z0Nqmc6pgxgSuSTkSZ1SZXJEdjuAJb8jyhrMye1owRxVCXzkX?=
 =?us-ascii?Q?wyzJ/6/2xaereL/Mex+jTfELK+MyeQhKXNwIYxxlSgcHcAOkSuYfdSqa1OUg?=
 =?us-ascii?Q?9CxWADk8Ox0psIpPfQGtfGLWaHlPa9xK7g8F7H+JWAXOlWHM9YYBGVHXPUcJ?=
 =?us-ascii?Q?d0Nm3fd6ErdDcTLyVHaYIJLX+AU8aFFhAxa/UnRP4w8ivFI1x74zqFCyEEoc?=
 =?us-ascii?Q?CrbZaMJ8Nimun4PoAMsu4ktFCJ5cV/csO+rMqU2GGVD77F08i8eU30rTFB0b?=
 =?us-ascii?Q?+jYz08g4SAbc7ZzBtgea6S3w+UGvy3ki7ItWrtGnzPsxQMmtseqQiXvaGw7e?=
 =?us-ascii?Q?N8F9FIxcuxkgmkw7k2/QBI46tRLZggWGNQbyT/1Xeeuq1w3szYDqePEUeOEr?=
 =?us-ascii?Q?2jze/DN7iITAemhdryDmwQX0izUqMtGp3rVqLUyYDiFG1mdQIRNzfmUsE/8x?=
 =?us-ascii?Q?UOTOBjNAsZvzycf3LR25hNmaGFGA0vs5UmHkthFGuD6MiDJK0dh33obwWrJy?=
 =?us-ascii?Q?ha+Nov9Qx5UhMuq2n+nvSKQ1UZ57eJ6PXbdMOadtksvfqGWz7lyagvTUB/fW?=
 =?us-ascii?Q?f+Awx4zrMT3P22DwfiWgYAmHXXtYqUJk6Ek3sTAJA2rgAV6ZCRGPPlZu3GQ/?=
 =?us-ascii?Q?7ub9qzCShWXQ10PRAZ6/fghKtZD2CEW5+RH72OXM/m7pC4ARcDfJXBX4Kn30?=
 =?us-ascii?Q?9qZ0/g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43478a59-d276-4556-e990-08da66697003
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 13:53:46.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OF5zKsV1TWcjG3MMywSK24hM5WdOVEbIPibvcSH5D+z52VhrG8RKC7obiafl4O3MPYzV0n/MvO9HItR9wUETvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6640
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
v8:
https://patchwork.linuxtv.org/project/linux-media/list/?series=8402

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
 drivers/media/platform/nxp/dw100/dw100.c      | 1683 +++++++++++++++++
 drivers/media/platform/nxp/dw100/dw100_regs.h |  117 ++
 include/uapi/linux/dw100.h                    |   14 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 12 files changed, 2006 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
 create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
 create mode 100644 drivers/media/platform/nxp/dw100/Makefile
 create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
 create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h
 create mode 100644 include/uapi/linux/dw100.h

v4l2-compliance 1.23.0-4931, 64 bits, 64-bit time_t
v4l2-compliance SHA: ae7f823bb2ea 2022-07-14 09:00:48

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

