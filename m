Return-Path: <linux-media+bounces-37255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B48EAAFFAAA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0C01C20FEA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 07:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB560288CA8;
	Thu, 10 Jul 2025 07:19:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021110.outbound.protection.outlook.com [40.107.51.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3738F5E;
	Thu, 10 Jul 2025 07:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752131943; cv=fail; b=TTg42RIHjtYeMqFjOX1p2S6/I9G6767mwV2qtGKl7Xzd65i321rbTkz/D2bKddiHLZC35Ad0hmuU0JGlcuAFcaqvHQTLdTuaSCPL6LUPS9flfaYmDWKUJwGHn3rpG4SArtMsawebB3b2Ex4ZDGJcnGCxERN2L3Kk2KqlH/m1GnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752131943; c=relaxed/simple;
	bh=jBJLwugfCE7RB2tcSS5tQsNqwJcAcOlNy/hBG/rUxyo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SXLfzfswmSt+TBN4ZidcKL0XrLjCqp7A/wGHTcqoVFdYx7JtzT43XA0Va7jum3aYU46r/ekn1gmahGflLh2tfdJnoS7w8w9dJXvT6Ufk1TgC243Nproatuafa7lW/XH4BuxTuY/isAPNSJVQR1OpSakdLnQUJkRZ1NHeMkxdLpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0RDFwAca9cMau+7XYMjyjGn7iqQCpc6W3JnBvOPdDxGY0vwODGtcOtZ/6ZcLH9fgnL5Tkn92C3cTDmrPUxsGp0DUYjfL9+DH5Up3ERvwi4GPn9N+EtY0b6dulwD6rNFnKLt0sr4yZLzs8qWw5tQ90b7+WEoUoP2JYDMvF4yJO1zqTmew0p+ZRFIMvkg6rG82c5OtfkVWsWj+H3zGIwHdOhTuHNcqzFiJvklUwkUPdLue+gbNKnrR9wkqcc1uUVixuMuFzupGUt2WNLqP10NjAFd9T84d3z/N6pbqC8Z/kUUQXloKmX6XrVfNUKzyyJ9IhtZ03y1nh2K5Dh4LZYwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8xB3ACx690cr46R8IIhFTEW7vbsS7T31Wre3g43MvQ=;
 b=GO9G1oqWBf6fuIzfhkUkZ9cpmVjh4+MjXgvd6DtEKcS7vzSPrvxK1LD699SA8RTAxDflTcBRtHqxZ1v91BEbHdAnHD5BtLHYJ4ufWjASL1wMOHhm73ceT2orWqPKBcOc6uzsF1p+NhvHNKuEAcCglvpz3O1Ccaam83KCbZ+wGMehUeJNlGEAEmDkkljL0H0t69wLJkKm6174rBlsQ9/VtAr/cANn95uo/15Qr+E8rTp/FXE8fa8+F3o0CV1N3uuejdVQymNt/raxqOs6gQrMfgxcG6PVpYnpwbwy7sonWpvUgh2t+elJceFFtZy8gx5On3FzJiS9oq2p8o94EVPNAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MAZP287MB0440.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:cf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 07:18:55 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 07:18:55 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
	<ribalda@chromium.org>, =?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>,
	Hans de Goede <hansg@kernel.org>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Jingjing Xiong <jingjing.xiong@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Dongcheng Yan
	<dongcheng.yan@intel.com>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Matthias Fend <matthias.fend@emfend.at>, Arnd
 Bergmann <arnd@arndb.de>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	You-Sheng Yang <vicamo.yang@canonical.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Topic: [PATCH v2 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Index: AQHb7/LRrpZOoPmzF06RmnTl8WSLo7QoCcKAgALrudc=
Date: Thu, 10 Jul 2025 07:18:55 +0000
Message-ID:
 <PN3P287MB3519636199BBE7E185798242FF48A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250708102604.29261-1-hardevsinh.palaniya@siliconsignals.io>
 <20250708102604.29261-2-hardevsinh.palaniya@siliconsignals.io>
 <ae032226-8e0d-4355-828e-4a5e0b0473b8@kernel.org>
In-Reply-To: <ae032226-8e0d-4355-828e-4a5e0b0473b8@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|MAZP287MB0440:EE_
x-ms-office365-filtering-correlation-id: 4e2f4a1f-9554-42aa-7106-08ddbf8207ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UH/GTPV3NxBxSDLF+FO+F2Xw8U+NO04Z17S60U24NBOoZjKybzJ5H9I5/G?=
 =?iso-8859-1?Q?0gVs2PEPxnjEjH5KWjgilEQWj3UcLLR7EpjrI4QLevpGdWoqrmplcI4raJ?=
 =?iso-8859-1?Q?dCav7ZyWZZIV7ICM58Wsws3SZbkfx2YIMx9aVPXmsIls0dxiukTDSYSqiV?=
 =?iso-8859-1?Q?/Zo8tYGc71+MY+IEzY60SEHNuohRm1ivcGYCNKFmNM/Tt4PePKukXl9HeK?=
 =?iso-8859-1?Q?02zs1fae2PvTK3BqaztavtRwjxWRZi5QusCMBJL8N/LR5IxZ0lpULdaojN?=
 =?iso-8859-1?Q?qbh45MOdrskreiLuCalkSEyAA6aUNP32ddpMcFgCXMtLz745iFPzg5bDdx?=
 =?iso-8859-1?Q?sk/PKQxG42xXktBurMvttAsOadVcylaeVAXxXU+EVnwibHbdDSRQCsZ7Ot?=
 =?iso-8859-1?Q?ybMX0rYCNFFv1vNhz/Y7SZttkWxOiDp/RaJjy2MKkP12udtbCXOqPqeDZZ?=
 =?iso-8859-1?Q?8yRWxhrvl3hVxNH2coqVsXpYOI+O4FNBHV1x8Ff79YqndgXEe45zzFqzMS?=
 =?iso-8859-1?Q?Shdc3JFWsmGHfMhQbp0YW6DCccKMMxTUsnvhTymqj8p3dLbSTP4zemF7gY?=
 =?iso-8859-1?Q?awbnrolQVosDGBBwpgeohibUwS7B81cP4ZRZg0lue1qLNWlGXzuFhkpsw7?=
 =?iso-8859-1?Q?94uaWKrNsz5BYZw4GEIsbV3ffjmZzGR8nDnm0BJQP6xk0lSZb8NfzYrikw?=
 =?iso-8859-1?Q?w7+0v1hKQNH9ZCtSPAgwox1iNW0e/k0svNMQnMGci+3j4DWmDw/uix4YEq?=
 =?iso-8859-1?Q?+ehOe/KGwRniFyNN5RBhvWm+TUtE7ovaeOgDca4Vtq4flLQZMAfF9aatGv?=
 =?iso-8859-1?Q?8nhKJPxQZPhMAHhXKMYdg4pkZpxXEMqochY4HconSjQk+GExuGv6l1d5pG?=
 =?iso-8859-1?Q?dKVChU+45eFr0LjzpIoEbH0AtYOiLv6GSTlGT44DqTaVDOiCQFUacFzZ5+?=
 =?iso-8859-1?Q?H/nprLiN3t1+fy1h7SqqUwgJNZoIoBTYB1OlG97Tci1YFgCuxFnVwzzofs?=
 =?iso-8859-1?Q?9y9YXs4TDxtcB/veQWwxvMae0tYCEIrD0JyE8f9h07oPQoTpYtGSuFb1v7?=
 =?iso-8859-1?Q?d2lTF8LvGdIEYu3kIcHudwld+4vydVvagBWdSP9wf8zUftjt2Z22jF5od3?=
 =?iso-8859-1?Q?TZGts/jk0cjHTDMXlC1sL/NNIs28yzu1Dr8A4QSi3dpO/eEvtPOlm0OejD?=
 =?iso-8859-1?Q?D1snnYdSQRFovUgOjoZ7Nl7Dgn6Sd5cBiB2LfcCU62leD25VzWDUJY8h1G?=
 =?iso-8859-1?Q?trRmwghRyuxScHOU15agSdzaUF938Rv5TRAV4zpZG88eXxWQvV+XdG/IBQ?=
 =?iso-8859-1?Q?SWlHAS5E3aDL2aKNZaanKPeqP3WofpnUsrQ3vurm9QGx6HXG/Qqs2iw5G8?=
 =?iso-8859-1?Q?HW6HnZsik487RX9NRIbgatZKvFaSzfP/WnIpiwGZLR31gdCfv0aA3FsQQf?=
 =?iso-8859-1?Q?lDZS3uLG2zecYTeUZEBRIMRk3pQ4TY5sgmfich4MrHmQqle7op/d7AXvmk?=
 =?iso-8859-1?Q?O2ZZbx9mmmTLfJbs1i7cJhAh4wm0pX47yAmiklsc8zdA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hdC4Ar5jol8q4or9+5jmvOKsmLLPOc0XM6un46EfyvCHE+yniPPrqAQ8YA?=
 =?iso-8859-1?Q?5qduKFTBJKv1ni9Ap9nb5rQJO8H8f6JoBDgtf6Bumz+z/w0P0N/JoHT3hO?=
 =?iso-8859-1?Q?vorFAp2muoM5fSDV+yVkqA9JWO0yynOSfPlBEDkgWHBUtEHFDU/9slDSSV?=
 =?iso-8859-1?Q?rXjFQXmH9pq6z7caFlFn4OcDittHYXAd7nO1TVBjR5uUBPkjI9vDZSaiBC?=
 =?iso-8859-1?Q?LVNmKCb3hTxjOs6llFPyzNquF1xu10bq1YgSoXwGH2Eg2MNMxjDTWXuQjT?=
 =?iso-8859-1?Q?mOrzjk8903Hfr8KM/0f/IiTjs5oAzgbY/E+oNZSFN0BMGH9E0wNdRkte6l?=
 =?iso-8859-1?Q?4DQ3ndyGJdn96K/ufgYURUSThz7JMUKxk4CWLrD5psS82GYyExr3h6DTXe?=
 =?iso-8859-1?Q?nRkJdUZvsAaunjCgRquIE+/EoB6wIM8aOnMR2WyG9+FPXGEpOzXolo+dzb?=
 =?iso-8859-1?Q?W6DwovfIG3JAoK5SMjijmzUJiFIbMqy9qjWPGlfK9e5BB7kpcl9bTzaSfi?=
 =?iso-8859-1?Q?Pvg7C3oUu9m1ERrZEJM4nt2JZRI0WBhzLNDz/OqfNTcPuGsobgUQtdNnXH?=
 =?iso-8859-1?Q?ctBdsjPBLuDaxTFxvnQD16ce2TPej80yqMp9bnQCkBpWptaGXotKZOhEzm?=
 =?iso-8859-1?Q?JMzeFqKQQ7DRBMdzEXiasqb2/kDNe8mE3vfHdI0RHv+dfnyBLC5+RVab6F?=
 =?iso-8859-1?Q?JpYZmc7Y67NRQp8yA1AaYZOhW4G7JOJSegBoW5j/bOcXx3iZRMNY3WeUG9?=
 =?iso-8859-1?Q?yTL5uH1nadVcBhdf5oAnFd4BBeKTXGUvqHWJCdvPNHL8KI4ORhFamdfUW5?=
 =?iso-8859-1?Q?Y65QwPePAlfxTlzZBlPlzgmg7aOFfyxeilYs3J85uyQ34MXLOBdrjTHF+w?=
 =?iso-8859-1?Q?0lfhDqJGaxZLtQYk/zO36PyfqqU9hZTbdhpoCx2/PH5jRc5MoXkrbEcNLz?=
 =?iso-8859-1?Q?+ok46jZx6NTAnBB/siELr15ncIfpkX7HG6STGUB06BOxEecFIWFaqlfYjp?=
 =?iso-8859-1?Q?AjUJsxcfoDH7h1W0d5/W9EIwZsxJdTLYYW2A+vn9ySCiG9rt0SW5+q29Or?=
 =?iso-8859-1?Q?m5/YIoK/2df2YlHM8yg8Z1tMVH+ZYMZtPlyOEy7DKQRSvP0yl6Acz+PcxN?=
 =?iso-8859-1?Q?k7VPz8bafMkyTJwWTS1Pd5phM6X4+L/lT9WH+2pkZY2LkOOP7u2uOE6KSE?=
 =?iso-8859-1?Q?xQcYahj5VjZAGq7qYFG0SalOL6vvFXZvP0BjxosmBiNtr6fH/NGrCteLui?=
 =?iso-8859-1?Q?8Q9eNoLhGpLZPLqj26b85RQHqO4IfRoPn6WUrCA+aejTMCqt508bUMhgV8?=
 =?iso-8859-1?Q?ozuTbJBcHo+mwX73BmGwHFLsDEbggw1684v6XuFspvZJSAtyk7MCvkkxvl?=
 =?iso-8859-1?Q?auNrWVaD+whROv32aO43D3T+VSYk9Yf3gx/DJtUw0Ko+NMZQwfh6BqHF4e?=
 =?iso-8859-1?Q?tK4u6/VI94fbW6l3jqIq9vkhV8j4Fn9eACD8mXVad2NbBdqcKbPAGcDslV?=
 =?iso-8859-1?Q?ftke/jfd+Wy7cULGUe2hJ8EnHRYcEcUsrQV3pTxmftXDtTBVDfgKGuAdmS?=
 =?iso-8859-1?Q?LNSV4YgLvgQNCoD/itce45uKP3SJRAtMQO3kxwUwWDKDRLQ9JKLJnDQGf3?=
 =?iso-8859-1?Q?WjiiosUSohgYwl/Q+S/q4lbRyh/PsrNm6+kZ6oapjxEZ05kZ3xpQ/izg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2f4a1f-9554-42aa-7106-08ddbf8207ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 07:18:55.5809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hacWO2N8o8gPCGDCtyAvrWpYV1W+lHhtxH7BdCl5OBjBlWW9aVAHSUqHrHjSeNTOfp3tA2ilvZvjgUtAXtAAjsjrxFk7+VwyugYGc+2mdbq+pf8dqN8wDLd458BPyX0j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0440

> On 08/07/2025 12:25, Hardevsinh Palaniya wrote:=0A=
> > +=0A=
> > +  clocks:=0A=
> > +    items:=0A=
> > +      - description: XVCLK clock=0A=
> > +=0A=
> > +  clock-names:=0A=
> > +    items:=0A=
> > +      - const: xvclk=0A=
> > +=0A=
> > +  AVDD-supply:=0A=
> =0A=
> Use lowercase everywhere.=0A=
> =0A=
> > +    description: Analog Domain Power Supply=0A=
> > +=0A=
> > +  DOVDD-supply:=0A=
> > +    description: I/O Domain Power Supply=0A=
> > +=0A=
> > +  DVDD-supply:=0A=
> > +    description: Digital Domain Power Supply=0A=
> > +=0A=
> > +  reset-gpios:=0A=
> > +    maxItems: 1=0A=
> > +    description: Reset Pin GPIO Control (active low)=0A=
> > +=0A=
> > +  pwdn-gpios:=0A=
> =0A=
> Use instead recommended name from the gpio-consumer-common.yaml.=0A=
=0A=
As you mentioned in patch 2/2, this pin is not a typical power-down control=
=0A=
but behaves more like a power-on pin Based on this, I think enable-gpios =
=0A=
from gpio-consumer-common.yaml is a suitable choice here.=0A=
=0A=
I will use enable-gpios and add a clear description for its usage in the bi=
nding. =0A=
=0A=
Please let me know if you would still prefer poweron-gpios. In that case, =
=0A=
do I need to add poweron-gpios to the gpio-consumer-common.yaml file?=0A=
=0A=
Best Regards,=0A=
Hardev=

