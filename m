Return-Path: <linux-media+bounces-40520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CADFAB2EECE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4687D17E37A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 06:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E302E7F3C;
	Thu, 21 Aug 2025 06:52:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021076.outbound.protection.outlook.com [40.107.51.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD5C2E62D4;
	Thu, 21 Aug 2025 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759130; cv=fail; b=Fj0RrMNDFsmkyHlLq4ERvTtgaBSOdfSqK2erELTHV3pa6zcj25gh9dayYR5o0YVOIKcArpGmj4i3JKDNxHFXXTsWlSrOD1npYgWDN5cyEm+VHFAGfncV2J8s8criRrmBRd5XUz2CeA+or87guq9Ws84JWBmBoP2uPSNDIR62GjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759130; c=relaxed/simple;
	bh=O3ravhEp9r3v78RR6euWZOfrxL+6pWvXC8vGoupAydA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b/ICs2hbb7ldMGEltAr9vf0CZDuCpfHmLLRSSUUgGYibvW3eADzF390C123PGyQN83I907raiDDDXXy8C24Xp3MQE+fv3AaBk2wD4mNLIxvofcUPTVUnPnQhJjbscb2LSodMZTvxT/DChtJG916k5/OsiEIRIMdHP+0IMmarmCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyRHZPgenE26H4KJ2cdIBmumnEo9jaNEViNn/q2cHdtlF2rd6o03OpUwRK9WzA/ho3ZWHeJdP8w4+GNIKkHqWB9Z6cmQMDuZdcMucrOcxJnAAyOCXL4x+C5c59H7s08hZC7hs8XpZTSJA/wJsKlOdQFpSgdtjSfdLU5SYslKYUn95qmOWgrw9cx19zOY22Jmyr1BlQ7Ta34Ic3hZGevjj8wo0kBCKGSQcKR0q/CLhyYvTB6rGnfOebxfC6bqVotbM7D/5Zbvu7QJmSOAUFuLg5OrMEDpTjb1qOjuVB+tCgOD+a+3g8ABTBctaivGfyGFwhOt8IlRxQDL/2eUEV5Ydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3ravhEp9r3v78RR6euWZOfrxL+6pWvXC8vGoupAydA=;
 b=aPx7e9C13lS342OM3Q6kWfd1/DahFDgQe2NQGZExS1/Y2dk9J+qnRApon3dyCBK0NTzi0KIeE5d6mFUs24gdUPK82OHnZ/gPNqJ7zaaC1xoeRfRBaYI3DkfI4TNXT/kifMyWpTQSUPZFkpwyVIVf3AwrB56tpFUziFqhaO8Oge6UtcpHbsXVmF73hXTz+AV+0LpukvzzqQz80Hm3Gvhg+mLNyhLOVhu99JKQlyf3c4FzwDObVnuPi30BUfqdAESP5kUfdav0q/V1i9wKSEY0WWHbaVBI5vCYs2rw6vvfAvF4DnIo/7kfYFeK3g6L1pNwZrJOPwiJzIV4h0BIAwjRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAZP287MB0054.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 06:52:03 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 06:52:03 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>
Subject: Re: [PATCH 2/2] media: i2c: Add OmniVision OG0VE1B camera sensor
Thread-Topic: [PATCH 2/2] media: i2c: Add OmniVision OG0VE1B camera sensor
Thread-Index: AQHcEiRUzwCOcw2kgkO2XMJcpFmTfbRsnnHC
Date: Thu, 21 Aug 2025 06:52:03 +0000
Message-ID:
 <PN3P287MB1829A6077AC67BBBDD30327E8B32A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250820224646.130270-1-vladimir.zapolskiy@linaro.org>
 <20250820224646.130270-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250820224646.130270-3-vladimir.zapolskiy@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAZP287MB0054:EE_
x-ms-office365-filtering-correlation-id: 510925ae-14ca-4e23-0247-08dde07f3c5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MKuGauyMKHnn5wT6mG9QZ9TZc776Kf/0zVxIyurduytIw9XkJs7TTBBJet?=
 =?iso-8859-1?Q?W3d22MFdOQlEtXyDjbEu+zQDx8gQMYhGGRpy9EFJBxCHCXmts19dDt1Dfk?=
 =?iso-8859-1?Q?cjv0dyTg7IeuM+BfvSCFyjTFmh3S4A62J+KfodrsTETw6Um6Yo3z1CNDWP?=
 =?iso-8859-1?Q?ygPbxDk9sFZPVaJhe1w+EFZtsOGvhXc25ujf04OyebbEiKlFCVzGX8CIeK?=
 =?iso-8859-1?Q?NyWw+4CuP+SYOGtMWmXsiqjZil7NFzSifr84C2RfYd7RzkU8TTz7mVtvqL?=
 =?iso-8859-1?Q?g9wqgqbsxU6UYnQqiJwpHUaUrzmZQdOoPEPpurM2gccWlrt21+uFnoA4qA?=
 =?iso-8859-1?Q?MnwztqI3Zn4QbZu4PvY3toc8tXEek/zsQXWQyayaHYV7XBKkEUnN6Umyn/?=
 =?iso-8859-1?Q?EZvt2TihucZFbFYCM/WhL4ophW5rBKcuTlSQBncIszSH5qo0QekvaBf0Hl?=
 =?iso-8859-1?Q?Hhz2qNSQMca+H+iVD9N5WNvTEG7IusCnHAMmLRxyR8qqE0+GGHWeqsTguS?=
 =?iso-8859-1?Q?tW4+1Olf4/sT8iU/WCFkKs1vE6g0JbXIPYiV8W7dULnG+aYBlAQXVfWCVf?=
 =?iso-8859-1?Q?FiVawe/OQCMtBVE+r1J+6U1uNdl+Qg0ixWGhe1FJm3DKlH76/6iSqrL1DB?=
 =?iso-8859-1?Q?t5DQHJw55eA9g56FcWWyQxytfCBsESyxiKLzPAAKpFKqZ5IGWO96dovdbN?=
 =?iso-8859-1?Q?nau9Qx9izzuExdONLcqMfhpnRNY4/J1kMSKRIEB1NHg3YcmTLbDMh12HhL?=
 =?iso-8859-1?Q?uYiDTPv5nDYIg8w7cTOC4TaR8zjDOQP5sii+ycKQNm2ktKoICaRhz1HonB?=
 =?iso-8859-1?Q?J0XKBSKHJBEgZU9+Gs4gvvZhDV82TtF+nFe2s4b55xqlACEvdsPtdON1UT?=
 =?iso-8859-1?Q?uxP/KZhQgr+Na5gHptfVdWo6ZvwCMFx8yNLw3BrSDHqkGE9utRDb20RlkP?=
 =?iso-8859-1?Q?5toeiXbSECxyEpJaDvKc0F0O0cUhYUKMewXT8dmDxAaWJZLfJkRtZaJbzo?=
 =?iso-8859-1?Q?ztsGDH0K9C+zsciXj5CklJ/NrGTOHKa8dYGCGRUGaxrk+z25XEouzER/SN?=
 =?iso-8859-1?Q?RgtAsnwc8Rig9ZpwKvSl1igBowaOIUcQtFbCJZeI9IvZ3e5Dv9N/d0i3zY?=
 =?iso-8859-1?Q?sZ9UnYiDB7r1GA6VjdcWcqjLh608XZMR4b1EMmNOkj3fsA/RBGf/yyhbgB?=
 =?iso-8859-1?Q?d8q9Lp2sHaFrhDGa5t2Z7emp7r9drxjVFvnsTkm5XkVikdcbMK//Mpygad?=
 =?iso-8859-1?Q?2o3s1gt1TOx9NcPis1WF7JyBUy+yZEq0o+KRNd2+NwXmVQDY0/nw/DFtKC?=
 =?iso-8859-1?Q?bowpObKjdtNL48lw8vLJPdUKkpQnMZ9gTraRhypHfL5IGINJgCYuxUWvbI?=
 =?iso-8859-1?Q?k/PtCPQ1iH/Rdh5YZhjFUq0Bl19LgBGNpWAJ2Fn0tlC6pTnxXJkWEEltjz?=
 =?iso-8859-1?Q?0MmLO18EnzJijEzvXMBugHa33BT+bCD0EMXbWy9ea1CNPe1NLoKCl37H9i?=
 =?iso-8859-1?Q?pTfmXnGzRd93iRja1rW2K3WiEawr4b+dqxdjlhz9B8AA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hoKrNmS0UGwbceMMcDCx+y2xStGOVfR+O4bjG+dQwrRD+/xiApPLFDcadF?=
 =?iso-8859-1?Q?JJl53UTs08TDdw0eUGML0yMKFOB7aPyN30fNYV7OPXT7fciNZEbnW/A2CH?=
 =?iso-8859-1?Q?1n5E/QMcZsliPBy1yVob8cJ3JQSl8UhTw8mrG11APTMEM3vomQKYuebpK5?=
 =?iso-8859-1?Q?bDuU53fBNyRXV+bmEaP6RMeHVKRapQZ2maTv2MPY8OLQKip5yBYOd8sclY?=
 =?iso-8859-1?Q?I4erznpnPiNc5YunFQRRYhTpAVvxtIdfyAEzkj0wtPwEDa+bZBMIuGjnAe?=
 =?iso-8859-1?Q?G+y4P/UIf4iFxWabaMSdpiCN3jeQqSOh2GNtOUgRo8Y3Sdn5S3w/bEJS+c?=
 =?iso-8859-1?Q?IzXryofMeOoam4E+uZutMKAVAZ/Yoibsnbk8Lzkmyqyr5pK/h1SQj8Zpxo?=
 =?iso-8859-1?Q?yyfNoOAb1sJFk63izlEUidBrCSaJMsRB4g4fgl0MTUmeZGjaxgDBstNGT0?=
 =?iso-8859-1?Q?mibe7WKpuIsnps87W8Ktnw6iCzBUphiXYdjLjq0gOSDIgf+8fgiMOlLb9a?=
 =?iso-8859-1?Q?SPeoEXdIRP5L6eGO+vc1cFUxKvVb/S/jEwDiQ4dVwyNkHEbT15Nmpa70wr?=
 =?iso-8859-1?Q?O2W/UcqgClsdvwI9lxn7hvbMYK4Y6Eie2q9RgLB+qR9EoSdg84GAgwSgmr?=
 =?iso-8859-1?Q?1DQ+6uQ1yJ0Qetti7JTZmhe0TZuniqU+slGfggd1sdBi5pa0k1KMHCRW6n?=
 =?iso-8859-1?Q?5Hjae7OqZB15mv3iyt9BJ6U3TNiaGxX8SQ2gH3+FUucBwZRKuiRZaGMNJi?=
 =?iso-8859-1?Q?wHyukCiInYegWiGgTonP4OghIvWb2VsApJl3BBD3Rc38hmo/s2i4xDSL/I?=
 =?iso-8859-1?Q?OJnGWQdz4DP5FOfCYeQgjkkEuAdwVMjJaLUQLAlh2XueDq6g6efqVN9a6D?=
 =?iso-8859-1?Q?e8isiaILU99+QfBXFe6glugzqA7hp4z44n/1ELIrkCb9GdoMeKvgcK4Qx6?=
 =?iso-8859-1?Q?E+dpFZONXEUSQScdFcfs9ufm2MlJV2CzJ+rwohK0aAYEV2hzWDjpCOEQsN?=
 =?iso-8859-1?Q?VCatpJ6DXNBwr/0uPJcPf9o2LfyJyJsFCoXInHnzYu1ZSB1h8D/iNB89W5?=
 =?iso-8859-1?Q?aD5sfIpAb1cdvmC96Nkc6QAEYpZ7zXG/dUl2KfPh6941KxMyrt4Mxg3QzB?=
 =?iso-8859-1?Q?noAiWEmWQklgTjmuGIjS9ZWQ7FLNqe/c0sNvIlHHLB+LG1wFEmKdSh9pQQ?=
 =?iso-8859-1?Q?WMu9VxZ2uT2bL6gOqOmByv9jfkPEYqBdjg+V4JRNlSLQ/Rxprub+jMn9dQ?=
 =?iso-8859-1?Q?l2SEzj6/sAFvvaCSn623L95h9PwLojhv7Ie6KaEoYpsXMxpu3ilTPapWlh?=
 =?iso-8859-1?Q?DOyl8mT5W0E6Gqjj52zegdRE1phpy/rbC167Jf8PQa9cXfc3z1Vr8jD0Pk?=
 =?iso-8859-1?Q?YQytqFFMQczW0zEX5NRCgQ4iFh9zwQCxkmSqTjoRkJgWuG6+KtmVSO3EJW?=
 =?iso-8859-1?Q?aW70h4RbntgMsubpgTjgTseB9KTZr5r7PsPRV4AnanQL30UsosnVjqkNQz?=
 =?iso-8859-1?Q?OHEu/de0t7ylPlR1NRw0R/OsOkk+ZHpcgDi2VXPdnsZlwimfQIYfR+/6oX?=
 =?iso-8859-1?Q?8j5L8TvDE7zjTZn0LSEZjo2MYNSGbaJ+PrSwZuyP9WV5rk2aRyvWhCO3Y3?=
 =?iso-8859-1?Q?CghT7NF79WbJvE7DGR0r0zt45/h4+VO68GajvZIutvnHH9GMIQOwcXXA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 510925ae-14ca-4e23-0247-08dde07f3c5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 06:52:03.4385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nvo+dqSWTWtXsXp61ih8285aWAbHtKFxIg+9hKvBA7Nl32T08OJqerojExr+jz2oEfoc2UIyjetmfTr3IHNvoBDqFCvBef/3RpmmVj9MM3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0054

Hi Vladimir,=0A=
=0A=
> OmniVision OG0VE1B is a monochrome image sensor, which produces frames in=
=0A=
> 8/10-bit raw output format and supports 640x480, 400x400, 200x200 and=0A=
> 100x100 output image resolution modes.=0A=
>=A0=0A=
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>=0A=
> ---=0A=
> =A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 8 =
+=0A=
> =A0drivers/media/i2c/Kconfig=A0=A0 |=A0 10 +=0A=
> =A0drivers/media/i2c/Makefile=A0 |=A0=A0 1 +=0A=
> =A0drivers/media/i2c/og0ve1b.c | 858 ++++++++++++++++++++++++++++++++++++=
=0A=
> =A04 files changed, 877 insertions(+)=0A=
> =A0create mode 100644 drivers/media/i2c/og0ve1b.c=0A=
>=A0=0A=
=0A=
...=0A=
=0A=
> +static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] =3D {=
=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30a0), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30a1), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30a2), 0x48 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30a3), 0x34 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30a4), 0xf7 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30a5), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3082), 0x32 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3083), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x301c), 0xf0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x301e), 0x0b },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3106), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3708), 0x77 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3709), 0xf8 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3717), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3782), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3783), 0x47 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37a2), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3503), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3509), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3600), 0x83 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3601), 0x21 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3602), 0xf1 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x360a), 0x18 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x360e), 0xb3 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3613), 0x20 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x366a), 0x78 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3706), 0x63 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3713), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3716), 0xb0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37a1), 0x38 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3800), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3801), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3802), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3803), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3804), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3805), 0x8b },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3806), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3807), 0xeb },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3808), 0x02 },=A0=A0=A0=A0 /* output wid=
th */=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3809), 0x80 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380a), 0x01 },=A0=A0=A0=A0 /* output hei=
ght */=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380b), 0xe0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380c), 0x03 },=A0=A0=A0=A0 /* horizontal=
 timing size */=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380d), 0x18 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380e), 0x02 },=A0=A0=A0=A0 /* vertical t=
iming size */=0A=
=0A=
Do you have the datasheet for this sensor?=0A=
=0A=
If so, it would be better to divide this array into two parts.=0A=
Currently, all of these registers are not related to the mode.=0A=
One part should be for common registers, and the other for=A0=0A=
mode-related registers.=A0=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380f), 0x38 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3811), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3813), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3814), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3815), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3820), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3821), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3823), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x382a), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x382b), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3840), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x389e), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c05), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c26), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c27), 0xc0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c28), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c29), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c2c), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c2d), 0x50 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c2e), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c2f), 0x66 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c33), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c35), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c36), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c37), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f52), 0x9b },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4001), 0x42 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4004), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4005), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4007), 0x28 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4009), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4307), 0x30 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4500), 0x80 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4501), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4502), 0x47 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4504), 0x7f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4601), 0x48 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4800), 0x64 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4801), 0x0f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4806), 0x2f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4819), 0xaa },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4823), 0x3e },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5000), 0x85 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5e00), 0x0c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3899), 0x09 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f00), 0x64 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f02), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f05), 0x0e },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f06), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f08), 0x0b },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f0a), 0xc4 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f20), 0x1f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f25), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3016), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3017), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3018), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3019), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x301a), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x301b), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x301c), 0x72 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3037), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f2c), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f21), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f23), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f2a), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3665), 0xe7 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3668), 0x48 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3671), 0x3c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x389a), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x389b), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x303c), 0xa0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x300f), 0xf0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x304b), 0x0f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3662), 0x24 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3006), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f26), 0x45 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3607), 0x34 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3608), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x360a), 0x0c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x360b), 0x86 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x360c), 0xcc },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3013), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3083), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3084), 0x12 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4601), 0x38 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x366f), 0x3a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3713), 0x19 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37a2), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f43), 0x27 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f45), 0x27 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f47), 0x32 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f49), 0x3e },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f4b), 0x20 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f4d), 0x30 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4300), 0x3f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4009), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f02), 0x68 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3700), 0x8c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x370b), 0x7e },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f47), 0x35 },=0A=
> +};=0A=
=0A=
...=0A=
=0A=
> +static int og0ve1b_probe(struct i2c_client *client)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct og0ve1b *og0ve1b;=0A=
> +=A0=A0=A0=A0=A0=A0 unsigned long freq;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 og0ve1b =3D devm_kzalloc(&client->dev, sizeof(*og0ve1=
b), GFP_KERNEL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (!og0ve1b)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 og0ve1b->dev =3D &client->dev;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_s=
ubdev_ops);=0A=
> +=A0=A0=A0=A0=A0=A0 og0ve1b->sd.dev =3D og0ve1b->dev;=0A=
=0A=
This seems unnecessary; drop this line.=0A=
=A0=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 og0ve1b->regmap =3D devm_cci_regmap_init_i2c(client, =
16);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(og0ve1b->regmap))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(og0ve1b-=
>dev, PTR_ERR(og0ve1b->regmap),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to init CCI\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 og0ve1b->xvclk =3D devm_v4l2_sensor_clk_get(og0ve1b->=
dev, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(og0ve1b->xvclk))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(og0ve1b-=
>dev, PTR_ERR(og0ve1b->xvclk),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get XVCLK clock\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 freq =3D clk_get_rate(og0ve1b->xvclk);=0A=
> +=A0=A0=A0=A0=A0=A0 if (freq && freq !=3D OG0VE1B_MCLK_FREQ_24MHZ)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(og0ve1b-=
>dev, -EINVAL,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "XVCLK clock frequency %lu is not support=
ed\n",=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 freq);=0A=
=0A=
...=0A=
=0A=
> +static const struct dev_pm_ops og0ve1b_pm_ops =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 SET_RUNTIME_PM_OPS(og0ve1b_power_off, og0ve1b_power_o=
n, NULL)=0A=
> +};=0A=
> +=0A=
> +static const struct of_device_id og0ve1b_of_match[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 { .compatible =3D "ovti,og0ve1b" },=0A=
> +=A0=A0=A0=A0=A0=A0 { /* sentinel */ }=0A=
> +};=0A=
> +MODULE_DEVICE_TABLE(of, og0ve1b_of_match);=0A=
> +=0A=
> +static struct i2c_driver og0ve1b_i2c_driver =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 .driver =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .name =3D "og0ve1b",=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .pm =3D &og0ve1b_pm_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .of_match_table =3D og0ve1b_o=
f_match,=0A=
> +=A0=A0=A0=A0=A0=A0 },=0A=
> +=A0=A0=A0=A0=A0=A0 .probe =3D og0ve1b_probe,=0A=
> +=A0=A0=A0=A0=A0=A0 .remove =3D og0ve1b_remove,=0A=
> +};=0A=
> +=0A=
> +module_i2c_driver(og0ve1b_i2c_driver);=0A=
> +=0A=
> +MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");=0A=
> +MODULE_DESCRIPTION("OmniVision OG0VE1B sensor driver");=0A=
> +MODULE_LICENSE("GPL");=0A=
> --=0A=
> 2.49.0=0A=
=0A=
Best Regards,=0A=
Tarang=

