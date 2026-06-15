Return-Path: <linux-media+bounces-64899-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v2W3DNHML2rSGgUAu9opvQ
	(envelope-from <linux-media+bounces-64899-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 11:58:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74378685371
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 11:58:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=qIyRg3TD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64899-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64899-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1C8E3027B5A
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7543DB655;
	Mon, 15 Jun 2026 09:58:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012028.outbound.protection.outlook.com [52.101.53.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D4015A864;
	Mon, 15 Jun 2026 09:58:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517488; cv=fail; b=M/nB809t95UUlLMNC/E+ITzBXPS63CJU4VnTis7c9rbF3UIxNsVeREdXxDLrG8vZIsESDQHY/zfL5Canzd9ToDwRGHlLNRzTFpQxKPzxV3MEgSyoQaEDlpDzNoo0qat+xHmuuXu402fjKb6MTjROLl5ZQJ9jh+nfBUyB39JvDLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517488; c=relaxed/simple;
	bh=9kH7ogNjf2gB4SplpJi3w1cYXjAQHvU//wACfc7shmA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pn2jx5wbyf8NoRLjG/ETAfA1mrCtpTAeqfpQ2RmtQZoBFWEVHd9e6gpk2AOrW1XYAJm3RWiLE3d0ksW1H4fp3qK/O9XFatZhjEw9JqXpPAxwUhPs/G/fB+YG2aS7nkBd9ywJ7XvufYoRB14RwlqIbpu6Gs9Bgj/ZFQCipKM1xCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qIyRg3TD; arc=fail smtp.client-ip=52.101.53.28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFd16rlYkWkUOcUYwHSsOCdop477Hokm9ACJi7wNSxz+sqwZeUt5lnx7SvlrZTzCM0UchZe4OpprwDjA5TGETzQuBhJAzAf+/KqXoGqlIacQA3VbYXlY63wBMSEnnEGl0GJrkNDiKdqDxw4jFVW2q0VC1uRI0mqQwS3wTjzp0LaxPrlJWxmk5lDi+oV6P7Yx27PU+I5AAgPYB0Rq4CiHVMgV38+6P4U4XS4HsGlM8c5D49iT/WHyuLiWHgpLMfeySfGShZvw/+yrc8NMhr6+bmz8Tq5du2f9aoSFWZZzwe3UhcBh4k84LAdsXfIhBK5vgoHpgaivAjcpBeGvPUWMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9S+1wwVElBFSB1eGUyQGB3yDrqAFwBt+AvGUwrLVvs=;
 b=i2QAOCubCUp8KSv3SbORgL2QPjW8g7HuS2enFIvIlm1/zTpmfnZAtDpiPK56bF/5ATaw6motrqj5l8xG3ixMc8DSUM3qloYCi6O4Mxsl1bm/su9TK1/Xw8ol7G7iknQA+N1SaLtFuFxoAsOBDZG/nYyjdd1b0iBMw1Xo3g13QZbMSghIvhX/eHc46djbyUVXdllsjAm/xdsyZUfF2QuldhHNEUIHu/vWUNMz0h8jaW5SFJSF+TG0NA0VIHd+ZaiigUa7lEzyFpKhII1lU09iGyJwhFWK3aAlgXtG5C5V9xneoBPbGDnYKoTu+Nx7knk9cZaxSflSSAfMc+oJPiKlsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9S+1wwVElBFSB1eGUyQGB3yDrqAFwBt+AvGUwrLVvs=;
 b=qIyRg3TDm8XdkpVVJEW56Wdsir4eZ0gQ83ra1fnp4hZmFsO1OLkdAkFpBJd1e7JlbrGNPznGESlO6azJL9MF4JqReRoBj4BAp877vOEqJqEJPmQBNs3WMqC4K0gYn10vBHjFCZWRQ8zj0zTvrOV1dv6YDit5UNx+xUdaj6gPqE4=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6663.namprd12.prod.outlook.com (2603:10b6:8:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Mon, 15 Jun
 2026 09:58:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Mon, 15 Jun 2026
 09:58:02 +0000
Message-ID: <6ea6c373-c6cb-4221-ad9d-e60b04d1368f@amd.com>
Date: Mon, 15 Jun 2026 11:57:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Properly synchronize dma_fence->signaled bit (Was: Re: [RFC
 PATCH] dma-fence: Fix races of fence callbacks versus destructors by locking)
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>,
 Gary Guo <gary@garyguo.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260608142436.265820-2-phasta@kernel.org>
 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
 <fa0dc9757bf8343516c4b156a2b70ec91b64ef8f.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <fa0dc9757bf8343516c4b156a2b70ec91b64ef8f.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0424.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: edca0677-d2d0-4b37-b6c7-08decac496af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|18002099003|22082099003|11063799006|5023799004|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	IE8C1cOguqDX+jXUu5uroic95d/v66rdCQ+SE9wlBdZzBxt3ISKIyeP4yEqxekt/m8tgtscpaJiwGfCPnLzuRZT+nCmi7cKi8v3oQDioobywvwsoxbmpmFvmNPif66NZ6UPD8MkBHZduBxOmOBpCN4Xyy4nyiv4J6SwzD8uSdztWNBGIxQlk+KWg3K1gEamJwo3xIlHYu3VtiRWx7QA0fAMXZ5raMrXf5C9ehHsR/CKmFdsUSDxddOfgjiq+UJ62GwsoFw+GIAUSGEgzR+TUvRbtQ3IGKzpjbEIVUDw7RCZm1HstEbaEo/x+2yS0m2X71l62+iBWcMw3KWT/sxTKdSPPeUqbq7DvXAcUFyj3fnhI6fW3RfggrlpIbXUmS2Gbn8dUI0CCz2WA8x+eaCaGuSJQ+4igfFKjctNHzG72Knn1AWpVw8P9duubgAQ8BXe6ZzhLLPVgPg6ulvS6mBkp3Odcq7VqdDHT64EsoPn/xMEUpnTIT22nRmbf01dXUx95j9sLlRXonN+Vnqpnl/8brCK4rN96W5VohukKv/MeKRzzGQc8CtX8QT007LpflmdTs/zSJHNhYduFYp2/zfHV2rUjhq1m8+rdCKlz6bRq2eyLU0KaOoXNGnEIT2OUpSR97GvTBd9ko0sXPMPggA3ssOC5d4A2f6zbY3qhyT3I7FlKe4gJxldMRLeHP7+OJfDYy0a8XUwqn7f3wmdTOEa5Wg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkpKc2V0cjNYdncya3AzSFdnOGRWYVRuL3Rza3ZpSk5FUmcxK3FkaUloUjRp?=
 =?utf-8?B?dU9TNnk0eEl2aGc4ZWUxWTlWTFE5Q0dPTTg3Nzhja0tFYlFGWFdZREVHUG5D?=
 =?utf-8?B?OFpxaHQ3bndqTndoRnZlK0w1czdMR2w2b0FOTksvL1h6MnJ1SlVrMDE3WFI0?=
 =?utf-8?B?MmovSUZYOXByczJSVFI2WVdrd2xVd2U3MCt4eXdoTkpVbStwdXVwMWJOOE9t?=
 =?utf-8?B?a2I0b2lWOGoxem1ROG9TRHp6WkVtelNlY0JUSmFlZFMvcGp5TEJOVU5ObFo5?=
 =?utf-8?B?Z1JsNXBJVXcrWEw2aXd4bDgyUEMxYTk2SXBmMFRncFh6RnpVcDVieWkxSEla?=
 =?utf-8?B?dU05Wk5yaGtQajFJSittQ1piRmI2R0x2MlF0WlNMM0F4Mmx3bVd6aURkUEI3?=
 =?utf-8?B?Y1c3SFJtWmJCMkZwREszbWlBaUtVQVh4ZS9DSk5jV0EyT1NmVjRpM0RWejU2?=
 =?utf-8?B?VmhyUGtEWktJSEZYMlh5dzdPVDdvSHZuN0lLVlRzUjQxTEFxZWk3dlZTa3Jp?=
 =?utf-8?B?OGFVL0FqYXJ2TG05VktLYkRobnhqWGFnSnY3WDlMNk9RL0pkUUdjQTBJWHVQ?=
 =?utf-8?B?VGxVT2ZsN0crckRUTTd5WG90NUVSNlVWU05TUDVCY2hkQ3VMcXNxM0J4M0lo?=
 =?utf-8?B?MFlxa1JPZlF3S1NEdUFBQk05VUJZQm53a0hmQTlrTkltdkZzQi9DMytyRTRs?=
 =?utf-8?B?c2lOVnB5VjArR2lEbUJOdVpGb09FZHMxNjYrTjBNN0xCK0h6NS9GNmx1TjZR?=
 =?utf-8?B?UXdwSTBWd0dBTUhjRjF3RnZtY0p3ZGpib2twYXh1OVZJbXBpTm04bjBZdDBS?=
 =?utf-8?B?VXdmU1grWkREUS9BeHpvQjdjMmtKekhNaWlEcTBnWnBSdmdaeWFRT1lNWkw3?=
 =?utf-8?B?TnBIYithbVcvcnFXOFM2UlB2SGpKTGR1SGxMYnlDVHVUZ3cwU2tWSmJ0UHlQ?=
 =?utf-8?B?N0JKaytRVkRtaXVWaUZncGhPbndqL0lQOXNLTTgvNzdSWHdDUjk2eWV3UERU?=
 =?utf-8?B?MGlvc1prU3FNVCtTSkR6ZWNJWUxFUmhUVTVYalM2Mm9aYndieVJkb2hCWjhX?=
 =?utf-8?B?VG9nenZvRnNFUHA2VlRaYkJWYUJVNUpybFZnZlREaXRreW9VYUJOaTdnaEc5?=
 =?utf-8?B?MzRRc3dEU2NiSzUweHZUVTRsUk9PeUd2cTZqWS83Sk5RczhSb3NNdkZ2VEJI?=
 =?utf-8?B?MWpRVW5ONEVCcHFaTDNqTHJrSDZ0OE5RQytaY1A0VUkzY2ZiS0swWWt1T1p6?=
 =?utf-8?B?Vk9OYzdXWjB6TFZ4Zlc3U2taOExGWlI5N1dpcEM1S0pJMTZSbDhrWTZMcENN?=
 =?utf-8?B?ejdpTWJXV2krdzJCQ2Z1bmxtNEF2aUd4azNJTWxCN3dweFBsOXR5YVo2YzJK?=
 =?utf-8?B?UldqalFVS1RaMjhNbWVMNlFBZC9DMG1PTFFYWFNmN21aQU1nQXhaZUdCckhs?=
 =?utf-8?B?bUJseDFHb3J2ZXpXYnVKTG55TldWYk95SnRHcmRRZ1l0Wmg4bUdweVkwbjNH?=
 =?utf-8?B?SmlQdFh3ZWZCSjFuK3pCVzNyWlZHZ0o3aUQ3KzVDL1ZEc1hwMFpOYmMvRUtq?=
 =?utf-8?B?cEc2K1lSNERkKzB1akZLRXJkZTFhOEt4cjVUeTgvRllsOHdkVjdLUlhIMEVa?=
 =?utf-8?B?QkZpV09naHhOL0hlRVJMVS82TDEvMEMyUUp6K0JyMi9BK2ZZcjNPWGJqRDZa?=
 =?utf-8?B?a2J0aWI5bVdSL0RRaHpwTDhrQnprR0JycGhWNkxDZ2NPcDdPeHNRREpFK0kx?=
 =?utf-8?B?Nm1oa1hYV0tIL2hDZHdYTytObWZqelVwWTllenkxRUJESm9DeGh3WmttZzBM?=
 =?utf-8?B?VE5oUGcxS3VNekk0a2FRWlVLYmpSZTVWODIrN3Y4RXNZVjlWOERSWE1yZDJH?=
 =?utf-8?B?d0dZbS9wajRRSVZoVnAzSzRUb2JkQVZtYmk3NVBpQi8vRnBISDBsNmtlMlhs?=
 =?utf-8?B?WDN5QU8rSzdmb1lZRFNsTU5aTmJZU0ZIWWFaUFAwTTcreWEyMWNGeERzS1M2?=
 =?utf-8?B?bkxXMlk1eE5XMkptUjNpRVZxcWRyR0t3blprSE5IVFBtNGd1RUlLb05YajVv?=
 =?utf-8?B?eXk0ZUhxaVZVR1o1anBWVS9VU2ZjejNkVlJ4YlVLYmE3eUk1RG9FZXIvYXBX?=
 =?utf-8?B?ajh2RWY2NHl6TUFBTUlNNEwzRXcyL0swL0xLRlNQWjcxN2JOSjhzVjlxNlFU?=
 =?utf-8?B?ZmplRXIrTkZFNEhONndscjVMTHpDR2YxQllBTFdxTVJaSTdEWkRzU1o1YlRH?=
 =?utf-8?B?SE9EOUF6Um83ck40SEtNL2NTOXdERHArWUl3cy9hQXpXeXFrSnpiYng4eWxD?=
 =?utf-8?Q?dUsO4WJyIZ7bAYIOMk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edca0677-d2d0-4b37-b6c7-08decac496af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 09:58:02.5027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSsOjyV9FOjSE1iOIY4KTnQE2/CbNysrTeThi9g/KGrPfnJ+LAgONmR9hvSdsdSY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6663
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64899-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74378685371

On 6/15/26 10:29, Philipp Stanner wrote:
> On Mon, 2026-06-08 at 20:32 +0200, Christian König wrote:
>> On 6/8/26 19:59, Danilo Krummrich wrote:
>>> On Mon Jun 8, 2026 at 7:34 PM CEST, Christian König wrote:
>>>> That's why we need the RCU grace period to make sure that nobody
>>>> is
>>>> referencing the driver stuff any more.
>>>
>>> Right, and that's what Philipp tries to address, the requirement to
>>> wait for an
>>> RCU grace period is perfectly fine if it is only about freeing
>>> memory, but it
>>> can become painful if the fence private data contains data also
>>> needs to be
>>> destructed in some way.
>>
>> Yeah that makes sense.
>>
>>> IOW, if a driver signals a fence, it is lifecycle-wise reasonable
>>> to destruct
>>> the private data that is no longer needed (remaining users only
>>> deal with struct
>>> dma_fence) and having to wait for a full grace period adds sublety
>>> and
>>> complication that can be avoided with the proposed approach.
>>
>> Yeah, I've run into that when I tried to make the amdgpu fences
>> independent as well.
>>> That said, I'd like to ask the opposite question: What are the
>>> concerns with the
>>> proposed approach over (pure) RCU?
>>
>> For example the reason why we have the dma_fence_is_signaled() and
>> dma_fence_is_signaled_locked() variants is because there is a
>> measurable difference in some specific use cases for not grabbing the
>> locks.
> 
> Yeah, certainly, not taking locks makes your code go faster. drm_sched
> can sing a song about that -.-
> 
>>
>> I personally find those micro-optimizations rather questionable, but
>> the community agreement is that we should have them.
> 
> Yeah so this is most definitely broken and needs to be removed. Proof
> is that various parties already need to work around that issue. You
> just never know what drivers do. It's very conceivable that the Nouveau
> case will often happen:
> 
> if (dma_fence_is_signaled(f))
>   dma_fence_put(f);
> 
> 
> This fast path check in my mind certainly breaks the intended dma_fence
> design:
> 
> void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> 				      ktime_t timestamp)
> {
> 	const struct dma_fence_ops *ops;
> 	struct dma_fence_cb *cur, *tmp;
> 	struct list_head cb_list;
> 
> 	dma_fence_assert_held(fence);
> 
> 	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> 				      &fence->flags)))
> 		return;
> 
> 
> Modifying the bit is consistently done under lock protection, so
> reading must be done, too.
> 
> Do you remember who wanted those fast path checks? Who is spinning on
> that lock?

Simona Vetter and basically the rest of the community.

And I can clearly say even if I don't like them that those optimizations are a must have.

> In any case, that needs to be repaired.

No, see my discussion with Simona on the mailing list. I need to dig that up as well, but it was around the time I added the same workaround to amdgpu.

You are basically trying what I have been suggesting as well, but there is a very wide agreement that the current design is a must have.

Regards,
Christian.


> A hacky lockless way might
> hypothetically be doable by setting barriers, as I suggest here:
> 
> https://lore.kernel.org/dri-devel/20260612104251.2264707-2-phasta@kernel.org/
> 
> But note that the ops-decoupling in e.g. dma_fence_timeline_name()
> already depends on lockless ordering mechanisms in
> dma_fence_signal_timestamp_locked(). So we're already a bit fragile
> here.
> 
>>
>> So my take would rather be that the dma_fence_is_signaled_locked()
>> variant goes away and we consistently call the ops pointers without
>> holding the dma_fence lock and the driver implementations can then
>> optionally take it if necessary.
> 
> That might work.
> 
>>
>> I think for this we would just need to replace most calls to
>> dma_fence_is_signaled_locked() with dma_fence_test_signaled().
> 
> That would not fix the cleanup race in Nouveau.
> 
> I do get the idealistic idea of fence->signaled really just
> representing whether the hardware is done, without any further
> guarantees, but having this fast-path lockless magic in functions
> checking the signaled state is really asking for trouble.
> 
> So it would seem that both dma_fence_is_signaled() and
> dma_fence_test_signaled_flag() need to be properly synchronized.
> 
> 
> P.
> 
>>
>> In the long term that would also allow cleaning up the container
>> handling and simplifying the DRM scheduler a bit.
>>
>> Regards,
>> Christian.


