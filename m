Return-Path: <linux-media+bounces-42156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68499B50FB8
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEDED4E1461
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 07:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BCC30C37D;
	Wed, 10 Sep 2025 07:40:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021111.outbound.protection.outlook.com [40.107.51.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E6D2D3A77;
	Wed, 10 Sep 2025 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757490031; cv=fail; b=moTEOUf8u8ff/ZnQqRetOlZYai/xABp7ahILMNLvixF4nuIizEbojMz8Qoz8kcTTD0E0iWEs68tlP44nyiCnZ2N7qVQ3IlntMidG36t71neKIXYmZa9TZ+48wo/zGZN/U41tXxDqQBmg52/E3rCIq/vn/ntabeBtUmMtAPnMIHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757490031; c=relaxed/simple;
	bh=2PZppCxLuu3a4Mjzoo881DyXJo2B+YuVIpxMPVTxEvY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jH31EEC8AL+I18MFJQuAGGSASOFicCGFrtoZjJOCkwXbG5pmX9hS/CphOhKAxfsgH3ns4ctgwbcewismgC1LAgtvppl5jQGxKXH41LsC5s4hNaubXt3xBXDn2r1evRWK3OSW8Ru3gNZV7TidJZzJtULSLV9c/ptEOuu0jxH6pJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q79TmQyqHkdMvg+aYtcuxp2mdFVKwLUoKLL4OC5DcdI5bAaiUxLJUWf1zV4gsUFdOJox9XYgZY2lX19pq6DpmFfB8jQY2OcUP/OtbODfT1Y4zxkWM9zLE2nARhI9OzoQ/J1MmYXrw5kFOZcUWjVvRGxPQzPU9hiQW6IuMaEDlmGt3awnCHHivapyY5MdCd7mC7xZJ4o5gZTv/lMvlZOcFSzuKHygiFelxjyX69bJoOyWbZOPc5aNHPamQwPBRpQkLqOnxp+LExP2XFzP8I9Hq5naFvZ0hoQmxEHhovpoIf3+uqwyPN1XWePIZNa3s5jBiosZkBrUp0QfsK0DZZJB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHnP6nJqtJgqJB6qZaFSDICeoOoD1I8D5RSRimtrPDI=;
 b=ciMerJZCJ54nrVt4+yOjD0ibR56CKfJFvXa4e+RGeM3sG4ufecoXjOi4x2u7ulAe09zkvlPYrzIPfqojPfSzgduEhMSBQvBTJKLRMsf3dnAuYLaeu1GTA1YZw4+9D7Ocfi600VgIid5QG8Ma1s8XvA6YxTsbfqXX8iXT15S/ElcevbwHp3vNRKwDmXnfTSiPt9eR1EHAYIg96u1qVDU4dCKfX4xyV3eKvrzf6Qtt5TuAi1Zf5x8NwBYU7wOyhMcUOFI50EmWROveaefbHO4nIO7kAfYWx92cj0tq7YTq05NohaItAPpE71CEdwJu27Ow3iEuXRgOZIKjM5t5JY9pBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2PPF42D195671.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::115) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:40:20 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 07:40:20 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Matthias Fend <matthias.fend@emfend.at>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, "bsp-development.geo@leica-geosystems.com"
	<bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH v2 2/2] media: i2c: add Himax HM1246 image sensor driver
Thread-Topic: [PATCH v2 2/2] media: i2c: add Himax HM1246 image sensor driver
Thread-Index: AQHbzg6GKn3zTRAwOESLPs4RpQgVqbSDrM/agAjeSACAAAnMaA==
Date: Wed, 10 Sep 2025 07:40:20 +0000
Message-ID:
 <PN3P287MB18290DD20A242C8105BD9CB58B0EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250526-hm1246-v2-0-6b882827a3a5@emfend.at>
 <20250526-hm1246-v2-2-6b882827a3a5@emfend.at>
 <PN3P287MB1829BA783455C6AB967AACCB8B00A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <da810d23-aed7-4fef-b4d0-baba363acca1@emfend.at>
In-Reply-To: <da810d23-aed7-4fef-b4d0-baba363acca1@emfend.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2PPF42D195671:EE_
x-ms-office365-filtering-correlation-id: 725d03c4-9160-4e18-db59-08ddf03d4b40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?1JEdb3Ut/OEr1phGatHmdminIU/T1N8SFV5ug399qzvtSaFOMkDwvREF?=
 =?Windows-1252?Q?lEgABqo2hyXDlVJ1nIWl2RemXzk8hQCGBW7pjVlgyGDFgolhLX7rEBhu?=
 =?Windows-1252?Q?qfLNpZP8b41YqnVz1vu+pBf5RsZ4bJjOTAqcaH8JGlC00fRo5Lg972EK?=
 =?Windows-1252?Q?CWe7iZoAEQ4YAXBBH/bsXXNIbMCMjrdjBFoXwtrjabwewfYiJleUOZTx?=
 =?Windows-1252?Q?pUtj/alZV3lrN1/+TA042TjEk0JEPXRdPvHor7Gy7stP/lRidnWl5L4Z?=
 =?Windows-1252?Q?ljfqgRSl9kFcdFJcSWoCe3afrtDHeMKtYN8BoUyDAXKFHIWr1ifT/t/e?=
 =?Windows-1252?Q?4IkxObBoWGkjYppUWAqxR+lZPSJDS/y7my6NI1rT1KnVwLR+OzH46e4e?=
 =?Windows-1252?Q?aR5U5I0g7f+9BG5UOgKv+znKtaeTnxrWHJq5BpvWwHsvopG5V9xLRXCj?=
 =?Windows-1252?Q?5TB6aFTCELN446B7r29tMR7ZkN0hRbiXTM+WaHq7+F0DoGsrVXxucKh+?=
 =?Windows-1252?Q?pwlfciOraV0NCibVouSf5JkpbHcvUxJ2M1jH6xWD3/SBkWqp0qtHQlN1?=
 =?Windows-1252?Q?2B24TMnmKop6q0sikEkTm0RgtlbUlDghdiA6Sg0T+crCC9baDr83Htf0?=
 =?Windows-1252?Q?+tHNGyW3UHoG/VU+nRQzhvjp5BqUgW6jBRA5zAKdn4lhjtqCkwrEbnOZ?=
 =?Windows-1252?Q?74uI12eGI3I3Jv7ZPi63aE/Oeju6CCRQVrDqp7xpk9KNMNYwp0pLr5bi?=
 =?Windows-1252?Q?X0G73fEODWSDhMQZqCkJ2maLlWcJgn0iPbszndXo+98ydAwyT5h3tDdR?=
 =?Windows-1252?Q?ZBJ6kmhREPkRIYp1L8qmsyqNnzutz8daBhvbsOeJhiaEr3Z8S5O9GLRd?=
 =?Windows-1252?Q?nHzIjn8HVrmi8mPX1Z3P01fO8lSg02ooldaEZDXx6d+UZ71++SP8vH4F?=
 =?Windows-1252?Q?xnhNrGXJkniXT4/qYSUjYuIOn/V1A6OJPOGS+HQhdF9L3UwZagHcyXlI?=
 =?Windows-1252?Q?bLqpHDA9Tsd5ECa/BtGlNm4CvCobJHSuL8Brf5mbg1PkWFz9VVTyMqOi?=
 =?Windows-1252?Q?+7dOIsbwdqEJiTSQQP1xPKsYCq9sxFvBcssc3ghmytpi7SdEdwLBXr8l?=
 =?Windows-1252?Q?DbbEQY8ooei7cYbKCGaqK7vRUfG/NdnZT5XoaQqWrbXyOHzKZTyfIp+w?=
 =?Windows-1252?Q?wf1+NtE0LkDzkNvIrxHHMr7SC9QLrH0ZzB74dj1AzBl+eSB9oG9VpwRf?=
 =?Windows-1252?Q?wuqsskS6NZkGtI5tOvz4JcV3zL/YTaRmGzxDmXvoCpEisoNPXRX7V7Tb?=
 =?Windows-1252?Q?rrRKcKSt6lBhz3k5EGhQLc9pi9Y378cG09oJSgYNa0UEYWNHCB0DATov?=
 =?Windows-1252?Q?VyP4iKhiQF4z3YUG/OU3rygLETi/eIKOkRExwelaTK7LnH6YUOtV9nWX?=
 =?Windows-1252?Q?Yqu4TdAgmYcTs+6tLch/US9YX9hCZy0r6Ug/frJsfLNzEK7nldaPlVaJ?=
 =?Windows-1252?Q?vvl+n7Ere9wEzXDNjnmjOvc/n8Yvvhu4Dals+5irvRAsdZ+atn4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(38070700021)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?Nr8TjGIz4zsPuL2kYLU895Rz5UMf5alkEG19WBP3nIODhIGmciKFCggs?=
 =?Windows-1252?Q?PC+WxruZ4NdSoJkrd3tfQcMze/GxBAi1nA8J6iCWk8mEQ0ZuCjqdr2n4?=
 =?Windows-1252?Q?7RdZhYMn7skgTAU0YJVj9NyYV6IL4y8C5lKNf2UuLLrxBfUpJ/gOq6Dc?=
 =?Windows-1252?Q?qvHqIp53sN7M5dPni90UVfhI6fZUE9x30w6lPC91XzELRSjHdDZuXoDy?=
 =?Windows-1252?Q?cxv6jELWnqlG/GSEEg7PwagjvcQtHEfUEYmwJ3fVbfBR/lPPq6mzU3J1?=
 =?Windows-1252?Q?NuuVtDRvqr0gfeR5L2m38WUvBCIsO2GTsFF+nv8KA5pBHSzgB4C6v3p3?=
 =?Windows-1252?Q?0jQjISMfXXfBe8zflS4I74pDVMBDaizxYtJed5mCMAbyAQmIzYvZirp9?=
 =?Windows-1252?Q?UoGMuucwJ52PRsB3y0tGG2r88ZXcHJR2XT3yvxIs76Ymvm2E5AE4DyiR?=
 =?Windows-1252?Q?OiNSZTVfkcJSGXM4n6z8Z/Zr+jaQ9kd38QzWF7r/yZFVx9GgVWv4vrjx?=
 =?Windows-1252?Q?gsuVAg3TudZGTY5/2JlgeGAJNAgM2ulpTIsxAHdtMqK6oyxLEO/PdnhP?=
 =?Windows-1252?Q?AInPOBAfdbYeLMwpozpxEtJkW4LkxjvZcKsL+jye6Pkwng3j71RWg13p?=
 =?Windows-1252?Q?biSA6b+VVIo+IVUD197fQ0bPCl6DKY/TflKFV6/yHOJVhrQ8hDngLEp8?=
 =?Windows-1252?Q?+FrZdXmX1og3ske8HLJDBRX+OSaKJeJSnwhG6At/JKmLh3r15vAzLG9M?=
 =?Windows-1252?Q?yzOdRqoXzTv7FOvp/XbWHPHO89cDdNe/yM8rfkpH1x2E+hixOnGjOCJj?=
 =?Windows-1252?Q?EViabkzBt0un5ValszweO58KHCH3SAdAE/H1lnqU9kSKD8ily8QLw28D?=
 =?Windows-1252?Q?qxDPfdbznopw9P5W+t99r4yLnh2/PVAFXmGsNWG5fNcsWPtaUQyrz0O/?=
 =?Windows-1252?Q?WAix8YyOULFJB2Q04p6R/ZTUyBeJhX/kKLP39CvprkAkBwJWtRSmt4vO?=
 =?Windows-1252?Q?AUmhuYyfqlqrjtKXqfxdhbl4PGdQC2I0Be5VyfacGrY28ktky2WJpq06?=
 =?Windows-1252?Q?khsXQwRIr247kV3l7LHXKdbJ95KEvtwP7cSGDr6Pdai37G0UsD7CVH/O?=
 =?Windows-1252?Q?n81ukgE5lW6X1vi3c543XN1emfMOKrnijmz/SYN1JfrqmbwrYVnTaIZg?=
 =?Windows-1252?Q?CAfnXAc24JQU/tMz/ikKjTr12pK43CPf/AVrkib0o4ibqW0+1hAWjv4J?=
 =?Windows-1252?Q?fZGD0dF6CJgFymSENf5NffOoWGjqmBLv44BctBbb/5mLCniQ+f8CXVeQ?=
 =?Windows-1252?Q?WosCkmniwmMuBDmJlTX5voFAhFuj6unwHrq3m830VIyUibTWGAv4d02U?=
 =?Windows-1252?Q?9+sFeEkuVt601pUgAK99mhTCB3WC5fSSCAOU7PmQWG+rKQ4BYulvxoBP?=
 =?Windows-1252?Q?44dcheN4hOv3cWmvVo+srln8hRUCpKz9MmjAUtAilHge+QJfyT3JEcf0?=
 =?Windows-1252?Q?yjEIOBn05Vp7/75FBVDpCKXaoeXBu8NMsESfid0YwWXTPv0qHfmHHyhE?=
 =?Windows-1252?Q?0Jqkl3MDFjBei/pKAfGKxd6Hjv3e/rc6bOs4pykPrdYRyFuKvEtZmt7h?=
 =?Windows-1252?Q?9zRy4hCb0HIDueW7wRED//zXH1Q45diZ9GEznaqQah3LTIzbpR25WK5o?=
 =?Windows-1252?Q?puhaKxdS35iYhdqf9pOm+4sQyWQlYR6Jnbx3Mpz9GNDR3ShAQgfFPw?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 725d03c4-9160-4e18-db59-08ddf03d4b40
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 07:40:20.2311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMMcsWMuHLO8gYPy2BhSShvWWOgHmtKzuH+2Y2Zjwtl9fx45e9NKK2QEqv7e9/v9BEKZHT3B17cro0dvy5Ucv8PgWaZ2TdwvpynHLUUrVug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF42D195671

Hi Matthias,=0A=
=0A=
> Am 05.09.2025 um 11:18 schrieb Tarang Raval:=0A=
> > Hi Matthias,=0A=
> >=0A=
> > Use ./scripts/get_maintainer.pl to get the correct CC list.=0A=
> =0A=
> I thought that's what 'b4 prep --auto-to-cc' relies on.=0A=
> But even with get_maintainer.pl, I didn't notice any changes to the=0A=
> recipient list - am I missing something?=0A=
=0A=
Sakari is not in your CC list. I guess He is the maintainer of drivers/medi=
a/i2c/*,=0A=
so he must be included.=0A=
=0A=
I run your patch with the script and got:=0A=
=0A=
Mauro Carvalho Chehab <mchehab@kernel.org>=0A=
Hans Verkuil <hverkuil@xs4all.nl>=0A=
Sakari Ailus <sakari.ailus@linux.intel.com>=0A=
"Andr=E9 Apitzsch" <git@apitzsch.eu>=0A=
Hans de Goede <hansg@kernel.org>=0A=
Ricardo Ribalda <ribalda@chromium.org>=0A=
Sylvain Petinot <sylvain.petinot@foss.st.com>=0A=
Matthias Fend <matthias.fend@emfend.at>=0A=
Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>=0A=
Dongcheng Yan <dongcheng.yan@intel.com>=0A=
Benjamin Mugnier <benjamin.mugnier@foss.st.com>=0A=
Jingjing Xiong <jingjing.xiong@intel.com>=0A=
Arnd Bergmann <arnd@arndb.de>=0A=
Andy Shevchenko <andriy.shevchenko@linux.intel.com>=0A=
"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>=0A=
linux-kernel@vger.kernel.org=0A=
linux-media@vger.kernel.org=0A=
 =0A=
> >> Add a V4L2 sub-device driver for Himax HM1246 image sensor.=0A=
> >>=0A=
> >> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an act=
ive=0A=
> >> array size of 1296 x 976. It is programmable through an I2C interface =
and=0A=
> >> connected via parallel bus.=0A=
> >>=0A=
> >> The sensor has an internal ISP with a complete image processing pipeli=
ne=0A=
> >> including control loops. However, this driver uses the sensor in raw m=
ode=0A=
> >> and the entire ISP is bypassed.=0A=
> >>=0A=
> >> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>=0A=
> >> ---=0A=
> >>=A0=A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=
=A0 8 +=0A=
> >>=A0=A0 drivers/media/i2c/Kconfig=A0 |=A0=A0=A0 9 +=0A=
> >>=A0=A0 drivers/media/i2c/Makefile |=A0=A0=A0 1 +=0A=
> >>=A0=A0 drivers/media/i2c/hm1246.c | 1421 ++++++++++++++++++++++++++++++=
++++++++++++++=0A=
> >>=A0=A0 4 files changed, 1439 insertions(+)=0A=
> >>=0A=
> >> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
> >> index dd844ac8d9107b0a9d1dd3cf592f0637bd6fdc38..12f156f742eddac0e41f6b=
b909d0247cbc8ac2a2 100644=0A=
> >> --- a/MAINTAINERS=0A=
> >> +++ b/MAINTAINERS=0A=
> >> @@ -10642,6 +10642,14 @@ L:=A0=A0=A0=A0 linux-kernel@vger.kernel.org=
=0A=
> >>=A0=A0 S:=A0=A0=A0=A0 Maintained=0A=
> >>=A0=A0 F:=A0=A0=A0=A0 drivers/misc/hisi_hikey_usb.c=0A=
> >>=0A=
> >> +HIMAX HM1246 SENSOR DRIVER=0A=
> >> +M:=A0=A0=A0=A0 Matthias Fend <matthias.fend@emfend.at>=0A=
> >> +L:=A0=A0=A0=A0 linux-media@vger.kernel.org=0A=
> >> +S:=A0=A0=A0=A0 Maintained=0A=
> >> +T:=A0=A0=A0=A0 git git://linuxtv.org/media_tree.git=0A=
> >> +F:=A0=A0=A0=A0 Documentation/devicetree/bindings/media/i2c/himax,hm12=
46.yaml=0A=
> >> +F:=A0=A0=A0=A0 drivers/media/i2c/hm1246.c=0A=
> >> +=0A=
> >>=A0=A0 HIMAX HX83112B TOUCHSCREEN SUPPORT=0A=
> >>=A0=A0 M:=A0=A0=A0=A0 Job Noorman <job@noorman.info>=0A=
> >>=A0=A0 L:=A0=A0=A0=A0 linux-input@vger.kernel.org=0A=
> >> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
> >> index e45ba127069fc0848f1a06ceb789efd3c222c008..70de3d5a186c0bfb439fc8=
1b52a221c2f37a2ca2 100644=0A=
> >> --- a/drivers/media/i2c/Kconfig=0A=
> >> +++ b/drivers/media/i2c/Kconfig=0A=
> >> @@ -127,6 +127,15 @@ config VIDEO_HI847=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 To compile this driver as a module=
, choose M here: the=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 module will be called hi847.=0A=
> >>=0A=
> >> +config VIDEO_HM1246=0A=
> >> +=A0=A0=A0=A0=A0=A0 tristate "Himax HM1246 sensor support"=0A=
> >=0A=
> > Please add:=0A=
> > select V4L2_CCI_I2C=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 help=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 This is a Video4Linux2 sensor driver for the=
 Himax=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 HM1246 camera.=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 To compile this driver as a module, choose M=
 here: the=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 module will be called hm1246.=0A=
> >> +=0A=
> >>=A0=A0 config VIDEO_IMX208=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 tristate "Sony IMX208 sensor support"=0A=
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 help=0A=
> >> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile=
=0A=
> >> index 6c23a4463527cf762032df663bbfe26be29018c8..9a3bf03c0a4de318294be7=
0bcffc7df713fe7ef9 100644=0A=
> >> --- a/drivers/media/i2c/Makefile=0A=
> >> +++ b/drivers/media/i2c/Makefile=0A=
> >> @@ -44,6 +44,7 @@ obj-$(CONFIG_VIDEO_GC2145) +=3D gc2145.o=0A=
> >>=A0=A0 obj-$(CONFIG_VIDEO_HI556) +=3D hi556.o=0A=
> >>=A0=A0 obj-$(CONFIG_VIDEO_HI846) +=3D hi846.o=0A=
> >>=A0=A0 obj-$(CONFIG_VIDEO_HI847) +=3D hi847.o=0A=
> >> +obj-$(CONFIG_VIDEO_HM1246) +=3D hm1246.o=0A=
> >>=A0=A0 obj-$(CONFIG_VIDEO_I2C) +=3D video-i2c.o=0A=
> >>=A0=A0 obj-$(CONFIG_VIDEO_IMX208) +=3D imx208.o=0A=
> >>=A0=A0 obj-$(CONFIG_VIDEO_IMX214) +=3D imx214.o=0A=
> >> diff --git a/drivers/media/i2c/hm1246.c b/drivers/media/i2c/hm1246.c=
=0A=
> >> new file mode 100644=0A=
> >> index 0000000000000000000000000000000000000000..5fe228ae9a433fd5fc89d8=
f57f0a2fc7c16e182f=0A=
> >> --- /dev/null=0A=
> >> +++ b/drivers/media/i2c/hm1246.c=0A=
> >> @@ -0,0 +1,1421 @@=0A=
> >> +// SPDX-License-Identifier: GPL-2.0=0A=
> >> +/*=0A=
> >> + * Driver for Himax HM1246 image sensor=0A=
> >> + *=0A=
> >> + * Copyright 2025 Matthias Fend <matthias.fend@emfend.at>=0A=
> >> + */=0A=
> >> +=0A=
> >> +#include <linux/clk.h>=0A=
> >> +#include <linux/delay.h>=0A=
> >> +#include <linux/gpio.h>=0A=
> >> +#include <linux/i2c.h>=0A=
> >> +#include <linux/module.h>=0A=
> >> +#include <linux/pm_runtime.h>=0A=
> >> +#include <linux/units.h>=0A=
> >> +#include <media/v4l2-cci.h>=0A=
> >> +#include <media/v4l2-ctrls.h>=0A=
> >> +#include <media/v4l2-device.h>=0A=
> >> +#include <media/v4l2-event.h>=0A=
> >> +#include <media/v4l2-fwnode.h>=0A=
> >> +=0A=
> >> +/* Status registers */=0A=
> >> +#define HM1246_MODEL_ID_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_R=
EG16(0x0000)=0A=
> >> +=0A=
> >> +/* General setup registers */=0A=
> >> +#define HM1246_MODE_SELECT_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x=
0100)=0A=
> >> +#define HM1246_MODE_SELECT_STANDBY=A0=A0=A0=A0=A0 0x00=0A=
> >> +#define HM1246_MODE_SELECT_STREAM=A0=A0=A0=A0=A0=A0 0x01=0A=
> >> +#define HM1246_MODE_SELECT_STOP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x02=0A=
> >> +#define HM1246_IMAGE_ORIENTATION_REG=A0=A0=A0 CCI_REG8(0x0101)=0A=
> >> +#define HM1246_IMAGE_ORIENTATION_VFLIP=A0 BIT(1)=0A=
> >> +#define HM1246_IMAGE_ORIENTATION_HFLIP=A0 BIT(0)=0A=
> >> +#define HM1246_CMU_UPDATE_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(=
0x0104)=0A=
> >> +=0A=
> >> +/* Output setup registers */=0A=
> >> +#define HM1246_COARSE_INTG_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0=
x0202)=0A=
> >> +#define HM1246_ANALOG_GLOBAL_GAIN_REG=A0=A0 CCI_REG8(0x0205)=0A=
> >> +=0A=
> >> +/* Clock setup registers */=0A=
> >> +#define HM1246_PLL1CFG_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI=
_REG8(0x0303)=0A=
> >> +#define HM1246_PLL1CFG_MULTIPLIER(x)=A0=A0=A0 (((x) & 0xFF) << 0)=0A=
> >> +#define HM1246_PLL2CFG_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI=
_REG8(0x0305)=0A=
> >> +#define HM1246_PLL2CFG_PRE_DIV(x)=A0=A0=A0=A0=A0=A0 (((x) & 0x1F) << =
1)=0A=
> >> +#define HM1246_PLL2CFG_MULTIPLIER(x)=A0=A0=A0 (((x) & 0x01) << 0)=0A=
> >> +#define HM1246_PLL3CFG_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI=
_REG8(0x0307)=0A=
> >> +#define HM1246_PLL3CFG_POST_DIV(x)=A0=A0=A0=A0=A0 (((x) & 0x3) << 6)=
=0A=
> >> +#define HM1246_PLL3CFG_SYSCLK_DIV(x)=A0=A0=A0 (((x) & 0x3) << 4)=0A=
> >> +#define HM1246_PLL3CFG_PCLK_DIV(x)=A0=A0=A0=A0=A0 (((x) & 0x7) << 0)=
=0A=
> >> +=0A=
> >> +/* Frame timing registers */=0A=
> >> +#define HM1246_FRAME_LENGTH_LINES_REG=A0=A0 CCI_REG16(0x0340)=0A=
> >> +#define HM1246_LINE_LENGTH_PCK_REG=A0=A0=A0=A0=A0 CCI_REG16(0x0342)=
=0A=
> >> +=0A=
> >> +/* Image size registers */=0A=
> >> +#define HM1246_X_ADDR_START_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 CCI_REG16(0x0344)=0A=
> >> +#define HM1246_Y_ADDR_START_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 CCI_REG16(0x0346)=0A=
> >> +#define HM1246_X_ADDR_END_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16=
(0x0348)=0A=
> >> +#define HM1246_Y_ADDR_END_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16=
(0x034A)=0A=
> >> +#define HM1246_X_LA_START_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16=
(0x0351)=0A=
> >> +#define HM1246_X_LA_END_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_R=
EG16(0x0353)=0A=
> >> +#define HM1246_Y_LA_START_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16=
(0x0355)=0A=
> >> +#define HM1246_Y_LA_END_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_R=
EG16(0x0357)=0A=
> >> +=0A=
> >> +/* Test pattern registers */=0A=
> >> +#define HM1246_TEST_PATTERN_MODE_REG=A0=A0=A0 CCI_REG8(0x0601)=0A=
> >> +#define HM1246_TEST_PATTERN_MODE_MODE(x) (((x) & 0xF) << 4)=0A=
> >> +#define HM1246_TEST_PATTERN_MODE_ENABLE=A0=A0=A0=A0=A0=A0=A0=A0 BIT(0=
)=0A=
> >> +#define HM1246_TEST_DATA_BLUE_REG=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0602)=
=0A=
> >> +#define HM1246_TEST_DATA_GB_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 CCI_REG16(0x0604)=0A=
> >> +#define HM1246_TEST_DATA_RED_REG=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x060=
6)=0A=
> >> +#define HM1246_TEST_DATA_GR_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 CCI_REG16(0x0608)=0A=
> >> +=0A=
> >> +/* SBC registers */=0A=
> >> +#define HM1246_SBC_BOOT_REF2_REG=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x2001=
)=0A=
> >> +#define HM1246_SBC_BOOT_REF2_PLL_LOCK=A0=A0 BIT(4)=0A=
> >> +#define HM1246_SBC_CTRL_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_R=
EG8(0x2003)=0A=
> >> +#define HM1246_SBC_CTRL_PLL_EN=A0=A0=A0=A0=A0=A0=A0=A0=A0 BIT(0)=0A=
> >> +=0A=
> >> +/* System registers */=0A=
> >> +#define HM1246_OUTPUT_PRT_CTRL_REG=A0=A0=A0=A0=A0 CCI_REG8(0x2F02)=0A=
> >> +#define HM1246_POLARITY_CTRL_REG=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x2F20=
)=0A=
> >> +#define HM1246_POLARITY_CTRL_HSYNC=A0=A0=A0=A0=A0 BIT(7)=0A=
> >> +#define HM1246_POLARITY_CTRL_VSYNC=A0=A0=A0=A0=A0 BIT(6)=0A=
> >> +#define HM1246_PCLK_CTRL_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG=
8(0x2F24)=0A=
> >> +#define HM1246_PCLK_CTRL_POL=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BIT(3)=
=0A=
> >> +=0A=
> >> +/* Digital window control & parameter registers */=0A=
> >> +#define HM1246_DWIN_XOFFSET_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 CCI_REG16(0xD5E4)=0A=
> >> +#define HM1246_DWIN_XSIZE_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16=
(0xD5E6)=0A=
> >> +#define HM1246_DWIN_YOFFSET_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 CCI_REG16(0xD5E8)=0A=
> >> +#define HM1246_DWIN_YSIZE_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16=
(0xD5EA)=0A=
> >> +=0A=
> >> +#define HM1246_MODEL_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x1245=0A=
> >> +=0A=
> >> +#define HM1246_NATIVE_WIDTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1296=
=0A=
> >> +#define HM1246_NATIVE_HEIGHT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 976=0A=
> >> +=0A=
> >> +#define HM1246_VTS_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 65535=0A=
> >> +=0A=
> >> +#define HM1246_COARSE_INTG_MARGIN=A0=A0=A0=A0=A0=A0 2=0A=
> >> +#define HM1246_COARSE_INTG_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 4=0A=
> >> +#define HM1246_COARSE_INTG_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 1=0A=
> >> +=0A=
> >> +#define HM1246_ANALOG_GLOBAL_GAIN_MIN=A0=A0 0x00=0A=
> >> +#define HM1246_ANALOG_GLOBAL_GAIN_MAX=A0=A0 0xE8=0A=
> >> +#define HM1246_ANALOG_GLOBAL_GAIN_STEP=A0 1=0A=
> >=0A=
> > I think it would make more sense to include the following 6 definitions=
=0A=
> > in the 'Output setup registers' block. However, I don't mind either way=
.=0A=
> >=0A=
> >> +=0A=
> >> +#define HM1246_XCLK_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 (6 * HZ_PER_MHZ)=0A=
> >> +#define HM1246_XCLK_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 (27 * HZ_PER_MHZ)=0A=
> >> +=0A=
> >> +#define HM1246_PCLK_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 (8 * HZ_PER_MHZ)=0A=
> >> +#define HM1246_PCLK_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 (96 * HZ_PER_MHZ)=0A=
> >> +=0A=
> >> +#define HM1246_PLL_VCO_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 360=
000000=0A=
> >> +#define HM1246_PLL_VCO_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 680=
000000=0A=
> >> +=0A=
> >> +#define HM1246_PLL_INCLK_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1000000=
=0A=
> >> +#define HM1246_PLL_INCLK_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2500000=
=0A=
> >> +=0A=
> >> +#define HM1246_PLL_MULTI_L_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
> >> +#define HM1246_PLL_MULTI_L_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0 256=0A=
> >> +=0A=
> >> +#define HM1246_PLL_MULTI_H_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 2=0A=
> >> +#define HM1246_PLL_MULTI_H_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0 3=0A=
> >> +=0A=
> >> +#define HM1246_PLL_MULTI_MIN \=0A=
> >> +=A0=A0=A0=A0=A0=A0 (HM1246_PLL_MULTI_H_MIN * HM1246_PLL_MULTI_L_MIN)=
=0A=
> >> +#define HM1246_PLL_MULTI_MAX \=0A=
> >> +=A0=A0=A0=A0=A0=A0 (HM1246_PLL_MULTI_H_MAX * HM1246_PLL_MULTI_L_MAX)=
=0A=
> >> +=0A=
> >> +static const char *const hm1246_test_pattern_menu[] =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0 "Disabled",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "Checkboard",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "Ramp",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "Moving ones",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "Blending color bars",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "Color bars",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "Solid white",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "Solid black",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "Solid red",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "Solid green",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "Solid blue",=0A=
> >> +};=0A=
> >> +=0A=
> >> +static const s64 hm1246_link_freqs[] =3D {\=0A=
> >=0A=
> > Do we really need signed here?=0A=
> =0A=
> It is signed because v4l2_ctrl_new_int_menu uses 'const s64 *' as paramet=
er.=0A=
 =0A=
Oops, I missed.=0A=
=0A=
I initially thought, since link_frequency is never negative.=0A=
But to make it compile, we do need to use s64.=0A=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 42174000, /* 1420x990 @ 30Hz (RAW) */=0A=
> >> +};=0A=
> >> +=0A=
> >> +static const char *const hm1246_supply_names[] =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0 "avdd",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "iovdd",=0A=
> >> +=A0=A0=A0=A0=A0=A0 "dvdd",=0A=
> >> +};=0A=
> >> +=0A=
> >> +struct hm1246 {=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct device *dev;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev sd;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct media_pad pad;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct regulator_bulk_data supplies[ARRAY_SIZE(hm1=
246_supply_names)];=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct clk *xclk;=0A=
> >> +=A0=A0=A0=A0=A0=A0 unsigned long xclk_freq;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct gpio_desc *reset_gpio;=0A=
> >> +=A0=A0=A0=A0=A0=A0 unsigned int mbus_flags;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler ctrls;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *pixel_rate_ctrl;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *link_freq_ctrl;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *exposure_ctrl;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *vblank_ctrl;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *hblank_ctrl;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *hflip_ctrl;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *vflip_ctrl;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct regmap *regmap;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 bool identified;=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *cur_mode;=0A=
> >> +};=0A=
> >> +=0A=
> >> +static const struct cci_reg_sequence mode_1296x976_raw[] =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0 { HM1246_X_LA_START_REG, 60 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { HM1246_X_LA_END_REG, 1355 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { HM1246_Y_LA_START_REG, 0 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { HM1246_Y_LA_END_REG, 975 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { HM1246_OUTPUT_PRT_CTRL_REG, 0x20 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x300A), 0x01 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x300B), 0x00 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50F5), 0x01 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50DD), 0x00 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50A1), 0x02 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50AA), 0x1C },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50AC), 0xDD },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50AD), 0x08 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50AB), 0x04 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50A0), 0x40 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50A2), 0x12 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50AE), 0x30 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50B3), 0x04 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5200), 0x04 },=0A=
> >=0A=
> > ^^^1=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5204), 0x40 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5208), 0x55 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5209), 0x06 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x520B), 0x05 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x520D), 0x40 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5214), 0x18 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5215), 0x0F },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5217), 0x01 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5218), 0x07 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5219), 0x01 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x521A), 0x50 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x521B), 0x24 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5232), 0x01 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5220), 0x11 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5227), 0x01 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5106), 0xC1 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5115), 0xC0 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5116), 0xC1 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5138), 0x40 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5139), 0x60 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x513A), 0x80 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x513B), 0xA0 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x513C), 0xA1 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x513D), 0xA2 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x513E), 0xA3 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5140), 0x40 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5141), 0x60 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5142), 0x80 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5143), 0x81 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5144), 0x82 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5145), 0x83 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5146), 0x93 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C1), 0xC3 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C5), 0xC3 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C9), 0xC3 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CD), 0xC2 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D1), 0xC1 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D5), 0xC1 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D9), 0x81 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DD), 0x81 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C2), 0x49 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C6), 0x49 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CA), 0x49 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CE), 0x49 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D2), 0x49 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D6), 0x59 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DA), 0x59 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DE), 0x59 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C3), 0x20 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C7), 0x38 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CB), 0x21 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CF), 0x11 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D3), 0x11 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D7), 0x13 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DB), 0x13 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DF), 0x13 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51E0), 0x03 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51E2), 0x03 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51F0), 0x42 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51F1), 0x40 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51F2), 0x4A },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51F3), 0x48 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5015), 0x73 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x504A), 0x04 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5044), 0x07 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5040), 0x03 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5135), 0xC4 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5136), 0xC5 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5166), 0xC4 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5196), 0xC4 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C0), 0x10 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C4), 0x10 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C8), 0xA0 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CC), 0xA0 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D0), 0xA1 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D4), 0xA5 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D8), 0xA5 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DC), 0xA5 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5200), 0xE4 },=0A=
> >=0A=
> > It seems that these register writes are duplicated (see above '1'). The=
 same entries=0A=
> > appear earlier in the code, so I suggest keeping only the last occurren=
ce.=0A=
> >=0A=
> > There might be other repeated register entries as well=0A=
> =0A=
> Many registers are not even mentioned in the data sheet, and this=0A=
> register sequence is provided by the manufacturer. Since I cannot tell=0A=
> with certainty whether these are simply static registers or whether a=0A=
> sequence must be followed here, I am reluctant to remove register accesse=
s.=0A=
=0A=
You should test it to make sure the sequence isn=92t actually required.=0A=
So you can keep only the last instance of every repeated register and=0A=
test your driver.=0A=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5209), 0x04 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x301B), 0x01 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3130), 0x01 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5013), 0x07 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5016), 0x01 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x501D), 0x50 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0350), 0xFE },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0343), 0x8C },=0A=
> >=0A=
> > I believe this is a line length register, which you are already=0A=
> > setting in hm1246_setup_moderegs. You can remove this entry here.=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x2F03), 0x15 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD380), 0x00 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3047), 0x7F },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x304D), 0x34 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3041), 0x4B },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3042), 0x2D },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3056), 0x64 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3059), 0x1E },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x305E), 0x10 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x305F), 0x10 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x306D), 0x10 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x306E), 0x0C },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3064), 0x50 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3067), 0x78 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3068), 0x4B },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x306A), 0x78 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x306B), 0x4B },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD442), 0x3D },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD443), 0x06 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD440), 0x63 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD446), 0xB0 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD447), 0x60 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD448), 0x48 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD449), 0x30 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD44A), 0x18 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD360), 0x03 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30AC), 0x10 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30AD), 0x10 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30AE), 0x10 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3040), 0x0B },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x2002), 0x00 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x2000), 0x08 },=0A=
> >> +};=0A=
> >> +=0A=
> >> +struct hm1246_reg_list {=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 num_of_regs;=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct cci_reg_sequence *regs;=0A=
> >> +};=0A=
> >> +=0A=
> >> +struct hm1246_mode {=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 codes[4];=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 link_freq_index;=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 clocks_per_pixel;=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 top;=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 left;=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 width;=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 height;=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 hts;=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 vts_min;=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct hm1246_reg_list reg_list;=0A=
> >> +};=0A=
> >> +=0A=
> >> +#define FLIP_FORMAT_INDEX(v, h) ((v ? 2 : 0) | (h ? 1 : 0))=0A=
> >> +=0A=
> >> +/* Get the format code of the mode considering current flip setting. =
*/=0A=
> >> +static u32 hm1246_get_format_code(struct hm1246 *hm1246,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *hm1246_mode)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 return hm1246_mode->codes[FLIP_FORMAT_INDEX(hm1246=
->vflip_ctrl->val,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 hm1246->hflip_ctrl->val)];=0A=
> >> +}=0A=
> >> +=0A=
> >> +static const struct hm1246_mode hm1246_modes[] =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0 {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .codes =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [F=
LIP_FORMAT_INDEX(0, 0)] =3D MEDIA_BUS_FMT_SBGGR10_1X10,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [F=
LIP_FORMAT_INDEX(0, 1)] =3D MEDIA_BUS_FMT_SGBRG10_1X10,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [F=
LIP_FORMAT_INDEX(1, 0)] =3D MEDIA_BUS_FMT_SGRBG10_1X10,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [F=
LIP_FORMAT_INDEX(1, 1)] =3D MEDIA_BUS_FMT_SRGGB10_1X10,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .link_freq_index =3D 0,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .clocks_per_pixel =3D 1,=
=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .top =3D 0,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .left =3D 0,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .width =3D 1296,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .height =3D 976,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .hts =3D 1420,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .vts_min =3D 990,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .reg_list =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .n=
um_of_regs =3D ARRAY_SIZE(mode_1296x976_raw),=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .r=
egs =3D mode_1296x976_raw,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 },=0A=
> >> +};=0A=
> >> +=0A=
> >> +static inline struct hm1246 *to_hm1246(struct v4l2_subdev *sd)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 return container_of(sd, struct hm1246, sd);=0A=
> >=0A=
> > Use container_of_const.=0A=
> >=0A=
> >> +}=0A=
> >> +=0A=
> >> +static const struct hm1246_mode *=0A=
> >> +hm1246_find_mode_by_mbus_code(struct hm1246 *hm1246, u32 code)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 for (int i =3D 0; i < ARRAY_SIZE(hm1246_modes); i+=
+) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (code =3D=3D hm1246_get=
_format_code(hm1246, &hm1246_modes[i]))=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 re=
turn &hm1246_modes[i];=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return ERR_PTR(-EINVAL);=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_power_on(struct device *dev)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D regulator_bulk_enable(ARRAY_SIZE(hm1246_su=
pply_names),=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->supplies);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "fail=
ed to enable regulators\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D clk_prepare_enable(hm1246->xclk);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 regulator_bulk_disable(ARR=
AY_SIZE(hm1246_supply_names),=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->supplies);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "fail=
ed to enable clock\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 gpiod_set_value_cansleep(hm1246->reset_gpio, 0);=
=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 /*=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 * XSHUTDOWN to crystal clock oscillation:=A0 tc=
rystal typ.=A0 650us=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 * Sample bootstrap pin:=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tsample=A0 max. 2000us=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 * Built in self test:=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tbist=A0=A0=A0 max. 3000us=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 */=0A=
> >> +=A0=A0=A0=A0=A0=A0 fsleep(6000);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_power_off(struct device *dev)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 gpiod_set_value_cansleep(hm1246->reset_gpio, 1);=
=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 clk_disable_unprepare(hm1246->xclk);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 regulator_bulk_disable(ARRAY_SIZE(hm1246_supply_na=
mes),=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 hm1246->supplies);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_enum_mbus_code(struct v4l2_subdev *sd,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_mbus_code_enum *code)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (code->index >=3D ARRAY_SIZE(hm1246_modes))=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 code->code =3D hm1246_get_format_code(hm1246, &hm1=
246_modes[code->index]);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_enum_frame_size(struct v4l2_subdev *subdev,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_frame_size_enum *fse)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(subdev);=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode =3D NULL;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (fse->index > 0)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 mode =3D hm1246_find_mode_by_mbus_code(hm1246, fse=
->code);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(mode))=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(mode);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 fse->min_width =3D mode->width;=0A=
> >> +=A0=A0=A0=A0=A0=A0 fse->max_width =3D mode->width;=0A=
> >> +=A0=A0=A0=A0=A0=A0 fse->min_height =3D mode->height;=0A=
> >> +=A0=A0=A0=A0=A0=A0 fse->max_height =3D mode->height;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_update_controls(struct hm1246 *hm1246,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 s64 pixel_rate, exposure_max, vblank, hblank;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_s_ctrl(hm1246->link_freq_ctrl,=
 mode->link_freq_index);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "link=
_freq ctrl range update failed\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 pixel_rate =3D div_u64(hm1246_link_freqs[mode->lin=
k_freq_index],=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 mode->clocks_per_pixel);=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->pixel_rat=
e_ctrl, pixel_rate,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pixel_rate, 1, pixel_rate);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "pixe=
l_rate ctrl range update failed\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 vblank =3D mode->vts_min - mode->height,=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->vblank_ct=
rl, vblank,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_VTS_MAX - mode->height, 1=
,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vblank);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "vbla=
nk ctrl range update failed\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hblank =3D mode->hts - mode->width;=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->hblank_ct=
rl, hblank, hblank, 1,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hblank);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "hbla=
nk ctrl range update failed\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 exposure_max =3D mode->vts_min - HM1246_COARSE_INT=
G_MARGIN;=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->exposure_=
ctrl,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_COARSE_INTG_MIN, exposure=
_max,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_COARSE_INTG_STEP, exposur=
e_max);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "expo=
sure ctrl range update failed\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static void hm1246_update_pad_format(struct hm1246 *hm1246,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *hm1246_mode,=
=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_mbus_framefmt *fmt)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 fmt->width =3D hm1246_mode->width;=0A=
> >> +=A0=A0=A0=A0=A0=A0 fmt->height =3D hm1246_mode->height;=0A=
> >> +=A0=A0=A0=A0=A0=A0 fmt->code =3D hm1246_get_format_code(hm1246, hm124=
6_mode);=0A=
> >> +=A0=A0=A0=A0=A0=A0 fmt->field =3D V4L2_FIELD_NONE;=0A=
> >> +=A0=A0=A0=A0=A0=A0 fmt->colorspace =3D V4L2_COLORSPACE_RAW;=0A=
> >> +=A0=A0=A0=A0=A0=A0 fmt->ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(fmt-=
>colorspace);=0A=
> >> +=A0=A0=A0=A0=A0=A0 fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE=
;=0A=
> >> +=A0=A0=A0=A0=A0=A0 fmt->xfer_func =3D V4L2_XFER_FUNC_NONE;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_set_format(struct v4l2_subdev *sd,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 struct v4l2_subdev_state *state,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 struct v4l2_subdev_format *fmt)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_mbus_framefmt *mbus_fmt;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_rect *crop;=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 mode =3D hm1246_find_mode_by_mbus_code(hm1246, fmt=
->format.code);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(mode))=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode =3D &hm1246_modes[0];=
=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 crop =3D v4l2_subdev_state_get_crop(state, 0);=0A=
> >> +=A0=A0=A0=A0=A0=A0 crop->top =3D mode->top;=0A=
> >> +=A0=A0=A0=A0=A0=A0 crop->left =3D mode->left;=0A=
> >> +=A0=A0=A0=A0=A0=A0 crop->width =3D mode->width;=0A=
> >> +=A0=A0=A0=A0=A0=A0 crop->height =3D mode->height;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246_update_pad_format(hm1246, mode, &fmt->forma=
t);=0A=
> >> +=A0=A0=A0=A0=A0=A0 mbus_fmt =3D v4l2_subdev_state_get_format(state, 0=
);=0A=
> >> +=A0=A0=A0=A0=A0=A0 *mbus_fmt =3D fmt->format;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->cur_mode =3D mode;=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246_update_controls(hm1246, mode);=0A=
> >=0A=
> > I believe hm1246_update_controls could fail, so you should check=0A=
> > for errors here.=0A=
> >=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_get_selection(struct v4l2_subdev *sd,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_selection *sel)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode =3D hm1246->cur_mod=
e;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 switch (sel->target) {=0A=
> >> +=A0=A0=A0=A0=A0=A0 case V4L2_SEL_TGT_CROP:=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r =3D *v4l2_subdev_st=
ate_get_crop(state, 0);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 case V4L2_SEL_TGT_NATIVE_SIZE:=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.top =3D 0;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.left =3D 0;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.width =3D HM1246_NA=
TIVE_WIDTH;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.height =3D HM1246_N=
ATIVE_HEIGHT;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 case V4L2_SEL_TGT_CROP_DEFAULT:=0A=
> >> +=A0=A0=A0=A0=A0=A0 case V4L2_SEL_TGT_CROP_BOUNDS:=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.top =3D mode->top;=
=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.left =3D mode->left=
;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.width =3D mode->wid=
th;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.height =3D mode->he=
ight;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 default:=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_init_state(struct v4l2_subdev *sd,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 struct v4l2_subdev_state *state)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_format fmt =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .which =3D V4L2_SUBDEV_FOR=
MAT_TRY,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .pad =3D 0,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .format =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .c=
ode =3D hm1246_get_format_code(hm1246,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 &hm1246_modes[0]),=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .w=
idth =3D hm1246_modes[0].width,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .h=
eight =3D hm1246_modes[0].height,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 };=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246_set_format(sd, state, &fmt);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_calc_pll(struct hm1246 *hm1246, u32 xclk, u32 link_=
freq,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 u32 clocks_per_pixel, u8 *pll1, u8 *pll2, u8 *pll3)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 const u8 pclk_div_table[] =3D { 4, 5, 6, 7, 8, 12,=
 14, 16 };=0A=
> >> +=A0=A0=A0=A0=A0=A0 const u8 sysclk_div_table[] =3D { 1, 2, 3, 4 };=0A=
> >> +=A0=A0=A0=A0=A0=A0 const u8 post_div_table[] =3D { 1, 2, 4, 8 };=0A=
> >> +=A0=A0=A0=A0=A0=A0 const int sysclk_pclk_ratio =3D 3; /* Recommended =
value */=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 pclk, vco_out, best_vco_diff;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int pclk_div_index, sysclk_div_index, post_div_ind=
ex;=0A=
> >> +=A0=A0=A0=A0=A0=A0 u8 pre_div, multiplier_h, multiplier_l;=0A=
> >> +=A0=A0=A0=A0=A0=A0 bool sysclk_pclk_ratio_found =3D false;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (link_freq < HM1246_PCLK_MIN || link_freq > HM1=
246_PCLK_MAX)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 /* In raw mode (1 pixel per clock) the pixel clock=
 is internally=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 * divided by two.=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 */=0A=
> >=0A=
> > /*=0A=
> >=A0=A0 * In raw mode (1 pixel per clock) the pixel clock is internally=
=0A=
> >=A0=A0 * divided by two.=0A=
> >=A0=A0 */=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 pclk =3D (2 * link_freq) / clocks_per_pixel;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 /* Find suitable PCLK and SYSCLK dividers. */=0A=
> >> +=A0=A0=A0=A0=A0=A0 for (pclk_div_index =3D 0; pclk_div_index < ARRAY_=
SIZE(pclk_div_table);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pclk_div_index++) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for (sysclk_div_index =3D =
0;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_div_=
index < ARRAY_SIZE(sysclk_div_table);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_div_=
index++) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if=
 (sysclk_div_table[sysclk_div_index] *=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_pclk_ratio =3D=3D=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 pclk_div_table[pclk_div_index]) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 sysclk_pclk_ratio_found =3D true;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=
=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sysclk_pclk_ratio_foun=
d)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 br=
eak;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (!sysclk_pclk_ratio_found)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 /* Determine an appropriate post divider. */=0A=
> >> +=A0=A0=A0=A0=A0=A0 for (post_div_index =3D 0; post_div_index < ARRAY_=
SIZE(post_div_table);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 post_div_index++) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco_out =3D pclk * (pclk_d=
iv_table[pclk_div_index] *=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 post_div_table[post_div_index]);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (vco_out >=3D HM1246_PL=
L_VCO_MIN &&=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco_out <=3D H=
M1246_PLL_VCO_MAX)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 br=
eak;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (post_div_index >=3D ARRAY_SIZE(post_div_table)=
)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 /* Find best pre-divider and multiplier values. */=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 best_vco_diff =3D U32_MAX;=0A=
> >> +=A0=A0=A0=A0=A0=A0 for (u32 div =3D DIV_ROUND_UP(xclk, HM1246_PLL_INC=
LK_MAX);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 div <=3D (xclk / HM1246_PLL_INCLK_M=
IN); div++) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 multi, multi_h, multi_=
l, vco, diff;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi =3D DIV_ROUND_CLOSES=
T_ULL((u64)vco_out * div, xclk);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (multi < HM1246_PLL_MUL=
TI_MIN ||=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi > HM1246=
_PLL_MULTI_MAX)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 co=
ntinue;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi_h =3D multi / (HM124=
6_PLL_MULTI_H_MIN *=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL_MULTI_L_MAX) +=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 2;=0A=
> >=0A=
> > HM1246_PLL_MULTI_L_MAX) + 2;=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi_l =3D multi / multi_=
h;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco =3D div_u64((u64)xclk =
* multi_h * multi_l, div);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 diff =3D abs(vco_out - vco=
);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (diff < best_vco_diff) =
{=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 be=
st_vco_diff =3D diff;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pr=
e_div =3D div;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mu=
ltiplier_h =3D multi_h;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mu=
ltiplier_l =3D multi_l;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!diff)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 br=
eak;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (best_vco_diff =3D=3D U32_MAX)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 *pll1 =3D HM1246_PLL1CFG_MULTIPLIER(multiplier_l -=
 1);=0A=
> >> +=A0=A0=A0=A0=A0=A0 *pll2 =3D HM1246_PLL2CFG_PRE_DIV(pre_div - 1) |=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL2CFG_MULTIPLIER(=
multiplier_h - 2);=0A=
> >> +=A0=A0=A0=A0=A0=A0 *pll3 =3D HM1246_PLL3CFG_POST_DIV(post_div_index) =
|=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL3CFG_SYSCLK_DIV(=
sysclk_div_index) |=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL3CFG_PCLK_DIV(pc=
lk_div_index);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_cci_write_pll(struct hm1246 *hm1246, u8 pll1, u8 pl=
l2,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 u8 pll3)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct cci_reg_sequence pll_regs[] =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_PLL1CFG_REG, pll1=
 },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_PLL2CFG_REG, pll2=
 },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_PLL3CFG_REG, pll3=
 },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_SBC_CTRL_REG, HM1=
246_SBC_CTRL_PLL_EN },=0A=
> >> +=A0=A0=A0=A0=A0=A0 };=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return cci_multi_reg_write(hm1246->regmap, pll_reg=
s,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(pll_regs), NULL);=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_pll_check_locked(struct hm1246 *hm1246)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 u64 boot_ref2;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D cci_read(hm1246->regmap, HM1246_SBC_BOOT_R=
EF2_REG, &boot_ref2,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NULL)=
;=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return (boot_ref2 & HM1246_SBC_BOOT_REF2_PLL_LOCK)=
 ? 0 : -EIO;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_setup_pll(struct hm1246 *hm1246,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 const struct hm1246_mode *mode)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 u8 pll1, pll2, pll3;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_calc_pll(hm1246, hm1246->xclk_freq,=
=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 hm1246_link_freqs[mode->link_freq_index],=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 mode->clocks_per_pixel, &pll1, &pll2, &pll3);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_cci_write_pll(hm1246, pll1, pll2, p=
ll3);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 /* PLL lock time: tpll typ. 100us */=0A=
> >> +=A0=A0=A0=A0=A0=A0 fsleep(200);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_pll_check_locked(hm1246);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_cci_write_test_pattern(struct hm1246 *hm1246, u8 mo=
de, u16 r,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u16 g, u16 b)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct cci_reg_sequence tpg_enable_regs[] =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_TEST_DATA_RED_REG=
, r },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_TEST_DATA_GR_REG,=
 g },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_TEST_DATA_GB_REG,=
 g },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_TEST_DATA_BLUE_RE=
G, b },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_TEST_PATTERN_MODE=
_REG, mode },=0A=
> >> +=A0=A0=A0=A0=A0=A0 };=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return cci_multi_reg_write(hm1246->regmap, tpg_ena=
ble_regs,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(tpg_enable_regs), NULL);=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_test_pattern(struct hm1246 *hm1246, u32 pattern_ind=
ex)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 const u16 RGBMAX =3D 0x3FF;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int pattern;=0A=
> >> +=A0=A0=A0=A0=A0=A0 u8 mode =3D HM1246_TEST_PATTERN_MODE_ENABLE;=0A=
> >> +=A0=A0=A0=A0=A0=A0 u16 r =3D 0, g =3D 0, b =3D 0;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 switch (pattern_index) {=0A=
> >> +=A0=A0=A0=A0=A0=A0 case 1: /* Checkboard Pattern */=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 0;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 case 2: /* Ramp */=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 1;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 case 3: /* Moving ones */=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 2;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 case 4: /* Blending color bars */=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 3;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 case 5: /* Color bars */=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 4;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 case 6: /* Solid white */=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 15;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r =3D RGBMAX;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 g =3D RGBMAX;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 b =3D RGBMAX;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 case 7: /* Solid black */=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 15;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 case 8: /* Solid red */=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 15;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r =3D RGBMAX;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 case 9: /* Solid green */=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 15;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 g =3D RGBMAX;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 case 10: /* Solid blue */=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 15;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 b =3D RGBMAX;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 case 0: /* Disabled */=0A=
> >> +=A0=A0=A0=A0=A0=A0 default:=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode =3D 0;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 0;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 mode |=3D HM1246_TEST_PATTERN_MODE_MODE(pattern);=
=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return hm1246_cci_write_test_pattern(hm1246, mode,=
 r, g, b);=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_cci_write_cmu(struct hm1246 *hm1246, u32 reg, u64 v=
al)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct cci_reg_sequence reg_seq[] =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { reg, val },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_CMU_UPDATE_REG, 0=
 },=0A=
> >> +=A0=A0=A0=A0=A0=A0 };=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return cci_multi_reg_write(hm1246->regmap, reg_seq=
, ARRAY_SIZE(reg_seq),=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NULL);=0A=
> >> +}=0A=
> >=0A=
> > Do we really need this function ??=0A=
> >=0A=
> > I guess In hm1246_set_ctrl after switch case you can write like:=0A=
> > cci_write(hm1246->regmap, HM1246_CMU_UPDATE_REG, 0, &ret);=0A=
> =0A=
> Currently, this is required for most controls, but not for all of them,=
=0A=
> such as V4L2_CID_TEST_PATTERN.=0A=
> And currently, it is only one access instead of two otherwise.=0A=
=0A=
static int hm1246_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
{=0A=
	int ret =3D 0;=0A=
	bool needs_cmu_update =3D false;=0A=
	=0A=
	switch (ctrl->id) {=0A=
	case V4L2_CID_EXPOSURE:=0A=
	        cci_write(hm1246, HM1246_COARSE_INTG_REG, ctrl->val, &ret);=0A=
	        needs_cmu_update =3D true;=0A=
	        break;=0A=
	=0A=
	case V4L2_CID_TEST_PATTERN:=0A=
	        ret =3D hm1246_test_pattern(hm1246, ctrl->val);=0A=
	        break;=0A=
	=0A=
	default:=0A=
	        ret =3D -EINVAL;=0A=
	        break;=0A=
	}=0A=
	=0A=
	if (needs_cmu_update)=0A=
		cci_write(hm1246->regmap, HM1246_CMU_UPDATE_REG, 0, &ret);=0A=
	=0A=
	pm_runtime_put(hm1246->dev);=0A=
	=0A=
	return ret;=0A=
}=0A=
=0A=
> >> +static int hm1246_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D container_of(ctrl->handl=
er, struct hm1246,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrls);=0A=
> >=0A=
> > Use container_of_const.=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct v4l2_mbus_framefmt *format;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state;=0A=
> >> +=A0=A0=A0=A0=A0=A0 u32 val;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 state =3D v4l2_subdev_get_locked_active_state(&hm1=
246->sd);=0A=
> >> +=A0=A0=A0=A0=A0=A0 format =3D v4l2_subdev_state_get_format(state, 0);=
=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s64 exposure_max;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max =3D=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fo=
rmat->height + ctrl->val - HM1246_COARSE_INTG_MARGIN;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify=
_range(hm1246->exposure_ctrl,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->=
exposure_ctrl->minimum,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure=
_max,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->=
exposure_ctrl->step,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure=
_max);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 de=
v_err(hm1246->dev, "exposure ctrl range update failed\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 re=
turn ret;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_active(hm1246->dev))=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 switch (ctrl->id) {=0A=
> >> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_EXPOSURE:=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_cci_write_c=
mu(hm1246, HM1246_COARSE_INTG_REG,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->val);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_ANALOGUE_GAIN:=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_cci_write_c=
mu(hm1246,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_ANALOG_GLOBAL=
_GAIN_REG,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->val);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VBLANK:=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val =3D hm1246->cur_mode->=
height + ctrl->val;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_cci_write_c=
mu(hm1246,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_FRAME_LENGTH_=
LINES_REG, val);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_HFLIP:=0A=
> >> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VFLIP:=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val =3D 0;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (hm1246->hflip_ctrl->va=
l)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 va=
l |=3D HM1246_IMAGE_ORIENTATION_HFLIP;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (hm1246->vflip_ctrl->va=
l)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 va=
l |=3D HM1246_IMAGE_ORIENTATION_VFLIP;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_cci_write_c=
mu(hm1246, HM1246_IMAGE_ORIENTATION_REG,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_TEST_PATTERN:=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_test_patter=
n(hm1246, ctrl->val);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 default:=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -EINVAL;=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(hm1246->dev);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static const struct v4l2_ctrl_ops hm1246_ctrl_ops =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0 .s_ctrl =3D hm1246_set_ctrl,=0A=
> >> +};=0A=
> >> +=0A=
> >> +static int hm1246_identify_module(struct hm1246 *hm1246)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 u64 model_id;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (hm1246->identified)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D cci_read(hm1246->regmap, HM1246_MODEL_ID_R=
EG, &model_id, NULL);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (model_id !=3D HM1246_MODEL_ID) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "mode=
l id mismatch: 0x%llx!=3D0x%x\n",=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mo=
del_id, HM1246_MODEL_ID);=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENXIO;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->identified =3D true;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_setup_moderegs(struct hm1246 *hm1246,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct hm1246_reg_list *reg_list =3D &mode->=
reg_list;=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct cci_reg_sequence modeaw[] =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_X_ADDR_START_REG,=
 mode->left },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_Y_ADDR_START_REG,=
 mode->top },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_X_ADDR_END_REG, m=
ode->width - 1 },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_Y_ADDR_END_REG, m=
ode->height - 1 },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_DWIN_XOFFSET_REG,=
 mode->left },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_DWIN_YOFFSET_REG,=
 mode->top },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_DWIN_XSIZE_REG, m=
ode->width },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_DWIN_YSIZE_REG, m=
ode->height },=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_LINE_LENGTH_PCK_R=
EG, mode->hts },=0A=
> >> +=A0=A0=A0=A0=A0=A0 };=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 cci_multi_reg_write(hm1246->regmap, modeaw, ARRAY_=
SIZE(modeaw), &ret);=0A=
> >> +=A0=A0=A0=A0=A0=A0 cci_multi_reg_write(hm1246->regmap, reg_list->regs=
,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 reg_list->num_of_regs, &ret);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_setup_bus(struct hm1246 *hm1246)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 u64 polarity_ctrl =3D 0, pclk_ctrl =3D 0;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (hm1246->mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LO=
W)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 polarity_ctrl |=3D HM1246_=
POLARITY_CTRL_HSYNC;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (hm1246->mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LO=
W)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 polarity_ctrl |=3D HM1246_=
POLARITY_CTRL_VSYNC;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap, HM1246_POLARITY_CTRL_REG=
, polarity_ctrl,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &ret);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 /* If the clock output polarity flag PCLK_CTRL[3] =
is set (high), the=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 * data lines change state on the falling edge o=
f PCLK and should=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 * therefore be sampled on the rising edge.=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 * This is different than described in the data =
sheet.=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 */=0A=
> >=0A=
> > /*=0A=
> >=A0=A0 * This is=0A=
> >=A0=A0 * the correct format.=0A=
> >=A0=A0 */=0A=
> >=0A=
> > Correct this for all multiline comments.=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (hm1246->mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RIS=
ING)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pclk_ctrl |=3D HM1246_PCLK=
_CTRL_POL;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap, HM1246_PCLK_CTRL_REG, pc=
lk_ctrl, &ret);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_enable_streams(struct v4l2_subdev *sd,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state, u32 pad,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 u64 streams_mask)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode =3D hm1246->cur_mod=
e;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D pm_runtime_resume_and_get(hm1246->dev);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_identify_module(hm1246);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> >=0A=
> > Why do we need to check this every time when enabling the stream?=0A=
> > Can we check it only once in the probe function?=0A=
> >=0A=
> > Also, drop "identified" from the hm1246 struct.=0A=
> > After the change above, it will no longer be needed.=0A=
> =0A=
> Since the sensor is not even switched on at startup,=0A=
=0A=
Hmm, you are right.=0A=
=0A=
> it cannot be=0A=
> identified there. This therefore happens once, when the sensor is=0A=
> actually used for the first time. This behavior is also implemented by=0A=
> some other drivers.=0A=
> =0A=
> >=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_setup_pll(hm1246, mode);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "fail=
ed to setup PLL\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_setup_moderegs(hm1246, mode);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_setup_bus(hm1246);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_handler_setup(&hm1246->ctrls);=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "fail=
ed to setup v4l2 controls\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(hm1246->regmap, HM1246_MODE_SELE=
CT_REG,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM=
1246_MODE_SELECT_STREAM, NULL);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 /* Since mirroring may change the actual pixel for=
mat, it must not be=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 * changed during streaming.=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0 */=0A=
> >> +=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(hm1246->vflip_ctrl, true);=0A=
> >> +=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(hm1246->hflip_ctrl, true);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +=0A=
> >> +err_rpm_put:=0A=
> >> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(hm1246->dev);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_disable_streams(struct v4l2_subdev *sd,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state, u32 pad,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 streams_mask)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(hm1246->regmap, HM1246_MODE_SELE=
CT_REG,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM=
1246_MODE_SELECT_STANDBY, NULL);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(hm1246->vflip_ctrl, false);=0A=
> >> +=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(hm1246->hflip_ctrl, false);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(hm1246->dev);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static const struct v4l2_subdev_video_ops hm1246_video_ops =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0 .s_stream =3D v4l2_subdev_s_stream_helper,=0A=
> >> +=0A=
> >=0A=
> > Droup extra line.=0A=
> >=0A=
> >> +};=0A=
> >> +=0A=
> >> +static const struct v4l2_subdev_pad_ops hm1246_subdev_pad_ops =3D {=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 .enum_mbus_code =3D hm1246_enum_mbus_code,=0A=
> >> +=A0=A0=A0=A0=A0=A0 .enum_frame_size =3D hm1246_enum_frame_size,=0A=
> >> +=A0=A0=A0=A0=A0=A0 .get_fmt =3D v4l2_subdev_get_fmt,=0A=
> >> +=A0=A0=A0=A0=A0=A0 .set_fmt =3D hm1246_set_format,=0A=
> >> +=A0=A0=A0=A0=A0=A0 .get_selection =3D hm1246_get_selection,=0A=
> >> +=A0=A0=A0=A0=A0=A0 .enable_streams =3D hm1246_enable_streams,=0A=
> >> +=A0=A0=A0=A0=A0=A0 .disable_streams =3D hm1246_disable_streams,=0A=
> >> +};=0A=
> >> +=0A=
> >> +static int __maybe_unused hm1246_g_register(struct v4l2_subdev *sd,=
=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_dbg_r=
egister *reg)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> >> +=A0=A0=A0=A0=A0=A0 u64 val;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_in_use(sd->dev))=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D cci_read(hm1246->regmap, CCI_REG8(reg->reg=
), &val, NULL);=0A=
> >> +=A0=A0=A0=A0=A0=A0 reg->val =3D val;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(sd->dev);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int __maybe_unused hm1246_s_register(struct v4l2_subdev *sd,=
=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct v4l2=
_dbg_register *reg)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_in_use(sd->dev))=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(hm1246->regmap, CCI_REG8(reg->re=
g), (u64)reg->val,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NU=
LL);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(sd->dev);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static const struct v4l2_subdev_core_ops hm1246_core_ops =3D {=0A=
> >> +#ifdef CONFIG_VIDEO_ADV_DEBUG=0A=
> >> +=A0=A0=A0=A0=A0=A0 .g_register =3D hm1246_g_register,=0A=
> >> +=A0=A0=A0=A0=A0=A0 .s_register =3D hm1246_s_register,=0A=
> >> +#endif=0A=
> >> +=A0=A0=A0=A0=A0=A0 .subscribe_event =3D v4l2_ctrl_subdev_subscribe_ev=
ent,=0A=
> >> +=A0=A0=A0=A0=A0=A0 .unsubscribe_event =3D v4l2_event_subdev_unsubscri=
be,=0A=
> >=0A=
> > Droup this.=0A=
> >=0A=
> > see: https://lore.kernel.org/linux-media/20241029162106.3005800-1-tomm.=
merciai@gmail.com=0A=
> >=0A=
> >> +};=0A=
> >> +=0A=
> >> +static const struct v4l2_subdev_ops hm1246_subdev_ops =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0 .core =3D &hm1246_core_ops,=0A=
> >> +=A0=A0=A0=A0=A0=A0 .video =3D &hm1246_video_ops,=0A=
> >> +=A0=A0=A0=A0=A0=A0 .pad =3D &hm1246_subdev_pad_ops,=0A=
> >> +};=0A=
> >> +=0A=
> >> +static const struct v4l2_subdev_internal_ops hm1246_internal_ops =3D =
{=0A=
> >> +=A0=A0=A0=A0=A0=A0 .init_state =3D hm1246_init_state,=0A=
> >> +};=0A=
> >> +=0A=
> >> +static int hm1246_get_regulators(struct device *dev, struct hm1246 *h=
m1246)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 unsigned int i;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < ARRAY_SIZE(hm1246_supply_names);=
 i++)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->supplies[i].supply=
 =3D hm1246_supply_names[i];=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return devm_regulator_bulk_get(dev, ARRAY_SIZE(hm1=
246_supply_names),=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->supplies);=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_parse_fwnode(struct hm1246 *hm1246)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct fwnode_handle *endpoint;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_fwnode_endpoint bus_cfg =3D {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .bus_type =3D V4L2_MBUS_PA=
RALLEL,=0A=
> >> +=A0=A0=A0=A0=A0=A0 };=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct device *dev =3D hm1246->dev;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 endpoint =3D fwnode_graph_get_endpoint_by_id(dev_f=
wnode(dev), 0, 0,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 FWNODE_GRAPH_ENDPOINT_NEXT);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (!endpoint)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, =
-EINVAL, "missing endpoint node\n");=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_fwnode_endpoint_parse(endpoint, &bus_=
cfg);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(dev, ret, "p=
arsing endpoint node failed\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto done;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->mbus_flags =3D bus_cfg.bus.parallel.flags;=
=0A=
> >> +=0A=
> >> +done:=0A=
> >> +=A0=A0=A0=A0=A0=A0 fwnode_handle_put(endpoint);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_init_controls(struct hm1246 *hm1246)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(=
&hm1246->sd);=0A=
> >=0A=
> > Unused, droup this.=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode =3D &hm1246_modes[0=
];=0A=
> >> +=A0=A0=A0=A0=A0=A0 const struct v4l2_ctrl_ops *ops =3D &hm1246_ctrl_o=
ps;=0A=
> >=0A=
> > Unused, droup this.=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_fwnode_device_properties props;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler *ctrl_hdlr;=0A=
> >> +=A0=A0=A0=A0=A0=A0 s64 pixel_rate, exposure_max, vblank_min, hblank;=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ctrl_hdlr =3D &hm1246->ctrls;=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 9);=0A=
> >=0A=
> > v4l2_ctrl_new_fwnode_properties() adds 2 more, so this should be 11.=0A=
> >=0A=
> > No need to check the return value explicitly here.=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->hflip_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr=
, &hm1246_ctrl_ops,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID=
_HFLIP, 0, 1, 1, 0);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (hm1246->hflip_ctrl)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->hflip_ctrl->flags =
|=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->vflip_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr=
, &hm1246_ctrl_ops,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID=
_VFLIP, 0, 1, 1, 0);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (hm1246->vflip_ctrl)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->vflip_ctrl->flags =
|=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_cluster(2, &hm1246->hflip_ctrl);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->link_freq_ctrl =3D=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_int_menu(ctr=
l_hdlr,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &hm1246_ctrl_ops,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_LINK_FREQ,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(hm1246_link_freqs) - =
1,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246_link_freqs);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (hm1246->link_freq_ctrl)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->link_freq_ctrl->fl=
ags |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 pixel_rate =3D div_u64(hm1246_link_freqs[mode->lin=
k_freq_index],=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 mode->clocks_per_pixel);=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->pixel_rate_ctrl =3D v4l2_ctrl_new_std(ctrl=
_hdlr, &hm1246_ctrl_ops,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 V4L2_CID_PIXEL_RATE, 0,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 pixel_rate, 1, pixel_rate);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 vblank_min =3D mode->vts_min - mode->height;=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->vblank_ctrl =3D v4l2_ctrl_new_std(ctrl_hdl=
r, &hm1246_ctrl_ops,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_=
CID_VBLANK, vblank_min,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM124=
6_VTS_MAX - mode->height,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, vb=
lank_min);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hblank =3D mode->hts - mode->width;=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->hblank_ctrl =3D v4l2_ctrl_new_std(ctrl_hdl=
r, &hm1246_ctrl_ops,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_=
CID_HBLANK, hblank, hblank,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, hb=
lank);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (hm1246->hblank_ctrl)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->hblank_ctrl->flags=
 |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std(ctrl_hdlr, &hm1246_ctrl_ops, V4L=
2_CID_ANALOGUE_GAIN,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 HM1246_ANALOG_GLOBAL_GAIN_MIN,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 HM1246_ANALOG_GLOBAL_GAIN_MAX,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 HM1246_ANALOG_GLOBAL_GAIN_STEP,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 HM1246_ANALOG_GLOBAL_GAIN_MIN);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 exposure_max =3D mode->vts_min - HM1246_COARSE_INT=
G_MARGIN;=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->exposure_ctrl =3D v4l2_ctrl_new_std(ctrl_h=
dlr, &hm1246_ctrl_ops,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 V4L2_CID_EXPOSURE,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 HM1246_COARSE_INTG_MIN,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 exposure_max,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 HM1246_COARSE_INTG_STEP,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 exposure_max);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &hm1246_ct=
rl_ops,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_TEST_PATTERN,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(hm1246_test_pattern_menu) -=
 1,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0, 0, hm1246_test_pattern_menu);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_fwnode_device_parse(&client->dev, &pr=
ops);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_v4l2_ctrl_handler=
_free;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr,=
 ops, &props);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_v4l2_ctrl_handler=
_free;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ctrl_hdlr->error) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ctrl_hdlr->error;=
=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_v4l2_ctrl_handler=
_free;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->sd.ctrl_handler =3D ctrl_hdlr;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >> +=0A=
> >> +err_v4l2_ctrl_handler_free:=0A=
> >> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +}=0A=
> >> +=0A=
> >> +static int hm1246_probe(struct i2c_client *client)=0A=
> >> +{=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct device *dev =3D &client->dev;=0A=
> >> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246;=0A=
> >> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246 =3D devm_kzalloc(dev, sizeof(*hm1246), GFP_=
KERNEL);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (!hm1246)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->dev =3D dev;=0A=
> >=0A=
> > No need for a temporary variable.=0A=
> =0A=
> Since the variable is used more than 10 times, I thought it would be wort=
h.=0A=
 =0A=
I still don't think we should use a temporary variable.=0A=
Since we have the option, Using hm1246->dev directly keeps things =0A=
simpler, just like how it's done in pm_runtime's functions.=0A=
=0A=
> >=0A=
> > hm1246->dev =3D &client->dev;=0A=
> >=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_parse_fwnode(hm1246);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->regmap =3D devm_cci_regmap_init_i2c(client=
, 16);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(hm1246->regmap))=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, =
PTR_ERR(hm1246->regmap),=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to init CCI\n");=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->xclk =3D devm_clk_get(dev, NULL);=0A=
> >=0A=
> > Use devm_v4l2_sensor_clk_get.=0A=
> =0A=
> Oh. I wasn't aware that these patches had already been finally accepted=
=0A=
> or merged.=0A=
> =0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(hm1246->xclk))=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, =
PTR_ERR(hm1246->xclk),=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get xclk\n");=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->xclk_freq =3D clk_get_rate(hm1246->xclk);=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (hm1246->xclk_freq < HM1246_XCLK_MIN ||=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->xclk_freq > HM1246_XCLK_MAX)=
=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, =
-EINVAL,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "xclk frequency out of range: %luHz\n"=
,=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->xclk_freq);=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_get_regulators(dev, hm1246);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, =
ret, "failed to get regulators\n");=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->reset_gpio =3D=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 devm_gpiod_get_optional(de=
v, "reset", GPIOD_OUT_HIGH);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(hm1246->reset_gpio))=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, =
PTR_ERR(hm1246->reset_gpio),=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get reset GPIO\n");=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 v4l2_i2c_subdev_init(&hm1246->sd, client, &hm1246_=
subdev_ops);=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->sd.internal_ops =3D &hm1246_internal_ops;=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->cur_mode =3D &hm1246_modes[0];=0A=
> >=0A=
> > I don't think we need cur_mode, so drop this.=0A=
> > Instead, use v4l2_find_nearest_size where appropriate.=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_init_controls(hm1246);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, =
ret, "failed to init controls\n");=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |=
=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 V4L2_SUBDEV_FL_HAS_EVENTS;=0A=
> >=0A=
> > see: https://lore.kernel.org/linux-media/20241029162106.3005800-1-tomm.=
merciai@gmail.com=0A=
> >=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->sd.dev =3D &client->dev;=0A=
> >=0A=
> > Unused, droup this line.=0A=
> =0A=
> Was used in hm1246_{g,s}_register but I could replace it there.=0A=
=0A=
Yes, please replace it with hm1246->dev.=0A=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->sd.entity.function =3D MEDIA_ENT_F_CAM_SEN=
SOR;=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D media_entity_pads_init(&hm1246->sd.entity,=
 1, &hm1246->pad);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(dev, ret, "f=
ailed to init media pads\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_v4l2_ctrl_handler=
_free;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 hm1246->sd.state_lock =3D hm1246->ctrls.lock;=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_subdev_init_finalize(&hm1246->sd);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(dev, ret, "f=
ailed to init v4l2 subdev\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_media_entity_clea=
nup;=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_async_register_subdev_sensor(&hm1246-=
>sd);=0A=
> >> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(dev, ret, "f=
ailed to register v4l2 subdev\n");=0A=
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_subdev_cleanup;=
=0A=
> >> +=A0=A0=A0=A0=A0=A0 }=0A=
> >> +=0A=
> >> +=A0=A0=A0=A0=A0=A0 pm_runtime_enable(hm1246->dev);=0A=
> >> +=A0=A0=A0=A0=A0=A0 pm_runtime_set_autosuspend_delay(hm1246->dev, 1000=
);=0A=
> >> +=A0=A0=A0=A0=A0=A0 pm_runtime_use_autosuspend(hm1246->dev);=0A=
> >=0A=
> > Runtime PM should be fully initialized before calling=0A=
> > v4l2_async_register_subdev_sensor(), so you need to move the lines abov=
e=0A=
> > the subdevice registration.=0A=
> >=0A=
> > Also, right now the device status is suspended,=0A=
> > so use pm_runtime_set_active().=0A=
> =0A=
> As mentioned above, the sensor should not be switched on during probe.=0A=
> But the sequence should still be changed, of course.=0A=
=0A=
One more curious question, I just noticed: You initialize autosuspend, so w=
hy isn=92t it =0A=
used during streaming on and off?=0A=
=0A=
Best Regards,=0A=
Tarang=0A=

