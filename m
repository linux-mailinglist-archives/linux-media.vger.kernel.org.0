Return-Path: <linux-media+bounces-63686-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 65bHDbyiIGpL6AAAu9opvQ
	(envelope-from <linux-media+bounces-63686-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:55:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8234163B7A9
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:55:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=N3RuWg1P;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63686-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63686-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 825A230210F1
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FA44C77CB;
	Wed,  3 Jun 2026 21:54:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F6A4C77B7;
	Wed,  3 Jun 2026 21:54:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523674; cv=fail; b=mDp+fFEm3NgVTE/7GjNW0nn0FxTgdjl21CEpJiw8QXqadhVGKrjEKV1AqyQ9GJC3+2m7tM7tVHzg5glz3gUdPWtLKJMQfoNR4PMuAm3VnYyoLfxzXZ7UCQcZkZkOzhsM6qQJssEut+xMNBVywwwZyhQLuuoTiRs+jzmxkg7wR/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523674; c=relaxed/simple;
	bh=kqnU8lrntaGwcJJ03AUnnk2xaJebvhpZ87EVPHxRoKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P+iKqQOZ9YuuClcVBjoFPl2Kaqo8K/fd36Cy3rpX1hoNUfET6XRRyWZg3dkiHmd3NFtgzAXFpVMBrop8dCj08H2dl/LluFNmuCx5ZbuCqjDYzX1G7/bT3Qe5Uj4oD4erJYc4p8O+l38p7hSx4G70XCAajbal2rEHAQyR0OAiwl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N3RuWg1P; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWdDgRkCaVioSkXp/UzwGD7qlggBGu/Ds4Tl4SUVdJYHZcA9HsuJlHw8+RJ/o+RCFZRe5psrrpDSUbg50rBZiwbm4XpYjy1+trUBB96jhAXuPAWoLcnSHdpg7+d2LQJn3gXEteKnJlzMueSvq9Dc1OoZF+mzGJv0uP3QRody86RyHgzyuxcUiqrH4VCFfqoR6VILGQIZZYTktMSDLDAJnhPmwMVH0SRZtnGRtLrIupvQnnKS6iuySfw0dgN/4iYtxZE9LM0YViFvc/B5SQd5KzmQsd8zH0EidDqXxdqMReXp7ZUPtf7560dUYJ19SAUQSIKdoD4Z8FwE0gSF9DY7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOWla4hKF3klHzasBF0g9glOAbEm5PySCwAcYK6tIAc=;
 b=Qqa/RVWKqCYhbktWsWNFu2b8Jcr1iXbkxzQQwSZe5r2tLuJZLtZrzntE8V/hwecYiuGP7y+rSsYQHIvF86VHvrgyH7l+qGu56I6Qh4G0vYgW8DYUodKul6dDF2+fntiKWnapwahM/czLctnRNAQwXuEwX8bN+Bb79IV5yWrYW/XVs0UF+wOsZG4CRU3gByw7mmPnPcFRc3CCd8YV+3eCZDW5RFS8dsMSltg0gSqQlwt+H1XFoVI5A4allYzBemSx/Gd416tnca5nLpjM0JhPvUf5Px9xj/xv90yUGr6dJz0081RbE2FuicnILMCCazhBKJ+pT0gXdUf6ImicJH88NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOWla4hKF3klHzasBF0g9glOAbEm5PySCwAcYK6tIAc=;
 b=N3RuWg1PRX7h+xditfbLgQGAfWW+PNwFno6rs9td1KPoKz7v/QJS/tSHlwkQhF59B95M3tzGxmUQeLkhFM2bETFVX1VkgYoDpfVgNd9L5HAyFctwPIeOaWs8pvNLWSKwElL6Y/ZImAl50Vdp4eA1ZIeOn69Jv/P6Ldtl8FsgcINfOpb9ZQvw8fLDHS9GF3LcgIrLkbVGi3y2juGdzR8c5EeUfQcOGmEs3uyDVSzIS/gpElandkycEXNpQJtwhU8n9maBy/hh0KpGHuTqcIR+2MUKuV2Dm6jf1yjiz5eH59aKIVMSNQXj5BRn2+H+z9svs6VoEhAmspaMFVlqxq1k1Q==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6778.eurprd04.prod.outlook.com (2603:10a6:10:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 21:54:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 21:54:30 +0000
Date: Wed, 3 Jun 2026 17:54:22 -0400
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
Subject: Re: [PATCH v6 8/8] media: qcom: camss: Enable C-PHY where available
Message-ID: <aiCijpDIHUkJT0tY@lizhi-Precision-Tower-5810>
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-8-e50de0b557a8@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-qcom-cphy-v6-8-e50de0b557a8@ixit.cz>
X-ClientProxiedBy: PH1PEPF000132FF.namprd07.prod.outlook.com
 (2603:10b6:518:1::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 1499314e-9a35-4af8-f7bf-08dec1bab086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|19092799006|38350700014|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fCUTsY7a8lU0OKEhfRWQ4gWTYE4zMaQ8KNe2iPe+p61T6oIQZj1s6t9XoV0PYOY3KFlmaW9E8AYuGQBYkOc8K0uQ+6WHNc6i6D3OGUjzl/IRnDBC7nh9nxvdRxzN7VgyImiza9k6hPcy9M2Dt/PyfIChhwI2SZPVSnLmcFYXSvhP6KE5M0jgkvNdDuFw/wd/8GoVMFvMbkzxu40y0/7lXUY35x9a7TbIp2VSR8Blth+OxcFJV+dQTnTeC2ERFRSMmABy4pqUpYUFjTbjwralh4eYZXfceRR/BNZ8rRwsdpPSE4DkpAsaFnugk9R6/wxJLQQAOvy/K1EqRuJaVvOmepW2VKxu48DXI538Cevc6IoKdxAa/wlshS2+cya1/NGYyldyh2Ge+8ol5FVj9cecNVnJfEyanWPL0ZFr5rMuGijFQr/8G1E0FSFrKkJqyIOntBF3K2GJ6KMIuz5jlm9V7J2tW/skVUUsNDGyQtIEVsXBrhtGiszs9Qx2GxFJd3eu/ON7tqLSnBaVyIJNWJtrEWkhrv7dbrPS9fIxWlf63+AY9UG4CEjns74nz/tFXJqsDlNCHZpl6WbRFwQZFtztnWGlG5oSZjo+Lw/TSF150MwtM/XW9TJ7A3i2STFrac22WU2rnLuBenNu1k0K0V7heKApoBMwqivblF4CvD/+gp68e1SbOWFJ7RIhz003i0DWHgM3BsHJKreA57KKTFabZQdozQcC4PTy//g5P2kur8bUvgV+J3OswI24wsUuh21S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(19092799006)(38350700014)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m+fj6DJXgj82RTBuYauDyi2j+GIMJEyhVDhDseSV2TRnTimJjt0KvrzccBsw?=
 =?us-ascii?Q?HICuajm0JVVpd2XT0a9Rm5D5FhHQ0zyMFd/L6X/hKug7w6Dm3x3rGmcoKg2E?=
 =?us-ascii?Q?Am6ohzxYIbHpJfJGxiar8XziWZfhD6aqJ0Kaw46ri493OzmQ2ZoZ1oEnsdF4?=
 =?us-ascii?Q?Z6Y03mat6w0+HgsviFauolqlWJ2xyvoeKM0kYXH0URQrfVb1gs4HstR18Z8k?=
 =?us-ascii?Q?e13gxRSPUiBSbhy73PUOrZMdPD19XNEjnGu1sWIXMzoUB74KgfvP2UMgbOFm?=
 =?us-ascii?Q?QuCHN806//XBYgAZdVKMwBpfr4wIEhRSyZ92iD8IR/TjD2d0mDkBzcQfea3n?=
 =?us-ascii?Q?mAe8g74jGO3bk7fzu+q+osmlRUKrkbQs5EG7B0mQPIeEAVhP2qW1chzrYMud?=
 =?us-ascii?Q?i4zRIHf/vkgL9vERvBZOxu1AJgy/k6mJ9YQm9+fjM3xkiIKFeJMl7qThNSwQ?=
 =?us-ascii?Q?py0aXt3j1kZBmHilGYavBu88RyCWcRpDStAjumauRoHUx+Aa0lyDmg2aDCtV?=
 =?us-ascii?Q?aIKgArzV/cS+CdSzY4fItZYIPY65yznZWSCsFdRBcRrkGB4mjKMtOd3fnwy3?=
 =?us-ascii?Q?uXT4ZozQ4tH4+vvdC4Q+Y0nOHbnFHmJUBI78LHhvPX2FmqQFN5GUF2oUTmnw?=
 =?us-ascii?Q?wxHy1FqNnyZ6HLK3KTAjLU0S5Ymnb3PG7S6OHjnDsVuT/TvBCGogOK8oYVFn?=
 =?us-ascii?Q?3GtM468JeWd6ILjSz1PhHDdqyL59duFlTgmL42NTGSuDlyTAviHMiUpIoqxM?=
 =?us-ascii?Q?D3AHVjBvDEhuK3cfB7R1Uk85mVV/rlvJXLP/e+2iY/ODAZUbVgLJCL12iqHs?=
 =?us-ascii?Q?EVxgoFvAnSKeDOczsMn1qXsJAWXEZJUXJY9TfV1/bsm3z0wTMKzjNGApV5FE?=
 =?us-ascii?Q?TW9vSTtyzoUWLqVa7TM/3FKlKDEke2sXo3MDL+SInMbw7uB2QicvjAmEHOVT?=
 =?us-ascii?Q?Vbplm+fAjPcKtCzkJRATTUN5twPWMMQNA55Jj6I/1UrqXqOA1hRC3QocOI1k?=
 =?us-ascii?Q?A+o6vFysm67dsm5FcdNH9fObqAf99kgEUm0vVZ2Gvuhsi18Oq9AKDhuuflVp?=
 =?us-ascii?Q?RevXNcqxxSDKX7EwLBFWOy4gp6ABN3JrQd88hifgiOhZG/L3CnI5otfxGtCh?=
 =?us-ascii?Q?h8l0HQVom++F/RvKS1hgrRL2l2wTprQxjnIP3yGDXPpNgWLZ4HV1zSy/Wt5v?=
 =?us-ascii?Q?9hxe7/vrsvbtX5xXLlN+7KSmBJhHETFzGwb0lRcx4kgA9CJ+4bB/ot/tSUNK?=
 =?us-ascii?Q?jTxUuUFn8esU1Tl4rsyrMa7sIEE7gMJ0nwX1HvCzImzaFOr5nnhSmRs6J4Je?=
 =?us-ascii?Q?WUiLuIafoxVjbJxsCFvjwv03T5V3Y4eOVXkRtj0OAuTU1BfbPhjZpa/9PJLY?=
 =?us-ascii?Q?r9s0E9PWAfLAwPgczSbnzxWCc2LNTaDv5kAA/DQ4VkQUiehBca7kPk8wlLfZ?=
 =?us-ascii?Q?fhXGtBx8EkxH0nwEr5NChB2l2blaVx/A2OBGWusi4dXZ4fIC6hsXN/Hq+CXx?=
 =?us-ascii?Q?ejk6FYiKIpCC+PTXPxgqEWKkLIdk3eb2gr+unvQWMxbQ5LsCuEhkfaWVZmtD?=
 =?us-ascii?Q?VsMKtoiMobfyuhBUzHCNtcbDAUhHOeNYbMrvV+1XaGNdMb4ulnGOANX2CYO5?=
 =?us-ascii?Q?BcBuB209lD8YQMsoAnqX7mwOPkIJg0IGMJJf7WEwjv2bnAZgxu1NqHoNZWcu?=
 =?us-ascii?Q?eIPRbIO0IXHvrtBuK2vYYrtzJBAjTEnnxB3HG0MwqAtc6Xdw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1499314e-9a35-4af8-f7bf-08dec1bab086
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 21:54:30.3922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbG1PTkMQLfze6JHQ445KwMMj4UNT5rJD0OKYS6w3kmoft+7duDqpgsG92mD+yvHxKJDOnuicJ1uk/oK5lHj4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6778
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63686-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:from_mime,nxp.com:email,ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lizhi-Precision-Tower-5810:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8234163B7A9

On Wed, Jun 03, 2026 at 01:30:46AM +0200, David Heidelberg wrote:
> After all the changes done we can now safely enable C-PHY for a SoC
> where it's available.
>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/media/platform/qcom/camss/camss.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index db4e14a84a95f..555c53343a1e9 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4761,21 +4761,21 @@ static int camss_parse_endpoint_node(struct device *dev,
>  	struct v4l2_fwnode_endpoint vep = { { 0 } };
>  	unsigned int i;
>  	int ret;
>
>  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  	if (ret)
>  		return ret;
>
> -	/*
> -	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
> -	 * D-PHY is supported in the driver.
> -	 */
> -	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> +	switch (vep.bus_type) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +	case V4L2_MBUS_CSI2_DPHY:
> +		break;
> +	default:
>  		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
>  		return -EINVAL;
>  	}
>
>  	csd->interface.csiphy_id = vep.base.port;
>
>  	mipi_csi2 = &vep.bus.mipi_csi2;
>  	lncfg->num_data = mipi_csi2->num_data_lanes;
>
> --
> 2.53.0
>

