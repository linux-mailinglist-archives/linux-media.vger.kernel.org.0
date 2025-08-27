Return-Path: <linux-media+bounces-41194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABADFB38528
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 16:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8E051891858
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A4F20B80A;
	Wed, 27 Aug 2025 14:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aReWoMVt"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E698472;
	Wed, 27 Aug 2025 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756305659; cv=fail; b=TE3J5hjo3Z4V7gf/LWuDzJsU8eJ/DOplOA/uQHBNwhsNEqaGAEe0gYWLttReJv6kVsqYV1+V3bbHDIKZHjw+v9CrFkInz0PDFj9j6S1AAroZVvQVhR1kBfMvk3S0Ntu5YtYaf3Zn6LCt4lPnbXDX+ef4pSyhgOyQzQAth3LAJWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756305659; c=relaxed/simple;
	bh=EpzSbeEONqoQHzn5+Net3dzOaxY9Kwwnci2kgE7K7dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CIKWsaxzboUHxJuV8oA8qK9wx07+htRJKECtTS+d0L+AecqUYq6krMzCYxqw0Ou2+g+/rcu8QV8PlYMe4XTZW+2iFPK6VXgf/ELWadp5s5g+NqmcgJvjOPiGmPYaPJfBDbDYtqhN0s7TtS8JUkD5jT9eVYllxmTQNsnElJdkmLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aReWoMVt; arc=fail smtp.client-ip=40.107.130.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcGKcWqWc76oI8UA9ffP9dIAqIos5MBv16+A7xjKdYDOSicVBB6v7T/4jKfhRqHytlUNjtentALBCezauAtsnia/xc21KyLG2Wv12OxsG3ReN00vgu8TzPx94jek0+2ROKV/aKmbr/cKd16E1p6l9oVRUwJ2DEKGbCjNoCEWWpCEZ3GIbUVt/FUIIJPPrN51o1xS9PB3zU1D7r7H3qDKWQKThzqZKR5MHoRMm/8Pxe2YDJlHnJ0x6eby0YMNg8Ep0spTgBthF3zdcayBft1ile1yTD2xS95v26TilVl86vL9bRtgEcxD6jPqhqhM5DwU0ae0My2+/XJbhfd/txuxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpcn2vux79IWFeIGsdA+akP5mX/5Exh5QppyLIShFmE=;
 b=GFUDiwBblH1C1ol9kpHAT29na3EGPszIGwlvHR2IRWj+wwmXZFA2gqUVZ6YNECQgxUaSC7UnOOUR58N7pcqLbV3nfsx6hCalOSAxkMMDfby3u+2ktKz8S0VlTYYxG/tsvNltwiZ7h3LQeAnj4jQKptuCydZ1VBD+JH3GJmA5K42LhS5GvRFP/zvUqr9i7but6s/EYt74rdWDvorU5WDaTER9ZLPEzvd0U/7c4C8CFRXs6yUPwT7lbM/R3kbEcJXWtjCqYAB9q0B7GISnNiFpXVvdpOXoeDUWNpW2hmDrhXck6wmOSBU6oNbeen1+b3+cJGRxD/LVo89CwUTE9TMYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpcn2vux79IWFeIGsdA+akP5mX/5Exh5QppyLIShFmE=;
 b=aReWoMVtv1rJqWs7YGGkRnUWZQ0u/ps8VsaplsrS08qCv20by7WfcHs4qpD6rfuWB6CGhMIOh0vkB0yzhNf0IH4pkXQ4WcxJ1cu5ucyZoUJXXoJ2WlDF9LTdmr26X8ivXJvmRasOdLsYlvSQfqgiRcr4+1cAj7bxPqL7uYNcyYVn0JRteBhyXu114eneiINIQywie1cRYZ2nhkiLOZtGn6SJsS/YD7B69NqlEMCrDBwgkgPTic2BqifEa824c6jRa1WQIBnXZ7qNwWa5tX4RDoOCsTpnA8bH821RtF6W/22VWVjEmmdGxSdUizI5azbktMqZsLogVErAvRsDget0Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DUZPR04MB9847.eurprd04.prod.outlook.com (2603:10a6:10:4d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 14:40:54 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 14:40:54 +0000
Date: Wed, 27 Aug 2025 10:40:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
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
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH 1/5] media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI
 compatible string
Message-ID: <aK8Y75/KY3wxsW2S@lizhi-Precision-Tower-5810>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
 <20250827-isi_imx93-v1-1-83e6b4b50c4d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-isi_imx93-v1-1-83e6b4b50c4d@nxp.com>
X-ClientProxiedBy: PH7PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:510:339::31) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DUZPR04MB9847:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e10211-1317-4510-2e2b-08dde577ba2b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?u04vXR7mLHBsze0rV/wewZrPeFKIWPvK8MMUKje1hFU76jiWBpc5hDYTQVce?=
 =?us-ascii?Q?G7p2JqmBNVhrTPCQySt5yulcf5WlUammu2YuDbvrrPEpYD0zPXVY50nAHaVg?=
 =?us-ascii?Q?anbXVorcp2j6IM2s8qC1GjVUMk6BdwMLNRcG1JLROcGTUf+tiquhBrMqgNS8?=
 =?us-ascii?Q?t8U5GCRN2HrUvcLGLo8+HT9DtG2/j4PikUcImm/Cmnlbq4A4aLxOg1/3x389?=
 =?us-ascii?Q?L/0DD1pvd//L1TwnMHjT+UlzfyLDRCW3JMDu5VVb6yDohN1BuvelsNVmyoAY?=
 =?us-ascii?Q?OjJxF402e+Vx65/vTyG6WazjhMlI6NTb3j1cRamu4rd+7Y19m0AnfWgUzD4c?=
 =?us-ascii?Q?MXcA8lRCeV5wptPkVxwsx0r1FYhnj/uWiMjmhGfs+3sez5/+sXqY1M9f3Rym?=
 =?us-ascii?Q?zZWJHAjiEL5sk3DhqYyMNYvSkmXPmfZ3lHn/BwvBIPBqe2Vl3T46jC8vzNyf?=
 =?us-ascii?Q?QoAJOM/GDg4nMLCGTrtl0KSNoD0yYy9pSh5hT6kxx2Um7PcOXCNBH7T7SZCt?=
 =?us-ascii?Q?J3TcgNnQtmX6IXbr5nrtrqxNOOEXlQ3aLbIuBlD0qCwbtRJ6g8zerlCbAy+s?=
 =?us-ascii?Q?wUOo5G+5YbFQKIfK0MidFRH95c9n7kXWSoBtimfvDYp6xMcMDgXbGjc0RzoG?=
 =?us-ascii?Q?7F5KVKY8CV+uUuE+RiuF5r1qUg96MeQXArMD+cLqY2nRy/HdrAmw7doqHyqU?=
 =?us-ascii?Q?xyol807bgwRClsQWiL9vApEhbNEr8bocfSTysSHJEPPcUFx3IEk2n1e2LWYh?=
 =?us-ascii?Q?OfdT1cWhgHW6qjth/g85Euiv9Bj66zu8O7V7F1+iEr4iTYphj6/aTXET+i0a?=
 =?us-ascii?Q?OJr6Z9NN0JAHMKVZ+T0vG5t6Q/whL0rdvf1Y+NBAH270IoguteK+iihmNk9B?=
 =?us-ascii?Q?s/obn/SnyRrGPOhOUVYU0Jo+FFWcMyPM94ZsZTpJgHTf0/JT+yW/b7N1LGHD?=
 =?us-ascii?Q?j8FwPkrjp4dthX/+04x3cstJeejOwsCyhhad6I83udOBvxXmKP3b7ZtaXkXD?=
 =?us-ascii?Q?ZRUFWlYi05FhNFaiQGXnJpfeVtpshJCQC/vg8bIV5r8D0DFlLwgNRcG229mo?=
 =?us-ascii?Q?mQIm57Vd27Oaqz1pMm6wdoEEwadz+1ZF+NHf1kpx7L/J1YTZgJrwbzbkmbcs?=
 =?us-ascii?Q?UG6PPpTWO4YkzGHYIfrB/SNzVNaoL8LEMe6U5VgdgVAfHh+aJW0yg0+aEOCX?=
 =?us-ascii?Q?kdJeeiOJyXiaybZ2DYrO4wrureVuoOblphUENHtn+e6xmBfJn0MHohlbWQTi?=
 =?us-ascii?Q?JfT2NvOaWb+mxiSN3HJf5YuZ13vu88tIVjitfjsEB6NXbwuDqJTBkcWr+EmA?=
 =?us-ascii?Q?56W/fav4K5gqDwFKcrgQ14u5+alwDYehVvGy1vHYlt1Qhrzyk74GWQ99bYSp?=
 =?us-ascii?Q?YiKH0AeF8I72KHDEZWmIl3RrmnhGogcf6e9c4lGxgJDXYo6AHoVvmO39D/2G?=
 =?us-ascii?Q?FnRXt2R2ToYTXA+iAbEzzm7f3hyn5GWJSK196Pzld7KavHgrblby7w=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gKKe1pcnJ3fF4tEME+kva+kx8t+EZnLPfwKpHsiIqPdnPtd3caXajgf5L7J+?=
 =?us-ascii?Q?9Z90IWrkr1X8502E4tsHK9bTtbNdfPwgoA0wzevJJEztiWOLNYZRabXWDamV?=
 =?us-ascii?Q?zYF3QCNLdlq4m4BYlp/tkSBsWj3Fm8GWRfMkQbeH8AiQBECRwFma6zB3GlsB?=
 =?us-ascii?Q?h01Tr69e8i9tfFRfjHA+jymt8u8CpZ+3WPIqdEfkU0EoQQ3pHDy7o8G7+AB4?=
 =?us-ascii?Q?sUl/tkOF2lQt/9VnKEp60ZS41B3GB0c+WU4YrAUZUsuNG0kw8Mg88dgsMCxl?=
 =?us-ascii?Q?T9kVEzYcXbCwsZDUARnkLGm1epfaCxJHkTU8K6UmrDmxJ2/Rya3JZH6JQLAH?=
 =?us-ascii?Q?BOozj8yuJfdTLIJcij5zhOZ7Chnq5c7jJZKq+k84kyrPrLXrdlAW69mWSjd8?=
 =?us-ascii?Q?U7J+1etMyHBC8gOhaFyJQUWCcGySDXqfrwWBktNEC6e9fFZ39tb9ehMDjS9b?=
 =?us-ascii?Q?EhYYTRpqW/cpGWyUZFpRN5tUKjRfconReVAzFN/RA0gKS9Dzf0kXg4m38EuN?=
 =?us-ascii?Q?DZ3Os3j3ufXZLmAVttdUkSEgHhssWQr+byIaHDcsHg8jdnh+I1IJ6rg8IT4E?=
 =?us-ascii?Q?sNtbzAd3VMs+TdylFZ3F649R97RrawaFx/UZaBNUoEYnBjhkNz8Ysxz+ybT8?=
 =?us-ascii?Q?aBJrSyEoPOWdBFBxRYn+SQvOh+dXS1vtMjGiJe48ld1nRNsLbNjVbIZlrdAd?=
 =?us-ascii?Q?5DAdaSqhFUwMaMPHqbqZcA8TSGTFJ+YDLJR1JWsXfG6hnpjmMW0nQZL2sRsD?=
 =?us-ascii?Q?tqpUQ9kY7We83JTDv7oChe2odbjdGAnMODuAWbnwX7deM6AVAeb9a3PAkuj4?=
 =?us-ascii?Q?qGAl8ESFV7qX9hjzNKoCF4C1flua1+ssdrIaDCG3JcOkic7ZdcWC3abamCsX?=
 =?us-ascii?Q?FesrXI9/RE4WrPzN+J2cGqoOROjl/E7BgtJWM8SStIYrvYdTs1PGF2HC6jln?=
 =?us-ascii?Q?Nzyi+u3v7vWdcxVDqSo50JlUizpXoKnYA0f2v+QuGuNPZwdStaBLUz3Mw8wv?=
 =?us-ascii?Q?IfTapUHeAiRmFuq0rwQ7q2u5GaPOm78cdjRLUK2WjoCyXnSaVj0uyAJLRira?=
 =?us-ascii?Q?Ji4QFzna2Ee7F31xlkbseh0WqnM5TtFdq3mQrQ+snhLEyAU/XQCi9UDaGyRs?=
 =?us-ascii?Q?Vu7OYCffXFrwAJHHMRHDRTi599vWeS2FWM8PxOZKAuHFJ5RwrDEkLbkaL2WQ?=
 =?us-ascii?Q?XoOcpKSY+t5wPvdGTXk9hs3bq9f2QVBbxCuzpWT6IC6a4kO1ma3ocRBagC8O?=
 =?us-ascii?Q?d+jnYFhSwdCUM8S8/NZ+D/P+bNzCfUYM9SOEEt8ekVpIPSd0SjmYH1fFQDWZ?=
 =?us-ascii?Q?W4DfFS+kVOwaJDelevvr4ORR+xOafPfDai73UzZx3/VZN9W81ivs0y5a9bd1?=
 =?us-ascii?Q?xh2vAd0KB7fakUYKLdITwLM0RZaHwjS47HdghWk6Za74DJYk9133+z5GLbLW?=
 =?us-ascii?Q?omCBtWP84sp7/bT0jhf0qEQ+AFbaZboLN/M6hiDyUz7l9qaGMhbtiXQstgCN?=
 =?us-ascii?Q?lXKqli2MLoB34uzjiJD6oa44igpdDouSXn6ECQe85R8khC4s6piooObFrHyH?=
 =?us-ascii?Q?CZiVf/yg/wXDT0f9wULZttolN4tO0/f/R5rs4Qyb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e10211-1317-4510-2e2b-08dde577ba2b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:40:54.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wS+MekvNRnJQRUKdx0xbOcIGkJEqzZ7jCphZ5LXuFE65EDrvKZZdHm1Hn1ENGFnoYDuLPBh2L+jsrHbJS1YCSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9847

On Wed, Aug 27, 2025 at 05:53:48PM +0800, Guoniu Zhou wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
>
> The ISI module on i.MX91 is reused from i.MX93 and implements one channel
> and one camera input which only can be connected to parallel camera input.
> So needn't to select camera source like i.MX93 in gasket ops.
>
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..001a0d9b71e096db3f543adaad40b84af378d707 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -22,6 +22,7 @@ properties:
>        - fsl,imx8mn-isi
>        - fsl,imx8mp-isi
>        - fsl,imx8ulp-isi
> +      - fsl,imx91-isi
>        - fsl,imx93-isi
>
>    reg:
> @@ -66,7 +67,6 @@ required:
>    - interrupts
>    - clocks
>    - clock-names
> -  - fsl,blk-ctrl
>    - ports
>
>  allOf:
> @@ -77,6 +77,7 @@ allOf:
>              enum:
>                - fsl,imx8mn-isi
>                - fsl,imx8ulp-isi
> +              - fsl,imx91-isi
>                - fsl,imx93-isi
>      then:
>        properties:
> @@ -109,6 +110,16 @@ allOf:
>              - port@0
>              - port@1
>
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: fsl,imx91-isi
> +    then:
> +      required:
> +        - fsl,blk-ctrl
> +
>  additionalProperties: false
>
>  examples:
>
> --
> 2.34.1
>

