Return-Path: <linux-media+bounces-55425-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MteAnCLsWnkDAAAu9opvQ
	(envelope-from <linux-media+bounces-55425-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:34:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD0B2669E9
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E86823040753
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 15:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F228F3DEFFC;
	Wed, 11 Mar 2026 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JL5RFrmq"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE993DCD88;
	Wed, 11 Mar 2026 15:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243238; cv=fail; b=rKkuMQ/97EQ3uq/FXFpPcZp2vG7Ia3Bg48xEyTvQnS9pL9I4L9aNqIyw5uj4BG3OK9NdiA5aZlk6rC4oyc12bKP0lFT8Ku46BWZCnNMHq+9CbEu3QtOc/sxTCfQLXwqWPHx1QuF5LPRKUT+7XP0nfImG10u+qTYeZDPs2bG2AO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243238; c=relaxed/simple;
	bh=dZwy1NZu6Z79E8ZVd/p7LhON6gg/1p36fgC6tbowlAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cwk0QATFhIj6xH0eOZ4ScCHy4+hmjfQXAI0MfFf5ZARTQu0AoRzfplJgHMIXGOISpHb604OlG3yyxSV1w1azBCDAQGruXj+zG/KkTb7UezXoltD8b6Gi1mwg/rl1yHmNzQE+wZRGJU6Nn7cye0LOe9bkbP25brd79fgDfLjtRN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JL5RFrmq; arc=fail smtp.client-ip=52.101.83.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSp9o2hOT4PPrgrRTg9WXM5LSFXa6RvK5etnJdHDEm9hQSosQMRA51AvGsLDe7ilL0PCGPyDDiu+7gGZgkWpuBRJ4KTVM73Y1cNnsWlYRnTb+7W6AwOaDjRY/HX1v5NzZbcebJWZRx3ZlrfZGoDApBsoS3SH78gMKo0X2Ks72X5ZIXrkVBAI2Z9EVH8sUs5lXlujS94/b5M6QldUbSczJWb8b0eRNxG9DGQTs/KIyHYuYojS9T3YEMgd8hW1I8rnb3HtrV0BSStf/c2tySADezBO+CnimaR2JYIdel4A8+vJk4xjgtZorOjfROkjssl6xyF6VH9Jf5/SMy+S8dQEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OmtM4uh9eAh+G8/NWgv59EnNl2dMal59lnv3oJ/4uA=;
 b=jnUemo9qMhE5R5kYa7j0sA5GEgfxaDLgLXnwj5dgcGG75Fpv+2Nx1Loq7XycYv9YzLlw/0vZfxkyfopFvG6KGMPxpOZYHCuS0ondBEtQsuCghEJV2RlXOM7ASAIm8zcKMf+yT7ZqXukn2B54028XZToKIw02HhBZesJfdMKq5KMPVRao3Qh9JX4Ol/9iuklHN6kO9U8w/rnJb9ELGsLmuHZ8K6zWnleV8Wcb28bt9TVlCXVkbVtC2b5uY64m5IZ7Y3xTYIr5w85DobHbn0zb15qwqyggU4qdeSn9IBXxEi5sUodY/IbhYaX4HCOuzkyaOhoed/rUgqiBgBV3bjHNpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OmtM4uh9eAh+G8/NWgv59EnNl2dMal59lnv3oJ/4uA=;
 b=JL5RFrmqkWQNa5glpNktXdSfDfKBeWCTlDhuoWKmQOY1BvcvQdyRhY1gycW+G0URmv1yMkql2nuV1U877ElgE/w7Tbv2GWV5CPk0E2NLCce5FIVfSCzipYzds8/5EK/gsTORm3KrsPQczyrUWLwEkqH4ioA48wtQoOWIWyj55oewoHHobNNF4xQIeCcaCpPdBceJVCJBDLQzIuqLUP8VfAuEwoJViXSruEy0HnnfbGwXT2QlezR1nPZ8b6sXeb8UWubookmbUbzZdx3+EMD6lxq+QC6WZmKql3V657dWdq3CYXXnALuVsFeTtVCGmQsj08FirSnvKZ8mpzU+mKkU9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11382.eurprd04.prod.outlook.com (2603:10a6:102:4f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:33:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 15:33:50 +0000
Date: Wed, 11 Mar 2026 11:33:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexi Birlinger <alexi.birlinger@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 2/2] media: nxp: imx8-isi: Prioritize pending buffers
 over discard buffers
Message-ID: <abGLVqeJ1C4_Fyhb@lizhi-Precision-Tower-5810>
References: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
 <20260311-isi_min_buffers-v1-2-c9299d6e8ae6@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-isi_min_buffers-v1-2-c9299d6e8ae6@nxp.com>
X-ClientProxiedBy: PH7PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:510:339::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11382:EE_
X-MS-Office365-Filtering-Correlation-Id: a3422022-be5e-443c-8d6c-08de7f83980b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 KLvtrLi+6KhAXKPFvOkcIycSnF4RSBXtWB3CJyQauCNzUXwJxBUszcL4fSLMWdWiH37O66i0+LSpf+Nq5Q4anUCkZWgZfdTWMmoGZ8Y3H4gDLLFScOpa6+2j13PoDaD6FbB+WdOrau3PtkqQMBzpITHKzXJx+636AEEbgR0g7BiZ7+61Fnb+0GKwdh3BwPlf/FMg0oUOJ3EHs1sOaqGLrve3z6XB5jMOCaG66d7bPa1yQ2FSzFNaE0J7cr6lD/xVm34R9D7VaE+YK8Jnhj05qQgY40g5hxlzbyQYn7EV4DcXOgyJBIsOkzUzl6a9A9DojDaK5Za4E1FDq2UpgqX33fv92olEkUFTHFJIX1BqOEG8ctpc6l1OfdiAqgt7waQs70dbmtLilnU33PtJTBjjCLqqnpNO6XsRGjk71R9QA54jxg+p8edAPeSxx5pDSN2pTTdNCtN02Cbpq/26mJV53KeesXpOpLf5DIze4dzaZpYLZgWs7SjCAKSN7tv7eLBkEsr3trj5kYIFyiJ3fx/DwNMSoucxs225QY4zKqHRvg8LmWPEcw2VnHKHJ7vVLLqwQ5t7bzj5qEjrq503ubWDqs/YZMJw4P7x6sZhdMI3YlO6Fc/5Pq3yOxuT7MMsRVvnv+pI3LWBvBWprOyZS3YCq+ETzbes42U5PwxCdBgKGyHmJYyEal7PN8921ghMbm70bwIIDN3Ujj884gDg1wx0uyorwmpuTm1Ul1aYeuzbAu9aUi+wRftzSWmYxY7WvvClUlhSYA4LAkWAM+8p7e8AOYy+kH8BS9eFZCih1KyHYV8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ZsTz/eu1y6zvGkOSJpneWxDmC1dj0Dep8EOpMEMCuYBOXQupke98YKWt6Z1v?=
 =?us-ascii?Q?/ZTUNUy+WE6wp43Sbg2BTgi3B0CZV/amyeH2KU19fXMVHU0pTxM71gSxCi1c?=
 =?us-ascii?Q?7kmjBopvUkXxIA3J/EJWVlirxJzwTx5QoTerrgYbyhIZ2NF19dfVrLuteYWH?=
 =?us-ascii?Q?NdubDhJqRiu95CagYMfLAO8QaWyBHFMbld4ZZzhXLRTwsyv5spB696wRVqZp?=
 =?us-ascii?Q?2fSruuxRXflTMFgVLDE4pqmhdGtuw8YgptL1wgmdk0R4WtlqUnr/0SOvK0o/?=
 =?us-ascii?Q?W3nvnCJpSLt69offY+TlIbSLP6HfNnHsENjywaNAjib4fhdGET7vuTGHBb0V?=
 =?us-ascii?Q?rLd05JG6bsFV0bAETdfpVMNF780jSiVf6sljxMkeufisAWp1rdv31IqaJlKa?=
 =?us-ascii?Q?IbZ3uymwEWeOyckFNtlRQ/CuvZCL3KeahAdgKuRpMR+jPLkQhYB+PYmY79xy?=
 =?us-ascii?Q?KDVhl+gR4JK1FBVjHYHlcNZriHFbWAPtylXSg8zMosKbMUpLBq/I6RMk6JUg?=
 =?us-ascii?Q?vU6sdDgIkEKJi/0lDe3ho+TwQJuMNmgzENwMy4bJf3/x0xVxoo8xn05SkYAW?=
 =?us-ascii?Q?fDE78Tt3r7IY2SLgX+xt+O5EENrlJNCrKnBkjApXPjXtBplxBISAm8re1A1V?=
 =?us-ascii?Q?sIvVUrNqBkLutMF9mvhzcXSeg+8vD2ELYBaJ5ddcEP88RxpQ/GgIRy6u1zTX?=
 =?us-ascii?Q?Upz32QdFhrbTwGChi1Lz9d6BI6i8Vjh+ShD9ChO82ts/6EMlopwMTzDgCDFN?=
 =?us-ascii?Q?GcqUnEXi9rqjNJBI65El9YwH+Ags0T0F3LgxeKs2vbyO0oAW1j9/6zHpze+X?=
 =?us-ascii?Q?ZVrPbkO0NU3oH7mRSheHe/aEKv583LI7sW1At/HR3/Hw3YrkO8jiiMnRbqF8?=
 =?us-ascii?Q?eh/N8MuQvbXEla9NU8O565RlFma0v7aGAIjeDKPTS8up0AkroiqO+uePHyRk?=
 =?us-ascii?Q?iUz158YNxKZ+mIuk19SvjgHblvO41eFqc03FkFsDMFWGVTGbIMJxIkCeepRB?=
 =?us-ascii?Q?JHaeBTKZgae+GkH1ouvVy1mPt+s7XpQzXKe6X6hVnVQIM2NqbxPBFJqse4tF?=
 =?us-ascii?Q?hIa8KzME38fZHK/dMKWt3ovEhAtGcreCH46uq9PKYUtg9KAyeSJ9F1eQxlzC?=
 =?us-ascii?Q?auoVw1Phwq9zduq3RMDLpnWbXvRCM/KaTjV7nrXHhtFxpKPsYpVZbYUv2Vpv?=
 =?us-ascii?Q?dEkSDJ4DnHmcZ4e5aHTE8tXyt1QUnn/SmScDRnMBx3rr9vI4oNhGjR/vmsUG?=
 =?us-ascii?Q?yufXh1p4K7Nx9FR7PCMlOQ4xQ/YHZ+OcVCzAhk3xIFc8pw5lUTWdGgr0lpvN?=
 =?us-ascii?Q?ZufI4e5s+jmcdlM7Io8ojzrgDpb6z5h4DSlLZdl62C+Pxq36ML5CGOd0Q68V?=
 =?us-ascii?Q?HOOAn5JelPjPD+Kz2TA2T5/vK9HMviWLsLi3SuUrE4ug9+uKEQFPhN1JsegH?=
 =?us-ascii?Q?HYJcuAfqGfrtpIlrk0C0s+vBi+yUIzUIbPv+4dRuF9w3gSKPmOnyCwIpnoIl?=
 =?us-ascii?Q?8xcrwYPM3JdXHJ/WGl4ya2t720C/v7gWbfJyPWxodKHO4HMzhkvVz1V6iTfH?=
 =?us-ascii?Q?VW/Qn7x3t6v/4MTMm7iNxuj78HJLbmUW0sZ5Zl7eTYVu0vEzpUHwZkwL/ddb?=
 =?us-ascii?Q?bWipm6onrGOFn0PIzXK6kLoGKVO497Zg9Xz0cxr9GqxcfNnPIWEnNPLIJk+w?=
 =?us-ascii?Q?8bru5GZtD/mlLW8YkT9B7twJFPYhMwuH2Rf25X2xXw6vE+b5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3422022-be5e-443c-8d6c-08de7f83980b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:33:50.4476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDkXu9t4GME7ydzdKqnt2UlmZ8OMzovGEWWPbJFptyxPJR22132hFpngWHvP0shzXNFby3c10LQsb3E2J+qVqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11382
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55425-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4FD0B2669E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 04:02:59PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Change the buffer selection logic to use pending buffers first (up to the
> number available), and only use discard buffers to fill remaining slots
> when insufficient pending buffers are queued. This ensures user buffers

Nit: Ensure user ...

> are utilized as soon as possible, improving efficiency and reducing the
> number of discarded frames at stream start.
>
> For example:
> - 2 pending buffers: both slots use pending buffers
> - 1 pending buffer: first slot uses pending, second uses discard
> - 0 pending buffers: both slots use discard buffers
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 2405baf21594cd18cf2b349234313c5e103b7802..53f4f74369f7855fe6b6f372294ee569f40a8ae6 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -786,13 +786,14 @@ static void mxc_isi_video_queue_first_buffers(struct mxc_isi_video *video)
>  		: list_is_singular(&video->out_pending) ? 1
>  		: 0;
>
> +	/* Queue buffers: prioritize pending buffers, then discard buffers */
>  	for (i = 0; i < 2; ++i) {
>  		enum mxc_isi_buf_id buf_id = i == 0 ? MXC_ISI_BUF1
>  					   : MXC_ISI_BUF2;
>  		struct mxc_isi_buffer *buf;
>  		struct list_head *list;
>
> -		list = i < discard ? &video->out_discard : &video->out_pending;
> +		list = (i < 2 - discard) ? &video->out_pending : &video->out_discard;

Is (2 - discard) the number of pending buffers? put commit's example as
comments here.

Frank

>  		buf = list_first_entry(list, struct mxc_isi_buffer, list);
>
>  		mxc_isi_channel_set_outbuf(video->pipe, buf->dma_addrs, buf_id);
>
> --
> 2.34.1
>

