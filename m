Return-Path: <linux-media+bounces-59296-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEl7D12F6GkNLQIAu9opvQ
	(envelope-from <linux-media+bounces-59296-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:22:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB7F443656
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0158301C3C3
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085EA3B19D1;
	Wed, 22 Apr 2026 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aral3Sh1"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011039.outbound.protection.outlook.com [40.93.194.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D833BED38
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845841; cv=fail; b=PnZEVHXtds74Uw4SWjyhaqaYLxeoVTrXldW+PUADMf99AQzO0gy3kw2LrrWLC0vlSMyNyr++FUHuCyJWX1yRzwFr4LBsyNv2d3v9y/zsnNPzgSYXpBmwt7oX/MxOEhbGXk/CG0bQvhzGLFFZZfXwTYLp+xAjxCkfSmxjkDiGqdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845841; c=relaxed/simple;
	bh=sLg/cg5pH7wYYOLFAcIzGIVuh+55fql/S9B3QdEN9Hw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BJ7Rfdmu8mPUuksuXMHDyixdQyLL10nuOFpvjaHMazXhwmogWyuJ02bNDWA9sv4ShMG3zPSCBU8GE3M1dTlp3bwjMv/sDHMEGrsYy6pJNemPg+dsl/D+rv5vzgYfMPWZJ1CjCEG7/GZAKllj0sTrsxmCEp9kVnkAQ2ZsK//sQTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aral3Sh1; arc=fail smtp.client-ip=40.93.194.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYKLPrbuVwmVB4GlGq6pM9eXThLbfucOCewUmby954a3GmcTJ8hu8ML3gnVfC7XAWr4idKK6E2ClTPCqTkwOtocz8WFtw5iVC9p6J+S5TP7GgYydnbf9AVoDflRMf8EPcdJGXUxZTIcj1wVF3js5B3RHKyUQjZqMk4Ol7hBcTJqOQ0+fUeSTfYiidGn0CgFUdVDIDLlnL19i1Yt2m9DeV6w/O3duUd6+GMJrfnvK+R81gNu9rCA8+xVd+XyECOjvWSiyo+CFSTpk+if/K6n6u0iRphg4vQasss4YHV/30nnd25jFR8lHx6JDpdGLCqk8MawSl36+AbmdtjFWEqtZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDCwzwfi5Bq62423qgGzcfEZ1cD0n3hPrRggyPBRWlM=;
 b=mpJKXComODxeM0pTDiCWet7Vq5va3WP8CXO1uBX+46oHqeGcuybcTRooeprSbTU4Pmp1vdtAvlcAp6CzTWHcUCmPyHVa2R7zYFrU68QBBhMhNY4k8N4BMIB1F2jOj52YLvrV7Fz2zLla5hOJwqpnsorOpsxqlQ01U5NLZVK7mSN1Z8h26NokMYD0Lw0XsIxH90MlwmRD/wOLlhtzUA4pYuDhyWjngWMgRWQKuZoaaAxI1WY89lKYksiWdOG+ZVQJDaNGetiTQyxb/Z4yB7Z3uL0KoUS+Y8aYJWfZedShcvgS3HktO+Va8SKUoAST9Cplgnz8392bNirzQON80w62Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDCwzwfi5Bq62423qgGzcfEZ1cD0n3hPrRggyPBRWlM=;
 b=aral3Sh1sp1/YLC2wwgbFENQhm4ldZvV+DJ6UbSQsuPplKnINdm5Yk+1gImkzMxb1CPdq9XDrdDpN9R0K70M6KHa/spQCDvRl57hFVc49wOfoJaaKcKkWa9svgw4qUCTTnE2d030BG4zVMLGgcK6TtYKLHTNgBIwDPwXGkxn7qs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7898.namprd12.prod.outlook.com (2603:10b6:8:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 08:17:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 08:17:13 +0000
Message-ID: <f6d38a08-009c-4efe-9dc3-6bcf00ac35f7@amd.com>
Date: Wed, 22 Apr 2026 10:17:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 21/26] dma-buf: Add the Physical Address List DMA
 mapping type
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <21-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
 <c413710b-4c28-4ed8-88ec-aeb8c4482011@amd.com>
 <20260413121628.GE2588311@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260413121628.GE2588311@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: c706a918-f714-4240-274b-08dea0478ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mNr7347r2+OM5Pw+sjvHTX8tQZkDM101dnufb+j1892ns5cf7avx/RSObuyaRjH9nUdXJsmdmAKaYzalvIu2zpBsJ7ejIQs0lOmz5+3l9q510sdC8OPNGCW+myE3vfO/icmIe2D+bdE9G8ZXyFjJPJHnzWLlnId4oDQT4jzpJt0Z9wL5w2TPrf5YSBfvjyzLD4L66KEv8goiCtcj45XvGa0CNiBU72NqdThs3eR5KFmAcabnvk7UVmwgpS5CfzRoyq7UU5pHTYd9xNJTMVwXKxzNS1a7iuBkh83TVjAThpjoaMp+FlZQM80Zgs68zgAr2RQynhd4WfHVbDx5HFIFBAyTsokpTIIycKNYkqFMjMQdeXLFhSWGrFHgfwaSgUWw28OJXWTtIZo3SqezPpMqwVPoPyRR7AgQB3Z3FBi0Uod4Nt3KzTmZVM/Yk01CE6I5GwZ7ASUoM1RnTz95p7o1kvWmNGZRwuZLflpIyZzdfWAaydkMOO+4ecuFNn5NZ6xHrxUezhARsE7IZjRhmT5HdXpiBxWNw+O5EscWXStP1bSZchX2iHRJZdxkt9Eibxiy/OQ7QlW8bodLbHDnks7aW6vXHTTaHusjfgfJbTJ7ZzqVAgoBocQlMxFFjleWkHqDMkTtxemLPFi4Zy86xofJsUwjmLtISNsQhAFKEbtOnwMP2eJx8pC0hqviOSexhmrdgMU+KD1Ri76//GVgh1vqnl1oCIcnCkdyPiq0OqNkW3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE44V0NrZUQ2US9rczRyVERkaWNmZ1ZXbUdCUVJCL1NFWGxzODczYXVNdFBC?=
 =?utf-8?B?VVB4WmpGWTF1WGFrM1AwWEJ1cERqRG9RcWZwN3hNcTlEQXIwMU1CZzJZRGlR?=
 =?utf-8?B?djgzcS81VlV2SFFkUlRSVHVIMGZYVzd0YVlFOUZ5cmV6cnQxYVc3cDZsVGpl?=
 =?utf-8?B?dTF3UGN0S0J1L2o1YlZGTmhIVkdmdjVsSDd3VzU5QXZNYjB3ZmtjTFV5bHYx?=
 =?utf-8?B?Mk1tdkdyVzFaNTBUK1ozMXNjSXZoTzQreDdOSHNDalVEQ2lpQ2xDZW9wTklN?=
 =?utf-8?B?K1pRQTYwMG00QWJHYkZCWURBTFZZbDNHY2xaUmtxOWxHemxSZ2N6QTloSHhD?=
 =?utf-8?B?SUFHYkxBZmI3YXJncHRsQUU5WE9peXhRUmU4TWRtVnI5b2dZSDR1SUZuNzB1?=
 =?utf-8?B?dllDUFAyZ1R1UkpPL21WTjc4MHh2Mk5zSkZPZ3RoY1ZRWkRqL0ZYMTdUK3RP?=
 =?utf-8?B?OGtjTWdsRUM3cTkyNW5DY2FZZjcyMkVOaGlrLzFVMkp5cWJVeG96Ny9ZZzJa?=
 =?utf-8?B?ZWNVeXpzdDc4ZVFPWVNpWGw1dEVuZTNXWFMvK01xOGZhKzRNTUN6Sy92akps?=
 =?utf-8?B?SEVZa1FyUHFMeUFrQ3F1Skd0akJDZ0U2ekhzTEt5cFIyc1BTcmZsVVlEMmlR?=
 =?utf-8?B?NnlxdDdQdGNneHdtM3pSZmFEYWJNeU15MzZtY2tPelo4VDFhYU9EbllQd1dX?=
 =?utf-8?B?L0wxa3M5aUtBSm9hcVQxZnIyU2FaUUhMKzRtK2c1UDVFS1RCdkVkMzRKWHJG?=
 =?utf-8?B?YUZUOFNFTWh3eHFEQmU5MlM2VTkzSzJ5anFDQVVUVzEyUDF1NytINzd5NXZL?=
 =?utf-8?B?M05PU0tYZDV0aUZNQTJpM3RyQmVyYk5xWHdYcEM3a2kyT3VXUEp6YWVGU2xW?=
 =?utf-8?B?ZUhzN1JZQlVMM0ZaSzN2b3dvclc0Q3Q2Zkt1U1RBM3pwL295UklWVEtiY1hQ?=
 =?utf-8?B?YWtaUmExZ3E1MkpIYzBvNzdpUmFCODh1QUxBL2JESDNZTlkxR2J1UzFuUkw1?=
 =?utf-8?B?enpPQmpIQnlERDRYVytHQWVQQVQ0K21TelRNYkV4U3MzV3BIeXl3VnI4TUIz?=
 =?utf-8?B?Q3k2VTQrd2NMVmNEQUZvdjNwcUxmZGNQOHp4N0VWd3psWXh6b3dDU2pTcHdZ?=
 =?utf-8?B?TTlmb2luUHFIWHBEMkQ2eTVQVTdjYitZcW1XU0RSdmx3SnovSmcxWmwwVjAr?=
 =?utf-8?B?V2toL1FWRjhYbXk4eEx0bEkzUEJBR3pDZTlHdDEvb0lMRHIraGRWdS9RcGxs?=
 =?utf-8?B?QTNXQnN1UzZMY2dDSTVhRlZhT3Z1bWZuVlNIVjVVaW5uSmltTEdNQnUrSVdk?=
 =?utf-8?B?U25QY2hkeTN1OWk5WHhaUGl5M2srQjNjdEpadkpxUlVHbUZLMVRydDFlUjV6?=
 =?utf-8?B?T1U4ZVNVa0ZEQUY5c0VHYjB1bU5VT2l4RGJuYVhZbFl1cjZtTnZEZzJBMzVk?=
 =?utf-8?B?MW9ZMGVyMkRVc1N2OEZVN1lra0o5MDRCcFowa0tMNElESDZTZVBxb05ZbnBu?=
 =?utf-8?B?T3JENHNnUEpETVFxb1lIZkhIdHR2dFZZeDNNdGN3Ymh3N0doK2lubmVhNFBT?=
 =?utf-8?B?SGZKK1lnbTFzcGlnSmF1WDJvbmpLSXJYc0JQZ3dHekxyL2E3SHI3aDVldnkx?=
 =?utf-8?B?VkRnVmJnRi9MS1R0aGNBUGZhWnh2K2cxZUNJSy84YW5YcDhjUXpvUEJSamJr?=
 =?utf-8?B?MmtuT2U1SEtYNVhWa1BTWFV6N2lsaU9pbDY1SW9RL2tzVUY4YkxoTEV6ZGk3?=
 =?utf-8?B?ekR0a1FQZ2xidTJ3Q3J4blJKVWdZbWJ2VDRHTGRYRDlScCtVWlVDTXJhdW5r?=
 =?utf-8?B?bnkvZGpzK0h4MnRCM2lRNlkzc3V3akJ5TWpQaC9oa3BQRUhWMUdONmJSSk9X?=
 =?utf-8?B?L09SWHVqUDdjcHNQMlU1Tk9PWDhKZXV2dElnbkN1d1ZFQkJoU1ZMUGRQdjBx?=
 =?utf-8?B?WTltTkxnQXlIbXZuWDVMY1VQWVd1ZXRXSlJzdnIreEYvMis5OXpnOWdVTmNl?=
 =?utf-8?B?Wmo1RGc1eDFoYTR2d1FISk5PTXd1YTR2ckEzVWd0RXVHanU5TXpabWkrMHpO?=
 =?utf-8?B?VGo5WUd1MExLV0t1RldwdUUzUEwycDFGMTAvcUVwNTViUS9XNUFPejYwNGs3?=
 =?utf-8?B?SW9PT3F1YjRtd09PbG45ZS9ZZTZBbXE1QWRFWnZCZ1Q0ZlpLNVF6N0hVVE1u?=
 =?utf-8?B?TnZYWDRsRXY0akhaRU40TUl3NzYrdnVtUGE1dS81dW9OUFl1UkU3anpCc2Ez?=
 =?utf-8?B?bWVxQmJlUEFKT1RHUUEvSmk3MEgvTWlhaUlEOFpWSi9Qb1h3dWhqaThHRXhU?=
 =?utf-8?Q?diz+JiDc9T17IZuQS3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c706a918-f714-4240-274b-08dea0478ef7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 08:17:13.6866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4x6xhoTJcRHNZdaTSlOGRyMwLoWsMVYDkf4+AslgeUyFtmi3ZvaHQmZAMD+3X8Tr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7898
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59296-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 8BB7F443656
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 14:16, Jason Gunthorpe wrote:
> On Mon, Apr 13, 2026 at 10:58:20AM +0200, Christian König wrote:
>> On 2/18/26 01:11, Jason Gunthorpe wrote:
>>> This type is required by iommufd and kvm as dmabuf importers.
>>>
>>> Due to sensitivity about abusing physical addresses, restrict importers by
>>> using EXPORT_SYMBOL_FOR_MODULES(). Only iommufd can implement an importer,
>>> the kernel module loader will enforce this.
>>>
>>> Allow anything to implement an exporter as there are use cases in
>>> DPDK/SPDK to connect GPU memory into VFIO/iommufd and it is hard to abuse
>>> the API as an exporter.
>>>
>>> The physical address list exporter returns a physical address list in a
>>> simple kvalloc'd array of struct phys_vec.
>>
>> As far as I can see that is still a pretty big NO-GO.
>>
>> We have seen so many problems with direct physical address access by
>> the importer that I clear don't want to repeat that performance.
> 
> You've said, this is why I used the EXPORT_SYMBOL_FOR_MODULES() -
> iommufd does not have any problems to use this correctly.
> 
> Why is that not good enough? As I understand it your objection isn't
> that there is a technical issue with iommufd's implementation it is
> that some other driver could import phys, do it wrong and make a
> mess. I think EXPORT_SYMBOL_FOR_MODULES() fully addresses this, no?

No, not even remotely. I clearly don't want such an interface in DMA-buf at all.

You can do that as private iommufd interface, e.g. where iommufd offers the functionality to say give me PFNs if you want that.

But when there is a DMA-buf interface even if it is limited to iommufd then others will want that as well and that is not something we should do again.

Even for iommufd I think we don't need that. What iommufd does is basically manipulating a specific IOMMU address space. So the interface should be to give that address space to DMA-buf and say hey please map you backing store at this address into this address space.

Regards,
Christian.

> The only past problems you've raised were related to improperly using
> VMAs, that isn't happening here.
> 
>> My main question is why does IOMMUFD need the physical address in
>> the first place?
> 
> CPU iommu hw only works in physical address.
> 
>> If that is really strictly necessary then I strongly suggest to not
>> touch drivers/dma-buf in any way, but only do this is private
>> interface between iommufd and KVM.
> 
> This isn't between iommufd and kvm. If it was just that we'd probably
> be able to keep going with the private path like VFIO/iommufd already
> has.
> 
> The two paths we are interested in:
> 
> 1) VFIO to KVM
>    Allow KVM to import a FD instead of using a VMA like iommufd now can.
> 2) GPU and RDMA drivers to IOMMUFD
>    Support SPDK and DPDK type userspace drivers to work with GPU memory
>    This is becoming a popular topic
> 
> Jason


