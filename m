Return-Path: <linux-media+bounces-37891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F6B07C79
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 20:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA615584B38
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 18:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FFB28C851;
	Wed, 16 Jul 2025 18:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yYNGo52I"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E913287241;
	Wed, 16 Jul 2025 18:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752688845; cv=fail; b=tw7d+6RaSVatyhQpKTSMx2xRsFTKWqv0YmEPHRwlESAoez5Fug+51Y/MAozU+V7wtRiLyvdB6rQ5uOHZc2e1Y0I/PKkv44G8YeBuAX0x/F6J6+3jETu3ECJZ14BPjLKJOEB1Vt2/qT3b+2lT6HiKyK2Ttd71T+nhlbHsXRuwk3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752688845; c=relaxed/simple;
	bh=g7fGIYxVoQLFOyoKuefzoVHMEhZbrlbIkjlH/UILn3Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VYA5NJgTTVuVCCZrr6Cty2wlha/FFCU4VC82bNjLpxg0ytlmXPcTgBVw+XQZntV2btuF16mPbRSfd/RF4x7jMckW6imYTip55MA33p0bBfPr5LxIqvn0cn5UE5TdtSPDD2haCRQmg5GcwrZ6++nMO49Y8YsQM2ZH5eE0RWMh02I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yYNGo52I; arc=fail smtp.client-ip=40.107.244.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msi1U1ejTHOYHZSvcVgfa0LrYd1Tr/EyS67zr0LEw1I20BnDBntVltAJrKqaGpvmA3MZGIFH/tIcAtkQ85aGc3n4rityoU+Mz3ZhuJXC5d0WXb/QWcyU2WuUdBIa7ZpBxBYnyMqItMdDeA+nUFObGrx+YWG0slQpSHhm318OwaWIT8hIxy9VrDeYU43xCjNi5D5L3qu4FpnmQIGQBGjvVzGTf92Wy7DMmG5s5+E7EHR4/3kAF8ongBuHBasclsC+9MsV5Vy2+4Tbm7ScsjLzTdA3QD3PTkdklRoctTwE9zNSW6JrmuFR71l3YX29vTGuv84M7v9xedFXI1wkGMABsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XeZo81CZNHRlC6YXW2ZC/Zq6GN1FgjeFH1kQ+ui7FE=;
 b=ASmXY7UQbl/mevRwIcEMIcM1625fjzdtpjg9DPK03xB7waAl5dm7YjOHEw2rz574xCKPMwpkxYaqbnPuA3tCoemE76zh+8cza6QchFs0tANecg5O24odsuk3D8kWaTtQ+1pPEVnCHjTFpmEf/Hvitjjk0QtZGdrcm9E512MqYo4OUU/++iz13uRzNgag598hZqMIFbWgxUof03f2VDM9wOz0Ws8NnR2ug1jdYRkAdRGVBOj4/G6k/SRQyFWh0luItfhlKVCMMNP9P02zdeWhqqhTCqKHt2eNcBcRNd5q9ivQ3isEZj4loWE2zDOIdjon8IczaNtgvntHIt7XbTxBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XeZo81CZNHRlC6YXW2ZC/Zq6GN1FgjeFH1kQ+ui7FE=;
 b=yYNGo52IVaB4lBRZTgm06zjVQdEgao+BHENNa9aYO3ZMdeKptpGKPqLBJUjM1dwoJmPEPyBBDRPxZP/5BsPFKba7j+g5o5jlxy6JOfKPCzo1e78vJ9Kzk4Gkphhx0deckM2f3tSlGlKDwOq0/gJ6pYiGitOkbn0Z9YbkNuWrAc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 18:00:39 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 18:00:39 +0000
Message-ID: <2d9036bb-8a90-421e-b612-ed5a112c63d9@amd.com>
Date: Wed, 16 Jul 2025 14:00:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: i2c: Add OV05C10 camera sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, kieran.bingham@ideasonboard.com,
 hao.yao@intel.com, mehdi.djait@linux.intel.com,
 dongcheng.yan@linux.intel.com, hverkuil@xs4all.nl, krzk@kernel.org,
 dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, Phil.Jawich@amd.com
References: <20250714205805.1329403-1-pratap.nirujogi@amd.com>
 <60cf7590-4fd8-419b-a782-8bc89fb5395a@kernel.org>
 <20250715181358.GI20231@pendragon.ideasonboard.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250715181358.GI20231@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::30) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2ad064-0215-4ceb-35ce-08ddc492ac24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djdRVmdrT1JzQkhjY21qTVR3OUdtUGE4R29QTDJicmRVNTQ4d0R4bWFPTURw?=
 =?utf-8?B?eEl5SFZnQy82dEpORXY5SDZNdzlPYUJjNDQ0NE1UcGV2U3RxcXFTSDh3OGZq?=
 =?utf-8?B?WkhCMlJBbHdJd3FvOVNtTHpPVnBUUHpiVk53NUJDMmtwNUdBYll4dFBxTUt1?=
 =?utf-8?B?Y1hZczNhUVJFUEJqYmswVlpXTHQvc0l5dFN2M2tLaGVmRmRoaXg5VzgyMWJi?=
 =?utf-8?B?R1VvVE1HRmVlQUhZNEZUR3hhdXE5SWp1TGVNQ1h6LzZCS2JIKzdlUnlneW9X?=
 =?utf-8?B?NlI5R2FrMGt2ZEovTXczVC9lTEw0U0NyK00vZHFhb0ZLQnZWR3BQRk14Yi84?=
 =?utf-8?B?elZiZVFwNGMrVTlvVVN1Wmxpb1BVRGpkcnNjTEd2SzNycmhYNms5d3R2N3Yv?=
 =?utf-8?B?RGNvcUlkUktDQms2aElxUk03U3FZYUpIMncwL2NRazRnak1UZzZLZzdweDhr?=
 =?utf-8?B?QmwxK3NIUVdvQWllVks0d3FOS2M4SHJ0UzlNV0hmQnlpeHQxV0JlTGZkUjFG?=
 =?utf-8?B?OG5meVN0TkVIdEJFSU0zSG5HSFpVZXpVU2YxZTg2cWZkMnRhSWh6L1dOaTkw?=
 =?utf-8?B?Vjl1c3BWTlRXQzBnb1RnZFBCVTFoRXdHeWthUFNoQnB0VDJ4Q3hhTGk4SSs1?=
 =?utf-8?B?eUZ3WEU5SEpYM2ZIMjNmSE5VR0hJRXNaWDhGYWhuZHEyMFlEVHowK0J1VnVu?=
 =?utf-8?B?MGZFelZoN1lsRk5FMXBUVjBFWlRKVEFJWU8vVzFLb3lKQnFtQ0dBY0hWWE5p?=
 =?utf-8?B?a1U0b3ozZ3g5TzBLUnZHckswamtYYVRGOU11UWxhREpselFNaDJpS1B1VWpO?=
 =?utf-8?B?aVJNTkkwT2dKVVB3SHpzYlQ4NnQ0ekRucUh1enc4QVVJZ2xUWlpyVnpiMGdX?=
 =?utf-8?B?Yi9lcTk2VzFCQmRnMTZWRGVJSFF6aWUzNWpWTituVkh3a2c4anBzak05cUtW?=
 =?utf-8?B?SXREYlRxVWdNS3RNazVkOVB4dTh1cFJ0VXhRMFhsVXc5WUI0M0U4MnJ1VUV6?=
 =?utf-8?B?RnI0SU1DWlErZFRqT1lwdHZVZmRGN0lLalc1ZTY1aFV5K2FFUXZRTjU0d0RV?=
 =?utf-8?B?NXB2NjgxYTJWeFlVYmo2RmhqNC9OWFZSdVU1N2tUQTlPK0RIQjA0bE9rdHhZ?=
 =?utf-8?B?eDcxN2ZDVUJYUW5POFU0TUVndElObmNIMy9ONDFpWlRGT21BT3UrU3lMOE15?=
 =?utf-8?B?dmVacGRCTzJ4YlVCVFNsb0pKTHM2MFFCSEwrc3haVVRLb1NSeXhMQmhpdm5s?=
 =?utf-8?B?NkdDcitwK0RXUENzeWFicS9uc0NnMEswdEtTTFhCN1VDanZoc0hmUVRhNnow?=
 =?utf-8?B?VW1LOFgxeU5lQThWaE1TV0NvbnU3ckQxdWsyd0Foa2oweGNYOHcrYmV5MnZk?=
 =?utf-8?B?elZTaTJ3RDJsU0YrKy85REY3akhYdEY0Z0NTcmhrRUpYVVUvSjRab2ZGTER0?=
 =?utf-8?B?T0VOUnZBOXJTR1QwYnk3RjVwZXF6WTJiNEtKcVMwRldmWVZxOEs4ZEQyUkRJ?=
 =?utf-8?B?a0hRbUdWUjlSTVB1TXpNNFVpckdRYXpGQTMvRWk2bnpnODNOYjN2YTVvRUFm?=
 =?utf-8?B?THQ1NnNzVkRUK3hBNUhOajN4T0l6a1hKRHgxZE84b3lOY2hqSjVjOEo1aHdG?=
 =?utf-8?B?YWY3UDlTV2Q0czFxeHUremIxUkxRM0d2ckFlcTQrcTN4NFZEM0ExaHl1Y3BR?=
 =?utf-8?B?TVd5VGxkenY5d3hMKzF6bmNHWlBxRERaNFVRSlFVWGk4eWVhdG1sRkRYUFZK?=
 =?utf-8?B?NnpYTWlXcERhbUp0K1V1T2duRWdXdm51eDhWeFFrekZnRE5Kb1pPMkdkaW52?=
 =?utf-8?B?VXJseHJKb1hlNjgvV1c0MFYvRlM4S0dWRjZUWUw5YXdlY0JSeEcxNHMzdDgw?=
 =?utf-8?B?bHlHLzNGeXE1bDU1Mkp5U0NET1Z4cEt3a0VodExQWkNoRUFFNFFIb3NTRksv?=
 =?utf-8?Q?rB5BWuv1B+g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tjh1SHlCbDdlWVBQRHJoQkl2Q0EwUFZkSjgxeDZGRjk4VVlwT24wdytVdlpa?=
 =?utf-8?B?c0tiRkk1c3VWV3F4YWRaR0VydTZCemYreWxJelZKWHZXWStwRzhGTkp0OE9T?=
 =?utf-8?B?V1k4MkRGam9BczlrZTZ2MFE4S2t1cEczNEVSeGN3Umw4WExVK0tGU0Y3dHJW?=
 =?utf-8?B?MTR5cmphRjlVajB4cG55eUg1bHVtZ2k5Nk1SZDg5WjJqeTFpL1huTU0rSWR1?=
 =?utf-8?B?enNESzZmcUpQUUtqeHhvU0Y2cjM1T2Iwb3g4SU5wRSs3RFNpOFlKMzU3ZFB4?=
 =?utf-8?B?RUhYcXZmNkJlVmFlNXdnUWRYQU9BUGF4eFBReXlXaWh3N25Tc1VtTDJMeVpQ?=
 =?utf-8?B?aW4xMzBCK3JOQXJKVWRpdEVZeEo1TWJadnVNY2VPQzdWZEF2R1FoZzlaSWwy?=
 =?utf-8?B?RStHQnBNN0IraFlEYTMvRDJFSDFsK0xrWjNqUG9TOFJtdE5JVnhqV1ZwK1lz?=
 =?utf-8?B?emZ2b0grWjJWUDZTbWM4MFNmQnhYS2pmdS9FUE9CMnd5WFY1ZzU4OTg0dE5J?=
 =?utf-8?B?dmhTQ3Z2WG9NaUJEVHIzWmpFNW40SzM2MXNUM0F2aVIxc1JVc05TamFXRXkx?=
 =?utf-8?B?KzdaSmNuR0g5SzUxK3pyMmRWM0NSSENHcmVVamRCV29pRi85N01GRVpYaWx2?=
 =?utf-8?B?TDRGMzIyTEZiNE5DQ3E0ZDRCOERVOWNFVUJLelhqTWRUM0hLTVZBV3lPb3dY?=
 =?utf-8?B?U0ZtaXBLbFM0RWY2c3paaXhXTGtwVXZneWpCMkdlZ0tNN0RHS212TGVYUzJX?=
 =?utf-8?B?bjB6dWRIT0QrNVFwTS85L0NsOVB1dHA4cm14d1I0TnRqcFQ3aFhYdzZRTDdS?=
 =?utf-8?B?UjdpN3JPN1UzdDEyTHVJM2pZTmpSODh6cXJPT2g0ejlVTkNaQTl6NDRod0t6?=
 =?utf-8?B?NUlpeFlKUEJiMXVlWnRLUmFtby9jYzBFT29aem5MRVRPNy9GOTNiWmljVmFN?=
 =?utf-8?B?eXN0a2xFRnJCQ2xIamZkNTZUd0Jna2poOVVqKy9GWDcraWJMOWJ0NW9uRmhk?=
 =?utf-8?B?TU1mbmVpVldXOC9UKzBpT2VUWmsrNEYyZUdGZmYyTloxVm00dU44UzJKaHBG?=
 =?utf-8?B?R1JNeFpvM2IrRWxrYnd3TTRoSUhhTVRYSVBOUy9tRW94cnk5WGR1NGdFSmpa?=
 =?utf-8?B?KzNCY1Y3U083bnpIRS9mcTdlWUFqNFB2RDlUQS9pNlJ0a1RsQk9DWkRpUHNS?=
 =?utf-8?B?TzRhM2NXNFFINDFSNzBVMUdhN3o2L3hkdEo5Ky8xa29lL0wyTFlOUUIzdExl?=
 =?utf-8?B?RXhxdEdIZk43dmdwQVBodG05SUlwOUQ2NVRobWlXWDZDTUl4TXY2Umcva09D?=
 =?utf-8?B?TmEzY0d1Q0x4YVNyQndBZ2lONzkrQlNPOEYzQnRid0FhY25oMEdJa3dUOENI?=
 =?utf-8?B?MFBmc3ZIazNqMTVDdWwwOGdaOG0vUTBHVDRCTzRlYkNUV3lnVHE4NkhVWkhm?=
 =?utf-8?B?bUtzNkJjWHYrbi9JdG0vemZaUXM0dG11bVpSK0hkODEwajdHdGp3MjNjNDN2?=
 =?utf-8?B?T0lySGM4OCtIZ2dXeVZuaFpjU3dRRE1pdExZbUxRWVYzQ05jY29WdzE3V2dU?=
 =?utf-8?B?SXplM0RSZzByTzEvZGNzU2c5OUVTZnBpVVRyYS9pcVVsSWwweHBNQWtnOGEv?=
 =?utf-8?B?d0ExeWI0LzRlaTZvM2ExT1pTcWUrN3Qxa2NkbW1lTmtQdkdZbXFFcDRrYVRX?=
 =?utf-8?B?d0M0MU92ZVA1YlBSN0wwTXhMQ0NBeVRnMVJ1RDh6bHJDYnRWTDNCOHQwR2VS?=
 =?utf-8?B?Q1htNWpoOTU0UVBKaVZxeEpTclJKL0dnUit0bEF0ODRGNFdxaExJbWZLNVBy?=
 =?utf-8?B?V2RhNHJuOUh4RFB2VkxaYW1MaGZjRWxpN05GNVIzOGR6dnJoN2xnZm1JaTc0?=
 =?utf-8?B?REdnTmkzRUJTdHp2YnNoRFdOYlVmOFJNcFMvayt6YTE5NmQ5NFBSWXpNVWpY?=
 =?utf-8?B?dnVoeHlSSUNMSUxwczZRQjJRVGdCT0Z2NjkvZVBJbXBUVStPOUhJZ0xpNVcw?=
 =?utf-8?B?QndyVXQ1eXJLK3V0U0E3N0RpSDlhNnB1NUN1Q1l2eWN1MnZmdWx2T3FwNXpO?=
 =?utf-8?B?VENoK09wLzZQbVUrSEcxQlJBSkJITWMramVQL3hLM2c5SlhGU3ZxMW1FWDlv?=
 =?utf-8?Q?98jvAeiQJDSM9PkhQh0rq94EM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2ad064-0215-4ceb-35ce-08ddc492ac24
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:00:39.0808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fru7SCumM1W5axdVNuim0IeQRGCOQsyUKEHM2gCnIB3uH8AMD+0Nsm/9ciwTqp454UfLXxl6sutSGnJesAe/8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649

Hi Laurent, Hi Bryan,

On 7/15/2025 2:13 PM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, Jul 15, 2025 at 12:54:30PM +0100, Bryan O'Donoghue wrote:
>> On 14/07/2025 21:51, Pratap Nirujogi wrote:
>>
>>> +   ret = ov05c10_init_controls(ov05c10);
>>> +   if (ret) {
>>> +           dev_err(ov05c10->dev, "fail to init ov05c10 ctl %d\n", ret);
>>> +           goto err_pm;
>>> +   }
>>
>> I would expect to see an "identify_module()" function here, something
>> similar to ov02c10.
>>
>> ret = ov02c10_power_on(&client->dev);
>> if (ret) {
>>           dev_err_probe(&client->dev, ret, "failed to power on\n");
>>           return ret;
>> }
>>
>> ret = ov02c10_identify_module(ov02c10);
>> if (ret) {
>>          dev_err(&client->dev, "failed to find sensor: %d", ret);
>>           goto probe_error_power_off;
>> }
>>
>> ret = ov02c10_init_controls(ov02c10);
>> if (ret) {
>>          dev_err(&client->dev, "failed to init controls: %d", ret);
>>           goto probe_error_v4l2_ctrl_handler_free;
>> }
>>
>> Standard practice is to try to talk to the sensor in probe() and bug out
>> if you can't.
> 
> It's actually not that standard, and is a frowned upon behaviour when
> the sensor has a privacy LED GPIO connected to the power rail instead of
> a hardware streaming signal. It would cause the privacy GPIO to flash at
> boot time, which is considered a worrying behaviour for users. That's
> why a few sensor drivers make runtime identification optional. We should
> try to handle that in a standard way across all drivers, likely based on
> a device property..
> 
Shall I add chip_id as the device property variable in the x86/platform 
driver to address this comment? If this is okay, I will add a chip_id 
check reading the property variable in sensor probe(). Please share your 
thoughts.

Thanks,
Pratap


>> With your current logic, the first time you'd realise no sensor was
>> present or is in reset etc is the first time you try to stream I think..
>>
>> Definitely a good idea to probe for your sensor in probe failing the
>> probe if you can't find the hardware.
> 
> --
> Regards,
> 
> Laurent Pinchart


