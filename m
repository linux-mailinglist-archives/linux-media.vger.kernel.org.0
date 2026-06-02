Return-Path: <linux-media+bounces-63339-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GePJP1CHmraiAkAu9opvQ
	(envelope-from <linux-media+bounces-63339-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 04:42:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1801627595
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 04:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA5533071C5C
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 02:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C13364049;
	Tue,  2 Jun 2026 02:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DXh7CxVS"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2E835DA5B;
	Tue,  2 Jun 2026 02:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780367805; cv=fail; b=c9ETKBJldZEjYLqoK50bqKMlFdkIIHmGpKkK1FS/xiY4ZUuuuGUydb/1XKmLkM3zk1QGBWD687jHVugoiCouwF2nurxwq5wcyPiZhG9NNA4Jn6eVIJZTYGB9/9JdrEuzgsxUtPZFm4KAyWLB/f40vN++rGTTIxn2vzQoq6oBRu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780367805; c=relaxed/simple;
	bh=/msKOLp/vv86sC71RcefXIdoLU6jjv4qEVLeCcDWCT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J5aZ1tW4Z/CPlxiE8eRswdkzNkbBP4G072qI0Ah2thyoHG7W8RwqBivKhj+5yU4grhrtjkznL9phhzJaV621c6wK9l0FJwRi/IYAoIw/3dB9gTZAfvLMlsdCpUCxcP2KfdquBe4NcK1/O76bzqaBcv1I+t5B0XcaKQxecWX1zDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DXh7CxVS; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLyMf8apFiM2IoZ9sTT9EzKQbF6S2w/Hsf9UJP2bmp+mCW8mnCz31p/wuvxdf2TTJmRrWf6HEFay2i3t0NQv8TTfOqT6FWVQzgylbpPGCjoC7kMi/zHPz1yDjceNqwY8WS4ydbUjeOi/1pPbVYUYAiL6yjTkMYiPnWUsdN/vxAuJr/XhZbnbtVNqCptFZsoODPC2WgsHo+gd/xZAvVQR4V8NMKHGu0c6x101xGNQeQRAN7RLuGdi6yc5PA+ghfMA5UfvdtNhqj0YYgEaxUL7En/NVxeb5H9sUvWfwKMoayz+Q+7ckRT+1aSwEn2jTzD6ZhIJ36pMyDtXL6+hZL1Ccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCtp4r4R5+GDf214RMSPfvFKZl7HuQ3HszVFOAelJZY=;
 b=ZKgDMd11AiEuwaESqMqnsWlkl8wosoRPOKr58/mkl/PXAfIB00MU+8NJLXRg5IBomuqv1AEWkwu5jeX415oTCR+LtI3NmFC/TK9jBqmvbIu4GF5WIsBBML25IV6G1mNVnWA91f6mbl7I77rzLQmV4s+abIoWh1lAOOp/wkVdXUxqmdq5yfG1x92IHwpsoQ7ypXRcelnqtSEN+9CwzA0ata9PX1r9PBw7NTXVUYXS4Vddk2O/D3uRs2QVmbplH2+ByZ1QzGxrmyO77HN7npbHAW3Jgyk7aue0g5IgPyjdH+IApXeunvj23Iwpv8g+FXkMRItWv8T57WCcMcQW9jep8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCtp4r4R5+GDf214RMSPfvFKZl7HuQ3HszVFOAelJZY=;
 b=DXh7CxVSVokDpmchzvzFuMRdcuxgFmdJSXT5staB320KwKj3DnoLoVG8Iz13IOxbyULHV1B5bZ+QsrXDPtFKmAet+ym/IXttWuxjxeWgXkjnOzwo79d6zt7ZsKZMqQVjdyhjpxC+198+Y0vVCx9l/LQJ29ZVkVoU5rfYbBXLNHH7FjykAHvKRZXSIC3TJPlR9UsDSq1XiPlo1cEaiCoGMrnDCrk5om3jRKHgtF9qy9fGJragE5VhD0NhKedY6w+BnSIccuenQAUy1fSajKIwic7gdfXapuS8oTuAd0CK20okgRHDy4EKqFdGB2hnTnrAPbTR9RF7jW3EtmCbWzQOeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10390.eurprd04.prod.outlook.com (2603:10a6:800:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 02:36:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:36:40 +0000
Date: Mon, 1 Jun 2026 22:36:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: bod@kernel.org
Cc: p.zabel@pengutronix.de, xavier.roumegue@oss.nxp.com, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: Add myself to imx-pip as reviewer
Message-ID: <ah5Bs8LZR-pcYFyk@lizhi-Precision-Tower-5810>
References: <20260601155059.1332290-1-bod@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601155059.1332290-1-bod@kernel.org>
X-ClientProxiedBy: SN7PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:806:f2::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10390:EE_
X-MS-Office365-Filtering-Correlation-Id: 32902e51-091a-4b5b-e482-08dec04fc6f0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|376014|366016|1800799024|18002099003|22082099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
 B6YgswWG024lw78cCGyGq9uzJpsMdid3ee59WinR2s0q9/cNp44bL/AnFGL5SV8ggzk6zNbqaTGsfzWrcKsJKZ6e+TLUmS2rfYfT9p5cslHCXCymJEMOcvvajicvf78YOAY7kK2UHprwmHkTKltHvHnXRwxTE51et2URjpoZqvTrUjN2YSfNAG5SZjaFfWquBLnMVKLvffdWDApOmo0tQqix/YSBDBuzitP0ZQeTfQdTr27x2rDFnw79SBqRmMKq2g5j0LCcwlZmlA0KQCZ8mQwdpDAk5nailgY5tgPEwbbQbeOBEmjnIWIEuiiJ66se4NSDjwSZbzNzCrTyROLJklxugHpprXG3NURRa7QpupxDe09w3F9rHYs65fzxqLtS1GtZbX66pSrTg/2+hWkJRxxobnJ2cXjPdnGC9fhc4qOoMEWyI7VWQZTpPlPZS3oERSLm+qvxasOzGVAH5nLhXo+cc/HEdTJEAvH3/jXq8rRJvZRWQHaiAAuHA6MhL3S0VtzL2X9BfE+yGu0VTxl3yRh19qyuNa542aZ5B1cJ6jJXyGXskIDBqghJd9vATecXHB05rLAPRZhcwfVekCaUzFOqkK/OwlWVpL2N/dgeE/UcAtLnh+fpX49wMnJrAm93EwjRFDAtV56vKrqNW+wVoEZIebPIWFawgPgQ4Lu6D1cO1OMdjgiypBu8h5XLQC0HDk9JxikE/6tu3JofVWRxhO+5nUNe2f0FpND7wEAQAI08rvHO8keLmhVjA/fd9OB/
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?R+UgvpibPRQlHdQcCEMaNryhP1+MZbXf+B3TDh9Th/n9NzZixLvOtJeVQs0h?=
 =?us-ascii?Q?izQRGDCsRMe2bPWOpQS+6L8nh24ue84mV9v69prGzCJyX4Zxai8aTHEQJnPJ?=
 =?us-ascii?Q?0eXyOh08Dxjb9UQNb2xfRuyjdUGwtb6OgDp/mhWMwP1r8fPLhxnavb9KcrUc?=
 =?us-ascii?Q?eiZ4y5BS/BVCm8HUMk1cgVw5x/jUgMukJBnJdaDjJvNDlgMF23ONG1YWhfhr?=
 =?us-ascii?Q?+MtujCw5Xt9FCHiHBR6qCniNs+R7syk66dMtCgQr6x6WjiRGb5/AZ1nECVYG?=
 =?us-ascii?Q?dzDCKKqiuE9IP6dOIVFwdu47E6LNnkmjMNs9FmHGkGPWfiGpq/lNGUqznmcN?=
 =?us-ascii?Q?lkOefYV/hYeH2bR+bn1Zs9PX6NcmOB8Xqt9E7uxyWXTvldCjY49mpY1svQD7?=
 =?us-ascii?Q?4dhDpWXIWgCjJqvgAKpqzwFy4tpUcSudsfABJVNs0LxW5z2ZpR9YFUhKLYwp?=
 =?us-ascii?Q?P/6y7E/xtb56VON7y6O/yT6qlu1WEn87GDaCraHOquAoGc8nKrAMqB3nKznh?=
 =?us-ascii?Q?mkttzLuOu2AblrFZCs+yWrKH9cy59Dw0c6RYe3mvwqdK/uFYLBw3kChX6Xr3?=
 =?us-ascii?Q?vi/n+I4H0721HoX9d1P4dTpDXMijMVaQvFh3Uvd2rAW4XycW2xSK+ZTuUWat?=
 =?us-ascii?Q?0RjrPRvxR3oPWFnOBFhNlhGiCQacNzXrmghCxefC9Vw2rzCkc/Ip10F8S/gV?=
 =?us-ascii?Q?yj48hhmFuXUya8KNvmo4rfFd25jPo03v+Lk2VgzryFjxe2dicSs+dHrxxfYg?=
 =?us-ascii?Q?GHyfIZsEj558DWsmls3zpJ647V9bAD0y0AOnK05pAF/sN+t4G9xqZoYq5jCb?=
 =?us-ascii?Q?LE4joy7gRY+YxWHx4FPdMEkdGb0cKhTEvV67ceUs+kyqcyYAZRkdVFWqS5WX?=
 =?us-ascii?Q?FmBYbxYvR5HE1aulWP6X+3ZMs5H23fLyAK2VlSKb9PT3VhcdstC516vxjHkz?=
 =?us-ascii?Q?+VbJgYfQsQY3uh1REfQ5FQIcSGj+Wp2QQEC7noBReYDGN0budXAd5tfPRTBf?=
 =?us-ascii?Q?7YPKyKVBboC0TJhaDkz7qF+CAdGWEJPQGkmwGXayV0AR6DP+EKO9s/+l0xv2?=
 =?us-ascii?Q?nYtthEyLhvmAfohQqgBwQRpVdONtoAucKQpLeRtrzl+GEt9nJnslvs6qM6pm?=
 =?us-ascii?Q?2lVkHpVBhoOJ3l9V558F6EE/qia2UdaL/XSiY530Sqhlp3WLLTnk1LV60pic?=
 =?us-ascii?Q?p3I3JbgY/053XaNhNI/z7++/nJXii/nosh3gnWoKEPAJ2Cq8Bhc7LqjFF8MS?=
 =?us-ascii?Q?M+lq4RsfaWmVi4YjQ8uxtIJLcbfU+m26SerRIhR17CtvCpwmPIDJxVzhPwDK?=
 =?us-ascii?Q?uivQQlzgumrxaOyGSkpnkgmisPfCZ7AS1yd8bxwTllLOkOEBGqbVCyyqWgFc?=
 =?us-ascii?Q?RQOYoTya/sUL38eO+u6l9N9yFETNfhAYtm6T8CiihSw2I4c4ys0J6FQ7d6SK?=
 =?us-ascii?Q?l1Kip+XUw4C2aEAxEDF+WUgK8f1Bs0XnTnESOsJVxuMM1AAJOr3lTAcB2ApU?=
 =?us-ascii?Q?prweqBZMqxDiomQFERHhzUDaKV+PZIHKh1cnl1cs8A3k+CwZqFa8njTaxUSZ?=
 =?us-ascii?Q?pmfsSv6l/pTMEFOXp22BZtNTowUPWLml9GUDoocyRtbxZoG1xSTjxH9G/Ghq?=
 =?us-ascii?Q?6z/U347bTbOzKK7nTb2krwRjG3EIM1xpvJ9m0eAK/ILAs4/5enzh/pMwSoG5?=
 =?us-ascii?Q?ZIW878L/TQSoxE3Tt9Ad41oyy9WXZuvZRW7JaaB+UjCqMNbU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32902e51-091a-4b5b-e482-08dec04fc6f0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:36:40.8594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6W5Nha0DNlF48xfBDuodBnvW0OxtDy0lY22TdUGcnp/bMoPvz5HLPonEuK6tGx6dKCsCXfrgU3WlYeBQrSxF9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10390
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,oss.nxp.com,xs4all.nl,ideasonboard.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63339-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: F1801627595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 04:50:58PM +0100, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bod@kernel.org>

Subjest:
	Add Bryan O'Donoghue to imx-pxp as reviewer
>
> As discussed @ the media-summit in Nice this year I'd like to volunteer to

As discussed at the 2026 media-summit in Nice. I'd ....

> do some review on this driver.

> , mostly as a learning exercise and because
> more eyeballs equals hopefully less bugs. Mostly for the learning though.

Needn't this part.

>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efbf808063e50..ec0743b41a463 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16027,6 +16027,7 @@ F:	include/uapi/linux/media.h
>
>  MEDIA DRIVER FOR FREESCALE IMX PXP
>  M:	Philipp Zabel <p.zabel@pengutronix.de>
> +R:	Bryan O'Donoghue <bod@kernel.org>
>  L:	linux-media@vger.kernel.org

You touch this part, please add also

L:	imx@lists.linux.dev

Frank
>  S:	Maintained
>  T:	git git://linuxtv.org/media.git
> --
> 2.54.0
>

