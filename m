Return-Path: <linux-media+bounces-28646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4383A6E811
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 02:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6C8316F918
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 01:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6565A15442A;
	Tue, 25 Mar 2025 01:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Ub/VMZMa"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021102.outbound.protection.outlook.com [40.107.42.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E48864D;
	Tue, 25 Mar 2025 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742867091; cv=fail; b=kk6h/EMzL9gRXBpBu4VNeQEJ7Y7TZQQ6NALUyPuY+WZwC8WkldJhFOvCCGOeMqg3iqvAgJsF4H2vlyolIBU0XIB+CMABr9oy3MJZhhOng8gZcREf6PUecYqfrX5FrquvVT38qJRnUyv8tc2u95+bOz5QVflL1ubX5f6qzifzyxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742867091; c=relaxed/simple;
	bh=AeoNDbR5QOJkkR0zCWM+YiNe0MkURp8V7XxdjIETUg4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JrAwwdyM61DpYWfYaBDxdertM+ZPQBYy6Z9C5ReebWmBMVYLTdlUG9CMmjoR+4dLYY6/OZMeNjqNeVhfW9ePjl0deIYVPK9eJXQkYX0prjV93B7SyaMvcjGSLTIdDLHV9bq4Iqzny+Lgd1lVJciEbHSvc8XrGC0t4W9y5LoKksw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Ub/VMZMa; arc=fail smtp.client-ip=40.107.42.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dW0S4lv3yXpgBL9F23bXYP0JrFs8Jqmq0qYYc3GtyBjalQtrsqIkzAZw/AY9CaF+/WOiVx2EzkwcvcpnYg6ELu+Y/KgFVVDecIWjBVj3TtLpm27xiVAO7RDJ0LTOVOdRkMYAh2y4WwaO+GBv87GtR/xPl3qjKcWMzysz90yazvpaKf+DvwjEZ5+PCcsZtMFPra7FxAvrTKn9ri9OvwxpXS8Fx0d6+H71dHtrkjCnWzSqP9WBaPS5aHonLUHsLytTjWRa2T4MFDhI9w/Xl/Tpt8PdHRFP+bx7KxaQpBmPQUaWtthAwIYSG05UH0mNn0Pth0XDW2h8H6akttu/nb0TnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qY7q/x/4zhNGUBhO16khEGBW4iNy7vrWJ2/4jCb1c9s=;
 b=Q669QAORhIXnjlxaiZkiHvsq89MqNzVRO1g85RGJJ3xXc+KPt8pZGdkdrVlqOeBffy8evOe/XcUbEoHY31A0bjlWrt68sE4yLfvSoqTUjvQJv0GDNWAkRMWQFmIRJAPm/u+BDxbnIHf28Z5BlWwSRjtrOGUSK9dD6G4N8d50kWF8mI5sLnh8d4QUItLp4g6N+CKBlWR0Ogr78Rt/wefWgbDbnbBtsmrMLnQnfvNocS9DraCfI02J4/3p2tMCzhyAeIELiFpoxADkRmoFQIUm+Rv12FEdhmxMtwUMDXmTLBT+YT/DCFCt76KtJKjKtdUXFGQlPPiEXqVVrOhNINIfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qY7q/x/4zhNGUBhO16khEGBW4iNy7vrWJ2/4jCb1c9s=;
 b=Ub/VMZMan/72o5O8oyw6k4qWZQVJ/foGbUvMZ9rx98wEI5hRInu/WD2sLNs8j1Ats9SOoiJ+xgPXEudAKm1n8evsRoN7q9VgEV49biyf9Z7n9ibvAlLfRot2L//MSTBsEOaXb0qQeUUachamZnyCYtWHjLGSBvaqFcu8iluLtZA=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1826.KORP216.PROD.OUTLOOK.COM (2603:1096:101:fc::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Tue, 25 Mar 2025 01:44:46 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 01:44:46 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: jackson.lee <jackson.lee@chipsnmedia.com>, Sergey Khimich
	<serghox@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: RE: [PATCH 00/18] coda988 video codec support
Thread-Topic: [PATCH 00/18] coda988 video codec support
Thread-Index: AQHblPXyB80+UIHWeUmToYZYhD0/8rN2d9IAgAyslHA=
Date: Tue, 25 Mar 2025 01:44:46 +0000
Message-ID:
 <SE1P216MB1303A1C402D9305A69F890E6EDA72@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250314152939.2759573-1-serghox@gmail.com>
 <SE1P216MB13037B97F714AD1B5BB63BD9EDDF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SE1P216MB13037B97F714AD1B5BB63BD9EDDF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SE2P216MB1826:EE_
x-ms-office365-filtering-correlation-id: f1b84dff-3b0f-4499-b9eb-08dd6b3e9f77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZpBgQq8tp4wT4am+L1824QGSqwOxJQFI35g9ZI8rV1MHeTgWo/a4R5X7A/9O?=
 =?us-ascii?Q?VlAsHz5T/oGHCMNPbk3YJhl3jraKcgfW83FwqrpbfUW8/XoMVM1CYhec6ZqN?=
 =?us-ascii?Q?N4XNaoTtFsj0Abe9hU4LU7ZQ9Fwiu3kQXHmd1ZMvQfW7sUguxMtebY2VQvwY?=
 =?us-ascii?Q?20HBp/Z0n0Gq66Ma+Jv4PgWFhW0c9mUFiiCQX8U4lY03MrJ0CHsReS/OE3n1?=
 =?us-ascii?Q?14YHTsO6PX3KXJqKpY0pRVfX6ydyo3m9hJ3S0BPQoRPTrLDRGExXHHJq8+Iy?=
 =?us-ascii?Q?V270SEPZDrDbZmnDS380ry+6N8CQXf5egjk/vR759cca3OzU2PZUw97PYNj3?=
 =?us-ascii?Q?6ahf83y8lpBYl4NFGJcAbw1+sd8Ns/FukTFn44KUrnpfVxYHFZJHuDdOmORQ?=
 =?us-ascii?Q?F+Q9l2FLy1CFrxKqF2wZp7L13NZjFSoR423+CvYj6B179G8HFJAAXUVv7B3j?=
 =?us-ascii?Q?POUcrJrEfyeT0bizAj5w3BOcN+2oYs4HFbiEe0kLxqvX7ybFebDB5MToN8x8?=
 =?us-ascii?Q?lpZYz0qb24TVqlWL2uTO+p7P0+EoQI0++4phxj/zO9A1JZJ2zFacjayuC8h3?=
 =?us-ascii?Q?UppY0qVgKkXm/gODWQ0ohf54NWGRuxAcW04Mptm+134SZx0E+GqSlZqLt28G?=
 =?us-ascii?Q?ab0CjHTArDgDEipMV8ANfx3qlYVMm+gECYHzf6qShD2lni7RzzY8RrsNQJxY?=
 =?us-ascii?Q?XGhfTIWdDAuWU4UmZ+O24CmHLAo36rasKQT/fQzugrPP/MdGRagkvid8uT1s?=
 =?us-ascii?Q?rHaNlUn4RlqMOLudJINXhE7h+/URvacKhbklIVU2o5E4Z/rz7fhXrWjXCyWP?=
 =?us-ascii?Q?j3hQpfh3zgoYYG7ah1BcH2envpsc/99wMC6e6//DiSRRqzBX/XZmpOHfo6Da?=
 =?us-ascii?Q?rl7kmMiM+N6MDAzybwaiyw3ksF9zlnPY2oDf1jHk6j025MPgJHA+3xs2ZsV6?=
 =?us-ascii?Q?v2/MivLxyUXI+mn0mcu/wdkJ9+T8vYTzGzXhBsYw/SjBNXf/U/38ctL9j7hW?=
 =?us-ascii?Q?AXcFBpV5FOdbbz/qpr5nFnefuaYMMpRz4eT3A+txQi2Im4wdUv+plWvX0RmR?=
 =?us-ascii?Q?tIwOAV/tgZDzLxrcQCIn+N1dH8fBT+eYnRRg+tMObVntSCOrTzjtk0ZCWXF6?=
 =?us-ascii?Q?rhvkYdkearqanTQOx7shzaq8jvyF0W9ubR62AhRhrSyFxojjVx1wb3ly1yvA?=
 =?us-ascii?Q?5QQQx4WkaO4McIH67hfqhBw4Wz5Yz9fMQUbugVv/AzPgtVfmqd0X8wDuoY35?=
 =?us-ascii?Q?z38Keg8dNPgvMuwGJnKvOvFHiyON30GgsB/WzIeW71DAVfj1AAVYdJ1xCpji?=
 =?us-ascii?Q?BHI0TpAiNEDq5cqL40KBHNm8aMGUYxACiudpP9y6dRzrQzocOCDJr5lydadu?=
 =?us-ascii?Q?nVnCaTK5eN2JeuzyNB1SMsEyhyUmAqj+2Nr4R28+17u/Js8ReGOvwsyFXaU6?=
 =?us-ascii?Q?E0Cb3bv/zySoPXh1q31k8XxJ8zPJ0eCT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?onlnQuVibr8EkJLRIuJ8dj9vvl9j9Nbimd2m/ICQudkQp0v7R/u7kGQdiCIG?=
 =?us-ascii?Q?sPAM6FtT4kpy0Uq7oR6xbscc+pa8HtXFJuUzRYn4cKj2/8IMozA5YDD/luFw?=
 =?us-ascii?Q?gYugzHrcMaGca9nK41c5hkIyl4LkZ9+HV4xmVHr/kRURaJG+OWliIpMJMdpk?=
 =?us-ascii?Q?0JJgej+FGppUh66+Ny/936tARXWk2haKoouh1/qjrgQv98dSsp8IJuxoc9mi?=
 =?us-ascii?Q?fdsAo6Z1stut8/xoC34Mn9cmDuducz2ETvR+zXmIF2ERTAGtEj+qRZUSLjfK?=
 =?us-ascii?Q?U3aLR0Ng8sMl/qYoiu+s4Zj9lGRaYVY/6KphTt7OxZT1NhKOeAf2JnfRn8gN?=
 =?us-ascii?Q?ipLHGxQ+3OwA8uqOs8sfCG4bzWLmZ4RRF+QFRo/CSNi7ltX1Re1yLTsjIeh+?=
 =?us-ascii?Q?Vt80gB+5bX9A3G9FDBFv/He+WPK2DCUFU3ECgQpN7r6pQljZml4Tc9dZV1gI?=
 =?us-ascii?Q?iSVBLvcdU9vY3t4mv+ZL1A7T/1zz0yaZL4Oqcq2qpREA1F7pTCnvu6HvU88N?=
 =?us-ascii?Q?yfGEpACpASWo4VisUxg5dmVjq/e2IS1asrcREXT+ewqqSag64Iji57PqSDLI?=
 =?us-ascii?Q?DjRl30cXIMii4ud+v5oPl5P3OvMaGIk6X8Y0YbHHrd57YvCQ89uyoKBoqMr2?=
 =?us-ascii?Q?x/fT5eY/Yi6AUc09VK8WbisJ3WEmkhGAgw6t8ED733fKOlEw2J0ZmgimtwhI?=
 =?us-ascii?Q?NLW+5P44BL8UvwRX6kyE14Jd/FvMdc5DuvWrABtCFmgFNxT2s6DUSmulTeVx?=
 =?us-ascii?Q?HlmWI3xoSoe3NR6rm2qthwnMf/0jzpDwx4z0sncG6hH6kDnilVYz7v3ubYhv?=
 =?us-ascii?Q?YWbooAXby+HR6Z48opYpAID/CQwDsxh2TMLpf9dZr4dIis6FbCpKQsWoLl/u?=
 =?us-ascii?Q?XOd1AM1U9hXCeCmksJyPLYG+2FXOX0/+ZezxbO4RUTfNHTAzr4zFZWp32mIu?=
 =?us-ascii?Q?qNptEdiuvFtH7fSxW6XngEVU3IpFAkzpsfp7kxzBJHJHQzy5eeETQ9fBt0Kv?=
 =?us-ascii?Q?ZQTNuSYmktfsGvypaQ/Cum0NVXe5Ewv24p7Idvtv7FVF0sDl9mCC/EbR+lYS?=
 =?us-ascii?Q?k8R2aaS461WwYtRcieYXMKn63rJZk4OBrZUo8FA9lDs+w6E0QWyRHSXccY+E?=
 =?us-ascii?Q?SRrHaa4M2sV14F/EhnJApgt9pOL86L5qAsdQTB9YMzjyFFpMQUQfE0fEEInr?=
 =?us-ascii?Q?7Sg5wPuZKAZhuMEw05N1vEU+CGGsqjPLQh4l6sRrokn7iniqROzJTs2tChLl?=
 =?us-ascii?Q?cYYv2V1r/ziOXkTeUVCws3won0ZChUriwWX+zv0zcb6sIpMmjDXbwl1grqhW?=
 =?us-ascii?Q?/iQ7mulsQbzq4rbIC+c0kMRa4KhuZf0duYcXcfqB9+c3QNMl6qkk/9pJ5ycc?=
 =?us-ascii?Q?YqvV/c8XWT19JYgUQblHXIibHqUUb0emcZIfO8wZbqEz2NwtZoHGaM0Tg0YC?=
 =?us-ascii?Q?x7vpIn/nwaZX0W3Mfi2Bz56VWYH2v6bUH4KiNmTSM1EtMv7ySccdZrpkn96a?=
 =?us-ascii?Q?sVKnOy+VSAm8URj/wxAAgv6rUKpI9tVIzgWbhQphwLMrY84WDg+5yPmtIEa3?=
 =?us-ascii?Q?q1HFKjz/QMEmZFopzXL/SEPOlUVyxsyNkYZiYlG8cwyLe5hY9xBplqyu79lV?=
 =?us-ascii?Q?mA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b84dff-3b0f-4499-b9eb-08dd6b3e9f77
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 01:44:46.3443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M8eOowzlMHkZsHCwuKcBmy9R2tg4OtX93TUHAJckQkuMGSJiJspg6WLVkmHqObhFJ//PD7wrtMXqU22I6PT8JRZkhGd5Ps0neEKfuGZikYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1826

Hi Sergey

I checked your result.
The all VP8 test cases should be passed.
In case of H264,   all test cases should be passed except these "CVFC1_Sony=
_C, FM1_BT_B, FM1_FT_E, SP1_BT_A and sp2_bt_b"
But your result has some fail or error for the H264 and VP8 decoder, Can yo=
u check them?

Thanks
Jackson


> -----Original Message-----
> From: jackson.lee <jackson.lee@chipsnmedia.com>
> Sent: Monday, March 17, 2025 9:13 AM
> To: Sergey Khimich <serghox@gmail.com>; linux-media@vger.kernel.org
> Cc: Philipp Zabel <p.zabel@pengutronix.de>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; linux-kernel@vger.kernel.org; Vladimir Yakovlev
> <vovchkir@gmail.com>; Maksim Turok <turok.m7@gmail.com>
> Subject: RE: [PATCH 00/18] coda988 video codec support
>=20
> Hi Sergey
>=20
> Can you share the result of fluster test for h264 and vp8 decoder?
>=20
> Thanks
> Jackson
>=20
> > -----Original Message-----
> > From: Sergey Khimich <serghox@gmail.com>
> > Sent: Saturday, March 15, 2025 12:29 AM
> > To: linux-media@vger.kernel.org
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>; Mauro Carvalho Chehab
> > <mchehab@kernel.org>; linux-kernel@vger.kernel.org; Vladimir Yakovlev
> > <vovchkir@gmail.com>; Maksim Turok <turok.m7@gmail.com>
> > Subject: [PATCH 00/18] coda988 video codec support
> >
> > Hello!
> >
> > This is the implementation of the Chips&Media "CODA988" video codec
> > support within v4l2 driver for coda. Support for the following codecs
> > was
> > implemented:
> >  * h264:   decoder & encoder
> >  * h263:   decoder & encoder
> >  * mpeg4:  decoder & encoder
> >  * vp8dec: decoder
> >
> > Support for the following formates was implemented:
> >  * yuv420p(I420)
> >  * yvu420p(YV12)
> >  * NV12
> >  * NV21
> >
> > Also the following features and fixes were implemented for coda988:
> >  * special config for mem_ctrl
> >  * special config for encoder header (sps and pps)
> >  * special set profile_idc
> >  * special set RC config
> >  * special set QP
> >  * special set slice mode
> >  * special set Motion Extimation (ME)
> >  * v4l2_ctrl for h264 profile
> >  * v4l2_ctrl for h264 level
> >  * v4l2_ctrl for h.264 RC mode
> >  * v4l2_ctrl for h.264 skipFrame
> >  * v4l2_ctrl for h.264 i-frame min/max qp
> >  * v4l2_ctrl for h.264 p-frame min/max qp
> >  * v4l2_ctrl for h.264 entropy mode
> >  * v4l2_ctrl for h.264 8x8transform
> >  * v4l2_ctrl for h.264 i-frame period
> >  * v4l2_ctrl for h.264 Access Unit Delimiter(AUD)
> >  * v4l2_ctrl for h.264 me x/y search range
> >  * v4l2_ctrl for h.264 intra refresh period
> >  * v4l2_ctrl for h.263 intra/inter qp
> >  * v4l2_ctrl for h.263 min/max qp
> >  * v4l2_ctrl for mpeg4 min/max qp
> >
> > During adding support for "CODA988" we also did some extra work
> > related to refactoring and improvement of generic part of C&M coda
> > driver:
> >  * Improve error checking for probe, irq-handle and etc.
> >  * Update work with resets
> >  * Replace hard_irq by threaded_irq
> >  * Remove double setting of stop flag
> >  * Improve some prints
> >  * Fix loglevel to avoid performance failure
> >  * Fix support of MPEG4 levels
> >  * Fix setting gamma for h264enc
> >  * Update default velues of QP for mpeg4 I/P
> >  * Other minor fixes
> >
> > Sergey Khimich (18):
> >   media: coda: Add print if irq isn't present
> >   media: coda: Use get_array to work use multiple reset
> >   dt-bindings: media: coda: Fix resets count
> >   media: coda: Add check result after reset
> >   media: coda: using threaded_irq for 0 (bit) interrupt
> >   media: coda: Add reset device before getting interrupt
> >   media: coda: Add fake IRQ check
> >   media: coda: Add log to finish_encode if buffer is too small
> >   media: coda: Fix max h.264 level for CODA_DX6
> >   media: coda: Remove double setting of stop flag
> >   media: coda: Print size of encoded buff in other place
> >   media: coda: Fix loglevel for seq mismatch print
> >   media: coda: Fix support for all mpeg4 levels
> >   media: coda: Fix handling wrong format in coda_try_fmt
> >   media: coda: Use v4l2_ctrl to set gamma for h264enc
> >   media: coda: Update default velues of QP for mpeg4 I/P
> >   media: coda: Use preferred usleep_range than udelay
> >   media: coda: add support coda988 enc and dec
> >
> >  .../devicetree/bindings/media/coda.yaml       |    2 +-
> >  .../platform/chips-media/coda/coda-bit.c      | 1114 ++++++++++++++---
> >  .../platform/chips-media/coda/coda-common.c   |  430 ++++++-
> >  .../platform/chips-media/coda/coda-gdi.c      |  149 +++
> >  .../platform/chips-media/coda/coda-h264.c     |   10 +
> >  .../media/platform/chips-media/coda/coda.h    |   41 +-
> >  .../platform/chips-media/coda/coda_regs.h     |  157 +++
> >  .../media/platform/chips-media/coda/trace.h   |   16 +
> >  8 files changed, 1703 insertions(+), 216 deletions(-)
> >
> > --
> > 2.30.2
> >
>=20


