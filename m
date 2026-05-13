Return-Path: <linux-media+bounces-61531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMXBMyDjBGrPQAIAu9opvQ
	(envelope-from <linux-media+bounces-61531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:46:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7D353AA5F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46489301DEC6
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DD23783AF;
	Wed, 13 May 2026 20:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oUIM+0g6"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872F12FF147
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 20:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705179; cv=fail; b=cAPmfa3GZFTWOViotcXbkNfDe4OXY3DlD1nEjoE5u4U9w1HMEdWX41LuxA7dKWgEI5kmwIrHnV9E386zMDnZSJyaVmBrZi49VAugaLiZyGSW+OnnmbBF1Rv3UufXIQOR87ZUf4TSLSf+c7iwaO4zsRy/4CmM1zLs8Paqe9yau4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705179; c=relaxed/simple;
	bh=UcPiG2r3vTpmvuYjWHWPvSd1vEgxs4MAHY9Zdm8qlEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GLS3j7exm4TzSpFiyBzYz9waRaQvlLORWNa76ljJYFmTp27JGFqkvttY6wd2mSyQn2CcDKXzMjrCPkmFqrFP/3aW3iHLFdJIa87qOBQPAaPxE7tYG5YXXRLwbMlLR8PXc3lIv3NNQLF40uoWtvcwOVfSANHvtHVWhc4SBt13GrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oUIM+0g6; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vj5I9v4dKcc2B2ObqHMSuCMxYHcxqjs5V4uakKJDA051wQiB1y6AXE7AJngqZOgkCaYPl557qUDLFaS737yzFvH78ADiIRCu4L+tqEeCLNwncKGUe0L4CnE0TkZOdTwfhh/IkSY+TXN3X9gzYT+z8eStKW6gW5DBLNH7l62do/8iX8J+MMeYFEncuZH8q7EtZmi/VUmBSp9B0oVvgyjoTme10/Y2FMH+hOWS8usL3JWe+H83g21/My5z8hXZPpIgRywa/FSK+8LeNKPvygCSv9SO/XFEeYFfoossFHUI6fNlVWeH8e5xwXEFGQgWgc8YkanE6jfA7ubK+VVOXmlhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nKGfR4dvQWEivF9FB6VW21Dz7uNd5pJR0mGHK8YJ24=;
 b=G9IKVTk98xqqMutniy1uwem1NPrnH5VtRIc3P2eiC7AzEshIej7+o3XooH7G4vA1Zl2mMu9ILfeuphSwEFnVdvptJdYk9fZvPur/HRf+bUeVemyks/3uIkvmU5uOIPFRoRTK76Nr0qA2w7ZBuU/rl1bzE3GzENq8VK5X90PVog1uD3YNGoy4UtiZV5p3cjdhM4YITWBOMzrvhN1WJbNNZEChQSNZzK6ffwL4O2wLSJirlEhmYxDvQf9JNqldkgUGiVyZPm9tK/tGDBnRhWCyGnb28SlL2oY9E13YcBsX5QZRZf5ThPbJkJxyN+eLJh4UcBcvmaLMAOw8EgKxLDe/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nKGfR4dvQWEivF9FB6VW21Dz7uNd5pJR0mGHK8YJ24=;
 b=oUIM+0g6zClUojuk++PXUMBIcdlR8itfgr8gYnRj5FpJGM3RikYaorFUJHWamu46CgEipynxmU9l5i9o70/71OF+2eiWgaGLaJxSTTb4IaqACVGsD/Vqj2qmoemf1gwbCX4ggTFoTtsZgQ5JvfQsZUmZjiSvDOHvoDlE7pTcsz20BXOIfzPpyuoQ9QHKbHEZxaMp2PMOhWSkriIZFdBKVS6ig2IrvSD+/xdPldP6FHrAksJlVe5caMrTv8ud1GxQcoOyVgSsUZgPbCySxcI+jkPQMxc5rq9ulSAeYs/epKThSVphPkAv+BcCZAyq6sMeoykpbl7KeLbIEJpfZKc2RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10778.eurprd04.prod.outlook.com (2603:10a6:150:226::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 20:46:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 20:46:14 +0000
Date: Wed, 13 May 2026 16:46:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 01/17] media: v4l2-common: Add mipi_csi2_dt_for_mbus()
Message-ID: <agTjDhLt3in_apjf@lizhi-Precision-Tower-5810>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513104358.2252605-2-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH7PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:510:324::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10778:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f54bd3-cfa7-44a1-ffc2-08deb130ac3f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|1800799024|376014|366016|4143699003|38350700014|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
 o6iN9bu0ALyb/EFCHheHhaPjiNmtaEtTsilclOrzygzOS1RKeKuoGTkSNR80HM7wWJQwp+mD5MJO59eb1uanxoGulRxPTs325W6hoZ6COVqEKX/qxs8Akyqp8jqm7zNjoakkGSa37n5ZvxznZUyEmESsvd468zxD4Yf6U6lwq4nxNND2T2Sf7g8tog2Ft50QWkTI0f/C+4xnZ6O8G65msvMcpDBdytGcNBrcgcA7Jq7R/4YBd9hq037soI411AVv4uKn79p1ei7qVT6xRn83sbQcQy41MTpNHWpNxugV7igUD2o7kCKwjC5055GKuiBASUaCNFHVtxIisz3Kiasjf8bX9o0UrJUgWMP4Sh72f8Vrr3h0FQIejtZ/NNB6wLQiXryPu9PI9vVDdgTEjTnaQbems4Z4ySFGkeqtBch05WnFVtBbUqfoDMs/lctRss0lHHPWdd7VolEohfH6heS4LM78bCGIYXyYqXXM9aIEod1Q5ms0mTtJp6vZ9XVca8EHYiTTrNK13ypWMKegyTpOlOJB14t+zS8xJFANhlbWjMGNvAQLvvdxlNXDj4cdF//9ThbspAJiMWXqn/rbHjOOUY3UUO0RO+RagIVc+/kBbGcLxWrGNFFLAOjK0DyrgdFVAdCawSXA/l0TYQBXa+TlrTnwbdB9FHoNddQTXjfl69yn/EdQN6ifXaFoXq94Mw80T+GzGU9/UFeOOgL98+voC8Q4hqYiOO35T+301EdRhuJCyr2Ap750U6wd+j/pKuTD
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(1800799024)(376014)(366016)(4143699003)(38350700014)(18002099003)(22082099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?JWiZO2aHtouiZdGjJcnxhvX1ujs09rxvMNWGVA7Gsp9Wfd1WfBdICoFsy7/m?=
 =?us-ascii?Q?Bq5bfq73g7zYpC1DYqgpR0osXLXyL4EIM6kU5YOgE2wS6hu8jMnzMTtR7LFT?=
 =?us-ascii?Q?8W4ZcYSvE2m+DEPQ25KBvYKqN3Zz2hWQexp9UOyi2fu6zxMGl3SEgYHvw9F2?=
 =?us-ascii?Q?WDEbD6+ZqvAnaJS8hi24W85iHqG5tpFKzJ6brIaaxry4IvMxd97gaeMUnfox?=
 =?us-ascii?Q?uBkhJVqGGL1B8yXFnLjSb3h4Bl06WoymKDgjjb+jk6q0a5koB8/spVJMs49P?=
 =?us-ascii?Q?L50ZqGM0jDHwjxrinrE/L4NnKrgnj0lMfFdRhi7/Dwq5LbTITx16uR5jUlKT?=
 =?us-ascii?Q?jupBhTEIiMDLfP3Q/jsqGBUHNrtsHW+Q+38qutaLFyKfKoXTO/9ItgKh9cBB?=
 =?us-ascii?Q?OfGBoxVZcT7eduSvRd/GUXx74ebNkPj4kO11FOQAgdLytYv3WsF+ju3C8031?=
 =?us-ascii?Q?HMogKZD1qupmusNyYMvIEfiTCGaN0BCbiTXhwY5IlWoQGYBZp6pmi4s70d4l?=
 =?us-ascii?Q?DuRfutVwQsGd6zyX4EeWGTNe4mWHYBnbwYGgYPSCUmxYY4Teuq6QsQSgQ/db?=
 =?us-ascii?Q?HRfQBZTgtuDTaQTy2cN8jcYOccsDu0M4X/o0v34j/R6aG5OT41Q+ce+qsr+c?=
 =?us-ascii?Q?GlFj2h9HLQ+5eVAr1daoM+mJfnCcVum+YPbm54jjVQyMc38t4Pz3p1um/N8K?=
 =?us-ascii?Q?iatPABGV2XarkwwfbnBDOjf51i3rGOzRMOGNUalfFwCOJaZMjWKd5VOcgwce?=
 =?us-ascii?Q?usmUhW9uCmUJGlLX3NtILHY3AOnCWI7H4aH/hixdXRJCUDXVgnLuwXHiJLlh?=
 =?us-ascii?Q?ytJIkeajTlYNz6PSPrqTzDVwUkTWX45EKTUVThoIyKJbi9gv20YuS6wZBHfj?=
 =?us-ascii?Q?FV87g+v6dlz4uF5xAf0errPsGaJjBTqsFl2UeMcR7b7dK8C5mCRYD4SOyqht?=
 =?us-ascii?Q?Ue44ehBCJnUEpVPO6OKUXTcgf9dLXc6IJr+LVw67Yvm7p0466WPJzg59RfGw?=
 =?us-ascii?Q?iVKNgsZFx2+We7zw3f8rdRFL8dyvtZVzexo3b3qzgtIZqI9pHLMVepbai4c7?=
 =?us-ascii?Q?IcwmhbcIRfHRaOhDpN45PUTFZ8QctfaGofplaiuq0G3FJG2WwtVq6EQr9f3m?=
 =?us-ascii?Q?hImn60olqTbbX1ZSyqvb3dJA0CGykFjDbTBwheEfpEDdVPVgZJZOAijVHIIk?=
 =?us-ascii?Q?MoUJxprB+UFY8EvPn/L/7sMiPvPU2bmyGZblNTMVHv+Bn63GN+V63bCVmZ3I?=
 =?us-ascii?Q?GoCJLfDR8wrHBWsS/OpNv1Vw583xEmDqP904OxfwwWXsqsXRS9Q0Yqhcdi9U?=
 =?us-ascii?Q?LxGMbCVGe2XmO9kXuCikoD6ge77uy0FxZykmVlv7Dwewu/JRx21gE07IVPdO?=
 =?us-ascii?Q?mNn1Gsm/PjyhtU02WM2xKN5Fh81OKqT8+nHC07CRShzU6KwSlWHADE54bNmD?=
 =?us-ascii?Q?mPaTOn649Ct4s6Uz5gatNJjrkPNS/QXa3Hk9m3bMnaNhIpQfhq4bKflwJOmv?=
 =?us-ascii?Q?D7Q+2Hpnb1Wgvtqh71vdsaXF/WKQj0Tfm6ENNS/S8sBbca5N/ZEmeapswcWB?=
 =?us-ascii?Q?VgocUUQrjhRr9sR9BHE2vUP8/fOaRU2NhBgGP0llmg6xCRHXlnKaTU/xgkj6?=
 =?us-ascii?Q?6SKXpN0Hppb7GGL52CcLVFzc6LBkxvaI3vW+Mn/UUZRKl4vljOZuMLE09mKB?=
 =?us-ascii?Q?7oQ1UellB8Iw+UfNAmF8OHG6r1sLPyvgvS/tLhkwtDEbMQUO//4K1b+JYp+u?=
 =?us-ascii?Q?csbP8msu/g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f54bd3-cfa7-44a1-ffc2-08deb130ac3f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 20:46:14.1356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4HoQrh5W3EzMtn3lfhZD8oQUPb5BwPGKGlHxcqudSj4qQX2vz7Y1w/a74a3eAJcRFG1fIjBF6DYRF3xY3vNeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10778
X-Rspamd-Queue-Id: 5A7D353AA5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61531-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:43:42PM +0300, Sakari Ailus wrote:
> Add mipi_csi2_dt_for_mbus() for obtaining the MIPI CSI-2 data type (DT)
> for a given Media bus pixel code.

Thanks, I worked similar version before.
https://lore.kernel.org/linux-media/aP+isGnWmJ4tLXcs@lizhi-Precision-Tower-5810/

strange, I have not find updated one, I remember I posted.
we may need more information, such as bpp.

Frank
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 47 +++++++++++++++++++++++++++
>  include/media/mipi-csi2.h             |  2 ++
>  2 files changed, 49 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index bceafc4e92c8..3f40de563bbd 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -46,6 +46,7 @@
>  #include <linux/uaccess.h>
>  #include <asm/io.h>
>  #include <asm/div64.h>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ctrls.h>
> @@ -808,3 +809,49 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
>  	return clk_hw->clk;
>  }
>  EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
> +
> +int mipi_csi2_dt_for_mbus(u32 code)
> +{
> +	switch (code) {
> +	case MEDIA_BUS_FMT_BGR888_1X24:
> +		return MIPI_CSI2_DT_RGB888;
> +	case MEDIA_BUS_FMT_Y8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		return MIPI_CSI2_DT_RAW8;
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		return MIPI_CSI2_DT_RAW10;
> +	case MEDIA_BUS_FMT_Y12_1X12:
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		return MIPI_CSI2_DT_RAW12;
> +	case MEDIA_BUS_FMT_Y14_1X14:
> +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> +		return MIPI_CSI2_DT_RAW14;
> +	case MEDIA_BUS_FMT_Y16_1X16:
> +	case MEDIA_BUS_FMT_SBGGR16_1X16:
> +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> +		return MIPI_CSI2_DT_RAW16;
> +	case MEDIA_BUS_FMT_SBGGR20_1X20:
> +	case MEDIA_BUS_FMT_SGBRG20_1X20:
> +	case MEDIA_BUS_FMT_SGRBG20_1X20:
> +	case MEDIA_BUS_FMT_SRGGB20_1X20:
> +		return MIPI_CSI2_DT_RAW20;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mipi_csi2_dt_for_mbus);
> diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> index 40fc0264250d..0bea79ab66c6 100644
> --- a/include/media/mipi-csi2.h
> +++ b/include/media/mipi-csi2.h
> @@ -44,4 +44,6 @@
>  #define MIPI_CSI2_DT_RAW20		0x2f
>  #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
>
> +int mipi_csi2_dt_for_mbus(u32 code);
> +
>  #endif /* _MEDIA_MIPI_CSI2_H */
> --
> 2.47.3
>

