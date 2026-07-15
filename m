Return-Path: <linux-media+bounces-67606-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id frhOGkX9VmoXEAEAu9opvQ
	(envelope-from <linux-media+bounces-67606-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:23:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C8C75A423
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:23:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=CQzlVX6K;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67606-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67606-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DF223050DAB
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 03:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BCC390614;
	Wed, 15 Jul 2026 03:23:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010058.outbound.protection.outlook.com [52.101.46.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC6837AA97;
	Wed, 15 Jul 2026 03:23:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784085823; cv=fail; b=PFhpTrvQHsioBi44EBL3uBsW5aBS8rqwK0RyJjv237scB7Wzo4fLki9c72ujEOCIwQKESuGGgralp2DZTictuSXKbGa8TUw0hczRruPd6sS4uS4HNu/3HbH2YmyUAmdgxQXLxhspfr9hpkGHAQDkmZm9GHNRQ3URU2wT3iJtbqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784085823; c=relaxed/simple;
	bh=qN0w4YRyZXRTsTfM0d5qW8jIykiYzI6AM/nni058YMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tusmupwj28zAmSKhT9p5huai8kYFjEwNYPDjcoaCGbw7+nYRdtByzxe1HMUD6pN3lZhv0oPeTcF6P/dtM71wGndJXLvuV6zSgX42BYpvzXK9ELmx5EY8HW5/CXIzer5kokje728D0nUvxrANWQHCWMB9zMmncANsZHpEKdlBVzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CQzlVX6K; arc=fail smtp.client-ip=52.101.46.58
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OA76dcy5p8bjxZd3eHrKRaLFtIaOwinsrPV+jZluYuHN0u2MA9NfzRxsAHx0kZFv2QpcLvDfsCTewA09U1DSOtkzmSnxu9SFY77SqzbdJ79R/wtqd8TcsdsdvrZ7niOEZ7q7OzrPVVR9dcg5Gtv532cJ3H4+fwUrjIjPDIgwRggePmZvzcV9wgYL1eZ5lZNzoJONbhhCdI+H5BFCH2viSS/XUhmrYyJPwAjAUPxCpa5mqBY/RXVlNoFwrmxhThKswehUEBw8n1ko85oE+ILs5nadNDIkWynkPTMT3rs1D7xvnQwcEKtKYy+CpuA/Gj/JXsr5COWBsPHHzt83RmT6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STugczWrUNZu+RiGdKjTXycIx+FPY9P7KAg80jnc+qY=;
 b=J8ewdObX+TzB1l4pRCn5GgvGQo7UTjWAqt6bjmqwD4xWbxUtQue7TlmoVEyqReR+j5uzA7jBqbnIUg2LGKxpb+Nm0ReNoFXS3uyEGhayutX19fsLK2QR/fEjY9+UXql1Kp6TqUCRHOkvoktet2c63s5/UHclXetThUhIXtbi3p4yOZ6xeu2lsHjPZnHYt06atOrH7qnz6FuyD9qXVaMjOcTSKH1Rox/ZxL7H/fZb8HppAG7CZO1Fd+41UGC4utgq0VJrCTD/QsL6zjahOzrzLumxg2MjSYy1RtQQ5M3L/nH2Fef1yPY8uknk6Ss2WwXKf8DhlTe8NGozSW2KwwHBLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STugczWrUNZu+RiGdKjTXycIx+FPY9P7KAg80jnc+qY=;
 b=CQzlVX6KwzctaOS4hXbPOWgiHZJ2zIs/f1N3r4thytyVRt6D/TicOII2pIVk3qOxm74DYnYpdBp9dJidh0DUnGBfM6c82BGnFLFmu/N67KJhqpEuIAusFvWv7OQIPaQ3BaNxU1ROB/R0zjFlScg1Jr6VjJPewssouVF4xUd40Gz4R6lVvEZ4EOAr+WPAS7OFpNZvb2m0039P3sDoHHoAb2YLoFQ6x8Otlme1dNBH4vjOV9JOu5J/vGy/fRzgXDb2/R/wfG8s8QSrBeesaLihadqhL+1NXOoGFQvsRnfyMR3pI1MQqGG+8u+p+LY3/ol9BA3W7fF2XwTu56qWXSpq2g==
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 03:23:37 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0181.019; Wed, 15 Jul 2026
 03:23:37 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/2] media: cec: tegra_cec: don't break off msg on NACK
Date: Wed, 15 Jul 2026 12:23:33 +0900
Message-ID: <WqURKHqjRKyXoPKn5biymA@nvidia.com>
In-Reply-To:
 <7e50d6027e1676650d52905cd20eb212c01cd3e5.1783677198.git.hverkuil+cisco@kernel.org>
References:
 <cover.1783677198.git.hverkuil+cisco@kernel.org>
 <7e50d6027e1676650d52905cd20eb212c01cd3e5.1783677198.git.hverkuil+cisco@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY6P301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SJ2PR12MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee54600-5b81-4b36-8bc1-08dee2207588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jwkTDOif4+14Hc4+8KrlptgWLljVtLG/LrKPHFILECTkbQiqAJKHvD6BRpEDnte5kb58f4WiJ7GLSZo3vhZat91rbV1XOfsvxh8+GfIeIq7Vgd3c9owaO6peAQi7tFSczOcKTNp7YtXHT1Q9dTtILFO41W1Gz9/MVXPUd8wJlGFVMjqjkBysofHNWhJpc5eRoqDj4ffz+n8uzrVBmjRI2uw+C0bYLsJHvMLSEd1kv98akyaLPeYQCt9QwKOJY05cr40UyVS7Nrbs9/R2FDeNOsd84veG9bZ8r36FJflWsh5tgsmeIVb/SG/yYobv1s1X8YbmhUD5OfIzCtwi4fj/Dvp2g8lZ6DRMT7YfAExEIGOGOpHOwYjFdfgvx3bZGdLilAmaNwvzwvFBRQKG1OFtwKZlWLJvxd7wvNNgey0eSfa5UQtd6TiU0iOzv/W9YQ1dpEGmLJg3uxMX9++F5++ydFeu2Wl+dWZFWmfNNCGAOPB5vN2ennMyI1E5ZbYotPV+0WjAH0OUc0BMSKjYJXslA7ofYDn/xejMuBAzlyWPjPfVEz+2+n20sTQcP5CTH7W2RCqAXRadS83KJna+fxRnzt+NuPMTkxUFR2WGpH3ox+Sc2UDzGUJr9cnj6uOwvXzEcHnWGBO5D0rGNffelvZowHWm69G8uOHtEdqkVmsb+Vo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFdXOWZlSi9td1F1TE5zRzUrWjlBMG9BWkpaQnJVRDdUOTF2UlJFa09iZTUv?=
 =?utf-8?B?ZGxWVlpLRGVGQzFkbkxOMENySmlWQzlmb3lFalViczZDV3JqcnFmbmNKektO?=
 =?utf-8?B?dzFRZWVORXdGdG9yT1dQVFZqb09rMW1NMmNtb3NoWE1ZTjkzbHB0T2pRRkky?=
 =?utf-8?B?UHNJVHhvVGVjSmE0UFhGdTJTR2Z5VFNKQUV2UGlVd2d1OE5ucFJSc1NWMDJM?=
 =?utf-8?B?N1NSalZJeng0cTdOUm93K1ZOQjFJMVU3MzVlWWtvZ0pyczlPVHpuazkvKzg5?=
 =?utf-8?B?VHNNQjd6MVFJVktodWRvTGg1M3JFQ2RIMUphNTBmQlRlSlhBcTJDcXFXd2VY?=
 =?utf-8?B?TEVacHhZUXVGUmR1WnN2OHZNUndrTHlFTEtBL1BwU0w4K2U0bG1zS3VtSnZk?=
 =?utf-8?B?R09zYTdiQVJxWThSMXpSMEdiZmdTYVZMWWN6OTl5dEFmckJwMHRGTElGL1dP?=
 =?utf-8?B?cGR1dHJGcXN5V2pnNTZYOXc0TzRab25STVJ3LzY5U3QreEo4cXJRalp0WFgx?=
 =?utf-8?B?M00vdExkNW9aQTU0OGg2cnErYkNGVTh6dDYya1lSeUNuZmxjcXh3OFpXL3NT?=
 =?utf-8?B?Ulk4T1V6M25jbStKWEdVQS9qYXR5ZHo1SDdzYTBUNHE2NW5aRnBzTEhYMUhD?=
 =?utf-8?B?RjdLUWFURWZyV0ZMVDMwelp0SXhRazBqUy90U2tRaGY4TGwvQlp4UlZQWisy?=
 =?utf-8?B?UlN1QUlHbVBwOVkzZUN2UFZQekdOalI4OGpXT1NJQVkrUVRudDJmc0ZRazc0?=
 =?utf-8?B?ajRnLzlmdW1RSEUrSVE0QnUxWmswN1JLc3NyV2FwZTV6TXV4cHBOUTJDYnps?=
 =?utf-8?B?ZUo3Y1VSbitZU2kwd1I2TmFzNlNBRlZ1a3h6QUR5RUJlWnMzcTFEZXZPTGsw?=
 =?utf-8?B?MHRmbHBSYUVUZEZOM0RTVU1OZS9EWmRDdHlKTC9WSllJN1YzU2tWTFVjYXM3?=
 =?utf-8?B?c2pxV3lQNGNmOSs5eXJzUkcvdGdSY3ZNWGhMVmIzelRHbHlHN0xQOEVUbGd1?=
 =?utf-8?B?QkZvOXovWDhMK0lRNjRObGwrdkxBekxxdXZrbnpJMFdobzRNZ2dMMDFrSURF?=
 =?utf-8?B?ZU9SUEpOcldiWStyMFFPVHVCVklkSVNZdGo4cWFZdUFIRWVCWUpHcmZjNVRY?=
 =?utf-8?B?S09HRFFNMzFVbWdDKzVwZ3MwMkVlYTlqSnN0UXZ4YnBTUmRETnU5UGE2L255?=
 =?utf-8?B?NHJIaXlmZGNnMWpwQlNnSkYrSkdTVXNDSEVqbmQ1ZFcxd1lONXFBbXA5UVZT?=
 =?utf-8?B?ZVdtOVR5VWlxWng0dGZQaERxaGtiYTkrcEdpNHVLaWM0cytuUm8weDVzVFB2?=
 =?utf-8?B?aUZjNW0xTUh0RXRyWHp0WXZRdUtWUHJCT0Y2TFJnYUZQT1FwakdXMXBldWFv?=
 =?utf-8?B?Yk9OUVFyeUM5Z1poYS9ReGk1dTBrWS9idDA4RTh2Skpla1QvRk1EeExCZGdo?=
 =?utf-8?B?d1dHay9kdy9RTnlTY2FZN1F0aUwzSXJLY29pRkk0NUd6Vy9PcFpmYVdFOEdz?=
 =?utf-8?B?b3hyRmYxeHpLY2s2UHRqdHFkN1E4ZSt6dXpSTlREcHl1NkRqdXgwUDhwN2w1?=
 =?utf-8?B?Ris0cDFyM1RJdm5qeWZWUVhoK0NYRzB6cmV0amZuRkFNZGQybGZDN2dveEpq?=
 =?utf-8?B?Wm44OERZOGxINHBSVUpuM3M1USs5S25LeGVmRGpDK1RydU1WdU5GZ3gxM0pQ?=
 =?utf-8?B?cDRlNmFhdjQ2NUdjVC9HVUFnR3pxVGZGaDI2d2xFOTA1OWdJY01HbjJFT3hO?=
 =?utf-8?B?TnpIelpJMzBlYm5WOWVHdExOZmpYQTBhNWtaZDBDb1BBSVpVWnBhSTJkaGRZ?=
 =?utf-8?B?TU9EaGdvYW50cnlsdVZCbUpldDVWcU5hVlZ1L2diZnZyUHA2WGs0QnIrWERo?=
 =?utf-8?B?VmdTdm1Yc1NCUVZTaU5uMXh1WlFpdWFNeWlTSW9pZi93Z3B2NmwxRnNsUzZj?=
 =?utf-8?B?TVVkb0VlV2lzcERkREdCMFJuZEdIc3JTdVpFYVpncUhVOFFGaEdlZkRLZEdm?=
 =?utf-8?B?azA0d2FHcmVQWWl2WFdqQXYzU05xcUVjWDVYemIxdm9xWXNSSmFTdXhYU1M5?=
 =?utf-8?B?NGVNYmtSejhrd051NU4rU2dieFBkbC8xcDZPTFh4WnRQQWJQR2xFWDM3N2xM?=
 =?utf-8?B?TVduWUM1cysyQVVQYWczMXNSUk9QRFh0anRHM3JmQXRIelhJVUkzQitNMVl1?=
 =?utf-8?B?aExBYnVueGJUckJJL3pmZXFwVXNscUUyaGtCQ3ovL0YrdkhTK1lMZ0IwV1Fm?=
 =?utf-8?B?bVpaTFAvdWFBek42V1FiVVVqczNJbWJERk5rWGJpL054enArOFdDeVlTYVVa?=
 =?utf-8?B?TENQYy93TWF0eXpLeU9YdXAxSTdjOEt0eC83TEp5WGhGbzdacEdVWHRuVFRo?=
 =?utf-8?Q?FIUtXLEE48WMzSfGO8WEYtxsvOcy/2e8PTTz2HYvX/d9X?=
X-MS-Exchange-AntiSpam-MessageData-1: 7Ba1534CbX/pDA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee54600-5b81-4b36-8bc1-08dee2207588
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 03:23:37.3429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQFtRMcR12EbplVSY1InLnT68PvTWvL8HNnOtDLSZhItsFqcnBDyR2HT636qM9n+iu5SMTtiKTo7T5h1eyeSRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.66 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67606-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:thierry.reding@kernel.org,m:linux-tegra@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,vger.kernel.org:from_smtp,nvidia.com:from_mime,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01C8C75A423

On Friday, July 10, 2026 6:53=E2=80=AFPM Hans Verkuil wrote:
> The Tegra CEC hardware has a bug where, if the first attempt
> to transmit a message is NACKed so the transmit is aborted,
> then the second attempt can contain corrupt data.
>=20
> Ensure that the full message is always transmitted to avoid hitting
> this bug.
>=20
> I suspect some internal state is not reset in the case of aborting
> a message due to a NACK.
>=20
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/cec/platform/tegra/tegra_cec.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media=
/cec/platform/tegra/tegra_cec.c
> index fe66336e734f..f8ffaeb78118 100644
> --- a/drivers/media/cec/platform/tegra/tegra_cec.c
> +++ b/drivers/media/cec/platform/tegra/tegra_cec.c
> @@ -243,7 +243,18 @@ static int tegra_cec_adap_enable(struct cec_adapter =
*adap, bool enable)
>  		  TEGRA_CEC_INT_MASK_RX_REGISTER_FULL |
>  		  TEGRA_CEC_INT_MASK_RX_START_BIT_DETECTED);
> =20
> -	cec_write(cec, TEGRA_CEC_HW_CONTROL, TEGRA_CEC_HWCTRL_TX_RX_MODE);
> +	/*
> +	 * TX_NAK_MODE ensures that the whole message is transmitted even
> +	 * if each byte is NACKed. Without this flag the retransmit of the
> +	 * messages after a NACK can be corrupt. This is a bug in the hardware.
> +	 *
> +	 * While less efficient, in practice you rarely transmit messages
> +	 * that can be NACKed, with the exception of POLL messages which
> +	 * are just one byte anyway.
> +	 */
> +	cec_write(cec, TEGRA_CEC_HW_CONTROL,
> +		  TEGRA_CEC_HWCTRL_TX_RX_MODE |
> +		  TEGRA_CEC_HWCTRL_TX_NAK_MODE);
>  	return 0;
>  }
> =20
> --=20
> 2.53.0
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



