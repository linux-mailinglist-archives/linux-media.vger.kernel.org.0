Return-Path: <linux-media+bounces-40637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2068B2FF55
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 698524E64ED
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD1C25CC4D;
	Thu, 21 Aug 2025 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BpNNlsXQ"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600682E1F1B;
	Thu, 21 Aug 2025 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755791815; cv=fail; b=mxmSQMESM40ltQJK9tpnVd22PfGV9+wrButaTcM/aKWw+HVoX8qjuokAzS1fdd3QYRzc0YJeIuJo7neNHZxBIaVvt+Nqqpm5P/gSGcE3X9wSH/LWdNbJHbAcDu44yDF27Sy+PT5VDD9jBGl28PsH9Bg8CmjJdg3s+8FJw3jN1KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755791815; c=relaxed/simple;
	bh=3KGm5YlIi3yPBkf4+v0TKP9n6ea/6Q98xSg48D2HOk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=njVJsbnoDSHHbkA2R4a5BiW/wKm/KAHWM4UEM6f9x5L63vstgQe23jI90GSFR1ANkGp2IHd/lNI0Pv1z1JCig+EJn8UpFkGXgckdgUygEeEwC6thHZRoOO5/BX0ro88huQyExxQ5963ef42k1dYKjYlVM2s6K7CCF9l6LajnmHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BpNNlsXQ; arc=fail smtp.client-ip=52.101.69.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AN58RgN0+vRstWsl2sKzctTqYC6umKeLWf2kIBHoYMuLzMfrjdhh17Du7UgfliHPGYVrtEoN9w9smptpGG18jYZOJgmkN7Azcabzx57Acv5dDluu035rf1a0lkkMS1loFP1PAjlrPGrmr1YkV0U3mNDbE7xlhCXg0yhovg6CXUBvy2UlpikJcInQ1oCY646QO2Ei33/eknY+51+dcjvVrcUgIWWMXD4qRHoQb1O1wMKg5TSRhRrBMyNtEl/OGbQLB/FkcYmI6YzOms+qRYtO5yyzGnpt9b+SQvftYAKE6TnCIwF1pCquu3kZbfQkrpyEAxNeEPNdb+srZte4KbCNZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvD2j9T8g4a5ddqgbo/wuZLhL8HnH1apYGMowne6UGo=;
 b=yFbDBxxBGZchktWpNYFCe5UWDzcrgQ5bJD7Iivr5BE1Bgx2gW3vzUgpFLB70g9yIweDMddpgS+L9su843SZEqtzm9RsNzA1wVtrhZR8hKpKzFER9YvNGQmOj+SM0s2AzgTEs1hpeqvVrXV1l4N04hnnHc6qBM6VFZp5HY1BYTB0tNWYRII+IchLijETu8WqAOeKkTECUr86vw5W4j90K95bdF79J4HJkH4gPHYaiLOvN7sjX0rGh1jj+J69j21DDtE80qIpDQOS4WUW5rCbjExWhQ7dYge4opwMwXRU7lXzTzSxmHiogc5b9WJalXdk4Y6CCaxpVKHw3gh7QdsToyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvD2j9T8g4a5ddqgbo/wuZLhL8HnH1apYGMowne6UGo=;
 b=BpNNlsXQIzO4kfgUIXQvLDSQvL55t9N0CW48zCMyXL6H3pcKvxCGaiuEBV3tl7silLthDzFvWPqtNAGo4r0m5jMnqyQrLRBmyebCl3XVuwVNwgXaRJOKJ8Qs55IG0D8Hwz2zpME7flPPUcDBRjfvsQ3baoEmB5GI9Sl9Aw4h03rtCrgAexWQ6nTP71cuSNGqUdWFDfe1sVLOb7AsHXS087dCGJDO2bO1prwIfa7ikCI96d7nyVBTuyrghb6Tsw6FDMnzMFyKXUP5D9315quTL5WJfZlNsDDl4tFDxCEO6PwO6fuQENpBoDIQmcX0QK4vSdPmLUtv8D3hSRD47Mhc1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB9789.eurprd04.prod.outlook.com (2603:10a6:10:4ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 15:56:49 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 15:56:49 +0000
Date: Thu, 21 Aug 2025 11:56:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/12] media: imx-mipi-csis: Initial support for
 multiple output channels
Message-ID: <aKdBu9AQfwxl8b4I@lizhi-Precision-Tower-5810>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-12-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821000944.27849-12-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: AM0P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: 496188ee-ccdc-4f38-a520-08dde0cb5682
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?FH/Vaa0irnePAv2IzvGs44lMYYwewSCJ+G+1yEM7vjE12WCF1u9GY9xNpp/i?=
 =?us-ascii?Q?UFGHF5OFSM3aAeiWCx3hvZQlEi7bJ9Tju/vEWjBO4wdBvuX+mRAN2U3t9ir0?=
 =?us-ascii?Q?9fxbOsmuDN0aOskTSGd55+/y/645sA8rmLMcPL9jBeBLqM6IBNyWr5j0RK6y?=
 =?us-ascii?Q?RCs0CDq670zRLgjV8u7Op71s50VKDURYwpSVaDAtdI0Rd7hRDp+l8FrA4eK5?=
 =?us-ascii?Q?c4VjQpKZLr9DvFnWDGxIHS2X6dd6AqXkjrrF7hsaX/1ZYGUHN+U3/KLBm5vE?=
 =?us-ascii?Q?qKmkdc/44zIy/uQz2BxuzR6HuGK7d1UcdGY6aOjaeX0ifOSGM/4NIm38CGpZ?=
 =?us-ascii?Q?P4apt1v3LBWOQIzUHo1NSfHhjdquD2s0qh8S54CTsBG3h9SZz9+DXI+6CBeT?=
 =?us-ascii?Q?5HFwueiOrhX+cIOvR2Sm4v/XRN0v8xK21haEGzgauyGMo4n2yM7hYV2X+cBs?=
 =?us-ascii?Q?9ySFy9CRUJmxjfxB3+pe6sdl/JUz/WtLbAniw+s54pZ/1bo3DUJ4nCbK/YGz?=
 =?us-ascii?Q?bpyLY4ayMO7asnCkVnbyOcV1KkD0tgoUoTfhIefuCU05e6KKMqtrPyVeiMgq?=
 =?us-ascii?Q?N8savaF7bpL+3Vp/IvBhh3viuS4iVqF0ymAHmz/At9sGu+FS9iOonJE4FZtB?=
 =?us-ascii?Q?XuL/XWF1yPihtC6+V2IiZrg7diPOK8hk5ij5ZLGsAglqjHDbaLJHv3fC7qwN?=
 =?us-ascii?Q?tPmFqMnHK0HOdAkUnVmv22nhbq/gbg6Ttw1+XyQP5T6CInQxxA/fa05UG9OT?=
 =?us-ascii?Q?wR3+KR8+0PmW9iqWFF+NH0i9aPCy3Qc5p+T9YxmudFQqZQrcc7XzxqdO9w9C?=
 =?us-ascii?Q?+9t0gba9z8YmGgYnHPBxMNDo7h8y/FTNO3v1m1fV1+booihtfQKB3LzA2Nxs?=
 =?us-ascii?Q?w7cqBPoKd5arsLnaEQ+gAeHAeOxT7xca7A8dXR1iJTbkZCpL20VNzdFaZFWE?=
 =?us-ascii?Q?NbgUw0PeiYFPxRj/cDIrbNW0uIJ989AypYAS7xfCZRgOo02Fj+jXBkEIKh/l?=
 =?us-ascii?Q?fLvPyCEmESQWPqCl82ZgrkYrjVKdwlDwjAstzsChWIbMFrdWdUWHaqTgd5nr?=
 =?us-ascii?Q?mEKMEaw61QqKZ6CrpL5QMaQPstUVVnZxrS8JJhClwcVd6tQpjURqZRrlK2mV?=
 =?us-ascii?Q?FoQEehp3LpXPfcf9SjGhVdhNRVxP1QK9LklvH3PwFRsR0cs/Vx6gyeKQgwPL?=
 =?us-ascii?Q?XhJFYWZY/bSk9RUSvx4JfE9juiSrk53/tIeDegPRz4zmMdNGbvnGAHk0P6ls?=
 =?us-ascii?Q?42WFbKzNRGuqie8DB7SQGNyIzgeSy4wSV5Srm85KqsQiX+gsOOpTVCowd5WR?=
 =?us-ascii?Q?QHyNZMMmReB+NR+F+umII/LPzDXz9/prZFHodJh9pDxgsF3ZULwfHnG093tc?=
 =?us-ascii?Q?GRcufm2JUM+zQz3PReRXzPe7lMqFsU86oZa2AAx4+6uzoC/VaOxv8sKnYl6s?=
 =?us-ascii?Q?hXltgg0TA9jsO7I0Pdua1EEP3czz+2kxWOfeOa682qftVRDfVlKmLQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FBfBQ+DctZ7jrftSpPz3pP+yImj9SlTJy1lWYkdlDoNeNYGDhy9Cu4ppnWEU?=
 =?us-ascii?Q?G9E0jN2O4jGMdo8kh0YK2FnNeXLiDPZYfoWnM8GIfV7GCG/rVXxWsyOltH69?=
 =?us-ascii?Q?Hu2jhEjRoCuVxnBDrBP82msOb9WEUr8S2pB3bNe0gfp201wZMvVr96mgYf50?=
 =?us-ascii?Q?moiMfzQjJ1Ib24gxZbLpQXaZGerVPQhqW6UGzid9FG9AexN5zTNksaR0TdRT?=
 =?us-ascii?Q?ltcO/TjAoHJNZcRww1M+XlCUtfvg/i9lCv1rspTEaQCwpt6EJ0mpq71Qag1V?=
 =?us-ascii?Q?JGlkZkz2aZhMjXlR1/Bf46+d1kCp7HFI76/wNH89W8TxpGxgCITHs7+8zyVF?=
 =?us-ascii?Q?ChtiXUzTXGVOH1KdqKZ0e4CfplvjPpLWyRJ/QNbGIXD1sYFWS46Q7zslUh4J?=
 =?us-ascii?Q?sdyIOJja1XJAoO7KIUOVm1Y3vnq9RF2l4JxtGzcyT+MJ/w7yYkwcMNiSehdy?=
 =?us-ascii?Q?R8E4iHckSkV9v20y3cHSmlpH9USUZoHxwmbHcOVNXPEE2KohM01OFgryS52g?=
 =?us-ascii?Q?UizcoSWqQTiN8zkAMU72wA4MZhYh/X11/bejXL617WGr/idI/0pzRgl5Fr/O?=
 =?us-ascii?Q?4EXs5Jnym5V6QUF00LxzXg5yBhoYOVUf5EdMMvEh9XvRnOzG5MVesNQUJ5XL?=
 =?us-ascii?Q?7SVP++3WWc0ACZ4j9nb5qL9TFLDsWiR45ykVbeRU9zPgCQW8KPYtWdAbyXx1?=
 =?us-ascii?Q?rZQGiGXnb9AwSuoeRTGaGxulNNKq9QMNehbMEBvvIaDEo6MCTVNyUGkn6XPA?=
 =?us-ascii?Q?ZYw/+V2IsfPjlma9Y0a+UPsVmrfrMqI4yXUmLNXTMcEt7Q768qA84TkWc83O?=
 =?us-ascii?Q?i2NR6tjjeFMKzxz/jKqgvW79KnZ9Pd9CKWC5F3MlHda8c4f+gMoxvtUZ7dlT?=
 =?us-ascii?Q?pvPsRNgDZzS/aawStIFna7uCs+CF6TCyBJo2RaiHsQKGIL8QxSs3cC28eI6d?=
 =?us-ascii?Q?qYwRZSATbnXW2tnpq2Zb8gKMCzhUoai51vllIPz1bcsgPpWPKU2s/0iJYodB?=
 =?us-ascii?Q?Vwfj5l+iMpiD7jq/ctz4XpidhwSV097pLMOjg6qOq+wufjxOYs9H6kWfmXZt?=
 =?us-ascii?Q?2T33zZUqjpWPdBwd+yGlul7QpSHcKkTuj1/MVNfJrUcjvuLuGJC1P/aqfQe9?=
 =?us-ascii?Q?tB7w/GKfksYhdLSsFzGlckWrzfnzWuCsfxkaZ6qhsvJ53ZzukFuqdOl77pb1?=
 =?us-ascii?Q?bpaH4AbfM1E6g0ELv7Kzaw5Qy9rqoJCWjcAtLzI2a7L9r9feylwawtpJjn7K?=
 =?us-ascii?Q?7Zvgz9C8dEeBvTWh6QQ6W9V4ppnxsMIP9WNqSRoX1BwxoqD0kF0BePyPN47Y?=
 =?us-ascii?Q?K7D8/E2VCrjUL+dJcMu11+sq9yv72Ccc8D0JkCAVNMlzMhkKcctRfdCql1RX?=
 =?us-ascii?Q?bQ0GOguyiqp3bcHHTXWAHyzM/gzbk0J8bjXyGGtbUFWllgDwetwcTl1RLuk3?=
 =?us-ascii?Q?jayFLmjMXg8kAupqOV+dbEsGNthg8HKcM1sbxFVqLgXKLSj/VXfvVzf2g5/1?=
 =?us-ascii?Q?PoW+iRJ6sMfH2FuINXnYkhzmw4RyAgQx83SwwN5IJtoK+VKfSyrwnvGdQmQ7?=
 =?us-ascii?Q?ImdZse1us+ew4khuFxAoeqMAktbaurvf5r/vpjpf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496188ee-ccdc-4f38-a520-08dde0cb5682
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:56:49.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Av1KtIhuWh4WUjvdzJGj6sV5rBDrw7lHZZDWDFDP8czHGu/lDvc4RPk9hAOGiWjJ7iEGn3DR+YR4o05yHNZ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9789

On Thu, Aug 21, 2025 at 03:09:43AM +0300, Laurent Pinchart wrote:
> Some CSIS instances feature more than one output channel. Update
> register macros accordingly, parse the number of channels from the
> device tree, and update register dumps and event counters to log
> per-channel data.
>
> Support for routing virtual channels and data types to output channels
> through the subdev internal routing API will come later.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>
> - Update more per-channel registers
> - Update commit message
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 239 +++++++++++++--------
>  1 file changed, 152 insertions(+), 87 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 83ba68a20bd1..b1136336a57f 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -54,7 +54,7 @@
>
...
>
> +	{ false, 0, MIPI_CSIS_INT_SRC_FRAME_START(0),		"Frame Start 0" },
> +	{ false, 1, MIPI_CSIS_INT_SRC_FRAME_START(1),		"Frame Start 1" },
> +	{ false, 2, MIPI_CSIS_INT_SRC_FRAME_START(2),		"Frame Start 2" },
> +	{ false, 3, MIPI_CSIS_INT_SRC_FRAME_START(3),		"Frame Start 3" },
> +	{ false, 0, MIPI_CSIS_INT_SRC_FRAME_END(0),		"Frame End 0" },
> +	{ false, 1, MIPI_CSIS_INT_SRC_FRAME_END(1),		"Frame End 1" },
> +	{ false, 2, MIPI_CSIS_INT_SRC_FRAME_END(2),		"Frame End 2" },
> +	{ false, 3, MIPI_CSIS_INT_SRC_FRAME_END(3),		"Frame End 3" },
> +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(0),	"VSYNC Falling Edge 0" },
> +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(1),	"VSYNC Falling Edge 1" },
> +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(2),	"VSYNC Falling Edge 2" },
> +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(3),	"VSYNC Falling Edge 3" },
> +	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(0),	"VSYNC Rising Edge 0" },
> +	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(1),	"VSYNC Rising Edge 1" },
> +	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(2),	"VSYNC Rising Edge 2" },
> +	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(3),	"VSYNC Rising Edge 3" },
>  };
>
> -#define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> +#define MIPI_CSIS_NUM_EVENTS		ARRAY_SIZE(mipi_csis_events)

unneccesary change for this patch

> +#define MIPI_CSIS_NUM_ERROR_EVENTS	(MIPI_CSIS_NUM_EVENTS - 20)
>
>  enum mipi_csis_clk {
>  	MIPI_CSIS_CLK_PCLK,
> @@ -300,7 +334,9 @@ struct mipi_csis_device {
>  	struct clk_bulk_data *clks;
>  	struct reset_control *mrst;
>  	struct regulator *mipi_phy_regulator;
> +
>  	const struct mipi_csis_info *info;
> +	unsigned int num_channels;
>
>  	struct v4l2_subdev sd;
>  	struct media_pad pads[CSIS_PADS_NUM];
> @@ -655,8 +691,8 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  			MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
>
>  	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
> -	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
> -	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
> +	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC(0);
> +	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(0, 15);
>  	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
>  	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
>
> @@ -673,7 +709,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  	/* Update the shadow register. */
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> -			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW |
> +			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(0) |
>  			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
>  }
>
> @@ -764,16 +800,19 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
>
>  	/* Update the event/error counters */
>  	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
> -		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
> +		for (i = 0; i < ARRAY_SIZE(csis->events); i++) {

This is nice change, but I think it is not related with this patch. May
need sperate patch.

>  			struct mipi_csis_event *event = &csis->events[i];
>
> +			if (event->channel >= csis->num_channels)
> +				continue;
> +
>  			if ((!event->debug && (status & event->mask)) ||
>  			    (event->debug && (dbg_status & event->mask)))
>  				event->counter++;
>  		}
>  	}
>
> -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> +	if (status & MIPI_CSIS_INT_SRC_FRAME_START(0))
>  		mipi_csis_queue_event_sof(csis);
>
>  	spin_unlock_irqrestore(&csis->slock, flags);
> @@ -850,7 +889,7 @@ static void mipi_csis_clear_counters(struct mipi_csis_device *csis)
>  static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_errors)
>  {
>  	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
> -				: MIPI_CSIS_NUM_EVENTS - 8;
> +				: MIPI_CSIS_NUM_ERROR_EVENTS;

I think old code logic is strange. err events is not last trail of events
array. when non_errors false, only last 8 events have not logs.

And I found all place call mipi_csis_log_counters(, true) in whole driver.

Frank

>  	unsigned int counters[MIPI_CSIS_NUM_EVENTS];
>  	unsigned long flags;
>  	unsigned int i;
> @@ -861,45 +900,67 @@ static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_error
>  	spin_unlock_irqrestore(&csis->slock, flags);
>
>  	for (i = 0; i < num_events; ++i) {
> +		const struct mipi_csis_event *event = &csis->events[i];
> +
> +		if (event->channel >= csis->num_channels)
> +			continue;
> +
>  		if (counters[i] > 0 || csis->debug.enable)
>  			dev_info(csis->dev, "%s events: %d\n",
> -				 csis->events[i].name,
> -				 counters[i]);
> +				 event->name, counters[i]);
>  	}
>  }
>
> +struct mipi_csis_reg_info {
> +	u32 addr;
> +	unsigned int offset;
> +	const char * const name;
> +};
> +
> +static void mipi_csis_dump_channel_reg(struct mipi_csis_device *csis,
> +				       const struct mipi_csis_reg_info *reg,
> +				       unsigned int channel)
> +{
> +	dev_info(csis->dev, "%16s%u: 0x%08x\n", reg->name, channel,
> +		 mipi_csis_read(csis, reg->addr + channel * reg->offset));
> +}
> +
>  static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
>  {
> -	static const struct {
> -		u32 offset;
> -		const char * const name;
> -	} registers[] = {
> -		{ MIPI_CSIS_CMN_CTRL, "CMN_CTRL" },
> -		{ MIPI_CSIS_CLK_CTRL, "CLK_CTRL" },
> -		{ MIPI_CSIS_INT_MSK, "INT_MSK" },
> -		{ MIPI_CSIS_DPHY_STATUS, "DPHY_STATUS" },
> -		{ MIPI_CSIS_DPHY_CMN_CTRL, "DPHY_CMN_CTRL" },
> -		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
> -		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
> -		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
> -		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
> -		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
> -		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
> -		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
> -		{ MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
> +	static const struct mipi_csis_reg_info common_registers[] = {
> +		{ MIPI_CSIS_CMN_CTRL, 0, "CMN_CTRL" },
> +		{ MIPI_CSIS_CLK_CTRL, 0, "CLK_CTRL" },
> +		{ MIPI_CSIS_INT_MSK, 0, "INT_MSK" },
> +		{ MIPI_CSIS_DPHY_STATUS, 0, "DPHY_STATUS" },
> +		{ MIPI_CSIS_DPHY_CMN_CTRL, 0, "DPHY_CMN_CTRL" },
> +		{ MIPI_CSIS_DPHY_SCTRL_L, 0, "DPHY_SCTRL_L" },
> +		{ MIPI_CSIS_DPHY_SCTRL_H, 0, "DPHY_SCTRL_H" },
> +		{ MIPI_CSIS_DBG_CTRL, 0, "DBG_CTRL" },
> +	};
> +	static const struct mipi_csis_reg_info channel_registers[] = {
> +		{ MIPI_CSIS_ISP_CONFIG_CH(0), 0x10, "ISP_CONFIG_CH" },
> +		{ MIPI_CSIS_ISP_RESOL_CH(0), 0x10, "ISP_RESOL_CH" },
> +		{ MIPI_CSIS_SDW_CONFIG_CH(0), 0x10, "SDW_CONFIG_CH" },
> +		{ MIPI_CSIS_SDW_RESOL_CH(0), 0x10, "SDW_RESOL_CH" },
> +		{ MIPI_CSIS_FRAME_COUNTER_CH(0), 4, "FRAME_COUNTER_CH" },
>  	};
> -
> -	unsigned int i;
> -	u32 cfg;
>
>  	if (!pm_runtime_get_if_in_use(csis->dev))
>  		return 0;
>
>  	dev_info(csis->dev, "--- REGISTERS ---\n");
>
> -	for (i = 0; i < ARRAY_SIZE(registers); i++) {
> -		cfg = mipi_csis_read(csis, registers[i].offset);
> -		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
> +	for (unsigned int i = 0; i < ARRAY_SIZE(common_registers); i++) {
> +		const struct mipi_csis_reg_info *reg = &common_registers[i];
> +
> +		dev_info(csis->dev, "%17s: 0x%08x\n", reg->name,
> +			 mipi_csis_read(csis, reg->addr));
> +	}
> +
> +	for (unsigned int chan = 0; chan < csis->num_channels; chan++) {
> +		for (unsigned int i = 0; i < ARRAY_SIZE(channel_registers); ++i)
> +			mipi_csis_dump_channel_reg(csis, &channel_registers[i],
> +						   chan);
>  	}
>
>  	pm_runtime_put(csis->dev);
> @@ -1422,6 +1483,12 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
>
>  	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
>
> +	csis->num_channels = 1;
> +	of_property_read_u32(node, "fsl,num-channels", &csis->num_channels);
> +	if (csis->num_channels < 1 || csis->num_channels > MIPI_CSIS_MAX_CHANNELS)
> +		return dev_err_probe(csis->dev, -EINVAL,
> +				     "Invalid fsl,num-channels value\n");
> +
>  	return 0;
>  }
>
> @@ -1445,10 +1512,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
>
>  	/* Parse DT properties. */
>  	ret = mipi_csis_parse_dt(csis);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> +	if (ret < 0)
>  		return ret;
> -	}
>
>  	/* Acquire resources. */
>  	csis->regs = devm_platform_ioremap_resource(pdev, 0);
> --
> Regards,
>
> Laurent Pinchart
>

