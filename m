Return-Path: <linux-media+bounces-20972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DB79BDE82
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B695D1C22C56
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 06:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F2C1922C6;
	Wed,  6 Nov 2024 06:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DPIOL1Ps"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115B61917DB;
	Wed,  6 Nov 2024 06:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873310; cv=fail; b=vFlnPKgykhlY2quLxqWZpJF6XgkCIuoiGHfrVF9WieaMO3DG8Ku8HXuFEC/1Wr2agFwkLms/xN4HS0O17OVlFucJcxC/6q04PFen1ixPWbMhT5BSbQO4h5hEyYAReGDloCh/8ZJrXjIIkKHYmMbekrQcP/Cmo1SLofDq7OyPqWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873310; c=relaxed/simple;
	bh=eCm9EdVHxu/KPjqF5fGv28Djg3Elxy2owPZEJJ3QcbY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BUpA8nMjinmlXJv26uhcxgoJ2qMgzUFOacrox2fqCWp8R6D/VxhkA35IjZeKXcWCtHTRpeR5f1JndzSNRGLvxQxBM9yCT5Fn1uvSizer5vJMJnWH220VPGfiP6y3uea5ewLuvyt7yaYGkeA8eWb28XU7+jNzXKlbkwr5OSKOG3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DPIOL1Ps; arc=fail smtp.client-ip=40.107.20.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMZUIWIT6gYaQ8FHVmW/HDjQVBCdoqU3Ca9w9HNAxMMgGJkDmohPjNyyNP1xAdchXkCOH+3BKzLbJtGP16DlugoRKyHHmMJW5RWjDjP5WzwA0+nLsNN247RnSS34PNV3Ze1yCfhSbrTYegFadHmPG4DOZFyIsjcaLrDidND2/MJvfdB5wb42iTfZ5yKvi5N5bPut7kQ/4lwRiv//dcEvQYfDAog7S1WkKsqn4gMB2vmO6sUbpEzvpcBdyEcXhIoDWT2l4m1pZy6kqjRpyelWBEEaB3EtIrCl9sU9aBBKBkJLMVoCW8oULOIAVmFEEwhlHZPZMKh2PEtc2k1VPA6Ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGlrlQpz8AshYYNXMJjA5XwmTGBjpqHt71CsM8jjszs=;
 b=bbkwqUKIIyjOo3nRVRXl7E46urhS97yW+ILClM0shb2oIdtELbZNCwvbowgAspBagg/JrikwUX3fGPejvJDvKByxOLa+COqS09d7Ns45znsTKSJKWOs1l4f9ELWPuENpqLLbh9T6KBXFeAjGhbArZ//+/b0HWyZ2tbG3G3vve36VpUPWiD0pYXOfjNEW8ZHLJQcAvSaOlm0c8tX1OWL+hP7MmYQzbuzAwWH1WLZtq99tgzrm9DiUMvfG7BrK9UbnIQsIUtdSt3CzRvLE8jKCfNmZob+e04P3v1jfusVnyQPELY7Z0Ixh+rnYp+broiQFLqbNqeD1xc9tyXjcOaf66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGlrlQpz8AshYYNXMJjA5XwmTGBjpqHt71CsM8jjszs=;
 b=DPIOL1PskOPOyjuHfhneanwBl9hcIteucMltiDuIBIlOAwGcR7QtZqoiXnwJltxthH3Vos/eFoJ4PMKQKz1XO9zM9ZJ4zeD38NxSyf+haSFqWxU1R55NjYFX0cV6AiC0qnYP4vN42d0poA3QRzLD/OCbsa+9W7YdXxNKdvawLAz7jbh0zXZOQqWY9fkEvcwXxKgope96VOEKRbRSQsGbA2tLy82955mQcAwInVZz8s9QHvQeNATS6ewS/3KXUerRAd1NOaTiKOmc+vBCyaAUWfDQ/QDERcLgJukvTGy5YCpUQn1eDsoVNmZPoz+AKc3xg1LGP9tuAsuaE8QTZJdfHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10506.eurprd04.prod.outlook.com (2603:10a6:102:41e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 06:08:23 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 06:08:23 +0000
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
Subject: [PATCH v5 0/4] Add video encoder ROI ctrls
Date: Wed,  6 Nov 2024 15:07:48 +0900
Message-ID: <20241106060752.205074-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10506:EE_
X-MS-Office365-Filtering-Correlation-Id: 4263fbaa-d5e3-4aba-2cc9-08dcfe296b6b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C7/abAzNSNanyrIsLdapTXP07gyCSSFfiURbtR4cqACHcYaaFuSLUXtbI/JS?=
 =?us-ascii?Q?dk4fvomZy/YH8Ku4BktOIJsXVlVz0pSFEBse+NtWyhgejl3nu6xMFy3S/+5S?=
 =?us-ascii?Q?XERptNi5sgj1CpE1ngS1kp0zmMBNajnmbsFXbDpNvun/A5oEEyhHLYp7nzzc?=
 =?us-ascii?Q?btkJ+Gp6YSfZuu2O4HP0h+FepxzvPeGi36tFHzskS1Bnseci43HttqlfbR7K?=
 =?us-ascii?Q?qnSGbvVU1tLDsgCYhuWmSclOE1Jhw9prS/gOMYeHLf398QGwEKmrC53af4X2?=
 =?us-ascii?Q?dNfE2Aaow0HiIQ1MN903/RA7t/7ZZdmL+uvPtJ9aLCc48Eq84mHZFfhey23k?=
 =?us-ascii?Q?u2cDYVIafyL31Qb7JoI4CdCQzXhpMrAEiUDdtNdFtWtJOFJErbxoAiNQduz8?=
 =?us-ascii?Q?Bla7S9PpkKewYshQ+0YvCJHfkAsJOFIUuXF1QnSUNezNXpRJZIhVJSIliWNd?=
 =?us-ascii?Q?VW6fTK+WRfwScec28qUrBd+MQcSPeI6AfpE/QqRowqA9uFmePyeBi1Y+lN/k?=
 =?us-ascii?Q?B/gWd+iVmHsSXawAcxiT7ajLHnhLPWK+plegdwSyzdgLywU21mxcAbznSiHe?=
 =?us-ascii?Q?8OYEqr+bj3b46YGpRB9TGTMECxRQEfORvBYpvXwOj19C1xYakbLtYKTLs0dA?=
 =?us-ascii?Q?PG5LMagYNl7QWlSO4wJIbsuZVfoRp9yQddOX+nEGDkm4czTkWcG/Oyvd+j5P?=
 =?us-ascii?Q?dNdJgzhcuYpOpm8uWfAO4k7j5Lp6nj86E6676VzvzzGhwZ8bUVdL2S+QBkw1?=
 =?us-ascii?Q?F+EcmHLdVZR8d3b4wqODGRwL+6EjqngAAF5GdEvynNU9uXb/1TQomgHmjI64?=
 =?us-ascii?Q?Pxba643/g/wJ/cpFmBI8uJTHyYHOPZUUvAdz4ahILjP2RHruIKTeWdTxGCCv?=
 =?us-ascii?Q?2l8SW1c5DxhyVpQJArfT0IAr3pxqqkM8/bNuiVF9LrlTqtgt0uPgjd0D7NJm?=
 =?us-ascii?Q?EMVkcC72Oq04sa5wO4ZjUjl72bCag7SmC5XoL2UEllPtzLVd+tx5DrilH6N7?=
 =?us-ascii?Q?ShXbOC7Idq0lg3N11owoMm3Bf18M+ma/RtHLR7cBfjwJTgGm0miVvRlaCObU?=
 =?us-ascii?Q?HsGD6MSK5eUUOZgWd0mFTPzgl+wcMh8tWHHyouk8WBgJR4Lle3aVqKsjNYWS?=
 =?us-ascii?Q?m01VyAGodiWKe3Y8e1AcA7w1a5VAs0cHyYWWAVrx7JGuw09478/UKcfxT1as?=
 =?us-ascii?Q?w+vEa7A35m5gaEJx4ySkjMglZDtdUoKCLf5y4bx/VGBvAK+blVOREkOa/GqQ?=
 =?us-ascii?Q?Hbn2RlfMboSyVRhD0nqD/ToPcez4n23oChlbJMKeSdVJY7+m7hvq7c/D/aJg?=
 =?us-ascii?Q?VEuWUmN4a71/sUV7YUCAmr0IFUKJgAw9d4p1OXaqqb5E0vQ6qbCcFWpsmC7+?=
 =?us-ascii?Q?WpMbAT5H8Jq4qjFkuOVvQ1rPU5iD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LipjnY+g9SMdVCrKJkbLvYrXn4RNCe/FaoM7uONZ6ifQk/SY9r+0UiBl6QTi?=
 =?us-ascii?Q?zp8IQJjYPON2SF0n10/M6yuDvDoICTPOAeUumWwmGS+rHHHbUv3fTGU1DTyq?=
 =?us-ascii?Q?zTFiTeToJHCBK2TWAq+aHkPd9VYdH2XzEGsdj497q+S9zc45UBIJts/eODgo?=
 =?us-ascii?Q?x/cB1lgDXCNfLuEegO3a/yfWg4DZ84EezaDr7egNsQANLkEdyMO23OunxnUH?=
 =?us-ascii?Q?edD+PVJY7o7MM5UKvHHdlT3Hp2110hkc+XnFqZJKkifGS/XRA00wh3Nw0gPI?=
 =?us-ascii?Q?D+AjTLP4gn7qH10MPQGEKAqN6qvUkw0bk+BBMEdF5hKCIbM4mhzSs0wOW8U4?=
 =?us-ascii?Q?X2/Fgb+HB9XI4k0r+tpKcjzWoMi/GuCbs44z2o9sf8R9ADP6IguWSyDZciE2?=
 =?us-ascii?Q?2iGmLPWsHweTRKLSw7P0gY1CHle7jfSZqdjrDnV4KTS5R+aXBFp5MM4OnahW?=
 =?us-ascii?Q?gXUWTS+DTVqc7TVXwb0T62wvsnLo9dvBJCiPSCWbQIc1QO/yPE/AxvFT4ODb?=
 =?us-ascii?Q?PfyCWc8kNTujkVEiBqVgwOc6Cmr+IXP06hMZo/ZggqOUoZvqjqHd6TmKy7LM?=
 =?us-ascii?Q?ZuHulK6MGU5GrpZxRVBQ3HbXdflMZVxZYPsuBHqN7IdWH9YGa7tG1qdyduQb?=
 =?us-ascii?Q?nWaAlrF4vye1cGfJIXj5YrdSvg0IGIvjTffwxHXbRmBjBnps6eduptVRW8lk?=
 =?us-ascii?Q?mQKtwpZZwI/T2Z+FdWzdxeddLNWqHkHxSfsMHZuGfzIar0lBzoqEHadUpJAS?=
 =?us-ascii?Q?DJMi+3AgsQZYbJi2cNQ5DpoIAyezIRXR0Nenw0sA0G8iWE4iaYwP8GEUySny?=
 =?us-ascii?Q?odlEnz+CCnKvnj+bmy0DdwIQQrCmhksw60U5y+eFazMJWMn6EQddwVwT9/6j?=
 =?us-ascii?Q?fOawolA8K3sPVTRE4h/rEuWat4eXM9cH6/ffom1t3ak/dYhXJl3CnetoEaAj?=
 =?us-ascii?Q?L0rZLWhE4EWIbY73fWhEzka2CBynSQgHqdFdEv4chEE5csnLP6Pq73ZwSg6Y?=
 =?us-ascii?Q?f8jjP8JE1836LmD8ZOBw29Cbc0TT4MUetRTw3sxowh5nXsG/CEcYQzGZr9+1?=
 =?us-ascii?Q?RqoQuNqv5CP1mCUNq1dKXQaPvEeEaujGw3MDHjixcll/q7biQJdHJgIGoI8K?=
 =?us-ascii?Q?EuPqlt6yJ7H4pwW8DQA3ga5diIVGAeE6TlsSzfDMra7xGTGGHwS0HcnAqQvw?=
 =?us-ascii?Q?Ay6GLhXFHNxbAvI02Zvy8Ku/JSEG9M6nuc4y009esman59L3sZk9GJq48yjg?=
 =?us-ascii?Q?sPBvcw8rlbQNol+A1C/IKior66ng8CAb6Ucbe5+4FLkiN4VVSTBUZmKTBoOE?=
 =?us-ascii?Q?gkEKjX82aBB7PM+nF+AQguVl8zE6nSR5qzS7N/T4jgPnAaOujXly85XUtc1k?=
 =?us-ascii?Q?4oo4wIh31k6xu8vd3oOpOoVF10N3jJMSMtz9CCMKL8Be9R0KLfRhqsw5wp2f?=
 =?us-ascii?Q?37CK4kRUt2mf2ebZp1wJEC1zfyd651WK+5wg83lk6qUlAtnVCoglAV5JGp5i?=
 =?us-ascii?Q?8gFZfk7Kf+0CT0XG6PfWL2kfgIwyEL5rahy0QJ1zoYZBAnpPTSnCmcR51ddG?=
 =?us-ascii?Q?CWc4fxgzKck3UWuGRJX6HOw41JL1LNrJ5TapEp+A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4263fbaa-d5e3-4aba-2cc9-08dcfe296b6b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 06:08:23.1123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kT7yRtbeQPQtfuRgjDSHE7nQr49ubQjnRho8/d9JwzitFYxhiJLbG6oyqoqAsoZTtHgQIVkSkXIHq3wxAZCC/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10506

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

v5
- Improve description in documentation as Hans's comments
- Improve the rect ctrl logging notation as (x,y)/WxH

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

 .../media/v4l/ext-ctrls-codec.rst             | 136 ++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  26 ++-
 .../media/v4l/vidioc-queryctrl.rst            |  14 ++
 .../media/videodev2.h.rst.exceptions          |   4 +
 drivers/media/i2c/imx214.c                    |   4 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 .../media/test-drivers/vivid/vivid-ctrls.c    |  34 ++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 ++++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 168 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  46 +++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  62 ++++++-
 include/uapi/linux/v4l2-controls.h            |  16 ++
 include/uapi/linux/videodev2.h                |   5 +
 14 files changed, 533 insertions(+), 49 deletions(-)

-- 
2.43.0-rc1


