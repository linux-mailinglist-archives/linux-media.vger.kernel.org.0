Return-Path: <linux-media+bounces-38210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CBAB0D65D
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 11:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE85B1885BB4
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 09:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC2E1DC9BB;
	Tue, 22 Jul 2025 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RCvA5YTB"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A15D2BEFEB;
	Tue, 22 Jul 2025 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178043; cv=fail; b=ubCZ8rhKzTGe+N0APb9eFfWqqA3l26YHJBTy0SL4gPHBIzIDwSa4/Pnq1tHRXct+EIhkUliBG4ExR7Uj5fXI34ymquY+SmSXu+dcA0iRJwmZ+G2kVblk9gYelYQ27V1kIoO1p+rUelyrmRXslC74lsnVfzDahafML8AJIwaFkYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178043; c=relaxed/simple;
	bh=eF6/NRflEdCdp4MMI5eLfSoLw6LOXJk4WE+nXYDhXKM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ohiDuusow4a7jg+RPcyu3SHf4hhFr1n1aCHfPOnzr+PM/+q5f1VG3udsnRvwhB5kWUcl5ZxK9yrgscv8sP7NnprnJAdyB5gSPOHCYmOuQe444LGx9oJh/i+oufjo1t9ORyO3pzOFe8M5UhJ/bOJI+8eV1vuvafEgI2fuCVdy8+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RCvA5YTB; arc=fail smtp.client-ip=52.101.70.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4q4DxZ6XnPqeZWLLOwOL087S1Dko4igxoLWFAwUoXKT3ZC72obNtJRK+oYXP5iiPAqZ6n7IuCsYKH/pIiHkWGhs8Jeg4G2Il8G6ZiAyDg3Fa78z5j4TeNDrtf0MCrARfkM1uZrJS5gh88ItIh9Ejr4V7p18IC1muhs+D8MpEGM9cZr73BAXfb3u6+zgTJx+QVic/rQoTcU2mTaHzo2xhJKXkFXio+3OFeIA/UAozV5fjjFQwcviFG8CPm94rMrFFPeiUJNUYeB3fI5Tf5j90+bOtOuecS2olQW+Ua0l95ZdjfjEE1BbdPT7vR+NdimnTcZlX9bFnGhGHAtxPgDcUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkIxgasmLXn92LXMedILIBS3S+dP3oIf1rFzNwgg5PM=;
 b=nqlESmRxy/eze5D88C/YvyK7ziFIRZMLFwAtsPEzxhM5237f1fiDiJzORjEsGFvZ3gsdQ/82QTwStTCu5/ic8zk9uE4Cdx1YsPLFoHrX+9wjDHKDqr4/wlzruvDMKNr50OUKv2dBK5PJiZsQl79wWBlZLjV5RMftDgoqXXU2x7w2W/kY66XWWSC7iklhUS1BkWSrUUcdzk1ih5StpkZWb/jhB4xbT4RDQ2ntRq5uUSDCz70XtD0JvxJIZD5X5oV/chVo6hlPMkfk2DqWbFr9JIswrydZw0QtiPzeqbGzg8x3F2HyQtYbuUMOI+oy+uAPADp99gY9TSGs6WNCTHizXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkIxgasmLXn92LXMedILIBS3S+dP3oIf1rFzNwgg5PM=;
 b=RCvA5YTBs7By3ZZTHahz4cXXTrxYNreDDueebKrcCw0W1WTeA7MVpFPHjs6WWNVOTRYvPkexq/nqDkAw5ct6COKHI/Wf6YNyVrZGwIh8So9QXa4xGEiZFzKxQB5GmEqrEq9eBie17VJf5YZKa8Q13xKdYbDNGSFampj40Hkmlz5RwNFzm11LqRJpuN+X3Y7CRJKfku+0BC6BMNo/8V8nOM/zPXS1wRS8GBWB7NSTtCTtN2n3HC9YpJREpmDwNpXsmkylPA6+xi/7JvltAPeONbbuQnme7ltPXinJOlnO36WLcs7WTtS5PtC/1ua4S8sMhPWpiANIH62q6A90IUlJRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22)
 by GVXPR04MB10475.eurprd04.prod.outlook.com (2603:10a6:150:1ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 09:53:55 +0000
Received: from AM9PR04MB8147.eurprd04.prod.outlook.com
 ([fe80::eace:e980:28a4:ef8a]) by AM9PR04MB8147.eurprd04.prod.outlook.com
 ([fe80::eace:e980:28a4:ef8a%6]) with mapi id 15.20.8964.019; Tue, 22 Jul 2025
 09:53:55 +0000
Message-ID: <dddcad1a-1f0a-4ecc-8093-8a75ec24d2ec@nxp.com>
Date: Tue, 22 Jul 2025 11:53:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/2] Add standard exposure and gain controls for multiple
 captures
To: Mirela Rabulea <mirela.rabulea@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, ribalda@chromium.org, jai.luthra@ideasonboard.com,
 laurentiu.palcu@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com, celine.laurencin@nxp.com
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250715235952.GE19299@pendragon.ideasonboard.com>
 <20250716001205.GG19299@pendragon.ideasonboard.com>
 <38e022d0-cc8f-4df2-8a81-69513c854035@nxp.com>
Content-Language: en-US
From: Julien Vuillaumier <julien.vuillaumier@nxp.com>
In-Reply-To: <38e022d0-cc8f-4df2-8a81-69513c854035@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::20) To AM9PR04MB8147.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e0::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8147:EE_|GVXPR04MB10475:EE_
X-MS-Office365-Filtering-Correlation-Id: a32d5a5f-63bd-45a5-8f96-08ddc905abe2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|19092799006;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Y0JORDFYUGozZE00WEpKOWFmNHR5aTZlekF3VlM2SVJrcWFhNWZjTWZFSDQw?=
 =?utf-8?B?c3BjWU1sR0p3eEM0cEoxU3FsNFVTSnEwNUhEYXFYRXBrTUIyQ2xNMFVyNnAv?=
 =?utf-8?B?MGM0aVEvUGlONkhWdWthdTcxK251YWE1T3JmeS9rTVVEV2ExZ3BLTUU3bThr?=
 =?utf-8?B?dG1iU3AraE5KY3I2cjNXcDhzdFMyZjFLVFBmalNNZmtqMGh6Z1M3LzZra3cx?=
 =?utf-8?B?QVFaU0pNY3lZVWRZdFVNTUk5azRYMjRxeHk0TFBxQkhGdFJTc3RhQ1JvVHpj?=
 =?utf-8?B?eXpKWlVzcDNxN3RnMU84U2tTNkI3dnN6MitTeVM2amRZbnJac1djMUlmVmFU?=
 =?utf-8?B?ajZsVjM2TWNGMFNJbkw1TWp4dFpsc3I4cTJVVmRLTThSaDV6Nm5sUmtwRmRI?=
 =?utf-8?B?Tm5zQk9jQmgvSFdPYmZxYnRYRlh6bmtDYU5zNzhFVDdLczgwWE04aUYxaVpJ?=
 =?utf-8?B?cHV1andIa3gvdE9raXZpaUt1L2tGWUQxOHlsUnRTUlloWnNacEVSWTZXRjhN?=
 =?utf-8?B?dzdiaWZUZnJwTlM3VTQ1NXRGc1JJU2p3c1FtNHUvV3FjN0dLenorOVU2Y0hJ?=
 =?utf-8?B?Zkx3a3I4ZWlrREFPWWVIYnE2Y0JHc2MxTXNPMXRCVnd2eUtoMDZVblN6N2Q2?=
 =?utf-8?B?aXpUNGxVSW82T1ZYcnNKME9QcTdaWm9Yd1Vwb1lycmREd3JrZWpwMzROS0NO?=
 =?utf-8?B?dndhbDRKK1BnTXh3bUNLcGFKNlFMK1NLRVYrU0g1UTBrSGowQXVhOFJWM2F5?=
 =?utf-8?B?S3YwZTFrN0cyakozNjVYREVHUVpJRE5BNmI4NlJWNkc1NXQyeW5wV2VSckxD?=
 =?utf-8?B?cDdoV1IvUVBhQVNUNnhPYVI2NWZNOURlanNrSnN2a1ZQSFB3QjB1dmdKV1VX?=
 =?utf-8?B?d1BySDlZeUpzMGxqUnd4WVFNVy9ZcmRPakd2NENzeG1IRVlLdHFjeldBZVY0?=
 =?utf-8?B?bm1XNUNPTTBjYmczSnphbTRISTVtZmd5R3MzV0U2LzVBY05TMUdZKzRHTW1H?=
 =?utf-8?B?Z05VdndNd2hFK3RzN25uWEpTKzA0bHBlSFRhbXB0VWwvY1ByTmtYb0RUZG1a?=
 =?utf-8?B?M2xSMmxEZ0VsaFhtMWVjaFpVZytFUHovZXpiTlJraFBtZW1PemVNRTBTWXB6?=
 =?utf-8?B?bE9HM056U2F5Ym1oOVcxbVg0YTA4TnVqOWk3U3NLZC93ZkMrWEg4VmJHRUxK?=
 =?utf-8?B?K1JsVzRkekZvUzI4T0dhZ2h2cjVaNmd4NXpaeERNajBlRlk5b0E5aGNaU3ZE?=
 =?utf-8?B?ekFEQ2s2RnJPWTQ4SDBETUhWNUcrL0FtTzd6QTl4V0xqMGZsbTB1RDI0WjJ5?=
 =?utf-8?B?Q25jemJZZkVpY2NNejJIWE43OXRpeFErbmR6c2h6MVRzRmg1b1J5YUtlVC9n?=
 =?utf-8?B?RFBhRCsvbDFTeHZRblNoby96UGhVUW4zRzBvR2JpY0lvSGMzdVFnc3NyRTBD?=
 =?utf-8?B?aEdRekxVUE10eEJ6RXIvckdUbzMzZXFndnJEUGJSSnBLQlgzNlB6Zlc4WGJs?=
 =?utf-8?B?WVErblA5b0tBUmtOZlNReUI3aTA2bDZPTVM2SmJlVERuTzZCWWU0NHhmVkhk?=
 =?utf-8?B?NnM4WHM5bGRSZ1pKQ2kwU0xFN1ZPakVGeEI0NjBaaWRMZFFYeVZvbmtudkdV?=
 =?utf-8?B?N0U4SjZOU0lhZVpFVVo1UThER0NiK1JDZ1IvNEhySWF3a1c0bktQTnd4MVlh?=
 =?utf-8?B?ODRJcUNTNDkzSExBNVIzMWRib3hBRFFUR3NrRnNHV2RILzYxYzJodU0xb20z?=
 =?utf-8?B?M0NrbEw4d29scE1sU1J1eGlVWmxaODZBWXQrQW0rNFBLbjRPd1N2OGxQaTBV?=
 =?utf-8?B?OUtHNTZNSTFTK1FSL0kyeDBSdUx2Um50THVzdFk2R0xTU1d6dWkyT21XcmN5?=
 =?utf-8?B?eDVadEczVHQ5RVNLblYxQVIwbWZqSGtJUS9HcDZTL0xUb0NWOTJlOG9DZkN2?=
 =?utf-8?Q?Ia+sMgOxwOQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NENCVys0ZnovNngxNWxTOG9KUGhwaFE4cytWM0EzU2FEOVVlQUpWT0lYNUcy?=
 =?utf-8?B?NitWQjRPR2dsUTlXWVNnREl1ZnRqeHkrY0NVOWltSTJpaDJzVStrMU5pZTRv?=
 =?utf-8?B?ejhiYXlRTzZpNTREZ0MySktxeFFrVHRybjJPTS9TYjFVck1pSkNGUjZJTmpa?=
 =?utf-8?B?TGM5WlBqc1FRWVc3S05OME84OXZLY2x2bHVQTTJrVGZTNFlmZC96NWVJQnRY?=
 =?utf-8?B?Vlo3dXlsMWtjTXhzZk9VRmNuU1VWWWw5a1EyR3pJMUVOdGZRS1lwWm1sUTln?=
 =?utf-8?B?SERwNVU4ejdRV0hRWjNYYjZNejY2NHFlTWsxRU5zZWE0UFBFOS9ZQWdxNDk0?=
 =?utf-8?B?VzBGMmY5enBFbEpKbnl3bUNuUUlmR3Zma2lIY251aHVnVy95eWdlNXFBZDU1?=
 =?utf-8?B?YytqeHVadFFiUnEvcmcveWZTd2cvbHp0aDA5aFR6TGhTUU9rcWxpVlI3WHVF?=
 =?utf-8?B?ampBL1gva1hlcjhmUEk2NU5HbUVCTno2SGZZRnN2elprN1JZN0I4WTlBRHFT?=
 =?utf-8?B?akJzTUx1QkQrakxWLzNrbVVPbjNmeUlNYTdMWEw5K2JrSVE0dm5qYkJCd1p2?=
 =?utf-8?B?MjFrWFRaNWVCRzIzTlpZdjRLZmUvNS9aTU10U1U2Wko5aERRZ2xHT3NYbmxp?=
 =?utf-8?B?c1ZRbUV1NWJQZ2d6WGEwRnBNamFyOEJzM2cxN3B5b1kzaW9FYnZ4Wjh1eGR3?=
 =?utf-8?B?dXFVUzdkZmFsVWdvbGNUKzdPemR1eWVKUHQ1ZVljRnNxWGkvald0bXRTVFVs?=
 =?utf-8?B?YmhjdkdLc0FqTWhVajllSlREcDh1a1NGQzhoeTNSYnIxL3RQTmFnTHFMWEtE?=
 =?utf-8?B?NXc0c3VZa1BCUFIyZjBVOFYrdi9oZEhmUU5SaFZyRjBkTkN2RDJqTk1iS2lD?=
 =?utf-8?B?TUJOSFpad2xvR21EQkN5MmpydkxNekp4NVpneHBaTnUva0g3dm9UbGdtcVcv?=
 =?utf-8?B?eTJwdVhsZWwzOFhhU29QL2paclNKbU5Lb2dnM3RWSzBZc0tycnB0N2k2bDhL?=
 =?utf-8?B?UXcxMEtSYmJZWUZYVTZTdlBoWWNpR2I2NkY5YnVQakxoY2EyUlEzTkZkdHdU?=
 =?utf-8?B?NDRESnYzckVVSU12YW5obFN4dTFxbS9JODhpSzJhYnMyamp5S0pBWERrUitJ?=
 =?utf-8?B?L1Y3OEQ2cDc3bnh5VjZNLzFxQ3NlRU5yUjhyNS9xMDU4bVBrUFZORGNReGRI?=
 =?utf-8?B?c1F6Z0Q4aTVldjFDTEVLL09UWVgwNkRlbXZOZ2U1cjB2eHRKanJ5RTFpYTdN?=
 =?utf-8?B?K1dDUzREdjMxZ2V5aCtHbzNIZkRhb0dHVGFlTzJvVjhwc1k5YUpPOTFTTVBC?=
 =?utf-8?B?bW9Ca2JUSmR3S2c5Tk8yNVZucEpiVWxvZnFxYlVJSVFjS0xpQzdSSk9NYnFP?=
 =?utf-8?B?WXpyeGNDSjA2Z1pjdjM0SDRqSTZ4TGFFNkUvdC8rZGhvaktoRzBnSU54VVAr?=
 =?utf-8?B?Z2xUV1lMaU4wTkJCVEd0ZzlUQkxRTzVzV0RrQ1UvRG1Kb09TVFU5WjA4SStN?=
 =?utf-8?B?ZTZNY0VTZzNUY1JsdVNiK1A1ZzhWTVkrNTVJWDBJdWkvdXRSQlBINmRSbWx5?=
 =?utf-8?B?c3NNeGNQZ1JaSFF4aDVNVnhaWFZPdG9KMitoR1JIZnRpbUZVS1pZbXZEN2Iy?=
 =?utf-8?B?aDUvcXRVNHJZcWYxMDEwZ0MxZEZsTXkrcGxORTVtMTljWWJPOFc3VC8vZE9W?=
 =?utf-8?B?bTFQczN6K0lUOTQya2YxZ2lUZ1RGL2UzZmxrbGs0TmlvZy9nQUNVY0cvNi9z?=
 =?utf-8?B?SDFLLzV1QWR1MG5vd1d6Tk9tREFEbDYrU0I5ZUVFNjArVXhqa0p0OUR3K1hX?=
 =?utf-8?B?NnA2ZW5WckNFQzNncHF1b3ZOS3NHck5JamFaUTBSem9CZFdCL093VFo5RThn?=
 =?utf-8?B?TnZ2aGRqd2puUXJ5a2ZySzFEQ3VJRDhKZmgrOFJqU084NXY1SVRwb0laSzg5?=
 =?utf-8?B?MjBkK0VhNGdWRGtuRHRTYWp2RkhFdEFYdUJyc2liZU91dCtCajNFMGpTbzhE?=
 =?utf-8?B?b003MDNUVWk2VG5MdU45ck1XdGJIa3M1YjloUWZsNzZIdTR0OVVSdjZyTHk4?=
 =?utf-8?B?UVQ3WHBmbWdxUHRoV3VyYVdIRE5rMVBTdUpyYjkxVVRraFZEMWQ0UFVLR3ZZ?=
 =?utf-8?B?dmRqTkRjWFV3MHRmcFQxT2svZmdDbmVBTXBNR3oyci83aDdabUcydEFQNDdB?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32d5a5f-63bd-45a5-8f96-08ddc905abe2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 09:53:55.3645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VYEoOrTK4vxxrlLWHnGCChv/yTLu0ZV1shK25Q1pqfNTuD199+0GXX7YkJEW4aAOGSO7AirlBCj/OI0w60Zeq+7umazoEZ6t4SUf0WdC1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10475

Hi Mirela,

On 20/07/2025 20:56, Mirela Rabulea wrote:
> Hi Laurent,
> 
> On 7/16/25 03:12, Laurent Pinchart wrote:
>>
>>
>> On Wed, Jul 16, 2025 at 02:59:54AM +0300, Laurent Pinchart wrote:
>>> On Fri, Jul 11, 2025 at 01:05:42AM +0300, Mirela Rabulea wrote:
>>>> Add new standard controls as U32 arrays, for sensors with multiple
>>>> captures: V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI and
>>>> V4L2_CID_DGAIN_MULTI. These will be particularly useful for sensors
>>>> that have multiple captures, but the HDR merge is done inside the 
>>>> sensor,
>>>> in the end exposing a single stream, but still requiring AEC control
>>>> for all captures.
>>>
>>> It's also useful for sensors supporting DOL or DCG with HDR merge being
>>> performed outside of the sensor.
>>
>> Regarless of where HDR merge is implemented, we will also need controls
>> to select the HDR mode. We have V4L2_CID_HDR_SENSOR_MODE, which doesn't
>> standardize the values, and that's not good enough. At least for DOL and
>> DCG with HDR merge implemented outside of the sensor, we need to
>> standardize the modes.
>>
>> Can you tell which sensor(s) you're working with ?
> 
> We are working mostly with these 3:
> Omnivision's os08a20 (2 exposures staggered hdr, each exposure on a 
> separate virtual channel, there are also other hdr modes which we do not 
> use)
> Omnivision ox05b1s (RGB-Ir with context switching based on group holds, 
> 1 context optimized for RGB, the other context optimized for Ir, each 
> context on a different virtual channel)
> Omnivision ox03c10 (4 exposures, hdr merge in sensor).
> 
>>
>>>> All controls are in the same class, so they could all be set
>>>> atomically via VIDIOC_S_EXT_CTRLS, this could turn out to be
>>>> useful in case of sensors with context switching.
>>>
>>> Agreed, we should be able to set them all. Are we still unable to set
>>> controls from multiple classes atomatically ? I thought that limitation
>>> has been lifted.
> 
> 
> Maybe I need some background check on this, but looking at kernel tag 
> next-20250718, this comment still lies in the documentation:
> "These ioctls allow the caller to get or set multiple controls
> atomically. Control IDs are grouped into control classes (see
> :ref:`ctrl-class`) and all controls in the control array must belong
> to the same control class."
> 
> Maybe it needs to be updated, or not...since there is also this check in 
> check_ext_ctrls():
>      /* Check that all controls are from the same control class. */
>      for (i = 0; i < c->count; i++) {
>          if (V4L2_CTRL_ID2WHICH(c->controls[i].id) != c->which) {
>              c->error_idx = ioctl == VIDIOC_TRY_EXT_CTRLS ? i :
>                                        c->count;
>              return false;
>          }
>      }
> 
> There is also another inconvenient, the VIDIOC_S_EXT_CTRLS does not 
> reach the v4l2 subdevice driver, what we get in the sensor driver is a 
> set of .s_ctrl calls. I don't know about other sensors, but for the 
> Omivision sensors which I am familiar with, the group holds feature 
> could be used to get multiple registers to be applied atomically in the 
> same frame, but the sensor driver would need to know when to start and 
> when to end filling the group hold with the desired registers. If there 
> is some similar feature in other sensors, I think the VIDIOC_S_EXT_CTRLS 
> should have a corresponding v4l2-subdev operation, so that it can be 
> implemented in the sensor subdevice driver. This would probably require 
> some changes in the v4l2 core, as currently the subdev_do_ioctl() 
> function does not let the VIDIOC_S_EXT_CTRLS go to the subdevice.
> 
> Laurent, Hans, any thoughts on this?
> 
> 
>>>
>>>> Each element of the array will hold an u32 value (exposure or gain)
>>>> for one capture. The size of the array is up to the sensor driver which
>>>> will implement the controls and initialize them via 
>>>> v4l2_ctrl_new_custom().
>>>> With this approach, the user-space will have to set valid values
>>>> for all the captures represented in the array.
>>>
>>> I'll comment on the controls themselves in patch 2/2.
>>>
>>>> The v4l2-core only supports one scalar min/max/step value for the
>>>> entire array, and each element is validated and adjusted to be within
>>>> these bounds in v4l2_ctrl_type_op_validate(). The significance for the
>>>> maximum value for the exposure control could be "the max value for the
>>>> long exposure" or "the max value for the sum of all exposures". If none
>>>> of these is ok, the sensor driver can adjust the values as supported 
>>>> and
>>>> the user space can use the TRY operation to query the sensor for the
>>>> minimum or maximum values.
>>>
>>> Hmmmm... I wonder if we would need the ability to report different
>>> limits for different array elements. There may be over-engineering
>>> though, my experience with libcamera is that userspace really needs
>>> detailed information about those controls, and attempting to convey the
>>> precise information through the kernel-userspace API is bound to fail.
>>> That's why we implement a sensor database in libcamera, with information
>>> about how to convert control values to real gain and exposure time.
>>> Exposing (close to) raw register values and letting userspace handle the
>>> rest may be better.
> 
> Julien, any thoughts on this?


Reporting min/max value per array element could have made sense for some 
controls. For instance we have a HDR sensor whose long capture analog 
gain range is different from the shorter captures gain. Conversely, it 
may not work well for the multi-capture exposure control where the 
constraint can be more about the sum of the exposures for each capture 
rather than the individual exposure values. In that case, exposing 
min/max values per array element does not really help the user space.

Thus, having the user space to have the necessary insight into each 
sensor specifics for its AEC control seems to be the versatile option.

> 
> If we don't need to report different limits for different array 
> elements, we are fine, just we need to document better what those limits 
> stand for in case of arrays.
> 
>>>
>>>> Mirela Rabulea (2):
>>>>    LF-15161-6: media: Add exposure and gain controls for multiple
>>>>      captures
>>>>    LF-15161-7: Documentation: media: Describe exposure and gain 
>>>> controls
>>>>      for multiple captures
>>>
>>> Did you forget to remove the LF-* identifiers ? :-)
> 
> Yes, at least in the cover-letter, my bad :(
> 
> Thanks for feedback.
> 
> Regards,
> Mirela
>>>
>>>>
>>>>   .../media/v4l/ext-ctrls-image-source.rst             | 12 
>>>> ++++++++++++
>>>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c            |  8 ++++++++
>>>>   include/uapi/linux/v4l2-controls.h                   |  3 +++
>>>>   3 files changed, 23 insertions(+)
>>
>> -- 
>> Regards,
>>
>> Laurent Pinchart
> 

Thanks,
Julien


