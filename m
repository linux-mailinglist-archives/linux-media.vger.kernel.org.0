Return-Path: <linux-media+bounces-58588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOZGHo5N2mkE0AgAu9opvQ
	(envelope-from <linux-media+bounces-58588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:33:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D713F3E01DA
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2A2B3061D78
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 13:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2882580D7;
	Sat, 11 Apr 2026 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RSKVlVn5"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012029.outbound.protection.outlook.com [40.107.200.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4ED611E;
	Sat, 11 Apr 2026 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775914373; cv=fail; b=pRQgZkKwcrb28Iw42TYu8u9zAvzqHlEwjyhgZFkGSimqC7owiD9UYZ6UrZVGRtJiG08cm4WwR/+FIGqkB0DB69jJNifXRFacaaTUo8Sh+97z069gPDW0URYdy/uEs720qoW301BkBRUmNAzFrF2uaczUZvwrmYhe2hhVDbLEMO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775914373; c=relaxed/simple;
	bh=+FNzlON56ZB00lWmV+YL4ZzYfrnzA16YJ7/B0qnVeNo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VAh9w1Cfzm0la60IIuBWGqbHZeg2TJxqhheOQvmyuU1cJG0DBZPqu6IO2HSJW93bS2C4HCfZm7p67WfZ2e6TbIJAYC6Hj1qfdP9w7zXPbAiYPsxdqxSP/lKLHS5JnAeRTM5NlIzcGit561g1Pjg0gTDqvlTtFqMRH07XxxHHYKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RSKVlVn5; arc=fail smtp.client-ip=40.107.200.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uD+5dyTE6sCV95Yx3WmlcCU3diRHEI56tzOMJG5LlZg0cXn3UXjRzFAS81w+xPSKhIjWJxzooau1rCDnud2Z6Q86XpijAx+mL6vNoaerDmLhnr6rmvge01G3dKSCmmhCQ3bZmZvHX+VL1cO39WwV/oGFRN2jtalonnmrxif8MSsky3Jmkv7VrqnXgaxC1SqOgKVbE+ewnALlQVeZQUJKz75s29sBpNklkknBWvWGCw8mweBFZDFZxYSDklvcTGlun1Y4U+vImQ5nS0huulysbd7/lptLUMM1Mg1Amsbx2/BOmr2jPLKhgsl74eNJb1aMiq6EjQYp95yWPOqq46gcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IDfgeBmwQeNTL7XBGDuGSBMO5e2rkJd8wN7HJTJs3s=;
 b=t23O+uakM4ip6P60rEMGqOX5eghphasOnCLNKA3jAxQ1kkbmLV5sm0z82b0gleYLhGxT3edysrCQtaZMFlgyZwa6cod9YK4GFsxnDGoM5723E+BEfbrBWVUtgJaSt1Zesvk7XjsAMBnh7QyupjsaIFcZdRJAofWTS3jbM3g8PykIAsL++Ap7eSI+AIMq3yr6fpPQ/R0NgpGXkT9jEn+386QW1QAsk7cwS4uK+Uf3qvtIpoiF7PLm4mVAXkrJBQ7bruJWDOXy2wO012j1Y3eUfEKBxlsBbddJHGTIyruUtX58uvM6HG/d+srs4z8B4lJIyYqoUmhsizvUxxWaw0tBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IDfgeBmwQeNTL7XBGDuGSBMO5e2rkJd8wN7HJTJs3s=;
 b=RSKVlVn5pUxbniRMmj7Y1gc+AYUChqg3C4WAeDpTK5dcexwv4ukk025a/fyZSp7YxyDb/qbfKY1jcQ/g0rUb3pHpXw/tC0hyG5gS+4SIxJeJQV1QfGrot0UO6Lq77VxfeOOMJA+kvTdRAUXqC1EehzzsBjjuQgu4J/uRkgZ+bGVluuLThIZkh2ZMLWVON6rjb4d9UMuS0GQr/uBpCmFX0u/R3aNhyZU0OWTq6oT8mo5R2HRmRNlAFwtEpJGnVcCFqzVMyXa2xlbeJElCuy02HQ5nNCNU74vDotq1s2NKRAyAL6+MpWt4E5Mq3JBwkebcMCf0doqCRW2GK4QUKCSErQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sat, 11 Apr
 2026 13:32:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.041; Sat, 11 Apr 2026
 13:32:43 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Apr 2026 22:32:38 +0900
Message-Id: <DHQD3LJ6PA12.8H8P3FUPSP9K@nvidia.com>
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
Subject: Re: [PATCH v10 5/5] rust: drm: gem: Add vmap functions to shmem
 bindings
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>
Content-Transfer-Encoding: quoted-printable
References: <20260409001559.622026-1-lyude@redhat.com>
 <20260409001559.622026-6-lyude@redhat.com>
In-Reply-To: <20260409001559.622026-6-lyude@redhat.com>
X-ClientProxiedBy: TY4P286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 379003f8-f333-457a-5331-08de97cecedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9p1q90t07orT2nQEFvoG2knfWsx1sI8HOm2HUmwO9K3pEV+cTAm7zvBO+G43UByVwArJ5iym9ykTVVHS0XFkS2zifAGDOG2759CCd7qEUP22P7KJs3/2/65Q3hLygdXZ0Im1dc2GCX0cHJx6Q1UsfjSKWZwUqvlYJkDXcJrA46zmKJjefYK93KbXldkpCRoGPgrt8gZCtTC7UfK2b9Z+QFxjepU0fLoCDOyb/rR8jiy0Zcy7x2UjLPLH6BDR6KqNyqgyuO0J4qAZt+UHzMYVawCTyMXWPQpmaYo4KBQDJ7ZuxqDMh7kMka0MWCfaRfHcR1hxwIjrpLNCfbQp1FToyaJScqeYCCB6jCeDEIYBKb48oPEtiwTXILYh1RYB8A1wL3uGEJqg0q89SuBdLJedpwvJY+Zm8XpZGBECCReeE4tK5l9KjenjMkQM7xXFIT+tK1Nu8vvp4OIMdU8ClbXHzczsGTdE3nPYxhdJkLzzAZmlTvRU01p13rf5pBlyxt7emtDKZ7aMSkK/LuV0s6wlvhm7ut1Vqg+uUkOr6nKzIqDw/yRIt/zHVmpmZV+sA0oOBhvVi87selp4dptRB9+xH86JDBrHwZ8Z4IIc31HZvv83fbU58iAyBRTNfw2qrA5acfAJDE5ZYmx///IRXx+xn5SBloF9+TGcAsMT3Crxrc2xZHj0pQZ/YdCS+MECzb4x4Ahs4WuLfTWXucMH3MgweyR7zslyNxwTPRvQkiPX0SQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clJ0aXltUmEwV2VQZm5OcFBkMEdiZ3pBV2RIcEQwLy9jVUJucjlOMVJsMUlr?=
 =?utf-8?B?QnBxcjNnb0FRVTJ5QXBlbVJFd21WSERLRkVSMGs3d2dOMFU2SUN5RU1OSEFt?=
 =?utf-8?B?ZzJiVkhiMW54eWQ5NGFabjBsM0JyYXJDOGJaUXpHRU1EM20zQVRWQlZQU2tN?=
 =?utf-8?B?VTdJb2hXcEkzNjUxUm41T1FGZ3ptVDM3amZiUlNSN2RNWE1IK3BVVHJnWjl0?=
 =?utf-8?B?STk5b3R2eW91bk4veUhOMkY4SVZqNnRaemFpVS9hM2hZOHdMRVZMNnBjZXdi?=
 =?utf-8?B?ZTlNbXRCL2FrR2ZSMnJpempIWDBJNUZnNy9RVnhsaWswcWc4M1BoNW1aUHRa?=
 =?utf-8?B?NmpSTENyS20yelo2UXdCaHc0Sm5pZytMZkQvRlRHcWVsSjZGM1JMNVg5bVdv?=
 =?utf-8?B?SVZ0U0N1SDQ3WXAyVmdMeXNsOEVhV29ncDdjK2ZiQVdPeHd4U0NiemxNejI0?=
 =?utf-8?B?eS8vUC9sbUtWajNvUkdha21OaW51ZmdrdVU0akZJeGw3SDB6SmRYbVZiVEti?=
 =?utf-8?B?OGtaNUx2eGhzNTVxYUUzZGc1ZGtuVHErdVp3bGlDMWs5Z3hyQ0NZR1JRSmZQ?=
 =?utf-8?B?RGhUM0FZd1BoZDJkNTJGZk5mT0R3ME5HME5QRVJ1YkRaWFVBVnpvTmZrRk5w?=
 =?utf-8?B?aGx1TkMrNFVqanVBWksrK0ZjWnNqV0xqU0R3MWxkSE96SmtFcUlsV1VRR1J0?=
 =?utf-8?B?NHNmT2gxUXNzWU5LVUIwRDM0YjhWZkorYTlIVWlialNLbWFlL09BdEgyR2x4?=
 =?utf-8?B?RkszMmhYc1ZCQmVOcE1IaUJYR24rUGhOdERBSzZ1MHRDa3l6RmI1VW00OUJM?=
 =?utf-8?B?VStqVWN4dDFMazNSanQ0d3phRFZvM21KTWk5Z2M5bGhOWVQ0bUg0bWp2K0ow?=
 =?utf-8?B?V2lNZVF6NDdvZjJDQTFEaTIvcnhTWlEvdlV5TTIrRExCTFl3aU9kMkpzT08z?=
 =?utf-8?B?a2JXL1UrQzluUE13VWVTVEp0VWRkZTJXNXN3QjI0QU0ra09MaVYyTFZsazVh?=
 =?utf-8?B?dWNndHRMdXpJUjVCZTZIWFdsL1J2RWdHVzhSTlplVzUzL21HRmFVbWtGc2ZU?=
 =?utf-8?B?WUdUdVNXQk16aG9kMTY2WEtVaHpRaTJJUjV2WmFGUk1yUVlad2l3Yk1kRDFB?=
 =?utf-8?B?QVJDNHp2Z2pSdXl3TkV3VzlCektIZ3ZSaHhiNm9ScGhsaWdPM0lUeVpFWHBW?=
 =?utf-8?B?OWhSYXFlTE5UNjZXU2Q2M0tJLzJEeVRtUW1tUWpESkVCTnJ6RjcybldDL3hB?=
 =?utf-8?B?OVoyRlVJZ2VOU2lqVDZiK2JmSndIUTlFSGtMOUlRc2FIMGREaHBWVlZ4azBL?=
 =?utf-8?B?VUlVc2p2N3ZROUcyL0ZrRGdPekp1bU1QbC9ZekRlVWlSU2QvdEJOc2hGMGli?=
 =?utf-8?B?RjVBNkE3a1Y0a2E4bkE2RFlFWTBnVFY4MDRKc0VRbitoSzZEQXkrRVlQTkdp?=
 =?utf-8?B?QVJROFhtUzFmM2kyNGVtODR2bDVDdlBaaTdqQTVmM0NENWtqSnF4MnY1bkhK?=
 =?utf-8?B?VW5nRHU3TXhyZmg5Zmp2SlJXKzFvQjdyN1Q0cFVWVFB1K1FvZE1NR21ZZkYz?=
 =?utf-8?B?dEE1K2tCT0hqSFU2NGxHNElBNlZkam1JS0NxNW9yai8vcHJLdkRwTVZ2bWVS?=
 =?utf-8?B?bWoxdFZyNWtveEF4TVBjY1lTNndrQlRvOFM1L2ZZUmRKR2IxbXlJUmdqZG1X?=
 =?utf-8?B?SEtVTzIxV2VzRUFFcDFsM0pNc0grUWxxL01nZklGRFd4Q3ltOXVPTHRaMzBY?=
 =?utf-8?B?WjI5VG0zSEc0TXhsM3R6clJlZjBFYnM5cjVhSis2dTNSNjZQeXlJbHhBZ1E3?=
 =?utf-8?B?V01qVFRUdmZ2UmJDMWNuTVdoTE9jUnZHV3JRdWk3eHU3YUJZajBoZlNVZW0z?=
 =?utf-8?B?TUxXM3kyVEMwaUZiSWlxZXcwK1VWTXNrVTNpdzZZVVVuaTlIYkgzMEdQY05t?=
 =?utf-8?B?Kzd6Q1p4SlQ0VndDVlBiZU14Q0dDN01OUzZKajgzNFAyUTIwWmh0bkJ5U0FZ?=
 =?utf-8?B?TG9KMnB4M3B6aVhiak8zY2I5eU9DWlZ4eENHUC9xVmZXdUZTMEsxTEF2bzJu?=
 =?utf-8?B?WDRpbnVFdWFCemhpZ1BtQ0l4TWliRDB0T0JLUHh6TXZhd0pFRUo0VmwvY2xj?=
 =?utf-8?B?bURXK1FjL2RkdUVXbUp1T0hkbk0wOU5IUzB4TWMxMFEzRjBzV2RoUXJ3dHF2?=
 =?utf-8?B?ZEtjWGVqZkc2emhGczZQZCt5ZkpxK0ZQdHFWQ3BTOVYvcHFCZmIzSUZuczh0?=
 =?utf-8?B?dDNTeFh1L3Boc1VUT1FScXVTUjB4cE1Wd3lPdWhUR1N4aGNVVXhveXRycitO?=
 =?utf-8?B?NmxPazRSazlQVkJCS3grTGJ6MExEckNkWFBVNGgwR1FBNGVBaFBUeWE4emdt?=
 =?utf-8?Q?5qmTwbDN319pgCDZNuSjlv5Rt65AHf57HRkWZHTZOWnVK?=
X-MS-Exchange-AntiSpam-MessageData-1: K0ehdg7Umcgbtw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379003f8-f333-457a-5331-08de97cecedf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 13:32:43.7569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMpWW2OBJ/ecbhenMlS0ll65xtYoKTfmdXN5rl2mtTaXJa1U6ThdYH1e2GA+Sqp24oQV1v/SiRdHQS9iuAueOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58588-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D713F3E01DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lyude,

On Thu Apr 9, 2026 at 9:12 AM JST, Lyude Paul wrote:
<snip>
> @@ -288,6 +299,84 @@ pub fn owned_sg_table(&self, dev: &device::Device<Bo=
und>) -> Result<SGTable<T>>
>          // `Some(Devres<SGTableMap<T>>)`.
>          Ok(SGTable(self.into()))
>      }
> +
> +    /// Attempt to create a vmap from the gem object, and confirm the si=
ze of said vmap.
> +    fn raw_vmap(&self, min_size: usize) -> Result<*mut c_void> {
> +        if self.size() < min_size {
> +            return Err(ENOSPC);
> +        }
> +
> +        let mut map: MaybeUninit<bindings::iosys_map> =3D MaybeUninit::u=
ninit();
> +
> +        // SAFETY: drm_gem_shmem_vmap can be called with the DMA reserva=
tion lock held
> +        to_result(unsafe {
> +            // TODO: see top of file
> +            bindings::dma_resv_lock(self.raw_dma_resv(), ptr::null_mut()=
);
> +            let ret =3D bindings::drm_gem_shmem_vmap_locked(self.as_raw_=
shmem(), map.as_mut_ptr());
> +            bindings::dma_resv_unlock(self.raw_dma_resv());
> +            ret
> +        })?;
> +
> +        // SAFETY: The call to drm_gem_shmem_vunmap_locked succeeded abo=
ve, so we are guaranteed

Looks like a typo: the call above is `drm_gem_shmem_vmap_locked`.

> +        // that map is properly initialized.
> +        let map =3D unsafe { map.assume_init() };
> +
> +        // XXX: We don't currently support iomem allocations
> +        if map.is_iomem {
> +            // SAFETY:
> +            // - The vmap operation above succeeded, guaranteeing that `=
map` points to a valid
> +            //   memory mapping.
> +            // - We checked that this is an iomem allocation, making it =
safe to read vaddr_iomem
> +            unsafe { self.raw_vunmap(map) };
> +
> +            Err(ENOTSUPP)
> +        } else {
> +            // SAFETY: We checked that this is not an iomem allocation, =
making it safe to read vaddr
> +            Ok(unsafe { map.__bindgen_anon_1.vaddr })
> +        }
> +    }
> +
> +    /// Unmap a vmap from the gem object.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - The caller promises that `map` is a valid vmap on this gem obj=
ect.
> +    /// - The caller promises that the memory pointed to by map will no =
longer be accesed through
> +    ///   this instance.
> +    unsafe fn raw_vunmap(&self, mut map: bindings::iosys_map) {
> +        let resv =3D self.raw_dma_resv();
> +
> +        // SAFETY:
> +        // - This function is safe to call with the DMA reservation lock=
 held
> +        // - Our `ARef` is proof that the underlying gem object here is =
initialized and thus safe to
> +        //   dereference.
> +        unsafe {
> +            // TODO: see top of file
> +            bindings::dma_resv_lock(resv, ptr::null_mut());
> +            bindings::drm_gem_shmem_vunmap_locked(self.as_raw_shmem(), &=
mut map);
> +            bindings::dma_resv_unlock(resv);
> +        }
> +    }
> +
> +    /// Creates and returns a virtual kernel memory mapping for this obj=
ect.
> +    #[inline]
> +    pub fn vmap<const SIZE: usize>(&self) -> Result<VMapRef<'_, T, SIZE>=
> {
> +        Ok(VMapRef {
> +            // INVARIANT: `raw_vmap()` checks that the gem object is at =
least as large as `SIZE`.
> +            addr: self.raw_vmap(SIZE)?,
> +            owner: self,
> +        })
> +    }
> +
> +    /// Creates and returns an owned reference to a virtual kernel memor=
y mapping for this object.
> +    #[inline]
> +    pub fn owned_vmap<const SIZE: usize>(&self) -> Result<VMap<T, SIZE>>=
 {
> +        Ok(VMap {
> +            // INVARIANT: `raw_vmap()` checks that the gem object is at =
least as large as `SIZE`.
> +            addr: self.raw_vmap(SIZE)?,
> +            owner: self.into(),
> +        })
> +    }
>  }
> =20
>  impl<T: DriverObject> Deref for Object<T> {
> @@ -386,6 +475,154 @@ unsafe impl<T: DriverObject> Send for SGTableMap<T>=
 {}
>  // it points to is guaranteed to be thread-safe.
>  unsafe impl<T: DriverObject> Sync for SGTableMap<T> {}
> =20
> +macro_rules! impl_vmap_io_capable {
> +    ($impl:ident, $ty:ty $(, $lifetime:lifetime )?) =3D> {

How about taking a list of types as argument, so you don't need to
invoke the macro once per supported primitive?

> +        impl<$( $lifetime ,)? D: DriverObject, const SIZE: usize> IoCapa=
ble<$ty>
> +            for $impl<$( $lifetime ,)? D, SIZE>
> +        {
> +            #[inline(always)]
> +            unsafe fn io_read(&self, address: usize) -> $ty {
> +                let ptr =3D address as *mut $ty;
> +
> +                // SAFETY: The safety contract of `io_read` guarantees t=
hat address is a valid
> +                // address within the bounds of `Self` of at least the s=
ize of $ty, and is properly
> +                // aligned.
> +                unsafe { ptr::read(ptr) }
> +            }
> +
> +            #[inline(always)]
> +            unsafe fn io_write(&self, value: $ty, address: usize) {
> +                let ptr =3D address as *mut $ty;
> +
> +                // SAFETY: The safety contract of `io_write` guarantees =
that address is a valid
> +                // address within the bounds of `Self` of at least the s=
ize of $ty, and is properly
> +                // aligned.
> +                unsafe { ptr::write(ptr, value) }
> +            }
> +        }
> +    };
> +}
> +
> +// Implement various traits common to both VMap types
> +macro_rules! impl_vmap_common {
> +    ($impl:ident $(, $lifetime:lifetime )?) =3D> {
> +        impl<$( $lifetime ,)? D, const SIZE: usize> $impl<$( $lifetime ,=
)? D, SIZE>

The comment says "Implement various traits" but this block is not a
trait implementation.

> +        where
> +            D: DriverObject,
> +        {
> +            /// Borrows a reference to the object that owns this virtual=
 mapping.
> +            #[inline(always)]
> +            pub fn owner(&self) -> &Object<D> {
> +                &self.owner
> +            }
> +        }
> +
> +        impl<$( $lifetime ,)? D, const SIZE: usize> Drop for $impl<$( $l=
ifetime ,)? D, SIZE>
> +        where
> +            D: DriverObject,
> +        {
> +            #[inline(always)]
> +            fn drop(&mut self) {
> +                // SAFETY:
> +                // - Our existence is proof that this map was previously=
 created using self.owner.
> +                // - Since we are in Drop, we are guaranteed that no one=
 will access the memory
> +                //   through this mapping after calling this.
> +                unsafe {
> +                    self.owner.raw_vunmap(bindings::iosys_map {
> +                        is_iomem: false,
> +                        __bindgen_anon_1: bindings::iosys_map__bindgen_t=
y_1 { vaddr: self.addr }
> +                    })
> +                };
> +            }
> +        }
> +
> +        impl<$( $lifetime ,)? D, const SIZE: usize> Io for $impl<$( $lif=
etime ,)? D, SIZE>
> +        where
> +            D: DriverObject,
> +        {
> +            #[inline(always)]
> +            fn addr(&self) -> usize {
> +                self.addr as usize
> +            }
> +
> +            #[inline(always)]
> +            fn maxsize(&self) -> usize {
> +                self.owner.size()
> +            }
> +        }
> +
> +        impl<$( $lifetime ,)? D, const SIZE: usize> IoKnownSize for $imp=
l<$( $lifetime ,)? D, SIZE>
> +        where
> +            D: DriverObject,
> +        {
> +            const MIN_SIZE: usize =3D SIZE;
> +        }
> +
> +        impl_vmap_io_capable!($impl, u8 $( , $lifetime )?);
> +        impl_vmap_io_capable!($impl, u16 $( , $lifetime )?);
> +        impl_vmap_io_capable!($impl, u32 $( , $lifetime )?);
> +        #[cfg(CONFIG_64BIT)]
> +        impl_vmap_io_capable!($impl, u64 $( , $lifetime )?);
> +    };
> +}
> +
> +/// An owned reference to a virtual mapping for a shmem-based GEM object=
 in kernel address space.
> +///
> +/// # Invariants
> +///
> +/// - The size of `owner` is >=3D SIZE.
> +/// - The memory pointed to by addr remains valid at least until this ob=
ject is dropped.
> +pub struct VMap<D: DriverObject, const SIZE: usize =3D 0> {
> +    addr: *mut c_void,
> +    owner: ARef<Object<D>>,
> +}
> +
> +impl_vmap_common!(VMap);

I believe you can considerably reduce the use of macros and consolidate
the code around a single type if you define `VMap` this way:

    pub struct VMap<D, R, const SIZE: usize =3D 0>
    where
        D: DriverObject,
        R: Deref<Target =3D Object<D>>,
    {
        addr: *mut c_void,
        owner: R,
    }

Then `R` can either be `&'a Object<D>` or `ARef<Object<D>>` and you
don't need `impl_vmap_common!` anymore (`impl_vmap_io_capable!` is
probably still useful though).

The extra generic makes the type a bit more complex, but you can also
fold it into something similar to what you currently have by defining
type aliases:

    pub type VMapRef<'a, D, const SIZE: usize =3D 0> =3D VMap<D, &'a Object=
<D>, SIZE>;
    pub type VMapOwned<D, const SIZE: usize =3D 0> =3D VMap<D, ARef<Object<=
D>>, SIZE>;

... although I don't think that is necessary as callers will never need
to specify these generics anyway.

