Return-Path: <linux-media+bounces-41245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666EB39B68
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 13:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 400D817BDC1
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 11:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6000B2C2345;
	Thu, 28 Aug 2025 11:22:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020083.outbound.protection.outlook.com [52.101.227.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5100D223DD5;
	Thu, 28 Aug 2025 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756380149; cv=fail; b=ZeKuH+Zbwl2BqZGrgttapZCInI2DbNh9cmaKSSpsx4k+wwfxjYZEFlinhCkZxa4smcyqKrVYCx21APCe0ccoMMJI8XHOf8lhVkwywQte9QI6tZ01vGWnlS4Do7Sbj+G7+uyek4bBE6zOhdwf2ZpwKdh6mmctOJoWf6YM4EP7ZCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756380149; c=relaxed/simple;
	bh=ZSbMW038QRaXOs2o9AvFzKyli6DZrPEipg7FbRfm4Kg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b0ydUMRwULPOqoWUKPIlzwx14Efena1lFS7w5a1rN4hmhjB0VIqSwe6VhCheiwcsF3ojajdztO5zwWtjE3cmAIpTdVni/zrLsa+04qOjSraQWCS5gQP+yJERz+4neeSdpUolZyoZz2jo/Q3DpUcYHhg1+vejMn759nm6iYCXtCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLTAj9lrxkJaffQJ2xakFI6pO3XPI7aQ8dANllKZkYGRA7HcUMdaJPxnyawXUmdFyrU/ppEGqLmWuYcQXoUGCgjUujKEu0/gkdHyRv4dmMVW1oiieZ3/mDKOY22Hd3ZkYSIPI5UALWPLWAjaxY6OQCwJklCde4SMTMTWYTtwM60OiinRzlX/GoGXlJd7mqMsQieDMTaHHDYqzbvxPB2l/1XFtMy5VBg8WFDYbqHxCFP3l2Se3KXrTCkz7gWK+HfEXXC5GvtUslyE9/0xAjABHnu0CGciwJug9Sybgei5YrSBrDiSyF06wBWwA0hN+Gqb4jM1yu/0n4+NY8mlPO/g+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSbMW038QRaXOs2o9AvFzKyli6DZrPEipg7FbRfm4Kg=;
 b=GeWX8Zsm5i3GzC2/AY6UcysR7oK8QOESv4RQlE9Jt0+ssayLYl/eFsxzrCsPF9BnsmaUvIrETwF8lUW4A4CLbJH4HIm4V05eji6iV42d8QxggTprC1f3k5DfLFiux1VCT1XZo9iYlHXWCYAau3TfMUtgJZW9kSVY8Vid0ltymQw4RLwKWZp05uIthvSdp4fEYFSmLyIZdpFRM9dighTW2AdS/8KD+GE1EFd6owA+1KA4oZ3C9ylC/D2LGjOvE1u8yEWlCtFihcridKy4W5N5PNbLUxokx/AyfjpL+wflLULp7DD6RMTowqnzcdJ/x5oHgaFmLRDUDjmhlnk9xoe9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PNXP287MB3961.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:286::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 11:22:23 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 11:22:22 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede <hansg@kernel.org>,
	=?Windows-1252?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, Heimir Thor
 Sverrisson <heimir.sverrisson@gmail.com>, Dongcheng Yan
	<dongcheng.yan@intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Matthias Fend <matthias.fend@emfend.at>,
	Jim Lai <jim.lai@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH v8 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHcEqhpx/l81zIWB06AXueR9JPr3rR39lEy
Date: Thu, 28 Aug 2025 11:22:22 +0000
Message-ID:
 <PN3P287MB35194C03B3AEABDBDC2CD94CFF3BA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250821143126.319470-1-hardevsinh.palaniya@siliconsignals.io>
 <20250821143126.319470-3-hardevsinh.palaniya@siliconsignals.io>
In-Reply-To: <20250821143126.319470-3-hardevsinh.palaniya@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PNXP287MB3961:EE_
x-ms-office365-filtering-correlation-id: 93855512-ab98-4350-d41c-08dde62528ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?J1xChV7KKwbFeG7vLDmJ5XxiY1g4dP+GB3Pq1wBEhiBVMeCA34kvIOQ/?=
 =?Windows-1252?Q?ebnaMwij64F/JTRI8OY5Ie+VSHsLBdYzk5pC7676lXBdYGqnBVPA0uJI?=
 =?Windows-1252?Q?oDhka+6sNmJXck6cz68joo3ox8F7XAP1Py8dgV5LstNoSMR+pAIHBreh?=
 =?Windows-1252?Q?rrEqXNejDIfeRy4Dwn3ZB6qS2SRUq36lGZUg2TiMS4DtURO5PjQp5D5L?=
 =?Windows-1252?Q?WPWXvFOCBgqoyxxS72eJ9p0yN2MpW+O32DULwq+k04Ojh2sGeSWOovnu?=
 =?Windows-1252?Q?kGkyhLbHKCtPpPuEFZMx+js3V7gxUu3xNnO85XubJuSinKR0KRoWz+Wa?=
 =?Windows-1252?Q?Xvw0Vo3nITEGzzbzMqB9Veor2VbZvoAvBaNO5AOE5TUZf8JrPYUL+lIa?=
 =?Windows-1252?Q?sKsnlzO7CmDPj0hLACMcEru7on8TqKF8KI1p1ZFzE07+zKiHV877KG0Q?=
 =?Windows-1252?Q?JnPkSDRv2pMHM0hzpyVQSj3xzv8BpMAv0FF8hv03n/DFqq2IxvQOuc55?=
 =?Windows-1252?Q?0JUaUHq3Gg/zQ+5x3sBQRyYTBTiNhOQ+V9ELlcg4WaEdfvzwMUIaaHYE?=
 =?Windows-1252?Q?8PDbXl8BFADd0G+3JxVyV9k9cRbi23hX/blATsaXO2uw0JPnrtLIjZgi?=
 =?Windows-1252?Q?Y7WirPkY5z94TyxM1wmCnCZwBBqEA/Zjt1nAEnONc1VCrmDt0jBilmhJ?=
 =?Windows-1252?Q?EZluUtU9vm3cS7fHWMEUXuYh1Jj+oJ+0sj5Lg0VsbbBAY7waT9td4ovX?=
 =?Windows-1252?Q?jOvT+Fnj+nWL0GrCCwQdwyqbkj9GKYIsJYTL/olDl8BTCbJXCwhOuR9G?=
 =?Windows-1252?Q?lpWDhJddjvN2kjh6t8hWaSpTXzFhm0J8qP3xAzGECRR0ew/vmiJ3Tgqk?=
 =?Windows-1252?Q?PtzEMzPJs3FUdMfjJ23wIcTKda7uTSl2T1w4onB2CnMADr5eBjvLCcWH?=
 =?Windows-1252?Q?4AH1EyMYP1svjk4vAFmjXZtqkzpoup49TVpfWr8yhWYXCysKvVJde3g6?=
 =?Windows-1252?Q?GhHXY9cy7xjCJsTLz5cBbdGTA62WrbQdcdzxwyc057Y73jHg6KoUXTQL?=
 =?Windows-1252?Q?Bkdj5xM2iK/YSzT7jjl2zW9BFRDpVM8hXloqjMEi1TfANA6V1mSrhQ20?=
 =?Windows-1252?Q?MseqoETpWH6KaOkoW+DLbIv1Nv3wyaWHmBBxe7cZkJ1yw6z0aG29ACmm?=
 =?Windows-1252?Q?aVqDfdqWE66GP1C/XM+3xlccebnvkWl7foHL7sF1L1iqouwdiEBxxWcc?=
 =?Windows-1252?Q?T+gAWAdjHw/Rz5cnV1jgXOBJBiul9zUESg6odLFAHmY9tWUooh/YjJoN?=
 =?Windows-1252?Q?5zYYNB1u1tqE3SE062xJ5iPJA7cfSXw0VVGtzFkdgwMucHa3MhVDI3Id?=
 =?Windows-1252?Q?sa7zMaB9OwNC9TSTbfj3gbTSuZmNLjXYf+xPA047P4q/hZEyBmrTE1UY?=
 =?Windows-1252?Q?niMQmhEhaqyjHs3gwLzP7j5Jcb6BfkrYKUK8rQJeZhoTa7lVeNdbSV5b?=
 =?Windows-1252?Q?Y1jEjfOD9OGQeKdsDnHs5IxYr0ZUFPE9vJst9v6ta+ATUMO4o4QqaiDl?=
 =?Windows-1252?Q?DfnEiqpzV0OCj4HkLP9aDBPtfmHimXG2OVX10w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?AwBIQ7UJsIiChakHtdKebwMjuSsCC+KzBm93tr1AQfMNR4h3R4Ik43T2?=
 =?Windows-1252?Q?KpBXHR3WvNF2ZTcDnCqjb2rt6C8XC/dr+2ZzyK3gjJwS3S6kCgsxd4wH?=
 =?Windows-1252?Q?STzWQHR99fW94hzUiwZvfxZXTtcsJBuDlxl8dXZBWgMhdiswzoKJ+djQ?=
 =?Windows-1252?Q?JfMR9idOCCtN+gMsG26MD362zAsJy26aM8IeBNFGpldZWLUFEMT84bJC?=
 =?Windows-1252?Q?aDxdaVoMBbLZttyqNVSyYEzTQivdRAXV6Kzp2lKL16gBNCGRR/qUNUcT?=
 =?Windows-1252?Q?98FCvRJ9kH98qphJU/7aRCmXuBkZQPsZ62E5OVPgJcTCb+7ChKI6pDNG?=
 =?Windows-1252?Q?9HXyPfbQhl02to/oysuknVIRh2dxPAn6dMmPSZVdOfrZCkn54TqtifIM?=
 =?Windows-1252?Q?ycmkCKDjxkpK/mVAfXWNwFKy/AT9Kh3a6Z7fdAGJyy711ANLZf5TpbPL?=
 =?Windows-1252?Q?8GjWQCZnikEZrY4qFg4t6ACkhTRR86vnAoBneAdOlzugRz7K9ZaCY0Y9?=
 =?Windows-1252?Q?cDDZI/BFCAvrCKEb5ZwOyd+WbN1W+b7iSQXhikZ/czSXnNk62csrOi/v?=
 =?Windows-1252?Q?1nZOB/30w6m5/1Wf2v0I6IUp07/aKqOF7D1ZwbYVodQnt7skWBVPuTj6?=
 =?Windows-1252?Q?txHUeTm0w2FfUpPmwyVVmKvNd1jWz1gLAq7XOzhWnraroyHSOOFn7kPb?=
 =?Windows-1252?Q?78nn4s1FVTSdHeamm6jxO74CFY8DuB6K26TgOG8M7vNHLReG1Oq3Y7TN?=
 =?Windows-1252?Q?eZRyarWzT4dB672DalgKkgRBRw+YNnXC7JiixsVNKSA/D53JOadUjAMz?=
 =?Windows-1252?Q?QRBFwcHcNKzweQgq/p14xc66UqpxqbMWvGzvwfCCvY1Vz+lS0g3UyQyl?=
 =?Windows-1252?Q?LioesnX66VoduXcPs6Zw22xMnu93ghI+aZSvuswR3Z+ITMOHsnzXFPEJ?=
 =?Windows-1252?Q?pZd0NsPofuyra723o9CRsyK2L6KXrhUw7H4e6kLUUMxnaQU7Z93JbQ15?=
 =?Windows-1252?Q?wBKpDfPyVXqw5RG0GO2H7L73xT6g2r922eEC7uEr6b4xU+qWKm4RoX+6?=
 =?Windows-1252?Q?nTaHHa9HECcPCcmcgs5EAVDIzazyixX9qHWQPE42vjJp+qH5gU3sqWyv?=
 =?Windows-1252?Q?hgt6Uj7q2Spf8XmBpRjHbbM1Yu/Cla5/seds3iSwT+lqpcFCDoOlVMBW?=
 =?Windows-1252?Q?t7mGQ4jGu9fi8kAfVOLGRvpdO4Iz4g0ljArtIJk24Mwp0m5CJbVy07cj?=
 =?Windows-1252?Q?Oi+MACFoMcd4WVSTfzuepiYI32eAvpgI590Msk7RK65n4OIm8omhoEOZ?=
 =?Windows-1252?Q?SGD2zD7sgd5DVsh1DDgNnT9k867Grzl5yCp0Oe7y5z+tgYS5IKuoUrig?=
 =?Windows-1252?Q?HcKp+dc2EizIHNymdtkTDrKjkB5lALFjb3Ly87BMWcIJ2WqCQ+cthyHT?=
 =?Windows-1252?Q?xs/1hGJI5eAJLFBrAY/gsQ6GXk68OKiLyOXNWHajRezAFgV14O3437u9?=
 =?Windows-1252?Q?gvRwHxjlmiRJgZnVH475FSaoKsEU/h4sKzR3Nz8QJQmo7GAmg5+xxZ2o?=
 =?Windows-1252?Q?BQ+20fsfiDDAEzPujuJQgVoUvUr/FqrWcI+CMc8i4bc1AVZrKxMRcNrf?=
 =?Windows-1252?Q?K3n1MIHtMeoybU6qhpIaRGeIOzevRbqDov3blLT7N2pHOrPocGYnHAVx?=
 =?Windows-1252?Q?aPLCvKUq1QS2souNz5EHai145NuXtKb9dUW1uCWmZ1GiAp9L8mvXtw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 93855512-ab98-4350-d41c-08dde62528ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 11:22:22.7897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJDV9yv4OhkE6zPZyfVGPR86TO1By7IYblqtAjiDOszrvCeY7PBP8Y0KYrX36LJwM2zgbft+XSUIbzsp3mIPjSyNFa5nTL2NokJnjVAyIWsCO+lQm14encqtWIuqilMQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB3961

Hi Sakari,=0A=
=A0=0A=
> Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.=0A=
>=0A=
> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an=0A=
> active array size of 1920 x 1080.=0A=
>=0A=
> The following features are supported:=0A=
> - Manual exposure an gain control support=0A=
> - vblank/hblank control support=0A=
> - Test pattern support control=0A=
> - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)=0A=
=A0=0A=
I=92m preparing to submit v9, incorporating Krzysztof=92s feedback.=0A=
=A0=0A=
Please let me know if any changes are needed for the driver,=A0=0A=
so I can address them in v9.=0A=
=A0=0A=
Best Regards,=0A=
Hardev=

