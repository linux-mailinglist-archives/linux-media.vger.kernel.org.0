Return-Path: <linux-media+bounces-20970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6269BDE52
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 06:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8984284FBD
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 05:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6892190676;
	Wed,  6 Nov 2024 05:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="cyLdzUNi"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2127.outbound.protection.outlook.com [40.107.255.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C01F189902;
	Wed,  6 Nov 2024 05:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730871198; cv=fail; b=HbfyVijhzZikSAMBtT2RIsjFEDGYoeHXTPuJIyHx9YmGtNCllkfl6p1d6eiBdiMZC6cRTkJhIu5HLaAbd+kAOByeUsAtzrNwAHOPK8FPOPDmXEXsQz8QPPtM5SADmQ8ZMF7j1Y6sPwT23l8Uy9HvapMmWnTxq5yM+0bzHu7cn60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730871198; c=relaxed/simple;
	bh=tXLi0FZL58jGVKi3rI+4UOCqeA9jxuT+uLlBi/F2WhI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VmmeUkdQyvICDrarqmKvHy7Mu5F31HFwxgDX3cdYSRvXwGBujuZoV4gEVVmsDVK89nknFdjR9eY/k86mxGQWzgN8YnL4PkBGfaMsMWsD7bWu1iWeM0IPAq9klM0zbvt56307uJ7+1gJpuGiYVjOulk3TxQzUvovDSjetHt7NS4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=cyLdzUNi; arc=fail smtp.client-ip=40.107.255.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikuA1UGSrcKTDhnEoWYJWYE5s8mJ0Q+udjgNwPtFBAQ3G/OE5UyneSbLUzIHFDAYeIlNwQbpfgqF+8CtZRiOus2jzIfqla2ynye7t4kO21BJ1lUyjm5nTPEcoLqFtVAHdNuSQ+bauCFtNjBoJ++dH0fx5hT6w0yALKx5jnvK+wamUjfHOnChOk5mRjTzFUOjd/xrsN5Txqe5FWgvV8ZjFzegHHHiQ3gXvnkp+FkUxqAuXFmJepQik3ZXrGIOMAfak/RwFYUyS2LgS4yYvSg0KHthdFPesL+hvIi2jmNfaiH1kcuMqTt2rjAAJgFfE7yY1awWFhkiVs1HjF5L/7Zb2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3rrsR+VEr7nJTFDFGNrOCjvMBplM4BSJMa63zJ8VaE=;
 b=vqb/LS3NPvGsmbIE2+xO4ZVlE+AJNhXBShBKc4NqdzMEUAKcWsm57LhMI16ZNnLKyb7BMXcybPNCyPA2BgF7jGHoWaOzNNeI4Im4p2/ODAZSlCTAi7G+SENRTxr96GP1hbgU5/7sZkN+/RtDlE8jtf50VUUC+apCcXbFCr0If+I86X6F0Z0YhXDyWgLIyHOlvcx9z2VMwZISw5j38AlCS96BSoox0RUpsJhIp9PEV51ww7PusIr7QW6XG/vipIR9MaMc7QTfP7dlMDKvW6q7H5twf2ehD22a3GnPcK6jhmaGjIf6XGOqtAlpuLMHtix4d4H23fauP6k9HVPShCd1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3rrsR+VEr7nJTFDFGNrOCjvMBplM4BSJMa63zJ8VaE=;
 b=cyLdzUNiMf1fjfHoHDF9tL96l7wUkdEIPYto/pJtvxYTu/gsNWvqwwpNCTmUQjh7jaSR/dUw5c8FQoxz4c/gJ8jpijp4mvgW9IGNqCICpMqneYIV85g1lT7e7tbTBjasXdYra+++ErZkNb8t81czCV6fxdF0FYD4NOUAiyPIm6Kfmj74o7xV+WCnbTbYsXvSAShfnTplvT0oU81PaZKVWCtgiW/gWnqrksoe7pA9y2J/bFFyjdO+wLvhHkud/Pp7edDe3mxc37nAWz0XTei5IU0NG4zRLSztAP5LyRMX+Xc91+lrdn7CFF+KJlSaSsN4+zZa39052rpa9PGaFFO9GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYSPR03MB7762.apcprd03.prod.outlook.com (2603:1096:400:413::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 05:33:03 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%3]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 05:33:03 +0000
Message-ID: <e8430e0c-d6ba-4ef4-a495-cbc2f5c951e7@amlogic.com>
Date: Wed, 6 Nov 2024 13:32:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] media: platform: Add c3 mipi adapter driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
 <20240918-c3isp-v3-4-f774a39e6774@amlogic.com>
 <b6jb473565arawtxojycdwlffjws7jhev4gaakc2u5qhebndae@hpeppsgmjrvo>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <b6jb473565arawtxojycdwlffjws7jhev4gaakc2u5qhebndae@hpeppsgmjrvo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYSPR03MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a50b26-e483-4ba9-3b1e-08dcfe247be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bS9RVXZBZk1FYUFNQWdPYVhRalNOcDFrWXVNMnhnT2ExSWdLZ3JTT2k5WDN1?=
 =?utf-8?B?ODQ4YndjdmdkMkJXK21sT2lPeGRBY3hjQkxNUFNBOUVpTjI0cm5kRnhVYzY4?=
 =?utf-8?B?OVlVQWJLd0RjT0ZudDR1U25PZ29wV3p2VGVsS2lTNG92ZlNCRFYxWklxQ3lo?=
 =?utf-8?B?T0l3M1l4dURXWEJRcmRlMjc1V3NTdGxPZGsvMXdkaFBWK29ZU2NyMzFYRHhD?=
 =?utf-8?B?ZkQ2VXZDY2pmOStTVzN5S1dmQ3BTYzdrMnZrZ2lDR3EzRkdmZFRjN0p4QVF4?=
 =?utf-8?B?WWJZcW52Yk94MjRKOXpCblJuQ21KOUQwOWUzNXhIbEs4Z2w1WDFWd3V5WXBO?=
 =?utf-8?B?MG1PNFpQYU4vSkMwVVJKQ0kzTjR0Q1h2Q3dnUVV2MjhtTUFabXJyUmxGYURF?=
 =?utf-8?B?b0hHNElUZnd5VVB5ZTVHQklvMDE1ZjJZdWJKd3c3dTZHVnlOMEY1MlE1VVl2?=
 =?utf-8?B?b2Izd3A4N0pNZFk5L1QwTGpZU1RMOVc1OW4wYm5wVlJWeTkrOVhHTG1WaTBP?=
 =?utf-8?B?Z3hWYlNNMTdnNnpHaGloc2xIYU0vZEFZdmhLNGprTEp2aUhOTnpvdmJhNVZG?=
 =?utf-8?B?NStCV0VIQ05SaUxGNWk5SnBTVkN2emNDd09MeWppUEZzbE9tWkpseXdCZ2V1?=
 =?utf-8?B?TnZsL2tsTDhJNE93NmwvUmVIL0JCRHdYUFd3elZ1TUZvazlXdDV6aDdoTFIz?=
 =?utf-8?B?NDRTNW5uSDE4R2h6NU8wSlMxeXNGa0ZFODN4R0h2UkFlU2lCSE1VdUlaT1d4?=
 =?utf-8?B?NG1SQXc0UnFlRUNnZU4vY09pRW5ERmV2cTFCbGtGZlVWZytxNGdodmFXV3Ru?=
 =?utf-8?B?NHVrVllvWHlCbXR6eWtNMUhXYW5OWXFqM2wvbWhsRFkxamJyYmVHajdlUTNm?=
 =?utf-8?B?NUpvc3F2ellvQ1JkTldJZCtqWEdlQkVabzdNR01ERWpVbUNkM00xS2NZSGRv?=
 =?utf-8?B?bVp0Qmh0ekNVZlQyN1Nmd0J1YVVOWGxoZ0tVS0lUTVc3NnZ1S0FDM21COG81?=
 =?utf-8?B?OG5tMURMWm01a1pKQ1dqZVF0aHdCdUZPVUkzQUFpN2kzUEIzdm9iL3BYTmR2?=
 =?utf-8?B?bitha091cGx3azltdWI5ZzBtSmNIVzVmd1dnL29ISDhjYnN4NjdWYjhUenhI?=
 =?utf-8?B?L0dDVE5iN2IzVWFleXJWWjRGeDFxNTZtdEJiZnRvQkZaRmFJTXRJakVhTkRY?=
 =?utf-8?B?MmRSZmVHNzFocEs3TEhTY2pwREkxbktqSHhhRS9SMFhCb2R1RXR1RTNoWlhP?=
 =?utf-8?B?SFYzMUdBVkk2THhJZ3Z6RTRrQXhyVWRpTitORUduaThVMEtDbERzdWhhMUJM?=
 =?utf-8?B?Q1E5RjY5OTI0L1B4cmZPSENEWXNPUEdCVHlQMURhck1WY2xnODVkUkZpMUcr?=
 =?utf-8?B?U2c1NE9ReG1WNTVaTTgzTGV1eWdSMG1xMEhINVlkcGRMdHVHVy80aXhSZU9R?=
 =?utf-8?B?NG0wenkvaGxYajc5RGRyaXRreHlQR2VISndTb1JOMFVsUjhmN1pzaVdyajd4?=
 =?utf-8?B?U1F5bTlhVVpET2hrZHIwb2o2ZUpqNDVNMVFUUUdQZkRyQytKSFNKR3d6WUt6?=
 =?utf-8?B?Z3Q1elBIK1RZSDRsbzhpaVpYNUEzNGNENnNVajhFNnJnYWRrL1B1RmM3TGtE?=
 =?utf-8?B?MkM2SC90ZEtaYmk2Y2dzc2hkWTVQZVY0UUtvT2Z1U2R0SnN0OXBBNFZxUmty?=
 =?utf-8?B?bmNNeENFN2VHVExJcDR6cyt0ZDlUQ1VERFl6VW5rMnlMM1N6Rkc0eWQ3em9V?=
 =?utf-8?Q?RWWbyGBMmZGn3B28+ysUMSz/NYlcWnLbTNAwPFf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckszNGdWSUIxMlVIaUFTQ2xjdGM3eGhLMDdZeFQ2bElEL3JuQ2F4emd3ZU9l?=
 =?utf-8?B?cFZocVJKeDF1bHVaakJKeGg2UDVLcExoZU9IZ1dXL2JYQmZXc0YrWXlnVlQ1?=
 =?utf-8?B?RVlQRDI4UmFaKzhJdWY0MUN6dm5BSnJoeXY4bkhXcEx5a0NWbEoxbjcxOEFX?=
 =?utf-8?B?K1F1ZndqK2ZDVjBLNFV5R3E4VFd3NmxxTkZPbHVMMTRESzFaNzVZZ3I3LzVw?=
 =?utf-8?B?SThOUy91SUs3TE5BdXFDTjgydTZrRURtb21GYlBvVzZhcDlOMFBwRngxenNs?=
 =?utf-8?B?d2FGb2EwNVQ1NTdwRWNqdkkwTXN0S3I3OEhuRDNGVUUxRGFxeDVpRTM2L1hR?=
 =?utf-8?B?SGpIalJmUmhsbkNXU0VpakF6NUFLWjlDOVhzRm51Uklhb3lKeUFrdVpKbDZF?=
 =?utf-8?B?T09aOTJudXZvcHViSndvZlBnaHFUSzVTeFdQU25ESnN3TDhmMGFwWkh0dEM1?=
 =?utf-8?B?WXF1Rkw1RktCT3MwVmJsb2ovK0t4dVpIOURvZUJzWHJRMjE4RHA1Z1pHako0?=
 =?utf-8?B?YlBpT3g0OGs5TzZxQ1ZLTHVDK0NQY0F3VThVTTJVVnhYa0toTHVYcTVLQlV6?=
 =?utf-8?B?dzV5V2hGRm16ZFpTNXlBQXA2SER5cFlQOCttSThETmkrWUtITkNhMjh3eXVK?=
 =?utf-8?B?ak1RMGl3cmNOTGRnVDVOaFk4ckorNnA4MmZueG1xcXdFL0h0NGdwYVhYUEVG?=
 =?utf-8?B?RnFXVW1oOGhSbEw2VE13NWxEQkR4NnVONURiQ09DQnY5QXUyU1F5d1NLZlh1?=
 =?utf-8?B?bm44TEFvS1h4clhiWmJuSWE2RXkvdXE2Znd2alhYd2c5OUJyTjZId2ZyUWls?=
 =?utf-8?B?RVlnbkwzVWVQZ1B6WUlycUdjaklyR0oxV3RUY09CUUpjVWVxSWZoZG85Smxq?=
 =?utf-8?B?Szg1Yzh1VmdRY2NZVHp5REpSV2FNc2JSZS90MXFiWXlIRTdrSjF6Ulk1alRY?=
 =?utf-8?B?OEwxNmtMZ21MQ0hob1FtUzZGdU8rVWE1ZTJqcUpXaEUwblVqNGlTT1FuYjMz?=
 =?utf-8?B?blZHak1YOWFtY2tIdjdreFE2VG8zSHZXWlZZSDBHQ0U0aDhlWXlyOFd5cUZK?=
 =?utf-8?B?WHpzY1RvNTVpRCt6R1gxajdVMU1NS0kxSS8ycVpYVmpHcXlKVXRZcGw4cUg0?=
 =?utf-8?B?TlJidUhTaVY3N2RuNG05NHptM0cvRUdxZmgrQndoUFdSZDA3VjZYYVl0RlR3?=
 =?utf-8?B?R0VHNkQyK1lMcTA4N3dNSUIzeWpvUFRzNy9vMkhsWDZybDc1UjZIKy9XQkxJ?=
 =?utf-8?B?VFVCMVhCR2JxSmRLSGhXbCt3SjMyQ2RIa2RsbGJVdkNySnloZXc3b25PODVJ?=
 =?utf-8?B?aHJqakRJdFlUNldkeE9mU1JuOGx4VWNhYUk0MG5NUDJMSzFaUSsvSE5YQ3h6?=
 =?utf-8?B?bjBGU25wK09ZSzBCNE5oWDBqYlR0ekUzM1lEWXBqRTlhaGxBYkxWOWl0dEJn?=
 =?utf-8?B?eHVoZHNMZFoxYkV5NTFCRkg0aTBGYTR2ZHc5RG0zMWNobUlPYVhCSkV0Q29C?=
 =?utf-8?B?dWdtTk4vREhYaHR6Mm02TlNQdUNvRjNlc3U4aFRnR0NJYllqMCsxQXNReEFG?=
 =?utf-8?B?K0pMQ0tIVStIZzVXR3JPNTUrMGpuYWFxZDRqNjRxWGVtbHoraytzVjJjMkcw?=
 =?utf-8?B?OUI0OEVxTjlOcHY4ZGI3MklPcmVNcWNoM1JYZjYrMzBjd0ZwTHdJbXhaVHk4?=
 =?utf-8?B?MjQ0R0ZxNXUxdTBOd2o5ZER0RGVvUmdySFMrMmkyY2lNMThqcmZtenJzb0I0?=
 =?utf-8?B?RlF2MURGYTlMY21xTTZTVjViWnR5TjkrR1VnK29wZkVlVng4bzh4aG1iOXBG?=
 =?utf-8?B?MzVvT2pXakFOcDR2YkNkYThCN3NsQk1hcUtEMGxEMkx6RlJrRUJ5VlhlN1Q0?=
 =?utf-8?B?T1BvQXZKdGo2U0JUaWYrdm1zMmhPdW5kcTVQZzVxYWpOUGZOQjdsTFV0TVNr?=
 =?utf-8?B?M2JpOGpvdFRFSmJ4eU5yeU9lSlQ1QVp4b1BpYkdOeW05ZnFyaDVpQTRrY0xO?=
 =?utf-8?B?SDFwb09SK3BFbUZUVHZNc1lMRGwzS042VjhYNzh3M254aExScHlab1MxcE5R?=
 =?utf-8?B?OStkY211MEhMNzRNbThVV29YeGF0YUVxRGY4dXFpVFRmOFcrbWdobk9YMTN2?=
 =?utf-8?Q?qE0s40NDDqGZWwjBIveViWerh?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a50b26-e483-4ba9-3b1e-08dcfe247be9
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 05:33:03.2853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ijd78kIgxjVVV5wdvv9uyaxCLqkimg/gSk4rk8/9iN67t0/Ds+JgZ6oyxBtxH25BcHauZYNI8hbMCpM6KVUmpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7762

Hi Jacopo

Thanks very much for your reply.

On 2024/11/5 19:24, Jacopo Mondi wrote:
> [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
> On Wed, Sep 18, 2024 at 02:07:15PM +0800, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> This driver mainly responsible for organizing
>> MIPI data and sending raw data to ISP pipeline.
> A few questions on the design of this subdevice.
>
> In my understanding the adapter provides several functionalities:
>
> - Data alignement to match the ISP size constraints
> - Read from DDR memory or from the CSI-2 RX (direct path)
> - Write to DDR memory or to the ISP (direct path)
> - Split data streams to DDR or direct path based on CSI-2 Virtual
>    Channel and Data type.


Yes, you are right.

> As I understand the current implementation only supports direct-path
> to ISP of data sent on VC#0.


Read image from DDR and wirte image to DDR  are used in WDR mode.

Due to the lack of WDR requirement,  This driver only support direct-path.

> Do you plan to expand the adapter subdev with support for mulitple
> paths ? Is this why you are supporting already a routing table ?

If there is a demand in the future, I will support multiple paths.

But now I attend to only support one path and will drop the 
set_routing() interface.


>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   MAINTAINERS                                        |   7 +
>>   drivers/media/platform/amlogic/Kconfig             |   1 +
>>   drivers/media/platform/amlogic/Makefile            |   1 +
>>   .../media/platform/amlogic/c3-mipi-adapter/Kconfig |  16 +
>>   .../platform/amlogic/c3-mipi-adapter/Makefile      |   3 +
>>   .../amlogic/c3-mipi-adapter/c3-mipi-adap.c         | 913 +++++++++++++++++++++
>>   6 files changed, 941 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9e75874a6e69..31168c05f304 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1209,6 +1209,13 @@ F:     Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
>>   F:   drivers/perf/amlogic/
>>   F:   include/soc/amlogic/
>>
>> +AMLOGIC MIPI ADAPTER DRIVER
>> +M:   Keke Li <keke.li@amlogic.com>
>> +L:   linux-media@vger.kernel.org
>> +S:   Maintained
>> +F:   Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
>> +F:   drivers/media/platform/amlogic/c3-mipi-adapter/
>> +
>>   AMLOGIC MIPI CSI2 DRIVER
>>   M:   Keke Li <keke.li@amlogic.com>
>>   L:   linux-media@vger.kernel.org
>> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
>> index b7c2de14848b..df09717b28d0 100644
>> --- a/drivers/media/platform/amlogic/Kconfig
>> +++ b/drivers/media/platform/amlogic/Kconfig
>> @@ -2,5 +2,6 @@
>>
>>   comment "Amlogic media platform drivers"
>>
>> +source "drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig"
>>   source "drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig"
>>   source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
>> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
>> index 4f571ce5d13e..b370154b090c 100644
>> --- a/drivers/media/platform/amlogic/Makefile
>> +++ b/drivers/media/platform/amlogic/Makefile
>> @@ -1,4 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>
>> +obj-y += c3-mipi-adapter/
>>   obj-y += c3-mipi-csi2/
>>   obj-y += meson-ge2d/
>> diff --git a/drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig b/drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig
>> new file mode 100644
>> index 000000000000..bf19059b3543
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig
>> @@ -0,0 +1,16 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config VIDEO_C3_MIPI_ADAPTER
>> +     tristate "Amlogic C3 MIPI adapter"
>> +     depends on ARCH_MESON || COMPILE_TEST
>> +     depends on VIDEO_DEV
>> +     depends on OF
>> +     select MEDIA_CONTROLLER
>> +     select V4L2_FWNODE
>> +     select VIDEO_V4L2_SUBDEV_API
>> +     help
>> +       Video4Linux2 driver for Amlogic C3 MIPI adapter.
>> +       C3 MIPI adapter mainly responsible for organizing
>> +       MIPI data and sending raw data to ISP pipeline.
>> +
>> +       To compile this driver as a module choose m here.
>> diff --git a/drivers/media/platform/amlogic/c3-mipi-adapter/Makefile b/drivers/media/platform/amlogic/c3-mipi-adapter/Makefile
>> new file mode 100644
>> index 000000000000..216fc310c5b4
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3-mipi-adapter/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-$(CONFIG_VIDEO_C3_MIPI_ADAPTER) += c3-mipi-adap.o
>> diff --git a/drivers/media/platform/amlogic/c3-mipi-adapter/c3-mipi-adap.c b/drivers/media/platform/amlogic/c3-mipi-adapter/c3-mipi-adap.c
>> new file mode 100644
>> index 000000000000..b64eb417c2e2
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3-mipi-adapter/c3-mipi-adap.c
>> @@ -0,0 +1,913 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-common.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-fwnode.h>
>> +#include <media/v4l2-mc.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +/* C3 adapter submodule definition */
>> +enum {
>> +     SUBMD_TOP,
>> +     SUBMD_FD,
>> +     SUBMD_RD,
>> +};
>> +
>> +#define ADAP_SUBMD_MASK             GENMASK(17, 16)
>> +#define ADAP_SUBMD_SHIFT            16
>> +#define ADAP_SUBMD(x)               (((x) & (ADAP_SUBMD_MASK)) >> (ADAP_SUBMD_SHIFT))
>> +#define ADAP_REG_ADDR_MASK          GENMASK(15, 0)
>> +#define ADAP_REG_ADDR(x)            ((x) & (ADAP_REG_ADDR_MASK))
>> +#define ADAP_REG_T(x)               ((SUBMD_TOP << ADAP_SUBMD_SHIFT) | (x))
>> +#define ADAP_REG_F(x)               ((SUBMD_FD << ADAP_SUBMD_SHIFT) | (x))
>> +#define ADAP_REG_R(x)               ((SUBMD_RD << ADAP_SUBMD_SHIFT) | (x))
>> +
>> +#define MIPI_ADAP_CLOCK_NUM_MAX     3
>> +#define MIPI_ADAP_SUBDEV_NAME       "mipi-adapter"
> I would add a "c3-" prefix
>

Will add "c3-" prefix

>> +
>> +/* C3 MIPI adapter TOP register */
>> +#define MIPI_ADAPT_DE_CTRL0         ADAP_REG_T(0x40)
>> +#define ADAP_DE_READ_BYPASS         BIT(3)
>> +#define ADAP_DE_WRITE_BYPASS        BIT(7)
>> +
>> +/* C3 MIPI adapter FRONTEND register */
>> +#define CSI2_CLK_RESET              ADAP_REG_F(0x00)
>> +#define ADAP_FD_APPLY_RESET         BIT(0)
>> +#define ADAP_FD_ENABLE              BIT(1)
>> +
>> +#define CSI2_GEN_CTRL0              ADAP_REG_F(0x04)
>> +#define ADAP_FD_VIRTUAL_CHN0_EN     BIT(0)
>> +#define ADAP_FD_VIRTUAL_CHN1_EN     BIT(1)
>> +#define ADAP_FD_VIRTUAL_CHN2_EN     BIT(2)
>> +#define ADAP_FD_VIRTUAL_CHN3_EN     BIT(3)
>> +#define ADAP_FD_ENABLE_PACKETS      GENMASK(20, 16)
>> +#define ADAP_FD_ENABLE_RAW          BIT(16)
>> +
>> +#define CSI2_X_START_END_ISP        ADAP_REG_F(0x0c)
>> +#define ADAP_FD_X_END_MASK          GENMASK(31, 16)
>> +#define ADAP_FD_X_END_SHIFT         16
>> +#define ADAP_FD_X_END(x)            ((x) - 1)
>> +
>> +#define CSI2_Y_START_END_ISP        ADAP_REG_F(0x10)
>> +#define ADAP_FD_Y_END_MASK          GENMASK(31, 16)
>> +#define ADAP_FD_Y_END_SHIFT         16
>> +#define ADAP_FD_Y_END(x)            ((x) - 1)
>> +
>> +#define CSI2_VC_MODE                ADAP_REG_F(0x1c)
>> +#define ADAP_FD_VS_SEL_VC_MASK      GENMASK(19, 16)
>> +#define ADAP_FD_VS_DIRECT_PATH      BIT(16)
>> +#define ADAP_FD_HS_SEL_VC_MASK      GENMASK(23, 20)
>> +#define ADAP_FD_HS_DIRECT_PATH      BIT(20)
>> +
>> +/* C3 MIPI adapter READER register */
>> +#define MIPI_ADAPT_DDR_RD0_CNTL0    ADAP_REG_R(0x00)
>> +#define ADAP_RD0_MODULE_ENABLE      BIT(0)
>> +#define ADAP_RD0_LINE_STRIDE_MASK   GENMASK(13, 4)
>> +#define ADAP_RD0_LINE_STRIDE_SHIFT  4
>> +#define ADAP_RD0_SAMPLE_SEL_MASK    GENMASK(27, 26)
>> +#define ADAP_RD0_DATA_IN_VSYNC      BIT(26)
>> +#define ADAP_RD0_BURST_TYPE_MASK    GENMASK(29, 28)
>> +#define ADAP_RD0_BURST_TYPE_SHIFT   28
>> +#define ADAP_RD0_BURST_TYPE_INRC8   3
>> +#define ADAP_RD0_FRAME_RD_START     BIT(31)
>> +
>> +#define MIPI_ADAPT_DDR_RD0_CNTL1    ADAP_REG_R(0x04)
>> +#define ADAP_RD0_LINE_SIZE_MASK     GENMASK(9, 0)
>> +#define ADAP_RD0_LINE_NUM_MASK      GENMASK(28, 16)
>> +#define ADAP_RD0_LINE_NUM_SHIFT     16
>> +
>> +#define MIPI_ADAPT_PIXEL0_CNTL0     ADAP_REG_R(0x80)
>> +#define ADAP_PIXEL0_WORK_MODE_MASK  GENMASK(17, 16)
>> +#define ADAP_PIXEL0_DIRECT_PATH     BIT(16)
>> +#define ADAP_PIXEL0_DATA_TYPE_MASK  GENMASK(25, 20)
>> +#define ADAP_PIXEL0_DATA_TYPE_SHIFT 20
>> +#define ADAP_PIXEL0_DATA_TYPE_10BITS 0x2b
>> +#define ADAP_PIXEL0_DATA_TYPE_12BITS 0x2c
>> +#define ADAP_PIXEL0_START_ENABLE    BIT(31)
>> +
>> +#define MIPI_ADAPT_PIXEL0_CNTL1     ADAP_REG_R(0x84)
>> +#define ADAP_PIXEL0_X_END_MASK      GENMASK(15, 0)
>> +#define ADAP_PIXEL0_X_END(x)        ((x) - 1)
>> +
>> +#define MIPI_ADAPT_PIXEL0_CNTL2     ADAP_REG_R(0x88)
>> +#define ADAP_PIXEL0_FIFO_SIZE_MASK  GENMASK(9, 0)
>> +#define ADAP_PIXEL0_PIXEL_NUM_MASK  GENMASK(27, 15)
>> +#define ADAP_PIXEL0_PIXEL_NUM_SHIFT 15
>> +
>> +#define MIPI_ADAPT_ALIG_CNTL0       ADAP_REG_R(0x100)
>> +#define ADAP_ALIG_V_TOTAL_NUM_MASK  GENMASK(15, 0)
>> +/* Need to add a default blank */
>> +#define ADAP_ALIG_V_TOTAL_NUM(x)    ((x) + 64)
>> +#define ADAP_ALIG_H_TOTAL_NUM_MASK  GENMASK(31, 16)
>> +#define ADAP_ALIG_H_TOTAL_NUM_SHIFT 16
>> +/* Need to add a default blank */
>> +#define ADAP_ALIG_H_TOTAL_NUM(x)    ((x) + 64)
>> +
>> +#define MIPI_ADAPT_ALIG_CNTL1       ADAP_REG_R(0x104)
>> +#define ADAP_ALIG_HPE_NUM_MASK      GENMASK(31, 16)
>> +#define ADAP_ALIG_HPE_NUM_SHIFT     16
>> +
>> +#define MIPI_ADAPT_ALIG_CNTL2       ADAP_REG_R(0x108)
>> +#define ADAP_ALIG_VPE_NUM_MASK      GENMASK(31, 16)
>> +#define ADAP_ALIG_VPE_NUM_SHIFT     16
>> +
>> +#define MIPI_ADAPT_ALIG_CNTL3       ADAP_REG_R(0x10c)
>> +#define ADAP_ALIG_FRM_ST_PIXEL_MASK GENMASK(15, 0)
>> +
>> +#define MIPI_ADAPT_ALIG_CNTL6       ADAP_REG_R(0x118)
>> +#define ADAP_ALIG_LANE0_ENABLE      BIT(0)
>> +#define ADAP_ALIG_DATA_MODE0_MASK   BIT(4)
>> +#define ADAP_ALIG_DIRECT_MODE       BIT(4)
>> +#define ADAP_ALIG_VDATA0_ENABLE     BIT(12)
>> +#define ADAP_ALIG_VDATA1_ENABLE     BIT(13)
>> +#define ADAP_ALIG_VDATA2_ENABLE     BIT(14)
>> +#define ADAP_ALIG_VDATA3_ENABLE     BIT(15)
>> +
>> +#define MIPI_ADAPT_ALIG_CNTL8       ADAP_REG_R(0x120)
>> +#define ADAP_ALIG_FRAME_CONTINUE    BIT(5)
>> +#define ADAP_ALIG_EXC_MASK_DIS      BIT(12)
>> +#define ADAP_ALIG_START_ENABLE      BIT(31)
>> +
>> +#define MIPI_ADAP_MAX_WIDTH         2888
>> +#define MIPI_ADAP_MIN_WIDTH         160
>> +#define MIPI_ADAP_MAX_HEIGHT        2240
>> +#define MIPI_ADAP_MIN_HEIGHT        120
>> +#define MIPI_ADAP_DEFAULT_WIDTH     1920
>> +#define MIPI_ADAP_DEFAULT_HEIGHT    1080
>> +#define MIPI_ADAP_DEFAULT_FMT       MEDIA_BUS_FMT_SRGGB10_1X10
>> +
>> +/* C3 MIPI adapter pad list */
>> +enum {
>> +     MIPI_ADAP_PAD_SINK,
>> +     MIPI_ADAP_PAD_SRC,
>> +     MIPI_ADAP_PAD_MAX
>> +};
>> +
>> +/*
>> + * struct adap_info - mipi adapter information
>> + *
>> + * @clocks: array of mipi adapter clock names
>> + * @clock_rates: array of mipi adapter clock rate
>> + * @clock_num: actual clock number
>> + */
>> +struct adap_info {
>> +     char *clocks[MIPI_ADAP_CLOCK_NUM_MAX];
>> +     u32 clock_rates[MIPI_ADAP_CLOCK_NUM_MAX];
>> +     u32 clock_num;
>> +};
>> +
>> +/**
> Here as well you can drop one * from /**


Will drop one  * from  /**

>> + * struct adap_device - mipi adapter platform device
>> + *
>> + * @dev: pointer to the struct device
>> + * @top: mipi adapter top register address
>> + * @fd: mipi adapter frontend register address
>> + * @rd: mipi adapter reader register address
>> + * @clks: array of MIPI adapter clocks
>> + * @sd: mipi adapter sub-device
>> + * @pads: mipi adapter sub-device pads
>> + * @notifier: notifier to register on the v4l2-async API
>> + * @format: save sub-device format
>> + * @src_sd: source sub-device
>> + * @src_sd_pad: source sub-device pad
>> + * @lock: protect mipi adapter device
>> + * @info: version-specific MIPI adapter information
>> + */
>> +struct adap_device {
>> +     struct device *dev;
>> +     void __iomem *top;
>> +     void __iomem *fd;
>> +     void __iomem *rd;
>> +     struct clk_bulk_data clks[MIPI_ADAP_CLOCK_NUM_MAX];
>> +
>> +     struct v4l2_subdev sd;
>> +     struct media_pad pads[MIPI_ADAP_PAD_MAX];
>> +     struct v4l2_async_notifier notifier;
>> +     struct v4l2_subdev_format format;
>> +     struct v4l2_subdev *src_sd;
>> +
>> +     u16 src_sd_pad;
>> +     struct mutex lock; /* Protect adapter device */
> Most comments on the csi2-rx patch apply to this one as well.
> In this case, you don't need locking for functions that receive a
> subdev_state
>
Will remove this lock.
>> +     const struct adap_info *info;
>> +};
>> +
>> +/* Format helpers */
>> +
>> +struct adap_pix_format {
>> +     u32 code;
>> +     u8 width;
> I would call it bpp
Will replace width with bpp
>> +};
>> +
>> +static const struct adap_pix_format c3_mipi_adap_formats[] = {
>> +     { MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
>> +     { MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
>> +     { MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
>> +     { MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
>> +     { MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
>> +     { MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
>> +     { MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
>> +     { MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
>> +};
>> +
>> +static const struct adap_pix_format
>> +*c3_mipi_adap_find_format(u32 code)
>> +{
>> +     unsigned int i;
>> +
>> +     for (i = 0; i < ARRAY_SIZE(c3_mipi_adap_formats); i++)
>> +             if (code == c3_mipi_adap_formats[i].code)
>> +                     return &c3_mipi_adap_formats[i];
>> +
>> +     return NULL;
>> +}
>> +
>> +/* Hardware configuration */
>> +
>> +static void c3_mipi_adap_update_bits(struct adap_device *adap, u32 reg,
>> +                                  u32 mask, u32 val)
>> +{
>> +     void __iomem *addr;
>> +     u32 orig, tmp;
>> +
>> +     switch (ADAP_SUBMD(reg)) {
>> +     case SUBMD_TOP:
>> +             addr = adap->top + ADAP_REG_ADDR(reg);
>> +             break;
>> +     case SUBMD_FD:
>> +             addr = adap->fd + ADAP_REG_ADDR(reg);
>> +             break;
>> +     case SUBMD_RD:
>> +             addr = adap->rd + ADAP_REG_ADDR(reg);
>> +             break;
>> +     default:
>> +             dev_err(adap->dev, "Invalid sub-module: %lu\n", ADAP_SUBMD(reg));
>> +             return;
>> +     }
>> +
>> +     orig = readl(addr);
>> +     tmp = orig & ~mask;
>> +     tmp |= val & mask;
>> +
>> +     if (tmp != orig)
>> +             writel(tmp, addr);
>> +}
>> +
>> +/* Configure adapter top sub module */
>> +static void c3_mipi_adap_cfg_top(struct adap_device *adap)
>> +{
>> +     /* Bypass decompress */
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DE_CTRL0,
>> +                              ADAP_DE_READ_BYPASS, ADAP_DE_READ_BYPASS);
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DE_CTRL0,
>> +                              ADAP_DE_WRITE_BYPASS, ADAP_DE_WRITE_BYPASS);
>> +}
>> +
>> +/* Configure adapter frontend sub module */
>> +static void c3_mipi_adap_cfg_frontend(struct adap_device *adap,
>> +                                   struct v4l2_mbus_framefmt *fmt)
>> +{
>> +     /* The default value of BIT_0 is 1, so need release reset firstly. */
>> +     c3_mipi_adap_update_bits(adap, CSI2_CLK_RESET, ADAP_FD_APPLY_RESET, 0);
>> +
>> +     c3_mipi_adap_update_bits(adap, CSI2_X_START_END_ISP, ADAP_FD_X_END_MASK,
>> +                              ADAP_FD_X_END(fmt->width) << ADAP_FD_X_END_SHIFT);
>> +     c3_mipi_adap_update_bits(adap, CSI2_Y_START_END_ISP, ADAP_FD_Y_END_MASK,
>> +                              ADAP_FD_Y_END(fmt->height) << ADAP_FD_Y_END_SHIFT);
>> +
>> +     /* Select VS and HS signal to direct path */
>> +     c3_mipi_adap_update_bits(adap, CSI2_VC_MODE, ADAP_FD_VS_SEL_VC_MASK,
>> +                              ADAP_FD_VS_DIRECT_PATH);
>> +     c3_mipi_adap_update_bits(adap, CSI2_VC_MODE, ADAP_FD_HS_SEL_VC_MASK,
>> +                              ADAP_FD_HS_DIRECT_PATH);
>> +
>> +     /* Enable to receive RAW image */
>> +     c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0, ADAP_FD_ENABLE_PACKETS,
>> +                              ADAP_FD_ENABLE_RAW);
>> +
>> +     /* Enable virtual channel 0~3 */
>> +     c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0, ADAP_FD_VIRTUAL_CHN0_EN,
>> +                              ADAP_FD_VIRTUAL_CHN0_EN);
>> +     c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0, ADAP_FD_VIRTUAL_CHN1_EN,
>> +                              ADAP_FD_VIRTUAL_CHN1_EN);
>> +     c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0, ADAP_FD_VIRTUAL_CHN2_EN,
>> +                              ADAP_FD_VIRTUAL_CHN2_EN);
>> +     c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0, ADAP_FD_VIRTUAL_CHN3_EN,
>> +                              ADAP_FD_VIRTUAL_CHN3_EN);
>> +}
>> +
>> +/* Configure adapter reader sub module */
>> +static void c3_mipi_adap_cfg_reader(struct adap_device *adap,
>> +                                 struct v4l2_mbus_framefmt *fmt)
>> +{
>> +     const struct adap_pix_format *pix_format;
>> +     u32 line_size;
>> +     u8 data_type;
>> +
>> +     /* Data size for a line, unit: 128 bits */
>> +     pix_format = c3_mipi_adap_find_format(fmt->code);
>> +     line_size = fmt->width * pix_format->width;
>> +     line_size = DIV_ROUND_UP(line_size, 128);
>> +
>> +     if (pix_format->width == 10) {
>> +             data_type = ADAP_PIXEL0_DATA_TYPE_10BITS;
>> +     } else if (pix_format->width == 12) {
>> +             data_type = ADAP_PIXEL0_DATA_TYPE_12BITS;
> You should use MIPI_CSI2_DT_RAW10 and MIPI_CSI2_DT_RAW12 from
> "include/media/mipi-csi2.h"
>
OK,  Will use MIPI_CSI2_DT_RAW10 and MIPI_CSI2_DT_RAW12.
>> +     } else {
>> +             dev_err(adap->dev, "Invalid raw format width: %u\n", pix_format->width);
>> +             return;
>> +     }
>> +
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL1,
>> +                              ADAP_RD0_LINE_SIZE_MASK, line_size);
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL1, ADAP_RD0_LINE_NUM_MASK,
>> +                              fmt->height << ADAP_RD0_LINE_NUM_SHIFT);
>> +
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0, ADAP_RD0_MODULE_ENABLE,
>> +                              ADAP_RD0_MODULE_ENABLE);
> I'm not sure I get this. I read this bit as "Enable reading from DDR"
> while I thought the adapter receives data directly from the CSI-2
> receiver

This place is a bit confusing.
I will check this issue  and add explanation.


>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0, ADAP_RD0_LINE_STRIDE_MASK,
>> +                              line_size << ADAP_RD0_LINE_STRIDE_SHIFT);
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0, ADAP_RD0_SAMPLE_SEL_MASK,
>> +                              ADAP_RD0_DATA_IN_VSYNC);
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0, ADAP_RD0_BURST_TYPE_MASK,
>> +                              ADAP_RD0_BURST_TYPE_INRC8 << ADAP_RD0_BURST_TYPE_SHIFT);
>> +
>> +     /* Set data type and work mode */
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL0,
>> +                              ADAP_PIXEL0_WORK_MODE_MASK, ADAP_PIXEL0_DIRECT_PATH);
> Ah maybe this setting "RAW from direct path" enables direct path from
> CSI-2 receiver
>

PIXEL0 is a sub module in adapter and should be configured.

>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL0, ADAP_PIXEL0_DATA_TYPE_MASK,
>> +                              data_type << ADAP_PIXEL0_DATA_TYPE_SHIFT);
>> +
>> +     /* Set pixel end number */
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL1, ADAP_PIXEL0_X_END_MASK,
>> +                              ADAP_PIXEL0_X_END(fmt->width));
>> +
>> +     /* Set line pixel number and reader fifo size */
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL2,
>> +                              ADAP_PIXEL0_FIFO_SIZE_MASK, line_size);
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL2, ADAP_PIXEL0_PIXEL_NUM_MASK,
>> +                              fmt->width << ADAP_PIXEL0_PIXEL_NUM_SHIFT);
>> +
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL0, ADAP_ALIG_V_TOTAL_NUM_MASK,
>> +                              ADAP_ALIG_V_TOTAL_NUM(fmt->width));
> What are the ISP alignment requirements ?
>
> #define ADAP_ALIG_V_TOTAL_NUM(x)    ((x) + 64)
>
> Are you aligning or just adding 64 here ?


ISP hardware requires at least 40 v-blanks,

so here add 64 to ensure ISP can function properly.

>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL0, ADAP_ALIG_H_TOTAL_NUM_MASK,
>> +                              ADAP_ALIG_H_TOTAL_NUM(fmt->height)
>> +                              << ADAP_ALIG_H_TOTAL_NUM_SHIFT);
>> +
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL1, ADAP_ALIG_HPE_NUM_MASK,
>> +                              fmt->width << ADAP_ALIG_HPE_NUM_SHIFT);
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL2, ADAP_ALIG_VPE_NUM_MASK,
>> +                              fmt->height << ADAP_ALIG_VPE_NUM_SHIFT);
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL3,
>> +                              ADAP_ALIG_FRM_ST_PIXEL_MASK, fmt->width);
>> +
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>> +                              ADAP_ALIG_LANE0_ENABLE, ADAP_ALIG_LANE0_ENABLE);
>> +
>> +     /* Select direct mode */
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>> +                              ADAP_ALIG_DATA_MODE0_MASK, ADAP_ALIG_DIRECT_MODE);
>> +
>> +     /* Enable vdata 0~3 */
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>> +                              ADAP_ALIG_VDATA0_ENABLE, ADAP_ALIG_VDATA0_ENABLE);
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>> +                              ADAP_ALIG_VDATA1_ENABLE, ADAP_ALIG_VDATA1_ENABLE);
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>> +                              ADAP_ALIG_VDATA2_ENABLE, ADAP_ALIG_VDATA2_ENABLE);
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>> +                              ADAP_ALIG_VDATA3_ENABLE, ADAP_ALIG_VDATA2_ENABLE);
> For my education could you tell what these bit do ?
Will add explanation.
>> +
>> +     /* continue mode and disable hold counter */
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL8,
>> +                              ADAP_ALIG_FRAME_CONTINUE, ADAP_ALIG_FRAME_CONTINUE);
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL8,
>> +                              ADAP_ALIG_EXC_MASK_DIS, ADAP_ALIG_EXC_MASK_DIS);
>> +}
>> +
>> +static void c3_mipi_adap_start_stream(struct adap_device *adap)
>> +{
>> +     /* Enable to start and will auto clear to 0 */
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL8,
>> +                              ADAP_ALIG_START_ENABLE, ADAP_ALIG_START_ENABLE);
>> +
>> +     /* Enable to start and will auto clear to 0 */
>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL0,
>> +                              ADAP_PIXEL0_START_ENABLE, ADAP_PIXEL0_START_ENABLE);
>> +
>> +     /* Enable frontend */
>> +     c3_mipi_adap_update_bits(adap, CSI2_CLK_RESET,
>> +                              ADAP_FD_ENABLE, ADAP_FD_ENABLE);
>> +}
>> +
>> +static void c3_mipi_adap_cfg_format(struct adap_device *adap)
>> +{
>> +     struct v4l2_subdev_format *format = &adap->format;
>> +
>> +     c3_mipi_adap_cfg_top(adap);
>> +     c3_mipi_adap_cfg_frontend(adap, &format->format);
>> +     c3_mipi_adap_cfg_reader(adap, &format->format);
>> +}
>> +
>> +/* V4L2 subdev operations */
>> +
>> +static int c3_mipi_adap_enable_streams(struct v4l2_subdev *sd,
>> +                                    struct v4l2_subdev_state *state,
>> +                                    u32 pad, u64 streams_mask)
>> +{
>> +     struct adap_device *adap = v4l2_get_subdevdata(sd);
>> +     u64 sink_streams;
>> +     int ret;
>> +
>> +     guard(mutex)(&adap->lock);
>> +
>> +     pm_runtime_resume_and_get(adap->dev);
>> +
>> +     c3_mipi_adap_cfg_format(adap);
>> +     c3_mipi_adap_start_stream(adap);
>> +
>> +     sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +                                                    MIPI_ADAP_PAD_SINK,
>> +                                                    &streams_mask);
>> +     ret = v4l2_subdev_enable_streams(adap->src_sd,
>> +                                      adap->src_sd_pad,
>> +                                      sink_streams);
>> +     if (ret) {
>> +             pm_runtime_put(adap->dev);
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_adap_disable_streams(struct v4l2_subdev *sd,
>> +                                     struct v4l2_subdev_state *state,
>> +                                     u32 pad, u64 streams_mask)
>> +{
>> +     struct adap_device *adap = v4l2_get_subdevdata(sd);
>> +     u64 sink_streams;
>> +     int ret;
>> +
>> +     guard(mutex)(&adap->lock);
>> +
>> +     sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +                                                    MIPI_ADAP_PAD_SINK,
>> +                                                    &streams_mask);
>> +     ret = v4l2_subdev_disable_streams(adap->src_sd,
>> +                                       adap->src_sd_pad,
>> +                                       sink_streams);
>> +     if (ret)
>> +             dev_err(adap->dev, "Failed to disable %s\n", adap->src_sd->name);
>> +
>> +     pm_runtime_put(adap->dev);
>> +
>> +     return ret;
>> +}
>> +
>> +static int c3_mipi_adap_cfg_routing(struct v4l2_subdev *sd,
>> +                                 struct v4l2_subdev_state *state,
>> +                                 struct v4l2_subdev_krouting *routing)
>> +{
>> +     static const struct v4l2_mbus_framefmt format = {
>> +             .width = MIPI_ADAP_DEFAULT_WIDTH,
>> +             .height = MIPI_ADAP_DEFAULT_HEIGHT,
>> +             .code = MIPI_ADAP_DEFAULT_FMT,
>> +             .field = V4L2_FIELD_NONE,
>> +             .colorspace = V4L2_COLORSPACE_RAW,
>> +             .ycbcr_enc = V4L2_YCBCR_ENC_601,
>> +             .quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> +             .xfer_func = V4L2_XFER_FUNC_NONE,
>> +     };
>> +     int ret;
>> +
>> +     ret = v4l2_subdev_routing_validate(sd, routing,
>> +                                        V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_adap_init_routing(struct v4l2_subdev *sd,
>> +                                  struct v4l2_subdev_state *state)
>> +{
>> +     struct v4l2_subdev_route routes;
>> +     struct v4l2_subdev_krouting routing;
>> +
>> +     routes.sink_pad = MIPI_ADAP_PAD_SINK;
>> +     routes.sink_stream = 0;
>> +     routes.source_pad = MIPI_ADAP_PAD_SRC;
>> +     routes.source_stream = 0;
>> +     routes.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>> +
>> +     routing.num_routes = 1;
>> +     routing.routes = &routes;
>> +
>> +     return c3_mipi_adap_cfg_routing(sd, state, &routing);
>> +}
> Same comments as per the CSI-2 Rx, do you need to allow set routing
> when a single route in enabled and valid ?
>

Will drop the set_routing() interface.

>> +
>> +static int c3_mipi_adap_set_routing(struct v4l2_subdev *sd,
>> +                                 struct v4l2_subdev_state *state,
>> +                                 enum v4l2_subdev_format_whence which,
>> +                                 struct v4l2_subdev_krouting *routing)
>> +{
>> +     bool is_streaming = v4l2_subdev_is_streaming(sd);
>> +
>> +     if (which == V4L2_SUBDEV_FORMAT_ACTIVE && is_streaming)
>> +             return -EBUSY;
>> +
>> +     return c3_mipi_adap_cfg_routing(sd, state, routing);
>> +}
>> +
>> +static int c3_mipi_adap_enum_mbus_code(struct v4l2_subdev *sd,
>> +                                    struct v4l2_subdev_state *state,
>> +                                    struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +     switch (code->pad) {
>> +     case MIPI_ADAP_PAD_SINK:
>> +             if (code->index >= ARRAY_SIZE(c3_mipi_adap_formats))
>> +                     return -EINVAL;
>> +
>> +             code->code = c3_mipi_adap_formats[code->index].code;
>> +             break;
>> +     case MIPI_ADAP_PAD_SRC:
>> +             struct v4l2_mbus_framefmt *fmt;
>> +
>> +             if (code->index > 0)
>> +                     return -EINVAL;
>> +
>> +             fmt = v4l2_subdev_state_get_format(state, code->pad);
>> +             code->code = fmt->code;
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_adap_set_fmt(struct v4l2_subdev *sd,
>> +                             struct v4l2_subdev_state *state,
>> +                             struct v4l2_subdev_format *format)
>> +{
>> +     struct adap_device *adap = v4l2_get_subdevdata(sd);
>> +     struct v4l2_mbus_framefmt *fmt;
>> +     const struct adap_pix_format *pix_format;
>> +
>> +     if (format->pad != MIPI_ADAP_PAD_SINK)
>> +             return v4l2_subdev_get_fmt(sd, state, format);
>> +
>> +     pix_format = c3_mipi_adap_find_format(format->format.code);
>> +     if (!pix_format)
>> +             pix_format = &c3_mipi_adap_formats[0];
>> +
>> +     fmt = v4l2_subdev_state_get_format(state, format->pad);
>> +     fmt->code = pix_format->code;
>> +     fmt->width = clamp_t(u32, format->format.width,
>> +                          MIPI_ADAP_MIN_WIDTH, MIPI_ADAP_MAX_WIDTH);
>> +     fmt->height = clamp_t(u32, format->format.height,
>> +                           MIPI_ADAP_MIN_HEIGHT, MIPI_ADAP_MAX_HEIGHT);
>> +
>> +     format->format = *fmt;
>> +
>> +     /* Synchronize the format to source pad */
>> +     fmt = v4l2_subdev_state_get_format(state, MIPI_ADAP_PAD_SRC);
>> +     *fmt = format->format;
>> +
>> +     adap->format = *format;
> There is not need to store the format in the driver-specific
> structure. You use it c3_mipi_adap_cfg_format() called by
> c3_mipi_adap_enable_streams() which receives a subdev_state where the format
> is stored already.
>
> Thanks
>    j


Will remove the adap->format

>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_adap_init_state(struct v4l2_subdev *sd,
>> +                                struct v4l2_subdev_state *state)
>> +{
>> +     struct v4l2_mbus_framefmt *sink_fmt;
>> +     struct v4l2_mbus_framefmt *src_fmt;
>> +
>> +     sink_fmt = v4l2_subdev_state_get_format(state, MIPI_ADAP_PAD_SINK);
>> +     src_fmt = v4l2_subdev_state_get_format(state, MIPI_ADAP_PAD_SRC);
>> +
>> +     sink_fmt->width = MIPI_ADAP_DEFAULT_WIDTH;
>> +     sink_fmt->height = MIPI_ADAP_DEFAULT_HEIGHT;
>> +     sink_fmt->field = V4L2_FIELD_NONE;
>> +     sink_fmt->code = MIPI_ADAP_DEFAULT_FMT;
>> +     sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
>> +     sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
>> +     sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
>> +     sink_fmt->quantization =
>> +             V4L2_MAP_QUANTIZATION_DEFAULT(false, sink_fmt->colorspace,
>> +                                           sink_fmt->ycbcr_enc);
>> +     *src_fmt = *sink_fmt;
>> +
>> +     return c3_mipi_adap_init_routing(sd, state);
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops c3_mipi_adap_pad_ops = {
>> +     .enum_mbus_code = c3_mipi_adap_enum_mbus_code,
>> +     .get_fmt = v4l2_subdev_get_fmt,
>> +     .set_fmt = c3_mipi_adap_set_fmt,
>> +     .set_routing = c3_mipi_adap_set_routing,
>> +     .enable_streams = c3_mipi_adap_enable_streams,
>> +     .disable_streams = c3_mipi_adap_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_ops c3_mipi_adap_subdev_ops = {
>> +     .pad = &c3_mipi_adap_pad_ops,
>> +};
>> +
>> +static const struct v4l2_subdev_internal_ops c3_mipi_adap_internal_ops = {
>> +     .init_state = c3_mipi_adap_init_state,
>> +};
>> +
>> +/* Media entity operations */
>> +static const struct media_entity_operations c3_mipi_adap_entity_ops = {
>> +     .link_validate = v4l2_subdev_link_validate,
>> +};
>> +
>> +/* PM runtime */
>> +
>> +static int __maybe_unused c3_mipi_adap_runtime_suspend(struct device *dev)
>> +{
>> +     struct adap_device *adap = dev_get_drvdata(dev);
>> +
>> +     clk_bulk_disable_unprepare(adap->info->clock_num, adap->clks);
>> +
>> +     return 0;
>> +}
>> +
>> +static int __maybe_unused c3_mipi_adap_runtime_resume(struct device *dev)
>> +{
>> +     struct adap_device *adap = dev_get_drvdata(dev);
>> +
>> +     return clk_bulk_prepare_enable(adap->info->clock_num, adap->clks);
>> +}
>> +
>> +static const struct dev_pm_ops c3_mipi_adap_pm_ops = {
>> +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                             pm_runtime_force_resume)
>> +     SET_RUNTIME_PM_OPS(c3_mipi_adap_runtime_suspend,
>> +                        c3_mipi_adap_runtime_resume, NULL)
>> +};
>> +
>> +/* Probe/remove & platform driver */
>> +
>> +static int c3_mipi_adap_subdev_init(struct adap_device *adap)
>> +{
>> +     struct v4l2_subdev *sd = &adap->sd;
>> +     int ret;
>> +
>> +     v4l2_subdev_init(sd, &c3_mipi_adap_subdev_ops);
>> +     sd->owner = THIS_MODULE;
>> +     sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +     sd->internal_ops = &c3_mipi_adap_internal_ops;
>> +     snprintf(sd->name, sizeof(sd->name), "%s", MIPI_ADAP_SUBDEV_NAME);
>> +
>> +     sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> +     sd->entity.ops = &c3_mipi_adap_entity_ops;
>> +
>> +     sd->dev = adap->dev;
>> +     v4l2_set_subdevdata(sd, adap);
>> +
>> +     adap->pads[MIPI_ADAP_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>> +     adap->pads[MIPI_ADAP_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>> +     ret = media_entity_pads_init(&sd->entity, MIPI_ADAP_PAD_MAX, adap->pads);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = v4l2_subdev_init_finalize(sd);
>> +     if (ret) {
>> +             media_entity_cleanup(&sd->entity);
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static void c3_mipi_adap_subdev_deinit(struct adap_device *adap)
>> +{
>> +     v4l2_subdev_cleanup(&adap->sd);
>> +     media_entity_cleanup(&adap->sd.entity);
>> +}
>> +
>> +/* Subdev notifier register */
>> +static int c3_mipi_adap_notify_bound(struct v4l2_async_notifier *notifier,
>> +                                  struct v4l2_subdev *sd,
>> +                                  struct v4l2_async_connection *asc)
>> +{
>> +     struct adap_device *adap = v4l2_get_subdevdata(notifier->sd);
>> +     struct media_pad *sink = &adap->sd.entity.pads[MIPI_ADAP_PAD_SINK];
>> +     int ret;
>> +
>> +     ret = media_entity_get_fwnode_pad(&sd->entity,
>> +                                       sd->fwnode, MEDIA_PAD_FL_SOURCE);
>> +     if (ret < 0) {
>> +             dev_err(adap->dev, "Failed to find pad for %s\n", sd->name);
>> +             return ret;
>> +     }
>> +
>> +     adap->src_sd = sd;
>> +     adap->src_sd_pad = ret;
>> +
>> +     return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
>> +                                            MEDIA_LNK_FL_IMMUTABLE);
>> +}
>> +
>> +static const struct v4l2_async_notifier_operations c3_mipi_adap_notify_ops = {
>> +     .bound = c3_mipi_adap_notify_bound,
>> +};
>> +
>> +static int c3_mipi_adap_async_register(struct adap_device *adap)
>> +{
>> +     struct v4l2_async_connection *asc;
>> +     struct fwnode_handle *ep;
>> +     int ret;
>> +
>> +     v4l2_async_subdev_nf_init(&adap->notifier, &adap->sd);
>> +
>> +     ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(adap->dev), 0, 0,
>> +                                          FWNODE_GRAPH_ENDPOINT_NEXT);
>> +     if (!ep)
>> +             return -ENOTCONN;
>> +
>> +     asc = v4l2_async_nf_add_fwnode_remote(&adap->notifier, ep,
>> +                                           struct v4l2_async_connection);
>> +     if (IS_ERR(asc)) {
>> +             ret = PTR_ERR(asc);
>> +             goto err_put_handle;
>> +     }
>> +
>> +     adap->notifier.ops = &c3_mipi_adap_notify_ops;
>> +     ret = v4l2_async_nf_register(&adap->notifier);
>> +     if (ret)
>> +             goto err_cleanup_nf;
>> +
>> +     ret = v4l2_async_register_subdev(&adap->sd);
>> +     if (ret)
>> +             goto err_unregister_nf;
>> +
>> +     fwnode_handle_put(ep);
>> +
>> +     return 0;
>> +
>> +err_unregister_nf:
>> +     v4l2_async_nf_unregister(&adap->notifier);
>> +err_cleanup_nf:
>> +     v4l2_async_nf_cleanup(&adap->notifier);
>> +err_put_handle:
>> +     fwnode_handle_put(ep);
>> +     return ret;
>> +}
>> +
>> +static void c3_mipi_adap_async_unregister(struct adap_device *adap)
>> +{
>> +     v4l2_async_unregister_subdev(&adap->sd);
>> +     v4l2_async_nf_unregister(&adap->notifier);
>> +     v4l2_async_nf_cleanup(&adap->notifier);
>> +}
>> +
>> +static int c3_mipi_adap_ioremap_resource(struct adap_device *adap)
>> +{
>> +     struct device *dev = adap->dev;
>> +     struct platform_device *pdev = to_platform_device(dev);
>> +
>> +     adap->top = devm_platform_ioremap_resource_byname(pdev, "top");
>> +     if (IS_ERR(adap->top))
>> +             return PTR_ERR(adap->top);
>> +
>> +     adap->fd = devm_platform_ioremap_resource_byname(pdev, "fd");
>> +     if (IS_ERR(adap->fd))
>> +             return PTR_ERR(adap->fd);
>> +
>> +     adap->rd = devm_platform_ioremap_resource_byname(pdev, "rd");
>> +     if (IS_ERR(adap->rd))
>> +             return PTR_ERR(adap->rd);
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_adap_configure_clocks(struct adap_device *adap)
>> +{
>> +     const struct adap_info *info = adap->info;
>> +     int ret;
>> +     u32 i;
>> +
>> +     for (i = 0; i < info->clock_num; i++)
>> +             adap->clks[i].id = info->clocks[i];
>> +
>> +     ret = devm_clk_bulk_get(adap->dev, info->clock_num, adap->clks);
>> +     if (ret)
>> +             return ret;
>> +
>> +     for (i = 0; i < info->clock_num; i++) {
>> +             if (!info->clock_rates[i])
>> +                     continue;
>> +             ret = clk_set_rate(adap->clks[i].clk, info->clock_rates[i]);
>> +             if (ret) {
>> +                     dev_err(adap->dev, "Failed to set %s rate %u\n", info->clocks[i],
>> +                             info->clock_rates[i]);
>> +                     return ret;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_adap_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev = &pdev->dev;
>> +     struct adap_device *adap;
>> +     int ret;
>> +
>> +     adap = devm_kzalloc(dev, sizeof(*adap), GFP_KERNEL);
>> +     if (!adap)
>> +             return -ENOMEM;
>> +
>> +     adap->info = of_device_get_match_data(dev);
>> +     adap->dev = dev;
>> +
>> +     ret = c3_mipi_adap_ioremap_resource(adap);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "Failed to ioremap resource\n");
>> +
>> +     ret = c3_mipi_adap_configure_clocks(adap);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "Failed to configure clocks\n");
>> +
>> +     platform_set_drvdata(pdev, adap);
>> +
>> +     mutex_init(&adap->lock);
>> +     pm_runtime_enable(dev);
>> +
>> +     ret = c3_mipi_adap_subdev_init(adap);
>> +     if (ret < 0)
>> +             goto err_disable_runtime_pm;
>> +
>> +     ret = c3_mipi_adap_async_register(adap);
>> +     if (ret < 0)
>> +             goto err_deinit_subdev;
>> +
>> +     return 0;
>> +
>> +err_deinit_subdev:
>> +     c3_mipi_adap_subdev_deinit(adap);
>> +err_disable_runtime_pm:
>> +     pm_runtime_disable(dev);
>> +     mutex_destroy(&adap->lock);
>> +     return ret;
>> +};
>> +
>> +static void c3_mipi_adap_remove(struct platform_device *pdev)
>> +{
>> +     struct adap_device *adap = platform_get_drvdata(pdev);
>> +
>> +     c3_mipi_adap_async_unregister(adap);
>> +     c3_mipi_adap_subdev_deinit(adap);
>> +
>> +     pm_runtime_disable(&pdev->dev);
>> +     mutex_destroy(&adap->lock);
>> +};
>> +
>> +static const struct adap_info c3_mipi_adap_info = {
>> +     .clocks = {"vapb", "isp0"},
>> +     .clock_rates = {0, 400000000},
>> +     .clock_num = 2
>> +};
>> +
>> +static const struct of_device_id c3_mipi_adap_of_match[] = {
>> +     { .compatible = "amlogic,c3-mipi-adapter",
>> +       .data = &c3_mipi_adap_info },
>> +     { },
>> +};
>> +MODULE_DEVICE_TABLE(of, c3_mipi_adap_of_match);
>> +
>> +static struct platform_driver c3_mipi_adap_driver = {
>> +     .probe = c3_mipi_adap_probe,
>> +     .remove = c3_mipi_adap_remove,
>> +     .driver = {
>> +             .name = "c3-mipi-adapter",
>> +             .of_match_table = c3_mipi_adap_of_match,
>> +             .pm = &c3_mipi_adap_pm_ops,
>> +     },
>> +};
>> +
>> +module_platform_driver(c3_mipi_adap_driver);
>> +
>> +MODULE_AUTHOR("Keke Li <keke.li@amlogic.com>");
>> +MODULE_DESCRIPTION("Amlogic C3 MIPI adapter");
>> +MODULE_LICENSE("GPL");
>>
>> --
>> 2.46.1
>>
>>
>>

