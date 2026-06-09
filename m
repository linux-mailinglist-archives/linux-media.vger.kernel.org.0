Return-Path: <linux-media+bounces-64271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t2vvBVvPJ2qk2gIAu9opvQ
	(envelope-from <linux-media+bounces-64271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 10:31:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C69065DCD9
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 10:31:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=SVKqI8l1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64271-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64271-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 394D6307B0B0
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 08:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9DE3ED3CE;
	Tue,  9 Jun 2026 08:17:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012068.outbound.protection.outlook.com [40.107.209.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3243E9C31;
	Tue,  9 Jun 2026 08:17:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993039; cv=fail; b=caqx1yNE+Q+1W10ksy8pS9O76QuXH6+GnoI2Zs98KQya6jYMwnXs/BPFYU1msWjwxP9u7hTT7l0q2QfjId5Ggp3t9ygCyJgX6ug48QCbZwoEzI83wzPTtmMjptqn9lId8Geqo/rjgacVXFZb70B3B/Qg/VNLRIYM9ls9WN2/tvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993039; c=relaxed/simple;
	bh=BUxoOzZ4s7C1ncM7c1zpvBaNPFDZm//JAJ9cv47+EHU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=URxIOuzrp8dKzYCxiKm93aKxKaTGgSeT6n0g6reX2JS+han5rE8WTfKw6/AUokUPGNlHuOQvi9d4xcDRYziumaidu6P4MbExy2JO4gkDkBfKCNPFzffrveZxh7c5ZRke73dR6Lc7jA9nX5VsABEdwwST1xfhC9SPa3zkTFYGmsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SVKqI8l1; arc=fail smtp.client-ip=40.107.209.68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMFfdfHals+cEoo3F4r4IS9MVStKhgkGRUPidKPGacKxsc/m4HwgzF8zeIOwwLkBshubXfxlx/3s+yMb9+XhAzEEtkmHyZQ2BmkHZFHNrGsFj13qpLdTsHTmcCYGcPfgXi9FVgkHmZJ8aoh1sk1euktn2JcNI5v4W3mMbByDQzB7TJdTLgnu2S9qqO8pAHZB8F76y9KdhO74y2F7l6IEQ6TrvSCSIH9l53W2NQOYblBwvkZW7w0KTaxizT7qh+50es3I8Eq8ZyB2BCySkqxBUHLbud3g/+Q8go/Lbu5gK8oVUGZWXRwDpK5I7+OHowVKyaSCdw7mIxPFxDxe0v4teQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIVDhR3mg/pteXWqiyzUk5lDpwf2+uC4CJrMKNDLULI=;
 b=NlOQ8cG/FCOUdEj50/sshWd9eFqJTcKcvYTOz0kGmBZviLQH4sr24Dp6h9pd8vOhMggF1ZB/lm4Ed8IONY10HC9w8zhNJ8CCw+KPKgsGfdsPLqIVhl/BCY6JrZcw7T9VkrmNlpHxpGGI1WD7qnPz9uK+sVAauNv43g1aGR3mod8WQk0Ye/cLqJupqhk2HXIoq4AkSfUr6CAi8p9JETNkzm4RF18dwIWwEtsM6HHIc3/U8oGv2REn7slMlzJgHRDXNUGOrCB0NnYfupRI9JlzCZ4/lzrI9Q1ehWQl7e7wktBCRgg5uDwshhs39zq7v2g5/nLBTqe8gJKASV2vAXo0fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIVDhR3mg/pteXWqiyzUk5lDpwf2+uC4CJrMKNDLULI=;
 b=SVKqI8l1T7h/QjTsE27bkMFTFTZ/qCLkKEZEGJkL2JkXjPlR8/aoFCaq7LYHKD8Nyh283VRpOZ72PvpkiZrtRKrn7mYUTdpYho9OLvH1v8lsBlvzlhsKRDgB/3e3SbU/47k1lpo6TW2rIVvB9GDMV/jy345Muk6CntUcXpdFbNI=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8915.namprd12.prod.outlook.com (2603:10b6:303:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 08:17:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 08:17:13 +0000
Message-ID: <db43fb09-5aaa-417a-962b-dfb4bfd548ed@amd.com>
Date: Tue, 9 Jun 2026 10:17:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
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
 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
 <DJ3WX3B6MYBN.2L8NIJ1ELIYJ8@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DJ3WX3B6MYBN.2L8NIJ1ELIYJ8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: 16bdf3b4-2c5e-4bcf-7dea-08dec5ff829b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	E58eVtGn5bvsuhWpYI5jhk146jYlSGAGgxzNTrrZAKCDt6mS6fmiGOkzIfRYt28mwXur2lvWcI4LxD3JIWb4eCTQDuUe9OuCc9NAE0dgEIvDAYubDPpHh3WACbxiQu6LR+0eP8tqvcks5D+ZXVAtDJfNPzMd69w/H8PGmXTUA5DTH8E0sQ2gbyuQfy1BaGnCRNS2ljdhImISBECiuawIdpbVssflDKtVW/wNHMyD2W7kqx8wEyVaZQRfwdOKYMXIL2Al9Qc/aKvyy5vRdhC3+cRiSi6hjdWvsN+mftYbjmIxobrmXomBqNZkJIDef8VvEDohUUCQTpfJ44bvPSV3/nd8LVNZoBkCzzDVoOifd5CaXgHCIi8jajiZSG5lCCBZhVd0kcHeHaB2o/q1zQ1jMrRntsqIhunVAwbF3uHhqUJ1OeN9X+uOwzbqzPhG7qQkC0ezVIFF7c8sAtDR2mmY5rJTy0Dntney2+a7joqSl5s7HdJSJV4MqotqcS5enRjEURSsW8nq8NnN8sEoVh1QwJjz94jWmK7YIhHUg6zGsMESCk5gSRfzb4O+EsIQgwp2ZxPgiew/+Sqj8YIxVhJOZrsNyqY6qhsIxZpHW3lTPK4/tno1bFpiC7HClSJIA1m0IYJ+vwBKXRrAi/QdGLgeeXnRCZazm5gH4uINyqaWfnlaboAogfr5ScKqXxo3/OJb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NktTaFQ2ZUN1NTNyZGUzK1RDM0c0SVNiQU8yNVlINERxZnNqbEhvTFQvcU5X?=
 =?utf-8?B?M2N5MHZ0a1d3dnh1ZjY0RXM1RDZtZEVnT1BldHVXOFp1anJIMnlqUVhPUW4x?=
 =?utf-8?B?OW1mc1gzZnpsNmF0c0pyRkkxUXZxcFFpc3JEWWxYZEZZRk05SGhVbUY2TldX?=
 =?utf-8?B?bGJoTzFiQVZKN3kxZStIaTl5TnlUYkM5Zk1pb2VINVl6OWh4Nk96V2tPeGln?=
 =?utf-8?B?VEZuWEhySDBOQktpaUdubUxQSHdmM0RlalR3eFFOVUdFeURxUWp2ZURhL25i?=
 =?utf-8?B?UVMvZG4rMjBtNk9rTFQ5ckhJcE8zV1BYSzRjTFJvQ3A2d29mc1YweDhWNnJr?=
 =?utf-8?B?UDhJZXltcHRMQTU2cXVDRHFHSGhBZ2NGR2EyejNoT1Ntd2dEenIvU1J4bEJR?=
 =?utf-8?B?MmxUK1kzU093Vmt2NEpOVzRWaDF2YVVrUmNkUG1tdE51dmNBaldqOUJ1Qlc0?=
 =?utf-8?B?VVhBVnd3OS9DY2hXY0pKRW1mUHB3S3pHVFZ0NmNYNmNkM1BTQlVXRSs2MytW?=
 =?utf-8?B?Qnp6SWNHNDlUSHIzSzQyYzU5TFVPN2w3T3ZuNVpDTU1ySTNBVEdIUjdiZjBC?=
 =?utf-8?B?aUxneGYyTXBRWEpLaVYwdmNFV2xSNHd6aDNZSzVscVNoRlk0V015bnU0MVVw?=
 =?utf-8?B?WlNIOTFRMWdiTkt3L2ZaZUllU3R3NGxia1Nxb1FRa1JqK2szTXdZbnIyYjVx?=
 =?utf-8?B?MHpPcHJpb3NaSExET01MMEpUakJ0QVgrVzZNZnZTdmtTLzZLOHdqZW1ZRUpt?=
 =?utf-8?B?YTc5U0lOWE0zeVlBVHdJN0dNU0xOQ0ZTMnhrcFVFcEpVa0RrbjlVcHlkQUdp?=
 =?utf-8?B?ODc0TmlHWkF4a0xNNVNJSUZRajlNQkZSZVkvWVJwdmZhSy9ENWRMR0ZvN3A4?=
 =?utf-8?B?SU9FTFFiSlY3Q21jYVM3bVF2c1NHN2pOOWt3T21qeVZXcmZiSmdMcTJyZWhZ?=
 =?utf-8?B?SHBXM25nekdHSUszdU1jT293VndzbzBRVUdyTGdhSVdKa0g2emZVVGliYUMw?=
 =?utf-8?B?cmRVcHJCVEdzSVRwYVVha21qc2FKdVdpTXBlcHQyUGo3YjZrUWNINUU5eUE2?=
 =?utf-8?B?ZEl6MFNEQml0blpkWWxHZW8rN0UwWXN0MTM3dkJzU1Nid1NMNFROcGx0bzFO?=
 =?utf-8?B?aTdubDM4QWpYRCtUTzBrSUx5UWJRaWVRalp5KzVZZDNmZ01aT0dLVVhVSmJH?=
 =?utf-8?B?NE5TWFNXK0hZSlBtTVExc1FjS2FqeDlDUnlBODRDWENOQlhBSkl0aTZMa3pl?=
 =?utf-8?B?VmMvWGFIUVJCM2FDakF2NGRJNmN2MVlzakZoQS81VUowNmxka21NZmorMXpS?=
 =?utf-8?B?ZWlOM1dPY2lKMkpEWDVLTlVnRVNDZG41M25tZjBrdWRhZ05Sek1zbDlGb0hy?=
 =?utf-8?B?K083bE8wNUs5Z1JkejFka3BqY0MxZkVFTGhWNTlyaHFzbmVjNVR6eFpkeFVl?=
 =?utf-8?B?RFBxcjQ4VUdNaWU5RHJRZ2hJamRiSVVaSXhmZ1ByZWFZdFNNVjhUQ2ZmRG5r?=
 =?utf-8?B?bDZ6Yk16MThuQ1NJNjhPdlRKd25ib1d0Q09nR0g4aktZSllocDRSUlcycWI3?=
 =?utf-8?B?aFM4TUpiRDV4VVN0Mm1HVHgyV1ZDTGR6alVpNVRzNGkxenVHZDlBeVZRTHdQ?=
 =?utf-8?B?TkpFY3MvTjZ0NFAyNU1HYytRcTF2M0pvNHVGUktTL3hGYTJvdWFRRS9JZG9M?=
 =?utf-8?B?SGp5Y2l6a2M4akdPTXFxdzZoRzB3MzdjTGRSb0dQUkZLdjdueHM0WkF0VjlB?=
 =?utf-8?B?MmQ1M00yR08yTHhaY1MveVVYUGUxdHNkZjAvd0xmYUdhaHFJN2Jjb2RLOWJl?=
 =?utf-8?B?RVUxUzRnVVFmUWtGdjhVT3JZWStUSjFlQXMwT3F6UzNsRmxnY25FV2g0Vk9L?=
 =?utf-8?B?L3VRaW5SVktLUjNPT3ppSjI5am5Sa3lMNDRLMTFKWlVkcU42RUhBWDZiL0FE?=
 =?utf-8?B?eVpUR1J4amRCbTVZM0tpL0pHM3VUK0pZVmVoWlloa0VkeDB5ZHdodHJ6RnlT?=
 =?utf-8?B?bi9xRG9BZ2U4ZFltWWwxSWZXZ0l2anNEK3h5c01xbFR5ZVoySlFCWWpYY2Fn?=
 =?utf-8?B?N2h3SzJaYjIyYjlCUXIrVlpwTzNIUEpxL3hKZGowTFNtR0QxMisrL3NKd05w?=
 =?utf-8?B?am9US3hWSjd5dFlzam1zamhPUjFVZnE2RTFPSHdpL3FZekp4UGxQcFhuOXdv?=
 =?utf-8?B?SWxiRGhYTVZVdnI2M2FVWG5FazFLVUh4MXJPeU1VS3BPSXB2aE40T0FnOFpH?=
 =?utf-8?B?SldiWk1Hb210K0kwNEZyS0F4b2psNm82V28rcGRTNk9LS1R3OVl5L2ZkL3lI?=
 =?utf-8?Q?LhjXK0ikbPJ0rkBBwA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bdf3b4-2c5e-4bcf-7dea-08dec5ff829b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:17:13.2987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rV4PhYhSBGoQe9whT4645Vzyx2oC/rmbPpuwljCT8hAf27uoijlrBwTKMkJM56sJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8915
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64271-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C69065DCD9

On 6/8/26 21:25, Danilo Krummrich wrote:
> On Mon Jun 8, 2026 at 8:47 PM CEST, Christian König wrote:
>> On 6/8/26 20:39, Danilo Krummrich wrote:
>>> On Mon Jun 8, 2026 at 8:32 PM CEST, Christian König wrote:
>>>> On 6/8/26 19:59, Danilo Krummrich wrote:
>>>>> On Mon Jun 8, 2026 at 7:34 PM CEST, Christian König wrote:
>>>>>> That's why we need the RCU grace period to make sure that nobody is
>>>>>> referencing the driver stuff any more.
>>>>>
>>>>> Right, and that's what Philipp tries to address, the requirement to wait for an
>>>>> RCU grace period is perfectly fine if it is only about freeing memory, but it
>>>>> can become painful if the fence private data contains data also needs to be
>>>>> destructed in some way.
>>>>
>>>> Yeah that makes sense.
>>>>
>>>>> IOW, if a driver signals a fence, it is lifecycle-wise reasonable to destruct
>>>>> the private data that is no longer needed (remaining users only deal with struct
>>>>> dma_fence) and having to wait for a full grace period adds sublety and
>>>>> complication that can be avoided with the proposed approach.
>>>>
>>>> Yeah, I've run into that when I tried to make the amdgpu fences independent as well.
>>>>> That said, I'd like to ask the opposite question: What are the concerns with the
>>>>> proposed approach over (pure) RCU?
>>>>
>>>> Well a) locking inversions and b) performance.
>>>>
>>>> For example the reason why we have the dma_fence_is_signaled() and
>>>> dma_fence_is_signaled_locked() variants is because there is a measurable
>>>> difference in some specific use cases for not grabbing the locks.
>>>
>>> I checked for this as well, but couldn't find a case where
>>> dma_fence_is_signaled() is used in a way where it would be performance critical
>>> to avoid the lock in any way.
>>>
>>> Note that the lock is only bypassed when the fence is signaled already (this
>>> would be preserved) and if signaled() returns false, i.e. dma_fence_signal()
>>> will take the lock anyways.
>>>
>>>> I personally find those micro-optimizations rather questionable, but the
>>>> community agreement is that we should have them.
>>>
>>> I agree, it is rather questionable. So, I wouldn't make this the deciding factor
>>> unless someone can present a valid case where it actually matters.
>>>
>>>> So my take would rather be that the dma_fence_is_signaled_locked() variant
>>>> goes away and we consistently call the ops pointers without holding the
>>>> dma_fence lock and the driver implementations can then optionally take it if
>>>> necessary.
>>>
>>> How did you get to this conclusion considering that you run into what I
>>> mentioned above as well and the fact that we seem to agree that the performance
>>> concern is rather questionable?
>>
>> Quite simple, it's the cleaner approach.
> 
> I would maybe agree iff the RCU read side critical section wouldn't be needed
> and we wouldn't need to deal with the consequences of having to defer
> everything.
> 
> And so far it seems to me that there isn't really any other reason that the
> performance concern we both don't buy into.
> 
>> Calling callbacks with locks held is rather questionable even putting the
>> performance issue aside.
> 
> In general, I don't think that more flexibility for drivers is automatically
> always superior.
> 
> Also, before we keep calling it a performance issue, I'd really love to know
> where dma_fence_is_signaled() is called in a case where it returns false and the
> spinlock causes such an overhead that it actually matters.
> 
> (As mentioned above, none of the cases where it returns true would change.)
> 
>> In detail calling the callbacks without holding locks allows all
>> implementations who need it to explicitly take locks in the order they want.
> 
> I don't think this is true in this case.
> 
>   1) The existence of dma_fence_is_signaled_locked() already mandates that all
>      such callbacks must work properly if called with the fence lock held.

For the deadline callback it is mandatory to *not* hold the lock.

The signaled callback can be called with and without holding the lock.

The enable_signaled callback is always called while holding the lock.

> 
>   2) The RCU read side critical section already mandates that driver must not
>      sleep within the callback.
> 
>> If you call it with the lock held you enforce the fence lock the be the
>> outermost lock.
> 
> That's practically already the case, due to dma_fence_is_signaled_locked().

Yeah, but we can fix this and the enable signaling callback.

But the other way around isn't easily possible as far as I can see.

Regards,
Christian.



