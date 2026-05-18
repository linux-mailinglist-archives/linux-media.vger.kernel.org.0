Return-Path: <linux-media+bounces-61973-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F5TD18CC2qJ/QQAu9opvQ
	(envelope-from <linux-media+bounces-61973-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:13:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FCC56C5C9
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0E0F30CF5F4
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9E03FBB4E;
	Mon, 18 May 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4e+ldNJN"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955013F99EB;
	Mon, 18 May 2026 11:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105544; cv=fail; b=TpLDH9LuF1GCDRNmrBZP+wkzvMycRfHt5qt1WFczjQ7Zi63xTw/+nhSkv+jSl5Aq9KIQWACWAohZxIFd03pyMSLYBwXVo1ST1ceoN0lkulpWcfU0ufg0eIHkt+5i4Q8JC/UiE/Y8HCSr5iKhj0ggCqIEPldVbjZvo4OPg8ZnZns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105544; c=relaxed/simple;
	bh=J2AacgFG6iNy0mjHDA5yPjLJoiacKyHrklzpyOIdyBk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HCrTDQtD3nrJQ7BhfJaoLaQBgXvQMeEhO7fWc419RE5iUlw//f7Ng4MLTCsascM/HjGobr6pURQMj9MgSN2VPjuaazjTp4LH7eEHC25YvaoyGpTyJl/hMVW2TiasX8k27KzYhpmREqNqB0eAzcI4nUYd6f4RYUvbn+JgQLT8yu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4e+ldNJN; arc=fail smtp.client-ip=40.93.198.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0Jx5wzDq3Lyr7jmOEWWMNisk48o1AvVdNKGOdyuCEz0Q/zP2K7b4Ly1Kf1uB26mE949g3zcdVL190qu2ffmg2rEOPhW6QlP6hYGx1NYJXp9YFALQHzs4NMy6xqU6VYsGkkPOfN+DiGOlQsqhwwQKWzKE/xlYvsOhDPlnSAANbTJQ6yaM/z+CYK9n/loF7gAWkHA2Db08jgSwwEBEYE/5K/cE3G6rDs9OuhiJcGwSZnCLgwnV/KLtYX7zUqCT7hkjHnbmINDmDYuFm9W4PPOQuniz4SNnzxm2/JJjFWyz2kowMP/3R2D2D60lZwhuY04OWPFurItFU2shppDBEJBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/wxmq+4Qvp7ufsZ9FjX+jEXRqx7RKPZMk16j/OF3nA=;
 b=BEYVA3JpDfZUn3XXIr+hD2vGiZc83DL7tIfg3Vm7agxs+ukEziFy0DHyVWJATB8E7BxzJVmC7OOZwwIsoO3j2L2K5LTXTDokSXB77AVaF4MFSy40d3d9IRTaPADTKFGc8ob7WeeLHfG1pu+xpbyvaofKhq7TXbU95UAkDtplj9irKljm1sVFHyKw37sp5QB+7qwX+CSVTk8+0EMH4ZrVNopb3PuOZVrlRT9KTHktqnKzVJiqiAhUVsBsOeTiDqT/gMcP2h54/oJ1WMoO17vpj0FfvOuLQmWtxAl+PL77Zm1FVeFkbBfjaDmOHqldbAgDeD9eUyu4dA7zT1xtNlGFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/wxmq+4Qvp7ufsZ9FjX+jEXRqx7RKPZMk16j/OF3nA=;
 b=4e+ldNJNIM/70iaS5dqkhWAXrAtm7ynh7qKWc6+suudExwPfotwlX296qOtPh3JNFW9w2WCMFdcCvhHVSk6dSX6X3PeAP0CgBVHb7VTjNOofKzwwqO+kTJ1D+DiYunl1C5vkjPzTqII5GgATymJPS4L+YEUJyveiv/BN+qk3JSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LVUPR12MB999160.namprd12.prod.outlook.com (2603:10b6:408:3a4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Mon, 18 May
 2026 11:58:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 11:58:43 +0000
Message-ID: <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
Date: Mon, 18 May 2026 13:58:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: Julian Orth <ju.orth@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LVUPR12MB999160:EE_
X-MS-Office365-Filtering-Correlation-Id: cdae05e7-a15a-424d-e73a-08deb4d4cf41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|3023799003|11063799003|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	20fTFCzOVW1xoiFKGKsPTRF2OzUf6aMwahZJ1CQKOIS3P2yJLbpIJNhYBB9ZdvhSe5qmD2najRGMgaVmynjZAnyJd8Dg+mAydf3w21bNri92rmXgMvX1YGlP58Ysnw+X4OcuAC26ahZQRHMwIlTvU3IWreWAxUgncUM31Q1DvrT/Md73QMm4qzkPTydaxhPQpNiCXiGp4LUx8IN01an3GT+URoku58R79gQJ1IUUjs+neUx+zvvDxunLSZtRYVXKu+bQIL/G1zIJNr0M2GNB8nkt+XF2QHRDyMVr629nqqZx3qSLL6Ts50+mCHCp7VfUxYcy95I9SyQPnG9n1g+FVEPJ8y/65LwYv+g9apUbckHZUttx1QpQeUruaC/bNhxrFKTtVVVkyIv/UN9iFPJO3OyzTvmcxoHgVnMxUV6C8bjTa9uVym1ajduxNf6uFZx/qkk6MGi6GXHn9egDMWLMLt0f8fLEuDDnm2KtRUHrdOeul984+/sCRAz5eKGH0XKR0DNRlAQwK/e9pSA1rrPcT4u9PYhPtvqLM45v1MWv3cIsS9ZrZIVf83/ABmiKYuvsqGhKx/lH4BqWO17fpbqbPl8baSQWS1cMRF/XwnJKhgE76sPZom1tnEND5J6rS5CrQh/Y6CuWlB9r/unEExQk6WWxfiYX6kivhBpdI9GP5N1JYqvRdGkka0wivN+0IKJYPCKN6FRUEEoQjtL/cj2/C46hkjrkixKRgqMgtStN4/DPX9eAYSkOZkfjVNPCRr7m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(3023799003)(11063799003)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aStzSUlYMU5XVmpKR1o5Y3FzRjdiNFhLME5ka1FCNHBZcmZaOWRua3hJcVlP?=
 =?utf-8?B?MmtuWkZOYnFydXNOcDFqK1YyRW94VEgwSU1IemFvVmViL01sbnF4S0M2Mmx4?=
 =?utf-8?B?U09zQVc0a09hd1l0QnZ1Yisrenh6ckRtOTQzSG05RS9ua3NUTjZMVVU5UTly?=
 =?utf-8?B?bm5UM1g0YVp3U0NrZEtaS3k2V3B2Zk5OdHlrbHpiYjl4WlY1ZDFMdjVKQTJJ?=
 =?utf-8?B?Q2psN3hTYVFadzVhS1c0bUt1ZTlyd2xKWnoxQ0ZUMXl2MWlwUktkMjVJbUtW?=
 =?utf-8?B?TUJPcnFqK09LM001Yk5weGRMMVU5ZCt3a3RuTmpJRkdGaUxNRThTMDFqV2hO?=
 =?utf-8?B?MnJBTkNKYXJDQ1FDY2VhM0kwTzFwczVFYjlPcFlLRkZxSnlyaFErNEdDMzlQ?=
 =?utf-8?B?Y2VOd2NHcW1Ea0JzbXZkcHIyU2thRzdCQTBsb0FkYUk4OWY3Ry9LOS9zenlN?=
 =?utf-8?B?dzQyMkJQV1B3b3RLVHBJY3ZkVmFpZFE1MksxaTNxMWVVRFVlcFc5WmtpaGV6?=
 =?utf-8?B?RXFnM25aNXlKcGFxQmZVQkFoN1BxZkZ6b2p5Uk9vMktRUjA3ODlMK2VTYnUv?=
 =?utf-8?B?S281eE5pUkVVWEpkUlZva2hwS3ltWDdSckpvZXNUdEFRVno4SzNOSUg4Tkdw?=
 =?utf-8?B?aThaZmFRY09mVHJ2aGpCamZGeW1BL1o2cUpBNy9xUW80Z2JvSktxdFE2Zmpy?=
 =?utf-8?B?Q1Q3QnJvRzdYcFFPTW5tR1hjbzdWUk5QQmpXZ01TeUYvV2lxZmc0blg5NFNt?=
 =?utf-8?B?VEc4RFM1VURxN1U5MHNJRkRNUUVRdG5KYkxuZ3hBT29aMmJWTGxCUktGR2lT?=
 =?utf-8?B?bEdmS2xCc21pRlNBRTJHRWo1OGtsVGo0U0F3SnFrWmloR1lTZC9tTXRvbjUy?=
 =?utf-8?B?cTFHOWpQaVhrTE03djZXbUFIU0wxZ1Nya2lscWdXQkhVZW9SamJCNUVrcFU1?=
 =?utf-8?B?YzhmS2t1RE43akEzS0NXWXRmSmlEam50cWtkcnhXamlmRHFBRnY3RS9pYTh5?=
 =?utf-8?B?djZGY2Y0YU9oV2tSb0EvSnlZSUJqL2JwNWJUZW5FYTZxUWxaV0lqOElrNXNZ?=
 =?utf-8?B?QTVXYnk5dVRPN0tncEl3VmdEbjBrd3QxT2JLMVE4blA1MTVqdFAreldRQThv?=
 =?utf-8?B?QWIwdWx2L2M1SU5oQm9EZzN4empBM0Jzbnh2N00yeW9CQmVBMUpUZnA4bEEv?=
 =?utf-8?B?NWVOTUJnMGtVMXhtd2pnVlBBd0xyQmxMb29ocytVUGw5aENTN2RnMHZjVldy?=
 =?utf-8?B?bERFU0tVQVh3UFNmVDAxMkdVNm5JSHI1L0huY2JKZjE2MG9VMi9QUHdJaG05?=
 =?utf-8?B?NHhvK0lKME0xbHVjN3VLVFRrMzd0QUY2eFZNbkhUd1I0V0lvNENPaXRqeUxB?=
 =?utf-8?B?cEMzZXB6SHVaTjRSTHRIVVlOU2JZU2dtNWgvT3FPeUdZS3NBaUJlSEV4eGpQ?=
 =?utf-8?B?N2dKL1J1WlgrVU81cmhNMEpDaGpoVDBIMDI5aVhYMHdkMlVLT09RL29LWmE1?=
 =?utf-8?B?NmlwWG05WUhjMVBsNXF6ZlMxUldRZXorcjd1WG5JaVg3d1lCTnJEN1ArQmdm?=
 =?utf-8?B?U3hjYzRKNXZ0dzl0Zmo5YzYyZk11ejkzVDVtTmxiaEhOUkFYM1F0OHc5WHQv?=
 =?utf-8?B?UmtTOWwrb0VGUis3V25TNHlIdk1ZTy9RQ05DS2N2aGhISUdNRHlkWjRTTllU?=
 =?utf-8?B?eitkZXkzOXVxZVhvUnZNN0lPWVRHUWNudi9nTExhVTIyaUZGbGN2NFF2Y2pC?=
 =?utf-8?B?aEpqdXprSVJHMTFUZ09MeWx0NWRYRFZmTHNYUHUwRWNKMnNRb2t4OVhOZGxM?=
 =?utf-8?B?L3lOUnhhQ2U3RUNnUEtjZHE3VnREZ0VWVkNkU2RYTGxXbGtidVBCd2xmdEdT?=
 =?utf-8?B?aXl4bFRuMmdVRnRzMmRpTGhTWEk3bVZSU2xIOTFjak5jN05VWEtEK0FWQTRE?=
 =?utf-8?B?WTFVOVdvMVBHVGhpUERCSUp2Wi9QL25ZeVVIOHdPei9IQnE4RGloTStIYUhx?=
 =?utf-8?B?N1JjMk5HeFRNblBLZ0I4d05MU3lUR3NOQXF3MmNJTHZveGN2d0piTWZlejlu?=
 =?utf-8?B?Y2krYk5lSDgrV3ltZDU3dW5EcEMrb09tK2djd0VwNlVNV0N0MHRnVGQ1SkZV?=
 =?utf-8?B?Y3lMb0Vuc2NvTDlRc0c5RzEzMzl3SkdvOHZSVGg1aUpodlhRbGhYNjJBZFd1?=
 =?utf-8?B?eHpaa05oS2J2dFZwYWpPem9RakowRlN5dHFLSjhzeFVaWml5RUY1SmVNVGRn?=
 =?utf-8?B?WEZTMk1NWDd0OFR2amJFMXdOUFozbVppNWErck1nQWg3T0F0TCtLUmNEa0g0?=
 =?utf-8?Q?o1z+p8c0BsiS7DCnRv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdae05e7-a15a-424d-e73a-08deb4d4cf41
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:58:43.7473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6iXGI6582ldThXYz2ub6jKt+47WO/6aBi0YhHFo/scZRHuRC4/cATUvQMeRwGxo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999160
X-Rspamd-Queue-Id: 91FCC56C5C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61973-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 5/16/26 13:06, Julian Orth wrote:
> This series adds a new device /dev/syncobj that can be used to create
> and manipulate DRM syncobjs. Previously, these operations required the
> use of a DRM device and the device needed to support the DRIVER_SYNCOBJ
> and DRIVER_SYNCOBJ_TIMELINE features.
> 
> There are several issues with the existing API:
> 
> - Syncobjs are the only explicit sync mechanism available on wayland.
>   Most compositors do not use GPU waits. Instead, they use the
>   DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a CPU wait. Being tied to
>   DRM devices means that compositors cannot consistently offer this
>   feature even though no device-specific logic is involved.

Well the drm_syncobj is a container for device specific dma fences.

What could be possible instead is to pass an eventfd into Wayland, but that is something userspace needs to decide.

> - llvmpipe currently cannot offer syncobj interop because it does not
>   have access to a DRM device. This means that applications using
>   llvmpipe cannot present images before they have finished rendering,
>   despite llvmpipe using threaded rendering.

Yeah, but that is completely intentional. You *CAN'T* use a dma_fence as completion event for llvmpipe rendering. See the kernel documentation on that.

What could be possible is to use the drm_syncobjs functionality to wait before signal, but that has different semantics.

Regards,
Christian.

> - Clients that do not use the Vulkan WSI need to manually probe /dev/dri
>   for devices that support the syncobj ioctls in order to use the
>   wayland syncobj protocol.
> - Similarly, clients that want to use screen capture have no equivalent
>   to the WSI and are therefore forced into that path.
> - Having to keep a DRM device open has potentially negative interactions
>   with GPU hotplug.
> - Having to translate between syncobj FDs and handles is troublesome in
>   the compositor usecase since syncobjs come and go frequently and need
>   to be cleaned up when clients disconnect.
> 
> /dev/syncobj solves these issues by providing all syncobj ioctls under a
> consistent path that is not tied to any DRM device. It also operates
> directly on file descriptors instead of syncobj handles.
> 
> The series starts with a number of small refactorings in drm_syncobj.c
> to make its functionality available outside of the file and without the
> need for drm_file/handle pairs.
> 
> The last commit adds the /dev/syncobj module. I've added it as a misc
> device but maybe this should instead live somewhere under gpu/drm.
> 
> An application using the new interface can be found at [1].
> 
> [1]: https://github.com/mahkoh/jay/pull/947
> 
> ---
> Julian Orth (12):
>       drm/syncobj: add drm_syncobj_from_fd
>       drm/syncobj: add drm_syncobj_fence_lookup
>       drm/syncobj: make drm_syncobj_array_wait_timeout public
>       drm/syncobj: add drm_syncobj_register_eventfd
>       drm/syncobj: have transfer functions accept drm_syncobj directly
>       drm/syncobj: add drm_syncobj_transfer
>       drm/syncobj: add drm_syncobj_timeline_signal
>       drm/syncobj: add drm_syncobj_query
>       drm/syncobj: fix resource leak in drm_syncobj_import_sync_file_fence
>       drm/syncobj: add drm_syncobj_import_sync_file
>       drm/syncobj: add drm_syncobj_export_sync_file
>       misc/syncobj: add new device
> 
>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
>  drivers/gpu/drm/drm_syncobj.c                      | 374 ++++++++++++++-----
>  drivers/misc/Kconfig                               |  10 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/syncobj.c                             | 404 +++++++++++++++++++++
>  include/drm/drm_syncobj.h                          |  21 ++
>  include/uapi/linux/syncobj.h                       |  75 ++++
>  7 files changed, 795 insertions(+), 91 deletions(-)
> ---
> base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
> change-id: 20260516-jorth-syncobj-d4d374c8c61b
> 
> Best regards,
> --  
> Julian Orth <ju.orth@gmail.com>
> 


