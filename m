Return-Path: <linux-media+bounces-23524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 727D39F40F6
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 03:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35C597A2A0F
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 02:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42C4148310;
	Tue, 17 Dec 2024 02:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="NTaAtoSt"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1122.securemx.jp [210.130.202.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8135C13D891;
	Tue, 17 Dec 2024 02:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734403413; cv=fail; b=P7WeVke3l+1xt6BMae/gq3dpuYoOr7hQTYnwWw+XV+QL1VRdO22O7VaSyE6wxJqUI9f9chvFjlDTke4KaC6a3XALmIhPiYayTI8Jiw4iXYqCFkaxUpkpLLMdclsORz+anbr14uKq+4HGFg3NWFqwBrDpFjuGiOhpuV4jJZweeNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734403413; c=relaxed/simple;
	bh=pXYjZxARM1NE8xbZVFM9glYZ43cRxA2N2z+6vj3wiSc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EaMlaCSOdh6ypsKRCL8A/GsXfjIrLhPzd0bKhkHsyy+k36VRJYu8qWSP/TIqq64WWB5cqruEB1yHRpgYomK0QTI8m4XumSkOX/DdEg4svZa1YEM8REoYXFGeEtONtxaVrfFYi4elH2kWBxjYaZ9E45tpdypQZUgLZ8xuwhi4aRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=NTaAtoSt; arc=fail smtp.client-ip=210.130.202.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1122) id 4BH062Ft1469513; Tue, 17 Dec 2024 09:06:02 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1734393929;x=1735603529;bh=pXYjZxARM1NE8xbZVFM9glYZ43cRxA2N2z+6vj3
	wiSc=;b=NTaAtoStCyC/ehd4oM1e3S0nIac4L/lp5mjxp5tyTLJ8zTMqZQJIpXzzw/KT1s5FliHIq
	7rNhmw55AU4/9DUPHbiovgecegVHcGkAfr+sQKXoPVOx7S8BUEcLAyDsWIzxBWV5i92o1v7Vh6yFg
	SpXf6YHpTWnRHIURaaP7IPjIFHZaMS3MWFy7BgWx5b6M0557ttax5ssUc2eKupV+efB0RGBHnd//2
	IOig4e8o65iHQPsttjzToyQZ23IKjwtONnX/IWEGesUfpFOCbcnbPZAM7nbCTCWuaAb6wQJ8aLwrI
	q6s/23/Br3AqOF1oEPWCj+fRw/w2mPEFUF9c8+yEJw==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 4BH05RGA890255; Tue, 17 Dec 2024 09:05:27 +0900
X-Iguazu-Qid: 2rWhyCKR3Dz0XjJqly
X-Iguazu-QSIG: v=2; s=0; t=1734393926; q=2rWhyCKR3Dz0XjJqly; m=R1Pd0QwTbHLG6PlTWc5/iEBlNVk4OVOJXY31j2h3e/A=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1122) id 4BH05OmR1328408
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:05:25 +0900
X-SA-MID: 34202022
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loshVIzR4KYNWaseuC21AWLbqCH2aoHS4MQUzPPjSVAZvwZwPzXAksQC4acNED3FI1RX/KOYxE4GAhukJoMnlBfXTw1UfxGtGZQqv0dzyYiow/hq+hOQXKN+Otl9O5qboXy8qlQNiVy1+fcqiLW1s5P31UPV5Oo/cHcrx4Y8o+7Oz7N9zl28BjxLlkdGJpnOTTnwpCtZz5gBziSyC+Dnv1te3KGB2VRLaaT+/h+lDcd2VoGxoOS/G0pR8FVQ453UkbsH8aupep0SGkyT0B4Vq64iZbe/vzCr4eHn2eqFnA4pPRnK9q9G0w4K7Y6wFH1QRaL6oPCZ3xW1F75HdBGPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXYjZxARM1NE8xbZVFM9glYZ43cRxA2N2z+6vj3wiSc=;
 b=mQQASLVwWwsEpR5rbTZVV4B6ynBdhq7DWGPBF1FDXhsWhgg8Z1mgyxdImdS4Z9ffyfCC9cQwK3lJ2xsPYnKejA6Pw6LSaNYOpPMJxfWlGIWLRsPngkqgO+j5xDyB2CEj+lTa6aFhyhjSmMCqIl/xsD5L0svrc3CDQcAAzpvLOrkYL4jhEWhcgLuNBE7RkEATS9dKYl5FvMCemG0bO6NE21INxyefUV7naZRUb8zna+3PwkRq//tYcSSA6fLw3q6zmu5xOGTQ07Q8FVQBIQa7gLWxDRet/UD/XSelgZAWYm7lww99ZV4qydvzkSmR16rDZOw8pwSDepdUCU4TufsYrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <krzk@kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: RE: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Thread-Topic: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Thread-Index: AQHbPxt/idUf3Bq9z0S8YY+kie6O9bLHxYCAgCHo9VA=
Date: Tue, 17 Dec 2024 00:00:16 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY3PR01MB99822E6161ED319B4DE855B492042@TY3PR01MB9982.jpnprd01.prod.outlook.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
 <04a7ebf7-2924-4894-bc53-ba77e2f64fae@kernel.org>
In-Reply-To: <04a7ebf7-2924-4894-bc53-ba77e2f64fae@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB9982:EE_|TYWPR01MB8675:EE_
x-ms-office365-filtering-correlation-id: 76e7fda6-1dd7-4cff-229e-08dd1e2dc9d4
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WWtHOVdRVDFCdVlyMFh3WEdWbzBYY01OZVlveVkxdHRPRC9iY3JDbm1qS2dT?=
 =?utf-8?B?Mmg2UWI3dWpNc2FWZTNGd01QMnhybnEzbGlvNWF5OHVEbHVjZmQ3ZzNUWTR1?=
 =?utf-8?B?RG5Jc1c1VGwxVDNKYlZUTXB3SUZOREZ0MDhhakhEK1hoaGcvRVliYTJWUWVl?=
 =?utf-8?B?TVJJV3g0TEtLajFITy9mQmd1K2NHTi9GWFNpOFJiM3dXK0NsbDZTK2dIdnZW?=
 =?utf-8?B?WGh5Qy9rRFEycE5NTW5BdzFIT0xUTGZURUlBNVVoQlg4OHNPbjljZ3FRY29J?=
 =?utf-8?B?SlZ1NkVrM1Q3SHlOVjVlb2dyS3VBcmN4Zk1oYXp1SlN0Qnd4bHMrRW9ERXlD?=
 =?utf-8?B?M1RRbnFOdXN0YjQwWEhXMXIxRkxPN0ZCZlJ4V1I4ME9lc3doKzk4OVVVMTdB?=
 =?utf-8?B?TzdzektYSzUyZFRXTGwydWpKTzIzNHc3R0YvSEJYMlN1Tk9GY0lpczZYcEFI?=
 =?utf-8?B?aTQxekVPNDlrRW41eHBBNjJOQ2NOLzh6ck1UczBtZzZ0K2xveEpnTTY0Rnl6?=
 =?utf-8?B?WlhpNVcrQktJa0JpTGxnNk1YMzlLdkx3M3lEdm9DSUd3SWEweHJERzdzMVRp?=
 =?utf-8?B?eFVvaTdOakdxSWFKdytqSkEvWWxzbzAxTmNVVnloODQ5M0U2bnhpU0dtVi85?=
 =?utf-8?B?bCs5a2JITnBmV0MvUDNxbEJZd1BzaHhRemFmYU9hOFFtQURpZ2lzYVVobHJy?=
 =?utf-8?B?ZVFUcnZFRGdORzVUVEFpWk9EaDllZ3FuUE9IQWJ5QlAxblh0Y0g1Q24rRWk3?=
 =?utf-8?B?N1VCN3lqZkk3M1daL0h4MkEzZHA5UWdhc1F3dGxhbW4wQjZPeFNmWlU1TjJk?=
 =?utf-8?B?a3dYRE1vVkVCYzdlcHUreC90cmp4NW5ZY3htZGpPaUtqU1pPRFora1JNK0Na?=
 =?utf-8?B?VjlBOFBXVjgrRUYwVnZIY2ZUR280OVRhVlU0bDZwbnNOeWpEZW9xb2xmSEZw?=
 =?utf-8?B?VmV5dXJ5MElOVmpvL0Z4cjFyaFB3dXM4dExnYW1Xc1VOS0RCM1dFbTZtVjRs?=
 =?utf-8?B?c2VwTzRSaldDSEFBREZFZ09nU2JPTk1GV2FUZFNWS2kwU1dENE1WMnl3UkQ1?=
 =?utf-8?B?NU52aWRRV24zdm9yMDlQaGo4MWppUGIyQzZ1aWh4dE5SYkpNKzQ4My9OVldG?=
 =?utf-8?B?ZUwzZHpTSGJiV1JpcVZheTRqN0RTTjdoVnQ0aHJRWE9qdGpQY0VQQmpNc2JO?=
 =?utf-8?B?S2xNLzdLK3l6NmJsU05kWFgxNDlLM1lNVzJpNXNoRFN2TWk4Yzh0ZFFmS2pW?=
 =?utf-8?B?aXNXMDlETEFjeTM1a0dRdFArQmhNdThlcHp1UE14czdzQ1d5aEk4dm9na0ox?=
 =?utf-8?B?TCtKRlRYejlmNzlGMDluY0hMb2pjem9iaTNQVDhDdStrWGozTGJGS0dYU05F?=
 =?utf-8?B?NGNyeEZDdFFsY1pyejVQaWJZVGxQRCtsYldHdU9KK0xWeUVDdE1CREhFZ3Ft?=
 =?utf-8?B?Z1B3eXJmd3pMQ2VqcFAxYkN2dHVTcjB0ZWpSajM4aDk5VHpwVHBlNlVQZmYw?=
 =?utf-8?B?U21hUCsrNVpEMVoyeTRBZ01jWmNoNWJaN290UjkzVGNqMnFDODVyTGI4MXk3?=
 =?utf-8?B?WThQVVd4Y0ZYeGVDZHlrbGlsK1dDUnR1VDRUZk0vbE9YdTk2UnVqaWlFVEF1?=
 =?utf-8?B?L2hEVzkyVmd1UWFteGFEd2doUWZZMStKcVFpWCs3YUFOYmdJTUhvOU51MzRi?=
 =?utf-8?B?aGhyZU1IU2N2d0NVTzAzbGhqMitPZm9xNjBWTVlBY05CY0ZNU0J4MjdSWXox?=
 =?utf-8?B?UlI3b2tOOW9ySjZKeGNWdlN1MzBiMXJYaUlMNXdneGpIUWVBL0F1NE5CVEhD?=
 =?utf-8?B?aUIzZGJOMjMrcnVWQzhENGY1eldzbDEzTmlzdGRjeWEzaTFjVkp0cXZ0R21z?=
 =?utf-8?Q?TgQBo30a3ytQH?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB9982.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eS9NVTVuVUoxeVNHSkM2REM4aTFzWWtoWGFmckRIV2J6N0xiRVNPdkM1Vkw2?=
 =?utf-8?B?d0NxUWlvb0VKUlJQRUtqcjFxWnFPVnpXUmIxRU1xL1BZZmtwM0tQc1VIcWJD?=
 =?utf-8?B?WDJ5aG1tMDNtQWlOdi9STExWc0k1SDRNSXhvaDZkNHZyRk1ISkZQUm9XVWRx?=
 =?utf-8?B?ZGpWMStuMVZWRC9YbXNBZHlQSkRHendVR2h3b0xoYTJIVG9ST2piMTJJaXZN?=
 =?utf-8?B?SEVkdm9MQ1MyYjlvVkJVOHRsZmZUa1l6YitQcUN1VU9VWHVpeHRIampQYkpY?=
 =?utf-8?B?VmtRYTNoOUtaMG8xdWZpQ3NGSEtaQjM0WTRiU1g1eDlIMzMzQW1UcVE2NHZJ?=
 =?utf-8?B?b2RyYWxhR2tnbGdoYSsrTFE2SFlMUk1yWmVWWFVTQS94QzlWLzV2YmhhTG5o?=
 =?utf-8?B?RzdMQzM2c0NaKzhvZ2kxOW0rY2J5NW1ZOWJvRkRMYVY4cGVvNm4zZkEwM1Zq?=
 =?utf-8?B?Ukk3aW1yZXFUQklxUjJORkcrTzUrQVJtbWV6c05mTnpHREJrYllkM2JzWTFx?=
 =?utf-8?B?WEt3alNJcEN3MGx4blFYclN0OUdHOEV2eFJTWmxNd2tVY3A5RjcyR05NeVhk?=
 =?utf-8?B?c2ZjZmF4ZTFHeW1wWEV1VmJLeXFBZ2FxeVljbUQ1NlQ2VW10dE1kcXNkM1c3?=
 =?utf-8?B?R0llWU9WTTAyOGlNTlM3Z2NSRzM1NXlFall0MjlLaDk2T0FkWm5CbXlLN0lu?=
 =?utf-8?B?dUhyKy96OEI1NXh2TFRxeDFadkdRancwTVpsay90aEhwYnp2d3pkei9ZRWlp?=
 =?utf-8?B?cGZYVjJYMVBwRW03Y3liaGVQNG1XRjg2SW1xeGNRUk4xK2lXUm1XWDJTaTFu?=
 =?utf-8?B?QUg3TW1LdWRiZnhaUVZ6aDdwL3ZrVUw5bW1XbG5JODkyZ3JCcmFSVEo5U09T?=
 =?utf-8?B?NGk0cm1jcWtlK0FON3ZxUmFSZzUya3BvTmpTS1ZTbGovdnFGcGVNaDhjU2RF?=
 =?utf-8?B?eHk5aDQ1c0pJcEhrTG9mU2M2c2RWQlVyeWNqU0lyVkY4RkZoZVB5RXBPTXBa?=
 =?utf-8?B?Y3h1MDJ2K2JQeUFHcllCYTJZanRwY3VvUVBKbWZ3UW5Pb21KdGZzUlVjQ2d3?=
 =?utf-8?B?aStPeTNpWlRDdllCTVlPZ1d2Snh1Qkt4d0FkWDI2Um5QTWFDa0FXUnZuV0xW?=
 =?utf-8?B?YjV5ZnBIRnh3SGg2dGlJc01PTnV4UmNtWU9zeUVmKzcvOFBES1c3RlpTK3hJ?=
 =?utf-8?B?blNWVG9jRFRXWFdMYXh2R3Z3a3ZiWWZMTlZTU0c3aFFKYXVjTFRmZGFTMFht?=
 =?utf-8?B?Wk1Oblk1WXJCT002LzF1RzE1N2VYaUZ0ZE1TbTE4Y2xvZkhRUUxGU3hPVUFq?=
 =?utf-8?B?dFF1NUJPaG9ZRUx0OEYra3IxNFJXT2ZTLzF0SVJQQU1iMnFXdC9FWCtCQWdE?=
 =?utf-8?B?bnFlVzZkT1VIby8vTFptZEczYlBjMTNWR3Z3RC9nbURqZDdnRTRUQ2hxcG9j?=
 =?utf-8?B?QU1jaURZLytCcnI4M0NSTEprL1VXRkh5RUtPd3NndFJraElMdGVaZ1FBMGUz?=
 =?utf-8?B?WUxZR2Z5Ujh6WXJDeE1DMGJ6ckhUOUFtSFJGNER2L04wNkVUMGc2TnZMWDc3?=
 =?utf-8?B?QWdOSGJZRWhJVVd0ZTdiY1FMdEExNkc1T3lFa3oxdG4xMEw0dk5aREh2UTY1?=
 =?utf-8?B?WCs2R2o1cjFqajR6UFRuTjlPd0liRFR0S3IrVDRpWWtRbXFHajJzbnRDQU9r?=
 =?utf-8?B?TlhCZGlPQWNXaW1IblFtd21GbUVIWXlFV1VKamEwT0Urbks5MU82MHpQRmVL?=
 =?utf-8?B?WFBUajBiOXZoRkxrb2dVWllLWEhYT1lUN1hRWTZSSUt5eXQ3a3RtU3ZQR091?=
 =?utf-8?B?VWcwa2ZzanphL3NzQWwrUkxrRmRxZVNkL2RvSHhTUFB4S21GWUptMXYrbTRP?=
 =?utf-8?B?TTRTRWNXTGMxQzhjQjRmVlY3VkZEb2JSWGFsOHVzV1pScUFmMTRWV0NoZ3dF?=
 =?utf-8?B?dzhFR1BNT0dicGJTUHYwekVERUQrY05uaXl5OWNnckJWODNFNTVjSTRKL2Yz?=
 =?utf-8?B?WUdvbFBpN1ZQbHk0ZkdCRTBvbmF4eDBvcnBQNXNrWnZBYStEaEZVM01JOFRo?=
 =?utf-8?B?WTUrd082VVVjVFlPMHpkZlhWckk4dWlwWVlQbi8yRDZmMXpMMGdjeWVuZFNl?=
 =?utf-8?B?NDNwU1MyRTh3WjZ5K2pUYk5yQWhZbDJ5eCtXZWJqTmE5bkpkSjZmWFhpQU1D?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB9982.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e7fda6-1dd7-4cff-229e-08dd1e2dc9d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 00:00:16.4686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FdzUVZD8OiflbEa8Ky8lWVHbYTT7i2Pur3duUAEBpAQ+V6rxvQyYHQfTJTXD9oyR3ackzxyxKLiLqhV/Ti/kPoJrwexCqO60aCxHLe6VF50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8675

SGVsbG8gS3J6eXN6dG9mDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcNCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtl
cm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMjUsIDIwMjQgNzowOCBQTQ0KPiBU
bzogaXNoaWthd2EgeXVqaSjnn7Plt50g5oKg5Y+4IOKXi++8su+8pO+8o+KWoe+8oe+8qe+8tO+8
o+KXi++8pe+8oemWiykNCj4gPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanA+OyBMYXVyZW50
IFBpbmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+OyBNYXVybyBD
YXJ2YWxobyBDaGVoYWINCj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+
OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBTYWthcmkgQWlsdXMNCj4gPHNh
a2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+OyBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2Nv
QHhzNGFsbC5ubD47DQo+IGl3YW1hdHN1IG5vYnVoaXJvKOWyqeadviDkv6HmtIsg4peL77yk77yp
77y077yj4pah77yk77yp77y04peL77yv77yz77y0KQ0KPiA8bm9idWhpcm8xLml3YW1hdHN1QHRv
c2hpYmEuY28uanA+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MTIgMi84XSBkdC1iaW5kaW5nczogbWVkaWE6IHBsYXRmb3JtOiB2aXNjb250aTogQWRkDQo+IFRv
c2hpYmEgVmlzY29udGkgVmlkZW8gSW5wdXQgSW50ZXJmYWNlDQo+IA0KPiBPbiAyNS8xMS8yMDI0
IDEwOjIxLCBZdWppIElzaGlrYXdhIHdyb3RlOg0KPiA+IEFkZHMgdGhlIERldmljZSBUcmVlIGJp
bmRpbmcgZG9jdW1lbnRhdGlvbiB0aGF0IGFsbG93cyB0byBkZXNjcmliZSB0aGUNCj4gPiBWaWRl
byBJbnB1dCBJbnRlcmZhY2UgZm91bmQgaW4gVG9zaGliYSBWaXNjb250aSBTb0NzLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogWXVqaSBJc2hpa2F3YSA8eXVqaTIuaXNoaWthd2FAdG9zaGliYS5j
by5qcD4NCj4gPiBSZXZpZXdlZC1ieTogTm9idWhpcm8gSXdhbWF0c3UgPG5vYnVoaXJvMS5pd2Ft
YXRzdUB0b3NoaWJhLmNvLmpwPg0KPiANCj4gV2h5IHRoaXMgdGFnIHN0YXllZCBhbmQgb3RoZXIg
d2FzIHJlbW92ZWQ/IFdoYXQgd2FzIHRoZSByZWFzb24gb2YgdGFnDQo+IHJlbW92YWw/DQo+IA0K
DQpUaGUgc3RheWVkIHRhZyBpcyBkdWUgdG8gaW50ZXJuYWwgcmV2aWV3Lg0KVGhlIHJlbW92ZWQg
dGFnIGlzIGR1ZSB0byBjb2RlJ3MgY2hhbmdlIChzcGxpdCBvZiBjc2kycnggcGFydCkgYWZ0ZXIg
dGhlIGxhc3QgcmV2aWV3Lg0KSWYgdGhlIGNvZGUgaXMgbGFyZ2VseSBjaGFuZ2VkIGZvbGxvd2lu
ZyB0aGUgaW5zdHJ1Y3Rpb24gb2YgYW5vdGhlciByZXZpZXdlcg0KYWZ0ZXIgb2J0YWluaW5nIHRo
ZSB0YWdzLCBob3cgc2hvdWxkIHRoZSB0YWdzIGJlIGhhbmRsZWQ/DQoNCj4gPiAtLS0NCj4gPiBD
aGFuZ2Vsb2cgdjI6DQo+ID4gLSBubyBjaGFuZ2UNCj4gPg0KPiA+IENoYW5nZWxvZyB2MzoNCj4g
PiAtIG5vIGNoYW5nZQ0KPiA+DQo+ID4gQ2hhbmdlbG9nIHY0Og0KPiA+IC0gZml4IHN0eWxlIHBy
b2JsZW1zIGF0IHRoZSB2MyBwYXRjaA0KPiA+IC0gcmVtb3ZlICJpbmRleCIgbWVtYmVyDQo+ID4g
LSB1cGRhdGUgZXhhbXBsZQ0KPiA+DQo+ID4gQ2hhbmdlbG9nIHY1Og0KPiA+IC0gbm8gY2hhbmdl
DQo+ID4NCj4gPiBDaGFuZ2Vsb2cgdjY6DQo+ID4gLSBhZGQgcmVnaXN0ZXIgZGVmaW5pdGlvbiBv
ZiBCVVMtSUYgYW5kIE1QVQ0KPiA+DQo+ID4gQ2hhbmdlbG9nIHY3Og0KPiA+IC0gcmVtb3ZlIHRy
YWlsaW5nICJiaW5kaW5ncyIgZnJvbSBjb21taXQgaGVhZGVyIG1lc3NhZ2UNCj4gPiAtIHJlbW92
ZSB0cmFpbGluZyAiRGV2aWNlIFRyZWUgQmluZGluZ3MiIGZyb20gdGl0bGUNCj4gPiAtIGZpeCB0
ZXh0IHdyYXBwaW5nIG9mIGRlc2NyaXB0aW9uDQo+ID4gLSBjaGFuZ2UgY29tcGF0aWJsZSB0byB2
aXNjb250aTUtdmlpZg0KPiA+IC0gZXhwbGljaXRseSBkZWZpbmUgYWxsb3dlZCBwcm9wZXJ0aWVz
IGZvciBwb3J0OjplbmRwb2ludA0KPiA+DQo+ID4gQ2hhbmdlbG9nIHY4Og0KPiA+IC0gU3VnZ2Vz
dGlvbiBmcm9tIEtyenlzenRvZiBLb3psb3dza2kNCj4gPiAgIC0gcmVuYW1lIGJpbmRpbmdzIGRl
c2NyaXB0aW9uIGZpbGUNCj4gPiAgIC0gdXNlIGJsb2NrIHN0eWxlIGFycmF5IGluc3RlYWQgb2Yg
aW5saW5lIHN0eWxlDQo+ID4gICAtIHJlbW92ZSBjbG9jay1sYW5lIChhcyBpdCBpcyBmaXhlZCBh
dCBwb3NpdGlvbiAwKQ0KPiA+ICAgLSB1cGRhdGUgc2FtcGxlIG5vZGUncyBuYW1lDQo+ID4gICAt
IHVzZSBsb3dlcmNhc2UgaGV4IGZvciBsaXRlcmFscw0KPiA+IC0gU3VnZ2VzdGlvbiBmcm9tIExh
dXJlbnQgUGluY2hhcnQNCj4gPiAgIC0gdXBkYXRlIGRlc2NyaXB0aW9uIG1lc3NhZ2UgcG9ydDo6
ZGVzY3JpcHRpb24NCj4gPiAgIC0gcmVtb3ZlIHBvcnQ6OmVuZHBvaW50OjpidXMtdHlwZSBhcyBp
dCBpcyBmaXhlZCB0byA8ND4NCj4gPiAgIC0gcmVtb3ZlIHBvcnQ6OmVuZHBvaW50OjpjbG9jay1s
YW5lcyBmcm9tIGV4YW1wbGUNCj4gPiAgIC0gYWRkIHBvcnQ6OmVuZHBvaW50OjpkYXRhLWxhbmVz
IHRvIHJlcXVpcmVkIHBhcmFtZXRlcnMgbGlzdA0KPiA+ICAgLSBmaXggc2VxdWVuY2Ugb2YgZGF0
YS1sYW5lczogPDEgMiAzIDQ+IGJlY2F1c2UgY3VycmVudCBkcml2ZXIgZG9lcyBub3QNCj4gc3Vw
cG9ydCBkYXRhIHJlb3JkZXJpbmcNCj4gPiAgIC0gdXBkYXRlIHBvcnQ6OmVuZHBvaW50OjpkYXRh
LWxhbmVzOjpkZXNjcmlwdGlvbg0KPiA+ICAgLSByZW1vdmUgcmVkdW5kYW50IHR5cGUgZGVmaW5p
dGlvbiBmb3IgcG9ydDo6ZW5kcG9pbnQ6OmRhdGEtbGFuZXMNCj4gPg0KPiA+IENoYW5nZWxvZyB2
OToNCj4gPiAtIHBsYWNlICJyZXF1aXJlZCIgYWZ0ZXIgInByb3BlcnRpZXMiDQo+ID4gLSBkaWN0
aW9uYXJ5IG9yZGVyaW5nIG9mIHByb3BlcnRpZXMNCj4gPg0KPiA+IENoYW5nZWxvZyB2MTA6DQo+
ID4gLSBubyBjaGFuZ2UNCj4gPg0KPiA+IENoYW5nZWxvZyB2MTE6DQo+ID4gLSBubyBjaGFuZ2UN
Cj4gPg0KPiA+IENoYW5nZWxvZyB2MTI6DQo+ID4gLSByZW1vdmUgcHJvcGVydHkgImNsb2NrLW5v
bmNvbnRpbnVvdXMiIGFzIFZJSUYgc3dpdGNoZXMgYm90aCBtb2Rlcw0KPiA+IGF1dG9tYXRpY2Fs
bHkNCj4gPiAtIHJlbW92ZSBwcm9wZXJ0eSAibGluay1mcmVxdWVuY2llcyIgYXMgVklJRiBkb2Vz
IG5vdCB1c2UgdGhlDQo+ID4gaW5mb3JtYXRpb24NCj4gDQo+IERyaXZlciBkb2VzIG5vdCB1c2Ug
b3IgaGFyZHdhcmUgc3VwcG9ydHMgb25seSBvbmUgZnJlcXVlbmN5Pw0KPiANCg0KTXkgY29tbWVu
dCB3YXMgaW5jb3JyZWN0Lg0KSXQgc2hvdWxkIGJlICJEcml2ZXIgZG9lcyBub3QgdXNlIHRoZSBp
bmZvcm1hdGlvbiINCg0KPiA+IC0gcmVtb3ZlIHJlZ1syXSBhbmQgaW50ZXJydXB0c1szXSB3aGlj
aCBhcmUgdXNlZCBmb3IgQ1NJMlJYIGRyaXZlcg0KPiA+IC0gdXBkYXRlIGV4YW1wbGUgdG8gcmVm
ZXIgY3NpMnJ4IGZvciByZW1vdGUtZW5kcG9pbnQNCj4gDQo+IFdlcmUgdGhlc2UgdGhlIHJlYXNv
bnM/DQo+IA0KPiBJIGFtIHJlYWxseSBzdXJwcmlzZWQgdGhhdCBhZnRlciAxMSB2ZXJzaW9ucyB0
aGlzIGJpbmRpbmcgc3RpbGwgaXMgYmVpbmcgdG90YWxseQ0KPiByZXNoYXBlZCBhbmQgeW91IG5l
ZWQgdXMgdG8gcmUtcmV2aWV3Lg0KPg0KDQpTb3JyeSBmb3IgcG9vciBxdWFsaXR5Lg0KU2V2ZXJh
bCBjaGFuZ2VzIHdlcmUgYnJvdWdodCBhYm91dCBieSB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBD
U0kyUlggZHJpdmVyLg0KVGhlIG5ldyBkcml2ZXIgd2FzIHJlcXVlc3RlZCBpbiB0aGUgcHJldmlv
dXMgcmV2aWV3Lg0KVGhlIHByb3BlcnR5ICJjbG9jay1ub25jb250aW51b3VzIiB3YXMgcG9pbnRl
ZCBvdXQgYXMgdW5uZWNlc3NhcnkgKGJlY2F1c2UgSFcgc3VwcG9ydHMgYm90aCBtb2RlcykgaW4g
dGhlIHByZXZpb3VzIHJldmlldy4NClRoZSBwcm9wZXJ0eSAibGluay1mcmVxdWVuY2llcyIgd2Fz
IGRyb3BwZWQgYmVjYXVzZSBJdCB3YXMgZm91bmQgdG8gYmUgdW51c2VkIGFmdGVyIHJlLWNoZWNr
IG9mIHRoZSBjb2RlLg0KDQo+IEFsc28sIHN0YXJ0IHVzaW5nIGI0IHRvb2wsIHNvOg0KPiAxLiB5
b3VyIGNvdmVyIGxldHRlciB3aWxsIGhhdmUgcHJvcGVyIGxpbmtzIHRvIHByZXZpb3VzIHZlcnNp
b25zIDIuIGI0IGRpZmYgd291bGQNCj4gd29yay4gTG9vaywgdHJ5IGJ5IHlvdXJzZWxmOg0KPiAN
Cj4gDQo+IA0KPiBiNCBkaWZmICc8MjAyNDExMjUwOTIxNDYuMTU2MTkwMS0zLXl1amkyLmlzaGlr
YXdhQHRvc2hpYmEuY28uanA+Jw0KPiBHcmFiYmluZyB0aHJlYWQgZnJvbQ0KPiBsb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjQxMTI1MDkyMTQ2LjE1NjE5MDEtMy15dWppMi5pc2hpa2F3YUB0b3NoaWJh
LmNvLmpwL3QNCj4gLm1ib3guZ3oNCj4gQ2hlY2tpbmcgZm9yIG9sZGVyIHJldmlzaW9ucw0KPiBH
cmFiYmluZyBzZWFyY2ggcmVzdWx0cyBmcm9tIGxvcmUua2VybmVsLm9yZw0KPiAgIEFkZGVkIGZy
b20gdjExOiA3IHBhdGNoZXMNCj4gLS0tDQo+IEFuYWx5emluZyAxNDQgbWVzc2FnZXMgaW4gdGhl
IHRocmVhZA0KPiBMb29raW5nIGZvciBhZGRpdGlvbmFsIGNvZGUtcmV2aWV3IHRyYWlsZXJzIG9u
IGxvcmUua2VybmVsLm9yZyBBbmFseXppbmcgMTMNCj4gY29kZS1yZXZpZXcgbWVzc2FnZXMgUHJl
cGFyaW5nIGZha2UtYW0gZm9yIHYxMTogQWRkIFRvc2hpYmEgVmlzY29udGkgVmlkZW8NCj4gSW5w
dXQgSW50ZXJmYWNlIGRyaXZlcg0KPiAgIHJhbmdlOiBlMTZlMTQ5Y2VkMTUuLjRlZmIwZDY3Njhh
Ng0KPiBQcmVwYXJpbmcgZmFrZS1hbSBmb3IgdjEyOiBkdC1iaW5kaW5nczogbWVkaWE6IHBsYXRm
b3JtOiB2aXNjb250aTogQWRkIFRvc2hpYmENCj4gVmlzY29udGkgTUlQSSBDU0ktMiBSZWNlaXZl
cg0KPiBFUlJPUjogdjEyIHNlcmllcyBpbmNvbXBsZXRlOyB1bmFibGUgdG8gY3JlYXRlIGEgZmFr
ZS1hbSByYW5nZQ0KPiAtLS0NCj4gQ291bGQgbm90IGNyZWF0ZSBmYWtlLWFtIHJhbmdlIGZvciB1
cHBlciBzZXJpZXMgdjEyDQo+IA0KPiANCj4gDQo+IEhvdyBjYW4gSSB2ZXJpZnkgd2hhdCBoYXBw
ZW5lZCBoZXJlIHdpdGhvdXQgdG9vIG11Y2ggZWZmb3J0Pw0KPiANCj4gDQoNCkkgd2lsbCB1c2Ug
YjQgdG9vbCBmb3IgZnVydGhlciBzdWJtaXRzLg0KQWxzbyBJJ2xsIGFkZCBsaW5rcyB0byBwcmV2
aW91cyB2ZXJzaW9ucyBpbiB0aGUgY292ZXIgbGV0dGVyLg0KDQpJIHJhbiBiNCBkaWZmIHdpdGgg
dGhlIEhFQUQgb2YgbWVkaWFfc3RhZ2UgdHJlZSBhbmQgY29uZmlybWVkIHRoYXQgaXQgcHJvZHVj
ZWQgbm9uLWVycm9yIHJlc3VsdHMuDQpJIG5lZWRlZCB0byBmZXRjaCB0aGUgdHJlZSB0byBhIGNl
cnRhaW4gZGVwdGggdG8gZW5zdXJlIGV2ZXJ5dGhpbmcgd29ya2VkIHNtb290aGx5Lg0KDQokIGdp
dCBjbG9uZSBodHRwczovL2dpdC5saW51eHR2Lm9yZy9tZWRpYV9zdGFnZS5naXQgLS1kZXB0aCAx
DQokIGdpdCBmZXRjaCAtLXNoYWxsb3ctZXhjbHVkZSB2Ni40DQokIGdpdCBsb2cgLS1vbmVsaW5l
IHwgaGVhZCAtNQ0KNDAzODRjODQwZWExIExpbnV4IDYuMTMtcmMxDQphMTRiZjQ2M2U3ZGYgTWVy
Z2UgdGFnICdpMmMtZm9yLTYuMTMtcmMxLXBhcnQzJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvd3NhL2xpbnV4DQo4ODg2MmVlYjQ3NjMgTWVyZ2UgdGFn
ICd0cmFjZS1wcmludGYtdjYuMTMnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90cmFjZS9saW51eC10cmFjZQ0KZjc4OGI1ZWYxY2E5IE1lcmdlIHRhZyAn
dGltZXJzX3VyZ2VudF9mb3JfdjYuMTNfcmMxJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdGlwL3RpcA0KNjNmNDk5M2I3OTJlIE1lcmdlIHRhZyAnaXJx
X3VyZ2VudF9mb3JfdjYuMTNfcmMxJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdGlwL3RpcA0KDQokIGI0IGRpZmYgJzwyMDI0MTEyNTA5MjE0Ni4xNTYx
OTAxLTMteXVqaTIuaXNoaWthd2FAdG9zaGliYS5jby5qcD4nDQoNCj4gPg0KPiA+ICAuLi4vbWVk
aWEvdG9zaGliYSx2aXNjb250aTUtdmlpZi55YW1sICAgICAgICAgfCA5NQ0KPiArKysrKysrKysr
KysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspDQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS90b3NoaWJhLHZpc2NvbnRpNS12aWlmLnlhbWwNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4g
PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS90b3NoaWJhLHZpc2Nv
bnRpNS12aWlmLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS90b3NoaWJhLHZpc2NvbnRpNS12aWlmLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWYwNDUyYTQ3ZTk4DQo+ID4gLS0tIC9kZXYvbnVs
bA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS90b3No
aWJhLHZpc2NvbnRpNS12aWlmLnkNCj4gPiArKysgYW1sDQo+ID4gQEAgLTAsMCArMSw5NSBAQA0K
PiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL21lZGlhL3Rvc2hpYmEsdmlzY29udGk1LXZpaWYueWFtbCMNCj4gPiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0K
PiA+ICt0aXRsZTogVG9zaGliYSBWaXNjb250aTUgU29DIFZpZGVvIElucHV0IEludGVyZmFjZQ0K
PiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBOb2J1aGlybyBJd2FtYXRzdSA8bm9i
dWhpcm8xLml3YW1hdHN1QHRvc2hpYmEuY28uanA+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjog
fC0NCj4gDQo+IFNpbmNlIHlvdSBhc2sgZm9yIHJlLXJldmlldywgdGhlbjoNCj4gDQo+IERyb3Ag
fC0NCj4gDQoNCkknbGwgZHJvcCAifC0iDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg0KQmVzdCByZWdhcmRzLA0KWXVqaSBJc2hpa2F3YQ0K


