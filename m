Return-Path: <linux-media+bounces-15537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E54940B0A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 10:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C70CA1C22EC2
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9F818EFF5;
	Tue, 30 Jul 2024 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ZHjTvloo"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2080.outbound.protection.outlook.com [40.107.215.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895A8944E;
	Tue, 30 Jul 2024 08:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722327257; cv=fail; b=WPOE/NRbHrfkRJy9VPB8TbdHAGRk/b9Lv3M/4L5Sw0X862hi5g7V/Wf3VD810BG8fkXXP3qznFXumk5CqEsKZvI1c+qU8VIZh7UJ2muPw0paGyvRLb6I4gq4hwG4XhlBHDwzrjhZ9hv4ojytdSGSGADGcjT0SKPmxnRfQrbLky8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722327257; c=relaxed/simple;
	bh=jD9c4T8MJlheXxX5BZegJ6vCDWQjQggxOTRqBIlrc2k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NF3kTjURichnWrE4ISjI6+9CPpzk4FvrEEPNG/goyM9GgynBk9bYS/R+eS3w3LNdk5uaSLIfsmcojfVLGFBPm1Sxzzg7Us2VvXe4yRxt4cMgL6yjvbA7+/77qV6OtkINFdzAs2VB/VBYD44pMdslrl96t62Mhd0DdvwixJe5c9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ZHjTvloo; arc=fail smtp.client-ip=40.107.215.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSdRuPYpo/wnf4by4FWOgeqApAfdwv/ciTh92jyR7Ht5hsuLfvwmA4Emx21k1yGFWs7pNY9lhlX1HAvwaP8IVkt76tKIq4Sp2t/0QGkcXNAj/vKATvnAuxXyZtiAWdtdENet3TihyF4VjmrI8eAD/2fyluIH0Po86sEJRIKbZJps6ecMWY9LkmUSyLvJn5Lh2fPuL09D+8cZMTtLnNivNkm8Bmq/nvn5s9t8LvsZ2fGuA5cTWVEg70G2Wz0vJHYMM1Ze9M67cHsNA2Zqe3AzScoImrqElfoIOsDSd6kMiblm+Oj3aOsHJiNE5B+4zfIKuHqO5CGFxDnV/ifuKY0uiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALaZGhYj3zeWJ4RWJ6/z87oYuDsXnn2Fq4leuMEMNmE=;
 b=L03yd3CBH9+NRGLQWGkIjjHLVBsCWcFkTCYKl5w+UcoNZRAic5IQHINOgEHi30bI2uf7xCq2uePvyF5ZAS5ruTBe4qjS8uOG6FajHS2kL8tc6/FhTt6L+eojR+XZxfmRupxWCL3TqkmIp2s2jkZ1aAk4f/Lz0ZMALg8BjyiUbafK9GSUN8vdK/0glxROhvn1d4hEPJ73RH5hW3TI2DP/z4WNkyW0HeA2ViFYk9PjgBPkYmDSZbbMrgj/sx/ORzTlkfjLn7KsS5Kr90ywzQF2ygqilOaO6TC+/DLB+Vt1mjBcFwTVaOdaXwPcWo2SLkCIVIz6wufuSlnqzXqbeq4V5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALaZGhYj3zeWJ4RWJ6/z87oYuDsXnn2Fq4leuMEMNmE=;
 b=ZHjTvlooJ4IEC61zey2kbIIOChG3Ettj+w/JRXW8anLVjPpcMxBEoGR1hO2gn4Mb5fv3soCJO+VJ0MvkAG5Qmu+dB43jfv0RPa029LSohvHstgcdrgX+UcgASwZgPY23RPpYxMEOT51kDGcUrrhQkJcsJdTKcb7tXVfagKUGxpGGV/wklweyvztbvMBPMPFfP2YALA7fGvQBZXfG8cQ0X5O6s56SVjli9Oz9/Ok+aJY3gocVutfEwpHi6GBs+sZATltGdYz1LZrEQ7YmglkZWI5q9x9+O/JV648W4AkG7jDR/zOrSvTRS5h8FgTtY+LE9/lxUJriSTfCkMUn/Ipw+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYZPR06MB5481.apcprd06.prod.outlook.com (2603:1096:400:286::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Tue, 30 Jul
 2024 08:14:06 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 08:14:06 +0000
Message-ID: <966651c0-42fc-4827-bf3e-2170dcf4688c@vivo.com>
Date: Tue, 30 Jul 2024 16:14:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <d2f56198-a3c2-4f7b-9d10-616deb348351@amd.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <d2f56198-a3c2-4f7b-9d10-616deb348351@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYZPR06MB5481:EE_
X-MS-Office365-Filtering-Correlation-Id: 5046efe7-171e-4dea-76da-08dcb06f94b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXoyMmZvQURNWms4MGNlUEc5VEF4aW02SWJSeCtxYnR2bXVTUFFZa1BZZjdY?=
 =?utf-8?B?MFhGVDJCaitOQVdVS2NoMU5hU3VUOE1TZ1IyU3VLVzdCYzVJMUtnR2N5SFlU?=
 =?utf-8?B?VWw4anVNUVFRdVlLYzZ1RFNkNDltNmZxOURzNVFLVkFQL3dKUjhSNi94OFhS?=
 =?utf-8?B?WWRuV1pVR0c3bWgzUGhpL3hZWVI3TVM1T0g0cmNpQmNYQ3VrY0JkSVR0K3g4?=
 =?utf-8?B?em5UbDhhRi9zTGt4VXlwTGZ0cXltTitqOHlHU1RPN2JzUU5URzNJc0lYKzBr?=
 =?utf-8?B?Y2MvZzcycW9wTmtxQ2pMeVh6VElNWklHZDZydDUwUkRRQ2JLRkQ3ODZzTE9I?=
 =?utf-8?B?dTZYaGU0dkN1SS8vaEpzUCtCK1NkYWdtVHZEREUxYnpJOUdiZnNobTIvcXh2?=
 =?utf-8?B?MlBzdXZBVXgwNXRiaWJibjlIUUZlTmpiWGkyUWZnZW5tMXdTajhwSDZNOUt3?=
 =?utf-8?B?MU9WcVd5dzJuTWhmbUFqK1Q4ZFJmTDZzOTJET0JkME5QaWRkWkUvaWw5V2Y4?=
 =?utf-8?B?MmN5M0ZlbjUyVnhwN0doOTlHQTVOQStObjVGWmVVanhPRzdsVllkUXpjdU4z?=
 =?utf-8?B?Ti9RaW5YcDNzQlFnWFRTVjZBKy9HWUNqSnB5akt1WFNzQll4clhsdGZyVmZK?=
 =?utf-8?B?RkM2VzUyWWp1ZWdhL3V3WUpMRHdFRy9EOVFVV0hZaXNDN2tLZlRBTHhNQW5I?=
 =?utf-8?B?cjNkZVdlc2tiOE1BRnZLMnkxR0c3VUlnTTFxSEg3amN3ODRvNUIxSHg5ZXZ4?=
 =?utf-8?B?SituZUcxMFlKcmwzcldOc3pDd1NwUWhQOHF4NDdwY1hnUzdoeWoreU9PaTRh?=
 =?utf-8?B?TWFsUHZjalFLNGJvWXREYm91VW9GVXl3QXpHZEdPUDJwdlplbTExSzdRL3BZ?=
 =?utf-8?B?K2ZDZUxiSzVEcnhXTkRsSkR1UFZpQTZKWDhidUprTmxSbVFCMjlVMlEzTCsw?=
 =?utf-8?B?bGNxQ1JMcU03Q1ZxSStoOUtQdk1lRlB4L3JselhHVmh0TjQ1Z3dVRFRhY2Jz?=
 =?utf-8?B?WExIVFlxTHJPQ3NKaWo1dm5iSDZQaGdocktsc0kvMFVHNXpBMlJJNnhScHMw?=
 =?utf-8?B?RzhOeW1Pc3lHSnBjNmZEQ1VVbVJEd0FqVFJZb1dTNXNHWlVPREQ3cHVZZ1Na?=
 =?utf-8?B?L3lHWUhtUk5IbEs3R096SklldDBvRUZrTmpmLytMOFl3S3NyU0NtOG9KVm5o?=
 =?utf-8?B?ZEJ6OTgrZGpSeTkrbEh2TmVKV1VLY2ZUWnQrV0hYQk41WTA1MkJmbDRNdW9T?=
 =?utf-8?B?Nk9CbGxZU0NZWHI0a2FZK3puQjR6S2h6TUhvTVhCVHNLOUtZd0ltclVWZEs1?=
 =?utf-8?B?OCswMW1qRXV1T0dlWWtZQnNDK1liTmYyeFYraGs0NW9JWE5iK1VrSTVqMGN6?=
 =?utf-8?B?Y2tLVGU1K1JJUU1xMFRiZ3hTaktyOXFqV3AzM1Fkb0pDN0gwcTI4VTdRLys2?=
 =?utf-8?B?THkreVdYVEEwYWF0ZmZxcHNrVmsrSEZPRkU1dGF5QmE5dmd0Z3Q2K1FBQ1Y3?=
 =?utf-8?B?V05lbGI5MSsxcHVOTUlnSU9HWGU5ZE5aNzFjdFpkaFZuMGlYWWF3dTJqeTFu?=
 =?utf-8?B?SFVPdDR4b3NBa21jRnpENDMzNjAvd0ozdTY3YUQvcFgwdTBkUCszNDhtZDRD?=
 =?utf-8?B?MUU1b1I0b1lCZ1dBcWpsM3c3dU4xN0lSMjY1MmVRamZzWnQzdk9CWlo0bUdT?=
 =?utf-8?B?UHhNbDJqM0JWQk5XTFg4eE9TYnB6SnQwRDYwakR4OXQrTFpxQUJSbS9pMDBp?=
 =?utf-8?B?WjBpVjZoOFNNcmsrd25PbWdXV2tpS3R0SVQ3Rzdhb054ZE9jendjbHByZEFq?=
 =?utf-8?Q?RS40BOnXEaRMtqmHKVR35MCztTcenMNmbdaYw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWNKYnBucXc2RWlMOFBnRkh5QTJtN3dUT3lTa3RRMERrdmErejNEblFld0dN?=
 =?utf-8?B?M29TTStSaGMrZncvN3dkS0Nla1pKVThINnZBMFIzSTFXd1lQcUlvQ05mcWRQ?=
 =?utf-8?B?VUJpeDBtSXV0elNzMWdZS3ZvK3lqRi9ZbEt2YWFlTmp1d09qcVErSjlJVzlx?=
 =?utf-8?B?Ri9oMVM2ZEh2bXM5WlZGSUNkVC8yc012WHJhNkRNeC84Z0NEdVI3NHkvOGp2?=
 =?utf-8?B?MmJTUGFzSHFQd0lLdGY3V0toY3dGRUljQWc1T0QxNTZJNGcwVVlSRDJwZjNB?=
 =?utf-8?B?MWxucU05a3N6NnU2Q1JxYkZQUmxKQmtiTVJkTE10VkZZZWNuSkxtTE9ZdFZ1?=
 =?utf-8?B?SFA1b2xPZ3Vzb2ZBeVBvdTI4QVkxQzN5NXoxeUpjelN6UjMwd1R3Wk1GNWNp?=
 =?utf-8?B?NDhEYzhLQUlLenFjVE5zYWloQlNGVXZxa3B2UzMvdDJiNnZrRnNteVFxWlQ5?=
 =?utf-8?B?QWd1K0VuYlBqTm5TTXdQVDk5STU5MGJiZlVNU2xwcit5bnhSNXlVczk3UDdr?=
 =?utf-8?B?WUQxSHZDMjAvSjFjS3V6THM5bzlyWTBYeThmL1BXRDFEdnFyeWlFeENJMkE4?=
 =?utf-8?B?QzJFalYzQmFyVmt1MmV4T0J5OGdHR3hYMlJWK1BkTklMTDlmRmxsM0pPb0pK?=
 =?utf-8?B?Yzd3WWtwdlRRcjRHQ2pXd0VHd04rUThNMVBUd1NqZW9VWFlaUE5KUWE1MEFU?=
 =?utf-8?B?TzR5dExwUm9OU1orZytJL2xPeW41MndtS0dmWmRlcTVNb3VJTkxYc2ZyYS9Y?=
 =?utf-8?B?amsxK3JzUzJ1Z0lBYXlPcUMwU3poSHFxUko3cEJUajZzbG1YMWE3dXJkUzRB?=
 =?utf-8?B?cFVXem5KZnBrQnBpZnowZUN2UzU0aG9zdndIN05RREV6YVc3SXFDZzJ0Skgy?=
 =?utf-8?B?WitTd0U3QXM1ZGZxcjhEMkJWZGVvaE5VczRQL3UrcUQrd3FodVEzUGVnNW9l?=
 =?utf-8?B?MGxvU3pBdWF6N0lWK2FjaHhCSXpXdlo1R05aUHpuRUhxVURGMVluZHdXZXh5?=
 =?utf-8?B?SURFRnM5Y3lvZityMXc1ZHpCZHppUzJhT0g5amlTZnl2RHZkZTJCazY5SkhD?=
 =?utf-8?B?Mzh5SitheHVWcmw1cjhhTGV3SHJiUW84QXUxRk1aRkRJWmgvS1ZTcUJWNGZa?=
 =?utf-8?B?dDJmckJvMXE4WVVNcE40OXorRmFvSUxMbmpaSWtlQTBJcno3ZldYVHZCQ1M2?=
 =?utf-8?B?WFNrbERFS3BPZDh3MWNiUDlDdXFaY0VFbjlRNTh0bzlkdyt6bC81cUU4Nk00?=
 =?utf-8?B?STBWS3FRSDZ5c3JPVmRFa2dNMmVwcXN5U2JMSmt1bXdXdHVNbGtPeU41ZVUw?=
 =?utf-8?B?TDROdDNjaXJmU0tTNkpXcTFFMExsQXI4ekYvdHZFR3UrWlh1RUdZVDd4RFBG?=
 =?utf-8?B?MG5NV2NXUCs5QVFxZmcyQWR3TkZaakhUa3c0d2RlMjAwL3lVc0FNbWdJQ3BH?=
 =?utf-8?B?emdiNGx1YVErSTJ3NDNlOWZjVVZEbUgrWDFRSCtqa1lFazZURjJsTHlNR1Ix?=
 =?utf-8?B?eGUyOWx5bmV4OUU2clgyeWlQTFZ4K0p6NkJMN3VmcnVUWkZBc2JFN0wwLy9T?=
 =?utf-8?B?YkNmQTJsQ1lETUwwTlg5NGhjb21icmdXbkZuRWRWd2k4Z0xlWnh0MFl5Vk5y?=
 =?utf-8?B?U29sMDlOUjhpVE5ldW1wdjdjVVBqQkxXc0xRMFFlNlFoQXpiRDllMitUcW5r?=
 =?utf-8?B?bnNIL1VvTlVmbmNUSDBOeTJxSXRVWkkzYkxBSStrY0FxK1ZTeTdoa2NLTXZE?=
 =?utf-8?B?TmhnZTZhWWh0cUMrRzh0ZThoaDVHOGUxRDJ0QWhvWkU0RFl1ak1MWjBDVVk0?=
 =?utf-8?B?NGhaMU50WHdxUVp6MExabDdWTXR6eFJpNnU0VXU2TDUwdDJHVG9tQXV3NnBm?=
 =?utf-8?B?Nk5hUWl0MnhSUG42amFHVFI5Vko1OVUrSnp6YUpGcElkYis5aGRPN3hFbldM?=
 =?utf-8?B?eFVZM1lYdVpubmFrMSsxS0VBM2t5aHVLSHUvOGtueFlwTkVZLzZveHNmV0J0?=
 =?utf-8?B?MDdwNmtoS0crRVpWU25DdHNQUXE0Rkx6TjVPNHNnSXRMWHdGN0orZUc4OWQr?=
 =?utf-8?B?VUh1WmVCMy9VaENaQXo0MHBwYktXLzM0S2QrSXczaGp0cDFEYWZFeitqN2tE?=
 =?utf-8?Q?uDI1Z/E3sdppSanA2No3KfTbJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5046efe7-171e-4dea-76da-08dcb06f94b3
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 08:14:06.3838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWxQSZtbxS0RWAPH30YbQRyincVcAwr9zX+upHOpqt5P/IoSAoWCVyGXXF6k8fZSOayTMkY1073/76LNjIvVwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5481


在 2024/7/30 16:03, Christian König 写道:
> Am 30.07.24 um 09:57 schrieb Huan Yang:
>> Background
>> ====
>> Some user may need load file into dma-buf, current way is:
>>    1. allocate a dma-buf, get dma-buf fd
>>    2. mmap dma-buf fd into user vaddr
>>    3. read(file_fd, vaddr, fsz)
>> Due to dma-buf user map can't support direct I/O[1], the file read
>> must be buffer I/O.
>>
>> This means that during the process of reading the file into dma-buf,
>> page cache needs to be generated, and the corresponding content needs to
>> be first copied to the page cache before being copied to the dma-buf.
>>
>> This way worked well when reading relatively small files before, as
>> the page cache can cache the file content, thus improving performance.
>>
>> However, there are new challenges currently, especially as AI models are
>> becoming larger and need to be shared between DMA devices and the CPU
>> via dma-buf.
>>
>> For example, our 7B model file size is around 3.4GB. Using the
>> previous would mean generating a total of 3.4GB of page cache
>> (even if it will be reclaimed), and also requiring the copying of 3.4GB
>> of content between page cache and dma-buf.
>>
>> Due to the limited resources of system memory, files in the gigabyte 
>> range
>> cannot persist in memory indefinitely, so this portion of page cache may
>> not provide much assistance for subsequent reads. Additionally, the
>> existence of page cache will consume additional system resources due to
>> the extra copying required by the CPU.
>>
>> Therefore, I think it is necessary for dma-buf to support direct I/O.
>>
>> However, direct I/O file reads cannot be performed using the buffer
>> mmaped by the user space for the dma-buf.[1]
>>
>> Here are some discussions on implementing direct I/O using dma-buf:
>>
>> mmap[1]
>> ---
>> dma-buf never support user map vaddr use of direct I/O.
>>
>> udmabuf[2]
>> ---
>> Currently, udmabuf can use the memfd method to read files into
>> dma-buf in direct I/O mode.
>>
>> However, if the size is large, the current udmabuf needs to adjust the
>> corresponding size_limit(default 64MB).
>> But using udmabuf for files at the 3GB level is not a very good 
>> approach.
>> It needs to make some adjustments internally to handle this.[3] Or else,
>> fail create.
>>
>> But, it is indeed a viable way to enable dma-buf to support direct I/O.
>> However, it is necessary to initiate the file read after the memory 
>> allocation
>> is completed, and handle race conditions carefully.
>>
>> sendfile/splice[4]
>> ---
>> Another way to enable dma-buf to support direct I/O is by implementing
>> splice_write/write_iter in the dma-buf file operations (fops) to adapt
>> to the sendfile method.
>> However, the current sendfile/splice calls are based on pipe. When using
>> direct I/O to read a file, the content needs to be copied to the buffer
>> allocated by the pipe (default 64KB), and then the dma-buf fops'
>> splice_write needs to be called to write the content into the dma-buf.
>> This approach requires serially reading the content of file pipe size
>> into the pipe buffer and then waiting for the dma-buf to be written
>> before reading the next one.(The I/O performance is relatively weak
>> under direct I/O.)
>> Moreover, due to the existence of the pipe buffer, even when using
>> direct I/O and not needing to generate additional page cache,
>> there still needs to be a CPU copy.
>>
>> copy_file_range[5]
>> ---
>> Consider of copy_file_range, It only supports copying files within the
>> same file system. Similarly, it is not very practical.
>>
>>
>> So, currently, there is no particularly suitable solution on VFS to
>> allow dma-buf to support direct I/O for large file reads.
>>
>> This patchset provides an idea to complete file reads when requesting a
>> dma-buf.
>>
>> Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>> ===
>> This patch provides a method to immediately read the file content after
>> the dma-buf is allocated, and only returns the dma-buf file descriptor
>> after the file is fully read.
>>
>> Since the dma-buf file descriptor is not returned, no other thread can
>> access it except for the current thread, so we don't need to worry about
>> race conditions.
>
> That is a completely false assumption.
Can you provide a detailed explanation as to why this assumption is 
incorrect? thanks.
>
>>
>> Map the dma-buf to the vmalloc area and initiate file reads in kernel
>> space, supporting both buffer I/O and direct I/O.
>>
>> This patch adds the DMA_HEAP_ALLOC_AND_READ heap_flag for user.
>> When a user needs to allocate a dma-buf and read a file, they should
>> pass this heap flag. As the size of the file being read is fixed, 
>> there is no
>> need to pass the 'len' parameter. Instead, The file_fd needs to be 
>> passed to
>> indicate to the kernel the file that needs to be read.
>>
>> The file open flag determines the mode of file reading.
>> But, please note that if direct I/O(O_DIRECT) is needed to read the 
>> file,
>> the file size must be page aligned. (with patch 2-5, no need)
>>
>> Therefore, for the user, len and file_fd are mutually exclusive,
>> and they are combined using a union.
>>
>> Once the user obtains the dma-buf fd, the dma-buf directly contains the
>> file content.
>
> And I'm repeating myself, but this is a complete NAK from my side to 
> this approach.
>
> We pointed out multiple ways of how to implement this cleanly and not 
> by hacking functionality into the kernel which absolutely doesn't 
> belong there.
In this patchset, I have provided performance comparisons of each of 
these methods.  Can you please provide more opinions?
>
> Regards,
> Christian.
>
>>
>> Patch 1 implement it.
>>
>> Patch 2-5 provides an approach for performance improvement.
>>
>> The DMA_HEAP_ALLOC_AND_READ_FILE heap flag patch enables us to
>> synchronously read files using direct I/O.
>>
>> This approach helps to save CPU copying and avoid a certain degree of
>> memory thrashing (page cache generation and reclamation)
>>
>> When dealing with large file sizes, the benefits of this approach become
>> particularly significant.
>>
>> However, there are currently some methods that can improve performance,
>> not just save system resources:
>>
>> Due to the large file size, for example, a AI 7B model of around 
>> 3.4GB, the
>> time taken to allocate DMA-BUF memory will be relatively long. Waiting
>> for the allocation to complete before reading the file will add to the
>> overall time consumption. Therefore, the total time for DMA-BUF
>> allocation and file read can be calculated using the formula
>>     T(total) = T(alloc) + T(I/O)
>>
>> However, if we change our approach, we don't necessarily need to wait
>> for the DMA-BUF allocation to complete before initiating I/O. In fact,
>> during the allocation process, we already hold a portion of the page,
>> which means that waiting for subsequent page allocations to complete
>> before carrying out file reads is actually unfair to the pages that have
>> already been allocated.
>>
>> The allocation of pages is sequential, and the reading of the file is
>> also sequential, with the content and size corresponding to the file.
>> This means that the memory location for each page, which holds the
>> content of a specific position in the file, can be determined at the
>> time of allocation.
>>
>> However, to fully leverage I/O performance, it is best to wait and
>> gather a certain number of pages before initiating batch processing.
>>
>> The default gather size is 128MB. So, ever gathered can see as a file 
>> read
>> work, it maps the gather page to the vmalloc area to obtain a continuous
>> virtual address, which is used as a buffer to store the contents of the
>> corresponding file. So, if using direct I/O to read a file, the file
>> content will be written directly to the corresponding dma-buf buffer 
>> memory
>> without any additional copying.(compare to pipe buffer.)
>>
>> Consider other ways to read into dma-buf. If we assume reading after 
>> mmap
>> dma-buf, we need to map the pages of the dma-buf to the user virtual
>> address space. Also, udmabuf memfd need do this operations too.
>> Even if we support sendfile, the file copy also need buffer, you must
>> setup it.
>> So, mapping pages to the vmalloc area does not incur any additional
>> performance overhead compared to other methods.[6]
>>
>> Certainly, the administrator can also modify the gather size through 
>> patch5.
>>
>> The formula for the time taken for system_heap buffer allocation and
>> file reading through async_read is as follows:
>>
>>    T(total) = T(first gather page) + Max(T(remain alloc), T(I/O))
>>
>> Compared to the synchronous read:
>>    T(total) = T(alloc) + T(I/O)
>>
>> If the allocation time or I/O time is long, the time difference will be
>> covered by the maximum value between the allocation and I/O. The other
>> party will be concealed.
>>
>> Therefore, the larger the size of the file that needs to be read, the
>> greater the corresponding benefits will be.
>>
>> How to use
>> ===
>> Consider the current pathway for loading model files into DMA-BUF:
>>    1. open dma-heap, get heap fd
>>    2. open file, get file_fd(can't use O_DIRECT)
>>    3. use file len to allocate dma-buf, get dma-buf fd
>>    4. mmap dma-buf fd, get vaddr
>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>    6. share, attach, whatever you want
>>
>> Use DMA_HEAP_ALLOC_AND_READ_FILE JUST a little change:
>>    1. open dma-heap, get heap fd
>>    2. open file, get file_fd(buffer/direct)
>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag, 
>> set file_fd
>>       instead of len. get dma-buf fd(contains file content)
>>    4. share, attach, whatever you want
>>
>> So, test it is easy.
>>
>> How to test
>> ===
>> The performance comparison will be conducted for the following 
>> scenarios:
>>    1. normal
>>    2. udmabuf with [3] patch
>>    3. sendfile
>>    4. only patch 1
>>    5. patch1 - patch4.
>>
>> normal:
>>    1. open dma-heap, get heap fd
>>    2. open file, get file_fd(can't use O_DIRECT)
>>    3. use file len to allocate dma-buf, get dma-buf fd
>>    4. mmap dma-buf fd, get vaddr
>>    5. read(file_fd, vaddr, file_size) into dma-buf pages
>>    6. share, attach, whatever you want
>>
>> UDMA-BUF step:
>>    1. memfd_create
>>    2. open file(buffer/direct)
>>    3. udmabuf create
>>    4. mmap memfd
>>    5. read file into memfd vaddr
>>
>> Sendfile step(need suit splice_write/write_iter, just use to compare):
>>    1. open dma-heap, get heap fd
>>    2. open file, get file_fd(buffer/direct)
>>    3. use file len to allocate dma-buf, get dma-buf fd
>>    4. sendfile file_fd to dma-buf fd
>>    6. share, attach, whatever you want
>>
>> patch1/patch1-4:
>>    1. open dma-heap, get heap fd
>>    2. open file, get file_fd(buffer/direct)
>>    3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag, 
>> set file_fd
>>       instead of len. get dma-buf fd(contains file content)
>>    4. share, attach, whatever you want
>>
>> You can create a file to test it. Compare the performance gap between 
>> the two.
>> It is best to compare the differences in file size from KB to MB to GB.
>>
>> The following test data will compare the performance differences 
>> between 512KB,
>> 8MB, 1GB, and 3GB under various scenarios.
>>
>> Performance Test
>> ===
>>    12G RAM phone
>>    UFS4.0(the maximum speed is 4GB/s. ),
>>    f2fs
>>    kernel 6.1 with patch[7] (or else, can't support kvec direct I/O 
>> read.)
>>    no memory pressure.
>>    drop_cache is used for each test.
>>
>> The average of 5 test results:
>> | scheme-size         | 512KB(ns)  | 8MB(ns)    | 1GB(ns) | 
>> 3GB(ns)       |
>> | ------------------- | ---------- | ---------- | ------------- | 
>> ------------- |
>> | normal              | 2,790,861  | 14,535,784 | 1,520,790,492 | 
>> 3,332,438,754 |
>> | udmabuf buffer I/O  | 1,704,046  | 11,313,476 | 821,348,000 | 
>> 2,108,419,923 |
>> | sendfile buffer I/O | 3,261,261  | 12,112,292 | 1,565,939,938 | 
>> 3,062,052,984 |
>> | patch1-4 buffer I/O | 2,064,538  | 10,771,474 | 986,338,800 | 
>> 2,187,570,861 |
>> | sendfile direct I/O | 12,844,231 | 37,883,938 | 5,110,299,184 | 
>> 9,777,661,077 |
>> | patch1 direct I/O   | 813,215    | 6,962,092  | 2,364,211,877 | 
>> 5,648,897,554 |
>> | udmabuf direct I/O  | 1,289,554  | 8,968,138  | 921,480,784 | 
>> 2,158,305,738 |
>> | patch1-4 direct I/O | 1,957,661  | 6,581,999  | 520,003,538 | 
>> 1,400,006,107 |

With this test, sendfile can't give a good help base on pipe buffer.

udmabuf is good, but I think our oem driver can't suit it. (And, AOSP do 
not open this feature)


Anyway, I am sending this patchset in the hope of further discussion.

Thanks.

>>
>> So, based on the test results:
>>
>> When the file is large, the patchset has the highest performance.
>> Compared to normal, patchset is a 50% improvement;
>> Compared to normal, patch1 only showed a degradation of 41%.
>> patch1 typical performance breakdown is as follows:
>>    1. alloc cost 188,802,693 ns
>>    2. vmap cost 42,491,385 ns
>>    3. file read cost 4,180,876,702 ns
>> Therefore, directly performing a single direct I/O read on a large file
>> may not be the most optimal way for performance.
>>
>> The performance of direct I/O implemented by the sendfile method is 
>> the worst.
>>
>> When file size is small, The difference in performance is not
>> significant. This is consistent with expectations.
>>
>>
>>
>> Suggested use cases
>> ===
>>    1. When there is a need to read large files and system resources 
>> are scarce,
>>       especially when the size of memory is limited.(GB level) In this
>>       scenario, using direct I/O for file reading can even bring 
>> performance
>>       improvements.(may need patch2-3)
>>    2. For embedded devices with limited RAM, using direct I/O can 
>> save system
>>       resources and avoid unnecessary data copying. Therefore, even 
>> if the
>>       performance is lower when read small file, it can still be used
>>       effectively.
>>    3. If there is sufficient memory, pinning the page cache of the 
>> model files
>>       in memory and placing file in the EROFS file system for 
>> read-only access
>>       maybe better.(EROFS do not support direct I/O)
>>
>>
>> Changlog
>> ===
>>   v1 [8]
>>   v1->v2:
>>     Uses the heap flag method for alloc and read instead of adding a new
>>     DMA-buf ioctl command. [9]
>>     Split the patchset to facilitate review and test.
>>       patch 1 implement alloc and read, offer heap flag into it.
>>       patch 2-4 offer async read
>>       patch 5 can change gather limit.
>>
>> Reference
>> ===
>> [1] 
>> https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com/
>> [2] 
>> https://lore.kernel.org/all/ZpTnzkdolpEwFbtu@phenom.ffwll.local/
>> [3] 
>> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
>> [4] 
>> https://lore.kernel.org/all/Zpf5R7fRZZmEwVuR@infradead.org/
>> [5] 
>> https://lore.kernel.org/all/ZpiHKY2pGiBuEq4z@infradead.org/
>> [6] 
>> https://lore.kernel.org/all/9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com/
>> [7] 
>> https://patchew.org/linux/20230209102954.528942-1-dhowells@redhat.com/20230209102954.528942-7-dhowells@redhat.com/
>> [8] 
>> https://lore.kernel.org/all/20240711074221.459589-1-link@vivo.com/
>> [9] 
>> https://lore.kernel.org/all/5ccbe705-883c-4651-9e66-6b452c414c74@amd.com/
>>
>> Huan Yang (5):
>>    dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
>>    dma-buf: heaps: Introduce async alloc read ops
>>    dma-buf: heaps: support alloc async read file
>>    dma-buf: heaps: system_heap alloc support async read
>>    dma-buf: heaps: configurable async read gather limit
>>
>>   drivers/dma-buf/dma-heap.c          | 552 +++++++++++++++++++++++++++-
>>   drivers/dma-buf/heaps/system_heap.c |  70 +++-
>>   include/linux/dma-heap.h            |  53 ++-
>>   include/uapi/linux/dma-heap.h       |  11 +-
>>   4 files changed, 673 insertions(+), 13 deletions(-)
>>
>>
>> base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
>

