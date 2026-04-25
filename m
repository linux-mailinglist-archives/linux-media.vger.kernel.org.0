Return-Path: <linux-media+bounces-59571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH39C00p7GlVVAAAu9opvQ
	(envelope-from <linux-media+bounces-59571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 04:39:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A83464C25
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 04:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06E993006172
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 02:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4202459E1;
	Sat, 25 Apr 2026 02:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LR53k0IF"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010010.outbound.protection.outlook.com [52.101.56.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56071F5825;
	Sat, 25 Apr 2026 02:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777084746; cv=fail; b=oAd71XRcsjAiIWvPx8WUDu+2mnzk0BrPpi1AP7kvuR6pjw2eI7DdodGDO+5UE0ds7LcFCwuUMxitXvDQufK99xKBfirr9o5NcyoUrFj2D/HzqQ+YJ54wuWBT83MaC8TVAa8A/Ifdy2QRQPtb6leTINlZ42qwgbnVWu5LzKTSZYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777084746; c=relaxed/simple;
	bh=1q6t2h4PNYRXhd/4VhMpjcHBZevAaEvZEwMyDNHHXBo=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=RHg7GEsuq3e7sl+2Nrs2McHUhh1d4f5qRXxGXadty/W3qcHY+MC3A2XgXT+ZpSad4oWXKdWyP56pgFZbE/qrSPvTtSt9PBG1lvMj+xMgWQoWtNQyRugHvAvx/QGeqeOImCJyxAJvLlwSjykqEs65qru6H1JW4+4V8OPKDzk8Dkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LR53k0IF; arc=fail smtp.client-ip=52.101.56.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFRs05UJh9kFRMfNmbLm2MX/9obMqOE++n85K4UoZ+nHvDgL95x2G8Du1PgA17GgfpnRb3FSxO+zBH2GN2PNUsCsyh/ivVq9luHkRWAYQHGmfsTKVh1ZEJJvpSYp9qJ2Mx3D6yklInSwO2HozJKelW/ont3ONTH+Mq9eYbS82Jw1ugZcXOBv2FEnYXRDY9WGOZUrGujI9+ZX9wzKTF9nEgUTZRuCsjmJa8p5YQmQZEeZ/k4kbtqk8jHXElXnQ85rWQzgWovE10tFU1dC0Q2NoL8kc/bbrGvpCUZN28jQblNgZQFWaISLM4CkEg/PpgTKh/Ijw/K40vGzLb4EGd0/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1q6t2h4PNYRXhd/4VhMpjcHBZevAaEvZEwMyDNHHXBo=;
 b=Cawz795AkHNaE+ZVqNWJ1jTkOyFP2d7JZJLLLrAxTRFBkuNkGO3mb4zJbVTYfYHPtuJvEaWl+tsu3mXLePithzKnP7pNrbdfaVpdE82BOLaikT8S0vEdNJVcvEz5yvJ9j08SNZgftdejCKVPL/+4hEN4uOFkBNVXVbJdY99hE+ZWRInZVfRCyCXEwxPubgMQ/KoYjb27284awTpNmcZZ/8OAYX9jkF4zI35M5JVGOUvFMIHZbSW71igwagLdIN6g5ZW7ztpeGd3dWEjVjwo4kNxAUheDSCmvg98OvYoJcGBtOpipnZcfzdY38BkJFecq7ekCbn5FEVR330C9JHNQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1q6t2h4PNYRXhd/4VhMpjcHBZevAaEvZEwMyDNHHXBo=;
 b=LR53k0IFL71b6jPdB8LiyQFeTBJjcPILDi93VyFIs1zwawaljlY3OJ0yjBlE//Ok7KNt89StaJCCF3mycP2kd2qmQnlYzul42jTvbzc0IJYLdunTtCZc2To1ZGB3/tF69tVU3RtqyrC//hpvRJIEUxZMBA6tdvOC67ytm2zEutJBL1s12bFz+AXT5nwqTxa71v2PKQRxgQa6LTC8njYGrJ/xabx0upzDVgenXNV5ows6u3UaZ2sV3OJzysY51gHPcg62lAsKMgeaqCi+h1UtNgt4yCnXLHsPXjYrPlFBCq+6FhH7zNCwvniQt1k6NlA57niXISANpvmO3B7ZkmsuxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6774.namprd12.prod.outlook.com (2603:10b6:806:259::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Sat, 25 Apr
 2026 02:39:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.012; Sat, 25 Apr 2026
 02:38:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Apr 2026 11:38:54 +0900
Message-Id: <DI1VYOJKCD2G.1RB25DXWO0OK6@nvidia.com>
To: <lyude@redhat.com>
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
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260421235346.672794-1-lyude@redhat.com>
 <20260421235346.672794-5-lyude@redhat.com>
 <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
 <ed26658c461020547e058b237575324adcbaca59.camel@redhat.com>
In-Reply-To: <ed26658c461020547e058b237575324adcbaca59.camel@redhat.com>
X-ClientProxiedBy: TYCP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 90966965-151e-4dca-0419-08dea273cdad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mGVCEupSKjNRLrQmOY3/DeQv63XaN3e0+DxI+e/C0nq4RZRfOKuTJHCwGe5aix5y+OLxlKFb+V0oxZbehQvPtxoqJEy40hPFdTGOI3XPodnkdq75yn2QOgyKlsJrg35FVjtI16wZjCdcU9BFe9s0xguZmXOlVNNh55YjxXd5m+tOstr5aQh7P6zR3YebsQM4bqrnEmGcpuXor///fB4DgVzoGXCf3aJSncGrL2CljGaN5DVPUa4MKFD6NfioXGQOCfHKn2hOp3ioYtgBQpR2C8y+uG42xPKFYB9e9pCkpYRxnxmRm5uKGlHwgVxE63LZ4kWLw4pB0l3qaVHx6VbcUdhQ2XGRFPmK/NzdiSUhdKqPdVrthur5xPx/XKMRhOeuL4NHTHStgFsTrqRZgQMKP4Ww9kA68HjwWKwfmG/sezf7SUzK7dTo2cV723/ydtKdaTo7GLcrKR14wGHS1LC+iIUu+6VTnNQXK71cAFdlkfUCex4Q6HOaIJa8oTcYIu5Wr+1CiObXHqMij7XvtuM/noHb4oBatzNe+h3lhTPl4TtCVMu7PXQBrldoNdI8nZjJvQqZLIj0xx+WYFdM5PbtZZHW7UUfxbBP1DG59ggFEdLPUBfLbz87I00YPiwFqa/U/8wPx2tDZkuGutCHIC8IugG7QgWl7y/aCaByXOyRt8FECFwXhMey96SrQHqP8EqcCfDJv8oTgPWnuqVjJBVDwxJ1GF425qsSUBuALO1hcZM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEMwS2NyMFFuMG1jM1QyMUdyNnNFUXFHcmh2K0toTkV5aUdhWWRoQm5HampF?=
 =?utf-8?B?ckRidHM4clBtMkhKL1ZmU1d5V0l3SWFZNWNmSXJRTUNMYmMwYkN4bUo3UDR0?=
 =?utf-8?B?YjZrT0FnNm82dUc1bWhDc1F3REhNbkdkVSt6UWhFdy9OSFIvS0JKeGlxVXVZ?=
 =?utf-8?B?OHdLdkt0VnJVRUJVdFd0TFNhZGpYbFVOM3JGcE9FYVFiZk15LytLYmhzUWRz?=
 =?utf-8?B?RTZDOFA4NFZyYkJJTDlzNTBzRFg3b2grcis3ZnB4c0haRTJjWVErM2JDcVA0?=
 =?utf-8?B?RGt5ZUpsZGNRcElVUnQ0dTVzV2twWEl5UHV2U25wVnZ2dHJ2UG1WaHNiODBr?=
 =?utf-8?B?ekQwODR0bWdxdm9XWDNjUWFMUlVqaUpVM0l3dldrWURTR1VrejdnMC9xQnRQ?=
 =?utf-8?B?aDh4QkhUMzVKTmFvU3dsTlNtbnhBYkxvTktiSzZYNmp5ay9RZFFYY1NtSmNk?=
 =?utf-8?B?N1h0NXphcjFWOW5iWjhwZFZoNEoxbEQySndvNnpackc5MVg2NHF2YXl3UDJY?=
 =?utf-8?B?cG5wdlFCWVNES0FHSkthYldGRlJhWXkwWkhhZmNFeDdwVXNVTUUzRUVrVmhR?=
 =?utf-8?B?YkNTaS90N0w0U2VZOUMvcU5iQmZnRkhrdkxUTHpHNVVGdjl1Q0l5aUdOQmNB?=
 =?utf-8?B?OUN1bnRPZkt4blRSSEdJN0FWTUNKVzczL3JGbmkvb1FrZXJ4YTFnbnpUejl0?=
 =?utf-8?B?UXc3SC9OYm91NWwrMkZkUEVjY3Q2YXJ0QVJtM296NUY5UDVIdFRtK1NmYWtD?=
 =?utf-8?B?aXZad0dVbk0veFZDZStBTERxR1Nubk0zUmp2L3I4VVJpR0xFSVVoTHdQTlEy?=
 =?utf-8?B?NVdBUXZUSXk1MitUMW5ieU1HVkczWE8vaHNEMHplNXBBcDd5UnBtbjd6eWlW?=
 =?utf-8?B?cmNnR2ZZaEZIVFFlSVdzNkZwZjdyNnExSzJ6cVVLZDJ4YkpnWHdHOUMwVGJC?=
 =?utf-8?B?cWRzUWV6SXY3N0t4V2VQRlBCK2haNHNqbE0vVVBhbTNyVjAveWZrNkRtdGky?=
 =?utf-8?B?ZEIrREdCeE1DaWtZbTJjZUNjWmhUYll1SVN1Z3Ywc1hyK0RQSllLN1BjNWdn?=
 =?utf-8?B?ZXB6MEQ5N3RVcnlza1dNbjJiVU9HUHNuWWQ0TFdudEpPRUNLa0owQVBlSjk3?=
 =?utf-8?B?YXUwcGJab1FEWFNoaWovQzdMQ2ZlYUtYbEJmS3lnMWtaUTFwQmxidGRxZ3p2?=
 =?utf-8?B?NnlEdzdOdG1kMVNpWVF4RldzcUtFeGw0Z09za2xIMXZrUGtlTTFnd01ianFQ?=
 =?utf-8?B?dE80VUNqZkZNU2VNRU1wckhLakN6UjcyWVlvQktsY0xMUVhTWkJZSGpzZExR?=
 =?utf-8?B?WEVNMWRMOW5hdXZxL2JIcElYa1FLSjFWMzdMZUN2dEluakRPNlV3QXBVR2hj?=
 =?utf-8?B?VHhKNzRCbG1TN3hZL1F4SUhjejZqNWoySS9sdGhHa1hLMytRQy9QT2lPQXE3?=
 =?utf-8?B?dGNvVTcxa0JPQTdiaGI4UVZ6aTJ4YjZiL2lNZ0puc0FHK095Snk0SjJkMGk1?=
 =?utf-8?B?Uzd4MCt2OEM3dk0za3R6WW83S3FQN2ozL2RqUXhMYS9qV2VwWVJ5TlJ0bml2?=
 =?utf-8?B?UHU1Um1QT01KQjIzcU15aU9KM3I2RXpXdlNFVUVWRm9YVHJCRUlTOUJlRndl?=
 =?utf-8?B?cEpONDg0NHhaUGp5aGovNmVESW9hNExTcWQ4RFZIOUhTdDFrNzNWRUNoK2N3?=
 =?utf-8?B?ZXBlc2RCc2U3d3kyNDR2UFdWQ1psNjZsTTZxK1dteGdxaTZMTmNPa1hOYWVh?=
 =?utf-8?B?aUovNXNDYWdTU2VJdGJnWmlYeld2R0JmTG9HVWFjc3Q3R0IyWTRXN1FTNjlO?=
 =?utf-8?B?b3ZwbGZXVFJqemFZa0pIbnV2M1hjQUJUVkdkR1I0cWYxcWZXZHBaeGk0bjhp?=
 =?utf-8?B?S3RMeDBDTEFRZWFBU3FjOVFNaDVackJ0QVNXdkYrVklkU2N1U1lPcDVvN3E2?=
 =?utf-8?B?cjlTVk1EWXlCdklJb2lwVTNGM3RsczhrNnppVjd3d2FFL1FFSEdLTWQvUnRF?=
 =?utf-8?B?Q0pDN0k3LzJHTXIrdEQ5WGRsYy80R05xOVJnZHdXazZmSk91YTk2UldkVDQw?=
 =?utf-8?B?b2NMOE85QlVNL09qcUlBNGtmWndsbWE0SFF5b2pTQzJ6VStlRHNQbUhtaTNo?=
 =?utf-8?B?UTh6ZGJwa3h0RllUQXJWeVZIRlBUWXA5SlJaZkhzQWtJUmJPWnh1U2x1ZmlN?=
 =?utf-8?B?b250OSsxTk1EQjIvcHU4OVJNMFFkV0pwcmRHQzNTSHhWc0ZvRzlzekdkQ3VQ?=
 =?utf-8?B?TlJvSzFkaGZncmJDdEtDQm8xYlJRSzNac0YybEp4c3dGMXVxNEJibEFLR2tH?=
 =?utf-8?B?Y0MxYXB4Y3NoVzQvNTR6eDhDb0J0K0wrM3FHNVlVd1c2QnIzbkozb2U1ZWhz?=
 =?utf-8?Q?RollLVCqNebKjwo9Iu3BGrLMxOf2sabbxPDdepjUCKrHd?=
X-MS-Exchange-AntiSpam-MessageData-1: NUtcD6p44izxXA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90966965-151e-4dca-0419-08dea273cdad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 02:38:59.3013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOI19q/7DZHI4YDE7O7Sp8pVFYGYqln0SRfhwWUKQFNKxsxhXKG1+m8TcYpX2KQUtXb3jHv3jKm/HnI6Af0r+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6774
X-Rspamd-Queue-Id: B8A83464C25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59571-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]

On Sat Apr 25, 2026 at 8:10 AM JST, lyude wrote:
>
> On Fri, 2026-04-24 at 00:01 +0900, Alexandre Courbot wrote:
>> There are 4 sites where we acquire and release the DMA resv lock,
>> each
>> of which require unsafe blocks and carrying the risk that we forget
>> releasing the lock in the end. For this method in particular we need
>> to
>> jump through hoops a bit and store the return value into a temporary
>> variable so we can unlock the DMA reservation.
>>=20
>> Let's do ourselves a favor and implement a small, private guard type:
>>=20
>> =C2=A0=C2=A0=C2=A0 struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T=
>);
>>=20
>> =C2=A0=C2=A0=C2=A0 impl<'a, T: DriverObject> DmaResvGuard<'a, T> {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn new(object: &'a Object<T>)=
 -> Self {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SA=
FETY: This lock is initialized throughout the
>> lifetime of `object`
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsaf=
e { bindings::dma_resv_lock(object.raw_dma_resv(),
>> ptr::null_mut()) };
>>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self(=
object)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0 }
>>=20
>> =C2=A0=C2=A0=C2=A0 impl<'a, T> Drop for DmaResvGuard<'a, T>
>> =C2=A0=C2=A0=C2=A0 where
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T: DriverObject,
>> =C2=A0=C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SA=
FETY: We are releasing the lock grabbed during the
>> creation of this object.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsaf=
e { bindings::dma_resv_unlock(self.0.raw_dma_resv())
>> };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0 }
>>=20
>> There here you would just do
>>=20
>> =C2=A0=C2=A0=C2=A0 let _dma_resv =3D DmaResvGuard::new(self);
>
> I thought of doing this but lost track of how many times I was actually
> grabbing this lock=E2=80=A6
> BTW - want me to just give you authorship on the patch for adding
> DmaResvGuard? Since on my branch I've pretty much only just added two
> inline annotations, it's otherwise identical to what you wrote here.

You should remain author since I didn't formally send a patch - but if
the code remains that close, and you are comfortable with it, then a
Co-authored-by would be appreciated. Feel free to also add my

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

