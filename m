Return-Path: <linux-media+bounces-20337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F41D9B0C9D
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 20:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22156B24414
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A65520BB24;
	Fri, 25 Oct 2024 18:02:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2134.outbound.protection.outlook.com [40.107.239.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40DD20A5D0;
	Fri, 25 Oct 2024 18:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729879320; cv=fail; b=TqXoVZSEKzemfn5GxJTDxdYSqzIjd5PxMv3Q2vDTu6Mw45penxh9RmILgKIQzWo6iNXA51Sex/q/DNhCst/ku+FwP8Fc1LR/AI5Ojn9pTbX5ibg595cXYqQgdluor34+yB/Llbe7wrnSWDvCqCMkpxJyC1D8xFa1XPDJP7t5aFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729879320; c=relaxed/simple;
	bh=Ow11ss0HeIe+QPBy/fpvRyECAbezfl0NeuahrDHY8zQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YJ890ytDUhhL1IF85ypwYqbALryktn3tfPlzLkvjAk4FDeBLeXGZMeJNM+gqRR6SdadfcLNFJdpl4Kz2duHZcTfzR31k2cSzgPnAysnKxMPR/QVTcPb63ErrXdGWDa4jYolh9czV38uTh614J+KAafjyuRfZdtcUtMSjO64So/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6nBgZoR6ud4VkGWj+XTn2Ek8iodlkaozLhQM1Rp7VD8QgBxM2p1OI09zQiGjYEO0iehEYM4n9m8a6T8th9Rx4TPgJUFgq3kdwER+RvXkZHq7z3ic3wK9WOdpavKqvWx7cUaiVLYY/1N0lUoScevKAfKBU50UV5ofVPxIg39BMEhkGIJiz5DcMpViW5ZhBaENZUeb7BvBUpE0sKAkfSmXAcyaMfgIw5E1zHyDM2uN1BaCjp5WKussnUl8uDVP0WEoayMqLUF8XGE9E22MXgGYQ6qxPAwVbQy2FSiP4eFvFDwJD2qDSN67tq5EoIQY/hLXb0YvDfmNEFxDxHSRozNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow11ss0HeIe+QPBy/fpvRyECAbezfl0NeuahrDHY8zQ=;
 b=uRuaKmhdrJWsv/WpGak/+EaJtbbhJ4FMrEftH/P1vghc+UBX31AKjJUO8mM0OlHLN/ZAXGENdWY1DiNdtCp5MqIBzWIIm/RAFQ8bexD7Zv1BCbpDl74n6UtJDYMq8LKMYa6OBfjkbo3+3GL6c9fBp6BZ2wyXAu2kprB4qmdCXq+jvkae00QjUXnOCeMO/qygHPRpQpv4dMfah6KYyZh1tdSKKn41XpN1wchbne4VhIuej0mWxcOXsxIRn6K9WPwrK10KJETJzKRshsMfaBR3rxzaj7YtxqGepbjlD2q9J1W1p8VsvnE/KT6FBe+MPHaSUFcYAwdCv4fpWQw2hAVWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1295.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 18:01:53 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 18:01:53 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: mt9p031: Refactor format handling for different
 sensor models
Thread-Topic: [PATCH] media: mt9p031: Refactor format handling for different
 sensor models
Thread-Index: AQHbJt6MAjVJvCMboUmpRj1rjiAFU7KXpOWAgAAXins=
Date: Fri, 25 Oct 2024 18:01:53 +0000
Message-ID:
 <PN3P287MB1829F71AC066E73FF25FFA658B4F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20241025130442.17417-1-tarang.raval@siliconsignals.io>
 <20241025161659.GD6519@pendragon.ideasonboard.com>
In-Reply-To: <20241025161659.GD6519@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB1295:EE_
x-ms-office365-filtering-correlation-id: db279b70-a7f2-4d0b-b5ae-08dcf51f1b66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HrRD/dkgvKy5uOjZRb79tKaEGtXwiOdE/U+CibtDIpY6NMBqzKnzJHMstx?=
 =?iso-8859-1?Q?8wJVSq35re0MzM3oOreR/iknU+2fJk67OlOles1NvlefMNYurktdsmFoAi?=
 =?iso-8859-1?Q?8tA35e7YJNdoDreUgJXNEzOPx6oSo2OCh2XncjNb0ChICYxxAQ6kqhzo75?=
 =?iso-8859-1?Q?hWUoUhkwqoVPQ0nn+YZbazwNvCADBzJ+WUO7g1wU7iPJadLHJNZxGSkUj1?=
 =?iso-8859-1?Q?A71k3kDRI4bj+TrWNux8GvP8j8TGzM/USnMIIO5sEoxpzTxI97NigF8aF9?=
 =?iso-8859-1?Q?6Wkckyw7R1bm4qxgrYi8nOWMch/9hotHKcOuOetGNAT751jrzGnnCYpg01?=
 =?iso-8859-1?Q?8q6FUfkzOLD9CcFulNQnHK+RH2C4fb3S9l24tbO7WwPAncS1TwrnS2xx3W?=
 =?iso-8859-1?Q?8w+fRgYr5mNeiHIDyhOjdqXX6C6scenuQFTfBVCgDmj9SqVfQL61hjvOpt?=
 =?iso-8859-1?Q?EXYLOLTucVT/JxaORBi+7aromQSBmVZnnlqIwoRNXikH6XDlrm7NJ91u5T?=
 =?iso-8859-1?Q?93bcfctB1J/pRVw8InCkNShggMtbfknpQdTPT+wBeklNIq4LFznBqA1+Xk?=
 =?iso-8859-1?Q?3e8Y6JmgG3DRURaIvkWCjEfhW256LzeCWlSeZw+oWsY5uFlwrztiL+hfCh?=
 =?iso-8859-1?Q?Gj4bqFF6RqnWnwlepjP+/YP5CqMW8WeCbiJZevQ2DoI0+PXaJSNWevT4DI?=
 =?iso-8859-1?Q?vkR2DkZki+YFWzLj0FmN0LvhPfiI9SuuCGsCAVnonmyBTGZ6gsE4drP+M3?=
 =?iso-8859-1?Q?SB5ByPDQZ8hqNXAv0qnQ7z04T3i0YHKq1jtSxQ5XvwYtsM2l4IrWLIffAh?=
 =?iso-8859-1?Q?1QMZvYMMNpFpmdrY8VFF0H6HR0wfD/62Ig8wyx5aqpUyLSj8VSH/VzZSO8?=
 =?iso-8859-1?Q?M4IRpK0iddABiUzggE2WFztRH1AFzCZL+81Rd3EbWwIiyS6VpDEGHhJxfs?=
 =?iso-8859-1?Q?gOysNqFdbUH6FSWeFQxf0exYD9Ef6jd9H8nHjAlZXWFieWi5v1fj3Ix6eN?=
 =?iso-8859-1?Q?i2Y1mB0TU4c/L7LL7Dw8d42VFL5/XWZDq6dzYI1j1OXE3qIqRPFIJQRZBV?=
 =?iso-8859-1?Q?8/4D37seRpvJ092dOfFM3zYzuqVmYPiLC3iAFASdyBLer0b8atzZTIuWZj?=
 =?iso-8859-1?Q?H1oNsi67NMDzgW1kWKihw79+gHSY9IH/+54LFgPdfysWAzQb1tfWentNrz?=
 =?iso-8859-1?Q?HdWiOn3Eqwcf1tu1aPzFFMFsFcuOVuZUCPgXN7QTkmix9YVze5DtW+ykLv?=
 =?iso-8859-1?Q?gWxrfp2w2SMLbFeDLqwaYdG/J1DPk1wLlgAsIcAoHsZIllEsOraeIcaQPx?=
 =?iso-8859-1?Q?N2zMWkTB+vXxFplaXyS4pkTDe9c/wGK9Or85ogv7G0EJsM0CgkHbwbzd4d?=
 =?iso-8859-1?Q?0m0g6fJd9cmQb0xEVjqKh6Ds6S/tUd2P8ejyINPL8ogcl7yH/FbKI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cCYmsJI+BoinHdgq1iOySIXxk03Ng2zRYLt1J9BkZ7Y73NbM+2vYPdZJuA?=
 =?iso-8859-1?Q?PcCZJae2GkFoiBDER3C24goVMavWGpxVDbafaSwT1boc/zfe2s9YMI/yoi?=
 =?iso-8859-1?Q?6/AFuoR3woI7XdSfeFgaWEqbzHNr+w5Jq3Jb0BwxxMiLqUIJM1SORBmqWv?=
 =?iso-8859-1?Q?x3Ldw57i/YaGE953ScUMTWKs95tmEsO7+DqZyABiJXICg4mVOHrKvYB1be?=
 =?iso-8859-1?Q?OnTxIZ1jp4Nh5t2/ZihqeK9u4Fo6VTujGUAmBFuBUMLNn55q6Y/RS8OKgu?=
 =?iso-8859-1?Q?1/XBOq+xqwTeo5eEM/3vYOwJH5l9AO5BtGV4G+/TzmzgdeE7qdW+Sw8eTA?=
 =?iso-8859-1?Q?tMQpgfwaugfiZeWLEiCWnh742FQQGM/fuUvFhzwRp9umlOod4+BbcDIl7q?=
 =?iso-8859-1?Q?JPVcK1flq5XF1LJyatpLULha9vf/caG4tlq8rS/G8EK35+61mExNtAHvCq?=
 =?iso-8859-1?Q?w+gdAPqyacWKzj53QyTUV1zKUmITOmSYoulBEz7MgmBgBsheyNK/NUpcC1?=
 =?iso-8859-1?Q?Ni1OZ/BGF+Pi/AQfmQGFU7uEOdZi4VuSUxIEyn0nrI7hWoYvt+rOwnMlGC?=
 =?iso-8859-1?Q?a8A1NVCkQA1MHYpvc60jo0ng00I8b1iU/OUlRSyptGd/8I1TYueWVefRnv?=
 =?iso-8859-1?Q?q5paAnhb6JPmMzYzKkC2cvIdh6UwT3czfXvrC6sAjn4ZAunNn4caVOf3Mt?=
 =?iso-8859-1?Q?mKt5tSL2JC7CxsrVDBKZRw4aFyKWyNFnS5pTOg09p/UHs768JI0V7bueZM?=
 =?iso-8859-1?Q?rJqz2GeYMUwcnqE754V37OOtWRArAQB5gqGpoyNayfStSq+BEw/S+6k2nJ?=
 =?iso-8859-1?Q?LiXrTBcbfB605h0r01BMv2n7CpEa3nAm/JJMriPmFD7KMcThtfNXKD3F9M?=
 =?iso-8859-1?Q?JdfyJxLZgQ7X/SJEjaA8P3B7OmuaYuIA48DwpszcDSlXjw4rBZjR+x/mq0?=
 =?iso-8859-1?Q?CNE7cHds26Zt0oyLPByUTx91RC1WgjJLGltmrCUZOWvpYzbt/L7zGQhVA+?=
 =?iso-8859-1?Q?D/12OQ68lyXNcJl41NVxZlhe0pgvtuzdK78hoQDpbULIjL0VxnIeoBzCio?=
 =?iso-8859-1?Q?Ss4sMNoV8NsDDaup1YZdJg9fLbkG5QcYyKBxjS+6JF6kda5qIDgzKC4yqO?=
 =?iso-8859-1?Q?Uh7ua36ZkZte86Lh7PVTZeZMTUfceRueUWFAS/fizDbyyKHgm/4i8ivAcE?=
 =?iso-8859-1?Q?iJ/rjLdwkJbi8AxDZYFmMtVuj8Q5TGM1kRzIh8BZF+4VIwuoj7WTDU3Kwd?=
 =?iso-8859-1?Q?PAHmypgHds0CndKZcT10PWIaz4vMc57L5rSvQSxik7ehO/5MHbJ8iA0JCG?=
 =?iso-8859-1?Q?Hq5CyimCbe/DIRPkSVKT3cK0YXdLlLhLz71a0IWUQE8akF56C3o4jatu4+?=
 =?iso-8859-1?Q?4Ycd1j6TWRUaHZXN41i9P35b+/YOeF+pxRYXoVBWfXO7Rq9Lk7tRjvAk+P?=
 =?iso-8859-1?Q?iTOBG2BG8fryE4sctlSiEZOASkpVpwTNOBPpf5P+7DPqF5cCRuTSOii68Y?=
 =?iso-8859-1?Q?raZugnPIh1F8s5U6/0Cpr3Nk4IAAJHGNYvcQWkjOwk5UpAJCw7LRhoWYJ4?=
 =?iso-8859-1?Q?VAuu5CnlDa0X5HMRAI3nxuV+hT88bBtKdKViw5gf0qs7AfuzgjxkzNAw/T?=
 =?iso-8859-1?Q?+M2K0v2Ur6hANhetPcw0j2E4v8z2xKlaMnPFihn7bKBRB06TF2fFi3yDIL?=
 =?iso-8859-1?Q?SxiE3XxcmWmZOl6PrP0hQirtBwMJ+Qor8iKTzV0OOwJfbYp3/8FbT9M6zT?=
 =?iso-8859-1?Q?KJ9A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db279b70-a7f2-4d0b-b5ae-08dcf51f1b66
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 18:01:53.1754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6ZWD1BVeJZEzjRXeUFgD3S/VYKHeHY9KoSVNpd0L8u9iYR1Onsp3kl16fsfsagbUzfG7M1B4ELfplIkbarFsW6CKy12n8cyKu/fBe0qLHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1295

Hi=A0Laurent,=0A=
=0A=
Thanks for your suggestion.=0A=
=0A=
>> +static const struct mt9p031_model_info mt9p031_models[] =3D {=0A=
>> +=A0=A0=A0=A0 {.code =3D MEDIA_BUS_FMT_SGRBG12_1X12}, /* mt9p006=A0 */=
=0A=
>=0A=
>There should be spaces after { and before }=0A=
=0A=
okay.=0A=
=0A=
>> +=A0=A0=A0=A0 {.code =3D MEDIA_BUS_FMT_SGRBG12_1X12}, /* mt9p031=A0 */=
=0A=
>=0A=
>You can use the same entry for both the MT9P006 and MT9P031 as they=0A=
>don't need to be deferentiated.=0A=
=0A=
sure, will do =0A=
=0A=
>> +=A0=A0=A0=A0 {.code =3D MEDIA_BUS_FMT_Y12_1X12},=A0=A0=A0=A0 /* mt9p031=
m */=0A=
>> +};=0A=
>> +=0A=
=0A=
[...]=0A=
=0A=
>>=A0 static const struct i2c_device_id mt9p031_id[] =3D {=0A=
>> -=A0=A0=A0=A0 { "mt9p006", MEDIA_BUS_FMT_SGRBG12_1X12 },=0A=
>> -=A0=A0=A0=A0 { "mt9p031", MEDIA_BUS_FMT_SGRBG12_1X12 },=0A=
>> -=A0=A0=A0=A0 { "mt9p031m", MEDIA_BUS_FMT_Y12_1X12 },=0A=
>> +=A0=A0=A0=A0 { "mt9p006", 0 },=0A=
>> +=A0=A0=A0=A0 { "mt9p031", 1 },=0A=
>> +=A0=A0=A0=A0 { "mt9p031m", 2 },=0A=
>>=A0=A0=A0=A0=A0=A0 { /* sentinel */ }=0A=
>>=A0 };=0A=
>>=A0 MODULE_DEVICE_TABLE(i2c, mt9p031_id);=0A=
>=0A=
>I think we can drop mt9p031_id. I'll send a patch series to do so.=0A=
=0A=
okay =0A=
=0A=
>>=A0 static const struct of_device_id mt9p031_of_match[] =3D {=0A=
>> -=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p006", .data =3D (void *)MEDI=
A_BUS_FMT_SGRBG12_1X12 },=0A=
>> -=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p031", .data =3D (void *)MEDI=
A_BUS_FMT_SGRBG12_1X12 },=0A=
>> -=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p031m", .data =3D (void *)MED=
IA_BUS_FMT_Y12_1X12 },=0A=
>> +=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p006", .data =3D (void *)0 },=
=0A=
>> +=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p031", .data =3D (void *)1 },=
=0A=
>> +=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p031m", .data =3D (void *)2 }=
,=0A=
>=0A=
>Let's avoid magic values. You can write=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p006", .data =3D &mt9p031_=
models[0] },=0A=
>=A0=A0=A0=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p031", .data =3D &mt9p0=
31_models[0] },=0A=
>=A0=A0=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p031m", .data =3D &mt9p031=
_models[1] },=0A=
>=0A=
>but it may be even more readable to introduce a=0A=
>=0A=
>enum mt9p031_model {=0A=
>=A0=A0=A0=A0=A0=A0 MT9P031_MODEL_BAYER,=0A=
>=A0=A0=A0=A0=A0=A0=A0 MT9P031_MODEL_MONO,=0A=
>};=0A=
=0A=
makes sense.=0A=
=0A=
>static const struct mt9p031_model_info mt9p031_models[] =3D {=0A=
>=A0=A0=A0=A0=A0=A0 [MT9P031_MODEL_BAYER] =3D {=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .code =3D MEDIA_BUS_FMT_SGRB=
G12_1X12,=0A=
>=A0=A0=A0=A0=A0=A0=A0 },=0A=
>=A0=A0=A0=A0=A0=A0=A0 [MT9P031_MODEL_MONO] =3D {=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .code =3D MEDIA_BUS_FMT_Y12_=
1X12,=0A=
>=A0=A0=A0=A0=A0=A0=A0 },=0A=
>};=0A=
>=0A=
>static const struct of_device_id mt9p031_of_match[] =3D {=0A=
>=A0=A0=A0=A0=A0=A0=A0 {=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .compatible =3D "aptina,mt9p=
006",=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .data =3D &mt9p031_models[MT=
9P031_MODEL_BAYER],=0A=
>=A0=A0=A0=A0=A0=A0 }, {=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .compatible =3D "aptina,mt9p=
031",=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .data =3D &mt9p031_models[MT9P0=
31_MODEL_BAYER],=0A=
>=A0=A0=A0=A0=A0=A0=A0 }, {=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .compatible =3D "aptina,mt9p=
031m",=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .data =3D &mt9p031_models[ME=
DIA_BUS_FMT_Y12_1X12],=0A=
>=A0=A0=A0=A0=A0=A0=A0 },=0A=
>=A0=A0=A0=A0=A0=A0=A0 { /* sentinel */ }=0A=
>};=0A=
=0A=
I will update as per your suggestions and also drop mt9p031_id.=0A=
=0A=
Best Regards,=0A=
Tarang=

