Return-Path: <linux-media+bounces-61135-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ9WOPPsAWrTmQEAu9opvQ
	(envelope-from <linux-media+bounces-61135-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:51:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF2510953
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 509EB3038AD4
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 14:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC25F3FF891;
	Mon, 11 May 2026 14:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="R7bbSFzT"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011041.outbound.protection.outlook.com [40.107.130.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E121375ADD;
	Mon, 11 May 2026 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510612; cv=fail; b=dMbmGMAQIHX8pAJERnYWxNpt+qXFA67GZE14N3rIMphIIZlqEQ0KF+8zWLxJFxkW+pOv1/n0e0RYIhtNZnHnznVaz87LiTmkjVxk75C8oH+1UPZGB2ar720cQ3JAHRjr4ogLDc6WwEGn7tCzZnYTjI+xHbvBwhcWX5a9kB15Hrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510612; c=relaxed/simple;
	bh=vE8zyXEG+lre6pf5Aam+OfzLj4ECz65xLdpSlDsrGtg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XXNLyFtRE6Y7BAjS5oL1YEqqHCvENH3bzWgJ1WmCAmKymFsRwfH/IainexQXocUTv45OQOFZslGqEnxDS/jg+A6wlOhBkppTZPwO4NLUgD0WrSpU165GbQkvpbL+JArtYhvcOkeJphiNoijE9sUmf2guMwGcMkkiiwB5BI29gY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=R7bbSFzT; arc=fail smtp.client-ip=40.107.130.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhcWsGcsxC4H+6yf2shentAw0PLADfFhTJMXzyN0NYvgz0eTRnpodCLMb33GGvbXsZX34K6NQnlYVCB/1/LgDnM5cnc7NDq5qYzhpCSQh4+rvCZ9kzcmalPNR6GDjvEKZiVo53CQhl3RIGRy/p6eBC7RfrfbfBAQ/UPR773gb8XEL8WVwMwdGnpCeP8esVrPJGUl+mxLzIC7iPbairQ6fhSBEYwCPcpM9pWQCxoNXI9uAzUzph06FjiKA3Yn5FTz1NWOAMLjgyQkksKJwX79He0N4/mLZTnRdVUikapKAqZJ0KhCbGfPM9GVpnOteMLZHFMjuAIupTxB/5fQKA6XXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNFz6jC2PvY+woyTAk1mvISDZziHMet96hS6mpDilbA=;
 b=gnY1tYNZdDVYYEUkg+/dr26Sjdjx62uVrwBSqfdzC+KCRvYDZrpuF+OFEv7E/j1TYkqjdhwpkqM/2nM9AtF60LDtxFjsYbvjn6JILH1ye51CsN+a0eZtABm5cFoD+XjoX9CDT0s+DJEjPv7ywQEzqx9n1kcwzsDIXZc2QP7ltTdNwBHcuTMcuT/kGbTS6ziHQoP1tATqzMlBKFdzd8Uoxl0kNuDilRC7/LaCLhbMGezlp7F0psbzhX4e0Deo9nCKfFCLO8WZBzBUet1wdpgMFOaAM3MJHFLAHgryDyp+LUsSSbYBk5e6EDGT6AE/8t7wAc1Q1uQvkTDsn0C1G7n48g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNFz6jC2PvY+woyTAk1mvISDZziHMet96hS6mpDilbA=;
 b=R7bbSFzTSnvFKZqVgVgUBkNnLDdWijvO4Tv2eAODQxBd241JJ9PhysOaSAyrR4rJRJtq8bwXZ8G/3JLYQcvcCeCn++tvxf/90QzA/nrxt+gL2ZM1SG+oSAG3yINvZ/Dm0kRM59frYeU8prPjQFLHFf6meVeqBU7GdNnKutV4rSMfaH5l+4Iv/fgrTnGgaBEaiWRf5LNOMI2Gd9r1gAMFUS5mEgVfI9Qrnjk4Z4wYRLQkXxl09HK6eb/oR3glujEQwzlubGIJO93enVmiApLS/ZdxmclYoCMTMs4e9pOPM2nkHBJ5P1p/iWmdvBuGUq/UPDWewN4PpwGpKDBBp2rl2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PR3PR04MB7371.eurprd04.prod.outlook.com
 (2603:10a6:102:87::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 11 May
 2026 14:43:26 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 14:43:26 +0000
Message-ID: <00b5463f-5c74-4e40-a1fa-dd43dfe3384b@nxp.com>
Date: Mon, 11 May 2026 16:43:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: platform: Add NXP Neoisp Image Signal
 Processor
To: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michael.riesch@collabora.com, anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, ai.luthra@ideasonboard.com,
 paul.elder@ideasonboard.com, geert@linux-m68k.org
References: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
 <20260511132629.1300868-7-antoine.bouyer@nxp.com>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <20260511132629.1300868-7-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::6) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|PR3PR04MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f7847d-cdbd-4f4d-5293-08deaf6ba8cc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|376014|921020|11063799003|56012099003|22082099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
 jSk3foutDkQ3GWZjTl1Z4qiSPjmXz0rgVu/XT3Bq1zw34D11BM134sXeokqaIzSTNRLvkqBSM9zHU0tfevqtJc4ipLIxzfREiFfQ+0LNfP7ItxBaFk+W5HY4tqAB5ZrLhW86t+lPKe9iZG+Mbhgr+CvM8XtambhkuXpd1HvZUhDs09gfQkdkm0OzS0DkEIVAcGR9O6ypRSogHHvD8/2x/vK9Fd3hx0coj/CGK+yrWMjnJ10jlziy3pyYfbzuBZ6CMr5P2FgDF6BRe0NLrOi7P1FgUJlyP5+XRUFMmeNwzZUrUSBMiiWZ/2SNRr0aO4RYfoQNoDRiVNnzW7NdOCz5pvKCIN/ogLqXBr5rIXxKqIiwCADhSD8y5GtC+w2Lw12kNifMYrQog6CYTpg5+iH0eRvegel6T349C/vgJQT0wJb/GB4WL/qS1OoekwzJk1x9Qw6w580i4TL6C6xbjpMXPZl6/eYI6cYHWOb7w07nHCMEedlwzovRVc8i52zBw1SvpK4zUwU2KSFgKHEyI6bF0D/OiHEoLlUrbqQHtd6SPZL5qJfpBGuh1FVt75UcjPsGMBx2xcBn8R0O2MYXIc3b4plGZ6Gmrgr1KKYhyLd3pl+RG/6wovlAsBYlkkGokLmZgTDQjiKqSOgeySRyfPozwjS/v6hrAepfOO1Ak3cSuyoh+JiJEqA5hfvePjvWB/BjQMfowBLYGGKAsiGJ8bERk5Qt5j1XCg8GYcaWjGqaLUo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(376014)(921020)(11063799003)(56012099003)(22082099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OWFpRWpROVNoTlZsLysvZk53djgvRUl4OUJHdFQwU3JwU3RVL04yVVc5UnFM?=
 =?utf-8?B?cUV6RE9mSGlHUGdkY2hyRWM0N0NDZ2FySnI2aTRPNXloTmdPUGpLUEp0aWZ5?=
 =?utf-8?B?YVRTWnlIUEtndGN4L1YwYVAvMnBzRjFFNjltVEVhYm5FWTYzbHphYThjL055?=
 =?utf-8?B?eE1tbEJFcWRQcjZGdUFPbnl1Njd3ZFFKYStJbWcrWDR2dkM0MU5yN3pDMGI0?=
 =?utf-8?B?SWljY2FmWVltYVU3Z3pvdUxGU1YybWhIVFVEaitROHllZlBiZWVRZGc3eVpK?=
 =?utf-8?B?N1VnU1VUWURHTldQRXhBdkVvUHBmM1dGS0hsZmFVQTdpaTZLdWExV3M4VHVS?=
 =?utf-8?B?UXYxTVREZlRFa3p0TE83OEp2NktFKyt3TmdIL3lWR3duYnlCaXFKWlFIUzM3?=
 =?utf-8?B?Rk0yWXNxeEx1TS90aVFLVmd5Wlc4bVQ3dThkNjZkNHlhU3VuMnlGbUlkMDJq?=
 =?utf-8?B?UjN4V1kxVnN0WFdkbGI5dEQ0U3JMOEFwL2pqdk1VbnROSEFWVnZtczF2akVw?=
 =?utf-8?B?amliNnYvUTU0ODdwZlJBQkZpdnJ6OW15aDM0em9MemxhM3B4NG8xUnZhOUZL?=
 =?utf-8?B?a1psUDExTWdWTmpUZ09sb0tsMFgrRmlvaXVSaUN6S0JENndQOHdTTGdIVzBV?=
 =?utf-8?B?cExvOWxzbmpIZ1hrK1hXWnV6MGxBdjJ3dkNwZktxdzBkalVsVkQzbXJNRGM1?=
 =?utf-8?B?R3p0Z1YzZEVHMzM0K2c4cDAvdGk3QnB0cU5wNjFaeURFMUcydlRnZmU3UDNq?=
 =?utf-8?B?UU51VGNobU9obVhjZVZEZk1memtzR3UrUENXa2RuR21MbzFsNFQ1dE5YSFkv?=
 =?utf-8?B?SjJXTTBMZ1hQaXc2VHBaWFB1VnllUGNtaU02UDRuanhrTVpVMVhGb2dkSXFK?=
 =?utf-8?B?SHNLQTZrdlFLemN4ODJPL1UvcGRiSU5TOTVKQU5vZmpCSE1aN1FDUk5pRWM4?=
 =?utf-8?B?a0FocjUvOWVOQkM2WDhQbXpoSVdaK3cvVDJMZXpUakhWTUtMSHQwVTFlUWwy?=
 =?utf-8?B?MW9PTnRBOElpNEo0bE1pMEsxYlZqbXhOd21nbGFUdmE1VW1zZFp6SGpYQzcx?=
 =?utf-8?B?emQ4bXZFdkdiNDdNc1EwY2FnVFI0NTgyaURQazBJL3BXYzkrTWo1SERyV2Va?=
 =?utf-8?B?MzZ1ZGlrRGlVK1ZJZFd2UkQwandtRUNWUHZDWjRDamxQc0ExWVBKSEFsOHBl?=
 =?utf-8?B?Skc3T1RyYVZ6bnNVS010dCtacG5YRXU5bzNrbFBwbGNQL2oveUs1ZWw4R2Zz?=
 =?utf-8?B?Z281L04yT0ZZWktHVXA2NTFhdy8zWkNFQ2Y5M2NKNGxyVUZpaWlBVUlGWWpC?=
 =?utf-8?B?eTZDMUdJd2FkT2ZiRG8zOXREaEI0ZFJ1aDN5ZWNYK0JHU05COFQ4M0N3SW5V?=
 =?utf-8?B?NjZURjdVUVRqWWF1SUdob3IwMTVxVFc2cEdBR0FDRmQrWEcySE5BeUE1TDNJ?=
 =?utf-8?B?VmRmUlJsVmJmUjBydk94aU15aVZFOXJLS0c2ZnA5RFk3SmQxWnhWbEltUkVy?=
 =?utf-8?B?YVdlbnlzV1BjMFlMZ0UvelFRbi82aEJLeGQ1YzZFY1lCVUx4OGFYaFZTeU91?=
 =?utf-8?B?QXJsbEVPUzFkZFJjTGxRSFYvSXJCblFHYXNRcXpvZjgwTnVINzdVWjdwVWEy?=
 =?utf-8?B?TlArYy95ak5yVmlqbU9DMlFwQVk3WkVYbkVGMnh3aVVFQzJpd2JsbERUcmdZ?=
 =?utf-8?B?TmtaTDY3U3dJeHRKdEhTTk1UOHFkd2dHYTAyNUtNR1pVbHJjRW5DaGhQQXV4?=
 =?utf-8?B?cUlndlhsL1ZPY2lVMlB4dTBKY1I3OVZBNzZMTzBleGVXSURkbGFWQlJsMm0v?=
 =?utf-8?B?ZFd2SEdWWkRobVUyelp4OTYwSTYydkp1UGU4UEMwRGVVOCtEL2ZaZUoxRXIy?=
 =?utf-8?B?WWNIelltdytkdjA2TnNqZGtOSzBKdW52VUVGQlZmWUtSUWtmeUVIcnhiQlll?=
 =?utf-8?B?U0hEc0oyRENDYUtOZ2pOVXFLSm5FWnZxcUE0Y0Y1OWdEbUJielFLY1RzbDND?=
 =?utf-8?B?cEgvNTBOaHZUZTdzMjVlbjRmdlFkeDliUVdUNU1VM3VZY0pBL2IwaTFjenVK?=
 =?utf-8?B?M2Z4UllUdjA5UjlMaFFqbzdJU1FaREZxT0psOUR0bHlNS2lkM3l6emhvMG1R?=
 =?utf-8?B?eENWdG1aaVZHajVMOHRkSkFPdXJjUkt4VTNNYzM4emUva2dRcy8rQU5aUUY1?=
 =?utf-8?B?VG43RllJRTQxR3dXT0hkMytnZW1ZTkxBS0lPOFZQUGdrS1lUTG05OWlaYjlP?=
 =?utf-8?B?QVJlM1ZSdmNraU40RlNDQkovRHBvODdYRnFhc3pNdi9ORG94WVBXUFJMTCt0?=
 =?utf-8?B?aXEyeHRXY3BPRGdvc3ZLanFLQjh1QnVyN0FxVnJGSC9BcTc2cmw2dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f7847d-cdbd-4f4d-5293-08deaf6ba8cc
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:43:26.3727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: At6OKFu3BC+KucPNp6hoe/KGKFs1S6bgeeqcsI/UXJos4Eop0MgUqC0cYc0dw0wagku60TgMe9bHFZnxMBBLUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7371
X-Rspamd-Queue-Id: 42DF2510953
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61135-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:mid,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/11/26 3:26 PM, Antoine Bouyer wrote:
> First NXP neoisp driver version with the following contents:
> 
> This driver was initially inspired from raspberrypi pisp_be driver. It
> reuses same approach for ISP job scheduling.
> 
> The Neoisp driver supports:
> * 8, 10, 12, 14 and 16-bits RAW Bayer images input.
> * Monochrome sensors input.
> * RGB/YUV, IR and Greyscale output formats.
> 
> The neoisp features are:
> * Provides single context to limit amount of v4l2 devices.
> * Supports M2M operations.
> * Support SDR and HDR modes.
> * Supports generic v4l2-isp framework for extensible Parameters and
> Statistics buffers.
> * Provides a `core_media_register` API to register neoisp's media entities
> into another media graph.
> * A module parameter to run in standalone mode with its own media device.
> 
> Co-developed-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> Signed-off-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>   MAINTAINERS                                   |    9 +
>   drivers/media/platform/nxp/Kconfig            |    1 +
>   drivers/media/platform/nxp/Makefile           |    1 +
>   drivers/media/platform/nxp/neoisp/Kconfig     |   16 +
>   drivers/media/platform/nxp/neoisp/Makefile    |    6 +
>   drivers/media/platform/nxp/neoisp/neoisp.h    |  247 ++
>   .../media/platform/nxp/neoisp/neoisp_core.h   |   30 +
>   .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2657 +++++++++++++++++
>   .../media/platform/nxp/neoisp/neoisp_ctx.h    |   78 +
>   .../media/platform/nxp/neoisp/neoisp_fmt.h    |  495 +++
>   drivers/media/platform/nxp/neoisp/neoisp_hw.h |  557 ++++
>   .../media/platform/nxp/neoisp/neoisp_main.c   | 1899 ++++++++++++
>   .../media/platform/nxp/neoisp/neoisp_nodes.h  |   54 +
>   .../media/platform/nxp/neoisp/neoisp_regs.h   | 2498 ++++++++++++++++
>   include/uapi/linux/media/nxp/nxp_neoisp.h     |   67 -
>   15 files changed, 8548 insertions(+), 67 deletions(-)
>   create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
>   create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_core.h
>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
> 

[snip]

> diff --git a/drivers/media/platform/nxp/neoisp/neoisp_ctx.c b/drivers/media/platform/nxp/neoisp/neoisp_ctx.c
> new file mode 100644
> index 000000000000..cbb50257be57
> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/neoisp_ctx.c
> @@ -0,0 +1,2657 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * NEOISP context registers/memory setting helpers
> + *
> + * Copyright 2023-2026 NXP
> + */
[snip]

> +void neoisp_ctx_get_stats(struct neoisp_dev_s *neoispd, struct neoisp_buffer_s *buf)
> +{
> +	struct neoisp_node_s *node = &neoispd->node[NEOISP_STATS_NODE];
> +	u8 *src = (u8 *)(uintptr_t)neoispd->mmio_tcm;
> +	struct v4l2_isp_buffer *stats;
> +	u32 *blk_list, count;
> +
> +	/* Check if stats node link is enabled */
> +	if (!neoisp_node_link_is_enabled(node))
> +		return;
> +
> +	if (IS_ERR_OR_NULL(buf) || IS_ERR_OR_NULL(src)) {
> +		dev_err(neoispd->dev, "Error: stats pointer\n");
> +		return;
> +	}
> +
> +	stats = (struct v4l2_isp_buffer *)get_vaddr(buf);
> +	v4l2_isp_stats_init_buffer(stats, V4L2_ISP_VERSION_V1);
> +
> +	blk_list = (u32 *)neoisp_stats_blocks;
> +	count = ARRAY_SIZE(neoisp_stats_blocks);
> +	for (int i = 0; i < count; i++) {
> +		struct v4l2_isp_block_header *header =
> +			v4l2_isp_stats_init_block(neoispd->dev, stats,
> +						  neoisp_stats_block_types_info,
> +						  ARRAY_SIZE(neoisp_stats_block_types_info),
> +						  blk_list[i], NEOISP_EXT_STATS_MAX_SIZE);
> +		if (!header) {

oops. I missed to apply the fix on my driver :(

IS_ERR(header) must be used instead of null pointer check.

> +			dev_err(neoispd->dev, "Error: initializing stats block %d\n", i);
> +			continue;
> +		}
> +
> +		neoisp_ctx_get_stats_blk(neoispd, blk_list[i], src,
> +					 (union neoisp_stats_block_u *)header);
> +	}
> +}

