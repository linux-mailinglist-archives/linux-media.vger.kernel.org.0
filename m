Return-Path: <linux-media+bounces-65596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qhYWOl9CPGo5lwgAu9opvQ
	(envelope-from <linux-media+bounces-65596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:47:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1116C141B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:47:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Jrxxhk9x;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65596-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65596-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 370523030D5E
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 20:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4B83E51DB;
	Wed, 24 Jun 2026 20:47:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2289937C916;
	Wed, 24 Jun 2026 20:47:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782334030; cv=fail; b=ESfetARA3WyWmXUwKP2bejAlAIJBvwGDoTPieKaefvbIrQKxDDFiOR+vUKlVv9Vm5RGFYM8zoPtqIqa70DcjVmEs67Rbaf63tuY4jZm/8v4t/NBtgWbYcP8I307F+KENqBapteS4UkqUrLVs7mRDjPoWRrQWtPpeAeXnjgp2N24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782334030; c=relaxed/simple;
	bh=NuvwDLyNdLPeyjF5+8oQeSrxkHOwF70eb0OUmejclis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aXJGTLTucoqEnnPBEM0i4vvGfk4Z0Ld6RgcI6Olt+3hozuJyTL8PatMppRb3c5GnmNK7ow8hG1VMqUIyVFK3XzPHafoMgP53KWeQTBvo5cd0IqYG2QaK4xo+TKS8Of4qLvgcb0UDf1zIc+Zd7+a4leC0KYw42V57WVooWsBZSTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Jrxxhk9x; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVsxVIoJ3qDO5Ukk6w4oIfyCcp1SxDUrAN3hshxymZr27syEPyd46eHaj8hRHnfG6fVitJWtQdT8hu8aLZds40qNPlN4+eJ/FaExvgj0SRHMZKtuXZG257Y12G6HFYZZImWnwTPsbCha2RSuEWgYaN0rRaeebLchwg6L6XcACXjcWXJUbKjCa3IhaIlRYYuX5T3XSotZcnQiJUB8HGMT4LaYP8ggiU9wwP9gZAOZvf/UzZfqafSuTxqhfaoFfu6MgP65xT5TAx/Y6i+VjCg5q71JokI2rwJ1thLFam5m2iR0F3MvMIytfPZf7J5G9vRdTaiJn0F++FTvt/KYYbeVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIyRuMx1pH+NrTMQULxdR9rpGT3e/LaQVtBWVDGoFE8=;
 b=cgGW8cBlsunlcilP+52YNd9wz6l3p31NLq2D+LZfV28ZWKAbYExsAEfpo5md1tWEji0z3DLbZuj7Bk7Y1Do2CL7viIIs6Hrv+KdUcYXhcPlANrUJTqtDFRLr4hlHnnSXxTJkAExpfhj39jk1MWX5nvvjHDkUL4YpeZxPtocEU/jSN3WEQXKSukW4gefbSWcsiG7YEQopg6/pS7gQe9z4/EQoawiIgyinNA7k6KFUg3HEDfAOQyYswpqsknVWuW/etWwrVK2q8Nl7+5lvF6HN5WTUzW3vNOZagCjq1wzfhBFazasEWAn0Q3fZ6o9bqPrpQsvmnqPZHSo1gSaAgYiudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIyRuMx1pH+NrTMQULxdR9rpGT3e/LaQVtBWVDGoFE8=;
 b=Jrxxhk9xbeH6C3ZkdxcnNeO1br+Zttsz3yMt7y2vPNDmF+50m9Y+vxBjOYTs4D88pv7Xxo0gFFC9JTZoZSIUzDZtH5n0Vc4hzepU3QZ3tUxxcv/q4GIT+f/9KQPxnjIutYMtm0jKndDXmeIeQHWQActxYn1qg70phi94z67BYpWvdnrND1aQgnavw/FtHQVn+WYnA7tRxlNOU60Y4VERkOkG/OSIf39cjnQ5KKVBfR3wyPseRliPJLuvrI3NTMf+lWO2VI0D37hKX4BnaTZ4RXFAcceOwu6qzEedtXsC6DuXQ6IF04rKBisYa7Efj0wSRqlo4SjAEn5fbP6jar8Lxw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB12286.eurprd04.prod.outlook.com (2603:10a6:20b:733::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Wed, 24 Jun
 2026 20:47:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 20:47:01 +0000
Date: Wed, 24 Jun 2026 15:46:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v2 0/4] media: add and use
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <ajxCOE3avXXLlrfT@SMW015318>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624191935.GG851255@killaraus.ideasonboard.com>
 <ajwxcn2LXS8InAjZ@SMW015318>
 <20260624200237.GJ851255@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624200237.GJ851255@killaraus.ideasonboard.com>
X-ClientProxiedBy: PH8PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB12286:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7d6c8d-674f-47cf-f89a-08ded231bdec
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|23010399003|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
 8p1n2bC7xvghMSPxFf/IDvgtaoYyJzXo/nlaVHwzN/Hl7I+Ban6agsilJcO3uZuhDEGPCQ8Oesn+KMQGuIuzRfpIdWNc4+2yxQXKmAxs/dojpI5BsBEAIpdf7COvTHb4gGTC9SRyXyylY9M7E+dyXwiGiYlHo68t8ogu9oLxcojYK0wMKEKOxts+nMG6b9OC8PKJ8dm/+X57vb0RDXlnv3UjjPElc7M0HBFX7d/OXUy38lfGk5psfu9YJ6S0meaWeGWAndCuhDIx8gOi6jRoEAvcCI63OBSz5crZjQUdTwxF/6tQGDsNG1OCoZ93dOzvhx7mC/sa0VoSSFkU7RFJT6etwsAedb2e0jSmDL6cVNOmF3csIqlneT/DqrDlCtGdx76T7rnf8YYXuS/YLsBAdhi3+oaYuEGtnZQZCemNylVbeFPWUwD/pRYamRPjZ2tmg9tdfm3IwYfdJ++4EqRDznaStven3/d5kqJ1cNa4PDwBy9MoOVep9fgYNAiQy+WRos7ZIlhJxX8FlmsQCgPkgM9biOo8ScFahZaK3Kt09S/GFvJuaitUFc+ugGf4iH/HHlSstzp1i6oDn6OYxI/0vJso1EcjbH5xnbIwH3aV8f4mH5yGOnneeh3m4qnKkPmMXPqfshAVhifikv1MudYgu7eCp0RcfQG990nVE5BYAP4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?AywxQEWAqJ9uIwMWLjjZJZl0McFmpilb9xHqs5k9L0feNDLUj1DQG7KSLI19?=
 =?us-ascii?Q?KZigmcuE8CR3nF8VCSXAbEXwG1/P6qffzvBfFVdkXenZZDd1FFoDFHhgTvR3?=
 =?us-ascii?Q?fo4DPUhysAuOxjox02sZ6z7qnB8wCPuOqBOGY/iSbKRFV27w/j/WIVQGQLtK?=
 =?us-ascii?Q?Wq5iH2v4dzOmnF5I3Gy6p3lQI6gIqd2yTCHsSBln0x5ZyIxPFVHG0L+uurgr?=
 =?us-ascii?Q?sx3duA2tp/3kHPkFj4iNVCyT/3dbZSm+U+ivT2ekLgBBlJ7hfkrVXbsDb21U?=
 =?us-ascii?Q?dtpRaQTNVzspmV1X2GX4ReJtuKprXLYlpBl4CtXmmRqaWsaNZn8yv4cZ8sF/?=
 =?us-ascii?Q?DJhyEKRXwVQ2dNGzF1jTjHcG7IoDcvKAx+6ipGSeMPtZPsRvRuGuDzH0OFbk?=
 =?us-ascii?Q?QYx4bRYEanmoGvYpQpORf+8L8GbVjMK7qua15wrpAsU7m6DBMylDbctbirk3?=
 =?us-ascii?Q?z6di/f4paGJHRuVC34BECfzBzpm3FrD/u27uPrGOOxBvtulT5IXYb3VpVssA?=
 =?us-ascii?Q?O0/ek+gZfE8tOobEe000AhFE7XjOL8dlMiKS6Ll6e+YLt3Jchp/2lIJiHzqB?=
 =?us-ascii?Q?WpHvuoCIqBv8++EMZiY3zK2q8+fuK/FjxWGhFQLFL49Zpl9imce8KPC9NNVR?=
 =?us-ascii?Q?JSQRubEcyyrgQ8J7zacd+hheOdM5LsyeMkuyUrv1mYZ84Q7dOTwPGtu07/U8?=
 =?us-ascii?Q?Vm37+uR75gm7TDPWlSDK2Fu9UIOLM1q2Tg/jqDNPwBZFM/w9kMtYXKPshTPx?=
 =?us-ascii?Q?goPd7MuAAhAUrn7kFIAaxMBQCAwgVn9LTtX9njCeipBJbOxrqrnXg3lQbmdx?=
 =?us-ascii?Q?FKCbuD1qHYG1u4REc3lm0AMBzmGpq20gRTqRuUcS06HmfN43vMbyKYKoM8+i?=
 =?us-ascii?Q?TltE/fEuthCP/j3wLHCcX8JUgXMJtWAwOol16wgpZ8WZveOXY9obMxId19mb?=
 =?us-ascii?Q?ttcCZmvAUvMwQnUkp6bPLlz51aNiao25lHJSv08pIsc3Et3LRxyVwu6e7Vb7?=
 =?us-ascii?Q?2LAUe4T0HmY7bRILS6Wh2huwTgGuCXD0GpVsewWQRR8gOX5pVcDSH7cQOBKB?=
 =?us-ascii?Q?4zGC+przw/5RiPoykHaic0McW4Vzia/Yo4hfcPolVXGFrpukWynCr0nAmBYL?=
 =?us-ascii?Q?JzjwyZtckIDKdMhj+UfzHtZIpMkQMOTDJpEowANZ84KIGBQwyO7yy4EJiUVt?=
 =?us-ascii?Q?OYh2YbZF3JMvwRhizU+Zh28kTcHIQqKCSgNxFyNMeLmudU3s3P661gslJhDY?=
 =?us-ascii?Q?ru9o3pUxSao5JuUItncP4M45YuljO5kQElo7T3evN1sAQt82aC+p1vBXe7Wt?=
 =?us-ascii?Q?Pss2u4iHwa/yADLrKPmTHZ+xDsKonmTEuFkMVbhUVpOny4zJzSG4RqyFVZxM?=
 =?us-ascii?Q?AcT5eRhJZ7RfEQhqPlKb1TIHlmkxhiEuAICuxzCPmdVa+C7wyP+nVJjJtCKW?=
 =?us-ascii?Q?xV7+JhXPSUjoRHpilXZJsSdfo+wHJlLrRRrSoS24ItsdK9HjSyPD+niIRnUv?=
 =?us-ascii?Q?k0yAxxPOYgGwoQsZyFp7Elv0jz9XPrgm0mDGCpZqRpHH6LCqmVT4Rd3ltrac?=
 =?us-ascii?Q?NnGBZYDAH87hRPYqO+luRyeVpiSnpcGteiDR0F9weFb0POuGM5cP6W22n9A5?=
 =?us-ascii?Q?w8SEQgNWbDxxoh5zf/1dKpVAUtnDe40TkmCP65W9UhaJBWhPMcGPv07V40Mn?=
 =?us-ascii?Q?j0CIDUfOS0WelKcQp3v9TbHBwGT18oLliLLQauTz9JnE0veuyeJebj0TXxW5?=
 =?us-ascii?Q?Zr2NaJVhadmsgySZLsHO1mZHw/PQpelMXskgRi1434BpmPZHzU8d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7d6c8d-674f-47cf-f89a-08ded231bdec
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:47:01.8036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfKXoeqFWAoeXzt8usI+8l677mN6g59/uLV2ZSU0uXdA2phCOe+5IAUduglUT+BJEeuLbu7XsESUDanAJnNgfI7DY3gFj2OhvdvWx9RRcw6bifYUwxLPO4ArS22xsVqb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12286
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65596-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,sntech.de,linaro.org,oss.qualcomm.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,nxp.com,oss.nxp.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.nxp.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,nxp.com:email,SMW015318:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B1116C141B

On Wed, Jun 24, 2026 at 11:02:37PM +0300, Laurent Pinchart wrote:
> On Wed, Jun 24, 2026 at 02:35:14PM -0500, Frank Li wrote:
> > On Wed, Jun 24, 2026 at 10:19:35PM +0300, Laurent Pinchart wrote:
> > > On Wed, Jun 24, 2026 at 01:00:08PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > Add new helper macro fwnode_graph_for_each_endpoint_scoped() and use it
> > > > simplify media code.
> > > >
> > > > Typical example should qualcomm's driver (camss.c), the v4l2_mc.c and
> > > > rkisp1-dev.c only silience improvement.
> > > >
> > > > Anyways, *_for_each_*_scoped() already use widely and make code clean.
> > > >
> > > > Build test only.
> > > >
> > > > Sakari Ailus:
> > > > 	when I try to improve the patch
> > > > "Add common helper library for 1-to-1 subdev registration", I found need
> > > > camss.c pattern, so I create this small improvement firstly.
> > >
> > > Those are nice cleanups, thank you.
> > >
> > > After applying this series, the only left users of the
> > > fwnode_graph_for_each_endpoint() macro are in drivers/base/property.c.
> >
> > I already checked previously, two place use it.
> >
> > fwnode_graph_get_endpoint_count(), it will go though all endpoints, last
> > ep is NULL, which totally equial to scoped() version.
> >
> > another one fwnode_graph_get_endpoint_by_id(), which return ep, expect
> > caller to call put().
> >
> > if use scoped() version, need use no_free_ptr() at return, which make think
> > a little bit complex.
>
> It would introduce a tiny bit of extra complexity there, but the
> advantage (in my opinion) is that we'll be able to remove the less safe
> fwnode_graph_for_each_endpoint() macro.
>
> Now one may argue that the risk of
> fwnode_graph_for_each_endpoint_scoped() is returning the iterator
> without using no_free_ptr(). I wonder if that would be easier to catch
> in static analysis tools than the current pattern that leaks a reference
> when exiting the loop early.

It's not big deal, if everyone prefer drop fwnode_graph_for_each_endpoint(),
I can do it.

Frank

>
> > It'd better leave these as it.
>
> --
> Regards,
>
> Laurent Pinchart

