Return-Path: <linux-media+bounces-44326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D9BD537A
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 18:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 972C1542F6D
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9554315790;
	Mon, 13 Oct 2025 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AZrl0qpB"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013041.outbound.protection.outlook.com [52.101.83.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD03F315778;
	Mon, 13 Oct 2025 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370235; cv=fail; b=dFdF2PoDn3iSXdomss7oYaLFYo5Zai1CqILYUxAwHlT7slzG2Vzpi/xjo7BeH20CVzQeWWLaoTswjJc5ROBLKKdt01q2bMEZ8PxiT6fIJ7muSouPsCIQ5zgDaig0JB4G34HMx9esK3iL7/koqiELoLbGh0XXHls3TxWhdpwd8Ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370235; c=relaxed/simple;
	bh=RNE0+SftQ7iYkBopqdTWIZYR2PSrm8pfd3h80OHZJ8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KOpMCgAbt1Sq4udqekdcrHdQHmZPgdrSSBQ+LIFn1gS8wnMd6XgMRD9ubKE73TzQsg3kOcvHCcf8CaREw8+d7Wsva1Da4uOBKmQdd+jXm6isS3Ky3Y1ygusQuu3XHaNCPmDkwG9dJRDBEpjXdFLmgsr45XPlePmVCnOkG95WnEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AZrl0qpB; arc=fail smtp.client-ip=52.101.83.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LU7o+SNpdll5nTkKbT9aL3KHBlbVq2veqSUgYEmjSGV62j5EoiclnWDt0McEuq7WhLb8xEvtAcPxjy2ppEgV7/AaB3Vk4EsU8G4+FbdNyfcuLM/ZLsH8uALe0wS8XDJzGktJTO6rLBSYkNQuqTZkHgBQltRYHAVp7tJ7MJaQ+HOYjsNH4FIU/8K6a2ljGl/nA2wtZgo1D0on3ZWxUEFobSjjc1OTuqj217d7lYLk5PM3saE5fWDiaoCpf7NDem3WZ5Rrf6PuNLSINCgYknq3sZaWCLG/neMvQ0fWDyrGvDzN+eRTPUm6oMLnbZ0XjquCSb2Ma8XgPnimQ8aX0o6Lvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovixykIvpvogHyfVNes2uGKfWnEtc8VNL4BULuUyoHc=;
 b=s5mIvWazqMEnbHjRQ7mlow72bbHuIJsiPC+wwr2xxr3nkgLLpWjtiQCiQlxZE04Ta+Ssu2MkSR59GnUVzpu9PZIf/oIxVTqeehnB4ACAVCZ0f/qeANPqRR+7xU1vJGBXr2bT/NRge46RUr8b32zScUXJBW4HC8KzKnwNhxSpZD+aEGi/oK/BQMW5b9fnACEiwTHiMBhTN0eF6DJZ8/sTGPF5Q/y2cV3GUpLLlhO4Ah7GW8DFro6s+Hs6sE38e6DQV262IUPO8UBMtmtemDMFcsI7I64EKN6/I9RM3ZN94aiu+ArHy1sOwfk1mkfDmgRy/+EJAvuB7D2suDF4D/dEgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovixykIvpvogHyfVNes2uGKfWnEtc8VNL4BULuUyoHc=;
 b=AZrl0qpBl9Fw1kYaE+APDNO/konrcFMqGssv/J433/c5+jyzUALWCQcAkm+pYPFM3lrkzUXz4BwggD1rncLOAsBKSOeDZfnXTo2y2RY9nOerQ8VP+NZFsT8dkzubHikmtlMTWsG8AY2bdSzVXZkYc0B6g5/uKyvKZ2AzW1kLNbVuEP7kW3b8MCQXFqbEXtG4qSuBsPvcxUOhJLfpuBSAYYzOsmpO6zt8kvJY6AS839ogn/8cLL754UKyYMWtn3Do7EghVXmqwcIGZ52NqRpybozIqLBncJG/yH8pLZlE8dnfGBdHVBvNcqR3EcKFRQTKRLZF5jht7SLRz002vLHKVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PAXPR04MB8989.eurprd04.prod.outlook.com (2603:10a6:102:20c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 15:43:49 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 15:43:49 +0000
Date: Mon, 13 Oct 2025 11:43:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: fsl,imx6q-vdoa: Remove redundant
 quote
Message-ID: <aO0eLbLCGLKf6sF+@lizhi-Precision-Tower-5810>
References: <20251013-dts-v1-1-5731ed92684a@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-dts-v1-1-5731ed92684a@chromium.org>
X-ClientProxiedBy: PH0PR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:510:e::20) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PAXPR04MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ffe4703-ecfc-4033-44be-08de0a6f4d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?distq/fIOI0ll2iyX9sahTCo8xu2zISEeGYgilbBMj3p67Tnl0dBFNC47XFi?=
 =?us-ascii?Q?2il+jK+xUD4e9WJXBJkRyJuDMffsJGGm9zb/OkWwUiCeeJnMQ8AwL1VIUbY9?=
 =?us-ascii?Q?cTSCt3RfywjlseQHAVCEQfy8eYtvDIiResViB3S2F3BuKNh9WCI86ZZwYR/e?=
 =?us-ascii?Q?gFtXr1bazYjfQALhuq5gRH9rZSRrz+9UoYaEUj/G5rjx0BjMvwYhxpfInaOt?=
 =?us-ascii?Q?FXxFBin2yArKiWpT0KB8/UDTTVYl3y1Ibz1WrdT7dq2N9g5++jimOWBK9EoE?=
 =?us-ascii?Q?ssUytbveWzVISmFeSix3LCBmS9M8eu7pewYVmDq2ZrTEaiepNfYlBM7eY3qi?=
 =?us-ascii?Q?GbpvMh7AzHwqlfr9aDZHKOKzsJHkxmJHM/cq3haHL50JQdKbsXVaFiklSSzQ?=
 =?us-ascii?Q?1jZ+w6JpTKto3Cghmfww+NPJ1KMNomoQORP3X1TKBUKIsFZHnV+DSgUY3tz+?=
 =?us-ascii?Q?0Nz7yjGPU735nFLMNAI3KU3ZInKCcKcBerczTOdYYevT2xrl8wLJzh7oIyuH?=
 =?us-ascii?Q?Q6drKU7a+cpfsfabiAY2XXplNB0ue2z609g84h6G2/mkwZrKuLrBpIk4tqSp?=
 =?us-ascii?Q?cO4lwz9lO+0uzwepAXGapogf3K6qU1EzGmiLx/VnQo5HDe1stTmt0CA2aBJc?=
 =?us-ascii?Q?HWC2hqB2uRp4JCTOT/htTF1Y7vjXLqwvXufC8GqB/gp6uK+kPvGBiuUVMD0a?=
 =?us-ascii?Q?XBwreZmz3+pNBZbG2spJgYdIHKRH0zxvEM6XNWHJdFZu5Uo6Le4wSGgxitc7?=
 =?us-ascii?Q?ZgGKlHeB8iIBiJV/sE20BZbfKQmWpfNYdpJ6373ih5s4o+VUh2ezMwbNJ4MJ?=
 =?us-ascii?Q?qD0RWvGgKu9NCp6eLj28L6MGiDaPeZLXce9N41wMqNW3eDy0YEi1T0/X70Bn?=
 =?us-ascii?Q?IHRi6Lm+LY3252JhrkDzItXvMuTkmpE8ixdLXGkB9LS0fjBO38vt5sFvz+qb?=
 =?us-ascii?Q?wGHuEF+SpWZvvItl0DC7nnM9BO9JBuY+PmX49LS5jY4bquaw8jL4BYir8iQ0?=
 =?us-ascii?Q?ew+iZozFUNGsvr9ZEmbJechX1qlzi1okKJuC6ND4g1eKVjUkifazDzzVsuYF?=
 =?us-ascii?Q?HJJA0IMizKGPKlsIQW7g8kt+yzuGhwYCaAS3hUr7Y8ZpjXKNcmP//mUEUoSK?=
 =?us-ascii?Q?sFR7KqPQC+71e85CUj25QCOwAE6mQd5AHgOoWqc+LkxmgHo+Y6Q92Bky4tYm?=
 =?us-ascii?Q?g4qFq96wIZu0amdR+fbSf2zBsUQPvMWOvJzi+OzDQeOHHfdr0onZqMl3vJ0e?=
 =?us-ascii?Q?6e3obViph1njaWrcAxE4ZPg76LDD9WtccHfNzf/42FzRrfUlkJSzygXO3ZhU?=
 =?us-ascii?Q?LxDiRaWWtt2Cuy0BVv+/6LJbrbzjcfnxZDQaqMRisr8NHtpwLQQ7aHbw8uRo?=
 =?us-ascii?Q?JquibtqWLsCvQPpzrhGHbHBjSfDNU1svo/XOJAsqiWZuqsBZARdkcyuez6WC?=
 =?us-ascii?Q?QyZ+2BdwJ+M8KY1NgBbsWTVB7pdUtLfJGvlM3EbNfPxegZUgc0Pwh1inRw+Q?=
 =?us-ascii?Q?1D8N99x0ZT96Au8C+vEOrCRuf6At+MKvb2b8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w2hCoIyr/Wd+sOl6Jx/jzvoo7mFmqC8Xb3LCviw4wCZVlL9fYZ1SX28c7Xq+?=
 =?us-ascii?Q?jaUefGR/PA/r5O/oPLdkjc2DfOf6d39jJoyjUKRDK9V/wwBROsIFFL56Eg4z?=
 =?us-ascii?Q?W2l7lxJLK3QqKtijmGhtA/muVe5e9jk7VAcIceo14iW+SIuXufZqHMkOGpUh?=
 =?us-ascii?Q?vn3o8IRMOfAbc9EJzniiN6w9nTIhdFCi9DPSUYcVeb6IIGygK3vHD14UUCCE?=
 =?us-ascii?Q?O3htAJRJ2n9jtWxfZBWiHzoBt5XiFEIBSnVutdS8zA13MukZ8EMtFC5Z2iPE?=
 =?us-ascii?Q?NVZ7+OhU9kBTrhoNTpy8V1BTwKaaninxh6vBnLWOMt1vArQ7gFITrk9kklS3?=
 =?us-ascii?Q?wbLPOpZPz0UuKkYtApVm9mYCC5nhNCCutA0b2PUsf7Q4sbdVC3RzTDogV/Dj?=
 =?us-ascii?Q?qEMi40Z0EWPEJPvfdm8WLbOLwIGH7U7B4uIngn4iOv5Nw6ZL1RJ/7grTg2Kg?=
 =?us-ascii?Q?294sCTCKcC5LlD8cQBZAw44jAtJI4LJHlpYBM2bPw5oltQy8Lx2H8xiwNGBN?=
 =?us-ascii?Q?ZvW7kDdIYrwtGiN9KG0oFmj8nifd5Hs/3NKLI8F7CdJoh8zNGsKX7zar0oqK?=
 =?us-ascii?Q?R9Mv+s6jEDC8+Y+/IZIszvO6k0aI+FKs2UkTda0FaqkeQWPu24GqtrEyKoTb?=
 =?us-ascii?Q?5kdAO2YU3ZnsN/iTGbm0yoUvagN2DBKrJnCMqlXBMqlSHn0G3dlmYqnCua07?=
 =?us-ascii?Q?xF0tIetzmqa7uVIK1zAHy8fyE5nJghrk+tFsYA/2V82PZLaDMZ5kDQkaVLqP?=
 =?us-ascii?Q?BCYJHB72uBTRIQ8Owc3bN+5IdLMhV1EiGtKczEecCluKTDPY10y8TfZl5uDO?=
 =?us-ascii?Q?0FLW0gAExl6bYCuIn30pEIiiWYHTxRLIraHc1tzaFBzQBF3oTJaurZz4Hgtv?=
 =?us-ascii?Q?odqpkiaHjuX1WUDwIjr0KzlqBWZLU0yLYcb2a+bPh3b99JDFPEdM7DGNxjsf?=
 =?us-ascii?Q?bpioouh1yaW4FeVrtmj9WbWAKx94vAeFNmOj56QKJxkUTg7FTnNKR7l872L0?=
 =?us-ascii?Q?ii148xSini4Sm3Nmg0ovaEsNQoANL6CVglr5zMKg9KoaPVfdYVz2DGVnJb1y?=
 =?us-ascii?Q?3xw05z2gF3yNcq/ZRaOin9YkRbcMewwQJp5dd4NvWOwNu4Xn9Mj6WFgezoaM?=
 =?us-ascii?Q?wYERR2hrn2prAuSOi0OhsDHjYnv0TrJ/05ZdBYmg4wyEK32O+RMfc9PYpCZP?=
 =?us-ascii?Q?RO8XfhEhAi9GmKMqzDoQXIEwPDVUE7NWmDUgoDB3mkGilhGEkSY9t1q6556f?=
 =?us-ascii?Q?7wmn27dzlKmMCCTotiNyd2fflY0Smqt1uhMK4tFMt9jfl+hk9Pqpp9iBLvoK?=
 =?us-ascii?Q?tFhY4OuDNDh6oFPw2d0gAEcDaU/usanNvVJ4pXa3wRUlMSyxg3fTAsS+nO4q?=
 =?us-ascii?Q?VXxj8q+WSj3GvCKDYDrGCLnZFHRMuynJr71XWEo7mzlw1mJ4cnVgm2XBfRrs?=
 =?us-ascii?Q?zl3TDgkTZ5TH++OW58vRcjRriaP9U4hj3OeS/ib/Wh9/mHiHndyUsmq76nR6?=
 =?us-ascii?Q?eMqrTiC+bGasXEK28sP04s5StGSLkf1WO6e3ShACVEyFZBJh1GB4hV0w9doO?=
 =?us-ascii?Q?/GsPiM9ricWbRfnwZ18=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffe4703-ecfc-4033-44be-08de0a6f4d4f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 15:43:48.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrx1gol5JX2gbiaywV4MNML/lMFy7zwzbQiiFlOTWjpww+Oo+NSjSV01rQOc+6RIDeYSZv+JqKQHcO4qg+89GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8989

On Mon, Oct 13, 2025 at 02:52:20PM +0000, Ricardo Ribalda wrote:
> Latest dts-ci complains about this:
> ./Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml:19:12: [error] string value is redundantly quoted with any quotes (quoted-strings)
>
> Fix it to make our CI happy.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

Thank you fix it. I have posted at

https://lore.kernel.org/imx/20250925193546.305036-1-Frank.Li@nxp.com/

Frank

>  Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> index 511ac0d67a7f2360afe22b81d76644575081089b..988a5b3a62bdebeda6b922a986b9ac93d0933e51 100644
> --- a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> +++ b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> @@ -16,7 +16,7 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: "fsl,imx6q-vdoa"
> +    const: fsl,imx6q-vdoa
>
>    reg:
>      maxItems: 1
>
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251013-dts-83ce7f7b9e54
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
>

