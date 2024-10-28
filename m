Return-Path: <linux-media+bounces-20406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 778529B2BA2
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 10:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FAEE1C21DC5
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 09:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1843A192B75;
	Mon, 28 Oct 2024 09:36:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2111.outbound.protection.outlook.com [40.107.222.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5AF1917FD
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.222.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730108204; cv=fail; b=WMnKT0oCd7uqlZlGL/fNGgkhHAJL/khip6n2hvgKgr1N+jsNZ9LwVk3XU8g4BfZUH1hoHr0Y1m0DCC/2feIAj45cbVKmelSArdVC8adcn2fEhUamKB824BoUgKj4G7y0O9difzYNWICAAME4igQgFNFQY9jYqWn3rx41HJeay88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730108204; c=relaxed/simple;
	bh=BiJVGJ0MBTE/f8Kopf0IVPjeDdXN3ThOjIwln/rKY90=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tR7lCo0sQCaqXpM/uRLfnMTM++1xTrBeoVgILOV/8L+vYIvgQXo4gvYwDEeWBSwelqJzZlskLtgm1YaCP/Ur5xtYiwi8DgABQCkuHoBsQ3Tx9B1/MhaVJjXXo5rd2sliXAqewSOVKM9aAfOdmqpskA1qjVjjfsGJipLC0N0LlQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.222.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYgEc9t1HQ35drrRlrrG0FrndtBYPw2k+TIuZ4xGMHV/q2c33MFv9BUQAJkX6hYSZZBcM0unvCYaF3QLJpVPk8PElDXmDC9cuI9IU6CZIIZaVomgusEXUJSvcwbOSbyBNkRYwRM3HTlc9TPFtxOA3kNGjxywfISgZtsnqPL21CzuE/a3KYCk64g43BTldoV3y2oC/0UTC+kCZ7DR7dNKHKmKBZwYM4KJSFeYICpte03a/rmo6Kj50k7Pg3huic4mwnp1cnGm0mMsZBMAsAtGoq1QAeJAHnnaK5dp314PaE4iEk6hZUJSECIfTGdw9xvoLafSRWfbnGhMzC+F7zsoiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiJVGJ0MBTE/f8Kopf0IVPjeDdXN3ThOjIwln/rKY90=;
 b=uUJtfjAWJb1jpOycENJMhEvC9dXG4kJv05Fmi9CGbwDLVYORHaydKu8Zsii+49cF0W6KI4e6vGS8aeC8SFmytSRbSm0IslanlwjjVOHCf2txIBdMIeWc4BtBvfRuqhc7mVNIaZZWl31XDGCa8Y6LCq3KWlA5bbynThNZN9Uieikq9yIonwcHybRmt/UF0S3dBJL5PAof8N52bcZ1/NRsFhtAEE1RB4ER02oGox5w/RdITZ6ULBVuTACIK/l0NjWTRL+QfIbfs3AURmwRv9JLwsVryf2SjYNICl/YXbxXB5yxZx2qroh5qSTt0SHAv4bYieISkSljAWoeQAzS/niLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0955.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 09:36:38 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8093.014; Mon, 28 Oct 2024
 09:36:38 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 2/2] media: i2c: mt9p031: Drop I2C device ID table
Thread-Topic: [PATCH 2/2] media: i2c: mt9p031: Drop I2C device ID table
Thread-Index: AQHbJwohp8kfG1FnSEOpJdB+ljdo+rKb5YW8
Date: Mon, 28 Oct 2024 09:36:38 +0000
Message-ID:
 <PN3P287MB18291BCAB621F9DBDF6FA7A38B4A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20241025181708.20648-1-laurent.pinchart@ideasonboard.com>
 <20241025181708.20648-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20241025181708.20648-3-laurent.pinchart@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB0955:EE_
x-ms-office365-filtering-correlation-id: 72ad6bdc-175d-40ca-3d3f-08dcf734059e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?JfWvl6h6t74vs7PM3h4wFJhaxh0cTlVswoynpg3kkcGVMFAuLylTACoBY4?=
 =?iso-8859-1?Q?A6YFrj6FhfsM2AZFQQjQc0LKnxpFSy7Lkwu4shvXh2LWMVzfqqvVsBleDX?=
 =?iso-8859-1?Q?sLAVo879U2S5Oi+MtZEGV0ULoxMzNiBdgKTXifoU9k7+WWjl4gfwLA7d8f?=
 =?iso-8859-1?Q?D7WCjuogv9sG1kPyWxyvSTHJc1ViZ996zJB4VZkXSmMMFJcFxqutVtDKpc?=
 =?iso-8859-1?Q?maWLIFZHVxrAiUy7tHN1dTXmgylWZy7fk0NPfUUK3HeQacOmKU+Elf3wYu?=
 =?iso-8859-1?Q?XFV9j7WDouZd1iAdhAy0NGGj4CGvUCsE6NH7pMHxmdqiGFe/VZuSaX1J3i?=
 =?iso-8859-1?Q?mtifmiIid/nL493ABx+8WnVywhHUTadlz357lpc7rehRAn3SowyS1fNsdH?=
 =?iso-8859-1?Q?aZyyZcS0WBfPqe+XC05WdnLpTIUFmAP4kvveWSXxrD21c1mPuD43dQrzI6?=
 =?iso-8859-1?Q?P6kcCO5KBcKqqZnIqRRgsGLYx658m3Pi0cbbUFnEblIia8h5PLxPEVWuDQ?=
 =?iso-8859-1?Q?HjkWMpJ7VaDtK5JpBRCtzOf5mdDg5DzjKVOpupW2cKRAsu3nTn6N+1JWx3?=
 =?iso-8859-1?Q?bZnXj87b8ipEuFWtzKr78z5OMZ/nU6I+i/QtVdYm6lWcKa7V31j9+qNbdX?=
 =?iso-8859-1?Q?tRspcuBHxLILLA3Ygxkv8mHIV5FLrCaGTHiBeG09tV5GZfOyRH48njEQz5?=
 =?iso-8859-1?Q?QyoKtpoGQqD9kXguWtuc2N5dx+ByilX2SUGMwQATFFPG4rZDT30Kvp6BOz?=
 =?iso-8859-1?Q?wl85VVsDPNOEVJnWbjue9Fl8Wlo0/c2EA1yGJlAuWUXKeAro63xs7gvnUc?=
 =?iso-8859-1?Q?tBSwEm+xTgF+n40ESBG3GPogYZpcHaBmnCMPQm0po96eLHPpQ/1/9RzyER?=
 =?iso-8859-1?Q?fOVxkKCChLh6jrUSwNYOm7UYCfbuF4anQoBpeIzZSoE1+GTu0nKZRtWwt7?=
 =?iso-8859-1?Q?9K/9jUvJxse68ybRLy9HRI2gcp8mgoWL1onYn+e53KqrA0gK5MoZ/KRqTw?=
 =?iso-8859-1?Q?JNcnTPv9TEQBwo7yJYPNdd2GNaaaK1uCplwoIbb4YkByNHhR/2Gx3l4tal?=
 =?iso-8859-1?Q?HfTZqmf2RfkpGvpF7JIde/M9BjmI6Turvis0PrWz57z4IyQ+LA7oraNDNW?=
 =?iso-8859-1?Q?qQeyiBx2nfc4R6wIqQoW7baCv3YImflPRUGMkBX8OsnZ6T/3WrrHtQR6vL?=
 =?iso-8859-1?Q?0UxwvTxuBhlfpPlpk74eSR75lBne4e8hBA4Q7huQFehcQmnn44SzcOTcyB?=
 =?iso-8859-1?Q?c8q9L0HVSMr+MhKJO/O5v8YakXu9RNIJjKktXUb5moVFl62aJRlgoE7Z7a?=
 =?iso-8859-1?Q?4VyGphhXilj6YyR/oZrdoXucnw1v9Ujm9fNk4fq5iwaUhkuUpMG/DNCHS+?=
 =?iso-8859-1?Q?8C1SZZefqjABTFo5JUSZFmy81vljHkAm4zXYUJzs3dIA5C5v1Ll9o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BOsvjuQuLhZQay3GPBX1PvWuU5V2E3vfpZgGQizBQWwd0ywJ3MYA6WqP9z?=
 =?iso-8859-1?Q?k3Zb8QEsb2X58fafTXqESnFkz+RaLktnfLn+mpkbC8HaF+EpGO9cB4niCw?=
 =?iso-8859-1?Q?6/MycR/l94gP2EfETW0gHRxbMq/6/ijTToljvCrYwfuRkjBkicuhIzjo9a?=
 =?iso-8859-1?Q?HgMCIN7utF7ha8GCsbBKSj92fSSozjBnaEoOXqqT0La9Zc3mJNUP5t+qql?=
 =?iso-8859-1?Q?lE/yhY0UioWEL5E94m1qSzsQTOZA+H696m30P7Kw/7mNmYwWjmlQLli+T0?=
 =?iso-8859-1?Q?G6Ivnlv/QJk+WfTXplATnHypkA5W8L8NgRpa5egx/i1d1g4vZ79j8++TD4?=
 =?iso-8859-1?Q?7Pa5+0apXiwbEC2vwmCiOorNjotTu5EvCL22PKRE5t5cGWfahb4LRQfPf/?=
 =?iso-8859-1?Q?CaEfX0XdGfVoFrTThDCyK5jV1hH57tNOALqQ54PMRu/aoss3NNV6FPZZAP?=
 =?iso-8859-1?Q?lruIbQyH26KceR8oNCAs77Z8+d2nms/Jq4QI1LeDB4hisQlY2hZcoc/vcn?=
 =?iso-8859-1?Q?rcD3ECjBPfnqLfiL5GIlD55QHF0kXdNofC5elXypfCmCb6vVP2SooszsOl?=
 =?iso-8859-1?Q?nmTPJi6/W8iw5AYF2CgxefpcRe87QzDZB4kK/3RlsWKcsZdKr7OQJDm/Bb?=
 =?iso-8859-1?Q?A0yGFCDnhI8FhXdfwKVFo516kUmXWQe008hA17lMuQW19lKwbsqfZE4aBT?=
 =?iso-8859-1?Q?G05qjt07qJDEJgf0DmHr0cW70tcyt26BKql5qyaUGiMPrLS6Ki44e1Tbp2?=
 =?iso-8859-1?Q?TUi03oa9tlPhjM9Vc0atPE8oq1iCImEnlsvN6HKHFK/uH+B2LJI7AGCuGp?=
 =?iso-8859-1?Q?j7qP8LlMbqSj8ekNmMggjbHVdwT1/rqaxv1zWkSEjxmDW1NZflNR8oWuMU?=
 =?iso-8859-1?Q?d/sCYsGmpxycnus4ul8/8KyuogWY/2P/pyIQSPpXK1QJX5PUy7mxDAtbPz?=
 =?iso-8859-1?Q?qnCg6+Fs2C59f1xtR6F1xpWp6NCsYfKmJVk4/VsHl/hi6ue/oiuGdQlYLM?=
 =?iso-8859-1?Q?A8oVbX+f1RqulSo8ULzd78OB8Ty31Gb7SXRghe5x8hZCFJ6+ZHIoEaurqv?=
 =?iso-8859-1?Q?CsG6Z9ZUOzf7IlODY3LiHD1X1etWfGCxHphB7LiNzrIXk+vcHsWxSrgXBL?=
 =?iso-8859-1?Q?IpFt954h1BEAq/lwCF1nwJlMACC7HxS+c5bEuItzr4cTbeQdydQ4gveJhh?=
 =?iso-8859-1?Q?iuH8h/StwcZy5px2YIftxa2dPQdtHNc7zAfobhm6re3mbXAZ4eRC5eZpvk?=
 =?iso-8859-1?Q?gjEftco8hMggU6+3HAEG2tHyzwTleAhhluyCTxVHNgqGgtipIef3rk30B7?=
 =?iso-8859-1?Q?HIkGHts4PFn8uRoqKshWH7h+oHOOJXKIFplYUlkIoSnXv7S+fHJ0tEl0ie?=
 =?iso-8859-1?Q?QTk/IhX/+vM1nDooxoazC6b1kc4qg6iSlDt2693DpKO1L28J+GCeEOh1Gg?=
 =?iso-8859-1?Q?EQslavSYdpgMgkgSSxniEQzNcVc4vmkYqV3d/o/ZLLaR7kcj0m845N3B0N?=
 =?iso-8859-1?Q?XR8q5l6hsXvZQCUTEMB3YHhP7NcGHeiF1e7sZD6LhPNxZWZFqxDauByTdu?=
 =?iso-8859-1?Q?Q/LwjnA1pieYqsV63LYuzwXnQXrjqMXSSIZkO3fZiNeXFcYYOc30p4TxNx?=
 =?iso-8859-1?Q?+klRmlAMhS+XNfKGiSr3VtC8IZmuzsGHiAzXChpFwpi0zK2xRGmWdfxw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ad6bdc-175d-40ca-3d3f-08dcf734059e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 09:36:38.4005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sEVFKc4ciHyNEcwnShaBepviaGUkpaEJD5eZem5Y/QfM14meAb4M2eRLMJYfThTaF2Eh9PdCytp8m6NyLwWv6QP15q+pgSEB4sBZ7bO9bLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0955

Hi Laurent,=0A=
=0A=
>The mt9p031 driver doesn't support platform data anymore, and requires=0A=
>the I2C device to be instantiated through a method that supports device=0A=
>properties. As the driver lacks an ACPI device ID table, the device=0A=
>matching will always go through the OF device ID table, either for OF=0A=
>devices, or for ACPI devices using PRP0001. The I2C device ID table is=0A=
>therefore not needed. Drop it.=0A=
>=0A=
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
>drivers/media/i2c/mt9p031.c | 11 +----------=0A=
> 1 file changed, 1 insertion(+), 10 deletions(-)=0A=
>=0A=
>diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c=0A=
>index 70851f296142..f2f52f484044 100644=0A=
>--- a/drivers/media/i2c/mt9p031.c=0A=
>+++ b/drivers/media/i2c/mt9p031.c=0A=
>@@ -1112,7 +1112,7 @@ static int mt9p031_probe(struct i2c_client *client)=
=0A=
>=0A=
> =A0 =A0 =A0 =A0mt9p031->output_control =3D MT9P031_OUTPUT_CONTROL_DEF;=0A=
> =A0 =A0 =A0 =A0mt9p031->mode2 =3D MT9P031_READ_MODE_2_ROW_BLC;=0A=
>- =A0 =A0 =A0 mt9p031->code =3D (uintptr_t)i2c_get_match_data(client);=0A=
>+ =A0 =A0 =A0 mt9p031->code =3D (uintptr_t)device_get_match_data(&client->=
dev);=0A=
>=0A=
> =A0 =A0 =A0 =A0mt9p031->regulators[0].supply =3D "vdd";=0A=
> =A0 =A0 =A0 =A0mt9p031->regulators[1].supply =3D "vdd_io";=0A=
>@@ -1208,14 +1208,6 @@ static void mt9p031_remove(struct i2c_client *clien=
t)=0A=
> =A0 =A0 =A0 =A0mutex_destroy(&mt9p031->power_lock);=0A=
> }=0A=
>=0A=
>-static const struct i2c_device_id mt9p031_id[] =3D {=0A=
>- =A0 =A0 =A0 { "mt9p006", MEDIA_BUS_FMT_SGRBG12_1X12 },=0A=
>- =A0 =A0 =A0 { "mt9p031", MEDIA_BUS_FMT_SGRBG12_1X12 },=0A=
>- =A0 =A0 =A0 { "mt9p031m", MEDIA_BUS_FMT_Y12_1X12 },=0A=
>- =A0 =A0 =A0 { /* sentinel */ }=0A=
>-};=0A=
>-MODULE_DEVICE_TABLE(i2c, mt9p031_id);=0A=
>-=0A=
> static const struct of_device_id mt9p031_of_match[] =3D {=0A=
> =A0 =A0 =A0 =A0{ .compatible =3D "aptina,mt9p006", .data =3D (void *)MEDI=
A_BUS_FMT_SGRBG12_1X12 },=0A=
> =A0 =A0 =A0 =A0{ .compatible =3D "aptina,mt9p031", .data =3D (void *)MEDI=
A_BUS_FMT_SGRBG12_1X12 },=0A=
>@@ -1231,7 +1223,6 @@ static struct i2c_driver mt9p031_i2c_driver =3D {=0A=
> =A0 =A0 =A0 =A0},=0A=
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D mt9p031_probe,=0A=
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D mt9p031_remove,=0A=
>- =A0 =A0 =A0 .id_table =A0 =A0 =A0 =3D mt9p031_id,=0A=
> };=0A=
>=0A=
> module_i2c_driver(mt9p031_i2c_driver);=0A=
>--=0A=
>Regards,=0A=
>=0A=
>Laurent Pinchart=0A=
________________________________________=0A=
From:=A0Laurent=A0Pinchart <laurent.pinchart@ideasonboard.com>=0A=
Sent:=A0Friday, October 25, 2024 11:47 PM=0A=
To:=A0linux-media@vger.kernel.org <linux-media@vger.kernel.org>=0A=
Cc:=A0Sakari Ailus <sakari.ailus@iki.fi>; Tarang Raval <tarang.raval@silico=
nsignals.io>=0A=
Subject:=A0[PATCH 2/2] media: i2c: mt9p031: Drop I2C device ID table=0A=
=A0=0A=
CAUTION: This email originated from outside the organization. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.=0A=
=0A=
The mt9p031 driver doesn't support platform data anymore, and requires=0A=
the I2C device to be instantiated through a method that supports device=0A=
properties. As the driver lacks an ACPI device ID table, the device=0A=
matching will always go through the OF device ID table, either for OF=0A=
devices, or for ACPI devices using PRP0001. The I2C device ID table is=0A=
therefore not needed. Drop it.=0A=
=0A=
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>=0A=
---=0A=
=A0drivers/media/i2c/mt9p031.c | 11 +----------=0A=
=A01 file changed, 1 insertion(+), 10 deletions(-)=0A=
=0A=
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c=0A=
index 70851f296142..f2f52f484044 100644=0A=
--- a/drivers/media/i2c/mt9p031.c=0A=
+++ b/drivers/media/i2c/mt9p031.c=0A=
@@ -1112,7 +1112,7 @@ static int mt9p031_probe(struct i2c_client *client)=
=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0 mt9p031->output_control =3D MT9P031_OUTPUT_CONTROL_DE=
F;=0A=
=A0=A0=A0=A0=A0=A0=A0 mt9p031->mode2 =3D MT9P031_READ_MODE_2_ROW_BLC;=0A=
-=A0=A0=A0=A0=A0=A0 mt9p031->code =3D (uintptr_t)i2c_get_match_data(client)=
;=0A=
+=A0=A0=A0=A0=A0=A0 mt9p031->code =3D (uintptr_t)device_get_match_data(&cli=
ent->dev);=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0 mt9p031->regulators[0].supply =3D "vdd";=0A=
=A0=A0=A0=A0=A0=A0=A0 mt9p031->regulators[1].supply =3D "vdd_io";=0A=
@@ -1208,14 +1208,6 @@ static void mt9p031_remove(struct i2c_client *client=
)=0A=
=A0=A0=A0=A0=A0=A0=A0 mutex_destroy(&mt9p031->power_lock);=0A=
=A0}=0A=
=0A=
-static const struct i2c_device_id mt9p031_id[] =3D {=0A=
-=A0=A0=A0=A0=A0=A0 { "mt9p006", MEDIA_BUS_FMT_SGRBG12_1X12 },=0A=
-=A0=A0=A0=A0=A0=A0 { "mt9p031", MEDIA_BUS_FMT_SGRBG12_1X12 },=0A=
-=A0=A0=A0=A0=A0=A0 { "mt9p031m", MEDIA_BUS_FMT_Y12_1X12 },=0A=
-=A0=A0=A0=A0=A0=A0 { /* sentinel */ }=0A=
-};=0A=
-MODULE_DEVICE_TABLE(i2c, mt9p031_id);=0A=
-=0A=
=A0static const struct of_device_id mt9p031_of_match[] =3D {=0A=
=A0=A0=A0=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p006", .data =3D (void *=
)MEDIA_BUS_FMT_SGRBG12_1X12 },=0A=
=A0=A0=A0=A0=A0=A0=A0 { .compatible =3D "aptina,mt9p031", .data =3D (void *=
)MEDIA_BUS_FMT_SGRBG12_1X12 },=0A=
@@ -1231,7 +1223,6 @@ static struct i2c_driver mt9p031_i2c_driver =3D {=0A=
=A0=A0=A0=A0=A0=A0=A0 },=0A=
=A0=A0=A0=A0=A0=A0=A0 .probe=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D mt9p031_probe,=
=0A=
=A0=A0=A0=A0=A0=A0=A0 .remove=A0=A0=A0=A0=A0=A0=A0=A0 =3D mt9p031_remove,=
=0A=
-=A0=A0=A0=A0=A0=A0 .id_table=A0=A0=A0=A0=A0=A0 =3D mt9p031_id,=0A=
=A0};=0A=
=0A=
=A0module_i2c_driver(mt9p031_i2c_driver);=0A=
--=0A=
Regards,=0A=
=0A=
Laurent Pinchart=0A=

