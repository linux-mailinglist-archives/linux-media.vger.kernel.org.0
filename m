Return-Path: <linux-media+bounces-41790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B88A0B44B37
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 03:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 403531895EAE
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 01:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661061EF0B9;
	Fri,  5 Sep 2025 01:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SbBkJePj"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011070.outbound.protection.outlook.com [40.107.130.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A101E51E1;
	Fri,  5 Sep 2025 01:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757035373; cv=fail; b=gGE4KyDcuXmhVV47ooV9ILAhZ4kxeIT8ml5ukvFjLY28hi6gSIDjF7bAohNXeyNcqKiki/XD+6/l106gOUyhxarvoKVf0PM8aTWB+U3m2T2iW75lOOOfJq+jeUnDxedqA8vdgTA/ujeiAhzuN9io08qAyJdBPyZiyBhwoPzGTfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757035373; c=relaxed/simple;
	bh=xNEWTTMnyT98hpnD+/dYAVcActZ9wbs0AH2+foOX8EQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qSacCg6iLfPPwsPE4dZODUxrMZXpEwftin9G6RFK/Sygw9briDFC16F5Iqyhyvt7MYaxeIrMvYJKRm5urVGiLnnPmaNgC9W/ecKJAa68dEBoooXQ36+awfdWRiBHZrpQudkFJLVd/StHTY9AYnbetdkQUHuwHtfXwKHk7KBFq+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SbBkJePj; arc=fail smtp.client-ip=40.107.130.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zyr9JPmNMm9T4j6RqDdNoA9uq8iLKGC5v7cuPWEgxvMAJkVZ8z9SbGGpyhE11izpKIQEQBY3kQe/GQoAIZIR08xxAXYHC4fcEmZ1/8osxTLQ1MX0z791/bT+RFnfNq8IfZQiBZXygdBP/lZVd0Owst6oWVmi+lDvJj73Y11TV62p9sOessKbiKDPzojcCWC8IzsVKGBW3MzQQQjOQYtINf6L0JqIt1QcOfbFo/je8E2c3rTmCar0XbLIa07ieI10Hlxa0NiHSjCF7yo2Vj4JjkR8z+CK76RC9fLfiVJSAutKtgUFq5LFc/qItVJbUVH9h0u1yKRQ6zcLgKq1hfb9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNEWTTMnyT98hpnD+/dYAVcActZ9wbs0AH2+foOX8EQ=;
 b=ON7eHH/K8R7egaDh30cPvFQalDpcV0na7B3Z1uK+pMZmAb/AffOX/r79Pb/fy/kXn3dEqkKuO/Dwogu12aFIrUNgEh3kWBuxuMa/3GVd3sOWS0u6QMcA5SHacusc/CYf7keTI3bQGJuiSMj15kBR/C1cWf111/LmZIYmC6ZQwWY3g23YcvFSka4P7GykADuawNQwhzOrx0Fv2UJIzAsuXMRfevYRE5PReXgrtKj3+LTel+Cz+gXB192lmiMxjY0eOAv/897L1peg6pdW1QtabLkejSfeuLMrfnUe1XOfd3b6QesoCQRexMdZjLVZvRmvdReMruYug36uW2T/9ZMLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNEWTTMnyT98hpnD+/dYAVcActZ9wbs0AH2+foOX8EQ=;
 b=SbBkJePjQXxG5saIGtoBL6Bgf+wWu+vCT5bCgY8JQoX075lxOwEsX96aBTKRfm+tQg2KUu3s9+FMrzc8fG3P7R0qpI5sJ/k/Z+6XrMGoO8zn56W3kUFcx70xbJCxibe1IOQy+FTn1rda0w8HPBsCjTXAITfvJQTHkx4cYzQ5RlLhMi43Hnnxyzc8wN1V4lwgrUQ5VTpiWTYclbCSc6IoDkSgZLUGqmSDEz5Kvxn2qVbyksQkrbtniDncSoX0mzAVPK2b082Vs557pwiG9VHf/RX3/wdUPTwlyypDfKkDCAFOssr1Zus8IUQGU/w2XrYOsW8x4c2l9NRn3+QVShQaqA==
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DB8PR04MB7161.eurprd04.prod.outlook.com (2603:10a6:10:124::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 01:22:47 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 01:22:47 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Marek Vasut
	<marek.vasut@mailbox.org>, Nas Chung <nas.chung@chipsnmedia.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx
	<linux-imx@nxp.com>, "jackson.lee@chipsnmedia.com"
	<jackson.lee@chipsnmedia.com>, "lafley.kim@chipsnmedia.com"
	<lafley.kim@chipsnmedia.com>
Subject: RE: [EXT] Re: [PATCH v2 0/8] Add support for Wave6 video codec driver
Thread-Topic: [EXT] Re: [PATCH v2 0/8] Add support for Wave6 video codec
 driver
Thread-Index: AQHcHRxcxZ7rHCUBjkWTGgLDQqLCmLSDBGuAgAAjrICAAAYKAIAAnjlg
Date: Fri, 5 Sep 2025 01:22:47 +0000
Message-ID:
 <PAXPR04MB825499BA447B4000AB8329A6E703A@PAXPR04MB8254.eurprd04.prod.outlook.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
	 <f03d0ae0-d28b-4b06-8f63-9d06f15c0522@mailbox.org>
	 <fcfa00b5ae102d76b02ce1667d27822e6d2c3c81.camel@ndufresne.ca>
	 <472aac3c-9d3e-4892-8d6c-665fa6793464@mailbox.org>
 <59e87d8e346bb16b225382b9a4500e1b16bbf776.camel@ndufresne.ca>
In-Reply-To: <59e87d8e346bb16b225382b9a4500e1b16bbf776.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8254:EE_|DB8PR04MB7161:EE_
x-ms-office365-filtering-correlation-id: d19b94e5-ea29-43ce-8657-08ddec1ab935
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a1BOMHgyL0lhWFN6ZVhVYnU5by9TMEkrVVJRb1grLzk5WWEwNVdRVEl4VEVL?=
 =?utf-8?B?b0YxTVBlZndZck84U2FkNU94UVRpVVFuUW8rRzVuKzZRa2M1b29VUldyLzF2?=
 =?utf-8?B?Ym9GUjhtRHgybitFUXJkUzlOSmVKeVpBWGVIREtTR29NU3J3WG5HVE4rNVZs?=
 =?utf-8?B?MVFvU1pxSEZyS0VjdjMxdXgwSCtST1pmeG5yZ2hvdkxjb1ZzemtoL0VueXVz?=
 =?utf-8?B?QjgxVlRHSEdiVEo4SUljK3ZWRFpDNjdpWGtONkV4L2Jod0F6QytkRDdpeEtt?=
 =?utf-8?B?aDFkUWlxTERwZFBTTXUvdVFnZlU0TnMwWWNHQ2NYLzFSWWxXODhtdWlIL2pK?=
 =?utf-8?B?OVN2akdPUktNVlN2MzZXb3h2Y3ZjMkFUcnV4UnVwVTlOYjVEMjdiR0liTFlD?=
 =?utf-8?B?N3kxN2VvVldXTU10R2N5QXk4RG4wbHN5YktMWjhNNGhtSlRjcnQ5cE1UTlYw?=
 =?utf-8?B?NDdzUUh6SFRnajg2UjhIN2N6bkpMcG9QS0tKVUdCT21jSnVrQ2xuWGh6L2xo?=
 =?utf-8?B?czFHMC91RjQ0S3ZEUmVRbEVjL0d4cmNQRXQrVHcxTFNZN281YmFxeTFHK1Bt?=
 =?utf-8?B?Wm5HeXVEV2RlbHI1SXJRRm94M3d6QnVVV3V6S2ZDa201WjIxRnVFcUxySDFO?=
 =?utf-8?B?YTNqZ1pLSVc5RVNaem1jZlVFZW1NUGU4VWVhbkQranFJUHFUeUltZEw2b1JO?=
 =?utf-8?B?bUptc2NtMGt1U2FaT20rTUgwK2FVM0txcDZnU01zNWg2Mm8wTVJBQmVXUHM4?=
 =?utf-8?B?NUZKbTNmd2FETnA1WVJRTmlTUTVoeEJuKzdVSFFVVlNRbHdPdldTU3liaEo2?=
 =?utf-8?B?Vk9CZEt2TnpOMTFMV2Njb1FXUHovSVZkR2hUNDhCbjg0OHFRR0gvQWJab1E3?=
 =?utf-8?B?b0VqaWNFSVhaL1k1bXBqMnkwWjRaQy9mOU9xbHJNYVVQNk01ZVJMclVaMndS?=
 =?utf-8?B?NzFVcFIrU043VXk3aDVBU205VUJja1FtZU9ISnZ0Qm9XUnNGck9weDlId1k5?=
 =?utf-8?B?K2U4eTl5bkpaVzhmSTBuVXQ0bU1kcFJzbEdwcDZjUTNrS0tmeXpDcWpuTHVr?=
 =?utf-8?B?SkJLaTFwd3N6NDdzWTBOSzBOc09pa2VabTB4OVpMV041UXR6bTRHZGZDT3hJ?=
 =?utf-8?B?bEFBTFc1cjFIcW8yenJiRTdIRXFXTWZDMHdML2NNT09zTWJLbmttM24zOWpL?=
 =?utf-8?B?cElRZjJQL09OcG8xZUJHcHp4bjVOWjhSOU1RQUR2M3diWjFYcEFNNHFZRU10?=
 =?utf-8?B?UVhXb3dweG1rMUtscE50QWN5MmRZcm1iUmFhSGVkMklTVEtVeVh2VnpSVTRN?=
 =?utf-8?B?ZG1Ia0dBejZhdlVuZC9YeTFPaVUxeFYrb2ZmQ29LUXZmL0RpRUlNb1hBNTBE?=
 =?utf-8?B?OFZML1FsNDdpeXpSbHF0WWJOcFFOUmFyY2NzYTRKcVV0a3d6QlBEMHhxdjdD?=
 =?utf-8?B?enVzZzFrcXdvUnE3cmFkRVpjR0p6c1RhUWcvdnJLRWVJM05lT2pZY3pSNVpi?=
 =?utf-8?B?Zzdkb1hQOGxvdG51RDQ0WlBYZ3ovbEFESzIzaXNSb2d2TDBYb0did1h5azJw?=
 =?utf-8?B?dCs4TXFySXl4TzJlZ3g2UnUwMy80VGMxbkxYUUxwb3hoU0Q2MXBxK08vMTdE?=
 =?utf-8?B?UlIyaTRERVJvK2M3WGxDZDJKODR3K1cwTW9qaSt1SDgvQlNJZzVML1U0dlBz?=
 =?utf-8?B?SnNvTnZ5ZzRLeW9RcVd1QlZnbnduejJiVytBNzREVXhoL3FaUUJMeG1YOFRN?=
 =?utf-8?B?VDRwbVFOUHl4SGt5OFRZZHN2RDRsOXBzL0tpektaVWVqZWkzVkZlTkZwYzdN?=
 =?utf-8?B?QkRZUW44U1lYK3lISFM5bTZTb291Q2hXbm8walVBcmJ5aHZDd0lkbFRkeWo5?=
 =?utf-8?B?U2lHTVJZdHRtd21OQjhRYmVTTHQyZVFKSHBrQnQ4VkdyR2F4WDQzYTIzNFB1?=
 =?utf-8?B?TzlvaldNME5mZkFVRkpKbVo5Z0ZFUFdDdXNwNUViNmpnbnh5V0FDT1NpbDVj?=
 =?utf-8?B?TnFybzU3MjlBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEVFQ2w0cTUwT1pzSVBIMFdndTVZK3NldDl1NWtKaHM0RW9GendMSkk4V2Jq?=
 =?utf-8?B?Z3ZmT0ZING1kK2pmaWlmOXQzYlZ6QUpacTIzdXFpckZlRWU2aDlxYWdjSEw3?=
 =?utf-8?B?b0hkZ1V0Zkg1UXdaYzExUkZGanNzMUN4ZDZYOTREbWhqTnkvZ0ROZXVCdkdC?=
 =?utf-8?B?ZDQ4dnp4NXpBaE56TXU2Mk9vdWdJbEd0UjEzSlVESlFuMVRIaExRby9nVzEw?=
 =?utf-8?B?QnhjM2s4OHJURUZyS2R2SldOSmpTWDlaTW5DNHVpM1Vsd0d5NDkxVVNsWGFE?=
 =?utf-8?B?elRXbWVUUVptQmtnUGNoajVPaTBTdWNucmlsTzN4ZEtLZm00QmdXTXpIVkR4?=
 =?utf-8?B?NWo1RGZ1eis2c2FDc0k0cENhaW9RL1JFWlcxOUdsTVpDejhUTE96NStZRy9i?=
 =?utf-8?B?c2t6L1pkUklGZFJqRGlBcWh1cTBKdTROQktVZUcyZ2RLK1lEREVURHJaVUI3?=
 =?utf-8?B?Q3hZTTVZQVhIN3lzaW1jd2NLNVJ4eHdYRXd6V0dGN2JJaUxkZ0NSTWtLQVBa?=
 =?utf-8?B?cmJndTk5bkxORkVzQWcra1ZyL1lYd29Nckwrd3NTV3h6V1NhLzhzWUNsOXZS?=
 =?utf-8?B?N1NaQ2NTT0lBbmNlOGZ1a0tvWHozM0hFdXpqRWFMaS9zaUJwRlB4WU1DOVRC?=
 =?utf-8?B?QjRUUitTWlF2NGtBSzhIeHRJcHZKcFRvRzVIWFV5dEd5V0UycGY1bjJCcXQv?=
 =?utf-8?B?THVYLzh6N3kyTVVzamEyMjhDNHNZM3M0aHlTdy9SclovUzZhYVNsQ0FvSFpW?=
 =?utf-8?B?UlBRdGM2NmdFWXN6QnVDd0ZhZmxmalA4M24rVnc0QUVUTXQrN2JnRnZQaFdR?=
 =?utf-8?B?Ym1HUlVCRmxYY1cvYUZRQXFtVU5MemlWVm5KZTRRSUh6R2FmMi9lNUIzdTVQ?=
 =?utf-8?B?SjRwdWFkVXV1cHdpZHVnTkNQRklDdEx4azJxQlI1U3NHdU5jejFLYTI3cnRD?=
 =?utf-8?B?S3ZGaUhmUlF0Sk1IOEorcldFOVpiWXJXemcxVTBPdUt3UjdlU2ZTcjFpMWdR?=
 =?utf-8?B?OTB1VGRkZloyZWk3WVQ0RVN6T3FTdTJpTU5FVVhmVFp2L1J3YmJEaDNTVkN1?=
 =?utf-8?B?Q0lNSlE3cExVUFk1Q0VkdDZmeEpNWHR5Mk9BZzZjaklPRml6akxCWEhwOE1O?=
 =?utf-8?B?Tk85Ky9jOXpBSno1bXZFTUxCUW5yZFkzbitIUFJkNmRtRzhTSFFDRjFmMnFH?=
 =?utf-8?B?djBwcTdsQ09RT2lIM0VsQmNWdkJWL0dyRE53YU5aVVhXS3dTZVNWSnlnQ28w?=
 =?utf-8?B?M0VsK3diWFJKSzliQnZOcEdEVUdFb1VTY3hoYi81aG5jZlQ0U3BYb25TTWww?=
 =?utf-8?B?RURYcnBpTGkvcCtKd3lwanZGTTJRcU4ydXRHc3JYSTZPZnhERGJIekJqRmRW?=
 =?utf-8?B?MmF6bjBjbEp5ZEU0V3NuL0RZZ29Jd0hjNFNmQ0pjR1lNWnVpZ0VPdkdDaEUz?=
 =?utf-8?B?Mm4wS0dLUnNzNFR2ZkExUk41ajFYbEdqTS9uNGpSU0JCczd2SktoUkVFcko3?=
 =?utf-8?B?QjJRcXBEU1Q5ZmJRNXlMZ0xhdXRTZEpjYzFsemVteVpKYXkzdmhhRUxXQk91?=
 =?utf-8?B?TEpPUUxWTnJRSG9rUVRzTTFkeFZ4d3BwRnl1N0ZoR3luMHBVcklUNjJ0WE9O?=
 =?utf-8?B?TytYRk14QXE2TU9Tc2NvV2F1Q1JMR2lvd3lqWmFDRjV5YkRjTE9oQjBiTDZN?=
 =?utf-8?B?cG9nRlVZU294WU85cVEwS2MxUDJYSm0rTTEwdXB5WkJBZDdjVWhSZ1U1MDV0?=
 =?utf-8?B?TC95amh6YVJBN1lPMWd5NHU4dkU3VGprb2xWMi9yT0VRdkVYK2QvUk1ELzF5?=
 =?utf-8?B?TGJ5c0pRVlkzM054WUhwNTE3NXlYbmdZYmdNenFlT1VJblNCZmhYOGMvTVI4?=
 =?utf-8?B?Ymx4ODNhRlpFUURZSjJWa2hySGhmYS83THM2MHYzZzdsUHgyUThaeG90YlVo?=
 =?utf-8?B?S0NtSkRicHZYTk5hMWtWbkRCMkpqZDQ1QTl6ZHJPMWJFQUhRc245RFpaOHU2?=
 =?utf-8?B?ajB3c0FVcUJ1dVpVZjVnNVNVKzFnckVvUVNpb2doamxQc293UVIxeWoxNzVx?=
 =?utf-8?B?VlV2bGZEbWtnYm4wUFMvV0RFRkR4OTlQR3ozeDVaMUN0OSt4eTVrbXRQNmhL?=
 =?utf-8?Q?lHtM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19b94e5-ea29-43ce-8657-08ddec1ab935
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 01:22:47.7041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ITu0aqyRFeDvtyAQUp3NioX8fSwZHSoeiCSFC2puV7HnINCYdT0/dASodgilBDneTyTASDq5Y6U/WxzLy3keog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7161

SGkgTmljb2xhcywNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogTmljb2xh
cyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVzbmUuY2E+DQo+U2VudDogVGh1cnNkYXksIFNlcHRl
bWJlciA0LCAyMDI1IDExOjU0IFBNDQo+VG86IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBtYWls
Ym94Lm9yZz47IE5hcyBDaHVuZw0KPjxuYXMuY2h1bmdAY2hpcHNubWVkaWEuY29tPjsgbWNoZWhh
YkBrZXJuZWwub3JnOyBodmVya3VpbEB4czRhbGwubmw7DQo+c2ViYXN0aWFuLmZyaWNrZUBjb2xs
YWJvcmEuY29tOyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsNCj5jb25vcitk
dEBrZXJuZWwub3JnDQo+Q2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPmtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxp
bnV4LWlteCA8bGludXgtaW14QG54cC5jb20+Ow0KPmphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNv
bTsgbGFmbGV5LmtpbUBjaGlwc25tZWRpYS5jb20NCj5TdWJqZWN0OiBbRVhUXSBSZTogW1BBVENI
IHYyIDAvOF0gQWRkIHN1cHBvcnQgZm9yIFdhdmU2IHZpZGVvIGNvZGVjIGRyaXZlcg0KPg0KPkhp
LA0KPg0KPkxlIGpldWRpIDA0IHNlcHRlbWJyZSAyMDI1IMOgIDE3OjMyICswMjAwLCBNYXJlayBW
YXN1dCBhIMOpY3JpdMKgOg0KPj4gT24gOS80LzI1IDM6MjUgUE0sIE5pY29sYXMgRHVmcmVzbmUg
d3JvdGU6DQo+PiA+IEhpLA0KPj4gPg0KPj4gPiBMZSBtZXJjcmVkaSAwMyBzZXB0ZW1icmUgMjAy
NSDDoCAyMzo0NyArMDIwMCwgTWFyZWsgVmFzdXQgYSDDqWNyaXTCoDoNCj4+ID4gPiBPbiA0LzIy
LzI1IDExOjMxIEFNLCBOYXMgQ2h1bmcgd3JvdGU6DQo+PiA+ID4gPiBUaGlzIHBhdGNoIHNlcmll
cyBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIHRoZSBDaGlwcyZNZWRpYSBXYXZlNg0KPj4gPiA+ID4g
dmlkZW8gY29kZWMgSVAsIGEgY29tcGxldGVseSBkaWZmZXJlbnQgaGFyZHdhcmUgYXJjaGl0ZWN0
dXJlIGNvbXBhcmVkDQo+dG8gV2F2ZTUuDQo+PiA+ID4gPg0KPj4gPiA+ID4gVGhlIHdhdmU2IGRy
aXZlciBpcyBhIE0yTSBzdGF0ZWZ1bCBlbmNvZGVyL2RlY29kZXIgZHJpdmVyLg0KPj4gPiA+ID4g
SXQgc3VwcG9ydHMgdmFyaW91cyB2aWRlbyBmb3JtYXRzLCBpbmNsdWRpbmcgSC4yNjQgYW5kIEgu
MjY1LA0KPj4gPiA+ID4gZm9yIGJvdGggZW5jb2RpbmcgYW5kIGRlY29kaW5nLg0KPj4gPiA+ID4g
V2hpbGUgb3RoZXIgdmVyc2lvbnMgb2YgdGhlIFdhdmU2IElQIG1heSBzdXBwb3J0IFZQOSBkZWNv
ZGluZw0KPj4gPiA+ID4gYW5kDQo+PiA+ID4gPiBBVjEgZGVjb2RpbmcgYW5kIGVuY29kaW5nIHRo
b3NlIGZvcm1hdHMgYXJlIG5vdCBpbXBsZW1lbnRlZCBvcg0KPj4gPiA+ID4gdmFsaWRhdGVkIGlu
IHRoaXMgZHJpdmVyIGF0IHRoaXMgdGltZS4NCj4+ID4gPiA+DQo+PiA+ID4gPiBPbiBOWFAgaS5N
WCBTb0NzLCB0aGUgV2F2ZTYgSVAgZnVuY3Rpb25hbGl0eSBpcyBzcGxpdCBiZXR3ZWVuIHR3bw0K
PnJlZ2lvbnM6DQo+PiA+ID4gPiBWUFUgQ29udHJvbCByZWdpb24sIE1hbmFnZXMgc2hhcmVkIHJl
c291cmNlcyBzdWNoIGFzIGZpcm13YXJlDQo+bWVtb3J5Lg0KPj4gPiA+ID4gVlBVIENvcmUgcmVn
aW9uLCBQcm92aWRlcyBlbmNvZGluZyBhbmQgZGVjb2RpbmcgY2FwYWJpbGl0aWVzLg0KPj4gPiA+
ID4gVGhlIFZQVSBjb3JlIGNhbm5vdCBvcGVyYXRlIGluZGVwZW5kZW50bHkgd2l0aG91dCB0aGUg
VlBVIGNvbnRyb2wNCj5yZWdpb24uDQo+PiA+ID4gPg0KPj4gPiA+ID4gVGhpcyBkcml2ZXIgaGFz
IGJlZW4gdGVzdGVkIHdpdGggR1N0cmVhbWVyIG9uOg0KPj4gPiA+ID4gLSBOWFAgaS5NWDk1IGJv
YXJkDQo+PiA+ID4gPiAtIHByZS1zaWxpY29uIEZQR0EgZW52aXJvbm1lbnQNCj4+ID4gPiA+DQo+
PiA+ID4gPiBUZXN0IHJlc3VsdHMgZm9yIGRlY29kZXIgZmx1c3RlcjoNCj4+ID4gPiA+IC0gSlZU
LUFWQ19WMSwgUmFuIDc3LzEzNSB0ZXN0cyBzdWNjZXNzZnVsbHnCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpbg0KPj4gPiA+ID4gMzUuNTE5IHNlY3MNCj4+ID4gPiA+IC0gSlZULUZSLUVYVCwg
UmFuIDI1LzY5IHRlc3RzIHN1Y2Nlc3NmdWxsecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aW4NCj4+ID4gPiA+IDE3LjcyNSBzZWNzDQo+PiA+ID4gPiAtIEpDVC1WQy1IRVZDX1YxLCBSYW4g
MTMyLzE0NyB0ZXN0cyBzdWNjZXNzZnVsbHnCoMKgwqDCoMKgwqDCoMKgIGluDQo+PiA+ID4gPiA4
MS41NDkgc2Vjcw0KPj4gPiA+ID4gLSBBbGwgZmFpbHVyZXMgYXJlIGR1ZSB0byB1bnN1cHBvcnRl
ZCBoYXJkd2FyZSBmZWF0dXJlczoNCj4+ID4gPiA+IC0tIDEwYml0LCBSZXNvbHV0aW9ucyBoaWdo
ZXIgdGhhbiA0SywgRk1PLCBNQkFGRg0KPj4gPiA+ID4gLS0gRXh0ZW5kZWQgcHJvZmlsZSwgRmll
bGQgZW5jb2RpbmcgYW5kIEhpZ2g0MjIgc3JlYW1zLg0KPj4gPiA+ID4NCj4+ID4gPiA+IFRlc3Qg
cmVzdWx0cyBmb3IgdjRsMi1jb21wbGlhbmNlOg0KPj4gPiA+ID4gdjRsMi1jb21wbGlhbmNlIDEu
MjkuMC01MzU5LCA2NCBiaXRzLCA2NC1iaXQgdGltZV90DQo+PiA+ID4gPiB2NGwyLWNvbXBsaWFu
Y2UgU0hBOiAyYTkxYTg2OWViOGEgMjAyNS0wNC0xMiAxMTozNTo1Mw0KPj4gPiA+ID4NCj4+ID4g
PiA+IENvbXBsaWFuY2UgdGVzdCBmb3Igd2F2ZTYtZGVjIGRldmljZSAvZGV2L3ZpZGVvMDoNCj4+
ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFpbDoNCj4+ID4gPiA+
IC4uL3V0aWxzL3Y0bDItY29tcGxpYW5jZS92NGwyLXRlc3QtY29udHJvbHMuY3BwKDExODApOg0K
Pj4gPiA+ID4gIWhhdmVfc291cmNlX2NoYW5nZSB8fCAhaGF2ZV9lb3MNCj4+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoCB0ZXN0IFZJRElPQ18oVU4pU1VCU0NSSUJFX0VWRU5UL0RRRVZFTlQ6IEZB
SUwgVG90YWwNCj4+ID4gPiA+IGZvciB3YXZlNi1kZWMgZGV2aWNlIC9kZXYvdmlkZW8wOiA0OCwg
U3VjY2VlZGVkOiA0NywgRmFpbGVkOiAxLA0KPj4gPiA+ID4gV2FybmluZ3M6IDANCj4+ID4gPiA+
DQo+PiA+ID4gPiBDb21wbGlhbmNlIHRlc3QgZm9yIHdhdmU2LWVuYyBkZXZpY2UgL2Rldi92aWRl
bzE6DQo+PiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZhaWw6DQo+
PiA+ID4gPiAuLi91dGlscy92NGwyLWNvbXBsaWFuY2UvdjRsMi10ZXN0LWNvbnRyb2xzLmNwcCgx
MTY5KToNCj4+ID4gPiA+IG5vZGUtPmNvZGVjX21hc2sgJiBTVEFURUZVTF9FTkNPREVSDQo+PiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgdGVzdCBWSURJT0NfKFVOKVNVQlNDUklCRV9FVkVOVC9E
UUVWRU5UOiBGQUlMIFRvdGFsDQo+PiA+ID4gPiBmb3Igd2F2ZTYtZW5jIGRldmljZSAvZGV2L3Zp
ZGVvMTogNDgsIFN1Y2NlZWRlZDogNDcsIEZhaWxlZDogMSwNCj4+ID4gPiA+IFdhcm5pbmdzOiAw
DQo+PiA+ID4gPg0KPj4gPiA+ID4gTm90ZTogdGhlIGZhaWx1cmVzIGFyZSBhbGwgcmVsYXRlZCB3
aXRoIHRoZSBlb3MgZXZlbnQuDQo+PiA+ID4NCj4+ID4gPiBGb3Igd2hhdCBpdHMgd29ydGgsIHRo
ZSB3aG9sZSBzZXJpZXM6DQo+PiA+ID4NCj4+ID4gPiBUZXN0ZWQtYnk6IE1hcmVrIFZhc3V0IDxt
YXJlay52YXN1dEBtYWlsYm94Lm9yZz4gIyBOWFAgaS5NWDk1IHJldi4NCj4+ID4gPiBBMA0KPj4g
Pg0KPj4gPiBEbyB5b3UgbWluZCBzaGFyaW5nIHdoYXQgdGVzdHMgeW91IGhhdmUgZG9uZSA/IEFy
ZSB5b3UgY29uZmlybWluZw0KPj4gPiB0aGUgc2FtZSBmbHVzdGVyIGFuZCBjb21wbGlhbmNlIHJl
c3VsdHMsIGhhdmUgeW91IGRvbmUgbW9yZSA/IFNpbmNlDQo+PiA+IHRoaXMgaXMgbGFyZ2VseSBp
bnNwaXJlZCBvbiBXYXZlNSwgSSdkIGxpa2UgdG8gc2VlIHBlb3BsZSB0ZXN0aW5nDQo+PiA+IHJl
YWwtd29ybGQgcGxheWJhY2ssIHdpdGggc2Vla3MsIGR5bmFtaWMgcmVzb2x1dGlvbiBjaGFuZ2Vz
LCBkYXRhDQo+PiA+IGxvc3QuIE9uIFdhdmU1LCBsYXRlc3QgcGVyZm9ybWFuY2UgcGF0Y2hlcyBs
ZWFkcyB0byBjcmFzaCBvciBoYW5ncy4NCj4+IEkgZGlkIG5vdCB1c2UgZmx1c3RlciB0aGlzIHRp
bWUsIEkgdXNlZCBoMjY0IGRlY29kZSBvZiAxOTIweDEwODAgNjANCj4+IEZQUyBzdHJlYW0uIFRo
ZSBwaXBlbGluZSB3YXMgdmVyeSBiYXNpYywgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZjoN
Cj4+DQo+PiBnc3QtbGF1bmNoLTEuMCAtdiBmaWxlc3JjIGxvY2F0aW9uPS90ZXN0Lm1wNCAhIHF0
ZGVtdXggISBoMjY0cGFyc2UgIQ0KPj4gdjRsMmgyNjRkZWMgISBmcHNkaXNwbGF5c2luayB0ZXh0
LW92ZXJsYXk9ZmFsc2UgdmlkZW8tc2luaz13YXlsYW5kc2luaw0KPg0KPlRoYW5rcyBmb3IgdGhl
IGRldGFpbC4gU2luY2UgeW91IGhhdmUgYSBydW5uaW5nIHNldHVwLCBwZXJoYXBzIGNvbnNpZGVy
IHRlc3RpbmcNCj53aXRoIHRoZSBmb2xsb3dpbmcsIGxlZnQvcmlnaHQga2V5Ym9hcmQgYXJyb3cg
d2lsbCBsZXQgeW91IGp1bXAgYXJvdW5kIGluIHRoZQ0KPm1lZGlhLg0KPg0KPiAgZ3N0LXBsYXkt
MS4wIC0tYXVkaW9zaW5rPWZha2VhdWRpb3NpbmsgLS12aWRlb3Npbms9d2F5bGFuZHNpbmsgL3Rl
c3QubXA0DQo+DQo+VGhhdCB3b3VsZCBhdCBsZWFzdCBjb3ZlciBzZWVraW5nIHVzZSBjYXNlcy4g
SSBwcm92aWRlZCBOYXMgYSBzdHJlYW0gdGhhdA0KPmFnZ3Jlc3NpdmVseSBkbyByZXNvbHV0aW9u
IGNoYW5nZXMgdG8gcmVwcm9kdWNlIGEgV2F2ZTUgY3Jhc2gsIEkgd291bGQgZXhwZWN0DQo+aGlt
IHRvIHRlc3QgYW5kIHJlcG9ydCBhZ2FpbnN0IFdhdmU2IHRvby4gSWYgeW91J2QgbGlrZSB0byBo
YXZlIHRoYXQgc2FtcGxlLCBsZXQNCj5tZSBrbm93LCBpdHMgbm90IHZlcnkgYmlnLCBhbmQgZnJl
ZSwgYnV0IEknZCByYXRoZXIgbm90IGRvIGF0dGFjaGVtZW50cyBvdmVyIHRoZQ0KPm1haWxpbmcg
bGlzdC4NCg0KV291bGQgeW91IHBsZWFzZSBzaGFyZSB0aGUgc3RyZWFtIHRvIG1lPyBJIHdhbnQg
dG8gdGVzdCB0aGlzIHJlc29sdXRpb24tY2hhbmdlIGNhc2UgdG9vLg0KDQpSZWdhcmRzLA0KTWlu
Zw0KDQo+DQo+cmVnYXJkcywNCj5OaWNvbGFzDQo=

