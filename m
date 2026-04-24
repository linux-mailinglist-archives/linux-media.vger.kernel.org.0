Return-Path: <linux-media+bounces-59454-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FXxGzjR6ml6EQAAu9opvQ
	(envelope-from <linux-media+bounces-59454-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 04:11:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C68B1458F57
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 04:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC05B3018BD9
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 02:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B80926A08A;
	Fri, 24 Apr 2026 02:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EuOy/C0Y"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2756813AF2;
	Fri, 24 Apr 2026 02:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776996651; cv=fail; b=g6qO7EKfE2Jbwtl32LUPGKagnR7O0mns4vUs+DYCTo4OEXNzW4DmITUBPwfm3Unad2cETbC6ix6nucRdtS0x84aStIQkuI/pVbwxbC1wiujynFg5nnS86D4pa4MQsCW5ipzo/B0Z4ECimwArYE/DthRoqFlLnKG2So7h6ISzgTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776996651; c=relaxed/simple;
	bh=djDWhFZOPt5f53uJqq+meO/Bi+wJR5TAic630My/DMc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Kv6pvqq5LkZAn856ux1Ll8sEHH98mhlmH9UaDo6PQqrep0sXjoDkkQRYbM5gaIWWvD4gSn3A9xFfKmHLI7W0slrxszbqx3M9HwnNc9sqcAbzqq8UlBgalMT/vAH1hyZBAykiSZtKn20qwOwhRouynJgxvBYuRey4xU21z48pbps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EuOy/C0Y; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3kIiFUerU+qtnAM2aSaVsbE4Wg+g3c3JlAo3vRjGaK1WJCZNxrtaxiZKUgX6ZW2HhNLU9O/OVoSrmAw/FFK5b7L2jvU4nqbcAEBlVAYKX5FFPB5gYrcCvUV431x3gL8rmEHcgoPOtODHAnsSRq2iwfTrb621voeXLtGxwg0OumzKwqrZj9a6LfUENbRlB+vxLNYLtK+pi5sBz52DoNYmZWOQEwV6hnIEV2Ldl/zJL109eLEHTzbrVrIVxsIUYHfvJnvK/DP5H96su0yRItPSiolE8Q8+EbJUcU8O9hzanrDHyCstuLNLQHFheacTsg2zYojZihcMWHoT9MyxM4TTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFfYVCV4NrCqRG9qv1CudX4S6c2ibmf5eAUFDLyCVww=;
 b=QP4ZxDY73t6yTjG5A281TLy9BdGGuvsSytC//hCjGKX4ctYSSR/fiDsjKtNmj5A09IU7a8b0lRsS96VbMbbBCmoo3wmVe8yewwT/2RoinWYlYnPeLtkHPIO6YOU7mqw1Yk3mcwaF8v14krBbQQspa5vh6CVbxBrnRNopXLlOa5soewjGWYrRhD1ycWG39eFRgAaeqQmTRy8jnPf6n87k+B41Hdj5R1R89IPtHbn4rIhvj8ilPmN1eTX/Lp2GYxzbSmfg3/HpF+TOyneDDgi8q4QO52evy6K4DNKzmRrKE12LN9F9DbCcXLiWCzXFWp3OdlQu7WAO8f0E5WJaEzCBkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFfYVCV4NrCqRG9qv1CudX4S6c2ibmf5eAUFDLyCVww=;
 b=EuOy/C0YAG7Or40sbYZ7KRmakaFCJDni8rvFCm92P0P99BD23bLOukaZifARWaoyPLM7DEhnU+zLtc0pkpcJrTCbpqFUvG/0/jvIP1UmHTcP5iJIp4RFvw3ry3ShXE9iXwJ3yUOXb48qij/3jr9B72W12MmCHE8CLEIRwYO35jHut8/LjpbnZ+DVIp85DQ9JFSCqDiSmxRyt8I7PR6cOPKw7wFi160LmPB8hqclakNI7ql3cNKdJRM2ZrXgY0UPjI5gcdvOUk2jt7KH2GZ4+o4yg7JHLwdlzMOs2YbI3mKSkoFMJAJnjNlFfEE5fi1RNxglhClm91MFL7VM9NxNHmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 02:10:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.019; Fri, 24 Apr 2026
 02:10:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 11:10:39 +0900
Message-Id: <DI10QIODI69N.RKZAXK5PPLN0@nvidia.com>
Cc: "Lyude Paul" <lyude@redhat.com>, <nouveau@lists.freedesktop.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Matthew Maurer" <mmaurer@google.com>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>, "Lorenzo Stoakes"
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
To: "Gary Guo" <gary@garyguo.net>
References: <20260421235346.672794-1-lyude@redhat.com>
 <20260421235346.672794-5-lyude@redhat.com>
 <DI0MI6UF325Y.2TDWZGCN3WGIG@nvidia.com>
 <DI0MOCJ8BO4A.37OS3YPF3VPK3@garyguo.net>
 <DI0N2EDVV7MI.UFR6TKHDJLZG@nvidia.com>
 <DI0O1G7AX1I3.1SCSOLCPR258X@garyguo.net>
In-Reply-To: <DI0O1G7AX1I3.1SCSOLCPR258X@garyguo.net>
X-ClientProxiedBy: TY4P301CA0094.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f8c670-4df1-4388-e877-08dea1a6b152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L4mw3wDoCuG5h7dMA8rrbCODuPkx0udrQkjFFbgBBCLxftS/X6nEiM+2XTyvUysiw0FTB6LBzb5Sytsr96YIuI2HNFllfdWal2BnCENhcyaG76Ir41+CKHMGQfd+HIf6AoumT97Br/5srpYqX2vuYO8137mlpLJCn1eqsbsnwspIWA0lC4mb+ni1L9WZXEb4a0O/nUCYHYcsfn0a8cJj0YQg0YWP8BGGdM9cf97kU9Uxr/PvA8ETbMUM8IBIIQodQs2zGtm/ZwTlK+1wh2Zug5HHnaTkZkChpUauAqYMUKE4GVIlU5jJ34xfmXEKpRltrQJvYbVOz/9MqXEIq3JWZUwZ6km/9KgVZ1PZFJkekzA9aAXEKxXQRzkLozDK45qz/KHeJh9G1rku/iLQBluVpKaSnizk4nHgoETqZsuV/NFFtNMbiTgtMoVtS6R2P328WT98+f6LXV4ekWKCedBg+2dEvRYABw3k5bupLUavMh7t84rYV3ekCsYJSNy1DXiRG52rErs7+MpiZqyRhsgPSH2ZuE7J2kJ7QAFQJomq/qYdEJjQZTnmmf/pYEUxZUhWR7yvl4VzxowTvHmNAshvEyi/MDbA6mA4hOwE3qHRIYO+6teq3bJy2fQZrup3BOuwk0cncb3xgO+ZgFuLVZhBvFtGvmxiv1vq/ksC4QHsSP5LTvWJyMZO+VXfZnKWJi+8CGypkpkc7qkwgPr0YEuoDrDbDcZbNVncVXcJQ47cUIUZtSBfva/Kaz9yZNv3jHzI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG1Hc3Vzc0Z4U3c0Q3JtNnh5N2dRdGt0ZThEVHpLOGdMYklJVnVOSisvaEti?=
 =?utf-8?B?QlZrMUxtc0VmT0IxYzhBZE9RSUtXdllYN1BYYkwyTGRCN21xM1ZLamIrWHpr?=
 =?utf-8?B?OGtEWG8wbnNQYkY3bHNERjZHVzlVc1ZnekswRnV4cUhuZnV6QmN5WjFpbWh6?=
 =?utf-8?B?VmxVcUgrNWVIT2lIZFZqcEJkZjFkd05MbndiQm90YnVXb0hPZ21uc3prT2Jq?=
 =?utf-8?B?NWVRaXdaQllBMm9CUWwwR2VxN3MzTFNQRDlRN3lMUUUrU0dRbGxPWG81Ryt3?=
 =?utf-8?B?d09QS2FUeTJqZUFGdXRyemM1UU1wVXJtK1hmSU5uSlMraGlON0FGM2dVQmsr?=
 =?utf-8?B?Mm5GYm9JTEp5MU02bEw1ODZZQVhoWnh6L2xhUTFWVGltSWhwSTNNRm9sa2Ez?=
 =?utf-8?B?aUQ3TWlxek5Uc1ZQNXhqKzdaZ1RUN0ZvS3hBZE9SUkJnWUo5Ylc1NVN2THJW?=
 =?utf-8?B?MnltNGhkMUh0T1BDS1pDME5TMFArYzU0RngycmFtQUh1WVdtVm5JQVJqSmVM?=
 =?utf-8?B?eW9CdDRSaWtyRFBSdUtYRWo2TFllL0g1UDltQkZQNkEyT0lRNXozeUplSmJn?=
 =?utf-8?B?ZHpIQXVkWnZqTXlJYkpFK3hRUzE5aFpvQk0zUy8vWTdGRURJcFNZa3dQeDly?=
 =?utf-8?B?NVRBOEQwbHkxQ1ZjbUt4TnRmY2t5RGdCQWVlYnRyNU9XRWRQeE5nTnBFZEtM?=
 =?utf-8?B?cERZZkNyU3hpTW15L3NXeWVHL25XNXE4TTRVTTRhZlpTUmpxaWlKTmxOcFpt?=
 =?utf-8?B?RmtuZlRBVjRvU3U1TzNwYjhkQ1BhaC9pbFdiRUNwcTFtUnlqbjRjd3dFVHM4?=
 =?utf-8?B?aFkrVkR0TVlxRVhrUDYxSjg3RU5QQ1BpdHJwOHN1MkhiMWpsT3d2VXRQbEkw?=
 =?utf-8?B?UUdDRml6NlVMU2JXV2xrN2pnWkxaMUdpaE5LUkdKRWZ1N2xOemUveGNMcmVk?=
 =?utf-8?B?OW1KQkczYmoxSzN6YlBZajBGYVMxdnU3S2ZXRndFTTBnVmVOcnUwaXRSSklK?=
 =?utf-8?B?L1FNWlpmWWVkL3N2SFVsaFlSMGJBZDNWK3h6alJ4T1J6VlVKSnhiZlpsUzB2?=
 =?utf-8?B?ZjY3ZkxuVS9iZUhkZ2w5QkdBaU11ZjlHSWlLSDB4L0duaHNGekU4UVJPRDds?=
 =?utf-8?B?Yk9XWThaemFlRmdJcWt3TjZyTmdMcWVVdHoyZjhNVGdhL2pkK3U4ZVlaazFO?=
 =?utf-8?B?VDJiYTE5ZTZGa0JKcHFrZnVqNkEvMHZBS2JaQUhuT2xBT3l4S3U1b3k3NWRX?=
 =?utf-8?B?UlN4eWdoNU80OGUvSEkzSkhNaVdlYTBGMFZkOHd3NzhKRXNlQzdGNkRVNkdM?=
 =?utf-8?B?aDVNNERxV1dRZmhuSElFdG44eklKUlVZejhWSkJhV1krNWNxTlFsTll5UzFN?=
 =?utf-8?B?RmdEQU8yeUQ3b3JITUNXaFRmS295cXdLSzdISSt4ZTFkbnNEQTFHTUlmYlNE?=
 =?utf-8?B?Wk5lMG5SK0Zmbi9Ca1Bxd2U3RExjSktIeTBJckhuY2g3UW8vc2xoNTFuQlFN?=
 =?utf-8?B?YnJ5a2lURmZ1c2ovZVJxUmVyMWlyNm9SNVVvRktjcGtybG9ubEZrdS9xT3ps?=
 =?utf-8?B?Y05GYmJlZmxRLzRaS1dhSGF6cUhXL2xCbnBWejRLZC9aZEtEWFkveTZGaWZJ?=
 =?utf-8?B?T0Y5Z2R5Z0JSTUNleE5URWs3bzREZjUzR1lEc0VSdzU0Y0FjNG9BSG1TT2JL?=
 =?utf-8?B?MlBjZ0RpdUdQY1JwNmlHY0F1Und6RndRUDNhamsxQnptRFJjRWhzekkvVmlG?=
 =?utf-8?B?Yk1kMXVMRktJbGhiWkg2WG9WZTkxVHliSndMVDZGZkZsSURtaFhaVmdPR29s?=
 =?utf-8?B?dUdrUjlSYnhKUFpFRHBScEdzZ0lBUXlaVE05YnVkSzFaNTJHM1B1djdHUDY1?=
 =?utf-8?B?QlcxY3pEQjRKYWZmeStmZTE1OXpZbGZZTE9TL3NxeHFIOE5ZSHZBR2hiMzZv?=
 =?utf-8?B?dmFNajBseXJhYTFlVG5mRGJOS0hHdk52djVvdXN4TmpBZ2dZNnV6OWsvc1lT?=
 =?utf-8?B?eERWUmFCbm9tV0M3YmM5VlVncWR4WVVVWUVkdG1UQmZXWDg5UnhUMWpmcFBm?=
 =?utf-8?B?UEQxU083MjhubnlMajVZVzE2UHdQLzRORk1BbjZpMmRsZHJpbTFSY1psVG4y?=
 =?utf-8?B?N2ZuMTg2U2RjM29xcUZaWmdFZFBJakpjTm5KN2VaVENSWmJET0lEVHY5U3pP?=
 =?utf-8?B?WDhUZkJ2ZzF4SHM3ZWdSclVwUVBOY0FSK2lzdVR2azF2dHlUZmlQUlQ5TFBx?=
 =?utf-8?B?d2pONE1UNGp5cm9jNXh5V2xWM3lRS284ZS9EQ3prKzloQUoxSWZTNEdVc05H?=
 =?utf-8?B?aVJOczJkMnVWQitNTVJTZVR1c1ZBV3RxbUgvR2VoQkRKejdFaHUvQ0M4TG90?=
 =?utf-8?Q?THuouWYya9nR4vn8oTVamoy8poyDu44/EkvM8ScpLTxlN?=
X-MS-Exchange-AntiSpam-MessageData-1: krDpXfg/C73KNA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f8c670-4df1-4388-e877-08dea1a6b152
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 02:10:44.6563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0YIrxsqaeVC0Z6w2zreouNz6DW6b33ID5xIViFb1neOoyM+829CgmGdR1o/tYkTixsde0rqv/nOpYWIDZVwWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771
X-Rspamd-Queue-Id: C68B1458F57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59454-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,lists.freedesktop.org,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri Apr 24, 2026 at 1:13 AM JST, Gary Guo wrote:
> On Thu Apr 23, 2026 at 4:27 PM BST, Alexandre Courbot wrote:
>> On Fri Apr 24, 2026 at 12:09 AM JST, Gary Guo wrote:
>>> On Thu Apr 23, 2026 at 4:01 PM BST, Alexandre Courbot wrote:
>>>>
>>>> I didn't like this `UnsafeCell<Option>` since the last time, but only =
figured how to replace it now:
>>>>
>>>>     sgt_res: SetOnce<Devres<SGTableMap<T>>>,
>>>>
>>>> It's actually designed for that! And lets you remove at least one unsa=
fe
>>>> statement, while simplifying `get_sg_table` quite a bit. With the othe=
r
>>>> suggestions I have below, here is my version of `get_sg_table` for
>>>> reference:
>>>>
>>>>     fn get_sg_table<'a>(
>>>>         &'a self,
>>>>         dev: &'a device::Device<Bound>,
>>>>     ) -> Result<&'a Devres<SGTableMap<T>>> {
>>>>         let _dma_resv =3D DmaResvGuard::new(self);
>>>>
>>>>         if let Some(devres) =3D self.sgt_res.as_ref() {
>>>>             Ok(devres)
>>>>         } else {
>>>>             // Only called for the side-effect of populating the GEM S=
G table.
>>>>             // SAFETY: We grabbed the lock required for calling this f=
unction above.
>>>>             from_err_ptr(unsafe {
>>>>                 bindings::drm_gem_shmem_get_pages_sgt_locked(self.as_r=
aw_shmem())
>>>>             })?;
>>>>
>>>>             // INVARIANT:
>>>>             // - We called drm_gem_shmem_get_pages_sgt_locked above an=
d checked that it
>>>>             //   succeeded, fulfilling the invariant of `SGTableMap` t=
hat the object's `sgt` field
>>>>             //   is initialized.
>>>>             // - We store this Devres in the object itself and don't m=
ove it, ensuring that the
>>>>             //   object it points to remains valid for the lifetime of=
 the `SGTableMap`.
>>>>             let devres =3D
>>>>                 Devres::new(dev, init!(SGTableMap { obj: self.into() }=
)).inspect_err(|_| {
>>>>                     // We can't make sure that the pages for this obje=
ct are unmapped on
>>>>                     // driver-unbind, so we need to release the sgt
>>>>                     // SAFETY:
>>>>                     // - We grabbed the lock required for calling this=
 function above
>>>>                     // - We checked above that get_pages_sgt_locked() =
was successful
>>>>                     unsafe { bindings::__drm_gem_shmem_free_sgt_locked=
(self.as_raw_shmem()) }
>>>>                 })?;
>>>>
>>>>             self.sgt_res.populate(devres);
>>>>
>>>>             // PANIC: `populate` has just succeeded, guaranteeing that=
 `sgt_res` is populated.
>>>>             Ok(self.sgt_res.as_ref().unwrap())
>>>>         }
>>>>     }
>>>>
>>>> And if only we could populate the `SetOnce` with a `impl Init<T, E>`,
>>>> then we could even remove the DMA reservation acquisition on the fast
>>>> path, because `SetOnce` comes with its own locking and the DMA lock he=
re
>>>> is used outside of its intended scope. I'll try to push the necessary
>>>> work for `SetOnce` and maybe we can do that as a follow-up patch.
>>>
>>> I have this sitting in my once_wip branch for while
>>> https://github.com/nbdd0121/linux/commits/once_wip/
>>> (the specific commit that adds init support is
>>> https://github.com/nbdd0121/linux/commit/4aabdbcf20b11626c253f203745b1d=
55c37ab2ee).
>>>
>>> This was implemented for lazy revocable support which Alvin has picked =
up, see
>>> https://lore.kernel.org/rust-for-linux/20260326-b4-tyr-debugfs-v1-1-074=
badd18716@linux.dev/
>>
>> Haha that's pretty close to what I wrote to test the code. Do you have
>> plans to send it soon?
>
> I mean.. Alvin has already sent it?
>
> If you (or someone else) want to carry the patch in another series, by al=
l means.

My bad, it was late at night and my focus was a bit down.

It's perfect if Alvin keeps carrying this patch.

