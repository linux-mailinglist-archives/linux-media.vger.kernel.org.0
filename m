Return-Path: <linux-media+bounces-64221-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nbbBIdf2JmqJowIAu9opvQ
	(envelope-from <linux-media+bounces-64221-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:07:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F09659125
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:07:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=qjDt5cvw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64221-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64221-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 679813633EAD
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F0833A71B;
	Mon,  8 Jun 2026 15:35:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011002.outbound.protection.outlook.com [40.107.208.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482B0246781;
	Mon,  8 Jun 2026 15:35:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932944; cv=fail; b=YKnAQxEjf2cfLb4Jh8XOGruqttjouONJUB5yJeWdooee74MsQtDw9BMxLFBeaRUX5T3YOa0y1oH7D8ekJnEzxtBMTM7BW5fDuNy7+7QoZpbPyTAZNyFtw8db6O//aj+uRguoU5XBik7AmIV3PSFyIpBJR0mV9m2nZdiknJaegLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932944; c=relaxed/simple;
	bh=SHcJTGDMaV9JpvKD096J/+EHfB556Ke9mcyUGNMw+Nc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rV7PaBUOw1nek2AeAvks6EGHWRJKYJpNaaqUHrqU1Du3+NV+IDMRzPJjaaRxWNPKEfBEfCSebB5TA0GEUpIAPLQGDS0p2bQLCEVX6ouwPLlKE0oWtOdnIdpSQqzJyVebifLDTONGD1dCtW5u1btUd6pBaZSCaEgfXKuyuWEZRqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qjDt5cvw; arc=fail smtp.client-ip=40.107.208.2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8oBBPfQXUiXSdL3TbeGoq9+S60vtfWh2+Sv241kEOaJ9xPgaA56srbuhy4COudHw1k1QS45MSRfQrCvQBgkOB0KfRqoIfN6XRy3c/wQPRjItm5FJHHHeqS9S7wMVmVbcVBVpzQMfQHKAGSpdaJK0E5opswY36L+ghGdOjWYE1e4abQsIdEupLqF8Bw4LcvdMfDWLjmj9GEhEgQpG22yN4nm3lQdur1PMQfU1lsLXPCugC8RR38ss0vca7ROYhEIBDtBRKQH8Blz/vZe1C3nnfbZ5j4okyAHpKhRufdnmsGIWYgSvsZcsrH1y3z9//9eJkCExxME+fH3k19uKqSX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBUCctYndhRuvyjUAinqQkaumMxZFqHLSUfsJlWCFpk=;
 b=PXrYd0XGcCqLdO1ViTfLMMGXiWS8kqcDj/rkfEURw5cqE6Y62x+Kl3GwyQokXESwTqE4s/JitIhdFl/0aE42bzueJNjbS6ekEk5DN2XO1zwzNHfai9f29VMcPt1vFvqhiVPRyFnl+vmsGOA7rOzwK8hn4R+7G4ixGHkng0lQMyL62JwfS9W24lKU4+hFAVCnwoa6V5QKdmJjMKZUkwb7aR/BDy3YspFwIjm5oPgd8GOejkY0UphpoFrVTloY17ik+943hZr5nmAvmsSgJZSs8V0DY6MZkzOLVpOI7I0sh+r94sse3Pr02/prdkwiC6rUqUzf9gGyBq1NrQirlrYwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBUCctYndhRuvyjUAinqQkaumMxZFqHLSUfsJlWCFpk=;
 b=qjDt5cvwvhI2l11b2H3Mj6YXW215cyUIvg5Vizb4RgQmNwUHmUEs025GXX+Op5bQh+CZXj1XM+ENbCe3nTUd51JkSvX4RU5hdkyQYrza0qg0VdsaZ0R6+Y4cHhdjHruDMjGEFNR2QC/FnCYgP1CG8x14UYVr5wL3dYQfHKa/KsU=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 15:35:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Mon, 8 Jun 2026
 15:35:39 +0000
Message-ID: <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
Date: Mon, 8 Jun 2026 17:35:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>,
 Gary Guo <gary@garyguo.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
References: <20260608142436.265820-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260608142436.265820-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0304.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd74048-8df2-4240-ab5f-08dec57397cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8ls6I280znmBdssR1zLqMhm+cRpAjQ2SSysYW/4KkUi/ypi/mjtShcx8vSOTCy4YniBaBdP/wv3qYOrWk7yHl05HgrlVKZg4Tz9jqcDVbgXzAeMknGH8NyD88EFuLLQV03uk1UjOe+ZQC8mOHuUwhNuMof/z97zLYYU/SFiRhtZedMu7ZOXuxUu6nuwm+qAPuwYrM0ZW1Q/5s30blWdHwNK/51Vg13+5tqlVs4cojFnqmkrbHLDX+watFBi7afxC0xOjdoXl1xXLZqcW8H+QOaXCJiyLTx5Pzil+mgNqToy2ROhntmzhRuqx6m5hs1k9WveCc1ss8EPFkW8ZLpngsrc58mUkA6et6Wcbcafh+Zk1LkW3CAlGtWa4lzAwetH2YISALTs+/jHlJ1L0FlpDfoHnC5Ila+tx2uE3H2ru+FkeXSoIC0BBCMLyH9TTtB4uPuUBr3oynjcPUzoWaouwgD+00+n5jOyq5r8xm+9gRRS1qVSPr71AjfmcRJM7j4I9AzjB+RpMEsh5wr2zXuyevablt3hkLoTd8UUTxYg74P6MUDa3v4bvDVFnq5oVRhLxBrTGYgrHx8afrt2CisUlH73rkeYJGiiyDsNED4gO2ZiTPe9Sb4XmJ02DCxWzaKLtJeN1oAqwYMKQwZFUG78zMLIEMout4vLzkgpnG0uaWYdi6y53hDSBhXnrzIiWLvbd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDA4MjNBZTU3Ym81L2dnbUpENng5V2FEUU9tVndodElSWVl4ajdUZGdkMFFs?=
 =?utf-8?B?U0xDRm1UOExEV2FPZlJwWHkvenRnaE5xY0NIdWZMK00vQXBvMnlTbEtZY01s?=
 =?utf-8?B?Q1p6TlUrb0ltMEZrWFhrdGk5SktFaG1hbmFabTR0cWhUajJoU0h0VlkrSGJy?=
 =?utf-8?B?RWgyVTZSRlVwRkgzL3J5UVpCRGdRMzk4SVZ6UzVrRXA2UDJobUJTa2pkVXBQ?=
 =?utf-8?B?WUR5eFAzR0JKcldLU2VLdlRzcHBsMTdTODQ3UzNRK1B0TnBpeHoySGpHWllF?=
 =?utf-8?B?OXZKRkV5WDJqZXZWcEpZY0plYVR6alVqOHN4ZkFneGNlWm43WjcwMmcxUnNP?=
 =?utf-8?B?aTFtSythbkxhTzA2YldzRzlMNjVVVXphSVRPV1hFeWhBVG0vY0NUNG1VWWUr?=
 =?utf-8?B?ZUg2RkhhMzdzazY5UTk5T0ZFQ1Vjcm0wMmZRRVNsdk9QbWdMY0NoZlRWQzBZ?=
 =?utf-8?B?bk9qWlFncE9rVzJiTkFvRUVJZlV4dFg4bGJuZlRTQktPZ0piaHpvSlRtbWI4?=
 =?utf-8?B?UEpBVzMwT0NscHBYMXBndVMvYzlEc0pBSjhsQVVqMFBZM3N2ejNoUjRiL0ZV?=
 =?utf-8?B?bnZlb0IzOFBqR3J6TnBTbEpOc1B0M1JHSHl0N3RBNG56Y0RnT2dEYXl1bmlx?=
 =?utf-8?B?dWhCSjdnNlJIRnBzZGozZGhmRDM2N0hkbytjcTBMUDRtNno1bXRLNkdRYnVQ?=
 =?utf-8?B?WG1vTE1mK2h1Yk9aZ2huQ3ZFUi9PVHdiQVEvcit3THE1bzhMdHE0N0sxQ3Jj?=
 =?utf-8?B?VWdqbVprVkJ0NVFwTnB3WS9CZnJldGpIUHVzTlNZajUzU3hsL0kyclNBTW4r?=
 =?utf-8?B?MnZXTmFFTnZ1T0VGOEpON08yTXZ5UmRJcVppdG1ITVFNMEJJNzlPNkRpQ0Jp?=
 =?utf-8?B?ZzN4bmdUR09CT2U5cTErck1QaUMycDhoaUl6MzA3ODErek5PdGpZMjVJelZL?=
 =?utf-8?B?dmppN2VnWU1wSjgvYWZkbnZXUytndncvdWZuVER1RVBqY2hkeSswT0V2SElG?=
 =?utf-8?B?cS9PTGZ1Z0ZsSm5aSHdoVHVMTVREaThvVzNOVmdQNHZRVy9uWTRlSXo5UGhS?=
 =?utf-8?B?WG41TVZCM2NSRWpQWUludXZpZG55Q09BK2cyditnZ2ZLM0sxMTZ4WGVsTVJF?=
 =?utf-8?B?NnlrMTM2N1ViZ2tmTFdUaVN5NUtuU3hXNmlQUHJKV3JLQWZDYUtjWEljT2FP?=
 =?utf-8?B?SVRkNmNwaWIvbkQ1aHpPMjNkVUcrRzArQXhTVXpjcGhZWWYvR1paSzA1ZzVK?=
 =?utf-8?B?aVUrcU45R3p6WW03aHhIYlhhNlNHcU1taS9WVE1kKzY1NWExN1ErWlZ6WFIv?=
 =?utf-8?B?SllRWkQ5azA0UkIvSUNUOVpkTytQZEN5UkFCUG4vMXRMK3dwQmNtRnZZMHJE?=
 =?utf-8?B?N1lsdHZ3ak5xZnhoalBLZzVQN2FwZXBMaDlMREhUR05jRzVBb3RaQ1dMby9x?=
 =?utf-8?B?S1h1Mytta2hUQ2NiUkk5TGFkRDZlOENyTUpzL1JRRUg2QnI2b3gzR3RCaUVQ?=
 =?utf-8?B?c0FLeUtEVW90NHBwZ3NUK1JEa3JEa29SRHFsVHVNVnNtOWpKbEU1VCs0Z25V?=
 =?utf-8?B?am1paHBvRVhqQ2hpdng3YlpNWG56Qm5MRFBjVXBtVGl3ZFpaQmdOdDh6M2I3?=
 =?utf-8?B?NVk2b05yQkp2dFVrbUF0a0wxSUNGNllvcnhGaG9jaGxHNVI2NFI0b0tzR0sy?=
 =?utf-8?B?N1dJa1BtWktvVlBUSjI4em9RK2VOL2lJeTZRMU0wWU9OTzM1Q3hMNEtaY3A4?=
 =?utf-8?B?aThGbjlXeHh2d0lzR1VURVdqbzBzUGRBSVoyNDlFcXhXaWsxRzVTdE1OVW5i?=
 =?utf-8?B?QnFsRGVBNDhDRnVhN2p4eFF6M1k4TkNzQWhzdjB0R0x2WnZaSUdMVlppK0o1?=
 =?utf-8?B?Tm94SWpycEtlQy8zYkNyZW1RT1k1a1lOS0JURzNLeGJFUGhxUXFtOEhuOUps?=
 =?utf-8?B?RFUvczhmREVYOXhYdzJxZ2kyMGk4UStXUlpHR3pySlNIYmRPVVZKR21vMmho?=
 =?utf-8?B?cjBQdjkrYUJ1bndERXo1RXpKaFlhSGRCYWxmYnp4T0xqNHpXbUJ5b0k3S2x6?=
 =?utf-8?B?eUhYVHVnMTNWcjFZN2FtcGVFK0oweFZhRWN5Y1hvcFlDT0xKeEEyR0dlbDVQ?=
 =?utf-8?B?aWlOOHNmc29QRFZVMFB2eXcvaFNPUE1YQnVOMXgzRk9qTUZGZlc1anZLbnlQ?=
 =?utf-8?B?NUYxMnZ6WUN6RUtWYndyRVZvdnNhc3RRdkRwZE8wQW5oV3FQUk1GTzNSRGhP?=
 =?utf-8?B?VFMwdlR6S21pa0gvY3pJdlNLeFZRMU1aTmpnNitOSDVkK1d6KzQycUtudURG?=
 =?utf-8?Q?7bvutS7tK9LiVYUpFw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd74048-8df2-4240-ab5f-08dec57397cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 15:35:39.4812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZ/hSeImaGHChqDscCTtjPsappvZMuKwpwdAxWBUoeGM2opHaBB9qU1PmCnZCZHV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64221-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1F09659125

On 6/8/26 16:24, Philipp Stanner wrote:
> The dma_fence backend_ops can access a fence. Hereby, a driver callback
> will be running which likely will access driver specific data through
> container_of(). If now, simultaneously, a driver signals the fence and
> afterwards expects to run a driver specific destructor (using the same
> data accessed through container_of()), there can be a race.
> 
> A driver very likely trusts that once it has signaled a fence, no one
> will be accessing it anymore. Moreover, it might already want to free up
> resources, making UAF bugs possible.
> 
> The race occurs because there are only pragmatic checks for the signaled
> flag of a fence, without taking the fence lock. RCU guards exist, but
> their purpose is to guard accesses through the backend_ops callbacks
> against the driver (which implements the TEXT segment these callbacks
> live in) from unloading.
> 
> Proper synchronization can be ensured by taking the fence lock. RCU is
> still simultaneously required to guard against the unload.
> 
> Fix the races by taking the lock for all non-deprecated backend_ops
> callbacks.

That sounds like the fundamentally wrong approach to me.

The lock protects the dma_fence signaling state and *NOT* any driver state, so it should not be used to protect any driver state.

Drivers need to make sure that they protect their driver state with separate lock and don't rely on the dma_fence lock for this. This is actually the core of why we want to deprecate the shared dma_fence spinlock.

Regards,
Christian.

> 
> Conveniently, this also fixes a race where backend_ops->set_deadline()
> might try to set a deadline for an already signaled fence.
> 
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> We discovered this problem through our Rust abstractions, but it can
> also occur in C.
> 
> The by far cleanest solution seems to be to use the fence lock. This RFC
> serves to discuss whether there is anything preventing that.
> 
> (Patch so far just compile tested, to have some groundlayer for the
> rough idea, to discuss it first)
> ---
>  drivers/dma-buf/dma-fence.c | 39 ++++++++++++++++++++++++++++---------
>  include/linux/dma-fence.h   | 17 ++++++++++++----
>  2 files changed, 43 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index c7ea1e75d38a..b74f02f3cca8 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -629,7 +629,8 @@ EXPORT_SYMBOL(dma_fence_free);
>  static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>  {
>  	const struct dma_fence_ops *ops;
> -	bool was_set;
> +	bool was_set, success;
> +	unsigned long flags;
>  
>  	dma_fence_assert_held(fence);
>  
> @@ -644,7 +645,10 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>  	if (!was_set && ops && ops->enable_signaling) {
>  		trace_dma_fence_enable_signal(fence);
>  
> -		if (!ops->enable_signaling(fence)) {
> +		dma_fence_lock_irqsave(fence, flags);
> +		success = ops->enable_signaling(fence);
> +		dma_fence_unlock_irqrestore(fence, flags);
> +		if (!success) {
>  			rcu_read_unlock();
>  			dma_fence_signal_locked(fence);
>  			return false;
> @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>  void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>  {
>  	const struct dma_fence_ops *ops;
> +	unsigned long flags;
>  
>  	rcu_read_lock();
>  	ops = rcu_dereference(fence->ops);
> -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> +	if (!ops || !ops->set_deadline) {
> +		rcu_read_unlock();
> +		return;
> +	}
> +
> +	dma_fence_lock_irqsave(fence, flags);
> +	if (!dma_fence_is_signaled_locked(fence))
>  		ops->set_deadline(fence, deadline);
> +
> +	dma_fence_unlock_irqrestore(fence, flags);
>  	rcu_read_unlock();
>  }
>  EXPORT_SYMBOL(dma_fence_set_deadline);
> @@ -1166,14 +1179,18 @@ EXPORT_SYMBOL(dma_fence_init64);
>   */
>  const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>  {
> +	const char __rcu *name = "detached-driver";
>  	const struct dma_fence_ops *ops;
> +	unsigned long flags;
>  
>  	/* RCU protection is required for safe access to returned string */
>  	ops = rcu_dereference(fence->ops);
> +	dma_fence_lock_irqsave(fence, flags);
>  	if (!dma_fence_test_signaled_flag(fence))
> -		return (const char __rcu *)ops->get_driver_name(fence);
> -	else
> -		return (const char __rcu *)"detached-driver";
> +		name = ops->get_driver_name(fence);
> +	dma_fence_unlock_irqrestore(fence, flags);
> +
> +	return name;
>  }
>  EXPORT_SYMBOL(dma_fence_driver_name);
>  
> @@ -1199,13 +1216,17 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>   */
>  const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>  {
> +	const char __rcu *name = "signaled-timeline";
>  	const struct dma_fence_ops *ops;
> +	unsigned long flags;
>  
>  	/* RCU protection is required for safe access to returned string */
>  	ops = rcu_dereference(fence->ops);
> +	dma_fence_lock_irqsave(fence, flags);
>  	if (!dma_fence_test_signaled_flag(fence))
> -		return (const char __rcu *)ops->get_driver_name(fence);
> -	else
> -		return (const char __rcu *)"signaled-timeline";
> +		name = ops->get_driver_name(fence);
> +	dma_fence_unlock_irqrestore(fence, flags);
> +
> +	return name;
>  }
>  EXPORT_SYMBOL(dma_fence_timeline_name);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index b52ab692b22e..b93c3f7f69fb 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -547,20 +547,29 @@ static inline bool
>  dma_fence_is_signaled(struct dma_fence *fence)
>  {
>  	const struct dma_fence_ops *ops;
> +	unsigned long flags;
> +	bool signaled;
>  
>  	if (dma_fence_test_signaled_flag(fence))
>  		return true;
>  
>  	rcu_read_lock();
>  	ops = rcu_dereference(fence->ops);
> -	if (ops && ops->signaled && ops->signaled(fence)) {
> +	if (!ops || !ops->signaled) {
>  		rcu_read_unlock();
> -		dma_fence_signal(fence);
> -		return true;
> +		return false;
>  	}
> +
> +	dma_fence_lock_irqsave(fence, flags);
> +	signaled = ops->signaled(fence);
> +
> +	if (signaled)
> +		dma_fence_signal_locked(fence);
> +
> +	dma_fence_unlock_irqrestore(fence, flags);
>  	rcu_read_unlock();
>  
> -	return false;
> +	return signaled;
>  }
>  
>  /**


