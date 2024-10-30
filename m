Return-Path: <linux-media+bounces-20546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47DC9B59D8
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 03:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABC751C226A8
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 02:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D157194151;
	Wed, 30 Oct 2024 02:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Uexeexv2"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013057.outbound.protection.outlook.com [52.101.67.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C39D2E419;
	Wed, 30 Oct 2024 02:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730254932; cv=fail; b=sd3NhYdOsFxBs5S0K4rKfwHQJU6cUSxHFZp0S03KP/guRFvnxd2U5hPoLIlukUB0cs+OIIANja5aBy5J3c5VJIPxcnbnGoOrQleU1rA6U1ZQGVYKrWkUYj3vaqVmECvSqGHgs70V2kWLu1ldI0f0wduhL4kWiDYrNu8pJQ6q94k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730254932; c=relaxed/simple;
	bh=Vh5NZNR4KsG0on1NUEdDKfNJjeZ7NeV7raAwx5BEeGg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZQWB35yr/QQKgn8Im4+9Em+iVY4PJKavrciVe2vi1sSlBmcOwGAVSMphyD0HkOxVu2SvHpP5zM/sWppovrydyBuYteAZUKqEIDNOF8Kn0j47oysebS3Pm3cAA5kwg7t0Pne1axyIcuZLt4k/HXQmdvYvtay+i/qduNgB0bd3vZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Uexeexv2; arc=fail smtp.client-ip=52.101.67.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QL9FhAq0TTV87orqL9XCuZ5YxDAU+12l2/3zBYh645btSWbE7xdC/DSQcmKI3V4hCnbztRfS7rOR7bWHYynGi/REL43XrMbOhY9+pZzMJYZDpPzcyUrZIuN0xkjMQrHowwSxa2jOlF1MAnuWz+E9fGfGvOQ6jSqrVSTCIrVH+UEXCN7FgCC6EE2/Wi6+Ab1+ap6+P2Zod2q03+cidDqS0zi1HuZUiwLh89AivhcuocyfQknu5zNLDN7PzzaMqNw92Hhtv1kVz2BN25bILtzRrnfKV686kzJI1Czjv6X07gU9sLixwRl/rgWgxK2zCKBY123nxcMFql5lxlqJtsp3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NywOzyWhl+WBR6COjP4QMA6p9eMbacoO81pyCbC01I=;
 b=gJHc5Lff+DYqZu21KwqGKKXnVqxORXgwe++X7/QWUcEeYETwVOzptjXPts6kOYf6qNs7w6WNlvSI5eeqFXAgnmsJHN5SCCvV0UtPWNQs6kvqtp5XJBuW/swO9E6fyjlUnSaZT9oNBw9DoP40xkkIB+mHWCWjQIkGPyg2POYDLqsIPTBfcdsoopdK9uJ7QY46hnEJ15e7bCAIHHYaQdXqbcuxd9Q9qINnEvL1k9HEqXjnVMD5BvN0gkvNOX4GKtIGEaIA+BtUFD4hC3rW+PyB2ZwJsVdkFf+SFk81lb1hmjVwEhdfeZOp6LfqlXEVcjwznuicXPhmjC03yI/Mn6gycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NywOzyWhl+WBR6COjP4QMA6p9eMbacoO81pyCbC01I=;
 b=Uexeexv2P9t0rnEHB1LlKFqevYhxf4LvpbI4mLsTKoMVf6SAx+9b5cf95pzV1KAQ5aZJDWBfeoiJ2WpKAZrGmd9D3He9AvbSelMqTHFCgI05ohrG7FOwHwhgLPGdZNIYiouqh5Wm+obpYxpH2WAzPtU8jqysxVqq2kLTrCLpJIo6yT9p1n80abORn+YDqT0BbHH8NaZzRntEMpIH8IKmRaEMKX18ZW2HkyRcH0458S2mXCp/NhwvAQH2hGr3Pg7C0mIURhjR7WyYOyVKsJErqPYIT4voqJvPUVr3cjfbvQhEE1g9smfmBuXeMqCC0bE3N7bO2vQ41mXZa7HJaTWENA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB8705.eurprd04.prod.outlook.com (2603:10a6:20b:428::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 02:22:07 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 02:22:06 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v4 0/4] Add video encoder ROI ctrls
Date: Wed, 30 Oct 2024 11:21:30 +0900
Message-ID: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: e4918126-7eec-4a7e-a28d-08dcf889a678
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hihcTZjnkeA/wkrO0TASmN8rYQTQkeW7GSVCrYji3MfrPZs9XZ9vlzEFlAcH?=
 =?us-ascii?Q?dh4JQ5D0pKhND8A8b8gEJOIWq/guMmk1Ms7HoWwRpv1RihE3JQSb/oTirkDp?=
 =?us-ascii?Q?TBafOPeYywANPC4E9KG97klrT5qXWd9RJ5rwye6MIk5IsUN3oD9WFirvpO+I?=
 =?us-ascii?Q?MWmDtxRv93tl+/F6EwqQnW4KSBeAPrU5X1ECKCorpZ3zGRRQT600b+Te6I1O?=
 =?us-ascii?Q?tZ+UxKhysd4IOY5FnZnyWI0yBJWVRIre/HdgX57JdiLVDQWI16XjDHOQg3nq?=
 =?us-ascii?Q?4fHpUFrlUmSUt9+HRgrREU+A2diynJjOzu0izXl49/KKW4iXd97tz0VEaQcj?=
 =?us-ascii?Q?WBtuo1YD4JPwhWOLcoKaRb5Kd4uHkfDPVTKk/wAQiatSRQ2cBA5MPDFtOCYS?=
 =?us-ascii?Q?xFTXCljm3QayO6kCLcBkLQB1UquUS+u7jW14oW5aAzXuWsg/fqXH4gfrTe4e?=
 =?us-ascii?Q?5FHK+h5b/gG/qH+z0tS9AHx33nBRZQn6TMcMlpSn8RSYsaYdutWHmonSmBkH?=
 =?us-ascii?Q?ZvR6QJYCfyycVtdJH9Rm0Q8AFofol6RfTabsW1BCzyGa/5rs9m+06M/zDMls?=
 =?us-ascii?Q?tbhtpM46xmIBU4SS6j5oE9JecIBF3k2O3c58AaJQW+lhhBmY7EP7G09gKHpY?=
 =?us-ascii?Q?ntf02je7aYBlkzb+AT7XsMzTDcii2SbKrR07lJxMjsCPJr34fZUP/3SCffsi?=
 =?us-ascii?Q?/6a+cGkqsXSed6XoYlxXyUO7gvG1dipLq3Ve1bbSNRMGSOLwT1qolYfzQ1f6?=
 =?us-ascii?Q?5ft+IgLH9JQERAHqWqlUnfoTV+yLbaFG/94Ner7W/VWB01+JZa0vvWAJn3OB?=
 =?us-ascii?Q?vL7L/byPiS/A5/4EDMnH97wE4V4jdn+74Y+/UkpPDxmBUor6c4cFEQT9Zv+2?=
 =?us-ascii?Q?nZh3w5OCfCzJRv/+X+VqpkIFpo21bp+R3X+xZkK/sevUPn4uOGMpOYndNpxu?=
 =?us-ascii?Q?q0I/scS/A/AzjX4NtJ+IZNVsFnAmIW0CGIAk9JKHKPIGxU1DJi/e4npu5PFA?=
 =?us-ascii?Q?Ck44CCakQ0xS8WK49f+P1JcoP85rq3bIjxC5ejecjUKIUfEmBm+ROpS9fbss?=
 =?us-ascii?Q?IvyZuhUWECe9aZpD7i6Oj+W8U6VvbRK8YQ4NrCEM9Yd+AiStCkDAWo9nMAHi?=
 =?us-ascii?Q?VSL9+KT+dS8/MhB7kHvA7UevXPlseJ4RhSlr9JndCSVr3sdfHuBLD737dgAe?=
 =?us-ascii?Q?d70hHw/EkH0dALYoaAX+HTlbmzom2M+7GZrjT6unOt9MTTi11t+yCvIW/PmA?=
 =?us-ascii?Q?VPgRIQCq3/JW400Aw0Cvxxw92mqfshVJXdeBm2/Z60BN46G22m1UTSQt8hz3?=
 =?us-ascii?Q?6ynT/nS1+wVKOnLkgHqA8Jv56Qil/NNnlMJZJOgY1Gg/Pod0SOfDkZP+ZJN4?=
 =?us-ascii?Q?rpesregcFwlyE2P90n3S8ZCEaQAO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?grQ8GU0bwV8L4tX+kcVBOf/ceDupnMROvPRUs/8wox6Li2l7us2muBg35luk?=
 =?us-ascii?Q?eAR45pF1xT/0pNHEPuuJHyQ7VcbrVtCMKR9q1peP8dE97UCL0H1HIPuo/dcl?=
 =?us-ascii?Q?4UrxFOKy+3MFDCxouzVvcuU91l1ujJRBopNKA/FOnhC0XvR3IYlmzV2Wflub?=
 =?us-ascii?Q?yU2LwIAKAgQHhwXRiJGIa/6UspNuQFrrNUazaksnX0CtVnbl2RaJwLMOoG7b?=
 =?us-ascii?Q?D94YVUI2RJBtTPKv/8ZWR4RYcwH5nouwEWyxiu+1U1Yrqbz75+RJtYcr8MET?=
 =?us-ascii?Q?1F7lOQMlN8oUK0ueujXew+PqeKHTiM7fArH9MBzMYBLasOQB2GOhXEaL0UUt?=
 =?us-ascii?Q?Jbv9QGkX5aaAUuT6hC/cjAvAc7nIpwN4Vz81Uf1do+2Dik0BEnHSUh+3Xgis?=
 =?us-ascii?Q?xWlwnl2kSSUZwQmEMTn6b+xjx/tRBOa0mLjLAAnn8Ni+QUEgTrAyf4soJWq3?=
 =?us-ascii?Q?HenQMU307YZXzICYzQ6d9YvSqulf++/3N4T2dGeR1GRmgQAHXFGFle3IiMDa?=
 =?us-ascii?Q?WtcjJ7gzRCXcw2Y/mHkP6IiDutXM7kwmZ0ZqL6NPJ+BOiTC56Yl91s5oQsPt?=
 =?us-ascii?Q?sukYEbwAFgnDrhvWpWpKakx97XBfxtLIg1jBIwrPbY1psB3NrBHsZoWLyUIz?=
 =?us-ascii?Q?ApTZ0SRMZFQllucG1jS4M6s2BsBr8brET90us++4JTaTaAJHR8i77CnfPDWY?=
 =?us-ascii?Q?hIhptD0YyGKNliiJE8xuPX8FF+IVttYMKmUVRTulpV7iMdWet96BlUTtfKPb?=
 =?us-ascii?Q?/xGmN0Ja/mpFRq25dfYmI3qJXZJPolSCa+stc6DygOH4SNG2HHqGcWltu9tp?=
 =?us-ascii?Q?Mu5WosNE6V3y6qvxy7Tjnr8NDqf9lysRI869/eyRNohOyCTiHYzGqiyhYPz3?=
 =?us-ascii?Q?qZLnwfnXbdt+T8kcV5DxbB28WYdDrLeRdsvReuYYry4uuIqE2CzIpEF2SE0J?=
 =?us-ascii?Q?iZlBi+sqHG5tPXfyoaEM4diY7EGt5Md99vTOrpzAf9QcSMao4CNrG/c5I7ds?=
 =?us-ascii?Q?GandxibYJkPhVAz2y7cc4yHC9+cS2SObYKtGBhtfN6ciMRwA+cR+NSnyMBu9?=
 =?us-ascii?Q?B8PwIkj1ivkMimq0+ajMcOjn4jMrkdiQT3mLEuISbEq+5iSEec3p/24BKLIy?=
 =?us-ascii?Q?eSpeXqN18TeuXn/HyKmd+RmNuRjXuB+GFy2bEtMSgVpaq+tjjzsyaSpYn2/u?=
 =?us-ascii?Q?wdZzOoQQw2cEgytaM/Vc2kWp8YqSCrDBNJPPC45eFS57DB/mikWYtQFnRQ4i?=
 =?us-ascii?Q?+0rEPncbSk6fiou32ByunYc7aSS2kw3hZ3za099nVpApkg8+gj6WqG8Ij9nH?=
 =?us-ascii?Q?BeW/wvH9vEnCzNE/6o4KCP0vdJrnx3u+Wf+JUAkmqBgdrHuWxT1oWyMA3/RQ?=
 =?us-ascii?Q?gjfk8ER6vI3GiJyU5LY37W5kc+5Eh2l+jmHCdgsvs962bs+pzO0PBCC4dfNO?=
 =?us-ascii?Q?rugw/ODXqbqlbwIvjYbLgnaKp/SXPmRmHDIU0LWpsoPNSOMogdz7rKvNDFDg?=
 =?us-ascii?Q?61p6ylp0CZ9MVaOwpwMQg20Yv3JVQj8U4z2/EOplibI9zJOz4Sn1yofWi+t3?=
 =?us-ascii?Q?uPZGbyFVp5YrU2sYMUPqZhhW49slopB3N3J/qhcV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4918126-7eec-4a7e-a28d-08dcf889a678
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 02:22:06.8864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wC29rtb9QO7C3AGfhGNjgu5IsB78R+r/H+OpR/tHBTF8XuD7fGxEZUwMFHvW7qWqVhb/KoDShBZ2gFEBr6puqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8705

From: Ming Qian <ming.qian@oss.nxp.com>

Hi,

This patch set implements region of interest (ROI) ctrls for video
encoder.

One video encoder IP may support the following two ROI configurations or
one of them:
    1. configure ROI as a rectangular region, and set a delta QP parameter.
    2. configure ROI as a rectangular region, and set a priority parameter.
    3. configure ROI as a QP map as an array. Each value represents the delta QP
of a block in raster scan order. The block size is determined by
the specific IP.
    4. configure ROI as a QP map as an array. Each value represents the absolute QP
of a block in raster scan order. The block size is determined by
the specific IP.

To achieve this, I made the following change:
    1. I reuse the type V4L2_CTRL_TYPE_RECT that is defined in the UVC ROI patchset
    2. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_MODE to choose ROI configuration
    3. Define some ctrl to configure ROI
    4. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE to query block size

I referred the patchset "Implement UVC v1.5 ROI" (https://lwn.net/Articles/953532/)
and pick some patches from it.

changelog:

v4
- Improve description in documentation as Hans's comments

v3
- Drop the type V4L2_CTRL_TYPE_REGION
- Split the compound control into 2 ctrls
- Define 4 ROI mode

v2
- export symbol of v4l2_ctrl_type_op_minimum
- export symbol of v4l2_ctrl_type_op_maximum

Hans Verkuil (1):
  media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

Ming Qian (1):
  media: v4l2-ctrls: Add video encoder ROI ctrls

Yunke Cao (2):
  media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
  media: vivid: Add an rectangle control

 .../media/v4l/ext-ctrls-codec.rst             | 131 ++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  26 ++-
 .../media/v4l/vidioc-queryctrl.rst            |  14 ++
 .../media/videodev2.h.rst.exceptions          |   4 +
 drivers/media/i2c/imx214.c                    |   4 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 .../media/test-drivers/vivid/vivid-ctrls.c    |  34 ++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 ++++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 169 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  46 +++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  62 ++++++-
 include/uapi/linux/v4l2-controls.h            |  16 ++
 include/uapi/linux/videodev2.h                |   5 +
 14 files changed, 529 insertions(+), 49 deletions(-)

-- 
2.43.0-rc1


