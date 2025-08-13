Return-Path: <linux-media+bounces-39804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D083B2487A
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 13:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74C40189F701
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E47C2F4A0A;
	Wed, 13 Aug 2025 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="oQ2s7eor"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022134.outbound.protection.outlook.com [52.101.66.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF882DCF5F
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755084700; cv=fail; b=s2s+qby/JEQjwNiNmbA7p93z0XUBU/os2WdYKq9wQauwdJDLblRaion21mGxbGNBJCXUcHIukumtQKKTqbpmCuGek1KhpAuaOCW3TiKYI3Vwr4cHdZhNXTkmJQaLNUh6e7aYJkdw/CrB7R0s8mJnSZb7hBIlBXIOBjTJsKl/kMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755084700; c=relaxed/simple;
	bh=2mS8BB/jYLKqcFAJUe8XulSgR0h4qIyx/OhWbxNZAFA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AHYGXrVzHfKbBIXXbmoso1ZtcowFRqCzGz3YwESfu6cMkiYRrxxzmJwRTrAl8FMyH8EF8iptcV4g4J58ZE88ylCh9iXB4dtMymts8TVJct77xp8symd/zypmImVf1OEiGlsi1OZD0arRJrae96N5H1pqnRx9Jq6n88Sn/AZJwUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=oQ2s7eor; arc=fail smtp.client-ip=52.101.66.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvKmKXvBaPyO/0ea2nKJJwDF3ybQzYEqIii+3wKrmrkKo92I4RBtsb5FXaTBEVOEV3VyQYaNtpzAD/UDZDRXEVf+k2m3w1VtkbDTm6FIuyzSGhwhyLEOu3kVPO/dokrBgwQa/GP/uPL7PNdQtgvITOqASh0dpMnsMUSz2AWd83yHpDS+rEgwkWMQDztxt3ggmrV3FfuoADl/n+dEZtFCum7CCuw+0JL1/GAZun+U2NeKng8nRr796APw66e1DLyu2xfrE+D0sQFgrfNNSLB0P6H0pu8nj0Zldohs2O9qHF6vYB/IBC6ybxWr3eMcxi5+UVOxsGv9ZRvAS5FrMTbPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEOXFptf8d8/+u8FB00hfMAyLS9qP2rwYm0oXRa+/HU=;
 b=ZpuYaRttGz8aHsQ2QezsEahUGPzGSd1OS+9jZxXgV2TlLzFb6wHJnzmabT9gxHgjb9OQi4pWUe1Rlrtz5STg3hhXVmMfYSih085IJrc6qBs4imNTtzVu1S85HNfMIu90tmRJPnGhtr/u7fJ/OV6UkQ9LN5VY5N8Tn/uSJHUVolhXfDa/LoTrYpIzgh33vcCjM4GZbLeOU2muiMbSzKId0nwCrytrEKoy7AWT80ixTcetsxh0SycRdRPmPnFfUMs28ISDAbmnL8AJyTmk50a0D/Yq6i9isNOMHvS5Td+mHu9jN0h9HsEXkNY2dCXp2nlw8xx08Fi3R1ZsHvSPohmV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEOXFptf8d8/+u8FB00hfMAyLS9qP2rwYm0oXRa+/HU=;
 b=oQ2s7eorAguExoDGTvcFw7dD5z+ZrDuuDn2x3VpTXuBZObID2QNgavqW77UZ24/c0JB0s3dht4rjHhBN5Ikr8rHKG98PeGzWl6ZCAJ3fnpakpfbQotgNfgZys4Hl9Nvy371lkq0H1DNIDKJSWV++F8HK1LMYcOXP0iCm9OxDrXgBMO4roZSmfd7aiu8cjxKKKC+MRZJgF6s1AvndUYSd2PBw0NZsmogMSGfTu2aJ9xw0v8Sqw8mBtzM+3Ln5DtMvkynasLrfA5CT74uT9MDmm2Dd3grqDzn3sJoUJdvZp7UYzOZCGZVM73FFTxFa4PtrzQTpqkwJ/UMOK0I7RoBB9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by AM0PR04MB6916.eurprd04.prod.outlook.com (2603:10a6:208:185::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 11:31:35 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 11:31:35 +0000
Message-ID: <8d4d8d75-fe89-4c6f-b8af-2f90d7e370e9@gocontroll.com>
Date: Wed, 13 Aug 2025 13:31:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel Panic when trying to capture camera with ffmpeg on imx8mp
To: Fabio Estevam <festevam@gmail.com>, Tim Harvey <tharvey@gateworks.com>
Cc: Laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-media@vger.kernel.org, imx@lists.linux.dev
References: <1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com>
 <CAOMZO5C3o+UaLRaXfB+sfmgB801mNTLztE_cy-e5duKDAL-1Hg@mail.gmail.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <CAOMZO5C3o+UaLRaXfB+sfmgB801mNTLztE_cy-e5duKDAL-1Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0302CA0019.eurprd03.prod.outlook.com
 (2603:10a6:205:2::32) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|AM0PR04MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb8f1cb-cb94-424c-be4a-08ddda5cf5ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QklKc3VQcmdpODhacGRvNVdSdjlWcDhOOUZ6eHlFdVVaUUJmdktrSXp5T2Qz?=
 =?utf-8?B?OTFjdXJacFJNQjRtaUxsRThoeFM2YWhmc3JTOTA1bWdKaTQ2a2g0TVBacUZY?=
 =?utf-8?B?a0VlaHBOUUEwcGY0VHI5VnBnZTk5TlA3SWdCQXRnNUJnV08xSDNOZGhpTGY2?=
 =?utf-8?B?bUxZcitPeGh5VWN1Smw5NWhCS3RNUWljUUROYUNUYnpkblp5R2dTVmMzNWxJ?=
 =?utf-8?B?b1N3NkRxMVlDczBieGRVTUlpcXVlNTFWRi8rWm9LbmpDbGFhRi9ReUhMc1Jx?=
 =?utf-8?B?ZjVQWlZYTnE2ckNCMmw3Mi81VjhEMkFlMHdLeWNobVpmTTZBT1ozbFd1NnNl?=
 =?utf-8?B?dXFGV0h4d0V5RFR6SGpzeWtyYXhmak5rY1J2cko2SjhHR0p3a3cxSjRZaXY0?=
 =?utf-8?B?VUZtL0llZW5tMkYzamgxZDd1eGlnVlY5OXYwVit3VVN3d2h5UndGYlRQbE9l?=
 =?utf-8?B?SWxlL2hSc2VtajBOc1RVOURRcUl1WFJKN3A2eWNYNStrMFoyVVFWRnlsdGRZ?=
 =?utf-8?B?Uy9ia24rdkI3WjNSeWxBajJWQnRQSmxQYW5IWURxRnN3OFpSSEVmenRMRWRE?=
 =?utf-8?B?WmI0eHhRYlhnam15c3ovckdGNXBnVmNZN0E5bW9meUhMd2tyY0MvcVNrOVVQ?=
 =?utf-8?B?S1hMWDZ1WFhQMUpWUjQyMzlPV1RJV3BldFNDU09WNDRyNjcraDkrczdIbUp2?=
 =?utf-8?B?Y0xlZXNMNjZkaURRRjdFa1NvNG9qY05Yekw4ZWwydVpoSFdZSk5YTDlrVzJN?=
 =?utf-8?B?M2tNVXRaUXBCZnBnZUFocmhiRE1WTmt2Y05ha0JDbnJyOGk2Tkp5ZW05VDNN?=
 =?utf-8?B?SFE5UnpPbVRVUzdjdHIzWkVLaWs5WWM5WEswQkNVdFZiVnZZN1dYR3RLTGZI?=
 =?utf-8?B?YlBkOUh2K0h5QmpRR1UvVTU3aTJHRU4zRTFVZjRYYTU1Zk1nM1NGNUFYSCtV?=
 =?utf-8?B?cENvTEpMOTgwSUlWeTM3UUhINWM3TTNDTUhmN21Ib2xYUE5rVHo4alRKRWdV?=
 =?utf-8?B?MDgzd3Z2TkdDNTgwckI0WW91TW04RFM2cFJmSE9NRmlBQzdsejRnd1pXN2pw?=
 =?utf-8?B?cisvNGNkUERzUnlpN3ZzNnhiSzBMZUdNRDZWVnFzcVhDdnFkVldGcExLQXNu?=
 =?utf-8?B?ZEZOYXlTTEhURzlsRDlQa2lPSlBuR2NyY3BOMTU5UC9nck14c05vWjdkcDFC?=
 =?utf-8?B?bEd3bXRLNEZ2eVdIdlUxRjJ5Z0JVT3E2LzlwU1RUbklGVDMzK2UvM2lQSkRo?=
 =?utf-8?B?Y2o2YUVwbWl2bm9pS1ZGNGNVMndHQ04xUUZCLy9uOVgrVkM5STkwd0k0d0xz?=
 =?utf-8?B?amJhY1ZkWWkzaTFaa1lEdUpiZjJXUEJlZ2VJNjNCUDk2UzdWaFlUOWJvc3pC?=
 =?utf-8?B?YUQyMGhBdThWc0JSQWF4OTF0c250TzRYRGVtQ3F6ekFwRVdsN2hvekliWWdE?=
 =?utf-8?B?eTZyWjV5Wmk0RXVZazlYNEtBbFMxVEdsU042QkpKR3JxY3RrbXdWSWtjZTA2?=
 =?utf-8?B?K2tqNWIvRitUNHZucGhwOFQyMTNyaUNTblNQZkJqbUdTL1Q1VmNrVk0vUm5Y?=
 =?utf-8?B?QSs3VGlhNlVhaVVra2hEZzBYaVJXcXltbWE1NnozTUdsVEZEWjNJL0tLSGU4?=
 =?utf-8?B?ZXVQM1dKOGROUTVLTVRNS1diOU56R3p1d0x1MWVuNVBGUWhHYk55Z0xMK1Yw?=
 =?utf-8?B?TjE4b1k0MG1VODNwY0VMcGhMTlprSm5nRVAybmhDNTZsemRXUlErNjV4b1VH?=
 =?utf-8?B?ZGVRNnNhVkV6V3ZFZXJxNS9XcGxVYWo3S3VlRW5UZjVEVnA5d3hUQXpaNnBG?=
 =?utf-8?Q?FvSPZOJXvtGtnT4Ba+k97HLrNR+zEXET/8DhM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGMxMkM0b2hrL3podXBISXdXWDh4VTlBaWhwRTN2aTg0OEc2ZHpNSWd1Wng4?=
 =?utf-8?B?S1luc0ppVEhDekdjRHo4Wmo4VjNTN2paRDFnVm1tR0Fjci90RGllNkZBSTBh?=
 =?utf-8?B?S28zUms3dEdwa08wUmhBMGJ5UzRrYTlEOURaWGhaK1RhY1c0alhYeXBtOE5Q?=
 =?utf-8?B?ZnpScmU0YmtDT0lPZ2JvNDVXSTg2Y1l2QjZVbmtUaE1sT0l6V014V0hVYnNz?=
 =?utf-8?B?UXcvM0NmbHM3YzMrWWFGUW1XSnVvL3QwbTFiY2lSNWRjQ3NKaEduamRpNmFK?=
 =?utf-8?B?UnkxSGhGc0w2WFdoeGZHTHZxTElmNURWVHJUeC9QbnhLbUVQaTl5U29jRDlk?=
 =?utf-8?B?S3lHRDMrb242a0t6YVU5V2szMm5jMVBPWkdKbVJ1TXBid252QXVXSnlTTEJt?=
 =?utf-8?B?NDJMOWZHSnhiN25jNUFjdTlLc2pDeTJVNStBVEVKQndPOVdJUXB4WHIxV1Vm?=
 =?utf-8?B?dlQ1UE91WFNDazlML1FqVHp4Q2dGVUNJV1lnNkxLaXRwdjBBM1ZEYUdEd2ZI?=
 =?utf-8?B?ZXJXUVpVdHFHNnpGN3FmQnVyMTdPbVg2cXcwR29sTHlHTVNUSFk3VUpUQjN4?=
 =?utf-8?B?SWxmZzByZys5NTYxQTVPZ0xaV3JwTG5udHExOGNHTTQxWHdoakNkRWtRMkJx?=
 =?utf-8?B?dVZzQ2tqeUdOdThmelZwRzNhNVJBSDV2WGR1cU1sY2sycUpGVndDODRIdnJO?=
 =?utf-8?B?cDBBMk9FYzA0MXlrTWo2eGlBMWtidXlwNlp4ZWQrSXZCL1g4emtQTEN5M3dX?=
 =?utf-8?B?R1g1N2ovS05XMWhGYTNyOTNaTEVlTmtCMTVmL08xTXF6bThrTlBoQmtvaWVp?=
 =?utf-8?B?NUVZUHJaWG5lNGt2dVQ3TEZ3Smt4Wkl3djA1S2hrTkJjWHlLUEdFR1NUS1Ez?=
 =?utf-8?B?aHpDUnVpL2NtbC8wMzd6bU85YXRmc2FTcEUvUk90N21UTFk3eElmaFN2MElW?=
 =?utf-8?B?L24zR1dGZG1oeVByNnVHbnllQnp4c2NQNzhYSTI0SnQzbjVaekZNemxoK0RC?=
 =?utf-8?B?dkI3R3NNMytVdlhlQWNmVHRzK3c3RnBMS3Fvb29xclBWWmpyR2R5MDZNSDQz?=
 =?utf-8?B?TDJPQjVYY3czdjd1Ri9aUUFsM05xWExBVWp2enVpUzhpeFA5Tk9FeGVEOTV1?=
 =?utf-8?B?T3pneE5qOG5sbmZsREtzVEhKSDkzS1kwdGcxZkhTMVlzTXJJSEFGUFl4dmRB?=
 =?utf-8?B?SW82ZXNjejVMNWZzcEJlQWZ5UEM4VGY4bGpBbU1OQVhRUUpCZXh2ZCtwOXhJ?=
 =?utf-8?B?Yzk2U2U3eWtjaTErcGt2NTM5b2xPanJ6Q3g5Q2w1Rm90clF0S1NpbXREeTY3?=
 =?utf-8?B?YWl5Q2dwOWdNbm51TUJld1RRRk5rSkpLK285K2ozaGR0UDZ1azBMcldwa2JH?=
 =?utf-8?B?S3NpN2N0SXdEbXhJempqaUE4dDVtQnVPTFVTWEFna0tKYnVMeFFjaVY0bmcy?=
 =?utf-8?B?T091SGpOQlAwQjN5NHpBNHllcjE4TU1UV0ZIM0NqRjlhTXhZd2twK1ZiNjZN?=
 =?utf-8?B?OTRrcXk4WW5mL1J4Z2wvVUJieFkzQXNtdS9BT3I5eml4NDFMYzRtTVJOMmww?=
 =?utf-8?B?QUxUK2FKN0dvRVExNXd4TUtRZy9SNHdDTE5MaC9Zc0YxaVZsVXBuNGRrQU42?=
 =?utf-8?B?UUh6SDFYVm1VZ3huVFU2L05LcXFlTUFjNy9qaUFKRDFwMlFLRmYyK29MSUhk?=
 =?utf-8?B?YVdGc1R4bnJEYWZqVzkyNVpmV2x0SmZrd3FkSDV3cy94eGxJaWN1U28yQkh0?=
 =?utf-8?B?T0EwWUNLRVUvcWYzZUNmeUgyK01LaUhzOGFPSFRBeEZlYllQOUtwQ1JTT2tC?=
 =?utf-8?B?cGptUDFZTEJMMnV1VTBGUGZrcGVIRnRDQUlJTHk5QmJhYkVxQ1VFenpKdkFW?=
 =?utf-8?B?NTFlSzZUT0FPS2pQSGE3bWJoRzBRV2VmMEIzMUJxcHQ5M0Q5R0VESWZNQnpi?=
 =?utf-8?B?OVZrVlFTcmd1bnNTSU13Tkh0N1Bzd2hjSm14RFp4TENuZzR0Q1Vad0I1cHFY?=
 =?utf-8?B?WW9LaDRKNk5jNW1hMVhkckxSdG5DcTEydEVYL0J3S3E2SE5YTE5rbmI3Z1Ru?=
 =?utf-8?B?RnZ3QTlDQjE3TlhWTm12YWY3TjU5TzhDd1BnSW1yOWVPSlBzVFNEa0tsZ2tS?=
 =?utf-8?B?V2hNT3dnS1pPWCtLbFFVbjhOV1p5NER0NTJTOUF5SjkzVG5zdjh4Z1Jkb1N0?=
 =?utf-8?B?WE1qZUw5Mmp5a3VzVzRlUmFOZkJaWDV0cXV1SU1IWE1OYnpvMWlZb0tyRmRP?=
 =?utf-8?B?c0dJaVBraVEvY0xIQjRoWUY3MjZnPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb8f1cb-cb94-424c-be4a-08ddda5cf5ed
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:31:35.5729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7t6zffx9A6ra1Ynv+yYwIZ8qTlG7UG3Lj+JQzCr2FHc+USEMMjHbvzRivBwI5POmZuJewarQNXlwbhkO4bDCrljU8agt7km37J6N57ZOk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6916

On 8/13/25 13:23, Fabio Estevam wrote:
> Hi Maud,
> 
> [Adding Tim]
> 
> On Wed, Aug 13, 2025 at 8:12 AM Maud Spierings
> <maudspierings@gocontroll.com> wrote:
> 
>> My devicetree setup is practically identical to the one in
>> freescale/imx8mp-venice-gw74xx-imx219.dtso (different i2c bus and
>> regulator gpio only)
> 
> You'll need to configure the camera pipeline using media-ctl commands.
> 
> Take a look at:
> https://trac.gateworks.com/wiki/venice/multimedia#MediaControllerPipeline

I have been messing around with that, but it still shouldn't panic right?

It seems to be happen in:
sd = media_entity_to_v4l2_subdev(pad->entity);

in mxc_isi_crossbar_xlate_streams()

Checking now if the pad variable is the issue

it seems media_pad_remote_pad_first() can return NULL which would cause 
the issue there I think.

