Return-Path: <linux-media+bounces-40628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4482B2FE07
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00A631BA0EB4
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F402D94A6;
	Thu, 21 Aug 2025 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZDeuAyAD"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3105B20D4E9;
	Thu, 21 Aug 2025 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789088; cv=fail; b=CL3RkYiOmHFCTv9Z7xypu1e7xrfhoi8aj270vYItuVmq0Oa190vdk97ZZbOoyJPVuxYhwaICe9s2pHJ4yJ4LyBby4EDBpK7ZkdPgBaw98KDzuYUy0E3FTzuAjvRBqUcsf4fnQ4ywNs1kzpYgFWKxgW3MtlCL4WPMd0XG1cAj+ZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789088; c=relaxed/simple;
	bh=f6HY1lJMKEo/FO2kp6K/dF3wk8M8VxDUyf43UsUQews=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EcNyb2BlVZqBHisoNVTD0IC0tYhQ+H36BmaV1dPpxGDiTvsP3/URSLMakIllOEKQ6PE/tMXomPlDlKPc9650Plo0PLRfs96Gsi+KAcwdLKpv5zNEfogj4eTW7BvFLGcEh+D1iG8voTm/I7cJSlQAc/xN7/RCP0qAxreRXEVrChk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZDeuAyAD; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuomgdxEZn344o2sD1B0Rnetd9CjjlHRkgrvi6J9UXKy9zy3CRpg3+VdZ0mieLfMAbSgg992cDnoIsc0YuUTzNgNHjb2s4QIDYB4hocCnYD34CFcw+Dssrl9nGJLIAfLAmL6BWd7/YuET7yHJtzcvurZCx1y95cb6SYf5hin9VqXhZO7hmOMrqaQcFUpAeN2CsXTzWo7/YW+D/RKirX3sHlcK2LT1+KBNWb7vK9liHnw1w9YOlTWCJyZF2lT+oL+5bapK/M/B1zZC7ie28QrVWoIQea2xKePy/52LP53otdWGU0CSD9idXuPqfBfnFz8baxMfXsHqnhtouXUduoeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itO8TVesJtN7kGVhiL0Dt7tONOCpRhpb6gqNZAxawnQ=;
 b=pfEgWXGBJSQq2CLnj7MFUckuZ+Ua16Zzr18SI5P2idzQKtL7PSbSji4A8ZeffdOozkC23C21hgWnkvfU4lNA3hqw0qc0RBz18R3zMef5+ROac1uhXaHZTWwmBVkujtr4P0Pk251RFPOxQQnLNW0dj8y2Hv08LAi5aTNb/d19NoEmw20SfSLa7Wu3gOzbvD4xwoZ69vQ7a0H50bhtANUytgyEIK4kKxfOnq3HUKG24d+zUKMTbsZ7ZDmX2icKxc09KhFawBnuQp/se+PqNHIhw00e2aQAGFcKH/ESmq16/NTJaYI8B3no1hv5fG1eOVP/Rac8cQzOMcwTj5uov7zbcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itO8TVesJtN7kGVhiL0Dt7tONOCpRhpb6gqNZAxawnQ=;
 b=ZDeuAyADixzxVJLjULA0SkxwSEVI41evCT93Dfp/6ksHOhWj6A1A5uli8/r9Ffi3BWhRHJjGELatHn9I0IaVQ6dZogzQVmcG3mQXVi5HzhygTxYonMitMrFusx42Zp2e4ERIdGFXATiENR4V4S2RIZixddoVuWcBzAetgjd0D2Pj5kL/XKeqCP9H7dKSAqNrozYa+CsWvPwKkuYY6yvTVHcosLY8yxZ0l8AQBec6cYbXxObdsMeOdFi/68MqrcLDEaDxPFgdzSzR6nJjhCpHeUZb05Zga0rSqrZILNrvRmii7fHYya7c0CPa/Ucj15jYqd4KF1RHEXFGIkif8UQn9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA2PR04MB10373.eurprd04.prod.outlook.com (2603:10a6:102:416::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 15:11:24 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 15:11:24 +0000
Date: Thu, 21 Aug 2025 11:11:15 -0400
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
Subject: Re: [PATCH v2 03/12] media: imx-mipi-csis: Standardize const keyword
 placement
Message-ID: <aKc3E1EjOHFmUSBt@lizhi-Precision-Tower-5810>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821000944.27849-4-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA2PR04MB10373:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d0f3af-c344-4ff1-c498-08dde0c4fe7f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?gQHo57sFQr8U2tdIB0XJlsv3x4XXoyhkaN6HF9DwWO1+RK6ro1N4ik045Dfq?=
 =?us-ascii?Q?ZkclY+IB1uqOeS74XCmqIoRKdL3qdnRyi+hlbWj3HAyocNkLJO7FREqeKW5j?=
 =?us-ascii?Q?S4OLS4EGrdRWUlruUaSoHhJnIZ6NsQkTkmLn9F0Q614LDX8PCe2Dth7Mhkb5?=
 =?us-ascii?Q?vrIbCe0A4zSxNj/1myFibZIM60JGox2lcuY8kecap56HISs2CmiwVOKcbWJ9?=
 =?us-ascii?Q?AWXHll2uPMfxV36SQ3qUdqXXHiJ7gCpMq2g4vSkIQ58nP10ke8tcQDi0l2yE?=
 =?us-ascii?Q?qMTDSLkgtGtVd2+wA1cjmoh6APbeK4MueWfx+MWyhNaL4Qro78AQbjOadwME?=
 =?us-ascii?Q?UatHDp+jvgShdVGr0SIfbTYWlCpeyQnFjQUkhvU1b6tmbZCVdDUSWY1uWqkF?=
 =?us-ascii?Q?h9UxrH/gG/FRUQG+7EP6w9wNtWXiOp4/aFcGkq9Rl0sSS71UsyiTbG3EpPjb?=
 =?us-ascii?Q?GzhIttQEtrXQOKSLbj+D1xsIQfCtFJxvWZbdXvaFlYrZdrM0XJ0pdEUjkkI1?=
 =?us-ascii?Q?fM6rtDTDvkDIRNsVpegUgIlNUtPBPZapBjpJO9xskk+PKOS5K30VadugLsmz?=
 =?us-ascii?Q?nO/CkmZXDLLlthpljBCye0Fe2RiN4vJ0Er1emPqXffuZOG/Ice7QJqoDv8ZD?=
 =?us-ascii?Q?Ov4F1bQJw8D4hBkSZxwvKrIZU7PqH6IAn97b5M8tx3lZvsoOjrGkno00oqEb?=
 =?us-ascii?Q?5asooIbpWLGT1k1AfYo9FvNxsMoA22xJLnzKkHuYDx52RU2beQNlNF2d+ExZ?=
 =?us-ascii?Q?gj//qJa60CZo0yY4yxHBiPrtQvQksQRwl6m+hhmD6Kc/fIYWprpdCmC1epLv?=
 =?us-ascii?Q?SgMfirMrJpw6RGMPPM+Pv4dmDtxJS5mpW5QtxpvwnO23r7LGQUxVyATexavN?=
 =?us-ascii?Q?84sDFOVJLxGTqmGI4VBBvYJ5Oiz7+xuRkABPD5cpHJG4XFPOVRdVz4kjB2PI?=
 =?us-ascii?Q?pnFpFsn6+shR4wSuRFNfyYI4eBG8WyQwhAm+95nYA1ZEsDdXSAuGQ3A/JOP5?=
 =?us-ascii?Q?/hqb+bz48yjVr/NaZ1J1SNHy+MNjfj/Na0jw9jgNiX1KhuIV5wNRk4mm/ORr?=
 =?us-ascii?Q?eK4508Mm7uBTBBvDoYRZ48vJX7aKGEGBX7VOcEK8RtMWxhJQjf8O9s1AHFrL?=
 =?us-ascii?Q?9dPVPkcB+NGb2MuiPGj4REL1p10qwpgGkzGWnE5SG6eFi1gM/KmJH76ldUpB?=
 =?us-ascii?Q?MKuaf47xjicYdtb2dIC0MDaCxxi+jjD4zbFA/OBi4jBjWv0SvR62DSLRdzqK?=
 =?us-ascii?Q?vlmjs2XX22go0pwQTE6q5aXMNO2ziivfR2oJK5G/4ZIXo39jF0jvReQo7hox?=
 =?us-ascii?Q?9qzE3z4eET741A3FctbeatAwTqP1DVsBPBztS4aKe9pi2p+6uAgV/PrLDZTu?=
 =?us-ascii?Q?/l5yGUKbk1cHnJ3HeXk2lxBaW5vZgXCa4zELs1944L3GBz9HbNs3Cynvu9JZ?=
 =?us-ascii?Q?O3QvQtFiD6NWIdENLWl7SCWk6GMpk3nivAEFlzcE/jndxRjb5Av3nA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?0tcTG9xRbYEL49Elf0A8fuJT87UdRGHqjAwVgbYW73amS5BeGi7PD8OmaNQn?=
 =?us-ascii?Q?lDF7Wiu36MtG1I5y2Jtcwd/xnQ8O9EOUSnfCEP2Lj63IXxTwjZdfaSUNzVbS?=
 =?us-ascii?Q?QPpYFncyam6Ju1iBwUALOf2Tslx2fANoqYqlRbQh48E8+8wjE13AVKt9DH1r?=
 =?us-ascii?Q?ddAPPNbzjjuoj7Nwi+1uraH3nIrfTxBwaAk68PGz6dNWHx6pAIpEev77OlTf?=
 =?us-ascii?Q?dBZ6A2d7EIAmdPEsUUqFHdZz2MGV9HxZmCyeth3d+hqMBkmX8Q4wkphuadJf?=
 =?us-ascii?Q?+GQ6xJbhS6gSDcFzZK4mWe+k6uSQMDkQ2KA1tA40CE/z2G1O5pqjmR65Vct2?=
 =?us-ascii?Q?1VAeHQOlgTLxHqjOdw1WWzdG48bG1p5kAlblVi19AFq8fg9PpnpRi9eNppAH?=
 =?us-ascii?Q?Ihfb16/xPHinJYSCqmqWXsW1SzCqnDKRG4WpVAnnsxL3c9/r/+tFlxc4WRpC?=
 =?us-ascii?Q?CzxpISy2AbiV8jlubHSqq9sovhZIfivesTcQMOg4/qrBVqHnghJOtW5c/o3H?=
 =?us-ascii?Q?lJvns+yjh33D9tqxDyUv2z+UAQsOgrf3qWNvBZ/WSvTXrn6TFhU3/ug95cfh?=
 =?us-ascii?Q?wh3Gm+j5S1Mc1LSro95Sr2ub4IbRL7IUATGtrepwt68lkrw4agZtTegsFUvc?=
 =?us-ascii?Q?PDypSzahiEa8opCa/B4QXVs+Sovl1JCDzyvxbFqOEcuZ2QtrSMriqsksjuA9?=
 =?us-ascii?Q?PogPBdlkaf4nG1cap1c5J5G2m9g8G4RKxr1wThSgh78+rN7LkRIx86ScJqiH?=
 =?us-ascii?Q?/gmjfn7+l1j/2KWIhcImVySR4bAN/wafGXos3upgV1DrneM04E6LWmWkJBhP?=
 =?us-ascii?Q?Y9job12hWbdGiICV0Fk2pGBIbkKhsAGlol/Mo02yrzFNmchAOSE2mxQA29nu?=
 =?us-ascii?Q?uFIVTYGEwPbbxqD6QdZmgz4PoduBN5gvDpya8wkkky5YbjDXWy9GzSQL3OFR?=
 =?us-ascii?Q?axDTfLnFaIM7FHhvnlVOkE6znAuz523XEfuMM4AxI17JbfJU1orR+lDy/GN5?=
 =?us-ascii?Q?urSaHcK2W+hGuH32ZZsmSvpOeQgZuSkpVmm5uO9B6e/lh60pI1CDnevnrUiT?=
 =?us-ascii?Q?qw1vhm3PZSBW+g2y+qnlRBVaZQKDcxb8ve5XjhdY5st8FuhYgGebEHd0QtDq?=
 =?us-ascii?Q?GgfXN7eWUFyKN3fUviO9Y8lbPqtgVF3sZcPWo29lh8zpekba4ZjoWZ80qab8?=
 =?us-ascii?Q?LP3capUvIqBMs6PobR5V3t2R8CppNcqE7gX6NEzBy+xpU3BuOQtowJNxYUL9?=
 =?us-ascii?Q?htBBZ0IwVEdKHwSFsQ5pjGXVCrBteJbJJx86sGeJEajkeHXgMyEu1/gi/T0Z?=
 =?us-ascii?Q?WkKqgTV70eMNoWc80NL2SjY+PdOobHt+FnNGSw284u24GeyAqU+/Fs4NgAhi?=
 =?us-ascii?Q?0XgtnPVm6gLCmiGnOwgOQoUASCxMuDSEayLGelRJIx9+ZAOFcl4WbdPpc3jv?=
 =?us-ascii?Q?jFmDUVN8DZQmcIlRKQf3swZeHmE74RmXPJlTUHgNVRd7kTMpBSQ2nJnc+zE8?=
 =?us-ascii?Q?HKiff2eQLUxlUpSnif/VeELQBp7FexTEAw2mPRs7hmb/+5DPBrdG4Hn5H9Gb?=
 =?us-ascii?Q?iNybGhrmel9/ACzyS2445/PXlmwYEG00aTBLaYCc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d0f3af-c344-4ff1-c498-08dde0c4fe7f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:11:24.5672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3evAoQALUhmtQn3UKecOyXA//Wpttvc6icVTqDf4MewA1SU/RqEWc+TAf7aY5b7bfNZV7R+YNueJupkHDUGYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10373

On Thu, Aug 21, 2025 at 03:09:35AM +0300, Laurent Pinchart wrote:
> The const keyword for pointer variables is placed before the type
> everywhere except in one location. Change it to improve consistency.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 46f93cd677e3..0f0863011230 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1029,7 +1029,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *sd_state,
>  			     struct v4l2_subdev_format *sdformat)
>  {
> -	struct csis_pix_format const *csis_fmt;
> +	const struct csis_pix_format *csis_fmt;
>  	struct v4l2_mbus_framefmt *fmt;
>  	unsigned int align;
>
> --
> Regards,
>
> Laurent Pinchart
>

