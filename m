Return-Path: <linux-media+bounces-49199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 94289CD0C0D
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 17:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E09F1300804D
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C60357A45;
	Fri, 19 Dec 2025 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NRn77t/P"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013009.outbound.protection.outlook.com [52.101.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E6F357A33;
	Fri, 19 Dec 2025 15:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159851; cv=fail; b=MYMK1tA7knBf1qjCw29lOeW7Y+fuZOUsYrCUHDqrnd95iaotx/+beTmm1/t3XvGHciOzNlZ6kmoU5RKM64d2zID5691+MSulVMIF8U/ApXXpJ0McQG5Jt9zp/FQw+GOi3Daqgskrd8qboM/otACvRp3+1UPUE1feMpouIi4qsp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159851; c=relaxed/simple;
	bh=PVBxhvnuVGUQyZv5hO93mkmAQ2aFm66VIaAbKJX8llI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DCg159Wo9ab1vV0jo5wtxbue9y/LTPO5lXqCSw2oC/6RO6OcBnv4tYMWk6T1S2HSX6AygTqfOdDkNCGc7S8uLRPenOURxvvl/eldcV9C7SjhXFtm9Fuedgo4A1ygqRTm73qJMHti+Wpga2Cw8lFjGJDHD9Ju2a9DU/93ADDSx6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NRn77t/P; arc=fail smtp.client-ip=52.101.83.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhxnfVJBqiXTBEEZtcrNljsmgPZcmRWwfFyyJdtVbvx0zLNnIKpzuzUxMl9LINhlRiCrCGeHBEeUAWJqiOczg/h15+DhDv1l2aTjNbz9Eo6P11XIrAHeDHIQvyDsathZylZLuwn0h/n1caxZLXELvnZmYhMn1Z1YtNzzZ/fVHxCLhZwH8EnbYKwBp3PpWDC/tB8kEQ5TNKoFBw3Lj07S8S/XQp0qGPvsp1GQl3hsD/UjeKjQvS6dj32NeoV7tzRvOorRtboi+R4+jmFcAA1pveDc4V0QyK7F9v8BiQPSWZ+JOEXd8P53SjKXr2HjWb1p6dTO4v6hU+LcstJSoPH7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQwzC6yeixx6jTXLDf/rWVlisGaiAwwkdgPMre9ahHI=;
 b=xcTc9fWV3leJphWNUVmgGV98A9cm+iRcj4E3y1M/LVzRyqv3waM0W0LZf7Pw5JQBMWkqdDjw0lJNEdhHT1yHLJ3M7ydzPw+K1dwY9exyfXwyrEyET5UgSeJC42Ql5NbWBI93dBwSSjwllz7JTq3nXNAJqrvnPGDQb5nYXYLO4lpHkKA+IhzMev7+slE0Gn0rvATqVTcAyrkWd8RxQFTEtl+sOiHonwvC8WnBfylVTw9jBPTldpfpGcvNSv8L9eQOZpGgy5sW63HxlnhFzQ2IkzyTUWt+Kbeq0JEGNNexz1OcWXJoXbBz+JlxGmZA1Z10mPH3j4eliFGS5VfxrDI+Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQwzC6yeixx6jTXLDf/rWVlisGaiAwwkdgPMre9ahHI=;
 b=NRn77t/Pl22BSaS9gj2/GsjmcQKMmixv7B2H7ZG539hplI6AX0tGD8hNPFp9HUmCqDSHVMSZzYhYP7LJWaZzFlhcAb1t+j0xFhSeJDlY+AyAkegSQAj4T1MCHimyll8txtudXOo2gyDNjSv9bTwkx8vP5oelFnQEsKr0XpJ67Kb1OBAweYIm728vFA7qTNe1oslXmB20tSyfQfvoC98NR2ZYwhcddI1jYc9j610qpezD3SiwMVNftNSx8JshVU1tWfLot9riSoTy+qON6ySLZVf3ZhT9kSDK2oKh9axTOTvfSNQ58uS4ezKHj/rrMm7g2TvnQyilDt9lxWMvnLZP2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM0PR04MB11914.eurprd04.prod.outlook.com (2603:10a6:20b:6f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:57:26 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 15:57:25 +0000
Date: Fri, 19 Dec 2025 10:57:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <aUV13BHFn71ZIXfv@lizhi-Precision-Tower-5810>
References: <20251219-csi_formatter-v3-0-8680d6d87091@nxp.com>
 <20251219-csi_formatter-v3-1-8680d6d87091@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-csi_formatter-v3-1-8680d6d87091@nxp.com>
X-ClientProxiedBy: BY5PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:180::27) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM0PR04MB11914:EE_
X-MS-Office365-Filtering-Correlation-Id: 54bc8474-4059-4410-9477-08de3f174db7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?irwORScwA3SMlECb+MCaKYfEDv6YFlWmVYOB3zPzdhvpBMuvGjbcFHjOHAWe?=
 =?us-ascii?Q?HawLE+I9y+m9T0bleuYGvlIi4WCNsaAu6l4H+NPObLkjWFP9SDx2FmUOU+MW?=
 =?us-ascii?Q?TOIu6j/pjqnt3LpIrlH7v7uDNAF+kapnAOVNIfxfRDXti4hr83M8WUhpJZbk?=
 =?us-ascii?Q?L8Uy6aKRMpgpoyZbTkpRuBKyTKUf80A/BW3JTjQBHfnFUIsHtSdHYfnEhe4z?=
 =?us-ascii?Q?hYwM/B77uNwz2cpZKFAfS0KhH3mdK10yPZWAuKY09sUMwprecPtaHl33gbgB?=
 =?us-ascii?Q?CaWO5d6N4xZflQTuJik0aHU7HRjewN3bXeuOfEoEeXxnoPYHwWKbErnmSEns?=
 =?us-ascii?Q?n3fIo7Caj/lze2KbvSn+RIvoWx+p9FPK5G9whXFwmBfJ23jsIzNDrPlPyhrA?=
 =?us-ascii?Q?myptjrdJ/MCEOGZI9cAZiaSpOU/fDqx9m4/A2Pz5wntjy6TTu7spw/DqTwX6?=
 =?us-ascii?Q?7xijh2AjFR69fb8GBCjKpWeohkfvIkGlI7K8SlDMIvtzPnYMpwBLYa5/Tclz?=
 =?us-ascii?Q?tAnGvYjoDPSSQxUCnCBsZb61LLLkVxqUn7/J04mKsBE/2nE9AeAikG1O1uZP?=
 =?us-ascii?Q?UlCENTn+9zFeJjigkdpWZG7MhIB8FfZlH2+N6kJmAPoFeIBAxLQMH7OYDH1n?=
 =?us-ascii?Q?jPAB6Q/SiFjE/EChDNzPZDAJdkWAARJvwePstaaS7noh2GoRX0PvC/bINeso?=
 =?us-ascii?Q?eIuNzxEXJXfM8q89Cf9Q8t/Cyc945V2yE3HoZEe3RkS5MkQi+5pXERSaAKIs?=
 =?us-ascii?Q?B/pydmA9/LuUwv6iNwsygEcG7Hgmz3hfzj9rF6Zf3jhWSQXy9y2Z+8AhUBMn?=
 =?us-ascii?Q?fyZU9W9u6nBPFI0mkEvxxBbUvhokycDcdlhz+d62X5crG5oUK58rlqgZvKYk?=
 =?us-ascii?Q?/me4Eh95dfQ/OPfT99ksiNiyavFxqUNQzLAgQzDrPHFGLdgyGk15GVofkPsr?=
 =?us-ascii?Q?Gi/A53IDeUkBMnDe2g8TLcFpRZiUzf0nqj72upnqq2D26LRR4imTfPqr4NDp?=
 =?us-ascii?Q?gLUnfU2N8Dg5YpZOCsVQIon8bpB/vVM3RjwwKThWSr2M8xDzhXEPawnKc3yq?=
 =?us-ascii?Q?7u0Bru04gzIsKOszZevzgHw+ZtHodjDD9JmFJM4lph76mVzQ3u/mMaFAsXOg?=
 =?us-ascii?Q?A4WU93d5mdwUOxhjoIYaOglQKfnzbbcZzhmg5oRkuVsa2PhjtdiS5eTppuSm?=
 =?us-ascii?Q?Uekt8TUY4g/H6HWP4fB9QdWdulQXiwAExO9irglCWX0rKFZEWXfb5Bm36uGk?=
 =?us-ascii?Q?Ivc/HQC0LwQDzwgahH+PV9Xz5T5Pcdkdbhlc58flpngdIAJ3QsL5bByLovda?=
 =?us-ascii?Q?dNyfqqBzpUZXROdORGAKulib94cidAbfBCjondM+Cai5stxhhzucwbaPO5v5?=
 =?us-ascii?Q?zQri/dHn3ykT7mPUGFSBsq7FB6N+0Uh/n3wlTaFiQB6RNNMvWgGFBOGldau0?=
 =?us-ascii?Q?KhEShcwzpqve5PPev6nig4CPQ1ju3UHuKUPd9Pb20pVYIIDzTEk8Hg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?KPxI0owBvlPeXyYUbgREOSW0PgDwoyNRJhdU96LdpgtPIxwYlbJEO+dMKDYm?=
 =?us-ascii?Q?+5QRCm8/QViA5dflloHLQTLblUlbb+OkoklGz+f82mdxVFDa7vRFktV4maiU?=
 =?us-ascii?Q?NN/CK4aObZL8mRqrbuphNHGCZTbFBtuIPopKSKYVWHowqFG9GaYeoQD00fzR?=
 =?us-ascii?Q?zUZbNFuceAgk9A2ueP9PUCRqyAIEQCJBcmiMWH9jEmDYHA9dWwK4aHk6p+Qi?=
 =?us-ascii?Q?2I+NS1W3MacgX9g4sr1OZB0EeYN1AphT+UOyboPpoIqLZmgIBuR1EnSfnJZ0?=
 =?us-ascii?Q?b23A6kNrVnhoqDi2DEqnWlIxhZGeI/agOqT8W+8XyIPQIQ0T0Tl4C3U/tgEL?=
 =?us-ascii?Q?N11c46FLuNBMaosjCSU7Rp4gpzlDaXkh9hwXa1+pAgDrr6F07FK83wmzdEzq?=
 =?us-ascii?Q?CJ0ejG3ytFVKPD/j+PeLtb/yVzYr7cGDGu0zMK2ayphMyRolXktlotVGWbAS?=
 =?us-ascii?Q?6egvy/nsH5fZ8F5pMejH7NdKomclNY2JzOEURw8nn7PaLl5Zd/JjXKDROxmL?=
 =?us-ascii?Q?Nb6hnAFHkFXZtwxxWy3MDeKyu/NFFnMD+T6D2FxDdpY9L1osJ6sR9fLeojzG?=
 =?us-ascii?Q?/S/EqOQufRN+ynJtHnd91EDwy9dpXa1ucu3bjXWQFhq0rX/HULuioQ4Yt+YV?=
 =?us-ascii?Q?S2zbov7OuPyryzUyie6Dtf5ZG28tsqTcGJ45E398JJTK2jMG6Alkqwd/AxlY?=
 =?us-ascii?Q?oq93oRLM0CLHixJLk5RfltXlY80kL6ItpSxi6A+lAeXQ7QoWkSpKUQtFfj2y?=
 =?us-ascii?Q?njS9yB01RKKALFej9E9fTFBC4gNI8pTQQN8GManKCnEDFAROfKeK/oYSwNTK?=
 =?us-ascii?Q?hBCvtjNr/azrEJ/pqPX5zTW2ukA67BJI9OQVJKXB2MkHEkDhdNOsgsYjpI42?=
 =?us-ascii?Q?jfC+UxrxW6aMF8Sbv6BDnaOyh+rQFLZfWc2gVLzfmgxCkxUsWhkCGVKcIFT9?=
 =?us-ascii?Q?/uoVm35Gzs+jVrvCL0IGyc461RHKv/UWTQEzNvTmctmZ47ncPUxTuBpRYxhA?=
 =?us-ascii?Q?k4y6iKsyHtt7KudRY2lCzHJuDeTDrM/ZjdFCk9CKeCyLsOdHy9njbQQw5hO3?=
 =?us-ascii?Q?a7UBRMN5aXZCX28YODRQW2Xa/RsF+rBOjqtWnFDBCtLcWXgUSHft7ZyYIx4Z?=
 =?us-ascii?Q?F6fp883UkoOti7SXVmZ8n7vWzizQ/GIDHirxhli0rrELtgeZs/Xkmk4kTB7L?=
 =?us-ascii?Q?JU9CnsCZ4k9WACbEiK5IYo2UsANeXjzI3hFhWh2A1/uAnxvMhpQAGnRT3RGW?=
 =?us-ascii?Q?4Zv1Sqxpx7WUpGGUPqAJW4Y+AD1SGbi6qEUZ0Npu1izmnuZF512+qUd+fi8Y?=
 =?us-ascii?Q?2yUhu5ymCQwtMpPehCRu+I0g5iD3eubFvyZZk+gbA0XcLnjeXHduKJKMTg6w?=
 =?us-ascii?Q?PhB09Ps8BTgR8E7lIZjK42e0kcXZ0D54PG15CAR+5vj6eXGUKMpAoD2pXRpn?=
 =?us-ascii?Q?ncv2SZxtHFIXJbBn2KoZw+u4vtuKEUIjs3kpRT9nNxHwudYPeQ1N7MS6VMCT?=
 =?us-ascii?Q?kAVZ4HYzvvSRFYFVBWUgoOQCL3aUUyfjuNgefd3pEwvWIUBsgjpciDpE89h9?=
 =?us-ascii?Q?3rEvBKw6NgWZVtzk2kv52iTh7brr4D6sM+0DCoOs+BKe2IKdmM1blJnb+0MZ?=
 =?us-ascii?Q?X1bpuuNWHG3iyVnasbu1LQn2ryQJ0WZN6IeaG7NavGyjC5AyRdIt1PhufjBq?=
 =?us-ascii?Q?8t9ejn3mf4aDwm/2QKFDWXDqbjd3ETBcEVc3/d9WbVkRirFGyPzUiiBsQkeC?=
 =?us-ascii?Q?WmDpq2Cujg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bc8474-4059-4410-9477-08de3f174db7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:57:25.6580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEd6ttjSbiZs7B/DhUHpN9Fo6ZC03Wh1CkJLpWI+FBUypcBBx5ykDSgrgKj9wjeLY5kxq/2M5ng1wqwwantrZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11914

On Fri, Dec 19, 2025 at 09:50:57AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The i.MX9 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../bindings/media/fsl,imx9-csi-formatter.yaml     | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..774d37d2b987a679f0bb6378897a6dd196ea4f13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx9-csi-formatter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX9 CSI Pixel Formatter
> +
> +maintainers:
> +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> +
> +description:
> +  The CSI pixel formatting module uses packet info, pixel and non-pixel
> +  data from the CSI-2 host controller and reformat them to match Pixel
> +  Link(PL) definition.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx9-csi-formatter
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: MIPI CSI-2 RX IDI interface
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Pixel Link Interface
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    formatter@20 {
> +        compatible = "fsl,imx9-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                endpoint {
> +                    remote-endpoint = <&mipi_csi_0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                endpoint {
> +                    remote-endpoint = <&isi_in_2>;
> +                };
> +            };
> +        };
> +    };
>
> --
> 2.34.1
>

