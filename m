Return-Path: <linux-media+bounces-67605-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wshDIR79VmoOEAEAu9opvQ
	(envelope-from <linux-media+bounces-67605-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:23:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FA275A416
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:23:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=OI7Z3h96;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67605-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67605-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08B1A3052677
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 03:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BE23921DD;
	Wed, 15 Jul 2026 03:23:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011006.outbound.protection.outlook.com [52.101.62.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B04C3655ED;
	Wed, 15 Jul 2026 03:22:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784085780; cv=fail; b=U4d+w7TpN802oRF8DnTWQQUGuRUitWtRvtwfFVmIs1jMJ3RKPkARKj0ZwdCqmdcQMEQyeVAE3t3KTnAT5GFZCZkMOl4Hy93KsT3M1FPLxjKmVP0xiLNJ91lVVBft1o9ABE3QSk77TPgrWcEtr5tNXBQpqyCQGVjPPeDDbNnYjeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784085780; c=relaxed/simple;
	bh=WObcj5JXz21M3xJz/qmh6PztEqNVMyqWmPHctfG1HXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iHGXle5MUOuAa/yPa0HBuhveMff59wquoZkt4nQ6KtHLfP1va9lsksqYeePoLMRD6Rc1j6E9BwBRFBl1q2xSRGpllDi7b/q2ZS0fTKiUavTY8rzPFrhww80ohbNwhYeTtBhbKQmLZFdk3X5zKqMoCZdWwRFzNC03eJpNYGBWHPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OI7Z3h96; arc=fail smtp.client-ip=52.101.62.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OThv4hUwp3wT4wdd7hCFOUXGa+Wgco9xtnWa/pkTgjW7Ox4zVHdJ1MTXm3Kbe74NbZQfTxslf8Mry9KBBD5N/6yXskAhgzsjHwkXw8BCJlpY4vUTh6q59Mbv+SggIFnjlivT5blbvhHAk4yhcssWU0DmC8jfrqkRUftCQ9vWTWxqs808pDIUnLoK4LXdPqgPP/skIUvM78sVZlD92KKJ/tTaxCnlN6DlVqZRwTV5+3DKH9NnjUUvIx0e+F7t9zIXdOjkyfjhLxIQVn0/5RV3R/lu0EtVNnFlhXFqz5+Gdbnpriz+HyZYSaFvH9RO+8MhTsYjckfJvieKHj9V9duwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ji2tjp+begn8J0SpZIM/0SXfflqg697rNhMld3VoGwM=;
 b=vordc3kLvKFbWV7K9klZGNTSwAjOpiH28vGvFFbFOkcub9OVgIPPVIFMnDXy5Mwp41An7+ewwbqEWakqmuPVh8TF3m2o7hxoBDlN6sZmIVInFtgyqzLmHbJklaP1pYLIKFNXExygH3sCSKO/9O7P2XsF/ZStCXt6tfsbLdCXwzGHIJJk5/xCrUWGtw4DZMjVHfbEk9WIkAsTLJ9Y/C1BpBakIJhuC+eNsrNeNKPqgJB9xS4kC4rbwnSYAYsCutr1D1XbKHVIrwMPhXwv/3S/SF81pycvmOVNvbux47+PawTtF+C+GUqdgqnx4tqZV2sxDbwStCSCYMRMxa/P49kOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji2tjp+begn8J0SpZIM/0SXfflqg697rNhMld3VoGwM=;
 b=OI7Z3h965skIb30TojZ2sd/fjiG8Ydgj+Jwr11hSrg+V22ZWLNXs46avw6kbdg9AMNdf3QUnR6Gz987K3PLoiotjuRdYW7vb3sgGACKCmZjq1/uaBM6zz1HgnP/t56SVFlRuykEWgVEQsbpNK3JQwo83Aq1L1aC+Rok1pHDJ7mEQZowPu7jlO3vet2qY+Wk14e+ydB5gZCMsBhD6Tp9dshWCPHaFNP/hVUvwaOSmbt5V0fKDogZIreAlwYt65tjhBj94R0BHRxs8zoJi18LJczygTmSUgmmwuD6Rr97gSAgCOaZ1ETyMxqCJXaSU1ZALHqh5byEIzhA7mu7GV88bSw==
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 03:22:52 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0181.019; Wed, 15 Jul 2026
 03:22:52 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cec: tegra: add missing MODULE_DEVICE_TABLE()
Date: Wed, 15 Jul 2026 12:22:41 +0900
Message-ID: <vXLQ4111TZypjJzW5kly4A@nvidia.com>
In-Reply-To: <20260704122631.99057-1-pengpeng@iscas.ac.cn>
References: <20260704122631.99057-1-pengpeng@iscas.ac.cn>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY6P286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SJ2PR12MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4db981-83ec-421a-ceb9-08dee2205aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3V+6npObC+UFVB/iTGKcVSbJNLfA2l9KguHNHZHzM75+83d3Ia4Ee4JHZyZ+DkeFT19O7SSQdGeOZ46+OOhUGbioCREXowk/x+ouM+vPGfg8cz8/9L9ex2CpXfR8cioDZwpBHWVBrQDzvuXa75YP5kc0YEvBqXlcd566tqHUilXff7Qb8ha8iDFnB53IWGwAgDay6dXmrqhGKg4AUqbGrkSEcv1RV8NVyLQkPRXqu1ZNR97tO9ulsPaxbz2ibPzWrM/E6do3cCHIZ/8rilzEKyVvkClABkSUKiIFCPPMl3k1ZG1b7q0JqXzmo334yn0WmZL5PZX9WQUEuECvOguKtQrTvVe+lciw2gkB1qsNdsvOf9jGAdw+oUdN/h01yo4CKzM67GAkPgMNCdl90TJcPzvZhdFt63a5eu68G3WxdajEXkNzgc8M+WziBiz60myTrkf6fCkAp4otkVa3GVbieGWKhFoaFebqMz88Sa6MfsAxlIaugLgkYW/fefWXX+Un2uw7O047bEUgHMPT0a1y/10JS1Ec63OBI5NMXJhquIvZ4mW1tXeDVFoxm+VlM/aHvLIFSx04p3N2iBOH0OUFwxPkx7GWp9QGMW7bqrHWR2OFTZs+8RiWUsmOBOXirrh3RtmQSKvS/H7TEmWlPh4BUVrI7BBMeJYXj5T60TeiS7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MldsNnNSeFU0aVUzUnJickNhZEh3R1Z5QTZCVFk4MUo2b2RuV0NzWVlmTkxi?=
 =?utf-8?B?U3hXSWY2ZzZIYmN0Q3VuUDBXUnFiVDVpRTRPWnZDN3JmQWgvTGp3cjMva0wz?=
 =?utf-8?B?MEJ6TXdvaEIvZXluQktpUnF6UDdlVmtpTFVpR011VWkwamF4MlIvYm9RbU11?=
 =?utf-8?B?ak55cE1YVFBNdHFYTzBabHRiVkt1VjhFZVB2RmZLTWFnUFpTbnRMZ2ZTUlpk?=
 =?utf-8?B?VDIzdDdzTjhTeHhmRVd3Y1RVd3FjRVRlUkVkV0ZBNzI3ck1JVmJRcFVJT3Z6?=
 =?utf-8?B?eHVtWkpvOGhGVFh5Yi9XWW8xZmhGdVVQV3NmWjZKUUMvSnBNTU5wWkRLdzZC?=
 =?utf-8?B?aUJ0WjV5VjBjaDVSckNyYklUQmpFaS9XMy80QUFkejNtekZISXV5dU1YMFhF?=
 =?utf-8?B?OXJhQXhQU09EbjB4dEVpRUdYN0d0c3RJNjcxUjdXZnEvWWQxR1F6Q09yNm84?=
 =?utf-8?B?aEtjTWROVzBzb1ZEbTZFaWpaeGs1MUM0RDlmMWFqK0Y5VVdTZjViTjdNTGp6?=
 =?utf-8?B?TUUzdG9wQnNjWGZ6VktyY3A4RXZDWjlHR3RtL0RQdXhSWTdoV0xQK1F5S25K?=
 =?utf-8?B?eFRwajd2Skh5Y1NHK1V1ZnNINzVjYk5ZOUE4ZTV1WWZUc2QwdnUrSnN5dUY3?=
 =?utf-8?B?eXp5OG9qb2FlY3RxQXBkem9rU1dvMksvN0YrVzN6akp2NHdFRWdCMXdQa211?=
 =?utf-8?B?d3k5ekRlbHhzeUQ2WkcxdTNueHNyZko1cTE5blRWRWVwYjI1Vm1meUd4bkkz?=
 =?utf-8?B?ZUNrZUVPeHQwZk4wOWJZZ25PNFlReFFiN0gvQTF0UDNOd2IxaFJIMDNpVUJO?=
 =?utf-8?B?Q1k4b2tjT3AvTUdoZHdxaFp2VHUzMFY1NHdkT0RyWW1Tdmx6VTBweXRxbWdU?=
 =?utf-8?B?VEFVSFdya1h0aHhSU0Z1aTloY0JMNWxOSDJPY2VTY2srb2tBODU0Qi9LT2Nv?=
 =?utf-8?B?UWNrRDlCQXExWUNxMGt6MWtzSjdxZXRxQ3hQcGFDS3N6UGNyRGp2bVZxanhB?=
 =?utf-8?B?VEx5Tkd3aHpybjNHUllVeWJ4S1ROdGllK0hxU2hka1JoWmk1eDBXVVdaYXhC?=
 =?utf-8?B?MHJ5QVF3cEtHbnhMaUpzYStoQTFJeW0raGVFbVE5ck96NmJNOStOWkgvU0dG?=
 =?utf-8?B?T3UvREpIeXZ5aUw1bGh5YnhiYmEzblpaV2I0SmtrRjlWNTJ2Mjc0VGxGV0Yx?=
 =?utf-8?B?TGkvNktFSWFzOHgyZUxvTXRrMUd3U0oyTzhtcFBpblIyM05va04yN0FuVG45?=
 =?utf-8?B?MTJRUEtSVnJ2TEYxbVVYV21jU0xXS3VTRTBPb3NEVHJmdWpIVXkyQnRQMS9D?=
 =?utf-8?B?eGZUQlVZWURSV0RVR3JucWJ2dkM3a2JJMDQyWHJsd21SQnQ4R1Q3aHhJbTRr?=
 =?utf-8?B?UWhrSDZyTmZvSllTcENwc04ram1Ta3NlaGJ0RGdqSmxEU2tJYlBoNFpaMytK?=
 =?utf-8?B?bHhoN1QvVHhUQzI4cTVvTTRxb05xcTRFdHBySDJnYWZ4OWt5ZG1HWlZaWGt5?=
 =?utf-8?B?bnQyVWRNc3ozaG9uOGtvTllMRlB1aUdQS0tMWXFIeXR0U3hrdWxRVjVOTHVQ?=
 =?utf-8?B?UEpoT0JmT1lXcUh0OU8yZUZvK01CRjhpaVhLSGJZWCtHeGk5bDlmWkVBMnc4?=
 =?utf-8?B?YUhRY1JLbzg1QjZNQS9odktWKzllazBnL094YXNDQWJhalgxQUJkMEF2N3la?=
 =?utf-8?B?YitFRnFpcEhLMkt5dU5KVllBdXBiTk0vZ2xpandlTXJVeVhSNHRaRXJKRUFV?=
 =?utf-8?B?dlVSWjlZTzF6eEU5UlA4QTBGemNSK1BIMHhoVjBtOUk5MTdndVBkMkVMRXFC?=
 =?utf-8?B?czFlNXEySm9NWjAxNlNxZlBsYjVxeVB1eDIzbVp5UEhpYjB6MHVvTWsyTmdE?=
 =?utf-8?B?emNXRDFkQmxST0ZtSEZsU0MwaldNREFHN0U5S3lUeXMrQVhiQ3RrMjFsbTMz?=
 =?utf-8?B?SVNJbXJVclB4aGlVQkk5MEhuMXJDbmRsSnVqa1RsNG4wUFJocU1pRE9MU1hz?=
 =?utf-8?B?UVFOYWc5MElJcTlDODIxREdSVm1MeERxLzFEZDdHZllwMFZnTUZIZ1FEK1hi?=
 =?utf-8?B?UGx0Z1hDeUkxY1dvdVVXYWE4NTJDcGZZdkhxbU1Bc2Nwa1pCYThScUxCTnVp?=
 =?utf-8?B?L3E4RW9aRnQ1Wk9lWGJ4SWhBSzZjMlRFUzRGdGJYOVlzK294SUlyY3ZFT1hS?=
 =?utf-8?B?VmZPWkpDaDZvN3laY1J3Z2NENkV2RkZEVm5BZFJhVW9TZm9HT1BXa1RJUm11?=
 =?utf-8?B?eFdTQnhYMXRCZjdialBqSXpPSW5WNXorTmk5S0dUVFBRNHd6cUMyWWhaSGp2?=
 =?utf-8?B?VmNLQkNXczRVZEUwVjMzN2ttNVlhR2tVdzJSci9aY2FNMG05aTMzMGdWMXRC?=
 =?utf-8?Q?ec1NfgxpFGlhVqYu1xLTzyXRK6ARz+8yfmEiFwEADufgR?=
X-MS-Exchange-AntiSpam-MessageData-1: 2ViNxRJnMuTghw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4db981-83ec-421a-ceb9-08dee2205aa8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 03:22:52.3410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBAAbF+YZCRv9tb/EQXdmlZD4dfZuVEenOYPFGs9fiZsmI5Fdua1jKfPP4xsb1TCzgletVtJsodRLl48iFQXlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.66 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67605-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:pengpeng@iscas.ac.cn,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:from_mime,nvidia.com:mid,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7FA275A416

On Saturday, July 4, 2026 9:26=E2=80=AFPM Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
>=20
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
>=20
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.

This paragraph doesn't belong in the commit message. Below the three
dashes you can simply say that the patch is only build-tested. No
elaborate AI patch justifications necessary.

>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/media/cec/platform/tegra/tegra_cec.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media=
/cec/platform/tegra/tegra_cec.c
> index 3ed50097262f..fe66336e734f 100644
> --- a/drivers/media/cec/platform/tegra/tegra_cec.c
> +++ b/drivers/media/cec/platform/tegra/tegra_cec.c
> @@ -458,6 +458,7 @@ static const struct of_device_id tegra_cec_of_match[]=
 =3D {
>  	{ .compatible =3D "nvidia,tegra210-cec", },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, tegra_cec_of_match);
> =20
>  static struct platform_driver tegra_cec_driver =3D {
>  	.driver =3D {
>=20
>=20

Otherwise looks fine to me.

Mikko



