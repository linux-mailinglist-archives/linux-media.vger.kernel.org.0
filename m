Return-Path: <linux-media+bounces-40623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE245B2FDAE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCB93AE653C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24372E7BCF;
	Thu, 21 Aug 2025 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VugoBC90"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53088279915
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755788195; cv=fail; b=NZdqOCU5icP1Z4HRRh6wIn5785ahRe8BKWpRLL0ILFjLlNEitocCGMBhb5uFWTLFw+oh4y61Rzax+mb1KcA+fLIZCSWKP5NVzgGUvfBtnCmC1OJ/Qa1O8wJfFz46267Oh1Fe+xdSfr4P2FoAsj65ujshNcsvGC1Q5p+yw5/R5CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755788195; c=relaxed/simple;
	bh=pmr8K52/EIhaM+AO4t0vKIpCCu0M/PYHGM1OSTfsPMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JlohQhsU0luIAvDu35+cLTARsxTVqX7KjsGgWwk1rNkv2ipz285/i1/a+gQG/LuRaUW4ERqSIeLOpHFXE9GznJ//0ITOrt1lQ31ZcAAeu8fZOel0m0P+hvHn7AXDTJpQ5FMWeJWlRCzC8fH5jsrtWz/jgyDOfd7Fx+Yiypc4vaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VugoBC90; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gm3RQPAzSNjTqo22FwIWRNIwPnxUb/cTpOGF/Dg9QfnGRROv3TGjAziapB2O6hXZ62M2MC2LQAsQIKpgz+YyVPeoiQ6RoT2ZlcdjNmwZ8Ai9RYNbvHw6O75nGCWaBLz4aGpA3kmJHqoicu+3WbKfXCe4AWVnCYr9re7F6UuWLSYjD5kZHrkKc4LOAa1iVRDAGr2XOrZKgeHsURMQPLHALzhoO16EZLsMnchsQQOZ+IJ1Gcf7MHpxH3TLShdQOsYtUFWfUKem5/Pz3brnTGl9waEgFpKtfbXz9TepIJPQsPo5UT6Jif+28L2RkBNMhA8BBVy6kkddQ8yZ4X0DtgN4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMfrwSWeni45cYXJP3SG9c/iIcCE22YLvIgq+jT2AQQ=;
 b=KyL45rO7R0KDhzfVPnMFuQc9rIOMeizVtEENRUqSK1PYNpHHQ5Uw5+KYfsMW5xo0vcX6+faHSm/GyCBbv+AdKyE3HuGNTJmX8EKnW39BBU70Y5Ic9YdSaJzG5zot/ofjhAsnd7vK7gmLTC/DcCax0ynR2Q0KlhzA9KEPrkXiLXpnr2c4dl7jIaNOzHs8Y4Whj96+K4VDYHKrPBSEVfxwNNxu308rz9rbcC88nZIXw0fnbLMq5gsqxzAs+g6YogNwXGqebK26lg//Mq7rKwKzcpYuZ5PMOO8a98O1T3xP0YDdTu2m5hfRl8DmCH9SYORReoBGBwfnFoq+MoGCTiSRFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMfrwSWeni45cYXJP3SG9c/iIcCE22YLvIgq+jT2AQQ=;
 b=VugoBC90kfp8nJ8W9AqInZyoDu+h1AyNLLxT2tIeFZbnTpQKm0ImfhShSR9atVOVCgswj2KRViyR8j3jf2wHoUwUzC+c0vc62WPwWcCoYODsjwTuz0tk3BnsOQ3ctuOma77crcJM5yqwDDAkyKudCNmmYR7iq73/dQENqTrvGZL1E8j60WOP5x6Kexs14rkI9/mRPHjBvNgP5s961QLMnHFmpXxP8C14BzDvJlOjbxJ8awtjZJXT4NlPyBSm/8kOVx/Sg1PEiO+ERZlML+Fk3I8mmM21uSTaJ9KzKTBF5GSyyaWfDgG8IOw7P/DboaKiKZvpIMXbpHsY53X4F1lVBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM0PR04MB7154.eurprd04.prod.outlook.com (2603:10a6:208:19f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 14:56:30 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 14:56:30 +0000
Date: Thu, 21 Aug 2025 10:56:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Christian Hemp <c.hemp@phytec.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] media: nxp: imx8-isi: m2m: Delay power up until
 streamon
Message-ID: <aKczld83UQvULfVl@lizhi-Precision-Tower-5810>
References: <20250821135123.29462-1-laurent.pinchart@ideasonboard.com>
 <20250821135123.29462-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821135123.29462-2-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM0PR04MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: f258ba37-d120-411c-3eec-08dde0c2e982
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?H6vVPYCf/+ShAZ2qRsos3DBmYPLmZgY0zV14WEvRhc4N/K0LZZk1eQTBxwT+?=
 =?us-ascii?Q?v/4f0EIMibrtyUKzuylF/Mig/SKKeBTOkVNSnynBaHkjKa2whYIpL7ad+U5O?=
 =?us-ascii?Q?aMugBMWSgG49/pCAMQGsuQ/Lm0EHBBz9OhNvki0LaD72j3P0JXiKH17Co/Aa?=
 =?us-ascii?Q?zFqFRpSRb9kizfuA1EklvjKId5mNp6BSMDgFb00a9/+2FdBcxj4GTDuwTPXc?=
 =?us-ascii?Q?khf4sASse6J8RZCYZYl9w9ELRpM6j9m+2NIcp/SG0/ftFHgACTjx1uVY7Pm4?=
 =?us-ascii?Q?eCMK71ACRMCHx4YWkM+PAHASSyLdq1tmTE96j/KhOLfqfappMC1zWzDQoa7n?=
 =?us-ascii?Q?ET5ipjB5V4Tt5cmUI0Nm3wkUiA6PRb4dNOpSeyQUCqZOiTm+ywMZYo4w9msM?=
 =?us-ascii?Q?R7PziyTeO66wC//63XK2xPkePklvtznD/nWOUoUaAmHoaatzAaq06A+B6aB1?=
 =?us-ascii?Q?VWiyJ6FSLXufvYemecFlLFN+DeK06CSQjEWcq+kYunf5/9OMQ/5UdkmsUCct?=
 =?us-ascii?Q?HLEBSwi2pLyx7/37M4NQ1/N+cykLkrFzbYvFcmfok743qo6iX7KChF1Xw1K8?=
 =?us-ascii?Q?S7Mw5yHhA6/vxSjJQPJShAEhNGOvwEZtweVK8USr/NF9desNkk1YvPZslEr5?=
 =?us-ascii?Q?0Fny9qJhNiyfJ4vxf5igPd019HoL3OOGxnj6S/4gH+GvWI2m+r7lptMuMXXJ?=
 =?us-ascii?Q?N8zvnJNo/cLoykElSTVAeCwdapJQQe0XCT2gCDrjfE4OLOmPGcgRXcf5ku3A?=
 =?us-ascii?Q?m+XOWDwrDbGTpyApKOKdQHkjmk2z012ksKKM7Ix7it/PTKCDV759bPIuMm4G?=
 =?us-ascii?Q?6IF5F/e66/QeEG5verHQOabOSGPcV+jzeyEYmwne+rNgUsJC/BaLEcnaI5aw?=
 =?us-ascii?Q?DkAnI3HvQmLU0FRK5SbQSE0zPYwaXzPKIxSFtdGjl9t/cQAtdBC2MXg/ISW6?=
 =?us-ascii?Q?XLJb/LDyiydo4gnFpqvTZHWzBho5j6qJlU5cyiwpjH96PkiR3nWln83Ev8hY?=
 =?us-ascii?Q?cql1EvUEvtNSCdQDq96qBjV2BSTZ5+07aIupTjpYwKWqklRX1o3qeb8dKrVw?=
 =?us-ascii?Q?F8Iye8AaCEjrvNKmOgtvY9B+Kv+1xz9bkAGf47Pkegom5lwSY9pOvC6PEu4s?=
 =?us-ascii?Q?tiYGSqexa2i1AhhgZaSjouGG3guTXNqB84roYNoS1rPD63+ms7ouJO08Ok7I?=
 =?us-ascii?Q?pSkkQj3RddUk9FixESSH8AkhejFOWYmz1liQu0jGs4U4LoflcPav9vZwgfY5?=
 =?us-ascii?Q?pFsTCiz2YJs0ZH3KPHPAPgX/swuu1rqzL564Uw/aT92IZnloH3pdKxTbLoBH?=
 =?us-ascii?Q?2ZdyZY1W36LRKo07uQAgsP16fcEeqAr6BuvbQjC6imlvPmjDre424kik7/B8?=
 =?us-ascii?Q?pveJ6FwwMqUg5haUgVfIMGt3r/3CM7WDfiG2wIEbxqvJRw2LQmQJrYP/LEHI?=
 =?us-ascii?Q?Hy3xD5ICNm05yXuoF2Clyi1lLIdZF02SQSPp/6EBS5hS5ZmSodvyiQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?kKVLrDD6r0vgFEHTUhorgsaVpwx6MjldjDHnjGtlagJ/mBTUXGFwXigi5yuV?=
 =?us-ascii?Q?iZJppaa0DRiiuA72roMGpaZmHAH7XtfkQtM1HvpoJDiFFuel5+SwBTDkmTKq?=
 =?us-ascii?Q?b34+o8w7qYMtdgQJfSepihs5n76um1ow4wgtRWw/lBoTd9dy4NaZazG+9q4j?=
 =?us-ascii?Q?4zVqbLKBHLbSqd8g6UEZPZ/aBXYAK2WycEknzsUi4//pAhusSjXegsAf/q84?=
 =?us-ascii?Q?+08F28TMt+PbQcgFz9zM3LMvt5Kchd1REn0b3gTne6l3BXmRN5N0mgaXAEZC?=
 =?us-ascii?Q?wwl1GHOoQdM59Da51eDIpcWE65Aiwm8+kDfAknouWRtB0JmEFTIkcmfwmyhq?=
 =?us-ascii?Q?93i9P9v1hxly8Ef6BIPMFgS31VLQANn/JTm0SsPq0JzvNlixSrxhsaW24QFH?=
 =?us-ascii?Q?sffLNy1gkXFm8zYyVu3qfzMKzWM9smsH/IeHNN/VlsufonyVyjaG/60d/EgN?=
 =?us-ascii?Q?kl/v0PCZku/Q4lD6jo9Bw9zfXHCIfl7YNZODVioAa3MJakWdWuqCh8YKAtAL?=
 =?us-ascii?Q?Zs5A3/FLc/p8393V/CtOQsb0qDeq/u0uia4Zw/0P2NG3sjguSVr93Rx1EZ2c?=
 =?us-ascii?Q?4ZOy1c0iaXeXjsKr67qbeKAYw1L+ZVND/ZyfSopDNBNMNgFw4r8NlT6CAUNw?=
 =?us-ascii?Q?UbbP6yyVcHAS02CEnwdPbpLi9dkaOw1TtswbQpQOsME3CEtQ491564eKH30i?=
 =?us-ascii?Q?MsI0B/85RCNgjO/y0b4noJjQCHi3TXnjtP9YOE5XsQ7zXm3LTh3X+LEAv4tb?=
 =?us-ascii?Q?GM3rAVrqip1jZ1axubXPGqG8v9FyMkH8ZYHOCJN06bkq30XYCdpYcF5lL6km?=
 =?us-ascii?Q?G50BrPus89BePCHU22RoKUUa6lKnjt3fvbwqdUjfO94IJe3ZqmvVbtQbPj1r?=
 =?us-ascii?Q?OTaTGhibtNJyUk3imoZQNR7ugWhRWcYaM97o4uEnHNSmCFSHkP1c73QEUAmw?=
 =?us-ascii?Q?sYnZloCe1du89fnFSNcK0Ksc8M5Y1IP++xHIHI1VjF3aYYn89MnYzvbWZnv6?=
 =?us-ascii?Q?K4k6MS7tMK7k20jhbT1EQpF2P0tKc9oFXEnJo++LpmE+/P1m7iLW+wkJkjLH?=
 =?us-ascii?Q?y0dnAuXMJgghXbdEtb8PpasR4jo3mT3vqeJ0NQjElYSzYp338OcXUOmAaHyC?=
 =?us-ascii?Q?Qoa34bM0Bu+eEni+21GPp9D1yIIph5SYlREdJFRM00GilBeqA2rjN/NwGRuN?=
 =?us-ascii?Q?l3KXCn0o61VBuc43+EQtMyhRHm7+ODqnpZOYYzveLbZKGjev6TgC3TQ8eXyt?=
 =?us-ascii?Q?mKKfnK2lp6oEwziHGt1dWBdEGEuB0kO13exMsogVwPhPzM5f8IsTCon7YdAc?=
 =?us-ascii?Q?590gyC17rva3I/eG3//V5lzXolKpzS7GoUxMlIzPGAOCOQ7eBP9d3PKRTB7l?=
 =?us-ascii?Q?PD3J6m2JmDzTJ+AGigEegaJxXuh5OIYBRU2b4XvFVQfaytRXuT5npEE4GKyS?=
 =?us-ascii?Q?g5WDxdsXD0j8GoeCe63yBm7n+7ZwLsNvBJtAUpkTgKQBACgQ+Ak8osBEMwoH?=
 =?us-ascii?Q?WeVEHjPRElMQi7uU+KQuP8K1XGKcIKLZZWm4YstbnEget0a9dWWoIIwSVAQ6?=
 =?us-ascii?Q?wfBq9aFHovXQQxApL2DY9oZ+Cf0yZs7mVfcCIDU5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f258ba37-d120-411c-3eec-08dde0c2e982
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 14:56:30.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PF9xQrpvs3BlTKEFsKAV1gYo9tEgvLQfOubqlMuBdhhaw0q5mX7k9QFs7QmNh/2lMJF+f5RgWzLdq/6Xd4HaIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7154

On Thu, Aug 21, 2025 at 04:51:23PM +0300, Laurent Pinchart wrote:
> There's no need to power up the device when userspace opens it. Delay
> the operation until streamon.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 20 +++++++++----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index a8b10d944d69..00afcbfbdde4 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -250,6 +250,10 @@ static int mxc_isi_m2m_vb2_prepare_streaming(struct vb2_queue *q)
>  	if (m2m->usage_count == INT_MAX)
>  		return -EOVERFLOW;
>
> +	ret = pm_runtime_resume_and_get(m2m->isi->dev);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * Acquire the pipe and initialize the channel with the first user of
>  	 * the M2M device.
> @@ -263,7 +267,7 @@ static int mxc_isi_m2m_vb2_prepare_streaming(struct vb2_queue *q)
>  					      &mxc_isi_m2m_frame_write_done,
>  					      bypass);
>  		if (ret)
> -			return ret;
> +			goto err_pm;
>
>  		mxc_isi_channel_get(m2m->pipe);
>  	}
> @@ -290,7 +294,8 @@ static int mxc_isi_m2m_vb2_prepare_streaming(struct vb2_queue *q)
>  		mxc_isi_channel_put(m2m->pipe);
>  		mxc_isi_channel_release(m2m->pipe);
>  	}
> -
> +err_pm:
> +	pm_runtime_put(m2m->isi->dev);
>  	return ret;
>  }
>
> @@ -350,6 +355,8 @@ static void mxc_isi_m2m_vb2_unprepare_streaming(struct vb2_queue *q)
>  	}
>
>  	WARN_ON(m2m->usage_count < 0);
> +
> +	pm_runtime_put(m2m->isi->dev);
>  }
>
>  static const struct vb2_ops mxc_isi_m2m_vb2_qops = {
> @@ -643,16 +650,10 @@ static int mxc_isi_m2m_open(struct file *file)
>  	if (ret)
>  		goto err_ctx;
>
> -	ret = pm_runtime_resume_and_get(m2m->isi->dev);
> -	if (ret)
> -		goto err_ctrls;
> -
>  	v4l2_fh_add(&ctx->fh, file);
>
>  	return 0;
>
> -err_ctrls:
> -	mxc_isi_m2m_ctx_ctrls_delete(ctx);
>  err_ctx:
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  err_fh:
> @@ -664,7 +665,6 @@ static int mxc_isi_m2m_open(struct file *file)
>
>  static int mxc_isi_m2m_release(struct file *file)
>  {
> -	struct mxc_isi_m2m *m2m = video_drvdata(file);
>  	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
>
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> @@ -676,8 +676,6 @@ static int mxc_isi_m2m_release(struct file *file)
>  	mutex_destroy(&ctx->vb2_lock);
>  	kfree(ctx);
>
> -	pm_runtime_put(m2m->isi->dev);
> -
>  	return 0;
>  }
>
> --
> Regards,
>
> Laurent Pinchart
>

