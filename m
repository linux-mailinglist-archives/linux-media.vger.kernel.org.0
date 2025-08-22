Return-Path: <linux-media+bounces-40769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E022B31AEE
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D17E1D21841
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EFA305043;
	Fri, 22 Aug 2025 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d7CvriMh"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011056.outbound.protection.outlook.com [40.107.130.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5CA2EB5D1;
	Fri, 22 Aug 2025 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755871638; cv=fail; b=aT1XVybIwTBL7uJzeOv+YHOZRwTXwrNmX8fteLV0St32OirEkN2Dx/bm+6wR+xB6TgxaCPnNp6dgTyaLnKuGmrWXcWdy9zOdcHRjRGtDWCzW8r3JN4jwCCCHPF8SWELoMQ7n4g1kkSMYLNyJ0CSoe7kiRgRSXaGMZyW7wHtaa6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755871638; c=relaxed/simple;
	bh=5xpn8Y1fhXZXTTGyU9u+TFLVFbj1JvcwvKh3YDRmYYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jLPwhmbwUmVA18K/gEMbApx4aRP4MEUVpF6YfiA/f9daPJUTNt16m4RemPW85piJhG6nET33ZKVqrvTxWWvs3cL/fDjQuBYWXQ7S8mIVvugwvZOghKwcaNdauPk34F3c9aL6UOpKAyTDSo7m4YmEtPk/J2cMR0z3Ztog7tBqnzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d7CvriMh; arc=fail smtp.client-ip=40.107.130.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s386zwX7emc3KMXLn+NMe2Ru1xSq8fPoK/e4bAp5tDzlLK1ybJfAnk8/lyQSiw3VWONWo0gL9x6byqsNMZa2Tz1azDNAq9D4/Fkk4wncVPgNYs+UcnhJs5Ry4L1dYOZ51noD8YCvoTD8Ca0pwUEBENBp6OOwuvjZuTAsaMVit1CUF9tPFOfiVCYd8KTqUjpF9I9Ps2EEuhy8WZGeburqJvvvk0vdPLoeh/IAmowlYauapl9DtojztFw7MjBQU8GX7WIX0MYhwkcgRs7ZIZXk8WuNzRKHYQwBfkdP4MJNhzbS/Aqf1YgDKScxmvar5a7fkmoW4evBRR1L8FxiCarYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cd4oEp3W616B4Yp+NkVDAdpo34sCr1KAz8aFfTkt+ew=;
 b=oF+1otnv2TSmcxWFn5ul9Sx/7zL8WGtF49GB5/8ZQlb8U0ZGpz+uf0lsRxTaVGRd06jXqddtzFvlq/BNneM84vsdSYWPH3Danf6WynEUvO1uaiQXvXuLvB0yHJb6+vI9qflhyKd+Bg0cwSw/Vk/yqs4HdgyM+3MvL7xC6xEwGo7DljDm3DTu9rxkxPPy9e02nVi/bBtjZEFUsfp7vESt0MXzt4j0RHfBVCGxo6b+PlGs2I6+SAbRC2sRkduVROComAUId3i2qpfSm/0CsBVIJXeL0F7axM3XjbQ4BVsxROdAM44kk4EVv/nm04G0voQ+0vSpj/pmSnqqnU5qRWT7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cd4oEp3W616B4Yp+NkVDAdpo34sCr1KAz8aFfTkt+ew=;
 b=d7CvriMhbNw0CO55oe6eudBNQ7cyZjIVFyacLGn8XAiONAkS9yQnfZbNwGMj3FadXeXAtaGUkxHPkGabL0xzjzEOjpHkcFJnRUuYvjmdU4u1HQoc7uuRZtTxwr7DCfq+sdqbniTmljAoMdK1sOsGGnm9dMqF2IAzEm/IhaBCDtEp3SSBrK23bSPsKfNnqlsVdeqcq5Z8pZ2HffH8mN5q/SasF4EkfF42FC2qkE0ckBsSRVR6tAPNorUU3or/cMxHz6LXC7DLPWhijdP+eFxu2clZ8QCeNz8Ylb0Q/GsZiRwkTcU+UX8qOdUN1DnU1+PRzI+0n3GIKGEl4Y24166Oxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB8993.eurprd04.prod.outlook.com (2603:10a6:20b:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 14:07:12 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Fri, 22 Aug 2025
 14:07:12 +0000
Date: Fri, 22 Aug 2025 10:07:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: imx8mq-mipi-csi2: Explicitly release reset
Message-ID: <aKh5hsbbGjmKrnxx@lizhi-Precision-Tower-5810>
References: <20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com>
 <20250822-csi2_imx8ulp-v2-3-26a444394965@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-csi2_imx8ulp-v2-3-26a444394965@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::26) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: 2097d8b0-6185-47c2-f131-08dde18530b0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|19092799006|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ERAyglKj15f6mODkNLuMlptj7SnOnQYhvKebNK6G6GF4GjnAYoTAB1tEZ+l6?=
 =?us-ascii?Q?njeWUlACFZfwYaOjgkgpAWGmuZUk1pKIce51MDV6PMPziIZqNt4sULvQ4u7G?=
 =?us-ascii?Q?Rs5OiRw3rw02hDoyfvY/6aNbmjDQDrB4PhyDlRCsHjyMoADD5XWDXUSCmVBG?=
 =?us-ascii?Q?f8ti3Rm0OjRcShKOwqIDMHhJeO/wWeZiCTykEdwb8ciFHVDlPp/pUtw7C4eR?=
 =?us-ascii?Q?wIfwTjJUdnni+0H+vSYUyX1oBG68wOrrDhK17eFDVcUPitN2tYbetxdLzF16?=
 =?us-ascii?Q?v9PgeMjLtX5RiTiaDZbY6ZplouQjA0w9NtlNT4ixI7x2udcFDQ4sg1BQjELP?=
 =?us-ascii?Q?sMrpsn7qlimobv2qb8j7GMze0ZigzjUiWVmpM7YosMTUDtHh+dvBT4FMHYHO?=
 =?us-ascii?Q?YS6v+3VqiFuUrwoAou1ywy1u6ub6SfgWElchYahMyR7dJjj4UJUJslJrslmf?=
 =?us-ascii?Q?xDcRJT527hyrhjfWRNI5sMXWQZuarhVdlPXNlGAKxGN/nwgtxDjFzbbj5Xxh?=
 =?us-ascii?Q?oOMAlufhoDFLLYPgUNYwSKEXMQ3ON8PUrsr931gwz3jP9uG2WF5EUBrTsXCs?=
 =?us-ascii?Q?e3bE5j1BmkM2Jw2k0hq2GPI9/l2PA+VqNDANnAHkESm3wXHa3bhTa6bpLAUh?=
 =?us-ascii?Q?4nNY0F38TzdXdZNHa1hcVGp5XKlKqBc0uf+FVpX3WxwNbc6obbvgaHyTibwH?=
 =?us-ascii?Q?OnM0xWp905oBpQ3K3cBr+pnK9uHLb1gzIabkGyn6Hx68EzVMTYm6o34z76lL?=
 =?us-ascii?Q?mSVU4CGiQUEjYLB4o/gHN3xrRAxPUu/Vi37m4IQQOchjIeEUNLfOU2HTBcMP?=
 =?us-ascii?Q?MyMzuinsPIW+ei+ZStwIdbNeWWjs1KASOdL1u/HrxL/llDlOZFpPZKa167uy?=
 =?us-ascii?Q?chYcOYnXyBkPhvEagJl2enYtVuXDO7HUHyhDsC4S8qm1pR4Ata7TGEckRWOV?=
 =?us-ascii?Q?exOFgZMR69naWeY5YPgRLArcu3mxeg0y9D1UeLuwWwapK70nkVHYRFm8fqjV?=
 =?us-ascii?Q?cSu0y3swI1hqJp3pDunOabhY0Rotc5Eo+au84cI1mKmzuYstkwNCNfUT5P5V?=
 =?us-ascii?Q?5/ui8Lrb5RZBe4KsYQ7K+OgkNic6Gi0sVhdfO9czoWkQdlYKaUQpHm5Ymqvy?=
 =?us-ascii?Q?H1AHIAwCET0xvEjJRALFU2tfSjy5OtEsiXpm0Gz4ze1PQv/9Wo4Idb1BJXxq?=
 =?us-ascii?Q?3t+yndQzxfpHMG6uiksMDcYhdDo32xKkPn81mXb5F40r3xCfgfs5sIUX44uH?=
 =?us-ascii?Q?YGCC5mUcJiNFTJGxQrFL5F3Wqd6BZh+dC9RbTqIZ4MDp/3Z5d6FHdDnG+hwj?=
 =?us-ascii?Q?co07papnoF19WHXdD6RcfgaGiEEQQzO4azPjX56TZT2QMtKOzZUoPl3Cy/zH?=
 =?us-ascii?Q?PccYvgi+OrFgCTo+h7jB9q2t/n8CWGdfWTlHbNPw3xAwc9v/YOW9Zz+ziY17?=
 =?us-ascii?Q?FCVxl3LiZN9gy8eV30rLMbLw9UsWtNEC/AdOKBo0m1dzkXvvhYky6Q=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?sgdxNgXzhF/2Zg5ww8P6MnrltU87Q8timNp59t9ddhSCG5b+r9q0bIuKvAKT?=
 =?us-ascii?Q?Enxn4i1YXVLbI0kyJuM3w8JhMvi+zunDKjg61MoLm92E5MBMgnTMnWeM0N2M?=
 =?us-ascii?Q?Cw8djyGq/1wx02yr8bQQzkQKkjQ4a/1roHtGoQg56nMz+bkvH/8BCWyX4r9Z?=
 =?us-ascii?Q?rBNsJ8zrc7FAFuIOf3SDicjCEIAp+Qv2eoh6XuTB038r0VStpqhUW5pnYcCU?=
 =?us-ascii?Q?1JCsdzsHkGvH5CSUf/tFawNIIEoKgu535+qsSmxQpjq3HsZytYNTR1+AZ6Yb?=
 =?us-ascii?Q?uX7t9NMDJJC5w0KoaqhroXefZioHeZmlOUfM9vqCKcFQ9LawNWg7obRoO+T4?=
 =?us-ascii?Q?5cyjs00CxzRmGSmVRhHZ/3XM0DU0wW+sg4JRJNF/wxw/60exb7I+JyK4lPHj?=
 =?us-ascii?Q?mJ7g5G13/cNINhdrH8P7TPNRDw8RJt6EPgljRYdJCtKheK3yYf9mMIbqwy4+?=
 =?us-ascii?Q?C5zIQqP0jiIgyi2i/hdvYWOYTQyJ6gGG3B9aFHSMu0KJTERXb1/aCP4+CncE?=
 =?us-ascii?Q?zLkHzKdzQIWoE4oHHw5ARkH1ZAiKuilEbZPlMZ0J/Fc+Fy+nyvNPQ+fuQsA5?=
 =?us-ascii?Q?QHJvaTJyM3s1xpw+uJnpGI+ygAq1Fpm2tIqYR+QRx+EqGWPHClmWQUorkkin?=
 =?us-ascii?Q?0A6ylyUDKDoVIOw4smF52UkwLyOI+VNhQGoLepst0YIlP5QeuvJtLui8h+fM?=
 =?us-ascii?Q?6xO8leFGaTRJ1+sfoAJGK+np3yZP+7KlZ70DFz+C0yMnWWTuwDujI+WO7CgU?=
 =?us-ascii?Q?o2GAGYYFCJwWewb2zJEhtwef2p1RmPv01ZafXIiB8P7Pt/ztaXEdumBTKwcl?=
 =?us-ascii?Q?bRWKycRAEyaZu4ZwCnMzjhzpeQ0tZyV2pN/2eqPzqB+Eohy/BcXnXmnXe93x?=
 =?us-ascii?Q?bdQEK7h0UoEMNCNZdVpyd0yIRhjgAdKdI46P5yp9Jf8m3fc8MPsTx5UE0gkP?=
 =?us-ascii?Q?45jOK4aH/JPANIoQuVF1hr9toOaVDRJJ33blSpaME7D3duISh9Pm0n59Tb9H?=
 =?us-ascii?Q?tGWSkD9/Hc4CWKfTWovdkIVynjxV6NxftCw/Y/lYiURS5CWwrCmyBKfq4WJ1?=
 =?us-ascii?Q?9F0A8LXbxU8oLIXB/2RsTL9wEaO2+N+QC+S0zawshK0NoD8RmyWrryVKuS6b?=
 =?us-ascii?Q?a++2uUOc/eGGysX/AGBJ8RuBOKZkvrmf1oY79WDJScyQ/se7iPyEzRx3/4Sw?=
 =?us-ascii?Q?h87jFCrwBYOOaPY7xlzQQmFyVJOvQJdmKl9aklUPwPZINXM617q264I5kZwI?=
 =?us-ascii?Q?/Ho+Tk6L5cVtTR6+7mBwx46QwgQpTezoEO5QjLpntFTnrSQoqXsQ6d8GVGgG?=
 =?us-ascii?Q?gTc3R9EYgRtGWufnDDnH4gUHC2SXTfHHS78r9/iFSX7QwftYjitaOVDXTLsk?=
 =?us-ascii?Q?16gXu7RLS6iZgYJXb3mEKX+9bxktzB997vyIGVXoO754mVxVilFkasBf5XN1?=
 =?us-ascii?Q?Jwn7S53vxvzJAPXF1egCmpAjpdNeQ38G7NGCiXZyffB6MeXHmAIsOqgJKhvd?=
 =?us-ascii?Q?SJ9MGeMMlk2nMDs4MLUJBZrHP5jAt+ZiOnUW6KN/1pDNX24LpkU+IjO6QJke?=
 =?us-ascii?Q?bhsGL9uHSBYDPrvx2RxrTNPU/nr7Ih0OrrB1MQzg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2097d8b0-6185-47c2-f131-08dde18530b0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 14:07:12.2207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwywJB4aCx/AbY8TZq2jJUhX0+KFivhrCTT+RNTcA6H3/bK0nh8cVb8CwmxCKMorIujdTr4XZlasdaW6sWjeVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8993

On Fri, Aug 22, 2025 at 06:50:14PM +0800, Guoniu Zhou wrote:
> Call reset_control_deassert() to explicitly release reset to make sure
> reset bits are cleared since platform like i.MX8ULP can't clear reset
> bits automatically.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 2bf11984690af2e687a3217e465697333d9d995d..6b83aa85af42e1dac25cf29056863680c1f89402 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -337,18 +337,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
>  {
>  	int ret;
>
> -	/*
> -	 * these are most likely self-clearing reset bits. to make it
> -	 * more clear, the reset-imx7 driver should implement the
> -	 * .reset() operation.
> -	 */
>  	ret = reset_control_assert(state->rst);
>  	if (ret < 0) {
>  		dev_err(state->dev, "Failed to assert resets: %d\n", ret);
>  		return ret;
>  	}
>
> -	return 0;
> +	/* Explicitly release reset to make sure reset bits are cleared. */
> +	return reset_control_deassert(state->rst);
>  }
>
>  static void imx8mq_mipi_csi_set_params(struct csi_state *state)
>
> --
> 2.34.1
>

