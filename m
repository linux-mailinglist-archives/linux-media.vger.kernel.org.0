Return-Path: <linux-media+bounces-38494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4E2B1291C
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 08:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3B81AA51F8
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 06:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064CA20110B;
	Sat, 26 Jul 2025 06:06:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020076.outbound.protection.outlook.com [52.101.227.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0449F7E9;
	Sat, 26 Jul 2025 06:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753509972; cv=fail; b=gZTBVmGG41MHAfeIkGdMQIYtSYPdIcE9WtkqbSIW6CVnu+yi3Adypv5MTiZEF79a5Z9mUlzS1Ec69BiXugOYA68m3xEbc94DzqsvYI9cGWtsNn+GDTC3nXa8Tm5WYGuNJEv40ke49IDoVIn/bz0876pmmL3gn/A4aiVI+nbQz/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753509972; c=relaxed/simple;
	bh=76+cM+VwSL2oNS9xI6Tg+/RrsoTB4Au07o58or5yo0o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hIvg3C8ElT8pauD+AyLjUv0iQluO6FESwDEQhd/lobabjJjmJFlkBs8GKcnnF9+uXLGzHSZOZ+rhMJlSjKfTNO7FLoA48Hetg+DwYU0Z462+6avG3UzYpHhH4eUsI49kTMziy+t0Dw5/1nMnL7rMdPUG+UDigkDAecafmpGtkXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0woj/czksm9XVm90RxsJvV+3HrvPNr4xRv38aZdSvOGSJfNAj5F0Au5aunewSHIU6V7knKjKPRyT9BbgR2Q4dfcDyZIYxKCvLiTrzoXlX424rVoIVpXFfX0VRmUnh+jN6C4XwVgEBU7VO5/aPSg/6h3t64xwA5/R5dsYCMSLKM2BoJoAh27ChdJYQoc1wI6BqP5BzzSQvl/qrLei1h+PzEab6rls3XxQZd/fuEq99sJNMR8C3WI/T4VgcJtvDrrLeuvkWAJeG777hSvjaovBideToc4rJvckYD3vcn3OVG8VVlv8QtCZk1/jXwuIDaDbFuPZv6ocHKZW1NnWaWz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76+cM+VwSL2oNS9xI6Tg+/RrsoTB4Au07o58or5yo0o=;
 b=dgnQ3P5g7E4QdfhjGLwlt+FIRgVjq1jDV6FTql6i2hdiX1evw+qFlLZut0N5hQGOoLh+zAKt2jyUUSePs8RHVp/stEM3EH6JiIDhNzRjBnYBasZba5FHNl4EWrkhgJarp/CxG4uHi4iNgkDXIwwhYPQ5VxGsyNU9vtWMmx1WXuHf0UIHfT4eWgwDeuFrm1hDUKs3xNeolLZLo9UMyugRMZX2gCf8u8YbjB9guiQ/cJfF/7KcQ1fTcIenk6Gb2tVOMmd2FM7is0JIZuV0pX3KCKYYF9xksi7aU59LzJ6l1wR6so0qLnTMUR6Z0HBqHSbsLE46/erGxwJIrNyukB9hLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN5P287MB4369.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Sat, 26 Jul
 2025 06:06:05 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8964.023; Sat, 26 Jul 2025
 06:06:05 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede <hansg@kernel.org>,
	=?utf-8?B?QW5kcsOpIEFwaXR6c2No?= <git@apitzsch.eu>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Matthias Fend <matthias.fend@emfend.at>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH v5 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHb/Ih6djfjLciEYkK3gvcBpDSgELRBx44AgACQNVCAAJNHAIABAbcv
Date: Sat, 26 Jul 2025 06:06:05 +0000
Message-ID:
 <PN3P287MB3519055FE42890F5F577B51BFF58A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250724104711.18764-1-hardevsinh.palaniya@siliconsignals.io>
 <20250724104711.18764-3-hardevsinh.palaniya@siliconsignals.io>
 <aIKi1BkNzNvsf5Tr@smile.fi.intel.com>
 <PN3P287MB35190A4AEE4C8D98142E7B6AFF59A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
 <175345442477.2567018.13588829522231689027@ping.linuxembedded.co.uk>
In-Reply-To:
 <175345442477.2567018.13588829522231689027@ping.linuxembedded.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN5P287MB4369:EE_
x-ms-office365-filtering-correlation-id: cd30418c-2826-4a21-2f43-08ddcc0a81d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UlhTamQ1bmQwelR1aktJOFpwL3VyVWxQVVdmVlNvUDlwejlTc2R4YW5adEcz?=
 =?utf-8?B?Q0V1S2ozRS9Nc3dYTmV3UStRSGRncUlXZ3hNeUQyaDdqbVViWjNPY1NyTTh4?=
 =?utf-8?B?YkFzc1R3ODdaKytGcTV0akFiSUl3OFdYcGlzTmRtemRMUEFkUTJmcFgvRC9p?=
 =?utf-8?B?K01TaGFmVG1SM3lJbEJsQWg0L0FwM1FQSFNSbi9zSkxlNE5KT3hPVUtDRC93?=
 =?utf-8?B?b28xcWJNdVN5R2FIaEl0YmU2djIvZ2dXV09BUkhScU9XMnRHVjJ4WVJxbjUz?=
 =?utf-8?B?NURxaTJyczJwdi80ekNEWVZ6eXRhMlkxOWhjcXZuUzZ1V1NsQU9NcEd0cHYr?=
 =?utf-8?B?WFZtaWVNTkcwMGdMNENwQW9SSTBxREszRUYrYjlsTEhJYjN6RS9kbW9rc0Ix?=
 =?utf-8?B?ZjlLYjV5VEFFdTU5aUl4OHlaR2N1Ym5JQlZVNmtqWkNSRlhVTGRjN1IyY3Zy?=
 =?utf-8?B?eTVJQVlkVG1sNDMrUjN5SXcyZC9PbkdvM1QzOElzVFQ1aW9FTFZSR081bXBo?=
 =?utf-8?B?SStDVkRuenZ0RjcvcnFjUk5LNm9kRWc1UUhMUWQ4RmxTN3lvaTFaWVFlV0dj?=
 =?utf-8?B?ZFp0SXZ3R2NiUTA2M3gyaThqWGxnWXJ5aUZRMXpJMG0vVkpIZDQ3YzhuZGw1?=
 =?utf-8?B?cWw4UGprMWNaY3JJQmdyWC81N2JjNWdJTUhDT3Y0WFhaTndrZzNLUFJmVlR5?=
 =?utf-8?B?SnpCS3NnbEZndXBwNTk1OTRiQ29QVk5VQVlnUkliUWtlT0NvRytJQWhqMW9M?=
 =?utf-8?B?ZGtiR1JzWmNzei90U2xLNDROaW1DMTh2OGE2YklZb0EwRTdXT2VVT0tBK3VS?=
 =?utf-8?B?MVAwa2Z6Sm1veTR1aTdKUzdSb0JKT0xsclFPam9IYXNGbVEzSDYvazZleUkv?=
 =?utf-8?B?a2puY0V1K0MyeFJIMDRQbWJxYTl2bjcwTkpPdFNzdC9sSjZrN2FtYS9pbTUr?=
 =?utf-8?B?UWZ2K2pZcEVmejhiUExiR05nVS9uWlE1OS8va3lRNUVmZXpSVGt6UWVoY3lJ?=
 =?utf-8?B?ZWszSW1jWHl6QUE5RXhQa1pMQnYybml2Sjdob3BlMVRCbXRSdFMxdmxhaUxt?=
 =?utf-8?B?OUhTWi9jb3dzWVZLbFBZRGpqVTFPMHJiK2lqYVJQSWk1MkI5UzIzak1aTGVu?=
 =?utf-8?B?TmZOK1dXSUwvcDdXVEZXWldrQWVHV2plQkcvT0hSODNsenUydDQxZEcvWXkz?=
 =?utf-8?B?enZ2TEl5WGRzUnFJQWtTYWVNN2lNMkE0bGs1ai9ZWHlvSTdYSFlZdFRFYmdN?=
 =?utf-8?B?OUVzK0NiZDBTTzk0RVhITjNnTVkxSmZoaUU5NE1hNDNoQi81S2VzNHdydk5X?=
 =?utf-8?B?NHpGN2FUUjNlU3c3QURhL2E5TXVTYllkYTJORG9CZGF3VTZnRjQwSFExVHFq?=
 =?utf-8?B?bGhOdmlHNU9YSGlFYVl0RnpWbHduTVE2VjZIVVcyODB1K2JOTWZydlVMcnNH?=
 =?utf-8?B?aXlCNGcrVWFYV0ZOUWVPUWcxRDRBMUpmM2piNThSai9aQ2hSRWxTVFZjRHFn?=
 =?utf-8?B?OGg1N2pSUThaZjVHWTN1YW5yMXpHQzF0R0U5NnpaQ1BHU3d2S0Nyejg4ZnlP?=
 =?utf-8?B?Y1crdXFzaE4yK2ROeWZ0VlAzQ1JrUGtJREZuek5PWG90OGFTTFpjcmZKbU1N?=
 =?utf-8?B?NE1ZUlRPNWd4R20wWWJiQnVpenJIaTRJWC81SDZTQzhJdzhSNnhQTjkxNTBy?=
 =?utf-8?B?MDA3bThxNDNvVFdsZVBYODRGUHhJQmdBcEcrdUZ5MGM4cVAvbEcxc3RvVEpO?=
 =?utf-8?B?amxqQlduZkF1RFdabk8xUWJLcDFTQkZHbWtRMEh6NG9zaHlVd2oxY3k0OEpS?=
 =?utf-8?B?OTZCS0xXWFRwcUFQbVhBMjYvanVaeFE0dkxWYTF2OFJXVUVQZTZkb3ZkVWI0?=
 =?utf-8?B?VXJ6SG80T3ZwVTZlM0ZhYXlna004ZjNmUzBMSGl1ekxFMXpzcnFlSE9uTHBQ?=
 =?utf-8?B?a3liM3B5M25pdXUrNE5ZTUJmMUpPOUpPdDJmSUxMZSt1VEZXUWhhdUpiNU0x?=
 =?utf-8?B?eW11a2xMQ0ZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L09haW4zNGZpeGhiUTVBL3IyZnVQZTRUUkZNUU1pSkgvR0N6Z3o0NG15dW9E?=
 =?utf-8?B?VTZnbDZHK3AxVXpJUzIyRUFydm1OWHU0TnRiejY0YXVpU1MrMk8yeFF4cmhs?=
 =?utf-8?B?NG1zRkd4MTFzQTY4akN5cUxQMXlIdkxQT3dMQVVuQWVwMDlnWkpzR1lNM01s?=
 =?utf-8?B?ako2RDJuQ05wYVF5U1JvY1hrWndaRDFxclh6VGcrQkRmWURFanRFTXNMbW9m?=
 =?utf-8?B?bkNYajd2cHovek15ZnFuNE9sbmRiNkdrZ2g4MkVtOHpQVHFmWUduc3FTVjI2?=
 =?utf-8?B?U01icWRtbERiTnlmNDEvcUVIbXZDS2NtODhRbXorRndiSFdid0JOaHorVDNF?=
 =?utf-8?B?MFhRSmx6L3hINW5lK0pvYjVaWnk3WDlQWEdRNHoxRzJjV09aekZFV1NtMmtp?=
 =?utf-8?B?QkVDUzFFNTB6WlphcC9mL0xWbmdPVHhyK1BBVXN3cllNWFl1QU5oaVU4aHVZ?=
 =?utf-8?B?bWxUa2h0VnlCZnNBS0NZbTVZZnNJeVloYUc0OGtmZ09wRGRqeDVXY1pzYTR3?=
 =?utf-8?B?T05OTlBBT2FmWlA1aDlhUEhvbytlQXZ6ZElkQ1IzZERuRjZpS0U4MlBObnRU?=
 =?utf-8?B?U0J0dDZLMGFmN3pWWTFWUmZBeHhsTnNacjgvRWZZNWIrUUd5WFJtemgrS0tR?=
 =?utf-8?B?TUtWM092MTdXL1VLcVh4TzlXQmsyRTM0bFk1UGVKRjAxaWZvdkd6SUlIN3Fo?=
 =?utf-8?B?OUdvTUxmc3NjNXhsQ0swTzYrTWc3UjJsZkw4blM3bExUNGNDcVppL3pyZkd1?=
 =?utf-8?B?SmJ3bFRwWnc0K3dzdEd4MzRSalJ3Z1NPcUpjMW5mUGVkYlVsUWEvT2lxSU1E?=
 =?utf-8?B?djZJelJaYU0vbks4SDNVVVFrd0pCWkxaMGpnaWxLbjJVR3VlQzM4WnRoZFNl?=
 =?utf-8?B?akNvQ3JyNkpQVnVER0dFbzlYOHpSMElobHVWTFpyU3Rmb0IvYVlJSC9DMFF5?=
 =?utf-8?B?bWxESEt1QkwvQ2wzYTVheFdxRXNvRGdPTzh5Vng0OEN0ei8yaEo0dE9WalRN?=
 =?utf-8?B?M2VWTXZDS0x6ak43NGtpUzVZRWhIQW5JOVlZcnptaCtWTTByZVZzT3RRb0ZR?=
 =?utf-8?B?dWdkTHpacVFJQWlTT2NvZDk3VmhFUHI2MGVweC9IbTdZOWNqS0RXN2dQR0xm?=
 =?utf-8?B?RUVkK1dnU1lSNDJXM2dWak5LKzRvaHJoSXZGWmN6UDZtMjdqMm4xZHZyMjNS?=
 =?utf-8?B?VzRyNWI4SDJ1NW96dFFOMVUzcEF0NFUxaU1GWFhqMnJTOS9wOW44eGpadVZt?=
 =?utf-8?B?bEZWMThlbUxCdVpwTXZqeEFGNHpVa2dYOVNONTNxajZqcGpFMWpkdFFMU3ZS?=
 =?utf-8?B?SWFkSXVnQUhjRk1yWVNGZms4TTRlM05uczMyTUVaSncxR1E2b1lhQUtuM2do?=
 =?utf-8?B?aWpBdVAwajFuMzNhd3dnTmtVRURpMTFIczBVQ2lSaFlhZjFUSkZtME16ZlBw?=
 =?utf-8?B?WHFhNjNpZW9JMVEyTjJrdGdON1FLWVVCb1grS1N2SGhDUXlhU2hOMWpuaWJ6?=
 =?utf-8?B?OVI3N2JOaGxyamEwNVkxNE4wVklSU1ZHcHplVzg2R2ZQS0lLNUVOWTZJaDVl?=
 =?utf-8?B?SkFQTEJ0ZHFZWHpVOUJmWUJBcEtkMVBaQ05WQVdBeW5STjhGTHhoQ1VRSzcr?=
 =?utf-8?B?RTk5Z29mQWhOV1lzdDVDMUpVQVI4aGNXeGpjR1M3eTFuVC9QVXAzNnhmamFB?=
 =?utf-8?B?VEhRVEYxdHN0eHFOS2E5R2pHdmZMaFFTMDFkQjJad01RYVdkMWxxNTZOaGdi?=
 =?utf-8?B?R3NVMGNVcnQyUGdPcWdxajNXMWRqZG5kTEdRaStkYkt5LzVTVGIxL3o0bHR1?=
 =?utf-8?B?WS9YWjEyNitFajhMWTNRT0FHenA2czduTzRYQWJUWWNvRXVhalVYdHNHbHpt?=
 =?utf-8?B?eDVUV0xjM3BtUVQ4anRzclQ0SjYvcGlHbVFYUFk5ajgwcHgrRnh0bkxjbTV5?=
 =?utf-8?B?ckhhOWY5Zk9lejQyNzM3aFNzVWFmZ1MzSTJ3Z1MyeEJ1aEVSL01IZkk3eHFU?=
 =?utf-8?B?c2hJUWxuTXUxUVAxcm9Nb25nUmlVaVJYSEZWSjkySld5MWtHSldPcnNrc3RD?=
 =?utf-8?B?U0V0Y1JjZzN4M1puOEVsT3pzRlFUS3BMSTNnSEl4bC9ybGthUUVWTzkrQ1ZE?=
 =?utf-8?B?M2hXaEVPTDdYZG1aNFdyQ0pUZGM4MFFnNHpoQnBlWFowRXFhSGlZOGt6OVE4?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cd30418c-2826-4a21-2f43-08ddcc0a81d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2025 06:06:05.5754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMDe5pDes/uyAwC5GJe9hsZCse1RyZ0zgT5GfAei2AvMWS8QCeBMnlILrboyStaVngnWnwoW/6Cau20J1wenBaXAFcEaTH93LP/ng2IRIC05cxNwuhC7A8hi/FJu8UbN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN5P287MB4369

PiBRdW90aW5nIEhhcmRldnNpbmggUGFsYW5peWEgKDIwMjUtMDctMjUgMDY6NTU6MjMpCj4gPHNu
aXA+Cj4gPiA+ID4gK3N0YXRpYyBpbnQgb3YyNzM1X3BhZ2VfYWNjZXNzKHN0cnVjdCBvdjI3MzUg
Km92MjczNSwKPiA+ID4gPiAr77+977+977+977+977+977+977+977+977+977+977+977+977+9
77+977+977+977+977+977+977+977+977+977+977+977+977+9IHUzMiByZWcsIHZvaWQgKnZh
bCwgaW50ICplcnIsIGJvb2wgaXNfcmVhZCkKPiA+ID4gPiArewo+ID4gPiA+ICvvv73vv73vv73v
v70gdTggcGFnZSA9IChyZWcgPj4gQ0NJX1JFR19QUklWQVRFX1NISUZUKSAmIDB4ZmY7Cj4gPiA+
Cj4gPiA+ICcgJiAweGZmJyBwYXJ0IGlzIHJlZHVuZGFudC4KPiA+ID4KPiA+ID4gPiAr77+977+9
77+977+9IHUzMiBhZGRyID0gcmVnICYgfkNDSV9SRUdfUFJJVkFURV9NQVNLOwo+ID4gPiA+ICvv
v73vv73vv73vv70gaW50IHJldCA9IDA7Cj4gPiA+Cj4gPiA+IEhvdyBpcyB0aGlzIGFzc2lnbm1l
bnQgYmVpbmcgdXNlZD8KPiA+ID4KPiA+ID4gPiAr77+977+977+977+9IGlmIChlcnIgJiYgKmVy
cikKPiA+ID4gPiAr77+977+977+977+977+977+977+977+977+977+977+977+9IHJldHVybiAq
ZXJyOwo+ID4gPiA+ICsKPiA+ID4gPiAr77+977+977+977+9IG11dGV4X2xvY2soJm92MjczNS0+
cGFnZV9sb2NrKTsKPiA+ID4gPiArCj4gPiA+ID4gK++/ve+/ve+/ve+/vSAvKiBQZXJmb3JtIHBh
Z2UgYWNjZXNzIGJlZm9yZSByZWFkL3dyaXRlICovCj4gPiA+ID4gK++/ve+/ve+/ve+/vSBpZiAo
b3YyNzM1LT5jdXJyZW50X3BhZ2UgIT0gcGFnZSkgewo+ID4gPiA+ICvvv73vv73vv73vv73vv73v
v73vv73vv73vv73vv73vv73vv70gcmV0ID0gY2NpX3dyaXRlKG92MjczNS0+Y2NpLCBPVjI3MzVf
UkVHX1BBR0VfU0VMRUNULCBwYWdlLCBlcnIpOwo+ID4gPiA+ICvvv73vv73vv73vv73vv73vv73v
v73vv73vv73vv73vv73vv70gaWYgKHJldCkKPiA+ID4gPiAr77+977+977+977+977+977+977+9
77+977+977+977+977+977+977+977+977+977+977+977+977+9IGdvdG8gZXJyX211dGV4X3Vu
bG9jazsKPiA+ID4gPiAr77+977+977+977+977+977+977+977+977+977+977+977+9IG92Mjcz
NS0+Y3VycmVudF9wYWdlID0gcGFnZTsKPiA+ID4gPiAr77+977+977+977+9IH0KPiA+ID4gPiAr
Cj4gPiA+ID4gK++/ve+/ve+/ve+/vSBpZiAoaXNfcmVhZCkKPiA+ID4gPiAr77+977+977+977+9
77+977+977+977+977+977+977+977+9IHJldCA9IGNjaV9yZWFkKG92MjczNS0+Y2NpLCBhZGRy
LCAodTY0ICopdmFsLCBlcnIpOwo+ID4gPiA+ICvvv73vv73vv73vv70gZWxzZQo+ID4gPiA+ICvv
v73vv73vv73vv73vv73vv73vv73vv73vv73vv73vv73vv70gcmV0ID0gY2NpX3dyaXRlKG92Mjcz
NS0+Y2NpLCBhZGRyLCAqKHU2NCAqKXZhbCwgZXJyKTsKPiA+ID4KPiA+ID4gRG8geW91IHJlYWxs
eSBuZWVkIHRoaXMgY2FzdGluZ3M/Cj4gPgo+ID4gRG8geW91IHJlYWxseSB0aGluayB0aGlzIGNh
c3RpbmcgaXMgdW5uZWNlc3Nhcnk/Cj4gPgo+IAo+IFllcz8gV2VsbCBxdWl0ZSBwcm9iYWJseSAt
IEkgaGF2ZW4ndCBjaGVja2VkIG15c2VsZiB5ZXQgYnV0IC4uCj4gCj4gCj4gPiBQbGVhc2UgY2hl
Y2sgdGhlIGRlZmluaXRpb25zIG9mIGNjaV9yZWFkL3dyaXRlCj4gPgo+ID4gd2l0aG91dCB0aGlz
LCB3ZSBjYW4ndCBldmVuIGJ1aWxkIHRoZSBkcml2ZXIuCj4gCj4gSG93IGFib3V0IC4uLiBjaGFu
Z2luZyB0aGUgZnVuY3Rpb24gcHJvdG90eXBlIG9mIG92MjczNV9wYWdlX2FjY2VzcyA/CgpPZiBj
b3Vyc2UsIGNoYW5naW5nIHRoZSBmdW5jdGlvbiBwcm90b3R5cGUgd291bGQgd29yay4KCk15IGlu
dGVudGlvbiBpcyB0byBrZWVwIGEgc2luZ2xlIG92MjczNV9wYWdlX2FjY2VzcygpIGZ1bmN0aW9u
IHRoYXQgY2FuCmhhbmRsZSBib3RoIHJlYWQgYW5kIHdyaXRlIG9wZXJhdGlvbnMuIFRoZSBjY2lf
cmVhZCgpIGZ1bmN0aW9uIGV4cGVjdHMgCmEgdTY0ICosIHdoZXJlYXMgY2NpX3dyaXRlKCkgZXhw
ZWN0cyBhIHU2NCB2YWx1ZS4gVG8gc3VwcG9ydCBib3RoIGNhc2VzCndpdGhpbiBvbmUgZnVuY3Rp
b24sIEnigJl2ZSB1c2VkIGEgdm9pZCAqdmFsIGFuZCBjYXN0IGl0IGFwcHJvcHJpYXRlbHkgCmRl
cGVuZGluZyBvbiB0aGUgb3BlcmF0aW9uLgoKSWYgd2Ugd2VyZSB0byByZW1vdmUgdGhlIGNhc3Rp
bmcsIHdlIHdvdWxkIG5lZWQgdG8gc3BsaXQgdGhpcyBpbnRvIHR3bwpzZXBhcmF0ZSBmdW5jdGlv
bnMsIG9uZSBmb3IgcmVhZCBhbmQgb25lIGZvciB3cml0ZSwgZXZlbiB0aG91Z2ggdGhlIG9ubHkg
CmRpZmZlcmVuY2UgYmV0d2VlbiB0aGVtIHdvdWxkIGJlIGEgc2luZ2xlIGxpbmUuIEnigJlkIHBy
ZWZlciB0byBhdm9pZCB0aGF0CnJlZHVuZGFuY3kgYW5kIGtlZXAgdGhlIGNvZGUgY29tcGFjdC4g
CgpMZXQgbWUga25vdyBpZiB5b3Ugc2VlIGEgYmV0dGVyIHdheSB0byBoYW5kbGUgdGhpcyB3aXRo
b3V0IGR1cGxpY2F0aW5nCnRoZSBsb2dpYy4gCgpCZXN0IFJlZ2FyZHMsCkhhcmRldg==

