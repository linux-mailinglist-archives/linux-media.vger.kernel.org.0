Return-Path: <linux-media+bounces-40509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EB9B2EBEE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 05:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D924D3B6FBF
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 03:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DED2DAFBB;
	Thu, 21 Aug 2025 03:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="P1+cFBew"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012020.outbound.protection.outlook.com [52.101.126.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C81827934E;
	Thu, 21 Aug 2025 03:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755746855; cv=fail; b=aagV9xSw9CSsw4CUBOfQapL5mJIb2H+MkyiQaD1Bqx4h7quMwYI0saANuGqHGqq7kqbMcYpl49vOaBuLJ8Sjm9yXP7QamdbFDfzbJJuB0iNs15/lc5LVvz5k/FS2vugoI0cnfW/Y9R/VSxT7r7g7VIQ8DoIBKhnMQv3gjgdf9Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755746855; c=relaxed/simple;
	bh=uVHfU/b/EVKQwWhu6ERrlTMlnOlDePZzlLuljZRHPT8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DoM9CHY3+kqz9TbxMfNAYUc5GwzUSBLssCcB9ZYUxS5LzAQigqOX/xl02hep74Hn2B278TXnJZTDgsUzkOQlZet1XcAkrmT3v/d0qqik63iE3oiT0t7s4H2OZ8fkqyG+AZ+XBuXlnXXNjGIRNeFUnbgY0xH5oOXhZTuxKqJbeVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=P1+cFBew; arc=fail smtp.client-ip=52.101.126.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dD1vuwkDUzDNYqfwvZQwcijRwFikhp0ctKhct4jtdNLm/IsWxVTXQ4NT7+/vNA8fB7JDhyNF+2/+ZHlExIMm/24XBSIKCUJ5DPMdmiWSG3IzvgaKv7BtOEpnoOEynS6v2FTXHCEFHPGQleRqlsrDNoZbKgKQFP6vGQzELk+cOw2pNDsC2DByNhQnbnzw/aJUUHkuSSzMuTimlgPq/DVwsXxauTa05JnCt9ZHXabZFn7/UrRGsDSHxSr5y0gqSKGhCPk5HTAy64FSGH2GOsEd2HgPD3/M6gi8QAYAqHT61N6kOZh8YpP4nnqlTBzt5x0sog9F03QBrUTstv2EWQXYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOjRoTGhlSQlMsGKWzKXwx1DN9VYJpywpOkQlMoHkio=;
 b=t3RNq60Jc2u5LbhKGIz8tG0eQfjImwFzbS5Hi+1zpSWMTtObqsdItbM90OhNCvh6n2HoQ5imyx4L44GsWeftaSdzt+nu5hO81/rcKhThhenQuhR4V0yzeLH6+GfaNmcPQ8I9JK83kDQLLWFeavPDgRqIyWwhkTI7kkjjTjCsDvQJtvHfcngMbJlOSJ92TWPUoT0iGxYIMkAf/StymukZRINTv2OKSwiL3aycwa4AEDUOcPuw1YE0VLTersMBkie9nnOL7/WUpzhqidkkJqwChS5tWwZN8cISmVh9iHCUoSIudtjuFJsaHHtpzhZdWnAQ9Dyksnbeb1sYmveLqai9TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOjRoTGhlSQlMsGKWzKXwx1DN9VYJpywpOkQlMoHkio=;
 b=P1+cFBew2RnzgBRDw1DmTj9KkgoTxJmFj0Xs4Y0gs1xlFCMJ06Viyk9/NEPge3oA41i501cLQsvIBt1HSUz9Ok/138Yv/qpUWE4Uxy5op2C6oZa9IKkIE1nUPiNDGH/Dk0zBQ0iYyKAuDjRTUy2ggAo5FeSQb5QuybXqKCt27k7ipiNdJ1pRLBWFJes/Yh8S7HP++ICUvRqsKqxIVdphYgH1rE8HK9qFXeDzi+JbNq8LR5kBClypdAsqDFthDkSxh7Ij455LpH1yrYHCWdyRljn5G6CrRCwRzphdecYoA8XS/69B4i5AhZOihmhOAAYuScwFdl8p7ZCKSgfWbaVchQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 PUZPR06MB5452.apcprd06.prod.outlook.com (2603:1096:301:ea::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.13; Thu, 21 Aug 2025 03:27:30 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 03:27:30 +0000
Message-ID: <9a289ccf-47b1-4e24-b317-53aaa166bb83@vivo.com>
Date: Thu, 21 Aug 2025 11:27:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: use kmalloc_array() for array space
 allocation
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Colin Ian King <colin.i.king@gmail.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20250817092942.95053-1-rongqianfeng@vivo.com>
 <aKXkQ0WXaG-hMgEW@smile.fi.intel.com>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <aKXkQ0WXaG-hMgEW@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096::19) To
 SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|PUZPR06MB5452:EE_
X-MS-Office365-Filtering-Correlation-Id: faff3adb-2bbf-45d2-874b-08dde062a867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVVxMThkREg2VkMvRFpXc3ArQzFobmp6eEo2ZzdHV204RE1Wa0ZTbkhhbFZR?=
 =?utf-8?B?VzlzOEVuU1BnN1NTckZKSmRLeHBuN0gvWTlVRnU5bUFDNFFwN0YrZHdZdVpE?=
 =?utf-8?B?cEZKQU9EclZkOUFWNGNmbEZnYmozOWRaSGY4b1Z1N0U0Wis1d2FSc2FnNWdw?=
 =?utf-8?B?WksvZXBhUTFPeW4rV2RYcjU4QlRZMlBUZ2FUK2NXOVNXSStFbStLckMxOU1N?=
 =?utf-8?B?RFdER2RyeUozei9adXpQWkViYWIzT2dRZ29qbk9jU3RGSlFTRkljeXNOOHpO?=
 =?utf-8?B?SGdqelJ4S3lGeTRrS3pWcUI5bDhidTBOR20vM3V6OUFXczJpVERydWloRzdp?=
 =?utf-8?B?SHZZMkJUeEx3bldTUFdUTERwaDBQZ0RZQkMwZk1JN25CS1ZtUGVja2F3ZVI3?=
 =?utf-8?B?bmpYNTRQWUw1SkJLWjV2TkRhZE5MY0E5UHN2cVJMZ2hDUlJlckNaaWRUT0p4?=
 =?utf-8?B?TXI4dFBWY3FhSkdyeXM2Y2J3QTRiZVFzaFlPa3RuMWw0KzlYRUM4YUErczg1?=
 =?utf-8?B?Wkg3MTRyVkdOdlFPWE14WnZ4UmszQ0N0Zit5RURIRS9ob2FkTGJLVHlzYVMz?=
 =?utf-8?B?ZytXNkl2VjQrUXBJV1k5RlR5amtRL0VZSkY1a1c4K09aUHVnZ3hYblVEa1pw?=
 =?utf-8?B?bUtGcGpsS2F3TDJXc3IrQ3B2T0xRbk9EcnN5WTdTS0QrVzkyREhML2hId2Zm?=
 =?utf-8?B?b2hNWkl2Tit4Y1VLK3BOTG0rQjhBcDE0ZHN2OWdtdXRuMGNHdFRKeTdYVWdr?=
 =?utf-8?B?Q1NqM01TdlhYNldXaGw0d2paKzdDM0dHQVNZelo4QXF3ZC9GdnZBbk5YT1E3?=
 =?utf-8?B?aU41dVpyWFl2dnJxa1NnbTQ4UXRycGtIV2xMSlcwaHJZSmZ3NWoramgzVk96?=
 =?utf-8?B?NHd2ZjlhaUJiSmYrcG5uTE8xZUppWTJyMkw0cDV2UVhNbzh5aFNKeTJmclo4?=
 =?utf-8?B?WmtiRzJTWVl1SzFhM001aUxrd3dDcFMwd1d0RmZrb1FoWXREckpCMjFHL21T?=
 =?utf-8?B?M24xWTc0b1ZzckxMQUpiOTNpQ0IyU0JpWnRxU3JaWGxUODBZNDJtMGljWmdO?=
 =?utf-8?B?WHJCTUttV09tcEs4ZkJkWEZSYzlDMDAvaHFVUHNGNHg3ellYdzhua0hkM3Zz?=
 =?utf-8?B?ODRJaXNtQWJxeCtUYzdCek5XNkZHZFFHa3pNbmJTQlo1MnhIdXlaakZkNlBm?=
 =?utf-8?B?UGdYM1VjSzVWanA3TnZvd2tqM0psbWdjY1pIbVA2eHBJa0NGMEhicjlOZFlx?=
 =?utf-8?B?RkRJeUpwQ3RHNG8vN2ZQTmN3Lys2Wi9mNHhIYmRDWlUzNSt3NUhSU2JlQVJm?=
 =?utf-8?B?Y3dDaWJrTCtBTW40alhBQVRaZ1lPS0VDY29veVJudDFZY3FGTGx6SHBGblNM?=
 =?utf-8?B?S2MvYTg2V1RHSzZ4clc3NFVYb3BWdDBFbVA0cGttRkRBRnh4ejlac0NRb3Bl?=
 =?utf-8?B?cEozeXl3RStjWjl4cytXNHJ6TDBmZWl6Z1pXZ3ovZFpyMmt2cFlLeGlPRDZz?=
 =?utf-8?B?eWg3MG13TVRwaHFobXpaSnF1U1kraEltK2YxMFFURWRLWTh4V09QbWZpWWJP?=
 =?utf-8?B?Sm8wSXN1OWZhQWxIaEVkbUYzNlFwN2Y0OGJya2ZCL1ZZK0x0ci9XV2NNMHlJ?=
 =?utf-8?B?S1pJZmJIbm5RVWk1SUxjZ0VvSHM5N1p3cUxoZmgrbnc2L1lIcytPQkRVL0pz?=
 =?utf-8?B?L1N6bVRKQ0tQK3g0U1pRUUhEeVlpOGs1R20yd0pMb0czMy9LOGhjdjc3MFNY?=
 =?utf-8?B?NzlGT0NZc29nMW51UWh5d1phT0ZPOEVFRy8rYUpFcXRIVkdVWXhWaitCMVAv?=
 =?utf-8?B?VVlSaEg1YmNEeFNEK1p5YkpCVGMxYzlZdG5mdlg0eGFCdXVqQmZ6RjgrQ0pD?=
 =?utf-8?B?bitmUTUvUjZIYmt1S3F3V1gyTSsvRndxUHJtV2cwcHA0bXAyYkdva0lCempa?=
 =?utf-8?Q?rcNAsXz99Nw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enZONC85WFhjVUk1QjJWL0NZaXk3bkdiVGM2S1h5YXpybThxUmc1RmlyUlJU?=
 =?utf-8?B?RkRCNmRPL0x2VVdFU3JwKzBEZmxsV2VYWUF0Z25kUm43cFRuNit3OG00aGlP?=
 =?utf-8?B?S0U4b2RudDBPSFpXeHFweUYvY1B2WGgwVEl4SWxVNUtzdmMwOTNoWHkxaDND?=
 =?utf-8?B?VFVSdGdkNHNPMGdRNW5TQW1sUXptdlBmb1hRSEQvc1JnU3FoenIxdWt4NEFt?=
 =?utf-8?B?UDdpOFYzTlNoMDZ4VXlPeFRQWHpjL1gwOTlZR1Npa1VRV0NHREpKbytDNkFm?=
 =?utf-8?B?cnlUZ0Nqb1QwSnI3NnJOYTYxeTZhOEtuZld6ejMvcURDNW5pNXhhKzZ6ZXNE?=
 =?utf-8?B?ZUtIdS9xRmcyRVdrWGJNSWFTTWdCbHNpN0VkRGpBWDNySGYrOWFGd1dyWlZ6?=
 =?utf-8?B?ZVpGYnFmKzROK0pPWlVtTitYbHhIanZnL0RhRFNJeVBSdHJTSDJ6WjlQdzdX?=
 =?utf-8?B?N0ZCc0J0QTJTNVByVmk1ZmgrRFZvNk5DcmJFNlBmZ21XejhXNThXbTlCM3hm?=
 =?utf-8?B?dGpuaThqL3pnTEl6N1gwa1Z2ZzlzcU44cXVMLzZaV0V1bTJkc0k1VWtTZjNp?=
 =?utf-8?B?TDZSZkgrY1NkSVVvZEVhb2ZtdCtLSFBVNnkvQ0xvOFhURXhQVk5TbFJ5cGky?=
 =?utf-8?B?WmJ5TkVyZmpqV0dZWGIxb1hJSUhnbE5lUktGTjV6d1lPaG05U0FyY2ZRSytC?=
 =?utf-8?B?cDFzUUZHNUFlVzk0N2gvUlNNZHF5TWdjbWtnWkZycHluOEtZTUxYUE11Tzhm?=
 =?utf-8?B?c0dhTWtoUHhZQ3RyeWpjZ2xPcnNGWWVHbUw1dXFhdTVQVTJZNmhndXFpOUlB?=
 =?utf-8?B?aGtheVhGWkk4NSs4YXBQUU9MUmFubTlWWGNxZkRETkFRa2paQVl6K0pmdlVY?=
 =?utf-8?B?TVI1aVo2T1d3OGthREN6eUdadHNwT01vL2NMRDV5UFNoZGk2aEVRdDVuZERk?=
 =?utf-8?B?WENJUnkwYWhFZWxMd3lqYWtDUU5VMHFoTkFZYy93L2FvSWs3a2pwMEp1YlRt?=
 =?utf-8?B?WHlmTlJlZVkrSGxkL3hQQWhzYytNT1NZZ2h1Nis4L1RFSFJiV2dHbHVEUGxs?=
 =?utf-8?B?L2hRb25xck5NVzZPZDhSKzI0OTNKeTRoLy85WU5kK2NhbjgrdXFxc2ZaNzdS?=
 =?utf-8?B?d0o2cHY5b2dNamlOM2Z6ZEtVc1NHWktvM0JFU1RzdWxwTXlhS2w2WUQzY2V2?=
 =?utf-8?B?aGtDSm02OTdkRnpzV1dJVFNjbjUxS3BQTktMWXFkVGhrdXZ1TEpTZ3VlTjJi?=
 =?utf-8?B?N0dNakU0TkIxaVp5bFhsTjZZYmVIb0hPR0Q2SE03ejJ5QmF3UnRwczVyeWhz?=
 =?utf-8?B?NEt1VkNxQ0Y2cGNqMHUrLzNwRkwxOWw4NEFhYlVONW1xZlE5OEUzMjZ2R0RJ?=
 =?utf-8?B?ZkJRc3E1SndpbEdFVmZIQXc4KzRyUzZTdllBQXMrbFlWa3lEU0k1ZG9NM2lm?=
 =?utf-8?B?MjF1dC9XS3lDcnJZZEFrU0ZMYzZIYjVpRjYwazlCOWFZU0lrT1ZZTkZzK1h5?=
 =?utf-8?B?VVVLOVY4djk0RjdRRWJrWHIxRG9qU1l6akhWQ1d5TmNyR2xmK010aDFwVVd2?=
 =?utf-8?B?RjNzOTJhR1JHSUlKMVYxaUZLNjgyZWpUVTBDUzB4UjlqWWlGRlZZZTlVbHlH?=
 =?utf-8?B?emI1aE9hVGhpYnd2NHJ4VFg4R2w3YnZoUFF2VS96K3UxTm53MWNxdVNoanpP?=
 =?utf-8?B?YnBndklrNzdWTTJkSkI3N01xQURXOTNxYzhIRCt0QVlRdFZkRHNUbTVLY2hY?=
 =?utf-8?B?RWdlNTNMbXJmeEJCVmc2VkpwNU1PMERjM25OL3M5OEdPZ1pKMEppZUJVdUNr?=
 =?utf-8?B?bWc4MzVZZ3BvTGdKV1Rad21CWE80MVM4NUxTbHJ6dGJWSnQ1VFFjU0JMTGRy?=
 =?utf-8?B?SllkWE80d2p0aEJDR0YxT2Q4Tzg3Q1ROQnZsSjhDeUowaTAvdlgrUlRUOHZ6?=
 =?utf-8?B?UUQvdjlGWUJnYy9vaFNOZ3hMSElWaUxlRnhleUVjVnlaaVpWT2pGQjN5bXJI?=
 =?utf-8?B?d1lMZW5KN0szeVo5UmIvYlV5SkczMTBHU0VGVzFnc0owKzBZWm5IOEZZNUts?=
 =?utf-8?B?OXhXdXF5cEZ3VSsrUC9RMTUwSVFKVDNkMUhoaFhCWUNDVzFkcWdzODZpRlpv?=
 =?utf-8?Q?xTokUZGY7jjf/X5jgA49d6aDc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faff3adb-2bbf-45d2-874b-08dde062a867
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 03:27:29.7512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mP7OLC+XV5VuqkaQkWFTeQ3SN6DtO5G36dMKH9L+PHomjg+foCEW1GIuKRwDZ16VA83fbTl6f3iW8YfB3Zv9rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5452


在 2025/8/20 23:05, Andy Shevchenko 写道:
> On Sun, Aug 17, 2025 at 05:29:39PM +0800, Qianfeng Rong wrote:
>> Replace kmalloc(count * sizeof) with kmalloc_array() for safer memory
>> allocation and overflow prevention.
> ...
>
>> -	descr->in_info = kmalloc(descr->num_stage *
>> -				 sizeof(struct ia_css_frame_info),
>> -				 GFP_KERNEL);
>> +	descr->in_info = kmalloc_array(descr->num_stage,
>> +				       sizeof(struct ia_css_frame_info),
>> +				       GFP_KERNEL);
> At the same time it would be nice to use sizeof(*...) variants instead of using
> type-based.
I prefer sizeof(type), but using sizeof(*ptr) here shortens the line and 
is indeed better.

Best regards,
Qianfeng

