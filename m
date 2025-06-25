Return-Path: <linux-media+bounces-35883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C11CBAE8833
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 17:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21F101C21D3E
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84C5274FDB;
	Wed, 25 Jun 2025 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VF/q2oVF"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0902652AF;
	Wed, 25 Jun 2025 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865273; cv=fail; b=SDQaHQxG6gs3sfFkUN3xALNZApuN4cVd6XTw6s/MNYuDRGgJcFxrfZRB5lr44gv57behR9XfjIEiLvS9U4o9KqcjqfiwkeuZ6IoHsh38ygNJaD2ExZwg+hZEUvq3Y0bBVzwkWZIhmy95UEbtjBn39wn8lV3BkaOCtN8Zu43lX9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865273; c=relaxed/simple;
	bh=jTgV9Wyw1z62c9KSumISZhiqgrxHlVvSnbgZUbaL8Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pNTHiqK0Mo05uA09ZCzTIswsckke1cloINedjbcxwKZ27b675Ad3dyTDkfzCh9pkWIJrIzZuZvuOyoLCJkMM11yxnARhSFP5cTFrhghN6bIPikNZuHfzsT//Nux7Ntl+z+G2AcH6zqSCII/O2D3Zk/MvABnFlLPD1wR+rD2khBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VF/q2oVF; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G99sKStNRZuQ9/ODS3sw5IfwNw+VYMK5nBka/0zuaXv+1qZHbH7FEkBTMsi2twwj1nBEhQb3ZBopHiMPbkSxY+0Q6KtqREY14CeuIEcPIhCfdYI36qql4g+kIMklmUSuAu/m5EYdy4r5l1nvuEE8V6ZxKdb47HwSdKvywJ0I1WbaYON6x1pcrNhYLtrMHuRQcj4SiUcam3l3DC2+QqWePxJG6wIB2vsck6oiZbAZgojLxJl4GvwNueG5RxqQ5ZWFq2DET3bhie9TjiFEQCvUyMx8Bb4yF2KQeKI0HsdSl6JHYkDrC8q7eZ6xjqY2k+nnbmuM9cUN6chRO6iqyqIdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zy4ocNL1GlQf8FyLJCHMeLIj7oIsiZi6AQp8n0Mo2XU=;
 b=RQvajBQcfiG6tOuuMj9sSvBuSxRiR0s4rtsB3oOJyoR7HMGzBL0V4Ln94CEOIzBX3oCYASOKoBU4LoMgUJNIhL5XzeUudNNhD8Cb44GK+8IGzi11jDviozWOvWVFCwDdLYvS4XZJvx+2jczW1gfen5aldLIFJebrhx90anbMvh4TVZhNuL2WUwrplgy+VNOSNxkiPKFy3m9LOvJwhO+VXvHWayPfIoxixNK12aJ1QQRl+ErBBxdXuWCNQKEf9WvulYvj9hMk1uH75ySHm0T3kEesp5rDViY0K8OJXDyJKj0N6RmqXe0tgyF+wxJgwnG1O/Duvcab7VhM1XC3oZjrqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy4ocNL1GlQf8FyLJCHMeLIj7oIsiZi6AQp8n0Mo2XU=;
 b=VF/q2oVFgSS/fMVG1eqc/iMPQwuwXPnr/euSZFlbYDLucSlPXL4dgW89fWU0O627HISbYIEndhP6MjZ/cxmwImX6VemKckbTDHr/mhzAtsUNI3nvhDwvR2JrvmGbDq9UGD680duRyYXQTRFDfdIkM9WAPUlNs6YYEYkQrqSCZ90XGosi6shUB20A4kPIHo0kRfdZfmHbi3d0JYkcZfprE3b31BuZyRDu87UJHmW/7DSdtg0vM12KYyM5nsFd4gy89yvDo6HEGYeKTKKz3bjcLGbpHrY2SlYEwfMChQEwDoyUIQQpGHp/PSqCT4TWj6Z+259uA+WkZAdYo0SBbLP8cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10327.eurprd04.prod.outlook.com (2603:10a6:150:1e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 15:27:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 15:27:48 +0000
Date: Wed, 25 Jun 2025 11:27:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <aFwVbfrUE4tZdRPa@lizhi-Precision-Tower-5810>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
X-ClientProxiedBy: AS4P190CA0035.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10327:EE_
X-MS-Office365-Filtering-Correlation-Id: f72c8bd4-eb70-4ecb-0c26-08ddb3fcd71b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|366016|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?viH5AHM6QWhOyq44klwJG7YnlmTCGwLuf1ZycpQQmO14bxWkTJk9UNKPrruN?=
 =?us-ascii?Q?bpukX8Al2upkFe6BLwsyAJy51oqVvKc+H8S3IbKdSOd2qjmyiPjOpQ9WLzhC?=
 =?us-ascii?Q?7M8aIOTJ7dqesETkGBsMa2WFChQfEN+RMWBvrnn1nwYvVi96DT5Ae6BxmJlX?=
 =?us-ascii?Q?A9o75H61LBNtuSTOG5g7E5AjzwtTFCoLcYVL5sK1K8hrZ1A2knTLeuKDOVLm?=
 =?us-ascii?Q?oA7qcK/YAwTGhK1apw0CPO3QXc052pIBxrblolzlP+sC21BDi6D9CsDSvIck?=
 =?us-ascii?Q?4OE6xxMbltEMDKzqDtctV8FqlTY6rwZAmh2cvr8IRp9UgW0uws9ocqWx7h8Z?=
 =?us-ascii?Q?7lJNyY5LLm0fw0QmgEsOpYp5a7hfKdGLVn5MzeA/vfE51zIPjrsnOz3SVEof?=
 =?us-ascii?Q?SARsHSi3V4C6NLJek6sHSuMVKbVoGYyrPuOVq9cB5a5lgklsnjgPckp+gHWL?=
 =?us-ascii?Q?m8vJkF0o0atlxhz7ERsm9ipZe5W6V4lV+TJEc+FgWCOR1pa4ouzhDknBKZjT?=
 =?us-ascii?Q?YLaEzb0kOpbjvflYPGMqLyoeCHR+EYBVtTFapWMOp2OvNMTLomZpQ/s8sGPH?=
 =?us-ascii?Q?OQDMc7N/tyMJJb60dUjv+3fsQM4c6zu0L6FYgrEy0smg53vKcY8iJIPNPN/l?=
 =?us-ascii?Q?0EfROkEpmpmQEC54HBWM/d1TSES8nfVWnZdPmEcyEX+iedYH+20YLgl4DE6Z?=
 =?us-ascii?Q?WrEykr/lNMvD/IuEQ3aD4CzWSeKGN1J0KAk/lnudtqz2mJYv+cPxOXqO4Hmu?=
 =?us-ascii?Q?MZq2HZKEAxZf5NDwmZwQVnNLDoYyhr4o7mzUd1ez+arThfYn2DPwuWogCq2q?=
 =?us-ascii?Q?XoGVfF1bLFgbZ3Xcdjd/R9PRj4FuF1GA6Vlm2ze4xcRTjFsAo69r5hPgVP8k?=
 =?us-ascii?Q?CNk8uQAZZ0FE71QT7PHn5CTsTUbDjMAgDYhirLpzVFyAH1jribQAd0zpo1IS?=
 =?us-ascii?Q?mEzeI1WQ99ICP1HNiSpk4Pl0FZN0CE+kHcj7s2nNjFeLIc7PxM0UVplCvrF6?=
 =?us-ascii?Q?gnAAxoey4qpFDkwTnWgbo0/n8bgbl+7KFFjJ0Zwjafefd7eledxCZ/9/b+Dk?=
 =?us-ascii?Q?XVRa+TZI5M+2Z9WmiPMF5UI9hokZLL/iTJZHJFJIwkcp85PhDlKVhxyLIBCx?=
 =?us-ascii?Q?32BtiekJE9ZA3T2a03TCnTWIlYejdFQ7dUKDXsAZrcxzZxjCwPtzJQQ4waFi?=
 =?us-ascii?Q?AGxroSF5W8m9LKLjRlWkXYBmUv1dUevBK3nS9wf6OUsQKjv24/21D8jPTVzd?=
 =?us-ascii?Q?EfyRsf9oifIzV2qDXtNg2jqvE0Q3ikPt4hNN19yz4Rxp65CB1NDC6MkmUDK4?=
 =?us-ascii?Q?q1lMsruw2w5wHq9jA3bqrRTuGXpiSh6q1zPEJxLdNspW68W5ormiuSKfuYCg?=
 =?us-ascii?Q?SDs1anxvLxEkWnIb8pF+bco3SmcNs8Z/qLeOR+EgWzqGVXRnj9aYweDd569B?=
 =?us-ascii?Q?8BrW1a917YCFMWmyflk/+Qr2RpRvGVIcLfOkwmHV2Cx/eWZF7p9Slg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lyPPWopJPgx0a3umjYvkBulF+b/y3qAuc4sDLWeOzcklixtY1RGU/QeCvHzG?=
 =?us-ascii?Q?nkierfTStY+pFjKGwoAZ0yCC6cZbd0uEHBc/pueHM11++yJMq9ejXWjAJWf+?=
 =?us-ascii?Q?usEKH0afSeS79z8ThCtAAv56EZ1/RfJuLra32qFQVWOw1d/wFZyKmUI+pFdj?=
 =?us-ascii?Q?tR6yrZWoPz+AZBoiS17UYO64e2vBgl/Pz8xnZHBNePxrQNT566AOs7r00CF8?=
 =?us-ascii?Q?Ztet9f93628LB78rcfEK+BSHxisGzIbrKPgrGHr3xcBY/hyhyb+fpNyNWP5k?=
 =?us-ascii?Q?Ry+NqTgzhPuzmpNTLHRaeIjR3dngrO1s1AaYScvQsPC9ICluPterjPd7Rcer?=
 =?us-ascii?Q?nR4W0jkB+66IKMW0KAgKkPqmpon4UqONSRYOY43Lx4dagJZ8lxRDusfeXP01?=
 =?us-ascii?Q?8ffTKo8OZqoCNfmeNQkA5ZAYLvPMrat5klqkaIuCg/NdqWdtH6f8r34OgCRA?=
 =?us-ascii?Q?2NB4quey6Fw878bUgNlmip0GWkkU8FB9VfLjjKEhNtVgb0e1B16zjqCR6Ltb?=
 =?us-ascii?Q?ODGGGyWQULteQu/8H9Fctcr97rTd8qBOzUzfcH06BOYFEZfTK3ibbM2SGcW/?=
 =?us-ascii?Q?fFX0gI0MQ5OOciw/P0a54HLo2QUkq4Vgaj/yUi3db8rsgdBjr+4AG1iE4/HG?=
 =?us-ascii?Q?Mg8qy2SjifojwzVSI+MYV9AL0o7ELdrfzJRhzhf77PQkFhI56U5PUb+YOn1B?=
 =?us-ascii?Q?v0/Ar9i49rT/HEqTotDyAqjFMEVnLdCTQc7WZjHX1sPhtKTRXBQIiC8N6AP8?=
 =?us-ascii?Q?d7KMXO+T37EKZFbVaGVBZ2fqj2VUGhtCbKSzLIxno9Mww7hl/Qco222PpSba?=
 =?us-ascii?Q?3UJ7GJl9C3cxGHBXTeJEsi9zpihNrZyd2jHKOBnF48sen22EO2MUhU70Fc4O?=
 =?us-ascii?Q?4CkV2bXWe91V6A8/rwKwSqKCcUn35QPmeECv/zP6Wpk6xMhi+Q1UjOW/DmFy?=
 =?us-ascii?Q?/N5Y7UnO5NqoV8lqU1zisFbJLnPjgnECDBtztQjqOBRaE0Fpe08MgQJr6NF3?=
 =?us-ascii?Q?UdbXkG3PDcDiw7C/hDI7npL0Dvz3t0kPuJ+mDm2mDr4qC15UR/nEMSamkMfs?=
 =?us-ascii?Q?NHsAHKGLZLg/Fpwb8S5xJc/qopi1vxqSK5QbJFWv2wpiNG6VElN6UxBkPdUk?=
 =?us-ascii?Q?vzuxfPd9tVlUioJCi7NXIdNBjT4HHdt2QQKfXRNt1I03vqV9R2nSEtVQGlb/?=
 =?us-ascii?Q?+cX56d5gRuY9VQfMVgia3we+3Re8MpBhCMeNMjaZlW2mXdY6zHL8TfNbpvtF?=
 =?us-ascii?Q?Y4BUarnE9wceovQCRVY/JYdOlHW89W1/5NANtvXQZM/EfvamylgrEPbptRwO?=
 =?us-ascii?Q?tuQJ2wqnW7iNlSciyfIZzd97BaDWWQSZ1UUrDin1J5DWraeF+zKDu1J+p+Bh?=
 =?us-ascii?Q?r6Susoml1aizUrbzh3DLfZzrcCpCx3QSmKXHexBoBvTVQO6F//GJmxXEp5Om?=
 =?us-ascii?Q?kJks3l6uDpzeANylqrVfyh+hRGRdQ5gZ7+SiTIwALFseiFmaNxJP2HXhG5Zn?=
 =?us-ascii?Q?emDfKXvB2YOdJWQqhOA7x0zV7JVDuuxT3KIRPbg1vMS4y7QFq6HMtPaarG0O?=
 =?us-ascii?Q?XXb+GowmXd3LxVmntXDzLUoTxBoW+DEQOZzf4kd3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72c8bd4-eb70-4ecb-0c26-08ddb3fcd71b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:27:48.0806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZqkFk3K1ZYKhiIiZnpqkcw6AaePJH5Dp++PAkzTnrPFxlAvJXq+nGNJ77M97jmRXUHgwdskuRgQG13kgaZ95Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10327

On Wed, Jun 25, 2025 at 10:22:32AM -0500, Dan Carpenter wrote:
> This was returning IS_ERR() where PTR_ERR() was intended.

Thank you fix this.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 6501843ae72d..3a4645f59a44 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -966,7 +966,7 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
>
>  		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
>  		if (IS_ERR(base))
> -			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
> +			return dev_err_probe(dev, PTR_ERR(base), "Missing CSR register\n");
>
>  		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
>  		if (IS_ERR(state->phy_gpr))
> --
> 2.47.2
>

