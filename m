Return-Path: <linux-media+bounces-47678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 14309C83378
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 04:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 082F74E5CB2
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 03:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A0022172C;
	Tue, 25 Nov 2025 03:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="RVnHnUsG"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023115.outbound.protection.outlook.com [40.107.44.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6433E33EC;
	Tue, 25 Nov 2025 03:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764041089; cv=fail; b=XzqbkodwoYEK0pwyyaj6U4hWzbBQqKpQamvPpmmZTRY/IBo5fn2Oo0WfwMATgqlBJHMd60uJ/ADiP5g9mQYYkkUuEcq025SCOcnd3A24OmYqN/5MvzIoDGAZBKclooMBN0rgmAYmjKdgWPf95bUJ7GFy8b8v8GXRtxOVup0s8fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764041089; c=relaxed/simple;
	bh=kPvQWA524WFv2jRYTwVXf/fn55xv2q6ZaMi20M7WwAs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TY5XErqhW+AJ9AhHOoYTANbN5Np86JeaIu5wH+tZ4VTRf3FZjBzLPfweYKwuDTU/bPenqHVzeVPjhhJME6zBgQBE14GRISxHs4GS0ZeIuuaQdATaXiUnpGigUks+Gl2J/CvVQGWz6ZqfAtduAGtYvloZgzXL08d2Lcc2W/g2Zsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=RVnHnUsG; arc=fail smtp.client-ip=40.107.44.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYRtLmOX9dNqQvs48o1Q4mvDMy07iXk4i90hN1uFDi3cGzjq4cUDqpf52f5ZK2fQGilG7gbFC1RYjCTh3XWb/wPt4I6eWGAUon+LdY9WPuqbhgg/0kz7tSEEgkqFz7NfcWElXrda/1YFXEvQ25OuIQMUGzcH3MuKG3pOUDR/LP0VObo+FrF43ZfFn+VyX3j7WZAzOJq3jWjMA0l+3dmTkMIShwPHqts5q7qMAyHIaE0WOG7kEHljS8uSUzzRqOIeNSHUxD3gjH48HXFA0drYrtHIfhsuTpRxHjNiLTiiRxTUCrDjzgBx9E/V3BLd1/Fgi6D879X40QRuJP0+dFJmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKCTCZkiX8phdqrv7PrHXmC4KFfhkbpevXh13Jk50z8=;
 b=S0s5z18XEQo+ZVEr4hAEayUghVOuo/KAqbjFldTmizJx8kn3HrSNMs5sKkNKhTHeY+rXMsaVl+Bd0yOQ13TP4IwF2pHkeyA7Q61RVzpZk3pQx80oJPVhGrA1A/l+TagTbKkEuVTfHO47dZV1XI2YYZ0ilo6YestLc9wnKvrfIU/UvBFMy+8yI+3R0w+MEK4uWXn5hFLkN3btDpIM1sPVEcAv/KK/JuxobdGlBrrNEXaasf9z3OCyaDje61CgwmEbuKyapsHXkH0bzPEZXHSS1KJice+Hjbba1k21Tr9VRBX+xgksPDp9tIjpRb3+/2Bq2BvLi3cP90RHGOXIvOd96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKCTCZkiX8phdqrv7PrHXmC4KFfhkbpevXh13Jk50z8=;
 b=RVnHnUsG6y90+xP8B09Bgw2QcVM5yBWitukvNgYlp4mJwVJgQ3Wc+VVaFDWSXsFPosXCtZLrXZ+b8HY28ggXojSvjlOo8KxAG99ERFysmtcV34K+uKYPloxr/iMeYqbCE7tpZwHU7mJLr0CJX+Lidk+h4oKfA88GQQBT//fZYG+t5mFO5TWPTq4q2U+zxV7fep9cYiF/L3fZVGZ/ueSb8QqqhNpH8UClLLM46iRP/tRQpjivTgTAkJZKFDtwpq0s3bjvZoqYDpvjykxkb9IdLwlYIHSYkMWCpYUDVBdSUqWxEr4VfA8UKqiHsSgWWPaWbGGxSJ8EVw1hpTmRiWw6qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by OSQPR03MB8528.apcprd03.prod.outlook.com (2603:1096:604:27c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 03:24:43 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 03:24:42 +0000
Message-ID: <5faeb411-91d0-42e2-9bf8-3051045ff42c@amlogic.com>
Date: Tue, 25 Nov 2025 11:24:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] Add Amlogic stateless H.264 video decoder for
 S4
To: Rob Herring <robh@kernel.org>
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
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <176399402192.138936.11233579649489245455.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0088.apcprd02.prod.outlook.com
 (2603:1096:4:90::28) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|OSQPR03MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: 64cfc41d-ed93-4d4b-0ff5-08de2bd22c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cC9jS2NYOE1OR0JsS3pjVklNOHlhZHdiTHVrYTZlVHZqY0R6R25UVHAxWVp2?=
 =?utf-8?B?NEJ2MGNjaHZSWmVENWtqYy8wZ0pPUkM0NUoxNG1kQkVpOEVXaU4rNkZJTmtt?=
 =?utf-8?B?UUpmNEFMdU5UaVlST29XZndmMEFNenp5eTExeWRQSjhiNUtaSWRUUmtJSmY4?=
 =?utf-8?B?cmRCWSt5dG1sYm5VTWxtaVdkNnZnbFRQSXYyZUxKTEplZFNBNThrL2E0RWI1?=
 =?utf-8?B?dzNWTjhHSU9jRzBndnQyYlN2SDRSQ0F1N0JWT2x1NlYrM0NwcmthT24vU1Z3?=
 =?utf-8?B?OEllTDBNTis0MTJEczN1a29mdHpUbkR5SHRqaThFaTBZaFQwTGhRelRKRzRO?=
 =?utf-8?B?dGtydm5KdXU4dGVGT08rQk5ra3UwWEYrZTFkQ2dva0lmdTFod2QzRUhKN1Vr?=
 =?utf-8?B?ZFZvN0poc2dzc0lMaWZTaXV2dlVaNm51dVZsS3JQR25ETE0rMkFHNmgyQUdl?=
 =?utf-8?B?YTMrS3IzWmNsVDZ4MlR4TE9TbWFWRDlzNnpib1VsSlNrZVF2MTAxSGd1V0pn?=
 =?utf-8?B?TzNaOFB0L3d2Q3p0Zkt5dzFBOS9Gb25nbTE5YUFxWjJVdkE5VmliT3pvSEJK?=
 =?utf-8?B?K1VaSStLc2RjYVlaN3M3VGRTRDRMVDFSdGxIQkUwb2xnSUViaEc3eG5zN2oz?=
 =?utf-8?B?UjNPanhMejJKeUYrSExFdFUxWVJQdzFiMFBkUWpmYTR2OGFXdnk0cStKU2gw?=
 =?utf-8?B?dnNUUGw2anQ2WkxhSGxES3E4RFJ3ZjlUQ0d5OHcwVUs4UTZDWG8rbVhxcVMr?=
 =?utf-8?B?V3psU0pvbS80MEtLeHcvZ2JEN1oxcmlCNjQ5aXIvdUFNOXZJTGsyMmJoZita?=
 =?utf-8?B?UWhWbDZ0clVLU1dEMGJsYXgrdFQreTA1RXI0bWd0L3pEWXI5OWdJdWNmbVVR?=
 =?utf-8?B?VWl2cWs4Ukd4VnMzSDVINFdXckpQa3VjNFoyNVJNZ2hTUzBSUmttV2oxUm8v?=
 =?utf-8?B?MHdZRVpmN3FqMCtYQWExT09VNnFrRmMvT1FocG0yb0xHbXRrZU5HWmJYN0Nh?=
 =?utf-8?B?SWh6c1N3dmdjaHBTaUtnWUREc2N5Rmozbm5BbTZ6L3R6SHVaMGpkbUJaT29H?=
 =?utf-8?B?ZEp1Q2haME1FYzJzV2RWaEFMSklNc0xCWHpQaUhVWHNBMDhEOVVIZWp3ODQr?=
 =?utf-8?B?aUszM1I2NlFFdnZZWEcySUFDeXFCWnNDc1NWbDBZeHFua3psTDBUb251eE0r?=
 =?utf-8?B?N0NmWHhoSitSYzlhSlJSYmtoZ3hFRHUvNnU0Q1AyRGduVTdNUDdmS1JmQ1Rk?=
 =?utf-8?B?MGREWkprZmFzeFA4eVMxOGZpcUdLRDdDb2IwUVhyVzl3aVZMQXRWTWJXME82?=
 =?utf-8?B?aXhyMVZyOFB6Nnp0R3haSU13RlRLaUhPZ2FCb0VRN2piNnZ0bjVLQ3FKZ2xW?=
 =?utf-8?B?TGl1SFRRdll3MHYzWVliVlEyUStHc3VCMHo5eEl3TDNCMDBGTVVONmI5MzJp?=
 =?utf-8?B?MnVtR3UxWmV0RHlYSjE1NDFnZDZMUEd3K2FwVTFLR3hiREVpUjZMV01JK09X?=
 =?utf-8?B?N2src05vdW1FclBubWNWWWZhWG1ZRmZsSVgybXVSc1pFbFVpemhueXJLcTJ1?=
 =?utf-8?B?azJRc1FDZHkyOWora0lNOXl4eFlBRmFhbG9veTRvWlowNGNZQ2lnT09vVjNu?=
 =?utf-8?B?aW5acVovTGd3RFI5bHdyMGd2L0h5aXIrVmxWUkdtWmZpRnQ2UHN3UTE0Wkla?=
 =?utf-8?B?SktieUdpaWk0V1NSaG9QWG01VnZaYzNZYlBUWTZqb1pSYlVHVGtPd1JaQlNo?=
 =?utf-8?B?SkRSMk1NM2p6SnF4Rlo0WDhlemtjcWhLSHZPVkJYemVZT083d0tyZUlqZWNG?=
 =?utf-8?B?OEpkSUF0Tzhsd25ZK0ZYSytLQUQ1SURCUDBOQTBDWUZTSHFUL21BQTZuTWsx?=
 =?utf-8?B?NzJKQ1M2bFBTNDZzWDFOVWY3eFlZeDlwSC9Kc1dCakdoRW1YcXZrZ1c1c2Rz?=
 =?utf-8?Q?jwuMJAhdIxE15PeJZZ1EUjtyUqSQ8B2D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFp3ajVsNU9WRnpjUnlmcE9kSVkrVVk2N3dmMy9TZ2xBazkvbllDSmlTYmEy?=
 =?utf-8?B?VjBpUS9JQXBVSjBEakdJMXFyUTVGeHV6WklIMldPQk9PTTd3SWIvbXo0VTIw?=
 =?utf-8?B?ZXJ0T1g4bkhXTVhCald0eVBIZk13R0tnRDI1Ull1bjJSZ21xbFlXQW1DMEkw?=
 =?utf-8?B?MkhycE9qSjZYZnVoN2pkNnlPVzArVkNwSUszOTQ4eG5WdWtFVnJkVG9VZHhG?=
 =?utf-8?B?TlNFMHo1dkk4MXJ6VUF5cVQ1alVneXRXcll2RWhrRWNKb0ZtOWI2ZDdqUnpi?=
 =?utf-8?B?VFIyRTdKMjJ5MXYyc05EdWVWdEJsbUpTL0U4d05SUFJteGdTS0lCdU5xTGEx?=
 =?utf-8?B?akQyZTBPVzdxN0NoMThPTnl6TS9semY2ODJDMkJTa0Y3eVo0Y2dYd01VS1pk?=
 =?utf-8?B?ekwxeHE4VlFmdWR4S05kaXYzK3AvMWNDRCt5K05KMzZFeUE3YnUrRU81czZU?=
 =?utf-8?B?Y21kZ0dUYS9qTWZaOVFDQ3BxWmZhdVhYQ0xIeHpZRVdJK0xjYWhjRHVreEta?=
 =?utf-8?B?Tkp0MjdQcEdFMUNsMUhLU0VVa0NNTTY0TCtGNzVmck9uOTJ3eUVJN2hqZTZZ?=
 =?utf-8?B?NGFnN283Q280eHFvTG5NMERpK0pMb0dEeURYWW5EYWNUMEpadHd5OUltSTZB?=
 =?utf-8?B?bk9VaHoxNWlsYmtJdDJWMXRiQUdIVXdUaHRVQ1ZCVU9reTJvT3RvMEJPcVVL?=
 =?utf-8?B?dFpDUGNHOEpvRHFOaisxWlVHZ2x4eU1lcWQ0S2IwRDk4dlE1d1YwSGx1UVhQ?=
 =?utf-8?B?SzZNTDF4dFE2b3pQY1l3dlQ4YVMrbE9LbE5zMmlzSXZzZ1dLNHZtVnYyZ2RY?=
 =?utf-8?B?dENRcXNuOHZTK3cyNVVKUDVwRkFINGVXci9BSktWNk1TQlFRcjkrNVA0NGFv?=
 =?utf-8?B?RGRucHhKcmhHYnp4YlpRT05VT3VYZzA0b0NhTEczZE5sK0lrMHZPYlNoTjV2?=
 =?utf-8?B?ZGs3WDU4ZmZaa29LVmE3ZURxbnN3RXp5N0Q1MWMrd2pBd0lTRnBpRmkyajRp?=
 =?utf-8?B?d3c0ZVRwY3c3WXU3cFkvMDhKYnM5R20zQTQzRnVNZXBDYlhFV3VPSGxaeHBo?=
 =?utf-8?B?YXdtR1p1RWIrYzFTWmZmNmNvMy9LQVU5VTJ0SzBaYzBiVlZZN2JyRnI1bnZs?=
 =?utf-8?B?b1FicHZUREtmQS9OMmw3NzYzZjg1WWdsczYreFdYZHFHQys1Qm5nalBTdGhZ?=
 =?utf-8?B?SnNRY1R1WVlDNGJ4dy9BQkZzN1RlWEFYRTdEM2t0a0VTempEbSt6Q0hvaU1X?=
 =?utf-8?B?VjFGZXpJaVhybTU3amhHU3BiUk1yV3M1UUdoYXA4WEJsdWdtVjlLSXAzb1dC?=
 =?utf-8?B?ckw1SnB6Z0RFM0JmbVFEUjZJREZUeTU4UjRhQThKWlkweFBGN09vUUZUTko2?=
 =?utf-8?B?S2FLTWZjWjZVeDRBdUEralFMNDduMTJRdVZXblpEQzBTZWt0cVgxVUJVaGpR?=
 =?utf-8?B?dWFmK0QvQlFjaUFPeGtlZnVVem1RKythSGt0ZGlhbVY5VlE3aVdYeHB0V0E2?=
 =?utf-8?B?UlIzdUhZN3BqZStwQm1HdTR1WkhLVkI4V2JJb1htNlQrY2k1ZEtjTlppeXNx?=
 =?utf-8?B?YitraUZsVER0V3JGOU9SNzVuWkhhaFhzRWdtSnZ6SmN5ZHhtMTJJUUx6S3RH?=
 =?utf-8?B?V3hPdEpUWDhmb1Vrc2NnajhEVkVEUUVvWXd4SmZUekZmQWdyTTQ2bGFpWjBm?=
 =?utf-8?B?SytQRGtMOXFDZEg0bmtFSGlVMXBvaFRhZHhjYm5kSkN5R3dxTGE4U1ZCbFFR?=
 =?utf-8?B?M1dabXRrYklaQ0hrM3dzV2V6Q2RBWll6SGRCTFlTdG5Vb3c2TlRvQnI0ODhU?=
 =?utf-8?B?ZXpnOExGZEFYK3REYXpFQnpxUy9nbVlYclR2ZGZkNFRCOTJFSzFsN0RabjZL?=
 =?utf-8?B?djg0WFlGblhocTFhelRtSW1UeGdicUhyMWUvVjFjeTRoSnlycVJzWFBVc0Vr?=
 =?utf-8?B?eDQ4cmFCaG8zQVRwSHNSamp1b08vL3B6dTk1Z0tpSGFRdnFuMy93Rzhia1M5?=
 =?utf-8?B?S2UreTdhZ2F3TXV6aXV3OVV4NVI0Z1JGZ1N4djdUUngwT0txR1pCSitoM3Z5?=
 =?utf-8?B?bTQ4Q0dKVnZaUzdCblo1L2dlSGVwOGVmU25ZQy93NFZMaXRZdnJKU01vYWNw?=
 =?utf-8?B?VVFTUTF5djFxMUtyTlNINS9tOVZFN3JMbUR2cHlPTW1ieU5VRkxSN1RRTHBm?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cfc41d-ed93-4d4b-0ff5-08de2bd22c27
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 03:24:42.3987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd2tvXw8Ggp2h4fUULSE0s0gSJHkoVZHRZ3Euzwg267i0bYytZB3RvoNAOD37mk4ogLwO398uDLZCE0ED8QS9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8528

Hi Rob,

在 2025/11/24 22:28, Rob Herring 写道:
> [ EXTERNAL EMAIL ]
>
> On Mon, 24 Nov 2025 11:32:16 +0800, Zhentao Guo wrote:
>> Introduce initial driver support for Amlogic's new video acceleration
>> hardware architecture, designed for video stream decoding.
>>
>> Compared to the current Amlogic video decoder hardware architecture,
>> this new implementation eliminates the Esparser hardware component,
>> enabling direct vb2 buffer input. The driver is designed to support
>> the V4L2 M2M stateless decoder API. The initial phase includes support
>> for H.264 decoding on Amlogic S805X2 platform.
>>
>> The driver is capable of:
>> - Supporting stateless H.264 decoding up to a resolution 1920x1088(on the S805X2 platform).
>> - Supporting I/P/B frame handling.
>> - Supporting vb2 mmap and dma-buf modes.
>> - Supporting frame-based decode mode. (Note that some H.264 bitstreams require
>>    DPB reordering to generate reference lists, the stateless decoder driver
>>    cannot access reordered reference lists in this mode, requiring the driver
>>    to perform reference list reordering itself)
>> - Supporting NV12/NV21 output.
>> - Supporting Annex B start codes.
>>
>> This driver is tested with Gstreamer.
>> Example:
>> gst-launch-1.0 filesrc location=/tmp/video_640x360_mp4_hevc_450kbps_no_b.mp4 !
>> parsebin ! v4l2slh264dec ! filesink location=/tmp/output.yuv
>>
>> Retry the compliance test based on kernel 6.18-rc6:
>> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
>>
>> Compliance test for aml-vdec-drv device /dev/video0:
>>
>> Driver Info:
>>          Driver name      : aml-vdec-drv
>>          Card type        : platform:aml-vdec-drv
>>          Bus info         : platform:fe320000.video-codec
>>          Driver version   : 6.18.0
>>          Capabilities     : 0x84204000
>>                  Video Memory-to-Memory Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04204000
>>                  Video Memory-to-Memory Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>          Detected Stateless Decoder
>> Media Driver Info:
>>          Driver name      : aml-vdec-drv
>>          Model            : aml-vdec-drv
>>          Serial           :
>>          Bus info         : platform:fe320000.video-codec
>>          Media version    : 6.18.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.18.0
>> Interface Info:
>>          ID               : 0x0300000c
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000001 (1)
>>          Name             : aml_dev_drv-source
>>          Function         : V4L2 I/O
>>          Pad 0x01000002   : 0: Source
>>            Link 0x02000008: to remote pad 0x1000004 of entity 'aml_dev_drv-proc' (Video Decoder): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video0 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>          test VIDIOC_QUERYCTRL: OK
>>          test VIDIOC_G/S_CTRL: OK
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 6 Private Controls: 0
>>          Standard Compound Controls: 4 Private Compound Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK
>>          test blocking wait: OK
>>
>> Fluster test result of JVT-AVC_V1.
>> Result:
>> Ran 61/135 tests successfully
>>
>> - 52 test vectors failed due to interlaced or mbaff clips: The Amlogic stateless
>>    decoder driver only support bitstreams with frame_mbs_only_flags == 1.
>>    Test Vectors:
>>          cabac_mot_fld0_full
>>          cabac_mot_mbaff0_full
>>          cabac_mot_picaff0_full
>>          CABREF3_Sand_D
>>          CAFI1_SVA_C
>>          CAMA1_Sony_C
>>          CAMA1_TOSHIBA_B
>>          cama1_vtc_c
>>          cama2_vtc_b
>>          CAMA3_Sand_E
>>          cama3_vtc_b
>>          CAMACI3_Sony_C
>>          CAMANL1_TOSHIBA_B
>>          CAMANL2_TOSHIBA_B
>>          CAMANL3_Sand_E
>>          CAMASL3_Sony_B
>>          CAMP_MOT_MBAFF_L30
>>          CAMP_MOT_MBAFF_L31
>>          CANLMA2_Sony_C
>>          CANLMA3_Sony_C
>>          CAPA1_TOSHIBA_B
>>          CAPAMA3_Sand_F
>>          cavlc_mot_fld0_full_B
>>          cavlc_mot_mbaff0_full_B
>>          cavlc_mot_picaff0_full_B
>>          CVCANLMA2_Sony_C
>>          CVFI1_Sony_D
>>          CVFI1_SVA_C
>>          CVFI2_Sony_H
>>          CVFI2_SVA_C
>>          CVMA1_Sony_D
>>          CVMA1_TOSHIBA_B
>>          CVMANL1_TOSHIBA_B
>>          CVMANL2_TOSHIBA_B
>>          CVMAPAQP3_Sony_E
>>          CVMAQP2_Sony_G
>>          CVMAQP3_Sony_D
>>          CVMP_MOT_FLD_L30_B
>>          CVNLFI1_Sony_C
>>          CVNLFI2_Sony_H
>>          CVPA1_TOSHIBA_B
>>          FI1_Sony_E
>>          MR6_BT_B
>>          MR7_BT_B
>>          MR8_BT_B
>>          MR9_BT_B
>>          Sharp_MP_Field_1_B
>>          Sharp_MP_Field_2_B
>>          Sharp_MP_Field_3_B
>>          Sharp_MP_PAFF_1r2
>>          Sharp_MP_PAFF_2r
>>          CVMP_MOT_FRM_L31_B
>> - 3 test vectors failed due to unsupported bitstream.
>>    num_slice_group_minus1 greater than zero is not supported by the
>>    hardware.
>>    Test Vectors:
>>          FM1_BT_B
>>          FM1_FT_E
>>          FM2_SVA_C
>> - 2 test vectors failed because SP_SLICE type is not supported by the
>>    hardware.
>>    Test Vectors:
>>          SP1_BT_A
>>          sp2_bt_b
>>
>> We are working with the remain failures, these failures have the same root cause.
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>> Changes in v2:
>> - Fixed incorrect generation of the reference lists for some B-frames.
>> - Rename or get rid of some properties in DTS and dt-binding.
>> - Remove some useless code or helper functions, (eg. clk helper functions, reg I/O macros, and some superfluous print messages) replace these functions with existing ones.
>> - Replace all the printk messages with dev_err/dev_info/dev_dbg
>> - Use the helper functions from the existing meson-canvas driver.
>> - Use clk_bulk_data to map clocks from DTS.
>> - Retry the V4L2 Compliance test on 6.18-rc6, fix a newly introduced bug.
>> - Link to v1: https://lore.kernel.org/r/20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com
>>
>> ---
>> Zhentao Guo (3):
>>        media: dt-bindings: Add Amlogic V4L2 video decoder
>>        decoder: Add V4L2 stateless H.264 decoder driver
>>        arm64: dts: amlogic: Add video decoder driver support for S4 SOCs
>>
>>   .../bindings/media/amlogic,s4-vcodec-dec.yaml      |   87 +
>>   MAINTAINERS                                        |    7 +
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   27 +
>>   drivers/media/platform/amlogic/Kconfig             |    1 +
>>   drivers/media/platform/amlogic/Makefile            |    1 +
>>   drivers/media/platform/amlogic/vdec/Kconfig        |   16 +
>>   drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>>   drivers/media/platform/amlogic/vdec/TODO           |    7 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec.c     |  756 ++++++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec.h     |   31 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  239 +++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  196 ++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  596 ++++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  158 ++
>>   .../platform/amlogic/vdec/aml_vdec_platform.c      |   37 +
>>   .../platform/amlogic/vdec/aml_vdec_platform.h      |   62 +
>>   drivers/media/platform/amlogic/vdec/h264.c         | 1933 ++++++++++++++++++++
>>   drivers/media/platform/amlogic/vdec/h264.h         |  300 +++
>>   drivers/media/platform/amlogic/vdec/reg_defines.h  |  177 ++
>>   19 files changed, 4635 insertions(+)
>> ---
>> base-commit: 0c1c7a6a83feaf2cf182c52983ffe330ffb50280
>> change-id: 20251027-b4-s4-vdec-upstream-0603c1a4c84a
>>
>> Best regards,
>> --
>> Zhentao Guo <zhentao.guo@amlogic.com>
>>
>>
>>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>    pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>   Base: 0c1c7a6a83feaf2cf182c52983ffe330ffb50280 (use --merge-base to override)
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com:
>
> arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: video-codec@fe320000 (amlogic,s4-vcodec-dec): 'amlogic,canvas' does not match any of the regexes: '^pinctrl-[0-9]+$'
>          from schema $id: http://devicetree.org/schemas/media/amlogic,vcodec-dec.yaml
Yes, this is a problem. We renamed the dt-binding file and added new 
node to the dts in this patch series, but the dt-binding was not fully 
updated. We'll fix this warning in the next version.
>
>
>
>
>

