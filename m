Return-Path: <linux-media+bounces-38946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB8AB1BB8B
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 22:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0134318A4903
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 20:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED6D23B62A;
	Tue,  5 Aug 2025 20:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TWPM3+2N"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2167778F2F
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 20:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754427174; cv=fail; b=dv8b7ZAKtCnRvo9vc5i6JFL55LSjXt1Yir+tFMS7JCDmZgOGsAWvg3PQx6ARRcA9cNJHIA5eIb1JHA7MmkgZus6UpV9KsEw3P9kjdH9o9LtG+KtDI4ay0Gox1hWN9zUf/uqwXivI3CwcBD62XISPVo0G1Re2E934nOiR/B/1W+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754427174; c=relaxed/simple;
	bh=ANUcviAbm0uEy20HqSd0SDTdEkEP9EjPTWrl2KN0gI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mk1NQ5C6w88N5jhoKuDZgzexoGcbLCVOiF1oxI4wPfELOQ5/Wz7UPcgi3OHhPYBajCZyTttInt9PmSZlbQ2GtRFerVyC2fsX8ivYOAzBFVtNrO1eXvz4Vt5wEaqOgNtKObgHONuSNu1ukWAv0P7+6cqt/o4BoFacTJXjE7KQLEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TWPM3+2N; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ct9RG/794m7B3qIKRzhLgfkW2xP3PFtPs9kbUpDS4cSXFptTg++dM7v3XFIzgOUYHZLM8tvBjRzGBCRZy6l5VnsN5K9pd1RRvX53JrFiSBaF3eaLhBsD14QoGT4LhMEcO9xLi+rS4c88VoelBR43+UDt51BaOPlCjHpQSnJg/qE7mvbZofViWPhAxsYqjRLs23o1zPdAsNbaWsxCAB0ponqjks+450PaE/WZC/Fk3RmZNo6i1F6ZnLR2iMTNzjl6oQD6gnotj3WIb/nEFg6ZJ36gTfZvA0feXtMmotE3Dpou69ro8Gb0Icd1LUOFkfX12j5A4AhDfbx3SelLAzcbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytQG2jZj6KSjKr/Hro+I4nlFHGRyT4u6fCABxPd5a+M=;
 b=NI0HsspyV3flGN7DXK2/PFYqg21egrWLWRSeWbaxBO5qDWEQUBqUPMgEJml04T2ALEI99CPf4Pc+ukt/7tQapgiT4ITHCCY2oR/uVpspB+EYjGm+pLS+Ps7ExTBDkDbfoYtI2TFhbSFSumGlnxSKIKr1LIng2DN+pCRzXkfA0sd2vaQ4hXFJphi4CEU+pKFKoCf8WsAb51Vmo1zktLa7vBId03WHm/EFf/1lX1vhqUXrRNWMRwEJfipg3lhaTS9gIJQIHSF7TrO9OvB3kmhv/757R1SOUNbUE0+TZ+Mfd8XO4NcJQNNk4JaAERalR2Z4/G2V6+w44mXnnbxvQyN08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytQG2jZj6KSjKr/Hro+I4nlFHGRyT4u6fCABxPd5a+M=;
 b=TWPM3+2NK8dKnrItnHUXsY5zvAb2ZVLQPFNHLE/lh7pExqxnJYoqBj9+sZDlo8g3rIrFLX/dlpYh1oDR7XfoFjbYXaarA9bOiUfDasCdhOG7EpqF4ApNPMYsgdSGNphdy6G26ySoQmiKSmUx/gdXpVKvpue1Vm3lG1B3K8Ps+WwjiFSkP0Lbqv+R6RLAYjMqE6W+vfnp6K31EMfLgMSBqFKNnlXCLdAlKq8WF9PW9lMrmQsgICU9PSYld4ZPfc7SvM2gHIg4PONsPZNgDU1HTi+XBFE9WIlH9+/ED5GcQHH0N5rGPKOxtrleYTxdMfw1dF0u3giHk9nlRx7G+RBxBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8393.eurprd04.prod.outlook.com (2603:10a6:10:25f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 20:52:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 20:52:48 +0000
Date: Tue, 5 Aug 2025 16:52:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@kernel.org>, linux-staging@lists.linux.dev,
	imx@lists.linux.dev
Subject: Re: [PATCH 3/3] media: staging: imx: Drop custom
 .unsubscribe_event() handler
Message-ID: <aJJvGSfwfyaqpVAc@lizhi-Precision-Tower-5810>
References: <20250801211933.22553-1-laurent.pinchart@ideasonboard.com>
 <20250801211933.22553-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801211933.22553-4-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: bb570207-dbb4-4d5e-55d7-08ddd462090c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|4022899009|366016|1800799024|52116014|376014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?a29yL9Pi3doebZLzidhnIkQ+yNMzZI65XpCkJw/LtO1lvNS+ZSS4l22yF/86?=
 =?us-ascii?Q?F7MkFFD1rRDhhR+cdSCotQFQrYVe1AJXity2HPsEeweN8cnQXP5m77mVWATQ?=
 =?us-ascii?Q?6kyXG5/AZ8Ap/5wB3FUTX3sIDAeZqoWCcd84B1DfQw9AKPx/XQr7bMVm0b0j?=
 =?us-ascii?Q?0/RuDIWSz5t0Vycm49yFczxLjZjZS2/baDymO7QHPkk9yCUz01Or91kB2a0c?=
 =?us-ascii?Q?nAba8LFhBcYXi+kpvgcrs1isBBa3J4xndTGHnqGIZcvklqZkvhkKuhpYXZ6p?=
 =?us-ascii?Q?IgrUwaF47vOPjwrYNci5r0JXl/6NRuMf7Fw7TxavxebKSNsFOMAhiYoZwm2x?=
 =?us-ascii?Q?MIgypfkvWr7uIIN0MdHagPO7H/pBKu1Vkz+HbSDVPkNmocTbBGmeydDTmoyX?=
 =?us-ascii?Q?OGlPsuHB1rDv5nmwvl9nvBoqF+1lf1JpbKBdMocQ4rJRdxrjwCDVS2Tm1/1a?=
 =?us-ascii?Q?0gHZ3j6jhI146K7QBHNSNv+SWHqB4IZstJXXkxuFRbMWXcBDQ33rsLv90TA0?=
 =?us-ascii?Q?ksU5aqNSXT28ndaUtSrAEa9KiQsGxzua98sBFxuB7Yt2AmE1OxVK+s3u/grh?=
 =?us-ascii?Q?ZUA2Eobt+nbnCQqy2BBarAviHSc3iRKQaAtoeEgd1LzESI9vfaQ+kMSsAHgb?=
 =?us-ascii?Q?h0khZQdioMCte7JBOrEIIWm0O8OitRBkm92VxzxbdsyU8ipN1aAflBVgx+mI?=
 =?us-ascii?Q?tSVI48e6shjF4kV7r1y0CiWsYFLvPvT2H4NPOtoZYbeUGk/sYlfd4eJQNoOh?=
 =?us-ascii?Q?TRSks3d5VdXCO6UcZf/NH15EdWjpzmwbDYm4u5ufbWh8wZNKnyDuUNTgI3Ji?=
 =?us-ascii?Q?QNLV6SlcJnlTD2xqi96+SPgjyfbN6IOws6C/yjHJJ07FY3afcXEY/Uy2ET5M?=
 =?us-ascii?Q?zKC/OLTUrmLdAMAcEOeHF1u+o6v/t/eT2JR+QGE1vr2QjhVbo8U6Ivu/XYX5?=
 =?us-ascii?Q?/m44Be44nO/BQrw6s8vjUbsjlzx7B8+qcukzMTo2lsrHNr7Xlzy6WUCye5xl?=
 =?us-ascii?Q?t3iKI3Pm8kX39Fq18hiNre0hh9DkTQNfcwKlCxlXXR318deszhRLo6ry7W7+?=
 =?us-ascii?Q?kR5bjBLKmAenoNA+cspyMG1fihrhd6MFKmOwxNgEKzxG6OxhixyeSf8JW/Q2?=
 =?us-ascii?Q?1zyjuXq3e/YtfTnk2mDiZSu55WKQWoYKF45CuPzfxIh33s26qmkaMwt0cdWd?=
 =?us-ascii?Q?kzOijB+kOfZXGZ6EdEL2HglhygftdVJPq1eTvMZDPp0Fu2iNMUAI4rgvkjwy?=
 =?us-ascii?Q?bghi7wyU3olWYA7NWQ8RU67Sve2xsjT40VEJ1J26dgoJ3lho3zHknuHg96kR?=
 =?us-ascii?Q?Xf8SMYs4RbsAAyQtL27H23G7CxKPLPC9rgtxnzrm5S+FggRKlCot9loj8Mfv?=
 =?us-ascii?Q?ICEucRkoHFTe6MOcs5uxKTte+M7iAwLPt7dR7DuYD9KD7uZwNO9KemVm1ACn?=
 =?us-ascii?Q?sZ6+KZ89XO/vc2V6CEMidtpBcsfs6rJTvtRjcbM5R7mC+qEuLgyEiA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BfZ9jyAmTWyhxUcPWoVtl2wxcY1MTNae8CWLFV/XdjM7IJTdQZXjuLXf/xDz?=
 =?us-ascii?Q?3KodtLxyAOMJuliJEGvM29lJf7J/gryQ7yECsYfuZJWVNTTp7wyCeCdQ6BOZ?=
 =?us-ascii?Q?0fp6I/NCqRD4GJ4tqqi1qe46D29gkDyk58ztrRwF8GYdNsjXE5Ff4xZMZXRZ?=
 =?us-ascii?Q?lAyDndCf8SxG6jxImynn32FdslGbUobb29hP4mg0REPfbjbob8/xCPj3LYxw?=
 =?us-ascii?Q?3QG77aeyeV+uRhzBJb0d2Ap/7s1i9NCR6a8j0zpcNIqjQxN1TAwj6WQTLD9w?=
 =?us-ascii?Q?dwpoXXHkYX/C6j2Cy6iCisqmMlmpaRYQYtEyXuLkRtWyxduqpyR/8/efE3O0?=
 =?us-ascii?Q?s0MiFDIE8GHaYAQJscag9dpDtSmc89bh5jcmw3bo7EoXwuWzflPc9JaXP3MQ?=
 =?us-ascii?Q?YYuGrxD3PuO8a2v2YFPj3mR7T/qztWBOZKZ1pgkpLB1WtFrRWfXCc8daUBXm?=
 =?us-ascii?Q?5XRRyMf5Nt7QKSmt1ukDQsKD//JrSf+eiFhUrzh2FhMkRj6XdFwl9qmGSjtC?=
 =?us-ascii?Q?kcVlY2gkzUfMZjfx+ngEbFuVut2OexTXm3XlwtB3Hlatv/K5X7aBGlJw1BFY?=
 =?us-ascii?Q?i5XJkIKpTjJzGzEIqn1MnNLM4zdYu8XqBd/lv88zzhOL2qjTKZxuZKaBKiIo?=
 =?us-ascii?Q?6u5G40IMVp74rNljG5z5lDv/S77xMo+dE1wVHCxVwkKt+EJrX/hgM4Hogyu9?=
 =?us-ascii?Q?cJb020wHheUI/AJqq/6S6jwybBtPME4Po9AlZaG1YlXb2uvaLpGZHoM/4kDM?=
 =?us-ascii?Q?Ujqc/BxOJvnLmymX7NBLvLqU+mQzJs5IJoPsLDCkU1edmZxgUlTm4jWRnb6P?=
 =?us-ascii?Q?ZqugFmojBL3Ia0Sw/M3jH9xHY5oV77UM5fEJLDAOylEWfbxeEwjDGCy7z4Bb?=
 =?us-ascii?Q?3ECJFn1XHBkNkew1xX2kw5YTNOVsQgdxVy+TKTTeVFnE18e0QGgXiHYQz+MD?=
 =?us-ascii?Q?lM9KMXO50jFfAdf3QQVMV2ZyodGMS5K+s3wdPL4vV5l6cqRWm+dhd5WBlFq8?=
 =?us-ascii?Q?MjPDAHELpbhdM8PQvaYpc9ubYIO7shh9mbeetNBjwdUQqsiS8R0jMeGwLLID?=
 =?us-ascii?Q?06P3hBXBSaPs9UnUa8suwp0nE5kDWy9iP1HwKDKz3wdJRDlZTZVqVziCilZm?=
 =?us-ascii?Q?Oktgg9uSHZZXa2RVgEqDIx6vypGNkClPcdMgqh09qtZJXgGapm1fkYbQJAIE?=
 =?us-ascii?Q?QLCqmpo96/usX9UFP0ovWDo+BlJ4EBS8QnHb2lKyXUa9ITvUerdzmf7PS0uH?=
 =?us-ascii?Q?eCCGxLzYcePDPFhqwJBS+qsL+ZQMYNJvkZUsRPU7n6M/jQBbPTTnu1nzxm1s?=
 =?us-ascii?Q?QPt3gU9B8S46+LHw+m7U48SzutK1A3UasT2lwfl3nAsqJnqLxcFrkLYtcNjO?=
 =?us-ascii?Q?0ntwn4CrHYloulB2PeLPJc3TG1Hhxydar+48eyxVjOgmFhrNGPTqql8unszl?=
 =?us-ascii?Q?f449DZqR5bbF3esUKzcs9Njfm6wkqr0803iqeb61r40bhlMY/mqAoold6noB?=
 =?us-ascii?Q?EOCkTTgbcvJSD40+CRElPVwqshFl0ZrL5kim7BHrbZtcXrzDfhbl7jJ7MHen?=
 =?us-ascii?Q?XcsxcLgmQDa9vJUy8dDrCP0tdAfnHOuHhyF0MC6T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb570207-dbb4-4d5e-55d7-08ddd462090c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 20:52:48.2360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xolm/nZhBwBvA3Z6JIc3W26hVQ73xBOPQVo6uhhsXaHAodu/eTBp1KV959+7qPKVqeVvs1pvR7p8PoFtg3WGNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8393

On Sat, Aug 02, 2025 at 12:19:33AM +0300, Laurent Pinchart wrote:
> The csi_unsubscribe_event() function simply calls
> v4l2_event_unsubscribe(), forwarding its arguments. Replace it with the
> v4l2_event_subdev_unsubscribe() helper that performs exactly the same
> operation.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/staging/media/imx/imx-media-csi.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index a7cd3ef95fc3..fd7e37d803e7 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1751,12 +1751,6 @@ static int csi_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
>  	return v4l2_event_subscribe(fh, sub, 0, NULL);
>  }
>
> -static int csi_unsubscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
> -				 struct v4l2_event_subscription *sub)
> -{
> -	return v4l2_event_unsubscribe(fh, sub);
> -}
> -
>  static int csi_registered(struct v4l2_subdev *sd)
>  {
>  	struct csi_priv *priv = v4l2_get_subdevdata(sd);
> @@ -1872,7 +1866,7 @@ static const struct media_entity_operations csi_entity_ops = {
>
>  static const struct v4l2_subdev_core_ops csi_core_ops = {
>  	.subscribe_event = csi_subscribe_event,
> -	.unsubscribe_event = csi_unsubscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
>  };
>
>  static const struct v4l2_subdev_video_ops csi_video_ops = {
> --
> Regards,
>
> Laurent Pinchart
>

