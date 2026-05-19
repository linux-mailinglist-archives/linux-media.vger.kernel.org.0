Return-Path: <linux-media+bounces-62097-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAW2BSYKDGo5UQUAu9opvQ
	(envelope-from <linux-media+bounces-62097-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:58:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7895787D8
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B02030C766E
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6EC939EF21;
	Tue, 19 May 2026 06:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="y/P2Ncmj"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011003.outbound.protection.outlook.com [40.107.208.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC213112C1;
	Tue, 19 May 2026 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173470; cv=fail; b=rrV5agY2hXgiSMh3mZDI5jm3RDt/L1l5+sVt59KhCwJmwNbAPD9SUuoG7CyeqLVCj/wCGmcGQgfj+K1VPFcmKrWR4weJ7UsPHknYNnVHLPA1gs/vdIZRhyDuOoKAzsisSaviRlxuPp9xx2rOik7iBMV5b5hq+tUoyAok84PdiH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173470; c=relaxed/simple;
	bh=MJ9aOFaVIylSFjo6pzUaF4kKIXbaO5LiaBvdCMhH2HQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ReoBQ37SiAxSx3XePejRMY5yCew0ZoSxpnjT4DwDzCtq38XMnwRUXLSzXI/tt1tmwdG3wMi0qhXWGI4yAX+hmTKIBG1lJEITiRlH5Xomi7PpCamtkCdu1ODKpo7ALNtwHrLEeeWYovzuA1bEX0x037vnmMAY9fXCjSTy5kisot4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y/P2Ncmj; arc=fail smtp.client-ip=40.107.208.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bK4fbFe+GcCYtMLXY4sybMbo4XEr9QR3XPt5VFj6cqenB8UDunQrXfbwi0uH53LpM4o6K90AlM96aeu8+ut4AXcO+a884Jb7KTpgI+h6HIG3Y4ciCF19Qe+AeWNso3iCudhCqsE+ha7JQpcDSqWfyg4q/eTEG9uY23jmJPfNPmnVRNS4xSI6yjNbYleuv6BPQUFsrRYGOWq5wfTODNy83RXvHzuzyah2gxtN8c2HwVTbhsSKYtcaaqjqIhhWJOFGccPaPozboXRi9PrwiR4CBrN8d1ukcM/258NMeJmi9/Vwbcg9aWtQ/tiEvfunq7Ulpj0t/OsPYBfi6qibm0Bojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qvpt86PxcIzhxzluWfNWX4n9/8UCh7lqDC61KeKXZ5w=;
 b=VESQh3iJm4oL+Huqtcl2533BW07DjB1nl0dPKQFLV1n9aA05uXwhmb5xQKegV43mG483yDA3MLYZVJawq1Hgyck7t2LcsobM9Q7NEyfRP49UBiBa5OVbaEY2j53nD793Ufi7saJh47f6QicZE9UYBPRoEHQppj47M7/iRLmisE8dB3hPyEko0gMEvfU19JGJa04fdZWGIHdo2SOUotZz4VfwZWeOILrhFIslTgoe2dBWL7JrKFJHZPK2eUWFT+F2DqNxGoKSngUinbMtz1iVXVkkk/jLbr3aHKTsjkIeR9BFXlkxkChGS2lvs4H2NrZ63zW1lsCgtq9zjfX6gDXgQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qvpt86PxcIzhxzluWfNWX4n9/8UCh7lqDC61KeKXZ5w=;
 b=y/P2NcmjvhoP3xHi5s20kJql6zGKostNgiBiURy3orzpP3suRpPoNx75euHZyxLLU76jwyhXJRcrSblR/t7UquPc+3kT352sTP5tl+hyu2ayNNNcHQFmX3RGlUh1gEKeKifc5AGd4Sk3hiDHQHI3EJlg1AgkpMUp54OsqgKGhSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Tue, 19 May
 2026 06:51:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 06:51:05 +0000
Message-ID: <b4acc363-b307-4ce1-beef-fece0d66e696@amd.com>
Date: Tue, 19 May 2026 08:51:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: system_heap: Use LIST_HEAD() to initialize on
 stack list head
To: Jisheng Zhang <jszhang@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260519060532.13221-1-jszhang@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260519060532.13221-1-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0449.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 3488bb25-b4e0-4658-ca64-08deb572ffc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OoAQN+iNPB/d32DBvqPTj46p7YQQzHHs6CR52PrmotpWseXjCzGz2RBSTONtyybDkiE3Qy/O11a7VbCHK9sPznQhj4r3zMX27SSeTNa2svm+K/uMQsZRy+gaCbpwh+5EMuJ6onGgqhha0FZKSKl488AVVOtB7VSMUcX4e2NOTC+TyJYVXjEbcc/u0JtylXQxlxFBy1yxu4tyl4PRTu512GyEE3zszNVEODfsk5m927k7wg07YodHBc2OaRZcu3D43VETCW8FJKpS0fg7ESzeFoeZ/e2n/17+twofPblcEWA1icWjjzbMaV+0vKka3XJNZUqqdJKPrZXpP0mMwIEObRSnxbmcQHROZCWR09x5k3HbMDjj4ILsi0C1LBmpItXQmu85nlFnNpmpFPIymba1ozN+GzdJZVGfFxueFgrS03vVxPDmIV/P+qcFqLlJptEd/xgPidyIijODjuXbUui9R1mKgXZCY25Mp81ztGijBdyzP3Mhc8VNB0Cy3u933hDJPV5Qbg7z0ezoPgXinCQJr/XGLfWhCc8CHWM2Abg3R/mPZ584XHN81PcsfXIY8o8v+8x72mkwqJzbuTYN+16HloG5FJcDKQI4+H0uQmNEk+rkWCWbcqmLCpmJ08dU+SszVwf/p0sOEp772CCA1/oIqjAcXqMK5tXf+UgoHnUD0ixLQO4em/BLyZe0yBP/jndI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzNXS3NTN211UHBXMmN1bFBGYVF6ZlVnRDFJNTdwcGxvN1ovQWQ0WTN2SjNu?=
 =?utf-8?B?cjZ5QXFCdE13V2YxaE5rSFRIanBoMVE2OG1VUHFySDdTS2RXdTNqaFFtcUFM?=
 =?utf-8?B?eWEyNndlakRRNkNwbGRSS3RjcjRZT0Q2eHdzMTFoWlR3bkVWNW1Ta1FERXFV?=
 =?utf-8?B?MjZUZW1pZWJWczRRekV3WCtCSStSVCtGSVdnY1FNRWw2U0ZxenNPMllzaUFS?=
 =?utf-8?B?OUVWaUZLc0tXY3I4VWxtZWFDc3NrQ3hDVXdBUHRDTzJ5bGpCa0s4WSs5RXha?=
 =?utf-8?B?eVZOU3dzR0h5a29SeVFlaDBWRFhCVTdFK0h6SGE3SjNrYlZYbnJGMVV2Sk14?=
 =?utf-8?B?d0ZXdzkvU3VoQTVtN1dwM2l1eTVEcGxLcm4vOGZwb2hUbERvUEp2MjQvR3Nw?=
 =?utf-8?B?MjNnaDFPdmx0a2hqZ3MrV0VaRGVlME4xMy9BTFZ4bk5HSythM2plaHg0eUNM?=
 =?utf-8?B?cGJXMW5jWVp6aE1wOGZ0d2xvL0lzcVA4MzdLNEZEaTVzbXpOZU1USERhVDBF?=
 =?utf-8?B?QmsralRvcTdZYWNoKzBZaERndmVWMEVFS2tSYzh3enhiSFJPbjFXQzIrWDBt?=
 =?utf-8?B?RlVEUGxKUXpDczRrK2EvQTl1SGFQOUZsekc3d0xRU1FiNFNUakxqa1dtdS9r?=
 =?utf-8?B?M2czZlJpY2k1cWdycEl6MHNUNjBic1NTQkxQN0xrZURWaTlHQnlsRDN2c0hO?=
 =?utf-8?B?OEZFNWhTVndKdTAzclQ5OExuOGJBWmsvL0xtcjBrWHNCbm5uVUpnYit5bFY2?=
 =?utf-8?B?amVqbFVGN0FOcXUrTmNVaHBnVHpqdHBmMEMvTnJBWGhLTVg4T2dNRHc5NGc4?=
 =?utf-8?B?TXcwQjNIVENZYVRGZUVtQ3RCcmhYc1lZSWZhUExqd1R1L3JvWVVFa1ZFMm85?=
 =?utf-8?B?Nk9RR1ArYUtSVEFtN2VsNFVGSGpxcHZEMVViM3lsaGhJNHF4MlJlR0hGT1N5?=
 =?utf-8?B?UmlvdzI2VW9wREdyeGJMYUMyTVRhYmlwd1ZLM1BLUjhtbG92amFmWWRyalFV?=
 =?utf-8?B?dkxkOVphSHJyM3VOaGlzdVc2N2laRUtCL2o3SXFXblAxckFKUUlzNXdJOUk0?=
 =?utf-8?B?TVRxNmticEJSdldIS2R2ditNakhXM0dIQ05MWEhmbTk5dHpiK3BGdUpQaU1S?=
 =?utf-8?B?RlhPK1pOSnVTUzdyOVUxeDNUbWlBRlJhUVdXWkZXMHBGaXYxcDk2eGN0T3FH?=
 =?utf-8?B?U210YXhNMTBLOUU5SzMwOHdRNm1XRXl4Ukx2YmZZdGZ4citWa2xUaGx5SDdk?=
 =?utf-8?B?OW9qejRtYmtxS0ozSlJITlhPQXhtd0M1NVFYUGhYdVM1LzJVd2JQQkxPdGlp?=
 =?utf-8?B?U3k2djZNZitWSzZNUm9kbHREQUpLSHUremhpalQ4TE5US3pHNnBKRGJHVCtD?=
 =?utf-8?B?aVBiMTFMam1jb0ZTQ3NLOFZyd2ZEMmYzOE9xTERWNnphd2J6V1VBZmF0dzhn?=
 =?utf-8?B?a3VLTTM3RzFXb2FPTWFBL2pvT2Z2WnRoRlRKTlBhOG9YQzd3N3p5TW1DekVv?=
 =?utf-8?B?azA2MmVWZXZ4OEtBa3hYeTFjMnY5TmtOZjI1bURuUkdFNDUvWjMvNUJiNjRs?=
 =?utf-8?B?N3duSmIrOGt5ZkxaL1lnemFhTEFhdThiWFhmbTdCZE1qQ1BUQmVkT0g1MDZY?=
 =?utf-8?B?QnV1QmtDUnlTSUZSSEgxZWpaZEVwUVBtcGlrK3ZKVXZTSEZRZ1JkNUxGVUNk?=
 =?utf-8?B?Q1Bma2dCWTRwdTM4cXF0U0diRmZybE9zOURRR2NuOExnUHptTCtrdldLR251?=
 =?utf-8?B?a0RKdy94aUhaTUJGNll3SjcvSHgybDN6MGtXNVFibEJ2OHhzK0taYjIreUR0?=
 =?utf-8?B?L0V0Qy8zdHV1Ykd0ZUZzN05xcWc5SG1OQ2krYVpDUlcyanpIdWx3VWU5QXFl?=
 =?utf-8?B?ZkRYT1lBeEkvYmdYMVhjeWljNjVXcVU3NmlKemIvVDZ4TU54QTRHZUlVOXIv?=
 =?utf-8?B?dC9xQ0JWMU5jSFdHeTc2c3Yxa0RzZ1pNbUxINFpvTWhHcVVKRzZhdWRVelVI?=
 =?utf-8?B?aE9rbHNMUVZ0Qys2UmExZ3pYWmk1RG1sQ1NGSnA4VEhGVlh0bFh0Sk1janEw?=
 =?utf-8?B?UDQxSVNJSXhudjF4ejdkck9XdG5TY3pqWVNVaWdkaFBRdFJLelVnVDIxdUlm?=
 =?utf-8?B?aDU1d2ZmbGRPY1pIT3VjcHFMQkRCMnJSUVVpWnhENkhMcHM3TTBkZitsQW02?=
 =?utf-8?B?eUk3akFHT0llblVJYmsxSDM3ZHErWXZkajdDa1MrNmJISmlWbkpTd0ZBNkFp?=
 =?utf-8?B?VnpSbGdaTC80T081aks3RU9ZOStkeDVQK1k5ZWVRQzI0VjVmMHg3VFU0VkRS?=
 =?utf-8?Q?L7Mq3AUw+HbdOVq6N9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3488bb25-b4e0-4658-ca64-08deb572ffc2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 06:51:05.6547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWU9ENBR7luzPqRuS2Ktusv4JZNyDMRLFd/at/qCoM3TpafSQdmpEp7iOmdM2cAD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[bounces-62097-lists,linux-media=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 5F7895787D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 08:05, Jisheng Zhang wrote:
> Use LIST_HEAD to initialize on stack list head. No intentional
> functional impact.
> 
> Change generated with below coccinelle script:
> 
> @@
> identifier name;
> @@
> - struct list_head name;
> + LIST_HEAD(name);
> ... when != name
> - INIT_LIST_HEAD(&name);

The patch itself looks correct, but my question is why would we want to do that?

Initializing the list head (or any other result variable) directly before it is filled in is usually good practice.

Regards,
Christian.

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 03c2b87cb111..6f8b7138ff56 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -409,7 +409,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>         struct dma_buf *dmabuf;
>         struct sg_table *table;
>         struct scatterlist *sg;
> -       struct list_head pages;
> +       LIST_HEAD(pages);
>         struct page *page, *tmp_page;
>         int i, ret = -ENOMEM;
> 
> @@ -423,7 +423,6 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>         buffer->len = len;
>         buffer->cc_shared = cc_shared;
> 
> -       INIT_LIST_HEAD(&pages);
>         i = 0;
>         while (size_remaining > 0) {
>                 /*
> --
> 2.53.0
> 


