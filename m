Return-Path: <linux-media+bounces-47908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D07C95C7D
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 07:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D4C33A3065
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 06:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9E8267B05;
	Mon,  1 Dec 2025 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s710UuXa"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010055.outbound.protection.outlook.com [52.101.46.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F1F2147F9;
	Mon,  1 Dec 2025 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764569798; cv=fail; b=LXy0k9Mh8Prk9bgttyGwlPOWGuFcbGRQJUb/6PHl8biXHyp7DhbJomlIxUf0tIoXAX3uo7yyzGhPPSeuICr6GFHJ4ZKimLE2Tj14gYYV2lDjuWdrgRBtnUn5oioPr6oYq64QhCh5Pc/43eaQMDqTosD7ZeQFc6ZorTYTB8u4GEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764569798; c=relaxed/simple;
	bh=2u1bk4GVc0TNYUQIiw/f3HtZwHm6U4KqKjGJeDEdpBQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=njkt3ygfAdYdti4OLQDZ5d6vAGYihL6R9SrZQsKXnVjf6MR9/s6OIDRLv1QGpykO+LCdqBp/FKJIr5jcP2F0uWRTPm4o5/IsIKSXj4AoEkYmmvGpL9PUvBpaWtFd6WnSwhOwRanikrACASaefW3uHMSEKdaRkyf2CB9qDHOY8gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s710UuXa; arc=fail smtp.client-ip=52.101.46.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+cDSLKFIo9aKkd6KajRA1lNbuKr83dQd8AR9ZZg8cyGRE8jLRCBWYau0f/MRTgb+LSe/gVpKNK85Who/vXf6e1Xyvtsvwx7pKHI3Pm1E9ZnSPJsafGNm0ffmay3DP02MxHT8sLnrgOrnX0MqsbfMSbeQsIytfVPAnUisV2daTugQ/Ku0luLxSkg5wB6rMoH6o7iSbqKIklQTVsMgq20uuFpuOYviGlsD9dGX69lMi4ITBFefL9U+v7/lBQDWhlRkxFf4HntWSbgSjI5bBHZTA79/ECu+CzZZ71P3dHtF84dUkCAEgZk3vUbUJFADiAGR1cMLTJ8f+nq69sHFS65dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKctavpN9eMfCTd9mucHkELZi3IZTSZLVczRxv3m+Xw=;
 b=HzHUAskCCCvfZmtdMyZJJc6wj6o9WI0gZ8pNAwub+OVkAcSGTeSeBJCaQ76uBexixyC46az/tDLKDKTu7jn4GuAA5IGK7TLfPj1PZaIUiFhUKWJmEKP88lHofHy9UyPytGuY5LQt+ADr3p35htCxvhK+DjGz3Vmq6fXzD1ehIZKnF/I6USLb/s9+1oBk93gjumlen2dywYJpHtHLkbDyTgFye5tvVAqwqzYSf5N6D1JUer0LN7jBcK9VWAawFoHLcZx5kV8uLlfP7/9BYH9+FJ2BwdnbboEcVpBO7dA8wftM7XqdwBznwGHc0alZ94H5KNhkjytAM9RA54d1eHAXqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKctavpN9eMfCTd9mucHkELZi3IZTSZLVczRxv3m+Xw=;
 b=s710UuXaOCRw4V0ko4oMeeXOvWiS6tsnCjP/OhAHx8honO10lUzzNLyrbHW6iE6+j/I5aruy5STI4KbjiJ1RNZ7nQOFD4sGtl3YY7KwSyPkvZauqk9mbrctDFus03s6y1fOHZOxTncFtCJkszwqPC5BwnaWMcpqadokutFkrjsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by MW5PR12MB5598.namprd12.prod.outlook.com (2603:10b6:303:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 06:16:33 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:16:33 +0000
Message-ID: <f5e80d6a-da3e-4596-8779-00094e5794a7@amd.com>
Date: Mon, 1 Dec 2025 14:16:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <20251128091929.165272-1-Bin.Du@amd.com>
 <aSpkA2pGzCwMcCdI@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aSpkA2pGzCwMcCdI@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU0P306CA0081.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:2b::17) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|MW5PR12MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c14311-1773-46ee-54b8-08de30a12cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzI1U2Q4V1dlOVpiRWJFV1dIRWZPaDVYOUtxTkptTW8yazd5YVB3Q29tRDQ3?=
 =?utf-8?B?OEd6ay9XRklkVlVZS2tHYWVQdGdZQzVJUnFZVHpBeEl5TUlDcHlGVlpHenh4?=
 =?utf-8?B?M2ljWXFFTk5veld5WndKS04wNlNFNURVa0hnbWFpcGZyc3JUME13NEZQUjdu?=
 =?utf-8?B?ZStHZk51TzNaUmFzUEhRZldtaGl0MTFzdkE1VTlOMTlVaHh3MjIxVDI1QXIr?=
 =?utf-8?B?Vlc5bG44cEdnYkg0c3c3QzlsTFdzYmJadlZhbzBBOFRLTjE3MkhSMHFaejR4?=
 =?utf-8?B?MDI4bHZvZ01telRXakhTWWhVSHdaR2FnYTdpSllpUlBmNlorc3hxSDdheU42?=
 =?utf-8?B?U05TTFlTQWI3YWU4NHkwdFFGUkU2REd6enl3aXNpblhsOXZWTjBNdWU2VExX?=
 =?utf-8?B?TXgrUGJTS3BVSWcvMGJLUVM4NzNteHpoSXZ1Z3I4Zk8vcGV5RGZ3WEEvN2NX?=
 =?utf-8?B?Qmx0SXgwOGVzaXVTSDFwSkV3b0Yrc1ZhZkVsamJVYnNiWTI0TSt0U0FEb2V6?=
 =?utf-8?B?bFZwT0xVeEhZZm4xRHNPbmxHMnF6dGdScmtTaG14bHU0ZEJ0cThJNzBwdVI4?=
 =?utf-8?B?WFlaU0k2ZHYrdnJPc2Vac29zdzEyR2NhN3V6N1gzd212c3M3dEkyVDdOb1gx?=
 =?utf-8?B?Sm54cG5meW45L1J1U3piN1VOY1BTYjlTdS9QdDJxc1BucGx5clV2M3FuSEd3?=
 =?utf-8?B?Y1N4WVRIWkNpenN1SW9EMWhKQlVYVjM4Z1BFWm1uUUgrWWlwNDRabDY0c00r?=
 =?utf-8?B?RSsyYTQ0UkhtNzJwQjIvUjJ1djZkcW5Nc0lFUFcvektnelJPaWlZN3RoUFNa?=
 =?utf-8?B?bGtTaG80c1dzZXJWeUdPV0Z2MFVHeU1tTlR3MWg5aEx1bWFCVU92RE5QTkRN?=
 =?utf-8?B?bWQ5UDZOdHNmSFM0ZCtwRStvdU9TNnJsVnhWS0QrY3hvRXlsV2YrNEFIZ2VY?=
 =?utf-8?B?aXBwR3BBKzVNVmFlVzFBemlMQ3BKQm9KWEVCVEZMZnYwQ0dxcHMva2FXY2J2?=
 =?utf-8?B?TEhtaXd3bm96RlM5RjNwMzJxMVlPWUpSR2d4K09pa3ZOcE4yeXdoV040ZTlt?=
 =?utf-8?B?SUY5MFIzWUtxOWpndmQ1MWxFMnMwZlpZWDVDZlpOR2RUdWF6TmtLS1F6OFlx?=
 =?utf-8?B?MmpJaWRvUE93bVdwTk9SOWRHVk5FQXFiby9tVzFVUkNQakRIVmxoZ0FtVGhG?=
 =?utf-8?B?QllYS1FST1NhZEZhMndhSzgySE9hcDdNd2JvdjhITFZZTTZEOXk4TjI1M202?=
 =?utf-8?B?NmU1Q3dHM1VVZGRSQml3NnlSMU1BWkNUWGMrdHZDdTZCNUFyNDBOemJxNGtX?=
 =?utf-8?B?dmNwUjNYeFlVWWQxVWJYRFovTVQwa1A3TTVNMjlJaHhhNEdjZFJJV3dMOG54?=
 =?utf-8?B?QUMyTFhIcDFsVUE2NVdJenNRNXR4RmkxNzhYRzcxamxtQ2p0Y2hjU3VRalRo?=
 =?utf-8?B?QWY2bU1xSnF5RFY1SUY3czZwbWdvSFR5NE5xZmxYV0pzM05Rci85RVNmTEdO?=
 =?utf-8?B?cVRxMk9HVjhQN0ZCNEFJLzVnYzRPN3V1TEtmc2xiVFd1S0doVElwSXo1SWhm?=
 =?utf-8?B?U2J4b2I3VlhiRks5dExleFI1ejVjSFJ5cHFXU2EyU3QxN1hHajJiRC9Sd3Na?=
 =?utf-8?B?VTFHcjZ0M05IK2xDR3MzR0RiV1d2Uml4ZDdoNUNwS0l3eE1UQkRlOWxBRFlQ?=
 =?utf-8?B?M2lFcS9oanpTblNIRllwNjh2TVlYSHN2SzhHdEVSZnd2VW85OE5GclJ4RENm?=
 =?utf-8?B?MHVOaEdiNk80eWJsK3BwWnpiUmNuUnNrZHhWV1NxNzRtaHBTdllkUnhGcmUr?=
 =?utf-8?B?UTJLOGhqUy9XTU13bVY2K1FKRjNNcjZ3dTBESXVMZG5yY2JuZlczSTNjU3Rj?=
 =?utf-8?B?TlBIdjlOalExK2UzRXJzQmNDS2xiaGNXTm9UZVc3bHRQN00vckFUQTAxZDJp?=
 =?utf-8?Q?s2M7ZDJsWPQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1ErbnRrS2hCSUZIU1AxdjdjSGZyYjdxdERnbjhya1pvV1NJZHFJNjlxOTBZ?=
 =?utf-8?B?eHFoYmdwM254UlZGR0NjNWl0bUpzUU9nRURLQ00rZkZidTRSUDdQQzhpQW1N?=
 =?utf-8?B?cTZXditqV2ZpTkY4amNpZDZNelZUVW5VOFhpN0dqODkwaFliUHpaTXQzK2Ey?=
 =?utf-8?B?ZDNONExRT0t1VitwaWFsUC9rWkZKazRFSWpCanFJQ0U3UnpaU2JUZCtxSUlv?=
 =?utf-8?B?aHpwbmNWZ3ZvQU55Rjh5YmdPZ1JETVBpQ25CY0FBRi9hTGNRYnlmSlhPNGdF?=
 =?utf-8?B?cXJtZ3ZJOXJIc1RuS052VVpmMlArM3NjMVpuRmlKVmptK0R6WUNxNTRhUU9o?=
 =?utf-8?B?YkRORkJzRTZqWE1uVEkxaXlRYWJCMEp2ekZSR0RaWVlybW5hMFdTejdxQ3dX?=
 =?utf-8?B?WXRBZVRTU3FCYzllWlN5TXBTSmpVcXovSlI3T1BIVHF5M0tWdWIrZUorZ2ZO?=
 =?utf-8?B?UWVqVE83TzdJTGlDR296K3Vyc2l2eFEybUhlajAydHhFS1Z4cU5EM0d6cUNH?=
 =?utf-8?B?V3oyWU1Wd09mejgzTVBDWDVZdHdOTlgzVEo0ZkNFaWxuS1hEQndSYStCOXpE?=
 =?utf-8?B?VVA2dlplc2IvQkllS252MXl3anpUYlNqR2RqUzhsOGRIMElMaDd0KzFzSlJM?=
 =?utf-8?B?T0lKczlzd2s1a1RkYUxCV2lzVVhlZDBBcVY4bkpaVUl0bGU1dFg1RWc0SExj?=
 =?utf-8?B?d3RPcjgwekx4eXFXait4K0JsUHpYa3FET0NUcW1ncXNiZHJIbjFwUUpzb1NQ?=
 =?utf-8?B?WWpxdWtwQ0hWSXlUQ0VZU01TQ25uZkphc2VlSUIwNFpUVVVsYStIRVVWcUM0?=
 =?utf-8?B?R0R3c0NHNmdVbVB2ZFV2ZDRadCtBb241Y3lPb2lWbkk4VHhjSlBNalRXV0tj?=
 =?utf-8?B?ekJsZDZRTm1XK1dwQ1htY1VObnlJbG5RcmU1WDlpdkJhcUYvdm92Ti94RHY0?=
 =?utf-8?B?UGtzUDM5OStSbW1wZy9xNC9DeWRwNklQamVmMkhaQ0dlYVpKS1JETzB5aDhD?=
 =?utf-8?B?NHllbjA4Q1VnT05UdXFqWVIyVytQN0hMT0MwQTdSTTFGYmp4bzg5UHNtc1dO?=
 =?utf-8?B?SFRrbjZvWkZTdHJFalpFaHFxeFZRSC9pWXppWEpWQWJaSWtHT05ad0luNE5T?=
 =?utf-8?B?R3lpZXFTQlBvcEtPVkw4OXdnSmplaHVWR3Q1dFVrcWZxaUpHeFYvd1oyTGhM?=
 =?utf-8?B?TnhrbXIvMDg1NkJiUnh4Zy9YUlVtVkhOZ29wRzVjaXB2cTYzS3pyTW01Ykdr?=
 =?utf-8?B?SVRKSEJLQitKRjlHL1FsTXU5WXY5K0RuMStJL0FPVzBtVE5GTUxyemg2NERz?=
 =?utf-8?B?WTJub1F1MnZQQUJKSlgwaWdOVkNIdzVkMmYwemJ5R3ZQS1BKcUwyMHlHNjRt?=
 =?utf-8?B?dUlUUlZmVFlpRUJZd2pnem1udlNOSzhxOCthU1ZOdXY1eUMwWVlmazI0aDhv?=
 =?utf-8?B?TmFFNXZxNEpFQTlaNW1kc1AzSmcwblQ1ZlJkZDdJbzQ3aTg0b2h1aHhTNE14?=
 =?utf-8?B?bjdsdW1VNG8ySXVoS0wzMjI4VFlvZGY5S0Q0Sk9ZaFlrVzBMbUVGM2F6RmpX?=
 =?utf-8?B?YjlFOCtDQklpZmFpS21HdXlMSmNBSTNPUFZ6TlJlcVhSQnBNYStPV2EvOWtx?=
 =?utf-8?B?bXpRN2Exb1ozYlh3b3R2MHhNSjhCR3N6TXF1TFBtWXhEUHpjV1JVSmtDSlJP?=
 =?utf-8?B?RFBURkJDa0l6ZHJYZ241K1hZQzZzRGR6NE5CUkZEZ2VKV3ZONGwwNkEycFVo?=
 =?utf-8?B?czlPb1JYN1lBcTgvRVZhWmROaHFlazN0VTBVeWx2eCtlL2Vsa3gyanF2QkJh?=
 =?utf-8?B?M01SYWZueWdRcjVHTzhmaWZWeTlMbmNlQlM1RTBWOE52YldQZ3FraXd3ZXFy?=
 =?utf-8?B?TENQZXlYakFwWkVYOGRwazgzb3pyT3ZkL2V1WUZFUlFyajJvTUg3T09FSDEz?=
 =?utf-8?B?Zm5GamI4dEVwZExCbldsNHRBb3BRUk41TUhsQmd2eml3Um5uWCtsOFg2dUR5?=
 =?utf-8?B?WkdENkJTRk91dlhvRjczM0xaNkpBN0NRVS9nWWhMdWk4ZXdTVWdYcVVVd3Y0?=
 =?utf-8?B?OW5DUldnSDdkSFlkNG42S2FIdmpiR0NPR3MyUU00bk9ieFpNaTVrTmxMTmk0?=
 =?utf-8?Q?9op0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c14311-1773-46ee-54b8-08de30a12cb0
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:16:33.2678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+OFO13m9jcKnTOMstxssZiFvsW3+0YBl4dQiLGi2ntFmXJguXbiAkShAX5Nj+/U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5598



On 11/29/2025 11:09 AM, Sultan Alsawaf wrote:
> On Fri, Nov 28, 2025 at 05:19:22PM +0800, Bin Du wrote:
>> Hello,
>>
>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
>> (https://ubuntu.com/certified/202411-36043)
>> This patch series introduces the initial driver support for the AMD ISP4.
>>
>> Patch summary:
>> - Powers up/off and initializes ISP HW
>> - Configures and kicks off ISP FW
>> - Interacts with APP using standard V4l2 interface by video node
>> - Controls ISP HW and interacts with ISP FW to do image processing
>> - Supports enum/set output image format and resolution
>> - Supports queueing buffer from app and dequeuing ISP filled buffer to App
>> - It is verified on qv4l2, cheese and qcam
>> - It is verified together with following patches
>> 	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
>> 	drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)
>>
>> AMD ISP4 Key features:
>> - Processes bayer raw data from the connected sensor and output them to different YUV formats
>> - Downscale input image to different output image resolution
>> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc.
>>
>> ----------
>>
>> Changes v5 -> v6:
>>
>> - Lowered FW mempool buffer size from 200M to 100M (actual usage).
>> - Added an irq_enabled member to the ISP subdev for proper IRQ disable handling in both normal and error cases.
>> - Removed unnecessary .owner assignment from isp4_capture_drv definition
>> - Updated IRQ handling to enable and disable interrupts via the ISP register for improved performance.
>> - Revised ring buffer management in isp4if_f2h_resp(), addressing safety checks to ensure the read pointer is validated before memcpy operations, reducing the risk of out-of-bounds access. The ring buffer logic was also streamlined significantly.
>> - Modified ring buffer handling in isp4if_is_cmdq_rb_full(), correcting an off-by-one error in safety checks that previously allowed rd_ptr to equal wr_ptr when the buffer was full.
>> - Refactored ring buffer handling in isp4if_insert_isp_fw_cmd(), simplifying overall logic.
>> - Resolved a regression from v4 to v5 where isp4if_dequeue_buffer() did not protect list_del with bufq_lock.
>> - Addressed a subtle use-after-free issue that could occur if a timeout on a synchronous command coincided with completion.
>> - Added missing pm_runtime_disable() calls to isp4_capture_remove() and to the error path in isp4_capture_probe().
>> - Removed stray semicolons following closing curly braces.
>> - Improved and clarified macro definitions in isp4_interface.h.
>> - Eliminated unnecessary (u8 *) casts.
>> - Added missing memset for firmware command structures in isp4sd_stop_stream().
>> - Excluded streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK, preventing their activation in the interrupt enable register.
>> - Enhanced error handling to clean up kthreads in the event of startup failure.
>> - Corrected a race condition during kthread creation where waitqueue head initialization could be delayed, as it was performed by the kthread itself.
>> - Removed status checks in isp4sd_pwroff_and_deinit() that were always false.
>> - Ensured isp4sd_init_stream() is only invoked once per stream start and reordered corresponding status checks in isp4sd_start_stream().
>> - Improved error handling in isp4sd_start_stream() to propagate errors from failed functions.
>> - Relocated debugging messages in isp4sd_stop_stream() to execute under lock protection due to access to output_info->start_status.
>> - Eliminated redundant GET_REG_BASE() macros.
>> - Removed isp4sd_is_stream_running() function.
>> - Corrected error message in isp4sd_init_stream() caused by copy/paste.
>> - Refined struct isp4_interface to remove firmware ring buffer configurations.
>> - Removed obsolete isp4sd_is_stream_running function.
>> - Removed pdev member from struct isp4_device, as it is unnecessary.
>> - Fixed typo in 'isp_mmip' parameter name within isp4if_init().
>> - Removed gap in struct isp4_subdev definition.
>> - Performed extensive dead code removal and minor style improvements throughout the codebase.
>>
>>
>> Changes v4 -> v5:
>>
>> - Transitioned VIDEOBUF2_V4L2 from 'depends' to 'select' within Kconfig.
>> - Standardized object file naming conventions in the Makefile and sorted entries alphabetically.
>> - Removed the unused macro definition to_isp4_device.
>> - Eliminated unused members mem_domain and mem_align from struct isp4if_gpu_mem_info.
>> - Deleted unused fields mc_addr and gpu_pkg from struct isp4if_cmd_element.
>> - Removed obsolete pltf_data, i2c_nb, and notifier elements from struct isp4_device.
>> - Updated platform_get_irq failure handling to return its actual result rather than -ENODEV.
>> - Refined inclusion of header files for clarity and efficiency.
>> - Appended comments following #endif statements in header files.
>> - Improved implementation of isp4if_gpu_mem_free and isp4if_dealloc_fw_gpumem.
>> - Removed isp4if_append_cmd_2_cmdq and revised isp4if_send_fw_cmd accordingly.
>> - Enhanced isp4if_clear_cmdq and isp4if_clear_bufq by eliminating unnecessary list_del operations.
>> - Adopted completion mechanism instead of wait queue and condition for command completion notifications.
>> - Employed memset to ensure proper zeroing of padding bits in structures shared between ISP driver and firmware.
>> - Streamlined IRQs, reducing total from four to two, retaining only essential ones.
>> - Optimized IRQ handler logic using a while loop for greater efficiency.
>> - Introduced dynamic IRQ enable/disable functionality based on camera status (open/close).
>> - Applied distinct identifiers to differentiate multiple threads and IRQs.
>> - Removed unnecessary initialization of local variables.
>> - Refined camera start/stop workflow to mitigate potential synchronization concerns.
>> - Replaced all remaining mutex with guard mutex.
>> - Enhanced command and buffer queue performance by substituting mutexes with spinlocks.
>> - Removed redundant isp4sd_init_meta_buf function and its references.
>> - Limited firmware logging activities to the stream1 thread.
>> - Relocated v4l2_device_unregister_subdev() and media_entity_cleanup() calls from isp4_capture_remove to isp4sd_deinit.
>> - Resolved media device registration sequence issues.
>> - Modified stream processing thread behavior to await IRQ without a timeout.
>> - Addressed cleanup procedures in video device initialization and deinitialization routines.
>> - Corrected typos and made other cosmetic improvements.
>>
>>
>> Changes v3 -> v4:
>>
>> - Replace one mutex with guard mutex.
>> - Remove unnecessary bus_info initialization of v4l2_capability.
>> - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
>> - Modify document with better SOC description.
>> - Fix Test x86 failure in Media CI test https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
>> - Modify some commit messages by describing changes in imperative mood.
>> - Add media-ctl output in cover letter.
>> - Create separated dedicated amdgpu patch to add declaration MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");
>> - Fix typo errors and other cosmetic issues.
>> - Add DRM_AMD_ISP dependency in Kconfig.
>>
>>
>> Changes v2 -> v3:
>>
>> - All the dependent patches in other modules (drm/amd/amdgpu, platform/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.com/torvalds/linux) v6.17.
>> - Removed usage of amdgpu structs in ISP driver. Added helper functions in amdgpu accepting opaque params from ISP driver to allocate and release ISP GART buffers.
>> - Moved sensor and MIPI phy control entirely into ISP FW instead of the previous hybrid approach controlling sensor from both FW and x86 (sensor driver).
>> - Removed phy configuration and sensor binding as x86 (sensor driver) had relinquished the sensor control for ISP FW. With this approach the driver will be exposed as web camera like interface.
>> - New FW with built-in sensor driver is submitted on upstream linux-firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
>> - Please note the new FW submitted is not directly compatible with OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the previous ISP V2 patch series.
>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
>> - Included critical fixes from Sultan Alsawaf branch (https://github.com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp buffers.
>>        media: amd: isp4: Add missing refcount tracking to mmap memop
>>        media: amd: isp4: Don't put or unmap the dmabuf when detaching
>>        media: amd: isp4: Don't increment refcount when dmabuf export fails
>>        media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>>        media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>>        media: amd: isp4: Fix implicit dmabuf lifetime tracking
>>        media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
>>        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>>        media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>>        media: amd: isp4: Remove unused userptr memops
>>        media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
>>        media: amd: isp4: Release queued buffers on error in start_streaming
>> - Addressed all code related upstream comments
>> - Fix typo errors and other cosmetic issues.
>>
>>
>> Changes v1 -> v2:
>>
>> - Fix media CI test errors and valid warnings
>> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
>> - In patch 5
>> 	- do modification to use remote endpoint instead of local endpoint
>> 	- use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint
>>
>> ----------
>>
>> It passes v4l2 compliance test, the test reports for:
>>
>> (a) amd_isp_capture device /dev/video0
>>
>> Compliance test for amd_isp_capture device /dev/video0:
>> -------------------------------------------------------
>>
>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
>>
>> Compliance test for amd_isp_capture device /dev/video0:
>>
>> Driver Info:
>>          Driver name      : amd_isp_capture
>>          Card type        : amd_isp_capture
>>          Bus info         : platform:amd_isp_capture
>>          Driver version   : 6.14.0
>>          Capabilities     : 0xa4200001
>>                  Video Capture
>>                  I/O MC
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x24200001
>>                  Video Capture
>>                  I/O MC
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : amd_isp_capture
>>          Model            : amd_isp41_mdev
>>          Serial           :
>>          Bus info         : platform:amd_isp_capture
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x03000005
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000003 (3)
>>          Name             : Preview
>>          Function         : V4L2 I/O
>>          Pad 0x01000004   : 0: Sink
>>            Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video0 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 1 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls (Input 0):
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls (Input 0):
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls (Input 0):
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls (Input 0):
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK
>>
>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>>
>> The media-ctl output of media device /dev/media0:
>> -------------------------------------------------------
>>
>> atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
>> Media controller API version 6.17.0
>>
>> Media device information
>> ------------------------
>> driver          amd_isp_capture
>> model           amd_isp41_mdev
>> serial
>> bus info        platform:amd_isp_capture
>> hw revision     0x0
>> driver version  6.17.0
>>
>> Device topology
>> - entity 1: amd isp4 (1 pad, 1 link, 0 routes)
>>              type V4L2 subdev subtype Unknown flags 0
>>          pad0: Source
>>                  -> "Preview":0 [ENABLED,IMMUTABLE]
>>
>> - entity 3: Preview (1 pad, 1 link)
>>              type Node subtype V4L flags 0
>>              device node name /dev/video0
>>          pad0: Sink
>>                  <- "amd isp4":0 [ENABLED,IMMUTABLE]
>>
>> Please review and provide feedback.
>>
>> Many thanks,
>>
>> Bin Du (7):
>>    media: platform: amd: Introduce amd isp4 capture driver
>>    media: platform: amd: low level support for isp4 firmware
>>    media: platform: amd: Add isp4 fw and hw interface
>>    media: platform: amd: isp4 subdev and firmware loading handling added
>>    media: platform: amd: isp4 video node and buffers handling added
>>    media: platform: amd: isp4 debug fs logging and  more descriptive
>>      errors
>>    Documentation: add documentation of AMD isp 4 driver
>>
>>   Documentation/admin-guide/media/amdisp4-1.rst |   63 +
>>   Documentation/admin-guide/media/amdisp4.dot   |    6 +
>>   .../admin-guide/media/v4l-drivers.rst         |    1 +
>>   MAINTAINERS                                   |   25 +
>>   drivers/media/platform/Kconfig                |    1 +
>>   drivers/media/platform/Makefile               |    1 +
>>   drivers/media/platform/amd/Kconfig            |    3 +
>>   drivers/media/platform/amd/Makefile           |    3 +
>>   drivers/media/platform/amd/isp4/Kconfig       |   14 +
>>   drivers/media/platform/amd/isp4/Makefile      |   10 +
>>   drivers/media/platform/amd/isp4/isp4.c        |  234 ++++
>>   drivers/media/platform/amd/isp4/isp4.h        |   20 +
>>   drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
>>   drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>>   drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
>>   .../media/platform/amd/isp4/isp4_interface.c  |  787 +++++++++++
>>   .../media/platform/amd/isp4/isp4_interface.h  |  140 ++
>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1087 ++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4_subdev.h |  130 ++
>>   drivers/media/platform/amd/isp4/isp4_video.c  | 1158 +++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4_video.h  |   65 +
>>   22 files changed, 4498 insertions(+)
>>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>   create mode 100644 drivers/media/platform/amd/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
>>
>> -- 
>> 2.34.1
>>
> 
> Hi Bin,
> 
> I have attached a small patch with a fix for an old issue I noticed now while
> reading the v6 code and some remaining style nitpicks addressed. And some
> duplicated code on stream stop removed.
> 
> This is the last change from me, I promise. :)
> 

Alright, I'll trust you the last time, LOL :) Never mind, they are small 
changes and every single one brings the code closer to perfection.
I'll wait for feedback from other reviewers so I can incorporate them 
all into next version.

> Otherwise, v6 is looking very good! Good catches with the error handling too,
> with the irq_enabled flag and v4l2_device_register() error cleanup.
> 

Yes, I believe so. I received two warnings from the Media CI checks; 
however, it appears that the issue is related to the CI system itself.

# Test static:test-smatch
drivers/media/platform/amd/isp4/isp4_interface.c:439 
isp4if_send_fw_cmd() warn: '&ele->list' not removed from list

# Test static:test-coccinelle
./platform/amd/isp4/isp4_subdev.c:404:6-25: WARNING: atomic_dec_and_test 
variation before object free at line 405.
./i2c/ds90ub953.c:779:44-51: WARNING: Consider using %pe to print PTR_ERR()
...
If you believe that the CI is wrong, kindly open an issue at
https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
to this message.

> Thanks,
> Sultan

-- 
Regards,
Bin


