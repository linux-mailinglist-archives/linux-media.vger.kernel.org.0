Return-Path: <linux-media+bounces-23281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 277739EE484
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E4541887C1A
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95253211485;
	Thu, 12 Dec 2024 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="yHOKamR9"
X-Original-To: linux-media@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020113.outbound.protection.outlook.com [52.101.128.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E5211291;
	Thu, 12 Dec 2024 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734000733; cv=fail; b=d/W1WnPVYGEjzeuiRu40fRCHSPbDpD5e+QwXWt97SiD8UN6bcXjFgZwZMYmwz4ociQtR/VJ8zRZA2NQ4/FdWoPlrYzu8s9ZV3mPwR5N1F9RMDOCEUwr7PTVPWJA3/XtfEJvWv9WYDfdpoEpq1A+sGmhXQP9uSWo59HlnxrOhAUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734000733; c=relaxed/simple;
	bh=mOi2EWdoHXwhbnH/sgewpAGGIBUrOfoNWLy9H/Rh1OM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f/cdXFQRmQm451N/0m/XLIT0UiJwGo4rlc0noIww2AUJ4fijDNGXrqvSHie3V5U1M5rJ5sPss6LXRSuGF8Ty2LOLIp/rkBDcvU2RSa4+ZJ9FDU2Sm8+7OE/VL1sBuFcXveuIf8KOWZQQfdgKeuGPTXe2tKjhJBKNGFIIxBrpB4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=yHOKamR9; arc=fail smtp.client-ip=52.101.128.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbejvNPQu/RldPNnGHEV/h/eGiJix6dDjCc8Z6UcaMPly/YgEgQE+LqBhJkb+99GP6LMvbCbdsxPhcDbQoPwKf3sBXudhAX4QjHvTo7daiwo9A9UhqYvZGiNQJZGs5D0PE/LK6XvwDtxJhvUPnZ+gAbhaIKgdDOtrvZ5ZejcncIl7gugHTFPi72F/NSCDRS/7f6vIWon5k+pAG6tu+oKAeUCZvWjXx10UyZB2/ej+OQcbikeraenvORK5zIbMlgRmCqiAzkLhmiUf0h9nGzo+gndKnl0ym1IbGeaYCdiKhrmm+lbrUokIXskyGeFoghuhiZWjwtoe9QJS+WNhyg+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMiXqMcTtTNxNhs2K1g3YLGCgPGnN3ybdZOYHpdwfCU=;
 b=s3PDpqAHPzp3I+av57HZMWqURl5UETu8rc4eFuuF2yMaTidJFZlRN63jmST7zBZkQuB8zXjTrGKsUV7locWFSDKl5rDautlIhveiJSX+BMg5UjJRWuc/zz+CGIo9whrQa5hg6aipZX2jBpzpJrzROIs9CvxBRFAI+INP9Yr7obXbqQ3mJ2XgciKtfdKTWST2ufYzxaCHQnWCoGDjPdT9cU/5tA/i6g/g38R5Acprj84wTBW4ymZKzgBfho14wQts+XIvxKGhv7Kxz4MvZ0f/6+dZux7BErZlFkrmOBYEL+jEomtUF0mbZ4J+I3Yf91JmOG65S/YKbUhRP34gylFkcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMiXqMcTtTNxNhs2K1g3YLGCgPGnN3ybdZOYHpdwfCU=;
 b=yHOKamR9adQ4CNNO3bOQHK4xxHhwFL0GA56TvwDdrukUJkmpbIFSHpUlHs0oHr6qtBnRPivK6mjaKiwqRUm7L08gNRK5siimNZGe+iODj8aK/0V3FValeyMpyajaZ5JZMeUo90YGR542O63T2LbzUGj0svR0Yf0ZAKUA+bd3GjYI0p4/QEM7GOm4LQtpKYnW7FCCJgII00bQFd57HkEES9cYwmg/vJrst/z7a6sY80qZ+U7UycPgt3TrK5WBRXUbPvt7GnO6ddaUUYTiWn0IzaRI1bbps0PSip/710ACQ7YRtvG3dfklM70NLb8NrIQGZ3Ak/9Reny9/H+8o8RRaRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB7748.apcprd03.prod.outlook.com (2603:1096:400:427::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 10:52:07 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%6]) with mapi id 15.20.8230.010; Thu, 12 Dec 2024
 10:52:07 +0000
Message-ID: <ada3520f-157d-4ba3-a344-7db018241ca0@amlogic.com>
Date: Thu, 12 Dec 2024 18:52:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] media: platform: Add c3 mipi csi2 driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
 <20241205-c3isp-v4-2-cb1868be0105@amlogic.com>
 <5sen6lv5xg4hjdc4j2l6k5iywqpllbutoaebyln74aeuplawtu@nmpmzgwkkgih>
 <0fc7f15c-66be-4ba0-9549-51ba87f48690@amlogic.com>
 <2jc3sqihnj7sd7vjj7542nntc45eratyxi7diuaewlbqqbixbp@vlgkpv6vm6wr>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <2jc3sqihnj7sd7vjj7542nntc45eratyxi7diuaewlbqqbixbp@vlgkpv6vm6wr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bc4470-5a0d-40bf-9d50-08dd1a9b057b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmZXVmt4SE9OMTlEZ1ZCOFZrTmJXVmhJcVMvTm5wSi9UZFViM0QvN0pxUU1l?=
 =?utf-8?B?MjNicWJvNHBnM05ZbU8weHQyQXA2eTVaWWt6ZFpyWFNpV3F5NmplRllnR3l5?=
 =?utf-8?B?WHp5OTFLUk9UNDhpT1ZaMStNamZpRTdCMmxhT0J0SDdNNXJ5OEgrc2xnZjEr?=
 =?utf-8?B?Zm1WUE1xY0ZPV0s1aktkQitGSEd1a0ZMc0JHbVRtR1JwUjA3YjJ0NWNaWlRa?=
 =?utf-8?B?a3ovY3dBRktZbEg3QWw2aGVsZWI4UXpsY0dEclQ2WFozc0gvYXlhTzB1NFRp?=
 =?utf-8?B?NlNMSHI0MTJCUytQalkxRWpneGV6aEkrSE5MelppZC9oWEpPSW5nTTJIVmhw?=
 =?utf-8?B?UzNvU3RZcUptcTRhZFk3R0g3bENCczFINUplRlAxRlVGeFRudGFyRVNrWHFD?=
 =?utf-8?B?U1pHU2F2d3djVXgybzl6R01za0g2VEtCVGZUQVRsYkhPeVl5MGN6QXJYekxz?=
 =?utf-8?B?ZkxXZnVWRysrSmZnOHZsMW1ub0dXcnBrQUxSU0xtaHlTUkJZSFF5WVArSmVY?=
 =?utf-8?B?SytMMDkwTlFUU0gwcnVmbnFRQUlQVWR0OG9GdVhIS2RIVEYwN3BJaWxvb2pN?=
 =?utf-8?B?Y2ZtY2RJZzYrc2p4V3JxQzh1MitOSEFSYlJveG5ENThoQUJocC9mdGN2RDBB?=
 =?utf-8?B?SXZJZXh3bVVaNFVrYk9YTmE0dmNpS2NJZW9sR0x4TUZQT3FXR1plaC9Nb1dF?=
 =?utf-8?B?NU5kcVMzd2crNko3RmdkZXcxa0E2OGNxRWkwaGdiekFvUFlWMzRjbTFxZjNp?=
 =?utf-8?B?NjM3OTVxOGUzeXcxbnVVK1UxTktHK0drWThhdFVmelAwREZCMjRpQ3Frdi9u?=
 =?utf-8?B?dFAxS09kbmMySzN0UnhtM1NNRDJ2N1JrejFWTytDRTZFVTZrOC85MFQ2QkpR?=
 =?utf-8?B?eFowbHBwdUF2RVpuY0Y0RmJoWW1XTndlSVlodzZRek1oZXpHZkVMc0J4WnhM?=
 =?utf-8?B?VlBLSy9Uc1B2Y08yOUJxRkhlK051WVhMUVFWTHdwRGIyVmt4T01PNUFKcUlx?=
 =?utf-8?B?L3pWYlpEK0dvajFydVY2a1c3c1BwTDNnNXBlSVIydVZqV3ExNFhCNzRvT0xD?=
 =?utf-8?B?ek1MbkNZRnVMTTJTeEl6YzBycDJySThSZXB5czlPWEwybGJwam1aU3Y2Mitv?=
 =?utf-8?B?UlJScTU0c21BVDk3SEFhSHRxeXFzZi9zbXdzS1VCTXJSelVwZUpDaWg4dys5?=
 =?utf-8?B?dGJsWlFZWFVkRnphSTljMlBZZXVOTThvbVZmaSt4Yk85TTRkUnB1c2d4aHdW?=
 =?utf-8?B?K3lKdllyazhOV1Yxa0hVdCtUYXMwVXpCbVpyeE0yLy9UV3VRTnF5cHpRNGRO?=
 =?utf-8?B?WWo2MnpKMTMzcnlaY0twN1NGUXRCdjU5YXI3d0ttQ3hJR1ZhSzYrMUZ5Tmhu?=
 =?utf-8?B?T0ttWi9zeFJMVVhYOXR6NFBWS0pXYVo0RE9NZjUxTzRCSW9uVXZaM3UwRUxX?=
 =?utf-8?B?YStlSFdNWmRzczFtYm9vS3hrUkpORzQyS3JJMzZ2Uk82dUVVRytRMEc4RWd0?=
 =?utf-8?B?ZkR1YUQ4Y3poVUFtcElmaTFqQlVwWDliU3YyRS9wUmN6S0xXeU43Z3ZEeTBk?=
 =?utf-8?B?U0dPQjUwNU1kWXU3bURrTWxkL0U4ZFByL1phaklzaTZva2JQZWpjeml2ekc5?=
 =?utf-8?B?a1kvTWdGS2YwbzZwQ2hDTmVmTSs1RTVvQnVtMWhZK2ZCcENSTklQRGViMEdN?=
 =?utf-8?B?QmkrUUxNRDEyK0J1VzYwMTd1Q2oyVDdVZ3pOUlJQSGJpaUxrUEh5V1ZuYWhW?=
 =?utf-8?B?STdINVVLeHh6VHY2SzRzcEljMk1wZlIvSk9oSTVMUzNUeEVnVWVsTURNUW1Y?=
 =?utf-8?B?bVZCRHE1aUZTbExPbndhOU8rcks0OUR2ODVUUjBWSTlVZmJWYXFGYXZZR0Jl?=
 =?utf-8?Q?4H6QNTvDQshny?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW5UaHZvUkFHOFNtZGpEZFk3Y3ltYmlHVnFBeW10UnN0QXhZTk1hSlRrSWkx?=
 =?utf-8?B?L1F6SlBzajZFTDBUakRpcWpZS0NlQWdKS1NjY280TkJkMzk1a3RtbDVPNkU3?=
 =?utf-8?B?Uk9pRWRoRDFVMlJsbllYclRmc2xzblF6ZVlyalo2MGwyaTcxMDU5c2Iwekt0?=
 =?utf-8?B?dTZNcUx6RHVMeUwwcVBESG1uWFFDQXdTUlhUc2wrWGlUaU5uSUdLYlNuQjRY?=
 =?utf-8?B?UERwUHgxQm44d2R3OTArTGF2VEtKb1ovdWdyS2dSTFp6NmVSaS8vSlp5VWxI?=
 =?utf-8?B?NTI1bzBtcEp4MFZmQU5YM2VSUWxpZk9Fc29Ja1d0UWpRUGhCTzA5UmhvUC9y?=
 =?utf-8?B?SFRKRDBMdHJXbHpOUy80TnRIdWhmaFc1RFhqSTd6b0JJbythL1ZMc2ZBZDJu?=
 =?utf-8?B?MktqVllveGtDNzV2WGNLMmtoUSs1ZGY3cC92cVR2cU1rcElKeDk4S3R4dXhB?=
 =?utf-8?B?RVd2eUc4cWg4U0k3bmdhdzdhaVN1MkZlYUMvVStIeWVSTjRidUFWTnFWdGI4?=
 =?utf-8?B?QkU2QlI5YU9rbEtTeWkzSXpBa1ozUXd4STMrQWg3aVQ5UG1QNWt1VTIxVGxC?=
 =?utf-8?B?Wm5OVmFFRXBLWDltRkRxZXc4VEwrREM0RTZySXAvTlRDZEo1UVlnTytuc0dC?=
 =?utf-8?B?a3RvMEVVME8wK2hOMmNibXNGRHlFQXc1T1JPTDJWclU1dVlsMzVKYmE3VEg4?=
 =?utf-8?B?SWV2Rjkza2RyS00zczRVNkhEYUV6c0VRc2s0K3lqWXNFVWlpN09zb1hsNHBM?=
 =?utf-8?B?T2JBL04rMkgvUXZCZkJMU0dxSTlXSURiYnZ2OFlmS3ZuRU5Ga3pnWjV3WjZ0?=
 =?utf-8?B?VmxRMUFUUU9BN1lMMDJ5OEx1S0tpSDdsUU5sdVJSLzEwWjBva2ZmeEhTUkJH?=
 =?utf-8?B?MnJlWmRKMGJQVit0c3N3YXYxNE1PNHlCZGY1TFIzMVVvS294WVhxZVkxVUkr?=
 =?utf-8?B?M3ZqY0V4eE8xR3htb1U5Ri90V1FUZk5rMW11RUhnQnYrcmgwbUs4NXBUTVQ2?=
 =?utf-8?B?MHF5MmNFWTB1aThLTHdFaTl6L3pWL0ZqenI1RUlkeVpxTmVzUmEwRWV6WlNT?=
 =?utf-8?B?TEY5MmwyVkxYQ3BwOUJqRTI3aWhWQnhlZWs2K1YyZHBTdWV2RGFpL2NXYTI0?=
 =?utf-8?B?TXppbzB5Z1lQQ05VZ1VXN1YyVlVUdjEwK0IwcjFYOFhMQnRIb3Q2eVYyMEl2?=
 =?utf-8?B?TE91bXU2ODhrMlphM25VekdMYjFRNzNLZEUrNkVqM1ZQcUZBQlp5aVJFN2RE?=
 =?utf-8?B?T054Vyt3NWxzYUQvVHVhUHNKWW84L2k1TXZGdEZNWVNybzRNTHlmcWRmYkRy?=
 =?utf-8?B?WStkeTRuNlZzd09NdjNhSGlCVUIwdFRsbG5IckFWb21nSDB1SnFSek9ueEJ0?=
 =?utf-8?B?SlZDU0xoaFViSGdMeCsySzc3VnVsTnJFbmo5RWovRWxPMVhzV3lneEt3cW5F?=
 =?utf-8?B?Mi9oZ1VYTEUrd1ZTb0dPTEVVcFRSMFBXWW4rOXhNVE5MRkxxa0gvbDBMYlVI?=
 =?utf-8?B?RmFxZzRXZnU0T0tDbXp0Z1A2eUZyeVhQeXR5eWVHa2NwWmEvMWE3K2ppbU83?=
 =?utf-8?B?VlRXLzcwRmpJMkFZVzVsWXc5NmFQUXVhblIwNFE1NzUwZkhsdHZlM0NXN3B0?=
 =?utf-8?B?QzZ6SUpFZ2ZiZHhjMDV6VzJRWlo5bHBVeUxoYzZiS0RzTFVsc0ZCUjlJWE9i?=
 =?utf-8?B?UmJaTVpQZjdpdVJwdlVBdXhWeVBOZFpvWVBrcWtWbkE2T0NXaUdxQjJhN3BH?=
 =?utf-8?B?QmJ5WWVIUUZsbFZlMW9XWG05a0EwWEFFZGYrMkIyMWJ4bG85M2NSbXRGbjNS?=
 =?utf-8?B?Wk1IRXc5ZkU2bkIxanlrTGZRdzZabDhCdzZWU0wyaXZWckhNbTh0MHRtVjE4?=
 =?utf-8?B?MjQyOHhEWC9CdXpzZi8wdXdtRUJkU0tVb1ZWRFl3VWdmS2kzbjgzeUkvY2JF?=
 =?utf-8?B?TVNtWmhFSXJtZkFYd0NHWDB1YnB2Smh3Y3p6aU5iTEF2T3RseC9DRDZrNWh3?=
 =?utf-8?B?VDhpSGpZMGtkd3p4T2kySjVFZzFVUEJxTDljRkFXVTRZUE5hWlBmekRXbDB1?=
 =?utf-8?B?NllMWURHVTZldlNMajh1bWRXcUxsRjh0NjZFcEZ3eFBxUXRVemFKYXc4V2dp?=
 =?utf-8?Q?QLQJq7b08a07TkMQ11RmCJphV?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bc4470-5a0d-40bf-9d50-08dd1a9b057b
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 10:52:07.2589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/TGZ0oDZzpU8OSzqgYDxw1Xlgkn5HwgCk/sC3Xri9UfFJosxdf6Bjmmgjq8WFz2S6VksU/5EiHb3CnrSOT+Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7748


On 2024/12/12 17:41, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
> On Thu, Dec 12, 2024 at 05:08:27PM +0800, Keke Li wrote:
>> On 2024/12/12 16:41, Jacopo Mondi wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> Hi Keke,
>>>     a question for Laurent and Sakari
>>>
>>> On Thu, Dec 05, 2024 at 05:04:28PM +0800, Keke Li via B4 Relay wrote:
>>>> From: Keke Li <keke.li@amlogic.com>
>>>>
>>>> This driver is used to receive mipi data from image sensor.
>>>>
>>>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>>> [snip]
>>>
>>>> +
>>>> +static int c3_mipi_csi_configure_clocks(struct csi_device *csi)
>>>> +{
>>>> +     const struct csi_info *info = csi->info;
>>>> +     int ret;
>>>> +     u32 i;
>>>> +
>>>> +     for (i = 0; i < info->clock_num; i++)
>>>> +             csi->clks[i].id = info->clocks[i];
>>>> +
>>>> +     ret = devm_clk_bulk_get(csi->dev, info->clock_num, csi->clks);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     for (i = 0; i < info->clock_num; i++) {
>>>> +             if (!info->clock_rates[i])
>>>> +                     continue;
>>>> +             ret = clk_set_rate(csi->clks[i].clk, info->clock_rates[i]);
>>>> +             if (ret) {
>>>> +                     dev_err(csi->dev, "Failed to set %s rate %u\n", info->clocks[i],
>>>> +                             info->clock_rates[i]);
>>>> +                     return ret;
>>>> +             }
>>>> +     }
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>> [snip]
>>>
>>>> +
>>>> +static const struct csi_info c3_mipi_csi_info = {
>>>> +     .clocks = {"vapb", "phy0"},
>>>> +     .clock_rates = {0, 200000000},
>>>> +     .clock_num = 2
>>>> +};
>>>> +
>>>> +static const struct of_device_id c3_mipi_csi_of_match[] = {
>>>> +     { .compatible = "amlogic,c3-mipi-csi2",
>>>> +       .data = &c3_mipi_csi_info,
>>>> +     },
>>>> +     { },
>>>> +};
>>> All the drivers in this patch series implement the same pattern when
>>> it comes to handling clock. There's a list of clock providers in the
>>> driver associated with a clock frequency. The driver bulk_get the
>>> clocks and set_rate() using the per-compatible info table.
>>>
>>> Do you think this should rather come from dts using the
>>> assigned-clocks and assigned-clock-rates properties ?
>> Yes,  I think your suggestion is OK.
>>
>> Will test it.
>>
>> If apply your suggestion, do I need to modify the relevant yaml file?
>>
> Do you mean the binding files ?
>
> You could add to the example
>
> --- a/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
> @@ -73,6 +73,8 @@ examples:
>               clocks = <&clkc_periphs CLKID_VAPB>,
>                        <&clkc_periphs CLKID_ISP0>;
>               clock-names = "vapb", "isp0";
> +            assigned-clocks = <&clkc_periphs CLKID_ISP0>;
> +            assigned-clock-rates = <400000000>;
>               interrupts = <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>;
>
>               port {
>
>
> As your binding document has "additionalProperties: false" I thought
> you had to add:
>
>    assigned-clocks: true
>    assigned-clock-rates: true
>
> As in my understanding "additionalProperties: false" means "whatever
> is not explicitly allowed is forbidden". However I might be wrong as
> validating the binding even without the two above entries work well
> (and I see other bindings doing the same)
>
> DT maintainers are in cc


OK, will add 'assigned-clocks' and 'assigned-clock-rates' in dt-binding. 
Thanks very much.


