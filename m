Return-Path: <linux-media+bounces-28018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2812AA5BD43
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 11:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C428A3A5A87
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B2D22F395;
	Tue, 11 Mar 2025 10:09:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021129.outbound.protection.outlook.com [40.107.57.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B98221F2A;
	Tue, 11 Mar 2025 10:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741687767; cv=fail; b=fAV6QGcRXde8UAEloR1DQw/1Wk+ZutPI39aX95ujbgkiSH+ErXqgqTQecOZdvZsFruB30sW32Gm89kVSFW/epW5zE9b2Q0CVMFsRrb5MqOz86aRD6+2joz3P9ifWofO2/EuFF9fEufeI+iJPcIF82QKwvjCY8Nk4RNbejh14a7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741687767; c=relaxed/simple;
	bh=JcXlkt22IcH8F/AU7Kebol+bEKBiX+p3zgPLpdf91cI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AjVfUksahvWzBOcrpDzGfIzI8vwFGwpcpryotQ2ueef6A0aifiDfTPL9Kc9uWl4agJn8wyqCC/mqZ7H1JsM3wtKtqvG537wCcQ0zK1aepJpvElD6rweCP03MMi3hwDVhLH6yNmSFDtbLNPR1DnA/KBPrqiLu9JSEHODdcpQ2CAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZLVk8Q2oEJSVP5vEsPNFhgwc9q87fXyPQ8wy3tD8EgU+CvYV19Kr+NILUitA1pwtaDdzBgKPlYdQkYystGgSOfDb6WSI2KPpBD14/f0ulDJcgyfCy0KsRmY1JjvmJME+ANd87l6+3alZt/l4AoKljqzABRjXZctH39WEkmyDQN+mfucELf3jI9Y1ZK8/11XWSCBn1edFOSHJf/xPS27oVCLDTlagH9CO5pqF4LCf0er08McbQrHKzXRPYv3lYovzTNAAUzVEDjnGC/AgCpSCxIu/SbsJohSDtYRbMyhCzzfVmvA8Yqn9+iv4SrtinsVNY83d46nQ4vle4venLekSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcXlkt22IcH8F/AU7Kebol+bEKBiX+p3zgPLpdf91cI=;
 b=sC/Pi1iI/Xa5GNVWTFzROroLK3v9ifza5fuq4md9IWSD+IFbMp9Uj/nmTav2dYaOcVmVUkpUErolS2zNeaYB+EyQ2G5AExfx3pLTXXmhlMRNlborqlqU+mQw7RHovGmpWkDMdU5hG5XcpQWxxMwXofa463tFeb9qEV2Bbai3JgL9Z+2HQqJO2ffW62Lp0Ov7SM1GPdkHOPHoBVV3gWikYYIpYZU4NXoXKKBurr06k9OZ/beA1tuZNniu1gqTMEWY7sJDm8cH9wvRngltsMaTdKpHSesraz91RWZwHb04teEoN278QyLOkP3SpvL2lnZE0DeQ2fTlQUk9LVNa6qQIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4098.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:28c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 10:09:21 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 10:09:21 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, shravan kumar
	<shravan.chippa@microchip.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"valentina.fernandezalanis@microchip.com"
	<valentina.fernandezalanis@microchip.com>, "praveen.kumar@microchip.com"
	<praveen.kumar@microchip.com>
Subject: Re: [PATCH V7 2/4] media: i2c: imx334: common reg value correction
Thread-Topic: [PATCH V7 2/4] media: i2c: imx334: common reg value correction
Thread-Index: AQHbjY3c2AXRKWgUnkeCQQL0UU2Jq7Ntui8AgAAFMRQ=
Date: Tue, 11 Mar 2025 10:09:21 +0000
Message-ID:
 <PN3P287MB1829A883F503B5D3EA2533E98BD12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com>
 <20250305051442.3716817-3-shravan.chippa@microchip.com>
 <Z9AGxJuk7V-QPKW1@kekkonen.localdomain>
In-Reply-To: <Z9AGxJuk7V-QPKW1@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PNXP287MB4098:EE_
x-ms-office365-filtering-correlation-id: 98783926-7b12-4432-6a0d-08dd6084cae4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8N3f5evYByW5zDAdtG8mYDVlc1ZYIxME6es+D13FKx0NM2JM/x195xz0nE?=
 =?iso-8859-1?Q?Kh3t66pFYFBMi4xBeTX8rf0nAsODkd8gQU2WxrvMMUHeb4AxzXPYYrZenH?=
 =?iso-8859-1?Q?mp6T5afb2vBG901I8/+G15VwhNujcQii2dTOwSdwI2veE2ftnYOOa+HFyR?=
 =?iso-8859-1?Q?L03hZFIwTJYQ/zvkYzU3n+NWsd6qWNf7aOdGc7gCXb0NMmhF3Fkux29ZH1?=
 =?iso-8859-1?Q?AgP313JwHOn13Jl+DC83VW4bipQ2MUI3md1A6dIZl7kOU3cCPRIFJ4G9d+?=
 =?iso-8859-1?Q?mwcFZ0D/6mTWZ8lJnCHVWm6R2dox4c//5WbwJbAPTA7JL9ZEI7op/oEUNb?=
 =?iso-8859-1?Q?X48IY0WvkBFaqCK7hnpLFSfk5fPCyB9TqkNs27Bukc0sT9sIkQAOEpTf2Y?=
 =?iso-8859-1?Q?TEAyyY5y3h2J2Oi8o2pfyofDxQMlr9W0cmQE9VTTQ202EMgC5fHpZerLwz?=
 =?iso-8859-1?Q?iW43McUqAzq1/5babM4ELoINsVoxJvyS89+vrLOa936nEH7erw8bHVSBEn?=
 =?iso-8859-1?Q?dBBxRBp1lopKsBEfkibzmJNLXYjpXDNqeyfLMI7Osync4bjIQXfR0YqR9G?=
 =?iso-8859-1?Q?9j+kiK8Fd1ZBfuY2h9KfcVYaR+uqdaML/U511Cpw7sr9TruBcn2FbBM7ZJ?=
 =?iso-8859-1?Q?q093+jJrs/BK9IZ2HHbtxl2gO0Ni/QmaVrw4zUiLsNggAclcAy75mn8OKw?=
 =?iso-8859-1?Q?vDq+Ek6LY0ANJSWGP8vSvpsVM95Ktmo1khl9ODQux+u+NZtE+p2ukGTjni?=
 =?iso-8859-1?Q?JN8afMyNr6Q11mUWnEmiL2y5DjQMxMRK9EOJ3DKzLCOAnBjlO0LuMV6swC?=
 =?iso-8859-1?Q?Pn+JrelrYcOSpHJQvXbXZm5/z8dDCNd3IoPfnklEGi+k6PHBAgLEtZKj7B?=
 =?iso-8859-1?Q?hEqHByuLJjjqjsOMN0wFX4rE0C+Qh3/ozV9VnF1p20svfeyA8DU73DQqrp?=
 =?iso-8859-1?Q?aDWzs12uJgWLfag+olD6YTYKFidGFQ6dBDze7ji76jk3QxFG/PHzor25hy?=
 =?iso-8859-1?Q?9P2TFO6UmdXCODT4wu59KjkAuEBNIuI3Zj8PyKLN8QMu8UpJCtAQHujpZV?=
 =?iso-8859-1?Q?XZfBxVW1FIKRbgXsgMAUd79iNWv9UYnAHBXBinzuZevZhXpT4C6K/c1mPh?=
 =?iso-8859-1?Q?UGDiLF+ONPiIL/Bi8/i2jJe9F959WSQPS0QcUQxT9WyUqNGjVUGOCV2xS3?=
 =?iso-8859-1?Q?aRjZFUbBGYSBtlSorYjx7JREYLGZ4egizA6053ZCb+xwlzhfZTJSD9eLi5?=
 =?iso-8859-1?Q?0eNceDoF74hMUEHZl0uEYEhDWm6aQd958mI5wck0KLVHkqkufg+EkCe5c1?=
 =?iso-8859-1?Q?3lFNYo09ywpv9zY804aVzMjyZf+qT5rhr38pi1w+hZFGR2hYPDy9dz4jWD?=
 =?iso-8859-1?Q?NNMNo+TJ5rbhhf+NdRiuOwaq/FtxeiIEr3VosdlKK+lOzJujmU/wvfXJ3W?=
 =?iso-8859-1?Q?b0p4oiD9HY9MpZhp3cdH70DSIpuo6f1ClTSiCVldFJmhwVWJnuFYNPgVf5?=
 =?iso-8859-1?Q?pjsOdpKUaZcY7TfX0vlnu6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?J7NNCZTP3glCi+pY5YEriEGUYBZT58WAT5sHw5sMg2mRIv2fU0tRoeGyaV?=
 =?iso-8859-1?Q?xXrCHxbiyEqbC4fBtFL4PjOKpPrnfV9/nCG7ZIhV3x1MTjMvDmkBKcS9Pq?=
 =?iso-8859-1?Q?FV4vP7N3mi07IGcJIPD8t75VdFPkQlzJcfbbTHKz+FUuF07sv22rYP8PPC?=
 =?iso-8859-1?Q?sRrv3ZEc+BCXiUSU3GssPVYz6h89clTJNizF6cmEnbnrBo4qIFSbg+saKB?=
 =?iso-8859-1?Q?sATpwcIwiYE6xFQbvRxnMJ88mRA9C0MnmyfbJd4Y6LAUwbAQlC9jHXEE8I?=
 =?iso-8859-1?Q?kD0ITkZAHtilrJ9u7FgZ15jBV/PARG1jiCio+AbJCVEmLgkx2r+FiHp68L?=
 =?iso-8859-1?Q?NH0zA2z/JNLU8+cxfhbjESuW6+cWYrXw8E7xR7NbmrnJC/fRK+R87035cj?=
 =?iso-8859-1?Q?WfRzT0A16hd9HPs38/7jzF08PFPUQBfQEGTBMC8LufSvJlaEYhIK4gyQOz?=
 =?iso-8859-1?Q?bNrKiC4Yyy9OCyKDhp7azt/uD1r82F3JR/JD7pQQeZn0MvCMahkRIgOHRx?=
 =?iso-8859-1?Q?WHqvh14ewxgBGsseK9UbPhV9rdNJtnPov8A0fXoyuEnGabQ6V56n0wS332?=
 =?iso-8859-1?Q?oq6gBvKK6T2Jqkn58HSadFDv4dzOJg5ROFNAC1u1nwfk3zBiiD3yaEzjcH?=
 =?iso-8859-1?Q?HgdYAsBxBAwj3HZOVjtfFarQecw59UHLlGFQPiLWAJ+Nc6+TO7VE0ommJ+?=
 =?iso-8859-1?Q?i+dpqSrZPw2WafiupoYiTKXSxkSXcLcsiaJzYElovOQ4+LXlCcTzGr0SDF?=
 =?iso-8859-1?Q?T/iTlHGBWcTCcVNsSICUZeLAgMfrTQ5DXFVl3qErN3f4uisf9YR+FyUwVf?=
 =?iso-8859-1?Q?GAdDace9bfhRYCW5jrpEg7j4jH+Z81O2ah0tn/zwkyumbBonM8I29Bvc53?=
 =?iso-8859-1?Q?o/4oU713Wh43rekJynu803Su/3RiYg3usbY7BPYUHjG3ASWVriTWxSud0z?=
 =?iso-8859-1?Q?KkqGcNMfGateV8DaOSVncCHNCqblCVPhpwcX3s7ACm135Hby0l3bKl6gCB?=
 =?iso-8859-1?Q?Om50HPpG3Ee9HkgZjx9wfryqBZEU7Lnc6L/iGMFXH10hq/7CwEgEjDR4CD?=
 =?iso-8859-1?Q?r8aqdKCfm027VtRBX/1HCyn+5U7Id3ToRCnDNLme+jlugC04N4OE60dklB?=
 =?iso-8859-1?Q?RkvwdGr4FA3QDtWSXmWRW63g9w3VJMf9FXneE/T8md7v8oZWI6h3Lmkk5s?=
 =?iso-8859-1?Q?laclGKVzFQuDMXX9tC5H38BB32UAsym1jZSrnMA6/iqB3K8jBfdhGgZ9VC?=
 =?iso-8859-1?Q?5uh5wwfDfLIGLii4Uo6jyTDc4MasoCQX9idv2DLTQn/1ePGcXY6QWd3ckl?=
 =?iso-8859-1?Q?/sOm67shjuUs8/bG6oRMR6KreuLyIjFmg19l8USZEhkSvD/6TsHm9oXs33?=
 =?iso-8859-1?Q?5zPHEX0tcESg4H5TrBfoWfboigU5yoVP2J1sIsZZdtQEFOhtvxBy9b5L7u?=
 =?iso-8859-1?Q?+P9zMnAUGacdgNbvfiRA4Q1LzQEShkUvw0SGqGdDmFnijPKynoTDnxv6Ln?=
 =?iso-8859-1?Q?0kYs46vhOEz7wRN0Tclav/YJQEmH9wktI6XlKiGDgJIwfZjTDpaEZsp0Bn?=
 =?iso-8859-1?Q?lYcGn0lik4ner+tG6qPTr/iY41Vy+EJqfpNaBvjFjNDxN5QEkgjw1PiRWj?=
 =?iso-8859-1?Q?YAdw1IfUixNlEBC2Jozu1IHC1S/t3h1EeEFc7Cv1Ue0m6lO6y4Sn+Rdg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 98783926-7b12-4432-6a0d-08dd6084cae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:09:21.2216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yBt+8rO/13FW7n2ZfDt0TJx9ii6NYIGJXoGU8/WkfO9TOmgBP1DJ2nARzBgq14EeTuusG9ep8wKe6dO7gA00J2fjKhOe0BEJZNparc3Mdio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4098

Hi Sakari,=0A=
=0A=
> On Wed, Mar 05, 2025 at 10:44:40AM +0530, shravan kumar wrote:=0A=
> > From: Shravan Chippa <shravan.chippa@microchip.com>=0A=
> >=0A=
> > correcting the CPWAIT_TIME value as per the data sheet=0A=
> > for the link frequency and input clock=0A=
> >=0A=
> > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>=0A=
>=A0=0A=
> I've postponed applying this one once we have a better understanding what=
=0A=
> that change actually is and why Tarang would seem to want to revert it.=
=0A=
=0A=
No, please recheck; I am not reverting this patch.=0A=
=0A=
You can go ahead and apply this patch.=0A=
=0A=
Best Regards,=0A=
Tarang =0A=
=0A=
> > ---=0A=
> > =A0drivers/media/i2c/imx334.c | 2 +-=0A=
> > =A01 file changed, 1 insertion(+), 1 deletion(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c=0A=
> > index db61b298ceb3..0b42bc0470a1 100644=0A=
> > --- a/drivers/media/i2c/imx334.c=0A=
> > +++ b/drivers/media/i2c/imx334.c=0A=
> > @@ -191,7 +191,7 @@ static const struct imx334_reg common_mode_regs[] =
=3D {=0A=
> > =A0 =A0 =A0 {0x31a0, 0x20},=0A=
> > =A0 =A0 =A0 {0x31a1, 0x0f},=0A=
> > =A0 =A0 =A0 {0x300c, 0x3b},=0A=
> > - =A0 =A0 {0x300d, 0x29},=0A=
> > + =A0 =A0 {0x300d, 0x2a},=0A=
> > =A0 =A0 =A0 {0x314c, 0x29},=0A=
> > =A0 =A0 =A0 {0x314d, 0x01},=0A=
> > =A0 =A0 =A0 {0x315a, 0x06},=0A=
>=A0=0A=
> --=0A=
> Kind regards,=0A=
>=A0=0A=
> Sakari Ailus=

