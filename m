Return-Path: <linux-media+bounces-65269-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J/5wFVscNWqfnAYAu9opvQ
	(envelope-from <linux-media+bounces-65269-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:39:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A75F46A543C
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:39:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=0T5qQI2z;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65269-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65269-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D86093039CA4
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E857A375ADC;
	Fri, 19 Jun 2026 10:39:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DF0367B85;
	Fri, 19 Jun 2026 10:39:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865544; cv=fail; b=V3yrjawInkYFWd6C1uCqoih7XcLeh7V4UrFPll9oyTlyPajCVMA9h6nHgSVbqiw0sqLV6mBJ8MrX12blUscvPqfmdBOzLj8noPIdGIkmPq84TncN7iAVUbAIRz2Cej8do0bwpZO29V3pYuljZBkwRjAO0fvvoEJI1TOhJsQ9cqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865544; c=relaxed/simple;
	bh=i8x+5h8sACwQwRMbc6aGIwJjlFgPBVjVM3pSWePKfio=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fDkdh2xDc3mHw6VVeFRPxUehrg00cYMRIRGafgcY5kcD4YwzZZTYIYcBzz0bAwBIqmkGPpHy2WlKtN/qUdaSfDFojNkFbaC31H75l9JS+Y4EMpf3nt6FSJOfIvjfI1j+ayWZuBMUZHqTe7AW7lRr3ap99R//h7G2janoinlPcYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0T5qQI2z; arc=fail smtp.client-ip=52.101.85.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czYXy8kd75IooKG+nBZC3RkAw7Hfnnv050g1CoTxyQ1bN4t0Y++9aZGh9IMqHGS4/4h6RfBDrPHeE5mtMmbp0cprUUCl3+lcyakbGtrsDLlSM0VLDAi3Sg0Q9sNw/1KG4a85qxu1OeBafik8ULD6lN09XJROAhS2bnvfncZy3j9p45pWcqmW2tFM1DICgwe5CzENQIG2a+/qY7hFmzH/N1TuASxj/YlR6fArz4PPA/gWfUqNXzFa/njOeu3LLGcuYzghSd71+cqSLuzXX1geMZRgsuPDqWOoK6q+fonZM2O/tuu8h14ZVe94x7NrwYjkoIbXfgDhQHLmYd3Iv9Ktdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUbf0pFxQyBXR81tHl8xNKe1rr/LLfE9Idzo2+AoHI8=;
 b=DiBWYu8HJkWa9WSgSH1NRwNL2nb89syEW6I+8/8r/gR3JRQotoum7taFoAXqa6z/1oHCPhmLIeWAeGCzFAxRIIiYl59iCn5kYZCpOoRxkSj8YLNKZMTOoaI9mVNYuEiXhbqtz5WLxAjXnqO4j+bfYLzVSddEd4lWbqpcVmA3OZqumpLaxr04xPS3VUNRFKBdhkkFhhvJ2Clb4nMkX5tM9FdDF0GeX0fTwfEbgFSPa8X7n91Z0Xon26nLsF/Zm6dI4jvB8PUHahFv4CRru+VqBKQd9kljBE27h00pfJW0ts18XB4VWmcBjTn0BxO5P2uEnpH2FJwrwECzZEbzXi+IaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUbf0pFxQyBXR81tHl8xNKe1rr/LLfE9Idzo2+AoHI8=;
 b=0T5qQI2zeeP1kPMwqIdh1H+SW6h0BUwjGkeHRgoC3WZYZNVytFGDRlmyr0BXyk9WaIRrBsRp9YnfRYKCS3Go7TuDVkxRIJLxbreDEr0p2ciNenUKAK22Avrdt7Cz1FKKeqNbdTjyKSqHoMwS6+XqiXacv088ZeIfQdMoQ3xOrtA=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PPFC908D89D1.namprd12.prod.outlook.com (2603:10b6:61f:fc00::623) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 10:38:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 10:38:59 +0000
Message-ID: <9503e60a-5e8a-40f3-b5cf-1d8d0f71c9a5@amd.com>
Date: Fri, 19 Jun 2026 12:38:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] base: Remove unused DMA_FENCE_TRACE Kconfig symbol
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: driver-core@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <16fb40ded203d1e2b72f4eeecad3fd0c0d23ad6f.1781863296.git.geert@linux-m68k.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <16fb40ded203d1e2b72f4eeecad3fd0c0d23ad6f.1781863296.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0391.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PPFC908D89D1:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ddc65a3-9eab-411e-8dc5-08decdeef8f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|376014|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	U8OKUU6BSX6roYjwBhWXfBORMlOt5O105zr/C+z4Odw3LZhkVNiV5EMUaD5Lq2rU3jEH9fJWfLtXFYDM9Fir3QppSg9FkPViQqAm3yQZgsqwNfmPQBx2gdA21UInAvk9rBeoG1dIDFTnKPzSRv0uwchFj0t+lqEPA9vQ/tvPmK0Pqum+n7IEmo1R1dp2Ac3GSBbeqCWqgijW+KuPTT44rca+ihBJqfpJtItIzbk8oUSqGav/rnlr1To2xKjwfst+TQlq9maCj3KisO6/VyHlMSM0r8J831Z3+dhvL9KFcvmNzCrWqDlabk54dd1kOhUelg/YMQt89P+r0BCXLWaONtF1swzSzmcwzJO4j7yCdh2Vwc2E8dEr/znbznZOB49KXE59TfOpSp49j+61hZoBez3FdJiIEAB5dD+hmQccxDQZJ5vbR4i5EyKbsX29mQhgcRaAZ89UzB/zJWOJsXYOesGuHV1jngz88IGfFn5Iqyp9DJlpsImZkJB3l6WiLUVImW4cWoEfLFOzBRf2YHTAEkTYELyU3/09aELVvejo3/dbl5uBdETWc9iVFW0T2Ybv6zjbHn7fwtKM4nvguwwh7iym4iVmFvra8aAsu0QipW9lFOs5bgajn7p3kX0pOrfFqoc4wOMpFl3eWFo8keSs/gT6JKEwky7l9Plk7jfBw0g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVpLYVUxTjRNalErRWp4Nmh5OWJTTjZvWFkyMVRrSHJPU045MkhIZGt4UTgr?=
 =?utf-8?B?cnVhZzc3V3BiL2RBK25RbUc4QndRT0ExM2hmYS9Pa3c5R0NPZ2V0ZzVGMFdn?=
 =?utf-8?B?NjUvR3NWaHVXYk9QdXpKOFNpYkZkWlkrVUJxUllkOEtOWG9ITDV6RVpNZTRL?=
 =?utf-8?B?M241c2tWNE9MeWhMQXg0ZWNITE9rUjVBVjZzR3czam1jcjY0dUEyemZkRjk2?=
 =?utf-8?B?L2lSUFFCTVA0MU02OEg0YkFmanc2U1QrbFdpeHJDRjRiVzRiTEZ5MkpVTHdH?=
 =?utf-8?B?U0Izc2xqdE4vTzhXcmJpTzVHWkRBTmVTS2k1OXZyTmdzT1JBV2JhWWg4S3hF?=
 =?utf-8?B?V05XMEpBOWFRaGp6WGZYeFA3YU1tODRnQ2taRFcxTjFoa1p3YU13NkUxZUZW?=
 =?utf-8?B?dkxBOXdGNDJYb1YzWnc2Nm9sSGxKc2s3OVo4OE1JbENTOEVORjlUckUveGQz?=
 =?utf-8?B?eUlTd1dxa2djZllWY092dHdEOUFZVnRXbkJyN3VpdGpDTVB1cUpiV0t3NHA1?=
 =?utf-8?B?bktHaDg2TDhoQm5WRUIyTlFzL2JlRytLNjFlMGgzMlZCNWJGOUNERzZQYTBz?=
 =?utf-8?B?V2F0Ry9GQ2VtcHQvZ0xCYUpueTdmWXIwU3hReFpWVkZ1MEp1akZidXNnbG43?=
 =?utf-8?B?dXpqRmZuWWxlZjRFNi9keDhTbU5KQ2hjMitaZXpYUzR4ajZhU21nNTI5a0xq?=
 =?utf-8?B?dmhiTExHWWdmL1E3U092NWNhS0h4Y0dCMi9PQU5aUW5HOXpxNUJtR2xsdU0v?=
 =?utf-8?B?N0Fab1JMa3ZiNmpNU1BkZE9NaWpGZElBZkRMYzJvNXhES3hyTGxCU3A0dTF2?=
 =?utf-8?B?a0tkZ1lrMHlVclhaTmExTzIrVVB3TlJLODU0M0xTaWlKL2Q2YlRjbkdHVlor?=
 =?utf-8?B?dmhMOWk3b09rTGxYTTRJLzY0VURBa2JiWnBwRVV3S3laUUlEc3NTMy9vazVT?=
 =?utf-8?B?NTUyckRQSXowNFVKZ3podThmNlQxcCtwUzl4dlZLRUlGN1FmVUVZTGVNR3RX?=
 =?utf-8?B?eW1oL1pyTFZ3VW11aW51VElla2JYVjl1UHZrSmdsbytFbHJWdTFnblB2bW5u?=
 =?utf-8?B?ZVhxcVkxM3l0Y1BPTGprVWxlRlFRekk5bVFscjMxaHJWN0FZS1ZQZ04zVkpk?=
 =?utf-8?B?bGlvbmR2Z1dJczk2Ty9WaWJBKyt0Y0NpMTUrUDBQT0hJV3dHQVcwYTh6aUF4?=
 =?utf-8?B?WkFhenk1RDl4V3A2VERKWGZ3SldTVC9wRkVyUWJxeEpza1c1UWowcjFpVnVK?=
 =?utf-8?B?Nit1SUN5elpXT2NWMmgzb3VuTFVBbHY4Sml3eDR2RVp5WlhlOE9UY25IQ0xE?=
 =?utf-8?B?UmxXZldXbWl6RVFaL0t5cFVIWXhRbUV3QlAwUWZmbUhic3l1Y1FlSjdwOTNw?=
 =?utf-8?B?aCthWGFNdnVRMnVJZnI2cExxTkpCY2VOVllNVG1ITE1XRTZ0VFlldmUzemdm?=
 =?utf-8?B?WUdDVVYvRHpyOUt3dmtORCtKZ21wd0IvRUVPM20yMXZWcTZlSFdPdHJ3aTJx?=
 =?utf-8?B?ZHY0REJENUs1SWt2QUNtT29YdCtVR3JWUTBpY1Z5b1ZZVGJWRDJwSUNURWVW?=
 =?utf-8?B?czZoVVRCalAzRmNIanRSLytKMXhpcHd5cEpLblU4QUtaZHkyWXUrbkI5c0FP?=
 =?utf-8?B?eHM1czFYMDZFNWVIZ0dlVTZWNU8xTEVGc3FPOE9NZ3l2L1hPNkxMS2JnQ3RR?=
 =?utf-8?B?clZQR1haSDB2c29BK2M4TE5TcDczR0QwQ0lKTFNpM1UxMktta1pIUlZOblJO?=
 =?utf-8?B?TU5OWFlMUjdXeXRXMGZOc0NmdWFoVkd1R0xiQmJseDhoNDB5aGoyUVM2eDYy?=
 =?utf-8?B?c0txWDZSRitMQjVEZlJMbndBKzNCQ0xERFUrVlRYUXBXY0VMQVcrY1N5UHNt?=
 =?utf-8?B?L09rejdyZ1NKVDJNSTJ2a3NQZnNqa0wxMHZaNHJyRGd1T3pPaCtNZms5OTZD?=
 =?utf-8?B?ZlNmNkNuS1JLckNOa0xSdkdJcVRYekNzcTZyVk1JYUlIcVp4ZHJWeHMxTllV?=
 =?utf-8?B?THlDZHlDYWNiTW1uSUFaV3Z0SW1XcUtwWWFjb1JHcmMwNFIxbnJYWUV2QzlW?=
 =?utf-8?B?RDU1M3lEZE9zUlhpeUp3ZmpZeDVxN2szeXRaN2V5bnczSzloV0g4TUxrelRi?=
 =?utf-8?B?cFl5c1FBTFJUNlloTXZhcHRYbDlJUHRwNGx2WGFETFhNZWl6Ty9QeEhRdVBw?=
 =?utf-8?B?MDlBZ1RVdDRadTJiRkZxWk9QdXlWNGNmaHZ0clZVNThsTmlzVm55UzN3b01w?=
 =?utf-8?B?S081djRCOEl1c3A3OVh3WXlDdUxkUllyRVVRK3hzOERGZDdab1czZ1Rkc2Ry?=
 =?utf-8?Q?79pW2RR/PO0x6deUEB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddc65a3-9eab-411e-8dc5-08decdeef8f5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:38:59.7512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48p2G3ia638o34E+NfJ+8IP+NfsHoiNcxVvSsZ3+hawhVT/m+S9XcBaWr8ILc89P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC908D89D1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65269-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:driver-core@lists.linux.dev,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A75F46A543C

On 6/19/26 12:03, Geert Uytterhoeven wrote:
> Commit d72277b6c37db66b ("dma-buf: nuke DMA_FENCE_TRACE macros v2") in
> v5.16 removed all users of DMA_FENCE_TRACE on the premise that the
> Kconfig symbol did not exist.  Apparently one failed to notice the
> symbol did exist since almost five years before: it was renamed from
> FENCE_TRACE to DMA_FENCE_TRACE in commit f54d1867005c3323 ("dma-buf:
> Rename struct fence to dma_fence") in v4.10.
> 
> Time passed by, so remove the Kconfig symbol, as no one seems to have
> missed the functionality.

Yeah that functionality should be fully covered by trace points.

> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

Do you have commit right to drm-misc-next to push this?

Thanks,
Christian.

> ---
>  drivers/base/Kconfig | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index f7d385cbd3ba4b2b..43f20ca95a2a6ba9 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -222,15 +222,6 @@ config DMA_SHARED_BUFFER
>  	  APIs extension; the file's descriptor can then be passed on to other
>  	  driver.
>  
> -config DMA_FENCE_TRACE
> -	bool "Enable verbose DMA_FENCE_TRACE messages"
> -	depends on DMA_SHARED_BUFFER
> -	help
> -	  Enable the DMA_FENCE_TRACE printks. This will add extra
> -	  spam to the console log, but will make it easier to diagnose
> -	  lockup related problems for dma-buffers shared across multiple
> -	  devices.
> -
>  config GENERIC_ARCH_TOPOLOGY
>  	bool
>  	help


