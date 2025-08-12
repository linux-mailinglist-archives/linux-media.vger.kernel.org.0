Return-Path: <linux-media+bounces-39609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A84B22D06
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 18:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FAC11886924
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 16:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749D7299950;
	Tue, 12 Aug 2025 16:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cBjwabI5"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FDA305E08;
	Tue, 12 Aug 2025 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015195; cv=fail; b=UuggkqKYJpplRP6X3XxzCIYKyce/dWllMnt+dayO9FPimU4e42kQJsbouSLwEVSud6/odi4bu94wR2HDnj0t8oWH/asF61kObQlbiWsHuMZtJMA/luu+G/yhh5CL9CxrZ89FCF4a74ELw2ezSDOzyPrcVnzpPT9k8ScaqEL/M9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015195; c=relaxed/simple;
	bh=vArNtc1nHOgt64POvENaexx5x0kr1OF7ojI85bpyB1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pxHAk0DeAurMkwAabqh2ITVwUID8pQFYiTtTeB/GYxc+trvl5PHj1C4LmohQ3xuJmvhKg50UjMqj/bmPAmLNXI83edghwt1dumuUciK6O3T48FiFpWYBp2lQNsE+LaMjLm6J5OVmQQxK1gKOu2y8UFerSy01IXNM9d/ZeK5HfGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cBjwabI5; arc=fail smtp.client-ip=52.101.70.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SO8irVjO9pCv9eCHk41MvOX5IWhiBJ2/UwiN2cwu9Dp1qZDypmGzME0oXTEmUuYa1+5yw8GDCGs8q27o63cDVkyQeMYPZaFU2YgZSHTGTvNKQLCyaRzdwwbYe9fb4+I70aDhBTs584X1VMNNzF5rj7vovIZDajHEYoLHDt1D2r4p9nxfxdfhgVKYCSRDJ9VWnRUc2SxbWGctDI3hQV8NdQe9Fw3s+CgadGjbYjzf1U2nwZOorSWTfakw5/FxutBzOkR4IJSQOgWLfIhIk06EhgaxUX8mCC5nV8tyuqalM50tu8yHdX2fQ55bcdvCmbfOiEzTdnZDz5OKhkE0AUzueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/sD+PQ2B2uWVW5s4K7GsR/Pdx1mP4nkfK9kZRwCT5c=;
 b=ZNXnmSKPz3avtqwpzH6lHGmhOCKi4UPKXHDv8wKz2O3QELPzyY2pvo4J5E3tK24S0icbEKbYpRCI1zVUV1GM/WTlDvGj+fGVcVS/SmRY1QQ9tp/wNTbtKTKd/XGzZsJM/qpEfA+hB8LY+OVMb2Ru7uTOHF/+rEr31DD80kt4NBvPU9A40CAcYuOHEm6L8p2Bzj+D63Y9PHSMcOGuSIhHPqU1J1wYCjxIZjgOQwn6gSww+l/nd685h8OoDB4ccZq25fpgisVygqa3E7xDKp1mvvYN1qPh1y6qbP2O6uRsRYbNKJolDytsFaBYe3a74rg0z2r4RkgICDDSAwm9HPI/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/sD+PQ2B2uWVW5s4K7GsR/Pdx1mP4nkfK9kZRwCT5c=;
 b=cBjwabI5o0LJz17mr4GG2Y0tMhn/wCcTTo4pVWYs+Cxjvr1e9RS/4Rgst8jysT2VNfPVB1rC4T9HdrDsSpivBZFoTWoB268rgvDp7Sl4f42HEPlZlagxLZKqrmaXGPnquLf7YDn2wlO4y9bCDCNSmh3wx9RHHFdkhnUDNmB4rFwPsP2rics5leH5DC6uJf6g198zqmu01vCMO2KTA0RzAnmIZe/ir/mQ6NpsSVuHKaURjCeRON/Wu3eP1NG6HO5cUeknkA5Yp5QaVROrq1BuDymhRmC94u9Z7bxJcTM4bNk266Z80/4cwlco6CaLISF6oDwaX/sG/mgh8OaTsxaDPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10712.eurprd04.prod.outlook.com (2603:10a6:800:261::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 16:13:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.011; Tue, 12 Aug 2025
 16:13:09 +0000
Date: Tue, 12 Aug 2025 12:13:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH v3 1/3] media: imx8mq-mipi-csi2: Add data type field in
 pixel format
Message-ID: <aJtoDVBUUHyPITQS@lizhi-Precision-Tower-5810>
References: <20250812091856.1036170-1-guoniu.zhou@oss.nxp.com>
 <20250812091856.1036170-2-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812091856.1036170-2-guoniu.zhou@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0060.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10712:EE_
X-MS-Office365-Filtering-Correlation-Id: d9716e96-9828-4236-85d0-08ddd9bb212b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?YR/eSo7NaJ58Y6pX1pWhYTxVfURm9T+JM9SRXBtTBUjpLzMgPihhGqlf+5Sx?=
 =?us-ascii?Q?ZcTgOcKuYZFJ42lSKhh+T97KffYdDKFsnLaw+mdkHG5Qd1Kx4RH1dwlqD4V7?=
 =?us-ascii?Q?ZpC0ej5BDaiv0QW312Sl6k6Pem4KRSP5T/bLnA1L0z8/bm0T9jo6JxhI7dc7?=
 =?us-ascii?Q?3i1AKnxPTQefD5DyhBGSxTE3O88/yWGxHVtEE/evt3H+82nWPc/DsVsXRhtR?=
 =?us-ascii?Q?55MPQKDe+P8iBn9adP9B8hGHPAFy+rThplCoDSEsSqOQvH5elX2vgLIcQ497?=
 =?us-ascii?Q?AKL3eRtb1taRxTpykDbWCro0b6TCTns8vVghzIqS8pHnSz3WC1XaOThqUdPG?=
 =?us-ascii?Q?BiTeraAxOaq7Jz4rcwZ/9lNmomQfPoYz50K57ZyKe6LoHAfXt8Sei0rSnf6r?=
 =?us-ascii?Q?1JwQf/WyH8irLDDeHF3jCLPJRm1sPMAJxQ7+rKHglV+ZhQpzCT/56ue5fWnd?=
 =?us-ascii?Q?fsCIaxdX8ow8RK4UWxjRs+gsYGU43SU2sXStDl1DfaswaZLHhXJ0y4mFSjLY?=
 =?us-ascii?Q?GxNojFaLeyyh1br0h4NOKUL0brGc5gYzbg5wYai4xoMciqmL2M9W2006a20H?=
 =?us-ascii?Q?04nklJCTQcsgmSe8hFOcZ3SXIWLqcwF9s4Hmy/JfAu2z34Tqqq+Nez6a8/Sp?=
 =?us-ascii?Q?Fce+N3qZBPfdKjuf6r9HuyVNDG41njjTJV43Bdk6oYJ+SVUUXbwOCk5hVDBZ?=
 =?us-ascii?Q?EkXbWLEwe7XzusYWWNoLj6XFhY2NeWgYlTzIYvG5qOkYXseJJxlcsKhYraX1?=
 =?us-ascii?Q?wDkDKXeTQ9WcvTq/RikGi3DoouZyVRu82r4Wx5/HcyIXmwDJ568o1y+Vw/3Y?=
 =?us-ascii?Q?FZO3sGU+W+Q8vVNyQXWVoOYl8PDwV+99UjB6QGOG+aLqtF7eP6rV0aQ/ug+t?=
 =?us-ascii?Q?xhmA7fw3vj44HjdAXkc24NjwTaQS2mPo66+qP7pt5CeL33xEQej1xxJTjA+g?=
 =?us-ascii?Q?/iI+g8goy6CA+Q7m322MQAZUP7hj2dHEVqqzU6P0qdmaYFF+XEjWyPhw2x/y?=
 =?us-ascii?Q?ZqygfW9TK8xXODROoT7v6v63mIvMxi+Fk+omhwkfyh3neMAAY2/TH4mL+4Qq?=
 =?us-ascii?Q?+X7DZnf5rWVlTfjajohZpsId5fyZuiygL2RFuUiRIuaCdnhkaZBnSA5HoqPq?=
 =?us-ascii?Q?m8BUBS4yKvNzaqln/8H0frUFpgZ0btbbHNN1+HFUMrsy4X+lrYAkCluk3Dwu?=
 =?us-ascii?Q?AbfhUAGKjrD7ri99Wpk15GMutMGv9Og+UcHuTFkc0jr08j3vS7EwqyXpY7Js?=
 =?us-ascii?Q?MOeP5PUJ3z8u8Vswp+xZNTbf1lbchGMa0N+mK3hyghAiQ3SMM7ijjbv3uIxO?=
 =?us-ascii?Q?Gx1tRSV1efSX62D62Jq64BN9el9MQWZzMLc+dj42SnMq5VB7IItzHqRp5uMZ?=
 =?us-ascii?Q?hN2/R2a2qnNnOUnfI3BTn9iCa680uKpXwwl/lM9o3MNZq5KKAUNDoYaBZt/R?=
 =?us-ascii?Q?jR5x6iRYi8t/MQCFMc+XAQiApCo0czHOk7jB+zkWG7KaJHoYzwNn7JbPTcxX?=
 =?us-ascii?Q?LkFJ1fZJjfdAOMM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2e131rR8fknAgVY7Yd5oY6RkJauxdNKH0ZkHZkUYTcvdAZ/KXKIgsh2qVZZh?=
 =?us-ascii?Q?QcfEBjjtpTrZVohHzyheauOWXFvea9wnDfTXaK/HMv9uPE/o5tLnrWRzXKZ5?=
 =?us-ascii?Q?HZvJnIhEWt+paRJ3sxuQTfRmPwQQV+bDjuMZ9N4GJp/hpg5s+cXbQqQgUf6F?=
 =?us-ascii?Q?tE+Bdfc+izF8k/z8jSoOMFjMJo9Q1+opsON50BCvZGG/IlYtQelfNZT0gWSL?=
 =?us-ascii?Q?rtTbsl27+Ps6Dv5HEbs0nhroLUXPbs3zN6p0+uHI9PGCJ9A7pdQO7ZXTUhUM?=
 =?us-ascii?Q?e+G+i13FwfUMZkpZ7LIZkQw2/5VJhTJ7Qn/miarbva8lqZ+Rbk/WYw25GFrl?=
 =?us-ascii?Q?o7nQkjPKaZPi+MW+9xjsJsb3N9V94g1A3cfk2TkBtjOm6wNo55afrk9M4Xn8?=
 =?us-ascii?Q?oyEVx/UaL1M8TzBTedFT1h5r2UABExNM7kxr9QjysLa6c4/fAr6Dt74LloOp?=
 =?us-ascii?Q?1+UH2RPCSYqamjODORJov//wS/qnMuhrHNsOTK4pOGS9aJ6FjeZuUQt4hQuD?=
 =?us-ascii?Q?NRXyQqKbvoQEdy6eU+k1JLSE+IL2l9Dit9GuBLqYT7T1SRYu3j0/hsfkHhjq?=
 =?us-ascii?Q?U0rO4R+ZdLNGcY4fRxYfLluBRSfvehMkQshlSmNjx5gt4RFirzkD3+qyH/5A?=
 =?us-ascii?Q?UjNSjPFbT64/HEZt0yJizKlB5fGMbt9xi6n4fyvSrob9FN6BCynxtTv354rH?=
 =?us-ascii?Q?is5sLumxJuzAmBL6k7DdtzCy7Fui3mNQ3/wzluhkOm2qjUVmAld1PGSKGeps?=
 =?us-ascii?Q?lv72Xec4AdQFjU699J4v92clrUrwwFANm8Nv8wkxbhz9KC+J6wKoGB6hvq2Z?=
 =?us-ascii?Q?lWqbUjZyUqwEztVjQD6dcjfP6SrbIa780xEdjsAGt0R84eVZ+XYvXCoqVehR?=
 =?us-ascii?Q?M/Ws08JLA/brxZdAkngjT8BCHcJlsMcGKfVBvXU2cB0F4OWlfxCtdiIue+hX?=
 =?us-ascii?Q?XOjLAv4gS4EpvrMDQdTzXg2pDC1ciA0/dZGEG9NWqmP9sKQcNZwTpOpFEsvu?=
 =?us-ascii?Q?WSdKPmRiYM7b6PnANEqreNQj9/YaLA572Gb2wCcUgz/zo+fKz9VIhq4d2VJx?=
 =?us-ascii?Q?JRNiUy4u1fAGgyylTPsI9jvJqq05tEokBf6wc2oU686wpscS2aQq2hETZMZk?=
 =?us-ascii?Q?wQIqh0DQxSSmh7WEo2+doZL0NyCrdAmB4Br9N5q8N5E+WUaMxLmmuYd0ADsL?=
 =?us-ascii?Q?VqvkXO8it7lzEISYtDCyO0hC61p6PMCFE9oUiAYernz8FULPVxkc307rXULi?=
 =?us-ascii?Q?qwXw4OIbEKpmFZRbNWP2p36KB8RNiEMEhQUZ3SoM25PJbcUB729FtjKQsIJc?=
 =?us-ascii?Q?ksqHd1gT/akuxvQl90JDbA4wrERwIZ3irHRvI36RTCM/1xTB9vU5fdlYDs/k?=
 =?us-ascii?Q?yWG09btIhiawRaX/vhFL+Z67i4ekps/QfbqeR7wBNAuEw53cWxn/hgd0SRe/?=
 =?us-ascii?Q?AP31tv+1xqSVpQLmddds1XaqFwbVNRPFiRnJRJKeqsIrNTtYDn/OOQfB4LrA?=
 =?us-ascii?Q?xs3JZC7teCfbPphz9qAEjvwDYLNSPW+TwpZgOU8z690ODvehDkKwuh/7yCZq?=
 =?us-ascii?Q?HLdexsLv8XvnJbn0Ty5XQwOiAl5hL0POhnE18qcN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9716e96-9828-4236-85d0-08ddd9bb212b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 16:13:09.7085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJiArB53o1IaH68IHa8zMs0SORSGRNKJFCRSiSDR9oMoLo36UpoXO10a+86cNV1cV3ObyuJTxKyMP9oyqdr3RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10712

On Tue, Aug 12, 2025 at 05:18:55PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Add data type field in CSI pixel format info since the downstream
> subdev in the pipeline need to know.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 3a4645f59a44..7495400adc22 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -25,6 +25,7 @@
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -138,6 +139,7 @@ struct csi_state {
>
>  struct csi2_pix_format {
>  	u32 code;
> +	u32 data_type;
>  	u8 width;
>  };
>
> @@ -262,68 +264,89 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,

CSI2 data type is well defined in MIPI CSI2 spec. so the convertion from
media_bus_fmt to CSI2 DT is fixed patten for all CSI2 drivers.

I post one patch at
https://lore.kernel.org/imx/20250808-95_cam-v2-4-4b29fa6919a7@nxp.com/

helper funciton media_bus_fmt_to_csi2_dt(.code) to get CSI2 data type.

Laurent Pinchart have not time to review patch until sept 8. I hope first
3 patches can be reviewed and merged soon if they agree this methods.

also .width can be removed.

Frank

>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y8_1X8,
> +		.data_type = MIPI_CSI2_DT_RAW8,
>  		.width = 8,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y10_1X10,
> +		.data_type = MIPI_CSI2_DT_RAW10,
>  		.width = 10,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_Y12_1X12,
> +		.data_type = MIPI_CSI2_DT_RAW12,
>  		.width = 12,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.data_type = MIPI_CSI2_DT_RAW14,
>  		.width = 14,
>  	},
>  	/* YUV formats */
>  	{
>  		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.data_type = MIPI_CSI2_DT_YUV422_8B,
>  		.width = 16,
>  	}, {
>  		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.data_type = MIPI_CSI2_DT_YUV422_8B,
>  		.width = 16,
>  	}
>  };
> --
> 2.34.1
>

