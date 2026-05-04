Return-Path: <linux-media+bounces-60308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KYaFOyz+GmWzAIAu9opvQ
	(envelope-from <linux-media+bounces-60308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 16:57:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2E4C043F
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 16:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D21753023329
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 14:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07C53DF011;
	Mon,  4 May 2026 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4jD1DO/I"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE6839B963
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906017; cv=fail; b=hW1GIsBA0/fMFRPAk99wtHfPShzxZ2h3TPRo1DuJJOUaF3mYS40WmGprl7S273ZuoSfLstU7/UDXRY+5hmbD5wx9T5a8ZV36lV6awphDTE0YaMwM9xxT6MDOtsRBHpoX23lsxeeY97NEDEjj58xOLUMDpcut0GeoXRtonbyfZOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906017; c=relaxed/simple;
	bh=dSjMWWPfUVnE8Sj+LOxuroqCbCjJLJ7mYSLXFIhPwCk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mx6sdIGPl7lqZbM0RcNZrqU1sxc5l5Dy4UlzDqxW6xQ/RNDRmurT1W0wQpYdBeWmW18CHeXeOX7lYe9S+yrc8BBoIM2laQxVNoVKIx15j9I7H5tUMljGG0WW/pdOGFKjLAQQVpXKxvLjRaBgPHQhyWSwtZgzjRI4VPI5hhi8ewE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4jD1DO/I; arc=fail smtp.client-ip=52.101.62.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGRE9WJsCrVAURpvFqPDUJo0Q14INpyFjwL3h68zmkcQ6ZsQyZguwVYWsPppK9vIk9vK8KwOUvOWm3woVxW/OKKohulQtuRX4tnwxftQS7OS7K1m6FPndlnIUNc68gTP7mTXAIWxIw+lk91YSesF7+LYn++JTqv4b9YjTCFZX5PniFXyoBy6dLuGSA6X92W4cEUpcg+LBHU6AtpPAlwojb4fkLFaUVpGwM6hZ3ahRhiLxkyfncInW3Hm1d5Wm3ZRIIryQFEqICTdnmxuP+runrt5bRI/xsuCWCE9f7LaFdp3HhYlfVgrCxj5XDjD2zHAfds0ROipvCTTyA96L4B1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqH4IhjyG9WktJD2frgrnrCo32d9nmyy3+oB8GonFL0=;
 b=u7Vb94joHT/21iBkGagILYH0/7E/ZFl81K4nyGSbocgsfhDybaamlmb45HRQC2aKz2XQfUkv+UcvF7eD0v23Ckci5Wsb59+y6D7BaTLszWz0ivt0hXMBKg38OlSgRxDRD8HomQkPw4CW3shS6OF6STzQ/KksjU5b4pnemGWE2Y2DZSxyAmNvO5MSKZUhKxuo8N+q2RPmhCrwWKdK6xIzPa8HtjlPngaV/2/v+HXwTlKf1KWLt2fy+KaZPP180F/U/OutYbCxurRxE9YclVDx/UWj0okFzqmHL3aYzuOdoxibxYmf13C9KBSxdrAwFYrR8n4WGsYqNdT0HrNypQngrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqH4IhjyG9WktJD2frgrnrCo32d9nmyy3+oB8GonFL0=;
 b=4jD1DO/IOrVI+cCHojPR5zgGUr8hYe0qUKI9d0W2qbhV8ABqhMejU5uyIgk7uqbQmlbE0t4NSHCM4v9VEUXyCesFj0atADQ+ElXfc8HDsC6v+0YLtdzr2vgBr1dH4FtffuW3qcqvGup+F3cBp2fsuHHpah5IwjsyHgm4nf2SnR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9091.namprd12.prod.outlook.com (2603:10b6:806:395::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 14:46:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 14:46:53 +0000
Message-ID: <5bc3c25f-476c-4402-b077-5731ebafc123@amd.com>
Date: Mon, 4 May 2026 16:46:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf/dma_fence_array: remove unused functionality
 v3
To: Tvrtko Ursulin <tursulin@ursulin.net>, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260422103012.1647-1-christian.koenig@amd.com>
 <096a34ce-fb73-4d56-81b4-aa6a0342c322@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <096a34ce-fb73-4d56-81b4-aa6a0342c322@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:408:ee::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: 9efab508-d226-43cf-d00c-08dea9ebfaea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PbLO9aKH3+Yf2AA3Cv1ZeLlhl+kAB36g0doBW2zgksR8PwGedRAFno/AVzBF5UCof6v6+TTkQE4fm4mxrJaev84aIdIGFD5r27ZT0fG8XwD3GHeTYGd1ORHgv4GOGx04UFN0Ba0nmkYyYYbW2Y1cwd7OburbzPpCFkq7Fm5lRIAJWwBhtnjdvWyQlzZ9A+BnVhlBFbay2jk0v2CT0e6RcauLjF/fWXWDv5CkwaWv/w7Ib6D8hgZv5h8UiJ6ceMrNu8qeBKGDORbVNtuf2NaqPaSpKYvSH2s9z+2xVgguZvYfQa3HXmfVf75WS4EjvUAUkfaubzP3s++dRPSLDgGZa0q76967+p3AOJZVN7I640Um73TVOvE+7g5BrKZkVN/jWONkLWkwhDhYYlQfFfBe/VsUE052zAqL/mmOKSTZXL4/B5/fCwBcKgWYBTXmqUjjkkG49WkbFdtmnL7PNYfzEmTjnPyO2lPtTIwZaoucyVxPB5cdTHkUCuz/7vxntnmNr7t20+6jfht5l5VAOPXC7/SH1LEns9ofE9IsvRAZQvn8i1IKeX3uExSC8u9DHpvLigqk4nXvlYaY/ghxjXzPMETpHDajjFwNkK8SoWj92SNgsRuPpIvn3/JxbS9Pp1kMSqzbovdHYBB4JU9rZGUxukwrQkT47PgF0pevO4g5Jg775fAJQVTwpDiwnF1vzPa5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0l0UnNneWc0R0tGR1FHQnVkVTgzRkNsOEZxTlVzWU1UOXBwQ21SQyttQ1ln?=
 =?utf-8?B?OUxidXNoQ3FIQUdSUkxRL1dqTFhLVUppM21oMWQrUHp0cVd0TitYQXI0d3VU?=
 =?utf-8?B?MTJ5eUZ5VGxWbkU3bkVKbkVXYWRLRkdNQXBWalN0Qno3RTNtWFQ3RnVJTVFO?=
 =?utf-8?B?cFYxbVh3a0hWTktoWUYzTWxlOFFnMjVMNXBYUVFaL1g4YURyU0d2SmxrYksr?=
 =?utf-8?B?Tm9NMnJSQlJCS0lEZUtsc0VtcXI4aU4rVGpBdXpWU0crOXJrWWE3eUJ2N29o?=
 =?utf-8?B?OERTVi8yNkdUWUh5a0srRnBMVlZhNFFBYUJRNWtOcjJ2VnFQcFJNMERISFZV?=
 =?utf-8?B?RW9tU2N5YjF5VFF6WnFmSTRxdWhYaEVsS3RHbkpIWmQ0RW5IazZwdjdPNWI4?=
 =?utf-8?B?ZDFKS0V0dGR1cHpGNEVsVXQwNGltc3lXT3RjSlhJUmFDeU8zZkIvRTY1cmww?=
 =?utf-8?B?YW9ycndvMEpBVzd1ZDV6U0F6UFBFREVKQ0ZLNkJUeEdxQ2lnckJwSXNDODgx?=
 =?utf-8?B?N0R1ZEwvckprMlVIOUNwcnQxMS9xNHJWTElUZEc5NmtxQzYxZXhLZWNMU2JR?=
 =?utf-8?B?bWpUZ21RODhjdDQwZ1UzM1RTWnNVdW82NktNR29CUG0wVjhjaFYxQjMvL0V0?=
 =?utf-8?B?VGRVdjEyaFZhQmkrS090VHpIK2NTdVhmRnM0eEM1d0tlWmlYUXV1MU9zelZE?=
 =?utf-8?B?R2s4ZUZzZzV0blBXQzVZN2MyNGkvbGhuZWJta2ZKSzhrME5HRytZckF1OEYx?=
 =?utf-8?B?S0dUZkVyeUVXTjBWbEswYzVUQVc1Q2NJTmtwU3RrUG1USHBIWm9mTmNDU1NO?=
 =?utf-8?B?WHh5bHlDK2kwbGdXYzV6cDY5N1BxQzFYdmgxb0Y1K3ZjRTJmeGhZUitrSUhK?=
 =?utf-8?B?LzN6aGs1RnNTS0ZpY2R5RWZzQ3l0RkN4NmdmNVZPTjJNUzVnZE1OeXNxZGJt?=
 =?utf-8?B?UitKd3YrckdCN09qTzZpRlp6SmUrSUxIMHRsb2RHSWMzZ2tTSXh5SXZ1YVlk?=
 =?utf-8?B?NkdFWGFwL1JacHJ2REI2VzJWNFh0azlYcWZGbVZpbVdnQWQ0anJNSXF1WWJS?=
 =?utf-8?B?NmxXY2hlbzhibUNIYW9MTGVpeE8rM2lFTnZaLzF1SXRZZ21SS3FwUEJKUHdF?=
 =?utf-8?B?K1BiRVhsMTFXeXFPamoyYUVQVzJWVzZVMmxnTWMxMWlHSUN1MDZHbHplWkhm?=
 =?utf-8?B?Y21QaW5zMFdyRUIrY081Q1gvMjBPTURlTFk5L1pUYkFFaDB2R29JcmF2cEds?=
 =?utf-8?B?bFljeG5zamZKanFHZno2T2Zva1dnY2oxbkVIdjFKY29Ha0JNT01DSTZqRVVM?=
 =?utf-8?B?QjNOU2dMY0U5ckM3YlR6TUY5OUczRkJ2dVdMU0tHd2ZUL0VCREdCemNnK3Nt?=
 =?utf-8?B?clh0RVdZU0ZWenBGb21saUdBVDYzK2xIOHAwSEdCUzROZ3RKMHZFYnltWVZP?=
 =?utf-8?B?L3ZFWE16TzQwV0VzTWpOSkxsLzJtV1UzVVduT0RTRDVsZjB3emVyRlBEbDV3?=
 =?utf-8?B?dVlRaWthVjU1ZFlDcGUrbzdkZy9UalVvNHlvWThhbEZhNGpBMmt3SVRaT0wz?=
 =?utf-8?B?NHcyOGMzVEJrNFpPMnJTenlEQ0tRNk9ER1VwNmptYmRXbW1IZlV4bkl0bkli?=
 =?utf-8?B?TGxsZ3l3NWNOa0czNk1LNFpDRHU2SE42b1BJOGIyN2c3QndDbjNDd0J4T1hE?=
 =?utf-8?B?QmhSVUhQSW1PZlQxTnhiREZkaGoyYURTZXcxMUNrc1Q2dXF6b3VqS0o4UVA3?=
 =?utf-8?B?NmJGUFdDcGVkT0h4WlJSUEJabmNMTUp3WGcwYVBpS3h1SzM3ekxrZUFadHB0?=
 =?utf-8?B?K3VoTWl6T09zcFIwd0RSdlpxWVQyUU83N2VwRnZPdWtIUXh4dTNYVDh4YVFp?=
 =?utf-8?B?WSsra3JwbVJickJTVGhVdHArbUgzOXNSS2Z1QUZmL3FQTlpodkp5dkNpRjV5?=
 =?utf-8?B?akdIbTkxUm01dEtMUXlDeHhMZ3NuQmVSSnhtTG04WnUxWkcvN0IyTjAwWEQ0?=
 =?utf-8?B?OUxpSU93V2t3bkhhNHg4QnNucUJmODVVTHJjdEFEOXBqQlJ4bDhFL1RyRnJn?=
 =?utf-8?B?QTgyQXZobXBqN09vNE1vdXFHa3IyWkhwelRJQ2xTZXNoK2g5U056SDBTNDMz?=
 =?utf-8?B?UUdJejJac09HMWN2OG1QeWtDL253TUdvbWw3YVY4TExOZWxjcHc3OFI2SURM?=
 =?utf-8?B?UStXK0o3Z01LcHQrcUhCSlh1YmNmMGdwazZRKzV5YU1xQXlxRUJqOXpFNm9H?=
 =?utf-8?B?NGd5aEdtZUdPWkNOU0E0a0c0QTZ6TFAxSmJONnhSWERkNzF2UFk0TjBTL2pl?=
 =?utf-8?Q?gyQwx3vCPpcfzOtox/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efab508-d226-43cf-d00c-08dea9ebfaea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 14:46:52.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxTQDw8vz1PpaMAy8axdseTz15nyUED5Nct8NPlcfbB0GOk9P/AD8XL2hl05Jj+G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9091
X-Rspamd-Queue-Id: C2B2E4C043F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60308-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,igalia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On 4/22/26 12:49, Tvrtko Ursulin wrote:
> 
> On 22/04/2026 11:30, Christian König wrote:
...
>>   diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 56e2db50bb36..8f472911469d 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3370,7 +3370,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>>           goto err_trace;
>>       }
>>   -    cf = dma_fence_array_alloc(n_fence);
>> +    cf = dma_fence_array_alloc();
> 
> Patch splitting mistake here.

Ah, thanks for pointing this out.

> The rest LGTM. So with this hunk dropped:
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

I double checked the patch once more, compile tested it and then pushed the result.

Thanks,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>       if (!cf) {
>>           fence = ERR_PTR(-ENOMEM);
>>           goto err_out;
>> @@ -3414,7 +3414,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>>         xe_assert(vm->xe, current_fence == n_fence);
>>       dma_fence_array_init(cf, n_fence, fences, dma_fence_context_alloc(1),
>> -                 1, false);
>> +                 1);
>>       fence = &cf->base;
>>         for_each_tile(tile, vm->xe, id) {
>> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
>> index 370b3d2bba37..1b1d87579c38 100644
>> --- a/include/linux/dma-fence-array.h
>> +++ b/include/linux/dma-fence-array.h
>> @@ -81,13 +81,11 @@ to_dma_fence_array(struct dma_fence *fence)
>>   struct dma_fence_array *dma_fence_array_alloc(int num_fences);
>>   void dma_fence_array_init(struct dma_fence_array *array,
>>                 int num_fences, struct dma_fence **fences,
>> -              u64 context, unsigned seqno,
>> -              bool signal_on_any);
>> +              u64 context, unsigned seqno);
>>     struct dma_fence_array *dma_fence_array_create(int num_fences,
>>                              struct dma_fence **fences,
>> -                           u64 context, unsigned seqno,
>> -                           bool signal_on_any);
>> +                           u64 context, unsigned seqno);
>>     bool dma_fence_match_context(struct dma_fence *fence, u64 context);
>>   
> 


