Return-Path: <linux-media+bounces-33384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB204AC3FFC
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 15:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 890F53A5111
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 12:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13D9204588;
	Mon, 26 May 2025 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="tSN0QeRg"
X-Original-To: linux-media@vger.kernel.org
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazon11022127.outbound.protection.outlook.com [40.107.161.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473C0202987;
	Mon, 26 May 2025 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.161.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748264339; cv=fail; b=Cqe6t/kQgHoDkLkSn7NfBeKf/GkTxVyQmt1m0vLaEN/BoqGaER8YWvp653tGS0DT7WekLqXIMxyWLZx89FYzOFYOuhdSvQFh0yUSJnmGfW2QCazAffZ4h3acRA7kAbFnYEKZiTmyYBvm4BZsOjPQ6ShoNESMp4Ryy/X/4jaJnhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748264339; c=relaxed/simple;
	bh=HjEYPCasp9by9v438UQyI9D8BUYiPSw3ndfUNB65cQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cGG1wf7puyErvuej2Wcaxlu99vkduo5mjnoJ/PSe+2JRdIFQkOFX+/yVpJZy3w2MjTXbkd6Yl0ybrS86Vy5hYuxsUM5MYYReWrGXTj7dtzScr8QhNtb0eay1Xma0je4k+jhgSOG7y450NN6/XnToQQ95k5/8p+EgXNGCz/NXaCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=tSN0QeRg; arc=fail smtp.client-ip=40.107.161.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wt9dUtfR1k6i2AUZegLTCwkHh1MBnqJIsY07dgkIzo4KBaMlwfeM2C2QCbpMm7pdzqsRWEyFpTOCZ85CDV0oSXy72JLm9H7Lsi6GQgsI17hY67KTUqXrcLxE1hlofDOXfZVcNar8Yy3bm++8HXYom136lrxdHtdnTw6J8Pczm0Nkk4SuFY7RUstUvMa+1Mu7bPqAoDZVsZebMVjXtHJITBb5ZpI7Y/v4x+XkcAYiPvkEnX3IokZnddjy1Lj66uZ0DduRgH14DABbXhllicD4nm872S+IdYlG02i/ZA28ckbDak0r4STfXGp/d5pvYZFbOoNmGNp9x3FqeBcvLKnk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjEYPCasp9by9v438UQyI9D8BUYiPSw3ndfUNB65cQw=;
 b=SFmwPdYAIRdCT1Qfa9i2TP7YdzVpx0BvnIqNaNHBXXvA7B/s8LLLSv96dmSXvHJ2KDoSIyp7Y1JfNJkw9uAfthRUrb4jLWMwC5Q9qBrv3+zg6jbdYiDCeOtJr1aYDgXvRfaQW932MJgWukovJAQWnk1X/Sic09zO8EcxWEOH+cR+GqQcX/4cffxGxv69b1GdGg9G5PmBfplDbAlP9VPr4RQPpnim8r12jvnA8KoqKeRO6D+L1xuj+WMuKS/z5QxLqcF6jV61BCtcI629ru11i3B7hSkEBf3VPvlQoDiMDVIHai0t1lV5T26irB5pZkfobsgEkW9/l7HA9NHiQRINVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjEYPCasp9by9v438UQyI9D8BUYiPSw3ndfUNB65cQw=;
 b=tSN0QeRg3ajkgSxt/Et2Xm3FfuBzDjL1LanZ1LICZeaDkuE6gDAKLVB1bpq+j7K2hP3PNww2vAjYSWQEcjx0b1h2Bk1RHuJfyqMhXuMxrZqkJB3zjfM0M3KrQ7E3EUozlTF99LXzAesRmN+GQ34GaHCsaFV+kysV/Vdmbf1j0W/V2UuFXy2CR10j0CXdt1zsQXurF/YGuUDkPfiAt1a/zQVW+gC+gJB2seuakEqMB9ywLCy069Nl+4tSucoazh/ajVpo61NEFQUOL4iVmamSKadf6PcvKjdRUOswTvIWXJRhS9yczbLDGAmMduBRAMReXIpPpb8QbjZS8XxLpMjcWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MR1P264MB2146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 12:58:53 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 12:58:53 +0000
Date: Mon, 26 May 2025 12:58:51 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Michal Simek <michal.simek@amd.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Junhao Xie <bigfoot@classfun.cn>, Rafa?? Mi??ecki <rafal@milecki.pl>, 
	Kever Yang <kever.yang@rock-chips.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
Message-ID: <uys462vhrhzeapzkve7z5k3xg6bjvpdne4xw44voqn6uhjdkmc@owrdgvraiqyb>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
 <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
 <3e6be40a-2644-416a-bd32-f6256f1501ff@kernel.org>
 <7863d15a-fa20-4db5-89b5-77a026d3f937@kernel.org>
 <a72z6exgol5cbur2cy7wjwyroi4zddtki5ab3zdkfuwpskpavr@r26wahldhd3r>
 <b5bb919e-6273-48ed-b5d8-29177dbbfb76@kernel.org>
 <flwocneutp64bxxwfkfqvm6dq7klc2nu33ybr3ap6qeovopfq7@7qognvdf4zew>
 <04e1f361-b3cf-4fdb-a008-42eb489f6c4d@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <04e1f361-b3cf-4fdb-a008-42eb489f6c4d@kernel.org>
X-ClientProxiedBy: MR1P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::13) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MR1P264MB2146:EE_
X-MS-Office365-Filtering-Correlation-Id: e9e9f578-ee4f-4168-492a-08dd9c5510fb
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|27256017;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cHRPYko1S3FOTnFaVDhUdi9CdnN4S3Mveno1ejFDRks2YzZpNTMvZE1wZDF5?=
 =?utf-8?B?ME5TVkRqYUVJeTFLVU9IbWZ2N25tVHliWDZBdVJkU2Jta1RXV1NySXRPQmZy?=
 =?utf-8?B?a1pmMmU5SElBVS93ajhVRUV0b1lWWXp4UFJpSlA3Z1IrOHBzQU9CenF2NkVS?=
 =?utf-8?B?d09sbWVjRngxMFJ3clR1K1ZBc01jWTlOdWJoRnJWREsyYlF5cy9NOTN0VEs4?=
 =?utf-8?B?OExNbDBCUUV0SFphU3BFTFlJOE40VGJOVmNzclZjVVRKN2d0NDNsbHdoTU81?=
 =?utf-8?B?OVRqUER3WnFlT2wzWGhQR05NOGxtRXBWMjVEWjBEWTRVVWFiU3F6YzB4TU5v?=
 =?utf-8?B?Sjd3VWtuMFlpNk9iNGtKQTQySmIxNElFdnQzdU96ank5cXlOZG1ESTdUOERj?=
 =?utf-8?B?MlBZNG1mMHZRNnlKbUFSTGNoU3hDWTh0S0M4MDRkcHRSaEJrRTc0NlRMQTR0?=
 =?utf-8?B?elU5T0E1WS95T2lNQ2ZvdWRBMFBTZmtHWTM2ckNmR0NYRG5BYVFVR2FJYjFk?=
 =?utf-8?B?VWVNNENXZmZ0OGlZZGF6OXhhRVRDYjhHTFVrTlR1OGsrQktjVmJoM0FUSVJV?=
 =?utf-8?B?VUtUMVFVR1g0SmEvbjB3T2RDdml1c3Eydnp3Wnp0SGV4eFJFWUc0T092Qk1i?=
 =?utf-8?B?RkJxVzNWY3hKYmMyT3UxaC9HbFNLZm9RcEdsbDE4UFdIQ2h5amE1NWVpVlJv?=
 =?utf-8?B?TEc0S2hRbkdLQmE2RVBwMEtmdWcxcVlHNWxuSXFLTEFkZnZ3Vi9wRmRZN0xC?=
 =?utf-8?B?dkVMdlFuRFhCNWg3V3hrOE4rVXhtcy9yd25QUTR1cGwrSEhwU3lBd0kvcGI4?=
 =?utf-8?B?eGZ6TlRWZjk1Tko5blI3eG9QVGQwbmNXMzhGclErd0hGTWtIQmp0cU1XeVVk?=
 =?utf-8?B?VlZLdG1uRWJ2MkFQeVFrMmlRcEIwaFVPUDhMTnV6Vlh3V1Jrdk5TT1NsZnZ5?=
 =?utf-8?B?WU1ZS3JFblozeGpGRHpoaGJSU2dvdEcwSWZmWjMvdmpoUHpyQTUxRTNVUzZ4?=
 =?utf-8?B?Q3ZReWNkQkJlWDN1aE8wRStma3h3b1MzMy9zQ2c4R2o4cDhBb2srVG5halcr?=
 =?utf-8?B?V29DeWpEVXRodjdtdHptT1NBYmZrMXpuK3NFeFNnVHhXOTZWcTJrT0Rrdmxh?=
 =?utf-8?B?UWk2WlJtYnB1cGwyTzdMbENpSHhBYlVQeU1IcVVoZ2MxUnczNW5JSkEvdzlC?=
 =?utf-8?B?SHNJRnRnOHB5YXM1dG40TFhaenorYXJsNDdMTkdTbU51aVpFY3VHa1VrV2x5?=
 =?utf-8?B?TzlaT1VnNUZTcDBuTUs5Q1BBNFpaVzFrbmtjdUw2WFBNc1g3R0xjU2tQZ3Ra?=
 =?utf-8?B?ZmVFUUJaRlV5NkcrOVIwdURncElOMmlkOUhwVUcrajQvdEEyam1LcURGU1NO?=
 =?utf-8?B?a1JJU2wzSC96UmJJUWFjaGc1VzJpVWZuWHF3VUhKMXhXT3dpdS9OUEF1WjJ2?=
 =?utf-8?B?TWRzS0FjM2d2ZzlYU2lzOUZaTUQzeHdUOVhnbHBad0R3Ui9wQWd5dnBUSDhN?=
 =?utf-8?B?eU5oQVRkanFtcFU0bU5OL3pIbzNIYzVmNzkzalZrSklQRSttK0drM0YxNDAy?=
 =?utf-8?B?WU0zWHNLRktBT1dBdnJKQXY4OHVHWHZ4NnpQOVQzTTNqOHVDNWU5RDJLK3JO?=
 =?utf-8?B?WVBxMDJqZ2VxZUtEWkZIOXlLVC9PaTFZczIrbHJNZktkcTNRbVpsOUZwUTFO?=
 =?utf-8?B?cjJ4TWJtc2hVUE1Ndzl6bDJaVXZ6aElXc05lcUJlWk1Jajk0SlowdjJZZjhJ?=
 =?utf-8?B?SnUxemlFbUJuOHJMNHdjelljTnpPS1o4RVE3UWtVU2JGcXQ3bjU2Vm9UZDd0?=
 =?utf-8?B?dGtQOUh1dVEwLzdBSjBza2RFMXd1b0VyRHBUdkM2Z2k1TjlWTHNwdVQ0U09X?=
 =?utf-8?B?eXlmcG1SOG4vL1BON0MvNmRXZ0JhaUZSczRKcFk5UFlVdk5aZEdPcXlCRy8x?=
 =?utf-8?B?RTV3TGxVZHBKYnIrQWN2aVlwZUFBZ3Z0WWpNWDloYnBWSTNrVGRPN2Y2YUd3?=
 =?utf-8?B?SWU3TVQ5ZWdRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?enhvaTd3eUhUeGJsNzhXWE1SOUZ3YnlsampWL1prd2NHMGQ1NDhiNURyZzlh?=
 =?utf-8?B?MmpnNFJuR2h2R01QSHFLNTRqZHV6MGQ5bzV1cVZJTEFiMUlWRWZ6NTdnNkNX?=
 =?utf-8?B?eThaMUFkNWxXZzkwVUpXVGc2VXcxVE5DSnlObFEwdzJMenVETGs5ckcwSkUw?=
 =?utf-8?B?QUpGeDNtSnlaR3Zwcm9Zdm5EazVsemlURUpVMkh2d1VOTmh3RXVBTFc0VWdX?=
 =?utf-8?B?dUQzNlVEQmNjMWNkamptdFJkNjJtM2dwYzZDSGRoSDBzdnRHSmF3SU92eWFN?=
 =?utf-8?B?ek81M3NWRVJmU0ZoOGpxeEVWbk13ajJnMFJBODUxcHBvdHJBM3poQ0IyeUc4?=
 =?utf-8?B?RmwwYUk0WEtMK0Nkdm1uekFJWjJ1Z1NEK1JlYXU3b1RxZWVDQzc2Wi9sSlFu?=
 =?utf-8?B?TmJFMlNLTzM0YVhOMGFER1QweDB0aHgwN3FNbmhSLzJhK2NsQlBqSnk0c3Vo?=
 =?utf-8?B?NHNCa3l3eXN3ZnZiekhFak1HQkZROXFSdkFDQUZBN1kwZkpRTWpNOXN6dlJQ?=
 =?utf-8?B?Y3BPbXR5YkFuaGd3bnFhczBmSjFXZ2xCS3Nva1d0c0xSQ3A0K3FteWlaV3Bh?=
 =?utf-8?B?ZUVXcm5CSVp6bkJqdGdpQ2FKMkFSUFc0Yk82NURqMzU2OEpYZCtDVG5XanpB?=
 =?utf-8?B?bmZJZzROTHMxWFVxWithUUJDR09GcDdHTWxGNjBaNUZTb2dZUEVoL1hXbTN5?=
 =?utf-8?B?bVdQUWhmK05OZWk3M0h6RFZ4VWNoM1NXZXhxSm8xOVNxOURuMHVMeTAvNm83?=
 =?utf-8?B?eXlVcU5abmJZZW1mYzVwNmxsODZlV1BlSFdZNkRIeDdWR1pEUHVBbGRZeXdr?=
 =?utf-8?B?Z2JGL1JDM3Irend4Q3VLVzVkc3B2aDIwNkJaT1VnbXN5c29tZXp4WWlaQjdV?=
 =?utf-8?B?MTRwMVlqQWl3VU9idkovZExFYkdhbGRIQ0kvUnRxbFJvWVoxTkJmMUpQTkR1?=
 =?utf-8?B?YnZybWc2SllrRzNpK281Y2lzRVRwOWtDcUt3SUlvczBDVi9UQjBwbE1RUk5t?=
 =?utf-8?B?VGNlRlpzR25IZGc4cGFnVVcxbEZkVGJJYTFnVFNwSUQ2RmkwMDQ2SWNPTXB2?=
 =?utf-8?B?REVoOXJxc2FLY2xrY2NVY1gzMWFSTEZxZlpaK0pLUHVoMjVBeDd4RmJabzUv?=
 =?utf-8?B?aWhPamx6bGx3Y3dVQzlVTy94UmIycklPeGxQc2lxaG9xbEJVYWtlcEp3ekJq?=
 =?utf-8?B?K2tMWlBVYktNcVF3SElDT3U4NFdJd0VqSGFEQ2xkc0pHZHM4ODg3TGxvSnhN?=
 =?utf-8?B?U29JTkorbDlib2xpS3p2M3Q4bkJqRC9kWHVzT2ZYVzY3YjcvR0pVWjRYSVBa?=
 =?utf-8?B?K3hlQlhHZEJ6VVVwWFhXT2M5cEczejM5Ym5oRFExdUdDRlFnc2dKUE8vRXpI?=
 =?utf-8?B?dEhQOXpWenZ3M1I4MnpDdFdNcHNXaVVNOElZZ0ZiNnJob2E1cUxPRGUwZE1m?=
 =?utf-8?B?Y0pWUlNtUWdVZEcySjRzMzNzbWU1Y21NejJSZVhoRGRtUXozR0grSkRQUzMr?=
 =?utf-8?B?WUo2c2NpeU5IMnpmK3RqV3VnT1haLzFEMnY4Skd2eVVNQlVGT3RKdEVFWW1E?=
 =?utf-8?B?U09xVXg4Z1JZcnVYL25OTlZ4cXNKKzJZSitNdG83ZU5KZERNUGNnNmQrVFZj?=
 =?utf-8?B?TXN1OVg1Z3FOSUFrQkFlSzU1RzNyMzNZWllaS1duc2UwR0hjNkZWeFBNd1Bo?=
 =?utf-8?B?amtDcU4zcldhdkxpVE5xTEx6T3dKcjM5c1RCTHBJUUQ4dENrd0RVVmc5MlRG?=
 =?utf-8?B?eEpNQkliWXI2emRyWlpUQW5laTViZ3g4NCtSUmNOaGNnZU0weWZBQmxjaG1E?=
 =?utf-8?B?RW1CaUtNdXc0MFZxKy96NGVOZEJkZGs4MlF0VnV5aHlzME9sVjNTcmRudzNO?=
 =?utf-8?B?RCszNjVtbFFpUmN6Q3UwWlIzaEZyNVVZVmNHVmlnN2tYelgwSUgydkNpTXlB?=
 =?utf-8?B?YVJTNTRJY0NxbWgxS2tOM2MrTnExcFhGeFFCSTM2TUo2dXA5TFZPK0VXWkJz?=
 =?utf-8?B?OWlibWZrUVB1S1F5ZFlTOVgzczgwaXdISWxYTmpEZTlhMUtVYi9ZZGt4aXp2?=
 =?utf-8?B?TEQvRlpVdUVpN2xjMGZCQUFTaWM1QXZTbXdDdmg3NXVUKzVwOVNpQ2JvRHpX?=
 =?utf-8?B?VnNxcmgrNit5VjZObzhLVnRRTU1uK0g5bUE4Z3Yvak4xM2hiNlVqWFJwZDdK?=
 =?utf-8?B?S0E9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e9f578-ee4f-4168-492a-08dd9c5510fb
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:58:52.9308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2e0mCI0DwxLE0dlDGLzHM+BAoJe2SUWr5Q6nYP+gcWT0HAe/KQWxETTr7Onv9MqbVSg4vMAQwABRyl9zocd+GrwuYK2v8YvVpoWXVkOcX7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2146

On 26.05.2025 14:46, Krzysztof Kozlowski wrote:
>On 26/05/2025 14:27, Yassine Ouaissa wrote:
>> On 26.05.2025 12:57, Krzysztof Kozlowski wrote:
>>> On 26/05/2025 09:25, Yassine Ouaissa wrote:
>>>> On 23.05.2025 19:13, Krzysztof Kozlowski wrote:
>>>>> On 23/05/2025 19:11, Krzysztof Kozlowski wrote:
>>>>>> On 23/05/2025 15:41, Yassine Ouaissa wrote:
>>>>>>> Add compatible for video decoder on allegrodvt Gen 3 IP.
>>>>>>>
>>>>>>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>>>>>> Please do not send the same patches over and over again. You got review
>>>>>> which you need to address.
>>>>>>
>>>>>> Once address you send NEXT version with proper CHANGELOG for each patch
>>>>>> or top of cover letter. See submitting patches... or just use b4. This
>>>>>> should be actually requirement for this work.
>>>>>>
>>>>>> Anyway, I see all of previous review ignored so let's be explicit:
>>>>>>
>>>>>> NAK
>>>>>>
>>>> Hi Krzysztof,
>>>>
>>>> Make sure that i'm not ignoring anyone reviews, i sent a new set of
>>>> patches to start cleanly, and i have sent you an email about this.
>>>
>>> It is still v1 - the same? - while you already sent three patchsets before.
>>
>> As i mentioned, this patch is sent to start cleanly, so it still v1.
>> And the previous patchsets should be ignored.
>This is not how the process works and it is not making reviewers life
>easier. It makes it impossible for us to compare (try yourself with `b4
>diff`) and forces to re-review everything every time.

I know that i made a mistake by not respecting the "submitting patches".
this is why, i prefer to start from a good base ( clean patches ).
 From this patchsets, You & I can use the b4 or other tools to get the diffs.

>
>Best regards,
>Krzysztof

Best regards,
Yassine OUAISSA

