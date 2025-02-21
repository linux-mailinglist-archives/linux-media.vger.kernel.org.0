Return-Path: <linux-media+bounces-26569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5144A3F32D
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DD3E861DCE
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7AB208993;
	Fri, 21 Feb 2025 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="uJRvnE1P"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010013.outbound.protection.outlook.com [52.103.67.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB9207A20;
	Fri, 21 Feb 2025 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740138036; cv=fail; b=NefKP9bV5Q2qz/cyCsffGx5CvJtjaoiTiuSePjraVEzkPhJyHeRJpspYk/7YKFvPncqwycwuzHHFvPUeqh9efwtiq5oNZUGzgRRFJTabw6aRoLaoquNQbhpToSouRiqqOoPd9FnKmP4e2q9tLUEhiD7zHnZO6HITMb5KfshkLFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740138036; c=relaxed/simple;
	bh=wubtiAhkFbsTCaeLYastV+t3J735ggsYKv3azDdqk/A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NoiuRM3+8C9aSUhUHldrsue0uGN5acvdk5tIRUgjGVYofw8BtLCiRIrKe6g1MxoW/x2BeNgpbbQEbsjwQTdhhy1F48JWtfdzGXDuzPhAznc4UN7v5QLrM8q8UBuhyqQ8zJn0qN0X0igH3iqwBwYHFj4aPdXAWSlco1q4+Ro6jqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=uJRvnE1P; arc=fail smtp.client-ip=52.103.67.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLogOfDf6gWzSo6uYsJiHZyUI+6gnrqzRj2YPJ2QtOAmJamDCTxHKHBN7a2NQ0CRPgDDfhQU4QWnw4TsGb7nLmh3e01gDJbCxbyV/WwW9iYlMkNIzMo0XkTV/bpeobaULr3LIAVGsWe7sXpUTg9LMGqves7e1jCPJjPOhPk5NrJZS1ZmRSHmuXq0lONgD7/EobpSqTiN3AbWEmgX4eWsG/+I/rTRlaiNvZo4QzLhWgmBhjUzxUzMlWApYhpX2tshZoAoe0WGgiJKaAPfHKV3Y3MKZ0sl2kZkBaZOAzYYCTJk2Oj9ttbeN4kTIIbT93jkB8nnsy+a0xti8VYh2JDiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73r72gHQUlKDtT4ca6eP94cBF5tivXPFWRpnah4plGA=;
 b=DgoFo2y3zBTuQGyzj9jbA4t6wISHMWgQxUhUeYPjHNcyf3ShmEsaorZ/udlhulmp7isqdYbTVRELv7E3rmy9ZZenzunPiHKUMdhUSGpM4EJeDikMtqeG/nP84aBvDhmumsyLO3HJtHviWYSQIYdDnB1kxaIkaUz+LU/cpXZJ6Q1yl2ghdhqd6jOXg1lVQZfqaLPCGVIB06UGy53jGwttfVmJjeKLIj0J3L2TRbo3Qmj5yBBHqViltdbl0wxt4oUiZukoPF6ygsAzCsy+PyhCZRh6oLsLRMVnk/jKF/0TcYZ0mgNcCqM8+JIjNZuFnTAEoV/CP2CcQbu24CZERx71Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73r72gHQUlKDtT4ca6eP94cBF5tivXPFWRpnah4plGA=;
 b=uJRvnE1PNET4X1mrktISyq9F3Nse3Qlds4wHJQVrfZ7gGatMJScQHX3c3hCZOrYcCX+k/g+OkGN/6YjsYF68VwWIsZdY9sML/p5Js9+8X1tIhMndsMbn/7GmxHkCyXPi0w1Tdd5BdAKF3MIaEa7GGXOii1mPqh+seGXn79mbRDRlh5XQDKqE+72YwlNCt8WTWaVjCD5Arjn06gxs8rpSgHQMpV18t5QSzodaL5Bm0rtbtYAZapnAVaZUjQ4b2CVbQHxU/POaXqm/e3ogQiRQkxVzIoH9StlyKjsWaiI/eupSyjzj0o+0ueK2+Gtyc9WDFUClcCPOvg2L/KBeZELPYw==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN3PR01MB9325.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:103::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 11:40:23 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 11:40:23 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "senozhatsky@chromium.org"
	<senozhatsky@chromium.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
	<dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
	<lukas.bulwahn@gmail.com>, "sumit.semwal@linaro.org"
	<sumit.semwal@linaro.org>, "christian.koenig@amd.com"
	<christian.koenig@amd.com>, "kekrby@gmail.com" <kekrby@gmail.com>,
	"admin@kodeit.net" <admin@kodeit.net>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, "evepolonium@gmail.com" <evepolonium@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, Hector
 Martin <marcan@marcan.st>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, Sven Peter
	<sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Topic: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Index: AQHbg7X/VQv9Od0O+UavMLVdMg72b7NRj6yvgAATooA=
Date: Fri, 21 Feb 2025 11:40:22 +0000
Message-ID: <F0268324-2013-41B0-8827-4B3E24374CFE@live.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com> <871pvrpp4b.fsf@prevas.dk>
In-Reply-To: <871pvrpp4b.fsf@prevas.dk>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN3PR01MB9325:EE_
x-ms-office365-filtering-correlation-id: 0890db60-8ded-49a1-3ae7-08dd526c86ec
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8062599003|8060799006|15080799006|7092599003|461199028|4302099013|3412199025|10035399004|440099028|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?22s1BkMnJ0EwztI+moey0CobPBklQypeOwuoWqJWenuG3QTnVrbFEPpO6sKQ?=
 =?us-ascii?Q?p7WSry1dHAN6FyiAs1ehrqMV+HR8T8jlR59yZSAtpYwdYABfsTOtA+0CgOw8?=
 =?us-ascii?Q?gi/+mvy4xkFsroZQ7iHZo/+JHBvMLyO5cVUKzksDTn2aWdG92dSnkmIlymSu?=
 =?us-ascii?Q?bfy+XUYMUw7hFQK1l/fNjwSEXJsp2sOeIpufXg1VpfRop19tzM+DH8OhxzF6?=
 =?us-ascii?Q?FvcQpB6lnNzWCMdz6KALCsu+j+G237ZXBZMitlxOpgetzq7G1BGq/fZdrLCm?=
 =?us-ascii?Q?2fJcrrYX6/DQDVEJC4oT73F9YnlpEDzS2T5WHec+T/noG8ZDsRih6PF3+JlP?=
 =?us-ascii?Q?vTrcgkbkH4c2BBfLcXKCRD83Emn53Iao2Y1OqntI+jbhm5iZOQD5yElFvfzY?=
 =?us-ascii?Q?zL0g5R0Ic3+72oHRUx4iYbLdB7XUIgEb8hUuXH5RXTjwy6jCYI4Ff7WMoqqP?=
 =?us-ascii?Q?GlO9/RrmM15OS/2zeLyqDfsxGSuWkve6gECuBKwrpKOsBv30Ne7iACqtRAv2?=
 =?us-ascii?Q?TObY2gx5jQ+4Mkf7X8teNWTClt6a7O+G3LuAUAcRLlkA2b4UfjnUnAUTDhtp?=
 =?us-ascii?Q?MudIGc9EAuZJXlGL8NBibxH+C2OkChWnEuqPXxQD0lB9j2XXZuFXU/fnCvxO?=
 =?us-ascii?Q?Mkn1SL61iMxlPxhvlFhs/PxXRheP2mMDa+l7gw9NGcm0Tz5l2bkx5JCy2YvQ?=
 =?us-ascii?Q?0ryoMbefGMbrQnWCcum9AP1Wjqw05kAh165zQC0OcU8eTEJ3a6OOYgnbbKzd?=
 =?us-ascii?Q?NZmnI4zPQxsPs2gXZDwTHFvNc/g1P370HvQOSRVSCsW6YW4L7hGYvf9b1my/?=
 =?us-ascii?Q?Qnft9jO6UIRLeGDgO5k/yS6U8pp9Ki/NztKAhE4YRBM3yZd7xY5XcWVSSj9V?=
 =?us-ascii?Q?FeRjj25jZs92aDWiA3bQyqsi9ksUo4f8V6fd0b2IzIAofM5N5K9vCLhmhRQ7?=
 =?us-ascii?Q?6+LN3i20jYJiFmWaJu5rYhdcVdrehQ9tqnz/I7bLXnIiSRFVyjYy22Rwd5hN?=
 =?us-ascii?Q?ldAZdulZIRJGinvwqBAEYPHFOsMYzmLofXTUZtiEK9/8aTK9d4airkmHqXVP?=
 =?us-ascii?Q?zS4MZzcSdNpSeyG29CtAqbsS31KGuLt3Brk5ifQsRvHdzAuEckuJsBX9yMPV?=
 =?us-ascii?Q?51i08DNuY9LL/NYL5Cby3mEaOr3mKw51n2hqBKmsFai6b6Z2NUnzrn9ZSwpi?=
 =?us-ascii?Q?kqsKIgak1gBmGmaa?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/lssY5hPcatxPiRjKgwZ3R7bMIDL8jAakP1q69s5VCknXnRg4wURsfrpADBI?=
 =?us-ascii?Q?JZtyyZrvlaKA5Q4rJl2jehvN57W98B8JbvatSyz7TQLxvqEqN5NckojPYFAG?=
 =?us-ascii?Q?RZjKmhXw+Of3G/Aqh4OUkH9omy3Zip7KOoOo/WEigupXDc6zehg49L6ZQCft?=
 =?us-ascii?Q?JTybg6tNqo7hhYZ5ggeneL4uP50GMEf3bsKcxpATumNTlk3WTnMX3HBHciUt?=
 =?us-ascii?Q?zpu8mgAIQ1TNfUAXG6O+FXGjkB6GWbcFIYFCbKgjV6C3i/lnhtuOzhn/D67o?=
 =?us-ascii?Q?B0hNB/2kEKknvBvMsLk3nss2t1+2S5n8Ls4xzp1DAtwxPyrhukLK8yLluHp3?=
 =?us-ascii?Q?l8OgvA8GUgOJtemQ4+W8ajZ6/UcgOmCnbvvulsg2bTQSsDV9ok025qUOIIfg?=
 =?us-ascii?Q?FadN4GoVaqstjlKsHMGjumKPFefWjfqyF7xK6+DYW4oUaDPszV7JVfCsxzOH?=
 =?us-ascii?Q?YsS5WE6LWRRtbi0q8i5d9DJ80mooqsuhgDtUKwGucKcTR+WHEJJDsJRR64T6?=
 =?us-ascii?Q?VKLrx/odkWSv57g3TqqCtDfLsZlwJ1m7UBtBMXP7lakN3kwHu0Neckgot4GY?=
 =?us-ascii?Q?dpP8HUZ1Lr1AgJfWkqfI8qFQXbtuG/liAy+5dV1gEUAl0FsE1M0QzSZbC/JT?=
 =?us-ascii?Q?qfjCsK5pm0eHqM5dQfwtym4UB8ZWsw5Fjd1Tt3SSK0sNDId+ggFOvXN1m48g?=
 =?us-ascii?Q?aK7yJjAaOtrt6f4CTxlcOhaW2MGjdBcMT8cuK4hIR5hfsLz418DyORpEtoIc?=
 =?us-ascii?Q?rsLhLlFwQQmVkyGWZ9z9pRRmh58TlWraq+owvxEbkT/tykdYLSVqU4uc8HQy?=
 =?us-ascii?Q?b+VtRlUiAMNSl76/dCgFhdk/awTjybFzs1qrjbWMCfpITMj90BxBsAtYrrgt?=
 =?us-ascii?Q?jz5203aTqYNBGxKYNrniNaisjvxiEWzm8pB34Fp8hL+ggiqxr3kQ9xCwbjND?=
 =?us-ascii?Q?Igo45uuC+ByljtCQLLwFwrBPHFc9GiIMdB3vz9gI0stCWiKjIKqn5Agnlues?=
 =?us-ascii?Q?LCQxVaXwoGDS0E/noM3LJB+yAJ25LLraS3MeuEkHi9eiUSqhThu8aIbCN7wU?=
 =?us-ascii?Q?5hVUA+4vpUuAeWkq4hDUg5W8kjTqmVNI0d/9VXrz1KFGgkySMx9rBzlM9/dW?=
 =?us-ascii?Q?GcgUbkT6p0L2kRGw4PyA365tTgiZzImQK9dgqdoWNCPruUkqeMCc9IJASIC5?=
 =?us-ascii?Q?KB1l0TwAmCI7Clbe/vtN5QsZMGQcqXgyttkf78OEeTdnkw2OfqhleVHme1Fw?=
 =?us-ascii?Q?LpSWYkZ6PvX0F5ax3PqGUDttsbWUCMzA9TuqfSjwTb6TT5ciWAhe2Gkgj1PT?=
 =?us-ascii?Q?aZCvxrfZk2hukCg7EOKqqBvP?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <98A44B0D4D96E24E9E2AB5DFBB3079F3@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0890db60-8ded-49a1-3ae7-08dd526c86ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 11:40:23.0015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9325

Hi

>=20
>>=20
>> diff --git a/lib/test_printf.c b/lib/test_printf.c
>> index 59dbe4f9a..ee860327e 100644
>> --- a/lib/test_printf.c
>> +++ b/lib/test_printf.c
>> @@ -776,21 +776,46 @@ static void __init fwnode_pointer(void)
>> software_node_unregister_node_group(group);
>> }
>>=20
>> +struct fourcc_struct {
>> + u32 code;
>> + const char *str;
>> +};
>> +
>> +static void __init fourcc_pointer_test(const struct fourcc_struct *fc, =
size_t n,
>> +       const char *fmt)
>> +{
>> + size_t i;
>> +
>> + for (i =3D 0; i < n; i++)
>> + test(fc[i].str, fmt, &fc[i].code);
>> +}
>> +
>> static void __init fourcc_pointer(void)
>> {
>> - struct {
>> - u32 code;
>> - char *str;
>> - } const try[] =3D {
>> + struct fourcc_struct const try_cc[] =3D {
>=20
> I know it matches the code it replaces, but kernel style seems to be
> "const struct foo" rather than "struct foo const" (at around 130:1) -
> just as you use in the new helper function.
>=20
> Also, please consider changing the array, and the newly added instances,
> to be static instead of automatic (our le32_to_cpu should be usable also
> for static initializers).
>=20

V3 sent here:
https://lore.kernel.org/dri-devel/98289BC4-D5E1-41B8-AC89-632DBD2C2789@live=
.com/T/#mfa1dac647c9517674649a50301b122a524cc364c




