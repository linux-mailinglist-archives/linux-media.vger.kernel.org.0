Return-Path: <linux-media+bounces-19782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E79A1E1A
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 11:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 510EA1C21C25
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 09:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725831D8DE4;
	Thu, 17 Oct 2024 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kSQZvu/B"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F41D88C1;
	Thu, 17 Oct 2024 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156832; cv=fail; b=Ixpf/2/AHF+eSY90Og0W+h+xfNoruv/YdET0YiRfjdm2lzZulrgz9DQvMgKMhB1MlzxqObOfAkvTsDwLiIYKpXdnFh/xB7eUfLJTpaTNlefqOo5qDuG8wltRfE6KBuinmPMsUZtRIOExC8qT3JlbHgHtylxoUT8EgYz/GpPiI9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156832; c=relaxed/simple;
	bh=OwHg3/UZCzgbyyiaAKK3bqe5pwBMN5g48UyN5wOBBeg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=M0NZ4jvy0Xl0HFYH9KRuz/yYIhL1r/ubL08AhtY1GfAhhnb1+n6IXoWsLgQEbRq0fVJO6sqi/WZhjTmfwMgsHT8sWm8HzWDV/fy9x5DH2a66FR12Am5CAw6jCPXcLJWXVQmcZfXyo3cZZnXHOzHS8WPayQmaEzhuADugq5nfnFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kSQZvu/B; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxzksVtiCS3JTt3r/hDRi3VN729uHDc2LHAB2EfrsFooKd0Kl2QD2wCVtwpwVlx6HY26UdJz8zkdYdr5Qzh3lRzIBZYwZs7/ChY7DxxZ6TOKVEHxR6nOyKgXO7o6z6Cist6EjrKCFdnDUET/75ZnvEpvHCocqh/hCJe7ZA/3WPsx88sQqbOkxSlStlx/FyESQbxV3pMz7UbSCYcP6F7lLPaMB9TepBjGNxksZY8ySaYKZQ3EbNllQvLNmuFSJiU3aRY8EFMdl/0f9u9i8eEVqlgaFbbb/kD3j6hmsu11KEL6dz+uhaM6zrpl43EOxQsSm9VyRjaLuhi2y7p+d6LDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmkZgoAx9zA747yjfUmc/dHmMnNEttNF5njw/2ggEts=;
 b=i7OY2lCi8SRTao9zI2sfoyKef7QD0KreBxSyEmd+Ml72rmxPwZDGNYciTnes5WnZQCsyJTB6Xn6MmsQqYOky0W1PAcxJjQxNEJg5wzu+YIwVmxfqvW1tUhIOBP4b8vTnkvQnzX+4lpC2x124P97X1on7RWtiEuda7ynXVnigkkNVuG3NIS0Jkjyb9dVwJh8y6dZl8Wof6t2/ONfR5nbSBUFAVgH5sOZ1r8zI2Q7vYjZxydTPdS8FrB7gNNxa5hAiZ6ciDuq1QSNu7+tkTU/sk4840uU1dmUqq8+k/4P5NJAuR3KToDfN3AW05v03Qp+6tysJX5BRjp7IZcaw+6P9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmkZgoAx9zA747yjfUmc/dHmMnNEttNF5njw/2ggEts=;
 b=kSQZvu/Bm2s1sn8YMQlzT/r5dQwsWkboCwOOPapRU2tEQcHyovUPEe7BSQHWlssP7Mo2q/PLPvgu6yxBIoQX+86LN8j0CVWZz0qqGJcTgdgZmU0YdgRxJIxUiU3rH6+N9IefaLSjSFVN4ZC480Q70JMbtvGNhhk/XexOBeuov/KLf1VurSlaxZjlKCg1C4L8DxT2jk5bVp3+qbVlkOBIroTNTA4i0h9axFyRW0QdTQX9ZOI2p2CjZyGQ5YNpP5Er/9ic+3D4nP3qZX6hNim5FKAC26Z8t87+I3h/mkelSt3z8G7221+ToTczAOcXW14FjUtczbjnDA17PH+ryLNMtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB9061.eurprd04.prod.outlook.com (2603:10a6:20b:444::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 09:20:26 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 09:20:26 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC 0/6] Add video encoder ROI ctrls
Date: Thu, 17 Oct 2024 18:19:45 +0900
Message-ID: <20241017091951.2160314-1-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: f46d1043-aca3-4196-5770-08dcee8cef48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VfZqhDBjZMgn2hQ8/z4L7zCHION0LmTFvxcVPe7w82dGu8w5397rp5U4iKix?=
 =?us-ascii?Q?ExtvTMeB5/brMDNPnxIIdlORl/rn5wkb8hgTobJvBG5jTXXs1IxyGo3A3ICA?=
 =?us-ascii?Q?qGLZ6VIM5el9KSOzsIOHqRw9OyCl6QAMxqADt0iYUoomS1YPbn76DD0A817a?=
 =?us-ascii?Q?STRgH1jUyysdgbUxA80YcUJMk7koD5VcV3RnWTYnA72AbfAfeWRifTe7Y9n/?=
 =?us-ascii?Q?50DjXHg9TuSqeA1PeMNvpRDm6hlf/3C6TskRLoydvlTtWuSSu6zHJ9CIPYWn?=
 =?us-ascii?Q?Ts0LIyF16I8FHr/cLeBz2z1IWSozwjhzAp285WTZoEzpijCDc4IipxatzbdH?=
 =?us-ascii?Q?BqKdqohb3DLWH6OUwNuBU0wBl3/RvxR+q5dLIcGmvYCtbBQ5gDXwET/KV5bG?=
 =?us-ascii?Q?2jdvoS6VDn46ovyIOpt1QWeLTLwOQPPqOb4x30a9qNhITUwp35aCcjVug9+H?=
 =?us-ascii?Q?g7sFvtzMMuLsA3KIbYDpFZAP1hvzvDrDhN0ryHBptVMjBIb0v1ZvSVefdlSf?=
 =?us-ascii?Q?dm953Z+VE3UYE5HhV1rGpT+FheCKJ+tLP+dGKP9qx4p9oOHdIo4hNLb5FKqq?=
 =?us-ascii?Q?IepW6ySWghfcD2n4TO9D3uG6w7wfBA8mNrTNaW+fZf0epJ7kCuVEREU6d7h+?=
 =?us-ascii?Q?+WdcyifG1hDNmDMYfKAjX8uTi4GKcLm5tDixJnRtshu0RcLqVbx2j4w2m8b2?=
 =?us-ascii?Q?DRbu2YVYadeB5s1nGXITDO3RFLbozUAZZGvEKVkaOiojqg5Y/zycHhDR7Fs5?=
 =?us-ascii?Q?5XYcUlFngrNOs07zgYKmEdAXFY9/P08N4H0mk05toB6Xnxv4aOolAZR5EseP?=
 =?us-ascii?Q?8xy7LTk69+sqbe7Wsek/bMob9WXKz9nhvhFgslsEAW9SmX4zvMgAixxYtn5I?=
 =?us-ascii?Q?vgJuBLBH6VrS5Pd27XxNiA3UB+vfRkC0VbxyD0B4Fe8yjQjr5khhh/bR6sF6?=
 =?us-ascii?Q?0vnmy6/mgpFhxSaDRqD2ww3H1DXhYDdjDMB9W8pRLBBTRYHREtRD4dXxpYXN?=
 =?us-ascii?Q?b7IU69E4uwH8O8gBJVCRzhaSH1M0HwWPLnTHldNPsXs/uZQ56KGrlaCigf3g?=
 =?us-ascii?Q?sMhWSWcVIrP6q7mLAnHnvsV0Z6324kBQEPQMOtTPCha1NuzHRMkKVeWxuux6?=
 =?us-ascii?Q?5TcrQyW/ieA2HEziPOn9+JI2PxEARnZykJwc5v6OqhD7mX9hShUbJuRmMqNY?=
 =?us-ascii?Q?3JpWOqRAO6vQ5Ln4NrfAFG9DnPVKfZQk5q8bJ3I/BGhPqj6P9KarJNORUqdm?=
 =?us-ascii?Q?FagKf9i1YewnYnUv2fwUXEFCnk/EnjlIUV3ac/BPle6oEe/CQ3tLk4DMEzOh?=
 =?us-ascii?Q?B/K4t/5E8MFtPTAJ96HgPXBBIavLHzb0KBZA04NZSABnx4ZnziCBWduXi9dj?=
 =?us-ascii?Q?rHCG19H9Z1hisfwNWY0FlGHpfAP2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fdN3reFMHEaBZuUpADR2tzHB+2FaUW8qPLPBlXVzb984wWPDdMg4OOjgEv9A?=
 =?us-ascii?Q?aBvN3EvUZpEuXOov0G4dSOXrJt0WyZ+24oXVPeRsnKAqgQ3usnGOP+Kak5e4?=
 =?us-ascii?Q?LbEoLvsJfFpt5wMDQEsR5X1wDdS+/QXkWOD/0PsnG1c8IlbzxXHfd0pXLcYg?=
 =?us-ascii?Q?oXvblUCat+na/dnud6EFXutUB6qmcpBSzk8BZar6tk00x+pEabFiyFCAAtxW?=
 =?us-ascii?Q?neoTBTYcvvagwAMUYsoka52q9k25VJ5KoM1Z9+lxWmNkAsF1JmhcJcZ+gtqM?=
 =?us-ascii?Q?v4lONT4Ed5dBPIfJXxJvoN2QCtMjXUiOWs98gl+gq8+zD6RFF9vUox6Ttn8t?=
 =?us-ascii?Q?A5WoQQINwblYwjTwwIeWBJnd6R0Jr3izk0rHhuq6mK0fwLtZVCPWWavAKJuu?=
 =?us-ascii?Q?7AcL5o64AxJXrozP/JHp6dwTV5gXG9aLcExPlI2dXYQCRVp9A7kiw++v7O8b?=
 =?us-ascii?Q?DArj8puOUGPp5+MAxInnjVDEHTV62if8pDGs7yfCqo0VamVUBGFUOCSUYom7?=
 =?us-ascii?Q?xnIq/p7CHCxaKFdw51uVsZCOgTaCcVua7GYk+Pzsi7SGNhgPjYXoKQCpkKn2?=
 =?us-ascii?Q?S88pQ7MlY7j47HqvzXsS9YYPfKLvgSCskCC9N2qofodOEpcPeE5S+5wUf+Ez?=
 =?us-ascii?Q?FdPz0LvCFWDklWB8DjT00TW3lZx0bJqDSAxCtfOEDIowFcUXb5YF4uM3JyRP?=
 =?us-ascii?Q?i/AJ16a6dL0NwhQDEqzSyE4fb7BXNICTh+OzGjBgS27ITNDkoHDAtfBWAv5z?=
 =?us-ascii?Q?JrU2WZshceypNJc5WfeJ7xyQ9/69Hthlto98YkcweR5iC1YdoNfnQQttyEjL?=
 =?us-ascii?Q?2gJU5BlJJgJ8cGrb49ifr3+WSjTW5HE263MYUM9+8EtFxQPrzBqufMcmYLl9?=
 =?us-ascii?Q?YVdxG/34CKnV6Gd/e8Q1GZ61KxAFLhvdSW2xNnvXjjn3DWyyT3SMsn5qy1us?=
 =?us-ascii?Q?QevZIkQ9KwLY7JvEeVtXvD8GmKtOOV5JY53KrVuCmqvEbj9CxIGABFF9gUZv?=
 =?us-ascii?Q?YFdGwAiziC3YPYJCb8JSg7KsD7I0F299TCS983lGAQUKZZkTaycxR3ZGdbu6?=
 =?us-ascii?Q?1Fflw+Z4B6gngmvkFsoFFZzGJg08VXMmhpdbixN9Fbmm9SLk8pqunNG7wJlz?=
 =?us-ascii?Q?dcNys3v9hD9iN5sHZiiSIZbAbXnr9p2BNwCPtBSAJWC+KodnBSvr75z4x/h3?=
 =?us-ascii?Q?ht1sVczyQyCZEUbN6ggeiQgmw3nHj4spN1BAKtcKQiPJ7sOmDDdWvxhDEp1k?=
 =?us-ascii?Q?tz0OpBmvWHjoDcKk9ArRHjVbrm7aKc+Z4CHWoRuw7ynAWTjaO0Sab/iAfxzW?=
 =?us-ascii?Q?HRQcXkbJ7n/SnXjb7MRTEhsyBAHEzpZNdStw16p6sZtuALpKT9p/ePlRcfFT?=
 =?us-ascii?Q?Q0CxzlKSraYM1SmKWw2fhd6dAeFD41lSoZpb13U1fww+dxP69Y9TAWn7Y8+a?=
 =?us-ascii?Q?DOdueNQjV/1vDUojDSBCnHoF+BcOvi9q2oEy/Tja7vaMdRhMtJ0FyIPhcFXn?=
 =?us-ascii?Q?H+JfK8Ir8ol8EoUQzsUknTatHxye318LMNDOrgEap2k6Cw0UL0zPqfxImAkz?=
 =?us-ascii?Q?0aodLO2oOnqGw9ZDQBo5BrLzS35S9Zf8bbkJeoiC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46d1043-aca3-4196-5770-08dcee8cef48
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 09:20:25.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkX6OQgUhLHbMnJ2A95AzVY8R85fbjS0AaET2a7HQbKEzh6UVY0b1IGN0Xq9i4WFjes3lv8pn/g+N/DA0ybabg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9061

Hi,
This patch set implements region of interest (ROI) ctrls for video
encoder.

One video encoder IP may support the following two ROI configurations or
one of them:
    1. configure ROI as a rectangular region, and set a QP offset parameter.
    2. configure ROI as a QP map as an array. Each value represents the QP
offset of a block in raster scan order. The block size is determined by
the specific IP.

To achieve this, I made the following change:
    1. Add a new ctrl type V4L2_CTRL_TYPE_REGION to describe rectangular ROI
    2. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_MODE to choose ROI
configuration
    3. Define 2 ctrl to configure ROI
    4. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE to query block
size

I referred the patchset "Implement UVC v1.5 ROI" (https://lwn.net/Articles/953532/)
and pick some patches from it.

Hans Verkuil (1):
  v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

Ming Qian (3):
  media: v4l2-ctrls: Add V4L2_CTRL_TYPE_REGION
  media: v4l2-ctrls: Add video roi ctrls
  media: vivid: Add a video region ctrl

Yunke Cao (2):
  media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
  media: vivid: Add an rectangle control

 .../media/v4l/ext-ctrls-codec.rst             |  73 +++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  30 ++-
 .../media/v4l/vidioc-queryctrl.rst            |  26 +++
 .../media/videodev2.h.rst.exceptions          |   5 +
 drivers/media/i2c/imx214.c                    |   4 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 .../media/test-drivers/vivid/vivid-ctrls.c    |  62 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 +++++-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 179 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  29 +++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  40 +++-
 include/uapi/linux/v4l2-controls.h            |  10 +
 include/uapi/linux/videodev2.h                |  13 ++
 14 files changed, 490 insertions(+), 48 deletions(-)

-- 
2.43.0-rc1


