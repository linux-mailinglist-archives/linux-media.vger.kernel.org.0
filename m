Return-Path: <linux-media+bounces-14927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C967F92E832
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 14:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5317A1F26D23
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3FA15B964;
	Thu, 11 Jul 2024 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="lxMh/MYU"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021101.outbound.protection.outlook.com [52.101.70.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A9C14532D;
	Thu, 11 Jul 2024 12:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720700531; cv=fail; b=soTb3vVxRV0aH1Fi6nkAWLO7gtNRqm1Hxhwi+P2sSIV7hmwhOn3YhNDeEfsK5UInyyt04ffiEYWjGSr4Ss0HqAw4I7OpoZaCtZIYh5+T16fsT/C/eVaJ81B1sswm/97RpDDA/jHnGCRl9tIQvpbVmeLSsfaCnNEfnjuCjA06rXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720700531; c=relaxed/simple;
	bh=fkoL/27VST4GsanAn/SUkLPt7ogL6ZDZH/56cW1H1RA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hZKR+t4RoQBw4NN19XJn9i4xBy/3m93sUZ+10hRWl1qZUvo2fpxrMIr0y4fM4a/4BiJcvbz7xLQsZyixH1es9Tln4b8EhWM2n5hd8YH6LQNlgHNP/BCviaMZ/UGHDVCPkeITDsWcb6uS2r7D/+mkDcKTZcIvseEYExv1WTJoU/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=lxMh/MYU; arc=fail smtp.client-ip=52.101.70.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNiiVfKxwQyyeefSfVXH3Y4Id8KzOSn9Z7WDcpFMJ+7eXWw87zwp0eqWhqTduKlaIdvSX/HkOSKOrhkgC4To8QJrXm2+QnYX8FSyBgLLjywQvlcqlqcysNosk6p4kQVpsDLDB2SIMQhL0bD9FiCwtAvC5b04cm5xAce9P6F5Z/xZKDixVFsCE+TdCd4oIy/qJxThMbi7+9Gq1Xmiy9J/PMduPOcme2Ljy9VbajGEZDPDJB7SlrQpYX5IbinSc3gW/T6lX7JK0q6FLUBBGuER9Knof27vcTV7k/a5a3z4SnoE0dZ6avrRQOtU7p3fYcpwNZFhVG7b/ln5jwnAidFZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdrV4AB9WNLxo9jW9KchqVyvB86KjqZMbW+7ltRrldc=;
 b=ErzhcywtHOyK/mE0xPEn+BGaqJUbTb6luNA7tPrWh05G8iVHiDCgH3OzJ0IqlHaCCb9JC3SaeroTcg0KaKBRhMw1UndGmFXzm389Qb3fMICZfziciImW1BjKcYMXeirsRn0CTSYQqwLLepgyv5CUrjaHq+vw3uyGxlhChouOHcXqhR/TxLq3gv0MjzKdWyNChbGgmLZD3NDOXT1ABvVwHEJyRXlsVM+h2VYAxZWdpm/Jc5E3gbySJzOB2rNzKbGaW7Js64v9ONilnxpHEiQr/4J1izUlJV4p1PuFd24CJ6GQkX59wcbFj72W4ahlL+4OxrAphtHwHzv5Y5fOCHaJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdrV4AB9WNLxo9jW9KchqVyvB86KjqZMbW+7ltRrldc=;
 b=lxMh/MYU5Ot4gMO26Sf8ORyD4rSfW4sdCvFY74m9kOixzvuMVqMz3gDUkpAQ3MWqVIE88MuWgBr/4iXxP0P0VtEc3CIFdMD4t9bceDRk7W7GIBXzdbtg+MnuONg/5buV/fAn82fbNTZzRPyV0AhMnTCnL5DabdLyyCpqDSV9DHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22)
 by PA2PR04MB10213.eurprd04.prod.outlook.com (2603:10a6:102:401::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 12:22:05 +0000
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8]) by PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8%4]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 12:22:04 +0000
Message-ID: <3646cd1f-09f1-4e80-8d55-a9ac25cbf81d@cherry.de>
Date: Thu, 11 Jul 2024 14:22:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov5675: Elongate reset to first transaction
 minimum gap
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dave.stevenson@raspberrypi.com
References: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
 <20240711-linux-next-ov5675-v1-2-69e9b6c62c16@linaro.org>
 <fcd0db64-6104-47a6-a482-6aa3eec702bc@cherry.de>
 <aa20591f-3939-4776-9025-b8d7159f4c63@linaro.org>
 <1051b88e-d6af-4361-a4de-95a28ddfad69@cherry.de>
 <078e3274-f592-4ce0-a938-d58a0f88cf84@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <078e3274-f592-4ce0-a938-d58a0f88cf84@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To PAXPR04MB8912.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8912:EE_|PA2PR04MB10213:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e133f6-5704-4ef4-f126-08dca1a41322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0ZaZit4bWE3UEhzT1poSEIzQ1BPak92WFp4OW44RU0rWU5GU0VGSm9peDVx?=
 =?utf-8?B?dkxjdGUzOTVEMHF0WG5hdXgxZ2l1aDVubDNVa2UwWXFXZEVZcGdlNDJxRG1z?=
 =?utf-8?B?MGRyTjd0MUlxbzZHY1NSOVNhUXdKNFp6QXRHdENlNlJ0ZkVvNGZVb0NEbGg4?=
 =?utf-8?B?QWowYytRK1VraDVlRHBLcGNTc1lMcURka3QralVFaUdHVEtEM0dVSngxVUtj?=
 =?utf-8?B?VXJXQXY3WDBjRDg1dGFxQzFMR1ZSVUk5VW52T09tRkRoeFVtNlZ5QUJwcVhH?=
 =?utf-8?B?S1RpalRkMEI3UCtadWU5L2tUUVhiTk5Iek43UFB3eTZ0eGg5NERHKzB6bkdH?=
 =?utf-8?B?STlvLzRoSFY1QjlXaHducHlMSHlRWWtWZnZCNmJtZFY4MlhRclE0cFlMeUll?=
 =?utf-8?B?VjlYY0pCSmFUajlXL3lLdWs4YUtzL1IwbGcvU3hJU0NwUXhaTlQydmhNbk82?=
 =?utf-8?B?dktmVTYreG9udVJTQlg3NlhERW9pWDJ6VVNoTjhkbkFtZml4cWpJTE1YVGZX?=
 =?utf-8?B?VEkrT1FXRGZULzlpNy93dlpkWW0wOUdzZStqK0N6TUYvQS8zRlBXR2dZd1F6?=
 =?utf-8?B?eXdyS29PWFZBOERSenVxVzl2eThZOGZXR0l0TW43Rk1QWld0b3FEOGJwZDZq?=
 =?utf-8?B?VGo4cGF2RTJjWWpBNE9hZitudURIdTNBY3p3WUNDVnZPd3lpMzRoZ0FmcnZs?=
 =?utf-8?B?M2pCa1Zja3BUdWVKOWhyY01aWUV0OFJXeWlJM283REJRYjY3QUUwRTkxYnY1?=
 =?utf-8?B?enJCRWlGdTQwTUhxUWVvRXMwejV4TnZHRTN5Tzc1OW5IaFVESTlZR094dmpZ?=
 =?utf-8?B?V09kVVFEVkl3UXhLY1BUb3FIcFBNMzd4RzhsZGVyc1BrcnVQc2g4azRXQlBD?=
 =?utf-8?B?bTFJR1AvclV3MURLdjhreTJadE1sTG0xSEpUMVFnNWhMY1BpSStEalZaNDlX?=
 =?utf-8?B?a0xCb1VNbGJKbkdDQ3JYZ3gveXdlMGQ3emh3MjhQYm5lRzZRanVESnBLbWNI?=
 =?utf-8?B?S3l0SVd6bjY0Mkg4cDVTS1ZpckpUakN3bEw0bEwwMGwraTRySjhLaEhKcStx?=
 =?utf-8?B?R2dVbkhLR1YxcG80WFZMclE4WXJVZnkwVjd5SlVlWm1qcmtRRjJlRjdsY2Zx?=
 =?utf-8?B?Qk1WMExnV2xWSUlzaXkzdE00WEtDZFphREdtVTdYalowZWY5UnJBRE5kbkxo?=
 =?utf-8?B?OTk2Zk1sdm8xUkhNU3I0eGxqVFE2azJUM3FqODN1Ri9ucjRTdDlMRHJWSVZN?=
 =?utf-8?B?Zk4zYTZsUldiWlNhdnNRejEyR1Bweno0bVFkMFUvY081MHN5T3h3anhIVk9u?=
 =?utf-8?B?SkFsN0E2T0ZMUFI2Y051ejg4cENJRVFJRENXemhpMnR5TTVSWG0yc3ZkYnpv?=
 =?utf-8?B?OUVCdlAyQkZKRDcrUktCa0hVTWpvSEVhTmNJbXJtNC9qcWZTK0x6QTBKS3l1?=
 =?utf-8?B?UnZWVUJiVTdGczZSUnRBQ1EwL09tbnU5MWpmeExSWjNZRmFCRGRONVkxSUtC?=
 =?utf-8?B?TTIrbE44L0JXdXU4dTdZdWp5SmJiMy92ZEdXd3JFRjVjLzExWTIyNk9RRE1R?=
 =?utf-8?B?cGs1bzlnTndndFpyMEMrNGxUYjMrTng3ZzJvSC9RUkw2UHhxUlpIaVhGWDl5?=
 =?utf-8?B?dENaM1JvOUFTWGpPZ2pqdkdoTFZ1dkVFM0ZwNFRidU5HdFlVZ1FKd0hBd2tp?=
 =?utf-8?B?emRoRkFMeDZIL0xmcTMxNHpNVWljSnh1N04xMlRDQk9zU2poSW1PK1prdit2?=
 =?utf-8?B?NGpyZjkyOTYxdUNjeUtQekpDNW9GdW9XRHVoaFRUUURoQWJPSThGQU5LRk80?=
 =?utf-8?B?Wnh3MXplMDdiU3luOWZHZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8912.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alNIdWp4TmlmMmNaSnRia0VCQnRSTkl6RG0rTlBVL3MwakZ6R3JsbmNzd3JB?=
 =?utf-8?B?ZkVkbWlrcWRxV3FBZFFEK00rRmI1UWdPTnNPbkJyUjNoYnFwd1E4NUl4RlNN?=
 =?utf-8?B?YjNxSW1lSy8zR1lWdy9wOHVROFhBWWhSZWFBNG9pOURnaEZLWkNla05QT0dD?=
 =?utf-8?B?ZUN5S3c2S0NyUFVYVG5pWHBNckJESkI2c1RYRy9KMHJnT21Zc0ZPU3hvTjgx?=
 =?utf-8?B?VlU1VVozSUFVcTBoaVRrWUVGUTlkSnMyYURHaHB3Njk2MXBMZEdFbWowbHFT?=
 =?utf-8?B?TWVDcTNkT3oxR0J5N3dPVGRMcU1PV0dha0xaYk1BWnhadjA2dFpvS05OQk9K?=
 =?utf-8?B?OHhEcVpObUFPZTRNVGYzUUtJMzk3dFZpY1Z3WUZ3eGNIMjFiWGdpOXNaeExZ?=
 =?utf-8?B?anc1YnBjdGc2VDEyTDU1WGxHWTFWd1JHUHlSSDhYMkgzRzFsVlpwUlNJU293?=
 =?utf-8?B?S3FyZ1dHV2tRQ3ZKcG1ZdlZPR0FtdjdINDlZMElRNnBhdTY0TGErZDFic1RV?=
 =?utf-8?B?QUpwZjVBVlorWis3d3lZVklnamx5d2t0dTBINXhUKzNDWEdVMmcyMkhsdllU?=
 =?utf-8?B?enAzSlR5bklxSDhITEdBMGR1RkhLZ3dtazFSZWpBYzAySWhmSnNXa1pzWStv?=
 =?utf-8?B?ZzhwQVRULy8xb3ZWMEo1dnM2WHNZd0M2eG1TS1hSMGlFMmxVUCtnRVVNNzVm?=
 =?utf-8?B?aHViWmVyQk5odGJQSys4R0lIQ1JTbkdueExKT1k5RVdMemJvRGt0UnRYaUUw?=
 =?utf-8?B?VmQ5WVBoSWpDTWthdGVlTkpZYWQ0VGFzejQ2T3ordEoxM2x0MVlFTHk0Q3hT?=
 =?utf-8?B?S0o4aVJrV0lLankyOVZveWxrdy9FL3M2Y2YxM2l3M0VZc05xakdFL0Z4b1cv?=
 =?utf-8?B?M1o4TUZKblFzd2VkS3hrUlYrci9uOFBycGRaR283cUtXdTFCS2VmNStBWjc4?=
 =?utf-8?B?UG8zcXREYnV5T21lUnVrVlpDTXJaeUtPeFA5V1VjbUFNNmZHMGY1L0QrR3c2?=
 =?utf-8?B?YVEyUzNKeXZYczZ5RVNTaFlLaWFCVDN1aHgrdDJXMUo1M3BERkc1UVFqT3ZK?=
 =?utf-8?B?amJQSHFuZkFaOHZkcXRSZWJzYkRnT21tcXBMejYydkI3ZzZLQ1p1Rkk5WjdV?=
 =?utf-8?B?OHhKOE8yRXh2VXRLQVY1OWJpRUg4N3VzT0FIY1c1YWxaOW1BUE5lYnQxaWs4?=
 =?utf-8?B?aXZ2WWpGZDAzenlGRTRNWG9RMFA4dWlKbEFiY0V2cmIwNG1uT0dzY0NPT3Zp?=
 =?utf-8?B?Z05Ec1JBcW5vUUZ4N2hZN3BLMjFScVVjNTl4di9XaEVzbDdXbXQ0N1g2am16?=
 =?utf-8?B?MnFQdHM4cE5YSjdFZzE1MFVOQmc4QXBFWFMyb1ZDY2NzdDVsTExsT2o5WVRX?=
 =?utf-8?B?Zy9hSFF0WFZTZVdhbnFZU3I2MHZlQ3JiOFU4SGU2aFJPb2FGZnVUTERmRnFz?=
 =?utf-8?B?bWxXcTNGZGhTUDM4cVZQanlnMGs2N3ljTURDSVZTVFRrL2dVd3pqVEtVeEt2?=
 =?utf-8?B?dkJuQWpiZlZDWEFYTFJndkwyaFF2bVpNSHY1Uy92VjNzbFpwdWpqUGpqNjVX?=
 =?utf-8?B?YnJXTUs3YzJRdDVjaFJHS1BPOWJzaWhTc2Nlc1RKa0pZenBkd25aNTRWcDVs?=
 =?utf-8?B?WDRDdnF3MTVnYnNFYkpzNk1VRlBLVzR6M0s0M3dBSmFNbno3aXNVM1RHNDJ2?=
 =?utf-8?B?cnI2eU5PSzIxSTQwb0lNVFpCalM3SDZCM2lvQTZwVFA3bitOTzFIbGYwekRZ?=
 =?utf-8?B?bjJnL1JNeGhWZFozSlBFMGZsU1hVWVdJMUFwRUV5QTI2RzhVUDZFeVNucERS?=
 =?utf-8?B?M1o4emJVeWFISit5TmlLRm8zRXFPUUlkLzFJd0FITWJMMWIzTTJobWRHYjB6?=
 =?utf-8?B?cnIyTGtyUWZQdUpDQXh0RDRJNWxOdWtleDBWTldkbnFZWUZBTHkvUUpRUmZk?=
 =?utf-8?B?RmhscFA2eUhKTi9aZU9DUmJPMzdZVHRsYmxFdzNKTHUzV0F2ZHhLVlRlSzVo?=
 =?utf-8?B?U3B3L1BPVXlhbHhlOGhDVXF1S1BKSlpXS3krMUJxUWZKZXRWNG5TUHpMMXU1?=
 =?utf-8?B?dUU1bCtaYkYrb2d6YjBGZTRPQ1lIWFhSWjRORlNrelVOTG42ZUxsYWc1UU83?=
 =?utf-8?B?Q3JRUlUzOEJjVDZOaDI3OUluMG9WM0MxSnVZYjBDOHN5bWhsaWo5T0JMQmJ0?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e133f6-5704-4ef4-f126-08dca1a41322
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8912.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 12:22:04.9257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWc4J5OFK+Fsr7YiDu9NS48N8bdWWX61vgzKF2zQgEm0LjmxJDbspCSa7MAVylqyAE7Smq4ttI5YetHQkld0XwLKOG6b1s9IYV9HMVlv8OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10213

Hi Bryan,

On 7/11/24 2:07 PM, Bryan O'Donoghue wrote:
> On 11/07/2024 12:41, Quentin Schulz wrote:
>> Hi Bryan and Dave,
>>
>> On 7/11/24 1:22 PM, Bryan O'Donoghue wrote:
>>> On 11/07/2024 11:40, Quentin Schulz wrote:
>>>> Hi Bryan,
>>>>
>>>> On 7/11/24 12:20 PM, Bryan O'Donoghue wrote:
>>>>> The ov5675 specification says that the gap between XSHUTDN deassert 
>>>>> and the
>>>>> first I2C transaction should be a minimum of 8192 XVCLK cycles.
>>>>>
>>>>> Right now we use a usleep_rage() that gives a sleep time of between 
>>>>> about
>>>>> 430 and 860 microseconds.
>>>>>
>>>>> On the Lenovo X13s we have observed that in about 1/20 cases the 
>>>>> current
>>>>> timing is too tight and we start transacting before the ov5675's reset
>>>>> cycle completes, leading to I2C bus transaction failures.
>>>>>
>>>>> The reset racing is sometimes triggered at initial chip probe but, 
>>>>> more
>>>>> usually on a subsequent power-off/power-on cycle e.g.
>>>>>
>>>>> [   71.451662] ov5675 24-0010: failed to write reg 0x0103. error = -5
>>>>> [   71.451686] ov5675 24-0010: failed to set plls
>>>>>
>>>>> The current quiescence period we have is too tight, doubling the 
>>>>> minimum
>>>>> appears to fix the issue observed on X13s.
>>>>>
>>>>> Fixes: 49d9ad719e89 ("media: ov5675: add device-tree support and 
>>>>> support runtime PM")
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> ---
>>>>>   drivers/media/i2c/ov5675.c | 9 +++++++--
>>>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
>>>>> index 92bd35133a5d..0498f8f3064d 100644
>>>>> --- a/drivers/media/i2c/ov5675.c
>>>>> +++ b/drivers/media/i2c/ov5675.c
>>>>> @@ -1018,8 +1018,13 @@ static int ov5675_power_on(struct device *dev)
>>>>>       gpiod_set_value_cansleep(ov5675->reset_gpio, 0);
>>>>> -    /* 8192 xvclk cycles prior to the first SCCB transation */
>>>>> -    usleep_range(delay_us, delay_us * 2);
>>>>> +    /* The spec calls for a minimum delay of 8192 XVCLK cycles 
>>>>> prior to
>>>>> +     * transacting on the I2C bus, which translates to about 430
>>>>> +     * microseconds at 19.2 MHz.
>>>>> +     * Testing shows the range 8192 - 16384 cycles to be unreliable.
>>>>> +     * Grant a more liberal 2x -3x clock cycle grace time.
>>>>> +     */
>>>>> +    usleep_range(delay_us * 2, delay_us * 3);
>>>>
>>>> Would it make sense to have power_off have the same logic? We do a 
>>>> usleep_range of those same values currently, so keeping them in sync 
>>>> seems to make sense to me.
>>>
>>> I have no evidence to suggest there's a problem on the shutdown path, 
>>> that's why I left the quiescence period as-is there.
>>>
>>>> Also, I'm wondering if it isn't an issue with the gpio not being 
>>>> high right after gpoiod_set_value_cansleep() returns, i.e. the time 
>>>> it actually takes for the HW to reach the IO level that means "high" 
>>>> for the camera. And that this increased sleep is just a way to 
>>>> mitigate that?
>>>
>>> No, that's not what I found.
>>>
>>> I tried changing
>>>
>>>          usleep_range(2000, 2200);
>>>
>>> to
>>>          usleep_range(200000, 220000);
>>>
>>> but could still elicit the I2C transaction failure. If the time it 
>>> took for the GPIO to hit logical 1 were the issue then multiplying 
>>> the reset time by 100 would certainly account for that.
>>>
>>> // BOD set the chip into reset
>>>          gpiod_set_value_cansleep(ov5675->reset_gpio, 1);
>>>
>>> // BOD apply power
>>>          ret = regulator_bulk_enable(OV5675_NUM_SUPPLIES, 
>>> ov5675->supplies);
>>>          if (ret) {
>>>                  clk_disable_unprepare(ov5675->xvclk);
>>>                  return ret;
>>>          }
>>>
>>>          /* Reset pulse should be at least 2ms and reset gpio 
>>> released only once
>>>           * regulators are stable.
>>>           */
>>>
>>> // BOD spec specifies 2 milliseconds here not a count of XVCLKs
>>>          usleep_range(2000, 2200);
>>>
>>>          gpiod_set_value_cansleep(ov5675->reset_gpio, 0);
>>>
>>
>> I meant to say this gpiod_set_value_cansleep(), which is logical LOW 
>> and not HIGH, brain not braining today sorry. But the question remains 
>> the same.
> 
> Ah right yes I get you, you mean how can I prove the sensor has come out 
> of reset by the time we start counting for the first I2C transaction 
> delay ?
> 
> There's no way to prove that, the only thing we can do is elongate the 
> post reset delay by X, whatever X we choose.
> 

I think we could, checking the delay between the moment the GPIO reaches 
logical low and the moment we send the first I2C command and comparing 
this against 8192 * 1/19.2MHz. Not sure we need to spend the time on 
this though? There isn't really a strong need for optimizing this as 
much as we can I believe? (and worst case scenario, we can do it later on).

>> So, maybe this is all too complex for something that could be as 
>> simple as 8192 XVCLK cycles for 6MHz as Dave suggested I believe. And 
>> have some wiggle room added in case we ever support 6MHz and it has 
>> the same issue as you encountered with 19.2MHz (or whatever was that 
>> rate you were running the camera at). 1/6MHz * 8192 * 2 ~= 2.7ms if 
>> I'm not mistaken. So maybe go with that with a comment just above to 
>> justify why we are doing this with hardcoded values?
> 
> 2.7 milliseconds is alot.
> 
> Worst case XVCLK period is 1.365 milliseconds.
> 
> If your theory on the GPIO is correct, its still difficult to see how @ 
> 6MHz - which we don't yet support and probably never will, that 1.5 
> milliseconds would be insufficient.
> 
> So - I'm happy enough to throw out the first patch and give a range of 
> 1.5 to 1.6 milliseconds instead.
> 

Works for me.

Cheers,
Quentin

