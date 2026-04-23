Return-Path: <linux-media+bounces-59428-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMeECrI16mk+xAIAu9opvQ
	(envelope-from <linux-media+bounces-59428-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 17:07:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9194745416A
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 17:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE3B830A4AA3
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F9035DA4F;
	Thu, 23 Apr 2026 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ffgt8QB9"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011069.outbound.protection.outlook.com [52.101.57.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC2285CA4;
	Thu, 23 Apr 2026 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776956513; cv=fail; b=CHx/MzX8/7h0UC6p29rLt8pG75XffnzySWCJEJ2z7pbU7mdTlVhPiILsEM8MkyXDdUp0Xtme1zEeKIyAj9LKAqsginoRHz8SXwLS1nF8F3D+mIRdXaaxRZmnmv8ErqOu8GWMOQEmnFNODEPPUxUwPt4Hp4SDRkLYFB+iUknQtUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776956513; c=relaxed/simple;
	bh=Op3ba7/sqncZeEFCJme1yA431OV2WNKdN25/AOa6xeA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=UcBdFW1fRx96AgbWx8p03Q/RG0Leo4bjGHaQdeK4K/JUiYX4LwlZcrI4BC81erBy0Xy6tUDiHGB5KtXRGF+91U7u62J2ouqJiV4IG8AbhDOZ4XrBErB3JpJIUh4dJ+bU2NDBCFGVIBV+Psk5LfiWaPDq68dTE/4f82I7TYvcI9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ffgt8QB9; arc=fail smtp.client-ip=52.101.57.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZK7Yu3gIgqDIvdetILvmNn8aMpqXMGga9mMvpFiU4Lvs4AuMqQ+vyAONil1NU8/YFdvwSrNJ1HoI7+hy1CKASkRtwoDVUCIEGaQuU3CgTDoGoSSjlz2nPrOA8eFaGiiPCU7N+DkmtWf96P7gROJTAt7WCXRRHRi1bTQUnvxLYLdaqSQv0X8ozKcQ49qiCp4SWo2mlw92G8aZo2F4dJtOzaeRh3yjbv8oUrjx0H54NPv111knwU7p51gtZNnlM0VyQBuci5D/5rYnzbcGfvZtHO+oujUQzP2px/79B5nUd4cChgh7//oLXvmpOzW+f61he7MGbqsk2o5STXjkzcADRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Se2cr73zYuDZrMy0gGi4qB4ITA6KTGzonu0RZjnU+4I=;
 b=grME9haISduVs5Oi+bJScVlTVq0wRXYfdohOVIGWAyyhxaMEOxxZ29cz9/5fYuEZh5RWyKP48g1X9k+XCBT6g7975kTv/nP82IqsB6Dqx5OrSovp8QlRYKzIhPnLfb+IN/o6zHtCp4zOVQXYg4Gw3NmCWl1Vwbglczu2c1FZH0DM+mnXc+GGEwKQuta2n3wegTk893Opy0WYiBgcv2Dkadv7FBhEldFRP44Ym5tO/6AnFsyEVhnhguaBvMBz8M699bvZy/Iee2T2RMl3Vjzp+BYSuysw+q1foUmoQQTb1fPXnfSy32s86fUvjdieuzScufuItg/dDiVZ1utQhnUEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Se2cr73zYuDZrMy0gGi4qB4ITA6KTGzonu0RZjnU+4I=;
 b=ffgt8QB9nVw2UUYNUOkzmasq/D2SUbXTHhjScPYm8/qXFRIOfpot+PxmdwsjrEcwC1MQP7O7vqWWX02iiMXmnhc3J5yMzYPgqrqTse/qfZqQfubesh/tT7TDBZLl4wngohJnXRGGyA799cHlTTJTzuM5JlTjaHqKV7CgrBFubHPtFV1E1KXpoTcOQTAhjyeo8xaRcissq+zrRJEVNkF/8AD00zh1eZt0lrXbIzAN61ja+vkJrfvrhbQ4qRuvU49rS5wvkN6wpUwNrQW0N5v/vIN9iVDfnZ2gU+DGg7CiPfjexnvM4PHD68AJHnlqebZGjk11Ti3lNGKN3e5DRryNlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS5PPF482CFEB7D.namprd12.prod.outlook.com (2603:10b6:f:fc00::64a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Thu, 23 Apr
 2026 15:01:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 15:01:35 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 00:01:31 +0900
Message-Id: <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <nouveau@lists.freedesktop.org>, "Gary Guo" <gary@garyguo.net>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <rust-for-linux@vger.kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Matthew Maurer" <mmaurer@google.com>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, <christian.koenig@amd.com>, "Asahi Lina"
 <lina@asahilina.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Boqun Feng" <boqun@kernel.org>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, "Krishna Ketan Rai" <prafulrai522@gmail.com>,
 <linux-media@vger.kernel.org>, "Shankari Anand"
 <shankari.ak0208@gmail.com>, "David Airlie" <airlied@gmail.com>, "Benno
 Lossin" <lossin@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 <linaro-mm-sig@lists.linaro.org>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, <kernel@vger.kernel.org>
Subject: Re: [PATCH v12 4/5] rust: drm: gem: Introduce shmem::SGTable
Content-Transfer-Encoding: quoted-printable
References: <20260421235346.672794-1-lyude@redhat.com>
 <20260421235346.672794-5-lyude@redhat.com>
In-Reply-To: <20260421235346.672794-5-lyude@redhat.com>
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS5PPF482CFEB7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 90323fa4-0463-485b-cca9-08dea1493665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	L3GUQcTPe2EJYgdGCoNKKvC/o5R0CRDQggz2D99yqialvsp4fU8TYBmPDMxoGMHfiHil5ZEql+9zu08uvZvVnEYVb0fsls6idKw1W1ZA7zZfTG95t1wG4En4IFViWzTiKoCA/ByMw40oWGbimom7AkIwHM1Eb0RyuUnFKvclmdonPT/MAhTcH1x+DCQ/b97W2qigSVUtvEsjRDAiUf+6mNgpke3bh7cCw5byefU8DBdJsncnmXb3/C2C8FHDcwhWpNbbkHOdFzjU7Zjo4Vr4forJAepMxfi+vfJOLxS5yLcQ+RaJv0xZBRMs80sQ9l9F/bWdSOmXWSka0o2faBvFTzbHPTveWgqfK2vAraTrWsWq5hy/WehszM63as50R6JwqCtR0fW69AGkzFzr91bqRNZLfgDlzFiprQb34fIkE/a3LAaEFnFUrda5xjAMTmsR0mG55mr2jMK83byMk068FKfpf+mwTK7V8MSAzMVNylPIqDLwuhwi76x4xIBDQsq9c2CC15eC9xWGi1+27jQN2iHc3g1/AuUaKHB39Uc9JOAE3seEj0iMSsSpiNdcqXdQienRHhSs9JNuQSK582Mb17TWqXdO3dRLlZvxXZ0+uBW0K7ZZ96Po8aSLNaEIfIho4JVYHejlAGmV0f8yAcoZvP37x7hwdpdcR03hXVWhpfo3xY2HL3JcgkkTeNmZJ1LmTMgH5Z6xrk5kuTNXPqj149l0mYjNOyKKT8YdfyWQFWs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFlHcnZhTEdOZE5tRVpwMVNHRmduN0ZsU1o1aUljTWsyRkRnK1Q5OVdJSWMv?=
 =?utf-8?B?UFh1Y1RyK2hsU3VpWHhFUnk4QTRqNEVnbitzcU11cTZoTk5qN3pKWkQ5ZE1M?=
 =?utf-8?B?Z1psTlpzRGhmQzNYQ2NvZFhrblhYM0FCUmlsaVNYWUo3VTNDUHU0Qm9WVE5a?=
 =?utf-8?B?SlJlOU02YS8vRnR5ODhxbkJSdXQvVVZhVFZTa2pyYnhYSXR6bnV1Q1JRNEZs?=
 =?utf-8?B?QVNDUzdiMkhIVUhGV1JtZzdNN3RweUttZFU0UUZNYnVtVFk2d2EvN0xXKzhV?=
 =?utf-8?B?R3JacUJMVGsrSHhBK0dsNUdJWlBMcUV6ejFJWEwxZjN0bm1DdjZjT2RGQmtu?=
 =?utf-8?B?aXpyRzJqaTdHYTNFTG0wK2hVSXluQURGd29kMjNldWdTNWh6V2g2dEgxWjNI?=
 =?utf-8?B?L3lWSGgwZ0cwMVllZ3R2eFJFNmZrMVhER3lkRnBGS1I3d0VYZnIwQ0djUmJ6?=
 =?utf-8?B?cG03dlA5RXU4ZjVsVjBtN1IrNndNUmFEVFBqSkFZQmJocktLK1BCMnNCMUhr?=
 =?utf-8?B?RldnN0k3aWRCZGVsbkNkVy93MUhXdG12bVgvTjZFTFhhQXl0Q0pCR1JNakh4?=
 =?utf-8?B?aUlMb3ZwZkF0NkJCa0w0OXI4Wlh1bllQQ1daQVZsaUJzTmc5VVB2UVh6bEM0?=
 =?utf-8?B?VEovbHpYNnlpUVI1a2dESHhKZEpRdjhBZjBlbDVtSXlxTVJ3RFU4a216ZXBa?=
 =?utf-8?B?VUpvc3dtMzFQYnVCSzdFUEtuN1A5NFF2SXV2NmsvNUMzN0N2VDQvV29PdXlx?=
 =?utf-8?B?akhrTWVORU5DcWFySHBjakN4MnJrcVpZZU5PNzlMcHFIb0RyNmdVTkRnTXlt?=
 =?utf-8?B?QzZUT1FZMS9MeHVpQUhIOG1YL0ZmVURuanZoM1JBSzlYVVJMZk84Z3JiVDFG?=
 =?utf-8?B?V0NyNXFTNEwyQUdrekxQOUxFRkNsaTFWbEVFRGZUZ1BqQkxkcGdYc0phTksw?=
 =?utf-8?B?bzl4a2xlYnJCc0YxNmlxbDBUVmRIcm9EVGFIWWVFb1M2ZzZ1cExaQUZ0N1py?=
 =?utf-8?B?Z0RqRXdmZkNPQmdiMFQ2Z3J1d0RMbU9UaWUzdzJDZ3o5Z2t2L2xIdUtaaVlW?=
 =?utf-8?B?K2I0M0VwN1FSRnBlTlA5ZW1KdG85QVNEMXEwQjV6blJPamxRU1hFZkpXdThz?=
 =?utf-8?B?U09MM0hYK2htYVIrSUFhbHcyOXZZaC9EWStGL3B6WkJpWjVBVFVGOWZjTEt4?=
 =?utf-8?B?SmowTnN0RzhIQVJaM2dOam1vSERyTHdGYlhZbk9sem95NCtQN291OFVweWsz?=
 =?utf-8?B?K2w1N2M3Qmw3L0ZyT0JtTUcvR0hTMU8xTnVkc1d3V1BYQnBGVXNnRE1FVEsy?=
 =?utf-8?B?NFNqRzdhRjR6ZjNlWHFvT0RBK1E3ZjRyR2NxSzlidFJQcW13MzNHL2VOV1pa?=
 =?utf-8?B?UzhSdk1EdHZGdjBiR2lZQTlBVG1yNHpkMHMyL20vTmdRUjYrK2pRQmdsaG9z?=
 =?utf-8?B?d2tBNmxRQk96UEhXcmFaVG43STlBZ0IzcE1URmhqaDZIbUxFZit2RU5MVFhw?=
 =?utf-8?B?eDVqYmNaUnF3UDlhNHFtVHhxOUZnNUk0QmV4anFnaDNUNGlGbm1acVFsdGIr?=
 =?utf-8?B?YzRLNE1nQnJML3hFME9DZlVuMGo3K0poT1B5aDdBZzU2T2ljMHVJYysxaVRC?=
 =?utf-8?B?RUZtNGdSUXp1V1J1aTQ3TzZqWE80YTFrbFNJZjlsNUNpYnB2ci9jWDF6aG1O?=
 =?utf-8?B?eDdQT3VNZzNESnkwWEpQeTUwbFc1eFc1eWt1b2dYcm9DL2p2dFBxREJzSk9w?=
 =?utf-8?B?VmsvNWV6V2pyZTFmYis3Uys0MmtabVNkYmFUcjFmSmxUU0NkK3BOU2lxZlhE?=
 =?utf-8?B?RllzRWhiYWVNcERJWDZCQVIxTGE5VWMydm1jMTZUT3dIbEkxbDlLeGpPdUxC?=
 =?utf-8?B?SHhTVnRSVy9KWERES2JiOGYvdlhIcm9BeWVjVTBGWFBQbFZ0TGVRU1U2K3Fq?=
 =?utf-8?B?RUV6ZnBFbGplQ2p6QnpDb29LWGFTcjgvSENISnV0eDJNcFJ4Q0xJYlRkU2pu?=
 =?utf-8?B?V2pxNloyWnhBRFN1bGFxZ21LSkRvOUFYeTVGY3l1WCtSYWRJMlhMNnpzZ0k0?=
 =?utf-8?B?dFdVSGEzNmdDMkpSL1VkYWVIaC9ZOUMrZDZYNDdLMnJZTmd1UFlhRXlQTGts?=
 =?utf-8?B?TXVwanN0Z3BXOTJMUXVuQk85OHhZQTdtR0wxOUI0Z01lSzZHSzh3NFVDVnhU?=
 =?utf-8?B?YkVqL2YwWFZyN1ZLRHVaRWZNdjZNZElVSXhoN0xxL1A3WXlxTlFZN1lMckJt?=
 =?utf-8?B?eWIwWFhPTXJQODAwM0lPOXV3TXJybTRpZWJsTlB4RmNaMFBqdzJjWjNxcisz?=
 =?utf-8?B?RnpIcmduemlKOWV6aXRTQ0U3d2VIdDAzZWlNV2JrRU1NOVVKeWE3SkdRbFBp?=
 =?utf-8?Q?olUvXdb4xYzUdexL4pKB9HP76DA5FqFZEefTxYTtt9cdo?=
X-MS-Exchange-AntiSpam-MessageData-1: D+oDKuMdfnsUlQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90323fa4-0463-485b-cca9-08dea1493665
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 15:01:35.4222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eg3dxs+CTizuvQJwrAbsuZeTkCFzazvyO076wn/lrIdM1lCiwFHo7SJjgPogE51wlaJx8IruqVshI0EcTYYAaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF482CFEB7D
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-59428-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 9194745416A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lyude,

On Wed Apr 22, 2026 at 8:52 AM JST, Lyude Paul wrote:
> In order to do this, we need to be careful to ensure that any interface w=
e
> expose for scatterlists ensures that any mappings created from one are
> destroyed on driver-unbind. To do this, we introduce a Devres resource in=
to
> shmem::Object that we use in order to ensure that we release any SGTable
> mappings on driver-unbind. We store this in an UnsafeCell and protect
> access to it using the dma_resv lock that we already have from the shmem
> gem object, which is the same lock that currently protects
> drm_gem_object_shmem->sgt.
>
> We also provide two different methods for acquiring an sg table:
> self.sg_table(), and self.owned_sg_table(). The first function is for
> short-term uses of mapped SGTables, the second is for callers that need t=
o
> hold onto the mapped SGTable for an extended period of time. The second
> variant uses Devres of course, whereas the first simply relies on rust's
> borrow checker to prevent driver-unbind when using the mapped SGTable.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V3:
> * Rename OwnedSGTable to shmem::SGTable. Since the current version of the
>   SGTable abstractions now has a `Owned` and `Borrowed` variant, I think
>   renaming this to shmem::SGTable makes things less confusing.
>   We do however, keep the name of owned_sg_table() as-is.
> V4:
> * Clarify safety comments for SGTable to explain why the object is
>   thread-safe.
> * Rename from SGTableRef to SGTable
> V10:
> * Use Devres in order to ensure that SGTables are revocable, and are
>   unmapped on driver-unbind.
> V11:
> * s/create_sg_table()/get_sg_table()
> * Get rid of extraneous `ret =3D ` in shmem::Object::get_sg_table()
> V12:
> * Actually move sgt_res in this patch and not the next one
>
>  rust/kernel/drm/gem/shmem.rs | 192 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 190 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index 11749c36e8695..a477312c8a09b 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -11,25 +11,38 @@
> =20
>  use crate::{
>      container_of,
> +    device::{
> +        self,
> +        Bound, //
> +    },
> +    devres::*,
>      drm::{
>          driver,
>          gem,
>          private::Sealed,
>          Device, //
>      },
> -    error::to_result,
> +    error::{
> +        from_err_ptr,
> +        to_result, //
> +    },
>      prelude::*,
> +    scatterlist,
>      types::{
>          ARef,

This fails on master:

    error[E0432]: unresolved import `crate::sync::ARef`
      --> ../rust/kernel/drm/gem/shmem.rs:36:5
      |
    36 |     sync::ARef,
      |     ^^^^^^^^^^ no `ARef` in `sync`

Importing `sync::aref::ARef` seems to be the correct way now.

>          Opaque, //
>      }, //
>  };
>  use core::{
> +    cell::UnsafeCell,
>      ops::{
>          Deref,
>          DerefMut, //
>      },
> -    ptr::NonNull,
> +    ptr::{
> +        self,
> +        NonNull, //
> +    },
>  };
>  use gem::{
>      BaseObjectPrivate,
> @@ -61,6 +74,11 @@ pub struct ObjectConfig<'a, T: DriverObject> {
>  #[repr(C)]
>  #[pin_data]
>  pub struct Object<T: DriverObject> {
> +    /// Devres object for unmapping any SGTable on driver-unbind.
> +    ///
> +    /// This is protected by the object's dma_resv lock. It needs to be =
before `obj` to ensure that
> +    /// it is destroyed before `obj` on `Drop`.
> +    sgt_res: UnsafeCell<Option<Devres<SGTableMap<T>>>>,

I didn't like this `UnsafeCell<Option>` since the last time, but only figur=
ed how to replace it now:

    sgt_res: SetOnce<Devres<SGTableMap<T>>>,

It's actually designed for that! And lets you remove at least one unsafe
statement, while simplifying `get_sg_table` quite a bit. With the other
suggestions I have below, here is my version of `get_sg_table` for
reference:

    fn get_sg_table<'a>(
        &'a self,
        dev: &'a device::Device<Bound>,
    ) -> Result<&'a Devres<SGTableMap<T>>> {
        let _dma_resv =3D DmaResvGuard::new(self);

        if let Some(devres) =3D self.sgt_res.as_ref() {
            Ok(devres)
        } else {
            // Only called for the side-effect of populating the GEM SG tab=
le.
            // SAFETY: We grabbed the lock required for calling this functi=
on above.
            from_err_ptr(unsafe {
                bindings::drm_gem_shmem_get_pages_sgt_locked(self.as_raw_sh=
mem())
            })?;

            // INVARIANT:
            // - We called drm_gem_shmem_get_pages_sgt_locked above and che=
cked that it
            //   succeeded, fulfilling the invariant of `SGTableMap` that t=
he object's `sgt` field
            //   is initialized.
            // - We store this Devres in the object itself and don't move i=
t, ensuring that the
            //   object it points to remains valid for the lifetime of the =
`SGTableMap`.
            let devres =3D
                Devres::new(dev, init!(SGTableMap { obj: self.into() })).in=
spect_err(|_| {
                    // We can't make sure that the pages for this object ar=
e unmapped on
                    // driver-unbind, so we need to release the sgt
                    // SAFETY:
                    // - We grabbed the lock required for calling this func=
tion above
                    // - We checked above that get_pages_sgt_locked() was s=
uccessful
                    unsafe { bindings::__drm_gem_shmem_free_sgt_locked(self=
.as_raw_shmem()) }
                })?;

            self.sgt_res.populate(devres);

            // PANIC: `populate` has just succeeded, guaranteeing that `sgt=
_res` is populated.
            Ok(self.sgt_res.as_ref().unwrap())
        }
    }

And if only we could populate the `SetOnce` with a `impl Init<T, E>`,
then we could even remove the DMA reservation acquisition on the fast
path, because `SetOnce` comes with its own locking and the DMA lock here
is used outside of its intended scope. I'll try to push the necessary
work for `SetOnce` and maybe we can do that as a follow-up patch.

>      #[pin]
>      obj: Opaque<bindings::drm_gem_shmem_object>,
>      /// Parent object that owns this object's DMA reservation object.
> @@ -117,6 +135,7 @@ pub fn new(
>              try_pin_init!(Self {
>                  obj <- Opaque::init_zeroed(),
>                  parent_resv_obj: config.parent_resv_obj.map(|p| p.into()=
),
> +                sgt_res: UnsafeCell::new(None),
>                  inner <- T::new(dev, size, args),
>              }),
>              GFP_KERNEL,
> @@ -176,6 +195,100 @@ extern "C" fn free_callback(obj: *mut bindings::drm=
_gem_object) {
>          // SAFETY: We're recovering the Kbox<> we created in gem_create_=
object()
>          let _ =3D unsafe { KBox::from_raw(this) };
>      }
> +
> +    // If necessary, create an SGTable for the gem object and register a=
 Devres for it to ensure
> +    // that it is unmapped on driver unbind.
> +    fn get_sg_table<'a>(
> +        &'a self,
> +        dev: &'a device::Device<Bound>,
> +    ) -> Result<&'a Devres<SGTableMap<T>>> {
> +        let sgt_res_ptr =3D self.sgt_res.get();
> +
> +        // SAFETY: This lock is initialized throughout the lifetime of t=
he gem object
> +        unsafe { bindings::dma_resv_lock(self.raw_dma_resv(), ptr::null_=
mut()) };

There are 4 sites where we acquire and release the DMA resv lock, each
of which require unsafe blocks and carrying the risk that we forget
releasing the lock in the end. For this method in particular we need to
jump through hoops a bit and store the return value into a temporary
variable so we can unlock the DMA reservation.

Let's do ourselves a favor and implement a small, private guard type:

    struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>);

    impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
        fn new(object: &'a Object<T>) -> Self {
            // SAFETY: This lock is initialized throughout the lifetime of =
`object`
            unsafe { bindings::dma_resv_lock(object.raw_dma_resv(), ptr::nu=
ll_mut()) };

            Self(object)
        }
    }

    impl<'a, T> Drop for DmaResvGuard<'a, T>
    where
        T: DriverObject,
    {
        fn drop(&mut self) {
            // SAFETY: We are releasing the lock grabbed during the creatio=
n of this object.
            unsafe { bindings::dma_resv_unlock(self.0.raw_dma_resv()) };
        }
    }

There here you would just do

    let _dma_resv =3D DmaResvGuard::new(self);

and write the rest of the method without without having to worry about
not returning early. It also let's you improve the flow of the code a
bit, and requires less unsafe blocks overall.

I am not sure how much of the TODO at the beginning of the file this
solves, but it should also make it easier to switch to something that
acquires a reference to a Wwmutex.

> +
> +        // SAFETY: We just grabbed the lock required for reading this da=
ta above.
> +        let sgt_res =3D unsafe { (*sgt_res_ptr).as_ref() };
> +
> +        let ret =3D if let Some(sgt_res) =3D sgt_res {
> +            // We already have a Devres object for this sg table, return=
 it
> +            Ok(sgt_res)
> +        } else {
> +            // SAFETY: We grabbed the lock required for calling this fun=
ction above */
> +            let sgt =3D from_err_ptr(unsafe {
> +                bindings::drm_gem_shmem_get_pages_sgt_locked(self.as_raw=
_shmem())
> +            });
> +
> +            if let Err(e) =3D sgt {
> +                Err(e)
> +            } else {
> +                // INVARIANT:
> +                // - We called drm_gem_shmem_get_pages_sgt_locked above =
and checked that it
> +                //   succeeded, fulfilling the invariant of SGTableRef t=
hat the object's `sgt` field

s/SGTableRef/SGTableMap? (several like this through the patch).

> +                //   is initialized.
> +                // - We store this Devres in the object itself and don't=
 move it, ensuring that the
> +                //   object it points to remains valid for the lifetime =
of the SGTableRef.
> +                let devres =3D Devres::new(dev, init!(SGTableMap { obj: =
self.into() }));
> +                match devres {
> +                    Ok(devres) =3D> {
> +                        // SAFETY: We acquired the lock protecting this =
data above, making it safe
> +                        // to write into here
> +                        unsafe { (*sgt_res_ptr) =3D Some(devres) };
> +
> +                        // SAFETY: We just write Some() into *sgt_res_pt=
r above
> +                        Ok(unsafe { (&*sgt_res_ptr).as_ref().unwrap_unch=
ecked() })
> +                    }
> +                    Err(e) =3D> {
> +                        // We can't make sure that the pages for this ob=
ject are unmapped on
> +                        // driver-unbind, so we need to release the sgt
> +                        // SAFETY:
> +                        // - We grabbed the lock required for calling th=
is function above
> +                        // - We checked above that get_pages_sgt_locked(=
) was successful
> +                        unsafe { bindings::__drm_gem_shmem_free_sgt_lock=
ed(self.as_raw_shmem()) };
> +
> +                        Err(e)
> +                    }
> +                }
> +            }
> +        };
> +
> +        // SAFETY: We're releasing the lock that we grabbed above.
> +        unsafe { bindings::dma_resv_unlock(self.raw_dma_resv()) };
> +
> +        ret
> +    }
> +
> +    /// Creates (if necessary) and returns an immutable reference to a s=
catter-gather table of DMA
> +    /// pages for this object.
> +    ///
> +    /// This will pin the object in memory.
> +    #[inline]
> +    pub fn sg_table<'a>(
> +        &'a self,
> +        dev: &'a device::Device<Bound>,
> +    ) -> Result<&'a scatterlist::SGTable> {
> +        let sgt =3D self.get_sg_table(dev)?;
> +
> +        Ok(sgt.access(dev)?.deref())
> +    }
> +
> +    /// Creates (if necessary) and returns an owned reference to a scatt=
er-gather table of DMA pages
> +    /// for this object.
> +    ///
> +    /// This is the same as [`sg_table`](Self::sg_table), except that it=
 instead returns an
> +    /// [`shmem::SGTable`] which holds a reference to the associated gem=
 object, instead of a
> +    /// reference to an [`scatterlist::SGTable`].
> +    ///
> +    /// This will pin the object in memory.
> +    ///
> +    /// [`shmem::SGTable`]: SGTable
> +    pub fn owned_sg_table(&self, dev: &device::Device<Bound>) -> Result<=
SGTable<T>> {
> +        self.get_sg_table(dev)?;
> +
> +        // INVARIANT: We just ensured above that `self.sgt_res` is initi=
alized with
> +        // `Some(Devres<SGTableMap<T>>)`.
> +        Ok(SGTable(self.into()))
> +    }
>  }
> =20
>  impl<T: DriverObject> Deref for Object<T> {
> @@ -226,3 +339,78 @@ impl<T: DriverObject> driver::AllocImpl for Object<T=
> {
>          dumb_map_offset: None,
>      };
>  }
> +
> +/// A reference to a GEM object that is known to have a mapped [`SGTable=
`].
> +///
> +/// This is used by the Rust bindings with [`Devres`] in order to ensure=
 that mappings for SGTables
> +/// on GEM shmem objects are revoked on driver-unbind.
> +///
> +/// # Invariants
> +///
> +/// - `self.obj` always points to a valid GEM object.
> +/// - This object is proof that `self.0.owner.sgt` has an initialized an=
d valid SGTable.

The comment mentions `self.0` and "a valid SGTable", which don't seem to
apply to this type.

> +pub struct SGTableMap<T: DriverObject> {
> +    obj: NonNull<Object<T>>,
> +}
> +
> +impl<T: DriverObject> Deref for SGTableMap<T> {
> +    type Target =3D scatterlist::SGTable;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY:
> +        // - The NonNull is guaranteed to be valid via our type invarian=
ts.
> +        // - The sgt field is guaranteed to be initialized and valid via=
 our type invariants.
> +        unsafe { scatterlist::SGTable::from_raw((*self.obj.as_ref().as_r=
aw_shmem()).sgt) }
> +    }
> +}
> +
> +impl<T: DriverObject> Drop for SGTableMap<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: `obj` is always valid via our type invariants
> +        let obj =3D unsafe { self.obj.as_ref() };
> +
> +        // SAFETY: The dma_resv for GEM objects is initialized throughou=
t its lifetime
> +        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_m=
ut()) };
> +
> +        // SAFETY: We acquired the lock needed for calling this function=
 above
> +        unsafe { bindings::__drm_gem_shmem_free_sgt_locked(obj.as_raw_sh=
mem()) };

For symmetry, I wanted to suggest moving the call to
`drm_gem_shmem_get_pages_sgt_locked` to a (fallible) constructor of
`SGTableMap`.

It's not only for cosmetic and code proximity reasons - once you bind
the call to `drm_gem_shmem_get_pages_sgt_locked` to the successful
creation of the `SGTableMap` object, you can remove the custom error
path of `get_sg_table` that called `__drm_gem_shmem_free_sgt_locked` if
`Devres::new` failed since the destructor of `SGTableMap` will now take
care of this for us. This simplifies the last complex bit of
`get_sg_table`.

The problem is that it would also normally require `SGTableMap::new` to
acquire the DMA reservation lock in order to call
`drm_gem_shmem_get_pages_sgt_locked`, but we already have it in
`get_sg_table`.

If we stopped using the DMA reservation lock as a lock for population
`sgt_res` and instead switched to a regular Mutex, we could then move
the DMA reservation acquisition to the constructor, attain symmetry, and
simplify `get_sg_table` to the point where it becomes trivial. That use
is also fragile as the `SGTableMap` destructor acquires it, so we must
be very careful to never drop it in `get_sg_table`.

I think that would be a good tradeoff for the time until we make
`SetOnce` capable of being populated using an `impl Init`.

