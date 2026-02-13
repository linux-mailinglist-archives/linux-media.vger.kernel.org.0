Return-Path: <linux-media+bounces-52696-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IgzKJvbjmkxFgEAu9opvQ
	(envelope-from <linux-media+bounces-52696-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:06:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27876133CB7
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2052C3047078
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 08:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C7E31A046;
	Fri, 13 Feb 2026 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="gUVBRalq"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022113.outbound.protection.outlook.com [52.101.126.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800CA21D3F2;
	Fri, 13 Feb 2026 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770969996; cv=fail; b=sPylNngw9Q+eTg3TPYiZhNDBJDXcwdw2iyGRNRCEpD8+u/QDlGZG3C2+EhDPWNM97uZ51v5+IoOZssKnukKFHV57bBrOdxa+PT28DmZ8JaB6SmlG9RYiWZDIpC0lXLfqYo0rn/LeKAjFtYvjUU4Jllz0ufRD5uNF007ag1X67Ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770969996; c=relaxed/simple;
	bh=qfMkTzW9STKoZLsxjNQBrYoe1DZspRfO7k002Z7W1yc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ei+y91DvBcjxBnn/qjitu01hFLCMVN1XICfOKifSkNNm8XRPseN5V/+M5JRgU31Lz0oafraJZtBXLx0pN3D4yFh54H49Bck0IshKv+Y5W8q5BZz2w0CC+PgnRfqT052zp7+JVjUWfGg/s7W+rK+jDMBpHs0wlkO78gRfoUIioPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=gUVBRalq; arc=fail smtp.client-ip=52.101.126.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJ+hkpg2+KJMn4tgc7+Ba4kLtZJaBe4f445UoYqohNQA3b3fWBQ/4ZJbALS3YfefAH72iMzfQPewFqt6KSCP8PQMKRQi8qEkvg9wqEOxOakfunIOENOYfyfMg1AWa4G82+c3yS1QKoNRcYwZZgpBVIVx0O+ui56umIqvvj2QAfEj2pvzek1J1vz1Frvg1CeYcX9WpFDGEHfSRDwrWUe9I/xFXzKWiMS5Ac5aW87n7P9EZ9GERMMcmQdnBn2VCfBLcU1KbrohGu8AZurYll1+QRe1Mz8GEmM42AMSSCgD10xT3Abp+tp8rcBBikvfiiXahTDFoLHe9afaRxCN5xD2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyCBGAzQ/xsoI8qNZ5ynWT+8YwM+lBGjFl0X0QVqExg=;
 b=QHvTrXP6BaNzkGLwQOUsme/K1Ee0dsDn30KHFdX/cKQAvey3AGUUNDfeajGucqSZR9duvJRCGHyIW+1deuUfgwmgp8cBdO/y8LC7S3SMmhqcfraYEfpvkRO5qGpUL4WjKmjnYrpXNjiTPjpR1vREFMmKNfyY4iLn6dL2sSVCy5T/30BEmOsGyRfB3qQj7a14kzBa/7dV8hyBQYZFwAjUf8AwRzE4allRJzZaLaHBmtZI+2QU9TRVNRQ53mxFXdK4x3N6oL0nvWVXO+nuOkVtRLGsuYshNgpOavJkq90ezsSEjY9sBVqH+iCQNGeNdmpqa91R59/3RBkNKu8dRFgOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyCBGAzQ/xsoI8qNZ5ynWT+8YwM+lBGjFl0X0QVqExg=;
 b=gUVBRalqyOHSQyxcvGCXDo8h6QREnd3mha1tblmjMQndqAoshu5go+0vl7lRixL+536Eiup1YJLz3MrgkcvarfVvhR0/WyAtN991orcz1RE4fyid/uTP8vY8lXkapYT+FImnQhNczIPSVwHpZle64pqRKojkmAabUJSJXEpx3iy3HoznGWSZmsiOgjGj6b0BNaPttpHDTNJUjTCOKumircfexK+aV9MYW9poniBlQI7KlYCr/aMZrQUiuBla/R7VTnvWYKH71he/YbjQ6AHAED2YNb9OQuHlxldqhF7PHc9IpMfVP+KI8PHzodY65DUx7tXdVarZAlyxEN+xCObGXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by TY0PR03MB7239.apcprd03.prod.outlook.com (2603:1096:400:277::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 08:06:32 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 08:06:32 +0000
Message-ID: <fe111988-69bf-4a56-ae7c-2f94d8c7f83d@amlogic.com>
Date: Fri, 13 Feb 2026 16:06:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 4/4] arm64: defconfig: Enable VDEC driver for
 Amlogic SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-4-c7112d00d662@amlogic.com>
 <795e507a-b0b7-40a5-8a75-25b464ba6b37@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <795e507a-b0b7-40a5-8a75-25b464ba6b37@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|TY0PR03MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf98697-c053-4925-7d3a-08de6ad6ccc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDdVTEwyaHc3cjhJdkFwdG9LcUdHYTNmS0U4aWtUWGhWcC9WcEV5WGJ6QnFx?=
 =?utf-8?B?ME41VE1QSmJRSjBBSUNocmNTcnBCVkFlVnMvbkZFRkhHQ3pVcXBtWFBERVBC?=
 =?utf-8?B?NHJBQXV2Vmp5TkY1UVVSQ2JlRjF3RlVKU1VGM1ptcGRqZHh1V0J6SmlQVGQy?=
 =?utf-8?B?SjdUaFdwZ2ZuNjNCRDI1RC9OL3Fzek9RaEtCTm5aSVZoMHZ2M3gzU2RFSE4y?=
 =?utf-8?B?UldzZ3Zrek9HSHUySHhoZXlOUDMxR2RHendIbFVwSlV6eUhFMmFtVlRaQWMr?=
 =?utf-8?B?THVGSnAyVVFPeGlyZ29hRVN6bERVdE16SlRDSlpVSFg5TlVqQkVvdFl6eVpO?=
 =?utf-8?B?RDA0cFNla2tDcnIzSi8yVHlqdHVJQ1YwNC9MWFhMQ3VCZjFmWjBYVC80WlZy?=
 =?utf-8?B?cG4xR3NYT3lZQ0NWYlFIMDc2UHl3bUlMWFBESmVyaXU4L3ZVRG5namFPcmJY?=
 =?utf-8?B?eGRPSjgwdHVQQjJSYlEvVmV5b1l4bHVYSVJ5M2lOSzV6dTlPQjlpSkZURWZi?=
 =?utf-8?B?MXhOS29URXZJa3hqbk1ocUxqUEVTMjQrNTFMQmYzeHFtbnhHU3BMeU5qWHEv?=
 =?utf-8?B?bkFGT3ltUkExQWk4QjZoRFdMOGhlUXpxMktjMDQ2QTNOWnVNQ1JxUUVYUEYr?=
 =?utf-8?B?OHdDbUJkYUt0bUtEbHcrZG5CM3VDTGsyRXN6MXhRSDluQnRCcjRwT2tzU2JR?=
 =?utf-8?B?TmlmTi9NV202L3pEU2VGSVZWQzFYQ3BtMHZSWXpwU0kxNmpzOWRHbnJ6SjBr?=
 =?utf-8?B?NnBSeCtkV1dtTFlhNk16QTVRL0l2LzQwTDl1c3hKeEtGYm1qSzVOYjVzZ1Vy?=
 =?utf-8?B?RFUzQy9xMDZGZ253LzAwS0IwV3ZyZ05jL2c1Yk1wRFlFdDNwaHlGTDFkSVFk?=
 =?utf-8?B?eE5IQllhejBaZ1dXWGx5YUlubFZBcTd6VHJ6Q2pxZ0pzaDdIMzN3NldMRHBM?=
 =?utf-8?B?MUFSdUhObWNqNGxXeTEyVDlaQVR3Zk5icHpaVm9zU0NEL1Y4YTN4ODhkWE1u?=
 =?utf-8?B?VVBIWThRL0JUaFBQMUFEQXdkV1RyWjdCcmJhcVJXSkU0ZzhsSGZMUUY2cFJU?=
 =?utf-8?B?dWFlWHhwT2FLQjJzNkxVbkFRUXljS3B0NklDbzZqanNFOUswaFY2QUNDT2Jp?=
 =?utf-8?B?R0xZSE5vRjl1djVNL0hSOVZTREEvZHVaSzRudzBZWGVTRjBMM3dETzE3RTE1?=
 =?utf-8?B?Zjh2R2FFMTRkM1lQTklkenZyZ1lrQnJZS1BJdGpDckQvOE9ENUw2NWp2VVdK?=
 =?utf-8?B?alUvamZrV2U2T0FxckQ4czFwYWpoRnc5Ri9jWTMwaEF2WE1Jd2NRWmdqdmtE?=
 =?utf-8?B?Y1IzdWw2cmlmUVVvUmc5czZFM2lMSjNhVW8xdExVRlJrdm1lbDNpakIxN1Bh?=
 =?utf-8?B?dVlEWnBIeUtuMGIzTDE0azdSNXpmM2tFTnJ0WngwdThOUytyVzF6QmplYVB2?=
 =?utf-8?B?TStKWVh1QWkvZGJBNnBnRXFPY1RoRlRadHUzdVZSalFQd1F4dUlJYnZxL0Zo?=
 =?utf-8?B?WUQwQ0FUSVJSTlh0ZXR0eHZTeExxZUtjc2srNGNhQUNTU0M5Wis4U1pyVkZJ?=
 =?utf-8?B?K2ZURmZiMjVvM0tkSnkzcjhVQTBEMFBuMVdHNXcrQ2tIS3dOaENYeFJncGUv?=
 =?utf-8?B?eSszd29NdVN2cDB5NjRaa0owc2QwWU1hKzZ6aFJ6K3lsZUFrNXhUZ2dJSWNG?=
 =?utf-8?B?VUZrSTlkWXRiSlR6UFRUc0pJNG1DYklSOWtLaGlJeTJ5b3puM3RtaUVtcEha?=
 =?utf-8?B?OFlOVUw4cTNjTXpMSlNhdWh0Z1pPa2tGK2M2aGMwQjNFeWFoNlV3czNxSTVj?=
 =?utf-8?B?UFlKN3FjQldqaGMrRU52ZVRaTUtTSEZ5U2tLRWU0alNqSXJ4S29nMlZCNHEr?=
 =?utf-8?B?OWw5Y0dSWDZnNWg1NU9uWkdsNTc2MG81eHJFaGExQ3VDc0xxQW91QnJ2NTRp?=
 =?utf-8?B?bFVOTHFqb2F2UmlpbHBORjUxVUIxVTdvVURGYVUzTGtHenplclVVeWVUcmpW?=
 =?utf-8?B?Z2hLRzRnT1Y4SHd4a2JyR1JST3cwcys4blJEUzc5bW5ZNUIwNm9VaHBwSXZ3?=
 =?utf-8?B?Y0xuUEVUWFJqU2Z6NVhOTE1XMXlGamZaOGpyWnVFMnZHQUdoLzREak5iamZa?=
 =?utf-8?Q?4Hjk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkRROUZHNlhuWmgzcVhUK3lYaEF1b01Jbm1OTW5Zd09PaXRnS0ExZ05leEdM?=
 =?utf-8?B?N2hYMEtGU0FmbmpaTkw4OU5VUmVaREpHVUVlNXdUSlZvOEtFQkZmRFZPdG14?=
 =?utf-8?B?TG1vWnBGeVUvemJtS3dpRjg5RHZSdnd6YmlQWnhmaFFvK3ZoK0dWRlFtaWtV?=
 =?utf-8?B?NDZGQnJlQVMwTXJrVjJKWjVrNy85RUMvb0U0UnFxWTdPNnV6aDBrV2RnU0lZ?=
 =?utf-8?B?QnRaaDZsZWZBRVhZYWQyclJLK05nZ3lJVVllaXYwbnFPOE9mWVViVlFsMkxk?=
 =?utf-8?B?dFRHSm94SFZjaFdyUS8rb1NQamxxeW12RkdLcm1zVEhPSnl5M2JqR2NOejBK?=
 =?utf-8?B?UDJrYnBVTEp3bTJsSVhCKzNXNDhhTVhLak5OUElVVDRxNFBRRjlCL083RzZo?=
 =?utf-8?B?SnhraHlvSVVCSHJ0aXBkNXN4VDVlVzVSa0FmN0toMGErWDdNS2ZYVDQ0QUxn?=
 =?utf-8?B?bkl3MUUyUjJYZUN4UDl3N1NwZ0RrTHFlS2o4MVhjYUlDRTRIaEtNZUEyYnN3?=
 =?utf-8?B?ZGZWRXZjL2VtM2NNejYxc2hmRTc2RDl0TVdyMThxcG9qQTQwYllYOTJLVTVa?=
 =?utf-8?B?MFdkOXUyRWJ3NjRkSStsSzRPMkl1VTFYeXkrdmVaRnNDaVlUcXNwWkhhcXNm?=
 =?utf-8?B?MzZMZHd6MGRUSFlYMENPbkhIbnIvaEkyRzRXUVlRQkJTc1ZOdDFjSEIwWUly?=
 =?utf-8?B?VXpUTEFXU0FFbFZnYTlxcStsWjRoWVFVSklaY1lMcFZqUFEvd3pwVTVQNkpl?=
 =?utf-8?B?ZVZnd0RnczY5SFVnYXdZZGJnM0RXdy9oZFhCNmoxaGFIRERUcXdOanE5Vzdz?=
 =?utf-8?B?MUdXTnFndmFPUHVFQ0QrK2sza3hWSjJidjduT0orcDlSd0sxTm4yRXY2QVht?=
 =?utf-8?B?clI3UjZZeU1waGdDVkM4ZkIxMkZHU2Z0c0Y2QWRUOUhOS0dFMmpKMEFRR2NN?=
 =?utf-8?B?VVJOaWZyMlY5c2Q0Vy9sK1h1N2U1TmJobEJlVzR2bG9VT1JPaGpHczdhZ3lV?=
 =?utf-8?B?Ri9ubisrRHkzdTRqRW1PSmRQVnd2c2dCZ3Y5U2RnWkw0MUtrTEtueGdRRUIw?=
 =?utf-8?B?bStGREhrSXZZbjB5eXVlNTAvUk9ETWZpd3JnNmV4TzFoVWoxMUZxZDl4UFlq?=
 =?utf-8?B?amJnWVJkbHJqTS9jaXUzNUlzV2NCd0tUN3VRbXRlYnRtOHhyYzZjUzAvZGJm?=
 =?utf-8?B?WW84aWZid0ZWS1pLYzJWVG5oQkJqL0VMdVQzNnRLbXZvcExQY0YwRWVxUHVG?=
 =?utf-8?B?L2JNYUluTzQxeDJ6d2pCM2crZ2RLTEprYTRqa0IvNGUxZjEvTHpwcWFhRmtk?=
 =?utf-8?B?eFJwZENLbUwwQlE0R0tJWkc4MGpBUk9vajZSSHkyWHB0WHEvQkkzTXFTNlU2?=
 =?utf-8?B?Z1lJQ1crTlFoSng5SWlHK0VUUGM4b3NtdisySW9wanZiZit1Y1hDVmpjMmhx?=
 =?utf-8?B?eHNCWkd0U0hqWHZoYjV6Y2pRaWovemdMR3BkdlB0OXE1bExQdmpSQmhHOTRm?=
 =?utf-8?B?OHJ3QmJMRWkrM1RoT3ZRYTduR3M0MzVlQ3lSOTFTaWZZOTd5bkp1OEo0MitE?=
 =?utf-8?B?ZzFPYlNOVU5PSURNMEZOdUFBZDZYSFZKcXJVNzNyTE5qMzNmaU53RERnUHNl?=
 =?utf-8?B?cGlJV2I0VWxrZGdOWjJ6R01Jem9FSVNERjIwR0tjQ0w0M29jQWdOWFFnRStH?=
 =?utf-8?B?OGVtVTNTMjhQNGhiOWZoRVhUN2FldFBjeGZkNzliblNDUjJjN3hURmhiaFpQ?=
 =?utf-8?B?Z3ByVW10N1pwYWRidHgrR1VuMnFBN1Q2T1E0bkRJeTNBWkY3UXdLblJkajFC?=
 =?utf-8?B?R0FiSmJnYnNFY3A1Mk44SmNDZ1NkcFhkYjdKL3c1dkRudXdMems2bXVSeTZp?=
 =?utf-8?B?TjZuWjh6S0U3NDJCK0Rudm5PbENUTnFSQVJJMi9NcDQwRVpzTnBQOS9MZCtN?=
 =?utf-8?B?dXNLb2p6Wks0YS9vYjRMVnRjdCtpT0lqVDdMT25pdE1wOG1EdS9wbEJOUStR?=
 =?utf-8?B?bTFKeW5iM3F6R1UyemVtUnpxK2R4UXluS05zUjlnbTZLeExCb2dKU25QYmky?=
 =?utf-8?B?V2dWbFI5TU1GRlhaMWFESWVZVEJmaFZjZVhnUUdlaDVvcE9QcitJcG1NU2Jv?=
 =?utf-8?B?bjdsV3hkNjhYODd5TG1RTm5XcFdLeGFaY1JrdWFDYTNMcnVZSGJjdnNsMEpE?=
 =?utf-8?B?Qis1SW5WT09NSER4cndldTFhd3V0NEZQaWxUano3cEphYTRYbS9vdHBlTG9Q?=
 =?utf-8?B?bllqUldpdTVtejh3RWU1cDJJaE8wbEE5cXhTbUxIeXpRbC95aHhqQjRkQ2Z3?=
 =?utf-8?B?Y1NwNXhJOUlSYmNOb0NQVXdxQmczT0U2by9sVS8xVnZtUUNNU01ZQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf98697-c053-4925-7d3a-08de6ad6ccc1
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 08:06:32.4794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bnq1zPTGlt2heOjmehyrl/Xl1ANytip5jAJGwpPvzDSV30GYRX9ugFVk1nE2ZZzOLNQdOuaN2fqDvAhAx5FESw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB7239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52696-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhentao.guo@amlogic.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amlogic.com:mid,amlogic.com:dkim,amlogic.com:email]
X-Rspamd-Queue-Id: 27876133CB7
X-Rspamd-Action: no action

Hi

在 2026/2/13 15:33, Krzysztof Kozlowski 写道:
> [ EXTERNAL EMAIL ]
>
> On 13/02/2026 06:12, Zhentao Guo via B4 Relay wrote:
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Enable the driver for Amlogic's stateless decoder.
> Why? Read other commits how this is supposed to look like.
I explained the reason in patch 1/4. But please inform me if you have 
more suggestions. Thanks a lot!
> Best regards,
> Krzysztof

