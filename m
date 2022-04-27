Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5458511707
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 14:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbiD0LuM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 07:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232984AbiD0LuL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 07:50:11 -0400
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290109.outbound.protection.outlook.com [40.107.129.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3287884A28
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 04:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCUc4Wu1Xu32d1CmooGevqWW4eiNPFFoLqEUxEdcMi2Lr1IDxYTTwvDFFBhDP2SwKdbdYVNTLdpWtMNWAqsP1D6jUTPNw9qNPdFvCK63Fw2lCZfJDgsoC/I5SbMfdNfjz2in2qbLsv3jMjeIlPD/CKkloI0FWZBDaA80IPaK5fpXbg6jYn8EvO7h29YWdxEBt8O8pn3RFxnO+8GRWM8GcpttktWDPdbNcjZvqsJRnUHdkrQRUUv1wN/WwXXGpyZZ/JFed13nkaJAkr3cHr8Y76mtNaGP1F736WiunQSdhNbIjMWQfx/Z2nf6z1/hc1eKSkgzOlI8yK0BtwkOOVvBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHchYtvD2EsN9c9gO9IauNs6znvukIbMFexPUL9ULkg=;
 b=dSKe6niBe7TAAUYamqEtWf+hOvohrmy+Db6sUahCeJg5A0Z8tSUrd8ZLYfE6TrnWt8YKc6EXVYPZ/lbUbyNerTEzKJZ9FZBs1RabzaEtAiSG0QDfrKvI5bVdYskOIkonQUtrofXrA1R+dlK+h+QYhx/5LuGXX1oBj6bLv9ex596Od9Z3IjM01NFbNyL4R4yVzf42bu/a52ab6u9mFIBDEc579OH/Os8lwBtpAUteVBqW8/UjtXMslAMWAVXrgOKPMElY6FPaZm0Vh4O90i+Ick/XaJLpct84NM4jNT/m9sODE44xdcg4B3eJfpdte5NGzX/oyAENi5O3TjAG7JJAVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHchYtvD2EsN9c9gO9IauNs6znvukIbMFexPUL9ULkg=;
 b=AQdrp4GwULprJb4YgTd5ePDcthEjQdxLbVjVTWK26Eblmi31a0pUEwS6NwiSEzSJh57ZAUV2Kh+mc/dHvqoAzOhaEeEpxqiKheVJ1EQ4fulmAexz1coygaaKaSoumV94CqRF0E13olHwwoMXac7REgETo/iS8vzZEzLLxTpmEpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1502.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cd::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12; Wed, 27 Apr 2022 11:46:56 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281%9]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 11:46:56 +0000
From:   Nas Chung <nas.chung@chipsnmedia.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v8 0/6] staging: media: wave5: add wave5 codec driver
Date:   Wed, 27 Apr 2022 20:46:32 +0900
Message-Id: <20220427114638.1638-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0124.KORP216.PROD.OUTLOOK.COM (2603:1096:101::21)
 To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b036e8f6-c494-4b09-cf5d-08da2843a1ac
X-MS-TrafficTypeDiagnostic: PU4P216MB1502:EE_
X-Microsoft-Antispam-PRVS: <PU4P216MB150299C838A9ED849A903DA2FBFA9@PU4P216MB1502.KORP216.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tQM8tHIJhYF0jHXslWEjd5iILrRRvf2c5jP2AwSfsGJFN6CXcn/8ISgBya1PTekn0ICBM0HC7Pjq8s6b4A4ttCbVNjw4DnSeDpRcv0kjOCAyv8zeay+bIm2UEkGeKQAWIRnLLj0lxRxwv7ZxOA+0zFbChjAp93pAuGNIQmAvEHR+A/r45aXFlC7gbRBaNhGlHrDW4Y8PlXuJuPsId+MEcX7IbQ7LmFBBrdF8DrdF8dFIJPvb7KSqB6/nAr5/92LG8XhoFj451e2Pe1ZPnh9g32zhnqOCgN5WdWLPJX5rywJBtUAfDaRbwxLjxThjYddYONw8KPqQzr6QWU2EGLKTApHyT++4rQ1qC+vxwVnOMDxISRZFmFHtWNDbMlN5tnZ965eUUCGKQcnN/L+dEyWakFvGAaEaaOGmdyqAgzjLAtEl3wQUmsb8mH3DRebq05n5/abBIarS+iLBt3nTBGd7H8BZ3IqMT9rZWGMjlLKnnyoWxsEKmZSokBnKFsCCkdWhVSjkUSvBDAhBG6EKE4qWssu3WW7tZ5fcUwzTkpWlSsMq10/BMuiO6bHT1b68WvcHufhPIsqU2uGsa9GAiFtdLQUaGllPd9vUWqs/xV1c5zia2Uz/a7B/sx8eI8FempZHHiQYNyBSjhmenwHDvD8VFqLZTXvfXCSrWGt9vIB4vNC6BH5H0VNR0JQc8InMqCOOz40TWMiVpbkaJ08XaZMvsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(39850400004)(396003)(136003)(346002)(366004)(376002)(1076003)(83380400001)(66946007)(44832011)(2616005)(107886003)(5660300002)(2906002)(38100700002)(6916009)(38350700002)(86362001)(508600001)(36756003)(6666004)(6486002)(6506007)(4326008)(316002)(8676002)(52116002)(6512007)(66556008)(66476007)(8936002)(26005)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R0IgS48qlFvSpml0vuc4ZwuzoN+aiOxDpg7ZQHo1ZYXay1B0jpoH2m8Lyxll?=
 =?us-ascii?Q?l4EKXlmj6hwGMusbsY7RK6XaGOzOVr7c8Uutw6CyHL2/0yrth44G2TAz1XAy?=
 =?us-ascii?Q?rXct9GzG22HXH8wcztjULvjY4v34kfvqxOimwKRC/8+PgIDdIF8N8a20mMjC?=
 =?us-ascii?Q?Kvh0Olg75r4THkpThNdyAtKbvZOmt36o+i5uMPGMTJgd2g+wYHj/HIKLWWpQ?=
 =?us-ascii?Q?WY3zQqSSE4axuONiU+kPq1jeNCKxMWnNYykxYr0wu0HzLdh3Mhi/B1b4FGCT?=
 =?us-ascii?Q?IImtPdT4j4IuenLKs7yg/SN6OcI/IZAp7w9m510m2ZUuKcCTUPTgxmlpisC6?=
 =?us-ascii?Q?j3PDA7lM8u//jyOeyhl2asGBGXx3skFqM7EyKBXD8ZAy2fR2E1zyl3o8JoeU?=
 =?us-ascii?Q?CTgb5IOwKdxzyBzaGYDNhMfmqAvSxXmxNe1Xv3lysnhrYEAzZyBosr4seu7v?=
 =?us-ascii?Q?1m1whVfzZUHtiCCxSUlmBg4nAGdYuD8TLQnVQB+kFsH2+tSQQ6okCy3Q9VCd?=
 =?us-ascii?Q?zZH9DRYe7O9ClI1ggEh2LDuu24kZ+SlGplooYiCbh9W1OjZ2mCZwUk+DAnxC?=
 =?us-ascii?Q?BpseOJsckiytpu7FudJw8VVkALAiYFLmqfi9tZhvelmMlgbWZYijGgX1OA97?=
 =?us-ascii?Q?2Zu8L0KqZkRThjkO10c7/rCnEnF2vxey9FK1QKLAoaa3FQUQ9+wP+tdoZ2mf?=
 =?us-ascii?Q?tb475YauY2uKyRkIbUANJItSZpRGoyyL/Pr5b1uQOw7C38JRYuEccgpKb1uH?=
 =?us-ascii?Q?LPVAPvfh284E/7HjghpeDthCeRE/jb1LQiYl8vPnQylDjK+b4fSJZZAo+bhH?=
 =?us-ascii?Q?AGyzlzhjrzvQXs/0dEwQ6NAzD7ZhtaJG9013Qw7UXZjsNLUkQBfpnv5MpQOt?=
 =?us-ascii?Q?mz81xSQBYYb/u3kV87VtNaUrBQRaiqBL8tuMVicQqhgtzIoMr6W7EC6O7ZxL?=
 =?us-ascii?Q?/TjY0vZo3aWu7GMP+U2FGTADkc6zPOu70uFw/qFS8iVeobT+woXx2I+J0HiQ?=
 =?us-ascii?Q?6idf0q/g96ECNrM2XqDyGejJQrXEeipNkqdZRc+rronohIR0hebSAhrSgXyu?=
 =?us-ascii?Q?4sDVmDGAb9Gp8T0TsIJTodU5V2tJJM3IG3ZXh5vPAG1CwrmAEQZJNgVJBL0Z?=
 =?us-ascii?Q?AY34aeGAa7bltk1Je7HsH4R0EcZWIwx9cKn/KHt5iEp+Kw/DTKbfzbsQmEE+?=
 =?us-ascii?Q?i+QsSlRCdh/EG0mvUVKc0foFne1T9KGv1J9qMDWRr9Ce+hZPUAloWLtaQnVA?=
 =?us-ascii?Q?0OS1aJBLGQPWUMdDULMRJes3eRpi1a5va92pjMpLDB15EF9uuh3mzmQnWsm7?=
 =?us-ascii?Q?HLXkMtYNUgqQ6sM4LRB2CSC0vw4SCoE5tQxnz0R8+T2P1K7n/eStS8XE1fU3?=
 =?us-ascii?Q?hczRlZjJdt3ez5xPmWrPeO91iz4pG9B0Zx9IYfYmjUUfZO4vqeFFL9Z5niP+?=
 =?us-ascii?Q?mtPps6M7f772LRr09rfBK1x9tpU5YFnXU+yYIFMRdnNeKFgQSa3A6DmrTFkb?=
 =?us-ascii?Q?t+fo81gtJEm4dykaZoW0yoiF/NnM6c1pxA5oAilFgoQtntheAfKmNmKQt9hS?=
 =?us-ascii?Q?VwpvbaJxfRMsjHhb7up7ZypKPTiyTmYf/YeOPG4bveEFVByLpp3dGlkPGkH/?=
 =?us-ascii?Q?v0XPvNbBrRhWmOAzlsx4eZGf2QyblsgAvhyDfw6z2j0QsKij/C3QwADw6PSL?=
 =?us-ascii?Q?HwLUEGU9i9mMEuJvAjKJE/XVj7Rfrwl65i4XVH88Uk0mvL4cVJZyAxgXNoN9?=
 =?us-ascii?Q?VIS7eaze16VRGQmGUhXIJASH2wSMn28=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b036e8f6-c494-4b09-cf5d-08da2843a1ac
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 11:46:56.7660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX19UzjH2mFHSK7RvEcQH8Nv7Txr35n8u/0K1CiY2Xp6erDzXej3dFcQkmm9RqAeRbwOBkuTQ7kTrPvuyPeFbNTE7w6kaFHl90/s1Kphxxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1502
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Wave5 codec driver is a stateful encoder/decoder.
It is found on the J721S2 SoC, JH7100 SoC, ssd202d SoC. Etc.
But current test report is based on J721S2 SoC and pre-silicon FPGA.

The driver currently supports V4L2_PIX_FMT_HEVC, V4L2_PIX_FMT_H264.

This driver has so far been tested on J721S2 EVM board and pre-silicon FPGA.

Testing on J721S2 EVM board shows it working fine both decoder and encoder.
The driver is successfully working with gstreamer v4l2 good-plugin
without any modification.

Testing on FPGA also shows it working fine, though the FPGA uses polled
interrupts and copied buffers between the host and it's on board RAM.

The wave5 driver will be updated to support various EXT_CTRL encoder
interface.

# v4l2-compliance -d0
v4l2-compliance 1.23.0-4923, 64 bits, 64-bit time_t
v4l2-compliance SHA: 163144712a46 2022-04-25 05:31:44

Compliance test for vpu-dec device /dev/video0:

Driver Info:
	Driver name      : vpu-dec
	Card type        : vpu-dec
	Bus info         : platform:vpu-dec
	Driver version   : 5.18.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Decoder

Required ioctls:
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
	Standard Controls: 2 Private Controls: 1

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for vpu-dec device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0

# v4l2-compliance -d1
v4l2-compliance 1.23.0-4923, 64 bits, 64-bit time_t
v4l2-compliance SHA: 163144712a46 2022-04-25 05:31:44

Compliance test for vpu-enc device /dev/video1:

Driver Info:
	Driver name      : vpu-enc
	Card type        : vpu-enc
	Bus info         : platform:vpu-enc
	Driver version   : 5.18.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Encoder

Required ioctls:
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
	Standard Controls: 15 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for vpu-enc device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0

changes since v7:

* update v4l2-compliance test report
* fix build error on linux-kernel 5.18.0-rc4

changes since v6:

* update TODO file
* get sram info from device tree

changes since v5:

* support NV12/NV21 pixelformat for encoder and decoder
* handle adnormal exit and EOS

changes since v4:

* refactor functions in wave5-hw and fix bug reported by Daniel Palmer
* rename functions and variables to better names
* change variable types such as replacing s32 with u32 and int with bool as appropriate

changes since v3:

* Fixing all issues commented by Dan Carpenter
* Change file names to have wave5- prefix
* In wave5_vpu_probe, enable the clocks before reading registers, as commented from Daniel Palmer
* Add more to the TODO list,

changes since v2:

Main fixes includes:
* change the yaml and dirver code to support up to 4 clks (instead of one)
* fix Kconfig format
* remove unneeded cast,
* change var types
* change var names, func names
* checkpatch fixes

changes since v1:

Fix chanes due to comments from Ezequiel and Dan Carpenter. Main fixes inclueds:
* move all files to one dir 'wave5'
* replace private error codes with standart error codes
* fix extra spaces
* various checkpatch fixes
* replace private 'DPRINTK' macro with standart 'dev_err/dbg ..'
* fix error handling
* add more possible fixes to the TODO file

Dafna Hirschfeld (1):
  staging: media: wave5: Add the vdi layer

Nas Chung (3):
  staging: media: wave5: Add vpuapi layer
  staging: media: wave5: Add the v4l2 layer
  staging: media: wave5: Add TODO file

Robert Beckett (2):
  dt-bindings: media: staging: wave5: add yaml devicetree bindings
  media: wave5: Add wave5 driver to maintainers file

 .../bindings/staging/media/cnm,wave.yaml      |   73 +
 MAINTAINERS                                   |    9 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/wave5/Kconfig           |   12 +
 drivers/staging/media/wave5/Makefile          |   10 +
 drivers/staging/media/wave5/TODO              |   34 +
 drivers/staging/media/wave5/wave5-hw.c        | 3405 +++++++++++++++++
 drivers/staging/media/wave5/wave5-regdefine.h |  655 ++++
 drivers/staging/media/wave5/wave5-vdi.c       |  260 ++
 drivers/staging/media/wave5/wave5-vdi.h       |   81 +
 drivers/staging/media/wave5/wave5-vpu-dec.c   | 1385 +++++++
 drivers/staging/media/wave5/wave5-vpu-enc.c   | 1532 ++++++++
 drivers/staging/media/wave5/wave5-vpu.c       |  381 ++
 drivers/staging/media/wave5/wave5-vpu.h       |   73 +
 drivers/staging/media/wave5/wave5-vpuapi.c    | 1049 +++++
 drivers/staging/media/wave5/wave5-vpuapi.h    | 1144 ++++++
 drivers/staging/media/wave5/wave5-vpuconfig.h |   91 +
 drivers/staging/media/wave5/wave5-vpuerror.h  |  455 +++
 drivers/staging/media/wave5/wave5.h           |   82 +
 20 files changed, 10734 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
 create mode 100644 drivers/staging/media/wave5/Kconfig
 create mode 100644 drivers/staging/media/wave5/Makefile
 create mode 100644 drivers/staging/media/wave5/TODO
 create mode 100644 drivers/staging/media/wave5/wave5-hw.c
 create mode 100644 drivers/staging/media/wave5/wave5-regdefine.h
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.c
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpu-dec.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu-enc.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpuapi.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpuapi.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpuconfig.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpuerror.h
 create mode 100644 drivers/staging/media/wave5/wave5.h

-- 
2.30.2

