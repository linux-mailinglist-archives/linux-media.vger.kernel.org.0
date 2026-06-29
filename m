Return-Path: <linux-media+bounces-66025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /mlzE27lQmoHHQoAu9opvQ
	(envelope-from <linux-media+bounces-66025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 23:36:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDFE6DEE22
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 23:36:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=XB0miqpt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66025-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66025-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6366F3008087
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 21:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A593C9EE6;
	Mon, 29 Jun 2026 21:36:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A836D342C8B;
	Mon, 29 Jun 2026 21:36:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782768997; cv=fail; b=c2/kelbpBbNESzV+zmWD/YHBnL5Si+d6IVA5+polC6h+uwIdznyFuzu5Z+epCuqX30Gug5ZveiIqPQFKeOumOP3OpqLbqbE+M+nq9t1OFNXIPjO6dKX2bp5xW7BrRUg1oXF8uQWCBTRQP6uCxo0stt7uXRQWl1xfucW3oWSx5k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782768997; c=relaxed/simple;
	bh=fTlJ/b3oTxioRFQjbE6JSZGLApcq1cRM2yuNuy6CqSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j0Idlr4o7yrBA/TVzmipzejjsRUY/arK9ylzA+ZdKsUUzN1xQiYNG3Ifl+zazKRnToxFrzQa238Wi4xnx5jZq4BQxpNdL4XwloEWhez3TIMRDYxsCNilsbij1ejVOtNR+xKBRDiKD+xZchbCrCo0dJQumqW4KCbt3vVu15NDT+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XB0miqpt; arc=fail smtp.client-ip=52.101.72.62
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qk1hb9KjsC2mksckhNMwXUqLXyde2oQJ45csdsKQevWOzeSE2zuTSE4uUuzm8MJjNZvyXjRBama+0jz8UiOmdpVWAkHpl+Zw9WsWP18Tj1YTIB3MBPrPi//3qHxTvGFOyrH+JRp+xlhZJ7Ws9Ral5FSSG4IAI1yhyTzzhM8sDaokBQ+KKOLg8TsfugPVuJ7sjSi1yMhaahvx8MBS0i6f6qtvB9nrZivUAidtc/kNA2Hae8GEh7DtKqpoZMroXV2D0FzXskom//nctgxwDHk7rLrFyuvqIYYg3DHg3dblQdwO6StrMxi6i1BswGjmsajzVDhf4xceDWwY3ixllLgd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8uc+RE2b0Y6EzRKKsOy+0T6L7og/T2UJHSpISHIh8s=;
 b=Ml9qKUHKit4d+YSOgptb7VC8wv5CkXhCeVAe+kuRB/2ENDXlvmP+tBMR9qMYsAWT6ZqXuM7RrlWIoy3UtpJYnwoKAeFRXFgp19c3yZ3kvTE90ySV3WwkmFmtPHpQ20g27XieIEvTxYFddyZrJjZg85szrEecWnfKyko23ZPcLXOt5qvMLWJSPpfGxdUXRQBmoP2xgkt3Q3DctcPu3pmXIBU9DrVQr8TB/rJm0Jfx77GV81+SSP0wG50wdNbbvthpFRiYTMP6nkFKMJwZBdMvQKPsS4SNFe0eGBSznNAHiINDR8KOqfpTRVsMf0RIssbhJjd5QgyKUe3K+PqkxwIDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8uc+RE2b0Y6EzRKKsOy+0T6L7og/T2UJHSpISHIh8s=;
 b=XB0miqpt/CJYEhYMnCw3Th2UWfncDVixLkfNbZODsB0ullslPKRgRL3fWRV1tdwPMhbRDdxoqHXNGkhxe01YpLpuFqx/ch3s2jZOZnb47LGzCPpZAsme2d7IMbx4sBO0dP5ps3HwZvO+9PQmIswMBLCzyxaZjsOchqJwATFkt97Z3wp3xCzx7m2nkLDPZvr5mPzJZCJlXbVt5krOR4JMBsm5IcmPsNc4Owc/tfNYDHXJHmTVM03UoWG3JlaDjrV6qTvcfbruMSDG+mpkAsAzoEWbPdsR9FNx82mFoXqCyBn3Pka9GlBWweqGYeEExN9oC/uL9ltIeSAv/EZtU3cgJw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10298.eurprd04.prod.outlook.com (2603:10a6:800:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:36:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 21:36:28 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	michael.riesch@collabora.com,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bod@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: (subset) [PATCH 0/2] Add myself to two additional linux-media drivers as reviewer
Date: Mon, 29 Jun 2026 17:36:17 -0400
Message-ID: <178276892103.2514993.12178441849475402672.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10298:EE_
X-MS-Office365-Filtering-Correlation-Id: afebb71f-18cf-4d58-6179-08ded62679fa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|23010399003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 XW8lFEXptBf2oufssC6coTvBYT8vZHqs6s/zrr8nhV2eE1H5K4zo4uD1cAkWyT2mdulgoDOncjQTnIL0nS8bnlP9Ty5muj2G9AMQAHxpptHerPTwLpNzWqQ8mpClVA66SW6lJrsLRoiYorKPJ8nKDE63Yt5ej3rCUWlBBsD3+yoy6Pj5TADKsZ3JK1c0LVovNiB1D6WXfqjfcBg4uYjTYwLQC9PflhkXtFN0ljtIGkTi5hHvPYeHdTVBS3tRZjm614z83AHD3B8IDbQ248KUSaZ1wgRTq+rYlv6XmHzV1s8rvMzoRpK+m7leamYsZ48ZA9vs+uxUfGoX1u1vobpIbJeFg6I8ysYe909qIHMlMMok+ttmXBvpXlUdcL0Gaq3mOd4EkbEtgplgH/LZ69NvKnK0WFln2r6ozKe1u9hqWBZBCZQnWY5Bx2bLvTIVGm+/duKTLG1Nri8ia/CkHZOojL+dsGL6OMGd2mWqi7MM6/1u0xcvYKin00jUZY2Rx084SD45hk5hnMX3juKxllbq5GhdBdQ/6mNClQp+eYwK5OfeHvdDa6nOcXjpmrjyVzjzR2P/g6RiggjaUzEcRS6rR+ZusurjMcOr+wN0ggfj4XMzEFbTePQ3GN/GSf7ejcceIR0/lY3p+3gahDpymw9nToBdLOfjCXsdR0bh33XSsFk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?b1NpME50ZEQ3MERDT3Vac1Zyem1RZ3RDcWRSdDNBMitCbEVGc0xiL2dtNXNq?=
 =?utf-8?B?UnpuQjRsL1Vzc1lqWlM2RktmL3hoRWVyQlVLVVFzQ2Mva2Z3K09ZajIzTGhm?=
 =?utf-8?B?cEhJaUkxQzRyd2VhZ3gxazd4dnpxSGZvUjhkUnBoOWxpS0RMdTh4dUVYRGJv?=
 =?utf-8?B?RXZ4MTBkWi94WVE2V082ZjAwbWhEdlZJMUd5aFhPNVpZUEVYbW9JZWI4MGl6?=
 =?utf-8?B?TGwvZ29jeEY0cWZhRzdmY0hHaEN5Wi9IZ1laeWcxdE5DOWNvRmdianRDVkh1?=
 =?utf-8?B?MGlYdmNQanQrV0dYYXdkVWNYZnVWcGF0Q3E4VkozcmV2WXUzT3Iwa3dXdmsx?=
 =?utf-8?B?SitvKzJlZlE5N0ZRdjdCbFptdjFKeWd3RHRCVWROaGN0TW55ZXFVMU1vb1dm?=
 =?utf-8?B?eEF0b1NwYXlsUGlCVEZ0K2JaQk5sS0N3SXNiVnZxVlhoTXd6cG5PRkRvY3l1?=
 =?utf-8?B?emxENDE5Mkh2amx2WHVicGFWTnIvVVY0L2lERVZBYXpHaUZPQjkvTnRPWnRD?=
 =?utf-8?B?b1daNCtHYzROcG44VzdzSlcyM0YzaWd0ZTA5Y3JTUGdTcDVkYXlzeFg0azhH?=
 =?utf-8?B?TnlzWVlwQnVYSHBrZWFTMDdCSjl6M2ZzdVJhbVR2ZkxLTFVHeUJxaElTVE8z?=
 =?utf-8?B?TG9tTzQ5OFc1T2VlWmpLZG1QZ1ZjVEl1WXJwNDBrUDA0MWdaamRBYW8wU3Zt?=
 =?utf-8?B?eGl6cHVyclRhMHJGd0pjRGxXWDFzQXcyY1RXTFRHQXYyVk1ScWVzcXFwUzc1?=
 =?utf-8?B?emk4T3lKVXBGaDlIQW92UDVTU1NNcEpKMUlFbDV1UFhXR3hrWFZwVW1MNDYy?=
 =?utf-8?B?OElJOU01K3d2TW9yR2FRRWtmSVV1WlhuZG1abUN6M0pCVUk2eWxXblhwc1dU?=
 =?utf-8?B?VUljN3B0b29VYmh3UEhDYjFJdm1EaW96Z1FYdVdJd29ydHlEUmVMaHZjS05u?=
 =?utf-8?B?d3Z6a0taV3BwSko3YUFWbEt5TkpRbU9PZDN5QWRuNlVTVytKa25mR2JMdUhD?=
 =?utf-8?B?UXowdTRUQmx3UWQ3cTBTenBRNjhEMDE1UkRXZlNlL2RXNWRiUHYrTTE3VUtU?=
 =?utf-8?B?ZXNtS1RRc3NZd244RXJzbmlKU1VHUjFHaldzYjVwRGVOYVhHeGZCbVJlc3RO?=
 =?utf-8?B?THpqSFBZNlhqTkxNZmgxZGtFMksyaXlINmFkMUxoNjM2MU9Ic0VQT0lZaWZB?=
 =?utf-8?B?Ymk1MnpyNFVzdVlCZmhRd0NUUkhLQzVjc0VkajgzRzZMSU1ScXQrVm5OOFQx?=
 =?utf-8?B?US96Z0MwcW5ORm1ZRml5ZzA4blNld3krTExwVGtocXJyNjhGbHhIN3E3OERO?=
 =?utf-8?B?cU1oY2dYYmFtNHhWQko0MmVNTkNGcGNFRmh6Z2NOS3V1UjVnTHNOMDBpck0v?=
 =?utf-8?B?RVNaeElwNFBxTSt3SE5kdEJUenQ4YXNtUFNER21SUUFiRWJ5SEhrMkRXamIz?=
 =?utf-8?B?Y0dxbVVFMEVuenBBSWtadFdaNnRLSjVWcWExZnVkMW01Z0xVSXk2QmsxSERX?=
 =?utf-8?B?VjBxQTdweVBSNzZCWXEyaVg2WlUvcWRtRm8zYklzZmEyMnV3N21IQ1NlcE1Q?=
 =?utf-8?B?TTg0RnQrbEFiVmtyZlZibVFnaWErTXI4VkJ1ZzM0aXFJQXJWczlLOXcwbDNP?=
 =?utf-8?B?SStQQThnSmtCYUN5czNIRGdoSXJBbHdpenlqYzdZUEc5Vk1pZFMwWGZ4cW10?=
 =?utf-8?B?aEZyNFJydytQczQrWitxQVdaUzlzakRFR1RIV2pDUmI1ZzVFdE81Z2l3eUtz?=
 =?utf-8?B?ZHhieEM4TXA3eVk3VFQ5c2ZOZW1pWkZQbHN5TFBlVFljeVh4OEhGQS9JQklr?=
 =?utf-8?B?dmdCeUpJVXNiVVVrUms1QjNvdy9JZGRVSnMvTlJYZlA5cGFaS055UjJLd1pL?=
 =?utf-8?B?cjV3Wlk3bGJBMFJvVitsMkJqME5wblhGWXFLSVJEZm5hRmxtT1pRWHpET1RT?=
 =?utf-8?B?YlNhOHFydjRsUU15OEwxU1hxWlZ2QlF3dDdyT0cvTkNVeWRkQlBlODlVcGRv?=
 =?utf-8?B?Sy9WajI1OHFGUVZuQUxCdEZ0UDN6SnVuSldORHJSNWtIWHBURjM4K3ZTekFx?=
 =?utf-8?B?cFhiNDYxZTFuNVNJZitiUEZUT2pUVDRHc0drcms3V0h1L2NtcUlDOC9Lb0h0?=
 =?utf-8?B?cTRZK3VIbFdHcnhuRk12bXNDa2FEazl2c2szTlR6R0hERnUyajNESzhSRG5r?=
 =?utf-8?B?QmxpamRTSGFObVducUxUaGl5dFo5ekdHdHIyUm93elVMQTcvYmUrUEgxY0dT?=
 =?utf-8?B?OWZPMk5VU1l5NWhVSFRYYndaVnYwd3loN0NSSnJoeERTVkxENmNTSkFCV0VF?=
 =?utf-8?B?M3QzVitIbFpTU3VrbjQwZllQVnRSTmtuYm1QcUhuY0ozSUlCYUxFUzVpVHRS?=
 =?utf-8?Q?1wjdkgdll2TeXuJrq9chMRP6HG94mZQDeWJQD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afebb71f-18cf-4d58-6179-08ded62679fa
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:36:27.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BBLoBmX2yagQtuxcP1c5Wbm5HAsabja6Si2OsKkr+XYSgdwauZKah6k3E0hg+xWGsGWAmM1uxlot+xugebkrJT9PxYGWGzWezL4YSvzc4x+i4Ue44I+SLQ/pbOBdYwq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10298
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66025-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:michael.riesch@collabora.com,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:Frank.Li@nxp.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,nxp.com:email,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DDFE6DEE22

From: Frank Li <Frank.Li@nxp.com>


On Wed, 03 Jun 2026 00:15:39 +0100, Bryan O'Donoghue wrote:
> We discussed in Nice adding reviewers to help get other's code reviewed and
> to help the reviewers get more relevant knowledge by formally inspecting
> the work of their peers. NXP and Qcom were mentioned.
>
> Laurent suggested I can help out with these two drivers and so, I'm happy
> to do so.
>
> [...]

Applied, thanks!

[1/2] media: imx: imx8mq-mipi-csi2: Add myself as reviewer to imx8mq-mipi-csi2
      commit: c6193d521154e0ca86ffd389de0c2c09c2c072ef

Best regards,
--
Frank Li <Frank.Li@nxp.com>

