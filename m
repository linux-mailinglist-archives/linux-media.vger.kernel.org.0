Return-Path: <linux-media+bounces-17545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB5296B649
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4365B22F4B
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 09:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B4B405C9;
	Wed,  4 Sep 2024 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="wxBacRX8"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2134.outbound.protection.outlook.com [40.107.117.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB287155C96;
	Wed,  4 Sep 2024 09:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725441416; cv=fail; b=b9S3qyxnTdDdhb/14keRaBhMEbNTB+pXwTm3gIJtfxQ8DQmby2z2k3SgBJWsnr/hbpyBP0xy7BFONFgFcaDyTCFT3HQOn3lf4GOCujiByJp2oUVWOpiVVwb6lqtwHOueAJHOyBKSj5mP9DIUnvqT/BHBpXZRmME7MHq+PGeD2P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725441416; c=relaxed/simple;
	bh=E3tpMylc5eAj5v16MRFPfLR/wFNF9GnjMs1mMcICtM4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xpno0Efqfu4lK4RY+ZGUL9VRyelsV9EYkwf9x4XcCWmGkpFCvKV8lqLT2uGlLTe0H18FLTRmKYDHlb0qr0PNH9LR3VQkZhomjPmVqb3vTlj3mgozMeiebpE1NxTvRM/HXHCdfLhM2MkxNx2DnmQBrj8ndKu9HQQao9ocg9eeqdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=wxBacRX8; arc=fail smtp.client-ip=40.107.117.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjPA4VeWRPhJHmTnckrsUxNWrfaTtKSw9qyPscAzgmhwX8HCz+Fd0q++LQuSxECvDgZkEEUsWwt2281VuocRmvkm2DFuO6aNhsAyi6gT+ftJS8ujCcYgUC+N5pTKdXjt8nNscT2enVlQSdCMdHtn4iCoPqxjMsGtENGcm4bTBj6J4F2hs+K3BQNwGIQQ99zrrPo/h6ZayBYfcF7TEYcDHnnU3gb4hbnFDrf8LoER+cdXYY5fn1MVdwcJaz6MUf0OuWFUza8ub5mQCZ9cbP50REK89ZyvXl5Go9XL05mQeeRNM4yf8Lih1qwan1YXXagRvKN+I+2iaOzyJMLEhiMVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNMQIYflylNWQE/Vl+rId/3zqEKchWoxkkjHoau3hY0=;
 b=AxZT+9s+ogHheLVXqsNN7+VDyYH2rexeNd55dlZ30RKLnHU4VkxOjT8GQpebUT/X8LWTdW31HaGE5fvZbX6WwHRPlfrG/pzQYhojKC5rsgs/4miQxOrmdIn4SxgauvutVgmWAppXmnQsgS5yMmgHQIA0REsryXLdru/48w0fNwBxXb5pry7pbrHuZUABd7olYl+ArxLvOkyKO9jctPsIhUaLySHhgwkWmUV9ABohdXrgjRoUOC97QwgOHJVoQwhKUFoRQm0Uwvu8r6Uh47jpB5RN1UGf+FKe5cIXNTcm0zgsJ0aawDHvVSq0KAsTg9ww+nsCqsOpCXXW2uXOMdObiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNMQIYflylNWQE/Vl+rId/3zqEKchWoxkkjHoau3hY0=;
 b=wxBacRX8sMh7T9zokTRFF7mGCd6h1SOuLQ1q6khpSjJyzHlpG6aVEPScRCqBxfOkHhrYleqLLu/ulFtvxcWcPtXkyzL5usWFhkYfGKe7naAT2cW+pRmYrgSlfCSrBazfcpQJ8sr1e8kw/ay+FLCIvHQfW61V1WXWdQL03oUXPlHFg0ehTFn5x92bFGmGi6GVf6j/YSEaIjtlw2cbW7joPWJ37xkuHDROp6pDO7YrMH91inbfgWbFASZNKUIN0KQL9+0vDYnYv4L0nUO3k5XfOxrLh2CA1LYDngEa8fTVcalec2nU3OqjpAnEz3Wg9pGp1AKOPJi3UAAExJgp0Tb9Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by PUZPR03MB7092.apcprd03.prod.outlook.com (2603:1096:301:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 09:16:52 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 09:16:52 +0000
Message-ID: <d00f2003-fd4c-4841-87e4-bb977733d969@amlogic.com>
Date: Wed, 4 Sep 2024 17:16:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] media: platform: Add c3 mipi adapter driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
References: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
 <20240903-c3isp-v1-4-8af0edcc13c8@amlogic.com>
 <8f0fd464-b20d-4f44-9c1a-66f8ccab63d4@kernel.org>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <8f0fd464-b20d-4f44-9c1a-66f8ccab63d4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:820:c::17) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|PUZPR03MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 27be8be8-95c3-4878-a38c-08dcccc2500b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTV2L3BDMEVHaE40dUY0NmlWZDU0aFhvRWI3dUF1b2tPUGxna0NaclU3ck53?=
 =?utf-8?B?eDVuSjFKeDZTdmphSW1rR01QVGxUajhCTDZ6VTkwQlpHanJFL283bmE4Zzd5?=
 =?utf-8?B?N1kvUXBmdzFUQ3dHWE5nMDRXcE4vZnQ0WXFRTkFYekt5cGNRQjZhMHBMTGhq?=
 =?utf-8?B?ZXpWdngzdFVIcVdYbXpzNmhnM0EvR1JlUVZVQzdpTmNrVjAvdEI3d2RWa1Bo?=
 =?utf-8?B?YlVqSVR4dmxvZmpxQk5sNnJCQUJJZmtCckZobmZCNEkyOHBkMEEyL0N2cVJw?=
 =?utf-8?B?anZEajc0cTZsb094WEVwR3NQOFBSR0N2eDNIZzZ5T3FPWHA2emlvWk9YcG54?=
 =?utf-8?B?TE1SbVpmOVcxQm05bGtIL21aeG4rU2NwL215VWJPeWZzNVNiUEJwcTZSVEhu?=
 =?utf-8?B?TERDaW1BU1FMYjNUV0RGMTJBbENZaUtzMklTNzZ2SzVwTWY2cXYwUUVVU2N1?=
 =?utf-8?B?N24zMXdZOUhXS3RSN0dQaitUaXUvSlVRdzJZVlc2R1dBaUdiWWJrbEpqQ0dZ?=
 =?utf-8?B?L3ppU1puQWZ4Mi8xdU1jd1FCd0pJbnc0bDhnMHY0cE00U0QwaWJyVFZlRVNS?=
 =?utf-8?B?UkZvY3VEVktFdEVIcVVobkQ4TEdJNldCWTJBWEZWVk9mS0k1dDJrUkFsRnVr?=
 =?utf-8?B?WGdNWFdQbDdFT2VIZEdPamthc2tKOUVjbkNZeUQ4azBGT2Z1S0hERjcvQStn?=
 =?utf-8?B?dmRlNmJUbEpEVFdLN1RuTTNaQ09kaWt0aGNNTVV4cWRaN0p2RWU2cW5HWWNS?=
 =?utf-8?B?QTMzZnJERG0rL0xZaW5TR3pDbndGbFluNUpOa09FYytwRHBpcWFOdFI1ZzBK?=
 =?utf-8?B?MXJQbVQzd2lONXEyemhPdGMzVmdqNy9kM2Nkd25NaFRjaFliQ0kvd0xEZ1Fr?=
 =?utf-8?B?NDFWT2hnellTa25uU2xNOFU2YmNhU1N4R294N2J2SG5ReC9RZUdyME5tUU5D?=
 =?utf-8?B?NE9tOG82MHp3VDdZM2dzVWpmZE5GaXJmbW5UZVVuc1BmLzdtem1yZ1BiTytV?=
 =?utf-8?B?TnZKem1LeFcvSWl3OEV0RURNeG13NkpRemE4UmplY2lwa2dpdWlZTWVVTEVL?=
 =?utf-8?B?aGhzc0ZUbjdXTDBkNXZhcFRyaFNRWFBoa21tKzM5YjdNdU5rQU4rRFZSSjM2?=
 =?utf-8?B?VlJyc3FVUGFqczAxOWsxOTdrZTVvYlg5MlZWMGFHa1lmTUdFaUVSaGYwak41?=
 =?utf-8?B?c3VTSGd2SGluWW5nK2tkb3ZxK3NYMkF6eHRjMW85OGo5TVZGM3ZkVnVLN2hl?=
 =?utf-8?B?YUZKRGRRcGUrbG55Z09pNFpnQjRReHZlQlFzSFlqSGR0RFlBZVBGVFBYamZX?=
 =?utf-8?B?S1Z3TmhSWmExS0FiSFVoOUNLSnhhRWtncHBFN0VxTENjMUNRY1RBbDJyK3ZM?=
 =?utf-8?B?cmp2ME90Qkc0US9taTBUUXM5UTVjSmRMTnVUTXdXSkl6eitJblVVb1ZJaDZ4?=
 =?utf-8?B?SGNkbVYzRnZMVDR2Q0VBWnhwWnd2YXNiT2RmK251TXNTNVhjWmI4U0VUdmQw?=
 =?utf-8?B?N2FoUkVnRHF4S0xpNkV3UGV2SFF5V0JtZ3ZPbnNMTmphR1NxUnU1K2hUdWxU?=
 =?utf-8?B?WWJ2cFQ1R0NscXpwYVhJeXNQMytHT20wSjk2VDVSaTVwSmJLcC9lVkJOWlhu?=
 =?utf-8?B?NCtTU1NRdjdDUlMrUVhsWXNzVUNHbWpLTC9Ha1MrWnJvMWtPN0w0QzNPMnRm?=
 =?utf-8?B?UFlwbU9KaDdaWU5uQkh4ZW5odnQya0JvQkRoMkV4eTZXQTZaK0RtQ0doSWJR?=
 =?utf-8?B?V3ZGYjZTRFdXdHpnTVg5UXovSDJmMU1ib05oN2hsc2Fua0lWY1RvajNIWmtv?=
 =?utf-8?B?ZzFreGF0RWI2eUtHNlZLQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MENOUDFmc0c2ZHZCVUpZOXFQNnphZlVJNnhCM3lyaTN5Rmdzbm5BcWQvU3N0?=
 =?utf-8?B?WWFiUTFOMDRSQ2p6SFpEOEVhWU9GN2UxSERtVHNnMDF3SmtKaU5YNkFldnZt?=
 =?utf-8?B?RG43WTF3ZUpiVkNvaTZFQ0RIdHR0ZlRkR2IwVVRzWk5kbmF6OVQvUkZXNHRB?=
 =?utf-8?B?cyt2UnB2TFc1Zi9qNDMrbFZCaCs1c2pWTzhuek1vMVNOelBFWWhyZ1RDRzdw?=
 =?utf-8?B?dzV0bFlFa3kxRDJFN1gvVXFBT1VWWC9uZFc1Qk5sMmQ2YXROS2xpYkx3d2pL?=
 =?utf-8?B?b3piOXhHVnliYjJyN0ZXUHZGKzBTUkpUOWxKb1hkSnpWdnlpV3FkS2dtWmtE?=
 =?utf-8?B?VnE2Y2lLY3VXa3BPSEVJMXJpNGc4Y0tQS1RQSnloVXRFQ05aRUNCdnlUOE1E?=
 =?utf-8?B?Tzl1dFdWNXhVL2w0Q1I3eU9waWZyOHpibklCaEVtZ0tNQmVZYzhjZStCZ1RR?=
 =?utf-8?B?UlNVNVh5U1Q4a0xVQkkzbXRTNFhUUklZci84SmZyZGxPZ0RPRUkyRDNaSGc1?=
 =?utf-8?B?MThKV1d2eXZ3aFQ0MjhvR0wvRWJSUStYSDI4VUVqUHFmM3lMcVRVeEp4T0Yx?=
 =?utf-8?B?eE91aG0xeEhYOUsyRHZNclNTa1RrcWNkeFRteENBaXU1cG5aakRSdVNQS0dP?=
 =?utf-8?B?djM0S01NaFo2Q2h1K3IwSTZoRHZSSmthVkFyTzVqRzkyYjB2ZVlBKzU5UThm?=
 =?utf-8?B?ZGtiNkVxQUNKOVloUDg3dWVlcm1UYldPbWR1WmZrMit0WHcwSVZlemE1VHh0?=
 =?utf-8?B?eFUzbUJ5N0xEbUpyRHNZQ1l3a0tjS1cvTzVXMXJwR2ZFMUg1a2J1K1JxLzJo?=
 =?utf-8?B?c1BoNUY3Wk42RkxzVVF1RjI2QnZPM2lZeXZrRTN3dklVY2NMRThoWlI1bU5a?=
 =?utf-8?B?dzZqY294S1YxTE9HbXZkQkY5WExuR1E3bCtWSU9Kb3Ird0J5ejArN1g0WmFV?=
 =?utf-8?B?SzJBb0NIU2M1ekM2TEpZZS9MYm5ObjdvQkovMG9IRHRzem4rdUk5a1NvUXB2?=
 =?utf-8?B?RHQvSUNWZUtKMVhBbDN5NU1KTitaMWF2b092b1poSzk2SS9YcTFhaFp3UTdF?=
 =?utf-8?B?U21sc1o0Z0ZMQkpvcDdJbHpTM3pmTEF2eUVFK2NKMExITERFU0JqVWtzNFJI?=
 =?utf-8?B?TlZReEMzUS9LZE1PK3N6eGNETXdOT1JvdXppQXR5UkdLTmRueFZCanJGY0Fi?=
 =?utf-8?B?MTdYUlBTS2NoWkNGZmlEVFlCWVlnZzVmdmR0RTJjcXA2SVBXRXRlSlFWVStn?=
 =?utf-8?B?K1JZNkUwREJUMjlRT0N4TnJ0SnlJb2pZcUpXWTR0azZUSDFHdDhXZHZEdTFs?=
 =?utf-8?B?WjRHUUo0Z2dpYmo2bTdZUzBnVXdzUUhuSHBKRXh3ak5HQ1dFN1ROazhrMDFk?=
 =?utf-8?B?dGpCUnhJNFFCSXNvbVROcmVTV0duYU9jZFZVWjRZY0ZmN1Nuc1daSHlOOGFi?=
 =?utf-8?B?Wk9DNWI5Z3hhMUhtUXpBazFkNkY3RE1laU9LNHF0bjZlb1JheHlXSWlaMElV?=
 =?utf-8?B?dS9ydW5QaEoyeGpyN0xQempyajB0VTFHb003TnZLRzlRWThGZkU4MWN5b2p0?=
 =?utf-8?B?V28rRElXaDlkeVI3ME9LeFpXLzRhdDhnNEN5MytFTm5tMnJ5WjdrZG1YL0Vp?=
 =?utf-8?B?TldRVmNoUE5vSFY0VTFpVDJWQWs4VkREZkdkaWlMbyszVHlrY2JuYktJZ0xo?=
 =?utf-8?B?WTRBYTdmbUVZS1JMN2NtUjJpRy9QZ0s0TGJoZmxkME9ndjVXTGY1WnliWTA1?=
 =?utf-8?B?c1J1YTNkelgwb2VKUldydWdBelFXQmFBc1grYU0zZ25XMlF5eVJTb3Zuam9w?=
 =?utf-8?B?UTE4My8yeEgyaVpVYUJZUWVoT3Z0TTFWb0plRERYdkF0MXVlbjNKNFhpTjhR?=
 =?utf-8?B?akNEVmlHY1pGdUZnWE5JUzhOaDlEUFRaWDd0Tm8rK2VqM0JrejhiWU1yRFlu?=
 =?utf-8?B?ODNVWU95dEJ6VGVycng1VHRvQ1pkUnRTVkZINTBwR1ZvSFRhMFVBREIwY3Fy?=
 =?utf-8?B?RmNubXZxeUVONE9iNitoNlpveVZBbmR0Y2hBeEdmWTBPaFIwUmlMOW9pOGND?=
 =?utf-8?B?MjRLQ01MbHpRdXkvTmp0N2dodXh0MG96cG1icC9zczFBZElZSXBxQkcyNWdN?=
 =?utf-8?Q?x75UIuTYhjJvKZOCgNz/c3cKB?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27be8be8-95c3-4878-a38c-08dcccc2500b
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 09:16:51.9987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fODx5hyQhAa5sY+5hzd69nhp2EZu5Fx+nChrx39ZJJ1b+7G1r1VnfLve33j4aMN4hxk4fjO6E88w6tfzgOjBOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7092

Hi Krzysztof,

         Thanks for your reply.

On 2024/9/3 22:12, Krzysztof Kozlowski wrote:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On 03/09/2024 08:57, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> This driver mainly responsible for organizing
>> MIPI data and sending raw data to ISP pipeline.
>>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ...
>
>> +static int c3_mipi_adap_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev = &pdev->dev;
>> +     struct adap_device *adap;
>> +     int ret;
>> +
>> +     adap = devm_kzalloc(dev, sizeof(*adap), GFP_KERNEL);
>> +     if (!adap)
>> +             return -ENOMEM;
>> +
>> +     adap->info = of_device_get_match_data(dev);
>> +     adap->dev = dev;
>> +
>> +     ret = c3_mipi_adap_ioremap_resource(adap);
>> +     if (ret) {
>> +             dev_err(dev, "Failed to ioremap resource: %d\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     ret = c3_mipi_adap_configure_clocks(adap);
>> +     if (ret) {
>> +             dev_err(dev, "Failed to configure clocks: %d\n", ret);
> All your patches repeat the same patterns, so all my comments apply to
> each patch.

OK,  I will modify the code according to your comments.

Thanks again.

>
> Best regards,
> Krzysztof
>

