Return-Path: <linux-media+bounces-67188-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id POZGDj3DT2oKoAIAu9opvQ
	(envelope-from <linux-media+bounces-67188-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 17:50:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0D37331BF
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 17:50:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=OGb8Jdy2;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67188-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67188-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6A2130B15A0
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 15:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD870423A64;
	Thu,  9 Jul 2026 15:47:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE03733D4FB;
	Thu,  9 Jul 2026 15:47:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612057; cv=fail; b=AriIUHkmrWMFF8zqvtwZyY1jkzuOQjrjZmB3h5OFwfIxGyy/J9clD5iFqDXIOczEbDyWCfEpUyjH//xT7xO8r33skSIrLpNdir01m9HpkEIQG4tdxCx25W9C3KVFPHrojiA/V6Qqv1NkL0AMk5lp3secweIuF5fEXst3nisLQ70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612057; c=relaxed/simple;
	bh=xEE/4fUuDDRcmbnkyMoHqcvcpoDAh4QI6dGw3VP/lm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i7zFJq/ktiufUCykDBXzoQn3ppRJUQ52fDjQ4sjxFKlvN4hOcAG5Yn7S9aoLS7iHDN73PDqZKmVL6InwcyY27dYfjI0z7EU9CxzEZKIGS1ZuOtVljeYeF24FKQwHjos3oCu6Qg7PhBS901CxFlm7jQTqzC62Tzv4KVKNqyCvZcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OGb8Jdy2; arc=fail smtp.client-ip=52.101.66.30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXT/YCmH0HyYShef/a2jvtWerMGYZWF/VYGmdfqyB94aqiMvTMYHFDKIjfQ1uXGsHV4dB8UBy8jSH98h6d7sOnILJJfo2PEp8ou5+C25SZqb3ea6VGMEH+aSVh838Z4xesCRl4Ba9/Ct5/ch56Qn/ubU0uSo6fqow7N5ZinGiilikYXog+lTaptA10mjmja3Z4dTfur3RjhKT0WCRlDuD3zk4xqOsV4+I9z9pFkOn3K5oDQMo+an8InFax9QmqMIIBoKUUZ++z66wqpG4ooKs9kQ8RZBMqY35JrfDam1ES6oEgbJxvdgEIxtisWrC3roi+Mo6qcD2eZX1D2WNzlR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sLYMCLhg0HoAhsRqndrtmdCR0ZuLtmTiZj4r/97iao=;
 b=kpAc+NeQO1Iu/e1rQlz11Ba/PON3xfkzLUqFDNY7B6FXqEjFIv1J8Pfj/kv0i5HT8NrsQzzy1b4jJZYrVqwQZ4EjQ7e4Fozhe2nwB60qCS9tw0kNHpeVKU2DhoDt/g2/IY+N607VrzKFRIXCLYBGLCq/HCnGDWfaoLlQeWsxCqw67UZrmRHWQ58rDguFACJGCIuepWYMRReCLGYekmsLL8KZCiZy77HqHTJWmHxxvK20leKEXnGFD7TVsPiRMuu9LHOnlTuItxluiVPf8oz4dDwVa9yqKN4EIxbl+WCkRRTNwSnI1pO3f2AJPa48GlTNc05oEWUJAzws5FU19THMjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sLYMCLhg0HoAhsRqndrtmdCR0ZuLtmTiZj4r/97iao=;
 b=OGb8Jdy2x1dQLH3c8MWRBb+oICmj+8RXc49BPmv6akp2tozplM9ZZGiFYvu43Pa3miCRZjkSssWayPnkzdzqYvR/JdpbHyI1KKR5v+FcSEDRtshCeM2/jerL/mfM6Z8jlRqI7Tp67/BOPUfTgniIsjt092vlHSrLR6x6cTRi0GDbtma+VA7L1UHH6EaIKckkqXqj5XdhdkEswAwdvY+3U9vMSLIluh9feXq1RRDGxgZ03yYuAtc+9J2RLORe7SMJDlMygz706GcIpWdIxohAOqKg3laEpCXL7mL4LY6820pOd8fSZMKUmRiuRutySMUX0+O5pxSNBQrBo7k9R/4bdQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10573.eurprd04.prod.outlook.com (2603:10a6:10:587::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 15:47:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 15:47:32 +0000
Date: Thu, 9 Jul 2026 11:47:22 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v12 3/6] media: qcom: camss: Add support to populate
 sub-devices
Message-ID: <ak_CivYjBZcNrBaG@lizhi-Precision-Tower-5810>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-3-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-3-f8588da41f16@linaro.org>
X-ClientProxiedBy: SA0PR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:806:d1::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10573:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ba8538-fe9b-413f-42a4-08deddd163ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|7416014|366016|376014|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0spLdcw2uGV+WY+6HSxDX16yQpVv2SmpDBlU1CE2FXH8cqZmtKpdDRI+xl+Fo1F1f5OHaCkbumsHYa091EOl4rlY7zIAXtzXLskRsdaXR4vdPc3YCWaZ08gxL/HJTx9UBAgd4kvsgmBE+vaINI6Z/WBMAqG0XrTL4Ojm5/Hxo4gNscREkZQdnxraDwCg5uG0MOyLdcCThPLMhxomdF4k/8qb6tLZamNsC3FFxDmRCauMfQfYX/nM/DOoo5V29GoqTATEuiF9VWJ0xXlUqCvqI1RuwQG5xes2uO7aYXN3b5iG1k9ipBeH29uO7SSi+lGz/Cu32uqBLzKeMPRJpWiT8EDXGJmhGSzKMxxvRvK/HAKVKX/0NnSgvCSfw/sVpGW4V13fV/Bf+XacEVOYvYgheb2q6e3QlFPQJ7VdnDaM35Ez1Kc2iGPdXGhTIEEpPnH54L+CY2DNB0y2j7lb2bdIdOs9BBV7nnIcwbLtvwHMfd8BcJfJBRBD+k6S3FAlbEgCpv25bhhI83PCvOAdwTuvuH4Sejy+PyWpJves89nfZKfVTl8jHG4vCvieJUp5Kv8NNkVdFLxdQNUJiy5cV69YIx+MGqiH5EcjaXjMRXhdI0Ju9oWzVVI0lU+CSivmcbNa/5UWj5EzWSzSGGFEOAGhD519xeKzkwtWDlGo0+zwk/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(7416014)(366016)(376014)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LLfI4q7FnORyAgcxm/ewfe5BrO6jUOq8YgxTHDhuemxcdEXVCTaBBv5+PgDk?=
 =?us-ascii?Q?waDfY/uAd3IyLH9oXFYUPIGq+lseVhTySvwXfCT2DKmGU1OJOtixPpWBOR7f?=
 =?us-ascii?Q?JekFAyBOq6m02KTlIthZAPg8gBf+M8kHO3nNcC9NcEoV7EfTe0eHzNOP05I/?=
 =?us-ascii?Q?jQxc3S20PCMKSVwkv6DZnVlJQUVY0IRirgRCuVzpMtC74IF/VPgqHXVil3hX?=
 =?us-ascii?Q?pZp1cQSmLo8OPbgC47GD7l/SttcKiqIJed+HPW5Hj/eu3DzDR4Yzh/grTwEC?=
 =?us-ascii?Q?zCNt6j6YTbwaP0HkjPFgrSGCpHciAgpkIqyvSUdg1R3e6SI8JqkRYNpY9ajU?=
 =?us-ascii?Q?DE5ZBhRqAycoDE9xFImUWqsOAKxHMI26calDgmaA4zT7ZBt9Gk+0lPBy/bcT?=
 =?us-ascii?Q?qt23qo33LGUnvHppFyIzE/smaHZSTEYSHjwZE1P/j8O3udkv0RiDMJ9eMYZS?=
 =?us-ascii?Q?0+VQqgfJDDucby+U3rMjNTayaZIPVHHR9PxIuFY8hUn2DWb9MrWcEeclAeV9?=
 =?us-ascii?Q?I97azQuFm2HqZGBitglz77dXUf7gUA9TOjTZNPpnUjAFvjfX7koDrwS72tZr?=
 =?us-ascii?Q?zx6qPwrf+3vjnw1q2NwEVyNksJdogGSj0pRYTyk9vKrivG6UqAEhzny/52un?=
 =?us-ascii?Q?PF2UYt9yOxqrmgqEUt9L8KyRPr1JuGrJSItyBRlHL8MgEtkPJEftL7hr1vPx?=
 =?us-ascii?Q?rvK9+sF+/DNdGKTE7//KHbTLZFeVZ3hkh8XiQhrxNCt1eJOs055AZLUk2wwX?=
 =?us-ascii?Q?fyRWAV/uD9/qJ+CX7Ioc2CTwFEVvIv+lxdeFZhL72u0jhF+hr93IylwbH1+I?=
 =?us-ascii?Q?kahaZ2F54Ff0nuUUpRXmt8eUmKhEOYQnjmnepf+6OiK9crH6agB+9psxhaLc?=
 =?us-ascii?Q?BKXOF0PWG2dZ9l3ApPG+Hb9m9azeVGTJuhd642Jo4BiEFA866Gb+BA7XEPs2?=
 =?us-ascii?Q?FeX11Ff6qX3DQFdW7QhTmp2+j85fqyelkT5JyrqPVXxeClcNPEXuWtyh3cLL?=
 =?us-ascii?Q?dPfE7GbQp2T0nLfe8o4+u5L/umHulxhmzjztnQ1CxEvfHDQ/dAlv00CfuTQ1?=
 =?us-ascii?Q?ogW6mp4Bw5/NRB5Kg6fT1ODr41JjNa+3pMdvqG8yh0oxpam6aC1RzpCQAvYG?=
 =?us-ascii?Q?wYn7x7mUH4Z7oB+aa/qZvGYLolgDcVDk/tf91LRSEkmYqTTTIStgLox0xkzH?=
 =?us-ascii?Q?mmTb2D9oRxaDJS8gg53WZtIpmB1l+lGv5zYKOBUb8SABBhx4Jj0SlFFrllHp?=
 =?us-ascii?Q?J66Oas0Ektkdiq5YzaF1BcjgcUN1utYXmraVkxOfQgEJW8D01ROKkHUKcz4t?=
 =?us-ascii?Q?DV0oxA+w5wfofb4dmtMls+3fqozH1vaGQvsmMQfLTJXip8ZuMSc7r9LJq0w6?=
 =?us-ascii?Q?E0/rJvLb2wvIw4UwT8miunjUXDjctDn28Kp/pnY4PJ/47Jkebj+LdYCL92OG?=
 =?us-ascii?Q?l3o7aKtTeeD99H58YkMBny3gbObp8qJ334er4sS4Sw0N4NiCzQ+DriKwNVjX?=
 =?us-ascii?Q?O/yxXoasoyHBP9W2r0ZJVTdBZerAMGX+ZtLpgn4iiwcH9M90Mgz1w4E/KTmn?=
 =?us-ascii?Q?aLtkEzOJ82gcwfbG8mce8g9MdRh1sGZITPFaIRsm2pFrstHfPNlOtd6DI4yg?=
 =?us-ascii?Q?12I+uhVkdv3JEEg0ji3BEMTa0b1hD1Q6HM1hbT/HlpOC6eT+ONg9L7+Ua0OB?=
 =?us-ascii?Q?GN0IDzESGaWnJLPsQvuuwWk8FbTceZ17mT+aBASDEry/wE+CLHPCfQFp3ADE?=
 =?us-ascii?Q?GTVIzg1DFBbPUn4KAtAzUXjUO63phUSgcGkGVODcOZXxGg5uxygz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ba8538-fe9b-413f-42a4-08deddd163ac
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:47:32.5439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDhcw9C0GQSl5vFz8RQkWNAwCLwacekzlggITRyFMSyFHC1Zfl2akYXmRe3zvROV5SlDkzJ9YBSZZtuoP6iw+kZhExtJ1OYGMBJwG2IaTcrKYORtGNZETWUe5Q41kS5q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10573
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67188-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,linaro.org:email,lizhi-Precision-Tower-5810:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F0D37331BF

On Wed, Jul 08, 2026 at 01:06:57AM +0100, Bryan O'Donoghue wrote:
> Use devm_of_platform_populate() to populate subs in the tree.
>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7..95e655a8b6aa0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
>  	if (!camss)
>  		return -ENOMEM;
>
> +	devm_of_platform_populate(dev);
> +

Need check return value for all devm_*()

what's happen

     camss {
	phys = <&phya>;

	phya: phy{
	}
     }

Can device defer probe handle cyclic dependence? phy driver may ready later,
following phy request will be defer and cause of_platform_depopulate(),
then phy device will be removed.

Frank

>  	camss->res = of_device_get_match_data(dev);
>
>  	atomic_set(&camss->ref_count, 0);
>
> --
> 2.54.0
>

