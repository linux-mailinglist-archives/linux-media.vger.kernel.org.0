Return-Path: <linux-media+bounces-28845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1399BA72E60
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 12:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3132173600
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 11:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D1B211296;
	Thu, 27 Mar 2025 11:02:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020108.outbound.protection.outlook.com [52.101.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA820F08C;
	Thu, 27 Mar 2025 11:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743073363; cv=fail; b=T/n2kP8qaF/j91DOppoq2newAJtcIXOM9WBCD+Sy/GwYKvhPuBEZKGpslK4UBGLCIthruCPSRI2spgEIPDPd/LtZ3zSRE+xLuEif19nPz2GeSAJG8M1Xaxy1LLjxajkJn1x/4e3KuZg949eJChsiGwygEN1Dw/MrtwtcDSEEZ6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743073363; c=relaxed/simple;
	bh=4rW24NElgdavEJgHCVfylZ+PhfUO3QYyfZGs309cdnk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UyggBbGdMxcRf/DfFrfLjLfViuLEYHz7iy6/Mpqv5Wj2mpWfgZrl9hHB1tNTiNHGZD3FUrFbpJWjj78b0iRI+FPJ5oZmzTDfPF5HiO1tWRnxhPBKKdw0+MdoCJou4h0E+0vRek6VRR2vvsvK1nPFzGJe36jvVjln9icaRkD0RwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRJ4/KUpr6tlja+gl3CxxrnGqr/PbdcQNr6TXWr7sngEdE/+54/9AYiPUG6l4uktg5a9R8sygVs/neicnZhF757vDPN8AAnr4WAFq8YxUymxfys0Hg1MKGHV/sNzUpT+6i+qiyQC/zlA+lKQkPJwbmCBDgi96aOusu6+4xNJQW8iEPEYimeopTNdx/oQgjDit04qKU4bcyBRIQ6qNOPmQC+anC5duTIthW46pFKMRHN3B9coSMEn8Iu/G2w1ZWXPeSYq/AFWM4uwmAN9sWbYC50D15Efn9yMA+6RXgwAkONxt4bql4X3O6Rclabiqe7NWJmfWcjY0g+ZUWvb3p5RgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rW24NElgdavEJgHCVfylZ+PhfUO3QYyfZGs309cdnk=;
 b=EQerqoWQiV4+s0K6gEVfZ30LrGwXzs9pMRTwXsuq9k6MZj06aTn3YCIyk4tNDfHKtspJ3hZx8WEJX23N70565Qi7IZoNz3M3+Jp8Vlxz6CAvPgKZEja9+JeDGm5dhDzGPxAlczdpQXcdZfNX0tNAm8gfxvM+XbKL1hlVx7D52WDCxo6kvmHr7j04Icwb/wYC2tw71Sn8v6NGH8Q2sR5S/yRDyv6qyhZXBpBRaB353B2CYZubITDebT5DGfJwaT/0iw0stEmEjGvYjopgKoarWNSReOFosx6motKIJpOMs1fPMfgBqmpyEF8MJIiv99M8tKOdn77qZZXIbS1+aXmGEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB0357.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:da::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 11:02:33 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 11:02:33 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"Shravan.Chippa@microchip.com" <Shravan.Chippa@microchip.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Julien Massot
	<julien.massot@collabora.com>, Zhi Mao <zhi.mao@mediatek.com>, Mikhail
 Rudenko <mike.rudenko@gmail.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Luis Garcia <git@luigi311.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6] media: i2c: imx334: Enable runtime PM before
 sub-device registration
Thread-Topic: [PATCH 6/6] media: i2c: imx334: Enable runtime PM before
 sub-device registration
Thread-Index: AQHbkYzk1Y22sh7QN0aZHNR/YEI867OG3MCAgAAOBOI=
Date: Thu, 27 Mar 2025 11:02:33 +0000
Message-ID:
 <PN3P287MB1829B0776EF3D34D0CA78CB18BA12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-7-tarang.raval@siliconsignals.io>
 <Z-UjLSsATevtLT2k@kekkonen.localdomain>
In-Reply-To: <Z-UjLSsATevtLT2k@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN0P287MB0357:EE_
x-ms-office365-filtering-correlation-id: 797fa730-44ac-49f2-8889-08dd6d1edffc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HcUcvTAJ2+YnoyC1PS5WjKdajFSZ0zA2X0hylanvesDhKHhpW/RJH3ngYr?=
 =?iso-8859-1?Q?BvTUgfhOzjdTS8TJw1VN3AxtbtG0PsnaAFdld+K7VBwHc3P81DjIq1kiZu?=
 =?iso-8859-1?Q?ENkwMM1SfRzd1R2U+5junn1qJakOGrJxT8i7XqWVLhNbuzewoDkdSj63u9?=
 =?iso-8859-1?Q?3T1SfljCAnQ6zCxXay9YaGHWUQ2DR0IFWXSheCRCvDyVVO3qA7I3Dlrkiy?=
 =?iso-8859-1?Q?jP6gI60LGnARl4jqRO5ZmnTkSKU17Cm/x1a2qzOQNpYIs4oFw0h8V+1xZB?=
 =?iso-8859-1?Q?MG4A4u+uzfgAMsdiDHBkUK3E8DjkW0i4nPaJUwgkxTmrwGJg1vrhKrqj/3?=
 =?iso-8859-1?Q?pHh+Z/Nb4EANFd99V1JNJB91HBFxd9PcZFJt3lmA+UI89HI4RDmx56r4/M?=
 =?iso-8859-1?Q?lQQ7leg5rCr51cJbGgL0ta+tHRVc/lYncnK2LgK1VNnFG77M16Cg5HgIUS?=
 =?iso-8859-1?Q?UMzImkLAUjC+nUJThFinap7qBqcPaadPfKVcAssAUIT0we2Jp29rNvYSNv?=
 =?iso-8859-1?Q?eRYG0SOaAefzjAkR3+M2VIK8jwJ5kN43rcc2Q4iPV2g08noztcUlU/Zcfc?=
 =?iso-8859-1?Q?IRgDGlKhKCclLPzPnGfiQjJGZs1OWolGQgEaTpCGPHgxgqd3HApdSXYpBv?=
 =?iso-8859-1?Q?o0sKIVyYUlmkXl0sGRtXQvYxO2yt/7rx7+65dzBF5Uz40zJ8GsjsGMqoxp?=
 =?iso-8859-1?Q?0umyBIaYmeIAY1XhYk7caE3SXYv27DfB+8tBK8/gDkifR3Zm7+g1oolT2A?=
 =?iso-8859-1?Q?YAaN9CIdtsIRcYnOyXp+HuHMltXo525twacFO7R8GMztFmWtL7CXCQF0PZ?=
 =?iso-8859-1?Q?/bSCYEdv0dzpwrZ1ftlZd7YSC3UBW7mx9APJEI+1D8KK42VN1oZv0fFdKL?=
 =?iso-8859-1?Q?kaTgveAi8y1XUB4h3M8WNe1jr+S+28y5hp1MrDD2A7E61sUsABUNiBROht?=
 =?iso-8859-1?Q?uA2Y3W0UFR0mnwEZY4/vmiUVhhSV7bGlW2rctjiL0zsmqYyjs9sNBShf/o?=
 =?iso-8859-1?Q?pHTa8/z91HoWkhhfLoSyq5WNHAdCh1FstTD2/lJl30cm/h+xWdLAFuHl08?=
 =?iso-8859-1?Q?2iFYpIkylwx8QSFY+F55I/beMvSdwdy9L6SU2iDUaY9tmczYV42RA/KW3X?=
 =?iso-8859-1?Q?CC91RhW/5furCmfNgrEfzixfkNjXMd+cNTWRy2SMCguYH2ELjh6uHlYd8c?=
 =?iso-8859-1?Q?EActXcaVKMfs3zwo7GBT/oATxLcNXF20oFImZMM88By13Xu3PRytMmbYyL?=
 =?iso-8859-1?Q?xgonHcVpKC9mWiFri3lSwDebIMLlpiVzT4h4HwVhHBn4jQAUUNHJ9xER77?=
 =?iso-8859-1?Q?r6NhftiEVHs7F/X5j/sKm7r+W/Qk2tNCoGUjksNhEGO3z/BLdZoi6R/Pmk?=
 =?iso-8859-1?Q?vcJGErXBP7d2eN2ydg0gKtmpMhuzk4cEfA80dqY48N2Pu6IfX1wqaWm/XY?=
 =?iso-8859-1?Q?I/7VP50v72TgSzn2IdTWQCpWdQ7N11qLwy4CRnurCLjDLKJ4hoDIdD7ssy?=
 =?iso-8859-1?Q?PiClmACsdl4wgnc4uyG0EQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lbRgien0KepZGjLlnbzsSMvlh2dyRH+3uRJqblONN8BeiLNEw7Vd/WTi7V?=
 =?iso-8859-1?Q?OPmkb0olfUhReY+4rhHyhj1uT3vsguwkS8lmsyPMJBaBclqDDGhVSVU4Pw?=
 =?iso-8859-1?Q?kd7VH9OedaHsZ9I0KsHeXXz/E36kW1D2OlgFzyNjZfP21DlehCvFRobueM?=
 =?iso-8859-1?Q?RW1HjrLC1LzDC/qGb0jhFFcsWVNsSZ+Eiia0pJW5yzedVwRJGBLwN7/su8?=
 =?iso-8859-1?Q?g9zIYYlXMgsku7OQuf54vFQhv6MgYTxELZrGu2ey6s58Nh4q4pJ0KiBfxl?=
 =?iso-8859-1?Q?IHEjsNHUNMKRpUJd80YyVw+eJ35IEomUJSGapXsXxd2wJoXwwsOicrlqbz?=
 =?iso-8859-1?Q?fLkcXsvu9kzqnMneVN2ru3WNUTt7JrirGJ9JVxr6mdO+qNiftrNynnfk1x?=
 =?iso-8859-1?Q?BOdJx2VXP6JMNtrF9+oqn+xxEJjekmZa+MFCvcU8XD66s7LNyG6+Cz0hYR?=
 =?iso-8859-1?Q?A9dkWLN87FQSqXMXRju3s4kF4zQTD/Yq1aZCUaPHja2oiNM/odZe/Tdt+z?=
 =?iso-8859-1?Q?bOPysGttZeWTnyEHpnWMtRso9Awlhot8q3nM9zRvC+8Mer/QqYKfTfxg+a?=
 =?iso-8859-1?Q?8e4zp4Xta20JuKg3nDc8LwcbHT0PDolayFcbxAI3R1dtyyrclPskguJ9d9?=
 =?iso-8859-1?Q?LbtiFmu+3AdP1IF/PWkrAZG91mVKwKThJe0cudQCn5Avn60ZviGTL1EBMf?=
 =?iso-8859-1?Q?ers8IOPq1T5rukG96KD+CwHOAD8KUYc9PM7yW1UH0TfmUWXsY43bVr8T4I?=
 =?iso-8859-1?Q?cAkQjaugD/NUkSyGGnMxD8FH2UP0ZutsgrZ/s4qxq2qC7NqnalkNi6hZsu?=
 =?iso-8859-1?Q?9wACKQWiQ4DmWbs/3DBYypSqYBZy+PYF3UrrevCd8sp64L22wXK08BhTsq?=
 =?iso-8859-1?Q?QcgOps59a8Jff6/W4o5At4rN4h/y6vXhT2mo2mI+807tQa3ehRZenN+TPN?=
 =?iso-8859-1?Q?Mp9wXGgDzClN/2VkXVS6XCmxlsvsRGlx//zsmA2Odx6JE7hVMG3NuvfTfa?=
 =?iso-8859-1?Q?jl+i63AXHG0XLy5bAU7s5vnUqkYHjOZZ4CZmoD4roIfKHK8EWtfzjo1F/y?=
 =?iso-8859-1?Q?sGcR/CzBt67j7JQmKTOPoJv4iOPWeO+tsI5PO1Blz906tZAY/HEdo1PtF1?=
 =?iso-8859-1?Q?v3tR/5OboT6WatK6ZnjT5mDCLlHeAhuffV2HKnTeKEGC+2hBUf2h9VG7fQ?=
 =?iso-8859-1?Q?0SOgYmxGTO9j7B6Fwl/DRbWZDDHZi2u5NI6mTD0mswsAIfHJ/TCEU8x6kK?=
 =?iso-8859-1?Q?63OBtNibD8dulzERDjRTkQruFG4B0Z0tVsrRKrTRgtrtZNeqtoKsSN/e7K?=
 =?iso-8859-1?Q?fE6iEixIxVj/NujN0GqObicoKmONzkyKrzxsja5AyeMmdeKtJ9CZCT0wrE?=
 =?iso-8859-1?Q?q6i87N1b0r22fyFvO8CWdWaVPMNWBMlWlMhlG/zw/+A7HxTD8Qwe4B4kLy?=
 =?iso-8859-1?Q?ugODK6T2PCc1pH4WptQyIFLEvvaFFRLyPE84Vu8uy52wEof90qZIDjuj6t?=
 =?iso-8859-1?Q?VNSuil0diiGz+WpQDrusA+v578ky9+QqhBggLg/CpPXKilkC3/TYB8S7DE?=
 =?iso-8859-1?Q?iBwsSgL6AilGazZFL/NtfOcAjAZFN4cOm66XuurTNekKr8zsm5F0vZOJb7?=
 =?iso-8859-1?Q?UKByz7RdcOiO6xGyH6kIGLe/SmYQayy21g4p+1EQcfAtT08s6KuUq1uA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 797fa730-44ac-49f2-8889-08dd6d1edffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 11:02:33.0176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SFWBf6Mv8fhr9PD21aDqChEtSr8cp+V2ofnE54DcDDcu9susmMoIld3b2MsvnV8ImFpsfgCMAD3nG+TivlEU7M5SGHPy3QEMyWptpdRa3m8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0357

Hi Sakari,=0A=
=0A=
Thanks for the review.=0A=
=0A=
> On Mon, Mar 10, 2025 at 12:47:48PM +0530, Tarang Raval wrote:=0A=
> > Runtime PM is fully initialized before calling=0A=
> > v4l2_async_register_subdev_sensor(). Moving the runtime PM initializati=
on=0A=
> > earlier prevents potential access to an uninitialized or powered-down d=
evice.=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> > =A0drivers/media/i2c/imx334.c | 5 +++--=0A=
> > =A01 file changed, 3 insertions(+), 2 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c=0A=
> > index ffa39bb317f7..8964d60324e2 100644=0A=
> > --- a/drivers/media/i2c/imx334.c=0A=
> > +++ b/drivers/media/i2c/imx334.c=0A=
> > @@ -1295,6 +1295,9 @@ static int imx334_probe(struct i2c_client *client=
)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto error_handler_free;=0A=
> > =A0 =A0 =A0 }=0A=
> >=0A=
> > + =A0 =A0 pm_runtime_set_active(imx334->dev);=0A=
> > + =A0 =A0 pm_runtime_enable(imx334->dev);=0A=
> > +=0A=
> > =A0 =A0 =A0 ret =3D v4l2_async_register_subdev_sensor(&imx334->sd);=0A=
> > =A0 =A0 =A0 if (ret < 0) {=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(imx334->dev,=0A=
> > @@ -1302,8 +1305,6 @@ static int imx334_probe(struct i2c_client *client=
)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto error_media_entity;=0A=
> > =A0 =A0 =A0 }=0A=
> >=0A=
> > - =A0 =A0 pm_runtime_set_active(imx334->dev);=0A=
> > - =A0 =A0 pm_runtime_enable(imx334->dev);=0A=
>=A0=0A=
> Please also change error handling accordingly.=0A=
=0A=
Oh, I missed that.=0A=
 =A0=0A=
> Btw. the remove function calls pm_runtime_suspended() that does nothing=
=0A=
> (use pm_runtime_set_suspended() instead). Could you add a patch to fix it=
?=0A=
 =0A=
Should I include these changes in this patch, or should I create a separate=
 =0A=
patch for them.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
> > =A0 =A0 =A0 pm_runtime_idle(imx334->dev);=0A=
> >=0A=
> > =A0 =A0 =A0 return 0;=0A=
>=A0=0A=
> --=0A=
> Regards,=0A=
>=A0=0A=
> Sakari Ailus=

