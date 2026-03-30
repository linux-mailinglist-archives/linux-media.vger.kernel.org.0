Return-Path: <linux-media+bounces-57641-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNRaMAKPymn09gUAu9opvQ
	(envelope-from <linux-media+bounces-57641-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:56:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB0435D42B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1631131589A6
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A46D33030F;
	Mon, 30 Mar 2026 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I20j79HH"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A4320A34;
	Mon, 30 Mar 2026 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882016; cv=fail; b=qOZV4nzvsdEBA/eS7Qf0y+uAINQ7y0AZkE1IG7KfxF86+re/k/JYwq6VI5Q9PMEnpkNGW7D+AUttsRI0H1fV5p60Ac1E7MgXGk8XHmHSl4RJ7GdL12gxMs4+U8UtvjdXhsWmkGDupctIPWHXvTBuQY7EoOXGu1ejAQfNVHn+JwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882016; c=relaxed/simple;
	bh=8TJoGhFOxqVbzJyaVg4J1YrgfOgkNbV6F2neg39nFJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EUVALaE1+lnRR5r61jLZkvvV073hy/BRBbQdyhs1I3fGRZ0ySjJXQnELRvvsAXLSuFX0edvJWtyclitYj6q9oG8n8bV/TXkcn9jbjwG71zIaZh0o4Kg2ZdLDZfn9dIW3XGqPEqouVaBTlOHzszm7LkzHh3m6ZQN3sEWNokveXdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I20j79HH; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7D2Ths+ayeV8d3/OXKAYkbefbP5ZtwJAuTTRwgZWjn8GCMQG0yN4ErkUo7nrkgNb6xXsyUkBvOtpdcOtPHfPJWgU3SbV/KiqAT1ZkQf4AHLcm1X2odPr0I8Njb4Olx4Fv1uvDBDes2Os81Fm9Tw3DTeHX75D9epajZSK3ix1NUyRN88JixiBQNoLHU1n8ikZ4Zkq8gKwfxqOQm0A1fHQVQvMX+cduKBNcQI//gg3zYLPc/XYyoRioztMAWYzvy9a9ReSRaGEsKZrs0IZV2MGAjRu2i8j8i7U63HozKCgbzlB9paNV4jyTlwI4rl7SFEj1J0S5puf0dttuWPsjhnmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIHkGQ7ITN+jsskUNKQDbR5xcBYylEpy8Ig4gLBAZhw=;
 b=pqvcKawMyO7qbECZC6RccjEbefyce2xTScPETjWCH+Xg8hBMYRHoOLzkOBrV5UGZy5Zk0XBrzE2LtyrPScBU8TMUHP2DV8PYHeF4aLmOmGbZISJz1l4ZrD8V5K/vRUVxThWzdGZp6i8QN0oVek5Z55jmgQGsHhNlYUF+tNmbUr8gsggYkvjkz3kh1FnXMxTGeD+9YPdodv0f+Udm87bkHj/MP+IC9veJPGMcoORiABwJXyE52hblhYB+HVIVw2mRK10PDp42vRAYL48gxdqT0/OZDsg8RqKA4Y6zZSmXKVMN4gik/QhQlYhpG8n0jpwqzKqzf0IP3xcsR366NmSElA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIHkGQ7ITN+jsskUNKQDbR5xcBYylEpy8Ig4gLBAZhw=;
 b=I20j79HHqQPmNBS78DfvyyjCHNGEksPJUZLGFr9i3u5P/epgnmqFUrlPKzARdabWOPWCJ8gh9C/BmHtHFr1TgZjC/7b3DtqG23YiA46VcLy00jan+2DaQsze0QlzTXodAdhEz3aaNuuJmmGEY0djXxoswZeZXPkX7OoOtQ+meQ6QHa1GNqXfTzfgOz81HGU8JUmiXImZFjLw7OvTrRl8QdS+O1kuyWeLcE/Yi8WoP/3QJtQ0PTSATQa0SvR7ksonrluEb2vqEIrrQ8XB2nW1C6wmrYz+FhIetMM5MSYxifNhs05SwR6QzCPW20CZvEZMgKILEjIJQeNLxG2WkVNnxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB9928.eurprd04.prod.outlook.com (2603:10a6:150:117::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 14:46:52 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 14:46:51 +0000
Date: Mon, 30 Mar 2026 10:46:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: David Carlier <devnexen@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, jacopo@jmondi.org,
	aisheng.dong@nxp.com, guoniu.zhou@nxp.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: fix memory leaks in probe error
 paths and remove
Message-ID: <acqM06YySijL1VpU@lizhi-Precision-Tower-5810>
References: <20260327222711.268132-1-devnexen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327222711.268132-1-devnexen@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB9928:EE_
X-MS-Office365-Filtering-Correlation-Id: 8698152e-4603-4bbe-f561-08de8e6b2df1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 Tnu8fQFHKgg2UH/RKwOGvUDAk5832t184ACX5TJpVK8NkV67FB/3+9t2+DQXJ51CpR/SdzsJYifynk7sdEJKY8IJmoCg+9dtU46yGci+a11v1AnKaSL+tNkeqnBpvOO1hs6yhtOuE70+wPY4TGe+P48F1CwKM7jnRYZoiPcF1b7P/lOWiGs1Y64f43BjltqucomjEUdaz/swUGmtDOXA3x367DkNzxUDJxFetQoWajQUHlmFGo7CVwWVVndPHqC3yoYZgrikbGbFQgMSXfTXMCmCIM3Qj5k+MpzYnuYYF37Peee0TrJUZSf9dTmRP1THxk3Gf5I+8L3DIWi0ORuZ1YlxXsTSQF/CIN+67E2zqWHaL7Yf/h5HiMoqddtGnKSs+0T+GBw5/PkRTekuNbUc4MaRGZB9Qo3jP5kkYLgWhUjcLX91jU0+s0/TJhBFUtoiIUMkuoFQPWslLjCtMIF/KL/b/OqumvlUf2IHcNjKpJXBTu6+MB9Rt/E022v6RS6uvvA5KpopHjNqp3vEmy0uLWqXVw/LvoJx49warFLjO8praFWxhXza4/XH5BEdDYFffNNLu2dIYOngOitN/SPkmirIXoizR4uCBYfWtzhPfsXZSrWU485gWq7qVuu3GOg1tyNrqFKf5SOkKPUUuZHwY80CGSmHlnzuetjPfkEbS7C4ptcPI7nZ+fkiSJLaaJvIb1kM7p3qnaLSo8EYxN6EsMLQD4yv9BT7rUl7VFOkeY1d9Ep4nJ7VSRaW0Py5toVn+Z/9EsroJ9gZhUe+XNGkSsl5/x5EsVBbpfdHwdoCIVM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?KzRLYU9NbFhCMmdDL1laendlVE9kSHUrdHFXUjFtMC9YT05aVUZFQmRveVg5?=
 =?utf-8?B?Nm5WV2FjVE1KQlM1WlJLM2w5OTA3VVZnOUtTcHIwM2k4RUtZR1pTd1VXbnVl?=
 =?utf-8?B?SmpxSlh5NkJEbUVoMGEwRFR6VVA4TFh6c3NyRjdJcGNoVTViS05oR1dLanNO?=
 =?utf-8?B?NXlGZmpyN0JGaU5xUmpNaVZkZ0ozbTdBN25kSFBZU0d3S1JRaGFUMmUzVEZU?=
 =?utf-8?B?Y1B3cnZRdjRlaXJLdWJmU212V2w2dktvWWdiQUFDSUlUYkFMMEFQb2RtZTR1?=
 =?utf-8?B?Y3lmNVNWMWFPZlk3K1RWWjFZZUZ4b3E4YmN4eXlkdHk3RGZ1K0hMQk9ZQzZ3?=
 =?utf-8?B?UnJWazROelpPUnd4SCtkZ3JnczVWVTk4WW96RkJXdVBKS1pzdUJJdzJDWHZI?=
 =?utf-8?B?T3JkNVYwT1p1QzhCeENJeTd2cEhPTkE4NFBmeWVaOGhGUVg2L2RhVFpXUnVq?=
 =?utf-8?B?MmJSNldXVXQ1SnMwTTgya2ZmYzhVK3pCd0pkZzJhTm54U3U2VlRrUEVFNnE1?=
 =?utf-8?B?ZnVYd0ZmazZBWlpXRXVNbUdNcUtyWDNobDFTalBvUHpGa1RSNDlaRTRMaVZY?=
 =?utf-8?B?bjQrSk1vSnNPZzI4M0U3a1VVNFFySHAvaW1aR25LVjB0ZldCOFh3bUNSdDhX?=
 =?utf-8?B?SkdTMlc3VGJWN2xTT3k4bkxnSnBiM1RzMEFZdEVsN3NSNDhYdVpBVDQ4SzZE?=
 =?utf-8?B?TVUwU3RlRFpHTFkrcFdZTVc3VXJaVjVja2xHamJsTGdOYk0xVkE3LzF1b0V2?=
 =?utf-8?B?UFZQdUFtK1hzNng5U3hQKytzY0d6aXc2alZaODRtRFBOVFdqclhZMWFhQXJu?=
 =?utf-8?B?TGNPRyt3OUlhWFhrZ1J6TExuTXVLTDBRZmd3S0wwVzZHMjhpQjZKaFpuQWJQ?=
 =?utf-8?B?T3lsUjUwdWhSdGEwazY5R2lCZi9wUWwvb1hLbkpoNVFvbU1ESzhlZ0F1T0Jm?=
 =?utf-8?B?Z0J5QlJXUkdxR3U4VjhVU1RJUDlIc3gzSmhZV2JPYURZeHNpVTd2aThiMHlr?=
 =?utf-8?B?U1IvbWduUnY2SnY0aGtVaWtWUllsWCtmdGFoOFNjRmR0dVphMElhSmJRbk5T?=
 =?utf-8?B?YTBGNm9JdjVMcFo2OTlDM3Y3V3pMa2hxYmdtQlVOT2c4WVVTY3JWVFN2ZXV5?=
 =?utf-8?B?UHloZkRUdVZTOTZGTitOZXNObDV0S0dVMHhxZXMwdm4zQ3FXNTd0bzFOT1FH?=
 =?utf-8?B?TitKWlpCVHkxN2hCVFE1K0dYelNwZ2dsMVZNSDRJOFpTL1FpWEdRT3k0K3JK?=
 =?utf-8?B?WUdLOHpQWUdObVhPYmE3QkNoYURhQjZZNXRrK0RXRWFvOGxjRG1JckJCbG9U?=
 =?utf-8?B?dGQwbGFIRGZJcHRLRjFrMDczYmduSVJxaUQzRjVCcm1XUkU1SXpXckxMcHdl?=
 =?utf-8?B?ZTlwT1VaaDhHTEI1aG1RQWt1ejN5VWJEc0JncGtmR1dqQVUwNGQ1c1lEeEFr?=
 =?utf-8?B?VENuNmFJM3VEMmFpc3ltOVV6NnBGeFB0UnlCd0pVRDdGUXhPaWFTTUJRN0pM?=
 =?utf-8?B?ZzE0UGRjckhPOEhzS0ZieVBma0gxRldoS2Rmc2Q2OTFOYkpmbHJjTlZTcjFW?=
 =?utf-8?B?RE1PRkNIejFiQjU1RVQ3M004cVlhMERqZ2ExemNnYUZ0WncwaHB5aFdJdC9X?=
 =?utf-8?B?Qlh2T1dCUzdpQXNnR2dkcU9LYWxhdWNva1RhMWhDdEQweHQyelM4NXg5UXht?=
 =?utf-8?B?Yk5KMHArRWYyUlJjVGNQZEVpZjVHUFVYRUJxUlpBVWo2VXU1R3F6Zm15SG1W?=
 =?utf-8?B?b0Y3RUJ6bjBnUG9GS09ScFpod1puZE9jQk1JSk9yalZEWFJVakxtRG1raDVp?=
 =?utf-8?B?KzErODNhc2NKZDJTUVJaOGp5Y1Eyd0RVZy9xM2FiZm95NitURFF1SmdwSHIy?=
 =?utf-8?B?emJmS0RZb21pN2FsYTJLZlpJaXczWEhuLzFBeE9sR1E4K213Zms1eXk4ekRq?=
 =?utf-8?B?cDhrc3pUdHhKaDduUDhCZHNvNHlERmYvNzVFRW5NU2UzQnJOVUdYRCtjTGpp?=
 =?utf-8?B?bUJyRWdPOVlMVDdCOGpVd2RNazRhYk1WZ1RVUXJ5RHVtdXRGc2tIbmhnWkZM?=
 =?utf-8?B?YytRcU9OVGhlQm9aS0tYZ21wZmJUaVVkMGVZYmdFZVdJV1dWZmwyb05ZZ2tu?=
 =?utf-8?B?cmJOQnZXQTQvSnppdjd2ZGZ4YTY5dWlwL2lZWnZBcWttS3AvZkUxSkJKY3hy?=
 =?utf-8?B?blBzanZZUFRVVDNCT3ZIQ1hPM3lDREp4VEptWStrQitmb2xnVUxYN00wbEZQ?=
 =?utf-8?B?NnN2WU1jdjZ0K0dTRFpmMTFWU3B4OTlwSEUrQWRwd3dPa2pMcHhIcldzYUk2?=
 =?utf-8?Q?kQMvlDR7fWPHeHEicg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8698152e-4603-4bbe-f561-08de8e6b2df1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:46:51.8593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HlluLgRDI3PQZU5hVvjAVMNjKBz1hvBUsStBJkOk9D62hRoviSPrJi/g1ceTacbXYiQTsbVibYYC/YRmCngRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9928
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57641-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,jmondi.org,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim]
X-Rspamd-Queue-Id: 2DB0435D42B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:27:11PM +0000, David Carlier wrote:
> mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
> frees it on any probe failure path or in mxc_isi_remove(), leaking the
> allocation on every failed probe and every normal unbind.
>
> Additionally, when mxc_isi_pipe_init() fails partway through the
> channel loop or when mxc_isi_v4l2_init() fails, the already initialized
> pipes are not cleaned up — their media entities and mutexes are leaked.
>
> Fix both by adding kfree(isi->pipes) to all probe error paths and to
> mxc_isi_remove(), and cleaning up already-initialized pipes in the
> err_xbar error path.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISP Channel driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---

I think provide a helper function, devm_kzalloc_objs(), or using old
devm_kzalloc is better fix method.

Frank

>  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 24 +++++++++++++++----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 4bf8570e1b9e..ab32c5b6ac9c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -490,33 +490,43 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>
>  	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
> -	if (isi->num_clks < 0)
> +	if (isi->num_clks < 0) {
> +		kfree(isi->pipes);
>  		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
> +	}
>
>

