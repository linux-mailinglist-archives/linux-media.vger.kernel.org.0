Return-Path: <linux-media+bounces-49043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 787C6CCA6E9
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 07:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE91D3018315
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 06:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34C231AF1D;
	Thu, 18 Dec 2025 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c/d3FA1P"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D2F21C17D
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 06:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766038772; cv=fail; b=U/Mhelhh74z7zF0SyjQibj2H/zjdt7sBu4L+AP/WkJZz9zk/wCKj/8VO/icWnUGp3+uvbRA9pVTmg1pit4Cy1Ae7pFOzylWle99RvSAJH17ZJg0d6LoJRGeUM/lEsK0nu2mpn/rB3IPqWe4lpQJhqqvDk5Ei4b9MwXb4uLKh5MM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766038772; c=relaxed/simple;
	bh=OT9yOKhHZqntoRFsSR+Bpj9wC9UU5N1EqDvPPDZQAQM=;
	h=Message-ID:Date:From:Subject:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dNq/vSfVhKnMfHGEt9vtbDzqoxXy9eibzl/qP91L9XDm1i+h15iobcrBf9m2hqqNXcnQxH256Pk1yZT28zmkXH7dLIDgaxIgPsXVOxNt3V1wCKSRMqRLzSIwyJgLxsppbNcuXoQpCzijm2D2Y3yXcXbFKPHaIVYO/yj2kx9sUCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c/d3FA1P; arc=fail smtp.client-ip=40.107.209.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BF93e7Doq9rxJZmuAHQXXFu4LSL+ndkwxOx+PmapEQLrVfqNtuCmTPE7BCF/VnJJ8PfRSkkTXINfsS4iOlL70detk0fNuGzMUs9KOYi2H9ABVhSs7mEFdsm/aDiLXzHv242XSDopbu2sHvjZqxS3Cu+oPJhdLKZkBXYzNeFGYf3twMFLiea8od6P3x7Pnpm+7eFkTwf00/uheqXjQ/1IzyuzII4PuLTyfovtf7v3V8PDaqtryVMEOnpU9DCXW0RfztVhWkjK80nrHCqrYfYzlJf11FHqlXzWSwN9yUpIRCaSpQSt0EuRccjqYCEov5qr0bizKDqOrbluL0+jhffQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFRySHD3crha6LadWiZZlrxFa3pH1vpl1zqboVUSNyE=;
 b=XhiswHHqocg2lHB/gJDr2Sg1b4BS4FIZRdR9xJPSRloS2UDJr28dWHpsruQAUswi9DzXVeOQvTC2MeCU6dAPzRx37xhZlbAP2rPhg8kXHs0l9j15nTCES7wJmrX3QYxIvAF8AwNa0sDEPamSXbB6kNGMd2jvVPnZOnEHIVs2o7USfos31kxyhz79M3N8vXqbeCyAsospQUWZ9jeuk9qjszNRdNZDEhj1QFdL632JQkcltE8Z87P9tRPRRh8e5at71rdd3/+BnnrKWxFs4zVshagKpkdwbKVkgtos45FQpqkMJ1ufolnCWRU22YbmAembolxhqWXLL/QEKyZs+KxWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFRySHD3crha6LadWiZZlrxFa3pH1vpl1zqboVUSNyE=;
 b=c/d3FA1Pga7zt/wODobbHQAByMLk6KoESQVc1szKyDrDdbkULzZq6Nk8s0W+Nyb8yDW49dTdh4j/7ARenAemg9/jp4LQxHHVasqsGEwJwLIfIRbgdLqhs8E/5RXGyz6RfTgQzZ38wV45a2YQN4jilBAD/VI/jOK4NRt50U+5eS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CH2PR12MB4229.namprd12.prod.outlook.com (2603:10b6:610:a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 06:03:59 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 06:03:59 +0000
Message-ID: <79d3f1f3-f458-4d76-b099-8af5c5934c98@amd.com>
Date: Thu, 18 Dec 2025 14:03:55 +0800
User-Agent: Mozilla Thunderbird
From: "Du, Bin" <bin.du@amd.com>
Subject: Re: [v7,0/7] Add AMD ISP4 driver
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <694138dd.050a0220.16a81c.18f1@mx.google.com>
Content-Language: en-US
In-Reply-To: <694138dd.050a0220.16a81c.18f1@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:405:1::13) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CH2PR12MB4229:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b10909-d312-49f5-abd5-08de3dfb3c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHdLOWxsRERteFdMV3M1MFNUR2N2NTRWcjNLcDlCbyt4dEpZUk9lUUViMVdZ?=
 =?utf-8?B?SzhPVmU4NlUzSnd5bTFYWURCYkJGZE85NnEzNEpzR2pGQ1ZLNCsxb3ZvWGgw?=
 =?utf-8?B?RFpWZG4xeUdTY1EvYWtQa3IrSGdBWkVZTVRqSExmOWVvaDd2OHdORm52Sm91?=
 =?utf-8?B?SVVKVGpzeU9TYzJuR2F4TkhwalFwT1ZrRVgrNDVqN2U0R2pmOHZBTFZyVUdu?=
 =?utf-8?B?NEVCY1hQT3cvZERIMXFVclJsZlZqT05iQi83b1E5UzFvTDA4MElhY2d6YUUr?=
 =?utf-8?B?cjR2N3IvMmNuZ0JCUnc0MTVVdXlSU2dlU2crQ08zczVZSEZiNysyNE92bWp0?=
 =?utf-8?B?ODRrM09kcmNRc3I5c3QvK2JNZFVJOXp5SlFIT2U3K1hjMzhPN3pRS3JqQTd6?=
 =?utf-8?B?djRTaU1BTGg0Vk1wcExCT25kS2tUQnUySGJ1eWd1d2YrV3BETzQ4dzFETWhG?=
 =?utf-8?B?ZXcrQlpZc3EzNDNSNWRGbEp0NFdyNUVWMlIzcDY2cUdCVkVTYmlxNEhvTFhY?=
 =?utf-8?B?V2l2aU5qNytoeWlFa2s5MmRGK3kwMUUwTWl4WWNkVGo0clM4b0p0L0NXTnpl?=
 =?utf-8?B?TmlialF5MGdCSHhTK2ZSTTkzUmsya2hDeGtDeG1YTWRWdm1XUmRFQW4zRHRa?=
 =?utf-8?B?QWREU28reHdabTBYVDJ1cjlXQ09reCtXNnY4TTVWWHF1QkV5QzRzQy9pQyt3?=
 =?utf-8?B?eWpadjErK3VKU0lyZGMvM25HRmEvcTF3SzVmZkhpYllCQWdJa1Q1WmlQWDIz?=
 =?utf-8?B?Tm5hVThnSWxlMC9sVzNlWHBhNStDYWw3UWoxVGtMWmxOTjU2enlRczF0NVBu?=
 =?utf-8?B?MlpmNGI0TWZqREZaOW44b1lGcXdwZklqY2ljWWFXUkZFUmJOTEV3TkZXL1BS?=
 =?utf-8?B?alFSV3c2YTV0SmZYcDZ4YzZyU1ora1VBSjRiWUs5cUVpQU5XOHRyRTNyalJW?=
 =?utf-8?B?UkFqREpHZzV3eFZyd2dTN1huOGNQcEFHZHNJRTFRa3RwemNVSVN0dU5yUnd3?=
 =?utf-8?B?ZjR2YmxqeVQ5Nk9PQzBrNUV1ZStjY2RGTHlLYk5KT250UGtQVHZ2a3YyVVMy?=
 =?utf-8?B?RWxKL1FlNnUwK3hCajdJTU1zWFhYeXh2dDJZZi8xeERWL01uR0pnVFRNOUEv?=
 =?utf-8?B?RHVYdFVENDRxcHBJWCtVTkpTQkQ1QU4xRldjT1FYK3dEVnVMNTdDN0dTY2or?=
 =?utf-8?B?eElJR1JkVnFBdUM4eDN2VVNNd1ZhaEhIQ0VVVHFwaHpad2Erc3RuUVNmUEx0?=
 =?utf-8?B?TEwyM0VBOFFZYW44NlBkL1QvVGZZTmlxQytmOFhkUjNETmV3TEd4aEp3b3dD?=
 =?utf-8?B?WlRoS216b01yQTRXYlBpM1FIdUpXRkV2QXY1Y1ZNaHkrY3dlL3oxdjBaN0pp?=
 =?utf-8?B?RlhJbHArZjdidXBVdzZJcm5yT0ZMNGlWS1dRZG1DU0w0NXU4aFZ2SFlxYldT?=
 =?utf-8?B?dHNLaStjT1lEYlBsajdVUU9nd0NvUDVBcVlHQmJyb25Sb202a0w1YzdacTJ2?=
 =?utf-8?B?cE1GVkJ4V0JaSmJoQ1RJcFkxTWJ5MStpUWpMN09lTkhSYk1vTFBXelkvUGRw?=
 =?utf-8?B?TzkwSlJZNWJxQU5XdFhYTUxqalNYWk5JUmk4TVJ5dVpwdkU5YkhDLy9UZkto?=
 =?utf-8?B?ajBna3dodG9KOXYwUXRVMmdZVWY0bEMyUVFjSVJyN2Y5Z3FOTE4zSjRZaGRw?=
 =?utf-8?B?STlnbHFlUEhtWCszVzlKZ211cllWMC9qQ2dEa01vUU4zMmd6RmNtaDZScW9J?=
 =?utf-8?B?OHUwdVVQUWRHQWI0MjJkTzRnbk42WDRaMGsvZ21VZFJRb242eUc3djFWSzZZ?=
 =?utf-8?B?a0FaV0xBdFM1SjRVZnp2bG1qbFZDc0g3VFJwZmJWL0hZSU54UU0xc0ZlU29m?=
 =?utf-8?B?RlNaZTlXdW1sRVIvWGtvOHc3dmVjZ2s5Q2Fqd0hUdGJmWlZTTVJqd1BnOEdl?=
 =?utf-8?Q?j24oyKUKTLbItn9xzfWIS/yYFg+y+Ulp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1BKdWFiL21GMCtOR0tuQmloQVNIUkMxbzQ1Q2NQVlNtOFllVXVlSkVyeGta?=
 =?utf-8?B?ZVp5a084TFVDN0NXOGRXL1B5U0hZRTRxZlVrT1R2RXRveVNLUFNvT3pCb3hO?=
 =?utf-8?B?OTJiK2pRT0F6NDBjOSs4TFlWYnA2VFMzbDMwN0tJSEZkbkxSenVZOXRYRGI3?=
 =?utf-8?B?K01YWUc1c0NuNUJld2VUeFprVlVMT0pCWkw3WDd0VlJDVFhDOGxSSlRVRUln?=
 =?utf-8?B?YWE5dkdMYzEzcEt4eUFlQmVCcW1oT0FGMFM3MGN6eEcxUzN5SVpsWGxYRGtZ?=
 =?utf-8?B?WGU0M3RmQmp0aFRHUEJURnljYTdXa1JUZjFPYTIyOHRISU1Kb3Q1T0VyU2J5?=
 =?utf-8?B?ZHJlK2x6c1pKOURDK1ViNkpFa1l5WFN5eW1FcHRqei9uNHlWbkYyZjVUdW1S?=
 =?utf-8?B?WWIvWmxyWmtNb0pmcE12VlBkbENDaS9rN3d1aTdoM2JaT2k1UzgzK2FKN3VN?=
 =?utf-8?B?V3J4bVg3SEpWaXl1bldnbnlFT2FueDI3cTlubnNMYkE2UjErbklEaTVtbEE4?=
 =?utf-8?B?a3lxRGhaUGl3SHNJYTVVTjZtU0hNQldJOTcwR2IxVnk5dk41TFczZDBWcmRQ?=
 =?utf-8?B?Tlc0cC8xTDZONStaN3lJUlBDNWhxSWpLbHFqbW5QYktoaUhkSVByUk1BUVR2?=
 =?utf-8?B?TDdlWGZCUHRlMGp3bDM0dzcrME9vcHZBK1VKL05pbTFLSCtqNEVnSnVUWk9X?=
 =?utf-8?B?M1hmcWZEcFRybFJCNEVqZjVsSUs0WkJWZTN2Q3lBMGxjOUlVRUZHNWw1SFVY?=
 =?utf-8?B?OTYwL3NhOGlNOFJGTk1FTlZORjlwVCtIaHFJSW0yQTRLS05XY3V5bnAyVHVn?=
 =?utf-8?B?SlhvU3BDcEovTXMxWFZNQXl2aU40U210V0xqZkM1YVIwUnRwbWE1Ykg3NHBt?=
 =?utf-8?B?V2ttUllmZkxmb2s0V21xNUZYQWRaZTdieVJiNlBiNXBoakNJeTVQaEtkbm9j?=
 =?utf-8?B?ZnkyaGNBOXI0YVdxTFZhSk8rc0R5Y1gwZDlRMnNYZHZCdEZrRWFGckp4WEdL?=
 =?utf-8?B?ak1qKzBzTnpqbGFaenlUWk9iRVZTZFIvNjJVUkQzbkd3NktCcXVtMWNMTmUz?=
 =?utf-8?B?enVTbnB4ejM2NkNYMkJWbE44K0lvZnZodXRJTmpNNVhaWW1ZSlQwcHlzeGtz?=
 =?utf-8?B?bTBKNTgwS3UrL1NTM1lvME1kNlNPV2JwYU4wdnJydHpVc0lwZXFZTkFtWThW?=
 =?utf-8?B?R2JJdnkra1JEWmEwU2tjTWROL202aVh3WjB6ZVRUWEYrUzBJUkpQV3o4Y0c5?=
 =?utf-8?B?VWU3cTlzalFRU1A4S3FESnU1TEl3YnhpYm1lRDY4K0g4b2o2ZzFlWm9ZNm5v?=
 =?utf-8?B?RWJxSFlRdmtxeFVoZmQzZFZEbzlUbXpRSzZXaWlrcG5tL1dVQ2Q1WjQycThM?=
 =?utf-8?B?R1lLUXNIVWp4UGVOSGd3M2ZPWUpkMXFiVXBzRlQrZzJOWVcrK2EwcExyNG5v?=
 =?utf-8?B?YUJOZG5OMUNJUFpSazJtSkg4bW9kTThHb0krMTArYUFTbDNSNHBhVXVUWUht?=
 =?utf-8?B?STcwL0crVkx4SVN6SUtCNGtMK0R1S2lJZ20wWW5TSUZHT0tyTUwxVjNkeTVN?=
 =?utf-8?B?d1ByRk1vdWVwbUZrTFA1Sk9iN0hDZjRRK3hpRHB1Y0trRVlQUC9zcGRSTlNC?=
 =?utf-8?B?ZnN0VE1FZXFnSm5CZVMvcXU2aGtWSnZpbHFmdUNIWGNSZ1l6QVYzOGxrVkFX?=
 =?utf-8?B?M09NWG1SNkFlZ2l1Z0c1NEZDYWVHSkVUaGh6aHhTTmgwdnp5YzNTUUpsNm9X?=
 =?utf-8?B?NTNwQUZkSWRvL1N5OHJsTTIyd3g4RGR0T25mL1Y0aDJZN2hEa0NIQ1Z6MjhB?=
 =?utf-8?B?R2ZkTHV6NjVMNTVSQWRVTitueUJoUVZQQzVkSUY0bGxOdlV6a3daQXZEWXJP?=
 =?utf-8?B?V2ZRTGhqU3daekNJNnBiNnNGY0RVM1dWOUo3cW11bmdFNW9UQWx2U1FXSnM0?=
 =?utf-8?B?QXo2L0lSOU12dFR2SXAwT0xjMUJSc2hvUE5ZbmJsUHg3VU9qUzRaSW85K2tE?=
 =?utf-8?B?SEZ0WlcvWUg4Q2tWNmg0dm9JYjFUUjRyelMvMjBzMWZJbTI0RFNIYWd0bnVJ?=
 =?utf-8?B?TlYzVm1vOCtyYkp6SzkvUzY0cHFiNUl3TSs2c2hzUnQxUTQ3bFMxMTlUbWRI?=
 =?utf-8?Q?N8hY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b10909-d312-49f5-abd5-08de3dfb3c40
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 06:03:59.2462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1qYQoX4cNjtbkjkLwM8juLF+wFiUZ+j1SoEX46gz6Cqs1ur3gBLeEFui77Qqoyc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4229

Hi,

Only two CI issues relate to my patch, and I believe both are false 
positives.
1. About drivers/media/platform/amd/isp4/isp4_interface.c:441 
isp4if_send_fw_cmd() warn: '&ele->list' not removed from list

Actually ele->list will be removed by function isp4if_rm_cmd_from_cmdq()
either in isp4if_send_fw_cmd() or in isp4sd_fw_resp_cmd_done()

2. About./platform/amd/isp4/isp4_subdev.c:385:6-25: WARNING:
atomic_dec_and_test variation before object free at line 386.

It's standard use of doing reference count decrement and check
before freeing object.

Regards,
Bin

>-----Original Message-----
>From: Patchwork Integration <patchwork@media-ci.org>
>Sent: Tuesday, December 16, 2025 6:48 PM
>To: Du, Bin <Bin.Du@amd.com>
>Subject: Re: [v7,0/7] Add AMD ISP4 driver
>
>Dear Bin Du:
>
>Thanks for your patches! Unfortunately the Media CI robot detected some

>issues:
>
># Test static:test-smatch
>drivers/media/platform/amd/isp4/isp4_interface.c:441 isp4if_send_fw_cmd()
>warn: '&ele->list' not removed from list
>
># Test static:test-coccinelle
>./platform/amd/isp4/isp4_subdev.c:385:6-25: WARNING: atomic_dec_and_test
>variation before object free at line 386.
>./i2c/max96717.c:653:44-51: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/imx274.c:2038:32-39: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/mt9m111.c:1290:3-10: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/ar0521.c:1113:31-38: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/mt9v111.c:1143:3-10: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/mt9v111.c:1151:3-10: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/mt9v111.c:1159:3-10: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/adv7842.c:3470:16-23: WARNING: Consider using %pe to print PTR_ERR()
>./platform/nxp/imx8mq-mipi-csi2.c:422:23-30: WARNING: Consider using %pe
>to print PTR_ERR()
>./platform/renesas/vsp1/vsp1_drv.c:958:4-11: WARNING: Consider using %pe
>to print PTR_ERR()
>./pci/intel/ipu3/ipu3-cio2.c:318:19-26: WARNING: Consider using %pe to print
>PTR_ERR()
>./pci/intel/ipu-bridge.c:567:3-10: WARNING: Consider using %pe to print
>PTR_ERR()
>./i2c/st-mipid02.c:751:3-10: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/ds90ub913.c:625:44-51: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/imx412.c:931:3-10: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/ov5693.c:1296:9-16: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/rj54n1cb0c.c:1361:4-11: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/rj54n1cb0c.c:1370:4-11: WARNING: Consider using %pe to print PTR_ERR()
>./platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c:187:3-10:
>WARNING: Consider using %pe to print PTR_ERR()
>./platform/rockchip/rkisp1/rkisp1-csi.c:372:3-10: WARNING: Consider
>using %pe to print PTR_ERR()
>./platform/renesas/rzg2l-cru/rzg2l-csi2.c:307:30-37: WARNING: Consider
>using %pe to print PTR_ERR()
>./platform/renesas/rzg2l-cru/rzg2l-csi2.c:726:30-37: WARNING: Consider
>using %pe to print PTR_ERR()
>./platform/ti/cal/cal.c:1111:3-10: WARNING: Consider using %pe to print
>PTR_ERR()
>./dvb-core/dvbdev.c:575:48-55: WARNING: Consider using %pe to print
>PTR_ERR()
>./dvb-frontends/mn88443x.c:698:3-10: WARNING: Consider using %pe to print
>PTR_ERR()
>./dvb-frontends/mn88443x.c:713:3-10: WARNING: Consider using %pe to print
>PTR_ERR()
>./i2c/max9286.c:755:7-14: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/ov5675.c:1188:9-16: WARNING: Consider using %pe to print PTR_ERR()
>./platform/rockchip/rkisp1/rkisp1-isp.c:940:3-10: WARNING: Consider
>using %pe to print PTR_ERR()
>./platform/renesas/rcar_fdp1.c:2306:4-11: WARNING: Consider using %pe to
>print PTR_ERR()
>./i2c/ds90ub953.c:779:44-51: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/ov9282.c:1133:3-10: WARNING: Consider using %pe to print PTR_ERR()
>./i2c/ccs/ccs-core.c:3241:3-10: WARNING: Consider using %pe to print
>PTR_ERR()
>./i2c/ccs/ccs-core.c:3298:3-10: WARNING: Consider using %pe to print
>PTR_ERR()
>./platform/samsung/exynos4-is/media-dev.c:1337:16-23: WARNING: Consider
>using %pe to print PTR_ERR()
>./pci/intel/ipu6/ipu6-isys-csi2.c:91:22-29: WARNING: Consider using %pe to
>print PTR_ERR()
>./ipu3/ipu3.c:534:5-12: WARNING: Consider using %pe to print PTR_ERR()
>./ipu7/ipu7-isys-csi2.c:59:22-29: WARNING: Consider using %pe to print
>PTR_ERR()
>./ipu7/ipu7-isys-csi-phy.c:311:23-30: WARNING: Consider using %pe to print
>PTR_ERR()
>
>
>
>Please fix your series, and upload a new version. If you have a patchwork
>account, do not forget to mark the current series as Superseded.
>
>For more details, check the full report at:
>https://linux-media.pages.freedesktop.org/-/users/patchwork/-
>/jobs/89800161/artifacts/report.htm .
>
>
>
>Best regards, and Happy Hacking!
>Media CI robot on behalf of the linux-media community.
>
>---
>Check the latest rules for contributing your patches at:
>https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
>If you believe that the CI is wrong, kindly open an issue at
>https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all to this
>message.


