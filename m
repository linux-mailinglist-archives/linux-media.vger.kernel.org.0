Return-Path: <linux-media+bounces-28962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A72A7526C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 23:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 172C91893BA9
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 22:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817DA1DF986;
	Fri, 28 Mar 2025 22:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PKxqvTAr"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132B64C91;
	Fri, 28 Mar 2025 22:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743200369; cv=fail; b=duPtnoL4yB0S5Vtb27CKVo3zp4b7N7odHJ5YjK3zWzTW3FjIcvuaSn29eIgBH8aCenHSrM6Mbu/EncigA5P9Qjnc4BRRU9bYWnCKDx9q7NeB/0X9Vgpswv5RkWKXmYzLzgUJOZH6l7KFwlzvgkU+quqzZNIEPC5QjxqBQydpU+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743200369; c=relaxed/simple;
	bh=xQk95HPsx9lCr30Lzz7VqVOb3C3aMsofISY+9KSHQdg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dXAqYDSD1ri23Tk6ScigEnIi0j7gKEtGnGgg7YJuo30GLm0Ib0fXtkFhZncCKWDT4Eaxl5SgsWtD/EMMhxoGh3NZyi0XjEIP4M3eYVpwvRfmx5dnZe3zTO2AGc8yg8VvTDWQsAMqJK78bNmAxGCAFGH860BYaY+IfaCC1Um14UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PKxqvTAr; arc=fail smtp.client-ip=40.107.244.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uT3nNc79FnlqW3e2d8A67vNyhC3wLh+jVAFEYNo9x7O+8b+VOJgLg0uJhlCrVFhgubUDwqE8TEGImpRZjzD7swOLR/6n2OONfW+qHaSgL6FXTB2c9Qg3P73Bz33Uj1pXu1yh6F+/1Xt69nD4dAOW7DiNYrzQgUviV76FqO+SiGWA4PGFj7meVTUSi8J89b6X+Rsi3DCo95KnDeSM1BuFXOcb3kXljEPWM/GdTqzxuu5PpXyp5VoABJbhi6ms4h9mc11JZAc1wzl7lNzGKa/x/Ujh0qcOB7b2knLvHTjf9V8t7Kc2lMXmF+etQOv12HjSmcFLomo2R41nq+IYz3P7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPdEYrjRJXaSP4KNVFqsmJcp7vmdfacLiuU/EAHJyoI=;
 b=jTa6e1/+p2G6bQnE1M2Kv1YV/omvXOqMingizyO0k11y5xq2g2QYohaFyQRgUGyUJrJu5lZyBpxFAauR1jAvRNTna+B5Tv9AmpezKw3+lixUdlVPl4a9hnca1jFzYVWhWFdY3z1EvUivjQjBMh+GiyPfX4NCjFHCuwZrhl5HF6ZqKIF8BgKYoCC7TLLfw0dZc1gWQMsxFG/cpfO7Ow8s0Ye568/I932xZGjjSAwE3TKR4qEEkYv9bKtQE7Gl8hVstC0rSAcFNz1/9tBOYhY05CUl1Cs2x2rMzz410V3LXc+WgI6qjS2FOW12FesAghA7PdNDD0FpyLsvt8m36BcPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPdEYrjRJXaSP4KNVFqsmJcp7vmdfacLiuU/EAHJyoI=;
 b=PKxqvTArnzr/ZgDCu7CR9tVjM0g+kap7Pz0zU+rmOE2f/I+geIh43+Ha6KTD4z8Z52iPnxDO5Y84G+JjzVmZewQKOoFrT2+ULOGLoIOnGDiDJOxRqhTzq3bQKJflX9jeJXJSNatNqe4NMm2v/VLxR3bRb/aEH59IpYs0cbySs7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by PH0PR12MB7887.namprd12.prod.outlook.com (2603:10b6:510:26d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 22:19:23 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 22:19:23 +0000
Message-ID: <4f85e24e-4bd9-4cde-ad33-075cfcb2b7c0@amd.com>
Date: Fri, 28 Mar 2025 18:19:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: Add OV05C camera sensor driver
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dominic.antony@amd.com
References: <20250228165317.3468075-1-pratap.nirujogi@amd.com>
 <03c3e6bf-9688-446d-9b45-5b186a1d5b0e@kernel.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <03c3e6bf-9688-446d-9b45-5b186a1d5b0e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0020.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::29) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|PH0PR12MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: dca12aac-b467-4b46-d4ed-08dd6e469803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlRTR1RtK2V4U3cwVXM3cEdJaitvcXp6WUJmWndYTVd3M0pQTFhJdFdGZlM4?=
 =?utf-8?B?STl1OW1SNzhIRXhSNWlGRHFtNHRwR1RWQU5SQitYcUpHMlBieXZ0djh3NVVV?=
 =?utf-8?B?OUtQOTRUU2dKN0FaVkMyR2MvTm9iSVY0ajNkcTNwQStFemsxYUpZOW5rd1U3?=
 =?utf-8?B?Q1ZIQnkrWEdaL0R0RkxwYWN0Mi9QYWNuYWNvNGd1NHNUU0FsSWl3NS9oOGdu?=
 =?utf-8?B?clpoRnhscXhMdmpONWFBRTZnWUt2UUhjb2VIM01HVmlyczZHWUV2Q3JBNzhD?=
 =?utf-8?B?OVN0OU5mUTVmTnBYYXBHaloyTjNSZkc0UVR4ZGNkUjI2SHN0dTJ1blJhNzU2?=
 =?utf-8?B?REVab1dkQVpGcm90RHVBQjBHejZ0WFd3SGNIR0oyNm1lVGRUN3JNTFBhTGtp?=
 =?utf-8?B?VTVoQlJ5bytqbzEza1pFOXJJN3ZoVUo2cVdqYXRKVkM0eURBZ25TVjlhaU1N?=
 =?utf-8?B?aTlFTUVhN1h3eGNOcm9rSnk1QkY3eU10eDBncXJQNSswZFZxV3plNjFWMVpk?=
 =?utf-8?B?YXZaN2YvcFQxRUM3UjhDU2M2Mi9xZHhaQWJYKzN1aXBmVVkyQ0dML0hYWlVS?=
 =?utf-8?B?UTVMTWErV1docGNSS0gzd1pjdFlIaDlGVHNwZGtodUNkWXZvamZPZVIrc2xk?=
 =?utf-8?B?UWlSSXFHbTVmdUhPZ2xPMlE1bEE3aCtOa1Jlb2ZpS0ZjZEY2RnAxZlg4UlFz?=
 =?utf-8?B?WGk5OCtHN3VMWTJocDljbEZQeS85MGxRZ3hQRjJyVDlzRUdpdUpqZko4K1cv?=
 =?utf-8?B?UDlrUHR6THdUeHBzcUtONHRMblU4MEV0emJWWWxGTU9ucGs2WG5ZZU9IU2t2?=
 =?utf-8?B?TFNMem9VMThOYTErdEszLzVScEhyUnlFdzRPL2xNeGlBZHE2ekZEdVo4NVJh?=
 =?utf-8?B?eEFmSk9UTXdCUGpRUC9yUXJkbDk2THJxL0NrdXQxMjVZMkY0SG5INnhQZ1Jx?=
 =?utf-8?B?TGQ0blB1akE1YWRwUXArK0JwUW1DS1VMQ2VwdWlwKzhSenBycVp2UUxRQXJm?=
 =?utf-8?B?ekNpYmorQmpkZEh0VjkzcHRuNEtlMXJwT1lLVXB6N2d3RUtFQ0Y5T2NPUnpv?=
 =?utf-8?B?Ly8zL3c3dWlSR0FBenRsMG1ERzRVMTNXZklEcGc5MXAyN2JaeXlIa2hXcHlC?=
 =?utf-8?B?NEh0UDRpdVF2dDl4TXdUQlFPYVI2SEorZHFkaDd6a0llOCtENzFIWGZNMmhq?=
 =?utf-8?B?WUtkMm1DYm5SbFJVU2l5cjZ3SjMzczFLcVo0aFhKWFFTS3VWOXllQ2o4MnRq?=
 =?utf-8?B?QXlTdEJ2QkVPZnlLdEZ3NTFlM1dWclhWV2w5Smd4dXVHSVlONXByVDB3c01u?=
 =?utf-8?B?UEhLcWdENlYxemF1dUlrWXA1eDBBendwR2h6VjIyS2FVQ3ZuUlZlaWE4QTV5?=
 =?utf-8?B?RDhkcEdIRFdJdXFySWpLUFg5TVExY0VMbkhwc2daR0lxV0pIUGtSWmZXMVBK?=
 =?utf-8?B?NnNGOStPQys2QTc4WHBHOFlzZlg4bWE1UzlaTWRzQUpEcjJqcHZuSE9tbVh1?=
 =?utf-8?B?dm9nZ3doVmNBMTJJV3kzSFlmRWNQRW0yRlpZODJYMCt6YUd0VUwxWnUyYUhl?=
 =?utf-8?B?L0htRnBNUklSSnBwYmJ1eWJKV3lER2Z0aGxpSkNkcUY2U2xuWXp4MFZmbFpv?=
 =?utf-8?B?V2x0YUM2YWNTS2tnNlR3S2hyNlorZERFRE5pYmZGTjN6K2tKYXVQQ0h4ejVB?=
 =?utf-8?B?U25qLzhwMmNXSlFvNzRRcUdnT2Z5UXVtUjFmZUpOT0lBUlB6QldXeWJIbjgx?=
 =?utf-8?B?dVZhdjFPTmR2NGltU0I2RU84VDM5aExEdzQ3clhtd29QME1VajFLM2NKdXZk?=
 =?utf-8?B?Nk5ERzZZWUd3WHkvQVhEdU56Z3hrMUp1YXA3TUNGY0ZCa1dYTDRoMnJ6c3cy?=
 =?utf-8?Q?rXXqxSjYMLHjr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWFET3B1MUlqN0E4OW9Kc21CNUYwTUhvemNua1U0RW1wbG1FZThaSU1ySXh5?=
 =?utf-8?B?eDZxaUtiWHExZjhYU2N5ZTRwWUJON1p1MnA3akxtN1hjQ0Zhc0UyR0JLR3JR?=
 =?utf-8?B?dDVUeTI0a2l6emxmUmVqQytUNW5waGdDeG5GRmhzQlVVRVBKU1QvNFJkRmVj?=
 =?utf-8?B?THlPaUwyUHNYNFlWSS9zODAxQTBJYi9tUHViUndmMktMK3Y3VmNFQkdMZjVG?=
 =?utf-8?B?QU0vM3Mvb3doUFdHR1VvVDlQNkwvQWRLVVJ4V0VzMTRxYTBPbGhiMkV4S1Zl?=
 =?utf-8?B?dW1Yb1QwSnJocCtOb05JS1A3WmdKK3g4RXN3em0zNWxOaUYySVNweHlwSWRs?=
 =?utf-8?B?R0pFaTd5ZFc2OVZpLzVPWHVtTlJNbDBhVUxNRFhXZ1VoMVVtMzlrZ2NjVGlE?=
 =?utf-8?B?cWpQNExyUENmTEZnbTBPZjF6NFlkQ2Y3dy9lTHRSMy9iZmlucVFTU3lDN3o0?=
 =?utf-8?B?YUt6NStVVHh5Y1p0WC9pZWhNSkVOK0s3bGhzVmRXRTFiL0EzZmJZTExOeWR2?=
 =?utf-8?B?SjNxTm1YOWM1eStTZFkzcTEvQmtiMThtUVVxNGFpQ3lwOWF4OWFvNnNGNGla?=
 =?utf-8?B?K1VKbkFnYWFlR1ZTR1ZhMWo5MU9ERFNwVUxPaEpnWkM0Qk90NC9pd1FwSXRj?=
 =?utf-8?B?bnVYcTNaejV1S1JBNXd0TTM5L05tNUIvTFNHaTJBVXhwZFFab3VsQUluaGlU?=
 =?utf-8?B?cWhkbmt1enVGUzFPTzBZUnJyRzhTWVRmN2pjVndYSVBFa3BnUjdkWGg0VHBJ?=
 =?utf-8?B?M01rNGRmOUxPeEkyT1g0TDhnTm03RlZqMWpVTlAwSFFWRHJ0M2RMSGN4NmRR?=
 =?utf-8?B?SlJISjFhMHQxYWhNU3pNTjEreitEYXFrUTJBNFdxL0Y5ZUNLQTUvNTRIaDY0?=
 =?utf-8?B?anh0VUVFaStHVlg0dzJ5WWpyNzUwWU12QjRCdXVxQW84aXJFbU1WTFFhWjd0?=
 =?utf-8?B?T3hqekRYNmROSm1DUTJNS0RRaGllWnUzbFZaR0JWUWdXNkM3TjBHZmlCUEts?=
 =?utf-8?B?ZjFTSi9IWlRhNGZRRzR5Zk1MZFd5NWNIajBoY1oxKzM2andjNjRDVk93SHF3?=
 =?utf-8?B?MDNVWm9LL0lZK1dYQjVNTVFIZDBFNDNPMUtuTTErZ0lxQXN2eWd4ekFkamlR?=
 =?utf-8?B?QVNmNXl4UDcrSFQ3ZlhibWpkanFTcXNUQ3RzWE54NEpycjFCRDdNenphWkRa?=
 =?utf-8?B?QWdzcERia3RCRXU5NlFpT1V1blNCM2drNFNtWTJjMkFTVUh3alBUOXBBQXFK?=
 =?utf-8?B?K1U4UjFpQ1lrU0dicmFjeFFGZ3lNNTlEZzdNTjVlUFdkem92VGxSb2N0TjZp?=
 =?utf-8?B?bmRneGRjQTdtZDFyUmlTWVcrWVd6OFBIV1lTNlFxZm1qa3BzdlZzVnBQNGFy?=
 =?utf-8?B?OUZYQUxtSmNtVWNJdjlSNlQrVUhOS0RRN0J0RW1DdWp3ZzYrcGZFT011Ny9W?=
 =?utf-8?B?M29iNk42c25NV3R4N2E1S1NZOFpWbzl0TjdoTmVVU0djOXFOVDBSV1ZUYnFx?=
 =?utf-8?B?SnNhRVBQeEZ1QjJoYUszdUhlL1pIMFFIcGRxK3BIejkwWVlYSnhNN3RPUVNp?=
 =?utf-8?B?VklWZ21LdXZlSkY0SS8vN08wQVp1VHdPamdwVXZvdllNeUIwRXh2YUxYdVRD?=
 =?utf-8?B?RU1LZ3BXSDJNbm9DM0tYVVZnM1dnam5Xc1ZTTkE0UUhzQy9WY1JLLzZFR0N0?=
 =?utf-8?B?bHd0UDBESXI5b1p5cUh1RFF4Yk1sSGVUdG9zQWowMFZZWFBza25yaEJ4TjFt?=
 =?utf-8?B?ZzA4TmJQSzFIQ3N6L003elZKaUlmeTh5aXBPdks2L1NXUmlWRmJpTDl1Tmt1?=
 =?utf-8?B?ZmppTFhVYnloeEtJcGVmK1l4RlBaZ3JMYklBKzcra05OSlBPYnhNYjBXZ2dT?=
 =?utf-8?B?U3BnZnFoTXdOelRmQ1lJTG1pQU9Rd1BMYlRyRmZBc3k3SzdPTHh6R2R5NWll?=
 =?utf-8?B?aG5aS3BFbWRkc0x6eUgwQnlzU0psZkFDUk1YTW9LSXB2SVNBeHJ1cTBrenhS?=
 =?utf-8?B?N1VEcjlmRUM5OCtZczFkOEJhY1l2dUx0NEZpSE1MRXRSV3lkM2JTaTJUNUVM?=
 =?utf-8?B?ZG8ySUZubDI0YkY3Mkt1MEUycnY0ZXRlQk4zd0NRVkxYaEV5cFFCaVhOaHph?=
 =?utf-8?Q?p61Sp5qVxFPoelhuDhLhsWedh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca12aac-b467-4b46-d4ed-08dd6e469803
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 22:19:23.5262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WT3n8YjkL9Ksb99jGeE9J0W1GO/jCjFwN5amJIjZGYQbMOXEzbCrOfeqjFqcMEFjPM1aREoYQ/g7FpVaOycEow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7887

Hi Krzysztof,

Thanks for reviewing and extremely sorry for the delayed response.

We have submitted V2 patch based on the review feedback. Can you please 
help to review latest V2 patch and let us know your feedback.

Thanks,
Pratap

On 3/1/2025 8:30 AM, Krzysztof Kozlowski wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 28/02/2025 17:53, Pratap Nirujogi wrote:
>> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
>> supports only the full size normal 2888x1808@30fps 2-lane
>> sensor profile.
>>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>>   drivers/media/i2c/Kconfig  |   10 +
>>   drivers/media/i2c/Makefile |    1 +
>>   drivers/media/i2c/ov05c.c  | 1031 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 1042 insertions(+)
>>   create mode 100644 drivers/media/i2c/ov05c.c
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 8ba096b8ebca..fd160feabc41 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -337,6 +337,16 @@ config VIDEO_OG01A1B
>>          To compile this driver as a module, choose M here: the
>>          module will be called og01a1b.
>>
>> +config VIDEO_OV05C
>> +     tristate "OmniVision OV05 sensor support"
>> +     select V4L2_CCI_I2C
>> +     help
>> +       This is a Video4Linux2 sensor driver for the OmniVision
>> +       OV05C camera.
>> +
>> +       To compile this driver as a module, choose M here: the
>> +       module will be called OV05C.
>> +
>>   config VIDEO_OV01A10
>>        tristate "OmniVision OV01A10 sensor support"
>>        help
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index fbb988bd067a..08bfc2d59be2 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -80,6 +80,7 @@ obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
>>   obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>>   obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>>   obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>> +obj-$(CONFIG_VIDEO_OV05C) += ov05c.o
>>   obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>>   obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
>>   obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
>> diff --git a/drivers/media/i2c/ov05c.c b/drivers/media/i2c/ov05c.c
>> new file mode 100644
>> index 000000000000..96c4f74af4a9
>> --- /dev/null
>> +++ b/drivers/media/i2c/ov05c.c
>> @@ -0,0 +1,1031 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
>> + * All Rights Reserved.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> 
> What's with AMD? Second patch that day, same issues.
> 
> Drop license boilerplate.
> 
Done. Updated copyright header and license in V2.

>> + *
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/delay.h>
>> +#include <linux/units.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/gpio.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-fwnode.h>
>> +#include <media/v4l2-cci.h>
> 
> 
> ...
> 
>> +
>> +static int ov05c_probe(struct i2c_client *client)
>> +{
>> +     struct ov05c *ov05c;
>> +     int i, ret;
>> +
>> +     ov05c = devm_kzalloc(&client->dev, sizeof(*ov05c), GFP_KERNEL);
>> +     if (!ov05c)
>> +             return -ENOMEM;
>> +
>> +     client->dev.init_name = DRV_NAME;
>> +
>> +     /* create sensor enable gpio control */
>> +     ov05c->enable_gpio = devm_gpiod_get(&client->dev, "sensor0_enable", GPIOD_OUT_LOW);
> 
> 
> s/sensor0_enable/enable/
> 
Is it okay to use "sensor0_enabled" as connection id? We used this name 
to differentiate the two GPIO PINs that has to be programmed for RGB 
streaming to work with this sensor.

>> +     if (IS_ERR_OR_NULL(ov05c->enable_gpio))
>> +             return PTR_ERR(ov05c->enable_gpio);
>> +
>> +     /* Initialize subdev */
>> +     v4l2_i2c_subdev_init(&ov05c->sd, client, &ov05c_subdev_ops);
>> +
>> +     /* Initialize CCI */
>> +     ov05c->regmap = devm_cci_regmap_init_i2c(client, 8);
>> +     if (IS_ERR(ov05c->regmap)) {
>> +             dev_err(&client->dev, "Failed to initialize CCI\n");
> 
> Syntax is: return dev_err_probe
> 
Done. Updated in V2.

>> +             return PTR_ERR(ov05c->regmap);
>> +     }
>> +
>> +     /* Set default mode to max resolution */
>> +     ov05c->cur_mode = &supported_modes[0];
>> +
>> +     /* Initialize V4L2 controls */
>> +     ret = ov05c_init_controls(ov05c);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /* Initialize V4L2 subdev */
>> +     ov05c->sd.internal_ops = &ov05c_internal_ops;
>> +     ov05c->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +     ov05c->sd.entity.ops = &ov05c_subdev_entity_ops;
>> +     ov05c->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> +     ov05c->sd.entity.name = "OV05C";
>> +
>> +     /* Initialize source pad */
>> +     for (i = 0; i < NUM_OF_PADS; i++)
>> +             ov05c->pads[i].flags = MEDIA_PAD_FL_SOURCE;
>> +
>> +     ret = media_entity_pads_init(&ov05c->sd.entity, NUM_OF_PADS, ov05c->pads);
>> +     if (ret)
>> +             goto error_handler_free;
>> +
>> +     ret = v4l2_async_register_subdev_sensor(&ov05c->sd);
>> +     if (ret)
>> +             goto error_media_entity;
>> +
>> +     /*
>> +      * Device is already turned on by i2c-core with ACPI domain PM.
>> +      * Enable runtime PM and turn off the device.
>> +      */
>> +     pm_runtime_set_active(&client->dev);
>> +     pm_runtime_enable(&client->dev);
>> +     pm_runtime_idle(&client->dev);
>> +
>> +     dev_info(&client->dev, "%s success", __func__);
> 
> Drop, useless. Kernel has infrastructure for simple function exit
> debugging. For probing as well.
> 
Done. Removed in V2.

>> +
>> +     return 0;
>> +
>> +error_media_entity:
>> +     media_entity_cleanup(&ov05c->sd.entity);
>> +
>> +error_handler_free:
>> +     ov05c_free_controls(ov05c);
>> +
>> +     return ret;
>> +}
>> +
>> +static void ov05c_remove(struct i2c_client *client)
>> +{
>> +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +     struct ov05c *ov05c = to_ov05c(sd);
>> +
>> +     v4l2_async_unregister_subdev(sd);
>> +     media_entity_cleanup(&sd->entity);
>> +     ov05c_free_controls(ov05c);
>> +
>> +     pm_runtime_disable(&client->dev);
>> +     pm_runtime_set_suspended(&client->dev);
>> +}
>> +
>> +static const struct i2c_device_id ov05c_id[] = {
>> +     {"ov05c", 0 },
>> +     { }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(i2c, ov05c_id);
>> +
>> +static struct i2c_driver ov05c_i2c_driver = {
>> +     .driver = {
>> +             .name = DRV_NAME,
>> +     },
>> +     .id_table = ov05c_id,
>> +     .probe = ov05c_probe,
>> +     .remove = ov05c_remove,
>> +};
>> +
>> +module_i2c_driver(ov05c_i2c_driver);
>> +
>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("OmniVision OV05C sensor driver");
>> +MODULE_ALIAS("ov05c");
> 
> Drop, not correct alias.
> 
Done. Removed in V2.

>> +MODULE_LICENSE("GPL and additional rights");
> 
> No, use proper license and matching tag. Your top said this is not GPL!
> 
Done. Updated to "GPL v2" in V2.

> 
> Best regards,
> Krzysztof


