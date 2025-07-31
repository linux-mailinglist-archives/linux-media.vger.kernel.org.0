Return-Path: <linux-media+bounces-38690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D330B16DF9
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 10:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 630A41783A2
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 08:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89A525A2C7;
	Thu, 31 Jul 2025 08:56:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021091.outbound.protection.outlook.com [40.107.57.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A0E1482F5;
	Thu, 31 Jul 2025 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753952167; cv=fail; b=Ud2KcAVCk6lSoFMkFK5U9144WewVvMsOJi/OaU1suJkZ4qvG3P0QYxASU5JBzC0EXjUPX+JjxfZmrx2bMkp0mGMTo6F2ina/vtO9T9UHj5rGSsZ4ocVv2ZcM2EhFugjSxXHTJDYZLMr8i7eXDVL7+yy2Uq+xYSUIE8boBlAFHkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753952167; c=relaxed/simple;
	bh=n8mfl2Y2W5wZjmZRoB+7urzNLyUy7z6YyKJUoyFQYZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tDayaDTe91qGU4dAmxImWYT2+c/8whFmt1LS6NTw1VluOSkj2VuUSMRY7kaJ2c5JJDf31AWrpuz28GjBzAJ/0Ql8brF7zK5CMByIANI01jK7b3sLo3j0X1x4ROysNF9cGyYNpUPrEArMlPDhmcDuaimVrqlfWPaieln6VSWiph0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+PssjepcE4dkGN7UcVcTB3y8Jkow7iuDGsaeTjN/izXAhPt8SsgVtDvaJD1UNkc3QbZEIpw6gnVc4FEBBiF9Q0v7pKxwGRbCNwtgxGDSHWEuoy41szWhiqcI+mmCmek7P6eKqO3rxlxSyW/hV7uQ6nYguTVh2fJtX0CGFFae+Edg9NYmTKrkkNfLSv1clSw0aB9XF+8QtHw4eiOwhBqQf6VRthQ5QpeIci3YrXZ1nNxQWXEDCTJPlbDE/OOUYF6GFhpOYZH0OwyEekjH/g0Jmfx6F2hqOdrN/zST/mxBp/23xsr6VPVfahg55YyHRhUPALeQ8zNdFf1681sdnzLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8mfl2Y2W5wZjmZRoB+7urzNLyUy7z6YyKJUoyFQYZs=;
 b=IUivICAqLGqSZv7aTQPMbaclKANNXUaEekHrGHJdOj3GcLN73GB7o2bdIuuNJ2XRqoAYAreHvbdemBcqXvy21uatNvR6UGbApAeCq6dyukIq56qR/roPV5SqWw36Ap+aEgZFZpknQNd3eZqpEXox6K5mXJtedMmLJ227BBFiwJoxcvv0sc6Qzw2SPZOEQpYGEmOAoLFwVE9dy3EvJ/aVBf/CvuSrMXU5amnJL3ASWZHbfyi/Zi0OR7SVkGC/WBDs6QKLnSQ8DXPATvtTEII7LNnvf9KJ0j5iHX4efDf9eNa4vubIzfhfRanRFOtOYzv6j9YVuYn2GImXq68Yg6lfLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MAZP287MB0660.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 08:56:00 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 08:56:00 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Hans de Goede <hansg@kernel.org>,
	=?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Matthias Fend
	<matthias.fend@emfend.at>, Tarang Raval <tarang.raval@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Jingjing Xiong
	<jingjing.xiong@intel.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Arnd Bergmann <arnd@arndb.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Topic: [PATCH v6 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Index:
 AQHcAeHa9HY47390u0OJlhyWta8pG7RLwMcAgAAF2LOAAAFkgIAACEOYgAADZwCAABolrA==
Date: Thu, 31 Jul 2025 08:56:00 +0000
Message-ID:
 <PN3P287MB35195D0D5B5EE972B885F189FF27A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
 <20250731061004.5447-2-hardevsinh.palaniya@siliconsignals.io>
 <28ba8a6d-a180-485d-9bfd-d5ac8783831d@kernel.org>
 <PN3P287MB3519C0DB4796E4D73411A549FF27A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
 <28ae1ac9-68b3-470e-9ec9-982370839207@kernel.org>
 <PN3P287MB3519479DEF57D78794788B1CFF27A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
 <39a65748-3946-4459-8701-a923bdfc500c@kernel.org>
In-Reply-To: <39a65748-3946-4459-8701-a923bdfc500c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|MAZP287MB0660:EE_
x-ms-office365-filtering-correlation-id: 1cfc6492-0374-4a24-6edc-08ddd0101276
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?RyG7dxjjNFGXsu5XKKV7lLsDtPpAlUYwQAOWWRDuAaxIFxJSE3agtFHdfP?=
 =?iso-8859-1?Q?pkc9815XAoLKVzOwwAc/U8xy9Arh3GkImWuSFZW7GSsQ86OSLUEpPPiUjU?=
 =?iso-8859-1?Q?VhrNHIoIbd0bvD4XBRrC8aWrvB9NzsEDkcqrUEXFOONiewDVpbjVPrkvoy?=
 =?iso-8859-1?Q?ZhVkxN49S/XGN1XXGAU7ieqL5EA2xsuQ27B7Eu+Z87MD7QJv4PlZVqMIF+?=
 =?iso-8859-1?Q?emovv7Usc+yDRRuwgvh60DMoshea8xRebz/CdmD5QG0WHkRBR82p/Ng40Q?=
 =?iso-8859-1?Q?/UsqbbC0+haSRjucfLaewy/i+Uy8V/cH64LLs/Njoa9q6lhUxb3ZOslp0+?=
 =?iso-8859-1?Q?eqiaNvoV9nJP31sa1+LYMmnJqr9spivcJElDf/RJ2DYeE3joBIqkYyWJ2D?=
 =?iso-8859-1?Q?hJccX22DnGC+FM6kF7WU9Hh1cQa4f6p4lMeQaWCQaPbG5COYnjEa6+kGbk?=
 =?iso-8859-1?Q?pu+sY/8YzKXKqfPLlCZCDV0vMZtMDG34xRxz0QI0zchzSEkJP4f1jo8+iY?=
 =?iso-8859-1?Q?GyAmMH9xdhMG/WR1bIHPuGiaUjOzPBq+k/vMfCvQAOCeAVGYY4WWjWfN7H?=
 =?iso-8859-1?Q?osllMyHnM1oeoQuZo85y1Gb3ijb/LUTnCJzY2c8syqj4EZ50vcABlhtQ5G?=
 =?iso-8859-1?Q?UD3Df8/yJz2tZojBPcerRtCTN9feokE9uifVT9R8yO5TE03NmHcl/oHSlH?=
 =?iso-8859-1?Q?9MJzIGdPsZSK0Pn/iSDWXhHkMek39PCHAKhRDmWUI0flhwvOu6gB25UFJf?=
 =?iso-8859-1?Q?4K53npnEnpBCs3D5glav/86FxUC25RQIb1DaN02lYMjvO6muwfM6AjmCQq?=
 =?iso-8859-1?Q?S26vq52H12Xfq6Qrti1n79bSDmT3Wu43OXpodvur3w2OqFUny2DMYmx6aR?=
 =?iso-8859-1?Q?HdcHiD6IKNAccsWWCORAbqB/0aUhKTrK4E77+obIDJLvGLf/XjqRwhLvoW?=
 =?iso-8859-1?Q?1VBTSYG15xM8/4FXLs21XtQlpPVKvWg746aakZ5mGwyJW4cZJYxYYZ1q+f?=
 =?iso-8859-1?Q?YZM3WW0NcScT+/JnGVQDBNNFxe/gkLoFfjQK+xeQhHsHEhjuxDSNfYm2d7?=
 =?iso-8859-1?Q?S8dyAY6EAon4eiw/e9orVA60V3xmqDEEiPzAg2TZrSvM0bKhbphXu6hK/K?=
 =?iso-8859-1?Q?ej81Lvw/xxUkYXcrDSe7SFG3nhkxcIFxjlZMcqe15l8MZK2Gg7ILfm9Dbp?=
 =?iso-8859-1?Q?kM61cxM/WZqPcnrS4nb5UhM7HYJhiXAQisKBD05hc3ZpV+iUvZP5Hqb2CI?=
 =?iso-8859-1?Q?o0pT/xLyLFJ5sxQwOJtZLzSffgstLZ8iMuWInEAiwbHRO4+AdwB1/FYHnQ?=
 =?iso-8859-1?Q?kgsugWZ1ZbRoVW/O1WemvndRl1YqSrAGtyJs8Ddt2JIytR4TINWC0vV80F?=
 =?iso-8859-1?Q?thfdXDyfZ3+vnP6bL/Mz0LDidG7U35FG34oj3UvOrT85YzacsQd8R4678K?=
 =?iso-8859-1?Q?NtrzIL+S2kAEtOOGBs2Foh9VeWQptYKLpJseirmGKztthp90amJQsqOSJj?=
 =?iso-8859-1?Q?5P2LGGIeBxwOSfrfdHFFN16h3tAbbc/1xOl/FHwS8gJQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZwupaY8vG83ycZ+D9JRJ193m1VK+JKvN/bGMguxO+FaqprD82VYBJAE7Ms?=
 =?iso-8859-1?Q?byl1/pg6t2HRqNLb2gox8rHVCwZLwsDh0N0A7wKvn4R7+jgzbcR28FkfBY?=
 =?iso-8859-1?Q?P6QOduHGoaCFC3oIsRwQK8tgOznafOt5LpK1v/dEK+sz9FzKe4DC859p/s?=
 =?iso-8859-1?Q?2X5rvbVv8D45fhc4SlGj5uyWhsfmP3eG0x6uMIImDBCIy3wmWNTugrfbbT?=
 =?iso-8859-1?Q?fRG9NPq5g1GrQsGs+Xj7CZUf7hz9D2hLCKbQ+vfzPwIcP9oYCtLTmmU39p?=
 =?iso-8859-1?Q?aLYVRLhd7eitSJ27phtF4EHbQeIWYCcY1+VD6cYA9clypPfdSyWqOm0mhG?=
 =?iso-8859-1?Q?HuzdasuoCIlGjuBJHgPe+Rm9xDo1usL2H8RdSCs+kR9iA8FpoxRaiIjXaJ?=
 =?iso-8859-1?Q?2o2CtmXHxni+N8vGdDd+vI1O44LgYrf08gf8R1WHiI7A7pzDQbCmld0ItW?=
 =?iso-8859-1?Q?185vy04wo7rpXdEwLcWWx82zJQyNBU9XGUb/ypDPETYhut4f9AK3dhwOPl?=
 =?iso-8859-1?Q?Pj1jJQUuyXr8e7CKxiP4fCfN7NFwUgxgaRoCZHCJQzSc8mPaU19Iyb1a2H?=
 =?iso-8859-1?Q?m2LacRrzEWTEuPnwh1uXD7wmfYoHQFPSnVO8o+JI7Wog+UrSgn+WJOj3xU?=
 =?iso-8859-1?Q?eGrJ34ecWqx6ksc9yC81YX/JvzEUa899w/YSJoEvh1Kbwzm9BskciGBxCm?=
 =?iso-8859-1?Q?CSbeNEvCgavyRxUrE75tCanI5v9vcGsckYj21wEdQiWoM9P+38XbR+8via?=
 =?iso-8859-1?Q?cXDzSxRC+oL0rddSRG/uX0CDg4ghxS4fxgRI/aXAGXNjG2k7B01nLLqkzY?=
 =?iso-8859-1?Q?FrM6ESXam3Om7B+0Y0yM+QZaUvFxnaNH6joDLkpKKXobtfPeBkCyvlDdUL?=
 =?iso-8859-1?Q?uzfyYjcnkGikuJOiIOh5HyoGpAzyLG9w2vj4L4Bt/2tViavm5U0Tn2NYBC?=
 =?iso-8859-1?Q?HvJ+rGXq+dBGUGy+R8QUYEMDJbqa38/oVzse8vZ6RsH8LrsgHo2/JMWNDm?=
 =?iso-8859-1?Q?uzOUg0KPNjkHy0LNslkPwnH9c6ExWRocUBSCERZOKYOKMsOg0UaxPVz9wy?=
 =?iso-8859-1?Q?r3809XuZ0tBlLZu3odaoDyi5KYopPyhFBPuquednU106BvtrD+zvI/ta3H?=
 =?iso-8859-1?Q?8ofnrNeFQpfAB/cPyYPgQU6VIZDAgC5/H4uNJCea4Ifh9BWDuG4dOfQv2r?=
 =?iso-8859-1?Q?/+KNbS15kfNbRgvKS3pex6JMkmq5sCdCaINWvSkiWXn9/+o+7qAZ1RlLnj?=
 =?iso-8859-1?Q?zStWSMur03Gu9RFGBU3QI0wJtI17QrLWkerWdtsmBi6wxBfD5O/DEPkDTp?=
 =?iso-8859-1?Q?qkNapynktavLO/GMRqVOlH30kB+KU9XDO7J4oR8Dpz5XO6mhw5Sf3we+VH?=
 =?iso-8859-1?Q?uUTPt4wJ/jh51lmrlshNENksIdB5pbMI7NVRuG+7irKuPM3GA+ABfot0kA?=
 =?iso-8859-1?Q?uOfhc2k8m3vAHh2RI+RVP5Hgf3maicEnVoU1m/Rmd+GTRJcA6+mJJhDFRc?=
 =?iso-8859-1?Q?hCyAFTakXlka20TCKtkyxe64CuHv4jEBeEc0eU0I+1VYzwgg0e+zz1HW94?=
 =?iso-8859-1?Q?r7IFks9Mayso+jVDAr0lLU31ktUWXTTnHeaguTV0ohyb9V392EdmScD7Qc?=
 =?iso-8859-1?Q?DkjVwBfK4CfliGNsyMwIbtvNmbyes+ViBKcscfnWV/uPsP5hSdEXx0/Q?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfc6492-0374-4a24-6edc-08ddd0101276
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 08:56:00.4130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xYvwZJyJM2SLVkPK8Lum+28/8VHt0qUbMEovy8ucpaOFdEnuCFOnTz38IlvF65OB/ocDyCrv6JlX7pOlAxS9z/Tyd+hH4oTzaZMs4Kgu2oq73YIWFntfIkJ+zA5qFrdd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0660

> On 31/07/2025 09:10, Hardevsinh Palaniya wrote:=0A=
> >=0A=
> > Apologies for repeatedly disagreeing earlier. In your previous response=
, it=0A=
> > was a little hard to understand that you were saying the property is al=
ready=0A=
> > there and being duplicated.=0A=
>=0A=
>=0A=
> "Otherwise this is redundant - validates nothing, changes nothing, does=
=0A=
> not make the code more obvious."=0A=
>=0A=
> If code changes nothing, it means it is safe to be removed, because it=0A=
> has 0 impact.=0A=
 =0A=
Thanks, now I understand your point more clearly=0A=
 =0A=
Best Regards,=0A=
Hardev=0A=
 =

