Return-Path: <linux-media+bounces-20417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EBF9B2F9E
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 13:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 657811C221AC
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 12:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FA41DD865;
	Mon, 28 Oct 2024 12:02:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2092.outbound.protection.outlook.com [40.107.239.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19A31DC05D;
	Mon, 28 Oct 2024 12:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730116943; cv=fail; b=t8Wbeg+tdfmDTdU+Qo3+B8DXDsSM3dH0HQTPmtbzOmKtuIeHyFmOVr7IhuyFymtoZeRoLw0oKmCt+BnNm0ARwcX4qz6oFxishEA3i83gEN20p2f+BhRATzj6ZiiZtNtX4CWFukdxsu8blAYHFaLvg216Txvt7a2dt3IrmrwB3tE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730116943; c=relaxed/simple;
	bh=9rbCKmLPqsE1Tg3WVWu2D/TCHFXBsJ2Gcdb3fdiK+cc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TIJcwjgfBie+mbw0SG12+eoMCyr9pkQRec6SjMcJiDBW9tylU84MzbpVoDhL8aNxue2BlGqw1/zJELMaipl3tNtyF9KspGXtWchDvC25KpE4Cq8kimbyEyXx5z1PMBYzyE039RQj5UGvKLiT4dpPNcjzpGBEl0TAwzE81EX5yuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCpcQIqpwe4joTqlY36wEjvEGCUBLU1aafTnW/m82nPus/KFeUPaoxT7CqcZFDP6weuGj4L4ZyICw5deUckwk+beEP3spbIzjky6tegSs3Xe9+oxtYkYRY7jO1kWSV86EUlPwWBfk9WpnZ4z8CTWYN/hmlfZ5wN2ORFfhWlBHlbGC4ADMnD7OSI5PQawusidb2+9yTR9SFU1WIzORlddh6z/ZHBtPBuc3QEE57+Xg8QzXasvbrPX4zvJ4j+RSRijfGtXAmyPAHXKGe8Vkr8ZyqNZZfiQpVRdJQBrEpmKRFpUs4u9E4kYJI7wO6Sj0Bc47Don4ym9cJqG5IvzVgckPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rbCKmLPqsE1Tg3WVWu2D/TCHFXBsJ2Gcdb3fdiK+cc=;
 b=y8y7LavbeDlQyqlczrIIVqQ/DT0+gBqDpTQMloWPV1CybDhQuXAuOm9JbiO8zl7ZyrWiBZs0ibMQB2pwWk4cSnK06PVaT9eSXseQxRSW5vQ8UZWyrhXny5NILrkV9FhAV0DcA4nqt1kFmt0Y7brcyUca8e5VN8fYd7rq+C25YIB/XAKbZVwkuybju7STZsjKQkZb26jn2V0EHh/3aGIRc8HmHjCxQiBmTS3vAvWJa4uWkaEiPGggbyAKJFSetBRUiXFZxvWhloSWQmmII61zQiCS0Gl5p2g0CLF9ydrhGwzzLtWLejOCeu5QZ7F6s6fAoJyipE4atJRG08mFp4hjqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0482.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 12:02:16 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8093.014; Mon, 28 Oct 2024
 12:02:16 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] media: mt9p031: Refactor format handling for different
 sensor models
Thread-Topic: [PATCH v2] media: mt9p031: Refactor format handling for
 different sensor models
Thread-Index: AQHbJyukwG7laAek3UK4xeYoOBf/t7Kb7ZIAgAAlECc=
Date: Mon, 28 Oct 2024 12:02:16 +0000
Message-ID:
 <PN3P287MB1829515AEA990C3CC437DC9C8B4A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20241025221638.127457-1-tarang.raval@siliconsignals.io>
 <Zx9c8gvmy_nY5l7e@kekkonen.localdomain>
In-Reply-To: <Zx9c8gvmy_nY5l7e@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0482:EE_
x-ms-office365-filtering-correlation-id: b912770c-3ec8-4e2a-2d7f-08dcf7485def
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3M20jC8gdKD05P/DIaGg+KHlCyu1t3Jr3k6PdIEQ6EPSaBal/2ALYOJx5D?=
 =?iso-8859-1?Q?Mso2iNnIx+TY3cZLc7d+kzc+JVEHmC7kpmksu5SLHZiy3XH57r7RkMpdRe?=
 =?iso-8859-1?Q?rSt9a3nf8eV3zBJJJCQkXE8e64RnmcVfnVD0qI+ehk6d3KpqnOLGpJdrpL?=
 =?iso-8859-1?Q?x2SK8mIoVKiufzH0+I788ysi36GzmyztqS35HsaujuVfoLr3XqOpGCWE27?=
 =?iso-8859-1?Q?ziTXD+EracQhvkVO3N9BW6aQPG/VwpT27xwEvecGi8MBvBEdGTPJqLNaGg?=
 =?iso-8859-1?Q?QhLhnSsjmCK0VpqNIRn975gZPs/ks6jBUha3rZJJyTipiSYq0impFzmo0q?=
 =?iso-8859-1?Q?JnyW9pO2AWImRU1QpOmJDXp+d/W2hrhIizb5sO4s3Ep949ZGQuCoP+71HI?=
 =?iso-8859-1?Q?VLxMwTQ3OnGr+SdBqtwhFCak2XkjsQrRb9X9DCskPtp3FEZ2udzGFmQwt8?=
 =?iso-8859-1?Q?DwalRJzfcDfqEcGZJMHXpRCKJ1GdtmOt/NjUuprUkB2mWvdbxBoBUzUvQx?=
 =?iso-8859-1?Q?RZuGIsleMCDBNoS3OFQmSas7XbLL0j6L1bXHUhZrxoQ38VT7Ft+S0E0UlM?=
 =?iso-8859-1?Q?92BwETtMnxKOAoqDjB0lzRLol0VQHz5NUGyleiWq6Dst9c9UAJe9FKRF11?=
 =?iso-8859-1?Q?EYZEWYP/vaQRUcd/h3MI70doIyCmKAMBgWsCS+eM/tewZeBc/HxYOKp5jY?=
 =?iso-8859-1?Q?8I2TasbP/I70HUKkU/nXLU1MvkPXmz1rQqGI4MlFDFyGiFDdXprYO51eIZ?=
 =?iso-8859-1?Q?S+pwdqKMKcYhxYI4vgGSDQoFlthK3qIvtScJoj3L/MIJXvkO5ePkxidS9G?=
 =?iso-8859-1?Q?WaeRXcFqiGCg/rHfCfg1BTyM7Pb3frwyWxv0yhoRKWSthi7HHe0t9Vkgfy?=
 =?iso-8859-1?Q?p91EpEWjezAlufgw5FGihcpAvtX33czMfe87euFzSSnOcYftHn+Flf99Mv?=
 =?iso-8859-1?Q?Wfof/Nnq0AlO8dJ4i1lKZKNqVZ4egjiK/OD9IOqsmaPIYNg1CTcPtSoahp?=
 =?iso-8859-1?Q?259yKDEifTnxhaXKA050T2QdVFZLkHvtBRmnONyNDY1LDdrN30Lp9Ipw7l?=
 =?iso-8859-1?Q?8g6j5bPZ5Ncga1K8pPK5upu2w1HQL0xiVWQkgIJewCQpa8FzPrYdCs6kf3?=
 =?iso-8859-1?Q?vi8oA+gAWwmNlfzPSFHvtiuGweCfNAceHr5IpvJ/pCaWGhGQ71ICjwF5+F?=
 =?iso-8859-1?Q?A6NCM7LQ2SQPkpJjXjjxHY76TekHYqVhqfKULh3vj/T9zzHp6fWQj2iBpO?=
 =?iso-8859-1?Q?SGSgLaHN99xTAf34NxX9a0p42Z+VzSdowT6BHRKO6U098KG5tfGW28o5tz?=
 =?iso-8859-1?Q?NLp/RUmQPCszPbMfCURO9uav+vhznnbNkilvN1hZ2WE9xCOJZoAOuUiA0B?=
 =?iso-8859-1?Q?vf2u1EBkjQNFMa8utGpUpMNe7hZUrrJNMDYlu4E3z1dccSDL4No6U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?eHI2N/ExXGtklGW7vVxCgcmb7G6UBzYZT/kv0NadBg0PjhBjxrWqaQFCZ5?=
 =?iso-8859-1?Q?qyQPcpISL1T7yyz5jTpTQ0EJzf/nZ0uimyRO4v3Es2vfefkxHajE8bYE+K?=
 =?iso-8859-1?Q?Bi0DJgYnmQlu2Dt/WXb5Zg7tHKHRaxaBE/NI5RTj0UQDyvSEh3/P2QIIRC?=
 =?iso-8859-1?Q?j8AaYZKDR7sQqgpTa+nkEegTkVeRFUDVli6pE8+2+cYW8BTldkE/mw/9fi?=
 =?iso-8859-1?Q?ozJ7/QKwYIlsy9TuHJ9yWzv+0eb+c1NIgYKTjMXjQqQQAdwE6raltQt/pN?=
 =?iso-8859-1?Q?NasW4lOl7b59X1lD03Gadm+HaMPpB2NH9Z9gMtFtOsYljHKOME1ll6B+UW?=
 =?iso-8859-1?Q?CvitfWQGnlpgSeaoQBHVpf2uPi3A3Kt8XmmVh5J4xxyKbwA9JI5aYR6+df?=
 =?iso-8859-1?Q?l3Rj5Ta0KxlU5gX7USe6bbV5omJfSazxr4KUfwQudCK5PNSn2cvJCBjLdC?=
 =?iso-8859-1?Q?TlqheYWRlfl8l/tsicbbYpGaCzs7FDnrfdkjzHy4jtlju16cniNaFo9Baf?=
 =?iso-8859-1?Q?PWGsbvPkrYOl9J+/qsNwaE1xiDDiiKALT/HyPM0GKx5EsG9VAag6fQrU0h?=
 =?iso-8859-1?Q?qaZ6x/MQWKxU9ki0aQrzXrUSpUOoq0uzG8HxbZqXDqA7xtpZlVFrIZ3GWW?=
 =?iso-8859-1?Q?Hc3c8mYXkUgIjy5jiPYuuL8yyNncDWfi+t2P0ouKEg7bI7jkhFBM/WWQka?=
 =?iso-8859-1?Q?7EByJVPb6gDoDA/l39Yr8xsocA+Mf76HgKJJbItFJ2Kh3AzxFOIcC7XCyV?=
 =?iso-8859-1?Q?q/btflq4st8w9lAwLAAutSU2OMWk2F2oDOtvjA4gPvKT2yxVn0kdn/Pkkk?=
 =?iso-8859-1?Q?6dUjSopUZhIngfncn20I0lWiu6i8/mz9z6KY7DZnpqHvpyLLxukr201kWi?=
 =?iso-8859-1?Q?TdLA0LP0iSNznqkjBWLaU0cv2C3b9vxNEqmvOT4aRNaRjq4rAp01nasTFT?=
 =?iso-8859-1?Q?nwKFYfLXb60TXI8V7cVUcq/28RV+J85m/EtRaENwA93C/cy2/XzRa8YLZZ?=
 =?iso-8859-1?Q?YL/muY0pHK17zr7XHAtsCo3QayLjB+r2tEqZts0f7o3/q7i6Bkr9O4t5dL?=
 =?iso-8859-1?Q?8f6ULB8+KkhV4QBoT0k74NXL8BGpdsr3hcy1K9dbZgC2T5PiUVOhyswBoC?=
 =?iso-8859-1?Q?Bbjn+R4i9dU6NK+xJV9Fu1ECk5pTzWJkv73nUS4JymkIiulatwgXoQEg0u?=
 =?iso-8859-1?Q?KgU2I5cVpFz5atKl71pXsoag+FPP+qPMXXWgqtou0lPNy32yuPzFxXhBjZ?=
 =?iso-8859-1?Q?drAubRexcv7AQYHyMSX7dItXXyVR0MeoKqSYZLAQ/IJjzovMisF0yN/59V?=
 =?iso-8859-1?Q?DZfNa+nkmSu5tRjO3z6YRyRbY+hRSOgUT4N0/5qjNFh2edm9O9wcMfhS9C?=
 =?iso-8859-1?Q?kRiMZnOJM2nmqVZC5kuqrR4zIpAJ0MRvwAgy0ov/PdHwubVXnm2jw13oun?=
 =?iso-8859-1?Q?8aWxYXPXZCDMCqvtmWDdr+lOv46BAGm1EHaLzAW752Awdtx1kuokarF+CM?=
 =?iso-8859-1?Q?EEYXBU3HA1CAuFOnCj6MPhWlsryFrNGO6fIvr8a8Tp1uZAy91I7Z/9+zm+?=
 =?iso-8859-1?Q?Ju6SHIJgn3B0EPRf49EheumeS/73mYRVeQYeyKYuf5C88m30A+dtwzrhDQ?=
 =?iso-8859-1?Q?79OgpT8aq4HQU0dW9YR/eFm9RJoAECQ37ebZnrc9KpVng7SFTKG8xKjA?=
 =?iso-8859-1?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b912770c-3ec8-4e2a-2d7f-08dcf7485def
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 12:02:16.4880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +LdX4rrYvOgMuPTXERZOgG9a58wtMZywd9k9cd5lmdEgeOekqveEOYuRxYdQPMKjlPmjfaWJQ9VfpHRZZwXriN8uBjJln3PXjkd9auM9WzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0482

Hi Sakari,=0A=
=0A=
Thanks for suggention=0A=
=0A=
>> +=A0=A0=A0=A0 }, {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .compatible =3D "aptina,mt9p031",=
=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .data =3D &mt9p031_models[MT9P031_=
MODEL_BAYER]=0A=
>> +=A0=A0=A0=A0 }, {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .compatible =3D "aptina,mt9p031m",=
=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .data =3D &mt9p031_models[MT9P031_=
MODEL_MONO]=0A=
>=0A=
>Instead using an index into an array, could you add structs for describing=
=0A=
>both separately? See e.g. drivers/media/i2c/ccs/ccs-core.c for an example.=
=0A=
=0A=
Sure, I will send v3 with the above approach.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
________________________________________=0A=
From:=A0Sakari Ailus <sakari.ailus@linux.intel.com>=0A=
Sent:=A0Monday, October 28, 2024 3:14 PM=0A=
To:=A0Tarang Raval <tarang.raval@siliconsignals.io>=0A=
Cc:=A0laurent.pinchart@ideasonboard.com <laurent.pinchart@ideasonboard.com>=
; Mauro Carvalho Chehab <mchehab@kernel.org>; linux-media@vger.kernel.org <=
linux-media@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vg=
er.kernel.org>=0A=
Subject:=A0Re: [PATCH v2] media: mt9p031: Refactor format handling for diff=
erent sensor models=0A=
=A0=0A=
CAUTION: This email originated from outside the organization. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.=0A=
=0A=
Hi Tarang,=0A=
=0A=
On Sat, Oct 26, 2024 at 03:45:40AM +0530, Tarang Raval wrote:=0A=
> Add new structure 'mt9p031_model_info' to encapsulate format codes for=0A=
> the mt9p031 camera sensor family. This approach enhances code clarity=0A=
> and maintainability.=0A=
>=0A=
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> ---=0A=
>=A0 drivers/media/i2c/mt9p031.c | 31 ++++++++++++++++++++++++++++---=0A=
>=A0 1 file changed, 28 insertions(+), 3 deletions(-)=0A=
>=0A=
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c=0A=
> index f2f52f484044..3576d3066738 100644=0A=
> --- a/drivers/media/i2c/mt9p031.c=0A=
> +++ b/drivers/media/i2c/mt9p031.c=0A=
> @@ -112,6 +112,24 @@=0A=
>=A0 #define MT9P031_TEST_PATTERN_RED=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 0xa2=0A=
>=A0 #define MT9P031_TEST_PATTERN_BLUE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0xa3=0A=
>=0A=
> +struct mt9p031_model_info {=0A=
> +=A0=A0=A0=A0 u32 code;=0A=
> +};=0A=
> +=0A=
> +enum mt9p031_model {=0A=
> +=A0=A0=A0=A0 MT9P031_MODEL_BAYER,=0A=
> +=A0=A0=A0=A0 MT9P031_MODEL_MONO,=0A=
> +};=0A=
> +=0A=
> +static const struct mt9p031_model_info mt9p031_models[] =3D {=0A=
> +=A0=A0=A0=A0 [MT9P031_MODEL_BAYER] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .code =3D MEDIA_BUS_FMT_SGRBG12_1X1=
2,=0A=
> +=A0=A0=A0=A0 },=0A=
> +=A0=A0=A0=A0 [MT9P031_MODEL_MONO] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .code =3D MEDIA_BUS_FMT_Y12_1X12,=
=0A=
> +=A0=A0=A0=A0 },=0A=
> +};=0A=
> +=0A=
>=A0 struct mt9p031 {=0A=
>=A0=A0=A0=A0=A0=A0 struct v4l2_subdev subdev;=0A=
>=A0=A0=A0=A0=A0=A0 struct media_pad pad;=0A=
> @@ -1209,9 +1227,16 @@ static void mt9p031_remove(struct i2c_client *clie=
nt)=0A=
>=A0 }=0A=
>=0A=
>=A0 static const struct of_device_id mt9p031_of_match[] =3D {=0A=
> -=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p006", .data =3D (void *)MEDIA=
_BUS_FMT_SGRBG12_1X12 },=0A=
> -=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p031", .data =3D (void *)MEDIA=
_BUS_FMT_SGRBG12_1X12 },=0A=
> -=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p031m", .data =3D (void *)MEDI=
A_BUS_FMT_Y12_1X12 },=0A=
> +=A0=A0=A0=A0 {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .compatible =3D "aptina,mt9p006",=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .data =3D &mt9p031_models[MT9P031_M=
ODEL_BAYER]=0A=
> +=A0=A0=A0=A0 }, {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .compatible =3D "aptina,mt9p031",=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .data =3D &mt9p031_models[MT9P031_M=
ODEL_BAYER]=0A=
> +=A0=A0=A0=A0 }, {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .compatible =3D "aptina,mt9p031m",=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .data =3D &mt9p031_models[MT9P031_M=
ODEL_MONO]=0A=
=0A=
Instead using an index into an array, could you add structs for describing=
=0A=
both separately? See e.g. drivers/media/i2c/ccs/ccs-core.c for an example.=
=0A=
=0A=
> +=A0=A0=A0=A0 },=0A=
>=A0=A0=A0=A0=A0=A0 { /* sentinel */ }=0A=
>=A0 };=0A=
>=A0 MODULE_DEVICE_TABLE(of, mt9p031_of_match);=0A=
=0A=
--=0A=
Kind regards,=0A=
=0A=
Sakari Ailus=

