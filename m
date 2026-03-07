Return-Path: <linux-media+bounces-54844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPy6FpK3q2n7fwEAu9opvQ
	(envelope-from <linux-media+bounces-54844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 06:28:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B84FF22A3D6
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 06:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB89D305DD56
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 05:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC3A364922;
	Sat,  7 Mar 2026 05:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="ggWkjS07"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021140.outbound.protection.outlook.com [40.107.57.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586223EA85;
	Sat,  7 Mar 2026 05:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772861300; cv=fail; b=cGKO0ZtAHGNSToPXBpl9fxKLKe7cjMOCKUfh6W84oh5qFM+ZTNv7+/MK711/4putfX5IoKEBd/qDJeNDnGP9i3DtUEjxChFjMIidZQaF6XtAU3dvBBKFbr5pHvMXoi+blKgUiQBkKdcg+gcqYzdR43QgKDntaF7OdYuHCXWU+50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772861300; c=relaxed/simple;
	bh=xfUky/WrLBvl8VoFb+4cp+C2P8sanZjCa+oL1YxmocM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uQROHANkpqRqPtr0NqH9FAwk9zct+kjRdXQRfAY15hyjOF8eT5mKZbJHulK02hD6Ig0zcHJ9J6zBvX9jCnX1jyOAWEQfO5RoVxyokkUl9ks6soTJ9UxwAqi0sHcuNiD+UZL6nxVGL9JB6y68SGvt/3QfGyWVfLrNLr/gfsz01U4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=ggWkjS07; arc=fail smtp.client-ip=40.107.57.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNBiRB0wzJyAl+wCwB8Q93S/CtrRxjAqATuwayIccYB71q/cUiyP6zWBbUtY+Cu1evyX14E8In7aG53UWZtB3Hl6M3VqVmYv2waqeS/kpu4MeK9/roxxDqXeck0hAUxQ+OvGqoG7jQYv2wP4SjBLkCzAUcfUMn260gX6ijvbTgeNZfDQsVeIovWpZjjpj6DwX+xJF7eyf5r2p6OTkzEawUzJX46jBFIWNzfsXFvlZvooX+AKBf3rWt+i4sGttXgWUr7KI13+4K0snXowRmPYSZji376VIKFu4siVCSj45mDjKs/we1zo0B/OJFqmV9x6CdBbBa5HPNEEpMRKcfCqeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfUky/WrLBvl8VoFb+4cp+C2P8sanZjCa+oL1YxmocM=;
 b=FHozGkvnz7jXg47QvSzpx5aLTSI/xNp85NPdNyNlXlH/hzzfRJNnZK1hTnlu/JiiM68ouMW0E14Al73j0yzEvy5NI9j5co8FTbfQk7aKlpW0eJy1qNUbDZdixIrkNWtOUB+axeKARosocD2ErCm/wK7eohVxSaSiO+qcbnkkVSGMKnaKManjoG3MmewJYbCGZQymOR72fInwa/pvDGYh8wrWdSrNa7A0g07XSaynjHg1uL2XBlBhF6LOOxf6Ch21ZoILzMmy/ks9NGXSZFIbUldTHL9GBf1AMpaj8mfkwJuC6SLQ7pOkt7P0JYOrZfMUY7NfUBNdCxVuH4Q/6bIuQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfUky/WrLBvl8VoFb+4cp+C2P8sanZjCa+oL1YxmocM=;
 b=ggWkjS077L441aR0jI0TCBMQ6m2m7ITvTOm1RNc0zuwDavm04Sca0w6wBa9oxgYWpGLZxaJzg3ngQQT8XLZ7r7ETS78bBOxx7RasvmV07/phRzyMVjEx+7WG0Wl7XcbBM0yHLAG9KvqkZLeu3xRoVJHeptMuBv8j3ARn4BcK1N7gieoPS+cUeuJpk1lTUvgeq6a7JJzOaah/1Z5Xbr1vTkujOOlZemxeMG9rcD3EUHBDZkbVuzQyQKDRoRk0bq379KrWZ8YZbkBk5x2ue/qh9gAd1PMn1u4CnE2iKYH30QLouITszoBCzeL/P5tfpHqN6Z1Xbvo71U8eKWdPNjJ8Jg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN6P287MB5341.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Sat, 7 Mar
 2026 05:28:15 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.020; Sat, 7 Mar 2026
 05:28:15 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/13] media: i2c: os05b10: keep vblank/exposure in sync
 on mode switch
Thread-Topic: [PATCH 10/13] media: i2c: os05b10: keep vblank/exposure in sync
 on mode switch
Thread-Index: AQHcrWWZ+BR0uYsBTUu394EBWONp+rWhgU6AgAEIvRI=
Date: Sat, 7 Mar 2026 05:28:15 +0000
Message-ID:
 <PN3P287MB1829E6396778D6CAEB7F54458B7BA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
 <20260306123304.76722-11-tarang.raval@siliconsignals.io>
 <aarYDXtXzkMTWoES@kekkonen.localdomain>
In-Reply-To: <aarYDXtXzkMTWoES@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN6P287MB5341:EE_
x-ms-office365-filtering-correlation-id: 3a16b6ba-4a82-44fa-da4f-08de7c0a5523
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700021;
x-microsoft-antispam-message-info:
 RaWxTYl0gqApCAJUE84yTyedOQmAvlx3JKaNq3dn308TE9PaIFyGA3Z9M8LK6D0Sne51EOlP2bJqJERnsehlxvtZcDUh9P9A+dVrXDBzB3AHObGevG54vqTimrueR7RUR+QfVnq2qmwLa2o3oYFudQ6OW6JlPgJiSssKAaQK7ap9RP88yN6CSgH2hA0TqSwzmvJPmMRB2PHOnIq1BRXKMmaO9E6IDa5U8BH3gwpGJ/6Z6lRDBRWngZjlT/glLyARyvn6/3m8JY1ttVpJQQs0d0p9E4XixljkT+93T3VKItW4Vclas/e4oXV3ROlRSJJSckcjwidqOq05hlkSbCRE8+TULFYW6PWRHnTUnFmKLIS+q9SEmhggswnjn5/0bcdp8yTv8zeDirrzVHmS06HegcTm7/di4JH8LOXrwbB5Lzr0W4ykPQ2mtMrk/vXAkAYtSDW3T7U9Ooz2JhjZVAFHN1c9ZgetLvjO+msCQiCBgMONZbtYaJc6AZmtskqyuP0KBDWp0OKLTR2bIwEcKUsVl4FvVM/zLSOP4rRWr5rGyMWbmQcU2O/CS9EsEA51vHcO+W+pzBvvxU187mrS2hyQzXeLSwnOFQiieJl5XsNwyPOuO2lfSslPNWs/ll3JAs2GDYYG2G+BbUwIXVuQ/Fmt9mLshg3EWmczOW/+ObukJ4bC/SpWYl/kydrrcLOdX9gJJBzZRbtfeSP7BGGO/D0mwYZK+n050CWamMbZQJyKDxa1/8qMlzCQ5xXDbIwHEgNBeTpaoifRbf1poFpIdgQiHamNA7b+dQ+fABsef9uA40Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/henEuUgFf40Ejyae0YY6gLKztj8yVbRHCpuiNRciPBtLRI52YZRv8rude?=
 =?iso-8859-1?Q?xlaZ3Q4FtbRk6brEE7jDwAq+/6thklEE6Rm59EE2yNSNPGbcddPjAnglnE?=
 =?iso-8859-1?Q?FxMV364MsIHuellSarJbB0Cdamgag3IShUOJsGVzD0c8KdoGACEaVmEf/h?=
 =?iso-8859-1?Q?41CnmkX91wPWt+Bkr/Xx1mI1yzkcORDWcCZa00gt/1m3S8bdFg8UO56O5x?=
 =?iso-8859-1?Q?mxvBvhQ0n6SjYl9iyDNe7aAPgHXcWaBHmxyqPhz7ckQ8x94BciEB3pVyDA?=
 =?iso-8859-1?Q?JKaZGmGvKV4SioXV6Qi0WenhroYAqmSAjpaCOLDeI7VXBWq7Ms9YmDk1rD?=
 =?iso-8859-1?Q?BH4k5ZtuVii7kpiSVu45lPJ6vatzrwWrXESa5jtefrz0cXXPT9Ux+cSNMX?=
 =?iso-8859-1?Q?zmcxACdvUtkRy1zIfUwWfhfrB1q0Z0Sq6SL9EKAvFHjjdIb6n3/p5EZbYc?=
 =?iso-8859-1?Q?6PzeqzFu2dF8jRIQOZaXMndEOw+O0phOKkM7zGl6xVTzZ07qAUP1ErSVBK?=
 =?iso-8859-1?Q?kIz6SBPDlyXSH/n3glLsmc7sS4+dU44SPjzZFqx6ICxuBfZ7lv2gzAoDkp?=
 =?iso-8859-1?Q?tYjFq+9bISyDxSw/B9wgbgal6HaGBvMGxh70gO3O04779FdVjxVuP6sQAu?=
 =?iso-8859-1?Q?1AroT2MMrv5J0TzRn/7JgCgNyIR5eFCG039wQcbyfiii8PQggLlU4D6i9s?=
 =?iso-8859-1?Q?spZqALSHPez9PVLM9KdzAH8hT3Yo5yun3Q8M7oGVM00pUgCPyEXSQDP4F7?=
 =?iso-8859-1?Q?WEcrUeaxEu4kSoCq/kzBbtiYcZOhyqP/ugyKeW9katpD/mkUxTw3prpHXk?=
 =?iso-8859-1?Q?baCtsfbKxLYd7cY7LnmhViSQuxQSY3fb9G7FwA+5NtAz/qgrpiRq4k3Hye?=
 =?iso-8859-1?Q?GVmrT8u03VA/6f9z8evBbRl27Gm2c+HYCC0IDbpDTib5lUQe92V6gsSnYr?=
 =?iso-8859-1?Q?yMhMRekTED5X2CEaJ8NCNsD9AWPVRUmWQH2XEj9avixW641pINlk5vufV0?=
 =?iso-8859-1?Q?gdsPKwUHwh0oq2oV12JJIl/kpKjhXIsZS1ravtvfqO4vRVwZfjgtByiZNS?=
 =?iso-8859-1?Q?pF4EfQ98cJ92zdKP4p71HRSrdkCuFEuHS8cbd81vy25QmQV9sQwnstiIM9?=
 =?iso-8859-1?Q?kfttgP52lPox6Lz75dJpVWVl69VM7KS8ZklXDVbYS2TP3/dZaVBcOJXVz0?=
 =?iso-8859-1?Q?fwdJkTTFwg8heMfJr2qzA+MrW3ho1S7ql+S/FS0C/0hDM2PPVaQ2/eOS2s?=
 =?iso-8859-1?Q?shjxgKBAx9HEIlS+s8LzYh4kG2Lpe5vXpdoQuBogyTOSnW7S3QF/80k1f/?=
 =?iso-8859-1?Q?X6et9UAV165nFUd7YUH3nAJ9q3Fr1T70KrxVOFSRs14JTcYwLnhk6yFzHT?=
 =?iso-8859-1?Q?nj1sI1Gt0ujO+PKU8FTudrV34wuQdcx9CJ6j9YgK587NPKeTUrVfTIyP2Q?=
 =?iso-8859-1?Q?psKMeaKP2+232p8JomkvB8LEYt6MGsGPLyYv/bmPhQno1nC3Gz++7Hfn4Q?=
 =?iso-8859-1?Q?hSC+7SOpLjjQwpGSQ1IDS3w5hAKXy+74svF0zfVXkn2hoeMUf2wscbWvqe?=
 =?iso-8859-1?Q?/YGSF7CPjhgtr/H1kfFvOeoc5YYJRQA6yyfPljd3BFEob5uHr3/jpwL0TS?=
 =?iso-8859-1?Q?wWSM5D4k4XfWe5Hf4BqBTyrlU5WD7XsPym2jXiMBiwGyMw8JRF6b2Fgubt?=
 =?iso-8859-1?Q?HPg93OoTmLGRj7g/ISTk9Rv0l7pxE5S8OrhpygNSquFo9H35jZu21lJF8E?=
 =?iso-8859-1?Q?rBc1T/D+55ggdaadQUkGCaB0TBhe6CzU5WbzQ8dEbloiu+687doEWPLEyy?=
 =?iso-8859-1?Q?PAKVulrZ413OiKngZ7sOa+LVpFkHRN2nk8pLRLUNgeQWAEIYlFkNY3cy7H?=
 =?iso-8859-1?Q?Oh?=
x-ms-exchange-antispam-messagedata-1: 7bn4YhF4gq/cTCl8izrBQjfoTB2nDT8xvP4=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a16b6ba-4a82-44fa-da4f-08de7c0a5523
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2026 05:28:15.2273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6R+9KxH9vnPcvfV+SY2kscy40tbngpc4Uv/TeQ+GZPJNoz2GL1ivwp/fmpHDqORk6YLxTUjUa05k8abD1ixUw4IBYK2rFI1nWpUU2jHvsYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5341
X-Rspamd-Queue-Id: B84FF22A3D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54844-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.959];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,siliconsignals.io:dkim,siliconsignals.io:email]
X-Rspamd-Action: no action

Hi Sakari,=0A=
=0A=
> On Fri, Mar 06, 2026 at 06:03:00PM +0530, Tarang Raval wrote:=0A=
> > When switching sensor modes, V4L2 updates the vblank range/default but=
=0A=
> > keeps the previous current value, leaving vertical blanking unchanged.=
=0A=
> > Update the vblank and exposure control values to the new mode defaults=
=0A=
> > after adjusting the ranges.=0A=
> >=0A=
> > Clamp the exposure default value to the new maximum to prevent -ERANGE=
=0A=
> > during format changes.=0A=
> >=0A=
> > Also use pm_runtime_get_if_active() in set_ctrl() to avoid touching the=
=0A=
> > sensor when runtime suspended.=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> >=A0 drivers/media/i2c/os05b10.c | 21 ++++++++++++++-------=0A=
> >=A0 1 file changed, 14 insertions(+), 7 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
> > index d8d776de5f35..4601e33b7e8f 100644=0A=
> > --- a/drivers/media/i2c/os05b10.c=0A=
> > +++ b/drivers/media/i2c/os05b10.c=0A=
> > @@ -732,16 +732,15 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctr=
l)=0A=
> >=A0=A0=A0=A0=A0=A0 if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Honour the VBLANK limits w=
hen setting exposure. */=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s64 max =3D fmt->height + ctr=
l->val - OS05B10_EXPOSURE_MARGIN;=0A=
> > -=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s64 def =3D min_t (s64, max, os05=
b10->exposure->default_value);=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_ra=
nge(os05b10->exposure,=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->ex=
posure->minimum, max,=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->expos=
ure->step,=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->expos=
ure->default_value);=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->expos=
ure->step, def);=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n ret;=0A=
> >=A0=A0=A0=A0=A0=A0 }=0A=
> >=0A=
> > -=A0=A0=A0=A0 if (pm_runtime_get_if_in_use(os05b10->dev) =3D=3D 0)=0A=
> > +=A0=A0=A0=A0 if (pm_runtime_get_if_active(os05b10->dev) =3D=3D 0)=0A=
>=0A=
> This actually appears to be a bugfix: it was possible to set controls=0A=
> without them being applied on hardware if the use count was 0 but the=0A=
> device was still active. I'd consider doing the bugfix separately before=
=0A=
> the rest of the patches.=0A=
=0A=
Sure, I will send this as a separate bugfix patch. I will also add a Fixes =
tag =0A=
and CC the stable kernel list.=0A=
=0A=
Best Regards,=0A=
Tarang=

