Return-Path: <linux-media+bounces-55069-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDAXC3Xdr2kzdAIAu9opvQ
	(envelope-from <linux-media+bounces-55069-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:59:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1C9247C70
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79018301BCFB
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6733E43C063;
	Tue, 10 Mar 2026 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Qm/52LTK"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6170843C041
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132912; cv=fail; b=MmJ9v/UhOkxnSDT10vqloepVdD78SOODga4X3UU6ikmajG0eH2yodtJ7XL3NqAMe+YwVYtaWzkYh+az4Qwn4KnBPuCpDubIc0GuHOXqZmY30xQkgZ9PNMtRmFOfKWm7wjJ8SwwGjwhr/yTmC56WnBF0ovhw7bfodVCzr3ZLE7sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132912; c=relaxed/simple;
	bh=eMVMDCfh0Mk/MtiBEnBaqerSWy/jBFJg93TZGScwsTw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aTZmLqta3b3KYCYnaQRIB/E4j0od7tQASOBL7RG89egqn5EA2x2SnvP4M0/DO66g90d1FSjN9+FPZKLjxazKgM78qXSMGICaRaeXncjh2gxMZhBEFz8leHcfOuiJc66c0eu1nR6TNLRfXaczKPapUOH2Iv8zLHDYa4gBKknPVR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Qm/52LTK; arc=fail smtp.client-ip=52.101.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9OSUSZ/1VGQjaPq/vYTGGItteBGeP8I26CI1ldrU/2axqxIALGkXHoQzs3GWfzFZ54L56KSNz5wwaVgkrXQ93HdEYUjS0imihOmdqbrH+LtA5stxOBBtFdqZDLK0OgTNfhKOybR+sqU9z4GCAT7MDjPeaoSyqRqutXPURW7+fiPYcgEQncP2eDe5Hp79iyQpLd7ucKJWWQFG43Ja21J+UlooMTZ+KuEN5FgpHScOgf+G3bMKqZ/dXXTGW2qZM9v1quuJBzMQlyApJsoh+ODjKyaZCNhqa2GLksI5wnKBgTnYLbhavEdMPy1wiZAsGBny8B5g9Wa9FZ3ShdolcWRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQXSEzS2OHfooCaM/61uv9i0wEBu1Le8KE7FbDZfaQ8=;
 b=dynCzBJUM/SO58MjeQgKW/ADeXOKjCs/7tFgMDHf7gG/Og5tOTSbfS3y0uSa3C49WHvjr8oeqxLQQfH1sHqG04cMmddcVRMFCFpbEZs4rhvB3UXHZt+FkBVzBAtYVfd+iuI0v1CZaOq0MrhcfqiWrzDGB7oGt3RJ82xMXPFgpOYfFFjoBU6CfcKTvNqny7L0nkAFSVdHLkdPt4ZyLgBPqyGoyH0uX57KOeyH/WCz/STLsQslFdPXXiOhNSR07BYVTy0PDGFZg6MVIF3bZtysCA5+iJMY5+mBJsKBgnRCwut2m45AZ7fzsFte55n7jf0vc97bX0f274PXu6Mig7xvdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQXSEzS2OHfooCaM/61uv9i0wEBu1Le8KE7FbDZfaQ8=;
 b=Qm/52LTKGByIBFdEjA/BO4BKlrRkJRTAVc2/7nZJTNyLn578H3cVx38KBcDwjlsZXs70EKrH5oW6SPli3oWwMNLf/OHZUu/OKSUH03mjberm0n+5Mqd0T5Ttz3udbZgYUzf4nmnoIp2rtnwDpyyecFk5XrTw9J71iTpkJ0W1IJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Tue, 10 Mar
 2026 08:55:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 08:55:07 +0000
Message-ID: <c9271f37-e66e-45f6-8c81-1c9686ff53d4@amd.com>
Date: Tue, 10 Mar 2026 09:55:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Clear CMA highages using helper
To: Linus Walleij <linusw@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20260310-cma-heap-clear-pages-v2-0-ecbbed3d7e6d@kernel.org>
 <20260310-cma-heap-clear-pages-v2-2-ecbbed3d7e6d@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260310-cma-heap-clear-pages-v2-2-ecbbed3d7e6d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0417.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1b99f7-85c0-4db2-afbf-08de7e82ba89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	3jGayQTpW7I/LiU+g0Uxr4JDed+OD0SSX7RnL1lUd9CdhEMcBXZ03B1n0vngUD0ltOgr4HPEi/4vs8WmxsLv7HKsU3Hg1kMIQUnMY0UnuMDgdIiqBbIAYu6RkQ/J69/Ch2gbyjfH3k6bJO/Hiiga981lGJdR5uNE1ze/36mIQ2qcMrUed90KpIhzFQHfkqNcsjN6ruA1qEk5dVCsl2swLiqDyN4c4cg/1CCu94/SRDj3CMvazcdACyY0yMxguzIDfD3s+dP9Pv+dhFQqr4L+PoV/afAYDnNxpTsGmOjTUmQsxGPMcwsU+hiev6kFpc1AHSKVayMnAAZic60RtIuP+6R3xMk02Kq5cMxYJ7dpIpYVI1Pxqma0jlhbscuoRmBut8cdKecAUcq7K31+TOABRosJys0LSDJIsOeDrOvEoHm9y/qyGq8WBvCnlZocrZtR/sVJE2/gsSJXfU9NSIENuTIrHFRnscMIsO/RWOCCDCQH9G2XYpZ3phZmRywpIenKzXXhXdMWGKmKIOUJAGLqCCjJg5xCeRR0ITn28qPA7NcOkMRPoUSs/ayO0mXum+TZ+x11kwZU4p/Xc4sk657b1PnHo7qAb/Grc1aOIvDiZtcRj6cg31VfR9xkeWXMMtwj3/L3boQpRFQ59TODcZG/5PyKGiyL8rMuUT3Gs+heLxCFwjV5/iKdQ5aG8a4Ov2E0lkU/DTJ+1FrGBaJLmTyzkyExSML5Z48b46L0RSqSbIc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2pyWU0ybzFOL2gzZVV5SksrOUo3TTFteHF0R1ZvTEcxY2kxNEJBUG9sb1lN?=
 =?utf-8?B?WDgrMjZhV01pWEZFS3BYTS9DT1RUbGFJekdvMGFFTXIvSHkzalNBcmdNTUhL?=
 =?utf-8?B?THh5SDIvSkhGTUV6VlVjSHI3YjVQSDF3YUkydW9SQXVlZGhlclVNc2NtcC9u?=
 =?utf-8?B?MHZVT1FXSmFDQ3dNcHRmM1JOU2RlMWc2OGNIWFpDTGFZcGYrd3c3eEVEUGFW?=
 =?utf-8?B?M2NSTm1UdWVUK1MrbjlIa3hWMDJQZlR5UHI3VmlRQmdRT1l2azBoNGhsNk1l?=
 =?utf-8?B?aENmMWsvTnJ3QVpqZ2JCT2VhcFcxdUVhVnpITTNGTDZNbE9sVjBsc3BpeVZQ?=
 =?utf-8?B?L1VBbEg4bnUxM2hXY05ZOWM4RmErSm1EVXludDgrU2xuaEVnUSs5SXNUTnpR?=
 =?utf-8?B?dnFVMVlXVjhaZlR4dGNuVUFqeDlGN3FmWGpDaFcvQVJQeEM2S0dmMml6Z0Fi?=
 =?utf-8?B?NWttOTZ2MkpIbGxTWGNZeGI5QWxKN0tqdGg0NHJseXM2cWRFZnNxcno3RUQr?=
 =?utf-8?B?SXBMeE5QcFRzOElRNG52QUgwYTBOdEJqSFpQcHpzMVRJWTdXMzMvSGxackFa?=
 =?utf-8?B?eHladnRIUnYxMjdFUWhOQWRsSjlMZmRnR21idkNOT2c1QnlMMXI5Q0VTTXA5?=
 =?utf-8?B?WXUyL2FSa0RzaDYxZ012NkIvSEJOTDF4bVhmQ3IrYjRHYUpLcVRzcGVRTE0r?=
 =?utf-8?B?a1M1cFd5ZHJuNXAyY05qUktocll4VXNQTko5K2xHYUJvMmo0amZ3c242a0Ux?=
 =?utf-8?B?RGsrUGYrT0Z1bWkvRWlQWktVNnJGK1hIY1h0UGtBNTlRZTFxdmlzYXVqUllu?=
 =?utf-8?B?MlB0RE1VSE1NTnRRb0EvYkg2WUV2aC8wMnBYc29NUzlsNHIxdy9xemo4bTBZ?=
 =?utf-8?B?MmI1RXUxaUsxS0hkbkM3SUlWNTVHdlRvS3ZmYldrRE5BRWw1d2dnWENhRlBu?=
 =?utf-8?B?ZVo3MWw4YnZ1YlFKeTRMaStYTTJVdnBlU20wRjJNd013Ylg4MjlBVFpzQ2VV?=
 =?utf-8?B?OGpMZXNoZXZPenhLQnhReU9McmhSK2dreHpEOTJFQTR1ckZTdk1GQ0svblZK?=
 =?utf-8?B?dFpQeEFZUTZHSjR5SzAzaVRIR2oxa1FybmJlVjhENU5qSzdlaHllQUJPSVZ1?=
 =?utf-8?B?SWM4VHhKR01iYnFsS1VXY0RZdzg2SVlSTTF5TnZXd25abmdmbit2ZEFzd3ls?=
 =?utf-8?B?eHJFZEZsSjJRMGdhZ0QwLzl0aWhvRVVkdWI2THI4MnpFTXJzS1BadERSYnJE?=
 =?utf-8?B?NUl5ZzhrNFk2MHZBb2R1YksxM2FETXlmb2tUS05YRFlXTGZTSm5sL0VSTWI1?=
 =?utf-8?B?b0pPTFJBMXBFazRkUUVwRUdtRm5ZbFpCb1pRVVFWTyttNFhibjlUUWNETEJI?=
 =?utf-8?B?aE5Sc0l5SFJmUnJzQ1QxN1hkS1FNc2hqTmZtb0hFdUMreVJxSnhCL0Rsb0sz?=
 =?utf-8?B?Zk5iQTd1emwvYW8zNXhpQVRvTE9iSkR4ZG9rbXBhdjc2dk5KNm8reldRWmRp?=
 =?utf-8?B?cWNqdExjWXkzS292czdxSllBYjlUMTV5bnpGMWNMTitnbnRETWh1bTJhTnZ2?=
 =?utf-8?B?YXhBekVITmFydkdhbS93eVFqU2s1dUxtZ3FIQ2JoSWxVWTMxNzZHL001b040?=
 =?utf-8?B?OGJBQXRFUDBTM1pLZU1mZnpaeWx4bXZHeU96Sy9SSUk1bjZTcVJncWF2bkxU?=
 =?utf-8?B?TlBYYTJmZUEzOVZCb0NGTnVHcmpueTZQa3NnWm8wWGxqWmh0TFdLZU4xR2Mv?=
 =?utf-8?B?Q25GMWhiYncxbWVTL0JFd3Nlak5uQnVzencvY0ppVEJYZXlvQ3FaTGlwSTFk?=
 =?utf-8?B?QmpUdTlNTFRON1pUSWRtVnRuMzRKUGliKytpNzd1amYrdHR2MlNqNktJWUgx?=
 =?utf-8?B?TWZDSXJmeHROSnN1bTFwd1d2NXhGYkE3LzZweEk3ZEx5RUxqMlgzdjl1SmZo?=
 =?utf-8?B?bnNiVlpEU213bWlFVFRDekhZK3dVajRGSXQyUVo4MWI1a0poQWJybnIxR09z?=
 =?utf-8?B?bUIxcDROMXNPTmxSa09jaGp2OXh5bHhjNnVnVWM4eVN5K0p2a1NJMS9qV2JY?=
 =?utf-8?B?OFI4aUowaTFJV2ZlclRabkkyK3hLdnBNRURIdWJaNlNuOFZtMmFyWEgxNW5k?=
 =?utf-8?B?aVRoSWhrd3FibzROUnVqcEl2ZDFOc3JvR1gwNThONEI2VGM0TDkyNS90TXFO?=
 =?utf-8?B?c3BwT2JaTWdWT3k3L2NZcHBWU29sZyttMnZydnJoVHZUTmZRWXlYYnRVYThB?=
 =?utf-8?B?RHQ5a0dTc2VsRGFrUzBXdVhtOHJkSUppY0RkTGtqeEFZS1k5cjhlUzhMTlF5?=
 =?utf-8?Q?OMc7LSJuUIUlzWiVHs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1b99f7-85c0-4db2-afbf-08de7e82ba89
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:55:07.7524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3+CvbxtrCDEsVCH0o3hpbgDSF+UnlsWJ0VDHlLRQN010qPbw/8NqUtrW5i96C6b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561
X-Rspamd-Queue-Id: 5C1C9247C70
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55069-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/10/26 09:53, Linus Walleij wrote:
> Currently the CMA allocator clears highmem pages using
> kmap()->clear_page()->kunmap(), but there is a helper
> static inline in <linux/highmem.h> that does the same for
> us so use clear_highpage() instead of open coding this.
> 
> Suggested-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Ah yes, somebody pointed that out to me before but I never found time to write a patch to clean it up.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/heaps/cma_heap.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index f0bacf25ed9d..92865786cfc9 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -329,10 +329,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
>                 struct page *page = cma_pages;
> 
>                 while (nr_clear_pages > 0) {
> -                       void *vaddr = kmap_local_page(page);
> -
> -                       clear_page(vaddr);
> -                       kunmap_local(vaddr);
> +                       clear_highpage(page);
>                         /*
>                          * Avoid wasting time zeroing memory if the process
>                          * has been killed by SIGKILL.
> 
> --
> 2.53.0
> 


