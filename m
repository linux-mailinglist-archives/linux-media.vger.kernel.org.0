Return-Path: <linux-media+bounces-44518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD35BDCC73
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 08:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC4034F752D
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 06:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6733128D7;
	Wed, 15 Oct 2025 06:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZPXYgbCh"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2FC2030A;
	Wed, 15 Oct 2025 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760510745; cv=fail; b=re3hIhosY/WCvNS+EwvJWogxQ0o0uH4oLeXdPeVJipTJpdaGp0vAFiLXm7FDBLavinB35T9JVA2JznK5w65fkR0amJYzuEeNs9/vmVyXEt66MOFteINhrlxQUMb/kOCBkq40wiBIoPh6Cz7/mjv2gVwY1zqEV4s1m15fp190QkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760510745; c=relaxed/simple;
	bh=MjTYL8upXWMOcnxscVqDompl2aPL9EuxNPzd5MRyS6E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PQMpValUGyWLwFBxR6V1DShVipkJO20a6Zs3tTz7wGnC7Wb7Fqd+/iLXBvkby4VSoYfvGX5ppX6G4W9BR239tBBFvIfhcuUodgW78onIshBPbrN8hmcrQMFg+G1OKmW8hyxrgWPehachBa3MbkHLFAACIvyBAY0sSlFMlDwqiSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ZPXYgbCh; arc=fail smtp.client-ip=52.101.193.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVwJfqF7xTnpQxTnIa7utMc46W1hJ7eF+p25Y166LzwsY2OPhoSMWrEGb2fEIDNwzT6iQe4+Qojv11GxIdIoijgoLSh1OP99+x4V28+40v9q9TxqLGHSinlMlKFasayKfCoQq98ZWEtTIjf++iPfgGKUSQ1+lK9pUPR83631gM4b2MwpKjVjIoDVhRX8QxZqCA86LA7cbFguffkTJEhrizqAP1TbTVt05mPuwGISPc1LMb0XfnvIcy/BG3I4SeREPp56krA51pxQ4ak9TaiFQ/epw+gLGRjxBLt9JLm6LOkk/lo5BflyBUs5md9pjQ1hvu3WfnZjKvv3dMTuhBR4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjTYL8upXWMOcnxscVqDompl2aPL9EuxNPzd5MRyS6E=;
 b=uE9zG22Yp7x4JZtbgrP6NLPuMjSe08E7GoMfH/QCCjKSV+smFjCS9XtbHq5qijXPpHu897MqzQHe8riP/Omh4R3nWCt/l/coJcpeQYQJf9efg3t8hY0830K31VnQEQoDcO/UPuvyiJqm2YZCg/rEDOTzTMvQCCHL+To+FgeaXdpeppLBKuulBHcLjJYT7KeN6mdBYJJ7AXhqN+f7GmYJ+bPRIM3VYFfXcjiO8h1wB0b3PlYt8XNzCvzodld5iHsekEST2leuL/x5ruxJIL76O9JQ8aolLFVUJM4ia7eibFtXDfRP87MNL1uQFtuYWDZj3WGhm8HfeTGkgIoamFumhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjTYL8upXWMOcnxscVqDompl2aPL9EuxNPzd5MRyS6E=;
 b=ZPXYgbChu70A6hGSXxRYoVJ82+HfxgDOsm78fHSwfsZUBElEalW2eJoxpT5yy9DR/yBeztnexB4XSL2al8xuVLfzXmKVF2m+2eqy5HQoQoY8XddRc6wimgfZ99ugBiZkT4bIeHzxrGXzJmiX3scizf2u8ySWNZPtf+qWIEUIdCLPBl4GuDrvPTRO34LKzQCjtRWwGbGH4xhhwmGWPc1uv3MadIoj4HOhFCjtBbdSh6UpQKb9xYJuJ2zj/HBdipEIh2AZLNQ4gN106LhK3+6+KLit4VH0alg+n+siy6KEc1RGIboJkKytvDTi4imcz68C0PN/rMxTUiJszYA0ui92mA==
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by DS0PR11MB9503.namprd11.prod.outlook.com (2603:10b6:8:297::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 06:45:41 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 06:45:41 +0000
From: <Balamanikandan.Gunasundar@microchip.com>
To: <kieran.bingham@ideasonboard.com>, <eugen.hristev@linaro.org>
CC: <3chas3@gmail.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<Balakrishnan.S@microchip.com>, <hverkuil@kernel.org>,
	<ribalda@chromium.org>, <laurent.pinchart+renesas@ideasonboard.com>,
	<jacopo.mondi@ideasonboard.com>, <dan.scally+renesas@ideasonboard.com>,
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<mchehab@kernel.org>
Subject: Re: [PATCH 00/18] media: microchip-isc: Color correction and
 histogram stats
Thread-Topic: [PATCH 00/18] media: microchip-isc: Color correction and
 histogram stats
Thread-Index: AQHcOTTZ/S2f3ojywkq2aD8kAxrouLS6P1OAgADMHoCAB7VgAIAAC1EA
Date: Wed, 15 Oct 2025 06:45:41 +0000
Message-ID: <d71440cd-94e4-4411-bcbe-5195f6d5a11b@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <7b861236-8317-4435-8582-bd97f545e322@linaro.org>
 <176008451125.756374.6436397947711705101@ping.linuxembedded.co.uk>
 <2316c0cb-6a84-432e-8cd3-ca953123bd67@microchip.com>
In-Reply-To: <2316c0cb-6a84-432e-8cd3-ca953123bd67@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6231:EE_|DS0PR11MB9503:EE_
x-ms-office365-filtering-correlation-id: 1485a91b-2db7-4797-6368-08de0bb67548
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V213bEt0QXFOTEJGbzVqeHBpRVo5RzY5QWdhdUwxZTh4UUZwQWlvVnRUQk5i?=
 =?utf-8?B?U2huKzlJSHpuVXVtamZuS2ZYdDluODFuWlhOZ2xSUFJrNHlvS1R5ZFhocUJi?=
 =?utf-8?B?L1hMK0x6SjFUeUlraDRZZlpGWWRpa1dncG55dTczWXhrUDZibFAzUkpjM21N?=
 =?utf-8?B?cU5VaWM1QjBqb0xXb1JqVWw1Q3B1TzhJRm8vdzVOVWpGVEJqck5ZZGhKaklD?=
 =?utf-8?B?emduS1o5VC8yNmRnQ0JDVzIrbURxa0pzYUl5cGdpVWNXa1RiWXg1M0NWbkNS?=
 =?utf-8?B?SVVHM2JPejAyNkp1RnJmWXJwT09ZY2FTYWJ5TnJ2VFArVldHbWE0WHNjcTU3?=
 =?utf-8?B?clJ3Z1FxRHRCNHVaTUgzVUp1R0tOM2hGQkczU3BMUDU4RlZUa0ZvWkNNTVF6?=
 =?utf-8?B?VmI2eFlESUpBYlIvUXd3TkRydHltdS85R1VTY2tZNWl3ODBZQTF3SVU4Vlcz?=
 =?utf-8?B?amRaOHgxK0I3YTV3VmlTTzNJTGYwTVIrYXRvOUcwWGQ0eExSaWYvWEQrUU92?=
 =?utf-8?B?SXBkajBoRERNaEZTRmI1Qng0UENkZEd6SC9XM05qODdWSnA0MmRVU3JxUUwr?=
 =?utf-8?B?UDc2VDdQVGVMUDZlWkhETS9CaG96QjUzNjVLN2d4WTRWYUhWcGpPZ0dNeGxl?=
 =?utf-8?B?SUVZSldENlB6aHhNZStoalp3RXR2dXFQbmw1SVZiYmtpTlpQZXh4KzRpYzhN?=
 =?utf-8?B?aGsxeS9nS0pLZVZ6NzdVWE9yakJGelVra1NwYUpLdTMycGh6WjNSdXRNdnQ2?=
 =?utf-8?B?MGg0UW1OdlFtOHhCS3VBWlhMT2RmRy9GUUwzek1mN28yakVJb2daNmZBMDNZ?=
 =?utf-8?B?VjJHV2l1TTFldU9XUi9KdUVsODAvQytreFJtc3NOdExxekdQOWZhZnZ1TEd5?=
 =?utf-8?B?R2N6d3dVaDZrallEbGNWRk9sSjJ1Y2Fabmxjb2prbVo0ZFMyOWc5VTAvbUk0?=
 =?utf-8?B?akxMeFZHUEp5dTRmbk11UkRpNUJ1ZkU0UHlhWHltbnBOREdJUEpIbTY5alZS?=
 =?utf-8?B?Y3ZvSEVZQUx5ZXd6eXg5eTlmOVBNb3dBLzNCVjVrL3pNQzJiNmR6NStaZERD?=
 =?utf-8?B?TEtWdFQ3K2N4bjhyK3dtOXlUMGtoK1JoWGxnbE56SVQ0WGp2bDNUSEdvUUg3?=
 =?utf-8?B?dG1MaktLd3dMZUViS1dpVU02MU1HUjBxTHA2eWxhcFEzcFVqc1U5bUhrQXgz?=
 =?utf-8?B?cmFNYzMyRTlKcEU2ZDBlQzFLbkNORURSRDhmVVVSVU1oRXJHa0dHd0lNV2Z2?=
 =?utf-8?B?Sms2RWFrMVEvalVyV0R0d1hKdzlxalgzNjdqT1NEbFg5d21iZDVqcWxDRFZq?=
 =?utf-8?B?NUJyam1Fa0tpS1RCSVZyY04vZzhEb0ppcGszNms4N0JRc3RFeG8rRy9qYm9F?=
 =?utf-8?B?cUJWcUFHM2xmTCsyVjFiaGxwSU1SeGtiN0tZU3U0dDBPcFFqMWNIWlc0V3lF?=
 =?utf-8?B?NkpmbUVUOW1hZG83SDU4Y3QyYzBJRjU4SlY2VUlvZFgvZHJ0VnUyVXc5UmtV?=
 =?utf-8?B?ZXB0dElQZlJ5Z1ZoZ0ZFbndYM3kray82aUlTUVZNeHRueVFhSDVQakdTd2xr?=
 =?utf-8?B?b3lNQmREd1h0akVCelRua3hiUWprZWx5RVZhK1hhUXMrbDIzZ2ZwYUtoTjNH?=
 =?utf-8?B?K2dsUDEySW1jUUJIdVNlWTM5YXV5MVZWRzhrajgzVitHR0RPak1udU1HSWlm?=
 =?utf-8?B?ZG9ubytFMjlCTUlBR3JpSHFoYUk0VmFod3hNT2JoeTluQkVmWURDUlFCYUkw?=
 =?utf-8?B?c3NzRnBLMlVQa25RcEM0NWVFL09FUjlaMjRGK2dPbGpUc3ZWY2xkeDFDM1Bx?=
 =?utf-8?B?eVZyeVptcDBIN0t2Q2hQcVRuWm9VWlBxNXJyRFgwUlJGb044aWZiU3VtbDRC?=
 =?utf-8?B?UUh6Z3FQMnZqL3BzYWhFeno0TzI4eEIvZ2k0TllEWG8ySUx3L2h1eUJjMUhQ?=
 =?utf-8?B?cU8wT2tCZisxOXhlaUlHellhSmg1L1FqbXpXWTlIMXBLZFJDM25qT0xoTk9G?=
 =?utf-8?B?YkplV0t4ZmJVT0JsQkM0MHlCOWk4YUhQelRhOXhSZnllRUwrNWY4ZkJkSG9t?=
 =?utf-8?Q?j/q13x?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VzJ4RzJsL1JWZTJpamVoaDBFUVNpSUlFdFFyKzBkYkxWcVFwWSsxMCtEbU9O?=
 =?utf-8?B?UW0wcDhUYnRYRUZtRitZVnhlczFTM3FkY1FNR1NZTkFNQkN0WGRNNk5ObXY2?=
 =?utf-8?B?ZEFvRnBtSFZCbEpIMVAxNHR5UHFyUlhTWG1HVnR1Rmhjd1RCVk03bE40MWkz?=
 =?utf-8?B?Nzl6SEZlM1hsREgyNU8rbDExWXROVWJBYzRwMGZydjhubzFkQ1RGRkF6MzVL?=
 =?utf-8?B?SDk0cW95SDFpZk5KS2M1YzRMWXJXNTlJV2lEY0tLQVptQXJIOEcvNVMzK2Jw?=
 =?utf-8?B?c3BQRE9qRGc2cFhDTkwzN2o0VmNkTmVZdjgzK3BzL3p4U3lodEFIZ2pRZUZ1?=
 =?utf-8?B?bmRwNWVvUGd4OUlmQWJFU2hCMWhrYVZTUGdBbFB0SEU3dGdTdnRjQzRvVlQy?=
 =?utf-8?B?RHl5cjhwWW8vUjZnbXVFWVhWQ2ZQQ1VTaVAybkpXUitPVmY2UWVBM1hhSnZz?=
 =?utf-8?B?cXV5S0xzWWZhMlp2RlV4U0tVRW1MM0c1TjBiWE41bkYwcWc4TVdmMkM3T2Vm?=
 =?utf-8?B?b25Xbnh5Z3NnOHRkUVBJUWdvcUJEcVV6V04vaWl0OFZ3SnhrMU1DNDN6OGVW?=
 =?utf-8?B?dmZoUHcxVnVnWUZZZkdFWGJJTTAzeGg5ZEIzQmJ3UXF4ZEV3ZEFwRlZ1MjBm?=
 =?utf-8?B?NzNvQnByNTA1VTcyQ2xoU0JpUkgzQmxlZXVJM2lZYzBYMDNjR0dKTG1oTUs5?=
 =?utf-8?B?dzROY0oxYWRHKzk4Y3RwVjFmSzBaQkFCUXBnZU9KZGpKNEIySnNFVDlQY2NY?=
 =?utf-8?B?VjZNOFZXRlhERXhpWXJqc3JNWWY4NDFudjE4dkVsR0U4dzBDVHM5eWZJblVT?=
 =?utf-8?B?MUp3RHY0YkJ5Mjllem9Uam4vM0JZTEFlZ05UQVdUaHVKWGNBcVpndGJLWVFM?=
 =?utf-8?B?ZXprTWRrNHFZYVNKRUlPdUVHR0tEZ3BOclkxL241QzRGK2tuTHB3KzljTDZi?=
 =?utf-8?B?WmFnaGFQK0plM2drdnNFRWFKd3ZISHlKTEVMWVhURFlJQVY2aHVjTUdqVkFW?=
 =?utf-8?B?RlZGUWJOcGp3ZjVxanlzMS8wT3FsL0pjY2habDFsVVVpR0RuTE8yb0lESkRH?=
 =?utf-8?B?U3hyemhiSktsdTFmMDM4Y1lPeDIxTnBlUHZDWEVQNHpKWFdNRmRkUnI4eGw2?=
 =?utf-8?B?V1g2Vlhxa2NuTkJIWk5mU2RRYmlEaDJGVk14blVjaHVLenFMZlBDTEcvUE9I?=
 =?utf-8?B?Tk9NRlF1Q2srbnZsWGR6VEYzL2RZQk95R1ZlNUo5MS9Wby9rb1dQTjlYcUsz?=
 =?utf-8?B?L29DWVR1TmdpeUx3NU10NUl4NVcvbXNWcWlEa3VtRmtma1Z5ZTBvR0hhRkFC?=
 =?utf-8?B?bEwrMEFyQ0ZXZkpmWDNuZDkxdHhha2U5ZDQ0SVJDMnJsaUdRZTFSWDRKZHpX?=
 =?utf-8?B?MTI3UGJ3Wk1oNjdmRTQwbHo0cE5wUG93TWgwRkhGK05md2x1Tlo4SW1GOUUx?=
 =?utf-8?B?ZXFMK1lOVERlaGplTE1VOGJEWUpGOTNpdkg4Qnd4NmtUNE9aZHFHV0hob243?=
 =?utf-8?B?SDNRSzE1UVFudjVNU01mdXZRb3dSR1d2cDJHT3hqanY5YWFMQ0RBU3dOaVF2?=
 =?utf-8?B?UGFpWlhrMlY3MDFDYXJCK1hwNERRRkxTL0xVV2pSdldUOEwwcDVGNkFhRHND?=
 =?utf-8?B?bEhaRSt1WDRYMmJTOTN5bDNFd1FFaFlZUjJKdG1WUnppREp5cjdBY2RFWjRZ?=
 =?utf-8?B?aENmOS9nU3VzdTlqTnEzaWk3TzY4UXY2R3hhanZqL2lTeW1rOXd5OW1VZEFK?=
 =?utf-8?B?N0syWnhzM2J0RzNnR0pkdWpWazh6a1BmSmJoR1FjNjVqWnRUZFJPMEh1Mk00?=
 =?utf-8?B?Z09IM3Y0WEVTQVlKYklSeGc3em9hZU1aS2h1R1NuWis1Z0FoZzR2WDd3TG9x?=
 =?utf-8?B?Q0ZXaHlocXcvWEhoTkczVHN4dG5WNUtMRnJDU2ppaS94QnlwVTVoZmRacm1P?=
 =?utf-8?B?S05qcGNrZUxDNGplekFLZ1l0MnlRV2xiQ1pBR2VuSGhMTGhtSkN5SjdDaFZ0?=
 =?utf-8?B?Y1k3bFN3SS9sQjRJMmlsYkszeU8raHhYbGNQVmxHckVTam5jYUlxcGovQ2ls?=
 =?utf-8?B?OFcxY0kvOVNxVmZOWjBVRmtNUldQcFZlSVJFbk5KUDEwbG85Nk0zODA0NERZ?=
 =?utf-8?B?M3AyeGNJQVFRK3pLT3JQdjRRdzVwTUo4WGp4bE1xZWdPWmlPMDAreE5JeklJ?=
 =?utf-8?Q?9Kc5A+o2xJWMLZ8tucMLXbc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02C6C4317BCD0B4C94808E01F0EA7D18@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1485a91b-2db7-4797-6368-08de0bb67548
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 06:45:41.2637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mXNaylUh3g0vU1o5SRhlUbJTrlwgNHn6bAlmsjnRoD5q4JfFeVkxFMxQ9nJzs9i7y4ZafaKz3I6t3nXm8OdkxvETsIx+r1l+ags0/z6EileBkENHsKsf7K1+wwDV40ho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9503

SGkgS2llcmFuLA0KDQpPbiAxNS8xMC8yNSAxMTozNSBhbSwgQmFsYW1hbmlrYW5kYW4gR3VuYXN1
bmRhciAtIEk2NDQxMCB3cm90ZToNCj4gSGnCoCBLaWVyYW4sDQo+DQo+IE9uIDEwLzEwLzI1IDE6
NTEgcG0sIEtpZXJhbiBCaW5naGFtIHdyb3RlOg0KPj4+IEhpIEJhbGEsDQo+Pj4NCj4+PiBPbiAx
MC85LzI1IDE4OjUyLCBCYWxhbWFuaWthbmRhbiBHdW5hc3VuZGFyIHdyb3RlOg0KPj4+PiBIaSwN
Cj4+Pj4NCj4+Pj4gVGhpcyBwYXRjaCBzZXJpZXMgaGFzIGEgc2V0IG9mIGVuaGFuY2VtZW50cyB0
byB0aGUgTWljcm9jaGlwIEltYWdlIFNlbnNvcg0KPj4+PiBDb250cm9sbGVyIGRyaXZlci4gVGhl
IG9iamVjdGl2ZSBpcyB0byBleHBhbmQgaXRzIGltYWdlIHByb2Nlc3NpbmcNCj4+Pj4gY2FwYWJp
bGl0aWVzIGFuZCB0byBpbXByb3ZlIHRoZSBjb2xvcnMuDQo+Pj4+DQo+Pj4+IFRoaXMgc2VyaWVz
IGFsc28gaW50cm9kdWNlcyBhIG5ldyBzdGF0cyBkcml2ZXIgdGhhdCBleHBvc2VzIHRoZSBoaXN0
b2dyYW0NCj4+Pj4gZGF0YSB0byB1c2Vyc3BhY2UgdmlhIHY0bDIgY29udHJvbHMuIFRoaXMgYWxs
b3dzIGFwcGxpY2F0aW9ucyBzdWNoIGFzDQo+Pj4+IGxpYmNhbWVyYSB0byBhY2Nlc3MgcmVhbCB0
aW1lIGltYWdlIHN0YXRpc3RpY3MgZm9yIGFkdmFuY2VkIGltYWdlDQo+Pj4+IHByb2Nlc3Npbmcg
bGlrZSBhdXRvbWF0aWMgZXhwb3N1cmUsIHdoaXRlIGJhbGFuY2UgYWRqdXN0bWVudHMgZXRjLg0K
Pj4gSG93IG11Y2ggZGF0YSBkbyB5b3UgYW50aWNpcGF0ZSB0byBiZSBwYXNzaW5nIHRocm91Z2gg
Y29udHJvbHM/IChXaGF0DQo+PiBjYW4gdGhlIGhhcmR3YXJlIHByb3ZpZGUgaW4gdG90YWwgaWYg
d2UgbG9vayBhdCB0aGUgYmlnZ2VyIHBpY3R1cmUgdG8NCj4+IHN1cHBvcnQgdGhlIGZ1bGwgZGV2
aWNlPykNCj4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIEN1cnJlbnRseSB0aGUgaGFyZHdhcmUg
cHJvdmlkZXMgaGlzdG9ncmFtIGRhdGENCj4gd2l0aCAyNTYgYmlucyBwZXIgY29sb3IgKFIsIEcs
IEIgYW5kIFkpIGVhY2ggMzIgYml0IHdpZGUuIFNvIHJvdWdobHkNCj4gYXJvdW5kIDQgeCAyNTYg
eCA0ID0gNEsgb2YgZGF0YSBwZXIgZnJhbWUuIFRoZSBpbnRlbnQgdG8gdXNlwqAgaXQgYXMgdjRs
Mg0KPiBjb250cm9scyB3YXMgdG8gbWFrZSB0aGlzIGRhdGEgZWFzaWx5IGFjY2Vzc2libGUgdG8g
dXNlciBzcGFjZSB3aXRob3V0IGENCg0KDQpDb3JyZWN0aW5nIG15IG1pc3Rha2UgaGVyZS4gVGhl
IGhpc3RvZ3JhbSBzdGF0aXN0aWNzIGFyZSBleHBvcnRlZCB0byANCnVzZXJzcGFjZSBhcyB2NGwy
IG1ldGEgZGF0YSB0aHJvdWdoIHRoZSBuZXcgZHJpdmVyLsKgIE5vdCB0aGUgdjRsMiBjb250cm9s
cy4NCg0KVGhlIGNvbnRyb2xzIGxpa2UgYnJpZ2h0bmVzcywgY29udHJhc3QgZXRjIGFyZSBleHBv
cnRlZCBhcyB2NGwyIGNvbnRyb2xzLg0KDQpUaGFua3MsDQoNCkJhbGEuDQoNCg0KPiBuZWVkIGZv
ciBhIG5ldyBkYXRhIGludGVyZmFjZSBpbml0aWFsbHkuIEhvd2V2ZXIgSSBhZ3JlZSB0aGF0IHdl
IG1heQ0KPiBleHBhbmQgdGhlIHN0YXRpc3RpY3MgZm9yIGZ1dHVyZSBJU1AgYmxvY2tzIHRvIGlu
Y2x1ZGUgcmVnaW9uIGJhc2VkDQo+IHN0YXRzIChXZSBhcmUgYWxyZWFkeSBpbiBkaXNjdXNzaW9u
IHdpdGggdGhlIGRlc2lnbikNCj4+IEZvciBhbGwgb3RoZXIgSVNQcyB3ZSd2ZSBiZWVuIHdvcmtp
bmcgdG93YXJkcyB1c2luZyBzdHJ1Y3R1cmVkIHBhcmFtZXRlcg0KPj4gYnVmZmVycyB0byBwYXNz
IGRhdGEgLSBhbmQgd2UndmUgYmVlbiBtYWtpbmcgdGhhdCBmb3JtYXQgZXh0ZW5zaWJsZSwNCj4+
IHdoaWNoIEkgdGhpbmsgY291bGQgYWxzbyBiZSBhIGRlc2lnbiB0aGF0IGNhbiBhcHBseSB0byBz
dGF0aXN0aWNzLg0KPiBUaGF0IHNvdW5kcyBncmVhdCBhbmQgd2UgY2FuIGNlcnRhaW5seSBleHBs
b3JlIGFsaWduaW5nIHdpdGggdGhlDQo+IHN0cnVjdHVyZWQgYnVmZmVycyBmb3IgaGlzdG9ncmFt
IGRhdGEgYW5kIGFueSBvdGhlciBmdXR1cmUgc3RhdGlzdGljcy4NCj4NCj4gVGhhbmtzLA0KPg0K
PiBCYWxhDQo+DQo+PiBUaGlzIHdvdWxkIGdyZWF0bHkgcmVkdWNlIHRoZSBvdmVyaGVhZCBvZiBt
YW5hZ2luZyAnb25lIGNvbnRyb2wgcGVyDQo+PiB2YWx1ZScgLi4uIG9yIHRoaW5ncyBsaWtlIHBh
c3NpbmcgbGFyZ2UgdGFibGVzIChsaWtlIGEgbGVucyBzaGFkaW5nDQo+PiB0YWJsZSBwZXJoYXBz
KSB0aHJvdWdoIGNvbnRyb2xzLg0KPj4NCj4+IC0tDQo+PiBLaWVyYW4NCj4NCg0K

