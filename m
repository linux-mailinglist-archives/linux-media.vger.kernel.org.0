Return-Path: <linux-media+bounces-41493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B79B3F21E
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 04:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4A9A7A20EE
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 02:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B9D25A333;
	Tue,  2 Sep 2025 02:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RCikAATI"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2421A6FC3;
	Tue,  2 Sep 2025 02:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756778918; cv=fail; b=PNtdYlHp47c/6+2GIPLDmNKQuEN4YaHmm8PIp41/uhG79Saift7qb+qJnIlzAifd7oGQpLsjZzAw3hR5F2cjXqkvhbhil0ZXPIosbw3fSr4eAKeeDfhOHK5oZo/0e81n12ynnmvBSThukNOd+PUY8LEqchYb4LO9v4xkKgP+3PU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756778918; c=relaxed/simple;
	bh=v8YV7sxqPqmRkQI9+CWysmUf2Ik2PKi76wQ4dIjFaIg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZqFnflQ9aoVc6v6Xn6h5zLwAquZ5kxtdAodf9njNnq8p7wK+6IIs5MAJWnWLBqVVLn8cKus36Mzx3HjULHjds5o/yPoyVJtcCvyQfIIlsxfVFJPRHxIUu022a6ObciUwnhNL6i1nEaP1XqVe3/tl/QXKvV1WsN3XFxSCn2iuWRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RCikAATI; arc=fail smtp.client-ip=40.107.244.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8lof8lxkVmSz/J8zMf+vYR43JWb9Cdz7JTH16NNSr1w7bRi7oyqy5E89v01Gmwk58N7LPaMuqro8l1EK5c78xwARPKgX0Ttjxyb7sWhRHA5UBiUIZVxZ1aA0K3easy6tiahN9r9CNEG2asU5qNYmkBb90Y/dXR8wIIbU6uUwMWM0U3YDmna6u/ianUdCYMZzAsrHZmjK8CWQWfIGCvcQne3EDVo0dmw+IjRSB/FzrZUUDANiVU2nIJv2QISyO8NYs5+G4i09AddjmkfLZCkT9EAK/4virENx8Xg+jczaEqj7EzY29IOzktQ3Lben10QkKP+sT7LKTO269q9s5XjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx+qaKOPRUhu/gAnn3OikJCpU5E772QTrElJTvrPeCY=;
 b=wDSAwFQhJcGjVkUPcXm5P/OXai026BHTUnMawo1I35JWbRm3yxRJqtfW8bcF8zamTzpdKKIdTveCPOkgZgY5Ya2EWyItfhwz6HjmSLIbpfuxGRMEzHEHOEm2cuHsmYt7/h9198b4vZ5sriRp747ToopZoqoKLsJ2il/GzmfU2Bj1ceR6hjsjlv2lGRMveZQPY0YJ2XEvBBysbLeIYHTW5uyNEbAsLrLmaZmz0M9SN21jR8bguuPiwV7+k9YIa1NCwV2xNkc6/NLC3xpDUpooba4oqlMJZW1k8bA1gY4ZhQiwxShiPbGoBzNi6ZzKkw0kAMv2PMybUinvQonJLm9yHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qx+qaKOPRUhu/gAnn3OikJCpU5E772QTrElJTvrPeCY=;
 b=RCikAATILx/2d6PHxXMhwbMqk2QtVsc65UOjhZAoIQMpjzpl66yW5B+tiKSvAPDUkTk6U0a8LpKHu7OroHLMSZcIBizO58foJfghYoOKkijB455y/yJaKCVkifD5PWjHtFz91O2WQ/MErpe7FTgvJcjGnPHjMEesunzZr7dArxo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 02:08:34 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 02:08:33 +0000
Message-ID: <07c75fb4-5e42-4215-9cda-be24095b4c26@amd.com>
Date: Tue, 2 Sep 2025 10:08:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>,
 "Rosikopulos, Gjorgji" <Gjorgji.Rosikopulos@amd.com>,
 "Jawich, Phil" <Phil.Jawich@amd.com>,
 "Antony, Dominic" <Dominic.Antony@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>, "Tsao, Anson" <anson.tsao@amd.com>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aJ2H6CIyZvN8W2sS@sultan-box> <ed9deffd-296c-465b-ad8a-314ed0968390@amd.com>
 <aKfqVNk_WSEeBxlz@sultan-box> <1633b6cd-c84f-4cac-9f87-9dbfd0d2847c@amd.com>
 <aK_uCunEww-I5Jd7@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aK_uCunEww-I5Jd7@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:3:18::26) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|SA0PR12MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: 72978959-2975-4910-569f-08dde9c59e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXZuR1JjUFc5SHZXeFY1Tk1mYTNnNklpY0RYekF2Y3dibzJEcUVaZVlWOWhB?=
 =?utf-8?B?MHF6Tnk0TEVmbWsxYU1zRW5HWWhxTTlXWU55QjZlRzRidnlhWFJEYksva045?=
 =?utf-8?B?VWpralFtZ1ZMRUcwTUEyeUlFMTQwaDdDRWFwV3FuN0NLYjIyU2tKUE9OL1N5?=
 =?utf-8?B?ZHVlRk5lbzYwaG9QNWlwUHRuenhleGwwK0h0UHFCNWhRRUhPS25mWnMvWkZq?=
 =?utf-8?B?MHFSZ3Brc1FTYkx0aUloTG8zaVJIYm5NSno4WDJ6bXJFbTZYV3hpcFF3c08z?=
 =?utf-8?B?Q20vQktpNjEvSUwxM0hwY25IVlBiRHNRSFAvNnozODJLYjNDakNmN2twbWVm?=
 =?utf-8?B?UkRUcE5kc3AvZG0xZmxXU05ha0kwaEc0WVcwVnlIMXE5TWJQTXhRUGd2eTM0?=
 =?utf-8?B?NTVDTXhaMjZkQkRvOEozbXJaZkdXTVJvN01nWWNWRTV4dURHcFhvRE1NR081?=
 =?utf-8?B?QldjNEl4MVJHeWVQZEtFcE1HYzVPNWxJRmFxUFVtRjZqNmNvSmp6eXdBdW04?=
 =?utf-8?B?TGlwWTNKU0ZuSk1vUnlScE5NeDdwUlhnTTFxUnAxZ1grVDJyQ1I0RUdyZWYx?=
 =?utf-8?B?VlgxNGp3V28xd2ZtQnU5YlBCWEpYRnZxZEcrdFJXUTVyaGptNVdnbVJWNVI0?=
 =?utf-8?B?MFNvajB1cDZjL1hkTysyMmsxUndCS2syeWorSmtFTWZHQWQ0dkFUVHBBMHk1?=
 =?utf-8?B?SGxYVkNoY05URjZNMXRnMHpid0VnSWhQd1hRaStSZitCeFpoT24rdTNaNWw0?=
 =?utf-8?B?cEZMelFIWjVVejdRUU1TZnNNYnZHTStIcU1qV0kycC95d1c3VXF0Uk9FaGc1?=
 =?utf-8?B?VVE0RnZONWZpbUNGZ3dNWTVjOTYvTEFoNXZRR2x0ejJ2SkIraHZIVmh1MUZD?=
 =?utf-8?B?NzhxRmJHL1NoUlM2ODM2NCtnSDhicERobzlZQ0VJRUtSTE5tUWVWbUIrYUxh?=
 =?utf-8?B?MUwxSUVMa2xMN255ODZZTlNWZktNSktpeEhxVmpMZ2F5U3hWbjRlbnB6cjFa?=
 =?utf-8?B?aks0QmFXRTZYL0dFVklCTk9kTWJXRG5iWFZ3REUvSlQ0L2U4QzZIYzN2Z3E3?=
 =?utf-8?B?R2dXY3orUUlFaWxjcWZ1VUpNU1BGVldSN04zV1NPR1lqcnBtNDZ4dG1Xc0sw?=
 =?utf-8?B?elMwZEN0YlNZckhXaHVZMmRyVndjSDJSL0Y1N3FCQVpiU1BmOFdOUU9UL3Bi?=
 =?utf-8?B?THBOSkc4V3RSMnpnNWZnNmV3QlVwR2dCZG4wTTE2QWJCOHVtTDNhVVYrZm5a?=
 =?utf-8?B?elFUb21pSHBSeEdHZ05CVm1ibXYvVTNLc2l4RklVdzhTK2JwTk5mVmo1aW5w?=
 =?utf-8?B?NzZ3Q2lmY1NRVWx6Rm51ZktaY1d0Yjlla3d1enRMdnlBRFZUa3g3Tzl4ZjlW?=
 =?utf-8?B?NHVCOWN6UUh3NG5Wekx5SkJ2Tk9JbjhuMU9ETmNoNDN5MVJuQmpLSmRrckVK?=
 =?utf-8?B?dkZmdE1yc0FpWDNrTU8zeXdyck9zOEFDUDNjSWdSa2I2aVZzRmE0TFQ2WXNB?=
 =?utf-8?B?NGEraWVzMFBJYjhseTl3RkErNUpmNnc2UzdtU0cyYTdtU3ljSkVNYW1LdzR0?=
 =?utf-8?B?eEJvOW9MellEZDkwMHhaZzBod2dLY3BPTXc0Wnd2c216aW5xejI2QWpwNkhJ?=
 =?utf-8?B?ZVB2MFlpQmp5REJQa1ROaFA5bzd3eFlpNjI2SUs4djAxb1pWZ2NDWXhER2Nq?=
 =?utf-8?B?MHVpanZnSkFxTHV0QXo1MXJaSSs1SklnV1hzM1VHSDhyNzkvemt3alQ3bGl5?=
 =?utf-8?B?aURaQmZyYzJJaFV3RnlONkZkUi9sRGlwOGRMbE9TQlRVMHZkdDFwdDJrU0xk?=
 =?utf-8?B?VjMzbTVkZEtFM0c4Wm9LUzUxN3Q3TXNoYUt5dzZoVnltZXFkU1hBWE9LdmMy?=
 =?utf-8?B?OVhQd3dNV0J3NzQ0NlBibTR3U1UzNFlNN3BTYjQ1eCtWRThETjdrejl4amZL?=
 =?utf-8?Q?17ogaGUMa8M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE1jWnZac2liSTkyOVBHeUtuQzFTeHd3TEtjaXdmemdtWStwQWxIMVc5YmJ4?=
 =?utf-8?B?M0RMUkRaMmxZQ3hEdzJNTktPWG96Ti90UHhuODZQdUhrcFpoZ0Y2RGl6Uldv?=
 =?utf-8?B?Si8wcVNsWm1qT2ZxREpGRjNWcjdWWGpybllWRWVHbHhKcVViRnhLUU9CdGg1?=
 =?utf-8?B?NmUzZmNMdjJDZ29GYys3VWlhblN0VGVOYnhsTW9NZnliVGhoaUFielNKVVpO?=
 =?utf-8?B?Z2RpTXR0SEdQWklUWWszTmRzYmhSZWtTdzJXazhiOG0rNCthL2ZKV2kwVndB?=
 =?utf-8?B?UkpFemEwa3lPdys2TmxPTUpEcnU5aTV4L1RzWThsSjgzVlUzZjVCVmJueFk2?=
 =?utf-8?B?OG1RNXZxQURUQlJkcSszZXFSN1d0T3dlQWtoK0V6VTFzaHVoL0svNmFjSEkr?=
 =?utf-8?B?Y0pTU3VzV2dCcFdDZkxsL2M2Qm9NNnBpN3l5R3E4T3duNzRJNWtqUE1GQ0xq?=
 =?utf-8?B?OUdUQ3c4cE5nUFc5MFpXOFZrUlNPa3BLRXNqWHpPbmRhYWNBY1BSby8weHVp?=
 =?utf-8?B?QUxybXNLb0FRWnZhWGp5VTRIOVdNanR5cWlZY2dLdENHcy8rdDVUUjBIK3hL?=
 =?utf-8?B?QmJwTkE5SnA4bmpoWkoyT0RaRTZQNlZpT1BjWldsOWEraVN5TU5JMzYzMW1z?=
 =?utf-8?B?anpEN0QxdGt5aGxveCtxTTBTQlhrbVZGTnZYbkMrOUxFNTNlQm0rYzFzMkdv?=
 =?utf-8?B?YUhCS0FUakF1R1JIS2lEd2x3c1M5VU5GT1U2bC9BeGxCUmgyNVR2M0wxbGVD?=
 =?utf-8?B?L3k5NkNlanJxdG44ZWFGSTZZcVBNS3doYm12cGV0QjhtV1VMUTIxQ09UTWlh?=
 =?utf-8?B?NVVGczFueEl2SnIyTVI2NXBrOXdJTTJnS2lGdWovWjlYOEM0MGpyV0N2RHJG?=
 =?utf-8?B?K09hemgrTXRVejBDdFhIbys3UndMZXpESXgwbks0MGZZYkdFNVNPZjNOaE9R?=
 =?utf-8?B?ZzN0ejJoUzJUZ3ptYU8xVVFXMGdUYmI5MmZiQXlMQXZSTkdNbDhWd3RpRXJO?=
 =?utf-8?B?UVdNbDdIRjEvOThOV09iV0pmMGQyckxja0piMTdxaWFzdUFaOTBobEhLdmdi?=
 =?utf-8?B?NldhTFpwbGE2aC9tYXNjL25RUGVLY3ptQ1hlSEFWenYrelNnV2phajJsNGhR?=
 =?utf-8?B?TDNOYmFsOUpENmxVSkFJQmhmaTdkdUVQWGEwSGE5YjhUc1AwaFJwRnc4WmUx?=
 =?utf-8?B?Zk1OVnIyZFhpWHJYWUlEVVA0MHlvVm5oankxUUM5enV1QUxJcFFxMWVaRzhw?=
 =?utf-8?B?NWNnZllKZVBCYm5LSVR6aXdRK2V3RGhTVkFVdnpaWHZLVjJRVGdlMTdRUHk3?=
 =?utf-8?B?Unc5WURWNEh2QVlneVV2ZjJRUUd2MHd6RUpxTU9xY09yaiszb3ZCSmcxZnNh?=
 =?utf-8?B?VktaN0ZIdFZ5SzdFeFlwcDBjZzhINzlEaVdRL09BcWp1azlMR2d3WkZTMTJu?=
 =?utf-8?B?TEc5d01ZeEJpYXhISEQzdGhXTjc4UGxGWmZMOWVIY1RTNjNrUW91bHFhY2pD?=
 =?utf-8?B?OFg3WXBwZ05TcUl5d3FIMjNQQklFQkIvallhZm9WTjY2T0ZtT3k1SFZmVzJF?=
 =?utf-8?B?WHVsMTdwU2huQnpQa3lZMEt2N1RmS1phajA5a25hMEg3ZjhTL3hjazk2K3RK?=
 =?utf-8?B?K24zK3RJRnlGdmZpK1hHTHRra2tDUnMxQ2tiVXBwRFJoL1B1c1h4NnVrcmVm?=
 =?utf-8?B?Y2NwSHl1bFBwT0VMN2hnd2o1VW4rZUVsVXJkK1piWHZEQlZUS2tndGFOa2ps?=
 =?utf-8?B?MDYzblMyZEtXbmVPd3NpekVDWHY2M3FaRnNsVFlVTnRQN1czV1YveTIxbmkx?=
 =?utf-8?B?SEh5WkcvQ1J0UUhaQWs0ZkY4V0N6V1hlUWRvZFhpMTdGWXQ3V2wxSXJDSTUr?=
 =?utf-8?B?eWx0Rks0L2NVN2xTdXZkTW5oZk9zampYUDE4MnZKSnVIbUprQ0dReHUvV1o0?=
 =?utf-8?B?QjJFQ0RLbHhxMW1lN1VHVlZ6SENSVUNibElXZ3BCc1ZNd2lQR1UxT3orOWdh?=
 =?utf-8?B?NkxwM3piZmZmNWFGNWFFQUZEelU2SnAvWnRSVjFEdWF4aStjWnVwWVRDd2J5?=
 =?utf-8?B?bFExNmdrKzBycTBlL1JseGZCMjc1NXlieHJnOUlCMlh2R2duazAyMzB0RGhI?=
 =?utf-8?Q?l0jo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72978959-2975-4910-569f-08dde9c59e76
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 02:08:33.6887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfqCv+bpuZwdfV41ap2yyM4UpZmjFTDCKPKrNozEFyzKANelFKkRpAt4QLXG/DaV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400

Thanks, Sultan.

On 8/28/2025 1:50 PM, Sultan Alsawaf wrote:
> On Wed, Aug 27, 2025 at 06:30:14PM +0800, Du, Bin wrote:
>> On 8/22/2025 11:56 AM, Sultan Alsawaf wrote:
>>> On Fri, Aug 22, 2025 at 10:23:48AM +0800, Du, Bin wrote:
>>>> On 8/14/2025 2:53 PM, Sultan Alsawaf wrote:
>>>>> On Wed, Jun 18, 2025 at 05:19:51PM +0800, Bin Du wrote:
>>>>>> AMD ISP4 Key features:
>>>>>> - Processes bayer raw data from the connected sensor and output them to different YUV formats
>>>>>> - Downscale input image to different output image resolution
>>>>>> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc
>>>>>
>>>>> BTW, another problem I have which I would love some help with: may I get the FW
>>>>> commands for setting basic 3A parameters?
>>>>>
>>>>> It seems like the default AE mode does frame-averaging, which is really
>>>>> unsuitable for video calls on the webcam. My face is really underexposed as a
>>>>> result during the daytime because there's a lot of ambient light in the
>>>>> background.
>>>>>
>>>>> The webcam on this laptop also has a very wide field of view, which makes my
>>>>> face appear small and shows too much of the background. This also exacerbates
>>>>> the AE problem.
>>>>>
>>>>> I'm thinking CMD_ID_SET_ZOOM would fix the FOV problem, and then either
>>>>> CMD_ID_AE_SET_MODE to change the AE mode or CMD_ID_AE_SET_REGION to set the AE
>>>>> ROI would fix the exposure problem. What do you think?
>>>>>
>>>>> Thanks,
>>>>> Sultan
>>>>
>>>> Thanks Sultan for the suggestion, sorry for the late response because we
>>>> spent some time internally to discuss the feasibility.
>>>
>>> Thanks for looking into this!
>>>
>>>> Yes, it's really good suggestion. Because current V4l2 doesn't have standard
>>>> ioctl for like region setting, to support it, besides adding FW command, new
>>>> customized ioctl also needs be added and no existing APP can benefit from
>>>> it. So our idea is not to add them to our current upstream driver, but we
>>>> would be really glad to help you to enable them locally with dedicated
>>>> thread, suppose it can help to improve the IQ with correct input setting
>>>> like the correct ROI region, but we aren't sure because we didn't do that
>>>> before on Linux and would really expect your test result and feedback.
>>>
>>> I'm happy to help develop this and even help write the code. :)
>>
>> Thank you very much for your consistent help, that's invaluable.
> 
> Of course! :)
> 
>>> For advanced functions that don't have a standard V4L2 control, maybe we can set
>>> some defaults in the driver to improve the experience for front-facing cameras,
>>> i.e. webcams.
>>>
>>> Depending on the features exposed by FW, maybe setting a ROI for AE isn't
>>> necessary. Is it possible for the FW to do face detection and set 3A according
>>> to the face landmarks/ROI?
>>
>> Oh, so sad, our FW doesn't embed algorithm to do face detection. :(
> 
> Ah, that's unfortunate. :(
> 
>>> I think a lot of useful functionality can be put upstream just through V4L2,
>>> like V4L2_CID_EXPOSURE_METERING to control the AE mode.
>>
>> Yes, that's feasible, the consideration is if we add support to control AE
>> mode, as a complete solution, then we have to add support to set again and
>> exposure time in manual mode by FW command , besides that, extra work is
>> also needed from QA to develop new testcases, all these together will cost
>> more time. So, our current plan is first to upstream a version with basic
>> functions, after that, we can submit incremental patches to add more
>> features. Does it make sense?
> 
> Yes, I understand.
> 
> For now, what about just changing the default AE mode to center-weighted? I
> think this would produce a big IQ improvement since the typical usecase for the
> webcam is to show your face in the center of the frame. This change could even
> be made in the firmware instead of the driver.
> 

Many thanks, you can always come up with good suggestions and ideas, 
that's really helpful. Yes, the ideal place will be in the FW. Have 
given this suggestion to FW guys, they mentioned they will check if 
there is center-wighted AE mode if got time, so far, it is never used 
and tuned.

> Or alternatively, HDR could be enabled by default.
> 
> What do you think?
> 

Yes, HDR should be able to improve the IQ, as you know, starting from 
patch V3, sensor driver will embed in FW and ISP driver will work just 
like webcam. To add HDR, we need support from sensor vendor, on the 
other hand, complete tuning and verification are also needed.

> Thanks,
> Sultan

-- 
Regards,
Bin


