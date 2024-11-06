Return-Path: <linux-media+bounces-20964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B22649BDC3F
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 03:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 408681F21868
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 02:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5627C1DD555;
	Wed,  6 Nov 2024 02:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="OpXY65ax"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2100.outbound.protection.outlook.com [40.107.215.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD02D19007D;
	Wed,  6 Nov 2024 02:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730859070; cv=fail; b=cjktTZ5OG3gPPwn98QyqPrmYmWDAY/pAB+3dilVHftIi2Ih8O4ix3+dZ9JOxyaaui/mPbloMJc+Ns1XEcQzSzLFLGpQhYcKWb+bSTqg//RbY25ykFu+zfCo7b/ZXoaV4O4Np0DzJWDZKBiWxOFvX0m9F2eLl1V+/WGZdmJBoJFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730859070; c=relaxed/simple;
	bh=d/KegHhehvLWN7HDb2TgXpcIG3nKdpjnEJ6n9lAIxPk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s/pcUp4GEVgc8RYWXysGlj0qcUGGzBMV2Dw36MEZPE+QBsEU/G+qXHfYEx3uACarCfuvqneaYT7adF1S2zxOu7e53kh1yvNT+6ZOsVHFkvKXVm393+1H3sNbyh3EVZO1rkfI0MY/aT/WERvwWF7IQoxvvfx39UBf7NfuAPg/EmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=OpXY65ax; arc=fail smtp.client-ip=40.107.215.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bre40nqJrYEtcj4u7F3NZxfi/O/KJndPCEv46VCnCDaPvjK19QrAQXuoJkH8DYR+Dcvf+tdBFf5Jd3cGTcWo+pVu7GBH1Ed4H6wRyflcl245nGOoeSyZ7ICDIOcJJku8DHXFDcAOA7JmUg6wj3K/gWNk2knCkxIsomgZ9yW0jmdkqSpA0wCjmsTuf6YC9fsWMlZYG7S8vjTh+9J+Pi9b6x1hyAIL9ZlwFnAkQyxsFJpxhgvx6xsKZbigRY8Y8Y/HxvvgMd46gcRGUrUXpUXyyYSceVpdCRcw4oYBZhGLxKG5Nx1ntp/y25kXRTKgZY9LRbRa8eVGztYYjxT2FICzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBEL1aUkxFd5G4qAL3grR8Vp8q+UZyKP8/eqj8npqRY=;
 b=ATyg+z6LpaJg1b1iIldyzsrTMOGDKqE4/1U5FkQjMY5CjiJmNz4dvzP2XA+q4Or3PFIwu9WJ7MLfjGWvVJipLEvHaWYbg1PSOkR77XrXGd+3Sk07+pziGL+gGObaeeFQXnAidR9vxOwMqO8CrFMZHZPVXLvOUqcXvBaNhK1R3iW9HyLlAD7LE07byrEgIj04ibgDrDwFwFvg9fxEWvNdpwuWH/HKUP3iMZ0lfEHZhUbTX5N0jP9x1Av8HBnbux8wEI3Un9aa8vAQlV3txASnF51O96EmOAsJZ0sh78cq1huCxIZTtiXeqowfsc9eWL2rhVNx4OfXYZ2oxFbJPjbYvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBEL1aUkxFd5G4qAL3grR8Vp8q+UZyKP8/eqj8npqRY=;
 b=OpXY65axZcMLSmfQbsWpQ3jvutV6gHvUIqiXkikjPIs0czutQ8hxpj8VSgUPvqTNNKRP5gSP2iCZHcVFZivWEAr6+mrKK9e8Xq4M5NCA3pwN5NPNf/0iFU6dBksyoc3CnE/ZJ1GI4xMpGqhoGPV/w8lGGOnQzZyNXhhBKPBw0u9hlng2V8J3yYRUa5puxdize/swjdqeDe5QcKiXt6GxxhKBuQ0SqoQffpVRBqDxqf3YYd2XEBB4CMdFNFGyZsierpXseBSXvL6I6U0Cdh3NlQDZ2BK3A8uf9qkZ0g9K5VJuFUacW6/k/duoIKCqQSZcez47sHjEY7ciI9HBu3+ujg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYSPR03MB7450.apcprd03.prod.outlook.com (2603:1096:400:417::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Wed, 6 Nov
 2024 02:11:02 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%3]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 02:11:02 +0000
Message-ID: <868d13a7-66d2-445c-895f-5cab3e71f1ef@amlogic.com>
Date: Wed, 6 Nov 2024 10:10:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] media: platform: Add c3 mipi csi2 driver
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
 <20240918-c3isp-v3-2-f774a39e6774@amlogic.com>
 <ejz2o35uenq4bq6ifepgpu2tsfkjrylmtvxx5ysqab5ydodtvx@zb4m24sk6fcb>
 <7c6cdb7b-705c-4744-a28e-866dbda094ac@amlogic.com>
 <qbr4bzggnnkj5lakfpbgmgrfgeuy6tatljkjiwijeradklm7cw@hblicnc6wtvl>
 <9becfc3f-1dfa-46d3-8afe-81c8e6b59800@ideasonboard.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <9becfc3f-1dfa-46d3-8afe-81c8e6b59800@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0001.jpnprd01.prod.outlook.com (2603:1096:405::13)
 To TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYSPR03MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 020d12ea-7e9b-427e-6194-08dcfe0842fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnVyZVpibVViQ0JhSm9FalpBZ21udC9iZENpTmlCR1gzU1FuQzQwQ2p0KzBs?=
 =?utf-8?B?L2hobnNXLzFlYnh6T2dvUHRoL0h3Mys4UktGMlpQMWxiTzVvQThBMTNGQitI?=
 =?utf-8?B?ditSeGFqUlU0a041MGxxN0lXUzkyRXRIS3YxcjhJNXRKQUZXKy9idElkaFhP?=
 =?utf-8?B?UW1XVTlpd2Rha0ZXTDIxME8va25PYnJodjlPdFZESW16MjhSK2VMbUdvdkhK?=
 =?utf-8?B?ZGtQQll2RS8ra29aRFNDT1pNOVJjbmxZWTlxNEhmby9UVklLR3B1Z2hyMjBn?=
 =?utf-8?B?bHF3STE0TDFFbU5CYUtTcEVWY0JGUUVIZUVIYmJRQmtuS2VUZ3hLajgrSWZa?=
 =?utf-8?B?Z0JHT20xMGt5Vm1XVk1NWEQ2eGlGWkNFL2FCMitwblNBMXBDbittUEppbjJ3?=
 =?utf-8?B?a0FOUnBqVUdydXdtR0I5c3ZLdnFHempSelVkOSt2MXI1dWlsdmxSNHdNUkZX?=
 =?utf-8?B?em1STENBZUh6cFB2eFdsbkNYOUFvUFBxL2grZnoreWdGb3lremJVZE0zbzJz?=
 =?utf-8?B?WWZDZlg5S0NrNFpXQUliNWR6UEs3R2pydHNhZFBXY2huK0NWSk1RR3MxOC94?=
 =?utf-8?B?bm1HUzV0QzRNRXdBY1VzelB0djdPaEJhRDVLaHFEVE5PMFhqbmJWL2dWSGly?=
 =?utf-8?B?aTNoRGFvSTZ6T0x6a3FaT3RaNmN5c0ZTRWhyL3lYSWtVSXAyNjUrV0pwd1NX?=
 =?utf-8?B?OHA0UURhaFlidm4xeU8xQmxvT29LSFlPQ2gzVTN5Qkx4MlB3T0pWN3pUQXp4?=
 =?utf-8?B?R0Q1NUg0RzB3a25kRmp4THJEcUlNbm9yM0hCc2c0ZlRvaGxoY0pVaTB2MHJ3?=
 =?utf-8?B?alJ0ZThjUzlvK2RnY09SVlBIUnc5MXJmRm9jRE1DdE9VTUNnMktYck5xeDJE?=
 =?utf-8?B?YlE0SnNrUG1LV3NnUnFnK2lEVFFiSHZqM2Y3Q2pBaXNwOVJMWm9ZbDhZRXA4?=
 =?utf-8?B?NURvMmt4dm9aOXFueE5IbHFuL1R4aFpQdDlrQ3RWaWdFaE1XMXg2eWZpMHRJ?=
 =?utf-8?B?WFd4R1lmelpNb040VHBsZXhSNllVSmc2YXpoU0M0Z25ZditJMzkxb3pleHc0?=
 =?utf-8?B?Z3VQRE9xR0lBZktNdGs3ZityOTBOSG0wS0xUbytEbStlYlRZQU5HZnA2ejk2?=
 =?utf-8?B?Y0NybVJ4NkNKc2pScStzZThMSHdqcUVzZnV1MUFZYXd4VTk3akFNWTMrQkd1?=
 =?utf-8?B?b0ttTEgvalpXR3FxZldiV1pLZDBDOXVEcU05cjhhaFRJRjhEbzNxQmVJNitN?=
 =?utf-8?B?WFdrZ0Q3blZKZmdGd0dZOXRWRWJ2MzFURXRvN2EwR3UrZmp2Q3BmWDhCNzhr?=
 =?utf-8?B?dG9tQzFpa2tabzZxRW9jRTAyMWMvZlZNODV5UHpTMkVZQmw5U0hTdVF0SXBV?=
 =?utf-8?B?QWkrL3VRc285NHhnYjNxSTI4bkhqSGgxWDh5bW16T3dSMDcxbWw1TUJLTzJU?=
 =?utf-8?B?TmVTTm1sOFhpK2FVLy9UK0ErRHUwVnh4RzB2b211RkZ4ZndHeWl5Y0Vnc2V6?=
 =?utf-8?B?UVQzeHl1WlMra25raTJtSHB5L2pRZXRXc1NqVHJXNjkvNXB2NU13T2hHY09w?=
 =?utf-8?B?YkROUFlSeWQ0VitXZmxmSGg1S21RK0lndjArZXBuMVVwc2tNSWtxSkRBelRM?=
 =?utf-8?B?d0xaeFprSEdTbTlaZHRVUVZCY3ZnbDJzR2FLVmJaazE3dTRuK0RvR0xxS3lr?=
 =?utf-8?B?cUFsZmxoQndpL2Q1Y0JUYnNCb0FkWDJxOSttU0lVUXZOVmpTVThZeTNFa0J4?=
 =?utf-8?Q?QMmUul4wnTaErPVBcgXha5YWk8Dh+54yONMc1by?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3FuTmdjNnRKWURWdzNkTlpidGpmVWw0bmNZTEJhWWlOdDZrd0xZbVIwYzdm?=
 =?utf-8?B?SWtFaEk2TmtMYnIzNDFGaUV6RXp5UVN3T1BiRHNHR3IwVFlGQlU4OVNRdTFm?=
 =?utf-8?B?NVk5MEdIbzJVNklzdkJ2eXYvTHZZQ3lKT3VnWUszb1FEZitVMndpR2lQRy9j?=
 =?utf-8?B?eHAwdjFULzY0NVpmSEpYT2lJVWpUeVRxNWptMnlRNGFsM2JHTTVadzlPMW42?=
 =?utf-8?B?MHlmRGE5ZXE4ZGZjaHN5MjdUSVVWNFdPYklLY25NaTdqSmlNS3ExMDArM2oy?=
 =?utf-8?B?YU95THNMVVpUbmxreForL0wzdUltM1UzamdiZ3Mxb2tvbGlTYnFKK2o2V3Z3?=
 =?utf-8?B?dDczN2hFNlR0UXMyclVlK203dDc2bnFCeDhXUlczSnlHTGYyRWViQXhzMlRh?=
 =?utf-8?B?eXhQSk5EdW8rUEVMNTB0RDVUNUFnd3EvRFgyeElmYjJaZ1pOU0NyaGdZazBP?=
 =?utf-8?B?KzhRZHkzUit2V0NKS29QdEF1QkVieW9HcDJSY2ltZXFMSmI5V3piU1h1M1NY?=
 =?utf-8?B?TmF1Tzkxb2dBQnRTVzNlcG5mWThqeTJua096bkVleDRWM3AzMEtValVudnVK?=
 =?utf-8?B?bmhmNHZkemNRYWdlUGVmZEwrSVluQ3JPdFNpbmU5dnhQR3p6M0RCZFQ3cEFj?=
 =?utf-8?B?TXRaM1Aycy8zNnZMK3ZDS2pzeEdjSmkybk4zMHNWbkNEdXlseXJ4aFcrUldM?=
 =?utf-8?B?TFZDZThpNDY2N3d1eEp5V2pZWEJIWndZdllwOHpwNUZYZURKMjZtM1JYRkNn?=
 =?utf-8?B?SW92QmV3L0hxOHJJM09PcEtsTjRRdis1NGJTZnRuUGViMlRrUUFhQUx1OXM3?=
 =?utf-8?B?MWprQjdCZnU0ckVTbVd0ZXRRaGZXTmZOMHlKZEVyV0lpV0JJNXVVYjZ1QzRO?=
 =?utf-8?B?aFUwbjRXT3ZaREg1clY1UWYzQ2xMM0l4YXFZNmNoTlRlNTFzZHo3WEs4TkZT?=
 =?utf-8?B?VURvTjZZM09jOThCTHExbEpCanRibnFnQVBoY3U5dkVqejRYYSt4cElQb1hS?=
 =?utf-8?B?bXdkcTJ0S0VVY0ZFam5rSUM3V3Y5OVhkWmZwTGlhQXNGV2RsSG8vWDRFTDNk?=
 =?utf-8?B?TUNFRE9IUVV4UXlMQThSK053a1ozL3prZFFHUWVXZ0ZyaGVUSm10REFVd2tM?=
 =?utf-8?B?OXZ5NWdDSldyY0lwZE53ZWMxeDZ0MGtCSGRJWGJZTkYrZ2g3MlpMK0pwTEp3?=
 =?utf-8?B?cUVGaW9zcXNHbHdrWFhxKzZDMGllTnF2Y3plSzNGTTJibTZ3cVJidlc2eTRm?=
 =?utf-8?B?djNUNEIrQlcrMGRNWHV1OHF6MVRKb3VsRnpibDFSdlJvSzVMK3o0SzRtRG8z?=
 =?utf-8?B?YTM1VU5TWkR6Sm84Ymc1ZzJ2ODZmZDFaZjFEOGFwQXg4eXhFQXNiaGZyN1Rr?=
 =?utf-8?B?c1lqaDR0K2VTSFduak5iS2lVRHRXS1pjbTRkS1IrOG4zRWlsQzg3bVhJWnJL?=
 =?utf-8?B?cThIYTg4M2dJeFQzcTJ3NmF1M0IweERlbzVOeml1dDFDQUV1TUt1bTNPSzJH?=
 =?utf-8?B?S0xYUmRTblUzaDUvZVVUNURxOGlZN1ViV3Z2QjFycnppYjlHZlk2ZWNMVWhJ?=
 =?utf-8?B?YWVnMCtmdnI2bzg0ckNPK3plWnNzQTQraUYvOGl2QU5McVF6MGpKdHdlN0xY?=
 =?utf-8?B?MlF6NjN3dzdMUVh4VWRQMk9DQ0FpNlpVbmUwdFlFOElqakUvZ2RGbURZVDE5?=
 =?utf-8?B?eHNMZUViWE12RFJybXREZjdwMlNXTHV1Z3VVTFpkSThDRTBQdXhTN0tiMlZZ?=
 =?utf-8?B?eDRvQlZFaFRzOUw0eTFuVVhxWFN0ODZFUW4zamdoODFXeEZHS2VCY3h1TkVO?=
 =?utf-8?B?YkpwTWZWWVJxV3A5Q2hBVUhDSnhWS2E4WTJVUEg4SUEvUlhidk1IZ2tkdFFK?=
 =?utf-8?B?NVVMQWVXYU9GZGdRK2lYRkVKR2U5V0tPdUVFenRKK0ZnbkttM0xOVGRROTg2?=
 =?utf-8?B?Rmd2cWRNUTdLK2NGTXJOeWIwaU1uRHBPaG1vdXFlbXlrTXZLYTg4S29CVmk3?=
 =?utf-8?B?UkFNOHFveVBRaWtKYjNkNmJrOXdBaTRZd2RxdDR0K3pHRG01WHdENjd1ZHM3?=
 =?utf-8?B?bWFpaEM5WXN2RlZ0UzgzemZySjRRTzA4ZnI3WlF4Z3lGWGJ4eGdrV0FsSjQv?=
 =?utf-8?Q?nsDWffwFDnuiOwrnvNRJXnbyt?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020d12ea-7e9b-427e-6194-08dcfe0842fc
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 02:11:01.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SH8TN/IMfjNc+DhhFkftWeKfXe3BUG+dR+k+6l+8FifeGTX2iQKv1hN347uLvIXafF0YoLQll0TtlYmZOmlqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7450

Hi Tomi

Thanks very much for your reply.

On 2024/11/5 20:08, Tomi Valkeinen wrote:
> [ EXTERNAL EMAIL ]
>
> Hi,
>
> On 05/11/2024 13:39, Jacopo Mondi wrote:
>
>>>> Could you clarify what other streams you plan to support ? As you
>>>> support routing I presume you are preparing to capture
>>>> multiple streams of data like image + embedded data, or to support
>>>> sensors which sends data on different virtual channels ?
>>>>
>>>> How do you see this driver evolve ? Will it be augmented with an
>>>> additional source pad directed to a video device where to capture
>>>> embedded data from ?
>>>>
>>>> I'm wondering because if PAD_SINK become multiplexed, you won't be
>>>> allowed to set a format there. It only works now because you have a
>>>> single stream.
>>>>
>>>> Speaking of which, as you prepare to support multiple streams, I would
>>>> specify the stream number when calling v4l2_subdev_state_get_format().
>>>>
>>>>           fmt = v4l2_subdev_state_get_format(state, format->pad, 0);
>>>>
>>> Thanks for your suggestion.
>>>
>>> But this MIPI CSI2 hardware module doesn't have the ability to 
>>> separate data
>>> , such as image + embedded data.
>>>
>>> So there are no plans to support other streams.
>>
>> I see. Now that I've reviewed the adapter subdevice path I realized
>> that it's the adapter that can split data based on VC/DT to either the
>> ISP direct path or to DDR.
>>
>> The CSI-2 RX then transports streams as received from the sensor
>> directly to the adapter.
>>
>> In order to support capturing embedded data to DDR in the adapter the
>> embedded data stream needs a representation in this subdevice as well,
>> so that the source pad is multiplexed as well and the adapter receives
>> two streams that it can eventually split.
>>
>>
>>        Sensor         CSI-2Rx         Adapter
>>     +-----------+     +------+       +--------+
>>     0-- ED --\  |     |      |       |     /->0---> Embedded Data (DDR)
>>     |         ->0====>0 ==== 0 ====> 0====|   |
>>     0-- I ---/  |     |      |       |     \->0---> Image (ISP)
>>     +-----------+     +------+       +--------+
>>
>> When going to support embedded data capture this driver should create
>> two routes and allow enabling/disabling the embedded data one.
>
> This depends on the hardware. What's the bus between the CSI-2 rx and
> the adapter? If it's a custom bus that basically allows passing forward
> anything received from the CSI-2 bus, then the user should be free to
> configure any routes in the CSI-2 RX subdevice.
>
The bus between CSI-2 rx and the adapter is not a custom bus and can't

be configured by user.

> The adapter subdev, however, as it is limited by the HW, should only
> support two streams if that is what the hardware supports.
>
Yes,  the adapter HW only supports embedded data and image.
>> Tomi in cc for inputs.
>>
>> For now, if you don't support capturing embedded data, I would remove
>> routing support from here and from the adapter.
>
> Right, if the drivers only support a single stream, just drop the
> routing support.
>
>  Tomi
>
Will drop the routing support due to the hardware limit.



