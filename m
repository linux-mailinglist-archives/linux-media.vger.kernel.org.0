Return-Path: <linux-media+bounces-26908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44CAA437E8
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A873AEEBF
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 08:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA9F260A58;
	Tue, 25 Feb 2025 08:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="qMHnRU29"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2106.outbound.protection.outlook.com [40.107.22.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B5025A2CF
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473034; cv=fail; b=H+xypxqEQaRyhW3qNdTLuxrfow/RoQP4to7z3jXQkV6nz6jbgsZRvsjqjFI/n/RvuNk2wS2rmRTONhPSGhAJz8JozDUkxW4QoUV5XeFCoLHcmGyIf9+Df4dgnv7zEipAD+IsFCka7TLv5sNInXOU7IAc2ad2IUUA/Ju1oE9D3S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473034; c=relaxed/simple;
	bh=uRC4kidHWz635kyRn8yAEdXgL9jW+8E1NHiDZopsUUo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rcVVT66lN5PsHAKY3us/SiW4KsqBGJRLJdxdsccerqB34VeBmI5adeGLFS/3G8PnoBoH7UwYduMyHvhUsvC6KPiFGbEiuWOfvdM/D7xXyNbBOM6mpV/J/wzCos/nb7i6Y6iMIYfhG4WXBR97nXdFUlYJYXQ91hFu07qkwvuvd2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=qMHnRU29; arc=fail smtp.client-ip=40.107.22.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5k1rH0Vv1op3AFU6z6bD12fyrUmkVa00YcyaTJlT0vLjHRVDOeHu2vf5VgOHxtjxnNWYGcPqRnBLFC7IlHzi3RjN+uiJZ+zliHUtuZqdOKoQbFDVu3+fHecuwzbhYIzxTyr1ZyVcDHAyYbsQqkosYoxmwzZ8AWrNj8KSlIum7148m43QpGqGTvctMBKWZATKw0ADHoEbxUUmdRYAB3MkDysqdL3Mw2goeSOFEvdwru2KtvoMuWnWRD3g1Oq0VzVxKAexDOJGJxZKnSTTkBYEzRNfgpc68LPor7w71bR9Bvda+gTAdL6YoQsyjsvNKsNGRvj54sYWksK8UFWb1VZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzGHct18ps35V2o+GsSfzxgv6KZOtF3xTKjac3vBmww=;
 b=DkH/93QaoVDzfSGAObt2TRnxTmD4J1HbjdWV4ckYE3YKNvV/j06QQiCR71CkwMw6vEGWi2Oa9cppA17iR5YtYz43g5R07wD15OHa/0815kJNzVqnKsNXMD06J+kBF4U2yATn054CKkDZgAXPxDjTOB1Mr9belgD+LbrEiqXhnV0e0LLTZLfN8ekG3UT6FeZ+gFJE833x2IzzWBDSFszbkLFjoR/+Ln2fmFKVFTjBJ1i/ihmWxaucFtXaPRrpon82bNH0QTxmjmw4dsuYVvkIstPi1ORY9oNP6mHHrqP8GmTrQLYob3iVEjGippGKG4GbgCZVTmc8+57mqXaJ4/FpTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzGHct18ps35V2o+GsSfzxgv6KZOtF3xTKjac3vBmww=;
 b=qMHnRU29ZVhR8FIa5A24KQSrTXvlDsn3HBsvzNrc9iZYauG8oIZbIWQKFXeM6rNXD/WSeLoHN/QGjepjg8FQQDKb4AYm+NIUr6cVuGf2fY3jTQ4b2AIfLqhixzAaVXnMxBhbgmTXe2/Ny/mfjTvINpinNeIQ8aYO+1H1VepS+IQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GVXPR08MB7870.eurprd08.prod.outlook.com (2603:10a6:150::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.19; Tue, 25 Feb 2025 08:43:46 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 08:43:46 +0000
Message-ID: <3cf56fa5-00cb-4fff-9fd0-d0b832c33e10@wolfvision.net>
Date: Tue, 25 Feb 2025 09:43:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: imx415: Add missing ADBIT1 register for
 setup output format
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Gerald Loacker <Gerald.Loacker@wolfvision.net>
References: <20250219094637.607615-1-eagle.alexander923@gmail.com>
 <20250219094637.607615-2-eagle.alexander923@gmail.com>
 <CAPY8ntC4MbKBb6j9Xj4+=U1G3bOAZuxS9kMdHtTBWwX3AOHuuw@mail.gmail.com>
 <CAP1tNvQ77CuBAWrkySQvYhXngHoDfbkYaz=zE+74V6__aKUunA@mail.gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <CAP1tNvQ77CuBAWrkySQvYhXngHoDfbkYaz=zE+74V6__aKUunA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0061.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::38) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|GVXPR08MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3c8d8b-00bf-458d-d06f-08dd55788448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmFNUThPeVZkNjhHK2VUQlVlcmtUUG1MdndsSWJGUEpiUlZPZ295SmlnU2po?=
 =?utf-8?B?WVpheGZ4L1RHbGtuN0pKcDVaMWF3RUZqdWVtRlAvRlpGZ1VPZ0FnUG5UY0xr?=
 =?utf-8?B?Y2J2WEZlcXhJVTNLdS81Tm5YRUR2VWR1TEdIYVNKSzUwRHZOKzBWT3AxQkRP?=
 =?utf-8?B?TDRSSmtIVzZUYS9MOHUwZDRSdkRkNk5QY1pSZ3RiUFdFdURYZ1hqaHd5R09M?=
 =?utf-8?B?UlgyRWJrM0YyaGhqQXp3QVFhclJicmhSSHZkdVRPZ1ppL2lIcHJCQW9TNURB?=
 =?utf-8?B?Y1RvanlyZXZ3cXRPTVFzdnJ1cm5QajREWTM3dnpIbDNjYzlmM2lkQml1bFJw?=
 =?utf-8?B?WUJLNTdhUkcxRllJUy9xd3A0bzNzaUZvanF1NjNJZ2ZBc3ZsYmxrS0ttSjZO?=
 =?utf-8?B?TnlsK216MHV1K3YwK0krbFRnaHl0Y0FId1NuUkxRU1UyYmFSWEhTZ1lTZ1RJ?=
 =?utf-8?B?Ymd5VlhjOEpZS1FKZVhla05rMWVIMUlFdG1wV2s1RGpXeENPQXlzYjdhVFRO?=
 =?utf-8?B?VGRwZHY1TExqT0FwQmpxQVg4ZGpwYk1HK1hDMnAyaTNNWkU4UTJ4bEZEalp1?=
 =?utf-8?B?OWpKa2s1eS9CS0drUzUyQnVsS3N5UlJwR3NkSjdIME1HNHBFRWZzeW1vVkZG?=
 =?utf-8?B?VkhPN25RUW1JZnM4ZjQ3NmF5VDBURVNycEJFQnJGVmtiVWFUUlFITVRrQVV0?=
 =?utf-8?B?SXluY2JPcUFKQXFIK25lN3ZxQ3JPTnN0cEYrNmdhVDNZbTY3WXJGVk53WlBY?=
 =?utf-8?B?M3Z4UVJrQzdQelRJOUQ5K2loUXI4T1MvTCtDS0laQ3pGV21xVzJKNEE1WEcw?=
 =?utf-8?B?Z2hBcUNCczlqQnBycVpHM3ZiRW9meFFxWmlnbzh4Q29TVHoxaWw2Z3gxY3hO?=
 =?utf-8?B?ZEFPS3gzRStWL3RnZGFwQWw4cDEwM25SeU1xbDA4WGxPTklhZ0llTXV2Q3FU?=
 =?utf-8?B?YVRwc3RRRXUzWjZrQnJLMjRZa1J3L1hNak4weFl3a05hbmhrQmRwdXhMa2o5?=
 =?utf-8?B?L01Wckh4UEg3Y2Z6a1BZRVpxcEE1RWMvbzRKZGRYUCtzZDVHQWZ2TWd1UjdX?=
 =?utf-8?B?WnZxWTlPUXJyQWpOam9MV1hMVVVwNjRuVFpjOTVRK2VVaG1vNThYV1RaSEVT?=
 =?utf-8?B?VWZwZWxGTzZvR3NibU5tL2xZUmc3eDNqUVh5V2dNM3VFY2poeWVRSm42OUlQ?=
 =?utf-8?B?YVRjWXRJNDFwYWRrdHhVQzNKOTdXeDNvWXlLVkNpeU1PVVlIZ2E2RFY0OHRp?=
 =?utf-8?B?bWtZN2VrQ0tuckR5V0cvckZSRnFhSWNCWDAzM3V3NWJzSUFpTlZ5eTQ1SWth?=
 =?utf-8?B?aHdURk9idXEyZS9QeTJiQnl4VFhrWE9Sei9PcHFsQmg0d29LUWJIRzFnN2RK?=
 =?utf-8?B?ZW1xUjQwYmZtZkdHTjBQY1NHWWdXY0xPcXdBeCsvemRTNnQwd2kvb2VtUGZN?=
 =?utf-8?B?cEozUm9CWTdnQkZrclErbGVpdjk1Nnk1V2RMaDlmWi9PLzFmQmJ6dWRGenA4?=
 =?utf-8?B?UTVYZ01yVXhEUXNYUkNaVTJLb0wyNThqSzhXZUhTYXdkV2wvM0J5SXNpeWY0?=
 =?utf-8?B?QW5VMythWENPeVIrWW1sUjFUbzV4Z29ZN01YdE5qcHBFTXEyR29RV1A1RHJw?=
 =?utf-8?B?emdCQnNHdHZzdURWdFV5Q0xVZWRObFZwUTRqdU1OTkwxU2tuTU1KVk1qcXda?=
 =?utf-8?B?c3kxS3VSOVRJeURodmtFdHJSN3VsaFZKL0FnWXBLV3BaZ0M4a2htRlR3TzF6?=
 =?utf-8?B?TGNMb3ZJbVlIR0FQNmVRajVtWHRpTnExSlhnSVVGUmlTdXYwNlFXUTZJNGhE?=
 =?utf-8?B?ZSt1MW5ZZUlvS2Y1Qk9pNXN4akVINHhXSTlQTFliaThDRnpnM1pONnlacVZC?=
 =?utf-8?Q?Ac4hNENGdDr6F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUgrRlB3WGRBdGRodjMxZFZ3U1VicnJ5V2ZtNkVVVUl6eFE2cExQVGdzOGVz?=
 =?utf-8?B?bmM1ZHo5eDZKZlVqSFM0T2xrUFNnVDRVRmdxRkVSdjVwRXJMMUFTZFc3QTRh?=
 =?utf-8?B?ZjBvZkg5N2hmQVg2bCtPNkEzenJuOEgzZzNpM1lWZmZFc0NxT1U0U1JXTFFW?=
 =?utf-8?B?Q3lneXhGM3NuaUlYV2lXdWwzZzMyaUZkNFRXeWM0bjJRV3kzV3Mwb3Uxbldv?=
 =?utf-8?B?Mlg5bysxSllLaXhsTDlHSm4xN2xUZEF3NU1rVW1odEdwUmJtcnU1SmMxVFg2?=
 =?utf-8?B?RlVMUjRzUUE0WUdwOXA5L3o1Q2JEMTR6L3BaYjV6eGZoQUcrS3N6MVRQc2dh?=
 =?utf-8?B?a3pWdnAyMVIzWXZuQ0wrY0pkRE1ONnNkNThUZ09LQjdncUoyTmprRFpWdDdX?=
 =?utf-8?B?N0FBUmhkQmxHd2VwWGd6QmU2WmJ1UHNrL3dGN1U5QmJPN0x3SFU3Y0VTUVRZ?=
 =?utf-8?B?OFd1d3hzcmxLTkRjRmNyVExmaUpiY011c3dISXlHeUFWUTVwaWFmZW00bUFQ?=
 =?utf-8?B?OTFpS0Q1TXlpaXNZVFppQWJhdnpRUlNWQXlKUzNWT1dVZmYybUtXT3N4TElH?=
 =?utf-8?B?RTBiMzVCYmhCNTJjYlk3U3pVbVNzeXc4c0NpZTdlL3lGVW5nMG5YRXVMaU13?=
 =?utf-8?B?eHNLd2dRYW9UUjlmYmJ5Y1hPUXJzVUVDZlo2M1NTZko3Tjh4djRxaTJvN2d3?=
 =?utf-8?B?bUFwU0wrQklXOGNqWFRqUWJuOGRuK2Q5UkhmU2RBOWtaVEMvdmVyUFZpbXpT?=
 =?utf-8?B?SlZiVDVvZFhKR0lHUUVLQngwVzlJeE00SHRlOHhXcTNXWWFMcXR3RFdzOXJi?=
 =?utf-8?B?OWt1WTVCTW1kbjRvUkw2MEpwRW8rVHBZTmxLZndEc1grMXFoNmJBb2RzVnUz?=
 =?utf-8?B?TElxR2p4TEs2dnE5SHlFcDVYSGpCV3V5bzBHek5iV2ovZk55M2ZWTkpwOU9i?=
 =?utf-8?B?NzNZMmN2MmRiejFNOE5iTzVTeDBvUUlhc2dPYksrMzRvelRxZ3VxdWxYK2FM?=
 =?utf-8?B?d05HYkxWUHNGZHM3UUFFUEwwQjRndHpNL0xTUEtwOWFUMGt5WGFYUmlUL3NN?=
 =?utf-8?B?MGVJaVhva0E0SGh3b0VZSGNPc2VYYUlZeDY0eUZoanptUmNiWENEenNjUnFl?=
 =?utf-8?B?ditCNmNISEE1WU9yd0pyMy93aVNpdjlNTG1VN0o4aklodkJKdHgvd0xlUlhS?=
 =?utf-8?B?Wkh5ZVdocC8yKzBpbktHNE5lRFFaV1hZVGNqWGQwbDJIYi9STFpoVUQwNjlo?=
 =?utf-8?B?L3piTmxHbllFTWU0R2YwTkY1bnQ3c2RyVDFBcTVQZHJqTWNLbktVeER3SElR?=
 =?utf-8?B?UE0wcnpIOHM4ZkpRcHdxSDVNL1VDWkFsNGY4MnpIck1NZ1RtbXYyZm1rNllE?=
 =?utf-8?B?L0pnTlhhN2ZHRVUvRk5QbDlVSmtmSWREUjVTUGFkRmFNSWd3WGx3STZXQkM3?=
 =?utf-8?B?ZUYwSW1ScUU2M3FMc293ZkRITFhGVmdaMkltUE1rRUtQZkFrNHFmUE5ST0JR?=
 =?utf-8?B?b1djNXFvSkJKVXovZDRyQVVYR3ZIeWdtZWlEeG04YWQ5UlZRWkZtajd6S1Vs?=
 =?utf-8?B?c2J5SmVFUzMxemg5NEoxNGcxQTJ2QmRzSXVWVkNrZlBqRGlONER5aTlWZW01?=
 =?utf-8?B?OVpnQ1BVWVd3bjdZM0cxc0xPa2NDSkVXaGhKUndRV01aZWptanVDTDd0V1Rx?=
 =?utf-8?B?d3hVQkkrZUNxVHF4QU53QUhON0U5Q0dlcjFVcGxaejUxRlFZVFVVdzVQQlJj?=
 =?utf-8?B?ODNHU1lHUkFRWUpaTzdWNGQrdE5FZ3VSME84alpVTWhzMnZLY0ZGeEtSVHhG?=
 =?utf-8?B?bURiQ3ZLK0xwbVN1MGJBZDFDN0ZaYlhodkg2WFV5U0xuWVhCVkNReGNtQ1cy?=
 =?utf-8?B?bUNDVTNvOW5ZOFJCSmJQVDdUMGJHNzZGVnA1T2dKV3dJM0pGK3RJNU5MN0Y5?=
 =?utf-8?B?bHJsVWVpODZ6Z1VGNXJOdThjbTFVWjlIeHMvUUl4ZXhZSldzM1YxZ1hJS2ZR?=
 =?utf-8?B?bXlxSGdzOWtrUWl5NTVBYnBINEpWbCtWNU9uZmlIVGdMVmVIZDZGelcyNVFa?=
 =?utf-8?B?b3dTMHl0R2R5bS9PWUhzdW56eXZ3ekljcWtDamtGdkxldkJYTFZ2dTJJWXNX?=
 =?utf-8?B?ejlLckswc0ZQb3I4NGNnL2gvenFKRVRHWXdyVG9WdXFEazM3bDY2SUtjOEVK?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3c8d8b-00bf-458d-d06f-08dd55788448
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 08:43:46.2077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaZkUTzKFbH1PrdoBA4JAiPXwgsk/MDUM3dsM6ArBtOVIjUlCUR9rks3Z+/5ersR0Y3rKjAJ39iKGua4PYSgH+Coavm0J3guH4G+t18UNA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7870

Hi Alexander, Dave,

On 2/20/25 19:47, Alexander Shiyan wrote:
> Hello Dave.
> 
>>> The imx415 sensor has one more register for setting the output
>>> format (10/12 bit), which is currently not in the driver.
>>
>> The datasheet states it is the "internal A/D conversion bits" setting,
>> not output format.
>> Output format is set via MDBIT (reg 0x3032).
>>
>> The sensor may well happily truncate 12bit A/D readout to RAW10
>> output, or left shift 10bit A/D values to RAW12 output.
>>
>> I'll defer to Wolfvision on this one as I would expect them as the
>> original authors to have been given a register list by Sony for the
>> readout modes that they were interested in. Sony may therefore have
>> recommended this apparent mismatch in A/D depth vs output format.

Cc: Gerald who is already looking into this

As far as I can gather, the register is not crucial for the correct
operation. The chip works fine for us with the current driver and ADBIT1
is not mentioned in the register lists for the different modes.

However, we have successfully set the register in a different project
(MCU + IMX415).

The patch may not be essential, but it is clearly correct IMHO.

Best regards,
Michael

> 
> As far as I can see from the datasheet, the "Operating mode" table (page 48)
> clearly states that the AS-conversion and output bit width values are equal.
> 
> Thanks!


