Return-Path: <linux-media+bounces-40433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1058FB2DF78
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06C8B1BA271C
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B43A26FA5B;
	Wed, 20 Aug 2025 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kuo1mEZx"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B802229B2A;
	Wed, 20 Aug 2025 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700299; cv=fail; b=aeB8qTm545crkuP/tWskTp6OP1T2MDPjj9zNQA+HzKY+s4Rk+Ne3JQPwrAD1gVPjozuyf4uaFer1Cdb5bPf2LMpfWQOAq7FJwHZp1WYbpl+InzwQM9/7BifEUbBjRMCHP2633ug8b3Oiggvt+snegV2QkUJIXu6LsScIQbTmihk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700299; c=relaxed/simple;
	bh=h/LdlUYn2pk2zZdLnXiTjR0NwRKdotPBjsJ+g4u68f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pHK5fQfTf4BBN8j/d6QVqtWAWY490cg1IyFKAvbtWzbKGb0G948ZF76smlhqmcErAHhd2hLzPMebBaqteUzAtEVgI2w3AftrJM84K7g76tL7KIpq7fZuEhMLSXQZtxTBtJ+s6UvdfMa/jZl2I9D9cwbWohIbMevRHnGOGGbS6GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Kuo1mEZx; arc=fail smtp.client-ip=52.101.84.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oE2ihOkXMMJBKCcf776OIhKGj+U7KaL41R/Nc3cCDq77n4H2CedyoJeQlwhTZWBG/tnb7qzqyNG5idVjUJs8gPXqhj9c8oEfCd3g3+wvJXoekWAbFJ6hMe9qxrf0MPqowGW8/r/HZCCVtGLuyw7r1s5thDjY0iiUBq4htU4YLq/kKdOBAtrGn0kqjvKiPpYSBK1u9KtT4np7jlFSc8cy61Bq/9BkVFU986ablqDicnvPc9NgXKN5GREC+yJ9MTSwnK8wvvz4YF3yByCetcdy1eQXNRa5TCD4Ctpkuvx1bcJ+QpftEsGNCAm/15MaWG9ReAplUdviEMj/+3crUD7aOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhLSVSD3D9eIvUyWhAPH5OgByTcyw38LNTDoqdlhLJY=;
 b=SyXEuAjDnZYMeMhZ68UO1TFJeZ2kWonvQ/cFRQNKr/SskajmmgVP/ey5OmKalWE4PIQcXBFP9E92lGLwmJDUnKpSOyowVPWLfaKr7UquYEcVv9WkkBoiY78DA3a2yVykE1fRE5frGiTwQ9iK+wUKnxgCBiCHxBJUKBp+U/7Pc1wf56WMc0SmhH0R+vvasgu3WENQeN336ddGzPZwsd+Je2sqvD9FckJttRccG39LThMFV2KR5bCsb7XYl8cnIBzRz93e0pa0ePIdEShx9m7H6lFGoAtmlXo3xc3XX3hiEIFuYxynvfcZhOGYgQ1GQ1kMx5fxLMOavByX9c1CIObYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhLSVSD3D9eIvUyWhAPH5OgByTcyw38LNTDoqdlhLJY=;
 b=Kuo1mEZxVu5nl6Lqyk7uZphwWz+ZKFN6cPy1yeXa3wvpJXeawre6IHhJJHvGqXpvtYVgVtcoX3hdWwwO5xuNuZsEg/vXXIYW9eY9rzPt2FSh061VPHCImQ6OowzB5JJn6YjUCWwb9LHfClH1eON/ylQHDJGw6rqhvIKvttCtl5cvOp5bHGuYTp+J+1ZV/nBZ7e+jGGCcx5QVBfJlbH5WYJYpCc4fQ5JJImfG/8k8VaqLVCU5pkfX2TC9obzh+gzBB8T5yXn0LjGpHtOTyVdu6cuJ/pYuj10vLVqo52IBVWxJb6N5W7rEp1LxvglHIxMdYhcOwDBM+xJ1s25uRkVxBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8843.eurprd04.prod.outlook.com (2603:10a6:20b:40a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 14:31:34 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 14:31:34 +0000
Date: Wed, 20 Aug 2025 10:31:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] media: imx8mq-mipi-csi2: Add output filed in
 csi2_pix_format
Message-ID: <aKXcPVQnQzCx6C5z@lizhi-Precision-Tower-5810>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
 <20250820-csi2_imx8mq-v5-2-e04a6fc593bd@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-csi2_imx8mq-v5-2-e04a6fc593bd@nxp.com>
X-ClientProxiedBy: PH7P220CA0055.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::8) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0becb7-db81-496c-08b8-08dddff64383
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?CNBnBWbM4XeS67zuLA31T2KdUIiYLgBSOK5IR/W5YRtn2LpeFtRX82DpTi+f?=
 =?us-ascii?Q?2m4v44M57BBvlidgVqNNj/CLLT5NRCt8c5EPRsP3/RNPHuoefJ+1wJbmPpam?=
 =?us-ascii?Q?92/GBpF0mYvlQhI/5ay9X0ChTxF1D0R3YBwVTsJ0LqpI7oEexbbX6pMPygXb?=
 =?us-ascii?Q?G67jUjQ2zxSXsUWvz7vIdhB/kGQ7JQsJ/+vSpbTnmEOneXPhi+UWDnXrGBOc?=
 =?us-ascii?Q?xmzo9Q2b6A0K/PRSrMEzOTjGZOlWQRzGuYHln7bbpGLTCtL4CdPBoz7QuKFu?=
 =?us-ascii?Q?2yXfMMwwo5BkCmp2kgumioU/VMybiV5R4p+T5x2Owpt4k85p9kaJTNrZwxYu?=
 =?us-ascii?Q?seBm+O98VCBnFt1bB2cQJTQX29F/KdSxmmMGKveoyAZBP9yaOtgRdeJGhmlB?=
 =?us-ascii?Q?++UnNgRVC9q1d+edkKNGkyobWMCqQ0F/4+N4nksa/dJ52f8dncfo8XC80HRp?=
 =?us-ascii?Q?ToJJ6/QuMb+tuA6ZcqEyr8pE1Iasv7YEABTGKfbnf8VIYVJgHCNeYpDP82IQ?=
 =?us-ascii?Q?4SVpytwU0ih10IXz9JXN2XNxWbCk3NL3KK2zHYTzH0NoKuPG5Bk8hvA4VbPc?=
 =?us-ascii?Q?3zuUn5jUpxrCa8MzUukvLVziL03YZ5Ea49ps+bXWTQ5DS95MMNSCRnez3GaR?=
 =?us-ascii?Q?RhJYgnoKq+vnpqsGo47x6R8SeTKJnfvcw+05kon2Obnvd4gk74qJY3V4z7QV?=
 =?us-ascii?Q?ybqIwk48IhrMgl81yULxMZXt95vCsKJ8hL+GaMqeF+pN/Otv8JX/LJ9bfyJ2?=
 =?us-ascii?Q?Pu9fg1+NXcyddYdNroatlXIhkByuy00JbnVIH6nM0FdhViE0cKoUuJnroMWp?=
 =?us-ascii?Q?j8Nv0VdiI4qD7JUgo2h+Qt4ZCsRx0tVdcwiaV2x31vV8EII9vQZncDQ0KU5n?=
 =?us-ascii?Q?LpDDgxMcAF3wmhe+vJG/pOxVzT5uqI6Xqb/pc4dcWLUppYzwXvXXNfvzflJv?=
 =?us-ascii?Q?dtAsB7dJzWAMrY7PGZ0gbURisbuButfx4p+gnYuXYkb8b+W/CTQ8W5REArUt?=
 =?us-ascii?Q?qzYWGL9wSwnd7Up3NmeG/RbenGMu0D5eWsn2C6kd/346JPW4vfMDOp81FEip?=
 =?us-ascii?Q?DH9U70+weZx3l+p6LTukP0B2Kp2glDEPT/PCQoSZ7DwU1U64+jt58rLoH2+U?=
 =?us-ascii?Q?O/mqbNzXOp9Ln9XSSptrgnTC3TgJ1KOyhJW4IrAAxusgLhBw3xwGs73jaJRi?=
 =?us-ascii?Q?E3+KGV1tFWRiIDqJxpeV2LWKJmsImjBHyc1KR0UtneuS5nsHUcMlNaXEJI0p?=
 =?us-ascii?Q?Z2F96IuLfSmVlMe8MIHjtU7iWgYMhcj0fWwD15GvFX/0MZsg8tCEjfEHMVWu?=
 =?us-ascii?Q?7XTOOKUIAISPSOrTDqmQms0EbHnAXAbhwme6eVylwLIZiDCoCwXVV5UTMhYS?=
 =?us-ascii?Q?fAZi1E2R7NEypjrjHgrkKqWPIuSf+ELWHnD7EGo7uOHoX/lw/Cmg+fQS451l?=
 =?us-ascii?Q?GU3/SVaNijVNiDNIa6ptPTsARTdSh7A13DuFsWsHafgCb9gZO1IuKA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?saF8nSxKcCgNFvUsgfuTjt+VfoAuvBF0BxQeh9dSieZQjZAau6VZoQt7uZ4y?=
 =?us-ascii?Q?o0KJzjRRs57eW4JH1nqJFvMYluXfRO91aq+GgK33pKEfInUOFmy5P5QT5mER?=
 =?us-ascii?Q?0qNsfW2ePpzQ0kLWula4oKnGImlxI7wJgk0Uk5yfRu0xak/2GjjJeWy69Gzz?=
 =?us-ascii?Q?7vJFfLNsT81U7Wxf+okcbWRf3euulNIsjerQsYLvrkouRedWY7u1M89vuTwc?=
 =?us-ascii?Q?zBeHlcC3CiKivlFzpH2XMCTTnEspaLStjPhQIPj3CFG3uYKpuCq2/y0wU8XF?=
 =?us-ascii?Q?u3KLDwN5yPj5cVivWNj7cKzqQr7AM2BjtAvQW9I9YbeS9G/gj71XNMcv/ctU?=
 =?us-ascii?Q?oNrAT+nalAAPqeiaVWlx0OMw3VrdBy2lbOMbVe3dSiO0/kRldVwCWwZeATBh?=
 =?us-ascii?Q?IhyV0V79uyMa6iH+wnqNs2WnH/STWRfDTAg0B/ityKeleHLkEgJre6t8kjbt?=
 =?us-ascii?Q?oK9yh6c5hjxGffBs242/Yq8tRCf+96Dh3GIu/uwlutFDyrWX2HQMvnIwMLFT?=
 =?us-ascii?Q?o+qKyYuVPrJWPmUnjx0U3B6VdqTWal9La5vuGU4/Hf7TFyJDlBAFwa8Lqnlm?=
 =?us-ascii?Q?+QchjVCsfNw6wEVkwH1ALmc7ULAYneO/2DMXp6lge7iEyQU/F0XxoPaT76Hp?=
 =?us-ascii?Q?m+MRfOFZEE7uHRPDCbgpvezpGzBZSiVlyIVe95qbaMtZhSs0bTzvFSyzQjRo?=
 =?us-ascii?Q?jRiBGtcfIgWNTLR9zLdMA655qPP4HyA81W2Hq0Mb1pXO8Y7qm+LejeEmrctQ?=
 =?us-ascii?Q?xlFcnMXPhf/co3NQWE8Bq+cFmbzOMQ7K714xXc5VtAUwI1HmiR7sX920GLqG?=
 =?us-ascii?Q?x3+ZdwPG4ArWbO3GBhWCO8KZT3kqAxhHQh+6GiCUG7AKBQvhzDmbwBGCPeb+?=
 =?us-ascii?Q?2O2U5DH21dcVrAyfKCdo3ZPAOqrkVpwco/QeveCThlDrH3E8dBOOTmqhFtRT?=
 =?us-ascii?Q?EqrUsdOuQI2VQxf6zK5tvRlEP9Q5y6dl0nVo/xwM4jFpNQlf2xLseiTBifD2?=
 =?us-ascii?Q?B7Xyru7uWCEL1JHBnJYMwTj0UBKqCRWsQW1kbtEWGHpPxqfXdC+REPqUUPCp?=
 =?us-ascii?Q?nJIeCqusAQh1NaOjEnu+TNa3wChwQJe4XK6e0PDSI3+MmYyhlprN7Wpz9a4E?=
 =?us-ascii?Q?m+xnuCGhT6bPe6tAL9pXhbV4SycaDqtmm/z2XxOPUd3bm6gqH1CurrE/BIBM?=
 =?us-ascii?Q?9sQyrNCQvkNcAwL6cCjz18RpcMIpsibknVHM8+XWs2aoQsU/fAkEWl/8g9GB?=
 =?us-ascii?Q?ENJTGHbLu7qyRPEF/9MzT3Ugdpho2T6c8RZKoMPvRwx0NuA/euGDA9q3C1zP?=
 =?us-ascii?Q?xfSWTVbrOEULiSYQ+wVqsTCiH+VhMbTNWymc7ayq+pFqUwQfwA4Gi8rzzFSp?=
 =?us-ascii?Q?5JH9gFzWjPqek0BnW3JU/eChE0lXlCSSH0L814TU9Zqd/+4Ei3kSEaKdP9tH?=
 =?us-ascii?Q?qM0GMeWksuZNL6Z+itpMtQS8aFGSSPy/zFgt3tS3YqzdeYJA0TW5A2RMafUN?=
 =?us-ascii?Q?xwaEP9itPU02tJ4DT0cbeW5mWE15Ffh0wpBTVz/OBn2IUc3SPI8p/wdIlZdS?=
 =?us-ascii?Q?+oTkU+izj146bFGQokntK9ilY8fDUa5YN2VaniYs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0becb7-db81-496c-08b8-08dddff64383
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 14:31:34.7154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymgn8gEHNQQ7a0Ckn6VlaK1ggS1obS3GzZKBDid0l4B/gMuhVjYU1lXmTYKBZ++kaVLcJ4H6eZENgiXupzSTTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8843

On Wed, Aug 20, 2025 at 07:04:57PM +0800, Guoniu Zhou wrote:
> Add output filed in csi2_pix_format since the format on the
> source pad might change due to unpacking.

Nit: wrap at 75 chars position

Add output filed in csi2_pix_format since the format on the source pad
might change due to unpacking.

Treat 0 as meaning the output uses the same format as the input.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 85700655ecad334c61e9b5f9f073e10b6db2618f..ad7adc677e389e0f35b0cf63195279e197907f8c 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -139,6 +139,7 @@ struct csi_state {
>
>  struct csi2_pix_format {
>  	u32 code;
> +	u32 output;
>  };
>
>  /* -----------------------------------------------------------------------------
> @@ -634,6 +635,9 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
>  	fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SOURCE);
>  	*fmt = sdformat->format;
>
> +	/* The format on the source pad might change due to unpacking. */
> +	fmt->code = csi2_fmt->output ? : csi2_fmt->code;
> +
>  	return 0;
>  }
>
>
> --
> 2.34.1
>

