Return-Path: <linux-media+bounces-29085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51CA76D73
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 21:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A3DF188C8E5
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 19:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D6F215047;
	Mon, 31 Mar 2025 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NUGZ2I3U"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575B1B81DC;
	Mon, 31 Mar 2025 19:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448701; cv=fail; b=r5JfCW6AeaTaVBn/gVMEbl5bQZv8b9cakdnQdby4+JiImTF+O+mMab4auEkd7jV++LG/rhLJrTK0TVRddjNwy247RT2uqztKNgQFFAkmDDJ0w4cA8b/X/SOEWIV+5iq5R8ubhx27jqHrgARG63ACWXYqqb8RF0x5IHcNfBFJkqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448701; c=relaxed/simple;
	bh=/7o6akq+YJdD9PFuj3E1AZ3WRfgJA024DpZ/8HmyLrQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fvHISB5iA6p6nJyZ6xrcxVlqpD146OOTkXFFavontebvv4bgg00ELdemoT1rr0FpAthDiDUYGnR/mSKE5BKOG9FxXYhi5eR425RVX4jomtnqV0vzrK9zVy+KXCBLY3FJxSrlemRB7fBOOTxyTe3oFoIsm4cmBYAIatxToZuhjZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NUGZ2I3U; arc=fail smtp.client-ip=40.107.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaIZX5J3impPy6f84mgGRcLyVMY/gVQTW/zXyDVcH03X0Hktwq1VVGMkZkpzcjxBAr2ZSq3S13/2IjyWAcW+/foN65tIw9kGsTJ3QPNwsA00voqgPD2KBCvmrVCTvDy+OLx5Gyco3Tr6qJNvW5xuOHPpxW9Tl0OaEtBCu8WgD+DjIkYIc8Tvxf29D1WeIbw6m5q5onfO0VCVN9+8Ycv1cOIa15BF3wIL/WCE8iN9gFoJTxT6ogXMUcq7KIJEBGLowq2a6i/71+hQ5y4FGE2sMpo16tdFQDb6PD6lAjHg5kTZv4Il4NAfKpQNU5EGcf1G02bQwrTYfymuY1NlGkJ1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGCQAmy+CRI/56oHu5/9dR9Bcwkvw2MJCsoP5NGww6Q=;
 b=FicCPbjthvQN/7MnBNv8dC4FY+3iIvUlJjAOHdfqdIH4HXqBVFvq5BBA1MGkKcnacmcOm3urF2UHvqSSFNQ8IdTg9C2r96Z/lGMZhyAAFM9/XHi8thkIhnGq8jLt3w8S8AleIYi6foOYAaJEA7LoVsInm9KHjCTY2Es/f88TvOYv0eRKhVIb3rkajT1vv7e23Acfdla0SNYSQsQPJfZV7CXN4IQQRBj2YEl0CwDOHwsFEYJMehhwFXYlFPj+xwyURUTXS08g49YCJyFa+WVYENAEHqpwuIXzJZTYjVWiialvVGwJou179IhM05b/sWWTCwv3tmegkt3Sqpvzoxvidw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGCQAmy+CRI/56oHu5/9dR9Bcwkvw2MJCsoP5NGww6Q=;
 b=NUGZ2I3UeouG/dAE3qUd2ulWCV/v82VkuTe9Kp8VhE2216SEYYqQ+nPgUTHdx36w9sGRgY9UzB3Eodo+uQojS0iiWQdI7o83kxXc6c79UqI3NFTCSY9D0c6+Es07nqBvSC0TTQ+tSn1/tx894zWlxlRzCOn4usjoHOLxASAGjbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Mon, 31 Mar
 2025 19:18:16 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 19:18:16 +0000
Message-ID: <25cf1c91-0bd4-4ace-81e2-af190ef3d575@amd.com>
Date: Mon, 31 Mar 2025 15:18:13 -0400
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
 <4f85e24e-4bd9-4cde-ad33-075cfcb2b7c0@amd.com>
 <8f9863af-61bd-44c3-937b-e8a9a5410556@kernel.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <8f9863af-61bd-44c3-937b-e8a9a5410556@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0192.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::35) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 1954e071-6bbc-4aba-cf64-08dd7088c9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGM0RHlpMXB1RTlxVGd3T0lXdGNUMkhXUGo3SnNsaTBZTmZXVHVqTlc5dEo1?=
 =?utf-8?B?WndZaFpqSm1jbUYxd3Y0VHBsTytxa3ByQWxWeWcybmN0Z2NQMFNaU0tMK3l2?=
 =?utf-8?B?bE90UjVQRkhNTERiRzVQKzBobVpHS2MrVUFUa1dmVXkzdHBWelBJUmJ1T055?=
 =?utf-8?B?bW4zQStzU1JXK1VUWlVGTmhONU5LRHdBdmphWFp3a1Z4czg4YU1QTGdmd1dv?=
 =?utf-8?B?aTIrWlVJdEMrMFNoUlpob1d0eDVTSm1hUG5yQVdEOXEvZ0VKNlN0a1hqMDdu?=
 =?utf-8?B?TnpuelgzYmNHbEZFTnZacmNTbm1HTHdOOC92WjhrajZTMzV4NXM3S2Rrb2Iz?=
 =?utf-8?B?NVB0TkJyeGZSRVhjUytaYSs2L3VMSUhmcVFtc2YwT2ZxeEJQeCt6anVmSDRX?=
 =?utf-8?B?Skt2aDNXYWRzZmh4SVAyMjdIOHMxZnIxU3hNbVFaamxsU01sRlpHb1BQMTNS?=
 =?utf-8?B?TTYrQzNFTVhBc3dSUWwzOUJGay9FTWFXMjV0UXdKK2pRYkZ6bFgxL2pCRW9U?=
 =?utf-8?B?V25VTThaczg1T05CYzFpRnVOM1hHWXlrRGhqTElYL0QvK2FMeDZOT1dkenkr?=
 =?utf-8?B?b1pNL092dnQyNmpsYWlCUEZMU0I3aW9sVFVLU3RRRG9hZmUwaWc5eDNSVUgy?=
 =?utf-8?B?d3F1S01DT2x6RkZBNFBLbzloblltU2lZOU50Vm9Jem1tNFJyd21DbFZ2NHRT?=
 =?utf-8?B?TEJ5dEtUVDdpc0E4cUNtYjROU3pvOUZ0cml3S3NHMGVtM2V5QjBFTFJuN2hh?=
 =?utf-8?B?Z09iWjJVYjhFSThGSTl4Q0J0ZnNVUHFQSVhJRkxaMUtZdk5LU3VCUXBuTFla?=
 =?utf-8?B?QkxIV2NscDFzVVorQW9GLzlTN2w1dTcranZYRmpzcGtiSmJ6OExPYVdlQmNk?=
 =?utf-8?B?R1ZCL200Z0gveFR5cTB2aUQ1bmlPSnpjczZFU1ZlS09TZ3ltUzNkWkIrZStX?=
 =?utf-8?B?ZFEvaTRQUDNSNjBJMzFFY1hCZitDcnBVZGZVVGxsVjMwWnRsREJuOXptcEhG?=
 =?utf-8?B?L2poRjlZcUV0dEVydVpoY3ZFS0I2RU1YdW5FWnJCVkNTQWlWTmVsZWd1ZzFG?=
 =?utf-8?B?cHpWZDV6L2VFWDJzcnFnTGFPTkdwZXBYYVk4UDZpTERGR2I5Yjl0RWtlKzZq?=
 =?utf-8?B?YUZUVGg2RTJuZDZ0Q3FmUFpyS1dQYUprMDkwdC9KNExVbElMNFR2dWduSmpY?=
 =?utf-8?B?Y3lMcGZTcDNnQjhKTnk3U09HWU1SU1RXNGZRQjN4K21sWXlVekhjYXJEU1FW?=
 =?utf-8?B?WEdRMGJ5N3Z1YklmWXgwK0pCMUpTeHVFL2p3Z29oVFZUM3RHTG9saUs5bDJi?=
 =?utf-8?B?YjBWNlJXV3ZPUEtqR05EZjlCVFBNQkhaUW0ya0tiVktpeWN5VHNZRHJJMk5n?=
 =?utf-8?B?OGZVSHBrQjNTd1Vxb3dEeUlPWTR1Wnp4OTNDTWRwNFAxdkNVSlVkbVI2ckFn?=
 =?utf-8?B?ZXM2MFl3Y0dRcjRDRTBIUU45eWNZM3U5TDVVMUoxQlJpZzJxYXVsU2QwN3Fi?=
 =?utf-8?B?YjNwWnppbmpiSzZVLy9BMnF5a25QclpTczUzT01aUVpFQ0JuN25ZeHY2R09M?=
 =?utf-8?B?Q0w5V2ZMVEg1UEMvMkV1WHcyVC90WnZnZEljUjN3RnRmWFFzQmlPYXBGUzFJ?=
 =?utf-8?B?RUgzOWVnTUNNU0RITWQxT2p3bXRycGhseUQvem9qOWsvS0tkU0taaHBSV2ts?=
 =?utf-8?B?ZlFvMUk2VmpRTE5TWFY5cm55ckFGQ3lpYlVmSUlucWZIZTRVL21ZZ01VSTFH?=
 =?utf-8?B?emJrN2RWQUJ0blNGdVNJRUp2bGxzUy83SWluenRaemhOekpuRC9pc0dsOElN?=
 =?utf-8?B?NksxR1cyU2UzNndOMXJtbjB5cTNWZlBpL3FjOEhLSU9MNTBxZjJoVUxjekRC?=
 =?utf-8?Q?1eZSK0fbUHjPS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjdrU2laTFVIdzh4Z1B6ekcwTGM2bDdDcjRKM0w0VWZyZ0UvcGZWQStoRjhW?=
 =?utf-8?B?MUJRTmY2OUdLRVNpcTE4a3R6QWVtby9XV1hUeVZjWVNmKzV4LzBZS3E4L1dT?=
 =?utf-8?B?cVB4emlxL0M4Uzh3NmtiWFlDeHZvMVhML2FpT1lXb0g3bmMwbERvZHVubzQ2?=
 =?utf-8?B?Rmxnam1ETTREeG1MYWh0VUV6OWdzbVhjWjFIdVNjTENjZFhPRnVETDJndHFy?=
 =?utf-8?B?T1NCTFg0cTNUcUROcHlQeVpRUmFMQnRkc2N6VUNrd05IN3E1OHQ3K0ZVTlIy?=
 =?utf-8?B?Sms4Yk1FSkhuQTVnQVNYWkh4c1d5Nkpyd3JEdm5ZYUVyVlJ1SHh1bXl0bVJk?=
 =?utf-8?B?T05tVkJOWStXYWNuT2huSHRtaGtXNHU1b05ld1RvbVFDbGZZYjNiL3o1ZWR2?=
 =?utf-8?B?eSs5c25UeFRqU1lCNnQrcWJPUktmR1JaRUhqSlBNLzhiaHlUUEhObUZpaHFk?=
 =?utf-8?B?dkVmRW8vbzltMnRsc1FFMGhWWkJUczA3MTlpTWFPOE13dlBaSEx1aHlFRVZp?=
 =?utf-8?B?em9mUkhnVGpNWG5zWEMxVUZzdFdudnVEUmdONmJTN2pYSitKYnlxSVpkaG9K?=
 =?utf-8?B?MTBiUDhBa1RFVzVZK1VCSk9YUGkzWGJwZ21XQ2Q5S1RYWGxKNnpBMGdGellW?=
 =?utf-8?B?cmZoaXk0dm92VStocW0ydWZNUHJqczl2amF1dkdVOVFPNk8rYkdwUFVJbU0x?=
 =?utf-8?B?NUtuMW1lKzliN2RZUXlNSEdOQWFuQ2VydCtwMG5IOGtFaUlzZmZESXhxdHcy?=
 =?utf-8?B?cWRIOURNYSt3cEQ1QVBsUzFHZUJuWkYzYTdYZ2YwRDZzK2EvdVpUTzQ1dUdr?=
 =?utf-8?B?YTFwVDJlRnBBNDhsUDR3Q09kc05ZeC9zNllvaUJ0U1pYLys1ZjlEaDNwU0Js?=
 =?utf-8?B?bC8xSkdnQ1R0Z3RoamVBNXk4bG9ETlBlV1U4c1RiOCtQc0JhVW5IeS9LbG16?=
 =?utf-8?B?MjNIZ2FzY29tOGc4bDhGc2Z0SXB4cVBrTXQ0Lzc3bmpuN1psWFRRYXFLVEZp?=
 =?utf-8?B?WCsxK2ZSdzNxVlA2emxoT3RDZThheWF2T3pTK3NoNENnajdMb0U4WWFYRFZG?=
 =?utf-8?B?OXpZejI1T09kVjRXVG90TUNWRXlWMmMyMklVbmtSWTgxREdwRnREbHpWRGlp?=
 =?utf-8?B?UVBmSXZnNGtuUDArcWorZldHWWcvQ1RiamZha3B2WGVKL052eVVuTHRCY1Jk?=
 =?utf-8?B?eFFhNk9MQ2dMOVB0UUFWbHRyTUdhL1VJWmtmSy9nMXpkRGVERTBaLy9pWGQw?=
 =?utf-8?B?MmpGN0ZkeThFempvc21Hb2JOUENleGx1aUFJbzFnL01adTlZRllRS0VYeDVr?=
 =?utf-8?B?WEFwZEJqVlZtMXpqQzNtTnVwNlgzK2VmblpXVzNrN2ZETzViRkZPbUFJRWlW?=
 =?utf-8?B?RURrakt0bjlmZHd4YXRIVktqSDdSTjh2SFNsNytad3NNRFJYY0JjRzYwb1Qw?=
 =?utf-8?B?UkhYcmp0U2JOTW5HSHduak4xNzhiT2U1elp4WVBNbGZWWHZGZk5oOWtvMFgy?=
 =?utf-8?B?d0ROc0t1UkF1SmhQYUxrY3FUUjVqdW9VYXBLRHpXR1VqTWppMXhNb25SN1pE?=
 =?utf-8?B?UjV5dlNvUEQzaFhLWUNPekQxVlJQVU96M2hnQVJRRWxJSWUwRzdUU0ZXVmJY?=
 =?utf-8?B?L00rUXM4V0ZnWis1eTNIWXZaMjZQc1VTd05KRDNDNkFubFBJRnNLcUFwTi9P?=
 =?utf-8?B?dm1KSzdrZW54K2htNW9HaEgvWU1MRitkWGRhVmE0dGRVWmljRDdYS0lILzdj?=
 =?utf-8?B?ZnkrVTRVZzQrM01MT3NBZkhkOE5LMHhFTUhRWHNFcmE5UWFXOUxlQnhDdUZi?=
 =?utf-8?B?eTMvL2w5Y0k2cThPUWxQZ25XaW90MnN0bHJ4ckdjTGZzT0pRT2VkQ3MyRGZw?=
 =?utf-8?B?L0RpUzk3VHpKelpvWjNyNzdSSFBic3V6dzNOV2RvNUVtTnQ2YjBNU2dpRDEr?=
 =?utf-8?B?U05yZlpOb0xKRU5jeFBRUXdkbnZUOTVFLy92VTFmL2x1RlFxRlN2WTFGUjlu?=
 =?utf-8?B?bEJpWG1jRW1XcVRNWEwvcitaa1lKRjdQcXlGNUtvbEo1U0hhNkttM3pqVGZC?=
 =?utf-8?B?TWo0bHFSODhTNTUrdldNdGRlVERHZ0tTVndIMW1STE45NmVld28xK2E4dXcz?=
 =?utf-8?Q?U4fnQifmuvtaR2iGuKwK/E2Ya?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1954e071-6bbc-4aba-cf64-08dd7088c9cd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:18:16.1783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ONnqTK8HUyQ+JuwNcIKN4FvryAKBJjQRcYyCnO6uEi6933A0I4lssyaeVrnQQRYn6CfzpRINoFFK665jmO19A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359



On 3/29/2025 12:25 AM, Krzysztof Kozlowski wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 28/03/2025 23:19, Nirujogi, Pratap wrote:
>> Hi Krzysztof,
>>
>> Thanks for reviewing and extremely sorry for the delayed response.
>>
>> We have submitted V2 patch based on the review feedback. Can you please
>> help to review latest V2 patch and let us know your feedback.
>>
>> Thanks,
>> Pratap
>>
>> On 3/1/2025 8:30 AM, Krzysztof Kozlowski wrote:
>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> On 28/02/2025 17:53, Pratap Nirujogi wrote:
>>>> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
>>>> supports only the full size normal 2888x1808@30fps 2-lane
>>>> sensor profile.
>>>>
>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>> ---
>>>>    drivers/media/i2c/Kconfig  |   10 +
>>>>    drivers/media/i2c/Makefile |    1 +
>>>>    drivers/media/i2c/ov05c.c  | 1031 ++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 1042 insertions(+)
>>>>    create mode 100644 drivers/media/i2c/ov05c.c
>>>>
>>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>>> index 8ba096b8ebca..fd160feabc41 100644
>>>> --- a/drivers/media/i2c/Kconfig
>>>> +++ b/drivers/media/i2c/Kconfig
>>>> @@ -337,6 +337,16 @@ config VIDEO_OG01A1B
>>>>           To compile this driver as a module, choose M here: the
>>>>           module will be called og01a1b.
>>>>
>>>> +config VIDEO_OV05C
>>>> +     tristate "OmniVision OV05 sensor support"
>>>> +     select V4L2_CCI_I2C
>>>> +     help
>>>> +       This is a Video4Linux2 sensor driver for the OmniVision
>>>> +       OV05C camera.
>>>> +
>>>> +       To compile this driver as a module, choose M here: the
>>>> +       module will be called OV05C.
>>>> +
>>>>    config VIDEO_OV01A10
>>>>         tristate "OmniVision OV01A10 sensor support"
>>>>         help
>>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>>> index fbb988bd067a..08bfc2d59be2 100644
>>>> --- a/drivers/media/i2c/Makefile
>>>> +++ b/drivers/media/i2c/Makefile
>>>> @@ -80,6 +80,7 @@ obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
>>>>    obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>>>>    obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>>>>    obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>>>> +obj-$(CONFIG_VIDEO_OV05C) += ov05c.o
>>>>    obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>>>>    obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
>>>>    obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
>>>> diff --git a/drivers/media/i2c/ov05c.c b/drivers/media/i2c/ov05c.c
>>>> new file mode 100644
>>>> index 000000000000..96c4f74af4a9
>>>> --- /dev/null
>>>> +++ b/drivers/media/i2c/ov05c.c
>>>> @@ -0,0 +1,1031 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
>>>> + * All Rights Reserved.
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>>> + * copy of this software and associated documentation files (the
>>>> + * "Software"), to deal in the Software without restriction, including
>>>> + * without limitation the rights to use, copy, modify, merge, publish,
>>>> + * distribute, sub license, and/or sell copies of the Software, and to
>>>> + * permit persons to whom the Software is furnished to do so, subject to
>>>> + * the following conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice (including the
>>>> + * next paragraph) shall be included in all copies or substantial portions
>>>> + * of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>>>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>>>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>>>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>>>
>>> What's with AMD? Second patch that day, same issues.
>>>
>>> Drop license boilerplate.
>>>
>> Done. Updated copyright header and license in V2.
>>
>>>> + *
>>>> + */
>>>> +
>>>> +#include <linux/acpi.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/units.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +#include <linux/gpio.h>
>>>> +#include <media/v4l2-ctrls.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/v4l2-fwnode.h>
>>>> +#include <media/v4l2-cci.h>
>>>
>>>
>>> ...
>>>
>>>> +
>>>> +static int ov05c_probe(struct i2c_client *client)
>>>> +{
>>>> +     struct ov05c *ov05c;
>>>> +     int i, ret;
>>>> +
>>>> +     ov05c = devm_kzalloc(&client->dev, sizeof(*ov05c), GFP_KERNEL);
>>>> +     if (!ov05c)
>>>> +             return -ENOMEM;
>>>> +
>>>> +     client->dev.init_name = DRV_NAME;
>>>> +
>>>> +     /* create sensor enable gpio control */
>>>> +     ov05c->enable_gpio = devm_gpiod_get(&client->dev, "sensor0_enable", GPIOD_OUT_LOW);
>>>
>>>
>>> s/sensor0_enable/enable/
>>>
>> Is it okay to use "sensor0_enabled" as connection id? We used this name
>> to differentiate the two GPIO PINs that has to be programmed for RGB
>> streaming to work with this sensor.
> 
> How much time did you give me to respond here? 20 minutes. In the middle
> of my night. And then you send v2, without waiting for my answer.
> 
> That's not acceptable for me.
> 
My apologies for the inconvenience caused.

> Best regards,
> Krzysztof


