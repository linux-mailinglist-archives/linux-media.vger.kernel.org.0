Return-Path: <linux-media+bounces-62938-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADVeHOqsF2qiNAgAu9opvQ
	(envelope-from <linux-media+bounces-62938-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 04:48:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFEA5EBF5A
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 04:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B02C314E7D3
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 02:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8686A2FFF90;
	Thu, 28 May 2026 02:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FCDU/+jR"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011068.outbound.protection.outlook.com [52.101.62.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DDE3438AF;
	Thu, 28 May 2026 02:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935969; cv=fail; b=WsEHfYn5ftX9XwcDzNqKbAXy5eLmyKYKNkKrh5QNAoiiTIx/tPDviSasiKuQ+3ExEh6iSBy2TMkiubDbHYxVnuyqRNbpTDsKGPVX/keWX2Q+vVCSP1FGTACYlNNPOahZhrPfZWDZxMrGkDlTOSii1J6ha8TdOu5RwgyUBFyzcUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935969; c=relaxed/simple;
	bh=LY0oLKQZdjGyqkxSf9QHvZlgExJx58iUvkPQ4BdP7Y4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ra8nj66yd480xvewCWMQp1SpXLeRAgBFw7qw25SZ0A096Y8BZeWRJhJ0Bwsv+Do1RRSAO071nDxzQvELMC+rX4RvzJ17dTccP339rqB0N5/nS1C29L7Rt1CbTFuvNv5ZWCfaaMt3+hrYsabM1VJLpE30jEN8IIBsYeTk4G7S4Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FCDU/+jR; arc=fail smtp.client-ip=52.101.62.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoSEkRdGKkISVOaPWpk7eWZVUJCj600zL3fpT32YgfvUQpCQMBhchzAbjvJJYzDKk60qxfm2YAbHyPmopn7tOyxuIYQUdN6skPmemf0/AFO2kk2jHojHepnRonYEgt8ZwdrCNAYUlir1ADyEyKjRzMFDhirw5ymxtsm9PTNLfdH6cNJpodl1Xhacy1D0cC4bQu0itwnxW89siXtOPbO+1d9qS+KDJmkqgIdgUGdXdokwJ2S0m4tXv3V7iPwdJ84tHrH360TQ0i0G10UHCWQFuX/GfiR+UUtMgmgXtGD6MACMkV4A0RX4JMRn2rNHGBD9EMPQf096abBqwuSU7qlDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zZ7QN4LvEiY7d1KtAhhWeRCVqXUdNkouUqFw3fOWEk=;
 b=KpREyW5HKDjXlX94hG1pYR3ubHloQIvSSHqfoHARzKGmvF5M2jBeiH0kSxI1hhT4NwVfsf+YK+ZmcGWcYy0XA2XDv0R+R4HeNMFW1JdWEB3Tcn2UtiX/kbsdCmCVOM+40TtULKruIqeayqjv8+yVRUwkDTf3TqHiMErUWTUy/S7VyM/79gEz0UAF7gL84o/bxDDTVHD+Cls/Go93iZOTNKFYm3m+7yYHlkcb/m5hEf7ryyh41o/yuRiV8aBavZLGOjIj51CD1PeSBjf7pAkoSY2330tkVqNu1ceAgp+9guJnyYHRXxTHtSmcbywBYVkwwTs8vcrwZAEDOYxdOvnBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zZ7QN4LvEiY7d1KtAhhWeRCVqXUdNkouUqFw3fOWEk=;
 b=FCDU/+jRMt1dTcRnjEgflKbrHWd12s4oVDhVD9fMu8sbiH/dS77Qj5N24kJUBy2Axs5O88aG83ri9nkuuK14vsViWCDskLyGdBgpmedx+of0X7nI/ZUzvUdKurUBhNfKi87VZtjQlILDhZNoJi+i0d3BSSp06AtPqlbVoyxA7YEQnF8HCR/ldnwCbz3Uoh/uskn9YJzmZaL9wbCiAUTo3s1h/qnIfOhcUBZy2gZq39NENVtSoAxvUEt2Kt5kzlWcrAAjpo3y+Asc4nDYDkSH4fr8H89fn1xa6ELNb20xIvyGJtixvHkV1a1w43O5LFl4gPPhB1MEF9SPDnpHl123ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB7738.namprd12.prod.outlook.com (2603:10b6:610:14e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.12; Thu, 28 May 2026 02:39:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 02:39:19 +0000
Message-ID: <97aa8ce9-e965-4f2a-8719-c5e586688878@nvidia.com>
Date: Wed, 27 May 2026 19:39:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dma-buf: set SB_I_NOEXEC and SB_I_NODEV on the pseudo
 filesystem
To: Christoph Hellwig <hch@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org
References: <20260523011117.121390-1-jhubbard@nvidia.com>
 <ahPkQgCg_52sxkYH@infradead.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <ahPkQgCg_52sxkYH@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 6abfe015-98c7-42b3-7bea-08debc625145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	npcWVHKtfigByppJzDs7lb7rQtIUgZBTcfWky1FPO5XJ2W8KmLDexD7Y1UWJ2mjsqlQrlZcF9QVvnivcSuNjd/l2OUrai38X77tT36yg/LA/aeruYq7EOnbQknMLp+QAaAkqo+xua/E5Z0S1mGHQWKYPSPR9kPJJLYddZVLvmlOV1vkvZfpfwiJ35PTl93VEcyxJvUORip2q2aSTR1GItzDQ7IfAcpAIk3lkVZ2+Cbkdc1b3AcxpcBF0CD6e6NhKBti2FzRmrdoumpHuzL96/5gvjwmcQ7+8rvGsFo3WTDVRG8pVyR0pe+i9Ucpp3m9fwFGxOV34J/aX+KVVol9qbrLGxk9ii6MO3bIhen6qIZwXiQoBBVCcTyvp3s5J1kphAwji2mgZ3OUB3CV1jO07Ybw5aM2OLuuNX303fxb1HZo404Bin3kJtYeehPFiqEQ04qK+kZCj8ikjzQM/Jt23+3jLZGCJ97E/b7uerDIuejGh6jL4pb/2H9tZ2TcGiGUFCCHlVCVlyvxWyJGgVVQD4faqeaoF3P5zxy0hWyJVM5vaUfMGy1sr5bKIThwpFA58ZyQ8YEvGR/hthvD8qXZ7oHjIiB3bEVwFcS2e2CDLFhaPu3K3GZE7Oa7w5taR+FUTdcxeCBTbBrDGbURXDTBF/p0HVP06egapuoEEtwMVuVLVTzEbN2rtJY1n3HlBRdGg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3lSK05QaXhodk1wdnhkdUgwZVZCSFJrak5aSXNla0xpYTZHQUlJV2c0Rml6?=
 =?utf-8?B?cU9DMXFSZHViMDVNTXBVN01jNi9LZ0pndHBBZmFMelZFVllFdjFPYWNQUUxh?=
 =?utf-8?B?MmZESVA0ZklyV0VMNzFRa2EyYUMwdTRSelBPR29FTGFGemJaWVFCSXB0cm1W?=
 =?utf-8?B?Y2kvd3N3dFpxV2xDUVFPYUlFTGhhMkhpMFZTK1N6bU0zVHdsYkNhMkR1WHR6?=
 =?utf-8?B?OXNVSXRKZzJOd3h2YmVhNTVDUWRmQzRqb2x3dS96WXpjYXJqUDRERzJzZktN?=
 =?utf-8?B?Nk9tTWljSmVIaUtBQlJmMnROZndUSW1YOW5QcncrYi9FNStHWXJMRzg2ZlVZ?=
 =?utf-8?B?NHdXNjV3cHJwY3lqZnovbFdaMWVpc1BOZVVhcFhsWjlYczJlWVJyRjZSSUNs?=
 =?utf-8?B?Z0IxSk84bXJkd1FXOTZPZ0lRMEJLMHVNUEw1dnIvR2dvOEtTTGNiWmJiUDdm?=
 =?utf-8?B?ME5lZlNJTlNhQ3JSZXBtbm5RVU90ejNERCtEU2tOalgyZG9xUGFoUVgvRUkx?=
 =?utf-8?B?Q3NzV0p0RjgrRkh6WEN6M2VMTTZUbSt0ZVN1WUYyOWh6bjVFL1h3dzdMbDdD?=
 =?utf-8?B?R3d0eWYvM1M5SEV6eGc2bVRmUnFJS2ZUUFNubkVFaE4rVE1YSVVMNnVPM21F?=
 =?utf-8?B?d1lsZm9ySXYyUTZOL2xMTnlmaWRMODFRNXVQejJNcVdxRzZmSkI0ZmZPZml1?=
 =?utf-8?B?TnkyV2NKdHBDcXJsTkhxVzNuUXkrbElqNXY2c09NcjF2aFdVQitTbWFpMmxs?=
 =?utf-8?B?ak1MaG01aFVoR1huejlyU2ROeTgvVm10bS9KeC93dEx3Ulh0V2g0Z3o4OU1S?=
 =?utf-8?B?SHd5YThTcGFsdEp3YmRDNXVtSjFKRW1oeVloeTZZQ3pWeWJwZmE1bkU4cThj?=
 =?utf-8?B?L1QyNThERW5ZQlZMTzJqV3NaV083K3ZzdDRFLzVFejU0bUhHZkNoamlpWUFl?=
 =?utf-8?B?ODZzRTJSS09ZTXFIVkRWOGwrZk1UTDBkbXNTNERzaXhKVFk3NkttUEl3bzlE?=
 =?utf-8?B?UDdKMzZ4SkM3WExYbnhHNHNsMzFxUWJXV1BtQTl0RTc1OEdGTjlpNklRWll6?=
 =?utf-8?B?T085QXIzY0kzeWFuc2pSN3BBaDdHd2I2c3ZsS1hNOVpiVklUREZQU1phYTE5?=
 =?utf-8?B?cjk3YjZCUW45dEpmaGR1c29UYWRtbmtOWEsxZ0JwZzRFT05jMDBQaThHdFRC?=
 =?utf-8?B?c3dmdmo4ZkpQN29TeGNodDhxSzB2aGVka2lvaDNEazk5NDExYkRKZ1RkR1VY?=
 =?utf-8?B?VEV2OGxmdzhqREZ5VU9QYzNHQXRVZXBva09jWE1YelhReVUrcW53UGNzcEgv?=
 =?utf-8?B?WEdYWXVoMmV5eVBZSE5KTldVbjVVUU9HSmduOC9vbUNRdDh1TmJWRG0wSUs4?=
 =?utf-8?B?eHEvVU9uNHNXbTEvQUpxUm41d2N1TG16Q1c1SUFLTFpNMksvL01uQkxURzVL?=
 =?utf-8?B?VG5KanpKOUFHb0wxTDRwM01IeEsyR3JmejFHT1RHTkJPZzFiRGxnVFpLQkZV?=
 =?utf-8?B?eU5oazhJUlFNM3Y0bSs0cTkwaTlxU0E1aDlydEdYNUJHM2U3RHlnemM0K2Fs?=
 =?utf-8?B?bkYvSEM2MVFNNWtPQ1Z5R29TWHlycVcwdFZJenUyMUd4azN4TFpkSnhrcHVD?=
 =?utf-8?B?WXdra1VoTmwrZUZza0hGREFCdUw0OGd2clNpUzllMGtBWERkR1BlUzd0d3B6?=
 =?utf-8?B?NndrT2k4UlZYbnRMSGY0aEFxT3VPQ2tyb1NBd0twL0haUm1KZ2dQbUJ2SzMx?=
 =?utf-8?B?U04rditLaUdDNVE5Q0tNZ1BYb0pjdko4c1p1SWpCR09Hd1Q3M0NyZi9MS2Rk?=
 =?utf-8?B?VERtWnhnR3JPNEVsZUpPTGVtQ1VxeG9vVmo2ZXlDV1ViTDRreU14eTAzd2Nn?=
 =?utf-8?B?MVBqdGRsbDQ0bEo4Z1F4Ukwzc3lNSVo0OHA5R05zY1pVVCtqZUZpbGN4aW1i?=
 =?utf-8?B?dXVrdjllWTBNN2s4Zk1MeE1aS2NnVWxWSmFsWElQZmNEZEJKeWZCb2p1RFcz?=
 =?utf-8?B?bWZ0VHlydjM3MEtvbFdvOXNYb3dIb2NxT2lpdU9CdFdCK1UyYmFPRDlHaFVS?=
 =?utf-8?B?d2xYLzJlZ0lYUWZYQUhKbTZ6aFprQjBrRVNXdHpHOVV2YUVYK1c4WVVGdXRs?=
 =?utf-8?B?OURFQm82cC9USlgzaWkyejhxYnZUYUhVMFgydTlDaEZIRnRiUENDOHYvQWFY?=
 =?utf-8?B?djFOQmNDV0RxNUxZWUw1Q0h2TDVpMWgxVis0UEUveGRmOW1tdTNRMGdqK04r?=
 =?utf-8?B?TE04NEdFaGFteFphV1E3aCtFUytsMldPdkRkWEJLNXZTZ0FFelVNbXF6Nm1W?=
 =?utf-8?B?QmdJN1dCZ0huK3VSaUd5aEkzdkxucjlUWnNtd3NGVFhmSzgrbzlxUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abfe015-98c7-42b3-7bea-08debc625145
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 02:39:19.2015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4mzfpKzGcBm+Dw6jNXRFvcuGjKRlFb2Z3iVnhq+akGXKvFbrqxQ0FwebTkmvLaiKkvzVm2fYBvGFmAm2Iv61g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7738
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62938-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: BEFEA5EBF5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 10:55 PM, Christoph Hellwig wrote:
> On Fri, May 22, 2026 at 06:11:17PM -0700, John Hubbard wrote:
>> The dma-buf pseudo filesystem dispenses S_ANON_INODE inodes via
>> alloc_anon_inode() but never sets SB_I_NOEXEC on its superblock.
>> Since commit 1e7ab6f67824 ("anon_inode: rework assertions") in 6.17,
>> path_noexec() warns on exactly that combination, so an mmap() on any
>> dma-buf fd trips the warning:
> 
> Just as last time this came up, we really should set this higher up.
> There isn't really a reason why pseudofses should not set SB_I_NOEXEC
> by default.
> 

Ha, I see now that there is some history to this.

After looking at the email history and the code, it does seem like
the time is right to do that. I'm testing out a tiny series to set
these flags in init_pseudo(), and then to *not* redundantly set them
elsewhere, I'll post it shortly.

thanks,
-- 
John Hubbard

