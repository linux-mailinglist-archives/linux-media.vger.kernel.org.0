Return-Path: <linux-media+bounces-40247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D70B2BE6F
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 902F87B8984
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 10:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1740D3451D2;
	Tue, 19 Aug 2025 10:05:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020141.outbound.protection.outlook.com [52.101.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9467226ACB;
	Tue, 19 Aug 2025 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597916; cv=fail; b=dRvyVu2I97M/wNq8CPzMkgLM5Als0xg7w8V0eJu0h0GCAY4NHJn52ce0Cmj9KUN/dEheKH5RnpTqJ1EMQhHXIOARYpjhLv7OFSG56j8wud4+drUzOsTrGJGngqrFqcD5qaBPXBL8d6tPrNqn2WxfjcsJrVHAbjyTFBCT9BAdu4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597916; c=relaxed/simple;
	bh=wE5nK+RIxf9z9p2+2FNoqz5d+cQclkzAm/NZI2+/OZU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rkd8Iz0j5E2Hhq5qbBvEErJsdZQe4eLWAyhmZMLQxkX5pZIOgqiHLQnMRWbx2UmiV+Oi18+TxuSWwwBys2FqjGT12vmEp1Toy/n/6nSCeMNzBTO4SjArqo0NTtja7hTdml+u1+qfHTszfcIrhuDcU7JnO0pZQ0WvrQQoIcRUrZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvWpPMGm4fR/ZKhNW026thgSriHW9pdUUN04GJIrLXt3JYHXmOG3ZraQeJoGw4UwlchnbEf7bizUeFgydDLgOX/cD69WKil5LgQhUhLngRAmmbuXy4q0QnqmUV1+h2tQSdiH58Ly0Kzbn60BebfpEWvy5hmGlT265ZOXJvQMT+kSOy72E/mQRjzYU64irBPaKMoRZ+mqXezV/ZX/QdHbxVQfDzf6STfhlN0tsOXo4VyVVIoXYd37kh8uSxR5ktI5ektawwmNTyMI6LOTQWOt0YSZ3nBizyIVtT1PpLV5DmKRRWpurtxM5ucvk9lhWlK587xdbUK7GZDSmDioKSNmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPuaTiB0oHK+XTVI59YmjTapxoFYHN495E/3WCX7inA=;
 b=sMvMoysXmTMyDAH5S93GoTwr6cCz5o3fH06ArO3DjQRLxHKLS69I++SemH0AnTimrd1pkQFWqpGltnkxctDl6yaAURIslQW6BsiIgqoFAamP2VW0CY9k9iL3DfhhkZmWQz4oad/9L7UVOE2t2f2KmrZcloGNmGzS17hCvei7J+VXFb9gIB7F4D0h3U9IITI6k6ZtyADJjINPG9bkc3N59/SWFZMXq8VaIzt8O8Rayc3ii2To/VdgdQx4/irwk+pCbjc6IAc6EcpcIOq7Q6Uf1tpkVGK5YoSmIDBx2GArJGSJFyfdpJa/D5noPGrq2nkgJsFMUH0r8sd53e85rSIY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN0P287MB1589.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:180::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 10:05:10 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 10:05:09 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, =?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>,
	Ricardo Ribalda <ribalda@chromium.org>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Matthias Fend <matthias.fend@emfend.at>, Arnd
 Bergmann <arnd@arndb.de>, Hans de Goede <hansg@kernel.org>, Jingjing Xiong
	<jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH v7 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHcCp48dyCgMd7FXUOoKNqWJfxtTLRodNaAgAFWxec=
Date: Tue, 19 Aug 2025 10:05:09 +0000
Message-ID:
 <PN3P287MB3519B968867C1F4A849F1D75FF30A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250811085814.111073-1-hardevsinh.palaniya@siliconsignals.io>
 <20250811085814.111073-3-hardevsinh.palaniya@siliconsignals.io>
 <aKMsQVJfVf6DBTkY@kekkonen.localdomain>
In-Reply-To: <aKMsQVJfVf6DBTkY@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN0P287MB1589:EE_
x-ms-office365-filtering-correlation-id: 5a779062-cd63-48a5-334c-08dddf07e193
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3WvAv7fZEX9CfZc32syTt4uEqjZS5UW7KL0tMhQTEAjHorKrM611q9aY3V?=
 =?iso-8859-1?Q?LJl4WEsnJPLPmVO3lOkKAqVpOt8OTQkOEzapC0lsHHPJHyfL4y1vWkiLKp?=
 =?iso-8859-1?Q?Gza4IO5VPxdevVqPFbsWb//V6kp/uCp5KWXUR2oNZDGRERKsv7sgR968ef?=
 =?iso-8859-1?Q?iyBYF6f3pdoVI6aSSq6XDkS8BbdyIK/U7IN7FbYUFq74bgwzEm+2INPD9D?=
 =?iso-8859-1?Q?O6x3X9f2t6CsJ54sWYtTpbxXmJajVsCO2jsUJn51q+A9y16nvyL5RlKBpt?=
 =?iso-8859-1?Q?JfGKqXiYNTsp4qjM4OZXjsVf/CF78fkLju/AMNiz1REnVy2G/Uz00GukAe?=
 =?iso-8859-1?Q?dTWJC4gNFpsMXg1HAhLH++404+QDN4y3cheGz9cYqeT48oE/PfmRt5guDo?=
 =?iso-8859-1?Q?WEOMivSDBUXvdZMJ5xkOYEidN6QPYCewV0Tm6VbZ5S/eGqCJm1+540rT7R?=
 =?iso-8859-1?Q?tkPSxquiR2eelfq3RytaOFLuHG5PL+VFPyGbdJ9+aisz+oglQe9tc5U99q?=
 =?iso-8859-1?Q?iWQkhxRxX7rClTj8T9buLsIN+qAhcBBxnF3b1HImsiHPbqW994q2lSefat?=
 =?iso-8859-1?Q?zYZitNGlBeoHugzK9jxD4NET2RNM4BEYTf1BSOeO2vv0uAU0dN6dhTX6dv?=
 =?iso-8859-1?Q?lMU4VNBaiWvPYrLD3zRod9wnGkzA4dD5QMLp9VA7xC7E2DnSnIMmihh9BR?=
 =?iso-8859-1?Q?m6krVcpWZ2IRvDXwaYOhFJ8nE3pAAxfpT3EV2bVL2hffY5/Hc+iP6Bqnps?=
 =?iso-8859-1?Q?efRY26mdeSgC/L2uYrlclSWlc1sjZ9ongbinSS8x3+kTP4qasycE42c0s1?=
 =?iso-8859-1?Q?+ORg3ayGYN4hzCdresQEKL5l8+3zT2VZRL5ezz8gpHYeUej9JPzxf83cSS?=
 =?iso-8859-1?Q?QaZPdmLNAEhw8es2CeDFd6q51XI4gnapOLyNzusSNh+OjqI3Wx+RUGpFIQ?=
 =?iso-8859-1?Q?yiaJcLzQoRUJxN+EPCLjLYVPxm3nqXqTommoNjJUo1EpmyhQPd+1nh+TY0?=
 =?iso-8859-1?Q?cx+EAj9Dsgrzs00eQ6sfzHWsICL/i0aMkuDC9ElwplbBATU92G23KCRK1C?=
 =?iso-8859-1?Q?toa638iZe81B2dQBstNtXPG9E8sIseYu/cH+ILpslUtgFxBMoPbmTVoXs6?=
 =?iso-8859-1?Q?YKYSHyJksJIK7ZKTBbtXzT6WcW9r8MzNeSnSNS3EjucufwMm6DfsloEnkb?=
 =?iso-8859-1?Q?G2lg+A8lcWWpg5ZLoNYQfJad+2tZfe1AvND/dWV/ORjv/tJLXZ4Rd1yPtH?=
 =?iso-8859-1?Q?gTm6WzJGfVLfz0Ho5HOL8o8JzBSiyEYL4j96vtV5xnoERAYEq7RwGH8/U7?=
 =?iso-8859-1?Q?1t04/e9Dryv4fuLVCzLpLOGZH0Hy+pCSzkpsebkJAClcNkkXsRKmAen9wp?=
 =?iso-8859-1?Q?xca4OWDDodUTzGiAyGiPzl8Zap//shFk2Mo21IpJyC4QyrmAntNmJdfFbw?=
 =?iso-8859-1?Q?ygBfSSe+I0ZbN0mdApqal95a98ElFF6ejZBkrIvjS2yzOdf/XPuPlkGzpB?=
 =?iso-8859-1?Q?p8U9L7JtrxdRl9tmBfqShhlAx1ReSTAk+w/1zrCTtfgg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4iNmh9FztFlWmYDhUfSF1vEsc+IJIfqYZnxs04dwDz2hMs99EKctEbIT+X?=
 =?iso-8859-1?Q?9UmTkfQdEC2mKVpembHbg8TVEgGkDd1O6XQ0yb3UB6D/WeOXP8SoN+fgJk?=
 =?iso-8859-1?Q?/OvQ4ZtI8vRMIvSLyV2W9y8aGnHJf6CzxnA3n77d41zQBCAzgukjT19GXu?=
 =?iso-8859-1?Q?n8RrDXNPxMAg98A8+LMMZgp965ulmRg8w87RnM44M0KFaA/qbh/t6m7bdT?=
 =?iso-8859-1?Q?S72bHKEUNEp5DD4ola7yccKSb0gfzI8Fs7xeYeNK+sN2J2wfldUGgdyHe6?=
 =?iso-8859-1?Q?N19YzX1kqCIfID5xI67YUIIX3Y9K8MU+TojSwt/ZEyWrHjO00SH7AvyP8Y?=
 =?iso-8859-1?Q?wFwJNrJrgAPfazGRiMGN9pGGsxJpgJD9CH290jWxeTMN9WIlD15l3x4KBg?=
 =?iso-8859-1?Q?kTbGM1Xoyhf1AcF0tUWFabL65Rx3U6rgrs1DXKkK83qoaABLWP15VRDRxJ?=
 =?iso-8859-1?Q?ArrQasGKBcSeoXNUEMfDQLP1Dz53NMqz2CxaNTxk8HV1wDSetQgL6Gv/3h?=
 =?iso-8859-1?Q?A7QZZFIinLbgU29zDeidW6i0pHxz4lTYQg77PJ3FkVeYMJf0pDRVr5JoCx?=
 =?iso-8859-1?Q?SW6Ac7NWCN2hOQtVZdvSSyHgK46+CqhvpUA3z5dJlPg5xCieFW3s6D2/d9?=
 =?iso-8859-1?Q?8ZAAUW7YN7BPQCq7XUh7Ef2dXYy/Frc7mTzD+uiUUUE3y0+BEk0tisHooN?=
 =?iso-8859-1?Q?aHhh2EjtYmNF/s4D1zfNYzPWM/r7gCB2/fgu9dDW0k98CA5aBIP3HCKk9E?=
 =?iso-8859-1?Q?NxkfiaYeOXzcPnEkcyp/fxQJVZcAJgyWuDIsE1RBqzEYlJE0sM0XOvqOIT?=
 =?iso-8859-1?Q?RDbjWNV1fclZg9EXhrZXeHCDBBIcIhNOAEtJknHBWNFCaCj3r6eNYW8+2q?=
 =?iso-8859-1?Q?GwT5j979MBpWWgx/pu7iyvqNzGLduzaes6bLOEd2yvG04KyTKdJsNI1Ztj?=
 =?iso-8859-1?Q?rHrO7953IVihTuAOs3ne7PVzlVl3+CVkF1BJc71WqeSWIweB88ByYtvsAz?=
 =?iso-8859-1?Q?ckGzBjIlYcGceP4CNvvzxxBnbOv71VwNmfNJ4kuJQ8l7kI4UzBpYu0PH/a?=
 =?iso-8859-1?Q?5xRlZDvG/PR83N5GoKf6hlZuvPDGnLqF3EDAYr9xrQGRVgZ97mVcp45bOr?=
 =?iso-8859-1?Q?JE0KGByIOlk5VpPF7NugZa8SVZ5RhNWCv51jqA0FRUhCauTimKG6ItzPD1?=
 =?iso-8859-1?Q?GwG43woCveFb5Gp5XtRUtkLiEAny6VTJzR6CMZGvLPaC+aA6VACXtjIInY?=
 =?iso-8859-1?Q?TPPmDiN52wVDyqpAOBaWMmGNOnQBoNfZ8VtK2tXj0XOcuY4m/xmkPtM3cG?=
 =?iso-8859-1?Q?O7AQYnnEDF1lquIjRtPZFvnK/+JgntdoBE49nwph5trGZLcazyyTnEXv7l?=
 =?iso-8859-1?Q?l72xaOObPlnQNCPjc4psaBZymdCBXMWMXvhsr0nDydCngu5HTZ8EDlubZT?=
 =?iso-8859-1?Q?ra4aWDPORFdnL5z4juLQVnLx56zMfozcLeAG0ZsRwbmFdU8Lbg90WpkZ3A?=
 =?iso-8859-1?Q?0BNdcuiX8yoYGt1TmxPPuArwAJRcCT7V6P/h4sansONJjQvCdKn4p2nCCJ?=
 =?iso-8859-1?Q?O31DD0f61a5tidJaeVgmA1XfOnxkHAjJU9XCZx40bF61Ow6/U2MEd5XEHL?=
 =?iso-8859-1?Q?fYBRCO4dxX8gsWd+19ilQVEorM3hDzKTeLan86JUBs0KWxI605IKQ/AhTr?=
 =?iso-8859-1?Q?3tsEhuqqgvRjNFm5cnU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a779062-cd63-48a5-334c-08dddf07e193
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 10:05:09.8407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVqeZBIdfIZ3wkN4ULQVeIBraGTLiukOgxDhbzVzRlKEDd8RuCeZjcAA4a5ZhiVcnO6Xh8UYegA27eZBqgVP77AaT9eLEF/VpX1pxuHmkoj8BDafxK92+SB3w4GpQrR9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1589

Hi Sakari,=0A=
=0A=
> Hi Hardev,=0A=
> =0A=
> Thanks for the update; a few more comments below.=0A=
> =0A=
> On Mon, Aug 11, 2025 at 02:28:05PM +0530, Hardevsinh Palaniya wrote:=0A=
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
> >=0A=
> > Co-developed-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=
=0A=
> > Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> > Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.=
io>=0A=
> > ---=0A=
> >=A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 =
1 +=0A=
> >=A0 drivers/media/i2c/Kconfig=A0 |=A0=A0 10 +=0A=
> >=A0 drivers/media/i2c/Makefile |=A0=A0=A0 1 +=0A=
> >=A0 drivers/media/i2c/ov2735.c | 1073 ++++++++++++++++++++++++++++++++++=
++=0A=
> >=A0 4 files changed, 1085 insertions(+)=0A=
> >=A0 create mode 100644 drivers/media/i2c/ov2735.c=0A=
=0A=
...=0A=
 =0A=
> > +=A0=A0=A0=A0 { OV2735_REG_CLK_MODE,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0x15 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_CLOCK_REG1,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x01 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_CLOCK_REG2,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x20 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_BINNING_DAC_CODE_MODE,=A0=A0=A0=A0 0x00 },=
=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0xfb),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x73 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_FRAME_SYNC,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x01 },=0A=
> > +=0A=
> > +=A0=A0=A0=A0 /* Timing ctrl */=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x1a),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x6b },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x1c),=A0=A0=A0=A0=A0=A0=A0=A0 0=
xea },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x16),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x0c },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x21),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x00 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x11),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x63 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x19),=A0=A0=A0=A0=A0=A0=A0=A0 0=
xc3 },=0A=
> > +=0A=
> > +=A0=A0=A0=A0 /* Analog ctrl */=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x26),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x5a },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x29),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x01 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x33),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x6f },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x2a),=A0=A0=A0=A0=A0=A0=A0=A0 0=
xd2 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x2c),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x40 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0xd0),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x02 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0xd1),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x01 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0xd2),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x20 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0xd3),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x04 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0xd4),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x2a },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x50),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x00 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x51),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x2c },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x52),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x29 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x53),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x00 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x55),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x44 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x58),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x29 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x5a),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x00 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x5b),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x00 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x5d),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x00 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x64),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x2f },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x66),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x62 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x68),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x5b },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x75),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x46 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x76),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x36 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x77),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x4f },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x78),=A0=A0=A0=A0=A0=A0=A0=A0 0=
xef },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x72),=A0=A0=A0=A0=A0=A0=A0=A0 0=
xcf },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x73),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x36 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x7d),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x0d },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x7e),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x0d },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x8a),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x77 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x8b),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x77 },=0A=
> =0A=
> Are the names of the above registers not known, or what's the case here?=
=0A=
=0A=
These are timing and analog control related registers.=0A=
I do have the register names from the datasheet. For some of them I also kn=
ow =0A=
the functionality, but for a few I am not entirely sure how they impact the=
 =0A=
image, so I have left them as-is. If you prefer, I can replace the raw addr=
esses =0A=
with the actual register names. =0A=
=0A=
> > +=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_HS_MIPI,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0x83 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_MIPI_CTRL5,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x0b },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_MIPI_CTRL6,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x14 },=0A=
> > +=A0=A0=A0=A0 { OV2735_PAGE_REG8(0x01, 0x9d),=A0=A0=A0=A0=A0=A0=A0=A0 0=
x40 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_MIPI_CTRL3,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x05 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_MIPI_CTRL2,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x44 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_PREPARE,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0x33 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_R_HS_ZERO,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0x1f },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_TRAIL,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 0x45 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_R_CLK_ZERO,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x10 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_MIPI_CTRL7,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x70 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_ANALOG_CTRL3,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0xe0 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_VNCP,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 0x7b },=0A=
> > +=0A=
> > +=A0=A0=A0=A0 /* BLC */=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_BLC_GAIN_BLUE,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x77 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_BLC_GAIN_GB,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x77 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_BLC_GAIN_RED,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0x74 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_BLC_GAIN_GR,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x74 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_BLC_BPC_TH_P,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0xe0 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_BLC_BPC_TH_N,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0xe0 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_GB_SUBOFFSET,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0x40 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_BLUE_SUBOFFSET,=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x40 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_RED_SUBOFFSET,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x40 },=0A=
> > +=A0=A0=A0=A0 { OV2735_REG_GR_SUBOFFSET,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0x40 },=0A=
> > +};=0A=
=0A=
...=0A=
=0A=
> > +static int ov2735_page_access(struct ov2735 *ov2735, u32 reg, int *err=
)=0A=
> > +{=0A=
> > +=A0=A0=A0=A0 u8 page =3D reg >> CCI_REG_PRIVATE_SHIFT;=0A=
> > +=A0=A0=A0=A0 int ret =3D 0;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 if (err && *err)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return *err;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 guard(mutex)(&ov2735->page_lock);=0A=
> > +=0A=
> > +=A0=A0=A0=A0 /* Perform page access before read/write */=0A=
> > +=A0=A0=A0=A0 if (ov2735->current_page !=3D page) {=0A=
> =0A=
> You could check if these are equal and return 0 here if they are. Up to=
=0A=
> you.=0A=
=0A=
If these are equal, then ret already remains 0, so it will return 0.=0A=
But I am fine either way, whatever you prefer. =0A=
=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov2735->cci, OV=
2735_REG_PAGE_SELECT, page, err);=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!ret)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov2735->c=
urrent_page =3D page;=0A=
> > +=A0=A0=A0=A0 }=0A=
> > +=0A=
> > +=A0=A0=A0=A0 return ret;=0A=
> > +}=0A=
=0A=
...=0A=
=0A=
> > +static int ov2735_power_on(struct device *dev)=0A=
> > +{=0A=
> > +=A0=A0=A0=A0 struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
> > +=A0=A0=A0=A0 struct ov2735 *ov2735 =3D to_ov2735(sd);=0A=
> > +=A0=A0=A0=A0 int ret;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 gpiod_set_value_cansleep(ov2735->enable_gpio, 0);=0A=
> =0A=
> Isn't enable gpio state already low here?=0A=
> =0A=
> > +=A0=A0=A0=A0 /*=0A=
> > +=A0=A0=A0=A0=A0 * Ensure device is inactive (PWDN high) before enablin=
g power rails.=0A=
> > +=A0=A0=A0=A0=A0 * As per datasheet, the PWDN pin (named 'enable_gpio' =
here) should be=0A=
> > +=A0=A0=A0=A0=A0 * pulled low only after all power rails are stable.=0A=
> > +=A0=A0=A0=A0=A0 */=0A=
> > +=A0=A0=A0=A0 fsleep(3 * USEC_PER_MSEC);=0A=
> =0A=
> This is an unusual place to have a delay in a power-up sequence. Is it=0A=
> implemented according to the datasheet?=0A=
=0A=
You are right, the enable GPIO is already high at this point.=0A=
According to the datasheet, the PWDN pin (mapped to enable_gpio) must be hi=
gh =0A=
before enabling any regulators. Since this GPIO is active-low, driving it l=
ow =0A=
keeps PWDN high as required.=0A=
=0A=
The extra fsleep(3 * USEC_PER_MSEC) was added as a guard delay, but it is n=
ot =0A=
mandated by the datasheet and can be safely removed.=0A=
=0A=
In Datasheet =0A=
Power-up sequence:=0A=
=0A=
	  |--------------------------------------=0A=
avdd  ----|=0A=
	   <-T1->=0A=
		|--------------------------------=0A=
dovdd  ---------|=0A=
		  <-T2->=0A=
			|--------------------------=0A=
dvdd  ------------------|=0A=
			 <-T3->=0A=
          |---------------------|=0A=
pwdn -----|			|-------------------=0A=
				  <-T4->=0A=
					|-------------=0A=
rst ------------------------------------|  =0A=
=0A=
=0A=
> > +=0A=
> > +=A0=A0=A0=A0 ret =3D regulator_bulk_enable(ARRAY_SIZE(ov2735_supply_na=
me),=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov2735->supplies);=0A=
> > +=A0=A0=A0=A0 if (ret) {=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(ov2735->dev, "failed to e=
nable regulators\n");=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> > +=A0=A0=A0=A0 }=0A=
> > +=0A=
> > +=A0=A0=A0=A0 gpiod_set_value_cansleep(ov2735->enable_gpio, 1);=0A=
> > +=A0=A0=A0=A0 /* T4: delay from PWDN pulling low to RSTB pulling high *=
/=0A=
> > +=A0=A0=A0=A0 fsleep(4 * USEC_PER_MSEC);=0A=
> > +=0A=
> > +=A0=A0=A0=A0 ret =3D clk_prepare_enable(ov2735->xclk);=0A=
> > +=A0=A0=A0=A0 if (ret) {=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(ov2735->dev, "failed to e=
nable clock\n");=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_regulator_off;=0A=
> > +=A0=A0=A0=A0 }=0A=
> > +=0A=
> > +=A0=A0=A0=A0 gpiod_set_value_cansleep(ov2735->reset_gpio, 0);=0A=
> > +=A0=A0=A0=A0 /* T5: delay from RSTB pulling high to first I2C command =
*/=0A=
> > +=A0=A0=A0=A0 fsleep(5 * USEC_PER_MSEC);=0A=
> > +=0A=
> > +=A0=A0=A0=A0 return 0;=0A=
> > +=0A=
> > +err_regulator_off:=0A=
> > +=A0=A0=A0=A0 regulator_bulk_disable(ARRAY_SIZE(ov2735_supply_name), ov=
2735->supplies);=0A=
> > +=A0=A0=A0=A0 return ret;=0A=
> > +}=0A=
=0A=
...=0A=
=0A=
> > +static DEFINE_RUNTIME_DEV_PM_OPS(ov2735_pm_ops,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 ov2735_power_off, ov2735_power_on, NULL);=0A=
> > +=0A=
> > +static const struct of_device_id ov2735_id[] =3D {=0A=
> > +=A0=A0=A0=A0 { .compatible =3D "ovti,ov2735" },=0A=
> > +=A0=A0=A0=A0 { /* sentinel */ }=0A=
> > +};=0A=
> > +MODULE_DEVICE_TABLE(of, ov2735_id);=0A=
> > +=0A=
> > +static struct i2c_driver ov2735_driver =3D {=0A=
> > +=A0=A0=A0=A0 .driver =3D {=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .name =3D "ov2735",=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .pm =3D pm_ptr(&ov2735_pm_ops),=
=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .of_match_table =3D ov2735_id,=0A=
> > +=A0=A0=A0=A0 },=0A=
> > +=A0=A0=A0=A0 .probe =3D ov2735_probe,=0A=
> > +=A0=A0=A0=A0 .remove =3D ov2735_remove,=0A=
> > +};=0A=
> > +module_i2c_driver(ov2735_driver);=0A=
> > +=0A=
> > +MODULE_DESCRIPTION("OV2735 Camera Sensor Driver");=0A=
> > +MODULE_AUTHOR("Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals=
.io>");=0A=
> > +MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>")=
;=0A=
> > +MODULE_LICENSE("GPL");=0A=
> =0A=
> --=0A=
> Kind regards,=0A=
> =0A=
> Sakari Ailus=0A=
=0A=
Best Regards,=0A=
Hardev=0A=

