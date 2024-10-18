Return-Path: <linux-media+bounces-19818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BBF9A3460
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 314DA1F240F0
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F7C17C220;
	Fri, 18 Oct 2024 05:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bEG5MK2A"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D191547C3;
	Fri, 18 Oct 2024 05:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230331; cv=fail; b=TjJk1sfqeUPWRNjXi1r4UXvBfhGDEg2u+0XX6S1bcBzM4/pdtV1Rtmq3S1lu1ltiI++MbiyGh8/r09ZSs/LvuwSW1Y/4UxtJGwpoBXB0YT6JB/jnPhlQD+eMyw3sNCn+nqoO7ZpVKJldTpK0e77ZraszasYhSEzwFR6eE4bnGtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230331; c=relaxed/simple;
	bh=qbXapau9tfvE6yoZBqlJXHzZLJCUL9c1iPDFBhiZQmM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VlnQ1TLAckmMrMTBj02ADK7tKIgHCsyw3ywg8zmS+MudiAp2ZT374eIbremLzpEmq4leYPlrfjA6Bt5/+CKTNeBRGFJtAaW31RhlAQT5/NnivVtAbgguytfw6we/rb+rW72mThINw74qQnXTUERRQJtZEQVMgtSHHeMPqGnhTWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bEG5MK2A; arc=fail smtp.client-ip=40.107.20.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUNqLa3vwBhyoMfNKzFoYsPqYrA17G9RSGYQRRtYhJtfsotr/Vicahu7FCYKUh9ttmePA76B3z/RXOEakN4q90hosIwfOCpg1Ox0UhZ9jM+GiPfacqEwJDYSN0Hqwzu20dRypuI083u8/W57NBOC34JVMedByyYtNf4/iCtMCTTzon+mCagQLpasLqG9XsHRsG085P1EFrGfPTbreyjjL3qWcBPcnG3nB7HbCIqjQ1M8A42JyUwvO+mF7M6hzNgOst4IiJRzEgMOiqr1YxZk4umgNC9kCRR9lM/BPUYOrNLhhekkDXi+UgS1B+mQnn0cPx7QoAko8us3qpkPoAtUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cpnu9XE+bqCoEwreeRQxUwRJRMhigtvM+9LUk8JVkME=;
 b=QnC4zV/wAlpHGswcVhZ5116HtkYiABgL7SsUv3f1zm4ss3CZ5iRX1eBumSY2Q367RP0g1Mwujsq3KhMwwYIHGKzdyqzKqV8nx/nLPtA4PbNdNb3y59n6pFeuCiDTOl8ENN0ZNAQzwLQrmp8cSlMp6giaKgAqw0S4toiywQ3gG081zE6ilCPJs0iadjt7SjBN3gESYntmtpzDpjzWV6OakJmRsWKtIvCzKqaKn8yxm3H3nGRCBui7UnGDRx131Z8UiqcL3T2J/Mc4IRQJiGwZglniL4xzJDwsQdaSmjNZi4xLOxOj/bGU3hcggeGozPEgcUulZi5eqeLsRHnksYcB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cpnu9XE+bqCoEwreeRQxUwRJRMhigtvM+9LUk8JVkME=;
 b=bEG5MK2AlWnJr0DzWbUizRsnBlbJsIQAPWuYvucNyX1a1vvYYLamlTT+ZRUS+/SJJJFH6AVBfLxjb/rRwRnFqRj5X+h4vnDcP3gibrx3a7z4U/IQCpIfPhf0PxIeF2B0jmnG8H+YJaFdudcj+pHSNE1nfR+vfTzQVDUfB3DZtBx10Z09EGfeobZMyIrQuZPzm2/bZ6giH6BYCrQhuKkxv2ldGrPE2wRLDs03buTwKwiXEJS5tILy8upkya7Fb7H9MCF5RiqLlv5Pkk/PGVVxcfYt7hFiU2rjUS37c4xhwtVlIlPYgiCDy6U6PDD9iBplRrnDyakBSL+cQjcil5z3RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 05:45:23 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 05:45:23 +0000
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
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v2 0/6] Add video encoder ROI ctrls
Date: Fri, 18 Oct 2024 14:44:42 +0900
Message-ID: <20241018054448.3190423-1-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VE1PR04MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9e302e-71a0-4f3a-4559-08dcef380f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v+3UbUJ2iCwy1uMRGgI+jNZoXv8HgDWj+QQLgTHsWqW12jE56ha+17TAh8KH?=
 =?us-ascii?Q?hK+h8djp0kPlXNPvvasbYOBiuK3TqMLA6ieKJQ/2sEqXIm7aXS93jd6Hu+2i?=
 =?us-ascii?Q?mKuTnjLShUAp+4iZPOK/Ty2W07qNtvEzWp+Dr/SxiHnUQdtR2PH+sf41M6uc?=
 =?us-ascii?Q?u3s2zyV+n3wQUBtGj1NczSxKteMMrKTL0f2Hx5rzikC5YWOx1zLlKHbwHtOv?=
 =?us-ascii?Q?TW9nNslL+I7VU9OI00FgFj3rwz+/tdwMsAkrlq0os0wKY2bH27L09C/X1XQH?=
 =?us-ascii?Q?/9S0Kba751M3vsXOVzOWZHNQrJIp1OSTgMKZJqcMmsbedXkFM08KVwjqMbrQ?=
 =?us-ascii?Q?p3vYX2rV+1a3ZczWvdvbAmGDGZQ9+1WYnvubkHjS5TtEgpv2B9kmCkcNy84D?=
 =?us-ascii?Q?em+SdlQU2hbAH4zVfYuiGLmzujf22uX2GhTUyqW397cHgylLk3Pcg0mDH1Mz?=
 =?us-ascii?Q?4N8y7j43jtzTX8iFqCMIjfY0IaXL/weaHtQYNgTBXL4HCXVOMTT5R9YkIfnn?=
 =?us-ascii?Q?wqCShtdH6DNA5zMMJV2/9vBupc6pnj56emK+6jNthTsmmozmcbD2Tbia75LA?=
 =?us-ascii?Q?olG63YKzMCP9VIjQGTznBa9rahlW5BjcWiInnrEPTDp6TImYy85Rwp0DK4rG?=
 =?us-ascii?Q?ZtNtJeu/J4fZvLGKtBeQL3LkzDd8brJx9SIMKeGCOtdnVJHfir6r81YgQHsZ?=
 =?us-ascii?Q?ijfD5o9oUCVfrTVvVoqCBhDBfG99BW/SPKD78FsvMPFt0xN/Je0JlrNHh4Eb?=
 =?us-ascii?Q?AaNByAeAFiGpKy7pCLWGEXzVbClRLDKO6qPmrCOGSehF1GJ0OBt7q3eebuU2?=
 =?us-ascii?Q?q2grEJ4MJM3mXd3tf9HzhcTGIOs4I6JDljey3PaKFZZwCMraVG9cyRHX5+EY?=
 =?us-ascii?Q?EYcxq+yBRhpqtrVpN7o3zVlwefmZIXpdhHUqsiRRsXq4nvQbTQiaVCa5cjfc?=
 =?us-ascii?Q?NgFU13oDTinmz89XSriscHP/oLrfiQzASQEujkQl2QvzM3nyqbiGSwY4Zng9?=
 =?us-ascii?Q?QULgCaWEDSG9rrWdyeMhENtIzDGTPE0IodNK58fYg++jsZ0grk6H7ThbS8Tm?=
 =?us-ascii?Q?/KeQgkomYTasuyJiK2POqnTP/UZGEacnIe6A3J48VwzkWEs1ZDk+KuGhpdjz?=
 =?us-ascii?Q?V1sknx7WgEtLSpElnddsrtGgmZz2BF+9Uzo39SYckn+Rmx+KtsI6sdnSdqqx?=
 =?us-ascii?Q?URa752zTKJ5AnAaQBOBcGcIDatJBLg5PMpKPAgIXOGhX8kkxQ7T+xrigAJB8?=
 =?us-ascii?Q?XGXB1XR+KkZDW1es3Y/INfdzq7/bfhdeYsb6fxbb4xhdAWJ6g/EpWr4yLpZV?=
 =?us-ascii?Q?q1G13xX2/IBYAXq3sRm6qUuvern1xuLrtZvpz6Hd5S2YB4kKSwfiqdp33nIG?=
 =?us-ascii?Q?8w6A8MH5Gpv1SehmIDdwtOaBOVG3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?El/BhzdeJX4AUfrkiRFj3Lf/zF1zQ1kOlVB2R7AKdA75sBrKXpH8g7gd53Fi?=
 =?us-ascii?Q?v1cE8no0pFPvUXipP4mLylPdIT5mmVrxjEsQ99W5hZGMvlZ1cepgoTOldz4d?=
 =?us-ascii?Q?aMd74B8tntPNvqygSbg5Pq0XvOxcHTFdNnaPeeK4vZuNSZvYA697U6M18ftb?=
 =?us-ascii?Q?CZixT24o2iMqh+lVaHIEYnVl1ZBVL+0/ESwc8/1/XjjESs+33tUMTbh0lQpn?=
 =?us-ascii?Q?CDXwi196YgZue5cMyimeHuWEzaRRBp01NTqEZoiF0xTuy/kc4JyuaPvlzXXj?=
 =?us-ascii?Q?+8uADdWFVMccDlTStlCaUjJreGx/YNitrTIbgOdQC9r2Q/0zKxRlXPZOgCYa?=
 =?us-ascii?Q?D4Q0x6l88+y6NMtf0VcvxyvtmZK1jfwZ/30+bSUlwIP9y7pW5QaQy+xe4Whv?=
 =?us-ascii?Q?GFLpqLf3I0V4W5FTxibEbyGYrP4cijRU07AoFTHAjqby4IIcxb55oM4IfiZZ?=
 =?us-ascii?Q?hNMOlnYkNHE1zMlcZhtCZRaOQuABtsPUYHgKb7UT1s8Wh2NkK9FizFjGZDtE?=
 =?us-ascii?Q?VWPeCHDCn/OIyAbheGxOKdHEU1ndZNQoRqIcsQ14HjEQgBuRa1/sWlzfyPnQ?=
 =?us-ascii?Q?GDvlTjnWJRPsNFrbl6A7D/l3kpk/qTsr1HY/9l5RYIDS8ikcEjL7LzE4AH6+?=
 =?us-ascii?Q?7JRWsEHUb8VnkiExgclsm2b/gfZByHlYHHxDS8uTDM3TG9Ifwi918ocUagDj?=
 =?us-ascii?Q?kEX9h53uuCbOJjzVgMAj1OiX7NcqfR9L/Lvh+D5v1ja3VhguaI12vWHN7kaK?=
 =?us-ascii?Q?1TY3Be3lNZhkd1jZt+yQzYG8vuVpmKNPKStl4nGl6+zV8mjhNXD8sMvTL+ai?=
 =?us-ascii?Q?X/gKtiZ9dTxkIoNq1Sjh8KHbTp82zfOlebt29TAPYEuiPidMabXndnhDEP9N?=
 =?us-ascii?Q?80O3Nugs1or+wT78MiHeExKpsKBLsv5JP8kvW9BXuE8FWo4NSyX1JBFZT/dP?=
 =?us-ascii?Q?uT26mIy5zdU1l6TTYyUCqj8xGYCHhjFJFw054m+CuGnRPXwwJAXoA5FghPRd?=
 =?us-ascii?Q?XAA2rTk7RPZjWLPpAjgTreqK436e11QhQfQbqB/ST0MLAS5pFhqpvtElNyxL?=
 =?us-ascii?Q?Mh+/Mw3zn0X0rdfi0ehYmBXoqIH3eiwNE3bEFt8AcfMekTG+brY1jYeW2kPf?=
 =?us-ascii?Q?ymj4rUlHlb8nhqkLq5fLE5aRlpuTz4q7tsNMkxI2TYNwIOqrPen0WFeTBCnr?=
 =?us-ascii?Q?K8dupuVkJ4aquZFYvox8P/oAitkZWaT//Mu5n8/WssbfhUvKhs+gkSbpFw4n?=
 =?us-ascii?Q?ZqFIG5mqwMJkm0dT3RqAIqvEVHV5xy+toVzejj0MjJddAI7RwO3MPN4h5rYV?=
 =?us-ascii?Q?DXAXrLwu2e1GVj5LW1t/5nLN+ZJhCk8F0fMLPc2R7+b43LC6TVeto4Ls+7lU?=
 =?us-ascii?Q?P0vVb+cDCScj5AbnTl/9Hu+b3HIlrxOoXbL6GT4u7FggSteuD4peAp7MYjE2?=
 =?us-ascii?Q?eDpJ/bRk/bjOKFpHpIAk/n9hY8tbQ2cd1RPkeD145WmoyOVEh8sjTSyG/wi9?=
 =?us-ascii?Q?VHiFYE6sFtPa700i3NkzphHTowdpEcNatHjbO3WRpIeyzZJvaQfA+vsixtYD?=
 =?us-ascii?Q?Lthk8xJOjcAZDMM2h/LnFnn6LauuNgcOJYg8hFxG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9e302e-71a0-4f3a-4559-08dcef380f23
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 05:45:23.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGTXV0z2z4vI+P8KeOwCTDYfQo/NaITFDWIcv1wJm96RtJmq18NtEYHKAL3cbpdao2uXRDxT0GFbLpnqUzb6Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312

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

changelog:
v2
- export symbol of v4l2_ctrl_type_op_minimum
- export symbol of v4l2_ctrl_type_op_maximum


Hans Verkuil (1):
  media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

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
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 181 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  29 +++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  64 ++++++-
 include/uapi/linux/v4l2-controls.h            |  11 ++
 include/uapi/linux/videodev2.h                |  13 ++
 14 files changed, 516 insertions(+), 49 deletions(-)

-- 
2.43.0-rc1


