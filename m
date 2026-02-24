Return-Path: <linux-media+bounces-53272-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB/5OmtfnWmxOgQAu9opvQ
	(envelope-from <linux-media+bounces-53272-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 09:20:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AF71838A8
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 09:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1544F3020FE3
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911B9366805;
	Tue, 24 Feb 2026 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BNjd8NAn"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A30136656E
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 08:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771921240; cv=fail; b=AOoaPCtwjzxEhW8yb+SzKnPatVj0S2ykrbTJm05jjgbEzASt+9YomSbbaKaAW+anr8EzPLzl+dP7qURAxdyo7Ljokmq+Tyze3HSzQ5ZN1dgDJmE9fUMKamS400QxblapvyfepFon2deZsRMBkmwNbydJQuZXnmobk04kNTlJerc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771921240; c=relaxed/simple;
	bh=+2CsAanNrr2/2k6hAxZKaedTVwq42CYJ9bFQbRGIGwc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cyhf23ySmEHs9TFDhBMe0ALOexVwwNfhSYH47mEK282strn5ot5D344fktZsJSrD4EtmmcPexnJWWRDVSwC/kfj3X6FDzuBnzk+zA2x6HZwpUM0K81cpF5ZHGPNw+Rabk2l/+LW2q4+GtjSeWL5It5Axb7jizLtwTJr/Uyjj/S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BNjd8NAn; arc=fail smtp.client-ip=52.101.43.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TldShD09Djs6g7/53IJ0nct3FV/7PZ+AlS1yaY75avsa+0aHDqu6x0XCVhdlW9r93HX0Twi8kMye1leCl1iTNjWOoAFofrbKij+2Pe4BrzMxZzD907WYtN3iB99TylF1LEFxpPRrfRU962RdvtQ0/wWRDM4KEZnTnNQHMf5KyGigHk/1j5ylqO5SD7qJtkIT4Jc6T7Nu75ZNSyBCftIz5NC46ZBkzdmc/ZsawdPGYyiVgHS+u6nbNNLKHn2HIFrwq7HoYi/gggw6VcYbkwIAJ10jw1LPDIm4182KCKrUE7+aEBoyjhzQzW7pr6Pp47C+6kH0au82EX+07HWCXX9IFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sN4OYYRteyuSMn3+E6hfShDeU8QsSaiIkyNMFBABfOs=;
 b=R+qrzlJwv1JtWXFavPfFncjNV3DoiZ+kiTq2s/8RPjbCXzmqycbAfC6pLaWe5EWuK5N0aB2HML4XBtcboO+LF/5L1jZsj6MBIpvlAnvl/q0qd1FbpvtM+rlbqQuNPIswYpqM/pXBix6CuCy0DRn9WZM6itlxT74JBsqrXVt8k134R6HlkN2ISLMLKHq+3XwLN+Qhfn0RUs/w88U2pMtk3hXPJuhyLiYB/g9WL0YLKa1sDjY4YLuM4ABPZRrdNlRCON4RS+un7V5EDW7hbNFeJE1SJg0plfY2adhLyyFfh4Ym4k44ZnTv/AW9iJoq0niH9ACRIDSaHwWqaIVnvNAFBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sN4OYYRteyuSMn3+E6hfShDeU8QsSaiIkyNMFBABfOs=;
 b=BNjd8NAn+mR30vRsjb+9hW2+HQWfVjfT40svC7PCwhJAI2kB79+ctCji81i0WBZBw9wZpQcF0WkVkQ7s14CbW9746Lfr8bU2bl4AcXApmSUfO95IiAt8aQS+OfbmikahtaSwZF1AIspYelcIiuz7+ACWymLHs5SeCp8m63NdKW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 08:20:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 08:20:25 +0000
Message-ID: <5d9daad3-a687-4116-99fc-b6c7d82fe5a9@amd.com>
Date: Tue, 24 Feb 2026 09:20:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/62] dma-buf: Handle all dma_resv_lock() errors
To: Bart Van Assche <bvanassche@acm.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20260223214950.2153735-1-bvanassche@acm.org>
 <20260223214950.2153735-7-bvanassche@acm.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260223214950.2153735-7-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a28735d-d917-4cc0-3475-08de737d8fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDRHNWF0UE8yTVZodGM1eU9CdGlpek1mNExVWlNiVWxmL21tWms3Y1kyUGJt?=
 =?utf-8?B?N1pZVi9BcVkwQ3pVUERrd3N5RzZXSFZjS2R2MDAzbDVONG43bW95VHB6WWNF?=
 =?utf-8?B?cE8rMjFXTHdOTElrNlgrUUhJTzhFRUkra1ZhelhidlBjVkdjM1pLUy8vT01x?=
 =?utf-8?B?OFYyWFVPS2ZKdU1QU3U4SzNPejVyekY3Ry9hNnpnYnRwVGZnS3hKelpaK1hB?=
 =?utf-8?B?ay83VXNOM0cwRWJoMUNTdWJyc2NxMlMyMHFaaUQ1WWVaSEU5d2xjRi9oakl0?=
 =?utf-8?B?Y05LSHh3MCt6S2t2SkpWZHhQSGlOT01QLzRmV0JpNENONjdGV0hvTUdKQzJ6?=
 =?utf-8?B?MWFWdnhjUm1tdmN4N25jSW11RXVDMWVhZlg2UVE5bDVpbkxab2c1ZWZaMW5K?=
 =?utf-8?B?UWs3MXhJNk9Ra29hRk54NEROMndKUmtIQTZPWjltTWhnNk1MU0R6TGUxcHl1?=
 =?utf-8?B?bnRsY1hGaXRCa3dYWTZJOXhIRzZWRS9COEswa3pSWlJEUytBSkYvRXBacUlP?=
 =?utf-8?B?OFpBdkdKdGwrZzM3REhoTkszQjZzMEpkc2NxeGs5NkVVNWtjaUl3aFZza29q?=
 =?utf-8?B?WUZQSWFJd2YrRDhiT3NCU3gyTGlhY3NqQzFNNEdEcUVTeml4ci93UmY0a0s1?=
 =?utf-8?B?aXVoaGFrbHBrWlpWZHhhYnNsb3FFbXg0OExFUWFCejIwcjNyV2Q0Q1NSWDJq?=
 =?utf-8?B?bU4yR3JrZzg5eVRvbnVGQ3pXSDVhN0RPU25xZTd0TUtrYjMwbEw3SFJPc3NN?=
 =?utf-8?B?QlAzMjJFTHc0MytIUUd1MThQdGNQdzE3bzV4RkN2Qkk3UW1XUHF2VXNQRUdq?=
 =?utf-8?B?V2tQQ0x5Qk5jRGpJWXI5YXNYemdCakx6QVFWMjJWd2RXdUtHZ3lxcEJmUC8y?=
 =?utf-8?B?MkkyR0Q3WkF4MkZuNDQ2eVJxZ3VybDIwa01OQzhtazFod1JmbTl4bXpaeEl6?=
 =?utf-8?B?eFdOUjZ0eE53N2NDZWhES21RLzRwaXNad2RiclhHeTdRby9WcHI5bGVmSWRv?=
 =?utf-8?B?NUNvWGdGdElRU0RsNE1iRitPdVYyZkgwZHhTTktCR01XNUgzNzQxQUhJeWI0?=
 =?utf-8?B?UlUrc2RWSGpHVWVpWkJIbjN3UVdrY3I0RlhlNzhiVFhMUVNjckJIZHIwajBK?=
 =?utf-8?B?OEs4WTJvZFZqZTRiTHlWa2FxSVl5ekg0WlJYc1haR3lYREdSeEZxek5ORWF2?=
 =?utf-8?B?N3A2YnBSUFM3QVk2bDhzbXJZSlgxVnErY2ZyMzJ6TzI0L2NQQUpSejdDTEJQ?=
 =?utf-8?B?UnoxQ2txTEZ1NXRMVTVvNERzUjNTejVXT3VwT29BdXQxR09IdGc2eU9ka09k?=
 =?utf-8?B?QUhSTlNTd2xPOC81QWExNXpwK3pFa00zT2kvWTRsa216SU8yZ2o3UGUxaXY5?=
 =?utf-8?B?ZUFGOTl2NmlEcGtTYmxCK1F3a3JsWldFUmh2MkpJakJkek5QNEtRazNFYWNk?=
 =?utf-8?B?dmxZYkk2SG96bmxJb3NyWWxlU3VKZWMrN3hOcU1XNUFieGR1TnlBaE9IdTRX?=
 =?utf-8?B?UTNxdi80TlV3eVhrUkp3ZXY0RDhJdE5TTFNXRHFNVk5jYnI2MTZKSDd5WHRD?=
 =?utf-8?B?OElDSVhBQThvSU1VcExOQkUwUTVUdkxZK3lnOXBkb0ZoNVZIdUNnZXBDZDkw?=
 =?utf-8?B?ZmJ6enlmemxjYlhzK2trbzFqb2VOYUVVUjl3QVFwQjZPTEVEWGJNWStjVHpN?=
 =?utf-8?B?OFhCRFdlcnprT2M1OWlKNTdkYksvMllBWkh1Y3JWQ2ptY3RjUldvUXZxZ0ts?=
 =?utf-8?B?N09JbWZJajdhRVhuWmNaejNEMXM2TTk2Q1VNVXRPT2xIakw5aWloN1N1SzlV?=
 =?utf-8?B?NkQ3QXZzWjgyYXhSd2tCdWhVUUZ1bER5VWY0N3BwWC9YR056YUt2Ym1VY2NC?=
 =?utf-8?B?TkRQV0pDZUZ2bFQ3eVdrcVNLUzBFRm5xaDdybzl6Ukp5WFhleVFMSDZvcElu?=
 =?utf-8?B?WEk0Qi9wNk1BNWtOME5EVEtJTmtQUGQ1RU9wNkRmNllQcGt2bUZvcFpoUzZ6?=
 =?utf-8?B?UnBMTlZWOVlhQlJDYXZHY3UrYzM2Q0xYYThmUWc3MWtNcGd5TThoUG9kZE1D?=
 =?utf-8?B?TW5sVHBUUzk4QkxMRTNBS0hLVWlBU3B0dWFpdEdRbjlVQ2RMTjdGcEZMajZ5?=
 =?utf-8?Q?8y08=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anEzMnRYaFdNTVlRdDQvc2pmcENiUkpoc0ZQRkhjM0RDNm15bnNsMmZITUxv?=
 =?utf-8?B?UWtwQjFyN3IzbnRTMjVnYWtoY0ovTXpmV3pvV1kwRVJxN3AwYU1DV3k1MU05?=
 =?utf-8?B?SkQrQm42b0dzYnBoSXNDdmxuZmt5dTBzcGhNTzJMeWttdGpqUXpqL2U0SkJv?=
 =?utf-8?B?S2M4dnRBWXpad3FTS05Lb21hV3o3ZnI2T0VrOXdKT1VhMGF2L2UrRVFnMGI1?=
 =?utf-8?B?VlE2RWl5RStZRk5aN2dRSXQ0N0Y0Y0Vtam1kTEY3Z2hFOUZiWDJWZkZITkZk?=
 =?utf-8?B?YllETUR4dk9EMG1YVHV1bmRwbjRnZFo5SGY1R3BVaENUeVE4NnRGcVlYU1hr?=
 =?utf-8?B?L2R5Wllwbng1NlpjYTBmOW9TWkwzL2ZreHlZTEtGZTcxZklTbHZWL01oMTk4?=
 =?utf-8?B?VEEwRTRXaVFqN2V6b2w0TDZMU0JHcWxPZTQ5VzZhbGdyVTY2eHRqQm5KS3Bu?=
 =?utf-8?B?eVVPdWNQb2JDanFHM3QrdVJvMWZIR25EaHZZRThJaGU3cXBSNVNGL2hjV0t3?=
 =?utf-8?B?TWZVNVpod0czakxrdFh3Ti96dVN5aWovUWxvTUJBOWFTdkptMGtuUTEyczNV?=
 =?utf-8?B?Wkt1dFF6dDMrdWRCd0VNY09uc3YxN0xtSDJ6Wm4xWjZ6OU9hUmd5VHdOQUlU?=
 =?utf-8?B?RlFOTTRETllqOFhvck10cU1hS0FxeXRxQmdWbmM5bUlwOVEyZU9pR09kcFpD?=
 =?utf-8?B?elVuM3c4aFZEVWIwcmpNWkpSSjd2M01QaEpFT3kxK3VWVWc5aVVDdFV3ZWRS?=
 =?utf-8?B?TEpacDhTUUlBbE5IekhsdENWL1QvZjM2bzQwcC9nQzg1YytjMElMV1RTZ2k1?=
 =?utf-8?B?VUdsaEc4OGw4VVRWdmVYVjNha29wUTVlZWk1UnFJUXA0eEo1QUh1WHB2ejUx?=
 =?utf-8?B?QzFoc2JVNXNwcEJzYWIrUERSYkVJeDRBODllUUR0Q3M5cXJ5dkRiR3hzQVRL?=
 =?utf-8?B?VzBUcU5RRjFabjBkbXpOZGs3WVZ4STU5YllwMDZaUWxwY29IdEtqY0hZblM1?=
 =?utf-8?B?OU90YXJKMEx6MkVvSjM5LzRQNmRQRnBYbU9ybDI4SzJFV1ExVWlnbHNWVjdF?=
 =?utf-8?B?cE94RGZWMWFkQndJN1QwSENPRE1keUpQbkc5alFOZEpBaWl6dGd4Vnd4QVZP?=
 =?utf-8?B?ajdmUDhzVlVqLzh0YTBHZFNweEhJanFDNWFNZ0dTcSs4TlNsTWtGemFaczBo?=
 =?utf-8?B?ZWNkVHN0cm9GNFlINEZJSmp3Yy9la0p4d3RnR3g3QTIza3QwTXZtWGhDVXZt?=
 =?utf-8?B?eDBtSHV1cVN2ZW9qRi9VM1pibHNLY0s5QWVaUTNFcm5JZGZzMXdSU05PNFpp?=
 =?utf-8?B?TDhDSGpPcW1xMWJGMjBnN0ZRdGZHeGlrb3Fyb2NjbHlldFVKNHdOdUh6SnlR?=
 =?utf-8?B?dUU2MVpQVGdxYThoWnA3SWx2OTE1NnFKaWJMVVBlaEFqUjZkTUhabzdDbkJ5?=
 =?utf-8?B?dkViQ3RXb0NvM1dmcXlMRmJrYXhsaXYzWFd5dklVaWcvTzNud1BIRnVFZkli?=
 =?utf-8?B?cWsvVG9hK3NzLzd0dVNFOXlGQ0M5aktSMTA1MzdNbGlvaDFmVUthUFF6NTFF?=
 =?utf-8?B?eGFKOUIvVm9rQnZJQVc2WE1XaVpPVHVWZEhNWjJpK3c4QVJvQ1ArVXJ0SUY1?=
 =?utf-8?B?REI4dzNvK29SN2NQakE5NGhnK24rS0FQb0UyanQ2RTZ5M3JWU0x0YVZMTHNn?=
 =?utf-8?B?VXdPUldTWFptOStsUlJ5cWYyNlB3eWZrZjFZMEFMT2FFbjVNaXdCaCtINC9Z?=
 =?utf-8?B?OEROMWNRTjlJbzdBVnZjbU9LdUhwRkQvTWRldHlkbUtudXVteHZtckpmL1Q5?=
 =?utf-8?B?amNYaXYvVk5MNDA1UEY5aExIeDU1ZHBCR2o4VFJGblIwT0NrL0JjRnN5dU5P?=
 =?utf-8?B?Skw4T2VNeExCNzYrOFp4Ri82aHRRa3NQNDBRQ1Z5VWtWbG0ydG1DZkJ3aGsy?=
 =?utf-8?B?YWtMRGl4ZmZzUHRQTW8xbjFwdjJlSUpITitsaXZVTEdXd1NydnVTYnZoOGhM?=
 =?utf-8?B?NEhJZGxuc3RFYjcrQ2FqdE54dXNWekNDYmRIeU9ObWxoN01NZmNOVS9tUStk?=
 =?utf-8?B?M3pGU2hvT3crM1I4YzJqSHlNN0hzTklWQzlKVnJKME1nZ3F6S2tKZzgvS3lV?=
 =?utf-8?B?c3hhQzduQnBZTzFIcTFuT2M4YUhObmlmU0lNN0hUbjZCcjBsSGpMcVB3QkFR?=
 =?utf-8?B?MHdaaWZycGpjK1JkNXFid0x5em1mWFI4Wmcwb1FmK0xKRVAySXdCR1cxQXF5?=
 =?utf-8?B?anNRZ3J6NkIxdC9jaUFQSHRVVC9tTTg4bVBTY0V0VzB4UjZkV3FUclZaVm5o?=
 =?utf-8?Q?IT/28XlzucEFAH6Mnd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a28735d-d917-4cc0-3475-08de737d8fdf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 08:20:25.6388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ib8lzlQ2rtgdRLfvkKGtNUlWtR4IfePHpjgaGSl6djUZYDRfqxNzdB4Nk1mO/hLG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TAGGED_FROM(0.00)[bounces-53272-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,acm.org:email]
X-Rspamd-Queue-Id: E5AF71838A8
X-Rspamd-Action: no action

On 2/23/26 22:48, Bart Van Assche wrote:
> Instead of assuming that dma_resv_lock() only returns 0 or -EDEADLK,
> handle all possible dma_resv_lock() return values. This patch prepares
> for enabling compile-time thread-safety analysis. This will cause the
> compiler to check whether all dma_resv_lock() return values are handled.
> 
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  drivers/dma-buf/dma-resv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index bea3e9858aca..b4710f730e9b 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -792,6 +792,8 @@ static int __init dma_resv_lockdep(void)
>         ret = dma_resv_lock(&obj, &ctx);
>         if (ret == -EDEADLK)
>                 dma_resv_lock_slow(&obj, &ctx);
> +       else if (ret)
> +               goto fini;

Mhm, that looks a bit questionable to me. Only checking for EDEADLK was intentional.

>         fs_reclaim_acquire(GFP_KERNEL);
>         /* for unmap_mapping_range on trylocked buffer objects in shrinkers */
>         i_mmap_lock_write(&mapping);
> @@ -805,12 +807,14 @@ static int __init dma_resv_lockdep(void)
>  #endif
>         fs_reclaim_release(GFP_KERNEL);
>         ww_mutex_unlock(&obj.lock);
> +
> +fini:
>         ww_acquire_fini(&ctx);
>         mmap_read_unlock(mm);
> 
>         mmput(mm);
> 

> -       return 0;
> +       return ret;

Oh! This is an *absolutely* clear NAK for that change.

This code here is to only improve debugging messages, so it's not problematic at all if it fails.

If I'm not completely mistaken if you return the error code the whole kernel would fail to boot *and* we have a random error injection feature for testing which makes it returning an error randomly!

So this change here would result in randomly not booting kernels and that is something we seriously can't do :)

We could add code which prints and error if ret is something else than 0 or EDEADLK, but that case is already covered by the selftests and so would be 100% dead code.

Why exactly do you need that? Would a code comment explaining the background be helpful?

Regards,
Christian.

>  }
>  subsys_initcall(dma_resv_lockdep);
>  #endif


