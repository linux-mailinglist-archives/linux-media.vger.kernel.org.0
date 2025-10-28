Return-Path: <linux-media+bounces-45824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5D6C149C3
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 13:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CBAE64F9A0A
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD29932D7DA;
	Tue, 28 Oct 2025 12:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="yd5llu0I"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023092.outbound.protection.outlook.com [52.101.127.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3DE1397;
	Tue, 28 Oct 2025 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761654235; cv=fail; b=WZP6tI1iSoJ3E+mId9fYd0sMz1DoNJ474/+qUpT4Xd7Kflxxp0Qd05lqi+FIWQwS96JDemB4kiJjBDuX9S8u5ZwrsvTSRWL+RjTvXzWgNj8x2fys3+Uc9rX94LWrLCvy4TqEth7/lba6bZWnBlzgSQb2G6Ma6QTZbcHv8ot56fI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761654235; c=relaxed/simple;
	bh=IsUwwfS0tXvxrPF1CrjF74rsK9W63jv+E5HUYbAXVaM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L4AOxzw+5Y9zq7++RRkPuSar46vIT1dlAZLvoSF71ZG8virh6W1sVaxFbG3U9gnnzkr07Zc998W8py1rIl+V2jXbP2gWKhmnJelcPkGsNZ8Tm6otgSudjtAHgK2UP08mEp2KrfVMMRPRMnpD+0nLlkL8jA45HBVv29HWA3mzHQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=yd5llu0I; arc=fail smtp.client-ip=52.101.127.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhtBOPqfGNy596pMgE81cCHXUgX7bzhuVEIA/a0GwP/vAdznOVNcbczJ6ll6Vd4ncc4GII1nltAfsk5+j6cZiXH/FToJnolFR0Rj+0RmJIIJjwmjYjyeQD7/KhdMbNl6ZkVNRUJAtrwlv+W8iP8Ia4MgZ+O1GRLrWr8ENI1YitZ9gGRn0kqs2IND0yelfE6ZsiL75vWC2eot3DuVZC8kMq2GQFVaqdsqNYC+jAvPLMJJiHjwpE3EXjYhS0aC+C+JITHADYYV6dxyNOJ2/u0SihmcmvSJxtkO1eM+UYYLgYPYLlrRdtkyqtPF7QGWiFU2oTIm2ctHyPkD0MxLsaxo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJw4MXbneXzfJttNpYBdh1GES8KBX/bOhgl6syf1H+A=;
 b=KYazgy1OyuZPj4xpF97draT5kp1LdKki/lobZZSGNSJRknaqc6zXnDpRUjdnYnkMu7fsUq/dTgZgBDGrmLB1OaOH1kPxzOU3gRiA/1LnvauMtrSoR2HchkFi6hvetgMyOgWtY4KMXfPrs3QobQlv6REMrvftAzur1g5Rg5tt6BvMkJwSUL3JVeqf0Lu4473T/IFVUu7GcgdxyhQEZ6FAWi45++ZfqXEYBv52QeRL5jMBU+ZruB0BVAXar89Vc95LBwDuVG6HhOeY1X6D6GZQXLnR4WG1d4mpgVqZRO9lo/WdQpZQBdgX/MCsCmi2kLQ047yDXOKUgxVd0shRjzK3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJw4MXbneXzfJttNpYBdh1GES8KBX/bOhgl6syf1H+A=;
 b=yd5llu0IxylEj6iz4unOizGmZ20pz424PuB7XSFgLMQgGV8mW/Chxdx/v7IGgubZs84tiXE4UhM8qTEAdzLdfkh64eDh6PNyt2Nfx9xVKa9amz7ngnY+KIQ/XZ53/XjVCk/s8e2gyXHZAHLQafygOIb7iT8xTN+t2oy07jZ7CKOj76P46AURCAQkDGEHiEQYDD4paiKK90y+vkooBho2cCAf7zg46UpyIhwMmVGPGZwT8rVA1Mvk85axjJ4yG85yq8bYF5dDSvpsAVGDqWzsBcg5dylj8GlhuSPWw5PAy0OayzBMfpb/JurSzqXyppFwR++ZP2ng7DIIb1ZKZsvOCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com (2603:1096:400:5e::9)
 by PS1PPF26E989C4E.apcprd03.prod.outlook.com (2603:1096:308::2cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Tue, 28 Oct
 2025 12:23:47 +0000
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e]) by TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e%7]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 12:23:47 +0000
Message-ID: <fd77eb21-4324-4f86-858c-c6b5a63f68c7@amlogic.com>
Date: Tue, 28 Oct 2025 20:23:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: vdec: Add binding document of Amlogic
 decoder accelerator
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
 <20251027-b4-s4-vdec-upstream-v1-1-620401813b5d@amlogic.com>
 <b989fba3-223d-498a-8efe-7a60e26cf0db@kernel.org>
 <40830266-692a-4731-8957-4462d4993746@amlogic.com>
 <606da3b1-f042-4cc1-89d0-4feb257f032f@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <606da3b1-f042-4cc1-89d0-4feb257f032f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To TYZPR03MB5536.apcprd03.prod.outlook.com
 (2603:1096:400:5e::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5536:EE_|PS1PPF26E989C4E:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df094b3-7c76-4b17-76e5-08de161cd7e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0czdWNGajBTZkpvSnhJajJBRkU4MUNCclBqaHJ5Mkc1cTFwZ2tzNmF5aStj?=
 =?utf-8?B?R0tIV1VuZWpGcDYzM0Q0VEQvbnJ4dSsrSkVFZ2ZjbFpqdWdEVmpTVlFyOTl2?=
 =?utf-8?B?TGg4WTRtbmFTUjBpN1dLYkg3UzlWMFhpdUx5RUR5d1UzaEI5T0ZZQkFKaDlH?=
 =?utf-8?B?ajlDdU0ySllBNnpNOGM3L3NGUVdsYmw5NzlvdFVMUnh4ekdGZUt1VEdhSWJi?=
 =?utf-8?B?bHFJLzlRcGMwVzd6clFjUXBkSDlOYjhFcC9sVUJXZnVOV1J4ZDdTS2NPMEUw?=
 =?utf-8?B?dWxjeUJOWitQU1JhQ09EMlcyQmI2aGwwMHYrRGJTUWtTWVdhM3ZYalR4cEZl?=
 =?utf-8?B?dWFneDdJVEI0Vno3VVRwSEo3R1dGdm1LaktRR0FDYmhZaGZLYThoTHVmcHJP?=
 =?utf-8?B?UXdKVE5mSFB2RmJUKzRvOUQxelJNc2hraGpVbjdXS0oxK1JwaGVyY2xqeW9I?=
 =?utf-8?B?R05YSW1GRVAvTHNOL3FpNHZzL093UTRpM3lpZlJZVVoyQ3V5VkV6T0JPRjZR?=
 =?utf-8?B?K0hwNExWQVFTUXU2YUhiL0dTQ2hSNHFuVmNidnpyM093OUZONkt6WUFuNlMx?=
 =?utf-8?B?ZDhqaytPak1adEhrOW5EbUV1TiszNm5ZUkVMWVVSemQ0RTN3QVFtclVWSzh4?=
 =?utf-8?B?TW9vTFZCcmpJVW1mZWt6L2tOQzdoUTVFTTg5QnFVNEdRRXJZcERqandXMFhm?=
 =?utf-8?B?RDdJUXBYcy9rYUo4M3dwUmZJRlhmLzJCR1pTaUk1bUczeEJ6TzQzVW1qaTI5?=
 =?utf-8?B?bVQwTXFXcS9EV1E3emU4THhnNGozREVWTkZpR1AwZjBSVWM3YUVKdWoxYWwy?=
 =?utf-8?B?a3pTWnhaSUl4QmF5NHQ4alNNbjFwZ05uclBRZjVHZDBFSmt1di80YjY2RlEx?=
 =?utf-8?B?R2lnMHZNUFROWEc2N3IvdUd3YUJycFIrTUxPcE9IV1pxSitpN0JKWGswTFpm?=
 =?utf-8?B?bXFuMGFNSkhFWjI3cVBhZUdnR2FEd0RyWnl2YmF0N3g1a05PcjVSc01ySU9r?=
 =?utf-8?B?SmNYamdNNTVMMzlkZ1pHYjlIajRwaFVDdnRDNXg5a1F0UXBvcWk4TW5rQ29D?=
 =?utf-8?B?RW9ZYkRjUG02d2hldTRCR21LaCttdzhhZDR6V1pUUC9NVWJqMFZ6UDZRVzdL?=
 =?utf-8?B?bTB1a2ROUENRVTR1VXpFdWk1UlJMVGp0OFF4M2gyNVYwK0JWa3Zza2lEajlu?=
 =?utf-8?B?cml0aVNhU2t2VzFZWGZEK2Y4YU90YTZVUk1iN1RYWmwzdkZYRmtpTVp4QVZN?=
 =?utf-8?B?NWYrZFVzS1dIQ1N1NnBka0RtR0JmdkZsd2duVm13M2tvUHhIUXFBeWE2aE1U?=
 =?utf-8?B?aSs2bzdMb3Rxdmtvcmh5L05OMHYzekgxVmswZUdkeEhWV1hpR21Zd0s1M3J1?=
 =?utf-8?B?cVNWYTh4Qmp6TVk2TjUvai94NkFkbWRNSDUyQVh5VWdjRExsNnk1djRVcm8r?=
 =?utf-8?B?LzBzU2ZlaWR3dnhkdjRST2VuU0gxUHc0ZmdkZnIwNmcvMHoyUlhmU3lKU0Rv?=
 =?utf-8?B?bHluNzVwdXNTMzRKR1NFU2Y5eWx1NG5kY3MyRlpwMW5YeWVoVWJTNTdXcTdj?=
 =?utf-8?B?VmxBOVNYRTF5RlEyMG5BNmtpQ0pKL0pTSnhEVXNVcE9od3JpdVZOOXZQUnNC?=
 =?utf-8?B?bHczaVF6cy9kaytRZ0tERDB6bmc1a0FHR1NRWG5wNXdnaG1DeFovT3ZOd2xX?=
 =?utf-8?B?S1VJZDVrZHNzRXB3dGRjVjZYOTZPa0hneFgxMVpseDdOaG81dXhPQmhxTVB2?=
 =?utf-8?B?c0NvM2xuMU82cnRTekVzRDJVWHlRZzBMa3FVMWVPNEN1VnloSVNURnhGTlgw?=
 =?utf-8?B?Qk5rQW4rNDl6ZGlBNkpld3FoYlMxcUdOWE9uQ3grcTErOTRVbzZ3NzJlQzVX?=
 =?utf-8?B?eE0xRW5zMFowUDRmQUUwWVN2OGt0NlZRUFVZTUNpMEMrYXliVE5ENHVQTHpJ?=
 =?utf-8?Q?1K755P9agfYQLP4g6InA1An6WNRGvm9q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5536.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0VFMXF1eXNHVXdHVXVtVjdiWXRzeUw4dlhRcVRwMGowWnp2Sm9LUjNJTUhl?=
 =?utf-8?B?WGMrelRrS0V0WXBaWHYyWW9pdVI1UHZ1QzJpNjVobXZWR1FRQjNvZlV2OXJW?=
 =?utf-8?B?V0pici9URm0vemNPdGY0bittczBBMVUzUk9qTjJPa1pOMVVKMlFBbHY0RkxZ?=
 =?utf-8?B?aEVLRFVuTXJxQU9KeWxHSlhEK3RoUUhud0RyWEZ2UzNlZU4zQmFHb2RSNU5i?=
 =?utf-8?B?azFHZC9kTFRnOFpxeTBqOTF1M2ZabFIxVnNTY1NmZHlRb09WTDBaMWJCbmJw?=
 =?utf-8?B?ODlzQ05SUXRoNTZ1bkpqSE9DdGJpWGF0bWIxaFYvaHdtYjN0SGxKdWVZTVpi?=
 =?utf-8?B?RmhuMGc0TFlvZjJxREQxSjdrUE5pZmNzc3RHbTZLTWh6SlZoeXNhQWhKVFIy?=
 =?utf-8?B?akovendNaHowZ05peWUrdkVTZXUwcUxSY0hoTDlNWi9TZ2pmODVRRzBSVzVj?=
 =?utf-8?B?WFY3NW9Sb3Rxa1hJUkNTU2RvcW95S3FINHBTS0tJc1RzWXNwQXNjRDNHbjc0?=
 =?utf-8?B?ajRyUER0b2JIb01sZ0FZMVBLSWE1Zy96Rk5rbUp2UEZzcFFiVCtTOENWS0Mw?=
 =?utf-8?B?K2ZYNHZvZ1h1MmNFcEVScGN4WGdSdWp1Tk5mT29DdU1aQzVXTmNCNytOak5H?=
 =?utf-8?B?NmFpT01zMkhVVXpOczVvVlZ3Ky90dVhOdXZKQ0o2cjJtMzBVOXBJWHBxM3hh?=
 =?utf-8?B?M0tDcUNrZEdzbzJjSm90SnIyN0U2d2dPeUUwQy91aDh0Yk4zd1I5LzBzL3l1?=
 =?utf-8?B?YUVCODZYU0FsYURBSXBjOEw2d0dTUzZQV1JhUERFaEVXakZEcVJGZnB1Qlhs?=
 =?utf-8?B?MGR4Q0dHSlpWR0I0QUdvR0FhcUlzejRjdVFyR3k2Y2hKaHBOUmthQ2hHQXVU?=
 =?utf-8?B?TmFVVkpXNTRzenZCM0xyTVZ4R3VrWFZMMUxLNFF2azZXRGRkb2ErNysxSk1K?=
 =?utf-8?B?SVFSSko3UUZuT0lJMHZFSWRkN3JJc1hjMURORnVGZ3QyRGlBOWFJSkdqK0xR?=
 =?utf-8?B?MnZySDkrY2I4TnJNK1NOVFpaMk9xREhhVXlHSDZmckFqYU9DWVhpUW0rbFlq?=
 =?utf-8?B?OVNoTHk4TjNaYlkzRGw2dkd4WnBZSXZKTS9obVRmVTJ0L25vSGhEMzh4UVBq?=
 =?utf-8?B?L3E5eU8zeXJhSGZncHlQQU1NVnNYd3VVaTY3eFdLWVF1ODh3QU9McmNwK25O?=
 =?utf-8?B?aDVjR0djSjlxSDZOeUFwY21CUWR1R01xNlhMRm85ZlAvTDE4aUY3MVJMcTdX?=
 =?utf-8?B?T1Z3NmM3TThZTFo3Mk1BMUplTnRqS1gxTGY0WGtyNjl3VExsbDg0K1RPNnBR?=
 =?utf-8?B?QnNyN0oxSnhhMVJDVG03K3JNelJCUjJSRGlPQnRXQjl0VlVhTktLYS9Ta1N6?=
 =?utf-8?B?ZzN6ZHRRMzhYcHRqMmMrRkpmU2N6a2lGdG9jT3F2RDliZytTckZYazdhSmtK?=
 =?utf-8?B?dm9WdWMvODRKQXl5VXJFaXZGQTd3SkdaU05uV09OZEtMUktHUVJtYWRUcjBI?=
 =?utf-8?B?UHQ1SjhNaytmN21lRG00akVMZ2E0NVFUbGEvZmI5T3ZqU0ZIQmI4ZjNoUmxN?=
 =?utf-8?B?dm1tbzdBWkMwR0I5enVxbC9vamZOeUkwd2c1a09WOGp2YkJkOXNUSVNxOWF2?=
 =?utf-8?B?eCtHSUR2QmtqeVpKNWhpWm1MRHBqM21zQnJQeGJsRVBYVUpPRWlubnlxU0JM?=
 =?utf-8?B?QXkyNjZndUJwVFFXZG81MG9YQmNMclJJbGFFMkxwWitqY1NrZVBNMit4amRq?=
 =?utf-8?B?WTRqSUJRUEQ2OHIvMWEyYUNMODVOSkZRb1AyK01ZcjMwTmdVblE3TTVoODBK?=
 =?utf-8?B?ZU5kdUVvbDMrWkNlcVpTZW0vNFhpYkVCOHRJTitVaGtGTVpZZy9PWFd6V09Q?=
 =?utf-8?B?Z3Noekg1b1VXMWJhUUJNK0RsK3h5UUh1Z3lha0Ivd1FwMzNzcUdWc1JBVms3?=
 =?utf-8?B?RlhnV3VpZnlHVWdhQ3JhOWRDak1teURMY01KVjQvM211M1NoSEhvTXNDZWxx?=
 =?utf-8?B?MnZiOEpoZjN5RTlNVm9ZY3VuK2J0NDBYTGZERHQybzU0Vkw4NndYNU13dm40?=
 =?utf-8?B?cjQ1cnE4MlZ2aGtNdzVuV0EyRnNqK094dkFEMng5bkNCVXhlMnUyVTFQMTQr?=
 =?utf-8?B?QkN5a00zVjRubGd2bkZwcHBCWjhkbTRWaGNWVGZNNXp1K1NkTEV3SDdwMnFp?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df094b3-7c76-4b17-76e5-08de161cd7e4
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5536.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:23:47.3172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BhkrXX/Ch04YD6NDmyQCJkOs7My7rEAatKPw2R5v5Y/mw2aiqFOQmhpFfg9+70ukef3mFM9uxjIL0vre2GlAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF26E989C4E


在 2025/10/28 19:33, Krzysztof Kozlowski 写道:
> [ EXTERNAL EMAIL ]
>
> On 28/10/2025 12:14, Zhentao Guo wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    const: amlogic,s4-vcodec-dec
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: dosbus
>>>> +      - const: dmcbus
>>> Is "bus" really name of this in datasheet?
>> No, it is not from the datasheet, in fact it was inherited from the
>> older SOCs. Do you have any suggestions about this?
> dos, dmc
Got it, thanks!
>
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 3
>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: mailbox_0
>>>> +      - const: mailbox_1
>>>> +      - const: mailbox_2
>>> Useless names, so just drop interrupt-names property.
>> Yes, we don't need the interrupt names. I'll drop them.
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 3
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: vdec
>>>> +      - const: clk_vdec_mux
>>>> +      - const: clk_hevcf_mux
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 2
>>>> +
>>>> +  power-domain-names:
>>>> +    items:
>>>> +      - const: pwrc-vdec
>>> Drop pwrc
>>>
>>>> +      - const: pwrc-hevc
>>> Drop pwrc
>> Ok, I'll drop the two pwrc(s) above.
>>> Missing iommus. I really doubt hardware works without IOMMU.
>> IOMMU is not supported by Amlogic SOCs, the decoder hardware needs to
>> use contiguous memory.
> I assume you speak about hardware, not drivers, so it is fine.
Yes, I mean the IOMMU hardware above.
>
> Best regards,
> Krzysztof

Thank you

Zhentao


