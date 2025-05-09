Return-Path: <linux-media+bounces-32071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA09AB09E2
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 07:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AB404E54ED
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 05:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2151F26988A;
	Fri,  9 May 2025 05:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="BDMjuBQ0"
X-Original-To: linux-media@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021097.outbound.protection.outlook.com [52.101.129.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F89139D1B;
	Fri,  9 May 2025 05:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746769727; cv=fail; b=sckDAN1fcEPDZfs/FU/DQpi4QZ2aLbFZzXQin5PLAlfO93dsPF3DzTOoiQlE8MeTpMu2qvGjjbHIxQ1jmhs7vN6490LV/eapSLNTATi+hqivrGRig0rtM5gCDojTyti8drjR4UWpb7hcpgDsOaoTCyKhVeMO03iphSZKzzihUos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746769727; c=relaxed/simple;
	bh=E+xdKIkX59FVW+tSSGI8qOOQlkPbOFR6G+MdKwfVz9s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MGbjIjaVoTccJTZXRPbbB5PY+jxgYUhb2j80KGibXaUfr0L/O1oCiNrky37i/AJ0tESO+kHBq2vl4COfG5Zg6js71pgxIkvXnZB1HG7AwdiEkZAXNNcdSiTzVK/T/35udkvj4pPP2N0I5aCRKpMBGqmb2ooHLBeW9tg0FULaia0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=BDMjuBQ0; arc=fail smtp.client-ip=52.101.129.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEVuIR/lzK+Ziuw76x9lQJ3iJvHA6rpy2lLAz3JRfZI+JSolpNo8y300nGo1WUW8/WOgAazNvitMOGr68g5BcLZw56ytWJnlMMmF8TeSG/nu4JH0OFq5u/KZUmidT2F4fDOle61Vvhv/+rLZPnkw7Jjwc5MvBfke48OKOTgmM3VBA2DrgQ3iqtoBTYXIEI/Y24x3XZtORgIHPVLvW9wM1dwDRQ18D8CgQOywo18yM2rbqFe2xLte5sCmf3+hHY40GOrCNJDKZsXTux6BhZAYO7D6eLdaMKRv/o7sN9QxW/6YAIkCahHD7BGJ4m6Zisrka10KOyjRamkocod+0PzTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDidjGTlhUSkVsgqZDgriOEJzWiiY2JPJtzB3gtKfNc=;
 b=MYyRjdf0aawOv4ePy+QAuWYiV9M8E+QOJiJdHpvQtaBt6gC1I3WBbNXo+V9wk0oMZgD7y+gNPXILoXdX6DvunKlTAt3hkiYpqD5lKtFKTJnKhIzqmKx9HqJGuIQWdvfBRi9mq6TiYX4CXufskmPB/FrYt8UFySVEOe9LHU0FAmHMf8+bzXqfOa0c+Tu9aQT/ICIo2y72KKmgMqsRdbYvWdN0oehpZDNVSXYbz9hd7m4MS2F5VOlu4G6Yh3r//63MLhsa9b9uPHyVxT8XAI/l2i/B2v/6k7ROF3KXzQ9UOZjdtkTV2OiUS0LvLfjs4qj+L67IFHX9UVf2KnFqJUo7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDidjGTlhUSkVsgqZDgriOEJzWiiY2JPJtzB3gtKfNc=;
 b=BDMjuBQ0/4YsJgCJUJPGpMu5RRolfVF+TBPqDHPfFA7QlanJhPXQOE6vI1zJRNaXkBGg5IEH0Sf0A7kdlpYbFiB+fJ4npWHH98MRW8Vs4QkjkslPcDD/sovZOMiM5/YOmVkWUMNY1Vs7fFiTQxaG6YCyhRPzELS6Hbn+MXtzjMtAbvsIhcLTvjNpXLg/DhVxsPi835O1qPXbobZja0nrjnF5M/egp5nNf/fcFok21k+KV4RHx6X0CGacCWg8q2bh0/StbMffq6i7Q2kq3BzM83d7kEMXUOiPKlq8JpA+qY3ewUAZYfdVoRdRrVeXMH3ZfHfGgkNJbZwwckAa9uhxwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 05:48:39 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%4]) with mapi id 15.20.8699.022; Fri, 9 May 2025
 05:48:38 +0000
Message-ID: <e778eaa9-6a41-48fe-a1a4-35aac427f337@amlogic.com>
Date: Fri, 9 May 2025 13:48:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] Amlogic C3 ISP support
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>
 <aBzXVdM5GWnpHNvJ@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <aBzXVdM5GWnpHNvJ@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0051.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::20)
 To TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|JH0PR03MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: 0938c073-913d-494b-38ee-08dd8ebd2568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1pOZCtxaUttZk5XTFRZSGJkRTR4RkR5ZkVqTTdZamp0NEF2bEttMkM3aUNP?=
 =?utf-8?B?emxXL29aYk1qNGVQL2c5UG5yREpLVXpjK1FnOFpoQXhLc1llc1VQenAwb016?=
 =?utf-8?B?TTkvOGE3YkRtVDVHKy9WZzVVcmh5VEhKcnYzaWZpczNVNzUrNGprS2hveUJv?=
 =?utf-8?B?ZGxkeVlFYTJaaTFRT1ZHcVZWM0lndUR0WDFPOTNwTjdWUUNGc0VLaUVrd2hT?=
 =?utf-8?B?azhBNVI0U2pCWmdnQ2pzZUVJNjM0d2x6a3RHQXhianVuMCsvb3ZSMjAzbUlH?=
 =?utf-8?B?SXIwa3dTeVhTbEpiZ0p2QUZYNGtjWmpraUJmMEtMSVpSQ0lSYzVlTDdpTEh0?=
 =?utf-8?B?NXJTVnB4cXJDSXdpSkZpVnQ0S1A5c3hxOU43aUFuQWdlbUJ0RGdrMnZuKy9o?=
 =?utf-8?B?VzFaQU1mZlBHL25WeFNZSktITzNKOU5YQTJaT0lTVjFzdkRHdittd2EwcnY5?=
 =?utf-8?B?SzA0elIyV0VBWVdWcm8yaTJqclljc3hLRUUvc1haNlJzOFZYeS9FTGdRNzJL?=
 =?utf-8?B?dThIOGFtcGZOdTltTHdsalRmT25ZQWExcGdWczNGbGZHWW5mRWZyNXF0aEU2?=
 =?utf-8?B?aVJVbE9RUjNUd1dkSldnR3ZrSUc2SVJNak1RVDBZWnNaYnltdnlZVncxcEZT?=
 =?utf-8?B?UjN4eUlPL05UaXVuVWJhMXp1R0FkbWE3cFJjc1Z0bUIwOWRGZkFZZGZBbHd6?=
 =?utf-8?B?ZlBVaURyam8wWTgwQm9kQXEvRTFjMDV5VnVlbFNzR1EzTlh1UzFkOEs0ejk5?=
 =?utf-8?B?YTZEWFNUclBDQlBMYk9iSkN3S1NpeFV2YUZrUHdwQzNpSjh4WmpuV0cyZU9p?=
 =?utf-8?B?emx2YjN1VjQ4TUNHVWx3bGF2Y3hDaWdKWWlhNC80aVFRV1hiaTREeVhsdUQ0?=
 =?utf-8?B?Uk1QOVZ5d0phN3NaVlpCMllick90d2FlNUNmUUtwMDd3TzlneFJVeFZ0Vkw0?=
 =?utf-8?B?Q0NybVpzN3BwMG5BZVExMWUyOXozYituR2FKQy9UK0FwblhBVExaYjE4aktH?=
 =?utf-8?B?QUdURXpMcnA1TnFKclpGZXZ4RW1BSURNV1cxUXQxaXRweFpHamY5QWxnZnlI?=
 =?utf-8?B?ekh6WVdqZjgrYk96eWM2MnlKMGdOVlgyc1dNNTQrTDRYTEJEMkJ3TG5yRzNT?=
 =?utf-8?B?RTFJbXRSQmUwVXRkWHl0UzZWaXFqOThQajVrOEJ2emtTWVpqUmdRdEVwTjJQ?=
 =?utf-8?B?SXZPNWdOYU5mSG5MK0p2ZE5XeWFjeUEzeTlQc1I5cTZraDdic2p0eWVYamEy?=
 =?utf-8?B?M1RwV2Yxa0trczVRK1hRUlJaclhvekEvaWxxTjE4Q1hHT2VZdmx1TTNyVGZY?=
 =?utf-8?B?S2w1WUR4TkRzdnBjaDQrUytDRTN1YjJRSG1uM0hOZnFXc3BqdHpLNkh5U244?=
 =?utf-8?B?SW5Pby9vMEVzWW10OHBJYyszWTY2ZzNNc0JpQTM3d09obXZ4cFRJdVAyTHJ5?=
 =?utf-8?B?MEtsZkszOG1JL1I0aWVaZUVxdjNTak5qZCsyWEhYRzZGUmtYbGUrR1ZzRmYx?=
 =?utf-8?B?WVhwaE5vODVXaHducHNOa2RVWVY1SVorTnl5aGFNWVJ0T1pxNE43QkMxdmdC?=
 =?utf-8?B?VUJ0TnE3S0kyZ3FMQ1hoa3pkQnBzQ2JWZDZUVGNsOHJEa05qWnp5MHVya05C?=
 =?utf-8?B?bXkrUTcrR3JQZW8yaGNsajl1UVMzLzZhZFVSNTZaTXFzUDkvc2dBRXdZZm1u?=
 =?utf-8?B?NUhKSzNyRGlmVG9UYW5INzY1OWo5ZkV1Y21CUFAyZkdPOEhmbENHalo5bHlz?=
 =?utf-8?B?eWR2YjNmdWsrRXlZU0s3cVNxdkFBMDY3VVc3NVpoUkV1TEV1bTdSTGdRYm9B?=
 =?utf-8?B?V0xUSmtLNEJkWEY3T21jVElUUXFBVXBEaENlTEpBYnM0NVN4QlU4dXRwTFFK?=
 =?utf-8?B?czhBR0xIdVJNcXFkbXZJTTM3eGhYN1dyYm9MWmhkeGFwamc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1ZQck04K2x3emN3MzNHVHZuT28xQVdSMHo0TDE2RG9YOHN3Z0RlSlpqQ2cx?=
 =?utf-8?B?Q0NZSDkwcHVzYWtZK2owek5ERXFQcVFuS3RNQjBVN2VGWUYydkI5b2phU2xO?=
 =?utf-8?B?ajFFT0N0Mmt2YlVvY1llMzljT01zeGpsdUhUMXZ3OWFTbWcwY1BSZVBxaXRP?=
 =?utf-8?B?ZFlDeEVtcVB2TkVIdzVQQ0JQK2NkMEdDUnRTWWZoTEtLZlptUWNsN2FqUnkw?=
 =?utf-8?B?dEZMTnYyVmFiNTRiUkdUZE4wcXk0NTFkUEpKU1FBSDYwNVpXM0l6ZEV1Z3pn?=
 =?utf-8?B?L08vVzlweDJHcW9WQ0tHdzBLTGtqU3F5eUZPdnBpN2c0dVRoTDgxbU5UTita?=
 =?utf-8?B?R002TlNCQ054Y2VTVUltNU9tL0QzN1BlVyszSWszM3FDVW1LbnNjM3FJSFYz?=
 =?utf-8?B?TnlNSHA5SndMMm9ETlZsM3BmalRYSjBTSy8rQ3VTSWdFZVBkYnAzZTNKekFV?=
 =?utf-8?B?ZTkvVmpPMFFMNmMrZ2RWRzh4dEVCMTBHUFRVRUpVV3VwL1FlSmlZeGYzMVhz?=
 =?utf-8?B?eXJCdllCVlM2aHM1WCtYSmhvSFFvMzQ1MXRwaW8vT1g0ejFhTmdPZTVwbjJE?=
 =?utf-8?B?YUI4Sm1PK3BlRnRoc1hhYlAyQ01IaGMwbFkyMUtaVHBuTnJuSGJlaUY5dnRZ?=
 =?utf-8?B?bm4zVnN0Q3dNY3JnS0lyb3BoaVIyOFlZdU4zR1Z5Zjl3OGE0cDBML0Q5UGpT?=
 =?utf-8?B?UmwzWDVJSS94M21PTnlUeTMyWWRxYUZlRS9NNlFLL3NHVmdYVVQxZGxaNHBI?=
 =?utf-8?B?WnNjZUR0bUF6cVZnVTRDTUJSTTlDb0I4T04rcm9oSHJIOGY0WlNLZXd3ejFU?=
 =?utf-8?B?YldzYUNxT2JhZEJxTWdVSTR5eHhLUDlLWlpwRmFzNFQ5aTJLZkFvUXdpTnEz?=
 =?utf-8?B?MVh5WUZwU0s0aWVBcEh2L1QyNkVETVRqaEQ5YWpGUmZuT0hSYndmVFJSSTVE?=
 =?utf-8?B?SXlqSExjMSszU3VxajBWQ3JXU0VUdkJPUStselJpTkxHRmhORUx5aGFkMHdO?=
 =?utf-8?B?YlNzL0wrbVBzb1ZNTWVKM1lXaHdpcVpRTjkwLys1NVg0YWI2Ym1wZHJaYkRR?=
 =?utf-8?B?dkJCRWhSZlZLR01vbW9ZT3VkWjdDWVNxMkN3Rlh4cmpEb2xZV0xWeUNscTRO?=
 =?utf-8?B?TG4yRTVaMU5JYWtyQU9RNjd2WTJiRWpSR0dWNkdIV0h3K3hERzA4Y202bEZI?=
 =?utf-8?B?M2U1UWVMa3NSbkM0QlJVbU9rVXBCNVhXeGx4bmhPUDdzTnJFcnZKalg0ZUox?=
 =?utf-8?B?NC9qdWFPNHFFOVRoZ1Vxbk41WENJNnd2b0lmZVlhSk5mMU5nMFZZZ2s0RjNP?=
 =?utf-8?B?NGh2SXVxV09qMGtXbm94RWJVNDlpUmJUcVA1UEZZenlsTTJhYXNZdWZPQTV0?=
 =?utf-8?B?elJqakdjaGh0dk9ncXdxVElTSkExRDNwazBOQnViUEIvSjE5OVd6azNsZTV1?=
 =?utf-8?B?SkZsTHRObWpsaWpyQ1ltOVlCeHdOWE5wbjdieVg4eFVXS1FWUVNBeUdGU2ZR?=
 =?utf-8?B?WE5HbHNidUs3ZmFua20vN09SRjg5RXBZdjgvc0xycHJWb212TmVYUE42cXJR?=
 =?utf-8?B?RS9mQVV1aXF4S0ZubmpnTDNoQU9EenJnM1I2cDVVb0NjazVQek03dHlqV3Qv?=
 =?utf-8?B?VkxGbytmNFFIb0dVajc4TjMvYVdnMUxSVzhjMHltS1crWmRFajFJSW5SeVBN?=
 =?utf-8?B?TjRSZXlTb0Y5NmRiM1FSSWZCVXpmL095blpsbjNGdkRNa3JsK3RPNHZPWTUx?=
 =?utf-8?B?NHdBQ2pjUmNvdDRPVUdSbzVvL2F2U3pneldFTExaUEM5ekpvVTQ5UnIxTnN4?=
 =?utf-8?B?ZnpTWEtjbEF6a2FKWUFFeE5RSTMzZndJSGlWNzUzcjY4SnRwcGR4UFZwcTI0?=
 =?utf-8?B?R0ZOMTBZNitWRXYzS1lKT0lFcWJyeEpvekxBM2F6dndzYmN3dXY1VkdmVlV1?=
 =?utf-8?B?a1RGaDZXRkFnV2hSRzNBeVJmTm1NWHFuWXdWd1BpVGxnaUtGYTU3bXBWaUVB?=
 =?utf-8?B?akJkNENZVzJmSnJYOWdVbmV6WUFpeXZjeVBQa0psSGpDMDBNc0hSb25Kd0VD?=
 =?utf-8?B?YlllaW9SQWUwTUdJZXMwVkNMa01MeEFjZS91QURoZ2hKS3VpbmNzT0JRODYx?=
 =?utf-8?Q?cyuR+Tq51WXL9HerbK17HENhR?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0938c073-913d-494b-38ee-08dd8ebd2568
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 05:48:38.6272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXPucztbs07HzoiQ13Yq47EPfc9xz852tIjTQ+b+RI6MQAvZGTjlhJAfzaAi9k+8eL275nQpecBnhT1x/NWuFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8637

Hi Sakari

Thanks for your reply.

On 2025/5/9 00:09, Sakari Ailus wrote:
> [You don't often get email from sakari.ailus@iki.fi. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> Hi Keke,
>
> On Sun, Apr 27, 2025 at 02:27:08PM +0800, Keke Li via B4 Relay wrote:
>> The Amlogic C3 platform integrates an ISP capable of supporting
>> multi-camera, multi-exposure high dynamic range (HDR) imaging with up to
>> 14-bit raw RGB Bayer data.
>>
>> Capturing images on the C3 involves operating the CSI2 receiver and PHY,
>> an adapter layer that integrates the inline processing from the PHY to
>> the ISP, and the ISP driver itself.
>>
>> This implementation consists of several distinct module drivers and
>> is expected to support different platforms in the future.
> Jacopo has already sent a PR on this and none of my comments address grave
> issues. Please post further patches on top instead of changing this set.

[02/10] and [04/10]:

We will address these issues in further patches based on your review 
feedback.

[08/10]:

We will migrate to the common framework once it becomes available.

> --
> Regards,
>
> Sakari Ailus

