Return-Path: <linux-media+bounces-48183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522BCA0589
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 18:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 959CF30052EA
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 17:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777F2342CB5;
	Wed,  3 Dec 2025 17:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bK8MPYVD"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C54264617;
	Wed,  3 Dec 2025 17:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781491; cv=fail; b=cQ1G1VtBFpV5YKnU1NrpQbsmKIsnmDEej1I88Ks2WHkuHAtToIBqnXw5CwiN760XPM/+SOqZ/9LhfLQuNgAOxT0al59Z151WgfRgsaXg4Yq863IiMkWtCv+RcOOFXmHge3TS3MLTS/1OxhNq/TIIePfI7ASeS3bDS1rvDJYLdrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781491; c=relaxed/simple;
	bh=je7T1oBD2dd8OCKz+7phNNu9/Rn66gYBvVXKcog/tY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sP3jB8WRgfHBEgdVWH9hHfofzd467+M/B6XOvDOYsHbJqQcZOL9fGSOnK3uX1JG4ONyozbwNQHfp2FRRGrUpITR61iIFsoXrlnYGv9GooOPCj7nIfClk3iRBu4IMCpSWmO7+/Ifj7c9q5hSs/EG/WNEVvKo1tdWZcA3xtRaBuhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bK8MPYVD; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTq0AqQEL6w3vYxUIKGac7fgfSXW2tC1mOiTpulh+JrcF62fcYcCacJlJdW8BO/V2dca8x7WfpOmduWasz7TeoO8pesEF1PlqLgWieKk9eeqDFhIAKtF1M5kypi2Yh6zdIdYampjXqo9ZePSsyLlIhz3w59VehQ6cj2Sov8Kckr2ob1RnkaUJ4z4EQqAc+Bd00Q6bcDzfVcp2uF8Wse2f2qDA2E+1FGend6gGXNukq+8W2EyM035mjdsdEeTTgnVWToOiR+Y4e/AVCfDEl6zMJ0FTXnsOFYnmEXZbW4owtHbQ8tggZKsCpXQArs73MrkuI1MZ+e6RGDXWF27GcpEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8en1SF8RpWCUKKvzqgrh322XayCj3gce5wTdd79xtUs=;
 b=ovfZc2VO4poIG9RELSoqHhkj/zMg3de/eJqRN8GROJLG5OxMIvza1rT3biEWFtO2YN5dW702Vpmy6LpfQbDev4UR0LwPfyTR8RfmacvLlmLQlLhubGDx8nP9UuXseSUZBwdrdgBZVEPFrUNsWhieIYKf96xV4KEb58o6Uif0jR/aq1wREtA95jBK3WjwQX1nx9tEQ3idBvpdw7gi3/subBtx1BvCOfMwTnjSGtBu/4Xzz6tGxD/ogWJfCbR8a6+tRPuf0Oi9Is1s68FHS1JYoxgIhbdTAmDoseUjoqHuw1B55qAEMOPynKj7Upgq4uRB4bHH21VgpYN8nkdbzezPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8en1SF8RpWCUKKvzqgrh322XayCj3gce5wTdd79xtUs=;
 b=bK8MPYVDCIvZz7NWSCMOvaCyIEc/Wbj8X4+6eCG+mQd692eX/33Ol0OIGdBwPdYjRRRrdwxfZVrLx84yc7uup896KRYyQmQu3rZJ5MukD0wVodWFfMu4TzUeOrLCZ+8gH5gFx3PPPJalGpILZxIzCS6GNrOyJXLNWQ2yfdVn+rg1yzJu5IY7apJoKv8WANs5BxIEfRZ+vAzsoMUct/hjuK8I/tD8mHBeW/R1Ihs87IE37Zylulh8ZNKN7VMD0lf0k+ZBLnLpQlRPzG22yoLWrZK5z1GpcC/t2RHjvOT5ZLLY4xw/FoNA7c/I3flIEhu5zWOwydlg5UJ2WcIRA+Cjxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB9776.eurprd04.prod.outlook.com (2603:10a6:10:4f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 17:04:45 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 17:04:45 +0000
Date: Wed, 3 Dec 2025 12:04:36 -0500
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
Subject: Re: [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <aTBtpOpsMSmezIcL@lizhi-Precision-Tower-5810>
References: <20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com>
 <20251203-csi_formatter-v1-1-eb9e1147b49e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-csi_formatter-v1-1-eb9e1147b49e@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::21) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: babe7f72-d8f7-4ab1-b573-08de328e0f10
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|1800799024|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?PXDPwVnNWaIGg7OF2tdxSPsh3ECDzvOdmnNOUDSqAwIGExM8fJcNw0ArqZu4?=
 =?us-ascii?Q?MVEHV4ABW0B+eywVv0c/nVbVuJ9vI5d81SOH4NyKQ/GBokOfFPzZY2EEwzBv?=
 =?us-ascii?Q?NJiLYiEw1OJJuSGNJvA01L/OlmRX1CnI9EAyfze1LtdnOteMowW/UOhkPbNZ?=
 =?us-ascii?Q?P0R0CpWRgl6TTaln0j6By83dj06lfPvi3a2jsTY9kX8w0FCMPzt4c6qArsxI?=
 =?us-ascii?Q?uEf86Ph+9Qae8ofMPUypbtZDpeK6rJEeo+gsZ17XLDs/6k1kzVd/hbtC6y0T?=
 =?us-ascii?Q?b9xTCnz/SMUP1TjHNeN1ckL/ZJu3gY2nfVElpeW33QlJh+J1KRXDZlzGjKu8?=
 =?us-ascii?Q?91NZ9bEgtccBvIAd1qSjhX53OtHlkt9Qk0z0vAL05LkwWyUJryQbb2ndoi7B?=
 =?us-ascii?Q?LYKU4cOOKDOgFQC+PGUnocOY11UcBehoU4Rkl7aF4UNQsqNPSYQ4ApDuFg0E?=
 =?us-ascii?Q?gpfTFI/QIF67uCU+VsOAbHQ4zGvLqhljC/QNw/bIIa8dNjh86wKk0TiXcmpB?=
 =?us-ascii?Q?TAwdTbTt31x/Yi34tIosNBNkUn3lbmljjJgYOD7k6kkN5cg0X6ObR6oDM/0c?=
 =?us-ascii?Q?dpCt9ve7ORr/KCLQ0Xi72vJKu7nZjoQbbSFKvDkHkxrWUs+B5lfVJfy8NkNV?=
 =?us-ascii?Q?uLH/GI58Uomxsu1m76aIjAAJBLDA44AEC4rw9384fUeIOWzYAEUZ6p8oiC0z?=
 =?us-ascii?Q?3OcOkPqzlRlXXaJJhgKhSzQzxRzaBdfiga5o+sKE4L44ssxf4+uB7koyondo?=
 =?us-ascii?Q?OOsGdz9OL59doggYI3GJd9XG0DYsxyUMDHHhhsaC25DQiRSwZUWMVJctJBVt?=
 =?us-ascii?Q?Bq8Xdo7M1F2nxKKpJWucPAVzWNlqQ7sQQhFlgMmPqgrAgecCbYHPD1loGQZL?=
 =?us-ascii?Q?IjaTaeejPi4OjbNJcgHfnRtra4ZrFI007O2U1IcNILOPHLrJWAEF5rQ9vqG4?=
 =?us-ascii?Q?ucfN2MBqWgGtIf6/C/8A1dz+Kg6IxkTVSfyNc4XVtZutikhBf7SSSD4J269t?=
 =?us-ascii?Q?DdyFuWLm21mxu2+HOb1r6q6CEDHA7Iv1NdnTPbCsZwBFgn1xg2JOcwyCY4zz?=
 =?us-ascii?Q?VZrcopFzd3KbcmK1SEPUHCBG3Ix4SO/Z8DVRXJYmsl/fyzkPRX03Q+FZq8r+?=
 =?us-ascii?Q?wEvTNbL0uByYsg+6PQe2cl9A0FKoKh0aV+mx1XxJSyfFz0HwL4gyn7p+Vl7a?=
 =?us-ascii?Q?j/8b/yLOBYMmXqPLIzT+GaWIRqzo4sdyTGIqqlBfqAWx8SAlb7UsaOfhgzb7?=
 =?us-ascii?Q?3xtXT6aaNVlf3Ps9k9fwXQl6HS5DbxsMzsqxfQZzyKQi6wovKV8B2z/mxD7x?=
 =?us-ascii?Q?3ZbTNTG/ZmWhUPjwfV0C0TwebdxmVegiazcLdJqCOQBJPGl1mpviRthzj+3p?=
 =?us-ascii?Q?qWdiFQh5Vhek/V4MNDwO7NWYTZRfsYBUDC3efDFrK2ZcIqINj6Mv8tB9AEg3?=
 =?us-ascii?Q?dqwUoSOJRRpyGmKJPE6aE0V+puzdHoqq4eh1jiXX34Y60hEoOlMniQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?HArhci7N2DTPWBcweOSmagp4Dk8gClm3Xiva9s5gXr6VIpqFriP1MA4tTkts?=
 =?us-ascii?Q?BIkEEbXT6CczQzheEC6W8j1OY5gj/oJKJjiH6L/UORWbZkZqxAlzJpvOg3hY?=
 =?us-ascii?Q?gnEigV/8ahVMsjfqSvfBzPFrf1g9tlsusQCe0x9x4m9bDKPgreNexgAPHJTi?=
 =?us-ascii?Q?aSfGkF0Kna10kPzKRyb1rdvQKTRuOyeNd8H+DQ5P9oHHdHrgw+qQJ3iOEFJQ?=
 =?us-ascii?Q?g/6pH2HyRHnJyHqsoDwYTpTNKXpEHRli+ukAbZfJDP7+CWhN+xiqmWDKKJcJ?=
 =?us-ascii?Q?JAmB9ZLrMEmALMh1Au10c+9hrMvM8O9XRfRaLUpl0Ucw1fhy/6fDpQCmzyjw?=
 =?us-ascii?Q?tdRCJqRbjVWeXkSOG1jsdCOhbZeY8ZH/ZWVQuVtReQBdr1hIktqGYEkOtH0v?=
 =?us-ascii?Q?KznPFkfsjPEd68mfEcMocF1s8oC2yQbxVr8+nn7uUXEOfwV75nDmHf+meGLP?=
 =?us-ascii?Q?n9QAjyjC4Dg/E0cJW66k3FOWxRTf7txBjGlmPiF9K1wGlo6NhBRdDF8u8C7Z?=
 =?us-ascii?Q?NtzHmEtsRTyq3IXtWZwv2fmuZ0OAOXbIgmaG5z+4ebcRAVHk3okLJ5sgy6zD?=
 =?us-ascii?Q?FeKrVoU57EEbBOwujET/L04YjFyN37eXuChTrsmIzlY756ADlTuaMR3vt8b0?=
 =?us-ascii?Q?SqUd1OSIudC5mU2wjx3mtZgQXR4ZKXqDdBfU7cAXrtin8Zk4a5/N3ttbV9kA?=
 =?us-ascii?Q?AxQdmWTqJHWfW16AMYfSq4gl0CobnDAmDFKp6F23n2y6QNg+DU1lqmHi6inY?=
 =?us-ascii?Q?vMHzrO3sL73T7PAljHiUM2JWZ1Wzm8LXIe5QmPfy1UlamScxdo8rfI8agaiO?=
 =?us-ascii?Q?UIZUHiSt/VuSjCWtoy4cQ6gs64unVesNrPk9Q+LbnB5G6YlS5sxHnWJcG6vp?=
 =?us-ascii?Q?8Rp3qsnFgqhD5SC7vAslXWJswfOVuMRLG20uqo0EBxIVAf8R0nEZLWqrkItq?=
 =?us-ascii?Q?w8ocHyAZlQe9I0p0vShlzrv9HY+qc2UHG7rBvxHILM/vodH3muuGcfKFHo05?=
 =?us-ascii?Q?Lwjtb/hm5sy5L8logwFZfbhSMnwQ6nCrcoVGTGHcGb641TQBiEirl0ijK8/a?=
 =?us-ascii?Q?HQDr0pRgL6QSEb6UTYGvEpbpEp5odm8QbJoNcUQwcDt3DZ5wAo7tp4xf2nYt?=
 =?us-ascii?Q?lwmR2iDFrj44hOrZqLG8EBJaK6wBo+QzOG/lH0aGfkazEusAqATZGe3w3C3T?=
 =?us-ascii?Q?lpPLnLURNtrXv96l5XHkveLuajk1SMirVXb9AwVmEtUZ8WqzOy7alZNX1Hp2?=
 =?us-ascii?Q?wnJejeU9cLvHkaRVmdCpYMwORYJtXrxR1h1c7paLRVWPL06G1HYVb6cQPfOv?=
 =?us-ascii?Q?vaVMBalMhyGjclrca7eCq3SkLicSYNVH98Z2JBFW1ZB2H7BALRv4+nju3fuU?=
 =?us-ascii?Q?OXrfa+u4IMHdGZrrFprjZUwNYVrf5GgOk4rGBPXFI3X9lOt5ifEOS2I3MewR?=
 =?us-ascii?Q?pnazVY1rs1YMMy0bIuPFCPbNCP9ZGdgsQDMobfg8NeL1dILUvaY55tRJ7qaL?=
 =?us-ascii?Q?YsTTs8Iev+xyp66wFdJAtG8JBgKCrW/GT4vkUfWO+lK1Sb+X/phsYQsY8wLq?=
 =?us-ascii?Q?rqVqKxp89p+wZr6V1/1xn+iPw4BMp9UZHm5txoch?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babe7f72-d8f7-4ab1-b573-08de328e0f10
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 17:04:45.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrWFarSV80qdhC3iSwH8xBi/h+MIeqoeiYhqJQDDo4oWd0L/R0VLGxPuAjupuAaukqP+ZAP13WGjFvRA7aejZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9776

On Wed, Dec 03, 2025 at 02:30:02PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The i.MX9 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx9-csi-formatter.yaml     | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx9-csi-formatter.yaml b/Documentation/devicetree/bindings/media/nxp,imx9-csi-formatter.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c992a2a225519d3b7934f48cf1646d2cd7089319
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx9-csi-formatter.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx9-csi-formatter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX9 CSI Pixel Formatter
> +
> +maintainers:
> +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> +
> +description: |

needn't |

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
> +  clock-names:
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
> +  - clock-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    /*
> +     * Power domain definitions from arch/arm64/boot/dts/freescale/imx95-power.h
> +     */
> +
> +    #define IMX95_PD_CAMERA		3
> +
> +    formatter@20 {
> +        compatible = "fsl,imx9-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        clock-names = "pixel";
> +        power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;

need empty line between child node and property.

> +                formatter_in: endpoint {

Needn't label here

Frank
> +                    remote-endpoint = <&mipi_csi_0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                formatter_out: endpoint {
> +                    remote-endpoint = <&isi_in_2>;
> +                };
> +            };
> +        };
> +    };
>
> --
> 2.34.1
>

