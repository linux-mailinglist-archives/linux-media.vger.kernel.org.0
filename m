Return-Path: <linux-media+bounces-39615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B75B22E18
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 18:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E8E616EF8D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 16:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9B92FD1A2;
	Tue, 12 Aug 2025 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W73MhC9F"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26922F90E9;
	Tue, 12 Aug 2025 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755016887; cv=fail; b=ghkcw3Xu9e5qWG0cL+STX2q2UMChqyIayzwwsKlaPdQamoVi/QoS0R7qLpHyKEOwXDKWegUJDFEs7Z/PH4tQqQyYv4gE9gPykvFw/nTVgzsQvLSc3lPw6niq9l32XYBCTYsCoQk6S0szk6ciFMgQa3jCO6dumkD+UQqFyRMJT5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755016887; c=relaxed/simple;
	bh=jDGg8vrqGn11Bwnfj5iV7GPGwlHYuZVOmiSMSP/jGdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R7ciOseEIDl4p/+CRU87s6kQOw8Lb7kFY5LR0PjLnMcnYeWdqVn0pRA0FSopG3T8r2MwKEGJXUUgqqI1B/62fNEdD8qaJ3PvgvFXHTrWTXrDpT6Q99MH5L2ZhaiGk/7mWLhzndhDN1WNcas/yI2PKVCYBBf3a+RaIjaB3v6t3xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W73MhC9F; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMqDYhOUGDUPxRE8XLCt1cy89cXv7OddzdETXL71dezaYCq2nuyQJqoVt0dypkWtkIwIxFighoC1R9wM4TQopdlm55FVqEgoXYUB5rnGoyff+fMcL03rNRHn5YdOjBer87G3mCMJVm1SDg2vhy2Mmtgw1xyExkPa4N/mp3MeXIeHeEJha5AooBiUvcmZos1Q85R0yKmlmLUr5Ct+OrQt/F7HBkcqyvN/BbHJar7EGDFvGp8FROv0csc8tAk0+oZ8f8n16j1A9Ix5FDRVyCap3MxPYa4MnHIDvXCrY9lAy3B6wwNfRQrIbS2+WQcGIEOHsyzWuRRlz/h9icdx1HtU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxlqbobmKi3GxOPgG6ZvK18LWEX4kSf0/ung6uCpzZw=;
 b=xuYsTdPBCddDHG7nzADeQ408uPTLlVnnx/Kw+gyZwk02Axyh6xuOaVl5Wo/gAND5K2Dhde+4BTi0J64929W03DFaUdSoNruB1HeB/oBus4LQMw0+/ijPnVR6tWrmHTNJCYkSRG//TUo77iI+KOlYf4YKPktSWF1HWGWyWg+u9fJ+sW8OsvCjk0MEPeGqZ4LvmNJ9xkj9ytDIcat8XesXBzXawWugws0Wu6TQwjWtav5f4zqUJxk4mDjSwcSB3j+JNdUV8Q91BiOcaV4icBFhdJ5xpfR/8cH2MtebbM81sozavDiaZHM8buXt2u+ZiZspPviDA90W/pEBCWhlzFyV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxlqbobmKi3GxOPgG6ZvK18LWEX4kSf0/ung6uCpzZw=;
 b=W73MhC9F77zdFozvBs4UVKEtnr+bPrnzEKMhKLQc7m7n0wvgyHKqTHcTJ07O61ZSWT9L6SP4c3POC9CUz+3ORpvdojE1F0odkz5td5iOurOUedN38XwFpoF230i+z4USedrf3QiXlCF49BmSyR/DvX1ekCC7uJgFPn5QUbGWZuXzF86ZeMZkTHgrLzFY49fgk+EzhRS/RCPe/odwRA2XsMER2XyxyUSu+jz7jJ/ZjL+xIqgkY91df6wQPZSvjnvAiFfBE8PK8L9olQZZKTz73KtuYZ00E9BzQmkw1sZaxwxq+cn21/Lyl5nApmdW5yGnVpKXtHfG7cPFtOMUhCLD2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 16:41:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.011; Tue, 12 Aug 2025
 16:41:22 +0000
Date: Tue, 12 Aug 2025 12:41:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH 5/5] media: imx8mq-mipi-csi2: Add support for i.MX8ULP
Message-ID: <aJtuqfwKoysr4P+I@lizhi-Precision-Tower-5810>
References: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
 <20250812081923.1019345-6-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812081923.1019345-6-guoniu.zhou@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9362:EE_
X-MS-Office365-Filtering-Correlation-Id: bba5a680-fa84-4a6b-98b1-08ddd9bf126d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?kBGz56X/nEn8FBBk64LhsJFYDQJUGAZnKO7iU5W2z6A2jV1Q/JEU5dQcB43F?=
 =?us-ascii?Q?GTCbTaUplPwlW8uaCDmKxurPk/eUdB6WuhOsiperpQH9Eaej79GYkXH1i+U3?=
 =?us-ascii?Q?9vWL/B7jzqql6hhC4AJUqdcPpFcegqGphCKh8bQ1q0akfdLSkE1n4Rt/7hbI?=
 =?us-ascii?Q?a/Rkzjgo91UhKfUnPPGoFWSwt6keNlpnt/gKGROSU09/pzicqigsXd78UQvg?=
 =?us-ascii?Q?/B6RGdiptE5oiTMeejFVDBFCn/I8anPNisdIodK4U23XwpPlYJAnGXZM1UUb?=
 =?us-ascii?Q?W61Wb8XkNvZR348+lTWiS7BmtBM8JPWzS7xzM6rhjRIL+0tTCSLIsTqtcrFy?=
 =?us-ascii?Q?sayw62eIBd66C1X+c74hINn6Ngp54GmUeFToHbOPuntKYwmwGoIwbMJIA/PF?=
 =?us-ascii?Q?OiVJCQ0W7FtB/yRv+rseOaqzPxGVQ6U3WVFIM7bmgQJwbbQIMA0IE/IcPusZ?=
 =?us-ascii?Q?TjsAiB1Am9YEbQrR07FfAOp+LIONVXysVgFOgS7x5mCYpjylz6m54+WD6Tb8?=
 =?us-ascii?Q?cq78ILgPOJ4LB8YIC0ctJ+kPEHoax1fIfPWrsfFW6wBWKfFJWpmLX6D71umX?=
 =?us-ascii?Q?XvxjKlFjWDvjt6iyB7ha9NuLc49hUAjYD8xF5nsI7RGqfBtycImHXYpqI2oq?=
 =?us-ascii?Q?EppNN2p87H54EsF93F3nZkH8wkCEoidKXLc2uLNnM43BgMuDcFu4TZbGwgiy?=
 =?us-ascii?Q?1d2vhqYpAeZyEac/vEjPLpDuWj4ejbfBdYsDKbUyd/yGK0AuasBh9ss8zjpn?=
 =?us-ascii?Q?gZwu2XBWNny/bqFgzXDRvQA/sFp2NSPBj7AgrR9OURiCH9ciwnZfxEXIryIy?=
 =?us-ascii?Q?8Sp7hYl/DkC5hw8GAC71WbytoG/Tbeslke9ZXSJaG0Hd87jg9jaBIDgljt4A?=
 =?us-ascii?Q?KxWVqizEXbwSPR4vVUp0akCzKleifZxzEdhek/1/xA3S8COHFQMG+dUtd/TZ?=
 =?us-ascii?Q?ld41v2mk8ElZgAaoMaPccUiJEoKA3Cvzd3Gl8Fzwgdf1atXXPNCaveIalgEh?=
 =?us-ascii?Q?Ayli//stMVt8ti6iVZI6FR3eo9E7GsE6EY+8wNrvXQbXMpFYs0gz36Q5mQdH?=
 =?us-ascii?Q?cx5k7GSBe/jDwM7QqSxf/NMVXf7qQ5mYkfOTqpOPkyYTZyOPKQqXHxBrvI8N?=
 =?us-ascii?Q?BYcXSdEt+7PBLW2qwRedR2dB+wAYzAlpEZjBdzTnPG02tJZTyMQyOxHgFvdl?=
 =?us-ascii?Q?ITz2obw/P4xTcC/W7kCEyfz9GzoJi/pS5FbDIcc9KO5BDML/wTNcTzRk1ew9?=
 =?us-ascii?Q?rCQ15jDG/ID4JqNfmiBLeME+ecXjdwvFmyooh+I998JHZ1LCGPueKWXpWo91?=
 =?us-ascii?Q?ULARbzPqWD0R/fJtnZbJhjDU3TjtQY/xVqCLXMs5sP+UH7PSGjly4Da3mqo8?=
 =?us-ascii?Q?LAvbEOp1v9lzB+Bqy7pGMztft017azYurUJQByxMdsTarR1lb8k7UPd4qJvn?=
 =?us-ascii?Q?8OAciOJwNkpCa8uo1u/GCCNB6uMrRk5L5SRqJzufN49vc0poG2/KqQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?fbFRUQxh9E0iSIpBLo17hnQyAv380ijY389+O31+PqMs/vFm7PgwMQw8E/0R?=
 =?us-ascii?Q?WkzpYSKxRoKYWr46ej7C7OTCDMlJm9mgtyrNbC/vbO2LgPm8quoop/3XKnhw?=
 =?us-ascii?Q?wrgTQ/RqYQlBDW8NFDguxqbHGPq/33sHhsgOvNgC8mtxyWOvz7OwOL4rFpk5?=
 =?us-ascii?Q?bKj49qxfldZL5F7T9RXT12r3leIBeqzIHFJlg8ZavwQK9zastEBsE2Dw9NUm?=
 =?us-ascii?Q?n5oxcHAsM4Nj6sB6z/d6eME5JMexUstULsXby8OpeorCv5Y/cEVTN8S717wt?=
 =?us-ascii?Q?CeGJQbq+w/jeNLDTKQDmP9yDi8zmpKV+NomVSLUNqjl4MkBAEPcgsKC6WNpm?=
 =?us-ascii?Q?epNFsG34+glk7kjuWv9wQScLkGtZ9XgVngpCLO5WxRIN+0qtxjiPJjl3S0qB?=
 =?us-ascii?Q?n4Y6WlMQYK358VFR2f4w+gVbz3Ptlyl7npR+jJH99fATS8MmjW4JJbJ4hP7w?=
 =?us-ascii?Q?rbJacX3C8EkzryYaj1MF2kMYBnekhBZT4ko6Iq7i2Do2BTUWE4f0+og35IV4?=
 =?us-ascii?Q?zckQd+FzPJpOXxQ/mA69zzl66Svfokz9/5RJhc/s7vuyCF5U19yz6vPpoHo6?=
 =?us-ascii?Q?2a/GC93RjFxyRTqYqlf5VC7iemUrLjg0K6yGHZp/WUjIM7gcuoRmQJkrmBow?=
 =?us-ascii?Q?dpg24fwOVdko5k9hvqbFlkKQkobE8sMFlDjal8P0T+xSFOtuaILuoHBxg1Lo?=
 =?us-ascii?Q?yM73abonLdUqPI5YHLNrFuXrCEZTHN22KXTN6L1Qs/w5XNyXPpdTf3vADFRM?=
 =?us-ascii?Q?Z1v7f86wPfOmxBD7opVNnVCm8/508jbAkE8IoXIWyYBX2Nc3MojTBWSHQbMa?=
 =?us-ascii?Q?L3Ixdh5BajqwwunOydXvkl7fRrOyrnu2P9aNMt79ZV9HIt9aPu3FhAc+ytaK?=
 =?us-ascii?Q?TsOsp/w9S6WjtIJPhsP47clIkVREPoNiFUZgBYbF3ksNob6YWzjHPgMZk8Ew?=
 =?us-ascii?Q?aEg68tSqEQ2CTxfYnNNTkgyBxUAFF/s15mtIAGymflsRsAG8+xP6RFKWZjX0?=
 =?us-ascii?Q?RTjTXyr1uvWe2BdoeaxcdlaN5xFjknBng4VRBCmSxBQNn+kiRzxAVvg18JJB?=
 =?us-ascii?Q?QDSN1zPxFnw4LHXVh6oV8WsQ5e5/RwavU3IC7wPiVRwB03H1JNTWlM38N5xF?=
 =?us-ascii?Q?ayN7dnFL7hsxpuc0jkhWzEt5bc8fDu2qTDlIxEOGr5aVnUhFEqwd9cwjgPRN?=
 =?us-ascii?Q?B34RZ/7KddBuyskcWET337mmEFWdZjS7RjcRUj5PBCR1FKZWZYKdJayeDTUM?=
 =?us-ascii?Q?ki5nJUICSQ+8VyR8I0C5i99lkGD0oQnwZMc6+yAJ8auYYzbFeSscpEH/hBCz?=
 =?us-ascii?Q?4gv7BsWhsOMGFaccGRmxaj5PDIPOn7IWShqNevOrg2G+7lNZom+O5o4WgRP1?=
 =?us-ascii?Q?BbORjk0gR1VRLZXIivLfLY8HfeeXU1tPr1HHt3Lip84T7yxPrY/8+saXdxrU?=
 =?us-ascii?Q?TDsJBkdmy9wMk4x38CtAOlGvItCNyg54Chuj8vAYYkilRuxP5APB6rcqNXUV?=
 =?us-ascii?Q?/DB4/PY9DkLuo4wOy2AAzv0rEDnmquFXc49q5iThxHz+Ghqx1oK2plrAPVIw?=
 =?us-ascii?Q?prxanQKI47DAKMsU/qI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba5a680-fa84-4a6b-98b1-08ddd9bf126d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 16:41:22.9315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tYGh4dk13pe4Rrv8Iy9WF86kJ/ra6zqneP87Wenst/YTGoUPfLHbI9I+dzetJNUV7Esd3VJozmT+qzOjefVkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9362

On Tue, Aug 12, 2025 at 04:19:26PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI-2 receiver in i.MX8ULP is almost same as i.MX8QXP/QM except
> clocks and resets, so add compatible string for i.MX8ULP to handle
> the difference and reuse platform data of i.MX8QXP/QM.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 071d939d9048..14cd08f9a4f6 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -1136,6 +1136,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
>  static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
>  	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
>  	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
> +	{ .compatible = "fsl,imx8ulp-mipi-csi2", .data = &imx8qxp_data },

if platform data is the same, you can update dt binding file, allow
fsl,imx8ulp-mipi-csi2 fallback to fsl,imx8qxp-mipi-csi2.

So, needn't this patch at all.

comaptible = "fsl,imx8ulp-mipi-csi2", "fsl,imx8qxp-mipi-csi2".

Frank

>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);
> --
> 2.34.1
>

