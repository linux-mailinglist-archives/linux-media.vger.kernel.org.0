Return-Path: <linux-media+bounces-43141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A4BB9E760
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 11:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2CE3189F8FF
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 09:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1122E9ED6;
	Thu, 25 Sep 2025 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N/5OSj1/"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBDE283FEF;
	Thu, 25 Sep 2025 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793376; cv=fail; b=Zrer1IHEYd0rWV/505qug6XqwAJ045vMEsw57rtoIkTb2BQByL7l0fnT9uCiZQLF2Bt+0OLSRkt7HVdTZ4z4XoLshQAbr0OwR6nI8lXYld1lhvYm1s3mqbDp5lzZJq7uMJuyYikat1G/NjMQ/7P4W82Xp/jOPcijb0ud2QwRanw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793376; c=relaxed/simple;
	bh=iQq1nqZv3dM9excvTtl0+dCZfsaK2vAhhw8if9gjx88=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YyeDDPAJBlFsW0I1dl9b6b2tB8ViDTmUEQiIyI62luPsBSt73v7Q1ZO3G7NVzgctnRX3FJCLX3NQMAdQSEIZLEiXuCx2DzmylIef90/E5zI+zwnKl1QrhPA2+3z2embjhXANLu0XrxJ9hlTzGZxB9cmDG6lejTxp8bBiMBukvyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N/5OSj1/; arc=fail smtp.client-ip=40.93.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS2QGSkTgCfVjgnQ66AsrsdA3F0wSshud3uMv75FGOMplhaoYruBXGePMi2LxmFM1tfncUxNRk3IAiIOLkVdWzeMEYuQaAuSWmJiUtmk/Q2RGojYzT3bJXJdZHTErvc9Gg/+KaXxudqp3hYxt8hUql1wYDBc5H2gVJahznNiyK247MidqTOsv3fbHqWiXDAj7BbkkhFFtgQ/8793nBcfViDKWP0qFP3qDHp03Y9627neEjWeNjbsTGUxXO8r47AYVfgyQGIWON9qgMR7VsyR9LvBBUHgAVnXotkFvpED+DZflIoQbuvZ3H0hOwKq1Itm5vKpKCQYD0F63nVm9j+q2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jp+yblrm21c+FNlAaKtHkET3n5VHKGra+/uwKCDg7KM=;
 b=MJtEnjC524J13ujS0QizhoyC7009OcGBV5UXfdo8ATpbkMvW2O4eyXTxLSzF7xJvxzJsolLtNOHhxTQW3B8o5uuwv0whiCuVjS7J9m7InjIcOd5sEefi6+08cwjxFucIBt4b4MNohh9iKjmN30rHDaq97UG5Dt52zw5yTGE0pEg2Iv9FlaDKCg0ANBwAMhTbZtufd3AN3QiKlDiAERJnRfWArRrvtIRsmqDDZwv47eigKE9TCz0u/tqlT7pUqqcjE1FGoJ2VMVN7kf5Gc49PaiFykQ6brZTdCdt9X9WLd84FUes5eVMmSfMU6KwcMEdvfm8IojdHuLu5sHYBjkj0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jp+yblrm21c+FNlAaKtHkET3n5VHKGra+/uwKCDg7KM=;
 b=N/5OSj1/eGvur0N/+FAkSxQAnDcAr9tAv3xFtRdT6sBA6BS1vgLFuHPMkg7J0cYzY79eLkJNGIWs9pdNJSVh//fhxJHCpvu47gjQSQBVyYjjNdl0HgpbhdMwVSC1bsFjgtClXpY8il0K0KloV3m2Wy+AJiZXN8ycaM6rsejmLNg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB5829.namprd12.prod.outlook.com (2603:10b6:510:1d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 09:42:52 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 09:42:52 +0000
Message-ID: <2c70e54b-bd10-46df-8d93-71708ad3f3bc@amd.com>
Date: Thu, 25 Sep 2025 17:42:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] media: platform: amd: Add isp4 fw and hw interface
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-4-Bin.Du@amd.com> <aNB0P18ytI1KopWI@sultan-box>
 <df5f52eb-0480-4d59-b930-e8336a993831@amd.com> <aNOZM2fj1X9TfZSF@sultan-box>
 <2f6c190d-aed0-4a27-8b20-1a4833d7edf7@amd.com> <aNTtLHDHf_ozenC-@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aNTtLHDHf_ozenC-@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eba3941-10db-4d5b-88fc-08ddfc17e530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3lCdHF0QUhrOEFjaTBlZnVyTGlIUm5xdXVVNFRpRXdrU1hMa2FrY0xPN2RM?=
 =?utf-8?B?cnRjUFpySWdPa2hkSjF4bFJUNGFDYmY1S0ZJVWVtQUxuVVBub0VFWXIwNSt6?=
 =?utf-8?B?RVhwa2J2WWxSWStQZEwyZG90c2JTeXBweDVlTytXR3EybFE5VFBTQ0ZYL0JW?=
 =?utf-8?B?NSthcEMyZVlHeDcwVDEwNWFzQXVUSWZWaHdBd3RjQWxuWTFYZVY0RXBpYmwr?=
 =?utf-8?B?OWdDYys0ektwUE9abm93T0UzU2Y4dFBoeE9rY0t6c3RPS3JIVTZCaktFZWZj?=
 =?utf-8?B?MzNzcjQ0eXByMXpucWsza3ljbGorMHJ6MjVmLzFNb2MwOW9FRzRCakhKZ3N6?=
 =?utf-8?B?L0RlaWNOT3lhNjdxTWdyeWxuRGVYTGJ0ZkxXeElHdTVxaitFZFRrVFJWSkgv?=
 =?utf-8?B?TFQvbGFOMUpudmlYbG9kclNxWENmd3FNQjlsZ1VKT2N6MzVXdUoxUVZzeXVR?=
 =?utf-8?B?eUgzS25zcHB5WE42Y1dwamFZdGRVNHYwOU8yNitucS90YTZnUFpncm0wUllh?=
 =?utf-8?B?VnpORzAxeWlXeVhRYUNpT2JWZ1lrMnNIU1Z4aUl0RHRpNk1NTm93QmJVZ0pv?=
 =?utf-8?B?SzhvcXpwTXVPbUFzNSs4c2VQZVMwMVF6UEpIcVIvNG4zeEFRQ3pyWWp3M1pv?=
 =?utf-8?B?YVZVZDNRUXJHUUVXK21nS1MrdXArOHlyL1ZPU21EWlRQY2IrejgwZlJGWDNY?=
 =?utf-8?B?R1YxKzl4SGJIbS9DRHJPaUpzWU5HVnVCWHVvVm01aW9xQVUrK012dytDb2FZ?=
 =?utf-8?B?RHdNdTdnUzd0dzJCR0FmV0VlNkRzWm9GMXl2VUduVUh4QXB4d1U1aVhhcnZx?=
 =?utf-8?B?azBnamhkZUpBTGNkWE5MTlJ4a1ZpRGxtSTUvRzVYdkR0TDJrRjRzRHNPekZw?=
 =?utf-8?B?Rk1SczZXYlIxTFVnYnhNckFzZEUyYzUrNUNINTFCZTZjdkY3dWVHWGIrM0pk?=
 =?utf-8?B?SXFrUENoVDZtK01KNExiSjZ6RnMvYTBOMy9jWnFnT2IvQmdmSkM5OG00Sk1J?=
 =?utf-8?B?WVI4UEttTVBXVENQWTZnQjIrQWhEQjBPR2kxcVk2NXNwNUlvZmZUQ2pMbSt5?=
 =?utf-8?B?U3pQZzBUekI3NVIxYndDWW40cW9sbzlRNXBmNUFodnZTdFI3TnlJYlo4UnQ0?=
 =?utf-8?B?TFRxOGxJdmJhM3M5dVVMR1h2bWJJMHlPcUdoNFN0eHJzVk9heG9wZUoxODBZ?=
 =?utf-8?B?UE1zYUhLdjgxS3Qwc2RrR09xWXZJSnVIUXl4UjlRSGE5c2lRNDZESnp6ZHdD?=
 =?utf-8?B?VEpVN3NCS3d5U3Z0Y3NmUmx3TllRQXJZbUJEbjJSZFZsUEx1eU5rRkFPaG5r?=
 =?utf-8?B?YnJ5WXZ1MG10SDF6ZDdMa3M2T21yaitYZlNLS3FKTFR5UUg1VVBIZ3NiS1RK?=
 =?utf-8?B?TnNvZHRjSUlKTmJjK3NkaWRYM2RkQ09BRitMMGdacFppNzE5SDVzQ1hua2RM?=
 =?utf-8?B?bGZxbEREd3JQZkhwaFlJQmdXSWMzemxiRDdUc25nd2RwcGhRRjFOTVJYdWlU?=
 =?utf-8?B?MnlnVEZJNUgzZUkzUGQrYVhIOWJJU3RweDdVNDNmeStKek85UFlIQWQrMzM3?=
 =?utf-8?B?Y2wwVmxrUGRWREFJR2crckhkWWpJd1dDOTRZL1dnS29uRWlhRHY3UDVRZGZa?=
 =?utf-8?B?WUpTTkdTYlZiRUkyNUpXUjg4UTFnYVV2TG9WNllPaE5veEJOM0gxWVFOYlJw?=
 =?utf-8?B?T1RJUlBYYXpzbTh6WDZUWmordS9ZNi9BTWMrS1N0cll3NGRvVjAySjB0Wis2?=
 =?utf-8?B?QW5YMjkxT2ZxV1ExZ3UwTHNYMWY5Mjk0cjF4MWZsMTJ6a1o5dFRjM0xnNFVB?=
 =?utf-8?Q?GEdduSoR0dOe5ppKPPGzjWw8+uuyWMhUVWNsg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDVpWVNIZkR2MzhXM3RnK0dhUUloSGp2dUh1cmJxRUEyZ0VHbHlZanhZZWNw?=
 =?utf-8?B?ZGEzMnZ6RDNjbk9qckxZdzhScGRxWXhpcTdUMU12YnhDNjhRUjVNWWkwMkhx?=
 =?utf-8?B?NDNRMWd6Rzk3RHY5WlprMUMvd3hLRk1VMHd4YU8vc2VSNkoraW5uSDNxRUlF?=
 =?utf-8?B?SUw0SGp0ZXdMZnhSbEVSUE9KTDdaQjlQN09YUVJGazB5amJGdjEwdkNNU1Mx?=
 =?utf-8?B?M0NIeTg3b0wrZ3RWWlBKWDNuaUNXQ3RWRm9LQ1hUL3d0Uk4ySjNkaE1hYjV4?=
 =?utf-8?B?SVpVQmREWVlJSWNkQmNRbjVEWm9mTmhleExQZW03MjJPSHFnbFk4eUZyUHRr?=
 =?utf-8?B?ZFBvamRuOE9nT3pwbFNIVDRTSVlRS1hSVUtVVkpxelN5cXFObU5VWURIbVZ2?=
 =?utf-8?B?YmNtemc0RlhacStJcHpBV3Fyd3pXcEN3OFFic05iWUtqL1ZuQW14Q0NCR21T?=
 =?utf-8?B?UmZqeDUybzJMSCtEbHNzQTJ2L3JtUjBHdE1LamlYcHZiSzZJQTB6dnhGUEpz?=
 =?utf-8?B?MXJaeGZ0MUtwWnQ5anphcFFURHE0TStZNG1xOUJaNlpMaUlBTUJzdUNjcUV4?=
 =?utf-8?B?enJBZjJJMkk0YVIzWTNaZzNpaW1GSFVVN2NtZVAyNElTM2VWbE1WTXk4VjYz?=
 =?utf-8?B?UFovdE81VDBEalJIWU5KdkdMSXhXbHN5a0tOVTBSNVM1T0p4NU93TlFVc1U0?=
 =?utf-8?B?WFErcHpyN243WFhERDJXN1dXVjZBaFNPVmdHUGtQb0E5ZTJESTJkLzhsQ3Y4?=
 =?utf-8?B?QVVVOHJjKzJXc3p6bkY0dkhsNW5Mc0RHSkRhWjZsT09xUjUvbDM1QXdEZkda?=
 =?utf-8?B?MDNjVTBuc1FFenJkNDY4Q01OczNCeGpHSEdBb2NYeSsvOVhnOGNxV2tSbjFq?=
 =?utf-8?B?NWpFTnNnN2VmNndtdjNteGNDenpXZVhYVWhIdzMwa3ErZllnNkhtUEhPemc3?=
 =?utf-8?B?WGFNb1ZaRUc3Vm1jQzIyZzFsbjVWcFkwQ0gzM2drRERsakV2bU9TUHlFOFJE?=
 =?utf-8?B?dm81M2NGemcxSUU2Rkt0akhseHY2NzlzdS9ZQlBxWTZHN1NzZ0tFUEpvNmxm?=
 =?utf-8?B?ZjY3NEVFZG1VZHlvWHNvMExlemtlaGRlaWhGK1NIakN0QTc1azkwbHVQY0xH?=
 =?utf-8?B?OUxEMFNOdkVZd3FCTDkvbWlUVGxMZ3h2dkduYUttTllFZlRFUGQ1N1YyZ0Zl?=
 =?utf-8?B?bENVbGkvckpUbEVCQzRYRldaQnpObC8yYmxFay80UFp1eUVWNmNONEdIZDVD?=
 =?utf-8?B?ZHJUaWdjU2RJNFFVdkVmcTNPZDJreTRWM3hpTmRuRlhraUIrMzZLVXFEYUJP?=
 =?utf-8?B?cTl5TDZidU1aUjg0Sis0Rk54WEFXZnZrQzd6UEVyYi9JZlQvKzBMY1VyREln?=
 =?utf-8?B?a09uZ2cxNUt4TmhteUNUcVVSall3SkMzT0M1SmU5N3B5ek14RmsrYTN5Tm0y?=
 =?utf-8?B?QWR0cDNod0Z1YVJFd1B3Z3BhUC9oc3FwYll1cE5MUlBDc3dxLzJWUGJmemtC?=
 =?utf-8?B?bXdZWjFjWm5zWE1PaHlBUldVdnpqZGozT25maXNaQ1NjeFRvSlFqVCt0UmhX?=
 =?utf-8?B?bjJINnBRZUR6Mnc5MWFWLzJDUTBUZTFKcFpId2FFWVdQREMrN2RTc3BTWXNP?=
 =?utf-8?B?WGxmUE1yYkFYRGU2aUw5bWY5bjd5TWt4aGFVR2xSNUlXUUNOWEVsYzlSNlIv?=
 =?utf-8?B?b3RzT0UvNVJNY2s0SzJLcnlseFZkaHhVMHdlTGlLc1Q4QTc4VjdFcnRPeUQr?=
 =?utf-8?B?aVp6UlVkMmFJb2srM25MWTZHWHBWSm1FbnI0SEIwTzl6L1dmbXZIODFWVHhj?=
 =?utf-8?B?cFNkYlptdmozcFhoSDRTUngxSmViNWU1SFNGUnVHbUpBU1NIaFU5MjBRK1c2?=
 =?utf-8?B?b25qVjNyWnR6M1M5Vm9aK1JNMWdPbmxhRDVKcDFrSWk0NzVPamZieGVTNlho?=
 =?utf-8?B?U2x2bFRKdUd6Tmd1UnVsSWpORHRGMkhmYUxtdC9la3RXajFVeWZHMDZ2Y0J2?=
 =?utf-8?B?SVNCckp5WVZZbW82WTZDMFF0N3dVZm5UamlmN0RrWUhPeDBKTXlic1QyNm1s?=
 =?utf-8?B?WG9DNWQrUlR1MHZoYTlTU0VybSs4SFM3eDlpbEMwSmlpZ2ZLZmsyVjJMY05l?=
 =?utf-8?Q?QB/g=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eba3941-10db-4d5b-88fc-08ddfc17e530
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 09:42:51.9681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhLv7BiqtfDduUUiXvXPHK6Bm2NeuBO5Te+obcdSd+ds5JmZeVmMdnCymAEP4pkq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5829

Thanks Sultan.

On 9/25/2025 3:20 PM, Sultan Alsawaf wrote:
> On Thu, Sep 25, 2025 at 11:56:13AM +0800, Du, Bin wrote:
>> On 9/24/2025 3:09 PM, Sultan Alsawaf wrote:
>>> On Tue, Sep 23, 2025 at 05:24:11PM +0800, Du, Bin wrote:
>>>> On 9/22/2025 5:55 AM, Sultan Alsawaf wrote:
>>>>> On Thu, Sep 11, 2025 at 06:08:43PM +0800, Bin Du wrote:
>>>>>> +	struct isp4if_cmd_element *cmd_ele = NULL;
>>>>>> +	struct isp4if_rb_config *rb_config;
>>>>>> +	struct device *dev = ispif->dev;
>>>>>> +	struct isp4fw_cmd cmd = {};
>>>>>
>>>>> Use memset() to guarantee padding bits of cmd are zeroed, since this may not
>>>>> guarantee it on all compilers.
>>>>>
>>>>
>>>> Sure, will do it in the next version. Just a question, padding bits seem
>>>> never to be used, will it cause any problem if they are not zeroed?
>>>
>>> Padding bits, if there are any, are used by isp4if_compute_check_sum() and are
>>> also sent to the firmware.
>>>
>>
>> Yes, this will impact the checksum value. However, based on my
>> understanding, it will not affect the error detection outcome, since the
>> firmware uses the same padding bits during both checksum calculation and
>> comparison. I apologize for the minor disagreement—I just want to avoid
>> introducing redundant code, especially given that similar scenarios appear a
>> lot. Originally, we used memset in the initial version, but switched to { }
>> initialization in subsequent versions based on review feedback. Please feel
>> free to share your ideas, if you believe it is still necessary, we will add
>> them.
> 
> Ah, I see Sakari suggested that during a prior review [1].
> 
> Whenever a struct is sent outside of the kernel, padding bits should be zeroed
> for a few reasons:
> 
> 1. Uninitialized padding bits can expose sensitive information from kernel
>     memory, which can be a security concern.
> 
> 2. There is no guarantee that the recipient will always behave the same way with
>     different values for the padding bits. In this case for example, I cannot
>     look at the ISP source code and say for sure that the padding bits don't
>     affect its operation. And even if I could, that may always change with a new
>     firmware version.
> 
> 3. You can ensure more reliable testing results by guaranteeing that the padding
>     bits are the same value (zero) for everyone. For example, if the padding bits
>     accidentally affected the firmware, some users with different padding bits
>     values could experience bugs that you cannot reproduce in your lab or dev
>     environment.
> 
> The only way to ensure padding bits are zeroed on all compilers is to use
> memset; using { } won't do this on every compiler or every compiler version or
> even every compiler optimization level [2].
> 
> So I still believe it is necessary to use memset for those structs which are
> sent outside of the kernel, in this case for the structs sent to firmware. For
> structs which are used _only inside_ the kernel, it is preferred to use { }.
> 
> [1] https://lore.kernel.org/all/aIclcwRep3F_z7PF@kekkonen.localdomain/
> [2] https://interrupt.memfault.com/blog/c-struct-padding-initialization#strategy-4---gcc-extension
> 

Thank you for the detailed explanation. Your reasoning is both 
professional and persuasive. Will switch to using memset instead of { } 
initialization for structures that are shared with firmware. 
Additionally, will include comments before the memset call to clarify 
that it is used to ensure all padding bits are properly zeroed.

> Sultan

-- 
Regards,
Bin


