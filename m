Return-Path: <linux-media+bounces-47313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C06C6B132
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 19:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B654134412F
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 17:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C17357723;
	Tue, 18 Nov 2025 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="muTVcPcB"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013025.outbound.protection.outlook.com [40.107.162.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA51C354ACC;
	Tue, 18 Nov 2025 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763488627; cv=fail; b=TIyEqsP3DD7E43/ge9f646fR8BKW44DLrCeCr0clh15BvNoraLucB6ATX76GyyYnTfsyfAL5g1MdJVOTs0XVC8mFjCr4C/PMv5n6wrA6CJY/VTGKpZJTG1AH5epDV0Tela9z0U/7RXF6QaJmzXsX8zFEcX8nA36jwtjUh676Xqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763488627; c=relaxed/simple;
	bh=6+tB52baHC3x2Lby9CuRHo4PjuqjxhsuOW6JCTpCL+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tlA2H+F5TbETGUB2ODOn0XA2NajxUwVj9o4RI9CUMtxNqR20p4u9O8qfJEigH2YbFB6M3dqVsLbG6vKqAgC7XBiiF47Kg5h8AbXgyVercvogk6z7i2E07Yco4G5MhaAnj6INXt9goMvdpmxuUqyDZWUfq+PplAOFbprWWA5CrHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=muTVcPcB; arc=fail smtp.client-ip=40.107.162.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGayamgqDVw99n/wRcUvtjzr6IcpEjOVlQxY7DTPmD4ra913B1zactLkudfdr5YR7nCSEj2ovuQp7Vn9hCc3qtjnoKNZGpxHgKycAA4xoysuW6GhDhuDvKAGbyvZqj9Q/rAbmjl/OSF5h3M95ECG5byf9g+PRghgfXHboFa0eR7YgrfaPRGnSG5CCKla6cy5IhwVRXE3ineUHmbvwAnZOsvBmLMjwo0ixQACbHNOPeqBQ/Ikhd1KX4jlyt7NY4hprn8T10uISnFsrf1fmus3IztrBZKVLbWN+SWu3dHkKYnSLQ6lkgKjm3Vf8QQs8/l4WwiGWFa9IAhW7kMZks8tLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vQuHJaX7BJA2GP0FQnoozugrBhvrlZmEYk1lf/MCXk=;
 b=j7LDn9vzPywOILw7t+Lr0iap1tpvduDf5S17Z566xTHJ6brVM3Xejep/2DNO6dc+5tJGPNs9wrGSYsVl2zDhkvGiyles/jAFE2VJlGIvYfE2BXSgGUuQgrEmhMKUDCfII7FV7khjHOQz4drTFap5R/iSfYEmjRFzgWlzyVvgryAjIt0w1RPzX0s9AJThbeDowGIGq+66IH5XKU95LlGH+8cpr10q/uwwO6abBdofe/JpkytSwRsGuDNKJ3/Q99JO/yyeNuBy73Z9B9uE93DQTd6pZgq5PbtKqd2ZRTHcWJn0oJBbHwKWs2iPT/8G2i6FB8uWS6iJ8WVe6xf3chwuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vQuHJaX7BJA2GP0FQnoozugrBhvrlZmEYk1lf/MCXk=;
 b=muTVcPcBOQH9pI823tCcHpG8iJN02vy69e4Dqp1UWJVPcFwmMNhst9JA5g4icnHYB8n/WCu212fw3vt1TjFAY1Oh0FKNGTi3NT+xSZxkdsWa06tcUyxhmDhGfJnkUSDAT7LjtRqhpuXvugdsQp2N30ihS9cSSqY4DzA1zRc3rMpZmMPoywqq3NWiIItxBDnWXGH82s8Ge4HYr2GewMijQurtoM3/o7Fxv4r6cSMQQj5Wh1ASWLpP/2XeyFx/nnD62J1QnayugXqa/3GyBYIs9NC63zvBSmuQgEWsr52UAEN9114PH4dUshWNTyudOVXYR4O/Or4ohISNHyBri1qCGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB8104.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 17:57:00 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:57:00 +0000
Date: Tue, 18 Nov 2025 12:56:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 02/31] media: v4l2-common: Add helper function
 v4l_get_required_align_by_bpp()
Message-ID: <aRyzYoCTNJQrlsou@lizhi-Precision-Tower-5810>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-2-c9286fbb34b9@nxp.com>
 <20251027011927.GS13023@pendragon.ideasonboard.com>
 <aP+nf1hpvkafxHrF@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP+nf1hpvkafxHrF@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PH8PR15CA0015.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::23) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 02bc0dcd-9de6-48c6-cf19-08de26cbdf23
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?VNFY0mfwCWEPiieSGVCslXeb7mqhG9p4SXx+CjUZDPKk2kBQ2j5SG0f8WH4S?=
 =?us-ascii?Q?HlmrCoQ0p4u3UimZWiFJR95lonskqypSklddCG4FngL8eFTA1VoCgFP1VDTQ?=
 =?us-ascii?Q?fq7LIsQ/2spgmZoo5w4AwUI7yIXKVPRsrsJfwDLKJijd7A+U52mxbbVRfd+N?=
 =?us-ascii?Q?4EqOPrVGg6LEzGHQgvcMuCi7KnGQqOiiWtR1rMvqEaOqMG23596nfyq4CIFG?=
 =?us-ascii?Q?JQVIr8P+HH01ktI5Ig848cVuvSb0upfuwp9Hw3lLW8O/9y62Fx1gP8/jVdZJ?=
 =?us-ascii?Q?xvcCmQKhFYNoF/O8WpifsL4j9oVf6poYQ11QUljg7up+MMDbH2IDkwIwbhKb?=
 =?us-ascii?Q?b+hxn5DBCe0/fmRaFiAJaOu+6yuwdjfPQojAObh++Jh1QTmq74OI70mRIrG5?=
 =?us-ascii?Q?sVm3aTDOHnEWg25fxTiCpHbMFrGSxySaeFaNXRWuc5ORO3WufiJ60KZ3Cl+u?=
 =?us-ascii?Q?GMvHtoYFrwAFheBw7gIkLjsiPTHcV0IQnA09uArwIZRIdOLLDUD4t5TPZdvp?=
 =?us-ascii?Q?Almotj4tuoUqg7AZn9A8IKpdzqpaDetFWpafmEzhK1idvciXqHavcOEZBUjq?=
 =?us-ascii?Q?juNAudU7tqFUaUOdaJ8Nua++apw9c/XtIHFtP1cPb0JjPRS7NK8kHNPrHqvg?=
 =?us-ascii?Q?D5H7HU3bTYRNHLjAMzNZgPQC8ecNecAivAU0V+RilcTzr0oXb9svasXH/LVz?=
 =?us-ascii?Q?uso4fkzdroJKuFCNl0PbqBjdlRM4WHvO8Q8TPCZ9tytu6Ud0s/oVwEORoWEM?=
 =?us-ascii?Q?Vvj6j1z/7uLRyqoI1fR4nkjE12yXkei3mToj4BOoY1oIfAHCisIXm9E5NiYw?=
 =?us-ascii?Q?Y9DRiC+VZklYQWtfFCz7NCUhu+bifMOBzgZOrKboNe6csjCwceozc0ihoTae?=
 =?us-ascii?Q?YNh4+b0ohg6hB8S2/2k1Z0mQn0pNJrpzRdfeWZ3VibIVJY7Dh88xDWW6a5s1?=
 =?us-ascii?Q?d9B/cXHy0VQi57xY64HHYoPkm/VCgkH+oHdctY3I7Zvvr7ftwV0F86xYdi7j?=
 =?us-ascii?Q?5tH4Li431csaF0s4u3lNvzGHTOnLU5vam0K7wFS08jD0Zo3ty0UqRORFToi9?=
 =?us-ascii?Q?s2UgEB7s4/6ec9UfUK4p3U46bsiVQeM0f2VAYUDRQBkMfy28IwEzKAEoZns3?=
 =?us-ascii?Q?99sU5CLcjsdOx9TO0Hi96FOCiENxrxgAT0ZhPC+vESguTFOcPEOyhQzC5P0w?=
 =?us-ascii?Q?bgiBz6iv455pcGG0OJDP0POthJidcINWodg127aj2NDN72bFuiV+UKqBIcLJ?=
 =?us-ascii?Q?lKiWg8qDWXLGBwbDEsRAUmcxRAsLTk7X9MU0/Ej3AGduR2Pe0qxmmyPvnvvk?=
 =?us-ascii?Q?NWnW14AsMAKfcwuaYp/05UO78lmYZo8w5b+FgkBB6YlEl4j77toq1kdYsSbf?=
 =?us-ascii?Q?sS2xwufY7fVts9ZDBATJbz6+YNapHyaJYov+9lSoaD/1nRaKzkpfWx0R+QqE?=
 =?us-ascii?Q?lgsOMWKMPTXg4etHTGYYDiN+mfDpPR8q5wDZvsL/WhKWDP1UCIizzFjulyiw?=
 =?us-ascii?Q?Omf1orEkdi9iYr3kMcJK2rG/nqkgbu7jKXaIFZpVKY8vRUFM4pOwPLkMDQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gj3f9LvuqSw/cJMLGBj/GgcaGGT4mlv4hboV2HtSiiwlVCDa7I7fc8zxC6nw?=
 =?us-ascii?Q?mFME/W+eEzaCT5as/px0L3GD+FVdKmsAYddO5aoglq0pM9fg0s0Qhx2NA5vR?=
 =?us-ascii?Q?WojW9kPwLU/RWiRgMbRmsPSOGk+sZWUYEvsW1f8AHx/XKbQ3kF7oIhSUyPqb?=
 =?us-ascii?Q?WKyV4u+A4s7qndpWPx0LGQxxIIwUozxSeCAnGtNJh/MS5pcwu0yHQBTgBCp5?=
 =?us-ascii?Q?QIqC3Q8h6opQwnWwKrYNPGXdBG3UBFaT5ZGiWe300vEiiLdcJE4JmXZ28ZNX?=
 =?us-ascii?Q?HWztpYMHJEcOA92OLQeQS+vYjLvFHbBqwa+KCz9bk++pcRyw9nQltD1NGguA?=
 =?us-ascii?Q?Vg1LFCNr7IdfHfTzuBMLNQ2tsX8/6R2DwyPzttMAbCh/74VdYkktZ71jioeX?=
 =?us-ascii?Q?uE6Bl1841+i4yNpxHTM7Z+XaU7nDp8pGQauchummxMqyZkI5oE9HqibkQOyv?=
 =?us-ascii?Q?hfuyfdkxtq9twmFUMUplOANkIQIowhV53PlbRH54gmsIoYnIXhjgOEWXy3Wi?=
 =?us-ascii?Q?zP7mqomGYIfFX469eA3FufKbone1urR95ZWTHZPF7mVtbOxZn49hfMhJTm9J?=
 =?us-ascii?Q?cj8qYyDP1RKQNKzXtb/0KM3rvdaIng/8sNWw4cXOxTwWkX6Bp9V0CNAag5jJ?=
 =?us-ascii?Q?/EBvLqCjx7LQczCTIkrMIgdG4E1kBOnNL28IFTMiVUgJW9XJjgSpd/Bv9c78?=
 =?us-ascii?Q?ixBlsnyILeS5ozLLtIX+rVzLtwDiW3T+1FwsVpFiWRl1b3mGYuohI7mtfzjZ?=
 =?us-ascii?Q?X84r+v6e8lw7KXeiGbQzINPCbbxV0D2GjoxjcEELIeY80drrtYWxqXfWmyX/?=
 =?us-ascii?Q?mCYTOCO9FZ3I8AWIKFkZ3dEq4Z4dCsAgKEtdPoXVvPtsEpGrtcKYL3XLYiYq?=
 =?us-ascii?Q?rtnfCduHhgHI48lgt983hW4JszmhKaalYnw71o9/6xYMyGVE8t5TAIesUJoH?=
 =?us-ascii?Q?AI1R+8spOhVZLr6L4AYyIIXdusJ46t3ipe47ss59hQb+Cbxn3qrvxwrO0ASX?=
 =?us-ascii?Q?28uKq1Po/hFXt+YBqW9ixppSKLPP4FqWn0S+3b7Y8kdH/p1LLoe5RR1h1NUm?=
 =?us-ascii?Q?9dGfHlzjB4cdalDsVpWp84WZQ8mMDIkiaKS7YPxg5e3g0wa8HeibwcldnQwi?=
 =?us-ascii?Q?HuBrXkyQmch6QwSh5EOL9e2Ni4QYfevKfcOq4TylwD39dXju87E9m9D5sj5a?=
 =?us-ascii?Q?qpHfJjOxSkyWETrTqDdDT6V8+5c1IOLGd92N8Af+IsMDbRuIQkDmZuGz1qCD?=
 =?us-ascii?Q?JQx/fQBf+mc+bwJVXT8wA+bQC6Eod9FMqnj+9M/lUCeULTBVnKAEmX9LgLme?=
 =?us-ascii?Q?fxs5dNE70S0WkOxCQZ/iNVDQLwbRpJd+CfYrVEds5zNn+XTiX5C8T+rvtKei?=
 =?us-ascii?Q?aMvlb2hNNmVR1Pi30oWl8JpTA4rVmrGOm8wwRnp2G7m/km7maJWpizw+NpFn?=
 =?us-ascii?Q?Ntt/gjRB3S0BZ+jYMAe3FaJI9UMBvqfTuCVZ42Fr9XrI2ppCR3QBfsMN/9Hd?=
 =?us-ascii?Q?+DEeVuw8dU3nOQeOJgdo76gyH/or2w25FuOF86tg12yYH8Uzxj50RhQGEK7D?=
 =?us-ascii?Q?Ij8dqtT0VNH+dsFcZPqEXw+EehV7MKyIQNhjVKv5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bc0dcd-9de6-48c6-cf19-08de26cbdf23
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:57:00.3400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWQ/oFlUbQsO3cEdmqc5Txq4olMGE4QdBgTjAjvrKKA4mlO/6Kqa9abppg+EHsDuHCRzlDOlEoH8tjGHdx47Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8104

On Mon, Oct 27, 2025 at 01:10:23PM -0400, Frank Li wrote:
> On Mon, Oct 27, 2025 at 03:19:27AM +0200, Laurent Pinchart wrote:
> > On Thu, Aug 21, 2025 at 04:15:37PM -0400, Frank Li wrote:
> > > Add helper v4l_get_required_align_by_bpp() to help get width alignment
> > > requirement. Basic replace below logic and enhance to any 2^[0..31] in
> > > drivers/media/platform/nxp/imx-mipi-csis.c
> > >
> > > mipi_csis_set_fmt(
> > > {
> > >         ...
> > >
> > >         switch (csis_fmt->width % 8) {
> > >         case 0:
> > >                 align = 0;
> > >                 break;
> > >         case 4:
> > >                 align = 1;
> > >                 break;
> > >         case 2:
> > >         case 6:
> > >                 align = 2;
> > >                 break;
> > >         default:
> > >                 /* 1, 3, 5, 7 */
> > >                 align = 3;
> > >                 break;
> > >         }
> > > 	...
> > > }
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > The same patch will be see at https://lore.kernel.org/imx/20250729-imx8qxp_pcam-v4-2-4dfca4ed2f87@nxp.com/
> > > dw csi2 patch also this
> > > ---
> > >  include/media/v4l2-common.h | 30 ++++++++++++++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >
> > > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > > index 39dd0c78d70f7b935c2e10f9767646d2cedd3079..0a9da5e8daaddf26903d9ff4bed08b283dcd38b2 100644
> > > --- a/include/media/v4l2-common.h
> > > +++ b/include/media/v4l2-common.h
> > > @@ -704,4 +704,34 @@ static inline bool v4l2_is_quant_valid(__u8 quantization)
> > >  	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
> > >  }
> > >
> > > +/**
> > > + * v4l_get_required_align_by_bpp - get align requirement for
> > > + *	v4l_bound_align_image(). (bpp * width) % (1 << align) have to be 0.
> > > + *	given number bpp, get width's alignment requirement. For example,
> > > + *	if align is 3, means require bpp * width must be multiples of 8.
> > > + *	    bpp     return  width's requirememnt
> > > + *	    0       0       none
> > > + *	    1       3       8 (need 3 zero bits)
> > > + *	    2       2       4
> > > + *	    3       3       8
> > > + *	    4       1       2
> > > + *	    5       3       8
> > > + *	    6       2       4
> > > + *	    7       3       8
> >
> > This is supposed to be a brief one-line description. The rest of the
> > documentation goes after the argument.
> >
> > Also, have checked the formatting of the generated documentation ?
> >
> > > + * @bpp: input bpp
> >
> > I have no idea if this is a bits per pixel or bytes per pixel value. I'm
> > actually not sure what the function is even supposed to do. It feels
> > it's really a ad-hoc helper, I would like to see it being used in
> > multiple drivers to see if it makes sense.
>
> drivers/media/platform/nxp/imx-mipi-csis.c
> imx_cpi_set_fmt() in
> https://lore.kernel.org/imx/20250729-imx8qxp_pcam-v4-3-4dfca4ed2f87@nxp.com/
>
> I am not sure if userspace to pass down a old width to driver, like 1033.

Do you agree this change, I can post this patch + imx-mipi-csis.c as
sperate patches?

dwc csi2 need split more small serise to reduce review efforts.

Frank

>
> Frank
>
> >
> > > + * @align: expected alignment, 2^(align).
> > > + *
> > > + * return: required alignment.
> > > + */
> > > +static inline u32 v4l_get_required_align_by_bpp(u32 bpp, u32 align)
> > > +{
> > > +	int pos;
> > > +
> > > +	if (bpp == 0)
> > > +		return 0;
> > > +
> > > +	pos = ffs(bpp) - 1;
> > > +	return pos > align ? 0 : align - pos;
> > > +}
> > > +
> > >  #endif /* V4L2_COMMON_H_ */
> > >
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

