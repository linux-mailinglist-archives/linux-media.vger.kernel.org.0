Return-Path: <linux-media+bounces-63644-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XMFgF9VqIGqR3AAAu9opvQ
	(envelope-from <linux-media+bounces-63644-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 19:56:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5593863A51C
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 19:56:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=JoAGuI1+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63644-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63644-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31E853005157
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 17:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426EB37FF75;
	Wed,  3 Jun 2026 17:53:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D237F738;
	Wed,  3 Jun 2026 17:53:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780509219; cv=fail; b=bzw/U5hl87GVV6USlt3pm5O+yuXJYSHYp/gfCmY6brKNCPgxPWKAyg95Hm94lmgSS7k083B7TrXLzO51mzyI6PXoe/RwSHVrPUDsYSh1T8iwGSmQtqgM4GgfhswHEE+YljZXMlMaPTgVeWDKokfUGfUzdChEdVT/f4p6UQCdIUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780509219; c=relaxed/simple;
	bh=AsT43GN1xeFKodoQBbHNbnkYI6BVpvfq+vcxDnzcWcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LNhH7Q+ZGhGT/gxk15g+EY42GIOvetM15wmP1MNofaa8T4ByQans83Jlf76/ZTiQPz40uPC/r7wS3Ajf23FEwmjZ16VAg1hqS0qaHxNmXhiVrT9wxvvLNI9MRx2dWZI1tTKSbLY4jnZwLzM7TS7UYB9yeHKqmewnFrATgm23blM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JoAGuI1+; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTlOKrq8fAa738vA3hItG6yEqtl9EJw+C16SLHFyba9nu4ET9ZaKlkxINzpMGWl5TEkfcLXeO/DF7xienQ4iNkGrYSj9N3STywiAjmJ7ijzXs6g3ctNM8Rbl3JuZXhEkHNjUvNyf4AOHS+TufqT09efoA8CkbOFLXhmID0hPdbBeAJ6HvC3YUNSufvIctYwWOLCywXpJ9vcgM3eedLKSL0IYKZyA2lcPZsuM8oMZLi0V2sdkiFY1QJt3Kgbg52HvTGs4xJ0FsgFj8NvkMwLzPVh8Xqfi96GxrgySxW+w+wx6/6e7kU4H6K5ZBK6lzkmgSUBFF+5uaGsEZaAWY+ROpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LkjzKT1TjvWg+Bw8Ovn79AlAcC8kFfn7TKncuCWK0A=;
 b=c1sUG8amFBennUH6vCuj7XKptj/C4ozL8f2HtQcI3cNi1wn8DQeRxIkauyWaDyFtbM7QnyIhup7b0RDqobUbyLkKo+MSgoiBGWVGo3yhNWzV2RxppiaDJp1ybx4VHlpdej3tf4ko3N5LAGjVbZuvO6VX9ULGcud2EC8nBsXJajyc1N7sdrjE5KGoYnnpHCCMwHyen/SvNcQq12h28Rt5hqHd4pwca6gCsgAUWG+akMy4j+MsCiz4cLwCkWFgZGLZS8zaW7KTaKuLuNstPDalFj06uJy8S1S+JXVs7AZjOA+0vRBxiwaneP+wAJsWiHqmV8KS1o6x1iiCebNFB5nOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LkjzKT1TjvWg+Bw8Ovn79AlAcC8kFfn7TKncuCWK0A=;
 b=JoAGuI1++O8GZIQeetePNjKAaUHdk+/pTKsD+6z/qoPTso5hbxu14EAsNzR4PHPEj7Fj3oSP02cb7r65kO1YiGuXXpvEVQYWN/yMvtOa75nsRHB9BMXRqD3ks8kZyjylTeDDlKjIqYpNZrTW9KvLvwWRr5Sxs4wqhi+4jnJBOnMRJkIIJ7EkoyhQwFn2ctliG3N5K5p3zwxxup4u0qNqkF8QVJzxpKql5coMS4AdHq1S9N8VmbkijXRK/4cOIwNXMPSw/5kKuPJMJ3dgV5d7j6KNySHltl0FFCync8BMfREZ2qsoTOi3qqAgKTFYybGsYzxuyb3n7bv3fy2pt2tsAA==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB4PR04MB11280.eurprd04.prod.outlook.com (2603:10a6:10:5e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:53:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:53:35 +0000
Date: Wed, 3 Jun 2026 13:53:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org, michael.riesch@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: imx: imx8mq-mipi-csi2: Add myself as reviewer
 to imx8mq-mipi-csi2
Message-ID: <aiBqGVR11AZ-QI26@lizhi-Precision-Tower-5810>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
 <20260603-dphy-params-extension-v1-1-22e0e1ed8bf2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-dphy-params-extension-v1-1-22e0e1ed8bf2@kernel.org>
X-ClientProxiedBy: SA9PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:806:a7::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB4PR04MB11280:EE_
X-MS-Office365-Filtering-Correlation-Id: e010b393-f341-4ef5-3979-08dec1990877
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|1800799024|19092799006|366016|38350700014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 np/sMIvTz+OEOXDRb0xEFLfIMmRIOunvIU6iNVQE6pjjTHeZ9MXxCGpq7D+nOK6xBYgcBDKRVcri2RJd8yMTPT4yICHjPSY2TKYKaCcKOHJMBoz6GHiGh6HNNmCOQOAzn+fMny6jbaxvBAY8KkgwOSBJ26xXLjxfEhhcX+gjInnzBwJgEdbQWU0hBtWtceQBQb5jI2a2k+XpthjWc85xoYKVwJOBK/k14jhjRGdq2lNihr4fGuK1EwtuB9qzGBTJQ3IDgx40cRi9XEbiPUyojw8pKGpp6iDmXftNaVrPbvUul4YPD5ucqD0ZGyO6QcESu6kiHocLIl7rDmOMcEIaflb9C463kbS+CByiI+/GKM3nx0aufZ1bWeHhNnEhEE7UqoNbvObiksZNJrUe5uLF5O4LRCmoRIWv3OHFDwkzjEXIRv477MRzfF2mxZy521wkqvsUd4KDgi2RXg16qddctB2f7NsbrIk3J71LhcM2T+YG+3HbqqWNbXlvW3x4J195qfXPeb7f2CHIbypCSOw2F8g5RXi3ZDqtOB3lBcTkKNXH8pvEG40+ib/kUReZo1nEG5xW6oqVDtz9LP7eRSdK3bqePiR3phzUlT4YOj9G1Pp9cTjXI5YPAQZTTdu52wnNN708idah60+zMhgC5ByxcTDCjLktQZJGDi2xA+aTjMDouFqazCDc03BJpO2nV1No1ywxClOLVS2Plhtjq0JZgZ3d4IgnsR+REr2IRvsFVJFKHFac6xNzLshcwmF3fDgx
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?E7RNQwPE4Eiygwt6sTXzk1ucvYll824EfB4RDLD7Ge3ycPz22Dx2FkuRQeOu?=
 =?us-ascii?Q?MX+Ar6KmrA/XoUAL1bZjjHuQs0gZ3spM9vxmwDCizDdxQNQvt5TxDFkAfEmG?=
 =?us-ascii?Q?WkbMg/KZpljJC++XbpLL3UBvfzSqXl9PpZ10GUnpSo1FhgCZdBGHY1hoBShx?=
 =?us-ascii?Q?8Kk+g7eB4LE9CXYCg3h6B5yoJCgY9xNxH/Hedp+bc0Y6suWdeMN93UmfVbJF?=
 =?us-ascii?Q?91AVlZg6smNN9cidnKbin3wtJ/SjvdOxxK2629GQEzrXBmFL9iaWYQ3D870c?=
 =?us-ascii?Q?ig/EiT38/92vw43XY3D/rgw/OsPPinEV5TPgG6q6tZwpK4UF8TP5Clpw3DNU?=
 =?us-ascii?Q?8Ms0g1O8x6YIZN9pDI7ATuLLlix4BIxXLrmCLCnUwVYYH9K9YX1pJVBGMCN/?=
 =?us-ascii?Q?odAwlEy5Vh/xfv6ncOroCOJrx4vkMbTw21tetlPmGAvjphHnaQLGQ3JTN53R?=
 =?us-ascii?Q?C5DcGSQgbYHwDCw1Bic9ZHfWs1Aq4hGb6kAyGEur0lfqlIZr+eUFFYudrNaU?=
 =?us-ascii?Q?tTGdeBteXidPoOE9I4BfBGHfaCeIXUlIi4puIEslQnK1AcDuxSOkikxQRGo4?=
 =?us-ascii?Q?7+tQNwGy/Bc/Ng/6ipHnsRrRCfwG+L1/jdJ7atrojcH7fk35ggVqJg5pThWf?=
 =?us-ascii?Q?CCEPyrceoTkXvxiHFzI/cAacgm/Er+m4srbgJ2sP6hfyeW+IIL/1K+pHZPHV?=
 =?us-ascii?Q?65/vxAw2P06NLS04YKMIQbgvs5r6UQin11RwEtfxme6GGiDL4uKzRRrSAT7E?=
 =?us-ascii?Q?37X6vvAfc1IJB44nkobehJQsgmPBlA1AHAasfK7TJfNSWs8zUjI15tV3fIPI?=
 =?us-ascii?Q?DV3ffS/V2+k88UsmPr/IQLHpqqtdz2ah2WRRykLOigRFJt8bT4h2hDAEvR0P?=
 =?us-ascii?Q?jr6pX0fwuyYqt53GPAaIjOt+M9t53PWzwcMwHr83gwsxy1tEu6cNhJ1AW8ep?=
 =?us-ascii?Q?80ngvxcZI2UXSY3omZ72z0Wd9ffI8yxVfm8hYVGQbJlncOVPmEgm+EbzqOMc?=
 =?us-ascii?Q?JKlMaTdDo80WYS2oLwPjcYQHWX1PHN2lY4xKrmfXg4rNCbC/zWgHl0LllmO8?=
 =?us-ascii?Q?2S5P/qBiyPKAeWpgEH4AQ7idbZVfvfN8khof+cpTdNBvviOhCg8UZud65rly?=
 =?us-ascii?Q?HeAstIUdCs5kId+14qbcYpEsuQcZ5kbc3AK88hlMosRyUMKOObxCXfXh/wp2?=
 =?us-ascii?Q?AelYp4fkbWgxyrRxHOeqcZEOd9b5dUIvn3lXazb6T/QRwxkGqsefOUQq/4TZ?=
 =?us-ascii?Q?7ygyNlnSVwhgfBvnK517abhHDmCvbzwo38+bwpAJPoUTa6b9TXYjOmKAqXaT?=
 =?us-ascii?Q?+6QVbfeVYqFNgOM8V+TID3YuBpdK6iJrTxXEOueskciaHV27njw1olD2V4ur?=
 =?us-ascii?Q?3EDoifLlAs26Vr7sHakYj2SnS+xiGGZxZjv7xcD90Nxk7RxX8RtOPAi5RqSm?=
 =?us-ascii?Q?XOyj/4CUrrajKxoBQf3KVb644mazi+urF+2rLkG7dnYhL0xarWLwpHZ7bYbt?=
 =?us-ascii?Q?gThE7xLjU2W1z8Iij6GQ93u3ZxKdD8uP27BQ8T2TbVCAeVTZd183XIA0Ufo3?=
 =?us-ascii?Q?gpVTWqCg/TIlsWAAbLBsj1wPc3GWQv/pu/7qZPa4R5dpqKGSFukLrsHrNWaJ?=
 =?us-ascii?Q?txWWr6snDLannoKCW81hi/BtuhppXUksDh0/oX8uF5zzT+fuXbLBGHstlMzU?=
 =?us-ascii?Q?LWHMz0HeOJNnjcUztKYWv2e9gUPT+lwkiZrGoyHPXHGJNw09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e010b393-f341-4ef5-3979-08dec1990877
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:53:35.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poY5i+88ubeIsHrW8tSajs9vEIXunS2gZoOZ5wSPWjdDeCB4jy6ypOVZCCZKchIaMKWW4jsjDrCE0egU/ZOZEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB11280
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63644-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:linux-kernel@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:michael.riesch@collabora.com,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,lizhi-Precision-Tower-5810:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.dev:email,nxp.com:dkim,nxp.com:from_mime,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5593863A51C

On Wed, Jun 03, 2026 at 12:15:40AM +0100, Bryan O'Donoghue wrote:
> At the media summit in Nice this year we discussed that cross reviewing
> from different people on LKML was lacking and desirable. Laurent suggested
> NXP/Qcom do some cross pollination.
>
> Happy to read and review NXP stuff in that spirit.
>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efbf808063e50..8436428865aac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16094,6 +16094,7 @@ M:	Frank Li <Frank.Li@nxp.com>
>  M:	Martin Kepplinger-Novakovic <martink@posteo.de>
>  R:	Rui Miguel Silva <rmfrfs@gmail.com>
>  R:	Purism Kernel Team <kernel@puri.sm>
> +R:	Bryan O'Donoghue <bod@kernel.org>
>  L:	imx@lists.linux.dev
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>
> --
> 2.54.0
>

