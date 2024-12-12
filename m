Return-Path: <linux-media+bounces-23243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0E69EDF3C
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 07:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63685282D35
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 06:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADD2186E27;
	Thu, 12 Dec 2024 06:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="r4jZt1lJ"
X-Original-To: linux-media@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021091.outbound.protection.outlook.com [52.101.129.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CCA5684;
	Thu, 12 Dec 2024 06:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733983806; cv=fail; b=TRN1/RZznEgf0aODXBdcqUWT0r3j+gUBkIQusLPvozSDOu6VUlKkYZJhl/N+XUWOczdbeI3wp7MtWjAMk9jgoIgK1RE7pX9OTMPa+aYAy2djz4+8xlannBnbr8f2maK5VpalXE8oT9KVMqvw23W7T0QGndlts/2BmdeGektGuOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733983806; c=relaxed/simple;
	bh=uHQan1JBk+o8QnQYSgqhl3oQIEnJVUDMBD3zVJBoAok=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t7BKx/lzTDZt5m7kFsInBXpPYBVYw9cbRUpYTtjkcnmP0ZCiVZ2aQWt4s4bBWKf4eZzNFYVyydATlI1YbZ9LTJHQRDVYG+wWckQdBvx+3+0IF6cv02qgjvkiuv4yVQ6SHcv/lT+t5lUoRW6flUnf2na3fhIFVvxPNGDi9uEselg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=r4jZt1lJ; arc=fail smtp.client-ip=52.101.129.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/66VcRxG5KZvmkZcmVeQgwrtUN15mLaCsVIp7+i3CV3ygoW05qEBPaJC4Lr5tudok385BogxpWWPTJdMLXjBVOlgQBggwJvYm8qalKRw9tKey8G4weEPTUGDR96fK6Z1bhAd0LTPuRv/qA2pzOyKtnoAUzq6wI1Yz3ULmQmLZhT6OIvmcx2uB/1W1XDpSLcMHOZOwyfZkoYREPaIP3v8YJAxgsNfz9X7ddtO3XKUSoWPMBBnwnDtyIcBheUQKHMsMXD/TdDTL9H23z6qJYdAdhdF++eVuvomUcKDs2Obe1fjHSmf8IdBtROKWWrOs1qQg02AfuGdnk9Y3ESqFXbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYd9ne7JrPbA8l/FdMajlxHRg23UNC6d+Bo13oCDhyM=;
 b=VvUUMGIf3dciIEDg9w0Df/x8J5aQ/K1utGcFhkvdEL7LEZTvDTV5E42SherlRAI9FOKAS6rqCcqxpZ7Iv9GKgBrq0XHpNviIvoiUjEzXFplAHYusrSYu4V/tbjHADx/d7BUi1Fihb2Kp+CCQL4rnBXA/9vb5ZMVEUZDGwT1uyANVJ3vMbt0YIqKSVrlDXHpFSaRlWJbiRElyvJSYTXoi7s8lnSFLsG8boE+qYrpS7GIKkLiUE4uZPXnUFFYUOEYe0sT6EQiAGVlUAH9n7dFC7SVvMwqRhI2xx4kCiJqlCZSKxzJjKOYyQI3LgRtKGhDONq8A8GuhHAzfJwtMN5JrXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYd9ne7JrPbA8l/FdMajlxHRg23UNC6d+Bo13oCDhyM=;
 b=r4jZt1lJTDX0AJ2MnZDoY/mI9LWJfHymRqupTB+nU6y93xQm20gJstNC6F/bO1D1v7eHKHc5/ezrb05IytyGBL/RjPYMf7Vc+C0wtrO92/0CXmg0UKaoR4YYxf6nm987iqjTdWfUXdFREG87To0+RWHYUiEFsoRzOSEyHaQmlJvezMCRo18n5BiCRQX03CfUp1S6GG71qI71sC4rJ1kooKInPVDqLuqmvqsAxUb8bU++IB74tXO+aZLutoun8CADn1wZTJR21BN8FR1R1OlecVJS6GDzwTTmnFnyZ9nsHwUj9MYoA9dJgZxVtGa3jJc+DCcrh3VWRWTM1hEyecMgRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYSPR03MB8081.apcprd03.prod.outlook.com (2603:1096:400:470::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 06:09:55 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%6]) with mapi id 15.20.8230.010; Thu, 12 Dec 2024
 06:09:55 +0000
Message-ID: <f108c41c-de79-4d3a-8dd7-6c7b9c86edee@amlogic.com>
Date: Thu, 12 Dec 2024 14:09:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] media: platform: Add c3 mipi csi2 driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
 <20241205-c3isp-v4-2-cb1868be0105@amlogic.com>
 <dt7sj27tj2syrsmscu6cejastnpppeicee54ytyju6dyy65nan@evjdokbuw3ma>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <dt7sj27tj2syrsmscu6cejastnpppeicee54ytyju6dyy65nan@evjdokbuw3ma>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYSPR03MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab74c07-cbf6-4c0c-3a95-08dd1a73990f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmRxVGVGdkJ0Q3lrS081VzZPUGhHWDNUc2MvOEdNdlNJSWpsWVRxR09hb05X?=
 =?utf-8?B?WFBmYjlLaWVRRG1oK0thbnc5UTMvU3FQdVdzbVJkTVdacEFMcllIMTZhS2pn?=
 =?utf-8?B?NGV6aFkrNU5LRm9DZDYyYVJOZ2NQWGRudDZYU0ovZW5mT3NYTFpxOSt3aCs1?=
 =?utf-8?B?L011SmVTeCswcmY3N2tKbFFSTXRMOGtoU0NmL05ySkF3WUVZT1hRNUVqYW52?=
 =?utf-8?B?WlJNdHRkeHE1ckNicGFEUVRGQlRXOGNtTldpTm14RUZaUDRLTDF6cU9RdUF6?=
 =?utf-8?B?ZW1NczV2YnBvZ3lPd09IOVkwTGFaSUlXTXYvRGdMMUYzY3QvcHhvNjI3RHBm?=
 =?utf-8?B?Q1M3RTRoSzY2bTlJeTZaWjA4VFlKeTdiUGd5ZkFBVHRkdWZHRlM1N2dqZGtu?=
 =?utf-8?B?R3dKSHdKTnk4VVlFOERYSEUraDV5SmY0WDA5c0VvVGZMang4UGVLR255ZzVW?=
 =?utf-8?B?NWg3MUhjTmI4dFU3eUgxMTdBbEF3R1VTQ1ExU01IcFpjaEpXNWZaZ1JHN1Jp?=
 =?utf-8?B?TmovY3E0RURuZ2ZjQ3FHL053Y2FraElveWZKLzUzL0svamlFczBscVBKdzFo?=
 =?utf-8?B?UHVpcWozK2RvaEZvdWl3ZUE4L1RkNlh2czA1bmppMGNjcjVMTkZCbmVXOEVn?=
 =?utf-8?B?UFdVdjBiVkRveVRQUmdoWTE2S0R6NDFzWGtFOW1LbHhaMEdLSGJVdjN1U1hE?=
 =?utf-8?B?RmN0WXpOYjFVL3Vkb2dUZjhTSnZXdjQrZ3JYUlBONExiSTI3dStwZ2NzQUVE?=
 =?utf-8?B?bG03SGNEZU9RZGc2cFZWK1NPWU92N1dQTUovd3ZSSkMrZHZvWlFYMHNhMVJv?=
 =?utf-8?B?TWRycTdPc0hKaGlJZm1USHBidG5CaUxuVlNzUUdPM2lUS3cvcjY4SzNrc0s2?=
 =?utf-8?B?aEFjNlhqcXA5NlVNUHZUZnkvMzlSdGNXbllGbGNLZ0JkaGZaRWRPMXU2SEZt?=
 =?utf-8?B?Z1dTRzZJTGh0ZXdJV2pQRlc5VjFKT25sZ2d3WUlRanF3OUVPQ3J0UHFraFVU?=
 =?utf-8?B?eTlJWm9ZOEpKZTMvTjlrU1AzejFaNmg5YnpvdElCNktiU0NaS0MyYmZMSmhH?=
 =?utf-8?B?SHlCRFBYMENsQ05WUkNGZHZrdlZwZzhHeEZFTG1nVnNGcVJHSGRCMHZZR2tP?=
 =?utf-8?B?TXZaa2x5K1BkS2kzQytzVzBVYit0dVdtamVYSjI2eWkzYnJMaG1BYWRBWm40?=
 =?utf-8?B?bldzTUJFQ0UrTUVjQWNyMzhMd25qaEVHWUtqT0pmM2dZVFlwdWFUS0xYYnZ0?=
 =?utf-8?B?REkvakUyRkRGM25zNnVFbmFIUFREVTYyZGN5amlHV0xmN3l1dlFGT0JjeE9L?=
 =?utf-8?B?SDVGVy8vOTVraWJ4VUlmWm0wZkRXNTJXQjlNR2hpNVVRbVZwQ2dTNUY0dy9j?=
 =?utf-8?B?V1pmZnIrbnRYZ2FWSnNqai9SSitGUEp5SHlqMFpmMmM0TTMreEtHMks5T0hM?=
 =?utf-8?B?djEvWUdMY2dIWGRyR2Z0TFFlcnpKK3gzenJxam16VmZ1WUJSazAxSkZrWWM4?=
 =?utf-8?B?VDVWLzhLWGl0OURNSCtuYXd2RVZuNnBJMG1qRFFkS0Uvc2dhQXRabm5MZmo1?=
 =?utf-8?B?VFVrQ0pMSlZDZWtKd2lGYlZ1Z00yMHZCckZPUWNGdWZnczUwbTF2SjUyaGZ4?=
 =?utf-8?B?aXh4KzNYOXJPdnpod2VFTUdvaXJITGJWK3RuTmJyUkpJelhzdk5tNTBQVVpN?=
 =?utf-8?B?aytxWDRWUXl6eUhXSWNSakg3bk8xdnBRcjJSWTd1cHd0THlmUEtVUFIybHd5?=
 =?utf-8?B?b3FqemI5ZTlGbDZBYkpDWEJCem4xZC9laXo0ZlRHUzIyZDBERlFDUkdCeHZw?=
 =?utf-8?B?NDV0WXREZDIyR3hSNFhldz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0FTdms3M09hMlZFV0N3Q0lZcStiYjh5dWVQSWhCNEVPZ3dCNEkzZjJBR2tx?=
 =?utf-8?B?N3d0MnpFRTB3WFF1ZE1CUXA1VGR2dGdwUUZzVVl4c3hPNnVsb3BUZGozM25l?=
 =?utf-8?B?eW5BY3JrbXIxc0VlM0hDR2phRVZ2RlRPNmkwRTJIMy8vbEF1ZmRGaVRRNjIx?=
 =?utf-8?B?ZHM1NFJaYTdYR0ppYk44bUVJTjJFTnhONmNFVDZKQ1M4ZTh2Skx6OHFFVlZ0?=
 =?utf-8?B?cnEya003b0h4dDNZbzdvTU1tY2wrNkFVVEFabjIrY1BwSUp3aU1MK2dHdkFJ?=
 =?utf-8?B?cFQ0WnZ0Rk91aEtSN0VzUDhQdGZ1WElyQm1SNXFwWnplSitMM3F3SnhCNytC?=
 =?utf-8?B?MXBlR1c4MHcwOENzcVgyZHlJbUQwYUJLMkw1eVpOVG9MNk5MN0Z5b0hwdXRv?=
 =?utf-8?B?TkxCdUU5UThqdWZDZ2lYZlhCZkR0ZkNhZTN2TDk0VytPNTJJWTJjUmNPOHlj?=
 =?utf-8?B?SlhCZkNVYURXNDlIUWhQMnFzWk1UaTkvdnFUdGZJRFBFNUFEUzFSVjBveE5K?=
 =?utf-8?B?SWM4Zlo5WCtUeTBFVjQ3MWY5Y1hJYzdRUjVEbVdiYU1pZCtabU5EdnZzcFdX?=
 =?utf-8?B?M1Z3RTdsV1dFRkhpM0NKcXVsQklQejhjRnB5RzJ3OGxiOVNEbmlYSHZqQW1w?=
 =?utf-8?B?UnhkclRuUzVxT1U3a0xydUd0RFczcjVZeUZWc1l4UmxQd3FLdUo2eERHMmhW?=
 =?utf-8?B?ZVd6VTJkamY4RmJDMEowMDJHNkwrVllSRU1ubHROTlpEanVsM2prZ2ZEMmF2?=
 =?utf-8?B?Ny96R0dXR0Rzcml5bXdSbEg4aXN4SHBDbllHbzFNcHdXWW9KdWxCL0RmQU9t?=
 =?utf-8?B?cUVobjRnUFVheHcyd0pBNFNQbnJkQXczVnNwdXFyYjh2bHdIME1WSUpmUlVT?=
 =?utf-8?B?YU9BL3RhbmlabUd5RFNVdWpBMU9RL2sxRkJORGNzQktJSFhFVnIzWGczaWhr?=
 =?utf-8?B?TXhxUjhtckg4UEZ2eWQva1N1WUZXRURHbGovNndlZXllOHYraGJTTndvb2d3?=
 =?utf-8?B?Z0J5bEgySDB4S3VyVmJhdG16amRXSXJRUThGVHB5VUpVOHdtOGlncVJtUEVY?=
 =?utf-8?B?RU1hREVCRE9aQ1Z2ZmZockkza3hUZUgyUTNmM293akhvVVJsR01CMlBCSzc1?=
 =?utf-8?B?djM1N0FScTJEdWRqcFcxZy84QmVCNENzOFVwVHBPKzJJS1JFOUhVNGF5QWtT?=
 =?utf-8?B?NkNmUHcwaHFwNVloTWdTYkdWalprcm5kcGVBQVhGMUVURzNSd1JiUGlCZTJw?=
 =?utf-8?B?dDErY1lxNGVrdi9YOGZFUmpHSENZUHlkSGc4VGx5b2dacHVBMVBXNlhsNC80?=
 =?utf-8?B?MlY5UDdMR1BwNjU5YjVBaFdYb0tNeEdrL0VGL3IyZkxXaHdYNTVLaFc0eDV3?=
 =?utf-8?B?RnBubDJBYTlOeEIzcEdub2xNVnp5OGpOdzB6OGZhdGZzMkdVUkRNUnBJcXQ4?=
 =?utf-8?B?elJIM2RRR2FqZEJqUnB3RkNScWVzaUVVWWE1YW15VS9JTlFydithRU8reERP?=
 =?utf-8?B?UWs4ZDFtSTAvZlhYSVAwUzZwM3Nrc2lGdkl1WkhmbGZXUG50MFIrZE9Pc3o2?=
 =?utf-8?B?amxNdDhiOGNqZGd3NzZJdTJBOUJWcXl3R2tDUk15SDMxSHFHK1JGZ1VsSGtM?=
 =?utf-8?B?QlN6cGQzaXFXVjdsMWNNU2NDcHEwYkVkTEZpOVUzWE9SYk5qY0UvclhzNlRS?=
 =?utf-8?B?VnFseDF5UEtKWWZXQWd4aFdKVmNJaWhQRmhvR0ZYR3kwWnU0VSsrb0NMbWtG?=
 =?utf-8?B?eTNlWjRWdEl1Z0xYbjJqNzZockJ2RGFXM3lkY3dUMWwyL2hUWkEwTHFjaXJY?=
 =?utf-8?B?Mmc1YzhvK0pxWVJBR0xWMVhYWUU2S1lLNGNGUDJkbUhSM0NMNFRSdW9JTVdo?=
 =?utf-8?B?enJEWFR1eVl6Z2VOdTJvUUdieGJYWUNDcjhVVm1ldXZnZkVoN1B6TjdnTG9C?=
 =?utf-8?B?YVc4S0tSYlh6R0o5NG5MZHRJbVpsc1BwZ3Y3TEtqNkoyTGZEZDl6eWxrT0NX?=
 =?utf-8?B?U1dqRG1yUlRQTWc5amdnb3hZVXJVeTVmcGd4ZENTQXI3bGtIbnRqNTN1Q3pt?=
 =?utf-8?B?dEpubkFFenpweW9keFhpN3ZQdXJJcC9PamxOOFJjdDRsUkRsTlBSbXR1NHBv?=
 =?utf-8?Q?1wTYa2kc5JmAlfVcQdOWnqN1m?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab74c07-cbf6-4c0c-3a95-08dd1a73990f
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 06:09:55.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhV+V8mEEUo9EWdn8pcYCjeB1X7IoaISw4DYfG54D+hTf5S6cHs0RdVEKkSZ+pRQPE037Va++bkzmyJt2EKWEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8081

Hi Jacopo

Thanks very much for your reply.

On 2024/12/11 00:29, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
> On Thu, Dec 05, 2024 at 05:04:28PM +0800, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> This driver is used to receive mipi data from image sensor.
> It's usually nice to have a bit more descriptive commit message.
>
> Something like:
>
> Add a driver for the CSI-2 receiver unit found on .. SoC.
>
> Create a drivers/media/platform/c3 directory to host the driver
> and the forthcoming support for the Amlogic [precise name here] C3
> ISP.


Will add a bit more descriptive commit message.

>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   MAINTAINERS                                        |   7 +
>>   drivers/media/platform/amlogic/Kconfig             |   1 +
>>   drivers/media/platform/amlogic/Makefile            |   2 +
>>   drivers/media/platform/amlogic/c3/Kconfig          |   3 +
>>   drivers/media/platform/amlogic/c3/Makefile         |   3 +
>>   .../media/platform/amlogic/c3/mipi-csi2/Kconfig    |  16 +
>>   .../media/platform/amlogic/c3/mipi-csi2/Makefile   |   3 +
>>   .../platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c   | 900 +++++++++++++++++++++
>>   8 files changed, 935 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 21f855fe468b..9b405a694881 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1224,6 +1224,13 @@ F:     Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
>>   F:   drivers/perf/amlogic/
>>   F:   include/soc/amlogic/
>>
>> +AMLOGIC MIPI CSI2 DRIVER
>> +M:   Keke Li <keke.li@amlogic.com>
>> +L:   linux-media@vger.kernel.org
>> +S:   Maintained
>> +F:   Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> Possibily moved to the previous patch, not a big deal though


OK,  will be moved to the previous patch.

>> +F:   drivers/media/platform/amlogic/c3/mipi-csi2/
>> +
>>   AMLOGIC RTC DRIVER
>>   M:   Yiting Deng <yiting.deng@amlogic.com>
>>   M:   Xianwei Zhao <xianwei.zhao@amlogic.com>
>> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
>> index 5014957404e9..458acf3d5fa8 100644
>> --- a/drivers/media/platform/amlogic/Kconfig
>> +++ b/drivers/media/platform/amlogic/Kconfig
>> @@ -2,4 +2,5 @@
>>
>>   comment "Amlogic media platform drivers"
>>
>> +source "drivers/media/platform/amlogic/c3/Kconfig"
>>   source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
>> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
>> index d3cdb8fa4ddb..c744afcd1b9e 100644
>> --- a/drivers/media/platform/amlogic/Makefile
>> +++ b/drivers/media/platform/amlogic/Makefile
>> @@ -1,2 +1,4 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-y += c3/
>>   obj-y += meson-ge2d/
>> diff --git a/drivers/media/platform/amlogic/c3/Kconfig b/drivers/media/platform/amlogic/c3/Kconfig
>> new file mode 100644
>> index 000000000000..098d458747b8
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3/Kconfig
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +source "drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig"
>> diff --git a/drivers/media/platform/amlogic/c3/Makefile b/drivers/media/platform/amlogic/c3/Makefile
>> new file mode 100644
>> index 000000000000..a468fb782f94
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-y += mipi-csi2/
>> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig b/drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig
>> new file mode 100644
>> index 000000000000..0d7b2e203273
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig
>> @@ -0,0 +1,16 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config VIDEO_C3_MIPI_CSI2
>> +     tristate "Amlogic C3 MIPI CSI-2 receiver"
>> +     depends on ARCH_MESON || COMPILE_TEST
>> +     depends on VIDEO_DEV
>> +     depends on OF
>> +     select MEDIA_CONTROLLER
>> +     select V4L2_FWNODE
>> +     select VIDEO_V4L2_SUBDEV_API
>> +     help
>> +       Video4Linux2 driver for Amlogic C3 MIPI CSI-2 receiver.
>> +       C3 MIPI CSI-2 receiver is used to receive MIPI data from
>> +       image sensor.
>> +
>> +       To compile this driver as a module choose m here.
>> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/Makefile b/drivers/media/platform/amlogic/c3/mipi-csi2/Makefile
>> new file mode 100644
>> index 000000000000..cc08fc722bfd
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-$(CONFIG_VIDEO_C3_MIPI_CSI2) += c3-mipi-csi2.o
>> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
>> new file mode 100644
>> index 000000000000..861fccc4ca9e
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
>> @@ -0,0 +1,900 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> + */
>> +
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
>> +/* C3 CSI-2 submodule definition */
>> +enum {
>> +     SUBMD_APHY,
>> +     SUBMD_DPHY,
>> +     SUBMD_HOST,
>> +};
>> +
>> +#define CSI2_SUBMD_MASK                  GENMASK(17, 16)
>> +#define CSI2_SUBMD_SHIFT                 16
>> +#define CSI2_SUBMD(x)                    (((x) & (CSI2_SUBMD_MASK)) >> (CSI2_SUBMD_SHIFT))
>> +#define CSI2_REG_ADDR_MASK               GENMASK(15, 0)
>> +#define CSI2_REG_ADDR(x)                 ((x) & (CSI2_REG_ADDR_MASK))
>> +#define CSI2_REG_A(x)                    ((SUBMD_APHY << CSI2_SUBMD_SHIFT) | (x))
>> +#define CSI2_REG_D(x)                    ((SUBMD_DPHY << CSI2_SUBMD_SHIFT) | (x))
>> +#define CSI2_REG_H(x)                    ((SUBMD_HOST << CSI2_SUBMD_SHIFT) | (x))
>> +
>> +#define MIPI_CSI2_CLOCK_NUM_MAX                  3
>> +#define MIPI_CSI2_SUBDEV_NAME                    "c3-mipi-csi2"
>> +
>> +/* C3 CSI-2 APHY register */
>> +#define CSI_PHY_CNTL0                            CSI2_REG_A(0x44)
>> +#define CSI_PHY_CNTL0_HS_LP_BIAS_EN              BIT(10)
>> +#define CSI_PHY_CNTL0_HS_RX_TRIM_11              (11 << 11)
>> +#define CSI_PHY_CNTL0_LP_LOW_VTH_2               (2 << 16)
>> +#define CSI_PHY_CNTL0_LP_HIGH_VTH_4              (4 << 20)
>> +#define CSI_PHY_CNTL0_DATA_LANE0_HS_DIG_EN       BIT(24)
>> +#define CSI_PHY_CNTL0_DATA_LANE1_HS_DIG_EN       BIT(25)
>> +#define CSI_PHY_CNTL0_CLK0_LANE_HS_DIG_EN        BIT(26)
>> +#define CSI_PHY_CNTL0_DATA_LANE2_HS_DIG_EN       BIT(27)
>> +#define CSI_PHY_CNTL0_DATA_LANE3_HS_DIG_EN       BIT(28)
>> +
>> +#define CSI_PHY_CNTL1                            CSI2_REG_A(0x48)
>> +#define CSI_PHY_CNTL1_HS_EQ_CAP_SMALL            (2 << 16)
>> +#define CSI_PHY_CNTL1_HS_EQ_CAP_BIG              (3 << 16)
>> +#define CSI_PHY_CNTL1_HS_EQ_RES_MIN              (3 << 18)
>> +#define CSI_PHY_CNTL1_HS_EQ_RES_MED              (2 << 18)
>> +#define CSI_PHY_CNTL1_HS_EQ_RES_MAX              BIT(18)
>> +#define CSI_PHY_CNTL1_CLK_CHN_EQ_MAX_GAIN        BIT(20)
>> +#define CSI_PHY_CNTL1_DATA_CHN_EQ_MAX_GAIN       BIT(21)
>> +#define CSI_PHY_CNTL1_COM_BG_EN                  BIT(24)
>> +#define CSI_PHY_CNTL1_HS_SYNC_EN                 BIT(25)
>> +
>> +/* C3 CSI-2 DPHY register */
>> +#define MIPI_PHY_CTRL                                 CSI2_REG_D(0x00)
>> +#define MIPI_PHY_CTRL_DATA_LANE0_EN              (0 << 0)
>> +#define MIPI_PHY_CTRL_DATA_LANE0_DIS             BIT(0)
>> +#define MIPI_PHY_CTRL_DATA_LANE1_EN              (0 << 1)
>> +#define MIPI_PHY_CTRL_DATA_LANE1_DIS             BIT(1)
>> +#define MIPI_PHY_CTRL_DATA_LANE2_EN              (0 << 2)
>> +#define MIPI_PHY_CTRL_DATA_LANE2_DIS             BIT(2)
>> +#define MIPI_PHY_CTRL_DATA_LANE3_EN              (0 << 3)
>> +#define MIPI_PHY_CTRL_DATA_LANE3_DIS             BIT(3)
>> +#define MIPI_PHY_CTRL_CLOCK_LANE_EN              (0 << 4)
>> +#define MIPI_PHY_CTRL_CLOCK_LANE_DIS             BIT(4)
>> +
>> +#define MIPI_PHY_CLK_LANE_CTRL                        CSI2_REG_D(0x04)
>> +#define MIPI_PHY_CLK_LANE_CTRL_FORCE_ULPS_ENTER  BIT(0)
>> +#define MIPI_PHY_CLK_LANE_CTRL_FORCE_ULPS_EXIT   BIT(1)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS      (0 << 3)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_2    BIT(3)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_4    (2 << 3)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_8    (3 << 3)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_16   (4 << 3)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_EN      BIT(6)
>> +#define MIPI_PHY_CLK_LANE_CTRL_LPEN_DIS          BIT(7)
>> +#define MIPI_PHY_CLK_LANE_CTRL_END_EN            BIT(8)
>> +#define MIPI_PHY_CLK_LANE_CTRL_HS_RX_EN          BIT(9)
>> +
>> +#define MIPI_PHY_DATA_LANE_CTRL1                 CSI2_REG_D(0x0c)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_INSERT_ERRESC   BIT(0)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_HS_SYNC_CHK_EN  BIT(1)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_MASK       GENMASK(6, 2)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_ALL_EN     (0x1f << 2)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_DELAY_MASK GENMASK(9, 7)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_DELAY_3    (3 << 7)
>> +
>> +#define MIPI_PHY_TCLK_MISS                    CSI2_REG_D(0x10)
>> +#define MIPI_PHY_TCLK_MISS_CYCLES_MASK           GENMASK(7, 0)
>> +#define MIPI_PHY_TCLK_MISS_CYCLES_9              (9 << 0)
>> +
>> +#define MIPI_PHY_TCLK_SETTLE                  CSI2_REG_D(0x14)
>> +#define MIPI_PHY_TCLK_SETTLE_CYCLES_MASK         GENMASK(7, 0)
>> +#define MIPI_PHY_TCLK_SETTLE_CYCLES_31           (31 << 0)
>> +
>> +#define MIPI_PHY_THS_EXIT                     CSI2_REG_D(0x18)
>> +#define MIPI_PHY_THS_EXIT_CYCLES_MASK            GENMASK(7, 0)
>> +#define MIPI_PHY_THS_EXIT_CYCLES_8               (8 << 0)
>> +
>> +#define MIPI_PHY_THS_SKIP                     CSI2_REG_D(0x1c)
>> +#define MIPI_PHY_THS_SKIP_CYCLES_MASK            GENMASK(7, 0)
>> +#define MIPI_PHY_THS_SKIP_CYCLES_10              (10 << 0)
>> +
>> +#define MIPI_PHY_THS_SETTLE                   CSI2_REG_D(0x20)
>> +#define MIPI_PHY_THS_SETTLE_CYCLES_MASK          GENMASK(7, 0)
>> +
>> +#define MIPI_PHY_TINIT                                CSI2_REG_D(0x24)
>> +#define MIPI_PHY_TINIT_CYCLES_MASK               GENMASK(31, 0)
>> +#define MIPI_PHY_TINIT_CYCLES_20000              (20000 << 0)
>> +
>> +#define MIPI_PHY_TULPS_C                      CSI2_REG_D(0x28)
>> +#define MIPI_PHY_TULPS_C_CYCLES_MASK             GENMASK(31, 0)
>> +#define MIPI_PHY_TULPS_C_CYCLES_4096             (4096 << 0)
>> +
>> +#define MIPI_PHY_TULPS_S                      CSI2_REG_D(0x2c)
>> +#define MIPI_PHY_TULPS_S_CYCLES_MASK             GENMASK(31, 0)
>> +#define MIPI_PHY_TULPS_S_CYCLES_256              (256 << 0)
>> +
>> +#define MIPI_PHY_TMBIAS                          CSI2_REG_D(0x30)
>> +#define MIPI_PHY_TMBIAS_CYCLES_MASK              GENMASK(31, 0)
>> +#define MIPI_PHY_TMBIAS_CYCLES_256               (256 << 0)
>> +
>> +#define MIPI_PHY_TLP_EN_W                        CSI2_REG_D(0x34)
>> +#define MIPI_PHY_TLP_EN_W_CYCLES_MASK            GENMASK(31, 0)
>> +#define MIPI_PHY_TLP_EN_W_CYCLES_12              (12 << 0)
>> +
>> +#define MIPI_PHY_TLPOK                                CSI2_REG_D(0x38)
>> +#define MIPI_PHY_TLPOK_CYCLES_MASK               GENMASK(31, 0)
>> +#define MIPI_PHY_TLPOK_CYCLES_256                (256 << 0)
>> +
>> +#define MIPI_PHY_TWD_INIT                     CSI2_REG_D(0x3c)
>> +#define MIPI_PHY_TWD_INIT_DOG_MASK               GENMASK(31, 0)
>> +#define MIPI_PHY_TWD_INIT_DOG_0X400000           (0x400000 << 0)
>> +
>> +#define MIPI_PHY_TWD_HS                          CSI2_REG_D(0x40)
>> +#define MIPI_PHY_TWD_HS_DOG_MASK                 GENMASK(31, 0)
>> +#define MIPI_PHY_TWD_HS_DOG_0X400000             (0x400000 << 0)
>> +
>> +#define MIPI_PHY_MUX_CTRL0                    CSI2_REG_D(0x284)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_MASK        GENMASK(3, 0)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE0       (0 << 0)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE1       BIT(0)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE2       (2 << 0)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE3       (3 << 0)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_MASK        GENMASK(7, 4)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE0       (0 << 4)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE1       BIT(4)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE2       (2 << 4)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE3       (3 << 4)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_MASK        GENMASK(11, 8)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE0       (0 << 8)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE1       BIT(8)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE2       (2 << 8)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE3       (3 << 8)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_MASK        GENMASK(14, 12)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE0       (0 << 12)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE1       BIT(12)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE2       (2 << 12)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE3       (3 << 12)
>> +
>> +#define MIPI_PHY_MUX_CTRL1                    CSI2_REG_D(0x288)
>> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_MASK        GENMASK(3, 0)
>> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN0       (0 << 0)
>> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN1       BIT(0)
>> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN2       (2 << 0)
>> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN3       (3 << 0)
>> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_MASK        GENMASK(7, 4)
>> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN0       (0 << 4)
>> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN1       BIT(4)
>> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN2       (2 << 4)
>> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN3       (3 << 4)
>> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_MASK        GENMASK(11, 8)
>> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN0       (0 << 8)
>> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN1       BIT(8)
>> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN2       (2 << 8)
>> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN3       (3 << 8)
>> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_MASK        GENMASK(14, 12)
>> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN0       (0 << 12)
>> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN1       BIT(12)
>> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN2       (2 << 12)
>> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN3       (3 << 12)
>> +
>> +/* C3 CSI-2 HOST register */
>> +#define CSI2_HOST_N_LANES                        CSI2_REG_H(0x04)
>> +#define CSI2_HOST_N_LANES_MASK                   GENMASK(1, 0)
>> +#define CSI2_HOST_N_LANES_1                      (0 << 0)
>> +#define CSI2_HOST_N_LANES_2                      BIT(0)
>> +#define CSI2_HOST_N_LANES_3                      (2 << 0)
>> +#define CSI2_HOST_N_LANES_4                      (3 << 0)
>> +
>> +#define CSI2_HOST_CSI2_RESETN                    CSI2_REG_H(0x10)
>> +#define CSI2_HOST_CSI2_RESETN_MASK               BIT(0)
>> +#define CSI2_HOST_CSI2_RESETN_ACTIVE             (0 << 0)
>> +#define CSI2_HOST_CSI2_RESETN_EXIT               BIT(0)
>> +
>> +#define MIPI_CSI2_MAX_WIDTH                      2888
>> +#define MIPI_CSI2_MIN_WIDTH                      160
>> +#define MIPI_CSI2_MAX_HEIGHT                     2240
>> +#define MIPI_CSI2_MIN_HEIGHT                     120
>> +#define MIPI_CSI2_DEFAULT_WIDTH                  1920
>> +#define MIPI_CSI2_DEFAULT_HEIGHT                 1080
>> +#define MIPI_CSI2_DEFAULT_FMT                    MEDIA_BUS_FMT_SRGGB10_1X10
> All the above are indentend with spaces and not tabs, I'm surprised
> checkpatch.pl doesn't complain. If it's fine with the tool, it's fine
> with me as well :)
>

Will use tabs to indent.

>> +
>> +/* C3 CSI-2 pad list */
>> +enum {
>> +     MIPI_CSI2_PAD_SINK,
>> +     MIPI_CSI2_PAD_SRC,
>> +     MIPI_CSI2_PAD_MAX
>> +};
>> +
>> +/*
>> + * struct csi_info - MIPI CSI2 information
>> + *
>> + * @clocks: array of MIPI CSI2 clock names
>> + * @clock_rates: array of MIPI CSI2 clock rate
>> + * @clock_num: actual clock number
>> + */
>> +struct csi_info {
>> +     char *clocks[MIPI_CSI2_CLOCK_NUM_MAX];
>> +     u32 clock_rates[MIPI_CSI2_CLOCK_NUM_MAX];
>> +     u32 clock_num;
>> +};
>> +
>> +/*
>> + * struct csi_device - MIPI CSI2 platform device
>> + *
>> + * @dev: pointer to the struct device
>> + * @aphy: MIPI CSI2 aphy register address
>> + * @dphy: MIPI CSI2 dphy register address
>> + * @host: MIPI CSI2 host register address
>> + * @clks: array of MIPI CSI2 clocks
>> + * @sd: MIPI CSI2 sub-device
>> + * @pads: MIPI CSI2 sub-device pads
>> + * @notifier: notifier to register on the v4l2-async API
>> + * @src_sd: source sub-device
>> + * @bus: MIPI CSI2 bus information
>> + * @src_sd_pad: source sub-device pad
>> + * @info: version-specific MIPI CSI2 information
>> + */
>> +struct csi_device {
>> +     struct device *dev;
>> +     void __iomem *aphy;
>> +     void __iomem *dphy;
>> +     void __iomem *host;
>> +     struct clk_bulk_data clks[MIPI_CSI2_CLOCK_NUM_MAX];
>> +
>> +     struct v4l2_subdev sd;
>> +     struct media_pad pads[MIPI_CSI2_PAD_MAX];
>> +     struct v4l2_async_notifier notifier;
>> +     struct v4l2_subdev *src_sd;
>> +     struct v4l2_mbus_config_mipi_csi2 bus;
>> +
>> +     u16 src_sd_pad;
>> +     const struct csi_info *info;
>> +};
>> +
>> +static const u32 c3_mipi_csi_formats[] = {
>> +     MEDIA_BUS_FMT_SBGGR10_1X10,
>> +     MEDIA_BUS_FMT_SGBRG10_1X10,
>> +     MEDIA_BUS_FMT_SGRBG10_1X10,
>> +     MEDIA_BUS_FMT_SRGGB10_1X10,
>> +     MEDIA_BUS_FMT_SBGGR12_1X12,
>> +     MEDIA_BUS_FMT_SGBRG12_1X12,
>> +     MEDIA_BUS_FMT_SGRBG12_1X12,
>> +     MEDIA_BUS_FMT_SRGGB12_1X12,
>> +};
>> +
>> +/* Hardware configuration */
>> +
>> +static void c3_mipi_csi_write(struct csi_device *csi, u32 reg, u32 val)
>> +{
>> +     void __iomem *addr;
>> +
>> +     switch (CSI2_SUBMD(reg)) {
>> +     case SUBMD_APHY:
>> +             addr = csi->aphy + CSI2_REG_ADDR(reg);
>> +             break;
>> +     case SUBMD_DPHY:
>> +             addr = csi->dphy + CSI2_REG_ADDR(reg);
>> +             break;
>> +     case SUBMD_HOST:
>> +             addr = csi->host + CSI2_REG_ADDR(reg);
>> +             break;
>> +     default:
>> +             dev_err(csi->dev, "Invalid sub-module: %lu\n", CSI2_SUBMD(reg));
>> +             return;
>> +     }
>> +
>> +     writel(val, addr);
>> +}
>> +
>> +static void c3_mipi_csi_cfg_aphy(struct csi_device *csi)
>> +{
>> +     c3_mipi_csi_write(csi, CSI_PHY_CNTL0,
>> +                       CSI_PHY_CNTL0_HS_LP_BIAS_EN |
>> +                       CSI_PHY_CNTL0_HS_RX_TRIM_11 |
>> +                       CSI_PHY_CNTL0_LP_LOW_VTH_2 |
>> +                       CSI_PHY_CNTL0_LP_HIGH_VTH_4 |
>> +                       CSI_PHY_CNTL0_DATA_LANE0_HS_DIG_EN |
>> +                       CSI_PHY_CNTL0_DATA_LANE1_HS_DIG_EN |
>> +                       CSI_PHY_CNTL0_CLK0_LANE_HS_DIG_EN |
>> +                       CSI_PHY_CNTL0_DATA_LANE2_HS_DIG_EN |
>> +                       CSI_PHY_CNTL0_DATA_LANE3_HS_DIG_EN);
>> +
>> +     c3_mipi_csi_write(csi, CSI_PHY_CNTL1,
>> +                       CSI_PHY_CNTL1_HS_EQ_CAP_SMALL |
>> +                       CSI_PHY_CNTL1_HS_EQ_RES_MED |
>> +                       CSI_PHY_CNTL1_CLK_CHN_EQ_MAX_GAIN |
>> +                       CSI_PHY_CNTL1_DATA_CHN_EQ_MAX_GAIN |
>> +                       CSI_PHY_CNTL1_COM_BG_EN |
>> +                       CSI_PHY_CNTL1_HS_SYNC_EN);
>> +}
>> +
>> +static void c3_mipi_csi_cfg_dphy(struct csi_device *csi, s64 rate)
>> +{
>> +     u32 val;
>> +     u32 settle;
>> +
>> +     /* Calculate the high speed settle */
>> +     val = DIV_ROUND_UP(1000000000, rate);
>> +     settle = (16 * val + 230) / 10;
>> +
>> +     c3_mipi_csi_write(csi, MIPI_PHY_CLK_LANE_CTRL,
>> +                       MIPI_PHY_CLK_LANE_CTRL_HS_RX_EN |
>> +                       MIPI_PHY_CLK_LANE_CTRL_END_EN |
>> +                       MIPI_PHY_CLK_LANE_CTRL_LPEN_DIS |
>> +                       MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_EN |
>> +                       MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_8);
>> +
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TCLK_MISS, MIPI_PHY_TCLK_MISS_CYCLES_9);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TCLK_SETTLE, MIPI_PHY_TCLK_SETTLE_CYCLES_31);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_EXIT, MIPI_PHY_THS_EXIT_CYCLES_8);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_SKIP, MIPI_PHY_THS_SKIP_CYCLES_10);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_SETTLE, settle);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TINIT, MIPI_PHY_TINIT_CYCLES_20000);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TMBIAS, MIPI_PHY_TMBIAS_CYCLES_256);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TULPS_C, MIPI_PHY_TULPS_C_CYCLES_4096);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TULPS_S, MIPI_PHY_TULPS_S_CYCLES_256);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TLP_EN_W, MIPI_PHY_TLP_EN_W_CYCLES_12);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TLPOK, MIPI_PHY_TLPOK_CYCLES_256);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TWD_INIT, MIPI_PHY_TWD_INIT_DOG_0X400000);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TWD_HS, MIPI_PHY_TWD_HS_DOG_0X400000);
>> +
>> +     c3_mipi_csi_write(csi, MIPI_PHY_DATA_LANE_CTRL1,
>> +                       MIPI_PHY_DATA_LANE_CTRL1_INSERT_ERRESC |
>> +                       MIPI_PHY_DATA_LANE_CTRL1_HS_SYNC_CHK_EN |
>> +                       MIPI_PHY_DATA_LANE_CTRL1_PIPE_ALL_EN |
>> +                       MIPI_PHY_DATA_LANE_CTRL1_PIPE_DELAY_3);
>> +
>> +     /* Set the order of lanes */
>> +     c3_mipi_csi_write(csi, MIPI_PHY_MUX_CTRL0,
>> +                       MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE3 |
>> +                       MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE2 |
>> +                       MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE1 |
>> +                       MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE0);
>> +
>> +     c3_mipi_csi_write(csi, MIPI_PHY_MUX_CTRL1,
>> +                       MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN3 |
>> +                       MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN2 |
>> +                       MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN1 |
>> +                       MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN0);
>> +
>> +     /* Enable digital data and clock lanes */
>> +     c3_mipi_csi_write(csi, MIPI_PHY_CTRL,
>> +                       MIPI_PHY_CTRL_DATA_LANE0_EN |
>> +                       MIPI_PHY_CTRL_DATA_LANE1_EN |
>> +                       MIPI_PHY_CTRL_DATA_LANE2_EN |
>> +                       MIPI_PHY_CTRL_DATA_LANE3_EN |
>> +                       MIPI_PHY_CTRL_CLOCK_LANE_EN);
>> +}
>> +
>> +static void c3_mipi_csi_cfg_host(struct csi_device *csi)
>> +{
>> +     /* Reset CSI-2 controller output */
>> +     c3_mipi_csi_write(csi, CSI2_HOST_CSI2_RESETN, CSI2_HOST_CSI2_RESETN_ACTIVE);
>> +     c3_mipi_csi_write(csi, CSI2_HOST_CSI2_RESETN, CSI2_HOST_CSI2_RESETN_EXIT);
>> +
>> +     /* Set data lane number */
>> +     c3_mipi_csi_write(csi, CSI2_HOST_N_LANES, csi->bus.num_data_lanes - 1);
>> +}
>> +
>> +static int c3_mipi_csi_start_stream(struct csi_device *csi)
>> +{
>> +     s64 link_freq;
>> +     s64 lane_rate;
>> +
>> +     link_freq = v4l2_get_link_freq(csi->src_sd->ctrl_handler, 0, 0);
>> +     if (link_freq < 0) {
>> +             dev_err(csi->dev, "Unable to obtain link frequency: %lld\n", link_freq);
>> +             return link_freq;
>> +     }
>> +
>> +     lane_rate = link_freq * 2;
>> +     if (lane_rate > 1500000000) {
>> +             dev_err(csi->dev, "Invalid lane rate: %lld\n", lane_rate);
>> +             return -EINVAL;
>> +     }
>> +
>> +     c3_mipi_csi_cfg_aphy(csi);
>> +     c3_mipi_csi_cfg_dphy(csi, lane_rate);
>> +     c3_mipi_csi_cfg_host(csi);
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
>> +                                   struct v4l2_subdev_state *state,
>> +                                   u32 pad, u64 streams_mask)
>> +{
>> +     struct csi_device *csi = v4l2_get_subdevdata(sd);
>> +     u64 sink_streams;
>> +     int ret;
>> +
>> +     pm_runtime_resume_and_get(csi->dev);
>> +
>> +     c3_mipi_csi_start_stream(csi);
>> +
>> +     sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +                                                    MIPI_CSI2_PAD_SINK,
>> +                                                    &streams_mask);
>> +     ret = v4l2_subdev_enable_streams(csi->src_sd,
>> +                                      csi->src_sd_pad,
>> +                                      sink_streams);
> You don't need this (and I think it works "by chance" because it returns 0).
> This function helps translate streams according
> to a routing table, and this driver doesn't support routing. It means
> it only knows about a single stream sent by the remote subdevice (the
> image sensor in this case) from its single pad.
>
> I think you can simply forward the call to the remote subdevice by
> calling enable_streams replacing sink_streams with 0.


OK, will check this issue.

>> +     if (ret) {
>> +             pm_runtime_put(csi->dev);
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_disable_streams(struct v4l2_subdev *sd,
>> +                                    struct v4l2_subdev_state *state,
>> +                                    u32 pad, u64 streams_mask)
>> +{
>> +     struct csi_device *csi = v4l2_get_subdevdata(sd);
>> +     u64 sink_streams;
>> +     int ret;
>> +
>> +     sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +                                                    MIPI_CSI2_PAD_SINK,
>> +                                                    &streams_mask);
>> +     ret = v4l2_subdev_disable_streams(csi->src_sd,
>> +                                       csi->src_sd_pad,
>> +                                       sink_streams);
>> +     if (ret)
>> +             dev_err(csi->dev, "Failed to disable %s\n", csi->src_sd->name);
>> +
>> +     pm_runtime_put(csi->dev);
>> +
>> +     return ret;
>> +}
>> +
>> +static int c3_mipi_csi_cfg_routing(struct v4l2_subdev *sd,
>> +                                struct v4l2_subdev_state *state,
>> +                                struct v4l2_subdev_krouting *routing)
>> +{
>> +     static const struct v4l2_mbus_framefmt format = {
>> +             .width = MIPI_CSI2_DEFAULT_WIDTH,
>> +             .height = MIPI_CSI2_DEFAULT_HEIGHT,
>> +             .code = MIPI_CSI2_DEFAULT_FMT,
>> +             .field = V4L2_FIELD_NONE,
>> +             .colorspace = V4L2_COLORSPACE_RAW,
>> +             .ycbcr_enc = V4L2_YCBCR_ENC_601,
>> +             .quantization = V4L2_QUANTIZATION_FULL_RANGE,
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
>
> I still think you don't need routing at all.
>
> This driver doesn't enable V4L2_SUBDEV_FL_STREAMS, so the
> g_routing/s_routing operations are disallowed by the core:
> https://elixir.bootlin.com/linux/v6.12.4/source/drivers/media/v4l2-core/v4l2-subdev.c#L964
>

OK,  I have verified your suggestion, the result is okay.

Will remove c3_mipi_csi_cfg_routing() and c3_mipi_csi_init_routing().

>> +
>> +static int c3_mipi_csi_init_routing(struct v4l2_subdev *sd,
>> +                                 struct v4l2_subdev_state *state)
>> +{
>> +     struct v4l2_subdev_route routes;
>> +     struct v4l2_subdev_krouting routing;
>> +
>> +     routes.sink_pad = MIPI_CSI2_PAD_SINK;
>> +     routes.sink_stream = 0;
>> +     routes.source_pad = MIPI_CSI2_PAD_SRC;
>> +     routes.source_stream = 0;
>> +     routes.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>> +
>> +     routing.num_routes = 1;
>> +     routing.routes = &routes;
>> +
>> +     return c3_mipi_csi_cfg_routing(sd, state, &routing);
>> +}
>> +
>> +static int c3_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
>> +                                   struct v4l2_subdev_state *state,
>> +                                   struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +     switch (code->pad) {
>> +     case MIPI_CSI2_PAD_SINK:
>> +             if (code->index >= ARRAY_SIZE(c3_mipi_csi_formats))
>> +                     return -EINVAL;
>> +
>> +             code->code = c3_mipi_csi_formats[code->index];
>> +             break;
>> +     case MIPI_CSI2_PAD_SRC:
>> +             struct v4l2_mbus_framefmt *fmt;
>> +
>> +             if (code->index)
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
>> +static int c3_mipi_csi_set_fmt(struct v4l2_subdev *sd,
>> +                            struct v4l2_subdev_state *state,
>> +                            struct v4l2_subdev_format *format)
>> +{
>> +     struct v4l2_mbus_framefmt *fmt;
>> +     unsigned int i;
>> +
>> +     if (format->pad != MIPI_CSI2_PAD_SINK)
>> +             return v4l2_subdev_get_fmt(sd, state, format);
>> +
>> +     fmt = v4l2_subdev_state_get_format(state, format->pad);
>> +
>> +     for (i = 0; i < ARRAY_SIZE(c3_mipi_csi_formats); i++) {
>> +             if (format->format.code == c3_mipi_csi_formats[i]) {
>> +                     fmt->code = c3_mipi_csi_formats[i];
>> +                     break;
>> +             }
>> +     }
>> +
>> +     if (i == ARRAY_SIZE(c3_mipi_csi_formats))
>> +             fmt->code = c3_mipi_csi_formats[0];
>> +
>> +     fmt->width = clamp_t(u32, format->format.width,
>> +                          MIPI_CSI2_MIN_WIDTH, MIPI_CSI2_MAX_WIDTH);
>> +     fmt->height = clamp_t(u32, format->format.height,
>> +                           MIPI_CSI2_MIN_HEIGHT, MIPI_CSI2_MAX_HEIGHT);
>> +     fmt->colorspace = V4L2_COLORSPACE_RAW;
>> +     fmt->xfer_func = V4L2_XFER_FUNC_NONE;
>> +     fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
>> +     fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>> +
>> +     format->format = *fmt;
>> +
>> +     /* Synchronize the format to source pad */
>> +     fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SRC);
>> +     *fmt = format->format;
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_init_state(struct v4l2_subdev *sd,
>> +                               struct v4l2_subdev_state *state)
>> +{
>> +     struct v4l2_mbus_framefmt *sink_fmt;
>> +     struct v4l2_mbus_framefmt *src_fmt;
>> +
>> +     sink_fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SINK);
>> +     src_fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SRC);
>> +
>> +     sink_fmt->width = MIPI_CSI2_DEFAULT_WIDTH;
>> +     sink_fmt->height = MIPI_CSI2_DEFAULT_HEIGHT;
>> +     sink_fmt->field = V4L2_FIELD_NONE;
>> +     sink_fmt->code = MIPI_CSI2_DEFAULT_FMT;
>> +     sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
>> +     sink_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
>> +     sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
>> +     sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>> +
>> +     *src_fmt = *sink_fmt;
>> +
>> +     return c3_mipi_csi_init_routing(sd, state);
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops c3_mipi_csi_pad_ops = {
>> +     .enum_mbus_code = c3_mipi_csi_enum_mbus_code,
>> +     .get_fmt = v4l2_subdev_get_fmt,
>> +     .set_fmt = c3_mipi_csi_set_fmt,
>> +     .enable_streams = c3_mipi_csi_enable_streams,
>> +     .disable_streams = c3_mipi_csi_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_ops c3_mipi_csi_subdev_ops = {
>> +     .pad = &c3_mipi_csi_pad_ops,
>> +};
>> +
>> +static const struct v4l2_subdev_internal_ops c3_mipi_csi_internal_ops = {
>> +     .init_state = c3_mipi_csi_init_state,
>> +};
>> +
>> +/* Media entity operations */
>> +static const struct media_entity_operations c3_mipi_csi_entity_ops = {
>> +     .link_validate = v4l2_subdev_link_validate,
>> +};
>> +
>> +/* PM runtime */
>> +
>> +static int c3_mipi_csi_runtime_suspend(struct device *dev)
>> +{
>> +     struct csi_device *csi = dev_get_drvdata(dev);
>> +
>> +     clk_bulk_disable_unprepare(csi->info->clock_num, csi->clks);
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_runtime_resume(struct device *dev)
>> +{
>> +     struct csi_device *csi = dev_get_drvdata(dev);
>> +
>> +     return clk_bulk_prepare_enable(csi->info->clock_num, csi->clks);
>> +}
>> +
>> +static const struct dev_pm_ops c3_mipi_csi_pm_ops = {
>> +     SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                         pm_runtime_force_resume)
>> +     RUNTIME_PM_OPS(c3_mipi_csi_runtime_suspend,
>> +                    c3_mipi_csi_runtime_resume, NULL)
>> +};
>> +
>> +/* Probe/remove & platform driver */
>> +
>> +static int c3_mipi_csi_subdev_init(struct csi_device *csi)
>> +{
>> +     struct v4l2_subdev *sd = &csi->sd;
>> +     int ret;
>> +
>> +     v4l2_subdev_init(sd, &c3_mipi_csi_subdev_ops);
>> +     sd->owner = THIS_MODULE;
>> +     sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +     sd->internal_ops = &c3_mipi_csi_internal_ops;
>> +     snprintf(sd->name, sizeof(sd->name), "%s", MIPI_CSI2_SUBDEV_NAME);
>> +
>> +     sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> +     sd->entity.ops = &c3_mipi_csi_entity_ops;
>> +
>> +     sd->dev = csi->dev;
>> +     v4l2_set_subdevdata(sd, csi);
>> +
>> +     csi->pads[MIPI_CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>> +     csi->pads[MIPI_CSI2_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>> +     ret = media_entity_pads_init(&sd->entity, MIPI_CSI2_PAD_MAX, csi->pads);
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
>> +static void c3_mipi_csi_subdev_deinit(struct csi_device *csi)
>> +{
>> +     v4l2_subdev_cleanup(&csi->sd);
>> +     media_entity_cleanup(&csi->sd.entity);
>> +}
>> +
>> +/* Subdev notifier register */
>> +static int c3_mipi_csi_notify_bound(struct v4l2_async_notifier *notifier,
>> +                                 struct v4l2_subdev *sd,
>> +                                 struct v4l2_async_connection *asc)
>> +{
>> +     struct csi_device *csi = v4l2_get_subdevdata(notifier->sd);
>> +     struct media_pad *sink = &csi->sd.entity.pads[MIPI_CSI2_PAD_SINK];
>> +     int ret;
>> +
>> +     ret = media_entity_get_fwnode_pad(&sd->entity,
>> +                                       sd->fwnode, MEDIA_PAD_FL_SOURCE);
>> +     if (ret < 0) {
>> +             dev_err(csi->dev, "Failed to find pad for %s\n", sd->name);
>> +             return ret;
>> +     }
>> +
>> +     csi->src_sd = sd;
>> +     csi->src_sd_pad = ret;
>> +
>> +     return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
>> +                                            MEDIA_LNK_FL_IMMUTABLE);
>> +}
>> +
>> +static const struct v4l2_async_notifier_operations c3_mipi_csi_notify_ops = {
>> +     .bound = c3_mipi_csi_notify_bound,
>> +};
>> +
>> +static int c3_mipi_csi_async_register(struct csi_device *csi)
>> +{
>> +     struct v4l2_fwnode_endpoint vep = {
>> +             .bus_type = V4L2_MBUS_CSI2_DPHY,
>> +     };
>> +     struct v4l2_async_connection *asc;
>> +     struct fwnode_handle *ep;
>> +     int ret;
>> +
>> +     v4l2_async_subdev_nf_init(&csi->notifier, &csi->sd);
>> +
>> +     ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
>> +                                          FWNODE_GRAPH_ENDPOINT_NEXT);
>> +     if (!ep)
>> +             return -ENOTCONN;
>> +
>> +     ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>> +     if (ret)
>> +             goto err_put_handle;
>> +
>> +     csi->bus = vep.bus.mipi_csi2;
>> +     if (csi->bus.num_data_lanes < 1 || csi->bus.num_data_lanes > 4) {
>> +             dev_err(csi->dev, "Unsupported data lanes number\n");
>> +             goto err_put_handle;
>> +     }
>> +
>> +     asc = v4l2_async_nf_add_fwnode_remote(&csi->notifier, ep,
>> +                                           struct v4l2_async_connection);
>> +     if (IS_ERR(asc)) {
>> +             ret = PTR_ERR(asc);
>> +             goto err_put_handle;
>> +     }
>> +
>> +     csi->notifier.ops = &c3_mipi_csi_notify_ops;
>> +     ret = v4l2_async_nf_register(&csi->notifier);
>> +     if (ret)
>> +             goto err_cleanup_nf;
>> +
>> +     ret = v4l2_async_register_subdev(&csi->sd);
>> +     if (ret)
>> +             goto err_unregister_nf;
>> +
>> +     fwnode_handle_put(ep);
>> +
>> +     return 0;
>> +
>> +err_unregister_nf:
>> +     v4l2_async_nf_unregister(&csi->notifier);
>> +err_cleanup_nf:
>> +     v4l2_async_nf_cleanup(&csi->notifier);
>> +err_put_handle:
>> +     fwnode_handle_put(ep);
>> +     return ret;
>> +}
>> +
>> +static void c3_mipi_csi_async_unregister(struct csi_device *csi)
>> +{
>> +     v4l2_async_unregister_subdev(&csi->sd);
>> +     v4l2_async_nf_unregister(&csi->notifier);
>> +     v4l2_async_nf_cleanup(&csi->notifier);
>> +}
>> +
>> +static int c3_mipi_csi_ioremap_resource(struct csi_device *csi)
>> +{
>> +     struct device *dev = csi->dev;
>> +     struct platform_device *pdev = to_platform_device(dev);
>> +
>> +     csi->aphy = devm_platform_ioremap_resource_byname(pdev, "aphy");
>> +     if (IS_ERR(csi->aphy))
>> +             return PTR_ERR(csi->aphy);
>> +
>> +     csi->dphy = devm_platform_ioremap_resource_byname(pdev, "dphy");
>> +     if (IS_ERR(csi->dphy))
>> +             return PTR_ERR(csi->dphy);
>> +
>> +     csi->host = devm_platform_ioremap_resource_byname(pdev, "host");
>> +     if (IS_ERR(csi->host))
>> +             return PTR_ERR(csi->host);
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_configure_clocks(struct csi_device *csi)
>> +{
>> +     const struct csi_info *info = csi->info;
>> +     int ret;
>> +     u32 i;
>> +
>> +     for (i = 0; i < info->clock_num; i++)
>> +             csi->clks[i].id = info->clocks[i];
>> +
>> +     ret = devm_clk_bulk_get(csi->dev, info->clock_num, csi->clks);
>> +     if (ret)
>> +             return ret;
>> +
>> +     for (i = 0; i < info->clock_num; i++) {
>> +             if (!info->clock_rates[i])
>> +                     continue;
> Empty line maybe


Will add a blank line.

>> +             ret = clk_set_rate(csi->clks[i].clk, info->clock_rates[i]);
>> +             if (ret) {
>> +                     dev_err(csi->dev, "Failed to set %s rate %u\n", info->clocks[i],
>> +                             info->clock_rates[i]);
> should you devm_clk_bulk_release() ?
>
I think no need to use devm_clk_bulk_release() directly.

If probe() is failed, kernel can automatically release these clocks.

https://elixir.bootlin.com/linux/v6.13-rc2/source/drivers/clk/clk-devres.c#L142

>> +                     return ret;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev = &pdev->dev;
>> +     struct csi_device *csi;
>> +     int ret;
>> +
>> +     csi = devm_kzalloc(dev, sizeof(*csi), GFP_KERNEL);
>> +     if (!csi)
>> +             return -ENOMEM;
>> +
>> +     csi->info = of_device_get_match_data(dev);
>> +     csi->dev = dev;
>> +
>> +     ret = c3_mipi_csi_ioremap_resource(csi);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "Failed to ioremap resource\n");
>> +
>> +     ret = c3_mipi_csi_configure_clocks(csi);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "Failed to configure clocks\n");
>> +
>> +     platform_set_drvdata(pdev, csi);
>> +
>> +     pm_runtime_enable(dev);
>> +
>> +     ret = c3_mipi_csi_subdev_init(csi);
>> +     if (ret)
>> +             goto err_disable_runtime_pm;
>> +
>> +     ret = c3_mipi_csi_async_register(csi);
>> +     if (ret)
>> +             goto err_deinit_subdev;
>> +
>> +     return 0;
>> +
>> +err_deinit_subdev:
>> +     c3_mipi_csi_subdev_deinit(csi);
>> +err_disable_runtime_pm:
>> +     pm_runtime_disable(dev);
>> +     return ret;
>> +};
>> +
>> +static void c3_mipi_csi_remove(struct platform_device *pdev)
>> +{
>> +     struct csi_device *csi = platform_get_drvdata(pdev);
>> +
>> +     c3_mipi_csi_async_unregister(csi);
>> +     c3_mipi_csi_subdev_deinit(csi);
>> +
>> +     pm_runtime_disable(&pdev->dev);
>> +};
>> +
>> +static const struct csi_info c3_mipi_csi_info = {
>> +     .clocks = {"vapb", "phy0"},
>> +     .clock_rates = {0, 200000000},
>> +     .clock_num = 2
>> +};
>> +
>> +static const struct of_device_id c3_mipi_csi_of_match[] = {
>> +     { .compatible = "amlogic,c3-mipi-csi2",
> Kind of a weird indent. What about


Will check this indent.

>
>          {
>                  .compatible = "amlogic,c3-mipi-csi2",
>                  .data = &c3_mipi_csi_info,
>          },
>
> Nice overall, remove the last remaining bits about routing and next
> version is good to go in my opinion.
>
> Thanks
>    j
>
>

Thanks!

>> +       .data = &c3_mipi_csi_info,
>> +     },
>> +     { },
>> +};
>> +MODULE_DEVICE_TABLE(of, c3_mipi_csi_of_match);
>> +
>> +static struct platform_driver c3_mipi_csi_driver = {
>> +     .probe = c3_mipi_csi_probe,
>> +     .remove = c3_mipi_csi_remove,
>> +     .driver = {
>> +             .name = "c3-mipi-csi2",
>> +             .of_match_table = c3_mipi_csi_of_match,
>> +             .pm = pm_ptr(&c3_mipi_csi_pm_ops),
>> +     },
>> +};
>> +
>> +module_platform_driver(c3_mipi_csi_driver);
>> +
>> +MODULE_AUTHOR("Keke Li <keke.li@amlogic.com>");
>> +MODULE_DESCRIPTION("Amlogic C3 MIPI CSI-2 receiver");
>> +MODULE_LICENSE("GPL");
>>
>> --
>> 2.47.0
>>
>>
>>

