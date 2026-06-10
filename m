Return-Path: <linux-media+bounces-64348-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ifm7CE3cKGrNKwMAu9opvQ
	(envelope-from <linux-media+bounces-64348-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 05:38:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF08665A3A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 05:38:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Bujoo6My;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64348-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64348-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 789A7307BA23
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 03:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8592D2486;
	Wed, 10 Jun 2026 03:36:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160CE29E116;
	Wed, 10 Jun 2026 03:36:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781062590; cv=fail; b=h4CitkLKGthzMqSSFtQokW/Y5JZbjzzmaUxY8zBUuS1dykgaws1HbcQOsQxm69e+e0CFYR8UTMBgqXOf01LSzt4m7IgjEjYpbvojxNzeG/zSZBGVasUMCFFXjJBgjdb+b63gt4wroP57Ge8P/MLa/NiBtuPTZHlO3NRSRohwKqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781062590; c=relaxed/simple;
	bh=6kuer/qRhv3rDXwTrqfxz7zrvkd4CltFyujFIoeEFvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qpSKPVyBbFdYzJZv2IcPhULWK2TefqnGI8dPWG7ktFvhFa/42imY5rBnvpIAH6IJ3NBQOeUrAstPFVs4WGbJ9swLXkN3qZF/m7ltWZzEooeTTprjwjiOuv5GgA/2eVnG+4bfVzF+MLeRT1NMBIaAh46zZqwHdUiRq5Gk92joyEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Bujoo6My; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvdQ7FPhl9KUP01VadPMHEznDiDILK2JZkUIwt870Vk7ATGQVVljOrfDI658O4v1aE6eADVYPBsQzCzh72fh030INwuZN+jWOW8q3KvPv/sQu6OghbFlHrDUczUUoRL+OQYfm4ACqoge+Yl2qriYOKUb9b1NpRmOnv9iXpupKv1p2+GNrZgGoTyNLD6zkYvPlxbHfYCFdeXzhD2JvxHtPycNV4mdECWj3EiSKDO4olwy+usrBLZc7yoBmCGUSghe29Vh2fSsbYJKpV1Wps1qwLtSyeooNrL1M0EtuqNicV47yvzFVb6NU0s0UCAhkgwSoHeNhJuh7fegftYWDSUEjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zVc54VzC9mF2ZPj15sdR9vikk09O5LaE/qvnyjLHqw=;
 b=EfJuAJcOafETWNc1oeOuxrLITbYCXrkmH0M0H6lDbIT40S2n/45T07pxqFc8R/eSaC+U3uADmL52jUt/3ArFKNijzlBibyreAaFjbMzq3TqPw9PDE1KsMbBclBnx2K/jP8cWutjyPGFtLzZdLTRLUgTaC7sgiaxwHyEF5F7TecT1diJYQO1cHmlUbozVHgoWLXYNMo9ml0sXRDahd8DEBTH0DxBscaUXkVtrGodYyAzxM/M+/lS2bltTmzZOE6HDmKYetQq3ITesYJCVn7cL202Yw6WaMNcN5Qn2MvFTJIH3HCNuolNfCZnAYgl0ECVnNzUsLNSxBF0qgpxXBrEUQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zVc54VzC9mF2ZPj15sdR9vikk09O5LaE/qvnyjLHqw=;
 b=Bujoo6My8GKPUwCn2cl6rPlSKhR2g2mweeYSDXEVYHqqXY5FQ5t9PYGA7k+r1fx2OXdQqhESgGsTq6HQ+GK9Jit+KaasNDMi5KmPhMeuGblB9hJy7wC6nTUB3kF5zuBPQfOvsroLjcsKYK8lcIhoxs5mq/mB1bJ4MmUZKZQiFAORtbyIXODfPI4codQfWeiiJadAvQ8SAFwliPkZpxh3/foc997N9uE4p2/3cXZtYQ34RncysQXJGxnXY51UXHd5Q9bxqijoWhsF2KoXLjwIYEVAWCW5skd17bDCdFHLWIkLiTGPtEviEjeTM2mOyjzEOuLcwZAb4cWynKN3hwQHKA==
Received: from AS8PR04MB8563.eurprd04.prod.outlook.com (2603:10a6:20b:422::14)
 by DU4PR04MB11725.eurprd04.prod.outlook.com (2603:10a6:10:626::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 03:36:26 +0000
Received: from AS8PR04MB8563.eurprd04.prod.outlook.com
 ([fe80::3f00:4490:e559:74a4]) by AS8PR04MB8563.eurprd04.prod.outlook.com
 ([fe80::3f00:4490:e559:74a4%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 03:36:26 +0000
Date: Wed, 10 Jun 2026 12:36:15 +0900
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"hverkuil@kernel.org" <hverkuil@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Eagle Zhou <eagle.zhou@nxp.com>, 
	Elliot Chen <elliot.chen@nxp.com>, Frank Li <frank.li@nxp.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
 V4L2_FMT_FLAG_DYN_RESOLUTION usage
Message-ID: <aijayrdr_rrz2x4B@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
References: <20260608-flag-dyn-resolution-v1-1-44dc65516148@oss.nxp.com>
 <20260608040616.1A3EE1F00893@smtp.kernel.org>
 <AM9PR04MB857068E0FE59DD8ECB27A9AAE71C2@AM9PR04MB8570.eurprd04.prod.outlook.com>
 <e689df21c92861e35b6d11e391bea3404321484d.camel@collabora.com>
 <aijOPSFPEDsVlYFY@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aijOPSFPEDsVlYFY@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To AS8PR04MB8563.eurprd04.prod.outlook.com
 (2603:10a6:20b:422::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8563:EE_|DU4PR04MB11725:EE_
X-MS-Office365-Filtering-Correlation-Id: 4679f453-33eb-449b-2a64-08dec6a1726b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|4143699003|5023799004|11063799006|56012099006|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VRBeiz1ntAuCb6iP6FaaN5heNYYYypCgmY13ZE/puUoMgnHCQtTJg4a7ruov/WE80R6VN2CqRC9iPLeutksRd4m+AsPp5VWzkw5uaC3lABruXRZ32ExMiDQJsAUDnslqID8cnAS4SReVHmRqgbSt+DgVnE2Hl3+lWU4jYZ7tuUQ8MJE5kn04HDD+hXQzqC9FulXkCf5aYnxtOdYfaxOlanxhUilOXk1mqoPXyI+XQS4jN7ESniA5+5UuhsRvVgS2TUI/5kazJm4MI/OEStYYZhvyx50gmgVQ8U4LtniMi52UnpnkkMNrBSPGcieTh/iW1jU0olu1ms4WX61mTq4nMrOR08oCM+0lv9wCr1NacM7WLcQiUETKgADbPO8XGVADWc8m0559MPcEbUKTOXMhF7dLDlMF5ZlmHMx7/q+FFgx43LwQE/D274ZwneXFP0WKWERlnaf6b3SxtK+WxlO+ST8iiOAh7dWUCL4THLsUg3RCFPfwqT9/Z1VqgI6DV4zkDcpuiemPTdxYjKMPX0yIW5EnpBkZ8SmrQFoe4nl+jOb+yOB3ZlZHYCXW+2Bxdv8SzYUKXbVFNuZtO3cHKKjgCxvZcgFeQxQf7JTkFDFCGfR8xkkRLDYEyXhf0sVg0+dcyOEE41yS6REn9er+ssjTSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8563.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(4143699003)(5023799004)(11063799006)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHh0VHdPcUpjQlVTRlpEMzhQWGZWV2hlWEwrdVY2VXRLclVlQXh4NEgrNXBK?=
 =?utf-8?B?cHRUdGdqRWRzR3FMK21pR3ljWkl5MFJBaVUxai9Wc1lxRURPZnAwc1Z0L3lX?=
 =?utf-8?B?NXoxSHl4WnJhTjltWXZMbkpCbUdkdkd3UDE0Z3lzQmdtVmpqV0g4ZHBoeGVE?=
 =?utf-8?B?a0c3eVFrUGJWYkxLQmExb3pDcFV4QTBNL1pXS3ladUxHbFcwenhZY3QyOFFs?=
 =?utf-8?B?c2FnQjNaUDJPdUdZVmJnR01MVzQ2TlNZcEJYVllWZUZFZVhyYmN6aW1HVDhG?=
 =?utf-8?B?WVFZeC80aUtxS3hyQzd2YXBFMGtZbGRoSnlnV1JYbGR6SSs3QXQxUzFUSjR1?=
 =?utf-8?B?T29rWFErSzZQWEdzQitiUEoxSWpNR3kvK0E4U1BEUm1HeHJzbUVJRVlrUHF6?=
 =?utf-8?B?NmFVOUtLOXdDM0txY3dwS3FkWFNrbW1CZE9aWGVaUVJCOHN5MHVLeHV1LzJO?=
 =?utf-8?B?aHpKUC9obExpTmtGRklVdDZ0aFJmSkU1TjF1amd3d2NzemtnSkJoVm5yZDJl?=
 =?utf-8?B?R0hvK2pNMEI1dXpvM3YrdGtwS1JyV2twSkVWRi9wR2RpMWFySXdKVzJmeDQ5?=
 =?utf-8?B?bkdLNTVPdnV6RHpYeWhueXRWb3YrRW56ckJjYlFZQ2Ntd3VvMkNwcURpNTc3?=
 =?utf-8?B?UTJad1pOR1pXd2kxVGgyWlhJV0ZBY25nYUhLSWFxVEMyblBwZCtadjdrL1Nx?=
 =?utf-8?B?STFobHZjSnhQTktSWG5YUXZGWGRFZ2xEQzNCM3NJSFpCZTRKU3R6SzVSUnBC?=
 =?utf-8?B?eU83anlhSjhXbnNvOGNUMTFwK1lEbDdtTU1od3pjYTFSTXRrTnc2Uklzb0Q1?=
 =?utf-8?B?K3ptdW01UW52dkxFa1ozVzRsdTBGWklLNkN0M05OYzZzN0lXbk1Hc2tXZHdq?=
 =?utf-8?B?M2xFWjRKR3VJQXd3MEI5Sm9mQzVuU0o5QjljazhNZktMN1JUR1VncWpjeVBF?=
 =?utf-8?B?UkkySCtzYmJsbTdnTEkwbGxvVUQwWlBreGpaNEg3M0Nnd0dQN09zNXk5QnFP?=
 =?utf-8?B?NDlReVViaFljRVBUempUZFdMcWViUnpTRnJpbTg0MWlZV2UxMTdwMk1rcFR3?=
 =?utf-8?B?c0lCQWRiWGZIN2N2a2ZvbmYyL3g3UnZid3ovRm16eFIreisyRzRSQytKOVFh?=
 =?utf-8?B?Q3doNmdqT2FqcVZiTzVMelQ5M2J6R1Q0TnczYmh4SEZYVzRaSFhEZFd0d29T?=
 =?utf-8?B?aUxVY2libDFRTXpRU3lzZHBiL0NQRnJsUGNIZGxmS1BnNEJqcVdYd05RbmpW?=
 =?utf-8?B?T0Rac1lpUFhXRHRwNVNGUmwydjVvSTluNk5vSmZOVEN5bmt5azd1ZmthUlpB?=
 =?utf-8?B?cytYODRiZW4wS2hVdGFvaEtiNHY3a2dEb3g5OGZLLzhnckJFNDI0cThUN3VC?=
 =?utf-8?B?SjdSN1ZNMEJnNkEvRzNKU1JYL3lSODVEK0JvTkFYMVdrZ2phcThFdVo3RWJE?=
 =?utf-8?B?bmNTZTZUSWxQcVQ3b1hFYUdNUGQ1ZG50NjdwanMzMHpoT2V6MFNBY0tSek1S?=
 =?utf-8?B?L1dHdk9UMllHWnpiZHQybUw4QVN4RWFpcXl3VDM5QVlIY25mSlNVMTNjT1Za?=
 =?utf-8?B?anZaQmVQM3JYSWljRTZ5VHZuajZMejR1T0lpSXorQ0tNQlcwVGdMQUxGVjFq?=
 =?utf-8?B?VUxCYW4wbE9qWjNkMWlOeFZ6TzBEUUU2dlJGcjBYNnJYQWVhN3NUbWd0Y3lj?=
 =?utf-8?B?UzZnM2R4M3NiT0hocHg2TTZmcy9RRkNBdXkxcmtwVVhGVndDVG5SQ3N0aTNq?=
 =?utf-8?B?bGo0cFVsY090eXJqTUVhNGkzKzJKOXU3aWIva2wxRm9YeVFxYzhCcTVvYzVz?=
 =?utf-8?B?ZlNtS05iaXpnaWZVM2ZlQ21tODFIVDFtazJNZHRvTjBGaXFsVGFrY3N3QnBm?=
 =?utf-8?B?NlFBNWtoa05acHFhWXNORFZxQjJhU1c5Vm1sWDJtQ01wTTlvRGovbjZwWkhV?=
 =?utf-8?B?WmZuVWhoOFZ0THhiTGQvVS9PNkRuNkRzU09OUU9yTk5FcGF3ZDZLT2tkK3Nm?=
 =?utf-8?B?enNKc3NwTDFIcGpyZmZoMHZWQi9hdUw3MHcyQmZkd2xXaWhPdFRFMTFvSC91?=
 =?utf-8?B?U0g4TGxzUzFRMjJ0ZDl3dm5LOFFTdU1sU01wUjN0TUpWWmxxdjV4ZmRIaHpr?=
 =?utf-8?B?aUlNaTVFQlV0bDhJaXA5bU5Hei9NY1cwR0lmUUZNRmN1d2JOWFhhT0FZVExj?=
 =?utf-8?B?TkVKbWFtalRPM1ZBNjJ0UjIwVDBkNnVFdUdCQ2swWVBrU2xUWHRzVWs3ZTU0?=
 =?utf-8?B?ZGR2dVh0aUpEUWxHL21KSDhySnZiak02U1RBVE5GcVZMbHc3SkM4dEtxUHJV?=
 =?utf-8?B?amkyN25BM1QvbFdrNTU0enlXaHZXalR6WDVHQ0dDQVFqbUd4MVJnUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4679f453-33eb-449b-2a64-08dec6a1726b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8563.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 03:36:25.9459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GH/uzyBj4SnautqpcIKon2PHkf0n9sj/hwFhF52I5+zzOhg5zqNCXEZ3AekpiJxrSQGQpJ2duHdmMW8NtcX6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11725
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas.dufresne@collabora.com,m:sashiko-reviews@lists.linux.dev,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:imx@lists.linux.dev,m:Frank.Li@kernel.org,m:linux-media@vger.kernel.org,m:eagle.zhou@nxp.com,m:elliot.chen@nxp.com,m:frank.li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64348-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email,vger.kernel.org:from_smtp,sashiko.dev:url,linux.dev:email,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CF08665A3A

On Wed, Jun 10, 2026 at 11:49:06AM +0900, Ming Qian(OSS) wrote:
> On Tue, Jun 09, 2026 at 02:00:02PM -0400, Nicolas Dufresne wrote:
> 
> Hi Nicolas,

> > Hi Ming,
> > 
> > Le lundi 08 juin 2026 à 06:26 +0000, Ming Qian (OSS) a écrit :
> > > 
> > > 
> > > > -----Original Message-----
> > > > From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> > > > Sent: Monday, June 8, 2026 12:06 PM
> > > > To: Ming Qian (OSS) <ming.qian@oss.nxp.com>
> > > > Cc: imx@lists.linux.dev; Frank.Li@kernel.org; linux-media@vger.kernel.org
> > > > Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
> > > > V4L2_FMT_FLAG_DYN_RESOLUTION usage
> > > > 
> > > > Thank you for your contribution! Sashiko AI review found 1 potential
> > > > issue(s)
> > > > to consider:
> > > > - [High] The added documentation conflates
> > > > `V4L2_FMT_FLAG_DYN_RESOLUTION` (which designates mid-stream dynamic
> > > > resolution switching capability) with the mandatory initial
> > > > `V4L2_EVENT_SOURCE_CHANGE` event. By stating "Clients can use this flag to
> > > > determine whether the decoder will signal the initial resolution", it
> > > > explicitly
> > > > legitimizes a flawed userspace heuristic that violates the V4L2 stateful
> > > > decoder
> > > > specification. The specification mandates that for coded formats containing
> > > > resolution info, the decoder MUST parse the stream and emit an initial
> > > > `V4L2_EVENT_SOURCE_CHANGE` event (Initialization Step 4). Compliant drivers
> > > > (e.g., `coda`) correctly emit this initial event but do NOT set
> > > > `V4L2_FMT_FLAG_DYN_RESOLUTION` because they lack mid-stream switching
> > > > capabilities. If userspace follows this documented advice, it will
> > > > erroneously
> > > > skip waiting for the initial event on these drivers, breaking Capture Setup
> > > > and
> > > > stream decoding.
> > > > --
> > > > 
> > > > commit ec9c0583334c246f7813132b55724e42622e8edd
> > > > Author: Ming Qian <ming.qian@oss.nxp.com>
> > > > 
> > > > media: docs: Clarify V4L2_FMT_FLAG_DYN_RESOLUTION usage
> > > > 
> > > > This commit updates the V4L2 stateful decoder documentation to clarify the
> > > > usage of the V4L2_FMT_FLAG_DYN_RESOLUTION flag. It adds a note stating
> > > > that decoders setting this flag will always emit an initial source change
> > > > event.
> > > > The documentation suggests clients can use this flag to decide whether to
> > > > wait
> > > > for the initial resolution signal.
> > > > 
> > > > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > @@ -361,6 +361,14 @@ Initialization
> > > > [ ... ]
> > > > > +    .. note::
> > > > > +
> > > > > +       Decoders that set the ``V4L2_FMT_FLAG_DYN_RESOLUTION`` flag for
> > > > the
> > > > > +       coded format will always emit an initial
> > > > ``V4L2_EVENT_SOURCE_CHANGE``
> > > > > +       event with ``V4L2_EVENT_SRC_CH_RESOLUTION`` during this phase.
> > > > Clients
> > > > > +       can use this flag to determine whether the decoder will signal the
> > > > > +       initial resolution before producing decoded frames.
> > > > 
> > > > [Severity: High]
> > > > Does this guidance conflate the V4L2_FMT_FLAG_DYN_RESOLUTION flag,
> > > > which designates mid-stream dynamic resolution switching, with the
> > > > mandatory initial V4L2_EVENT_SOURCE_CHANGE event?
> > > > 
> > > > The V4L2 Stateful Decoder API requires an initial
> > > > V4L2_EVENT_SOURCE_CHANGE event during the Initialization phase for stream
> > > > parsing, irrespective of dynamic resolution support.
> > > > 
> > > > Compliant drivers like coda correctly emit this initial event but do not set
> > > > V4L2_FMT_FLAG_DYN_RESOLUTION because they lack mid-stream switching
> > > > capabilities.
> > > > 
> > > > If userspace follows this documented advice, wouldn't it erroneously skip
> > > > waiting for the initial event on these drivers, potentially breaking capture
> > > > setup
> > > > and stream decoding?
> > > > 
> > > > --
> > > > Sashiko AI review · https://sashiko.dev/#/patchset/20260608-flag-dyn-
> > > > resolution-v1-0-44dc65516148@oss.nxp.com?part=1
> > > 
> > > Hi,
> > > 
> > > Thanks for the review.
> > > 
> > > You are right that the V4L2 stateful decoder specification states the initial
> > > V4L2_EVENT_SOURCE_CHANGE is mandatory for coded formats that contain
> > > resolution information in the stream (Initialization Step 4).
> > 
> > Be aware that Sashiko is an AI bot, llm words things with extreme conviction,
> > and it this case forget about backward compatibility from pre-spec.
> > 
> > > 
> > > However, in practice, GStreamer's v4l2 stateful decoder implementation uses
> > > V4L2_FMT_FLAG_DYN_RESOLUTION to determine whether to subscribe and wait for
> > > the initial source change event. The reasoning from the GStreamer side, as
> > > Nicolas explained [1]:
> > > 
> > >   
> > > "
> > > https://docs.kernel.org/userspace-api/media/v4l/dev-decoder.html#dynamic-resolu
> > > tion-change
> > >     Says:
> > >         Not all decoders can detect resolution changes. Those that do set the
> > >         V4L2_FMT_FLAG_DYN_RESOLUTION flag.
> > > 
> > >     So normally that wording should prevent requiring an initial SRC_CH,
> > >     or emitting later SRC_CH. Your driver don't have this flag, then your
> > >     driver can't emit this event. But a measure we should take into
> > >     GStreamer would be to not register (or mark) this event."
> > > 
> > > @Nicolas, could you elaborate on why GStreamer needs
> > > V4L2_FMT_FLAG_DYN_RESOLUTION to handle the initial source change event?
> > > Is this something that should be fixed on the GStreamer side (i.e., always
> > > wait for the initial event), or is the current heuristic intentional due to
> > > legacy drivers that don't emit the event?
> > 
> > The coda source_change notification is completely fake. It does not dependent on
> > the bitstream content. So the event is left there, since its kind of part of the
> > ABI, but it does not behave like other implementation, or pre-spec drivers.
> > 
> > So what we do in GStreamer, is that for legacy driver (no
> > V4L2_FMT_FLAG_DYN_RESOLUTION), we pre-allocate both queues, based on our guessed
> > dimensions. If it happens that the conformance windows is small enough, it often
> > works. DRC will only work if the display dimension changes.
> > 
> > For any modern driver, that implement V4L2_FMT_FLAG_DYN_RESOLUTION, we strictly
> > wait for the event, and on DRC, even if the display resolution changes, we let
> > the driver tell us when to actually reconfigure. The legacy method was kept to
> > not break coda and older driver, the new method is a lot more reliable, and
> > avoid allocating twice the capture queue (wrong guess).
> > 
> > The userspace implementation is also a bit more flexible, as normally the legacy
> > way should kind of work for any drivers, and we still subscribe it seems. But
> > the implication is just strange and shouldn't be needed in drivers with
> > V4L2_FMT_FLAG_DYN_RESOLUTION support.
> > 
> > Nicolas
> > 
> > 
> 
> Thanks for the detailed explanation of GStreamer's approach.
> 
> I have a couple of follow-up questions:
> 
> 1. Regarding coda's source change being "completely fake":
> 
>    Looking at the coda driver code, its seq_init_work does parse the
>    bitstream via hardware (SEQ_INIT command), and the source change event
>    is only emitted after ctx->initialized is set — which requires the
>    hardware to successfully parse the stream headers. After the event,
>    userspace can call G_SELECTION to retrieve the actual display crop
>    rectangle parsed from the bitstream.
> 
>    The limitation is that coda requires userspace to set a sufficiently
>    large resolution via S_FMT(OUTPUT) beforehand (since it validates
>    stream dimensions fit within the pre-configured buffer size rather
>    than updating G_FMT with parsed dimensions). But the event itself
>    does depend on bitstream content and carries useful information
>    (visible resolution via selection API).
> 
>    So it seems coda could work with the standard init flow — the source
>    change event is real, just the information delivery is partial (crop
>    via G_SELECTION rather than full coded resolution via G_FMT). Would
>    you agree, or is there another reason GStreamer treats it as legacy?
> 
> 2. Regarding s5p-mfc:
> 
>    Interestingly, s5p-mfc sets V4L2_FMT_FLAG_DYN_RESOLUTION but does
>    NOT emit an initial source change event. After SEQ_DONE, it simply
>    transitions to MFCINST_HEAD_PARSED state and wakes up waiters —
>    userspace discovers the resolution by calling G_FMT(CAPTURE) which
>    internally blocks until header parsing completes.
> 
>    The source change event is only emitted during mid-stream resolution
>    changes (RES_CHANGE_FLUSH path). How does GStreamer handle this case?
>    Does it timeout waiting for the initial event and fall back, or does
>    it use some other mechanism?
> 
> Overall, I agree that using V4L2_FMT_FLAG_DYN_RESOLUTION to unify the
> behavior (both initial source change and mid-stream DRC) is the right
> direction. But the current state has some inconsistencies:
> 
>   - coda: emits initial source change, but does NOT set DYN_RESOLUTION
>   - s5p-mfc: sets DYN_RESOLUTION, but does NOT emit initial source change
> 
> If we want to document that "DYN_RESOLUTION implies initial source change
> event will be emitted", s5p-mfc would need to be fixed to comply. Does
> that seem reasonable, or should we take a different approach?

Hi,

I'd like to follow up with a correction regarding the s5p-mfc driver.

I apologize for the confusion in my earlier analysis. The s5p-mfc driver
does define V4L2_FMT_FLAG_DYN_RESOLUTION in its internal formats[]
table. However, the vidioc_enum_fmt() implementation never copies these
flags to userspace:

  f->pixelformat = formats[i].fourcc;
  return 0;  /* f->flags is never set! */

This is a bug - from userspace's perspective, VIDIOC_ENUM_FMT always
returns flags = 0, which is why GStreamer treats s5p-mfc via the legacy
path.

Looking at the driver's actual behavior:

- Initial resolution: After header parsing, the driver wakes up the
  waiting context but does not send V4L2_EVENT_SOURCE_CHANGE. Userspace
  discovers the resolution by calling G_FMT after STREAMON.

- Mid-stream resolution change: The driver does send
  V4L2_EVENT_SOURCE_CHANGE with V4L2_EVENT_SRC_CH_RESOLUTION.

So if V4L2_FMT_FLAG_DYN_RESOLUTION is defined to cover both initial and
mid-stream resolution changes:

- It should not set the flag - because it doesn't fire the event for
  initial resolution.
- It should set the flag - because it supports mid-stream DRC via the
  event.

Neither setting nor clearing the flag accurately describes the driver's
current behavior.

The more natural fix would be to add V4L2_EVENT_SOURCE_CHANGE for the
initial resolution case as well, then properly report
V4L2_FMT_FLAG_DYN_RESOLUTION through VIDIOC_ENUM_FMT. If all existing
drivers that support mid-stream DRC can similarly be updated to fire the
event for initial resolution, then perhaps the spec change to split the
flag isn't strictly necessary - drivers just need to be fixed to comply
with the current definition.

I'd appreciate hearing others' thoughts on whether this unified approach
is practical across all existing drivers.

Best regards,
Ming

> 
> Regards,
> Ming
> 
> > 
> > > 
> > > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5126
> > > 
> > > Best regards,
> > > Ming
> 
> 
> 

