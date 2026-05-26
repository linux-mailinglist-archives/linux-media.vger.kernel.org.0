Return-Path: <linux-media+bounces-62770-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN2JEthnFWqtUwcAu9opvQ
	(envelope-from <linux-media+bounces-62770-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:28:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D28785D3539
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B85E303B4E9
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 09:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3663D6CBB;
	Tue, 26 May 2026 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="aV0NT6aN"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021129.outbound.protection.outlook.com [40.107.57.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FC53C585B;
	Tue, 26 May 2026 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787340; cv=fail; b=VOw/8ER7Vi7T0siFmiqHbIfxhCcYF3RDCIQ9KyhNF2zoDpGq/DQNh71hatzptDeWmNLyUlKpYTotfZxU6tsDJN2nTgZfDXzRABjwMv6d2DRsj2RH0BJM8cG+Ry8w9MHbXh1HiIFr/MncD+6HRxew66Cn1nxpP/1RUkb9rpxKTGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787340; c=relaxed/simple;
	bh=XHWp/V+bNvUnE2CWo1V/rnxAY2p/lY5IG/MTdgP62BM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fszVw40mQ5nXlN/snIEY8P3xXRUo5IyuVepy1v4QQv9eBZr6Xly08CcFRdR8rRDmRHjbOl2Bi/xTP1vVpR+cJ8tnhqFQow8jFmeglVIhBoVsp3Wfa5izxfh1errlCbNyObD7S8Z4An/75pMGMnAAotw1ZE5paATdRbbBouCLvVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=aV0NT6aN; arc=fail smtp.client-ip=40.107.57.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flTvstIE2oKkWEqiuEZsEL7eQcUazYwq0IbooWwyUnY5TeCIGJ2zrl8Pz8Nsq7jpmYj/gRn81mlceK9niBaUiEms8uj3EE1oJ9ydDZjNpBNqZkWzyDUh2/wGqvfEC3otdfj+xP1F7nCT7HbBOkXoa4hRdrJl3B6c8FJUncAkToh7DFNd4EaxCpbNL/Bl427l1lrJtUcCEA38xomjQnJx7/nD+c8ox67sd09wFyK7pRl7xnaO0y9mQugupCEf7mS8yn/+DeksbhPxZ1LxMbIfyBQspyGuwQXOKcxfeCQf9A1ZRnBKIFGN7m0dfoRmBFxp7UGgZbdgb9KVxlS93onbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHWp/V+bNvUnE2CWo1V/rnxAY2p/lY5IG/MTdgP62BM=;
 b=ACCNUrMZxnXECgIn7XLkSGqXJ/O2Du7GIgCKBKcgiAB4nva198cb8LOftbrmTSlTQEh78gngliR8ebb69wjEz+zKocDvnLpS/XrKScKyNVnGp6nHvtXbql0A22bU2FpIegbH6/mMFME1SFOaAB0Q8gsB8ar1j2IwncAzw34OLgrooPzWo1PpG/OeaSs7EkkVHoYlBBmmSxhJdlU34moEIWR9hefCvMKoY+Ijd39+Nb1jCNi9woBD3w741HS+7uZD61aWIyt+9EjVQVZznzcw1bIENHrD3alSRZztr33EkNykBsG7JB6JjY7KISOY/R6RXgn1vH3sT8or1oXvyhJ5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHWp/V+bNvUnE2CWo1V/rnxAY2p/lY5IG/MTdgP62BM=;
 b=aV0NT6aNJTpTH0bSrGbqco4s2TEg9xLYXiyscwcyAzf2m7SxIBMK8QoxLuXzaY9vN7pK28hisxk9NfR5bqnlSFVmN7LsSUQoztoDvkoZh5DLpefrGOOpr+S7vqk0kKjGJyOoPvqa0CiDFlu4xqUb9farD1jSkyDUNoZIjrXt7HfnPqFxiSRUIdQ5IxIGnqIDJjWS01iUryjGv6VFsXuE10KLfuKPGfvX82i7lrjY3PmEsaJPfxKDnbN9770VXV8TUP1ITHtR8CN1sVqE+AbTkpxmBzS1Zvz/yMgW9rSatkpCo8dz3vebpIrjLLgYyeJXEzfFxYds/gGs3PCZyIRSvQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1284.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 09:22:14 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 09:22:14 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vladimir
 Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2 00/15] media: i2c: os05b10: Refactor driver and Add new
 features
Thread-Topic: [PATCH v2 00/15] media: i2c: os05b10: Refactor driver and Add
 new features
Thread-Index: AQHcvE0RwA1nT6Y23Eqs8Q7SF1wgrLXy1fCYgC1opnSAAB5jgIAACzEd
Date: Tue, 26 May 2026 09:22:14 +0000
Message-ID:
 <PN3P287MB182959B0C59BDF03F3C7C7938B0B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <PN3P287MB18293C332106D4A13EAC07668B362@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <PN3P287MB1829CAAB606558641ADEA34C8B0B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <ahVbLjqNqFnke8Pe@mdjait-mobl>
In-Reply-To: <ahVbLjqNqFnke8Pe@mdjait-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN0P287MB1284:EE_
x-ms-office365-filtering-correlation-id: 7a1653bf-b33d-4597-d929-08debb084647
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|38070700021|4143699003;
x-microsoft-antispam-message-info:
 oul+zF47C/Lf2xAYXvcwnd5LeCUUE0GufRnn87ficirmJpr2yAYuhKtB4HWEO6GuaXgSb7MKe9PwY7s2RMG0zcAzCAKMX08L/2apz6Brl4AEZWfenDcysCGDvn4F5YD1+kR5r27Rx0HE8SewFfU/zKvilb9YYtkldqSP4es0hUCYBMZEBIsWD/M4yf2OiXkcQku1LENRTpZe82i3Vx6W4akTQVEg/7lJL1s95hhKkOnRZdGoJqFs56h2k15/S4apxlVM2yBzxK/eZqo7hSic6iqQ9H1hCpyVX0d+vK9pdr98oRhbRqZ8WfjfzvFronW+mUOgUhGnrRvTmO/XgrBzwyTLKb/dCz7c3l7k17JEOcy9YgAO9bHTYBrYns1Lb6tf535XjZBF5/GhRYjnaanh1H7RFbE5w5x8fNZkaxPg06LxUmQAmSu2T5+6CZwnUo3nDGA0rTOWpuo/985rXxvxRqlgWX1gIRUMrdqCH+Op0K5kc8d6YRVFV73wx4B1rRXk0O+BD+M635EeRDuUP8wZC5Yx78XJ9JrXXjXa0rnqLGPwNR1fshhNfw9hI/DbYjsLllas4XQftsQ/vxcHzvFLQLgp9GDHGu8vWsvPuiKp5hVBiRv4WT+OHEUYvuMSa1yyKdZuGdkbQuymC9OupowfcM/33fGiQbEFtr5V+MgTaEvkz/sQ2XED/tSfcjJPmKx6SxPkGsF85uzN8VCxGUVrM1L1MN5z/103x5c3eoEJbtDvZCP+tWXJfBAGN8qLPMjF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(38070700021)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?I8orBbOtWHbyXnupn0ZHafSvLnvrVC8B6YbHwokIk0jraIdd+z8lZgdHgH?=
 =?iso-8859-1?Q?Yrhdf2gj7NqOFTTnP54UDZDrvS8Vome6ih1SVCi53rr7Sr9PyEpF0st4n2?=
 =?iso-8859-1?Q?eS7b8IMKF+dhUcQE9uzu4cgWb0HxEr0H9vgSQMPjCE4n+LHmuMUhjcFOPH?=
 =?iso-8859-1?Q?bVejJWeKbRCGleiVSgOXkNtk2vierSotuAvZQ4qU7zOtHIRoY0qtCRQiOn?=
 =?iso-8859-1?Q?CHO9xyRqbO/SkIbn7XuU4Ip96o4rtoz6606mX+AuRns7gSf1jWrTB/f2/B?=
 =?iso-8859-1?Q?3j+9LON0EZ4hdrwfcef1N3ip8ltwhK71kub9XJTdrYLt0G0DYimMKrvXZT?=
 =?iso-8859-1?Q?kay5deCH1KoFSjiDwAqT4ptnjP+s2W9no1xvub2YO/xh6eTs9TTzzkHkoQ?=
 =?iso-8859-1?Q?WOA32FYCvci2Xj3DR8rSxD+5ODyrr4j2HtYo3VCwVE44i7L489WjQkfYjl?=
 =?iso-8859-1?Q?y2RZR+n85g49Un6F4iv9XpdGWQUaybqwddVTjwqM2JdV+ZFSF7N12S9Qep?=
 =?iso-8859-1?Q?4gzqCzpT0oTpPKMqssYreTz5uwiuyOU8eoN9Qevll9EsWgS4ofgd+8lARu?=
 =?iso-8859-1?Q?fnhPQVmr6Bi5xpK/XjHeeLrYLfLqvI7ISze64T+ldFFdEXrzo7TNxwLQMz?=
 =?iso-8859-1?Q?hZ1EciNWJPQXBN4dOyTUKoxdRmzflIPP73PKhtO3SUrCKqrX4Y9u0Gv5+k?=
 =?iso-8859-1?Q?oiB1biv/mma9BS3uE0QPBnZpUqXg5BywaKSjD2huNcHQ7BanVYohncf6Mx?=
 =?iso-8859-1?Q?rDvWJC+wzazCzN5utrRqp6xH2rKYMLig8w1E4lzMvvZcbzJFg4oFstDYl3?=
 =?iso-8859-1?Q?RmbV5Z4hUvl4idg90eg76Gz7oim4y60JKX32mW/H+mjI6pSzwGHXSalCyt?=
 =?iso-8859-1?Q?T6VSi3pKrW7ck+VE0apUCE5TESJTNvfn/TsrF9XtxE4d8Hk1BXin+ZQidj?=
 =?iso-8859-1?Q?t6nyfxza8fzBKzsaAWWSN7n1nUQWCKoUrIoDekcvdnDhm0Luj98Ow8W8Nm?=
 =?iso-8859-1?Q?sS/r3COK0/ZTUEiw+nOzBHYzJx+UNbDkHAGOSEhpIML43fcr6MN0eZoFKm?=
 =?iso-8859-1?Q?kU31VbtNGB+N/R0XH3zvPvZ6QHTUBNfMYOjiaqy7+sEtZpqcG/kCBAV5am?=
 =?iso-8859-1?Q?l7qqx/uStMvuGynSm7XU6i2MmJPi8mRlBUf32rvdTr9+cyEhuxmdYdyrrm?=
 =?iso-8859-1?Q?lwGWYdWn+hOkiRI/SuAdQoTdDQrdz+e5wrefse4Bv391JAQ7+qBlvTB9Ka?=
 =?iso-8859-1?Q?gXUenKTY3NZF/T+pZtNNehgSafegbhdUbw4mvXCcJbQQmWJ4GgR/bXS4vl?=
 =?iso-8859-1?Q?eGedH5X+4xIlEojT78R//qxkmfGdDyTy8716n9ZDEEBznCGxbVkIpZzbXw?=
 =?iso-8859-1?Q?Pi+FfqpEu6F8DUTRBT6HVDYSO0jEbxfKUdDYEd6YxtPHxlczCa9wYwU1KI?=
 =?iso-8859-1?Q?K+JmJBfBJodJJYS4e1222ad4Nv6XnoFPhl2JkVbyVjZBKWjzKVtWVE1YFc?=
 =?iso-8859-1?Q?hj9CWQS/qUUGWEbEUwl+kll9N9dZkdLVtYW0MduqM5cquz3cPiGm8y37gk?=
 =?iso-8859-1?Q?xuBWgIeahsU+/14JHu9PD+JNCn//MBbKbJhVyoTc2JiMe9RhZ/OoePp+vE?=
 =?iso-8859-1?Q?1cLu4ZNCVCpA6k2sCP0+KHCahzgv3t8TlLrVNRV/OkkINTKFZwPM48dHSz?=
 =?iso-8859-1?Q?NniP9wd3yw6k/M2IEZZPW7u3maSUBpaVeMMpjvB/esRtta+xEvg/ab2Sj3?=
 =?iso-8859-1?Q?XFl6/BzCTSG1HEzSckJ7bIYS8nkA5snbkl3BY4Iz6nTT3W1yyIfEsqWJNr?=
 =?iso-8859-1?Q?6Hsg4YV/2Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1653bf-b33d-4597-d929-08debb084647
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 09:22:14.5991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DK93f+LoW05zaM4sOYKu+e9Yyoiq+CGbxnE2CCYErLE8qjhOKL4zxR+ff7Y3j1D0Fr366bf/+F56fptQETtCwCDO4nVLibIcU/QZYhb+s0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1284
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62770-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,siliconsignals.io:dkim]
X-Rspamd-Queue-Id: D28785D3539
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> On Tue, May 26, 2026 at 07:09:55AM +0000, Tarang Raval wrote:=0A=
> > Hi Mehdi,=0A=
> >=0A=
> > Could you please review this series when you have a chance and=0A=
> > help Sakari with it?=0A=
>=0A=
> Yes, I will take a look at this series. This week I am busy with=0A=
> Embedded recipes and the media summit. I will probably have time next=0A=
> week.=0A=
=0A=
Thanks, Mehdi, for considering it. =0A=
=0A=
Will look forward to your review.=0A=
=0A=
Best Regards,=0A=
Tarang=

