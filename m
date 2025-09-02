Return-Path: <linux-media+bounces-41535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F7B3F9AB
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE8691B23262
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454202EA48B;
	Tue,  2 Sep 2025 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eqANJq3F"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121E82EA46E;
	Tue,  2 Sep 2025 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756803961; cv=fail; b=HZhFd0QpwCbKSNuw6c9qhXGX4jxu4acjIemGPL8q0/dYoUELOnViFPioskVNKYgMCyMpu5vNcw8sP2nGLHHsec9Vc2H4Aw3ElhlXs9xxTSimAkaavIdWtWoei966u1CiwNyiw9U3lHNO/zPe2eRl28EOxWxR4RLk5VIfsP/LyBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756803961; c=relaxed/simple;
	bh=A8TbwqCD6p3922ROLDbI5SqMC4hIx7VCn5mM5arfkDI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XWNW073i/L3fPN3MM9eAw8fpxcLeh5e9qY+KzStm8dahpkCO8v3E5BOFfp6U/kYn5fnOVSbbiExQZvq1qe1NcrXikQSSEFP4HMbRmEdsUIQZpXznTJVmMzY26uWhMbr/V3xikiMe2wsQlnsmcBzwWaaIK5/kbE014chjAzXDSzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eqANJq3F; arc=fail smtp.client-ip=40.107.212.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a65ljTpWK4nwa2ev54fY7VhwcslHGlZfgSMfWkbr97c7JbbaeBwRFIjrzCDJ9A3oNtxRLUckFdcbduhh1ZKjecVol1cHIBsPhwmFgSSUuSkaasns8KpV8WBFLtPhEG0K80VFPR4gnDFhrp5H63HXG1y2BdCA50RP61rYEXPwLfQdWy/DtKcZEZWzOaAtFKtH9A5otr55hTSn5sy8jrhuO4y5VFhlkzylgWxUaB81h1iWupTvkP6wJ9it/uKoCRP/wbfYRNX7yA/MlZOubCOTouZn9SIiEuOyEEfMfDeUhw18BWH7HNTcFPrta1tTU8W+t2Bm9h1I5gTC+mpzCOEaWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZQ6mPDYPnsAFind7m2F3iNAmTW0XZAzs7mbW94AT+Q=;
 b=nvjJHI2jZGRMfH+A6JwtvQuNWRwBhx7lsaVAN/4KkVUiMXB8Wy2GUfII4GeZSeyf/H+Sk7jdE7T3rK53ysxrYS/vkKE7Eh9SDgKPlKQAe+nhJMnH9OzG4NGUkzDMBIOGqazUeeI5g6M0ZoCH41xfCmB/pTYq2O7y8dSh0tihCbvm05e4+Ult4p4IgaPz85UkujEpIixy21lpFT9BvbqeCWUkmIIkROkfwlSNpF0XFSweDP4TvZA/Fo734Yd4S9/OyRkeqO/QzmkqzGSjmv9MInzsJxvFF8inoqsAeyG4B2YvE22Kh/2/nPHAByHr1t3Bm5Wa9H3vhqpiWnO/h9XD2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZQ6mPDYPnsAFind7m2F3iNAmTW0XZAzs7mbW94AT+Q=;
 b=eqANJq3FXL/Pkef3pTnZEiBqv1ZAg1Wz0fV400gYL1zwciLlhU+ybzdUKyI6h/ZgZpy6d49SFgtlsvx0lzYxrsMMQQ56yFiBrfSM/++PZbB7t+IBA/BlNitmA1v8FcgltMikKEb85SPm9zbISvpSOX1iOuQzUWifCZXH2An9Vf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH0PR12MB7864.namprd12.prod.outlook.com (2603:10b6:510:26c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 09:05:55 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 09:05:55 +0000
Message-ID: <2eeca11d-52d1-4557-938c-06fb91232fe7@amd.com>
Date: Tue, 2 Sep 2025 17:05:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Markus Elfring <Markus.Elfring@web.de>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Anson Tsao <anson.tsao@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dominic Antony <Dominic.Antony@amd.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@amd.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, King Li <king.li@amd.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Phil Jawich
 <Phil.Jawich@amd.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Pratap Nirujogi <Pratap.Nirujogi@amd.com>,
 Richard Gong <richard.gong@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <7c662bdf-bba8-4821-aa28-8448621be0a9@web.de>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <7c662bdf-bba8-4821-aa28-8448621be0a9@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH0PR12MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7ffb64-c3a2-4e6a-10ea-08dde9ffec68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RC9nOUZXMFJ0aHhVRmhDa2R3SCtUeElKbTdBUGFaSXNMSitXUm1hNWVyK0No?=
 =?utf-8?B?UllFZEdIbExsWUllNSs1SFJGMVdleVdHRU0wVEFPbVV5bStMKzZUdDdESE5n?=
 =?utf-8?B?SXVxRGxmKzNRQ1VoYm9CWnB5QWYrZC9jUnFYQXZ4ZGEyTHplVS9tT1BsQlBq?=
 =?utf-8?B?Um9WSEorcFNhQUpCQ3owdzZFSVFUY0tRWjhPaWlaUEY1dnUzWERqa2FpbFhG?=
 =?utf-8?B?NCt0ME5iOFJ0TFlwVWZIU1h3OE9DcEJOa1BIODVsZ2E2REZlRysyQ2pzY0Vl?=
 =?utf-8?B?VTJVamZRd3FPS1owMk9CM0hYVmV3RGtVMVdvUXRlWVl1WnIzRnJyVXF6WnRU?=
 =?utf-8?B?VVppajhQVDZwc0lwRTdrdEtWOFVGWGtHS2pTSWdZSTVWbXhlUUl0NlJFdW9R?=
 =?utf-8?B?MFF5YmUwcFd1RGtFdzBPdFVFWXVQM0xOSS8vK0RNWi9sdER1QkFYRW5TZUpa?=
 =?utf-8?B?c25sb3RGNlM5QktUbkdvZ1dtcG92RHVKdEZlOEQvdkpOU0I1Nkpnc3lwMHBT?=
 =?utf-8?B?dVpsbXI1SHFRRjFyVnAzdjhPYnc2YlptdFJzZVNkalkxT3cycFBITkdCRE90?=
 =?utf-8?B?UDdhTU5jS1kvamZGOVhZV3UydGVDWDc4WjhWaGxuZlBmOHJQZHdaWjQ0eXhG?=
 =?utf-8?B?V1FGSnZBeTV6dzRjUlloN055WkVCZER6b2t6WEdEK0RDM2hRS0t5STZKRTFx?=
 =?utf-8?B?UGoxeHMxL0E5Mm1TUkRaenhFWFpORUVLbHBNQlp1OFZHQlprZUYwUSs5eVN0?=
 =?utf-8?B?MnUrWVRYQWlQOGNkVG1jMmNaY2RwYjArYXp4aXh5Z25KK2htNUJ1ZUphRGFY?=
 =?utf-8?B?L2h0VWJRZ09xWnBaMVRoVG8rNUtjWjFLTFBtbmFuVDVKRFFVS2pmellHc2Ji?=
 =?utf-8?B?R2I4WjB0YzBoaS85dHp2N0RPWjZJWFNiU0dGZDZhaUtIckVMamV1MlFzK3ht?=
 =?utf-8?B?VnpZeXExNWZ4VTlGRUVCWjlXeHlnOERFc2h2UWdmRFNmQ0VDL2o0YXlucy9I?=
 =?utf-8?B?SzNWSXZqc1kzcHVVU2RRUVN6QWxRbzcydGlQS25Rd1JrQ1ROaldQVWNVU25G?=
 =?utf-8?B?R2wxL243K3V2YTdoSmJpeXk3R1Z4cElJQ2tjUVFwOGVDY05Sd1ZmWUJlTWox?=
 =?utf-8?B?aXdTWlRGbDZaTE92SWNkcVdTdWdVRXpVMjliZXh3NktOaFl4NzYwWmxMbVZ6?=
 =?utf-8?B?K1c3UUpBdi9IdjlVUkNHZmNSWkhRMjNYSXY1c2pzbC9ING1LY1lUemhTdnhT?=
 =?utf-8?B?b2FEK1p1ckNlcUluNXRnQkM2OWNUVGFaUnBsZE9BVldoT0QwUk1CQkdUN29a?=
 =?utf-8?B?a3VaZk5XRWFya29HbEViejlYOFR0WjdPb3YxenIwMUk2ZGt5N1BGRnprcGFG?=
 =?utf-8?B?REZpQVQ1KzdNZVlqMGdVNys4VUUyc2g5b1RPZ1IxaEE5ekVzb040L3JnNjdZ?=
 =?utf-8?B?dCtBMGxRWE45N1JsV0hhb1UzU0kyak5SaERmUHY4aXlIcldMWTdNcm05enlu?=
 =?utf-8?B?TnJ3RlhZcDZla0xZMGE1clVhYStOWUJLL01wNlhoUHNIWGF3cHhxZWFkSTVE?=
 =?utf-8?B?UjBRYnpYUCtmVHpLTGp0VDF5enV5QzFKRnA5MUlPVEtvbUpwaUVnYW44Mldl?=
 =?utf-8?B?NUUwbzhFRVNKTmEyQ3h6Q1Z5K015bDdvTjR5eXQvR3Baa3FOQmpXOGx0Uk04?=
 =?utf-8?B?YkNvR3BmNWMrYlFLR2RFYVdqeWFXV2xkTkE1TFYwVkN6bGxiYU8xaUNOU3g4?=
 =?utf-8?B?M1pzaU1PRGh0bzdzYUdCdHBHTThjVVcrMm5xS2M4YjdWK1NVTyt5WXFLektl?=
 =?utf-8?B?Y0laLzNLTGMrcEF3b29jR2xWNXYrVTdjT09NYUk0Q00vN1ByWEhuRW8xT0tl?=
 =?utf-8?B?TW1SQVF4bUcvR3RIa0E1UHVkcG52VUJDMzF5cXdaTG55b29YNDZ0Nnp3U0Ft?=
 =?utf-8?Q?XCW9C4LKAS4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnVrQzdZdk9oK3R6SkJONHVaRTBrZ0YzbXByQnpRSnZwL2ZMcnF3cnFuUDZM?=
 =?utf-8?B?V3pRR2pBLzJxRVppSWhMSUJvQVRzUHdxMTMweFMrSHErdVNxNmJBejJCOWhE?=
 =?utf-8?B?VzJRWlBRUUU4T0lUckZmWWJTVGNYZStFTVcyRVFIOXY2bWh4UHl0V0JTaFYv?=
 =?utf-8?B?Mkc4THhway93QVRJWmFKV2g1WHluWFlXUWV0UTRnRnFRd1ptZDVNSjRmOVJ4?=
 =?utf-8?B?VzVXeUsrU2JKMGtrSHhOSVAzNXVvWTRBck5iSml2R2M2S1Y4NGp4N3pjRzRN?=
 =?utf-8?B?Q3Q2M2loZTI1UkVJMGIzSUxDcHBuSEVLUGlYRnMxZG5KbUhlaGl2RVErK0tP?=
 =?utf-8?B?MC96N1lvSG9DT3UvY2E4TkQ1UWpGdW95dW5Mbll5R3pmWjJCSFEyZ0pjd2ov?=
 =?utf-8?B?emVuRmcxbWtBYTlKQ1d2ek5nWldNRXArWEpCVHVwZjAyMmZKNlRFTUdmSEU5?=
 =?utf-8?B?QnloZlVHYU1zVklreTRzSDRPUUNEd2JZbzFJU0pqR21rcExtUjJSYS9DaTh0?=
 =?utf-8?B?SGprWGpBbGRsZUNOMElkMGt1Q21YZ3hWVFpJc2wwQW5QNFY5a1dIOGowWUNL?=
 =?utf-8?B?SzVKZUF6MS90VkEzT0lUY3hLNW8xdXBiZEpyM2JZL3FZWVRyMmowWHZsWEoy?=
 =?utf-8?B?djdORlJtUHR3UjhTWkNFU0FEZFRLMGVzMmhhS2FyQXFBRWpDZ0N3SVdzeGRh?=
 =?utf-8?B?VEZickRKR05wQXZIbk1HbTVOWnNGUTJxOVdCU3I2MFpFbzR6QWk0aEhxOGIz?=
 =?utf-8?B?eS9xSHpYTHlqY2xpUzFyRFZrcm13enZodXVzR3IrU202UEJjOVdyY0lmWHN4?=
 =?utf-8?B?Z3RvT2ExQjl5aktuRE1SdHdoMnh2WnNkYjJjQ3pQWWJHbXh3YjF1V0s5YVlo?=
 =?utf-8?B?bmcyVEExZmZHczlYZVZQMXF6eWh5b3VleFUrMVRZYTg3aG8zb0kxQVZXQVpv?=
 =?utf-8?B?MWljMDU5U1lwRkd0bEh5cHpwd0lLMGNxdmZ2a01UMHI2VEg2YllOUHphdkM1?=
 =?utf-8?B?UVhEaDc2SzF0TmltR2paTUtUeG9ndTZrZEVUUkJreUM0azhob0dHZEdzU3lT?=
 =?utf-8?B?WUlicHRNajZZVGlMRWlVdDRsMUpCSk9SNFAxMzZzYnV4bU1NS09qTDNlUFhR?=
 =?utf-8?B?Mi9NUnlNVkwybXpOaFI2OUJhV1ZkWkZyemVvMnBVY3kwZDFiQnNYMSs1RTdy?=
 =?utf-8?B?MktCUnAxMEFBanJwcjZYMG81Z2tVenlXbXlzbk5yQzNzd1NhL2o4THFJQ0ZX?=
 =?utf-8?B?Ry9XV3c5R0xXbUJnM3dyLzNlcmJhUXYrekJsUkdxN2hWcmt6OWxvbFhSNVI2?=
 =?utf-8?B?WHU1ejlIU2JRY3loME1UQTZ0ZGhodDZ1eUpncnFCOHRXZVVORUVsYjZwVnhi?=
 =?utf-8?B?ZVU1TUE1QXhMMEc0QVNoREFWQ0NkTkUyKzlvenJ2OGY4M0V4WTNOZWs2QzJX?=
 =?utf-8?B?aUNrQkhURlU3S1pOQjFRY0lhRm1nRndXYVRsbnRzaDZNMjE3MmlhRk5obFRJ?=
 =?utf-8?B?RXJyUUR6cFhZV1pUdGl4eEQ5K0lmeDNxZCs3NE56Mmp1VnlORGhBUmNkRGVI?=
 =?utf-8?B?OWZMbEh2aTNhVFM4a2h3T2l6ZXBHSEJNWjlzdDJ1bG42cEtKZVdJUXhMNWNL?=
 =?utf-8?B?TlZ0bVRzcVFMT2d6VzRCTVZDUklJazY1R1BuRVhFcVRSdGdlS1lkTU1DTm9x?=
 =?utf-8?B?R0tYeEQ1NzdZUmQ3YTVYR3JLRDRLMzU0cldQNnBqVTVRaWN1YWViTkd6czBM?=
 =?utf-8?B?cWJCbWpvclZmSVJxeW9UU1kza0JadVlkM1NFWkNQYXlWTnM2NnV4Q3c3Mzdx?=
 =?utf-8?B?NW5jcW1kN2NCWkpXYW10NUZjL2EvVVVBSlh3dS9tN3hPWTVtOFB6RTJEZFh4?=
 =?utf-8?B?Q3QrT0lxNUl4K0w4QlFzYVNaOXBxdGY4aEQ3Q01ZYURnSks0bVV0Z1N5RUw4?=
 =?utf-8?B?VTNwQ0o4VHNNUitBQXhhSkNDamVJNDhXYVMrRmZkZnplNDhPUEZsUG1jckly?=
 =?utf-8?B?TmhGalIraTIxR0JwNVJ0bUVudTFza2s2RkUzVEF2L2M1UjZSZFRhY21nUTNS?=
 =?utf-8?B?UXlCZXJtajJJZDAvblpwTXlzNlNjckkxVUFiTWJ4UFJDTmllL1RYV3ZLN1Fn?=
 =?utf-8?Q?Fg1I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7ffb64-c3a2-4e6a-10ea-08dde9ffec68
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 09:05:55.1974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qd5qNEIG0IxMi4+9C8p+Thh3gCZY+2pG0bpM0OqdUcqTLqt8qdSSFxOsNRlg2RzL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864

Thanks Markus.

On 9/2/2025 3:06 PM, Markus Elfring wrote:
>> AMD isp4 capture is a v4l2 media device which …
> 
> Will a cover letter become helpful for such a patch series?
> 
> Regards,
> Markus

https://lore.kernel.org/linux-media/20250828084507.94552-1-Bin.Du@amd.com/ 
is the cover letter, because of some server issue, the cover letter and 
left patches are sent separately, really sorry for the inconvenience.

-- 
Regards,
Bin


