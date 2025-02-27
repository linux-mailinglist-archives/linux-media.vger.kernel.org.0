Return-Path: <linux-media+bounces-27159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1293A47C1A
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 12:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5131C188B7EC
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 11:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B0422CBF8;
	Thu, 27 Feb 2025 11:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="mBXpKbZ0"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F94322C35C;
	Thu, 27 Feb 2025 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740655289; cv=fail; b=FOH9yI5Qy3c4hK/1HoQ5A4n+VBAy0zyQOATjc0a+8zKpQjWqUUqFvQFhFkoCKysC78GkRGsuX25N5H9HBQ6/nHzaqNDPb1boLjg900Mzit2NeMLEhZNwl/XggkHUSKt9JCgzyYbAKJPNuhJ60QOvswzlkUjGC76dAEZGcj15zsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740655289; c=relaxed/simple;
	bh=V0dff4W7QAa5pBoAGs2VQgeDMU9Ytj5DH81c8vHxCao=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=onH1Y3XYjslJWRenVmVikwUaIsPkTI1JIiU2RTrVpyWPCsTzv7KP8JSvuKal7OhyKh9dUOk0cTNJ3quSPlPqjshEiCwQN23tnPyR8QQYNXbG4I50FJMY3RCHjMBPLEH6vZ5J7SdnJd7Nb4GlDxtKrxbDqnDVzbla6km9KVtqx80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=mBXpKbZ0; arc=fail smtp.client-ip=52.103.67.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpT8nSt+KEG9AAWLsciceKyoY+xERQ8U43A17ci4fYH2ZpefmlW4DIHGndkIvK0I2ZrnSN8axCtyrPrpnnmZY2RlCqRa2yMuA3V/OwP4dyN421SfLwhQr0+5zRcOB4AiL8lZVJgmPkDnNGcD3ukZ9bh8Y8pxSieXv7fQeVH5/+x3CBnBnig6Cw5w+OMlpKrLcu7voaysUpiDy2k9ltl4cuciCLcf421qE0UiVmYOHlpGmUXqFlnb9pyiewZxQihf7lwEy4Hdg9ZcXxXyCq/usFIT06i04v3MyzyArkXRgGvRu5CbjQ+/H5UkC0ZdfDOGH9Mm2sfD6Tvh93lZNCiRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0dff4W7QAa5pBoAGs2VQgeDMU9Ytj5DH81c8vHxCao=;
 b=kLBKdHGqY4IpYFsi6+e8VhH1W7m3xswNybh/y7vYvTiukvDPGMNKiHemDtFL6zzBEGExZQblDOjRfghbiDn0IvqaF0wmnuSvlDiBYreXJIWXIEBRLF+K5XIfDPVrXWhkj5bsk4ybJbJXKgmF5ZcSbd6TqcVTkWubIy2hlcES5RUbysyaAD90mlDjW5MdYJBqvXS17ok0C7HRIYEt/WqbUQL/cPuN71ZKVrV90Hb+g2XVtPzjuxxttt7+EmdO1UwUAzj3nmlSx5Zxz1W1U1pQ1yacmGj/NC70kjsj/Ae4ji+flR1aDHANtYL4x+buCurddhMVZcCfew212Pn+X4fjnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0dff4W7QAa5pBoAGs2VQgeDMU9Ytj5DH81c8vHxCao=;
 b=mBXpKbZ0pGwirNlQW6Jxbz34UAxHG1lnV/x9KXWIXTEiee6RhVWf6EFRtQxughnAY95rzviWm/0lXzaaNMHUNP1y/BJv88MVDsR1BzigoYHm/Lure5795oWSJOUTp1pvgJ5p9YCtonFYkrP7F0HZ8SC9gTH9SkYsU2Wr9UaV5bGOzEIiEHunDicX3jQ4aZK9yLnXNoRU55HcZ97DdULrcgU33XxoJc8hfDoTi3BXmY7RYfphQvt2Gr5LrdxYeGuLMa0aECz/zRhB/sIRW9e94ZUYzpP9InnnKhlEL447NFVhAsFcEt+mJSYj50NG/vpQLfMEsUpG9ktEyL7U/eFXYg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB10207.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Thu, 27 Feb
 2025 11:21:18 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 11:21:18 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "linux@rasmusvillemoes.dk"
	<linux@rasmusvillemoes.dk>, "senozhatsky@chromium.org"
	<senozhatsky@chromium.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
	<apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, Hector
 Martin <marcan@marcan.st>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, Sven Peter
	<sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Topic: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Index: AQHbg7X/VQv9Od0O+UavMLVdMg72b7NWp9L1gARkMq8=
Date: Thu, 27 Feb 2025 11:21:18 +0000
Message-ID:
 <PN3PR01MB95974209DC2F3AD757EBE40CB8CD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <PN3PR01MB95971110670F02685E6AF519B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To:
 <PN3PR01MB95971110670F02685E6AF519B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB10207:EE_
x-ms-office365-filtering-correlation-id: 705878a4-8306-4c82-5ed3-08dd5720db5b
x-microsoft-antispam:
 BCL:0;ARA:14566002|6072599003|19110799003|15080799006|8060799006|461199028|7092599003|8062599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?eVk0WCtYZnV1N2ZKUW1mdDlqc05Jc0sxcFdjeHdDMlA2cG9DcmMxazV6NkFx?=
 =?utf-8?B?akRWYTlKNE1mUmIyREJjMjNub1MyRlRhMlBmUmlUOWxGYzAvdHoyY2xuTUFn?=
 =?utf-8?B?bjJYcHNkSGhkYUlMeXNaUE1pUDZJTEo4bklGaUd0SlFJVXBnU0ZXc3VlODZt?=
 =?utf-8?B?S0FpeG43bmJ3NjVvSXRZSXJ5cERyM3RrTUYrU0Y4RitldktUdkY4M3JSc1Fn?=
 =?utf-8?B?d0ZCcFpEVzJMN01DRGhYN1A3NDRHT05YMEIybVRiQWNVSmVwT2tLamEvd2o2?=
 =?utf-8?B?bngzN2ZOVi9za1J0eThXTXcyR1VTb05hNnlaVkNPd1FDVnA4WEw1dzVhaVFH?=
 =?utf-8?B?elhXQzNHMFJKcEpIL090MHRUbDNGWmpLdnBody9paXR0LzFZMGlvOTlJcFZl?=
 =?utf-8?B?L0x3bzc5ckJvSGU2SzVxZ2krSWw0WHBIYjdKREtxMzhIZHZuZmlJTW1WRmxH?=
 =?utf-8?B?bEhrOExaclJ6REtpQ2lRYi84eUwyTmtVUkkzVWFUd1pHK1FRdGJPdUFzN3M2?=
 =?utf-8?B?R2JvZHpVUE15NGMzV3JTK043eTFaTEpjcWVhQklHamp6bHEzRlNpV2hTNm1S?=
 =?utf-8?B?d2FUK3NudVFTVloya0dac1VqZ3A0bDB1cE84Z2RCQlBuVmtNU1h5d2ZDSmF6?=
 =?utf-8?B?cWVNdmVTbFlyWWdiRjM4U2Y0VGZsTnNyQkpOcUlwdXlSeVJWNnM2QVZ1em9X?=
 =?utf-8?B?QW5LRlIwYzhFQTRrSzg2YWdTR25yY084cUZIOEtyaUZiMlVPelBKa1NWQWc3?=
 =?utf-8?B?Qm5Eb1pjdmpCYnpyaTZ3d1gxNjRNQmhGSmU4MkxhWG9FN0twdXRiWnpnL2RU?=
 =?utf-8?B?V3VtY1NCQVVoSnMvRGZjelkvOEorclNBU0hucU1ncjdvdDRTRDZ2YTYxOG83?=
 =?utf-8?B?QzRLa0U2MnUyTld3ZmdOYWFBQWZQcHAweXh4SlZ6bjFMa2ZtK3FyZGR4QTN2?=
 =?utf-8?B?UWpsVnpzcy9UaFhkc0F2NHFXVUpTeVVrNGxJK0E4M3prbmJVK2QyU2ZUZ3By?=
 =?utf-8?B?N09ocms4bHNmMEtEektEUVZrbElDU2d5WXlDQmQvdzU3ZUJJc2NYMW9qSytl?=
 =?utf-8?B?MnQ2bVB5Y3JHd2xRd1M4NVVtRU5uSmkwYTVBRG84T3NRK3dBZFRhNXp4UWJh?=
 =?utf-8?B?TlRkWm9TdVN5L09LK0RPSjBQNTIydDRMd0xpSWJYNTB3OWQyN3Qxb096QVJX?=
 =?utf-8?B?dEVmTlM0elNGUW9jOW1EU0NkQkwzdFZUVGdUVW9WK2oxSWk2YXFiYmR0YTNU?=
 =?utf-8?B?dzdYQXg4OFc5cWJLZG9VMTk5MS9MZk5wMDdrNWdLeFFpcndaVUNNY2szeHRK?=
 =?utf-8?B?M2ZFazFyMlMwVy9DNFpuZ3BKdmRoeFdWb2FVcWlhcVplMnNYY0JmelBCTUpx?=
 =?utf-8?B?alZXQnF0VHllSWo4SDVvbFpCRFlRbXMwQ0s0d09nOUE4RVY2YmR0bkF0dWFB?=
 =?utf-8?B?TU1xYzByeEJKemdrQjlpbE9nQTQ2REFMVk1RV0FHYUpVNVAybEZPOUJlOHcw?=
 =?utf-8?Q?JvpI1o=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHhUeW5wSE56Tm5BZHF3OGZVOStVaDlFNnlIZ2xXMGR1a2thYnFUcTF1eW1C?=
 =?utf-8?B?NXoycVp6ZUs2bjNmM1lVY0xmZlU5MHM3a293SXdNOFgvOGdVdVY2ODFzd0dr?=
 =?utf-8?B?dVhySXRidTI1dk9ycmsvQjQ1ZGk2ODE5SEFDUUNTZDJQemhGc0NxTGdPVllo?=
 =?utf-8?B?c3BsQlJ1RGNhbCtNd1laSCtBNmtEck9yU08rWFZLUGRIVk5Ta0U0T2t4R0N4?=
 =?utf-8?B?eWF0OUZyNkttYlMyRE82RTFhMDFSSlozUEM5RUtkU3Q0UGVKMGxwL3ZxT2dQ?=
 =?utf-8?B?SlVOSXZGcEpSRS8vb1BMWXJacVE0OExSK2pKOWxheXVqTUx5VzVHcjJFL21G?=
 =?utf-8?B?R1gzKy9OdzJCYkY5QVF5aE5wYVVyTVBVbXhPRDAvbXljUVJWaWNYYzdpdEpB?=
 =?utf-8?B?V2QyMlF1ekdmZFlZOVdUY245WDkrZUVrbngyaDFjWGlNNW51VVl6c1JLeEdo?=
 =?utf-8?B?MmtvYlhiQTZhK091cFVCaDRlOXQyS1hLSHBZVzBzVFNpc2JIcHU4c21lSklE?=
 =?utf-8?B?ZDlSMjg0YXFTMXI3ZXJSc3VIdVJBcDRoemVmODdZQTF6L1VNV0FETzVDMFJs?=
 =?utf-8?B?UCtSOEZ1aDdjcCtlQjJmRTEvV1doQlZ3Z1hwZXFoWFM5eXo3QXhjMDJ3R2pj?=
 =?utf-8?B?MFYzRnM1RkpLVS9oTHhpZzVmWXU0dloxOE1zek0xVnVmdnVEamVlRGROZ1pv?=
 =?utf-8?B?WVNrTDRZSDM4eHcwbkdyczd3SzNSdXIySUhZOFhGWktoVklHMzAyTzFWT0c0?=
 =?utf-8?B?dm1Raldvdm9GMWFLVFZqaGFDMy96bWswRHM0OGJlSk1uUUxnWk5FWEQ3N1E5?=
 =?utf-8?B?cmZGZVFOdHZ5eTN6dklScmo5b0U5Y3BaR1RSQjBUdFQzbm8yYWZlWGR1MklB?=
 =?utf-8?B?M2hQWmZzTTN4Q1RhaWFEcytUSUlsRmZJaER0QVlVTVFodlY1ME1JM3QzTjdG?=
 =?utf-8?B?Uk1SRHlQclBoa1IvRmVhZFl5SFFHMWlQTUlDWnF2MHpXWmxQUlhoSy9TZFR0?=
 =?utf-8?B?bVBaS0hFL0c5UFdIbjJOWVZiWUN0cktBdExuNXBuUmRVQ2dRc3pJSnhSam5n?=
 =?utf-8?B?NVBWOGYwTlVRaXIzRit6Rm1qZWJIeG41d1JwZjVNNmdoSkx1SEZTL2E3NHQy?=
 =?utf-8?B?SkxXUGxhcnppUU5OYWhYTVhYV2VYeFhoeFZYRTVCOUk1bTRlWDlEUENrblAy?=
 =?utf-8?B?QUpDRmNYR255aG9nVC9WcHR2NlVpSmgyb1NpelFha3NNVGYyV3dPOUdjUVB4?=
 =?utf-8?B?bVNKN0dnbWFZNEMzbDdSWTlvQm9xMDA3U250ZHhHdVlFaTNKY0FFZmVHZDFV?=
 =?utf-8?B?eEpjbjdOUlJtMXhZVGh5blkrWXAyc2UrMHdtQlB5ZDBWRDlhbHNCUmtaMjEy?=
 =?utf-8?B?OUJJcDhtYU1LWHd1cTJJSGtWY2R1bUd3UjlwNUJlTnBSL3VGMWJzQVJJQ29s?=
 =?utf-8?B?cGh4dENjbldiNGYrQzdVb2pYdkdqZ2FXSkFxQW95YncyTHN4clpKT3BDdEFh?=
 =?utf-8?B?LzM4WE5UUllZbDBhNWRma1hMRzVkWWR0bkpWZnA4Y1pUaGM2bjdCWW9GRGdZ?=
 =?utf-8?B?QmtaWW1mVDZJME95bWNZdUV5aW5uakRqZEhjUE16L3lrNUxhWjBxRnBLYnpC?=
 =?utf-8?B?dXZ6NjE1MEJ0OC9FRlIyOWdPRFhjVmlGRWQ5SkpVVjI0MmRuRmxpcWg3bUo3?=
 =?utf-8?B?TGlXaUR3TEVraC9BS3Q2UXEvNURkNWJkOGJaSUFlZEs3VjZoODMvRVNQN0tm?=
 =?utf-8?Q?OhSZVsyGqMrurSWA8Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 705878a4-8306-4c82-5ed3-08dd5720db5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 11:21:18.6753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB10207

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDk6NDfigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79JIHJlcXVlc3QgdGhlIHByaW50ayBtYWlu
dGFpbmVycyBmb3IgdGhlaXIgdmlld3Mgb24gd2hldGhlciBpZiB0aGV5IGFyZSBvayB3aXRoIHRo
ZSBzcGFyc2UgZXJyb3JzIGluIHRoaXMgb3JpZ2luYWwgcGF0Y2guDQoNCkZXSVcsIEkgcmVhZCBh
IGJpdCBhYm91dCBGT1VSQ0MgYW5kIGFsc28gaW52ZXN0aWdhdGVkIHRoZSBjcHVfdG9fbGUzMiBh
bmQgc2ltaWxhciBtYWNyb3MuIEkgdGhpbmsgdGhlIHY0IEkgc2VudCBzaG91bGQgd29yayB3ZWxs
LCB3aXRob3V0IHRoZSBzcGFyc2Ugd2FybmluZ3MuIEkndmUgYWxzbyBtYWRlIHRoZSB2NCBzZXBh
cmF0ZSBmcm9tIHRoZSBEUk0gcGF0Y2ggc2V0LCBzbyBhcyB0byBhdm9pZCBtdWx0aXBsZSB0cmVl
IGNvbXBsaWNhdGlvbnMgYW5kIGhpbmRlcmluZyB0aGUgRFJNIGRyaXZlciB1cHN0cmVhbSBwcm9j
ZXNzLiBGb3Igbm93ICVwNGNjIHdhcyB0aGUgYmVzdCBmb3JtYXQgaGVscGVyIEkgY291bGQgZmlu
ZCB1cHN0cmVhbSwgYnV0IEkgd291bGQgcHJlZmVyIHVzaW5nICVwNGNsIChsaXR0bGUgZW5kaWFu
KSBpbnN0ZWFkIGZvciBhcHBsZXRiZHJtLiBBbmQgdGhpcyBwYXRjaCBpbW8gaXMgbmVlZGVkIHNp
bXBseSBiZWNhdXNlIHdlIG5lZWQgYmV0dGVyIGZvcm1hdCBoZWxwZXJzLCByYXRoZXIgdGhhbiB1
c2luZyB3b3JrYXJvdW5kcyB0byBzd2FwIGJpdHMgYW5kIHVzaW5nIG90aGVyIGZvcm1hdCBoZWxw
ZXJzLg==

