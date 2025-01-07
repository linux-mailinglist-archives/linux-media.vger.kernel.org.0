Return-Path: <linux-media+bounces-24311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 260BBA03495
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 02:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94ED23A4B7C
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 01:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2444D8A3;
	Tue,  7 Jan 2025 01:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="e8CSMUsu"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020101.outbound.protection.outlook.com [52.101.156.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB8C2594B2;
	Tue,  7 Jan 2025 01:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736213961; cv=fail; b=Hg+cSdvRovZls84dmzKwP1iuM7mWM2K05yhTNDp+CqlINW4PoZ+mulLC53nnTialhPW9Tr1/mzu3JU0L4hGllQqdvs9CvEg1JjbEYbuBNDqEHm6HtwKzNVfdXrSLhM+grpsMML19a9RVREdRKqIHULEzlhcbuWgyRC/glqRoVx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736213961; c=relaxed/simple;
	bh=y4ocAOtod3gKurCDnrcXxqF0TL0jbJ60sdmXo9YwEb0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P7N9YhiAgxNHjIXqwhlll0weujRIMn5lNtRlRuv7+O9mXvsJgn5bgBz1mFt2EMgtgN2CuUAMqonNE70KSfEZ9R2OMmQbQoDiO0OTOTn744nD2KLSoYmA8wW0eehA0zzX4Yle6pil2rMyvznOGQiYMr5JvUSqdMP33C5j1XDVe3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=e8CSMUsu; arc=fail smtp.client-ip=52.101.156.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzYnY9KZ03z8CHHn87w8pYKrOEVe2BuelS+P0RjNrt3spBhrfVO5SC+yXzBNyOrizmIuFTczdj/QEaUUWdlS8WrCxzOwEIgBBFScpk6DmEvJsMdz3YxRtQoO89QYGnGjPcGnO1Inu/Oe3kGj/MsoN48jK9lhgZ5sxINRZgSJ6stghHVGJ9r2t4IwpJVk9hYTceesj0ZtFfg6HHS+plU9/f9gYoQoPTEVZ2FnE4yMpm8dEMTc+pIqRQCh6DlwV6NvTUfm4YEaU9LgzvoCFCniUuMPbrY39clBmrQGYDl+7OGZ4hQRptlePNJ1XVuCFdmCm7KIHOmREzZ1p44Qhwt9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCRfMhuW46poskh4qginV8L14j6YdUs4ItozLAFUt4A=;
 b=yqnR0i/ICOi3+spxlOtczaem/bWaU3zX98j1P1VvqCROC15kMOScQ0tJP4l5DkF+cozDLOiIq9syafSMjkxMWb076qgnnNJcIXcvmeP7brTiK/MhwDj5ljWeqSEHxzwXE5To5C2f/vv6mEKMs36RXfC8T7ZP4icGToZd6rDbY0ccpi3VZnDxnOffGa6H8nWtnjXEyskGBRUFEM7o1B/VUWGNFl/VeaVOjvLIXq/DpBndCigw5AWF9jEgpVUTQSUe50vHmz9I4CZLnAbQWzBMxyZIW7dHsbGUHEWinLekOfLxrIS9DKMqpvppQOap44IBa9Au8DBlSF8ML/xxuJxTmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCRfMhuW46poskh4qginV8L14j6YdUs4ItozLAFUt4A=;
 b=e8CSMUsuiD220HrQv9vCGbz/f/UTZy5zGEidfcYKJZb+Xk24SbozNBbLO3dcKodDQ2dw8dTX3u+UoQxVRQMtECR3wW9W3hdGdlX9B+744Il60oQ71Ut4aRHHSr88Zc7nw3rQSFBL6rYXHYe9txH1MA/pPjRNvyKaZgzWvvCOUAA=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE1P216MB1909.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.18; Tue, 7 Jan 2025 01:39:14 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%3]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 01:39:14 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v2 0/4] Fix critical bugs
Thread-Topic: [PATCH v2 0/4] Fix critical bugs
Thread-Index: AQHbUD9ZcOZ5zsD26EGOp8V6aVRwHbMKqRfg
Date: Tue, 7 Jan 2025 01:39:13 +0000
Message-ID:
 <SE1P216MB1303385EA4DBCDECC5CB4BA6ED112@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
In-Reply-To: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SE1P216MB1909:EE_
x-ms-office365-filtering-correlation-id: dc0f90d2-9863-4a3b-8cc0-08dd2ebc1795
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?uvu7FASMhR4581rlbLVNOwce3RB8DwqI0T7NLhCBnXjVn5aNR5mEHSL+3YMO?=
 =?us-ascii?Q?eVWE37GoCm+XbCsGSehhnRk8xU4iB7AzeBKtrQ+VnBg3ti610UJ07eqCodfS?=
 =?us-ascii?Q?isn7DryIpeH98e9XTG0Y+/whmlEC/+nttQ9Pwfooos8Raqin19FZPDKMPjwV?=
 =?us-ascii?Q?2zIZLx1Wf9NDu3iWBaea2jHQ2hsilx7P2Mxsm8hUB4c0k8lZ2BdFhCWmXANf?=
 =?us-ascii?Q?EDHCdVxkgpFw/0qr+P9/26Akf/o8C97EdPDrnaJRWrA2k6yJtcmf6DnvJBVK?=
 =?us-ascii?Q?sk0TTwtx89HUn57h5dEUfkiYq7c2n5zej84anDwhNLYvn/zM5SyIk/4m6iaF?=
 =?us-ascii?Q?+AxMH12XSVrx4Xr9GbuIKSG18zFq+KnymdyIRnPHAAQnA7bnbUdq6ONt9GL5?=
 =?us-ascii?Q?A+RyflHCwaer2hfXidU3GlEyQL5KoXq6me94m75o6z1fbCnazGMtzyr8jd9v?=
 =?us-ascii?Q?kNejRlJX031cmsalJFQSMmacPSsp9pIl4rQLU4z3u2nfhAaImdldQKw5UcTr?=
 =?us-ascii?Q?UkqYJH+3CQdlfSKrzvalkGojlqfowZRoG5nwHGTb0Hl0a2TL5sG0vJPfXw2i?=
 =?us-ascii?Q?HO13Fr6h+HZT3rDESTZueqqyXZYy3xb2ShgxdMPcr8CaWnpdqeKTSmSWHqaz?=
 =?us-ascii?Q?wV33UPKG7cBXpVwqBUFd0829Ybjnvf2vtLGwMmtaQJgAUHEGdKcaLAU3H5d/?=
 =?us-ascii?Q?abLwNt9w94YMTmfq7edVC2dvMyrqhaRzn57bKbBQVIH5aHwciP/RP63WF/lL?=
 =?us-ascii?Q?CkGmjxnXGNzQOoi4KnmylBBAwjGM2OQVC2zS0MLsprcQEP/o1270RiJB9PQs?=
 =?us-ascii?Q?smnG8hRTb2KWZnUm+qPujfouFOd1BDrtqr5gJPIWdX5xFoH70pZWWDdqnz54?=
 =?us-ascii?Q?WsV+JQCOUJKS2cu5aQWezURA0aEFy9lK0MAJkqNQMBGVzAl1paqpAv9jQyC+?=
 =?us-ascii?Q?iEf+oRsI6xpTs06Ep4y+tUd7BcB8kcAT+4NNPDC2tGeQgw3vd+tRANfJBKqt?=
 =?us-ascii?Q?Oj5KN4wQWCFTqM1YyqCD+hjvdSxfpJPTnudTYU/kCm+8JU/WLXuL/kwAXfzn?=
 =?us-ascii?Q?qGSnphCQE14fjfBNmF/vQ8h98ofwp+jCrTPMFVyPGD22IsjGony3B00bFpqt?=
 =?us-ascii?Q?Hcea6aPQ7nKC0Fd8lu9dGIFcpVNJCPOdg7MuiqiAKVbi6O1MJWk1eLcBKo44?=
 =?us-ascii?Q?D3rORMWzOUUtvsLdRYDd5jo9fpg70FEKs14MbDVYZgY2tBpsJLWDqoanLrVD?=
 =?us-ascii?Q?MrJAppknBuZIjXcpOGsQtEoTFs6lvMeMMQNQlOfSvMs4q+2rWRPxPJPevjkY?=
 =?us-ascii?Q?kvM9u6D3rKbQ7G4kWWcdNoj/ZBIXGKZVSwE8b6xWOuLVFS4LbSVsPPyYOJfS?=
 =?us-ascii?Q?zRSNpbI9+5856g3NEwuy09PfpvE2nGUGXtn53G4MiY3LwHGVXg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Jw8pzOcmj3rHTPx9AYJfLBT0og3NLcs6MuKpWW8mvX9yQZScDUS/h3sctyw2?=
 =?us-ascii?Q?B3lGTfAmcHmiBAePRuwuL0BYndI7k5Nr1UCeQmiznxcz2cz4vxZH6xdcWSSd?=
 =?us-ascii?Q?xXVkFWp64yFjApvs9cDk4jgR4yFyG/o8VvTCTcfwpAAGZSPjjvLlC3RwiiVX?=
 =?us-ascii?Q?fP6ES5zcYxmoqzJijFUydLG9DhM8DiQJ9jaTlwkxDecIyJvFqSQys9YBGEOM?=
 =?us-ascii?Q?WRkIwaqA88d1FFkCJrf672ksjgJS44J9tLaBL6EOu0RpfdvBsy5JttlZmwiM?=
 =?us-ascii?Q?aRZTNIE1JsTRQ1l8VowZro2tmmrd+ceuwDh6NgK7+Ieb+eGYK46hr+rrfq3V?=
 =?us-ascii?Q?EhP5uRRjzQiP8RppODFpSL4vf5+uq6gOPW1/eQOI9nOgl4Ibzy+WsWXBygX3?=
 =?us-ascii?Q?jiVpsRHu7vlijfiiHcHs4gMLDHdqJGqKyE2KNRhEw7CL4ba/6gSBYSG9wOIk?=
 =?us-ascii?Q?KtyVpffWvUJ70AWr+X0bQhB0KRUw7kRWdVokrTkjlH6Lj3OdgshggpIJjcPG?=
 =?us-ascii?Q?2VogGm2ruDXv9myesjkB55P9azbm3Js7tMDuKAz0aHf+/OUhozVsKNZ/ab66?=
 =?us-ascii?Q?/J9DX9NwZ+jiJ2db8UZkE+R3gRZGcgpLnGDr4ff75aXoQ7pvYHDckLyM+V4X?=
 =?us-ascii?Q?/lNfYxPQXkyQSZJxldbpPRoc+VGgyR2kjZ20JvpHp0kcyLLfnXCZPKiD1NUf?=
 =?us-ascii?Q?PvbjZ/O7wxG4ITjrfJe1VTDZpDcUW2tqG5fw7jCFHxeu8pSpxCDlYo8LYtla?=
 =?us-ascii?Q?ytnfobBGw+g1QArBycdywIbMHV1VedvKRISO2fC37d/zq0J2fWmPQ4wUhKzA?=
 =?us-ascii?Q?iZOuwynC+J/UzuRi2g8xFAcVsNI7awntsugvQ3NTOUEnG8BCNKDcnNYhQ7zn?=
 =?us-ascii?Q?snRoRZkAoLFZ6fXWdDiNJ9RW4WYkam8bB6g8bNIFQnpz+nP/kMPoT5pLEedp?=
 =?us-ascii?Q?v+C8Xlj7QLqKbLVuI1qUQsod22XbiaN6Va5SwB/t7NstJ5AWh6YoAuLyamd8?=
 =?us-ascii?Q?gu6QUEgrcr5L8uMICApaRSN1ZWoJjAa21L+YuiUruyWEXwSrVZ9oBPkzsGmN?=
 =?us-ascii?Q?TX9rnfsru2FS6R7HPSO7GAvsWH+VFJ9lJVZNtrLWkNZIHd+/I4amks9efIBs?=
 =?us-ascii?Q?rHsySdWnoooAwa2m/Rwt3MaDOkG4I+sSTEO1NsSHEeyi3P3crc4xUQJxlpmk?=
 =?us-ascii?Q?LQcnmaJWqRcDoyCS88BQKgHuHhZTe7LrAjXzbegh5vvwsPANSWc2PlOdqMQx?=
 =?us-ascii?Q?h2SDyrZKZQCsTEa6V6FbDdgQ4zcJ6+FF7/6gdYef6RmAdBdWEHGfFokweuk2?=
 =?us-ascii?Q?UcfhhFigzPUA0QIkGw0mi4ENgo6XjSpd8r9nrsP0ydebaup642Vf2yM9xXcC?=
 =?us-ascii?Q?vtVEJKadJMrQbkl5vGBEYkGYbTkOWtQGaD3+3sgw64BrUZ+fDFAtVR/eVLNw?=
 =?us-ascii?Q?StO0GnB5sua2EUKgyYjZLVh3OxKMrRcalXj5ZhrEk+HXyDepgcbq4pYPmr6g?=
 =?us-ascii?Q?+fQI88OWJtvOWX5lAu9+aQ4miwkqUCdnq7LgC2BBtLjYiJ+LnTvLhuE7nMq/?=
 =?us-ascii?Q?xCXCWdZVuTdG7YJ1fbitrrBEjAy751r6/eEp63gz1p1C8a0GjMCCCtEqGMxP?=
 =?us-ascii?Q?sw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0f90d2-9863-4a3b-8cc0-08dd2ebc1795
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 01:39:14.0365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pCvDLFGtbrSiXOHiHMzIuQ4PHDjyAM+J6H3yfle6ayJezdZsg7vA5r4KUzPAIeH1Zlf+VW/4zTJD2D2JcZYiXCFntEHcSbM49ls7F46oTOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1909

Hi Sebastian and Nicolas

Can you review the following patch series?

https://patchwork.linuxtv.org/project/linux-media/cover/20241217045125.58-1=
-jackson.lee@chipsnmedia.com/


thanks
Jackson

> -----Original Message-----
> From: jackson.lee
> Sent: Tuesday, December 17, 2024 1:52 PM
> To: mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
> sebastian.fricke@collabora.com; nicolas.dufresne@collabora.com;
> bob.beckett@collabora.com; dafna.hirschfeld@collabora.com
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; jackson.le=
e
> <jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>; b=
-
> brnich@ti.com; hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>
> Subject: [PATCH v2 0/4] Fix critical bugs
>=20
> iThe wave5 codec driver is a stateful encoder/decoder.
> The following patches is for improving decoder performance and fix
> critical bugs
>=20
> v4l2-compliance results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
>=20
> Buffer ioctls:
>                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not
> supported
>                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not
> supported
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>=20
> Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0,
> Warnings: 2 Total for wave5-enc device /dev/video1: 46, Succeeded: 46,
> Failed: 0, Warnings: 0
>=20
> Fluster test results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.=
0
> Using 1 parallel job(s)
> Ran 132/147 tests successfully               in 68.608 secs
>=20
> (1 test fails because of not supporting to parse multi frames, 1 test
> fails because of a missing frame and slight corruption,
>  2 tests fail because of sizes which are incompatible with the IP, 11
> tests fail because of unsupported 10 bit format)
>=20
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0
> Using 1 parallel job(s)
> Ran 78/135 tests successfully               in 33.238 secs
>=20
> (57 fail because the hardware is unable to decode  MBAFF / FMO / Field /
> Extended profile streams.)
>=20
> Change since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v2 1/4] media: chips-media: wave5: Fix to display gray color
>   - Add Reviewed-by tag
>=20
> * For [PATCH v2 2/4] media: chips-media: wave5: Avoid race condition for
> interrupt handling
>   - Add Reviewed-by tag
>=20
> * For [PATCH v2 3/4] media: chips-media: wave5: Fix hang after seeking
>   - Add Reviewed-by tag
>=20
> * For [PATCH v2 4/4] media: chips-media: wave5: Fix timeout while testing
>   - Add Reviewed-by tag
>=20
> * Drop "media: chips-media: wave5: Improve performance of decoder"
>   - We will try to send this patch separately next time
>=20
>=20
>=20
> Change since v0:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * For [PATCH v1 3/5] media: chips-media: wave5: Improve performance of
>   decoder
>   - Fix Null reference while testing fluster for more than 2
>     decoders
>   - Fix timeout while testing fluster for multi instances
>=20
>=20
> Jackson.lee (4):
>   media: chips-media: wave5: Fix to display gray color on screen
>   media: chips-media: wave5: Avoid race condition for interrupt handling
>   media: chips-media: wave5: Fix hang after seeking
>   media: chips-media: wave5: Fix timeout while testing 10bit hevc
>     fluster
>=20
>  .../platform/chips-media/wave5/wave5-hw.c     |  2 +-
>  .../chips-media/wave5/wave5-vpu-dec.c         | 31 ++++++++++++++++++-
>  .../platform/chips-media/wave5/wave5-vpu.c    |  4 +--
>  .../platform/chips-media/wave5/wave5-vpuapi.c | 10 ++++++
>  4 files changed, 43 insertions(+), 4 deletions(-)
>=20
> --
> 2.43.0


