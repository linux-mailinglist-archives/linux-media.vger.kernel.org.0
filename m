Return-Path: <linux-media+bounces-37055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6729AAFC390
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 09:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91F4217DA90
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 07:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F130C223DEE;
	Tue,  8 Jul 2025 07:05:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020123.outbound.protection.outlook.com [52.101.227.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD9421CA0E;
	Tue,  8 Jul 2025 07:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751958300; cv=fail; b=UEKOS3TmHm6xOZGk5TMj0OoDNtZMMjtDx/Vdfsu67CXlVJQ+ACuI9Vwgn/JGzZv8K6P7DizcXkZ+aDjsQ+jP8JxZTtE6I7mK6sDwurWAHnQrCJxSb/QfY4aeB2ERQFiNWN/FSD8ueppQxxHX2EF3l6DMZ7FPg9o1WPulYrjRbQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751958300; c=relaxed/simple;
	bh=8fXVUfZchvafJOjZij8dJo8HIEaZepTuFBBfNM2Rz6k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ri0BigDAVaYNFLn1/bZ3Udaag8NVZZTqNP517zG+GbJ4KXwWuW+FPzEqgTaRk8pjsyqvcnFUqR42LtmrY3alfThlKsq7JSz4GBt0WP9rZiEPQ6W6UBylTLJq5mHGcz4dkA3oUB2Nepuhy+5SphAJExV+siIXwNktFU52mzdufAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgCE4AaPJch8qer8+2b6rrMk7JH462WQ5FnUS2X5AeHQKWs3tqjl5qYIcOzMMoAwAlqLz4nonCuaO6PGG2Z4VTjJFe7fnBiIES6ZGjo3D0J6JT10NqWpX5WffOnEn/VRsYo6PGNulmNbWEuOFv3ACszRAjhGcATPhoMOU7t+fTPQOEHbdtuSpGsUVOqkVz81tOH2Aye43wCSnZByhCJ7jxS/ENe3afbqxVEWf3hfs8X6SqX+HnrPK5q5XJ1+MgViXK00aaUPlOZ/dYgRZ4d/5Z8ZtIYwja0N9CRlKG83F6hhi+5f7UuXB875gvjjflSVJhQRSwL8G9JD0ueKeoUiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/OgWZ5/3rruObzl6+yYmNj+Q29a9v5QcxExnuJcoa4=;
 b=ZXwT0FgnFFWEWklBkdRCctXHUWljmyi11Hpha1kI1w2LENVLBL4pwu/oGhBVqJFjR4I/ZTcd74JX2HPfWO2N+7eE2FE4OLQrsXf4wnpF+qJbMudfvCOwI6h/LVW92HNwmKCVopnXmmxzccjYINOJO0eK6tqgu6weAoIsoYurzYC1Py5uzf+OyC96GbbvDb4p9A4GcnPs3CzoaGnSsRZ/t/i5TEZl6T0IG1XyWt4h2WGWuY5EtcwjehL/UhUvZMjmGica8FGdaAVVS+4tfJbPKASONNh3RiFkp1kleqVyiQkyyr79r6aGh2VoD1cbwJs0mt5ZcbrY+RGn3Hjwoc10og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN1P287MB3792.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:252::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 07:04:48 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 07:04:48 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, =?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede
	<hansg@kernel.org>, Tarang Raval <tarang.raval@siliconsignals.io>, Jingjing
 Xiong <jingjing.xiong@intel.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Matthias Fend <matthias.fend@emfend.at>, Arnd
 Bergmann <arnd@arndb.de>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHb71BCpFEs1f53xUOr7zOmanN4vLQnHS0AgACvTxE=
Date: Tue, 8 Jul 2025 07:04:48 +0000
Message-ID:
 <PN3P287MB351968C7B57C3C97D799D1E1FF4EA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250707150118.20536-1-hardevsinh.palaniya@siliconsignals.io>
 <20250707150118.20536-3-hardevsinh.palaniya@siliconsignals.io>
 <aGwuRP42mtFZmLT8@smile.fi.intel.com>
In-Reply-To: <aGwuRP42mtFZmLT8@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN1P287MB3792:EE_
x-ms-office365-filtering-correlation-id: 884a08c8-4e3f-4e8b-0519-08ddbdedba55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4p7IDqgT2P9LY+m0bA9fI4Axi90iEbGwtYmpjqsvw6JaZan00ZJ7qUU0tN?=
 =?iso-8859-1?Q?A75tITbWc1R0GnK7gH368bU7Xxvwoxq/+B957DzsSNVc0pI9CiJYsUo78/?=
 =?iso-8859-1?Q?f5daghmXyIyPYa4Aecl+Z2wb0DMOruAz5slnDh0dVa6H1z4tNQHXQ9dACG?=
 =?iso-8859-1?Q?eTX2cRMoRUvt3DfgyuQe0Ysa7B2R8z/vKJnphfGZ8bTnT3d3VTLOStgsS5?=
 =?iso-8859-1?Q?3ADKPrhgkBcqB2DWhg74A+cJ6FC8nPt17DSy6kflZ2q0gCEG/z1hzwEz+r?=
 =?iso-8859-1?Q?V2Yed3nSc5VIce3exRvF9PgRjNE3Kv45bD9IU5UTTI7YAShAjMjArrPDPm?=
 =?iso-8859-1?Q?gIzZRiOAtt3+3iHpynJXViidqRvQtITIwrGAq2lsUEzdlzBKRDP8s4xJ4e?=
 =?iso-8859-1?Q?8r65RYNjkjzHi9M+F+Vo1+F9Mj9akWrwASfARHdCSIvlBLzTXVoRlr6YEt?=
 =?iso-8859-1?Q?5h990rLR5o8xAMZiKilmh2IzvWgshXfBqw+l8TU9cEUmxd5if+uZlpY0/C?=
 =?iso-8859-1?Q?9RMrZC8Fb6mTl1LJKYiOrD+dOppg3os15+joawk3tf+Ya6T6eITSZo8q2J?=
 =?iso-8859-1?Q?rrSQSRxdublJxlBez1xMflxKlMb8N0LacaT/86xoSmtfhMDEJJQDog4aGE?=
 =?iso-8859-1?Q?rK8FfKoXeYPRiqAikXJvPDDiOkmonTgTCEEaKgIau50qKJd8pwLFMXkgDC?=
 =?iso-8859-1?Q?OsnoqamQN1nm063Dft9jImkP390oX4jnFjevauFAxl6UoPIJeo8SkPIK21?=
 =?iso-8859-1?Q?BNsfsVjO++zi5oxQWVG0tWf+VnAgsUb0ihvmC9qoPEKCr5mPPzuBJjzg2G?=
 =?iso-8859-1?Q?r8BVwwlTuTiEF6wPIDnJ9ysFul7u4PW5VHmA/bUwzwy+gC/jCDQkxRbabV?=
 =?iso-8859-1?Q?MAKu/SD9v1ZGqMFM03Uw3fBByP+lXdpPbaxbRTcLtc7J7xffd3VC18BxcI?=
 =?iso-8859-1?Q?auWO1mBS/8lPDHSjwCf8FwetJKn8vKLYhlhsELTNL9ur2vUG2jsk95VoxX?=
 =?iso-8859-1?Q?dlE8GP3xAijf3AJ368h896vIoCcB2etAXHruZMtz+OTPZFekAfe6Rixk9o?=
 =?iso-8859-1?Q?421ZZzrQxvwxVQANyLN0RhL2hS7XgIsjQMdhfcFzl4TT0YKW143UWNn4+D?=
 =?iso-8859-1?Q?E0xTdcanygHIRLYSztknxisgi1Jyx6Q52lQlkeYWFqQ+UBaJW1UetHsGu8?=
 =?iso-8859-1?Q?tMss/EHagakBrmGewXRdkrs8Qe1Tb8fb2r2Cj2XVCK7N0nu9t+1c3zlp5t?=
 =?iso-8859-1?Q?rtle5OWT59x85JL6jcuwPdrLJUnfZbRXi3f6q48JOidgaw6kf63Gp5026e?=
 =?iso-8859-1?Q?uzLLQ3z8werMOAXntEbDELJ4fma8MnPUD2mKsewrFcxzyISPNiTlrcaMuQ?=
 =?iso-8859-1?Q?kn+F87pBTInQ8uYNwPQt9agFWxJPNi1Vtn8SJOx4R0S9BtjDH4uq/+cDN9?=
 =?iso-8859-1?Q?jBu+CTtWDB3j22kCLQLK4ajhkeXDSkC99COgWE1bh1DamOkgh6HVbQvjoz?=
 =?iso-8859-1?Q?i0ejDt1zERsYwr7psO+/vDLZ+jjIcK8lXTYgiIRg6gkw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yzcjZAtfhTcwlG9IJerbo660BcORsz5XEOnp8QqlUCIZwZHErelhPqi8Ok?=
 =?iso-8859-1?Q?K1DRyqMuCTbnM4CH8ES7J3M40dSfaivwtMO2LQM5gGdImNqGZlDdKgl8rk?=
 =?iso-8859-1?Q?odvkAbQtQL/QIMbjBriiKiRqzfme+5HhJ6per+c5kBIXmuWrQIdwa9GKvy?=
 =?iso-8859-1?Q?SewGKvl+DXFvz6DZ7eICzJK5ankQwMmohKpMrBBxS/mp9HYj/NTCFNmLy7?=
 =?iso-8859-1?Q?rmf3+kOIPKTKYTqfuhHzLzJgm6/0LBvZ3N0vndkQfc16N3jGm3qWXb7Yh/?=
 =?iso-8859-1?Q?Y6M0DzUDuO0yfLaqJ7ccx2aLCUA0NrTKGIXJFEZ4aPcmlvy5Ui6sCDl9VL?=
 =?iso-8859-1?Q?pVsrcmYOcxRHx+yJ0d4zpBi6E/qMxhsrTOtSTa58PPdGHkMkvhSOv/OeLV?=
 =?iso-8859-1?Q?WTslVFxQXK8lWPDWSSBhgaMsvD/81W2HClyGj1lQUWhHHsTZUBVrhNFXay?=
 =?iso-8859-1?Q?g6WVHDC+5+opx1rcXWq0472SpPCE8W/XHt39R3ObE0vEBQV/GlK9jd6Fqg?=
 =?iso-8859-1?Q?9nVEavGfsz09FMSuaHNtgq1QCLVvAPvKOMZowRp9ijWrIplbq5VuCPJzdr?=
 =?iso-8859-1?Q?sgiEC6Dn8lWD+cRXbfPMkmzeh65MbWWnnwfqZF/TOHT8KTy2zCdDYp/JfZ?=
 =?iso-8859-1?Q?o3j8sHqCzJK0kH432alNtncAOks6sfIaBjCVuC12gaj4c9FdkMlHSabTuv?=
 =?iso-8859-1?Q?CpkX/WLMb6BA5JUI2hxRnh9ghmXLy8TdLLrE/hsQYMyYSh3NQ/CPNTWbfv?=
 =?iso-8859-1?Q?kDlHdo9hoNscY+c0V4t2R++3EdJ+MJgYxWsc1lvC7HJ07IiQRZetBo2imy?=
 =?iso-8859-1?Q?y70muHTbp/15nWRoyuzbeWbDz0JmWAu1x6t7ryGBi/EH96krxzdmtnvDMu?=
 =?iso-8859-1?Q?lLv0lv9+oOfoITZ7jesdAOIobQM7q3Hznm3nTAZ1IqwXrhGOu2rPyvIjjl?=
 =?iso-8859-1?Q?36Tgmn/e1UShqruWSDD8mZCJU6nX4ziHU19bEQnSxl7cQl1Ml5Lief3mTX?=
 =?iso-8859-1?Q?5ND9hrISjuM4gJ2JdvltfJumgb0Y39ej4Bp8QxO7vPmhZ55wzkotE7saA9?=
 =?iso-8859-1?Q?Pf2whhouGW4KiddmvdBegUkIEttN4hA0ahDajpC4Fr9oOd1d6XilFs5hOC?=
 =?iso-8859-1?Q?v7U2Xodk+XEFDcq2P+aRgfHgqIP0bWbAT4L3laZ7lGBnx3S6RnKr8JyL8N?=
 =?iso-8859-1?Q?W1Au7I7U8o/qA/zojZcrC50C1fJE/SPk93EK7ViIBDwyBvFRY3b5LnSW3V?=
 =?iso-8859-1?Q?yHdIvk9KIxq2KC+dgCmvgFspG4OFk05EB2EczG8oo/jtxVfV9brumdXFME?=
 =?iso-8859-1?Q?svgEThh849DjqptmJVGKZPL6DyFRj/cRtIW72mBPAPbYfOJKGLV1piTNTk?=
 =?iso-8859-1?Q?goBsLRIeclJopSCHjLZBNkPBj0VakuBJpQwDhYWycaljqoVi2WsZrDuiRO?=
 =?iso-8859-1?Q?JOzmAp7gr12mI7AWfCeESj2ufdrtld6fhLApkJKrPiuGJGxXssaJjJn5IQ?=
 =?iso-8859-1?Q?DWOLUCxQXG+An8Y0ee3JEG/a1ngiNRUar+eQ4RrfZrIU8UamI+rIzeH6Cu?=
 =?iso-8859-1?Q?QK1wnIhH6uHdz0nLdyaM5WJ2I5jWsmOCLaX5U7MUS7jnbBGfSUY0IUwMMA?=
 =?iso-8859-1?Q?MDeOd5xha58ghvHMxNQB/6ch7GHvJ92bYsc0X/vuHpLsaEWCKx/cHCgQ?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 884a08c8-4e3f-4e8b-0519-08ddbdedba55
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 07:04:48.7252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PUCKATStWqX/8gCwKiHm4kMrNDc1z2MEgV46aU8FKk/fWwK5Z/9sn3MHw6tvOV6sqXIbQbKFGn1JmgNF+H/f/RgjJwR3nASY+orBYbbgjBkSlf3KJ8vxFVN/l9F/YdFQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3792

Hi Andy,=0A=
=0A=
Thanks for the review.=0A=
=0A=
I have corrected the code, and all of your comments have now been addressed=
.=0A=
=0A=
However, I have a question about one of the comments. Please see below. =0A=
=0A=
> On Mon, Jul 07, 2025 at 08:31:06PM +0530, Hardevsinh Palaniya wrote:=0A=
> > Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.=0A=
> >=0A=
> > The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an=0A=
> > active array size of 1920 x 1080.=0A=
> >=0A=
> > - Manual exposure an gain control support=0A=
> > - vblank/hblank control support=0A=
> > - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)=0A=
> =0A=
> ...=0A=
> =0A=
> > +#include <linux/clk.h>=0A=
> > +#include <linux/delay.h>=0A=
> > +#include <linux/i2c.h>=0A=
> > +#include <linux/module.h>=0A=
> > +#include <linux/pm_runtime.h>=0A=
> > +#include <linux/regulator/consumer.h>=0A=
> > +#include <linux/units.h>=0A=
> =0A=
> More stuff is in use than just these headers provide.=0A=
> E.g.,=0A=
> =0A=
> + array_size.h=0A=
> + container_of.h=0A=
> + gpio/consumer.h=0A=
> + types.h=0A=
> =0A=
> And so on... Also in some cases the forward declarations are enough to ha=
ve.=0A=
> =0A=
> .,,=0A=
> =0A=
> > +#define OV2735_LINK_FREQ_420MHZ                      420000000=0A=
> =0A=
> HZ_PER_MHZ ?=0A=
> =0A=
> ...=0A=
> =0A=
> > +#define OV2735_PIXEL_RATE                    168000000=0A=
> =0A=
> What's the unit?=0A=
> =0A=
> ...=0A=
> =0A=
> > +static const s64 link_freq_menu_items[] =3D {=0A=
> > +     OV2735_LINK_FREQ_420MHZ=0A=
> =0A=
> Keep the trailing comma like you have done in other cases.=0A=
> =0A=
> > +};=0A=
> =0A=
> ...=0A=
> =0A=
> > +static int ov2735_enable_test_pattern(struct ov2735 *ov2735, u32 patte=
rn)=0A=
> > +{=0A=
> > +     int ret;=0A=
> > +     u64 val;=0A=
> > +=0A=
> > +     ret =3D cci_read(ov2735->cci, OV2735_REG_TEST_PATTERN, &val, NULL=
);=0A=
> > +     if (ret)=0A=
> > +             return ret;=0A=
> > +=0A=
> > +     switch (pattern) {=0A=
> > +     case 0:=0A=
> > +             val &=3D ~OV2735_TEST_PATTERN_ENABLE;=0A=
> > +             break;=0A=
> > +     case 1:=0A=
> > +             val |=3D OV2735_TEST_PATTERN_ENABLE;=0A=
> > +             break;=0A=
> > +     }=0A=
> =0A=
> > +     ret =3D cci_write(ov2735->cci, OV2735_REG_TEST_PATTERN, val, NULL=
);=0A=
> > +     if (ret)=0A=
> > +             return ret;=0A=
> > +=0A=
> > +     return 0;=0A=
> =0A=
> Is this the required style? Because these 5 LoCs is just a simple=0A=
> =0A=
>         return cci_write(ov2735->cci, OV2735_REG_TEST_PATTERN, val, NULL)=
;=0A=
> =0A=
> > +}=0A=
> =0A=
> ...=0A=
> =0A=
> > +static int ov2735_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> > +{=0A=
> > +     struct ov2735 *ov2735 =3D container_of(ctrl->handler, struct ov27=
35,=0A=
> > +                                          handler);=0A=
> > +     const struct ov2735_mode *mode;=0A=
> > +     struct v4l2_mbus_framefmt *fmt;=0A=
> > +     struct v4l2_subdev_state *state;=0A=
> =0A=
> > +     int vts;=0A=
> =0A=
> Can be negative?=0A=
> =0A=
> > +     int ret =3D 0;=0A=
> =0A=
> How is this assignment useful?=0A=
> =0A=
> > +     state =3D v4l2_subdev_get_locked_active_state(&ov2735->sd);=0A=
> > +     fmt =3D v4l2_subdev_state_get_format(state, 0);=0A=
> > +=0A=
> > +     mode =3D v4l2_find_nearest_size(supported_modes,=0A=
> > +                                   ARRAY_SIZE(supported_modes),=0A=
> > +                                   width, height,=0A=
> > +                                   fmt->width, fmt->height);=0A=
> > +=0A=
> > +     if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> > +             /* Honour the VBLANK limits when setting exposure. */=0A=
> > +             s64 max =3D mode->height + ctrl->val - 4;=0A=
> > +=0A=
> > +             ret =3D __v4l2_ctrl_modify_range(ov2735->exposure,=0A=
> > +                                            ov2735->exposure->minimum,=
 max,=0A=
> > +                                      ov2735->exposure->step,=0A=
> > +                                      ov2735->exposure->default_value)=
;=0A=
> > +             if (ret)=0A=
> > +                     return ret;=0A=
> > +     }=0A=
> > +=0A=
> > +     /*=0A=
> > +      * Applying V4L2 control value only happens=0A=
> > +      * when power is up for streaming=0A=
> =0A=
> Multi-line comments shouldn't neglect punctuation.=0A=
> =0A=
> > +      */=0A=
> > +     if (pm_runtime_get_if_in_use(ov2735->dev) =3D=3D 0)=0A=
> > +             return 0;=0A=
> > +=0A=
> > +     ret =3D cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL=
);=0A=
> > +=0A=
> > +     switch (ctrl->id) {=0A=
> > +     case V4L2_CID_EXPOSURE:=0A=
> > +             ret |=3D cci_write(ov2735->cci, OV2735_REG_LONG_EXPOSURE,=
 ctrl->val, NULL);=0A=
> > +             break;=0A=
> > +     case V4L2_CID_ANALOGUE_GAIN:=0A=
> > +             ret |=3D cci_write(ov2735->cci, OV2735_REG_ANALOG_GAIN, c=
trl->val, NULL);=0A=
> > +             break;=0A=
> > +     case V4L2_CID_HBLANK:=0A=
> > +             ret |=3D cci_write(ov2735->cci, OV2735_REG_HBLANK, ctrl->=
val, NULL);=0A=
> > +             break;=0A=
> > +     case V4L2_CID_VBLANK:=0A=
> > +             vts =3D ctrl->val + mode->height;=0A=
> > +             ret |=3D cci_write(ov2735->cci, OV2735_REG_FRAME_EXP_SEPE=
RATE_EN,=0A=
> > +                              OV2735_FRAME_EXP_SEPERATE_EN, NULL);=0A=
> > +             ret |=3D cci_write(ov2735->cci, OV2735_REG_FRAME_LENGTH, =
vts, NULL);=0A=
> > +             break;=0A=
> > +     case V4L2_CID_TEST_PATTERN:=0A=
> > +             ret =3D ov2735_enable_test_pattern(ov2735, ctrl->val);=0A=
> > +             break;=0A=
> > +     default:=0A=
> > +             dev_err(ov2735->dev, "ctrl(id:0x%x, val:0x%x) is not hand=
led\n",=0A=
> > +                     ctrl->id, ctrl->val);=0A=
> > +             break;=0A=
> > +     }=0A=
> > +     ret |=3D cci_write(ov2735->cci, OV2735_REG_FRAME_SYNC, 0x01, NULL=
);=0A=
> > +=0A=
> > +     pm_runtime_put(ov2735->dev);=0A=
> > +=0A=
> > +     return ret;=0A=
> > +}=0A=
> =0A=
> ...=0A=
> =0A=
> > +static int ov2735_init_controls(struct ov2735 *ov2735)=0A=
> > +{=0A=
> > +     struct v4l2_ctrl_handler *ctrl_hdlr;=0A=
> > +     struct v4l2_fwnode_device_properties props;=0A=
> > +     const struct ov2735_mode *mode =3D &supported_modes[0];=0A=
> > +     u64 hblank_def, vblank_def, exp_max;=0A=
> > +     int ret;=0A=
> > +=0A=
> > +     ctrl_hdlr =3D &ov2735->handler;=0A=
> > +     ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 7);=0A=
> > +     if (ret)=0A=
> > +             return ret;=0A=
> > +=0A=
> > +     ov2735->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_=
ops, V4L2_CID_PIXEL_RATE,=0A=
> > +                                            0, OV2735_PIXEL_RATE, 1, O=
V2735_PIXEL_RATE);=0A=
> =0A=
> Besides it's too long, it has trailing space.=0A=
> =0A=
> > +=0A=
> > +     ov2735->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2735_c=
trl_ops,=0A=
> > +                                                V4L2_CID_LINK_FREQ,=0A=
> > +                                                0, 0, link_freq_menu_i=
tems);=0A=
> > +     if (ov2735->link_freq)=0A=
> > +             ov2735->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=
=0A=
> > +=0A=
> > +     hblank_def =3D  mode->hts_def - mode->width;=0A=
> > +     ov2735->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,=
 V4L2_CID_HBLANK,=0A=
> > +                                        hblank_def, hblank_def, 1, hbl=
ank_def);=0A=
> > +=0A=
> > +     vblank_def =3D mode->vts_def - mode->height;=0A=
> > +     ov2735->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,=
=0A=
> > +                                        V4L2_CID_VBLANK, vblank_def,=
=0A=
> > +                             OV2735_VTS_MAX - mode->height,=0A=
> > +                             1, vblank_def);=0A=
> =0A=
> It's weird indentation.=0A=
> =0A=
> > +=0A=
> > +     exp_max =3D mode->vts_def - 4;=0A=
> > +     ov2735->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_op=
s,=0A=
> > +                                          V4L2_CID_EXPOSURE, OV2735_EX=
POSURE_MIN,=0A=
> > +                             exp_max, OV2735_EXPOSURE_STEP, mode->exp_=
def);=0A=
> > +=0A=
> > +     ov2735->gain =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,=
=0A=
> > +                                      V4L2_CID_ANALOGUE_GAIN, ANALOG_G=
AIN_MIN,=0A=
> > +                             ANALOG_GAIN_MAX, ANALOG_GAIN_STEP,=0A=
> > +                             ANALOG_GAIN_DEFAULT);=0A=
> =0A=
> Ditto.=0A=
> =0A=
> > +     ov2735->test_pattern =3D v4l2_ctrl_new_std_menu_items(ctrl_hdlr,=
=0A=
> > +                                                         &ov2735_ctrl_=
ops, V4L2_CID_TEST_PATTERN,=0A=
> > +                     ARRAY_SIZE(ov2735_test_pattern_menu) - 1,=0A=
> > +                     0, 0, ov2735_test_pattern_menu);=0A=
> =0A=
> Ditto.=0A=
> =0A=
> > +     if (ctrl_hdlr->error) {=0A=
> > +             ret =3D ctrl_hdlr->error;=0A=
> > +             dev_err(ov2735->dev, "control init failed (%d)\n", ret);=
=0A=
> > +             goto error;=0A=
> > +     }=0A=
> > +=0A=
> > +     ret =3D v4l2_fwnode_device_parse(ov2735->dev, &props);=0A=
> > +     if (ret)=0A=
> > +             goto error;=0A=
> > +=0A=
> > +     ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2735_ctrl_o=
ps,=0A=
> > +                                           &props);=0A=
> > +     if (ret)=0A=
> > +             goto error;=0A=
> > +=0A=
> > +     ov2735->sd.ctrl_handler =3D ctrl_hdlr;=0A=
> > +=0A=
> > +     return 0;=0A=
> > +error:=0A=
> =0A=
> Usual way of naming labels is to explain what is going to  happen when go=
to.=0A=
> Moreover it's even inconsistent, the below code use err prefix, but bette=
r=0A=
> naming.=0A=
> =0A=
> Here the=0A=
> =0A=
> err_handler_free:=0A=
> =0A=
> for example is better.=0A=
> =0A=
> > +     v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
> > +=0A=
> > +     return ret;=0A=
> > +}=0A=
> =0A=
> ...=0A=
> =0A=
> > +static int ov2735_enable_streams(struct v4l2_subdev *sd,=0A=
> > +                              struct v4l2_subdev_state *state, u32 pad=
,=0A=
> > +                             u64 streams_mask)=0A=
> =0A=
> Indentation issue.=0A=
> =0A=
> > +{=0A=
> > +     struct ov2735 *ov2735 =3D to_ov2735(sd);=0A=
> > +     const struct ov2735_mode *mode;=0A=
> > +     const struct ov2735_reglist *reg_list;=0A=
> > +     const struct v4l2_mbus_framefmt *fmt;=0A=
> > +     int ret =3D 0;=0A=
> =0A=
> Needless assignment.=0A=
> =0A=
> > +     fmt =3D v4l2_subdev_state_get_format(state, 0);=0A=
> > +     mode =3D v4l2_find_nearest_size(supported_modes,=0A=
> > +                                   ARRAY_SIZE(supported_modes),=0A=
> > +                                   width, height,=0A=
> > +                                   fmt->width, fmt->height);=0A=
> > +=0A=
> > +     ret =3D pm_runtime_resume_and_get(ov2735->dev);=0A=
> > +     if (ret < 0)=0A=
> > +             return ret;=0A=
> > +=0A=
> > +     reg_list =3D &mode->reg_list;=0A=
> > +     ret =3D cci_multi_reg_write(ov2735->cci, reg_list->regvals, reg_l=
ist->num_regs, NULL);=0A=
> > +     if (ret) {=0A=
> > +             dev_err(ov2735->dev, "%s failed to send mfg header\n", __=
func__);=0A=
> > +             goto err_rpm_put;=0A=
> > +     }=0A=
> > +=0A=
> > +     /* Apply customized values from user */=0A=
> > +     ret =3D  __v4l2_ctrl_handler_setup(ov2735->sd.ctrl_handler);=0A=
> > +     if (ret)=0A=
> > +             goto err_rpm_put;=0A=
> > +=0A=
> > +     /* set stream on register */=0A=
> > +     ret =3D cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL=
);=0A=
> > +     ret |=3D cci_write(ov2735->cci, OV2735_REG_STREAM_CTRL, OV2735_ST=
REAM_ON, NULL);=0A=
> > +     if (ret)=0A=
> > +             goto err_rpm_put;=0A=
> > +=0A=
> > +     return 0;=0A=
> > +=0A=
> > +err_rpm_put:=0A=
> > +     pm_runtime_put(ov2735->dev);=0A=
> > +     return ret;=0A=
> > +}=0A=
> =0A=
> ...=0A=
> =0A=
> > +static int ov2735_disable_streams(struct v4l2_subdev *sd,=0A=
> > +                               struct v4l2_subdev_state *state, u32 pa=
d,=0A=
> > +                               u64 streams_mask)=0A=
> > +{=0A=
> > +     struct ov2735 *ov2735 =3D to_ov2735(sd);=0A=
> > +     int ret =3D 0;=0A=
> > +=0A=
> > +     /* set stream off register */=0A=
> > +     ret =3D cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL=
);=0A=
> > +     ret |=3D cci_write(ov2735->cci, OV2735_REG_STREAM_CTRL, OV2735_ST=
REAM_OFF, NULL);=0A=
> =0A=
> Why not using the ret parameter? Same for other similar cases above and b=
eyond.=0A=
=0A=
I am not sure what you want to suggest here.=0A=
=0A=
Do I need to check ret like this?=0A=
=0A=
ret =3D cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL);=0A=
if (ret) {=0A=
    // error message=0A=
}=0A=
=0A=
ret =3D cci_write(ov2735->cci, OV2735_REG_STREAM_CTRL, OV2735_STREAM_OFF, N=
ULL);=0A=
if (ret) {=0A=
    // error message=0A=
}=0A=
=0A=
Best Regards,=0A=
Hardev=

