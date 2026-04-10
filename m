Return-Path: <linux-media+bounces-58483-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFX7Ol6t2GljgwgAu9opvQ
	(envelope-from <linux-media+bounces-58483-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:57:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C973D3A83
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96CF9302BE1E
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 07:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F5D3A5E98;
	Fri, 10 Apr 2026 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FlHDZa8y"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ADF3A16BD;
	Fri, 10 Apr 2026 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807707; cv=fail; b=RD3PzKjLtba6gYX1avLtLUGqmCIAtFtPtBAwxPMoOVisTI6Rz+IPobyJv4wXep/3gPIQjqlI9Dw+jD2xb8EHtfexn+QdgrC+LwZnzhpw7YFuEstnLSW0QdyfZ4pKyF3Q78afJbNSFCB10rqw+RgqaQxFZxiy58Iiy8Fcv1OS8DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807707; c=relaxed/simple;
	bh=jDCKPrzO91u1K8ZuFlD+DQuf7fpU7Xd6sk6+axf0hlI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=Zb2JZT3QzrGMWKUYwS1qNgsZKmQO1Z6vJ9tjS7Bob3rraEzzmGuK84sMSrGRst2AzfWD9r02K5Ht3K/tBc1jlWDXmu9WtFW6kCK6QHSSlIbkFZ4FP2Zt7g4/8l8eyJZczHG7n53D42Ld5ZYJtHP8aMZc7+FmrVJ0oWGBeqoAfng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FlHDZa8y; arc=fail smtp.client-ip=52.101.52.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruBIY017/1CJOjMhMc0AU4DCBCsHlVvdII0ha+OE5llWs2VWGkBDYZ82b2iH1BPQt+C6SqaHJvNbvOXZYzONJHE2JtB6mz8G3KlLV9SlE/4KGccf1BriZrCyBSyZZsfvPpZDmcWx6Uyi98wDXrMjaGD7tOEXQdUn8qi6aIPPcm8C2JUpUWn8wFZwlfyt7e6cPz/xhUWp/xuhaHw+6EBIB4yEj12Cpx5ipGep5eGOjmSuPcydaIDRcoJKvzt0MSRjook1Fd7Ckt2/E+m2fTLFghtDg8BI08cF5T+b8i5Ln6vWruvu+ivFffyiEmZxe9wnC7S4N/FLRJNexHFM5aylug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXIwA3cBTYg9W7vf3J0WNkZ5n0axjmrs0WIR3wwi9eQ=;
 b=lssgAst6PtEKxmjnNUzNCO1xh/SG8/CMSrgM915pIAXtXL2k4lLeApftBBhotI52JFx4PgWJmBlt3FODunBF0wVG3qbRnDfX0EQXjnNbElikMdEqbNw521guoAyrL1PIxeVhm8nfAjSWx6osDwROE1aiMCHgtQs828f218o2e0PLb+b3VpgHBJyUVca7udIjqC6NSX5a7V8zoXN1TVID8X4fgwV5r1dsmy3vzrpDQZO2bWNK8ahq3reZFKJzpGVX47A1JQ7QiKzGXDDkaU4GK5l2Ig2A1T4zXoyHMBPa6MQ8LMXRD71E2JTgzQq/jBa3jaF4PsxhOql/8HzO0g95CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXIwA3cBTYg9W7vf3J0WNkZ5n0axjmrs0WIR3wwi9eQ=;
 b=FlHDZa8ykdgjR9gh/hOA8EbpuQ2BSFWSa3MqvEFr2z3aHonJxz+r5M5CC3+GTUY9+IKsdItyyfXDcVNH91fWZsTRYMsMHuTuELXx4bI7Fbft+vk4T4/4/Db/F3be4FJ/1I7PxfKcGlfeA+/Kxmfod1Kq0bvyxQhMRAzf7e4QHHIwU/304F7o4F5sT0yKcjJtn8l7vVru5icljD7WFFWzaLunORAOh71x4CzP8Q+yM6jbX0EVeSs3DiKevCqbEILuYVIveVrkPPXL2+yImVeqSR87kzetNQzm5Ye2jUc17+ad4Rd7SOxpAkGPkyysvqOvM3GYFpHQo8l/pxxtazys5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Fri, 10 Apr
 2026 07:55:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 07:55:02 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 16:54:58 +0900
Message-Id: <DHPBAILUGZYZ.2VQIBNVRTP7PB@nvidia.com>
Subject: Re: [PATCH v10 2/5] drm/gem/shmem: Introduce
 __drm_gem_shmem_free_sgt_locked()
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
Content-Transfer-Encoding: quoted-printable
References: <20260409001559.622026-1-lyude@redhat.com>
 <20260409001559.622026-3-lyude@redhat.com>
In-Reply-To: <20260409001559.622026-3-lyude@redhat.com>
X-ClientProxiedBy: TY4P301CA0103.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d3f3032-211f-464d-409a-08de96d67866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rfd1zQb0HJrMMNqzjIsyzCQR1w2WF/0egJqODymbTFfhzGM/OKrgcVeYLBYccHI26jD+6YAsvlYxzJ4HdRevSA0LHPwQA+Pc2m7qbd8xd8XwG90slEKFAgumCYB2dT2BANkpmpGZVjBd1eicTvXmkSseFkKsAvXXtpcK43Uc0FCjFI/FVHFQOAoyX8EZIChca2cQ2PlyVav130UkWCP37IVgqNPG6y8V3/elo7FhuU8RbdN+jAsWsNuNwwSpVW7+Ny/cWXQo6I2t5M7dvIHZOPCFlyPxD/mNfbIZGPrYZHA9P0jcBKWZMzRcYNCxnPxyHtS0uo7Treug5KFvH0mfrkV8qurX7mYWvY4Jd/04cSnbuB59D945eBZ8DaCRUSkDKOjnQCb6qZBfeRiz/CUQl9hY+m+ovh9NX3jY80R8tQsrBPIeWH79u8Klu6BNi+QqxNBiyIjj3eBJOyFtdcXXTFWvP7U96OrnwX/ap57XB6pFQXjLwD7VL7VLSJT3prNMOPQCiNzEiK0o8ZviBIh9+tE4wn8IsDmLIc8LqsBRC8WbbeApZQWLicwDz0XbTJcQr1KTL6ztw249mzACAFYF2x49Y4yNr6ODvQHgNmqR6bmpMvlBbEmtIn0a5rw//WQKcllp7RH1VSnHHUAbrXYkhYNocW08OOJ4HP5nPxB6AsgVlJH/HgQ8oIXaVcYsYQDyeshFxHtQ7SADNq53LmtWqVaRzIgPe2zrxU185dXC0O4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVZYUFdUVkhWNTUxV3BFcEsrbW1XUXlVNmtrTjZaWkd5cWlTL2taRkpydmZF?=
 =?utf-8?B?TGE2UFNLWTdKTWlVdUl1bXlURFRvMENqOUZMSTNFYi9NZGlKUHl6eFlyUEx3?=
 =?utf-8?B?SEdFNldOYjZ4UDJqWEFzNHNRMndlbEtlMVNVR1pTV2RhWTdaTEtMRTdQb0h2?=
 =?utf-8?B?aEtMZC82RU9naWpsbUdsZFNKS25rTkZiY3pWcE1EOGVXNmZPS0dTOXlJK2dp?=
 =?utf-8?B?SFlNUWducm5LUFB4MmV1Qk5UNmZCVUJXUkdWQlF2OVdhRjNvdy9GV3VyTGxO?=
 =?utf-8?B?MUNHTGNYOHRLSldqNHpUemxZL3l4Y3JFQjNKcGQybm1oUjEzamczeVFxYndI?=
 =?utf-8?B?ektWSGtpa3JRQmM2eS9jdjBwcFhRcUM1aHZQZElMcG0rbWZ0cVZkcWJCeUdD?=
 =?utf-8?B?L092bFpHeUtKYnhKL1NHcTdhZXNNSW0wK1Y0Q0txR2ZUZDZOdkxIMGg5MnIw?=
 =?utf-8?B?cHV0czBLbEdNT2ZoNmYzYXM3MkE3TVhZcWNKYlcyTGpScFVHYmNpclZsSEp0?=
 =?utf-8?B?ZVpOVXd0blRRdWN1bEU3WjJmUXo2dTJ0R2REU3l6YUtBaTVXUG5NMDVCVSt5?=
 =?utf-8?B?cXNycjdlZEVyYnlHS3RkS3M0Y01ZZjBvNUQ0SXdmWU1oem9sb2xYQnhLTTRn?=
 =?utf-8?B?cHJTMXpRWVIvNDl5YkIxOHNpT2libWYya3FTdzFZbXdMcmZmazhHdlZzakNr?=
 =?utf-8?B?VHFmZ0pub1ZZNUQ3WUpnSnZySzJTOFRKQ0NZcHJsQUtlOVZnNjk1b21Bd2E1?=
 =?utf-8?B?R1ZrRUFSU0hzMUx5bVVaaVlnaTNma0w0SVVyWHp4OTQxMEg4b2xVS3dRV21t?=
 =?utf-8?B?bjQ4ODl0YmRuNGNVNlFRLzQxUU91U1NRNUlyQkxNcEx1dUdHNUFueXlkYks2?=
 =?utf-8?B?dWR0c29Ea0RHY0owcGFzYTg1Z0lHU2VWclN0UEMvTFBNbkoxMXRXNk1DajNm?=
 =?utf-8?B?cWtvQ1hySks4SUZIS0pvNi9pMm14ZXpiUXNxZzNPaEYwQk1KMlR2ejJrdUNH?=
 =?utf-8?B?dmJYMDJZd1YrTGQwb2F5bVdCcmtsTEZBWE9vNks0dGFtaTN2a3MzSjUwQTdw?=
 =?utf-8?B?WmtxWVlaVFdvTzVNd3MxV3lhcG1QWTFMSnhhMlVhV3NvRm5VaGhwS3V4V043?=
 =?utf-8?B?eG5aaUt6aVM4YWZpOXdacncvSDcybTZURmloOFpjakZoeW92cWNaVjBSNm81?=
 =?utf-8?B?dnJlSmc2bHIzbGtLaXdESnlZTmdKaWNTUTdPNmx5dUFRbDdRdUFzUFRGTnRv?=
 =?utf-8?B?azBWN0tadnZtNitqVkJSbThFOEpZcTJYcHV2T0dERlFrVlFGbkluUUw3aDA5?=
 =?utf-8?B?T1NteWdVN2J3V3FOaUV5K3lBUm16SkVuZ0duckQ4OGhzV3Zmd2hTY00rMG9M?=
 =?utf-8?B?bWdJeEVaUEoxYVIvaVJkdjFaNzZxYnpGS0JUemhrV1pSNjJwWHoydUZuZFRE?=
 =?utf-8?B?eDA3eldnMEcwNnpiSzByaEp5ckdSVXorc1NIbEVXc1VCRXhRcG5FaThnRzZO?=
 =?utf-8?B?NE9PMlVQNkRvTnZaTm1hcVlacGxHMlc3N0RkWFBjZXk3MlFacUlaOUQ4V21Q?=
 =?utf-8?B?R1gwSXF0Z1JFc3MrNGFEcHkyQVA2L1lCWjNvdGpLZGVRb25VRGpsY05NZEhl?=
 =?utf-8?B?UDZvN0UzcjFpS29udC9odzY0Q0RXU0RET3RiVTFtVFdsbS81SGJQeXpiVnln?=
 =?utf-8?B?bnZKNU5KMlR3SDhQUVRrNG1uT0RxYXF5UzQwT2k2Ymt4Y2xGRWl0aTVEODN2?=
 =?utf-8?B?cnM1WTJJOERjOVdPa1k0RFBielI3VjFSeGNMNktQYi9ORkhjbW1nczlhamFI?=
 =?utf-8?B?TXUrWG4zQ0ZWK0NKK2tncFFjaUhzOTRGQmwrQjNRaGl3ZTJtL2NZRURzT1dU?=
 =?utf-8?B?ZlpwYWtGUHNKT2tMcHpibWRBQXpLM1VZTSs3am1nT2RvNTRvZE9OcGJ1ZVhT?=
 =?utf-8?B?L2dPUUo0Q1ArR3phRlRqa2EwYkRRcXFnRUZyTGYxdGlnVFV1VW1ZTGk1aE93?=
 =?utf-8?B?YnBHRUFieUtyeVJ2QkZsOEtwdkd2ek5nVDM5ZzhRS2lyVHFxL0U2aTg2NkQ4?=
 =?utf-8?B?VDJVK3lyYWc4MUlFMkNUcU9yN3U4dWpPN2RKY2k5SG56bDVTUkdnVWdXK0I2?=
 =?utf-8?B?VHJwU2tLdVlyYkZZZEh5TW9tWnpueEx3ZEwvSDNwUUx6dGdIK1F6Lzg5WEZh?=
 =?utf-8?B?MDRGaFBERmpuazBlKzErZkF3R2ZUdGZkb3owTDN0eExCL3hwd2hWT2FYMmVM?=
 =?utf-8?B?ZnBXbSs2VmovTVJRWEdEd0xJQ2ltQ2x6ZlR2dEJuU1FqVW5BdWQ0T0JpUTky?=
 =?utf-8?B?MG9DZVlENXIzclpJaGxsbHVoYjdxNjJKajJxMWhUeXY2d29jczM1Y3B1WjFt?=
 =?utf-8?Q?GgYmrMCXEqWlw85O8BneseUKPPly3hCVJEnuEYX6wJRI1?=
X-MS-Exchange-AntiSpam-MessageData-1: g7sddYn/EdP5Sg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3f3032-211f-464d-409a-08de96d67866
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 07:55:02.3150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgRiI+BVJ8bsyhfFvFLq1FA+zb3yuHQn9HlJmSI040oK6mw6DUShJJSxsix3BgeWU0S0x6AuYLeTobPr5V8Uaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58483-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62C973D3A83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Apr 9, 2026 at 9:12 AM JST, Lyude Paul wrote:
> One of the complications of trying to use the shmem helpers to create a
> scatterlist for shmem objects is that we need to be able to provide a
> guarantee that the driver cannot be unbound for the lifetime of the
> scatterlist.
>
> The easiest way of handling this seems to be just hooking up an unmap
> operation to devres the first time we create a scatterlist, which allows =
us
> to still take advantage of gem shmem facilities without breaking that
> guarantee. To allow for this, we extract __drm_gem_shmem_free_sgt_locked(=
)
> - which allows a caller (e.g. the rust bindings) to manually unmap the sg=
t
> for a gem object as needed.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 32 +++++++++++++++++++++-----
>  include/drm/drm_gem_shmem_helper.h     |  1 +
>  2 files changed, 27 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 4500deef41278..addf8c1e5341e 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -158,6 +158,30 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(st=
ruct drm_device *dev, size_t
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> =20
> +/**
> + * drm_gem_shmem_release_sgt_locked - Unpin and DMA unmap pages, and rel=
ease the

The function name is missing the `__` prefix.

Outside of that, and fwiw,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

