Return-Path: <linux-media+bounces-55422-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNKVK3uJsWnkDAAAu9opvQ
	(envelope-from <linux-media+bounces-55422-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:25:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 580E0266726
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BAE83096D80
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 15:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A2431E835;
	Wed, 11 Mar 2026 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AlenE2bo"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B411F5834;
	Wed, 11 Mar 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242538; cv=fail; b=dicbKVln52I/JwH0B6q+C/EEucBXTNv/H+0HfcQAe557ES6AJA0T+skVJv0EUJDV0tz9rnxZzIPkf1AZ4EoA0XMRFNaVZ2ZdlBWbqjCTJeEIu6sJtoHZxjI2DzhCR6O08kuAYIYXY0fcsq7At6nJtAMk9fKpVU/b+ZN+TYbHn0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242538; c=relaxed/simple;
	bh=QQvparqchSzff2WYAc1ci61YqzvB16UdyZwsWs+sL+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eH+9nWJd4rjM89Y9LdZyArVaYe8+XZNQ6dO8EP2G5yV8CFU5jUgi8SdWHKPdz99XtBV1Uwv3QFIDbRzHPrY8m2wTazRpSuPWZ2I2+PZNmBaU90+GAkGJ71anRAmYXVz6DXCmtmJCXX3GELQxMVbDZJG7x9oxtF0ZR+QyK7es0Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AlenE2bo; arc=fail smtp.client-ip=52.101.66.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMoFocDhHVRixZv4wfG3W7dh0nWp8kNahZWtc1Is9CNCuh0fAcHEyV9c0C7YocRiYwp+1WAuAneD3SvY8gVP0TwlCV1f9KskSqonJM9Z60K4TnFi6rgKUAgvXLYj7SPSNmV32JQL+2qqnPNktxt2yC5ovTLDlBurk2EMDTMn7rPzxxvG1qDFMYTUlMHUKUvz+iwNm0y0rOvuM/0uXk5Gin5W/EKeIoIEd3NjwVgS2oUsBK68ZgZuGGYS5JUIR8Cls/fe9FT4u1XxxQfye1t69kAN+rkLEqRWou3A12Z1s0CcBvUWUGDcG3etYypdFUpI+W9F4e7pV/JJV8zEkicWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4xu4kbaSg5LdhEwdBYtCxc+1F3K4GBZgLvPXMjm9aA=;
 b=EhrjcRYF5E26kORHCEy3iokAn8EiuQYK4V9A/XYybGUQLC5jMWF+7HYq7LCoCio4FnGcxtNtHJFqKHL8ID3GmVFQDvB9fKbTktJNvES7T9DRzmhsBFksNJG3w5hV/EnxpvBZsVT5yjFroZ43cvJv+UXNqusz+g05dyOGkEGnXS0fQG5chETcsa6DC2BHofsQ4+txIMh+4ZL3dxBNAZ4/ffO3UFHP/6EaoGvAH1c1NECZXI6xUh2vPT5EaHUSRa8b3TlWNA8Wa5EwGjb5mblgdhnH8saGJ6BfHhXQKFeqt4g+cjeIT7eqSmgS3MNgjZHvN/lHD3fT5F2VIocFZcWhlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4xu4kbaSg5LdhEwdBYtCxc+1F3K4GBZgLvPXMjm9aA=;
 b=AlenE2bo1qaWaFJTGbw8IKw0wtyW6I2hM8ydb03fqWkbwy6peghgy2zsZ1zwAje8Co9SLpBhSnaINULaZi4t/CPuZG81kReoWAw45CZIFhOleh/VsryE7Pmq8J92Aa0jEggKOoqn4LJ30jGfIj5E6CL7pMSzos3/S0SuqZUHrrqE3Sn3hDAFl4i/CjEdvdS30SoqI5A1qvGPms/vyC6B14YDSufaweQvlknrkQiVmyQglmSPZVc3ATWmkMBtv7H0IW9b3xQ1jNwECf6M6Hr49hjFLOjWTWHxgoGjaV3HbUWI/ZVj6YMQVGg8ODcYjy9St6zuiLlim44ZcAZJZJI82w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB11003.eurprd04.prod.outlook.com (2603:10a6:800:279::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:22:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 15:22:11 +0000
Date: Wed, 11 Mar 2026 11:22:03 -0400
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
Subject: Re: [PATCH 1/2] media: nxp: imx8-isi: Reduce minimum queued buffers
 from 2 to 1
Message-ID: <abGImzSmXRUvPLm8@lizhi-Precision-Tower-5810>
References: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
 <20260311-isi_min_buffers-v1-1-c9299d6e8ae6@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-isi_min_buffers-v1-1-c9299d6e8ae6@nxp.com>
X-ClientProxiedBy: PH8P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB11003:EE_
X-MS-Office365-Filtering-Correlation-Id: bb309464-cfee-4ea2-e301-08de7f81f764
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 esCvbDH/cKTra2XZJw1wfVhW9UPCocUb1XpiwNUxCCAex+ayu6n1u37OuSIbd92DozqGfxpv0n7rtCncUWVSexTPs1Kcw+wFDCopYeH04WWjg7I9OEHaJKOHIPW6r8VuGdlt2VSVantg7WzQyXoz/XD+sdDx6/3ErxMW6GJ4m6VlN+Dq1Aw2vR3JpbzlqF78mWB1ImXfiB5xwcGb1BzAma0BFPWvNgWoyaTH3G/ebzsJeJdXe5btrMOggGXtFzzsyFkukPoIn40rtyxGmewXOh4YPWIgtC/QiLW2vCfQ980WE8WYnaHK1/P2lBX4Q1DRF/5vVgKmOF3tbYjrwWLtvZl6oWxSGZbMSs9JSPPaO5alx4zLlNuP5rBEcuLDnE66WSQeJX6xrPjVYLMJpoVbOZ2D162g1AtY55abYXpVXXAmfND+UOa4L+8AtMPIKcKJ3liI3H5Ud89tBOyWiCyq9h/Mz/c1hrd9uuXjyAUoyieTW4FigA2HkJKq5+AI8ApCkXsDo3V0WR0rOvMWfnbCr73EzFQEYmDKhBL1skmKc/+MCVQ/g01WQodmePczR8ihOBinUxdstEYgGytKJM+NpqX6ptN1Tckt5orKQ1Jt+4f7pCWIbxbtwAA7Oe4OpW1zeMO9jRYl5Wxjhh6x3y4YcoGraKPvXb7iuudwMquvt9yuWfRv+WBSX4zVp3IiFW788WDnOpV7YMIgwx2aD/aQ94/M8Spg8jBtW2HW7OKQvpb8zvaLsRwS5Gsqtjc3oVXNjH3LWvlfv9dHTEtYsGRwgTZK8tlwjd4PfM6iEOVaTaE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2y1o2VOIcGVs/OVdhExLqSBmAYDURKqtfbGNDyw4Ll8lNVJLgPJgheeHqEgz?=
 =?us-ascii?Q?6PbhBbhz2zfQB1m2qOCGf++vi5inIOeQTGBqGSHyncAXGE35c/EbrAEiSc+G?=
 =?us-ascii?Q?Kui8MTo78UTZoJEWk67Up/SE9HJzjgEOb11JI0utXw2PTAzjMJDPLCYH/rm4?=
 =?us-ascii?Q?VybSBbpTMsDRQ7Bqv59wVrYtzMdZEZJnaSb2hlMt2OyGRaLKv+4K74doe6gB?=
 =?us-ascii?Q?GGcusaavPbgq1lOGnJmwbbYunb/i3Mkwk2pByXoVQsgVW5Xz/yb590x1Apa2?=
 =?us-ascii?Q?Jo35n457gbeJzfE3opI9esc3DDO63kqY4yTpCWOh3eoNTyF8DeEsyGGSFPV5?=
 =?us-ascii?Q?T+A68R8fH/AhXs2ID199zsctvTwOnJi6I06rvpBqG9dN14OXaUIqlkrEJ3QI?=
 =?us-ascii?Q?chQKb+oEZ6xUfgLCQB/EAR5WKB1oTU+CpC4VMbhmZxDyNTxES7aB1VDwIIsG?=
 =?us-ascii?Q?Cw48C6u86/7Fzk/kyeoSWQpXl3H8VnQjYuVXZx4ssC6UzHQlsFQ/BR/R710S?=
 =?us-ascii?Q?QOWNHgWeooloLBY5/f8+J+RDJDozNmeHIeD5BLWsQr9wWg75T6d3+sl1EZcw?=
 =?us-ascii?Q?F8v3prhOvE81rFxHsdta+RTG10qLg6FjXxyjHN34t/mkwMuHSTIIW14Jp2qk?=
 =?us-ascii?Q?nFy5PYntchPj8pn4m5mOX5nxWdfcG6JMfZ9YvSIej5PDZ/PfvhSpopceaNCz?=
 =?us-ascii?Q?KedL+hR8njqEGeKsjah9mLXQ6Z/MXt2F2QMRKOjD3D0HtqpiaIOsN9J4xpdb?=
 =?us-ascii?Q?EuZLKa4bPNh0trPDTXplguJLLL/nO+prDkJwW2Z4HAqZTiZ06oOHRYIGFDV3?=
 =?us-ascii?Q?6tEHDfXK31Bwd5Z1D29Q76efelz6L3S2F1ZOU/OdqdWbq5PUKCtTYAc4mdeS?=
 =?us-ascii?Q?Qy83nopXNy7pWXO0R5gerkZxPkbVQXFFXmzTObtsirbL9UCioNlOt3xpLPIj?=
 =?us-ascii?Q?3OLHPBBATp6lGQgLy90JuTZtD6I1hZvECXh8pnQOw5Ctqy7G2IOg6JjNYyb+?=
 =?us-ascii?Q?zgfTT3h2CtRa3WCliHwrepXr/hXjSgi+IxaqQA21amu0Oo6EZ2R1TK7YeLQ2?=
 =?us-ascii?Q?6u4IAeA24WKoonCdvkvs8ZHeu1+VKvK1hORzjzjj6DtQ1Yyyd4jTVoRbl00C?=
 =?us-ascii?Q?ZXgfYhoOWgmCwlf6oN5OWCx4gQ1xXCeJ2xfeisS/VAzVkNxrjCPsDaUWhfNv?=
 =?us-ascii?Q?Zq7aekMsIBmgltXrxkujZBKUv7mQZ+MRupH0ulkQA4Sctc3bgSbRECBtKkih?=
 =?us-ascii?Q?qsXfSBkOSRp+zrSbfzMwPYunP7XppGhhrEk90dAJ/chDSZS7U2TpUOD45TWZ?=
 =?us-ascii?Q?Sps227A0jeRMZON8zr3AiItnMksjuy1gaePziSQMi5EvTEYCV4lwmiSpIo6/?=
 =?us-ascii?Q?v+q9mYGGsECehlLKJvS7tXvSBV45+37hx+lRHkUcfHYn0xiCd0EeaoKU+nKO?=
 =?us-ascii?Q?0hELro/xgcEDABtMp7uWnOwkWubub6fud/wNNrQtW5KogrNjM3zNd/ggZvI9?=
 =?us-ascii?Q?r+kf1nEsywPd45R5Ak3j8YJKgPFY7r6C6XtfE6qvwK+RnOA9IXvvxcswMqnI?=
 =?us-ascii?Q?cJAa3aRyl448rgYsanZq9ePxkLWbz0WE25CqRNgh1uk8EE9wsa3pHaxQRyuU?=
 =?us-ascii?Q?IbKdXjB0nkjOvrwctzq//oQxNPP+xtIG/3xv/BRXWYqV5xtIh63gFLRJTjqX?=
 =?us-ascii?Q?DGzgw5F3Kc/HifXS33Ql7v4T13ursqHrvN5NUUTnlqfKFHwJ9ApOV8y90J16?=
 =?us-ascii?Q?ezcmDOy8Jg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb309464-cfee-4ea2-e301-08de7f81f764
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:22:11.3551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGw3k5FxsQNY/z5rZZ9jqfkPUTdBiHKXVWjsThfkg1D99QZ3Ghszl/Aa66nPH43LC03ZytnslLMB0LSuYwBtVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11003
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55422-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 580E0266726
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 04:02:58PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Fix a hang issue when capturing a single frame with applications like cam
> in libcamera. It would hang waiting for the driver to complete the buffer,
> but streaming never starts because min_queued_buffers was set to 2.
>
> The ISI module uses a ping-pong buffer mechanism that requires two buffers
> to be programmed at all times. However, when fewer than 2 user buffers are
> available, the driver use internal discard buffers to fill the remaining
> slot(s). Reduce minimum queued buffers from 2 to 1 allows streaming to
> start with a single buffer providing more flexibility for applications.
>

Fix tags?

Frank

> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 13682bf6e9f8895bb9eb1f92d5f74b0d5968544e..2405baf21594cd18cf2b349234313c5e103b7802 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -1410,7 +1410,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->buf_struct_size = sizeof(struct mxc_isi_buffer);
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	q->min_queued_buffers = 2;
> +	q->min_queued_buffers = 1;
>  	q->lock = &video->lock;
>  	q->dev = pipe->isi->dev;
>
>
> --
> 2.34.1
>

