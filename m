Return-Path: <linux-media+bounces-32266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2CFAB3181
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 10:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7285F7A05A3
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 08:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501DE2586F6;
	Mon, 12 May 2025 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="REXcRRVh"
X-Original-To: linux-media@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020088.outbound.protection.outlook.com [52.101.167.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BCA2571CC;
	Mon, 12 May 2025 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038204; cv=fail; b=fk5ijmM2AfoylFu2/zbUigVb+gOfgFXQOeonqhEQnNSHKQSnnbcPn2EutEJj1fW6zq7fD8bIf7ORUgDdxfKBB8bt0Wrnc/ZE6mGY1LP9iDo6wCm8ykUkOuMCePwO+efgXNT2mb0OnpPk+WnMn2WyHEUihEHKlH1wx0Y8h4cPnXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038204; c=relaxed/simple;
	bh=P5r7QMD0J4Evn+VSa+p3yuNzACF1aJ1RvldIZbednps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=suptis5Ih1NLgb5N00OejxaKPiENO3bB8W7aFllhRIAdcij3oPKoYY13Mge9TXsMtDjEWdfJvkxAmiWr6LrveWm65BzqCKSujlQaXXFJCu4bLxLy3IcpHx4pd/gGdbBt/0G56WJ4dwuX53tj+F70X24ArBLrycJpGdg7ZyDYs4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=REXcRRVh; arc=fail smtp.client-ip=52.101.167.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHprg2fC4OCkJzjhaDLVwJKOiQ523t48dGGBRZEvjfbZEy5VGiz+TqCSQfJ24nv0eK43cI7VkRsW973O1BGLeIBM0fh2p8UpI3x+t/law4w6mnUTfUT0/x4ibYrECJaC21ZbMldJFhDjiCHkABX0QEfczb1gJt25Y9v8VcEqwVb9AtnTThAKAwNViZiRITZU/rb3fft8njYRdxlQFt8aBOVzVEg1qCoHeMV00ue30xB1fYpMU6r2NY8bmKqIqZEzHbGCtH6cPhWLmjs+XEP/W/rBp88xVTHdoEtPC5Cu0ZYteivwyocDplcD8z0/Oc2MJiOi0bpehJQtzHx+xiv5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=louO3HeTn1w1tdHlsF7pK+pS5T5/CSyz/x+2GkuYLj8=;
 b=qOueJU7JssF7ufHUDcrWfjcq8hs8hpLVmARrCNnyXA/qHOY9SXwb5ntj5xEwPuUKXEmpxa/lUmJOojUOjlVmE+YSZ7mM6dh+P1lGKmn2npW1vjdA0AGKm4BbQDIsgaFPNcwSWS0uTqwXn/hcAfpzem912ST14IDEM0MNoZ2M39idiG4ygQk7gfJ2EpLjoK8zVFhuQS+Up4dd0i3MXrOpYLv0DucF2VuGxQnjxKkGAeumVmPmMq49k79CYMEqcbZ1cP95CI8qdBSX9WxJmPKPV0JtEo36cF0UoQIqZhnu6HtHtOvKdhK7UCgqT3DctVUIdGINiil1IOX5TPwtYmOrQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=louO3HeTn1w1tdHlsF7pK+pS5T5/CSyz/x+2GkuYLj8=;
 b=REXcRRVhZbtHp3TVPQDJnRZACd50N2louAcfeZ5gk/RfdfImoMouzgo6FI0/KyXRm8a5sN/U8O5OOsZl4s/yjCsbYglmCyiomIpogpIEu/cA5wD00MInto0Rto6ftwvdd8c4bC89ackt6soTj+51WrQNGYx26UssUtcg0TbMGVFM1fis1lI73ARi5CPFc5XK8tFE/URgoR40cUByDHXkhEjpK/DbFgdIYgZsVCp9qcfQcX9c1/LolIqzmacFYcueOB2XRvbWwkuMgmmlCAVLeM1NU3te7xLkCRcrDk5vPv/IPv8xxdGCNhMtRwG5EHpYaBXcssMvF+ktX5+GHcq9zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PR0P264MB2632.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 08:23:15 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:23:15 +0000
Date: Mon, 12 May 2025 08:23:11 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Rafa?? Mi??ecki <rafal@milecki.pl>, 
	Junhao Xie <bigfoot@classfun.cn>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Kever Yang <kever.yang@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] media: allegro-dvt: Add DT-bindings for the Gen 3 IP
Message-ID: <knnumpmyq4ewvqcfor3vqynxbplynajdlmz3p6f2ywadvmz6wo@5uz53eubbkfg>
References: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
 <20250511144752.504162-4-yassine.ouaissa@allegrodvt.com>
 <595adbaa-15b4-4917-b3ad-9bac3e2333e2@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <595adbaa-15b4-4917-b3ad-9bac3e2333e2@kernel.org>
X-ClientProxiedBy: PA7P264CA0375.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:399::22) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PR0P264MB2632:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f2f6b0-f4b9-4822-9ba6-08dd912e3e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTViMW1CVzRQakRTYjNidzhrTXUzWWR3cDdCbkRJbWxQendvWU12K0o3MEJL?=
 =?utf-8?B?aHhiQ0tTM09ITzB3dDZuTStwR2RJSmdIbnIxbTVCRVo4NnNxLzIzL3pKUVIv?=
 =?utf-8?B?SzVFalVIQ05WaHU2R0h4ZkVOZzNibmFTK2k1QkQ0azBTc2FlSmg1UHdCcm12?=
 =?utf-8?B?MjBxcHdTUmtYKy9mU3ZBa3BJTlRKQjBhdDZGMG1iOHFNR0lwQi96dEpKK3ZI?=
 =?utf-8?B?ZHJBbkRXMGJBd3FpNUQ1MnZ6MDVBOG9IeHk5akJrWVhxRFlhdWR1TTJOL1Ev?=
 =?utf-8?B?aHNLQS8xa0UvV0czTW5STW85cGFOMjI4QVpuM2txam1ySEpicldNQWoyM2RQ?=
 =?utf-8?B?ZnhBQWNUd1NkZFFXcWE2UVVOWlVYTWtMZHZIbWtsMHY1MWdBMEszcitBV0lw?=
 =?utf-8?B?RTdNYnNXS2I2U25XMkdlc0E4TjI5NUlpcTdWRjIvOVoxWVQrRzloWmdleEMv?=
 =?utf-8?B?V1l1MTllbkhBaENteGZOMXNNZGFrRUZRa2Y5bHlqQ2FId2xOQ1E1UGRqdUNF?=
 =?utf-8?B?amg2azlqNTdncEk5SVBHZVQ1Y1Bkb0lmRXBIOGVEMXVuUEJ2bU1QcTVwZkJW?=
 =?utf-8?B?LzZuL1luRjdaaVlwVTdZL1lucldwaVVHbWlZMDRhOFVjb1NibUNnZ3BhNSto?=
 =?utf-8?B?c002M0ZqRzNEYlJ0bHZXYjdqdFVmYkxQNDNINlNGUW5tVFRRZWRoR0RQL1Rk?=
 =?utf-8?B?TkhCa0cycGxhSGJUSWQwejhwVU9sbStsTnhsbEZxaWxodGcwSFd0S2RSUUhR?=
 =?utf-8?B?UUxRK0JEdTZobDFpeVJOb2Z2WDlTTFFkNmNkOGVXdHlNclZzY2V6ek8vYXdK?=
 =?utf-8?B?cFRVNkJXbTZwS1cwU1JaZUkrWk9TamI1dUZncGhrZTU4WjZzRTlxTkNQVGYx?=
 =?utf-8?B?Ylhnb01YVFhZU29mY0JRL3psNnZYTkpFNTlpNDErWUJiRStBMTYxdnNXUXZP?=
 =?utf-8?B?NWtRTHRtUm52MURON2Rld0dLTS90bmYyb0kxaDZ2dTV3Yzd1bnZtazZvT1lx?=
 =?utf-8?B?RFRsZWxqWVk0bmhCTzloVFRGdXRQNXowbWN6MzBqc0M5aFVRRk0zVXZBRG5X?=
 =?utf-8?B?M21SRXJNREl6Q3FYc3ZUMzRHbFY2d2dvL3ZFdnhzc3BhL3RwWHo0cFdMTyti?=
 =?utf-8?B?d0ZNYXFUN2VxeW9iTTVGRm45ckZFK0t3SnAyM1Z3K1ZyeVNmN0ExSTZiOXc4?=
 =?utf-8?B?RWdzV2pUSUNHVGRnc2pxcVI5QWxTRVJ3RUo0clhnMzF0Nm5CTEt1bDh4SG1Y?=
 =?utf-8?B?OU1ReWhUQUU0VWh5elFtcEZ0ZS9hOC82VFNjYzlheldrM3VwZmxBOCt4MEpC?=
 =?utf-8?B?OVV3bVpHQXZjczcrWEhwcTJQTlpER3N0S2IzcTZXOUpVZ2tnZVpLaTgreC91?=
 =?utf-8?B?anBMZVVlS1FDbzFUWmQzbmpJc0hKaVB0TmZYa3JYMU9nanh4M3huU3FSYW1S?=
 =?utf-8?B?QnRnK2srOG92bHcxQ2xPMFN2QlFPbHpYSXBsMUE2STRTUjJhQ2pPeDVBbEZX?=
 =?utf-8?B?UnhvZzIxTXpIeHE0VkZCdGRQRVg5V0k1c0RBTnNPbUtua05BZFZmRlpDZkVK?=
 =?utf-8?B?RHFWbjZUTWZoNzJxQkl1cm9QRGMxSURBYzJKYlQ5SEMzMzVER2xweS83UjFT?=
 =?utf-8?B?cGhwUTIwdVRSMXFrMlpZZU5BVnF3aVlham5EZTRCTGg3SmxLK2RlV1lGbTEz?=
 =?utf-8?B?SFZaNkhuVTlyRE1OTTh6bTM2WjZrU0Rjci9uME5kWklId3RBc2QrcGdGY3lx?=
 =?utf-8?B?VllFeW0wa2xkdnc4aXRzQ3JlNmlZMWFmdEVTeThhbWE4bTNoR1RubmVsMUYr?=
 =?utf-8?Q?iBQcQSvB4VOigLd9On0SGMDtA/qgYRH5oaBSo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmxNak1BN01Kb1JZVzNIT0dhU2VsMlZzSXFPTHI5dHBYUWw1dCtoeGtrZ2tu?=
 =?utf-8?B?RjRWSm1RTThhU3haZHlQYkM1QTdLcVlNZHdWb3ZWSGR0ZStDUFJqV1djNDcv?=
 =?utf-8?B?SUdXTjFVYU00UW9VY01UN1ZRb3JadEVLLzVZcUlvOU9SQm1UTUpsMGhiOG9S?=
 =?utf-8?B?bHdPTHU1RTZNMWJOejIxTjVVR2JCd3RDZW9lY2FFaDVIVHRRMjAvczFEZ09y?=
 =?utf-8?B?WUxBSjAyeEM4d0prbHFzbGhoSk5ySEtlOURkLy8xdEplM2kxNEtMRFZVNXN6?=
 =?utf-8?B?d0tsQU1FQXlrNHRmUjdGZ3NSYzVTVFdaM3J4bE9WUG1DS3lFZjZwUk0rNEVt?=
 =?utf-8?B?QU5xY3J0Z24vM0doNDVKNzI5bk40eGgrN08xMDN3SHpFVnNqdU5RK3cybVl5?=
 =?utf-8?B?MHRld1lZMUZrYUlZSlVuVjZockkvUEhwbldVQVVERXZOMFRYaE5qRytiNzRB?=
 =?utf-8?B?Zkp2a2JMZThnQncxK0pBTEROQ0RyWnZCZlhETDd6T29JRTAzQWtwa1B6b0ZX?=
 =?utf-8?B?WmJCaThTcXUzRVhtM3FiMCtlYmJVN2NiUW1rOGZuempoVTVGS2JwWHk0anAr?=
 =?utf-8?B?RXZsenoxZmxPc0psVzVQZzN2bEZpM3Y2d0ozcm9pVkl6ZUFPcWpmZHZpdHAz?=
 =?utf-8?B?cXFoYWxucmszcm1EekZETUpKWjZrTmIydUIxR3BReHBoSlA3QjBRVlFpSzBn?=
 =?utf-8?B?K0dYM0txN0gwRHhvYzBTdVpmcldvRGFjdEp6WTZLMzJrcEdlS0RSd0V3K2Fm?=
 =?utf-8?B?b05hRFVmT3dGaXUvdUNreEdTdVVaakk3WnpQKzNLS1NmOVRQbEhwdW5FZzBG?=
 =?utf-8?B?RnNKbnNkS1A4MTFmM3pGMVJnaWFxRGpjazB5OG9JQTU4NER6b2tDd0ZhTVc0?=
 =?utf-8?B?cjhFbGplRVdsdFk0b1ZBbVpvY1pSZ1JrN1dlOW9ZSmRPQUVybnMwclZWeVlE?=
 =?utf-8?B?UUVUVzBqa200WS82TkZNZ3VRdmprSjBKUFYwdmVycHpTZGI0L3I5L3M2cXRB?=
 =?utf-8?B?d2FNR204NlhPVjBZYlZZdzR4VFlUTElwMElHSDZGdWV3cUhHMVdHR1NDeXRY?=
 =?utf-8?B?V2JYWjkyQzlsVytaWlRXSGFOWExidmg2dHFmZFBXOHFFRm1ERDJlTjhoNW05?=
 =?utf-8?B?bERoOWpObzJhbFpjSlJwSVV0aFVSNkYvRVpQeGtSMDBWWVQzOEFYaVVrRDVi?=
 =?utf-8?B?NEFIeTNFNDFJN01sRFovbTVWSy9ENVUwdVdoWTkybkxkV1NYcVl0T21zemxl?=
 =?utf-8?B?ekRhQzROQlVVbEFMMG9rVGptTTR4Qkt5aE9JR2VYb25DbVI3UU1ab3EwcElz?=
 =?utf-8?B?aFhUV2REdzg3YXhJOXJVaTVYK2tBR2hzUUU5MmY4aktYa2dMZkVHZWVHTHkx?=
 =?utf-8?B?YWJ4SW9zVGIxaGFuNGY4d1IyWmNHUVMvM0NyYzNET0JmUThqV0NNc3J1Q0xV?=
 =?utf-8?B?cmY5T1ViSXFzcEYwQnQyYjJKeUhHM2NHVXU2UTJDWUV0WkZkOGFnSC81U0JH?=
 =?utf-8?B?ZkhScGtLL2wrNmMwWGtUL3NPMzdmdU5oU2hCYzBrUUY1RDQ3dm8yV2pkRE1t?=
 =?utf-8?B?U0xlZWdHbGZvdmNtdURPRVJEdFVSNEExWkdDdHNDSWRBY2pUMTVDV3J0NkFr?=
 =?utf-8?B?Uy84a3IyZFVRQ3puSmw4NmYzbHFnN1N5VmcwdjRWYzRpUFVjMVpmUWNnR3du?=
 =?utf-8?B?Q1FYODN5cER4N2ZDbXdNdTZTQndWb0NFMS9UZlhEaWNwU0JYeFphMDNYVEZQ?=
 =?utf-8?B?TUJNK05xY2t2SWRvTytVN29HVFZnM3hmYng3aGZTN0NkUG95TllNdE1uUm9Q?=
 =?utf-8?B?dklDN0VZZEs5RHA2MkxzQkxZTFRUYThBR2txbHdiS2hkand6STIyRGM0bUd3?=
 =?utf-8?B?TXdkTzRxZks0QlNRaDJIREIvMHAwL3Z4NDIvNlR1dTI2cVFiUzQwUzBrU3FF?=
 =?utf-8?B?Ym1Ld1ZqeEhPSUVkUVpDaWRJYmYxcFZIcWc0WG02Q1R6a1VYQXl6V1AwL1Rq?=
 =?utf-8?B?RUo1cE12bWpXRlNlcE95UFhNVUIwbzhsbXRMTUhpMmU3QUNZaVNKdVB0Vlls?=
 =?utf-8?B?SkhBVlorMVZ2aTdzRDVma1J1T0xDdXNyTVNNY3JxcnJib2lyVU5xd0JhaWJC?=
 =?utf-8?B?b21wYlVndFBKNVluL3BhS3VkY0FrTk14cUhXWnRkaDdBcmE5Um5UUEkvYzN5?=
 =?utf-8?B?MmtPcDdsM2lWTnBrcVFPSnIzeUxLcnRjY3Fla2tNYi9nakV5dHgvMXk2MGtS?=
 =?utf-8?Q?k028lm1NVn8SFHXsjOIgoo7livc+/NpeltGw1E2+BE=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f2f6b0-f4b9-4822-9ba6-08dd912e3e0a
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:23:15.3862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMac4J5AM1gQZOjHFNaq6W99AJ5aLYsZZ3tkV4wOd+1hWFvXA4BLZ9XquBuMs/VjOriksEoV7kD+cpU9T9grBeWjpLQzZXYv9Yg1jdlz/8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2632

On 11.05.2025 22:03, Krzysztof Kozlowski wrote:
>On 11/05/2025 16:47, Yassine Ouaissa wrote:
>> Add the device-tree bindings for the allegro-dvt Gen 3 IP decoders, and
>> update the MAINTAINERS file.
>>
>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> ---
>>  .../bindings/media/allegrodvt,al300-vdec.yaml | 86 +++++++++++++++++++

Hi Kozlowski,

Thanks for the review.
>
>Looks untested so limited review follows.
>
>A nit, subject: drop second/last, redundant "DT bindings". The
>"dt-bindings" prefix is already stating that these are DT bindings.
>See also:
>https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
I'll fix this issue in the next version.

>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 87 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
>>
>
>Please organize the patch documenting compatible (DT bindings) before
>their user.
>See also:
>https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46
>

I'll fix this issue in the next version.

>> diff --git a/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
>> new file mode 100644
>> index 000000000000..ea4a55de570c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
>> @@ -0,0 +1,86 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/allegrodvt,al300-vdec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Allegro DVT Video IP Decoder Gen 3
>> +
>> +maintainers:
>> +  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
>> +
>> +description: |-
>> +  The al300-vdec represents the latest generation of Allegro DVT IP decoding technology, offering
>
>Wrap at 80, see Linux coding style.
>
issue fixed also, thanks.
>> +  significant advancements over its predecessors. This new decoder features
>> +  enhanced processing capabilities with improved throughput and reduced latency.
>> +
>> +  Communication between the host driver software and the MCU is implemented through
>> +  a specialized mailbox interface mechanism. This mailbox system provides a
>> +  structured channel for exchanging commands, parameters, and status information
>> +  between the host CPU and the MCU controlling the codec engines.
>> +
>> +properties:
>> +  compatible:
>> +    const: allegrodvt,al300-vdec
>
>Undocumented prefix.
>
>What is the actual device name? al300? Can you have al300-adec? or
>al300-dec?
>
>

the device name is al300, the vdec is for decoder driver.

>> +
>> +  reg:
>> +    items:
>> +      - description: The registers
>> +      - description: the MCU APB register
>> +
>> +  reg-names:
>> +    items:
>> +      - const: regs
>> +      - const: apb
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: MCU clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: mcu_clk
>
>Drop clock-names, pretty obvious
>
the clock-name is a require item, it used by the driver.
>> +
>> +  memory-region:
>> +    items:
>> +      - description: Used to allocate memory for the MCU firmware,
>> +      and is also used for various operational buffers required by the MCU during codec operations.
>> +
>> +  firmware-name:
>> +    $ref: /schemas/types.yaml#/definitions/string
>
>Drop, type is already fixed.
>
>missing maxItems: 1
>

The next version will have the maxItem, and drop the ref type.

>> +    description:
>> +      If present, name of the file within the firmware search path containing
>> +      the MCU firmware.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: False
>> +
>> +examples:
>> +  - |
>> +    axi {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        ald300: ald300@a0120000 {
>
>Drop unused label.
>
>Node names should be generic. See also an explanation and list of
>examples (not exhaustive) in DT specification:
>https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
>
>> +            compatible = "allegrodvt,al300-vdec";
>> +            reg = <0 0xa0120000 0 0x80000>,
>
>Here 0 is not hex
>
>> +            <0x01 0x8000000 0x00 0x8000000>;
>
>but here is hex?
>
>Also misaligned.
>
>Also: very odd large address space.
>

Nice catch, the misaligned issue is fixed.
>>
>
>
>Best regards,
>Krzysztof

Best regards
Yassine OUAISSA

