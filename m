Return-Path: <linux-media+bounces-50475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8E4D13768
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 16:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C802F30031BB
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 15:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882B42DCF6C;
	Mon, 12 Jan 2026 15:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FE7F6OAZ"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF51F3B87;
	Mon, 12 Jan 2026 15:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230376; cv=fail; b=f6/THHEPokpVouTSGHNnJgalJ0Rhx8knI48c7O/VLofK250xHFuRglM9cia4Oyzzb1DDlytoysHhTKwJyBf5UWBOc/t0MoNZyq0BkAg7THeChZJ05+o7z66w0fVBVPkx45PkD9MoW8RCuGPMiLr1er+e6maFBL0HyTTdXdPYQvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230376; c=relaxed/simple;
	bh=OxRwIfscHbUgDXzxlrjUuvaeSoG61rRGrTW2q0JLBLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OkC0iW6EydTm2LUc9o7bvxXsFnXwyEH5kE7z/A1oAjar5DVrmNvPBkpdiO5mw7hpa0B40HHuvvE4uwcvF6mWcn0LUN9F04S4Hk8daXHdKGE4z058aHpwOW6x/I5zARrvAv1sQQeJEu9/Hfnrt0OklZzlodo5WzvzAawFUnSJCF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FE7F6OAZ; arc=fail smtp.client-ip=52.101.72.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVXuF8MwrSw9ucjHHnqLA3Gs6IhPWfwJKmS+3LRz+Xgzy1+l1as1zWHM9IsNWbktETnFTgrlS6EIz8Y3sNbXHIQ7W2Uzbe42VQK+oVg9L2NKvj22uw7OkTsPx5hZS+cftzcdI6GzOASl+4jPFrv76drwUP2Z3zGYr8vrpTj22ZmYoEfxEEqQwqWWshtevuNQX243YyDjj9JYXa+cZJvGL1ul95NZqbSIMgfpo8iU5ceKAEZzFGBJEqk2W6zqxuWs7gNUsoRL5mRIv5oxIq3QqH822WVqU2FnzyKu/N3wyTVmtOs/m9knUBdMMrw1sKtAyrXP6mdIjfTx54mR3ix51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7q12iX3lDIgjjipwKDsmu555brbBRYZH7PVCvIH/3Q=;
 b=xVGnyIW1AwFM6icMqC62bqsqlXSrxUsOQo17mvd42W5uEI0DroopSCvcLtUe7jIa92H+1dry9Y6DKaTE5XL0CLGaNOqVhd4zi38IVOQhK+gVNqSwJW4Yau+EQf97qmqiNnm8mzfJPm6jkZU0Mby3SQ5K6k9xtQTvk3YW/ww5xzb5tmi+vTzLihZh1B6JsOI+nCgxagxUdMqcUnsTjLASyBe3SiTwEElPc9J3RTXIjqNCUu+NIDLoMG4Y5T5t1t+/VEucdj1BGBbdv+dflMTVs8M3q0a+vpJbcSUFY5BOrrv5cKo2kMUXmyApdchJ7J5ESZckSQtASlehnz9R4JWjvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7q12iX3lDIgjjipwKDsmu555brbBRYZH7PVCvIH/3Q=;
 b=FE7F6OAZ5khMA6W2CU6TfqD4GzzWDnwZ0MBx1KWLHIfhPTXYob9xJ7ex8hCeQcvvP5XLiwevKckBwJ/onWA+aKRRbS1CBAW+rQgfPTQbdcY97aITyscRKxfy28+kYcjz0olghk8Xf1vGQc5jG5YC7iS3smmBFhA3NRyo96b6BiGaAOmsclX8Dvu36ST68grcFhiuOPKaRNIFSXbZaUEuWyp447RLb8VoThtmgyGaJNfYABAg+kRx8ku9N0n4oQCgYlEUt0hR8vof+BhL3Xae11FIfxLRUK4H1j17PQsftXSLN8hDCq3/uF7A9J92BeS25YzRA3JiWImm9zcHbwbAYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10247.eurprd04.prod.outlook.com (2603:10a6:150:1c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:06:09 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 15:06:09 +0000
Date: Mon, 12 Jan 2026 10:06:02 -0500
From: Frank Li <Frank.li@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] media: platform: nxp: Trivial cleanup pathces
Message-ID: <aWUN2qRgpXXALAJg@lizhi-Precision-Tower-5810>
References: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
X-ClientProxiedBy: PH0PR07CA0063.namprd07.prod.outlook.com
 (2603:10b6:510:f::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10247:EE_
X-MS-Office365-Filtering-Correlation-Id: 210ca5f0-d4d2-453a-f550-08de51ec1e41
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|1800799024|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?TlWJlJJpa9Q5GF2f7r80OagEG1YmqUj+Z8yNx9HvkLSa3kCWxNYy45kAaMV5?=
 =?us-ascii?Q?Vq9ZnUp7aOh/RhjIlzO6EXOdIpfc63yqnlThmQQchwCTmiZLwKr9mOerIGns?=
 =?us-ascii?Q?UQctBad/H7scOdtq+c71a0TOucreIFUsWcHTkuCvwPfqOdQucNC8QdC+RQpX?=
 =?us-ascii?Q?9IwRcWbcJjcMPxskeuGS9RNjYRDLt5aacy8lf2E9V0/u+EuKXTyN9UXPzxdv?=
 =?us-ascii?Q?oyKJmXTVeILlxlPTbm2bydSj5j4mw+f1+ug/+KYOmJfkxVrOe43B0CyL5xyK?=
 =?us-ascii?Q?P/BIJlCO14v9SNNZpQcNgzpyqsPCN/dLg0EQvR6c8vFcOKDmLkphWwf8HFWF?=
 =?us-ascii?Q?9roSVlHDZK72PiU8XU6KaNs+Aez04NkSh4yo2ba2W2Iw7OBTsnucOx+pdAAK?=
 =?us-ascii?Q?2cWA5BmA2A4m2bagK60bkkVUBUr5Aat3GiOZMXRBSEIekRhpoK1XX4SKkklu?=
 =?us-ascii?Q?xqouzoitoR3n6ZIJxq9iSggL5UM2m3NvkJqEKuf3wIYDse8SEvd49MSqS0cX?=
 =?us-ascii?Q?0FfCTY+lHhkCqJQO75vkFb4y0b2Cj9hZfJQCXU01vQCsEvMuhIwfjq/QmNFT?=
 =?us-ascii?Q?LnTtJ0Rgt4xephDiJwjcxxSLhwZZ7OovPA+pecTuw70jN0R2qX8dyalBZkoO?=
 =?us-ascii?Q?82GFRwzcRa9fExH7f4HDvnmtmcAInuJkzApPFvnNgzueprDI8+Maaes4vozl?=
 =?us-ascii?Q?PayDmXz95aMWNIpM1tlpdiosnjg+RFmrLmd51bg6pETHLL5I/+2sfK7gwuNY?=
 =?us-ascii?Q?zugyMrF0RvlRp9JcF+PRzHhF4qs+QuEG7D8uuvXomssFG1RxchAvDREfY1/h?=
 =?us-ascii?Q?loCqEHrtHLSCzyNjfWxjQT7O67uLO1VtGED7QTSIujeGdP+XR9WyJpslV4S7?=
 =?us-ascii?Q?Xr5XyKIZ5CHUychFFOSiP3msfCxFcXOxkEfzWGJmwNu14FxnfOoYdgeKCIJF?=
 =?us-ascii?Q?8AfTjjXh9dVZ0fMJ4ggQ+YkGiZdfXrzrQzj2orzLbOw9KDAt9oMQpxy1Bb4B?=
 =?us-ascii?Q?50Bmz0Pjih4p6OuWkQTYNJhjZ4TPcbsf2cqw7KPMzynW0N0ihhO2doxuNcK2?=
 =?us-ascii?Q?J7hJCjVAlbMiMJ45fxl0GIpHmgOlvfXx2j5Ze0lnzWRgfaN8CGPVOTCX0OXb?=
 =?us-ascii?Q?Rpchm7BM3XDzhpkqLcEG8VrMVGfceglydkNkn97das1Vd94f8QQp9uQluxzU?=
 =?us-ascii?Q?fW7QR8EpjBejk/NCA9qpaiTCVSW7DmDHdzWZMwewuNNQ3oBZH5Caeg6zTzp6?=
 =?us-ascii?Q?Z5p3Biz9BF0PynH/51yW+hROdPc/q7gLiv0KqRQrJczJ3DN1cDA1eS8GrM+h?=
 =?us-ascii?Q?NifZ2oNFtAaySIqe6QGayd8LQLSdnZtCjCZ9beNpujIfPemEtdKu4z4Sn7LX?=
 =?us-ascii?Q?cwgHNZBwvIeo/DeVlhewYRnc0lzN1azQ0dkTjLI7tzQ2G3e5t463OqgWl2RZ?=
 =?us-ascii?Q?/TbWEtTz7TpTKgpfMRI5LPNOE8bOtt2sTpnW/LblOmBIcwJ7T+9VHi8wVM2g?=
 =?us-ascii?Q?wX4EHKtSIHnzh3HTcsLppZPpkxtNLFcQO91PmprAUHKDEp8RxGf4OjwQTdFZ?=
 =?us-ascii?Q?da3OYV2dIswSOILzW6Q=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(1800799024)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6S/bs9mKjJWf6ytHJindxPf5UeAn1myYiPpTCbYxcHjUPRJbkDmn8exDStTk?=
 =?us-ascii?Q?tbEgIX/fzsS5VN3AWSIBvq6R63n/TxhPD1Zt/L7sQQcqYWdZVNJPspH6hfDW?=
 =?us-ascii?Q?IY7tah7Q6XyG5kVdONuv0g0HBKS2Hd+5FVmA7ifSG93G+LMVjSof/KwHHioU?=
 =?us-ascii?Q?H3WzdDSiEUzPSt7hpjC2W+qbe602/eNUa4XG0fs6D5nEhtmG9a4Ay2T8Aqiv?=
 =?us-ascii?Q?aSHXrmV1y5G9KevQ7FFkAsBUv214oeHi5LpqoO1qZ3ThAvRnMkPQNTu2syFh?=
 =?us-ascii?Q?MysrxUJ+ln3UDtUxnptGPDvlWYu9oT5C5tTSivAIUwFgvixkxEHOPt20hKG1?=
 =?us-ascii?Q?bIs/w0xUMyvdYNGsJSJdP8arC0afzWcun8Rd/ItuIcKYYECLigMFmehm6fdV?=
 =?us-ascii?Q?1bGA8ocwOzulpnxuJyEfLaody7/KVrEjROGcTmJnm+fQoCGfrtZxcbLvIalP?=
 =?us-ascii?Q?c8i2WTNHJuuaAqn66PX65N+04OhTSf3f5mERCQjh8PE8FPMeG8NZfP67czZ6?=
 =?us-ascii?Q?WUy/tCuekftxeROiW4/NYF2RBYOwDGvoOhi1Yk9J2wm1SgNxjPc6WPIVUi2V?=
 =?us-ascii?Q?HeBdU2HvhsDt5/tjhtgY6IF6hwHapu/LseZ0RdEuHDcvrjFJoHV9fQC6z44d?=
 =?us-ascii?Q?ahl+cNJOrzdv8jp5Kfbqmn96gRC7RLHh7kbSx5wRqUgXK1pGifqnoB0CgS30?=
 =?us-ascii?Q?oOqdB0eL1LmFAyKgduhLDGl+kVQgN3B2m+JsckmkuWvH2kxr4GYYEUSwUOt6?=
 =?us-ascii?Q?gt+77qLTl8u+vYfQag3mfxKs5RIEuNgeE1yAUdn8Q+pGXZ9CoNIO5xaGfWWI?=
 =?us-ascii?Q?HAZ0KVituN7U69XqzzfrfMpWHvMyWdaYYBMrW9OF10GYwD3QqA3fmIyrD41V?=
 =?us-ascii?Q?Fd1nQ1E1kblBFBLWTcHJr3qWqadlWdkk+HtePL8t3VSfMedv2RNBvaiPy5cI?=
 =?us-ascii?Q?OFnVocYL1w4FCIGN2JSCXl4a61fYy3gYmTyFg1vxfv88LyRwshlf4rx+wawM?=
 =?us-ascii?Q?V8Hgec8Or63z1GlTAey1R+7jTVYkivbrp4sezF/woKt/iOfc668vvkd4Wv2X?=
 =?us-ascii?Q?1T4PQA8zlGg9nKsd+KIgxl6w/dQHwkKPocxDmb+8O4iOu0f04Ijg0UIcm0Mz?=
 =?us-ascii?Q?fO4GXV2ZWGtTenYWHrbC55g6Qsuv9vWt+M/L6wGhnPhganAQwRanZtFecJt8?=
 =?us-ascii?Q?CYViv2OeK/LQhKDJ3Dkq5d+wKQBpDA5rQjcAxD+Vrlt+k479IVfEhzHJCTSd?=
 =?us-ascii?Q?2qn0GwOJlqjjZIkLvlHSZFscLw60yGQILzKQBMd1vTPLVthjwgOyB46LAQVs?=
 =?us-ascii?Q?Vk1PlG38gfF8q+U0B8RfgOK8XbvSvimbrcWNoWXRp7j6gKkTMYCnp1pdEHBY?=
 =?us-ascii?Q?/ansWWS4FLsvlJAUYlSaY6+HgcN/ncf3UZ79cq9UDR/ChmQuzkVHbq6Ijynx?=
 =?us-ascii?Q?bsRf1q1LxMzqeTjIHxhxyKDsw582jpSvau89X45SuywGt347UPkMQuVWXjJa?=
 =?us-ascii?Q?nD/c5luClbTecWYxlG2ZM8QgjaMSayPti7WTIxH+S2fJigqyRDTptMNbhoaf?=
 =?us-ascii?Q?pw40e0c6Nk53VLtT+kZjHZFdStNLmQQSbEcomJp8gKrjVgb/iOcIpACVOFok?=
 =?us-ascii?Q?ggFKcaNIQzx+0h/R4fFInOcPenIxxUyEg4disDWbyrsnRdvpk25cNaff+edz?=
 =?us-ascii?Q?1xr00RjpCT0kBEwihAkXZEnuHuL+jVPFDRiAgw+EL48WqKrq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210ca5f0-d4d2-453a-f550-08de51ec1e41
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:06:09.6300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPhMN0W0VW/SIRkzdhciF9lHani2pfS+a9slBwjk+YyKFlyHuS/AqL9F9sUczB0ihLVqhi5WbY++IEDRXHNB2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10247

On Mon, Dec 15, 2025 at 05:49:51PM -0500, Frank Li wrote:
> Some trivial patch to reduce goto at probe functions.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Laurent Pinchart and Philipp Zabel:

	Happy new year. Any comments about this trivial changes?

Frank

> Changes in v3:
> - rebase to v6.19-rc1
> - avoid use __free() == NULL according to cleanup.h
> - Link to v2: https://lore.kernel.org/r/20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com
>
> Changes in v2:
> - add new patch media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers
> - detail change see each patch's change log.
> - Link to v1: https://lore.kernel.org/r/20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com
>
> ---
> Frank Li (5):
>       media: nxp: use devm_mutex_init() simple code
>       media: nxp: use dev_err_probe() to simplify code
>       media: nxp: imx8-isi: use devm_pm_runtime_enable() to simplify code
>       media: nxp: use cleanup  __free(fwnode_handle) simplify code
>       media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers
>
>  drivers/media/platform/nxp/imx-mipi-csis.c         | 54 ++++++-------
>  drivers/media/platform/nxp/imx-pxp.c               |  5 +-
>  drivers/media/platform/nxp/imx7-media-csi.c        | 14 ++--
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 16 ++--
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 88 ++++++++++------------
>  drivers/media/platform/nxp/mx2_emmaprp.c           |  7 +-
>  6 files changed, 83 insertions(+), 101 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20250807-cam_cleanup-b6d90ba9dac3
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>

