Return-Path: <linux-media+bounces-33471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA578AC50F4
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 16:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E5421BA11AB
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923D4277815;
	Tue, 27 May 2025 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="eRQE5ceo"
X-Original-To: linux-media@vger.kernel.org
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazon11021134.outbound.protection.outlook.com [40.107.160.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DA715746F;
	Tue, 27 May 2025 14:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.160.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356398; cv=fail; b=mkiuckCmBQiqpVBa0dbvZj/rn7lUv8f3Dx/tAS1vD+TGSRw5UtwVE/wCr9PWvBGL1RkIBquEM4CbHGbLDmKxiBCR2OSJDY22Snur9OJNyAGEFJ5TTftxEVb3fIOq/zIxYcAJyBqRz1sPRVi3+Y8FkvAvn7VJgVSEh34Yrce2uno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356398; c=relaxed/simple;
	bh=ucUwK4rEk0oYEyui/mSutx+FXN8EabrmuN51kFpED0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GmJ5c3IrZznALljXApMfaHFVsu/YjV+RK/VdeEku5UnlvDwPrr2frvmOrl2FdcmcJRdwrhoXE1Ll916RF4GcZ4qx7HLieJmGedY1LaHgNzNVmxcjrrDTVqjdhAbcocxf8ygbsMJr5DPqkxdfx5m5qwES2Rww8QNos7iiOFCGgms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=eRQE5ceo; arc=fail smtp.client-ip=40.107.160.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbmVu5krHPSvSsr/MijOVafdW8hyDGl+gSi9XiRB+7yz2q3iiro8DkOm+1f7B0PLXdBU6YqFwZ2/IzB/HVI/1ydWriU3GUUz8oA/Bk9X30/kIRz38iXj2sBQ+X1e+oQGCfgGIelGLeqqoq3swEcKT+WAGJiaWFfhPUlAzylYSsTQo+C+8Ozh/L2IAHLUIUZWkD4OX0rx9PLln/IqDF2Cotkp+HrZkG/EP+qnbz/wwbZoON5uj3CDIOQLnR3KWcfoJ4bYOXju27tKTnsbNjWaT3RItjKJlDdPACIBQeJeoML1t9m4hlydnuTTvVAgJNy6g4ovtejqPmqItToCcRs9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucUwK4rEk0oYEyui/mSutx+FXN8EabrmuN51kFpED0Y=;
 b=otwTOsdcVaT+T6TObV1pFfIhnVvqKyzw6COe9KHogvDEjgz7ViFBMEAE/vOVqUJqSLISQsIdHqYghpL3HFDcyHqMwt27lVdb3btgnseQPbj3YXcwd7PTesxGnBCWAhLiXmGrbsKW+L46wmHi+WEZh87xMig3ArOAhjIAv+ey+rY/CnU/2TXJaSsn9/z6X7L0gujtho3t1kiA50B9UsFat7pqOY7u5r+1xuTCEpgoLpF2Ry0sjJpszmX2LwMtFyrHv+Zr7KCBgrHNItc9GmyTU3S7cZhj6uwglW4JsclVmtn28AArZfm8GN+0Qe7GluksrID+DFpVYfDqG0qTWRhXcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucUwK4rEk0oYEyui/mSutx+FXN8EabrmuN51kFpED0Y=;
 b=eRQE5ceoJnafQbIdDbBmAbRFFi90m7ONrugnlfLDkm3+2W1pnVtyvNu8Hd98bnDokUKLuClhvcBqo5RNPcA03ZKF0ilH+nZya3gUnK79TlvLqy5fAahzz9tN1Q1RcbvpMX4LWZyaaXR+O0Lf8AmA3XsGiY/UcLl0iXyUZmzZLbndTDSlFdt0jA5hcmsjWJ/SSPJjp1h9ifnEXrS92H7DWm9TQnLrDV6ZLG4sDsYNr9Fr5W586BLCXADuB772eEi88/fOKStKM2hUZINAD3RElZ+qGEdMS9tNbu+6jE2qRnEVCeG1GauCUvWnZpeS4I5YWEuyymwdsd00RIU5Wnecrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MR1P264MB3042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 14:33:10 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8769.019; Tue, 27 May 2025
 14:33:10 +0000
Date: Tue, 27 May 2025 14:33:09 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Tretter <m.tretter@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Michal Simek <michal.simek@amd.com>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Junhao Xie <bigfoot@classfun.cn>, 
	Rafa?? Mi??ecki <rafal@milecki.pl>, Kever Yang <kever.yang@rock-chips.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Gaosheng Cui <cuigaosheng1@huawei.com>, Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, 
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
Message-ID: <kqrngtgusod4cczeh33lz4seclgzn655ucnuhu76zh7ylrsybo@ndrecjbqvma4>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
 <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
 <3e6be40a-2644-416a-bd32-f6256f1501ff@kernel.org>
 <7863d15a-fa20-4db5-89b5-77a026d3f937@kernel.org>
 <a72z6exgol5cbur2cy7wjwyroi4zddtki5ab3zdkfuwpskpavr@r26wahldhd3r>
 <b5bb919e-6273-48ed-b5d8-29177dbbfb76@kernel.org>
 <flwocneutp64bxxwfkfqvm6dq7klc2nu33ybr3ap6qeovopfq7@7qognvdf4zew>
 <04e1f361-b3cf-4fdb-a008-42eb489f6c4d@kernel.org>
 <uys462vhrhzeapzkve7z5k3xg6bjvpdne4xw44voqn6uhjdkmc@owrdgvraiqyb>
 <30acbaadc08869687c22e6a70052571c99556979.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30acbaadc08869687c22e6a70052571c99556979.camel@ndufresne.ca>
X-ClientProxiedBy: PR0P264CA0282.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::30) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MR1P264MB3042:EE_
X-MS-Office365-Filtering-Correlation-Id: ba083bde-b756-46fa-f0a0-08dd9d2b67c2
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bndnbFJHUFhid1VtSm5udnIrVDBzK1NiRjRwanBHaSt5RVVOQ0g2Nzk5UVNm?=
 =?utf-8?B?b05xZkpuRDl2NjNVTjdQSm9OVHZ5V2lzTVNoajI2clo4MmFrSVZrMTZONi9F?=
 =?utf-8?B?NUxsbnh0RkZEZUhMYXpjYVZtdXdCTDdQZUFUYVhFSVVhOW1ZVUtYVCtFNnAx?=
 =?utf-8?B?eW05alJqQjlHSjg5a0xvRENyUlhMcHE0QWVncEIxeFlWbUdra2o1TCtQbDFL?=
 =?utf-8?B?WW1lQVhBYUNySlhVcG42WTIyUEpPQit0bXA4aUdFN3JCekJabzJsVUJtNGhr?=
 =?utf-8?B?MmVhMDlvUi9VL05WV0VvdDlqTHdlMC9oSWxobmsvRGZJeFBRdnJISld6TnlL?=
 =?utf-8?B?UHZMWnVCQi9EbUN6MGR1bDd2YzRKMGJpeE81YmxyOENrdWVtd2ZOOHJlWjBj?=
 =?utf-8?B?b052K1hnQUhaQzFIZjh1ZzZDSWRCVEFFN1JFYWpPK0VQSTFHeUYzejYrc3d1?=
 =?utf-8?B?QVFOd0FRYWMwTHdkSnpQYVBKM05BT0RCK2pwVkZLNmFZZG5GMGJEbG5SU1Rz?=
 =?utf-8?B?TUUzcGZXVzFIMXZxVzB4cENTN29tSDkyZ2RDbU1uOUd1UDNXM0dWRnhBUEc2?=
 =?utf-8?B?TGp6S0swY0h3NUxPaGVPS24zLzZyZVZpcEY5ODlGUEZoRm1TaGY4Tm5DKys4?=
 =?utf-8?B?anhmUDYwMkdVSnhpcnZKNktmcWxkbjVhZHhVTkFJaFlQNXROeXVXaW8vQWRX?=
 =?utf-8?B?RVRCeDFUQWcvQVk5R1Awd0hCRHprYTBvb2RIU0lLZ0xRMHl1OXJBV29BMElm?=
 =?utf-8?B?a081aERlSEFDb1VXeU1HdERFZzRLcmc5QXZadDNOa2RUNHFBdmFQZVNPSTBJ?=
 =?utf-8?B?RXZDUHRSVnRQZ0pPK0ZwYSt0TzlxdWhxV2FrdXdRM1Vkd09LMEhlelNGdWY2?=
 =?utf-8?B?VGlPVHhEY1FhZWR2dllTeHBRdFBvZHQyamRZZE1zYStVTWpoTTMxV0JaeEp5?=
 =?utf-8?B?b0ZDaSttWUh0Tzk1akpDUlNvUUtOa3ZXSDJ1aUNWWGhmdm9nUUNzT2hvV0Nn?=
 =?utf-8?B?WkhTcmhWY1J0R1A2Y09rOExIV0o4Sk0xYUZ4Q2RvU0wwN2NFVWMrZWUzbGtq?=
 =?utf-8?B?ZFp4TzNOUFJTZXoyTndnWVR3YWxjVENjcitLbDR3TURtQUVvcExaZk1UdUxm?=
 =?utf-8?B?Y1hHaHZhNzQvSkgvU3hxdGV6WW1YK1JYcWR5MUk3S3FsUVNlKzgyODhkejJN?=
 =?utf-8?B?TFdMYWFwRUVGc2RDdXI0VWRCS0t5dlV5bTBTVTdiRkllYW1Da0YwT25waVNm?=
 =?utf-8?B?a0lqeU5LRXdZckg3ZzNtRFlIcTdoRjMxNG5hL3pKRXB0UWNXWUxrMnJGZ0g4?=
 =?utf-8?B?VEt1NjRaV3dzY2NkUW43aGVPSG1aaTQ2VXY3S1lTZzlSWEtuMjBTVVhMQVpH?=
 =?utf-8?B?cGhjcS9SOU9KMXBleTNCQU45UWMwSjVXdFBaaE9lSmtOc3NDOERlQkQva2dO?=
 =?utf-8?B?Nzk0bndKOVVpaUIyS0FJMkYzM0FmWmlVWUlEU1dZMkR3UTFIOWxVN2kzVzZs?=
 =?utf-8?B?MGxKcVd2SnBHcDQ4VDdvdnhnV1N6WVNnOFlxaWhLL1E1ZGhpNmI4V1dWOFNC?=
 =?utf-8?B?R01vc0ZWeWdlWEE1dmJ4SHNIcWVoZnlVcGxDTjZLS3FLRURQbXZzdERkd2tl?=
 =?utf-8?B?YlZ1N2VWcE14aDhEbXJFNkxLQVYvUEx1Y01sak40anUwZ3JhN3VwQWZ4YjFL?=
 =?utf-8?B?OXp3NUlUc1FGcU04dDFvd001cXZFZ1JVOHNBOTZZM25jY054UHpkdFRJSnIy?=
 =?utf-8?B?c3VBLzVpcnNRUndQYUNwVzUrNE5GczJNbGVNQThTTGhxNm03UWp4em5XS2wz?=
 =?utf-8?B?cGJwejFMWjc3a25Rc1ZPK1BTbmpkNFR3ZGxwU3UxS1FaUmdodC96bVl3YTN1?=
 =?utf-8?B?S0xuNHVSb1VHSnIwaUtSY1F4cVZYdFFNWDZhMzJjbExtUTNQNzY0RXNaN3d0?=
 =?utf-8?Q?bZCUsqqAemg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q3NmazlmY05CbGhVOFluK3UwUU1OejZRWkJmdnlOcUFkaVlIRjBDTTNXcE5m?=
 =?utf-8?B?UUwwTmYyQWVvWVp5Q2tmaytwQmxEK3Z4MzRUMzJnanZGMjZMTURRbGd5YVow?=
 =?utf-8?B?bVlqUG11VlQyemxFZ1hLV1l5RGFUcDI1UnZWYnkzMm8wRnVEWm4vSkJWdEdp?=
 =?utf-8?B?UjV0eUlpZnJqNmtDTlZyZU8rMkJKcGYyTDhublM4eTZsZVlYaTUwZFlpSVA1?=
 =?utf-8?B?cm5IQWRKV0pRQUtlTDE3OVlBRzQweFNOTTNhWFgvaDAwT2ZBNjdIY0JCTXRt?=
 =?utf-8?B?c2llaDRNazdldFhBZkp6ci8vc1NaWWpFbllhMVMvd3FFTFRtSnNIVVFIalo3?=
 =?utf-8?B?ZnpSR09qdkIwQ3dPem5xcEVJVGhUSE1aOHF5bEpOMVNmV0dYVWQxeVpGUnFY?=
 =?utf-8?B?Tk90NitZQlpiTE02SzJweWcxUFNBeGl5OXZiRnV4ZVZHNEU2VUMvVmN1NmFD?=
 =?utf-8?B?UjBJUTFVUCs2bVQvaUJxa2tPWURWeHN1QkgrT2tUVm1FM3R6ZmRDVnl1aW5U?=
 =?utf-8?B?WnNVNFNFejJhSkJYQzIzcDh4T3I0elpYaG43V0U4RGFIa05uMnhzNW1ZOGVa?=
 =?utf-8?B?bWNIY1Q1NGJicy9SUnpXaWVhcXBqSTJCNjk3cy9OWWJ0NEkwbUJGd3B3eXlB?=
 =?utf-8?B?VVNuZFJ0NDR4NFRkcWlDSXhENHpTdHdXNlRqeHF0bHdLTU9hM0ZtQThMa3Nk?=
 =?utf-8?B?djBDeThzNGt4YXNFaFlZK2ZsY3ZkRXIyclhLWFRvYzE5SnFiMU5XVlJrL0JL?=
 =?utf-8?B?Q2hCK3BuaURkWW5uMm1XUWNJUFZGRk9FY3VhYSttcm4xY1hWd0hsZWZEOStx?=
 =?utf-8?B?cHl1Z2U4Nm1pWFRLLzF1UlRKRXBJbTNaMWs3OUUzbVFqUXhxcGJNWUJvYmdt?=
 =?utf-8?B?ek13eGRGTi9EbTZpMzdDakV4UDNFSk1ta0s4dTJMUFNrWTBqdE81N1ozSVpy?=
 =?utf-8?B?cVRTM2pnOFkwVE93V1pWR3BZR3FCdWxDeENUV3poSkxoVXZJZHRZOWZiTTlX?=
 =?utf-8?B?N2FkU25WWW8zTHZ4TlZzQXluSFp2QndaclUzb1JUTGR3UWRPL2hncDVrOWxs?=
 =?utf-8?B?UklzUHVZT0p5bFFDY05DSmx3dGU5Ui96K1poSmswNGpFVitubmNLQXpGUEty?=
 =?utf-8?B?OWtlVnV2czVnMDNZdTlRNGl1dUNabE5FWXExSlY5TEJaWmVzSjJEcHFLQW13?=
 =?utf-8?B?S2VZdHJ4SjhIM1EvQjc0N3Bsd2ZtSjBYbUlmSUxJalF4WDJRdXdpcDJXZ3JJ?=
 =?utf-8?B?OGNycFpHWjUzQWxFOG56TXdWSlRzRHZIdnNKcEdOemhSTlJVNlE4YWZrTHRu?=
 =?utf-8?B?eG5WSEdiUStMS2lhZTNrajN4NG5IMjhWSEZyQk1lSlpUZEZ4Y3JKbFVUdnI5?=
 =?utf-8?B?RE9TcHNpKy92cmVqVGNVeXdRVktRMlFNNjQ2R1B6dWxrWHNRcEU1K1FvTm00?=
 =?utf-8?B?ZUU0Rm1WY1JuSzAzbU5qVHh5SFlkemFKWWRQL0MzSEUrcnlYc3dJTUt4MTVE?=
 =?utf-8?B?VUNScW1mNWFyRTBuZFJqRlFBdXUxYjVDMXV2QTUxdmJRQmp6YU5xV1UrTVY5?=
 =?utf-8?B?eExScnB3M1AyakNLVFpoWDZaM2lBZ0VBNy9yT3BSWFE0L3hFYnhFTnkzaG5Q?=
 =?utf-8?B?S2lNaUN2bE1lZGdaOWVudmR4eUY5S3ZIdlFCSXZjcGw4V2ZhL0MrMVpnMEFr?=
 =?utf-8?B?REcxY0pxbDM3R3cvaTBzeE92dXNTV2RKZmRwREpnb3VaUjAvdWJaUUdmeUV5?=
 =?utf-8?B?Qkx4TlZFbWVZcEVoRndqZkEvNDVJMVNIL0RaNGhVV1JZT2cwd3lxTGUrYnNT?=
 =?utf-8?B?dmo2QVluaWJLb1FiN29qdnRLTE5vajlNY1hFU0I2a3krMDRkUGR4dGFxMjZG?=
 =?utf-8?B?bFZkUk82V0EraWNQUGJRMVdCYkUvUFhZUjNDaExUMng1YUJCMXlRNnFNTzQz?=
 =?utf-8?B?ekN0YU9xY0pabDNicVAyT3ZUUjZQZlpyeE9jWmFLcnM2MFNqL2ZqY0kxRzho?=
 =?utf-8?B?T0E4a0RIWEE1alhSNFhjZDgyZFdmMUZRdEw3V3JVSzVNRzFzR1BOSVk4aytn?=
 =?utf-8?B?TERRaHVZTUFka2RUbXY3MDdhNXlxbnRQOVQ5ZHg5dUlUcnJ4cGdaVVpBRjFV?=
 =?utf-8?B?cGR5QkpyOFNSVWpqTW44ZERGeVhlTmtCRWJHZDZnNXdVMW1LNGcyQ2dtMno5?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba083bde-b756-46fa-f0a0-08dd9d2b67c2
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:33:10.7933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bon5bLTi1R5+DMWHXmJxyZt8DJRslkyeC7RTBP6I4QFw1wbdS0PCkks6yAKA+oUpIwczidjdUOPcgzIAft/mfqNLQLip1t7EknkV5p1jqtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3042

On 27.05.2025 09:21, Nicolas Dufresne wrote:
>Hi Yassine,
>
>Le lundi 26 mai 2025 à 12:58 +0000, Yassine Ouaissa a écrit :
>> On 26.05.2025 14:46, Krzysztof Kozlowski wrote:
>> > On 26/05/2025 14:27, Yassine Ouaissa wrote:
>> > > On 26.05.2025 12:57, Krzysztof Kozlowski wrote:
>> > > > On 26/05/2025 09:25, Yassine Ouaissa wrote:
>> > > > > On 23.05.2025 19:13, Krzysztof Kozlowski wrote:
>> > > > > > On 23/05/2025 19:11, Krzysztof Kozlowski wrote:
>> > > > > > > On 23/05/2025 15:41, Yassine Ouaissa wrote:
>> > > > > > > > Add compatible for video decoder on allegrodvt Gen 3 IP.
>> > > > > > > >
>> > > > > > > > Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> > > > > > > Please do not send the same patches over and over again. You got review
>> > > > > > > which you need to address.
>> > > > > > >
>> > > > > > > Once address you send NEXT version with proper CHANGELOG for each patch
>> > > > > > > or top of cover letter. See submitting patches... or just use b4. This
>> > > > > > > should be actually requirement for this work.
>> > > > > > >
>> > > > > > > Anyway, I see all of previous review ignored so let's be explicit:
>> > > > > > >
>> > > > > > > NAK
>> > > > > > >
>> > > > > Hi Krzysztof,
>> > > > >
>> > > > > Make sure that i'm not ignoring anyone reviews, i sent a new set of
>> > > > > patches to start cleanly, and i have sent you an email about this.
>> > > >
>> > > > It is still v1 - the same? - while you already sent three patchsets before.
>> > >
>> > > As i mentioned, this patch is sent to start cleanly, so it still v1.
>> > > And the previous patchsets should be ignored.
>> > This is not how the process works and it is not making reviewers life
>> > easier. It makes it impossible for us to compare (try yourself with `b4
>> > diff`) and forces to re-review everything every time.
>>
>> I know that i made a mistake by not respecting the "submitting patches".
>> this is why, i prefer to start from a good base ( clean patches ).
>>  From this patchsets, You & I can use the b4 or other tools to get the diffs.
>
>For future submissions, once there is a base, don't try and "fix" things, just do
>add V2, V3 on future submissions, even if its completely rewritten. Just say so in
>your cover letter change log. If everyone was to reset to V1 all the time our work
>as reviewer and maintainers would be completely un-manageable. Please understand
>and take our explanations for the future. There is no need for you to argue on this,
>this is not just personal preference. Same driver, second submission mean v2. That is
>even true if you take over someone else series.

I'm aware of that, sins i started using the b4 tool.
Thanks.
>
>regards,
>Nicolas
>
>>

Best regards,
Yassine OUAISSA
>> >
>> > Best regards,
>> > Krzysztof
>>
>> Best regards,
>> Yassine OUAISSA

