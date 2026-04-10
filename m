Return-Path: <linux-media+bounces-58482-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOTMNEet2GljgwgAu9opvQ
	(envelope-from <linux-media+bounces-58482-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:56:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7133D3A7B
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 712C13024A65
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 07:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DA73A5E94;
	Fri, 10 Apr 2026 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tsi0xGAE"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894743A4F5D;
	Fri, 10 Apr 2026 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807703; cv=fail; b=dCYuPBh0lSngxl5SiiZAoSHE9e7vJTQXjU7kttOiYK7JUj13TUxZbBpyKBRAkOUDjTWDRJmd5jyKHOabkHmhySZVn/Vffkc3sbJonZJ77e1AmXiOlKk+FNJsnZmOLPiTwHMHIuxYU35hqCUjUFFzRe+uMeTSHR0lJKhfOaxBbNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807703; c=relaxed/simple;
	bh=dckx1dmREEgkAGAS7Tf07JSV4bmVvXJ3mIPEL5Cv3YY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=SlCdLFvJoEeDbloRFGSHHUn8tObumqDNfJg3v0ScqIkcjVmFDn23JO1eXGSBjVeGCCxk7np6Ck6vERZqJFYc3Hs7yyJsYbRI0hi9trwOAq85EIDOoQZ6QW+UTjfjuv3bsdLHg+Z/dGrLVxP1AhiQqWwsEB16rCMKjbDbPXu7PQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tsi0xGAE; arc=fail smtp.client-ip=52.101.52.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKkLBOzqOhVMdpPv+Wyaaf2KFL7lc4wNbMa1Dhm8DMawIpDnJiOh22d96VAt8t/3rFW8Yh0V3wfrnPEypk4MkHGVFFVd95Zeb1StNA2EA4wafpeJ6dOSfHVIlm904bvAj0ID6BNt/Jmwh6ysAZKMsL02aDI9IWpQye6+WtFchA9zWScBKeeVHpERkqvVBnM64rFuGYhMaPKgoWYfDXZUqkQE3GiGOCm/2TI3lQ3JLUBeLK11gmh195EFyW7fm/Wbs/HJEjWn3C8Uc18Om7rckjyWRVnpZYfkKoNjb01uSZgGhuHAJOpGDlNRpnvbvuZg/mKZAZybdiAMx+Vf3M7tDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dckx1dmREEgkAGAS7Tf07JSV4bmVvXJ3mIPEL5Cv3YY=;
 b=gPPeRZCFAtdNbauxFlZwKe6046pT+mTWlSa80iuuxPSgbkwoL2kaqdjOcxuLoi/zrjdForRzrM3sPbLCAPmOYVPUKVzhPye+fPhrQjwycf2gzwXaxyhRi+89MGwlLvYw6d2XaRd2KFJ6ujIYfcsG0ir1fh318/Jn1+Zi6fkou2DGQs4Sn0Cw89pfraW0gfxMofLg2g0g5K3x/LjuPcsIGVFyARMYqrEK7MXBNPMeu1oNqImMLOhd4oKhs2B78vjwWwomvPBRlsS4l0gHrKL+DMzwPLRoo6VAsQcMuAdpdANza6IAbUv016i8oS5wVWCVn30ESiVEVhGT3czjYUisHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dckx1dmREEgkAGAS7Tf07JSV4bmVvXJ3mIPEL5Cv3YY=;
 b=Tsi0xGAEh67XuC1G2NOS/K1eLSxNMP6Y7TENV9ThFT5dCqVrpW+Jr1UX70uH/d+pWNVj2ZKUM/fD0TjAUCBp5IOWdlXu78H4j0hMKh2bB8CVFC6UDgKQn3veutugQA5SUcTtO9Qan/qJQzRUyYxGECVHCgHjUYX/N1TosPPzPYK8o71yAdZt9epkY2Yd1wUH7xCgWdCu6rdX4fh6/oSLpTa3gZ+l5101eOaQ2AQVL7HBmyTIlEW+f/+Ms2BkG7cye8JUR+Yin/JYQXO4IUHIQYAyHhzI4X5uJRH7SvQmmvnJZhKG3WisnydlkgS6A8TdxjJgIBtTPhSsOLN+isxoFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Fri, 10 Apr
 2026 07:54:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 07:54:56 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 16:54:52 +0900
Message-Id: <DHPBAFK7AD6A.S1LS5A5H4CKM@nvidia.com>
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
Subject: Re: [PATCH v10 1/5] rust: drm: gem: s/device::Device/Device/ for
 shmem.rs
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260409001559.622026-1-lyude@redhat.com>
 <20260409001559.622026-2-lyude@redhat.com>
In-Reply-To: <20260409001559.622026-2-lyude@redhat.com>
X-ClientProxiedBy: TYCP286CA0143.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4ea93d-d11f-4df1-0cb3-08de96d6746a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tAobQpSlNYxXT5I6bw6PjBEEcvfNvVvGhELhMfQ5kwUj/RfCXboUmwbp7eNCWPIitdf3kE6uld9v2n02YJmEq8LrFrKAPUCik6i3XxXyqeIg8X+EEqQ1vYVDZZZf9hxiuuAXRAWeHrNwmiNGK9CS5kxFSsEke4WQJmJ1rVk8ZCbG6QlecVPxQ62eEeGcTyc9XVREmDF5aghlldvdgEuCWaX/Av4/uZNMbHlasKpdOjF1dbiBhNISIxy7qEyarv/dfvKMQJN+gKmWJzwHAkJ4huq8Rl4bWvG+iQC1PMAlsBVNilTVBlemgMAbV7LFAEMAZpVRXONzkd243DpU2HAgL7UZFlGGhh3NTfnaa6PVhfbanfs01Aeq3UwpT8PNWADkBqwmsxWdIF28HuOrx4caVxF3ZC0jq61K/7F5RXqlWwsC0fjepO23Y8g/NGEeQh9CYC/HnAlAOF2L9hh3+3CbKQJm2ymWtTKHlTjNUqtjUcf6wofb6sgqzXkaGKpemYrQQmPm1cVxbdUcwoK3i/pT0npKekohMQ1aTBdbYQshXajvtTfC033Q6UYlCT/LPbH353LuQJiwqMCm9va4jRZNoZcG/jYKc30FxHy9ransiFobvMsZpZK+O7+fsTIK/ySzZaVFFJfwiHxabOaicEPMr7ZdBTerr8g0c2nCLPCNyTOlZggs7Ri01fXMZEefU0k/ryPuXra43yTYgJDi5WjZBIcFYiGqI6zYG9BxGkURcGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnI4KzlpMEROTDA2d3dEckY3U3RwakN4a0g5bGpscUl0R3JsMllBZ0g0Wlg3?=
 =?utf-8?B?R0U2NE9xQjFlcEZFU0hoUW5xVWlzTFRINjEwc0UzbFI4cG1DZFdYZSswTW9X?=
 =?utf-8?B?ZDVkYkptVDBTSW9iY3J4allsKzJta1VqTk9hNkRzcVRLNk5yK3ZUeVBVYTUy?=
 =?utf-8?B?dWxXWUZabWMxWWlLTFpxaUlGYUg5Mk4rcXdqR0UremIrWkN4SHhsYnhyVVhl?=
 =?utf-8?B?aE5wLzUxZTFWVjdna0lVcW1Oc2xKbFlhQmZhVkVhM1FJS09wTldPRWZXTEo0?=
 =?utf-8?B?YnloM0VRTlBUbWxQNk9wWHpVaG8rMnBOci93S0xrRlhObDRyV3VCUVgzc1FX?=
 =?utf-8?B?VmFEd2tFcjV1cnhmQmtLMTF5MjhnVGd4Z2Y5ZytnN2cxL1FsbVE2blVhaTR3?=
 =?utf-8?B?ODA3OUppSEo5UTVjT3hvdnE0bUdLVmVudm5YZElqVVk2VVBLcTVCSmVmYmlV?=
 =?utf-8?B?dDU2OHRtVm9ZckI0U3ZHQy9YTUkyaUppZzdVbllZclZrSmMwNHVqZVVFeGxI?=
 =?utf-8?B?dEprd0ZuQkNNWTJRNEN4WmRGQTdMV1BRS0lUMHBNM25qcHp0ZjFNMHZYWDRF?=
 =?utf-8?B?V2F6emVnZFN5YU5HSUhLQVNwNVJsdnBiek1RK0xubmN2QTJIa25pYmU5V3hV?=
 =?utf-8?B?WU1UQVYwbGVZdENDeDY4RU5LU0JFclN4VjVZdldVbmM5M0x5ZVoyMjFlZDRJ?=
 =?utf-8?B?dXZqQmNVVHhCaFRaalR5SGUvMGYrdmQ1NWtERWFXODZmWDBYL25xMWJXWDdx?=
 =?utf-8?B?MHZRZnduWjZORU9Jd25MM0dVd0J3UTlsenpUZEtxeVA1RjJXbnQ3SnB3N283?=
 =?utf-8?B?V1FPVld6bWdjSFhMN1QwKzNkTEwxeTBnYStPbzExanpIdXMzMjFjUkFQMW5S?=
 =?utf-8?B?NVdOTG01T1VoV3RXbEJ3UWRleTVtUFdNb09HdklqczY3TG13dUhOR2I4TGs2?=
 =?utf-8?B?WEhHZEFVbk5NSUwyWmhVdzdhM1h6bjZXdmYxbGc3ZUZXcGhmVWpuNWg2ZEF0?=
 =?utf-8?B?MTFyclorcEQ4Y082bitiNlQvOFFzSUFYSSs3bkNmTDRnM3N3THpad01CbEdG?=
 =?utf-8?B?N0xEcmZJeXR5Z0h6UkNjdkNjMmtHMGhJZHlybmE2UWN3L0NrdlBNaDA1eHh4?=
 =?utf-8?B?NXVhdHRHc2QzdVJsWkJvTjk2SFJpY1dMRnU0RzlIS04ydE52MHhmU1NOZzkx?=
 =?utf-8?B?czlsNFhLV0c0QTJPMElCN0pTVjhVL285NlBlN0EwYXNvRkdWQXJqTGJJakNi?=
 =?utf-8?B?eHl2bDlXZUJyWjBPYUMwUjJwMzM5WDNmUGRyTnFJWVFJektWSmF2aEc4Zngy?=
 =?utf-8?B?UWg3eEdCVHJnQklKbElvSGRaR3R1OGdWNHZyeHFzWnMzN28vK1p2TG8rME1N?=
 =?utf-8?B?dUlwRUNTbEg2RWhEM2t3WHlHcmh1RnBYRFM2TE9uMlRYUm0wOHpCa0l3Mmtm?=
 =?utf-8?B?bGtBNmlVdWY0bkJ5QnBwdTd5QjVWVElCSE4yNDJmZlFtUE1Vcm82UjlkNkNz?=
 =?utf-8?B?K1NWMTg5d1U2aEJCSHllNm1RYVMvNnBzbU5FMUZUTWhCdy9mY1BjbmNMRnhN?=
 =?utf-8?B?SDhKaVlLUVVqRFpaM0czbzE2WVZrVVl2aFo1SmdNYzVuTkhKWnlSeUt1cnIy?=
 =?utf-8?B?djZ2Q0JJbnBUdW03NWlTMnBpRFA2THFlQ1d0Sk9QanUydlNyRDFCVmprZXdu?=
 =?utf-8?B?SVZnbU9sMG9lRjlKRURLM2cxdmx3WENFV2R0bzRaOE05dkZ1OUFibHNpSDV6?=
 =?utf-8?B?UlVXbGU0YXRvSC8yL3lHLzdvTTNGUlN4QlBjNFVEMys3cmtyT1lBL3NNTzBU?=
 =?utf-8?B?elczU0o2c1JtdmtLc1JWUVBGSTRWNzNFZ01kem1lb2F0eGt1bDFiMW4rR0lU?=
 =?utf-8?B?WSt0N0lWTXhUdzlWRTJFelg1TjAxbUgxUVlTVTlCQVJaZUEyNXJYNU05UDJW?=
 =?utf-8?B?YlgvVTVzaWxLNVlMZHVVMCtEZW5SWklXT2NvNTNha1dCdzVVUEh4KzBuRGUw?=
 =?utf-8?B?ODRGQ2IvMmh4MXV5d3hxZmJMRmdSMkFwTmRiZGJGcTFORU9NbUhiY2NrNlFY?=
 =?utf-8?B?dDBXQzhLWEtVQlFyVm1ISVdCUFpBK3NuL3d1S2w2czZYSzBVTndKNnFDT250?=
 =?utf-8?B?aWhCd09seVlWQ2xZQk12Q1pqYUowbEVkVXdWeURRN2hKdVVnMWl5c2dqbXdw?=
 =?utf-8?B?TDl6ZVZUd01VY1ZiWE1ob1V6Z1pUeURxNE9XQXlsbGxwcVIxRDJNKzJ3eDhX?=
 =?utf-8?B?Rzl6Zm5LTktFY1pwdGtBSkF6VkxMMjVOeGIvWW0vQ2xtYkllRE81M3luZzk2?=
 =?utf-8?B?Y05EOFJHYzJ0R0NHWS95NlZZK1BBVjFFMWcyRTNWTURUSTl5MHJVOXlSQmNs?=
 =?utf-8?Q?vyGxPDmEInrkUjcukmsxZE0lyBgF4zL4cIaac8OW91B75?=
X-MS-Exchange-AntiSpam-MessageData-1: X1t99Z6n/DbkMQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4ea93d-d11f-4df1-0cb3-08de96d6746a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 07:54:56.1668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OleLuXX0Q46ZVuIovKtcAJ9rtI1fzBZgiw8SZEd4JGbGkZv1VKX76pK7p523hfED5xjB1J1Q1NibZmQrYOkxA==
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
	TAGGED_FROM(0.00)[bounces-58482-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 3C7133D3A7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Apr 9, 2026 at 9:12 AM JST, Lyude Paul wrote:
> We're about to start explicitly mentioning kernel devices as well in this
> file, so this makes it easier to differentiate the two by allowing us to
> import `device` as `kernel::device`.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

