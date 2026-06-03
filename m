Return-Path: <linux-media+bounces-63675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bgCGBH+eIGph5wAAu9opvQ
	(envelope-from <linux-media+bounces-63675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:37:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA5363B679
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:37:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=EMYhdQ8U;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63675-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63675-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86EE630584B6
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DBA49690C;
	Wed,  3 Jun 2026 21:34:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DF2492519;
	Wed,  3 Jun 2026 21:34:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522479; cv=fail; b=bys6jd75zFm7FT4H49htj98KpThVCufsexvdfGz985WnKZQgMah7YRqbsEIJp1rvowhpR4c5glUCndNsnGO1AdKcF+m0iGzes0AZjoJ2jjQAYzha2xChZxkfS7lPDQ00R5IZE840zOqE+RTMsB2t5cexSSqWz/XF3ifgVwMZB68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522479; c=relaxed/simple;
	bh=nx6ewATWDfVvGrvL6b1WL1g6OYiLKjGAuTp+4eyBOrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ulDkrGw9HJoKVbkc4gCWYNB0gPGbGvY79v+2BcMbjIgCTCyiKDNryMOKMSTyIYqdcsz45EkGxPjn1h/Vl2UpN9cqbN/lotDyfmkAfKaukijAiycyV8gS4AtG9xpXigCCY5o55LWwXAQHgO2HlJOw3iYtqdsJw9gwgYpPTb88Iow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EMYhdQ8U; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTBFBWuHTsCvVAl+OAcQh0rJ9CdFwrNG6+kmE0Bes8Y8QKDRaMMaUuJAJJ0YzRcBchATs0eM+VegEYnP/n7mvAcMtFaG26nRAc+Yw/mLyeyzu5mWzWnSWZ/4FYuDeffUkhZS7APUk63gO4u0Z2k/Q5wikKkWYAt93CSnpAURnXcXB/Uj/8DQLINsvv6S0PGRAzXvsSZ1wOgxg6JmMlGsfk+uvuLMANZuOgFiGKF4chl4regmUYWo9WTb8vygJ140VX9sdvS7/XN7PQqAtk+enSuA136vUapMzXkQVMDgyWpUiSD9/HXymfI/qWyRM+FrH/FJVl6M7i11Oebz628ICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UelgSfQHN6hvKhP1kJukobFG7CtD4dBh6x5F9y8LILE=;
 b=AKY5AjXkVSdvMHpa2LL4SZ+ILi1P0HWfnPhMDwSvA2Txc0fmBuwOl5roMkj/jOuK6ke2tOz2mE09x6kiMm+P9yX1Le3nuDsrh7AkR9aT3Fxgi/qThwIMhl5zJLYD+61UZJoNhQQU7DCOerTzQKhWyeE8qHg/dCUCKXjrXya7EqQOBjSNvxGIF7uEvA5ebJhGxLDFKeb85SJtke2Qgi50wepZ28WHVGu7wm6ueM8PilcoOXAUyi85r+KjtsClOIqjY7nxchZpH92D1/9nX6NTrqthejgGbeSlXVsus/HhUccYkqwkl2n6mcQQdpOCWUn+XAJ1zt44VTB82yEqufZxyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UelgSfQHN6hvKhP1kJukobFG7CtD4dBh6x5F9y8LILE=;
 b=EMYhdQ8U0GKpCP8hGtWo85cOXZB/dTMhnVeTsclWtSHHJc+OV9iUyt1ihAtTC50wzD89boIrHeawtjvP3kZk5syUx0qbkLbMcF4jRHYlI9oKQaD3wmxjwlvjDEeCyj/5plrLm7Fv5lB+Ui+NxhrIimTClFUcIhvHo1k365wn7vQSiaWSVNnuIuEBxgXoi6WwowxEwUqdVwido6A5a2A7ISC/4VbefmtSQ7+aX3vA38z7axXatDjCNQXbeAHmvYqBdC8i/xVRs9+mjt/QyTEJEoj3R72isy7jQEK2MfJHaDIddLkVgpIe+cKZoyRcmi/GBJRGN4OR4KNVWc94jg2CXA==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10647.eurprd04.prod.outlook.com (2603:10a6:10:589::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 21:34:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 21:34:35 +0000
Date: Wed, 3 Jun 2026 17:34:27 -0400
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
Subject: Re: [PATCH v6 1/8] media: qcom: camss: csiphy: Introduce PHY
 configuration
Message-ID: <aiCd4yIvUPJgWN0v@lizhi-Precision-Tower-5810>
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-1-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-qcom-cphy-v6-1-e50de0b557a8@ixit.cz>
X-ClientProxiedBy: PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10647:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f12c7d-d907-4fd4-1f19-08dec1b7e83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|7416014|376014|19092799006|18002099003|22082099003|38350700014|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	SqTyZILQynyNM0+7RW0P7+fSCUjyXpDwXzv/q1mWb1zgLwRAM6s8wtotXMAEr4l0ALRUZRoE/h3TNnUvpLxBaD3u5Abo/JMSYIDTTMj0VtFrL0zggZs1UxD49dt7akxU9IX8ODkhUwKDK/H32u1U3hNYFWUbKxYrz6OQ/CZFTX14Nm3uqUnyR/iOuiQMFiGgYcXNnGETvhIK4U5Ohl4hhHXkx/LzFfqHNAKttwZtwAnG7FeAzvr9+U4yABJcwIlCstPkmjwqL0cAj+kcRY5ZJi0UGEdEVErGcBHc6+YKKUrbd4BtZ1EOO12iDvyEPoGR05obsTEGx2UKfSnwiR5CebKL104n7j4fld8pTY5lBHryOxnaNgmSU8w59pM2F1+H8TBhmbdouwpLt0lxpAzhyMcHc4ajt81kyo/fzIRorA2cQgK/eaGZX8FH2wMB4IqnH8FonHGgqO+887essMcXgGTz6EoC+mVi5pz+qUZ3t1v376P/r7wnSiUcHy/hkkXnR09x56HMLSrqRbJCNKPKBprDXLJjf3YJhWF3ZeNu19IwjJp5GwNrX0aYQLpwXLLBAujktPbKjVsPXnZ8WzlwO78rWDIT7Vnu3tp7k3cEHgYA9ak7/3mdJmJwZm3MwH4s+8e57q5AOVYnHOHhcxjACvZx7eT2xWEN/BUpW/iTiXX8K82AuNuqkQTv/m/m+Mr99mJo4GAJG4bvaPWmuxzv+44wreze68RH8dFlzv5EUEUAuoOjl5TZ1F2zBWyQ1xTq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(19092799006)(18002099003)(22082099003)(38350700014)(6133799003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HUu9gr/eUtfgmr61FNWw//PskTwwkpxwNCI4uEgCLHoK7kC6I1xD0GXyohOQ?=
 =?us-ascii?Q?1oF1ulHPTcitbpfDCLOHK6G5gpcIw0kzcnLFmtqQelV+x+x8pL0+Mf3t8C4N?=
 =?us-ascii?Q?RJynVNd875lgwgGWB4UFZIrsjoqQbrpUn9RCy8WjngdQ47X9hQdIxAbLvYpt?=
 =?us-ascii?Q?oSrgDAVm18Wi7gfWeRDZdpe2SNFUJB61q+hAkfkQLxKlSNG4XrA0rVvJXmVr?=
 =?us-ascii?Q?93+FgCf93OsI2n7435DOSWjqmxKoNEFiuZSRHs1tHPWRmj2Otk8XC5Hioz9J?=
 =?us-ascii?Q?YLVNpbGP56Lz8Qx5XHbL1dCig+00BltpEwNKL578/km74FecfrVu6SNTgJS6?=
 =?us-ascii?Q?mFryaZ3KFRC5lN7buLVA9W+NEodWwM/0yP2l2Yw732AxztuCarqiyfWA3M2O?=
 =?us-ascii?Q?KaZ5bfZkvSg8JQN9/0R2f9xTCnAROB4u7DaKnajT5xIZG6r3xp2L/We1IT+h?=
 =?us-ascii?Q?W2c5Kg70VSn8lZM0QfKoTHhzByU+HOH2fZEbMAcIij8c/BqZQD294E6pVe1q?=
 =?us-ascii?Q?1ZEJyaSHvI2SVB/4dyWIk4qwLAluPewglgkXCVu54vasEfJKa4YfsR93J499?=
 =?us-ascii?Q?tHsS/+qB7Enfsg6uCFV61YvDqVqKPE7JwRtt6NbiRGhQGC7vIpzRWGTIMObB?=
 =?us-ascii?Q?73pAQ5UDK8GbnK754Yp9NuiMcBAEpmIUfoKY58WsyOXhnuMh3D8EAKktdtlg?=
 =?us-ascii?Q?hCzIDy0H/+orerbERI2B23FTLhs3djM6f6zr2bYkWnOLBvKUwEyjjHI+tc8b?=
 =?us-ascii?Q?UyuVv9DuYJ8BJzk5qT6hNiXzZCeX7YEbn1PhqlvDEWB/UD9bwq9EOZ311shV?=
 =?us-ascii?Q?Om5AbEtaTWt4yFxlv/SOHZpWajpzXrb52wDpPNUKC4iBcV4YI6mk76x3lzrb?=
 =?us-ascii?Q?s6tQTJAgnk1KvNNEVu6sZOJyyTo+LbQXFDdLjYc0bUm2MNEglKo8VZec0ebT?=
 =?us-ascii?Q?h8BlJZmbSZv3QbpUneE8i04P54CnkoDip3AIPlGMhcPmEnYRP8K4EBxeWEOJ?=
 =?us-ascii?Q?RBjztSZRJqzhK4rA0w+zt4luelaJVXxfRv1bvhOJ9TwRsQUtkR9bTqMjH7/D?=
 =?us-ascii?Q?9+apXY+RHBu/FpIPD4k5++AUS+ct/7+3cE2VCGp1P4UmqKikV0SYbDvRH2oT?=
 =?us-ascii?Q?uYu66Vv2saZ4VKmmkbQE/neJ89KreRFU7oGcZb3dOJFj9BM5EuDPqEUx4dCy?=
 =?us-ascii?Q?cUUHNKL3ZYO9VAVKdNlQzJVShx88g7i+lR4tARjQjDwCScmLUWuxjC6Ahy08?=
 =?us-ascii?Q?mLkWV3r7rOIXvmA/vGOKESUDb7NNkj2RgpCn8yiYCa0ItB2s4eax7iNop6v2?=
 =?us-ascii?Q?i83ff01ABqozoIlv8WP3FG5CYSrKbFlxQK5f/AgptjHu8m1LcG5VTnGVIxLy?=
 =?us-ascii?Q?WNEuGWCtk5xmXtKf+/gNkKZsn8b1ojc3hoZJqyo+B+uP8vrV5PcdnC6x7qAh?=
 =?us-ascii?Q?zntelP295kFCrqNAibASlsOHgmB98e3ezy+pKjIsaQ7yVzJkv0Jt7gFJUe7i?=
 =?us-ascii?Q?4SnmtG9jK26rf0zgt5/rvpUuVRQot5Nqhm37zD7swWCyb2aygwjnmOszxseZ?=
 =?us-ascii?Q?Xh2FiC3L/WbLn6igTdXttnduq/xAa1jRnPTB9ohVVkVuecyKsbj+Vixa3lIa?=
 =?us-ascii?Q?DcnyRLHpI4rEsuCCERqNt/azjdM0N31eS9g5umD3cQbVnMC4fVKkKbxIViXP?=
 =?us-ascii?Q?0c+Re4KpRlsjkIK7EKgtiKn3ahcR9Uv8/jmF++UOpqt5HqUE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f12c7d-d907-4fd4-1f19-08dec1b7e83a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 21:34:35.3689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkIiyOwO7XHUAmY18lWUeu+fSHXgMvrklN+oOkmQhWR6Vy2qXkpS0Wim1GwKFLvzNor1qjbmlCrWgVLjY53umg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10647
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63675-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:from_mime,nxp.com:email,vger.kernel.org:from_smtp,ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lizhi-Precision-Tower-5810:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CA5363B679

On Wed, Jun 03, 2026 at 01:30:39AM +0200, David Heidelberg wrote:
> Read PHY configuration from the device-tree bus-type and save it into
> the csiphy structure for later use.
>
> For C-PHY, skip clock line configuration, as there is none.
>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
>  drivers/media/platform/qcom/camss/camss.c        | 8 ++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 9d9657b82f748..2ebb307be18ba 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -25,21 +25,23 @@
>
>  struct csiphy_lane {
>  	u8 pos;
>  	u8 pol;
>  };
>
>  /**
>   * struct csiphy_lanes_cfg - CSIPHY lanes configuration
> + * @phy_cfg:  interface selection (C-PHY or D-PHY)
>   * @num_data: number of data lanes
>   * @data:     data lanes configuration
>   * @clk:      clock lane configuration (only for D-PHY)
>   */
>  struct csiphy_lanes_cfg {
> +	enum v4l2_mbus_type phy_cfg;
>  	int num_data;
>  	struct csiphy_lane *data;
>  	struct csiphy_lane clk;
>  };
>
>  struct csiphy_csi2_cfg {
>  	struct csiphy_lanes_cfg lane_cfg;
>  };
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7..072c428e25166 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4761,19 +4761,23 @@ static int camss_parse_endpoint_node(struct device *dev,
>  	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
>  		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
>  		return -EINVAL;
>  	}
>
>  	csd->interface.csiphy_id = vep.base.port;
>
>  	mipi_csi2 = &vep.bus.mipi_csi2;
> -	lncfg->clk.pos = mipi_csi2->clock_lane;
> -	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
>  	lncfg->num_data = mipi_csi2->num_data_lanes;
> +	lncfg->phy_cfg = vep.bus_type;
> +
> +	if (lncfg->phy_cfg != V4L2_MBUS_CSI2_CPHY) {
> +		lncfg->clk.pos = mipi_csi2->clock_lane;
> +		lncfg->clk.pol = mipi_csi2->lane_polarities[0];
> +	}
>
>  	lncfg->data = devm_kcalloc(dev,
>  				   lncfg->num_data, sizeof(*lncfg->data),
>  				   GFP_KERNEL);
>  	if (!lncfg->data)
>  		return -ENOMEM;
>
>  	for (i = 0; i < lncfg->num_data; i++) {
>
> --
> 2.53.0
>

