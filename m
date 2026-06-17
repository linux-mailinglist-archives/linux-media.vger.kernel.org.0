Return-Path: <linux-media+bounces-65070-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YtlKKZPqMWqrrgUAu9opvQ
	(envelope-from <linux-media+bounces-65070-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 02:30:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 851C6695D89
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 02:30:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=PZk9maJw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65070-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65070-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=windriver.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96A5A30987D8
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 00:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289B6192D97;
	Wed, 17 Jun 2026 00:29:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D483DEEA8;
	Wed, 17 Jun 2026 00:29:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781656196; cv=fail; b=NY02t5Lf/TrrLhnZgKH5waDfZuncAQGbe8FsSo34551cvWENgru8U1DBLBwIS0Isb2EL/tiwQ4GXUD0Xe72ES06DD7lJA6n+tVJOaEdNxFzlQkTOKjK6oQvoOBVZi87/OvspYUm49Q9hJgi7b5TRKWb13uAFpMVOLJZH18RznnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781656196; c=relaxed/simple;
	bh=QqwOVEZh9Ut1pbcAntKDvLq47k46A9vGu6Bj5hXLfX8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J7lbrXpgvuwumVl9gCGZDdzLg15gJEywLcs0sxA3OPcSJnTGfolrfD2mCO2qmFLjTc3bczd3mXM5KTate+4upCUBDPfZOgR+FcSnC5NSyx9amqtoy2Vz9+z3wiHFF+ryrTL59ynkBfWrFdX/o7AKBMXsnBkdVQ00QAWSGz9J3zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=PZk9maJw; arc=fail smtp.client-ip=205.220.178.238
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H00r7u375953;
	Wed, 17 Jun 2026 00:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ytuhS22cF+H5ve9faQgaPittdOfvePEdXhskFeUU2Vs=; b=
	PZk9maJwsEAvidbxfS8bDKZ3wa47+SRDs0X5H9+P4VfJNT+Oi4y/FWR2YTtF8OK2
	d2kdwABmaoDH04rQZqgBgKUBTmrXSEyLYtEg+DWH1tUDHwCU8z9YruDxXzBfvyH7
	HCnWQBK3qfaBbhC1ycq9B1iWFsEZ0GplIM3/iN81uWbWzDTKUAEkPhVaMDH6vx9D
	Cyi6ZAT1qQosDofsaRRRw5HbfKwZ1FHAh/We4yzMcfxKZDrbdUaPMWhsCuOl9S/r
	dRS8o3P60Jv7tur8jGQ5Q+Dn9GImQ/QiGeHZ+YyhoCJhQwvJVFGYLBKC20I13qU2
	fNhHcP2VP9VXhEFI0dxhEA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euefc074f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 00:29:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUP90i59/B35SjNG8usau5W/UV8eHogCxTLAoDE6F/2TvgoTxOmhmHu9szTG8O0ZRifjvfYRLD7r7wuYqNxyijGKLTzaopBi6UwcC5Hng8ycOlxfhA1C7nXTpTq+0Qtg4iSmscmAWWyWDvoTRicTqL6KVj5yRbrl/oLTfKv7G1HphBTwVpckU7+KYhdB4EX0ISuaj6AG6P6vLAh7kUV1xsikGv2Cak8+7EEBPgc+GPrAXqGvbL+40fXhYYMwtiuz4ec/MTbohUb3xjqbcHxKH2h7cPTfAyXnRAyPpxrSvIBI9JxK2xCJMmNCu8pKbE3aXABZamzBNr895GF/yYd2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytuhS22cF+H5ve9faQgaPittdOfvePEdXhskFeUU2Vs=;
 b=kKhMZWx+Hpccgiyy5TeGZmDPPZQ4ps6UdK+IVnUg+CiYgljeR1h/36kXWU3C3Ni6biW8dkrqCWTakzNsWrOAYkfzNwZuJvo7b1E4wP7OWkHswbn0BSgr+Rd60JY+ir2EnHrUESBJAffLX6U4+VCjVgtgHBWpUVVXTaNF9aHl2MUhTFK9dcCrEXlxTQycfGfEeuOV2JhuUAbrROW+TT0Cj9Uw/x/DKe8Y+9gWwOHBPH01POHjS//kc/1YJWI5VH6fJABKWkEobTsksBeRDQZB04DRreS7tjjWlXPGX5Mk1NBkE513/lONRvkfs+1HCprcMNJ+Ka/PwcZIFBw7AJDdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by DM4PR11MB6192.namprd11.prod.outlook.com (2603:10b6:8:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 00:29:35 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 00:29:35 +0000
Message-ID: <83e232f7-9336-454e-9780-08ea1aa44f8d@windriver.com>
Date: Wed, 17 Jun 2026 08:29:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: dvb-core: fix use-after-free in
 dvb_frontend_open()
To: mchehab@kernel.org, kees@kernel.org, linma@zju.edu.cn
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610083055.3976083-1-yun.zhou@windriver.com>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <20260610083055.3976083-1-yun.zhou@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0145.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::13) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|DM4PR11MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f6a143-96ef-4ffc-de27-08decc07820a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mYPOMVFoegGfzJlPXzF2AhG7F7OOnN344qSXR5WaFKY67OnXIfoyTgblNNQJPmnJBR+xNb/5QePp1qjd1kXKIX6cUm9YbZFEJyBD1C15ZmWHgrpEPJMhnHqy9GO7DoUyeD3EmgdtR0TcmByUPTgmv2vZupV7vW3Hv6X7ftoQdnKuU2PojZMwl3C8fHyE8sFrUJcu+VRWcduj9oPzf9BpZq1oBvt2816J8WLwwF55Z1yrzzQf7g0P7qBk+GQujkDyhQo9Tu7jqhtb8pgtFopqkUtR1bmp52StHAcSCGMQJHAdRysnjosryiFXHOrdN9AJkwxL9LK7M+ZGXC1nPySlt/1abxgJB+IoS1Fw1+1893OUmxunmYjUt95hjOPz83DkplJl06MeZT5kBNt683rlrnidfUZWznSH60pThE9SZ0KuYYt8Jge2IQPzjZG24g202bZLYbT0Req7cjA9kFWUO7O65BB8P5SBRDOLZCI3tSjgpsVAJX0luZz8oFMjkTQNTvz2wz94IbbAOAky+UZP6lmehRHq6jSvCgoKMuJ1VyF8dWcQ2iTmxx2cEMCu91XIUmMkZgSzgR+Xcfr3LOtY8yMwMH/gyw/cAfHZ2fkAgj7tZEUp3HQ3Wo2UenYliYWUUF95VKl3igdZoYt6YOXp3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5332.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d25kVkc2Tnkza3NjeDhEaENqWEFjUXg1NkJpK2lCNTVKY3pxMVo4MzQwUVpM?=
 =?utf-8?B?S2xUMFNqdS9tU3M1MzUzQURrbGw0dFBiSzB1N094a1J2L1lOUGN3dUEzOXps?=
 =?utf-8?B?Zm5Hc1ZMVW92ZEJvTXpFdGlRQjh6ODRVY1RocUxRQW5vMVRob0JCNWo0ZWZO?=
 =?utf-8?B?cDFYVnFudXBSb1NJVXIxVG5qNjJsUjhEWEdrbTE2ZWlXazFCTDVieEN6TlBt?=
 =?utf-8?B?eGRxTGFnVEducHJpQ2sxekplYmZ4TUxrOWZXbVFwMUY0RXkwQ2M1bTJDV0Q0?=
 =?utf-8?B?c2lqQVhsa05hRVBSYzA5ZjBOVGl1ekNqUHhTNktYZlFZb0N1QzJ3RTFpMU1p?=
 =?utf-8?B?b3VpVlZ3aURTNXBQM2ltNXNBRnBIVHBQMHIybUtPSzJQUWhaOVg1QXcxcTFn?=
 =?utf-8?B?V2lEVFJ6UmFMY0VGbENtRmxqendUTE4rNkFWUFg4QlVkMkdUaDB1a1p6VmZz?=
 =?utf-8?B?VzBuWXNsK2l6ZlJKWXBkY0dxdG5ocG1mT2xSQTZKVnpxRlBwS3l6eE1XM05J?=
 =?utf-8?B?RDA4Qm1ZY0szZk95TVVJUWIvYS9nbCs5WUlCT3hzNHgvMUdOeUlVN2w0ZjVG?=
 =?utf-8?B?WG9kWnhQcEpWYjN5T2FXenozV080M0xBTHpwWCtHNDVRekJ1VEx6SkFKWnZt?=
 =?utf-8?B?dDFMYmhEQWhtTkIwUlp1MmJqSVhLajZWMmIwVk1kak1sUXo1ZnNVNms3UTI2?=
 =?utf-8?B?UythaktrVFJENVROVzAvQ002S3NuMFFyaWRWOEgzdUNlZkhZNDRwb2Y5QmUv?=
 =?utf-8?B?aEl1S1VzMGNiMnNVUG5rT0hZc1pia0Q4dHovN0xHSloyVkhQb2xsYWFSOXNv?=
 =?utf-8?B?em1hbDdod1VESS9iWHVoMFNWdGIwanlSMC9jemw2K1VHUDNMK2g4WWJhQXVr?=
 =?utf-8?B?UXJSVGhBWm44WUw2azF0em9LT241aW1Id1VhY3lJMmJOZGVYTFlkcmVkbU9B?=
 =?utf-8?B?OHRVM1V2Sy9uUU5TMjRFYVJDVklwcWUzMUI4WjlKMmgzekUvaWdXSE1hRDF3?=
 =?utf-8?B?aFRNMUg3RTV0NThiQktyaC80cEhjUFp5N0JUQitmSFhhanNUdmNnUWlwZ0Ix?=
 =?utf-8?B?dWdYQWMzR1FzQ0VIQ0ZmeWRtUmhWeW8yZDB5WlF0SjZneXpTSFlWRXdWUDRJ?=
 =?utf-8?B?VHF6UkhiTmEzTUJTQ1lYOUFHd2kweHhwemQwNDBhUXpHdDVTM2ozdnpnVFBB?=
 =?utf-8?B?TjJFa1QxLzAyTlZETUd6RSs5S09Ic0J4eklIZjFFVEo0VWtIZkpEMjhtZWtR?=
 =?utf-8?B?eVpGUFo5MUVsdnBaMVVaNkVTOVl2amlVYWtvMmw5eTUzTFB4cklUNHhZRU5Z?=
 =?utf-8?B?SDBEaUdQRjFNWSszQ2QvTk54RU1VMnpsZ0QwTFpPUnpuVXp1SzdzbllEcGo3?=
 =?utf-8?B?N2MzbEMraWt4ZVY0bzQzVkwwQVJDNm1INW1EbmRjV2tyYUxkRXhJaEFKcVo3?=
 =?utf-8?B?TWR1eGh5SGJmWmdBQTQ4eGYvUkFOanBidE5CenVnaHNhM1dDRERSWXA1UDJS?=
 =?utf-8?B?VVIxdk4vMnhLMGtjK3BtODRTLzJlTVJQeDl0ZUVENzdnNDJxV0xoNlJOeDB5?=
 =?utf-8?B?Sy82UDUzMEtHWlAxdk1EMENUL3dzVUFwbVVEUEpPMTZWRnZKUDhZVThNUjkv?=
 =?utf-8?B?VTZKSEV6NldVTVVlRW5WTFhsNTNsUzE2eklBTnpmZzhiSTF0N2x0bXBJRDNl?=
 =?utf-8?B?WWZ4QmtkSG1od0N5N216SkRHbTVJZ1ZyRXF5OXZCK2dkbWREMU1ZZ0ExRzQ2?=
 =?utf-8?B?WVlHV1RMbkduNUZNUWNUb1hxd0ZqSWJET2c4NGp6U05OeElmSUhVcU9oODRw?=
 =?utf-8?B?T2xaR0k4RVdDcWxPV29BNmV3QTVtdDloWUVSRzBXdVJ6aEtqZlV6d2dORmty?=
 =?utf-8?B?SEhKTFZPT09ETERzYzRBc1hhVk9JTk5sVElKTE5OYVNJZ21EM1QrMG03U1VL?=
 =?utf-8?B?N1d5OG5KUHcwUkdjbnEvc3R0aDhGWlU1aGlVZml5citySytrU1BJUUlZeWY4?=
 =?utf-8?B?Kys0V2V4M1BEaXhhRVZmcnRJREYwQzdwZjJGWTNyOS9NMk0wc3dMZ2c5MS9J?=
 =?utf-8?B?SjZJcWxLVXlnREtTVmx2dmpWcUZqL3hDZVdsM3ViNkYzU0tUais4T2t1K0ZX?=
 =?utf-8?B?Z1RIdWdZTHNJQThST29RNVNYVzcwRVZTNTZFRUtiNmU3WDV5ZC9QUVdCb1Vu?=
 =?utf-8?B?Z2dKQmhicnJNbCtXcHJGNDB1OFc5RVVHKytUcnA5YXROK295aTNEOU15Zzla?=
 =?utf-8?B?M3MrMXpLYkExNm9OM2ZCeFRpZU5kWE9QUXp6dy9GOVE4UnNoOSt5VjVHUENw?=
 =?utf-8?B?SlFMVWQ3MGVFZXdVUUc5YXBjVmlHWE1GbXZqdVo4dlBmY0lrNVlrQT09?=
X-Exchange-RoutingPolicyChecked:
	U9oZL5pxxWh/V7lC2eikwiecLD/pFM29Ft3mtM+/t+qsIk5+4cDuxs0ng1+I1vs21XIyHuCukKf2itI/pFP3tAleZUpT+DFcN9nQZQcaH/8BzfKTMa5AemZoLLJw+kI3sSm6HY0RLtEULItsm+aEU2OPNOsl9uxqkYaqWubJn6cKca07a5IIJgS5d3kdlBWhMrRW/Am/xSkWPXJqHOeqQbWYvU2+92ntKl5JndDTEEJ23ED1SW8pyseSfUYymbfX+nM4/ubM1NI0fjf/G9qiTR4Zc+wzw5ke9g7IEdh60AhB+6V1sWRN/RAK/Pzeq7zZ8c+SyBfV3eYkEuFr+HdACg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f6a143-96ef-4ffc-de27-08decc07820a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 00:29:35.5631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71fkeo7PQk5NMSIg1zOuQc2eQ6BevSUHJVZaUyPMzEnLKtyk6bI9LwiYW6D3zNu7KfNJiyzLDQK7SN5eYOCSoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6192
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDAwMiBTYWx0ZWRfX10tcJCc67Wuj
 NV/QsCWrsXkNZV0FbpQ8qRZMpIuxmjIyLNmgVQSpWcH1kgU2y/CsZ6jzHciE3n0twwjhIJFYVmf
 01GupA5u9wrLfUnpOV3P2lZLpQyuKmOHJfE4zlGRtUfVBMaPaBmq
X-Proofpoint-GUID: HWK0nGA6EJACCCGYCdUGKPNZb_CNQIMk
X-Proofpoint-ORIG-GUID: HWK0nGA6EJACCCGYCdUGKPNZb_CNQIMk
X-Authority-Analysis: v=2.4 cv=ObGoyBTY c=1 sm=1 tr=0 ts=6a31ea73 cx=c_pps
 a=6Zlfg0iwFc/B+5Yb0ubQ1w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=6GENO9LqX87v1q-aSr0A:9 a=QEXdDO2ut3YA:10 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDAwMiBTYWx0ZWRfXwzqPxGgVETC/
 p4Hagj2eVbv2+2RFFszKUPP0KYnowR7+g6jmmv4ygYQ6N7VZrqwTm65KpzR1SdoDsFQot8jH1Ij
 FvWFVhmxUPb+WrXqH+pc6YFNOb9AuqNXW0akeHgnAevjRg4nDwqHhOBCONj/23rOx+IpYnaCR8s
 YiuL4h73FnCnESP8kR6yKRF6P3WeM/aTS7qrFX4v9ghcGm92Nbkvld2H7lhJSiD2jLh03N6S8Sw
 6Jb6S+UwYl2BD9OcXrkaNEH5lRgmrHBMtKBp9HgY7xrGKHI9lV1wwRzWQEmJEEgEL3wxpa+cd/G
 oIvI7bUXnYEfEriOyV783ZkgkF9MQh6AHpa7mn1faqzJljE5GzSZ9EjejkKRoufUIhdtx/9PCvZ
 zMNKK0vytkmu7luviLFr7ka5ydecKl3lYDWczboO2NjZXpqZHS7Dqxxwz71LLr+e/HbopNHu7Py
 ZEgcoT72yGBzsK/xH5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65070-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,syzkaller.appspot.com:url];
	FORGED_SENDER(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:kees@kernel.org,m:linma@zju.edu.cn,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 851C6695D89

Friendly ping

On 6/10/26 16:30, Yun Zhou wrote:
> dvb_frontend_open() calls dvb_generic_release() in its error path after
> dvb_generic_open() succeeds. dvb_generic_release() drops the device
> reference via dvb_device_put(), and then dvb_device_open() drops it again
> in its error handling, causing a use-after-free and refcount underflow.
>
> Fix this by incrementing the refcount before dvb_generic_release() in the
> error path, so that the put inside dvb_generic_release() is balanced and
> dvb_device_open() remains the sole effective put on open failure.
>
> Reported-by: syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=40339ea82afa8184ad5d
> Cc: stable@vger.kernel.org
> Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
> Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
> ---
> v3:
>   - Simplify fix: increment refcount before dvb_generic_release() instead
>     of introducing __dvb_generic_release()
>
> v2:
>   - Fix Fixes tag commit title
>   - Add Closes: link after Reported-by
>   - Cc stable@vger.kernel.org
>
>   drivers/media/dvb-core/dvb_frontend.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index d082b6c57c76..608525d08277 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -2887,6 +2887,7 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>   	mutex_unlock(&fe->dvb->mdev_lock);
>   err2:
>   #endif
> +	dvb_device_get(dvbdev);
>   	dvb_generic_release(inode, file);
>   err1:
>   	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)


