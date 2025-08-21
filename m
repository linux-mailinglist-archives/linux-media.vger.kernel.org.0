Return-Path: <linux-media+bounces-40631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C3CB2FE99
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 490D8B020A8
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5CA3054C2;
	Thu, 21 Aug 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i8u66cWM"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641223E359;
	Thu, 21 Aug 2025 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789969; cv=fail; b=aJgYlgGsnBeH1bldsIxrLuJUN1DsJ2EwEnzlpz8KqQGjuRjd5THhIqroIpCWcj3mRSJNI8rCKbmyhGYhvkMGrplzJSVChfIamIRxSRXbJwbwlYeQnR7fxdBwEFVvwaX2NCIWwMUGF46sUg4V2gogdwUnoouWZadGXH6jewZWkbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789969; c=relaxed/simple;
	bh=vrbhTbXxQxs9iabxx0jr/r/7W5WfRd26WlM/Wp08VuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i6JBk5hJQEpDjejq2WUAEk5iTk3xVj65r5IiCd94rLZb1eSwEljMbIA6MJJQ/f8SUShmABovTxygmvmH1lTku5KOBnNMmEgafdWO2aOO/PEWacU0ipkMeS86FK3GbhS54qWs4sitKhUREuvQV3o15K8jcAtO806woThHwxNOsp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i8u66cWM; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=novN+68Lv4Wiw0Ism3NQyes6jDVS3psf8NF/+/V0rn8vlTU7esv4yIBcIskoePI8sK8CByXXd8NxNPVyEmtDl32W1YOQ3db+ilgL7Oy9FeMIQ06xCvCmUYORhxNnq2xC6EFYBH17gCfv/Dh6Lzyn+4TAMmRgRz7z7qLc/k2R0MqX134W6wjaQqSaOleq5pJ9/9wPhA9oNxZHPMdm2L0VMrRXQ7YzUsRs5UOV1zUJOFWwucdnACivdC5q1QA4KSIfL/BIq6WA9DSeN7YSxFmGxpOElWDBpbuAn3nuYNWXKUWNF9f8SzmMkWrGkVbrEqsLmOxWgy6kjQdCkcGswZK3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcjo78kLLiDCzu2nLODvUwIp39oLpssh11/CgNCWVbE=;
 b=l++OHQiQXbyFJ4EEhY/DDtROEdJxVoqchUl66y/C37SPA26OyvjBkzMBJfHYXczhNaxe1VBH9aKY7MU9J5tbylOFSHN50S+bykvXkavqdbUE9AMuHoy5yk6FURTA4jT+6z646mcHOd/+tdX2yN0vcu2/SA4aP9JuHm9YGhdHZ0Zv1DGaZ+A6ASbEbVkroMjmykwOHEcZhvXdWRP1rV+hi20Tn32CyxIu/YWRikGPloON+3KW+ZzXGsUXVXrbBGzkDiC0uAElcp1o+MGPlJKrwswLAnM20FobH/vmODQK6bdQJ9HzfemvIPuhFEDLoHdSFx6oGqzTtKDD1OQ9Pz2KRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcjo78kLLiDCzu2nLODvUwIp39oLpssh11/CgNCWVbE=;
 b=i8u66cWMAu9xvsm+aU19OqbQ0Z+hJajt0+6iPy/yStBBz5f91twgdGEcAaTpudO1W842qVq190wtvoEhNGy6wGezQHZNKfXmlaBd318elg3DMDOFh01lhcxs0LlMlEPhMgseGXAvTQlaCMyv+dvEQmivxfghObngiTSnFtnRCHvoqCYpTkWcS8eTMwDDw4pOnE9nBLeT1/JZSNXIY4n3z53cyqZl2SLAj19jXbObXFvXxqw4OUP5XaFz5+5gSxS3Lw27qc4mHhZdNOfRkYCQ1LBE178vUx7RgPh9+4eN7fB4ymZWskmWjnNxBNmtw8aCKBnn4mazMvAhjX4/Iguf0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PR3PR04MB7258.eurprd04.prod.outlook.com (2603:10a6:102:80::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 15:26:05 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 15:26:05 +0000
Date: Thu, 21 Aug 2025 11:25:55 -0400
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
Subject: Re: [PATCH v2 05/12] media: imx-mipi-csis: Rename register macros to
 match reference manual
Message-ID: <aKc6gzH5nyAeusu3@lizhi-Precision-Tower-5810>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-6-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821000944.27849-6-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: BYAPR07CA0031.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::44) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PR3PR04MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c7ddc5-9a2f-4b69-ec6a-08dde0c70b30
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Q2KBjNQtkqSIafCB0uFHNqyw6L5y3ps+H/S56XRwDmRUuNkFsglP4M+M93Zo?=
 =?us-ascii?Q?WZoluNOwocmG6mgrLVd30BalXRAwOVq0APW7yp/l+Vali8LHq/E6pRQ1nAFz?=
 =?us-ascii?Q?jwE6hXxrZLO/teiUP+1e+sh8sTvKwBWdnwhqPKzij33Ujlf3T1sHwroWMTsR?=
 =?us-ascii?Q?RNWtnFkdFnYGRgdwNnqn7HKVlO4+p4bzFdBU8ZCeZBUdCNHPNU4cmkILC/Ul?=
 =?us-ascii?Q?xW300IbOVgYsrV1IsKspLg0iHpL+2ys7NESMJVB+icXF3sO/nIV2AvQarlib?=
 =?us-ascii?Q?HiFNwKOjCBiA+08ukp0RiRu+cNeZdrBBWRBS0NeyEIxm05DM1Wg9WH6Vpdcp?=
 =?us-ascii?Q?YW/L28cMhnR9fkBx+s3hD9hmY4C3exTZDrXszWUaV8umivNYpz+Ho0SKf9Ec?=
 =?us-ascii?Q?JHswbQA7s7L4f+AKznjG3JeXp9YYezkSSVkqdCeswJMly730Ez1Affc9GM7N?=
 =?us-ascii?Q?vNHsuv0SsN0ZFBwZhnmyW4xfWqaaIAZwaOswAPHvsM0ezZAXLZK43ZTLSg+b?=
 =?us-ascii?Q?6sRlZ5HAjEhpxsozTh/exVDjGp0IbnZLkpV3ewEAs87ww5DyMdPcr/6c5MUY?=
 =?us-ascii?Q?B/KYdLFmf7sG9s7CKBxU4gzyfL/w65W+JmGk568+lzxFG5FvPFYGjETgtIne?=
 =?us-ascii?Q?d8cSacVJeVNJC0jj8qyYssBKMQUGnOrbPCoxio08R1TxOMlseJKaFs9ccoOz?=
 =?us-ascii?Q?zzpFy93ivY/vAbRvQwdYRMsT6QGVvifC9zrHe0FAJZ0t1TvGDafCLVNktinI?=
 =?us-ascii?Q?Mp646VAPBHPXMm9hN9AHOTd0vyW/EUUhrWIbXhOd3+b1OVnw0fr1gOAz7pRe?=
 =?us-ascii?Q?PLB0yv1TqtmvA8cMKJYKuqQBQ4yq0vWbpTQAfeHaUsPWIEmaRRjdvJ5VwE0o?=
 =?us-ascii?Q?vgVskn3MD9Bfsi+AXBOi1aUwbMArgK7l+4wZBtIcDb/UnLb0wHpGKKgWtABO?=
 =?us-ascii?Q?11PhUaSm1N+uceV+bWd3oUaiZtHc2ZhDn6Yum7olpoRgCs9TvZoLYFcBDD8P?=
 =?us-ascii?Q?9+eQ4ujpSAkva8YzmCkG/zkmkVa3Av1ik8NYuR3gzTl+Pm7HXuNQhDh5JIdP?=
 =?us-ascii?Q?G3/xnji3ynka84fhDDHqN2uHx1jvYRrJm5UHFUm8KtoYd0QoSbkgq7evwt6v?=
 =?us-ascii?Q?0MwFTV/pCL4NbnZLAzQIhV9WFZCm4aD7wJXIzxfgUbsiMH93Tx/I0Ko7V3AB?=
 =?us-ascii?Q?66ST0vTRnW55Sjo+p1pgoB3RisuHWEMa+WA2D3Vt/KcwTgDK7BWPQXeKExyS?=
 =?us-ascii?Q?T1noZMLMaV2JtUEtQ8rqs/eSFxnqF9iFwTGnLegP6Epb9aPjoDDJZvtBvFwD?=
 =?us-ascii?Q?JOD5LenrCbusKFoucEUoCsxrhj+6N4x1+T6WtCSBu/IBEtWmtncYYivWWW4q?=
 =?us-ascii?Q?obEMyoI4zuWRNhj65KUwWTsCQPm0sRu4IJ7cykRRo/jMuR06jhiqx3ay9Rpo?=
 =?us-ascii?Q?KpOExzuxtPFD6MvEAb9JjzogdIpb2ulp24L/VQu1lKRLEOiSSluJSQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?llBd2A1I/qvocs6NJuYU6gC3iEXJLxcSybT6p2i4pPt3miDriWrcKpxCwfGn?=
 =?us-ascii?Q?lEZQXJA9Gg5udqtdIuOagm+woY+3FYpD8+TK7W1go3pZc79/iby8BOPyL0eY?=
 =?us-ascii?Q?f9XkeEvNL5BGhY63jKcnfdnzou0LTZdnyulM1n6sgwtqjwMpKTDhhPUkvJHU?=
 =?us-ascii?Q?03pkDm/iRmUxATwU8UUhDv8ulIy46pRXu1+htp5V5yxOP+UI3cC7VViq1pS3?=
 =?us-ascii?Q?BHKZWG1nmGM1jYbXfXLZh2jTXrQ5ajDyfY+qVBzMU555dMm1glZm9Tjs8S+D?=
 =?us-ascii?Q?ZLQ+TdJ/PA8R+GGv42kUseM8Q2YmJG7y6ZUCLe9+T21yQu66SelbJ3GRikyj?=
 =?us-ascii?Q?4iG3thebNIXNVzb3Jrq8dbjKt1AEeKNSynjXHbVI5a8vQsSQMttM901ACpXJ?=
 =?us-ascii?Q?TKJItfeJXigZzLk5Rl4GOhmn3Vfl8OZLQyxYiRMQ6tglD0oxoLQCozGOcwvt?=
 =?us-ascii?Q?jYSqR69IJL0Dg9fOVJVZeuIKIQfzXGg8Fv2p0mCNYhNxWaCmJvcTn0ph4bJS?=
 =?us-ascii?Q?YsdDyuZ7vdUUtvjCHihAh6vep9c1n5W3cQgW/kFyYghqPisTpbPsl0zqieSA?=
 =?us-ascii?Q?EMj5dKbYuKOrMrfQno/qgaokEGMTuH2bPnuaB5rajsuH1n5nhoZlw4xS9QO+?=
 =?us-ascii?Q?2eeEb6AUvSRKeiOv+7+K0CSeCXXLcDGOcKS5qWssYyZK27+a/xrYKWS81CfS?=
 =?us-ascii?Q?fVe4aOfMT9Wk8kFXWdokYfmbFm31mtKzRJwST42SL8q7ypHDj/ffr5UlHiCa?=
 =?us-ascii?Q?5sJjoiik70hVHcA+W+sJUgAQ5F9bkGVE8st7jjTcJWp8CpRmHtWA5mSe0PrM?=
 =?us-ascii?Q?8mYuQo9oayA4RaIigEO894YV0moLCCCr6D6jcq9sU0t9mShLU3sGtYGZpaGT?=
 =?us-ascii?Q?ASSeelVOgLZSnLawq9qt5QvLBCPPU+rkP5aEvwzQpphiYRyB3uBNcM2ruwmd?=
 =?us-ascii?Q?2yV4ka5LgVTFhuJR5DSpiF7P7m5ZkzXyya6qvLAlgwL/TirZeaES3iTrpoIP?=
 =?us-ascii?Q?Vu6ajINN36iUzI6m4+LyqjP3nCzCC4mrur4giAfwBebPMALDgdyj8O6nkqpJ?=
 =?us-ascii?Q?apQ+RAAwAL8u0xxEt2PhYIt9X6PtcFzpQBhRLmRpep0E21b+BkV1g/eYRSg/?=
 =?us-ascii?Q?BRyRVdKq4rwLPS5aqROzTXQSEzP52cOgp2+IAU9bmGFZZH/NNjKxeLmxnzGD?=
 =?us-ascii?Q?iuUfpJuvQqdZ6WVs8k3Kt2vFkzjtK2odtKtAhexzBSERXXOffRboBJ4z5/sB?=
 =?us-ascii?Q?Poh7wE2Z+aZciMI18BTq46M0zv2ag/PswN7iKBN+cbYrT08mk82jzpYILd5G?=
 =?us-ascii?Q?ueaG6tj54ZMJ6JJcqvJXplWoC49AA4E5BvHtjaBTbB8gJGtFe6WjEZYHs4i4?=
 =?us-ascii?Q?6v3KxwQhjj6VG17yurrsYWjtvhmA5HG9f+ao/+lKKbmjNjjTWYXJMg2EHC0E?=
 =?us-ascii?Q?YjaDSfP+l35zGsQtnocA9ynnOb6qBshfBgF/Zp+hTl/dqQRO7ZmBHH9boctn?=
 =?us-ascii?Q?HLSC7dn2Ay31qFkOEmumqD7Y/fkgI3ZGdwy5P9E0lOOLIQpNRDBHULhYesau?=
 =?us-ascii?Q?XG7KPsC4jJirMIJnf+Lf/gOIwMPoHpu7nWVYxmII?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c7ddc5-9a2f-4b69-ec6a-08dde0c70b30
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:26:04.9253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sT7UT99RUpmdk+MQQNSErQrHFcgrD0EZrm3GvkfXMYHP+LfQBff74putylP26NZ+RASNKPeLapqsox1nA1A1yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7258

On Thu, Aug 21, 2025 at 03:09:37AM +0300, Laurent Pinchart wrote:
> The CSIS driver uses register macro names that do not match the
> reference manual of the i.MX7[DS] and i.MX8M[MNP] SoCs in which the CSIS
> is integrated. Rename them to match the documentation, making the code
> easier to read alongside the reference manuals.
>
> One of the misnamed register fields is MIPI_CSIS_INT_SRC_ERR_UNKNOWN,
> which led to the corresponding event being logged as "Unknown Error".
> The correct register field name is MIPI_CSIS_INT_SRC_ERR_ID, documented
> as "Unknown ID error". Update the event description accordingly.
>
> While at it, also replace a few *_OFFSET macros with parametric macros
> for consistency, and add the missing MIPI_CSIS_ISP_RESOL_VRESOL and
> MIPI_CSIS_ISP_RESOL_HRESOL register field macros.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 69 +++++++++++-----------
>  1 file changed, 36 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 894d12fef519..1ca327e6be00 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -55,13 +55,13 @@
>  /* CSIS common control */
>  #define MIPI_CSIS_CMN_CTRL			0x04
>  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
> -#define MIPI_CSIS_CMN_CTRL_INTER_MODE		BIT(10)
> +#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_NONE	(0 << 10)
> +#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT	(1 << 10)

BIT(10)?

> +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)	((n) << 8)
> +#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	(3 << 8)

GEN_MASK() is better here, And below other registers.

Frank
>  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
> -#define MIPI_CSIS_CMN_CTRL_RESET		BIT(1)
> -#define MIPI_CSIS_CMN_CTRL_ENABLE		BIT(0)
> -
> -#define MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET	8
> -#define MIPI_CSIS_CMN_CTRL_LANE_NR_MASK		(3 << 8)
> +#define MIPI_CSIS_CMN_CTRL_SW_RESET		BIT(1)
> +#define MIPI_CSIS_CMN_CTRL_CSI_EN		BIT(0)
>
>  /* CSIS clock control */
...

> --
> Regards,
>
> Laurent Pinchart
>

