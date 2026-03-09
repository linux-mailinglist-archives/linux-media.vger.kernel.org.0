Return-Path: <linux-media+bounces-54957-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM2eJDvgrmmoJgIAu9opvQ
	(envelope-from <linux-media+bounces-54957-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 15:59:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADFD23B230
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 15:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0EFD3049458
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 14:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064F03D6666;
	Mon,  9 Mar 2026 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AY23acin"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013047.outbound.protection.outlook.com [40.107.162.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DD13D5258;
	Mon,  9 Mar 2026 14:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068116; cv=fail; b=aR2qzX72DmoVpmEwzpCSqFBPY2T69FggOi/z5JWFmxlxheZ3HsA4YZAHyxmWhTRqXAykTnXeRmWAnyn6H0Nwi7EYnmra80iuJvVwjX6bSENAmXclZtoEbNfYXE0hhImDVLRo7bXPUgbSn8SzUFU3Ji+bjkHxTM2AXFQa5nUrp4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068116; c=relaxed/simple;
	bh=uFUfqlHMOfpVlSvfRxxsHGfNWiDWGZn1aoaAzj/YLy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tee06LzSkZPjxakb4cY4K3tU1tWW/ac6JeaM6JG59D/dleSLtz4iPaMSWe/WbS6tR2icCIT8di9NS8u3ivm1r45/eDxWfRLRf+nsXn1caArvO1O3vcQHBONhzYfEHSPOR0DvJ2CSrZ9RACVnLdZlziYMWGMri7kW5eThtUIzZw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AY23acin; arc=fail smtp.client-ip=40.107.162.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/AQz2W9AQRZrp5VifJBz65cnKOwdiCi9Q9iF8l/livlqwxeXrpzgSY2I29MQDNMTsAF2Nk7/2EZ2daqpU9P88sCiczunx06AhuNYcb7Km+w8FV7kOO9cZYVjhFf4DYaLzfUNunSQ7HmqlmiEZraj6CHpEBxF53ylKROjUDuzjD03FBZlJjtdGefyLStv5EaDEgAqsHz/TcCZ1yTdPjGi5dkqzdE4vxyBGV8pC3htVAkW7tI97Yac8B7qk9CKN3688ETM+DziK4d7sibp6rKLbi5pckUPqeyNasYUbmVjOhhmXcOphHpovmiqULkHixWgms8lGV69FvTU3Z6dosLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFNvsFKYTFqpUKINxCvoUhOfqxE1WxHjc3N6ASgjgiQ=;
 b=JSMScarDEO3hNjH7CoT3CvAhmeUTQpu3qE5OOl0zSeW4D58Im9LAllmfoUK8n6hxYmDPK4BrHAJBaxp0h3mECAl8BxEJNtWYiXymkkJR/M33+SEFIfvNRXcxZTV/MfdneeWKfY6uFVgEmzkDODz9eN1W+UvSUWye+pZqJE/tR8SxGmBOkA1e8PFpq+Ks4WDUYK79BQ/7HQA7jo0RfGSJYKDO6b1v6SEC76XqxII7iXOJc0eGaCeXwaRY4tq25QXWbLSOvKtX3IJltWHCph7PV9k3Gh1z59i6E3zPTpjqNViYF3pqsV69mcwkbMbOEFOfx3OejNGUANawd6CXlKOlVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFNvsFKYTFqpUKINxCvoUhOfqxE1WxHjc3N6ASgjgiQ=;
 b=AY23acinIpwegG6eZbu8O4o5LWr2dIDjqXFt4iRr96Qi0mVDubAG0QQMBVg0eB31HQvGtamGhV0mxzmDEMKC2sMt63qPKedoO41hA/eYwig6RpvETxSwu/SlIWr0qjwysUdYXDMs3QVdPOllh1NynYPmaLdei1EHqbKFljxGLdDPiZHD1OgRSLHf5XebQ7YiFEOKaz6rM4j2xMXWck3cSPKPYNf6HOtvf7AcDVG5cVd3EY9FPh74hNlIW0NZhz3OokuIb5UkuzbnPutknOkc9e4T1C1uYoRVZoFWo234ueD+tlBRWfU0sw9HAuL4G8u5mnu+s4qL3OPWdT1gMs8PIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7977.eurprd04.prod.outlook.com (2603:10a6:10:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 14:55:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 14:55:10 +0000
Date: Mon, 9 Mar 2026 10:55:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: Add virtual channel support
Message-ID: <aa7fRjVOrIzUy98T@lizhi-Precision-Tower-5810>
References: <20260309-isi_vc-v1-1-fd0b8035d1cd@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-isi_vc-v1-1-fd0b8035d1cd@nxp.com>
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc32d2e-0bfe-4275-28af-08de7debdc6d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 98pokAejWB38z1vqCSOdonu/0PVimXbMS0CatZ0VXaI7M3CGQggM/e3Drejj4Vyn2yTKIqTOijHCM/j+fy10ypnD7vCip4JdLUild0EenaUffkcIFQwIwGjvn4yp0YE8hlRedSKuaqFo6C707vP6kVUx+yPKL3yzVilwtSGeKMZTLMEqqNRLTb9ehuC8BjSSb4vH1qlxMtZgvJMoaW18r9c/7jXkMx8dhIWsyaBTzvavIY/WoW2yI20TlRSgo28zZZUiybW/g8fQOYQFFu9/GAZx8Y4vh3Gn++rT/4bnNqbekqDvCVBpf1PJwZuSxqYFSsl7TKvLamy1sG54t0j7a2BHqlpr3EMQ6Mjn/HcxPkozknko0daUxX40EQLgVbAANAdv1ClO8wUFo49bR21AIfNMuka4VklLvzR3Hj7aqbD28S7cfyPcpxVixhccTLzWNXBlMqQA2bt5lRjYkzUwHR2ucLpnvg2uW43ofQnI8tutHA+J3EZTte8rolBV1I/+tV2U51/qWP0Kk/qo3uT4BjL0EY6xqWInwPfHG0XYDRFPqGqHTQq+DJLDbrU4UuruqpdKNWtag0o+L7j8ZOJx+6+JIsvMXtD2WFECVcGou4h2bZHjzAXdJ7OBVnT5bLQxR79g5xF0oln3JWj4zs23J0K61MjdsBbtE6B/qMFYlJje32Kf6AS2vVNTqTLqWflpmckOjXEUZp5p4goBoJp6Eca3a+5kSsXStUfYOT7rBIwgs/NotcE5e0rhCpfXuy0CrsXnznjw01O/rTjiaXihb1DeK/r4q+mntK0ti7cpWjU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FFw8ZJSOZUjP7zY8l7cwmE/FpX1UukCat9wq3nigfTpf28RfC4GCS+/H1aWA?=
 =?us-ascii?Q?bSr38Fyhtn+3Qzh7hEya/9bzLZ78nEqz4oFAk/2Igbgs5k2mdeTIZNtyRb9R?=
 =?us-ascii?Q?+dt3idmTTIxa8S/ICFxumvLKscjdqeOXtD1h8G4ijvZ+V20LDA69TBZjStwJ?=
 =?us-ascii?Q?WXk8dmYTFzk0wxJlM35ywK0UgRQY3LoqGlOFU9SwkG9QJoXKeciVhZINhWBU?=
 =?us-ascii?Q?Z3J2iVKlv4mcQMcSg89O7I+UcKsMhFVpoOq9F7l9n3DZwwz3qSJKwP0zOOY9?=
 =?us-ascii?Q?Otp9eicV3t4AEuOrGycMUDLjtmuQMMsf/E1zGnrPKzlsJW6LqpnN/QElwz5K?=
 =?us-ascii?Q?iUnjITWR2YK6y4LSrfUBMwqvfpikam+BcbJ2uTS3nzycNHLWvEkyexGBnGKX?=
 =?us-ascii?Q?fftD61rYQTDcm2FrB+CJldZ+aQYnIh4JApPOV3dhfJFZYQNmGAWD7fAocyTi?=
 =?us-ascii?Q?Lf6kI6KANbZnSgvhxjs7sF4qLkSQByVW9wOPOwKKX593+9U8nHNoOwos6Ti+?=
 =?us-ascii?Q?OKnM8pPqSKBi+mPRUN/oa5nuECHV3WgZyQ+Ww3h+IbEQ2OFyg0HyOIy85btL?=
 =?us-ascii?Q?ad1DQFtH2skPs9t65pjODiZMOTov9vwABtm4PfzJnEVJkyGXLMSB/2efaNbA?=
 =?us-ascii?Q?DzA7xoYblrp6nbQSQlP10RTZlgb7MApZEsmN7lyWqx3knt7T5e23+qAGtorJ?=
 =?us-ascii?Q?hPTzPAQdzbgIkxUUin7P2Gq1JVXPYB7kgbsKjTnSV0s7xk1kqzgkHdLZa7wt?=
 =?us-ascii?Q?AVT3GcDOPjYMKeiX0ZRldFqs64ExE0bK4Q0+70JfqDK/jc8FPgrh6i/NHgI1?=
 =?us-ascii?Q?UhDf8tXWE7kHObvj39cdC1+pKCsu4YWuSMUP0z9YSC3veE0pI+J8oL0MZJoE?=
 =?us-ascii?Q?jEGAxJPbGGMqnXtrPZe7Xjr//A4V+hJizIs+4BvvbVJQzM1DYwHr8fKNFPMd?=
 =?us-ascii?Q?u0HV+8FMpqRwJ9ESbrH/IsPWIgQ/MlAUxlh5kqAS2Q6UpqQMkSMU8Ag/ofJQ?=
 =?us-ascii?Q?r9v0dmTWF4U4j4Dbg3FXl4VLoD9VYDiPpinmn7P4gMs/ivoOtYbN1Q63uqwX?=
 =?us-ascii?Q?K7DqdzNv5OeXem/kcMYTsSDgyDHtdX4Zk69VSy4EFJdOcgIikTpaGGV5ha4g?=
 =?us-ascii?Q?N5FXIAvSZy8WQlLCQ3QsLMd61kBCuIODOVq0lsNu6VqvFju9B6ibXaVWgc7y?=
 =?us-ascii?Q?uSkOvDJlcWcOPmKWXNHYM5sIImXxinPv9n0KvqP03V5B3a1kL6q8W6lF3I9U?=
 =?us-ascii?Q?Hq97j2LRKbGXZvCmP7Q0JOkjv0njwEfgNOj/qjKuZvxJjfC+F0VYkkRk44k4?=
 =?us-ascii?Q?YjlG2sbqDkxKatAw1cZOPWoOyOyaToNA+ojQGkfNjBkLyFuWzLT21y/bBoba?=
 =?us-ascii?Q?2E2lpus778sS906q7PXIrBMjLo2jdaifTHKMyboJX67weKStzk+bflplkcuQ?=
 =?us-ascii?Q?QpV7Dq1XzepEoRipRP7xUfzS3zFm4omqBKrYeo+Q38tXCIGQ/2TkjkooP+61?=
 =?us-ascii?Q?oBIvfNARKUqVpvHhGQ5Kjy/zxkPqRxYbYKtj+aSjE3MF/B33xTxKaEHGfaIz?=
 =?us-ascii?Q?LKJD9DADtSg0cgzjVLEBmsjq2DKysEl30dFWjPjPKHhcFE4h+lVW2o37PNqX?=
 =?us-ascii?Q?J8ZDvO76+8gLXQSJ6xOGAsNjg9uGytyxBBh44iPbQdhlNdu3Pv+YvmCOFhD5?=
 =?us-ascii?Q?K43nF9rFJgPSQ8hoylGVzLsk1YHvILz9W5t3e1f2pNDvwv6P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc32d2e-0bfe-4275-28af-08de7debdc6d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:55:10.3814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tmEztMHj0mLILzsABhSIruFb733ZHevJj4YiXMk3B3zpbSlIaMrvYd2QERM9/4wNdky7gpO9N9Mdp8VK17yog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7977
X-Rspamd-Queue-Id: 0ADFD23B230
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	TAGGED_FROM(0.00)[bounces-54957-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 05:05:57PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Add virtual channel support for ISI.

Nit: you can talk about more, such as i.MX95 support 8 virtual channel,
which used for ...

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v1:
> - Depends on https://lore.kernel.org/linux-media/20251105-isi_imx95-v3-2-3987533cca1c@nxp.com/
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 ++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  4 +-
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 43 ++++++++++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  5 +--
>  4 files changed, 51 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3..11a5e395792f11752c44d73818c825f2f175aa1d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -256,6 +256,9 @@ struct mxc_isi_pipe {
>  	u8				acquired_res;
>  	u8				chained_res;
>  	bool				chained;
> +
> +	/* Virtual channel ID for the ISI channel */
> +	u8				vc;
>  };
>
>  struct mxc_isi_m2m {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 0187d4ab97e8e28fca9013f6864a094e08f2c570..4d830fc1f913a825a29232739813f7e6d38018b7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -338,7 +338,9 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  	} else {
>  		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
>  		val |= CHNL_CTRL_SRC_INPUT(input);
> -		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
> +		val |= CHNL_CTRL_MIPI_VC_ID(pipe->vc);
> +		/* Platform like i.MX95, ISI support 8 virtual channels */
> +		val |= CHNL_CTRL_VC_ID_1(pipe->vc >> 2);
>  	}
>
>  	mxc_isi_write(pipe, CHNL_CTRL, val);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0f2eeb779e9aa2461593b0d635f41..cc4348ea6006ee19243aae3abceb235d00beea4d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -232,6 +232,45 @@ static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
>  	return container_of(sd, struct mxc_isi_pipe, sd);
>  }
>
> +static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> +	struct device *dev = pipe->isi->dev;
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_mbus_frame_desc_entry *entry = NULL;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
> +			       xbar->num_sinks + pipe->id, &source_fd);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get source frame desc from pad %u\n",
> +			xbar->num_sinks + pipe->id);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < source_fd.num_entries; i++) {
> +		if (source_fd.entry[i].stream == 0) {
> +			entry = &source_fd.entry[i];
> +			break;
> +		}
> +	}
> +
> +	if (!entry) {
> +		dev_err(dev, "Failed to find stream from source frame desc\n");
> +		return -EPIPE;
> +	}
> +
> +	if (entry->bus.csi2.vc >= pipe->isi->pdata->num_channels) {
> +		dev_err(dev, "Virtual channel(%d) out of range\n",
> +			entry->bus.csi2.vc);
> +		return -EINVAL;
> +	}
> +
> +	pipe->vc = entry->bus.csi2.vc;
> +	return 0;
> +}
> +
>  int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>  {
>  	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> @@ -280,6 +319,10 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
>
>  	v4l2_subdev_unlock_state(state);
>
> +	ret = mxc_isi_get_vc(pipe);
> +	if (ret)
> +		return ret;
> +
>  	/* Configure the ISI channel. */
>  	mxc_isi_channel_config(pipe, input, &in_size, &scale, &crop,
>  			       sink_info->encoding, src_info->encoding);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 1b65eccdf0da4bbc3a77c91e06fccc35d6c7e022..b2bcebc254b223b1085fe5bc2cc252eb7e272e1b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -19,9 +19,8 @@
>  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
>  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
>  #define CHNL_CTRL_SW_RST					BIT(24)
> -#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)
> -#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
> -#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
> +#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
> +#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))
>  #define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
>  #define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
>  #define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)
>
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260309-isi_vc-285fd815140e
> prerequisite-patch-id: 6f139a1d54fa3e0632db9b8a736ae27037c5f45a
>
> Best regards,
> --
> Guoniu Zhou <guoniu.zhou@nxp.com>
>

