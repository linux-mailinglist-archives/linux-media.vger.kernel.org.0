Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B0F321FB0
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 20:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhBVTJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 14:09:48 -0500
Received: from mail-am6eur05on2084.outbound.protection.outlook.com ([40.107.22.84]:34305
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232760AbhBVTI6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 14:08:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvHtf0MpspQXprH+aiX9mJIU4BrUmlDG4uAp9DwfRsgtMamX6iAszEc4bwEbMNlRii7RL3jibyNQpmIq31uFiSSsQQIO62NmHXOdLmZbq//rpr5UtmeRSCShRH67LjNEjYlBQvhrbpZwEDL4sOVQVh9NcN1n0CdrI+o0aMCoxuPJD072Y6D8vkCBtxLU8+uUYJ8bcSGznk+ZopJW23mb0rj2h3Eepd5qEmzfWsW6XtvcKMqKAEZ1H8cuk1y42fXo64aFIO3MnqTOEjeDiXR+GGZ+NTT/vVymdfa4wNn9mq2JB+zpkcKcDI76Aj0gcja5MKIfibaskzLm/d/OwuGcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWK3xepJFq0J6rPlqTSNHwfdKnIZr46mFpeDsW/kicI=;
 b=QlOKBgOnHYKsfHKmBYvE1jnO0i7DmvKKTJZKMlAEYDwH+75OkUGZEl7MBt3PNa2Td11pgoa3fIxadtgbPlqYn3Shwcdbc2RvjB9s/H3JaNOxPwveKUToanAbJqkiOVCBMc2FJbQdSuuruS6uyfxdeFYhbP1JESzctfUyzBLN228aDp66cQiLrPAqKj5gsteVIqUK6hcxIWem7fXUf4DDBlkEksWYR6vWyjZ41rJj5aTo24XB2gDkIsGkf1ZZwJ4f7tOCyLUQ2s0lLGFxNuKZt9EXyLU3l5vXXYBPahvpC5M5qXAEInyrAaR/uFvknz7y/TKEjKuyltsFzchX+VraQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWK3xepJFq0J6rPlqTSNHwfdKnIZr46mFpeDsW/kicI=;
 b=T6k5FmLI5ihAQ5HpklqmQdwk/waH9grfLUzVwQcvLsUS/CUkbDTtIyphlBpaMHSTSpKvXBUv7dLONV6pfR1LZISglPu3+o5OQvSMVJ3R/JwBfLM5WslCdKgwzEPL7WqvsMBvwUmBiev5pC1+FuoEY3NBqFBa5bAkOEvLZDytX7Q=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB7591.eurprd04.prod.outlook.com (2603:10a6:20b:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Mon, 22 Feb
 2021 19:08:07 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 19:08:06 +0000
From:   Mirela Rabulea <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com
Subject: [PATCH v8 0/9] Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
Date:   Mon, 22 Feb 2021 21:07:29 +0200
Message-Id: <20210222190738.2346378-1-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.124.171.30]
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.124.171.30) by FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 19:08:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 99cf3121-f41c-4528-76b1-08d8d7652fc1
X-MS-TrafficTypeDiagnostic: AS8PR04MB7591:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB75918054F1FB2670F04DADBCCE819@AS8PR04MB7591.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gEljKjOzIciQKfrDLBYb+VIf2tSgooBjFMASnhn1jRRfq0LDK3PKq74ZZwfQ6J1VaeBC+5SxpR/aMKyrdy3ORCpgt9FS1qZ114Ib/tnTPpZu1+zrahyK5caZWshgha1nn/84Le/rroubJkG3Cm3x/VCqGpssX5l0jTH52GzT42On3OtTsFVb4Qoh+lWyarQSkNkuCE4lri82HAcNHx6T1yx+CAPWAaliDqPcyXd4bM4+NsNa54mxmC8Hj1Q3MkFIMpKY3GWOVpRzUYIWoJ1efYJ+SyV36uBVvYLgIlTj1DtZvABnaSL+8QXbQbm0IxOK/fAX9I0mhQDTCRlGjR4ceQ2NCE3SmxEF68kVaTNrMwV8vKeSGvkzKX3FiLtNEDkkVTlL2NO3ZfLWfBXchgo2qLmkB89glzTiz+ph8J5yJM7bo90ciMYJRd0vxeQBtByL3hLOS86NwClZxB5FQuOyworUS5w82np7VV4Y22P6th+Oas5GE8EY+jA3lATwK+YWzZuJj4I5v6b4bjjkM20On5eMFbLJStraPUUVcPXN1hldoB6FXLccRbLXlEjIoXq6JFR1Y/+8zdKxdYxgBO7xJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(316002)(6666004)(2906002)(83380400001)(956004)(2616005)(52116002)(8936002)(186003)(69590400012)(1076003)(66476007)(6506007)(86362001)(44832011)(66946007)(5660300002)(478600001)(66556008)(6512007)(6486002)(7416002)(4326008)(16526019)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2kBjbsGepNjsiHsSH8s3lNeN8JyjaG75XpMJozNw9tAkiqVnJ1ZKW1OjW5Z7?=
 =?us-ascii?Q?hHu5OTa4YGhI4YraYi9i+GIeZUcGcVm/kF2D2WsmHAjL9uWmbkFiw+394LJw?=
 =?us-ascii?Q?lPGC0JMfTM0fl7FaYujaW+0OHRmTRFFSAtkeytwKqreFEofxtWuka306sXnF?=
 =?us-ascii?Q?oF2SbDvgsyQk3iiDs0nEFp1l2vrsOtgppSQXPsVspZjO7zwb2GOEBb0T72Of?=
 =?us-ascii?Q?YHH1kcrbxJAEKA8veKTOthiMcrnop+mT2rrW6dt/pI/GD1zft8Yy1A+z6DQE?=
 =?us-ascii?Q?t4UbWk4CFlVY19vkXupDPLy7eeXIEJXcZEBfXe7IRA9ciG/573eQix3vcAF2?=
 =?us-ascii?Q?/RsQ/pJ2R9/viqklbtWWb3mqAYLZOXDBO8JRTiio2acQgA4xj69YCzZJR458?=
 =?us-ascii?Q?00/ggFDSUejLofbf+Avm+TubbiwbqooZi+kFxPBuuwOV0cXfhSJlADJvcgVG?=
 =?us-ascii?Q?6gEBXfQ7Heq6y2SowfzaU09uTleWO2X9po4WNPg5+NX6Q/wPheB/cBR67M7C?=
 =?us-ascii?Q?OyEOfgjiPabrry4ClpoybaWjHXHLR2RFkTVNIqn9immsgvzaDYdA/r7dg5EC?=
 =?us-ascii?Q?V1U534tTmqUjqOYNpkTebEaw311SpF0bgndivVaQ8Tdf09RLi9bRzjq0HZ2Q?=
 =?us-ascii?Q?cisQW6i2IT2lf2snpMgjUucIGVTsKPDHCUUvf4V3JLUk2ZiGuIEiAKNj0n4v?=
 =?us-ascii?Q?i/ZRYEa3w5Ay5cML91V6kxBDMqG2GiXaJoHmVTcjgutb2YqtTDilhYeZzpmb?=
 =?us-ascii?Q?lLnLCqF1/J+IuKAG0iUjFIrwhjRCOrq2ZYc7I2IQgvA5+04t4dJXBLs2hsXp?=
 =?us-ascii?Q?4rOPb1DH99FHNCdEzMHW8hghWRX8oIxSpqCf9aYp4aIgBT+SRyxe+h4/6yY7?=
 =?us-ascii?Q?JtbtwIVsCxz3406jATMr0o3gH38WEF1I9cbJIGIp6dRwjLK8KPk506fAZn/i?=
 =?us-ascii?Q?CTlBFQUtq/nerRPKJEOSVxxCqdkAWvGDPkXQJmil2Q/DxNooFdw20EMoRvPW?=
 =?us-ascii?Q?9F35omxzTJVou8FSkXgA54ZcWTHgXH+U1MiHzMCIvIoHnsznQ6dY4HO6qTHb?=
 =?us-ascii?Q?+6QlE84ZLoLAxTybZnNz9omwKr5C8PP81wg8OpbK6o+XdJuk93Ll1v2YrwIe?=
 =?us-ascii?Q?auoFnmY4/2jasSeVX7XTFqM8/IN1uMOG8aH37E7IOz1b8uJ3xfpcNSQ0djeQ?=
 =?us-ascii?Q?yVOq5suv3dBF5ga5y/qU+mELSEwWlbv04mUTrh146bwUQSP9HFAfUXLYhM2I?=
 =?us-ascii?Q?9KvYXfO9KKlS60OFROMD4kh4WkeNJH7QqXg7wvF0VbentDi9jJxJimXlOus4?=
 =?us-ascii?Q?MPKon+AluEg4/MnmzQCBZExM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cf3121-f41c-4528-76b1-08d8d7652fc1
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 19:08:06.8020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvYut1SYtnDtroea8RwXkLcQIJTUV+qww3gXvjrcUOCMkgm+tANzcyFe5KyawsXVqJfoVA+VDifBrcxkaEVC7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7591
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch set adds the V4L2 driver for i.MX8QXP/QM JPEG encoder/decoder
and it's dependencies.
The driver was tested on i.MX8QXP, using a unit test application and
the v4l2-compliance tool, including the  streaming tests for decoder & encoder.

The output of latest v4l2-compliance on i.MX8QXP, decoder & encoder:

root@imx8qxpc0mek:/unit_tests/JPEG# ./v4l2-compliance -d /dev/video0 -s
v4l2-compliance 1.21.0-4707, 64 bits, 64-bit time_t
v4l2-compliance SHA: bf8d28efe5a3 2021-02-17 14:52:38

Compliance test for mxc-jpeg codec device /dev/video0:

Driver Info:
	Driver name      : mxc-jpeg codec
	Card type        : mxc-jpeg codec
	Bus info         : platform:58400000.jpegdec
	Driver version   : 1291.0.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected JPEG Decoder

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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (no poll): OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for mxc-jpeg codec device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0

root@imx8qxpc0mek:/unit_tests/JPEG# ./v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.21.0-4707, 64 bits, 64-bit time_t
v4l2-compliance SHA: bf8d28efe5a3 2021-02-17 14:52:38

Compliance test for mxc-jpeg codec device /dev/video1:

Driver Info:
	Driver name      : mxc-jpeg codec
	Card type        : mxc-jpeg codec
	Bus info         : platform:58450000.jpegenc
	Driver version   : 1291.0.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected JPEG Encoder

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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
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

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (no poll): OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 58 buffers    
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for mxc-jpeg codec device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0


Mirela Rabulea (9):
  media: v4l: Add packed YUV444 24bpp pixel format
  media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
  media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
  arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
  Add maintainer for IMX jpeg v4l2 driver
  media: Add parsing for APP14 data segment in jpeg helpers
  media: Quit parsing stream if doesn't start with SOI
  media: Avoid parsing quantization and huffman tables
  media: imx-jpeg: Use v4l2 jpeg helpers in mxc-jpeg

 .../bindings/media/nxp,imx8-jpeg.yaml         |   84 +
 .../media/v4l/pixfmt-packed-yuv.rst           |   10 +
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   35 +
 drivers/media/platform/Kconfig                |    2 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/imx-jpeg/Kconfig       |   11 +
 drivers/media/platform/imx-jpeg/Makefile      |    3 +
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c |  168 ++
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h |  140 ++
 drivers/media/platform/imx-jpeg/mxc-jpeg.c    | 2117 +++++++++++++++++
 drivers/media/platform/imx-jpeg/mxc-jpeg.h    |  180 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 drivers/media/v4l2-core/v4l2-jpeg.c           |   59 +-
 include/media/v4l2-jpeg.h                     |   20 +
 include/uapi/linux/videodev2.h                |    1 +
 16 files changed, 2833 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
 create mode 100644 drivers/media/platform/imx-jpeg/Makefile
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h

-- 
2.25.1

