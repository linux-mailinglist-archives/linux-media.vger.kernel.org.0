Return-Path: <linux-media+bounces-33347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FD8AC3A99
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 09:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C46A3B1D95
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 07:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6BA1DF73D;
	Mon, 26 May 2025 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="sMzQxe0L"
X-Original-To: linux-media@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020072.outbound.protection.outlook.com [52.101.167.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676621DEFDC;
	Mon, 26 May 2025 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748244367; cv=fail; b=kUSTGRz3PBmsis14/JAwfeN5KggQb5Fl33aN0HvScH+BsXga5zTZeUyi0zpQbSGDILTAp2A+pGD/8OAts4Lk289Dy8KgaMfmsS+TRHTR/J9ryPliUeCmnhjjXnZFK5spy53bTktOTGWXLQsQDQLIaIqAodzaDa74FRHeqwFUkZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748244367; c=relaxed/simple;
	bh=v+zFLG/CHSMHuRVDL9fxx40GG2pevNf1hb80RYdTp8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Pk6NlQCXLDpa1N8uUa9p1cLWcEU624Yz+5DSrsDKKBwfOXDC1jcqf8aPk6bTwuUjfe2vFIuq6fv6l3pUHEhX60Ouhra2nAQPw4xmlZz3GnLtJI2p6oSd3wHbnRaBmwx3iPqY3xTm5T+/n0khFpAzTgUIjoMlSOK7MEzEKj5p9BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=sMzQxe0L; arc=fail smtp.client-ip=52.101.167.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNDeabbm/uqareZxIWaPlGfGlkFRkTOCHaHNnHsqq+rCuX30k/dZa2lJXN5JGQwMpZDl+sa0mAxQXk+h+zBoN74RiTCrYZRedT+fuhY5JThzII646aehd798nYuDodcfTTXL/M2d+3WDP1mAS6va2h6Xdp9U//eJya4Njxj+LnfdHHxzIvLG0M6SfvKrFbJm0y0xow51ekSPEfQin9a9KRFSOCAZEmxnyI3WAqkpWbjW1uY9H6ywYVgHHV2+PkGEoiLNEn4aFmG5IIhKAYXC4LtXB2MGThGCxkknZcx3WlKnTu3/B1hKiBxatgu7D51Z9x89yX+cXh/n/OyCmhc5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+zFLG/CHSMHuRVDL9fxx40GG2pevNf1hb80RYdTp8g=;
 b=e4SbkUe1Bw/gsyb8dP/YcyD22hbuQro7k9E6NHQ//GwEzq702BUASRyfHJyhTXB4gna1xEpemBgUrCQ7ubkMtRAUkxaTaC4C8YqFAc91a8dC5WdHPK8dXTyfE26fHYVO2bKfYQFk2sh+zZuwzpM6JaruscR3S7kz6VaRD6DyTspdl4mnmWmEEivuvyYVHQvmTxUWD70xNx5fWKeQTUsNUK5MiQJq0qWJyFAqZR23ZGnY1mZTrrtXAeDFcA9IMyDyN93qDimpnqrT/vGZXNzUDlBpJvSSDKJw0IcFGggU+38LfNWnHq8HqECZeyvkzx4kZevWs6DUw5nSlTbwS5k9KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+zFLG/CHSMHuRVDL9fxx40GG2pevNf1hb80RYdTp8g=;
 b=sMzQxe0LBks1lYPP5mLjFQX4x90dUh+Pg0QADhCzg0Ik7oXhCeVGx3f2e2NtTuRqxq5Nf7J0ODTqAioHBr1+iQlgYZykjIt6yr67qIitY74By1q8uGlrr60Jrvzzm4vrJ07V/gdwoE6ssMSdVOAk/Xj/My+ZPzc4jpD+e/kITHyTPC2yAK+hmUhO+5Y4EQ2wSoFmuf0cOekxOYmozp52oHC2PQLT7rdfRFyanP1b8TfXB2ko7V8POYH5ew39LkJHGbp91j9vd2qkKKz2cFQ4FsRgxu0fxiZlxLXVqWWc1mgKlRpEVKDV9sCLH3er0UTZs6BvqO5S1z7OaeXVrWvItQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MRZP264MB2347.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 07:25:56 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 07:25:56 +0000
Date: Mon, 26 May 2025 07:25:55 +0000
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
Message-ID: <a72z6exgol5cbur2cy7wjwyroi4zddtki5ab3zdkfuwpskpavr@r26wahldhd3r>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
 <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
 <3e6be40a-2644-416a-bd32-f6256f1501ff@kernel.org>
 <7863d15a-fa20-4db5-89b5-77a026d3f937@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <7863d15a-fa20-4db5-89b5-77a026d3f937@kernel.org>
X-ClientProxiedBy: MR2P264CA0133.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::25) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MRZP264MB2347:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c174a8-a04e-43b4-47ca-08dd9c268e0f
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MTV2d3RRa0Q5TjlhOEdXK2xpOU9TU0QrdHNkUCtlRndHNnRaR1B1RjdzYS9q?=
 =?utf-8?B?ZEpnUENWZUxFNDhrZ3VGUzhreE1pS1FlVnNwNWhwbnVKUkZwM2Z0V3V1eUV6?=
 =?utf-8?B?bWorVFo2cFMyRU96MTNLbytNYUMxNnhiQVJLS2xkZks3bW4yby9IRmdsNmVL?=
 =?utf-8?B?OVFqMWdGaStCNUtsQ3Z5b2FHcng5WE54M09ab2ZsK3lIeXJYSlc2RGdCanBq?=
 =?utf-8?B?RHlnSmxxZEpzYmc4c3VZbGpOdm1zclhOSXNwdVhzbzhVSDkxNC9DTGJLTTJo?=
 =?utf-8?B?cEozZHRwR09GTFBOVVZBY0hDQkh4K1BjL2FLSzlHQlVPbGVhNjFhUFVDQ3FD?=
 =?utf-8?B?Vy9VZER5ZjhGWEErc0EreHN6WFZmeXdqa2YzMThjVWpZY3Y3bFJRbENib1hU?=
 =?utf-8?B?U20zMUQ3RmpFV0l1enV2cDRYKzBsRUJlMmd5NVJNWksvbXFCY3BjM3JFeVV5?=
 =?utf-8?B?QldMbGh4U3RWRkNudGxEcEJraEJnWm9hQk81VlQ1Sm5ydkVYdXBHVnhEclZ3?=
 =?utf-8?B?U29mektjTjYzbDRmb0dkVk16WUZLT2IzQzkxODFjZlVaeVc3Yld4cEZUa0hJ?=
 =?utf-8?B?UHl0aXNQSVlZS2ZrRzN0bjUzR250MS9Kc3dZQnd5MnJBaHIwemdQSUxDa085?=
 =?utf-8?B?Wkh5UXRWWFhrWk4zLzhkbmJlZEJ4SU56QTdvRGZyc1BxTUp3VmIydVd1ZTl2?=
 =?utf-8?B?RkpUWUZRam1rc3IrSUNqekJhTHNqVDl3Zm9EaTM4MzR2WHREYm9uQUd2UFNz?=
 =?utf-8?B?U2R6M1NnU3BpRm9tNjFyUi9DMjlqUU1RUnJuSE92alZtd1NFNTM4ZExRaTlH?=
 =?utf-8?B?VC93dk1CeTVCN3NQblc0Vml2SkYxWllLWWM2V0Fab3p5T0p6Y3RjUjdWenY0?=
 =?utf-8?B?a3JQcTEvbDdYNm9ZTnlGendlT1lUMWswd3pjZTRuellTcWlQWE5KdUV6cldC?=
 =?utf-8?B?aWVkMW9LSlUrWis3M2JZZmpqTVdCNk9xL0dzTDJNOVJSNmhlVTQ5cERZM01x?=
 =?utf-8?B?NmRiamFSWHlDbFl3VGVIcFNJMnFaYWdDYjRuRzhPbVE4NERGdElEdkljUjcr?=
 =?utf-8?B?OVNTMTR2SEdLbEwvNmpKMTBBaWxFOHQwbHBoSkdYanBZZUk0OVZ1QWozdnJl?=
 =?utf-8?B?U2NoVk1CcEVFSVlVV1Rpak42TUlIdlg1b0M4OTk1THVJYk14QVRIOUV0NWVD?=
 =?utf-8?B?THYzWUlhb3l4T0JYZzhFYUdJVDZEUmplSGZZZEp3VkRLNWNPay9RQU5GWVVu?=
 =?utf-8?B?d0d1QktLR0k4bkpvQ3p4aEl4ZDZJaXRJb210L0JqSW1IOG1HS01sRlU3RHMx?=
 =?utf-8?B?ZEZNV0pQQm85NmJCWUFZc21sK0sxNmpzNS9FdERsRGhQTE0xL0dBU0MzMXpS?=
 =?utf-8?B?SnVqOFl4UEFyeC9uZmwvSVZSYndLdWR4S1FXV2UzdmQrRHUxRXBwbkM0alls?=
 =?utf-8?B?N2NFaTBISDlNMitXN0QzTU9FWDltdHRBTVo3d3ZIZ0VjSi9ua2c5aktMbU5X?=
 =?utf-8?B?SGk1NU8zVEh3WmxuQllXNC94QzRlb2t4UFUvcnRidjgya1BjOWtIRVhpaXVv?=
 =?utf-8?B?cGFYMVMyR1FIamYyblRhUmNXS01qU0kwcjhPL1B4TmtYbUxmc0ZXVEs2QVh6?=
 =?utf-8?B?SEkvNXh3RldLbzl1OGFHWTJpYml5Z1ZrWWxlMmEvKzU0OXRPcms3blBHb3Zl?=
 =?utf-8?B?MXFNa1Z4VDV2S1dHLzBwRGZrVURIQldUdkEzb002TlB2TDZiK3hRdFBjM05G?=
 =?utf-8?B?NmJ0em5oa0RDQXZIUnN5ZGRObm9wNlpnQWRBZ1BaNkFScnRWeVpEeTNGZnBC?=
 =?utf-8?B?enpNTUxMdDBocEhlRDFQUytOMnNqdDF4cFZQMytocTVWQnlKUS9oYjRiSXdW?=
 =?utf-8?B?eTJBdFYwR3RtaU4xNk80ZUlyR3N6R0t2MUV3VGcxZk9tRjd0dDJaQTVoVDJ0?=
 =?utf-8?Q?TuwYTTLMgro=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UjNxMXhsbFgyOHpWY3ZJL2FGaFB1dnNIb3haZzBsakxlbXFQVWVvNGNpVEkr?=
 =?utf-8?B?enltb1JOSThya3NrNHhqR2N1bWxhZXdnODd5Tzg1bkRidWFIelh3Z3g3QzRo?=
 =?utf-8?B?bVRRbGJmTVZNb2FRY2lUWEdaK0k0cXluOTd0WHhHRkNudnZxaTJVY3pHUVVz?=
 =?utf-8?B?K20vanp6RnRZWGVNSEJkTVk5TGIwYWU3ZEF0cGlHTHpPNTVZcHRNVnJ1bmJi?=
 =?utf-8?B?d2VlWE5JaU9NTHVzNFhENmpsa2QvSFUwQ0Q4TEpROHVNQTY0WTJiSnZ4U1Nr?=
 =?utf-8?B?WGE0RHo0dWFIUExLajRpa2Y0bmsyZUFsWDlYV09pWFNWdFNmWmlReHJkZWRF?=
 =?utf-8?B?dlF4ZFU2L1NFZlRMcXYvV25MUndVZWlDZWg4aDliMkd3emVvWlo3QjlwNS9p?=
 =?utf-8?B?WXJGZDFQL0dHUHhqTlBNSnZPTkU3QzBVdm8yaTdjWG1uZ2RPNGdXMWZYYXRL?=
 =?utf-8?B?dkRiWjViMDJ4TWJ1djZxWXoydDBxemJLc2l1UTMwTzk2L1V3ak9kKzJBbDll?=
 =?utf-8?B?cWFWUWw3a0dvTUpldzlVWVJsTERTdmpmaFNXNVpacDZ3NHNKRlFjdys5T0M3?=
 =?utf-8?B?VURtK2VsaWlLdmR1K3pGb3BUaGJyU0h4dE1pWFBLWTNEVHNyR2ZvZzhqeUFN?=
 =?utf-8?B?Wkd0Y3VFVEp6cGxuSkRJcnhGdkU1U0VzTk05T0JUUWxXT1NKV2hBalArQ21E?=
 =?utf-8?B?UFlJRHdrLzFXQnRoZjhucXFoS2Y0eEQwQzQ0c2dld2xuNGNTMi8vKyt1KzBW?=
 =?utf-8?B?TVdVVEUvcmVnZk1pSEFKTkFvd1RpMUZ2MHpwNVd4RlJGM0huUmc3NDBIWU0r?=
 =?utf-8?B?MDNoZUNqM01LL0VxZnJpdGtBZ3RXVjZxTjlaTCt5TUFUVm14SlZ4RStyRk9q?=
 =?utf-8?B?M252MUhjSC9HdXBZVWVXWFFycWdaSW1CNkhYT2ZQZFNlZlBoZDQwbGtmeWxC?=
 =?utf-8?B?bHhidTRxWHE3UlA2VnNBVm1ldEZDYmV4T2c0VXJucCtsV29ocDV4Q0xqMlpZ?=
 =?utf-8?B?eUZBejdweVVQQytJZ3NLTmpRSHJ1VUt3OWRTVlgwY2JQNEppR29nRHZrWjdF?=
 =?utf-8?B?MGpNRXF0R3d2TUROVTNrZ2hCcHVyWUFnVGdMdTVjOGZTak1YVjlSMWNFZkVa?=
 =?utf-8?B?VlB4R3YwdnowZEo4N0NjV29nZ0hmbW44UVlBekpZamFkZWV5aWJENU9OZVNk?=
 =?utf-8?B?eTQrcWw4N3ljdnBJWUEwUWlrVjhwMElkMVFYTHlVM0ZJVW4zRm9CTDcxL0hV?=
 =?utf-8?B?M2hZQ0U4RVVGMkxQTk1yQWM3ek5CdEt2UXdvSExiZ21acitHOTk0aThhWnRI?=
 =?utf-8?B?aUZ3aDQ2M3RGeDVsN3ZuZUdzdTZCRktlRHYyTmdmdjd0VXBrTktnRUpKNUlE?=
 =?utf-8?B?RkpkTTRuSW4wSzljMFJldFV5NDdXeUxMOHA5VVNHTzF5N3dEalIwTTNSNFA0?=
 =?utf-8?B?dzg5QUJWVkRQdTUrRzdkbDRicTd6czNyNXNNOE5Xb2VVa2xEWWFubTh1OUEy?=
 =?utf-8?B?T3RLVUxQSFFGZ05icFg3bm5McUF3c081TCs2RkpLdzcwcWVESEVQYkFEdWd6?=
 =?utf-8?B?ZDd6bTM0S29rYjBUS1ByNXczWC92R1JZZ0hUNUw0U0l1TmtnczBTdjZhZk9C?=
 =?utf-8?B?WUNBWUord2xNcDNvTmpCZy9Xa2NXaXhucDgzU2szZFBoTGlHNmNEVEQvQWNu?=
 =?utf-8?B?b1gxcHloZnVlcGFjYmVoV1ZoN1B5UFVLY2Q2bUNhMzdibkkzYW15bHQxRXNO?=
 =?utf-8?B?NU5EYUFSUysvQVhka2VSYWtzWWdyNVlJWjdWTUhaSW9vWVZLNjdxRmNINWVW?=
 =?utf-8?B?YlJFWFlIZjVOa0RmQUlsZHZBbGZIMXZJQWVRWmNPdS81NW9LWi9oUFN6UFhS?=
 =?utf-8?B?Q0Z4R0s2TENNTm85RzJ1VzBSNldmUWdnQ3paMTBMRVU0RUJYOXgxenU0YUJN?=
 =?utf-8?B?WDZnc1gycTVYVStEcHhQc1o1cUxVVXBWbk02alV4WDZGZkdlVmNwV0piZ2d2?=
 =?utf-8?B?cVpKSHc5Q1NJbnlRdzFybW1BeXVGcklqcllhMU1XQnRaOGJnTHlYM3lheGg5?=
 =?utf-8?B?aER3ZCt6Z1BXMDJWL3Z0eWhVV21pZXZpWXdhU2NmT05wMWZ5ekJtWlhrRTBB?=
 =?utf-8?B?M3U1NCt0V2hKbk1oNkg3Q1hZdWE3Mlp1ditnbk01dlljQWprajVxYm04UEha?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c174a8-a04e-43b4-47ca-08dd9c268e0f
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 07:25:56.5195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ItyzeTOokA8Ola/PH9n7Z7SLqmHR7SKpklZ3oIvfCTg+2eSV+GlbxRKR/7+tjwtQ9d/MXxpXo55RrRsqtUoa2a6JkHunfqtijq6f+l83uU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2347

On 23.05.2025 19:13, Krzysztof Kozlowski wrote:
>On 23/05/2025 19:11, Krzysztof Kozlowski wrote:
>> On 23/05/2025 15:41, Yassine Ouaissa wrote:
>>> Add compatible for video decoder on allegrodvt Gen 3 IP.
>>>
>>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> Please do not send the same patches over and over again. You got review
>> which you need to address.
>>
>> Once address you send NEXT version with proper CHANGELOG for each patch
>> or top of cover letter. See submitting patches... or just use b4. This
>> should be actually requirement for this work.
>>
>> Anyway, I see all of previous review ignored so let's be explicit:
>>
>> NAK
>>
Hi Krzysztof,

Make sure that i'm not ignoring anyone reviews, i sent a new set of
patches to start cleanly, and i have sent you an email about this.

Also, for this patch (dt-bindings), i respected your previous reviews.

Best regards,
Yassine OUAISSA

>Now I noticed you actually sent the same second time ignoring review and
>I asked to stop and implement review, so this is the third time. This is
>very disappointing.
>
>Best regards,
>Krzysztof

