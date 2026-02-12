Return-Path: <linux-media+bounces-52625-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICsCEj4yjWmPzwAAu9opvQ
	(envelope-from <linux-media+bounces-52625-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 02:51:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89975129116
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 02:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21AF23024281
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 01:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA724208994;
	Thu, 12 Feb 2026 01:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="kfrfwAQW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A703F2AE68;
	Thu, 12 Feb 2026 01:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770861109; cv=fail; b=hma+l/A+7gAW1WilNHi4DbDkHYR/bROW5qLm/tWgRjx2uH4QOkb6b93r4PtmqHPoVD3Vk59oeeCXgzP3gfJe370B4GOiYdSF0TQEqJfmhKMtYj+wFZuFPazJuhuJzA+0HnTnsWzTE+hbOoZ4MRZ50SouFOgodrOguQVGAts51Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770861109; c=relaxed/simple;
	bh=Hxf1wTTIgYl5q8L4xLLjdsgLQ9TlPx03b8MBQAgKiWM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X0ZI1k0t0lYR9FPC/Bt6AIJrb2EsEtvqX48K+ZwZpjSoSKhX6odbuxw/XrLqB6mdpLubGF+HGVJ7/eRaPcVGccLQ5YG6zUCOUrbeV6Hs3CKenj18whoEEH86xvu0JT7qw40TpGKzizbMhk2o/qydGeijbpDmLTLYvo4GVhglALA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=kfrfwAQW; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C0VDWs3816989;
	Thu, 12 Feb 2026 01:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ld53m2MWVsSNvsyvXC8Gvq1AlPvcho83iGTwbZGq4ig=; b=
	kfrfwAQWU6kKg80HWlZVGHMyeQ9EfezmZUc24R+NoiKuvLjz1+samei2JYkoguZw
	A0CRmI6aWSxitEfWkGrVFxY/w66/LYFHqJBO5cZN+r1vfdG2b530Dnp6Qdaw4mgu
	Ty6Rdpn6Zy7Ij2gQ0+yOvoUcz2xO2nP5AnI73T9gJ+l5K2yBoxEcW23Qf54tmRHJ
	daW4Wyv6/yrjYx203tgACoyAcV0STTgc00WtUcR6EmZIu3r4KoJbRjdG0C91fCZZ
	33HM42Ol2uTnMDCkOmMdVnq8ho0Pfj4W5Y2RMraso+JSXx+xl0nxDGTO2Y/zhvAv
	jDrRuZOdG5ULRpdwymh5xg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013058.outbound.protection.outlook.com [40.93.196.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc5dg2d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 01:51:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxv8egeO4NfVQ6VnlSSkeauMQ5pgh+Kic/vvl52CzxAV0JdaYj1qQHqxtiNM+CbYaJGPtDVJp0DdSMQBEQEID7YfMbFE5ND7dyhN516gyAuUADfyLWAvLaE816HVIxkBrSI/RiQA+8GrDeDvsuS3TnfagP6IcORpF/C8/p0kiRIg/fGoO2SpEo0etxhGh6Hi9yoXxYb5WxJnoQxsipfyoXyII9Z7CSoomuQG4B/+ZIWBv4AZo14crGXwf8JPSesp5ldXsZNBZFm1SwWmxS2vygtN/04ajwn65kAlyEzjPCG7h5DJ558ddwrCWYVpuwpei+wuk7a9S8Wdmh6vrYT6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ld53m2MWVsSNvsyvXC8Gvq1AlPvcho83iGTwbZGq4ig=;
 b=erdaJNnNY5qBPmPIpejPKJRebc9vOe01fxScIilHkHePMwpRZK1YBCf3zuj9+ZXBzQW77YbhwxawIWYcMQsmbGcMxYZFeST1UDPJPeag3ASJZncR1Ev91kf3JVNHzc+Jsyytk6L5yzaOaLe/2PmXDd1lDIh76Q4dSS3op76drUBwjfvP+WgFowZU6/eBy2sHVqP3I8AEroC9pGtt57jcNdZQVEh1ZpZnNIiKDAc0U/G2xRFFsw2u0fGFUvOI2DmL08JOSAfliFcPzamPa1Cc7h9FXQZOnFBjy45y4gjaQ0r8pxr3wAwDWHHD2jbD4zJAIbpOSaoJ0qzF3idG1i3t5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH8PR11MB6880.namprd11.prod.outlook.com
 (2603:10b6:510:228::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 01:51:19 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::4b21:f3ac:a1f9:6965]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::4b21:f3ac:a1f9:6965%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 01:51:18 +0000
Message-ID: <9809e44b-88a7-4f74-a34c-a6d8e28605bd@windriver.com>
Date: Thu, 12 Feb 2026 09:51:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rp1-cfe: Fix double-free on video device
 re-registration
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomi.valkeinen@ideasonboard.com, kernel-list@raspberrypi.com,
        mchehab@kernel.org, florian.fainelli@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, hverkuil@xs4all.nl,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260211034501.1815035-1-xiaolei.wang@windriver.com>
 <20260211081530.GB2553356@killaraus.ideasonboard.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <20260211081530.GB2553356@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:405:372::6) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH8PR11MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: bb374dab-a370-48eb-d2f0-08de69d9372d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGpmaEQzYU8wbFJLd2V1L1FsUy9iVXdRNnl1VlI1ZldmVmhqL1VKQWtTT0Fx?=
 =?utf-8?B?L2tUbHF3N0NxVEZTR01tNVByR1V4WEIvaThML01jMVRmUGdqcGg2VTh5azNn?=
 =?utf-8?B?T2RwTURkK1NvdDFrNzRaZ2RySWRuY1hZdHdNSnNyOUZZWXJvZmllcCs1eEtU?=
 =?utf-8?B?NTQvZm1icUNYUDh0Kyt0RkJENTIyQ3dOSTlIQmhFNFhHUUtwYmpWakVJbGtj?=
 =?utf-8?B?MFZKdUVkK1g3dXRHWkVTc2ZacDVMU2krTGJNQW5hM0VaSlhBRmVFYWxzdmhh?=
 =?utf-8?B?bmNGN0ZublVNdHpTbFU2SWFRZ2VvVXhqT3M0QmpDb0NxUk8wVzJVN3NZU0VD?=
 =?utf-8?B?NjRZOVZrMzQ3S3VNMFhFcHNUVVR5a1M2YlNoMkg3MDlNZmpVVzZFM2JFWUFH?=
 =?utf-8?B?clBiZkdsWDZFa2U3N01ydklLOCtValFRaDR6YzVZeVpqYVN1dWZ6TWVib2tq?=
 =?utf-8?B?dWNpNHJzb1ZjWHNzcGx2WThKR1Q1NlUxbzJrcmhMQmR5alE1UmVqZGhFOFBs?=
 =?utf-8?B?dWx5WWIrUTVyZG1xRk1nMm1mMTJsZnZGdkpibzdZeDExQXhNSXloMEI4dUZo?=
 =?utf-8?B?REorUU53SDVrZjdKTzA2OHhkd2NBekdESFJvbkRPNEgxbFdOY2RXWTlzeURx?=
 =?utf-8?B?blovWVF3RVFHL1JmVEZ5dVZxWms3amJkODd5dDBNQ1kxQ21KM2kvSzR2MXdR?=
 =?utf-8?B?UVQ5NG5neTVsbzZORzNvTjZJMjRJNFpKaHhuRWZHWG9JNWxKNjhnN3RXeGhP?=
 =?utf-8?B?UEQ0dTRVcUVRSVBxOWRYZWljRzZLN25nRVJ5V2o5ZklaNDJVb1l5aUlCa0tx?=
 =?utf-8?B?LzA4dzlPa28rSVVTR3V4Z2JMam9uUW85Tk9RNGZxOFdSMU51ZXNuczRHV0t4?=
 =?utf-8?B?M3NCOXpVZndFNmFUdnhiQVJyUXhkenlxVGFKVk9QdFNJSmk1UnpDUGRxbDUz?=
 =?utf-8?B?UEJSbjZFNSsvY05WVGdpZGloenExM0FsWlU2MXdXSkxiK0hxa1R1bWo0TThN?=
 =?utf-8?B?d0NLUEk1K09DdkhhZDlyN2Y5TVRKYkR0bzM2Tk9DdVI2ZEd5anQwb01aZlhI?=
 =?utf-8?B?WE12STluVmJEdkQ0b1NETUJPVzRjenBIbm9JWnNXRWVIM2NUM0VXSGtvdWNm?=
 =?utf-8?B?TGhMdnJsTkxnT1NXZ3l0R3hPWnUyeXNyZ3pyS1QyVnJ1Z3RJMmRQdW1QTE1t?=
 =?utf-8?B?K2VCNk4xWGxNcS9tdHR6UUhvVTl0MGtzeno2dUNyWEFMeXpTMlhIMTRWVnd2?=
 =?utf-8?B?bWRTaXQ2UXYzNk93T3VQWEtwY21GQ3FaOGo0RStqMDQvOG54N0E2aXo5K1Ex?=
 =?utf-8?B?SGk5bDhlVXNBemwvRStETE5KdEMvSFFiWk5xRWF5N3JIeUNvSCtLWnNPL1oy?=
 =?utf-8?B?MEVwbm1ZWUFiQmhHMElLRXMzbTl3RXhXQjdRQTZGeS9lRnZTZmwxZjhjcEYx?=
 =?utf-8?B?TGFmalRJNVpvck55cTd5Z0d3QnJYcnRWdXFOcVR3d0FPV3lxbU84S0VMZU9M?=
 =?utf-8?B?aldBalBTVUJ5Zlk1KzZScXRhT0VwOHFBSW5wU2FxZEpEZ2hoWlRIWjV0a1B5?=
 =?utf-8?B?V3ZmYlpyVHBmUHR1TVBZaGxxNFBuejFhbDQ5QkFodHNlZ1NPZmluUkpMam95?=
 =?utf-8?B?amFuNlFCQld5cnJyWU5PTTNBNGlZVTN5SW9DcWdjTlRmUkxLZWF4SzNVc2Ex?=
 =?utf-8?B?dWR4V3NzdzRrakhDbENQNVJqUXg3NGtzNnlxQlI4aGhBUHdlOUNGZHJVQzYw?=
 =?utf-8?B?U3N3NmFKNHR1ck1KUTMxRm5iSC9UMWpYNnFJZlFlWE5nNnVkZTZOZGVVL2pJ?=
 =?utf-8?B?cHBPNUljZ3YvSlIzMUZtdDFOd3hSRDBKQ1d5QkgzNzh6WnFvekEwVk9ZWVow?=
 =?utf-8?B?bEFlbHdybElKUEtaSUplWjhSSTJKWkh4TGd3VEQyRnhuOWpwbGxmelVuWHg2?=
 =?utf-8?B?OWdkeGZzZzFnL29IcjUvWmk4ODQwdlBxQW1ydW9UaWYrSHNaUTI3T01iNExx?=
 =?utf-8?B?WVI1NFlGSzJmTE9UU2drZFVrUUdkRm1LNCtPTVRUUTJBSEQ3eU9nTTVWQ3lz?=
 =?utf-8?B?QXZxQThVM1pQZmRYeHBUUFFTZ1YyWnpkTWlkRGJsM1RLeDA0QjF0TnhQWXhV?=
 =?utf-8?Q?P7mI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmxORTZrMmpRc282ZXV3amVkN01MMGdpa21vRzhadVlCZ25xcFd6L3VqRS9n?=
 =?utf-8?B?QlRVQkNkNlQxZWVJdU1TVThWQnFKOUxUSnVHZEw3K0czZVpwZFFLQUJFL0VI?=
 =?utf-8?B?Mk43YUs0alcyRlRSdWxzT214dXFJeVdkYmhGaDlmM3BCMzNTL29NN1ZWNHAr?=
 =?utf-8?B?L3RscFBXLy9XYS8zVmNUN08yYi9RZENvTXQ4Qk84L0tVbktxM1h2MlRhbHEy?=
 =?utf-8?B?TTlBR3FqdDZUaFF4NW1weHVWSlMxQjZseDIyL2VjNkRQUER6T2pHT1BBZHY0?=
 =?utf-8?B?Q3RiL2NheTBDY3ZNMUtvRHVDUmEra0dPTmJ1aDRzV2VmNzJHYm0yclZ6OW9X?=
 =?utf-8?B?S2YvWFFvenlURllHVHFLK2NLZmlDemxqUmVuRzRZL2dHcUE3U2F0dUlJZzFF?=
 =?utf-8?B?Z1NyTWlwZm9vY3M4aUJXYTVVYnhYaUMwc1VuMDJHd0RBYjBONW1hblB5dkNJ?=
 =?utf-8?B?bHVITThOY0VCdnMrMVZlcE14eCt6TWwxd2x2VHE1ZElqOGxncktqWG9YRlph?=
 =?utf-8?B?elNOOWZYK200eFA2cWZMWVhSVk5oMjhRS0JQaEo3b2YvSWdhSTRoRWZkMzJ2?=
 =?utf-8?B?S1RJOExzdmtLaGJVNFBpTVJiVXVRZUVOdmFEU1c4MUpobkxicDVVWTRSdkw2?=
 =?utf-8?B?Z2g5K1VaN1diVVZocy9CNitRdjlQTHlCTEFUWVY3N21nWkZjV28vSFhrK1Vp?=
 =?utf-8?B?ZStYUHFYUWoxMEpyRkRiOUdaSXdFYlp1V0pKL3NBb2lzb3Uxb1JCRlVpZXZL?=
 =?utf-8?B?RWN4bitKMUVwcFFQODBGZURNRjFPN1d2aGlDOHNIcjcralNvc3FQT0JyU3p4?=
 =?utf-8?B?Z1hQWHBneUhjSWJxdE9TTWl3UEt0UUNyVFFzcEkxRWRVNzJQNmJWSmh5Vmhs?=
 =?utf-8?B?aTMxUUNwYkF4dnYrd0huc3pySHhjNDh0ZmgwUUwyT2o1VDc2RFM1NEc5dThh?=
 =?utf-8?B?NktZTE91VlUvWEhpU1BjK09DZktsY2loSDY2ZDVrKzduNlJ4Z2x2NnFnU1Rr?=
 =?utf-8?B?QWh4cFRYTlc5dlhUQWpsYWRyR0JPRzNlVExPQ2J6MlhacDEvVmFuS3BEVStj?=
 =?utf-8?B?L3dOaG9Ma1pJdElvNFVqNFZBYkhQbm1lZHdPQS9OUFA4TWwyUWNMMjFBSEFw?=
 =?utf-8?B?U0JKYnZDOHZzemRGWVRvUHEyRjUyTjBnYTl4cUlONzkvTEhLM1FYN2xKMXBs?=
 =?utf-8?B?cTNtOHd3ajQ5dXhjcGlDcFhZUERZT1M5L1F2Zk5uQndSVGI0OFVGa2xwdkQ1?=
 =?utf-8?B?UE53QVkySy96MWxlMmkvQ2FNcUZLaHExek9DK1A4SEwvVjQ1QkJzSHlDdHBm?=
 =?utf-8?B?bTc1YXlzS3ZxNHM4b2xoZ0NvUU45OUZVaGx3V2pRdC9CSlN4bkxGRUFmUTNy?=
 =?utf-8?B?YXAzZ1VIamtudDNSQi9ySTRZY3BVb1o5UjdpMG1taWdKMCtlUHhVTkREZ0JZ?=
 =?utf-8?B?R3haazdIS250aXZ1RHBuR3pFejZVQ1NreVlETTJzMmZNRGx0c0gxWTYyUnRM?=
 =?utf-8?B?Uy9pTEMyNFpNdy91L1hmbXFxbGZ3L1hGUVl4cGNxTldoemt6TWVCODhwcHNZ?=
 =?utf-8?B?b1pJci9FdDBpU25Ha1dLQmtFUkNOd0xKWXpsMmJGeElTK0laMUlMU2NjakYw?=
 =?utf-8?B?M1VLM204Y0RnRGF5M3dOTzdCWTMvelhKMUY4TENpN2E5UHp3TzZiRWVxU3Vy?=
 =?utf-8?B?c3JYRWNXME5oQStuaXNkdXRpNndMVVFFbXFtUnJPOEZRLzhlVDZYRDZzSXBM?=
 =?utf-8?B?NXl0d2dHQlZCZ2JvdXBnZDBkRnB0YzBJR1VKTXBhNytVQVZBTWxIRnhreHd1?=
 =?utf-8?B?Q0xQdzI2cnpoSENMOVdLSjFDb0xXb25haThsWWN1QWZjQm1wT1d4NEV2Wk9h?=
 =?utf-8?B?VVEvU004eTFHK3ZBeXc4SS82aEtlSUcwU3hHbys1NHRLSUN4dVdoL2xNK1pv?=
 =?utf-8?B?MEovSERlNkZWVG5KU2JxY2lTcHhtcWxWTWVUUUdWSzdmWURNTVRVMnZZYktL?=
 =?utf-8?B?dWlDVnBIRmgwbW9Hd0xBa0ExNkpuNCtpS3pqbGtmczBJaWFXdFZiV0N5dHRt?=
 =?utf-8?B?ZlBINW0yYWpXNXdISURpeHhwQzRLM2xCRW9yN1NENSs4TDU0WDBOcUxSUGZI?=
 =?utf-8?B?TTI0b0NKR2hwamlIdWhpOVVxVTRIRkdxM1FvbXZmZzY1aUdKdVAvZ2psbVo0?=
 =?utf-8?B?UDZvVCtSa0duUU02bjVKL29pZTkwR0RWMnllVEd2Q29DcUlqSmlHNjBjNnI1?=
 =?utf-8?B?b3V0cTlaeExFRnJ2SnVicTM5NFZNRVVRMllnTGdFcUxiNTBqcXNvMlc4N2FD?=
 =?utf-8?B?U3drdE1YemFNeWZTL1JPeFU5dFlWUnM2WlFwdXNqeHFGdDVHemp3YnpmNUN6?=
 =?utf-8?Q?aCTpDB/ZYvJBQ3qvKxe2OdILPR9YMVSWyrNiuff8n5Gfx?=
X-MS-Exchange-AntiSpam-MessageData-1: rwUssnWc67vzWp1wMRvv1aVqCGg+N2fEm2A=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb374dab-a370-48eb-d2f0-08de69d9372d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 01:51:18.9262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bavCF6D1wP3gk8CvqwXi2RhMJFSKYKa9fUCvAreMM+ZsQTWojjZwDSna7X/kvhcH6nsGXYn5dUB0LQhwjb9WvaYVR1f/KvaZyJUjL/Ds9R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6880
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=698d3219 cx=c_pps
 a=5YU8ENXygJz5UkgxsLF+dA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=t7CeM3EgAAAA:8 a=iC-8KwERdC-S9ap2h0cA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDAxMCBTYWx0ZWRfX8ZhI2LAMLeov
 Df8QX0cl3Kx6xxPNEr+Y1qq+p6B6v3OgQmgmKZxZbRBJJVscyBx5y7OJ6zBqwF5oa7cS2Zzau8I
 WdwFOrJdSD9YC50yJZxzMjUVAas8kE8LC9Yp77vKUDRz/myra9SELUFvhObZWQcsQ8iYsyHzMi7
 Fte7B4W32bWoLUIA+OzfK+XTBOQ2IxbN94earAv03VmqyL1wnsYDKftYEiaXu5xpD8bPZ1rZt4Z
 JnBZgSYlox1XCuNK55MaDzfeFb1aikmBQNDX4HI7rxPunyRJqBqipNw9a5by8Cl7YWotIor9LJ4
 a8n/iy2hGq/0YR3bOM5d+GwVtIUkR9k081pMykpaOn05P2JTowOyPrjf/vB3d9dYSrqbfjvGvwg
 ASrYUulakAF0mN8xSXb07tcnwz7JaIyIrq9HbM7TIBTWInqWZIdwUr7aj5JpKcXYb8PVpoc//R6
 2dguR7+oLO11O3TxIUw==
X-Proofpoint-GUID: 1lIXQOgAU76YAJfchbeee6EyTv2n6mCS
X-Proofpoint-ORIG-GUID: 1lIXQOgAU76YAJfchbeee6EyTv2n6mCS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_01,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120010
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52625-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,kernel.org,broadcom.com,xs4all.nl,linux.intel.com,vger.kernel.org,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,windriver.com:mid,windriver.com:dkim,windriver.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89975129116
X-Rspamd-Action: no action


On 2/11/26 16:15, Laurent Pinchart wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
> On Wed, Feb 11, 2026 at 11:45:01AM +0800, Xiaolei Wang wrote:
>> When a sensor driver is unloaded and reloaded (e.g., rmmod/insmod ov5647),
>> the cfe_async_complete callback is invoked again, attempting to re-register
>> video nodes that are still registered. This causes multiple issues:
>>
>> 1. KASAN double-free in kfree_const when dev_set_name tries to free the
>>     kobject name that was already freed during video_unregister_device
>> 2. "tried to init an initialized object" warnings because the video_device
>>     kobject is re-initialized before being fully released
>>
>> Fix this by:
>> - Adding a check in cfe_probe_complete() to skip nodes already in
>>    NODE_REGISTERED state, preventing duplicate registration attempts
>> - Implementing cfe_async_unbind() callback to properly clear the
>>    source_sd pointer when the subdevice is unbound
> I think a better fix would be to register video nodes at probe time, not
> when sensors are bound.
Hi Laurent,

Thank you for the feedback and suggestion. You're right that registering
video nodes at probe time would be a cleaner approach. I'll explore this
method and implement it in the next version.

Best regards,
Xiaolei
>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
>> index 62dca76b468d..d3813c79316d 100644
>> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
>> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
>> @@ -2152,6 +2152,9 @@ static int cfe_probe_complete(struct cfe_device *cfe)
>>        cfe->v4l2_dev.notify = cfe_notify;
>>
>>        for (unsigned int i = 0; i < NUM_NODES; i++) {
>> +             if (check_state(cfe, NODE_REGISTERED, i))
>> +                     continue;
>> +
>>                ret = cfe_register_node(cfe, i);
>>                if (ret) {
>>                        cfe_err(cfe, "Unable to register video node %u.\n", i);
>> @@ -2204,8 +2207,19 @@ static int cfe_async_complete(struct v4l2_async_notifier *notifier)
>>        return cfe_probe_complete(cfe);
>>   }
>>
>> +static void cfe_async_unbind(struct v4l2_async_notifier *notifier,
>> +                          struct v4l2_subdev *subdev,
>> +                          struct v4l2_async_connection *asd)
>> +{
>> +     struct cfe_device *cfe = to_cfe_device(notifier->v4l2_dev);
>> +
>> +     cfe->source_sd = NULL;
>> +     cfe_info(cfe, "Unbinding subdev %s\n", subdev->name);
>> +}
>> +
>>   static const struct v4l2_async_notifier_operations cfe_async_ops = {
>>        .bound = cfe_async_bound,
>> +     .unbind = cfe_async_unbind,
>>        .complete = cfe_async_complete,
>>   };
>>
> --
> Regards,
>
> Laurent Pinchart

