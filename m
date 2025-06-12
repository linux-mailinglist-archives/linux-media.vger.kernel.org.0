Return-Path: <linux-media+bounces-34617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D957AAD7019
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 902FA3B2805
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 12:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3486823ABA8;
	Thu, 12 Jun 2025 12:20:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020143.outbound.protection.outlook.com [52.101.227.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944491EC018
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730816; cv=fail; b=oQT4NrJZgNz5sn/si4vIM3VSn8KoPHA49ZYByt20gGSxqrEzOoVZeTGinfvCSEIlVT8qU5hUBgG6lTKF/OEDv9fi0x3euyM/wyEeQERgVHhLVafY5YqxrGVfRItCa9d7deqIC/fhE3ZjqVpVtATC83lFVXC1VZSIn5dfRbRJdxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730816; c=relaxed/simple;
	bh=xTo5670+lXcZhjxZFmdvXmrmXtKkSnfpZA7p3WbuUu0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CklajBWv856z0LIH0UnzzW+yw8Mk0UuLZHxpKOrbib3Gyb4r6I2LuWyvaLj/joFmYxahb8yjErhDtiBNuKSvBb7asiop93ijUEcXrM0q69ZgQq1aEiKes270uj5dKHPWOarHKnFYVGotyxz5CUetYu2Q1t4ojzELQZ8oAz9m4ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDLkArAjFqAN7rB2P9IXF3eronN8/RrHraMCq5Fxf1ROkTC/+KZqrQMGEawpC264EbrdUOfCZTRmd92BJ9L/TTpW0d7EcCkXU7TvY/ypN5QA64/RsiszzgO/XBnXrMxWb07QOeWOLiuPdtx+BwRzcGtPEyKEhzQoShXeQpi6H4yEHNZvdt1CTNxIHia6c2xCDSilTB/b6si0c6M7r6EbB4N903TfbI+QliRkKWGPaRdA3A0Qf4mt6sdV2+srl9pnnqOaBnhuKcNMoMwf9htD/h/68uHyYmuQi5S3fjfyJcqLmILH5kwxJ9RrV13JGTYnasvvXQkFWW2fEDzdh8QDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTo5670+lXcZhjxZFmdvXmrmXtKkSnfpZA7p3WbuUu0=;
 b=M0HQMHz79Wq0wkUAQdgwlg2HoS+nxymW1L2mIEOn8uO5a074GRs42vMWJZA0rkyQ4kPo/vXJppTOlu0+cbIxGLcX4x5BKhXbutIuU7sA3kXlCbTq2JATyZdQh/PS4PAGZjfP5ehjNGHgdtLvH0CzZ7jeQPkLiyHfNTLB1EyDHp3NFwTwIevR4fWvxp/34Xpm2z6BdlKShQ2De/A7eH4CK+3zY/2B2pb1NC7I1UuC6mdk2uI6DaMksAMyXihi+vrZEKN4nuqfDQmOAwftmbRLBwcQ89PLmiL0I+xoKih6KxazxJQ6ReTff4otUgsALKvD/B666dZl4lB0/hdFrMtnwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0366.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 12:20:09 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%6]) with mapi id 15.20.8835.023; Thu, 12 Jun 2025
 12:20:09 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, "open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword: bdma_(?:buf|fence|resv) b" <linux-media@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Subject: Re: Issue: Stuck After Successful VIDIOC_STREAMON with OV5695
Thread-Topic: Issue: Stuck After Successful VIDIOC_STREAMON with OV5695
Thread-Index:
 AQHb22gYf5eLLq3cRku7ZKJP51USUrP/QKwAgAACjAuAAAwegIAAAtA2gAARGwCAAAXJtw==
Date: Thu, 12 Jun 2025 12:20:09 +0000
Message-ID:
 <PN3P287MB182953D6ADE9AC03591DFD888B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References:
 <PN3P287MB18297E8A4F568F064D19A1D18B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250612092406.GA25137@pendragon.ideasonboard.com>
 <PN3P287MB1829C80107E00CFDBD3133718B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250612101635.GF25137@pendragon.ideasonboard.com>
 <PN3P287MB18299D56B38B6CCCFD8CD79E8B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250612112752.GD11428@pendragon.ideasonboard.com>
In-Reply-To: <20250612112752.GD11428@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB0366:EE_
x-ms-office365-filtering-correlation-id: 676028d9-54bf-4ec0-765f-08dda9ab7930
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?iZ72VkbFseyCjPutmrR6c6jmMC5/qMHYDXSsCxxhlZXPXG9iZwVeJiYO?=
 =?Windows-1252?Q?BK85zz5tpgWLlkcbtvYF/9SLeywUs9LHAMFtoNcKQTbn3bhpu2VhviQH?=
 =?Windows-1252?Q?V+c4Ct5w094+gVDCEc5jCRsNSNlOcLuSaGW3DjMmPupT91QASUuD3jEu?=
 =?Windows-1252?Q?sMF+Pd+lOs135upC2wO+qVoE+a4wUOMZjhzHG0A/sIelPcMTPDfWXJuv?=
 =?Windows-1252?Q?269Lfl0kgZA6LfvkDuPXWEwkp8/zFYrhAKGyHDih4QB29YR4qQlILnDC?=
 =?Windows-1252?Q?KdnsqWz73FWWoGPi8CIBaBjZPIMORwPK5Oqw46CM3/+yMr7VPVijDddf?=
 =?Windows-1252?Q?NhUqHM68BVN3EI3RS8n/h8fEhF2RxQIG3t+SVBR3OWEhHbWvTHJXU52y?=
 =?Windows-1252?Q?3T3RjVVaJLRtIvcXGpx6NLh5LIVdJ3Lsy09GqBN6jYQitdRHElE6oq8h?=
 =?Windows-1252?Q?Uv9VwfWZRVDFGtIXmR9lraKTxJ6OJ4YZ9qfN3H3qe5rKuc2hx4gZb3X8?=
 =?Windows-1252?Q?/21ZdzQk52cHplweOp0YGJCf/yvkKcgkAJvHUv4mNVafAnkMoipVbvdx?=
 =?Windows-1252?Q?/ghid5JmxkOHD7t0bj0sgLX8GRvfsiG3mId4SaR9RAtrH4cm9lxyMeCE?=
 =?Windows-1252?Q?mdrRvsyy3n9xhSQWpqgPJVXUh2W8u5dv3VEONn3C3d7++nJ4o+FoqrhM?=
 =?Windows-1252?Q?W0K4WwLard0Yh4bf8LSS6tBGsXG1wdjThU6Hw6af7NM+woCw+sQKQAQa?=
 =?Windows-1252?Q?cIkOz8xf6RH4MoDkFzu6Kjcx5vjDx7Nk8KZH7+YlquJn1ovLXZZtWakd?=
 =?Windows-1252?Q?hvmLyoAsfd6CxLoVHR0RTadezRkB8NDtomvz+/xViG2kqfzgP2ZcmaO0?=
 =?Windows-1252?Q?Y/J8EA2UiQoTlrX9sH361RuX/itcgtgWq7B9TYl6+kI6pXxGaODFZbN+?=
 =?Windows-1252?Q?gP1yIwKZkTwfddJrHadukpDtqOude3i1//g3ZLYlpF3xUh92XtjygpqC?=
 =?Windows-1252?Q?BBHC/xkHVNz2oiSk9yGa/InLEaVlYFUInl1Wc2yPTmgWy5mrCKJPc2iK?=
 =?Windows-1252?Q?hm/wOQusjy2Ny1S6Igpw3hj2GDEEMz5DanN2bDPfzGQ+FcVXCWGlNttr?=
 =?Windows-1252?Q?thyQ3/c8S4tKcuJAzRIlTAzBjYyf6B7D8hxRh6UYZEx0v56gCuDRvRdB?=
 =?Windows-1252?Q?5ha3Rco3ty4aXGNlFjN2zQL0nSQyWcCsWr/IJmlfosRUj+gnHZ1iTrlE?=
 =?Windows-1252?Q?lhzVI6Q5e9UDKCacBU00BOaJxKiQ5qPY7x1391aKvxIUsTotZmxnq293?=
 =?Windows-1252?Q?ks71vpyPlLH0t4VXsqzv6DKEBPbPd2SRRnq3I2B1fbVgN/zcDLQOZ0FL?=
 =?Windows-1252?Q?6s0r0gSlmkRUDI0xpwCFVI5eUBz7EdVHKUK1iPwaTZpusRl5/6TLC2WK?=
 =?Windows-1252?Q?8RlKmIS8eRMyCBpLowx56pGezY4BlcrU6DCMhLnDlrSq/0hsPYzzUMWY?=
 =?Windows-1252?Q?5xBSEfetv5qBNd/hbgMsZLwKrZBUgG/XiQ4DFwRcSHk5i5BKR6Vv4aqq?=
 =?Windows-1252?Q?OjxbyXsPCJSzHJpQ3wziZ8KCnECrm63bD3qjSA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?D5nN9Tfd5mQd9Hln24Oa5L7Bx0RrpDP43js7PKSSfK1HUsrWs4p69OWZ?=
 =?Windows-1252?Q?G4QaQnHz5Rl81uzkivu5slyYQ0Jr5wZLrAnEXXytZN2iG7UUqPnR+gVD?=
 =?Windows-1252?Q?bP0qzu/rcmRZeyQhDF1z4RBcBT/DhLl8liM/5j39EpdfDZYIurHhowhs?=
 =?Windows-1252?Q?y7Mj+aPRWMYm/15+8gOVKa/OpCVZobBRVSY1R+qP5BgOqGmnSzbjxinj?=
 =?Windows-1252?Q?xDoxYegKF942YnQualwrMo36FDPLSuOxWt7Vn0ukxxrRYURgzB/aGylK?=
 =?Windows-1252?Q?9B2zp17wMni6eOfZy9963PDS6W/NOHyJh0H0pM7CauLLcUL+V6Br5zj6?=
 =?Windows-1252?Q?q6rxYo6V6GRaGKrvReZZKiiuSad9GHLeSCfzepvCckzDIC3xwFabre8V?=
 =?Windows-1252?Q?Z6hCNtoc1cEDgLACHxu30+Gf0/wVjo/j/7E6kXvIP5Q6l4n5Ih09FMSc?=
 =?Windows-1252?Q?wlaB9da+iyejnpK7MXZiZ8Dbok658RIg1cL+c/aL1yHkqvTRuoHBKKPL?=
 =?Windows-1252?Q?OZJLu6m8vKjo0Rc5Li91++BAM9wAjiXxZivdC62GYrMn9BB7ApAKDpyl?=
 =?Windows-1252?Q?XKa9fpiEoPXH/wnzO7cJViWYoqDr4jYpQtwUchjVB5hc4QpJkRKgrhYe?=
 =?Windows-1252?Q?3rY7OUZFPbZdZYKZ3WBzPuIXvdjLMBpJoyhr4JZu+MJM+ZnqgyC+rhJN?=
 =?Windows-1252?Q?79AmXgZrpOveg7SSZ+PDLnZ9Yq0CiGw+hfUG46P3IjrFaFuAUiXkt5pd?=
 =?Windows-1252?Q?e1EoMVvRcy/C+ivJk/I3iCNK3uwx/bGjsjfaAoZX4eKMs9CrL7BvGjgI?=
 =?Windows-1252?Q?xp+TRUYKYnWB4bjE2t8kz27lZxxXj5kPzLD4ez8rn7tT7q2p0OsM9ozy?=
 =?Windows-1252?Q?+oO8x3SJUPjTaJb2YPvh/LROFlfixXkDEn3NXBrnIeVdhOLVh/MWNyUo?=
 =?Windows-1252?Q?+DNcjV/XmNAEpLEb62UgntM/7P7QzrAi5TiIh5pPNYEZsXboBOvuuPVU?=
 =?Windows-1252?Q?7I9BdljySQJ5Tvf08h7v2MV2mIngCA+D8XW3ToVZ2HY0qzC9eXxPa/us?=
 =?Windows-1252?Q?Q1JmrFjWZ1p2aQczi3w93szThMUVzUNzp6ZmAEPOkvpd7UfDTv4fc5n+?=
 =?Windows-1252?Q?AX6q8BWrp9iw+6UHOHY+274kIn8NoyuLd+1dHRWi/UJTaX9YmBvyDKz4?=
 =?Windows-1252?Q?sHaudkAp3TVmXfnY/F4REhB18uzhIcsHIue9cmcnKlNasmiFL8JhSacf?=
 =?Windows-1252?Q?ix3TSw1/wZG2va0orx5xXswzHw/egpizUcWSl0vnH3KGfYwLkbhBTYQS?=
 =?Windows-1252?Q?gEvERL21uDzLoDn01JNcmAR2qTlyVxWa5rMFObNl57J4C9NkDyuLyMnr?=
 =?Windows-1252?Q?Bk7Do2v+HakGeF8S+t8uS3FlCXlop8rSm05rtG2FviRtq523Q90g/cdI?=
 =?Windows-1252?Q?/G5Ik/K1JmJ7d/g8C7Nir7X9p3T9neZNLouQKqVtDJmR6Rdyfl3UhBrB?=
 =?Windows-1252?Q?6Hmobg/kyPydctQMvauDtyiMTP6ez/MSt9u//7gXWTbvhCMZfYE2XuYQ?=
 =?Windows-1252?Q?D3lC9UBiTRN/GdmSKXigRadZtJiunb2WCK6b3Ns/vNqcmDQFBDnQy6Xe?=
 =?Windows-1252?Q?1xRPBUPbI5bHpGEHFD+sJaKxhe/ich8Eh8k56ADciIAjOMUMh8YPEnVZ?=
 =?Windows-1252?Q?o4VXYh+x6AeHiqh64FN7A8Y744YV8GVJaTan/MJOF1mPXM18cWR/3w?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 676028d9-54bf-4ec0-765f-08dda9ab7930
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 12:20:09.3919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DsgQ09uzwLqvJuSFNG8UdqVE9HbMWDsx05ePz8FFKKt5DxotHiXyPqMOSbVg9zValN76hgfj9MLI9AnyL0J3/yN4JQRog+LawDyw/3vcNmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0366

> On Thu, Jun 12, 2025 at 10:57:28AM +0000, Tarang Raval wrote:=0A=
> > > On Thu, Jun 12, 2025 at 09:50:22AM +0000, Tarang Raval wrote:=0A=
> > > > > On Thu, Jun 12, 2025 at 07:52:32AM +0000, Tarang Raval wrote:=0A=
> > > > > > Hi=0A=
> > > > > >=0A=
> > > > > > I=92m trying to bring up the OV5695 camera sensor on the Debix =
Model A board.=0A=
> > > > > >=0A=
> > > > > > Kernel Version: v6.15-rc2=0A=
> > > > > >=0A=
> > > > > > The issue occurs when attempting to capture a frame, the system=
 hangs at=0A=
> > > > > > the VIDIOC_STREAMON call.=0A=
> > > > >=0A=
> > > > > When you say "hang", do you mean that it freezes completely and b=
ecomes=0A=
> > > > > unresponsive (no serial console, no network, ...), or that it doe=
sn't=0A=
> > > > > capture frames ?=0A=
> > > >=0A=
> > > > The system remains responsive=97console, serial, and network are al=
l working fine.=0A=
> > > >=0A=
> > > > However, after calling VIDIOC_STREAMON, although it returns 0 (succ=
ess), the frame=0A=
> > > > Capture does not proceed. I have to manually terminate the process =
using Ctrl + C.=0A=
> > >=0A=
> > > Then it probably means that the ISI doesn't receive full images. Ther=
e=0A=
> > > are lots of reasons why this could happen, from bad pipeline=0A=
> > > configurations to incorrect sensor configurations. I would recommend=
=0A=
> > > starting from the beginning of the pipeline and trying to validate=0A=
> > > proper operation of the components by looking at the various register=
s=0A=
> > > that can provide you with debugging information in all the hardware=
=0A=
> > > blocks of the SoC.=0A=
> >=0A=
> > I didn't get this : =A0"components by looking at the various registers =
that can=0A=
> > provide debugging information in all the hardware blocks of the SoC"=0A=
> >=0A=
> > which registers exactly are you referring to?=0A=
> >=0A=
> > Are you talking about the camera sensor registers, or registers inside =
the=0A=
> > SoC like the ISI or others block?=0A=
> >=0A=
> > Could you please clarify which registers I should check for debugging?=
=0A=
>=A0=0A=
> Check the i.MX8MP reference manual, and all the blocks related to the=0A=
> camera pipeline. There are lots of settings, lots of interrupts, and=0A=
> lots of status registers. I don't know where the problem lies so I can't=
=0A=
> point to one particular area, I'm afraid you'll have to do your homework=
=0A=
> yourself.=0A=
=A0=0A=
I=92ll definitely check the i.MX8MP reference manual and review all the blo=
cks =0A=
related to the camera pipeline. =0A=
=0A=
I=92ve encountered similar issues before, and in most cases, the problem wa=
s =0A=
due to data line connections. But this time, it seems to be something else,=
 =0A=
so I=92ll dig deeper. =0A=
=0A=
> Cameras are not easy, there's a reason they require experience=0A=
> and expertise. It can be a fun ride though, you get the opportunity to=0A=
> learn a lot :-)=A0=0A=
=0A=
Agreed, working with cameras isn't easy, it definitely requires experience.=
=0A=
But I=92m genuinely interested in this area, which is why I=92m working thr=
ough it.=0A=
=0A=
If I get stuck again, I may reach out =97 apologies in advance for the dist=
urbance.=0A=
I really appreciate your continued support and responsiveness.=0A=
=0A=
Honestly, I'm learning more from your (Sakari, Kieran, Hans, ...many others=
 also)=0A=
comments and insights than from ChatGPT.=0A=
=0A=
Thanks again for not ignoring my questions, it truly means a lot!=0A=
=A0=0A=
>=A0=0A=
> > > > > > 1. I've verified the data lane connections, and they are correc=
t.=0A=
> > > > > >=0A=
> > > > > > 2. Regarding link frequency:=0A=
> > > > > > In the mainline driver, the default link frequency is set to 42=
0 MHz, but according=0A=
> > > > > > to the sensor's datasheet, the MIPI data rate can go up to 1000=
 MHz. So, I also tried=0A=
> > > > > > configuring the link frequency to 500 MHz, but the issue still =
persists.=0A=
> > > > >=0A=
> > > > > I assume you meant 1000 Mbps, not 1000 MHz.=0A=
> > > >=0A=
> > > > Oops, yes, 1000 Mbps.=0A=
> > > >=0A=
> > > > > > but the issue still persists.=0A=
> > > > > >=0A=
> > > > > > Could this be a driver-related bug, or is there something else =
I should be checking?=0A=
> > > > > > I would appreciate any guidance on the possible causes or the c=
orrect direction to=0A=
> > > > > > investigate.=0A=
> > > > > >=0A=
> > > > > > Best Regards,=0A=
> > > > > > Tarang=0A=
> > > > > >=0A=
> > > > > > ###############################################################=
###########=0A=
> > > > > > debix@imx8mp-debix:~$ v4l2-ctl --device /dev/video0 --set-fmt-v=
ideo=3Dwidth=3D1920,height=3D1080,pixelformat=3DBG10 --stream-mmap --stream=
-to=3Dimage.raw --stream-count=3D1 --verbose=0A=
> > > > >=0A=
> > > > > What device is /dev/video0 ?=0A=
> > > >=0A=
> > > > /dev/video0 corresponds to the mxc_isi.0.capture device=0A=
> > >=0A=
> > > I assume you've first configured the MC pipeline appropriately.=0A=
> >=0A=
> > Yes, I configured=0A=
> >=0A=
> > media-ctl --device /dev/media0 --links "'ov5695 1-0036':0->'csis-32e400=
00.csi':0[1]"=0A=
> > media-ctl -v -d /dev/media0 -V "'ov5695 1-0036':0 [fmt:SBGGR10_1X10/192=
0x1080 field:none colorspace:raw]"=0A=
> > media-ctl -v -d /dev/media0 -V "'crossbar':0 [fmt:SBGGR10_1X10/1920x108=
0 field:none colorspace:raw]"=0A=
> > media-ctl -v -d /dev/media0 -V "'mxc_isi.0':0 [fmt:SBGGR10_1X10/1920x10=
80 field:none colorspace:raw]"=0A=
> >=0A=
> > debix@imx8mp-debix:~$ media-ctl -p=0A=
> > Media controller API version 6.14.0=0A=
> >=0A=
> > Media device information=0A=
> > ------------------------=0A=
> > driver =A0 =A0 =A0 =A0 =A0mxc-isi=0A=
> > model =A0 =A0 =A0 =A0 =A0 FSL Capture Media Device=0A=
> > serial=0A=
> > bus info =A0 =A0 =A0 =A0platform:32e00000.isi=0A=
> > hw revision =A0 =A0 0x0=0A=
> > driver version =A06.14.0=0A=
> >=0A=
> > Device topology=0A=
> > - entity 1: crossbar (5 pads, 4 links)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 type V4L2 subdev subtype Unknown flags 0=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 device node name /dev/v4l-subdev0=0A=
> > =A0 =A0 =A0 =A0 pad0: Sink=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [fmt:SBGGR10_1X10/1920x1080 field:none =
colorspace:raw]=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <- "csis-32e40000.csi":1 [ENABLED,IMMUT=
ABLE]=0A=
> > =A0 =A0 =A0 =A0 pad1: Sink=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [fmt:UYVY8_1X16/1920x1080 field:none co=
lorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]=0A=
> > =A0 =A0 =A0 =A0 pad2: Sink=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <- "mxc_isi.output":0 [ENABLED,IMMUTABL=
E]=0A=
> > =A0 =A0 =A0 =A0 pad3: Source=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [fmt:SBGGR10_1X10/1920x1080 field:none =
colorspace:raw]=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> "mxc_isi.0":0 [ENABLED,IMMUTABLE]=0A=
> > =A0 =A0 =A0 =A0 pad4: Source=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [fmt:UYVY8_1X16/1920x1080 field:none co=
lorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> "mxc_isi.1":0 [ENABLED,IMMUTABLE]=0A=
> >=0A=
> > - entity 7: mxc_isi.0 (2 pads, 2 links)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 type V4L2 subdev subtype Unknown flags 0=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 device node name /dev/v4l-subdev1=0A=
> > =A0 =A0 =A0 =A0 pad0: Sink=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [fmt:SBGGR10_1X10/1920x1080 field:none =
colorspace:raw=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compose.bounds:(0,0)/1920x1080=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compose:(0,0)/1920x1080]=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <- "crossbar":3 [ENABLED,IMMUTABLE]=0A=
> > =A0 =A0 =A0 =A0 pad1: Source=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [fmt:SBGGR10_1X10/1920x1080 field:none =
colorspace:raw=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0crop.bounds:(0,0)/1920x1080=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0crop:(0,0)/1920x1080]=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> "mxc_isi.0.capture":0 [ENABLED,IMMUT=
ABLE]=0A=
> >=0A=
> > - entity 10: mxc_isi.0.capture (1 pad, 1 link)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0type Node subtype V4L flags 0=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0device node name /dev/video0=0A=
> > =A0 =A0 =A0 =A0 pad0: Sink=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <- "mxc_isi.0":1 [ENABLED,IMMUTABLE]=0A=
> >=0A=
> > - entity 18: mxc_isi.1 (2 pads, 2 links)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0type V4L2 subdev subtype Unknown flags 0=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0device node name /dev/v4l-subdev2=0A=
> > =A0 =A0 =A0 =A0 pad0: Sink=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [fmt:UYVY8_1X16/1920x1080 field:none co=
lorspace:jpeg xfer:srgb ycbcr:601 quantization:full-range=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compose.bounds:(0,0)/1920x1080=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compose:(0,0)/1920x1080]=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <- "crossbar":4 [ENABLED,IMMUTABLE]=0A=
> > =A0 =A0 =A0 =A0 pad1: Source=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [fmt:YUV8_1X24/1920x1080 field:none col=
orspace:jpeg xfer:srgb ycbcr:601 quantization:full-range=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0crop.bounds:(0,0)/1920x1080=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0crop:(0,0)/1920x1080]=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> "mxc_isi.1.capture":0 [ENABLED,IMMUT=
ABLE]=0A=
> >=0A=
> > - entity 21: mxc_isi.1.capture (1 pad, 1 link)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0type Node subtype V4L flags 0=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0device node name /dev/video1=0A=
> > =A0 =A0 =A0 =A0 pad0: Sink=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <- "mxc_isi.1":1 [ENABLED,IMMUTABLE]=0A=
> >=0A=
> > - entity 29: mxc_isi.output (1 pad, 1 link)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0type Node subtype V4L flags 0=0A=
> > =A0 =A0 =A0 =A0 pad0: Source=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> "crossbar":2 [ENABLED,IMMUTABLE]=0A=
> >=0A=
> > - entity 36: csis-32e40000.csi (2 pads, 2 links)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0type V4L2 subdev subtype Unknown flags 0=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0device node name /dev/v4l-subdev3=0A=
> > =A0 =A0 =A0 =A0 pad0: Sink=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [fmt:SBGGR10_1X10/1920x1080 field:none =
colorspace:raw]=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <- "ov5695 1-0036":0 [ENABLED]=0A=
> > =A0 =A0 =A0 =A0 pad1: Source=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [fmt:SBGGR10_1X10/1920x1080 field:none =
colorspace:raw]=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> "crossbar":0 [ENABLED,IMMUTABLE]=0A=
> >=0A=
> > - entity 41: ov5695 1-0036 (1 pad, 1 link)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0type V4L2 subdev subtype Sensor flags 0=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0device node name /dev/v4l-subdev4=0A=
> > =A0 =A0 =A0 =A0 pad0: Source=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [fmt:SBGGR10_1X10/1920x1080 field:none]=
=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> "csis-32e40000.csi":0 [ENABLED]=0A=
> >=0A=
> > > > > >=0A=
> > > > > > VIDIOC_QUERYCAP: ok=0A=
> > > > > > VIDIOC_G_FMT: ok=0A=
> > > > > > VIDIOC_S_FMT: ok=0A=
> > > > > > Format Video Capture Multiplanar:=0A=
> > > > > > =A0 =A0 =A0 =A0 Width/Height =A0 =A0 =A0: 1920/1080=0A=
> > > > > > =A0 =A0 =A0 =A0 Pixel Format =A0 =A0 =A0: 'BG10' (10-bit Bayer =
BGBG/GRGR)=0A=
> > > > > > =A0 =A0 =A0 =A0 Field =A0 =A0 =A0 =A0 =A0 =A0 : None=0A=
> > > > > > =A0 =A0 =A0 =A0 Number of planes =A0: 1=0A=
> > > > > > =A0 =A0 =A0 =A0 Flags =A0 =A0 =A0 =A0 =A0 =A0 :=0A=
> > > > > > =A0 =A0 =A0 =A0 Colorspace =A0 =A0 =A0 =A0: sRGB=0A=
> > > > > > =A0 =A0 =A0 =A0 Transfer Function : sRGB=0A=
> > > > > > =A0 =A0 =A0 =A0 YCbCr/HSV Encoding: ITU-R 601=0A=
> > > > > > =A0 =A0 =A0 =A0 Quantization =A0 =A0 =A0: Limited Range=0A=
> > > > > > =A0 =A0 =A0 =A0 Plane 0 =A0 =A0 =A0 =A0 =A0 :=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0Bytes per Line : 3840=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0Size Image =A0 =A0 : 4147200=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VIDIOC_REQBUFS returned 0 (Succ=
ess)=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VIDIOC_QUERYBUF returned 0 (Suc=
cess)=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VIDIOC_QUERYBUF returned 0 (Suc=
cess)=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VIDIOC_QUERYBUF returned 0 (Suc=
cess)=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VIDIOC_QUERYBUF returned 0 (Suc=
cess)=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VIDIOC_QBUF returned 0 (Success=
)=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VIDIOC_QBUF returned 0 (Success=
)=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VIDIOC_QBUF returned 0 (Success=
)=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VIDIOC_QBUF returned 0 (Success=
)=0A=
> > > > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 VIDIOC_STREAMON returned 0 (Suc=
cess)=0A=
> > > > > >=0A=
> > > > > >=0A=
> > > > > > ###############################################################=
#################=0A=
> > > > > >=0A=
> > > > > > echo 8 > /sys/module/videobuf2_common/parameters/debug=0A=
> > > > > > echo 8 > /sys/module/videobuf2_v4l2/parameters/debug=0A=
> > > > > >=0A=
> > > > > > Logs:=0A=
> > > > > >=0A=
> > > > > > [ =A0133.181274] videobuf2_common: [cap-(____ptrval____)] __set=
up_offsets: buffer 0, plane 0 offset 0x00000000=0A=
> > > > > > [ =A0133.182569] videobuf2_common: [cap-(____ptrval____)] __set=
up_offsets: buffer 1, plane 0 offset 0x00008000=0A=
> > > > > > [ =A0133.183766] videobuf2_common: [cap-(____ptrval____)] __set=
up_offsets: buffer 2, plane 0 offset 0x00010000=0A=
> > > > > > [ =A0133.185209] videobuf2_common: [cap-(____ptrval____)] __set=
up_offsets: buffer 3, plane 0 offset 0x00018000=0A=
> > > > > > [ =A0133.185230] videobuf2_common: [cap-(____ptrval____)] __vb2=
_queue_alloc: allocated 4 buffers, 1 plane(s) each=0A=
> > > > > > [ =A0133.185607] videobuf2_common: [cap-(____ptrval____)] vb2_m=
map: buffer 0, plane 0 successfully mapped=0A=
> > > > > > [ =A0133.185678] videobuf2_common: [cap-(____ptrval____)] vb2_m=
map: buffer 1, plane 0 successfully mapped=0A=
> > > > > > [ =A0133.185763] videobuf2_common: [cap-(____ptrval____)] vb2_m=
map: buffer 2, plane 0 successfully mapped=0A=
> > > > > > [ =A0133.185822] videobuf2_common: [cap-(____ptrval____)] vb2_m=
map: buffer 3, plane 0 successfully mapped=0A=
> > > > > > [ =A0133.185847] videobuf2_common: [cap-(____ptrval____)] vb2_c=
ore_qbuf: qbuf of buffer 0 succeeded=0A=
> > > > > > [ =A0133.185879] videobuf2_common: [cap-(____ptrval____)] vb2_c=
ore_qbuf: qbuf of buffer 1 succeeded=0A=
> > > > > > [ =A0133.185907] videobuf2_common: [cap-(____ptrval____)] vb2_c=
ore_qbuf: qbuf of buffer 2 succeeded=0A=
> > > > > > [ =A0133.185942] videobuf2_common: [cap-(____ptrval____)] vb2_c=
ore_qbuf: qbuf of buffer 3 succeeded=0A=
> > > > > > [ =A0133.501480] videobuf2_common: [cap-(____ptrval____)] vb2_c=
ore_streamon: successful=0A=
> > > > > > [ =A0133.501579] videobuf2_common: [cap-(____ptrval____)] __vb2=
_wait_for_done_vb: will sleep waiting for buffers=0A=
> > > > > > [ =A0147.031310] videobuf2_common: [cap-(____ptrval____)] __vb2=
_wait_for_done_vb: sleep was interrupted=0A=
> > > > > > [ =A0147.039118] videobuf2_common: [cap-(____ptrval____)] vb2_b=
uffer_done: done processing on buffer 0, state: error=0A=
> > > > > > [ =A0147.039135] videobuf2_common: [cap-(____ptrval____)] vb2_b=
uffer_done: done processing on buffer 1, state: error=0A=
> > > > > > [ =A0147.039141] videobuf2_common: [cap-(____ptrval____)] vb2_b=
uffer_done: done processing on buffer 2, state: error=0A=
> > > > > > [ =A0147.039146] videobuf2_common: [cap-(____ptrval____)] vb2_b=
uffer_done: done processing on buffer 3, state: error=0A=
> > > > > > [ =A0147.039603] videobuf2_common: [cap-(____ptrval____)] __vb2=
_buf_mem_free: freed plane 0 of buffer 0=0A=
> > > > > > [ =A0147.040152] videobuf2_common: [cap-(____ptrval____)] __vb2=
_buf_mem_free: freed plane 0 of buffer 1=0A=
> > > > > > [ =A0147.040595] videobuf2_common: [cap-(____ptrval____)] __vb2=
_buf_mem_free: freed plane 0 of buffer 2=0A=
> > > > > > [ =A0147.041036] videobuf2_common: [cap-(____ptrval____)] __vb2=
_buf_mem_free: freed plane 0 of buffer 3=0A=
>=A0=0A=
> --=0A=
> Regards,=0A=
>=A0=0A=
> Laurent Pinchart=0A=
=0A=
Best Regards,=0A=
Tarang=

