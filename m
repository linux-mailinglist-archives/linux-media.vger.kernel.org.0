Return-Path: <linux-media+bounces-63683-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PXhLMiOhIGr65wAAu9opvQ
	(envelope-from <linux-media+bounces-63683-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:48:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2B63B751
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:48:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=PX7i1TBw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63683-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63683-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CCAE30258BC
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2535B4B8DEC;
	Wed,  3 Jun 2026 21:48:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29B1495528;
	Wed,  3 Jun 2026 21:48:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523292; cv=fail; b=KTC8OykrYHtPEJd9z+Q7Sf2qbkFkKUmSdrC8X58fzpImQXJTmrOGat+viaxza7eSZdGy64eCK0IM9SSYSpd9p/POySMIjc5OthBv5ORGL+2QzzdKr4qUFe0TwA/rGPGOIbdCLXLRAjn2swwhR2DGHFsvY1OjEO8LW3smPa8hsHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523292; c=relaxed/simple;
	bh=wXNc+2xG8ATJ6rJR1ptkA8sh0cVmcJ3yeHDlxhTVQ3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ktAheCQGc43YETmiIscRxunTWz5XsD3/wYrLosC1eil4nls72iQvkpYaQt/4iwcg2SgZtpfoHTBhpcNeZeoH/FpgA4MV55vs1lT9rxvzPoJghHqSKs8NXKfWrdy4Tmcu5Vy+ByNp9gd3arQmylyM6N89ujxQpOXZR4f7zHp84N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PX7i1TBw; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6DPVC7RpotRiAHDJD1uXpniaR+PKVTQx6hHsB5+aNvrY0D9wPBMG2xP8eRdTFekdL30nZ6oQTA+AGdmFxPeKGa97/ELsU4z5OGHXagrUraAj3+iASME76JjRHqhzlywmpOTLjbk7rzWjn3oEA0YV+S1Sny6YE5vJ0yu6t9KV9xR+gLVdU5jrrHBulmnfZ3EIZ5WC26Ig6fe9Sqv5XKCMR+MrKtFydtQSNif1rg3k1nb0wd1JfquM98TciwD7nLmZcyPoqJ2WO+Af/WcRDQ9lXwFWD+jtvLZt0MlZbn0ojs2vfA95bQkZmOMK0ZWlRtuO8w0suSNKhQU77s7N+YZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaSAZQjzYea7mUyFdjzERWMkNgeMlC57dbx6jfn0oyI=;
 b=sdit4hRX7sT2ertS9ogzAJvxI/k4vgYknacNHAzWcCIn6jvD2s1zLQA/0yv2DNE4V4akTi3Fih9Fho75KoyKKiYcck3nq/Wvxww2i633Xq3dVq3K4cWA4mIf3UHWhCS0oIiPKeI1+HF4iDR9ukFH51CiKQmWQQfF68ReoHAgzGJ5SjH/seHRB7VjtMnob6S0LEBGNvY0VTUGDiffE3G7VevId/cHcaOtO+A8TNkUlQ+7/lmHZrwLWbnkEJIt6tNVnYknV8S8m9zsiqyzPGUTNzGXJbcboxq+XDawrKbKDlbLvdRwsEm4XPr3vuKFC6VM9UdCefITZ8WhOrZzLzpXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaSAZQjzYea7mUyFdjzERWMkNgeMlC57dbx6jfn0oyI=;
 b=PX7i1TBw2hA9wr4R33ZQ1E4Nr0VbtMEftfZjnNfWgy/fBetBRxlH3VSu2ykFujs8Xxxq1qn/JtQWG32hky9T647XJlenp0DwysmPl/POGRFm6WUJY1hIvKmcZSVavcxKBntr51YMQESebL6FgqOj+Zjgl97H55y5KxSzxA4CR4PaiR8foDMY6RrR+2r+yjnV1mS1r94z6yioO/ZdJRCCtHsnsZEiamL94VctF8MyS90QYwM9PD+61W+IpC8fR7czp0zygBeMhj0tXM7wyxwMR4lpw+Jf2S/ntLfyLH6wN7aIo7dSRbmNvM0nkJuaPPvwJpWYCHeVJymruYiq1YM/AQ==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6778.eurprd04.prod.outlook.com (2603:10a6:10:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 21:48:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 21:48:07 +0000
Date: Wed, 3 Jun 2026 17:47:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 3/8] media: qcom: camss: Prepare CSID for C-PHY support
Message-ID: <aiChDyKleAYuzjMg@lizhi-Precision-Tower-5810>
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-3-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-qcom-cphy-v6-3-e50de0b557a8@ixit.cz>
X-ClientProxiedBy: PH8P220CA0051.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: d2512bd3-d9f0-4f25-5546-08dec1b9cc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|22082099003|18002099003|38350700014|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	QFh3BokmOM/slRmkurZNgYeS6IBTAxJz4nWQcqFOrSaa3JATuWDGeIOdtetr6Eq0+6A/+jdGHh0NZIjrdOGpjuC61HrzviauuXe0gh3Z/huo9SIrLVSxKUMCctOCtoU4ropMjY4Nc9TKecQ/5zYX1zn1A4JzHURoCvGLGonYCMKy4c+cSKRm408uj2afSwDRdK/5069DsKVwUZWUWdjWcbe5lDmCtqiSktfJSsAxwXE1vo68p5SQAaPto8lge0wUwHH5sbFRrBMw3vzNagiwD2CEIr09nD6cQWzXBb7f2M9CMjQUxMmf/5lwcMxg8o4iT7uUMmTlJLpD5uznmu9maounw/+EI9Mgj644ciGrvBrXUzjrofNlkS/D4jfVK6dvhOkaZ62zar7IAlotcz3HN9Sgy5ErYaUM17FqCAGCpLC5NwmANU2lGZ5At/gPOz/mRwp9QW3KAHZU2/mUQltCnZA8Sb2gYLuv4C7UtZnWCoHHplaeG96hjO7jFttpFPpi3mZhmpWGgm0T1nJdprhonteydShSUgP7i8ztT+0UzTLgFOxA6gjvCucHROCOaMHbLRurAzMUDV04+cgmPyxXFp1n9nUKKtF13d6xaSffvLdt+vl+6aR9txWVBwq8IpDeN3AyrAlwq1YJn2O5K1FH1Mht3vjDv45r8ciCOcyp6EkP1rujO1zTT2KESGxp7rz5zV8fe+cuV+9chj2SAFF4htPXFWSXhCkl8j+DN5TJvof+ApgeywGgT1T42KGLyH8t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(22082099003)(18002099003)(38350700014)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pKPEj3ibpKOxeFf1Y+Eyhlb16y4Y3wI9T6mB587AXu8wPqR4U38iYRJk7lVA?=
 =?us-ascii?Q?jPq6z/BTNWSs9KrjbSeLNj8HnNiKrGeZPl6mtdQw+A7Isnj/KH0yFhW9mmXj?=
 =?us-ascii?Q?+hyTQNEjGP1G7hKheYQOrXO/aZMmyxxIp4Nlen/ZYn6cWuPBM9oZaJZ2SE1Q?=
 =?us-ascii?Q?fgYVAIlSCeR2CWIjOU2CLHl6cj9KNOzJ276eq4tf+uqILmtWSflrhtFd+rR4?=
 =?us-ascii?Q?ccmnGfyabqUVnA5uAhR4adXMykIBuRXTXarhHYnb63PpQqHWTvC2PinM58lo?=
 =?us-ascii?Q?hhldkONnAAkjTGXVOW1gWYRD/aWVkvlhP44OC1+7TDKY5qqUmPJvY7VSTkq1?=
 =?us-ascii?Q?GXuYIL/JfkEuIpV2a0SDJqpkfXNzgaoNvde5rjFviZwtMHqhzhAgtNM25vyh?=
 =?us-ascii?Q?xAkv542OD3FtEHxBWhAmK4eycf3+scomcwlkMGCZWmbCx+lkJPzPjuQnrtIR?=
 =?us-ascii?Q?pDN/f8NRJPXfU5Il5FKaCfhnBJgF3s367izlG+9C0cG9+DHeC0OtDBK+N5Qz?=
 =?us-ascii?Q?hm6IYf1ug56zM2zhs1+jSxIIgTsF26bdCH+9jdtgdOpgYzifjlLmQCzVU9Af?=
 =?us-ascii?Q?yhlKf7yqLVAPc5Xg2qA1K1fZdp19SEXEROkFzC7TxN58EfWljhwch5QCC+5Y?=
 =?us-ascii?Q?tIzU5Y06eEqbeTLQxwrreV35EmsmfTL56nwfJjtD9MxGwYcXxTsI48hwdnuA?=
 =?us-ascii?Q?zpE/tV5j/l5+I4i2asxCjTRkurwgAeP0dDqUNIJ5LI3J/irfgoPugbqxtS5k?=
 =?us-ascii?Q?shwdKDZjZL2y4Rv9Fi7nKgAq3JBlTtuiQXVWgrQj+9l6p4XtFmjaOsIz1vVv?=
 =?us-ascii?Q?IuMLuDYRgu+HzC+Qg5BSm8zx2zR7luyMKH7aTjxil9ejPWeitWA/EMmvaJGZ?=
 =?us-ascii?Q?wmhe4zU44T652FKsTPDz+7YZm+Vq64Ir+xiyH4FGYsw60Ud5hwBxZ8+CFurz?=
 =?us-ascii?Q?V3LIx8fPW+fXi8NZCWEyPw1wDLy5Nekt2zSmdbA6czTWzs7LWgTkoRQTSOPM?=
 =?us-ascii?Q?c5viUaRuVUgGwUeNspRnQkSmLf2CoOYZCGYgcHlP58Qyv8HHqFpXs5cTq+Mf?=
 =?us-ascii?Q?R+YY7aRq6TfJccb+5me4yZAoy6ZOdm0yDKATAdzXDhriU9WHzF7UiqB2Ao3o?=
 =?us-ascii?Q?Sdqsa6GLpQmXPdbKs4u9OCrfr3EQkZLeHOO1BqdL4g51zf4o0DgFxiUHt2hS?=
 =?us-ascii?Q?/SNFgGbFEkNpapuSQk0T/N3cG8QwkWFX9mglBc7H/+KCZj2viRRWZ0n22HZB?=
 =?us-ascii?Q?tZUaQSOqd49NDEpheY0QSfQ0VJlmQk4TOXMbpcHOoWd37+IX/Lt1On7vLjAu?=
 =?us-ascii?Q?D6oK0LTgwKZzLfZMNFBuQajX5yE4TMSXE7LWUarCHv0cdBtW0X7YLDHR8jMy?=
 =?us-ascii?Q?bzCqsp3nh1z7HpCcVdRUJp9Pe/SCOOr/bofxPAu1HmiU4EEQIecXb9GCmy80?=
 =?us-ascii?Q?aWFVWSdIxG10EnvkqaROfPlSloaR3GZYS/Rfq8dCmF4DHioWJiX9RNn9FRCE?=
 =?us-ascii?Q?X+QNbQLmMv01bLPrwLkpG3jpuVYh51s88mksEu6c+IXENKIWcG8wursJxVsB?=
 =?us-ascii?Q?sa/orzY26E9BfumDIcBr/su62Yc4BFReXa9BvUGO9/huLqy6XYJAMwd/6DW+?=
 =?us-ascii?Q?qzupH0HHFp1foVBQr5UTo5inMXzXA9jw3bMd/UhHDzzdzGodg7kogxHjLZaW?=
 =?us-ascii?Q?FQFivunGYM7m9BHlYbjclXQixXCZrlb+JKymzWRh8g0To8pM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2512bd3-d9f0-4f25-5546-08dec1b9cc0e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 21:48:07.0873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsOwD6oegIv9ljgzu7MQVTKXLxxS70rBOWh7PIi+mQuMl+PMbJulR3EyDKlKXR2fsoNgThCFBUqDOIy+Mgqs8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6778
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63683-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,linux.intel.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:from_mime,nxp.com:dkim,ixit.cz:email,linaro.org:email,lizhi-Precision-Tower-5810:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42A2B63B751

On Wed, Jun 03, 2026 at 01:30:41AM +0200, David Heidelberg wrote:
> Inherit C-PHY information from CSIPHY, so we can configure CSID
> properly.
>
> CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
>  drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
>  drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f7e3aaa..52ef730b10553 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -178,16 +178,17 @@ static void __csid_configure_rx(struct csid_device *csid,
>  	int val;
>
>  	if (!lane_cnt)
>  		lane_cnt = 4;
>
>  	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>  	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>  	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;

shift a bool type is not good habbit. some compiler may treat as undefine
beheavor.

Frank

>  	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
>
>  	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>  	if (vc > 3)
>  		val |= 1 << CSI2_RX_CFG1_VC_MODE;
>  	val |= 1 << CSI2_RX_CFG1_MISR_EN;
>  	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
>  }
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 48459b46a981b..8d5c872f84ed5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1286,16 +1286,17 @@ static int csid_link_setup(struct media_entity *entity,
>  			/* do no allow a link from CSIPHY to CSID */
>  			if (!csiphy->cfg.csi2)
>  				return -EPERM;
>
>  			csid->phy.csiphy_id = csiphy->id;
>
>  			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>  			csid->phy.lane_cnt = lane_cfg->num_data;
> +			csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
>  			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
>  			csid->tpg_linked = false;
>  		}
>  	}
>  	/* Decide which virtual channels to enable based on which source pads are enabled */
>  	if (local->flags & MEDIA_PAD_FL_SOURCE) {
>  		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
>  		struct csid_device *csid = v4l2_get_subdevdata(sd);
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac8..00e2669db64c9 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -65,16 +65,17 @@ struct csid_testgen_config {
>  };
>
>  struct csid_phy_config {
>  	u8 csiphy_id;
>  	u8 lane_cnt;
>  	u32 lane_assign;
>  	u32 en_vc;
>  	u8 need_vc_update;
> +	bool cphy;
>  };
>
>  struct csid_device;
>
>  struct csid_hw_ops {
>  	/*
>  	 * configure_stream - Configures and starts CSID input stream
>  	 * @csid: CSID device
>
> --
> 2.53.0
>

