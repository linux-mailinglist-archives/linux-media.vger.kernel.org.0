Return-Path: <linux-media+bounces-47694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 474E6C84CB8
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 12:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3488D3B1872
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 11:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9D2315D33;
	Tue, 25 Nov 2025 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="e1O/QeBL"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022134.outbound.protection.outlook.com [52.101.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B3279334;
	Tue, 25 Nov 2025 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764071235; cv=fail; b=joSyU/SHxKfbK7xEaHYfMxuVOvABxAbsQjukqaZqGTijoTblWkZhe3BpFWFBobtjtnalyZ7Fu9JDSLZLY8P3hA+61p8SO8jeA0/LoBq56Wi4xwuVimGi56DCjf9X4wdk8MZGWnRjx3gy3uTHZpCRsiT6FIBUE70G1IThxxt/gJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764071235; c=relaxed/simple;
	bh=rFQVcLETYmGMgmn3SaFdJCIFt8xVGQHxKMMScoHj7OE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mz4E7YI4f3rJS6qtpJd/KZIz+Kml4F4n10opgPeXGZXSXRmKoxF/vsB+OwSzLaD1eVYZthkWPsHV2PiOPoBHmk1bkVTJ+yrOfRf8AcK85vUeHtnH7oEq6HBKGIGw7pDyUGYe/Wnjy0PuhUFNjir+6Y9aawYBz16FASHhaK0gv74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=e1O/QeBL; arc=fail smtp.client-ip=52.101.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uu1nSGWhrySicpV104TjXvAcv4PNMbHm2kQaCdI+HC9MtDBvY827aCwIYEDmYiEJuYEAb0+RJVlymhkhyteXyf+g0tJsxbt7kYg62oePgECe/ia38nDgV1O5iIHAzs2IdOv/JaJyF+ZrRJZradrbJHsFSCrxIsqT3InM+rJRvphjtDUyZ61RHOwjeCgv7q6SJP4OpF7rAoJWUYwajr7THNXeQj2gtODvyNggo4xBRJyHZbBAMkJDVX9+BOg37QcoXxNaHfiG30i2xziBQ/4114GiYNkytP8EyrGzJXMvzrCzkrUYr+4NF96CuqbGFSgNl42r4KmZWtqRagOMot7mZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQai8saFAL7vFOCSPX3zZFuJh8shzhEJf7+Ov91oSvk=;
 b=rEGI5voaVHRMSPm7U2CC2M0cew8UkeiTzMfGXYg5p6N77jxEnmmgJe/3dSGtA/huqS6YaOVVUnTDiJsUcrmIEwvceeq0TLJKnvaNGWR7HxtebDk9MmZki2mMfCe3Hfdli6wQLrrQKep59nB3KH9ua4vuuw8iion34CbZFwjwm7E//S536lIFkFbToEKc12FJcatP+OSYEi/E/rfKocR7LEKl3JbNJYesOJDIsIJtJtnSTsUDSl9dIPhRcygc1cmKcwY7k+BdVRche5rlS7JhN4MNHR/HS0sdC8eGxk02SW+uPdh2sKBJAK+LEav/rSTBjaPN81nGl/pWqQzCxwHqGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQai8saFAL7vFOCSPX3zZFuJh8shzhEJf7+Ov91oSvk=;
 b=e1O/QeBLDWY5n9zL3fA/JUxSw/mKgUxXWm9dkcHVN4Gg8SWYjHUl568zNW2emFZLYwqIsB5dEy69jJZo7jqRJMVHGoXKoVddwJiwlgkMOTf4LAU5mdmY/ns8zXmXPJnE3hENKOsuLFMKmEPPT7cOWqNqSzxCSJOOL9jszh7U41jPUc03YMYAW60ZdZlCUS8pz9f8DCJKzCYx6qFy3jT2InkdmPL/oNOLb0AitBmWmP3ZgtTzDl/9YPbOQSZ2RHBHe5SORBX7M31ju1kW+mKPxwDakFzb48YQ1dTuJ6q0TTOl+C7iiPgJUwTkBjshXzIxGJOQGIpTHj/q95/xJCeQJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by PS1PPFCD661EAD0.apcprd03.prod.outlook.com (2603:1096:308::2e9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Tue, 25 Nov
 2025 11:47:08 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:47:07 +0000
Message-ID: <5fbd65cf-8e4b-4201-bbd2-0986e1debc7a@amlogic.com>
Date: Tue, 25 Nov 2025 19:47:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] Add Amlogic stateless H.264 video decoder for
 S4
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
 <176399402192.138936.11233579649489245455.robh@kernel.org>
 <5faeb411-91d0-42e2-9bf8-3051045ff42c@amlogic.com>
 <ae1fe925-3e3b-428d-9bae-a587ca5e37f6@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <ae1fe925-3e3b-428d-9bae-a587ca5e37f6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|PS1PPFCD661EAD0:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3c5517-e85d-4177-6ead-08de2c185ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SE9OSmEyQVhESTlhNldNaTZtUEZ4dlF4REh3cHFqbjd4QnZzdVJyd1NNSUVP?=
 =?utf-8?B?MSsvYSthVEM2QW1pWVlHemQ1K3hLVTZLNGVpUU1COFp5THE4QW9HTm41NGVh?=
 =?utf-8?B?WVB4eC95R0dOT3NoWmhOVFhrbWlZSjB6akFjbC8wb3lZNUVXUDBYVGgrL1o5?=
 =?utf-8?B?UVpVb0RieEp6NnFvd3NWM1lxUDdzR21JVnFRWFhkdmI3WTJOK2w0TXBNcGlZ?=
 =?utf-8?B?aWd3dUJhYW5Zb0RsWUY5WnIxZCs5eXFCOXBSd0twTThpSjNBSHovcXJDM2Va?=
 =?utf-8?B?K3F6bElBdjFrVEVLV3JzNkZ3cUFFTVh3cEFuMTFkeFZBcmVpWHFBNmR1WlFs?=
 =?utf-8?B?TGdjR0dxU3cwQzd6akhDSVQwQmhSSzNxK1lZY2YwcGlXL2E4eWIyd05ESjZu?=
 =?utf-8?B?L1pzYkxTeVRVdHZIYU5OdnU4eVVtV21TcDgzdGNtTUFpeDFuV09uYXZ4TGh0?=
 =?utf-8?B?aHRLWlorU1lWZXFuVHlzQ3RXVmllTWx2OGdJNUpkVk0zMTBvMjNEc1BXb1Ex?=
 =?utf-8?B?emsvaGFzYjgvTGpQMXA4bStYanJLblJ2dklhYnBuRVdIOERaV3VpdklTRlZQ?=
 =?utf-8?B?QVJXVnFERFhaMVNkaW5VOXZ5TkFHYjV5UC9RSGpYMTd2MTl2T21qNU0rVlh0?=
 =?utf-8?B?Tm9vd2J4SEw2OG50UnhuOUF2d2JxMkdUT3J4bVB1cTE4UTI2RThJVWt0RmpF?=
 =?utf-8?B?SmkwdFZ2a2FEbno2VU9xMXY2aTdKZGNkcWVQa0pucURTaGQ4UElUWm96djdH?=
 =?utf-8?B?UnpPUCs0NnNhSmh6ajhrTDdmZndJa3pBbi9oU3paZ3pGa0hCaVBOYmFITnVR?=
 =?utf-8?B?ZEZGclVRUDR3S3ovMk55bkZXY2NDaVhrQUVZTVVUTDAzTFIvNlphY0FVTmFM?=
 =?utf-8?B?Q1dKTTVkWGFkbXFmYWwybVlLRjdtU254aitIRnRMSkxWQkNaYldVQ0pkMS9k?=
 =?utf-8?B?SlJQWHdVcW1jdmN4YU85bXppczIzNXRBb3c1azFZejE3bGFZN0dhQ01TWFly?=
 =?utf-8?B?QTJDUG90cGJ4S3owMnIwV1RBbTNHaGVSc1VIcFI3Z1hwK0RlditQQ3ZCcC96?=
 =?utf-8?B?MlRqTi91aVUrcnA2akJHaFQ1UnJUcGNlcjZWQlF2Qmg0QnU3ZWJKcUJuZUdD?=
 =?utf-8?B?WWV5N0g4M0lqbGRsNC9Lb0x6N2Zzc2pFbnFndkVYcmhyeEdEQi95NUJxUnVs?=
 =?utf-8?B?VTFlb3k2VjU2NmVFOVRwOThGeVpKbjF5YklrQ0ppakp4VnRZczlNKzZ0NmZ3?=
 =?utf-8?B?ZWdPUVdqcmZLL0xLNktZeXBCdEtwRm5HM1NGM0xjNGx3ZWIxbDBGT0Vic0hk?=
 =?utf-8?B?dTVJUmFSUVVpVkwxNjl0enNhR2NUSzZnVG5PN1B3VElEak9ienRsVy8wOVhh?=
 =?utf-8?B?SmpkQng1RXJQSjdRTFMrRUdxdEQxalY1dG1PZE9SZkc4MFRHMXRHTWhkdm45?=
 =?utf-8?B?Q1p0Rlg4eGRxbmJNZUhmQkNYaFM2OHVSVmNJTFJHNjljTkhlb3oySnl4SGl1?=
 =?utf-8?B?YTBoSTVvWEFJYm9VbUI0RjZTZVJYOTY0Wk9JbkR6SFJmVnRaZWEzMHhDKzZG?=
 =?utf-8?B?N0dRckMrUkpiR2dteHNaamR4M0dHckhYM092VWZiMTl5SDVEb0Y4Sm5jQzZ0?=
 =?utf-8?B?QmUvS2VndUM2NDUwdExUNDJVTU4yOUJsQjNvVEpXK1FmVUJ4VXdza0hadnJC?=
 =?utf-8?B?Ri9zVEM3azJDdFNYUEQvNk1KNEYrR2ljWmNVOXk2aHpQWHlwd2NXNG1IeFVa?=
 =?utf-8?B?WnNUM3NDYVdHY3JmS0Vtb3VDY3h4RDlaRlh3UmI4SmNuMk1SS0FmSW9OM0ZR?=
 =?utf-8?B?aXdOZ0tKWjgvWk9tcTlpVm5Kd1BjNndLVGN1bTYyU1ZvOFNEaFRBaW1aaDZ3?=
 =?utf-8?B?THFVK2UzaTNPS0JzMVdnVGY1elliZ254QUtvbzRuU2tkWWgreUNmUUVrTE1F?=
 =?utf-8?Q?JpGa+pJIW6tAm/7L0DcNlo54o6BzuNJS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFhhaEhpL3dKZjBVSmJkdDJ3TlFVcjhJa1Q5c1d3NTZ6LzNJYkRhZEFQVWw2?=
 =?utf-8?B?RW1Nd2ZaNWpFd2xFMWIrSmZvQS91ellhMGxoQmxub1BzOGF1cEpoRFhYQUNq?=
 =?utf-8?B?M2RsdW0wZWxqZlZGY2tEVmhKdFhTcVhBSEE1NmxBWjBjK3ZVSHVaWVdvMk9m?=
 =?utf-8?B?SUFjMVF1L1Nnbk82SUF0SWRWRnhkbXlSV3VOMFRBTWlKenRRMmhHeXFUbG9n?=
 =?utf-8?B?U2pRY0t1ZTJNdkpZS0ZxbElERHArTlk4R1VtZ1hzb3I4Qkc0TVhFQ2U0UVUz?=
 =?utf-8?B?YWhyU2lieUZWNWJKRlRtb1U1MXpzci8yY3MyekpZRlJjT0RVYnNmU2VRTVVP?=
 =?utf-8?B?TW9LTWhDeUhJS1krT2duN0NTd0tNMUMyVW9WZ21VeGFWdlk4R1MwQ2o4eEh4?=
 =?utf-8?B?RkVKd2FTck4zQUQzSUhaRlY4WDdGYi9RV3krR3JVY01oWW9qVkxkN25OWGdZ?=
 =?utf-8?B?SlBGRlJadUlKdWQ0V3BjNWhpbVJNWldDU3kyU1QrVE9kZjFhYnRuNUxRd3ZW?=
 =?utf-8?B?MkZBY2NQNjVTNnMwV3J0bWtIcVh3OXBhMkhPaFJQZ0ZvOGVZWXFLS0F0UEZn?=
 =?utf-8?B?NERzZHdYR3UyaWVUNWlzS282SzlIbG1rd2oxeEd3ZWVtYjRjSEp2Q3daR0pR?=
 =?utf-8?B?YmNheDVCMGg0anFZN1NsY05WUWhzYkNTNTc1ZTZwTXY5RkhwK3RFOFozeUdn?=
 =?utf-8?B?NkFuYyt0TER2SWhjQjJXZDZxSXFkbkFLMGJIVTlHSHVVejZtR0dxbGJjdnMw?=
 =?utf-8?B?dXVVclMzVnA0ZEtneXRPc29iWlZ2U04wdUI5SnBrNURwZW04SzJ0aWdyV1FO?=
 =?utf-8?B?Zm04SlNmZi9SRHprTnBZb0lTMXFaNWgwUC9RaVMyanpWZjlQcHFucG9FK3lM?=
 =?utf-8?B?QTlialB4ZUxpem5Mc2dJU09UYzdZTFFkMFFhSnF0QWhJS0lBZHNwZFlCU2lr?=
 =?utf-8?B?bWoxT01ZSHo3RHZGTVB5NmdHcS9NMHRsN1ovNGw4cjRkZFlJN1M1aTNFa3RQ?=
 =?utf-8?B?M0toLzRKTDNFQzk5bTcxRUpkTTEyQ1dGaEdpQnJQUlVabUtJNWc4ZHU0bWZn?=
 =?utf-8?B?NkZQV2creUdublk1Mk1mdFFlaXBUcHlNaVdxYkp0Ulh6UElLNklXT1pvOGJk?=
 =?utf-8?B?c0hHc2wyNkNiRmlteEJpM3U4aTQ2RFNuWHlRYmJpanhhc0FHS1Q3cmYwZDM3?=
 =?utf-8?B?MUFOVWlncHFWNHh4UnVRNGp2TDQvUWt1ZEJGRTRvekJUNFRURm15UU1uVnVJ?=
 =?utf-8?B?WkhtTnpWenRFTmlYS3FjNXBoRGRucCtGUFZJNmI2VExqZkZHMEJaSDJ2SnNl?=
 =?utf-8?B?eW5XNXdKWUZMeUdKSE04VENaMGZRZklaOTluOStTQkhrYjQ0a2tTN0JKT0Vz?=
 =?utf-8?B?U2lrc2prSElIaWVaUWwvY2kvTTZ4ZDh1eWdDTXFUZ3FraFBlRWVhQkRFVitF?=
 =?utf-8?B?bGhpTWhwWVFpT3pWVEV1ZCtwSzhOL1ptOXBlaUZJRW4zbXR2YktnUTFvNEl2?=
 =?utf-8?B?cTNwSG15dVBJT216UkVCVWFFdU9kQll1WkdFRDJpNW1xemgzQVFXTkVqUzRX?=
 =?utf-8?B?UWxvazVFUTJUKzdrcmR3RGtTT1pCQ215M1BMNHZUMEJ3VjhYZmhlWGdSL3do?=
 =?utf-8?B?Z055c090SjZoaDNDVUd3VDhDb2I2VWNLTk16RGVJZXFRcmVyU0lUeGFMYW80?=
 =?utf-8?B?aGg4ZWdzaCt3TkN6TUoxS0JXYXFXRzlCNmkzV0lrUkpZYUpyb0trNllHQ0p4?=
 =?utf-8?B?cGF4UDJkSXBRUWhaSU1vajdPMHVtVG5XajBqNTJhRm5HZzhIUUl1bmU1SjNs?=
 =?utf-8?B?TUdXWE1lL0R6VGdIaEdHTUhPcUhmaFd4TTlrdzFCQUxkZTZpMGVqaXJ1TW96?=
 =?utf-8?B?d0xXYVhDc2pGMzdoWlBIK0dhdi83U0FCOWJqVTNMUHUzcHltc1hjRktGdEgx?=
 =?utf-8?B?dTFpSWVOeUZiQXllb0I0UU5yYVNpNTBmb1N5TkI4WStDejdPMUJ0clg1M2xl?=
 =?utf-8?B?S1lTYm9hZUo2cHNXYjdQR1p6dkt1eXJGYUFZSWVLem5JUTE1ZWJlT0FRMHlw?=
 =?utf-8?B?WU9aTlEwZDZEdTJYdE5EbnAxdWNaL1IyNGE3dEFWcHo0WW1ZY2pTc3h3NnBO?=
 =?utf-8?B?RXVsZGEvVkhHR2ZNaFVZcHhDS2JhTTVkQ3kra3R3Zy81SWxROEhBY1NSeXlJ?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3c5517-e85d-4177-6ead-08de2c185ca1
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 11:47:07.9085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TZEvJtyjC6+O6kjja3Jyn0qQWupvaGrCGF7pTRyfZUnC2H3UIuIxklF5VNcLIGS0A6iKL4Gh5Sma1I8GDfzKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPFCD661EAD0


在 2025/11/25 19:29, Krzysztof Kozlowski 写道:
> [ EXTERNAL EMAIL ]
>
> On 25/11/2025 04:24, Zhentao Guo wrote:
>>> (or use b4 which does this automatically)
>>>
>>> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com:
>>>
>>> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: video-codec@fe320000 (amlogic,s4-vcodec-dec): 'amlogic,canvas' does not match any of the regexes: '^pinctrl-[0-9]+$'
>>>           from schema $id: http://devicetree.org/schemas/media/amlogic,vcodec-dec.yaml
>> Yes, this is a problem. We renamed the dt-binding file and added new
>> node to the dts in this patch series, but the dt-binding was not fully
>> updated. We'll fix this warning in the next version.
>
> The problem is that you did not test it before sending.
Sorry for that, this will not happen again. I'll do the related tests 
carefully next time. I fixed the problem this morning.
>
> Best regards,
> Krzysztof

