Return-Path: <linux-media+bounces-48006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 267EEC99F3D
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 04:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 343DB3A537B
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 03:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509A72737E7;
	Tue,  2 Dec 2025 03:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="omTzQcz1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053C22AD35;
	Tue,  2 Dec 2025 03:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764645535; cv=fail; b=N/iZy5P+p/IPzJwzF6eWKYPj8C0OR8W1x1+4QAGtDBe65jjKOybpYIJ451pEPcUZpy4YZB5xV93CdkcYu4IqnX/1Q6tlDnTmhwxqbwjeXIHlY5X8iJS4WXkkroHJ67uCBlaKypEW0n0R+hfqW4NxL3m6sVJfpAwL79BaB87zIc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764645535; c=relaxed/simple;
	bh=xqzOjbhHlqr0tTLc7bZ3oUKvwSfsGcQn7D4pCZr8Rvc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i/4rPpIzaNLDZbEhNsBoOPSvh6/LphIwxKgLKTY2jPtCfVvg8ncTNp7k18uDaHlPVKsyAv+IbbeRLBP1xPe0QSUiCLezCJnv63f65SZPOUi78sTfZkceGpEGZJcoH4/iCh8VYRIA745pcYmINd4Rzndst/vlpDPpW3cgaYNlxJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=omTzQcz1; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B21xt041186982;
	Tue, 2 Dec 2025 03:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NllC0Bk7u0berP/4zMKB6WzeVV0tADtXeb6o1Hxm3rg=; b=
	omTzQcz1lIfj928edtfoBCcCjLiwZvI1uthka/Pc8alc9EUOaXbsVJFNUFjviiLN
	gGksPfeRL8lg+mb1Pmi/5DMSt6glJ7krEGsltP91oJ6EeVv/HxZUFLFgBokKonHe
	AsgRp5zys7FFh3/T2b29UZ5Aoo4N6xHMucC3KUTcLlDADDznp8+0/aNbuSk6FNNv
	ieDsg++DujRQG1wSh99F9Uw+fTL5DiUc6bZye6j8qZSEkGecoUkc0tYiIXfc1IYw
	UdzfhLlT3Km2XJfHQuf0l7IqPZJFA4tIrz2txP7aLlWXTdPaiBjJ4udZEbrNC294
	lyUCTsGkxzofq6wyQY8vDQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21tp6g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 03:18:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSsZLI9ZDd4G5IzA0wUpHGBU/XFsnIZWjOBA8hZw+gMX6WLunDXALW8TJAowLFLhLjxt2uJxTt3lEnm7jxnioAKSNRNqfSFVT4EUK8c8liLe+JvK3GidhQ9Y6dtaHb1JvrjudwInfO9A27daVNaW+X8jpt+P+8TVrxoP+hyYam6J0DXPqKJEzLcDJ2SG7QuRRTe9tsz4ItlM8fdmzDRcZ2aySSTXqffVgqoVM7xVBDWTGV+097Vvju5aGg5KlmaWFEAtOdtwxdmkTEepReGJvYxYvz7oEszpsMakPp8j9WYH7/cGKpTMf+exaTelTB/yNTm2qcADNmD8yhmXafYLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NllC0Bk7u0berP/4zMKB6WzeVV0tADtXeb6o1Hxm3rg=;
 b=JRaaD1x50dS890FPlZWFU0LRx8ijZtd2O0+/6ToZLkMMDmyQrq/0EJN81I0JtKTNS2zqJVvbpVDTpwvYf9zREwI0Ifz3F7+YfkvzdlaSC9HswbJNVV5SCoDy87OKGqSjRMNxlxB9eHOlWL1MLZQ6ozIwq1wsa6PxEizXBaZUi6cmbkY464CFRrpV0NRZ3SYTc76aKiwJMNM3jvblndyie1eFL1Ryg1v8JND/lAnbMFfE+pXJZc7eZAo+Qkit8I4oP4TYG7H9KmbRh6uStJuc/sMNTsVSG9XLM+yhvd6rQtQHTC4UnaXBrhnozOIm1cqSwxVJP184R+CGXfYJzl85cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MN0PR11MB6183.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 03:18:15 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 03:18:14 +0000
Message-ID: <faeeec10-93c5-4fcb-9977-70980a77f0f3@windriver.com>
Date: Tue, 2 Dec 2025 11:18:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov5647: use our own mutex for the ctrl lock
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
        johannes.goede@oss.qualcomm.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jai Luthra <jai.luthra@ideasonboard.com>
References: <20251201000026.690298-1-xiaolei.wang@windriver.com>
 <4553d9ed-ba4e-4f83-b48e-e819e7979293@oss.qualcomm.com>
 <aS2R0z_pHd64fpOf@kekkonen.localdomain>
 <cp4pq3myb3gjwau2hzhkui5fx5mnp275ry5moas67qy5nrrigb@zezne7db74ov>
 <CAPY8ntCXb4R48bNCf0EdHeLSiA2xh62Y+=Uq9XRWNEEv2xrnHw@mail.gmail.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <CAPY8ntCXb4R48bNCf0EdHeLSiA2xh62Y+=Uq9XRWNEEv2xrnHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0074.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3a::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|MN0PR11MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6a766a-6bf9-40dd-9450-08de31516e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2M0dzJVaGpDMkM1cGVDZGZwYWxQZWx5NEJXY0FBUHZtOHlBTEt1Rnc1Vkxx?=
 =?utf-8?B?R1FrSVN5Q1EzVVQwVTVxWitybWo2OXBmK3M4bkhJUEVkZDd6S1ZsZWp4OHlM?=
 =?utf-8?B?Q0N5d1JmbUNvOEdDa2VRaExTalhIcFJZSU5FMXU3R0ZmL0VMMGNISnhqaUMz?=
 =?utf-8?B?UnR2anZLT1JJRkdUeGtYQk5xRlkrSmpQam5wZjZhMWZtM2NmSHQvVVVTYVRR?=
 =?utf-8?B?QjdyMDBDUVpZeFBNTXN6cjF1VnJkSDRRQnRYZzU3NklWKzF4U0ZZbWtoQlYv?=
 =?utf-8?B?VmFLaUxndVNsZlk4THMwemgrLzJJL3l6UmpSUGFOUVlPekRxaGorQzFuakdN?=
 =?utf-8?B?MGtLY2RyZGYyTlovRWZmSnp0UnFoeW5BcHBnNFR6cVl5b2hBaFEvRFdKSjlN?=
 =?utf-8?B?MHEwYzMzQ1RZOWJTeW9ESk8rRFp6eExuNU0vekwrYlhLRUVFamtOc1liTTRZ?=
 =?utf-8?B?TUNUeDlUbHNEVkZ0REpMMmg4NSs5M2U5OEhLbjdWSVZDMEJ0STFCZ1RoTHVt?=
 =?utf-8?B?NUE3V0VSNHhvV3VEbkRodWM1cnN3Z0hDcFJLL3lveXRCQzdqT1RSZ0lZbS9B?=
 =?utf-8?B?V2V4Y1N2N3MvVHBPMEZJN0xvY2RndDFydTgycERNZFpFb1dMd3ZZN2xLWXFB?=
 =?utf-8?B?eFNxM215eFZOZWFsYVdDbHFEN0VHa2hURnZaOGpBeXBNUmJGeURURUN0L0Fa?=
 =?utf-8?B?R3JRMTBuK3BiQ0RsaitKSEp0SjZSaXp2cHN6NUpYNytLcjAwVyt5WkJCbEZj?=
 =?utf-8?B?K0tlckdUclVVZ0lwRDIwVHc5NDBrSTJZZytobFpxdjNuZDZFSmx6Y1FodjVM?=
 =?utf-8?B?a3pNQ215RnptUnJCNGcxZlJ2bzBQRHdDT281c3daUHZyWWZTcjU1Zk0xT0FZ?=
 =?utf-8?B?Uk1QdzRDQ2JzZ2tHNzc3OEJZLzIremZ6eTRCaHBiZkIwcC9ERXArQlRnY3pl?=
 =?utf-8?B?RXVHNitVVWVYejdFUVJOZ0VVNHlacFF2UkM0RFVJVzAxR3pIdHkvVEhmOUlo?=
 =?utf-8?B?eGw4TE1jYkNBcXlUMmdkYTRDakRaRzUwMGZJSVoreG5PZmFtQnIvOGlXQnNI?=
 =?utf-8?B?OUlENktsVXJxMVNoZ053TmxReUNRNFFTUzZzMllkbmJyVlY0a3Q5UWlHWnFa?=
 =?utf-8?B?YXpBYU5McVVwWEZVdXpmTEFRWHRoWko1cG50ZW12Vmw2Zzg5SUJTSFlsOWpQ?=
 =?utf-8?B?TTkycjUwUmNjZUxLekZvNGttYmt1VlVTOUpNQnRUQU1NY2JCdG9lYk5kZEln?=
 =?utf-8?B?OGgybVNXZjVCNUxENDd5YThnVktEUUIxK01pK0IxRDJQZGM3UWxGU1MwdXdu?=
 =?utf-8?B?bU15MGQvT011S3l3Q0k2Y0NXQy9DY2dmY25lb2IzSEFqc1h2c3QveTB4MFhF?=
 =?utf-8?B?ZS9iWW1ISHFzTlFoMnN5elJiVkFSNlpxMVRKenF1SFBLS3ViS0xIZ0lvR2dK?=
 =?utf-8?B?RWtKLzB5SHdRcnRwNHZSSTcrMFpLRzlNaVB3N09MRkRvUXVSOFZHQklTejdX?=
 =?utf-8?B?VVRkS0phVURjc2Q3K09jWlFrZnFHbUMvbDJCY2MwcHU1eGFoNkVITVo2L1Zp?=
 =?utf-8?B?YW4rS3JRVlNNSGdmSHFmV2liRS9BOUl3VUhwZmdSQ2RtNHhTcTJiUGxIT0xo?=
 =?utf-8?B?Sy9Ba0RDQ2JlU3l2dm5XV2lNeHFnR1NRQ2xSOGhPdmlxa0g2SndJNzlpbnlR?=
 =?utf-8?B?dXRYRVd0YWRnYXl4dFFqb2JyQnB6azZFaGFOQnJSeHlhWHR1VWVMRDBBWHIy?=
 =?utf-8?B?SThQdUN0THhHSnFuOEg4MzNDekQraGtEb0VwMmR3V1U2QlhuOTVFTzBjeitX?=
 =?utf-8?B?aFRWZzhTaHA5TmsvMThydldVa3dtMTBsZ1hTcWgzSTZtSENBT1l3dHdFc2Fp?=
 =?utf-8?B?Y0NoMllLN2JpV3h2QTgwUWNwTEFHTFNWYnZHYVBEeGROalF3djBxb25JMjlx?=
 =?utf-8?B?RkE4cTIzOVNvUHNCei83cmgzNlpYTGl0WGdFVkkvTks5c2pacHU1TFQxYlJV?=
 =?utf-8?B?TjJkK2J0R0tRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RktCbHVRdnNwNGxkS2JkMVBkbXIraklIdHk3T1M0Y01WZXkrZEFzMEtNR1Ru?=
 =?utf-8?B?bUw2eFF2R1QraXM3b1JCcXBIT1dLZ3Z0dzMyeTRSV0Zoejh6ZGc1WjBtNFds?=
 =?utf-8?B?QTFyOC9ybVowc3lQNzVrQ1hteExFZzVRNDYzUEZuZ2dxSDRNbTVJUkZtTWkw?=
 =?utf-8?B?TUduRjU1UTJmKy96Q3ozQkE1ejRBempOeUNsUkhReEFPWjcrd3M0OFNjcHk4?=
 =?utf-8?B?THQrQWx1Z0Z5VnN5SUhPWmxYVlcwMHFXVisxWlJsK0MxQjM2NUp1SjRxdVls?=
 =?utf-8?B?OXN3N0V4MnMxSWlkRzRkTW1tWnBtTTA3UUNMUnFFSHNGNzhROGk1QVBhOFVl?=
 =?utf-8?B?RlY3bUcxWXVOVXdwdGNLNXowMld5Q1VQbCtPdU9yVm9FSEc2UGpFUlFTeWt3?=
 =?utf-8?B?aWhBVWM3Vzk4VHZiekRPeUhmNXhvTGVNUWNlK1EvelZjTEFwZHBLM2VyL2E3?=
 =?utf-8?B?R2J0M1NLUWlxaVdhOVJOS0Z5ejhBWXhBYW95NUVSTTFLWXJUSHJrUHJUMWgv?=
 =?utf-8?B?NDFuV29FcTdYTEdOb0ZtazVoZS9iMlNURTRYY29oL1FVNTFGWU4vem9FVjVt?=
 =?utf-8?B?S0VjcCtzQ2d1S0d5TFdVc3Vuekw5U1B0bi9UMHN3ZGxNdEkzTjl6RnNySGtw?=
 =?utf-8?B?Z0M2YzJQaUFRQjdNTHVWT1BTTGZSZkRjekdtUGlBdm9ESXdWaHNyTWRDempi?=
 =?utf-8?B?SHZ6ZWlGZWRRMk1maXZ3ZzhmcDlCM0o2Nnh4MFBXRkVjMUxIM2NnZkhXL2pS?=
 =?utf-8?B?ZG05UTNuMFhSY1BKaUVkL1JtL0g5WC9DSEx3eDJrUHFHTjNVN3Vad0hJVlZI?=
 =?utf-8?B?OE1FNnh1dTBiN0N2SHdQZnhXc21TU2ErWXNKOXFoWCtoUG5DNmN6bGV0Y2Jm?=
 =?utf-8?B?bnQvODNWSko5NmVFMFhRUFlUMzJQaWg2VHJSZHYwb3o5MGcyVzliZ2NPL2Rq?=
 =?utf-8?B?SFFVYllhRjFmeDVEOWxsNm9YL3RzbnZPWnh2QmRud2prVnFiZk1vYUhFUiti?=
 =?utf-8?B?dFgvcnFySXp1anAwRkRZY1hEZ3NPNW13UVd4MExRODNFdUJNYWxUVDFPSGdj?=
 =?utf-8?B?Y0d6dFZ2SU5jL0tHQVhwUlNDMkljN2dxN1BhSDFETWl5bWtJb3RHVitHQVJi?=
 =?utf-8?B?SUtJQklnNEg4aHBLTG4vcytjRG8zWUlhdDV2d2x2a3RObVF2aUJITXV5NEtn?=
 =?utf-8?B?ejI2VVplT1F6OE1iWlpFUy93VHZSUUo2cEQ5R1BMVE9BMkpmSEExdGRhMng1?=
 =?utf-8?B?cHNLQVpDbmx1WXBwanQ2Nk1PWkl1RnMxTDVZelkyb25XRWErOHg1eGUyV0Rk?=
 =?utf-8?B?RThKaEtoV0ZMMHluNGdVbm1yUFhHWlcrR1hDVFFIZzBQVi90eFFDcGQ1OTFU?=
 =?utf-8?B?UmxFcFhQYThBTXRvenpSTTJaa1ljZG42SklQZGJ2V2RvcG04emRXOU8xMExP?=
 =?utf-8?B?ZkE4WVVGaVdFSUZjb2M0ZXBQcHNKV2FaMWtMUnNHQ2ZsWjF3QjRqMVQxeDA0?=
 =?utf-8?B?eGFnSlhoQ1Z1bERxbFk0QldLVE5VaVpVbk10OVpvRXVTU25TU0VUZDF2bUZs?=
 =?utf-8?B?M2p6RUJCK0o3ZjRvTFV3cHNZZk82MVRUb2tVdHRxaGVOdndibHVCTXVvSEcr?=
 =?utf-8?B?UlJaN21TRlJaalFoRVhDY0l3QWxhTEE0MFQ1K2g5UUVDV0FMQUhhWUxuSW5N?=
 =?utf-8?B?N2JWUkZLSW80NkRHdy91SGMxTVRrQks0aHpUOEl4a0NPN2VsK3NkWGg2LzdE?=
 =?utf-8?B?RkpGZGtPWGZrYWtrSXFvZll0TUhTT00xT1ZzL0Rua0tlclpTNnc4M3YwYlhr?=
 =?utf-8?B?bFRYZmxwQmQ2aGh5OThSWnZCbFJQOStFdVlmRlpCMlcwd2lhTW5BaXEvV2h0?=
 =?utf-8?B?ZEdOOXBzcENDMmRWTEZqNHRNaG5mMlhEOGk0ZU5jbWw5ZzA0bmNiQ3BMeHZn?=
 =?utf-8?B?alhXNjhTa3JZcVFZUUQyQStEcnpQdWJOa2ErbUMrZnNrUzlIQ0ZCQkpNYlda?=
 =?utf-8?B?RTBmYWczcFhmQWNJendCVEhDN3crZFdUUkFBbThjbk8wTFQ4ZVBzdHBDeDFm?=
 =?utf-8?B?WWJub3pmdHo2TzZBeTkxbDdKSm00WEh0Q3BsNEhmSld1VVJBeHBMa2pxY0l6?=
 =?utf-8?B?d2s4SklnV245eVNHV1Z0WUpxNW5YQ3AzK2dYRlBBdzBFUU1qb3hrUXRESVFE?=
 =?utf-8?B?R2dTeDAzMEthWFpwTUhVeUFsenpKV0QxVFlxczdZdnlxRy9iNWV3MHBaOWs3?=
 =?utf-8?B?dHF1akg5MTI0a2EyY0MvZEFlSnBRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6a766a-6bf9-40dd-9450-08de31516e3f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 03:18:14.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2EUThSJ0jGSnrGfXVItMw1EnLq66o1Jogda95v8gdYnpbz4mGTdoo5NTyyszy9aVdUaihyMCQxZn4SxF0yZReBfoBfUflZ0m4yIFzyrhck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
X-Proofpoint-GUID: ZCjzJDnz15KChB5SWc4FJa_jtwmDKyxk
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692e5a79 cx=c_pps
 a=v5NpUkBk8u87wj8Ets5Xkg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=P1BnusSwAAAA:8
 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=KJKLeKeyGYtqvtqZu8AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAyMyBTYWx0ZWRfXzMRrLRLy+JOw
 igxtQenYJRB0KnGonfnva1RSM/MEjSFUzdG5IeuH1hA1f5uC9kh+YXVWEMUJZQ7xxuP2NozE3fz
 dR0yXwk/Vm0b34LTQpBkle8A8raw/anE0rYwVXT0PYn4RHiwANSSYRcVeYpPmJ4cw9+5O7gEdxu
 QawMfofuTvjTKBZGGg0YdaNjaBoNsrE/OcxT6mAB9x+1PDMH3ilKQ/pXC2heXkjakDF0UcuR4ky
 lzee98BX58qi+/8xZnIMfvOZqayUoZ2a85eZRZUaUJV96hyl42PQcQEQqnGtLL/dTUxCN7YYBwB
 SaNc5y51o07mEY7UEPLbrJ9LJSBnrTQYM7i1JKigG0qF/dfniuBy8/jtWpr/78fSYQ9RaXhVhDN
 PtNDPrXZuvSkRNDzReVruUEStfsPaA==
X-Proofpoint-ORIG-GUID: ZCjzJDnz15KChB5SWc4FJa_jtwmDKyxk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020023

Hi

On 12/2/25 00:06, Dave Stevenson wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Sakari
>
> On Mon, 1 Dec 2025 at 13:58, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>> Hello
>>
>> On Mon, Dec 01, 2025 at 03:02:11PM +0200, Sakari Ailus wrote:
>>> Hi Hans, Xiaolei,
>>>
>>> On Mon, Dec 01, 2025 at 10:31:59AM +0100, johannes.goede@oss.qualcomm.com wrote:
>>>> Hi,
>>>>
>>>> On 1-Dec-25 1:00 AM, Xiaolei Wang wrote:
>>>>> __v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range()
>>>>> contains an assertion to verify that the v4l2_ctrl_handler::lock
>>>>> is held, as it should only be called when the lock has already
>>>>> been acquired. Therefore use our own mutex for the ctrl lock,
>>>>> otherwise a warning will be  reported.
>>>>>
>>>>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>>>> Generally speaking as a default locking setup for sensor
>>>> drivers we are moving in the direction of removing driver
>>>> specific locks and instead using the control-handler
>>>> lock everywhere, including using it as the active state
>>>> lock, see e.g. :
>>>>
>>>> https://lore.kernel.org/linux-media/20250313184314.91410-14-hdegoede@redhat.com/
>>>>
>>>> which sets ov02c10->sd.state_lock = ov02c10->ctrl_handler.lock
>>>> and then removes a bunch of manual mutex_lock / unlock calls
>>>> since all ops which get called with a sd_state will already
>>>> have the lock called when operating on the active_state
>>>> (and when called in try mode they should not touch anything
>>>> needing locking).
>>>>
>>>> Note if you also want to make the ctrl_handler lock
>>>> the active state lock then you need to add calls to
>>>> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup()
>>>> to allocate the active-state to probe().
>>> I agree with the above, but the driver is old and it uses its own lock to
>>> serialise access to its data structures while it uses the control lock
>>> separately. So this looks like a bugfix that could be backported.
>>>
>>> I wonder if anyone still has a system with this sensor.
>> ov5647 is the rpi camera module v1, so I guess it's still around even
>> if a bit old. Dave in cc is the expert and maintainer of this driver.
> Raspberry Pi stopped selling OV5647 in about 2016 after Omnivision
> gave a last-time-buy date in 2014/5, and we brought out the v2 camera
> module based on imx219. However there are still modules being sold
> even now - stick "OV5647" into eBay or Amazon and you'll get loads of
> hits.
>
> We still support the modules, but have little enthusiasm for investing
> significant development effort into it whilst it remains functional.
>
> As this is a bug fix for a genuine issue and has minimal impact, I'd
> be tempted to accept it. Reworking the driver to use the same mutex
> and all the subdev state can be done at a separate time (unless
> Xiaolei is really keen to do it now).
Thanks for the feedback and support. I appreciate the context about
the OV5647 module.

Currently, I think maintaining the current minimal fix is ​​better, as 
it also

facilitates stable backporting. The driver rework can be done separately

in the future

thanks

xiaolei

>
>    Dave
>
>> Jai has a series in review to upstream all the remaining BSP patches
>> for this driver.
>> https://lore.kernel.org/all/20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com/
>>
>> I'll cc him as well
>>
>>> --
>>> Regards,
>>>
>>> Sakari Ailus
>>>

