Return-Path: <linux-media+bounces-38952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58EB1C053
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 08:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D1337A2936
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 06:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7931820468E;
	Wed,  6 Aug 2025 06:09:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021086.outbound.protection.outlook.com [40.107.57.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260FF2BCF5;
	Wed,  6 Aug 2025 06:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754460579; cv=fail; b=u4LPWgiUw1OlrZD/coCSu+zd/Vizq2s57XebzhPVftxDKQdXlI/Mjyvnx1vTRYqRxv4eobd0vc5adCO3Pt1/gbkxp91A8Sp++2GV6bgD7ifhgxTGG4SHOaPcuPUQYkw4PyPfFbxZCbRryp2yr6gAPgv7M/a/pbJtsCJukE/ETvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754460579; c=relaxed/simple;
	bh=iTagbxKLk6EBhd24efx8F1lcHVaOQMphHGQowgFrA3E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I4hOwnrzRA6uqYRgjfxL7A+05LVzTV/gWloIY/HXwAz7lJp9+GO77uXKFwiWRIhXJjZUCkL0Gr//awK/BdI1PGy26OcmbXW2Cj7QcJcaS6auQFv4j0TRAN0+VnLg/6P1oO9Hw5jea760Rem/L0h/yN+DsOYteK/JVRZ+/ktmdg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7ozQUc3BYUmlmvu8qYQi5o2gbsoCnEdwccsbJwvZkbEwPz7x9bInOy7rbQhZdjPiBzuyr6keHFCifSOPgbHlA/M7Zsfy6QQjgeX75rxdCNHHKu+2PdVTmSI4C8KO3B9kvqiP/FR1fnTDxBWEHguUl9Sh1SnmHcGi8xcN0zrtNRwmeonH6yKKx1pMBPKxOoY+OI0JMLqtKDkBSVxJ8EBBGpsZPerHh1/d9Jdrlh8O1q0hH0NoO5IvfrQsbDN+BBfskLJ/aP6ucYKxhDpxrdb/yZyYDJP6Ej55t0OZQUTtw+U1VMsuZRL+ECsZ/JQE4+4EM6683HhPFqaw1P1zoFKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTagbxKLk6EBhd24efx8F1lcHVaOQMphHGQowgFrA3E=;
 b=g9qcnTLN0U4JdqVUjaktLMwbtei4SuaicabFjNI6Hep9IQNAxC9MpyZURY7kmXnPmNR07KlImYw8Cu6HvRYXegQ//2EsB+UxtJnY1bYWYyhv+75ENQveaREznKyba467YyK+nJCLvsnFxgw5+fdlyDKJFyFO28Z6+JCu28QA9uSfvGo0q9O2VrIH2bBD09DBsTXuQE7WS67BJgcIpOpxCAb//e+kV+vd3r8EaIL+eDEQEf4zL/bH2kC/cPg18dJbUQChnBuVaRDOFX+33hrkaziMqpVX5jZNduNk9CkiMhOrdKDGfJDEywcTpf7Lc+3JGySIz3KMHd9wYcF5XE/BaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN3PPF829F3F944.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::ba) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 06:09:31 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 06:09:30 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede
	<hansg@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?Windows-1252?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Arnd Bergmann
	<arnd@arndb.de>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Dongcheng Yan
	<dongcheng.yan@intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, Matthias Fend
	<matthias.fend@emfend.at>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH v6 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHcAeHiVCljdpdLHE+nzjgq9sz23bRUsgcAgAB7Obk=
Date: Wed, 6 Aug 2025 06:09:30 +0000
Message-ID:
 <PN3P287MB35196F4C68AF1E0B69EED511FF2DA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
 <20250731061004.5447-3-hardevsinh.palaniya@siliconsignals.io>
 <aJKJ9l_j2VJFEcHe@smile.fi.intel.com>
In-Reply-To: <aJKJ9l_j2VJFEcHe@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN3PPF829F3F944:EE_
x-ms-office365-filtering-correlation-id: 4f96798e-3778-44f3-269d-08ddd4afce75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?BPymQ6Q0DgN8KDu3M8N7ZNT57UWLPFxO0rR1Zq85JEVJk8lE0eAVXHHP?=
 =?Windows-1252?Q?RJpLwwwmosYOZjfCyV5GzDGXM03AGJBFQP4vxkM2gn3RMimju4WikolU?=
 =?Windows-1252?Q?ptyZ2BOzikcWWQWLu/UVjPyooggUg/BIMX/cO1n7ZA29EqOLW5nmfbCb?=
 =?Windows-1252?Q?xaGz/PnlVGLB92wg7rGNLDtB/gFY+gJEta6dHr+cfKDmF+BzvrE8X858?=
 =?Windows-1252?Q?mES9BjVa/kJfKVYqKuA6gd9M9IZxhI7uWh8BjdUNdN4LhVtRPxpTh6kl?=
 =?Windows-1252?Q?fRj29r5JGq5wimWn8wbFtHmYWvYNFw8TMahbQEtXASsvi20inOu+Af7y?=
 =?Windows-1252?Q?waZmPmRJ7jqIdgiDVhXiAXPbxIOvztF8Sn5j0AneD4ATfRm7U6BMOjKS?=
 =?Windows-1252?Q?obvEdYs5Q3ebVduBOHt3hoQsaU9jjLMXrp6yAQr7TF1o3/a5vHUGE3MI?=
 =?Windows-1252?Q?Ftx8fJ7pqf9TwfRw5jF2KgX6Bl6nNbfkREKYmbQyhuWQl+rPNbJm8LNZ?=
 =?Windows-1252?Q?KG4hmwWYOhYuY56VxRLqnAzIBoELEavE8e+SZpncOwWSY1aUyDmSHhVb?=
 =?Windows-1252?Q?XjRWEum+Z60yopCxG9QxYWqPsTTFUyq8Rhwi16dVb8cNy2yHGpMWSCyX?=
 =?Windows-1252?Q?R2W2WPqGzM6WevlyQKZG4OvH24gaPfeZl0oLdPMAp/127ruoQ/rF4ZUl?=
 =?Windows-1252?Q?brJd1ID0oJm0oZOHs7bsJNSEWmqR5oDj8PfNfTw00b9JjVmKzkCWjMQZ?=
 =?Windows-1252?Q?LYbiRmUBbY+MVixBrLMJvWp+QH5+1/r6bKNKtR53FYwcWD68e7j4LyLg?=
 =?Windows-1252?Q?chHhXNp8+nJAyu71kseQ1dk1O4qI8QhNaOOXDPg1aUDXyM+DHrHnC82p?=
 =?Windows-1252?Q?VD8Qxsa8QefqV3n6Q8EAxRG60eN7fjbdZOMAH+VA7ot1MPp05jkILtfG?=
 =?Windows-1252?Q?B4u6NWfDTNawITl8W0DgO0Rv6LYvqvCErAvMQztu5LJlU6iuJ6mW5EL1?=
 =?Windows-1252?Q?aB7NIOydLcDJrIGC7BT4UkCcCdSEQMXbPB4waOOHZptV2OKlBfVFYrbV?=
 =?Windows-1252?Q?xTG420uzJC5bXcIHx8MFHo39jlzahmhFkfCiZuX/bW4faL5ZlkCYxEcp?=
 =?Windows-1252?Q?MpO4Oi0Fjk2+keEx7z2Wfm/ostJL3iW3ZB5KumfSCy3qzsBkTw+fXK4/?=
 =?Windows-1252?Q?qLHeUGWG8JSr5gzanmSzRcDh03YQMC4Uk15yu4awTqe/wbPhsYbZtmAm?=
 =?Windows-1252?Q?ItZiAhEhO5x2yhpZNfXoLdajuRBOL+G+HPjzU9BesjUQy8cLeFmrvKBO?=
 =?Windows-1252?Q?DGoBS3T4VjY52Gv5jVeWW4WFhugdZA4fqw8ZSzxNriZCURczT4N3DLwE?=
 =?Windows-1252?Q?qM6tA1ALu1+kWQzLHlRxUY+Fwkv0Jem/i2jmHZCkcFC3ZT4OXx0XokrQ?=
 =?Windows-1252?Q?aD4LKoKUkuEyswBGIt9ufD7ZavwRVeSEusFWAlkGKBoIQDVlQLv/im0L?=
 =?Windows-1252?Q?5t2lfnKGMh5itiVIpXmPbg2FtKCKdc6rzNUZQMpacIYI6cHSz1BdEKk4?=
 =?Windows-1252?Q?g0qXTb1aUH8B/QfmVsiSoZyPVZmZnO6a/FzEXg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?6xHsJN3snYBNQpDYmnCLHURyUsux7KpAuiYtgRYM9dGIqQDY+IbVaGdM?=
 =?Windows-1252?Q?vTvWxvlg+Za/vNIskh8+qwLDGSgGMcxNDz5ONUVqXqwqI0fEc/RjZ0gM?=
 =?Windows-1252?Q?erbVA6OaagBwFDGwdBEf/VGmaQTRGaUysCYKMI4iKP01QeSJEpAevH2S?=
 =?Windows-1252?Q?H2xJyDUBrBpEv0HkaEYJ/JItvy9RNyu4dFqYhTZVlFUByWWsCHcqN3YX?=
 =?Windows-1252?Q?tuWxnqh3TZau5un3okClksd63H2A7NFCR6EViQn2JSmHgTTGqroly43Q?=
 =?Windows-1252?Q?TmvbZw6qwmSRVx12wlyK7NRhBfWlJAhnI0C2sExwS3veepu6LtMRSxEM?=
 =?Windows-1252?Q?dSI/H1j0daQN3I1JISnx97kQpNk7TIRtuOsrCzE2Fs7nL8rJLHuL7ioT?=
 =?Windows-1252?Q?tq8NkzbglN9f2pqMOn9tDdMfNzTlp331ar8OX0F4+8TooK2rbHq8EaKP?=
 =?Windows-1252?Q?XkhRnnJgPdWS4nsbUAAnMA111Rr+U3qr5FGhojk03IggTRv2nT2Orf/8?=
 =?Windows-1252?Q?WK5LHZhDJ/bmjPHUYZFwKPUBEgDiA1VDHgatnHH/0xhRRT8w2hfAGl7U?=
 =?Windows-1252?Q?/+HT6HVubj85xPbPaB1MlXZoP2adAXP79iWNURjNFfoZIIYu0cZZOoAq?=
 =?Windows-1252?Q?bg2i5NkCsK8P01iLFT/sueoyJHQxhYD5ztPgKqbnHGDiecf8UttGUBAw?=
 =?Windows-1252?Q?0NqJtlFKDRgx9hap9PlZstcLdkuBYz/IZCcU5/PBnj/CusoQjW93duvm?=
 =?Windows-1252?Q?/A0YdpkH3z5tb6kLoRHRe4xCz89GhuElN9q/tCq7UxmT6gVeOVkGMnWt?=
 =?Windows-1252?Q?fBCUn945BR1rPQfCHTc7lehG+47gUZ/LDlPa+0hJ/vSWALEpGubBTmTF?=
 =?Windows-1252?Q?+Mda/wHmzKEYsTPdfhrYiqeWffgQJOf7qxaY9HkuJ9ZSiCsUZbHyErOU?=
 =?Windows-1252?Q?HKH6L1xHIukamDxU6kVGmElV5aoVxNsh8mPHBeRWqLoH7KHYpE41biC4?=
 =?Windows-1252?Q?3n5APh1UPBjbjBfjrU8o8BWgmtqtwq623mcCZnk10vxu1YrkJlB09l2a?=
 =?Windows-1252?Q?RbvDA0WqiRxvQBTQ5dY88H+O8uQZhtknCanxkFmpHXPQZ/xQRHX9s++W?=
 =?Windows-1252?Q?fnlKMYmWkK4YC3x79cS4pNEvvnF+v/5TZ+KuzAG8+iAkTjNXKIiZvzkF?=
 =?Windows-1252?Q?fsc0r5RZ0HfNzylY+qm08nsCI9sQ07Q6j5fHxNaMatWFTvJqzMVOJHcb?=
 =?Windows-1252?Q?F2i6ITwtUNSUabeonSW37jWSDE2bjMUxsEtTN5zk/uHiLa9kwFtjy4cF?=
 =?Windows-1252?Q?bjPgIR9UY1s4BIIYdvU2wVgWUcRXJLUlNoJmqqd0iqCPc0Rnqu0M0A3q?=
 =?Windows-1252?Q?j2ZuL+1h/YTqxSHdQ453AGzWEBYC0jhlL+VZZhQSZ0vkVr7FzZnxaKuy?=
 =?Windows-1252?Q?Z9kTazpHFO64dsmqdgekD1jY8RdQkpQJvlz8CL4DkOONde0gfZ8/F4MG?=
 =?Windows-1252?Q?LRdqgas58m7h9G2A/RlYzt8ApWGLIHKger2KZtkqNXCS6KSIG1HMQgGC?=
 =?Windows-1252?Q?LX80lMfMIpB1hjZ4LTzsRgKMWrMqGTCjWMsMPhZ8YGkhV84QEF37IO/V?=
 =?Windows-1252?Q?xVnfIJPBjlYgyh8BmPcSY5K1MAo7veukECqbXlz1a5siMtZ5u6EyKKa8?=
 =?Windows-1252?Q?tATYicAwMlXmjFm48lGSto6Dq9fgvwKxS2ciHXBkbQUGmWs11TI+w5v+?=
 =?Windows-1252?Q?rAS1rPw/u3eL69VdTyI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f96798e-3778-44f3-269d-08ddd4afce75
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 06:09:30.4344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sSFu1v7mn72gk4aoVeu88gE2oAevmumfNsoIQ5wz50rFnELAV0leW1dEqHyK9vSenxPGSUZVS1I2pk/2a/Aj+cFKCUj896SjziFr4fwlOpcwOm1Z9IGUHHmMCXDWiJD2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF829F3F944

> On Thu, Jul 31, 2025 at 11:39:58AM +0530, Hardevsinh Palaniya wrote:=0A=
> > Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.=0A=
> >=0A=
> > The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an=0A=
> > active array size of 1920 x 1080.=0A=
> >=0A=
> > The following features are supported:=0A=
> > - Manual exposure an gain control support=0A=
> > - vblank/hblank control support=0A=
> > - Test pattern support control=0A=
> > - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)=0A=
> =0A=
> ...=0A=
> =0A=
> > +#define OV2735_REG_LONG_EXPOSURE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 O=
V2735_PAGE_REG16(0x01, 0x03)=0A=
> > +#define=A0=A0=A0=A0=A0 OV2735_EXPOSURE_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4=0A=
> > +#define=A0=A0=A0=A0=A0 OV2735_EXPOSURE_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
> > +=0A=
> > +#define OV2735_REG_ANALOG_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 OV2735_PAGE_REG8(0x01, 0x24)=0A=
> > +#define=A0=A0=A0=A0=A0 OV2735_ANALOG_GAIN_MIN=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x10=0A=
> > +#define=A0=A0=A0=A0=A0 OV2735_ANALOG_GAIN_MAX=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 0xff=0A=
> > +#define=A0=A0=A0=A0=A0 OV2735_ANALOG_GAIN_STEP=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
> > +#define=A0=A0=A0=A0=A0 OV2735_ANALOG_GAIN_DEFAULT=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0x10=0A=
> =0A=
> I dunno if the TAB after #define is something being required here, to me =
sounds=0A=
> like a misplacement.=0A=
 =0A=
When I applied the patch, I didn=92t see those tabs either.=0A=
I'm not sure how they appeared in the patch, but I will correct them.=0A=
 =0A=
> > +static int ov2735_page_access(struct ov2735 *ov2735, u32 reg, int *err=
)=0A=
> > +{=0A=
> > +=A0=A0=A0=A0 u8 page =3D reg >> CCI_REG_PRIVATE_SHIFT;=0A=
> > +=A0=A0=A0=A0 int ret =3D 0;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 if (err && *err)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return *err;=0A=
> =0A=
> > +=A0=A0=A0=A0 mutex_lock(&ov2735->page_lock);=0A=
> =0A=
> Since you have cleanup.h, why not use guard() here?=0A=
=0A=
will update=0A=
=0A=
Best Regards,=0A=
Hardev=

