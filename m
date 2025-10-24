Return-Path: <linux-media+bounces-45523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 374FBC0688A
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 15:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4EEC3B6442
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1012D47F3;
	Fri, 24 Oct 2025 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RvZ9iAxx"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1220303C88;
	Fri, 24 Oct 2025 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761312869; cv=fail; b=te/wHK1x0cahjl4q+zlPWHIGotBZUG3dcpcVliPVncRECmRNyzIPP139jmxGnD1bZXot2hy5Vvbq4uCufWEBsL0m5qypkrKbCmlwIXcluzX9ZpUHuCjo2w8z/Pv6z4jeojIrBtQGyW8Wo/WDKLtrKFaOu3N54DeNyOY8hBUZXJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761312869; c=relaxed/simple;
	bh=2MHP/XdvC0qBvBlOXhxtEkUPqkWXkyQBYEPQBCaqevA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r4fyYDCHi9IJSSQkpJpzWLpNYbU4CobPjp+Oo0A7huroN3/0DLnomJ+GEUcthZKtO0VfJQKEtLIiHQJWAHpXLtrRdX9grnK6WjvQPIToV2dMwpMmI1k3PlvS97aTe649D8qp4cS1OAV08ro5IPOzJsM/xDQ8lCPZ+cpItG/SqKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RvZ9iAxx; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bb+giRC+PegmMdTqo4rkg6lN3eySoI906lNJoLmYOdX2+nzDxvk3P3kLVIhno0LA/8sd4ZaGRxY/Xmgc0m96OXsXVbAd2b3UnrJKdA1FLdfeA8cPyvn6Ow0zV1R5BpIqwVo7PqtDdhBq9epkXOHQBGRy38Q5ia1mj2Xy6WKkuuGnO4zb/ecdV/tQ/VYlZ7XPXHSVOp9N9YwJwHtEPDdgNrrK4qpiAZ15GamosvDl5cqDapPYi0d52eOA5yn6W8rrVkLKfSwIkx/Er/eq/pzZdpRRD4FmL5WBO1DkuE25EiqpQpyZhLk98MBsPy86P/pLWupeyTi4JksPmFms3G36Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQIPN8wp4yofNlPncUoWtaO5B6WuzvOcNITYR8csPjE=;
 b=mfvMlCLufYOPF9d9ilP+WzJMGV4bhow97x/C4Lh+MYTUmTe6lLDft9DcwFbxvY6OOWxYk/La41JOl/Z/ZXVYQUBLXu2mIKS5nx7y7P322cxWtfjGLF6kahETfxnTqlO/SwZxfKC3vxZD4YdzHsApya2TJQwsiQ5Twz1tzD2hBRj4+i0b7y+7y9yNAXoV1BXE4HP9ZBP+1nlRRzdGJ39jqJ8mpa35IbdFv8GmRz5iCE/wifKm8Lb5YADYb/6s1JldglZx0VlvgzQPS+p7eo6uEN1Wt70iA0wEDmrjDPIageOb4CYGILdOY+tKczpK0u1zYZWwl/zrggcrUdjxDoKLVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQIPN8wp4yofNlPncUoWtaO5B6WuzvOcNITYR8csPjE=;
 b=RvZ9iAxxX93+IEoGknmxz9NIfaoprtagmBuMV+46tzSkeCD1XJLpPaoe61GhZlHRDb9lRA4y+s/EcgCkWxyuyupyfMartKoiE6dMf0W6N5n3z4VqNABpmkDm/KKIhRyTdb9e/m3ZPteVJ2JWp5d0BU2NhiBqh6MbpeKTBamfYn25+TjoFZWDJtCTUlGodIKn1Pt4Rgtj/vJ+ib60z/KH6KEowISRGbY6mySzWpsQKL3vlUUg9A575tetl6Xy7wPoAzn5KBOlJCu2g0/gK3jajEmZ0xNrI81kEwGXqca6/iYwcEnROb1HNKJQ6l8H9huiTakh6cVAPrNI8pkx918Gqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB8331.eurprd04.prod.outlook.com (2603:10a6:10:244::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 13:34:24 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 13:34:21 +0000
Date: Fri, 24 Oct 2025 09:34:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI
 compatible string
Message-ID: <aPuAVqVUHjrPCbIH@lizhi-Precision-Tower-5810>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
 <20251024-isi_imx95-v1-1-3ad1af7c3d61@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-isi_imx95-v1-1-3ad1af7c3d61@nxp.com>
X-ClientProxiedBy: PH8P221CA0034.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::27) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: d33aacf2-8cff-45a6-00f6-08de13020a4a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?wDW9tlWSzbvhdw9KfWv5dsIpfi0SHkMurTiIy6sCZlHHkOUWLch8civxhCnv?=
 =?us-ascii?Q?Sbf8ISLtjZ/Tt7Ote0BqkmNea7/VBzfoWFXHTlkNxAPRMSaIFh2DzH9JBmsN?=
 =?us-ascii?Q?J/h95R2PtTX2TCA+ryoP/r7RhDNVJn2O1KYyGm+22uVgXZVqvUJCevsyCxVF?=
 =?us-ascii?Q?pmjZ3z9CuO4ZNjPgRHbeNnXd55b+Y7c800LpuZ/re3g/Gv+s5qg/ZRFNUgLN?=
 =?us-ascii?Q?dAYt82Lz0p9gKRFFCXD9N94w4rbnYnf6k6PPF8VuZFt+D3JP+TeeOIdiIgMI?=
 =?us-ascii?Q?pvfwmziHmr3MFacjkbMoCJnhUYkTjygpIpNOkpP9DPSahFDWo8IiK50+dIb8?=
 =?us-ascii?Q?y1QUgBzIhi+qgCygAp1bXZ6c2ZmDymE5zJt6KNNjiAHieIoMImJdE4H5o7OM?=
 =?us-ascii?Q?SGYlqn1RRAOCkklau5RdjhKQBpoJ1KYyqoOo8x0a7bB2XMmiJOkvEEr/cRMD?=
 =?us-ascii?Q?rSaW0oFX8mPzvpvxa8MRMDgZo02+HCD5tFrlIipBH5z0ijYZSNyfYVf0JAk7?=
 =?us-ascii?Q?nzjMBQauGzVv9Vv3F/4mxV7fk8n0Co6rT+xPYmqizYbEPM6XjHg6pYgN5cO7?=
 =?us-ascii?Q?IT1c2kmrqc1f0741Wlen8fiaaRPhLgeQGwKWFJzqQE9tpG0j94M/vTklle9i?=
 =?us-ascii?Q?pYKMpMlPIReN/T7un/1mC584QRWvEBqsCrPSqHOYdJjl1QOn4yNxP7tvWaAu?=
 =?us-ascii?Q?ywPjksDFEYLMQP+MsCMgGBVY2G+t1QTjH4UtW+FXNIFkjBYVZ/25n/zkuptn?=
 =?us-ascii?Q?oEQTzRJvjWpPj2Q7V/0j8bkXzez7+DS5zPaYiBl5ClxfR5TAdZoQc9RkhsZp?=
 =?us-ascii?Q?Y//qLwFYJBxh7b7HshN0ZPkNBFRjaDuY7Y6AbN9rlAKfovO/853iIdud3e6+?=
 =?us-ascii?Q?Vdv1ChqNZEDS9+be4T2Fglpp7E0Ri4tUom/MjmBmiFeclkYz3AnJIHaQ+eMT?=
 =?us-ascii?Q?uGviaCfQVkmaZs4mJ9gId1JtM/+BaiqjEdYkRMwDdXz2/8bfn3wTxNTEkCpf?=
 =?us-ascii?Q?kBXClX+ngOfMTWqZ10QL1/BfRK683M2ORUxHb3cWjauURMD76QaGVDKgYmR4?=
 =?us-ascii?Q?0BK6nbQXuWmIiEzdASKe5nxbJJA1CmKC6TJ9i1QzJ3F86JsnXZMUKImYCqDZ?=
 =?us-ascii?Q?F94D7RDA4DzVubRJPTGV7PKFCHdtABn5yRbqkY91nKn9A4+NuIT+oYh9VlOr?=
 =?us-ascii?Q?l/OYhHtQkuGpwghMkSOz+qyorIke1oXEjv2pbt7yPfbK1tXOsRkfaUhPt3ze?=
 =?us-ascii?Q?wsS/Y/4COXWJZabl+RvH3XXCjrI2QMEnhH/2Rjd0dBjaJYQhL7ENoFj6VGDw?=
 =?us-ascii?Q?CEivRIgx9/JF8zpOxBpxzgmj8v59X+1bRCGogbmu9rqh8KSOKSG2nqrhvWzk?=
 =?us-ascii?Q?10Of0IrdziaUkv0YDAEVqN88OyY0VcEzUWGfHOs5rTy2n9CdcnrMD5Tq0Agx?=
 =?us-ascii?Q?HZVSWOknjyjj0KeCoEmZCLPugOYbYBee0LyqWfx7x7Icmdy4uozn20BT7jFq?=
 =?us-ascii?Q?5Esj3lJVn+rkJLwBIY42uNNC2CYrL7/v6ejd?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?+RMvyYbvu5FHheioQkmuB43SIDtEs6YiAzYdCOZ5RX3dwaTPAUekVTHAvbKv?=
 =?us-ascii?Q?95onj/uQexX46mxqvqVPv2xT7pg7a/et+uj8+MFTCVlwdr21PG42ePtTVlKk?=
 =?us-ascii?Q?liPc6O2BTOB+w+a5mjN7Gc8SJj7hmwG1lPqodInt2b71nk5W703f5fO7qro/?=
 =?us-ascii?Q?ZPPpZoswxio5B1KwCWCiAc7wBCkrG1JG7KQPJfiFQjEzVDXMSRsj6gyP4BM5?=
 =?us-ascii?Q?ePfDNUEl/BjQsC304wOYbdb9Y5cvzDpy4MvKlSTbDryOoA3JE891k+S+o7g0?=
 =?us-ascii?Q?zXxNHJDF1oteSiY2ddBzwQRlBZSHPJU+IjzH4OoPDpWLc1Ym9+l1csel743W?=
 =?us-ascii?Q?jYnQhNP9CU8Z0SeiA0hqA5cltWG73jkc/3ZH+D+hmXz+3eZgGZpPzY5Lu2Ni?=
 =?us-ascii?Q?t04Ilxt5RFhPgrsTdFDvU/sbFMx8WPdJU0wWuNnOEnRA6NEeC+JDf6D+9Cvx?=
 =?us-ascii?Q?j+Iab4kOJ8qawLCExMrp3h1X8ULjD3c2PN8XU/odqZ5pGijssf/hBTw1wIpv?=
 =?us-ascii?Q?sH6+W8NKNDn/3UQ8ODPvyrE4uuGm1+1BaNAEYkHdEPxSncCz4kAPrLobzTbS?=
 =?us-ascii?Q?pH0Wf0UFGopCRCmHU9gKph7ukj/8xQGfi67AXzeTx95//FTJ2EaxsAWNtjO0?=
 =?us-ascii?Q?TzZs/s9Ya8Orz3SZ93K7tEg7vk/PfJ7Y15csT13s9g3qobCP7181Obm5kM/Q?=
 =?us-ascii?Q?vJsnFNaYrejWVmpmOuspvGwiTi21ZVrY2d2fWRzO+ZfSDTN5ohagdjYtr8ak?=
 =?us-ascii?Q?W6OzpBy+FvAMnb3EIZ6jzn13PDkRE7NQXpSx8zkhQnmJ7SssBm3ulsHok6oo?=
 =?us-ascii?Q?8W8PnHumGtF1Aff8n+nnyXmBEhRgnUZChfGLt1TjVl0emwUB1zmuQWShwNZv?=
 =?us-ascii?Q?KL9ohRa1uO3zEWAqbQYNjGsELEatMnFIwBbjfDDiX+iK07KEYxrY2zPRjGEV?=
 =?us-ascii?Q?giU/FS7I4nRoUcKpEHsUo1xtTSCOjLWxfqO/xnFxZ/pNNIx5ngTyHwZyUCKE?=
 =?us-ascii?Q?sRsBJ5wc7yN+ta5dC1sB6d6S8z5vA8MwvuDyOAh2SwBfN7GCmvG/l3CVItEY?=
 =?us-ascii?Q?J8eLunFG4vcaahojgaDJRnjyWELNjN4vhAhBMAVnBn/ES6WvGXM5/im0QvcI?=
 =?us-ascii?Q?ovUZasXLL9MRAr3mb+tE1CUFXRfPINJqziZMYOh3v9tEyZ0fKN5LhQlOQpfI?=
 =?us-ascii?Q?6baa0eqc1Qv55LY2xKGsQiMuCHKgx0PLsQf+z789178+D+ptC6PoSFB8hk24?=
 =?us-ascii?Q?xhfY19BMmEonyg2L5t9h9C+KKKgwdi/vQ43PxlXZ5pKQr3jOweXUrgjeR979?=
 =?us-ascii?Q?X9vL0Qm7kcsj/XTkJHZvqRNx4UFNZIVKhld/QHAhV6a3r8NMmnGAICN2jh28?=
 =?us-ascii?Q?a86QTtoSO94G6hlTlxNDe2zNRmIZe9l2YdDya8pddnxeJjr9uIetSg+KOlL5?=
 =?us-ascii?Q?wKLzl0psrB4t/BnyuLo/bv0IVeo+CBfcLZbIhC/NY+MrI/Z1Opx6SxSwqtY0?=
 =?us-ascii?Q?n2vIDX4QdRWwv8BDi398wmR0UgInwBluJPHSzvV/vU+nkrpP2WrrunMNZedl?=
 =?us-ascii?Q?IdPQleSzAe4anraB/8V0bPC6YfZ2qCXHXDGm2Mdi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33aacf2-8cff-45a6-00f6-08de13020a4a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 13:34:21.8226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLz174NaY+tS6CzzEr/Tpqbsgd0xNWmQcQCLsAmHkf9am3nGeEZsIqPax1FGX/jrkYfx6xh6/xIcBwc81DS4NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8331

On Fri, Oct 24, 2025 at 05:46:52PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The ISI module on i.MX95 supports up to eight channels and four link
> sources to obtain the image data for processing in its pipelines. It
> can process up to eight image sources at the same time.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 26 +++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..eaab98ecf343a2cd3620f7469c016c3955d37406 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -23,6 +23,7 @@ properties:
>        - fsl,imx8mp-isi
>        - fsl,imx8ulp-isi
>        - fsl,imx93-isi
> +      - fsl,imx95-isi
>
>    reg:
>      maxItems: 1
> @@ -49,7 +50,7 @@ properties:
>    interrupts:
>      description: Processing pipeline interrupts, one per pipeline
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 8
>
>    power-domains:
>      maxItems: 1
> @@ -109,6 +110,29 @@ allOf:
>              - port@0
>              - port@1
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-isi
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 8

should minItems: 8 because you already limit maxItems at top;

> +        ports:
> +          properties:
> +            port@0:
> +              description: Pixel Link Slave 0
> +            port@1:
> +              description: Pixel Link Slave 1
> +            port@2:
> +              description: MIPI CSI-2 RX 0
> +            port@3:
> +              description: MIPI CSI-2 RX 1
> +          required:
> +            - port@2
> +            - port@3
> +

     else
       properties:
         interrupts:
           maxItem: 2

to keep the same restriction for existed compatible string.

Frank


>  additionalProperties: false
>
>  examples:
>
> --
> 2.34.1
>

