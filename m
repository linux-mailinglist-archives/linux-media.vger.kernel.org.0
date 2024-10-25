Return-Path: <linux-media+bounces-20347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F0E9B0D36
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 20:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1D271F215AE
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF97618BC0E;
	Fri, 25 Oct 2024 18:25:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2100.outbound.protection.outlook.com [40.107.222.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6991FB8A9
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 18:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.222.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729880758; cv=fail; b=KjE/VcBYofzcIPgeBAbFAu2o4C/R8WkQCCksszgT6GBCYRksi9BVq4yeVPRQSL47tiVIz2flcuG3bFzLDboR69i2AbNUCY9YJ78fuXhkQNSkmrzHleJCfqEpDiwhywjnZdO5ofmdQzWfhESDLe/IBKKpmB1eXhsVXH+LO39w0VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729880758; c=relaxed/simple;
	bh=5zyXQSGV9gXDVSbnoUsjnWn8NKB0BtawMQznFhLO+z8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gc9kdWl+pbfPYTiU0zUvm1Bn9liwnzxN7FkEsk7TEGTiOGycGJa0ibV4TGapGF46TN2oZKzxTg/UhuX9sX7WD9G9hZM9xPXYhHe3mVh5U87hw4SzobuxsjfCZJO6Y9k/dO/YDt7xbsaWkWzoljLSDdgjW2CCSMDKWNaBr57X+b4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.222.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8f04YyQtcN93799i8qLrC4YYUsJfGmdhMCH4P52c3e7mKXolz/c2YC0HecIWq/9tclK3V3UL0vI+Y8UG1npjFwWjvjB/vM1Ogs1UmnJt2Xr9jeKPeQhLJNgueTKAeRnx3kCpX7z5Q6Wqt3VaMEE8Wx4th92qDoYUAoY2BDaeNtAYdNkToEJ917wNFqt7kqU5CtDh6U1JsZ1FWx2AxPg3PhebuLIvdT34nLld6kGCravSZ8nqxByudzA+1qwr7A24Oh4dJWM7SaLG5/QQphcuZ9v2FNiZzXTbvEhN/YewdFbVReaR4LzD2ZSBeg6uUMXeMk/RStNSwaZ+kFvOoDhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zyXQSGV9gXDVSbnoUsjnWn8NKB0BtawMQznFhLO+z8=;
 b=JCkz0voFRgjYGFAnHb2lihHNHicjHKeamKyp0yfJ5oEMnhbHaELSEdWqEJfGth01fZbA68I0MMK02W3yTaDqwZLInDbOuC4TYH7cjG8xQS6F7vvJkO9bEo6YnWyNfr8LOlSVQ5Estb/Dq+0cOOMawkTod+QONd5eyeJVo9L4o7jngWtDDwrlh50UNnJUhPavP28kyZ++bF3sZQtM1TjGpYQXslazlIMjkYEcdj3n4V+UUwicCKF0quqdQwpTaSggnRXeVl0c0eXArtNw+PAZGcnUp7k00A2dSeayi8UtxQPMPcTfesT0UxmouDIrxIlD+hgCnSDi+Ahl2Hpo/nnOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0318.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 18:25:52 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 18:25:52 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 0/2] media: mt9p031: Drop legacy platform data
Thread-Topic: [PATCH 0/2] media: mt9p031: Drop legacy platform data
Thread-Index: AQHbJwogcr7T1nDUxEi+ZLHUNoD547KXx3YZ
Date: Fri, 25 Oct 2024 18:25:52 +0000
Message-ID:
 <PN3P287MB1829DE1C2367DA3034D3B3E08B4F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20241025181708.20648-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20241025181708.20648-1-laurent.pinchart@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB0318:EE_
x-ms-office365-filtering-correlation-id: 2f3e196b-8f59-435d-3b1b-08dcf5227580
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AA0Hqb8iu8muG5lmWq02SuwQIyj88Ng+vhKcJ4jhiT/dklE7L4MnK1+d0S?=
 =?iso-8859-1?Q?DQTcwx2nE+QBB3ew1EBfABJn6QcXsaPxF/Lfnv/JG3K+hc6Y6PkyjCc4bO?=
 =?iso-8859-1?Q?fktzTYpSUZQh+2zA/HbVjT72Woxdsvx0ssR71WcPCAtvfG41jAME0taKuA?=
 =?iso-8859-1?Q?EcWBQkmq4a2peuqIODudrcAPhQhnzytwde8QPke6ZGdEgFTOIHUi1ji/e+?=
 =?iso-8859-1?Q?oRFUb40CdFTG6RHEJQ2jFU0gkbiYXpdy1PrwxNl8+ssqZh+1LghIeD+t7F?=
 =?iso-8859-1?Q?E/B+1vWMddlLQzl4z05vwmG0+MjNogIkVlDytN8QfOheMhUaqKHvLpzoyB?=
 =?iso-8859-1?Q?VIycLvIcK4LYOqU2RjCni506lDonfRT0OkvoHGzTGXnSTJzhgTnBp301m9?=
 =?iso-8859-1?Q?7prLtxaIjRxPZGvWrOH7E+pt8R7Ns+Z6MfL37zQLlBTJHnPXclhWf/hL3N?=
 =?iso-8859-1?Q?bIeg8l3+rhd/sRvGk7bAetYk9zDewzAkXUDS6OwdOV+jpKxSaQLyx6G3cb?=
 =?iso-8859-1?Q?/n3W7Ei2f5uU1rkyAfQK/i3loLPU34rI3L/aucSCA7i8eFpeaNfEUK9P9o?=
 =?iso-8859-1?Q?ZYje9Jf89YRY646QPkxdBC+RySSGH68+WbYS2KBhrS/J1Ov3photL85UOm?=
 =?iso-8859-1?Q?G0zMD8ck8GiJTO7czjy4pxks0irldpwJYrJc0OfsI3RZt7tL8mWrqXrOSG?=
 =?iso-8859-1?Q?2abcnxKj9+HeqRrlgJvFLCbmLlFJTy9RTn0bHrRvpDVnil8ep/4GSSBGFh?=
 =?iso-8859-1?Q?k5xA9WCjsdVc0BH8m4kd2QJZ0OGOkdJdmsjby+aRvlrl4/LmSJ1FZzn6lY?=
 =?iso-8859-1?Q?fVYqnw9t2Wt9Inti+il3qBV7JePhJCaIyrfQ1pw2wvlBmVCOqybNSGdWp/?=
 =?iso-8859-1?Q?fSk8WTFozlW7i9KoLkXs8c8M9cMqDlftU3K9pz9eGYKid3an5zEIBaWIeb?=
 =?iso-8859-1?Q?MOW+QUQOJoKMOyz38S+2klNqrT3CzktU8Ekg59KXsmbX0dvKZZ3B2TTPMe?=
 =?iso-8859-1?Q?uD223Z2fVvYcTc5/YqheOwCjqMkrqsDVvqmV2WyNvhjXBjDw1PVD0dVG0M?=
 =?iso-8859-1?Q?6VzOn3NrT06gv4e1bTrCdcK+/Y8eKByvhH8wk2EwthpLmHUt6zNz4Yy8AC?=
 =?iso-8859-1?Q?r0UleIs8S0ALMdc1EtwZkj0RC6BILHTDAAwJXjW3lz8QBqobA5vGbj8mfP?=
 =?iso-8859-1?Q?F1wD223qOfOEj/BAaXTpDgO52Tf3mEkQ8NDCmfL6i6Shk3cjeT+7PP46uF?=
 =?iso-8859-1?Q?9zR3rpgkTvJ1O8pJYHZxJ2P/Nxb8CrsjdCZBuHfQ7JxgDthV/23n3+JT1m?=
 =?iso-8859-1?Q?LLQfV6Nx3/xVE1YmXJ1/rs0WXiI1b5pJe9pFENsd8tFFZHLfHgvILjzu1V?=
 =?iso-8859-1?Q?GvTHxK8FmYdtKyjfSF/oSEcBFxMBs/EsXIL1ywV44LiaPnsG0Gwg8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zihMEikW03KqV/Bncg1GQi7sqFr17ro3RJWqXgPKzRN6heJ7Z0rKHaNUrw?=
 =?iso-8859-1?Q?EVi4oM+i9SSL4fCjPIfzfL9VSyLGC6mz81PfumVXmKYRTU8FPgiZ0/Qgsp?=
 =?iso-8859-1?Q?gUbL0ziZIqTgi4rPfYfBPn6WpJUfrvubqOh6Bf82kB/Zowxm8tqyFtO/Lz?=
 =?iso-8859-1?Q?FGyMnpP6No0qHgZdNy7nnxhs5ujDfg9ByXDy6ZikIFeD5DL044w+LW4LhU?=
 =?iso-8859-1?Q?5Z9er6vQT4ag7bnvViz7tbaOc3Tukaia/iUpV1aaT4PXsNSPsT9jm4qS+T?=
 =?iso-8859-1?Q?4Vvmj13mxLsVCd823uyTXTWmBQrnriC+C6TY4wNuCPAE7IRwAgwY2h+xSB?=
 =?iso-8859-1?Q?UKdgrqDBUd+zEQCC1EujrJSKY9eHhLk4sOm69MtisjFcDQ8qklsCOLeLc3?=
 =?iso-8859-1?Q?fLieFM7iwdND80wEK8atlhzVjXrZfpK0Z5Hae77HYLexuVjlTA3oKNDPjX?=
 =?iso-8859-1?Q?v2SoV9Elc/K4HkCkavZ1IV/HhpDwM1w956XmDJf3wWzvGSngDbeLTR41V8?=
 =?iso-8859-1?Q?yabt31Jjbk343X3reyy440QDO83btdaKX0FfpK6Ufzzk8WcE85m5FpTmoi?=
 =?iso-8859-1?Q?/bNtpyZG1zNPg4flQwGjjQ1G4KtN2XRNIns6S1qrMmJfmLuW26PflIZjzz?=
 =?iso-8859-1?Q?a6mC348bFzWttitLl2CGprQqIQCbUAe3uWxOzYE//pqnvZv3d+JNvHun/Y?=
 =?iso-8859-1?Q?yfKBA7fsaZEEf8HO87uVIKUoqqpnJ2HnDbOVrlTj4vqf+U3rBlXkoMayln?=
 =?iso-8859-1?Q?h8mcQI9i6umoMTjZqxx1TJ7bBi9gNGemJrkyo8FFrhzA9j2bGySQymQwOp?=
 =?iso-8859-1?Q?Bc+CYK2DGfHBvb9/b82aiMzGe0LuMamj3fC+w3r8uoamT7Wnb0YBcPktOf?=
 =?iso-8859-1?Q?dikHUcoRHPx8OJgWULozqdBBU+RFyF6ZjrrtPt+s7wZivPoFxhfdVpMckZ?=
 =?iso-8859-1?Q?LE6McDD3GdomHjBaA5c/KgtIFtem05/BAAkcQHlJ199RK3msMuQaSViIao?=
 =?iso-8859-1?Q?mOuJ6+VP1Z7JqKe6MUWbjU0lLKBVVzaqm+2v6aaEED6XZa1trAoGVl5Lsz?=
 =?iso-8859-1?Q?UXrv/K6z9d44Ne2iREW75Qvu1+qAc8QBJtftqNkjUcb4LpcDrjntsJH0e3?=
 =?iso-8859-1?Q?PpQJlvX9ZrCCOvQoWLm1DBi02xZoJU+UYC/NurTDSy98y22yppahjrwphU?=
 =?iso-8859-1?Q?zZk4Ngb0/m0dHW8RhjfgvlJLCmQdUf7FHzIgXh1qIHvOJGKc/dVJLCVTqt?=
 =?iso-8859-1?Q?0yZBMhfQ/IZFWYDBd0QkNmIMbriBbJ881mYUWepTOWIMXSJltMBPxp/yLM?=
 =?iso-8859-1?Q?OPIndajYnITgP0+0dAzUXZyyoZug55+hqUUJnp3vKeZzo1yQQOIX7vr0Jv?=
 =?iso-8859-1?Q?CY6BOFYpXZZXo8akhzGZIZjfaaQr8ec8Z9OImkIxtVecblXch8DVoFR5/V?=
 =?iso-8859-1?Q?9oSpVr0ikYv8MD/gds565i3qwtTvKMayz8wBDC+Y/mwhBY9w2OHCH8qrPe?=
 =?iso-8859-1?Q?3rR2wRATcxpIu9FUU66ufgXOHUH2kZrjAQrKx/Yj4DWyymhCMstZYz9GHh?=
 =?iso-8859-1?Q?kVOAwru4lSGCs+28nph+/M6MMTrn4QJbsUwqVfXGzBjScA+ybbLt8sL8ff?=
 =?iso-8859-1?Q?+7R6Lfmj9Ei7ABfdwn790q40dB5ST5gv2XKUyNGutf9W1StM/5FJNFdBmS?=
 =?iso-8859-1?Q?ZYzhIAXmIbO8JHK8LP9IYmT7LtyPmHuIGBGj7HzjPtWsmC4r//4/rG8F1K?=
 =?iso-8859-1?Q?CAyg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3e196b-8f59-435d-3b1b-08dcf5227580
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 18:25:52.8586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: osupnOpa+X/+ayTAfnrnaNID0QeA8+sPEHDQd8+wqlTMWsdTvGoi3P7oU3bOMAtluVAl2gyXO04JtIsp00BJYGZNFaNfbOhtjbXqHYW6/7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0318

Hi Laurent,=0A=
=0A=
>Tarang, you can base your next version of "[PATCH] media: mt9p031:=0A=
>Refactor format handling for different sensor models" on top of this=0A=
>series, it should simplify your patch a bit.=0A=
=0A=
Sure, i will =0A=
=0A=
Thanks,=0A=
Tarang =0A=
________________________________________=0A=
From:=A0Laurent Pinchart <laurent.pinchart@ideasonboard.com>=0A=
Sent:=A0Friday, October 25, 2024 11:47 PM=0A=
To:=A0linux-media@vger.kernel.org <linux-media@vger.kernel.org>=0A=
Cc:=A0Sakari Ailus <sakari.ailus@iki.fi>; Tarang Raval <tarang.raval@silico=
nsignals.io>=0A=
Subject:=A0[PATCH 0/2] media: mt9p031: Drop legacy platform data=0A=
=A0=0A=
CAUTION: This email originated from outside the organization. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.=0A=
=0A=
Hello,=0A=
=0A=
This small series drops support for legacy platform data from the mt9p031=
=0A=
driver. Patch 1/2 removes support for platform data as it has not been=0A=
used for a long time, and patch 2/2 follows by dropping the then=0A=
unneeded I2C device ID table.=0A=
=0A=
Tarang, you can base your next version of "[PATCH] media: mt9p031:=0A=
Refactor format handling for different sensor models" on top of this=0A=
series, it should simplify your patch a bit.=0A=
=0A=
Laurent Pinchart (2):=0A=
=A0 media: i2c: mt9p031: Drop support for legacy platform data=0A=
=A0 media: i2c: mt9p031: Drop I2C device ID table=0A=
=0A=
=A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 -=0A=
=A0drivers/media/i2c/mt9p031.c | 82 +++++++++++++++----------------------=
=0A=
=A0include/media/i2c/mt9p031.h | 18 --------=0A=
=A03 files changed, 34 insertions(+), 67 deletions(-)=0A=
=A0delete mode 100644 include/media/i2c/mt9p031.h=0A=
=0A=
=0A=
base-commit: c9ec6f1736363b2b2bb4e266997389740f628441=0A=
--=0A=
Regards,=0A=
=0A=
Laurent Pinchart=0A=

