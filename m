Return-Path: <linux-media+bounces-20405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA729B2B91
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 10:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B7511C21C44
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 09:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6E618FDA5;
	Mon, 28 Oct 2024 09:33:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2099.outbound.protection.outlook.com [40.107.222.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D55E762E0
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.222.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107983; cv=fail; b=XZ8Fsy3IxoxseLwQuRtLraawYPWtOtveSFvzcf94KNRDBAe/sncR7p+bXzKxKPzy2YS+TRJ3zPhTo0kVbHMMC/8DWNrWAd2JuWOBK3b0Vp6dWC7tbrFPZWGfWokTjKNW3nJSWPDpr7exI9dO9ygYbCL8da2/RJpwUb2npwQHBAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107983; c=relaxed/simple;
	bh=R5KfXhdZGqdmq1KcupeEAWkWphxNiFd+KEZ79WhwV2Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kav87Q3NSNgrFtdtPpAq//NSk888K3MZWYshTmHlthSRBks4Xn/6OHt07m2PySOYt7hJ5VbSHo8tc5OaIkpIt5/KVlimxlbZsINJf6NKJU7BArE428KOBHLtlHWwXBciBS115BnJCnW7wO1aqVhKd9wp8ER/RalpfRR0HvRqmrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.222.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKq7Pbx9dRXU8xGf359Bdfou/o67oomvhIZmmOnhHACaCcR4VK5ueNN2Dzu/RUPeh2V2MqgCTlQtgKTUEzMN2Ioubbst3Zh25l4qDNWVk+x0TnlP910zgttkRG2hxWzRnhjcvGGuwUsz7bPzm/77iCjQdzPssjNpTObPqRakoIfcWW2i84Gm3Z0XSQwDg1tzTyjWBoWUk5B5TNCM0nOvyzphpgAsrqQF7eNgxoCqcW1B9tPb1ruKsD7kg9h3gZSRX4VtTV95puz7L/gxOIbAqHEeAqLJgqP+KXFO++hPQoUQe1Z0tn07GwnzZ8R3yoGrgSU9QfBbAvsCiBYu79Ma4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dE2H2kBxcOMeUwwlGxGs799Qbf/31gRDUnu4VhsaZo=;
 b=miDOzm9FpDUZIg1yfIvVlFCRbmHxSR4Aj5MYq/d2pt1PhtJC9bVM2JG2JB8WvDdmqiK8ghH61BHSlG+oujO5BM+swo3DSNFBu1pqiPWuSC8fgzQDw2IGwlxut30I+GDX+kgS9n0ONwKUqj3kBOFszPSR7wbpLLnBDwpAzK+fB2kP+FtDgsYzdGpTgR97wha3zUwraAq44WZqddi3KWUHNpSFP/Jh4kdLewO6wYqECbV5+qHTrfxDPg3QWW6dGsrmfx2OsmDZaSWOpyXeWqJMnljIiuvdb9K+w1oam9+VPffbVqgRFEHtUYRHGN+WRAygyg9oujlrhkZbIOR4O2wFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB2116.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Mon, 28 Oct
 2024 09:32:54 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8093.014; Mon, 28 Oct 2024
 09:32:54 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 1/2] media: i2c: mt9p031: Drop support for legacy platform
 data
Thread-Topic: [PATCH 1/2] media: i2c: mt9p031: Drop support for legacy
 platform data
Thread-Index: AQHbJwohQbeyaYATFEy0TnAGbbmnxLKb5T0G
Date: Mon, 28 Oct 2024 09:32:54 +0000
Message-ID:
 <PN3P287MB1829688241E0342D2D50B96A8B4A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20241025181708.20648-1-laurent.pinchart@ideasonboard.com>
 <20241025181708.20648-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20241025181708.20648-2-laurent.pinchart@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB2116:EE_
x-ms-office365-filtering-correlation-id: 341d5ac2-bf9a-4543-204b-08dcf7338040
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Er3lW62rdm22bI0JEvXKnMuZU7R5pKqDvmc8WV3YaRAVyiYgcb+MzuX22a?=
 =?iso-8859-1?Q?b8HXVUG83bAekIL0j66j5LUw0quSR1i+pe78CghTJ9Gt1JzYB+MQSFmqNM?=
 =?iso-8859-1?Q?g8rGV/gIQnCtr6P0D7P3ZucCpP1ZflfaWs/z/h1F191wxwYMW50U98uP4O?=
 =?iso-8859-1?Q?A4QmNo6XnR+1w3p1sXr9l5491kiks736TQJfvbwHSgrhFqLlPSv8y8Up6T?=
 =?iso-8859-1?Q?A/0uJ0gSL5D2SrVvBrmgv1c58A4+cQ5BB1cHvsRpR5XUpp+0UWvHQA2exG?=
 =?iso-8859-1?Q?jqoLdbNuTOsL4Uqp40qYnVt/4IYCVeqbJyr+pWSKkdpIef8eTzLBfMWdcC?=
 =?iso-8859-1?Q?fBTvWJqxCMvPxIUtTl4PKmctTIxG8WEiDJQPAGadGPb/BiqgYSW1Nv1zUz?=
 =?iso-8859-1?Q?KjFizB47BD4eXKAsl2MEe9HFTLlc6ni2+IEzlaw7PYF/t2R6WDUSeSMGJ7?=
 =?iso-8859-1?Q?ylc2r51GF1gKGO2XES1JpIxxb+/cCSBDEu0XlXo0jJW2AU5ljnpjiJWqy3?=
 =?iso-8859-1?Q?2y5TiD+s0/2oZs53H3B/6Nr9JiXXXNP+Gj3cy6QQYsmTNlqbqKaXOxNPpf?=
 =?iso-8859-1?Q?rS857tEZpDsX/OoP158b2YCtaoWDLPIfk1maOkRTncJUAtmk8rmYXKxV4e?=
 =?iso-8859-1?Q?r3hH6uKB1bY6iIAWsphtzgdLhSE+09EQc+G+82cmYQOlsAM86YSCcRUzls?=
 =?iso-8859-1?Q?FabDzC+U0UScmO6R60ma/u4tBEPsO1jHJ6EdWEixLIRvCCgc4VWSAVREy/?=
 =?iso-8859-1?Q?G6oeVmnSQBBOAhxeeGmJRFsOp6OwtMEJ8KRaoSu7qojeOY7hbNtqzv+lIB?=
 =?iso-8859-1?Q?GzkXYFEkhbWplYGbtJApTlIAUZhwyX8owfi7Kt3oOt05u57RPfHX0p8UXt?=
 =?iso-8859-1?Q?lp9sy3ngivU4KuyfE6ieK/R3iO6d+JwWEU7/mZOpemiv7ZHQoaLLmSaHfZ?=
 =?iso-8859-1?Q?Z44Kyzu9eMc4/5Rm+ZREbBXLBAx+hgMCgIi2yVGuO3aAE63ACx0UKI1czb?=
 =?iso-8859-1?Q?cewTKuYO8nt+i98xrDk/Cv4oMAw2/77NW+3XPh8p2I518pGQVCruxreFXW?=
 =?iso-8859-1?Q?nGvC1qP05qMnBgeZKic408CJ6YoF5qpvk8643z/1CPq2R7HHe6GRA+g5KF?=
 =?iso-8859-1?Q?v822EtK7UDaNs43wyc8eFn0h3DzZctgaWUdD0fX7KWuECMfcDKUMlroLWQ?=
 =?iso-8859-1?Q?fi6iJHSw4HiTcCLRhoQwtsYcmB/NqqElCNiyCcvzKXfM8kr8DGWlalI/9x?=
 =?iso-8859-1?Q?8OHjqf2lD5wWQ4XboWQV5md2y7xunf/pu/VpI6QUGpyctdaz/GHPLaUqEQ?=
 =?iso-8859-1?Q?9cJ6CTSjADWW7XHkMZ+x4KgCln4Md35/B8Lzb1I+7kIwy+QbICHQKxUYco?=
 =?iso-8859-1?Q?N5px68Xf0gt9BMvK/PBkCvfeAkR+yeHHFVOPwf6M9yIdWPcXR2iy0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RinvzqkoSjXUE1pbXfUZPV1k2P4byFdIepgy82Rb72l2WLUG1H9C4I7DYl?=
 =?iso-8859-1?Q?EMpEYiKdmqvfdrASgQkNN3JApnUwXejos2lhGmfsgPy23S+StWd9l4ovKD?=
 =?iso-8859-1?Q?HthgZq7f0hKv98dwk8dhDyrkod7R4Rqk9C6JxgRR/s5ghjlj4R3X+EPFPK?=
 =?iso-8859-1?Q?daCwZCw4vGQlhZV7J0cY5G7PnzQwYpoQtPsAqYMC5xVA2Rtza2MwtON5ZF?=
 =?iso-8859-1?Q?utzoyMNUDgEqUs9G2s/9/3F2kYXLvTAY5AWb6R7Oa9lVtsE8iTIgH6QNbV?=
 =?iso-8859-1?Q?HMClJqv0RmQCjoAuRGBB24VJ8919dpeRCIq+LUC+tuA5L9/u0krz4R1FF9?=
 =?iso-8859-1?Q?v3B4IY/SLA75njDCkw4tnv8h/EpM8KRnQ5LbiVKmR0Y/gnkJ52BZhlOcel?=
 =?iso-8859-1?Q?mXsZS8YdzFYeN0UHLkAObpvKHAYuFBezqXO9QjedNqGJByJU18ZA7It4gc?=
 =?iso-8859-1?Q?EVWvPSEYIt7eTBkyOt6UIzsdt5i8Ma5kLeVYp9vUXAQOGekHnMPUnwTGSd?=
 =?iso-8859-1?Q?qG3pZfqz7qC3+x0ckkOEA9x6jzB2fZKDNxV7PtcNetg8Nz/Uy64THIzRFN?=
 =?iso-8859-1?Q?CRN3fcNrWF1+1TXe/tyNyYO7YKav/ZvZuCMaBwmj+vGNpNdXZwF7MTbkts?=
 =?iso-8859-1?Q?mRVrJZx3vuOnjfwwPd9azvVDwzn5V5ZJBsAWN6u9Fnyq8hXA/LK8sJvzJp?=
 =?iso-8859-1?Q?bfmxdPgRdGY4ZHFeHLEQtMYLPH9fDwQ9zjgQFtnOHnHSwA0LPl7UfgiyfP?=
 =?iso-8859-1?Q?jXAbeAGpLfLa16yobBx3iV3vNKROV0O95etTa1AMF9mGtukZ4fLpOPUwdX?=
 =?iso-8859-1?Q?2kl+SpqDYZpFSkIvmvAYl9tMwS2niKgO65q9uCGQh39LqHEoNJdhNGcJIT?=
 =?iso-8859-1?Q?MhRp5+vooFbbtYsKZ5+1Ejmz5rKg4VwwVQ04tWU9ZhKx7K3batcb4LT0cC?=
 =?iso-8859-1?Q?8RL2+LLdaI2BlFOOdWOTM6de6OdvxXA9NZ+QKFlH/u0e0ganfwJQCjPHB+?=
 =?iso-8859-1?Q?ZfZRzxK+zp3Vl4bUvq2u/QBsx54psGNqAjYUp4lirR9WacGHMwwjwI7tjM?=
 =?iso-8859-1?Q?rqNTzPgSFPqdGM9YgV8ayHQMayumC5ZQvqdsTvAg9nkdufUy/f7dhmm4e0?=
 =?iso-8859-1?Q?aHzyPBWTmfR7NARabx+3V7icnFNVKLl3KaToiZjY5eSdEMKwRCs3xuk8md?=
 =?iso-8859-1?Q?hHt3MJz2Cv+ZvZZgWtxT0FnerCKzTduWWxUtD4FeRzMYTjtt+A72wRYvQb?=
 =?iso-8859-1?Q?yHVElRGCkaNk1OJifcei0fc29RDs+knYtR206RFFJrgw0J54XLQ12PY8V5?=
 =?iso-8859-1?Q?tycje0i2P1MbHSEU1ihtkPx3rHmErXdYyksZ2tqSYAL+xPvykKhvI7XkD6?=
 =?iso-8859-1?Q?C8pyQIIMGXy0c35E01TnvieyrkAJvg+U6elIrqMXEifYkfbz2z2X2R3cyK?=
 =?iso-8859-1?Q?rCzeHOT8qJtQFGJAD683YBbJM2iob3R9zCGOmSj672PkF+x8rtL6lWiH4y?=
 =?iso-8859-1?Q?fsQBEoq6v2ik3cdwGDBcTG9W8mEz3vtOi1ZouD3I3JaGT09j9+4a5WJprj?=
 =?iso-8859-1?Q?NKc4dMgbrSnp4tpFSVHMpqXx5hTKb+rWd+/G+EptrZCcIlMBTFesph94sb?=
 =?iso-8859-1?Q?nUMOpUGekVKBFce9j0hvLG1Xzmju93lRSKjbMue1JwqubrlR+muQEXFg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 341d5ac2-bf9a-4543-204b-08dcf7338040
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 09:32:54.6439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQWH0tY2L7tbsGHiX162efkN1bW52JVkGEXpjbHUIVTrm6VGgCg7fZkEnBNa8ar6L8Xv/ksW40CX5Y9HJu8TYHHX1giErwiZ4KaHnOGWThM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB2116

Hi Laurent,=0A=
=0A=
There is only one  small comment from my side =0A=
=0A=
>diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>index 7a14891a8fa9..99bab0c359c0 100644=0A=
>--- a/MAINTAINERS=0A=
>+++ b/MAINTAINERS=0A=
>@@ -15839,7 +15839,6 @@ S:=A0=A0=A0=A0=A0 Maintained=0A=
>T:=A0=A0=A0=A0 git git://linuxtv.org/media_tree.git=0A=
>=A0F:=A0=A0=A0=A0 Documentation/devicetree/bindings/media/i2c/aptina,mt9p0=
31.yaml=0A=
>=A0F:=A0=A0=A0=A0 drivers/media/i2c/mt9p031.c=0A=
>-F:=A0=A0=A0=A0 include/media/i2c/mt9p031.h=0A=
=0A=
>MT9T112 APTINA CAMERA SENSOR=0A=
>=A0M:=A0=A0=A0=A0 Jacopo Mondi <jacopo@jmondi.org>=0A=
>diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c=0A=
>index d8735c246e52..70851f296142 100644=0A=
>--- a/drivers/media/i2c/mt9p031.c=0A=
>+++ b/drivers/media/i2c/mt9p031.c=0A=
>@@ -24,7 +24,6 @@=0A=
>=A0#include <linux/slab.h>=0A=
>=A0#include <linux/videodev2.h>=0A=
>=0A=
>-#include <media/i2c/mt9p031.h>=0A=
>=A0#include <media/v4l2-async.h>=0A=
>=A0#include <media/v4l2-ctrls.h>=0A=
>=A0#include <media/v4l2-device.h>=0A=
>@@ -118,13 +117,16 @@ struct mt9p031 {=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct media_pad pad;=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct v4l2_rect crop;=A0 /* Sensor window */=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct v4l2_mbus_framefmt format;=0A=
>-=A0=A0=A0=A0=A0=A0 struct mt9p031_platform_data *pdata;=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct mutex power_lock; /* lock to protect power_co=
unt */=0A=
>=A0=A0=A0=A0=A0=A0=A0 int power_count;=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct clk *clk;=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct regulator_bulk_data regulators[3];=0A=
>=0A=
>+=A0=A0=A0=A0=A0=A0 unsigned int pixclk_pol:1;=0A=
>+=A0=A0=A0=A0=A0=A0 int ext_freq;=0A=
>+=A0=A0=A0=A0=A0=A0 int target_freq;=0A=
>+=0A=
>=A0=A0=A0=A0=A0=A0=A0 u32 code;=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct aptina_pll pll;=0A=
>=A0=A0=A0=A0=A0=A0=A0 unsigned int clk_div;=0A=
>@@ -225,7 +227,6 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 };=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(&m=
t9p031->subdev);=0A=
>-=A0=A0=A0=A0=A0=A0 struct mt9p031_platform_data *pdata =3D mt9p031->pdata=
;=0A=
>=A0=A0=A0=A0=A0=A0=A0 unsigned long ext_freq;=0A=
>=A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
>=0A=
>@@ -233,7 +234,7 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(mt9p031->clk))=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(mt9p031->clk)=
;=0A=
>=0A=
>-=A0=A0=A0=A0=A0=A0 ret =3D clk_set_rate(mt9p031->clk, pdata->ext_freq);=
=0A=
>+=A0=A0=A0=A0=A0=A0 ret =3D clk_set_rate(mt9p031->clk, mt9p031->ext_freq);=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
>=0A=
>@@ -245,7 +246,7 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 if (ext_freq > limits.ext_clock_max) {=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned int div;=0A=
>=0A=
>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 div =3D DIV_ROUND_UP(ext_freq,=
 pdata->target_freq);=0A=
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 div =3D DIV_ROUND_UP(ext_freq,=
 mt9p031->target_freq);=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 div =3D roundup_pow_of_two(d=
iv) / 2;=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mt9p031->clk_div =3D min_t(u=
nsigned int, div, 64);=0A=
>@@ -255,7 +256,7 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)=
=0A=
>=A0=A0=A0=A0=A0=A0=A0 }=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0=A0 mt9p031->pll.ext_clock =3D ext_freq;=0A=
>-=A0=A0=A0=A0=A0=A0 mt9p031->pll.pix_clock =3D pdata->target_freq;=0A=
>+=A0=A0=A0=A0=A0=A0 mt9p031->pll.pix_clock =3D mt9p031->target_freq;=0A=
>=A0=A0=A0=A0=A0=A0=A0 mt9p031->use_pll =3D true;=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0=A0 return aptina_pll_calculate(&client->dev, &limits, &=
mt9p031->pll);=0A=
>@@ -376,7 +377,7 @@ static int __mt9p031_set_power(struct mt9p031 *mt9p031=
, bool on)=0A=
>=A0=A0=A0=A0=A0=A0=A0 }=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0=A0 /* Configure the pixel clock polarity */=0A=
>-=A0=A0=A0=A0=A0=A0 if (mt9p031->pdata && mt9p031->pdata->pixclk_pol) {=0A=
>+=A0=A0=A0=A0=A0=A0 if (mt9p031->pixclk_pol) {=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D mt9p031_write(client=
, MT9P031_PIXEL_CLOCK_CONTROL,=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 MT9P031_PIXEL_CLOCK_INVERT);=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
>@@ -1057,53 +1058,42 @@ static const struct v4l2_subdev_internal_ops mt9p0=
31_subdev_internal_ops =3D {=0A=
>=A0 * Driver initialization and probing=0A=
>=A0 */=0A=
>=0A=
>-static struct mt9p031_platform_data *=0A=
>-mt9p031_get_pdata(struct i2c_client *client)=0A=
>+static int mt9p031_parse_of(struct mt9p031 *mt9p031, struct device *dev)=
=0A=
>=A0{=0A=
>-=A0=A0=A0=A0=A0=A0 struct mt9p031_platform_data *pdata =3D NULL;=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct device_node *np;=0A=
>=A0=A0=A0=A0=A0=A0=A0 struct v4l2_fwnode_endpoint endpoint =3D {=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .bus_type =3D V4L2_MBUS_PARA=
LLEL=0A=
>=A0=A0=A0=A0=A0=A0=A0 };=0A=
>+=A0=A0=A0=A0=A0=A0 int ret;=0A=
>=0A=
>-=A0=A0=A0=A0=A0=A0 if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)=0A=
>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return client->dev.platform_da=
ta;=0A=
>+=A0=A0=A0=A0=A0=A0 if (!IS_ENABLED(CONFIG_OF) || !dev->of_node)=0A=
>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
=0A=
we are not using CONFIG_OF anymore,  so i think we can just drop it.=0A=
=0A=
if (!dev->of_node)=0A=
=0A=
>-	np =3D of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);=0A=
>+	np =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);=0A=
> 	if (!np)=0A=
>-		return NULL;=0A=
>+		return -EINVAL;=0A=
> =0A=
>-	if (v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint) < 0)=0A=
>-		goto done;=0A=
>-=0A=
>-	pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);=0A=
>-	if (!pdata)=0A=
>-		goto done;=0A=
>-=0A=
>-	of_property_read_u32(np, "input-clock-frequency", &pdata->ext_freq);=0A=
>-	of_property_read_u32(np, "pixel-clock-frequency", &pdata->target_freq);=
=0A=
>-=0A=
>-	pdata->pixclk_pol =3D !!(endpoint.bus.parallel.flags &=0A=
>-			       V4L2_MBUS_PCLK_SAMPLE_RISING);=0A=
>-=0A=
>-done:=0A=
>+	ret =3D v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint);=0A=
> 	of_node_put(np);=0A=
>-	return pdata;=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	of_property_read_u32(np, "input-clock-frequency", &mt9p031->ext_freq);=
=0A=
>+	of_property_read_u32(np, "pixel-clock-frequency", &mt9p031->target_freq)=
;=0A=
>+=0A=
>+	mt9p031->pixclk_pol =3D !!(endpoint.bus.parallel.flags &=0A=
>+				 V4L2_MBUS_PCLK_SAMPLE_RISING);=0A=
>+=0A=
>+	return 0;=0A=
> }=0A=
> =0A=
> static int mt9p031_probe(struct i2c_client *client)=0A=
> {=0A=
>-	struct mt9p031_platform_data *pdata =3D mt9p031_get_pdata(client);=0A=
> 	struct i2c_adapter *adapter =3D client->adapter;=0A=
> 	struct mt9p031 *mt9p031;=0A=
> 	unsigned int i;=0A=
> 	int ret;=0A=
> =0A=
>-	if (pdata =3D=3D NULL) {=0A=
>-		dev_err(&client->dev, "No platform data\n");=0A=
>-		return -EINVAL;=0A=
>-	}=0A=
>-=0A=
> 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {=0A=
> 		dev_warn(&client->dev,=0A=
> 			"I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");=0A=
>@@ -1114,7 +1104,12 @@ static int mt9p031_probe(struct i2c_client *client)=
=0A=
> 	if (mt9p031 =3D=3D NULL)=0A=
> 		return -ENOMEM;=0A=
> =0A=
>-	mt9p031->pdata =3D pdata;=0A=
>+	ret =3D mt9p031_parse_of(mt9p031, &client->dev);=0A=
>+	if (ret) {=0A=
>+		dev_err(&client->dev, "Failed to parse DT properties\n");=0A=
>+		return ret;=0A=
>+	}=0A=
>+=0A=
> 	mt9p031->output_control	=3D MT9P031_OUTPUT_CONTROL_DEF;=0A=
> 	mt9p031->mode2 =3D MT9P031_READ_MODE_2_ROW_BLC;=0A=
> 	mt9p031->code =3D (uintptr_t)i2c_get_match_data(client);=0A=
>@@ -1145,8 +1140,8 @@ static int mt9p031_probe(struct i2c_client *client)=
=0A=
> 	v4l2_ctrl_new_std(&mt9p031->ctrls, &mt9p031_ctrl_ops,=0A=
> 			  V4L2_CID_VFLIP, 0, 1, 1, 0);=0A=
> 	v4l2_ctrl_new_std(&mt9p031->ctrls, &mt9p031_ctrl_ops,=0A=
>-			  V4L2_CID_PIXEL_RATE, pdata->target_freq,=0A=
>-			  pdata->target_freq, 1, pdata->target_freq);=0A=
>+			  V4L2_CID_PIXEL_RATE, mt9p031->target_freq,=0A=
>+			  mt9p031->target_freq, 1, mt9p031->target_freq);=0A=
> 	v4l2_ctrl_new_std_menu_items(&mt9p031->ctrls, &mt9p031_ctrl_ops,=0A=
> 			  V4L2_CID_TEST_PATTERN,=0A=
> 			  ARRAY_SIZE(mt9p031_test_pattern_menu) - 1, 0,=0A=
>diff --git a/include/media/i2c/mt9p031.h b/include/media/i2c/mt9p031.h=0A=
>deleted file mode 100644=0A=
>index f933cd0be8e5..000000000000=0A=
>--- a/include/media/i2c/mt9p031.h=0A=
>+++ /dev/null=0A=
>@@ -1,18 +0,0 @@=0A=
>-/* SPDX-License-Identifier: GPL-2.0 */=0A=
>-#ifndef MT9P031_H=0A=
>-#define MT9P031_H=0A=
>-=0A=
>-struct v4l2_subdev;=0A=
>-=0A=
>-/*=0A=
>- * struct mt9p031_platform_data - MT9P031 platform data=0A=
>- * @ext_freq: Input clock frequency=0A=
>- * @target_freq: Pixel clock frequency=0A=
>- */=0A=
>-struct mt9p031_platform_data {=0A=
>-	unsigned int pixclk_pol:1;=0A=
>-	int ext_freq;=0A=
>-	int target_freq;=0A=
>-};=0A=
>-=0A=
>-#endif=0A=
>-- =0A=
=0A=
Otherwise LGTM=0A=
 =0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=0A=

