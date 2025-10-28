Return-Path: <linux-media+bounces-45800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AB8C14542
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5F361A65140
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187523054C4;
	Tue, 28 Oct 2025 11:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="YXRJpRDk"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023097.outbound.protection.outlook.com [52.101.127.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9B62DA774;
	Tue, 28 Oct 2025 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650328; cv=fail; b=trDQSj2+2i4QBAeyEW1WAgmpx81Ob84hlWGwwXcL6f0M8Bx1cwaBddvbdI6CSIlq5yfC1WbV8HPUGav5iS59HPPhhg0YBcmT0/5j8QboZBkOqemZRZwQ4hMSqzbQ0XPPjuW9+Q8Hv+kIavlUC7Rl45IKvdB9pSh3jDQp5Kad/Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650328; c=relaxed/simple;
	bh=S5b00EbS3y1I1sy+rhuCRQ3vG835WhkgiKeUW0/WsMw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vDv6gn7KS+HSB8w4e446Z0CDIr7Dlz8kHsVSijAfGJ+2nR9WnqS70ylyWKX7HL6EZWHS7MSeGz2WC6WAg322Xg4g8aSYTEq9X+gG53yLO4+KDPYRvYVIWQGB0VSS+H0l/ahlVWPCM/0rCJAAgAN16ozWKXCsllxpd4wYwZyzCjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=YXRJpRDk; arc=fail smtp.client-ip=52.101.127.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0HQ56ttMW+bLio47l/cgPjMIzEdnna4NKaOfvf3WuClTfk5O0lWN06Pi9ks00HrW7JeS1qwtMlnxAzABRmQLAczybDgdKmRxQIFN48h/YdGy36tNdRbIzxwq6MmmAathXrCEqd4ajOb3H9Yv2atG5zGZUxYGIoGo+mZh66pDDTASi76OjbsBYiW9CZqFyQF91Rbi0znAzzYaZyb318UA7UGXxP+NSyMJYwnv+DqusX2eYYV30asjd6lRpIi3+v15AG7NJ/SeMiH8dRbO03DlD3T1loBaa9waHXX+xRCAzv2uSKnrQClHqRzwVJJrWDSl+7cu6GFiBO+Jj9NKO9oPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwbmLa9lokCxzsH9CCEGDqvc/SuugT6eOKBKJxsXbho=;
 b=Q1Q22CRfvTqknXz53rPDgBx1XuvlBdTFY/QDqSy6pYGOG20q3iZN8eJhRarir0XN/teZhLiPmEG5EQJUW1OeoH7Jgxg4F9doTvMpdEZDPK1/E0hzgpslR3dYcBjWHg/7tr3UBaeGdc64mmfLXiW/TO5VcIhGMqeMhmZ7kD88x7zVRHTe0evFsB8uw+joAK5JefzBue5N7AQJVgPaHBcFcgEgB5Rh+m+IlidZ/pOm/JRa1CkrAl/cLObwZSo6i/a6mxJSc3DQOhrBsBAjB82OT31xgy6/rhFpPvIFyV0dRkOBP/W5vS10yylX8is/D2qhdhgGNYj4iXThANH+6SumsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwbmLa9lokCxzsH9CCEGDqvc/SuugT6eOKBKJxsXbho=;
 b=YXRJpRDk17Kq+kyGUHcIqJuilsWdjgSsl97RQco4Zn0LH5s/RI4OwqKBXWaH5GIEueHNB0SDmSMxgFQwrE+oUotTBdMFJkEGPfYPqXn5ehjr+nxsILKlX/5tsRg7LVrpWxL6ZvvyV37dlmi35jQ1ijE8wSjD+56ufaJaEkpDGABmmsDLReioRx9gXCIKJftrgaKwbmxZtR2+xkOXzsOiF6bwap1RJ2UUpku1p9TR++I+qm32337KyNi3twekPNLJxerXncQmBu3jIvpGnqdLDR0p+C/kt+JDi/NSZf77C6r/t1UkKd9ZppfwU4MHOZDjuj0CV4jq0hIRshWa2FxXMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com (2603:1096:400:5e::9)
 by TYSPR03MB7784.apcprd03.prod.outlook.com (2603:1096:400:42a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 11:18:44 +0000
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e]) by TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e%7]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:18:44 +0000
Message-ID: <e4744e78-25c1-4ecc-b5fc-9ce7dcebd36d@amlogic.com>
Date: Tue, 28 Oct 2025 19:18:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dts: decoder: Support V4L2 stateless decoder dt node
 for S4
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <20251027-b4-s4-vdec-upstream-v1-2-620401813b5d@amlogic.com>
 <43280bcc-5afd-4b46-a83d-d81c80405e71@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <43280bcc-5afd-4b46-a83d-d81c80405e71@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:4:188::23) To TYZPR03MB5536.apcprd03.prod.outlook.com
 (2603:1096:400:5e::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5536:EE_|TYSPR03MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: c737860a-ce41-442c-4231-08de1613c164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2VQZ05OMDF4NlNRdFU0c1lrZ0R6MkU0Q2ZsbDBRNUpaYTBoTU56SEtvZ01R?=
 =?utf-8?B?azFhSzNlakpieUlqRUpBZkZGbWJLMlFENnIyUGxJMU9zTWF5R0wwWndYS09D?=
 =?utf-8?B?VTYrazIvWWNBSHJyclBwYjNGNmZsdXhvUzc3cmIvRzZYYW1NWVJIMUkyYXV6?=
 =?utf-8?B?ZHZFOHRlajVLdGFzcHJTTVdwQk5zZjRHUmM0VjJPcWZTVkIwcjBTSURza0t3?=
 =?utf-8?B?OW0wc2o0cUVRU0hWNFRTU2c1cm9abWtjUWx3NHdNdU1ZSStRd0t1Q1A5anU2?=
 =?utf-8?B?M1RDRlRpV0U1eXZCNmc4SGZTQUZkK2hGa3FFOGNMekxMWW5kc3Q2M0JmMzBv?=
 =?utf-8?B?UEh6SFpXNkNoRnZGclRWOFdiaHcrK1J5UUFHcFJTMjF3cjhPMHdWbXA5RVhH?=
 =?utf-8?B?ZllkNDhKUG81Wm5PWXc2RjV0S1ZKMWJHdTFiYzNqR1hBa3Z5anFqUGlJaUN5?=
 =?utf-8?B?UjREMXlXRXN3c0xHKzZIVWV2ZkhLZ1h6Q2N1QVB1Ym5RT2R4MXp0bHFMVS85?=
 =?utf-8?B?TXkrdnhUQzlyaDdhczRFWUF4bnYrQjZMWi9BV3BtTVM3OWxYMzAyUkxnOUNx?=
 =?utf-8?B?NStYR1FNUCtSVGVpaFF0NHp6YnJURlhWTzlqOGJOSFBUOHMwSVNHMUV3RXNU?=
 =?utf-8?B?WmprUndEdmZuZEg1VURuK1pqL2lzMFh2VFhxdXpIaW42cFlmTHhjcy84UmEy?=
 =?utf-8?B?RXNZTnhSbnZlRGFWb1RUNlo0c1g4Q0JZS04waG1IZzE0UmNjNnZaRUFwbkVJ?=
 =?utf-8?B?QUhQQXpHbTBaQW03RGhpaVczM1BqWWdLa1EvWXRUK0RHcWNTRVJLMlBaOURn?=
 =?utf-8?B?dmk1MDFybWROZXdBUVR5ZEwwWVR1Y0dlTXFON2FtRzZxei81N2J6YUl5bkNG?=
 =?utf-8?B?QXRmby9ybi9kUEdZQkJqTHNMeGo0eVl1eit3QmFuYVVHTGpNenFzYkR0ZTB5?=
 =?utf-8?B?R0dtVDdRT2wxVHVPTVhoTEkxcXdqdm1odTQ1eElFSnF6c2RIaDJZQ2pOT3N3?=
 =?utf-8?B?WjhsNm00dVZuSHdmZnVadXE0eUozZ0Z6M1gvSlhUUXc4bEdKZ3lpVUMzZThv?=
 =?utf-8?B?cE9mbGo4aUhLRyt5ZW9rZ295cmJxaW56aUJjSkdEMXJGaHd5N3hQU2pRRSs2?=
 =?utf-8?B?bjJNQmVIeGwzazMrbWxDYTUwbzc0blJUNjY5ak81a2dKWVhkdjdNdlp1OXNB?=
 =?utf-8?B?M1BZUjdRSzJzbitVQkJFT3U0eG43U2hjbTNJV1BUQmwzbmxWbHZ1ODNKd2ZL?=
 =?utf-8?B?R3FiMGY1YVVVTTFacDBQNmpWa0hLWFlaejNIKzlYR3V1eHdSNFN2Ti9iRFB6?=
 =?utf-8?B?UG1YTitqbzlxYVI1MGJrb25RVjdYR1JoYUdiSVR6c3ZuSGtTWXcwSmhMSFc0?=
 =?utf-8?B?YzJrR1VmMisrZ0dvbGRmdnNWSU95U0EveTJoR1VoZENRNVdBakFIZWl2UWV5?=
 =?utf-8?B?NXBqM050WmhNNUMyRDZ5eFlqT2xZeFFHcDFhRmNRZm9xbHJsQzBBckFmdTZZ?=
 =?utf-8?B?OGNhVDdDR0hMTFFwQkFPMVJZUzkwcnZCRkNOZHhackwzM0pDTTExVzhERXlP?=
 =?utf-8?B?eGF2VDBUYjJQQTdyd1Q1cmhEV3FVR2tEQnFTZUdMazdTZHF3aWJ1NUplMk95?=
 =?utf-8?B?cFkrVWw4YXE0WFptL2NDOTIwV25pTHB5MmkreDNxS2x4L1NQRFlNUUxjY0w2?=
 =?utf-8?B?aEo5NFpiWFdnVE01bzliSU03QVF4RnhvWUpZTVhaQkVjNDRjTEQybHpjd0xC?=
 =?utf-8?B?aytlTnBaY1VRU091STFjaGFDWThRWEVybk16YVJwSUhaV2RKSDZ1bkpGdVNN?=
 =?utf-8?B?WVFTdldBSmJrUnh1cFBZWm11eit5T1hRZEdOLzlWN2RPbjBvZHQ4ZEJGOVlV?=
 =?utf-8?B?bUtVaHJWS1N5S21lSGJSOW8wcWRQV0JGaElLUDFuVlNCN2N4bVVEQ1ZkT2dM?=
 =?utf-8?B?d2NoZDVrbmdhTG9nZTdsVEtmQlJkdS9yTWZNblBVSXFOSDYvOERRRUtXRFdP?=
 =?utf-8?B?K2twRW11WDJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5536.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0xnTTlKWGR2bnlZdFN4UytyVS9PckRMcTVNOElKbWp6aElXeWhxQ0huamoy?=
 =?utf-8?B?ZmRmNkZoRTQrb2JGL044QlZUU3hpR2E3Sm82dlpzTFdVUGx2bm9zQVZmYVY3?=
 =?utf-8?B?a2Z4UTkvSzAyL2N6R2g3RnVXcWR2UjhGT1BRb3hhUExZWEFJOHFHRGhXNncv?=
 =?utf-8?B?SzNDQXVUbHNWczRmL2N1OTV5TStLRW5EZjl6OHlzOWlncGNmOFdldFhFSU9E?=
 =?utf-8?B?U3ZjS0xXc1EzMUFodVlJejlCUk91bjJKZDROd1dqQTVKd3A0MURzenFIRW82?=
 =?utf-8?B?QURYT0h5N2dGYTJnVmlJLzFpY002RC94UFoyN2pjdlZZY3RLSndFaXdMRkl6?=
 =?utf-8?B?bWtpeWdGM1JIYlJqOXJEb3IwRE4yUGpXcWI5ank1NVBhSFF2VnFlL3RTQnBK?=
 =?utf-8?B?UHFNRGlJSG55TWJJUnJFZzZtdHFyK0dxZzd3ZFVXUW5KR3ZpUFpvUE5JV2pD?=
 =?utf-8?B?eUp5WGc0WWo5MkY3NlV0b2MxT3NsRkNYNUFiRmVDV2JFbDJBWWlzYmxkYWhz?=
 =?utf-8?B?QnRnbHg3TnU0WnZaNEZLVExWSStOSkZkNnRadytnMXpVOG1Qa0ZUVEJCMGl6?=
 =?utf-8?B?bmFDbVl2enJhb1JMemMyRnM3azVEbUhIckJSNGg3WkhmZnNoL0psZVZ1bENt?=
 =?utf-8?B?SVRDNkJOei9lamNicHhsdjZjTGo0VDk1VnhCaUV2MGo4REd2a0ZvQVZnRndE?=
 =?utf-8?B?dUI2SThwWm05UkRNc3B4d0NHK25lN3ZKV0Y5cFV3MVB3NU1GVTlFKzREdmt2?=
 =?utf-8?B?OWh0bEtGUFRtQ2ZqMTRRYlBLN25BcFowNWhIREx1aXdDUkwxMFVJUXRRYmZY?=
 =?utf-8?B?dGQydS9xZHZXc3AyU2s1ZDdQckJkNmY2YWlseVBCczBrUjdnYzI0amlPaUJo?=
 =?utf-8?B?WkRDeXZuNHVpWTJlMVZ1NG1NVWFZU0FjcjJwUVAyNWExeU1pb2ZVdG1sL0Zi?=
 =?utf-8?B?REFTeFZ4QlkrT0t4d3Z2bmwvMmludXlmTGIybk5NamtycitzSlpXSEVFdndr?=
 =?utf-8?B?bEZXdnV1MHduemNFaVBzeGZBSGxrZ3l4djdhOUUvL2FpR29tNkRGZ2NPWmVO?=
 =?utf-8?B?VWJ1a0J3Z29YNnVmcm14QWJyUk84aWRNQjR1Tm9Tb0g5RTVUOHh1TkRQU2gw?=
 =?utf-8?B?UFJEYjRxdGRZS1B3bHpXUE9aTW5kdkJyRFdyaGRLRmNEcWs1bHB0SEhDTElW?=
 =?utf-8?B?UUhsMUluTTlEUjNzK1AwZ3cwZVhIamJLU3JzOFQvMjRsdkJkd0J3ODA5KzNZ?=
 =?utf-8?B?dlJydVZzbGtzeDJ1UE1jK1ZqZXNCb3lDaVo5Z3FvT3FRMCtMdXY3MTNPUFNN?=
 =?utf-8?B?WUNGbTV6Wmh2Y0FHbG5NK0owWGhtdXNNVmZYOE5pZ3pwYzFPSksxSEdrVVhB?=
 =?utf-8?B?L0FTVUlBWC8xK2didjVHRitMK3lMaEVmMldqM1A1cHVZL3J6MWluQU1LdTZU?=
 =?utf-8?B?ODEzNVg2VlBPVnM4cHBURVYvYkFxM1JKeERyUzBuYjlDNjJUWTQ4NHorYVFo?=
 =?utf-8?B?SnVzWnNjbXFjUzhJdWIxcTVxMjZ6R0MwQ1F4ajFsOVZhZmkwN3ZVOFhCSTM1?=
 =?utf-8?B?VUlCQkozMnl5V3NVbnB6Q1o2SXhhV1FMek1FbGV5QWlSVEpxVTBtZzh3dzJy?=
 =?utf-8?B?RGVCU1RZank1cHJSZllCOWNuNHM5cGczdFpOMkp2L0VwaHBCVW04OG5HOUVK?=
 =?utf-8?B?a1JNcDMyV1RUOWdoSEc5T0gxM0xkQW9DczFtZCtUbXVsMFJTNk85ZWNhc0lh?=
 =?utf-8?B?d3FrOEJFUzRUMGxtZE9IUDJ5Y2RpU1BLVXBBeks0cTNUT3U4ZElRaHl4dGo2?=
 =?utf-8?B?MUZPSWM4N3dzUGdUUmlaM2tKWTdyNXpuL3VQbnVLYnJPOWZsYXY1NTNzNDU4?=
 =?utf-8?B?US8xWUFxVkx5NFBDdVdFeWlYa0s1WGNJNUh6V3k3bmtjS09SRHQ1QWN4L3dP?=
 =?utf-8?B?VDhlQ3J0YnpHTE9JSUlOZUtrL1ppQVVnc2U1M2d1d3FQR2VFemh1SzBOTnpR?=
 =?utf-8?B?VXNjaVJ2Ykg3ODAwWGNTLzJtYmxLVEczeUNnN0tQZkYvS3ZkODVJeDhkQkQw?=
 =?utf-8?B?NVpHaVlOem4zMDh1bXllQ09aUE45WVcvL1p2K0gwRnA5eUc4QzM1MFNhWHF2?=
 =?utf-8?B?MlhrUExzemtKUzFRMjdJNnhyS3hxaHM1UEFMcXozMzl3NGpXK2YzOHcwSXha?=
 =?utf-8?B?MGc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c737860a-ce41-442c-4231-08de1613c164
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5536.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:18:44.1996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAoRTzYn/MxANP7kHYHiJlkXF94G7t3HXch2ml40hJLHvCwanC3EH5275rKNDhvDMNHJk6SO7K8tXE01ImSHDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7784


在 2025/10/27 21:06, Krzysztof Kozlowski 写道:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On 27/10/2025 06:42, Zhentao Guo via B4 Relay wrote:
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Add vcodec_dec to the s4 dtsi for the V4L2 stateless decoder driver
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
Got it. I will revise the subject according to the doc.
> Please order the patchset as expressed in submitting patches DT
> document. Or SoC maintainer profile.
OK, I will ensure the patchset is ordered properly in the next patch 
version.
>
> Best regards,
> Krzysztof

Thank you

Zhentao


