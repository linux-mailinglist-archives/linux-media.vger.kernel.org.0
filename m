Return-Path: <linux-media+bounces-64302-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ufSBJlcXKGow9wIAu9opvQ
	(envelope-from <linux-media+bounces-64302-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 15:38:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DDF660A66
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 15:38:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=fPD0YS9I;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64302-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64302-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A58683020D4A
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 13:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A77416CEC;
	Tue,  9 Jun 2026 13:34:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D9A416D01;
	Tue,  9 Jun 2026 13:34:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012065; cv=fail; b=PWaaU6XvqB+oKvH+gMq9WwAno2jX1M1Q2+n7ud7wrBK5JskV+MFgfjHdUupcHLydQkRc8lAKK7AqbcwdKqXUbqWpvEhd9ozbk6iZLpcZtVaE8hovdFS8jzal6WnkgVpKPT91gBm8dzIbk7gpEICr8yEamLMDooa3xtiAOAjPb3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012065; c=relaxed/simple;
	bh=S2b7h+SyKAdAZCWvRLNgbAJiKjW1euBOG/n5ce4XT3A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KuBgqKrcv/rhmpynBBlkH4JD9M1bd/y8jOs0NTsGxJLfJJIptnmx0hDmU8iYYyVGcq2guDyXNZtCgFvHC7FyE5CYubYVkI0c+gHVwC0UpNQotsIf8UE3gGh9Be684H5CWKrBRbGHGb3OnWY0xtIt4UOW7Aw9GDwy+S5tUY0nOVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fPD0YS9I; arc=fail smtp.client-ip=52.101.48.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WU5lXWdhswZvXUtsPSsrPWHaxpzpDgLBS6hZF152tSM/vxTp8c8COxDz5K/8MvovMLqHxnNYG/wlJNniaQvkrJ//c3fJk5vk2pjdX9AWV6Jea8F3ulBu0MxCPFKyoPZiRMNIyy9XkFeu9WwIbX6tqc5wkkcQInax0X07XFdYVPiDl3aIxXdxeblDBo8Jst+FYBmM01vbR81L7QdYBRPdPZgWAjdU9F5gYN0JBqi8X1tvSwduYUq7vaiphv/MBP4+AYvDmmd7R9Y6xnm4FGxNI8Mxim+vmiClhiHwMZQfwiCNISX+SuPPMO9zXvTUsw74xxx8T7cNMEcVBNQ2CV1Chw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcgYlzDsELemP64Gwu9iCi8fdlvDF4WHhx0sUJbZVqU=;
 b=SbaDMv26NmemnfA32P2qoWYV/cVbOhLUMXLW1Xh0z2jdwkLGSteX874K/FT/7ddT1v7uQSH46vW7SL/ghoUsmQsBLwOJ7payoaahsFZDNd4+e+ziLSDHy5CAhDUzBjDVVzJQJlGPCBlVQsGKlTe/kGkHcmnbBCxZrGN4XYRlLb5pzbZGMYgAXJbfZUwiHQzsoHe+BrIVdfjsExJSvysXTN0g1JeSVBxk8fIg6NsLGEO02q382Yg+Iiysrmvb3Wvf4l2DW+W9ZHGQxLLc1GESFaOhHGhfI48o3VXExJg7n86ugLKj/LpHe09kic0PEYS0QtJMAZVrdNGsFutrBjZTSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcgYlzDsELemP64Gwu9iCi8fdlvDF4WHhx0sUJbZVqU=;
 b=fPD0YS9IDDbKUaEqbiHIkA2TuwBkuW2NldJEHMfwpLgqCZ0UjdIUv2iB/QPziz3plHrKHKCosdBHku+MygeAEHiMuy+IYuBYtWeMgJQf3WmDqOvk+7d0Z/Ny2zmurh8vsJhc1XtN5tWPA6dUDQhSqZjNE4Hf8dxFVKknp924IYk=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Tue, 9 Jun 2026
 13:34:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 13:34:15 +0000
Message-ID: <84519e72-e057-45f9-8ace-baf12f095e55@amd.com>
Date: Tue, 9 Jun 2026 15:34:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com
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
 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
 <aebe759117cd65004510946e39bd02e4c903e1e3.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aebe759117cd65004510946e39bd02e4c903e1e3.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 3487029d-e0ac-4a51-5cfa-08dec62bcc63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Unk2dEd2xlVcrXVwcaPA6BkDcySlTvOND0nB+ykjI+8/8VNOC81leqNwpMwh1xqu6qeg7a2jiae2powXlHzMm/qYGCt3gx0wfq4X9xuVwfBGJ2HeUmZgSwPm9pOdKjDn+jHdJWPpjMtdjrr1TXfsYJ7oki/OnN5L9XhYTnb2QUmZNs1jPecoprjEKMRp9raLqb6CEzAcBOEvoAWNTpzDAOKxT7ZTumb2sWpIutiAxIz+EiI5yWqulIKaM3PPtluHyw09WBnWXhHPS/N+Zpmvd+zYBo2FIZUurZ4uhvHfsrxY750LWslhdd3S9pG6obzXdvS9CGp+dNnVs7fVuRtC+Xw8of72D+bqEp7PN0cXN/z7ANLbBoci5KLxDIDox4LbWyn93u+cWIJ12jYtcbDDZeMa+47nC0b0T/dkMRItrqp3toC586YLu3OUfglSmU+jbFhugwYuxZlEiufF+pw0U86Yq5TRlYivQfvKOquf021htCEcV+hSYtlpYJXyCYzks8Jfz32bMfEIIAV/BG0AOo8vxt0zYNxBJuSV8o998K+zcR0U9pBLMUJnXP6xQfjdrZz9ZG6VdLPnHTpe3TFuCVuJRXh80jcisc40IkQn+LgN+b9mkuPLDWiNMZ0CuUjE1GO5S3KJv+W63HKNuF4J7pR8afixf8JaW8CWZUOlATUtHm7rp5H1NbaBMIBjtiHP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHJxL3E5ZGNrdVg5NTJQd0pOeldNU1hqWDlpMXhQUytUbTdiTSt1M0kyVnVv?=
 =?utf-8?B?NEhKUSt5eU0wRnprQXpITEw2VHhqOWZaRm85SG8zanl6RnRacUx0NU9DaEo4?=
 =?utf-8?B?ZEg5Qm5qam85RFBCMzZpd2VmbkxydDlxSmNIQi9YdkVHNnhSNk9oaDV6cHIv?=
 =?utf-8?B?OTBNbVJ3ano4Z3ljS2pFQ2pOKzlFcC9FU2plcm1aa2ZVazV2YkRocHVudDFG?=
 =?utf-8?B?NzNqamZuaGNuM1NoOWpJRG0raEdLR2laSWF0ajI3enByUnJTUFJwNmllK00z?=
 =?utf-8?B?UXlwODJoamNTTERKT0FFOG1tN1ByRmZkTytWWExka2V0NDlaTFlVTGtnd3dw?=
 =?utf-8?B?R1RhR2MvblI5Zkh4RVp5MkhpdjB6UE13RjRrS2xWdml0UkJZZitlMEgxb1c2?=
 =?utf-8?B?S2dOVXoxdnVJTUpKQzNJYW9ybzY4bWhxaU8xcmFnemtjcldqOFJFRDAzblFt?=
 =?utf-8?B?Rmo5Ukp0UGVKSkdNZEVoYkZXOTByelZJVmFmeEhoSXdBT2ZTb2ZJVEZmQ1cz?=
 =?utf-8?B?YkRVbTFjRGpZMnl3NC9PMHlQMkJReFd5ZGNVRm9YRkpZVUhIK21FRDZaZUF3?=
 =?utf-8?B?ZEJ6bSs1ZUh6ZlF1aWpmVEV3YTR2UlZFTzZzN081Tnp4ekEvc2J2TFJFcXI5?=
 =?utf-8?B?L2tmZnp3NGVlKzFkaEk3TWMraldtQk5GK1VlbG41QnJwM0FpNVZoRnJ2TVdz?=
 =?utf-8?B?bTVVSnhkUWpjVGpWRzVjK0l2ai84Y01OOWpIQmVLMEZZRE5aZmJILzlpR0Nr?=
 =?utf-8?B?a3h5MXdpYXludjZjMHZDZE1Ka3F1dSt1WjVaUWZvS2Uva0ZzUVljSmo2dE5C?=
 =?utf-8?B?QytoWFVBdXFMOU1jTU5mTXl6Z2RTWXJKVmxxQUs1bXRLZENySy91RWwwTWI1?=
 =?utf-8?B?NHRKSk1IS0l0RzFYdmhtWk9pVElHT0dmMVZHNHBGK0JKeEpVRDJyaytqUlAx?=
 =?utf-8?B?OEtwcGlpY1QxQklLVGNDbHVzSTErVEJiWFZEMmMzV1AyNzhLbVVzNGlSYnNG?=
 =?utf-8?B?QVM0WEp1NDNleklwTmxhT1pCVHVLWWJLVW5WOVlLVzJBU2JpSmExMkEvQVha?=
 =?utf-8?B?bTBmd2Z1b0xuOHByNG0rLytVdXJmK3djcE11ZVNRY0w0MThyb2NEZExTYXMx?=
 =?utf-8?B?ZGpuUXBNVjhnWWZxaEx3MXgzTEJ1enBQTUJSRUdkRHk0VzNrelMwVjBDMHZn?=
 =?utf-8?B?dENINjVCL2pMRW5aU3NPODFiSkJQYVJOSFlwZy9PR0FPN1hWVnY0YXNzOTIv?=
 =?utf-8?B?cW1wV1p2MEdjeXFLclZvRUtjbGhEbUZPVGdLdU9lN1IyL1VvRExRSEtoaitO?=
 =?utf-8?B?L3pRZzJ2M2UyNTRzZ2JXVkNkbzVENFpDVHhRVDNMZW5qOVlNa0pEK2JzZEVN?=
 =?utf-8?B?VVg5cFRLQlhqZk4xRlk1ZUI2MDNLNjVKOUh1MGg1TGFhTTJXRnBZSGVXL2V0?=
 =?utf-8?B?aS9aY2dVRzZHaG1EZWFYdjQxSFZGdWRNaW5zSk5nSThac2dwb21DUklJTWg0?=
 =?utf-8?B?dXVkNnRwMWcyWE1ScmxsRmlMODZRNHZHc0ZzenBtK1crY0tCTUJiSDRHM012?=
 =?utf-8?B?djJ6WVhaVFdSK1Z6VHdVNkgvODM0VnFVQmxhb3BuVGxzS0FSeDBmZ1FSMUhC?=
 =?utf-8?B?M3NPRzU4b1hlOTdXT250eDJ2WWpaUkVXbjF3aUpDb3R2WlVya3RFVUlWKzFm?=
 =?utf-8?B?bXZpVHB6MXFMeWhFSTVyajk2RDVpbW9adUpVNWRLcVUzNUwrMEhuR0U2NmRS?=
 =?utf-8?B?SkFRVm90Nk1ZT08xQTNzcXNTRUVDQS9FdDZXb1ZoeWEvUDU0cjlHd0piV3M2?=
 =?utf-8?B?dnJrMGVlL0dLMDNiVXQzU0dsVlA4SmkzaXo1SzZwbnI1QnB4akhFZ0pzUlkz?=
 =?utf-8?B?Q3RPaUhQUmRoZXJJaGpkRmYvdm9LVmlya3JsMzVZTzNBeUpPenk4OE4wTE9S?=
 =?utf-8?B?c0ZXL0ZvSDkzOHVrb2JvV1lHeCt0VjA5L3RmOE1vWFZCbFlGSFExUnZNdU05?=
 =?utf-8?B?ejVySlNLbitieStJZWNtWGJVbU96MC9NcjNmMmgxckd1aDVSb2JQanQrZVYr?=
 =?utf-8?B?MVpxRytNR0JvMEZYTjNDQWFrMWZ5N0tBSTJwTUxkZXJPYnQrVVEraDg3TjdX?=
 =?utf-8?B?YTlUMUhnMFBDZFdQbHQ0MWxsVGR6d0J6QzQzcnQ0U0REdUF4bXRVYTZ1TVhJ?=
 =?utf-8?B?ZCs4ckJnTE5NaDNQSTg3NnNkYkNDZktaRjI5SDZ6V2FKZGZ4b1oyM01hM0dJ?=
 =?utf-8?B?YUNqZ3dUclBrckJwZlFkN3pGcnNNdk5pampQVkJxYmphOENYdk5PRk5wVlpj?=
 =?utf-8?Q?oX5N/7BdMs8Mp/XwFq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3487029d-e0ac-4a51-5cfa-08dec62bcc63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 13:34:15.2743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ej/AbYxSVFmLVc6yAuLcYbf7UMMVbzQQceKRJeoqJm6Drla/MQeGrqanBXEzCtUF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
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
	TAGGED_FROM(0.00)[bounces-64302-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17DDF660A66

On 6/9/26 15:19, Philipp Stanner wrote:
> +Cc Dave
> 
> On Mon, 2026-06-08 at 20:47 +0200, Christian König wrote:
>> On 6/8/26 20:39, Danilo Krummrich wrote:
>>> How did you get to this conclusion considering that you run into what I
>>> mentioned above as well and the fact that we seem to agree that the performance
>>> concern is rather questionable?
>>
>> Quite simple, it's the cleaner approach.
>>
>> Calling callbacks with locks held is rather questionable even putting the performance issue aside.
> 
> 
> I'm right now going through all fence users to see whether we can
> implement my solution.
> 
> And look what I found:
> 
> static inline bool
> nouveau_cli_work_ready(struct dma_fence *fence)
> {
> 	unsigned long flags;
> 	bool ret = true;
> 
> 	dma_fence_lock_irqsave(fence, flags);
> 	if (!dma_fence_is_signaled_locked(fence))
> 		ret = false;
> 	dma_fence_unlock_irqrestore(fence, flags);
> 
> 	if (ret == true)
> 		dma_fence_put(fence);
> 	return ret;
> }
> 
> 
> That looks weird, doesn't it?

No, that is pretty much expected.

This issue results because of the lock inversion/cleanup race between nouveau_fence_chan->lock and dropping the last reference.

That in turn is caused by the fact that enable_signaling is called with the fence lock held and delegates the signaling to the caller instead of doing it itself.

This in turn means that you can't do proper cleanup after the signaling is done by grabbing driver specific locks.

This is *exactly* the problem I'm trying to prevent here.

When the callbacks wouldn't be called with the fence lock held the Nouveau nouveau_fence_chan->lock and the fence lock would be completely independent.

This results in much better cleanup paths, fences which are independent of their issuers and in general much simpler handling for all dma_fence implementation backends because we don't need to worry all the time about lock inversions between the fence lock and internal driver locks.

So as far as I can see what you suggest here is exactly what has caused all the problems in the first place.

For the cleanup path in Rust you should be trivially able to use call_rcu() if the synchronized cleanup path would be causing issues (which I clearly agree on).

Regards,
Christian.

> 
> 
> We do some git-blame:
> 
> c8a5d5ea3ba6a18958f8d76430e4cd68eea33943
> 
> and we find that it's Dave who wrote that code, because
> 
> "
>     My analysis: two threads are running, one in the irq signalling the
>     fence, in dma_fence_signal_timestamp_locked, it has done the
>     DMA_FENCE_FLAG_SIGNALLED_BIT setting, but hasn't yet reached the
>     callbacks.
>     
>     The second thread in nouveau_cli_work_ready, where it sees the fence is
>     signalled, so then puts the fence, cleanups the object and frees the
>     work item, which contains the callback.
>     
>     Thread one goes again and tries to call the callback and causes the
>     use-after-free.
> "
> 
> 
> So this is a race, caused by lockless speed optimization.
> 
> And it would further seem that there is one invention in computer
> science that can prevent such races:
> 
> Locks.
> 
> There is no cleaner, safer synchronization strategy in computer science
> than locking.
> 
> This race became possible because the lock does not guard the entirety
> of dma_fence_is_signaled().
> 
> Wouldn't you agree that this is a strong indicator for the great
> advantages that consequent and consistent lock-protection grants? IOW,
> by using locks more strictly in dma_fence, we can increase its
> robustness and reliability.
> 
> 
> P.


