Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C484CDF5E
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 22:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiCDU3s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 15:29:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiCDU3r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 15:29:47 -0500
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40049.outbound.protection.outlook.com [40.107.4.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E1F156784;
        Fri,  4 Mar 2022 12:28:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6DmUonSYItxQwEXTp5V4YKUR5FAQaLwly/1PRrvfa2SSesUMvRR3d/D6vWvZjaHPKjmeiKHL9H9A9pZpWoFxqLqkWRq+TfSXDcjNN/qUA7N+wH6y0wl9UabmS47BeH1zfYjqOu7Jwjg7esfvT56DrfGHW7A/U7/6bsOolO+38Pq0k/h31Tbk9ayM+wd934nO/OwTBUhiGz/Hjg1pKjDDzyBF5+KtCT35TskX2A7eycb1LbaCmNp+IpbgaOiiVDJY3MoZ27bVopynCvzmoyMNj029JeO+6waaNlaJYD3T322l7LBfweYwm8WSOc+1ut/IRMvhzXC4UCPd98HgWtIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eu9pkLHuiQce33dDydXrqbwqzDrSrNPO1jANosQo3iQ=;
 b=iURW4sWC7F8BavDNIAZBC34A9v9izQEUj1UR71/kT1OZpC2xvfHpJ032RDU8gmI8rItLtWAIOmdxkgGzVE48I/xGvUSN+nGz9ri/rzfNldbjwVargwBBUdAFgMtqsdyIjvgeMxoNVR83Dh80gzKStUHP/Gn1e3vkgNMjiC7TGIukbar+8GfT39muByI2qvGSLmDormkO5W1Ufmutsp7H/XEX9xW9a1YJqdeFjSN0Rs7QrM+qeigjck6y4cQwpo9XjXTGGlcE5uXx0fihjb8fAA2uhrCzpAfauV0tOcNn/LXUGE28t1kybtPXdwG0/kFH5DEngSjL/tMD3dhVJ1h9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu9pkLHuiQce33dDydXrqbwqzDrSrNPO1jANosQo3iQ=;
 b=HL8Yq6tuv1uYk1CF9AKgt2SsfdvEgipQmP225tvZEdtd9dPqz/mKpYIlkMXuW1d0ikNjdSCe1h2nb6pou4E79zPk/LIW9j9YGmAVAoKOFTFOSbO+inepNAp92ZHsnxltbMBVvT/iNw9+wojT15Hf+TsvCORLxxjwZNGks7+U/JE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by HE1PR0402MB3498.eurprd04.prod.outlook.com (2603:10a6:7:81::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 4 Mar
 2022 20:28:47 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 20:28:47 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] i.MX8MP DW100 dewarper driver
Date:   Fri,  4 Mar 2022 21:28:10 +0100
Message-Id: <20220304202813.2560202-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0245.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::17)
 To PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 677de40f-a95b-4de4-80f4-08d9fe1d95e2
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3498:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <HE1PR0402MB34981DEB9DC98359F0E1CFA4BA059@HE1PR0402MB3498.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H4N8qcC4FpCruJrJYEqkk32uLrZLcortLEg/CVia/FP7UOFh1LPZghlbjC/qR0LVvSmY2du8vhcGpG4tl6owr9gXKSqR2exeXDo/94GeE7Si20WM9PrGsx067ZqSIX60T4+gbLoe/sC401TtAVDsLIpQuOv5F8E33Fp3t2yn7aJYhpe70p5paTXNJM5qd4VFMgygqa6tt2dLc0z+LIx+R60Dcskp8aX0iVOaazPSRyd9RtXbM6hB87v3sL8xiGjJHlfflTG9MH4QpBsMjPffUpYLAU1pfAkII2ZRdadgMJ2YBSWy5Tso8BbJAOs4DMpnj1saFCgVCPaaox7EA2YjB5wf9qMZny1MDm4t40wsMxdOJM+8CiOkLsMzjpeYDXWe4Q4zSbiMailPrbTBzdiVqA09k7Xp2as9+9Yam0xPB2p0Va6qvKl8diEWy3+yU4aI6kaVAs3bI9iiuoNc/j+eeiRx4F3Q5KNZvrfoodLGFaaNC3kwXOKu6JE5+ZtyqZYhSBi4iZuW39r2oQEduXAtmn7umViPM+yzn1V5iC8M7GTkAhPXRnLMYgcxkKrE8igrA/imgfT5pd1T/EFJr1o8UFVWvVREB6aiQ+mnzVPJ9bPSqSyPIcxAh8KaO6+Cz4Ewl+GitUEBQXunfKGL8b1iaLiQ3lWuuPN0howDsKC1ELpsAUIIpe7NsYi059Xshv6K/ELhsNdMYe5D4aXf9v7OFAgf6bpJiqMrvYQmFVcXFMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(186003)(966005)(6486002)(1076003)(8936002)(38100700002)(86362001)(5660300002)(44832011)(498600001)(66476007)(66556008)(66946007)(83380400001)(6506007)(6666004)(6512007)(52116002)(2906002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HHOrW1grtXOX/+NvwnueZIyK3fjTMRCrcsQjjUouywgzxnXGQ27ieg4lPv3Q?=
 =?us-ascii?Q?tV0BN4f1pZOiYe4gFmkgw9SwJelG3iYJQta6OuhtRFn574sFeM8OSnzdwHGx?=
 =?us-ascii?Q?JTLx9Hdk43SRFR17VFYEobOtU/gEuqDVyFTX+Hpdcq5uPxK94w8zA/1fooSQ?=
 =?us-ascii?Q?RrQ1hmL4gWanH7hjzN4Wyp6bG60WZwK8gypyb7lyKChzZtLtWVIGisCqWj9z?=
 =?us-ascii?Q?rvI2BjFf15oSGHn+xarEKe+jyDGJaIA8UhonKI0XOQjAMtIzkLDI3qPH6ly+?=
 =?us-ascii?Q?0nLYjpg3srdxZOTXfZ3GyZYr2Ey9rnJBWa8C7k9jOwdJHEzrhUTQEzXtuqiG?=
 =?us-ascii?Q?5ucCxUqjwXwnm/23/6Vq4UU7q8IVrBlWBy4JF5hISH0PRT3VsED59RtxcmVt?=
 =?us-ascii?Q?6uDSjj8beUZUBe4Y7cUtjM1jsDP9qAaOCOu1t+q+UYLfRP11LSj1xke26V8N?=
 =?us-ascii?Q?myfDJNBXtGezqp/SQTvYXsjhmI58FlyX3DAoq8TwteJtWX1GFZNBRRngqX0u?=
 =?us-ascii?Q?H/1oPgQn0vHTT0nfZfle9pyQWO6Q2dqC0Z6aVgK/WekQZ1D5CANNka/BmtF+?=
 =?us-ascii?Q?WznOBBFahoCBAeet61O5aoc3niDAs0p2UlPN0VlMuh8Ibe3Wo2mEdPqHpKp/?=
 =?us-ascii?Q?FwHU1tr6LUt08GpWC+kmpOafVz3xx/9HJGkUCOjybZfM39ab3lzsmm+tUErA?=
 =?us-ascii?Q?XVVhzGoaRrW0Rnz4yk8rp7sE3FRSMsN+M1zcn0lrwgvHVA+/maDWK0uKHprE?=
 =?us-ascii?Q?Alf+U+HzIubZTDlG6ASz+oZoCANhO9nN41tPL4tNamwVNstKTejkO+KlaQMP?=
 =?us-ascii?Q?BN8MaF+Bleth88Y6OuhvuiZM9f2rys2ylMa5VC+CltXbeWPbQ1c/xiuSq/Nk?=
 =?us-ascii?Q?2xD0J7VUMWsqmFX1hS31tvb0HPrKDo4V16MJvudPcInAn/hNiwN5W4qkouXn?=
 =?us-ascii?Q?1GjIXCj41c6gY+R9Gkw/rzCzBkwcK7xrTt5nx9mlb2e9cWgAnFgUEGa7E9GI?=
 =?us-ascii?Q?L1eIE5UQnZ5oI6+F3sSCisskh2n+2rlMQZvKugG//MYnC2aMyuRuCd2U7zyw?=
 =?us-ascii?Q?DjaTqel/ScOn/kwcjqoVxSOzqStSOPOT5T30zHsVh4Qcu+9QlGsTDGtwYJDi?=
 =?us-ascii?Q?wR7CGto9Mvk9yUwL/Px40N8NkSR3FDW0Tia4xFm9jj0dLtjIatl+lSeaiHHf?=
 =?us-ascii?Q?fN3n5is2xxE/yeShrCkKDD1xERp4fEFJLAUsvBkLcazJgHiGDqiIZcEY26QW?=
 =?us-ascii?Q?YoUQ3sWecnuBohdHtqiQCJcw1DIuSKyjlTN51kCT95+iESnBeSAqN8wBfkC8?=
 =?us-ascii?Q?jngm9C2Zyv5Z/4lBEHba+cnfyoTVXUvsYS6MNkXjlLCxeR1tkGzQ5W8j9u81?=
 =?us-ascii?Q?BuqWETWV6aSuFuouxOUIEASq+OY8U8Ek2d1+B52tI9eJt3fWbcrasqiN1JPq?=
 =?us-ascii?Q?nhsfGGmI91pvIDwwDqRjZGsHvRet2CQph5wyHw2JOl4jaiX65xYsm+IaBnlu?=
 =?us-ascii?Q?Bhn6n5jSwWWbfGqPS8iurCZliUHqPMyI1vgOH90RFPtXvItImp+1KcD54FDv?=
 =?us-ascii?Q?TbMqFbll6HI9FzhkuvnUztCByj81Zq3V2H/M+mOPVn9ijz+iI2XYfMzLyCGV?=
 =?us-ascii?Q?z914xFVt6GMYhMN47ZnJrN+rI0vvBy5zqCm51wE4aX/QY9RfKDtZfxBSzXkM?=
 =?us-ascii?Q?qOBgKxXBdVBn57opvQHCZRGLzvk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 677de40f-a95b-4de4-80f4-08d9fe1d95e2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 20:28:47.3197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVctWpmgP+hhGv/egiMhciTBiIpXrBNr6dtkF14eo0B0TuR+U3x7Ly0Nidjl9te3vfKTDDNFEb41s71OwfedQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3498
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

The Vivante DW100 Dewarp Engine, found on i.MX8MP SoC, provides high-performance
dewarp processing for the correction of the distortion that is introduced in
images produced by fisheye and wide angle lenses. The engine can be used for
accelerating scaling, cropping and pixel format conversion operations
independently of the dewarping feature.

[1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=618788
[2] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=618869

Xavier Roumegue (3):
  media: dt-bindings: media: Add i.MX8MP DW100 binding
  media: dw100: Add i.MX8MP dw100 dewarper driver
  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver

 .../devicetree/bindings/media/nxp,dw100.yaml  |   74 +
 MAINTAINERS                                   |    7 +
 drivers/media/platform/Kconfig                |   12 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/dw100/Makefile         |    2 +
 drivers/media/platform/dw100/dw100.c          | 1792 +++++++++++++++++
 drivers/media/platform/dw100/dw100_regs.h     |  118 ++
 7 files changed, 2006 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml
 create mode 100644 drivers/media/platform/dw100/Makefile
 create mode 100644 drivers/media/platform/dw100/dw100.c
 create mode 100644 drivers/media/platform/dw100/dw100_regs.h

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

