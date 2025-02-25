Return-Path: <linux-media+bounces-26910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB6BA437F5
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE6143AA92D
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 08:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07566260A3A;
	Tue, 25 Feb 2025 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="n49q7ncI"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2111.outbound.protection.outlook.com [40.107.241.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B5125C6EA
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473102; cv=fail; b=VbOHBTCtEro4v7MoQ+HkoHXRp4GxT0Pk29ceEF5isi8CvDLTp6UxaLlHnnznUMQwT8MYDFipI+XBr+EZeGOwl6T+qcn6ysT8oJ4t7xgiDnzQMPD+Qgy+i/VJCmyxSbXaASWyo8VSBDX6jKHvsM1wI2qbQxm/ABOM+NgpfElDwJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473102; c=relaxed/simple;
	bh=A/XNgwrDnf/YckU2Vuo4ToeL9PunjNTFTc8lhfHITJM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qcs21sYyXY4rJHOhv6XSTXptBVVr7kLjh4JLztAGB3CqP+lXBUZ6DmTz4gFDRxjM4el6e/CWkrVN/If/r/00zjuBEVq59d5kWYXxmT7+2g8qkj30g6gNmuM0yhyLupU1Gep4LfeVaWLI6A37kPJ9+wuYoXXsgLozDGkqc4/JEWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=n49q7ncI; arc=fail smtp.client-ip=40.107.241.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFAqR8ZVOV5yrP2sUHVSmMF2RHQMIevSsPcw0eoSQypqeG2ZQgBENQqDOUPtgmfS8+iIeODT7nk+fB5YIQA0CvP3TVYeadlX3UlSDjeIHr8gu9z/1raRQ4nTP0shtVsXH42jRqVopQBCCWI/Q0aJpHIzGUK+xNKJWIX7oTKYmpoNc/3j4kzjlex8RZPXNKYf4ef9J0V9JNHER3gE8iZopUgjU9k00OR0UPFEHKoEo0XjIhMC76r1Zr9sxB2Ki2OKxr3ottUtZVtwa2xT7yurCQiU9sHsAcf6b7yIo3t0axaxExERMPafYreCYkj91FaBOl3Br3N1xG+nGaq5LGM/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp9MaimRS/c7P6sWRmjaIzBsCYR4Y70j2dR5zDOzUtE=;
 b=o7BGMLQGnJIy7wmA2aFPoHJcwB09nrg084AIqUOERoH3haxbPScv047RACoP8d29NN/kxd10BfgdMQSBTc/fMQO1WFrwFcdCkcFYfCzChEFQx8ACetNqtCeU+knLzwMOJSLNucK66JsljKd0EXveb4/q8HMM76tdYhLkUVCNPfq2aqQHpFfakvp8UC1CGevqu+inMp2s8yW4c5QAdhXojiilOchUWIxX78Pl7vrB4Zzf321FiB28YanEMkbqclXGfTeEjiz+R638O2Wf8FPC8X1E01zQZUWwGQ+tOpbfUJhi2+k6b+tOy883P1cpcFddI07vQ/OXjwShFU86B3JWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lp9MaimRS/c7P6sWRmjaIzBsCYR4Y70j2dR5zDOzUtE=;
 b=n49q7ncIHYIRvt8jdbLUgP5m/Yqunqq9RVrMBsd3u10U2U+6/02tM8rA3qEn9Qo2forIf92WKiJ4tMPREmXwYEeJoQJOOB12CO7nwjz16UmQ6wq2MZy3jdYzt9X9tgPb+RirQa/3vZvbYzJxQWdWtlY/ctr61DMN9BRhYuCYcJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB9536.eurprd08.prod.outlook.com (2603:10a6:10:44c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 08:44:57 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 08:44:56 +0000
Message-ID: <8f6a7a68-8fd1-43bb-8d8e-d4be7b16e19e@wolfvision.net>
Date: Tue, 25 Feb 2025 09:44:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: imx415: Add missing ADBIT1 register for
 setup output format
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250219094637.607615-1-eagle.alexander923@gmail.com>
 <20250219094637.607615-2-eagle.alexander923@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20250219094637.607615-2-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::30) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU0PR08MB9536:EE_
X-MS-Office365-Filtering-Correlation-Id: 656434e6-2208-4fdd-d17a-08dd5578ae77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXBwNU9XU05PTzRSbFhkalljdVdzU05hZXpBajRMS3hYNTQvbkc2clQzNlE2?=
 =?utf-8?B?NExiL1JrNjV2S3hBbkppM2hOZVd5d1hlTzY5eGdhLy8rWUxmUUF6WlhCSU9G?=
 =?utf-8?B?bjlablJRT2d0ODhmLzdhQXA1V3dFSy9NY3pzakI1cHlXdHBseXM3emxQZWlG?=
 =?utf-8?B?aHhMdkhYcllOOTNoeityQlVCVVBJNmR6aVY5bS81amhiUFhWSUpMVkJhczBH?=
 =?utf-8?B?d1R0dStkTk1UZ1dvazJVQzVjb21SWVNJTmtCbHh4S0U2S1lEOVpiSkJndE4w?=
 =?utf-8?B?RXZSWExmUUppYjJCUm9nYmVxTzBleXpYazRVZUN2enRQaytLTkNiU0lPSGRR?=
 =?utf-8?B?bWI3UFVwcHBhT0lwUHV3MkhRdFFrRUdYOTRlV2JRRDJ5NnVzTXV6VkNHd2ho?=
 =?utf-8?B?SGRzd1h6c3JHTjVTcVo3MGkyUW9yQnFscWRzd21wamdlMS9TYm9DS2dVR0NU?=
 =?utf-8?B?UlNpWXR4NHZEWFBwZ1NJeEppaitlOFBqc1NVdFV1Z3FuZnhxbTVEaXpYREpS?=
 =?utf-8?B?MFhwcXlkSkRtdGJadkk1ODhMckF4UU1yQ0NxOVVxS0d1TnNycjF1eUlCdVMx?=
 =?utf-8?B?TGZUTkFJcFpSdHk1QVpuQnhNSGZYYXdUMVVlUmgvM1o2U0RXZU5PQkhKMWFQ?=
 =?utf-8?B?MnNuemFQNlFNM3U2VitaZGpMU05EcnFIaUZMTWs2OUwxUWttZHZleEpnOUo1?=
 =?utf-8?B?VVVZYWR1aTMrZmc5SDQ3bzZKRVl5eVJReWplZ2Y1bGttY2l2RStBcU5OUWgz?=
 =?utf-8?B?bXFOVHNlKzRGemJxZlBZeTE4S1BES2hwUzAxZVRpYThsVXJlaElETHhRT2Fo?=
 =?utf-8?B?M1AwaHBNWUtPSkVhL2lKTGRmb0RHV3o3RGQ2anhoMnprbmxwNTVUWHk2dGhC?=
 =?utf-8?B?N21jMTJCR1B3R3VFZFdwanNQVDNUc1ppeldBamZXeDZMOWxRVjUweVdwNWY0?=
 =?utf-8?B?MGI2MlI2b3pPSEdUa0loQXhMVmEyeVVEbi9LTXBVN2V1c3RxSldmbUxhZUlp?=
 =?utf-8?B?NGxySlRPUDJlVWNkKzhpWVdQLzU0SFVhTk9BY0J0S0hTSS9NdUU0aURNeDg5?=
 =?utf-8?B?T1QrSmFXNllMUHd3alJyUHQ3dmhwL0JrTk5lcXRxQkF0bXA2TDR4Q01iS2Zo?=
 =?utf-8?B?WnJ4YlAyQnZmMy80bG85aEdBZ1Y4OVRZUW80MzROcFlrSzJMMXQwVHlxY2ox?=
 =?utf-8?B?ZUlva3RZNWdpYXNWbngyYTVlWGVWeWJDaFhXTlAwdlRrdEkvT0k3c3hGaTF1?=
 =?utf-8?B?R2sxbU5pd1ZjalZ4TTBYUDR1SStFeFZGcm4xaFE5bkxDMlhsTldVT2t6cDZE?=
 =?utf-8?B?MGk1QklPbzdUZ25aM1JWcmRhQlcyMEx1azZCV0RKQWZ6L29hUm9FVkhaa205?=
 =?utf-8?B?L3M1Rkt6WDM0eVBFaTBUM1IrMm9NNWI0MC9XQXdpc3lXRFhtSWxvdWxubVpm?=
 =?utf-8?B?NGVWMVV4NDZsR0lkNGlINWtvZ2VFNE93d3kzNDBsNnVMVjBXUW4rNHN6RTMr?=
 =?utf-8?B?WEZNSzVrR0Jkcmp5elRTSkQ3TTZwNmhzc1ZJbGZCMlMyNWZLL0ZrZVZjU1Z5?=
 =?utf-8?B?S1hMSFpYOERlald1NG0yWDU2NHdmODRvQkJUcmMxUlZMRlBrYnZ6TjhDamxK?=
 =?utf-8?B?ZWd4amg2d3BOM2RZVVVjbnRsYWhsQ09qQnpCMGJVOU0vUExXc2t1V0g5NUVo?=
 =?utf-8?B?a1RoRzZVdWY1eFRBSGtVU1FUOTVvSjRVcWxpS0pUWHdTT0RzM2k1SGFCbjZW?=
 =?utf-8?B?YmcrM0p0YXljTVVHcktiY09zVzc1WjFZbU9UYk5EOVczK3JtUjRPK3NyN1BQ?=
 =?utf-8?B?c25hVjljOG5qU0JpZE1GREcrOHRmQnJNQmJpdVN4RGxaUGduNktqYklMK2NS?=
 =?utf-8?Q?sFYd8FxW6DvTJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE1PcVJPNExuSG0vV2lTdVFZOE0xSTRTb2liWU9nbi9uZ1hWcHhxT250VGVE?=
 =?utf-8?B?eVJqZnVsN1NjRmJ1NTZpL3c2UDl6UDhsWkFESHVIQi9FODUwcmxidHgrcVkv?=
 =?utf-8?B?dWRwczgvNmxPTDRpS2YzQjFvWWNINTllMlFnNG92dGFCYVZScFJIbkMyUUx5?=
 =?utf-8?B?UnJBNDhOQlpFY0g2MDcwOFJIbnQrdTdCVEJRanF5N0wrMHYzY2xqTzFsTGdG?=
 =?utf-8?B?QmpRdEc0Ykd2c1NiRkhzZnFBNTVOMUxySFRZN1U5cEl1TnhlWDVxTEtHU1dM?=
 =?utf-8?B?NXBJdFh4MDNpb3NHTldTS0F3QVN1Q0tPcUVCUk9jTFRpaG5GVmZZelVrcDU5?=
 =?utf-8?B?QUpVU2hwWmV6bUV2NkptKzF6M1FDK3ZxbEtWa3Vpa2dvR01lREcrRU5BVmhF?=
 =?utf-8?B?YnpwMklENEdVYUMvbFNrZ1hCYjMzVjJXUkdHVkk2T1JDZ0xxSUhROEZiM1Jt?=
 =?utf-8?B?WnhkNkJQdC94NFVmTU53aXVKYzl1TXhJbE4zYWNPVHl4enBsUWE1a1B4OGNY?=
 =?utf-8?B?eExFRTNJejJiSjdDZWpSVzhRRE5ldnRnWThrbGdWU3hrS0Z6d0JYSU1SNUJG?=
 =?utf-8?B?WDExS3RqQVF1aHZkQ0xsREpXZlhvRlRyUzRmUkxLckMvYVVSeWRxdUV5WmFN?=
 =?utf-8?B?WTArbXZuLzFMRkFva0lKSVBvTFMyMjdjUHR6KzN3WUM0dklqcWp1SERlazRj?=
 =?utf-8?B?N2J1WXVGZVNnell3TW5jZmx2ODRDRG9uK0xLVGdBeXlibEZiTCs5aW95YkQr?=
 =?utf-8?B?cmxYUDZMekYzREJuSjhmMGl3VmlTd3JibThMOC9zWkRLVlZoSEw5ZUNPVmJR?=
 =?utf-8?B?QXVONzUwdnpXQXRBR0RTQzRwaW5ldUIwbGJtOWNFbyt4bzRhb1ZhbkxPa3dM?=
 =?utf-8?B?L1UxNUVCVmFUWDJidGswNGZrU1hvSzRqdnZTcEJ1RkI4d2hhbnBJeGFMb3Vu?=
 =?utf-8?B?Zmg2VFYrN09WcXFUenVVdjBJOFFVQlBWVDRmeGl0K1c2UHF6ekNEdTRmYXVv?=
 =?utf-8?B?cGZOaUhpWkhhQWhkUjQ3djBTczB5Zyt2V2FOOUJuSHpHeStwaEl3TU1RRi94?=
 =?utf-8?B?Q3M4STFLQU55WlpOc0h1MVR2L2M2OG11OUhveitsdWZZcE1OeFkwRGNGTXl3?=
 =?utf-8?B?UVdqZUxxQVVZYzNBSVdFSjA3aGVrUWF1VnNhWE80SGwxS0YvTmJ5NnV4dVJn?=
 =?utf-8?B?K3JuTFA4RTlVR0xWbGloVGphZU9GQk9BdUZ4TzJYUVgxNHVyL3N5SWhoMUpr?=
 =?utf-8?B?bTRGSVJTLzZEa1JWaHhWOFh4aVgrc3c3M3JpODI5RWMrVW5CcHFvOHZuMlVw?=
 =?utf-8?B?aktmQmlnZWRpZStqb0NQUmduQ0s5MnBnSm5lYzNLcHZSWWF0SXFZakhBNHlF?=
 =?utf-8?B?Z0RVaXBZV2xFK3FnSVBHbVR1RjZkZmljaGZXNjVnUElkaUwyMms2OG5LNzll?=
 =?utf-8?B?cmtSOXErZCtUSGMwMy9sd2RaSTY1eEt1TnpkdTRqbUdZOEJiTWNqbXV0czEz?=
 =?utf-8?B?Z1QrNUVhS3VRY1JwMmZNVnBSS1l0b1pqd0Z6NUhnWmZTNEFkMmI0bDEyZENx?=
 =?utf-8?B?QnFaUnJ4YmY3WUsvbzBYdUdIWjdsRVdNVXVjTVJpODdHc1pVVU9xRWIwWnVQ?=
 =?utf-8?B?WEFtRmdMSUJaeW85MGYxbnZldk9IUVhrTGJETWFVQiswVVVMUGZ0M0FEOGY1?=
 =?utf-8?B?ZUZYYzF3K3dlN1ZvVUZXYXA4eVFxd0hvVnl0aHNwUkNEZlZQL3F1dC8xUlpR?=
 =?utf-8?B?MlpZT2RrM29Bc3gxam0xY1VpQ2FOc1Voek1Ma0NNZTIyVHVFb0ZCc3BPUUwr?=
 =?utf-8?B?QlVYOGhpWGMzcnBycmtjcmVOdlhOOFVUdFhJTzcvME9NTkl1Uk4zbWtoUmJF?=
 =?utf-8?B?L1RtSEJkazk4MS8zZGdVM1FNa0p1b0laVE1ac2dFUm94ZDVMWDN5bkx0cGcv?=
 =?utf-8?B?MXVFdnMvU29xTEx1MVl4OHdySDMyRGZ0SWNWUEUxRlBBOVpXMFRBYzlRbVhq?=
 =?utf-8?B?OVMyWmNVNHpwMUxzdWN2U21sOGtzeDFEVS9TVE5reG44bjdCbGlPN1dET0dJ?=
 =?utf-8?B?M1prV3psMFNISGZYOHlPUXdNNEd0TWhKVEl5by9vTDBTOGxHQW5id0dnd1Ez?=
 =?utf-8?B?V2EybTE4TEZpbTQrL0h6QUlvNjRBVFU4VVE0WHY0Vk12Z1ZIS0cvVjNJRUFk?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 656434e6-2208-4fdd-d17a-08dd5578ae77
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 08:44:56.9408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EALiVHmwUudE+86nTEnAKF0MD9Hurd8mqrHeF2LTsROKjxdeQTWFEkf0+Q9fLpqBOYOVsK6JOfDoyXmNCRgIma+5rn/W5twCM0rCjBjuS+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9536

Hi Alexander,

On 2/19/25 10:46, Alexander Shiyan wrote:
> The imx415 sensor has one more register for setting the output
> format (10/12 bit), which is currently not in the driver.
> The patch adds it.

the Fixes: tag may be justified here.

> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>

Thanks and best regards,
Michael

> ---
>  drivers/media/i2c/imx415.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 16a52900c61c..c5beba4da18b 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -77,6 +77,7 @@
>  #define IMX415_INCKSEL5		  CCI_REG8(0x311e)
>  #define IMX415_DIG_CLP_MODE	  CCI_REG8(0x32c8)
>  #define IMX415_WRJ_OPEN		  CCI_REG8(0x3390)
> +#define IMX415_ADBIT1		  CCI_REG8(0x3701)
>  #define IMX415_SENSOR_INFO	  CCI_REG16_LE(0x3f12)
>  #define IMX415_SENSOR_INFO_MASK	  0xfff
>  #define IMX415_CHIP_ID		  0x514
> @@ -581,6 +582,7 @@ static const struct cci_reg_sequence imx415_init_table[] = {
>  	{ IMX415_REVERSE, 0x00 },
>  	/* use RAW 10-bit mode */
>  	{ IMX415_ADBIT, 0x00 },
> +	{ IMX415_ADBIT1, 0x00 },
>  	{ IMX415_MDBIT, 0x00 },
>  	/* output VSYNC on XVS and low on XHS */
>  	{ IMX415_OUTSEL, 0x22 },


