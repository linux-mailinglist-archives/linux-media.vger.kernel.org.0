Return-Path: <linux-media+bounces-66038-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HUKRDa5tQ2oZYQoAu9opvQ
	(envelope-from <linux-media+bounces-66038-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:18:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D5F6E10A3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:18:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=maKNuCHN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66038-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66038-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A9453013014
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 07:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C871739D6FA;
	Tue, 30 Jun 2026 07:18:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020137.outbound.protection.outlook.com [52.101.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D879B26B742;
	Tue, 30 Jun 2026 07:18:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803883; cv=fail; b=cjz7NJW7GsQBtiu6DsTNOXku3Xj5sAlYyaNdVliuJIjxYU9KGUMwJpKFiUeYVN4b+5PmveMInZLEgfivaxaEQ/oUq83TjQCDJyei2BZMxU1i/AgOtC0FA67anww8F9xs8HpUzgXb1Rq/SwDNRleaue2Ua8c5vTwzGiXm/DDrsLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803883; c=relaxed/simple;
	bh=wOmVjKjVZLmgZWde9tb8yFkKXi85XPLmA3J4fbBG5bg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b8Cj+RKZyV6OcHzYR6B0iXg91YvvaMF7GhfRrTlz0gRZOh/+VU6sXijUfPtdu5qYmU+oGEwfZRxIFqdN+D/8sw4PjVi63Wbaw6quvoD/fm8I6ERIS+WypYZdjaKmjsFqRoU3vHl/NJ8Utk39zrVyIWMWlj0JrrwgIc+U8r3oMsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=maKNuCHN reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.137
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeJq+sic01FHQn1w/KggnZEBXJ6bQ0IIJN50Tus+jHtm7CinXtpYfNNa1GAU7GVx3JnQwZGMQDblFS+NNdk4u0vMwnsvSK4NZHydRaVeR9GiUIf081UX16J+fFmVyJF3O+Uw66pYyy/daAYlpJaVNDem5u9pPm8NmXx6LorlMbjREebQGDPhqMDyYqSouJjODiXEkD8x6+fRzZyNMfWi7wD0Pwov1QWSk4vGe/MGgCI0KCDh1FMpdIPsqJUfa2QRBNvNbphB+Gqy4oifSuKa1CWDWGvoOeNqKI4WWUn8Byn35LpQBpHdUosq5YhKOsqAsRqwG6gonS1t7IQ4WmujCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0CngVb/KpSE7q+fzqxrfA8IrurwHYZjAzLBKXxitTA=;
 b=bmJ0+Sa7+9Eliyhs4nYzL1YWtCGr1NHQZmoKwnh7wtkuVvs+iU4z09SZqbrhgidt8EIq8jz2pps0leeBjIhu+G8vkX1ne8+BOVvLIbmHzpI7WGKyfJSEzUDcvEW6INQflgMI3RKaR0tOKWok7+M/7alkiB/1I+GO8veVl9fTzIk/HNtMoCoG2yd9gyq1DzVts7J+XciGyw4W/ujr7UUke1xcy/4gMkWvuTWHpr+lReHbRwMIe5wEO40awlIxdXs+K1S5yjlqfjbM+Q1riAA+yE4sxM512vbUs2bJgBIV7TEY/Yv/tFVpL1t/iQNZYh+gKmTnbPxxEGZ3444FrPzzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0CngVb/KpSE7q+fzqxrfA8IrurwHYZjAzLBKXxitTA=;
 b=maKNuCHN7skUXCmLwXD+mfAD1Aj+DIgWeWVRNkoJKgFEqYlLop3vpAFpPy5yKMloyZXi3w2ta+iOX43lu1Y5M6eZjzrfOW/h1NCKBILpB1YXz2P2Ye263Y/VQJMViws+9CX8T4vhL5uzOuJTWtwNQeheLxr7eJ1rQHKoLlGX18W8+dYLwXDnYoSj9xNoRPKstsEaew2eemZRPQBO0yC+QiGonQ5NhpRQGwQfTbcp95wU+nJ6sp63ITeYTKK+mSLIoyFXcJZjZIgFnfzImBF+eK3W80YDaoX3niD9TsI/xSLpJR3+4JFQkQiQjr8qd0sA2tkiqdnK0avN74/vkR0UpA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0555.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 07:17:56 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 07:17:55 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Vladimir
 Zapolskiy <vladimir.zapolskiy@linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 01/15] media: i2c: os05b10: Use
 pm_runtime_get_if_active() when applying controls
Thread-Topic: [PATCH v2 01/15] media: i2c: os05b10: Use
 pm_runtime_get_if_active() when applying controls
Thread-Index: AQHcvE0VYEyGpKrPCUqCSgEd3XhlMbZWPXoAgAEDjnI=
Date: Tue, 30 Jun 2026 07:17:55 +0000
Message-ID:
 <PN3P287MB18296B5F265EB5961F25FF758BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-2-tarang.raval@siliconsignals.io>
 <akKM6VhoLNep5UZB@mdjait-mobl>
In-Reply-To: <akKM6VhoLNep5UZB@mdjait-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0555:EE_
x-ms-office365-filtering-correlation-id: b190bed8-ebc4-4eec-5c11-08ded677b4cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|38070700021|4143699003|56012099006;
x-microsoft-antispam-message-info:
 fE5DRcVC7VZ4YHV35IeXEpJhIGHBM69jvB0FL+iNz3B2Nmt9FxFoHonP+PsVtvEwdAL0Hk5EhSqU6ecoPSWrmmEawGh1S9OnKad5kbtqflEdAul32kbbcmo5xUO+h4T6rL/wxhTGC8DhI7oc68MRmtLl5wTMiGsYnxWUbSjdClTNb/y2XWo6Lj2rZ3H9z8q9AIK8CZG0rST1AuO9reM4sWhh67Bq6cGco/ywFLpSOEwCVZBL0WwOe8Ok2PuxCvM7FI0ImtmMo3FKJcT3qcuFSYzie8t45iwGYXlauuDktLGm4MMUK67174KGM90il61JR2i5UVGuqcPPI1CUJDMXfBtoR7UfbpIrM7sEYKhPZ0wzAoR7Y71neZHvpnjxCL8gD8JaHDbm9IF4mY+IwshD/FUWIGgnx17Uf9F1pkBDL0JIp6wRmGChijg+rmP+bM92J2G2HGTrBjiNc3XME8FvK/LciKdQXWB4wt8tk5EopgwE7JWOjVYF4CjqO4JY1/32zJQ7xYGkQOGguB4B5t0ha2aOsR8QTWEXJnV5BsGNQNmMCxwdkmMc2ENk2F7rOhDbAWyqYtbErt+qHxzzLaiQeWbZ9wa6CKN6VG5vWJMvvf4QQo130hhqZcmAenCYdKRuZa/qfrNC3uFuQ0CuShsMO/p3ChYHnhawAtLA5jsvA0uNJ3z7iNfWdrwAa+gARDiaDcHxdyEjE/GWEe6Ct2bxJ4X1Af5qS8G1AHs2w8/BsBE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(38070700021)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SaTKw1IpDwxZ1SrB/5YaF9apUYkEiuINQJalw3L9naoOtQ7UDM/xV+HI3r?=
 =?iso-8859-1?Q?ejplNDHPNazByHCDov1YNFiv+ug3lxYn+Vf/8zy5HnUPbGnpIh3UPkrkb+?=
 =?iso-8859-1?Q?bpOlGpAbG9sZ7WbrqMWjq9pwDlNjFYhFdkfqQB+r64xlLVM3Dz88VZ9J0y?=
 =?iso-8859-1?Q?9ywgEMv7LszsdXGuNyysjk7Ho/xqWmj3IRapEcwHES7cqXiHBATUcfcYJ+?=
 =?iso-8859-1?Q?chwgvx+wQFSfFhSmFbUe1IOa5HckbA9W5Kj+MrGzIDe6fYnHyC8Fx6lAZD?=
 =?iso-8859-1?Q?v46ojZIyuTaOMRt2XXRNXVs2KeGZ9M2PLrO6MNtNSDZzZ6ql664OfGp55B?=
 =?iso-8859-1?Q?pOFFQ+MG32NJXQDNh01D7+Wj15ATcO7k4r5+Xn+AWgyOU8K01F1to7SOy8?=
 =?iso-8859-1?Q?zXVs2VEDO/zy/MnD0X3+uV6IqLZq2SQyfqBJtQClzV9na1y+wVo5pbObHT?=
 =?iso-8859-1?Q?1rx+obOTllGaBMvgohClwNOAT5NR9VxzylVG8iadEJJw+XafjBZe+lzlmZ?=
 =?iso-8859-1?Q?LPiHo6TMWtwK1NWGtSKnYWsWRyL0csP18mUm8h8pSsimo43P7VrJ5WS3BQ?=
 =?iso-8859-1?Q?8DALTJDbU1JbPyr8gt/OHoJY9LWJTC9vyhQkG/E27Th6WME5MOZchrNmGo?=
 =?iso-8859-1?Q?h/Uq/2HoWhtNQYiDNhDLEbXBstH44DMv0rSXdIu0+hJIM7nLbJsjCyXstl?=
 =?iso-8859-1?Q?u9T3E8960Uvj5CKhrxpE2xMCaQkNlqflgosLgOO9SY4eJRt0vmx6yq/Dr0?=
 =?iso-8859-1?Q?frFLZP2Y+Pigouc5jIU//Gs+CaYB6OXXZHMO3EalZ14nQIK/BxGdY89/+O?=
 =?iso-8859-1?Q?skKwlyWzlKYrSgBlBe/fcz+O2lJsY5eDDgRkiE1s33aXpRG1gyKxyS1GzC?=
 =?iso-8859-1?Q?4k9B7aMsdJXF11hjHuX54RCIoe0kantLG+o4bRmV4X0hVOFTfzyNgJLdRC?=
 =?iso-8859-1?Q?SFJtjDzjqX4Rhhs94SbZdGJABzg/fZlK0QFgi6MB9Hc1v23rZCunjvfxLp?=
 =?iso-8859-1?Q?/4E5Lwu/3FQiYr+K8FE4l3QD5ghOsYX9QZBvBIGdxHdzHRL7K/gpEl7iJH?=
 =?iso-8859-1?Q?rwCHU6D40W+hLn9Zvz4RTyWobYshs1vfzspWtA4I4Lj/27oMcgzqRtPbKq?=
 =?iso-8859-1?Q?wtDfs9+3t+pRBRj5NvdZlJqIQCgrbh1uyvzTsV2fI3zZeev1Gt3ElCYx6+?=
 =?iso-8859-1?Q?klQNXzx762+zTaSZNldW35Dg23YSdcEk0utv8Y7DHzM8M019ois5/XoR8D?=
 =?iso-8859-1?Q?+KJq8wjh++FU0ESWD3D+NiUZPcGzCJBlhmZBdp7eLIgg4WSZ2XdD3JI2dn?=
 =?iso-8859-1?Q?jzaWLHLSq7j9yCqAklWckMLi+lfrMkf8Evfm5odfEIL4mQD7E8rGtnT2Cz?=
 =?iso-8859-1?Q?Bli9R8t+PGsxI1kbn82fmRZVcgth86BTRaK/Ix9Pp/rjW5qdi8zKCjsSwe?=
 =?iso-8859-1?Q?NLXcBClorQ+4lHhmicrciFcrfT1vbHb/bHeZp3IUaz2UJmwmEFlVZlNMIK?=
 =?iso-8859-1?Q?EqnZgLNpFA+jLdKKV1JYnLqofmWFUQDQ+PlTS2JUY/VlEkf7VxperQMHuV?=
 =?iso-8859-1?Q?mkpM3ok2e79ZEcsKylla+an7NRiZI47FnaaNu7z7zLU1AqPZ5/UKJC3m0r?=
 =?iso-8859-1?Q?BSqvZHEa6cA7sJi/WHT3vippGNktJ6QTMsCi+QsTQB7KhKFZahz0GskflJ?=
 =?iso-8859-1?Q?jDs1b09aAbw1XxHiN/sXIrmmyrm1+SR+RVH0k8g/wOsZzGyDt8QVp23Smy?=
 =?iso-8859-1?Q?EduxRu86zOImnNjbVhH8o9gA7ZV4hIAWxOHcaaEZFzcKDt89HxBzWlpWW8?=
 =?iso-8859-1?Q?z520Ui2M+w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b190bed8-ebc4-4eec-5c11-08ded677b4cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 07:17:55.5650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xXY7IFejndbXRV6UEvB7m0shYgCOSfu3Qf5CZiiZYRoCoEXceTrSFsQa7JOmAbZpwIv0i5pPTl6Q8HrjtCQgWURdI8hzV2MiR1uZ5MVveQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0555
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66038-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mehdi.djait@linux.intel.com,m:sakari.ailus@linux.intel.com,m:stable@vger.kernel.org,m:himanshu.bhavani@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3D5F6E10A3

Hi, Mehdi.=0A=
=0A=
> On Wed, Mar 25, 2026 at 05:13:47PM +0530, Tarang Raval wrote:=0A=
> > os05b10_set_ctrl() currently uses pm_runtime_get_if_in_use() to decide=
=0A=
> > whether controls should be applied to hardware.=0A=
> >=0A=
> > This is not correct for the intended behavior. If the runtime PM usage=
=0A=
> > count is 0 while the device is still active, pm_runtime_get_if_in_use()=
=0A=
> > returns 0 and the control update is skipped, leaving the software state=
=0A=
> > updated but not the hardware state.=0A=
> >=0A=
> > Use pm_runtime_get_if_active() instead so controls are applied whenever=
=0A=
> > the device is runtime-active, regardless of the current usage count.=0A=
> >=0A=
> > Cc: stable@vger.kernel.org=0A=
> > Fixes: 3aa9296a23ec4("media: i2c: add os05b10 image sensor driver")=0A=
>=0A=
> A space is missing here after the commit hash.=0A=
> See https://docs.kernel.org/process/submitting-patches.html=0A=
>=0A=
> checkpatch will warn you about it.=0A=
=0A=
Recently, I found that this is not actually a bug. Using=0A=
pm_runtime_get_if_active() would simply allow more control updates to be=0A=
written over I=B2C while the device is runtime-active, even when the PM=0A=
usage count is zero. Since this is not a bug fix, I'll remove the Fixes=0A=
tag.=0A=
=0A=
> with that:=0A=
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>=0A=
>=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> >  drivers/media/i2c/os05b10.c | 2 +-=0A=
> >  1 file changed, 1 insertion(+), 1 deletion(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
> > index e0453c988e4a..5da5b7d21f31 100644=0A=
> > --- a/drivers/media/i2c/os05b10.c=0A=
> > +++ b/drivers/media/i2c/os05b10.c=0A=
> > @@ -531,7 +531,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)=
=0A=
> >                       return ret;=0A=
> >       }=0A=
> >=0A=
> > -     if (pm_runtime_get_if_in_use(os05b10->dev) =3D=3D 0)=0A=
> > +     if (pm_runtime_get_if_active(os05b10->dev) =3D=3D 0)=0A=
>=0A=
> small nit: how about=0A=
>         if (!pm_runtime_get_if_active(os05b10->dev))=0A=
>=0A=
> consistent with other drivers using this call but really not important,=
=0A=
> up to you if you want to change it.=0A=
=0A=
Sure, I will update.=0A=
=0A=
Best Regards,=0A=
Tarang=

