Return-Path: <linux-media+bounces-38611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D3B14852
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 08:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C94263B5B2C
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 06:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E652A25A33F;
	Tue, 29 Jul 2025 06:35:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021089.outbound.protection.outlook.com [40.107.51.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910A2204C0C;
	Tue, 29 Jul 2025 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753770929; cv=fail; b=qY6+C86ME7bfjkKoFnVXsimcWHgOzN799IRqrbQyasxk41BkJGPqVUvnbGtHounTIeKOsDjoWG3bG5xK162ft7CY7JrZsKCrZ6Rhm8VnilWyBwC8Th2hCVe4hHOq5s0iLn1RKDUS0a2ZOW5qSGd8WXJNil278zCvgBXZxFJiXMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753770929; c=relaxed/simple;
	bh=2dyWw86dNm14IWZcs2WQQsXhjaC92z9B8M9jEkTnjBc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q0uhbIJfISnkhncMs03uPInA1o18Clw3M5QYjIEvpQdwJ7WRbNXwiakQu5PzfyQ4ZEPxqh+4BKYB0khMxePS2d4GESvya/+spBFGJnI4HTSquBRtetwj/R5OTmQI9/jrRzMZDXPsskDSduHX9qzI1RzC4j1tbedgbv8AsUUC0dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQvokzMEIfqhbJ+QfuHlpajleRovpI3rtf9FcH4VoXivjXIvjJhHnNFVAWqLrKGUN+V+I7Sq6aDc1zY7z2BrUSAsVjog28j2/tuzImDtM/cyDUuEcbyMPZhb0SlBzpKQ5BZEAYDtnTek12Z+AY3sA+xyH5JmmD4WKJQ8GnVRNgux7xq9oR3owwg7FJcwqGXv9o50Mrftw1O3v5yxzbgbT5DUwbCGpVzzuisQXBl0nFNoz8hmRfSaYBg0v7mfMkjA7qKxt8GZ9KSp4oKKPzKuWUlOb+yY6aHaDVGaFQ+WKO4TbcqKuH1NuFtdrkxR8jAEeJFiiwiZmXCT7F6TAvfDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dyWw86dNm14IWZcs2WQQsXhjaC92z9B8M9jEkTnjBc=;
 b=LVCc+B9LiQXdOE+tIKjgHimyDMQ5Ct+9WKYVgFs+clUP616nfmZrhBaUJmepoo/omSu0Il5Odjpxz+ZYaqaaC9RPX9phZ97gSP5+HoNy8kAvrAzUzTkhOLjqAKJTHjo74i+KyBAg8h933zmv3lDO6+8syn91gHq66cs1ESaMoTLcCCdKgdER/cprSJlnod8yVDKa1vUwmMbSk7C6an7fy3WEReMZ3dCYoCxeUH52VXO/SGfwwuooSms06WGA68G+sFbrToMBKfizmn/7GlEEX/RLTKhr8ID6+hSbzL5WahKa/V5gc6wfUXFuBil52mIwj0sjqeIpSD8vEoUkg/lhGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN0P287MB1508.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 06:35:22 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8989.010; Tue, 29 Jul 2025
 06:35:22 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede <hansg@kernel.org>,
	=?Windows-1252?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Matthias Fend <matthias.fend@emfend.at>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH v5 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHb/Ih6djfjLciEYkK3gvcBpDSgELRBx44AgACQNVCABlTHug==
Date: Tue, 29 Jul 2025 06:35:22 +0000
Message-ID:
 <PN3P287MB3519F7CC80D5B7B89853F95AFF25A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250724104711.18764-1-hardevsinh.palaniya@siliconsignals.io>
 <20250724104711.18764-3-hardevsinh.palaniya@siliconsignals.io>
 <aIKi1BkNzNvsf5Tr@smile.fi.intel.com>
 <PN3P287MB35190A4AEE4C8D98142E7B6AFF59A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
In-Reply-To:
 <PN3P287MB35190A4AEE4C8D98142E7B6AFF59A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN0P287MB1508:EE_
x-ms-office365-filtering-correlation-id: eba69b23-b78d-48b3-8462-08ddce6a1866
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?D+jlIKLQSIT+szw/yQ6yNrK1uKGZixLmkMgwbDGnMOscrIMCA1l7hd87?=
 =?Windows-1252?Q?DWRik9wYgApHoF7wdEm+bhZDsR7jj8YagAO8aSWpjsIg2g7ueD4MJKQ3?=
 =?Windows-1252?Q?9d8i9UIUcE3/N1JkAUbsp1EJ0xkzK3FDVCdWqC+DAvHf0sg2nqn4hxkc?=
 =?Windows-1252?Q?pwRIlIDkTizd5QLGf0RmnT0X4wJJg9dn5jccibVF3gd4ll/t7gZXAfew?=
 =?Windows-1252?Q?M0Mo94xDv9OdYwodgqW8FH87VbsoyR5jZ1L3zwBozl8OSBKU8/opDw+h?=
 =?Windows-1252?Q?FcXLVEJ1W+3I+rYtvLS/HvoIMrIRJuU8FFjSLFxvvNyjC9zzi+f9f+mr?=
 =?Windows-1252?Q?ORQJS2B2E51N4KrXSU5u1cVrK7jbNUYOuJmL4wYVnknMt2bSWnJ4D2Te?=
 =?Windows-1252?Q?C+su48IujYP11troHZ+nHxG7B1Ko2d7Rw7wiVVLnhGV2f1N1e6YOcP68?=
 =?Windows-1252?Q?kgjhe2vYy5yQh1JTXy7YPkNIGIVGUPpKFpqZr3U/R/X9Uucu00RYZ4WL?=
 =?Windows-1252?Q?faMtJwqyvPl1Rp47KIewoKhT19BK9P6HebjXEPhQCg3LxbkncNZnDZru?=
 =?Windows-1252?Q?B36TlDi1Ypx4/wz7s2URjvtZ3hChuEc+aEKgO4jQxpkFOtcUo0dCDwX7?=
 =?Windows-1252?Q?MVw6aV69XAo0pelDIfOLhY7PH3lqkreu1dcsTSJlqvNds2fBJlfnoyrP?=
 =?Windows-1252?Q?pwJghF/vS8cPdzy7GlqBCZ5dT2zLhUF827nJALhi6TUNAzkx87hIbvML?=
 =?Windows-1252?Q?SOKz9+776fa0YzOyv/OZajgqHe0MlvXE0UaZiIBoTyFH3EISFoA0Jazi?=
 =?Windows-1252?Q?eDQcb3xgMzV2x7WkokaSyPKsYJz0BMiE0Wx4Idw8BEaWBVdf6thchoeP?=
 =?Windows-1252?Q?WjirGoh0C9GXTVNk6tMPAqszjD6dnC4mBb4IzjE1fjKxOa8WHK8rpdWN?=
 =?Windows-1252?Q?zJ6jw7yD0tn+9f5MIKgJCwo68ozuqVO05RC7JLxDC/Sp2iur+qReO9FR?=
 =?Windows-1252?Q?zCwGXALddAUNyMuST0xyRRt2g/PhwjLMekTIF0j6smklRQU/H4wWvqx1?=
 =?Windows-1252?Q?81mtzgyg7Ut1ec24usF3QrXHXG54+qrKsG4xfPn5a0maTdDjKHzdusrI?=
 =?Windows-1252?Q?Rfv71rW1Bq5iz9kH+Kmlwa2YUd1DbLpp5LwctjhWaDXo5ehVsAlCcNeI?=
 =?Windows-1252?Q?sxeUWvv1YAU2AsyyQzy9TiszY9DUqWIIWHhBfaFGuhRTl31Lx2dBHWI2?=
 =?Windows-1252?Q?JLGJggKeWFE1aDTJUzAJ0rYyAhH4Lg9p1AOdb/RCwTxZNj+mrQfdgxmB?=
 =?Windows-1252?Q?L61Vg9Kzm5kI8q2cPJ8Wtal5SkQ63PJE2iMjlCJ5bd3gfse9KfZjQGLl?=
 =?Windows-1252?Q?KHpGkDeLUFfvBaZRsDDqflZj0cD/3VcJS2jpGcm9tSd9dSgjZzZ1hmta?=
 =?Windows-1252?Q?Xe+zMvdn6xv/K6sTNr0x6w7I/W75olTjTgdhK/G3Dd+BIUWNayttVLeT?=
 =?Windows-1252?Q?7oQHAmhW3idefkFYx6xX4L3MLs55qnG365La8Vm+qFsFPAyzTESpH2kI?=
 =?Windows-1252?Q?2nTcDlj62q6YSgRqIiHaxmXMFCdnjkW9I8KqjA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?AddfWyZ+7FkVbM96hF1WO4wguekWzQMWFcTPTHsdzPFm+cXnMENCT/7l?=
 =?Windows-1252?Q?w3PgJL28Wi0bbU3S7yrBP1iD437Ya5tzGtSGOV9wz/vMFISqDEY6fQ+s?=
 =?Windows-1252?Q?yyEyBC7k+F3eWDSi+qiTrv/rmLci2v3/FNx6JIzxhJ/d1zNnrcYy0/w/?=
 =?Windows-1252?Q?HS4MEft+clbJ/d8i1YfiDZTYMtdy+DYzAkMxi0TIq191RcgWk2aZD06m?=
 =?Windows-1252?Q?mCXfem+IfckdrdAFC8+KcdceB6QfcfUgTPCqp7+bN/BQls2sWob1ZckC?=
 =?Windows-1252?Q?0eDxMs1TuqiI6nsfXO3jbEYJj4zvrDib9XMVHd072L9JhuGr6xtRk0nG?=
 =?Windows-1252?Q?XjExUKY3ruZ4PlZoiryxEDiteCihTb2EHlwwaKJhYAsQ4JkaiTxcG/vm?=
 =?Windows-1252?Q?q7P9o0aRN11BQXOVmW0TIypPoWT/5FdCNCNCjQGAyE15KdUt+iq9HpKQ?=
 =?Windows-1252?Q?hZQ5EiNZBmcEvGJWYLAWxPb3bA3EilkFHmJRKy24/Npee0Cgtqy3QYPi?=
 =?Windows-1252?Q?6O+8IF2BYAbdEkDpHVCoS441d38ZR5hd692+iQ8M2H3k1yyXiymrwst5?=
 =?Windows-1252?Q?xf7PLKczdnevngbQ/0SiILcpZbB4MIvYdd49Mq0zTfavvGsphU5LesJZ?=
 =?Windows-1252?Q?G5veedwuf3klJPXNMnBdsJ0q+/t/xBe7GC39bv1iU3qoN0JlnTi6kgO9?=
 =?Windows-1252?Q?hNtq+AZc2dXhGKiBrJNy10oAbMKOfBOhoEeQOTa68xvk0lmAiw15R1Kg?=
 =?Windows-1252?Q?uX//7nr7VDEGoSX6wftWVMjo0Lx3QRc/HA8Z7cXje4s4+L1NvmihjtqI?=
 =?Windows-1252?Q?Nu9u3gBRXpmoOGIkGz9fqRWlHF97A7/47JoXzxeeRjMdiPiug+c6j0lR?=
 =?Windows-1252?Q?jDhaP6luWwO5ZyZbThRV9NcVq6UpXnvfOA9QBUgoMPT9jioY17B3OB27?=
 =?Windows-1252?Q?KwVFpCrK8R0jbjVRCWdkH3a+7A/8B4+N5XPxXcoiuHjxxQtes32wKWcG?=
 =?Windows-1252?Q?iF5SAFQOdnZLC13wJtv9uAbHc1cjiDmX/SyMzbPwn3Igiqx98u6ZAC8B?=
 =?Windows-1252?Q?EP/s3Dsv7xnp4utq6Jal3BW+Mua4R+7Q5/r0Oy7QAx2JTe3H5J5IRzkR?=
 =?Windows-1252?Q?d3dAFBORR32jWO2usf2QS9xNYLtu5XSQdWU2hAIKf133IW7j/8MtciNO?=
 =?Windows-1252?Q?JKm1vHTQWFXeOXefMEfOffNDsRYCVpN5at7q4Jp/mr2mRfdsv2I10pSg?=
 =?Windows-1252?Q?Z6mUIKjLJJeXtSPaKXCUREByIPIu92l1aIGAYG1tqsmngqxGlnU+URD8?=
 =?Windows-1252?Q?QDkroZONeJQ9jtE526pdjK8XLZkIJCfqi7OWCKSa4k2ZtCmQdPpjonHu?=
 =?Windows-1252?Q?JacSijY+QJ62GGinAsDT1Gi3vMD3Z6lVfxXbMe3HH1eEeQ2T6dFBGj49?=
 =?Windows-1252?Q?m5oRZVpKqLRs5d2i7IR40utth3+4pb7sksYcDKEJs2AToB8FTEPVB3u+?=
 =?Windows-1252?Q?wDNrLOdUfRGil4goVGRaW0Iafuh3XvMXCBovDi1LrWXZVILDrkaC71OV?=
 =?Windows-1252?Q?UGpTrbGKzzhp4Dk83TaftsboLdg+dNBtFQoKW6KeqeoeSYAyCLDqiI6I?=
 =?Windows-1252?Q?fNDmNoNB9WoO0k0q2OCX/nPv15BY414ILSEK0bGPNhlyof8fAb5Q72aC?=
 =?Windows-1252?Q?3Jd/yOVgbSMcQZWGHRHuFpkSQt5vhoJEkxCMg3Ewpc4KTuuqfFbwqg?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eba69b23-b78d-48b3-8462-08ddce6a1866
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 06:35:22.7589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T7QbE07epYDK8eFKAXcMZZR0wUYv7DyNFsDAN1KPweYN02KkEp3b5l7lRWdCD485sqWIa9sL16/dxy3vLXOY0M69dH706FawyUN/62RVhROMMSmRMleyJfj1d3e53+5l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1508

Hi Andy,=0A=
=0A=
I=92ve made all the corrections as per your comments; only one point is pen=
ding. =0A=
Please see below.=0A=
=0A=
> > On Thu, Jul 24, 2025 at 04:17:05PM +0530, Hardevsinh Palaniya wrote:=0A=
> > > Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.=0A=
> > >=0A=
> > > The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an=0A=
> > > active array size of 1920 x 1080.=0A=
> > >=0A=
> > > The following features are supported:=0A=
> > > - Manual exposure an gain control support=0A=
> > > - vblank/hblank control support=0A=
> > > - Test pattern support control=0A=
> > > - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > >=A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=
=A0 9 +=0A=
> >=0A=
> > This should be started as part of patch 1 as in between you will have a=
=0A=
> > dangling file, which is not recorded in MAINTAINERS.=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > + * Inspired from ov8858, imx219, imx283 camera drivers=0A=
> >=0A=
> > Missing period at the end.=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > +#include <linux/array_size.h>=0A=
> >=0A=
> > + bitops.h=0A=
> =0A=
> Why??=0A=
> =0A=
> > > +#include <linux/clk.h>=0A=
> > > +#include <linux/container_of.h>=0A=
> > > +#include <linux/delay.h>=0A=
> > > +#include <linux/device/devres.h>=0A=
> > > +#include <linux/err.h>=0A=
> > > +#include <linux/gpio/consumer.h>=0A=
> > > +#include <linux/i2c.h>=0A=
> > > +#include <linux/module.h>=0A=
> > > +#include <linux/mutex.h>=0A=
> > > +#include <linux/pm_runtime.h>=0A=
> > > +#include <linux/property.h>=0A=
> > > +#include <linux/regulator/consumer.h>=0A=
> > > +#include <linux/units.h>=0A=
> > > +#include <linux/types.h>=0A=
> >=0A=
> > > +#include <vdso/time64.h>=0A=
> >=0A=
> > We do not include vdso in the (regular) drivers. Use linux/time.h.=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > +struct ov2735 {=0A=
> > > +=A0=A0=A0=A0 struct device *dev;=0A=
> >=0A=
> > Do you need this? Can't it be derived from regmap cci below?=0A=
> =0A=
> I prefer keeping the dev pointer directly in the struct for simplicity=0A=
> and better readability. Using regmap_get_device(ov2735->cci) adds an=0A=
> unnecessary level of indirection, especially since dev is frequently=0A=
> used for logging, error handling, and regulator/device tree access.=0A=
> I would prefer to retain it.=0A=
=0A=
Are you okay with this approach, or do you still prefer to remove it?=0A=
=0A=
Best Regards,=0A=
Hardev=0A=

